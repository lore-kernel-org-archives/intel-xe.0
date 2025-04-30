Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9FBC3ABA9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 15:21:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF1210E0FD;
	Wed, 30 Apr 2025 15:21:35 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45B610E2ED;
 Wed, 30 Apr 2025 15:21:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_helper_func?=
 =?utf-8?q?tion_to_inject_fault_into_ct=5Fdead=5Fcapture=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Apr 2025 15:21:33 -0000
Message-ID: <174602649374.30924.17723141405186348016@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250430131710.20532-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250430131710.20532-1-satyanarayana.k.v.p@intel.com>
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

Series: drm/xe: Add helper function to inject fault into ct_dead_capture() (rev2)
URL   : https://patchwork.freedesktop.org/series/148415/
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
commit f887c33b75982e110527412331a16a450fc361c9
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Wed Apr 30 18:47:10 2025 +0530

    drm/xe: Add helper function to inject fault into ct_dead_capture()
    
    When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv()
    functions, the CI test systems are going out of space and crashing. To
    avoid this issue, a new helper function is created and when fault is
    injected into this xe_should_fail_ct_dead_capture() helper function,
    ct dead capture is avoided which suppresses ct dumps in the log.
    
    Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Suggested-by: John Harrison <John.C.Harrison@Intel.com>
    Tested-by: Aditya Chauhan <aditya.chauhan@intel.com>
+ /mt/dim checkpatch 1351e9f42d757ef4ce7d2cf2401aa2b5fe36df6d drm-intel
f887c33b7598 drm/xe: Add helper function to inject fault into ct_dead_capture()


