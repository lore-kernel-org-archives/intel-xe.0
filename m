Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F3BE7718B
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jan 2025 23:39:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC72A10E222;
	Wed,  1 Jan 2025 23:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b2R4M+75";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D1E10E222
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jan 2025 23:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735774744; x=1767310744;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1NBqK90MpLU/uMUHBbQs4ncLkMX0wmn+d+AA/fAWQ3I=;
 b=b2R4M+75mtoOAjHqcb1k9a9QxsZopC+fTq8p0Qve6QnBeDCuDHANODb8
 UJnz1QXBh/Csb717ON6Ja2+JSA8Agp8mR1rao4zhHgpWz+GEPlT4srx+3
 41nlFEE5k8DA5LiO/Zf0akSMU4zjUH7TQYH39jNA6v7fh780rvdqN2WoZ
 betAUrxv30roppuxPKaRflpMWT6vGMlBQsSMByTo6APNstl5jqlZE0cCC
 BjxeEKlhT7M0MWuobrssR+/d00b259AAsPqVSZNmJr+FJ+K533DKtmhX7
 H3WILHxp5MaOjcbhbJfLar6xExpnE1odgUBtJl1/VUJnIeV4kJ9QmvCXP A==;
X-CSE-ConnectionGUID: 0bO4TlrrSPepkIGotVb9FA==
X-CSE-MsgGUID: OqZefKgPR1Cm/Iikn/mROA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="36172107"
X-IronPort-AV: E=Sophos;i="6.12,283,1728975600"; d="scan'208";a="36172107"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2025 15:39:04 -0800
X-CSE-ConnectionGUID: IPNOww8bS/q5RF73YkY6Dg==
X-CSE-MsgGUID: sbVZW27yTCSjkbtZ8kvlOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105400072"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.200])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2025 15:39:03 -0800
Date: Wed, 1 Jan 2025 17:38:58 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Julia Filipchuk <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org, 
 =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Fix GuC log/ct output via debugfs
Message-ID: <7t3ceizgwqdwqwj5byevkybmbelsorpbg75rdpv624k2u6xyko@bhn2kuptctia>
References: <20241226214453.2003897-1-julia.filipchuk@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241226214453.2003897-1-julia.filipchuk@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 26, 2024 at 01:44:53PM -0800, Julia Filipchuk wrote:
>Enable GuC log dumping when accessed through debugfs (was temporarily
>disabled for all code paths).

humn... is this actually fixing it?

__xe_devcoredump_read()
   drm_coredump_printer()
   xe_guc_log_snapshot_print()
     xe_print_blob_ascii85()
     
this was the problematic sequence and afaics it continues to be.

>Correct coverity issue of unreachable
>code.

Kind of pointless here. We surely know it's unreachable. On purpose.

>
>Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
>---
> drivers/gpu/drm/xe/xe_devcoredump.c | 8 +++++---
> 1 file changed, 5 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>index 6980304c8903..cdc2280d61c3 100644
>--- a/drivers/gpu/drm/xe/xe_devcoredump.c
>+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>@@ -424,10 +424,12 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix,
> 	 * Splitting blobs across multiple lines is not compatible with the mesa
> 	 * debug decoder tool. Note that even dropping the explicit '\n' below
> 	 * doesn't help because the GuC log is so big some underlying implementation
>-	 * still splits the lines at 512K characters. So just bail completely for
>-	 * the moment.
>+	 * still splits the lines at 512K characters.
>+	 *
>+	 * When printing to dmesg stop don't output. Allow output through debugfs.

I think you got confused that the problem was dmesg... no, the problem
was the \n in the devcoredump and with this patch it would show up
again.

Cc: José Roberto de Souza <jose.souza@intel.com>

Lucas De Marchi

> 	 */
>-	return;
>+	if (p->line.series > 0)
>+		return;
>
> #define DMESG_MAX_LINE_LEN	800
> #define MIN_SPACE		(ASCII85_BUFSZ + 2)		/* 85 + "\n\0" */
>-- 
>2.47.1
>
