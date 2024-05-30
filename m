Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94377C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 18:17:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D8311B6F7;
	Thu, 30 May 2024 18:17:21 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9DA11B6F7;
 Thu, 30 May 2024 18:17:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_kernel-doc_?=
 =?utf-8?q?to_some_xe=5Flrc_interfaces?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 May 2024 18:17:19 -0000
Message-ID: <171709303991.2239183.4838605189317991027@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240530181100.18188-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20240530181100.18188-1-niranjana.vishwanathapura@intel.com>
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

Series: drm/xe: Add kernel-doc to some xe_lrc interfaces
URL   : https://patchwork.freedesktop.org/series/134262/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 92691a2cc42300a3e6a986c8bec80f5361aff0f4
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Thu May 30 11:11:00 2024 -0700

    drm/xe: Add kernel-doc to some xe_lrc interfaces
    
    Add kernel-doc to xe_lrc_create/destroy and xe_lrc_get/put
    interfaces.
    
    Fixes: 264eecdba211 ("drm/xe: Decouple xe_exec_queue and xe_lrc")
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
+ /mt/dim checkpatch 8a03c116f647be54b169f3f5552341488e2df12b drm-intel
92691a2cc423 drm/xe: Add kernel-doc to some xe_lrc interfaces


