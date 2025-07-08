Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A3FC83F09
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 22:11:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4653B10E1D5;
	Tue,  8 Jul 2025 22:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JWHYWmhP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC1E10E6F2
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 22:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752012703; x=1783548703;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=z/QSRQcujpsyjEawizC/4bKyfqAZCH0Jxss/tmgWsO8=;
 b=JWHYWmhPx21BfzuAaUfs87xvm5/SfA9+8leEvrfCTbJziYvJTd4Sba/p
 iEzZagaLF3mW88jGyPihDP5+vymoKcC+ZvBav86GFKTX8d38iZlGMlsY5
 eOQAOXYwwiFRLglXyis0J44MGWZam/io5Ah7CkPD8iX4hR1RQUIDRji2B
 QfCGmREvSo2j7u6Eb0VC288ApENzpH0nmpA9u6RVCa2+DdfWovmOV6QUw
 Gu6hBVGNVfpNUteGqZZZw4CHFzDK2rZ8Hi1hMGJMZYmUGsGRwxlzT73d5
 MT6Ng1dZcXVr1hgngokz2epBnPsWW8NLO/FwB1qYhG5XfYn7KNgJJpJvX g==;
X-CSE-ConnectionGUID: pQQq0OvWS/CFVNehxlh7iQ==
X-CSE-MsgGUID: h/ysMeIeSMWALYh4pdhVPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="58067237"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="58067237"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 15:11:42 -0700
X-CSE-ConnectionGUID: +CaiXWCGTnyul5BZ+0Y1qg==
X-CSE-MsgGUID: ozPrB5aHS/iTfMKxyNptOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="186577739"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 15:11:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 15:11:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 15:11:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.41)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 15:11:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KzeUAjNVrG8IQfiLPSi9LPLXPIM3T9NS/t+mnjnOw5h4DN0AtcjJE5jF3YmAhFtmjcQx7n825HI0ZXR3pI3p/0ZUCeNIL7fJXbnHWznS6grAIAVRj4ljo204aLKpv5m5BAd79WgY1W9fSDB085zkG5y1gqDc/Qi//01eewdVyWzfg59mJafBUnZuYprdg4S3s/eCeJ8VUCJKFWe4k2aY7eifhDch730Y/oNpW2hoiRe+qh7sY1FQqnClz/pFYEFO9esj89HXfS5+8I5NUG6tE+1RVXRHJYi9Vw/TdQlg66t6QLSQkHDTpnQWhseF04O3q8R1e35yater0L2By0cJeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=399wM2Bo0MFyZKXmprXIUCcsc5l0/2GDFe+tEULJgcY=;
 b=Q2fQ1TLZKvQ9sChdKvTKBO8IAbJ4k2xrrIm05oYhOtpaNkeTwlCpg40+rr7gJIagdEMRPbRO32djecoapXmbJAP0Zum+vKuIG49cEuJt9Nv/tlz5xIoMV/8oDSvr7anXhrPXebm7n1eWFoYwSy0UZYVVlnMdt/iwZNCGF78ffz+9yVp+4mVa7VCG7TR0480fB2SASwbTqQPnalJP7E6doFqJHlVk/+J54NliJDQlz40zsxtFN7Eti36ZvZJuN3NQwiWWIm617PBV+zo6WfN4OsI3RcH3QNGiK8pqyELCyfHNHOwYQP5VGPsuz89WfsBonJC/AJVf9rQ++ZvNtHuHhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7195.namprd11.prod.outlook.com (2603:10b6:930:93::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Tue, 8 Jul
 2025 22:11:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Tue, 8 Jul 2025
 22:11:11 +0000
Date: Tue, 8 Jul 2025 17:11:08 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH v8 4/7] drm/xe: Allow specifying number of extra dwords
 at the end of wa bb emission
Message-ID: <n6f2fvsjh6rjlniapfjzyumhxhcwpk2ybaanw7vm3tabw4zciy@4yrhtybyesm5>
References: <20250703082059.61597-1-tvrtko.ursulin@igalia.com>
 <20250703082059.61597-5-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250703082059.61597-5-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR03CA0290.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7195:EE_
X-MS-Office365-Filtering-Correlation-Id: a94d4827-5b0f-4752-2038-08ddbe6c58d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HiwJUAaEPGbNbsH45lCpJe/peL+WXb9va9YSLoCZpeC5oub/7dz2K8iM7ZWt?=
 =?us-ascii?Q?+RG+SWQTUsTIeQdf5Lu34a8AVxGtYWGgpGUygcyFN00X57sqKw/owkXTaMb1?=
 =?us-ascii?Q?EIpML97JSoHhNH+XMMryydWNOeBI8dtfCCbEtM9u0+/IoJmdx9TXXxhFekrH?=
 =?us-ascii?Q?E4F52lXs/YIOO+ro6B3yMeqKpzFf0BrVr/XKGPlL15jGOJx42JUd3yL7s2JB?=
 =?us-ascii?Q?/Rgy2dtECwwF9563isnIQK4Qgqs+QF/+KcHi72i1MnQv6ytUU8ySYCbiIc9p?=
 =?us-ascii?Q?K5TuHrapPYoh2lKRDgOgKqBTl+7N7aY2hiD8vCKFe6sT8VSVBRN0r60bmRqN?=
 =?us-ascii?Q?r1VmTlqx+D//4qTMObX1VOEAJmjUCixr+U3uKdCEpQi5vqCrd9WqcMsopGPN?=
 =?us-ascii?Q?8xY6SOOhI4u8vObIhyKTCrFe7EIBLq3zKaekV2E0GjeS/50g/mvs16AaTCAq?=
 =?us-ascii?Q?xfUeyt9+PHVwo1hVNqX3lE3gdaCV00Mi673r0x3x3mhix/3wDqXRD6/Efgz2?=
 =?us-ascii?Q?cMhROxts1vQIdsE+9hrZk8wH1AVeFqKUuQ/MTZY1ar7azIiorUBWg3WVFtjZ?=
 =?us-ascii?Q?+M7Nv7UVBDrbaQWaYfqrphG9fLQcqvo7HhHv27IT5gx1wvV+9J9l6050pzFz?=
 =?us-ascii?Q?1rhDYLBC0blsfRGHrRSg47j+yJxL66Gh8vfpe8XknxdIHqF0ZQnJW2srHNOu?=
 =?us-ascii?Q?jMrKeaC8nlEEnVkyj+hfUNc7n3DaPhUh5G3GokqUG5xmzBLcNQism1gnCFDB?=
 =?us-ascii?Q?14md262vpV1h9H9uO+m3wqQ0F2l3Xn1Desv/TgjkUjEAjJzl55bLcAtuQmwU?=
 =?us-ascii?Q?8E1O88I6M5VY9uOkchHqGRQ4kpyzV+X3AxlA1Li0iz/OMzS0qdt2jK73GaIi?=
 =?us-ascii?Q?PL/82S4gvae3DSbD9JvCsemBfy2C2KoqUkuWbaptcCf6EbXLxvHlZ8nLUqC3?=
 =?us-ascii?Q?uYYL+Nfc+b6S4vezW4Gs7YaLHgWYulNCwEJWHiGVL3xSvJXaOf4T8sKZLX1t?=
 =?us-ascii?Q?z9wOOoyixVJfgjE9aHs21qWgitowqS2+941ZcOaeT5soPXwYFcg1wx4LjjAm?=
 =?us-ascii?Q?/xIG/fvCCo9oP2gqVtTJ5EODmcSM0XzYl+36sNCkJYRfHZXhQEtP2vLExbpE?=
 =?us-ascii?Q?eRiKLRTdWwm++f1QxvaynwK4TNrLgI5FQ6vTlZkVgxdbBBcliuSUfp/HBdE6?=
 =?us-ascii?Q?dBw7mPmLddxNjXsyuDBYlRIvTTgoWrxtu5BZ9rMOKyazHFpDiKmH7AhoyORQ?=
 =?us-ascii?Q?Zb2ukBcZn8som/oHKsDq4f9f4Ja9TtJ8HSPovEBwAFuKX5SmnfNAG7/v+Jn3?=
 =?us-ascii?Q?7E4EuKxoaOElRXhDoXlfnjaq3Xd5c04PHMCKEub6lSZsnZxd8bNAaIcoz0B4?=
 =?us-ascii?Q?2tBzf7Fw34HhUlsLMHCkkUvR9W7kTs9PuJWReHTGexGMp80KNDo7sB4hkz+V?=
 =?us-ascii?Q?jyhMyy0XOT0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EYAH7WRS6ds2RFQGc4yq0hUcgv8lgsBpbG0pSTpE92HFUQH6C/zyX9qVp+4k?=
 =?us-ascii?Q?sYMWWraOSSINyWDg1R3SdBAi6iAdjdOgLjYdPRwVjCBRvNB1Y3VoEimqolKh?=
 =?us-ascii?Q?GtDFbzKQ1FCsAg1aUFoq5O7lKLCRd1QG/uRtjHwt5//dE2uPXVm+DjtnBBV6?=
 =?us-ascii?Q?1ilD/vNeWp8OvBKIGc/VuhrlM7lUHHwXMNM1YDlPCuLsMwZ/mlzx7ZIGJKpq?=
 =?us-ascii?Q?VUuZFz+1CbhxJ+ayit6gzrsRzPJRBzUHIR1c1TVmyjs66TDpfX9kvzrG9E5S?=
 =?us-ascii?Q?3oF0qA6SCT5ANQnPCJLs13WCcaG8/99ghh5FQFrLh/tUz7LCyHwbmaPBPmJi?=
 =?us-ascii?Q?NNrmz8oVPtH0IPoa8FWvh1KiXHhbFaO1HTMZdcDh53asYxmdxxGrMckK+09C?=
 =?us-ascii?Q?eupT7YuzFYvsbZ1cdeBXv7ubP2uy3SsGq602wAFQp/EC1Vgk3nujRx0YrROL?=
 =?us-ascii?Q?Y1jHxtu3hgttBqdrn32TsIqz6wM+G34+87FpJd+Gphz0Xu8cj0F0pGbuwcXI?=
 =?us-ascii?Q?h2mgmMxRla4ol5uhkco996Vj57VcmPMaTKGFCDXTq05Quahyw1nhlEkSAl2/?=
 =?us-ascii?Q?BOswSRP9JPOETenw4ykeFH1jFrT2GVBkPidrlxagy+frjtuLPLbMGriO4HhK?=
 =?us-ascii?Q?aw6YOYvPt4XJfBqXBGK5IQSLY5nIZa38wBdJlHOwS5dalF77ARZu1r78SAZU?=
 =?us-ascii?Q?icfq0/o1aMXE4d/PvyAhv2JrisoNZKtlNNY5aHuyilwXudUb9bxdmBYmDdbx?=
 =?us-ascii?Q?Dcng+5ntnAVoFWBtWOuW9qzGNiaGgoVG09rNufsXkEdk4jTSrpIZeN0IM/PC?=
 =?us-ascii?Q?NeaqzOMPYGsdIAMFy6rOVMUO2HIVto3vSsffUVIUqo0vElRm6CHZjTYtKhUG?=
 =?us-ascii?Q?ClPgVE9jb2DpEoq/EQUtofuY9GziwEtAFwMBUHw7IihhidHL9FOHB3YlMpca?=
 =?us-ascii?Q?guJv9X/v5npioYiBtxdojK5XBLKSdLYioe5G+vwAymjK6u5MZwuSJNLuhn6N?=
 =?us-ascii?Q?lUdKE7FSmXUkcNiq8KkerfR7L2CWgpamAG83njZfW4LkR6yQlG5U1nO0KyAK?=
 =?us-ascii?Q?VMkR2ypyp1XHH6YK3geYrLNYI0O+RoxUP5KOONeHuAPSuCMq0De4dpx9i/+S?=
 =?us-ascii?Q?dWWzk3SjcPFVb9qNn8CBqr8yGjj0KKOH5pUQ0wa9jPVq4+jiURPAEX6G+gbx?=
 =?us-ascii?Q?dv38qemOuPt9TzwViAohbBN170QOoVBp7aDpLTJ2QajDxje2sL4/ZX8ZlmVE?=
 =?us-ascii?Q?X5ibv46LnFkgA4oNzihShXqLZ9H+rvOoAL1XZhVf8zwRKazQXSj+C20nYN/y?=
 =?us-ascii?Q?pw3/qePzxXy2DMUnuEb1wV6y6RGIJWDpMBR1PPTaS1Rqrg3OoNCn+rtBLq3S?=
 =?us-ascii?Q?GKrFxJcNiUNlzsC51SWuUYOgIbm9kH1sQf63YBejqGq5qR18j3EXaMetpko4?=
 =?us-ascii?Q?A1OImraesEaBdwhW4vU9nfjoJLFrQkUsGCCNfDh++hZ9xRu+f+U8bkOkBPTU?=
 =?us-ascii?Q?ODlnMBCv8OGFC5wiQTixNRKA0LrneWTbKfoJ3HkLnrRltKLJaOg2VGXgfHwu?=
 =?us-ascii?Q?3lMkQLbTgVv1kER/GPnfBucdE+727ZW8KrtdbDO7bHW48QT+Cutu0tgLSMch?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a94d4827-5b0f-4752-2038-08ddbe6c58d2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 22:11:11.4318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XlUCgK83wkbtAwoyLCMkDn6RYvMaI3DyXpZ7PNTD18ZnHmiSGh7TnzOTpIRcwuisBF3KtbzrPxxIAWjYI2ewLdFx7yz7i6AdoetL0LaXfKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7195
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

On Thu, Jul 03, 2025 at 09:20:56AM +0100, Tvrtko Ursulin wrote:
>Indirect context setup will need more than one.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_lrc.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 7f8911a10cc9..e278c12a41f9 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -982,6 +982,7 @@ static u32 *
> setup_bo(struct xe_lrc *lrc,
> 	 struct xe_hw_engine *hwe,
> 	 const size_t max_size,
>+	 unsigned int reserve_dw,
> 	 unsigned int offset,
> 	 const struct bo_setup *funcs,
> 	 unsigned int num_funcs,

one by one these arguments make sense. Together they are pretty hard to
add a call to this function. We will probably need to change this to
keep the state separate or something like that.

Lucas De Marchi

>@@ -1010,10 +1011,9 @@ setup_bo(struct xe_lrc *lrc,
> 		remain -= len;
>
> 		/*
>-		 * There should always be at least 1 additional dword for
>-		 * the end marker
>+		 * Caller has asked for at least reserve_dw to remain unused.
> 		 */
>-		if (len < 0 || xe_gt_WARN_ON(lrc->gt, remain < 1))
>+		if (len < 0 || xe_gt_WARN_ON(lrc->gt, remain < reserve_dw))
> 			goto fail;
>
> 		cmd += len;
>@@ -1049,7 +1049,7 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> 	unsigned int written = 0;
> 	u32 *cmd, *buf = NULL;
>
>-	cmd = setup_bo(lrc, hwe, LRC_WA_BB_SIZE, offset, funcs,
>+	cmd = setup_bo(lrc, hwe, LRC_WA_BB_SIZE, 1, offset, funcs,
> 		       ARRAY_SIZE(funcs), &buf, &written);
> 	if (IS_ERR(cmd))
> 		return PTR_ERR(cmd);
>-- 
>2.48.0
>
