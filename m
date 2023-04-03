Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603EEC76196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 22:31:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C83B10E5A3;
	Mon,  3 Apr 2023 22:31:26 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id E7E0A10E1A3;
 Mon,  3 Apr 2023 22:31:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8E1B6A882E;
 Mon,  3 Apr 2023 22:31:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chang, Bruce" <yu.bruce.chang@intel.com>
Date: Mon, 03 Apr 2023 22:31:23 -0000
Message-ID: <168056108354.24310.6770401092172816041@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230403222031.4255-1-yu.bruce.chang@intel.com>
In-Reply-To: <20230403222031.4255-1-yu.bruce.chang@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe=3A_fix_pvc_unload_issue_=28rev2=29?=
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

Series: drm/xe: fix pvc unload issue (rev2)
URL   : https://patchwork.freedesktop.org/series/115881/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 63b79d536e96e045be4f6c63947c7d42e8dbf600
Author:     Lucas De Marchi <lucas.demarchi@intel.com>
AuthorDate: Fri Mar 31 16:09:02 2023 -0700
Commit:     Lucas De Marchi <lucas.demarchi@intel.com>
CommitDate: Mon Apr 3 13:41:08 2023 -0700

    drm/xe: Fix platform order
    
    Platform order in enum xe_platform started to be used by some parts of
    the code, like the GuC/HuC firmware loading logic. The order itself is
    not very important, but it's better to follow a convention: as was
    documented in the comment above the enum, reorder the platforms by
    graphics version. While at it, remove the gen terminology.
    
    v2:
      - Use "graphics version" instead of chronological order (Matt Roper)
      - Also change pciidlist to follow the same order
      - Remove "gen" from comments around enum xe_platform
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Link: https://lore.kernel.org/r/20230331230902.1603294-1-lucas.demarchi@intel.com
=== git am output follows ===
Applying: drm/xe: fix pvc unload issue


