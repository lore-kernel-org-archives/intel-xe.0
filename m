Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D12DEBFD1E
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 09:01:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE3510E386;
	Mon, 13 Apr 2026 09:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UlcuWIx+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9BF10E386
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 09:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776070874; x=1807606874;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z1EdG05lL0z3lUa4mYPqofiqQfo8fiTGPOonU2QKvt4=;
 b=UlcuWIx+9Kj8jp1BiaBlyX3qyuhmMiraJYyTFrjWA/YhjYe5VZga2XFh
 I7vlBuBcXTVxckZOTN+Uh3+c9NcVyCsrJ5h0YbNY6s20LpygbaHwxtNvp
 sDc+MvTvq8wt/2ZR2Fe4apxj+1hqBOwC3rUXuCoXfZnqthAZxNQ2mSLYN
 SxKIp+zUeGDL7P4cC4RhilDFVCJtgRgnUAMwhG2/5CP1zw+d9xML7dXH9
 oUT5OXLoQ2GdIag2EfvY3jyDBnmFAJ8psSp3F541Woj0IokzbG054hfZu
 vpK/3lPBmmymWLArXd189NIkEca6Rat2iFCyME5nOw37yadBoYdchldFv A==;
X-CSE-ConnectionGUID: 7meWOp90QGasVrx7dx1Dgw==
X-CSE-MsgGUID: Fi6SP6pFRfK9BHIuswiZCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="76963310"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="76963310"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 02:01:13 -0700
X-CSE-ConnectionGUID: OztGpjWlRTKAFgzTIJ9qWw==
X-CSE-MsgGUID: l4BQFUWdSAqoKiN4A/uy6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="252917798"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 02:01:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 02:01:12 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 02:01:12 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 02:01:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IH7cD0vziGqHhl27YXos6Uh0cTCrAcDUVnkqVRUdzggxsVvUswCcgCrcX676tcA4KvJc92ga9Tav5grQhWkZWGbS0Qp/FSJp5sKB+ITjM/ZwkmHT+FNxyyXcfKmEtNpL6PqrRZ9G4zx14OP5DhX51aLNZX/VXCzhk/vvdQuOR4qrdV670hPfoK/CTYaysfGKl7TdHQztGD0LzxMXGAs4JXHgxc8DBsZ0WPC1JmqiaeEkEMTGmXAdwOzPqHUzLBK+FVW8wFiZIvTjw2RSMOmZRD4jBYH6rfaS6VSLjvMaa2XGp5eUnojkCAHOvuhjJBzjqUu0VBdtiVsve/TN+x9faw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iO1+t2EL9JigRXt+wUdLIEV+SY1e1hqP0VqreRXjmk0=;
 b=jX1qkMbjyfVlwaBbBpi1IPGdgjGYokfKrmFi52YjoM33antODavO0rrxAwQUbpmAJ8Yd45x0IqJbNytSxsyGT5+ZDN05VvrrYAeFEXKeZyXEKYzzN1qrQsOjDStAThIYZuqEnxnPVNT/58jJYoSAmfvKC5pGjmh8LPgRFtdmNBG3YmB6caMGn1on9val6qa25XENvHrh3L8x3IMve2aXm1hmSGWCJEd0tH2Knn8R5liMUvkjGGUJpe39Y1SRAdz67FRV7KwyKGMkici2eKt1w0tbC95s4hjNvQF/OG44Garg40pA8gyhZPPrYxanVhEOakcK4QViuE9SGvPZv6ikBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by PH7PR11MB6032.namprd11.prod.outlook.com (2603:10b6:510:1d3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 09:01:00 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::6021:79ca:45d2:ae46]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::6021:79ca:45d2:ae46%4]) with mapi id 15.20.9818.017; Mon, 13 Apr 2026
 09:01:00 +0000
Message-ID: <4b50d8d0-a7fe-47b2-a8c6-5e9b920aac09@intel.com>
Date: Mon, 13 Apr 2026 14:30:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] drm/xe/xe_pci_error: Implement PCI error
 recovery callbacks
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
References: <20260402070131.1603828-12-riana.tauro@intel.com>
 <20260402070131.1603828-14-riana.tauro@intel.com>
 <adSNMapnJqvfswlJ@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <adSNMapnJqvfswlJ@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0143.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|PH7PR11MB6032:EE_
X-MS-Office365-Filtering-Correlation-Id: f92605f4-72cf-4d5d-6965-08de993b2ea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: v5offdJD84LzyRMB61lVdxHuxqLhPWkTKZP7kVZW3XxcQk9741xgc4wa4UHgrlYLCKBdhpjCJmx2P+m29XGaIYJLEdy8DbiIf69zJlo7SG+3aHi10mSzFwoC+tbGfpNk1QflkidOHV2sHsPMGwu6QtEModZDlzvwsQdBDUaQ7HI6yI14oELFgyL4v77rDN+5CJs1XKpfO7GBioJZoFdOIjvqJI0GDm6Hjv4sLbWQNfhuS9hlh6a/xfauMXHR5kcoxaGXRQU2Rb8i9czJWL1VlbkvdvlWIsT2QLX2kN/5cQ61H0+Xonwh+vRE5f3NhYnqQfLQ7236oS/lxtAotcY97DfOHaMuLepeJXbrRInxQ5iGGamWJhaAj+rNkw4RQk59MHbX4K3iqrxY2zh7o11NaNp8yN18M8O+Peu+bxAF2Wc77qImAEG/4E9f01t6oyopjrwHFhDP/FxXv33JONyjtaxmddeHrOzPbOi0IN9dDX/q6YOZDlwLwiV5h5JiulHLgQGXAbwDURjLdXShuYPSunzBsQuVGwhqYKqJ5KJKI9yFfI5MwD8Bo4o4i7pHi7rPMXZwWmRAwp267vEEeJYxO7dTVv6Nh+Yz0fecntgxE4//EDI+Hlg1I35Tb+nlbjSSuSWfZRSei4U7MwSuBxMjPprtv2k2wClSAujl2KRZ7iQXmW5ZdlbFCaQZIhLIsvhF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGlNcnFJN3h5V3ZLVGxiRGFaYXEwSnV0d2VXL3U0dGI5cml3MkJlcHRUWlNM?=
 =?utf-8?B?YkJjSHRDS1h1K2RFakRUdllWaU1sUldjY1liK1RYd2JPcUFLNTd0VXhZNkE3?=
 =?utf-8?B?NGFUdGFiRGQ1WW1taTduNWlYT0RpWmorSkpmdHllVWZ5Yk5jTEl6Z3ZFd2dG?=
 =?utf-8?B?N2l1N0h6cVFtQlduVndsZWs2U01aTlRkSjM0WERmeFJUN1Rab3p3emErb2Q1?=
 =?utf-8?B?UDB0Vm5kMXRlRThTOC9BTVNaY3NwRTlZTVUvQmkreW91MXZ4c0hweXBlNmxh?=
 =?utf-8?B?NGJReUxEZGE4MDE3Q0ZQUzEwNFRwVElJMDhTMStIV0JobHllTjUvTVJNeWt0?=
 =?utf-8?B?cGJPakc4eFVqTHhQQmI0V2hXNmkzZ1FvMzByUENGMTF2NEp2NnZTVG5senZN?=
 =?utf-8?B?aVpBV0VtOUJLaDhVNU95NjRmOGg3TkRCNEhFV09lcFBTYzhtK2FVdm5qbE8y?=
 =?utf-8?B?ZHU0VEI5aWt1ekJmY2NCQVBOcDJLTWhhNDNpQ0xSYkFjcFJhUmRCSTZBYXZG?=
 =?utf-8?B?cWY5Y3M4UjZIUmxhY0JhWFNLRzV5RTZpQ0E2UUJlNTlmM0ZUQlQ1Zy9jWUZZ?=
 =?utf-8?B?V1Z3VCtGN2xCbXBjYlROVjI0WUxoQklJL25SUE5IL2dtUG04WWE2RHo0MjQr?=
 =?utf-8?B?Y2J2QjIzay9lb1BESjA3NDVLbEpxVjVzL0dKYm4yUldGYytDT2E4OThXVE5P?=
 =?utf-8?B?dEhlSVFGbktxOWNoUHZGdmYwRnYwSDBrTW14cnpvRGFnRTZ0MlIzcVJHUExM?=
 =?utf-8?B?Q1hMaXB1MXh0ajBla1g3cUY2RHlBMWYrOERBQzFqTGNYU0kwM2luY0tBTDZF?=
 =?utf-8?B?M1hoZXRCM0NqSzh2eE1udENlczZwdlVpdVQ1djdFUFVGNmhGaUJiTEkxRHMw?=
 =?utf-8?B?Z2ZueUZhbWRtZXpsUlhPMm8rMmFqQkxTMFNkSE1tRFc0WTk5ZlJmRUE4aGwz?=
 =?utf-8?B?bXk5WnYrZnlOd09OZm5SS3JJT3lDUGJsaTJZSnk2Tm5DallDT2E1MExsT2NH?=
 =?utf-8?B?Zis3NjBZUTdubUFWcEhDR056NDF4R3Q2UDM2cGtHRFQ4SEF3cmJHalpEWi9z?=
 =?utf-8?B?NE5Kb0U0L25xRGNkUEhtR09TUnRobGJ2ZEE3N2RhcmRWVUJDQzE4d2NFa0ZE?=
 =?utf-8?B?NExldzRwNzk0WXVSeWh3RlJIbEhyMXd1eGUwaVprQ2RQamRjeWhaNjlxRG4y?=
 =?utf-8?B?ZHgrZUxmSE82LzNrc2VtRm4rSlBOYWc4bWtqd3hNaUFTbm8vT0tQODNXQU5H?=
 =?utf-8?B?V1dyOFJyVWVtdHBQUlJJUWFHNjlENFErdDc3Tnd6c1hOYUpob3pCaTY0Vjdx?=
 =?utf-8?B?cWpSR09ldW80bHZUblUvVWxuY1EyM1d6d1ZKVm9PeEY0cHlvREdSV2xscWgv?=
 =?utf-8?B?emk5TDRlQk1KTU9vSVpXdGl3czdXcHRJWmpJMk9lTjNyVnlrOGJNYkZXd0lH?=
 =?utf-8?B?UDZoRFlYczQwbFpwSGZ1VkhWTkE3Vi9OTjdzMW9MTEtocExUL1JXSnJYUFV4?=
 =?utf-8?B?b3FiaVQ5V0ZFY1dqdk9rNDR6empzL0drajhTVXlKWTdJTmJQVVh1WnE3SkVP?=
 =?utf-8?B?RTE4TGVCSFpEMXo5MnlpMnhEelcyYmQ5Ykh1UW5oSkhidUZGM0RPWHV1dnNk?=
 =?utf-8?B?NmVnaStWbzBzNC8wT3l0TzFIZWVuazV5UEM5N0lXMzV5RFJ6d0o5ZEsxNksz?=
 =?utf-8?B?NHVpVmpqUkErdlVnWmpsMlpnMGxjWnEyZ0twcWp3bVN4KzRxMU1TV2VzRE9Q?=
 =?utf-8?B?Y003cWlvR2pFcVdpQ2RYaHd6dkhXRXh1d2hCazBzZ3BuYWRMYTNuWkg3NzZG?=
 =?utf-8?B?QnljVzV6QVl0MmdnS01iUEFYSGxacjRoYU1nYWx5SnNubzc3L0FvaHU2bFE1?=
 =?utf-8?B?T2drZ2xBejdBaEhCblpBZit5Zk1TYk03OEVyNTY1RkkrblBDeEtMbkF3b01q?=
 =?utf-8?B?ZTFybFlZMS9ta0xPUzhaV2p5L0pFYlNNbDduOFo3ZEZpZkRLMGRPckkxVmZp?=
 =?utf-8?B?aVNXT0luT0VuQVk5K2U0Um52TTVqYTROSUtOeSt2NGEvNHJyWGgxd2R3c1hP?=
 =?utf-8?B?RzVlTnUzNHNSVjQzZTVaNkR3LzNaN1VqTkdvaFlrTUtDUnRwWE5kcnlEZ1Q5?=
 =?utf-8?B?L0dDSCtYdlNQa0Z1SUZmclA5TFZtNG5EUjR4WUxIZWh4NXYyekJ2NnE4NFFo?=
 =?utf-8?B?V1NsNTBRK3EyN2tnOHZKZDlkUlZ1eUF6QWVZcklqYlpXRjJQZjNEc3gwcXk1?=
 =?utf-8?B?MWs5U3htWk9wSGZXNFBqYk9BcXFFcFF4K3AyeFVKNFQ0T1JoaElROEZjcGhV?=
 =?utf-8?B?OS9IbHFHWFVlNnU1d0tESUlxUWExdm4yMmhqVXR0T3FyZzczUUJUdz09?=
X-Exchange-RoutingPolicyChecked: cITfnIv9OrbnprV/UZFtlcvbRIEmJ39dC/dWeHJFKvaLAfWEkR7+iROdzgThatDy6VCkfFDfRhFgp/0JDinh9HWbYo40radFU2UxZ0nHtOUrRL0QItdr3T0wqVastT/8y3PVjoZrh9H6X3L53FeV4BuZFs0vhp/M16gTT5NSfRdvzTDb4+f1idcE8F4CnzbkZRlVBw+3YabCzJu5sdMLCfQ7G654tJLchM9ICBQmYnz6vzzom/1vSy85vrk2dL1n8aco1rt5ZYgb7xAlzv+nY5r6qLkgUsGF0CP5v8VUSMfET5iZFlWz7CbCzuQ+zFKLpsL6hInkn7FfcFfLK/V47Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: f92605f4-72cf-4d5d-6965-08de993b2ea6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 09:01:00.5865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajGlqPUk2HxoUk5VqhYPqDSqDCGR4O/NeadZTldRUkMrEsrzpIrZfjRy6rLBtJZxokVpBjyMk3A+8rKDx0G5+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6032
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


On 4/7/2026 10:20 AM, Matthew Brost wrote:
> On Thu, Apr 02, 2026 at 12:31:33PM +0530, Riana Tauro wrote:
>> Add error_detected, mmio_enabled, slot_reset and resume
>> recovery callbacks to handle PCIe Advanced Error Reporting
>> (AER) errors.
>>
>> For fatal errors, the device is wedged and becomes
>> inaccessible. Return PCI_ERS_RESULT_SLOT_RESET from
>> error_detected to request a Secondary Bus Reset (SBR).
>>
>> For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
>> error_detected to trigger the mmio_enabled callback. In this callback,
>> the device is queried to determine the error cause and attempt
>> recovery based on the error type.
>>
>> Once the secondary bus reset(SBR) is completed the slot_reset callback
>> cleanly removes and reprobe the device to restore functionality.
>>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: re-order linux headers
>>      reword error messages
>>      do not clear in_recovery after remove
>>      return PCI_ERS_RESULT_DISCONNECT if probe fails (Michal)
>>      only wedge device do not send uevent (Raag)
>>      set recovery flag in error_detected and clear on resume
>>      add default switch case (Mallesh)
>>
>> v3: do not set in_recovery for disconnect (Mallesh)
>>      return if already wedged or in survivability mode
>> ---
>>   drivers/gpu/drm/xe/Makefile          |   1 +
>>   drivers/gpu/drm/xe/xe_device.h       |  15 ++++
>>   drivers/gpu/drm/xe/xe_device_types.h |   3 +
>>   drivers/gpu/drm/xe/xe_pci.c          |   3 +
>>   drivers/gpu/drm/xe/xe_pci_error.c    | 104 +++++++++++++++++++++++++++
>>   5 files changed, 126 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 9dacb0579a7d..7f03f06df186 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -100,6 +100,7 @@ xe-y += xe_bb.o \
>>   	xe_page_reclaim.o \
>>   	xe_pat.o \
>>   	xe_pci.o \
>> +	xe_pci_error.o \
>>   	xe_pci_rebar.o \
>>   	xe_pcode.o \
>>   	xe_pm.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index e4b9de8d8e95..60db2492cb92 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -43,6 +43,21 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>>   	return container_of(ttm, struct xe_device, ttm);
>>   }
>>   
>> +static inline bool xe_device_is_in_recovery(struct xe_device *xe)
>> +{
>> +	return atomic_read(&xe->in_recovery);
>> +}
>> +
>> +static inline void xe_device_set_in_recovery(struct xe_device *xe)
>> +{
>> +	atomic_set(&xe->in_recovery, 1);
>> +}
>> +
>> +static inline void xe_device_clear_in_recovery(struct xe_device *xe)
>> +{
>> +	 atomic_set(&xe->in_recovery, 0);
>> +}
>> +
>>   struct xe_device *xe_device_create(struct pci_dev *pdev,
>>   				   const struct pci_device_id *ent);
>>   int xe_device_probe_early(struct xe_device *xe);
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 150c76b2acaf..c9fe86b670bd 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -494,6 +494,9 @@ struct xe_device {
>>   		bool inconsistent_reset;
>>   	} wedged;
>>   
>> +	/** @in_recovery: Indicates if device is in recovery */
>> +	atomic_t in_recovery;
>> +
>>   	/** @bo_device: Struct to control async free of BOs */
>>   	struct xe_bo_dev {
>>   		/** @bo_device.async_free: Free worker */
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 1df3f08e2e1c..30d71795dd2e 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -1323,6 +1323,8 @@ static const struct dev_pm_ops xe_pm_ops = {
>>   };
>>   #endif
>>   
>> +extern const struct pci_error_handlers xe_pci_error_handlers;
>> +
>>   static struct pci_driver xe_pci_driver = {
>>   	.name = DRIVER_NAME,
>>   	.id_table = pciidlist,
>> @@ -1330,6 +1332,7 @@ static struct pci_driver xe_pci_driver = {
>>   	.remove = xe_pci_remove,
>>   	.shutdown = xe_pci_shutdown,
>>   	.sriov_configure = xe_pci_sriov_configure,
>> +	.err_handler = &xe_pci_error_handlers,
>>   #ifdef CONFIG_PM_SLEEP
>>   	.driver.pm = &xe_pm_ops,
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
>> new file mode 100644
>> index 000000000000..cd9f39010278
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>> @@ -0,0 +1,104 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +#include <linux/pci.h>
>> +
>> +#include <drm/drm_drv.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_pci.h"
>> +#include "xe_survivability_mode.h"
>> +#include "xe_uc.h"
>> +
>> +static void xe_pci_error_handling(struct pci_dev *pdev)
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +	struct xe_gt *gt;
>> +	u8 id;
>> +
>> +	/* Return if device is wedged or in survivability mode */
>> +	if (xe_survivability_mode_is_boot_enabled(xe) || xe_device_wedged(xe))
>> +		return;
>> +
>> +	/* Wedge the device to prevent userspace access but don't send the event yet */
>> +	atomic_set(&xe->wedged.flag, 1);
> We can't blindly set '&xe->wedged.flag, 1' as this is tied to a PM ref
> [1], [2]. The existing sematic might be wrong but we to normalize
> adjustmets to the '&xe->wedged.flag' field with uniform rules, or the
> cases when we wedge we also take a PM ref
>

If the device was already wedged from xe_device_declare_wedged, this 
function returns.
And the ref is released in fini.

PM ref was added to prevent runtime suspend during wedging. But in case 
of error_callbacks
this is already taken by PCI core drivers/pci/pcie/err.c

pci_walk_bridge(bridge, pci_pm_runtime_get_sync, NULL);

I will add a comment here.

Thanks
Riana

>   
> Matt
>
> [1] https://patchwork.freedesktop.org/patch/714622/?series=163948&rev=1
> [2] https://patchwork.freedesktop.org/patch/715028/?series=162055&rev=4#comment_1315905
>
>> +
>> +	for_each_gt(gt, xe, id)
>> +		xe_gt_declare_wedged(gt);
>> +
>> +	pci_disable_device(pdev);
>> +}
>> +
>> +static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +	dev_err(&pdev->dev, "Xe Pci error recovery: error detected state %d\n", state);
>> +
>> +	if (state == pci_channel_io_perm_failure)
>> +		return PCI_ERS_RESULT_DISCONNECT;
>> +
>> +	xe_device_set_in_recovery(xe);
>> +
>> +	switch (state) {
>> +	case pci_channel_io_normal:
>> +		return PCI_ERS_RESULT_CAN_RECOVER;
>> +	case pci_channel_io_frozen:
>> +		xe_pci_error_handling(pdev);
>> +		return PCI_ERS_RESULT_NEED_RESET;
>> +	default:
>> +		dev_err(&pdev->dev, "Unknown state %d\n", state);
>> +		return PCI_ERS_RESULT_NEED_RESET;
>> +	}
>> +}
>> +
>> +static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
>> +{
>> +	dev_err(&pdev->dev, "Xe Pci error recovery: MMIO enabled\n");
>> +
>> +	return PCI_ERS_RESULT_NEED_RESET;
>> +}
>> +
>> +static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>> +{
>> +	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
>> +
>> +	dev_err(&pdev->dev, "Xe Pci error recovery: Slot reset\n");
>> +
>> +	pci_restore_state(pdev);
>> +
>> +	if (pci_enable_device(pdev)) {
>> +		dev_err(&pdev->dev,
>> +			"Cannot re-enable PCI device after reset\n");
>> +		return PCI_ERS_RESULT_DISCONNECT;
>> +	}
>> +
>> +	/*
>> +	 * Secondary Bus Reset wipes out all device memory
>> +	 * requiring XE KMD to perform a device removal and reprobe.
>> +	 */
>> +	pdev->driver->remove(pdev);
>> +
>> +	if (!pdev->driver->probe(pdev, ent))
>> +		return PCI_ERS_RESULT_RECOVERED;
>> +
>> +	return PCI_ERS_RESULT_DISCONNECT;
>> +}
>> +
>> +static void xe_pci_error_resume(struct pci_dev *pdev)
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +	dev_info(&pdev->dev, "Xe Pci error recovery: Recovered\n");
>> +
>> +	xe_device_clear_in_recovery(xe);
>> +}
>> +
>> +const struct pci_error_handlers xe_pci_error_handlers = {
>> +	.error_detected	= xe_pci_error_detected,
>> +	.mmio_enabled	= xe_pci_error_mmio_enabled,
>> +	.slot_reset	= xe_pci_error_slot_reset,
>> +	.resume		= xe_pci_error_resume,
>> +};
>> -- 
>> 2.47.1
>>
