Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B76C021BE
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 03:59:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7E210E300;
	Thu, 27 Feb 2025 03:59:01 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA42810E300;
 Thu, 27 Feb 2025 03:58:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/watermark=3A_Che?=
 =?utf-8?q?ck_bounds_for_scaler=5Fusers_for_dsc_prefill_latency?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Feb 2025 03:58:59 -0000
Message-ID: <174062873969.2561842.10749687179088076854@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250227034106.1638203-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250227034106.1638203-1-ankit.k.nautiyal@intel.com>
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

Series: drm/i915/watermark: Check bounds for scaler_users for dsc prefill latency
URL   : https://patchwork.freedesktop.org/series/145541/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cb4786d12d322a18d0ff65879b3a628481689884
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Thu Feb 27 09:11:06 2025 +0530

    drm/i915/watermark: Check bounds for scaler_users for dsc prefill latency
    
    Currently, during the computation of global watermarks, the latency for
    each scaler user is calculated to compute the DSC prefill latency.
    At this point, the number of scaler users can exceed the number of
    supported scalers, which is checked later in intel_atomic_setup_scalers().
    
    This can cause issues when the number of scaler users exceeds the number
    of supported scalers.
    
    While checking for DSC prefill, ensure that the number of scaler users does
    not exceed the number of supported scalers.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4341
    Fixes: a9b14af999b0 ("drm/i915/dsc: Check if vblank is sufficient for dsc prefill")
    Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
    Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Cc: Jani Nikula <jani.nikula@linux.intel.com>
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 8541a64154cd8b9c07977dedc1d22883f43279a0 drm-intel
cb4786d12d32 drm/i915/watermark: Check bounds for scaler_users for dsc prefill latency


