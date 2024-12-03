Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F7EE74AC8
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 19:04:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD5A10E163;
	Tue,  3 Dec 2024 19:04:08 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B432110E163;
 Tue,  3 Dec 2024 19:04:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Maintenence_of_devco?=
 =?utf-8?q?redump_=3C-=3E_GuC-Err-Capture_plumbing_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Dec 2024 19:04:06 -0000
Message-ID: <173325264673.2095566.16798608160729464117@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241203174732.3232351-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20241203174732.3232351-1-alan.previn.teres.alexis@intel.com>
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

Series: Maintenence of devcoredump <-> GuC-Err-Capture plumbing (rev3)
URL   : https://patchwork.freedesktop.org/series/141459/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: e46e8fdd83bc drm-tip: 2024y-12m-03d-17h-02m-40s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/guc/capture: Maintenence of devcoredump <-> GuC-Err-Capture plumbing


