Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B7AC021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 18:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2CE10E78B;
	Tue, 25 Feb 2025 18:02:28 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE20410E78B;
 Tue, 25 Feb 2025 18:02:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Unify_IP_descri?=
 =?utf-8?q?ptors_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 18:02:27 -0000
Message-ID: <174050654770.2014377.12808849918318528311@b555e5b46a47>
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

Series: drm/xe: Unify IP descriptors (rev3)
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
commit 1df235a8aefcdd32288087208f52e19e260c7b74
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
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 533a24b8fa29455518aed9ac72209c834d814238 drm-intel
d703475c39ab drm/xe: Set IP names in functions handling IP version
c131ad91f317 drm/xe: Disambiguate GMDID-based IP names
dc641fbe2050 drm/xe: Rename gmdid_map to xe_ip
f535d8a545f6 drm/xe: Define xe_ip instances before xe_device_desc
e59cde0bbaf4 drm/xe: Convert pre-GMDID IPs to struct xe_ip
881f34973d64 drm/xe: Re-use feature descriptors for pre-GMDID IPs
1df235a8aefc drm/xe: Simplify setting release info in xe->info


