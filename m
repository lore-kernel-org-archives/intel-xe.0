Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0111BC54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 14:16:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB6E10FB8A;
	Thu, 14 Mar 2024 14:16:08 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B1B10FB8A;
 Thu, 14 Mar 2024 14:16:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B0?=
 =?utf-8?q?1/11=5D_drm/xe=3A_Introduce_xe=5Fpm=5Fruntime=5Fget=5Fnoresume_fo?=
 =?utf-8?q?r_inner_callers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Mar 2024 14:16:06 -0000
Message-ID: <171042576688.754222.10941654331612559238@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240314141021.161009-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240314141021.161009-1-rodrigo.vivi@intel.com>
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

Series: series starting with [01/11] drm/xe: Introduce xe_pm_runtime_get_noresume for inner callers
URL   : https://patchwork.freedesktop.org/series/131140/
State : success

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
commit 61310c477b50bfbd7b77da8062c28979897ba890
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Thu Mar 14 10:10:21 2024 -0400

    drm/xe: Kill xe_device_mem_access_{get*,put}
    
    Let's simply convert all the current callers towards direct
    xe_pm_runtime access and remove this extra layer of indirection.
    
    v2: Convert all the current callers instead of a big refactor
    at once.
    
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch bd9f3491474e53717c6c74205aa86d69ca5571e8 drm-intel
3c2a4857b46f drm/xe: Introduce xe_pm_runtime_get_noresume for inner callers
b7296d53bdb4 drm/xe: Introduce intel_runtime_pm_get_noresume at compat-i915-headers for display
c8ea905c5c8f drm/i915/display: convert inner wakeref get towards get_if_in_use
e4da9d28c44b drm/xe: Move lockdep protection from mem_access to xe_pm_runtime
89df61ee1a6d drm/xe: Convert GSC HDCP from mem_access to direct xe_pm_runtime calls
4ca44a8c594b drm/xe: Remove useless mem_access during probe
44ab87058f62 drm/xe: Convert xe_gem_fault to use direct xe_pm_runtime calls
9d4824177704 drm/xe: Removing extra mem_access protection from runtime pm
5fcdfbed7afe drm/xe: Convert mem_access_if_ongoing to direct xe_pm_runtime_get_if_active
fa9121664007 drm/xe: Ensure all the inner access are using the _noresume variant
61310c477b50 drm/xe: Kill xe_device_mem_access_{get*,put}


