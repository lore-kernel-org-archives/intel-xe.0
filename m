Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7933C3DA64
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 20:34:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBAB10E0AE;
	Thu,  1 Aug 2024 20:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EoGVOo3l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C50A10E0AE
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 20:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722544467; x=1754080467;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=96KgGQfdatOXS8znIwWrfScl7W2r3m72Q/tZxQg6mJE=;
 b=EoGVOo3lEYIP+/v8AjOiKuH0uFHvPLP1JL6kbu3bElrOYUCgWEDM30Xt
 Mno7QICum1R0Cg18qJ8yA7+jnZUvRqpvZKd3AsmnCD5GwGW7ATlvErJHr
 druwjmBfXcgQ+K4AnkW3eJRT+0blffEOOWelg/kcaef3HgM6rlCHvnC4p
 jIUJZ8KKJzXlbytFF4BZC06ZnQUhnihCd3+QkekHY9DFLcixPjj2fm6Ks
 UvZY8lNc+tGZARgFqZYlz3EYEb2o7Fu9qI3z+J0SoP6hoVkxyeIGi3VRu
 XS1EGLtDkxasl14xHCOZEg26Fo/fKDiJqVp1z6JGnl6ILj0TWEVVSqN/v A==;
X-CSE-ConnectionGUID: aZQh1i7bSTCgrzsPqCnP0A==
X-CSE-MsgGUID: Tb+5H4mISl2z7ll6LnD8vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31164038"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="31164038"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 13:34:13 -0700
X-CSE-ConnectionGUID: +1pZ+oetTjCxn74wMAhnCA==
X-CSE-MsgGUID: eHn3mX2xQTita+f/CQwaRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="55949376"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 13:34:13 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH xe-for-ci 3/3] drm/xe/guc: Pick for-ci GuC firmware for PVC
Date: Thu,  1 Aug 2024 13:33:41 -0700
Message-ID: <20240801203341.3042386-3-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240801203341.3042386-1-julia.filipchuk@intel.com>
References: <20240801203341.3042386-1-julia.filipchuk@intel.com>
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

From: John Harrison <John.C.Harrison@Intel.com>

UAPI version 1.10.2.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 89bea1461d20..e1d91fa07f5a 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -109,6 +109,7 @@ struct fw_blobs_by_type {
 	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
 	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
+	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 24, 0))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 2))	\
 	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
-- 
2.45.2

