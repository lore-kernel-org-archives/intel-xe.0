Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD67EC3ABD7
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 14:50:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7101910E0FE;
	Mon, 12 May 2025 14:50:35 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 379B010E087;
 Mon, 12 May 2025 14:50:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_SVM_atomics_in_Xe_?=
 =?utf-8?q?/_GPU_SVM_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 May 2025 14:50:34 -0000
Message-ID: <174706143421.69697.7710984839610267040@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512135500.1405019-1-matthew.brost@intel.com>
In-Reply-To: <20250512135500.1405019-1-matthew.brost@intel.com>
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

Series: Enable SVM atomics in Xe / GPU SVM (rev8)
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
commit 74590420ccc3e08d1878111eca9bb28081b4994a
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon May 12 06:54:59 2025 -0700

    drm/xe: Add atomic_svm_timeslice_ms debugfs entry
    
    Add some informal control for atomic SVM fault GPU timeslice to be able
    to play around with values and tweak performance.
    
    v2:
     - Reduce timeslice default value to 5ms
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch f3767db51c5d8bc3ba3f2b342332ab329044fe5b drm-intel
6df760b541d9 drm/gpusvm: Introduce devmem_only flag for allocation
25d8c10776dc drm/xe: Strict migration policy for atomic SVM faults
-:42: WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>`', should be: 'Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>'
#42: 
Acked-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>`

total: 0 errors, 1 warnings, 0 checks, 334 lines checked
5b5c28b8ff62 drm/gpusvm: Add timeslicing support to GPU SVM
030d979cb046 drm/xe: Timeslice GPU on atomic SVM fault
74590420ccc3 drm/xe: Add atomic_svm_timeslice_ms debugfs entry


