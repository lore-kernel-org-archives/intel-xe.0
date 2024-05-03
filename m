Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EAFC4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 19:19:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA7910FA11;
	Fri,  3 May 2024 19:19:35 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42D110FA11;
 Fri,  3 May 2024 19:19:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Demote_CCS=5FMO?=
 =?utf-8?q?DE_info_to_debug_only?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 03 May 2024 19:19:34 -0000
Message-ID: <171476397493.1888398.13717847904163394876@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240503190331.6690-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240503190331.6690-1-rodrigo.vivi@intel.com>
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

Series: drm/xe: Demote CCS_MODE info to debug only
URL   : https://patchwork.freedesktop.org/series/133185/
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
commit ad4e1a6b3e82009b5491fee83963eda419dc5290
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Fri May 3 15:03:31 2024 -0400

    drm/xe: Demote CCS_MODE info to debug only
    
    This information is printed in any gt_reset, which actually
    occurs in any runtime resume, what can be so verbose in
    production build. Let's demote it to debug only.
    
    Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch e9ea5061461b07fcb7e19892a54a61aa8fa1d163 drm-intel
ad4e1a6b3e82 drm/xe: Demote CCS_MODE info to debug only


