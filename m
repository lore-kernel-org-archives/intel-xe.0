Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DE8C2BB85
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 05:00:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9324110E566;
	Tue, 18 Jun 2024 05:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MF5NQAGT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D66110E163
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 05:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718686856; x=1750222856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nsAG+aMQZn+7gU17Kbk8HFaMYuzHlNLQbx0NbGrkJ1s=;
 b=MF5NQAGT2yD5MeIE/x0Wlk7lKais/MqkGXgQUx77uKOftnRMQ4tCkiDu
 IFQAbW8xwazDUlYMeHhfiVqCY2ohHgtn07Gr9I7dp57aYVu/eY93IsI9H
 Xy3CMcM315ZShIzUwbl4Az1FEZCMKXbB0SIzEauGlS4KvjsYB2A4NCz4H
 CtAMxInvSfAoD8Lo3DZiqS7QFsSrF9KBnTN4YFSDMCUOLWsSp2QDKR+6D
 iru2VvS/Ys4y76UnZfvGwcWkKe8fR2EQjLlDPVg0y8TEt/EHnWX1bkCmg
 lurC4msW03G0o42upv8TlWf3qKh0N/qyY6S/6HgnPXi/cAq+rJ10bbaPi A==;
X-CSE-ConnectionGUID: hp0/lzyFQMO8QEIBnX0nTw==
X-CSE-MsgGUID: 9xw15UuPSmaQZUAuRk/4Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15256601"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="15256601"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:00:55 -0700
X-CSE-ConnectionGUID: UsJ6wwdvS8+bMJ7JisUd4A==
X-CSE-MsgGUID: SQ3Uxh8aQeKpvBVv0HCjYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="41537738"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:00:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 2/5] drm/xe/rtp: Expand max rules/actions per entry
Date: Mon, 17 Jun 2024 22:00:41 -0700
Message-ID: <20240618050044.324454-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618050044.324454-1-lucas.demarchi@intel.com>
References: <20240618050044.324454-1-lucas.demarchi@intel.com>
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

Having at most 4 rules per entry is already reaching the maximum.
Expand it to 6 to allow for more room. With the addition of OR
condition for rules, this will very soon not be sufficient.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.h         | 4 ++--
 drivers/gpu/drm/xe/xe_rtp_helpers.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 337b1ef1959c..904c5156a7b1 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -325,7 +325,7 @@ struct xe_reg_sr;
  * XE_RTP_RULES - Helper to set multiple rules to a struct xe_rtp_entry_sr entry
  * @...: Rules
  *
- * At least one rule is needed and up to 4 are supported. Multiple rules are
+ * At least one rule is needed and up to 6 are supported. Multiple rules are
  * AND'ed together, i.e. all the rules must evaluate to true for the entry to
  * be processed. See XE_RTP_MATCH_* for the possible match rules. Example:
  *
@@ -350,7 +350,7 @@ struct xe_reg_sr;
  * XE_RTP_ACTIONS - Helper to set multiple actions to a struct xe_rtp_entry_sr
  * @...: Actions to be taken
  *
- * At least one action is needed and up to 4 are supported. See XE_RTP_ACTION_*
+ * At least one action is needed and up to 6 are supported. See XE_RTP_ACTION_*
  * for the possible actions. Example:
  *
  * .. code-block:: c
diff --git a/drivers/gpu/drm/xe/xe_rtp_helpers.h b/drivers/gpu/drm/xe/xe_rtp_helpers.h
index 7735f217ba71..c59e40fd7fff 100644
--- a/drivers/gpu/drm/xe/xe_rtp_helpers.h
+++ b/drivers/gpu/drm/xe/xe_rtp_helpers.h
@@ -58,6 +58,8 @@
 #define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
 #define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
 #define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_5(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_4(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_6(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_5(prefix_, sep_, _XE_TUPLE_TAIL args_)
 
 /*
  * XE_RTP_DROP_CAST - Drop cast to convert a compound statement to a initializer
-- 
2.43.0

