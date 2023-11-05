Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4CBC4332F
	for <intel-xe@archiver.kernel.org>; Sun,  5 Nov 2023 10:58:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D754110E106;
	Sun,  5 Nov 2023 10:58:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E8010E0E6
 for <intel-xe@lists.freedesktop.org>; Sun,  5 Nov 2023 10:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699181906; x=1730717906;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pbvx18WOVVUCLP6MLRFVyoj/m8FVXpT4KqQ2E3+neLQ=;
 b=FTvjPijMEpf/g/pnH5rtmlVAP2mHwEki0pBcKXn4qxOu8LbzMS0/K02Q
 FuRq0avN2EGnkjWiQ1mtK3nHqkB6vingt8CYAZRFmLwEKE0MoExkKC+Y9
 qNeHpnFEsPbplRSPYNKd5Vh2ficL2rhqoNYcbkuNYyy13gRWd09EvTnap
 2Fe8SEcPW088JGDPJ/PPJCTq38XB0/YfSdnnXNYK4Zr+PfSXidMF2gKhZ
 XwFCx+dLlRTZsCK3faLCf1ZmGzFyNOoG/SQFBY6lS301Vweot6y2aweSu
 xDCfodUg+dvTL67Fzsk2dlLbh3hUxeBBJVDFqSCsiBCgN41fDrj24B9C0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="379531558"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; d="scan'208";a="379531558"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 02:58:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="935541557"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; d="scan'208";a="935541557"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 02:58:23 -0800
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Sun,  5 Nov 2023 12:53:05 +0200
Message-Id: <20231105105307.3710560-1-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] drm/xe/gsc: enable pvc support
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

Alexander Usyskin (2):
  drm/xe/gsc: enable pvc support
  drm/xe/gsc: init heci gsc after interrupts are ready

 drivers/gpu/drm/xe/regs/xe_regs.h |  1 +
 drivers/gpu/drm/xe/xe_device.c    |  4 ++--
 drivers/gpu/drm/xe/xe_heci_gsc.c  | 11 ++++++++++-
 drivers/gpu/drm/xe/xe_pci.c       |  1 +
 4 files changed, 14 insertions(+), 3 deletions(-)

-- 
2.34.1

