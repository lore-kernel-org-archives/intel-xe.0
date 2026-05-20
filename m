Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37D4CD4F3D
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 17:30:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5198610E0C9;
	Wed, 20 May 2026 17:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LYv4nQL5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019E610E0C9
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 17:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779298201; x=1810834201;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zLMwEYUuxQvGdRTm0kXToHQwasiwLWt13exk5p5x3XQ=;
 b=LYv4nQL5eLyxnfYERX9kv6CMSlCXAaKsaZ9aBCWSQIFKIMcMOZGZdim7
 ZEsLuyN5ML+MLDeZK44E9z0BLWw4EIEzSULiAuoq4WTa4ECunDPfyyCJ4
 DmQaQ1ToJ8R/R610vVzFSknHCgV8hmnqBQANqgWFqFd1QyrcHy213G6Hn
 HD6jsjDVS3WVRn2iK5mYncxnzfgu6rVBulACPel6m88g1rPimOCUqtV/s
 obH9x0UOP4VzF160UdeMnS8S5MG4D/5S50YU2KML5ZA3mcWay09aAzdH6
 pNbli3zh+cVxGxa6sqc+oRrMumb/u8LGjQSWci6g+1z/OciRhwTVEkuOV g==;
X-CSE-ConnectionGUID: vpDTM/AFSKiR+8fs8teXcA==
X-CSE-MsgGUID: kZ2E7RngQ0WRw7mcGCZSsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="105667614"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="105667614"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 10:30:00 -0700
X-CSE-ConnectionGUID: GGoHljYsRaywU9+IDeu57Q==
X-CSE-MsgGUID: nYfL+Hs0Q9mUIHOEc5pTQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="270598047"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.159])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 10:30:00 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 00/10] GuC paging engine support
Date: Wed, 20 May 2026 18:28:47 +0100
Message-ID: <20260520172846.291708-12-matthew.auld@intel.com>
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

-- 
2.54.0

