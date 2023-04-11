Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD04C7619A
	for <intel-xe@archiver.kernel.org>; Tue, 11 Apr 2023 19:32:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D0E10E632;
	Tue, 11 Apr 2023 19:32:29 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9B16110E632;
 Tue, 11 Apr 2023 19:32:27 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 979BFAADDD;
 Tue, 11 Apr 2023 19:32:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anusha Srivatsa" <anusha.srivatsa@intel.com>
Date: Tue, 11 Apr 2023 19:32:27 -0000
Message-ID: <168124154761.13172.7505169254688197619@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230411192403.2864507-1-anusha.srivatsa@intel.com>
In-Reply-To: <20230411192403.2864507-1-anusha.srivatsa@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe=3A_Add_Rocketlake_device_info_=28rev2=29?=
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

Series: drm/xe: Add Rocketlake device info (rev2)
URL   : https://patchwork.freedesktop.org/series/116270/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 695342bb70d907d0f25fd191599b0289e06f5197
Author:     Matt Roper <matthew.d.roper@intel.com>
AuthorDate: Mon Apr 10 11:39:10 2023 -0700
Commit:     Matt Roper <matthew.d.roper@intel.com>
CommitDate: Tue Apr 11 12:01:55 2023 -0700

    drm/xe: Only request PCODE_WRITE_MIN_FREQ_TABLE on LLC platforms
    
    PCODE_WRITE_MIN_FREQ_TABLE is only applicable to platforms with an LLC.
    Change the discrete GPU check to an LLC check instead; this take care of
    skipping not only the discrete platforms, but also integrated platforms
    like MTL that do not have an LLC.
    
    Fixes MTL dmesg error:
    
      xe 0000:00:02.0: [drm] *ERROR* PCODE Mailbox failed: 1 Illegal Command
    
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Link: https://lore.kernel.org/r/20230410183910.2696628-3-matthew.d.roper@intel.com
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
=== git am output follows ===
Applying: drm/xe: Add Rocketlake device info


