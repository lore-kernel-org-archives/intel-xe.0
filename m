Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34209EB362C
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 19:37:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D1610E59D;
	Mon,  2 Mar 2026 19:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OFyzQVw/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE92310E59D
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 19:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772480245; x=1804016245;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iJ70ae/nM2ZxardViWOz1slhumqQbglOYTm0m8F6drg=;
 b=OFyzQVw/Op/LVRkeNTeher9GKsbAcFU0RMk3xkn9IsYrbuIeG7rDG1Y8
 ZFrx2524v0BIZ4EaI47G10i8uKqyHUlGXfUzoF6b0J6nA1DaSSNi7SLEq
 c6UZBoKGL7uNZj/zgaJ60WFyeMbrdNfNDNr8lVn88OEZk+R764anVs2xS
 6F1OQ179ezUzJP9VE19RsZgR88IGEziuGw9OQdscsj6qX2gG4yPTcgXNW
 GRFDc4P5CZI2MzwFs6lZDAAxfWn/nlCHOFcVHLSfZz1b8VYgb+FRBvkwC
 1Veg7lzldvJeDhlLzCrzCxjT1r8B9hh7YDgkTYzi15v0K3TIM+Fc0YC/T A==;
X-CSE-ConnectionGUID: TKlW+4ncTpyD60s5fk0R2A==
X-CSE-MsgGUID: T5id3/NLTSObIQdvYSnzNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="72529610"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="72529610"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 11:37:24 -0800
X-CSE-ConnectionGUID: nDl9NDAIT0iEqBZurU8Lqw==
X-CSE-MsgGUID: WpjHMbVPSpmW9odtYpLTog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="216996513"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 11:37:25 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 11:37:23 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 11:37:23 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 11:37:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jwbx9EHPhYwaZCSWIOnBgx16yZ5W5eBZPwwW28lxe4TPc7pGwx5RIfPDheI/m4T+fnrDccaVab0Q41CKhr0YpjvLWJMuNg8XJ6fZXPjDaapahbUWIaHOPZTS+ghakJPtc95GaY3i0NlI2SgluoEUQvw3hxM5LKjQdJ+yB/TUfaNLwdjeWsm7uPFAWhbyZul6orzU27Ex49w5n9u+d40DZA11hhHOR3sxzx7NJ65KCQa89FBf+t4lDgYUL6sQ+/WyrJuHIkK56Cl9WpBHFa1J3xzVArYhmwH72XZ8OnQDIzbHFVEBm/hb3Z4ErUwNckNu792GR2BilkdrooN+3UUKrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CJzchiLLFbg1wIZJ0/J5Uyhj1DOaGRYkvysnXKp2tQ=;
 b=SK1TpnDP36t6touxNLlLwXC+0u2uHlq2bMN5TN1vpDqHiE/T8pDKuvejM0ChqIoaAbj6JrN38TpFggmxbn/PuXBu/k/8eXOAypHpucdkcUTfBNMZgIiyZXNR6YxuTT8dq91ExSEn49FeX/liZ7iZMYbIoSo1iIuEbnt6/JF4v/U9y0mjNPaqydcrEitpgCsEAuvckosFQdaURSzAceVbj0qkZJKW8xERuOuyzeGXtjDEwtn4bOGyE9ujGPf21YfgLIq3D7q/9gadXBwLJ2ebF1qX4KAcict+Qi1adY5NUdbeYc+ko5P17ypJnrNi5jYk5EQ3W+V2jFyqOwZWHiNGXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SN7PR11MB7468.namprd11.prod.outlook.com (2603:10b6:806:329::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Mon, 2 Mar
 2026 19:37:16 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 19:37:16 +0000
Message-ID: <ae00396c-e643-4044-a06f-724498c1fabe@intel.com>
Date: Mon, 2 Mar 2026 20:37:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] drm/xe/pci: Introduce PCIe FLR
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Jadav, Raag" <raag.jadav@intel.com>,
 "aravind.iddamsetty@linux.intel.com" <aravind.iddamsetty@linux.intel.com>
CC: "Auld, Matthew" <matthew.auld@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 "Winiarski, Michal" <michal.winiarski@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "maarten@lankhorst.se" <maarten@lankhorst.se>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
References: <20260227170049.3418863-1-raag.jadav@intel.com>
 <20260227170049.3418863-10-raag.jadav@intel.com>
 <f6183892f5caac00192c83b213e3e22e5e9ad453.camel@intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <f6183892f5caac00192c83b213e3e22e5e9ad453.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P195CA0071.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::24) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SN7PR11MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: 21fb5b82-4a7f-4b50-548d-08de78931c49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: WQEIRcyWQ6iiN6K28NR0UIDKXYmFtLfDd6F1k7fori04ToOL6AJnrPHJ/xZgg9u+0SLph4StgZ674Qwn4X7BPJ2HnmtlnnSQ8OfStG/WQhqGE+ycF44k4dn2urUQZ1u27UaEv4W/77CrH0Enq4BygwCoUA7bsrGndkHFNsl2/QzBtOxH1edKJ9hegThkVuNZN7C2vuino48CGrbTzCpCqkxD6L8Qdvwl2p9WjKU7+l2m1y3y2+jrJcT+R+6CplccAIvyg89FYdszvYglY9fj7vWoLuI2khxd8xH52NkZoQXRmpYoRKj3gcmm7xAsm5AyjrbRGvk3sgr3YaajjzR0PFCb5AAG8viETW/r5lmYO2nnkdWZijuBr+z0D1Aripa8eltZ7A0nDqcKX46YQ6mQ6nDk1C5S7lhznT+jU1Qf4WJIQsYo5eghKdg2DoOhpDZ83sDNDBkltvMlgjO8FqOs8jkLGIbVfP3TOgmVcbkFpQxVgVyjfXrWmiagPG/0lsZkdIlRCGAcE94qV5UFG09TDxfc/IecrnuM108OT+spiuDkIeHGrgDJi+cT5AbeCgWlCZaHxNOR5LtTXNX3z0EQ2Jfo9IkBObGrenXICcPAl3bEwLu51+zvJ5VICCc3gy6ZpMFjkzHD+p433el78A76JbC71JpHPWXgCs6SAGuDSqrhau1Eoc2vCBrMqKeSLGukKEhceM8ZdK/HustKaT7TQQS/qGUFfdmE2g66ztcSzpM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDkrcW9oZEppbWFIdHAvdDZQaUhEdld6M21lYzQ1RE44cFRFbTdJUDA5dmVP?=
 =?utf-8?B?SzB3MkVxNDhwUVNkR1BmZ1VHeGtRUU8yZGlaY1A4T0s5MC9iTXUwV0JVQ05U?=
 =?utf-8?B?Q3ZzMko3QnM3eWtuOERVNmo1V3dtckhuTXoyZW83akJzdTFWa2RYSUdRc1Zz?=
 =?utf-8?B?d1FrM3VYSmRlb0VlS3A2ODBIc0k3VTdua2JZMEZuNTZaNjhVQUZDYmdYQzRQ?=
 =?utf-8?B?Um53MkRTUVFnTFd5S3pWSTg1QkZNL013aS91WU54N2xVU0VSTVZreVhQcDBy?=
 =?utf-8?B?TU1BMkFGdGdaR2RUa2xySG9yMVo0UXZqRm54ZVpReWFxbzhKaDFLaSt3Mkt6?=
 =?utf-8?B?VmlETmM0UldhcGZjTnJsdVJSWVAva01CUC9xVFZhcEhWYkcxODF2aGFLalhE?=
 =?utf-8?B?OUQxakNZdklHaFdjQ29OV0Y0TkdtalBEdEFqYy82QVR5NElad05uVFNyQlZ6?=
 =?utf-8?B?VmJlT0QxZ2FET1pjY1Q1N25hQ2pjQkhCSDNNUUJoWXptNmlaQlBvSm5EdGUw?=
 =?utf-8?B?WklnKy90Zno0bzN1cEpkUGw0VG8xWUFKYnVpRHlSamRDT0krd0ZDNG9kYnNa?=
 =?utf-8?B?NHp2MWpGNGZoeXMzMkdGc0VtUGxGS0NLZGliQktNZ0hLY3pPV0hHZEtNa0hH?=
 =?utf-8?B?ZTNva2J5TFJ5ZkFncW45OTdEZEZKeDhPaUtPT1VLVWlsQXBqbWYzZ1QyMHJZ?=
 =?utf-8?B?VTJVRU1UeVFrMmF1bDZiS0xWeXY4RHRWMFJiY1lmMU5uSWhSdTVyczkwRmli?=
 =?utf-8?B?L3Y0VmRmSUNNUUM5R1ZIWVp2QTdRaTZHQ21IcUtmbmZFeWlGYTArWlVIcEt2?=
 =?utf-8?B?R2JmT1JGRnJyQm9BMmJQSENSQjl4dHd0M2FGR0VtZUUvVENmR2lYc09oeGZo?=
 =?utf-8?B?NFNqR3g4czZiMUg2eG1YQ2p5dnZuN2lYUGNJaU1KY2pIekRPTjJMLzJEU2l1?=
 =?utf-8?B?K3ROWEpBcUg4L3UyVXY1b0IyZEFtZ0tJblFxWnlzRUhZOGYwT1BpNERFTHUr?=
 =?utf-8?B?Rmh0emxkU25nSVBJYU43R0xKN2xpai9jVE5XSGFrRmQxc0dVUTE2a3k3MFNl?=
 =?utf-8?B?U0hCR3FvTy81QnJtcDFSbXpVNHhsaGVRWmRzaG9aQU1BeUpJMW01cVZTbWNx?=
 =?utf-8?B?Y0FQMjRZak0ydEFtQXFmemFaSW15emkyemZxL3B6aE9uU3pXbVhsb2F4ZmlM?=
 =?utf-8?B?dHZ3aUJIeEFIcTl1TTRUSEV0VnliWEkrNFJxNXY5SGgweG5id3NjVjZsVmUv?=
 =?utf-8?B?TnVtQjV1NDhpNHFJSG4rWW5tU3QzelVSRFJESTJObGlyczFKeDFCcEpveDMz?=
 =?utf-8?B?Vy9pZmtOQytRV05tVUxZVnVteXN6aGlldXJ6Sm0wVTZUOFBrQkJTdFZ1OVQ0?=
 =?utf-8?B?MkdOa1lCTEtibXBBa3AvSjduUWRHWXVJZnRPZkorK1BiNjJKTDh2eVYvbENC?=
 =?utf-8?B?b2dnNHdmNHVZaTdtWFJWUU5oeThoRjZXTnlWUmQ2WWw3ME40ekExdTBwVFQ1?=
 =?utf-8?B?aW5WaHJ5Ti9IaWdjZVNWU2tHeDdvaWJKTmc5bzdkSndTdVpwUWNtdGVpQk5o?=
 =?utf-8?B?amdTVmw2M3ZYSTAzS3R3cy9RTlFvWW84aWN1bGJKMmE1Qk1QNFRMZHk3QWdK?=
 =?utf-8?B?VVlwdlZzT1ljRzhhb3NYS2JEcGdENWNUMlBycHM3SWRTaG5BN3duSy9jMjFk?=
 =?utf-8?B?b004S3d3dC9IcEU2ZnFxV2pJL0ViNmZ4OHhWdHN4N2crck5LZ1FPT1dIZ0hu?=
 =?utf-8?B?OWpqUERwZVk1QzJKaERGUUNQVkJFRytzZ2VrQnYrRWhPUGNqZU5LSVVUTjFz?=
 =?utf-8?B?RXRYZGFIOWw2NTQzSHArRzc4clJtN1JFaGV1b2NVdnZhT0JXZFZHMnk2RFZ6?=
 =?utf-8?B?R2NPOXRGbk1JU1hKcDFQNk1vRUc5N2FtZ1dWQnhCTlE0SVppcDc3cDVkNlMx?=
 =?utf-8?B?T0pzWG5PNTQwN2pMVFZuK1IyZktJWXpCVFVUZHY1MW1wM0NOaUxkb2tJaGRo?=
 =?utf-8?B?OCtFRlZyL0xnOThSMGZ3VzJWT1ZhTlROdVU0NDdmWmV2VjVmU0FtWjBiRHpL?=
 =?utf-8?B?UExoL1lMTzFUdDlLb0hNV1o5V2oyS0tBRmVYZ1orbGNaMk5vTUxCNWx3TER6?=
 =?utf-8?B?cW82WFBUdXBELzZMSkhYYTRnUkhFK1B3a3B1aloveFhxWUIrZDhsRHRIbmlF?=
 =?utf-8?B?U3NUL1p0LzhkQ3BERmtCMlpxMUtoK0tRMmg3SUJQSUpKQW9JQVRWSXBud21y?=
 =?utf-8?B?RTNMaXlQRGRqcnplYzF1QTZOMFFoeHJRVjNUOHEyKzZkSTl4ZFJaOHlKWTZK?=
 =?utf-8?B?V3BOd283Q3FZa0J4d243M1NiMi9OV0ZYVEdGczNtZ1NWNE1BUHU1Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21fb5b82-4a7f-4b50-548d-08de78931c49
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 19:37:16.5171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i5u/C4HZOyKNrWlqjiM75zAF0MNN2OPDHDX/FirFOq3Rm3V/6SFXP3kR1t3vAaaafEX6GsU5XidPcKRfkzOQ4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7468
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


On 2/27/2026 18:49, Vivi, Rodrigo wrote:
> On Fri, 2026-02-27 at 22:30 +0530, Raag Jadav wrote:
>> With all the pieces in place, we can finally introduce PCIe Function
>> Level
>> Reset (FLR) handling which re-initializes hardware state without the
>> need
>> for reloading the driver from userspace. All VRAM contents are lost
>> along
>> with hardware state, so the driver takes care of recreating the
>> required
>> kernel bos as part of re-initialization, but user still needs to
>> recreate
>> user bos and reload context after PCIe FLR.
>>
>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>
> Do we really have everything in place? I'm missing the handling of VF
> here. Hence we would have the same deadlock pointed out by Michal when
> Aravind attempted it last time, no?!

This seems to be different from Aravind's previous attempt. Here we 
don't remove the driver and as a result we won't attempt to disable VFs, 
so the deadlock scenario shouldn't apply.

Lukasz

> We probably need to use the guc relay communication here so PF can
> inform VF of the FLR, then stop all the workload and wedge the device,
> before the AER triggers a kill of the VM, no?!
>
>> ---
>> v2: Spell out Function Level Reset (Jani)
>> ---
>>   drivers/gpu/drm/xe/Makefile     |   1 +
>>   drivers/gpu/drm/xe/xe_pci.c     |   1 +
>>   drivers/gpu/drm/xe/xe_pci.h     |   2 +
>>   drivers/gpu/drm/xe/xe_pci_err.c | 150
>> ++++++++++++++++++++++++++++++++
>>   4 files changed, 154 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile
>> b/drivers/gpu/drm/xe/Makefile
>> index 7fc67c320086..bc468a9afc48 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -99,6 +99,7 @@ xe-y += xe_bb.o \
>>   	xe_page_reclaim.o \
>>   	xe_pat.o \
>>   	xe_pci.o \
>> +	xe_pci_err.o \
>>   	xe_pci_rebar.o \
>>   	xe_pcode.o \
>>   	xe_pm.o \
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c
>> b/drivers/gpu/drm/xe/xe_pci.c
>> index 0a3bc5067a76..47a2f9de9d61 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -1301,6 +1301,7 @@ static struct pci_driver xe_pci_driver = {
>>   #ifdef CONFIG_PM_SLEEP
>>   	.driver.pm = &xe_pm_ops,
>>   #endif
>> +	.err_handler = &xe_pci_err_handlers,
>>   };
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_pci.h
>> b/drivers/gpu/drm/xe/xe_pci.h
>> index 11bcc5fe2c5b..85e85e8508c3 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.h
>> +++ b/drivers/gpu/drm/xe/xe_pci.h
>> @@ -8,6 +8,8 @@
>>   
>>   struct pci_dev;
>>   
>> +extern const struct pci_error_handlers xe_pci_err_handlers;
>> +
>>   int xe_register_pci_driver(void);
>>   void xe_unregister_pci_driver(void);
>>   struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev);
>> diff --git a/drivers/gpu/drm/xe/xe_pci_err.c
>> b/drivers/gpu/drm/xe/xe_pci_err.c
>> new file mode 100644
>> index 000000000000..16fc6a9f8289
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pci_err.c
>> @@ -0,0 +1,150 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include "xe_bo_evict.h"
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_idle.h"
>> +#include "xe_i2c.h"
>> +#include "xe_irq.h"
>> +#include "xe_late_bind_fw.h"
>> +#include "xe_pci.h"
>> +#include "xe_pcode.h"
>> +#include "xe_printk.h"
>> +#include "xe_pxp.h"
>> +#include "xe_wa.h"
>> +
>> +static int xe_flr_prepare(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	int err;
>> +	u8 id;
>> +
>> +	err = xe_pxp_pm_suspend(xe->pxp);
>> +	if (err)
>> +		return err;
>> +
>> +	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
>> +
>> +	for_each_gt(gt, xe, id)
>> +		xe_gt_flr_prepare(gt);
>> +
>> +	xe_irq_disable(xe);
>> +
>> +	// TODO: Drop all user bos
>> +	xe_bo_pci_dev_remove_pinned(xe);
>> +
>> +	return 0;
>> +}
>> +
>> +static int xe_flr_done(struct xe_device *xe)
>> +{
>> +	struct xe_tile *tile;
>> +	struct xe_gt *gt;
>> +	int err;
>> +	u8 id;
>> +
>> +	for_each_gt(gt, xe, id)
>> +		xe_gt_idle_disable_c6(gt);
>> +
>> +	for_each_tile(tile, xe, id)
>> +		xe_wa_apply_tile_workarounds(tile);
>> +
>> +	err = xe_pcode_ready(xe, true);
>> +	if (err)
>> +		return err;
>> +
>> +	xe_device_assert_lmem_ready(xe);
>> +
>> +	err = xe_bo_restore_map(xe);
>> +	if (err)
>> +		return err;
>> +
>> +	for_each_gt(gt, xe, id) {
>> +		err = xe_gt_flr_done(gt);
>> +		if (err)
>> +			return err;
>> +	}
>> +
>> +	xe_i2c_pm_resume(xe, true);
>> +
>> +	xe_irq_resume(xe);
>> +
>> +	for_each_gt(gt, xe, id) {
>> +		err = xe_gt_resume(gt);
>> +		if (err)
>> +			return err;
>> +	}
>> +
>> +	xe_pxp_pm_resume(xe->pxp);
>> +
>> +	xe_late_bind_fw_load(&xe->late_bind);
>> +
>> +	return 0;
>> +}
>> +
>> +static void xe_pci_reset_prepare(struct pci_dev *pdev)
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +	/* TODO: Extend support as a follow-up */
>> +	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || pci_num_vf(pdev) ||
>> xe->info.probe_display) {
>> +		xe_err(xe, "PCIe FLR not supported\n");
>> +		return;
>> +	}
>> +
>> +	/* Wedge the device to prevent userspace access but don't
>> send the event yet */
>> +	atomic_set(&xe->wedged.flag, 1);
>> +
>> +	/*
>> +	 * The hardware could be in corrupted state and access
>> unreliable, but we try to
>> +	 * update data structures and cleanup any pending work to
>> avoid side effects during
>> +	 * PCIe FLR. This will be similar to xe_pm_suspend() flow
>> but without migration.
>> +	 */
>> +	if (xe_flr_prepare(xe)) {
>> +		xe_err(xe, "Failed to prepare for PCIe FLR\n");
>> +		return;
>> +	}
>> +
>> +	xe_info(xe, "Prepared for PCIe FLR\n");
>> +}
>> +
>> +static void xe_pci_reset_done(struct pci_dev *pdev)
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +	/* TODO: Extend support as a follow-up */
>> +	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || pci_num_vf(pdev) ||
>> xe->info.probe_display)
>> +		return;
>> +
>> +	if (!xe_device_wedged(xe)) {
>> +		xe_err(xe, "Device in unexpected state, re-
>> initialization aborted\n");
>> +		return;
>> +	}
>> +
>> +	/*
>> +	 * We already have the data structures intact, so try to re-
>> initialize the device.
>> +	 * This will be similar to xe_pm_resume() flow, except we'll
>> also need to recreate
>> +	 * all VRAM contents.
>> +	 */
>> +	if (xe_flr_done(xe)) {
>> +		xe_err(xe, "Re-initialization failed\n");
>> +		return;
>> +	}
>> +
>> +	/* Unwedge to allow userspace access */
>> +	atomic_set(&xe->wedged.flag, 0);
>> +
>> +	xe_info(xe, "Re-initialization success\n");
>> +}
>> +
>> +/*
>> + * PCIe Function Level Reset (FLR) support only.
>> + * TODO: Add PCIe error handlers using similar flow.
>> + */
>> +const struct pci_error_handlers xe_pci_err_handlers = {
>> +	.reset_prepare = xe_pci_reset_prepare,
>> +	.reset_done = xe_pci_reset_done,
>> +};
