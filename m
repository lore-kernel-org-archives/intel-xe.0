Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DC9C54E71
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 18:51:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B40E10FC60;
	Tue, 19 Mar 2024 18:51:22 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA12910E638;
 Tue, 19 Mar 2024 18:51:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/3=5D_drm/xe=3A_Drop_ggtt_invalidate_from_display_code?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Mar 2024 18:51:20 -0000
Message-ID: <171087428062.906748.1404829533563273148@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240319170756.14020-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240319170756.14020-1-maarten.lankhorst@linux.intel.com>
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

Series: series starting with [CI,1/3] drm/xe: Drop ggtt invalidate from display code
URL   : https://patchwork.freedesktop.org/series/131339/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8a407fdc3fc4082f8b86c06680a270da297ec423
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Tue Mar 19 18:07:56 2024 +0100

    drm/xe: Move xe_ggtt_invalidate out from ggtt->lock
    
    Considering the caller of the GGTT functions should keep the
    backing storage alive before the function completes, it's not
    necessary to invalidate with the GGTT lock held. This just adds
    latency for every user of the GGTT.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20240306052002.311196-5-matthew.brost@intel.com
+ /mt/dim checkpatch c998853b06760efc02617828e7b569a73ac73dc5 drm-intel
45368b467125 drm/xe: Drop ggtt invalidate from display code
3cd45012571a drm/xe: Add XE_BO_GGTT_INVALIDATE_BIT flag
8a407fdc3fc4 drm/xe: Move xe_ggtt_invalidate out from ggtt->lock
-:15: WARNING:BAD_SIGN_OFF: Duplicate signature
#15: 
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

total: 0 errors, 1 warnings, 0 checks, 36 lines checked


