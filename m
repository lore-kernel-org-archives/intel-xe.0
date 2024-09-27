Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CFDCEBF8E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 10:24:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7705E10ECB4;
	Fri, 27 Sep 2024 10:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="axEyR58p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF80A10ECB4;
 Fri, 27 Sep 2024 10:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727432641; x=1758968641;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=kM9LbBe7u+SpxPVPzb8YOlWKUhdut5jz5T11stvC7Zs=;
 b=axEyR58ptDgZyoO3/wJMmXteWPj2klDZQIIHi/RnLvT7t3Lsjlfae0px
 hTIfCxkDR4OuOaq4p5heBm6YRrSPg2duXhAHCK16Xwvtj7NdHDPmSDlwd
 dyKRB4y8e2Qq8k2/ztiHMz9S+fM11QS0yHxtpaU0XShwoCyftXq70cCZ8
 NvOAterT8zMIIbomLNw4WJc4ta3Y4IfMGJZBxWhzUVNngyz8/4J764TSw
 MVBum6paVbWoJb84skZkH6I6W8CeAcTbOnNR63NMZirntB07Hdq0Rs1zZ
 1j8rgX3LGXcyAVy4LKGKK9lR8NFkh2RLGePem9bT9Ow3NXRjC42+jXxJi w==;
X-CSE-ConnectionGUID: wEo2DRhuRky2GE7wX2mdCw==
X-CSE-MsgGUID: 23+n0df9TYitB+zmS5qE1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26705660"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="26705660"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 03:24:01 -0700
X-CSE-ConnectionGUID: xwxN5PCvQcSlC365CmuVFw==
X-CSE-MsgGUID: 913TI322Rm+ZWpdnFj64YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="72082128"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.211])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 03:23:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: I915-ci-infra@lists.freedesktop.org, "Knop, Ryszard"
 <ryszard.knop@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97?= CI.checksparse: warning for drm/i915/irq:
 clean up irq reset/init macro hacks
In-Reply-To: <172738145312.1108589.15357483404401409005@2413ebb6fbb6>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1727369787.git.jani.nikula@intel.com>
 <172738145312.1108589.15357483404401409005@2413ebb6fbb6>
Date: Fri, 27 Sep 2024 13:23:53 +0300
Message-ID: <8734llz96u.fsf@intel.com>
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

On Thu, 26 Sep 2024, Patchwork <patchwork@emeril.freedesktop.org> wrote:
> + /root/linux/maintainer-tools/dim sparse --fast 9b28db71fdf6180b7f7f5f02a42372afa1815830
> /root/linux/maintainer-tools/dim: line 2068: sparse: command not found

sparse is missing.

BR,
Jani.


-- 
Jani Nikula, Intel
