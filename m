Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 915F0C10F16
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 14:11:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6282810E513;
	Mon,  6 May 2024 14:11:36 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E37B10E513;
 Mon,  6 May 2024 14:11:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Modify_minimum_?=
 =?utf-8?q?of_various_scheduler_timeout_to_0?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 May 2024 14:11:35 -0000
Message-ID: <171500469525.1939725.16172857660077222836@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240506133447.3143994-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240506133447.3143994-1-himal.prasad.ghimiray@intel.com>
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

Series: drm/xe: Modify minimum of various scheduler timeout to 0
URL   : https://patchwork.freedesktop.org/series/133233/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bce86d8fcb51779a7bb72d54ccfb9f4dd778fc01
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Mon May 6 19:04:47 2024 +0530

    drm/xe: Modify minimum of various scheduler timeout to 0
    
    Remove the min/max configs and change minimum values of preemption and
    timeslice to 0. The sysman teams must deactivate preemption and
    timeslice to assess exclusivity mode. They depend on configuring
    timeslice_duration_us and preempt_timeout_us to 0, ensuring these
    values are set at their minimum.
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch a2e658aa302af6359a47b5758bce1c9018a068df drm-intel
bce86d8fcb51 drm/xe: Modify minimum of various scheduler timeout to 0


