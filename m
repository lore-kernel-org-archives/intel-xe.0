Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC28EE57CF
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 20:08:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A563010E9C4;
	Wed, 11 Sep 2024 20:08:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B552C10EA81;
 Wed, 11 Sep 2024 20:08:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5B1/3=5D_drm/xe=3A_Fix_build_by_setting_the_correct_parameter_t?=
 =?utf-8?q?o_intel=5Fdmc=5Fsuspend=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Sep 2024 20:08:35 -0000
Message-ID: <172608531572.987891.11467316150456557525@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240911200218.130219-1-jose.souza@intel.com>
In-Reply-To: <20240911200218.130219-1-jose.souza@intel.com>
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

Series: series starting with [1/3] drm/xe: Fix build by setting the correct parameter to intel_dmc_suspend()
URL   : https://patchwork.freedesktop.org/series/138542/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 16fcff5c446e drm-tip: 2024y-09m-11d-18h-42m-23s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Fix build by setting the correct parameter to intel_dmc_suspend()
Applying: drm/xe: Add a parameter to xe_bb_create_job() to append or not batch buffer end instruction
Applying: drm/xe/oa: Fix overflow in oa batch buffer


