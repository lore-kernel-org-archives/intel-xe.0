Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748FC606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 05:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VuYb9j6x
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA1810E3EA;
	Tue, 17 Nov 2026 05:52:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE02710E3EA;
 Tue, 17 Nov 2026 05:52:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5573B404FF;
 Tue, 17 Nov 2026 05:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3F71F000C4;
 Tue, 17 Nov 2026 05:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794894723;
 bh=c/+ql+BBJLvOnUfomhzg4DJ9oTrOHD00OcOBbk1sN7g=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=VuYb9j6xH0vB3hQd45yubFwQ98yP+MGcbvlNZdrRfQEPCvMMyIaNHO0hlHJaiLPre
 GEyFiSytyYTg1aZO8rNzG7lR773szyk9KelwmcFzermlSpvAkIfjSgZN24CoLh2l5B
 EuR7XxrolN3KfdDXgaWmwZo3PTAq/ogEhx7Y0rFDqceJOlUtpiIOOKNlAq4mW2t1/C
 PXYFzknZVzaF0JOdHTnuFI3Vmt/rzYa/lll+fLbDlh4W5LWSavalh5eZYbHVxaLJiN
 cQNwvodG9wsC9OX6TYXjpdH/fM8rl9Cy8CJJKlcwl+NEtCGVDwCBqYzerRMPb55AG8
 NQSQnH+I4gIIw==
Message-ID: <sashiko-outbox-218231@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [CI v2] drm/i915/dmc: Test Xe3p_LPD DMC v2.44
To: "Dibin Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261117054435.2400369-2-dibin.moolakadan.subrahmanian@intel.com>
References: <20261105091559.1784255-1-dibin.moolakadan.subrahmanian@intel.com>
 <20261117054435.2400369-2-dibin.moolakadan.subrahmanian@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 05:52:02 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] drm/i915/dmc: hardcoded CI-only firmware path in
  XE3P_LPD_DMC_PATH
--

commit ed909a746bf02d67d8c52eef0997ebf7ab5fd53b
Author: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.=
com>

drm/i915/dmc: Test Xe3p_LPD DMC v2.44

This commit replaces the default unversioned Xe3p_LPD firmware path macro
with a hardcoded path to version 2.44 for testing.

> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i=
915/display/intel_dmc.c
> index 6611765fd62c8..5b580044a028c 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -125,7 +125,7 @@ static bool dmc_firmware_param_disabled(struct intel_=
display *display)
>  #define DISPLAY_VER13_DMC_MAX_FW_SIZE	0x20000
>  #define DISPLAY_VER12_DMC_MAX_FW_SIZE	ICL_DMC_MAX_FW_SIZE
> =20
> -#define XE3P_LPD_DMC_PATH		DMC_PATH(xe3p_lpd)
> +#define XE3P_LPD_DMC_PATH		"i915/xe3p_lpd_dmc_ver2_44.bin"
>  MODULE_FIRMWARE(XE3P_LPD_DMC_PATH);

[Severity: High]
Does hardcoding a versioned firmware path here break default firmware
loading and initramfs packaging on Xe3p_LPD systems with standard
unversioned linux-firmware blobs?

During driver initialization on Xe3p_LPD, intel_dmc_init() acquires a
runtime power management wakeref via intel_dmc_runtime_pm_get(), selects
this path in dmc_firmware_default(), and schedules dmc_load_work_fn().
Because dmc_fallback_path() only provides a fallback for Alder Lake-P,
request_firmware() fails when the versioned file is absent and
dmc_load_work_fn() returns early without calling
intel_dmc_runtime_pm_put(), leaving the microcontroller unprogrammed and
display runtime power management permanently disabled.

A specific firmware blob can be tested without modifying the default path
by passing the dmc_firmware_path module parameter.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117054435.2400=
369-2-dibin.moolakadan.subrahmanian@intel.com?part=3D1
