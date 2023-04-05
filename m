Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59776C7618D
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 22:50:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063D010E2F4;
	Wed,  5 Apr 2023 22:50:26 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id A16C010E2F6;
 Wed,  5 Apr 2023 22:50:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8E439A9932;
 Wed,  5 Apr 2023 22:50:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Wed, 05 Apr 2023 22:50:23 -0000
Message-ID: <168073502354.14695.6419263395411543209@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230405224725.1993719-1-lucas.demarchi@intel.com>
In-Reply-To: <20230405224725.1993719-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe=3A_Always_log_GuC/HuC_firmware_versions?=
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

Series: drm/xe: Always log GuC/HuC firmware versions
URL   : https://patchwork.freedesktop.org/series/116170/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 69fe222d7918949d37a95fce4aa834a129789535
Author:     Chang, Bruce <yu.bruce.chang@intel.com>
AuthorDate: Wed Apr 5 17:13:03 2023 +0000
Commit:     Rodrigo Vivi <rodrigo.vivi@intel.com>
CommitDate: Wed Apr 5 13:23:15 2023 -0400

    fixup! drm/xe: fix pvc unload issue
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
=== git am output follows ===
Applying: drm/xe: Always log GuC/HuC firmware versions


