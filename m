Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D736CD1292
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 14:48:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D7B10E05E;
	Thu,  4 Apr 2024 14:48:12 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3F610E05E;
 Thu,  4 Apr 2024 14:48:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_limit_eDP_MSO?=
 =?utf-8?q?_pipe_only_for_display_version_20_and_below_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Apr 2024 14:48:11 -0000
Message-ID: <171224209105.1209579.5685000747417682874@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240404091646.165309-1-luciano.coelho@intel.com>
In-Reply-To: <20240404091646.165309-1-luciano.coelho@intel.com>
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

Series: drm/i915: limit eDP MSO pipe only for display version 20 and below (rev2)
URL   : https://patchwork.freedesktop.org/series/131570/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 19cced2fb66ae0fc89ad57e5282429c40cc264ea
Author: Luca Coelho <luciano.coelho@intel.com>
Date:   Thu Apr 4 12:16:46 2024 +0300

    drm/i915: limit eDP MSO pipe only for display version 20 and below
    
    The pipes that can be used for eDP MSO are limited to pipe A (and
    sometimes also pipe B) only for display version 20 and below.
    
    Modify the function that returns the pipe mask for eDP MSO so that
    these limitations only apply to version 20 and below, enabling all
    pipes otherwise.
    
    Bspec: 68923
    Cc: Jani Nikula <jani.nikula@intel.com>
    Cc: James Ausmus <james.ausmus@intel.com>
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
+ /mt/dim checkpatch 0900f84da0bdd3ac493ff919e70222475698c84d drm-intel
19cced2fb66a drm/i915: limit eDP MSO pipe only for display version 20 and below


