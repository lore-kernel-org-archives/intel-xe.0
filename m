Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1855DFA375E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 15:56:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C7910E23E;
	Fri, 13 Sep 2024 15:56:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3FA10E23E;
 Fri, 13 Sep 2024 15:56:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/debugfs=3A_intel?=
 =?utf-8?q?=5Fdisplay=5Fcaps?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Sep 2024 15:56:54 -0000
Message-ID: <172624301417.997293.17605852441006743248@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1726231866.git.jani.nikula@intel.com>
In-Reply-To: <cover.1726231866.git.jani.nikula@intel.com>
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

Series: drm/i915/debugfs: intel_display_caps
URL   : https://patchwork.freedesktop.org/series/138649/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1113c5d81ceb66e682bba549c676682b8a473c51
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Sep 13 15:51:55 2024 +0300

    drm/i915/debugfs: add dedicated intel_display_caps debugfs for display
    
    Add dedicated intel_display_caps for display, with device info and
    params. Intentionally prefix the file intel_ instead of i915_. Going
    forward, we should do the same for all debugfs files, making them
    independent of i915 and xe.
    
    Remove display param dumping from i915 specific i915_capabilities
    debugfs.
    
    Note that we don't add node_to_intel_display() functionality in
    to_intel_display(). It's too specific for that.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 8c9686621372c8cb3e1ca6154d89bffb876d3ff0 drm-intel
1d7b3b18c217 drm/i915/debugfs: remove superfluous kernel_param_lock/unlock
1113c5d81ceb drm/i915/debugfs: add dedicated intel_display_caps debugfs for display


