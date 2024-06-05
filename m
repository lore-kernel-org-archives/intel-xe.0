Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C31C27C52
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 20:25:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A9A10E0A4;
	Wed,  5 Jun 2024 20:25:49 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C20810E0A4;
 Wed,  5 Jun 2024 20:25:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Allow_CTB_G2H_processing_?=
 =?utf-8?q?without_G2H_IRQ?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Jun 2024 20:25:47 -0000
Message-ID: <171761914744.2161.1915376306678113938@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240605201947.1460-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240605201947.1460-1-michal.wajdeczko@intel.com>
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

Series: Allow CTB G2H processing without G2H IRQ
URL   : https://patchwork.freedesktop.org/series/134523/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2798aef83f9c6f3974fdb83b42a7f5a5bc7d06cb
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Jun 5 22:19:47 2024 +0200

    drm/xe/guc: Allow CTB G2H processing without G2H IRQ
    
    During early initialization, in the xe_guc_min_load_for_hwconfig()
    function, we are successfully enabling CTB communication, but it
    will only allow us to send non-blocking H2G messages, as due to
    not yet enabled IRQs, including G2H IRQs, we will not notice any
    new G2H message sent by the GuC, including replies to our blocking
    H2G request messages. And those successful replies are mandatory
    for the VF drivers to continue normal operations.
    
    As attempt to workaround this driver initialization ordering issue,
    introduce special safe-mode CTB worker, that will periodically
    trigger G2H processing, like original IRQ handler, in case no
    MSI/MSIX IRQs were enabled on the driver yet. Once we detect that
    IRQ were enabled, we will stop this worker.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch a494545483635d3d93d19e8f483f61e7d4198383 drm-intel
d1935203ae06 drm/xe/guc: Prepare fast-path to be called outside of IRQ handler
2798aef83f9c drm/xe/guc: Allow CTB G2H processing without G2H IRQ


