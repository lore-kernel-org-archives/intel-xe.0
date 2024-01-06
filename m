Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1664FC3DA6E
	for <intel-xe@archiver.kernel.org>; Sat,  6 Jan 2024 00:07:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEFB10E6AB;
	Sat,  6 Jan 2024 00:07:09 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FCE10E076;
 Sat,  6 Jan 2024 00:07:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/device=3A_clean_up?=
 =?utf-8?q?_on_error_in_probe=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dan Carpenter" <dan.carpenter@linaro.org>
Date: Sat, 06 Jan 2024 00:07:08 -0000
Message-ID: <170449962888.40937.2972607376662868448@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <c8984fe2-dc1a-4ba8-97c9-5c83f53a0d09@moroto.mountain>
In-Reply-To: <c8984fe2-dc1a-4ba8-97c9-5c83f53a0d09@moroto.mountain>
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

Series: drm/xe/device: clean up on error in probe()
URL   : https://patchwork.freedesktop.org/series/128272/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 59c3d9d6ee843537683cd311a5eafdacd41dc5fb
Author: Dan Carpenter <dan.carpenter@linaro.org>
Date:   Fri Jan 5 15:22:23 2024 +0300

    drm/xe/device: clean up on error in probe()
    
    This error path should clean up before returning.
    
    Smatch detected this bug:
      drivers/gpu/drm/xe/xe_device.c:487 xe_device_probe() warn: missing unwind goto?
    
    Fixes: 4cb12b71923b ("drm/xe/xe2: Determine bios enablement for flat ccs on igfx")
    Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch cca0607b6f6a21bee68c092ed7ad9f3322e54523 drm-intel
59c3d9d6e drm/xe/device: clean up on error in probe()
-:11: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '4cb12b71923b', maybe rebased or not pulled?
#11: 
Fixes: 4cb12b71923b ("drm/xe/xe2: Determine bios enablement for flat ccs on igfx")

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


