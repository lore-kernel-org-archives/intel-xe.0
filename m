Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4725C25B75
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 09:15:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B60110E563;
	Tue, 21 May 2024 09:15:58 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA4A10E563;
 Tue, 21 May 2024 09:15:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Enable_Coarse_Power_Gatin?=
 =?utf-8?q?g_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 May 2024 09:15:56 -0000
Message-ID: <171628295618.2162156.10129281943763898855@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240521092201.4183305-1-riana.tauro@intel.com>
In-Reply-To: <20240521092201.4183305-1-riana.tauro@intel.com>
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

Series: Enable Coarse Power Gating (rev2)
URL   : https://patchwork.freedesktop.org/series/133582/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
57b97a66dd129aea93991dc66cd10477f7a05cf8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fc97353abbedcd737f9d8055d02286150c7fd44e
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Tue May 21 14:52:01 2024 +0530

    drm/xe: Enable Coarse Power Gating
    
    Enable power gating for all units and sub-pipes that
    are disabled by default.
    
    v2: change the init function name
        use symmetric calls for enable/disable pg
        re-pharase commit message (Rodrigo)
        modify the sub-pipe power gating condition
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 362550fd170e1450157834793cf333b521d96133 drm-intel
9536cc800d66 drm/xe: Standardize power gate registers
fc97353abbed drm/xe: Enable Coarse Power Gating


