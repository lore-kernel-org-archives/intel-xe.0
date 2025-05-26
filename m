Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65458C5AD49
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 22:54:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6B010E156;
	Mon, 26 May 2025 22:54:32 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F8A10E156;
 Mon, 26 May 2025 22:54:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_Indicate_whic?=
 =?utf-8?q?h_pipe_lied_about_its_interrupts?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 May 2025 22:54:30 -0000
Message-ID: <174830007093.21444.4784720088868581001@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250513092820.18715-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250513092820.18715-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Indicate which pipe lied about its interrupts
URL   : https://patchwork.freedesktop.org/series/148950/
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
commit 8c8311b938222e4eb7127d0ee56282750b5c1187
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Tue May 13 12:28:20 2025 +0300

    drm/i915: Indicate which pipe lied about its interrupts
    
    Indicate which pipe signalled the spurious DE PIPE interrupt.
    Might help with debugging a bit if we know where the interrupt
    is supposedly coming from.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 3e019cc3eaffcb7022b9de66871eabdefd6e06ff drm-intel
8c8311b93822 drm/i915: Indicate which pipe lied about its interrupts


