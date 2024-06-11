Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C673CC27C78
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 18:07:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBD010E6FF;
	Tue, 11 Jun 2024 18:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g8WudGuj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB81010E159
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 18:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718129271; x=1749665271;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rmLG6g/l0FaVzTueWESIGDTr/hrIa4YbRQt8hMS24as=;
 b=g8WudGujg/vuyBrIdbFCuaqTT+e/HNzmtxVgskLkaCs7Ol1ow2UbBE2R
 nvfJgcIbb9oIfTWwecToQJGhKfaDL5yvRxR/kUT7SOO85lI5fFUPoHzMd
 HWJ/4P/CHwQ0hN/kY8RYG3RHbMz/C5VACPU1Y3Izu6dusK1UfpHWG2drG
 In1qXd37e9hjOPw6gkoSzCKJTwypmOZD8S83wshJ2spgqxqNtJXYV3XpB
 9/HvyMMi9LDDoS6sBNoKcb2pijOyU+mxX9VGHd0F+oTcm1b/UaJC4sBmq
 n9IhzK5DNumZ0npKqAaGOT9VobF4bhuZ4/d873XwYWBmMHrOjPcop9Yu4 w==;
X-CSE-ConnectionGUID: mllOVNZZS/yu/yDd9xX+VQ==
X-CSE-MsgGUID: T3q8UAWzQkigfwSS4B6ODA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="32398380"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="32398380"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 11:07:50 -0700
X-CSE-ConnectionGUID: QDTyl52qTea2IlsX2UVWcg==
X-CSE-MsgGUID: +UmoeHrGQMCuQXdsNi2vng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39620446"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.248.185])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 11:07:49 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 3/4] drm/xe/guc: Fixup HXG Fast Request description
Date: Tue, 11 Jun 2024 20:07:34 +0200
Message-Id: <20240611180735.1988-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240611180735.1988-1-michal.wajdeczko@intel.com>
References: <20240611180735.1988-1-michal.wajdeczko@intel.com>
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

Like it's i915 copy, it was wrongly referring to the HXG Request.

Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_messages_abi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_messages_abi.h b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
index f6ed4dfd215c..2a0317cda7db 100644
--- a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
@@ -94,8 +94,8 @@
 /**
  * DOC: HXG Fast Request
  *
- * The `HXG Request`_ message should be used to initiate asynchronous activity
- * for which confirmation or return data is not expected.
+ * The `HXG Fast Request`_ message should be used to initiate asynchronous
+ * activity for which confirmation or return data is not expected.
  *
  * If confirmation is required then `HXG Request`_ shall be used instead.
  *
-- 
2.43.0

