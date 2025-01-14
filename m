Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7989E77188
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 23:50:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCF310E487;
	Tue, 14 Jan 2025 23:50:33 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB5E10E48C;
 Tue, 14 Jan 2025 23:50:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe3=3A_Generate_an?=
 =?utf-8?q?d_store_the_L3_bank_mask?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 Jan 2025 23:50:31 -0000
Message-ID: <173689863149.3753213.10830782867624761384@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250114203853.35055-1-matthew.s.atwood@intel.com>
In-Reply-To: <20250114203853.35055-1-matthew.s.atwood@intel.com>
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

Series: drm/xe/xe3: Generate and store the L3 bank mask
URL   : https://patchwork.freedesktop.org/series/143531/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2df8ccbf2ad47bb75c83869c8a52104190fd827e
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Tue Jan 14 12:38:53 2025 -0800

    drm/xe/xe3: Generate and store the L3 bank mask
    
    On Xe3, the register used to indicate which L3 banks are enabled on
    the system is a new one called MIRROR_L3BANK_ENABLE. Each bit
    represents one bank enabled in each node.
    Extend the existing topology code for Xe3 to read this register and
    generate the correct L3 bank mask, which can be read by user space
    throug the topology query.
    
    Bspec: 72573, 73439
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
    Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
+ /mt/dim checkpatch a45139b1e7578c7a4f1cbe8fae0943416a174136 drm-intel
2df8ccbf2ad4 drm/xe/xe3: Generate and store the L3 bank mask


