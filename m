Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1486AEE57E7
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 09:26:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD8210E04F;
	Fri,  8 Sep 2023 09:26:39 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5B75810E04F;
 Fri,  8 Sep 2023 09:26:38 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 58A6DAADF2;
 Fri,  8 Sep 2023 09:26:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Fri, 08 Sep 2023 09:26:38 -0000
Message-ID: <169416519835.14897.14517249064619543787@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230908091716.36984-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230908091716.36984-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe=3A_Convert_to_drm=5Fexec_=28rev7=29?=
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

Series: drm/xe: Convert to drm_exec (rev7)
URL   : https://patchwork.freedesktop.org/series/123100/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 758f01ec2 drm/xe: Fix LRC workarounds
=== git am output follows ===
Applying: drm/xe/bo: Simplify xe_bo_lock()
Applying: drm/xe/vm: Simplify and document xe_vm_lock()
Applying: drm/xe/bo: Remove the lock_no_vm()/unlock_no_vm() interface
Applying: drm/xe: Rework xe_exec and the VM rebind worker to use the drm_exec helper
Applying: drm/xe: Convert pagefaulting code to use drm_exec
Applying: drm/xe: Convert remaining instances of ttm_eu_reserve_buffers to drm_exec


