Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7061C77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 17:40:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A218310E09E;
	Tue, 24 Jun 2025 17:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ksFXc1yW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C8410E09E
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 17:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750786804; x=1782322804;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HgmuUMg10/M9sjETv2oBlJOScUqwpfhrEbUdudsXZqI=;
 b=ksFXc1yWQT3eV05HzuDDZbsk59Fupecv3O3ZHfEoQGtdFl+992A9mONF
 kgfUH510okOl7SG/UQYrymc5mWRQg6D+/s4V9G8vRcSC0ikfwELk5T9Q0
 g1O0jkr7qbeR6b9QGNqfAHgEZkD3KzGsTXPaNJv30n4hAKeYjnkAbVSTe
 YpfaAGBfQZkc7nDqJUiZ0byG8cYpsG5xLVZow2+chyUYhSuZp95GCMCFQ
 seP0689MDPdx0uEuqeOFZhdcC8Z9+V3Gk4d5Ja7zxY3MYZbIbiXMqFDsl
 7hfCs7s3w2uYSJowfl0gSYxOD3AFJyJLm+GfQM4UMw/6DulD0/3n2B+Co Q==;
X-CSE-ConnectionGUID: Jw/SLhlrQTGTxez4GEEeYg==
X-CSE-MsgGUID: iPjyJaE7QTGWGzvAfC4DZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="70608930"
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; d="scan'208";a="70608930"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 10:40:03 -0700
X-CSE-ConnectionGUID: dcyl4nlvQnyeKa4EF0ecXw==
X-CSE-MsgGUID: BJMudRjHSVykY5Iy9MQFow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; d="scan'208";a="152150778"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 10:40:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH] [core-for-CI] iommu/vt-d: Enable ATS before cache tag
 assignment
Date: Tue, 24 Jun 2025 10:39:51 -0700
Message-ID: <175078670155.2442009.10696751949945054368.b4-ty@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624092412.4016009-1-tejas.upadhyay@intel.com>
References: <20250624092412.4016009-1-tejas.upadhyay@intel.com>
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


On Tue, 24 Jun 2025 14:54:12 +0530, Tejas Upadhyay wrote:
> This is a core-for-CI patch for
> https://lore.kernel.org/linux-iommu/20250620060802.3036137-1-baolu.lu@linux.intel.com/
> 
> Commit <4f1492efb495> ("iommu/vt-d: Revert ATS timing change to fix boot
> failure") placed the enabling of ATS in the probe_finalize callback. This
> occurs after the default domain attachment, which is when the ATS cache
> tag is assigned. Consequently, the device TLB cache tag is missed when the
> domain is attached, leading to the device TLB not being invalidated in the
> iommu_unmap paths.
> 
> [...]

Applied to our topic/core-for-CI branch to let more tests happen on it,
but from the reported fixes, it's looking good. Thanks!

[1/1] iommu/vt-d: Enable ATS before cache tag assignment
      commit: df2ed2be971d13ac658cf8049303462f1bfa4b82

Best regards,
-- 
Lucas De Marchi

