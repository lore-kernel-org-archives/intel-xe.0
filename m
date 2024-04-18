Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC722C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 23:58:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CAB10F4D9;
	Thu, 18 Apr 2024 23:58:02 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4655510F4D9;
 Thu, 18 Apr 2024 23:58:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_Convert_intel?=
 =?utf-8?q?=5Fruntime=5Fpm=5Fget=5Fnoresume_towards_raw_wakeref_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Apr 2024 23:58:01 -0000
Message-ID: <171348468128.1502081.18097735116968241959@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240418221320.66644-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240418221320.66644-1-rodrigo.vivi@intel.com>
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

Series: drm/i915: Convert intel_runtime_pm_get_noresume towards raw wakeref (rev2)
URL   : https://patchwork.freedesktop.org/series/132624/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 46588c4f6c52026911c83171934e18cc7caa96ab
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Thu Apr 18 18:37:56 2024 -0400

    drm/i915: Convert intel_runtime_pm_get_noresume towards raw wakeref
    
    In the past, the noresume function was used by the GEM code to ensure
    wakelocks were held and bump its usage. This is no longer the case
    and this function was totally unused until it started to be used again
    by display with commit 77e619a82fc3 ("drm/i915/display: convert inner
    wakeref get towards get_if_in_use")
    
    However, on the display code, most of the callers are using the
    raw wakeref, rather then the wakelock version. What caused a
    major regression caught by CI.
    
    Another option to this patch is to go with the original plan and
    use the get_if_in_use variant in the display code, what is enough
    to fulfil our needs. Then, an extra patch to delete the unused
    _noresume variant.
    
    v2: Keep grabbing wakelock but only assert for wakeref. (Imre)
    
    Cc: Imre Deak <imre.deak@intel.com>
    Cc: Francois Dugast <francois.dugast@intel.com>
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Fixes: 77e619a82fc3 ("drm/i915/display: convert inner wakeref get towards get_if_in_use")
    Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10875
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch cabe88f47c1f688f4493de88acc532bf584efe3c drm-intel
46588c4f6c52 drm/i915: Convert intel_runtime_pm_get_noresume towards raw wakeref


