Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8FAEB3624
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 18:18:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E2D10E587;
	Mon,  2 Mar 2026 18:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hoBaDzbI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFE010E583;
 Mon,  2 Mar 2026 18:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772475484; x=1804011484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j4LViWL4OyZb0YF1Pj5S4i4POlROf1/fQwdUOvjLtcg=;
 b=hoBaDzbITIQXuuLv5Fl9c1gC4c6a07/w/Se2uJbCrd0r4fhU4rQJ06gB
 72BlltWg0zX4ag6j7RN1Mfs4REgCgKKqAl2TWwJUiEbTNhQ09jlDvwYPb
 fqLgswk5DBQJ9uPG2q7vf10IglWeDe1qPv1e1A2ZZ3HPUg1XB3mzcET9y
 7UKzODWlqm/xdj96LX21Jlv9WugKCBjyF/uuVW8cYTx2uVo1QE13OR3YW
 snjWGCW3aZzUiM5I7gNcFMI36fOG1uxv8LqsYOf/cz4gsyk8vZzGg8R6W
 BlnjBSiCU1VGH7GjGCxMTsOieepiFwhjDiXLUbyKmjLnUaXj7qJDB/vjg g==;
X-CSE-ConnectionGUID: +MoGGcmrTfSp8LL8Evfxog==
X-CSE-MsgGUID: qxh+qKVRRdKRea1UvuqBfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="77362102"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="77362102"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 10:18:04 -0800
X-CSE-ConnectionGUID: MkmeXWf2RkmoDpi7DUbWmg==
X-CSE-MsgGUID: Lr8QBtkMQoqRequSc15+eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="222378150"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 10:18:02 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 4/7] drm/intel: fix @dpt kernel-doc for parent interface
Date: Mon,  2 Mar 2026 20:17:36 +0200
Message-ID: <0209e128312520ca1c6a0c39f9dfb0184125322a.1772475391.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772475391.git.jani.nikula@intel.com>
References: <cover.1772475391.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Fix the copy-paste fail.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/intel/display_parent_interface.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/intel/display_parent_interface.h
index b4b0f58ae3ee..b439e513c0c5 100644
--- a/include/drm/intel/display_parent_interface.h
+++ b/include/drm/intel/display_parent_interface.h
@@ -162,7 +162,7 @@ struct intel_display_stolen_interface {
  * check the optional pointers.
  */
 struct intel_display_parent_interface {
-	/** @dsb: DPT interface. Optional. */
+	/** @dpt: DPT interface. Optional. */
 	const struct intel_display_dpt_interface *dpt;
 
 	/** @dsb: DSB buffer interface */
-- 
2.47.3

