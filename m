Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC4CC54E58
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 02:24:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB3110E768;
	Wed, 13 Mar 2024 02:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nesA/9Qd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C35610E768
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 02:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710296679; x=1741832679;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=E7NU1JlL+FQO1+Tjtg5mG45WP0im+vgys6KmnPebZR4=;
 b=nesA/9Qd+mAEPZTRr35NmuuzcnKzlK8VD+8UIOi9Km3FrwEqEHzGEIzU
 WAsyggZerM420NgRFBoZz16iCGMfGDZMiOwzIGj8XiPhSooynTiiTwUf/
 aj4SMWYSWrxb6g8QrE1fUK8ue0h/DmdIjcwv9l/fg+yOJCB3qIibyeZb8
 /9aER7vIsCETfR4CnqxHH/5yWOUFz+mWfO0S84lJL7N5nsRK/8pUWavrI
 xxSPvFepvZbboNn1cOQiwabgg2DjI7DbxyDnM06vAaK9xYOW3l4f6Tfqa
 Ktg9uz/ri6RmY3N2WsTxFEoOASe+MgJwLX+e36wSGyWd5ov8dQT0nO0AN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5229445"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5229445"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 19:24:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11841169"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 19:24:35 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 19:24:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 19:24:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 19:24:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhVi3aSC4m1OMEf54e/HmFrYuJs4d/QPgp5x0H69d271c2aEeO1MoWU6KppAVGze9gAjyNk6AFVUzFOvYHxSgGTYljEPzNUBI0CpdMpHw6hau4WIFpmWol6rMhFigw60Fv9o1bDNCMH/hzvNN1TGZnZGx+ldScHHp+9T8XOdhuNwFjrR6v34ucLp71TTHmaGytcrE3rNQ1FLLu8s9T1AUaIdbfSmXA2+WugfAIz4LBO9kglN7SzGmacZCKk47D/rsjZNZpw6h3i7Wx/fsxyvZUxBJPahNh+ncBXdUBz5//CV2bKDwrPnMS/Yp2VRa9x+iYAIjTWN0rDGemRkF5GMmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVKBQ/hWqpiW7ZOphuw+veyeeeoYFGLYECr40W4s4tU=;
 b=j13tQP2MhenuTWcUGpM2ov/L2eca0L4A2+hBu9n6J8oaBXfvQ8jPdPvqt/CR9ZSaS87gvczZjUCxGn8PELKXWY7wqxbfZ9o9CqJn8+ZZHN1PRAms0+khPGA8mTpvmCPbxNQMInW22zJepZUpqft+inQXyRvkdPLprdKTpgooH3oaYfuY0cdaNsdkGWjEUOgX+OkmkZq17JhCRNPLH711VLqMdx4V4goGTsjcz0jSJXyWct86yQl6iVmlyBchuI7BLyr5Hhs51mlk7k/oUkzpQfmmKEvoMNNLBH2hB8xi5TLi+Ih6o4EejbaDgyJWLmT6erjNIEDVKoktfgZARz96Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4985.namprd11.prod.outlook.com (2603:10b6:806:111::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Wed, 13 Mar
 2024 02:24:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 02:24:28 +0000
Date: Tue, 12 Mar 2024 21:24:24 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe_tracer: Align fence output format in ftrace log
Message-ID: <p5eagsy44hggmngjdspsk5gievsrhehssbcfvj5czy4r2e4e3e@4gkxtcsw6mfc>
References: <20240313014915.1400077-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240313014915.1400077-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: SJ0PR03CA0195.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4985:EE_
X-MS-Office365-Filtering-Correlation-Id: ee2f2163-f8ec-436d-73e8-08dc4304b566
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4A2QuqMVNCg15tZyXAiXE7Ks6mQGfNRT+drSfeeAg2tft1ULpuuGWoDi8zf+Zq38l4AANWPV6zNZgA5GPULcsxqaF147QIyBaVlbIihTLcbaZktQP0JJ2vKD2egCCPdWcsRKJhmZm6A/LBxGDkU2NYye8ZTCCGWei6pmK3HPTkS2yzXUOAFou1dHKkfEW5SLBIXTQ/zeEvvGUH3NWIOQNXpxkqzJrzktnovoYe1sMAOLuiJuDkWgwA85pDzhWW4T8Ee2GqJRXuF5CyWDFeVGdKKag89CyILkj9b+NQAXLDHhugNLwsrPQfXx76d3smHpDbd0p4LVViiu53VTnz8KuYVi+Svyp2NcF+FTzr/QLQtcq16Wt+tA0kRc/L1VFJsiGml5ns0ooU45mtFpzzL1oKVe8sbjJfxKGMEh5tlXKBYt0xiK4wHnK31gzYqgPFjYy0bbIxQI+w/MUgvNFs7JTJ1W8hs4I28+FaunW1Hs/BuSfdEfTwK10akcAX3VukFMgRIuEBIExf7LZAtrk708Mx/IRr6obfBaDs/6PX43vjY3SuKKSYijPi2jUInIrXqNOkNK9WST3wWauld8NEijwp3+RtzUYUxJ4tdxAiGWLsB+q+l7oVeAXprhjUOTId9JTmGhlntrvf5qH0m/fQiE7RQva4KC5UOf7WohNh3Eo+8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QLZXSEQfJtRmS9W2PU2wBm7kssDqY3r/tmv1dPUIWuy65kyHPxTT+waroNsj?=
 =?us-ascii?Q?jaxbIGXm821ekvkKKjpDOkXGPcOIpU09jUdGpxNouMglA4HwbF78k/Ciz1fC?=
 =?us-ascii?Q?nJCZqXBQRH/JuU872YTqxsrXkv1Frwu8sAVhDj0aTKdoQdo+T7X+w2Zq7JwP?=
 =?us-ascii?Q?epGzRhX0AIFQouA/TlNGDaaQXGl8XZbbbuzdLMG5DN39I68ArNBq3whrRRlm?=
 =?us-ascii?Q?4cL2dw7E2frphjdH4wGeQDdKYOC9EH0lwHFOJi03mmcPITDejEuyyaiJcLZ4?=
 =?us-ascii?Q?6kr6TsNG6Y5yfUJTKw++Bxqqt056sJzlkjlZtJSGu1czL8H3hlEZ6wuMXoPn?=
 =?us-ascii?Q?BKZqf6083MVU3xIFu+0MvYuKZTfD9knrrsGyKVi5WIh8yXFeB1e/xAPXagOd?=
 =?us-ascii?Q?g7SLWcEOGoW2dM5e5a4SYap+cJgt8oTyHAi5TJrb1Nqvex3bkJs+NIet+Y+6?=
 =?us-ascii?Q?YRGL4uZn4/Kq527IzPrEJqsXkM59k37u+SsZQMOzFa7eXF5KAYmHgmWOLP4v?=
 =?us-ascii?Q?HKq1tImfhQG+6Ww0/I7/wMETA8TFGot+F2PPaGXEphUuauO90L5Pjkm6QZC7?=
 =?us-ascii?Q?5bdvcuF1eTLNZLkixqGNhPkphx+02hfgB39w53CxVbnIn7yw4hf1rfR/tly/?=
 =?us-ascii?Q?I69J2ojCDe8KMytqc548OAEhd0/wHEVq4PEF9c6ZGDJFx6oPYBLn3DaV5Sgh?=
 =?us-ascii?Q?l49okeFA6jzCLoVuQXb2O5u3I+eagPKreXpXNh6xzrCvzl7lhoImief1tRsM?=
 =?us-ascii?Q?MBW2Bz2kjMY7m5kgREA4CzViKJVLX6KJFMtpiudh90gwxHcY0MxXyRxUsNb7?=
 =?us-ascii?Q?qLr4wOkdBrdRUgsHnnTg5EMI7wGIIqnCjPy/xE5/girDc/pnibvCWxyjIL5a?=
 =?us-ascii?Q?dovvN6vqP/E08v9IVaWFKeSIoBBsGV+1mtc4p3A6mPHKvLVIEzzs7llmFOz3?=
 =?us-ascii?Q?45Y4ySbB28Dd/iUv7wROiP2Z9XrHtVGBxGeSs5wBRQDlrG89P+GUiPgClyoq?=
 =?us-ascii?Q?mko3QHnDHLWCgG4HalCnxMFcm8JOUPBnvZlwRy47+ieeU8+q9i3HJZOx9PYk?=
 =?us-ascii?Q?JDwDTAJqtxaKKTTYQpA0kVLfpjOgj967l1iNsWkSlcdXGq0/f6gbf2hSMVET?=
 =?us-ascii?Q?PDgxKeMPTVFEc21D5LSSbtrHwdwB5V6NXjjdMHP1nWfHZZy9q3czeq4hhRyn?=
 =?us-ascii?Q?AVPEs3ZtdHkIi9I7tjIbw4Xz+qDW7UITMOmJotT6dijoYAAViw6i/flaz7I0?=
 =?us-ascii?Q?W35O/SLbJ9Zl8p2J2UgHjsfIt3NWSSSe+Rd6ZGPvpP4PhXCAO7SfKcF9KQ6l?=
 =?us-ascii?Q?FMR43q1K7RPAMHuA4Lt5ldxit7ktVWrbfNolEvjq7H0MIqb94rkTd0UXmOe0?=
 =?us-ascii?Q?ubXg2OAO/ajEw54JXFls+MMa/83wxodDNP0TqpVlyOVFnRLYNnzi7MGNgAWW?=
 =?us-ascii?Q?XKtsBu02Rxs3juUsOjSysJd459eaEpn0ZnJNY6PgZJmRaT7PthRC/7U1F2IO?=
 =?us-ascii?Q?IG1xrRQdSQ3PrzMG5Gwuin66p5NmTO+VPlU+wJBgWKA3bd7QO8kofWdHrGeG?=
 =?us-ascii?Q?EVb+eWIGZ2tJVsS63we/NzFJQsPBd3nkgEIeZ7vJF0gqUxxNnSVmtehUW+ZA?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2f2163-f8ec-436d-73e8-08dc4304b566
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 02:24:28.3598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +yiOBSouv702gZVAMuGUcflIc5xtG8SxuCdRbfF9WAlJpxp2HpIAoOTf6jzU9EsoQ+nndVvowBKGmU4RCTlGsBzcQbSVsUh9FfXyvmWePB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4985
X-OriginatorOrg: intel.com
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

On Wed, Mar 13, 2024 at 01:49:15AM +0000, Shuicheng Lin wrote:
>The fence print in xe_gt_tlb_invalidation_fence and xe_hw_fence
>is with "%p", change fence print in xe_sched_job to "%p" also.

ack

>Add the "0x" prefix as the "%p" is with hex format.

nack.

	$ git grep -c %p -- drivers/gpu/drm/xe/xe_trace.h
	drivers/gpu/drm/xe/xe_trace.h:6
	$ git grep -c 0x%p -- drivers/gpu/drm/xe/xe_trace.h
	$

even if you change those below, you are not changing all. Let's keep %p.

considering the whole kernel, most places don't bother with
the 0x neither.

	$ git grep -c "%p" | cut -d: -f2 | paste -s -d+ |bc
	22288
	$ git grep -c "0x%p" | cut -d: -f2 | paste -s -d+ |bc
	1727

for numbers, rather than addresses, it's more 50/50:

	$ git grep -c "%x" | cut -d: -f2 | paste -s -d+ |bc
	33209
	$ git grep -c "0x%x" | cut -d: -f2 | paste -s -d+ |bc 
	16502

Lucas De Marchi

>
>Cc: De Marchi, Lucas <lucas.demarchi@intel.com>
>Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>---
> drivers/gpu/drm/xe/xe_trace.h | 10 +++++-----
> 1 file changed, 5 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>index 4ddc55527f9a..9214c6add766 100644
>--- a/drivers/gpu/drm/xe/xe_trace.h
>+++ b/drivers/gpu/drm/xe/xe_trace.h
>@@ -36,7 +36,7 @@ DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
> 			   __entry->seqno = fence->seqno;
> 			   ),
>
>-		    TP_printk("fence=%p, seqno=%d",
>+		    TP_printk("fence=0x%p, seqno=%d",
> 			      __entry->fence, __entry->seqno)
> );
>
>@@ -258,7 +258,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
> 			     __field(u32, guc_state)
> 			     __field(u32, flags)
> 			     __field(int, error)
>-			     __field(u64, fence)
>+			     __field(struct dma_fence *, fence)
> 			     __field(u64, batch_addr)
> 			     ),
>
>@@ -269,11 +269,11 @@ DECLARE_EVENT_CLASS(xe_sched_job,
> 			   atomic_read(&job->q->guc->state);
> 			   __entry->flags = job->q->flags;
> 			   __entry->error = job->fence->error;
>-			   __entry->fence = (unsigned long)job->fence;
>+			   __entry->fence = job->fence;
> 			   __entry->batch_addr = (u64)job->batch_addr[0];
> 			   ),
>
>-		    TP_printk("fence=0x%016llx, seqno=%u, guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x, error=%d",
>+		    TP_printk("fence=0x%p, seqno=%u, guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x, error=%d",
> 			      __entry->fence, __entry->seqno, __entry->guc_id,
> 			      __entry->batch_addr, __entry->guc_state,
> 			      __entry->flags, __entry->error)
>@@ -359,7 +359,7 @@ DECLARE_EVENT_CLASS(xe_hw_fence,
> 			   __entry->fence = fence;
> 			   ),
>
>-		    TP_printk("ctx=0x%016llx, fence=%p, seqno=%u",
>+		    TP_printk("ctx=0x%016llx, fence=0x%p, seqno=%u",
> 			      __entry->ctx, __entry->fence, __entry->seqno)
> );
>
>-- 
>2.25.1
>
