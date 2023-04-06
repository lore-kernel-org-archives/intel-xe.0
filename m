Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B8EC77B6C
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 20:21:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248F210ECDE;
	Thu,  6 Apr 2023 20:21:28 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 88B5610ECD2;
 Thu,  6 Apr 2023 20:21:26 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 62534AADE3;
 Thu,  6 Apr 2023 20:21:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Thu, 06 Apr 2023 20:21:26 -0000
Message-ID: <168081248636.9550.8500799884027150399@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230406201845.1797532-1-matthew.d.roper@intel.com>
In-Reply-To: <20230406201845.1797532-1-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Begin_adding_GMD=5FID_support_for_Xe_=28rev2=29?=
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

Series: Begin adding GMD_ID support for Xe (rev2)
URL   : https://patchwork.freedesktop.org/series/116047/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit f7507ca08ccc6a3a541b26f51ceb20bdc3935c65
Author:     Jani Nikula <jani.nikula@intel.com>
AuthorDate: Wed Apr 5 18:39:20 2023 +0300
Commit:     Rodrigo Vivi <rodrigo.vivi@intel.com>
CommitDate: Thu Apr 6 15:43:38 2023 -0400

    fixup! drm/xe/display: Implement display support
    
    Remove intel overlay stubs
    
    No longer needed with the intel_overlay.h conditional build.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
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


