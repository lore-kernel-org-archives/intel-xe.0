Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDB0C6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 11:10:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5982810ECA0;
	Thu, 16 Mar 2023 11:10:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0221010E09E;
 Thu, 16 Mar 2023 11:10:39 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id ED6F6AADF1;
 Thu, 16 Mar 2023 11:10:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Date: Thu, 16 Mar 2023 11:10:38 -0000
Message-ID: <167896503896.19094.8634441245801853644@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230316110752.129831-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230316110752.129831-1-maarten.lankhorst@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe=3A_Fix_Alderlake-P_and_DG2_display_info?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Fix Alderlake-P and DG2 display info
URL   : https://patchwork.freedesktop.org/series/115255/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 8f6c3eaf3f9daab25b31e80c8ba277877fd10547
Author:     Mauro Carvalho Chehab <mchehab@kernel.org>
AuthorDate: Fri Mar 10 09:13:39 2023 +0100
Commit:     Lucas De Marchi <lucas.demarchi@intel.com>
CommitDate: Wed Mar 15 10:28:56 2023 -0700

    drm/xe/xe_uc_fw: Use firmware files from standard locations
    
    The GuC/HuC firmware files used by Xe drivers are the same as
    used by i915. Use the already-known location to find those
    firmware files, for a couple of reasons:
    
    1. Avoid having the same firmware placed on two different
       places on MODULE_FIRMWARE(), if both 915 and xe drivers
       are compiled;
    
    2. Having firmware files located on different locations may end
       creating bigger initramfs, as the same files will be copied
       twice my mkinitrd/dracut/...;
    
    3. this is the place where those firmware files are located at
       https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
       Upstream doesn't expect them to have on other places;
    
    4. When built with display support, DMC firmware will be
       loaded from i915/ directory. It is very confusing to have
       some firmware files on a different place for the same driver.
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Lucas de Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
    Cc: Daniel Vetter <daniel@ffwll.ch>
    Cc: David Airlie <airlied@gmail.com>
    Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
    [ Mostly agree with the direction of "use the firmware blobs from
      upstream at their current location for these platforms". Previous
      directory was not wrong as the plan was to have it handled in the
      upstream firmware repo. For future platforms the location can be
      changed if the support is only in xe ]
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Link: https://lore.kernel.org/r/20230310081338.3275583-1-mauro.chehab@linux.intel.com
=== git am output follows ===
Applying: drm/xe: Fix Alderlake-P and DG2 display info


