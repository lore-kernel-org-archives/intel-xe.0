Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55E6CD4F26
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 07:41:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5D410E1C1;
	Tue, 12 May 2026 07:41:26 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9422D10E1C1;
 Tue, 12 May 2026 07:41:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_shrink_and_comp?=
 =?utf-8?q?ress_GuC_snapshot_dumps_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 12 May 2026 07:41:25 -0000
Message-ID: <177857168560.60605.1952288988869490343@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260511194924.2016315-1-zhanjun.dong@intel.com>
In-Reply-To: <20260511194924.2016315-1-zhanjun.dong@intel.com>
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

Series: drm/xe: shrink and compress GuC snapshot dumps (rev2)
URL   : https://patchwork.freedesktop.org/series/166158/
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
commit 1223db4007b25bfc786970cb979709a5d1166841
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Date:   Mon May 11 15:49:24 2026 -0400

    drm/xe/guc: Reduce GuC log size from 8MB to 2MB
    
    Reduce the default log buffer size to improve system responsiveness and
    readability. The previous 8MB threshold caused significant delays during
    log output and imposed a heavy load when printing to dmesg.
    
    By reducing the size to 2MB, we maintain a sufficient history while
    ensuring faster flushing. With a typical 4:1 compression ratio, this 2MB
    buffer will result in approximately 512KB of compressed data, providing an
    efficient balance between log depth and system performance.
    
    Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
+ /mt/dim checkpatch c6594391e31ec1f55e4eb22a05b5d1a017c433aa drm-intel
73b6e61c5c14 drm/xe/guc: Compress GuC log and CTB dump with zstd
-:105: CHECK:CAMELCASE: Avoid CamelCase: <cParams>
#105: FILE: drivers/gpu/drm/xe/xe_guc_log.c:266:
+	wksp_size = zstd_cstream_workspace_bound(&params.cParams);

total: 0 errors, 0 warnings, 1 checks, 166 lines checked
209247ff6850 drm/xe: Remove extra newlines from LRC snapshot dump
1223db4007b2 drm/xe/guc: Reduce GuC log size from 8MB to 2MB


