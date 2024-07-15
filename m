Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54ECC3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 10:39:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DB310E33A;
	Mon, 15 Jul 2024 10:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CHuz0Wdn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3278B10E33A
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jul 2024 10:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721039939; x=1752575939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vfOi+H+KkcXleCit7DH72Xm62Nvbb6V+YPGhQQLDaIs=;
 b=CHuz0Wdn43MDRUlf/O+XXEKIxexwhpNpv3cg1NSKT7ylDDoTSiHzzOch
 pnyGI7b4m+Mj5b89nRZ2E11wDbCrw64WWwIkZhJajzFAafxhgq0tSSOb4
 c8M5kLNMgzazCfcxQefzeHfWiwDAxnkoeNWr0KopWV4a5m6ZoE1g+IsMe
 VopzBFNrSWgW6hI7Qdboi2l51dmnzrC4EuuJRJUo3JTZDVhhCaQuyHVlm
 mcTbdViyoG6h6O5rAuYXuaLfM16t1+YV9k+Be+TMODFFCYiocFrziqyas
 OogCOpC3DUOU+eaJ+ljFFOTxoRKZFPG8Sam1lpDeZCaGmPKkazw3FKsw2 A==;
X-CSE-ConnectionGUID: rhBVxKWCRTyvOhCSD6bpkA==
X-CSE-MsgGUID: qI1bLaMEQsiiY4WJuWMTVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="18025539"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="18025539"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 03:38:59 -0700
X-CSE-ConnectionGUID: NWIp8oM1Qau+eywX8zFIBQ==
X-CSE-MsgGUID: tnS+itDTSq+hEWqMmCdxJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="53954494"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa005.fm.intel.com with ESMTP; 15 Jul 2024 03:38:58 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH 2/2] drm/xe: Remove function xe_device_canonicalize_addr
Date: Mon, 15 Jul 2024 16:25:55 +0530
Message-Id: <20240715105555.2220444-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240715105555.2220444-1-himal.prasad.ghimiray@intel.com>
References: <20240715105555.2220444-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

There is no need for converting regular address to canonical address in
driver, therefore remove unused xe_device_canonicalize_addr.

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 5 -----
 drivers/gpu/drm/xe/xe_device.h | 1 -
 2 files changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 06cebaffb451..eb3bb434b180 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -885,11 +885,6 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p)
 	}
 }
 
-u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address)
-{
-	return sign_extend64(address, xe->info.va_bits - 1);
-}
-
 u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
 {
 	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 0a2a3e7fd402..14d4171c467e 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -158,7 +158,6 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
 void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
 
-u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
 u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
 
 void xe_device_td_flush(struct xe_device *xe);
-- 
2.34.1

