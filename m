Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45C6C47DA2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 12:28:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F91510E640;
	Wed, 17 Jan 2024 12:28:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F72810E640
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 12:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705494494; x=1737030494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PYah6NNqvdyVlBeVxagcr7w8lI/aUWQmKtZyS82VZsU=;
 b=Cus+oY2vqjRDCZs+fkT1y/BjWdDtXHZw5SZ2caij72YLLeyjtm10POul
 1XqSPh1sCR58gCNPohn9ig5DYYaieieLRuCMKLKJU+L7VTpfmNLzNPbyB
 3NSbL3+AonD+MFOPHhtOiIR2J7g9UkaeztW2CY3XD8bL00eJjGboUnQC4
 tu3cUOgjT3MoQ49fiPNyfpAzGsWxgur1c7dKrCLHNKaNGfpcKmXJp1XNC
 JJlzHWpXl1bilVk3fCS4rkkORA55aCt/R0aZABB5nhqTs1fUCOkb2Nlz3
 ys5MNdzDwcU2/rWVE3ehF9JIwKqk7Kbbbk0jHxsWZb72AAtR52EY0Dn10 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="43986"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="43986"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 04:21:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="784502343"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="784502343"
Received: from msznigir-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.38.230])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 04:21:06 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/5] drm/xe: make gpuvm_ops const
Date: Wed, 17 Jan 2024 14:20:43 +0200
Message-Id: <20240117122044.1544174-4-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240117122044.1544174-1-jani.nikula@intel.com>
References: <20240117122044.1544174-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Place the function pointers in rodata.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 10b6995fbf29..64558a95418c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1054,7 +1054,7 @@ static struct drm_gpuva_op *xe_vm_op_alloc(void)
 
 static void xe_vm_free(struct drm_gpuvm *gpuvm);
 
-static struct drm_gpuvm_ops gpuvm_ops = {
+static const struct drm_gpuvm_ops gpuvm_ops = {
 	.op_alloc = xe_vm_op_alloc,
 	.vm_bo_validate = xe_gpuvm_validate,
 	.vm_free = xe_vm_free,
-- 
2.39.2

