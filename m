Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6095FCD1284
	for <intel-xe@archiver.kernel.org>; Sat,  6 Apr 2024 14:46:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0FDF10F418;
	Sat,  6 Apr 2024 14:46:30 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE0010F1BD;
 Sat,  6 Apr 2024 14:46:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe/guc=3A_Use_drm=5Fdevice-managed_version_of_mutex=5Fi?=
 =?utf-8?q?nit=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 06 Apr 2024 14:46:28 -0000
Message-ID: <171241478831.1255283.3668278872238805748@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240406143946.979-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240406143946.979-1-michal.wajdeczko@intel.com>
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

Series: series starting with [1/2] drm/xe/guc: Use drm_device-managed version of mutex_init()
URL   : https://patchwork.freedesktop.org/series/132118/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5f0187f6aabfe30610db27d371c3c6ba0d83a229
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Sat Apr 6 16:39:46 2024 +0200

    drm/xe/guc: Initialize GuC ID manager sooner
    
    The GuC submission cleanup code may depend on the GuC ID manager,
    thus we can't initialize it after registering a submission cleanup
    action, as reverse cleanup sequence will destroy GuC ID manager
    prior to a call to guc_submit_fini().
    
    Move GuC ID manager initialization up, right after managed mutex
    initialization, to have it available during guc_submit_fini().
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 1bace689230323abe9cd3dfc6dd011fa5f9e6a05 drm-intel
9689654d78df drm/xe/guc: Use drm_device-managed version of mutex_init()
5f0187f6aabf drm/xe/guc: Initialize GuC ID manager sooner


