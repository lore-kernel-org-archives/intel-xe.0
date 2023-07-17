Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F95CEB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jul 2023 19:58:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5960410E153;
	Mon, 17 Jul 2023 19:58:40 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id BD16F10E153;
 Mon, 17 Jul 2023 19:58:38 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B9741A7DFB;
 Mon, 17 Jul 2023 19:58:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Mon, 17 Jul 2023 19:58:38 -0000
Message-ID: <168962391875.24538.14619498567180626134@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230717193746.7-1-francois.dugast@intel.com>
In-Reply-To: <20230717193746.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Cleanup_style_warnings_=28rev2=29?=
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

Series: drm/xe: Cleanup style warnings (rev2)
URL   : https://patchwork.freedesktop.org/series/120868/
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
commit b3293d62b8429e52be3852a4a21c57e55b4a86b9
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Mon Jul 17 19:37:46 2023 +0000

    drm/xe: Cleanup style warnings
    
    Reduce the number of warnings reported by checkpatch.pl from 118 to 48 by
    addressing those warnings types:
    
      LEADING_SPACE
      LINE_SPACING
      BRACES
      TRAILING_SEMICOLON
      CONSTANT_COMPARISON
      BLOCK_COMMENT_STYLE
      RETURN_VOID
      ONE_SEMICOLON
      SUSPECT_CODE_INDENT
      LINE_CONTINUATIONS
      UNNECESSARY_ELSE
      UNSPECIFIED_INT
      UNNECESSARY_INT
      MISORDERED_TYPE
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch fb6205f59e05f1057219fc8c38a0560debb35273 drm-intel
b3293d62b drm/xe: Cleanup style warnings


