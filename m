Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6C0C88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 18:11:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B71410EA63;
	Tue, 15 Sep 2026 18:11:00 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B902610F05B;
 Tue, 15 Sep 2026 18:10:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Compress_Gu?=
 =?utf-8?q?C_log_and_CTB_dump_with_zstd_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Sep 2026 18:10:58 -0000
Message-ID: <178949585875.166934.9298222214479414035@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260915174840.531473-4-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20260915174840.531473-4-alan.previn.teres.alexis@intel.com>
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

Series: drm/xe/guc: Compress GuC log and CTB dump with zstd (rev5)
URL   : https://patchwork.freedesktop.org/series/170589/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0abb804c22f997ef9709fe8b169670496886de13
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Date:   Tue Sep 15 10:48:40 2026 -0700

    drm/xe/guc: Compress GuC log and CTB dump with zstd
    
    With default settings, GuC log is 8MB in size and
    dumping the log is time-consuming. In debugging scenarios,
    dump-to-dmesg suffers truncation loss because CI's size limit is 2MB.
    Additionally, if also forwarded to serial console, it takes several
    minutes. In use-case of continuous error+log collection over extended
    period, we pressure CI's allocated storage. Thus, compress the
    GuC log data dump to address these issues and multiply any benefits
    from a future upgrade in CI's size limits.
    
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
    Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
    Acked-by: José Roberto de Souza <jose.souza@intel.com>
    Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8 drm-intel
02613dd07e0d drm/xe: Remove extra newlines from LRC snapshot dump
0abb804c22f9 drm/xe/guc: Compress GuC log and CTB dump with zstd
-:207: CHECK:CAMELCASE: Avoid CamelCase: <cParams>
#207: FILE: drivers/gpu/drm/xe/xe_guc_log.c:255:
+	wksp_size = zstd_cstream_workspace_bound(&params.cParams);

-:234: CHECK:CAMELCASE: Avoid CamelCase: <ZSTD_isError>
#234: FILE: drivers/gpu/drm/xe/xe_guc_log.c:282:
+			if (ZSTD_isError(ret)) {

-:236: CHECK:CAMELCASE: Avoid CamelCase: <ZSTD_getErrorName>
#236: FILE: drivers/gpu/drm/xe/xe_guc_log.c:284:
+					  ZSTD_getErrorName(ret));

total: 0 errors, 0 warnings, 3 checks, 321 lines checked


