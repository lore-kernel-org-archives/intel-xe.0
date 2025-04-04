Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762C9C3601E
	for <intel-xe@archiver.kernel.org>; Fri,  4 Apr 2025 22:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A18610E340;
	Fri,  4 Apr 2025 22:26:22 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80EA10E33E;
 Fri,  4 Apr 2025 22:26:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Ensure_XE=5FBO?=
 =?utf-8?q?=5FFLAG=5FCPU=5FADDR=5FMIRROR_has_a_unique_value?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 04 Apr 2025 22:26:21 -0000
Message-ID: <174380558188.39823.10308172207328193116@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250404220053.1758356-2-matthew.d.roper@intel.com>
In-Reply-To: <20250404220053.1758356-2-matthew.d.roper@intel.com>
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

Series: drm/xe: Ensure XE_BO_FLAG_CPU_ADDR_MIRROR has a unique value
URL   : https://patchwork.freedesktop.org/series/147286/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 623ffd0cd81b9cd497ccee2442f07f2b6629bc6a
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Fri Apr 4 15:00:54 2025 -0700

    drm/xe: Ensure XE_BO_FLAG_CPU_ADDR_MIRROR has a unique value
    
    When XE_BO_FLAG_PINNED_NORESTORE and XE_BO_FLAG_PINNED_LATE_RESTORE were
    added, they were assigned BO flag values in the middle of the flag
    range, requiring renumbering of the higher flags.  In both cases,
    XE_BO_FLAG_CPU_ADDR_MIRROR was overlooked during renumbering because it
    was defined below XE_BO_FLAG_GGTT_ALL and thus was not immediately
    visible in code diffs changing this area of the code; this resulted in
    XE_BO_FLAG_CPU_ADDR_MIRROR clashing with another flag.
    
    Assign XE_BO_FLAG_CPU_ADDR_MIRROR a unique value, and also move the
    definition of XE_BO_FLAG_GGTT_ALL down below all of the individual flags
    so that this kind of mistake is less likely in the future.  Also, while
    we're at it, fix up some space vs tab whitespace inconsistency in these
    flag definitions.
    
    Fixes: 7f387e6012b6 ("drm/xe: add XE_BO_FLAG_PINNED_LATE_RESTORE")
    Fixes: 045448da87bf ("drm/xe: Add XE_BO_FLAG_PINNED_NORESTORE")
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 60b7ecc2c5c979cfb8863272348bd6724559b5be drm-intel
623ffd0cd81b drm/xe: Ensure XE_BO_FLAG_CPU_ADDR_MIRROR has a unique value


