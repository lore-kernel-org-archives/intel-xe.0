Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15ABCDB479
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 10:52:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F76210E1D2;
	Thu, 25 Jun 2026 10:52:41 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A11610E1D2;
 Thu, 25 Jun 2026 10:52:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/hdcp=3A_require_?=
 =?utf-8?q?monotonically_increasing_seq=5Fnum=5Fv?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Jun 2026 10:52:39 -0000
Message-ID: <178238475936.116991.9278427781879561557@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260625104407.1025614-1-jani.nikula@intel.com>
In-Reply-To: <20260625104407.1025614-1-jani.nikula@intel.com>
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

Series: drm/i915/hdcp: require monotonically increasing seq_num_v
URL   : https://patchwork.freedesktop.org/series/169185/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2090bf6eee1b8be6d060919594c979c549ad0ef7
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Jun 25 13:44:07 2026 +0300

    drm/i915/hdcp: require monotonically increasing seq_num_v
    
    The HDCP 2.2 specification requires the seq_num_v to be monotonically
    increasing, and repeated seq_num_v needs to be treated as an integrity
    failure. Make it so.
    
    For the first message, seq_num_v must be zero, and is already
    checked. We can only check for less-than-or-equal for the subsequent
    messages, where hdcp2_encrypted is true.
    
    Discovered using AI-assisted static analysis confirmed by Intel Product
    Security.
    
    Reported-by: Martin Hodo <martin.hodo@intel.com>
    Fixes: d849178e2c9e ("drm/i915: Implement HDCP2.2 repeater authentication")
    Cc: <stable@vger.kernel.org> # v5.2+
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch adbc617250e16fb2db4a4c777b89440927cb8973 drm-intel
2090bf6eee1b drm/i915/hdcp: require monotonically increasing seq_num_v
-:17: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#17: 
Reported-by: Martin Hodo <martin.hodo@intel.com>
Fixes: d849178e2c9e ("drm/i915: Implement HDCP2.2 repeater authentication")

total: 0 errors, 1 warnings, 0 checks, 13 lines checked


