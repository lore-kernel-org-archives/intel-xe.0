Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD9CC7619A
	for <intel-xe@archiver.kernel.org>; Tue, 11 Apr 2023 22:56:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A3F10E00C;
	Tue, 11 Apr 2023 22:56:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6FD7610E00C;
 Tue, 11 Apr 2023 22:56:22 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 670BCAADE6;
 Tue, 11 Apr 2023 22:56:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anusha Srivatsa" <anusha.srivatsa@intel.com>
Date: Tue, 11 Apr 2023 22:56:22 -0000
Message-ID: <168125378238.13173.7385969095843257714@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230411225351.2880126-1-anusha.srivatsa@intel.com>
In-Reply-To: <20230411225351.2880126-1-anusha.srivatsa@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe=3A_Add_Rocketlake_device_info_=28rev3=29?=
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

Series: drm/xe: Add Rocketlake device info (rev3)
URL   : https://patchwork.freedesktop.org/series/116270/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 62e2351e1dedc314e6bdbb90469442f49f850a4b
Author:     Anusha Srivatsa <anusha.srivatsa@intel.com>
AuthorDate: Thu Apr 6 10:58:11 2023 -0700
Commit:     Anusha Srivatsa <anusha.srivatsa@intel.com>
CommitDate: Tue Apr 11 12:42:16 2023 -0700

    drm/xe: GuC and HuC loading support for RKL
    
    Rocketlake uses TGL GuC and HuC
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
=== git am output follows ===
Applying: drm/xe: Add Rocketlake device info


