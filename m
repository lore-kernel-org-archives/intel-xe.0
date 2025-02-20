Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927D6C021AD
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 07:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC6F10E0AD;
	Thu, 20 Feb 2025 07:26:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA1B10E0AD;
 Thu, 20 Feb 2025 07:26:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Introduce_drm_sharpn?=
 =?utf-8?q?ess_property_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Feb 2025 07:26:56 -0000
Message-ID: <174003641671.126275.13251988180527057113@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250219115359.2320992-1-nemesa.garg@intel.com>
In-Reply-To: <20250219115359.2320992-1-nemesa.garg@intel.com>
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

Series: Introduce drm sharpness property (rev9)
URL   : https://patchwork.freedesktop.org/series/139954/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: e19eb43c8248 drm-tip: 2025y-02m-19d-19h-43m-10s UTC integration manifest
=== git am output follows ===
.git/rebase-apply/patch:232: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: drm: Introduce sharpness strength property
Applying: drm/i915/display: Compute the scaler filter coefficients
Applying: drm/i915/display: Enable the second scaler
Applying: drm/i915/display: Configure the second scaler for sharpness
Applying: drm/i915/display: Add registers and compute the strength
Applying: drm/i915/display: Load the lut values and enable sharpness


