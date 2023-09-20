Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B592BC04ABA
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 17:27:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A5410E527;
	Wed, 20 Sep 2023 17:27:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242DE10E522
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 17:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695230875; x=1726766875;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8YbRjCcU9FnZ/GMVClYnU2+myFoSk/cvyTqMQVUuoY8=;
 b=nhQV2NwKz/FJ/fcFkEhSO2Cm1GZ9oqLeLNOpi+RQp+qB3BKTA6Tx0YAc
 w4uy9S2ZSjdImFKvLPmTI5uaFTMN650KrteGnJFOcX4uictE4UK1hs2wn
 5520bug1C5h5+IiM/IOOrSmryBJTTMv4kNuKfSrbVUDDJ1VPlS/4xF7z6
 AGS8WtbZSd4Pk8Mn5fVrbkYPCv029N39pc1ZeeYh/adwdhiBPBTqu58gx
 wkzMRtOJWnXW9y9Jzs9BSc/ncM6ZT0pEcpd/CJSxJq0YlyqgpVeQkyUb5
 S04QY4Fi6T8hzrp+tjvB6Jsli/crwggsOtVGMvuHys11CkzQuhv3n19qQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="411236553"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="411236553"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 10:27:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="750006663"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="750006663"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by fmsmga007.fm.intel.com with SMTP; 20 Sep 2023 10:27:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 20 Sep 2023 20:27:51 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 20 Sep 2023 20:27:51 +0300
Message-ID: <20230920172751.31395-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920140339.28322-3-ville.syrjala@linux.intel.com>
References: <20230920140339.28322-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/3] maybe xe is broken enough that it gives
 you a new vma every time?
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

v2: drop the warn to let testing proceed w/o taint
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index afe1d0fa0537..ea464bc99a7b 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -752,7 +752,7 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 
 	local_irq_enable();
 
-	if (old_plane_state->hw.fb != new_plane_state->hw.fb) {
+	if (old_plane_state->ggtt_vma != new_plane_state->ggtt_vma) {
 		drm_vblank_work_init(&old_plane_state->unpin_work, &crtc->base,
 				     intel_cursor_unpin_work);
 
-- 
2.41.0

