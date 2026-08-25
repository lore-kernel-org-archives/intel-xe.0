Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C345C61DB9
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 17:58:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356B910E16D;
	Tue, 25 Aug 2026 17:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X1m1aRf/";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B3610E16D
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 17:58:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 218B740B5A;
 Tue, 25 Aug 2026 17:58:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF7071F000E9;
 Tue, 25 Aug 2026 17:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787680737;
 bh=bERbGdAeNaJNq206kwFua3FQinW5QYiuUFi1vvLi6pw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=X1m1aRf/xlP4JvFxFVGKF63lgdlx54NsDq40Q6Fa+KRgX950tiQHrTdMHAX+0lZhS
 nmosrgclyAz3mCUEzLV+m1PTMjFjMnQf9d4T/0HcX/t9Vq6gVeSdUqUnpmr+FIBB8V
 Lkjeb1+JDTCl1z9haN4hDsb7cE5vbmcJo4W0Uszf5yL3BbAlsPdthin15bQf5JXs/l
 Mp8TbUGdwYqI6gXz9qKhO1w78qlJWA5TWAfLPAnlVq75MpSO/MTgL54yovBsyXgdhm
 M3CIdEUOHjCJSgPmg46KJCAeWqDVU5JijVWn1mPdWUYdEi6DEqj2jEDJRNYkFMH5HM
 YJXnR/fQqU8EA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/11] drm/xe/ras: Report device memory errors using
 SIGID
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260825175916.1103841-21-badal.nilawar@intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
 <20260825175916.1103841-21-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 17:58:56 +0000
Message-Id: <20260825175856.CF7071F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `xe_log_err` family of macros passes `ERR_PTR(err)` to the l=
ogging framework, which crashes when used with hardware component tags due =
to an unchecked cast.
--

commit 3a41849b5bfff0854c8490dfdd5d178d31641b09
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/ras: Report device memory errors using SIGID

This commit updates the device memory error handler to use the
xe_log_comp_info() helper instead of xe_info(). This allows reporting
these errors with the DEVICE_MEMORY hardware component tag.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index b4cdb5ec64915..172653be1b829 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -409,14 +409,17 @@ static u8 handle_device_memory_errors(struct xe_dev=
ice *xe, struct xe_ras_error_
>  	 */
>  	switch (info->category) {
>  	case XE_RAS_MEMORY_POISON:
> -		xe_info(xe, "[RAS]: Poison error detected\n");
> +		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter=
),
> +				 "Poison error detected\n");

[Severity: Medium]
Does introducing the DEVICE_MEMORY hardware tag expose a latent API trap in
the logging framework?

While this specific call passes a valid pointer (&arr->counter), the logging
macro family is documented to allow passing ERR_PTR(err) as the data
parameter.

If a developer later calls xe_log_err(any, DEVICE_MEMORY, err, ...), it
passes ERR_PTR(err) as the data parameter. This gets processed in
log_emit_cper():

drivers/gpu/drm/xe/xe_log.c:log_emit_cper() {
    ...
    if (is_hw_sigid(sigid))
        xe_emit_hardware_error_cper(pdev, cper_sev, sigid,
                                    (struct xe_ras_error_class *)data);
    ...
}

This blindly casts the data parameter to struct xe_ras_error_class *.
Then xe_emit_hardware_error_cper() checks if it is non-NULL but fails to ch=
eck
for an error pointer:

drivers/gpu/drm/xe/xe_ras.c:xe_emit_hardware_error_cper() {
    ...
    if (counter && !ras_counter_is_valid(xe, counter))
    ...
}

This leads to an invalid pointer dereference when ras_counter_is_valid()
accesses the severity field:

drivers/gpu/drm/xe/xe_ras.c:ras_counter_is_valid() {
    ...
    u8 severity =3D counter->common.severity;
    ...
}

Should an IS_ERR() check be added in log_emit_cper() or
xe_emit_hardware_error_cper() before dereferencing the pointer to prevent a
potential kernel crash?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825175916.1103=
841-13-badal.nilawar@intel.com?part=3D8
