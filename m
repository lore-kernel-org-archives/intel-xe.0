Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BC0C5B543
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 07:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0995910E475;
	Tue, 10 Jun 2025 07:10:08 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE44310E475;
 Tue, 10 Jun 2025 07:10:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_Make_struc?=
 =?utf-8?q?t_xe=5Fggtt_private=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Jun 2025 07:10:06 -0000
Message-ID: <174953940690.62602.5112521331110302538@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250610070241.875636-1-dev@lankhorst.se>
In-Reply-To: <20250610070241.875636-1-dev@lankhorst.se>
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

Series: drm/xe: Make struct xe_ggtt private. (rev2)
URL   : https://patchwork.freedesktop.org/series/139778/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 52ecbb6a6878 drm-tip: 2025y-06m-09d-17h-17m-28s UTC integration manifest
=== git am output follows ===
Applying: drm/mm: Introduce address space shifting
Applying: drm/xe: Start using ggtt->start in preparation of balloon removal
Applying: drm/xe: Rewrite GGTT VF initialisation
Applying: drm/xe: Convert xe_fb_pin to use a callback for insertion into GGTT
Applying: drm/xe: Move struct xe_ggtt to xe_ggtt.c


