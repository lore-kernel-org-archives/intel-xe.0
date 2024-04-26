Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A41C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 09:06:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB9610EDB2;
	Fri, 26 Apr 2024 09:06:49 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010CA10EDB2;
 Fri, 26 Apr 2024 09:06:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Refactor_default_device_a?=
 =?utf-8?q?tomic_settings_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Apr 2024 09:06:48 -0000
Message-ID: <171412240800.1668691.10976339505046998854@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240425222346.13026-1-nirmoy.das@intel.com>
In-Reply-To: <20240425222346.13026-1-nirmoy.das@intel.com>
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

Series: Refactor default device atomic settings (rev2)
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
commit 89344489230b501e7ebb879046fabaadc8168771
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Fri Apr 26 00:23:46 2024 +0200

    drm/xe: Refactor default device atomic settings
    
    The default behavior of device atomics depends on the
    VM type and buffer allocation types. Device atomics are
    expected to function with all types of allocations for
    traditional applications/APIs. Additionally, in compute/SVM
    API scenarios with fault mode or LR mode VMs, device atomics
    must work with single-region allocations. In all other cases
    device atomics should be disabled by default.
    
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch f39ba481e5873b7617afc2e8cf618ac9dc85123f drm-intel
e46dfd66b31b drm/xe: Introduce has_atomic_enable_pte_bit device info
092280e4534a drm/xe: Move vm bind bo validation to a helper function
1abedaad272b drm/xe: Introduce has_device_atomics_on_smem device info
1c922b5b1884 drm/xe: Add function to check if BO has single placement
89344489230b drm/xe: Refactor default device atomic settings


