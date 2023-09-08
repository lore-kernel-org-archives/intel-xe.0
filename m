Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F99AEEB56E
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 20:36:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6D410E94A;
	Fri,  8 Sep 2023 20:36:37 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1A39A10E94A;
 Fri,  8 Sep 2023 20:36:36 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1E601AADE0;
 Fri,  8 Sep 2023 20:36:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Fri, 08 Sep 2023 20:36:36 -0000
Message-ID: <169420539612.14895.6397892234506462476@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230908203302.449041-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230908203302.449041-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_So?=
 =?utf-8?q?me_uapi_alignment_in_response_to_the_uapi_review?=
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

Series: Some uapi alignment in response to the uapi review
URL   : https://patchwork.freedesktop.org/series/123463/
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
commit 65cfabb89bf0aa155928b8fb3638ae715532fdc0
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Fri Sep 8 16:33:02 2023 -0400

    drm/xe/uapi: Rename gts to gt_list.
    
    During the uapi review it was identified a possible confusion
    with the plural of acronym with a new acronym. So the
    recommendation is to go with gt_list instead.
    
    Suggested-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 92bbb05964b2237a76a8a68020896bdbe0cab459 drm-intel
5c12efe3a drm/xe: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
01ac0abc6 drm/xe/uapi: Document drm_xe_query_gt.
40669ed6a drm/xe/uapi: Replace useless 'instance' per unique gt_id.
42c44ba9e drm/xe/uapi: Remove unused field of drm_xe_query_gt
65cfabb89 drm/xe/uapi: Rename gts to gt_list.


