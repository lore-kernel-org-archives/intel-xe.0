Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C3EFC36010
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 19:35:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335A910E2E5;
	Tue,  8 Apr 2025 19:35:11 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D44B10E2E5;
 Tue,  8 Apr 2025 19:35:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Enable_w/a_160265087?=
 =?utf-8?q?08_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "John Harrison" <john.c.harrison@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Apr 2025 19:35:10 -0000
Message-ID: <174414091050.49436.1943615827238631232@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250403185619.1555853-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250403185619.1555853-1-John.C.Harrison@Intel.com>
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

Series: Enable w/a 16026508708 (rev2)
URL   : https://patchwork.freedesktop.org/series/147235/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 195143799963 drm-tip: 2025y-04m-08d-17h-22m-51s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/guc: Enable w/a 16026508708
Applying: Revert "drm/xe/ptl: Define HuC FW version for PTL"
Applying: Revert "drm/xe/ptl: Add GuC firmware definition"
Applying: Revert "drm/xe/pvc: Add GuC firmware definition"
Applying: drm/xe/guc: Bump the recommended GuC version to 70.44.1
Applying: drm/xe/pvc: Add GuC firmware definition
Applying: drm/xe/ptl: Add GuC firmware definition
Applying: drm/xe/ptl: Define HuC FW version for PTL


