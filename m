Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F2ECA5FFC
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 17:57:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862FE10E3B4;
	Tue,  6 Oct 2026 17:57:49 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F8C10E23C;
 Tue,  6 Oct 2026 17:57:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Compress_Gu?=
 =?utf-8?q?C_log_and_CTB_dump_with_zstd_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Oct 2026 17:57:49 -0000
Message-ID: <179130946926.244745.13798680341478021556@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261006175129.3366784-5-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20261006175129.3366784-5-alan.previn.teres.alexis@intel.com>
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

Series: drm/xe/guc: Compress GuC log and CTB dump with zstd (rev6)
URL   : https://patchwork.freedesktop.org/series/170589/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6decc17a497688f6f7dda78ed2e324bd9af15901
Author: Alan Previn <alan.previn.teres.alexis@intel.com>
Date:   Tue Oct 6 10:51:31 2026 -0700

    drm/xe/guc: Add dump_cache to optimize GuC CT/Log compression flow
    
    During xe_devcoredump preparation, __xe_devcoredump_read is invoked
    multiple times, the first time just to get the output size.
    We should avoid time and energy waste of recompressing the
    GuC-log-event buffer and GuC-CT buffers repeatedly.
    
    Thus, add a dump_cache structure into GuC CT and log snapshot
    structures to attempt and store a first pass at compressing
    these buffers for reuse on subsequent calls to __xe_devcoredump_read.
    
    Also, ensure any failure of the first compression attempt will still
    fallback to store the raw dump without compression which is also
    required when CONFIG_DRM_XE_COMPRESS_DUMP is not enabled.
    
    Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
    Assisted-by: LLM
+ /mt/dim checkpatch daeb062fc40f727fafefed080c6d12a5ad1d0d12 drm-intel
154630132fa2 drm/xe: Remove extra newlines from LRC snapshot dump
235f065d486a drm/xe/guc: Compress GuC log and CTB dump with zstd
-:201: CHECK:CAMELCASE: Avoid CamelCase: <cParams>
#201: FILE: drivers/gpu/drm/xe/xe_guc_log.c:256:
+	wksp_size = zstd_cstream_workspace_bound(&params.cParams);

-:235: CHECK:CAMELCASE: Avoid CamelCase: <ZSTD_isError>
#235: FILE: drivers/gpu/drm/xe/xe_guc_log.c:290:
+			if (ZSTD_isError(ret)) {

-:237: CHECK:CAMELCASE: Avoid CamelCase: <ZSTD_getErrorName>
#237: FILE: drivers/gpu/drm/xe/xe_guc_log.c:292:
+					  ZSTD_getErrorName(ret));

total: 0 errors, 0 warnings, 3 checks, 322 lines checked
6decc17a4976 drm/xe/guc: Add dump_cache to optimize GuC CT/Log compression flow


