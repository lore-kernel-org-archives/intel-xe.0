Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC308C3601E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 13:25:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8686E10E1B0;
	Mon,  7 Apr 2025 13:25:41 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C8810E1B0;
 Mon,  7 Apr 2025 13:25:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5Bi-g-t=2C1/1=5D_drm/xe=3A_xe=5Fhw=5Fengine=5Fclass=3A_Add_faul?=
 =?utf-8?q?t_injection_and_improve_error_handling_in_kobj=5Fxe=5Fhw=5Fengine?=
 =?utf-8?q?=5Fclass_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Apr 2025 13:25:40 -0000
Message-ID: <174403234035.43550.7169118483382546965@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250405065432.2254703-1-sobin.thomas@intel.com>
In-Reply-To: <20250405065432.2254703-1-sobin.thomas@intel.com>
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

Series: series starting with [i-g-t,1/1] drm/xe: xe_hw_engine_class: Add fault injection and improve error handling in kobj_xe_hw_engine_class (rev2)
URL   : https://patchwork.freedesktop.org/series/147289/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 5bb36322dc54 drm-tip: 2025y-04m-07d-13h-09m-13s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: xe_hw_engine_class: Add fault injection and improve error handling in kobj_xe_hw_engine_class


