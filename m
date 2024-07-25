Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC962C3DA5D
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 10:29:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF3010E760;
	Thu, 25 Jul 2024 10:29:41 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3722410E655;
 Thu, 25 Jul 2024 10:29:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_MSIX_functionality_to?=
 =?utf-8?q?_XE_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dani Liberman" <dliberman@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Jul 2024 10:29:40 -0000
Message-ID: <172190338022.381151.8322346679474928025@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240725102213.2182896-1-ilia.levi@intel.com>
In-Reply-To: <20240725102213.2182896-1-ilia.levi@intel.com>
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

Series: Add MSIX functionality to XE (rev6)
URL   : https://patchwork.freedesktop.org/series/135422/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 491739e6447618fafee864b9ec3cedcf17cf5531
Author: Ilia Levi <ilia.levi@intel.com>
Date:   Thu Jul 25 13:22:13 2024 +0300

    drm/xe: msix support for hw engines
    
    For devices that support MSI-X, we would like to be able to configure
    the hw engines to use it. This patch programs the lrc to set the MSI-X
    vector (new CS_INT_VEC field) provided by the exec queue, the pointers to
    interrupt status/source (using memirq, similarly to vf) and enables MSI-X
    mode for the hw engine.
    
    MSI-X vector 0 is used for GuC-to-host interrupt.
    
    bspec: 60342, 72547
    
    Signed-off-by: Ilia Levi <ilia.levi@intel.com>
+ /mt/dim checkpatch 392b0a1dbe0179b3489fddd3c7e91508f833db41 drm-intel
08da4ca5e80b drm/xe/irq: refactor irq flows to support also msix
f1a0c353f1c5 drm/xe/irq: add msix allocator
acf8a1584666 drm/xe: add irq offset of engine instance 0 to hw engine properties
f054e92581bf drm/xe: move memirq out of vf
45d89aae5140 drm/xe: memirq infra changes for msix
036a66e87baa drm/xe/irq: add hw engine irq handler
0af00a555d53 drm/xe: move the kernel lrc from hwe to execlist port
b82dbb1e5bd1 drm/xe: msix support preparations - enable memirq
72ed459fa7f7 drm/xe/exec: adding msix infra to exec queue
3ff6b05d0b2c drm/xe/irq: add default msix
491739e64476 drm/xe: msix support for hw engines


