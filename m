Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A705BCDE03A
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 21:41:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2A710E199;
	Thu, 26 Sep 2024 21:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eCQ8W++N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2EC10E199
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 21:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727386893; x=1758922893;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+9wMe0G8O/TaAbjhbkxZGcEchjPO+FUp7O2BoJsVzPk=;
 b=eCQ8W++NKAj3aqgs6HpdzLc2hUTrDoOF/WLHk74htDiP4TFzi3+wBScg
 p0pZifRawFPc+K5477BqRz6PT/HR4Ht/lMJnde+ANTbQV53QrPh1m28wJ
 1UyqVB4qaPVbKtdRJg6TE6KrjFbKDTFKnPpCz97UyppDPfJiCm7Kp//q1
 aW/IHjyMVMdlelFbtAfj5G+6DfmtBYHgMt5+qfJlYQP0bcJ2YypwmLVOI
 o2zjE7SILKNehCgFD1alEDGbDavWpeKBZRD3V+wfgjPUZMP1L6EdyWaKH
 /BMJNYgzzBoGc0xviHz97CZs+Y6Fs2DDXfVqoJka1ofU/yDvcWYUrYe+C w==;
X-CSE-ConnectionGUID: MOQmWdwXSZ2J0eaY4JZnCQ==
X-CSE-MsgGUID: K2qvcVcIQDyOGmQV5JEqyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26321952"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="26321952"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 14:41:32 -0700
X-CSE-ConnectionGUID: DcnROH1oRpmHFOG3BjqU0Q==
X-CSE-MsgGUID: KSk8+kGlSBak3CJLrKS1kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="71981102"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 14:41:32 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 14:41:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 14:41:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 14:41:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 14:41:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJWJ4OQYEf7v9ydbU4ZX414jBQeujJK/4qBwR+Iwy8EcaP1vHrCtrJVkTQ3rbbcDV+dWx3c5HJfiHQ8AXPHA5EhpUfR1nERAIf5BHcmAUJVW1BvtDoaei7zCYKiuqrW9sAUSyyNG3hY8N8SpIp2czHcGE5/TAXYRlVRc1QICmE4LsAe9A/grdoH8UyMOu8Ya5c8q2cMwXM7Utzb4kUBX0Sa8vuTZOMFrRN101sfNXw00FgjGZPmF9E/vmRibPeSUg59B8aQ6K0PNhblP9rVK3r+/XkLKfneDUYAttqgrt/ePTfZiZfv+Mw58WXTeSVgEzwnApBSJaIu44wqbeqoYog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pM2uuTnnj0Y7WDjBP7HeGT4x0cx/C4en8TuMnd7G5xY=;
 b=aiWtiIKby+oA5b6kUKFIz2c1zXbjddXzKvBJ6RArU2ULIgpCRgr0Ma9vSNb6MOkykrvORJT/XR6CO2bUHhaEHO/LH6WKTTWUHXmlSblChy/dDPnBFK2j1toO0qsJq9gQlU+K9u/sPnobHBlJAtyizX22Nmm30N//w+jMHq5mSNHkL3rl+adCotoX1rh3K5I+5MLyOj0pnIaHmYMclZCnvXNcV6hrjT8Ji0R3m6zZ6Rmo+xdjSW8JxOKHJt2uB4dd63QevtYsnqXRCCBsienLWOdLq6S+xFOhRU5dxj2m8w4gxipZjUx17spzH1huCStPIkg9J3dR/5LAVhwM+jdkwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ0PR11MB4975.namprd11.prod.outlook.com (2603:10b6:a03:2d0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Thu, 26 Sep
 2024 21:41:28 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8005.021; Thu, 26 Sep 2024
 21:41:28 +0000
Message-ID: <3eb1f14c-ae71-4756-b1f9-85b243aeae5f@intel.com>
Date: Thu, 26 Sep 2024 17:41:25 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] drm/xe: Prevent null pointer access in
 xe_migrate_copy
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240925012110.493257-1-zhanjun.dong@intel.com>
 <20240925012110.493257-2-zhanjun.dong@intel.com>
 <c0e560d88c7d2b25f6d250c641ab06554871f986.camel@linux.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <c0e560d88c7d2b25f6d250c641ab06554871f986.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0237.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::32) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ0PR11MB4975:EE_
X-MS-Office365-Filtering-Correlation-Id: 5805a08b-d5e7-47fc-a799-08dcde73fa4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zk5WTzdKWDdodkJyZkdFWjVUcmVoL2s3NWV2MFR0bC9jWm1ySm93dlhPTkw1?=
 =?utf-8?B?VWhpcEw4VTJveFRQTnFlOGhSdy9QdWlDK1BZOFpRWkh3UTh0bkpmS29Ma2Mw?=
 =?utf-8?B?b0J2SDZ5MElHMjZuSGFjWmhQeURuTXM0M1pPSkRSMmNmR2NTMlZGZEt3blY4?=
 =?utf-8?B?S21nYnE2R3Y0OHpkM1pSdXVWd3ZPd3pPOG9wdDhVZHZpU3VaOHJRWjZ0d2d2?=
 =?utf-8?B?Vk85SEwrTGs4ZjFiNlVPbzRDVFdXQVlnRml3cjZnRzdubTVyNnVSQm5DUS9K?=
 =?utf-8?B?MUhUb2dnZXc0VXN0cUZBZHBNS0JIQWNMQnEwQ0hKR3Uvd0ZKZk54TmxYLzhJ?=
 =?utf-8?B?TGljS05Ed3hyUmVGayt5enlRRHF2L2szbk5JVG9YUUhGMTlKNXZSbWkvOXVr?=
 =?utf-8?B?Nm8vVWQyY0UwWVBadFpEamE5dWYzS2I0MjFoTll5T0ZtQ00zNWtUWVZrdWJT?=
 =?utf-8?B?dFJ4RElEK0RCZnI1VWIwbVI0czRPbzZLNFgvU2hmS2pSaDIyU0ZSNDJkbzVt?=
 =?utf-8?B?ZmZId3FHMWRLQWs5WURSeFpqSmlNNTJmalAwZTlVa01nblZLR1NBL0NvcXlr?=
 =?utf-8?B?WDV1Nlh4cHVYaDdtR2JEVmcxSE1odEdoL0ltZXM0cWhBK1Y4MWxqN1pwNzFj?=
 =?utf-8?B?dWNnZlo2NXhkRlBUZnBja2Z4dlZYcEtZYnNRMFJ5V0JDRlkyUklOcUdYN0Vm?=
 =?utf-8?B?aWpWbWcyVW5vODRQdlNmK3ljRk9ybWd6T25wbXJaYUhlemRPV1RuNzh3QmFD?=
 =?utf-8?B?Tlo0cWQrTDhGV2FrWDAySVNLL21tZHFVQmNyZGFXb0FxQ1YrYnpsVUhSMmNQ?=
 =?utf-8?B?Y2pWalZQMld2aWljR2dvUGY5S1MycXBQckJNU3pEbjdhbGNXNE44QVBJc3Rz?=
 =?utf-8?B?cElOSDQrbzU5STlOKzR3dUNwVkFFM1lzR0pscFA4b0ordUg1K1pydkU1R2Jp?=
 =?utf-8?B?TlcvMjAzZTRyVUgzRk9qUEZGeTRTL2krRnZFWk9LNitOaEE0WEg1Nm5tWlE3?=
 =?utf-8?B?UlNRYlV2bTdSeWlJYXRhREw0TEFIODk2RWRCTWt1L2krMzJDZVVHNFg1YnBj?=
 =?utf-8?B?VjlBOUZ1S29GQmttRGhGaTlxUlU5dHFpTHR5bnE4dGJrWklEZ0RBcThnbWdM?=
 =?utf-8?B?dGhyRWY1T25zenpYMEg3ZUw2NmlWQ0QxaGN4RWIwdGpjRGh0SUxwajVCRnMz?=
 =?utf-8?B?K3pCZGtxak5tNmNjTFY3SEhnaS95MGI4UER0c2ZuQlFKUkkxQzNaNEhDd3Rv?=
 =?utf-8?B?ZklvaDZnSlUrNXZMOW00d1ZvSFBsS0E3dGdkenEwUTd1QldZdHBWMzdHUVhj?=
 =?utf-8?B?aWxaaEdNdE1kaE0yRXhXbk5pbFBJTDlVUm9CSld0bEFHbi9NWjN3UTdBd1lB?=
 =?utf-8?B?SFVyQmRzSW0xNzhGRmlmOW1POTVPSjVIOTRYVWZDQjltSjhtTW54VDZDeEdk?=
 =?utf-8?B?QXFRMmxuYU9xdi91aW5ESENCUVBtZU9XQUtYc2VDSUE0aDZ3aU1qMnlQT3dl?=
 =?utf-8?B?dTNPMjVrb08yamcxQ0FkZ2oxK3NXVjRXcW1tbjA0RmRrYWREek4xNzgrN2Mv?=
 =?utf-8?B?MVhmOUYydmRKencvUENtNXJYZmRKdVlSY1dkcnJhOU12ZlJaTm1pZjRpNDd2?=
 =?utf-8?B?K1hySUhLRGx0cUtESE5kd0p0a0VuaFZxbHZ1QUpCSzlWMDZ0TkNGenRvUld5?=
 =?utf-8?B?TlRKYjFPendSMjJXY0o2d3NiSFVRR0RibmpJMkV0b2NqVWIrR2lQZS9KQkYz?=
 =?utf-8?B?aWxyZkFsVHBWOGMyOUFIY2xGVFVteC96bWZXbXRRWkFUb09VWmhsM2JML0Zk?=
 =?utf-8?B?Rm8rNjBveDRrQWxQcTc2UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0h0Vm5NNE9UZFhTYXI1MlNabWJJcnNacHN6OHJ1ZGNQUGc2OWM2TCt3Z0RW?=
 =?utf-8?B?a0x2Ym1iUTlLSjFrV2gxcStVRTJxbnhmOEZrVHRXbEdXN0JLb1lFdW0xYTZX?=
 =?utf-8?B?bEp2YTArNHVJMnZUSDdzMWQxVmNDWVlua201MFNvYkVOWUNVQ1hBN0puang1?=
 =?utf-8?B?M2hNVjBRQ0g1YjViS3dESnl3bVdseWlUUFA4Wm9Ta1FLc2tyNmx0TVZsSUhv?=
 =?utf-8?B?UmZCbDB2RDhqM2RUUXVQdEpWdHJxVFNySkYvTDRJMXVWRU9CYW5zVGFZeHJ3?=
 =?utf-8?B?eHcxWjNWUE1pZmlrNUVjSG5sMHlBbituSnlRbmthQWF6NDBpcS83T3hjUEJH?=
 =?utf-8?B?Y2oxRDNZcGxUTTVUc3RXRjBpWkJUaU56aU5ZN25ZRkpOQWhKLzlFYzBFQmVo?=
 =?utf-8?B?TXZlVlpLRlZEWEhwbVdoeTY1QmUyUXhsMGtyRWVTa3RYOGZnSHhrT1FqSjRp?=
 =?utf-8?B?OGtMWUl4ZmVJbXptaTV5UjlkZXpNcnJjTGZsd1JVeS9pSnZQdXNMc3FtNlFh?=
 =?utf-8?B?ZHpGdURzeFQxWmt3MFlIS1Vyb0l5Y3hTRXh1SkprZ2hxZk9tdHhXL0VKYUZ2?=
 =?utf-8?B?UXF3bHNvRGUyV1d1ZEQvL2FLbzRYbHBBOEFxRzZMaFBGZ1JPV1FnUVFHd2xE?=
 =?utf-8?B?WUFkL01ZSTN1NHpTeFpqQ1FjempSREFxeUVRWDVaL2pXRHhkbVRaendjbjZI?=
 =?utf-8?B?ZjV2ZWx6S1JrQ09DcU1kNVl5YkEwVFZJc0xtWFg0c1JUWWcvN0ExZ0pWM0VT?=
 =?utf-8?B?VlQ0OTVoT2dqbHc3bC9DOTFma2lZMjh5OFhhQlVDVkNKWk9McHhQb1pjSE5s?=
 =?utf-8?B?VWdHODJrWVNuY2g5UWl4ZG9pUVdFcEhmVm11ckdVTE1oMHV2U2dQOTI5Ujln?=
 =?utf-8?B?NFFDS3FoN3hkdFdoclc1Qzh3VTlOZ08wemlMNDNkTmtkdVhic2NZQXEzbDJ3?=
 =?utf-8?B?bFhyOEljNFdGQmdROUczdEYvR1Ivem9PYnNqTlM3dElDSmxYb0xuQzRndnNG?=
 =?utf-8?B?OTVTMU1DU0lldmZMUnFiT3NOUGZvMlc5WStEcTBUa082TDQ2ZlpEcDBpNjB6?=
 =?utf-8?B?Ulp6aUJ3WTFKUzU4ZUJXVHlGbUlpdnlOa0k1YldXbDhUQlgxM2hDbXErMUdV?=
 =?utf-8?B?R1lqMWZiMzhEbTlnR2JLOG5zUWMvT2VJWmx4b05rVmpYclY0ZWFLaElZOSt5?=
 =?utf-8?B?ZE5FRDZoaDhTT0k0NVVHVTNJYjJiZFpPTk5OUmZzQnl6b0JjQnpsN3lmRlRC?=
 =?utf-8?B?citaTFVHWWNGZll1VnRtOGR2aTN0RkEyRGcrZVlCSDVIMk4xSmx3WnJERW1j?=
 =?utf-8?B?QkdhTFFxWFUwbWRTZTVmNUc5UFR2ZnNyeXZpaDB4Y0hFMGVQTVl2R1NGMllI?=
 =?utf-8?B?UW8rWVZScEJPc3FUZUFwOXpxeC9nbmlnWE5GcWZlWVVsQjYrQkNYU2xHcVUy?=
 =?utf-8?B?M0prNTdCcHAzTVcySWNka29ZZFJBSTU4bXd1b0o0eCtTMlFDR2JpclFkOTJI?=
 =?utf-8?B?S2RDQWRFVVRubS9CM1RzUktGVDdwUUZXRml0djduT29LaGJLbGhHMlZLK0FN?=
 =?utf-8?B?Kzl4S0hPOERodUZySEt3ajg0U001Q2wweklVdStnbWpzdEpFSmFIWWZpTnFQ?=
 =?utf-8?B?ODlzMnQrWkQ5R0JjdUQ1Rm9Vc3lWa1RHUTNtaGlDNzhvOHlEZ0k0disrTllu?=
 =?utf-8?B?dkVqNStKUzF5UnVvSURZNGhZbDJQaklIemJyRFJsNVV6MW5HSkswWFg3SUZx?=
 =?utf-8?B?R3pZdGZTdWZtR0pnTThxRFU0NDB2c1BPeEpyY3cyamp3dy9WSm5DVGtuWkl0?=
 =?utf-8?B?QzlGL1pNaC9EbXR5MEU5em1mY05PRDBYZDFVMmlGT0Fpem1nVFc0dkkyUzhp?=
 =?utf-8?B?bXMvM2Uwd2d5N25QcnpQZUJlWUJ6a3U3Z25oRGMzTUZMTGwyVHdHUW1Qb3VK?=
 =?utf-8?B?WFdITUtwQVRqRTV0UFNZQXVnSmJJSjd4SUxpVm8xODhMeXFtOTlOM1FOU2xq?=
 =?utf-8?B?VmQ0VzJyRm9BWHJBQ25nUUxFVUQ0bklyTGNPSHdsU1RraHhHSU1DUWdZU1hw?=
 =?utf-8?B?SWw2eDRmOTZEelczeVhDOTY3S1FyemxYUDVscnRyZ3R3bUxRU0NGcnBwV3Bp?=
 =?utf-8?Q?0w9CsZ01ZEDx/6E9ZigiGGi4m?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5805a08b-d5e7-47fc-a799-08dcde73fa4a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 21:41:28.3059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aEL8ZOswosrME8TfUq7xg4cBbFu2E6RTcJm90hIgatvyYzZQIIQvN3DPqaBJI7vJJriqhA7U5+y+tVXAhwJP1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4975
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

Thanks Thomas for code review.
I'll make changes as suggested and post another revision.

Regards,
Zhanjun Dong

On 2024-09-26 4:00 p.m., Thomas Hellström wrote:
> On Tue, 2024-09-24 at 18:21 -0700, Zhanjun Dong wrote:
>> xe_migrate_copy designed to copy content of TTM resources. When
>> source resource
> 
> Checkpatch complains about long line.
> 
>> is null, it will trigger xe_migrate_copy have null pointer
>> derefrenece.
> 
> Language: Perhaps "it will trigger a NULL pointer dereference in
> xe_migrate_copy"
> 
>>   To
>> avoid this situation, update lacks source flag to true for this case,
>> the flage
> s/flage/flag/
>> will trigger xe_migrate_clear rather than xe_migrate_copy.
>>
>> Fixes: 266c85885263 ("drm/xe/xe2: Handle flat ccs move for igfx.")
> NIT: Please move the Fixes: Tag to just before Signed-off-by:
> 
>> Issue trace:
>> <7> [317.089847] xe 0000:00:02.0: [drm:xe_migrate_copy [xe]] Pass 14,
>> sizes: 4194304 & 4194304
>> <7> [317.089945] xe 0000:00:02.0: [drm:xe_migrate_copy [xe]] Pass 15,
>> sizes: 4194304 & 4194304
>> <1> [317.128055] BUG: kernel NULL pointer dereference, address:
>> 0000000000000010
>> <1> [317.128064] #PF: supervisor read access in kernel mode
>> <1> [317.128066] #PF: error_code(0x0000) - not-present page
>> <6> [317.128069] PGD 0 P4D 0
>> <4> [317.128071] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
>> <4> [317.128074] CPU: 1 UID: 0 PID: 1440 Comm: kunit_try_catch
>> Tainted: G     U           N 6.11.0-rc7-xe #1
>> <4> [317.128078] Tainted: [U]=USER, [N]=TEST
>> <4> [317.128080] Hardware name: Intel Corporation Lunar Lake Client
>> Platform/LNL-M LP5 RVP1, BIOS LNLMFWI1.R00.3221.D80.2407291239
>> 07/29/2024
>> <4> [317.128082] RIP: 0010:xe_migrate_copy+0x66/0x13e0 [xe]
>> <4> [317.128158] Code: 00 00 48 89 8d e0 fe ff ff 48 8b 40 10 4c 89
>> 85 c8 fe ff ff 44 88 8d bd fe ff ff 65 48 8b 3c 25 28 00 00 00 48 89
>> 7d d0 31 ff <8b> 79 10 48 89 85 a0 fe ff ff 48 8b 00 48 89 b5 d8 fe
>> ff ff 83 ff
>> <4> [317.128162] RSP: 0018:ffffc9000167f9f0 EFLAGS: 00010246
>> <4> [317.128164] RAX: ffff8881120d8028 RBX: ffff88814d070428 RCX:
>> 0000000000000000
>> <4> [317.128166] RDX: ffff88813cb99c00 RSI: 0000000004000000 RDI:
>> 0000000000000000
>> <4> [317.128168] RBP: ffffc9000167fbb8 R08: ffff88814e7b1f08 R09:
>> 0000000000000001
>> <4> [317.128170] R10: 0000000000000001 R11: 0000000000000001 R12:
>> ffff88814e7b1f08
>> <4> [317.128172] R13: ffff88814e7b1f08 R14: ffff88813cb99c00 R15:
>> 0000000000000001
>> <4> [317.128174] FS:  0000000000000000(0000)
>> GS:ffff88846f280000(0000) knlGS:0000000000000000
>> <4> [317.128176] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> <4> [317.128178] CR2: 0000000000000010 CR3: 000000011f676004 CR4:
>> 0000000000770ef0
>> <4> [317.128180] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
>> 0000000000000000
>> <4> [317.128182] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7:
>> 0000000000000400
>> <4> [317.128184] PKRU: 55555554
>> <4> [317.128185] Call Trace:
>> <4> [317.128187]  <TASK>
>> <4> [317.128189]  ? show_regs+0x67/0x70
>> <4> [317.128194]  ? __die_body+0x20/0x70
>> <4> [317.128196]  ? __die+0x2b/0x40
>> <4> [317.128198]  ? page_fault_oops+0x15f/0x4e0
>> <4> [317.128203]  ? do_user_addr_fault+0x3fb/0x970
>> <4> [317.128205]  ? lock_acquire+0xc7/0x2e0
>> <4> [317.128209]  ? exc_page_fault+0x87/0x2b0
>> <4> [317.128212]  ? asm_exc_page_fault+0x27/0x30
>> <4> [317.128216]  ? xe_migrate_copy+0x66/0x13e0 [xe]
>> <4> [317.128263]  ? __lock_acquire+0xb9d/0x26f0
>> <4> [317.128265]  ? __lock_acquire+0xb9d/0x26f0
>> <4> [317.128267]  ? sg_free_append_table+0x20/0x80
>> <4> [317.128271]  ? lock_acquire+0xc7/0x2e0
>> <4> [317.128273]  ? mark_held_locks+0x4d/0x80
>> <4> [317.128275]  ? trace_hardirqs_on+0x1e/0xd0
>> <4> [317.128278]  ? _raw_spin_unlock_irqrestore+0x31/0x60
>> <4> [317.128281]  ? __pm_runtime_resume+0x60/0xa0
>> <4> [317.128284]  xe_bo_move+0x682/0xc50 [xe]
>> <4> [317.128315]  ? lock_is_held_type+0xaa/0x120
>> <4> [317.128318]  ttm_bo_handle_move_mem+0xe5/0x1a0 [ttm]
>> <4> [317.128324]  ttm_bo_validate+0xd1/0x1a0 [ttm]
>> <4> [317.128328]  shrink_test_run_device+0x721/0xc10 [xe]
>> <4> [317.128360]  ? find_held_lock+0x31/0x90
>> <4> [317.128363]  ? lock_release+0xd1/0x2a0
>> <4> [317.128365]  ?
>> __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10 [kunit]
>> <4> [317.128370]  xe_bo_shrink_kunit+0x11/0x20 [xe]
>> <4> [317.128397]  kunit_try_run_case+0x6e/0x150 [kunit]
>> <4> [317.128400]  ? trace_hardirqs_on+0x1e/0xd0
>> <4> [317.128402]  ? _raw_spin_unlock_irqrestore+0x31/0x60
>> <4> [317.128404]  kunit_generic_run_threadfn_adapter+0x1e/0x40
>> [kunit]
>> <4> [317.128407]  kthread+0xf5/0x130
>> <4> [317.128410]  ? __pfx_kthread+0x10/0x10
>> <4> [317.128412]  ret_from_fork+0x39/0x60
>> <4> [317.128415]  ? __pfx_kthread+0x10/0x10
>> <4> [317.128416]  ret_from_fork_asm+0x1a/0x30
>> <4> [317.128420]  </TASK>
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> 
> With the above fixed, and a clean checkpatch:
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> Thanks,
> Thomas
> 
> 
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 5f2f1ec46b57..5e8f60a8d431 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -682,8 +682,8 @@ static int xe_bo_move(struct ttm_buffer_object
>> *ttm_bo, bool evict,
>>   	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
>>   			      (ttm->page_flags &
>> TTM_TT_FLAG_SWAPPED));
>>   
>> -	move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)
>> :
>> -
>> 						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
>> +	move_lacks_source = !old_mem || (handle_system_ccs ? (!bo-
>>> ccs_cleared) :
>> +					
>> (!mem_type_is_vram(old_mem_type) && !tt_has_data));
>>   
>>   	needs_clear = (ttm && ttm->page_flags &
>> TTM_TT_FLAG_ZERO_ALLOC) ||
>>   		(!ttm && ttm_bo->type == ttm_bo_type_device);
> 
