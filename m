Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A78DC28B2F
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 17:02:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CDD10E242;
	Tue, 11 Mar 2025 17:02:01 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B95410E242;
 Tue, 11 Mar 2025 17:02:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_Maint?=
 =?utf-8?q?ain_alphabetical_order_for_HAS=5FAS=5FSDP_and_HAS=5FCMRR?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Mar 2025 17:02:00 -0000
Message-ID: <174171252030.20427.8565306236381992824@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250311135925.1523852-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250311135925.1523852-1-ankit.k.nautiyal@intel.com>
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

Series: drm/i915/display: Maintain alphabetical order for HAS_AS_SDP and HAS_CMRR
URL   : https://patchwork.freedesktop.org/series/146142/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fa2940a1074a1cf21ca558c21cb8aa50ec1bcd68
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Tue Mar 11 19:29:25 2025 +0530

    drm/i915/display: Maintain alphabetical order for HAS_AS_SDP and HAS_CMRR
    
    Reorder the macros HAS_AS_SDP and HAS_CMRR as per alphabetical order.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch f8df428b3850ed87a1e2f3b12b6025328d8a6373 drm-intel
fa2940a1074a drm/i915/display: Maintain alphabetical order for HAS_AS_SDP and HAS_CMRR


