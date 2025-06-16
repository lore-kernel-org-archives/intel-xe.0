Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C2EC71135
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 06:24:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB6889496;
	Mon, 16 Jun 2025 06:24:06 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB58589496;
 Mon, 16 Jun 2025 06:24:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Update_Wa=5F220?=
 =?utf-8?q?19338487?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Jun 2025 06:24:04 -0000
Message-ID: <175005504476.80687.18054854654333281577@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250615-wa-22019338487-v4-0-704830697cbc@intel.com>
In-Reply-To: <20250615-wa-22019338487-v4-0-704830697cbc@intel.com>
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

Series: drm/xe: Update Wa_22019338487
URL   : https://patchwork.freedesktop.org/series/150300/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ccc12ce506e8d31c302ab2fe7ca9f8acea1f18ba
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Sun Jun 15 23:17:36 2025 -0700

    drm/xe/bmg: Update Wa_22019338487
    
    Limit GT max frequency to 2600Mhz during the L2 flush. Also, ensure
    GT actual frequency is limited to that value before performing the
    cache flush.
    
    v2: Use generic names, ensure user set max frequency requests wait
    for flush to complete (Rodrigo)
    v3:
     - User requests wait via wait_var_event_timeout (Lucas)
     - Close races on flush + user requests (Lucas)
     - Fix xe_guc_pc_remove_flush_freq_limit() being called on last gt
       rather than root gt (Lucas)
    
    Fixes: aaa08078e725 ("drm/xe/bmg: Apply Wa_22019338487")
    Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 4368f15da5e7f44130af5d76997265e5d48f3f45 drm-intel
7a0f47279c44 drm/xe/guc_pc: Add _locked variant for min/max freq
-:107: CHECK:LINE_SPACING: Please don't use multiple blank lines
#107: FILE: drivers/gpu/drm/xe/xe_guc_pc.c:627:
+
+

total: 0 errors, 0 warnings, 1 checks, 183 lines checked
94c8134ac756 drm/xe/xe_guc_pc: Lock once to update stashed frequencies
ccc12ce506e8 drm/xe/bmg: Update Wa_22019338487


