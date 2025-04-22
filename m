Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D65BC369CB
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 05:12:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0147A10E4E6;
	Tue, 22 Apr 2025 05:12:04 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F7810E4E9;
 Tue, 22 Apr 2025 05:12:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_xe=5Fsvm=5Frang?=
 =?utf-8?q?e=5Falloc_should_return_NULL_upon_error?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dafna Hirschfeld" <dafna.hirschfeld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Apr 2025 05:12:02 -0000
Message-ID: <174529872254.23907.5412300414347806127@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250422050606.1074334-1-dafna.hirschfeld@intel.com>
In-Reply-To: <20250422050606.1074334-1-dafna.hirschfeld@intel.com>
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

Series: drm/xe: xe_svm_range_alloc should return NULL upon error
URL   : https://patchwork.freedesktop.org/series/148047/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e74e3e921875c9a1df2bce57aa437c4379a90d3e
Author: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
Date:   Tue Apr 22 08:06:06 2025 +0300

    drm/xe: xe_svm_range_alloc should return NULL upon error
    
    replace error pointer with NULL upon failure.
    
    Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
+ /mt/dim checkpatch 7453e9c769c0591f7be7a1bb254905dd2c8be125 drm-intel
e74e3e921875 drm/xe: xe_svm_range_alloc should return NULL upon error


