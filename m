Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FEDC4345F
	for <intel-xe@archiver.kernel.org>; Sat, 27 Apr 2024 13:57:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCBD10F616;
	Sat, 27 Apr 2024 13:57:52 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C25A10F616;
 Sat, 27 Apr 2024 13:57:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Merge_160215402?=
 =?utf-8?q?21_and_18034896535_WAs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 27 Apr 2024 13:57:51 -0000
Message-ID: <171422627104.1704636.9624947978587276232@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240427135339.3485559-1-lucas.demarchi@intel.com>
In-Reply-To: <20240427135339.3485559-1-lucas.demarchi@intel.com>
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

Series: drm/xe: Merge 16021540221 and 18034896535 WAs
URL   : https://patchwork.freedesktop.org/series/132982/
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
commit 38f58625dd55635439b4464580491784e647f104
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Sat Apr 27 06:53:39 2024 -0700

    drm/xe: Merge 16021540221 and 18034896535 WAs
    
    In order to detect duplicate implementations for the same workaround,
    early in the implementation of RTP it was decided to error out even if
    the values set are exactly the same. With the introduction of 18034896535
    in commit 74671d23ca18 ("drm/xe/xe2: Add workaround 18034896535"), LNL
    stepping with graphics stepping A1 now gives the following error on
    module load:
    
            xe 0000:00:02.0: [drm] *ERROR* GT0: [GT OTHER] \
            discarding save-restore reg e48c (clear: 00000200, set: 00000200,\
            masked: yes, mcr: yes): ret=-22
    
    RTP may be improved in the future, but for now simply join the entries
    like done with e.g. "1607297627, 1607030317, 1607186500".
    
    Fixes: 74671d23ca18 ("drm/xe/xe2: Add workaround 18034896535")
    Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
    Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 94a0eea182f0a8b1ff4cd6269bcb0d26bb4994f2 drm-intel
38f58625dd55 drm/xe: Merge 16021540221 and 18034896535 WAs


