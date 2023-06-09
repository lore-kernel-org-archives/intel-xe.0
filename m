Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1163C7EE2F
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 07:39:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAAE510E645;
	Fri,  9 Jun 2023 07:39:56 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id CA48610E645;
 Fri,  9 Jun 2023 07:39:55 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C7681A66C9;
 Fri,  9 Jun 2023 07:39:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Fri, 09 Jun 2023 07:39:55 -0000
Message-ID: <168629639581.15970.5519232939342119352@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230609073713.7-1-francois.dugast@intel.com>
In-Reply-To: <20230609073713.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_uAPI_cleanup_=28rev4=29?=
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

Series: drm/xe: uAPI cleanup (rev4)
URL   : https://patchwork.freedesktop.org/series/118447/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d49cc17a423d1fab8ae3de8bdcab2e40731deef7
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Fri Jun 9 07:37:13 2023 +0000

    drm/xe: Move defines before relevant fields
    
    Align on same rule in the whole file: defines then doc then relevant
    field, with an empty line to separate fields.
    
    v2:
      - Rebase on drm-xe-next
      - Fix ordering of defines and fields in uAPI (Lucas De Marchi)
    v3: Remove useless empty lines (Lucas De Marchi)
    v4: Move changelog to commit
    
    Reported-by: Oded Gabbay <ogabbay@kernel.org>
    Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch c075cadc4c6d0238556545baab98a63368908404 drm-intel
5a3f2a518 drm/xe: Document structures for device query
d49cc17a4 drm/xe: Move defines before relevant fields


