Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237CECD37AC
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 18:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2F810E30D;
	Tue,  3 Sep 2024 18:00:46 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6561F10E302;
 Tue,  3 Sep 2024 18:00:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_convert_comma?=
 =?utf-8?q?_to_semicolon?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chen Ni" <nichen@iscas.ac.cn>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Sep 2024 18:00:45 -0000
Message-ID: <172538644541.919808.3073004828450021258@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240903025558.493977-1-nichen@iscas.ac.cn>
In-Reply-To: <20240903025558.493977-1-nichen@iscas.ac.cn>
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

Series: drm/i915: convert comma to semicolon
URL   : https://patchwork.freedesktop.org/series/138144/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2acc62aa696ba790876c8a6e2e6e47360468c1fa
Author: Chen Ni <nichen@iscas.ac.cn>
Date:   Tue Sep 3 10:55:58 2024 +0800

    drm/i915: convert comma to semicolon
    
    Replace a comma between expression statements by a semicolon.
    
    Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
+ /mt/dim checkpatch 40f1f3d2913934d6a1446bbfeaf6a2fbaffe33a2 drm-intel
2acc62aa696b drm/i915: convert comma to semicolon


