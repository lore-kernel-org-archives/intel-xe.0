Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB37C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 10:37:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB3EE10E6C7;
	Wed,  6 Dec 2023 10:37:28 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2C51010E6C7;
 Wed,  6 Dec 2023 10:37:27 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 29366A7DFF;
 Wed,  6 Dec 2023 10:37:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Wed, 06 Dec 2023 10:37:27 -0000
Message-ID: <170185904716.26426.13910958962003171716@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231206054615.884040-1-tejas.upadhyay@intel.com>
In-Reply-To: <20231206054615.884040-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe/xe2=3A_Add_workaround_18032095049_and_16021639441?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/xe2: Add workaround 18032095049 and 16021639441
URL   : https://patchwork.freedesktop.org/series/127406/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 616b5e39107d00405b35d210a2025f518d4a6b27
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Wed Dec 6 11:16:15 2023 +0530

    drm/xe/xe2: Add workaround 18032095049 and 16021639441
    
    This workaround applies to graphics 20.04 on all engines.
    
    Workaround has three parts :
    1. Pipe flush before MI_ATOMIC - This part isn't relevant to Xe
       (at least not right now) since we don't use MI_ATOMIC anywhere
       in the kernel mode driver.
    2. Memory-based interrupt masking - Memory-based interrupt processing
       isn't supported on physical functions, only virtual functions,
       according to bspec 60352. So this is probably only relevant once
       SRIOV support lands in the driver.
    3. Disabling CSB/timestamp updates to the ghwsp and pphwsp - Workaround
       is added by this change.
    
    The CSB reports to gHWSP and ppHWSP have been discussed as part
    of a different topic on some internal threads and we've confirmed
    that neither the KMD nor the GuC firmware use those for anything,
    so disabling them is always "safe" and should have no functional
    or performance impact on system operation.  The same is true for
    the timestamp updates in the ppHWSP as well.  Given that, it might
    make sense to just combine these two workarounds into a single
    record (and single patch) and apply it on all steppings. Disabling
    the reports for RCS on higher steppings doesn't have any kind of
    negative impact and will simplify the overall situation.
    
    V3(MattR):
      - Combine WA apply same WA for all engines, no performance impact
    V2(MattR):
      - Mention detail in commit message
      - Reorder bit define
      - Improve bit naming
      - Remove workaround part which isnt relevant
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 9d76164e08c68a3d5d081ff7b07c15a2cadf741a drm-intel
616b5e391 drm/xe/xe2: Add workaround 18032095049 and 16021639441
-:36: WARNING:TYPO_SPELLING: 'isnt' may be misspelled - perhaps 'isn't'?
#36: 
  - Remove workaround part which isnt relevant
                                 ^^^^

total: 0 errors, 1 warnings, 0 checks, 38 lines checked


