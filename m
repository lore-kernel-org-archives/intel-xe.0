Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624BFCA1012
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 09:31:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB0010E9CD;
	Thu,  4 Sep 2025 09:31:47 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6244610E9CD;
 Thu,  4 Sep 2025 09:31:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_GT_runtime_susp?=
 =?utf-8?q?end/resume?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Sep 2025 09:31:45 -0000
Message-ID: <175697830540.302421.4826034885696497028@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250904091439.2279352-1-raag.jadav@intel.com>
In-Reply-To: <20250904091439.2279352-1-raag.jadav@intel.com>
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

Series: Introduce GT runtime suspend/resume
URL   : https://patchwork.freedesktop.org/series/154017/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e0fa7d6ad11ac6dc8dfa757164e518968a98b897
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b5961a054572f550c2f5521780ebb4524bb26abb
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Thu Sep 4 14:44:39 2025 +0530

    drm/xe/gt: Introduce runtime suspend/resume
    
    If power state is retained between suspend/resume cycle, we don't need
    to perform full GT re-initialization. Introduce runtime helpers for GT
    which greatly reduce suspend/resume delay.
    
    v2: Drop redundant xe_gt_sanitize() and xe_guc_ct_stop() (Daniele)
        Use runtime naming for guc helpers (Daniele)
    v3: Drop redundant logging, add kernel doc (Michal)
        Use runtime naming for ct helpers (Michal)
    v4: Fix tags (Rodrigo)
    
    Co-developed-by: Riana Tauro <riana.tauro@intel.com>
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch 76dbb37ec196e36c129b63b102b4884c90506bd7 drm-intel
d640141f8dc5 drm/xe/guc: Split xe_guc_ct_enable()
-:44: WARNING:MEMORY_BARRIER: memory barrier without comment
#44: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:517:
+	smp_mb();

total: 0 errors, 1 warnings, 0 checks, 64 lines checked
b5961a054572 drm/xe/gt: Introduce runtime suspend/resume


