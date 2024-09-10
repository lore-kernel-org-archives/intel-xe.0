Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DE3ECE58A
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 16:26:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B6010E809;
	Tue, 10 Sep 2024 16:26:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E324310E809;
 Tue, 10 Sep 2024 16:26:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe=5Fgt=5Fidle=3A_?=
 =?utf-8?q?Fix_name_conflict?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Sep 2024 16:26:35 -0000
Message-ID: <172598559592.981347.4489225757010038147@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240910142837.636680-1-riana.tauro@intel.com>
In-Reply-To: <20240910142837.636680-1-riana.tauro@intel.com>
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

Series: drm/xe/xe_gt_idle: Fix name conflict
URL   : https://patchwork.freedesktop.org/series/138479/
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
commit 604a84e5ce54ac738db05778f8df266bcac3bbc3
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Tue Sep 10 19:58:37 2024 +0530

    drm/xe/xe_gt_idle: Fix name conflict
    
    Remove local copy of str_up_down to fix name conflict.
    
    Fixes: 0914c1e45d3a ("drm/xe/xe_gt_idle: add debugfs entry for powergating info")
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch f25ffe1514b26574258bb767f5c6f53facdfaaca drm-intel
604a84e5ce54 drm/xe/xe_gt_idle: Fix name conflict


