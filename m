Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9760BC28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 20:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6028F10EABD;
	Fri, 28 Mar 2025 20:52:37 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFCD10EABD;
 Fri, 28 Mar 2025 20:52:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Restore_EIO_err?=
 =?utf-8?q?no_return_when_GuC_PC_start_fails?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Mar 2025 20:52:36 -0000
Message-ID: <174319515695.17146.13621983784772337502@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250328181752.26677-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250328181752.26677-1-rodrigo.vivi@intel.com>
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

Series: drm/xe: Restore EIO errno return when GuC PC start fails
URL   : https://patchwork.freedesktop.org/series/146978/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6f976fa6574d9934c9f392fdef64e923b26d5539
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Fri Mar 28 14:17:52 2025 -0400

    drm/xe: Restore EIO errno return when GuC PC start fails
    
    Commit b4b05e53b550 ("drm/xe/guc_pc: Retry and wait longer for GuC PC
    start") from Mar 7, 2025 (linux-next), leads to the following Smatch
    static checker warning:
    
            drivers/gpu/drm/xe/xe_guc_pc.c:1073 xe_guc_pc_start()
            warn: missing error code here? '_dev_err()' failed. 'ret' = '0'
    
    Fixes: b4b05e53b550 ("drm/xe/guc_pc: Retry and wait longer for GuC PC start")
    Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
    Closes: https://lore.kernel.org/intel-xe/1454a5f1-ee18-4df1-a6b2-a4a3dddcd1cb@stanley.mountain/
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch b8a000ee8dbf41db533796cefbfb275cd306eb5b drm-intel
6f976fa6574d drm/xe: Restore EIO errno return when GuC PC start fails


