Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E008C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 14:39:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F85D10E2BE;
	Mon, 27 Nov 2023 14:39:46 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 74D3310E2B6;
 Mon, 27 Nov 2023 14:39:44 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 70DACA0169;
 Mon, 27 Nov 2023 14:39:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Date: Mon, 27 Nov 2023 14:39:44 -0000
Message-ID: <170109598446.3004.1807844717935975824@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231127141125.2913415-1-riana.tauro@intel.com>
In-Reply-To: <20231127141125.2913415-1-riana.tauro@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_En?=
 =?utf-8?q?gine_Busyness?=
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

Series: Engine Busyness
URL   : https://patchwork.freedesktop.org/series/126919/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8f11e6113ace031a2f3b53a24bc16679dc7b7fbe
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Mon Nov 27 19:41:25 2023 +0530

    RFC drm/xe/guc: Handle runtime suspend issues for engine busyness
    
    1) During runtime suspend, when card enters D3hot, values read
        from the shared memory maintained by GuC returns 0xFF.
        Waking up for every perf read when
        device is runtime suspended causes power penality.
        Store the last read busy ticks and total active ticks and return
        these values when suspended
    
     2) When the device is runtime resumed, guc is loaded again. If pmu
        interface was opened to collect busyness events, the guc stats
        have to be re-enabled to resume collection after suspend.
        Disable/enable guc stats if pmu is opened and is already collecting
        busyness events and device gets runtime suspended/resumed.
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 7c4b213b5a33fc591a5c92910292aea30193f96c drm-intel
ead33731f RFC drm/xe: Move user engine class mappings to header
847cf12ac RFC drm/xe/guc: Add interface for engine busyness ticks
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:109: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#109: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 274 lines checked
1f0ff0d4f RFC drm/xe/guc: Expose engine busyness only for supported GuC version
75a8af35b RFC drm/xe/guc: Add PMU counter for total active ticks
104cefe81 RFC drm/xe/uapi: Add configs for Engine busyness
e64137d3b RFC drm/xe/pmu: Add PMU counters for engine busy ticks
-:250: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#250: FILE: drivers/gpu/drm/xe/xe_pmu.c:555:
+						      __DRM_XE_PMU_ENGINE(j, xe_engine_to_user_class[hwe->class],

total: 0 errors, 1 warnings, 0 checks, 209 lines checked
85ee8e178 RFC drm/xe/guc: Dynamically enable/disable engine busyness stats
8f11e6113 RFC drm/xe/guc: Handle runtime suspend issues for engine busyness


