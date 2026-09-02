Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91589C624D4
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 23:46:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F3210E073;
	Wed,  2 Sep 2026 23:46:35 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0A310E073;
 Wed,  2 Sep 2026 23:46:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Compress_Gu?=
 =?utf-8?q?C_log_and_CTB_dump_with_zstd_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Sep 2026 23:46:33 -0000
Message-ID: <178839279362.115662.3811940446753950389@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260902234039.885267-4-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20260902234039.885267-4-alan.previn.teres.alexis@intel.com>
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

Series: drm/xe/guc: Compress GuC log and CTB dump with zstd (rev4)
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
commit 1f0b3effd6f85c04cb02f0b88768bf6c4c499a7e
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Date:   Wed Sep 2 16:40:34 2026 -0700

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
    Acked-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch bb742c97086d95b2a04b1b8fbc67822b4cf848c3 drm-intel
b84f530eaccd drm/xe: Remove extra newlines from LRC snapshot dump
1f0b3effd6f8 drm/xe/guc: Compress GuC log and CTB dump with zstd
-:205: CHECK:CAMELCASE: Avoid CamelCase: <cParams>
#205: FILE: drivers/gpu/drm/xe/xe_guc_log.c:255:
+	wksp_size = zstd_cstream_workspace_bound(&params.cParams);

-:232: CHECK:CAMELCASE: Avoid CamelCase: <ZSTD_isError>
#232: FILE: drivers/gpu/drm/xe/xe_guc_log.c:282:
+			if (ZSTD_isError(ret)) {

-:234: CHECK:CAMELCASE: Avoid CamelCase: <ZSTD_getErrorName>
#234: FILE: drivers/gpu/drm/xe/xe_guc_log.c:284:
+					  ZSTD_getErrorName(ret));

total: 0 errors, 0 warnings, 3 checks, 321 lines checked


