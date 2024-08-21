Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6823C52D7C
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 14:03:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8607110E5DB;
	Wed, 21 Aug 2024 14:03:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C6010E5AF;
 Wed, 21 Aug 2024 14:03:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Support_=27nomo?=
 =?utf-8?q?deset=27_kernel_command-line_option?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Aug 2024 14:03:19 -0000
Message-ID: <172424899955.721436.2641202749538005669@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240821135750.102117-1-tzimmermann@suse.de>
In-Reply-To: <20240821135750.102117-1-tzimmermann@suse.de>
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

Series: drm/xe: Support 'nomodeset' kernel command-line option
URL   : https://patchwork.freedesktop.org/series/137576/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit adc8ff073936abe08224c6fc1798a42fc9bb8ce5
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Wed Aug 21 15:56:59 2024 +0200

    drm/xe: Support 'nomodeset' kernel command-line option
    
    Setting 'nomodeset' on the kernel command line disables all graphics
    drivers with modesetting capabilities; leaving only firmware drivers,
    such as simpledrm or efifb.
    
    Most DRM drivers automatically support 'nomodeset' via DRM's module
    helper macros. In xe, which uses regular module_init(), manually call
    drm_firmware_drivers_only() to test for 'nomodeset'. Do not register
    the driver if set.
    
    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
+ /mt/dim checkpatch c83ab549ef8f647c3de42793d222a980021a973f drm-intel
adc8ff073936 drm/xe: Support 'nomodeset' kernel command-line option


