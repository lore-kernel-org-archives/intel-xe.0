Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C99C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 18:46:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E92010E9BC;
	Thu, 30 Jan 2025 18:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R+zxvCQL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA09D10E9BC
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 18:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738262807; x=1769798807;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=I5c33DGFW3+1nw/98jlfXCTF1/V/asOThZ4XpFp3FqE=;
 b=R+zxvCQLoG4H14QkxOU2ci1hFXq2q1rnu0vDyia1uKooJfTnK1GQ7hrA
 1KMIb9yOTkl9pHYZjWSVncFXt9TIS7PNv4WSLAo43FEKtwBMA0k1A1SSw
 /+10SBym2Mhwlr/Ao9AqcRc/vn5MJ06jrDf1dmxO1QrEreg5M++bPr7j0
 y+iKMlqOXvFTR3RBMS6UuMa0sPEQOJ3Vhfmh9fvG3qnnubUUOOGVBR3oL
 o3jGL1WbV9FDSIuufhAfFTa4zGjAw1oKffMf+XD8gukR9Q03YlZJYRE0d
 7c5aiARSzTqcDrQ1rzPc9DxLO83YZUFa5P/3k+s4AJ7Q8Q9EiCyEAc1vS g==;
X-CSE-ConnectionGUID: 5Ef/tRMOQdORsueR4ag8vg==
X-CSE-MsgGUID: T6v9otRpQkKr0XTiueN0ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38728731"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="38728731"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 10:46:46 -0800
X-CSE-ConnectionGUID: Gk3ruW/6Rlq+mBL6LLScpg==
X-CSE-MsgGUID: CDhuJ6D2Q+utqSb6GVwWtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="114398950"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 10:46:46 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 10:46:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 10:46:45 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 10:46:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sP8Jk3x7IQJNFpEla+X21CVjWx5iO1uLqL2GU4/xUceVaglBsYkvCNTBmiVIn+HH9Jr1vKjgmsI27Hz7BttE1rk6NdvvR6WHNxnDkQs/dLx+OhJ3sIZbcawaX4xYaGkM3QLTPDGuC4c0NSaML42L0rJbEQ3AcnOccsBn1nUueQhC+yDc9YgfxPrh2MzIE3ManBcm0q5kpfHCJSxUMFaynoNsAoT6DcwwoHu0JfbAr29ivpDoL9iYBhNLoE/brPIH4wXDR5uEGZvgSPAbrfekZPkEKPjojlJmLlaI2o6L5ISMO0S8iI9U8dmqMVr8mUcbs+eYOScY5NnfTlsXppzZkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xC334hlaxZcQYIMLQjUIGkHs4EefdFleXj+C6SKas7I=;
 b=aMBpADI2LH5hJuNOr0XeVNzhmWhX6/atQLL4P/2kU2HPMXbmcapzlaspUXGcKZwqmLUUAEBoSxYngI06W/1dDt9GQ/y80HvOaVS1MbMMVN75wW7l+Gl62tV6AcQwgPetukRrsVQWsiInjAWHnsYclP2wEV1e3APyZN8ylc/KpTqV+FthqpGknmo8RQZQFwNThBanoccsP0JJjVsL1OLNWA5LRGV2azUx801AdvCx20ZPig2PlTEN+sHYrF7RzPxnAPM2PruC5/5QnRWO6yEdtHhLNKBGPxxWRkKx82rzVnIgPQT8ocZD3/p3vRKN9vXsxskrQoMVRzHc3vKTAqa7sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by SJ2PR11MB7545.namprd11.prod.outlook.com (2603:10b6:a03:4cc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.24; Thu, 30 Jan
 2025 18:46:41 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%7]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 18:46:41 +0000
Date: Thu, 30 Jan 2025 10:46:37 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 4 3/7] drm/xe/eustall: Implement EU stall sampling
 APIs for Xe_HPC
Message-ID: <Z5vJDfYjpvdlNJy5@intel.com>
References: <cover.1736970203.git.harish.chegondi@intel.com>
 <28e9b33c1fd5164d611d1ea3caa45388278efe43.1736970203.git.harish.chegondi@intel.com>
 <85a5bafec6.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <85a5bafec6.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0251.namprd03.prod.outlook.com
 (2603:10b6:303:b4::16) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|SJ2PR11MB7545:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c3662a4-2349-40af-dd95-08dd415e6f5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y01BNndQL01RZGcvQ1JqdFR1eUh0MGs4UkIzSnFnL3lQSVJRRHZmY1ZpZ3hw?=
 =?utf-8?B?Nk5lZi82TW0wakNQNU95SWpvQlFrTk9CTTlrNGxPUW1vRU1CN1ArbWJkNlVX?=
 =?utf-8?B?WFVtMys0SUpoOTZkbHJsbWVJT0JxaFFPd0xHNVdTY05GOHhRMmZmbjBKZWR3?=
 =?utf-8?B?QWV6TE9HMCtxcEhMUUFONDc1NUJSOUhFelhWU1lManNFbVRicHFzNGJSRjBQ?=
 =?utf-8?B?RDRra25OOHFTd3BMbWZieGJuakFDOTJxZnBxY09JTk5kaFdpWXI5SFhKZnMr?=
 =?utf-8?B?RktRSlVYV1JCODZxcytHa0NLUzZBaGpCNTU2emYrbzRnRWJiT0lJYVVscmMy?=
 =?utf-8?B?VEI4T2RuZFh3cktMRkdSbDZBRTRiYW1zTktCc0RZbUhSSzRHdVhUa0llMlhj?=
 =?utf-8?B?aEl6bjNLWlVsK1pzenZIUlVLc1diU1psOXByMDZMU3hkdHk5b3JGSmNXaDEv?=
 =?utf-8?B?clJ1d05meDNORmRKU1Z0YUE5eE0wbkxQNUQ1Zlh2YzFKY3BDUkEyMGtqQlJF?=
 =?utf-8?B?ZUw0YWhSREVySEk0dklmZWhTd1BFMWcyaTJZNk9nZzNzc2xrU25vaGFaNFVu?=
 =?utf-8?B?ZEdsOHozS0RBRzZjOU83MFdMV2kzU1N5THoyN3o5M20vYVZPbmFsVHVJZjh5?=
 =?utf-8?B?R1ZiUTBpeW56L3U3Qko1alBod01ERFBSM2lpUEl5TDAxWjQ3NEZmcnM4N3RK?=
 =?utf-8?B?cE9zZUorVWJvaVhyaDNIRzNXUXNnZE5PWkc2ekRPT0dtdzg3MjhqZDg0MTg1?=
 =?utf-8?B?alliZ0ZLNmIzTFlPQVBPR21qbGd4NFdEcHNTT3gzZVQzNFdIWUZIZmVvMmQx?=
 =?utf-8?B?cFNtdlNuM21PSTYyTVloR1lOYjZJenlNUmV0MlN5OFVlRjdZSVJlNXVwMTRn?=
 =?utf-8?B?U1NRakdOUHZaeDl0cXdkM2JRYk5jTWFxb3M2a1UwRDRrdW5jaUkyU1FZdXBZ?=
 =?utf-8?B?a1REejZLLzRaelI1ejlZNVdFdEhROTI4VkFWVUxvdHJscUhvQ3RQc29PUC9T?=
 =?utf-8?B?bWtnWmgyRWJuZVUxb2lGMXRnNmFUUmFmT1dYejM4OTR6UWVabGNlayt3bHpN?=
 =?utf-8?B?WE9kbTRzbjkyNERPUm5tano3TEE5Um4xZUdZRmdwTVlNekRLR1VTYlZ5ZkpZ?=
 =?utf-8?B?TFpoVE5iWHVRWGN6bWl5bFhxOFc3ejhVeWNrMGxPZHJ2NkR1aENlUTR1SmtD?=
 =?utf-8?B?V1J3cVNNVi8ybGpWcHBVQzdaUmZNTWJQRXpMS1VucXBaeEZiU25WcXNLZ1Q2?=
 =?utf-8?B?NXg4Vm9pMldmeDJDVi9aVE1TY0pudDdXTkJKc0VxQVFWRkQvVUlncWxBUjNh?=
 =?utf-8?B?YU9ndDBqSEphTGM5ZDM2R0liWjNIUFdpR2dIbDBOdjVMcHhmUjhFOHZsa2lu?=
 =?utf-8?B?eUdpSVJWdFNUU0xUK2hjSlZwcVcyS0xJZUpQQUFKbmRISklpN3FUWnc0Q1hJ?=
 =?utf-8?B?WjQ3US8yNlF0RWlXSlh3V1p6VFFCRHBHaHNwU2k4OFZGeks3TXBDemxtQVZS?=
 =?utf-8?B?cVZCMzlNdXdKRThmZWJHTDdiUVlCTXJPVnhDUDdwQyt3UC9ldU1qcnJncnR1?=
 =?utf-8?B?SmplbHdkanZITVVtRm9mWkxINW5WVnN0ZHVvY3FmdEJVMlpIQXVFNTJVbW9Q?=
 =?utf-8?B?M0VKR1FUSmlyaHFWWHNubVRxNG9KeUpKWjM1bVU0R092ZWNoR3luU2xlWko2?=
 =?utf-8?B?bzFUeFF5YzY5WG5uakxwQW9LQXlPSTlQeUV4T0xlTFVVVjRyKzc3NE1wRGxp?=
 =?utf-8?B?ODNNREl0WlJjL3M1TDl3NXpBVkdUcGpWOVd6WHE0blNaeTcwT3lqZXZpL1pj?=
 =?utf-8?B?WjFHZlRvcklyM1FXRWhQc3RyNVVhL1R4SHUyMk8zVGU1d1I0bGJlSGZDUTB1?=
 =?utf-8?Q?tVGb0xLbjF7O+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWlldU5mVHJBZXdydXpxcDJqSm1RRTdxMnlFL1ZNbFAyYStQUzEvZ01vTDcx?=
 =?utf-8?B?aVVVam80WE5vcFNqWWRFUk5LQmJvTGdWQm9BTTFHMzEyem5KU0ZqcFhUUmE0?=
 =?utf-8?B?Ujk1ZGtIUW1GRjBCMXpjeVJvZmpERUZyOFdnNVB3emhDR2ZaMmh3Zm9ZQlV2?=
 =?utf-8?B?UUx3V21YMGRZSzVtb2dkUTRLSUNneGU5aUl6cXVTdUg3NFMyT3Y3bit0a1ht?=
 =?utf-8?B?Q3d0Y3ZoaWhadU1YWUtMOFhSZVEwa241cnFJbXAyT0FkYkozT0ZMN0tScGpI?=
 =?utf-8?B?WTVwSkxFcmFCd3kzeUhCa0ZWVG85aGVTek5MSWw2Qlg3MVNZc2RpQUVmUTVL?=
 =?utf-8?B?ejNWS3NBWUlxbFhTT01IMU1EN0swbVBhK2t3RGJyU0VHSTdxWS92YzhOMXJx?=
 =?utf-8?B?OUd1bnpUY1JXYnFnc0JPTkVPYWpiVFFlZVhZOWNlRGhkU2YwYkNzdlVoS1p6?=
 =?utf-8?B?S1RoN2xramdGYjVacXJsQmdDMUxzN2VtWWRBVXFGSit5RzhGR0U1ME1QU0FW?=
 =?utf-8?B?K1V5eFRFTkZwWG9nLzBoZkROS2YzejVlRU92WW56K3Y0cG1tWWlZYjAwRkQ5?=
 =?utf-8?B?bjI1Mm1WamoyeHovN2ZnNE9KNGVqNWUwVll6QVJ6SVJjcEdLdXN6THBqTVR0?=
 =?utf-8?B?VDhuSXVHUURZaytLbUQraTdyM3JvOGJsL01INncxVHoyTThMSEJFQWc2Y1hC?=
 =?utf-8?B?NldiQStEUlR1Slc1RFN2U2xUdEs4NW1BRC9lelVEMEY0OFNodTlKT0pKUGZD?=
 =?utf-8?B?N3FIOGNlb2dtemhPblFVYzQ3VW1MK3p4S3VJb0FSMXJwbmphTFUrYkFaSGh4?=
 =?utf-8?B?NlBxV0c4ckRCcEl0UmZCK1FUUm9oUkhpc1JjRmd6SUFxUWk5MXJkNnlXNU0v?=
 =?utf-8?B?MWk1eC82MFdkSWx0enJ4eVBkdlUvZXdNTDUxaURqeUdvY09sMk9lREtiY05y?=
 =?utf-8?B?aEF4Mzdpdy9YWjJVbm4vb0p5eHkxKzVoNGh5WjNaZjdKOEs4Mlk3MEtTRTZT?=
 =?utf-8?B?Z3R0WGlnbTRWL0ZjMDFxNXo5TjlMaWl4U3lSMXI5Y1I5WkxrOGZ2WU9yK0JO?=
 =?utf-8?B?blVGekc5MHBFckduK1FWSndoSjVoSzdiWER6Y3FxOSt1QVNhVFNIbDlNUjRt?=
 =?utf-8?B?NkNqK0V0SFJlaHdHclNaaXpORlFNUlZyQTBKTXNic2JUaDVteHVoTDVOeWdj?=
 =?utf-8?B?SFNlckRYQ3VSR3FHQmZ5VjFZRWY0cnlIVkRSTk1VRHU2VTFEV1pNOWRkOG5s?=
 =?utf-8?B?MzlXYzBpTUF4RHdBcmM2U0ljb3J4UmhqbG4wVllXeVRUZDBGdDhwWTBLbDVa?=
 =?utf-8?B?aVpSc3JHckk1VSt4dGs3K1pheWVEMThWWU5VY1lVZWxyWHdOck5ZcVkwakZN?=
 =?utf-8?B?TENoU1ZIc2daV1JQNUVKbk51WWExVFJjTS8za2VyZFhiQ2JXbkQxQWNwWlM4?=
 =?utf-8?B?bDJuS0dTaE02WHl4MVc1ckJsWlFCMFUrVjd0azlucHpBdzdCRDBMZXM3YjZk?=
 =?utf-8?B?SXgvUWpLb2hNeWRmTmFmNCtZb1BsWUU3R0w1cUlDUnpxTkg0UzFuMVlWWHJR?=
 =?utf-8?B?RVlVcnZSemk3VFBsalNJeGFwU1hacGkvK1lQN0ZpMGxQRHJPUFZsZXFyUytS?=
 =?utf-8?B?VVdQMkRwNDcrQjNMMVhKUEI3ajB6ZVc3OXNMbG14R3doRERCVzE4dzlUNHpN?=
 =?utf-8?B?MEtHdnc0S0tHdm5qUEE5Y21wUWh5NmMrSklTOG9OZ3pXaDdsN3MvYUpzTVV4?=
 =?utf-8?B?dXlhMWhNeU1ENFhKWGVhUUdUQkJBa205TnUvY2hHYUZDWTgyTHRubnFuVTdw?=
 =?utf-8?B?ZGRQcEk3V2dETHV2czVJZUJhYXBzU1lVWHR6UTc1MGZXSWp4S29RS05hVURP?=
 =?utf-8?B?eHNsWnAvS0Q1azRjMklCZDBxYk1BTEVNNE9QaXJkRzg3Z3BQc21yZ256THU3?=
 =?utf-8?B?OGdoNWRiVUNBdUs4azZEdmQweUpRNThWdlpUamE0RmpHNjlWZnJubWFMOHIr?=
 =?utf-8?B?UnlPUnVTaVMvS1dqdXByYVpmNE8raGZYcHVvL3FCYll3QW5VWldKcFhWR3Bw?=
 =?utf-8?B?akFMTEN1Y05DbnBINHVHMXFsbEdHKzVjY0hQOTN4c1BheUpsdTQrRVl1V1N0?=
 =?utf-8?B?OVJrTlZJMDk1V0pGRlRtNmYvcm1zQUxmb1NrSlczS1NaQVpxSEhGNXZUU3c3?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c3662a4-2349-40af-dd95-08dd415e6f5b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 18:46:40.9022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZMoDGWx2vGxfeuus6gO23b1pBvoKDX1L7R21c4Xaztk0rvFq30soTBG2rE201+45SQZYhfuVMCFjY08DLDm3WiDC4mVb3TZoQsYHnqEJdBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7545
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

On Tue, Jan 28, 2025 at 08:12:25PM -0800, Dixit, Ashutosh wrote:
> On Wed, 15 Jan 2025 12:02:09 -0800, Harish Chegondi wrote:
> >
> 
Hi Ashutosh,
> Hi Harish,
> 
> Reveiw #4 on the same patch. Final review on this version of the patch. I
> have suggested some low level code changes which should work but would need
> to be verified (the code, as well as tested).
> 
> Also, I don't understand really what's going on in these circ buffer
> functions with the overflow bits. So I need some explanation as to what the
> code is doing and whether what's going on here is really correct.
> 
> So basically what I don't understand here is whether:
> 
> 	if (write_offset > read_offset)
> 
> should really be
> 
> 	if (write_offset >= read_offset)
> 
> Basically what happens when 'write_offset == read_offset'. We should be
> using the overflow bits "somehow" according to me in this case but we don't
> seem to be doing that.
> 
> This is repeated several times in my comments below. But if you have an
> explanation just explain it here, don't have to repeat it each time.

1. The code you are referring to calculates the size of data in a
non-empty circular buffer, i.e. when buffer read ptr != write ptr.
It is an unnecessary function call overhead to call buf_data_size()
when the buffer is empty (read ptr == write ptr).

2. read/write pointers contain the overflow bit, read/write offsets do
not contain the overflow bit. They are just offsets into the buffer.

3. When the buffer is full, write offset == read offset, but the
overflow bits are different. The if (write_offset > read_offset) has
an else size = buf_size - read_offset + write_offset; which gets
executed when buffer is full (write offset == read offset).

4. I can add in the documentation of buf_data_size() that it
should be called for non-empty buffers only.

5. I have verified with several examples that there is no bug in the
code you are referring to.

> 
> > @@ -144,6 +230,236 @@ static int xe_eu_stall_user_extensions(struct xe_device *xe, u64 extension,
> >	return 0;
> >  }
> >
> > +/**
> > + * buf_data_size - Calculate the number of bytes in a circular buffer
> > + *		   given the read and write pointers and the size of
> > + *		   the buffer.
> > + *
> > + * @buf_size: Size of the circular buffer
> > + * @read_ptr: Read pointer with an additional overflow bit
> > + * @write_ptr: Write pointer with an additional overflow bit
> > + *
> > + * Since the read and write pointers have an additional overflow bit,
> > + * this function calculates the offsets from the pointers and use the
> > + * offsets to calculate the data size in the buffer.
> > + *
> > + * Returns: number of bytes of data in the buffer
> > + */
> > +static u32
> > +buf_data_size(size_t buf_size, u32 read_ptr, u32 write_ptr)
> > +{
> > +	u32 read_offset, write_offset, size = 0;
> > +
> > +	read_offset = read_ptr & (buf_size - 1);
> > +	write_offset = write_ptr & (buf_size - 1);
> > +
> > +	if (write_offset > read_offset)
> 
> >=
No. The else part gets executed for == case.
> 
> See xe_oa_circ_diff. Surprised to see such a basic "bug" (though looks like
> it is offset by other code so maybe not a real bug). Am I missing something
> (e.g. because of the overflow bits)?
This function will be called only for non-empty buffers. I don't think
there is a bug in this code.
> 
> > +		size = write_offset - read_offset;
> > +	else
> > +		size = buf_size - read_offset + write_offset;
> > +
> > +	return size;
> 
> Though I think we should be using the overflow bits here to determine if
> the buffer is empty or full. Why are we not doing that?
This function would not be called when the buffer is empty
(read ptr === write ptr). It is an unnecessary function call overhead to
call this for empty buffers.
> 
> Basically what happens when 'write_offset == read_offset'? Shouldn't we
> look at overflow bits to figure out if buffer is empty or full?
The else part gets executed correctly when the buffer is full. I will
add a note in the function documentation that this function will be
called only for non-empty buffers.
> 
> > +}
> > +
> > +/**
> > + * eu_stall_data_buf_check - check for EU stall data in the buffer
> > + *
> > + * @stream: xe EU stall data stream instance
> > + *
> > + * Returns: true if the EU stall buffer contains minimum stall data as
> > + *	    specified by the event report count, else false.
> > + */
> > +static bool
> > +eu_stall_data_buf_check(struct xe_eu_stall_data_stream *stream)
> > +{
> > +	u32 read_ptr, write_ptr_reg, write_ptr, total_data = 0;
> > +	u32 buf_size = stream->per_xecore_buf_size;
> > +	struct xe_gt *gt = stream->gt;
> > +	struct per_xecore_buf *xecore_buf;
> > +	bool min_data_present;
> > +	u16 group, instance;
> > +	unsigned int xecore;
> > +
> > +	min_data_present = false;
> 
> Init this above where it is declared.
Will change.
> 
> > +	for_each_dss_steering(xecore, gt, group, instance) {
> > +		xecore_buf = &stream->xecore_buf[xecore];
> > +		mutex_lock(&xecore_buf->lock);
> > +		read_ptr = xecore_buf->read;
> > +		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT,
> > +						       group, instance);
> > +		write_ptr = REG_FIELD_GET(XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK, write_ptr_reg);
> > +		write_ptr <<= 6;
> > +		write_ptr &= ((buf_size << 1) - 1);
> > +		if (write_ptr != read_ptr && !min_data_present) {
> 
> Check for the first condition is not needed after the suggested change to
> buf_data_size above.
It is an unnecessary function call overhead to call buf_data_size() when
buffer is empty (write_ptr == read_ptr)
> 
> So this is:
> 		if (!min_data_present) {
> 
> > +			total_data += buf_data_size(buf_size, read_ptr, write_ptr);
> > +			/*
> > +			 * Check if there are at least minimum number of stall data
> > +			 * rows for poll() to indicate that the data is present.
> > +			 * Each stall data row is 64B (cacheline size).
> > +			 */
> > +			if (num_data_rows(total_data) >= stream->wait_num_reports)
> > +				min_data_present = true;
> > +		}
> > +		if (write_ptr_reg & XEHPC_EUSTALL_REPORT_OVERFLOW_DROP)
> > +			set_bit(xecore, stream->data_drop.mask);
> > +		xecore_buf->write = write_ptr;
> > +		mutex_unlock(&xecore_buf->lock);
> > +	}
> > +	return min_data_present;
> > +}
> > +
> > +static void
> > +clear_dropped_eviction_line_bit(struct xe_gt *gt, u16 group, u16 instance)
> > +{
> > +	u32 write_ptr_reg;
> > +
> > +	/* On PVC, the overflow bit has to be cleared by writing 1 to it. */
> > +	write_ptr_reg = _MASKED_BIT_ENABLE(XEHPC_EUSTALL_REPORT_OVERFLOW_DROP);
> > +
> > +	xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT, write_ptr_reg, group, instance);
> > +}
> 
> Ideally all this handling of dropped data should be in the -EIO patch. So
> that should become the dropped packet handling patch. But anyway, let's
> focus on the code, not the patches.
> 
> > +
> > +static int
> > +xe_eu_stall_data_buf_read(struct xe_eu_stall_data_stream *stream,
> > +			  char __user *buf, size_t count,
> > +			  size_t *total_size, struct xe_gt *gt,
> > +			  u16 group, u16 instance, unsigned int xecore)
> > +{
> > +	u32 read_ptr_reg, read_ptr, write_ptr;
> > +	u8 *xecore_start_vaddr, *read_vaddr;
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	struct per_xecore_buf *xecore_buf;
> > +	size_t size, copy_size, buf_size;
> > +	u32 read_offset, write_offset;
> > +	unsigned long record_size;
> > +
> > +	/* Hardware increments the read and write pointers such that they can
> > +	 * overflow into one additional bit. For example, a 256KB size buffer
> > +	 * offset pointer needs 18 bits. But HW uses 19 bits for the read and
> > +	 * write pointers. This technique avoids wasting a slot in the buffer.
> 
> OK, but here I don't see overflow bits being used in this code to
> distinguish between buffer empty and full.
There are checks in the code for buffer empty condition
(read ptr == write ptr). As long as there is data to read, the driver
reads, and no special handling is needed when the buffer is full.
HW needs to do special handling when the buffer is full.
> 
> > +	 * Read and write offsets are calculated from the pointers in order to
> > +	 * check if the write pointer has wrapped around the array.
> > +	 */
> > +	xecore_buf = &stream->xecore_buf[xecore];
> > +	mutex_lock(&xecore_buf->lock);
> > +	xecore_start_vaddr = xecore_buf->vaddr;
> > +	read_ptr = xecore_buf->read;
> > +	write_ptr = xecore_buf->write;
> > +	buf_size = stream->per_xecore_buf_size;
> > +	read_offset = read_ptr & (buf_size - 1);
> > +	write_offset = write_ptr & (buf_size - 1);
> > +
> > +	if (write_ptr == read_ptr) {
> > +		mutex_unlock(&xecore_buf->lock);
> > +		return 0;
> > +	}
> 
> No need I think again, remove this if statement and let the code fall
> through. Let's avoid these if statements where possible.
The code below to calculate the size of the data in the buffer works
only for non empty buffers. So, this check is needed.
> 
> > +
> > +	trace_xe_eu_stall_data_read(group, instance, read_ptr, write_ptr,
> > +				    read_offset, write_offset, *total_size);
> > +	/* If write pointer offset is less than the read pointer offset,
> > +	 * it means, write pointer has wrapped around the array.
> > +	 */
> > +	if (write_offset > read_offset)
> 
> Once again, why not >= ?
For == case, the else part gets executed which is correct for non-empty
buffers.
> 
> > +		size = write_offset - read_offset;
> > +	else
> > +		size = buf_size - read_offset + write_offset;
> 
> Replace the above code section with:
> 
> 	size = buf_data_size(buf_size, read_ptr, write_ptr);
Yes, will do.
> 
> > +
> > +	/* Read only the data that the user space buffer can accommodate */
> > +	if ((*total_size + size) > count) {
> > +		record_size = xe_eu_stall_data_record_size(xe);
> 
> Maybe it makes sense to add the record size to the stream, so we don't need
> to this platform check each time. We can just initialize the record size at
> init time.
Sure.
> 
> > +		size = count - *total_size;
> > +		size = (size / record_size) * record_size;
> > +	}
> 
> Let's replace this code section by something like:
> 
> 		xe_assert(xe, count >= *total_size);
I don't think an assert is appropriate here.
> 		size = min_t(size_t, count - *total_size, size);
> 		size = (size / record_size) * record_size;
> > +
> > +	if (size == 0) {
> > +		mutex_unlock(&xecore_buf->lock);
> > +		return 0;
> > +	}
> 
> Remove, again let the code fall through the if-else ladder
> below. copy_to_user should handle 0 byte copies (i.e. ignore them). But
> check that. Wouldn't this work?
> 
> > +
> > +	read_vaddr = xecore_start_vaddr + read_offset;
> > +
> > +	if (write_offset > read_offset) {
> 
> >= , again, with the same overflow bit issue potentially.
No. This check is to find out if the write pointer has wrapped around
the buffer which is correct.
> 
> > +		if (copy_to_user((buf + *total_size), read_vaddr, size)) {
> > +			mutex_unlock(&xecore_buf->lock);
> > +			return -EFAULT;
> > +		}
> > +	} else {
> > +		if (size >= (buf_size - read_offset))
> > +			copy_size = buf_size - read_offset;
> > +		else
> > +			copy_size = size;
> > +		if (copy_to_user((buf + *total_size), read_vaddr, copy_size)) {
> > +			mutex_unlock(&xecore_buf->lock);
> > +			return -EFAULT;
> > +		}
> > +		if (copy_to_user((buf + *total_size + copy_size),
> > +				 xecore_start_vaddr, size - copy_size)) {
> > +			mutex_unlock(&xecore_buf->lock);
> > +			return -EFAULT;
> 
> These copies look correct to me. Though not sure if we should replace all
> these error return with a 'goto exit' so that we have all returns from the
> end of the function. Do mutex_unlock etc.  in exit. But anyway, probably ok
> as is too.
> 
> > +		}
> > +	}
> > +
> > +	*total_size += size;
> > +	read_ptr += size;
> > +
> > +	/* Read pointer can overflow into one additional bit */
> > +	read_ptr &= ((buf_size << 1) - 1);
> 
> Outer brackets not needed unless compiler complains.
Will remove them.
> 
> > +	read_ptr_reg = REG_FIELD_PREP(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, (read_ptr >> 6));
> > +	read_ptr_reg &= XEHPC_EUSTALL_REPORT1_READ_PTR_MASK;
> 
> Why? Doesn't REG_FIELD_PREP already do this?
Yes, will remove.
> 
> > +	read_ptr_reg = _MASKED_FIELD(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, read_ptr_reg);
> > +	xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT1, read_ptr_reg, group, instance);
> > +	if (test_bit(xecore, stream->data_drop.mask)) {
> > +		clear_dropped_eviction_line_bit(gt, group, instance);
> > +		clear_bit(xecore, stream->data_drop.mask);
> > +	}
> 
> Ideally, this dropped data stuff should be in the -EIO patch.
> 
> > +	xecore_buf->read = read_ptr;
> > +	mutex_unlock(&xecore_buf->lock);
> > +	trace_xe_eu_stall_data_read(group, instance, read_ptr, write_ptr,
> > +				    read_offset, write_offset, *total_size);
> 
> Why another trace?
Now that the read pointer has changed, I wanted to capture the new read
pointer in the trace.
> 
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_eu_stall_stream_read_locked - copy EU stall counters data from the
> > + *				    per xecore buffers to the userspace buffer
> > + * @stream: A stream opened for EU stall count metrics
> > + * @buf: destination buffer given by userspace
> > + * @count: the number of bytes userspace wants to read
> > + * @ppos: (inout) file seek position (unused)
> > + *
> > + * Returns: Number of bytes copied or a negative error code
> > + * If we've successfully copied any data then reporting that takes
> > + * precedence over any internal error status, so the data isn't lost.
> > + */
> > +static ssize_t
> > +xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *stream,
> > +			       struct file *file, char __user *buf,
> > +			       size_t count, loff_t *ppos)
> 
> Don't need ppos in this static function.
Okay.
> 
> > +{
> > +	struct xe_gt *gt = stream->gt;
> > +	size_t total_size = 0;
> > +	u16 group, instance;
> > +	unsigned int xecore;
> > +	int ret = 0;
> > +
> > +	if (count == 0)
> > +		return -EINVAL;
> 
> This should not be needed (and if it is needed it should be in
> xe_eu_stall_stream_read). It should get handled automatically in
> xe_eu_stall_data_buf_read with suggested changes. If not let's see.
Will check.
> 
> > +
> > +	for_each_dss_steering(xecore, gt, group, instance) {
> > +		ret = xe_eu_stall_data_buf_read(stream, buf, count, &total_size,
> > +						gt, group, instance, xecore);
> > +		if (ret || count == total_size)
> > +			goto exit;
> 
> break
Will change.
> 
> > +	}
> > +exit:
> > +	if (total_size)
> > +		return total_size;
> > +	else if (ret)
> > +		return ret;
> > +	else
> > +		return -EAGAIN;
> 
> return total_size ?: (ret ?: -EAGAIN);
> 
> See xe_oa_read.
Will do.
> 
> > +}
> > +
> >  /**
> >   * xe_eu_stall_stream_read - handles userspace read() of a EU stall data stream fd.
> >   *
> > @@ -160,11 +476,265 @@ static int xe_eu_stall_user_extensions(struct xe_device *xe, u64 extension,
> >  static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
> >				       size_t count, loff_t *ppos)
> >  {
> > -	ssize_t ret = 0;
> > +	struct xe_eu_stall_data_stream *stream = file->private_data;
> > +	struct xe_gt *gt = stream->gt;
> > +	ssize_t ret;
> > +
> > +	if (!stream->enabled) {
> > +		xe_gt_dbg(gt, "EU stall data stream not enabled to read\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (!(file->f_flags & O_NONBLOCK)) {
> > +		do {
> > +			if (!stream->pollin) {
> 
> This is not needed. wait_event_interruptible automatically checks if cond
> is true before waiting, it will not wait if cond is true. See
> xe_oa_wait_unlocked.
Okay, will check and remove.
> 
> > +				ret = wait_event_interruptible(stream->poll_wq, stream->pollin);
> > +				if (ret)
> > +					return -EINTR;
> > +			}
> > +
> > +			mutex_lock(&gt->eu_stall->lock);
> > +			ret = xe_eu_stall_stream_read_locked(stream, file, buf, count, ppos);
> > +			mutex_unlock(&gt->eu_stall->lock);
> > +		} while (ret == -EAGAIN);
> > +	} else {
> > +		mutex_lock(&gt->eu_stall->lock);
> > +		ret = xe_eu_stall_stream_read_locked(stream, file, buf, count, ppos);
> > +		mutex_unlock(&gt->eu_stall->lock);
> > +	}
> > +
> > +	stream->pollin = false;
> 
> Generally speaking this doesn't work if user buffer is too small, in that
> case we don't want user thread to block when it calls in the next time to
> read. See bcad588dea538 . But since this is a corner case, I am ok fixing
> this after the initial merge.
Will check the commit bcad588dea538.
> 
> >
> >	return ret;
> >  }
> >
> 
> Thanks.
> --
> Ashutosh

Thanks for the review
Harish.
