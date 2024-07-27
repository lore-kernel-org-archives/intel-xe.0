Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C085FC3DA4A
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jul 2024 01:59:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7724610E9A9;
	Sat, 27 Jul 2024 01:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fu5WDbTh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD1E10E82E
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Jul 2024 01:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722045565; x=1753581565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=815lSNfI6EO1JJsBi97HlMjYzkjv69IigjEXSUSb4JU=;
 b=fu5WDbThSdP4H53whpPIdA152Xd2joPGKcF5XMOGj+/pYE87Twi0LdbD
 y67OaqdDVb79vBXqWEcCgFX4+qdTzSt4OafxsRctinxJLHuLLrEUCwHHo
 ww8++LiFUwEkCTnu0lmMZyvRPsr+nZ+NZQ9zyOA6zFRGuO45/q8s8sgdD
 OmHmkss6tZynCt3F8lawxSqteRMSsJxtLlFuXXuRMIVnkRL+l39SBM16u
 fX9ZQ+jJitWkCHKJSPr2KmMVyEHjdgEXfwjz4fFOicVFRUD00n29H24AF
 JYlWRyV0K0VFnuTLwwYWzI4F8zar/f/lXOf79cHi1v3BA6i87kG+a/1i3 A==;
X-CSE-ConnectionGUID: nP9XZ0f+R/aKj/iiopShQg==
X-CSE-MsgGUID: t4pgBD/9QjqsMBfROFJAag==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19460261"
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="19460261"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 18:59:25 -0700
X-CSE-ConnectionGUID: RSFQVoCGSnKQNnLp5V/taQ==
X-CSE-MsgGUID: PyX7pbj9SmaYK63PT5BpGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="53108397"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 18:59:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v3 7/8] drm/xe/rtp: Expand max rules/actions per entry again
Date: Fri, 26 Jul 2024 18:59:06 -0700
Message-ID: <20240727015907.899192-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240727015907.899192-1-lucas.demarchi@intel.com>
References: <20240727015907.899192-1-lucas.demarchi@intel.com>
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

Like commit 512660cd1f1a ("drm/xe/rtp: Expand max rules/actions per
entry") did, expand the maximum number of actions/rules. That commit was
too conservative, just incrementing 2. Other than the ugliness of these
macros and additional preprocessor steps when they are used, there are
no downsides on increasing the maximum: the tables in which they are
used use a sentinel to mark the last element.

With rtp processing now supporting OR rules, it's possible to migrate
the extension made for OOB WAs that "entries with name are OR'ed in
previous entry". For that the maximum number of rules needs to be
increased.

Just double it. Hopefully 12 is sufficient for longer than 6 was.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240618050044.324454-3-lucas.demarchi@intel.com
---
 drivers/gpu/drm/xe/xe_rtp.h         | 4 ++--
 drivers/gpu/drm/xe/xe_rtp_helpers.h | 6 ++++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index ad446731192c..827d932b6908 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -374,7 +374,7 @@ struct xe_reg_sr;
  * XE_RTP_RULES - Helper to set multiple rules to a struct xe_rtp_entry_sr entry
  * @...: Rules
  *
- * At least one rule is needed and up to 6 are supported. Multiple rules are
+ * At least one rule is needed and up to 12 are supported. Multiple rules are
  * AND'ed together, i.e. all the rules must evaluate to true for the entry to
  * be processed. See XE_RTP_MATCH_* for the possible match rules. Example:
  *
@@ -399,7 +399,7 @@ struct xe_reg_sr;
  * XE_RTP_ACTIONS - Helper to set multiple actions to a struct xe_rtp_entry_sr
  * @...: Actions to be taken
  *
- * At least one action is needed and up to 6 are supported. See XE_RTP_ACTION_*
+ * At least one action is needed and up to 12 are supported. See XE_RTP_ACTION_*
  * for the possible actions. Example:
  *
  * .. code-block:: c
diff --git a/drivers/gpu/drm/xe/xe_rtp_helpers.h b/drivers/gpu/drm/xe/xe_rtp_helpers.h
index c59e40fd7fff..a33b0ae98bbc 100644
--- a/drivers/gpu/drm/xe/xe_rtp_helpers.h
+++ b/drivers/gpu/drm/xe/xe_rtp_helpers.h
@@ -60,6 +60,12 @@
 #define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
 #define XE_RTP_PASTE_5(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_4(prefix_, sep_, _XE_TUPLE_TAIL args_)
 #define XE_RTP_PASTE_6(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_5(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_7(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_6(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_8(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_7(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_9(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_8(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_10(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_9(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_11(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_10(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_12(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_11(prefix_, sep_, _XE_TUPLE_TAIL args_)
 
 /*
  * XE_RTP_DROP_CAST - Drop cast to convert a compound statement to a initializer
-- 
2.43.0

