Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B64D35E57
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 20:57:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B663810E432;
	Tue,  5 Nov 2024 20:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iiKh6El+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C212A10E432
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 20:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730840258; x=1762376258;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GaBEqb5WJGUdl/GS8Wusma2ZEfN63i9EZjEihgcIXgA=;
 b=iiKh6El+R0esTi6BrpmRuCmslq1vsYODpl4Sl6C8Cj4bzuzSiZzEhV/r
 LruoUY2Qgn7di8h1NRazfz64hRX9OytmvREohiITnXT1QNB3y+5sDMEC+
 P5StlIwy0PtVBmf86qacOfApv3rMqbTTuvZ8Fo7ZkMmHMY0awEInvUb0v
 B0h9gTURkRfx85A6B5bokojLxpd4ORIp/toONNAuzRC6hwJvrh8r/hbkB
 DPi9yKyNrFDuhifKUj8qLt7GgtVsdYV1H1rOipuaWf9qaGvPvWj5Z63LA
 64S6BTOKvrtGK5bxCLBuST6QGqPk6zeNUtqPMwR8Oce/zxD9aL8AQXoop w==;
X-CSE-ConnectionGUID: ApY9zOHvQIaICJxx9LNO3Q==
X-CSE-MsgGUID: 92qV2WDZTg6RMn1vh7gZWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30568680"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30568680"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 12:57:37 -0800
X-CSE-ConnectionGUID: w7cpl7rdRHKiEhF8hxkbSQ==
X-CSE-MsgGUID: AH8Q5j3QS6OTawRaDUibLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="88736919"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 12:54:54 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 12:54:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 12:54:54 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 12:54:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2WP4VmLaijCn088yYleDso8n9HqTr5DiFHEz/HH3cS8vX6fMl5nN6VD8873XisrlnvACCoiFuUOQKW5QqphZv0/i8TLRhNUZzKxdpB2x9gtbH/mERRGBedspK7D10fv9QaZ0In0+1s6PuZHL0YaoAbyIsatjOW3VhWuOVJ6gyDzPn8JKt4PPZdhYfEhgWK2wxH3X0IxSMZZi+qSTEJpJEbZAgHvevSnZtvtziK1aBqFu5f5hNP6jJFaSBYe9jL7/xrTyMBJ0OJjBbEaXqFiCD6UJsJ6RrOPBMpMFHSABuBtYuvcZHNZnGWeEZp5lq5aPsNX/lcHciK6xIKrCu2Tjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pK2ImfWVUgAEyatCnlHY25VtIaxSIORJimUcuNpRUDQ=;
 b=ZEDE9fyJ4fh0A+US4uZ0arDOYnvT0dmmsTY5dzxOt1TQ9Nn6+MnIpDDyH9o4fwSjgdVvhwmSgtYv0aSbTShIIXrtU2IEaaOYIOAxStQsHAdvagxwKjz9JC9k9j44Ms+5D1KFUoJc2NvJaOMpC8G44CVxnAOpWj3rxLyl3zSp8xtQ3rqDt9JaeKLRKsQbMuRHVqeDmro3xHHZpZ3Rpd3cNf//pU7YAtyJEHN9Xq1oeWY995PEUl4fJIfhb+eWySl3N0q0k0zNTxdyIS+TvuOQ0ULk9VL0q9Ia3pQOTKI+ZgSlDp2N/QFekb+dRRK/5yT6Io5pUXVKhllxTLqvJH7t1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CH3PR11MB7795.namprd11.prod.outlook.com (2603:10b6:610:120::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 20:54:52 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 20:54:51 +0000
Message-ID: <10b081e9-1cf6-44d9-9ee2-3ce47e099273@intel.com>
Date: Tue, 5 Nov 2024 15:54:49 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Fix missing init value and add register
 order check
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20241104182425.162007-1-zhanjun.dong@intel.com>
 <eca59faa5794c683892e72f7e7de028489c2aecd.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <eca59faa5794c683892e72f7e7de028489c2aecd.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0097.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::38) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CH3PR11MB7795:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b79bd14-b7f9-4cf9-e83b-08dcfddc17de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wnk5MTlOMTBCTDNwVWcydk9kck5MWVFGZzFldm1rWnVyTEVGMDZzeXBObjkr?=
 =?utf-8?B?SzV3R0VpVGFmMmNnTURqUGN4djlHcGFLWXY1cVBOMUwyU28wbEYvcFNwMldt?=
 =?utf-8?B?ZW5vR1hLcmJXUVYwU2pFQTZOQ1dSMy9Mb1lwVDhhRzF0VEdGQjdxdlE4MWx0?=
 =?utf-8?B?WHNudjIvK250UkZCUk4vTENZZy95bWovNzBsZUd5dFZVK0tsZTNFMUUrZ3ZX?=
 =?utf-8?B?WW5wK0M3V3cxOXY2dytZZEtLaldYaDh5T3FXMC8ydC9sOVhoQ09ROVlZK3da?=
 =?utf-8?B?Qjh4bmJvWjZPNGRJbXlROEcwWjRMdU1XRnpzVUVGODhKN0QwYjdNeEMwYTI4?=
 =?utf-8?B?cnRHY0E0bUQzU05YcWVNTFFGU1hFNGVIVE01MUdtZ1M4RWwxT1BpcVZVbndu?=
 =?utf-8?B?V3BPQUR3QVA1SFNuUTgzUzJZZURpMXExQTdkN3dudXgxMG5MTHY1ZlJmcTBV?=
 =?utf-8?B?eUliZW94MmNmL1NFb01STHJuR2xNdUdKNVd0LzBYVnFOT2tOQTlwWDd4b0Nt?=
 =?utf-8?B?R0hycXVhd25vYkpNb1FDMm5IeHM4Y0NLbEFYeEZXTVlDZ3AvSk5pUkQ5TS9i?=
 =?utf-8?B?M2gyRHlqYTJZQWlUdlhxU2FuS013U0FLcC9pSnFXN2MxeUdUVms5VjdSSWU3?=
 =?utf-8?B?TXFTcXZUNDd3WmJmTXl2cXUzdDhVK2tlZDg1VjdUcXhLTXhXek55WUREQ3My?=
 =?utf-8?B?d3lRRlNweVplcDVtcGRLR2tvZ2dEbVVaNitCazU0TEl4bTVKVE4vU05ueDFI?=
 =?utf-8?B?aWZtTDNTR0RUQkxDZm1Nb0p5Q3J5aGZUdmNIczNKdnNLZEpLVk1ISktuZDZQ?=
 =?utf-8?B?aVhYbFhWM1cwTm1VNGt3WWxYYlRiVFJiTmYvT3d5bjdDaG1HUnc3OTJxbVhB?=
 =?utf-8?B?NUJGVTdnazlGd3k5aWgwaHAxaG9JVEFYOTEzRkVaNkZvalNqODJzT2xQQ3gw?=
 =?utf-8?B?MUhXa2ZxM2V3ajFiRTlzTlZ5SldtajYyUWxCRHY0YmFKOERZNXVnTjU2VVpo?=
 =?utf-8?B?NFEzTlRNOTVzN0JOTWZRWkZjTWJSbU1pR215dldtTENrZEJqalpjMks0N2RO?=
 =?utf-8?B?cWxjcmhzelEzWHlHN2RoWnM0QWtDanF1Wm1qQjczNHpTQkhKT2pDVFJjYTI1?=
 =?utf-8?B?NC91R3VwNld6QmlCSlVGUGF5c0krVTlqV2Uyc08xSXh5K2VPODRIbkY1Tjll?=
 =?utf-8?B?Z2tSa3RQbHMrb2lFVzRncW8wem5HUmFrRFpacDRUU2xNZGY3NTFrZzlHeTVE?=
 =?utf-8?B?NEpMQWRQeGw0bHQyT1ZOQUlCRVNMdjJQS2dnUGE5cHZlTjBnWkFFWnBFdmtk?=
 =?utf-8?B?WCt3eTk3a1A5dFpOZmhSdmN1cWtmUktnczNmZG05OHh1U0prUzhlMytGeDY4?=
 =?utf-8?B?THVmelR0RUhUUEI2eE1zeWtFdGFwSWZ4RE8vTFBGRzhmK2kreTVFZUJYdWZq?=
 =?utf-8?B?cEJZakM3cWVTRnc5UE9NdzVvZVF4bjBwWGxIZVR5bXY3Y21ISEhwV1BXa3ln?=
 =?utf-8?B?YVB6MUpzTjZQTXpCa0k5Q1dNcVpSbWRDeXhDUFNJMGZBdm42c2NIQkJCNG8x?=
 =?utf-8?B?dXc2QXBsT1plcGRSOWNXQi9qUTRXd1lzRGFlV0hDUVpBMGh4SGVCSmU1cHpi?=
 =?utf-8?B?TUh4R2ZOTmtBTHRMYjNDY0x4aktrTUVBV0I3QXZjdmJNTW9VOFY5WTh3aVZ6?=
 =?utf-8?B?YVhraSs4cExwdUJkWjBPbWl1aG5EYkdQVUU3RTY1UlRZc0NIK1czRUZpelI2?=
 =?utf-8?Q?tRMRfTmky+xcVTfLUI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2xQRzlVZStGdk8wdlJKT09FR09zUTBlUmhWMWtKNDJYZ01lUTdSbXY0TnZ0?=
 =?utf-8?B?QlN5Nk1yV1gzWG9qdHlJNVBhRXpia2l0Z1JJYXVaS2lKdUt3MmRvbWc5Ymg1?=
 =?utf-8?B?T2g1QU5kL0NWWThJalUzazNpMHlaaEhiQmI1ejZKQUthT04yKzg0TENNTzBo?=
 =?utf-8?B?cEFHMnhuai9ocmF2Q3psUTJvdkkrYVVya2c1RThQVkV3akhzbC80WFJZRmI0?=
 =?utf-8?B?aXFOVmwwSmQwaHcwSWZpSG5VQ2d5MEQ2cktRUERtREtpUTZrUFlyZThINVk2?=
 =?utf-8?B?SkZoazFIbnZtVUVyV0xUYS9nRlI2bU1vcnJVZ2JFRkU0MTV3QUhveFZqWkJu?=
 =?utf-8?B?YWcvbWdUNzdZZGRHTFVPWll2N05UcExuaDhnRXVjRzFGdlFPQ2tKNllLQ1J0?=
 =?utf-8?B?TjRIVmZsM2xmNkRLWU1zVnY0TzByeEtnUkRYV1kyQWFja0Nwa1pPaEx1c0xH?=
 =?utf-8?B?VHp6aXpzclZ5V21MR3c2VUNkSkcrUDUrQmJ4Z2FhVVBWZTFxcE9XajBKQzV1?=
 =?utf-8?B?MXo0SDdyOWV1RnJpdSt1Q1R5R3BkdTJiek5BdlRJeDJadFhHTGFZeUg2ZFpQ?=
 =?utf-8?B?S01EZHNDU1hzV09PZWp5MEFOSWxoZkY3VjlGWHcxRUhMekFUTWlUTWpoU1lp?=
 =?utf-8?B?UG5hcVVFL01KbDBIZ0diM09OVVJ2OUdQMVNkVDFORzNBUVp5Q2xYeUNrdWF0?=
 =?utf-8?B?dEc3UGxPaVh0d0NVQkdXYjNaNE1SWmRKTFptNGMyVDdaMjhpWEY3N2NaN0F1?=
 =?utf-8?B?OWVVOVR5MWJPcVIrdy96RHYrK0xkQ2hBTTJ1cXNiVEVpNXA0cWdBRnVHZVRV?=
 =?utf-8?B?YXZ0VlBTTWFDcGpCWlphRTA2aC9CaisrQ3lZVjA2R0Z0WmlDbVZXUVc0amhS?=
 =?utf-8?B?MW5rWFNCTCtTazRFd0pZNFNKcDNhSFg1UW5Hc3N3eU5qTVZhVHduMlAzNGRQ?=
 =?utf-8?B?d0NZOGt5dmZBRVZST3pvbldZMVo0QnBPNzZXa3RsQUxzMzhvZUdMNWZDc3pu?=
 =?utf-8?B?R1VQenhHV2ZacXdGTmxGRnJqMmNobHg0TzRBSzZtSW5GMEI4dGZtVzVnOXFj?=
 =?utf-8?B?LzZZTkVQZTB5bzI0QloyMjNadDBrUVRmMWl2SGk1Nm50dkUrcklrbWZGRXN1?=
 =?utf-8?B?b3RXMitKTktMUG5sbjdGcXhJQ2dpNTllMkhJRFAxR0hqWlp3ck94Q2VQUit4?=
 =?utf-8?B?SkRQREhFcFUzWTZzTWJ6OENZcW1ralpNNEtqd0dwUi91QU5oNTZHMmwyT29n?=
 =?utf-8?B?dlByYVlEcFlWUUc5aXAwRGZWUkpUQ01WWThSeFk4M0R6K3VTajBhNVMxODhX?=
 =?utf-8?B?cm51VmFJVUZGakp3eHZaOEdHOExUdlMvVHo0UldHZkhiZFZMaTFCL0RsSGU1?=
 =?utf-8?B?MmhmcmxjcGxTUkZURms2bTc0TnRVUjFrSFl5VVp5R2lEb3hWQUVsMUl2aW5F?=
 =?utf-8?B?VHdXU0x4WHQyeW9TTVhCdm5yVFN4eVFuNXJZOGd0SkdlaHBhL3U0UytkRHFH?=
 =?utf-8?B?bnlJaHNraVNNWEtGdUVFandMQTBnRkMzcFE4RGFPaVI0cmxiTk82MHB4emRE?=
 =?utf-8?B?R2FRN05mVjlqT2cyVitrM1dLeU5DbVBpZWg3UXJuSjJOQ2NLc0MvbzhBQUww?=
 =?utf-8?B?NFFCTU9sb2s5WEIvY3dsd0ZSQ1ErU1U3NnI1aGhPRW9BSmxOeGxNVlVCbi9G?=
 =?utf-8?B?OGo4L2JLYUZLbGZiLzBYUXlKS2ZlYUp5S0l0b2dHY2lVT292S1diN3hpNHRO?=
 =?utf-8?B?T1ByanJtVmUya2R2NmtiRGtleFk5VkVLNXI3NVM3WTFFczlRRnZMZmpKSUJE?=
 =?utf-8?B?em1VcW92MTRFLzM3TDliRlVOOHE5ekllaHNsUVVFVWVXY0loa1J3THMza3J4?=
 =?utf-8?B?K0poQndDbEtNMGdCcXdkMnNqL3VtcTBMelBSeUcrL1o4S0F1SlFiQkJjckZO?=
 =?utf-8?B?Rk8veFhnREloZmtWc3ZwNGQwR0c5M0daanZCeXREakZKYnd2TDM2bFNsN0tZ?=
 =?utf-8?B?L0d0Mm9vWUsrWkRaNS92TGVjd2I4WUUvd0tSc210VkVhVUlJd0VpQitOYzNP?=
 =?utf-8?B?dkZlNys1OElQY3lXYXJac2Q4NXQ4MFNremFnL25HakFmSkZCMTNKOTNoSTVI?=
 =?utf-8?Q?rAfrBBevoa8OXTjQ6N6horKom?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b79bd14-b7f9-4cf9-e83b-08dcfddc17de
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 20:54:51.6570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RDKp78BB7f0h6Y07unCe+cX726M1x+ASEh/hGLW9rmKPlYThD08A45s7BmLW+EZbdsXiyKDg+YCNKq+dSKM6rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7795
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



On 2024-11-05 2:09 p.m., Teres Alexis, Alan Previn wrote:
> A couple of nits, else LGTM, so:
> 
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>

Thanks for review.

> 
> On Mon, 2024-11-04 at 10:24 -0800, Zhanjun Dong wrote:
>> Fix missing initial value for last_value.
>> For GuC capture register definition, it is required to define 64bit
>> register in a pair of 2 consecutive 32bit register entries, low first,
>> then hi. Add code to check this order.
>>
>> Fixes: ecb633646391 ("drm/xe/guc: Plumb GuC-capture into dev coredump")
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>
>> Changes from prior revs:
>>   v2:- Correct the fix tag pointed commit
>>        Add examples in comments for warning
>>        Add 1 missing hi condition check
>> ---
>>   drivers/gpu/drm/xe/xe_guc_capture.c | 80 +++++++++++++++++++++++------
>>   1 file changed, 64 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
>> index cc72446a5de1..8e534471b566 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -102,6 +102,7 @@ struct __guc_capture_parsed_output {
>>    *                   A 64 bit register define requires 2 consecutive entries,
>>    *                   with low dword first and hi dword the second.
>>    *     2. Register name: null for incompleted define
>> + *     3. Incorrect order will trigger XE_WARN.
>>    */
>>   #define COMMON_XELP_BASE_GLOBAL \
>>          { FORCEWAKE_GT,                 REG_32BIT,      0,      0,      "FORCEWAKE_GT"}
>> @@ -1675,10 +1676,10 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>>          struct xe_devcoredump *devcoredump = &xe->devcoredump;
>>          struct xe_devcoredump_snapshot *devcore_snapshot = &devcoredump->snapshot;
>>          struct gcap_reg_list_info *reginfo = NULL;
>> -       u32 last_value, i;
>> -       bool is_ext;
>> +       u32 i, last_value = 0;
>> +       bool is_ext, low32_ready = false;
>>   
>> -       if (!list || list->num_regs == 0)
>> +       if (!list || !list->list || list->num_regs == 0)
>>                  return;
>>          XE_WARN_ON(!devcore_snapshot->matched_node);
>>   
>> @@ -1701,29 +1702,76 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>>                          continue;
>>   
>>                  value = reg->value;
>> -               if (reg_desc->data_type == REG_64BIT_LOW_DW) {
>> +               switch (reg_desc->data_type) {
>> +               case REG_64BIT_LOW_DW:
>>                          last_value = value;
>> +
>> +                       /*
>> +                        * A 64 bit register define requires 2 consecutive
>> +                        * entries in register list, with low dword first
>> +                        * and hi dword the second, like:
>> +                        *  { XXX_REG_LO(0), REG_64BIT_LOW_DW, 0, 0, NULL},
>> +                        *  { XXX_REG_HI(0), REG_64BIT_HI_DW,  0, 0, "XXX_REG"},
>> +                        *
>> +                        * Incorrect order will trigger XE_WARN.
>> +                        *
>> +                        * Possible double low here, for example:
>> +                        *  { XXX_REG_LO(0), REG_64BIT_LOW_DW, 0, 0, NULL},
>> +                        *  { XXX_REG_LO(0), REG_64BIT_LOW_DW, 0, 0, NULL},
>> +                        */
>> +                       XE_WARN_ON(low32_ready);
>> +                       low32_ready = true;
>>                          /* Low 32 bit dword saved, continue for high 32 bit */
>> -                       continue;
>> -               } else if (reg_desc->data_type == REG_64BIT_HI_DW) {
>> +                       break;
>> +
>> +               case REG_64BIT_HI_DW: {
> alan: nit: now that you have moved to a switch statement, is this { really required?
Few concerns:
1. Have {} here will make it works on most compilers and ANSIC settings.
2. Local variable "u64 value_qw" will be limited within this case 
statement, I don't want it to be referenced on other case statement.

>>                          u64 value_qw = ((u64)value << 32) | last_value;
>>   
>> +                       /* Incorrect 64bit register order. Possible missing low.
>> +                        * for example:
>> +                        *  { XXX_REG(0), REG_32BIT, 0, 0, NULL},
>> +                        *  { XXX_REG_HI(0), REG_64BIT_HI_DW, 0, 0, NULL},
>> +                        */
>> +                       XE_WARN_ON(!low32_ready);
>> +                       low32_ready = false;
>> +
>>                          drm_printf(p, "\t%s: 0x%016llx\n", reg_desc->regname, value_qw);
>> -                       continue;
>> -               }
>> +                       }
> alan: nit: ditto
>> +                       break;
>> +
>> +               case REG_32BIT:
>> +                       if (low32_ready) {
>> +                               /* Incorrect 64bit register order. Possible missing high.
>> +                                * for example:
>> +                                *  { XXX_REG_LO(0), REG_64BIT_LOW_DW, 0, 0, NULL},
>> +                                *  { XXX_REG(0), REG_32BIT, 0, 0, "XXX_REG"},
>> +                                */
>> +                               XE_WARN_ON(!low32_ready);
>> +                               low32_ready = false;
>> +                               break;
>> +                       }
>>   
>> -               if (is_ext) {
>> -                       int dss, group, instance;
>> +                       if (is_ext) {
>> +                               int dss, group, instance;
>>   
>> -                       group = FIELD_GET(GUC_REGSET_STEERING_GROUP, reg_desc->flags);
>> -                       instance = FIELD_GET(GUC_REGSET_STEERING_INSTANCE, reg_desc->flags);
>> -                       dss = xe_gt_mcr_steering_info_to_dss_id(gt, group, instance);
>> +                               group = FIELD_GET(GUC_REGSET_STEERING_GROUP, reg_desc->flags);
>> +                               instance = FIELD_GET(GUC_REGSET_STEERING_INSTANCE, reg_desc->flags);
>> +                               dss = xe_gt_mcr_steering_info_to_dss_id(gt, group, instance);
>>   
>> -                       drm_printf(p, "\t%s[%u]: 0x%08x\n", reg_desc->regname, dss, value);
>> -               } else {
>> -                       drm_printf(p, "\t%s: 0x%08x\n", reg_desc->regname, value);
>> +                               drm_printf(p, "\t%s[%u]: 0x%08x\n", reg_desc->regname, dss, value);
>> +                       } else {
>> +                               drm_printf(p, "\t%s: 0x%08x\n", reg_desc->regname, value);
>> +                       }
>> +                       break;
>>                  }
>>          }
>> +
>> +       /* Incorrect 64bit register order. Possible missing high.
>> +        * for example:
>> +        *  { XXX_REG_LO(0), REG_64BIT_LOW_DW, 0, 0, NULL},
>> +        *  } // <- Register list end
>> +        */
>> +       XE_WARN_ON(low32_ready);
>>   }
>>   
>>   /**
> 

