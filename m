Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A915C3600B
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 16:34:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C5410E45E;
	Mon, 31 Mar 2025 16:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AlrtQeg+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048BB10E45E
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Mar 2025 16:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743438893; x=1774974893;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gSuAE2FJVXal/eJ9ShsXhBNzAD2ueEs10NNKIfJne4A=;
 b=AlrtQeg+/PUoJXmycHKVgkQMdydsAzUDsG6rrE764vXEhX0TbtUWY1wK
 gYzZK3eZh4QP6/KRcsGtxqFxX3V6jF84W/LhGdR+IC5sBms3CqiLkIxw8
 zx3JASWKBEq6co7z2lzovrZzqSfpJIFQ03SNLkU7RnKJcr+NUkthHPRaD
 Lz6sSzIzFDkTLZbstCzGI4biaQWrwvuUIOsDjRgFGdK6Y8RzfxIctWzgZ
 4AHr/Ijep9VKKEVleNlIXEjf5/C1+K4HAiS7tXa1+jrxHRhP9kh62sg2Z
 gN1VPsbAoJ1Gp5ZkuCIjQQwHGEXeklVMoNnvg1ibn5hGbXWpb3/ia8+GA w==;
X-CSE-ConnectionGUID: PFmW471lRQarDqoSwR54Vg==
X-CSE-MsgGUID: jZRKlYRLRNalfGAPqZVYeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44628020"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="44628020"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 09:34:52 -0700
X-CSE-ConnectionGUID: ugE/p0CzRqWi1GoAvKcuog==
X-CSE-MsgGUID: oXdg271HTaKJgyUqrSEqSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="130849665"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 09:34:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 09:34:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 09:34:50 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 09:34:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INfkCYMD97BL7mwe0MxpuWnbi/eNAIiksAT2nV1DUuamcOcBFL6H62bhJ/eNmygPNKgz93ExsZ0CYcBeekxPlOPnFnuoVAMGPetIzGBoJjt7XKjdKz4p9LMT03RGUWzm4e+J/mOjHGRnpd9tIqCO9ddCLDhtMl0jM64WeuQ8kGl4+cvNNv/J0wumcUztj5qVTshnvnejpdX+Dt6z9OhoXjrV7JI+c55mMl2/9VKouzBD6LDs7jdj3xbmEqw6yaI6EfWsf+Ke/9qXIE2jb+6Xhpb5razGOEmkUUWXvtMLDdVFnfoiCysJJv+Tm5BF321cBkrJXXOtGM7+VXyd6kV85Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jb8hK62akxawduQ6nK3WIzd4GgltAAd8ESCEM/oy8k=;
 b=Sl/lZFX0OTmEJNvHTyXZsWPjBUlu2BUW6ifo37qbWEZOqhRF+ZD3kcBf0wnSiaHS89/IC6ihd8u38UcX+nZn0hh6xYOpHWUHKkPhCtRN9W3KfoBPffT54mlUh/6lcBeqoZhf0W3BjShRTggvKYwWFbcF0a6kXRLEU7yWjbt6JBFUKlDxZiilkL18UaAPc2iwOdFaNkjGAujvJawQFe0nvHeJiX5RJYT51w3+xjR/Udb7H2zseq7C1p6kfSfVlirwwYLk928z/hZ8qFtTYbCGm0SezG7OkSbA40oFXVgnOChTG0zzAAeGT2KoFhJVb/l67EI0kECpl1OhTLdz4c1UmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ0PR11MB8270.namprd11.prod.outlook.com (2603:10b6:a03:479::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 16:34:47 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%5]) with mapi id 15.20.8534.045; Mon, 31 Mar 2025
 16:34:47 +0000
Message-ID: <3908de67-0a91-4e94-a98a-e94879c0d53d@intel.com>
Date: Mon, 31 Mar 2025 09:34:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/vf: Store the VF GuC version in the
 compatibility struct
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250228200246.3117410-1-daniele.ceraolospurio@intel.com>
 <d5ca7fe9-aa20-402b-85b5-4f4832c0a0af@intel.com>
 <3191c065-1977-4a03-9693-d7622cea81f9@intel.com>
Content-Language: en-US
In-Reply-To: <3191c065-1977-4a03-9693-d7622cea81f9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::22) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ0PR11MB8270:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d951afd-2758-4cb5-dc72-08dd7071f2ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXdHdzROcUZqWFRncmtmamdpTEZGa1VRTFhUbk5sME1QOHNEaFhGSkI3cVVU?=
 =?utf-8?B?dE45YVNsTzFQaGoxdE15U0RYMlZsT0QzSFNpK0lDTU9qaU5DN3h4YW5wdXNs?=
 =?utf-8?B?NEMyQjk1K1FZQytSVjZMTTJ2NERPZG1maDFRTXlsN1hMcER3NFMrc1B5WjYr?=
 =?utf-8?B?K3F2Z0JyVFp6bjllU3hXQVZ6ckQyWjVTeGtWVHdiNUdmSWlkMzhvakJNUGxy?=
 =?utf-8?B?NlRTNzRCQ0pTY1k2TmJZMDFyWklraEduSG9pc1hVdHdqR3V5Tmo3K3B3Mm9S?=
 =?utf-8?B?bWcyZG4yelNJQ0dvdzFSS2drc2Mrd1lYaUsvamtoak13bXFGSlZKVDBMRnls?=
 =?utf-8?B?YklHSjhuNmFDcktkUGpqaWdCdThRZXc3aCtjZnBScEVaNXdrRHJSekc5S3F1?=
 =?utf-8?B?RXNTWnlBUExYenY4LzdNd0JTN244WHR5ZkN4Y3JmampkVHQ5RllJMmtnbSto?=
 =?utf-8?B?Qkd1WDVod3FPYTA0M1VkTWY2eW9TS0locFBPd1gwWEZnSys1eWRJSytvMXBi?=
 =?utf-8?B?NWtnTGl4K09lYUVCcW1zVVN2VkNOQU9ta3BUWXJUcFNLb3VpUEgxOGg1ZG4w?=
 =?utf-8?B?VjVMb3lnazFIWEtWSzBFWVJ0R0NmNXE5VGpzTEJkK1JJNllZZVlVZ1Y5ajZ0?=
 =?utf-8?B?bG40NldPbzlXZlE5SzVUcldkS1V4NnpyNTdUb0ptc2I1MlpMN2Z0M2pramV3?=
 =?utf-8?B?SWFuR08zNDVZbFNuODFNdGxtT093TlIzdzlyUXl2T1FEcG9OS1lmSUJxMzVW?=
 =?utf-8?B?S2wvU3RrRU1KaWJaQ2lqbFRLNDlDVURGUW9hK2VxOTFxQ3lOL0NieGp2UWFB?=
 =?utf-8?B?K25yWXorWEZBMXhZYm9XWFFvcUNBUWJJbG1QWnptcVJ3MUZpZUJjb1B1T3FE?=
 =?utf-8?B?TXJNeU81MkFaSU0vbHhBZmRhbTRnWEQ5Y3dPTjNwVWVFSkNlaFBtRUVTQXN5?=
 =?utf-8?B?WHZsT203dXhOc1BzRWRqejJlS2YrakRVQS9xbHhFamwzTTYrWlNHNTUzR1pV?=
 =?utf-8?B?b0hFSzFGVEdENTk1V2RjWmpROGpjcU9BLzBOZHFxQmlUNE9zK1F6ZjkwNnFw?=
 =?utf-8?B?K05MVmVqTWdqYjUwd05EZXU4Y2JaLzNUU0NnWkxHeVlVZ0RnaVRXTkFkVm9D?=
 =?utf-8?B?YVBpT3RBWlcvbG5WcUN3R2xKdm9TellKMkF6WUo3NjRrTDdFeVVLc2c3QWFu?=
 =?utf-8?B?aW1NbjJ0bWFTMVF4eDI4VnZQU0hsL3pxRjNCdm91WDI4U1FOek1ZeWVVdWhY?=
 =?utf-8?B?YTU4M2RtZWJPMHE2bnlBTkY4WUZaNEFnYmhyejVjZXhaUll2bWY0YTRKRUdU?=
 =?utf-8?B?TVlGZ3czdHpYZElUZm13U3RnU1JTVnhZd01qa2Y0WnNpNERxT21hcEIrMS9Q?=
 =?utf-8?B?SERHdHd1WXJpWG1HaHBXaGVvYTViRmZPYVpUYklFcUg1NWhHaVA3bVVPNVJn?=
 =?utf-8?B?cnJnVHNXcnVnNHZ5cjNTZERLY3pxVUpyREk5d3QraWdIem16Sm82b1NpWXB2?=
 =?utf-8?B?ZmJENUNzdDBoc0s3bXdQaFRkMXozSnNLbURkcnFFeG1QZTJWY0Y5OUlHYTZG?=
 =?utf-8?B?V2d0MzJkRGNKRWV4Wk13TTZ5dWZiNzU0Q250MTNGd3VkakhOTkt5bVhjTWRj?=
 =?utf-8?B?eHpuN1VmeWgvY242eldBN3B3TkR6VmJOZStoNzBpdUozRXRMZHpHT3Fra1hp?=
 =?utf-8?B?K0pWTExZaDJ4cXRvbFhzRWg2UU1BNUgxbTU1YU53ZWZwdTZrVXY2bkhVTkJu?=
 =?utf-8?B?Y1Q0elQvcVpPbzAvNUM4Z1VDa2ZjMzZLVDBkME1RcHY0aUg3YzN2aXZrYTlm?=
 =?utf-8?B?eTFOeitaRUxUOC9NT2dObFQyNXJhZFRuNXhDeXg3QlVRclVnMktnZzdxNlUv?=
 =?utf-8?Q?O/WPvM/sRDAKx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVptSCtKcDRFbWlZTjBvWUhpSDhITmo3akJFMzBwelNsMHFQcG5BRHR5cjNS?=
 =?utf-8?B?WXNaMkFjQjhZY0Z0ZUZJNnVoWWhudGNpUzRQMEdEa2pYU2IwZTQ3Ry93RkV4?=
 =?utf-8?B?ekFhUGFNTlhqMktBa3dRcStEKzZXbFFwdU9jOGxXY0MzQ1ova3NGY3pTc0Rj?=
 =?utf-8?B?UGZmbXMva1I0MmNpUTZHWkt2azd3eStQUDRiZlFRQVFDaWI0N2pIVkFGVjJy?=
 =?utf-8?B?STd6QWtobmRRR0RabGFOb2JuWENJc3NqTjlLUnlBV2s1TG5VQ0kwT1VFUFpy?=
 =?utf-8?B?N2JQcHR3dVdnUEMxVVQvaXRZWUdUa2luTi94Y1ozZnJ6allmRTF1Q1k2d1RT?=
 =?utf-8?B?NUc1Ni9SZWV0WFROKzFjbE0yVWNzV09zS29jOHlTSVdXVkRVTk1VUWFCRUpZ?=
 =?utf-8?B?bHVOMmZkNVdxWDN4d3ZCdTdZUDlCaTV0RDN4dEF5ZCtxamRDazdBdnJER2Rk?=
 =?utf-8?B?WUJNU08xeWlxb2xSNGpFZVN3QW9YRkluU2NNRUJYWXZ4ZDdxZktDdkR5eURB?=
 =?utf-8?B?dVpSa0NzNXU2eFhOR2lFRSs0ZTdKNWJWd2c5dkN1SSs0dEhHUTRZV3VQL1Bs?=
 =?utf-8?B?ZHlmYS94QXJ0Kzk5U2NUVEJzV1o2UmQ5Q0VGSVFXTFJxVndqWUM0c2J4ems4?=
 =?utf-8?B?SVdxNU9wRkplcXdxRkFnNGZJQVlORVNRY0E0cjNZbFdjNzVBRi9iSStyWExG?=
 =?utf-8?B?ZVZPWkRnYWQyQVhZM1FnWHErbDV0ZEtVTEF2bWY3ZU1lSlFqZ0Y1ME1UY3Iz?=
 =?utf-8?B?RktWZzFqQ1BTdFJhblJoRExwa2ZjUmZleEtETHN3TjBUb042WThWMWFXRkh2?=
 =?utf-8?B?VkR2cEE3Z3FJSmhGRFpmT1JQTlZLOGV3R1hXcXdDUy9UcVdnaUZFS1ppMGt2?=
 =?utf-8?B?Mk5YVkJYNnJ2ZTZSUmJtaTVFbGRnWGE2cE9pQTBRS3hsc2R6akJKeDU1cGJ2?=
 =?utf-8?B?Rm4rcWwzQWNLVmJrVk5GZG9uNlNrbHZ2TzBtQURBUUlTb2VKSWRjbjVGb082?=
 =?utf-8?B?Y2txMTd4SnRZbUM2SE05bHhzWVEzWVZOWFlIWXBBVCsxeWw3cjhOdVh0em9M?=
 =?utf-8?B?Z3FRUVBIMVd2TVAxTG5nT0tBVGdlbldXQWlNZVhlR2FlYmR1b2l1eEhtU1Fj?=
 =?utf-8?B?Y1hQazl2Z2t5SmFvNlBpZExiZmFHNEM0TlVhb1I0RVhqaHViUVU3V3hCeDRn?=
 =?utf-8?B?RkZOYXVPb1BWNjlWMHF6Szg3dDBSZmdQRzkzYUtaUU5YQVBTTnlpeHpKUk5j?=
 =?utf-8?B?V3FFdlIrcllvMStYZ2M3Uk92SXRnVzBlZklaYzgwbjV4dGszWGliUlhjYWJI?=
 =?utf-8?B?V2VNOGFnbGlUMUtRQ1ZnUzgrZ0I2Q2kxWU9UNVlOaTg4ZGZqblBaMWhYYUMy?=
 =?utf-8?B?ckRxR3ZicXYrRGtMMyt6TksyaFp2TFRQb2VnOE5mc0J6eTJxWU1ya1h4TENU?=
 =?utf-8?B?ZysxU2NnVGpQQVhpNDNjU0xsR1VWRGpLblYxT3Y0WUR0RTg3dW9EY2ZJc2cy?=
 =?utf-8?B?RWd3SjRuVGorWUJOZVdpcmU3blhSaXhmVHd1L0NuV3pUdFBWTFIyekN4YWpE?=
 =?utf-8?B?dnIrZWZFRTBSKzJGVW0ybDB6UFdBTG5kejlIVndMMDg1ODhEa09BdXhEVXpM?=
 =?utf-8?B?Wi9KSGMxTCsvUzNJTEdHTXFwd0VPVndsazRaQ3Vlay9vQjU4eFJ2Slhkd1A3?=
 =?utf-8?B?TElpUWxEOHpubGdOdXVtYkNDM2k4QmtMM2J6QlZ2Y1JOZUJ4Q05raVUyck1K?=
 =?utf-8?B?OEpTN2pqNVlvZER2N0ZQbW1lcUNMOEpLWnZ6ejRmR0JiNzFkaUE3dGpSY2o4?=
 =?utf-8?B?alFrTFFuNjJ2SmdxQW45Qyt0QjV2WXZHOVVHUnQ4aFU1S3NWa1NCSldyTk9r?=
 =?utf-8?B?VXU4dW56dU9BdjYyY3lyeFo0SUdLRUV1WkRxalV2QU5OUmdPMEM4N1Nqejl2?=
 =?utf-8?B?VzFRK2JFM0pORFAvVmxmUUZvMHdMY3E3MXRwY1B1U0xoSVQvU0JmalYycVpQ?=
 =?utf-8?B?V0hIL3gydjZJbVBDRnVYSU5tcmZNN3REOWxNbnFENy9MUmJoMVpUbGhJRVQv?=
 =?utf-8?B?RUVwLzYxV2hhN05EclczTVk0OTNWa09MRVYxMitvem1vNlFFSk1nR3NoaTAw?=
 =?utf-8?B?Zkh4cDVtYlpTbDlVd3hhQlRrcUdYLzh0TFp3ckVtWXNCNmtVMkx1a1lmY3li?=
 =?utf-8?Q?uORZAuZ1okXzN+Qb4ScbC6U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d951afd-2758-4cb5-dc72-08dd7071f2ea
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 16:34:46.9200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FHFlziemZGYqpyzQzk1bvebuShzAjOehhxb1A/eYmswX7xmszcvlK9cUZ4Y4pt3cvnZYkYCTXjRv0xJD1WwuoXq7S5qjHc5q9kY6ZwGgbx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8270
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



On 2/28/2025 2:28 PM, Daniele Ceraolo Spurio wrote:
>
>
> On 2/28/2025 1:26 PM, Michal Wajdeczko wrote:
>>
>> On 28.02.2025 21:02, Daniele Ceraolo Spurio wrote:
>>> The GuC compatibility version that we read from the CSS header in
>>> native/PF and the GuC VF version that we get when a VF handshakes with
>>> the GuC are the same version number, so we should store it into the 
>>> same
>>> structure. This makes all the checks based on the compatibility version
>>> automatically work for VFs without having to copy the value over.
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 121 
>>> +++++++++++---------
>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |  16 ---
>>>   drivers/gpu/drm/xe/xe_guc.h                 |   2 +-
>>>   drivers/gpu/drm/xe/xe_guc_engine_activity.c |   8 +-
>>>   drivers/gpu/drm/xe/xe_uc_fw_types.h         |   2 +
>>>   5 files changed, 71 insertions(+), 78 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c 
>>> b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> index a439261bf4d7..eeccbf4cb4b4 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> @@ -82,17 +82,17 @@ int xe_gt_sriov_vf_reset(struct xe_gt *gt)
>>>   }
>>>     static int guc_action_match_version(struct xe_guc *guc,
>>> -                    u32 wanted_branch, u32 wanted_major, u32 
>>> wanted_minor,
>>> -                    u32 *branch, u32 *major, u32 *minor, u32 *patch)
>>> +                    struct xe_uc_fw_version *wanted,
>>> +                    struct xe_uc_fw_version *found)
>>>   {
>>>       u32 request[VF2GUC_MATCH_VERSION_REQUEST_MSG_LEN] = {
>>>           FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>>>           FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
>>>           FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
>>>                  GUC_ACTION_VF2GUC_MATCH_VERSION),
>>> -        FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_BRANCH, 
>>> wanted_branch) |
>>> -        FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MAJOR, 
>>> wanted_major) |
>>> -        FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MINOR, 
>>> wanted_minor),
>>> +        FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_BRANCH, 
>>> wanted->branch) |
>>> +        FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MAJOR, 
>>> wanted->major) |
>>> +        FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MINOR, 
>>> wanted->minor),
>>>       };
>>>       u32 response[GUC_MAX_MMIO_MSG_LEN];
>>>       int ret;
>>> @@ -106,71 +106,84 @@ static int guc_action_match_version(struct 
>>> xe_guc *guc,
>>>       if 
>>> (unlikely(FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_0_MBZ, 
>>> response[0])))
>>>           return -EPROTO;
>>>   -    *branch = 
>>> FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_BRANCH, response[1]);
>>> -    *major = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MAJOR, 
>>> response[1]);
>>> -    *minor = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MINOR, 
>>> response[1]);
>>> -    *patch = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_PATCH, 
>>> response[1]);
>>> +    memset(found, 0, sizeof(struct xe_uc_fw_version));
>>> +    found->branch = 
>>> FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_BRANCH, response[1]);
>>> +    found->major = 
>>> FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MAJOR, response[1]);
>>> +    found->minor = 
>>> FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MINOR, response[1]);
>>> +    found->patch = 
>>> FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_PATCH, response[1]);
>>>         return 0;
>>>   }
>>>   -static void vf_minimum_guc_version(struct xe_gt *gt, u32 *branch, 
>>> u32 *major, u32 *minor)
>>> +static int guc_action_match_version_any(struct xe_guc *guc,
>>> +                    struct xe_uc_fw_version *found)
>>> +{
>>> +    struct xe_uc_fw_version wanted = { GUC_VERSION_BRANCH_ANY,
>>> +                       GUC_VERSION_MAJOR_ANY,
>>> +                       GUC_VERSION_MINOR_ANY,
>>> +                       0 };
>> better to use designated initializers (as we don't know when someone
>> will make yet another changes to the struct xe_uc_fw_version layout):
>>
>> struct xe_uc_fw_version wanted = {
>>     .branch = GUC_VERSION_BRANCH_ANY,
>>     .major = GUC_VERSION_MAJOR_ANY,
>>         .minor = GUC_VERSION_MINOR_ANY,
>> };
>
> Good point.
>
>>> +
>>> +    return guc_action_match_version(guc, &wanted, found);
>>> +}
>>> +
>>> +static void vf_minimum_guc_version(struct xe_gt *gt, struct 
>>> xe_uc_fw_version *ver)
>>>   {
>>>       struct xe_device *xe = gt_to_xe(gt);
>>>   +    memset(ver, 0, sizeof(struct xe_uc_fw_version));
>>> +
>>>       switch (xe->info.platform) {
>>>       case XE_TIGERLAKE ... XE_PVC:
>>>           /* 1.1 this is current baseline for Xe driver */
>>> -        *branch = 0;
>>> -        *major = 1;
>>> -        *minor = 1;
>>> +        ver->branch = 0;
>>> +        ver->major = 1;
>>> +        ver->minor = 1;
>>>           break;
>>>       default:
>>>           /* 1.2 has support for the GMD_ID KLV */
>>> -        *branch = 0;
>>> -        *major = 1;
>>> -        *minor = 2;
>>> +        ver->branch = 0;
>>> +        ver->major = 1;
>>> +        ver->minor = 2;
>>>           break;
>>>       }
>>>   }
>>>   -static void vf_wanted_guc_version(struct xe_gt *gt, u32 *branch, 
>>> u32 *major, u32 *minor)
>>> +static void vf_wanted_guc_version(struct xe_gt *gt, struct 
>>> xe_uc_fw_version *ver)
>>>   {
>>>       /* for now it's the same as minimum */
>>> -    return vf_minimum_guc_version(gt, branch, major, minor);
>>> +    return vf_minimum_guc_version(gt, ver);
>>>   }
>>>     static int vf_handshake_with_guc(struct xe_gt *gt)
>>>   {
>>> -    struct xe_gt_sriov_vf_guc_version *guc_version = 
>>> &gt->sriov.vf.guc_version;
>>>       struct xe_guc *guc = &gt->uc.guc;
>>> -    u32 wanted_branch, wanted_major, wanted_minor;
>>> -    u32 branch, major, minor, patch;
>>> +    struct xe_uc_fw_version *guc_version = 
>>> &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
>> I'm not sure that we should go so deep into guc internal structures ...
>>
>> maybe we could add some small helper to hide where this GuC ABI version
>> is maintained within xe_guc
>>
>>     xe_guc_get_compatibility_ver(guc, *ver)
>>     xe_guc_set_compatibility_ver(guc, const *ver)
>
> ok

Looking at implementing this, I think it is easier to have just the 
getter function return the actual live version of the structure and fill 
it in, instead of getting a copy and having a setter. i.e.:

xe_uc_fw_get_compatibility_ver(struct xe_uc_fw *uc_fw)
{
     return &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
}

It makes the code simpler and cleaner IMO, because it can also be used 
by all the low-level functions where we want to do the filling of the 
structure and where having a copy would be overkill.
Any objection to going this way?

>
>>
>> btw, maybe it's time to s/guc_version/actual
>>
>>> +    struct xe_uc_fw_version wanted = {0};
>>> +    struct xe_uc_fw_version found;
>>>       int err;
>>>         xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>         /* select wanted version - prefer previous (if any) */
>>>       if (guc_version->major || guc_version->minor) {
>>> -        wanted_branch = guc_version->branch;
>>> -        wanted_major = guc_version->major;
>>> -        wanted_minor = guc_version->minor;
>>> +        wanted.branch = guc_version->branch;
>>> +        wanted.major = guc_version->major;
>>> +        wanted.minor = guc_version->minor;
>> then:
>>         wanted = actual;
>
> I purposely avoided a direct assignment here because the patch value 
> wasn't being copied over in the original code. If it's ok to copy that 
> as well I'll switch.
>
>>
>>>       } else {
>>> -        vf_wanted_guc_version(gt, &wanted_branch, &wanted_major, 
>>> &wanted_minor);
>>> -        xe_gt_assert(gt, wanted_major != GUC_VERSION_MAJOR_ANY);
>>> +        vf_wanted_guc_version(gt, &wanted);
>>> +        xe_gt_assert(gt, wanted.major != GUC_VERSION_MAJOR_ANY);
>>>       }
>>>   -    err = guc_action_match_version(guc, wanted_branch, 
>>> wanted_major, wanted_minor,
>>> -                       &branch, &major, &minor, &patch);
>>> +    err = guc_action_match_version(guc, &wanted, &found);
>>>       if (unlikely(err))
>>>           goto fail;
>>>         /* we don't support interface version change */
>>>       if ((guc_version->major || guc_version->minor) &&
>>> -        (guc_version->branch != branch || guc_version->major != 
>>> major ||
>>> -         guc_version->minor != minor)) {
>>> +        (guc_version->branch != found.branch || guc_version->major 
>>> != found.major ||
>>> +         guc_version->minor != found.minor)) {
>>>           xe_gt_sriov_err(gt, "New GuC interface version detected: 
>>> %u.%u.%u.%u\n",
>>> -                branch, major, minor, patch);
>>> +                found.branch, found.major, found.minor, found.patch);
>>>           xe_gt_sriov_info(gt, "Previously used version was: 
>>> %u.%u.%u.%u\n",
>>>                    guc_version->branch, guc_version->major,
>>>                    guc_version->minor, guc_version->patch);
>>> @@ -179,47 +192,43 @@ static int vf_handshake_with_guc(struct xe_gt 
>>> *gt)
>>>       }
>>>         /* illegal */
>>> -    if (major > wanted_major) {
>>> +    if (found.major > wanted.major) {
>>>           err = -EPROTO;
>>>           goto unsupported;
>>>       }
>>>         /* there's no fallback on major version. */
>>> -    if (major != wanted_major) {
>>> +    if (found.major != wanted.major) {
>>>           err = -ENOPKG;
>>>           goto unsupported;
>>>       }
>>>         /* check against minimum version supported by us */
>>> -    vf_minimum_guc_version(gt, &wanted_branch, &wanted_major, 
>>> &wanted_minor);
>>> -    xe_gt_assert(gt, major != GUC_VERSION_MAJOR_ANY);
>>> -    if (major < wanted_major || (major == wanted_major && minor < 
>>> wanted_minor)) {
>>> +    vf_minimum_guc_version(gt, &wanted);
>>> +    xe_gt_assert(gt, found.major != GUC_VERSION_MAJOR_ANY);
>>> +    if (MAKE_GUC_VER_STRUCT(found) < MAKE_GUC_VER_STRUCT(wanted)) {
>>>           err = -ENOKEY;
>>>           goto unsupported;
>>>       }
>>>         xe_gt_sriov_dbg(gt, "using GuC interface version 
>>> %u.%u.%u.%u\n",
>>> -            branch, major, minor, patch);
>>> +            found.branch, found.major, found.minor, found.patch);
>>>   -    guc_version->branch = branch;
>>> -    guc_version->major = major;
>>> -    guc_version->minor = minor;
>>> -    guc_version->patch = patch;
>>> +    memcpy(guc_version, &found, sizeof(struct xe_uc_fw_version));
>> better:
>>     xe_guc_set_compatibility_ver(guc, found);
>
> ok.
>
>>
>>>       return 0;
>>>     unsupported:
>>>       xe_gt_sriov_err(gt, "Unsupported GuC version %u.%u.%u.%u 
>>> (%pe)\n",
>>> -            branch, major, minor, patch, ERR_PTR(err));
>>> +            found.branch, found.major, found.minor, found.patch,
>>> +            ERR_PTR(err));
>>>   fail:
>>>       xe_gt_sriov_err(gt, "Unable to confirm GuC version %u.%u 
>>> (%pe)\n",
>>> -            wanted_major, wanted_minor, ERR_PTR(err));
>>> +            wanted.major, wanted.minor, ERR_PTR(err));
>>>         /* try again with *any* just to query which version is 
>>> supported */
>>> -    if (!guc_action_match_version(guc, GUC_VERSION_BRANCH_ANY,
>>> -                      GUC_VERSION_MAJOR_ANY, GUC_VERSION_MINOR_ANY,
>>> -                      &branch, &major, &minor, &patch))
>>> +    if (!guc_action_match_version_any(guc, &found))
>>>           xe_gt_sriov_notice(gt, "GuC reports interface version 
>>> %u.%u.%u.%u\n",
>>> -                   branch, major, minor, patch);
>>> +                   found.branch, found.major, found.minor, 
>>> found.patch);
>>>       return err;
>>>   }
>>>   @@ -376,7 +385,7 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>>>         xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>       xe_gt_assert(gt, !GRAPHICS_VERx100(gt_to_xe(gt)) || 
>>> has_gmdid(gt_to_xe(gt)));
>>> -    xe_gt_assert(gt, gt->sriov.vf.guc_version.major > 1 || 
>>> gt->sriov.vf.guc_version.minor >= 2);
>>> +    xe_gt_assert(gt, GUC_COMPATIBILITY_VER(guc) >= MAKE_GUC_VER(1, 
>>> 2, 0));
>>>         err = guc_action_query_single_klv32(guc, 
>>> GUC_KLV_GLOBAL_CFG_GMD_ID_KEY, &value);
>>>       if (unlikely(err)) {
>>> @@ -537,7 +546,7 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>>>   u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>>>   {
>>>       xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>> -    xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>>> +    xe_gt_assert(gt, GUC_COMPATIBILITY_VER(&gt->uc.guc));
>>>       xe_gt_assert(gt, gt->sriov.vf.self_config.num_ctxs);
>>>         return gt->sriov.vf.self_config.num_ctxs;
>>> @@ -554,7 +563,7 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>>>   u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>>>   {
>>>       xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>> -    xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>>> +    xe_gt_assert(gt, GUC_COMPATIBILITY_VER(&gt->uc.guc));
>>>       xe_gt_assert(gt, gt->sriov.vf.self_config.lmem_size);
>>>         return gt->sriov.vf.self_config.lmem_size;
>>> @@ -1079,19 +1088,19 @@ void xe_gt_sriov_vf_print_runtime(struct 
>>> xe_gt *gt, struct drm_printer *p)
>>>    */
>>>   void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct 
>>> drm_printer *p)
>>>   {
>>> -    struct xe_gt_sriov_vf_guc_version *guc_version = 
>>> &gt->sriov.vf.guc_version;
>>> +    struct xe_uc_fw_version *guc_version = 
>>> &gt->uc.guc.fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
>>> +    struct xe_uc_fw_version ver;
>>>       struct xe_gt_sriov_vf_relay_version *pf_version = 
>>> &gt->sriov.vf.pf_version;
>>> -    u32 branch, major, minor;
>>>         xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>         drm_printf(p, "GuC ABI:\n");
>>>   -    vf_minimum_guc_version(gt, &branch, &major, &minor);
>>> -    drm_printf(p, "\tbase:\t%u.%u.%u.*\n", branch, major, minor);
>>> +    vf_minimum_guc_version(gt, &ver);
>>> +    drm_printf(p, "\tbase:\t%u.%u.%u.*\n", ver.branch, ver.major, 
>>> ver.minor);
>>>   -    vf_wanted_guc_version(gt, &branch, &major, &minor);
>>> -    drm_printf(p, "\twanted:\t%u.%u.%u.*\n", branch, major, minor);
>>> +    vf_wanted_guc_version(gt, &ver);
>>> +    drm_printf(p, "\twanted:\t%u.%u.%u.*\n", ver.branch, ver.major, 
>>> ver.minor);
>>>         drm_printf(p, "\thandshake:\t%u.%u.%u.%u\n",
>>>              guc_version->branch, guc_version->major,
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h 
>>> b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> index a57f13b5afcd..e3d3eadbba8c 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> @@ -8,20 +8,6 @@
>>>     #include <linux/types.h>
>>>   -/**
>>> - * struct xe_gt_sriov_vf_guc_version - GuC ABI version details.
>>> - */
>>> -struct xe_gt_sriov_vf_guc_version {
>>> -    /** @branch: branch version. */
>>> -    u8 branch;
>>> -    /** @major: major version. */
>>> -    u8 major;
>>> -    /** @minor: minor version. */
>>> -    u8 minor;
>>> -    /** @patch: patch version. */
>>> -    u8 patch;
>>> -};
>>> -
>>>   /**
>>>    * struct xe_gt_sriov_vf_relay_version - PF ABI version details.
>>>    */
>>> @@ -71,8 +57,6 @@ struct xe_gt_sriov_vf_runtime {
>>>    * struct xe_gt_sriov_vf - GT level VF virtualization data.
>>>    */
>>>   struct xe_gt_sriov_vf {
>>> -    /** @guc_version: negotiated GuC ABI version. */
>>> -    struct xe_gt_sriov_vf_guc_version guc_version;
>> we may still want to keep local copy of xe_uc_fw_version to hold what we
>> actually negotiated with guc, even if we had to reject that (and thus
>> not set up in the guc submit code as found compatibility version)
>
> ok

Thinking about this again, should I just set the compatibility version 
anyway, even if we fail the negotiation? that way the info is always in 
the same place.

Daniele

>
>>
>>>       /** @self_config: resource configurations. */
>>>       struct xe_gt_sriov_vf_selfconfig self_config;
>>>       /** @pf_version: negotiated VF/PF ABI version. */
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>>> index 58338be44558..c81544ff1cb4 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>>> @@ -18,7 +18,7 @@
>>>    */
>>>   #define MAKE_GUC_VER(maj, min, pat)    (((maj) << 16) | ((min) << 
>>> 8) | (pat))
>>>   #define MAKE_GUC_VER_STRUCT(ver) MAKE_GUC_VER((ver).major, 
>>> (ver).minor, (ver).patch)
>>> -#define GUC_SUBMIT_VER(guc) \
>>> +#define GUC_COMPATIBILITY_VER(guc) \
>>> MAKE_GUC_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY])
>>>   #define GUC_FIRMWARE_VER(guc) \
>>> MAKE_GUC_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_RELEASE])
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c 
>>> b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>> index 2a457dcf31d5..e7aeb530715b 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>> @@ -98,7 +98,6 @@ static void free_engine_activity_buffers(struct 
>>> engine_activity_buffer *buffer)
>>>   static bool is_engine_activity_supported(struct xe_guc *guc)
>>>   {
>>>       struct xe_uc_fw_version *version = 
>>> &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
>>> -    struct xe_uc_fw_version required = { 1, 14, 1 };
>>>       struct xe_gt *gt = guc_to_gt(guc);
>>>         if (IS_SRIOV_VF(gt_to_xe(gt))) {
>>> @@ -107,11 +106,10 @@ static bool 
>>> is_engine_activity_supported(struct xe_guc *guc)
>>>       }
>>>         /* engine activity stats is supported from GuC interface 
>>> version (1.14.1) */
>>> -    if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER_STRUCT(required)) {
>>> +    if (GUC_COMPATIBILITY_VER(guc) < MAKE_GUC_VER(1, 14, 1)) {
>>>           xe_gt_info(gt,
>>> -               "engine activity stats unsupported in GuC interface 
>>> v%u.%u.%u, need v%u.%u.%u or higher\n",
>>> -               version->major, version->minor, version->patch, 
>>> required.major,
>>> -               required.minor, required.patch);
>>> +               "engine activity stats unsupported in GuC interface 
>>> v%u.%u.%u, need v1.14.1 or higher\n",
>>> +               version->major, version->minor, version->patch);
>> little unrelated
>
> This is because of adding the branch variable to xe_uc_fw_version, 
> which breaks the way the "required" variable is defined, so I had to 
> do something here.
> If you want to make it minimal I can instead do:
>
> struct xe_uc_fw_version required = { .major = 1, .minor = 14, .patch = 
> 1 };
>
> But the change is small enough that IMO is worth keeping as it cleans 
> the code a bit.
>
> Daniele
>
>>
>>>           return false;
>>>       }
>>>   diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h 
>>> b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>>> index ad3b35a0e6eb..914026015019 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>>> @@ -65,6 +65,8 @@ enum xe_uc_fw_type {
>>>    * struct xe_uc_fw_version - Version for XE micro controller firmware
>>>    */
>>>   struct xe_uc_fw_version {
>>> +    /** @branch: branch version of the FW (not always available) */
>>> +    u16 branch;
>> yeah, lack of this field was one of the main blocker to use uc/guc
>> version structures, that's why I bed on local definition that was
>> aligned with VF GuC ABI, but I didn't imagine that it's so simple (and
>> let's hope harmless) to just add it here as yet another extra field and
>> it will not break any existing macros!
>>
>>>       /** @major: major version of the FW */
>>>       u16 major;
>>>       /** @minor: minor version of the FW */
>

