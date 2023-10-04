Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E49E936ED
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 23:45:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A6310E13D;
	Wed,  4 Oct 2023 23:45:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9424910E144
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 23:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696463118; x=1727999118;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j4SoZaLL26c+z9e2jVW0QW6NYhyEaUuZApiUDe6GEDI=;
 b=FVAeKdi971EHVKVgimny0lrIOdhbQYMDI85tUdxJTMIykFbh+VsXVauD
 5T9Hg1F71pHW7wv3tzR/hMJ526xnh+ElJ2WogzFBj6QGxcxUpgEY/o+UY
 EyiRj9Gn2N8hE50uvpBE/BWxtC4xoMhtu4jcCUqMiPPAsaZSGQm2XAqH3
 8HPq4PYyucohxe62GHlLNc/E2suAZVux8W89h/h3cQJcSHFbM45Q3VdiB
 0Wm+XRBUlSbXDWvG0ITfaTsK8HsuiT1NivzMaU7zrmlOl2BKy0w/lLWJ6
 IKKFR856EvJ6MQT0OheB9kmV226XdqcZtQsi2GDTWhaT8cod+07w33DJE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="469612866"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="469612866"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 16:45:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="755166514"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="755166514"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 16:45:17 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Date: Wed,  4 Oct 2023 16:47:20 -0700
Message-Id: <20231004234721.2076190-1-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/1] drm/xe: don't repin a userptr if mm is closed
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

From: Fei Yang <fei.yang@intel.com>

Ran into a problem where xe_vma_userptr_pin_pages failed with -EFAULT
due to the mmu_notifier.mm had been closed. In such case, the userptr
vma should not had been added to the invalidated list in the first
place.

Signed-off-by: Fei Yang <fei.yang@intel.com>

Fei Yang (1):
  drm/xe: don't repin a userptr if mm is closed

 drivers/gpu/drm/xe/xe_vm.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.25.1

