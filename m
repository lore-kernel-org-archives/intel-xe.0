Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A55C5CFDB
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 23:53:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94BE10EDD8;
	Tue, 11 Aug 2026 23:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J6xL8ePE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A20510EDD7
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 23:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786492386; x=1818028386;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=pSeQmI8ADgYniKfyGyGuqeCO/9qzO8Vl4aPXfaxnfSo=;
 b=J6xL8ePEi23M8y7YvL3CO6DnyJ4fptoy2d/YVpeEdTYC8NchTBqc+Iow
 FZVLB+rIu58tY/5IQI0z8IbHIQovycIwz9UOlLbHhR+danLnAy9DAEYtJ
 HAzz9CF0jr9uZEwW0UTlhGt6sPwQENTF9w2O/Xe6LhOZuxra0osBMNgj9
 xGpsfQq4aXRQZaZha/673JInHWKHukbysIkQfNBtaKh9JatEt/D672gH8
 0bgr4EPLZ27iEptk30YAftbRQM02I5zmSQkbovu9zY9pjAWfuJ4B3ATQG
 LSk1BjqdS+dYOCDYqvXPRIsC2gHp6FBvqsxq00uNuB60DNTwkpXM7VOzw w==;
X-CSE-ConnectionGUID: /fLXstKZTly8MeV1/5F+6w==
X-CSE-MsgGUID: npyvRc8LQ0aV8fzJJYslEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98183265"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="98183265"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 16:53:05 -0700
X-CSE-ConnectionGUID: R4t+Lde5SMa0r4r1sLpbfQ==
X-CSE-MsgGUID: UN0lFYZUSxiveIvHmJP8Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="261729326"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 16:53:05 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, mallesh.koujalagi@intel.com
Subject: [PATCH 2/4] drm/xe/pcode: Use int instead of u32 for mailbox status
Date: Tue, 11 Aug 2026 16:52:57 -0700
Message-ID: <20260811235254.153783-8-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260811235254.153783-6-umesh.nerlige.ramappa@intel.com>
References: <20260811235254.153783-6-umesh.nerlige.ramappa@intel.com>
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

Mailbox status is of type int, but one of the functions is using a u32
to read it (likely a typo). Use int instead.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index ccc3bdeed6bb..e9125341481b 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -149,7 +149,7 @@ int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1)
 
 static int pcode_try_request(struct xe_tile *tile, u32 mbox,
 			     u32 request, u32 reply_mask, u32 reply,
-			     u32 *status, bool atomic, int timeout_us, bool locked)
+			     int *status, bool atomic, int timeout_us, bool locked)
 {
 	int slept, wait = 10;
 
@@ -197,8 +197,7 @@ static int pcode_try_request(struct xe_tile *tile, u32 mbox,
 int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
 		     u32 reply_mask, u32 reply, int timeout_base_ms)
 {
-	u32 status;
-	int ret;
+	int status, ret;
 
 	xe_tile_assert(tile, timeout_base_ms <= 3);
 
-- 
2.51.0

