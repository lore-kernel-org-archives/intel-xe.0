Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE8EC36002
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 16:17:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3328310E7F8;
	Fri, 21 Mar 2025 16:17:33 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DD810E7F8;
 Fri, 21 Mar 2025 16:17:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Introduce_drm_sharpn?=
 =?utf-8?q?ess_property_=28rev11=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Mar 2025 16:17:32 -0000
Message-ID: <174257385208.65466.12478422894887109793@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250321160628.2663912-1-nemesa.garg@intel.com>
In-Reply-To: <20250321160628.2663912-1-nemesa.garg@intel.com>
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

Series: Introduce drm sharpness property (rev11)
URL   : https://patchwork.freedesktop.org/series/139954/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 8eb742743bae drm-tip: 2025y-03m-21d-16h-07m-36s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/display: Introduce sharpness strength property
Applying: drm/i915/display: Introduce HAS_CASF for sharpness support
Applying: drm/i915/display: Add sharpness strength and winsize
Applying: drm/i915/display: Add filter lut values
Applying: drm/i915/display: Compute the scaler filter
Applying: drm/i915/display: Add and compute scaler parameter
Applying: drm/i915/display: Configure the second scaler for
Applying: drm/i915/display: Compare the sharpness state
Applying: drm/i915/display: Set a scaler mode
Applying: drm/i915/display: Write and read back the casf registers
Applying: drm/i915/display: Enable/disable casf
Applying: drm/i915/display: Expose sharpness strength property


