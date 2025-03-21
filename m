Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA78C36000
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 18:55:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF0910E821;
	Fri, 21 Mar 2025 18:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c72YvIFO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0B810E821
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Mar 2025 18:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742583302; x=1774119302;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1nPsva4uO8t9M9B5isNP46WzWLHhTxdTOoEQCsYuTVo=;
 b=c72YvIFOXViRQshPMEXJi5H3elyZxeBauM/KMYGI5w7FVbmMdP52hlzm
 iwQgYoANCRv1FzEAAYJTTuy19ZgiJuJ6NS63vKq4Ia36svd9dYz1aIxS2
 hEv4/LzFymqAJ89vWO2sXiH+rxDjt8lQHpJsfC/1T1+ffq6yJzai5vQXp
 ALVp3oE74WNkdm0mFAq28yP1DDGlhd07DJVf6gh7K9CU+Z5D/ZqII3Z5L
 P+lXNqAbK93/KWZFQ43ihVQ7YjxfI8TFcxZK8pmvcOOwwV7FCrAZb+VHc
 oug9M/Ayam1yQsD0Yto/HLijVR+9iAI/xlyo8ZOJ88OaCpvj9hj9vXsGS w==;
X-CSE-ConnectionGUID: Jcv+0XUDTraJDTzRgi0DTA==
X-CSE-MsgGUID: r2kz9N8MTQKVtxnC6a+8UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="55245584"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="55245584"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 11:54:54 -0700
X-CSE-ConnectionGUID: DV1+kTP4T4eTXUukOq5Ovg==
X-CSE-MsgGUID: X8FjPxq9Sqe3ciWxl0kahw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="124257431"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 11:54:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe <intel-xe@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v5 0/3] drm/xe: Fix survivability
Date: Fri, 21 Mar 2025 11:54:38 -0700
Message-ID: <174258325154.3444999.6968654145903035749.b4-ty@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314-fix-survivability-v5-0-fdb3559ea965@intel.com>
References: <20250314-fix-survivability-v5-0-fdb3559ea965@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Fri, 14 Mar 2025 06:54:25 -0700, Lucas De Marchi wrote:
> It turns out commit d40f275d96e8 ("drm/xe: Move survivability entirely
> to xe_pci") did a bad job moving things to xe_pci. The fix provided by
> Riana in 20250306055407.511405-1-riana.tauro@intel.com fixes it
> partially, but injecting a failure in xe_pcode_probe_early still causes
> the kernel to give warnings/errors.
> 
> Correct the course and better split what is done in xe_pci vs xe_device.
> This time, also add a patch to test we can handle errors in
> xe_pcode_probe_early().
> 
> [...]

Thanks for the reviews. Applied to drm-xe-next.

[1/3] drm/xe: Move survivability back to xe
      commit: 86b5e0dbba07438de91dd81095464c6c4aa7a372
[2/3] drm/xe: Set survivability mode before heci init
      commit: 14efa739ca70514e8b923a02b5bcb42511dd1ee8
[3/3] drm/xe: Allow to inject error in early probe
      commit: 676da6ba5bdc1997910ac1cc901cbf16bc6f6d97

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
