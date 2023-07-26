Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A60FC0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 23:21:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706C210E036;
	Wed, 26 Jul 2023 23:21:46 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12EF10E036
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 23:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690413705; x=1721949705;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6wSgyfBnm5MOywggAUwc5InFThRpj3SEcs1dzkDGa+k=;
 b=V5ONu7wVQbBZKwLPLsIqbohAzPIdw+aHxlTBdLszJDL/H9ohNXAs1EgR
 1vGJEsf8hJL1jnivWhbK/7htJS20w9w7D986pMCm5EfIKmO+wmEYINnrR
 JZ8R23+6BuX/ua2LmiKcduoffJUoLwlFe8ufomGTIyxVSt4jQYqnOWfRU
 PcUKfWHqLRQy9Jw01txsXjm/efY3U6GLeLd1pPUo+tj2wQIRZSkW/kE6m
 lnn4dvo2O1W3voXAGhwdWSfVl1gkoLsKRixlpHkfaBNQMxKk7QQS3srfY
 EJLLSbXL+jlJGfXNga3BHsWck02pHnZefs59uzfsU0HQ8IHE3kNMHzk/r w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="367031368"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="367031368"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 16:21:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="726715209"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="726715209"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga002.jf.intel.com with ESMTP; 26 Jul 2023 16:21:40 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 27 Jul 2023 04:56:47 +0530
Message-Id: <20230726232650.3873897-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v9 0/3] Notify userspace about uevent failure
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

series sends an uevent in case of gt reset failure.
since we have no mechanism to ensure gt reset failure from
hw perspective introducing the fault injection to validate the uevent.

https://gitlab.freedesktop.org/drm/xe/ci/-/commit/5ab4b369758a57b5a799b93c1d5b556c98d9d557
is enabling the config to ensure debugfs creations are succesful.

Tested-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Testcase: https://patchwork.freedesktop.org/series/121391/

udevadm monitor output from PVC:

KERNEL[445.821589] change
/devices/pci0000:89/0000:89:02.0/0000:8a:00.0/0000:8b:01.0/0000:8c:00.0
(pci)
ACTION=change
DEVPATH=/devices/pci0000:89/0000:89:02.0/0000:8a:00.0/0000:8b:01.0/0000:8c:00.0
SUBSYSTEM=pci
DEVICE_STATUS=NEEDS_RESET
TILE_ID=0
GT_ID=0
DRIVER=xe
PCI_CLASS=38000
PCI_ID=8086:0BD6
PCI_SUBSYS_ID=8086:0000
PCI_SLOT_NAME=0000:8c:00.0
MODALIAS=pci:v00008086d00000BD6sv00008086sd00000000bc03sc80i00
SEQNUM=8817

KERNEL[446.296995] change
/devices/pci0000:89/0000:89:02.0/0000:8a:00.0/0000:8b:01.0/0000:8c:00.0
(pci)
ACTION=change
DEVPATH=/devices/pci0000:89/0000:89:02.0/0000:8a:00.0/0000:8b:01.0/0000:8c:00.0
SUBSYSTEM=pci
DEVICE_STATUS=NEEDS_RESET
TILE_ID=1
GT_ID=1
DRIVER=xe
PCI_CLASS=38000
PCI_ID=8086:0BD6
PCI_SUBSYS_ID=8086:0000
PCI_SLOT_NAME=0000:8c:00.0
MODALIAS=pci:v00008086d00000BD6sv00008086sd00000000bc03sc80i00
SEQNUM=8818

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com> 

Himal Prasad Ghimiray (3):
  fault-inject: Include linux/types.h by default.
  drm/xe: Notify Userspace when gt reset fails
  drm/xe: Introduce fault injection for gt reset

 drivers/gpu/drm/xe/xe_debugfs.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_gt.c      | 27 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt.h      | 14 ++++++++++++++
 include/linux/fault-inject.h    |  3 ++-
 include/uapi/drm/xe_drm.h       | 10 ++++++++++
 5 files changed, 62 insertions(+), 2 deletions(-)

-- 
2.25.1

