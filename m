Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF55C4167B
	for <intel-xe@archiver.kernel.org>; Sat,  9 Dec 2023 00:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A4110E166;
	Sat,  9 Dec 2023 00:33:07 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1704C10E166;
 Sat,  9 Dec 2023 00:33:06 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 13E61ACC20;
 Sat,  9 Dec 2023 00:33:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Cleanup_CCS_mod?=
 =?utf-8?q?e_related_code?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Sat, 09 Dec 2023 00:33:06 -0000
Message-ID: <170208198607.20048.3207416507892215258@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231208205424.29759-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20231208205424.29759-1-niranjana.vishwanathapura@intel.com>
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

Series: drm/xe: Cleanup CCS mode related code
URL   : https://patchwork.freedesktop.org/series/127585/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 85cf75191765742bc4a20debddb8c46fd668414d
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Fri Dec 8 12:54:24 2023 -0800

    drm/xe: Cleanup CCS mode related code
    
    Refactor some of the CCS mode related code to make it compliant
    with the coding guidelines.
    
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
+ /mt/dim checkpatch 1fc141d1f445b8e5ab4ff14645b0482dd98460b9 drm-intel
85cf75191 drm/xe: Cleanup CCS mode related code


