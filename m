Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E32FC0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 20:00:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B5510E1B3;
	Wed, 29 Jan 2025 20:00:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957BA10E1B3;
 Wed, 29 Jan 2025 20:00:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/gt=5Fpagefault=3A_?=
 =?utf-8?q?Print_engine_class_string?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Jan 2025 20:00:54 -0000
Message-ID: <173818085460.2530294.1387462838217983055@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250129175241.338043-1-francois.dugast@intel.com>
In-Reply-To: <20250129175241.338043-1-francois.dugast@intel.com>
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

Series: drm/xe/gt_pagefault: Print engine class string
URL   : https://patchwork.freedesktop.org/series/144116/
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
commit 1f285bb97942bf9ce34ea1366e3e7b87bca4e668
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Wed Jan 29 18:52:41 2025 +0100

    drm/xe/gt_pagefault: Print engine class string
    
    The engine class index which is printed here is an internal representation
    for debugging. It is _not_ an index based on DRM_XE_ENGINE_CLASS_* values
    provided in the uAPI. Add the string representation of the engine class to
    the output in order to limit possible confusion by users when analyzing the
    logs.
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 45746920fb499b7ad35883c94ebfbedda6c40139 drm-intel
1f285bb97942 drm/xe/gt_pagefault: Print engine class string


