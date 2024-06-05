Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AD5C25B78
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 02:41:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018B810E684;
	Wed,  5 Jun 2024 02:41:56 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A473C10E684;
 Wed,  5 Jun 2024 02:41:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?1=2C1/1=5D_treewide=3A_Align_match=5Fstring=28=29_with_sysfs=5Fma?=
 =?utf-8?q?tch=5Fstring=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Jun 2024 02:41:54 -0000
Message-ID: <171755531467.2266944.2862777531532966291@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
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

Series: series starting with [v1,1/1] treewide: Align match_string() with sysfs_match_string()
URL   : https://patchwork.freedesktop.org/series/134445/
State : warning

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
commit f73c7be57b9affefd42961c6877dad395e4c6ce4
Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Sun Jun 2 18:57:12 2024 +0300

    treewide: Align match_string() with sysfs_match_string()
    
    Make two APIs look similar. Hence convert match_string() to be
    a 2-argument macro. In order to avoid unneeded churn, convert
    all users as well. There is no functional change intended.
    
    Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
    Acked-by: Bjorn Helgaas <bhelgaas@google.com>   # drivers/pci/
    Acked-by: Damien Le Moal <dlemoal@kernel.org>   # drivers/ata/
    Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>  # fs/ubifs
    Acked-by: Daniel Bristot de Oliveira <bristot@kernel.org>
+ /mt/dim checkpatch 596cf447db94909c4788fd612876520531e439b0 drm-intel
f73c7be57b9a treewide: Align match_string() with sysfs_match_string()
-:26: WARNING:STATIC_CONST_CHAR_ARRAY: static const char * array should probably be static const char * const
#26: FILE: arch/powerpc/xmon/xmon.c:3481:
+static const char *regnames[] = {

-:1168: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_a' - possible side-effects?
#1168: FILE: include/linux/string.h:315:
+#define match_string(_a, _s) __match_string(_a, ARRAY_SIZE(_a), _s)

total: 0 errors, 1 warnings, 1 checks, 1075 lines checked


