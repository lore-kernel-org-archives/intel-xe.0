Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F320C369AB
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 23:41:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D555C10E055;
	Thu, 24 Apr 2025 23:41:31 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C95810E055;
 Thu, 24 Apr 2025 23:41:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/hdcp=3A_refactor?=
 =?utf-8?q?_HDCP_GSC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Apr 2025 23:41:30 -0000
Message-ID: <174553809064.9047.3690154426677114042@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <cover.1745524803.git.jani.nikula@intel.com>
In-Reply-To: <cover.1745524803.git.jani.nikula@intel.com>
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

Series: drm/i915/hdcp: refactor HDCP GSC
URL   : https://patchwork.freedesktop.org/series/148231/
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
commit 6bad249402ba987cbf635ab2c79c6609a7d0366a
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Apr 24 23:01:42 2025 +0300

    drm/i915/hdcp: drop unnecessary include from intel_hdcp_gsc.h
    
    Nothing in intel_hdcp_gsc.c needs linux/err.h. Remove it.
    
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 22d29c516450a3931a8e0b1346ab9f334c19ab9c drm-intel
9f5fecddeaf9 drm/i915/hdcp: remove duplicate declarations
233523a915cf drm/i915/hdcp: deduplicate and refactor HDCP GSC ops initialization
0aad6efec1f8 drm/i915/hdcp: split HDCP GSC message alloc/save responsibilities
65fdd5e3c33a drm/i915/hdcp: rename struct intel_hdcp_gsc_message to intel_hdcp_gsc_context
538d529c8195 drm/i915/hdcp: rename HDCP GSC context alloc/free functions
ef73fea612a6 drm/i915/hdcp: pass the context to the HDCP GSC message interface
24ab7f54d192 drm/i915/hdcp: switch the HDCP GSC message interface from u8* to void*
1f4dcc134a87 drm/i915/hdcp: simplify HDCP GSC firmware usage selection
018d740eb37a drm/i915/hdcp: pass struct drm_device to driver specific HDCP GSC code
6bad249402ba drm/i915/hdcp: drop unnecessary include from intel_hdcp_gsc.h


