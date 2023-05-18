Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF500C77B7D
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 23:03:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79A910E56E;
	Thu, 18 May 2023 23:03:25 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E7C88EA1
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 23:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684451003; x=1715987003;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YVjetVE39hmajSyeEFeQ9mKVCmA3aq3MZ0/KykCexvQ=;
 b=Sr99ov0GzWBW/5Wq69gbir0WsANyTDfWT1fCoKJtii5rG+BGiYers1NA
 meWvomGtk7neX/2ROMt+W3KXSZOJXu0ESrWDo+5of4XZK7L4ROrZKXx6G
 1qNO2EimIznfLkAnmjk6yqlPeOHdYznt7YTWpUlVR9NpaP385s+sQHRF7
 HswRzfPK+kJEDOmQqnPQpNhVYk2LoRKS67HcOiqAebC6VJAIebQSG8B6D
 QxDZkc9KLZhhZifDdwI7P1BtJOWrfEcDQL8IFKu5YfNUqkoWGjUcTY3Kw
 2wOwqGfYi4/21R5nPXclFqibqG+HJ2utTvGh3CWoo4QRORKb7IMLRI0ia g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="438568297"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="438568297"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 16:03:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="826566092"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="826566092"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 16:03:21 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 18 May 2023 16:02:22 -0700
Message-Id: <20230518230221.3571188-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230518223937.GX6250@mdroper-desk1.amr.corp.intel.com>
References: <20230518223937.GX6250@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] fixup! drm/xe/rtp: Improve magic macros for
 RTP tables
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.h | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 8bc946694bfc..8a89ad45589a 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -262,11 +262,10 @@ struct xe_reg_sr;
 
 /**
  * XE_RTP_ENTRY_FLAG - Helper to add multiple flags to a struct xe_rtp_entry
- * @f1_: Last part of a ``XE_RTP_ENTRY_FLAG_*``
- * @...: Additional flags, defined like @f1_
+ * @...: Entry flags, without the ``XE_RTP_ENTRY_FLAG_`` prefix
  *
- * Helper to automatically add a ``XE_RTP_ENTRY_FLAG_`` prefix to @f1_ so it can
- * be easily used to define struct xe_rtp_action entries. Example:
+ * Helper to automatically add a ``XE_RTP_ENTRY_FLAG_`` prefix to the flags
+ * when defining struct xe_rtp_entry entries. Example:
  *
  * .. code-block:: c
  *
@@ -285,11 +284,10 @@ struct xe_reg_sr;
 
 /**
  * XE_RTP_ACTION_FLAG - Helper to add multiple flags to a struct xe_rtp_action
- * @f1_: Last part of a ``XE_RTP_ENTRY_*``
- * @...: Additional flags, defined like @f1_
+ * @...: Action flags, without the ``XE_RTP_ACTION_FLAG_`` prefix
  *
- * Helper to automatically add a ``XE_RTP_ACTION_FLAG_`` prefix to @f1_ so it
- * can be easily used to define struct xe_rtp_action entries. Example:
+ * Helper to automatically add a ``XE_RTP_ACTION_FLAG_`` prefix to the flags
+ * when defining struct xe_rtp_action entries. Example:
  *
  * .. code-block:: c
  *
@@ -308,8 +306,7 @@ struct xe_reg_sr;
 
 /**
  * XE_RTP_RULES - Helper to set multiple rules to a struct xe_rtp_entry entry
- * @r1: Last part of XE_RTP_MATCH_*
- * @...: Additional rules, defined like @r1
+ * @...: Rules
  *
  * At least one rule is needed and up to 4 are supported. Multiple rules are
  * AND'ed together, i.e. all the rules must evaluate to true for the entry to
-- 
2.40.1

