Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D0CC5AC82
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 10:18:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D4810E1D2;
	Mon, 10 Aug 2026 10:18:12 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72DD10E1D2;
 Mon, 10 Aug 2026 10:18:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_KUnit_test_for_VF_provisi?=
 =?utf-8?q?oning_error_handling_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Aug 2026 10:18:10 -0000
Message-ID: <178635709094.34065.13200222281003757814@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260810101428.1009573-8-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260810101428.1009573-8-satyanarayana.k.v.p@intel.com>
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

Series: KUnit test for VF provisioning error handling (rev5)
URL   : https://patchwork.freedesktop.org/series/170198/
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
commit e6c6eef21bccb4a08d8bd5fad6031d0f5f20d582
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Mon Aug 10 15:44:33 2026 +0530

    drm/xe/tests: Add KUnit tests for VF provisioning error handling
    
    VF relies on the PF to provide a valid hardware configuration via GuC
    KLV responses. In unlikely event of PF malfunction or misconfiguration,
    a VF may receive incomplete, zero, or out-of-range values for its
    submission contexts, doorbells, VRAM or GGTT assignment.
    
    Add KUnit test cases that use the xe_guc_mmio_send_recv() stub to inject
    bad KLV responses and verify that VF can survive without crashing for
    the invalid configuration data received.
    
    Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 64945e34f2f3505d1def53d6752c04ddca144a92 drm-intel
7d1b8a0c0d49 drm/xe/guc: Allow to replace xe_guc_mmio_send_recv() with KUNIT stub
c6b2c78f6d20 drm/xe/vf: Split submission config query helpers
d38ef68aec0a drm/xe/vf: Add bounds checking for queried context and doorbell counts
a33c6b92f9fe drm/xe/vf: Add bounds checking for queried GGTT base and size
46f075666e5c drm/xe/vf: Add bounds checking for queried VRAM size
e6c6eef21bcc drm/xe/tests: Add KUnit tests for VF provisioning error handling
-:20: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#20: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 329 lines checked


