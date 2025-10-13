Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AE9CCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 17:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 714A710E496;
	Mon, 13 Oct 2025 17:20:12 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439C610E13C;
 Mon, 13 Oct 2025 17:20:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/kunit=3A_Fix_kerne?=
 =?utf-8?q?ldoc_for_parameterized_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 Oct 2025 17:20:11 -0000
Message-ID: <176037601127.7102.11284382592162911840@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251013153014.2362879-2-matthew.d.roper@intel.com>
In-Reply-To: <20251013153014.2362879-2-matthew.d.roper@intel.com>
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

Series: drm/xe/kunit: Fix kerneldoc for parameterized tests
URL   : https://patchwork.freedesktop.org/series/155840/
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
commit bf5c631db601050f98b114b3d930aa547ac9ac03
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Mon Oct 13 08:30:15 2025 -0700

    drm/xe/kunit: Fix kerneldoc for parameterized tests
    
    Kunit's generate_params() was recently updated to take an additional
    test context parameter.  Xe's IP and platform parameter generators were
    updated accordingly at the same time, but the new parameter was not
    added to the functions' kerneldoc, resulting in the following warnings:
    
       Warning: drivers/gpu/drm/xe/tests/xe_pci.c:78 function parameter 'test' not described in 'xe_pci_fake_data_gen_params'
       Warning: drivers/gpu/drm/xe/tests/xe_pci.c:254 function parameter 'test' not described in 'xe_pci_graphics_ip_gen_param'
       Warning: drivers/gpu/drm/xe/tests/xe_pci.c:278 function parameter 'test' not described in 'xe_pci_media_ip_gen_param'
       Warning: drivers/gpu/drm/xe/tests/xe_pci.c:302 function parameter 'test' not described in 'xe_pci_id_gen_param'
       Warning: drivers/gpu/drm/xe/tests/xe_pci.c:390 function parameter 'test' not described in 'xe_pci_live_device_gen_param'
       5 warnings as errors
    
    Document the new parameter to eliminate the warnings and make CI happy.
    
    Fixes: b9a214b5f6aa ("kunit: Pass parameterized test context to generate_params()")
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch 61b16793c3bbb8e740cf9afb36258dee61346626 drm-intel
bf5c631db601 drm/xe/kunit: Fix kerneldoc for parameterized tests
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
   Warning: drivers/gpu/drm/xe/tests/xe_pci.c:78 function parameter 'test' not described in 'xe_pci_fake_data_gen_params'

total: 0 errors, 1 warnings, 0 checks, 35 lines checked


