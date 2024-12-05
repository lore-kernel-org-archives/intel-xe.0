Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E8AE77170
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 09:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DE910E1B5;
	Thu,  5 Dec 2024 09:36:08 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65DF710E1B5;
 Thu,  5 Dec 2024 09:36:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_clean?=
 =?utf-8?q?_up_DP_Adaptive_Sync_SDP_state_mismatch_logging?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Dec 2024 09:36:07 -0000
Message-ID: <173339136741.2914505.14807330508738678836@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241205093042.3028608-1-jani.nikula@intel.com>
In-Reply-To: <20241205093042.3028608-1-jani.nikula@intel.com>
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

Series: drm/i915/display: clean up DP Adaptive Sync SDP state mismatch logging
URL   : https://patchwork.freedesktop.org/series/142153/
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
commit 7853e2a7e84229c0b32a11b4b6505b0b19c957a8
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Dec 5 11:30:42 2024 +0200

    drm/i915/display: clean up DP Adaptive Sync SDP state mismatch logging
    
    Pass the drm_printer from intel_pipe_config_compare(), and use it for
    logging, along with pipe_config_mismatch(), to simplify and unify.
    
    While at it, differentiate the VSC and AS SDP log texts from each other.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 6d42506688c08f85240449e80658ab760d899ae2 drm-intel
7853e2a7e842 drm/i915/display: clean up DP Adaptive Sync SDP state mismatch logging


