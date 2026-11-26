Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78403606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 04:36:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271F010F361;
	Thu, 26 Nov 2026 04:36:35 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEF510ED55;
 Thu, 26 Nov 2026 04:36:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Refactor_drm=5Fwriteback?=
 =?utf-8?q?=5Fconnector_structure_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Nov 2026 04:36:34 -0000
Message-ID: <179566779410.88680.6100886169557758047@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261126042835.436307-1-suraj.kandpal@intel.com>
In-Reply-To: <20261126042835.436307-1-suraj.kandpal@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: Refactor drm_writeback_connector structure (rev9)
URL   : https://patchwork.freedesktop.org/series/152758/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d9d9eda37fa022a4a6c07afcf9feced5d71c7cce
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Thu Nov 26 09:58:35 2026 +0530

    drm: writeback: Modify cleanup_writeback_job helper
    
    The cleanup_writeback_job() connector helper hook needs access to
    the parent drm_connector object as well as the drm_writeback_connector
    object itself. So, pass in the top level drm_connector and traverse
    down to drm_writeback_connector rather than passing in the lower
    level object and traversing back up. This also makes it uniform
    with the params passed to other drm_connector_helper_funcs hooks.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
    Reviewed-by: John Harrison <John.Harrison@Igalia.com>
    Reviewed-by: Alex Hung <alex.hung@amd.com>
+ /mt/dim checkpatch 7936dff5abd09d0769344053d284fcf095ec5ec4 drm-intel
77d1486d81d6 drm: writeback: Refactor drm_writeback_connector structure
-:117: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#117: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.c:7196:
+			drmm_connector_init(drm, &wbcon->base,
 			&dm_test_connector_funcs,

-:162: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "wbcon->base.funcs"
#162: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_wb_test.c:511:
+	KUNIT_EXPECT_TRUE(test, wbcon->base.funcs != NULL);

-:163: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "wbcon->base.helper_private"
#163: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_wb_test.c:512:
+	KUNIT_EXPECT_TRUE(test, wbcon->base.helper_private != NULL);

-:164: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "wbcon->base.state"
#164: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_wb_test.c:513:
+	KUNIT_EXPECT_TRUE(test, wbcon->base.state != NULL);

-:495: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#495: FILE: drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c:91:
+static int dpu_wb_conn_prepare_job(struct drm_writeback_connector *wb_conn,
 		struct drm_writeback_job *job)

-:508: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#508: FILE: drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c:105:
+static void dpu_wb_conn_cleanup_job(struct drm_writeback_connector *wb_connector,
 		struct drm_writeback_job *job)

total: 0 errors, 0 warnings, 6 checks, 752 lines checked
8ba9222793ab drm: writeback: Modify writeback init helpers
a01e775e8b42 drm: writeback: Modify drm_writeback_queue_job helper
6442c3038f30 drm: writeback: Modify drm_writeback_signal_completion helper
05cb289ce4ca drm: writeback: Modify drm_writeback_get_out_fence helper
caed5613687a drm: writeback: Modify prepare_writeback_job helper
-:69: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#69: FILE: drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c:91:
+static int dpu_wb_conn_prepare_job(struct drm_connector *connector,
 		struct drm_writeback_job *job)

total: 0 errors, 0 warnings, 1 checks, 66 lines checked
d9d9eda37fa0 drm: writeback: Modify cleanup_writeback_job helper
-:28: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#28: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c:200:
+STATIC_IFN_KUNIT void amdgpu_dm_wb_cleanup_job(struct drm_connector *connector,
 				struct drm_writeback_job *job)

-:67: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#67: FILE: drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c:104:
+static void dpu_wb_conn_cleanup_job(struct drm_connector *connector,
 		struct drm_writeback_job *job)

total: 0 errors, 0 warnings, 2 checks, 70 lines checked


