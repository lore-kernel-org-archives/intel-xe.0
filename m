Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD03C2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 17:29:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B3310E11A;
	Thu, 27 Jun 2024 17:29:40 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B1C10E11A;
 Thu, 27 Jun 2024 17:29:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fixes_and_cleanup_for_per?=
 =?utf-8?q?_client_utilization?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Jun 2024 17:29:40 -0000
Message-ID: <171950938013.164687.14823928985862689866@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240627172348.84991-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20240627172348.84991-1-umesh.nerlige.ramappa@intel.com>
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

Series: Fixes and cleanup for per client utilization
URL   : https://patchwork.freedesktop.org/series/135486/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f1778620619a8ab00f6e7d722fa23321f002646c
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Fri Jun 28 01:23:48 2024 +0800

    drm/xe: Get hwe domain specific FW to read RING_TIMESTAMP
    
    Per client engine utilization uses RING_TIMESTAMP to return drm-total-cycles to
    the user. Current code uses XE_FW_GT to read this register on the first
    available engine in a GT. When testing on DG2, it is observed that this value is
    0 when running test on some engines. To resolve that, get the hwe domain
    specific FW for reading the engine timestamp.
    
    v2:
    - update commit message
    - use domain specific FW (Matt)
    
    v3:
    - Drop check for hwe in the helper (Matt, Michal)
    
    Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 70d56bd71f6cd050ce86235c8abd62b701916c75 drm-intel
27183965f305 drm/xe: Use a helper to get delta run ticks from the exec queue
-:43: ERROR:TRAILING_WHITESPACE: trailing whitespace
#43: FILE: drivers/gpu/drm/xe/xe_exec_queue.c:790:
+ * xe_exec_queue_delta_run_ticks() - Get delta of queue run_ticks $

total: 1 errors, 0 warnings, 0 checks, 43 lines checked
f1778620619a drm/xe: Get hwe domain specific FW to read RING_TIMESTAMP
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
Per client engine utilization uses RING_TIMESTAMP to return drm-total-cycles to

total: 0 errors, 1 warnings, 0 checks, 32 lines checked


