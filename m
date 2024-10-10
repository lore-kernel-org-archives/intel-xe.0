Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDECCFC5E2
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 17:27:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7F410E97C;
	Thu, 10 Oct 2024 17:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kR0kzDGu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB57810E97C
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 17:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728581275; x=1760117275;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VTEMahXznQQdkRCOg+dLxT9y8WCuLTY2sT21t53w0YM=;
 b=kR0kzDGutwHVjcNEaaOEEasxPsNEnRXMHUqDN0isErcgPoGjx02l8iyv
 oVA3cyAAL9tdAL4VD0gSyS6J+5grM/PyzJNmIqXu+JpZoWbNrCoTtbFAB
 svsJZS/Z38WBhMK2EvCq2EcWyd2AHP5VhZx8u1IOUgkn/XJ78oYQ9SIBQ
 TbLfu6whFi750brnO9RV1Q36UPj6yFqrDqMXOAfSSTfWFT2Cgf2aQgnUT
 fxgkpCm4QzOrYnd0uC2gipoqS6mEkXSmHxlEtRngoGkYQsJA4JnPlpOF7
 a9GDHbvKYFhVD/BVRxnKDJDSvMT+gjIxAMU/DkUJcXEC56Ufix0ssUSOL Q==;
X-CSE-ConnectionGUID: mfwztgc/TyCAqRmbRbrw4A==
X-CSE-MsgGUID: sf4078xVTtKVtLiHNFHTbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="39352854"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="39352854"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 10:27:55 -0700
X-CSE-ConnectionGUID: PyoOOn6YRh+TnIbs5nPDUg==
X-CSE-MsgGUID: c91/nvMpQEatyxdxP3l0kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="77144886"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 10:27:55 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Fei Yang <fei.yang@intel.com>
Subject: [PATCH 0/1] drm/xe: enable lite restore
Date: Thu, 10 Oct 2024 10:31:41 -0700
Message-Id: <20241010173142.425498-1-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
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

From: Fei Yang <fei.yang@intel.com>

The lite restore feature is supposed to be enabled by default.

Signed-off-by: Fei Yang <fei.yang@intel.com>

Fei Yang (1):
  drm/xe: enable lite restore

 drivers/gpu/drm/xe/xe_guc.c      | 2 +-
 drivers/gpu/drm/xe/xe_guc_fwif.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.25.1

