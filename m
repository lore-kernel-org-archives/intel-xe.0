Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9489C76188
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 20:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71C810E564;
	Mon,  3 Apr 2023 20:19:29 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5564510E564;
 Mon,  3 Apr 2023 20:19:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4C84AAADDD;
 Mon,  3 Apr 2023 20:19:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Mon, 03 Apr 2023 20:19:28 -0000
Message-ID: <168055316827.24311.10704345699445177344@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230403201702.996400-1-matthew.d.roper@intel.com>
In-Reply-To: <20230403201702.996400-1-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Begin_adding_GMD=5FID_support_for_Xe?=
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

Series: Begin adding GMD_ID support for Xe
URL   : https://patchwork.freedesktop.org/series/116047/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit cbee780e81e4564f73bd4e945d0a8d2e19ae36b7
Author:     Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
AuthorDate: Fri Mar 31 16:52:50 2023 +0000
Commit:     Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CommitDate: Mon Apr 3 10:53:40 2023 -0700

    drm/xe: Use proper vram offset
    
    In xe_migrate functions, use proper vram io offset of the
    tiles while calculating addresses.
    
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
=== git am output follows ===
Applying: drm/xe: Start splitting xe_device_desc into graphics/media structures
Applying: drm/xe: Set require_force_probe in each platform's description
Applying: drm/xe: Move most platform traits to graphics IP
Applying: drm/xe: Move engine masks into IP descriptor structures
Applying: drm/xe: Clarify GT counting logic
Applying: drm/xe: Select graphics/media descriptors from GMD_ID


