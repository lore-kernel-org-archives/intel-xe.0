Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B63C3DA5D
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 16:41:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1663A10E892;
	Thu, 25 Jul 2024 16:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bYvydDkO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F9B10E891
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 16:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721925690; x=1753461690;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ce/x4NW4ftLcgN7xvYMWHdGASG+IKrZZLlube7CFSpA=;
 b=bYvydDkOzAsN3M+C/8gCl0/iagPByJz9ArGF3mMklO/bjc/v3am37emc
 wju+UC5nEA43g3h0vbg1pTyVoYiK/3yIwmFb5+y6BsOFhib1y1eTkiF7S
 1AUpc4oNRFrTFa4e6AT29vF6PmvdZIZwpeIdLv3qKsDJJJrPN3wk2+iHN
 M1rB1Ja2M4U2eac14MrHcd9SQ0+jkXJVMCCNEOcqYiF7W32WLI3xsFgR2
 XuJvEXqcIti3WRGUmLbq/XzmkMLaQ3TojO6vRFkhZpFUd8Uj5QXjA1ktW
 TW+wqFS4KCjZhN0v+pkctAlmnWD45ODSlPQQa0Ih7JP2ES0YkNPiY15FW A==;
X-CSE-ConnectionGUID: ZEMAdYShRKW1a3DGHRLzTw==
X-CSE-MsgGUID: jjphcRikRvG6atYYqL80Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19374491"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="19374491"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 09:41:29 -0700
X-CSE-ConnectionGUID: fHcneuPLS6agj+jqDFYDZw==
X-CSE-MsgGUID: dmoaG8aSTzKmsY3M6qdSjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="52686827"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jul 2024 09:41:29 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 09:41:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 25 Jul 2024 09:41:28 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 25 Jul 2024 09:41:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m45i02jln0vzfSOlP4vSOxO8oF1YUuMfXIO1EN7L5dEM/al0CdzpvxG+2du4Fvsa1RCP2uXP47WBJdc5emLZ+89W0vQctWdaN11I0r1isRwteZ/+p8CwQNHJj8S/9htl3SztwWYPzVqEWOZMuARygwwJrjsUoSx70LHbb6jELDCD5NOpE80NtWP6p6UhJ2EMok99Ax06chWR5kL9vjKLI+FBLOm8Uos73B6G09fItnzhuYV1farR0MDA9W5m4lElXkW8B3jv6sQAnZ1bQGgLPHNlvXQkqHvTy6+WbHjKmJqyNAZmTcJP9QxXQBwpGp16+kcQpOl8PDMOR6sHs2LWvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KSRFCZt7r1IP5+lzpLcW7CN6SE97dWHzY7DPmzJWVE=;
 b=EA5a27aAjPRH05900pZEy75dCfmjVNCj8N5Y++BlD732I591ON2avJ/c+kXNQlBXsCH+zZihiF9BseOo4ihPxPJBk2kYrouXaRl4JKnrCl1P6GoArLxYyVQH2jCjq4ls5AYodN4KMr4cEKnBdXSqTzGSiXXAV4F6ZmXm6uPvvh637DvDPYSI12fZbZxxL50tUwjJ9hlqLKMIQeRyV5BLYr1T+XpX2NVtCMFAQCkGrgGfCn+qztzIXou0Xt+ZlBqYwaeSbwcN1S5vkHclUfKPFgGUgX8pkr7wF3G6IzL0Q8wiIud22UuuQs1RMawoT1RHgyo/6U/xfEuTjXcAPuoPhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 PH7PR11MB7964.namprd11.prod.outlook.com (2603:10b6:510:247::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.29; Thu, 25 Jul 2024 16:41:26 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7784.015; Thu, 25 Jul 2024
 16:41:26 +0000
Message-ID: <32c21cac-5d28-4ce9-9474-37320e279d7d@intel.com>
Date: Thu, 25 Jul 2024 18:41:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] drm/xe: Implement APIs for measuring various
 events
To: Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240725150550.13085-1-nirmoy.das@intel.com>
 <20240725150550.13085-2-nirmoy.das@intel.com>
 <ce58c4bb-ab8b-4b29-b291-3b46a24c27d2@intel.com>
 <ZqJ8+YwoOO9MtJB1@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZqJ8+YwoOO9MtJB1@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI1P293CA0024.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:3::6)
 To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|PH7PR11MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: 346f656d-f32c-4e72-352e-08dcacc8a05b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mm9FL0pRb3hWVkZQSmJ5cmZPMkwyb0QvbTdWSjZCR3Y1TEtmRFE1L09MOWRz?=
 =?utf-8?B?SEFZVlVPUWViekV3Wmo4NVVUbDVBaklPZzBNeUYzZ2RHU0NSZXZSNDloaXc3?=
 =?utf-8?B?VFdSSlAzVkp1TTlQdkR5cldwbnFYb1NPVmU5S21wb21ReS9BOXlEWVlYak9M?=
 =?utf-8?B?ek93c1ZIZGM1Z3VFekhtNlhFdmExN1ZtdjNDaHVSdkFTOFFldmJzL0k0UzlG?=
 =?utf-8?B?RFJPU2lRTm02V096dDdSZGZVVDVQMTlpVjFKR28wTytwd1g4RWhrMkJzcHFV?=
 =?utf-8?B?WHd4VVViZkpYbmUzemZuUVdtcXp6QmNudHFJWVY2VjJ5Sno3ZmpPZ0J5dnh2?=
 =?utf-8?B?T1ZQdE5rMkRmajZlVXI5TDgyanpZdlNKZWlEUjNCNEk5N3pPcnZjL0JwZ3hQ?=
 =?utf-8?B?K3AwNTNXVVVMYSt3STMrZTNFNURpTk5TL25CK2ZuR2lYQm9UeHhKUkpXZzJV?=
 =?utf-8?B?OFJ3R0dpc3VrNDZRVFBQbnpGZVNPQ00rZEhVdm5xM0ZxQ3NEZTcwYVF6N0tT?=
 =?utf-8?B?YytXbllZY21qMVRzdXZ1R2xJeHMyQnlOSmRkWmR4ZEpGQit6VFN0eGJYS3Yy?=
 =?utf-8?B?OEEyOGh2R0ZBQjd1a1VvTUtMOU9aTTExOGJZSnNxOEdlYzVkS2JEU1l1MTMw?=
 =?utf-8?B?K1pWdEZhcTZnMXF4bzZJY2xxaFJNWVZOUENlcVJYQWRQNkxHQnFMRDRVUGt1?=
 =?utf-8?B?cHk4Y09zSDArSnFPSHE4TmE5Y2RFck1aNnpRMGdoTWp2NWxwVXlnY3QxcGwr?=
 =?utf-8?B?YVlLMW0vZGZJYmhrWGpwbGU4RXRHdmdyNStiZ203Mmlxcm5yNjNTNUxHRnFn?=
 =?utf-8?B?UWIvTWhTZzRHV3djdE42N0szNmFlZnRxUWRnZlpnUFpXOUg3eGR3OWxndTla?=
 =?utf-8?B?eTNnUlVGNGdZSmZjcEVWajVKTU9BWkJaa3NCZHZCbzRQdHdNOG84RFNCeVNH?=
 =?utf-8?B?QTA2eG1CdkozbUtyQVc3MHgrMFdzak9oTkM5anFsZmkvSkJaM1NZOElvRHVm?=
 =?utf-8?B?OFNxeWVpWXRxa0J0VDBBSUNFSlV4MGJHY2drY2VOV3hXMmkzT2VxQ0c1ZCti?=
 =?utf-8?B?dGsyN2ZpVUhaeW9jUFphQ281U0V1MlN0akVqc2pWUmwxR0VPeU5uem0wSUZ2?=
 =?utf-8?B?dldtaGk0cSsvWEFpN0t2VGt5V09nSTduaXRNK3pBaDJBeEttWHhvazk4SDht?=
 =?utf-8?B?cElPazBHalY3SEhQSGpBZmduMlMrelVPRlB6a2gxSk16VUpoRG5NaEJNM2xY?=
 =?utf-8?B?VWdTNEhSWE94dWxXY2lMSkdtNWJyNlpLUEtaWkprZUtFd0dmNTVaeTlxeU9z?=
 =?utf-8?B?QTB0UHZYMXBaZDRwOHZvcm5MeTRFZDNtY3hJa21mNU4vbkZCOUhwWUFYODZS?=
 =?utf-8?B?eGFiYUlQUEhqR3FkVVdZOWZyY0NGUjVlWWU1NWMxYXBXTkx5Z0IvNllYZ0hJ?=
 =?utf-8?B?SVg4Tm5YN1ZKc2k1RXI4TWtJWnk1Wm9tVkVwNnlwT1RZblNPTFZZamZJL3BH?=
 =?utf-8?B?bnRYWWZIKzJUdXBIQUpwVHQ2bmJ6K3RCN0RGdXFrbnpBdEpaY1lBMEZCWVBM?=
 =?utf-8?B?bHFQaWZnZDh5bzh2MTVjVGVOcm5UUGhaVzNnYkFVU2tsNDRWVllzditkOTVD?=
 =?utf-8?B?TTBPUjZ2NERKek9RYllhRXNXQ1J3S1Bha3BkQ3NtTkE1d0lyV2lncCt1NjRD?=
 =?utf-8?B?cDNrVmp0UnU0WVNXRkZoNWhYbWZxTk9zNldRYkZheTBCV01CNnZPOEg2R0J6?=
 =?utf-8?B?R0QvQ0Nrdi9GNWdMbmxTeWpNSFFtQ0NiSHg0SWl6eWN4b29xR1g2dVdCaVZi?=
 =?utf-8?B?ZG9OUlc4WjJKYTA4UlY2QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWZDK1R4dkh4dDV1TUVrakc4VHU0d0dnTzZJNzFLNkxLcHhSRGZicFRCeEZp?=
 =?utf-8?B?V0xJQmVzMzJKbStDOWMvSUMvWFhhbFhValNPbEhibGdPbk4xUkZxVWRLd0dz?=
 =?utf-8?B?TWJsaS9yYzBZYk5NVTlZRnZYaU56M2o4c3pZQ3VLOFlBS2l0T2diUGlrM0dS?=
 =?utf-8?B?cE5mSjYvM0NZSDU1cDZzWDVpR1RsTGpNcGZxOWh5QlZicGxnOGI2Y05LaGtH?=
 =?utf-8?B?SXdWSE5SRlprdm9RUEhSWmJIRkpRYTc3NzR2T3JlTHZ0b2FHelJqOFdsQmJy?=
 =?utf-8?B?Ui9HWjlCSWtvSXpXZ2NXai92Vmw5OFJYYXk0eWtHc2lzMnJVTXEzYlhMR21I?=
 =?utf-8?B?UStlbnpnM2lHWk85ZHVkODVycmllem9md1FuL2UrSjBqRGhGa3NoNGJlc01o?=
 =?utf-8?B?N05uYktDZy84eU53bUhyZUJIV1RHTUFqa2t4azgzYW5rVnR1emd4UTlvWm9F?=
 =?utf-8?B?RzNVWm51N3JTMWFEclU5d3lPRUUxUk4zZ05adkJuMWhsa29IbmlmVFE3RHpm?=
 =?utf-8?B?TnZOK0xUeFBwWkpKRTN3Tkk1bXd0UWlBaS9RaFNHbmRvcUg1UlFqMU02a2J1?=
 =?utf-8?B?WnZoKzRqWXExN0hDbld6Y2JqRU4rZk9XOUlqTWZoN3JmZFY5aDQyU3lQVHNr?=
 =?utf-8?B?TVJQQm1ZbGFkNXdSYjZ5UUlUMEwwajBvNjJnZ1BwdllVdTZ5Z1ZUdXdPT0Ey?=
 =?utf-8?B?aGJ0bFhnZGdkVmFnWVJldWRNcWZ2cFNEY2VrQ3h1Q2YxVllPN3ZUVHZ4c2FX?=
 =?utf-8?B?eDdWUjFUTDdIVEZtZUVhMFVtbUZUMVZ0Vi9DNHgzL1FVeWdOdm5HZzhzMHNx?=
 =?utf-8?B?NHQwNytpYWUrakpTVkRZM1prRjlvUHU2ZjRycHEvL0k1b04zb3ptRTBJZTR2?=
 =?utf-8?B?TnArbFlGeEpubjRweGF1eG5JWmlqQWdIZm1XRFhweHFxWnF5bHB2UHdSdDVY?=
 =?utf-8?B?VEtwdm1GT1J6RzZDSWdOTTlXaWQ3WXI5YUhta3poQ1c2VDltTGRlNGFYSDNQ?=
 =?utf-8?B?N05oRU9DcmlQMDNzckNLdGFoQ0dBV1cxZ3Q1akcvVXNGcVJFRHFicEcwSG1I?=
 =?utf-8?B?MUh1UUpFQmxRVTVDZC9VdUE0RHRaQkRwcVpLUExSYmFYVzJRNnFsVVBtS2JH?=
 =?utf-8?B?ZGJJMWhEN250cHZGeDkzWFBadkVNa0pzL0ZkQmJ6dU1qYUNLS0EwamtVUnk2?=
 =?utf-8?B?dmsxNWZiaXYvbThicy9iZ3VtditZMjhzenBMbk5KOTVobDZ6OGRLc1Z5cTgx?=
 =?utf-8?B?WDE1aWUxM0hudWtVdlBnL2tKa0trVGtKSDBQSUdTUjZaeUxndWlVRktEa0Vl?=
 =?utf-8?B?TXhaZFFmUmpVNDV0Sk9aR2x3THNqWEk5a2N0WldXZ1pVeGdFRUpNQ3F1ZkRw?=
 =?utf-8?B?aXQ3QVZKdkU3RW84Tmt0TGVVQ1ZwUXhnbzUvd3d0bkhaOVptM0FQZi94YUZX?=
 =?utf-8?B?ZnBNZDgwNnJoUTd4ajVzeDBib1RnWldMbDZuNGZQZGRtYWRISXRUMHM3bGFr?=
 =?utf-8?B?VGRKdkpNYmdFZ3lRaEQ1SnNuKzRlNkNYSitvcHNrNEFWUUlnVnoweDFBT3ZI?=
 =?utf-8?B?RCtDanpFZWZmWUxmdmI5L2Z5L1BpdlRQNU1MTk1vT1ZiYm5OSmxtOFI5QmpV?=
 =?utf-8?B?VkR6UEhMQWxRVUMrK0VSTGY4cUJ2TUhwS3R6SDg4UUtmL3phZWRYaWl4REZu?=
 =?utf-8?B?dHVLTmdDcFRwUmRTZmQ3OVI5VmNjVTQwcmZKMHRXK0lMaURJY0gxWjRlZXdK?=
 =?utf-8?B?WWVvV0Z1NWVtbFhyRDJCVXlOMzRBWHROWVE5TjR3bk9TdGkvWUZnUHNBb1Fq?=
 =?utf-8?B?ekRMblZXc0t4eHFwUFQyT3dHMUhVQ2pWYWdjK0RmR2dwRTloV2lOL2R4enhG?=
 =?utf-8?B?TE4yWDFHVW5qMW1qbGczVzVaZUZwRTI4VUQzanlVditlNjlHUFJEaUxGZGQz?=
 =?utf-8?B?Ui9VbzJLYmtDazZBUkNCNE5BLzJwK1RRYkhVVjNRMXBmQkE4eUVnY1ljdGo4?=
 =?utf-8?B?Y3B5MGtSeEJwUU9jY3h4dHlMbEUyalpRdGZ2K3VoaDZaN2JoQnlROURGdnVW?=
 =?utf-8?B?THdGSmxUT1JOY281YS9KTHFkd0gvcGxQQktlYUYyb054RjhWdng1aFU1VDAz?=
 =?utf-8?Q?IHMNDIDi40fEgFdmSaBI9IBXm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 346f656d-f32c-4e72-352e-08dcacc8a05b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 16:41:26.5905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mw5/l9IcXduQ0xUuQus3TgnFWi7MkH2Pw190df1HCADvBHCotfwMI6PZ5HWmHMIO9RnGB+juh/1cpZO3JCnf6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7964
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


On 7/25/2024 6:27 PM, Matthew Brost wrote:
> On Thu, Jul 25, 2024 at 05:48:34PM +0200, Michal Wajdeczko wrote:
>>
>> On 25.07.2024 17:05, Nirmoy Das wrote:
>>> Introduces a set of APIs for tracking and managing events.
>>> This currently only supports counters.
>>>
>>> This can be conditionally enabled with the CONFIG_DRM_XE_STATS
>>> config option.
>>>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/Kconfig.debug |  11 +++
>>>   drivers/gpu/drm/xe/Makefile      |   1 +
>>>   drivers/gpu/drm/xe/xe_stats.c    | 145 +++++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_stats.h    |  66 ++++++++++++++
>>>   4 files changed, 223 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/xe/xe_stats.c
>>>   create mode 100644 drivers/gpu/drm/xe/xe_stats.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
>>> index bc177368af6c..4db6d707c1af 100644
>>> --- a/drivers/gpu/drm/xe/Kconfig.debug
>>> +++ b/drivers/gpu/drm/xe/Kconfig.debug
>>> @@ -94,3 +94,14 @@ config DRM_XE_USERPTR_INVAL_INJECT
>>>   
>>>   	 Recomended for driver developers only.
>>>   	 If in doubt, say "N".
>>> +
>>> +config DRM_XE_STATS
>>> +	bool "Enable XE statistics"
>>> +	default n
>>> +	help
>>> +	  Choose this option to enable support for collecting and
>>> +	  displaying XE statistics as debugfs.
>>> +
>>> +	  Recommended for driver developers only.
>>> +
>>> +	  If in doubt, say "N".
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index 1ff9602a52f6..c5d9ec22c6bf 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -117,6 +117,7 @@ xe-y += xe_bb.o \
>>>   	xe_wopcm.o
>>>   
>>>   xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
>>> +xe-$(CONFIG_DRM_XE_STATS) += xe_stats.o
>>>   
>>>   # graphics hardware monitoring (HWMON) support
>>>   xe-$(CONFIG_HWMON) += xe_hwmon.o
>>> diff --git a/drivers/gpu/drm/xe/xe_stats.c b/drivers/gpu/drm/xe/xe_stats.c
>>> new file mode 100644
>>> index 000000000000..1b8910900fd3
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_stats.c
>>> @@ -0,0 +1,145 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +
>>> +#include <linux/debugfs.h>
>>> +#include <linux/seq_file.h>
>>> +#include <linux/slab.h>
>>> +
>>> +#include <drm/drm_device.h>
>>> +#include <drm/drm_managed.h>
>>> +#include <drm/drm_print.h>
>>> +
>>> +#include "xe_stats.h"
>>> +
>>> +#ifdef CONFIG_DRM_XE_STATS
>>> +static struct xe_stats_entry *find_stats_entry(struct xe_stats *stats, const char *name)
>>> +{
>>> +	struct xe_stats_entry *stats_entry;
>>> +
>>> +	list_for_each_entry(stats_entry, &stats->entries, list) {
>>> +		if (strcmp(stats_entry->name, name) == 0)
>>> +			return stats_entry;
>> hmm, this seems to be very costly and likely will not scale well once we
>> would like to add more counters

Both of you came to the same conclusion :) I have enough hints now. Let 
me spin up the next

simpler version next week.


Thanks,

Nirmoy


>>
> Agree this won't scale well. See my suggestion a reply to Nirmoy. Let me
> know what you think.
>
> Matt
>
>> can't we just use CONFIG_DRM_XE_STATS to hide different stats structures
>> provide nop variants of the helpers that would update them ?
>>
>>> +	}
>>> +
>>> +	return NULL;
>>> +}
>>> +
>>> +static int stats_show(struct seq_file *m, void *v)
>>> +{
>>> +	struct xe_stats_entry *entry = m->private;
>>> +
>>> +	if (entry && !entry->enabled)
>>> +		return 0;
>>> +
>>> +	switch (entry->type) {
>>> +	case XE_STATS_TYPE_COUNTER:
>>> +		seq_printf(m, "%s: Counter value: %llu\n", entry->name,
>>> +			   atomic64_read(&entry->data.counter.value));
>>> +		break;
>>> +	default:
>>> +		break;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int stats_open(struct inode *inode, struct file *file)
>>> +{
>>> +	return single_open(file, stats_show, inode->i_private);
>>> +}
>>> +
>>> +static const struct file_operations stats_fops = {
>>> +	.owner   = THIS_MODULE,
>>> +	.open    = stats_open,
>>> +	.read    = seq_read,
>>> +	.release = single_release,
>>> +};
>>> +
>>> +struct xe_stats *xe_stats_init(struct drm_device *drm, struct dentry *parent)
>>> +{
>>> +	struct xe_stats *stats;
>>> +
>>> +	stats = drmm_kzalloc(drm, sizeof(*stats), GFP_KERNEL);
>>> +	if (!stats) {
>>> +		drm_err(drm, "Failed to allocate memory for xe_stats\n");
>>> +		return NULL;
>>> +	}
>>> +
>>> +	stats->drm = drm;
>>> +	INIT_LIST_HEAD(&stats->entries);
>>> +
>>> +	stats->debugfs_entry = debugfs_create_dir("stats", parent);
>>> +	if (!stats->debugfs_entry) {
>>> +		drm_err(drm, "Failed to create stats debugfs directory\n");
>>> +		return NULL;
>>> +	}
>>> +
>>> +	return stats;
>>> +}
>>> +
>>> +void xe_stats_add_entry(struct xe_stats *stats, const char *name, enum xe_stats_type type)
>>> +{
>>> +	struct xe_stats_entry *entry;
>>> +	struct dentry *debugfs_entry;
>>> +
>>> +	if (!stats || !name)
>>> +		return;
>>> +
>>> +	entry = drmm_kzalloc(stats->drm, sizeof(*entry), GFP_KERNEL);
>>> +	if (!entry)
>>> +		return;
>>> +
>>> +	entry->name = drmm_kstrdup(stats->drm, name, GFP_KERNEL);
>>> +	if (!entry->name)
>>> +		return;
>>> +
>>> +	entry->type = type;
>>> +	entry->enabled = true;
>>> +
>>> +	switch (type) {
>>> +	case XE_STATS_TYPE_COUNTER:
>>> +		atomic64_set(&entry->data.counter.value, 0);
>>> +		break;
>>> +	default:
>>> +		return;
>>> +	}
>>> +
>>> +	list_add(&entry->list, &stats->entries);
>>> +
>>> +	debugfs_entry = debugfs_create_file(name, 0444, stats->debugfs_entry, entry, &stats_fops);
>>> +	if (!debugfs_entry) {
>>> +		drm_err(stats->drm, "Failed to create stats debugfs file for %s\n", name);
>>> +		list_del(&entry->list);
>>> +		return;
>>> +	}
>>> +
>>> +	entry->dentry = debugfs_entry;
>>> +}
>>> +
>>> +void xe_stats_increment_counter(struct xe_stats *stats, const char *name)
>>> +{
>>> +	struct xe_stats_entry *entry;
>>> +
>>> +	if (!stats || !name)
>>> +		return;
>>> +
>>> +	entry = find_stats_entry(stats, name);
>>> +	if (entry && entry->type == XE_STATS_TYPE_COUNTER && entry->enabled)
>>> +		atomic64_inc(&entry->data.counter.value);
>>> +}
>>> +
>>> +void xe_stats_decrement_counter(struct xe_stats *stats, const char *name)
>>> +{
>>> +	struct xe_stats_entry *entry;
>>> +
>>> +	if (!stats || !name)
>>> +		return;
>>> +
>>> +	entry = find_stats_entry(stats, name);
>>> +	if (entry && entry->type == XE_STATS_TYPE_COUNTER && entry->enabled)
>>> +		atomic64_dec(&entry->data.counter.value);
>>> +}
>>> +
>>> +#endif
>>> diff --git a/drivers/gpu/drm/xe/xe_stats.h b/drivers/gpu/drm/xe/xe_stats.h
>>> new file mode 100644
>>> index 000000000000..dba79ae28714
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_stats.h
>>> @@ -0,0 +1,66 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +#ifndef _XE_STATS_H_
>>> +#define _XE_STATS_H_
>>> +
>>> +#include <linux/atomic.h>
>>> +#include <linux/debugfs.h>
>>> +#include <linux/list.h>
>>> +#include <linux/spinlock.h>
>>> +#include <linux/types.h>
>>> +
>>> +#include <drm/drm_print.h>
>>> +
>>> +struct drm_device;
>>> +
>>> +enum xe_stats_type {
>>> +	XE_STATS_TYPE_COUNTER,
>>> +};
>>> +
>>> +#ifdef CONFIG_DRM_XE_STATS
>>> +struct xe_stats_entry {
>>> +	const char *name;
>>> +	enum xe_stats_type type;
>>> +	bool enabled;
>>> +	union {
>>> +		struct {
>>> +			atomic64_t value;
>>> +		} counter;
>>> +	} data;
>>> +	struct list_head list;
>>> +	struct dentry *dentry;
>>> +};
>>> +
>>> +struct xe_stats {
>>> +	struct dentry *debugfs_entry;
>>> +	struct list_head entries;
>>> +	struct drm_device *drm;
>>> +};
>>> +
>>> +struct xe_stats *xe_stats_init(struct drm_device *drm, struct dentry *parent);
>>> +void xe_stats_add_entry(struct xe_stats *stats, const char *name, enum xe_stats_type type);
>>> +void xe_stats_increment_counter(struct xe_stats *c, const char *name);
>>> +void xe_stats_decrement_counter(struct xe_stats *stats, const char *name);
>>> +
>>> +#else /* CONFIG_DRM_XE_STATS not defined */
>>> +struct xe_stats;
>>> +
>>> +static inline struct xe_stats *
>>> +xe_stats_init(struct drm_device *drm, struct dentry *parent)
>>> +{
>>> +	return NULL;
>>> +}
>>> +
>>> +static inline void
>>> +xe_stats_add_entry(struct xe_stats *stats, const char *name, enum xe_stats_type type) { }
>>> +static inline void
>>> +xe_stats_increment_counter(struct xe_stats *stats, const char *name) { }
>>> +static inline void
>>> +xe_stats_decrement_counter(struct xe_stats *stats, const char *name) { }
>>> +
>>> +#endif /* CONFIG_DRM_XE_STATS */
>>> +
>>> +#endif /* _XE_STATS_H_ */
>>> +
