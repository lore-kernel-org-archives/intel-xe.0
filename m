Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D367AC5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 19:58:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D25910E699;
	Tue,  3 Jun 2025 19:58:20 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06B110E699;
 Tue,  3 Jun 2025 19:58:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Make_force=5Fre?=
 =?utf-8?q?set_attributes_write-only?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Jun 2025 19:58:19 -0000
Message-ID: <174898069971.45504.649008467555849637@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250603192218.637-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250603192218.637-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Make force_reset attributes write-only
URL   : https://patchwork.freedesktop.org/series/149799/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 06eba1e2145a3b30259959d6a66faf6ab42ae845
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Jun 3 21:22:18 2025 +0200

    drm/xe: Make force_reset attributes write-only
    
    Stop supporting triggering GT resets from readoperations, as main
    user of this feature (IGT) already switched to use write operation.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch ba486e3b10ce5b4ee4d1ffc58aa4cc3b669c02a3 drm-intel
06eba1e2145a drm/xe: Make force_reset attributes write-only


