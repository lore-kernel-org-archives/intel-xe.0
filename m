Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742DAF8A175
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 13:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3299710E1D7;
	Thu, 16 Apr 2026 13:24:54 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A137C10E1D7;
 Thu, 16 Apr 2026 13:24:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pf=3A_Fix_VF=27s_s?=
 =?utf-8?q?cheduling_priority_reporting?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Apr 2026 13:24:53 -0000
Message-ID: <177634589364.468958.15292388239878880366@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260416131831.7302-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260416131831.7302-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/pf: Fix VF's scheduling priority reporting
URL   : https://patchwork.freedesktop.org/series/164999/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c3fd9b709b83606760957cf6dd54832fad3fd5c5
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Apr 16 15:18:31 2026 +0200

    drm/xe/pf: Fix VF's scheduling priority reporting
    
    When preparing number of impacted VFs parameter for the reporting
    helper function, we wrongly ended with adding +1 (representing PF)
    twice, since local variable total_vfs was already adjusted. This
    resulted in printing a message that was referring to an invalid VF:
    
     [] xe ... [drm] PF: Enabled 2 of 24 VFs
     [] xe ... [drm] PF: Tile0: GT0: PF..VF25 provisioned with 0(low) scheduling priority
    
    Fix variable initialization and adjust the loop accordingly.
    
    Fixes: fbbf73a81b84 ("drm/xe/pf: Force new VFs prorities only once")
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 207a25698a481a39132b52060d7bb294384876ac drm-intel
c3fd9b709b83 drm/xe/pf: Fix VF's scheduling priority reporting
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
 [] xe ... [drm] PF: Tile0: GT0: PF..VF25 provisioned with 0(low) scheduling priority

total: 0 errors, 1 warnings, 0 checks, 16 lines checked


