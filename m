Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E0DE77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 19:47:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A721410E011;
	Fri, 20 Dec 2024 19:47:50 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8B610E011;
 Fri, 20 Dec 2024 19:47:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_The_xe=5Fsa=5Fmanager_bas?=
 =?utf-8?q?ed_GuC_Buffer_Cache_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Dec 2024 19:47:49 -0000
Message-ID: <173472406944.898884.16634804751464707852@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241220194205.995-1-michal.wajdeczko@intel.com>
In-Reply-To: <20241220194205.995-1-michal.wajdeczko@intel.com>
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

Series: The xe_sa_manager based GuC Buffer Cache (rev2)
URL   : https://patchwork.freedesktop.org/series/142458/
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
commit 26125bb4e9a3f3e26aa8e8fd7c1c4b7c2b7bb708
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri Dec 20 20:42:04 2024 +0100

    drm/xe/kunit: Add KUnit tests for GuC Buffer Cache
    
    Add tests to make sure that recently added GuC Buffer Cache
    component is working as expected.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 0eede13975362b755a208b2e2ba322940013f183 drm-intel
84a1dc5e0f17 drm/xe/sa: Always call drm_suballoc_manager_fini()
f2698b2d9d4e drm/xe/sa: Drop redundant NULL assignments
9f5a58ef5c6f drm/xe/sa: Improve error message on init failure
5d4db061bdb6 drm/xe/sa: Tidy up coding style in init()
6de833c4d112 drm/xe/sa: Allow making suballocations using custom gfp flags
c7006331703b drm/xe/sa: Allow creating suballocator with custom guard size
efdb41527b7f drm/xe/sa: Minor header cleanups
d4e958ab6d09 drm/xe/guc: Introduce the GuC Buffer Cache
-:52: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#52: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 286 lines checked
cd6266605388 drm/xe/pf: Use GuC Buffer Cache during VFs provisioning
-:119: WARNING:LINE_SPACING: Missing a blank line after declarations
#119: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:310:
+	u32 max_cfg_dwords = xe_guc_buf_cache_dwords(&gt->uc.guc.buf);
+	CLASS(xe_guc_buf, buf)(&gt->uc.guc.buf, max_cfg_dwords);

total: 0 errors, 1 warnings, 0 checks, 127 lines checked
08e503edf2de drm/xe/kunit: Allow to replace xe_managed_bo_create_pin_map()
26125bb4e9a3 drm/xe/kunit: Add KUnit tests for GuC Buffer Cache
-:12: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#12: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 342 lines checked


