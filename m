Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7B2C52D7C
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 16:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D44110E9A2;
	Fri,  9 Aug 2024 16:57:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC44E10E9A2;
 Fri,  9 Aug 2024 16:57:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_PF=3A_Improve_VF_con?=
 =?utf-8?q?trol?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Aug 2024 16:57:40 -0000
Message-ID: <172322266069.552689.17040269180412728850@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240809165159.662-1-michal.wajdeczko@intel.com>
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

Series: PF: Improve VF control
URL   : https://patchwork.freedesktop.org/series/137095/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: fecad563ec6f drm-tip: 2024y-08m-09d-16h-02m-57s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/pf: Add function to sanitize VF resources
Applying: drm/xe/pf: Fix documentation formatting
Applying: drm/xe/pf: Drop GuC notifications for non-existing VF
Applying: drm/xe/pf: Improve VF control
Applying: drm/xe/tests: Allow deferred function call during KUnit test
Applying: drm/xe/tests: Add helper macro to detect if KUnit is running
Applying: drm/xe/tests: Add helpers to call stubs out of KUnit context
Applying: drm/xe/guc: Define stub for xe_guc_ct_send_recv()
Applying: drm/xe/pf: Define stub for pf_sanitize_vf_resources()
Applying: drm/xe/pf: Define stub for pf_send_vf_control_cmd()
Applying: drm/xe/tests: Add KUnit tests for VF control state machines
Applying: drm/xe/tests: Add KUnit tests for VF control GuC messages


