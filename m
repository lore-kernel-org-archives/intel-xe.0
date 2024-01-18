Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AF7C47422
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 22:29:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEBF910E8FD;
	Thu, 18 Jan 2024 22:29:37 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A51810E8FD;
 Thu, 18 Jan 2024 22:29:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_correct_the_cal?=
 =?utf-8?q?culation_of_remaining_size?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: fei.yang@intel.com
Date: Thu, 18 Jan 2024 22:29:37 -0000
Message-ID: <170561697710.558566.9531492190313101687@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240118222051.790432-1-fei.yang@intel.com>
In-Reply-To: <20240118222051.790432-1-fei.yang@intel.com>
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

Series: drm/xe: correct the calculation of remaining size
URL   : https://patchwork.freedesktop.org/series/128960/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e5fcc73e609d64661a20192b200a3caa6d7880b9
Author: Fei Yang <fei.yang@intel.com>
Date:   Thu Jan 18 14:20:51 2024 -0800

    drm/xe: correct the calculation of remaining size
    
    In function write_pgtable, the calculation of chunk in the do-while
    loop is wrong, we should always compare against remaining size instead
    of the total size update->qwords.
    Also correct the assert. While one MI_STORE_DATA_IMM can take no more
    than 0x1fe qwords, the size of the pgtable can be 512 entries.
    
    Signed-off-by: Fei Yang <fei.yang@intel.com>
+ /mt/dim checkpatch 776dc1588b4b329dba41ded2db883fbc1bf77950 drm-intel
e5fcc73e6 drm/xe: correct the calculation of remaining size


