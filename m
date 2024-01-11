Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E08C4707B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 20:23:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D8F10E356;
	Thu, 11 Jan 2024 20:23:56 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77DBA10E356;
 Thu, 11 Jan 2024 20:23:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_potential_d?=
 =?utf-8?q?eadlock_in_=5F=5Ffini=5Fdbm?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Thu, 11 Jan 2024 20:23:55 -0000
Message-ID: <170500463549.290000.16023606523385760192@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240111185603.673-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240111185603.673-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Fix potential deadlock in __fini_dbm
URL   : https://patchwork.freedesktop.org/series/128688/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
faa12d3432d7ef7793d934cd9338c555e95a5aad
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a096176790ac6d889fee43e0274ef77773ab8b5f
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Jan 11 19:56:03 2024 +0100

    drm/xe: Fix potential deadlock in __fini_dbm
    
    If Doorbell Manager is in unclean state during fini phase, for
    debug purposes we try to print it's state, but we missed the fact
    that we are already holding a lock so the xe_guc_db_mgr_print()
    will deadlock since it also attempts to grab the same lock.
    
    Fixes: 990fe6e6ed3c ("drm/xe: Introduce GuC Doorbells Manager")
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch 3095fbb4deb0722d417b6a4ad4213e2ed9ecd052 drm-intel
a09617679 drm/xe: Fix potential deadlock in __fini_dbm
-:14: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '990fe6e6ed3c', maybe rebased or not pulled?
#14: 
Fixes: 990fe6e6ed3c ("drm/xe: Introduce GuC Doorbells Manager")

total: 0 errors, 1 warnings, 0 checks, 58 lines checked


