Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34028C7EE31
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 19:01:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F036510E089;
	Thu, 26 Jun 2025 19:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dMbu7V2x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47DD10E089
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 19:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750964509; x=1782500509;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RIYoCq0jvlpDCRsUz2EZ1RLMe1+b0c26kCTtDHRG5N8=;
 b=dMbu7V2xTKuKN30DLcMLx2nxyBmzgY3/Xkwc/TdS9zts9WYcI8mIBWEr
 5r3o803RBncFw7xEBN7ZX6n00EPjVJBaDtJQ/udputDPUENyHmsqOniX2
 cZz1QOoFp4g1TMsI31dtvlAM3WVeb8+sxUPYjdDkC11YfqxOZ7hxWjyVg
 RPka+Brxw9W1yde/IDQ1BfOy7JPyBTqoDttiIqUeJOC6a7tggYS2ZW8xj
 vfiVoKVEa3txio961hIb0obYVTSXiZgO8mOCG2NSbSo56Qg0ZqNqlKzwq
 QrICzdiJp8t1nfUFTEdXk1fxY4ZpOVzwPUSiocB2D1pU6ab4Mxpxk2GSX w==;
X-CSE-ConnectionGUID: 7Tb37+edT0ilqloUtIzSwQ==
X-CSE-MsgGUID: 8EZ/1YicTYuCDLDP6ZJ2BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="70705139"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="70705139"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 12:01:48 -0700
X-CSE-ConnectionGUID: gxb+QL+tThyPly0ETTOnoQ==
X-CSE-MsgGUID: +4nmhDFAQW2DB6+riKZgLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="156626063"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 12:01:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 12:01:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 12:01:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.84)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 12:01:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SmeLs3D7l5TJbOdlDtg8VfOPa1lcRSQ9YezeNlwPUS2QjJM8FK3ktF9mHBEraRvsO0asrsbwaOcjwQ+Ih+87FvnKulXIaMMYgHcNnB+E7GutnrmLJfAgvGzNN+bbsvMxrBJZztSeZJzptSu+nTsX3pY1s8uHCm6Xjwh/vURafBsH2vwQWg0S6IawlQgRdNnJZkpe1q5AHtr06puwie6m3l6jCInLrEYsyx9mRL/r7nMyGSDpjwxSE50F5F4zzRC0163C6ldPoLgR/y+5ETyhRfC78+Fdqh9wB/aRHetORswwxk3ERHoZazMuxoep0jl4R1ETfLQgdsuoTEsgwzIfNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0m9pOzJVXiMtadZWmdHO615affoAIkjiMmMT8OTN3bU=;
 b=FHMPc4CxAHZSydQwi6YWHPs2ZemSgj1wmENmaAJoezrOS/en8BW8XIay06rP2pc2nLB0hscOvujEv6hfyKVwGzrwKGcqnWOEbgXk/D9TqomG661bf1pmgY+vvj1/4u5zZA5QBwzhd0Slq7VCrmSJz9F4Ll7V3xnfi5Qys7QwGDjxwGrizC5PkZQRE2e0TYn0UwDTWrde9r/G8Lirlfyb5VeqM9Yy31aEU1H5aPp56FOflO4jzmW8bDoE4gxK9BWbBPXThjC6C6g1zk5LYHXZDQOZW9jnInKK8mLfSLbdPvp95tk70igAu/nasrOSKY6W2qchZXyUKcpglPldp0pRJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7242.namprd11.prod.outlook.com (2603:10b6:930:95::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 19:01:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Thu, 26 Jun 2025
 19:01:41 +0000
Date: Thu, 26 Jun 2025 14:01:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Julia Filipchuk
 <julia.filipchuk@intel.com>
Subject: Re: [PATCH 4/7] drm/xe/guc: Recommend GuC v70.46.2 for BMG, LNL, DG2
Message-ID: <w6mkzmvjafmu27xayamgcjc3g4b4dikvkkvw2hh2v4owia4efx@fsudr6jlf74p>
References: <20250626182805.1701096-9-daniele.ceraolospurio@intel.com>
 <20250626182805.1701096-13-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250626182805.1701096-13-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR03CA0248.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7242:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d19644f-cc49-494a-5a8f-08ddb4e3e2eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LQig2A9kjrYbiSoW3OaZitWnF8rs1NUBEzanYRO1Kpxculpvf0yQFzSYDy7W?=
 =?us-ascii?Q?csq+4gOoQ/9AB11Ao8JIz+zv8qyja9qycBDQCanwsRh+gU9aDop7WMudk3Qq?=
 =?us-ascii?Q?gu112FNtFfKmYOdWFOf2BQHs9rPfdaAVtz/b1QgeRtdQOnhW6jnQi4K7kizw?=
 =?us-ascii?Q?49YcgLg0MdC8rXihBhCS7f0Vh80du1cZb6AIofeDScvIlMEv0VTW2ZQes/fV?=
 =?us-ascii?Q?CZ25q7nKXteeszKA11Jf+tQdyMaIsfwjh/byXFyuOp9geilQ8EpsngvXUrTh?=
 =?us-ascii?Q?Sb9XpFCxvwtF+V7jpj33hhjnvqX82dfeL9FTKTeLUUZ5CV6V01vNR5JQUvuD?=
 =?us-ascii?Q?PxApsioe8MNmH8imve7F04+WCo+NMRVOfQs/+/GydPhwySIqrEE55CUmEbqj?=
 =?us-ascii?Q?k7esrnIYVKvvgjJcSvkvXwerJO2bw4jCKIQ+Xg27A64/e2mKh31STwdXXvZx?=
 =?us-ascii?Q?g+MxPyTTE8Nobi+jeqVZBF94Ei+6AMhJsErkpiIojRTITHz7cuWIggiiZN7a?=
 =?us-ascii?Q?kDZYWU7RnNjzxFwVDfSLxeWZop2XYklSeJgpyb5TLquT6zFLcE9mOHgGE7QZ?=
 =?us-ascii?Q?x88YK7VZ3oTQd2MYfFfIznYu15cr137RlRJAuJqUMhJc2YNp4RQazOsRbIXK?=
 =?us-ascii?Q?LXR1OS0DBmjhqmKmYS4XAz1APWmeELPV23jGdY+QgsiYOQIB827UVurP5brp?=
 =?us-ascii?Q?QlFNRxMP5qZ3uZ7KtXhKG+nNxfGfE0eBVfAR8BoplQoSo7JOTcQByaDC+SDN?=
 =?us-ascii?Q?wfZc8o8yFCF+ltNOPJhBqSxXGgZm1XgotTMT4ZDF0R/rzJgIgIf1NcSXdQim?=
 =?us-ascii?Q?wcZVqb/PzNJSyIBKGv34JpGkfZ2gxpZ9HBXFDjxJWHmyCKHVcn+0qxtV1zQU?=
 =?us-ascii?Q?iqnqhoG4yVSlB0+/y6LPtHWK8xS5cWZfDqvkFHqEjxcab1pUrI2AxdK7OuBH?=
 =?us-ascii?Q?mAHg1o8MpZS8+2CtMlrXcTvFtIg/4kj5HxTVRJnz2j47W3TjHu74QoViL49Q?=
 =?us-ascii?Q?AHsGverxtj4DZ7N32HCMhBoVRya5UH6tcB5rWUpdvFu7+N260FzWgFgo6yN/?=
 =?us-ascii?Q?sEnxQvsPNR7Qn0F9h4zn91C7vj3i5eRl6e6LqLPNxZCv7qfW02lLb53ypUBx?=
 =?us-ascii?Q?uM14l7gZjl+QZwQj2rlTPqsRVHKlKQ0u1SOVSZ1zI/unl7Dc87fL9LxI+w2N?=
 =?us-ascii?Q?UucRMiq0Kvh7sUpkcplHVMIElM1daE5B5No1QcdgdEz5eDLO1XYfk1pQCx/w?=
 =?us-ascii?Q?3DRRPSa/G9OfJWJvzQWbkR74qQI0iBoVFrw8+UX3aAXj3hkhUFrvKEbUsHUL?=
 =?us-ascii?Q?kkXVj7Y1qTR1ddFsZ29dODs4ML0NzjF6hsL0qytcFIYRWgv1gsWWBs8X1sLn?=
 =?us-ascii?Q?0uNsovqNZdCCW0FscfApb/zHRWeXpV3r/ESogcVU/SVYlMJJ+w5jugVgMcAG?=
 =?us-ascii?Q?Wsa+9+T9m1A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OwrgU3rG2vDs2jpdOTz0JXG/SlX3ofrEhJqQPcZPCwNQbbayWfJUKvIvxnzn?=
 =?us-ascii?Q?4fxizMqNez1/Z/6ku/AzNmCV8UR7dTBpCntCCKQNBOW7EV0UbucORW4aAgLf?=
 =?us-ascii?Q?EB3juaGWt6g0A1khlVt38uqqHxKu314BbF8cIGAXfQxiWcCA+w8JV5GXzz6n?=
 =?us-ascii?Q?JRyW3PXCfEjcl96nEk1pLniyq8493XWT0OqWp59hmsGAECzubf+PcetMNvsd?=
 =?us-ascii?Q?r07t/59ojlP3ZECtlDhKZdbBsUVjXkQd0rGrp/fCxsyALRqVz2N5grJPjoG8?=
 =?us-ascii?Q?Vv3DMuEfiWSznkop/4wqOCyl1ZHB10jga7KW2mWdS9eym8voVdQJDrVo5cWR?=
 =?us-ascii?Q?2ZqhVGwElS8sKmZmOqdplYsCVcKYyVPLynnxx/QFpOYnKwLEl7dW9INe6euo?=
 =?us-ascii?Q?ieKv3oMi+WF9us9h6WEp5Wzp5H+hEA4vprSCJVUZK/1pr8N27dS2iGw0RjLy?=
 =?us-ascii?Q?sLQfYT8mvuIciNACWV8UTeR45Zd7yI7+KOjuK8jHdhGed3hf2wIkM8//vbJ0?=
 =?us-ascii?Q?+jt7DHIYMFN8XOFK2KnW2yHqTfWjtwZ7z5GjZPpm90BidQdEOWthx9NlAg1G?=
 =?us-ascii?Q?q6IehE+qZ2Somf4UNkQckF+FQs+kKTtHydHtqVgC8zvKaKxmwoQTHGUGpMsC?=
 =?us-ascii?Q?p0B0E7YpB8CZg3kht/gX7lg2DM5P07K06GJ9062b5K+wdbOyjz2hyrPXwsZG?=
 =?us-ascii?Q?uB4w6rU01IfCfxEmRHJh7+SBx4J81mXJvQjmTdDaxUTfg0/jGAC/wXLUzE/S?=
 =?us-ascii?Q?bF8ErRmjTlLihMLY8pZHJco5ZDgxyqgsAu4o4H5aDkCGG33MnZ+5encP9pPi?=
 =?us-ascii?Q?3KAE0mLxBZcDetNfA2XMxIcK9DnqMeuFLRxXX4eLo0wHfVAsCOYcNc1Zhvl6?=
 =?us-ascii?Q?vF8GEIijNpsMtx7vBlkm0YffPpS50bQQfv1LeC4zZYWw2Hz6OiBk6kBar60l?=
 =?us-ascii?Q?em/0ekxZtnUHRguuA4rZbRcsOexxJ4FPe7WNWgMKs1ytD8iRCRUC4JuFb3ki?=
 =?us-ascii?Q?NEgqmHCcLTIzdfLLk3DFmObF0gxxxwLviOa1frkXJTNj5YVOgIWQxJazLswM?=
 =?us-ascii?Q?mvlz2xbD4yxhukAiGkRYMg8bPtrydXzyQzZ0fryUR5MNJdVC9HW0XeKc2LgF?=
 =?us-ascii?Q?Xz1I54xvZDtmAkQIa598Ao94BE4N/N6kLoy0eOWRcZyQCFm4UlhIHPH23F+3?=
 =?us-ascii?Q?5PQjVCDMTGgHw9NsrX6WQdbdrs8tI/7jSd8F/+8vhWxbeB1RJQtoca5jA3u2?=
 =?us-ascii?Q?oGzAzpXuo0urqrZHDGE8Z6PWs0teDHJuNYondUXjrQtfGbSFgY07zgWC1ReV?=
 =?us-ascii?Q?Sa3QZ3VH3Ws0/gHIvZFiDT9QuRuSw26XYcWocWPBINj7gPSzxz62MhNeQXa5?=
 =?us-ascii?Q?qVRM7hFyOVQgde3vUzKA6yK7rKK5GWMLPCKxX6MPWzpnDNAz4PR5Ud5aLsLI?=
 =?us-ascii?Q?4GmvRbORl6mO1RXmFm0elxDQUIZvIRcZZdji+R7CzDup8qMogvmEZcwYcFnX?=
 =?us-ascii?Q?aiJWoFIUdS89W4QnzP/ZoFh1E94ZNAaFQ0fsmwMRaVMgBcWKMvdvlnLYcdYG?=
 =?us-ascii?Q?sOVTxIHO2LSYBr56AYKGavwk1iOHzL8H29GJArCBiKnyVsKCVwT9seURiSfw?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d19644f-cc49-494a-5a8f-08ddb4e3e2eb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 19:01:41.6183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S74dYLkT7/XBaaOzHsIurpJ+2ftMJ18DD0XBNeY66sSM5WKmhgy5dBKuORY2bPGCx0wSJB47PbhEjiMb01hydCYe2MBLs5RHT/664YaEXg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7242
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

On Thu, Jun 26, 2025 at 11:28:10AM -0700, Daniele Ceraolo Spurio wrote:
>From: Julia Filipchuk <julia.filipchuk@intel.com>
>
>UAPI compatibility version 1.22.2
>
>Resolves various bugs. Recommend newer version.
>
>Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
>Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Since you sent this patch, you should also have a s-o-b.

The blobs are already applied in upstream firmware repo: 53796829da2d
and 247c9f3b5f99.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index 6d0869518652..4d3ace56f38a 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -115,10 +115,10 @@ struct fw_blobs_by_type {
> #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
>
> #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
>-	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 44, 1))	\
>-	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 44, 1))	\
>+	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 45, 2))	\
>+	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 45, 2))	\
> 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 44, 1))	\
>-	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 44, 1))	\
>+	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 45, 2))	\
> 	fw_def(DG1,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg1,	70, 44, 1))	\
> 	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))	\
> 	fw_def(ALDERLAKE_P,	GT_TYPE_ANY,	major_ver(i915,	guc,	adlp,	70, 44, 1))	\
>-- 
>2.43.0
>
