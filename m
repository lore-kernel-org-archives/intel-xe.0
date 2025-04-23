Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359E7C369CB
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 11:33:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA24A89580;
	Wed, 23 Apr 2025 11:33:19 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B0089580;
 Wed, 23 Apr 2025 11:33:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/2=5D_drm/i915/reg=3A_use_REG=5FBIT_and_friends_to_define_DP?=
 =?utf-8?q?_registers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Apr 2025 11:33:18 -0000
Message-ID: <174540799886.171.4852643466707354669@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250423100213.720585-1-jani.nikula@intel.com>
In-Reply-To: <20250423100213.720585-1-jani.nikula@intel.com>
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

Series: series starting with [CI,1/2] drm/i915/reg: use REG_BIT and friends to define DP registers
URL   : https://patchwork.freedesktop.org/series/148124/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 90efe3b69fd2461893290825a07ce5e67fd0a23e
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Apr 23 13:02:13 2025 +0300

    drm/i915/reg: Add/remove some extra blank lines
    
    Add/remove some blank lines to/from i915_reg.h primarily to help the
    scripted refactoring coming up, separating unrelated registers and
    keeping the comments together.
    
    v2: Also add some extra blank lines
    
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com> # v1
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch d6a6684585dd1c86a8ad88d592c73193482cf5a1 drm-intel
2f1e9f729e8f drm/i915/reg: use REG_BIT and friends to define DP registers
90efe3b69fd2 drm/i915/reg: Add/remove some extra blank lines


