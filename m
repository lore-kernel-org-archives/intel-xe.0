Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BE4C30653
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jul 2024 09:26:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2609610EA66;
	Thu,  4 Jul 2024 09:26:06 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07F210EA61;
 Thu,  4 Jul 2024 09:26:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_MSIX_functionality_to?=
 =?utf-8?q?_XE_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dani Liberman" <dliberman@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Jul 2024 09:26:04 -0000
Message-ID: <172008516491.27753.18438911722053520198@2413ebb6fbb6>
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

Series: Add MSIX functionality to XE (rev3)
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
commit 3527c8bbef6eb595080d77b5f1e1d761821cf532
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
+ /mt/dim checkpatch d9a891c82483466b248175c140d8d11777e2d855 drm-intel
36217ae73685 drm/xe/irq: refactor irq flows to support also msix
abf6b01aa3cf drm/xe/irq: add msix allocator
a500e7ab5260 drm/xe/irq: add hw engine irq handler
969780026d8a drm/xe/exec: adding msix infra to exec queue
1b5e9040435a drm/xe: move the kernel lrc from hwe to execlist port
d95f3d1ec939 drm/xe: move memirq out of vf
7cf2ccf4a490 drm/xe: msix support preparations - enable memirq
3527c8bbef6e drm/xe: msix support for hw engines


