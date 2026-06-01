Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7D7CD6E55
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 15:24:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15C01134B4;
	Mon,  1 Jun 2026 15:24:16 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E991134B1;
 Mon,  1 Jun 2026 15:24:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_LGCI=2EVerificationFailed=3A_failure_for_drm/i915/audio?=
 =?utf-8?q?=3A_use_generic=5Fhandle=5Firq=5Fsafe=28=29_for_LPE_audio_irq?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Runyu Xiao" <runyu.xiao@seu.edu.cn>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Jun 2026 15:24:15 -0000
Message-ID: <178032745559.32237.9129202729438952419@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260528154551.3708290-1-runyu.xiao@seu.edu.cn>
In-Reply-To: <20260528154551.3708290-1-runyu.xiao@seu.edu.cn>
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

Series: drm/i915/audio: use generic_handle_irq_safe() for LPE audio irq
URL   : https://patchwork.freedesktop.org/series/167670/
State : failure

== Summary ==

Address 'runyu.xiao@seu.edu.cn' is not on the allowlist, which prevents CI from being triggered for this patch.
If you want Intel GFX CI to accept this address, please contact the script maintainers at i915-ci-infra@lists.freedesktop.org.
Exception occurred during validation, bailing out!
Build URL: http://intel-gfx-ci-public.igk.intel.com:8080/job/xe_pw_trigger/1177061/ (on master)


