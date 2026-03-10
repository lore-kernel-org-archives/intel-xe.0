Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1F6FD2D65
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 12:00:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F89D10E707;
	Tue, 10 Mar 2026 12:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BPI4hSVR";
	dkim-atps=neutral
Received: from mgamail.intel.com (unknown [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D068910E703;
 Tue, 10 Mar 2026 12:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773144052; x=1804680052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X5bkIg01mSwii0raJK6zIIndcQTpTwNMf2UUfEWI840=;
 b=BPI4hSVRI6m/RHXBPbguk6rGndqNbgbKqE5DfpzKSqFZ8Ey0aYz2rnVs
 E0iWK6TYOah1P6jHqpOv0XyeLcZaBTsk04qTj6H6ZeoX0RVWfOr/KEFYm
 NHF/pbghf1Yhpw2BQeXsO6SQzrCnBd0x3ZtMI3sadoHDWXoXwP3BlYD55
 f21pVOCskL5yO4ND8TXZwcJr1NS3P7+iMQqm5+8Ix2o8MJLJfVU+5A7lH
 0ZN0C+iN1WWzR4DffH4ceLgdrpW8CX13oN1FpNsXTHwGv47e2sOvqU1Wf
 4lz7GE63V+NepjKi5rEncGYDHXj7FunlqnN6YOl03rS6VNt6Ox3gTa1VL w==;
X-CSE-ConnectionGUID: ob7QbQk2Q3mvCeCDGodLqA==
X-CSE-MsgGUID: jQ+MbKQATWKdVRIfL2HsLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84897886"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="84897886"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 04:57:42 -0700
X-CSE-ConnectionGUID: 5caxrIYCR6u91I0aJdALGA==
X-CSE-MsgGUID: utGbFRa4SMWw1tJHYvJBsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="224773043"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa005.fm.intel.com with ESMTP; 10 Mar 2026 04:57:38 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: contact@emersion.fr, alex.hung@amd.com, harry.wentland@amd.com,
 daniels@collabora.com, mwen@igalia.com, sebastian.wick@redhat.com,
 uma.shankar@intel.com, ville.syrjala@linux.intel.com,
 maarten.lankhorst@linux.intel.com, jani.nikula@intel.com,
 louis.chauvet@bootlin.com, stable@vger.kernel.org,
 chaitanya.kumar.borah@intel.com
Subject: [PATCH v2 1/2] drm/colorop: Preserve bypass value in duplicate_state()
Date: Tue, 10 Mar 2026 17:02:37 +0530
Message-Id: <20260310113238.3495981-2-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260310113238.3495981-1-chaitanya.kumar.borah@intel.com>
References: <20260310113238.3495981-1-chaitanya.kumar.borah@intel.com>
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

__drm_atomic_helper_colorop_duplicate_state() unconditionally
sets state->bypass = true after copying the existing state.

This override causes the new atomic state to no longer reflect
the currently committed hardware state. Since the bypass property
directly controls whether the colorop is active in hardware,
resetting it to true can inadvertently disable an active colorop
during a subsequent commit, particularly for internal driver commits
where userspace does not touch the property.

Drop the unconditional assignment and preserve the duplicated
bypass value.

Fixes: 8c5ea1745f4c ("drm/colorop: Add BYPASS property")
Cc: <stable@vger.kernel.org> #v6.19+
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/drm_colorop.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index f421c623b3f0..e44a738c4c14 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -466,8 +466,6 @@ static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colo
 
 	if (state->data)
 		drm_property_blob_get(state->data);
-
-	state->bypass = true;
 }
 
 struct drm_colorop_state *
-- 
2.25.1

