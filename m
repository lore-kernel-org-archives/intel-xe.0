Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA737C28B28
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 08:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8C010E0ED;
	Wed, 12 Mar 2025 08:46:36 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3863610E0ED;
 Wed, 12 Mar 2025 08:46:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/svm=3A_Add_stats_f?=
 =?utf-8?q?or_SVM_page_faults_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Mar 2025 08:46:35 -0000
Message-ID: <174176919522.23874.1723400237467173164@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250312083808.157243-1-francois.dugast@intel.com>
In-Reply-To: <20250312083808.157243-1-francois.dugast@intel.com>
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

Series: drm/xe/svm: Add stats for SVM page faults (rev2)
URL   : https://patchwork.freedesktop.org/series/146196/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d64a20b4799dab0a84063f4eeadef9bce63f7bee
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Wed Mar 12 09:38:08 2025 +0100

    drm/xe/svm: Add stats for SVM page faults
    
    Add a new entry in stats to for svm page faults. If CONFIG_DEBUG_FS is
    enabled, the count can be viewed with per GT stat debugfs file.
    
    This is similar to what is already in place for vma page faults.
    
    Example output:
    
        cat /sys/kernel/debug/dri/0/gt0/stats
        svm_pagefault_count: 6
        tlb_inval_count: 78
        vma_pagefault_count: 0
        vma_pagefault_kb: 0
    
    v2: Fix build with CONFIG_DRM_GPUSVM disabled
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch f7d8381dd3abe62c22d27ea7998f20d8b7dab7c3 drm-intel
d64a20b4799d drm/xe/svm: Add stats for SVM page faults


