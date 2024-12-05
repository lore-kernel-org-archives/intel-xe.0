Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6222DE77170
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 18:32:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B59A10EF68;
	Thu,  5 Dec 2024 18:32:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6633910EF68;
 Thu,  5 Dec 2024 18:32:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_reg=5Fsr/whitelist_fixes_?=
 =?utf-8?q?and_refactors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Dec 2024 18:32:54 -0000
Message-ID: <173342357441.3057357.7976553168737546565@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241205182240.3463027-1-lucas.demarchi@intel.com>
In-Reply-To: <20241205182240.3463027-1-lucas.demarchi@intel.com>
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

Series: reg_sr/whitelist fixes and refactors
URL   : https://patchwork.freedesktop.org/series/142195/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4a700b13f2a9f2aed5036e32c6d7fbcb972a0112
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Dec 5 10:22:40 2024 -0800

    drm/xe: Apply whitelist to engine save-restore
    
    Instead of handling the whitelist directly in the GuC ADS
    initialization, make it follow the same logic as other engine registers
    that are save-restored. Main benefit is that then the SW tracking then
    shows it in debugfs and there's no risk of an engine workaround to write
    to the same nopriv register that is being passed directly to GuC.
    
    This means that xe_reg_whitelist_process_engine() then only process the
    RTP, converting it to sr entries and then add those entries to the
    engine sr. With that all the registers should be covered by
    xe_reg_sr_apply_mmio() to write to the HW and there's no special
    handling in GuC ADS to also add these registers.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch ab26b8eb1a5191f86d7b778e71a15d34fb4737ce drm-intel
2831cc223d2d drm/xe/reg_sr: Remove register pool
-:24: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '6f9f4763bc94', maybe rebased or not pulled?
#24: 
Fixes: 6f9f4763bc94 ("drm/xe/reg_sr: Remove register pool")

total: 0 errors, 1 warnings, 0 checks, 71 lines checked
33e31c55f5c0 drm/xe/reg_sr: Write all whitelist slots
a610e32dcf8c drm/xe: Add xe_gt_dbg_printer
c4bdeaf083b3 drmxe/reg_sr: Convert whitelist to gt logging
4a700b13f2a9 drm/xe: Apply whitelist to engine save-restore


