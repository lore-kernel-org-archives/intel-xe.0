Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6EAC43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 23:50:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D5410E36F;
	Mon, 13 Jul 2026 23:50:34 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BE510E03B;
 Mon, 13 Jul 2026 23:50:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_v7_drm=3A_writeback=3A_cl?=
 =?utf-8?q?ean_up_writeback_connector_initialization?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "John Harrison" <john.harrison@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 Jul 2026 23:50:32 -0000
Message-ID: <178398663287.185790.6252605334469477624@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260713230726.3738290-1-John.Harrison@Igalia.com>
In-Reply-To: <20260713230726.3738290-1-John.Harrison@Igalia.com>
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

Series: v7 drm: writeback: clean up writeback connector initialization
URL   : https://patchwork.freedesktop.org/series/170356/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e3fc483b06795c61ad1166d49006827057338d93
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date:   Mon Jul 13 16:07:25 2026 -0700

    drm: writeback: rename drm_writeback_connector_init_with_encoder()
    
    Rename drm_writeback_connector_init_with_encoder() to
    drm_writeback_connector_init() and adapt its interface to follow
    drmm_writeback_connector_init().
    
    v2: Correct kernel doc param order (complained by Sashiko).
    
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
    Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
    Signed-off-by: John Harrison <John.Harrison@Igalia.com>
+ /mt/dim checkpatch 4df02bb6acd1307de4de001699112cbdaf5afdfc drm-intel
2e353dff8c9c drm/managed: implement managed versions of kzalloc_obj/objs()
-:39: CHECK:SPACING: No space is necessary after a cast
#39: FILE: include/drm/drm_managed.h:118:
+	((typeof(P) *) drmm_kcalloc(dev, count, sizeof(typeof(P)), GFP_KERNEL))

total: 0 errors, 0 warnings, 1 checks, 29 lines checked
7cb2f1c080f6 drm/amd/display: use drmm allocation for writeback connector
-:13: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#13: 
Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Suggested-by: Alex Hung <alex.hung@amd.com>

-:35: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#35: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:2601:
+			struct amdgpu_dm_wb_connector *wbcon = drmm_kzalloc_obj(adev_to_drm(adev), *wbcon);

total: 0 errors, 2 warnings, 0 checks, 23 lines checked
5f6df4d1ae5f drm/amd/display: use drmm_writeback_connector_init()
9c6ebb3d1a37 drm/komeda: use drmm_writeback_connector_init()
4c3d5157a5f2 drm/mali: use drmm_writeback_connector_init()
1cdbfc2acf9b drm: renesas: rcar-du: use drmm_writeback_connector_init()
28b69c95ff9d drm/vc4: use drmm_writeback_connector_init()
efc0fd271e96 drm: writeback: drop excess connector initialization functions
e3fc483b0679 drm: writeback: rename drm_writeback_connector_init_with_encoder()


