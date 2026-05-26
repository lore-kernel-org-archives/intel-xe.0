Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AD1CD5BC8
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 14:19:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBD910E69F;
	Tue, 26 May 2026 14:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j9Sb36Vf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2D610E69F
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 14:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779805155; x=1811341155;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mNCYgNRHYpm1fOuPlSLJSdrsGUJFeDO06glxv4sAMnM=;
 b=j9Sb36VfcZCOQ2HXbEIHKKVJKgZdF1SK2fJppAt85ziwOFzhtrwwwyx0
 90ZI73uTAxZ76Tujq0CHYAxuoUfT8cfIVqExWJ6affVZ61omxslQ1BrdZ
 2YswT+W6KiCS9lFMrW/8D6Gbsa1YSTkinlfU2VaKV1t2sbt8vyvHyWnaC
 +k9Hqxh5p1WivpjcmwE7SFyrZ7LRkFPkuaawqtzrg002cuwxAMDJxpJ1j
 KMEGygDXpITw3TWR+JdfA9feO4W4s7leH0XMVX2WZgqANSxokoMcCqCYP
 sAywO3He1XkVTOJT2t5m46BIuMZZhODk4sO0FBHZQYTi6b6TND2Q+acm3 w==;
X-CSE-ConnectionGUID: UAZ7GzmNToaOSc8VOQXi2g==
X-CSE-MsgGUID: WRRuhxJkR6mQGEUHIlMAcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="84505739"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="84505739"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 07:19:15 -0700
X-CSE-ConnectionGUID: gOm9s3JmStWKXBR5K6vF2Q==
X-CSE-MsgGUID: KRJ/M7vaQuq4LHRuSnY7yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="247015671"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.128])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 07:19:14 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 00/10] GuC paging engine support
Date: Tue, 26 May 2026 15:19:02 +0100
Message-ID: <20260526141901.62207-12-matthew.auld@intel.com>
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

-- 
2.54.0

