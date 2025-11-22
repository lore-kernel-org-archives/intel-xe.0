Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EC7CFC522
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 18:25:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D048A10E04F;
	Sat, 22 Nov 2025 18:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lZxgwi3h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873F210E04F
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 18:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763835918; x=1795371918;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=g5BHv9KmffAW3oaRhmVDwqy6iw/Tm6HJezb588lKFGc=;
 b=lZxgwi3hWPzn7Hv/8i+k272qCyfhNEKUKNrWcUyP77E6IArZw5ezN8cR
 jslllw+edpKitu3Dgq9LeUwvcATtragYhFGqnidnIO0Jbji7m02LMwegS
 chBJ1Fc60J5bZ4b8zqRNSv8I2EoZCfT+Q5pfB6pezayLWfchYeHbQD31E
 HbKKUSzriYYQ0wNJTBTSANuVA0AfWVBZPhmHxNA0upOe9g1l41Fhq0h2i
 C4gt+gEGKF0FshOz54MZInwnDHj2waZ+XWzZJvNd54RypPrTFnZjf8EEZ
 pk5cIIl9uHg6xFrnwBCSkZ+KIaRXupwu7q5wWjQBfdGhUyHEMZ0qrw32J A==;
X-CSE-ConnectionGUID: Bqlc8WmMTqSoGfzORIQycQ==
X-CSE-MsgGUID: HJr90JinQfyEvunDGVd6jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65942886"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; d="scan'208";a="65942886"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 10:25:17 -0800
X-CSE-ConnectionGUID: 2ta+gzoMSM6u88+FviIrNw==
X-CSE-MsgGUID: POCxQhp2TsKdWh9S8LUGgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; d="scan'208";a="196125399"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 10:25:16 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 10:25:16 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 10:25:15 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 10:25:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hArit5NjxH1jFlnCvivEHfGrWplr7GYRQDer/oHPE7GPOoHEY2cu9EzLowtplPhKz0VpCoC2yPVccH8RQuLl9y79Am1lDeqFz54QeCttpgbsbcpjCD6jiLhlc+zBe9g4D8soQhPSAOpEFfZxg0r5DcKiWAIxyp1WpSWdCTzkAdTAz69CRpKJrjI1GLAzsoeMGGmz8WnuZfjrN8LU5Er8J+BM9TlurvIhhgc4obNOH/aZKGsBq60XHlvB9gM2KtizHy5Mck8yae9dORhl5Usqf75A9LrInoHdWGa0o4TBrKX2ReAYYAT6jYbPrN7ttJATlei/iuWQybde1QczABXfdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5J9fNQ5mvesyt/sYRLfBa7tntBmZ8BnG/uzIn4KVvg=;
 b=fZsfZp2glX4pnkws3eaTqFNAnqUh0vuReQo7LejSvxgj0yECertOXs+r3feetydbs3wVItuyZHLYaCsqSsG7rhDRTEx4Ktpb+iVhRFQ7HThpT1wPu0lxAvfPflypyqFXgzhaTrYtB9JJdefxw3Jesc++ROMQ3JUFAIuXG9G1nnt5sU0+XSjRmI82AsI1bwoZHnitCyHjN7XPtQvWT4+V9F7+3MOOI9LfqehqS/g453lF/b+Yq685yyrfzsVzUKEkSowXoHYsHSm/3nXOlYL0qzpdfbiucaV+Kbfjzpu0U+2Hf6kwfdMzygwqnjputy7o5WjpVlS+T3UMupVkF1bEnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4674.namprd11.prod.outlook.com (2603:10b6:5:2a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Sat, 22 Nov
 2025 18:25:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 18:25:13 +0000
Date: Sat, 22 Nov 2025 10:25:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>
Subject: Re: [PATCH 02/11] drm/xe: Reset tlb fence timeout on invalid seqno
 received
Message-ID: <aSIABv+iT+ZJX6sk@lstrano-desk.jf.intel.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-3-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251118090552.246243-3-brian3.nguyen@intel.com>
X-ClientProxiedBy: MW4PR04CA0149.namprd04.prod.outlook.com
 (2603:10b6:303:84::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4674:EE_
X-MS-Office365-Filtering-Correlation-Id: c2e0ff0f-4cb2-4498-f086-08de29f47a50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5APVjcCRqTrmWsl3UyfEVOmTABw2R/BC2xtKfbDfQYFqoB7W8GjbcAJsXWdd?=
 =?us-ascii?Q?lY+mJi7/GRne/Xcd+bc20cUl/Cdyjr4iMjc6vHvBRZvtDNl9AKYgPwxU6KSB?=
 =?us-ascii?Q?qcyH8C2ACQ3EAf1AZNvzhB+LHHzfRUUJeL7oyoVs+R0OcZNCtlwsciNRDDKH?=
 =?us-ascii?Q?BI+fs825r9EkkbBIhkoMI/p5mugVqqiySONSZdGHTycev94I0/OqSbq0nQI3?=
 =?us-ascii?Q?nuvtb1iz2otqmYthn5JzUIIpqOgp7xJMgNx+Z+9yfBsThSm8Axu/LQg2uY8q?=
 =?us-ascii?Q?i6Sn5RUiR8dRi7HywGmu2ULMWAiHrtBiZdccI2aFumJOYakYObLjyppFCnQq?=
 =?us-ascii?Q?8iCpYcqajXhLDdaLLXESfJlYtlh3GPpH57gGWX0loGew5FTkA+ROl717kR7b?=
 =?us-ascii?Q?8XkpWtosZDMRXz7XwR4qh5zXm4mTG1zq1oYRCCG8pd5v7gDyHwiHJGFkeZ92?=
 =?us-ascii?Q?/UsAy3RXJLX+eeYgPVGlqvYIrtFGK142L0ONBdiOAp9ws4wQNQPzy+o2Py+k?=
 =?us-ascii?Q?EorfaGuzrY2SWKbq0JHLjS3+pcUyV9OjyXNnfexpZwMbsHejU9V1zEIZsCOr?=
 =?us-ascii?Q?HeHoC64+b7+gUcbkJc6pOkdF8xkpFL8yXPuCZYtbM3usAbmtEMHb4QCsoCS2?=
 =?us-ascii?Q?s1AWz++kJoKtkaJ5PQQNtT6JX500JDIW2QpZN6eWYk74E70KobZ5eptivtNA?=
 =?us-ascii?Q?bn6krMUD6GZNIvWasvgvtVryVGtnnTTNEt/Z83rmKYl39sJzRxSqE78Llbxp?=
 =?us-ascii?Q?VZqMINav7LAYn1J03ivIVD5RV79JklvJ2Y+b5aGZhHgutOkERuxmn7m29jmX?=
 =?us-ascii?Q?SmBUhqTRr/XUKHBYruCv5haLZZPB9wxfg4iExb32uuQ3NLwsusT26+0XJXaz?=
 =?us-ascii?Q?AdgU27ZB3Hj5pEzLIEwU5MparpBEynWEo2Kz4xsedbmhHaToITOi/RK9UY6V?=
 =?us-ascii?Q?DQQmxQnZkMQtfbepb970RfkxuDCqo/V0m27XUaRrsJQms2mD/MpDu6wFvEr+?=
 =?us-ascii?Q?XsimRecT3IZtciluKHcx30WZDTqnGWlnz+0LGbI3mfR3M8nfEmcWkGaPeph3?=
 =?us-ascii?Q?4qUwU4J8FXK2CpKvOYfveG5+COUyNdNzLOgk6VqYnTKdmyphYb+yoHh1l9WL?=
 =?us-ascii?Q?c2aSJkcOY1BJ175yDKHmtyXJ7/W8SGQS4Wz7AzUZoIyUq1/mybVkhc5Csk7e?=
 =?us-ascii?Q?knXKgJqBYVL1uR9ZNihhC/RbSYJFDkuxCgBSleRWOdN0732XvfWbrzSamo0o?=
 =?us-ascii?Q?yAWl3+Bhv5HeJZBy1HW7IqkmhXSKn3uioC89HkjZS+LYkcMJAyNEVH68HzQR?=
 =?us-ascii?Q?hu+x7h0GfA1qciowHc+ARL3xxacelyM7JdIUPZbyYxoYwlW7lP20p1wxj+Mb?=
 =?us-ascii?Q?NdYvfhZAZT432cOiyRJTWzMsPa943e7EqKdiBkwiOkyIP1eEKODvy7zi9hzx?=
 =?us-ascii?Q?IcLlYbxvIvuM0is/w2AUjfKXiDxBhHkz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q8XqUvNYXJLqeGhUisFUvnUkj1AWpdB4xENtPlg9BCgWivH57WG54XjWgg/H?=
 =?us-ascii?Q?FH6JthxTEij7XFV3iANPvDKOGQaEGXNe4IRCMZYqqJuEOEd0qA6NIK4PEx16?=
 =?us-ascii?Q?vzCGJeheDK8dDqKqhg/NYPI+WNa8Fy0gP7wCH1v/temkDOypfXnM4ZuW4AFQ?=
 =?us-ascii?Q?m4SqEAmE2ddMhRGmlRWyHFuJAcPYMOizpu3TU6zeIXI6Zl2l6DFN0yPp11RY?=
 =?us-ascii?Q?A3twRGu4/G/XkVqrlp7/mNfqDAxI9ZHkjZdc4qnm8EtH592aqRXYQQ3RtLMq?=
 =?us-ascii?Q?1stq6Dqfh0l3D3Nm7itAx5IAXicZlz+mBgFrk4w6/ojfdSCVkFQlECHNr70M?=
 =?us-ascii?Q?kaBnpvjv+bxmQCCSVBSTBJRb4/eMWjUXxWAPel27GDgw/VDMaxMdxfwN12tg?=
 =?us-ascii?Q?w4Qb3w2xA7D+zI0SAsO5RM4Dd0cj4sd6dcdWhUSCy38PuhXSTTNpG6NWuxZT?=
 =?us-ascii?Q?BYYa7Q+zJOE+QBc41c+T5vvXDqPgeh3ps71I9tWaIVEbcuYtEeDHlEPLrg2D?=
 =?us-ascii?Q?6Wnkyv0XPfMobb6HpG7fDBJ4g99S8GofmFTTqFUupoukdLMDCae/HVucGwXe?=
 =?us-ascii?Q?v74QKZPPUZnSdPgVpVZ0yIHDwIrjM+yPae1vzzPnTipNoeSUO1pu2V2wB3EM?=
 =?us-ascii?Q?ZvU9MSmWEgRwr8ITcdGwkbSI1+1YSFReOSFpHvkVg/2X7uAuI4a9GXHmhUF/?=
 =?us-ascii?Q?gk1F5ywOCqZPZMCsiQ/yhu3H3ZAeapaC5ch0f/JBGW9o3eIUumOfojnQtYBt?=
 =?us-ascii?Q?ANPGWuFvGmDA8nsYiySCJAgGZimdtdyoiHeOot+b8ykoK8Va/8Cne6XXAtMn?=
 =?us-ascii?Q?9osAH+wZTreDkf3ybqrZX5SobFuqyFClDbWrqKrwM+Ce0GiT5LzEjIEzUJmQ?=
 =?us-ascii?Q?bdtuwzIVy/6xbCSlMFtmhardJfaCFUuHMt3xyPuwtJr2sF76NNGUDzrpmR0o?=
 =?us-ascii?Q?yoBVXcgqMcmkSnzt1OpyQioDnWoFBA5G+3MJtYeSf3bDGtyrBQmTPKNyVBhL?=
 =?us-ascii?Q?Zp8nwhzhirbp2gbVcwM+vrVo2KL1BmQmyiTNCq02bIzuPl+x+HT37gVXxkpH?=
 =?us-ascii?Q?loNVkVCoYXy+eeX30+tXtjlkMIolESTa15fWTXqGgrenW6nuyBjYrdjbg+4p?=
 =?us-ascii?Q?0jhCd/pyU46DeEoKSpUoP8e9CdqViat8ZbLL5cM1c2bGFMpXhtkIrvX6KksD?=
 =?us-ascii?Q?NqcIFpcl2bD5NB6jrjFHED5/N7mrzid4w0QLWZgjuSiTejohpg0LoyErvBe0?=
 =?us-ascii?Q?VxOdjvUJO1cYrcU2R19InMQjomav1iv1A5CoEtZQ1G9yC7n4MNosyllL02Zh?=
 =?us-ascii?Q?ZKy2Y9Kfl5CSbhqXXqn0sEJDkyMipXGtwar0+Whxx1de0T8RBt9CDzKm6RB4?=
 =?us-ascii?Q?lEd6NySd4ZnhGdspz7WsfGZ5P04wGpnYoO0ICfJ8CpcjihkEu7nfYJ768nPb?=
 =?us-ascii?Q?IkB/52M6Z2HDZ1+wjOx7kQZKauIVC2XWG+d7KNWwjFyOp6aWjkgDZlnYOK63?=
 =?us-ascii?Q?K36eZCQAD/UeOs3lUNm4yMm+5Oo0r8/GPvdxN1p61S3iCQK7dALlVgv7Me3q?=
 =?us-ascii?Q?9ivqSYOWzV2k7iGlDJ0Pp5WPDDZn5PF6NrcWrOwIsQEuZYbMY6b0RNHgPjPS?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e0ff0f-4cb2-4498-f086-08de29f47a50
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 18:25:13.5770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XRmr3kBo5FOSQ7AE/XZesJbr0uqJPiP513N9yjhYp4LxXEeFrIU4ze01jxEhrYnBV4bUhqBGsxKV4xLzfOWO9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4674
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

On Tue, Nov 18, 2025 at 05:05:43PM +0800, Brian Nguyen wrote:
> TLB_INVALIDATION_SEQNO_INVALID are now used to indicate in progress
> multi-step TLB invalidations, so reset tdr to ensure that action
> won't prematurely trigger when G2H actions are still ongoing.
> 

I think thid patch makes sense but comments below.

> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c |  2 ++
>  drivers/gpu/drm/xe/xe_tlb_inval.c     | 16 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_tlb_inval.h     |  1 +
>  3 files changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> index f1fd2dd90742..cd126c53faab 100644
> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> @@ -238,6 +238,8 @@ int xe_guc_tlb_inval_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  
>  	if (msg[0] != TLB_INVALIDATION_SEQNO_INVALID)
>  		xe_tlb_inval_done_handler(&gt->tlb_inval, msg[0]);
> +	else
> +		xe_tlb_inval_reset_timeout(&gt->tlb_inval);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
> index 918a59e686ea..50f05d6b5672 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> @@ -199,6 +199,22 @@ void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval)
>  	mutex_unlock(&tlb_inval->seqno_lock);
>  }
>  
> +/**
> + * xe_tlb_inval_reset_timeout() - Reset TLB inval fence timeout
> + * @tlb_inval: TLB invalidation client
> + *
> + * Reset the TLB invalidation timeout timer.
> + */
> +void xe_tlb_inval_reset_timeout(struct xe_tlb_inval *tlb_inval)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&tlb_inval->pending_lock, flags);
> +	mod_delayed_work(system_wq, &tlb_inval->fence_tdr,
> +			 tlb_inval->ops->timeout_delay(tlb_inval));

You don't need a lock for this. It is done in xe_tlb_inval_done_handler
under this lock as the pending list of TLB invalidations, which
pending_lock protects, is tied to whether we want to reschedule the
timeout or cancel it. So please drop the lock here and then also update
xe_tlb_inval_done_handler to call this new helper.

Matt

> +	spin_unlock_irqrestore(&tlb_inval->pending_lock, flags);
> +}
> +
>  static bool xe_tlb_inval_seqno_past(struct xe_tlb_inval *tlb_inval, int seqno)
>  {
>  	int seqno_recv = READ_ONCE(tlb_inval->seqno_recv);
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
> index 05614915463a..9dbddc310eb9 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
> @@ -17,6 +17,7 @@ struct xe_vm;
>  int xe_gt_tlb_inval_init_early(struct xe_gt *gt);
>  
>  void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval);
> +void xe_tlb_inval_reset_timeout(struct xe_tlb_inval *tlb_inval);
>  int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
>  		     struct xe_tlb_inval_fence *fence);
>  int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
> -- 
> 2.51.2
> 
