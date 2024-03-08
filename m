Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077CAC5475B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 10:49:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B561E10EEA7;
	Fri,  8 Mar 2024 10:49:47 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFF410EEA7;
 Fri,  8 Mar 2024 10:49:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Modify_min_vari?=
 =?utf-8?q?ous_scheduler_timeout_to_0=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Mar 2024 10:49:46 -0000
Message-ID: <170989498658.612184.14350572198813781870@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240308105744.2478794-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240308105744.2478794-1-himal.prasad.ghimiray@intel.com>
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

Series: drm/xe: Modify min various scheduler timeout to 0.
URL   : https://patchwork.freedesktop.org/series/130912/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9bb2a8a17457065eb398a81e8fd9aec2b519fd6
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3a64615db3a5cb13d7bdf9f2cad05458d6de8dc0
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Fri Mar 8 16:27:44 2024 +0530

    drm/xe: Modify min various scheduler timeout to 0.
    
    The sysman teams needs to disable preemption and timneslice to
    test exclusivity mode and are relying on setting 'timeslice_duration_us'
    and 'preempt_timeout_us' to 0 for using exclusive mode. Hence seting the
    min configs to 0.
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 024301d28b0b2cf492ffdb3ce688044cd9923f38 drm-intel
3a64615db3a5 drm/xe: Modify min various scheduler timeout to 0.


