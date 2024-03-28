Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906B7C54E64
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 14:38:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F90F10E18E;
	Thu, 28 Mar 2024 14:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KGcRxFXF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A804810E18E
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 14:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711636681; x=1743172681;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mkEmHaTLj7by7T6wYbEv+Djw65UYMK9PCMPCjQYV1g4=;
 b=KGcRxFXFVuWuwuS/OwiTgea/2PZV4m/Vg9UARMj5Dlms7T/RYvIkFU4U
 uFk6QezsHWULMfnoazAEoootsmpaVGBFtDPg5P118BEJZObaGrgKGQtrX
 IwBQrE+migrRKwjatreqdzslf0m7jG0XAwue9ZWK76Uky9IgGv7Y/nDf/
 BWfShV5rSaWAHOvY0QGpKokrA56wI9nWxy6GNHShvBQu8lqnD30lr9eeH
 P2m6+va6HsagG1kBB4FKpFESszRp+/6SCTPF7XpwFCvp6lV3mI8XRee1T
 jmw+cElEOpPXXl+3aoQiTBupBrWRQ4znxqo4W1FdL0ifif/XR3wYQRLyD w==;
X-CSE-ConnectionGUID: OJfRHn2JS6atrIwEEEjdSg==
X-CSE-MsgGUID: 9lCU+E5aSQi4AASgisFipw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6680959"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6680959"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 07:38:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="17059849"
Received: from jattlan-mobl1.ger.corp.intel.com (HELO b65212f6ad00.intel.com)
 ([10.252.56.46])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 07:38:00 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v1 0/1] Restore flags VM_BIND_FLAG_READONLY and
 VM_BIND_FLAG_IMMEDIATE
Date: Thu, 28 Mar 2024 14:37:41 +0000
Message-Id: <20240328143742.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
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

This restores some flags for VM bind that will be used by the
compute runtime, see pending pull request [1].

[1] https://github.com/intel/compute-runtime/pull/717

Francois Dugast (1):
  drm/xe/uapi: Restore flags VM_BIND_FLAG_READONLY and
    VM_BIND_FLAG_IMMEDIATE

 drivers/gpu/drm/xe/xe_vm.c       | 13 +++++++++++--
 drivers/gpu/drm/xe/xe_vm_types.h |  4 ++++
 include/uapi/drm/xe_drm.h        |  6 ++++++
 3 files changed, 21 insertions(+), 2 deletions(-)

-- 
2.34.1

