Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36EDC5DF85
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 09:10:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C5E10E93E;
	Wed, 19 Aug 2026 09:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bcWYLFRh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9CC10E93E
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 09:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787130626; x=1818666626;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=eTXHHYzY+TM4xe5Hkv0D952UDJJvvqKJDXeIriv4rOQ=;
 b=bcWYLFRhqOnTX5UnWkEG2bIpLYiK0duRyzOiB4RmJIWaT4MOA3C2PRXe
 rM603AyM0RHKAFAQ3mxFrCjz1wIW45dxFvRWbwbVsbMRT5y4nTBR2crr5
 J9/m5Vl5LVmwymQQG5LJvaKe8fHVxWiZRiNyl7FTd93IN4p4wM3ORGUsl
 dQ8rb1XdPkiluzDdk5HQuV9ck5kK6raLuLElqVlL7EB7nHXaD1hQd04Su
 Abo10ZIFwBcxiq1oSyZQQYifS6LZ6h13/AZRsYnuDnmaSARGowUUtuFI7
 8LyFxz8hoLnNeRC0cnqn3PqY5cY2+sTg2UDuZ3qmeuwsXhzZL5pFLBSFM g==;
X-CSE-ConnectionGUID: SvNkWC/PTROToJrbNebqYQ==
X-CSE-MsgGUID: hA/1am3HS5m7lzfQEjeenA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87495297"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208,217";a="87495297"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 02:10:26 -0700
X-CSE-ConnectionGUID: zcyvNp5oTn+IvpMmDq9Y8A==
X-CSE-MsgGUID: wra2XXIFT26rdie/R/7I6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
 d="scan'208,217";a="267442891"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 02:10:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 02:10:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 02:10:25 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.30) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 02:10:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYYzp7aob251RkRnuFa1BHE6D//m11VEx8ymqae5em7F9e0LH2cw6wAXSJKPuqZz+f5LJQzYmzwROo+YePmxdzd+14+ctmM7UY3ZRj0jxzCq8E6OfB4WA2NXuzirAQwYXUBQmwAiYjH9jZcjW5SfqrtgEuLcU70GdCr50Y6a50Eieid696bUrcC+PPJs0KltlsfA59U2XFegNSxs6qZbxVxQd+GzwzNlbAdLorLo4lVvjJq6/0Hp/eV7rHQi/2JOt+k/vAI4xAifqVBlePHsFvWOzzk4DsiZc1Z77yaeLfan+l4IVHs+HzvVcNvdAEZCLF/pUIGNOg1dGrcW2p1tXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3i5X4QpT9Hh5vNFAuUoax5j/CukN/NIXNswSJs8Rjo=;
 b=FQa1Lu7Sml5CHt0eyAYLq4pxIQVoxpO8eijCvU0deQblc608Iaz7FwHdTWjiR1y8cFxAzl8MOiBQbC3Bq9u6UBgPI6e0Xlikrv0ZNVlbnm5heW2MBj/GzcOSh8foS8jfUZgEmOg9WtcJcH91g1X5+fk+mMqsCF56WXTFS5owZ/RxvyVBzKdjRP/gn3i2pFampXkeZJLVhjKdDvlFHBlVvqnAowGiRAhv/ZwbnbWB0cXF/HpSWfUfVreUADYNoIbBB8lNEGXZ5ySWZ4bQsbaqPBbercn08VtYQ8kVcoX4e5GO0GlynWKub9eElY0MMrzxGRnifh7tOzV4qgCHVmagcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SJ0PR11MB6622.namprd11.prod.outlook.com (2603:10b6:a03:478::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 09:10:23 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 09:10:23 +0000
Content-Type: multipart/alternative;
 boundary="------------nHBNUCMgmUi6uxAzKzK3jWdu"
Message-ID: <6e04a328-06ec-4d32-82b5-e8c408b83ba1@intel.com>
Date: Wed, 19 Aug 2026 14:40:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/ras: Report internal HW errors from PUNIT
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <aravind.iddamsetty@linux.intel.com>
References: <20260818231716.731788-4-umesh.nerlige.ramappa@intel.com>
 <20260818231716.731788-6-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260818231716.731788-6-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MA5PR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::9) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SJ0PR11MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d6279ab-2e44-4669-57ae-08defdd1b32a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|56012099006|8096899003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: m6BCrnBVNMavlBegcuR7UTsBDUCj5gvKdW2jnaWxNdnan1e2FM3toAL3dqa4+qOvVcnMszfNxDNb788OvzsjXth6AIb00cQ7OCDopzYmFLS+D4THCNfp5NTqBduX0gmF0GdnauE5Fz/uo5b2QPc1aa8YFJ3/atcqQJ+jyv6b+PNjMY+YE1zHsTH1YwjS7Aeoul0GUBJr4dsnSnHZPIBwoTafGO93dHhCZmGj+WtkYZ8029ZTGa71zlNEAbUgxCM65onwFQZkoCAifpm/dpsyocMFMk6GhTxJ2+6LOaEJXJDs2Th92Pchcw5bO5qTsI4JC/QNnqbNS4sBezd1waf8ARmkke2F138huHDG2VnO/pr/5GypU56HPIGRbM+Q9zFsl7yjyn7euvoVHqnqrteUP6VBU8bNpdq9Nvheei0HyihINSIiwvsmR9jTuGNvKaGEyk3dt0Kl6o13cmhuW0j3pL1nMQtAt+WEOaJ2Of3CjgfnlSGpzFKw9cKEh74VLFpd4FaHgh4lKKob3GXZ/KGvGIZNzbVbCrNrw1FnC0LkPe5m/IKJRTeHWXmZOnJqz9gCxe2vWKTcyvGlK4Hm7AJKQQwi6Svh9GIvW9wWXKJE8DDq3KgS2nOQc30zphTwJisjeXHBcHbB4HI7AnVuCiu/hRHa6R4rAUAKUu1T870mY+U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(56012099006)(8096899003)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHZmaHc4cDB3OWxTYW9Pck56QWdjTEE4S3JUYUlVeUc4Tk9JTGJPK0ZqTm54?=
 =?utf-8?B?akxGcnVLSzhvaEFWc1N4aWpOYmpzaXVyUzR5UnY3TDNZNWFlSVJ0TThtczRi?=
 =?utf-8?B?aCsyQklOb09KaUMwb0QreEcvMzFtalNEd0MzbzljUkxWM0JWR1RNdkwxMVlX?=
 =?utf-8?B?Q3lIS3FMcExqc0RFUW1EVkhIVFVRVkw3TU5TQld2d3d3eU9pU2UxK1ZQUHVq?=
 =?utf-8?B?QWw0OGYyMXFyZjdaYzdUTXcrbjNPSHJBajg4STlBK0V3VE9XeHV6ekdBQWJP?=
 =?utf-8?B?elJOUy9ZU2QzZjZMU1ArUzQ4cjVKejlqSlQ4eUw2S2hoNVB1SFUyakt6RHZF?=
 =?utf-8?B?cURZTEpNL29NSXdMMnVQVWxiMDhkbVU2aXRuamJxZGJHOWZtYnBiTE8ySHpi?=
 =?utf-8?B?TEZ6Nk0ybTFCaHIvYU1mTVlPOTg2ZzUvNHlTN014RmRNMXZGRlJ3Nyt5MElu?=
 =?utf-8?B?QXROcGFnczhxOUVrbVFoalByWitKdGlacSt1UTRHQ01kbTVEWTA5VHQ4VW90?=
 =?utf-8?B?Vm16dStuSVZPUWVnSTYvdXVjTkozdHdoeGZMUmhQbldjcHpoUllYWDdaNk80?=
 =?utf-8?B?ZnFGOXc0R2FHRS9EL08vdzFnNUM0bkZYU2dWL1F5RFVhdVBFaGVoR3ZXb1d4?=
 =?utf-8?B?cC81L2kvalZhZGlta1pXVFdzSy9EU2U5dHhrd0t6ZktVOUhKV1VxQ01NRFVX?=
 =?utf-8?B?a0N0OVpzYWoyZE5zZFBKT2ZXMGluSWlvbTFvbWFCcWFjZ2dmUnROYmRuZUNl?=
 =?utf-8?B?L0pCNTRpK09KM0RYY3lZWE92Yk1WWHVxbnJrM0JyUk84czhwMTBrT1U0c2RC?=
 =?utf-8?B?NStzNXNLbjhKTVY1Q21iTCsrb1ozclhnemEranJFaE5JanMweXZESnBTODB6?=
 =?utf-8?B?elhPSC9NWHo0ZS9zVEkvWTdiaHd3Wmx6dWNheFROMUU5eHdEcXZJOElEWVdN?=
 =?utf-8?B?UGlBRjlMSEVSUS9jZ1YwTnByRm9pVEdKTTU4ZWxSdUM3ZDRqQ2U5NStPZXhl?=
 =?utf-8?B?VmRHUENBbVo2SHRBMm1uUVRZNHczSTZENkhhVGpKVWJRMSt2ZGJtOEJJdzI5?=
 =?utf-8?B?VTZNRGRuZW5xUFFJWng2WFlDMVhRb0tHS0NjOVRkZUNRYlNEWm5CTWF6TWE5?=
 =?utf-8?B?cTNESzNwZ0hHYmxDT0x4ZEdETTFlN3ZvMHNsdHNpNFErOERkR3d4aE84dzBO?=
 =?utf-8?B?ODB3SzZEUmR3VG5qckh0MVlzSHVWZW9nN3BKbk8rNjlQb2kyMStrMHgwL0Y2?=
 =?utf-8?B?Q0dwTUQwZ3E2blN2bnRxNEJvZEREenVNZDBIZkRyODY3cGRIWmI3cU9nNzMr?=
 =?utf-8?B?bzRIMDd4SmQvVmhQVUViRmtCeDQvbFUvUDgxUU9STUZQdlRHZFJ2TXd2SHdk?=
 =?utf-8?B?VDRKMThyR0NZVXdIMWlYaG1LTmRGVkdFYWVqQXZvekEvNzZaM2lHazBDQW1Y?=
 =?utf-8?B?cUxKSG1wdGx0VDdoTTdqMWlpWFBRYW1kTGJDL1FNbzV1cVhEcUtjeDFYOG1R?=
 =?utf-8?B?emEzQlpXT253bEJJbFJtUjFtcE1sNC8wVDI1czlLRDBib3duQW51UmtoSEdV?=
 =?utf-8?B?RzdiQTJQL3Z6L3FacjZuSEpOT3F2VEh4d2lYSmp5Nm84M2FDYzQ2ZWZKMUlK?=
 =?utf-8?B?NXlyb2hhZE5lNkd1L1VvL0l2RlV2U2puVEJJaXFXcllWYVplS1dDZkJISnVu?=
 =?utf-8?B?NEpYb1Jva0VQRVlnMGVsZHVSWVN4b3ZsMWJ0VVhEbytoQlAwWUNMNVZ0ZFlJ?=
 =?utf-8?B?RFdsVlNrUU5rODBHWVhwODBpdVhFTmhERE8vUmpOMXAvRnIxUEFTZVBSUlNI?=
 =?utf-8?B?VlZVaWFMRXBvR3pNcFJzd2pPMHg5alIzOUF1NVFoUVY0Mk9DTXhhbDFCQWtQ?=
 =?utf-8?B?NVJiYWFHdFZwaThwcStwZUFYWk5aUG16NmMzUVlYUUhMcVlKYkt4Rmd2VVd4?=
 =?utf-8?B?dkFqaUNuTUMzNkRxQld0QisvekdNZ010SFQyZ0VsLzBDSmpGMWtuVUtTYkd6?=
 =?utf-8?B?b2FSbzJ2bW9pSjE0SXFzQU1OS1J1NU5uTVJBa1dXcnNFNWdxZ0Jpckljd0d1?=
 =?utf-8?B?RzFMK292ZDdidStLVFArN2gvN21yYVlzYi9waE04c1A2L1I4RGF3eExPWnZk?=
 =?utf-8?B?RGh2R1NMTk5TcDY2T0JwMW5jdUJsZXRWdmRONjFjNm1lSWJOUUJaWlA2L21D?=
 =?utf-8?B?ajRhWFVMczBWYncvQ2d2RnRkcnYrcFNYR09OY3pCTHM3T3MwRVRlVzYxTUFu?=
 =?utf-8?B?Sk95eEVKUTJOdHordVNhalVoeGZxZkh3OWNITmo0ZkIrekhHZk1aOVAxT2p3?=
 =?utf-8?B?R0h5SGNQVkhpK2svWjBQRWM4UWRHdnBpeWRCdGRyZ2tscEQxSnNSdHdwcmJB?=
 =?utf-8?Q?G/hY1gqkJKqr8pvA=3D?=
X-Exchange-RoutingPolicyChecked: KeESdZxM/cnRjRQeTbhiswByZVnReZ2m92OgHB+hVg3VoSGIHZm4QCvIgkwE0iZFKBEbAOSRIMty8ZFz60OgRIVEz3Obu5INaI46w8heCYFPoK/kRw6PyDlYxOYhGcYIefENjjjEhaA+ZLGpDkt4TZFCqjd4hIPXvg0NbSZbu2AOQ2igpbJ1yWhxivx45mFVsSx51LGucJcSWeSKX+bJKiwLsG6uOozhlzoHc0q4YDo1tUwAWqPrI9QqL5OOgEgrL+R9nU397/NFqjC9Jv+AAv6D6vu3Kbetz3FxsgJo2CLCYYntpCDfAa3orujzrmA2uGlpeDvDYk9P73EzbNkZ1Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d6279ab-2e44-4669-57ae-08defdd1b32a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 09:10:23.0290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jyy3h1QFV2HfHZpBswREq/LfBv1yGc1K2M95KYkuEmr7T6LQYP0CDbCc6kvAMQULa33KLoouVoqPJPOEYVdTaV5XB2Fj18HOsG9SYAUUhSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6622
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

--------------nHBNUCMgmUi6uxAzKzK3jWdu
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 19-08-2026 04:47 am, Umesh Nerlige Ramappa wrote:
> Report internal HW errors from PUNIT using the xe_log_comp() helper. Since
> the error results in a wedge, use CPER_SEV_FATAL as the severity.
>
> Signed-off-by: Umesh Nerlige Ramappa<umesh.nerlige.ramappa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 13ae54afedf7..aa790571f716 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -353,9 +353,10 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>   		struct xe_ras_ieh_error *ieh_error = (void *)info->details;
>   
>   		if (ieh_error->global_error_status & XE_RAS_SOC_IEH_PUNIT) {
> -			xe_err(xe, "[RAS]: PUNIT %s detected: 0x%x\n",
> -			       sev_to_str(counter->common.severity),
> -			       ieh_error->global_error_status);
> +			xe_log_comp(xe, CPER_SEV_FATAL, SOC_INTERNAL, counter, sizeof(*counter),

Please do n't hardcore severity, use counter->common.severityone.

For cper preparation, we need counter+response, need to confirm from @ 
Badal.

> +				    "PUNIT %s detected: 0x%x\n",
> +				    sev_to_str(counter->common.severity),

drop severity.

Thanks,

-/Mallesh

> +				    ieh_error->global_error_status);
>   			punit_error_handler(xe);
>   			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
>   		}
--------------nHBNUCMgmUi6uxAzKzK3jWdu
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 19-08-2026 04:47 am, Umesh Nerlige
      Ramappa wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260818231716.731788-6-umesh.nerlige.ramappa@intel.com">
      <pre wrap="" class="moz-quote-pre">Report internal HW errors from PUNIT using the xe_log_comp() helper. Since
the error results in a wedge, use CPER_SEV_FATAL as the severity.

Signed-off-by: Umesh Nerlige Ramappa <a class="moz-txt-link-rfc2396E" href="mailto:umesh.nerlige.ramappa@intel.com">&lt;umesh.nerlige.ramappa@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_ras.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 13ae54afedf7..aa790571f716 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -353,9 +353,10 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
 		struct xe_ras_ieh_error *ieh_error = (void *)info-&gt;details;
 
 		if (ieh_error-&gt;global_error_status &amp; XE_RAS_SOC_IEH_PUNIT) {
-			xe_err(xe, &quot;[RAS]: PUNIT %s detected: 0x%x\n&quot;,
-			       sev_to_str(counter-&gt;common.severity),
-			       ieh_error-&gt;global_error_status);
+			xe_log_comp(xe, CPER_SEV_FATAL, SOC_INTERNAL, counter, sizeof(*counter),</pre>
    </blockquote>
    <p>Please do n't hardcore severity, use&nbsp;<span style="white-space: pre-wrap">counter-&gt;common.severity</span>one.</p>
    <p>For cper preparation, we need&nbsp;<span style="white-space: pre-wrap">counter+response, need to confirm from @ Badal.</span></p>
    <blockquote type="cite" cite="mid:20260818231716.731788-6-umesh.nerlige.ramappa@intel.com">
      <pre wrap="" class="moz-quote-pre">
+				    &quot;PUNIT %s detected: 0x%x\n&quot;,
+				    sev_to_str(counter-&gt;common.severity),</pre>
    </blockquote>
    <p>drop severity.</p>
    <p>Thanks,</p>
    <p>-/Mallesh</p>
    <blockquote type="cite" cite="mid:20260818231716.731788-6-umesh.nerlige.ramappa@intel.com">
      <pre wrap="" class="moz-quote-pre">
+				    ieh_error-&gt;global_error_status);
 			punit_error_handler(xe);
 			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
 		}
</pre>
    </blockquote>
  </body>
</html>

--------------nHBNUCMgmUi6uxAzKzK3jWdu--
