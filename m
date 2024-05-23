Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10602C25B7C
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 15:39:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F8D10E72C;
	Thu, 23 May 2024 15:39:37 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32F010E71B;
 Thu, 23 May 2024 15:39:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_remove_unused_s?=
 =?utf-8?q?truct_=27xe=5Fgt=5Fdesc=27?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: linux@treblig.org
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 May 2024 15:39:33 -0000
Message-ID: <171647877372.2170280.7526727062417728981@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240522175840.382107-1-linux@treblig.org>
In-Reply-To: <20240522175840.382107-1-linux@treblig.org>
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

Series: drm/xe: remove unused struct 'xe_gt_desc'
URL   : https://patchwork.freedesktop.org/series/133971/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9cf4e43da33d5040f781a97877a849dfb71d35b0
Author: Dr. David Alan Gilbert <linux@treblig.org>
Date:   Wed May 22 18:58:40 2024 +0100

    drm/xe: remove unused struct 'xe_gt_desc'
    
    'xe_gt_desc' is unused since
    commit 1e6c20be6c83 ("drm/xe: Drop extra_gts[] declarations and
    XE_GT_TYPE_REMOTE").
    
    Remove it.
    
    Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
+ /mt/dim checkpatch 8e768c3e813ab5519a85997b622edc9a2f79c083 drm-intel
9cf4e43da33d drm/xe: remove unused struct 'xe_gt_desc'


