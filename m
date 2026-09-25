Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD453C9832A
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 23:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BAE10E086;
	Fri, 25 Sep 2026 23:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nz5S97Om";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A735B10E086
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 23:38:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id A489460136;
 Fri, 25 Sep 2026 23:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 399E01F000FF;
 Fri, 25 Sep 2026 23:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790379533;
 bh=L63ARQfX1WSc6QHGL32Gs/mC9XJBwTTxeSBQ/VZqXYk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=nz5S97OmBa5KLv4CYeAzabzSl18fO0a9qLnL2ipQBWVan5D9h7ItR/iSSN47oVz2a
 /CPwKTMHxppr4Fv/PDNjaOcM5yUFx9omhr+VaMcMy7rYJ9r3dCMB/T1yaITHp7d4tZ
 R7g+hHyhnXzrbzeXXeqAAzkoxjN/sIAt9M9fV03nmyUzFmKMlPKc1QyIb79nVZr3rQ
 4QuMpix23kQ01jWIijMY5ePzJtz367uG2wJlKdtVlvvLDje9wTDUW2gbYkFJzoF/t/
 oZHvcJNY2+093BWpcioSgo/e+aPLTZOpR86wnExirfmf4NK8QQMOW6CY1gY4OWdjWn
 IIYLnsXoW3L2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe: Implement print vfunc for page fault info logging
To: "Brian Nguyen" <brian3.nguyen@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260925232757.3456172-2-brian3.nguyen@intel.com>
References: <20260925232757.3456172-2-brian3.nguyen@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 23:38:52 +0000
Message-Id: <20260925233853.399E01F000FF@smtp.kernel.org>
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
- [Low] xe: log interleaving and redundant prefixes due to split print calls
--

commit 114cd7fd731f9ee67d8c36081ae1b0f44d9be562
Author: Brian Nguyen <brian3.nguyen@intel.com>

drm/xe: Implement print vfunc for page fault info logging

This commit adds a print vfunc to xe_pagefault_ops to let producer
backends log specific relevant debug info. This keeps the consumer
layer free of backend-specific formatting logic, with consumer-specific
prints handled separately.

> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pa=
gefault.c
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -607,35 +606,9 @@ static const char *xe_pagefault_error_to_str(enum xe=
_pagefault_error error)
> =20
>  static void xe_pagefault_print(struct xe_pagefault *pf)
>  {

[ ... ]

> -		   FIELD_GET(XE_PAGEFAULT_ENGINE_INSTANCE_MASK,
> -			     pf->consumer.engine_class_instance),
> -		   FIELD_GET(XE_PAGEFAULT_SRCID_MASK,
> -			     pf->consumer.id),
> +	xe_gt_assert(pf->gt, pf->producer.ops->print);
> +	pf->producer.ops->print(pf);
> +	xe_gt_info(pf->gt, "\tError: %s\n",
>  		   xe_pagefault_error_to_str(xe_pagefault_get_error(pf)));
>  }

[Severity: Low]
Does this split print call cause log interleaving and redundant prefixes?

Because the error string is now logged with a separate call to xe_gt_info()
in xe_pagefault_print(), it will be printed as an isolated log entry with
its own prefix, rather than forming a continuous atomic block with the fault
details from the producer print vfunc.

This disrupts the formatting of the page fault debug info, introducing
redundant logging prefixes in the middle of what used to be a single
continuous multiline log block. It also creates a risk of concurrent kernel
messages interleaving with the output.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925232757.3456=
172-2-brian3.nguyen@intel.com?part=3D1
