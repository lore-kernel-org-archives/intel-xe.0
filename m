Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBFBC44501
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 14:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91E910E6EF;
	Tue, 14 Jul 2026 14:09:30 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D9B10E08D;
 Tue, 14 Jul 2026 14:09:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_LGCI=2EVerificationFailed=3A_failure_for_drm/i915/bios?=
 =?utf-8?q?=3A_Move_a_variable_assignment_behind_a_null_pointer_check_in_int?=
 =?utf-8?q?el=5Fbios=5Fencoder=5Fsupports=5Fdp=5Fdual=5Fmode=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Markus Elfring" <Markus.Elfring@web.de>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 Jul 2026 14:09:29 -0000
Message-ID: <178403816958.188923.5936359305995798139@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <e81277a0-93f8-45e9-9fa4-7c2c2df9c311@web.de>
In-Reply-To: <e81277a0-93f8-45e9-9fa4-7c2c2df9c311@web.de>
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

Series: drm/i915/bios: Move a variable assignment behind a null pointer check in intel_bios_encoder_supports_dp_dual_mode()
URL   : https://patchwork.freedesktop.org/series/170414/
State : failure

== Summary ==

Series author address 'markus.elfring@web.de' is not on the allowlist, which prevents CI from being automatically triggered.
If you want CI to run for this series, ask Patchwork project owners to click 'retest' on the series in Patchwork.
Exception occurred during validation, bailing out!
Build URL: http://intel-gfx-ci-public.igk.intel.com:8080/job/xe_pw_trigger/1215553/ (on master)


