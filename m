Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE5DEEAA47
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 14:32:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E52110E572;
	Thu, 14 Sep 2023 14:32:43 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9692210E57F;
 Thu, 14 Sep 2023 14:32:41 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9368AAADEB;
 Thu, 14 Sep 2023 14:32:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Date: Thu, 14 Sep 2023 14:32:41 -0000
Message-ID: <169470196160.29166.15003871364829990561@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230914141856.5647-1-dev@lankhorst.se>
In-Reply-To: <20230914141856.5647-1-dev@lankhorst.se>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Cu?=
 =?utf-8?q?rsor_tests_for_CI?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Cursor tests for CI
URL   : https://patchwork.freedesktop.org/series/123699/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f839096da119ee453cf00bbb4d5f456cdfcebd8f
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Thu Sep 14 16:18:56 2023 +0200

    drm/i915: Handle legacy cursor update as normal update
    
    Abuse the vblank worker to make the changes as small as possible. We
    need a way to sync flip_done, but if we wait on flip_done, all async
    tests start failing.
    
    Changes since v1:
    - Prevent null deref when crtc is inactive.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch aeac46cfaebff413254ac07837b97370c7ed3957 drm-intel
7f7961e03 fixup! drm/xe/display: Implement display support
aa9eb5202 drm/i915: Swap ggtt_vma during legacy cursor update
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 11 lines checked
72d4c1465 SorryNotSorryCancelling
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
f839096da drm/i915: Handle legacy cursor update as normal update


