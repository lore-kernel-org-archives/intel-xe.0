Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E49FD9E26
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 01:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D234310EA18;
	Fri, 27 Feb 2026 01:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cdEqipZE";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5047F10EA18
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 01:16:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 702B660008;
 Fri, 27 Feb 2026 01:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE63C116C6;
 Fri, 27 Feb 2026 01:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772155002;
 bh=5HJRJxrZpzW1y3OSKHSC1Ivqwg7HYWWwkkt445uVkrU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cdEqipZEUsguWmcZBds7jFyHrYiImUUGw080GNACq601mJnZM7GA60SP3w/LRsbUX
 cpumvQVW9+e8LBdWoF83e8DlyqE6Sa6Ix84uEeIrt0pv2VQclJgGRDfPspvN/tm7fa
 3QudXw0R+lbjYI5qJHVhsqMtVDCzhpcEKRspj7xkj/B/0YLFGs3k+YCk7sABWfLHxW
 bPcDfIulC5sO7TyLmyeHtiO+NEhlbZR3YDqORxSkFyZGMR2FAAbTSjye9kbx+iHc3B
 Y1pCPRgYcAu0mpTzoVGAvGAWXjLN4YR2eZyPuemq8ebCt3XFIWwP2+nb692urhON6a
 vapoqDsA0BnSw==
Date: Thu, 26 Feb 2026 18:16:39 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v2 06/10] drm/xe/tests: Add KUnit tests for new VRAM fair
 provisioning
Message-ID: <20260227011639.GA1683727@ax162>
References: <20260218205553.3561-1-michal.wajdeczko@intel.com>
 <20260218205553.3561-7-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218205553.3561-7-michal.wajdeczko@intel.com>
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

Hi Michal,

On Wed, Feb 18, 2026 at 09:55:48PM +0100, Michal Wajdeczko wrote:
...
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> index 3889dc3e49ca..305dbd4e5d1a 100644
> --- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> @@ -11,6 +11,7 @@
>  #include "xe_pci_test.h"
>  
>  #define TEST_MAX_VFS	63
> +#define TEST_VRAM	0x37a800000ull
...
> @@ -50,6 +64,19 @@ static int pf_gt_config_test_init(struct kunit *test)
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
>  	test->priv = gt;
>  
> +	/* pretend it has some VRAM */
> +	KUNIT_ASSERT_TRUE(test, IS_DGFX(xe));
> +	vram = kunit_kzalloc(test, sizeof(*vram), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vram);
> +	vram->usable_size = TEST_VRAM;

FWIW, this causes warnings for a 32-bit resource_size_t:

  $ make -skj"$(nproc)" ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- mrproper allyesconfig drivers/gpu/drm/xe/xe_gt_sriov_pf_config.o
  In file included from drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:3329:
  drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c: In function 'pf_gt_config_test_init':
  drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:14:25: error: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '14940110848' to '2055208960' [-Werror=overflow]
     14 | #define TEST_VRAM       0x37a800000ull
        |                         ^~~~~~~~~~~~~~
  drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:71:29: note: in expansion of macro 'TEST_VRAM'
     71 |         vram->usable_size = TEST_VRAM;
        |                             ^~~~~~~~~
  cc1: all warnings being treated as errors

Cheers,
Nathan
