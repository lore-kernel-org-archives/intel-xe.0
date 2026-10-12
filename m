Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FE3CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 05:28:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29E910E220;
	Mon, 12 Oct 2026 05:28:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6040F10E220
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 05:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791782882; x=1823318882;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3YJUvfixS87kaSDbkmX/DRd1sVi9nxtLYkejjti4mgc=;
 b=kUowR4YI27yzEKXZO2QYrDeqKKteBz0vrAb8DVUeyMvQHCwYJZOmKtsy
 uy9HPmBLeBYy6DqKmQn7l22DIk2FkCVwyXy+8T6iModzE4OfUm4WLtLsq
 ANvm4HqpBKRmD6kuHbrVyhQgsuCZbWSMN9NTTtLe6jxhqB4b+uFZ/JrEm
 0YpaXB9LOIOHM1xVAdV66t0aa4y/j1Rknf5HScU5YjenyrE+OILMjpwdU
 sLTxXpo8qt9nyexOPO9QCrijJOQkdcvXgpD9h2kTJ0yURlfXTelXTkhEQ
 ksF+Jij4xKO3Oslih6l1KDO7p2yDC5GNV9v2p0R/wKxIWzYA0SFcla/wK w==;
X-CSE-ConnectionGUID: kOzCKM7JS96bvd5KQ8YtEg==
X-CSE-MsgGUID: 0hV0JVa3REK9QZK2oXOm3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="379510"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="379510"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:28:02 -0700
X-CSE-ConnectionGUID: ximAoKaAR/WaT5TcrwKvSA==
X-CSE-MsgGUID: W6atQ7buRsmqeAcsOpvTIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="819120"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:28:02 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 11 Oct 2026 22:28:01 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 11 Oct 2026 22:28:01 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.23) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 11 Oct 2026 22:28:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xga4MY3S/FV9dJQlp27TbeUhpb8Dt/t2PTNTvSmL4oheuW29HWfmH4jGkM/ny+m1tuDkyuxc9oJhvxTW0b4sTdXgDYRmDFhDyAOyr4tbWnKf+14vZqpjfO5pD0LdA7uLDDxMnPkejVwF8x/669kJaSTRDRHAFI0N5EPZh7/Era2NmzdwVOp9tWF/16Jpg2jRsdcuqAnkO8oX8wEelKhatsv87eYKi5SZW30i+zbEq2XIqOrY9sNgrHva8ob7bwqlTM0itPVDJA+/NFw+gFzIFI4rfYBFXFiuTTEA47hjnYc3aevcwfFNF1joppMlMMgwgTU4TkzhVIFHF7qDXT+Quw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60rDzeIHDUlFFyvDcrZGIExbKGGq0c2ybagH3+TmtjA=;
 b=idYaaxNo0ezCiSWul7+kfSeIbGaXZ7nOZRKBMtTxTHafPqvSZg7bC9bm8BdlhBFMu+RSYyk8SH7SRA7fWcjl7/UjnI3vB9QsqyCLImQ/sXSialB7Oe7pIE42y5lFdpYC2gQO77DYp8bG3SQTyLuVS8aq7sWXHJYmfMtnaVLxl7+svSVlu4C8AQd256yEUvOukCMySVkc6v8XFC+yDYlONHhTDJV9j7ZG/KtNPofmIutZ9bDLjn0WU2jSPbrk52Zx08aOh8eooaZWZSqv0hmNhLFYfyLoSqBR5I+k8Z97ZgsAekMsgjQVRc+udDKmdwMDyzlzogLSB9KhB7xrC1u8VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5366.namprd11.prod.outlook.com (2603:10b6:208:31c::17)
 by SA1PR11MB9682.namprd11.prod.outlook.com (2603:10b6:806:4df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 05:27:59 +0000
Received: from BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848]) by BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848%4]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 05:27:59 +0000
Message-ID: <20347e63-5e59-4dee-a608-438aae93c386@intel.com>
Date: Mon, 12 Oct 2026 10:57:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Add wa_14028434957 to Graphics Version 35.11
To: "Tauro, Riana" <riana.tauro@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
References: <20261009075224.1316885-2-varun.gupta@intel.com>
 <DS0PR11MB871877C3D61FED9F74533E83819F2@DS0PR11MB8718.namprd11.prod.outlook.com>
 <4c09f119-75da-41c5-ab61-408b7baf0859@intel.com>
Content-Language: en-US
From: "Gupta, Varun" <varun.gupta@intel.com>
In-Reply-To: <4c09f119-75da-41c5-ab61-408b7baf0859@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0228.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::7) To BL1PR11MB5366.namprd11.prod.outlook.com
 (2603:10b6:208:31c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5366:EE_|SA1PR11MB9682:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f5b6b9c-21e6-4379-4158-08df2821941e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|261009223027099003|56012099006|260925021911599003|260925021311599003|260925022911599003|11063799006|4143699003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: xa6Mk56/+OztrG3mB5WLfC4NRExOQhQWHFPso4/LPIBwJZ1hqe9WLz8ZqPnBeDrxl8fvaMq00/bnerIcTvUXt04+FKGvvfeUj71DXgNZzHbYWOQ9nIZeNj+WjwMfH2fUmXPqPu9vJGf1jD4csWKYvyNZMA3+8d/WFjXb1I6ZKjR66bEatLYAUvTXQx2QwAhPGkBNIgwDT/p7CsmgoHpMkyXoOr9/FdZvDQ81jAR4V/46oyHEQkqQUATFosFc4e7WORZqZyG7teQMSGXl8SakMaRfMdxwX5AC9e9gkT8xebdsqsBeKvpzqnbBBQANGLQzHztDeRZzLZrCTJU0zxo++k5qDBrFYojL7PSAR2xpwbEmvU0OhUkSfe1qnOAml7A2zMvxpDRqMMbianmZEugORCsk1PcEus7vrApoDExmj/0CLxM7bF9g240cMtC6HvCubOpNIpfIqoJh7r2apQ03vnFvcyRrirOYsyUDln4LARD2q/TbZ4mPd0sqIJZ9SkuS2XtewAvKvsNWuiSNfrx2NzQT3Sr13Wr5izX2KJW3VRjXQGkwbkKf7xxF6zxsuOhlJ6fSvXdKymU4X400ZLmF1MtXAt4HiDFD3cAQxvSob3E4qQrfkEDEzPxsJcNvZoVB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(261009223027099003)(56012099006)(260925021911599003)(260925021311599003)(260925022911599003)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ek9ySmszb0hrYkJTanU2WmlQZmNLMHh4TXNTdlVPVzJ2ckJJMDJ5UnZEeW40?=
 =?utf-8?B?MHQ1bEpzOHkwK3BVK0Fzb0NmcDZoUmlBa04xc2hzaEFsMXJoTlBVM1pqQlM2?=
 =?utf-8?B?TUpDWDY2TEp4cm5qb2JwME5YSDhySkt5MGlNRkdVbHBzK3BFeHlpMklNVXRk?=
 =?utf-8?B?elJGMWtUc1FVQkJ2ZDl3MnEzVEpoYUtuMWFKQVNzZmdkUlNvR2ZJN21uMEtv?=
 =?utf-8?B?SStXUVhyOWZMMHNPNWtyVkVmUkF5SzRLTTQwYXlTVFVOeW9qbmc2V2g1OUZL?=
 =?utf-8?B?S1dsUXgvSC8yeTl5cEJLUXJTSkJyUHdHT2M2WHdybjVmTDE0NDFLYmxHb2s3?=
 =?utf-8?B?bXBIN0ZWWHhYemFEZWhvcjcxUFptZW1ydXFMUk1TdkZuVSs0eE84WVk0T0p6?=
 =?utf-8?B?Y1BJMGthcDdoeGNOS20wZ0ZSZ3Y2bVRsL1E1d2UwYWsxT2dhd2w0M2o5Yy8x?=
 =?utf-8?B?NHc0citMOUtueVhpckxBcXBKN0ZXSUFiTTVZL3hsdkxSYktvREVjeFUydU9q?=
 =?utf-8?B?YW42dGdMNkZwYWlsUGVNUXU2QWE5ajNyaFE1b2VDVlRmS2NvY21tTzErTW5t?=
 =?utf-8?B?QnVOMW5IYjVJdEhHbFh2UFhndFlHNy91UFNZUkVtdURrd3VVT29QN0JFTytv?=
 =?utf-8?B?cUtUQnZCNjdobk5LWWhLVDFKYkRtMjRRNFM0Zk9KWDl5a1U4L1MxN1ZSY2Uz?=
 =?utf-8?B?M2lmbmFOQzZGYmhKT1hlNHBzajlDRVd3RmhPTnlSUmY4OWlQVFVWcTBxK1B5?=
 =?utf-8?B?N3hTeVI1Q1ozbFVvVUdHZERMLzJLcHJCYWNEeDJKdlBybWNzeUV5alVIcjda?=
 =?utf-8?B?bW9Ec3JSenNTRU52eGVhK0Z5b1pPYjZnbVc1YTB4ZHhETnlINTdwQmxzeDhS?=
 =?utf-8?B?T0k1MS9KY0hvUDh0WGxieW1yRFJZTFRXQlVvbDJDSWJFOG9DbC9KSThEdzlr?=
 =?utf-8?B?aDBLY1p4TmdIT3ZHbHF1bFk2UnBzTWxiM3BUVVVVWHhiUkl1Tlh5eHc1YjRV?=
 =?utf-8?B?akVMYnY3VXpRZ042a2swcllHdmQ3aGRqbGRsWTkrRldrTzZaUW1lRkdYWnkv?=
 =?utf-8?B?b3VLTElWczd6TVJPOTM2RkYzdnlUWGNpNXJLZ25NNUM2Z2gwdU1GK0U0RklU?=
 =?utf-8?B?eFZQTEZwcUs1bXdLMWtxSVVrc3R1QWl6Mnp3L3EweGh3aHcydWQ4RmNXNm9X?=
 =?utf-8?B?R3A5Yi90MEhVcHZXNnRlMVcvYjhzNnY3R3oxSXVtTFVHNHRGeWZqdlI5RWty?=
 =?utf-8?B?TkNGNmlWajNJYkxGZDdoQzdMdFJYR3gyNTFRWVUzWDhFRTkxZm9mQWdsMVhG?=
 =?utf-8?B?ZWFXeWZ4WFdxQ0oyN1UxUE04bHovY3ZEUHRld2FRaWlGRGoxWkRwZUxvL09H?=
 =?utf-8?B?ZkJJY0dvZ1N4T1ZHNjNVQWJZeEJYNVlLS1d3UGxEcmpjRkEvZXJkWkorWGU3?=
 =?utf-8?B?bkkxb0ZlbVlBQzB3a0lTYWtNY3RpeXR0NWxaSEJZRk00cE8xdktDU2dTK1ZF?=
 =?utf-8?B?Sm1xc3R0RnNVTkZ0QVNZMjlYcUZMblZLUnFjSnI1eldiN01YVEZiL3BBSGox?=
 =?utf-8?B?WWJaNCtqWnExSFExcWdMVDFlNWJlRlMzczFscWF1dVMyeTVEY2NZOVR4T1Mx?=
 =?utf-8?B?UnpmaWhwM1RsUXM4MmVDemxkS3A4SUlLRGF4dm9KNzJWKzdvY0FFTzFUZTY5?=
 =?utf-8?B?akdlZ011LzdzaTllUnBPdUJGOC9zcEJKRWhEcTFLdjlKN3RwQUxDKzZ1TFo3?=
 =?utf-8?B?Z1hxSkttVEF0TEkvRll2VWRwMDkzNjZTZ3pRVDNrTDRSSG40Rmd2UFNqcE5Z?=
 =?utf-8?B?MG9xcDVKQTFGMzVZNnErUVcvMVkwMVJ4V1E2bi82SVY3b3NTcmhpUURwSjVh?=
 =?utf-8?B?RFJjTFpnVHAvelNKU0FOdjZaTm1yOXV0c0VQRWNjdXBaWXFTYmhNOTJNaUVH?=
 =?utf-8?B?WmNhM1hHSW13VGt3WTArZVBoMUdiZGdGcHl5bzIwaHNXeHVtWlhVck9oSkNo?=
 =?utf-8?B?SUgxODludFlnMGZtWFlDemVMOFI5MGYvMlZvSkdNdFBuZUZZTHpTbUcvcUxl?=
 =?utf-8?B?ZitnNkJSS2x6NTgxN21XVmtCOG82V3BzVy9lNjhGYWt5Z01hcmdEMjVqTEN6?=
 =?utf-8?B?NEV0OVVuVDEyQk9sZ2V2ckgvQS82dXJJME5nbWZkY0ZsaXVCU29XOHRFRld0?=
 =?utf-8?B?cVRTZVZIdTlZRk85Y2M5T1R3MUp6Rk9YSmtkTjNNL3hRQlBKbEUrL0ZpYzZ3?=
 =?utf-8?B?bmVxYjBBZEdDcnIzK0ZZeGp2c0E5U0FFbnVOY0VmMUhLUnpROGprckJJR0RF?=
 =?utf-8?B?RkJ1a1ErM0FCMk0wdms0djFFSmJ1ejFPZjdwZW5IbnNwN2p6cFN0Zz09?=
X-Exchange-RoutingPolicyChecked: L/qQjcOUVDwGE/c+Gtz9JocGr1hDP2JWV4uFLM6+GsLCoN9Z5MxxImeeE6HyE/0wT97m+Mu4XrBxtkpLmmTXTjTweRsejnAeEU8t5EISQ1Hm7U7UbR/C/BGr18YGebsQdYZGUgDpBbYcxeHkHQW4WM5iiYh0it5FQ9ensgzuO0pzCeurWc7UzQGW7qaEKH39l0bMrawVFlCvXvhtNlR5bIACb+PMalth6qwXElK8s7kGpSSkOIQRJ/tbEhPquDsO90PFTt/i4DRpTbRZANXdnERPq7kex4USag2Tg/F5Lzyqai5CWGbI7JoePI0gfO6lRYbGo/R/xhfSmaBN3imI0A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5b6b9c-21e6-4379-4158-08df2821941e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 05:27:59.6965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBmHWLs0FYfm7xHZzEKqGUq1S5YDATOPm1HGQpDGDRIBYLD/Yuf3nIxA8pn/PSCljHjUM5r18PCcTFE61NhFGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9682
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


On 12-Oct-26 10:45 AM, Tauro, Riana wrote:
>
> On 12-10-2026 10:42, Upadhyay, Tejas wrote:
>>
>>> -----Original Message-----
>>> From: Gupta, Varun <varun.gupta@intel.com>
>>> Sent: 09 October 2026 13:22
>>> To: intel-xe@lists.freedesktop.org
>>> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Upadhyay, Tejas
>>> <tejas.upadhyay@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
>>> Subject: [PATCH v2] drm/xe: Add wa_14028434957 to Graphics Version
>>> 35.11
>
> This is already sent long back
>
> Intel Xe - Patchwork
>
> <https://patchwork.freedesktop.org/series/173001/>Why are we 
> refloating this ?
>
> Thanks
> Riana
>
Hi Riana,

I was not aware of this series, I was only tracking the workaround ID.
Since your series is already underway, I will drop this patch and wait 
for your
implementation to merge, and if explicit tracking for the WA is still 
required,
I can send a follow-up patch to add the WA tag on top of your changes.

Thanks,
Varun
>>>
>>> Prevent the SNIB AER latch from swallowing back-to-back 
>>> uncorrectable non-
>>> fatal errors.
>>>
>>> Firmware bypasses the faulty AER path by routing these errors 
>>> directly via
>>> MSI. This patch intercepts the MSI and reuses the existing GFSP error
>>> containment logic.
>>>
>>> Because GFSP mailbox queries can sleep, handling is deferred to a 
>>> workqueue
>>> (nonfatal_msi_work) to ensure hardirq safety. If a reset is 
>>> required, the device
>>> is wedged (a stopgap until VR driver quiescing support allows for an 
>>> actual
>>> Secondary Bus Reset).
>>>
>>> v2:
>>>   - Return 'int' from xe_hw_error_init() to propagate 
>>> failures.(Sashiko)
>>>   - Use devm_add_action_or_reset() for teardown to prevent MMIO faults
>>>     during PCI unbind.(Sashiko)
>>>   - Add xe_pm_runtime guard in the worker thread.(Sashiko)
>>>
>>> Assisted-by: LLM
>>> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_device_wa_oob.rules |  2 +
>>>   drivers/gpu/drm/xe/xe_drm_ras_types.h     |  5 +++
>>>   drivers/gpu/drm/xe/xe_hw_error.c          | 52 
>>> ++++++++++++++++++++++-
>>>   drivers/gpu/drm/xe/xe_hw_error.h          |  2 +-
>>>   drivers/gpu/drm/xe/xe_irq.c               |  4 +-
>>>   5 files changed, 61 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>>> b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>>> index d8dc41851425..29a7d96a5666 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>>> +++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>>> @@ -7,3 +7,5 @@
>>>   14026633728    PLATFORM(CRESCENTISLAND)
>>>   14026746987    PLATFORM(CRESCENTISLAND)
>>>   14026779378    PLATFORM(CRESCENTISLAND)
>>> +14028434957    PLATFORM(CRESCENTISLAND)
>>> +
>>> diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h
>>> b/drivers/gpu/drm/xe/xe_drm_ras_types.h
>>> index 0be218ba2db7..7a35390a9ffd 100644
>>> --- a/drivers/gpu/drm/xe/xe_drm_ras_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
>>> @@ -9,6 +9,8 @@
>>>   #include <linux/atomic.h>
>>>   #include <drm/xe_drm.h>
>>>
>>> +#include <linux/workqueue.h>
>>> +
>>>   struct drm_ras_node;
>>>
>>>   /* Error categories reported by hardware */ @@ -46,6 +48,9 @@ struct
>>> xe_drm_ras {
>>>
>>>       /** @disable_vram_page_offline: cached configfs policy, immutable
>>> after init */
>>>       bool disable_vram_page_offline;
>>> +
>>> +    /** @nonfatal_msi_work: Worker to process uncorrectable non-fatal
>>> errors */
>>> +    struct work_struct nonfatal_msi_work;
>>>   };
>>>
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c
>>> b/drivers/gpu/drm/xe/xe_hw_error.c
>>> index 5f2abc9485ff..bde707a3fb64 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>>> @@ -5,6 +5,8 @@
>>>
>>>   #include <linux/bitmap.h>
>>>
>>> +#include <generated/xe_device_wa_oob.h>
>>> +
>>>   #include "regs/xe_gsc_regs.h"
>>>   #include "regs/xe_hw_error_regs.h"
>>>   #include "regs/xe_irq_regs.h"
>>> @@ -14,7 +16,10 @@
>>>   #include "xe_drm_ras.h"
>>>   #include "xe_hw_error.h"
>>>   #include "xe_mmio.h"
>>> +#include "xe_pm.h"
>>> +#include "xe_ras.h"
>>>   #include "xe_survivability_mode.h"
>>> +#include "xe_wa.h"
>>>
>>>   #define GT_HW_ERROR_MAX_ERR_BITS        16
>>>   #define HEC_UNCORR_FW_ERR_BITS            4
>>> @@ -173,6 +178,29 @@ static void csc_hw_error_work(struct work_struct
>>> *work)
>>>       xe_survivability_mode_runtime_enable(xe);
>>>   }
>>>
>>> +static void nonfatal_msi_work(struct work_struct *work) {
>>> +    struct xe_drm_ras *ras = container_of(work, typeof(*ras),
>>> nonfatal_msi_work);
>>> +    struct xe_device *xe = container_of(ras, typeof(*xe), ras);
>>> +
>>> +    guard(xe_pm_runtime)(xe);
>>> +    enum xe_ras_recovery_action action = xe_ras_process_errors(xe);
>>> +
>>> +    /*
>>> +     * TODO: Request an SBR instead of wedging, once VR driver
>>> +     * quiescing support is in place.
>>> +     */
>>> +    if (action != XE_RAS_RECOVERY_ACTION_RECOVERED)
>>> +        xe_device_declare_wedged(xe);
>>> +}
>>> +
>>> +static void hw_error_fini(void *arg)
>>> +{
>>> +    struct xe_device *xe = arg;
>>> +
>>> +    cancel_work_sync(&xe->ras.nonfatal_msi_work);
>>> +}
>>> +
>>>   static void csc_hw_error_handler(struct xe_tile *tile, const enum
>>> hardware_error hw_err)  {
>>>       const enum drm_xe_ras_error_severity severity =
>>> hw_err_to_severity(hw_err); @@ -436,6 +464,15 @@ static void
>>> hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>>>        * here for those platforms.
>>>        */
>>>       if (xe->info.has_sysctrl) {
>>> +        /*
>>> +         * Defer non-fatal MSI handling to process context because the
>>> GFSP
>>> +         * query can sleep.
>>> +         */
>>> +        if (hw_err == HARDWARE_ERROR_NONFATAL &&
>>> XE_DEVICE_WA(xe, 14028434957)) {
>>> +            schedule_work(&xe->ras.nonfatal_msi_work);
>>> +            return;
>>> +        }
>>> +
>>>           drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error
>>> routing\n");
>>>           return;
>>>       }
>>> @@ -541,15 +578,26 @@ static void process_hw_errors(struct xe_device
>>> *xe)
>>>    *
>>>    * Initialize and check for errors that occurred during boot
>>>    * prior to driver load
>>> + *
>>> + * Return: 0 on success, negative error code on failure.
>>>    */
>>> -void xe_hw_error_init(struct xe_device *xe)
>>> +int xe_hw_error_init(struct xe_device *xe)
>>>   {
>>>       struct xe_tile *tile = xe_device_get_root_tile(xe);
>>> +    int err;
>>> +
>>> +    INIT_WORK(&xe->ras.nonfatal_msi_work, nonfatal_msi_work);
>>> +
>>> +    err = devm_add_action_or_reset(xe->drm.dev, hw_error_fini, xe);
>>> +    if (err)
>>> +        return err;
>>>
>>>       if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>>> -        return;
>>> +        return 0;
>> Should this not be first check in this init? Everything that 
>> follows.  With that addressed, LGTM,
>> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>
>> @Tauro, Riana do you see any concerns? I think for now it is planned 
>> to handle this way!
>>
>> Tejas
>>> INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
>>>
>>>       process_hw_errors(xe);
>>> +
>>> +    return 0;
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h
>>> b/drivers/gpu/drm/xe/xe_hw_error.h
>>> index 5e3a11424108..a9af4c947d77 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_error.h
>>> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
>>> @@ -11,5 +11,5 @@ struct xe_tile;
>>>   struct xe_device;
>>>
>>>   void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 
>>> master_ctl); -void
>>> xe_hw_error_init(struct xe_device *xe);
>>> +int xe_hw_error_init(struct xe_device *xe);
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_irq.c 
>>> b/drivers/gpu/drm/xe/xe_irq.c index
>>> 9e49e2241da4..5ea50d203db1 100644
>>> --- a/drivers/gpu/drm/xe/xe_irq.c
>>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>>> @@ -811,7 +811,9 @@ int xe_irq_install(struct xe_device *xe)
>>>       int nvec = 1;
>>>       int err;
>>>
>>> -    xe_hw_error_init(xe);
>>> +    err = xe_hw_error_init(xe);
>>> +    if (err)
>>> +        return err;
>>>
>>>       xe_irq_reset(xe);
>>>
>>> -- 
>>> 2.43.0
