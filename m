Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F047E7717D
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 02:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD08810E2E4;
	Thu, 12 Dec 2024 02:20:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB0910E2E4;
 Thu, 12 Dec 2024 02:20:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_The_xe=5Fsa=5Fmanager_bas?=
 =?utf-8?q?ed_GuC_Buffer_Cache?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Dec 2024 02:20:35 -0000
Message-ID: <173397003532.1420692.812672512763037916@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
In-Reply-To: <20241212010141.389-1-michal.wajdeczko@intel.com>
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

Series: The xe_sa_manager based GuC Buffer Cache
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
commit 905fa2df7f4b33f83f70ea1acb443fba2385533e
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Dec 12 02:01:41 2024 +0100

    drm/xe/kunit: Add KUnit tests for GuC Buffer Cache
    
    Add tests to make sure that recently added GuC Buffer Cache
    component is working as expected.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch e70dbc9b6fd6666891756ed53e0404e0b48b11de drm-intel
34172515ed48 drm/xe/sa: Always call drm_suballoc_manager_fini()
1afcba50b1a4 drm/xe/sa: Drop redundant NULL assignments
91fdfd8f62a0 drm/xe/sa: Cleanup internal BO data at device removal
19feda54bb2e drm/xe/sa: Drop useless is_iomem member
7b90b07051a5 drm/xe/sa: Improve error message on init failure
c662a3563a3d drm/xe/sa: Tidy up coding style in init()
044bb9559cef drm/xe/sa: Allow making suballocations using custom gfp flags
e3d29afdbcaa drm/xe/sa: Allow creating suballocator with custom guard size
c06aab936210 drm/xe/sa: Minor header cleanups
a9ed1a578fee drm/xe/guc: Introduce the GuC Buffer Cache
-:51: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#51: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 286 lines checked
5b554249630a drm/xe/pf: Use GuC Buffer Cache during VFs provisioning
-:119: WARNING:LINE_SPACING: Missing a blank line after declarations
#119: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:310:
+	u32 max_cfg_dwords = xe_guc_buf_cache_dwords(&gt->uc.guc.buf);
+	CLASS(xe_guc_buf, buf)(&gt->uc.guc.buf, max_cfg_dwords);

total: 0 errors, 1 warnings, 0 checks, 130 lines checked
1ca655f706e1 drm/xe/kunit: Allow to replace xe_managed_bo_create_pin_map()
905fa2df7f4b drm/xe/kunit: Add KUnit tests for GuC Buffer Cache
-:12: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#12: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 342 lines checked


