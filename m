Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7115BC74A5B
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 20:25:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C4610E47F;
	Thu, 23 Mar 2023 20:25:35 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id C457510E11B;
 Thu, 23 Mar 2023 20:25:33 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B419FAADE0;
 Thu, 23 Mar 2023 20:25:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chang, Bruce" <yu.bruce.chang@intel.com>
Date: Thu, 23 Mar 2023 20:25:33 -0000
Message-ID: <167960313370.6628.6798304896194365673@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230323202313.3523-1-yu.bruce.chang@intel.com>
In-Reply-To: <20230323202313.3523-1-yu.bruce.chang@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe=3A_don=27t_auto_fall_back_to_execlist_mode_if_guc_fai?=
 =?utf-8?q?led_to_init?=
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

Series: drm/xe: don't auto fall back to execlist mode if guc failed to init
URL   : https://patchwork.freedesktop.org/series/115563/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 21bbdbcf689f156e9f9cdcdf64a4325ef4a81dc2
Author:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
AuthorDate: Thu Mar 23 09:47:46 2023 +0100
Commit:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CommitDate: Thu Mar 23 13:06:31 2023 +0100

    drm/xe: Rename intel_de.h to xe_de.h
    
    Rename intel_de.h to xe_de.h in order to remove #include_next,
    and change the ifdef guard to be the same as the rest of xe headers.
    
    This is consistent with the other files that are inside xe/display,
    and implement xe specific behavior.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    [mlankhorst: Remove BUILD_FOR_XE too]
    Acked-by: Jani Nikula <jani.nikula@linux.intel.com>
=== git am output follows ===
Applying: drm/xe: don't auto fall back to execlist mode if guc failed to init


