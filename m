Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA94ECD98CE
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 16:17:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C98D10E827;
	Thu, 11 Jun 2026 16:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="flSa75hI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B61710E827
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 16:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781194667; x=1812730667;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fyUiF5V33bBglseQu3preNZX0u+RJxZvjSSMR7D66Qc=;
 b=flSa75hIrVuW7jxveU8UwEU/a2IcKgZkejr4DO/4VoQFkzCbEDkIXdgs
 NHBHBL+aM84yknRLcnK+w8B6mEwS69l8l+78tn0zCETuFNATBojDWnyM3
 mzcvbDukry1uPdcxROwj58guCTh+1nbKx+eeGLFMA9gcMJRitx+r7fr/D
 mcaKUn6G9l3Ija7b34n08bV1Vg3hRbiepiHuguuy/tVIZZCXJMK/r43cb
 XVHX8sGxAr/hdhHE9LLDRJK0+8BIy5hpZZmtDFO9Li0PQRvn24A1lzGsV
 kxXGau9iTb+b4DdWJq6sOVxnKHz5NjdP8XTMs0we0X6RLg60TQ/A4JdbK A==;
X-CSE-ConnectionGUID: VACqZAbmQdWhQdcPj3ADVQ==
X-CSE-MsgGUID: AbehEDjrRii911RI25rOzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93402982"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="93402982"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 09:17:47 -0700
X-CSE-ConnectionGUID: +SjNUKiQTq+lAyPiVPHYug==
X-CSE-MsgGUID: gxPQ9gaXQKK2wNhIfIqWNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="251617029"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.170])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 09:17:46 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 00/10] GuC paging engine support
Date: Thu, 11 Jun 2026 17:16:35 +0100
Message-ID: <20260611161634.506476-12-matthew.auld@intel.com>
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

-- 
2.54.0

