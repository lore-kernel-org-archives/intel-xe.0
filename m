Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BA7C3ABDD
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 15:09:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A59D10E5A5;
	Tue, 20 May 2025 15:09:15 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A3110E5A5;
 Tue, 20 May 2025 15:09:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/mocs=3A_Initialize?=
 =?utf-8?q?_MOCS_index_early?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 May 2025 15:09:14 -0000
Message-ID: <174775375423.5472.9908496127559996391@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250520142445.2792824-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20250520142445.2792824-1-balasubramani.vivekanandan@intel.com>
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

Series: drm/xe/mocs: Initialize MOCS index early
URL   : https://patchwork.freedesktop.org/series/149256/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3c236085d5a9ef98cba686b9be15b3a73c92f9f4
Author: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Date:   Tue May 20 19:54:45 2025 +0530

    drm/xe/mocs: Initialize MOCS index early
    
    MOCS uc_index is used even before it is initialized in the following
    callstack
        guc_prepare_xfer()
        __xe_guc_upload()
        xe_guc_min_load_for_hwconfig()
        xe_uc_init_hwconfig()
        xe_gt_init_hwconfig()
    
    Do MOCS index initialization earlier in the device probe.
    
    Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
+ /mt/dim checkpatch 45c2c8c74ab88c8fb741ea8349b051f5aec87320 drm-intel
3c236085d5a9 drm/xe/mocs: Initialize MOCS index early


