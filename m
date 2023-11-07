Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808A9C0018C
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 12:01:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386A310E510;
	Tue,  7 Nov 2023 12:01:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C3010E13D
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 12:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699358478; x=1730894478;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i8dvgLMb50+B5vCBfIEIrHQ2QfwlPheSsdaPMyVPv8M=;
 b=MBdPOrOZJW67aRQjo0oSV2e5Dzi9EZFM8Cgg19MR+SeAPq/lFAcxfooM
 P+Xt/0wmi3BbCWktRMk2S7L/OcTvOK7oKr5Fc567JPzdsYRMnIl1c8/FM
 fXrP9M3E7VAdQAUHAf+hCRclsBndTx44rDpP7duxeoJLOkGrAFbLJzlar
 EIN8uFsF93f1Ixhzn5oEzRzVLBbBo3MT+XP5I81pDd6BeC/glQSS6xWt1
 9GJTbpu0PFzdTHMtt1mVROO50cJMQK4JgHQKi1aLKqkn0sKG0wqZdMZaZ
 JtEdbroBoJKRZmsCu/vNpuNnp763/Z8cAcWRwMt+SPEpqyJwXDxI41krc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="11032743"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="11032743"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 04:01:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="756158980"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="756158980"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 04:01:11 -0800
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Tue,  7 Nov 2023 13:55:57 +0200
Message-Id: <20231107115559.248879-1-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/2] drm/xe/gsc: enable pvc support
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
Cc: Tomas Winkler <tomas.winkler@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Enable support of HECI GSC for PVC platform.
Move HECI GSC initialization after GT initialize interrupts.

V2: annotate patch to move init code as fixup

Alexander Usyskin (2):
  drm/xe/gsc: enable pvc support
  fixup! drm/xe/gsc: add gsc device support

 drivers/gpu/drm/xe/regs/xe_regs.h |  1 +
 drivers/gpu/drm/xe/xe_device.c    |  4 ++--
 drivers/gpu/drm/xe/xe_heci_gsc.c  | 11 ++++++++++-
 drivers/gpu/drm/xe/xe_pci.c       |  1 +
 4 files changed, 14 insertions(+), 3 deletions(-)

-- 
2.34.1

