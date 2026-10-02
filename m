Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8945CA5FD4
	for <intel-xe@archiver.kernel.org>; Fri,  2 Oct 2026 09:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABAB10E556;
	Fri,  2 Oct 2026 09:54:48 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F38610E556;
 Fri,  2 Oct 2026 09:54:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?1=2C1/1=5D_media=3A_Consolidate_AtomISP_v2_PCI_IDs_in_the_pci=5Fi?=
 =?utf-8?q?ds=2Eh?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 Oct 2026 09:54:47 -0000
Message-ID: <179093488738.232070.3453305298544677080@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261002094813.856439-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20261002094813.856439-1-andriy.shevchenko@linux.intel.com>
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

Series: series starting with [v1,1/1] media: Consolidate AtomISP v2 PCI IDs in the pci_ids.h
URL   : https://patchwork.freedesktop.org/series/175407/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2d2c1015a4068e6f193cacf32930b3eb5cc843f4
Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Fri Oct 2 11:43:43 2026 +0200

    media: Consolidate AtomISP v2 PCI IDs in the pci_ids.h
    
    We have a few drivers using same pair of the PCI IDs across the kernel and
    there seems more to go, consolidate AtomISP v2 PCI IDs in pci_ids.h database.
    
    Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+ /mt/dim checkpatch e38a977a5512cc72c297eeb5b048a24201622900 drm-intel
2d2c1015a406 media: Consolidate AtomISP v2 PCI IDs in the pci_ids.h
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
there seems more to go, consolidate AtomISP v2 PCI IDs in pci_ids.h database.

total: 0 errors, 1 warnings, 0 checks, 83 lines checked


