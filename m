Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF02E77180
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 06:42:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6EE10E3C6;
	Wed, 11 Dec 2024 06:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a3Zk48Af";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C754710E3C6
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 06:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733899362; x=1765435362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5lbbeYPN1HEM6QnZ0oTHv0F5KOdMdCy+ZwkpOjKZNl8=;
 b=a3Zk48AfNYYdFQHbSdunilyOMHQuRXIlBEDK6Keo1PGaAqwRuEC6JETE
 ODhoGM7tDqtmb9vO+kbzgaMNT9262ulxaz+uPhH1bmVFVGTW8MiOti5FA
 NaVtVi4Vq7+FgF6XPOQq+PEiUenN545UzoDSY+sfjKWNTAPSW0LdNqd12
 zjLtoMj3xpRfaeACNJ2D36NFp+fycmQNh74PgrNVVu3GEB1UFFmFNYUcX
 WpfJO2qrl6az1RfzTZG6KwOQrTKOJ8JWzW3G1PKPm4hTvzVAAsE3NDHcs
 KbJfpi6MCX9wJ20JBJvaP2FZMQV8lMZbmnmrEbOymWbfzvN5yLglySlHR Q==;
X-CSE-ConnectionGUID: CmSWQA02QDy2ZmrhYG8pkQ==
X-CSE-MsgGUID: x0aoYV66TdSPz9oPI5ACbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44936056"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="44936056"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 22:42:42 -0800
X-CSE-ConnectionGUID: K7HdxfvPRUmTcKNpalUGaw==
X-CSE-MsgGUID: U9Rx/ZhNTYqtc//X0vwHNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100505841"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.97.233])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 22:42:38 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 Piotr Piorkowski <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH 3/3] drm/xe/vf: Don't apply Wa_22019338487 for VF
Date: Wed, 11 Dec 2024 07:42:11 +0100
Message-Id: <20241211064211.781820-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241211064211.781820-1-marcin.bernatowicz@linux.intel.com>
References: <20241211064211.781820-1-marcin.bernatowicz@linux.intel.com>
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

Don't use Wa_22019338487 for VF.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piorkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_wa_oob.rules | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 3ed12a85cc60..40438c3d9b72 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -34,7 +34,7 @@
 		GRAPHICS_VERSION(2004)
 22019338487	MEDIA_VERSION(2000)
 		GRAPHICS_VERSION(2001)
-		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
+		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_not_sriov_vf)
 22019338487_display	PLATFORM(LUNARLAKE)
 16023588340	GRAPHICS_VERSION(2001)
 14019789679	GRAPHICS_VERSION(1255)
-- 
2.31.1

