Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFDBC19F4F
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 00:07:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03210113017;
	Wed,  8 May 2024 00:07:12 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43CB113017;
 Wed,  8 May 2024 00:07:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Change_pcode_ti?=
 =?utf-8?q?meout_to_50msec_while_polling_again?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 May 2024 00:07:10 -0000
Message-ID: <171512683080.1963161.11346703922484130272@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240507200729.3214654-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240507200729.3214654-1-himal.prasad.ghimiray@intel.com>
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

Series: drm/xe: Change pcode timeout to 50msec while polling again
URL   : https://patchwork.freedesktop.org/series/133295/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ab15bbd50ac1ed807509c0861a44b1a7f41cd240
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Wed May 8 01:37:29 2024 +0530

    drm/xe: Change pcode timeout to 50msec while polling again
    
    Polling is initially attempted with timeout_base_ms enabled for
    preemption, and if it exceeds this timeframe, another attempt is made
    without preemption, allowing an additional 50 ms before timing out.
    
    Display driver can request for timeout of 3 msec, hence modify the
    warning condition.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 703bc96550be8cd9f4995bfa5126ca8a2e98c58c drm-intel
ab15bbd50ac1 drm/xe: Change pcode timeout to 50msec while polling again


