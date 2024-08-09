Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A967C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 19:23:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A11910E9EB;
	Fri,  9 Aug 2024 19:23:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00D810E9EB;
 Fri,  9 Aug 2024 19:23:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Allow_exec_queue_backend_?=
 =?utf-8?q?ops_which_issue_message_to_be_called_multiple_times?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Aug 2024 19:23:53 -0000
Message-ID: <172323143378.552626.14474684350344803650@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240809191929.3138956-1-matthew.brost@intel.com>
In-Reply-To: <20240809191929.3138956-1-matthew.brost@intel.com>
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

Series: Allow exec queue backend ops which issue message to be called multiple times
URL   : https://patchwork.freedesktop.org/series/137102/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
dc547930fbb1350eaf6bde84653b9ac973a411db
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ff2110aa440f2a4313a77affb13caae7d96d743a
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Aug 9 12:19:29 2024 -0700

    drm/xe: Allow suspend / resume to be safely called multiple times
    
    Switching modes between LR and dma-fence can result in multiple calls to
    suspend / resume. Make these calls safe while still enforcing call
    order.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 13384fb5b1e76e7012902cc10b1e49023358dc1d drm-intel
5fc4bf805dc9 drm/xe: Add xe_sched_msg_lock/unlock helper
9e1c952f81f1 drm/xe: Reinit msg link when processing a message
9dc9f8ea043b drm/xe: Add xe_sched_add_msg_locked helper
9615299aac14 drm/xe: Only enable scheduling upon resume if needed
ff2110aa440f drm/xe: Allow suspend / resume to be safely called multiple times


