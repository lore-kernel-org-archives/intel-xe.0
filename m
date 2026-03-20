Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2127108B91E
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 12:47:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522DD10E1D8;
	Fri, 20 Mar 2026 12:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D5JrwUvX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB6C10E1D8
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 12:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774010829; x=1805546829;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vQwM1KJHfyReBE1dyt21lO56M/kgvs64Z5tjGpv9AQU=;
 b=D5JrwUvX1uumRQM7fpTdcHSzBF0tIHTlPYyvSBuQGwzsGfu0uEkFy0lw
 cm1vDOO3KqjaYAyrhJlGcklgkep7DNiXPaG02aZN6neN6apEfoL2YPSMC
 AJItw51ZiWrRQF9LucmryudNiI/1DlJGNsj29+E4ADRjJ+G8QBdAcKHrw
 z+QdYKG41B470SKFxXUOkz4QXAIhCc076EIvins0JC6SvQO276/SxdSOM
 s+kqp5Sjv9i1TDyMlJbEm7uE6wp9mIQ2mmRxspc82KiDvEzhKpgl6qvDW
 mtn5CbnVYJ4hU0aQCgjHrSMpPAB0CT8YHjCRzfTqZ/4jH6i+XiA3RkdPo g==;
X-CSE-ConnectionGUID: CnSsPHn4TyCa+Yb0MM1zpg==
X-CSE-MsgGUID: HbMReHI3TXC/Z9KG/+crWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="100548707"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="100548707"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 05:47:08 -0700
X-CSE-ConnectionGUID: jbfISVfNQNi2CCCGuqy1zw==
X-CSE-MsgGUID: ha4+JxCmTSOTYftsBtimiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="222364628"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 05:47:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 05:47:07 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 20 Mar 2026 05:47:07 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 05:47:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QlgBuiQVIwnZmZjPbaVH7q6Vjk/xhtf+dsnpW/HQ1MNu7pVZkqnB34xuFuD7PscKmn58+mzCEAFKzEa9lOWh6f3bbd4w75O4MIn6gxSFsYsRfcer6JY0vdgejjJVDiiGIGLkjq3FBTaZhvMxWWfYph+3hvIwp0pr1BM/F1BtTdZqh6oa3A1Vw4oCi6NScKMUe9wpDY9AWrW4Tznpg2ZZUb14KkehPKQoqaH5ETj7gnd1G96OBB/ul3OTTeI55KYKfxd/4Ft1IhQ3hM6967abgoDDVdAsW2PxIeJKs1Rk4+in99qBdr9fpV7Hkb3ksP1DvVFdjpQqjE1twK3j0Z84pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0a9ZAihxNPnbqNu+Xe8cL+yzeATn6mETnqnFA6eDjWg=;
 b=WAauwQ+1+J/tq9d317AtTzWfTBr4tihNbEXkfZBuoETv/TwS7bK8BcfW7pcJJp5f8crEZE3etS4lKvY1cIOAQhrxAHIsJwqv5ERiyTG5NykbxgMiM51Nfgce1khOCsEwNNVEiB4NcnvdhEA/78HYWbcKZdb1/hkHiPa9tKC50QJVrCHByvc27diEAmNgwMwgo4sgCfuYtSqTRzdLu2IQjWK8NFsqZC1v0zaGtq/glpYZPUS95o0V7Wqze8wJDWsalgRjaap8gXOg783tvkLMLtQjGVOngwv2oSZsdcVnLSM88Ec+su6Lbmnv+UOhrMJCsjzDeSk6pVUnOMkIFGNr+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Fri, 20 Mar
 2026 12:47:04 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%3]) with mapi id 15.20.9723.013; Fri, 20 Mar 2026
 12:47:04 +0000
Message-ID: <6cf0b3d1-8bb8-49c8-b4fd-9fcd6954753a@intel.com>
Date: Fri, 20 Mar 2026 18:16:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: drm/xe/hwmon: Enable energy attributes for CRI
To: "Purkait, Soham" <soham.purkait@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>
References: <20260310122018.2734260-1-karthik.poosa@intel.com>
 <ff7a6228-1741-4a54-978c-dd70a16a2973@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <ff7a6228-1741-4a54-978c-dd70a16a2973@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0189.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::11) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|SJ2PR11MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: b9f6ed64-3b10-4865-cbc7-08de867ec974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: K3TR4SQH/8Mvkqhe6s7hZHfn6eVsgGKmRt9/MXEUg3YVck4HSwRaufefwHTc0zQrfM6RFEvl8Kigr2aE50XwoqBwvQ+jn4tYfhAA4OBXTCZmOyhrjV4m6lHTAiZ359HG3hTxU7H3XJ6BnMb9iJpSim1sLyh7gR1z0OmBIR3nVdJXSZiIKqQalq0WZVCQ/JG+jjEqEkTbZAtDvIVj/BTwljXDi+3HspG2D5jl62/47oTSK7HEYEmjLMDSV7O1QK5Dz6/BSNg6Aj6ENnjHyvV9feZ6bRUFjXZ02Yi0AuVHyuHptCpj+AZa7DUIUYBfrEsH3araHN5lkOKzTsg3Zm0pl2ape0VEynEbVzQVYuOyWrNcLwQpOuDi4KVrK17Q23N2QdSKiRDTagDylPLPe8IFJlY4uXZOqk2sEzsbux04cCr7yASe/JybFY9yX2VV/FnNpIUg8smnrdJvCS7Tv0IPncwFWCwk4EB5gEfSPKegE6bxMl0macu1JtHj07JX08dLAWUSds+h9PopVFalSuDtXi4fUYyPg/n8oHvCuC3AYyQ4sN5wiGL2c+nGdXbfvgaWcqdr2cOXORjZxdOTPaQ+pU6Esm/xL9X+63CssVQOWsIDstwHsU9XiWTDo8q2mSsTwn3GkG5Q+/hOCXVkhAvd219IGE/L3a1rrmXHDKAweSL3m7xTvavIljUNFQ8ly1WEhlTshJILL/nvISzVxCLkVLabciOp72hokzgDSPOeP7Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGRuYlVRWERBL0pQdnRZU2xqOURVU29Rc1JxWTRFNmhLNWE4cFlweFovR05U?=
 =?utf-8?B?UU82VzBSaTh6MHl0MHpURnFMZThCeFZ3UjRDaVA0M2UyeEw3WUVWWGNQaDhL?=
 =?utf-8?B?b0IrYU5iMUFUUGs3N2p2R2gzLysvakRDWDZjS25KalNBUnZ3bmxMdkFvT1kw?=
 =?utf-8?B?bytoRUlJUkJYMXVpb3JmY3Q4VGc5UFdaL0J0djF1UzhYb3BIVCtUWU9CdWpk?=
 =?utf-8?B?L3U2SkwxWlZSaHFQVWNWSy92UG5wWVlsS25CQzl5eWkzR1NNSjM3ODlzVUFT?=
 =?utf-8?B?dzJ4OE4vQWpPVlZZT2xmZG4wUkc2OHFrYkxkdkNJazNuTGtUZUc0QWMwY3dL?=
 =?utf-8?B?alBjc3hFdnFzV3I3V0d6bndFZEZyMFhvc0FYQ05RMFJFZVY5bmU5OGhGRm1y?=
 =?utf-8?B?aWxlb24xdXFSK0I4S2ZGZ2lQbXFDMW0rb2ZPY0o4bHZET3YvOGNoU2k5QThj?=
 =?utf-8?B?azY5dlhQYURlZ0crclVVNXdtWlZZSWJRVVZnMXg2MG4ycDdWMzJkeHBXbG1U?=
 =?utf-8?B?M0dNK09MVXE4Rnl3M3lVN0FsdWZxSVU5MHNMc2QzTFhXVUcxdUV1WjlZR0J2?=
 =?utf-8?B?NmUzZ3JjdDlYUXlIaGxSR1ZGVG9mM2pSR2RtQkIvcFBRMWVibjFock5jMlNC?=
 =?utf-8?B?VUpKWXllUU5mY0VWaHpqdk5yYStlT2liRDlXNEx2U1AxZTg2NC9nd3l2NGZr?=
 =?utf-8?B?N1Z5THdKa2FJQVhzek5Rbm12Y0JtK2FJUFI5dXFuQW15Um1wU2Y4NHREanE1?=
 =?utf-8?B?ZG5CbzRpR1Y4SnlNSDNseTI3UXM3YTBxVWJqNXJocmhjRU1ESnpINkNjcjhK?=
 =?utf-8?B?T2dxcWM4NEcyUnlielROZUZIeHpHNGc1d0xiajNFQ1hUUzVOeHhMaFpwOWYz?=
 =?utf-8?B?Vng0SUFkS29WamFVcmQ1WVdGRCtQQ2xMZlBwM1dDV2VyejRwOHZsWlVod05r?=
 =?utf-8?B?MXN6WXcrSmJlUlE3SDhpYmVuVWtTOHBtWTRzT3EyS05iWlE1YmduUkJFV3dx?=
 =?utf-8?B?NWU1bzErVXNsYzFoNjhBQ0xHOVBRR0h5TVE1WVJnTzYvb0pLRGZHNzlSemhp?=
 =?utf-8?B?ajVQKzlvT094SWJCZFI2NVFRYStzMTBhTVZzajQ2K3lnOFdCQ2tXcnZoa0hR?=
 =?utf-8?B?N0NKTUxZM1A1bzNtanh6bnVSQUJEMllsbkFhV3lWeU9XVy9DcVVwU1JwaW1h?=
 =?utf-8?B?Y3ZkOUxLOWI4RTMrdEFGWkdBWllXRmpmQjRteVpseXNVWWxURmxoeFJlMXlp?=
 =?utf-8?B?RDVqK2ZreUxNWWF6dXd5UVE0ZFI1TFhqTmI3RkdhS0IyTDVEWW5BR0IxaXFK?=
 =?utf-8?B?ZWp4YlRvb0dXc3B2M0ZZVVI2djJOTHFrdEkrZ1hNNEJ1Um0zRDFFZ0lPQ29X?=
 =?utf-8?B?c015d3ZaUjBlMGFIQlRhNUFDWVVmbkxBWVZsa3VWdlIvMjNQYlN4bWNXWmV4?=
 =?utf-8?B?ajhCSVdJV0JPbGs0d3hlME92OGtDUFpvNUZrZ1NHeHlYMlVmdXhHVjJZVVdY?=
 =?utf-8?B?TGhJdjROa3NybDA1YXFnaDUwamZNZkRPLzZ3dmdYVUEvcFRRRjZjYU1RUStp?=
 =?utf-8?B?bGxvQ3ZIMEpaUk5zaUZuTHJ4NW0ybUt4YXlkUCtxWU5YM3YxV3AveW5HdVV1?=
 =?utf-8?B?TUd4VEl5Z2x6NzVJZjJ6WjlPRE90ejJOOVFNV1NiMHRLN3d5NlhHM1dtTHBK?=
 =?utf-8?B?Y0hmQ2FrckoyQUpuOHJSeU5YR2syTUtvSXc5V2c3aXM1azZSQ0l3TlFiZlRG?=
 =?utf-8?B?TWxGZ3M5aUhrbGRHZFNZRDVmQzkyM3ZjYTBGQ211MzgwdmJISENmSG90cDR5?=
 =?utf-8?B?MUVJc2c1Q1NEajdwS0p2OTRzN0YxTlE0b3E1WWorMy9rZVRMV09hcFJHRTJZ?=
 =?utf-8?B?MnptMDY0cHM3VUgxQlR2alBDVFUrTDhXUDJXbkRxNjVNYkUySENnMzcwUk9n?=
 =?utf-8?B?RzAwNkRNZHd2VnBrQlVFV2NsZXlTYk9sY096cDB6T29HOFlqY0RlMWlRaTY3?=
 =?utf-8?B?SFNrQ0NaRmRiSGIxOEdOdjZZbEtoS3ZHam1SeitrcGRHVlN4R0tPZWg0MHpV?=
 =?utf-8?B?L0x5UWlvRVVWcURyVEh2dFRNWmdPd2hYcHJuYUNCT2lmSlZMNStyZ0dHMHhu?=
 =?utf-8?B?Wm1FaEt2UnRCZlpRcUVYSTh5UlU3aVpPeHY0dzdRUWc3NUVjTmhOVHpyUkJz?=
 =?utf-8?B?QkxKUFBYcFQ4Y3pONGRpUUtVY2VTVENmQk1WaE1WV0JNck9sTHdQVG1RUGNu?=
 =?utf-8?B?UmFqL1g5MURxaXpJMll6UDhRdEFINXA3aWg4Z28vekpVNUFlT0k1L3pTYW55?=
 =?utf-8?B?U09Ra0pvK2o5aWw1cVNtWlgxQ0ZwUlQ2Z1JnMWZxYWdrRk1QZHYvdz09?=
X-Exchange-RoutingPolicyChecked: YnqwguMNzv5qVSpSIHF/14Sd47kBrEQ+g5D7C/0nm6i/vy2vsOJn7yEzttjQiuTwLFnUjWN/28OR5bZMO8a2Pb9uPdU7eJOkC1V7F5g8GkBE9u4ZCRZHbcL4FqEa6LySwtXl7lDvGraj/DwnZoez68Qk6Of0SfV4ZQYihrygA+4n8cMcjXa8Wd5B0ooYCo9QESaKwzLA468FVn8EdZ87NEoqJbVBwp0HHq5MavWa9J4hPvFuihD3wpBwCvSloIkubh0/JE5/5OA6U6Dlr/ewELrj/7v5IlFR+1tFSlreJa1KnYTS3G/iMjHqftg61xJ6a2DBj77LTVyGCfF7s4n4Qg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f6ed64-3b10-4865-cbc7-08de867ec974
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 12:47:04.1577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tTyXFdCDr2UlVcPXMOmNBB8fglFZEhTmKzlxkIADQgccuysygLDkRsNBrRn31H+P0WVm6ADQ65mvezpuqQq+Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7617
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


On 17-03-2026 10:02, Purkait, Soham wrote:
> Hi Karthik,
>
> On 10-03-2026 17:50, Karthik Poosa wrote:
>> Enable HWMON energy attributes for CRI which is available through
>> MMIO registers.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_pcode_regs.h | 3 +++
>>   drivers/gpu/drm/xe/xe_hwmon.c           | 7 ++++++-
>>   2 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>> index 4b3c46eb858f..c63b409d7a82 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>> @@ -27,4 +27,7 @@
>>   #define   TEMP_SIGN_MASK            REG_BIT(31)
>>   #define BMG_PACKAGE_TEMPERATURE            XE_REG(0x138434)
>>   +#define CRI_PACKAGE_ENERGY_STATUS        XE_REG(0x138120)
>> +#define CRI_PLATFORM_ENERGY_STATUS        XE_REG(0x138458)
>> +
>>   #endif /* _XE_PCODE_REGS_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 0fd4d4f1014a..852681bdb84c 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -296,7 +296,12 @@ static struct xe_reg xe_hwmon_get_reg(struct 
>> xe_hwmon *hwmon, enum xe_hwmon_reg
>>               return GT_PERF_STATUS;
>>           break;
>>       case REG_PKG_ENERGY_STATUS:
>> -        if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG) {
>> +        if (xe->info.platform == XE_CRESCENTISLAND) {
>> +            if (channel == CHANNEL_CARD)
>
> Instead of using if-else better to use switch-case here.
>
> Thanks,
> Soham
That will need refactor of this entire function. Those shall be handled 
in a separate patch series.
>
>> +                return CRI_PLATFORM_ENERGY_STATUS;
>> +            else if (channel == CHANNEL_PKG)
>> +                return CRI_PACKAGE_ENERGY_STATUS;
>> +        } else if (xe->info.platform == XE_PVC && channel == 
>> CHANNEL_PKG) {
>>               return PVC_GT0_PLATFORM_ENERGY_STATUS;
>>           } else if ((xe->info.platform == XE_DG2) && (channel == 
>> CHANNEL_PKG)) {
>>               return PCU_CR_PACKAGE_ENERGY_STATUS;
