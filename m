Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8D8EB64DC
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 08:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17E210E57B;
	Thu, 20 Jul 2023 08:26:00 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id CDC9610E578;
 Thu, 20 Jul 2023 08:25:59 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C4A37AADF5;
 Thu, 20 Jul 2023 08:25:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Thu, 20 Jul 2023 08:25:59 -0000
Message-ID: <168984155980.20751.2689229625955584616@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230720081038.24822-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230720081038.24822-1-niranjana.vishwanathapura@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/pvc=3A_Add_Wa=5F16017236439?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/pvc: Add Wa_16017236439
URL   : https://patchwork.freedesktop.org/series/121028/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 06caa2b01c329aabee3eabda9e7f98496568b9a1
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Thu Jul 20 01:10:38 2023 -0700

    drm/xe/pvc: Use fast copy engines as migrate engine on PVC
    
    Some copy hardware engine instances are faster than others on PVC.
    Use a virtual engine of these plus the reserved instance for the migrate
    engine on PVC. The idea being if a fast instance is available it will be
    used and the throughput of kernel copies, clears, and pagefault
    servicing will be higher.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
+ /mt/dim checkpatch 33240f1d19a4f2f08e8071d3b1de3e87292a5ccb drm-intel
55366eda9 drm/xe/pvc: Force even num engines to use 64B
06caa2b01 drm/xe/pvc: Use fast copy engines as migrate engine on PVC


