Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80934C6FD1D
	for <intel-xe@archiver.kernel.org>; Tue,  4 Apr 2023 20:09:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AEAC10E7A5;
	Tue,  4 Apr 2023 20:09:44 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id AA99810E7A5;
 Tue,  4 Apr 2023 20:09:42 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A37AEAADE4;
 Tue,  4 Apr 2023 20:09:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Tue, 04 Apr 2023 20:09:42 -0000
Message-ID: <168063898264.18901.8169212643268609655@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230404200650.11043-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230404200650.11043-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/ttm=3A_Small_fixes_/_cleanups_in_prep_for_shrinking?=
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

Series: drm/ttm: Small fixes / cleanups in prep for shrinking
URL   : https://patchwork.freedesktop.org/series/116112/
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
Applying: drm/ttm/pool: Fix ttm_pool_alloc error path
Applying: drm/ttm: Reduce the number of used allocation orders for TTM pages
Applying: drm/ttm: Make the call to ttm_tt_populate() interruptible when faulting


