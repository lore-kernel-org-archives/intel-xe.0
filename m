Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03214CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 15:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A7810F183;
	Mon, 12 Oct 2026 15:03:04 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCE610F183
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 15:02:58 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 32466600D4;
 Mon, 12 Oct 2026 15:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3CC81F0089B;
 Mon, 12 Oct 2026 15:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791817377;
 bh=BUl1JUPXzswCOVAdiPNFHW2KqSQO3LoUNu8fZYLd2fo=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=bpL8Cb5M5H2uRXKLnWnWQXc7T2SQRZK+lvNWolcyT944T48UdPTMiWIb53TdbMBlp
 mXWaozMTcL/k/IeDAsiv5FwRSBRI9yw4DxPn5WtBGsvs2supd/gS3++lH0DEDORR55
 x3K/jrOWvac1dJbMq3uo6UXINsUCK1bNyf0GC5YizEhJ6mAeg1lLKIQYuHdAr0LnYL
 J+FLBiJNU1ZsMb9WHb+IdOQ6YQMhRIjpPCYUCi24p2czB24xde/Jrx2eTLZKZ3RZHs
 8ry6h8DoqkNf+pEU+R5oi6Iq91ACvCr9I6fFPZXb+cEdtzcbOT93OOKMo13yBwtbkQ
 9KGyUMOqHVO3A==
Message-ID: <sashiko-outbox-168308@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/7] drm/xe: dump GAM page fault report registers in
 devcoredump
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261012145237.3788198-5-naresh.kumar.g@intel.com>
References: <20261012145237.3788198-1-naresh.kumar.g@intel.com>
 <20261012145237.3788198-5-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 15:02:57 +0000
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
- [High] NULL pointer dereference of q via q->gt when devcoredump is not ti=
ed to an exec queue
- [Medium] Premature release of forcewake for other_gt due to CLASS macro s=
coping
--

commit be0fac28379d0e5150a5b7bc7c0761e28bfdcbed
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

drm/xe: dump GAM page fault report registers in devcoredump

This commit adds the PAGE_FLTRPTQ_HEAD_GAMCTRL and PAGE_FLTRPTQ_TAIL_GAMCTRL
registers to the devcoredump snapshot. This state is intended to be availab=
le
during cleanup for post-mortem debugging.

> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_=
devcoredump.c
> index f4a22e46eda78..a2a3437ec2f62 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
[ ... ]
> @@ -602,6 +635,10 @@ static void devcoredump_snapshot(struct xe_devcoredu=
mp *coredump,
> =20
>  	ss->guc.log =3D xe_guc_log_snapshot_capture(&guc->log, true);
>  	ss->guc.ct =3D xe_guc_ct_snapshot_capture(&guc->ct);
> +	ss->gam_pf_report =3D xe_dbg_gt_snapshot_capture(q->gt,
> +						       other_gt,
> +						       XE_DBG_REGSET_GAM_PF,
> +						       XE_GT_TYPE_MAIN);

[Severity: High]
Can q be NULL here?

If a hardware hang is not tied to an exec queue (for example, a TLB
invalidation timeout triggering via xe_devcoredump_gt()), q is passed as NU=
LL.

Will unconditionally dereferencing q->gt here cause a NULL pointer derefere=
nce
and prevent the devcoredump from being created? Should the function use the=
 gt
parameter directly instead of q->gt?

[Severity: Medium]
Is the forcewake for other_gt still held when this register capture occurs?

Earlier in devcoredump_snapshot(), the forcewake for other_gt is acquired
using the CLASS(xe_force_wake, ...) macro inside an if (other_gt) { ... }
block. Because CLASS utilizes the C __attribute__((cleanup)) mechanism, the
forcewake is released as soon as that block ends.

Does this mean the new gam_pf_report capture runs after the forcewake has
already been dropped, potentially leading to hardware timeouts or reading
garbage data?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012145237.3788=
198-1-naresh.kumar.g@intel.com?part=3D4
