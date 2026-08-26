Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91774C5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 13:40:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473DD10ED20;
	Wed, 26 Aug 2026 13:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MXIhXZFR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4150610ED20;
 Wed, 26 Aug 2026 13:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787751654; x=1819287654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UohdrzjDL0Qu2rhvovEibi/KOGueR0/c0PTgcRjxblY=;
 b=MXIhXZFRGVdxRoVgS1qF3NoHELaBEJLcWM+29l4VDiv45iQj1nk4UGQJ
 UHDMproNhpFHf79CS/eAOGvI8zyXwFxmjLIG40ZY8e8b8WnEizRkaWzSJ
 xp4qjPMbykH0ZRRGXIoAtdBAExAT1D831C8omnk2hRpgIzbGp6nkQvw+M
 IyX53emHmn4fi5yvpVe0piEFZsWNgqHmYPADWRrrws4NsL2c8PHCiVfsE
 VOG7edl0i8JlBWvWVW0RqEuKTW4uplCcsQ7pX1R9Pn5a/X3rUztFE5cFN
 RJa+A6+LA/zJAqMPYk9/40LSuVYIaDaKJgpRv6y3nJwe3Ac+MmPnzxAVV Q==;
X-CSE-ConnectionGUID: /DzhR0LxTfaHzYTezn99cQ==
X-CSE-MsgGUID: aQGtRl8+QwuFGSG9pGro2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88360922"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88360922"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:40:54 -0700
X-CSE-ConnectionGUID: b0pQsXDdQNaLLnz2RetAJw==
X-CSE-MsgGUID: QtMEqhyMSku0QZP0T1mzsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="271081676"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.39])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:40:53 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 04/14] drm/i915/cdclk: Notify DG2 pcode about pipe power
 wells regardless of CDCLK
Date: Wed, 26 Aug 2026 16:40:23 +0300
Message-ID: <20260826134033.13976-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260826134033.13976-1-ville.syrjala@linux.intel.com>
References: <20260826134033.13976-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

We're currently skipping the pcode notifies on DG2 if the CDCLK isn't
changing while the power well counts would still need updating.
Do the pcode notifications also for pure pipe power well changes.

The lower level intel_set_cdclk() will skip doing any real work if the
actual CDCLK stuff doesn't need to change, so it's fine to call it even
if only the power wells need updating.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 37b1bdaa78d4..052274cd0e19 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2847,7 +2847,9 @@ intel_set_cdclk_pre_plane_update(struct intel_atomic_state *state)
 		return;
 
 	if (!intel_cdclk_changed(&old_cdclk_state->actual,
-				 &new_cdclk_state->actual))
+				 &new_cdclk_state->actual) &&
+	    dg2_power_well_count(display, old_cdclk_state) ==
+	    dg2_power_well_count(display, new_cdclk_state))
 		return;
 
 	if (new_cdclk_state->disable_pipes) {
@@ -2902,7 +2904,9 @@ intel_set_cdclk_post_plane_update(struct intel_atomic_state *state)
 		return;
 
 	if (!intel_cdclk_changed(&old_cdclk_state->actual,
-				 &new_cdclk_state->actual))
+				 &new_cdclk_state->actual) &&
+	    dg2_power_well_count(display, old_cdclk_state) ==
+	    dg2_power_well_count(display, new_cdclk_state))
 		return;
 
 	if (!new_cdclk_state->disable_pipes &&
-- 
2.54.0

