Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7942BE77197
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 14:19:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 440D010E30C;
	Tue,  7 Jan 2025 14:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GbmVEk5u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6523810E30C
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jan 2025 14:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736259545; x=1767795545;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E3U/UaGAJHB+T0pDJTfr1dGjpK/etGZGu3mPNNZfT8g=;
 b=GbmVEk5uDvUw74NNQ1usPOqMiWe/xSQMqjN9MUKmGSg5jjXVyZ5uSOJP
 cm2kYaZGrYwYjELRXcz6ZOmdJIxKptbXgmgwQJZ0X2qFKM/QseVpfHAar
 /xUdIxwedfCMguoVTl8DmNEEaaz5yZp0Wak5r2qGEXp0+BozDWUFMLrGI
 r4R3py+lHTcDDTtg2bqv+mdHOocWqV6FqFe1LeXIrSLdzw8CFSf11GDq/
 bpm2IJM+Z1etIsbe2T6+ePpC91IMkPxSo1orc9+3HV4LdjT61g9gMJNLY
 batgW7PgyC60m/gO/epiVqYUC4wg46NXG2SqZCiHAzX8BYO6jmMz7ubLh A==;
X-CSE-ConnectionGUID: WGsUHggDS4CkGBCluW49yQ==
X-CSE-MsgGUID: C9E8gRFdRj6eYcJXvQelUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36139511"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="36139511"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:19:04 -0800
X-CSE-ConnectionGUID: /U4U8bf7SWywpihqk01P8w==
X-CSE-MsgGUID: IOccyKFjQOCA9L0BOCYgUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="103293352"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jan 2025 06:19:03 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 06:19:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 06:19:02 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 06:19:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlS/2VgNzNG0rt0nQaFghC3u8w9jsBBNP3RxN9xs8nUyPrm4tT3LJnYZR7qZfnbkjrQJoa3qTtRoyi9p2DDEAAkEmPNgfQe5zn+XE8jqZ/22R7OmpQdbdRvJrXA3NuC8WssOR1rS08QE9pBoS+SJFMCHy1JK+NRD+X+6hU3zFrd99eTBwIhfmp8Fr783t3708xz1xB9iG+3X3MLMhkJ7DAJSARn5VYS+CzVuF/4Nc6a1bdJfxgYzodUGd/IzNmTnTEzel9driIkCBsGRZHhPrqGm1qfyPKY9HH3pK0BDBMTh8b9PfPSzyQeeFLQPsb/HmQcuvzwtJlK9zANIRa3/LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUiNXrqZYxlx6hbhSGhKgo/kMfPoQQnFBA08yhksgug=;
 b=LOJImoWWeG+dqAr3jj1kJvADkKsL+uuPcMMkYsccqZ66Az8fE/iLw2dCz9Q3aRWuVlBbJwKdRc6pt9bAIyH4GKKqmc7DUXwqGs9+tF+mYf51y7zGItCVjP/CZU7FqntnrO2J//kK5MRpyRobSpbgag/8gDoBS6jyEUJkaXT2NIArfCaR/dd0AIkdNo9QsHS6M1otkYavUQUS5gZtH5SWvhYoaLCfTOlZxc8IeREvHCfVBCwEq9CqYjcVywF2XUUNgIbwPweT5Irylko1q+znRRZnGUywBrMWEf7Cn38kfdIPsf1cheSDChPNo+7Jle4BUnjSQvBq3KZxcLFNl9PieQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 14:18:42 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 14:18:42 +0000
Message-ID: <db9b8d0d-1f86-434e-a8c7-36223605386c@intel.com>
Date: Tue, 7 Jan 2025 19:48:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] RFC drm/xe: Enable Boot Survivability mode
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <aravind.iddamsetty@intel.com>
References: <20241212054945.1091894-1-riana.tauro@intel.com>
 <20241212054945.1091894-3-riana.tauro@intel.com> <878qsfucxo.fsf@intel.com>
 <Z2BnbVDjnTQ3CJYf@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z2BnbVDjnTQ3CJYf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PEPF00000183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::49) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA1PR11MB5900:EE_
X-MS-Office365-Filtering-Correlation-Id: a0e87483-0545-47a8-826b-08dd2f262fff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHk5bk9pbnhmdC9VbmM0bU5DTEpFTGN3bE1UNWE1Mkw0NjUvcEU0bFI5dlFN?=
 =?utf-8?B?UDluVHFuYkhjY1dPN0JNU3IzSGh6WHRtWlBnZkpWS0FzeVc4elBHc1NrMDRK?=
 =?utf-8?B?TkRNbUhiY0M5YWJSMWxQRlpCREJGRVM0eGhXZDd2ZjRHSHhIMkMrZ09Hd2Nu?=
 =?utf-8?B?Y2lISHJjNlFXL3pZWDd4UGNKVEhsUVRyWXJaNmNuZ0lCMlpyM0JPbjRLWjJF?=
 =?utf-8?B?WnZOb2RueVNUVE9iU2RqbGJHZXJXc3FwN0dudWIwemt4UFdOMUNMQjZUaXAr?=
 =?utf-8?B?UUNnelMram4yRXNaWkVaK2lCZlRsWmRlM1NobWUzK0krMGkzSHVDZnVHeFRO?=
 =?utf-8?B?d3JxenF4LzFnOVpnVUhDWS9mc2Vuby9NNnFKVlYyYXkyRHdrdytJNWpQd0Vn?=
 =?utf-8?B?TjZCdUR5VURxR0VDVzRWSkg5M3plRjk1VUdsbjJDaTlMNGZkcGxmcS9nMGZp?=
 =?utf-8?B?MGZVeHZUWElXSUJWaTVETktySnhObUIwaTRIbEU3MllnVnNRMFJHWVZXS1dx?=
 =?utf-8?B?VTZ2TXNuekNnbzcwOUhSNmIySEp2T0lSTDBERjhUVTZKUHYyaWh2aXVRL1RD?=
 =?utf-8?B?RFpUK2pPTGhNUnRLV04yazdGcDBiK3ZLeW42Z0FSZEVIQkREMGRvUnNvS1lq?=
 =?utf-8?B?L1RwemxKTm8rRGFTaS9kb1RYYXpPcUxiUGRQTzh3MzZDMUN2MW84dlNNY3Zh?=
 =?utf-8?B?UHFkR3hKcDJ2R2FSUU8vZUR4WG05a0lrWWcwVlVFV21FNWxJUEJqc0grZ0l2?=
 =?utf-8?B?MFJoM2VleE5RdnNKY1NUVm5qdjdrVVROaUhSQ1VPekExcjZsOHJNMmFwTjVx?=
 =?utf-8?B?RkdRY0M1RXRIY0tJa2NGTm5CZDZUNTdBaVp0blg2TzltSmJMUHFRWUd6eVVr?=
 =?utf-8?B?U2VSUy9xUXlLQmlmTFJqL0poSnhRV2hKT3QvZ3pYcjFwam5CS1lzeGtjTThn?=
 =?utf-8?B?VXordXZxTUlHY2xKM3M3YW5KWVZTSXExek5wWUVPMGI5Y2hJZXhjd0xISU9x?=
 =?utf-8?B?M1kyM2w0VVp0WmxRd1JJak5xRFdKemlIMmllcHI4a01MQXMxWjdaTFAzTEpR?=
 =?utf-8?B?b3VoUEIyVTdUcFYwYVd2SWg3dHBJazFvS3E3TWlDN2lNMzdOUmpuaFlCQ21J?=
 =?utf-8?B?aUVMQmhEN2lnZCtqdlVJRHpxMGo0YjlMOFdJcnpDa2c2ZkRYd2JIY3lYMU9j?=
 =?utf-8?B?bk9oTmhqblVyYWF0VHl4TkdhcVpQeTAzRU5vczNIU1VmZnhva0s5aFV0NG9z?=
 =?utf-8?B?V2sxNW5UcEpqZG5nZ0R2bVQ1MDNObGhvYTR1QmJjMUF5ZysrOU1JMWZ4RVRk?=
 =?utf-8?B?aWxqMWRDR1U1RXI4M0ZjbUw3YTcvWGg5clNONGI1R2hVT0R3RDZZNVRqcVdt?=
 =?utf-8?B?M2Jydm1zSElnMFNXMFdxVEJjOG5ZZ3VUZVFkU1I2eTlSV1o3ZlA0MTkxQnVj?=
 =?utf-8?B?cXBHTVh6ZDBMZDN1cmVFTG9iZHVxT0szY1draTRXUVdyVENlMDVqZ2lWR3Np?=
 =?utf-8?B?Ti94d2JubVFaNDBENnlkS0c3amNJUXMxWmxyaHBPbmtPNGEzZC9OMDEweXJy?=
 =?utf-8?B?NG15MnhZQjVFMjcvc2x4b1lKUzArNXBKM1lDZ3hpNmlZd1NyaGZHOS9FL0t1?=
 =?utf-8?B?TjBHN2w2dGg4SWR3eFJROHl3OFRRZWxNTDRCVS8vMkVYeFNoN0taODk5M0E5?=
 =?utf-8?B?dTA4YWVjQnRrWTdxNGhqS2hHOHFBY2p5cXNNSnJrTUF3RmFnQVBFWDdnSTgw?=
 =?utf-8?B?dlhMOUV3VXJXMXQ0UFk0RWNxaHE4TDV1VGpyZjN4cXZkTVhud2UvaEV5R25j?=
 =?utf-8?B?WlNRR3FYMDVwVTZhRmhNVFFic2xLQUhQUm5lWklYNTZ5RWlRbnVpWk5QbW5h?=
 =?utf-8?Q?FZw6Qe+lRle+G?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1lpOFVGWWcwN3JFbk15eFlSdHlOdjM1SVgxSEVDRVJ6WXY3aENnK3NuTXhT?=
 =?utf-8?B?NXU3Vm12UGQxajJnaFlWYzMxU2hLL3dSbVI0R1F3S2lBSkNvbFZrMWY1dGNB?=
 =?utf-8?B?RXovWUZ4T2xJSlhtUkpadjR6L0VuTVhHYUp6UStKUXU0cG1vdVBGeVBHbXh2?=
 =?utf-8?B?TDBmQUpXUmtEa3dHSXVpSnh2YnVwYW1PSW5YNUthWXpIWVBWL0h1WmJwUEpN?=
 =?utf-8?B?ZEt6RDI1WFFnY29UaDkxclh3QmhqL3RNRzhZYTA3bXlLbDFsNmIzUkpKMG1V?=
 =?utf-8?B?eDRPcUJzK3dmcm0vNEkxcDk3YVh4MWFpL3lrRFR5Y05sbW5OdUxkeThrY2t0?=
 =?utf-8?B?RXg4UXdPeXl0eGl5Tk5rSnI2SzNTTmVESnR0V21RM24xamJ3dW5rRkVPZS96?=
 =?utf-8?B?V0c2UWF5YU9Mdnk3dGdoeVYxdFc1QS9YNU1kdU5uWjdPVGJMNmc1TURCMjBm?=
 =?utf-8?B?THc3eWJOdkdvRjdxNlhQNTFxYXphRE5XblBIMmZSb0tUclJNaE1NbWRzcGxi?=
 =?utf-8?B?YXA2QW1DSWl6c1d3bTVabldwZ1I5ZFZiN1daajJNTXdPZGlRWVpBYTZuMHZa?=
 =?utf-8?B?akkzcXorWXEvSlpFZVg4NkQyYnEyK0hRQ2NmUUxJeEV4R1FWU20yTGVsQlRY?=
 =?utf-8?B?UXZtVlBFOGY4bWQ3Q0dtbWVKTitaV0tUekhPMGYyQW9md3libzJFQUpKTkth?=
 =?utf-8?B?T2l0VkhNdG1ENnpFZHFMZC82UFpvRnBGTW8wMnMyQW5BSmIwN05IeUx0cXFq?=
 =?utf-8?B?cFNrK0FVcm82YmltV2QxVUREakNwVlhjeWJ2eHBBcTdzeGg2dXJQTU9Ha2Mv?=
 =?utf-8?B?YzQ5MXpsamhoanlqQXV6eHFGVWRRVTVvUTMxMS9kcDhaNGlNSGxHWlVKUXFD?=
 =?utf-8?B?a09uSlhVd1JZaTZERURabUhwSGVJVWxwVUdqbERzMHdJZ2ZuK0xZNTNKWEo0?=
 =?utf-8?B?N05DQzVIc21hOUo3RE1Gd1lqV0RjaCtDWFo3cmprTUlEVExKS2hRRHVablA3?=
 =?utf-8?B?ak5DakE5YWJvcEpsN0wyQVorc1B1R0xJMVE0NFRqUDVQcDZsTWI4ODkxQXYw?=
 =?utf-8?B?ZFZFZ25xUEtBTUE1aG5MYlhsU1p1ejNpWlNpblA3QUdGYXMrUUQ0dHpIUzhD?=
 =?utf-8?B?amN6ekwvU24zaXVVZWM1Nmc2SnM3QlF5WUFBT0hMVVhDSWdEMXBJS3Y4KzFq?=
 =?utf-8?B?TFp3cFVBb1c3RmpRT3pndUR6WlYzamNQNVBzTjVybGJVMDlndVRnSE03aHQr?=
 =?utf-8?B?UUMrc1RLcFNvQVZuR2ZaY3JqYmw5MzhxVUJjVk5ENzRxTDRiT3duVkJtVHJy?=
 =?utf-8?B?T1dYdnFrT3VEVmxqQmN0eE92RG5wdzJoNnRpVnJGSU9qa0RkVTh4NFJsRkJS?=
 =?utf-8?B?ZjlBK0lOajZ4SlF3WEppNURxcG5sTTJBQjd1a1VHZ1B6bWl4N2tMTXJWTDVv?=
 =?utf-8?B?UHFIQ3hucjJadDBlQ0VheWlGVUJDV0ZnVW9KQ3BNWXloUld1aWFQY0pRSEQ0?=
 =?utf-8?B?VjlzNmppeDVOREdTWFhKVml5eWdPeEFDZ25jOUlQcFhaTmM1OXBMMzVjWTh3?=
 =?utf-8?B?aG91Q3pRQ2NJMUV0YmJNdDFRMkNBbEpoLzZXOXVKNFFhMEJORGREVzNkcEYy?=
 =?utf-8?B?NjJobTExV3RGRHRaK3BsSlFxNG1UUytxbjZvaGNwUlI4WFlFMWJScTExQ01R?=
 =?utf-8?B?TFpmaTl3Um0wY28xOXg2cFFrTzVHQVcyeDd4aTZPODJRWHhTcGpWallhUDI2?=
 =?utf-8?B?blNEMzhlN2ZLZURoN2lIR0l2aTU4VmxjQVc2SElZNW5CcUJUSnQyV2loZnFC?=
 =?utf-8?B?UjNrK0hZQkp2WC8zN1BhS0p4MUljU2lFdFpPMUtoRC8vWkQ3dDZzdXd6MGVV?=
 =?utf-8?B?cXdxZ1dUdkZZeDZ3NXBnaHI1V242cFhZOTVCdWFiVlJIMFhUNDBGU1ZVMWxO?=
 =?utf-8?B?eHFqOUsrTk9iVDlodGxGNmZpRjBta2JlbjJqT3NOV0VtbWwxQWVQSFRUc0Vm?=
 =?utf-8?B?b3NXSHdSV3JTTnVNczMyVjAzR1FSSmFNeVB6WjVxMk1vN1Z0V0hFRDdtL0Rm?=
 =?utf-8?B?clAvSCs4Yng2dmdRaStzK0x6bk10MEFBME56QXF5dloyWmNXRndYekwzbTkr?=
 =?utf-8?Q?OGZIHSVYNC0b8PdYUpO/MPq3u?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e87483-0545-47a8-826b-08dd2f262fff
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 14:18:42.0963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: evQNt+WtcxEVu3Mlq7EnxZIf01qMShD7v+TYVAiiTzdFnSm2MMEcHzqwxw+3ege4B9T/Q7rKnsBBVczuRb5BNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5900
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

Hi Rodrigo / Jani

On 12/16/2024 11:16 PM, Rodrigo Vivi wrote:
> On Mon, Dec 16, 2024 at 12:42:11PM +0200, Jani Nikula wrote:
>> On Thu, 12 Dec 2024, Riana Tauro <riana.tauro@intel.com> wrote:
>>> Enable boot survivability mode if pcode initialization fails and
>>> if boot status indicates a failure. In this mode, drm card is not
>>> exposed and driver probe returns success after loading the bare minimum
>>> to allow firmware to be flashed via mei.
>>>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_device.c             |  9 +++++++--
>>>   drivers/gpu/drm/xe/xe_pci.c                | 13 +++++++++++++
>>>   drivers/gpu/drm/xe/xe_survivability_mode.c |  3 +++
>>>   3 files changed, 23 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>> index 56d4ffb650da..50ed980e1db9 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -51,6 +51,7 @@
>>>   #include "xe_pm.h"
>>>   #include "xe_query.h"
>>>   #include "xe_sriov.h"
>>> +#include "xe_survivability_mode.h"
>>>   #include "xe_tile.h"
>>>   #include "xe_ttm_stolen_mgr.h"
>>>   #include "xe_ttm_sys_mgr.h"
>>> @@ -585,8 +586,12 @@ int xe_device_probe_early(struct xe_device *xe)
>>>   	update_device_info(xe);
>>>   
>>>   	err = xe_pcode_probe_early(xe);
>>> -	if (err)
>>> -		return err;
>>> +	if (err) {
>>> +		if (xe->info.platform == XE_BATTLEMAGE && xe_survivability_mode_required(xe))
>>
>> Why the platform check here? Doesn't this stuff belong abstracted inside
>> the survivability mode?
> 
> Indeed. Moving inside xe_survivability_mode_required() itself sounds the right thing
> to do.
> Also, it could be IS_DGFX && GRAPHICS_VER >= 30 instead of platform check...

Had checked this, but graphics ver is set in xe_info_init. Survivability 
mode is set in device_probe_early, that's why i used platform check. 
Should i move setting graphics ver earlier too?
> 
>>
>>> +			xe_survivability_mode_init(xe);
>>> +
>>> +		return xe->survivability.mode ? 0 : err;
>>
>> Is it a good idea to start looking at survivability guts from all over
>> the place? I mean xe->survivability.mode. Even its value should be an
>> implementation detail, and this is using it to decide whether the
>> previous call succeeded.
>>
>> I think this would benefit from hiding stuff better and providing
>> interfaces. This is one of the things i915 sucks at, and it's really
>> hard and tedious work to fix afterwards.
>>
>> Just imagine xe->survavibility is an opaque pointer (even if it isn't)
>> and implement stuff based on that. It will make a world of difference in
>> future maintainability.
> 
> indeed...
> 
> bool xe_survivability_mode_on()
> {
> 	return  xe->survivability.mode;
> }
> 
> would be enough I believe...
Sure. Will fix this

Thanks,
Riana Tauro
> 
>>
>>
>> BR,
>> Jani.
>>
>>
>>> +	}
>>>   
>>>   	err = wait_for_lmem_ready(xe);
>>>   	if (err)
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> index 7d146e3e8e21..b9dcd36de06d 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>> @@ -30,6 +30,7 @@
>>>   #include "xe_pm.h"
>>>   #include "xe_sriov.h"
>>>   #include "xe_step.h"
>>> +#include "xe_survivability_mode.h"
>>>   #include "xe_tile.h"
>>>   
>>>   enum toggle_d3cold {
>>> @@ -768,6 +769,9 @@ static void xe_pci_remove(struct pci_dev *pdev)
>>>   	if (IS_SRIOV_PF(xe))
>>>   		xe_pci_sriov_configure(pdev, 0);
>>>   
>>> +	if (xe->survivability.mode)
>>> +		return xe_survivability_mode_remove(xe);
>>> +
>>>   	xe_device_remove(xe);
>>>   	xe_pm_runtime_fini(xe);
>>>   	pci_set_drvdata(pdev, NULL);
>>> @@ -840,6 +844,15 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>>   		return err;
>>>   
>>>   	err = xe_device_probe_early(xe);
>>> +
>>> +	/*
>>> +	 * In Boot Survivability mode, no drm card is exposed
>>> +	 * and driver is loaded with bare minimum to allow
>>> +	 * for firmware to be flashed through mei
>>> +	 */
>>> +	if (!err && xe->survivability.mode)
>>> +		return 0;
>>> +
>>>   	if (err)
>>>   		return err;
>>>   
>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> index 7e36989efd68..6c1e79b5c15f 100644
>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> @@ -176,7 +176,10 @@ bool xe_survivability_mode_required(struct xe_device *xe)
>>>    */
>>>   void xe_survivability_mode_remove(struct xe_device *xe)
>>>   {
>>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>> +
>>>   	sysfs_remove_files(&xe->drm.dev->kobj, survivability_attrs);
>>> +	pci_set_drvdata(pdev, NULL);
>>>   }
>>>   
>>>   /**
>>
>> -- 
>> Jani Nikula, Intel

