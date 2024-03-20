Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206FBC6FD1F
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 16:14:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A2E10FDD6;
	Wed, 20 Mar 2024 16:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LoeiAStu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E8710FDD6
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 16:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710951268; x=1742487268;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=McfgohVcDj1y3gLQDACfIcSV6Js7q+88bCzfQg9/q7s=;
 b=LoeiAStuuMM8V0B/7zmZLDoPwEFutP6RHfARg/DpAdI17DdilCRECZd1
 qrJL5N1vFOUT0WprntYdj70dXRqB083sAvU/hB2KxkhsHym2oWK4YmkZ/
 SpKXRpEp87HK4s77Tjn22faRiIJWfgtEUtFU7xkeSloqtSLAT8h4T5bie
 f92CIhsnn08cYNjTNofZHkkp/aaNK7MUlaQ9peMcEUEyyT2DZK+q6C1fL
 g9G7WCCkhfOx9r6rJHoSMIDyb7cvbSQYN1JP6bIo1oiY0Pi12cWcYlRmE
 jTZR6CQEMR+X9pNtp1wtoqoORPvbdcSjiThBomU3E38jSx5qdkdmBbDlt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5825348"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="5825348"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 09:14:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="45296535"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 09:14:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 09:14:27 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 09:14:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 09:14:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 09:14:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJhPDWnNz0jzxIpBZxgzIcm4PbzlTkdVkUDUZlaNMSSMYCi6vtWstQdDEpq8m8S0w9liNKSCxc88QIwpERu0coSMKQN8J8vLWn7jtRmhATBBb7qucjHDT0ZvUon0pB5WkHvZNhnZ10Zidnnht1cXB1/0hB68B3FceodZjTWnegHsD3X+Atu6pDGK23mKRWnI4rpmqqO93dA2VKeIFIdqYQHmmTgfArmTtLy+0/70sVfdsM6Dk+PGwRaMFFbNxWX3ch2u0dy/JkL7tV7fL5L33cHm6c431vsBZtWrwEoeykUUMPB+r4kPdWAO9ZcAb+DruLkjmluekU9FmP9wltKmWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1yivV6OjmHFigMR65qKBgfw0Pkp002CzccYxT1wS2c=;
 b=BSfSDnnIODE5O+IpjlaTAmIj/rehHT7n/egJuxHEhI6whmFFjNl0bxBHHzjOR2T929ULCLM3/ilQ7YUwp+hY8Eu3xC5bBo2BQMmum7O4XBTN+6E217JQ53PhBYszt8w13WtIuDzkYiwS/94XNvI+rrfXwIT/zkuUajQyQR+A/rvSIf53reLTnkxEHXYRV9Huaycdu79I9tdFe9YssGatAJTwcCprptldgal4sDIZzFkZIWwpt9EMDiF+3mDLn9f3RxK+4ftV5TGZ1K50YJeLTNNBh9AZFq9JmYJqTKrYwQXdLyKioNjJxR7BGjwPhHC2EYwo6az2eVGvEMAWrDiYNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ0PR11MB4992.namprd11.prod.outlook.com (2603:10b6:a03:2d4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Wed, 20 Mar
 2024 16:14:24 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::8778:d67d:55f9:f68a]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::8778:d67d:55f9:f68a%7]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 16:14:24 +0000
Message-ID: <618db874-2503-49f1-b4f2-282b0f1140a4@intel.com>
Date: Wed, 20 Mar 2024 12:14:21 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/uapi: Add L3 bank mask to topology query
To: <intel-xe@lists.freedesktop.org>
References: <20240320150027.7-1-francois.dugast@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20240320150027.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0045.namprd07.prod.outlook.com
 (2603:10b6:a03:60::22) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ0PR11MB4992:EE_
X-MS-Office365-Filtering-Correlation-Id: 562180fb-1547-4318-b045-08dc48f8cf03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dD6ifmsrsdjTwZQqCauAESd8sV+yaoRWYpmmn5bJyjvt3PSPbkga+lfWdaqYZX25wx7Yt68OjwdqlM9XzO5kCcQ2HdSO5uhDzt7TNMupJqhA9LCFgU6+9wairP3SPo3to/S0fyvJ5Fm0aNzSj+9waCC7GuyZYH0l2OzPnbzTjh7vieYkDz+LYwV3nQLLH3Bjt62YBYmarEvuZSw7qJinRt5t/Dav79o6ovqhgXCgcM2vMr+NHOWGb3ajYRxgAOPmCVh/Mtcss8P1fo5t58/X/3g2RfXy0mGzJz7UbKDlulYB8WXR0360BSawtGtfwFqexhx/ma5rZwuOB5YwAR+RzYfZias+c4yhWsco/0ylNm+uq9kvQP35LS3hB7GBGTr2n7vhGXlIh/+BGX1IIkZK0P7a5TgxWBdQcZff5wcjCy696C0i6NRiQVAO4BJceRJSP8bzt7nx+v1GJhk3FcKoH9qn7KkDQs4l/JB82pjohgfUubPe6QLbyufi5FdI+22+639CvnVJ2szutvAUjDr0ZDRDrSCZdKXyEpt7WDFK6LuIBn24HP9zhjaph/28HoBIVMSLVYuZsSSmjanZhzda07szXU2t+27n3s6/g7OMIYnTVEyeiT5gU4vvcc9yjrAnVtJXjYf+2z0TZtyvZGdpI0quSHtyIkPrtv5eqrZGGwg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUhBK0hIWlNjYi90N1NmbElycmNHYWl2WWo4YnJjUlVuRSs2QWlQVWhXVGQ2?=
 =?utf-8?B?NGZLeUlVWi9LTVkxVkxKam5ZUlFaRm5jc3ZRMnV6L28rTGhnWENUMkREb3lG?=
 =?utf-8?B?M05mM0ppcXYwYUJLSUFKLzQyUkgrL01hS29jR0VGa0d2UGUxRWhKWWFpeklC?=
 =?utf-8?B?dnJXZHZRamNxZ2cxWHkxZDUrQ2dpUkpybkc0UDQ3OUlKQjBIWkVMWVRicGVp?=
 =?utf-8?B?U1BxajdyN1RwbHdWQjl3THpLd2pQSUI5YmYxRTA3OXQwbG45d2VYL2RtaW5l?=
 =?utf-8?B?VE9GTWh4WXh3NWVtdFdiaUtyaWRVMUx3UU1lck5GNzEwb3pxS0VPSUFQS3Z2?=
 =?utf-8?B?cGR6ZDlKY1VvemZlQ2MzWWlYdXB5VktLZE1rZ2dGYkFFQnErWE9Zemh1dXh5?=
 =?utf-8?B?ZVZhak9KTDc0NWlmN0NPWnB0UVVLaGNWVUMrM1ZVZTBIMEUvOUlvb0NGb2ht?=
 =?utf-8?B?NHRrS3RqZStkaENFNzg1S3duZjlkMGZ2RUVvWXVGMFpESXp1QTRVZ2YvTkxD?=
 =?utf-8?B?RE9RZWVzdVYyaXpyU1I4Wi9BZEtraGhRdE5IYzllTVEzUSsrd0g5SzFtQThq?=
 =?utf-8?B?dTFaWFZsdG44TzFaM01nWWJSenZycWJUVWF5N3JXT1lmUlZGZk56Sm5ONmpI?=
 =?utf-8?B?SGo2d1hlcTFFOGora1BxVlNCSGd0RDdFRW9sRmpnODN5YnZveGg2TUI4Zmk3?=
 =?utf-8?B?SmFaeTE0V0o0QzRnaUZrK2dRUm9tSWZFaEFXL2QyUjdmY1hXUU13RmxGdnVX?=
 =?utf-8?B?aHpEZTlTL1ZaWGhsaVlOWlZobzk0Sit5Q1gzZW1iZ3dPR2l1aXpLcEZjS05l?=
 =?utf-8?B?M0lhaUtyYzI3SnhmVElndGRHMU9rUVNlT1dpZnpVQ0NTRlFjRlZRZ1dmMVo2?=
 =?utf-8?B?WHdhdmFIQ00zWXBYZHpCdGQ1K2R0RERVVzdOUDY4MzJqN2UyNWFPcGxVd0RD?=
 =?utf-8?B?Szh4NDdaTzdGZ0Y1VUhzNGFnNGcvR0ozcDAwdUwrTlI5K3cwUTZFNUVTalRn?=
 =?utf-8?B?NGIxenVBZjgzNXNMMERHWWViZ00yYVdBbHZsS3k5c3hTVVNmRHcwRUk5b2wr?=
 =?utf-8?B?QXgyNlhjUk1PZHU4Tit4bTNyWUdjajFUa240T3NoYXBJd2dhSXFzN0YwU1VZ?=
 =?utf-8?B?L2J1ZjZacjNiVHplT09CRnJ5UytuK3RmWTAvR3R3OW1JcitRaU53K0J3MXRt?=
 =?utf-8?B?N1VmeTNya0NIS2FFakxrbi9hRy9yeC83eEZ5am5MWVdRZWJKSzV1UVpybGFs?=
 =?utf-8?B?eVNsOW1sYlp4Y01UMDRUYWRnR0pUUHAybDVoMEdaNmY4aTNreURwVStQbGEx?=
 =?utf-8?B?Y2lZRnN1dkZjSm1tc042MmViZyt0cFZSV2N5Smd0Z1l5MEhLa1gwQnF0MkVC?=
 =?utf-8?B?Z012TVh6TXh0bWtqdmJ5bVNIQ3h3RFRwN29zU1hMUFdSRGNiZm8vNERLaUZO?=
 =?utf-8?B?L2Rkb0FsUTJEMGJqMmNocGJZSVhIaVU0cXplUmVXeUpSNDl6OWhTT2Q3cUxt?=
 =?utf-8?B?S0Vid2xET3pBSE1LWUphdTMwTVNRajRYMEFHaXlkeCszbmpRZFM5emYyTEFE?=
 =?utf-8?B?cHY2aVJiRVNMOVpYd3lEWkUreFFXc0ViM0pyeFdLWkR2TkF2QnQxYlBrOGJM?=
 =?utf-8?B?aVpGeGZGa1haY2dTdzFTMytYTE96bXFGM05wWjhjSlNGbWJoT2pzVXVGWWdk?=
 =?utf-8?B?S1I3a3BVS3RuOVVENGZqeDg4NGdVampMVnRjSnAyWm1ENURuNlRVK0ZUN2ow?=
 =?utf-8?B?WFV2d2lZRVFtM1BPTVl6cEFtMWQ1TFk5WmlrZVJ2RVd1bUlXVW5PWjJpWGNN?=
 =?utf-8?B?Q1ZJM2YwYklOSWM4blZhKzBMRFczSy8zOFVrSVo3WDAwazMzT2YyNUNhc04x?=
 =?utf-8?B?WE5admh4dE8zUGhSUWh5R1kyZk4rWGdqaDdsbFk3RWs4aVk4Z1llNnQ3TEtz?=
 =?utf-8?B?OWNHVFJmQ3J4Rk5VaWhmOE5ieFdnSTUwSVZPY1B3NzNOalREdTRncnBsaklB?=
 =?utf-8?B?MGJoakdWVjZRcGJtVU5URkpEcXlXR0wyWWx6a25CNEY5M09DT28xUGlqdG9r?=
 =?utf-8?B?Ly9hZHdjbmZuYW5jNXJYMHNxd21zcXZrOVhpRnJzd05ncnNZNldNaS92ZWt0?=
 =?utf-8?Q?M9u5IFiJJAs73TSRrXvvzg8m5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 562180fb-1547-4318-b045-08dc48f8cf03
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 16:14:24.3428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGL3iQAic02MqCd2wZsn7veyAS00CsH9SrZVRz4JA2H1nDSsI76Ke2lBT8yQN+cw7s0C0ZAKiUBxAYG2y7bw6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4992
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

See my comments below.

Regards,
Zhanjun

On 2024-03-20 11:00 a.m., Francois Dugast wrote:
> Extend the existing topology uAPI to expose the masks of L3 banks
> to user space. L3 count is not sufficient because in some configuration
> not all banks are enabled. User space needs to know which ones are
> enabled, in the context of OA.
> 
> v2:
> - Remove "Fixes" and make uAPI change explicit in commit message
>    (Lucas De Marchi and Matt Roper)
> - Add separate conditions for Xe2 and for PVC (Matt Roper)
> - Return the L3 bank mask instead of the L3 node mask and the L3
>    banks per node mask, as the node mask can be derived from the
>    bank mask by user space, just like slice masks are derived from
>    subslice masks today (Francois Dugast)
> 
> Bspec: 52545, 52546, 62482
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Robert Krzemien <robert.krzemien@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 ++
>   drivers/gpu/drm/xe/xe_gt_topology.c  | 72 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_types.h     | 14 ++++--
>   drivers/gpu/drm/xe/xe_query.c        | 12 ++++-
>   include/uapi/drm/xe_drm.h            |  1 +
>   5 files changed, 96 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 95969935f58b..be5b4936eb53 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -156,7 +156,10 @@
>   #define	MIRROR_FUSE3				XE_REG(0x9118)
>   #define   XE2_NODE_ENABLE_MASK			REG_GENMASK(31, 16)
>   #define   L3BANK_PAIR_COUNT			4
> +#define   XEHPC_GT_L3_MODE_MASK			REG_GENMASK(7, 4)
> +#define   XE2_GT_L3_MODE_MASK			REG_GENMASK(7, 4)
>   #define   L3BANK_MASK				REG_GENMASK(3, 0)
> +#define   XELP_GT_L3_MODE_MASK			REG_GENMASK(7, 0)
>   /* on Xe_HP the same fuses indicates mslices instead of L3 banks */
>   #define   MAX_MSLICES				4
>   #define   MEML3_EN_MASK				REG_GENMASK(3, 0)
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index f5773a14f3c8..8920426332dd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -59,6 +59,75 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
>   	bitmap_from_arr32(mask, &val, XE_MAX_EU_FUSE_BITS);
>   }
>   
> +static void
> +load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u64 node_mask, bank_mask = 0;
> +	u64 banks_per_node_fuse, banks_per_node_mask = 0;
> +	int i;
> +
> +	if (GRAPHICS_VER(xe) >= 20) {
> +		node_mask =
> +			REG_FIELD_GET(XE2_NODE_ENABLE_MASK,
> +				      xe_mmio_read32(gt, MIRROR_FUSE3));
> +		banks_per_node_mask =
> +			REG_FIELD_GET(XE2_GT_L3_MODE_MASK,
> +				      xe_mmio_read32(gt, MIRROR_FUSE3));
> +		for (i = 0; i < fls(node_mask); i++)
> +			if (node_mask & BIT(i))

Is the for/if equal to "for_each_set_bit"?

> +				bank_mask |= banks_per_node_mask << 4 * i;
> +	} else if (GRAPHICS_VERx100(xe) >= 1270) {
> +		node_mask =
> +			REG_FIELD_GET(MEML3_EN_MASK,
> +				      xe_mmio_read32(gt, MIRROR_FUSE3));
> +		banks_per_node_fuse =
> +			REG_FIELD_GET(GT_L3_EXC_MASK,
> +				      xe_mmio_read32(gt, XEHP_FUSE4));
> +		/* Each bit represents 2 banks in the node. */
> +		for (i = 0; i < fls(banks_per_node_fuse); i++)
> +			if (banks_per_node_fuse & BIT(i))

multiple dittos ...

> +				banks_per_node_mask |= 0x3 << 2 * i;
> +		for (i = 0; i < fls(node_mask); i++)
> +			if (node_mask & BIT(i))
> +				bank_mask |= banks_per_node_mask << 4 * i;
> +	} else if (xe->info.platform == XE_PVC) {
> +		node_mask =
> +			REG_FIELD_GET(MEML3_EN_MASK,
> +				      xe_mmio_read32(gt, MIRROR_FUSE3));
> +		banks_per_node_fuse =
> +			REG_FIELD_GET(XEHPC_GT_L3_MODE_MASK,
> +				      xe_mmio_read32(gt, MIRROR_FUSE3));
> +		/* Each bit represents 4 banks in the node. */
> +		for (i = 0; i < fls(banks_per_node_fuse); i++)
> +			if (banks_per_node_fuse & BIT(i))
> +				banks_per_node_mask |= 0xf << 4 * i;
> +		for (i = 0; i < fls(node_mask); i++)
> +			if (node_mask & BIT(i))
> +				bank_mask |= banks_per_node_mask << 16 * i;
> +	} else if (xe->info.platform == XE_DG2) {
> +		node_mask =
> +			REG_FIELD_GET(MEML3_EN_MASK,
> +				      xe_mmio_read32(gt, MIRROR_FUSE3));
> +		/*
> +		 * In this case, if a node is present then all 8 banks inside of
> +		 * it are present.
> +		 */
> +		for (i = 0; i < fls(node_mask); i++)
> +			if (node_mask & BIT(i))
> +				bank_mask |= 0xfful << 8 * i;
> +	} else {
> +		/*
> +		 * Here the mask logic is reversed: a bit is set if the bank is
> +		 * disabled.
> +		 */
> +		bank_mask = REG_FIELD_GET(XELP_GT_L3_MODE_MASK,
> +					  ~xe_mmio_read32(gt, MIRROR_FUSE3));
> +	}
> +
> +	bitmap_from_arr64(l3_bank_mask, &bank_mask, XE_MAX_L3_BANK_FUSE_BITS);
> +}
> +
>   static void
>   get_num_dss_regs(struct xe_device *xe, int *geometry_regs, int *compute_regs)
>   {
> @@ -103,6 +172,7 @@ xe_gt_topology_init(struct xe_gt *gt)
>   		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
>   		      XE2_GT_COMPUTE_DSS_2);
>   	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
> +	load_l3_bank_mask(gt, gt->fuse_topo.l3_bank_mask);
>   
>   	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, "GT topology");
>   
> @@ -120,6 +190,8 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
>   	drm_printf(p, "EU mask per DSS:     %*pb\n", XE_MAX_EU_FUSE_BITS,
>   		   gt->fuse_topo.eu_mask_per_dss);
>   
> +	drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_FUSE_BITS,
> +		   gt->fuse_topo.l3_bank_mask);
>   }
>   
>   /*
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index f6da2ad9719f..e1438a478f94 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -24,13 +24,16 @@ enum xe_gt_type {
>   	XE_GT_TYPE_MEDIA,
>   };
>   
> -#define XE_MAX_DSS_FUSE_REGS	3
> -#define XE_MAX_DSS_FUSE_BITS	(32 * XE_MAX_DSS_FUSE_REGS)
> -#define XE_MAX_EU_FUSE_REGS	1
> -#define XE_MAX_EU_FUSE_BITS	(32 * XE_MAX_EU_FUSE_REGS)
> +#define XE_MAX_DSS_FUSE_REGS		3
> +#define XE_MAX_DSS_FUSE_BITS		(32 * XE_MAX_DSS_FUSE_REGS)
> +#define XE_MAX_EU_FUSE_REGS		1
> +#define XE_MAX_EU_FUSE_BITS		(32 * XE_MAX_EU_FUSE_REGS)
> +#define XE_MAX_L3_BANK_FUSE_REGS	2
> +#define XE_MAX_L3_BANK_FUSE_BITS	(32 * XE_MAX_L3_BANK_FUSE_REGS)
>   
>   typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(XE_MAX_DSS_FUSE_BITS)];
>   typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(XE_MAX_EU_FUSE_BITS)];
> +typedef unsigned long xe_l3_bank_mask_t[BITS_TO_LONGS(XE_MAX_L3_BANK_FUSE_BITS)];
>   
>   struct xe_mmio_range {
>   	u32 start;
> @@ -334,6 +337,9 @@ struct xe_gt {
>   
>   		/** @fuse_topo.eu_mask_per_dss: EU mask per DSS*/
>   		xe_eu_mask_t eu_mask_per_dss;
> +
> +		/** @l3_bank_mask: L3 bank mask */
> +		xe_l3_bank_mask_t l3_bank_mask;
>   	} fuse_topo;
>   
>   	/** @steering: register steering for individual HW units */
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index e80321b34918..0a064c12d80a 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -453,10 +453,11 @@ static int query_hwconfig(struct xe_device *xe,
>   static size_t calc_topo_query_size(struct xe_device *xe)
>   {
>   	return xe->info.gt_count *
> -		(3 * sizeof(struct drm_xe_query_topology_mask) +
> +		(4 * sizeof(struct drm_xe_query_topology_mask) +

I know the 3 to 4 is for numbers of masks, can we make it a marco? For 
easy to read.

>   		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
>   		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
> -		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
> +		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss) +
> +		 sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask));
>   }
>   
>   static int copy_mask(void __user **ptr,
> @@ -515,6 +516,13 @@ static int query_gt_topology(struct xe_device *xe,
>   				sizeof(gt->fuse_topo.eu_mask_per_dss));
>   		if (err)
>   			return err;
> +
> +		topo.type = DRM_XE_TOPO_L3_BANK;
> +		err = copy_mask(&query_ptr, &topo,
> +				gt->fuse_topo.l3_bank_mask,
> +				sizeof(gt->fuse_topo.l3_bank_mask));
> +		if (err)
> +			return err;
>   	}
>   
>   	return 0;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 808ad1c308ec..aa917308cdeb 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -521,6 +521,7 @@ struct drm_xe_query_topology_mask {
>   #define DRM_XE_TOPO_DSS_GEOMETRY	(1 << 0)
>   #define DRM_XE_TOPO_DSS_COMPUTE		(1 << 1)
>   #define DRM_XE_TOPO_EU_PER_DSS		(1 << 2)
> +#define DRM_XE_TOPO_L3_BANK		(1 << 3)

Here is a good place to define numbers of masks
for example

#define DRM_XE_TOPO_L3_BANK		(1 << 3)
#define DRM_XE_TOPO_NUMBER_OF_MASKS	(4)


>   	/** @type: type of mask */
>   	__u16 type;
>   
