Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134ECD6A228
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 19:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B193B10E2BD;
	Thu, 14 Nov 2024 19:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hw35/lku";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3A410E2BD
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 19:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731612250; x=1763148250;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Rx8qEZkPW/R1h/RoXvYvh/Z70+l+c/GdY9zEMHh2vT8=;
 b=hw35/lkuOtPNDFZ+sloxdIYMrToWpP5nXTyn7zvnYcZTGfd6xCpvW3mT
 G9/LVpUKRUN6ZXkuyHzVwWH2B7OIyU5IVZ8ltD+XDsTSV5iOy/K0LMRlk
 tGwSZgmzWvMtneo6foHwVfr414/eVvicFL2eLwzNgtqWqm1BPeI2sCMdn
 kmHQcvcKYZfUS1+3rRdE+xjhbcG1XmH/u0GsN46/V6dKMCAkw0BvC8C34
 yVFwLlfYH4THO7Azr7I0NwuWTpGikp9d4T1GemvBSbSm1f/H+Bwy6GOyk
 stf5AxpPsWbsZI+Y9F86r8E+1vLgRU6SRiTXbO3uCqhDa4HJZAI4MsKWk Q==;
X-CSE-ConnectionGUID: p3A2RWVdSoK6N6p2YbydRQ==
X-CSE-MsgGUID: eOarSDDIQ+GtaqDag843+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="49108993"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="49108993"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 11:24:09 -0800
X-CSE-ConnectionGUID: Sz32AwM1SYeAcOJQbtOQ+w==
X-CSE-MsgGUID: if1gAu8WTjW+TArjcuynDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="119128679"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 11:24:09 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 11:24:08 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 11:24:08 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 11:24:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMZ9AOQsM4T4BqRdhVUxEaRGmtNPfH/OP1fIzPqbhFOEygOHx7NQBLwVIbP/zAiPisBmkl2FNalU0YeLX9YGQBmiNzHcGuc0D0ukZJnpi5YiwAz29DQ4Wxhso5MzAtDCmKLSTncl1W50x/Y6EyJQbn45uCuSeNLIe7o0KVvlaaZ101CwuJfdnTM33XdjgJiPYQLJndBfWKYxCkhzji9qbatqpleDMVnaOZqxgrEDJEBcxZuetl0k1fi51JDLqK1yN/pH54M7UExCivA9UyMhC9TjaLLm2b+wRgQY21i8Mdp5nxQ4XF3lR8qJ0LGShhSwla3nq/LTk0y+iW+x+qqVUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9qISe80SkzzR8ahb2KJjbnVq//L4f9yZNPuqkCl6Go=;
 b=xhxNdu1k/bO1mw2x+K3jwiOtqouyExjmcC+4tXWuZQdiMNaeI+0dYml2KJhZLBwrzonHSQBTWJeV1ZXlPT69gOk+S5JF/AWWeApqG6IzT0roN9L00O38RQIs37xIwa4qJjY9lm8lKHu/52YS345l0EREe95ayH6TIi3qWaXsEjQD1z51eMyRhqjKJ933byhu3GrozhShSKGv+QR0K7Mtb5B8oHAEeX0T3VevW1rSSckzbZsGSB1/SexKiAUWaudLjq8r6jh0sZAx24A0bX3tHHaPnHsUUbtflpbRY2zwtfz8T5mQZu+9r4bP76iLVZhsuMH7UDno/AqlV5/m8u7Mlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7814.namprd11.prod.outlook.com (2603:10b6:208:408::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 19:24:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 19:24:02 +0000
Date: Thu, 14 Nov 2024 13:23:58 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Always setup GT MMIO adjustment data
Message-ID: <yzyjk63jmruhujcaqpkx4cd64ymrqvjmikwlltgbf7pmbg6s7o@ycn665ds4ile>
References: <20241114175955.2299-1-michal.wajdeczko@intel.com>
 <20241114175955.2299-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241114175955.2299-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:303:2b::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c0e540a-bf9d-44f6-d545-08dd04e1e549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7UIC4gVh0un8A5LGbUyU8eLXiDzrtMqhIWUUtmrwhwRdAe9ygkhq7OmG5IQD?=
 =?us-ascii?Q?XNQSLeJUlUHTQda6qQkjiOSoJE1Tk1BpaiddEYybjPeslGlWrp1b8WAsLOzE?=
 =?us-ascii?Q?KhdU8WuYEjIfohGiSPiBNSNhiVJMh2PIGOve2R56Wy4L0CkmOCH2QPER18z9?=
 =?us-ascii?Q?a9I8HcmQ76S1LDr9+yrvLfK3jZ6eDrR3EcpJ2+i7Gep4wSPqBPrXskZd55tJ?=
 =?us-ascii?Q?8swoayyg30y8YuvYbuyE13PkRNYPOoIjjhYtaKixxRrhNujXvtMPSOCBD+QV?=
 =?us-ascii?Q?ltnaAXgcCw1q8tp5UeAPPCkGXLf9gB91A5bZaoTnsXObArJOmVfk7U/DTyU5?=
 =?us-ascii?Q?fI/XB4mO7zjGFclEXBUnrWZHA1CoKGyQvjdgPwuwx+KZmLp+X2D5v4JFFHUr?=
 =?us-ascii?Q?LR+Upytxy0qJs83j8zi2dbgHYxWl7V6nePu1PnD0vZROsXsreS5pcJmoDs8G?=
 =?us-ascii?Q?GL/cWflk3XQprUAGoWd1OJMnWzeRVqc3CTVoabijVSQRXc1bBGc3/PKD5miF?=
 =?us-ascii?Q?fFTNSG6QC9yXdOtNxhlS7PmG2xq35YG5dvUy1vNP3Tym9M8K2M6CHUM4+b29?=
 =?us-ascii?Q?qyQjtzHP9WLKKdEC+rbImX2VKgZ5nzgeylg9lXKor7aCSSfB8X+XymIgtQTv?=
 =?us-ascii?Q?3prQ+x+Onjz3xrPV6kM4RAeANgGkbNS+wLFFW7kx6JNfXOFbKCLu+4RHz2Dw?=
 =?us-ascii?Q?MuA2rjOdGzMmamj9bStIxi7KT+6DCR+DsokTiTWxSUx/5fAfEUtvIVBUUVLR?=
 =?us-ascii?Q?AEVxFLvV2GlE/HF5ws/4Y6/8uHvsmSHtV+zhR36UTdu/86pQVaDwNl7dbGvv?=
 =?us-ascii?Q?Zs2TpFhfmB2DgNtJKa6T1oVTJaaS1eSm9PrXK2YJRqMhB8rQ2/CHyweJZ+zE?=
 =?us-ascii?Q?HhLj9EVxt/MZ/VZinMPZ58/+GYa64+97oIMZSRQhCTfyWbLX4K49RWSCMnaC?=
 =?us-ascii?Q?rNoNGYpO9qDQH42dU8vPvCBwGuTJH2L0pzam8a+QGw+xfZnIn6m1XNVvqwpG?=
 =?us-ascii?Q?oAQDun+xC8J23hBKDUw+06f5JCiJBo5x3ycJACrXqLlC8rOi7ZtaapssghR7?=
 =?us-ascii?Q?rP85p8gORqgs/RMVII90QeX8RzJUG02i4nq/ZyXBJH1j5ZRCTO9T54hqZDTA?=
 =?us-ascii?Q?Ms7fN+bVn7XC1coLuKk/iHa3KAXmquFuxEeNfgEHojM2sHJ/gdT2vBiG09Mw?=
 =?us-ascii?Q?KDedtlqDeNHkhLKzE0TNGlkvDNS2jZUs+rYTx79sotncFzO3lBoCriTWpIdI?=
 =?us-ascii?Q?cSvjx20Pbz9kcDwyoukgdM1rKIJa1C8dKpXE+lh5jzlz2XQKI0U2TOdQxDjp?=
 =?us-ascii?Q?NoB0pYBExnHxJfjOt6ptn3F7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eKsGS+Q2WMZBRgGgN/ICYYWLbRw2sPI20g0DLMjXE4/H5Qp9B/P0E4XAVkOP?=
 =?us-ascii?Q?sYTiU4KCa/9fy047YUI6C1MMLHBYcqwG78P76z/Qr+lVaS3tFYallYfz0iB1?=
 =?us-ascii?Q?piivxC1/BTdE3F43er6FWSz+MR3eA4X9Lf5QbUzkXzN/8+2bsxPlJEkSIYgr?=
 =?us-ascii?Q?y4aGExKoCyAllBQQLsFpvx1dAj8WFm4lIwta2i7QWQy7WW1kD/W76yE1e6Vy?=
 =?us-ascii?Q?t26IZkcnfuIn043vmUdWhf2mJcse7UAZOe8Ne54zaeXwHR8efFBLE87FO6db?=
 =?us-ascii?Q?y2SGdDNuziacA77lUb77rP6d9j/R3ZTPdRbXLbORQykJxxTfqNHddrC/OqSJ?=
 =?us-ascii?Q?D79we+FAs7gTeYf7N0OSF3Yh9mZV8ArSRnur39HQV/9G/vELvLKQorEtLh0d?=
 =?us-ascii?Q?AOABcRdwlSzySJr/VlWbVJV1cyCTcDJUBZZkWn0FrxIdCqsRanlypPzRI80J?=
 =?us-ascii?Q?g61u4ZFebiuBCwdMA9rH1CxlxAJijWPJrlvo3JMHA+GHP8IeZGT7HODLtY//?=
 =?us-ascii?Q?KyMkf62s0F5sVjDZUIvnPNagqY0kqrp3VOkX5N6CuBfZl8maowLDopvjo8kn?=
 =?us-ascii?Q?hXGALdAtvITdFdUxLeyEHBTkbIdaWX0o3euNQJz2etAuyN2z7U8FTMqLBE2u?=
 =?us-ascii?Q?3zVYojPpLOjpWJzMqmeWkxKCJNCvBIsD57icNrSSz9JEHIPkwhuJpPW/cL8h?=
 =?us-ascii?Q?ad/dilXLNAAxFLaYoESTdvx5zZbIyN2+pSv+kiUbJKjSMH+E3S7CtRunqToC?=
 =?us-ascii?Q?hUJbtaHqzlJgQoHVP6x5h1jq0lUPvb2Cux79QmnGNzizXHJz2XbVexqmj/P1?=
 =?us-ascii?Q?vRC30QOOW/BEc3IYCM17RweEdzKM43mpcpXpEE5yhLAJC1RJ3kbGjC6UU1gr?=
 =?us-ascii?Q?eZuMQEdXK3azNG6xd5iQWl1LurS7/4+9oHsNyWRgLl+n4D9mrjlpYtLlgxfB?=
 =?us-ascii?Q?B3TTZmE17shw1GGnKjDiiwZ/Pm2UDXp3zD4PhJYytbslZRrq5NFq2D+imn2r?=
 =?us-ascii?Q?9i1cAHY1J+UJVNVxCJK56sMw6waxiq5D4Es2G5G0gSDD2AX/kmihgu0VAuLv?=
 =?us-ascii?Q?3iEDqmZpjS9ie06mhqC1dC3rD1rj/DKb4S0scZ9QCrOaBkazsJQ1yyJagEkO?=
 =?us-ascii?Q?n2dWkfHBvybgQ1wUnj25m+F64No7IWLWndcAXiJJDSzKPhR/e3Kaikr6PPp6?=
 =?us-ascii?Q?QtDycZSj8pEqbSKV1/W5meIvEiAt4DWTh7vSEF+czsC0SH2KeUlmODjPuuw7?=
 =?us-ascii?Q?6pDjMBeyzVJY8wPDlXBlzyJPgCNpfhsbj/TOV0N359M+gr/tUWC9KS+IJFpf?=
 =?us-ascii?Q?lmBWvZ75LmXGrm4Bw3h5GLC8Bt/iCRWpSDFpG/kub2NP83/3MCYjLVIz8jQK?=
 =?us-ascii?Q?1j3i//iya+StN6PBTF79B5qrZbVPwrxSy/RO1da5j7iVmSAixHtOCTyMozGJ?=
 =?us-ascii?Q?ZjwXDgII2YKvaw4cHgxGA6T5ZaVDEw90hCN6mgvXui0F7DQk7nf57g01uxq+?=
 =?us-ascii?Q?2EHYD9d3ur8QoI7wzEmc1MwH0Sg5AJ7apx/KiVrilQHzpvnenNkX+RmFJcY5?=
 =?us-ascii?Q?JBn4ujra/47qLSwTJKQqCcheIAmXD1FTAyiSc3AtgzrlbC8zBwtDAc1rvIlx?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c0e540a-bf9d-44f6-d545-08dd04e1e549
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 19:24:01.9855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDqF++PmF0SzuXIhwnfMxVcb54o8dsbvXRRExIQv1MNe3NNhgX8vzHn+2EKqOW+Pp6q4T7hbxSdmQBOYR9LeRA7hXXCk4FovdZviQhoMZJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7814
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

On Thu, Nov 14, 2024 at 06:59:54PM +0100, Michal Wajdeczko wrote:
>While we believed that xe_gt_mmio_init() will be called just once
>per GT, this might not be a case due to some tweaks that need to
>performed by the VF driver during early probe.  To avoid leaving

can you be explicit where this is being set on the VF case? Shouldn't VF
itself deal with fixing up what it did?

>any stale data in case of the re-run, reset the GT MMIO adjustment
>data for the non-media GT case.


Lucas De Marchi

>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index d6744be01a68..d45d2cecc4dc 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -643,6 +643,9 @@ void xe_gt_mmio_init(struct xe_gt *gt)
> 	if (gt->info.type == XE_GT_TYPE_MEDIA) {
> 		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
> 		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
>+	} else {
>+		gt->mmio.adj_offset = 0;
>+		gt->mmio.adj_limit = 0;
> 	}
>
> 	if (IS_SRIOV_VF(gt_to_xe(gt)))
>-- 
>2.43.0
>
