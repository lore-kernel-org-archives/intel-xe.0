Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7FBD69104
	for <intel-xe@archiver.kernel.org>; Thu, 28 Nov 2024 13:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2A610EC7A;
	Thu, 28 Nov 2024 13:01:53 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B64A10EC7A;
 Thu, 28 Nov 2024 13:01:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_MSI-X_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ilia Levi" <ilia.levi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Nov 2024 13:01:52 -0000
Message-ID: <173279891210.4072800.12650383376022389246@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241128125345.1115-1-ilia.levi@intel.com>
In-Reply-To: <20241128125345.1115-1-ilia.levi@intel.com>
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

Series: MSI-X support
URL   : https://patchwork.freedesktop.org/series/141880/
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
commit bc0ef3dcacdbb7f02e8fb9e8b27ba4931e62816e
Author: Dani Liberman <dliberman@habana.ai>
Date:   Thu Nov 28 14:53:45 2024 +0200

    drm/xe/uapi: Support requesting unique MSI-X for exec queue
    
    Unique MSI-X per exec queue will improve the performance of the
    IRQ handler. In case no MSI-X is available, the uAPI will return
    -EBUSY error and the user would be able to execute the uAPI again
    without the flag (fallback to default MSI-X).
    
    Co-developed-by: Ilia Levi <ilia.levi@intel.com>
    Signed-off-by: Ilia Levi <ilia.levi@intel.com>
    Signed-off-by: Dani Liberman <dliberman@habana.ai>
+ /mt/dim checkpatch f3f406165a3d5f0fcb60be2060b7920ac385dc22 drm-intel
b3c83ccc4d87 drm/xe: Make irq enabled flag atomic
3652bf33d0e4 drm/xe/irq: Separate MSI and MSI-X flows
c10c8147f6ac drm/xe: Initial MSI-X support for HW engines
8a2227afc5fd drm/xe/irq: Manage MSI-X interrupts allocation
bc0ef3dcacdb drm/xe/uapi: Support requesting unique MSI-X for exec queue


