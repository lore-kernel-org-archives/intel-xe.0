Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A77CC282EC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 07:38:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCFE10E980;
	Fri, 14 Mar 2025 07:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hCX37xeG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C75910E980
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 07:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741937917; x=1773473917;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3EQaJC7ftMNKi2/cV7UxzLPUkarz7JAPRS7DuNUy5D8=;
 b=hCX37xeGXpl3zDjPOH2BwXJ0NLNlKHfqJLj68p8kOy9OjlXdHfRwlACZ
 uUUE7gLD/XJ1MMz5HyR7y+gRec0Nn8D8VtJg/2/Pi4L/lCbeTS0OwVtJI
 1aPFUoygK2z6kfhUzgDoBFAAfRM2f5yDVr7c4reVaNyJ20dD44/nXAcng
 ZMk9V7tJyGU17O7Y2rkmdL7wZrXnDxYgU2ci+Dx8vfUJEKv1aVkNMEDuo
 B2BDWmEId2zJLbFpFFDYhFMzbIE4pR4KymfcgiCwJ4xGKLmR7N8ei4xe9
 XH2W4txAljj+fA0YE/+ACUfoGT1TOd025ok0HUgfhSZZML8oMRcmko2W0 w==;
X-CSE-ConnectionGUID: 5mRVBcR0RWOcKSeJ/GJ/7g==
X-CSE-MsgGUID: JFSrTBsFRFyjI2N4BcnxNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68446023"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68446023"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:38:37 -0700
X-CSE-ConnectionGUID: Phk09OS6RuuctuoE6Z/big==
X-CSE-MsgGUID: 0aUmD7VnS1aaPPSm6nAvIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="152043792"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 14 Mar 2025 00:38:35 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Danilo Krummrich <dakr@redhat.com>
Subject: [RFC 13/29] drm/gpuvm: Introduce MADVISE Operations
Date: Fri, 14 Mar 2025 13:32:10 +0530
Message-Id: <20250314080226.2059819-14-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
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

Introduce MADVISE operations that do not unmap the GPU VMA. These
operations split VMAs if the start or end addresses fall within existing
VMAs. The operations can create up to 2 REMAPS and 2 MAPs.

If the input range is within the existing range, it creates REMAP:UNMAP,
REMAP:PREV, REMAP:NEXT, and MAP operations for the input range.
  Example:
  Input Range: 0x00007f0a54000000 to 0x00007f0a54400000
  GPU VMA: 0x0000000000000000 to 0x0000800000000000
  Operations Result:
  - REMAP:UNMAP: addr=0x0000000000000000, range=0x0000800000000000
  - REMAP:PREV: addr=0x0000000000000000, range=0x00007f0a54000000
  - REMAP:NEXT: addr=0x00007f0a54400000, range=0x000000f5abc00000
  - MAP: addr=0x00007f0a54000000, range=0x0000000000400000

If the input range starts at the beginning of one GPU VMA and ends at
the end of another VMA, covering multiple VMAs, the operations do nothing.
  Example:
  Input Range: 0x00007fc898800000 to 0x00007fc899000000
  GPU VMAs:
  - 0x0000000000000000 to 0x00007fc898800000
  - 0x00007fc898800000 to 0x00007fc898a00000
  - 0x00007fc898a00000 to 0x00007fc898c00000
  - 0x00007fc898c00000 to 0x00007fc899000000
  - 0x00007fc899000000 to 0x00007fc899200000
  Operations Result: None

Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 175 +++++++++++++++++++++++++++++++++++-
 include/drm/drm_gpuvm.h     |   6 ++
 2 files changed, 180 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index f9eb56f24bef..904a26641b21 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2230,7 +2230,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				ret = op_remap_cb(ops, priv, NULL, &n, &u);
 				if (ret)
 					return ret;
-				break;
+				return 0;
 			}
 		}
 	}
@@ -2240,6 +2240,143 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 			 req_obj, req_offset);
 }
 
+static int
+__drm_gpuvm_skip_split_map(struct drm_gpuvm *gpuvm,
+			   const struct drm_gpuvm_ops *ops, void *priv,
+			   u64 req_addr, u64 req_range,
+			   bool skip_gem_obj_va, u64 req_offset)
+{
+	struct drm_gpuva *va, *next;
+	u64 req_end = req_addr + req_range;
+	int ret;
+
+	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req_addr, req_range)))
+		return -EINVAL;
+
+	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req_addr, req_end) {
+		struct drm_gem_object *obj = va->gem.obj;
+		u64 offset = va->gem.offset;
+		u64 addr = va->va.addr;
+		u64 range = va->va.range;
+		u64 end = addr + range;
+
+		if (addr == req_addr) {
+			if (end == req_end)
+				return 0;
+
+			if (end < req_end)
+				continue;
+
+			if (end > req_end) {
+				if (skip_gem_obj_va && !!obj)
+					return 0;
+
+				struct drm_gpuva_op_map n = {
+					.va.addr = req_end,
+					.va.range = range - req_range,
+					.gem.obj = obj,
+					.gem.offset = offset + req_range,
+				};
+				struct drm_gpuva_op_unmap u = {
+					.va = va,
+					.keep = false,
+				};
+
+				ret = op_remap_cb(ops, priv, NULL, &n, &u);
+				if (ret)
+					return ret;
+
+				break;
+			}
+		} else if (addr < req_addr) {
+			u64 ls_range = req_addr - addr;
+			struct drm_gpuva_op_map p = {
+				.va.addr = addr,
+				.va.range = ls_range,
+				.gem.obj = obj,
+				.gem.offset = offset,
+			};
+			struct drm_gpuva_op_unmap u = { .va = va, .keep = false, };
+
+			if (end == req_end) {
+				if (skip_gem_obj_va && !!obj)
+					return 0;
+
+				ret = op_remap_cb(ops, priv, &p, NULL, &u);
+				if (ret)
+					return ret;
+				break;
+			}
+
+			if (end < req_end) {
+				if (skip_gem_obj_va && !!obj)
+					continue;
+
+				ret = op_remap_cb(ops, priv, &p, NULL, &u);
+				if (ret)
+					return ret;
+
+				ret = op_map_cb(ops, priv, req_addr,
+						min(end - req_addr, req_end - end),
+						NULL, req_offset);
+				if (ret)
+					return ret;
+				continue;
+			}
+
+			if (end > req_end) {
+				if (skip_gem_obj_va && !!obj)
+					return 0;
+
+				struct drm_gpuva_op_map n = {
+					.va.addr = req_end,
+					.va.range = end - req_end,
+					.gem.obj = obj,
+					.gem.offset = offset + ls_range +
+						      req_range,
+				};
+
+				ret = op_remap_cb(ops, priv, &p, &n, &u);
+				if (ret)
+					return ret;
+				break;
+			}
+		} else if (addr > req_addr) {
+			if (end == req_end)
+				return 0;
+
+			if (end < req_end)
+				continue;
+
+			if (end > req_end) {
+				if (skip_gem_obj_va && !!obj)
+					return 0;
+
+				struct drm_gpuva_op_map n = {
+					.va.addr = req_end,
+					.va.range = end - req_end,
+					.gem.obj = obj,
+					.gem.offset = offset + req_end - addr,
+				};
+				struct drm_gpuva_op_unmap u = {
+					.va = va,
+					.keep = false,
+				};
+
+				ret = op_remap_cb(ops, priv, NULL, &n, &u);
+				if (ret)
+					return ret;
+				return op_map_cb(ops, priv, addr,
+						 (req_end - addr), NULL, req_offset);
+			}
+		}
+	}
+
+	return op_map_cb(ops, priv,
+			 req_addr, req_range,
+			 NULL, req_offset);
+}
+
 static int
 __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
 		     const struct drm_gpuvm_ops *ops, void *priv,
@@ -2548,6 +2685,42 @@ drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_ops_create);
 
+struct drm_gpuva_ops *
+drm_gpuvm_madvise_ops_create(struct drm_gpuvm *gpuvm,
+			     u64 req_addr, u64 req_range,
+			     bool skip_gem_obj_va, u64 req_offset)
+{
+	struct drm_gpuva_ops *ops;
+	struct {
+		struct drm_gpuvm *vm;
+		struct drm_gpuva_ops *ops;
+	} args;
+	int ret;
+
+	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
+	if (unlikely(!ops))
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&ops->list);
+
+	args.vm = gpuvm;
+	args.ops = ops;
+
+	ret = __drm_gpuvm_skip_split_map(gpuvm, &gpuvm_list_ops, &args,
+					 req_addr, req_range,
+					 skip_gem_obj_va, req_offset);
+
+	if (ret || list_empty(&ops->list))
+		goto err_free_ops;
+
+	return ops;
+
+err_free_ops:
+	drm_gpuva_ops_free(gpuvm, ops);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_madvise_ops_create);
+
 /**
  * drm_gpuvm_sm_unmap_ops_create() - creates the &drm_gpuva_ops to split on
  * unmap
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 2a9629377633..e521ebabab9e 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1062,6 +1062,12 @@ struct drm_gpuva_ops *
 drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
 			    u64 addr, u64 range,
 			    struct drm_gem_object *obj, u64 offset);
+
+struct drm_gpuva_ops *
+drm_gpuvm_madvise_ops_create(struct drm_gpuvm *gpuvm,
+			     u64 addr, u64 range,
+			     bool skip_gem_obj_va, u64 offset);
+
 struct drm_gpuva_ops *
 drm_gpuvm_sm_unmap_ops_create(struct drm_gpuvm *gpuvm,
 			      u64 addr, u64 range);
-- 
2.34.1

