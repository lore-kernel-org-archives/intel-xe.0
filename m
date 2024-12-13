Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B8CE7717D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 09:08:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC9A10EF73;
	Fri, 13 Dec 2024 09:08:17 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC51910EF73;
 Fri, 13 Dec 2024 09:08:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_MSI-X_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ilia Levi" <ilia.levi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Dec 2024 09:08:15 -0000
Message-ID: <173408089589.2063629.18110227958327952778@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241213070353.1511-1-ilia.levi@intel.com>
In-Reply-To: <20241213070353.1511-1-ilia.levi@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/142523/
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
commit f8d0499f432097d2f78dd06a477749e88e7bf0eb
Author: Dani Liberman <dliberman@habana.ai>
Date:   Fri Dec 13 09:03:53 2024 +0200

    drm/xe/uapi: Support requesting unique MSI-X for exec queue
    
    Unique MSI-X per exec queue will improve the performance of the
    IRQ handler. In case no MSI-X is available, the uAPI will return
    -EBUSY error and the user would be able to execute the uAPI again
    without the flag (fallback to default MSI-X).
    
    Co-developed-by: Ilia Levi <ilia.levi@intel.com>
    Signed-off-by: Ilia Levi <ilia.levi@intel.com>
    Signed-off-by: Dani Liberman <dliberman@habana.ai>
    Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch a4502e763bb931b68fa9be46262724a61ae951e3 drm-intel
9abfaa9ed581 drm/xe/irq: Separate MSI and MSI-X flows
97369bbd85fd drm/xe: Initial MSI-X support for HW engines
f1731d35655b drm/xe/irq: Manage MSI-X interrupts allocation
f8d0499f4320 drm/xe/uapi: Support requesting unique MSI-X for exec queue


