Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB1BC79FB9
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 09:20:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202CF10F3BB;
	Thu, 10 Sep 2026 09:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e8mJQWOp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA0310F3BB
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 09:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789032037; x=1820568037;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=o+My2V6AGxpPJ3gnfS8QhCLL62KpwOq5S9EUi01cx4Q=;
 b=e8mJQWOpICxlPaRrYjZYPXaWa/TeRVcZp1Lxw7anpHA0zhynfxV0Wgid
 uhe0XRfCG1BcOx0foOVjcMv4AP8F3TjLPc0z1HbmP5QyW5/FKPx7hbBGi
 gvqbVbgLxk2EuikAwiXKw9aiXuhJsDt8HJngbrkRvfxi+xZLRnITVaAVJ
 LvZeaEKCqsQto4wSO+9Fx2Se1ib1sU53pyQHZ6ef6Hm27CgeMRF7Bk8JX
 T5N+mo9UrQ6DaKCEQSjltMkDbJ1etSPDj4ovt8aNuvuxkP+N7gKrYIYmN
 kyNWHSDxmZE/enqGdNtCGNGoT7SQ7EPNnsxmnmHamyZYnmqsNgBr+1s0p Q==;
X-CSE-ConnectionGUID: /QrLd0wvRjqPSiZClGejqQ==
X-CSE-MsgGUID: RmGiaTdpT5KCF2NJZCNxfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99806693"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="99806693"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 02:20:36 -0700
X-CSE-ConnectionGUID: PohlQm8zQ52MJuSH4y8UcA==
X-CSE-MsgGUID: jsl7PBX5RiSXx8Wi2iI+VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="275352151"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 02:20:34 -0700
Date: Thu, 10 Sep 2026 11:20:30 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Sk Anirban <sk.anirban@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 srinivasa.adatrao@intel.com
Subject: Re: [PATCH] drm/xe/gt_throttle: Report power brake as a throttle
 reason on CRI
Message-ID: <aqJ2Xsl3KHGPhXaT@black.igk.intel.com>
References: <20260909114931.1039331-2-sk.anirban@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909114931.1039331-2-sk.anirban@intel.com>
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

On Wed, Sep 09, 2026 at 05:19:32PM +0530, Sk Anirban wrote:
> CRI defines bit 5 of the perf limit reasons register as a power brake
> (PWRBRK) indicator. Add PWRBRK_MASK and a reason_pwrbrk sysfs attribute
> for CRI in place of reason_ratl.

Fixes: 8578e6d0546c ("drm/xe/gt_throttle: Drop individual show functions")

> Signed-off-by: Sk Anirban <sk.anirban@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
