Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1056C3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 13:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E2510E64E;
	Wed, 14 May 2025 13:46:06 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7D110E64E;
 Wed, 14 May 2025 13:46:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe/display=3A_Move_dpt_allocation_to_helper?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 May 2025 13:46:04 -0000
Message-ID: <174723036497.78050.5780311059897270392@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250513141445.79158-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20250513141445.79158-1-juhapekka.heikkila@gmail.com>
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

Series: series starting with [1/2] drm/xe/display: Move dpt allocation to helper
URL   : https://patchwork.freedesktop.org/series/148965/
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
commit 0066db980467d240b7642aff529d843d9e7c1a76
Author: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date:   Tue May 13 17:14:45 2025 +0300

    drm/xe/display: Unify display page table mapping
    
    Unify writing of remapped and straight DPTs. Take out writing of
    rotated DPT since Xe doesn't support any platform that does
    90 degree rotated framebuffers.
    
    Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch 4adcfc37a7c7d9143fc977b92bc9a80b81d53705 drm-intel
ae99375a107a drm/xe/display: Move dpt allocation to helper
0066db980467 drm/xe/display: Unify display page table mapping


