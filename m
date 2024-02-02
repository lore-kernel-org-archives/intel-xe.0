Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618F6C4828F
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 20:06:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2E210E2D1;
	Fri,  2 Feb 2024 20:06:12 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09C910E2D1;
 Fri,  2 Feb 2024 20:06:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Update_to_GuC_70=2E1?=
 =?utf-8?q?9=2E2_and_add_LNL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 Feb 2024 20:06:10 -0000
Message-ID: <170690437085.953177.983491499992965289@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240202200017.2133438-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240202200017.2133438-1-John.C.Harrison@Intel.com>
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

Series: Update to GuC 70.19.2 and add LNL
URL   : https://patchwork.freedesktop.org/series/129483/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 1dd924675 drm-tip: 2024y-02m-02d-09h-32m-15s UTC integration manifest
=== git am output follows ===
Applying: Revert "drm/xe/guc: define LNL FW"
Applying: Revert "drm/xe/guc: define PVC FW"
Applying: drm/xe/uc: Include patch version in expectations
Applying: drm/xe/guc: Update to GuC firmware 70.19.2
Applying: drm/xe/guc: Add support for LNL firmware
Applying: drm/xe/guc: define PVC FW


