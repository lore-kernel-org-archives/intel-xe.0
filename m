Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E45ECD1297
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 09:38:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0DA10E142;
	Wed, 10 Apr 2024 09:38:07 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBDE10E231;
 Wed, 10 Apr 2024 09:38:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Pcode_init_status_and_lme?=
 =?utf-8?q?m_check_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Apr 2024 09:38:04 -0000
Message-ID: <171274188424.1319548.4181522586122487553@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240410085005.1126343-1-riana.tauro@intel.com>
In-Reply-To: <20240410085005.1126343-1-riana.tauro@intel.com>
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

Series: Pcode init status and lmem check (rev5)
URL   : https://patchwork.freedesktop.org/series/130904/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0697cf16a87ae53f6a5e8261e7f890660baa3edf
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Wed Apr 10 14:20:05 2024 +0530

    drm/xe: re-order lmem init check and wait for initialization to complete
    
    Lmem init check should be done only after pcode initialization
    status is complete. Move lmem init check after pcode status
    check. Also wait for a short while after pcode status check
    to allow completion of the task.
    
    Failing to do so, can lead to aborting the module load
    leaving the system unusable. Wait until the lmem initialization
    is complete within a timeout (60s) or till the user aborts.
    
    v2: use bool as return type
        re-order the code comment (Rodrigo)
        add comment for deferring probe (Himal)
    
    v3: rebase
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
    Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch c111f7a5945a5325e95fd38bfde2880263fce683 drm-intel
f87d02da7ec3 drm/xe: check pcode init status only on root gt of root tile
0697cf16a87a drm/xe: re-order lmem init check and wait for initialization to complete


