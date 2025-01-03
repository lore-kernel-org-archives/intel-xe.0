Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1057DE7718F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jan 2025 04:30:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B3310E3E0;
	Fri,  3 Jan 2025 04:30:51 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4D010E3E0;
 Fri,  3 Jan 2025 04:30:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dp=3A_Return_ear?=
 =?utf-8?q?ly_if_dsc_is_required_but_not_supported?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 03 Jan 2025 04:30:50 -0000
Message-ID: <173587865069.2396897.8494519329513839416@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250103031424.1732774-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250103031424.1732774-1-ankit.k.nautiyal@intel.com>
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

Series: drm/i915/dp: Return early if dsc is required but not supported
URL   : https://patchwork.freedesktop.org/series/143076/
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
commit 4ccf0579a95fc03a50564fe116ba26807771ac3d
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Fri Jan 3 08:44:24 2025 +0530

    drm/i915/dp: Return early if dsc is required but not supported
    
    Currently, when bandwidth is insufficient for a given mode, we attempt
    to use DSC. This is indicated by a debug print, followed by a check for
    DSC support.
    
    The debug message states that we are trying DSC, but DSC might not be
    supported, which can give an incorrect picture in the logs if we bail
    out later.
    
    Correct the order for both DP and DP MST to:
    - Check if DSC is required and supported, and return early if DSC is
    not supported.
    - Print a debug message to indicate that DSC will be tried next.
    
    Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 048d83e7f9dae81c058d31c371634c1c317b3013 drm-intel
4ccf0579a95f drm/i915/dp: Return early if dsc is required but not supported


