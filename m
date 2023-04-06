Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF10C7618D
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 20:53:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BD510ED30;
	Thu,  6 Apr 2023 20:53:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7A36C10ED30;
 Thu,  6 Apr 2023 20:53:22 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4AB71AADDC;
 Thu,  6 Apr 2023 20:53:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Thu, 06 Apr 2023 20:53:22 -0000
Message-ID: <168081440227.9550.12208420593810156381@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230406201845.1797532-1-matthew.d.roper@intel.com>
In-Reply-To: <20230406201845.1797532-1-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Begin_adding_GMD=5FID_support_for_Xe_=28rev3=29?=
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

Series: Begin adding GMD_ID support for Xe (rev3)
URL   : https://patchwork.freedesktop.org/series/116047/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 77e9a52273eb0385a959d9b74f69edadd3f2aaab
Author:     Lucas De Marchi <lucas.demarchi@intel.com>
AuthorDate: Wed Apr 5 15:47:25 2023 -0700
Commit:     Lucas De Marchi <lucas.demarchi@intel.com>
CommitDate: Thu Apr 6 13:23:04 2023 -0700

    drm/xe: Always log GuC/HuC firmware versions
    
    When debugging issues related to GuC/HuC, it's important to know what is
    the firmware version being used. The version from the filename can't be
    relied upon, also because it normally only contains the major version
    (except for the ones under experimental support).
    
    Log the version from the blob after reading the CSS header. Example:
    
            xe 0000:03:00.0: [drm] Using GuC firmware (70.5) from i915/dg2_guc_70.bin
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Link: https://lore.kernel.org/r/20230405224725.1993719-1-lucas.demarchi@intel.com
=== git am output follows ===
.git/rebase-apply/patch:155: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: drm/xe: Start splitting xe_device_desc into graphics/media structures
Applying: drm/xe: Set require_force_probe in each platform's description
Applying: drm/xe: Move most platform traits to graphics IP
Applying: drm/xe: Move engine masks into IP descriptor structures
Applying: drm/xe: Clarify GT counting logic
Applying: drm/xe: Add printable name to IP descriptors
Applying: drm/xe: Select graphics/media descriptors from GMD_ID
Applying: drm/xe: Add KUnit test for xe_pci.c IP engine lists
Applying: drm/xe: Clean up xe_device_desc


