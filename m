Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D75DC3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 17:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D02A10E9DD;
	Fri, 26 Jul 2024 17:23:59 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B9310E9DD;
 Fri, 26 Jul 2024 17:23:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/migrate=3A_Future-?=
 =?utf-8?q?proof_compressed_PAT_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Jul 2024 17:23:57 -0000
Message-ID: <172201463794.386830.8581456940319356371@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240726171757.2728819-2-matthew.d.roper@intel.com>
In-Reply-To: <20240726171757.2728819-2-matthew.d.roper@intel.com>
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

Series: drm/xe/migrate: Future-proof compressed PAT check
URL   : https://patchwork.freedesktop.org/series/136577/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cd526e57db0e17e267684197250c7aaf0089206c
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Fri Jul 26 10:17:58 2024 -0700

    drm/xe/migrate: Future-proof compressed PAT check
    
    Although all current Xe2 platforms support FlatCCS, we probably
    shouldn't assume that will be universally true forever.  In the past
    we've had platforms like PVC that didn't support compression, and the
    same could show up again at some point in the future.  Future-proof the
    migration code by adding an explicit check for FlatCCS support to the
    condition that decides whether to use a compressed PAT index for
    migration.
    
    While we're at it, we can drop the IS_DGFX check since it's redundant
    with the src_is_vram check (only dGPUs have VRAM).
    
    Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 422ad8b018bb44eb6aec55db31d0881aef32539e drm-intel
cd526e57db0e drm/xe/migrate: Future-proof compressed PAT check


