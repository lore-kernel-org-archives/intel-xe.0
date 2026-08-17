Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA62C5B572
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 17:09:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EB210E42A;
	Mon, 17 Aug 2026 17:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AH8QCnq+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76B510E42A
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 17:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786986596; x=1818522596;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xkp76XzZ8gWh4W66hD4HcOxblwlgFl7Oq2octxU1gHU=;
 b=AH8QCnq+xBjkXiK7Lh01i0In/4iY2Xq1DJDikcIC7ESLesF1pSZzSimC
 KQMsSXQxccBsbobvVILG8Cl600aWsUu3ovbJtLSL3ecYZVfWFGgERYN2o
 FPu5Es6ptg1o1AFncOsL4nFPqDJ9uXPP08bmlNt6C7mXPcFCU1o4Z1ioZ
 LNjxaGzoIbKHaij8jQntr3wvropQNuYnVQCwYvLlz8yCZhQ/18Af41+wx
 hImT5qg7WjqjsK9zsMPPaaWb2T8+1JQRcRJJmpV3FML6LNnkHOiw4u8HE
 OxKxtraWzejqjjZpFxt3JO5lP9DceoPb7PmzBkdUEmTcakwhLTBhMGK/e g==;
X-CSE-ConnectionGUID: 21mxttMJQ6yLz1pivJMHYA==
X-CSE-MsgGUID: vzg+y6xCSFGm4FxmREH3lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="110252174"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="110252174"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 10:09:56 -0700
X-CSE-ConnectionGUID: oaxRxiirSDWPDAf6ddvCCA==
X-CSE-MsgGUID: GTtwne83ReKJgeUSmxENJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="261708941"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 10:09:55 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 10:09:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 17 Aug 2026 10:09:54 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.36) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 10:09:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TkhEg1q7rAbQIN0su34Cunh8oDWTFGW1BK2GOGstn6VX1UOt8KxmrZV3Q7HjEPHksK0V2K7TImFXx74Q/q+TDuuHphgRKvdXlvhopo49Ore67OSJzIJHtZDFbjetYL1CsC0qfB2C6haUvhdk18Z5wpDfzl9c0AcPrpqH5gOyqBFM7Es2VJSAWqsp2Ku+Xt8ImWyRpDBXQwbUHairDYWYX5TEFCaVhE/Ic3XWHuSvU2oMvFm+yoHQH0vaznO/z8NpbtwwLFUMOtNHvI0Ytrzx9a4Ur5YT1cqBk9xExK9XrBIWW5P2QceJawoobuW3/5VQxbzJuamPBxjpYgmFGsg7Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBY4Uz7mUD21qtle2mSRA5pDtPByO93iWtj59U05vXE=;
 b=k06vyfKDXAvxHyg41VBh2/h9/vbuZHZZW0LukWwUTW+uzsaIss9JkkM12ivH/YABGKabVkGTTqGey12NE28odQCQqS2L5EeFPzjlzTUb9J6LVODBlS/iZWpLiYUiKCjNxosGfqLS0s89k90WndhEtvbVAE0fi0XDzXJN0iY2tQaJmuu1/N1UGjhxOxJbJ3H8xK0nVh2tr/bgU/D15TZ4yinSe3Ilbkwz+UFnCEPSShr4lLCR89aWiswrr/3QQfzUA4/4S2SOPXiD/60GWvk8zCRejbDMUfsmhqRJ2TIAF/6HqtneJoieifseXghI0PnfObQkzvWqO1olVv7o9xfANA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by BL3PR11MB6363.namprd11.prod.outlook.com (2603:10b6:208:3b6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 17:09:50 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 17:09:50 +0000
Message-ID: <60960fcb-7aeb-4642-bd6f-ad1b6ffd2a2b@intel.com>
Date: Mon, 17 Aug 2026 19:09:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V16 10/12] drm/xe: Add sysfs interface for bad gpu vram
 pages
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
References: <20260817065055.3734576-14-tejas.upadhyay@intel.com>
 <20260817065055.3734576-24-tejas.upadhyay@intel.com>
 <a670328d-b5dc-48b4-bb02-ed7dfa2d48f1@intel.com>
 <DS0PR11MB871812022E070C0052F5AF3F81A72@DS0PR11MB8718.namprd11.prod.outlook.com>
 <aoMxh3bh1WEf8SF6@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aoMxh3bh1WEf8SF6@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0099.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::40) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|BL3PR11MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: ea47267b-440d-47cd-498e-08defc825902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|4143699003|56012099006|6133799003|11063799006|5023799004|10067099003;
X-Microsoft-Antispam-Message-Info: J5Ee+4tGYoWBWD2KlCZK7yaPS/G7TesZCnZBUaFkMWqbyWV/MrpZfE0NbuZl/ABZXk63JG2An9O73liColPsKc3/UCMGaxAF30U4MzKJZINSfXBJ46AIWoOd9Fjzm0Lkr39NIfujWG0XOYzKemPuGUjnIlbc4fEgu6VvA25eAwfgxJHwGLjFHzA457hFmonfW4f+rIslNYzOmc5y+eAhF7ULkSVVNMKzyjAe08+2eSN74Np5mnyjxd4MSd/FXL2ePWfIOgcQH2ezFQApdVb7jh1CqAWXEyDfT2liBhPBPX8RWp/QKiT66A8U00aNKq6WyzUBNTFUy70YIxTqP1B6wIYF1v+RR168C324tzZ3NU27fJzsp+wXDv8ZapQjwvocnkqEq5FrrtDEL2qNspV6pE46Qp3FC00ZCk3ocFBJ6x0AKbOJscjPwfMSw+SpBv53JCq/CMgD8d0Hryq18cthWjoxUpqoyfIeMCSVi/6MhJsynT7n8p/fMnRCmyYXh7uzmSSUiskjkNsImcBj/KifUkKGIwDqLJDwZXdzldF7e/Qyo/2un50Q64vpD9H6XsB0jnBsf/wrQvDqezt+6gsBM+K1yZz75P2EEGbJODEAiVvLCUrbfKkr5WeK6ZSsarZW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(4143699003)(56012099006)(6133799003)(11063799006)(5023799004)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTU3L2daYTFuenZRUGxGNmJzLzh1cFVDczJRcUh6eFhKNHZteE1aYTBBMDhs?=
 =?utf-8?B?TmEwVVljd1ZlZFA4L1ZBTmZ5S3hZMjhSR0QzVEVnYjdwYWR6NFRlamFSVHdI?=
 =?utf-8?B?VGpnM21DaklVeVI5Y3crajE0NTVyc2FmNkFaME1IRW1WQjBNOVdsOFphYXN5?=
 =?utf-8?B?U0Y5bTRpVGNDbW8yZ25ycEk0a1QxdCtZTUExYXRON2orRzRaZ1VzVERVT1Q1?=
 =?utf-8?B?VGFpcU5kVzJMMG5sRjJkck9McEdOc1VYZUdQK0g0Rm52S3lHT3A3ZFVPZFBE?=
 =?utf-8?B?QzlBMFZQa29mRTJQS0YvZ1dIR01yQzVxTEVqeUI2aXhtSTgrQ3Zrd05nNEpn?=
 =?utf-8?B?MUhUNzFDTkovK3dsYkgvSzRHZWxqY214N3FwOGVtakRHMCtxVHNnblFXNi91?=
 =?utf-8?B?MEFWczNqMm1xRkJpUXhtR2ZYNy9Za0pxWjF5bnFQMlNXRzlsM1FIbmNOekFt?=
 =?utf-8?B?WnZrcU5ieTFRenhxZVpMQmFiU3dCK1hQMlROWEMrU3g5eXZ0RlBESURXZlpT?=
 =?utf-8?B?ZXpKSkdZY1dvL1JCTjlNVkdqaDdzOWdDSmtqa3ZTamRmN2FMb1RsWlNKNnNm?=
 =?utf-8?B?dGxhMmVEd0lsMTRGby92aXk1TExqVURzSWUyRitNNDAyK01NcWhLTFBNd0dS?=
 =?utf-8?B?ZmZsb2pkajA0SG5aSStEKytKL1FXSHBtWWRROHFIVFdXNXR3c01PczRhTEVs?=
 =?utf-8?B?RkcyUWVvNitsWDBhYXpMaFNhbXcwQVZEZ3Z3ak01S2J5UWFESHh5K0JISzlI?=
 =?utf-8?B?RWxaUkZZNjZLWmVMNFcvYWJWamFlajRiV05mbFNsVEcvdFJOK1NNNmZvWmw3?=
 =?utf-8?B?M3BXTEZRMFc3SGErUnR6cEVpc2hOeHlNcWFyNGZhZFkzZ0NuekF1QTdWRVVk?=
 =?utf-8?B?aEpUaFNKeU1HZlpvYkNneE9jNzVuTDQyUmUySS9nbW5aVEc0SXpnOGtBaFh0?=
 =?utf-8?B?ZEdDbzF6OFE4eUM1YzRGbEN0c1dvTkFDcFpqOGZDL1RRWU5wbWxpZ1hwbmJV?=
 =?utf-8?B?dDhwTkc5ODlsUldKVloxVkxTVXJzOVUrR0ZWYTVlcDZMd3I2M1NvMFBnbXR4?=
 =?utf-8?B?Vzc1Y3gvWEZOaG41OGNDNmJpcUZIWnZ1WTBXbEpleVZjTUY5UTZCaUh1TVVD?=
 =?utf-8?B?b2xLQjRHUUwrem51MVVpRXRNcER6ZDR0bCtIOTZGRE14MVNGRHV0N1JtRWM3?=
 =?utf-8?B?RG5OeXRuWUlQeWs2SjZ6c0cwaE4vMkY2ZjE0RmV5Y2ppTEhPYkROREZhQ0Fi?=
 =?utf-8?B?a2NEc0FUR0h6V2xlL2dGZzRZd1hqSjF2WFFCVy9wNWUvMmJKNmRGaVR6cG5p?=
 =?utf-8?B?UE9uREpxdWdTdkU4bmhZRnhxeXZuNVlzbWE2SGtaOGFXbGE4L3A2ZE85Y1Yx?=
 =?utf-8?B?Um9GWWpNeHExM2ZCWDQvbk1MejErVnZibWhhQlpnQktScWxJR2tLQ25hb2VY?=
 =?utf-8?B?UUxjdjNVbm40WlhIQ1piZlpadjU4RlhqQUhpUFdsTUVDYmxJa2t3Mkk5NzZN?=
 =?utf-8?B?dElTcHlOK29CQTljdHNuaGFONUxVZ2JFeWhCb0kyV1lGUE1ydmpZR1ErKzdG?=
 =?utf-8?B?cGp2cHdGRlRuTVlFcHNVN2J3TkcwSzhLTHVnM0lGcE5IMFI0cjhuT3RGMnJE?=
 =?utf-8?B?VTlxcGJPSWFPU3ZON0pFMExiZmlYTVN3djFCZTJPeENXdjc1cXFOcnpONnhy?=
 =?utf-8?B?dVhHQkpJZFBEN3NldCtzRUdzSmFlRStYcG1hQm9Bd1FlSm5PV1dJd0w1YnAy?=
 =?utf-8?B?VEVpVEs4QkZ6UkZYNnU0SU5qRWtqdzYxNVJ5aFRMUktkWW5OS1RkYUY4ek41?=
 =?utf-8?B?TkFQb2pHSGJKTXAvY3BHZmJsTEVLbklraGlzaDUwclZ3YWxNR0FZendya0NJ?=
 =?utf-8?B?Smp4eXZkc2dKM1hHd0lNaWVYdVI2b01YOE0zQ3Q3SDlVc0ZxTTk5bEg1OGQz?=
 =?utf-8?B?N2ZyaDFQc3RsS2lRWkdtblQzTnNodkV6UTZka284NEVDdDZHV0IvRXVjOXJS?=
 =?utf-8?B?QTlMN01XdjVGNmptbkNndW5CZ3RJQ0VpVWpBNUFNbEo0RjdFM3BiMjVYbU4z?=
 =?utf-8?B?M2VTVm44dWdFeDV1OVR5akFyeFo2VjkvUklTQTBHMjNZNGVLWll5dENBdFFL?=
 =?utf-8?B?OTM1NlZxUHFCSkxwZmYrODhMTStTSlo0S0pWZHdSRWozSEJwOVRNNDJoSnhu?=
 =?utf-8?B?dFBFSEdBUVlCSFQ5VyttTkJCY2JjbzdBbU5CYVBmNHpxdTdOZ2tHZjdBOEdN?=
 =?utf-8?B?M0dLNml4ZWJmMGNJTVkzc001bE9iNG9naTJvSXBGNzRtdHdCMEVYYnA3cU9V?=
 =?utf-8?B?SEV3UTBDeXNrNHEvbUNzdGF6Yi9vZTY0cGhNRWlVczg2S25xTEgzVlZIbjZp?=
 =?utf-8?Q?2A8JQbIpYbL1hgrc=3D?=
X-Exchange-RoutingPolicyChecked: Nk/iJdy8FbBYm83Xrbd7FJ8ceP16YT+mVt0aDQLzTaSDmwHOEX7STOKkW8JFeZliTwVr/NVk6ZJLkp9gApalma4XbDtXMreFsCsya28fb66RLavLYCz81RNCYJYPKZHk6p2m8UyHjxTkeomypZtikAmrWNv7l9edmeAQ3ySOYAvuEUagFb0/Rxr2L6FMimltXhjuKMQAQgdxeL2mvDSlrCa+nMNFGJqZGzdeAkno+OVt8P/31wfiMWO/SpYq0k5NQkwRTqZJndXN09pf8W3bbooJ3sWTbJ51FpToy0n0/szkjKSRsDfBRSN+eFXg/3LbV5bsCpmk5x0JTVxSFSl9jw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ea47267b-440d-47cd-498e-08defc825902
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 17:09:50.4388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJWZZ9bGbGifa6yiMk/Dy3/hQ/RhXNzAvcQ+Nor38YXADaI+1bS3yEDTS+VLLzC/dUmhzqw382yLCkU3i7TaC8PMtSvgU4SOamzyxzUzmaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6363
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



On 8/17/2026 6:06 PM, Rodrigo Vivi wrote:
> On Mon, Aug 17, 2026 at 02:58:31PM +0000, Upadhyay, Tejas wrote:
>>
>>
>>> -----Original Message-----
>>> From: Wajdeczko, Michal <michal.wajdeczko@intel.com>
>>> Sent: 17 August 2026 16:57
>>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>>> xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Thomas
>>> Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
>>> Subject: Re: [PATCH V16 10/12] drm/xe: Add sysfs interface for bad gpu vram
>>> pages
>>>
>>>
>>>
>>> On 8/17/2026 8:51 AM, Tejas Upadhyay wrote:
>>>> Include a sysfs interface designed to expose information about bad
>>>> VRAM pages — those identified as having hardware faults (e.g., ECC
>>>> errors). This interface allows userspace tools and administrators to
>>>> monitor the health of the GPU's local memory and track the status of
>>>> page retirement. Details on bad gpu vram pages can be found under
>>>> /sys/bus/pci/devices/<bdf>/vram_bad_pages.
>>>
>>> since those new files are xe driver specific, shouldn't we refer to them using
>>>
>>> 	/sys/bus/pci/drivers/xe/<bdf>/vram...
>>>
>>>>
>>>> The format is: pfn : gpu_page_size : flags
>>>
>>> kernel documentation [1] says
>>>
>>> 	"Mixing types, expressing multiple lines of data, and doing
>>> 	fancy formatting of data is heavily frowned upon"
>>>
>>> [1] https://docs.kernel.org/filesystems/sysfs.html#attributes
>>>
>>> so to follow the guidelines maybe we expose the separate files:
>>>
>>> /sys/bus/pci/drivers/xe/<bdf>/vram_page_size		u64
>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_count	u64
>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_reserved	u64[]
>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending	u64[]
>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_failed	u64[]
>>>
>>> or
>>>
>>> /sys/bus/pci/drivers/xe/<bdf>
>>> |
>>> +-- vram/
>>>     +-- page_size	u64
>>>     +-- bad_pages/
>>>         +-- count	u64
>>>         +-- reserved	u64[]
>>>         +-- pending	u64[]
>>>         +-- failed	u64[]
>>>
>>> then
>>>
>>> /sys/bus/pci/drivers/xe/<bdf>/vram_page_size:0x1000
>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_count:5
>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_reserved:0x000000000000
>>> 0000
>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x0000000001234
>>> 000
>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x0000000001235
>>> 000
>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x0000000001236
>>> 000
>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x0000000001237
>>> 000
>>
>> Thanks for comment, this is documented format by design doc. Sysman also depending on this format. So I don’t see this can be done without design being changed for everyone.
> 
> Internal design docs don't superseed upstream documentation.
> It is the other way around.
> 
> But also, the files will be there one way or another. Both paths
> are valid, so I don't believe that change in here force changes
> in the userspace. Although, yes consistency is good...
> 
> That said, I don't have a strong feeling for one way or the other.
> 
> Since we are adding to the device level anyway, I believe it should
> be okay. But Michal, do you know any doc or any precedence that kind
> of force us to go the other way?

hmm, are we talking here about the attribute format or folder layout?

if about the latter, no strong feeling either ("files will be there
one way or another")

but if about the former, then the same documentation [1] earlier says:

	"Attributes should be ASCII text files, preferably with only
	"one value per file. It is noted that it may not be efficient
	"to contain only one value per file, so it is socially acceptable
	"to express an array of values of the same type.

and my proposal with separate files meets that expectations (there will
be either single value in the file or array of values of the same type),
opposed to original idea of array of offset:page_size:flag tuples

> 
>>
>> Tejas
>>>
>>>>
>>>> flags:
>>>>   R: reserved, this gpu page is reserved.
>>>>   P: pending for reserve, this gpu page is marked as bad, will be
>>>>      reserved in next window of page_reserve.
>>>>   F: unable to reserve, this gpu page can't be reserved due to some
>>>>      reasons.
>>>>
>>>> For example, cat /sys/bus/pci/devices/<bdf>/vram_bad_pages:
>>>>   max_pages : 10000
>>>>   0x0000000000000000 : 0x0000000000001000 : R
>>>>   0x0000000000001234 : 0x0000000000001000 : P
>>>>
>>>> The sysfs binary attribute is created under the PCI device kobject
>>>> when the platform supports it and the configfs bad_page_reservation
>>>> policy is enabled. Uses RCU-protected list traversal so reads never
>>>> block normal VRAM allocation operations.
>>>>
