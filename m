Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F94E77188
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 00:48:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECF610E491;
	Wed, 15 Jan 2025 00:48:44 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F8F10E491;
 Wed, 15 Jan 2025 00:48:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_VF=3A_Fix_early_read_of_G?=
 =?utf-8?q?DMID_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Jan 2025 00:48:42 -0000
Message-ID: <173690212294.3758484.997364965083369141@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241114175955.2299-1-michal.wajdeczko@intel.com>
In-Reply-To: <20241114175955.2299-1-michal.wajdeczko@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: VF: Fix early read of GDMID (rev2)
URL   : https://patchwork.freedesktop.org/series/141367/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 36fcfcf5a0c548bcb02029f07fa8e1cb76f387ae
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Jan 14 22:13:47 2025 +0100

    drm/xe/vf: Perform early GT MMIO initialization to read GMDID
    
    VFs need to communicate with the GuC to obtain the GMDID value
    and existing GuC functions used for that assume that the GT has
    it's MMIO members already setup. However, due to recent refactoring
    the gt->mmio is initialized later, and any attempt by the VF to use
    xe_mmio_read|write() from GuC functions will lead to NPD crash due
    to unset MMIO register address:
    
    [] xe 0000:00:02.1: [drm] Running in SR-IOV VF mode
    [] xe 0000:00:02.1: [drm] GT0: sending H2G MMIO 0x5507
    [] BUG: unable to handle page fault for address: 0000000000190240
    
    Since we are already tweaking the id and type of the primary GT to
    mimic it's a Media GT before initializing the GuC communication,
    we can also call xe_gt_mmio_init() to perform early setup of the
    gt->mmio which will make those GuC functions work again.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
    Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch a45139b1e7578c7a4f1cbe8fae0943416a174136 drm-intel
87a215725dee drm/xe: Always setup GT MMIO adjustment data
36fcfcf5a0c5 drm/xe/vf: Perform early GT MMIO initialization to read GMDID


