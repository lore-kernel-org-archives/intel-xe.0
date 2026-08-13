Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBF3C5CFEB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 14:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1F610E054;
	Thu, 13 Aug 2026 14:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jn0Du9vO";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83C610E054
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 14:11:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D42C461895;
 Thu, 13 Aug 2026 14:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C3811F000E9;
 Thu, 13 Aug 2026 14:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786630306;
 bh=GH68b3XCqFCRlaClHva/3PRDlKG60wvG+mmJ1S6PZ9Y=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Jn0Du9vO8iWKW0gg3ejEKTqYUWo0nog6i7C/scdMSvQSDz1NRMG2/kI9et4sH1NMf
 RcEC8TN73JACASl9rGut0CzYqi6z2zp8EtvfkCM/wW8RNZoQXf0CdqaLKn3MAbhDAH
 m8Ev8BQGDdr3DAYAg3D7d7GQkmrtlREUXNtN4nO6GCFSXDreA0X9Grv6iEgg7aAY/7
 NqY9dpSduNm8aGtZHQ8j745wcA03ypTP8WbXBqIkbncmv0oSc815VvP5ppOjqoBhW6
 bv4Cue70e/jhJFhym+HsTeDmaTmgOsthSHaK0itHaJWBtBZfvd2dPrAbDsS/eQLcBo
 1Z17LIwzP1quw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] drm/xe/guc: Print register addresses in capture
 snapshot output
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260813133037.2912699-4-naresh.kumar.g@intel.com>
References: <20260813133037.2912699-1-naresh.kumar.g@intel.com>
 <20260813133037.2912699-4-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 14:11:46 +0000
Message-Id: <20260813141146.6C3811F000E9@smtp.kernel.org>
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
- [Medium] Mismatched MMIO offset printed for 64-bit registers.
--

--- Patch [3]: [PATCH 3/6] drm/xe/guc: Print register addresses in capture =
snapshot output ---
commit 4cd73ae81306dc6a8f6e5245b976fc6aed0e2134
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

drm/xe/guc: Print register addresses in capture snapshot output
   =20
This commit updates the GuC capture snapshot printing logic to include the
register's MMIO offset alongside its name and value. This makes the output
easier to cross-reference with hardware debug documentation.

> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_=
guc_capture.c
> index 82df19b304e17..368769857c9b8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1774,7 +1774,9 @@ snapshot_print_by_list_order(struct xe_hw_engine_sn=
apshot *snapshot, struct drm_
>  			XE_WARN_ON(!low32_ready);
>  			low32_ready =3D false;
> =20
> -			drm_printf(p, "\t%s: 0x%016llx\n", reg_desc->regname, value_qw);
> +			drm_printf(p, "\t%s (0x%x): 0x%016llx\n", reg_desc->regname,
> +				   reg_desc->reg.addr,
> +				   value_qw);

[Severity: Medium]
Will this print the MMIO offset of the upper 32-bit register (HI_DW) instead
of the base address (LOW_DW)?

In snapshot_print_by_list_order() in drivers/gpu/drm/xe/xe_guc_capture.c,
the REG_64BIT_HI_DW case is processing the second entry of a 64-bit register
pair. Because it uses reg_desc->reg.addr from the HI_DW descriptor, the
printed output pairs the combined 64-bit value with the offset of the upper
32-bit register.

Could this regression cause confusion when cross-referencing the offset with
hardware documentation, which typically expects the base offset for a 64-bit
register?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813133037.2912=
699-1-naresh.kumar.g@intel.com?part=3D3
