Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65187C61DCB
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 15:46:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3D110E3EB;
	Fri, 28 Aug 2026 15:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kdyu8Quq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543D110E3EB;
 Fri, 28 Aug 2026 15:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787931994; x=1819467994;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iBYscvnpB9Y9v+ruXhVipNUkei//ovnavU/WcYYy9dk=;
 b=kdyu8QuqrA+l30ZuCRoxMKwzY/nk5okRopRLTJYLBjDGPZrX2QtpCZ0p
 rbFlbGSD2WvSfyVnluFWldwklbR31FTOebq+PqTM1qGe2BCUcqh6cDBYb
 HcNJmlfMPVwG4dtbc7pQVq/2EST70zu1acfYmSi0HUMQq7CVrYFTvr1bt
 tn2hOZOpnZSqbSZEWtJ9J5gHGGRG+1jcFoRz+tkboxv8q6cTyNEBeWuIV
 Nz0G9AJ7ZINSdwIJtaUe4xxdbw3ijSIA8oD0SBS1w/7JbxZ4+Pi1pOEjp
 xMB7MTzrlBBwdifdjxMCQamRFsoQRe84zu+YRifehkAzw+gnqCT4VDKMU g==;
X-CSE-ConnectionGUID: HIDgLnGHRcyLBVwDnuvYdA==
X-CSE-MsgGUID: /JloEWPLQBOBf6j/gJ9/1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="92126852"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="92126852"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 08:46:33 -0700
X-CSE-ConnectionGUID: N+l7DUVaQ0GHi2Du6PLklQ==
X-CSE-MsgGUID: 5bTZNexCQkakcB6FiicpgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="266885506"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 08:46:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 08:46:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 08:46:30 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 08:46:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sFFD+9s8pmG7sm5gOLbSGRH7hcugxFgxfddziZ3V1mfJ3CRfvGJAMezLik+nlN4N6/7d+XPbAlVbpEewBytfsl84PlPZxu3TLV3zRAJVUcbYRw7K86wBQ1PDmmOINvF0F+u/M6CunJNGka+kG2+NPwjZWadCBoslXn11a0E1GYrefgq0LB2Iv5G1D9rdGUKTQCZZREOkZgyZdL5QyIBrDk/jwKWw55opyCaVr0iEfu8rxf8ZAnJ2a1LClQLIm2t6HWuKGVjq1pwB2pKbReuFhxagVp9AAopJvKaiNXySf4c/1vC5AmgDF9rXOF4IhgivtexRgve0hvwy/tfsaHN7wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a84QafY7HReARHxeRega+lK6AOixn9yR6zTW/mumzm0=;
 b=OtfKzG9DV2GhZRWld2/dwYqeXvqst45QgU2xc4uAdpfhPzkvbyasvPPZgJAfXxgSUXmfgcYSVtmTpSVOCIvedR1r14hqRTWTAD5anaZEzhu2IowJEQhQIYgyVIJfay2Uk1aGdA7KHl6LgSRlf+Ck5hEoM091ZuKvVq2YOyeiCjRljm/lCSoZBW3wTZq0sKBiM9u0/0VvI3/ZLUCof9B1vJvWurUY+PMGgQS5PbU/wXJ8yXf8aOjaoD8YC/PGluoJ7YaMFVteV0yX1rVxIrGTS3YLbJdzBO+R/eYS9YCQ/ExdaTTK3ZCuVNB3UWqMKf2ysAlxPVQ/8QzTAaUn7i+jqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 by IA0PR11MB7330.namprd11.prod.outlook.com (2603:10b6:208:436::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 15:46:24 +0000
Received: from SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b]) by SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b%5]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 15:46:23 +0000
Message-ID: <3664f401-62d9-41b6-8be4-b5754fe26c5a@intel.com>
Date: Fri, 28 Aug 2026 21:16:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v4 2/2] drm/i915/audio: Prune ELD SADs based on HDMI audio
 bandwidth
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
CC: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Vinod
 Govindapillai" <vinod.govindapillai@intel.com>, Mitul Golani
 <mitulkumar.ajitkumar.golani@intel.com>, Jani Nikula <jani.nikula@intel.com>
References: <20260813120016.3444891-1-chaitanya.kumar.borah@intel.com>
 <20260813120016.3444891-3-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260813120016.3444891-3-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0227.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::8) To SA3PR11MB7554.namprd11.prod.outlook.com
 (2603:10b6:806:315::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7554:EE_|IA0PR11MB7330:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ad460e-f2f5-4186-eca6-08df051b837c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|4143699003|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: vI8gb8lY463RDRb+iau1eYET6dgj6GBQx28WDr2YQuLlf/aVhZbmmEFHo3sW6FCQr6ptCSfz7gkWIgN835SEwETbSHeS93qQHIIxV11Lskks2DxbJKbX9vdH0LhJg1c1bd6VNDFtl5at71Yy/rPTv6/3TqQaMMOk2YBqdiOH25ZsGfhpVdua6rOxXouvFAGhrOWxrzW3fyrcLcbE/3RC6PPNlSg6iBChyNmkY3WxhdOsQ8deVWcJsn7ndB0gEfwLjak1qg+Vz59se0UbnWFTulUdO8rY5jiqZDqN49I2e7tclYboxWRARmfJAzO3am95Qi/IShowQKVyCHwRkE2JIJPInwlQK31UeSAgWxcMpsLxDuo/kDtTMKxugOVg8EE2yuxuZFsKkt6ZMMv9qQK4g0dknfw5c2ri+gdeDjZ05dzWerRXPTc3wuIdEeZuVOhcsAXWtr+L5KQWksCiWu9DF5pvsUBYTI9vdK6lyxIb2F5PeKwhdHQy40d0D4AVSqWozLvXtnov3GBsmBXKMXon5saA3QeaKiX488/Po4XSimV/kqnV3lB/VJeRYnbELQ+gubeg2fRYEVW4RJsL64NfTNp304zjLRS4n5zeVsE2Oi/dLmXvT7hac1m67R29XGTn8s5bPEvMXyWO3eas9NRT4Pb5f1mZDeKOTV/gSy+Lvf0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7554.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1piZldDM0l5RXFHZi9WRWVXWGY0L1Q1T0E5ejg3azJJOG9rYW0vdHl5ZVRu?=
 =?utf-8?B?VmgyL00zVVEzSS9GWkQ0cEE5MGhyZnFkeEM1SWdsaFFsbVUxOU1paWt3OFdW?=
 =?utf-8?B?MXpQUTBQQUxtVnRBcFdZWjZPNEtGaVhobVdjclEvc2h5VFc2RlJNUHdkUW5s?=
 =?utf-8?B?NXBibW4vYWphbGVSaWVvS3I2Y3pTbGNiUnZySmVZMk5sbzc3LzlOdUE3SWha?=
 =?utf-8?B?RldxM3pZcSthZHBMVW5wd2U5bWQ4cE9JTW53eCtiTTJWUVFOSEVKY243R1Qv?=
 =?utf-8?B?ZFBIK3kyWUMzb0EyUDNLck52ZlNubERuc3BQeHRlOFlWTmlTaktPWVdsREt6?=
 =?utf-8?B?T2VGU1dITG9XOWM0aHd6Ky9rYWhhbXlrdVFydWJhVE1qelh1RDcweG1DUHhw?=
 =?utf-8?B?MmJQSjNuNUNTQlR3ZGJmSXE4Qk9lNC9FUGRJbmlac3JONW01NnJTUERaUFBB?=
 =?utf-8?B?WWxDQkdxQ3NjSEhQZ3ZzRm9UbE9rdHBSUHJDYjJJcU1RZWFUYlFMVkllVFp4?=
 =?utf-8?B?bXhua3JvNGxISC8xcFdIamRSU3BGOUQ5SHpqcjk3R2hrdHhtK1p3c0RrdmZs?=
 =?utf-8?B?VW00SXZoNHdaL0Y4bjRGWjMxOGgydkJCQU1yRFdCcnUxc0xBWnpNRmF5MUly?=
 =?utf-8?B?ckt4N1pEVmdYSHViVXllWHlqU1I1SFJyVzlwaGhabGFsMUpvaEx5eXNIY3hY?=
 =?utf-8?B?SEJtbUpJMlRLSTRlUlozYm95ZGpkS3FGa29RdVNzNEhCL2hCY3hhSDl3SVdT?=
 =?utf-8?B?RlhyRTk3QkFZS1JIdlpQQ1Z4MkYzSm04d0V1dWxXTlljMDI5cG54OE51NXkx?=
 =?utf-8?B?RkJST0RrNDRqUkVRK3pZeXNIOFBkN1VQTzNNWmtmTVZ4K3RCaTlKN202eEdE?=
 =?utf-8?B?SmJxNytXeTJsQ0dmNzhSU0xMakp4NktGOGw5YndJeS9yN0VnNGNKT3NqTzAz?=
 =?utf-8?B?dmlOcUQ2RGFrVUEzWGMrOW03QnpoVGxPNTI5VDhVS0s3MWFqRVdleGZXU1A2?=
 =?utf-8?B?bWx4aTFTbzEzd2k1N0NXNVZSSzJsT1VmT1k2QzNHaFlWREVVT1hPTkIxKzBp?=
 =?utf-8?B?LzQ2SHRWTjM2WW9IMWRPNVNwRkN2ZUw5SWxGZXVyTFI3SngvZVVScElBOUlE?=
 =?utf-8?B?OUp3UllmOTlHUnRlYjVxaWRicmtGb2RHMWplQTJTcklYMEc5a0xML3ZXdEZP?=
 =?utf-8?B?VHpRbzg5cVBlVVR2VTdTQitjcHd6djlaQlV2d2Z6WmRaRzJtUFBJa1liSHYv?=
 =?utf-8?B?UnJ4blh5bGd4bjU0bnVEbTF4NWZnZDl5MjFGU3RJY2xOZ2h1cXU4bWNaakF3?=
 =?utf-8?B?U1pjZ1NEclFqSkVUMUR0Yzd3NmNJVDlBeXA5aENCdHBIU0N4Y2lpdENwOGgr?=
 =?utf-8?B?a0xyczhvV3hod3FaU1MwZm93Tk5OczAwcTEwZG1xSXVUU1Vqc0hnRitsWGNZ?=
 =?utf-8?B?TG43RXFXYlh2akk2RCtmL1NxRGxOWjRVUEMzS3Y1YVA5SGR4Mm5TYUJLWk9G?=
 =?utf-8?B?TFVBd1dZbnY5TjBBRElFa1pKT3k4UTI5SXM2UkZITnFzbGg1WlhUS3ZJUXJ4?=
 =?utf-8?B?NFRqakloY1c2MmhYRkQwL3BnMmVTaFJFYVNVdjBzZXltc01oU2wxUEMwYUR6?=
 =?utf-8?B?UXNOTTB6VnIxQW83SmY4RFowSTdlcVVFMlg0L3pzcmZtbllVVmFSL2xaY2l6?=
 =?utf-8?B?M3F3Q2pnUjF4NWkwTnh3QXRsdVBCdUVjbVFVTkhLMnJ1T3ZoVmIxMEY2K0Ny?=
 =?utf-8?B?Z0Z1K01QRCtqdWNnM2NXUG1JTUZ3OENEZFlpMHpKc1luOTUyd0l5cERCYnNz?=
 =?utf-8?B?RGVNbUpXSVNvMFowL1d2N2tMSjFoOUdXWGpMWVRsSzZzbVlsNnNnNVJBUUtK?=
 =?utf-8?B?MVRMdnlQVWVuQnpuSjRRL3N5ZzdqNG1FR2daTXpMdVVGTFZNN0s4TlRicGEz?=
 =?utf-8?B?b0tvVm9RNXJWUUs1ajFqbkNhOUdHQ0puSDdoRlhaWk9mY3VsVnRkaGx4Ty9z?=
 =?utf-8?B?MXNuTTNJT2ZxUGV5MlNwYUlTeFl3SElZVkFNanNEVGVjQ3pWeVBLYzV1bWRj?=
 =?utf-8?B?OVlWZHFkS2dHM1o2K0dVYTlHN2Izc0VyclRPUGdFLzFNUjBJWjZuS3k1TXpz?=
 =?utf-8?B?elhWZmlRRTRaZkU2Y1hKYXdwMDRTVUNWeEV5dHNYV1JCQXJtSVN6MWN0Mzhx?=
 =?utf-8?B?K2FaZS9VV2IxQnBVbU1wSGZiMTdRSWlRbTJQeTFUK1p4ZEJleEI3bWJQZU1H?=
 =?utf-8?B?RUZGZlFIbHFVR2FqR0dodjRGOTQ2QXVuRDVUY3lnWG5IZ2FVb2xNdk1uNE42?=
 =?utf-8?B?QWtnRHV3TW5CbUVCUzNuSWlFU2kwOTVQVWhPU2N6QWFLVllpZytJY1BOWWZG?=
 =?utf-8?Q?+IBV3RbXqrRpF5bM=3D?=
X-Exchange-RoutingPolicyChecked: U4nsaiKFZFQpMYSkawEwyH4HsTDsOAFM0zrNM9cPXv+ikILLi0HTaazPmqt8qKHVAWuxLkEFFz/b+wppmBzUk0Nz0YSmQDLJ/WM0hEptWZ4eaWK7XvvwDM015+goGj5C6wpVC5HEIInbX+ecNV8VkJ9k2vsfLK7YY7ySIZU41JW2TgW6g54ZfLJTahfMsj2RMt5aXdEubZPtwej3kFhfo4dKHIlW9vqwKmYQq1C43mH2y1OVjDC/RzZIAoT/G5ppQYjGLSaR0IV7Lvag9CFWlPn3D1MziGTiVE/NjYoEPiqSEdczHEQWcA/PkrwQV9cM+aS9H/8+VZzhvFyyJhTVNg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ad460e-f2f5-4186-eca6-08df051b837c
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7554.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 15:46:23.9342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eWC4NlAc0Wnt8M7mSdd4zE7/YQqAqrfcY7NJhGuojfeEABxp7ntgx4XiyNUi2327FYqp0eUjUDrBADODjxT9RVnxodeAIFo/+94Cqq+AqsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7330
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


On 8/13/2026 5:30 PM, Chaitanya Kumar Borah wrote:
> Add bandwidth check to determine whether a given audio sample rate and
> channel count can be carried within the hblank period for HDMI TMDS mode.
>
> Use this check to prune unsupported sample rates from each SAD in the
> ELD during intel_audio_compute_config(). SADs with no remaining
> supported rates are removed entirely.
>
> Sample rates are pruned rather than channel counts, since compressed
> formats (e.g. AC-3) are associated with specific channel counts.
>
> v2:
>   - Use DIV64_U64_ROUND_UP() instead of DIV_ROUND_UP_ULL() to avoid
>     do_div() truncating the 64-bit divisor to 32-bit, which caused
>     audio_packets_line to be wildly inflated and all SADs to be pruned.
>   - Guard intel_audio_hdmi_eld_compute_config() against HDMI FRL modes.
>     (Remove it when BW calculations for FRL are added.)
>
> v3:
>   - Rebase
>
> v4:
>   - Rework SAD removal into a single-pass, two-pointer compaction
>     instead of memmove-ing the tail on every removal. (Jani)
>
> BSpec: 68944
> Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>
> Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Assisted-by: GitHub-Copilot:claude-opus-4.6
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_audio.c | 156 +++++++++++++++++++++
>   1 file changed, 156 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
> index eae76e961105..9eb6867fa3f3 100644
> --- a/drivers/gpu/drm/i915/display/intel_audio.c
> +++ b/drivers/gpu/drm/i915/display/intel_audio.c
> @@ -39,6 +39,7 @@
>   #include "intel_display_types.h"
>   #include "intel_display_wa.h"
>   #include "intel_dp.h"
> +#include "intel_hdmi.h"
>   #include "intel_lpe_audio.h"
>   
>   /**
> @@ -697,6 +698,158 @@ static void ibx_audio_codec_enable(struct intel_encoder *encoder,
>   	mutex_unlock(&display->audio.mutex);
>   }
>   
> +static bool hdmi_audio_rate_supported(const struct intel_crtc_state *crtc_state,
> +				      int available_tmds,
> +				      int audio_rate, int channels)
> +{
> +	const struct drm_display_mode *mode = &crtc_state->hw.adjusted_mode;
> +	int pixel_clk_max_hz;
> +	int audio_pkt_factor;
> +	u64 audio_pkt_rate_x4_x1000;
> +	int audio_packets_line;
> +	int hblank_overhead;
> +	int required_tmds;
This can be names as hblank_audio_min the HDMI spec, and bspec both 
mention this to denote required tribytes
> +
> +	/*
> +	 * Part 2: Calculate TMDS clock cycles required for Audio Bandwidth
> +	 *
> +	 * Step 1: pixelclk_max = nominal_pixel_rate * (1 + 0.5%)
> +	 * crtc_clock (kHz) * 1000 * 1.005 = crtc_clock * 1005 (Hz)
> +	 */
> +	pixel_clk_max_hz = mode->crtc_clock * 1005;
> +
> +	/*
> +	 * Steps 3-4: Audio Packet Rate.
> +	 *   R_AP = (audio_rate * AP + 2 * acrrate_max) * (1 + 1000 / 1e6)
> +	 *        = (audio_rate * AP + 2*1500) * 1.001
> +	 *
> +	 * AP = 0.25 (2ch) or 1.0 (3-8ch); acrrate_max = 1500 Hz (max ACR
> +	 * packet transmission rate per HDMI spec)
> +	 *
> +	 * Scale by 4*1000 to stay integer:
> +	 *  x4: eliminates AP=0.25 -> audio_pkt_factor=1(2ch) or 4(3-8ch),
> +	 *      scaled acrrate_max: 2 * 1500 * 4 = 12000
> +	 *  x1000: eliminates 1.001 -> *1000*1.001 = *1001
> +	 *
> +	 * R_AP * 4 * 1000 = (audio_rate * audio_pkt_factor + 12000) * 1001
> +	 */
> +	audio_pkt_factor = (channels <= 2) ? 1 : 4;
> +	audio_pkt_rate_x4_x1000 = (u64)(audio_rate * audio_pkt_factor + 12000) * 1001;
> +
> +	/*
> +	 * Steps 2+5-6: Audio packets per line.
> +	 *   AudioPackets_Line = CEIL[R_AP * htotal / f_pixelclk_max]
> +	 *
> +	 * With audio_pkt_rate_x4_x1000 = R_AP * 4 * 1000:
> +	 *   = CEIL[audio_pkt_rate_x4_x1000 * htotal / (4 * 1000 * pixel_clk_max_hz)]
> +	 */
> +	audio_packets_line = DIV64_U64_ROUND_UP(audio_pkt_rate_x4_x1000 * mode->htotal,
> +						(u64)4 * 1000 * pixel_clk_max_hz);
> +
> +	/*
> +	 * Steps 7-9: Hblank overhead.
> +	 * Standard:  2*dip_guardband + 2*control_period + video_guardband
> +	 *          = 2*2 + 2*12 + 2 = 30
> +	 * HDCP 1.x:  rekey_period + dip_guardband + control_period + video_guardband
> +	 *          = 58 + 2 + 12 + 2 = 74
> +	 *
> +	 * Always use HDCP 1.x worst case (74) since HDCP can be toggled
> +	 * via fastset without compute_config.
> +	 */
> +	hblank_overhead = 74;
> +
> +	/*
> +	 * Step 10: Required TMDS cycles for Audio.
> +	 *  32 TMDS clock cycles per audio packet.
> +	 *   Hblank_audio_min = 32 * AudioPackets_Line + Hblank_overhead
> +	 */
> +	required_tmds = 32 * audio_packets_line + hblank_overhead;
> +
> +	/*
> +	 * Part 3: audio supported if Hblank_audio_min <= TB_blank and
> +	 * audio packets per line <= Maximum allowed packets per line (18)
This can be a macro HDMI_TMDS_AUDIO_PACKETS_LINE_MAX

> +	 */
> +
> +

The extra blank line can be removed.


> 	return required_tmds <= available_tmds && audio_packets_line <= 18;
> +}
> +
> +static void intel_audio_hdmi_eld_compute_config(struct intel_crtc_state *crtc_state)
> +{
> +	static const int sad_freqs[] = {
> +		32000, 44100, 48000, 88200, 96000, 176400, 192000
> +	};
> +	const struct drm_display_mode *mode = &crtc_state->hw.adjusted_mode;
> +	int hblank = mode->htotal - mode->hdisplay;
> +	int bpc = crtc_state->pipe_bpp / 3;
> +	int ycbcr_420_divider = (crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420) ? 2 : 1;
> +	int available_tmds;
> +	u8 *eld = crtc_state->eld;
> +	int mnl = drm_eld_mnl(eld);
> +	int sad_count = drm_eld_sad_count(eld);
> +	int src, dst = 0;
> +
> +	/* Only applies to HDMI TMDS, not FRL */
> +	if (intel_hdmi_is_frl(crtc_state->port_clock))
> +		return;

This can be dropped as of now we do not have FRL support. As we get FRL 
support, we shall use appropriate check here.


> +	/*
> +	 * Part 1: Calculate available TMDS clock cycles (TB_blank).
> +	 *
> +	 * TB_blank = CEILING[hblank * K_CD / K_420]
> +	 *
> +	 * K_CD = 1 for YCbCr4:2:2, bpc / 8 otherwise.
> +	 * K_420 = 2 for YCbCr4:2:0, 1 otherwise.
> +	 * Rearranged: CEILING[hblank * bpc / (8 * K_420)]
> +	 *
> +	 * TODO: As and when support for YCbCr4:2:2 is added, set bpc = 8
> +	 * to achieve K_CD = 1
> +	 */
> +	available_tmds = DIV_ROUND_UP(hblank * bpc, 8 * ycbcr_420_divider);
> +
> +	/*
> +	 * Walk all SADs once, keeping the ones with at least one supported
> +	 * rate and compacting them down to a contiguous [0, dst) range.
> +	 */
> +	for (src = 0; src < sad_count; src++) {
> +		int src_offset = DRM_ELD_CEA_SAD(mnl, src);
> +		int channels = (eld[src_offset] & 0x7) + 1;
> +		u8 freq_mask = eld[src_offset + 1];

Hmm can we use : drm_eld_sad_get() this takes struct cea_sad *cta_sad as 
input parameter and fills it.

we can then use cta_sad.channels and cta_sad.freq for max channels and 
freq_mask.

Overall the direction of the change looks good to me.


Regards,

Ankit

> +		u8 new_freq_mask = 0;
> +		int bit;
> +
> +		for (bit = 0; bit < 7; bit++) {
> +			if (!(freq_mask & BIT(bit)))
> +				continue;
> +			if (hdmi_audio_rate_supported(crtc_state, available_tmds,
> +						      sad_freqs[bit], channels))
> +				new_freq_mask |= BIT(bit);
> +		}
> +
> +		if (!new_freq_mask)
> +			continue;
> +
> +		eld[src_offset + 1] = new_freq_mask;
> +
> +		if (dst != src)
> +			memmove(&eld[DRM_ELD_CEA_SAD(mnl, dst)],
> +				&eld[src_offset], 3);
> +		dst++;
> +	}
> +
> +	/* Clear the now-unused tail */
> +	if (dst != sad_count)
> +		memset(&eld[DRM_ELD_CEA_SAD(mnl, dst)], 0, (sad_count - dst) * 3);
> +
> +	sad_count = dst;
> +
> +	/* Update SAD count in ELD header */
> +	eld[DRM_ELD_SAD_COUNT_CONN_TYPE] &= ~DRM_ELD_SAD_COUNT_MASK;
> +	eld[DRM_ELD_SAD_COUNT_CONN_TYPE] |= sad_count << DRM_ELD_SAD_COUNT_SHIFT;
> +
> +	/* Recalculate baseline ELD length (in dwords) */
> +	eld[DRM_ELD_BASELINE_ELD_LEN] =
> +		DIV_ROUND_UP(drm_eld_calc_baseline_block_size(eld), 4);
> +}
> +
>   static
>   bool intel_audio_needs_cpu_transcoder_id(const struct intel_crtc_state *crtc_state)
>   {
> @@ -725,6 +878,9 @@ bool intel_audio_compute_config(struct intel_encoder *encoder,
>   	BUILD_BUG_ON(sizeof(crtc_state->eld) != sizeof(connector->eld));
>   	memcpy(crtc_state->eld, connector->eld, sizeof(crtc_state->eld));
>   
> +	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI))
> +		intel_audio_hdmi_eld_compute_config(crtc_state);
> +
>   	crtc_state->eld[6] = drm_av_sync_delay(connector, adjusted_mode) / 2;
>   	mutex_unlock(&connector->eld_mutex);
>   
