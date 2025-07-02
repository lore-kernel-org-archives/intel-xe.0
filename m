Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9453AC77B7C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 16:50:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581D010E750;
	Wed,  2 Jul 2025 16:50:27 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E90B10E165;
 Wed,  2 Jul 2025 16:50:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Don=27t_all?=
 =?utf-8?q?ocate_temporary_policies_object?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Jul 2025 16:50:26 -0000
Message-ID: <175147502618.128480.4984039834500031839@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250702142504.1656-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250702142504.1656-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/guc: Don't allocate temporary policies object
URL   : https://patchwork.freedesktop.org/series/151075/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b92e861c0cb34b8845e5c73e6d1ea3716beac352
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Jul 2 16:25:04 2025 +0200

    drm/xe/guc: Don't allocate temporary policies object
    
    Since we are already using reusable buffer objects from the GuC
    buffer cache, we can directly write into their CPU pointers and
    spare unnecessary temporary allocation.
    
    While around, also make sure to clear obtained buffer, to avoid
    sending some stale data.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 94631e6b7f655b1922e3227970cd6180200694af drm-intel
b92e861c0cb3 drm/xe/guc: Don't allocate temporary policies object
-:47: WARNING:LINE_SPACING: Missing a blank line after declarations
#47: FILE: drivers/gpu/drm/xe/xe_guc_ads.c:1011:
+	struct xe_device *xe = ads_to_xe(ads);
+	CLASS(xe_guc_buf, buf)(&guc->buf, sizeof(*policies));

total: 0 errors, 1 warnings, 0 checks, 45 lines checked


