Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A25CCF9E3
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 19:16:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862CB10EB62;
	Fri,  7 Nov 2025 19:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CVKmhHPE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7383910EB63
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 19:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762543012; x=1794079012;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IGZGV2RyrsVml8uSkEWw4DH9QYNSK2VOuCN0cGY7R74=;
 b=CVKmhHPEC28cIMbvlXQi2/71UA84hb0WbPlIkxYeP/NOwlzf4alhmTn/
 dAFBoqZd5YEBO556YqFvYQRgoHJP8z3k9IAK9QY+e673DTUvCBRZhSTrW
 NAqhLvI2cFht6k5IzW/sNCub0vUBnjZg4Cg5AbWJ6usRBZmhgTqz1EJ5v
 Sp4EKWKQ+RLDPuAShGnjbRYLSYmQmTsziixVyxyp3iAjQrqsDMCxZx9Ml
 yMrdLqILJrcSuoKpcn+rr+kvxqiP2M/0+dQ/VVxyG8wDRbZI6KVgSuorI
 854x3NcWv/yEZy3JPIfpzmZE6MzE+O3jd/jAmEy/AOxE+Ms/SMD+XxNpG g==;
X-CSE-ConnectionGUID: Jv4E2lj/Q6iSDj15S2/DZw==
X-CSE-MsgGUID: 6/Ff/kzMSfylrw+CEnLrVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="68536705"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="68536705"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 11:16:51 -0800
X-CSE-ConnectionGUID: GYXYrI7FS3ii6gy1C52gWw==
X-CSE-MsgGUID: i15l0NWlSGWdNjZBZAAQmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="188827682"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 11:16:50 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 11:16:49 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 11:16:49 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 11:16:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fV7CxtFAzYvwK3msyqy/clvY4wj2JSSTHQ8vQbGgh0HwPS70ZIygKqJo9Bnfnrj2E5VLRqk5hmtelAH4UYSlLRS7SAzY11WQIlraaBF5qreUTZwPSkei0Up4Zm63eLrPRjMKm2QzEpeZQ47s1Nj7t0xEu4FQGVDYg8Zo3b2D6kWpBWfFQ1l0sM3OO6Zk7BhlOlOeOVZ3BA6GOdCij16FwEv+goeF7pDqP15xEx+tx6RBCejqCiMhQDaKC2qVfB2j60g6bt7nWSyCJ3/NyhlN9Zju+tJyhExIrJucO0rQL06X4ozmbkIcqYU4wP/zWntTs3xp4U+eZZcxhzljT65y9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SiavMp2Q+x0CB/p1b2yplxli9kYUGPDWv2YjZnn7TLE=;
 b=kEk3dvj2ZBhHfNoGXZ5lsSNLwQAw504mx3/rzBxP6FV7oRvbTn0YFvF/17ykOcNWoJOFhJq1joGplmuyET5VvrPppS5sL8kYStGHqDNHhIXKvqeGROUF1s0apEXV6Imnc/Fydgy6yfdKFpLGtgKib/UkQoZvOxGmnMRa1BbtfPVQb98P6mLO6YgkeIZUNwjf0/yPc3EcBeKDeMyaHP12uxghECKAKFwWo/ctWefJzpAZ6oN1QB/VLEmmeFADxKLBevdHr1qL7SRSILPsmEnYqZLUvfEnmBMVsJDb+R1A1tnwiBs6e5vHfNefr2kNiqEjTV9bb/ufUuzO3jDiYGOslQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7998.namprd11.prod.outlook.com (2603:10b6:8:126::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Fri, 7 Nov
 2025 19:16:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 19:16:48 +0000
Date: Fri, 7 Nov 2025 13:16:45 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, Priyanka Dandamudi
 <priyanka.dandamudi@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/xe3p: Add support for prefetch page fault
Message-ID: <lkmpcsnco5nr4b6bwzo5wnmbq3b42k6felv25flx2nmzd3svaf@qdhbzptdture>
References: <20251107-pagefault-prefetch-v1-0-93291d619126@intel.com>
 <20251107-pagefault-prefetch-v1-2-93291d619126@intel.com>
 <20251107185144.GI3905809@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251107185144.GI3905809@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7998:EE_
X-MS-Office365-Filtering-Correlation-Id: 27b37f33-5cb5-4ea3-891e-08de1e32327f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2SxfnKWGEPv760cb5/FjZVPHJQo7rteAEPY7gHldWqjdF5ay25JsVooUfACa?=
 =?us-ascii?Q?f25+HVGtQvBYNPcBWzo09OdySMgiIdSqlhf5+9nCdDykVKRcutDiLrbyOsQv?=
 =?us-ascii?Q?pya260g/MTmiXbkuq1zUWgiVrFIC6Ly5Lb6IG6v7jILQ7VFPS0zEijlEy9Bz?=
 =?us-ascii?Q?T5c3bcxgPRWOr9YDTHb2wN20NVZ7GN63LSgA0bruu2b81sRZek3i2MdfhYuA?=
 =?us-ascii?Q?ZQDja8MgqJ0DP1YAt9K5ytCCmJs2m6OR01kNJaZTqmaL6LwUCAfB3AEhiHrR?=
 =?us-ascii?Q?65iL6y1YKNl3omKydHee3zwNfgG+rPHOEfldVrK8F88oKnMFL8ip/9NowLTI?=
 =?us-ascii?Q?K4Q+l29YhTTqdHhmBJHvkkp5oB24ROQP7eQbVFHTE6DzGtfS+ilxzkuynFEF?=
 =?us-ascii?Q?V4EFO2SddkK5Kg+SOuooQa0s4yNn8mUyqOpfEfgQP8SUnHfPpd0JioaLUWWl?=
 =?us-ascii?Q?EGxypUbKNS4Ty7iuE+B17QesvX+bGQS9wuEh5N5d3OvsSO4kvtz4B8/iYD9T?=
 =?us-ascii?Q?IGSI3vCf9b6Ef5FSm68e2k383JDrb1AttNeqHsVsesL8owOujpspx5V6nXDQ?=
 =?us-ascii?Q?/SZstNW+jlRnNx0Ix/Tvm2fSo3JHHpEuZ6hDUJdx89fKOj3jaEawh0qDetnQ?=
 =?us-ascii?Q?08aLDofqHE2CzOMoa2eMV7ivjWyAbcjEDtGl6qKValHgoina55H9JxlAKhxt?=
 =?us-ascii?Q?yiq2bA+MKo3nIzJNfPJTyh9SOxD09u6NjTHl/aQLJ32QPdKosBG2kSpdOIxw?=
 =?us-ascii?Q?O4+qwgFjXs4eEi6U/MQlWezYWbSmPHnqoi2je5VAHKZ3MleR8OMoczNdW/QW?=
 =?us-ascii?Q?P6oBkiPTpu9H3cQuq3evFGKS3n4dtEicnZASJjt1r6fUB0O84SQNfAfKwLFw?=
 =?us-ascii?Q?ancsGdQhEzoZC7bBb6Jm+iHOfqiC9O/BsOAnR2ioiC1n2urONkbPaNb0UH8E?=
 =?us-ascii?Q?6CSr0Cvz95pAMSV6gbNAqgPOAAahgsA7V2ak0Cv40ex6+juC7P4co0tB00B3?=
 =?us-ascii?Q?u3W5L2wYx39OxRU9ZrSEgDQ+GwioXBWCajr2VRqA/C9srUcvaIjm3b7Mcft2?=
 =?us-ascii?Q?I0lwHOHokPsjwkNutIGoHDU1zDjzHB7SwNSaevNcxzGEHZr5jmRO1XiDRtCo?=
 =?us-ascii?Q?HMXHycZEsxDfFXzJxbP9RLeL4mC8v2Ur1ZF8vDBwQYsSEZxA1C/Uqhr2DHRD?=
 =?us-ascii?Q?ghfNLKWcX6tusPYaZsN/7uPhaicRuiT9ROrmsK5kzZjwd5wX/p5xIFzoKewb?=
 =?us-ascii?Q?RPLU/8Wblps7ZQEBrcE0T31toZHPSHag1s+UCtHkFRU1fjH03IDTlyPbcjKR?=
 =?us-ascii?Q?je6vOogeL1US8QPwY753FBGef/a4p3RGsgAm0RbdCOqxWsBk4LAg+zukf1Oz?=
 =?us-ascii?Q?N3lalOBcG1kOqMPVmb7XcZOP2Da8V6q0uZSMXIVyAFWZ8Zt7pO4Z5ZpaZVTl?=
 =?us-ascii?Q?Wns9KUVm/Q4ZlV2H5dEa9ca5av4/r08UNDSmnxEVJbhiMtWq9O0hYzQjDx32?=
 =?us-ascii?Q?Ms3jj80ctGclNztlTR7MWTAuhLKano6DQV5O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iCfv2m1OiqpmEWezKZzfbR2CaZEnB30V8SYKZ50uoUC4fd5c2S1QDclHGtg7?=
 =?us-ascii?Q?rq++xUxv0MEEtgH59pR0yhwruyyrbkHVslkW+OG5/SLUh6rnuvPyy7OsG+3m?=
 =?us-ascii?Q?4GLG7pnyJ3EJT/rkRT52gIsrnDdz42spEcgTZMq5cGmejrIQE6BQjHCAxPAp?=
 =?us-ascii?Q?ZgieldJhw1pTV2GJs4vhGbRYg3AfzyXs5zSgVITvxa7HIGnLq7H1kmCnHr30?=
 =?us-ascii?Q?k5XIdMHdgdBsXMIh+01JuCKghK+OXoiZQFk+OHr5kWgMhfueY5YPAfj86VAS?=
 =?us-ascii?Q?JQDU/u8vQBPW381JdySN4wyC3Bs9zuXZPQWgfvNxC4REJwQQAWdwLbC1qlpl?=
 =?us-ascii?Q?1stwudk7rbdNryfwmG7/C6GE8+K8cGOtJVniHadRyhgc2qW+3/vzDueRMzrg?=
 =?us-ascii?Q?hULtPbfi/8m1d2RGaCakwGog6SoLlYJ5ET5kamH/nWtxGfMBttViBMYYfabQ?=
 =?us-ascii?Q?gxKEcGofnYRq5smXBBXLwmNZbbsz6GGm4UouMaUi92IfoVbPSOV3Im1g5iId?=
 =?us-ascii?Q?+p114xAArD/PzOleRdwEfZpEn8ztezYme5CRRs6tO0ruwj7CKcH7nEXNkSNz?=
 =?us-ascii?Q?mkLHFBktN2YMCV5arSnb27Jz8/J5ng9IbpAIc92nEGia4LiUTZMwwJTqyM4M?=
 =?us-ascii?Q?vBtgzyjXLfm3idguhOetTdiT1EYA5WcHYydDFV81au715Zus4eov9lrIMPfb?=
 =?us-ascii?Q?I7KAZEuaR3bz1YpyP5ZSuPuao18eyxtyISqyF1QnDTREAV25JYyVcLyujcKJ?=
 =?us-ascii?Q?vkQLBstmccCdH792EVL6NfwpHqBC4e4DqmBf52ME57vEw9Fr5z6wCHjIS08z?=
 =?us-ascii?Q?J4DxeDrjvH+XWyH1zOL+PAw3h2wSDEzNvfAmgaeiCOKy27z7FVeSkqNSXo3D?=
 =?us-ascii?Q?J1cuM7hZdgUTFoCVbpNgDybSWdjqJ6EgCYSpCLqW6WGlJJakKdV9QbvrrmYQ?=
 =?us-ascii?Q?EPI9+vZ3QahTSNbk2TlHmwrHp1NDz7Ne9Mt9IWMcHzZRuX3142XV/gtedZsj?=
 =?us-ascii?Q?w9AU7kQhgc6QbdzDU0lp3tA4zVQDLECUS6QAPxXWWloZxHBYwp0EvtnBK6ir?=
 =?us-ascii?Q?dRZL3+2U9Krmsyow4/zIiPDz8e28U6MINn0KvRIam2PvL3nm4+jIgv9kYOUt?=
 =?us-ascii?Q?o+nxayek9+Mq6F4WTc9fC4yverwaQmefU2Uau7tBJoDgWdoK/gooZmlaQcJQ?=
 =?us-ascii?Q?nGM+iQemyEuaDBrBNJ93rQAY2V7xkUCz6ygCkA29nQSj0ywgNnTS2/PKP6cB?=
 =?us-ascii?Q?+ot075Mhe1KXo9UvbKxNsQycmabEIM076xBSJrakGe0b43Q+ISAPPV2Sn4V4?=
 =?us-ascii?Q?FbLwZRAUYs609RPBLhNZTJg7kTHht+Q6M9nmKKW3zgF6GmGW6C2tJ9g+QJg5?=
 =?us-ascii?Q?GMsBUKUf3ylmDoq/9bsgvVvC1nuvJnTP/EzwuKmkf03LNNaYjgVD+yPv4oVF?=
 =?us-ascii?Q?DVc5i1y+808X1EQB6PqLHUUanCwZfK+wUxmM3Erz8QBz3J/fvPBwl3uyHH5R?=
 =?us-ascii?Q?IpZ3kKTokLlbQgd7UfYc9SgiVF/Iec2hCEtwXFhsPpQkqfHLJxMet0/b1aQo?=
 =?us-ascii?Q?poHjd/lze89D05XQYOTsCimwsQKbI0jdN0czFiIdCCy4VN/MKrNoskunNNHa?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b37f33-5cb5-4ea3-891e-08de1e32327f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 19:16:47.9798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9It/kg9RHWb9vhxdeZoRq6I4NQTAY6F/KhtGOHeVz44BGS71crpyAZsuXmenNgnarTUZG/O/X6LoiUcKxpubEGIwWSu7vnmCTltTl2CW0+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7998
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

On Fri, Nov 07, 2025 at 10:51:44AM -0800, Matt Roper wrote:
>On Fri, Nov 07, 2025 at 10:10:25AM -0800, Lucas De Marchi wrote:
>> Xe3p prefetches memory ranges and it notifies software via an additional
>> bit in the page fault descriptor that the fault was caused by prefetch.
>> The prefetch bit should only be in the reply if the page fault handling
>> was not successful, which allows the HW to avoid generating a CAT error
>> for prefetch faults.
>>
>> Based on original patches by Brian Welty <brian.welty@intel.com> and
>> Priyanka Dandamudi <priyanka.dandamudi@intel.com>.
>>
>> Bspec: 59311
>
>That covers the response, but we should probably also add 77412 where
>the descriptor is documented.
>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_stats.c        |  1 +
>>  drivers/gpu/drm/xe/xe_gt_stats_types.h  |  1 +
>>  drivers/gpu/drm/xe/xe_guc_fwif.h        |  5 +++--
>>  drivers/gpu/drm/xe/xe_guc_pagefault.c   |  2 ++
>>  drivers/gpu/drm/xe/xe_pagefault.c       | 13 +++++++++++--
>>  drivers/gpu/drm/xe/xe_pagefault_types.h |  7 ++++++-
>>  6 files changed, 24 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
>> index 5f74706bab814..af7b859861730 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
>> @@ -35,6 +35,7 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>>  	DEF_STAT_STR(SVM_TLB_INVAL_US, "svm_tlb_inval_us"),
>>  	DEF_STAT_STR(VMA_PAGEFAULT_COUNT, "vma_pagefault_count"),
>>  	DEF_STAT_STR(VMA_PAGEFAULT_KB, "vma_pagefault_kb"),
>> +	DEF_STAT_STR(PREFETCH_PAGEFAULT_COUNT, "prefetch_pagefault_count"),
>>  	DEF_STAT_STR(SVM_4K_PAGEFAULT_COUNT, "svm_4K_pagefault_count"),
>>  	DEF_STAT_STR(SVM_64K_PAGEFAULT_COUNT, "svm_64K_pagefault_count"),
>>  	DEF_STAT_STR(SVM_2M_PAGEFAULT_COUNT, "svm_2M_pagefault_count"),
>> diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
>> index d8348a8de2e1b..23d72c95a2b5f 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
>> @@ -13,6 +13,7 @@ enum xe_gt_stats_id {
>>  	XE_GT_STATS_ID_SVM_TLB_INVAL_US,
>>  	XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT,
>>  	XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
>> +	XE_GT_STATS_ID_PREFETCH_PAGEFAULT_COUNT,
>>  	XE_GT_STATS_ID_SVM_4K_PAGEFAULT_COUNT,
>>  	XE_GT_STATS_ID_SVM_64K_PAGEFAULT_COUNT,
>>  	XE_GT_STATS_ID_SVM_2M_PAGEFAULT_COUNT,
>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> index c90dd266e9cf9..1d6f9ebb376df 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> @@ -309,7 +309,8 @@ struct xe_guc_pagefault_desc {
>>  #define PFD_ACCESS_TYPE		GENMASK(1, 0)
>>  #define PFD_FAULT_TYPE		GENMASK(3, 2)
>>  #define PFD_VFID		GENMASK(9, 4)
>> -#define PFD_RSVD_1		GENMASK(11, 10)
>> +#define PFD_RSVD_1		BIT(10)
>> +#define XE3P_PFD_PREFETCH	BIT(11)
>>  #define PFD_VIRTUAL_ADDR_LO	GENMASK(31, 12)
>>  #define PFD_VIRTUAL_ADDR_LO_SHIFT 12
>>
>> @@ -329,7 +330,7 @@ struct xe_guc_pagefault_reply {
>>
>>  	u32 dw1;
>>  #define PFR_VFID		GENMASK(5, 0)
>> -#define PFR_RSVD_1		BIT(6)
>> +#define XE3P_PFR_PREFETCH	BIT(6)
>>  #define PFR_ENG_INSTANCE	GENMASK(12, 7)
>>  #define PFR_ENG_CLASS		GENMASK(15, 13)
>>  #define PFR_PDATA		GENMASK(31, 16)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> index 719a18187a31d..b6c12e5630672 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> @@ -27,6 +27,7 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
>>  		FIELD_PREP(PFR_ASID, pf->consumer.asid),
>>
>>  		FIELD_PREP(PFR_VFID, vfid) |
>> +		FIELD_PREP(XE3P_PFR_PREFETCH, pf->consumer.prefetch) |
>>  		FIELD_PREP(PFR_ENG_INSTANCE, engine_instance) |
>>  		FIELD_PREP(PFR_ENG_CLASS, engine_class) |
>>  		FIELD_PREP(PFR_PDATA, pdata),
>> @@ -77,6 +78,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>  	pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
>>  	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]);
>>  	pf.consumer.fault_type = FIELD_GET(PFD_FAULT_TYPE, msg[2]);
>> +	pf.consumer.prefetch = FIELD_GET(XE3P_PFD_PREFETCH, msg[2]);
>>  	if (FIELD_GET(XE2_PFD_TRVA_FAULT, msg[0]))
>>  		pf.consumer.fault_level = XE_PAGEFAULT_LEVEL_NACK;
>>  	else
>> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
>> index 68bcc25f27890..81e641a9b2274 100644
>> --- a/drivers/gpu/drm/xe/xe_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
>> @@ -222,8 +222,14 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
>>  	return found_fault;
>>  }
>>
>> -static void xe_pagefault_print(struct xe_pagefault *pf, int err)
>> +static void xe_pagefault_error_account(struct xe_pagefault *pf, int err)
>>  {
>> +	/* Don't spam log for prefetch accesses, just add to stats */
>> +	if (pf->consumer.prefetch) {
>> +		xe_gt_stats_incr(pf->gt, XE_GT_STATS_ID_PREFETCH_PAGEFAULT_COUNT, 1);
>> +		return;
>> +	}
>> +
>>  	xe_gt_dbg(pf->gt, "\nFault response: Unsuccessful %pe\n"
>>  		  "\tASID: %d\n"
>>  		  "\tFaulted Address: 0x%08x%08x\n"
>> @@ -262,7 +268,10 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>>
>>  		err = xe_pagefault_service(&pf);
>>  		if (err)
>> -			xe_pagefault_print(&pf, err);
>> +			xe_pagefault_error_account(&pf, err);
>> +		else
>> +			/* Prefetch faults should only be acked on error */
>> +			pf.consumer.prefetch = 0;
>
>The comment here makes it sound as if we shouldn't send any ack at all
>if the reported fault was a successful prefetch fault.  However the
>actual implementation (and the commit message) has us still sending the
>ack, just with the prefetch bit cleared out in the response descriptor.
>We might want to rewrite the comment here to clarify.

ok... what I was thinking and probably couldn't express it correctly was
that the specific bit is the ack. Now I will need to double check on the
hw/spec side because they also use similar wording... but from the hw
impl pov it wouldn't make sense to skip the entire thing on success. Let
me check and get back later.

thanks
Lucas De Marchi

>
>>
>>  		pf.producer.ops->ack_fault(&pf, err);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
>> index d3b516407d600..f42336602f974 100644
>> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
>> @@ -84,8 +84,13 @@ struct xe_pagefault {
>>  		u8 engine_class;
>>  		/** @consumer.engine_instance: engine instance */
>>  		u8 engine_instance;
>> +		/**
>> +		 * @consumer.prefetch: fault is caused by HW prefetch - should
>> +		 * only be acked on failure
>
>This one also seems slightly misleading to me.
>
>
>Matt
>
>> +		 */
>> +		u8 prefetch;
>>  		/** consumer.reserved: reserved bits for future expansion */
>> -		u8 reserved[7];
>> +		u8 reserved[6];
>>  	} consumer;
>>  	/**
>>  	 * @producer: State for the producer (i.e., HW/FW interface). Populated
>>
>> --
>> 2.51.2
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
