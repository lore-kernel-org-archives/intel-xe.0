Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44879CDD548
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 16:34:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CDB110E290;
	Wed, 18 Sep 2024 16:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lgA5bbuI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE1510E290
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 16:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726677262; x=1758213262;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5bsPXyQl162HOc3kxKj3OyvWR3EgwqRDH180VZ2R5i8=;
 b=lgA5bbuIt5GbI5WDGyNuXOc/uOh6Kq6Q+O5z4TOOOR8IAxwq+htzOYlL
 o/jKtR2uBj/E5otCWxyXSy2PARaCM4BbykckJ/5X8yCxkj2wj0EGMWrVl
 cjmMA8hJPQMK6ENNT8+gYZ+8t2/byLKjFEfxt7PWcy1kEnYHMnxx9bisg
 TLobGY09r+HAUwXxwFUVpY0yu8560u+UjxQtlSx+opBTqjnxM5Hm5yxFw
 DxjKBLR/0ZmmHBUHXNZFWQljH3pMPFOH3NjJ+o8WncNvwVUEL3hrB0+Wo
 6VWRjiu/bG1TbRC4RO55bp8rYVzpWi1TKiV/k8NUkykeAsv8mkxWc7qOt g==;
X-CSE-ConnectionGUID: 2jrMEPQrTwa1M5cvkLmEfg==
X-CSE-MsgGUID: ogyxKX2UQjqiSR/HHSiF7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="13577658"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="13577658"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 09:34:22 -0700
X-CSE-ConnectionGUID: 5Njn6CrsTlyD7XfP4uBfug==
X-CSE-MsgGUID: Sw0Pf0DTRb+OB9MvvEIDFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="70473171"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 09:34:22 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dakr@redhat.com
Subject: [PATCH] drm/gpuvm: merge adjacent gpuva range during a map operation
Date: Wed, 18 Sep 2024 12:47:40 -0400
Message-Id: <20240918164740.3955915-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
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

Considder this example. Before a map operation, the gpuva ranges
in a vm looks like below:

 VAs | start              | range              | end                | object             | object offset
-------------------------------------------------------------------------------------------------------------
     | 0x0000000000000000 | 0x00007ffff5cd0000 | 0x00007ffff5cd0000 | 0x0000000000000000 | 0x0000000000000000
     | 0x00007ffff5cf0000 | 0x00000000000c7000 | 0x00007ffff5db7000 | 0x0000000000000000 | 0x0000000000000000

Now user want to map range [0x00007ffff5cd0000 - 0x00007ffff5cf0000).
With existing codes, the range walking in __drm_gpuvm_sm_map won't
find any range, so we end up a single map operation for range
[0x00007ffff5cd0000 - 0x00007ffff5cf0000). This result in:

 VAs | start              | range              | end                | object             | object offset
-------------------------------------------------------------------------------------------------------------
     | 0x0000000000000000 | 0x00007ffff5cd0000 | 0x00007ffff5cd0000 | 0x0000000000000000 | 0x0000000000000000
     | 0x00007ffff5cd0000 | 0x0000000000020000 | 0x00007ffff5cf0000 | 0x0000000000000000 | 0x0000000000000000
     | 0x00007ffff5cf0000 | 0x00000000000c7000 | 0x00007ffff5db7000 | 0x0000000000000000 | 0x0000000000000000

The correct behavior is to merge those 3 ranges. So __drm_gpuvm_sm_map
is slightly modified to handle this corner case. The walker is changed
to find the range just before or after the mapping request, and merge
adjacent ranges using unmap and map operations. with this change, the
end result of above example is as below:

 VAs | start              | range              | end                | object             | object offset
-------------------------------------------------------------------------------------------------------------
     | 0x0000000000000000 | 0x00007ffff5db7000 | 0x00007ffff5db7000 | 0x0000000000000000 | 0x0000000000000000

Even though this fixes a real problem, the codes looks a little ugly.
So I welcome any better fix or suggestion.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 62 +++++++++++++++++++++++++------------
 1 file changed, 43 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 4b6fcaea635e..51825c794bdc 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2104,28 +2104,30 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 {
 	struct drm_gpuva *va, *next;
 	u64 req_end = req_addr + req_range;
+	u64 merged_req_addr = req_addr;
+	u64 merged_req_end = req_end;
 	int ret;
 
 	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req_addr, req_range)))
 		return -EINVAL;
 
-	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req_addr, req_end) {
+	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req_addr - 1, req_end + 1) {
 		struct drm_gem_object *obj = va->gem.obj;
 		u64 offset = va->gem.offset;
 		u64 addr = va->va.addr;
 		u64 range = va->va.range;
 		u64 end = addr + range;
-		bool merge = !!va->gem.obj;
+		bool merge;
 
 		if (addr == req_addr) {
-			merge &= obj == req_obj &&
+			merge = obj == req_obj &&
 				 offset == req_offset;
 
 			if (end == req_end) {
 				ret = op_unmap_cb(ops, priv, va, merge);
 				if (ret)
 					return ret;
-				break;
+				continue;
 			}
 
 			if (end < req_end) {
@@ -2162,22 +2164,33 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 			};
 			struct drm_gpuva_op_unmap u = { .va = va };
 
-			merge &= obj == req_obj &&
-				 offset + ls_range == req_offset;
+			merge = (obj && obj == req_obj &&
+				 offset + ls_range == req_offset) ||
+				 (!obj && !req_obj);
 			u.keep = merge;
 
 			if (end == req_end) {
 				ret = op_remap_cb(ops, priv, &p, NULL, &u);
 				if (ret)
 					return ret;
-				break;
+				continue;
 			}
 
 			if (end < req_end) {
-				ret = op_remap_cb(ops, priv, &p, NULL, &u);
-				if (ret)
-					return ret;
-				continue;
+				if (end == req_addr) {
+					if (merge) {
+						ret = op_unmap_cb(ops, priv, va, merge);
+						if (ret)
+							return ret;
+						merged_req_addr = addr;
+						continue;
+					}
+				} else {
+					ret = op_remap_cb(ops, priv, &p, NULL, &u);
+					if (ret)
+						return ret;
+					continue;
+				}
 			}
 
 			if (end > req_end) {
@@ -2195,15 +2208,16 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				break;
 			}
 		} else if (addr > req_addr) {
-			merge &= obj == req_obj &&
+			merge = (obj && obj == req_obj &&
 				 offset == req_offset +
-					   (addr - req_addr);
+					   (addr - req_addr)) ||
+				 (!obj && !req_obj);
 
 			if (end == req_end) {
 				ret = op_unmap_cb(ops, priv, va, merge);
 				if (ret)
 					return ret;
-				break;
+				continue;
 			}
 
 			if (end < req_end) {
@@ -2225,16 +2239,26 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 					.keep = merge,
 				};
 
-				ret = op_remap_cb(ops, priv, NULL, &n, &u);
-				if (ret)
-					return ret;
-				break;
+				if (addr == req_end) {
+					if (merge) {
+						ret = op_unmap_cb(ops, priv, va, merge);
+						if (ret)
+							return ret;
+						merged_req_end = end;
+						break;
+					}
+				} else {
+					ret = op_remap_cb(ops, priv, NULL, &n, &u);
+					if (ret)
+						return ret;
+					break;
+				}
 			}
 		}
 	}
 
 	return op_map_cb(ops, priv,
-			 req_addr, req_range,
+			 merged_req_addr, merged_req_end - merged_req_addr,
 			 req_obj, req_offset);
 }
 
-- 
2.26.3

