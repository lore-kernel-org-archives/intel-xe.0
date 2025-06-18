Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADA0C71157
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 18:56:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C29C10E910;
	Wed, 18 Jun 2025 18:56:02 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB51A10E8EE;
 Wed, 18 Jun 2025 18:56:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Update_Wa=5F220?=
 =?utf-8?q?19338487_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Jun 2025 18:56:00 -0000
Message-ID: <175027296086.92817.7940764311732354329@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250618-wa-22019338487-v5-0-b888388477f2@intel.com>
In-Reply-To: <20250618-wa-22019338487-v5-0-b888388477f2@intel.com>
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

Series: drm/xe: Update Wa_22019338487 (rev2)
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
commit 10c14f1596364be0400b92da66ae948103b6f602
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Wed Jun 18 11:50:01 2025 -0700

    drm/xe/bmg: Update Wa_22019338487
    
    Limit GT max frequency to 2600MHz and wait for frequency to reduce
    before proceeding with a transient flush. This is really only needed for
    the transient flush: if L2 flush is needed due to 16023588340 then
    there's no need to do this additional wait since we are already using
    the bigger hammer.
    
    v2: Use generic names, ensure user set max frequency requests wait
    for flush to complete (Rodrigo)
    v3:
     - User requests wait via wait_var_event_timeout (Lucas)
     - Close races on flush + user requests (Lucas)
     - Fix xe_guc_pc_remove_flush_freq_limit() being called on last gt
       rather than root gt (Lucas)
    v4:
     - Only apply the freq reducing part if a TDF is needed: L2 flush trumps
       the need for waiting a lower frequency
    
    Fixes: aaa08078e725 ("drm/xe/bmg: Apply Wa_22019338487")
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v3
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch b5956fc71790f85e9c9113adf1d9c7332c995f13 drm-intel
576b9209863c drm/xe/guc_pc: Add _locked variant for min/max freq
-:108: CHECK:LINE_SPACING: Please don't use multiple blank lines
#108: FILE: drivers/gpu/drm/xe/xe_guc_pc.c:627:
+
+

total: 0 errors, 0 warnings, 1 checks, 183 lines checked
cfceef313427 drm/xe/xe_guc_pc: Lock once to update stashed frequencies
8dd48df5907e drm/xe: Split xe_device_td_flush()
10c14f159636 drm/xe/bmg: Update Wa_22019338487


