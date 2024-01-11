Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B4AC47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 22:31:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17F010E356;
	Thu, 11 Jan 2024 22:31:31 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339BA10E356;
 Thu, 11 Jan 2024 22:31:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Use_HXG_def?=
 =?utf-8?q?initions_on_HXG_messages?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Thu, 11 Jan 2024 22:31:31 -0000
Message-ID: <170501229121.290001.14052195588635325607@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240111210632.717-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240111210632.717-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/guc: Use HXG definitions on HXG messages
URL   : https://patchwork.freedesktop.org/series/128692/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
faa12d3432d7ef7793d934cd9338c555e95a5aad
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 47e37eb27c3fac5118cb159d52cb50e74ff8fdd0
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Jan 11 22:06:32 2024 +0100

    drm/xe/guc: Use HXG definitions on HXG messages
    
    While parsing and processing CTB G2H messages we should extract
    underlying HXG message and use HXG definitions on such message.
    Using outer CTB layer message in HXG definitions require use of
    shifted dword index, which might be confusing:
    
            FIELD_GET(GUC_HXG_MSG_0_xxx, msg[1])
    
    instead of:
    
            FIELD_GET(GUC_HXG_MSG_0_xxx, hxg[0])
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 3095fbb4deb0722d417b6a4ad4213e2ed9ecd052 drm-intel
47e37eb27 drm/xe/guc: Use HXG definitions on HXG messages


