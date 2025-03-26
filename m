Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BD5C3600B
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 12:42:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE7C10E12F;
	Wed, 26 Mar 2025 12:42:55 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36E010E12F;
 Wed, 26 Mar 2025 12:42:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_reduce_intel?=
 =?utf-8?q?=5Fwakeref=2Eh_dependencies?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Mar 2025 12:42:53 -0000
Message-ID: <174299297393.5336.10571830072189304637@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250326115452.2090275-1-jani.nikula@intel.com>
In-Reply-To: <20250326115452.2090275-1-jani.nikula@intel.com>
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

Series: drm/i915: reduce intel_wakeref.h dependencies
URL   : https://patchwork.freedesktop.org/series/146798/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4aff16e181ca9b1a49b7cae8d1bf456f53a309b4
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Mar 26 13:54:52 2025 +0200

    drm/i915: reduce intel_wakeref.h dependencies
    
    Forward declare struct drm_printer instead of including drm/drm_print.h,
    as we only need the pointer. Turns out quite a few places depend on this
    include implicitly. Make them explicit.
    
    Some of the includes are just stale and unnecessary. Group the forward
    declarations together while at it.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8 drm-intel
4aff16e181ca drm/i915: reduce intel_wakeref.h dependencies


