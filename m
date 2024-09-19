Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C549ACF3963
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 17:49:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7199C10E73F;
	Thu, 19 Sep 2024 17:49:36 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E1510E741;
 Thu, 19 Sep 2024 17:49:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_PF=3A_Add_functions_?=
 =?utf-8?q?to_save_and_restore_VF_configuration_blob?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Sep 2024 17:49:35 -0000
Message-ID: <172676817535.1047703.8362349556295856754@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240919171528.1451-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240919171528.1451-1-michal.wajdeczko@intel.com>
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

Series: PF: Add functions to save and restore VF configuration blob
URL   : https://patchwork.freedesktop.org/series/138876/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 8fdbcd0d647c drm-tip: 2024y-09m-19d-14h-25m-48s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/guc: Add yet another helper macro for threshold
Applying: drm/xe/pf: Update success code of pf_validate_vf_config()
Applying: drm/xe/pf: Allow to encode subset of VF configuration KLVs
Applying: drm/xe/pf: Add functions to save and restore VF configuration blob
Applying: drm/xe/pf: Allow to save and restore VF config blob from debugfs


