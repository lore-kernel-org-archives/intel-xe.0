Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E24C02190
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 04:43:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CFE10E189;
	Fri, 31 Jan 2025 04:43:44 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B407310E189;
 Fri, 31 Jan 2025 04:43:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dp=3A_Return_min?=
 =?utf-8?q?_bpc_supported_by_source_instead_of_0?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Jan 2025 04:43:43 -0000
Message-ID: <173829862372.3085463.6474768712878995407@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250131041342.3086716-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250131041342.3086716-1-ankit.k.nautiyal@intel.com>
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

Series: drm/i915/dp: Return min bpc supported by source instead of 0
URL   : https://patchwork.freedesktop.org/series/144162/
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
commit 4ab89272e3231f8f921c3929bf951504a082b760
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Fri Jan 31 09:43:42 2025 +0530

    drm/i915/dp: Return min bpc supported by source instead of 0
    
    Currently, intel_dp_dsc_max_src_input_bpc can return 0 for platforms not
    supporting DSC, which could theoretically cause issues in clamp()
    due to a low limit being greater than the high limit.
    
    Instead, return the minimum bpc supported by the source to prevent
    such issues.
    
    Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
    Closes: https://lore.kernel.org/all/CA+G9fYtNfM399_=_ff81zeRJv=0+z7oFJfPGmJgTp6yrJmU+1w@mail.gmail.com/
    Fixes: 160672b86b0d ("drm/i915/dp: Use clamp for pipe_bpp limits with DSC")
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
    Cc: Jani Nikula <jani.nikula@linux.intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 0c2a60e7f1e779d87754254d9e3443beedbb684e drm-intel
4ab89272e323 drm/i915/dp: Return min bpc supported by source instead of 0


