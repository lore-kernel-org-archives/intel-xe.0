Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07100C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 13:45:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD78010EA9B;
	Tue, 21 May 2024 13:45:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CFD10EA9B;
 Tue, 21 May 2024 13:45:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Enable_Coarse_Power_Gatin?=
 =?utf-8?q?g_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 May 2024 13:45:48 -0000
Message-ID: <171629914889.2162156.18344265232988938820@8e613ede5ea5>
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

Series: Enable Coarse Power Gating (rev3)
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
commit d6eb583ecdc434ebd15d0b953dec61b56b8fc449
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
+ /mt/dim checkpatch 7c4d1980713a2d03270ae9c5e9650337d9882552 drm-intel
37b48e912e6d drm/xe: Standardize power gate registers
d6eb583ecdc4 drm/xe: Enable Coarse Power Gating


