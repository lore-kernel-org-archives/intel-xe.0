Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E2EC30658
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jul 2024 04:26:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6312510E03E;
	Fri,  5 Jul 2024 04:26:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FAD110E021;
 Fri,  5 Jul 2024 04:26:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_MSIX_functionality_to?=
 =?utf-8?q?_XE_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dani Liberman" <dliberman@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Jul 2024 04:26:49 -0000
Message-ID: <172015360912.29931.14712208515007087200@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240627124043.2923586-1-dliberman@habana.ai>
In-Reply-To: <20240627124043.2923586-1-dliberman@habana.ai>
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

Series: Add MSIX functionality to XE (rev4)
URL   : https://patchwork.freedesktop.org/series/135422/
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
commit 93c3c07149eb9604b7976c20ba803638c5acd8c3
Author: Ilia Levi <illevi@habana.ai>
Date:   Thu Jun 27 15:40:43 2024 +0300

    drm/xe: msix support for hw engines
    
    For devices that support MSIX, we would like to be able to configure
    the hw engines to work with MSIX. This patch allocates MSIX vectors
    for exec queues (via MSIX allocator), registers a handler and
    programs the lrc the same way vf does it (using memirq). An
    additional field added to the lrc is CS_INT_VEC.
    
    MSIX vector 0 is used for GuC-to-host interrupt.
    
    bspec: 60342, 72547
    
    Signed-off-by: Ilia Levi <illevi@habana.ai>
+ /mt/dim checkpatch 55e18f9be7b75c5226a57eff4a3b3eb6110815c6 drm-intel
4d32f6084306 drm/xe/irq: refactor irq flows to support also msix
cdd1027c8ff6 drm/xe/irq: add msix allocator
f4d7a38ef307 drm/xe/irq: add hw engine irq handler
7dfeb3a5b404 drm/xe/exec: adding msix infra to exec queue
2421552704dd drm/xe: move the kernel lrc from hwe to execlist port
15f299e2ad04 drm/xe: move memirq out of vf
c26d41183510 drm/xe: msix support preparations - enable memirq
93c3c07149eb drm/xe: msix support for hw engines


