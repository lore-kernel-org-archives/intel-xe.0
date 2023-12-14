Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922B5C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 23:48:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B61A10E98F;
	Thu, 14 Dec 2023 23:48:37 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9D4FD10E2F9;
 Thu, 14 Dec 2023 23:48:34 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 78942AADD5;
 Thu, 14 Dec 2023 23:48:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/dg2=3A_Drop_pre-pr?=
 =?utf-8?q?oduction_workarounds?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Thu, 14 Dec 2023 23:48:34 -0000
Message-ID: <170259771449.19959.4707956572818470478@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231214215159.2352350-2-matthew.d.roper@intel.com>
In-Reply-To: <20231214215159.2352350-2-matthew.d.roper@intel.com>
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

Series: drm/xe/dg2: Drop pre-production workarounds
URL   : https://patchwork.freedesktop.org/series/127846/
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
commit 6495d26450ae1a2777681097a1a51f380f69b09d
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Thu Dec 14 13:52:00 2023 -0800

    drm/xe/dg2: Drop pre-production workarounds
    
    Pre-production hardware is anything before C0 (for DG2-G10), before B1
    (for DG2-G11), or before A1 (for DG2-G12).  Workarounds specific to such
    hardware was already removed from i915 in commit eaeb4b361452
    ("drm/i915/dg2: Drop pre-production GT workarounds") and there's even
    less value keeping these around in the Xe driver.
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch e9f8fa579c5f7a0b1a08ffeeaa03fe7ef4981b3c drm-intel
6495d2645 drm/xe/dg2: Drop pre-production workarounds
-:8: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'eaeb4b361452', maybe rebased or not pulled?
#8: 
hardware was already removed from i915 in commit eaeb4b361452

total: 0 errors, 1 warnings, 0 checks, 253 lines checked


