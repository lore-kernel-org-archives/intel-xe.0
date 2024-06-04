Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEE7C25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 22:00:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4EF010E5D6;
	Tue,  4 Jun 2024 22:00:33 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13A910E5D6;
 Tue,  4 Jun 2024 22:00:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe=5Fguc=5Fsubmit?=
 =?utf-8?q?=3A_Declare_reset_if_guc_stopped?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Jun 2024 22:00:30 -0000
Message-ID: <171753843091.2266114.944288574805963444@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240603210554.2458942-1-jonathan.cavitt@intel.com>
In-Reply-To: <20240603210554.2458942-1-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_guc_submit: Declare reset if guc stopped
URL   : https://patchwork.freedesktop.org/series/134415/
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
commit 7c5e8dacdc371530acdff8434c5808a8cc4dd994
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Mon Jun 3 14:05:54 2024 -0700

    drm/xe/xe_guc_submit: Declare reset if guc stopped
    
    An exec queue should be considered reset if the guc it was running on
    has had its submission state disabled, as this normally only occurs on
    a reset.  So, add the condition to the reset_status guc_exec_queue_op.
    
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    CC: John Harrison <john.c.harrison@intel.com>
    CC: Matthew Brost <matthew.brost@intel.com>
    CC: Stuart Summers <stuart.summers@intel.com>
+ /mt/dim checkpatch 596cf447db94909c4788fd612876520531e439b0 drm-intel
7c5e8dacdc37 drm/xe/xe_guc_submit: Declare reset if guc stopped


