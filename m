Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB02D0BB7A
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 09:08:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD01D10E8B7;
	Thu, 24 Oct 2024 09:08:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4647710E8B7;
 Thu, 24 Oct 2024 09:08:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe/ufence=3A_Flu?=
 =?utf-8?q?sh_xe_ordered=5Fwq_in_case_of_ufence_timeout?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Oct 2024 09:08:58 -0000
Message-ID: <172976093828.1325975.16819334384551067863@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023155817.3618388-1-nirmoy.das@intel.com>
In-Reply-To: <20241023155817.3618388-1-nirmoy.das@intel.com>
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

Series: drm/xe/ufence: Flush xe ordered_wq in case of ufence timeout
URL   : https://patchwork.freedesktop.org/series/140386/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 3d45ea06af2c drm-tip: 2024y-10m-23d-20h-32m-35s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/ufence: Flush xe ordered_wq in case of ufence timeout


