Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B59C54798
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 13:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10AB010E0E8;
	Tue, 27 Feb 2024 13:18:01 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A73210E0E8;
 Tue, 27 Feb 2024 13:17:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?3=2C1/3=5D_=60drm/xe=3A_Move_lrc_snapshot_capturing_to_xe=5Flrc?=
 =?utf-8?q?=2Ec?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Feb 2024 13:17:59 -0000
Message-ID: <170903987950.337360.849242532189024290@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240227131248.92910-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240227131248.92910-1-maarten.lankhorst@linux.intel.com>
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

Series: series starting with [v3,1/3] `drm/xe: Move lrc snapshot capturing to xe_lrc.c
URL   : https://patchwork.freedesktop.org/series/130434/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d0ddc5b3d1923d979762adbe4411bf47751451b2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 70df5993e14e438ce2c9a852b4f1af0f77ba8985
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Tue Feb 27 14:12:47 2024 +0100

    drm/xe: Implement capture of HWSP and HWCTX
    
    Dump the HWCTX and HWSP as part of LRC capture.
    
    Changes since v1:
    - Use same layout for HWSP and HWCTX as VM bo's, to simplify dumping.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch ed7aa4acb76bb65356169f2261a95c201a77f38a drm-intel
449b8bc2a5cf `drm/xe: Move lrc snapshot capturing to xe_lrc.c
453faef408d6 drm/xe: Add infrastructure for delayed LRC capture
-:45: CHECK:LINE_SPACING: Please don't use multiple blank lines
#45: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:1868:
 
+

total: 0 errors, 0 warnings, 1 checks, 82 lines checked
70df5993e14e drm/xe: Implement capture of HWSP and HWCTX


