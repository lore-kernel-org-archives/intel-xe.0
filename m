Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B011CC54F54
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 16:00:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B35810F2EC;
	Fri, 31 Jul 2026 16:00:13 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49A810F2EC;
 Fri, 31 Jul 2026 16:00:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Compress_Gu?=
 =?utf-8?q?C_log_and_CTB_dump_with_zstd_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Jul 2026 16:00:11 -0000
Message-ID: <178551361190.9497.10525515933257507126@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260731155411.496975-1-zhanjun.dong@intel.com>
In-Reply-To: <20260731155411.496975-1-zhanjun.dong@intel.com>
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

Series: drm/xe/guc: Compress GuC log and CTB dump with zstd (rev3)
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
commit 067d55f3f5ceacc80cd72f91791415c630abbdb6
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Date:   Fri Jul 31 11:54:11 2026 -0400

    drm/xe/guc: Compress GuC log and CTB dump with zstd
    
    With the default settings, the GuC log is several megabytes in size.
    Printing the entire log is time-consuming. In debugging scenarios,
    printing the GuC log to dmesg while forwarding the dmesg output to a
    serial console can take several minutes. It can also exhaust the storage
    allocated to CI logs. Follow i915's approach and compress the GuC dump
    data to address these issues.
    
    Replace the raw ascii85 dumps of GuC log snapshots with a
    zstd-compressed ascii85 stream and reuse the same helper for CTB
    snapshot output.
    
    Use zstd streaming with the default compression level of 3 and an
    estimated source size of 0 so the compression workspace stays bounded
    even for multi-megabyte logs.
    
    Add a new Kconfig option DRM_XE_COMPRESS_DUMP to control whether
    GuC log and CTB dumps are compressed with ZSTD. This allows users to
    choose between reduced dump sizes and lower memory usage.
    
    Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
+ /mt/dim checkpatch f9ef9f302ee01854066ec6da30550da6ea6cb03a drm-intel
57914a8d885c drm/xe: Remove extra newlines from LRC snapshot dump
067d55f3f5ce drm/xe/guc: Compress GuC log and CTB dump with zstd
-:199: CHECK:CAMELCASE: Avoid CamelCase: <cParams>
#199: FILE: drivers/gpu/drm/xe/xe_guc_log.c:255:
+	wksp_size = zstd_cstream_workspace_bound(&params.cParams);

-:226: CHECK:CAMELCASE: Avoid CamelCase: <ZSTD_isError>
#226: FILE: drivers/gpu/drm/xe/xe_guc_log.c:282:
+			if (ZSTD_isError(ret)) {

-:228: CHECK:CAMELCASE: Avoid CamelCase: <ZSTD_getErrorName>
#228: FILE: drivers/gpu/drm/xe/xe_guc_log.c:284:
+					  ZSTD_getErrorName(ret));

total: 0 errors, 0 warnings, 3 checks, 321 lines checked


