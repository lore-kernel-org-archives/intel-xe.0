Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8B8C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 09:58:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953E910E1A4;
	Tue, 21 May 2024 09:58:24 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C86810E1A4;
 Tue, 21 May 2024 09:58:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Custom_GuC_initialization?=
 =?utf-8?q?_if_VF_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 May 2024 09:58:23 -0000
Message-ID: <171628550305.2162685.10232748379280030521@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240521092518.624-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240521092518.624-1-michal.wajdeczko@intel.com>
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

Series: Custom GuC initialization if VF (rev2)
URL   : https://patchwork.freedesktop.org/series/133832/
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
commit 5ac6d1242f7444a350a2bf52f350b9a5f8085632
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue May 21 11:25:18 2024 +0200

    drm/xe/vf: Custom GuC initialization if VF
    
    The GuC firmware is loaded and initialized by the PF driver. Make
    sure VF drivers only perform permitted operations. For submission
    initialization, use number of GuC context IDs from self config.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch 362550fd170e1450157834793cf333b521d96133 drm-intel
6f61a7b9dbc5 drm/xe/guc: Allow to initialize submission with limited set of IDs
5ac6d1242f74 drm/xe/vf: Custom GuC initialization if VF


