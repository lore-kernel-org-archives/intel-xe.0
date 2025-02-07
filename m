Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A98C02194
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 15:25:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D851410EB47;
	Fri,  7 Feb 2025 15:25:37 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C7610EB47;
 Fri,  7 Feb 2025 15:25:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/pf=3A_Use_an_expli?=
 =?utf-8?q?cit_check_to_see_if_the_device_has_LMTT_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Feb 2025 15:25:36 -0000
Message-ID: <173894193613.2687487.8706204330297115776@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250207113111.853821-1-piotr.piorkowski@intel.com>
In-Reply-To: <20250207113111.853821-1-piotr.piorkowski@intel.com>
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

Series: drm/xe/pf: Use an explicit check to see if the device has LMTT (rev4)
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
commit 0fa351d270a82e9b0d4170ecda72786f333b716a
Author: Piotr Piórkowski <piotr.piorkowski@intel.com>
Date:   Fri Feb 7 12:31:11 2025 +0100

    drm/xe/pf: Use an explicit check to see if the device has LMTT
    
    So far, the main condition for using LMTT has been to check that
    the device is a discrete gfx.
    Let's add a dedicated function to check if the device supports LMTT
    as not all future discrete GPU platforms will require LMTT.
    
    v2:
     - use xe_has_device_lmtt only when necessary - leave IS_DGFX for other
       things related to LMEM provisioning
    v3:
     - remove IS_SRIOV_PF condition from xe_device_has_lmtt (Michal
       Wajdeczko)
     - keep IS_SRIOV_PF asserts in LMTT-related code (Michal Wajdeczko)
    v4:
     - update commit description
    
    Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Michał Winiarski <michal.winiarski@intel.com>
    Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch f8ea772f4fb5a761d1dc321aad5749633d0801eb drm-intel
0fa351d270a8 drm/xe/pf: Use an explicit check to see if the device has LMTT


