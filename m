Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BA9EEB573
	for <intel-xe@archiver.kernel.org>; Wed, 31 Dec 2025 23:38:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7442C10E60C;
	Wed, 31 Dec 2025 23:38:05 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E150B10E60C;
 Wed, 31 Dec 2025 23:38:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/tests=3A_Fix_g2g?=
 =?utf-8?q?=5Ftest=5Farray_indexing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pallavi Mishra" <pallavi.mishra@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 31 Dec 2025 23:38:03 -0000
Message-ID: <176722428390.122496.10277635546138978780@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251231233230.428953-1-pallavi.mishra@intel.com>
In-Reply-To: <20251231233230.428953-1-pallavi.mishra@intel.com>
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

Series: drm/xe/tests: Fix g2g_test_array indexing
URL   : https://patchwork.freedesktop.org/series/159577/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99339247d1ae4378b24366da182e712bdc623311
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 76146a3a308b88605dfd7860734a92b789c64610
Author: Pallavi Mishra <pallavi.mishra@intel.com>
Date:   Wed Dec 31 23:32:30 2025 +0000

    drm/xe/tests: Fix g2g_test_array indexing
    
    The G2G KUnit test allocates a compact N×N
    matrix sized by gt_count and verifies entries
    using dense indices: idx = (j * gt_count) + i
    
    The producer path currently computes idx using
    gt->info.id. However, gt->info.id values
    are not guaranteed to be contiguous.
    For example, with gt_count=2 and IDs {0,3},
    this formula produces indices beyond the
    allocated range, causing mismatches and
    potential out-of-bounds access.
    
    Update the producer to map each GT to a dense
    index in [0..gt_count-1] and compute:
        idx = (tx_dense * gt_count) + rx_dense
    
    Additionally, introduce an event-based delay
    in g2g_test_in_order() to ensure ordering
    between sends.
    
    Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
+ /mt/dim checkpatch 56e91f8b7cd1da01b69096d61b4eca31c5364beb drm-intel
76146a3a308b drm/xe/tests: Fix g2g_test_array indexing
-:88: CHECK:LINE_SPACING: Please don't use multiple blank lines
#88: FILE: drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c:207:
+
+

total: 0 errors, 0 warnings, 1 checks, 86 lines checked


