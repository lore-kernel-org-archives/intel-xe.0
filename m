Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C019AEEAA55
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 16:20:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D80A10E1D4;
	Thu, 14 Sep 2023 16:20:35 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 713D210E1D4;
 Thu, 14 Sep 2023 16:20:33 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6FAC0A00E6;
 Thu, 14 Sep 2023 16:20:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Date: Thu, 14 Sep 2023 16:20:33 -0000
Message-ID: <169470843345.29166.13097398073998570467@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230914145451.159278-1-vinod.govindapillai@intel.com>
In-Reply-To: <20230914145451.159278-1-vinod.govindapillai@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Re?=
 =?utf-8?q?vert_=22FIXME=3A_drm/i915/hpd=3A_skip_intel=5Fhpd=5Fpoll=5Ffini?=
 =?utf-8?q?=28=29_for_non-display_paths=22?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Revert "FIXME: drm/i915/hpd: skip intel_hpd_poll_fini() for non-display paths"
URL   : https://patchwork.freedesktop.org/series/123702/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 04abd1afc28a4e26aada6f9bc1580c2fc2392d30
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Thu Sep 14 17:54:51 2023 +0300

    Revert "FIXME: drm/i915/hpd: skip intel_hpd_poll_fini() for non-display paths"
    
    This reverts commit 5b503f7b6aa156d452fae3c92d9060b531aa628c.
    
    This can be reverted as the intel_hpd_poll_fini is called from
    display paths
    
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch aeac46cfaebff413254ac07837b97370c7ed3957 drm-intel
04abd1afc Revert "FIXME: drm/i915/hpd: skip intel_hpd_poll_fini() for non-display paths"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '5b503f7b6aa156d452fae3c92d9060b531aa628c', maybe rebased or not pulled?
#7: 
This reverts commit 5b503f7b6aa156d452fae3c92d9060b531aa628c.

total: 0 errors, 1 warnings, 0 checks, 9 lines checked


