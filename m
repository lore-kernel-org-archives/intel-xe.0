Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A16FC36010
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 05:05:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5755610E00C;
	Mon,  7 Apr 2025 05:05:45 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB0810E00C;
 Mon,  7 Apr 2025 05:05:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Add_configfs_support?=
 =?utf-8?q?_for_survivability_mode_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Apr 2025 05:05:44 -0000
Message-ID: <174400234416.41730.18004432183772360433@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250407051414.1651616-1-riana.tauro@intel.com>
In-Reply-To: <20250407051414.1651616-1-riana.tauro@intel.com>
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

Series: Add configfs support for survivability mode (rev4)
URL   : https://patchwork.freedesktop.org/series/145999/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: c4fc93b0ec49 drm-tip: 2025y-04m-07d-03h-26m-10s UTC integration manifest
=== git am output follows ===
.git/rebase-apply/patch:243: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: drm/xe: Add configfs to enable survivability mode
Applying: drm/xe: Add documentation for survivability mode
Applying: drm/xe: Enable configfs support for survivability mode


