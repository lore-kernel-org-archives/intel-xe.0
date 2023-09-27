Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888CFE82CB1
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 16:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C7E10E574;
	Wed, 27 Sep 2023 16:52:21 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id DE64110E574;
 Wed, 27 Sep 2023 16:52:19 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DEC8BAADD5;
 Wed, 27 Sep 2023 16:52:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommithi Sakeena" <bommithi.sakeena@intel.com>
Date: Wed, 27 Sep 2023 16:52:19 -0000
Message-ID: <169583353990.20756.8225775131274329550@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230927165012.9048-1-bommithi.sakeena@intel.com>
In-Reply-To: <20230927165012.9048-1-bommithi.sakeena@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/2=5D_drm/xe=3A_Ensure_mutex_are_destroy?=
 =?utf-8?q?ed?=
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

Series: series starting with [1/2] drm/xe: Ensure mutex are destroyed
URL   : https://patchwork.freedesktop.org/series/124348/
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
commit bc2cd57fe744a63b4f1d9115e96ddcf64613aad7
Author: Bommithi Sakeena <bommithi.sakeena@intel.com>
Date:   Wed Sep 27 16:50:12 2023 +0000

    drm/xe: Add a missing mutex_destroy to xe_ttm_vram_mgr
    
    Ensure that the mutex is destroyed at fini function.
    
    Fixes: e777edb47dc2 ("drm/xe: Implement stolen memory.")
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Signed-off-by: Bommithi Sakeena <bommithi.sakeena@intel.com>
+ /mt/dim checkpatch bce60b0ff2937cb2ea51841a479bc1a2da65052b drm-intel
880efef8a drm/xe: Ensure mutex are destroyed
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'c639b8b60dfe', maybe rebased or not pulled?
#9: 
Fixes: c639b8b60dfe ("drm/xe: Introduce a new DRM driver for Intel GPUs")

total: 0 errors, 1 warnings, 0 checks, 38 lines checked
bc2cd57fe drm/xe: Add a missing mutex_destroy to xe_ttm_vram_mgr
-:8: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'e777edb47dc2', maybe rebased or not pulled?
#8: 
Fixes: e777edb47dc2 ("drm/xe: Implement stolen memory.")

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


