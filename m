Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4AAC46CD2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 21:40:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FB510EFF7;
	Mon, 22 Jan 2024 21:40:56 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145FA10F008;
 Mon, 22 Jan 2024 21:40:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/9=5D_drm/xe=3A_Remove_double_new_lines_in_devcoredump?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Mon, 22 Jan 2024 21:40:55 -0000
Message-ID: <170595965508.665193.4084453407678596459@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240122211709.224419-1-jose.souza@intel.com>
In-Reply-To: <20240122211709.224419-1-jose.souza@intel.com>
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

Series: series starting with [v2,1/9] drm/xe: Remove double new lines in devcoredump
URL   : https://patchwork.freedesktop.org/series/129051/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 79f4b458c03b670be32dae994475f9c76d732af3
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Mon Jan 22 13:17:09 2024 -0800

    drm/xe: Remove additional spaces in devcoredump HW Engines section
    
    I guess the indention was to keep it visually aligned but that
    would require a lot of spaces and was not followed by other registers
    so lets just drop it.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Maarten Lankhorst <dev@lankhorst.se>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch 7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c drm-intel
96461c76e drm/xe: Remove double new lines in devcoredump
a80ddd49e drm/xe: Change devcoredump functions parameters to xe_sched_job
75b18ee02 drm/xe: Add functions to convert regular address to canonical address and back
4c1ff0d5c drm/xe: Add batch buffer addresses to devcoredump
d0f9421dc drm/xe: Nuke xe from xe_devcoredump
23ac954d7 drm/xe: Stash GMD_ID value in xe_gt
0b2d4b979 drm/xe: Print more device information in devcoredump
143e48af9 drm/xe: Print registers spread in 2 u32 as u64
79f4b458c drm/xe: Remove additional spaces in devcoredump HW Engines section


