Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0596FC021B1
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 18:02:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF33510E0E7;
	Thu, 20 Feb 2025 18:02:25 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD9A10E0E7;
 Thu, 20 Feb 2025 18:02:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Unify_IP_descri?=
 =?utf-8?q?ptors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Feb 2025 18:02:24 -0000
Message-ID: <174007454489.248180.4676995878573608069@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250220172532.66613-1-gustavo.sousa@intel.com>
In-Reply-To: <20250220172532.66613-1-gustavo.sousa@intel.com>
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

Series: drm/xe: Unify IP descriptors
URL   : https://patchwork.freedesktop.org/series/145188/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4e4ae14af93cde00975b20b62aa8070374645020
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Thu Feb 20 14:25:11 2025 -0300

    drm/xe: Convert pre-GMDID IPs to struct xe_ip
    
    We have now a struct xe_ip to fully describe an IP, but we are only
    using that for GMDID-based IPs.
    
    For pre-GMDID IPs, we still describe release info (version and name) via
    feature descriptors (struct xe_{graphics,media}_desc). Let's convert
    those to use struct xe_ip.
    
    With this, we have a uniform way of describing IPs in the xe driver
    instead of having different approaches based on whether the IPs use
    GMDIDs or not.
    
    A nice side-effect of this change is that now we have an easy way to
    lookup, in the source code, mappings between versions, names and
    features for all supported IPs.
    
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 8554d5b7b4fded481a85ab11d75eeb97443450e2 drm-intel
407af942161c drm/xe: Set IP names in functions handling IP version
694e6fedf847 drm/xe: Disambiguate GMDID-based IP names
17e2e94bea9f drm/xe: Rename gmdid_map to xe_ip
4e4ae14af93c drm/xe: Convert pre-GMDID IPs to struct xe_ip


