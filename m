Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8409CD3F283
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 20:08:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BE710E982;
	Fri, 18 Oct 2024 20:08:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C3210E97B;
 Fri, 18 Oct 2024 20:08:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_xe3lpd_edp_enabling_?=
 =?utf-8?q?=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Oct 2024 20:08:48 -0000
Message-ID: <172928212856.1282733.4180287734173644534@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241018200311.67324-1-matthew.s.atwood@intel.com>
In-Reply-To: <20241018200311.67324-1-matthew.s.atwood@intel.com>
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

Series: Add xe3lpd edp enabling (rev4)
URL   : https://patchwork.freedesktop.org/series/139732/
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
commit e0acbf066cbb1f8f17324c1a2ba2aa861b8a8cd2
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Oct 18 13:03:11 2024 -0700

    drm/i915/xe3lpd: Add condition for EDP to powerdown P2.PG
    
    Add condition for P2.PG power down value.
    
    v2: change subject line to better match patch condition
    
    Bspec: 74494
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
    Reviewed-by: Mika Kahola <mika.kahola@intel.com>
+ /mt/dim checkpatch fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403 drm-intel
5db2b14bb45e drm/i915/xe3lpd: Update pmdemand programming
-:75: ERROR:ELSE_AFTER_BRACE: else should follow close brace '}'
#75: FILE: drivers/gpu/drm/i915/display/intel_pmdemand.c:341:
+	}
+	else

total: 1 errors, 0 warnings, 0 checks, 161 lines checked
8f4de4964b65 drm/i915/xe3lpd: Add cdclk changes
-:15: WARNING:TYPO_SPELLING: 'doesnt' may be misspelled - perhaps 'doesn't'?
#15: 
v3: xe3lpd doesnt supply the power control unit the voltage index
           ^^^^^^

total: 0 errors, 1 warnings, 0 checks, 89 lines checked
31c84c3f4a43 drm/i915/xe3lpd: Disable HDCP Line Rekeying for Xe3
48d26fbe2fd8 drm/i915/xe3lpd: Add C20 Phy consolidated programming table
1ad090c03a20 drm/i915/xe3lpd: Add new bit range of MAX swing setup
-:9: WARNING:TYPO_SPELLING: 'seperate' may be misspelled - perhaps 'separate'?
#9: 
v2: implement as two seperate macros instead of a single macro
                     ^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
f02cf1b3ada8 drm/i915/xe3lpd: Add check to see if edp over type c is allowed
e0acbf066cbb drm/i915/xe3lpd: Add condition for EDP to powerdown P2.PG


