Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02944C61DBD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 06:14:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4EC10F251;
	Fri, 28 Aug 2026 06:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l21GF8yZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4D710F251
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 06:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787897653; x=1819433653;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1JvQRWJTq8qMs0fqO1v61c6UYtMnBwiGQ02CBFGkywM=;
 b=l21GF8yZTyJ0DVNUSvxSoXAaHCWllAWzynh6qCUCejFtQ+ZxC1jakDCw
 FgDMI2ec7v54kNKWDWrXKTWiGP2Is8Vctt5+XlvUIWSvFLp7R38g2eC5R
 JGuElvms48+lY3UGC8AmtgSkCz2tdj3/bN4gN0hLc4sI2riVEOiVWN0m4
 YHZQ4+LutnPvBFzimDA/2XPiZ6RfTrBNgXUDNRwRKfIY8NDUYMmWq0zC1
 ODIqTmvkqH8c4D/1pSk24PJINX6FXFGCJGKVvvj3IW9DHsvFWWz/HzsXt
 X4aCGP3oHlwZhzoHJXzATNlEj0hYH+ipVioH3h/+CDsSbXfiPSkhQ8eML g==;
X-CSE-ConnectionGUID: onXeIFvJTk+h68QO4ivg+A==
X-CSE-MsgGUID: 5e8gZE8UQre5vxu1E5VQCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88608245"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="88608245"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 23:14:12 -0700
X-CSE-ConnectionGUID: RRgh97i0RW2N3Bzo1AiRwA==
X-CSE-MsgGUID: p+ExNDD3R/SHTaHAdGZRCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="267483948"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 23:14:13 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 23:14:11 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 23:14:11 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 23:14:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sDB93bd/8z/g/lMAK2XcGJeESOM03yUypjxZv5Dpmo7qZh3dtYRFeXFeHYbvmpP6dwsqB2SbN6xALZVCt+GYFFgeL2iLSsxj+9QUqFkXdOUON0n2py1i41xqYJXZOq9q/xU2gVLXnc34K8H4Y3fSNk8VbmV0CSWAx/mJzF3+Ini1z7lpnG5nJ3VNfuki9xDiL0ujJlmpfktRWWdLd0lRuiEsvZaBV4d2KogC1Knbr0uYou0242x/FMJQcquQgUYswH5UgT+I1tlHgDAoblxxl+pPIS9C13CdQLxoXFs5tbt34fRFBDxCbyfhA4zZ4B49zn3mzB4mNs+pGu6bQpZoeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/6ry1ZCXpiloDdus/9D+2hP9tGI147Rvb9S9yxccuQ=;
 b=MVXZ5Ofmj8hMrS9wCv0s++QFKPo9J1+LDvNXFI19DkYaiEP5oybUeZzKdksBK/GQl2LlqKlqkJF47X43j3SLoviM1DqHJB9LrFGCc2gZs7GBMblwYoUk2LPk30Ou7p//TmWFa5CIB2LX8IltsbDpd/s3DMI7hgAJRR7ztbF2xi0fiku9YqkGnGB0V5W/7mh1YLkfVMBCJXGTVH9B8lYeLZ5lTopkGX7GlEMazUCJvddoldxFHs+FK9+7+Psox7NFDNixVCksR9jpVvW7ynbVN7Anso2iFM55fIqmc8smBX8UexSfYrAq2zZx56DIMZkI6NoFN6wjK33B6vYtLziWoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS4PR11MB088116.namprd11.prod.outlook.com (2603:10b6:8:507::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 06:14:10 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 06:14:10 +0000
Message-ID: <4096669b-0880-4c19-b6dd-7572d9a25ee4@intel.com>
Date: Fri, 28 Aug 2026 11:44:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/xe_ras: Add Fabric error handling
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
References: <20260825141109.3797483-4-riana.tauro@intel.com>
 <20260825141109.3797483-5-riana.tauro@intel.com>
 <a063221b-7a11-45a7-bac9-12d19f6a2a76@intel.com> <ao9T2POk0wXbGf4L@intel.com>
 <6f8e5f5e-7bd8-4fef-b714-ef077f50812a@linux.intel.com>
 <apAtcSNzTKnNGU9q@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <apAtcSNzTKnNGU9q@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0296.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS4PR11MB088116:EE_
X-MS-Office365-Filtering-Correlation-Id: 87ae213e-b53c-4e1d-2526-08df04cb92d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: XbqJbOmm5xb0P7OQC15gRa/nw6eu2n3mivSFjOczJxE1fUHSgndS4NiBIU56+kySCapCbpYbI+VFSk69zOvhHqzSX62nJlMPozfETycHa+DKgtQ0SgaLNO4TAnwq9MGxbHmaVTdHdn2GGgG7pJ/M2+wnJpoJzxZX3JViPnR8DiyKgqdNRRYalKQrnxfA3Bx7CCam8qF69gsKUmrT28pEmoJQCSXw6XJ+GwoxzNva1vQulA5uMHZ4rlZrLaZ17rHbgRNRrcX0lq1lkfaXreAI2sasATqxHAwe1Dgi8czka/DWVifnwk2p0rDHHgcjI7enLR56obbI4YGTZlyClVNZDCTkxGwjv3JpM28TR16EZYuMGdWXFG5JpGeyivxMHwRpxugdjVu4Vcxn9mUCuZyInuw6m/TdSPIsVAydMsNYLMiyx3jPIZlTPqcCaDjawWcEinRUydYOT9EQe6WXe6+MMH2WJfAxTOugt/hQeryhbDzxqQjtng69FrBNXOX1FtjukZv9/4bi4wiHDY9h/r0YxLOgPc6CbSTOtHCMS+CdJhLFtC8d3utlE9SLcwk/NAfo7Bqih/lKlTtenLZYVFGXXtrXu3gH8du2tFW2liwroDjrA4r6Z4UMJGqBpLppHukcKJSrsk8Q2+ghTagwU8GUnuAO1DGJLcQK4XQYiZapUnE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDJUWVQyUGJ0T1BBN1UwU3prMFB5UDErQ09OU1h2TE12N2ZUaXU0bVk5ODBN?=
 =?utf-8?B?QlRWemxkQTdqeW5mYklvMjQyUUYveWJTRCsvMnN5emdwQlFMZjBFWXdyWFYr?=
 =?utf-8?B?YzRheXR4N3YzN0hyY0luYmNob3JzcS9sWTVXam96d2ZIY3ZsaklraUZnMERI?=
 =?utf-8?B?bEczWXAyK04rS1ZMTzA0UHZrU2hKYXFma0p6c1A0T3RYbVNKNEE3U1hsVjR2?=
 =?utf-8?B?NFg3bnN5YmhXL0hFTk9LUjVWZU1oMzdyemJvaGR3dVhvc2J6QUMwQkFOMHVn?=
 =?utf-8?B?OVNXQ1dTMThZTDU2NnM3MktGVEt0dWdTa3o3ekxzYXVlWCszNUhrL2ZWVXhJ?=
 =?utf-8?B?ZUljbHFQemtBREUrQkRoM0RTZi82OG5LTDBHWlcvekVVWlB3ZHhLWW1MV3pM?=
 =?utf-8?B?SWpKcHo4a0tSd1ZYbTVhR3VueFN0WGJGZk5nZmxrOW93U2E0RnFLWFQzcUhj?=
 =?utf-8?B?QjBkYzVHU3p0N1pXRGdwa1BFN1hXZDhYRDYwZVdQZWU2TzZrVG5XS0NLa3lr?=
 =?utf-8?B?bnJuRDgzMU9ickdrbmNVTVN1S3Bzd1dIWXpZNDA4TGZVTHdlaWFLZ21TaHVH?=
 =?utf-8?B?ekNVR0dVdTZYZW5ZZitVakNueE9mZ0h6OENkd2NzZVZCcVVNVWNlQnd3R0Rz?=
 =?utf-8?B?Q2JxTTRZNUowcC9yeUJNeXdhNVg0Rk5LM1F1Q0tzQzErQWpWZTNjNWlySjI2?=
 =?utf-8?B?a2hJWnNwMm52cDBBZ1JwQmtMeVJac0ZNdlA1ZXZBL3JSUGxmbVNmTHUwdmdQ?=
 =?utf-8?B?RXZIblRBUFlRUnpQVWI1cmNvQzJDWE9Vc29KRFdobGVUOU9peVV1UHN3RmxJ?=
 =?utf-8?B?eVdHenMvbmNCcGE1cHJTUUcwN2YzejhoZ0tWM3l0SGxxdGFrdzVSZGpMZ2Zz?=
 =?utf-8?B?N0NrelIyRmI4aW44MGdreEpFY055YlN1MUltSWdBSFYvcm1Ybi8yVThIZytZ?=
 =?utf-8?B?bytheUdxczNydjdsSDZrUDZQajZsSGUrNUdUM2JiMG1ldW5nYWF2Yk1nejVH?=
 =?utf-8?B?WjQ0bVRrV3BZc1I2MnVOUnpZdHlCSFFxMytETG4zRHo0dlRaT0QvN1RPRHhq?=
 =?utf-8?B?VWpIbkM2UkdsSDlOL20rRjRBem9yOXAzKzYwRXEvOUhtMGl1d0VVMUROZnIr?=
 =?utf-8?B?U01OdVFwaHJ6TUpWVUNFVVZxWkpQNVRzdTlhMnlWTmdJNEw3eG9FWlFpdFRP?=
 =?utf-8?B?Yi9hWjdDc3I5RmFkNlV0VzFrd2xKU0pXRCtCaVJBazk5alNmZW9CQ3IySldQ?=
 =?utf-8?B?TXBsU2V1Szh4cFR1dEo2MFRpOG9QNDRnSmNXeTBjSEFUOE1KU0M5ZU5XVUlM?=
 =?utf-8?B?NWRtYm1FaTgyaEsrQ3RuS3JEL1BhSVNHMVJxYTNzam01ZEplWmdya3FWMUlX?=
 =?utf-8?B?N2x3Rm5Fb2dvelR5UXJDVG0wUjdhL2E3Tk16L2JWQ01CWGJlWllrUUh3SEU1?=
 =?utf-8?B?aDA4OWxJbWpLWVJKQWphUnBNcGQ5a1BBQVltL3FjREJpdkhWd0ZXUXlGUHl3?=
 =?utf-8?B?aHRGWEZmSkZ6RkM4ZkdFeUl5SVp5dTBwdlVwdHFrTUxPYXNJMUhRM2tpMjEv?=
 =?utf-8?B?dlZFZzN5SEFGelpYN2RZdnFwK0Q1ZW1xUGROMVVBUDJiRU5mdzFXT01KVmxJ?=
 =?utf-8?B?ekErVlJFa0x4enN6WHY4dnZJQXgyaURxTFZVMlFjRUx1bll6Q056TUgybkYw?=
 =?utf-8?B?b2o4a0RkKzNud3JkeUpOMGlmN2J1Q2tkc0RwRW4wbU4waUtpcHo2MG9jQ2Z2?=
 =?utf-8?B?c1Fpci9ZcWZabGVIaXF5K29LaDBBS3RTQVIzOXNNeThlME56NVZXNGUzc2ty?=
 =?utf-8?B?YXVwOGtVWktaUnd2WlRwSmtRa2RCVlAyVkdZYnpZM3BNdllTdWhBbXNGM29K?=
 =?utf-8?B?bWpJWXdzR0JvYmQzK0Z6bVpFY2UxRW5UMjFLZVJ4NEVDU2VVcWRRNWtsT0pa?=
 =?utf-8?B?a3pnRW1MQm1ndGcxckFkR2pEVDhUa1dTYVN6WnRZRTEzYkVDR2tmRHVBeDVV?=
 =?utf-8?B?V1BxSVBjdWppTFc1enJVU0NQZk9UQmtHcVN2RHFvdGloVGRIODRwci9xWWRx?=
 =?utf-8?B?cVVBVWFrWWNTVmR4ekRDVnY2OTB5MlU1V0hQQ01EWGlNd1RjTzZaTjFQUGdy?=
 =?utf-8?B?TnduVjNpSjFqR09Gb1pYcjVNL2hXVTVid3RvKzIxSjM2Wi9ONGVwRXpZb3lQ?=
 =?utf-8?B?QkNaMjZidUx3YTJ6L1N0bjhjbTBPaGdYV3Z2blVyUkZ4M0VxaVBXU3h3MDlU?=
 =?utf-8?B?ZVFhay9DT0JQS2V5c1dKVEl5RU1yTnhiSFVldDVTdmQ4ZkdTbW1ORjd2SExz?=
 =?utf-8?B?dlN5ZVZpcjU0a1c4dkdaRnZrQStyajdBTTBQdWptS0pFWGdvcEQvZz09?=
X-Exchange-RoutingPolicyChecked: 2OrfUl1SFqQU2Dbm6zbQt2r6mcjGmpLK3EkBS3kXvAGtcGBIgKItiZiJbATvSHEQZooFIODMnNRWaI3gkBC468uoffBWr55j3k5PdAQdTuXLFJy6ezybtxVoLZHMh9RQb/klrHoEEjxtWK/1oNf792T5BgPFyH7i6BqEY8pEbN70xkh1w4W+uh62dHcrFgOCrkaamKV5BMBVBbcOHkXDtlkdYyG+xidtsDxpY26YUr9cxQCBxQ08cuAuPQnZKHNO27A+yTGxEEqdzfxccq1wSZop6W8p9LEdaNLdaw7m1Rx0g00oxZmu6t50hykCmSa1BARGGnmMn0gKT07F7ndeQQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ae213e-b53c-4e1d-2526-08df04cb92d1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 06:14:09.9467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jfgAk7/FdljWaJOcJIITcTOJwrWOXi0cK6sb8YYY2GimfUhZgwJrwOxiMkVTLwDudWzODBQxPNhX3bXHQWNUyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB088116
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


On 27-08-2026 17:58, Rodrigo Vivi wrote:
> On Thu, Aug 27, 2026 at 04:25:48PM +0530, Aravind Iddamsetty wrote:
>> On 27-08-2026 02:30, Rodrigo Vivi wrote:
>>> On Tue, Aug 25, 2026 at 08:20:36PM +0530, Nilawar, Badal wrote:
>>>> On 25-08-2026 19:41, Riana Tauro wrote:
>>>>> SAF MHB errors are collected and classifed under Fabric error component
>>>>> by System controller. For SAF_MHB errors, if the cause is data
>>>>> payload parity error then log and return.
>>>>>
>>>>> For all other errors and causes, request a Secondary Bus Reset (SBR)
>>>>>
>>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_ras.c       | 20 ++++++++++++++++++++
>>>>>    drivers/gpu/drm/xe/xe_ras_types.h |  4 ++++
>>>>>    2 files changed, 24 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>>>> index d25d25f77531..586dc28a638a 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>>>> @@ -394,6 +394,23 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>>>>>    	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>>>>>    }
>>>>> +static u8 handle_fabric_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
>>>>> +{
>>>>> +	struct xe_ras_error_product *product = &arr->counter.product;
>>>>> +	struct xe_ras_ieh_error *info = (void *)arr->details;
>>>>> +
>>>>> +	if ((info->global_error_status & XE_RAS_FAB_IEH_SAF_MHB) &&
>>>>> +	    product->cause.cause == XE_RAS_FAB_CAUSE_PAYLOAD) {
>>>>> +		xe_log_comp_recoverable(xe, FABRIC, &arr->counter, sizeof(arr->counter),
>>>>> +					"SAF MHB error detected\n");
>>>>> +		return XE_RAS_RECOVERY_ACTION_RECOVERED;
>>>>> +	}
>>>>> +
>>>>> +	xe_log_comp_fatal(xe, FABRIC, &arr->counter, sizeof(arr->counter),
>>>>> +			  "Other errors detected\n");
>>>> I think this also should go under recoverable.
>>> The point is that at this moment in time we don't know if the reset will
>>> indeed be able to recover the device.
>> I do not think it is right to say that, for any error we sure for know
>> what is the recovery needed. The respective error handler shall perform
>> that needed recovery action and anything that is recoverable by a driver
>> action is to be categorized under RECOVERABLE CPER severity.
>>
>> The case where driver can't recover the device by itself falls into
>> FATAL case. Eg: probe failure or wedged cases.
> Fair enough. Riana, could you please adjust both patches?

Sure will resend a new revision with the changes.

> And while at it, please add a note about this in the documentation.

Sure. Will add a note in sigid docs

Thanks
Riana

>
> Thanks,
> Rodrigo.
>
>> Thanks,
>> Aravind.
>>> It is a moment where we are handling a global uncorrectable (fatal) error
>>> and we will return the reset action in a hope that the PCI subsystem will
>>> be able to perform an SBR to save the day and we start everything clean
>>> after that.
>>>
>>> So, I believe this approach is correct here.
>>>
>>> Aravind, thoughts?
>>>
>>>> Thanks,
>>>> Badal
>>>>
>>>>> +	return XE_RAS_RECOVERY_ACTION_RESET;
>>>>> +}
>>>>> +
>>>>>    void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>>>>    				      struct xe_sysctrl_event_response *response)
>>>>>    {
>>>>> @@ -555,6 +572,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>>>>>    			case XE_RAS_COMP_DEVICE_MEMORY:
>>>>>    				action = handle_device_memory_errors(xe, arr);
>>>>>    				break;
>>>>> +			case XE_RAS_COMP_FABRIC:
>>>>> +				action = handle_fabric_errors(xe, arr);
>>>>> +				break;
>>>>>    			default:
>>>>>    				/* For any other component, reset */
>>>>>    				action = XE_RAS_RECOVERY_ACTION_RESET;
>>>>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
>>>>> index 99b2466e2062..73517fd0d415 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>>>>> @@ -12,6 +12,10 @@
>>>>>    #define XE_RAS_NUM_ERROR_ARR			3
>>>>>    /* Error bits in IEH global error status register */
>>>>>    #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
>>>>> +/* Bits 16-31 represent individual SAF MHB unit */
>>>>> +#define XE_RAS_FAB_IEH_SAF_MHB			GENMASK(31, 16)
>>> Riana, please share where I can check to help reviewing these bits.
>>>
>>> Thanks,
>>> Rodrigo.
>>>
>>>>> +/* Fabric Data payload parity errors */
>>>>> +#define XE_RAS_FAB_CAUSE_PAYLOAD		BIT(2)
>>>>>    /* Device memory error categories */
>>>>>    #define XE_RAS_MEMORY_DB_ECC			BIT(1)
>>>>>    #define XE_RAS_MEMORY_POISON			BIT(2)
