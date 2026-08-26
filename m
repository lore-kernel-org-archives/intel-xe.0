Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57118C61DC2
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 14:12:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FA110E211;
	Wed, 26 Aug 2026 14:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nFKnWyri";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE6310E211
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 14:12:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E999E43DD0;
 Wed, 26 Aug 2026 14:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B68561F000E9;
 Wed, 26 Aug 2026 14:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787753537;
 bh=xk+8256nEsiaoUQxu4f7mGkXido3hCop9yCNR7Wmylk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=nFKnWyriKSHoguSN+XQw5oS2wrMQsuPFf0mRm7SBJXboBYDaeKDZ5ZBddtsoAPXDe
 bQ4rYqVcZZnSfZZCQlmJipwO9EfnARop0maNryIIG6sRfGyvhYdDajOg3UcdSqiy2+
 UAn/KRXyn8+8+/K1rbfa/JiHLBa7CPp7hE+pvwkIyFnXP0BJpJzf2nQkBi9sMkqX15
 MlD7WHg57nELfWX0JUqbqZknosOtyXOTnLlfa1+2aly2e8GAmSrJxLPme6PtIETEcJ
 O4H+TLgo983R0YOWf71j30fL/HFIcUhk0vKC9vBkQuI6HjzH2RjaqzfkF3VwiM8ikD
 38z3gvzxaDBaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V18 05/14] drm/xe: Guard teardown paths against purged BOs
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260826135136.204044-21-tejas.upadhyay@intel.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-21-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 14:12:17 +0000
Message-Id: <20260826141217.B68561F000E9@smtp.kernel.org>
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
- [Medium] Missing xe_bo_is_purged() guard in PSMI teardown path causes xe_=
assert warnings on purged BOs.
--

commit b5b060f35b87d3363b29c5356982c12efa65fab5
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe: Guard teardown paths against purged BOs

This commit adds guards to prevent unpinning or mapping buffer objects that
have already been purged by VRAM page offlining in multiple teardown paths.

> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index eede678ad303a..dfcd0e57073be 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -364,7 +364,8 @@ static inline void xe_bo_unpin_map_no_vm(struct xe_bo=
 *bo)
>  {
>  	if (likely(bo)) {
>  		xe_bo_lock(bo, false);
> -		xe_bo_unpin(bo);
> +		if (!xe_bo_is_purged(bo))
> +			xe_bo_unpin(bo);
>  		xe_bo_unlock(bo);

[Severity: Medium]
Does the PSMI teardown path in psmi_free_object() also need this guard?

Looking at drivers/gpu/drm/xe/xe_psmi.c, psmi_free_object() unpins the
capture BO without checking if it was purged:

drivers/gpu/drm/xe/xe_psmi.c:psmi_free_object() {
        ...
        xe_bo_lock(bo, NULL);
        xe_bo_unpin(bo);
        xe_bo_unlock(bo);
        ...
}

If the PSMI capture buffer is allocated, it is pinned in VRAM and tagged wi=
th
the XE_BO_FLAG_PINNED_LATE_RESTORE flag. If a VRAM page offline fault occur=
s,
xe_ttm_vram_reserve_page_at_addr() will successfully purge and unpin the BO
because the LATE_RESTORE flag explicitly bypasses the system reset check.

Later, when PSMI is disabled or resized, psmi_cleanup() calls
psmi_free_object(), which directly calls xe_bo_unpin() without checking
xe_bo_is_purged(). Calling xe_bo_unpin() on a BO with a 0 pin count triggers
xe_assert(xe, xe_bo_is_pinned(bo)) in Xe and a WARN_ON_ONCE in the TTM core.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826135136.2040=
44-16-tejas.upadhyay@intel.com?part=3D5
