Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56069C369C2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 23:46:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6F410E3D4;
	Thu, 17 Apr 2025 23:46:17 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5EAC10E3D4;
 Thu, 17 Apr 2025 23:46:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Revert_=22drm/xe=3A_enabl?=
 =?utf-8?q?e_lite_restore=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Apr 2025 23:46:15 -0000
Message-ID: <174493357567.16566.18311747262445861479@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250417233528.455736-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20250417233528.455736-1-umesh.nerlige.ramappa@intel.com>
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

Series: Revert "drm/xe: enable lite restore"
URL   : https://patchwork.freedesktop.org/series/147946/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 861e5fb517c98d40c725c7c3bcd7226b63f38292
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Thu Apr 17 16:35:28 2025 -0700

    Revert "drm/xe: enable lite restore"
    
    Lite restore is breaking some functionality in MangoHud. While lite
    restore is certainly preferable, it is throwing off per context
    utilization calculations that rely on the context switching out. The
    utilization counters are used by MangoHud to overlay GPU utilization on
    screen.
    
    Hold off on enabling lite restore until we find a better way to
    accomodate lite restore with per context utilization counters.
    
    This reverts commit 6ef3bb60557d5e7f5af442c8c9ef0a9190bf3d23.
    
    Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4532
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch 5cd835ef6352a207fa4177184b397dfd82989e5d drm-intel
861e5fb517c9 Revert "drm/xe: enable lite restore"
-:13: WARNING:TYPO_SPELLING: 'accomodate' may be misspelled - perhaps 'accommodate'?
#13: 
accomodate lite restore with per context utilization counters.
^^^^^^^^^^

-:17: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'Fixes:', use 'Link:' or 'Closes:' instead
#17: 
Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4532

total: 0 errors, 2 warnings, 0 checks, 15 lines checked


