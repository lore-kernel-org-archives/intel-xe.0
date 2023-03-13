Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3898C6FD19
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 23:13:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F14C10E0B5;
	Mon, 13 Mar 2023 23:13:40 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 651D410E08D;
 Mon, 13 Mar 2023 23:13:39 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5C75FAADD5;
 Mon, 13 Mar 2023 23:13:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anusha Srivatsa" <anusha.srivatsa@intel.com>
Date: Mon, 13 Mar 2023 23:13:39 -0000
Message-ID: <167874921934.1030.2463646647294401111@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230313231120.319346-1-anusha.srivatsa@intel.com>
In-Reply-To: <20230313231120.319346-1-anusha.srivatsa@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe/huc=3A_Load_HuC_on_Alderlake_P_and_Alderlake_S?=
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

Series: drm/xe/huc: Load HuC on Alderlake P and Alderlake S
URL   : https://patchwork.freedesktop.org/series/115085/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 1528d94b95561c4407c65d5ef5754a988eef42dd
Author:     Jani Nikula <jani.nikula@intel.com>
AuthorDate: Thu Mar 9 14:17:46 2023 +0200
Commit:     Lucas De Marchi <lucas.demarchi@intel.com>
CommitDate: Mon Mar 13 13:39:40 2023 -0700

    drm/xe: make compound literal initialization const
    
    Be careful about having const in the compound literal initialization to
    keep the initializers in rodata. Here, the impact is 1.8k of mutable
    data moved to rodata.
    
    add/remove: 0/1 grow/shrink: 0/0 up/down: 0/-1804 (-1804)
    Data                                         old     new   delta
    __compound_literal                          1804       -   -1804
    Total: Before=42425, After=40621, chg -4.25%
    add/remove: 0/0 grow/shrink: 1/0 up/down: 1804/0 (1804)
    RO Data                                      old     new   delta
    __compound_literal                          7696    9500   +1804
    Total: Before=138535, After=140339, chg +1.30%
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Link: https://lore.kernel.org/r/20230309121746.479146-1-jani.nikula@intel.com
=== git am output follows ===
Applying: drm/xe/huc: Load HuC on Alderlake P and Alderlake S


