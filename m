Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CF5C369CB
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 13:03:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6628A10E66A;
	Wed, 23 Apr 2025 13:03:04 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9952D10E66A;
 Wed, 23 Apr 2025 13:03:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_SVM_atomics_in_Xe_?=
 =?utf-8?q?/_GPU_SVM_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Apr 2025 13:03:02 -0000
Message-ID: <174541338263.458.12824143632477011365@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250422170415.584662-1-matthew.brost@intel.com>
In-Reply-To: <20250422170415.584662-1-matthew.brost@intel.com>
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

Series: Enable SVM atomics in Xe / GPU SVM (rev4)
URL   : https://patchwork.freedesktop.org/series/147846/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5fd72fe15fb5bd7435735fd072ea61888f6a0cd6
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Apr 22 10:04:15 2025 -0700

    drm/xe: Add atomic_svm_timeslice_ms debugfs entry
    
    Add some informal control for atomic SVM fault GPU timeslice to be able
    to play around with values and tweak performance.
    
    v2:
     - Reduce timeslice default value to 5ms
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch d6a6684585dd1c86a8ad88d592c73193482cf5a1 drm-intel
513b5853a127 drm/gpusvm: Introduce devmem_only flag for allocation
37b959904e24 drm/xe: Strict migration policy for atomic SVM faults
-:66: CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the previous line
#66: FILE: drivers/gpu/drm/xe/xe_svm.c:657:
+	return ((range->tile_present & ~range->tile_invalidated) & BIT(tile->id))
+		&& (!devmem_only || range->base.flags.migrate_devmem);

total: 0 errors, 0 warnings, 1 checks, 166 lines checked
8eb82f17efec drm/gpusvm: Add timeslicing support to GPU SVM
019524a56c65 drm/xe: Timeslice GPU on atomic SVM fault
5fd72fe15fb5 drm/xe: Add atomic_svm_timeslice_ms debugfs entry


