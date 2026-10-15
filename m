Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38DFCC6B33
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 10:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F2310EB9C;
	Thu, 15 Oct 2026 10:05:29 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E1310EB9C
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 10:05:22 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 16BD260120;
 Thu, 15 Oct 2026 10:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A19E51F000C4;
 Thu, 15 Oct 2026 10:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792058721;
 bh=zVo2bQSrt6o5EugNNzTail8gGct4nwGkmXvK8O/XZ0E=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=ec2ZKCkLdlPosAsB2gZM9oSBxA5ZJ2Yf1t+cuyI9b+AQDPfSmv6CpyZZL35MNtBBR
 wN1TFftyfyhQ2a54zzna3CP5tKa4zJ4wxYFt4gMv5+/b4LffqHct8G6NiZ8V4NzRJt
 8C3E3wRO32V15g3+T2KmO53dXzhm6RVMFhFmWURBgy9228NcmN730WJkMNxXNOcRBV
 IAfGJlN1yun0V+fBXQH+wY3jyuqONUoq+qthB3m5kaCXsRtbdAyf3EfANHlSw1u3QD
 6lAQSyIlvIdFw44wFbkCOZCKWlUy08Dn0DFJjHmmZqcRoB5DTi6o4yip9dhgnVI+a2
 NBG/vILweQyLQ==
Message-ID: <sashiko-outbox-172627@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/xe: revamp hw reserved PAT index checking
To: "Matthew Auld" <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261015095516.403932-6-matthew.auld@intel.com>
References: <20261015095516.403932-4-matthew.auld@intel.com>
 <20261015095516.403932-6-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 10:05:19 +0000
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
- [Low] drm/xe: missing array_index_nospec for pat_index
--

commit c33d7dbef37f797548fdacd3eb5da040ca907442
Author: Matthew Auld <matthew.auld@intel.com>

drm/xe: revamp hw reserved PAT index checking

This commit replaces indirect checks of valid PAT indices with a direct
check of pat.valid. It also adds additional WARN_ON checks to ensure
coherency modes are valid.

> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 18e26f04169ab..d0dac1ebd4784 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
[ ... ]
>  u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
>  {
>  	WARN_ON(pat_index >=3D xe->pat.n_entries);
> +	WARN_ON(!xe->pat.table[pat_index].coh_mode ||
> +		xe->pat.table[pat_index].coh_mode > XE_COH_2WAY);
>  	return xe->pat.table[pat_index].coh_mode;
>  }

[Severity: Low]
Does this code leak information via a Spectre v1 side channel?

When handling the MADVISE ioctl with DRM_XE_MEM_RANGE_ATTR_PAT, the raw
user input args->pat_index.val is passed into check_pat_args_are_sane()
without being clamped by array_index_nospec():

xe_vm_madvise_ioctl()
  check_pat_args_are_sane(xe, &madvise_range, args->pat_index.val)
    xe_pat_index_get_coh_mode(xe, pat_index)

Under speculative execution, a user-controlled, out-of-bounds pat_index
could bypass the earlier bounds check in madvise_args_are_sane(). This
would cause xe_pat_index_get_coh_mode() to read out-of-bounds memory
when indexing xe->pat.table[pat_index]. The resulting coh_mode is then
used in branch conditions in check_pat_args_are_sane(), creating a
potential side channel.

Could args->pat_index.val be clamped with array_index_nospec() before
being passed to check_pat_args_are_sane(), or could the already-clamped
pat_index local variable be reused in xe_vm_madvise_ioctl()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015095516.4039=
32-4-matthew.auld@intel.com?part=3D2
