Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89E6C3064D
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 18:16:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF2310E21E;
	Tue, 25 Jun 2024 18:16:21 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7155610E21E;
 Tue, 25 Jun 2024 18:16:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/irq=3A_remove_xe?=
 =?utf-8?q?=5Firq=5Fshutdown_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ilia Levi" <illevi@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jun 2024 18:16:16 -0000
Message-ID: <171933937646.157680.16504014250976475993@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240606124705.822451-1-illevi@habana.ai>
In-Reply-To: <20240606124705.822451-1-illevi@habana.ai>
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

Series: drm/xe/irq: remove xe_irq_shutdown (rev3)
URL   : https://patchwork.freedesktop.org/series/134565/
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
commit bc5d167e3b6f657391d689572c5d942d1e3e10e2
Author: Ilia Levi <illevi@habana.ai>
Date:   Thu Jun 6 15:47:05 2024 +0300

    drm/xe/irq: remove xe_irq_shutdown
    
    The cleanup is done by devres in irq_uninstall.
    
    Commit bbc9651fe9f4 ("drm/xe/irq: move irq_uninstall over to devm")
    resolved the ordering issue where irq_uninstall (registered with drmm)
    was called after pci_free_irq_vectors (registered with devm upon calling
    pci_alloc_irq_vectors). This happened because drmm action list is
    registered with devm very early in the init flow - before
    pci_alloc_irq_vectors.
    
    Now that irq_uninstall is registered with devm, it will be called before
    pci_free_irq_vectors and we can remove xe_irq_shutdown.
    
    Signed-off-by: Ilia Levi <illevi@habana.ai>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch c7f3ccc0f957750deeba044da72581ec1bf5e328 drm-intel
bc5d167e3b6f drm/xe/irq: remove xe_irq_shutdown


