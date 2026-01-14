Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB95D2A00F
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 13:00:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701FA10E605;
	Wed, 14 Jan 2026 13:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jVdKXA3e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B165D10E605
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 12:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768395600; x=1799931600;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K2vhHpt2+hG3yStB7bqNNKll8Zt3mpRKB54r3FDKOBc=;
 b=jVdKXA3eMLameqH78dH/DkLUQjaDD47aga4iNZtj1AiLi9zHKIGxFRr0
 4t0s22lJAyuWmwxl8TNUrb07fQyZj6MkFup7x2j9zOFduJuc9ySQUA0NS
 IzpESLDPcakYGaxgw8EoVqEhmZXFpF+agYd58zVNgER/IwWmORFTM5s5R
 GLnD65lP1A0GRi6LsLOJi5Vu7ASZkDzD9vghEqFagtbMOGZxWqCvVNv4h
 AmZq93pATnrNPxhs1OBBtpP+WGEhoUekKiBKmgNunf3suwzWhbjs1LdFd
 un/OC9xl99PQTuOqA+sp8/cZf55+IC9plUpfNEmmR061J096EFebsoiJg Q==;
X-CSE-ConnectionGUID: Pcjyeyc1QJyC7V8tUydsMg==
X-CSE-MsgGUID: cBFG2RhuSd6Zjv/rS1Ef2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="92361680"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="92361680"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 04:59:59 -0800
X-CSE-ConnectionGUID: EvEsQQG+SmKsQ2ET3nAvbQ==
X-CSE-MsgGUID: 6uafZRSZSQmEGRhIlMpJKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="203810625"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 04:59:55 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 daniele.ceraolospurio@intel.com, nishanth.p.reddy@intel.com,
 rodrigo.vivi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH 1/2] drm/xe/rtp: Extend support for max rules/actions per entry
Date: Wed, 14 Jan 2026 18:30:17 +0530
Message-ID: <20260114130015.3917770-5-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114130015.3917770-4-sk.anirban@intel.com>
References: <20260114130015.3917770-4-sk.anirban@intel.com>
MIME-Version: 1.0
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

Increase XE_RTP_PASTE macro coverage to 15 arguments
to support workarounds with many platform-specific conditions.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.h         | 4 ++--
 drivers/gpu/drm/xe/xe_rtp_helpers.h | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index ba5f940c0a96..072dedc4ebf2 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -374,7 +374,7 @@ struct xe_reg_sr;
  * XE_RTP_RULES - Helper to set multiple rules to a struct xe_rtp_entry_sr entry
  * @...: Rules
  *
- * At least one rule is needed and up to 12 are supported. Multiple rules are
+ * At least one rule is needed and up to 15 are supported. Multiple rules are
  * AND'ed together, i.e. all the rules must evaluate to true for the entry to
  * be processed. See XE_RTP_MATCH_* for the possible match rules. Example:
  *
@@ -399,7 +399,7 @@ struct xe_reg_sr;
  * XE_RTP_ACTIONS - Helper to set multiple actions to a struct xe_rtp_entry_sr
  * @...: Actions to be taken
  *
- * At least one action is needed and up to 12 are supported. See XE_RTP_ACTION_*
+ * At least one action is needed and up to 15 are supported. See XE_RTP_ACTION_*
  * for the possible actions. Example:
  *
  * .. code-block:: c
diff --git a/drivers/gpu/drm/xe/xe_rtp_helpers.h b/drivers/gpu/drm/xe/xe_rtp_helpers.h
index a33b0ae98bbc..2de0274bac04 100644
--- a/drivers/gpu/drm/xe/xe_rtp_helpers.h
+++ b/drivers/gpu/drm/xe/xe_rtp_helpers.h
@@ -66,6 +66,9 @@
 #define XE_RTP_PASTE_10(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_9(prefix_, sep_, _XE_TUPLE_TAIL args_)
 #define XE_RTP_PASTE_11(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_10(prefix_, sep_, _XE_TUPLE_TAIL args_)
 #define XE_RTP_PASTE_12(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_11(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_13(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_12(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_14(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_13(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_15(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_14(prefix_, sep_, _XE_TUPLE_TAIL args_)
 
 /*
  * XE_RTP_DROP_CAST - Drop cast to convert a compound statement to a initializer
-- 
2.43.0

