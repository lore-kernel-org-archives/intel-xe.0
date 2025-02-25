Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6DDC021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 13:49:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34B610E69C;
	Tue, 25 Feb 2025 13:49:38 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D6010E69C;
 Tue, 25 Feb 2025 13:49:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Minor_improvements_to_GT_?=
 =?utf-8?q?stats?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 13:49:37 -0000
Message-ID: <174049137735.1983058.1275238563764541363@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250225131753.1170520-1-francois.dugast@intel.com>
In-Reply-To: <20250225131753.1170520-1-francois.dugast@intel.com>
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

Series: Minor improvements to GT stats
URL   : https://patchwork.freedesktop.org/series/145405/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9666903778fd559528efa40cdff7c25502d7d93a
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Tue Feb 25 14:17:06 2025 +0100

    drm/xe/gt_pagefault: Change vma_pagefault unit to kilobyte
    
    Increase the amount of bytes that can be counted before the counter
    overflows, while not losing information as the VMA is not expected
    to have sub-kilobyte size.
    
    Suggested-by: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch d5debc4841e604372c74ebda0bbf54bd527c3475 drm-intel
c7bbe8928928 drm/xe/gt_stats: Detect and log overflow
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
    [drm:xe_gt_stats_incr [xe]] GT0: stats vma_pagefault_bytes overflow, resetting

total: 0 errors, 1 warnings, 0 checks, 33 lines checked
dc2a524dc2c9 drm/xe/gt_stats: Use atomic64_t for counters
9666903778fd drm/xe/gt_pagefault: Change vma_pagefault unit to kilobyte


