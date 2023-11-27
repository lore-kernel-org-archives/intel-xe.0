Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712FAC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 15:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4618710E2BF;
	Mon, 27 Nov 2023 15:03:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0953A10E2BF
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 15:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701097428; x=1732633428;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZW0D1ZMDnJBhvAgIPZ009sv1vXwWrBnir5UILduAywE=;
 b=QGHumNr1KPeFGGC2rGlxRXBkxUk5yG8bii3eMHocOMyoqWL+Yvg/lQha
 tnbfOeMjlp415o6GLx4p4i1Ed0d2yH8vGpDZ7O8/MBf5w8RyDWthC+8/6
 eBsNoIWPsF/K1xgpJnz1R73GpABwb3BeYbWxeCbkuPPZQCrSHzHRVWBK7
 vPYqvjh8OPS/4NYXqZPnlTqX/mJtlGFkcnio9SzEWAcDJwCuADOgzcMLO
 VNr7ZbyusZq2VWrDrXsMeJNMl/j1ONnQuOvWxfwoTFVviborCi4KAFcTg
 dWx54DaUllFtSJ5d21KpSm7bTiL1r84wPo3EnnBEUw4XbEwsIvXxV6rv3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="377752758"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="377752758"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:03:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="761616444"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="761616444"
Received: from mstribae-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.187])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:03:45 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Nov 2023 16:03:29 +0100
Message-ID: <20231127150330.38041-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/1] drm/xe/uapi: Use LR abbrev for
 long-running VMs
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Single patch cover-letter to test with modified IGT:

Test-with: 20231127130526.30012-1-thomas.hellstrom@linux.intel.com

Thomas Hellström (1):
  drm/xe/uapi: Use LR abbrev for long-running vms

 drivers/gpu/drm/xe/xe_vm.c |  8 ++++----
 include/uapi/drm/xe_drm.h  | 23 ++++++++++++++++++++++-
 2 files changed, 26 insertions(+), 5 deletions(-)

-- 
2.41.0

