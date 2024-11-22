Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F475E6918F
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 20:46:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AAF10EC86;
	Fri, 22 Nov 2024 20:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WrxMX6fX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7995F10EC8B
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Nov 2024 20:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732308378; x=1763844378;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MHqn3/jOpL22Xtf2rv/M+b3sErv7ocx1yqwXVZ/SK9Y=;
 b=WrxMX6fXsYfRoQyZOHd8IcoMXA9CQimhDE/9Vx6Se5HBumGnXvIyXFKy
 y66bjJOqWzEWijZzgyPNHLbe/dRNg3MQm6dCyvkPP7vkfGFOhSQtng9/W
 OmiMvKfNHF0P10lEiC5c7oU3k79sdYqjopKoTv737S4ch28iJqYq39elH
 SeTtV0Bpke98hNVQL92XAT9OE7p4QyrnV83FIJ06bYH1KpxlJKVY9AqmB
 srsGSV30P0v4yjxJjQ3R5llCxDbaP5aWuSdamUKjiWEc9V5ZVvIO9eZ7E
 d2EIMtRrnvGOqhEaKSzn7INFFxFI+mN2OWSzFepjBUTOpcf1XNLj4ztWt g==;
X-CSE-ConnectionGUID: kbVUHz6qRHqFuD2e1AN2XA==
X-CSE-MsgGUID: vft9dx8dSxKCbsuGTwCOrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32217853"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="32217853"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 12:46:18 -0800
X-CSE-ConnectionGUID: qARR3eUoQyaiMSGD0YfoUw==
X-CSE-MsgGUID: P8JkjwKZQ7eOp1aaTxk9HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="91100904"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.58])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 12:46:17 -0800
Date: Fri, 22 Nov 2024 14:46:11 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org, 
	Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/trace: improve xe_sched_msg trace
Message-ID: <njljjmdfawoew5s4ryxlo7t4wr4uvqemkt36dnak4ym7wxbjzt@pg3h2ivzh2ng>
References: <20241122161914.321263-4-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241122161914.321263-4-matthew.auld@intel.com>
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

On Fri, Nov 22, 2024 at 04:19:15PM +0000, Matthew Auld wrote:
>Also include the gt_id, that way we can ignore duplicate guc_id across
>different GTs when applying some filtering.
>
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_trace.h | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>index de682978c4bf..d5281de04d54 100644
>--- a/drivers/gpu/drm/xe/xe_trace.h
>+++ b/drivers/gpu/drm/xe/xe_trace.h
>@@ -284,6 +284,7 @@ DECLARE_EVENT_CLASS(xe_sched_msg,
> 			     __string(dev, __dev_name_eq(((struct xe_exec_queue *)msg->private_data)))
> 			     __field(u32, opcode)
> 			     __field(u16, guc_id)
>+			     __field(u8, gt_id)
> 			     ),
>
> 		    TP_fast_assign(
>@@ -291,9 +292,11 @@ DECLARE_EVENT_CLASS(xe_sched_msg,
> 			   __entry->opcode = msg->opcode;
> 			   __entry->guc_id =
> 			   ((struct xe_exec_queue *)msg->private_data)->guc->id;
>+			   __entry->gt_id =
>+			   ((struct xe_exec_queue *)msg->private_data)->gt->info.id;
> 			   ),
>
>-		    TP_printk("dev=%s, guc_id=%d, opcode=%u", __get_str(dev), __entry->guc_id,
>+		    TP_printk("dev=%s, gt=%u guc_id=%d, opcode=%u", __get_str(dev), __entry->gt_id, __entry->guc_id,
> 			      __entry->opcode)
> );
>
>-- 
>2.47.0
>
