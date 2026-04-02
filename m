Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82926D6AAEC
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 16:13:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7F110F2EF;
	Thu,  2 Apr 2026 16:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EPte+l+G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155BC10F2EF
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 16:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775146395; x=1806682395;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ViOOJKL0NfIKmnGVR61E+VQCCc0T231hh875qXINQzc=;
 b=EPte+l+GV8D5v+WaJobaleaGOx+cg5Z1DkjmuNzhbU9viBJD9/TIWwjX
 UoYcl4DodyXOTYOeZ7DQXM/VKkgEQDQBSDCSA54LIRGne0gikNk2GDCdl
 nizOTTfClwJ1l0APb21PLBAlicGt8/A976bxbFQLS+VayQUBpNU6+LWbM
 KmcPfhZxQFsIsNCg4Nd/umkDe6aUum3WZvEEYfGOVP3Fz4EOQN2EgVqJW
 cqbaMkoptTtZ3B5ZD/N18vzSLBZ9tnw3gGTPhqE3A840TXvJ76n/6mAMC
 Z1zj59mpJLTyS4EK9eWRRc/XOq5kyhL9hmOJglMoYrjPz4WRaL42CUnfh A==;
X-CSE-ConnectionGUID: FClfooRHQ4OAAN6e8746KA==
X-CSE-MsgGUID: dxhkjBUdQ064Bs7c7+U5Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="80098933"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="80098933"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 09:13:14 -0700
X-CSE-ConnectionGUID: UNeuZ6sESWK5iXqwVOZHQg==
X-CSE-MsgGUID: Dk8Ah9qCS6WK4AbAM+CgqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="264948875"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 09:13:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 09:13:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 09:13:13 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.27)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 09:13:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z85rME8lkG0ETcybAozlI2Yy3QdXcIOdECglGC/8b8wmRZZmIj3wkqPAh0Q4oLhq8MkFymlK71zkExbsDc8r1l5CgM782VwmgvqqFpDGNfvKpYBLbgs4BRb0/r3i9q+6+UOlb5oaF2jmjx1jc0oc9CF4rwPavsRYLGfpp1omZho5B9/Ep9bxsQmknuyNcOyiquxyREzZ2WIs6oLUccRhcHtP4tWb7Ch9F1XABqOMcj1h4ZFFs82oQVM5j1IKZIWIFuOQphH+nm5ujIkjLJaG4ZDlQqXV1pooHLbWpoWg6qi33uPkIMiBK7WcHzNACBFpTTOW/2a03tKDCSDQ1L2mjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0Y4vriGzK44YsmIJcJecKhp+kxCR1uJotK6b3orEOo=;
 b=RILrqo8U4Np68wFmqYIpG+kpZik3en862NRxQErPBaWV3dxL+i4jKZ9Ivnnfa7CJuQC2jCdM1ORviTfi3rezvp0eovB9vU5EUfyTe8sUCiuaitNZ5pq8TZpXDl8LGUVOVtJTIpQvXOZ66hA2xMCLONVJjCBCuthqh7YtRIdRtJ4J6faLvZ71yb+I/Sh27S2x6tNkic/cotFJQH+H0n2nEFXrvhntfzKeQxHKNBN9U3YLOhVsgkL1/z/oQwdpOxsQSl0/JWpPhDsLZ9I8hfMNr9z8meUL0U1AAObuRrabwJk/0CuowKv9BjZLWWOBDLAh/kaxev7cpBcYEFvQbhT9BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ0PR11MB4848.namprd11.prod.outlook.com (2603:10b6:a03:2af::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.12; Thu, 2 Apr
 2026 16:13:08 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 16:13:08 +0000
Message-ID: <d6f0b17f-49c2-4d8f-b804-b6cc7f9c8aa4@intel.com>
Date: Thu, 2 Apr 2026 18:13:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] drm/xe/pf: Force new VFs prorities only once
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260330204046.567-1-michal.wajdeczko@intel.com>
 <20260330204046.567-4-michal.wajdeczko@intel.com>
 <20260402102240.7h7elsv254d3ey42@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260402102240.7h7elsv254d3ey42@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR03CA0059.eurprd03.prod.outlook.com
 (2603:10a6:803:50::30) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ0PR11MB4848:EE_
X-MS-Office365-Filtering-Correlation-Id: 8190d84f-3872-44fe-827d-08de90d2badf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: YqGZkk0EmZmypz+Odeph+lYyB0ColCKTzFp9ezFp9pH6vldS5H+KH05OXfxxGbAXxTWtrmI0noNAXjjZmz0M7HERXFoGNC8i7oNvqu3tHsqG5OpoxG3xyUI9Wuy0/BEEMQGanbkgb2TfCRwMH88KzviCRQrNHjKf/WOj9KboF9vDa+vS/MQSm8hPTdQEElp6uLa9bbzv5rrsFpXM13W6tQ+XkH/7rTngHS8AM3yoDMYYsmJf3/TfNozdbQhWGGpMcSUGwDgTnU98I5r+vKOI9MzppCDcN/pvm5EoyXV+m001UIN3mfUFUzCZ/l9oTSFbfXs6MwMOP+OqVoCe1JAbuiYBir6sES5zjHNh6lHu2LWG4vrN98Bc2NEJJGN4huUs5LerR8Eyfmo9SMNOHrxTHJbcUlxhvyZ8N8MrZcf/cled8Q9Jpsn1DYcVizNhqsIpuZb7jDK/UPzyDPU3XJ2vf6barPvbZwshNkK/hZpE/lfSNtdpdPeaRXWqXWvNQaDQhpLtiYKry86Y997KSUR6o+e+aFbhbMgycDyHEMtVF23L11OvHohVWBDk8YY8LMon8dJmNn0VF4mssaUezhXHLp54kgbXf/An1ugsmNhWLpMkcfctEtZygOVgKPqbJuep9iNYEKEBNni/ikWtRhr2Rg1dl8NiL3byjKwEkvSSL5p5UUXZeIeXGlLEUZcw04FHJXT3mX3TpbL7aOVVIP+ZSKBe3q2CV7z/tPzQD/NzQ8c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2FXWlZ6ZUx5Z1c5d3pmMTJjRFRMZzF4aXBUYUROV0hMZUQyN1pVY3RZMGg5?=
 =?utf-8?B?ZGFqczFRZi8rWWk1MTF3WFJEb2RMR2lHK3pzd0tnQjczTm5kSDYyS0t6V1VF?=
 =?utf-8?B?RGtIWC9yZHN3dlliRkUzbFdYRUV1dkdaaWl6amdyUHZjS01zQ1JWNU9UMzNj?=
 =?utf-8?B?SWd6bDEvKzQwOTQybmxlVVpZSkhrcFJ2SWRNZWQzM1JzVHM2Ky9SM21xTXJv?=
 =?utf-8?B?WjBIdFIxOWwxallaWnRJMURqOGhqVVF5ZWpxWitkRXVxUkpDMW93dm9tbFFk?=
 =?utf-8?B?VlBpUGY0ZVpwSHF1M1pBZ3M4TG1jRXZZWU1GTU1JY01FViszNldyclZnTGdp?=
 =?utf-8?B?UmVnejhnbXQvRFIvdVJIbkFFUEZCamE5aTJSMHJoVzRvT1paQ2FGL1JKVDJr?=
 =?utf-8?B?YUw5ZFdmZ1orbkpvc2NTZmZNVXQ3UG9UZEtjVlBKOEl3T0pLZTZucTVvMG5u?=
 =?utf-8?B?SnUrR2Z2OUEyREZzNDZGV2pSTkdiMjZmOG8xa01TNnVERUdaTXlBcThDRU1E?=
 =?utf-8?B?TnVxT053bGNxYVZzV1QwcmF1VTRRWi9iVzdqNmFZWC9KNk1yalZJaHVPMFVt?=
 =?utf-8?B?djlhbnJrN3R2V2o0UFpaaGdqZnI0VnBTbXE0dU51VnpTUnZsSDEzSWNEUUt2?=
 =?utf-8?B?N0J1Q2NNcU9NclZuQUFZQWY4WkJ6ejVDV1pJeUd0c1JEY2pzRXBGUnlkcmlX?=
 =?utf-8?B?WTZESmJ3Rml4eFl5T1FNQ3h4T1RsMndYMDNzRHJoSTdjOWRkWlppcnMxNmt3?=
 =?utf-8?B?Nk1FamVKc0NJdFdJbTlKUm4xaG9ROU1WK1h4U1JNRHhRTTZMOGZ3aUgxSWZw?=
 =?utf-8?B?bWFnVytTK1FyU0lma2JNbVZnT3E3R0grQUlWWitDV1lYVWdhRlVtamk1YVgz?=
 =?utf-8?B?RDBpVDhKU2NONXB1aW53Sk9obVA3MGtuYjlRbzVNQ0FGTWtuNEhCbnpYU3N1?=
 =?utf-8?B?aGRCOWhGZTZZaDJKZ3M2NEhkdWhxcVJPUThjWDNIdzR0RE9oMVJ1RVZWdUpH?=
 =?utf-8?B?ZXB5M0xQWW1HRmtQb1N3L0xyZU5pUEpHN1owOGN0cTRGUDFwN0lzWFQ3SDhp?=
 =?utf-8?B?SEhIUVZRdTVzd29kTUpsamxoOTFjTDZPL1JsWitPM3F4QXRycTdyYTMrQ293?=
 =?utf-8?B?SW5HUkUvbDlwQVlsYVM3S1lwRVlkR3ZlNHh1QlArVUU3QkwzTFN4RE0veVBQ?=
 =?utf-8?B?S1N4R2diWmVIZHVZY3ZSaDBGekt3UmFpUEFqc1R4Sy9oQ3BDVi9NR2VsL3k0?=
 =?utf-8?B?c0F0RmpiV0xBVks1M0JMdHJQakg3dCtBMkdwbFZ1TXdHN3UrM2VNbjcvWGJ2?=
 =?utf-8?B?SDc1V1FvbmNtd1djKzZrcUFjV1pmMHViRHprL2hUbW1Wc0p6QlNVSU13RkNF?=
 =?utf-8?B?Yk5zMCtjVitIQXcxNkp2dFEwZzZHMHBvVTVUTWlsQlEyWTY4LyswcFlOWE5M?=
 =?utf-8?B?TW5NMXFiQkRaNzY4UEZuMndOYWRCWVFvK2Zydi83SzU2ZWVHS3FFNzd2dTZh?=
 =?utf-8?B?SnpuMm1oUWRrTkpXa1RpMW5rMitBVkpEZ0RuS0dtWXVocStSNkVyYlkwT2xa?=
 =?utf-8?B?Zzc2STNXOWZRQ0l3ZWMzcHZ0Q2I2UnVnQWowUkdTSHkvLzJyUFpnZFlKQ2E5?=
 =?utf-8?B?Z3krZ3h6ekdpWlBqS1ljQXRUYnJLeE9tSEtJZldINDhZWWk4cFpUdVJLditR?=
 =?utf-8?B?Vlk1V1NwN0VUNzl2Sk1Ja1hIbWFmWFhFNno3TUw3d29WVnZGNTM2aFFTc2ZU?=
 =?utf-8?B?V1ZBOTczV0tld1JNR0dJTUgzUmFVRFNXajhZeVJCR3J5SHlXRnFDd3hhOHZ6?=
 =?utf-8?B?YjFRcDdzVjJsSk9YdE5uLzAxWU93eE9UZm5sUytacFFkWCtLTGlKS0pXRmJV?=
 =?utf-8?B?YjY1bWZCbGZ5ZGJwaVBxMnBiaitzT1dGY3RKeVVEWDVLYW5LMWdZaWp5MDQ0?=
 =?utf-8?B?VUpiTkVyVjY2WVRwSXF3QW41QUpiU1E3L2dKdGZ4VnhocVUyd3N1Q2Jua1Ry?=
 =?utf-8?B?OWdIK1RvNWJwY0ZlN3RKZWhlVUhaYjBFeGtDdk5DSzU4cndmaFRuNjlZeGE5?=
 =?utf-8?B?Qk9MSDd1QzBnNkRKVFRmdE9hdzFIeGw3TmxkUndxUVlyNXBxWWg5eFcxZ2VK?=
 =?utf-8?B?ZHZKelI5aW9yTlA2VWFLTWpSRWxBVDEvMGd6cGw5RkIwQlcxMTg1NXc4d0ZX?=
 =?utf-8?B?OGExbEFhdkpOQndzU2NKL3ptWGF2UXpNOEM4UzZ3ZDdkMnZJbkJSSnBqNi9z?=
 =?utf-8?B?MFl1TTg0VTh5ajBocDRHRHJXRWgwL0xpUzN5WlpwdDMwcEdsaDJSMFAwNEpo?=
 =?utf-8?B?K1NkeG1QVDdGN1l0cGtINU5TNjdwejJZNEJrTWw0MmE1Nmlub1R2WktTZXJs?=
 =?utf-8?Q?zqtWQvWehkZkepQo=3D?=
X-Exchange-RoutingPolicyChecked: NYSeyJ0PVhi+rDfvRI2yU4osTuvHjpuD2IE+9Hzs5kCiSbQbbN78pgYCkR4CGJzvx+vN5rjNsFB9nT/0BvIe09gd2gxGdd8s631xSuBXs5rX+WLBtB5mSxYKy+vfBb7hJM7XAV4Fjfj+GliPaYoJa0HQ4uBSBcvD91bG7/0vvCLK0J6XIQY9rxcHix5yV+CXFJstBp/nR8Mk3MviluQNGygq2hBfzqEeZjUbiDncOGvOaH9R0H+SmsNVM5RyE9vtR002YLvFxQzOctNkTBOS4zHcX0dT20xa16JabjUu6qnXfe/eeUFRqgtlG2GjgbjklTsOFW/XHS6eGtrXJEhSdg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8190d84f-3872-44fe-827d-08de90d2badf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 16:13:08.7057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TX0ISEwDo/zL4G3A6QVAKb5Ksq/J6CMkDPfcxZzyzTUgfyrCtleMaPz8XMUIMuq3ne1/2EgKEALWJAYjZ7y1fLmaTn1dStebjWl+Lr5LLVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4848
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



On 4/2/2026 12:22 PM, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2026-mar-30 22:40:34 +0200]:
>> We should force change of VFs scheduling priorities only after
>> initial change of the SCHED_IF_IDLE policy. Doing that also during
>> any later policy reprovisioning will overwrite changes done on the
>> individual per-VF scheduling priorities (currently only for PF).
>>
>> While around also move priority change code to the _config component
>> to maintain a proper isolation. Also document our expectation about
>> the GuC version where the new meaning of the policy KLV is present.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 28 ++++++++++++++
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 44 ++++++++++------------
>>  3 files changed, 48 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> index 658e9b048751..e1c028176eb8 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> @@ -2550,6 +2550,34 @@ u32 xe_gt_sriov_pf_config_get_sched_priority(struct xe_gt *gt, unsigned int vfid
>>  	return priority;
>>  }
>>  
>> +/**
>> + * xe_gt_sriov_pf_config_force_sched_priority_locked() - Force update scheduling priority.
>> + * @gt: the &xe_gt
>> + * @priority: new scheduling priority to set
>> + *
>> + * This function allows to update cached values of the scheduling priorities of all
>> + * VFs (and PF) as result of applying the `GUC_KLV_VGT_POLICY_SCHED_IF_IDLE`_ policy.
>> + *
>> + * This function can only be called on PF.
>> + */
>> +void xe_gt_sriov_pf_config_force_sched_priority_locked(struct xe_gt *gt, u32 priority)
>> +{
>> +	unsigned int total_vfs = 1 + xe_gt_sriov_pf_get_totalvfs(gt);
>> +	struct xe_gt_sriov_config *config;
>> +	unsigned int n;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> I will add:
> lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));

this is already part of the pf_pick_vf_config() called below

but yeah, I can add it here as kind of documenting function expectations
(will try to do it during merge)

> 
>> +
>> +	for (n = 0; n < total_vfs; n++) {
>> +		config = pf_pick_vf_config(gt, VFID(n));
>> +		config->sched_priority = priority;
>> +	}
>> +
>> +	pf_config_bulk_set_u32_done(gt, PFID, 1 + total_vfs, priority,
>> +				    pf_get_sched_priority, "scheduling priority",
>> +				    sched_priority_unit, n, 0);
>> +}
>> +

...

>>  
> 
> LGTM:
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

Thanks!

> 
> 
>>  /**
>> -- 
>> 2.47.1
>>
> 

