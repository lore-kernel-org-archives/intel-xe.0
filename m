Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A86C369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 12:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A948710E786;
	Tue, 15 Apr 2025 12:57:41 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1CC10E786;
 Tue, 15 Apr 2025 12:57:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/pch=3A_conversio?=
 =?utf-8?q?n_to_struct_intel=5Fdisplay_use=2C_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Apr 2025 12:57:40 -0000
Message-ID: <174472186056.6683.13582272693726798149@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <cover.1744633934.git.jani.nikula@intel.com>
In-Reply-To: <cover.1744633934.git.jani.nikula@intel.com>
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

Series: drm/i915/pch: conversion to struct intel_display use, cleanups
URL   : https://patchwork.freedesktop.org/series/147756/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fd4b9856089ec7fce3e17eb36256eb36c90023cd
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Apr 14 15:33:09 2025 +0300

    drm/i915/pch: abstract fake PCH detection better
    
    Abstract detection of platforms with south display on the same PCI
    device or SoC die as north display, and all around clarify what this
    means. Debug log about it for good measure.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch f031245c01c722de43e8a02c2358140de0685428 drm-intel
ade0c637b3ef drm/i915/display: pass struct intel_display to PCH macros
b4ef5761df7b drm/i915/display: drop lots of unnecessary #include i915_drv.h
fd4b9856089e drm/i915/pch: abstract fake PCH detection better


