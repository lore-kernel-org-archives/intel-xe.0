Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6D6E7716B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Dec 2024 14:51:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C94A10E292;
	Wed,  4 Dec 2024 14:51:05 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5554C10E292;
 Wed,  4 Dec 2024 14:51:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_remove_driver_date?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Dec 2024 14:51:04 -0000
Message-ID: <173332386434.2532942.6949866473449131505@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1733322525.git.jani.nikula@intel.com>
In-Reply-To: <cover.1733322525.git.jani.nikula@intel.com>
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

Series: drm: remove driver date
URL   : https://patchwork.freedesktop.org/series/142114/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b7272932cc5afd0f16d63b72e3f97018a20a276e
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Dec 4 16:31:12 2024 +0200

    drm: remove driver date from struct drm_driver and all drivers
    
    We stopped using the driver initialized date in commit 7fb8af6798e8
    ("drm: deprecate driver date") and (eventually) started returning "0"
    for drm_version ioctl instead.
    
    Finish the job, and remove the unused date member from struct
    drm_driver, its initialization from drivers, along with the common
    DRIVER_DATE macros.
    
    v2: Also update drivers/accel (kernel test robot)
    
    Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
    Acked-by: Alex Deucher <alexander.deucher@amd.com>
    Acked-by: Simon Ser <contact@emersion.fr>
    Acked-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch c8df5caf278df4f9ca0aba627047c5ee4318fc0d drm-intel
a5d71dd9dab5 drm/xen: remove redundant initialization info print
f62851811e0b accel/ivpu: remove DRIVER_DATE conditional drm_driver init
b7272932cc5a drm: remove driver date from struct drm_driver and all drivers
-:931: WARNING:OBSOLETE: drivers/gpu/drm/tiny/cirrus-qemu.c is marked as 'obsolete' in the MAINTAINERS hierarchy.  No unnecessary modifications please.

-:934: WARNING:OBSOLETE: drivers/gpu/drm/tiny/cirrus-qemu.c is marked as 'obsolete' in the MAINTAINERS hierarchy.  No unnecessary modifications please.

total: 0 errors, 2 warnings, 0 checks, 852 lines checked


