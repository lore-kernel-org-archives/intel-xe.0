Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346A6CD5BC9
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 11:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC48710E775;
	Wed, 27 May 2026 11:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i4LQDf44";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB2810E775
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 11:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779880429; x=1811416429;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C4LqGu1FSpN0Yt31wgs1Vx6IRC2tZ7eRVhAWTSLPGWI=;
 b=i4LQDf44nblSTJePMGpxoOsEDX/pg6rt2nc1p5mUdz7f4zGxnRzY3gFb
 7o1oU6WomQZCDtxGy6mH7X1Mz4JdeugXLRObUs9rTBuiwEIZFVBTRPseg
 NoipJnKbS2LzTMh/qTpDDmA2MBtWOKZyxPdYu0qmqYHS/kqM/j93j87ko
 SHYI+/LEOj9cftYO4IoGs9eQZZQt9x2j8uH0ANH4GyKUWgSGxfLGSNCy0
 bK2x4XZTY3/UDf2baXCGRxJJeVbaoT6156vUnUU2qqxjbmrnWtQ9I+DeQ
 xCTXYzl4rN8151J+jxHsgtuh4/wnkg7jlNiHWi2q784jOzRBnyXqxUFXU w==;
X-CSE-ConnectionGUID: 9vA5ZC+VR1SakVFe8gwiZw==
X-CSE-MsgGUID: Ub5HXLNjR+Kfh71d+n7zZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80612985"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="80612985"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 04:13:49 -0700
X-CSE-ConnectionGUID: h6LdsAPtTjuFB7S0s4n7Jg==
X-CSE-MsgGUID: 0jOwXETYRXq47s2fBtWMdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="242371077"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.24])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 04:13:49 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 00/10] GuC paging engine support
Date: Wed, 27 May 2026 12:13:36 +0100
Message-ID: <20260527111335.140000-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On NVL-S+, the GuC will be moving towards a dedicated GuC engine class for
the driver reserved copy engine(s), which we need for USM flows. With this
the GuC will now be able to internally differentiate KMD paging operations,
like clearing/migrating/binding, from other copy engine submissions.

Note that this is purely a software view within the GuC. There is no new
physical engine, or anything like that. With that in mind the design here
keeps this contained on the GuC side, with upper layers not needing to know
about this distinction.

The final GuC versioning is still being finalised (marked as TODO in the
relevant commits) and we are still missing the proper GuC release, so
merging is still gated by that, but in the meantime we can get this
reviewed in upstream and ready to go. This has already seen some internal
smoke testing, both on VF and PF flows with the new GUC_PAGING class.

v2 (Sashiko):
 - In VF query patch, we shouldn't call guc_has_paging_engine(), since this
   is too early in the VF sequence, and GUC_SUBMIT_VER() is still unset.
v3:
 - Revamp the paging engine setup in patch 5 (Sashiko)
 - Some more improvements from Daniele
v4:
 - Some more improvements from Daniele, plus some other tweaks
    
-- 
2.54.0

