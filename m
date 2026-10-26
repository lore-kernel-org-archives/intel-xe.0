Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28380606A31B
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 10:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e7rXxWAh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA88F10EDB8;
	Mon, 26 Oct 2026 10:32:41 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0020910EDCA
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 10:32:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id AB1A543947;
 Mon, 26 Oct 2026 10:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693A31F031E0;
 Mon, 26 Oct 2026 10:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793010755;
 bh=Whu6wBex6RJqnH0JKcNYMiyrTn2cQQq0elvZlD8ZZGo=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=e7rXxWAhIqxsPC5nMOJI7y12vINIfHWRx0NoYucxHF1Iq8A2YNiz/f8PHfTvK8+Az
 pisuyP6ZAeQX8fggGzX0Qhi3KRi5RR08ldBYQ9fqxg7xdv52CHenM1fVvwZYnozVea
 XrG5gC84MTEymOjq+CyBTx8jfoAlCj2JuCz53k2CafQKN+alNDRd7izfQdjYM+5Umx
 3SYrA68K8fdPEXku2AFbbN18nVvbsJinrPjRYeX8cgkcRhHXeZWgHBCimE68nsVOaw
 nssBvF/HW/jlRJMtZyCU4r0LMXWoVX2lOgOXQmA6yABkwPDjrzbHgB2iD8Vn0GNDy+
 OyLcLvH4sjyHQ==
Message-ID: <sashiko-outbox-184957@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/9] drm/xe/xe_ras: Disable hw error worker when AER
 handling is in progress
To: "Riana Tauro" <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261026060459.771448-18-riana.tauro@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-18-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 10:32:35 +0000
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/xe: uninitialized hw_error_work disabled on VF in xe_pci_error=
_detected()
--

commit b14238c72b86ed2185123242102a8af0419bfeb1
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe/xe_ras: Disable hw error worker when AER handling is in progress

When an uncorrectable internal AER error occurs on a device with workaround
14028434957, this commit marks the RAS state as using the AER path and
flushes and disables the hardware error worker in xe_pci_error_detected().

> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pc=
i_error.c
> index 9bf0da3a3d152..b27f8a0f1b170 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c

[ ... ]

> @@ -67,6 +91,15 @@ static pci_ers_result_t xe_pci_error_detected(struct p=
ci_dev *pdev, pci_channel_
>  	if (xe_survivability_mode_is_boot_enabled(xe) || xe_wedged(xe))
>  		return PCI_ERS_RESULT_DISCONNECT;
> =20
> +	/*
> +	 * If non-fatal error processing is in progress when uncorrectable inte=
rnal error occurs,
> +	 * flush and disable the worker to prevent further processing, as a res=
et is imminent.
> +	 */
> +	if (XE_DEVICE_WA(xe, 14028434957) && is_aer_internal_error(pdev)) {
> +		xe_ras_set_aer_path(xe, true);
> +		xe_hw_error_work_disable(xe);
> +	}

[Severity: High]
Can this call xe_hw_error_work_disable() on an uninitialized tile->hw_error=
_work
when xe_pci_error_detected() runs on an SR-IOV VF?

On Crescent Island, SR-IOV is supported and workaround 14028434957 is
populated via xe_wa_process_device_oob() in xe_device_probe_early(), so
XE_DEVICE_WA(xe, 14028434957) evaluates to true on both PF and VF instances.

However, xe_hw_error_init() skips initializing tile->hw_error_work on VFs:

drivers/gpu/drm/xe/xe_hw_error.c:xe_hw_error_init()
	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
		return;

	for_each_tile(tile, xe, id)
		INIT_DELAYED_WORK(&tile->hw_error_work, hw_error_work);

When an uncorrectable internal error occurs on the upstream switch port,
pcie_do_recovery() walks subordinate devices under the bridge and invokes
xe_pci_error_detected() for bound VFs as well as the PF. Because
pci_upstream_bridge() resolves pci_physfn(dev) for VFs,
is_aer_internal_error() returns true on the VF too, and
xe_hw_error_work_disable() then calls disable_delayed_work_sync() on
uninitialized delayed_work structs:

drivers/gpu/drm/xe/xe_hw_error.c:xe_hw_error_work_disable()
	for_each_tile(tile, xe, id)
		disable_delayed_work_sync(&tile->hw_error_work);

Should this path check !IS_SRIOV_VF(xe) (or xe->info.has_sysctrl) before
disabling the worker?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026060459.7714=
48-11-riana.tauro@intel.com?part=3D7
