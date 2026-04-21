Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB56F327B4
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 07:21:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4426110E81F;
	Tue, 21 Apr 2026 07:21:19 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F6310E7D4;
 Tue, 21 Apr 2026 07:21:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_LGCI=2EVerificationFailed=3A_failure_for_PCI/IOV=3A_Fix_?=
 =?utf-8?q?SR-IOV_locking_races_and_AB-BA_deadlock?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ionut Nechita (Wind River)" <ionut.nechita@windriver.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Apr 2026 07:21:18 -0000
Message-ID: <177675607854.480489.10466511725836768625@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1776755661.git.ionut.nechita@windriver.com>
In-Reply-To: <cover.1776755661.git.ionut.nechita@windriver.com>
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

Series: PCI/IOV: Fix SR-IOV locking races and AB-BA deadlock
URL   : https://patchwork.freedesktop.org/series/165217/
State : failure

== Summary ==

Address 'ionut.nechita@windriver.com' is not on the allowlist, which prevents CI from being triggered for this patch.
If you want Intel GFX CI to accept this address, please contact the script maintainers at i915-ci-infra@lists.freedesktop.org.
Exception occurred during validation, bailing out!


