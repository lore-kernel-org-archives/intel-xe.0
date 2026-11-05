Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36602606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 09:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=laBrGNqp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FF011228F;
	Thu,  5 Nov 2026 09:22:00 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E425911228F
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 09:21:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0E34160F2A;
 Thu,  5 Nov 2026 09:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B232B1F00A15;
 Thu,  5 Nov 2026 09:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793870513;
 bh=iGYujhdspodxMGmwNHhytePjrxNFodKaTb/lfdFvkqc=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=laBrGNqpEWE8imCv9qgXhtaXtp7TNeVIcPjfs7EpW1nPaVaa7E2xnNiWlhyrxYlRt
 ZtU8rPp/qn7enPn8rcKDwmfkQIkjg9xFK/OVh/G+QssDBYTryrU6THmWATT94L7HCj
 mx5irE2mqopP/gXESVXvWFq45sl4uFwUVBkshiC6zI+EwACHv+a/m1Q9GNIOcbvaPo
 FkHylNidMDT2LmcgY6pzNl3YbtSmVz1i3C7zCuOcZTyQTc2lEFr4ul6PuPTkZDCZHt
 Qqhpzj5tkomrc2t2Gu6evFsl2LrQ+BSlDMNv5/givwkYOSH9YPXIoxqBUiJWOFTloS
 Wc8F0cjxr49ew==
Message-ID: <sashiko-outbox-198758@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] [CI] drm/i915/dmc: Test Xe3p_LPD DMC v2.44
To: "Dibin Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261105091559.1784255-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20261105091559.1784255-1-dibin.moolakadan.subrahmanian@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 09:21:53 +0000
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
- [High] drm/i915/dmc: hardcoded CI-only firmware path in XE3P_LPD_DMC_PATH
--

commit 6720c799eff7439b665b842fb4acf1ad6594772f
Author: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.=
com>

drm/i915/dmc: Test Xe3p_LPD DMC v2.44

This commit replaces the unversioned DMC_PATH(xe3p_lpd) macro in
XE3P_LPD_DMC_PATH with a hardcoded versioned firmware path for CI testing.

> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i=
915/display/intel_dmc.c
> index 56e831b2a8262..864b419098ac0 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -126,7 +126,7 @@ static bool dmc_firmware_param_disabled(struct intel_=
display *display)
>  #define DISPLAY_VER13_DMC_MAX_FW_SIZE	0x20000
>  #define DISPLAY_VER12_DMC_MAX_FW_SIZE	ICL_DMC_MAX_FW_SIZE
> =20
> -#define XE3P_LPD_DMC_PATH		DMC_PATH(xe3p_lpd)
> +#define XE3P_LPD_DMC_PATH		"i915/xe3p_lpd_dmc_ver2_44.bin"

[Severity: High]
As noted in the commit message, this is a temporary CI test patch and is not
intended to be merged.

All platforms from MTL onward use unversioned DMC firmware paths via
DMC_PATH(), as documented above DMC_LEGACY_PATH in
drivers/gpu/drm/i915/display/intel_dmc.c:

/*
 * New DMC additions should not use this. This is used solely to remain
 * compatible with systems that have not yet updated DMC blobs to use
 * unversioned file names.
 */

During driver probe on Xe3p_LPD (DISPLAY_VERx100(display) =3D=3D 3500),
intel_dmc_init() acquires the POWER_DOMAIN_INIT runtime PM reference via
intel_dmc_runtime_pm_get(), sets dmc->fw_path to XE3P_LPD_DMC_PATH via
dmc_firmware_default(), and schedules dmc_load_work_fn().

Because dmc_fallback_path() only provides a fallback for Alder Lake-P and
returns NULL on Xe3p_LPD, replacing DMC_PATH(xe3p_lpd) with
"i915/xe3p_lpd_dmc_ver2_44.bin" causes request_firmware() in
dmc_load_work_fn() to fail with -ENOENT on systems shipping the standard
unversioned "i915/xe3p_lpd_dmc.bin" linux-firmware blob:

drivers/gpu/drm/i915/display/intel_dmc.c:dmc_load_work_fn() {
	...
	if (err) {
		drm_notice(display->drm,
			   "Failed to load DMC firmware %s (%pe). Disabling runtime power manage=
ment.\n",
			   dmc->fw_path, ERR_PTR(err));
		drm_notice(display->drm, "DMC firmware homepage: %s",
			   INTEL_DMC_FIRMWARE_URL);
		return;
	}
	...
}

When this happens, dmc_load_work_fn() returns early without calling
intel_dmc_runtime_pm_put(), leaving the DMC unprogrammed and permanently
disabling display runtime power management. It also changes
MODULE_FIRMWARE(XE3P_LPD_DMC_PATH) so initramfs generators look for the
versioned filename instead of "i915/xe3p_lpd_dmc.bin".

Could CI pass the versioned firmware path via the dmc_firmware_path module
parameter (read by dmc_firmware_param()) instead of modifying
XE3P_LPD_DMC_PATH?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105091559.1784=
255-1-dibin.moolakadan.subrahmanian@intel.com?part=3D1
