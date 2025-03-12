Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6BBC28B28
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 06:21:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6910910E6D6;
	Wed, 12 Mar 2025 06:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A4C2cpQS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F8510E6D6
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Mar 2025 06:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741760513; x=1773296513;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=duB6S5NpSz17Wlc28IBH4HQJKERV+s9d7HcOdvpuJR0=;
 b=A4C2cpQSYUDyyzZEAUScNN62h9XnhTnnlwo2OnI873HgzCI3rJBqqMcR
 k/BLJeCGlxR94ywPiFNBjPxpf09eQjfnmeakpNdPELfP72QYGfzJlEStz
 WpgKT0COAtRMl8z5Sde8xIpsWu7bD3seH2qgFIdGmjO1FV7QsOpJdrnie
 PqvXHrb1qKsnOiO3PKLCZDKp53zsmnHgK/Se9OKpdatFNbhGwLUJymwQS
 Gqp9S6UKVetZxKI5xErfypV81Po1Z0ey5jOQbF2ZrS9ZFYFEXvIwi+0pw
 8YP+eLKAYeYuzIggyjBXJxC3rtkxLiwryL+h6eW9kfcKimYrw9gxeCJiM A==;
X-CSE-ConnectionGUID: Lo6RMjJhQUaHN06fcLlD7g==
X-CSE-MsgGUID: kSLGsZm0QFaxgEFZqZiKHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42543793"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="42543793"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 23:21:53 -0700
X-CSE-ConnectionGUID: M1s9ruEfQSaCLIthtg5nEw==
X-CSE-MsgGUID: nx4RoRDcTCejYNjlHi9qvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="121444620"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 23:21:51 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 11 Mar 2025 23:21:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Mar 2025 23:21:50 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 23:21:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jtuWa8N9jRFQZyxaSa6eRT8uD45H14leD/JREB63BxgjRooDO78pJLcdyG2iQImdPNRWnpV/M0gFR+7XOc1QIgC8jgTAAPoCWHy/UAf+YkBv0HT2rV2BTsmR06Nb64Dvo924shgX/0eh3kdgoGuvWQIUzbmgjB5qhBPinvOJMmLx5kpa8iFfWqUB25ME6pHelsbmwVAeEPD2/RVBLIrU7C3ipKaD15RePsdMWQOF3kwCm4wjaulm1jNwiPep1j/oMyn5cbHoTIyTWK5q3g2FNkMkbJdEgTVkmOBNf2cq858q+/kMj/IV9RKDsKF4G5O5tfyYPUylcXtVPQHBgg7Mvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RfdUAByYvq1sGjS4Rbplrxj4ZS5Oe9wJnQlnx4LXdjQ=;
 b=IpNZNou7o4Vwizo5iAV+B+aFxeZS3MHowTykmhZEUMZJWkZEsoTQwsK4yb3tlCfumbtfWJVgN0EJkqW9UEUYx0uyBKzlQgY2w1ULlS0KeZG7C7WOo1oxTYgZusTCUIM9qhpKiTtiomasSJ9fA+H0TWSklOTuAuWqSGY3yZ7i+c8jBBA0oQIrB8jaz6actJPHcEnHc+IJ5j84opABIZA9Twgnhcvh7xSRKfsU2WLzDMGGv8D2OCLqWvyikVg9eFOPHDnK7vxdrMh/iAYF8DXucmDCzh9hBUpYNce5aMdOJSr0zaXxHWcAbj0MNJDli5txIBJqy6M7BJYkKoMrnveyDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH8PR11MB6950.namprd11.prod.outlook.com (2603:10b6:510:226::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.33; Wed, 12 Mar
 2025 06:21:20 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 06:21:19 +0000
Message-ID: <b9e7907e-6151-4127-914b-66783f6a8c70@intel.com>
Date: Wed, 12 Mar 2025 11:51:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix uninitialized variable in xe_vm_bind_ioctl()
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <dan.carpenter@linaro.org>
References: <20250312023816.3641312-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250312023816.3641312-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::11) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH8PR11MB6950:EE_
X-MS-Office365-Filtering-Correlation-Id: b67646ae-5c63-48fe-bad9-08dd612e1a46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGtOV081WUkyRk1meGZUL2k0ZUYwcDJoSFNXT0RkL01jTmVMQ0dEM2lTaktR?=
 =?utf-8?B?TkJqcE9pUTF2YnFDNnJCci92TkJhaXp2eWVCVGdWY3dBMzBQeFlnTnNpNktU?=
 =?utf-8?B?NlRGTmpmR1ZoT3h5TVJLdmNsYjdrTmh0RkFSeWZiR2wwdnJsZHNoWmNYdGFW?=
 =?utf-8?B?cVBRQ21xd0RmV1ZVUE10aGk4ZElTOHJKcE1GekZLK2YzSFh2MFUxOWoweWpX?=
 =?utf-8?B?S1RHb2tpOXM0MXRvR08zZXVPUi82aG1hYnQ3ME5pUmFmOWRzMG81bWpLcm4w?=
 =?utf-8?B?cEhjZzJZS1lsaGYxZjQwMVVpS1JJR0F5Qno1bllrdGdQU1pZM2d4cVM0eEU0?=
 =?utf-8?B?M2lHcTcwamJTRDJKUlRTUFdkYWdSV3ovbE84VDNtVXo0TnltNEZoTlNtV3Yy?=
 =?utf-8?B?aUJtWXY0R09IZllVUlprT3hRSUJ6bWltSTNPWU5TOWJnUUFWa3VsQ0J3VkVF?=
 =?utf-8?B?VmRJKzdOK0ZXeGpHekhKUElqRy9MUlJKeWZtYXZpM242a25rTEEvMkFjRHVv?=
 =?utf-8?B?cFhUOTBEaWlHZzBoeCtraWNyd09RaE16eTdVTEplSnJqalRCTmxhTTdDS05S?=
 =?utf-8?B?TjB4ckxQbU9NNzdCV1lYNGJNZ2Y0dXdFSEpsOHZhTnFKelB5VlZGT3BFbGNT?=
 =?utf-8?B?bGJmckxheU5hS09WSHpZcUpZVXNic2tROU5EWWhCYzJCK0JNb0U4ejUrRC8v?=
 =?utf-8?B?bkdaYlF0QWdaSWJKMG9CWHdkZkNlZ2x1UFlOdnBnelBaSk9ORnVRYUhRUWhl?=
 =?utf-8?B?TmhnK0dxY2N1RXFGWVN5aDdhdklPNExzckNWREYvSUpmYjRWK2YvUSt1MUlm?=
 =?utf-8?B?YVJ3QVdGUGVkWWxqK0V1ZkFMcWVncmZlenlmK01QRnBWU1dWd2Z6bWh2NnhF?=
 =?utf-8?B?c2lJUW1hZndrTm11Qk12UmVxZGRMbkpXZ01tVlpNODZPa3M5OEwrUjZ4eVpF?=
 =?utf-8?B?ZzN0NnBRNEVDbEFNWkhLNGRlM0xPMVhHeEhiZHNoMktBR3J6WkdWUE5WTk9i?=
 =?utf-8?B?YzlsOUovdWt1djdRNmV1NmRwQklPUTVDeEdHZlA1QkxQYjUxUEFBUnd4U0tP?=
 =?utf-8?B?d3lNbS9VSGM2TUlBODV2cFkvSmJsV0UzaXFhWVFjbzZmR3MxWURHVXI3Ymty?=
 =?utf-8?B?bk5qZG85U1djTjRFeGhLd3VTR21jSnd0aDlsb2QrdEthWHkyWnRBSEp6d1Nl?=
 =?utf-8?B?K3lockhLdHZYN3ExSllBVW9sKytlTk5Tdjk3M3pzVVNrVlMzNGlseDd1a2NS?=
 =?utf-8?B?Rm9Ud1Y2azFYa3BzVVQ5akN0YkdOOVFYWXM3bGJMbHpjeFRjUyt4b2Y5WmR4?=
 =?utf-8?B?S2pMUmZ1QzlHZDhxVko0US9TZ3d6dm5UWDA1a3NJMW9SRk43NWRmV1gxa1I1?=
 =?utf-8?B?RHUxaVNyWlk5M3hsckx4dXFlekRmVEhFNUpTYnZVYzVEclI4SytQblFTQkl4?=
 =?utf-8?B?UWIyT2cwZ0E5NHJubThrRTVVMXg1RmR2Nmc5eUpYYXlzMWFWNEVpU1lYWnBn?=
 =?utf-8?B?VnJxMlhVTCsyQXNscy9TdVVaaG1RbTNUT1NENHFhZ3YrcXJFemZidGhBUEZv?=
 =?utf-8?B?WnNrRndBUVJuRXR3NVZjd2d4UzVUZ1F1YXBib01VbFAvelFtbmlzWkZ6UC9p?=
 =?utf-8?B?aGRoZHdNTzRFbEpGbElGZGZhSFhjM0JKa1N1QWRiczU4dll5OHJjZTBVZlF6?=
 =?utf-8?B?eUtOTDBvOHJEekZ6cXRWS1Iva3hxcmg4WjMwQm4rWCtSYTJOQlUyOFNVdnJC?=
 =?utf-8?B?cnQ4Yk9QUEorWlN5dTV4MHJqMW91MTRBOGorQ3kwbkZ5M2lNa0R5Nm5vMDI3?=
 =?utf-8?B?aSt0OXhCdThON2xCdENFbFFFVURKRXR2NXMxWDc3M05GT2dINzFpQm1od04v?=
 =?utf-8?Q?mG/tXW07suHYE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cU9sSXVsMDh4WFp0ZzdBQXBodWgvRmJzY1lxRm8rVzcxZWI3aUZuSzA0b2oz?=
 =?utf-8?B?bWNnS2dRZWc5NURoTkx3N0VwYzJHbWt3bHRSai9xUGt2SUdhazZlU0l4K1Nl?=
 =?utf-8?B?RlF2NVY0Mmo1eDFzNW1FN0cyVlZxZXlqZEhXc0J2Vm1zQzJ0VXZGQUtXa28v?=
 =?utf-8?B?TWdsTXhCMFpXdC9YVlBhRG11WTZkZU1xTk95N3dkN0dJVnhQRFFYbXd4eUly?=
 =?utf-8?B?NWkyNVV2SHV2WDlnSmtBbzJ6dnRvdythdE5lUGVnS0VwUXRQTDNqb3BLUzRU?=
 =?utf-8?B?dEVKMngwY1V2TStKai9iWlVUemVSQjNJU05ncEFiM3puN0p1UW1FclNEQm90?=
 =?utf-8?B?SE5sdy9iVitudFFoZ1RBbHg0akp5MWFLYmxtMjlrcVhkc2pPZy9HQllTR2hL?=
 =?utf-8?B?MW5Ra0F6THNSRFJzcTcvUDI3SmZYaVJIeXMrQi90bWcrTGUzSW8vUElWa1Y1?=
 =?utf-8?B?amVLdEc3T3VxUzdJTGh5UURNQ2VTUlExMjY5MEpZcnJ6R3QyNTAyY3hHWHI3?=
 =?utf-8?B?ZytQZVNuQ0dESTJwUmFsRzViZFZ4SzFqZEtSVGhLNlJ0MS93N0JYbGE1R2Q4?=
 =?utf-8?B?OXdId2ZiNk9ra2tYVkxFcnJmQ2xTTDdZSDdaNUNaTDVZRHRFUS81OXpCM0VT?=
 =?utf-8?B?TUkxV2pMN1pEZXhSU1g0NjVXU2VwT0tpTGxlSVE4OC9FR0RqUmdrRFltdkE3?=
 =?utf-8?B?SG42eE5OZmtoNk5VOHR6YXdwaTZWSnZlck9yZW1hOEo4Z3pOS2FCUWFPd0Ju?=
 =?utf-8?B?Y1lHU2MrakRCaHZielQ5STh2VFBLSFlRRzRta204WVNhWDFrSVVmUlhkRFlC?=
 =?utf-8?B?dDVnYldwa1hNSGZWNi9OTFZqTWM2TlVOS3FRWkgrZ3JmNGFsNGh3WFJuVC85?=
 =?utf-8?B?eW4rV0NXaCtTT2EyUGdsQXlqOGREaUNvQnViWlhST0ZDTzRaWDBuMk9Xb1ps?=
 =?utf-8?B?Y1V4QUd1dXF6WDVKM1huWkkxbjlBUkdxZTFTb1JCc0Q0UTdYMXZ0Mm9lM21p?=
 =?utf-8?B?TTV6Zm5XT1hPRDZ1S1NsVGVrTzRjQnhJUFlZNzFxNUUwdEx6bWVZcjF1M3RK?=
 =?utf-8?B?TTNNQ1Z5dzBISjBqdUVqWkFzVkpzSGMwcHk1LzFpZlpCektDa09hWXYvcGdE?=
 =?utf-8?B?Nm5pK2Z5aEtuVndsNmlpWXlNRThWS29oL1A4TnVHMTRTbUpCb1BZQ2FLaFRD?=
 =?utf-8?B?bUNlcHdIQnVlQkVUODZFaW9YOEN1NXk5RmJLd0pNL0dRUVIyY2NYQ3plQk95?=
 =?utf-8?B?MjNRUFFEWkpYUW4vNGZ1bDF6ZG1BL3liUkpmT0pKdmdxZjYwWnM0UlFKMlVv?=
 =?utf-8?B?VVAyOXI2V0hmNUVYTkNuelR3QlJSWUJXcUFaS3cxM3ZSdEZRejYvRENVTmM4?=
 =?utf-8?B?VHVJRnh6RmxhV0NTc2RicGI1bEM2bFZaVWFOVjdSVmdKSlJCL1pML3lJbHJF?=
 =?utf-8?B?MUtONHkreTlhOEczODdZc0pEbEcvUStwOXZMTU1qQm1jTE1hekNtbHRsYjRS?=
 =?utf-8?B?R21FSEcrTjd6ekdWaUJTeTdLbTFtbDcxYXZGZ0tmUW96VnlLNzFZVTJWMzEr?=
 =?utf-8?B?c2xrSFdVSDRvTHJUT2R3MlRPdTVLMnVxQnIyVldnRGNIRGhLOHZBWSthWWVv?=
 =?utf-8?B?a292WU5VVkJXY3E4aTJmSVIvSFpwbzZ6NXhkSHdJcmtxYnY2WWUxVE1BRlBI?=
 =?utf-8?B?cDVMbmlhUHJPeUVvSnFpeXlCekxPTG9TN3llb0M3aW1WTGU4a3c2ZDdCU3FU?=
 =?utf-8?B?K3prOXZqY1NFN2gvQWVITGl6ZmZLd3NuR3VodU1abHpNMHV3YVFDYUpOTDgz?=
 =?utf-8?B?WHRhbFVUL3BVYkw3L2lTR2xtZExjRFZnT20wVlJmc3FtS1lHQ0VlVnp1WDgy?=
 =?utf-8?B?R1Z1dllCblo2RWRRR2Y3TUxDT2t0SmlFMjlFY2R0R2YvWDRQdmZvYndoTmtE?=
 =?utf-8?B?aEVwcVBGMGRMdklYc1g5STFuQm9tZ3hKcjBTUWhkdW16ZHRlUW1SNElldEQx?=
 =?utf-8?B?RW12V0hKbnp6ZzRPdzNHTmlBZWEvR1IrRlZ1Q1ZNaE01cVlEbExSRmloQVk0?=
 =?utf-8?B?bTJvYUlzSldvZFl5OTRjRUNEbVVvZ09zYituOW1Id0dvY0d0OVpHMUpXSVpl?=
 =?utf-8?B?S2Zwbk9yODRWVER4NzNKNlJqRTZNczNndzJrMkhoRlFsTW9IRXFja2F5aDFt?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b67646ae-5c63-48fe-bad9-08dd612e1a46
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 06:21:19.7152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sh9fciebwAksEivYo+MSFNePCwcN3YI3sPfnr6/dQQ1c4Dz7JWQc43UVxHjqTjMVCgEwcPhzqryW1OSi1RxJtKGrvArBd2txuWUDdGWUw+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6950
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



On 12-03-2025 08:08, Matthew Brost wrote:
> The error handling assumes that vm_bind_ioctl_check_args() will
> initialize "bind_ops" but there are a couple early returns where that's
> not true.  Initialize "bind_ops" to NULL from the start.
> 
> Also if vm_bind_ioctl_check_args, fails set bind_ops to NULL after
> freeing.
> 
> Fixes: b43e864af0d4 ("drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_vm.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 60303998bd61..2e6db5759d26 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3177,8 +3177,10 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>   	return 0;
>   
>   free_bind_ops:
> -	if (args->num_binds > 1)
> +	if (args->num_binds > 1) {
>   		kvfree(*bind_ops);
> +		*bind_ops = NULL;
> +	}
>   	return err;
>   }
>   
> @@ -3284,7 +3286,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	struct xe_exec_queue *q = NULL;
>   	u32 num_syncs, num_ufence = 0;
>   	struct xe_sync_entry *syncs = NULL;
> -	struct drm_xe_vm_bind_op *bind_ops;
> +	struct drm_xe_vm_bind_op *bind_ops = NULL;
>   	struct xe_vma_ops vops;
>   	struct dma_fence *fence;
>   	int err;

