Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638FBC27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 14:33:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24E610ED75;
	Fri, 14 Jun 2024 14:33:07 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B184510E089;
 Fri, 14 Jun 2024 14:33:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/mso=3A_using_joi?=
 =?utf-8?q?ner_is_not_possible_with_eDP_MSO?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Jun 2024 14:33:05 -0000
Message-ID: <171837558572.77190.1106031389125628764@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240614142311.589089-1-jani.nikula@intel.com>
In-Reply-To: <20240614142311.589089-1-jani.nikula@intel.com>
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

Series: drm/i915/mso: using joiner is not possible with eDP MSO
URL   : https://patchwork.freedesktop.org/series/134894/
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
commit 5c95cb19cd6c4f67449547b2ab5bd7ce7b4608c4
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Jun 14 17:23:11 2024 +0300

    drm/i915/mso: using joiner is not possible with eDP MSO
    
    It's not possible to use the joiner at the same time with eDP MSO. When
    a panel needs MSO, it's not optional, so MSO trumps joiner.
    
    v3: Only change intel_dp_has_joiner(), leave debugfs alone (Ville)
    
    Cc: stable@vger.kernel.org
    Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1668
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 00e9498b453447a5afe527bd0e174587b12f66d2 drm-intel
5c95cb19cd6c drm/i915/mso: using joiner is not possible with eDP MSO


