Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64375C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 09:09:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2CD10E188;
	Tue, 25 Jun 2024 09:09:17 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53C110E188;
 Tue, 25 Jun 2024 09:09:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Configure_T?=
 =?utf-8?q?LB_timeout_based_on_CT_buffer_size?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jun 2024 09:09:15 -0000
Message-ID: <171930655593.154922.10065027077287117277@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240625084947.30869-1-nirmoy.das@intel.com>
In-Reply-To: <20240625084947.30869-1-nirmoy.das@intel.com>
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

Series: drm/xe/guc: Configure TLB timeout based on CT buffer size
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
commit 555c13e65922f280cca44f0135c874681fa4b589
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Tue Jun 25 10:49:47 2024 +0200

    drm/xe/guc: Configure TLB timeout based on CT buffer size
    
    GuC TLB invalidation depends on GuC to process the request from the CT
    queue and then the real time to invalidate TLB. Add a function to return
    overestimated possible time a TLB inval H2G might take which can be used
    as timeout value for TLB invalidation wait time.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1622
    Cc: Matthew Brost <matthew.brost@intel.com>
    Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 5e45785f315938951d86af616d35a5ba08bfeabc drm-intel
555c13e65922 drm/xe/guc: Configure TLB timeout based on CT buffer size


