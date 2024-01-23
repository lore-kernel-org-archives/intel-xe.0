Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3613BC47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 20:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30FE10E080;
	Tue, 23 Jan 2024 20:58:17 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A4F10E080;
 Tue, 23 Jan 2024 20:58:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?3=2C1/9=5D_drm/xe=3A_Remove_double_new_lines_in_devcoredump?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Tue, 23 Jan 2024 20:58:16 -0000
Message-ID: <170604349687.684313.1637863816328240471@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240123204454.246788-1-jose.souza@intel.com>
In-Reply-To: <20240123204454.246788-1-jose.souza@intel.com>
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

Series: series starting with [v3,1/9] drm/xe: Remove double new lines in devcoredump
URL   : https://patchwork.freedesktop.org/series/129103/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
b2ca823f819193c33ab811dfac08c614138d6d46
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a7c92744c30e16b8160cf753d14ec4594099813e
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Tue Jan 23 12:44:54 2024 -0800

    drm/xe: Add batch buffer addresses to devcoredump
    
    Those addresses are necessary to Mesa tools knows where in VM are the
    batch buffers to parse and print instructions that are human readable.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Maarten Lankhorst <dev@lankhorst.se>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch fc6b7c6ee7d786e6ed48425a2ce0e674906e4e5c drm-intel
0110c2c8d drm/xe: Remove double new lines in devcoredump
39c987ed0 drm/xe: Change devcoredump functions parameters to xe_sched_job
b9983e90b drm/xe: Nuke xe from xe_devcoredump
b765fe2c6 drm/xe: Stash GMD_ID value in xe_gt
41b52a12b drm/xe: Print more device information in devcoredump
e5f6a0466 drm/xe: Print registers spread in 2 u32 as u64
0a89650ca drm/xe: Remove additional spaces in devcoredump HW Engines section
036809519 drm/xe: Add functions to convert regular address to canonical address and back
a7c92744c drm/xe: Add batch buffer addresses to devcoredump


