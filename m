Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E6FC0218D
	for <intel-xe@archiver.kernel.org>; Sat, 25 Jan 2025 22:45:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A37110E0FB;
	Sat, 25 Jan 2025 22:45:21 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F18A10E371;
 Sat, 25 Jan 2025 22:45:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/pf=3A_Move_VFs_rep?=
 =?utf-8?q?rovisioning_to_worker?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 25 Jan 2025 22:45:20 -0000
Message-ID: <173784512031.531267.13610783432572539028@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250125215505.720-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250125215505.720-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/pf: Move VFs reprovisioning to worker
URL   : https://patchwork.freedesktop.org/series/143963/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a1d4631f3c13a8e1de8f2fef45e32ce63bdd7dee
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Sat Jan 25 22:55:05 2025 +0100

    drm/xe/pf: Move VFs reprovisioning to worker
    
    Since the GuC is reset during GT reset, we need to re-send the
    entire SR-IOV provisioning configuration to the GuC. But since
    this whole configuration is protected by the PF master mutex and
    we can't avoid making allocations under this mutex (like during
    LMEM provisioning), we can't do this reprovisioning from gt-reset
    path if we want to be reclaim-safe. Move VFs reprovisioning to a
    async worker that we will start from the gt-reset path.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch b21557cf9ac310ed4c206f6661ac57fa090c42b2 drm-intel
a1d4631f3c13 drm/xe/pf: Move VFs reprovisioning to worker


