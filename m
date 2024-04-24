Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72573C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 01:14:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3275B10F89B;
	Wed, 24 Apr 2024 01:14:23 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2379210F89B;
 Wed, 24 Apr 2024 01:14:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_Per_client?=
 =?utf-8?q?_usage_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Apr 2024 01:14:22 -0000
Message-ID: <171392126214.1610190.15928029155126925@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240423235652.1959945-1-lucas.demarchi@intel.com>
In-Reply-To: <20240423235652.1959945-1-lucas.demarchi@intel.com>
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

Series: drm/xe: Per client usage (rev2)
URL   : https://patchwork.freedesktop.org/series/132477/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: b5b592a3902a drm-tip: 2024y-04m-23d-23h-09m-19s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/lrc: Add helper to capture context timestamp
Applying: drm/xe: Add helper to capture engine timestamp
Applying: drm/xe: Add helper to accumulate exec queue runtime
Applying: drm/xe: Promote xe_hw_engine_class_to_str()
Applying: drm/xe: Add XE_ENGINE_CLASS_OTHER to str conversion
Applying: drm/xe/client: Print runtime to fdinfo


