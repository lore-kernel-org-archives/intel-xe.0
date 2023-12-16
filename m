Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABE0C35274
	for <intel-xe@archiver.kernel.org>; Sat, 16 Dec 2023 00:50:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A28D10EA7B;
	Sat, 16 Dec 2023 00:50:46 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id BF97810EA7B;
 Sat, 16 Dec 2023 00:50:44 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id BBEABA0169;
 Sat, 16 Dec 2023 00:50:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/dg2=3A_Drop_pre-pr?=
 =?utf-8?q?oduction_workarounds_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Sat, 16 Dec 2023 00:50:44 -0000
Message-ID: <170268784476.3476.922325283122744053@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231215214531.2576215-2-matthew.d.roper@intel.com>
In-Reply-To: <20231215214531.2576215-2-matthew.d.roper@intel.com>
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

Series: drm/xe/dg2: Drop pre-production workarounds (rev2)
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
commit a1811a8b3188f381ab1e607176e34bc4af403c80
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Fri Dec 15 13:45:31 2023 -0800

    drm/xe/dg2: Drop pre-production workarounds
    
    Pre-production hardware is anything before C0 (for DG2-G10), before B1
    (for DG2-G11), or before A1 (for DG2-G12).  Workarounds specific to such
    hardware was already removed from i915 in commit eaeb4b361452
    ("drm/i915/dg2: Drop pre-production GT workarounds") and there's even
    less value keeping these around in the Xe driver.
    
    v2:
     - Drop Wa_14011441408 from xe_mocs.c.  (Gustavo)
     - Drop Wa_14010648519, Wa_14010198302, and Wa_1608949956 which were
       mis-implemented; they were only supposed to apply to early steppings
       of DG2-G10, but were being applied unconditionally on all DG2.
       (Gustavo)
     - Drop reference to Wa_16011620976; the implementation stays because it
       still matches Wa_22015475538.  (Gustavo)
    
    Cc: Gustavo Sousa <gustavo.sousa@intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch c54005fdd0347a17088e7ff78070a55bf9103bc4 drm-intel
a1811a8b3 drm/xe/dg2: Drop pre-production workarounds
-:8: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'eaeb4b361452', maybe rebased or not pulled?
#8: 
hardware was already removed from i915 in commit eaeb4b361452

total: 0 errors, 1 warnings, 0 checks, 308 lines checked


