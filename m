Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BE7C001E0
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 04:11:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7F610E553;
	Thu, 20 Jul 2023 04:11:07 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F8C10E551
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 04:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689826263; x=1721362263;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=704EIivjtQCB4+41grSwc1CfAa3wsajaRYbTY0hKiQ0=;
 b=MkIpYf3CPJd0UlNE+QkTFJwxr23L16z4RSWCisukdEU3Oxpdkx34/uRa
 itjxKc/WefFCP8270kj1YFTMSiWyl4EiWCCYOjZPyD9XtoDu1udB4fkQn
 b2KfDsSeZ7tbH9R/0rueyY7HC7Npuic1x6zPkOgtctTNrFjyYIDYNtay6
 fcX/OA9sqkDrwkY5K6pGJniigKCFVb944R0sm/50YWVRqradIS46X/pzq
 EEmQv5OJT4plPNGYNOCKgqMgQp8TZUFyxK3oSnXuds1N7sT64zA1Xy7jb
 PwHNxb1i47JCu0bFPmk0M/gqBi/SzfHPFFyf2U2dXsKbM1THwh1FF+oX+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="397500412"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="397500412"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 21:11:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="753924792"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="753924792"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 21:11:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 19 Jul 2023 21:10:51 -0700
Message-Id: <20230720041057.112903-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/6] More VM cleanups
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

Continuation of [1]. These are the last changes in [1] that will not
break the uAPI.

Matt

[1] https://patchwork.freedesktop.org/series/117156/

Matthew Brost (6):
  drm/xe: Avoid doing rebinds
  drm/xe: Reduce the number list links in xe_vma
  drm/xe: Replace list_del_init with list_del for
    userptr.invalidate_link cleanup
  drm/xe: Change tile masks from u64 to u8
  drm/xe: Combine destroy_cb and destroy_work in xe_vma into union
  drm/xe: Only alloc userptr part of xe_vma for userptrs

 drivers/gpu/drm/xe/xe_bo.c       |   6 +-
 drivers/gpu/drm/xe/xe_exec.c     |   2 +-
 drivers/gpu/drm/xe/xe_pt.c       |   3 +-
 drivers/gpu/drm/xe/xe_vm.c       | 135 ++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_vm_types.h | 131 +++++++++++++++++-------------
 5 files changed, 178 insertions(+), 99 deletions(-)

-- 
2.34.1

