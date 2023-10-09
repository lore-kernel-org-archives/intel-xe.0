Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E7FE95A8E
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 06:18:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01E410E0B9;
	Mon,  9 Oct 2023 06:18:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id BF95A10E0B9;
 Mon,  9 Oct 2023 06:18:34 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B8BF5AA3D8;
 Mon,  9 Oct 2023 06:18:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Date: Mon, 09 Oct 2023 06:18:34 -0000
Message-ID: <169683231470.24834.14491066864272527635@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231009062209.4009360-1-riana.tauro@intel.com>
In-Reply-To: <20231009062209.4009360-1-riana.tauro@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_RFC_drm/xe=3A_Add_mem=5Faccess=5Fget_in_gem=5Fcreate=5Fioctl?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: RFC drm/xe: Add mem_access_get in gem_create_ioctl
URL   : https://patchwork.freedesktop.org/series/124798/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 3c4a322ad drm/xe: Add missing ADL entries to xe_test_wa
=== git am output follows ===
Applying: RFC drm/xe: Add mem_access_get in gem_create_ioctl


