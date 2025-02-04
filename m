Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4895AC02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 17:48:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142C510E049;
	Tue,  4 Feb 2025 17:48:38 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C4E10E37B;
 Tue,  4 Feb 2025 17:48:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/lspcon=3A_interf?=
 =?utf-8?q?ace_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Feb 2025 17:48:37 -0000
Message-ID: <173869131709.990674.15433563122344620240@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1738677489.git.jani.nikula@intel.com>
In-Reply-To: <cover.1738677489.git.jani.nikula@intel.com>
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

Series: drm/i915/lspcon: interface cleanups
URL   : https://patchwork.freedesktop.org/series/144316/
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
commit 2f4cd9fc4fa5b1bd7021b2d0aa09832d6211b530
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Feb 4 15:58:43 2025 +0200

    drm/i915/lspcon: rename interfaces to intel_lspcon_* to unify
    
    Rename all the main functions to have intel_lspcon_ prefix. Keep the
    infoframes hooks named lspcon_ for now, and grouped together, as there'd
    be a clash with intel_lspcon_infoframes_enabled().
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 34f113e9fef546134e402e7657fc47e92fba59dc drm-intel
a2f08fc9b94c drm/i915/hdmi: move declarations for hsw_read/write_infoframe() to the right place
6ffd158fced9 drm/i915/lspcon: add intel_lspcon_active() and use it
bcf585523a4a drm/i915/lspcon: change signature of lspcon_detect_hdr_capability()
94a205c81f6c drm/i915/lspcon: change signature of lspcon_wait_pcon_mode()
42968ec2c66b drm/i915/lspcon: remove dp_to_lspcon(), hide enc_to_intel_lspcon()
2f4cd9fc4fa5 drm/i915/lspcon: rename interfaces to intel_lspcon_* to unify


