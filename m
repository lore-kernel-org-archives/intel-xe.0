Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D313DEEC2B0
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 00:11:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A9610E07A;
	Tue, 24 Feb 2026 00:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CH9c993y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F9B10E07A
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 00:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771891916; x=1803427916;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=2hr2rFliOGUMVVvC9XgPCzy/Pe6x2pCIMZzg8HTraJM=;
 b=CH9c993ydRJLllBEgTG7cIO0PB1UtUAYa01wI+0SsxUzdM5usmG/u4ie
 KJcBq+gmnLQs98CIV2LI6ubwDzjR9Bw7XgeFbUfyrGSlwFvai/3v94Kfu
 yzFXD2TlO+2zYiYyAI9ltD3HlvR2a6Ja9IfjKsBzjSYzSeMxDf2wamsMF
 RuOKmWwGSZY+hHJFcqkGAELcEL7mg9Emmc1mqM0WNyFyTbSKaJnv/jGIm
 al2ugIFmsjbIbb4WHKupK5rcT4eUFxB0FLHl5glAvDZgZLE8BdaY+f5mU
 jnfh1BFAzCIPDcDbjGRigv4KRRRAhdc25T1cIXmldwphme2J9vS2FVI9D w==;
X-CSE-ConnectionGUID: gBY9/ELnST+5O/pq/AKaTQ==
X-CSE-MsgGUID: hwlSz28tSDu0pRYhFu2NOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76729772"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="76729772"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 16:11:55 -0800
X-CSE-ConnectionGUID: g+UwWxAJTSeA9K05xtGyNw==
X-CSE-MsgGUID: vTMPPTADTdK9QX0Y8B1WYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="220251350"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 16:11:56 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v3 0/2] Workaround cleanup & simplification
Date: Mon, 23 Feb 2026 16:11:31 -0800
Message-Id: <20260223-forupstream-wa_cleanup-v3-0-7f201eb2f172@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALXsnGkC/4XNzQrCMAzA8VeRnq2k2QerJ99DROqWusLWjnary
 ti72+20iwi5/AP5ZWaBvKHAzoeZeYomGGdTZMcDq1tln8RNk5ohYAkoMq6dn4YwelI9f6l73ZG
 y08BzCbpQlZQ55CwdD560eW/w9Za6NWF0/rP9iWLd/iWj4MBlKTQ2TaYqkhdjR+pOtevZSkbcM
 Qg/GUzMQyBAodLocs8sy/IFh3ZcIwMBAAA=
X-Change-ID: 20260213-forupstream-wa_cleanup-490f5a899404
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, 
 Shuicheng Lin <shuicheng.lin@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2835;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=2hr2rFliOGUMVVvC9XgPCzy/Pe6x2pCIMZzg8HTraJM=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpnOzLS1YGUopk7DHDJV09bgdYPU0iZgTP1pOZC
 FLmbnTMO6GJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZzsywAKCRBNeSQFyHKQ
 BMzvEACuFc2aB9HCT4jSzYkM6awUubHi5AqlQeAEYxLd6q/CU/7656EAkvkkOxboA5hYOiY3U5G
 zeg+PdS96eWtB6uOR4s2iMmR+RkvNIDbh7m57ePzVVNKIyE4UFgHV0M8Ma1U5XZLYv1Qd/RpBqH
 YSFCy301E+w2T4qOdhFFsDck+sWPpRQ12hqtA+3EhnmeTiD4/uMRxhLWQe7ANfX/Gadb2+9rm9H
 m1WKC2s1RkYBPQR7kn0+p/Q2Nrk57DLU1DmodtaOI9HK5pnnbH+sQdj//3t94objWMsIPzWwyUD
 d3XjfwOYtOBsu4gjvQRaDSSV9QnBIMddKKnYZA+61LTvTZYWWF2XTUsxiaAfcDwRsGsAFONQlg1
 XfYk057hxhyTH8tcvnTT1X8O3vDd+lSbY1YZEWYCtY4Hrizs7yo6fRuz6I9mdfvhIUBSmK6+s5t
 Eiksx11SxT+uxEfdzutlDUY1kaX5wtAgfUhfZFe0TyiYJ+c8QWzlVcU5SwJQTOtEDISpFmUv4Lo
 9v18rnYpPyhJaG+lstsC+OOMxjvqwbxfkPs+zC6WJag4ic5dM3hoq1FA/MKAES7bKTZvRfrk4wE
 c6tvlAgn+ZKHTSwPlAKU5GWEmJdobhkBXuIUMevR8aIRzIWSzBIfl1loAgsLVD5rW5nF/FAG+/X
 UfjzWswWx0TgYBQ==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

The majority of the patches in this series relate to the new policy of
allowing GRAPHICS_VERSION_RANGE() and MEDIA_VERSION_RANGE() to extend
across currently-unused version numbers.  Obviously there are a lot of
unused numbers between major IP generations (e.g., Xe2's 20.xx to Xe3's
30.xx), but there are also cases where random version numbers in the
middle of a bunch of other versions go unused (for example, we currently
have variants of Xe3_LPG IP using every version number from 30.00 to
30.05 *except* for 30.02).  Allowing ranges to cover currently-unused IP
numbers allows simpler RTP matching rules and cleaner code.  The price
for this is that additional work and review will be required if an
intermediate IP version like 30.02 shows up in the future --- we'll need
to analyze each range that covers the new version to determine whether
the workaround also applies to the new IP, or whether we need to split
the existing range into two separate ranges.  The platform enabling
engineers are willing to take on this extra review burden. [1]

Aside from RTP rule consolidation according to the new policy, this
series also drops some Xe1 workarounds that were only relevant to
pre-production platforms (the Xe KMD doesn't officially support Xe1
platforms since i915 should be used instead, but pre-production Xe1
hardware is especially out of scope).  There's also one BMG workaround
(Wa_15010599737) which was invalid and is dropped completely.

[1] https://lore.kernel.org/all/20260203233600.GT458797@mdroper-desk1.amr.corp.intel.com/

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
Changes in v3:
- Drop the SRIOV VF check on the consolidated Wa_18041344222 to align
  with the commits that just removed that rule from the per-platform
  entries.
- 21 reviewed patches applied; only two remain now.
- Link to v2: https://lore.kernel.org/r/20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com

Changes in v2:
- Also remove an unused flag and two functions that are now dead code
  when dropping PVC pre-production workaround 1509372804.
- Consolidate the newly-added entry for Wa_18041344222 on graphics
  version 20.04.
- Consolidate OR'd ranges for Wa_14023061436.
- Link to v1: https://lore.kernel.org/r/20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com

---
Matt Roper (2):
      drm/xe: Consolidate workaround entries for Wa_18041344222
      drm/xe/xe2_hpg: Drop invalid workaround Wa_15010599737

 drivers/gpu/drm/xe/xe_wa.c | 29 +++++++----------------------
 1 file changed, 7 insertions(+), 22 deletions(-)
---
base-commit: b9cfd94d023644192a7c0eb92daed78722960006
change-id: 20260213-forupstream-wa_cleanup-490f5a899404

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

