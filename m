Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2159C531F9
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 10:27:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F1D10E86F;
	Tue, 28 Jul 2026 10:27:51 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3872110E86F;
 Tue, 28 Jul 2026 10:27:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_KUnit_test_for_VF_provisi?=
 =?utf-8?q?oning_error_handling_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Jul 2026 10:27:50 -0000
Message-ID: <178523447022.230500.4111110326796948360@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260728095026.2197333-6-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260728095026.2197333-6-satyanarayana.k.v.p@intel.com>
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

Series: KUnit test for VF provisioning error handling (rev4)
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
commit 5c9b423af2412f2d0bf822f2be13ab4da1ca6dc8
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Tue Jul 28 09:50:30 2026 +0000

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
+ /mt/dim checkpatch 28e3f47d47a61b5e28e7566944479e9c9715d41d drm-intel
5eca0a2afd35 drm/xe/guc: Add KUNIT stub for xe_guc_mmio_send_recv()
512f97f4a0f4 drm/xe/vf: Split submission config query helpers
74a25b246f6f drm/xe/vf: Add bounds checking for queried context and doorbell counts
5c9b423af241 drm/xe/tests: Add KUnit tests for VF provisioning error handling
-:20: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#20: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 219 lines checked


