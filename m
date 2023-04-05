Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B474CC76188
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 03:23:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3D310E1AA;
	Wed,  5 Apr 2023 03:23:10 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 351D310E1AA;
 Wed,  5 Apr 2023 03:23:09 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2CB6EA00CC;
 Wed,  5 Apr 2023 03:23:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 05 Apr 2023 03:23:09 -0000
Message-ID: <168066498915.14700.14535595130906100853@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230405025919.3975162-1-matthew.brost@intel.com>
In-Reply-To: <20230405025919.3975162-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe=3A_Fix_error_handling_in_xe=5Fgt=5Frecord=5Fdefault?=
 =?utf-8?q?=5Flrcs?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Fix error handling in xe_gt_record_default_lrcs
URL   : https://patchwork.freedesktop.org/series/116125/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit a0387605dae12d65678155c07518f110e8f9c739
Author:     Lucas De Marchi <lucas.demarchi@intel.com>
AuthorDate: Thu Mar 23 22:17:54 2023 -0700
Commit:     Lucas De Marchi <lucas.demarchi@intel.com>
CommitDate: Tue Apr 4 11:56:32 2023 -0700

    drm/xe: Update GuC/HuC firmware autoselect logic
    
    Update the logic to autoselect GuC/HuC for the platforms with the
    following improvements:
    
    - Document what is the firmware file that is expected to be
      loaded and what is checked from blob headers
    
    - When the platform is under force-probe it's desired to enforce
      the full-version requirement so the correct firmware is used
      before widespread adoption and backward-compatibility
      commitments
    
    - Directory from which we expect firmware blobs to be available in
      upstream linux-firmware repository depends on the platform: for
      the ones supported by i915 it uses the i915/ directory, but the ones
      expected to be supported by xe, it's on the xe/ directory. This
      means that for platforms in the intersection, the firmware is
      loaded from a different directory, but that is not much important
      in the firmware repo and it avoids firmware duplication.
    
    - Make the table with the firmware definitions clearly state the
      versions being expected. Now with macros to select the version it's
      possible to choose between full-version/major-version for GuC and
      full-version/no-version for HuC. These are similar to the macros used
      in i915, but implemented in a slightly different way to avoid
      duplicating the macros for each firmware/type and functionality,
      besides adding the support for different directories.
    
    - There is no check added regarding force-probe since xe should
      reuse the same firmware files published for i915 for past
      platforms. This can be improved later with additional
      kunit checking against a hardcoded list of platforms that
      falls in this category.
    
    - As mentioned in the TODO, the major version fallback was not
      implemented before as currently each platform only supports one
      major. That can be easily added later.
    
    - GuC version for MTL and PVC were updated to 70.6.4, using the exact
      full version, while the
    
    After this the GuC firmware used by PVC changes to pvc_guc_70.5.2.bin
    since it's using a file not published yet.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
    Link: https://lore.kernel.org/r/20230324051754.1346390-4-lucas.demarchi@intel.com
=== git am output follows ===
Applying: drm/xe: Fix error handling in xe_gt_record_default_lrcs


