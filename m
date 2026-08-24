Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9801CC5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 19:11:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5968F10E0F5;
	Mon, 24 Aug 2026 19:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zzv//nkV";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8128510E0F5
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 19:11:25 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id AD8AC60120;
 Mon, 24 Aug 2026 19:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 468641F000E9;
 Mon, 24 Aug 2026 19:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787598684;
 bh=LJreTnkUETMfrh51gPdg/FjjOoynFHvDWmOHEW2RoLU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Zzv//nkVmUtbsUObmTcDIReE90KcM59Lfxuk/b7qkbwTZMOsLK0be9SJrgxU14dDP
 iJzW9iU+ormd1oMLd+Z96p4S/+083SU7MM/rusEfLd0T3Ehqbl2TQxaxm3hIFihUtV
 JKT56LRDBU6aBxrwMLQ7L5pbgakbDyXkLel63FvWeyoToOuJrqwH6jZYfNdiHwbCL4
 JOCHdxRTGO+9lQAwMn/O3vRhbORh8a20zYA/+xoC7c9Qm2doIIYqpv7kX4siTebl06
 /rwpGp0qJvyI6+JqwOpmHdAnOqKonebQOLZwQ4DBBQpYYXeMxOaRbDQZF7anc3DPZi
 Id6p1riV8xcxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/7] drm/xe/guc: Print register addresses in capture
 snapshot output
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260824184356.1960708-4-naresh.kumar.g@intel.com>
References: <20260824184356.1960708-1-naresh.kumar.g@intel.com>
 <20260824184356.1960708-4-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 19:11:23 +0000
Message-Id: <20260824191124.468641F000E9@smtp.kernel.org>
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
- [Medium] Incorrect register address calculation for 64-bit registers
- [Low] Format string type mismatch for size_t
--

--- Patch [3]: [PATCH v2 3/7] drm/xe/guc: Print register addresses in captu=
re snapshot output ---
commit baf33cc78a6f2c33ba405aaad2eb334575f207ed
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

drm/xe/guc: Print register addresses in capture snapshot output
   =20
This commit modifies the GuC capture snapshot output to include register
offsets alongside their names for both 32-bit and 64-bit registers.

> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_=
guc_capture.c
> index 82df19b304e17..324f25af3b0d0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1774,7 +1774,9 @@ snapshot_print_by_list_order(struct xe_hw_engine_sn=
apshot *snapshot, struct drm_
>  			XE_WARN_ON(!low32_ready);
>  			low32_ready =3D false;
> =20
> -			drm_printf(p, "\t%s: 0x%016llx\n", reg_desc->regname, value_qw);
> +			drm_printf(p, "\t%s (0x%lx): 0x%016llx\n", reg_desc->regname,
> +				   reg_desc->reg.addr - sizeof(u32),
> +				   value_qw);

[Severity: Medium]
Does this correctly calculate the base address for all 64-bit registers?

In the Intel Xe engine MMIO layout, the upper and lower 32-bit registers are
not always exactly 4 bytes apart.

For example, RING_ACTHD (lower 32-bit) is located at offset 0x74, while
RING_ACTHD_UDW (upper 32-bit) is at 0x5c. RING_BBADDR is at 0x140 and
RING_BBADDR_UDW is at 0x168.

By subtracting 4 from 0x5c, the output would incorrectly print 0x58 for ACT=
HD,
which is actually the address of RING_HWSTAM.

[Severity: Low]
Will this format string trigger a compiler warning on 32-bit platforms?

The expression reg_desc->reg.addr - sizeof(u32) subtracts a size_t from a u=
32,
promoting the result to size_t. The format string uses %lx, which expects an
unsigned long.

On 32-bit platforms (where the driver can be compile-tested), size_t is
typically unsigned int. Passing an unsigned int to %lx triggers a -Wformat
compiler warning, which could break builds using -Werror.

Should this use %zx for size_t, or explicitly cast the result to u32 and
use %x?

>  			break;
>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824184356.1960=
708-1-naresh.kumar.g@intel.com?part=3D3
