Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55338C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 20:42:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AF211AAAD;
	Fri, 26 Apr 2024 20:42:05 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00C911AAC6;
 Fri, 26 Apr 2024 20:42:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Refactor_default_device_a?=
 =?utf-8?q?tomic_settings_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Apr 2024 20:42:03 -0000
Message-ID: <171416412369.1685485.11341957747064433589@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240426105655.23738-1-nirmoy.das@intel.com>
In-Reply-To: <20240426105655.23738-1-nirmoy.das@intel.com>
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

Series: Refactor default device atomic settings (rev4)
URL   : https://patchwork.freedesktop.org/series/132930/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit beac6e1551b920817abe4ce43c4f28c515467567
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Fri Apr 26 12:56:55 2024 +0200

    drm/xe: Refactor default device atomic settings
    
    The default behavior of device atomics depends on the
    VM type and buffer allocation types. Device atomics are
    expected to function with all types of allocations for
    traditional applications/APIs. Additionally, in compute/SVM
    API scenarios with fault mode or LR mode VMs, device atomics
    must work with single-region allocations. In all other cases
    device atomics should be disabled by default also on platforms
    where we know device atomics doesn't on work on particular
    allocations types.
    
    v2: Fix platform checks to correct atomics behaviour on PVC.
    
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch cd4e45440e6710d7a1d097cd2fbac455bdecb68a drm-intel
48095b8d863e drm/xe: Introduce has_atomic_enable_pte_bit device info
6475dfe935d9 drm/xe: Move vm bind bo validation to a helper function
ed97938df90e drm/xe: Introduce has_device_atomics_on_smem device info
f282bb677188 drm/xe: Add function to check if BO has single placement
beac6e1551b9 drm/xe: Refactor default device atomic settings


