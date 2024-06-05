Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C39C27C53
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 15:28:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA7310E1AE;
	Wed,  5 Jun 2024 15:28:46 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52FD10E1AE;
 Wed,  5 Jun 2024 15:28:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe=5Fgt=5Fdebugfs?=
 =?utf-8?q?=3A_Add_synchronous_gt_reset_debugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Jun 2024 15:28:44 -0000
Message-ID: <171760132487.79.11912812303670443855@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240605150828.2736396-1-jonathan.cavitt@intel.com>
In-Reply-To: <20240605150828.2736396-1-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
URL   : https://patchwork.freedesktop.org/series/134508/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 46a5917198a6ee030bfa72e6e86cec86ca31e33f
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Wed Jun 5 08:08:28 2024 -0700

    drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
    
    We currently have debugfs support that allows the userspace to initiate
    an asynchronous gt reset on command.  However, userspace may also wish
    to wait for the completion of the gt reset before performing any
    additional work.  To that end, add a version of the force_reset gt
    debugfs function that operates synchronously.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1068
    Suggested-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    CC: John Harrison <john.c.harrison@intel.com>
    CC: Stuart Summers <stuart.summers@intel.com>
+ /mt/dim checkpatch a494545483635d3d93d19e8f483f61e7d4198383 drm-intel
46a5917198a6 drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs


