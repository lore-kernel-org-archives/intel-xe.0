Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05422EB64DD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 22:14:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51B210E19A;
	Tue, 25 Jul 2023 22:14:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id E48F910E19A;
 Tue, 25 Jul 2023 22:14:22 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DA73FA47E9;
 Tue, 25 Jul 2023 22:14:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Tue, 25 Jul 2023 22:14:22 -0000
Message-ID: <169032326286.27664.5347067616179955066@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230725221159.354618-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230725221159.354618-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_series_starting_with_=5B1/5=5D_drm/xe=3A_Only_set_PCI_d3cold?=
 =?utf-8?q?=5Fallowed_when_we_are_really_allowing=2E?=
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

Series: series starting with [1/5] drm/xe: Only set PCI d3cold_allowed when we are really allowing.
URL   : https://patchwork.freedesktop.org/series/121336/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 3eb59fdaf drm/xe: Invert guc vs execlists parameters and info.
=== git am output follows ===
Applying: drm/xe: Only set PCI d3cold_allowed when we are really allowing.
Applying: drm/xe: Move d3cold_allowed decision all together.
Applying: drm/xe: Fix the runtime_idle call and d3cold.allowed decision.
Applying: drm/xe: Only init runtime PM after all d3cold config is in place.
Applying: drm/xe: Ensure memory eviction on s2idle.


