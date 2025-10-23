Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C94CCD193
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 16:57:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E26E10E939;
	Thu, 23 Oct 2025 16:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ByK7/660";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215DB10E934
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 16:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761238658; x=1792774658;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7VkfP6Gr9d/OykNBwcNoQYzuy8WI91NDCbQ+OegxIBw=;
 b=ByK7/660Bb+lILG6H4eNKlUepmi50fNZmcySb80r+UeVGXUuncrw/m5t
 9ONjy1d0ln+zyqObxkGCp9SbnfrdOQH36l4K6IGDqUX8Oy6OT8W0aqAWb
 nRCQOwSd2uABq3Ce2U84r/JjetHZmeGh29TVqBPFFO23waIU8D2YHPnsE
 8nY4RGvIrJ+bBLN1MU81wr/e1CbflEAh/1QeBX7h14f1P1ewwiZZ1Mtck
 65hb3vfToJ0fd2uYGBHhG8Eg/f8LUnh3GR9ZUWAiwzC/KrUVOAcGJbRE3
 37G/H8MLNhaPxA1NeBZ9Kz50VlKmL7kz+FeHnpwpEYJfkya+OZK5kEYCF Q==;
X-CSE-ConnectionGUID: kVSnU4FFQQ29byz0JHa+fA==
X-CSE-MsgGUID: gmt8RO7lRiiQ4w+P3jUpvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74085665"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="74085665"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 09:57:37 -0700
X-CSE-ConnectionGUID: ntE7ZwhFS36I1EI1ePyc0A==
X-CSE-MsgGUID: S5UPgYg8TN+4EkpqizFoXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="184277014"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 09:57:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH 0/5] drm/xe: CRI support in gt_throttle + refactors
Date: Thu, 23 Oct 2025 09:56:53 -0700
Message-ID: <20251023-gt-throttle-cri-v1-0-9f36f3c8861c@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251023-gt-throttle-cri-06f3c9d33c44
X-Mailer: b4 0.15-dev-50d74
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

First patch was extracted from the rest of the CRI support series:
https://patch.msgid.link/20251021-cri-v1-0-bf11e61d9f49@intel.com

I did some minor tweaks for a v2 of that patch: something that could be
considered for merging since it follows the style of that file.

Patches on top are refactors to simplify the code and reduce its
verbosity/boilerplate.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Lucas De Marchi (4):
      drm/xe/gt_throttle: Tidy up perf reasons reading
      drm/xe/gt_throttle: Always read and mask
      drm/xe/gt_throttle: Add throttle_to_gt()
      drm/xe/gt_throttle: Tidy up attribute definition

Sk Anirban (1):
      drm/xe/cri: Add new performance limit reasons bits

 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  13 ++
 drivers/gpu/drm/xe/xe_gt_throttle.c  | 293 +++++++++++++++++++++++------------
 2 files changed, 205 insertions(+), 101 deletions(-)

base-commit: c63ccee28ae7ab4cb57a2433314f08c71da914ff
change-id: 20251023-gt-throttle-cri-06f3c9d33c44

Lucas De Marchi

