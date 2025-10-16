Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEA2CCD199
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 13:03:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF3310E9DB;
	Thu, 16 Oct 2025 13:03:29 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816F310E9E5;
 Thu, 16 Oct 2025 13:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_GT_runtime_susp?=
 =?utf-8?q?end/resume_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Oct 2025 13:03:28 -0000
Message-ID: <176061980852.22299.2877660057456500012@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251014073036.3282329-1-raag.jadav@intel.com>
In-Reply-To: <20251014073036.3282329-1-raag.jadav@intel.com>
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

Series: Introduce GT runtime suspend/resume (rev3)
URL   : https://patchwork.freedesktop.org/series/154017/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 29f4b6eab54d27b93c0bee7aa1d9ea29e09635cb
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Tue Oct 14 13:00:36 2025 +0530

    drm/xe/gt: Introduce runtime suspend/resume
    
    If power state is retained between suspend/resume cycle, we don't need
    to perform full GT re-initialization. Introduce runtime helpers for GT
    which greatly reduce suspend/resume delay.
    
    v2: Drop redundant xe_gt_sanitize() and xe_guc_ct_stop() (Daniele)
        Use runtime naming for guc helpers (Daniele)
    v3: Drop redundant logging, add kernel doc (Michal)
        Use runtime naming for ct helpers (Michal)
    v4: Fix tags (Rodrigo)
    v5: Include host_l2_vram workaround (Daniele)
        Reuse xe_guc_submit_enable/disable() helpers (Daniele)
    
    Co-developed-by: Riana Tauro <riana.tauro@intel.com>
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch c381038b8c345fb0313a67c6eef0a596e5e91070 drm-intel
24509b763b23 drm/xe/guc: Make xe_guc_submit_pause() available for non-VF cases
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
> > > Drop xe_gt_assert() meant for VF migration and make xe_guc_submit_pause()

-:36: WARNING:TYPO_SPELLING: 'loosing' may be misspelled - perhaps 'losing'?
#36: 
> behaviour here (stop/start submission on a scheduler without loosing
                                                               ^^^^^^^

-:79: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 2 warnings, 0 checks, 31 lines checked
29f4b6eab54d drm/xe/gt: Introduce runtime suspend/resume


