Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EACD132D6
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 14:38:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB6110E44B;
	Mon,  4 Nov 2024 14:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lle8vvFD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D2810E44B
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 14:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730731114; x=1762267114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+KrKT6+/3SAaUzTpYZw7t/2hLdoUEKXcfn+pPLctmIQ=;
 b=lle8vvFDJraZCewhpJlwJqFdAGzQzrnDJOin5bofd/EJbCfafUyUK12L
 YOvI2iJEiDOaTwJddLPlqH94e/ng4HyPw0/sQf+3gXN/3uGipOwRo+tIN
 fXQzHvgEZ7628PZC4XsyksxPZr1KCEdnDBwJ42OTtHZlWX9YMCJO6R319
 RPnfra4tWBOD6rBHP8pudEcW2GfqfvgXpbJyUyi73IlG/m74JYKZDmG17
 eoiby9p1cr4c0HlyQq2CyTDNyaAUnmD8b2Ar+sZnbQLii1KyU6quYm+/k
 T09FkLzNBGOVstH2qQivTAy4AyTl/qP+xZQmzfOhleWwZvK5z2CuIh4vT Q==;
X-CSE-ConnectionGUID: 0vb79mtqTTS2tzVbEQZTbQ==
X-CSE-MsgGUID: vl90B5m6QYqqnWk+QxIwZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="55831411"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="55831411"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 06:38:33 -0800
X-CSE-ConnectionGUID: bva/ZpWBT6yHgEgMP1Zj7g==
X-CSE-MsgGUID: BJ6UrQ8iRECdXbC0XnOUag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="88244310"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 06:38:33 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v3 3/5] drm/xe: Reword exec_queue and vm lock doc
Date: Mon,  4 Nov 2024 06:38:13 -0800
Message-ID: <20241104143815.2112272-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241104143815.2112272-1-lucas.demarchi@intel.com>
References: <20241104143815.2112272-1-lucas.demarchi@intel.com>
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

Reword documentation to possibly what it meant to be.

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index b9ea455d6f59f..cb193234c7eca 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -588,7 +588,7 @@ struct xe_file {
 		/** @vm.xe: xarray to store VMs */
 		struct xarray xa;
 		/**
-		 * @vm.lock: Protects VM lookup + reference and removal a from
+		 * @vm.lock: Protects VM lookup + reference and removal from
 		 * file xarray. Not an intended to be an outer lock which does
 		 * thing while being held.
 		 */
@@ -601,8 +601,8 @@ struct xe_file {
 		struct xarray xa;
 		/**
 		 * @exec_queue.lock: Protects exec queue lookup + reference and
-		 * removal a frommfile xarray. Not an intended to be an outer
-		 * lock which does thing while being held.
+		 * removal from file xarray. Not intended to be an outer lock
+		 * which does things while being held.
 		 */
 		struct mutex lock;
 	} exec_queue;
-- 
2.47.0

