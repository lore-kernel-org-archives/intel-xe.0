Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAADC5DF7D
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 11:41:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B81610E1D3;
	Fri, 21 Aug 2026 11:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Gora8r4d";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A0010E1D3
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 11:41:41 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id CF9BE60008;
 Fri, 21 Aug 2026 11:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67AF61F000E9;
 Fri, 21 Aug 2026 11:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787312500;
 bh=AvsMg+y+3GCyBXZiDnqp1Y/aH4wj/pG6YfmzFKPsySA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Gora8r4dBrf58+dFXb/MvEW7SNQszrUnbBXKuKsYQ+Ua2CqCFwfCf4umwt9NC3YUC
 JTE5RVmydSQgSPKyPrKm8tV3t/hIUbnEYhmJsQvhtwdMqj0/iojzzrdU+QQl1yQTCH
 XuTfieF7QYQtraHr6LmOPPCdJjo4jXfQ1Xv8RUb+V7Ih5zOXF085eD+L+6oNifPCVw
 8zIaydstIGIJj+OSqz1DiMPau0sl8rRGOvsIdwv8RxblQHVSgorcAERpuhXTKEXmGA
 m8vIOTXmRlrf7yTOJaMDH3+JmkKyKm71CvU2P8Qj+p3HpMfaBcdCUbz4Hqs/h7+SQq
 zdvctQSqUKoTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 01/10] drm/xe/uc_fw: Allow re-initializing firmware
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260821112436.545405-2-raag.jadav@intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
 <20260821112436.545405-2-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 11:41:39 +0000
Message-Id: <20260821114140.67AF61F000E9@smtp.kernel.org>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] xe_uc_fw_reinit() lacks an IS_SRIOV_VF() check, causing VF firmwar=
e state corruption and potential NULL pointer dereference.

Pre-existing issues:
- [High] Integer overflow in parse_gsc_layout() leads to out-of-bounds read=
 and potential kernel panic.
--

--- Patch [1]: [PATCH v10 01/10] drm/xe/uc_fw: Allow re-initializing firmwa=
re ---
commit 0789aa0c08f22f9ec32c3de1bbde4b80f0984ba2
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/uc_fw: Allow re-initializing firmware

This commit introduces xe_uc_fw_reinit() to support re-initializing
firmware without reloading the driver. It copies the firmware back
to its buffer object and marks it as loadable after events like
PCIe FLR.

> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
[ ... ]
> +/**
> + * xe_uc_fw_reinit() - Re-initialize uC firmware into its bo
> + * @uc_fw: uC firmware
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_uc_fw_reinit(struct xe_uc_fw *uc_fw)
> +{
> +	struct xe_device *xe =3D uc_fw_to_xe(uc_fw);
> +	struct xe_uc_fw_version old_fw, new_fw;
> +	const struct firmware *fw =3D NULL;
> +	int err;
> +
> +	/* Make sure the status was cleared the last time we reset the uc */
> +	xe_assert(xe, !xe_uc_fw_is_loaded(uc_fw));
> +
> +	/* We shouldn't be here for the firmware which wasn't available */
> +	if (!xe_uc_fw_is_available(uc_fw))
> +		return -ENOEXEC;

[Severity: High]
Does this code safely handle SR-IOV Virtual Functions (VFs)?

On VFs, firmware loading is handled by the PF, so the VF initializes its
firmware state with the dummy path "Loaded by PF" and skips allocating
uc_fw->bo. Since the VF reaches the XE_UC_FIRMWARE_PRELOADED status, the
xe_uc_fw_is_available() check above will pass.

Because there is no IS_SRIOV_VF() check here, this proceeds to request
the dummy firmware path. If that request fails, the VF's status is
incorrectly overwritten to XE_UC_FIRMWARE_INIT_FAIL.

If a file named "Loaded by PF" actually exists, the code proceeds to call
uc_fw_reinit():

drivers/gpu/drm/xe/xe_uc_fw.c:uc_fw_reinit() {
    ...
    xe_map_memcpy_to(xe, &uc_fw->bo->vmap, 0, data, uc_fw->size);
    ...
}

Since uc_fw->bo is NULL on VFs, will this lead to a NULL pointer
dereference?

> +
> +	old_fw =3D uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
> +
> +	err =3D firmware_request_nowarn(&fw, uc_fw->path, xe->drm.dev);
> +	if (err)
> +		goto init_fail;
> +
> +	err =3D parse_headers(uc_fw, fw);

[Severity: High]
This isn't a bug introduced by this patch, but could the firmware parsing
called here be vulnerable to an integer overflow?

Inside parse_headers(), when handling GSC firmware, it calls
parse_gsc_layout() which performs the following bounds check:

drivers/gpu/drm/xe/xe_uc_fw.c:parse_gsc_layout() {
    ...
    min_size =3D layout->boot1.offset + layout->boot1.size;
    if (size < min_size) {
        ...
        return -ENODATA;
    }
    ...
    bpdt_header =3D data + layout->boot1.offset;
    if (bpdt_header->signature !=3D GSC_BPDT_HEADER_SIGNATURE) {
    ...
}

Since both layout->boot1.offset and layout->boot1.size are 32-bit
unsigned integers, can a crafted firmware cause their sum to wrap around?

If they wrap before being assigned to the 64-bit min_size, the bounds
check would be bypassed, potentially resulting in an out-of-bounds read
when dereferencing bpdt_header->signature.

> +	if (err)
> +		goto restore_old;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821112436.5454=
05-1-raag.jadav@intel.com?part=3D1
