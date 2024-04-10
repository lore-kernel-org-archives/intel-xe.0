Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815B8CD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 02:04:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D4811309C;
	Wed, 10 Apr 2024 02:04:22 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1926311309C;
 Wed, 10 Apr 2024 02:04:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/9=5D_drm/xe=3A_Introduce_xe=5Fpm=5Fruntime=5Fget=5Fnoresume_for_?=
 =?utf-8?q?inner_callers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Apr 2024 02:04:20 -0000
Message-ID: <171271466010.1318876.1026303140421525804@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240410015826.1093368-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240410015826.1093368-1-rodrigo.vivi@intel.com>
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

Series: series starting with [1/9] drm/xe: Introduce xe_pm_runtime_get_noresume for inner callers
URL   : https://patchwork.freedesktop.org/series/132240/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ea7b2f5c5e4946c33fdc9521429c987fc9c3a03e
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Tue Apr 9 21:58:25 2024 -0400

    drm/xe: Ensure all the inner access are using the _noresume variant
    
    At this point mem_access references should be only used as inner
    points of the execution and a get with synchronous resume previously
    called at an outer point.
    
    So, before killing mem_acces in favor of direct accsess, let's
    ensure that we first convert them towards the new _noresume
    variant that will WARN us if no inner caller happened.
    
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 057ec21a54cddd595a7725fa8731eb4c5bd5abff drm-intel
3ef029b36acc drm/xe: Introduce xe_pm_runtime_get_noresume for inner callers
2bde9affade9 drm/xe: Introduce intel_runtime_pm_get_noresume at compat-i915-headers for display
0d0ead96ffe3 drm/i915/display: convert inner wakeref get towards get_if_in_use
3e3cd9e96e8c drm/xe: Move lockdep protection from mem_access to xe_pm_runtime
e80b7bd022c9 drm/xe: Remove useless mem_access during probe
ed0dcdd69eeb drm/xe: Convert xe_gem_fault to use direct xe_pm_runtime calls
dc9ea35fefda drm/xe: Removing extra mem_access protection from runtime pm
9688f65f68a3 drm/xe: Convert mem_access_if_ongoing to direct xe_pm_runtime_get_if_active
ea7b2f5c5e49 drm/xe: Ensure all the inner access are using the _noresume variant


