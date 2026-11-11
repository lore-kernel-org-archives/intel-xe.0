Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79E7606A324
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 21:29:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD4D10E493;
	Wed, 11 Nov 2026 21:29:07 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2525810E494;
 Wed, 11 Nov 2026 21:29:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_sysfs_to_di?=
 =?utf-8?q?sable_RPe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Nov 2026 21:29:06 -0000
Message-ID: <179443254614.12079.7845291391395424836@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261111212150.3738637-2-vinay.belgaumkar@intel.com>
In-Reply-To: <20261111212150.3738637-2-vinay.belgaumkar@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/xe: Add sysfs to disable RPe
URL   : https://patchwork.freedesktop.org/series/178352/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b70658b5f0107e6cb819c629c24c2f3ec9af23f1
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Wed Nov 11 13:21:51 2026 -0800

    drm/xe: Add sysfs to disable RPe
    
    When SLPC is initialized, GuC sets the GT min freq to RPe(efficient) by
    default. This frequency is desgined for optimal perf/power ratio. However,
    certain use cases may want to run at lower frequencies. This sysfs allows
    user to disable use of default RPe behavior.
    
    Efficient frequency will now be controlled by this interface alone. Setting
    min_freq < efficient will not affect the flag. Disabling use_rpe will cause
    GuC to bring back min_freq to whatever level it was set before and enabling
    it will bring up the min_Freq to rpe_freq.
    
    $ cat /sys/class/drm/card0/device/tile0/gt1/freq0/use_rpe
    1
    
    Cc: Sk Anirban <sk.anirban@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch 29f974d0092e26a6933ce1d82045f726f85b63ca drm-intel
b70658b5f010 drm/xe: Add sysfs to disable RPe
-:61: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#61: FILE: drivers/gpu/drm/xe/xe_gt_freq.c:276:
+}
+static struct kobj_attribute attr_use_rpe = __ATTR_RW(use_rpe);

total: 0 errors, 0 warnings, 1 checks, 138 lines checked


