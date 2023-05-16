Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E393DC77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 14:47:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C1610E271;
	Tue, 16 May 2023 14:47:51 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546DE10E271
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 14:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684248469; x=1715784469;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XEd/v8pTqPWUXv3gkMiRyJPim3uu0zlv4fAu0DH8Z4k=;
 b=BjWN5bu3jtuVcWdxXWihFOqAGeVeqvhXgV45lKiQjeVA8syL2BCmurTo
 2pu7Ai78QFWIQ1rvQTDt/Y4dSc53PiVnT4szJJ6bhKsmoiVz7G3QpJ8yg
 X/IPW6B1O+0wmSEm99bFBVhcHLODmxlzx/+3UjO2e9X9jC20B0/UZ5Rx3
 fsBbKpCcZwVF7qfY7wt9I88TpqW3IgWlbVdzILjG6v+gswI4+3oQ77zc1
 Hyb4XD827ygfMOgWIcl7FxHgebJ6rw4+pWt4EJ9rMONSwqEUUvJ1uWBN1
 4xGI8ccKmPnoAoPJxZTUI6AQ93AnqwdhQGEvE+nExgjpgIm6u1aOpIcb3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="340865864"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="340865864"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 07:47:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="1031315111"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="1031315111"
Received: from aboreiko-mobl3.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.22])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 07:47:43 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 16 May 2023 16:47:28 +0200
Message-Id: <20230516144730.38898-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/2] drm/xe: Fix unprotected rebind_list
 accesses
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

Each VM has two rebind lists, one protected by the VM resv, the other
one protected essentially by the VM notifier.list_lock. This series
intends to fix two points of illegal access.

Patch 1 fixes an access of VM rebind_lists' link without the VM resv held.
Patch 2 fixes an issue where the VMA may not be removed from the
VM notifier.rebind_list on VMA destruction.

v2:
- Remove a code comment. (Matthew Brost)

v3:
- Introduce as fixup patches.

Thomas Hellström (2):
  fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
  fixup! drm/xe: Introduce a new DRM driver for Intel GPUs

 drivers/gpu/drm/xe/xe_vm.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

-- 
2.39.2

