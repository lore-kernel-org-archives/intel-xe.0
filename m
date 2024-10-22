Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD539CDD0EA
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 20:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D0910E1B8;
	Tue, 22 Oct 2024 20:41:47 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA1B10E1B8;
 Tue, 22 Oct 2024 20:41:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe/oa=3A_xe=5Fsy?=
 =?utf-8?q?ncs_for_OA_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Oct 2024 20:41:45 -0000
Message-ID: <172962970590.1311842.13745592731026449729@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241022200352.1192560-1-ashutosh.dixit@intel.com>
In-Reply-To: <20241022200352.1192560-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/oa: xe_syncs for OA (rev7)
URL   : https://patchwork.freedesktop.org/series/137058/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 8a7ac0227c7c drm-tip: 2024y-10m-22d-18h-38m-04s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/oa: Separate batch submission from waiting for completion
Applying: drm/xe/oa/uapi: Define and parse OA sync properties
Applying: drm/xe/oa: Add input fence dependencies
Applying: drm/xe/oa: Signal output fences
Applying: drm/xe/oa: Move functions up so they can be reused for config ioctl
Applying: drm/xe/oa: Add syncs support to OA config ioctl
Applying: drm/xe/oa: Allow only certain property changes from config


