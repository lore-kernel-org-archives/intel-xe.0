Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF16C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 10:39:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2E810E395;
	Wed,  2 Sep 2026 10:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CdnZaEji";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569F810E395
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 10:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788345589; x=1819881589;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wl2e7qk8Z5c6NtMmUdh85yJLm5r3/xjrRMSWzOfVW8w=;
 b=CdnZaEjisCx43bMWpSrJSaeWjmZrZeYh4nhBZPNL2MoRaWLT5G7wI8yQ
 We/f/hEcMJbASRM1i7E6gVqtz7YGtW5GP5HUFlbeCIFll0GOZjxn3xw3B
 Uj5KSROvI+maJKFesxIYVLYn9GTPBygf003+/CbAV5dd9KO9cacR+ppqr
 OXPXAlsnsD1KM2vZp0uYKvJzPiDhFntWm7DRYCovWC3cmPOUp5snJqG7k
 /o/OzaclQ0sWIKz6UAarThGUOuFkRZpGdMlZvmkrpXLmPTvJ6vYA5vBNX
 KPQJcTXA+5tnpPMU/Sjjm6bx/ZtheY3Gi8ZJFv3DGD+oEN4LmzZLYPzUe A==;
X-CSE-ConnectionGUID: G1mW1widRNyfT+ZnunQrIA==
X-CSE-MsgGUID: 5wdXxJLmQKKIorp8S4Rbhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88556959"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="88556959"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 03:39:40 -0700
X-CSE-ConnectionGUID: /tFWJdEuSmyIQ8tq+ppY0g==
X-CSE-MsgGUID: fTrurlCGSi29Ok/gRTWWPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="265667549"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.174])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 03:39:39 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/5] VRAM health check + CCS fix
Date: Wed,  2 Sep 2026 11:39:32 +0100
Message-ID: <20260902103931.826063-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
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

Add a basic VRAM health check routine, which does some basic sanity
checking on the last VRAM page. This could be extended in the future.
This seems to reproduce the same CCS issue as Linus, on my b570.

This also picks up the fix from Linus. I went with leaving it as-is,
but that means we need to fixup the identity mapping to support 4K
pages for the tail part of usable VRAM.

It doesn't look like anything in our CI actually has the CCS alignment
issue present, so merging the fix from Linus without the identity map
changes likely shouldn't trigger any asserts, if that does end up
coming in via another tree, AFAICT.

v2:
 - Give more details around what the VRAM health check actually does
   and how it catches the CCS bug (Matt B).
 - Tweak the CCS base + alignment print (Matt B).
 - Drop the fix from Linus; this is now already in drm-tip.
 - Add some hardening for VRAM CPU mapping also.

-- 
2.55.0

