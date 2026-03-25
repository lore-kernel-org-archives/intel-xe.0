Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175E2103A9A7
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 11:19:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8E810E7D1;
	Wed, 25 Mar 2026 11:19:14 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BB310E7D1;
 Wed, 25 Mar 2026 11:19:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_Pipe_writeback_=28?=
 =?utf-8?q?rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Mar 2026 11:19:13 -0000
Message-ID: <177443755391.396080.1970602293084764832@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260325110744.1096786-1-suraj.kandpal@intel.com>
In-Reply-To: <20260325110744.1096786-1-suraj.kandpal@intel.com>
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

Series: Enable Pipe writeback (rev3)
URL   : https://patchwork.freedesktop.org/series/152105/
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
commit 6f8db1a5c2a4ea267f57092339e5a629541b3b83
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Wed Mar 25 16:37:44 2026 +0530

    drm/i915/writeback: Modify state verify function
    
    Modify the state verify functions to take into account the fact
    that writeback does not need all the timings for it to be set.
    Moreover there is no need for dpll state nor do we need to set
    any sort of flags for it.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 41579e12882a0a3b881bfade003fcb1fd39c347c drm-intel
1fff9a5173ba drm: writeback: rename drm_writeback_connector_init_with_encoder()
e8616b662e6c drm: writeback: Refactor drm_writeback_connector structure
-:95: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#95: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c:84:
+static int amdgpu_dm_wb_prepare_job(struct drm_connector *connector,
 			       struct drm_writeback_job *job)

-:526: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#526: FILE: drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c:91:
+static int dpu_wb_conn_prepare_job(struct drm_connector *connector,
 		struct drm_writeback_job *job)

-:538: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#538: FILE: drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c:104:
+static void dpu_wb_conn_cleanup_job(struct drm_connector *connector,
 		struct drm_writeback_job *job)

total: 0 errors, 0 warnings, 3 checks, 797 lines checked
da13b7f38316 drm/i915/writeback: Add writeback registers
-:12: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#12: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 136 lines checked
6432e367776a drm/i915/writeback: Add some preliminary writeback definitions
69530d328f61 drm/i915/writeback: Init writeback connector
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

-:74: WARNING:ALLOC_WITH_SIZEOF: Prefer kzalloc_obj over kzalloc with sizeof
#74: FILE: drivers/gpu/drm/i915/display/intel_writeback.c:41:
+	conn_state = kzalloc(sizeof(*conn_state), GFP_KERNEL);

-:114: WARNING:ALLOC_WITH_SIZEOF: Prefer kzalloc_obj over kzalloc with sizeof
#114: FILE: drivers/gpu/drm/i915/display/intel_writeback.c:81:
+	writeback_conn = kzalloc(sizeof(*writeback_conn), GFP_KERNEL);

total: 0 errors, 3 warnings, 0 checks, 150 lines checked
8f9f2cc3dfeb drm/i915/writeback: Add function to get modes
cbc9b9896fb6 drm/i915/writeback: Add hook to check modes
781165efa00b drm/i915/writeback: Define encoder->get_hw_state
148a1426ca8b drm/i915/writeback: Fill encoder->get_config
7d635e8df130 drm/i915/writeback: Add private structure for writeback job
aadac84702b2 drm/i915/writeback: Define function for prepare and cleanup hooks
-:63: WARNING:ALLOC_WITH_SIZEOF: Prefer kzalloc_obj over kzalloc with sizeof
#63: FILE: drivers/gpu/drm/i915/display/intel_writeback.c:116:
+	wb_job = kzalloc(sizeof(*wb_job), GFP_KERNEL);

total: 0 errors, 1 warnings, 0 checks, 95 lines checked
aec3aa586753 drm/i915/writeback: Define compute_config for writeback
fb4ccf52d3c7 drm/i915/writeback: Define function for connector function detect
5667f1e2ce67 drm/i915/writeback: Define function to destroy writeback connector
0bfb32c81a1b drm/i915/writeback: Add connector atomic check
411f5decd3cc drm/i915/writeback: Add writeback to xe Makefile
b5f382a43721 drm/i915/writeback: Add the enable sequence from writeback
3c60f898a126 drm/i915/writeback: Define writeback frame capture function
8956b20db7f5 drm/{i915/xe}/writeback: Add a writeback helper to get ggtt address
-:48: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#48: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 63 lines checked
b62351cf3d37 drm/i915/writeback: Configure WD_STRIDE reg
f23c7074beca drm/i915/writeback: Configure WD_SURF register
029a7a549a62 drm/i915/writeback: Enable writeback interrupts
09575ced281c drm/i915/writeback: Initialize writeback encoder.
c2a1b282b075 drm/i915/writeback: Define the disable sequence for writeback
d0b6ab4e361e drm/i915/writeback: Make exception for writeback connector
6f8db1a5c2a4 drm/i915/writeback: Modify state verify function


