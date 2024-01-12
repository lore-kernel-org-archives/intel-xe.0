Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7F8C4707C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 10:45:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED70710EAC9;
	Fri, 12 Jan 2024 10:45:03 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CF310E0FE;
 Fri, 12 Jan 2024 10:45:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe/guc=3A_Return_CTB_HXG_response_DATA0_if_no_buffer_pr?=
 =?utf-8?q?ovided?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Fri, 12 Jan 2024 10:45:03 -0000
Message-ID: <170505630300.332504.4279703833210634984@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240112102554.761-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240112102554.761-1-michal.wajdeczko@intel.com>
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

Series: series starting with [1/2] drm/xe/guc: Return CTB HXG response DATA0 if no buffer provided
URL   : https://patchwork.freedesktop.org/series/128713/
State : success

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
commit e976c012ffe8a9bf1fc13107dab6d1dcbe05df0f
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri Jan 12 11:25:54 2024 +0100

    drm/xe/guc: Add kernel-doc for xe_guc_ct_send_recv()
    
    The communication with the GuC firmware is crucial for the driver
    but unfortunately it has limited documentation.  Add initial
    documentation for recently updated xe_guc_ct_send_recv().
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 10923212b018be3edb1c21b75f432c6cf3f50c6b drm-intel
8a1c6df6e drm/xe/guc: Return CTB HXG response DATA0 if no buffer provided
e976c012f drm/xe/guc: Add kernel-doc for xe_guc_ct_send_recv()


