Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405F6E74AC3
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 18:22:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52F310EAFA;
	Tue,  3 Dec 2024 18:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ls/nslLk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5572610EAFA
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Dec 2024 18:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733250128; x=1764786128;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JVb85dBxsyrQB4WJ7cR/tM0BCivBbtz+WWVxf5kWfDQ=;
 b=ls/nslLk5JgAkwiZmVYlQunHDBfScgSp78xM2xhomVHPUkkblUJYn00U
 EfobCfAuXfJd3CciczOB1f2NmABxItHsI1PRhGTFbTDiXmnJehbwO8Qjh
 zKnXeMXdg7e/ZzJcsE/ea7zAlozaT2aqWSFqL2u4eCavij0KXHbCdEYrh
 dhS/FAP9je3DtRvfscSl8VzQGQISjLGgSoZY8/fH+/G4Sf8Xf6O5+jyIj
 LASMWJriSHSFJAQ8c3COrw7ZGf+YowomKpmsU0QiPZ6YXvkuvYNwVUQ+O
 FXY4SzRMTlvXhQX7nUgjBKlpP2bGUIxaHHn7x+srhXQ4RX2ZAwSZwb8rA g==;
X-CSE-ConnectionGUID: qS0IehtzSjyAiDI1eG57DQ==
X-CSE-MsgGUID: vX7SWgeBTkuByBK+AjalpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33614899"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="33614899"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 10:22:08 -0800
X-CSE-ConnectionGUID: KQ3J7fSDRHaylfZFzO1GAw==
X-CSE-MsgGUID: j1BLysmhSTO6yEZgu8M3zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="130969253"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Dec 2024 10:22:08 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 10:22:07 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 10:22:07 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 10:22:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2AvyRqzYC5GzNFp2TYEGNrhWhTlVHpRDwgpUtlauGcercMdhortyjBAwFtUuo/XBSdhhKGx3CnZDVohxRSt2JhfrjK97aLdShktV7hLHPFzpfvG9YhYzNiK859sWDroyGEWWdgIcCOx/NZQ+YmLt3s77BSqHm8VwPal8/Q2ebPA7N96p2DBo77DFB0mMVO/vSEk9Ajja5aBlyriwE1YAwOGyurv7pb/tHGTHs83VkyQmXEVzxiAQLzaoIKE1x6V0sdl3M6s2VicKIBWYUs+zpmboNhEDDOFwAzNSLZa2aImM0/SS8hr8cGepFCR6n5lPu+iMdEeV3sKjwNzTmghWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YeO9IzkU5zZcv7Y96ev44DM3zLDbZbCNXpxAguYgxOA=;
 b=h1OZ9+9z22bEH5WVBpltG7gbXooqTxV7gq47dLN6UkUacJjvJuTcYgydObuGvge81fhG9unZMWww+Nqsr8eiYh28FQRHGD/c2EZC4ZyAqbDknRce3rQjZiNHUwZAQ1YIa1QP5uvC3OSLSgV5oUz0coxd6If2VyLH6iU/L3hzdtwYnVoAU9ljbwLyzdgLAF2HNfLGz3pQHOLhbH/o0Qcwql7f/nm2wXdpLCPyHoA5+9MLDaZi0FQlJA/s7jB4b1NTK8H2RrPBWcI888GYAlH3E+0FvkLyxjssK4Mxsvewz9R9tZX2k0ORbw5SR5X3fUYeDyBTyaQy9sVVYxKNs8vUqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by CH0PR11MB8086.namprd11.prod.outlook.com (2603:10b6:610:190::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 18:22:03 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%6]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 18:22:03 +0000
Message-ID: <e43c35ba-33e3-43d8-9540-e3c4e283dd2c@intel.com>
Date: Tue, 3 Dec 2024 19:21:58 +0100
User-Agent: Mozilla Thunderbird
From: "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH v3 3/3] drm/xe/vf: Fixup CTB send buffer messages after
 migration
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20241123031333.3435414-1-tomasz.lis@intel.com>
 <20241123031333.3435414-4-tomasz.lis@intel.com>
 <fbbf6b81-d54c-4a2e-8cb6-94ccb2d3af1e@intel.com>
Content-Language: en-US
In-Reply-To: <fbbf6b81-d54c-4a2e-8cb6-94ccb2d3af1e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::7) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|CH0PR11MB8086:EE_
X-MS-Office365-Filtering-Correlation-Id: efe6a8a2-53a2-4db2-0f80-08dd13c762c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1NhSDEzbU5CUGVSZkZKeGtYNFZzK2N5T3pLUmUzeWFIclRqa0M1VEdsMmlz?=
 =?utf-8?B?bGlUT3M0SVhWenJQRDJlQU8zZktLa29iUzcxc0Y1STRVbHp4TG9ETU1JT1BQ?=
 =?utf-8?B?VDNPdmdNU1NheW5CVUlYeTQ2cUxDSFVRTTFCS3pUV0JRVlZWZVp6WWFoZnBi?=
 =?utf-8?B?M3BLT3V0ZHZTVEFiL05VM1pDUTRMbkRmNmZYdStOMExydnd4YTZVVXY2ckxv?=
 =?utf-8?B?ZHN4V1JCOHVjVE1xSEVaQkZNWHZxZEViVytvZy95ek15L05RYmo5K3N5TUYy?=
 =?utf-8?B?b2lmQStTejFXL3FpV2dmYXhUM2lKN3pKS0FVeGpmUXNqSHVlMkRZQnN1VmVy?=
 =?utf-8?B?T0NUaUdmNm9uUnQzamNsRjVwUDVtdWRzc1hjcXpLRU81cVhlNDhBRW9xT1l0?=
 =?utf-8?B?M3lOZ0lkOGhyNkIxb3hwR2NRUFVxbC84VnRLcDZEcXJIaHFpM1pKdk16WGFG?=
 =?utf-8?B?VXBDay9QSFMyUzB1Tm81NDd3RkFYdFlDdlRUSlRiNWMwd2ZQbkdCdVlxZ2hP?=
 =?utf-8?B?a2JVeklyRmMxY2VpSi8xb3EwbXVBTlMzclV6elc4Njg2TTBDMm1ZQWMzS0Fh?=
 =?utf-8?B?a1ozVkJlZ2pFVkd3dHUxSkEyQWNVaU5UdHVQMXpZOVovWXllWFFJS3R6SzBQ?=
 =?utf-8?B?Nm0rdXBxVW9mODR5NGdZbzBlaVdyNWROQTFhNmxaSWhpeHcxcDFlSUFGdS9R?=
 =?utf-8?B?T3dNZWJ5YjVnVStIYXN3alZJL1prWmcybFpwb1VDdUdFUW95S0s3ZXc4V1I0?=
 =?utf-8?B?OXIzc3g5UGdFM3Vham9TdytrUHp0d0xMNlU5ZmMrOWRBZUh0VDZ0RTVLOHhj?=
 =?utf-8?B?K0d3TkFKY0UraFVRYmJYZ0Ewa2lKNmpDa1NJb3BxSGpWaUkyU2JkYlR3eCsz?=
 =?utf-8?B?cXQrL3JUVXpZTUtiNWgyMGpJSVQyMHplRGRBY0tYWkFoQUgzb2N1QlN3Mk9w?=
 =?utf-8?B?NXR5TjV6b3k2RmdCRkhOUlF0bngrdGF0R1JmZzNJaU5Cd2phS25RU3NKSkRY?=
 =?utf-8?B?MWdIL01lN1UrNUhld3dUNjQrNTBPT2MxVDhwdWVKdkRkVWxFaVJnN3VvOVhD?=
 =?utf-8?B?b28xampOWUxLeE9vMU1KMFByelQ0b3paaHRUSHV4eHl6blJhNGM2WVd1WVUv?=
 =?utf-8?B?ak5TUHlzYWdoeUlKN0pyMlFDWHRUUU9BWGpDeDVCR2EvODZnNzFWUC9BRXlO?=
 =?utf-8?B?eWtoaXVnUTJuNXIrMktLTXRsOEJSUkd4OFRJdmwxMVFYRHE5L0tmSHNjZGky?=
 =?utf-8?B?cnFYdUw3QW9KR3czRDFjWWxxZ1ZESFVFc0FZK0dsUHhIMTd1MjNHbDd6UnQ0?=
 =?utf-8?B?YUwybVFPeFkvTmI5U1E0Tm1EUlFGV09jdk92R3lsc0kwUVVhajN2enlHakt5?=
 =?utf-8?B?c2drWUplSEhmdFdPOG1UTlZyRGYrd1FaMU54am1jQmhEeDRMb3JhZzZOWkQ1?=
 =?utf-8?B?TGZuQlpablhkVFowV29UaUFJQUg2ZE9jUFdmZzJ2cUx5NWVEcFJjcHh5QkJE?=
 =?utf-8?B?Si9GSkh3VG0ybzY4eWV3VHVBSkhnNVBtalJFWXM5YVpsZW8xeUhjVW5UdlB3?=
 =?utf-8?B?YTBIeloxYmNJbXcxRFFNc3BqNWk4R2VBT0Jsa0VLYTZ2NFU5d21EVWRIT1ZR?=
 =?utf-8?B?akRqc2grdlhBN0lOS1hGb0hSVHNDMHNER01sZWtxK0lWUTBwSURoQWdJQTV6?=
 =?utf-8?B?dzJNTnRQWWY5SE1sd0pjUjg4QmhqSk56YjJNbS9YVEN0RHZTVWJXK291Y2xx?=
 =?utf-8?B?NmdYOEwxa1pnaVBnM25XQ3M5cVcyQzAxQzVSdzFjNStKSnBUKy82dzNPNWtB?=
 =?utf-8?Q?h3BOgpJRLubiMikcRu0ZfW+03sb38vBAewY6k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVJ3eVZ1YUxvTXhvdXFZQWYyMDFhZ0hXbFZWVUxQQXZkTlFtcVgrOVJ6eWM1?=
 =?utf-8?B?Q1VFcFBFbkVKM1ZnRUVjMlVGbVRZbktmT0tEbVIzVHFrNDhoZnFDeTBXQ2lw?=
 =?utf-8?B?OGdqclk1YTFBYm93Ykxhd1VKdmpjak0yVkdkakRkYmMycFBjL2o5eG9PY2xV?=
 =?utf-8?B?eGxmbE1nYk9zbStkckVxdTFadWM4cmgraVMxeUFOZmVSMCtLc1kwbDZUa2dC?=
 =?utf-8?B?bjg1aWhTeEFVNXRJa1Q5dE5Ic0xTTGtlWVJ3SkR4dXRUa3lNd25FcDVJUTUz?=
 =?utf-8?B?b3g4WXVQaFNKdkRNRHptUDUwYUl3ckM2L2E1ZHY3ejhFcW9wbDh4dm1jclJ6?=
 =?utf-8?B?T2wzeGxHaUNSNU5lbUo0b2R2U2Fldk9VbEpUN1Qxd0o3R29Zb3owZTRtRVNV?=
 =?utf-8?B?NTVsQmVFbkx0clc0eUZHUDJmSzRHNDNhVmswWEI3OXBxd0tRMjhUYkJsbHpH?=
 =?utf-8?B?ZkVIdko4MU5teU5MKzhZU2pyMlNIeGw3NTBVUExaTy9mZ21EamVGbTlRdTZX?=
 =?utf-8?B?eFVtWG5lcjN4Y2tMbjFSMlVlQUdGZ1hLUFhvdkFLaUhnUGZXLzkzWEpzQ0hs?=
 =?utf-8?B?QUJpU0t3U2ZSemtoSTQvcTFYSm1vclFlc1JYV0dQc0RHSEQ5RzBSODFxUGtR?=
 =?utf-8?B?TEtWZVZGN3lsdUJkRlhUbk9IcTN3STljaHFjcWhKVE9KVU5OTE5XdHcrVGxp?=
 =?utf-8?B?ZkF6NG82aVgra2hZbVlIUXJEeXphcjNZTFhqZUtFM2w0d1owZGg0QTI2TTZQ?=
 =?utf-8?B?eTUyaFBlWCtEK0duSXVWMlFpNE1LMk9HQURXYi9leFZWUU5lenhhTis0YnlZ?=
 =?utf-8?B?Vk81ckFXOEVxWWpVQUR6US9SWWhGQ0p2YnE1YytwUDdhRFk1cnVYUnQxTDBI?=
 =?utf-8?B?Z2VnQjdHRXpRSERGckowWC9Sb2FzNW1xNTVtWVF4QUpTTHR1cTByWVZhOGlF?=
 =?utf-8?B?V1pOSEtEbGRXalo0b3RaYzdiMTNZVHBhVVRXZnAwdTJLMXQvN0lJQ1RYU3d2?=
 =?utf-8?B?aUh5ZmllMXk2aHhGWTJyblNlRG9kS05vbGlvZlhYNXZZUlV5QVB1MWNlMGI3?=
 =?utf-8?B?cC8rUUFod0pCclQxd1cveFVCMUMwaTBBNE1uYmd1RmNyNEpyaEY4VXRUU25m?=
 =?utf-8?B?emZhaGE0Z3Vra3c1R3Bqd1ZtL3B3QlRSOFhDUHFpWEJRb0JEUWpwYmpCL09o?=
 =?utf-8?B?bmdkVFY3MmYzOTQ2MzcvTXhqMndmSDdzakQ3d3pSdDFidHJaTVRWTm1IUHZM?=
 =?utf-8?B?NjUvK1JSMjYvQ0hiOU5yc0JURXJMZDJzYTdWbUp3Q0FXT0pHb1IyUjViUDY2?=
 =?utf-8?B?U0s3ZjhZSU82UU9MWFBOR2s4OGFsTXBBVEZpSEVJRFU1VS9mRXpTMXZVMU9i?=
 =?utf-8?B?cHd6eVE2cFlwUWRrdFZPZXdZUzRLUldsYm9NRG1RRlFrRCs5SDJFOCtkQkdP?=
 =?utf-8?B?a1htRE55SzZkbm1zYjFyM1BYRlFhU0kzemdSakc0eGVDNzlQdm1wanBnWTRB?=
 =?utf-8?B?N1dPYUk4TWNmekZkWDVBeHlWRWd5TWVWUWVwcGhqVmRBVkEwZ2NCOVJaZFpH?=
 =?utf-8?B?dFZKVTZXWmRIaUY4eGk1aVBzaUkybkw4aW1TNEpnSWtyaEFuNXJzMFAvWTBx?=
 =?utf-8?B?UDQxRksxaTlJQ2I2cGxkOEthMC8vMWZmZjJhV2NQRWczSmpXSkt2bmJYWWdx?=
 =?utf-8?B?SnROZ2NNQmZ4WmZRamJEc0FZTkkrMDZ6VUw1eHQ5azU1aEF3cURlZzJIU25t?=
 =?utf-8?B?dE9iNkswMTFNdlhyS1EybnJPMk5oVmc1czhDdU9QbzlLa2Nac3ZwRjBsbzVh?=
 =?utf-8?B?YW5IWXJ5NXpsS0o5SVo1amZGamkrdFByeUtDTFIvK1lrLyt6MzQ5aERiUEhB?=
 =?utf-8?B?VjZ6WXlJb05UaTgreXVjbWV6RGRYZDcvMmYwVVVDM0pPSEhtdEZERkZzalRz?=
 =?utf-8?B?b014SGVJbk43bVdJRy8wVzR0bzNFMkY2eWVVc1B4VE5pSGJxZ3dwSHMwOGlU?=
 =?utf-8?B?ZlZCSWswTzNlSTZkNVN6VmxHVFJWaEtvNSt1VXdhZU0wUzl0ZUtDTDRqWTVE?=
 =?utf-8?B?SkpTS3YxSm5GSUxXQ25UWHEzOERhejNEa3EvSW0wMzc4TDZMNHZKZHNqS1E2?=
 =?utf-8?Q?r8R4Vs33HGULa7h4uK1azo7IB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efe6a8a2-53a2-4db2-0f80-08dd13c762c1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 18:22:03.5433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjJtSVctUj6DB0VLjp/dDY687TUi5LgMM+sChIfaOaenhQUJYGnTkbzHoskua/+wYhPgt0jbRyJArjAa/6hlkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8086
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


On 28.11.2024 00:21, Michal Wajdeczko wrote:
> On 23.11.2024 04:13, Tomasz Lis wrote:
>> During post-migration recovery of a VF, it in necessary to update
> typo: it is ?
right
>> GGTT references included in messages which are going to be sent
>> to GuC. GuC will start consuming messages after VF KMD will inform
>> it about fixups being done; before that, the VF KMD is expected
>> to update any H2G messages which are already in send buffer but
>> were not consumed by GuC.
>>
>> Only a small subset of messages allowed for VFs have GGTT references
>> in them. This patch adds the functionality to parse the CTB send
>> ring buffer and shift addresses contained within.
>>
>> While fixing the CTB content, ct->lock is not taken. This means
>> the only barrier taken remains GGTT address lock - which is ok,
>> because only requests with GGTT addresses matter, but it also means
>> tail changes can happen during the CTB fixups execution (which may
>> be ignored as any new messages will not have anything to fix).
> are you sure that there will be no inflight h2g actions during fixup?
>
> 	CPU1			CPU2
>
> 	ggtt.lock()
> 	h2g.a = ggtt.a
> 	ggtt.unlock()
> 				ggtt.lock()
> 				ggtt.a += shift
> 				ctb.fixups(shift)
> 				ggtt.unlock()
> 	ctb.send(h2g)
>
While we cannot rule out completely a GuC being active during restore,

such situation is extremely unlikely and we accept it as being prone to 
failures.

We do not guarantee that we can successfully handle such situation. What

we have to guarantee is that the situation will not have bad consequences

beyond the driver wedge. So, we cannot cause deadlock. But sending invalid

request is not a problem -- again, in this extremely unlikely situation 
of GuC

being active, which could only be caused by very fast second migration just

after first migration was finalized, and at very unfortunate timing of 
millisecond

precision. It's a corner case of a corner case.


Also please note that in this comment I'm not referring to ggtt access 
lock which

we already have, but to GGTT address lock which was not even introduced yet.


>> The GGTT address locking will be introduced in a future series.
>>
>> v2: removed storing shif as that's now done in VMA nodes patch;
>>    macros to inlines; warns to asserts; log messages fixes (Michal)
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ct.c   | 148 +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_ct.h   |   2 +
>>   drivers/gpu/drm/xe/xe_sriov_vf.c |  16 ++++
>>   3 files changed, 166 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 7eb175a0b874..212a6795ec8b 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -84,6 +84,8 @@ struct g2h_fence {
>>   	bool done;
>>   };
>>   
>> +#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
>> +
>>   static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
>>   {
>>   	g2h_fence->response_buffer = response_buffer;
>> @@ -1620,6 +1622,152 @@ static void g2h_worker_func(struct work_struct *w)
>>   	receive_g2h(ct);
>>   }
>>   
>> +static inline u32 ctb_read32(struct xe_device *xe, struct iosys_map *cmds,
> drop "inline" and let compiler do the job

That keyword does not prevent any compiler from doing its job. The 
compiler still

decides whether it inlines or not, this just alters the wages used to 
make the decision.

Regardless, sure - can remove. It will get inlined either way.

>> +			     u32 head, u32 pos)
>> +{
>> +	u32 msg[1];
>> +
>> +	xe_map_memcpy_from(xe, msg, cmds, (head + pos) * sizeof(u32),
>> +			   1 * sizeof(u32));
>> +	return msg[0];
>> +}
>> +
>> +static inline void ctb_fixup64(struct xe_device *xe, struct iosys_map *cmds,
> same here
>
>> +			       u32 head, u32 pos, s64 shift)
>> +{
>> +	u32 msg[2];
>> +	u64 offset;
>> +
>> +	xe_map_memcpy_from(xe, msg, cmds, (head + pos) * sizeof(u32),
>> +			   2 * sizeof(u32));
>> +	offset = make_u64(msg[1], msg[0]);
>> +	offset += shift;
>> +	msg[0] = lower_32_bits(offset);
>> +	msg[1] = upper_32_bits(offset);
>> +	xe_map_memcpy_to(xe, cmds, (head + pos) * sizeof(u32), msg, 2 * sizeof(u32));
>> +}
>> +
>> +/*
>> + * ct_update_addresses_in_message - Shift any GGTT addresses within
>> + * a single message left within CTB from before post-migration recovery.
>> + * @ct: pointer to CT struct of the target GuC
>> + * @cmds: iomap buffer containing CT messages
>> + * @head: start of the target message within the buffer
>> + * @len: length of the target message
>> + * @size: size of the commands buffer
>> + * @shift: the address shift to be added to each GGTT reference
>> + */
>> +static void ct_update_addresses_in_message(struct xe_guc_ct *ct,
>> +					   struct iosys_map *cmds, u32 head,
>> +					   u32 len, u32 size, s64 shift)
>> +{
>> +	struct xe_device *xe = ct_to_xe(ct);
>> +	u32 action, i, n;
>> +	u32 msg[1];
>> +
>> +	xe_map_memcpy_from(xe, msg, cmds, head * sizeof(u32),
>> +			   1 * sizeof(u32));
>> +	action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]);
>> +	switch (action) {
>> +	case XE_GUC_ACTION_REGISTER_CONTEXT:
>> +	case XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC:
>> +		/* field wq_desc */
>> +		ctb_fixup64(xe, cmds, head, 5, shift);
> can we add some defines in abi/ files for these magic offsets?

The code will not by cleaner this way. But sure, will introduce some enums.

(based on current look, the abi file seem to prefer enums over defines)

>> +		/* field wq_base */
>> +		ctb_fixup64(xe, cmds, head, 7, shift);
>> +		if (action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC) {
>> +			/* field number_children */
>> +			n = ctb_read32(xe, cmds, head, 10);
>> +			/* field hwlrca and child lrcas */
>> +			for (i = 0; i < n; i++)
>> +				ctb_fixup64(xe, cmds, head, 11 + 2 * i, shift);
>> +		} else {
>> +			/* field hwlrca */
>> +			ctb_fixup64(xe, cmds, head, 10, shift);
>> +		}
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +}
>> +
>> +static int ct_update_addresses_in_buffer(struct xe_guc_ct *ct,
>> +					 struct guc_ctb *h2g,
>> +					 s64 shift, u32 *mhead, s32 avail)
>> +{
>> +	struct xe_device *xe = ct_to_xe(ct);
>> +	u32 head = *mhead;
>> +	u32 size = h2g->info.size;
>> +	u32 msg[1];
>> +	u32 len;
>> +
>> +	/* Read header */
>> +	xe_map_memcpy_from(xe, msg, &h2g->cmds, sizeof(u32) * head,
>> +			   sizeof(u32));
>> +	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>> +
>> +	if (unlikely(len > (u32)avail)) {
>> +		struct xe_gt *gt = ct_to_gt(ct);
>> +
>> +		xe_gt_err(gt, "H2G channel broken on read, avail=%d, len=%d, fixups skipped\n",
>> +			  avail, len);
>> +		return 0;
>> +	}
>> +
>> +	head = (head + 1) % size;
>> +	ct_update_addresses_in_message(ct, &h2g->cmds, head, len - 1, size, shift);
>> +	*mhead = (head + len - 1) % size;
>> +
>> +	return avail - len;
>> +}
>> +
>> +/**
>> + * xe_guc_ct_update_addresses - Fixup any pending H2G CTB messages by updating
>> + * GGTT offsets in their payloads.
>> + * @ct: pointer to CT struct of the target GuC
>> + * @ggtt_shift: shift to be added to all GGTT adresses within the CTB
> typo: addresses
>
> Return: ?
to the void with it.
>> + */
>> +int xe_guc_ct_update_addresses(struct xe_guc_ct *ct, s64 ggtt_shift)
>> +{
>> +	struct xe_guc *guc = ct_to_guc(ct);
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +	struct guc_ctb *h2g = &ct->ctbs.h2g;
>> +	u32 head = h2g->info.head;
>> +	u32 tail = READ_ONCE(h2g->info.tail);
>> +	u32 size = h2g->info.size;
>> +	s32 avail;
> should we care if CTB was disabled when the VF was migrated?

If CTBs were not registered during migration, then we shouldn't have 
received an IRQ.

If a situation happened when CTBs were not registered and we did got an 
IRQ (which means

the user must have been doing some unusual stuff within the VM), we 
should finish the

migration by reset. But that is not a part of this patch.

>> +
>> +	if (unlikely(h2g->info.broken))
>> +		return -EPIPE;
> if it was broken before migration then maybe fixup is not needed and we
> should return a success here?

The fixups for CTB are not needed, but the rest still has to be applied.

We are continuing the fixups regardless of error codes from previous 
ones, except

for the VMAs fixups for which error path was altered after previous 
round of review.

>> +
>> +	xe_gt_assert(gt, head > size);
> hmm, is this correct?
right, my mistake
>> +
>> +	if (unlikely(tail >= size)) {
>> +		xe_gt_err(gt, "H2G channel has invalid tail offset (%u >= %u)\n",
>> +			 tail, size);
> maybe just extend xe_gt_err() below with extra info instead of this
> split into two error messages that is from one error case anyway?
>
> btw, I hope that we will have a clear indication that such error was
> found during recovery (as now it looks like generic CTB error)
will merge.
>> +		goto corrupted;
>> +	}
>> +
>> +	avail = tail - head;
>> +
>> +	/* beware of buffer wrap case */
>> +	if (unlikely(avail < 0))
>> +		avail += size;
>> +	xe_gt_dbg(gt, "available %d (%u:%u:%u)\n", avail, head, tail, size);
>> +	XE_WARN_ON(avail < 0);
> use xe_gt_assert() instead
ok.
>> +
>> +	while (avail > 0)
>> +		avail = ct_update_addresses_in_buffer(ct, h2g, ggtt_shift, &head, avail);
>> +
>> +	return 0;
>> +
>> +corrupted:
>> +	xe_gt_err(gt, "Corrupted descriptor head=%u tail=%u\n",
>> +		 head, tail);
> no need to wrap (yet)
>
>> +	h2g->info.broken = true;
>> +	return -EPIPE;
>> +}
>> +
>>   static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
>>   							bool want_ctb)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>> index 82c4ae458dda..25e5ee71d853 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>> @@ -22,6 +22,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_pr
>>   void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
>>   void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
>>   
>> +int xe_guc_ct_update_addresses(struct xe_guc_ct *ct, s64 ggtt_shift);
> nit: maybe ... update_messages() or fixup_messages_with_ggtt() ?
ok, will rename.
>> +
>>   static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
>>   {
>>   	return ct->state == XE_GUC_CT_STATE_ENABLED;
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index 4ee8fc70a744..1cb8878e6fad 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -10,6 +10,7 @@
>>   #include "xe_gt.h"
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>> +#include "xe_guc_ct.h"
>>   #include "xe_pm.h"
>>   #include "xe_sriov.h"
>>   #include "xe_sriov_printk.h"
>> @@ -158,6 +159,18 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
>>   	return ret;
>>   }
>>   
>> +static void vf_post_migration_fixup_ctb(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
> since you are accessing sriov.vf fields directly, maybe worth to add
>
> 	xe_assert(xe, IS_SRIOV_VF(xe))
can do. Even though it's a static function.
>> +	for_each_gt(gt, xe, id) {
>> +		struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>> +
>> +		xe_guc_ct_update_addresses(&gt->uc.guc.ct, config->ggtt_shift);
> this function returns int, shouldn't we check for errors?
> if not then maybe make it void
ok, will void it then.
>> +	}
>> +}
>> +
>>   /*
>>    * vf_post_migration_imminent - Check if post-restore recovery is coming.
>>    * @xe: the &xe_device struct instance
>> @@ -224,6 +237,9 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   
>>   	err = vf_post_migration_fixup_ggtt_nodes(xe);
>>   	/* FIXME: add the recovery steps */
> will be more recovery steps _here_ or below ?

here. The comment is at proper place.

-Tomasz

>> +	if (err != ENODATA)
>> +		vf_post_migration_fixup_ctb(xe);
>> +
>>   	vf_post_migration_notify_resfix_done(xe);
>>   	xe_pm_runtime_put(xe);
>>   	drm_notice(&xe->drm, "migration recovery ended\n");
