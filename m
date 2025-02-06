Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337B3C02199
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 17:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D6610E8F0;
	Thu,  6 Feb 2025 17:17:56 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E4C10E8F0;
 Thu,  6 Feb 2025 17:17:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_Fix_uninit?=
 =?utf-8?q?ialized_pointer_read_in_xe=5Fvm=5Fbind=5Fkernel=5Fbo?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dheeraj Reddy Jonnalagadda" <dheeraj.linuxdev@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Feb 2025 17:17:55 -0000
Message-ID: <173886227533.2143846.17878275728097270857@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250206134706.60200-1-dheeraj.linuxdev@gmail.com>
In-Reply-To: <20250206134706.60200-1-dheeraj.linuxdev@gmail.com>
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

Series: drm/xe: Fix uninitialized pointer read in xe_vm_bind_kernel_bo
URL   : https://patchwork.freedesktop.org/series/144428/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 68225b9bc1d2 drm-tip: 2025y-02m-06d-16h-45m-09s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Fix uninitialized pointer read in xe_vm_bind_kernel_bo


