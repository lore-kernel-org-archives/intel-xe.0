Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A4ECAC58E
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 15:13:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A11E10E3AA;
	Thu, 11 Sep 2025 15:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="be/3UcLv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F1B10EB5C
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 15:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757603592; x=1789139592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OjoZeIxKSzY6E0djo0a05TiT9EuJcwgaEOqe384PXSI=;
 b=be/3UcLvVkV1vzGw7wHUbyUzgrx/GF1peZRi/NXYaIuiYt4J1UbOQdzj
 BYzvYuAChmDgQDs5520GY6aZQy7zeZ1huCLka4Nt4L2UX3dWKJW0WD6BN
 NuUKJdnUaXLBcj6/Y0+o3fBmtSZVNoIdV1+AHoiyoKZ6S34b/DQgW72MD
 gH/daHqTUw3mOZeNi4+6XLOrQMPqMg0ZuhugJNnOoUb5OfRBHCDByJPYD
 e1NDtSp93DL8p+aN8mLNrAdE/YlRxNWpqodZmw7to9cfVrkm45nMck4+0
 fNOYV4o2qH0C38J8+FbMNJazyZH4uCbMdTBXmLHejZKHfYYq4MTKHG3DB g==;
X-CSE-ConnectionGUID: I4G/5fhpRBmlTCq3C9enUw==
X-CSE-MsgGUID: aFFz2tFjR7abhXTVIctaMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59797015"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="59797015"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 08:13:12 -0700
X-CSE-ConnectionGUID: I9TE8rNoSXSMWVMyCRRDeQ==
X-CSE-MsgGUID: +PZdMt0oTQirkCI5wHeNrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="197396410"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 08:13:11 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	Varun Gupta <varun.gupta@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, himal.prasad.ghimiray@intel.com
Subject: Re: [PATCH v3] drm/xe: Fix driver reference in FLR comment
Date: Thu, 11 Sep 2025 08:12:55 -0700
Message-ID: <175760355263.318460.8068352443223846961.b4-ty@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250911111712.811524-1-varun.gupta@intel.com>
References: <20250911111712.811524-1-varun.gupta@intel.com>
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


On Thu, 11 Sep 2025 16:47:12 +0530, Varun Gupta wrote:
> Rectify the reference of i915 to Xe in a comment.
> 
> v2: Cosmetic changes. (Karthik)
> v3: Rephrased the commit message. (Karthik)
> 
> 

Applied to drm-xe-next, thanks!

[1/1] drm/xe: Fix driver reference in FLR comment
      commit: 010629e00d8494d0ca3893fe802ee0cbec92c021

Best regards,
-- 
Lucas De Marchi

