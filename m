Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CFDC369C5
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 13:15:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1A110E906;
	Wed, 16 Apr 2025 13:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.b="LD/judjo";
	dkim-atps=neutral
X-Greylist: delayed 160971 seconds by postgrey-1.36 at gabe;
 Mon, 14 Apr 2025 18:50:24 UTC
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 759A610E274
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Apr 2025 18:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1744656621; x=1744915821;
 bh=ag3TVWkvjVATwgIUVdHp3LIVbUfvKasQNqDlfMq0R68=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=LD/judjoTz0Pc7dzcKNOdX7yVIsYHkX6gEwYPHDxriL0MBAx7qFuhvSXZruGGGjOd
 9YVvq3oRmxJPTcUu22Ci7yEGm5VyqVyAtn0597Mmernrx41zj9MZ9MjUrhBGKspkch
 HEWc2bx/yyE11jQDcOTUSyOywKB1I/Lu3BoYUU0tq9QrK2ZeVuCXtXVhXDQMDOtdKX
 Gn/Z+ONjsk+kXJUeMlk6bOwK0pTgBK5ySzcG4iDfdjQgyTRh0sDcDvu+/fuXX5neqn
 xWvvCdUaLowFHbYPNEbaJ+aRBWhvwREKWjKxw2/yJnSIke+PTPZgp+18lzXaZP5HFD
 1CQGXsaHhjnHg==
Date: Mon, 14 Apr 2025 18:50:17 +0000
To: Lucas De Marchi <lucas.demarchi@intel.com>
From: Harry Austen <hpausten@protonmail.com>
Cc: intel-xe@lists.freedesktop.org, thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH] drm/xe: Allow building as kernel built-in
Message-ID: <D96L5JEAGCNH.2YVZSQT7AZ0Z8@protonmail.com>
In-Reply-To: <5ztkuw7ip5seoonhtnypq4wkpjnh3okq4fzdnbmmsiadt467fv@ar236dcnik6w>
References: <20250412220137.3892-2-hpausten@protonmail.com>
 <5ztkuw7ip5seoonhtnypq4wkpjnh3okq4fzdnbmmsiadt467fv@ar236dcnik6w>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: b50e4b98b5d119e30091922e533e92227066560a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 16 Apr 2025 13:15:56 +0000
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon Apr 14, 2025 at 5:00 PM BST, Lucas De Marchi wrote:
> On Sat, Apr 12, 2025 at 10:07:21PM +0000, Harry Austen wrote:
>>Fix Kconfig symbol dependency on KUNIT, which isn't actually required
>>for XE to be built-in. However, if KUNIT is enabled, it must be built-in
>>too.
>>
>>Fixes: 08987a8b6820 ("drm/xe: Fix build with KUNIT=3Dm")
>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>>Signed-off-by: Harry Austen <hpausten@protonmail.com>
>>---
>> drivers/gpu/drm/xe/Kconfig | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>>index 9bce047901b22..b65bd6b9e65d4 100644
>>--- a/drivers/gpu/drm/xe/Kconfig
>>+++ b/drivers/gpu/drm/xe/Kconfig
>>@@ -1,7 +1,7 @@
>> # SPDX-License-Identifier: GPL-2.0-only
>> config DRM_XE
>> =09tristate "Intel Xe Graphics"
>>-=09depends on DRM && PCI && MMU && (m || (y && KUNIT=3Dy))
>>+=09depends on DRM && PCI && MMU && (m || (y && KUNIT!=3Dm))
>> =09select INTERVAL_TREE
>> =09# we need shmfs for the swappable backing store, and in particular
>> =09# the shmem_readpage() which depends upon tmpfs
>>@@ -51,7 +51,7 @@ config DRM_XE
>>
>> config DRM_XE_DISPLAY
>> =09bool "Enable display support"
>>-=09depends on DRM_XE && DRM_XE=3Dm && HAS_IOPORT
>>+=09depends on DRM_XE && HAS_IOPORT
>
> this wouldn't work with i915 also built-in. Does it now?

Ah. Just gave this a go and it doesn't work, as you suggest. Perhaps I need
to change this to something like the following?:

depends on DRM_XE && (DRM_XE=3Dm || DRM_I915!=3Dy) && HAS_IOPORT

>
> Lucas De Marchi

Thanks for the review!
Harry

