Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0101EC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 20:26:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BF410E8DC;
	Thu, 11 Jul 2024 20:26:10 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C20610E8DC;
 Thu, 11 Jul 2024 20:26:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?b?4pyTIENJLlBhdGNoX2FwcGxpZWQ6IHN1Y2Nlc3MgZm9yIGRybS94ZTogVXNlIHhl?=
 =?utf-8?b?X3BtX3J1bnRpbWVfZ2V0KCkgaW4geGVfZ2d0dF9yZW1vdmVfbm9kZSgp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Jul 2024 20:26:09 -0000
Message-ID: <172072956917.164910.2660390339798582375@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240711200031.49798-1-jose.souza@intel.com>
In-Reply-To: <20240711200031.49798-1-jose.souza@intel.com>
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

Series: drm/xe: Use xe_pm_runtime_get() in xe_ggtt_remove_node()
URL   : https://patchwork.freedesktop.org/series/136012/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 3ec725ffa5a1 drm-tip: 2024y-07m-11d-18h-37m-03s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Use xe_pm_runtime_get() in xe_ggtt_remove_node()


