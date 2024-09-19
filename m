Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D2ECE8D78
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 11:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60C710E2AD;
	Thu, 19 Sep 2024 11:35:08 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82B210E2AD;
 Thu, 19 Sep 2024 11:35:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Do_not_allow_sc?=
 =?utf-8?q?ratch_page_on_long_running_jobs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Sep 2024 11:35:07 -0000
Message-ID: <172674570774.1046522.251455833602483060@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240919104704.3591977-1-nirmoy.das@intel.com>
In-Reply-To: <20240919104704.3591977-1-nirmoy.das@intel.com>
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

Series: drm/xe: Do not allow scratch page on long running jobs
URL   : https://patchwork.freedesktop.org/series/138862/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 999830272dc497dfa28ff6f80797ca0cf34c7241
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Thu Sep 19 12:47:04 2024 +0200

    drm/xe: Do not allow scratch page on long running jobs
    
    This was agreed upon but not enforced, so enforce the limitation
    of not allowing scratch pages on long-running jobs unless absolutely
    required, which is currently the case for a DG2 SKU.
    
    Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Stuart Summers <stuart.summers@intel.com>
    Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
    Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 088863e9bb1feed6ad15d3c10a9f222c8564d9ac drm-intel
999830272dc4 drm/xe: Do not allow scratch page on long running jobs


