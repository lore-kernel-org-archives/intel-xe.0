Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E8AC021B2
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 00:44:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18AC10EA02;
	Fri, 21 Feb 2025 00:44:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DDF10EA02;
 Fri, 21 Feb 2025 00:44:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Stop_accessing_display_TI?=
 =?utf-8?q?MESTAMP=5FOVERRIDE_in_GT_code?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Feb 2025 00:44:54 -0000
Message-ID: <174009869433.329184.17146300933205186176@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250221003843.443559-6-matthew.d.roper@intel.com>
In-Reply-To: <20250221003843.443559-6-matthew.d.roper@intel.com>
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

Series: Stop accessing display TIMESTAMP_OVERRIDE in GT code
URL   : https://patchwork.freedesktop.org/series/145200/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit aa971001a108a2d4e1b53f23314172da6f03eb8d
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Thu Feb 20 16:38:48 2025 -0800

    drm/xe/sriov: Drop TIMESTAMP_OVERRIDE from Xe2 runtime regs
    
    TIMESTAMP_OVERRIDE is never used to initialize the GT clock frequency on
    Xe2 platforms (and the register itself no longer exists on LNL) so drop
    it from the list of runtime registers.
    
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
    Acked-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 2c2b141845ce906e187d4aa4fee06bcd9d517415 drm-intel
63c6000a39b3 drm/i915/display: Make refclk fetching logic reusable
44aae2bd9eb5 drm/i915/gt: Replace TIMESTAMP_OVERRIDE readout
65a197076ed7 drm/xe: Drop usage of TIMESTAMP_OVERRIDE
aa971001a108 drm/xe/sriov: Drop TIMESTAMP_OVERRIDE from Xe2 runtime regs


