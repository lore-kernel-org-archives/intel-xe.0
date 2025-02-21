Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5467CC021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 19:21:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CD110E24F;
	Fri, 21 Feb 2025 19:21:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DC110E24F;
 Fri, 21 Feb 2025 19:21:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Unify_IP_descri?=
 =?utf-8?q?ptors_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Feb 2025 19:21:53 -0000
Message-ID: <174016571342.549045.16527646852517900829@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250221-xe-unify-ip-descriptors-v2-0-5bc0c6d0c13f@intel.com>
In-Reply-To: <20250221-xe-unify-ip-descriptors-v2-0-5bc0c6d0c13f@intel.com>
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

Series: drm/xe: Unify IP descriptors (rev2)
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
commit c34c0c48f9c6c39aaa6e8aec2b6a3b2948b2771e
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Fri Feb 21 15:51:46 2025 -0300

    drm/xe: Simplify setting release info in xe->info
    
    Now that we have all IPs being described via struct xe_ip, where release
    information (version and name) is represented in a single struct type,
    we can extract duplicated logic from handle_pre_gmdid() and
    handle_gmdid() and apply it in the body of xe_info_init().
    
    With this change, there is no point in keeping handle_pre_gmdid()
    anymore, so we just remove it and inline the assignment of
    {graphics,media}_ip.
    
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 3ef8736446933ce5e8ccbec2f85922ca1ed3b706 drm-intel
7f1e59becb61 drm/xe: Set IP names in functions handling IP version
7af83f670df8 drm/xe: Disambiguate GMDID-based IP names
a4c9a5a6ae78 drm/xe: Rename gmdid_map to xe_ip
ff0e08747d05 drm/xe: Define xe_ip instances before xe_device_desc
3aea4702fb7a drm/xe: Convert pre-GMDID IPs to struct xe_ip
656f5e035e9d drm/xe: Re-use feature descriptors for pre-GMDID IPs
c34c0c48f9c6 drm/xe: Simplify setting release info in xe->info


