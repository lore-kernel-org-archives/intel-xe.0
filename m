Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5EBC27C50
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 14:46:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D4C10E49A;
	Tue,  4 Jun 2024 14:46:03 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D00D10E4BB;
 Tue,  4 Jun 2024 14:46:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/3=5D_drm/xe=3A_Cleanup_force_wake_registers_bit_definitions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Jun 2024 14:46:01 -0000
Message-ID: <171751236105.2264328.2141099030156976935@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240603090147.1098639-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240603090147.1098639-1-himal.prasad.ghimiray@intel.com>
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

Series: series starting with [v2,1/3] drm/xe: Cleanup force wake registers bit definitions
URL   : https://patchwork.freedesktop.org/series/134357/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0fffd454ad8d32b501fc1394675971ad80bff0ef
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Mon Jun 3 14:31:47 2024 +0530

    drm/xe: Fix xe_force_wake_assert_held for enum XE_FORCEWAKE_ALL
    
    xe_force_wake_assert_held is designed to trigger an assertion if the
    provided domain is not awake, which works correctly for individual
    domains. However, the assertion condition becomes incorrect for
    XE_FORCEWAKE_ALL.
    
    For instance, if we assume all domains are in sleep mode, invoking
    xe_force_wake_get(fw, XE_FORCEWAKE_GT) will only awaken the "gt" domain.
    Subsequently, another function needs that all domains are awake and
    utilizes xe_force_wake_assert_held(fw, XE_FORCEWAKE_ALL).
    In this scenario, the condition will inaccurately return success because
    fw->awake_domains (0x1) & XE_FORCEWAKE_ALL (0xFF) will still be 0x1 and
    Ideally it should have asserted.
    
    Make sure that the assertion condition covers the wakefulness of all
    initialized domains for XE_FORCEWAKE_ALL.
    
    v2:
    - %s/supported/initialized/
    - update commit message (Rodrigo)
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 35fd8da4aabacfb22e4d62be372aa7f2db72e426 drm-intel
83cf5b23be03 drm/xe: Cleanup force wake registers bit definitions
b1faf24d5630 drm/xe: Add member initialized_domains to xe_force_wake
0fffd454ad8d drm/xe: Fix xe_force_wake_assert_held for enum XE_FORCEWAKE_ALL


