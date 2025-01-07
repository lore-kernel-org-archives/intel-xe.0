Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB20E77197
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 21:10:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317D510E095;
	Tue,  7 Jan 2025 21:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cxzsC8Su";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287F310E095
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jan 2025 21:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736284226; x=1767820226;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SdNSDP6WnTlO5oeeGvnxcJ2Q8Cwn0YM5IaS5bJk/BXo=;
 b=cxzsC8SuybZvVuCz6hUS1iRinfSGkO62Zz1bTGgOYY9DoFp+e1Wpl9cR
 sb/ctTAB3x6j8LIKJKwpy9ch/6OJKz9QNNj4MK1EAVHoTysU3VaSJWFf2
 GmNlQGZEIzF5Y1lNmoemBJ9qdC+i4vx1oOPMV2k8I2x/w5/tfkIchTVA0
 bBGTqHWiM62Lb3Y5LzaxNQ+XWI9H84tO38QXcuLEP0UaWad90LL+pfKSw
 m3+tKqOLJaIzoj1feK894oVRQr2T/YT5M2v9Oej+ACJrx5HIGljKfN8Cb
 zeYSyTzBN5n5DQYKWHE4REeK7ip6dG7B8OX3/scgJzKucxSRnJM61octg w==;
X-CSE-ConnectionGUID: ARJcmikQTJG2+/8gW99vnw==
X-CSE-MsgGUID: bkc57++8R3iKppolvsJPaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47066673"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="47066673"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 13:10:25 -0800
X-CSE-ConnectionGUID: sfQz49+cSWS+hItFEVX6jw==
X-CSE-MsgGUID: LczBkGi/QtSEcPZtF9EF8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="102941428"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.171])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 13:10:25 -0800
Date: Tue, 7 Jan 2025 15:10:17 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Julia Filipchuk <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3 1/1] drm/xe/guc: Fix GuC log/ct output via debugfs
Message-ID: <3god5fzcfbzxwlssqdb6eenzedqkykv2scpktlk5uglgf2ro73@bjuq2knwuweh>
References: <20250107202252.2642853-1-julia.filipchuk@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250107202252.2642853-1-julia.filipchuk@intel.com>
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

On Tue, Jan 07, 2025 at 12:22:52PM -0800, Julia Filipchuk wrote:
>Change to disable asci85 GuC logging only when output to devcoredump
>(was temporarily disabled for all code paths).
>
>v2: Ignore only for devcoredump case (not dmesg output).
>v3: Rebase to resolve parent tag mismatch.
>
>Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
>---
> drivers/gpu/drm/xe/xe_devcoredump.c | 8 +++++---
> include/drm/drm_print.h             | 2 ++
> 2 files changed, 7 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>index 6980304c8903..8e5d1f9866a7 100644
>--- a/drivers/gpu/drm/xe/xe_devcoredump.c
>+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>@@ -424,10 +424,12 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix,
> 	 * Splitting blobs across multiple lines is not compatible with the mesa
> 	 * debug decoder tool. Note that even dropping the explicit '\n' below
> 	 * doesn't help because the GuC log is so big some underlying implementation
>-	 * still splits the lines at 512K characters. So just bail completely for
>-	 * the moment.
>+	 * still splits the lines at 512K characters.

did we investigate where this is done and how we can overcome it? I
understand having to split it into multiple calls, but not something
adding a \n. particularly for the functions dealing with seq_file and
devcoredump.

>+	 *
>+	 * Only disable from devcoredump output.
> 	 */
>-	return;
>+	if (p->coredump)

but we do want the guc log to be inside the devcoredump, so rather than
adding more workarounds, can we fix it ?

Lucas De Marchi
