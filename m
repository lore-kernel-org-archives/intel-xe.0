Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790B6EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 00:27:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3882910E0F1;
	Thu, 15 Jun 2023 00:27:57 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 33A4C10E044;
 Thu, 15 Jun 2023 00:27:54 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 30869AADF0;
 Thu, 15 Jun 2023 00:27:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Thu, 15 Jun 2023 00:27:54 -0000
Message-ID: <168678887419.10724.16540241299029118033@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230615002521.2587250-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230615002521.2587250-1-daniele.ceraolospurio@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_limit_GGTT_size_to_GUC=5FGGTT=5FTOP?=
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

Series: drm/xe: limit GGTT size to GUC_GGTT_TOP
URL   : https://patchwork.freedesktop.org/series/119355/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 83942ba6c1d4a8215c7600e23109b9e2e3c9e26d
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Wed Jun 14 17:25:21 2023 -0700

    drm/xe: limit GGTT size to GUC_GGTT_TOP
    
    The GuC can't access addresses above GUC_GGTT_TOP, so any GuC-accessible
    objects can't be mapped above that offset. Instead of checking each
    object to see if GuC may access it or not before mapping it, we just
    limit the GGTT size to GUC_GGTT_TOP. This wastes a bit of address space
    (about ~18 MBs, which is in addition to what already removed at the bottom
    of the GGTT), but it is a good tradeoff to keep the code simple.
    
    The in-code comment has also been updated to explain the limitation.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+ /mt/dim checkpatch 6d2981d42cd891965094ec7d173203520cfa36f7 drm-intel
83942ba6c drm/xe: limit GGTT size to GUC_GGTT_TOP


