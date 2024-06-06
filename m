Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116B6C27C5F
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 13:37:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2CB710E16E;
	Thu,  6 Jun 2024 13:37:10 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6572410E166;
 Thu,  6 Jun 2024 13:37:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Allow_CTB_G2H_processing_?=
 =?utf-8?q?without_G2H_IRQ_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Jun 2024 13:37:09 -0000
Message-ID: <171768102941.22759.7807380466808659275@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240606130639.1504-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240606130639.1504-1-michal.wajdeczko@intel.com>
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

Series: Allow CTB G2H processing without G2H IRQ (rev2)
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
commit 2ffa198f883869d0289fb818ee27dc718b43a391
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Jun 6 15:06:39 2024 +0200

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
+ /mt/dim checkpatch 2163887f734af2f0a812a322e1a53ef6d62bf3d5 drm-intel
8dcfe4221b3c drm/xe/guc: Split g2h worker function
2ffa198f8838 drm/xe/guc: Allow CTB G2H processing without G2H IRQ


