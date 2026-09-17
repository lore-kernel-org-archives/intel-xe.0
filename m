Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446D2C88E72
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 19:49:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAEA510E785;
	Thu, 17 Sep 2026 19:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IIJp9Djj";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FD310E785
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 19:48:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8ACED601EF;
 Thu, 17 Sep 2026 19:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1958F1F000FF;
 Thu, 17 Sep 2026 19:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789674538;
 bh=DXgpdCkBImJZqm9R76DSDyYlQAQI/s/AEClKo8w1DxQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=IIJp9Djj9cZE5+asUtqcJmny+pQVqt4rH82KnRfA+Yw1S2t6/mFr7laI1JZzkYzi8
 NEAvhGAa1uACgAncyZjVE670dhzEhmbrTL/t/xjWHTHZHAGtA7CUtEGjkhiz4AbDCw
 bMTEynMIVlktkg9nPL9yeSGE6/+l8kRvGIE2LzHYy8YT2wAOHZGslFYacD2qokhg+k
 12N7QsNGnyJ/hS79o4rsYGhu6Wm+xHZCtoTnu/x5/POD1lCILKDZ+wGKGEVBd5fxpX
 UP5w5fY7w3c0hLe3PtHk9vnNeFt4bO7aPwY8AfwtnaM42/OcMda6tRg67X/2GCCWZp
 1Ok31+4OvqDAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/xe: Add mnemonic error reason to page fault
 diagnostics
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260917193815.209362-1-matthew.brost@intel.com>
References: <20260917193815.209362-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 19:48:57 +0000
Message-Id: <20260917194858.1958F1F000FF@smtp.kernel.org>
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
- [Medium] drm/xe: stale pagefault error codes mask true failure reasons on=
 retries
--

commit 316fc8037f7fbbec7bf65ce4fb4107de7eac1d79
Author: Matthew Brost <matthew.brost@intel.com>
drm/xe: Add mnemonic error reason to page fault diagnostics

This patch adds enum xe_pagefault_error to encode failure reasons into the
reserved low bits of the page address. This allows xe_pagefault_print to
report a mnemonic failure reason.

> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pa=
gefault.c
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c

[ ... ]

> @@ -195,8 +203,10 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt,=
 struct xe_vma *vma,
>  						 needs_vram =3D=3D 1);
>  			drm_exec_retry_on_contention(&exec);
>  			xe_validation_retry_on_oom(&ctx, &err);
> -			if (err)
> +			if (err) {
> +				xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_VMA_VALIDATE);
>  				break;
> +			}

[Severity: Medium]
Does this leak the error state into subsequent retries if the failure is a
transient -EAGAIN?

If a transient failure occurs, xe_pagefault_set_error sets
XE_PAGEFAULT_ERROR_VMA_VALIDATE. When the outer loop retries, this error co=
de
remains attached to pf. If a later retry fails for a different reason, the
stale error code might mask the true failure reason.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c

[ ... ]

> @@ -1480,11 +1488,15 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, str=
uct xe_vma *vma,
>  		 * may have been split by xe_svm_range_set_default_attr.
>  		 */
>  		vma =3D xe_vm_find_vma_by_addr(vm, fault_addr);
> -		if (!vma)
> +		if (!vma) {
> +			xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_SVM_VMA_NOT_FOUND);
>  			return -EINVAL;
> +		}
> =20
>  		goto retry;
>  	}
> +	if (ret && xe_pagefault_get_error(pf) =3D=3D XE_PAGEFAULT_ERROR_NONE)
> +		xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_SVM_SERVICE_FAILED);
>  	return ret;
>  }

[Severity: Medium]
Can a previous transient error mask the true failure reason here?

For example, if __xe_svm_handle_pagefault encounters a transient -EAGAIN
failure during xe_svm_garbage_collector, it sets
XE_PAGEFAULT_ERROR_SVM_GARBAGE_COLLECTOR.

When the retry happens, if it subsequently fails at a different point (such
as getting pages) that relies on this fallback error assignment, the
condition evaluates to false because the error state is no longer
XE_PAGEFAULT_ERROR_NONE.

Would it be safer to clear the error state before retrying, or
unconditionally overwrite the fallback error here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917193815.2093=
62-1-matthew.brost@intel.com?part=3D1
