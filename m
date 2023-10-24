Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B63C25B48
	for <intel-xe@archiver.kernel.org>; Tue, 24 Oct 2023 15:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F207E10E0B9;
	Tue, 24 Oct 2023 15:56:47 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 78B6E10E0B9;
 Tue, 24 Oct 2023 15:56:46 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 770C0AADED;
 Tue, 24 Oct 2023 15:56:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Tue, 24 Oct 2023 15:56:46 -0000
Message-ID: <169816300648.18361.13433243958420325563@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231023215329.1796912-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20231023215329.1796912-1-daniele.ceraolospurio@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Fi?=
 =?utf-8?q?x_GSC_interrupts_=28rev2=29?=
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

Series: Fix GSC interrupts (rev2)
URL   : https://patchwork.freedesktop.org/series/125482/
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
commit ef9206115724584ac81d67d2188af6b0e1ed677b
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Mon Oct 23 14:53:29 2023 -0700

    fixup! drm/xe/gsc: add gsc device support
    
    2 fixes:
    
    1) The gsc_mask variable is not set in all branches, but it is always
       evaluated in an if condition, so we need to initialize it to a valid
       value
    
    2) On MTL+ the GSC interrupts come from the engine, so we can't
       unconditionally call the handler for the GSCFI interface and we
       instead need to check if we're on a platform that does have a GSCFI.
    
    While at it, move the GSCFI irq function call to where the other
    non-engine OTHER_CLASS interrupts are handled.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Vitaly Lubart <vitaly.lubart@intel.com>
    Cc: Alexander Usyskin <alexander.usyskin@intel.com>
    Reviewed-by: Alexander Usyskin <alexander.usyskin@intel.com>
+ /mt/dim checkpatch 4354e27efb78582ee567ba6264c79d0872a3a4e7 drm-intel
ef9206115 fixup! drm/xe/gsc: add gsc device support


