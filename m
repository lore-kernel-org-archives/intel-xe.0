Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BC1C6FD19
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 16:28:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594BE10E5B1;
	Mon, 13 Mar 2023 16:28:18 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id C218D10E5B1;
 Mon, 13 Mar 2023 16:28:16 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id EDF77A0169;
 Mon, 13 Mar 2023 16:28:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Mon, 13 Mar 2023 16:28:15 -0000
Message-ID: <167872489550.1030.4009313554216761138@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230309122133.486044-1-jani.nikula@intel.com>
In-Reply-To: <20230309122133.486044-1-jani.nikula@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe/irq=3A_the_irq_handler_local_variable_need_not_be_sta?=
 =?utf-8?q?tic?=
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

Series: drm/xe/irq: the irq handler local variable need not be static
URL   : https://patchwork.freedesktop.org/series/114906/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 91440895e3fe91928c6e8a682e87d2b8ca677d82
Author:     Lucas De Marchi <lucas.demarchi@intel.com>
AuthorDate: Wed Mar 1 01:31:12 2023 -0800
Commit:     Lucas De Marchi <lucas.demarchi@intel.com>
CommitDate: Fri Mar 10 13:52:30 2023 -0800

    drm/xe/pvc: Remove A* steppings
    
    The PVC pre-production A* steppings are not going to be supported in xe
    driver - the steppings are important for the WAs and since we are not
    adding the pre-productions ones, there is no need to add the stepping.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
=== git am output follows ===
Applying: drm/xe/irq: the irq handler local variable need not be static


