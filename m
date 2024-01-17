Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66106C47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 14:57:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C61E10E6B4;
	Wed, 17 Jan 2024 14:57:08 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B4610E6B4;
 Wed, 17 Jan 2024 14:57:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/5=5D_drm/xe=3A_make_xe=5Fttm=5Ffuncs_const?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Wed, 17 Jan 2024 14:57:07 -0000
Message-ID: <170550342727.537517.10446305563253709360@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240117122044.1544174-1-jani.nikula@intel.com>
In-Reply-To: <20240117122044.1544174-1-jani.nikula@intel.com>
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

Series: series starting with [1/5] drm/xe: make xe_ttm_funcs const
URL   : https://patchwork.freedesktop.org/series/128876/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e7635b7ace0009cd982edc0192919ec110422309
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Jan 17 14:20:44 2024 +0200

    drm/xe: constify engine class sysfs attributes
    
    All of the attributes, as well as the array of attributes, can be const
    and placed in rodata.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch b42f47ca5fff1d04fb8eb02d64520b3f338a495d drm-intel
7c6836ba0 drm/xe: make xe_ttm_funcs const
aa7bbf21b drm/xe: make heci_gsc_irq_chip const
3f8b8be6c drm/xe: make hwmon_info const
497943c4a drm/xe: make gpuvm_ops const
e7635b7ac drm/xe: constify engine class sysfs attributes


