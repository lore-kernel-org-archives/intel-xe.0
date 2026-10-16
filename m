Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED97CC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:34:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4972411263A;
	Fri, 16 Oct 2026 07:34:53 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E1111263A
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:34:46 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A612F43911;
 Fri, 16 Oct 2026 07:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74BF71F000C4;
 Fri, 16 Oct 2026 07:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792136086;
 bh=sx4q4gUyJFgctW9qKjnsa/BkgDsfu1fCAGF3rzYe57U=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Hoim5sZ4Qd4Jt5P4en1Z/hIJmG78TS7LxvcHShuM4yckVNzDqgATbwI4awkH+imvE
 3AhFPBEjsfqxa2Rme1ZgHCLq/I41zKNZ4bnFV+Gvouiy4GDyAolI2yuOa1m7N/oawa
 4+Z/6JP1AO0HJ1O2bJuw9RYbWqhiZXAVDixdBaCNeheCnEuKompYVu0yUBFC0B1UMG
 hzJ2w9i7mzwG8E1TSBh5o+jeGyEWC/OSJnl5djoTXlSiG+HCBC/7Ofr7kwGasrlc7/
 E69/tnDtp3AwF62nfsJsfuMD8WqI3ovKLZVs6dkuT6M1+SwNgK3zP6JvFGfaqH2V0Z
 sWWRbdq5sRAtw==
Message-ID: <sashiko-outbox-173935@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 8/9] drm/xe: Introduce xe_wedge
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261016072623.457392-9-raag.jadav@intel.com>
References: <20261016072623.457392-1-raag.jadav@intel.com>
 <20261016072623.457392-9-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 07:34:46 +0000
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
- [Low] drm/xe: missing lock in xe_wedge_set_mode() allows inconsistent sta=
te
--

commit 099845d336cfe3f2b49209afcef197ab88c425f6
Author: Raag Jadav <raag.jadav@intel.com>
Subject: drm/xe: Introduce xe_wedge

Consolidate wedging implementation into a dedicated xe_wedge component for
better maintainability. While at it, rename all wedge helpers to match with
component name.

> diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
> new file mode 100644
> index 0000000000000..2f35937c5e661
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_wedge.c

[ ... ]

> +int xe_wedge_set_mode(struct xe_device *xe, enum xe_wedged_mode mode)
> +{
> +	int ret;
> +
> +	ret =3D wedge_validate_mode(xe, mode);
> +	if (ret)
> +		return ret;
> +
> +	if (wedge_mode_needs_policy_update(xe, mode)) {
> +		ret =3D wedge_mode_set_reset_policy(xe, mode);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	xe->wedged.mode =3D mode;

[Severity: Low]
Can this sequence of updates lead to an inconsistent state if multiple thre=
ads
write to the wedged_mode debugfs node concurrently?

It looks like the multi-step update of the hardware reset policy and the
software mode tracking is not serialized by any lock in xe_wedge_set_mode().

If Thread A and Thread B concurrently write to the debugfs file:

Thread A checks wedge_mode_needs_policy_update() and proceeds to apply
the hardware settings.

Thread B checks and applies different settings.

Thread B writes its software state to xe->wedged.mode.

Thread A writes its software state to xe->wedged.mode.

Could the hardware reset policy become desynchronized from the software
state, potentially leading to lost hang recoveries or incorrect behavior?

> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016072623.4573=
92-1-raag.jadav@intel.com?part=3D8
