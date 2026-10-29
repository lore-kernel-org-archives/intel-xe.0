Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAF9606A31D
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 08:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RgJOPdKk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126ED10E74D;
	Thu, 29 Oct 2026 08:42:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C7C10E059
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 08:42:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1FEAC600DA;
 Thu, 29 Oct 2026 08:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A60391F01825;
 Thu, 29 Oct 2026 08:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793263330;
 bh=nIv9UUL720rGDVRvgeF6YVEuzih+tZTMzuKR6cLF49E=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=RgJOPdKkyavQUatgPV1DCpTVMnVeZeXbaEgi0ONoLSlWU0pnSPBP+AlCEfb3EunFs
 xb3ReHD3BAqs7QOpNoDfapjxiqH9Ecdz4VQKcDOBiau9wwqV+OQpSajSUIN/H+FCIy
 a1OkG2KVtbEKG9KA6gEYNAce8dp8AYZHd6VE27lwGcSCIq9TMvhSgCf0mEICeM/khN
 JvnXFRNBfrTB7ykarflqg5pxyAKfzMAhlV27+iPZk8hZ/w38sBBHvrJAUuES6vf90L
 NiU+RlKDMFU6K09R33Ts8WVpAnZLnJMckBf60KhDylB8gXLwmpl49XvoDz58HBWLxS
 r8wM4j3AeAdJA==
Message-ID: <sashiko-outbox-188984@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 10/10] drm/xe/xe_ras: Report correctable errors using
 SIGID
To: "Badal Nilawar" <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261029082752.1739281-22-badal.nilawar@intel.com>
References: <20261029082752.1739281-12-badal.nilawar@intel.com>
 <20261029082752.1739281-22-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 08:42:10 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/xe/ras: unrecognized log component for XE_RAS_COMP_RESERVED =
in ras_comp_to_log_comp()
--

commit 523a0553a8f4f634b0b558643739a2f201d23a02
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/xe_ras: Report correctable errors using SIGID

This commit replaces xe_warn() in xe_ras_counter_threshold_crossed() with
xe_log_from() to report RAS counter threshold crossings using hardware
SIGIDs and log components.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 58d3834345bc1..09b3c96042d5b 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
[ ... ]
> @@ -226,6 +228,12 @@ static int ras_status_to_errno(u32 status)
>  	}
>  }
> =20
> +static u16 ras_comp_to_log_comp(u8 component)
> +{
> +	return FIELD_PREP(XE_LOG_COMPONENT_CLASS_MASK, XE_LOG_COMPONENT_CLASS_H=
ARDWARE) |
> +	       FIELD_PREP(XE_LOG_COMPONENT_TYPE_MASK, component);
> +}
> +
>  static inline const char *sev_to_str(u8 severity)
>  {
>  	if (severity >=3D XE_RAS_SEV_MAX)
> @@ -714,8 +722,11 @@ void xe_ras_counter_threshold_crossed(struct xe_devi=
ce *xe,
>  		if (!ras_counter_is_valid(xe, &errors[id]))
>  			continue;
> =20
> -		xe_warn(xe, "[RAS]: %s %s detected\n",
> -			comp_to_str(component), sev_to_str(severity));
> +		xe_log_from(xe, ras_sev_to_cper_sev(severity),
> +			    ras_comp_to_hw_sigid(component),
> +			    ras_comp_to_log_comp(component),
> +			    &errors[id], sizeof(errors[id]),
> +			    "error detected\n");

[Severity: Medium]
What happens if the system controller reports a counter with component set
to XE_RAS_COMP_RESERVED (3)?

In drivers/gpu/drm/xe/xe_ras.c, ras_counter_is_valid() only checks the outer
bounds of component:

	if (!in_range(component, XE_RAS_COMP_NOT_SUPPORTED + 1, XE_RAS_COMP_MAX - =
1)) {
		xe_err(xe, "sysctrl: unexpected component %u\n", component);
		return false;
	}

This allows XE_RAS_COMP_RESERVED (3) to pass validation. While
ras_comp_to_hw_sigid() uses a switch statement that falls back to
XE_SIGID_HW for unhandled values, ras_comp_to_log_comp() unconditionally
encodes component into XE_LOG_COMPONENT_TYPE_MASK under
XE_LOG_COMPONENT_CLASS_HARDWARE.

Because hardware component 3 is reserved and omitted from
DEFINE_XE_LOG_HARDWARE_COMPONENTS in drivers/gpu/drm/xe/abi/xe_log_abi.h:

#define DEFINE_XE_LOG_HARDWARE_COMPONENTS(define) \
	define(HARDWARE, 1, DEVICE_MEMORY, DEVICE_MEMORY, "Device Memory")	\
	define(HARDWARE, 2, CORE_COMPUTE, CORE_COMPUTE, "Core Compute")		\
	/*     HARDWARE, 3, RESERVED */						\
	define(HARDWARE, 4, PCIE, PCIE, "PCIe Interface")			\
	define(HARDWARE, 5, FABRIC, FABRIC, "Fabric")				\
	define(HARDWARE, 6, SOC_INTERNAL, SOC_INTERNAL, "SoC Internal")		\

passing that encoded value to xe_log_from() will miss all cases in
log_component_prefix() and hit log_unknown_component_prefix() in
drivers/gpu/drm/xe/xe_log.c:

	WARN(IS_ENABLED(CONFIG_DRM_XE_DEBUG), "LOG: unrecognized component %u.%u\n=
", class, type);

Should ras_counter_is_valid() reject XE_RAS_COMP_RESERVED, or should
ras_comp_to_log_comp() handle unmapped components like
ras_comp_to_hw_sigid() does?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029082752.1739=
281-12-badal.nilawar@intel.com?part=3D10
