Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAD8C35FFC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 12:42:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321DA10E574;
	Tue, 25 Mar 2025 12:42:51 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9B110E573;
 Tue, 25 Mar 2025 12:42:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_dpll=2C_ddi?=
 =?utf-8?q?=2C_crc=2C_psr_etc_conversions_to_struct_intel=5Fdisplay?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Mar 2025 12:42:49 -0000
Message-ID: <174290656949.888.13273673002311137448@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <cover.1742906146.git.jani.nikula@intel.com>
In-Reply-To: <cover.1742906146.git.jani.nikula@intel.com>
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

Series: drm/i915: dpll, ddi, crc, psr etc conversions to struct intel_display
URL   : https://patchwork.freedesktop.org/series/146729/
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
commit e8dfd7f418f7fe2e36422ee8bc6f41bb8bcfaea7
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Mar 25 14:36:38 2025 +0200

    drm/i915/display: drop some unnecessary intel_de_* compatibility wrappers
    
    intel_de_wait_for_set(), intel_de_wait_for_clear(), intel_de_read_fw(),
    and intel_de_write_fw() are only passed struct intel_display. Remove the
    unnecessary compatibility wrappers.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 3184acdb71d9b0b23a0876f3bc0aaf9e471b88cc drm-intel
45563a9b8e15 drm/i915/dpll: convert intel_dpll.[ch] to struct intel_display
be281f4edc4b drm/i915/ddi: convert intel_ddi.c to struct intel_display
cea1045d3566 drm/i915/crc: convert intel_pipe_crc.c to struct intel_display
351255fe16f2 drm/i915/psr: further conversions to struct intel_display
33db5184cfdf drm/i915/wa: convert intel_display_wa.[ch] to struct intel_display
e8dfd7f418f7 drm/i915/display: drop some unnecessary intel_de_* compatibility wrappers


