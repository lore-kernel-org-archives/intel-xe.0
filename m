Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4C3C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 18:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE14112E4E;
	Tue, 30 Apr 2024 18:48:10 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F385112E4E;
 Tue, 30 Apr 2024 18:48:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Refactor_default_device_a?=
 =?utf-8?q?tomic_settings_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 30 Apr 2024 18:48:09 -0000
Message-ID: <171450288939.1793171.5368623427561559853@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240430162529.21588-1-nirmoy.das@intel.com>
In-Reply-To: <20240430162529.21588-1-nirmoy.das@intel.com>
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

Series: Refactor default device atomic settings (rev6)
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
commit d39c52d58eea1eb044485c8ccae29d8b34104b3a
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Tue Apr 30 18:25:29 2024 +0200

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
    
    v3: fault mode requires LR mode so only check for LR mode
        to determine compute API(Jose).
        Handle SMEM+LMEM BO's migration to LMEM where device
        atomics is expected to work. (Brian).
    v2: Fix platform checks to correct atomics behaviour on PVC.
    
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
    Acked-by: Michal Mrozek <michal.mrozek@intel.com>
+ /mt/dim checkpatch 3ac3efef3a1fc9d494b0a63c78bd0039a0b3d009 drm-intel
138363832ca3 drm/xe: Introduce has_atomic_enable_pte_bit device info
cab26f6c0231 drm/xe: Move vm bind bo validation to a helper function
a019672d3ada drm/xe: Introduce has_device_atomics_on_smem device info
e8edb5e3e432 drm/xe: Add function to check if BO has single placement
d39c52d58eea drm/xe: Refactor default device atomic settings


