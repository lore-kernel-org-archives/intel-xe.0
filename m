Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D70606A327
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 18:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XPvtSJtB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E31410E6E3;
	Wed, 28 Oct 2026 18:32:03 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E0310E6E3
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 18:31:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 64DCF40966;
 Wed, 28 Oct 2026 18:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BCBC1F01828;
 Wed, 28 Oct 2026 18:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793212317;
 bh=N1U0x6pY97ZowCxvcVsG2P5sbZPATOjF7M3H+QCVysk=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=XPvtSJtBwjUJPxpb+ZdGC3vmvrlVGk2VV+lvndmsMXSXZpsCF5advNz/gvRKf/53U
 G6z8Vg/QkE73T2AI7w/eh3StIvStRM2pIhK3LAJOoxvaOFpqw0SaLP8+LZR8yUNwjm
 tPjHdD4Y1ZdtRzdQNsmGfjYhwJxnLqoMOYp4eqNVqMp0rSB4HVzbW5KXF16VZo9cCL
 iOmvd+F+z3FHEDCserTF0q2UUDVqcpMrMs3XD1uG+RmXu9XlmhT/tY9viv4bIJ2YwX
 fQbY6uTmdAVIGdStboArDpVBLadl67v1CM2SL2pQ9ll+hsf5bGfWP18awicv690b8/
 DZ4mZFAfxtv/g==
Message-ID: <sashiko-outbox-188293@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/5] drm/xe/xe_late_bind_fw: Add support to load
 Ocode firmware
To: "Badal Nilawar" <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261028181951.1093283-10-badal.nilawar@intel.com>
References: <20261028181951.1093283-7-badal.nilawar@intel.com>
 <20261028181951.1093283-10-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 18:31:56 +0000
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
- [Low] drm/xe: unreachable INTEL_LB_STATUS_IP_ERROR_START and missing stat=
us in xe_late_bind_parse_status()
--

commit 24b78786ca211ddb93b253dbb3bc2c006a8f78c6
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/xe_late_bind_fw: Add support to load Ocode firmware

This commit enables loading the Ocode firmware through the late binding
flow by querying the SDK API version from the System Controller mailbox
and verifying it against the firmware manifest. It also removes the 4K
payload size limit and expands the status string table in
xe_late_bind_parse_status().

> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe=
_late_bind_fw.c
> index 881a46abc4f51..39c47b743edc9 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
[ ... ]
> @@ -179,6 +188,34 @@ static const char *xe_late_bind_parse_status(uint32_=
t status)
>  		return "Invalid Payload";
>  	case INTEL_LB_STATUS_TIMEOUT:
>  		return "Timeout";
> +	case INTEL_LB_STATUS_INTERNAL_ERROR:
> +		return "Internal Error";
> +	case INTEL_LB_STATUS_INVALID_FPT_TABLE:
> +		return "Invalid FPT Table";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_VERIFICATION_ERROR:
> +		return "Signed Payload Verification Error";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_CPD:
> +		return "Signed Payload Invalid CPD";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_FW_VERSION_MISMATCH:
> +		return "Signed Payload FW Version Mismatch";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_MANIFEST:
> +		return "Signed Payload Invalid Manifest";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_HASH:
> +		return "Signed Payload Invalid Hash";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_BINDING_TYPE_MISMATCH:
> +		return "Signed Payload Binding type Mismatch";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_HANDLE_SVN_FAILED:
> +		return "Signed Payload Handle SVN Failed";
> +	case INTEL_LB_STATUS_DESTINATION_MBOX_FAILURE:
> +		return "Destination MBOX Failure";
> +	case INTEL_LB_STATUS_MISSING_LOADING_PATCH:
> +		return "Missing Loading Patch";
> +	case INTEL_LB_STATUS_INVALID_COMMAND:
> +		return "Invalid Command";
> +	case INTEL_LB_STATUS_INVALID_HECI_HEADER:
> +		return "Invalid HECI Header";
> +	case INTEL_LB_STATUS_IP_ERROR_START:
> +		return "IP Error Start";

[Severity: Low]
Can the INTEL_LB_STATUS_IP_ERROR_START case in xe_late_bind_parse_status()
ever be reached?

In include/drm/intel/intel_lb_mei_interface.h, enum intel_lb_status defines
INTEL_LB_STATUS_IP_ERROR_START as BIT(31):

	INTEL_LB_STATUS_TIMEOUT                              =3D 7,
	INTEL_LB_STATUS_BUFFER_TOO_SMALL                     =3D 8,
	INTEL_LB_STATUS_INTERNAL_ERROR                       =3D 9,
	...
	INTEL_LB_STATUS_IP_ERROR_START                       =3D BIT(31),

However, in drivers/gpu/drm/xe/xe_late_bind_fw.c, the sole caller
xe_late_bind_work() stores the return value of push_payload() in a signed
int and only invokes xe_late_bind_parse_status() when ret > 0:

	if (ret > 0)
		drm_err(&xe->drm, "Load %s firmware failed with err %d, %s\n",
			fw_id_to_name[lbfw->id], ret, xe_late_bind_parse_status(ret));
	else
		drm_err(&xe->drm, "Load %s firmware failed with err %d",
			fw_id_to_name[lbfw->id], ret);

Because BIT(31) is negative when stored in a signed 32-bit int, a failure
returning INTEL_LB_STATUS_IP_ERROR_START will take the else branch instead
of calling xe_late_bind_parse_status().

Also, should INTEL_LB_STATUS_BUFFER_TOO_SMALL (8), which sits between
INTEL_LB_STATUS_TIMEOUT (7) and INTEL_LB_STATUS_INTERNAL_ERROR (9) in
enum intel_lb_status, be included in this switch statement so it does not
fall through to "Unknown error"?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028181951.1093=
283-7-badal.nilawar@intel.com?part=3D3
