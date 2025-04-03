Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC75C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 10:24:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8162A10E996;
	Thu,  3 Apr 2025 10:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LITgPh3u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 718E710E996
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 10:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743675893; x=1775211893;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5pY68O1v9n0WkAGOZ0RbTRYdNa6SeQJwUD9ZMwB2HxM=;
 b=LITgPh3udOTrI7d/M7+g+z8/K1rU+y+/06q8h7Uap2XRKnD/yTzJ8tUb
 b6SKzUriIlUVFHVnzpiCkOm5sZC9B+9fUS+T1iIRU5XUQltutpaFd1jbC
 1WYN6UFuiXU/T7lciEGzGczzHmJGnt4/01VvROBt4C6NLBueXMeFhW+RY
 3TI8c0P6UtIc7VYy7HS0fsgz6WSnvLKJq1S+Mt/XWBaDIHSi30pqOCqNr
 MFfX4H48MqVSFIWfu4nA8v0tftRUPJxFUkGp/BRV3FzJFEmZGxzpAyAkh
 +llutOlLm9qJBQAv8MoheZUPmj7CUARoMebSK8CR/7sl8HUYRopcLKHJI w==;
X-CSE-ConnectionGUID: zKNai61YRbWcjmZQVHVWvA==
X-CSE-MsgGUID: KLT6Gp+9S4O2Ubhq+zdpig==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="62475408"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="62475408"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:24:52 -0700
X-CSE-ConnectionGUID: AB4vRihxSEi6OtLjGCOCfg==
X-CSE-MsgGUID: HlqQ+P0wQNmm/ryg6iLQbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="132166741"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.142])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:24:51 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 0/7] Improve SRIOV VRAM provisioning
Date: Thu,  3 Apr 2025 11:24:41 +0100
Message-ID: <20250403102440.266113-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
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

Support non-contig VRAM for pinned kernel objects. Main current usecase is
when provisioning VRAM for SRIOV usecase (final patch). Currently we are
artificially limited to using contig VRAM, however the allocations here are
very large and the contig restriction can result in failing to provision
the VF, even when there is enough free space (we just need at least 2M
pages).

v2:
 - Various fixes for CI reported issues.
v3:
 - suspend/resume and various other fixes.
v4:
 - drop one bogus assert.
 - rebase on the newly merged apply-to-pinned infra.
v5:
 - rebase on newly merged dma-unmap on unplug, which interacts with
   the pinned lists.
v6:
 - Small fix in patch 4, where I missed restoring the kernel bo late list
   for igpu, which is needed for hibernation and GGTT restore.

-- 
2.49.0

