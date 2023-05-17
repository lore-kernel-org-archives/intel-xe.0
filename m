Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F99C77B75
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 14:20:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B4710E426;
	Wed, 17 May 2023 14:20:16 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7238C10E426
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 14:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684333215; x=1715869215;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BEGvZguN9zr5BXinhiI1IboK4SJgByWH11tm2SnEWZY=;
 b=kTqw5hYB7UQpviINGvIAagzqjpwHIqSAxv3p10k+HAV3qg+vM+ehjazW
 Cs0HxF50pxkzSxQMnx3RITKlfFXLg3oaRLGvxRKDOgWrJYVlvsDGAuIZm
 CzGokFc0UkICc1rshM2HY3LEArK7KY9eyV1Kp7tMEF8KHDOSB1lNEhwVK
 B6qi7IcSXK/ja9oc6PDqZjl2hE1g+35yaxTH30UVtoSyIcqj0dU7FYhbG
 RjQgvraQ7QF/GjHlwYbTBKRBslgKZqZEUmuaCl2PDHPUrlqqLzOmfvy4v
 IXBG8K8yM9c5bQNon6zo2ApBhnU2bxVJdm7PLTQMHaAL09n83CYPZPErC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="354942987"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="354942987"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 07:20:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="701772287"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="701772287"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 07:20:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 17 May 2023 07:20:18 -0700
Message-Id: <20230517142020.3717595-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Conform to dma-fence rules
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

Should result in simplier UMDs allowig dma-fences to be used where the
rules allow.

Matthew Brost (2):
  drm/xe: Allow compute VMs to output dma-fences on binds
  drm/xe: Allow dma-fences as in-syncs for compute / faulting VM

 drivers/gpu/drm/xe/xe_sync.c | 12 +++++++-----
 drivers/gpu/drm/xe/xe_vm.c   |  2 +-
 2 files changed, 8 insertions(+), 6 deletions(-)

-- 
2.34.1

