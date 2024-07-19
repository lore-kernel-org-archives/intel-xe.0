Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C565CC3DA59
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 18:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E8510EC8B;
	Fri, 19 Jul 2024 18:03:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD3110EC8B;
 Fri, 19 Jul 2024 18:03:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Update_page_fault_queue_s?=
 =?utf-8?q?ize_calculation_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Jul 2024 18:03:49 -0000
Message-ID: <172141222990.291225.6328889027547538665@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1721411802.git.stuart.summers@intel.com>
In-Reply-To: <cover.1721411802.git.stuart.summers@intel.com>
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

Series: Update page fault queue size calculation (rev3)
URL   : https://patchwork.freedesktop.org/series/135915/
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
commit e57058ae2e1f538eab6a01f2344ad85aef671341
Author: Stuart Summers <stuart.summers@intel.com>
Date:   Fri Jul 19 17:58:28 2024 +0000

    drm/xe/guc: Bump the G2H queue size to account for page faults
    
    With the increase in the size of the recoverable page fault
    queue, we want to ensure the initial messages from GuC in
    the G2H buffer have space while we transfer those out to the
    actual pf_queue. Bump the G2H queue size to account for this
    increase in the pf_queue size.
    
    Signed-off-by: Stuart Summers <stuart.summers@intel.com>
+ /mt/dim checkpatch eb6045a759ea13e8d159bdaea423e904b9e3717b drm-intel
3897def819fe drm/xe: Fix missing workqueue destroy in xe_gt_pagefault
fe9cc2e04d6f drm/xe: Use topology to determine page fault queue size
e57058ae2e1f drm/xe/guc: Bump the G2H queue size to account for page faults


