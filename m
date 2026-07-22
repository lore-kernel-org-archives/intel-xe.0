Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDB4C44539
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 12:38:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3DF10E437;
	Wed, 22 Jul 2026 12:38:47 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F34610E437;
 Wed, 22 Jul 2026 12:38:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_KUnit_test_for_VF_provisi?=
 =?utf-8?q?oning_error_handling_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Jul 2026 12:38:46 -0000
Message-ID: <178472392625.216113.14028869529769572383@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260722123342.339623-5-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260722123342.339623-5-satyanarayana.k.v.p@intel.com>
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

Series: KUnit test for VF provisioning error handling (rev2)
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
commit 87c7bfdaa7f12af2a0575d895aca35cd9cb18762
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Wed Jul 22 12:33:44 2026 +0000

    drm/xe/tests: Add KUnit tests for VF provisioning error handling
    
    VF relies on the PF to provide a valid hardware configuration via GuC
    KLV responses. In unlikely event of PF malfunction or misconfiguration,
    a VF may receive incomplete, zero, or out-of-range values for its
    submission contexts, doorbells, LMEM, or GGTT assignment.
    
    Add KUnit test cases that use the guc_action_query_single_klv() static
    stub to inject bad KLV responses and verify that VF can return a negative
    error code rather than silently accepting the invalid configuration.
    
    The following error scenarios are covered per resource:
    
      Contexts : zero, less-by-4K, invalid , one, more-by-4K
      Doorbells: zero, less-by-32, invalid , one, more-by-32
      LMEM     : zero, less-by-32M, invalid , one-GB, more-by-1G
      GGTT     : zero size, size-less-by-4K, size-invalid
    
    Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch cfee1b098ebceda0381298e945031733a5aec8dd drm-intel
72ea4dab5e9d drm/xe/vf: Add KUNIT stub for guc_action_query_single_klv()
8373778f0a40 drm/xe/vf: split submission config query helpers
87c7bfdaa7f1 drm/xe/tests: Add KUnit tests for VF provisioning error handling
-:27: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#27: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 275 lines checked


