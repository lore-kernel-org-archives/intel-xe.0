Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDF5C3600B
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 19:01:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000A610E93E;
	Thu, 27 Mar 2025 19:01:47 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5472710E93E;
 Thu, 27 Mar 2025 19:01:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Ensure_fixed=5F?=
 =?utf-8?q?slice=5Fmode_gets_set_after_ccs=5Fmode_change_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Mar 2025 19:01:47 -0000
Message-ID: <174310210734.12748.8491819344276574579@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250327185604.18230-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20250327185604.18230-1-niranjana.vishwanathapura@intel.com>
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

Series: drm/xe: Ensure fixed_slice_mode gets set after ccs_mode change (rev2)
URL   : https://patchwork.freedesktop.org/series/146830/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 28b215df065e69776f8109ff7e1f1b349e254df6
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Thu Mar 27 11:56:04 2025 -0700

    drm/xe: Ensure fixed_slice_mode gets set after ccs_mode change
    
    The RCU_MODE_FIXED_SLICE_CCS_MODE setting is not getting invoked
    in the gt reset path after the ccs_mode setting by the user.
    Add it to engine register update list (in hw_engine_setup_default_state())
    which ensures it gets set in the gt reset and engine reset paths.
    
    v2: Add register update to engine list to ensure it gets updated
    after engine reset also.
    
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
+ /mt/dim checkpatch 4911aeaaf32d8b81a25969ca7f4eef3904e7a75d drm-intel
28b215df065e drm/xe: Ensure fixed_slice_mode gets set after ccs_mode change


