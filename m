Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DF6D64099
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 22:57:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D77510E29E;
	Fri,  8 Nov 2024 22:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ut5x+dHU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8831510E027
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 22:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731106661; x=1762642661;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=txaGIraXe1gXHMkL5nx0WXdHt7mNl83uf/uNb6WEwuw=;
 b=Ut5x+dHUEofui3Ii2xAoQdSRm4B/l6YAy2PC15/24Rrz4b11TlgK/4QB
 ZV0eLbCX70SdwPWnlnSJ6cgGpbJNfTSbYAwsNH2dhaqekwrYRwyCwhix5
 KIoDsBj/4zB4mkDOM+m6k0of0u/A0p+zxfEUumFLj7B74j3drCEuIDvMy
 sjRGOAbgNEiUHBvimSUmUBysAtIa+zpbn/gaSwH02SjT9C9sodWxuYQyK
 EfY3/27eTSmnUcaJrE3sWaWRox+FDKBD3/3Y1BAjm11wjH5ndCGrKmV4J
 G6nTdHXSXB2AZAyFTH7uHLS1v6iexjGjEzrpFT1hXYru60m+//4g9UJQY A==;
X-CSE-ConnectionGUID: JsK4kMnCSG+sSHHqYwtD3Q==
X-CSE-MsgGUID: JFre7B/+RauLFrIogdAGDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="30419233"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="30419233"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 14:57:41 -0800
X-CSE-ConnectionGUID: pdqs9iE1T9qsNRes5NdmkQ==
X-CSE-MsgGUID: I7LYIWTPTByjGsFDTZGNAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="85774514"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 14:57:41 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 14:57:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 14:57:40 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 14:57:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIIeMa+QasvW+9wHz1AiKpYo32lSnxBpi2TuqnbtLACZ0o7kLD6DgCRyz/Rj1WbAkNdA8w8D6nLsf5qRS8Bl3Okr8U0J5MThNaguV733evegFs33FFYsBqTo0MThbfxR8WokFc9Kq1aiJ+AqoIxTFJ6yb41xTn1DT290CFX+UeF7qgSHL1MTWUFdiS1+DoEdzaCIIOsXbUSjva/FbnhMQmED81G11Yrb0h1J0a1a2nzn6bNIRS13cYOUFclKsrsR6HNNdfT17SICocNn1Sy9QPSlJqeTOLmkYA4J2S6JN030i7SQa6fJ5i1x42Bc+LWjLHu76mdo8Yrxfb9Z1vKoQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GWQrbCoamL69hG+Lwii3JOqk9Zb/JoojoUbtatw5IE=;
 b=mQ2IcRjTrz2mNJLPcD6QCTj933t/BsLauEM9IQQLJ9j/djLnyCJKyWx+k/PQlQQ4h8FYTbHYBDr8W/zSavCuDhXgRBHUjoOz5FRBKOGmH1dQNdUGacy4BhEkIyn9Nqw/OrMpckrKHRrD1rbvlD6rp2RHkrKj1HQBKLRZ1UB2fSqApxwGjn4jNOO6+KbT90iPwMslXxVX9XivrnirUSu/tFwrjQxEV78dLrGuv+6JdQ8FdyIT8Pu3S41rme3rSw1u903Ex3y/rx9rnMExLYt0WA+569eIIB60iNykrlzK8FfHEU5XQ3fvfB56kSDNg/5LUtl+IcX+2NISPvwap0TY5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6290.namprd11.prod.outlook.com (2603:10b6:208:3e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 22:57:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Fri, 8 Nov 2024
 22:57:36 +0000
Date: Fri, 8 Nov 2024 14:58:09 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <alan.previn.teres.alexis@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/7] drm/xe: Add xe_lrc_is_idle() helper
Message-ID: <Zy6XgXEX0E7EtQ9+@lstrano-desk.jf.intel.com>
References: <20241108174312.272792-1-matthew.brost@intel.com>
 <20241108174312.272792-2-matthew.brost@intel.com>
 <fb7bc882-f802-4d8f-afdd-8f03a73bc3c0@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fb7bc882-f802-4d8f-afdd-8f03a73bc3c0@intel.com>
X-ClientProxiedBy: MW4PR03CA0251.namprd03.prod.outlook.com
 (2603:10b6:303:b4::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: 46cf4ef5-f905-4592-5c1c-08dd0048bd16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l/AlzLWvsA8YBySWqe267v9g5PLrRy485/rmMA6UYA4yXL5Iuko1/a/2QW3s?=
 =?us-ascii?Q?alT3YIC+k27LNa4Zojb/US7mRI5wc5Am4yVrrpdlPWJPzBYLO7OsqhayFWBF?=
 =?us-ascii?Q?n7edaoZbpZX4tNPivZv26TgV2V8PgAo6zVklHoVoQeiVeW2gxwUEYIfAEC48?=
 =?us-ascii?Q?vaOmD816zVrXljMlDPa5v++I6emFkYJN1SFNiHcZrQRF+Eqd3v2aZDwamZ6H?=
 =?us-ascii?Q?9lX1io90cQ3R6fRunxu+Ky0BjLlT28+e4bd7A25OnOe0TfAyO0CYYOdGlkf+?=
 =?us-ascii?Q?ggL7Kgv6WPgPKH7RYFVmX0HUf+h6brnArE4iXg90UXdcfipzRx4LN3sc9FRc?=
 =?us-ascii?Q?n9ay7LmYcOhXjXar9pLakFKP3pX+YZzgRax0dygjuJVFREAI6YvoRCOMukkL?=
 =?us-ascii?Q?tB16i1IcI9iQM+W1IWmhKFw0zj4pPhJMUqW0nGnZrMAYLsle9mQc5QnnxtEi?=
 =?us-ascii?Q?JRviO2MriiFdfFpu8SoKHMPJDSjzcsJ3D2aCpUdG+fcCg5qMjuM+6tetSjvD?=
 =?us-ascii?Q?M/0y2126ccN7nPqXsvflR2OSvsZlyLhjssDYwA2VtDtBE8W0TOmbl0sWJpvN?=
 =?us-ascii?Q?rDAVxZcos6ZtpdqINyONj1WWAttbDXcdK76fJTCwbitJW1itHGUjJP4MaP+8?=
 =?us-ascii?Q?eGWPuy/jwayAI1FhDIrG+x9XB2OzZ1t6HBq6XuiBvjMlZj+kkUARTBfHVW5S?=
 =?us-ascii?Q?yHCD6fDTHAWiz2nC1nrspV4oe6G0y6ld21XyK2B5lW5zntOW4Stuow4h48nG?=
 =?us-ascii?Q?9K3RMexN22iRiJIDVD0WkPs6KViwDIC6zzbuI7V4mvZfwu4qOa+8WfViZvYK?=
 =?us-ascii?Q?IW2qRpgucvz+H4t0hlqudwjjSWvakoKgl7wRRhks3QKvxCp+ghhE/DX7cALh?=
 =?us-ascii?Q?7aY/Eaolzy0vjnVZQgnBJndkRr9VZO0vn1c+eXLCj47HrEjkjVk8K8OywigG?=
 =?us-ascii?Q?vOupVGwgOfODt497GA0ZhguOfMJn9PQ39SRX1lriwYXXINn0744kGCEjeeqp?=
 =?us-ascii?Q?BMYSfzqPZS+vqwpdrnCCdrtZ1eXRtCzaNPgyXowYTlSC0Eo++680cOqHFEZf?=
 =?us-ascii?Q?qgyU1etAMqOVmd4Yh3RyxU3CRzvosXb6RzFFiz1xp02p8zAJ0vv5uB+q0Y5f?=
 =?us-ascii?Q?zaxFYmMdkddPAAwRCBqiz08eFT0z+r3aHLwGVGkV83PUmG1L7JKkhva+AjKo?=
 =?us-ascii?Q?2rYflwDrseiNGCOdfLWrnEv+xLoYNz0A2AHLv0vp2ytc0JziqIc7t36jHr7X?=
 =?us-ascii?Q?vq4CQBluzmPBIuy4We5JRgXPuhCRII+sHJdnK/Pfh2FBq5kjS+c2y86B0tCf?=
 =?us-ascii?Q?8f50qrYv+5c55LlQsdGHhzgF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f5SHiXIbzCq4tTBxobGk8KOcQ5l9madY5KRxrMOTnqWT24qNMz5r0x9+R5dW?=
 =?us-ascii?Q?ZND40t/TI03XE1LUuOZ11RZc3JLUlJrjsaLezSZ7IZpnR0N/KdCKu3GY4RlN?=
 =?us-ascii?Q?+Tj3nGz0ucgIHy2W5K/L0ETtS1aUBPhHLN5z1hv37wN8liohhqUBLpHSrVaU?=
 =?us-ascii?Q?lVZt03qim77RszzJGaARYd84x3y2P55DKtM3Kd45XgnTtbYR0ksv4u1Gqva1?=
 =?us-ascii?Q?5IOPtEC1iWspQvPT3x0OZAesUYpORYz1AUxrkH8dKG26u41sI7XBj4UIwVMo?=
 =?us-ascii?Q?UpjZ/DWQ54fis1sHzrabnjyAhE2UgaamhpG7yUp36b4bNvruQmACWJvq44Uz?=
 =?us-ascii?Q?DKUVEsp1vno87vKylZIsFsAXKCkMa9aA/RUvaBO0GLND4t9RYfyXkdnqfwg9?=
 =?us-ascii?Q?Q21nYxc4Bji02jhD5MkPyGNWzaYYu5nwXtlPN6LpRVZ/NYcSd9eKALHlgyp+?=
 =?us-ascii?Q?OSRmyhxIfokYkjef73kuLNohexUxbY1HleLx41GOgZ5R+mw8I4+9kan+5zG2?=
 =?us-ascii?Q?iZtCpJ6pEG40N+1obXT8c0kelPZcadlyMMkfzN7jIgi1T7ZLzF1QYGRbuWqi?=
 =?us-ascii?Q?qCR+KlDqRSM8xjDRO5btHJ1MGFfDv3NMcBzdwRS4L81IWX7lMjv8k0unY0RU?=
 =?us-ascii?Q?6tERKx0Zqe52AQHydtr1kuPlx7DbbIP2ikwheWUwaHpWDy0aEvBGOH0/ZQi4?=
 =?us-ascii?Q?pIkbtgfyi/+Rx5JkbpAEyeCFc4wv3yi3rz9ayn1uhFcChpMJgN9N5HhYwyUY?=
 =?us-ascii?Q?61E27jjWrYBdz/9WAeVIxRTnSwZ968QDNHZF8HWCH40j5TDdvLVGLQA+kuF8?=
 =?us-ascii?Q?CYFOq3ABymunVvVMlafG5ENJWm5ppgLhvbCa9khcUFzQYMVOFlcykVXTwKy6?=
 =?us-ascii?Q?mO/uTRhm+2pnaE616L1jtY6IkuS0fmK87i72rKZhbclIdCHs6U+l7+hHClG9?=
 =?us-ascii?Q?BE+wOuXqj9YvZnwBERYcYJCErfmtFxhsT+I0VJP/wQSjqmI47kHx3U+j6i0Y?=
 =?us-ascii?Q?8pOQWFoZJT9XOrSLQzW/uFwdDX+LVOYGel/ZfVJT+6VqgVPmDD9VDwiZIJbd?=
 =?us-ascii?Q?5lyvWEYRcQ+MTCOOUiezNFgI7JxLu5n0SgldE12TFHQQJLj2t0kLltGSdJnR?=
 =?us-ascii?Q?8jIW8rkp5qViR0y0MbeIY11C2QNukoWU6+KTQSD5ckZho30FkmCV8+QKO5DE?=
 =?us-ascii?Q?DGjI9hE9E03jtTh5K/jtfeuyFEXRKh18I4ScFl+Izm973A1hcEdg5ios/yIs?=
 =?us-ascii?Q?MgnwXYOU7B7ZG22Rwxj8xbOldGtivyuIWJdresjjkINAjKx49JyCvvS+P0hS?=
 =?us-ascii?Q?dvGTlWW5DSp9V5GWoErNMuHjgHzQntAKRRh1scJLc2hrytfOwrGPpWASPu73?=
 =?us-ascii?Q?uWVIdePoo5eEa7QSdTNAMyji/IsDej2YrZLURzw67nfavFZMjdZYOQiWRHUV?=
 =?us-ascii?Q?lnLWRp05jGNmxuhNhugplKK1o84vob6iUK4iCDHuw+Mlejx6F94sPLA0d3uy?=
 =?us-ascii?Q?0p+YZ8u0RetIlrknb+gjWY8O0tH0a/4iLeton9BEU4ZCXnGorBzfmqo2BoFe?=
 =?us-ascii?Q?2xMBqHT+dwi8zM93Km3B3pSEDnYpdQN4BlV7WQ5kiW16jT8AYFxEKmThO52o?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46cf4ef5-f905-4592-5c1c-08dd0048bd16
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 22:57:36.7839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cCmnVDSXdsiRsjpfDwkLxlfqgZxBeg9n5LowDCWCT6ULJDZdlK2i/TFyaddWNF1FQellfHsGDe4BbSlqfZrIfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6290
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

On Fri, Nov 08, 2024 at 05:06:21PM -0500, Dong, Zhanjun wrote:
> 
> 
> On 2024-11-08 12:43 p.m., Matthew Brost wrote:
> > Add helper to compare ring head and tail to determine if LRC is idle.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_submit.c |  2 +-
> >   drivers/gpu/drm/xe/xe_lrc.c        | 13 +++++++++++++
> >   drivers/gpu/drm/xe/xe_lrc.h        |  2 ++
> >   3 files changed, 16 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 9e0f86f3778b..e7257c681278 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1705,7 +1705,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> >   				ban = true;
> >   			}
> >   		} else if (xe_exec_queue_is_lr(q) &&
> > -			   (xe_lrc_ring_head(q->lrc[0]) != xe_lrc_ring_tail(q->lrc[0]))) {
> > +			   !xe_lrc_ring_is_idle(q->lrc[0])) {
> >   			ban = true;
> >   		}
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > index 4b65da77c6e0..e219657535cf 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -1763,3 +1763,16 @@ u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
> >   	return lrc->ctx_timestamp;
> >   }
> > +
> > +/**
> > + * xe_lrc_is_idle() - LRC is idle
> Mismatched function name here. xe_lrc_ring_is_idle?
> 

Yea, CI caught that too. Have it fixed locally and will be included in
next rev.

Matt

> Regards,
> Zhanjun
> > + * @lrc: Pointer to the lrc.
> > + *
> > + * Compare LRC ring head and tail to determine if idle.
> > + *
> > + * Return: True is ring is idle, False otherwise
> > + */
> > +bool xe_lrc_ring_is_idle(struct xe_lrc *lrc)
> > +{
> > +	return xe_lrc_ring_head(lrc) == xe_lrc_ring_tail(lrc);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> > index 40d8f6906d3e..9d64cedc4d14 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > @@ -78,6 +78,8 @@ u32 xe_lrc_ring_head(struct xe_lrc *lrc);
> >   u32 xe_lrc_ring_space(struct xe_lrc *lrc);
> >   void xe_lrc_write_ring(struct xe_lrc *lrc, const void *data, size_t size);
> > +bool xe_lrc_ring_is_idle(struct xe_lrc *lrc);
> > +
> >   u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
> >   u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
> >   u32 *xe_lrc_regs(struct xe_lrc *lrc);
> 
