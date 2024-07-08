Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A29C3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 20:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C875710E3FC;
	Mon,  8 Jul 2024 20:26:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E7410E3FC;
 Mon,  8 Jul 2024 20:26:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Have_xe=5Fvm_and_xe?=
 =?utf-8?q?=5Fexec=5Fqueue_take_references_to_xef?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Jul 2024 20:26:53 -0000
Message-ID: <172047041378.67898.9389469426061759716@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
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

Series: Have xe_vm and xe_exec_queue take references to xef
URL   : https://patchwork.freedesktop.org/series/135865/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 1b010bec39a5 drm-tip: 2024y-07m-08d-15h-26m-33s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Move part of xe_file cleanup to a helper
Applying: drm/xe: Add ref counting for xe_file
Applying: drm/xe: Take a reference to xe file when user creates exec_queue
Applying: drm/xe: Take a ref to xe file when user creates a VM
Applying: Revert "drm/xe: Do not access xe file when updating exec queue run_ticks"


