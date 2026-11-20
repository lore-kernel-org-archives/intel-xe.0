Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC7D606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 12:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N9tlHRBy;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=WNMvYsSB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E788B10E093;
	Fri, 20 Nov 2026 12:19:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B5310E093
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 12:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795177134; x=1826713134;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=tpFCYxwTdXO2fbJmBCcrLx0kjzj5kTAEYO52O2aiz04=;
 b=N9tlHRByxKB87DB6PzJW6BjO4jRYVhuJXpaN5xA2WBpPZTmBo5b33Qos
 M5tHFLea8Jf1woawhPB+sAW16yVhu+bw8LR235AcW2BpQZCOaEWBijbCP
 T5Oe+qCAwdrn5hKOat2bk1Dodh9tcWOkJA0l//z43RCmvXzqnpJy3xYjo
 l8FGVKEcjJAPk6oXZqdOUgIt6t6EsZPPCbKeO3/Iokxr5XIVBpogpKF7U
 v1auKtKhQPlJYH5Q2EK5a1KmgxO0zabx/KxYtxEDdPDL2ER8KnrtibvKV
 o9oh7gYNR6iZSWGEjUQ38fUgHl25XVHw1RcBkGBlVYNAxJyaSyPEedQIS A==;
X-CSE-ConnectionGUID: fUJoWfqJTwqOBudbQyEBRw==
X-CSE-MsgGUID: jReBmL6tSxOhPuTUCTjDlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4134265"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208,217";a="4134265"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 04:18:54 -0800
X-CSE-ConnectionGUID: lwhDI58ASiqnH5XW4nDfXw==
X-CSE-MsgGUID: b5Y+iFckS+Stch6BgbVg/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208,217";a="12529729"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 04:18:53 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 04:18:53 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 04:18:53 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 04:18:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpkTQm609EHy55eZ5NtruAGJk2hmUiZphOmzxH2WspLHR2DgT3GPGA2MUvFIxoRyWDL93QKKsyaZT4Dh3Js8o21vkFo7DmINYe/sMk9T+bk9qEBYGE/I2UxY62g6H7jlNDb5+Fzi9V6gDAOrmPGaforkYkAF44HI4ynY6HtiZU9dUihyjfNWGiED9Y1QvviCNc8wx2shAD/7Efm010Yk8dmVzp/vtLoyyF2LnhFB5ysPy4xq54sx39smVfPpyKwBuVl0abMpC2HzE5VGxn/N3GpFZ5M+Kq4GP47hOeqpt68k3JaEaHuY2HmPHLxhCROlqAND+ZGIOEXwh/XczE3hSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSwNl5nAIYmpAOIWJGh9ka4j/jD6UPrmE/rfbF8FRDs=;
 b=s1qGmonVP5/drKquFGOp72KBB77+2cKKGHsmjbY8vL8+uGJLvUWzrWoWOdJS1I5dgENICJB0WvD/bDKFIj76PkDW+locEPXFzdusSqgE5h7hAjlOHaOPOa3+Rrs+VGnrQXUKGVYhaiZc5UwKw5NCDr9iBQzgGK4ehrH/i7QUo1jEGNDysRFbYf3X6+rY2/aLMZVhYuGfZci1wYXoDvSnElMOpROyIgSp/khER7/wy4U5UZy4MwGwTs0VkGNQtFdAaAzYAKIlEGPzqOY6eaLp5S4N9KF+WZH9/YCtmtZ5jRHc71qTKsrkT1FY8F4NJbuhzk+3vIfWoB6D8Ui/RTH8LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSwNl5nAIYmpAOIWJGh9ka4j/jD6UPrmE/rfbF8FRDs=;
 b=WNMvYsSB/16ejDzqtJzt73io05LQ9WYgVOgOAwKz6BIoljJaEH456h4NbRQp8HuXOPqrBzQdpwuETtAuNLdXJRcnb9IPcGJfEoBcapgvWBsGVokhiqsEHecReBxw5ZJEhTRZJzbx8tV9/W7Fpp6PUmFuwgtIWca+M7AQrLjqaVU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6480.namprd11.prod.outlook.com (2603:10b6:8:8d::17) by
 SJ2PR11MB8567.namprd11.prod.outlook.com (2603:10b6:a03:568::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 12:18:44 +0000
Received: from DM4PR11MB6480.namprd11.prod.outlook.com
 ([fe80::4948:5d00:7b8a:775d]) by DM4PR11MB6480.namprd11.prod.outlook.com
 ([fe80::4948:5d00:7b8a:775d%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 12:18:44 +0000
Content-Type: multipart/alternative;
 boundary="------------iysE3NtoVb4stPrXmdtw8YSM"
Message-ID: <8a0a4589-37af-4397-9be6-ceb8805fbb49@intel.com>
Date: Fri, 20 Nov 2026 17:48:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe: Use MI_SEMAPHORE_WAIT_64 for fake watchdog
 where supported
To: <tilak.tirumalesh.tangudu@intel.com>, <piotr.piorkowski@intel.com>,
 <jesus.narvaez@intel.com>, <daniele.ceraolospurio@intel.com>,
 <stuart.summers@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20261120120231.748267-1-tilak.tirumalesh.tangudu@intel.com>
 <20261120120231.748267-4-tilak.tirumalesh.tangudu@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20261120120231.748267-4-tilak.tirumalesh.tangudu@intel.com>
X-ClientProxiedBy: MA5P287CA0354.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::8) To DM4PR11MB6480.namprd11.prod.outlook.com
 (2603:10b6:8:8d::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6480:EE_|SJ2PR11MB8567:EE_
X-MS-Office365-Filtering-Correlation-Id: 49183c9b-50d2-4a4c-20bf-08df47006b6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261026121527099003|261026140227099003|261022113327099003|261022105027099003|261022075727099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|11063799006|4143699003|56012099006|10067099003|261009223027099003|22082099003|18002099003|6133799003|8096899003|3023799007;
X-Microsoft-Antispam-Message-Info: CzGF3IVUOPXckMg8xV4IRIprQxj/xF1VwzDK9BWS1e65RuaMLlK7fVePaRw1XgWkCcUKa9zrqQo1bYaC+Xj4onJPjsXHILxRgBSmPUCooC1Sb9DTndY0wEadrrEChFOH8JrUKTD34FsCigQ9B5jKx3dInInwTKoBK0fSBIZTe+WcqffI14srGImHgQ3Unl3JajNNTftmvokr0Iadn0dW4QubbgN2qTY9paf9Q/68+iD55IbVwCDAkqDZfVtUJemgOc+MEcj5bYzP17RqyCDTeb3EATXMfG57TRz1JtaxgJgZXH33luqxEuOPRlzCDpZzpX64qF2WoQGd+NWCVJvmuea7ri4TUGYqzkG6YvSRSiSGV2G4ySjY0lmzdoPuZxbUIzshNgfQs1GNtfIhSiQvgBLqB/maHXNDjNyl0qbdl9zIk1dEyBcnH9IVuK4ZwpytV7wnp3n7GETEFNUxR4zpXckvuRTSSPWjtm/ft4P5JdSW5xFV3IEfDm9otkwMC5cvkrU9iMOvk8tp3XyGKRAuAxRv097oZJUlAU1mjGM2QyV/40HkyjblXn0a3duMe4C8NOgPnvObEI5+73azlYBQ53vjvyt4MDGAUkKBZkOmznvz0JRgbP/gN8MiEPi2KvJkgA+2+ZxN4/nmPJ0ZBOsBJ5Fen9h/CdmBKzvgyoUFERU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6480.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261026121527099003)(261026140227099003)(261022113327099003)(261022105027099003)(261022075727099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(11063799006)(4143699003)(56012099006)(10067099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(8096899003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3ZkVUhJbzRjV3NiT1YxbGx0UFowZUJ3a2tQc3JEbjB3RlVQbk15YVo2Z0pl?=
 =?utf-8?B?R2VpZk8rV1ErMTdjcXl1RExJWi81YU9XTzV0ck13WkYwWmhJTDhjY0YwQXh1?=
 =?utf-8?B?NExHRkVYVk15cFJhY1ZqUkMwZnRXUXNWVUtlT3BLQ1lHSSt1aVRvdWJPZ3k5?=
 =?utf-8?B?cnU2MTlzN2U4cUhzU2dBU3h3QzUxUFAxWmJxWWtjNC81OUk3aXEzdDQzWkh0?=
 =?utf-8?B?MitSMi8vazFKYUlIMVRrM2I1a1Fxdk5MdjgxWHBKZCsvbmo2RXZuNWNOcllZ?=
 =?utf-8?B?K21ua3lKM1JOQldqTzB5cG5ENEQ3eS9oZC9HZ1lKbmVKL09acEVMTjRnRXVv?=
 =?utf-8?B?ZSt1c0hmZGFrNU92Ykw5c0JkenR4MVRUQlAzWWdmREUzdnZBWFJHQmhmeWhp?=
 =?utf-8?B?ZlgwWlJXN3ducFJ1em5lNzVnTlQ3YndITWVzcXcyazV0Mk1GL1ZBU2pVaHlW?=
 =?utf-8?B?ZHJ4bS95c2thZTB0N1U1MkJ0NFQ3ZGxUOFB4MlBNNWVYR0JUQ0piSG55c3ps?=
 =?utf-8?B?NVhVV0tsQzdIVk1qRzFBMU9wbzE0ZzlQeC9QeVNnMUs4MUh2dkNPVVhyNkJO?=
 =?utf-8?B?dXJrdWl6eFF3M2JMdU10Mm1pSjJDazVrYlhMS1pvMEV3NHlxWG5DOGtCNlFL?=
 =?utf-8?B?NTBqQVhyS2M2STN4WTdwS3REQVNqb1ZJaXlXaktXS1lkUThUZXMzQ3BMZldY?=
 =?utf-8?B?UkRjZWFnVDV6V21NVGZ1T20zU2JhMCt4RVc4dFl2Z1Fnb3ZXZkdGY2tURm5y?=
 =?utf-8?B?cWUyQXFuQ1dOQmY0Tk96VUhKbS9ucGJBQk9rWWM2Q09RUVg1YlpOKzJ3WTBV?=
 =?utf-8?B?b2lMbGxLbFBTVEdqSm9admJZMTNBU0xmUkhSUU1UcXMvUXRnNjN6bVdraFZz?=
 =?utf-8?B?VVV4dHRwWXFFb2VUcXhsc3hlQ0dIN2lLUzI0bWg4Q0JTQnpzcDg5TWRDV05j?=
 =?utf-8?B?VEU5S1dwejNuSVBkd1Zwb0JiR1FyaWh0blhUNmtDQXRodUZJbFhMRzQvREly?=
 =?utf-8?B?bjBLQmNEc01ydi9Nd2VPemd5b3VVTllsUzdaYzQzNDNtR0Y2cFMwZjQzMjZ4?=
 =?utf-8?B?MlA1ZnpKdHo4b0ZkaVZ3MngwYk5ubTBPaXR6U2tTa3ExUy9iZERCbThyRmE2?=
 =?utf-8?B?eTlkc0tZOWVnOE1hVEU0ZFowT2dkd2NkSkxwTUswUUlxS3BjeExVZ0NGM0Js?=
 =?utf-8?B?Q25ZZUpQS0pjT1U1QmcvRXk4emFHN3V3RlltQ0I5UXROMmpiZGUweEVRVFZv?=
 =?utf-8?B?c1hWTWl3RDJ0UlVrZkR2dTExTlNwYUdNSFZxb3kvdnZGMDRvakZFaGxqdExk?=
 =?utf-8?B?TFA2V2JubVRNbEVWdnBHT2hTZU15V3JodGhGRCtDak5ITWJOWERQWFhxU2RD?=
 =?utf-8?B?bi9mUC8xa3hLcThjMGJqTG1DQTNjZXBsNTBwM1ZnQnV0NVZuQzJGSVBMdW8v?=
 =?utf-8?B?OHBsVG1hU1ljeVlQQ1k5VlBjUFFKVHkvTzRJN1g5YnpLZ2FjdGk5YTRVRkZS?=
 =?utf-8?B?NHo0elIySWdoRkdKYWhsam15bjVJQzRJWXlsSEwwN1ErZFFiSC8yZXJTU2Fi?=
 =?utf-8?B?dWFXcFdrdUoyVFpRVG55MkF0dy82WVhQUi9ia05UQ01mU1pCTjNMMkVaL2li?=
 =?utf-8?B?MGtRakJHb3NMRmN0SElBa1FKdTBnNnQ5L0ExQXNHQUVycWl6Z0dNS1loZVU5?=
 =?utf-8?B?Y1RVYU0vWHR6SWpQSVdwcXFCenh1bTB3L1laUmRXVGlySDZLTGtWOTZwNzZ1?=
 =?utf-8?B?eURUQkwvYnRPQUZIS3NRaGk1emxhWHo4UDB2NXZLdGF3MzFMN1NUVThFSVBT?=
 =?utf-8?B?eDNEcmNxTHdESENPU1Z4MlhERGR1MEJRZlpCb2RZQWMyRnkxNzc2VUdIY3VD?=
 =?utf-8?B?bnlCVkdlZDBrYi9rVWJNdHZYbjJnNlRvYkRpNW9YVVhXT3F4cU5WdCs5L2Iv?=
 =?utf-8?B?bFVwbWFrR01OdUluUUpWT2hYK1dianQyR1c5bjlET0p4N1dkaXFWd213bUtp?=
 =?utf-8?B?WjRFOFVsNHhwSU1CVERFcW9uV2RLV0FVZExyK0kxbmJCSGM4OGlSNGlsZk9Q?=
 =?utf-8?B?ZWM5V1Ird3ZEbFB3RXZrSDZCVEQ1bE5QY2pVdDBPeFA1c0hoRlZzL05WNGxD?=
 =?utf-8?B?M0x5R2NjNkZHVGwreE85VVNkYlZHWmNuVkJrcnRjaEtUNnU4U0oyeFMxL3Ry?=
 =?utf-8?B?cHBuYmh6YXY5OVl1aU5aUFQyMWlOYmsvbk1nVExKbTQ4TTFNdE5PQWZvcjgy?=
 =?utf-8?B?YnVBQjJ5VDNZV2UwV0p5TVhtMWtMZ2JaaThGS1BLOXlKaWh2RDNNdmhSUTVG?=
 =?utf-8?B?TzlFRlAyMlRRclhWa0UrbVBzQjNPM3ZBWWt0UUVieTdBeEF2bFdjR1JtMjVT?=
 =?utf-8?Q?zDVFVetGm+jg07dk=3D?=
X-Exchange-RoutingPolicyChecked: UbohTEtQI43ARjpKbitaOTwDf5kTw4W6SC6GNj4ResBelG0q29wydka7coRYFcu4hyBibpdj/5YdVvpS5Js2HqFX8DHTUC19rrZkOZXS3UfOi4NQ+U2GwVZd9hXYFAZZAAtjRjSOXkFGqVneBOxSYUwy9mnUxC1d12vg67dprbxechp0mA6zMyYpxdpmWSf3DJZQ+V0FIKP8FOK32MvOZhseZpqHY7WUA8KUGWvf/pH+tNgLaaJS0YD3tsVPMLAMbcf32IUqVMq9ynR2uD7+JMpdkyB9r0Sl4FkembknYRBdjSJsF3g/kOZ81kd57Ui4heltOVxikElUnQcS96s3lg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 49183c9b-50d2-4a4c-20bf-08df47006b6e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 12:18:44.2067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xs21v+Y9qclDnRJbfsnqt8hXqAalzMrUdlAI+rldZGKiaddNT8ihHbFk5wI+dm74oE1MOUAblZ/ajCXWSO/iLl1d6dpHhIrcLNH1nYSyLvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8567
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------iysE3NtoVb4stPrXmdtw8YSM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 20-Nov-26 5:32 PM, tilak.tirumalesh.tangudu@intel.com wrote:
> From: Tangudu Tilak Tirumalesh<tilak.tirumalesh.tangudu@intel.com>
>
> Use the MI_SEMAPHORE_WAIT_64 instruction in emit_fake_watchdog() on
> platforms whose GT supports it, per gt->info.has_sem64. Platforms
> without support keep using the existing 32-bit MI_SEMAPHORE_WAIT path.
>
> v2: Drop the WA comment, document the zero upper SDD dword (Satya)
>
> Assisted-by: LLM
> Signed-off-by: Tangudu Tilak Tirumalesh<tilak.tirumalesh.tangudu@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ring_ops.c | 23 ++++++++++++++++++-----
>   1 file changed, 18 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index ad63181938e3..e64f61f1f9a7 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -316,11 +316,24 @@ static int emit_fake_watchdog(struct xe_lrc *lrc, u32 *dw, int i)
>   	dw[i++] = PR_CTR_CTRL(0).addr;
>   	dw[i++] = CTR_LOGIC_OP(START);
>   
> -	dw[i++] = MI_SEMAPHORE_WAIT | MI_SEMW_GGTT | MI_SEMW_POLL | MI_SEMW_COMPARE(SAD_EQ_SDD);
> -	dw[i++] = 0xdead; /* this should never be seen */
> -	dw[i++] = lower_32_bits(xe_lrc_ggtt_addr(lrc));
> -	dw[i++] = upper_32_bits(xe_lrc_ggtt_addr(lrc));
> -	dw[i++] = 0; /* unused token */
> +	if (lrc->gt->info.has_sem64) {
> +		dw[i++] = MI_SEMAPHORE_WAIT_64 | MI_SEMW_GGTT | MI_SEMW64_32BIT_COMPARE |
> +			  MI_SEMW64_INHIBIT_CTX_SWITCH | MI_SEMW64_INTERRUPT |
> +			  MI_SEMW_COMPARE(SAD_EQ_SDD);
> +		dw[i++] = 0xdead; /* this should never be seen */
> +		dw[i++] = 0; /* upper SDD dword, ignored with 32b compare */
> +		dw[i++] = lower_32_bits(xe_lrc_ggtt_addr(lrc));
> +		dw[i++] = upper_32_bits(xe_lrc_ggtt_addr(lrc));
> +		dw[i++] = 0; /* token, must be 0 */
> +		dw[i++] = 0;
> +	} else {
> +		dw[i++] = MI_SEMAPHORE_WAIT | MI_SEMW_GGTT
> +			  | MI_SEMW_POLL | MI_SEMW_COMPARE(SAD_EQ_SDD);
> +		dw[i++] = 0xdead; /* this should never be seen */
> +		dw[i++] = lower_32_bits(xe_lrc_ggtt_addr(lrc));
> +		dw[i++] = upper_32_bits(xe_lrc_ggtt_addr(lrc));
> +		dw[i++] = 0; /* unused token */
> +	}
>   
>   	dw[i++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_LRM_CS_MMIO;
>   	dw[i++] = PR_CTR_CTRL(0).addr;

LGTM.

Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

--------------iysE3NtoVb4stPrXmdtw8YSM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 20-Nov-26 5:32 PM,
      <a class="moz-txt-link-abbreviated" href="mailto:tilak.tirumalesh.tangudu@intel.com">tilak.tirumalesh.tangudu@intel.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261120120231.748267-4-tilak.tirumalesh.tangudu@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Tangudu Tilak Tirumalesh <a class="moz-txt-link-rfc2396E" href="mailto:tilak.tirumalesh.tangudu@intel.com">&lt;tilak.tirumalesh.tangudu@intel.com&gt;</a>

Use the MI_SEMAPHORE_WAIT_64 instruction in emit_fake_watchdog() on
platforms whose GT supports it, per gt-&gt;info.has_sem64. Platforms
without support keep using the existing 32-bit MI_SEMAPHORE_WAIT path.

v2: Drop the WA comment, document the zero upper SDD dword (Satya)

Assisted-by: LLM
Signed-off-by: Tangudu Tilak Tirumalesh <a class="moz-txt-link-rfc2396E" href="mailto:tilak.tirumalesh.tangudu@intel.com">&lt;tilak.tirumalesh.tangudu@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index ad63181938e3..e64f61f1f9a7 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -316,11 +316,24 @@ static int emit_fake_watchdog(struct xe_lrc *lrc, u32 *dw, int i)
 	dw[i++] = PR_CTR_CTRL(0).addr;
 	dw[i++] = CTR_LOGIC_OP(START);
 
-	dw[i++] = MI_SEMAPHORE_WAIT | MI_SEMW_GGTT | MI_SEMW_POLL | MI_SEMW_COMPARE(SAD_EQ_SDD);
-	dw[i++] = 0xdead; /* this should never be seen */
-	dw[i++] = lower_32_bits(xe_lrc_ggtt_addr(lrc));
-	dw[i++] = upper_32_bits(xe_lrc_ggtt_addr(lrc));
-	dw[i++] = 0; /* unused token */
+	if (lrc-&gt;gt-&gt;info.has_sem64) {
+		dw[i++] = MI_SEMAPHORE_WAIT_64 | MI_SEMW_GGTT | MI_SEMW64_32BIT_COMPARE |
+			  MI_SEMW64_INHIBIT_CTX_SWITCH | MI_SEMW64_INTERRUPT |
+			  MI_SEMW_COMPARE(SAD_EQ_SDD);
+		dw[i++] = 0xdead; /* this should never be seen */
+		dw[i++] = 0; /* upper SDD dword, ignored with 32b compare */
+		dw[i++] = lower_32_bits(xe_lrc_ggtt_addr(lrc));
+		dw[i++] = upper_32_bits(xe_lrc_ggtt_addr(lrc));
+		dw[i++] = 0; /* token, must be 0 */
+		dw[i++] = 0;
+	} else {
+		dw[i++] = MI_SEMAPHORE_WAIT | MI_SEMW_GGTT
+			  | MI_SEMW_POLL | MI_SEMW_COMPARE(SAD_EQ_SDD);
+		dw[i++] = 0xdead; /* this should never be seen */
+		dw[i++] = lower_32_bits(xe_lrc_ggtt_addr(lrc));
+		dw[i++] = upper_32_bits(xe_lrc_ggtt_addr(lrc));
+		dw[i++] = 0; /* unused token */
+	}
 
 	dw[i++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_LRM_CS_MMIO;
 	dw[i++] = PR_CTR_CTRL(0).addr;</pre>
    </blockquote>
    <p>LGTM.</p>
    <p><span style="font-family:Menlo">Reviewed-by: </span><span style="font-family:Aptos">Satyanarayana
        K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:20261120120231.748267-4-tilak.tirumalesh.tangudu@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------iysE3NtoVb4stPrXmdtw8YSM--
