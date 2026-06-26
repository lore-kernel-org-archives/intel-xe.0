Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5C1CDE008
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 11:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCC310E38C;
	Fri, 26 Jun 2026 11:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CqARsfgH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9CD10E38C
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 11:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782472535; x=1814008535;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JLNRyZo0vys7M40u4UaD4U4Cfs7Ro1MKwnnQqUMouxw=;
 b=CqARsfgHY4YmnnOTRAgmWzhdcDtpEHSeDD0qDvijYYWqiBDPrVy4c+/Q
 sPFKmPyd7R7i8s7gNNQQQ9rbu4Zww0ozL48qduCg9rQ/xOTFmiioGkvKO
 VpuVblrVyR/1HpP+6QFvT+j0bJC69lffktI2vJghGXZrOLDjKLObZexPz
 CXHo/EVQBtzOu1Ayjc8/WZWb+TOCQMJmGnOCfuoTkGRlE//R2Lt1UmUsm
 elWA9AoseHdnVw0BtSd9MGHxm92s8IBWKRqWFKH4/xInVKqMmuBIE9BRT
 gFtZcHsyKSIVYqrna5zbCTB5HK26HOpddm7rV8Jd5CjSNZUBBsf9S7C8a Q==;
X-CSE-ConnectionGUID: FFIIAOsSQmuqLmRjV4yX1Q==
X-CSE-MsgGUID: KG50v1NzTFime3Bh3C1jVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="100694980"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="100694980"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 04:15:34 -0700
X-CSE-ConnectionGUID: 3jf5dBO8SN+NemehOrBCtg==
X-CSE-MsgGUID: OM0h6NPtQ/qhQ9u8EgKKgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="253214335"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.49])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 04:15:34 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 00/10] GuC paging engine support
Date: Fri, 26 Jun 2026 12:15:21 +0100
Message-ID: <20260626111520.487997-12-matthew.auld@intel.com>
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

v2 (Sashiko):
 - In VF query patch, we shouldn't call guc_has_paging_engine(), since this
   is too early in the VF sequence, and GUC_SUBMIT_VER() is still unset.
v3:
 - Revamp the paging engine setup in patch 5 (Sashiko)
 - Some more improvements from Daniele
v4:
 - Some more improvements from Daniele, plus some other tweaks
v5:
 - Some improvements from Michal
 - Update with the official GuC version: 70.68.0 (1.36.0)
v6:
 - Tweak the VF vs PF versioning as per GuC team
 - Also for now treat zero paging engines as hint to use fallback
v7:
 - Some improvements to: drm/xe/vf: wire up NUM_PAGING_ENGINE_INSTANCES,
   as suggested by Michal.

-- 
2.54.0

