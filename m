Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86236C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 19:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BC910E190;
	Mon, 13 Nov 2023 19:47:34 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id C54C710E191;
 Mon, 13 Nov 2023 19:47:32 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C4A90AADD6;
 Mon, 13 Nov 2023 19:47:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Date: Mon, 13 Nov 2023 19:47:32 -0000
Message-ID: <169990485280.24212.9943097520389124843@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231113194402.975434-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20231113194402.975434-1-vinay.belgaumkar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Raise_GT_frequency_before_GuC/HuC_load_=28rev3=29?=
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

Series: drm/xe: Raise GT frequency before GuC/HuC load (rev3)
URL   : https://patchwork.freedesktop.org/series/126162/
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
commit 3afd6caebb96f04a79119e2fb4439201d409932f
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Mon Nov 13 11:44:02 2023 -0800

    drm/xe: Raise GT frequency before GuC/HuC load
    
    Starting GT freq is usually RPn. Raising freq to RP0 will
    help speed up GuC load times. As an example, this data was
    collected on DG2-
    
    GuC Load time @RPn ~ 41 ms
    GuC Load time @RP0 ~ 11 ms
    
    v2: Raise GT freq before hwconfig init. This will speed up
    both HuC and GuC loads. Address review comments (Rodrigo).
    Also add a small usleep after requesting frequency which gives
    pcode some time to react.
    
    v3: Address checkpatch issue
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch 3ca087c8b061aa9dbaac53ea244ec2d85d5956be drm-intel
3afd6caeb drm/xe: Raise GT frequency before GuC/HuC load


