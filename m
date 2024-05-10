Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7867FC25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 15:06:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A3F10E76C;
	Fri, 10 May 2024 15:06:53 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7628A10E76C;
 Fri, 10 May 2024 15:06:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Replace_RING=5F?=
 =?utf-8?q?START=5FUDW_by_u64_RING=5FSTART?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 May 2024 15:06:51 -0000
Message-ID: <171535361148.2056703.4087960429391777474@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240510150108.80679-1-jose.souza@intel.com>
In-Reply-To: <20240510150108.80679-1-jose.souza@intel.com>
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

Series: drm/xe: Replace RING_START_UDW by u64 RING_START
URL   : https://patchwork.freedesktop.org/series/133453/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
57b97a66dd129aea93991dc66cd10477f7a05cf8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fec2af5341c49270f204048e069e607089ab1431
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Fri May 10 08:01:08 2024 -0700

    drm/xe: Replace RING_START_UDW by u64 RING_START
    
    Other u64 registers are printed in a single line so RING_START
    needs to follow that too.
    As there is no upstream decoder tool parsing RING_START this will
    not break any decoder application.
    
    Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch b885b00e7fc01fc109887d59ce2d1283714b07c6 drm-intel
fec2af5341c4 drm/xe: Replace RING_START_UDW by u64 RING_START


