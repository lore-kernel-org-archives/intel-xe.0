Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF18C3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 07:46:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C85410E9E4;
	Wed, 17 Jul 2024 07:46:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7759710E9E3;
 Wed, 17 Jul 2024 07:46:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_MSIX_functionality_to?=
 =?utf-8?q?_XE_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dani Liberman" <dliberman@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Jul 2024 07:46:52 -0000
Message-ID: <172120241248.254371.15152295365703131825@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240717073223.1135072-1-ilia.levi@intel.com>
In-Reply-To: <20240717073223.1135072-1-ilia.levi@intel.com>
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

Series: Add MSIX functionality to XE (rev5)
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
commit 6313646e848f5401cbd78ca6da1a1f09e3d32c77
Author: Ilia Levi <ilia.levi@intel.com>
Date:   Wed Jul 17 10:32:23 2024 +0300

    drm/xe: msix support for hw engines
    
    For devices that support MSI-X, we would like to be able to configure
    the hw engines to use it. This patch programs the lrc to set the MSI-X
    vector (new CS_INT_VEC field) provided by the exec queue, the pointers to
    interrupt status/source (using memirq, similarly to vf) and enables MSI-X
    mode for the hw engine.
    
    MSI-X vector 0 is used for GuC-to-host interrupt.
    
    bspec: 60342, 72547
    
    Signed-off-by: Ilia Levi <ilia.levi@intel.com>
+ /mt/dim checkpatch 5ed026e3fb07d65872ef64a5428746a0142e13b0 drm-intel
699f8c593feb drm/xe/irq: refactor irq flows to support also msix
41f4ceadd581 drm/xe/irq: add msix allocator
8dffe6decb17 drm/xe: add irq offset of engine instance 0 to hw engine properties
67e20a6e2b1e drm/xe: move memirq out of vf
a81b105b3540 drm/xe: memirq infra changes for msix
504d422a9a15 drm/xe/irq: add hw engine irq handler
579c9518cd1b drm/xe: move the kernel lrc from hwe to execlist port
9058a81370fc drm/xe: msix support preparations - enable memirq
3afcc9f7109c drm/xe/exec: adding msix infra to exec queue
427f6af9b33d drm/xe/irq: add default msix
6313646e848f drm/xe: msix support for hw engines


