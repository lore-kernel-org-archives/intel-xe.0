Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67D8C61CE8
	for <intel-xe@archiver.kernel.org>; Sat,  7 Jun 2025 02:40:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B0410EC0B;
	Sat,  7 Jun 2025 02:40:49 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E373E10EC0B;
 Sat,  7 Jun 2025 02:40:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/uapi=3A_Correct_sy?=
 =?utf-8?q?nc_type_definition_in_comments?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 07 Jun 2025 02:40:47 -0000
Message-ID: <174926404792.57670.10197290166396958343@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250607023442.1236889-1-shuicheng.lin@intel.com>
In-Reply-To: <20250607023442.1236889-1-shuicheng.lin@intel.com>
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

Series: drm/xe/uapi: Correct sync type definition in comments
URL   : https://patchwork.freedesktop.org/series/149958/
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
commit 4dcf5635a997f2ac92053d0aa49a3f1fb5f93b59
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Sat Jun 7 02:34:42 2025 +0000

    drm/xe/uapi: Correct sync type definition in comments
    
    DRM_XE_SYNC_FLAG_SYNCOBJ is renamed to DRM_XE_SYNC_TYPE_SYNCOBJ.
    DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ is renamed to DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ.
    DRM_XE_SYNC_FLAG_DMA_BUF is removed.
    
    Fixes: dc787f8931af ("drm/xe/uapi: Split xe_sync types from flags")
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Francois Dugast <francois.dugast@intel.com>
    Cc: Zongyao Bai <zongyao.bai@intel.com>
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch b8f759deb9abbafcb01468baecf33aee93ace35f drm-intel
4dcf5635a997 drm/xe/uapi: Correct sync type definition in comments
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ is renamed to DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ.

-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'dc787f8931af', maybe rebased or not pulled?
#10: 
Fixes: dc787f8931af ("drm/xe/uapi: Split xe_sync types from flags")

total: 0 errors, 2 warnings, 0 checks, 20 lines checked


