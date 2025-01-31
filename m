Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77B7C0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 15:43:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EE410E3A3;
	Fri, 31 Jan 2025 15:43:40 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C4310E392;
 Fri, 31 Jan 2025 15:43:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/relay=3A_Don=27t_u?=
 =?utf-8?q?se_GFP=5FKERNEL_for_new_transactions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Jan 2025 15:43:38 -0000
Message-ID: <173833821895.3249698.17819384658018558835@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250131153713.808-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250131153713.808-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/relay: Don't use GFP_KERNEL for new transactions
URL   : https://patchwork.freedesktop.org/series/144192/
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
commit 17c27d640aaf4518822076faea6702779a166e1e
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri Jan 31 16:37:13 2025 +0100

    drm/xe/relay: Don't use GFP_KERNEL for new transactions
    
    VFs use a relay transaction during the resume/reset flow and use
    of the GFP_KERNEL flag may conflict with the reclaim:
    
         -> #0 (fs_reclaim){+.+.}-{0:0}:
     [ ]        __lock_acquire+0x1874/0x2bc0
     [ ]        lock_acquire+0xd2/0x310
     [ ]        fs_reclaim_acquire+0xc5/0x100
     [ ]        mempool_alloc_noprof+0x5c/0x1b0
     [ ]        __relay_get_transaction+0xdc/0xa10 [xe]
     [ ]        relay_send_to+0x251/0xe50 [xe]
     [ ]        xe_guc_relay_send_to_pf+0x79/0x3a0 [xe]
     [ ]        xe_gt_sriov_vf_connect+0x90/0x4d0 [xe]
     [ ]        xe_uc_init_hw+0x157/0x3b0 [xe]
     [ ]        do_gt_restart+0x1ae/0x650 [xe]
     [ ]        xe_gt_resume+0xb6/0x120 [xe]
     [ ]        xe_pm_runtime_resume+0x15b/0x370 [xe]
     [ ]        xe_pci_runtime_resume+0x73/0x90 [xe]
     [ ]        pci_pm_runtime_resume+0xa0/0x100
     [ ]        __rpm_callback+0x4d/0x170
     [ ]        rpm_callback+0x64/0x70
     [ ]        rpm_resume+0x594/0x790
     [ ]        __pm_runtime_resume+0x4e/0x90
     [ ]        xe_pm_runtime_get_ioctl+0x9c/0x160 [xe]
    
    Since we have a preallocated pool of relay transactions, which
    should cover all our normal relay use cases, we may use the
    GFP_NOWAIT flag when allocating new outgoing transactions.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch ff5661561b2b7d03b8e8b3ae0028269801cff5e6 drm-intel
17c27d640aaf drm/xe/relay: Don't use GFP_KERNEL for new transactions


