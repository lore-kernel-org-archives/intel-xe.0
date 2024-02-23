Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A26C54798
	for <intel-xe@archiver.kernel.org>; Fri, 23 Feb 2024 17:15:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0820910E0B1;
	Fri, 23 Feb 2024 17:15:34 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCC710E0BD;
 Fri, 23 Feb 2024 17:15:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_Save_?=
 =?utf-8?q?a_few_bytes_of_memory_in_intel=5Fbacklight=5Fdevice=5Fregister=28?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Christophe JAILLET" <christophe.jaillet@wanadoo.fr>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Feb 2024 17:15:33 -0000
Message-ID: <170870853305.264199.18223230840104189338@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <ecfdb3af5005e05131e2fb93fd870830f39a8c29.1708708142.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <ecfdb3af5005e05131e2fb93fd870830f39a8c29.1708708142.git.christophe.jaillet@wanadoo.fr>
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

Series: drm/i915/display: Save a few bytes of memory in intel_backlight_device_register()
URL   : https://patchwork.freedesktop.org/series/130317/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cd62896504543deb288c1d649eed56308dbcfb80
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit aa6394ec2209e98e1716269ddd3bcb840241134a
Author: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date:   Fri Feb 23 18:09:28 2024 +0100

    drm/i915/display: Save a few bytes of memory in intel_backlight_device_register()
    
    'name' may still be "intel_backlight" when backlight_device_register() is
    called.
    In such a case, using kstrdup_const() saves a memory duplication when
    dev_set_name() is called in backlight_device_register().
    
    Use kfree_const() accordingly.
    
    Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
+ /mt/dim checkpatch aed3f498154b240f09098da53b8fd5639ee54ecf drm-intel
aa6394ec2209 drm/i915/display: Save a few bytes of memory in intel_backlight_device_register()


