Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D77C28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 10:29:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1132710E0F5;
	Fri, 28 Mar 2025 10:29:43 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E6F10E9D1;
 Fri, 28 Mar 2025 10:29:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/pf=3A_Don=27t_allo?=
 =?utf-8?q?w_LMEM_provisioning_if_LMTT_isn=27t_available_on_the_device?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Mar 2025 10:29:41 -0000
Message-ID: <174315778141.14706.16005221346277499142@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250328102357.2391877-1-piotr.piorkowski@intel.com>
In-Reply-To: <20250328102357.2391877-1-piotr.piorkowski@intel.com>
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

Series: drm/xe/pf: Don't allow LMEM provisioning if LMTT isn't available on the device
URL   : https://patchwork.freedesktop.org/series/146941/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b4b30db8847d47be796f20debbf6023392b374ff
Author: Piotr Piórkowski <piotr.piorkowski@intel.com>
Date:   Fri Mar 28 11:23:57 2025 +0100

    drm/xe/pf: Don't allow LMEM provisioning if LMTT isn't available on the device
    
    Currently, LMEM provisioning is fully dependent on LMTT, and we are
    unable to make useful LMEM provisioning without LMTT.
    Let's don't allow LMEM provisioning if LMTT is not available on the
    device.
    
    Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch f823caa91ed490160b8e87792d3bb26ae3e87de0 drm-intel
b4b30db8847d drm/xe/pf: Don't allow LMEM provisioning if LMTT isn't available on the device


