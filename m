Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A30CC3064D
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 14:02:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA6510E8BE;
	Wed, 26 Jun 2024 14:02:24 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF6610E8BE;
 Wed, 26 Jun 2024 14:02:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Configure_T?=
 =?utf-8?q?LB_timeout_based_on_CT_buffer_size_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jun 2024 14:02:24 -0000
Message-ID: <171941054424.159665.4104774325408856720@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240626134239.5190-1-nirmoy.das@intel.com>
In-Reply-To: <20240626134239.5190-1-nirmoy.das@intel.com>
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

Series: drm/xe/guc: Configure TLB timeout based on CT buffer size (rev2)
URL   : https://patchwork.freedesktop.org/series/135341/
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
commit bc388e678ad217414ee7de257a997bd9b6930789
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Wed Jun 26 15:42:39 2024 +0200

    drm/xe/guc: Configure TLB timeout based on CT buffer size
    
    GuC TLB invalidation depends on GuC to process the request from the CT
    queue and then the real time to invalidate TLB. Add a function to return
    overestimated possible time a TLB inval H2G might take which can be used
    as timeout value for TLB invalidation wait time.
    
    v2: Address reviews from Michal.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1622
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 426a86fcf373dc03a682c46628cf4f2a9ffeaf65 drm-intel
bc388e678ad2 drm/xe/guc: Configure TLB timeout based on CT buffer size


