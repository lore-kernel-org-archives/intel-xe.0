Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AD4D5E123
	for <intel-xe@archiver.kernel.org>; Sun, 10 Nov 2024 12:42:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226B310E013;
	Sun, 10 Nov 2024 12:42:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0574610E013;
 Sun, 10 Nov 2024 12:42:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_MSI-X_support_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ilia Levi" <ilia.levi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 10 Nov 2024 12:42:47 -0000
Message-ID: <173124256701.2163700.12888800010463346074@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241110123328.202229-1-ilia.levi@intel.com>
In-Reply-To: <20241110123328.202229-1-ilia.levi@intel.com>
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

Series: MSI-X support (rev6)
URL   : https://patchwork.freedesktop.org/series/140877/
State : warning

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
commit 3dfa227a8b9cd81214a277ddff1e87ef4595a946
Author: Dani Liberman <dliberman@habana.ai>
Date:   Sun Nov 10 14:33:28 2024 +0200

    drm/xe/uapi: Support requesting unique MSI-X for exec queue
    
    Unique MSI-X per exec queue will improve the performance of the
    IRQ handler. In case no MSI-X is available, the uAPI will return
    -EBUSY error and the user would be able to execute the uAPI again
    without the flag (fallback to default MSI-X).
    
    Co-authored-by: Ilia Levi <ilia.levi@intel.com>
    Signed-off-by: Dani Liberman <dliberman@habana.ai>
+ /mt/dim checkpatch 9bcce25c88a853967702ceae9f9ef35d2c0e7ee8 drm-intel
7c620f125f9f drm/xe: Initial MSI-X support for HW engines
-:398: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#398: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 544 lines checked
eb790c9ab67d drm/xe: Manage MSI-X interrupts allocation
3dfa227a8b9c drm/xe/uapi: Support requesting unique MSI-X for exec queue
-:11: WARNING:BAD_SIGN_OFF: Non-standard signature: Co-authored-by:
#11: 
Co-authored-by: Ilia Levi <ilia.levi@intel.com>

total: 0 errors, 1 warnings, 0 checks, 184 lines checked


