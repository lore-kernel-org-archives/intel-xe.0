Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EEDC52D7C
	for <intel-xe@archiver.kernel.org>; Tue, 13 Aug 2024 09:12:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3860710E2C9;
	Tue, 13 Aug 2024 09:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XQPoaiF9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1F210E2C9
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Aug 2024 09:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723540359; x=1755076359;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Unk638GU1iv0zesHypmWNl+0m4u5TT8nrgnGj0ZKFys=;
 b=XQPoaiF9SFot6PLPh4gYv6ZUYQRbo0iUNJ1iMBtnlMdtZNaeZz0S7RaL
 G4uJNIugRikPgX6BenG27i9b36IaWgURsPu5xuuNECR21yggyMrjnxyiL
 6oqy9JkMPGVcbajxczHKQYUMnOdRgTGHQEsijp6pIT8QgIqoH8KmtxFCN
 PSE056GHLKDrBgSp0B8XijD589HO/vGVF83ThemxS+WQQU3hKkhBGIhYG
 n79wOm6sq3L2pOZ7fUIXU0hO97j4odpWrVgmcZoaM9jaASJIkCskqsFu6
 8WiZNK5mKtlMsBfDDzmlclfk1BvpFKn1aqmhfq2gapvFyZdoQd/+S+yU6 w==;
X-CSE-ConnectionGUID: S+DPkxxETz+ebghC07uEYQ==
X-CSE-MsgGUID: 9zAZnLcwTR6+p3yNB13xAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="25452991"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="25452991"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 02:12:38 -0700
X-CSE-ConnectionGUID: X2JzuaMLRmOtP+tnFcX4+Q==
X-CSE-MsgGUID: QwxpKaosS6yKRDbtKG8xVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="59173443"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.234])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 02:12:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH 0/3] drm/xe: drvdata cleanups
In-Reply-To: <cover.1723458544.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1723458544.git.jani.nikula@intel.com>
Date: Tue, 13 Aug 2024 12:12:34 +0300
Message-ID: <8734n823ct.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 12 Aug 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> The first patches from [1] just for xe, to be merged via drm-xe-next.

And pushed to drm-xe-next, thanks for the reviews.

BR,
Jani.

>
> BR,
> Jani.
>
> [1] https://patchwork.freedesktop.org/series/136621/ 
>
>
> Jani Nikula (3):
>   drm/xe/tests: remove unused leftover xe_call_for_each_device()
>   drm/xe: use pdev_to_xe_device() instead of pci_get_drvdata() directly
>   drm/xe: add kdev_to_xe_device() helper and use it
>
>  drivers/gpu/drm/xe/tests/xe_pci.c      | 52 --------------------------
>  drivers/gpu/drm/xe/tests/xe_pci_test.h |  1 -
>  drivers/gpu/drm/xe/xe_device.h         |  5 +++
>  drivers/gpu/drm/xe/xe_gsc_proxy.c      |  9 +----
>  drivers/gpu/drm/xe/xe_pci.c            |  2 +-
>  5 files changed, 8 insertions(+), 61 deletions(-)

-- 
Jani Nikula, Intel
