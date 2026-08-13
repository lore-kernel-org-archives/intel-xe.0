Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6C2C5AD5A
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 00:18:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCEBF10E47B;
	Thu, 13 Aug 2026 00:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mzcl9GCn";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0799810E47B
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 00:18:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 43453600AD;
 Thu, 13 Aug 2026 00:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF26C1F000E9;
 Thu, 13 Aug 2026 00:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786580285;
 bh=dAY3eLxBLdo6uur59AVjGwouA2Q2KHYAcAte9adsDAY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=mzcl9GCn/XwgUSlLI7uhpfamK33zXx5iSLfTODgj2GuR1i3K2Yh1uw0ke2Nv4TuGm
 IKeH7Rmm47FLRwD6VCJ7sOFaRfjg95zwlnjxx8frFe+BkYQBY7fLEMe/j1koPn2OGN
 u6J4VBqYeQEk2w+PFPshVOCYEhAhw30Lqz3iJHlWySyKeuekKhqLnZ/LyA2MOn4qwd
 hhb3a8IBwp8xeFsjmcvMaC/HyI4o5PybaYy0Oo4yzPbZ4ddFqIJpcZCQ8ws7WPe/u/
 snrqq49QSxkiuOA6cPykdN8PcUohRoQeRrWqmjQAXf1mRUGKFtk86sf4FfegTlANXq
 qIYbq50T5/1rQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] drm/xe/forcewake: enable configurable delayed
 forcewake release
To: "Zongyao Bai" <zongyao.bai@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260813000654.2712317-5-zongyao.bai@intel.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260813000654.2712317-1-zongyao.bai@intel.com>
 <20260813000654.2712317-5-zongyao.bai@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 00:18:04 +0000
Message-Id: <20260813001804.CF26C1F000E9@smtp.kernel.org>
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
- [Low] The function `query_engine_cycles` mixes goto-based error handling =
with scope-based cleanup macros.
--

--- Patch [4]: [PATCH v5 4/4] drm/xe/forcewake: enable configurable delayed=
 forcewake release ---
commit 7d3e5746e331fb4da88407a96b40b25e06abf763
Author: Zongyao Bai <zongyao.bai@intel.com>

drm/xe/forcewake: enable configurable delayed forcewake release

This commit introduces a configurable delayed forcewake release for
engine-cycle queries to avoid repeated wake and ACK cycles during bursts.
It adds a configfs attribute to control the hold interval before releasing
an idle forcewake domain.

> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -168,7 +168,7 @@ query_engine_cycles(struct xe_device *xe,
> =20
>  	fw_domain =3D xe_hw_engine_to_fw_domain(hwe);
> =20
> -	xe_with_force_wake(fw_ref, gt_to_fw(gt), fw_domain) {
> +	xe_with_force_wake_delay(fw_ref, gt_to_fw(gt), fw_domain) {
>  		if (!xe_force_wake_ref_has_domain(fw_ref.domains, fw_domain)) {
>  			err =3D -EIO;
>  			goto out;

[Severity: Low]
Does this code mix goto-based error handling with scope-based cleanup macro=
s?

According to the cleanup subsystem guidelines, the expectation is that usag=
e of
goto and cleanup helpers is never mixed in the same function.

The function query_engine_cycles() uses goto out; for manual drm_dev_exit()
cleanup while simultaneously using the xe_with_force_wake_delay() macro, wh=
ich
internally uses the scope-based CLASS() cleanup macro. While jumping out of=
 the
loop block correctly invokes the scope destructor here without causing a
double-free or resource leak, it violates the subsystem structural guidelin=
es
against mixing these cleanup styles.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813000654.2712=
317-1-zongyao.bai@intel.com?part=3D4
