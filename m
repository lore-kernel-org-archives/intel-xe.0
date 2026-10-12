Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE92DCA9ED5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 05:31:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8110C10E367;
	Mon, 12 Oct 2026 05:31:05 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775B810E367
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 05:30:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 6416460D93;
 Mon, 12 Oct 2026 05:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FC11F0089B;
 Mon, 12 Oct 2026 05:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791783058;
 bh=v+WrA5NCk3HnQCfqGT1waDuHi2Xzild4+TqeQvnl4XA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=FNTEPWQP0Xxn2WQwvFWDYKQ26nQJIWCk2RPanVKdr9DK48Kc5Y1CpZm1kNExIiwfG
 jfiuc3v716961PNMPp+dmFncy4/EqoJkbLMCM/Wh5vfXXgdnRwzEK/h3bS0rOd5NAd
 bAxOD2AoQ8ddt/HcIVD8PqHhwuUknk8XymSynU/rNe2H7VKY5u7vL1/Jf7WZmd/5de
 y2ryQkAS3/SQh1aWaWzLfeXcQnUC3r45M4yATqwCbEGhV202x923mlGHfJLc+FPTtu
 dJ0Mee8l8LQMLgwPj33BydGLm+86/S1ajQnMAqBiq1+BKM68W9DWt7xQSVPwblQc+m
 1orMitv+c4F1Q==
Message-ID: <sashiko-outbox-167671@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 12/12] drm/xe/vram: Report VRAM errors using
 structured xe_log API
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261012051823.2201360-13-dnyaneshwar.bhadane@intel.com>
References: <20261012051823.2201360-1-dnyaneshwar.bhadane@intel.com>
 <20261012051823.2201360-13-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 05:30:57 +0000
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
- [Low] xe: format string mismatch passing u64 pointer to %pa in xe_vram_pr=
obe
--

commit 0d8f1a8de9f08409f13227d2abe582e14cf48299
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: drm/xe/vram: Report VRAM errors using structured xe_log API

This commit replaces drm_err() and drm_info() with the structured
xe_log_err_fatal() and xe_log_info() macros using the VRAM component tag.

> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 73aef047eb386..772704dfe12fe 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c

[ ... ]

> @@ -343,8 +350,9 @@ int xe_vram_probe(struct xe_device *xe)
>  			return err;
> =20
>  		if (total_size > lmem_bar.io_size) {
> -			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
> -				 &total_size, &lmem_bar.io_size);
> +			xe_log_info(xe, VRAM,
> +				    "Total size %pa is larger than resource %pa\n",
> +				    &total_size, &lmem_bar.io_size);

[Severity: Low]
Does this format string mismatch cause truncation on 32-bit systems?

The %pa format specifier expects a pointer to phys_addr_t or
resource_size_t. However, total_size is declared as a u64 earlier in
xe_vram_probe().

On 32-bit systems where phys_addr_t is 32-bit, %pa will dereference the
pointer as a 32-bit integer. On little-endian systems, this prints a
truncated size, and on big-endian systems, it reads the upper 32 bits
(printing 0 for values under 4GB).

Since the GCC printf format checker does not catch custom %p pointer type
mismatches, should this log instead use %llx and pass total_size by value?

>  		}
> =20
>  		remain_io_size -=3D min_t(u64, tile->mem.vram->actual_physical_size, r=
emain_io_size);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012051823.2201=
360-1-dnyaneshwar.bhadane@intel.com?part=3D12
