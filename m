Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D7DC52D71
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 09:46:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5066910E38C;
	Thu,  8 Aug 2024 09:46:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E4310E38C;
 Thu,  8 Aug 2024 09:46:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Shuffle_enable=5Fhost=5Fl?=
 =?utf-8?q?2=5Fvram_order_and_use_MCR_reg?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Aug 2024 09:46:48 -0000
Message-ID: <172311040865.549353.8987542829997424415@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240808092826.585276-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240808092826.585276-1-tejas.upadhyay@intel.com>
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

Series: Shuffle enable_host_l2_vram order and use MCR reg
URL   : https://patchwork.freedesktop.org/series/137031/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
66551fd1be58212fb46d0bc97f2e5ae43c69b733
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 91b5a461f7faad7f668689f1a163af54726e147f
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Thu Aug 8 14:58:26 2024 +0530

    drm/xe: Write all slices if its mcr register
    
    Register GAMREQSTRM_CTRL should be considered mcr register
    which should write to all slices as per documentation.
    
    Bspec: 71185
    Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch b6a72e1d0a6ee0aad5bb0da07b050228c815a5f9 drm-intel
a19575677b46 drm/xe: Init MCR before any mcr register read
91b5a461f7fa drm/xe: Write all slices if its mcr register


