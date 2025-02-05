Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD43BC02194
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 13:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AB710E1EA;
	Wed,  5 Feb 2025 13:35:41 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C8510E1EA;
 Wed,  5 Feb 2025 13:34:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Don=27t_treat_S?=
 =?utf-8?q?R-IOV_platforms_as_reclaim_unsafe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Feb 2025 13:34:01 -0000
Message-ID: <173876244171.1442162.4975277074513613654@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250205120150.896-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250205120150.896-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Don't treat SR-IOV platforms as reclaim unsafe
URL   : https://patchwork.freedesktop.org/series/144369/
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
commit 8489dcfc26d32171c14b47d7c3ccb11225c1bae1
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Feb 5 13:01:50 2025 +0100

    drm/xe: Don't treat SR-IOV platforms as reclaim unsafe
    
    Since commit a4d1c5d0b99b ("drm/xe/pf: Move VFs reprovisioning
    to worker") and commit 78d5d1e20d1d ("drm/xe/relay: Don't use
    GFP_KERNEL for new transactions") we should have no more lockdep
    dependencies on the reclaim path when running in the SRIOV mode
    so we believe that we can now mark SRIOV driver as reclaim safe.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch a7df3eccb725a8d72f8f3ed87ee7ad9419b17380 drm-intel
8489dcfc26d3 drm/xe: Don't treat SR-IOV platforms as reclaim unsafe


