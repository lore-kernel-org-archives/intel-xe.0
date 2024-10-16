Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C2FD1AD53
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 12:43:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFD610E6BA;
	Wed, 16 Oct 2024 12:43:03 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1E510E6BA;
 Wed, 16 Oct 2024 12:43:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_PF=3A_Add_functions_?=
 =?utf-8?q?to_save_and_restore_VF_LMEM_and_CCS_data?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Oct 2024 12:43:02 -0000
Message-ID: <172908258250.1273834.15223623845933638634@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241016095745.7477-1-lukasz.laguna@intel.com>
In-Reply-To: <20241016095745.7477-1-lukasz.laguna@intel.com>
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

Series: PF: Add functions to save and restore VF LMEM and CCS data
URL   : https://patchwork.freedesktop.org/series/140050/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 12e4970af1ec drm-tip: 2024y-10m-16d-08h-19m-29s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/migrate: Add function for raw copy of VRAM and CCS
Applying: drm/xe/bo: Add trylock helper for buffer objects
Applying: drm/xe/pf: Add functions to save and restore VF LMEM and CCS data


