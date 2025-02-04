Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2317C02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 11:00:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F7310E5EB;
	Tue,  4 Feb 2025 11:00:01 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A5810E5EB;
 Tue,  4 Feb 2025 11:00:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/pf=3A_Use_an_expli?=
 =?utf-8?q?cit_check_to_see_if_the_device_has_LMTT_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Feb 2025 11:00:00 -0000
Message-ID: <173866680021.814225.22425485307453637@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250204105124.795989-1-piotr.piorkowski@intel.com>
In-Reply-To: <20250204105124.795989-1-piotr.piorkowski@intel.com>
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

Series: drm/xe/pf: Use an explicit check to see if the device has LMTT (rev2)
URL   : https://patchwork.freedesktop.org/series/142212/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 77af71116c5cefd823a845ab6d4e1761313612dc
Author: Piotr Piórkowski <piotr.piorkowski@intel.com>
Date:   Tue Feb 4 11:51:24 2025 +0100

    drm/xe/pf: Use an explicit check to see if the device has LMTT
    
    So far, the main condition for using LMTT has been to check that
    the device is a discrete gfx. In addition, we have checked, using
    assertions, that the device is PF.
    Instead, let's add a dedicated function to check if the device
    supports LMTT.
    
    v2:
     - use xe_has_device_lmtt only when necessary - leave IS_DGFX for other
       things related to LMEM provisioning
    
    Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Michał Winiarski <michal.winiarski@intel.com>
    Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
+ /mt/dim checkpatch d3f7add53c15ed866828937f140ac252c19f2411 drm-intel
77af71116c5c drm/xe/pf: Use an explicit check to see if the device has LMTT


