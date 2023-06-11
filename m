Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25895C77B7A
	for <intel-xe@archiver.kernel.org>; Sun, 11 Jun 2023 22:27:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D654D10E13B;
	Sun, 11 Jun 2023 22:27:44 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7AD3E10E13B;
 Sun, 11 Jun 2023 22:27:43 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 15E15A0BA8;
 Sun, 11 Jun 2023 22:27:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Sun, 11 Jun 2023 22:27:43 -0000
Message-ID: <168652246307.6757.15591543234816546316@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230611222447.2837573-1-lucas.demarchi@intel.com>
In-Reply-To: <20230611222447.2837573-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_series_starting_with_=5B1/5=5D_drm/xe=3A_Rename_pte/pde_enco?=
 =?utf-8?q?ding_functions?=
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

Series: series starting with [1/5] drm/xe: Rename pte/pde encoding functions
URL   : https://patchwork.freedesktop.org/series/119174/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: e24e730ad drm/xe/guc: Read HXG fields from DW1 of G2H response
=== git am output follows ===
Applying: drm/xe: Rename pte/pde encoding functions
Applying: drm/xe/guc: Fix typo s/enabled/enable/
Applying: drm/xe/guc: Normalize error messages with %#x
Applying: drm/xe: Skip applying copy engine fuses
Applying: drm/xe: Fix GMD_ID to revid


