Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55671C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jul 2024 23:04:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D5F10E5A5;
	Tue, 30 Jul 2024 23:04:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC13F10E5A5;
 Tue, 30 Jul 2024 23:04:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/gt=3A_Apply_Wa=5F1?=
 =?utf-8?q?4020881953?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 30 Jul 2024 23:04:05 -0000
Message-ID: <172238064570.465953.16400316562007114922@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240730224530.2688251-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20240730224530.2688251-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe/gt: Apply Wa_14020881953
URL   : https://patchwork.freedesktop.org/series/136708/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
7b537a014c4c1a32250e342541870b03977fa7a4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8b2aa5384133e9a29489834ba317af6c64a33f5a
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Tue Jul 30 15:45:30 2024 -0700

    drm/xe/gt: Apply Wa_14020881953
    
    This WA requires us to disable Render power gating. There is a second part
    to the WA which requires setting a WA bit in GuC. That will be done once
    GuC FW has those changes.
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 4b1ff33f467ab28809de294cdda1ee9f6e16298d drm-intel
8b2aa5384133 drm/xe/gt: Apply Wa_14020881953


