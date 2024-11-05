Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DD3D1CA13
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 00:35:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F30A10E157;
	Tue,  5 Nov 2024 00:35:11 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219AD10E157;
 Tue,  5 Nov 2024 00:35:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe/vf=3A_Post-mi?=
 =?utf-8?q?gration_recovery_worker_basis_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Nov 2024 00:35:09 -0000
Message-ID: <173076690913.1409781.7850500783396154595@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241104213449.1455694-1-tomasz.lis@intel.com>
In-Reply-To: <20241104213449.1455694-1-tomasz.lis@intel.com>
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

Series: drm/xe/vf: Post-migration recovery worker basis (rev6)
URL   : https://patchwork.freedesktop.org/series/138935/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: a4532bcf5eea drm-tip: 2024y-11m-04d-21h-32m-06s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/vf: React to MIGRATED interrupt
Applying: drm/xe/vf: Document SRIOV VF restore flow
Applying: drm/xe/vf: Send RESFIX_DONE message at end of VF restore
Applying: drm/xe/vf: Start post-migration fixups with provisinoning query
Applying: drm/xe/vf: Defer fixups if migrated twice fast


