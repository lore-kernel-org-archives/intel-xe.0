Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4F5C36018
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 11:41:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73EF610E164;
	Tue, 17 Sep 2024 11:41:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A976410E211;
 Tue, 17 Sep 2024 11:41:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_memirq_infra_changes?=
 =?utf-8?q?_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ilia Levi" <ilia.levi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Sep 2024 11:41:46 -0000
Message-ID: <172657330668.1021625.16339184602212509887@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240917112307.1242329-1-illevi@habana.ai>
In-Reply-To: <20240917112307.1242329-1-illevi@habana.ai>
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

Series: memirq infra changes (rev6)
URL   : https://patchwork.freedesktop.org/series/137643/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 38e1b615fb39 drm-tip: 2024y-09m-17d-09h-15m-36s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Introduce dedicated config for memirq debug
Applying: drm/xe: Introduce xe_device_uses_memirq()
Applying: drm/xe: move memirq out of VF
Applying: drm/xe: memirq infra changes for MSI-X
Applying: drm/xe: memirq handler changes


