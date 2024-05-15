Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166A4C25B79
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 17:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDF810E2F2;
	Wed, 15 May 2024 17:12:02 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD3B10E1BE;
 Wed, 15 May 2024 17:12:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_add_mmio_d?=
 =?utf-8?q?ebugfs_file_=26_restore_xe=5Fmmio=5Fioctl_as_its_ioctl_handler_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Koby Elbaz" <kelbaz@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 May 2024 17:12:01 -0000
Message-ID: <171579312177.2118792.9971780998176335829@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240515165244.156194-1-kelbaz@habana.ai>
In-Reply-To: <20240515165244.156194-1-kelbaz@habana.ai>
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

Series: drm/xe: add mmio debugfs file & restore xe_mmio_ioctl as its ioctl handler (rev2)
URL   : https://patchwork.freedesktop.org/series/133505/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 26a52a7b24c1 drm-tip: 2024y-05m-15d-16h-30m-40s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: add mmio debugfs file & restore xe_mmio_ioctl as its ioctl handler


