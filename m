Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C3BEE14D0
	for <intel-xe@archiver.kernel.org>; Thu,  7 Sep 2023 07:53:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364B710E783;
	Thu,  7 Sep 2023 07:53:15 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7781E10E783;
 Thu,  7 Sep 2023 07:53:14 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 74761AADF3;
 Thu,  7 Sep 2023 07:53:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Thu, 07 Sep 2023 07:53:14 -0000
Message-ID: <169407319447.17901.4280221777910292036@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230907073953.7-1-francois.dugast@intel.com>
In-Reply-To: <20230907073953.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/uapi=3A_Separate_VM=5FBIND=27s_operation_and_flag_=28rev2?=
 =?utf-8?q?=29?=
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

Series: drm/xe/uapi: Separate VM_BIND's operation and flag (rev2)
URL   : https://patchwork.freedesktop.org/series/123333/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 58a2a21dca12bc721ceaa91842b646c3bd52f466
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Thu Sep 7 07:39:53 2023 +0000

    drm/xe/uapi: Separate VM_BIND's operation and flag
    
    Use different members in the drm_xe_vm_bind_op for op and for flags as
    it is done in other structures.
    
    Type is left to u32 to leave enough room for future operations and flags.
    
    v2: Remove the XE_VM_BIND_* flags shift (Rodrigo Vivi)
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch bae46e59a7f667734376ddb0d2451967dfb264f1 drm-intel
58a2a21dc drm/xe/uapi: Separate VM_BIND's operation and flag


