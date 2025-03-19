Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B72C35FFA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Mar 2025 11:37:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1163810E30C;
	Wed, 19 Mar 2025 11:37:05 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C3610E327;
 Wed, 19 Mar 2025 11:37:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Expose_modifiers/formats_?=
 =?utf-8?q?supported_by_async_flips_=28rev11=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Mar 2025 11:37:03 -0000
Message-ID: <174238422394.53429.7203762331202604589@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250319-asyn-v9-0-629d1ece63e7@intel.com>
In-Reply-To: <20250319-asyn-v9-0-629d1ece63e7@intel.com>
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

Series: Expose modifiers/formats supported by async flips (rev11)
URL   : https://patchwork.freedesktop.org/series/140934/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://github.com/intel-lgci-fdo-gitlab-mirror/drm.maintainer-tools mt
Cloning into 'mt'...
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9f9f6c7134768294f858e17ad2e4e619b536cff1
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Wed Mar 19 16:02:17 2025 +0530

    drm/i915/display: Add i915 hook for format_mod_supported_async
    
    Hook up the newly added plane function pointer
    format_mod_supported_async to populate the modifiers/formats supported
    by asynchronous flips.
    
    v5: Correct the if condition for modifier support check (Chaitanya)
    v6: Replace uint32_t/uint64_t with u32/u64 (Jani)
    v7: Move plannar check from intel_async_flip_check_hw() to
    intel_plane_format_mod_supported_async() (Ville)
    v8: In case of error print format/modifier (Chaitanya)
    v9: Exclude C8 format as its not supported by hardware
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch a958e31a81b3267201c85b6f171419586afa792c drm-intel
932d63f90280 drm/plane: Add new plane property IN_FORMATS_ASYNC
83a9e243c37b drm/plane: modify create_in_formats to accommodate async
9f9f6c713476 drm/i915/display: Add i915 hook for format_mod_supported_async


