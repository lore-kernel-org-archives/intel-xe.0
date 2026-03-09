Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A52FCA179
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 19:01:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CDC10E5C0;
	Mon,  9 Mar 2026 19:01:11 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FAA10E5C0;
 Mon,  9 Mar 2026 19:01:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_LGCI=2EVerificationFailed=3A_failure_for_PCI/IOV=3A_Make?=
 =?utf-8?q?_pci=5Flock=5Frescan=5Fremove=28=29_reentrant_and_protect_sriov?=
 =?utf-8?q?=5Fadd=5Fvfs/sriov=5Fdel=5Fvfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ionut Nechita (Wind River)" <ionut.nechita@windriver.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Mar 2026 19:01:10 -0000
Message-ID: <177308287040.334410.15426436605088716452@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260306082108.17322-1-ionut.nechita@windriver.com>
In-Reply-To: <20260306082108.17322-1-ionut.nechita@windriver.com>
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

Series: PCI/IOV: Make pci_lock_rescan_remove() reentrant and protect sriov_add_vfs/sriov_del_vfs
URL   : https://patchwork.freedesktop.org/series/162897/
State : failure

== Summary ==

Address 'ionut.nechita@windriver.com' is not on the allowlist, which prevents CI from being triggered for this patch.
If you want Intel GFX CI to accept this address, please contact the script maintainers at i915-ci-infra@lists.freedesktop.org.
Exception occurred during validation, bailing out!


