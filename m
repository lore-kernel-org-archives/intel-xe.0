Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C32C369DC
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 20:23:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD4C110E04D;
	Tue, 29 Apr 2025 20:23:44 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30E110E04D;
 Tue, 29 Apr 2025 20:23:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Enable_SVM_atomics_in_Xe_?=
 =?utf-8?q?/_GPU_SVM_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Apr 2025 20:23:43 -0000
Message-ID: <174595822393.25646.7526585353046467134@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250429201915.1025600-1-matthew.brost@intel.com>
In-Reply-To: <20250429201915.1025600-1-matthew.brost@intel.com>
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

Series: Enable SVM atomics in Xe / GPU SVM (rev5)
URL   : https://patchwork.freedesktop.org/series/147846/
State : success

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
commit d48a6abc1317eb2a4f5ab6d9afd38a7e78e01d3b
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Apr 29 13:19:15 2025 -0700

    drm/xe: Add atomic_svm_timeslice_ms debugfs entry
    
    Add some informal control for atomic SVM fault GPU timeslice to be able
    to play around with values and tweak performance.
    
    v2:
     - Reduce timeslice default value to 5ms
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 11bac2f4b353b42599a9b028f48261d32b94fe34 drm-intel
88e7f8574f51 drm/gpusvm: Introduce devmem_only flag for allocation
d983a09be6b2 drm/xe: Strict migration policy for atomic SVM faults
aeacf197fd93 drm/gpusvm: Add timeslicing support to GPU SVM
e168982c51f7 drm/xe: Timeslice GPU on atomic SVM fault
d48a6abc1317 drm/xe: Add atomic_svm_timeslice_ms debugfs entry


