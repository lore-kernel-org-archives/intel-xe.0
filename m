Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B67C25B75
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 10:52:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E673810E650;
	Mon, 13 May 2024 10:52:28 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A5E10E645;
 Mon, 13 May 2024 10:52:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/fbc=3A_Add_?=
 =?utf-8?q?sizes_to_info_message_about_reducing_fb_size?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Paul Menzel" <pmenzel@molgen.mpg.de>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 May 2024 10:52:28 -0000
Message-ID: <171559754856.2094388.8836803698953615201@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240513103652.371721-1-pmenzel@molgen.mpg.de>
In-Reply-To: <20240513103652.371721-1-pmenzel@molgen.mpg.de>
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

Series: drm/i915/fbc: Add sizes to info message about reducing fb size
URL   : https://patchwork.freedesktop.org/series/133532/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 64f1f664cc72 drm-tip: 2024y-05m-13d-10h-34m-22s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/fbc: Add sizes to info message about reducing fb size


