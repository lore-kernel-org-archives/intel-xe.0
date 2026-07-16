Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE779C44512
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 16:04:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6431B10E214;
	Thu, 16 Jul 2026 16:04:41 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE9910E030;
 Thu, 16 Jul 2026 16:04:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Compress_Gu?=
 =?utf-8?q?C_log_and_CTB_dump_with_zstd?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Jul 2026 16:04:40 -0000
Message-ID: <178421788010.198473.11967986126679900741@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260716155114.1427366-1-zhanjun.dong@intel.com>
In-Reply-To: <20260716155114.1427366-1-zhanjun.dong@intel.com>
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

Series: drm/xe/guc: Compress GuC log and CTB dump with zstd
URL   : https://patchwork.freedesktop.org/series/170589/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4716a899185c6ad8284c5a6d8782e53b07085150
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Date:   Thu Jul 16 11:51:14 2026 -0400

    drm/xe/guc: Compress GuC log and CTB dump with zstd
    
    Replace the raw ascii85 dumps of GuC log snapshots with a
    zstd-compressed ascii85 stream and reuse the same helper for CTB
    snapshot output.
    
    Use zstd streaming with default level-3 parameters and an estimated
    source size of 0 so the compression workspace stays bounded even for
    multi-megabyte logs.
    
    Add a new Kconfig option DRM_XE_COMPRESS_DUMP to control whether
    GuC log and CTB dumps are compressed with ZSTD. This allows users to
    choose between reduced dump sizes or lower memory usage.
    
    Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
+ /mt/dim checkpatch 7fb776db50ccd72e7625c246c42157fa35274a24 drm-intel
a96b3097da15 drm/xe: Remove extra newlines from LRC snapshot dump
4716a899185c drm/xe/guc: Compress GuC log and CTB dump with zstd
-:192: CHECK:CAMELCASE: Avoid CamelCase: <cParams>
#192: FILE: drivers/gpu/drm/xe/xe_guc_log.c:255:
+	wksp_size = zstd_cstream_workspace_bound(&params.cParams);

-:219: CHECK:CAMELCASE: Avoid CamelCase: <ZSTD_isError>
#219: FILE: drivers/gpu/drm/xe/xe_guc_log.c:282:
+			if (ZSTD_isError(ret)) {

-:221: CHECK:CAMELCASE: Avoid CamelCase: <ZSTD_getErrorName>
#221: FILE: drivers/gpu/drm/xe/xe_guc_log.c:284:
+					  ZSTD_getErrorName(ret));

-:382: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#382: 
new file mode 100644

total: 0 errors, 1 warnings, 3 checks, 325 lines checked


