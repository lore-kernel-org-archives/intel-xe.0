Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AEFCD37B5
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 07:50:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA2610E0F6;
	Mon, 11 May 2026 07:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZIL0HsHc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3803910E0F6
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 07:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778485802; x=1810021802;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qfz4k2VNpsQwBrIftQL6y+3RN3AGvQcLpUiBE7PHw/c=;
 b=ZIL0HsHcqI0kbmKxSRl3JBrFLj49/fheFQ0bHWNvxvP/+KyyvncAn/ge
 F1OluIJxtHMmH8LLKtjjHcgNCoT8GAPJEZ3Jiat9GUY+LDrtCfOzB8vjK
 cF1kjJlndudifjf6F/RSeORM+X0hs16jWUw9bnBfX9teAi1BPCZqWTeIC
 9nY2Yo8FevQcDb8PgulrPytQCVMuLrAymfN4JzaFfbbEnq+w7gfk1wbsa
 ro3+JRYWyqEwlK6NUtlkeCbVM0L014ztAeUzEA6C4nMO3jSymW6IMZeKT
 PlwIzRvDV3TjMNqIP/zgTZd0yRSvFXT6M+Dnx5yRr91lkGaPPLyIzMKUK w==;
X-CSE-ConnectionGUID: LxOlmVhQRgqDkqK745rqtw==
X-CSE-MsgGUID: PC/QwX78SXaPNUR9BlZbXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="104825137"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="104825137"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 00:50:02 -0700
X-CSE-ConnectionGUID: OOZ2EYsGRRuMLhhLHM0ejg==
X-CSE-MsgGUID: hxr76PGOSmmelKSnxsTsCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="242348709"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 00:50:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 00:50:01 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 00:50:01 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 00:50:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iE/XS9p86u/lf07ZZFSffAFNMBDhVSNRTAN7ECxap90+gPTghIj+Mwf7snhYFGa5a0Ftd1MNyKYoa7QsZPi98TLP4YsPr3GOMyDPwYoOMOVaIVyPivwqnPgkGweEM0EG4KNvQb+zp8oHa14pVUaV4HtBXOvqHkYpfpWBnPl0oIlsXmC/GFQPauW2k8RtNCz0eHfiwyGPrBacgrE3kJi4jCzLdhLIVu/qq/N4SaOpKtFyB4dO2FLnB4TVOm7zbM6Oe60YHyjZov+dwyYOolBQDthrmusGLQW6T1lrWM9Co8fFhv3GqU9EEFAcdgsEY/FgHfYdIKfgt50dM9E3njT3kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkxjIrBHC2qswiOwQP9fCssvIynUPGu29ezj8ySShAE=;
 b=ALUWLoxtWP7+g/VARC1nTlPahelgGZe1ydFrIFqWECFO4TvsrGe5QLKs29IicnTm1IZ//w34PFkFyXI3OcCaovSQpABfr46Hl+4fG0JI0fBxJ65YwB/P/ffPjvgbf2radNBRzKDPwI4nWRzNznz7L5PGWWDHghuyoLn6gAtgtgO6WoUPuRPPXxQ9+K2tWA9sxE2LtKbdpypK2mtQqoHlgFkh6QfYrhDUD0vOR+JAc5Vxi58SVn29oAK4VSLs+kISQoheyyqWCM6eCJwCSUYhsX+p2/JViuQqhIhgUWddg2zo8kOMwCgieM8SvkrowIEGWqc9Vzy+6gjgAMP1sagxaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB6748.namprd11.prod.outlook.com (2603:10b6:510:1b6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.15; Mon, 11 May 2026 07:49:57 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 07:49:57 +0000
Message-ID: <76d2e4b8-df28-4e2c-974f-55df7e2d350f@intel.com>
Date: Mon, 11 May 2026 13:19:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] drm/xe/xe_ras: Add helper to clear error counter
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260504065614.3832331-8-riana.tauro@intel.com>
 <20260504065614.3832331-11-riana.tauro@intel.com>
 <c4df83de-8203-4b2d-b0f8-c8076fcadac6@intel.com>
 <be71197e-7cb1-4ded-b9b4-3e4b2ac200b4@intel.com>
 <50cb3787-6763-4673-a29e-b7c347a3bb75@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <50cb3787-6763-4673-a29e-b7c347a3bb75@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0025.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB6748:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f7ab835-840c-47d1-7e8c-08deaf31e571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|3023799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: adCUFBVgYCuONtoTPRAzw4Qy1HGSfykCGpnT+rlLxuTpjAXPsz0nzrD4m0cpa966lrHbf11rMFn59Ib1vOQ65LpUtkZa3TQ8KIkGN5OeISwf7dJRqhqG+4eE1UmppsP80ebMOsVMEannYjs7u2ppGe7CEyftSYt2uBgbxmcoTuF0N9/JJ7fQFBYElO3qztgaTY1a8GgdpXuH79i9eAxhazwGg/RR4Zqup9IEiog0m/YP1komXSBLUM1mUWgoXqbhTYd8bTtdcmDIJqSK6QJrWCREn0/pfrS59H7114FJZo/0JbJiJbfNyxiF3zYbc6pu10w/hyqo5BNv2K8+Zb0rCVZ605m0K/rqlS5hNDTIQ1YfAj5lrJ2u2AdhRJP3B4FaS03d5LLLyzhEyKH0ARX/PeqescUoqjAkgdK7e7AxmQBE9N6zRuL3x2+bGgIZsiPY+wQkxmrF7n0Z7SQPuKoDJtLuO0SmHJCrJBsulw0D2ikoJiKziepGUeJTpnllenblmq+JCN7d91xFH8jPFfBLUO9F3lxAY8vtVU2yTfKoXpM7VDrkufSY6EIoZ3+fzBrEewGX1Dy0mNlHSGzT5MMxP1uspI97pzG0HGOHopQOkwXvjXfQogaNXsYPnaO7lC0c3tL6++sSV+wuDwNqkVtMhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(3023799003)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWtYbkpNSSs0YXNNUmdSRmZHSGdSMjFXRUhNS0xxS2N2MDhwRm1NNkJGdTgx?=
 =?utf-8?B?VWszNmhmZEw4ZEhyclVqUEVGeWQya01IZHFVYzZrYkxrS0lpRzltZ20wQnRj?=
 =?utf-8?B?R1JIN3IwdGhEZFkxaUNWQStLek5kdCtUVWlDdFBLZWtyeUUrS1FYdGFBUzlR?=
 =?utf-8?B?eGdGT2QzZFJPRWJPL2JPb21Md20yMDdKVnFmK1BiRkNScVVqMjJ6SzB1UWZw?=
 =?utf-8?B?YkxpL25lMVdvajJWbzFBSUJ4Y0RSaTczUFhCSGx3ZXZFSGFyVzFWUWVrMUlH?=
 =?utf-8?B?S0t6SWszakZwRVJKU3UzUnBuQzl1VFI0aHAwYzhHcjVYcHlWMFJrc21rb2ZN?=
 =?utf-8?B?Y3l5OFJ3SmZWWXhPck85Vkg0YWEzVkFxQUhqOHhLZTM3TjdDRDFKRE9jNTRV?=
 =?utf-8?B?ai9OM3RkZFRHZEQ1TVVoUlc2bUlCZldZSlV0cEg0Q3pReGhtZnNCQ3pXQUtI?=
 =?utf-8?B?QU5nN0dTN0VTUkIxMjgwbW9lenAvek1OMldPNXUzbjBFTU9ibVJteG96RU11?=
 =?utf-8?B?RUM2Q0t1Y0IrTzhUblVRQlppcVN0Yis2VFcwOUlSeDhEcGVkTlF0bW4zTjM5?=
 =?utf-8?B?Y04wWWEzTmtwdHNmOGV3bTdxWHVzRFZLNGRXR3o0dmdMNktIRk91K0xUQitt?=
 =?utf-8?B?VFZqMGlQOS83cEJDUlVINnd2cnFhS2ZTb2p1SjBmaUR3MWgxMmpUN0p4K0xY?=
 =?utf-8?B?ckNHRTdmZkV4alhmUkswZG02OENlNC9nYVdtTFB5elRibFo5ZC9BRlNWQ3h6?=
 =?utf-8?B?Mkw4ODljdWhneU1VQzI5cFJrc3lScklDZXNJTzN0ODcydG1CbXQwVW9kbmxp?=
 =?utf-8?B?Y2kzb3B2M2lneDdabFExQVpNSjFLdDVmYUZSTzh5bkMyU2JHVFJTVWFTWHR5?=
 =?utf-8?B?QjlOZEdwZ3VCTjMvUXRHaWFwSng3Zy9TZFJhMTdVL2NLRlY4Mnd4R2JJZnVU?=
 =?utf-8?B?NFdsSmRpa0lxUGFCUlp5TWN1NnJGbGNQd1NvUWczRlozbzBFaytwTER0VTM1?=
 =?utf-8?B?cGdyMVExZXVqS21vdHlrb0tZQXFOWm96NE1ud0haeTFZdm15c0tFZ3d3b2RF?=
 =?utf-8?B?MTVSd3R5NFFnUnFIeEZJMjVvdElpZ0dyRExEdTMzQ084OXpsaWFJNUZiQUZt?=
 =?utf-8?B?ai9VU25qTzdiT2hyYnNzWHU0dDBoUWJkL25PaWp2MEFtWDdZU0ZVcXVaUnFN?=
 =?utf-8?B?bDFMd3RUN25ZM29Cd3BMck4rZ1VNZitGeXBheHJBMldkN1Jzb2FDbEpzWWYr?=
 =?utf-8?B?VDJUVVhhR3pGN0JGejlOTDRSSzJVb2Z4RkZnOTJBUDFuUnZxV21rVGl2MlJk?=
 =?utf-8?B?aGZkTVlKSFk4bUEzUWdEUDdaU2ZIS2NVYW5yVW1ScEprYnpRYkg4UWRFazJt?=
 =?utf-8?B?dnhYZExGa0J3djFQb2srdXdGSWFhMzhvQUZJcENqUW9rWnlVVnY5WUZoZlNS?=
 =?utf-8?B?aEpzcEFBb0VVcUNEV04xNWN6N0srSnFWc0JwYitlcXNEMVJVV09zcVZmUnBY?=
 =?utf-8?B?eVdFSlVXZ1RXbUc2RmxXWEVKL0tzV3ZGWVlpRGZYa1M3TVF2cms5QTV1cjY0?=
 =?utf-8?B?QnZ5L2lQRW9rTUxmVk5HTk1CeDVKdFh4d01XOU0yNUUwWHI3OVZnMlAwQ2Uw?=
 =?utf-8?B?Zmc3dUVMWUFUTktnanRZZVd6Vml4TnJ2N3pUVFVqQ3dDQWUxOURkTUxlM2tr?=
 =?utf-8?B?d0JyWnkvWVR4YXRwOUUzeWNkVklUdlN6L3JMUkUzWWU0ZnBrR0xRd0trSWcr?=
 =?utf-8?B?bklwbVNDOG1HditKQkJEVzJLOXo2Qk1iTXQySm9lcnNud1Nja1Qvby82YVFO?=
 =?utf-8?B?Y2RibDEzMnozZngzZUNvTUJscis5K2x3cWcwRnVkb1hJUWMxVjR0SngxWnB1?=
 =?utf-8?B?SHhFVERzdWdicHVoUzNtU0MrRVNrK1M4dVBvSjZmSS9hcXM2c3Jubk1mRGJC?=
 =?utf-8?B?ckloTVRPZTFpK3lPUmZ4UWhUZGU2emNlS0J1ZThDYTNDak9vcWxTUkVkamRz?=
 =?utf-8?B?dFRvdFB3dzJNUzU5eVhTeFdwUldFUkF0eVc5S0RKL2ZGVW11YmhTSU0wcGZO?=
 =?utf-8?B?aW5mSG5yazRCbUUzdU5sU0NueFRLNjN5VWN1RnlHRnlRZEpzcHN5MjZXQ3Nl?=
 =?utf-8?B?R09uNGxCb3dyNnA5UGM5KzRpeXZoMjdIS1BwQzVWbXlZQlVMV2JSMHNHenF0?=
 =?utf-8?B?ZEZENHVPTFFWQnMvdnYzbE8wM3BJWHJYQWF3OHU2WFVXZFd3NkFJTXRBMTFn?=
 =?utf-8?B?RklxcFZKTU45d3hyTWFGblNWWlhDd2dNV2lxUWM0UWs5ZGZpdFhXQTRtbUwv?=
 =?utf-8?B?RkZVZTQrUkVGcTNYL282TmNSQm10M01TSDFzRVBYTElGRUsvYVlCZz09?=
X-Exchange-RoutingPolicyChecked: gjNCVHGUSrorq7DvYHnquh1GKPeHV1TZRczBJ5lLa0GooeVjlI+9O/CGn/P9WespF//dNpwECttNL+VbdaPeSwGCBB0ytLRZIC2ZbrTwZgfqUU0veldeOHkUzH3MNrraW3N9Cy1kbNUkutuhmb6xpHQREiX/s6ndTQxL3K/GfXDjbIboseGAJNCkuFbjo5d/tKaEdwi0GFxclixp4cmpyJSdKAhJzpVxO1X6MBWnaZVi8xMHNGNAKebRwJO4e7+zUTbWogq2XvLxkqcMGMr+VlEf6xzCyWqwekjqZzMkHYipfAH8AHYHEQos1AZ0C3/Tf5pumThKTJdtLlIXPz7Rvw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f7ab835-840c-47d1-7e8c-08deaf31e571
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 07:49:57.2578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j9MK31XIWhqsWXpGIkkPmCTOzELzwoYo+gx3GpJbuWd9xMAzvPqfYvKBrpSMs1AchkIN24Pb4Tskntpfn7mfdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6748
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


On 5/11/2026 1:12 PM, Mallesh, Koujalagi wrote:
> Hi Riana,
>
> On 11-05-2026 11:50 am, Tauro, Riana wrote:
>> Hi Mallesh
>>
>> On 5/8/2026 1:20 PM, Mallesh, Koujalagi wrote:
>>>
>>> On 04-05-2026 12:26 pm, Riana Tauro wrote:
>>>> Add structures and helper function to clear error counter value.
>>>>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>> v2: add status codes (Aravind)
>>>>      fix log message
>>>>      squash structure patch (Raag)
>>>>
>>>> v3: rename function
>>>>      add comma to enum members to avoid
>>>>      redundant churn
>>>>      align with tabs (Raag)
>>>>
>>>> v4: rebase
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_ras.c                   | 76 
>>>> +++++++++++++++++++
>>>>   drivers/gpu/drm/xe/xe_ras.h                   |  2 +
>>>>   drivers/gpu/drm/xe/xe_ras_types.h             | 25 ++++++
>>>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  2 +
>>>>   4 files changed, 105 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>>> index 47a58ce3b3ca..07f6837694e7 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>>> @@ -34,6 +34,17 @@ enum xe_ras_component {
>>>>       XE_RAS_COMP_MAX
>>>>   };
>>>>   +/* RAS response status codes */
>>>> +enum xe_ras_response_status {
>>>> +    XE_RAS_STATUS_SUCCESS = 0,
>>>> +    XE_RAS_STATUS_INVALID_PARAM,
>>>> +    XE_RAS_STATUS_OP_NOT_SUPPORTED,
>>>> +    XE_RAS_STATUS_TIMEOUT,
>>>> +    XE_RAS_STATUS_HARDWARE_FAILURE,
>>>> +    XE_RAS_STATUS_INSUFFICIENT_RESOURCES,
>>>> +    XE_RAS_STATUS_UNKNOWN_ERROR
>>>> +};
>>> Add XE_RAS_STATUS_MAX right
>>>> +
>>>>   static const char *const xe_ras_severities[] = {
>>>>       [XE_RAS_SEV_NOT_SUPPORTED]        = "Not Supported",
>>>>       [XE_RAS_SEV_CORRECTABLE]        = "Correctable Error",
>>>> @@ -53,6 +64,16 @@ static const char *const xe_ras_components[] = {
>>>>   };
>>>>   static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>>>>   +static const int ras_status_to_errno_map[] = {
>>>> +    [XE_RAS_STATUS_SUCCESS]            = 0,
>>>> +    [XE_RAS_STATUS_INVALID_PARAM]        = -EINVAL,
>>>> +    [XE_RAS_STATUS_OP_NOT_SUPPORTED]    = -EOPNOTSUPP,
>>>> +    [XE_RAS_STATUS_TIMEOUT]            = -ETIMEDOUT,
>>>> +    [XE_RAS_STATUS_HARDWARE_FAILURE]    = -EIO,
>>>> +    [XE_RAS_STATUS_INSUFFICIENT_RESOURCES]    = -ENAVAIL,
>>>> +    [XE_RAS_STATUS_UNKNOWN_ERROR]        = -ENODATA
>>>
>>> Are ENAVAIL(No XENIX semaphores available)/ENODATA(No data 
>>> available) correct errno choice?
>>
>> This is the closest error code i could find. Let me know if you have 
>> any suggestions.
>
> We can use (suggestion):
>
> [XE_RAS_STATUS_INSUFFICIENT_RESOURCES] = -ENOSPC


I took the reference from one of the kernel source file and used -ENAVAIL
mc-sys.c - drivers/bus/fsl-mc/mc-sys.c - Linux source code v7.0.5 - 
Bootlin Elixir Cross Referencer

<https://elixir.bootlin.com/linux/v7.0.5/source/drivers/bus/fsl-mc/mc-sys.c#L55>Already 
using EIO for hardware failure. Won't be able to differentiate


> -"No Space left": Standard kernel convention for "resource exhausted"
>
> [XE_RAS_STATUS_UNKNOWN_ERROR]          = -EIO,
>
> - "I/O error": Catch all firmware/hardware failure.
>
>>
>>>
>>>> +};
>>>> +
>>>>   /* Mapping from drm_xe_ras_error_component to xe_ras_component */
>>>>   static const int drm_to_xe_ras_component[] = {
>>>>       [DRM_XE_RAS_ERR_COMP_CORE_COMPUTE]    = 
>>>> XE_RAS_COMP_CORE_COMPUTE,
>>>> @@ -70,6 +91,13 @@ static const int drm_to_xe_ras_severity[] = {
>>>>   };
>>>>   static_assert(ARRAY_SIZE(drm_to_xe_ras_severity) == 
>>>> DRM_XE_RAS_ERR_SEV_MAX);
>>>>   +static int ras_status_to_errno(enum xe_ras_response_status status)
>>>> +{
>>>> +    if (status > XE_RAS_STATUS_UNKNOWN_ERROR)
>>>> +        status = XE_RAS_STATUS_UNKNOWN_ERROR;
>>>> +
>>>
>>> Check status against XE_RAS_STASTUS_MAX, if it failed log in and 
>>> provide -EIO and return.
>>
>>
>> Why? Unknown error makes sense too right? Any error above the enum 
>> range is unknown.
>
> Out of range status, we are clamping it silently (Unknown error). We 
> need to log it (status) immediately which make sense to debug issue.
>

Makes sense. I can add a dbg log here

Thanks

Riana


>
> Thanks,
>
> -/Mallesh
>
>> Thanks
>> Riana
>>
>>>
>>> Thanks,
>>>
>>> -/Mallesh
>>>
>>>> +    return ras_status_to_errno_map[status];
>>>> +}
>>>>   static inline const char *sev_to_str(u8 severity)
>>>>   {
>>>>       if (severity >= XE_RAS_SEV_MAX)
>>>> @@ -182,3 +210,51 @@ int xe_ras_get_counter(struct xe_device *xe, 
>>>> enum drm_xe_ras_error_severity seve
>>>>       guard(xe_pm_runtime)(xe);
>>>>       return get_counter(xe, &error_class, value);
>>>>   }
>>>> +
>>>> +/**
>>>> + * xe_ras_clear_counter() - Clear error counter value
>>>> + * @xe: xe device instance
>>>> + * @severity: Error severity level to be cleared
>>>> + * @error_id: Error component to be cleared
>>>> + *
>>>> + * This function clears the value of a specific error counter 
>>>> based on
>>>> + * the error severity and component.
>>>> + *
>>>> + * Return: 0 on success, negative error code on failure.
>>>> + */
>>>> +int xe_ras_clear_counter(struct xe_device *xe, enum 
>>>> drm_xe_ras_error_severity severity,
>>>> +             u32 error_id)
>>>> +{
>>>> +    struct xe_ras_clear_counter_response response = {0};
>>>> +    struct xe_ras_clear_counter_request request = {0};
>>>> +    struct xe_sysctrl_mailbox_command command = {0};
>>>> +    struct xe_ras_error_class *error_class;
>>>> +    size_t rlen;
>>>> +    int ret;
>>>> +
>>>> +    error_class = &request.error_class;
>>>> +    error_class->common.severity = drm_to_xe_ras_severity[severity];
>>>> +    error_class->common.component = 
>>>> drm_to_xe_ras_component[error_id];
>>>> +
>>>> +    prepare_ras_command(&command, XE_SYSCTRL_CMD_CLEAR_COUNTER, 
>>>> &request, sizeof(request),
>>>> +                &response, sizeof(response));
>>>> +
>>>> +    guard(xe_pm_runtime)(xe);
>>>> +    ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>>>> +    if (ret) {
>>>> +        xe_err(xe, "sysctrl: failed to clear counter %d\n", ret);
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    if (rlen != sizeof(response)) {
>>>> +        xe_err(xe, "sysctrl: unexpected clear counter response 
>>>> length %zu (expected %zu)\n",
>>>> +               rlen, sizeof(response));
>>>> +        return -EIO;
>>>> +    }
>>>> +
>>>> +    ret = ras_status_to_errno(response.status);
>>>> +    if (ret)
>>>> +        xe_err(xe, "sysctrl: clear counter command failed with 
>>>> status %d\n", ret);
>>>> +
>>>> +    return ret;
>>>> +}
>>>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>>>> index 74582c911b02..bbb9d42bd128 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ras.h
>>>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>>>> @@ -15,5 +15,7 @@ void xe_ras_counter_threshold_crossed(struct 
>>>> xe_device *xe,
>>>>                         struct xe_sysctrl_event_response *response);
>>>>   int xe_ras_get_counter(struct xe_device *xe, enum 
>>>> drm_xe_ras_error_severity severity,
>>>>                  u32 error_id, u32 *value);
>>>> +int xe_ras_clear_counter(struct xe_device *xe, enum 
>>>> drm_xe_ras_error_severity severity,
>>>> +             u32 error_id);
>>>>     #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h 
>>>> b/drivers/gpu/drm/xe/xe_ras_types.h
>>>> index 74d85875cd63..44369fc8ef03 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>>>> @@ -100,4 +100,29 @@ struct xe_ras_get_counter_response {
>>>>       u32 reserved1[56];
>>>>   } __packed;
>>>>   +/**
>>>> + * struct xe_ras_clear_counter_request - Request for clearing an 
>>>> error counter
>>>> + */
>>>> +struct xe_ras_clear_counter_request {
>>>> +    /** @error_class: Counter class to be cleared */
>>>> +    struct xe_ras_error_class error_class;
>>>> +    /** @reserved: Reserved for future use */
>>>> +    u32 reserved;
>>>> +} __packed;
>>>> +
>>>> +/**
>>>> + * struct xe_ras_clear_counter_response - Response after clearing 
>>>> an error counter
>>>> + */
>>>> +struct xe_ras_clear_counter_response {
>>>> +    /** @error_class: Counter class that was cleared */
>>>> +    struct xe_ras_error_class error_class;
>>>> +    /** @previous_counter_value: Counter value before clearing */
>>>> +    u32 previous_counter_value;
>>>> +    /** @clear_timestamp: Timestamp when the counter was cleared */
>>>> +    u64 clear_timestamp;
>>>> +    /** @status: Status of the clear operation */
>>>> +    u32 status;
>>>> +    /** @reserved: Reserved for future use */
>>>> +    u32 reserved[3];
>>>> +} __packed;
>>>>   #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h 
>>>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>>> index b315847cbf64..6e3753554510 100644
>>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>>> @@ -23,10 +23,12 @@ enum xe_sysctrl_group {
>>>>    * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
>>>>    *
>>>>    * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>>>> + * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>>>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>>>>    */
>>>>   enum xe_sysctrl_gfsp_cmd {
>>>>       XE_SYSCTRL_CMD_GET_COUNTER        = 0x03,
>>>> +    XE_SYSCTRL_CMD_CLEAR_COUNTER        = 0x04,
>>>>       XE_SYSCTRL_CMD_GET_PENDING_EVENT    = 0x07,
>>>>   };
