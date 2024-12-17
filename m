Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894BBE77184
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 21:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BFD10E136;
	Tue, 17 Dec 2024 21:58:29 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DEBA10E136;
 Tue, 17 Dec 2024 21:58:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Force_write_com?=
 =?utf-8?q?pletion_of_MI=5FSTORE=5FDATA=5FIMM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Dec 2024 21:58:27 -0000
Message-ID: <173447270764.3989973.536364990103347456@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241217160732.46280-1-jose.souza@intel.com>
In-Reply-To: <20241217160732.46280-1-jose.souza@intel.com>
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

Series: drm/xe: Force write completion of MI_STORE_DATA_IMM
URL   : https://patchwork.freedesktop.org/series/142740/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a48bc6c00bb5a92be24668ba28c27b01cee850ab
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Tue Dec 17 08:07:32 2024 -0800

    drm/xe: Force write completion of MI_STORE_DATA_IMM
    
    With Force write completion unset there is no guarantees of when the
    write will be globally visible what is not the behavior wanted.
    
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
    Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 69607bbcaccc29ae254d974a5e547d873e7c0ac0 drm-intel
a48bc6c00bb5 drm/xe: Force write completion of MI_STORE_DATA_IMM


