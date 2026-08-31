Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20257C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 06:55:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A4F10E661;
	Mon, 31 Aug 2026 06:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U+KtpOpg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A576210E667
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 06:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788159300; x=1819695300;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RVL7dQMzU65AwLmLbxvMieSgDUy3GYy3FXKVS3hAAxk=;
 b=U+KtpOpgWMnUVvvwtS/U/+3MZA78pYn4q8BrjXpOFPkyJ4DtSPqxnGD/
 Nwe3toAbVuhMJD6F2d7SKDJAijtRrHYDB2LiXo3kOnpNDu6JebTVJ10bu
 cTl1RlKs2XhSsIqc09HxW9VydcPSU6hOP1zmNRmtFThOYZ9s/yJS6ROzS
 qByBppgSWchnCQSZSUy7D/qvKoVP4r0wTLsM5cGyRrFc5t/x2QdlOgXwy
 6J15XSPjTFoY3rhgYY4glJaVRGpggPmCjolSAzpl1zxNSjKkUUB1zZIMU
 k6eLqsbbZ8SPwg1H28XsT10Df13o1j1I1mRy2CNSE94WQrY2WtFtC91/A g==;
X-CSE-ConnectionGUID: jAZyjyXzTlWsqMmkZo1Uow==
X-CSE-MsgGUID: gnXB3YMDR82KSkDYzSRfYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88608163"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="88608163"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:54:59 -0700
X-CSE-ConnectionGUID: D1NG+gM6S/yBfKb8tc86tQ==
X-CSE-MsgGUID: drkXLBnjR++4OZixzxFHkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="265475544"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:54:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 23:54:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 30 Aug 2026 23:54:58 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 23:54:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gkAbTB+bXWCAdCSIYmRGl/OXsUENX+Xq1fX9plArj4zhLJKq2EFss1Xjn1xe0HCKOBUtCv71mDJtIMfKe295rDLk02ag20sMeivp2K7Se+UrHZWxJ18UbXy8V0tWCKn/7z3wbjW6pn5ckppnYepoMkgt/d7uxpLqTNEIdqFAWnSwaQoliuuXnG7rnrV0R8daLbqWiDibvC19m/hS6EGpo+GRi1vOc4SBCUpDCQclZEj4jN6pF36yK7JRS6etBFJmOOONAS8vaQLMW6rbgi2GjBguAmx6j/ushGqi6RjX41y7FkUUJmtdJqWlXn1gMlR9CMi70Nsqo0hElz+RK09+ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pj8F0y6ACs5PHHXfTEWubxPLFUrGQY1Nk9HuGe8zz3w=;
 b=oOELTBEdHtBCoC2DN5bbeDEKkcA+3ot0+iujXXQ7Ue5dkV+x9JDCxGgw2uiteVEU3JVX3H1pI3pUq5r0ejhZfJmhQhg77FUAf8ZaJ3jB6ubLVTTRhMIglaNXk5QGGocevpO1x1yegHoK0i2/Gt/dw92U3pdnCb/O/EqUZhn4hRQwYAiskf/3em9sPEQfR8X9f/7GlffLBhPED2vRqPAsv1CidNUx+Iq2ngNiUo2axe7bK/U8pDqAsez0uOjJnB3wLcWQKt/GokDR6SrKxPJCgl9AEEkNaeCIfyG48t3Qx9OJl+fer6+ZjGMGRh9mWtwpyXEMXRTYAqpOwR3rZEYedg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by BN9PR11MB5227.namprd11.prod.outlook.com (2603:10b6:408:134::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:54:56 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:54:56 +0000
Message-ID: <2c61329e-a7d0-4524-b585-5d10fd970ffe@intel.com>
Date: Mon, 31 Aug 2026 12:24:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/hwmon: Increase timeout for mailbox power
 limits
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <sk.anirban@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260729171546.3368457-1-karthik.poosa@intel.com>
 <20260729171546.3368457-3-karthik.poosa@intel.com>
 <ad776a91-9b0a-4a72-8b05-8890a7b5a4cd@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <ad776a91-9b0a-4a72-8b05-8890a7b5a4cd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0145.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::15) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|BN9PR11MB5227:EE_
X-MS-Office365-Filtering-Correlation-Id: 1424fc0a-61f8-4f9c-67e9-08df072cc423
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|10067099003|4143699003|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0vp+z71nG5pWJvyUrRlPX8SJY6FCBaz5sfzYOQo4iS4MWKjtVHWOWRcprbR6/Iu8klHuhsSdDQ7NcNqAmyd3uF+/Qj3+V2Kf/IqHsGcl66+sr73Q/gWz/kqZiQdINC+Sj6BWtHji8rs5Acgyd2TYvmJh87JkugRSPHYIJIRdffe5g5jbs25h8UqXueaSF1TMSDLbh14e96rDelA9rAa77Glmj5cLnUr4SHL6Vs4cvWdT4r9jYyDjdrlfiYx6Nhu3s7hYhrZs/zo9Ws9RTLc5ZRDKWkLQsP2d9pzsVmBrNhTH0oWSX9/LF94Tjs5+iNvXggv4g7qYEQnzDHTpKZbEaSFwMFiytE2KBlifg+Z3x0eGPkkwg7PMh2Y2a0af3AyRlXgJ1vkwjTmUSPbl+QFyWoiccwt+mut+i5DkaHflfKJy+WjnPPRA3MWxiP6JgypkUQ9gMRRTXkPRjetCFtiFEd/HJtQ6qrFYTekVy5orweC4mb3fZ8neA8Cr23RZ6Tgfhm5mkb8qc4LbLEsfM/YdHD+L1f9a1o5Fw75qwu0KPtncSWixnypC7cDsGulTeYE9GSOnhwPjtcWY2rX9H7+l/VeKTWsp6+wXZlYy7G7l4QupdU5c5hvv7oM6uQ0Qlgg4CC6fW9FNPAm1IureOvWWwOywtNg2nE9/fMU5OHcb7aQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(10067099003)(4143699003)(11063799006)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nm5DYWNOUkJYNnR5Z1VUbHVtQ0QzWUFLaEhmSjVNMkdRbGFib2lxa1FNSE1K?=
 =?utf-8?B?eDBOdE9UcmFKMjg3MUk1ejNSMm5CWG5FcFNIYXNCUXpyNUVNcXQ0TWdrSmhN?=
 =?utf-8?B?a1YvWHRGS1hJUmJmRnZwSU4rZFBSSVhRbXpCcmlRUTNmWGFvWmhPanhlOEpF?=
 =?utf-8?B?WEFtRlJPSjA0VitWV0NuY1RTWjlFZ1RCNHRQeE50RDBpcmRNd0ozOVljVUFx?=
 =?utf-8?B?Tk1ycG9vYU9PcWJHbTh4OHg3WFZOeU5qQXFWaVZmT0NYYVVNRDZyMEo2L3k0?=
 =?utf-8?B?eEFkNStaMHZPZWxxZ0F6dlJubkM2eWlSNWM1ZUZkUENpL0hxc1JyT1hnWWtP?=
 =?utf-8?B?NVUxTEo1R3lTQXVpL0Z0NDVSRlVMYTQwWHlTR3dJdWNJZWw3L0ZlQUNyWk8x?=
 =?utf-8?B?SFpWbW1VL0ZZNy8wOFlodnNrNVM5T2crM25BdEZrbllSSWtnNWVsUjIrRDJt?=
 =?utf-8?B?VmRub3ZPYnRJVVlja1l1WmR0RjhlN1p4MFJXNCtOa1grdUY4TUVrcVlXYldq?=
 =?utf-8?B?dkViRlovNFZwMUFjTENpcnVXaE5wZzY1ZDFyRXNOVllCNFhIY29YY3orajk4?=
 =?utf-8?B?cHYrcWptL0kyTEpMZzZEMjMzMWh5WW1LdnpTRWdtT3RueXBNUG5OdlduUklQ?=
 =?utf-8?B?ekJQMFEwTk5xNUx2VlNNTGZXSTgwd2YrMTJaYkdxdUtlWUh2Z0t2QzdJL2lW?=
 =?utf-8?B?Y2xLU1Q2NkR2KzJZSmRTdU5ISjRSdEt4OEZGN09tZmI1Zk5uNFdNMXBXcHAv?=
 =?utf-8?B?ZHRXeG9ySmdjUlJGRUVFMkFzczRRUHJORjBhN210Z3hUazBya0RBYWZrZG04?=
 =?utf-8?B?ZWZDL21Ib3lod2IxZjNqemhVSFJFeDkvV2RPMUFhREpBTldyM0pzdHQ3dDU1?=
 =?utf-8?B?NXpiY3V4S3VHKzJtQ2dpYlJXNmdabHQ5S3BEdUxhNS9Lc293aWtLTEJvOTFM?=
 =?utf-8?B?ejRlYXJJZ1A3bS9keWtaeTdTcmwrdjBZakljQkRLdFJQKzdkSXZmT0wyUDBJ?=
 =?utf-8?B?KzMrVzEwdW56U0ZNdnZZM0c4cDdBOXR2eDdyNDRjT0VvSE9PTlEyRDlOTEpD?=
 =?utf-8?B?SGFqMHNqQ0pkeVRMbmQ1bnp1VHVDaDQyT0VieEx6TGxkanB0MTVxeEsvMGw2?=
 =?utf-8?B?TUxBY3VCazdzeUhLT1grM2JUUHBMNHhqUDl6RkhINmJFMkZCbTJwQk1QVFFR?=
 =?utf-8?B?b3NJVDRIT3lPTFVQMFBQajZTc012L3FEejU5NytST0hUWEM1NldKelBsWmZl?=
 =?utf-8?B?SWZEeW9lTzJQcjlPbFpLL2F1SHVLUmtScm1FWnE2S0szZ3RZQm9aWmM5QnNl?=
 =?utf-8?B?b2F3QjFyRHY4N2piSXhEaWJlN0dWeDBjN1pycEJuTCswcFB2VVpjM2hEZUVE?=
 =?utf-8?B?dEFGbjZsVXlydk9zMXcxRDRxUzFFMFM2SHNidXRNMjJtb0s5dU1SVHg3VHZ2?=
 =?utf-8?B?TVl4MEtWZTVSTmNNM1pnWjdjSDhHcXdqdUltU3pMb3RjbXFYMngrY0NDa0Ry?=
 =?utf-8?B?WlovYStQQWNqQ09pWGpERWJMRmt5anV4WHpudmJ2amRCSTZiVDN5MVI4cnFI?=
 =?utf-8?B?SXVLYmJJb1VESFJBVzlSaThGYVMxaVgrclp5b2JkU0pPS3pRYmpybU9VT2l5?=
 =?utf-8?B?U0JrakdDSHBXVEd0cWVKK0lzenE0TzRlMTk1RVd3RUpSVGhxT1BBcVoxTEV3?=
 =?utf-8?B?QXByVjV1RDJsVk01OGN4b0xQQStBMHlTRFl4QXljU3Q1eExVZUF4bUhVNGla?=
 =?utf-8?B?RzVHcGFSMHZBc2ZESlVzUWxwamdCSE9DNlFJM0psZVQrc283ZWFNZ3RMcW1G?=
 =?utf-8?B?bHFtbmVPOVpxVy90a2xEd1BiL2RVQk1XNk0vTmVSZnRRbk5DcHkxVUw2VVMv?=
 =?utf-8?B?ZVo4bWlCZk95UzY3OG5FWkcvekRqOFJEd0pCNHdyYmRnbzVDd2dUZHh0L2Mr?=
 =?utf-8?B?Z2Z6V0ZpVVJ0NW0zSjdnUU8vcFp3ZlVQQWxtQ05kaDZrR2g2RFp3dUFOVS9a?=
 =?utf-8?B?aklXWUpUeC93Zm5ZRmxRWFlXZGVra2lhTnIwaXErdENLZ3lFeUhUU2UyY3Jn?=
 =?utf-8?B?SVFmN0UvcnpiMkNmYXFVaE9YSzVYUHFjQWJaWGFXSzJwMmJsUVdrb1N3YWh4?=
 =?utf-8?B?RmlBTG9BZjRYSjhobWlONENHbERVR21uK0RWVVVNY1c2UUhjdHluUWNmSlN6?=
 =?utf-8?B?VEh5UTMxVjd3ZnJidVNQNWM2dUNZMzFmVnpSV0R1Y2orU1NXYVhLWUhITTUx?=
 =?utf-8?B?bFphRHF0Q1NWbUJMZ244NUlBRWk3WEZuVmk2WDM4U01BWlppL0gzTEFINUpo?=
 =?utf-8?B?YkROS21OQ3BrMklrVTBudTk5RHJYTVBFOW9pYlh5NUhLSk1Fb2VlZz09?=
X-Exchange-RoutingPolicyChecked: esJAeyMUkcJ5gm0D02ghClrV05c6gseChs2nnZd6rDUTi2bZNhv+EJCKpWrj78T3RxZaMpZT9qxx98dYVcgrklyrpFPHqTTJ9SPf1zlVOBZHPJUGp0wbuhFEUedfiITSXDBBPx+V05e2K1a99exDTf3wsKwOUw/Nnr+k/LNkMBfP/9ooYWKuP8YiaW2wO+YYFRMBgx7Cv15ocZVcIMWND11HjCzNTX/76yZABUbZQOFAcNI91YAoCJqvNZvzNTVUMo5idgIvZUUF5qZtcJT5AFiuWPCSPrO3GWI5b3b4vR0vOG+mu6tOA2Vxl0umJgajJI4HaR2yd18dklGwFbzX3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1424fc0a-61f8-4f9c-67e9-08df072cc423
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:54:56.4068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qBqjWEvscPtbygvGpCwVuVyna5mHEK/6jDg+kCRtrNn4CDqWSL4rSHpsheOxhLeuqO/d+m0vQntcbkoGpF5xKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5227
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


On 31-08-2026 10:59, Tauro, Riana wrote:
>
> On 29-07-2026 22:45, Karthik Poosa wrote:
>> Mailbox power limit operations can occasionally take longer than the
>> current 1 ms timeout, causing sporadic failures.
>> Increase the timeout to 10 ms and rename PL_WRITE_MBX_TIMEOUT_MS to
>> PL_MBX_TIMEOUT_MS to better reflect its usage.
>
> Why is the timeout applicable only for power and not the other 
> attribute reads?
>
> Thanks
> Riana

Because the timeout is seen only with mailbox power limit commands only, 
default 1ms timeout wasn't enough here.

>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c | 28 +++++++++++++++-------------
>>   1 file changed, 15 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index de3f2aeffc3f..459ad953dfc8 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -102,9 +102,9 @@ enum sensor_attr_power {
>>   #define PWR_ATTR_TO_STR(attr)    (((attr) == hwmon_power_max) ? 
>> "PL1" : "PL2")
>>     /*
>> - * Timeout for power limit write mailbox command.
>> + * Timeout for power limit mailbox commands.
>>    */
>> -#define PL_WRITE_MBX_TIMEOUT_MS    (1)
>> +#define PL_MBX_TIMEOUT_MS    (10)
>>     /* Index of memory controller in READ_THERMAL_DATA output */
>>   #define TEMP_INDEX_MCTRL    2
>> @@ -199,11 +199,12 @@ static int 
>> xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
>>       u32 val0 = 0, val1 = 0;
>>       int ret = 0;
>>   -    ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
>> -                          (channel == CHANNEL_CARD) ?
>> -                          READ_PSYSGPU_POWER_LIMIT :
>> -                          READ_PACKAGE_POWER_LIMIT,
>> -                          prepare_power_limit_param2(hwmon)), &val0, 
>> &val1);
>> +    ret = xe_pcode_read_timeout(root_tile, 
>> PCODE_MBOX(PCODE_POWER_SETUP,
>> +                              (channel == CHANNEL_CARD) ?
>> +                              READ_PSYSGPU_POWER_LIMIT :
>> +                              READ_PACKAGE_POWER_LIMIT,
>> + prepare_power_limit_param2(hwmon)),
>> +                              &val0, &val1, PL_MBX_TIMEOUT_MS);
>>         if (ret) {
>>           drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, 
>> val1 0x%08x, ret %d\n",
>> @@ -232,11 +233,12 @@ static int xe_hwmon_pcode_rmw_power_limit(const 
>> struct xe_hwmon *hwmon, u32 attr
>>       u32 val0 = 0, val1 = 0;
>>       int ret = 0;
>>   -    ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
>> -                          (channel == CHANNEL_CARD) ?
>> -                          READ_PSYSGPU_POWER_LIMIT :
>> -                          READ_PACKAGE_POWER_LIMIT,
>> -                          prepare_power_limit_param2(hwmon)), &val0, 
>> &val1);
>> +    ret = xe_pcode_read_timeout(root_tile, 
>> PCODE_MBOX(PCODE_POWER_SETUP,
>> +                              (channel == CHANNEL_CARD) ?
>> +                              READ_PSYSGPU_POWER_LIMIT :
>> +                              READ_PACKAGE_POWER_LIMIT,
>> + prepare_power_limit_param2(hwmon)),
>> +                              &val0, &val1, PL_MBX_TIMEOUT_MS);
>>       if (ret)
>>           drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, 
>> val1 0x%08x, ret %d\n",
>>               channel, val0, val1, ret);
>> @@ -252,7 +254,7 @@ static int xe_hwmon_pcode_rmw_power_limit(const 
>> struct xe_hwmon *hwmon, u32 attr
>>                                    (channel == CHANNEL_CARD) ?
>>                                    WRITE_PSYSGPU_POWER_LIMIT :
>>                                    WRITE_PACKAGE_POWER_LIMIT, 0),
>> -                                 val0, val1, PL_WRITE_MBX_TIMEOUT_MS);
>> +                                 val0, val1, PL_MBX_TIMEOUT_MS);
>>       if (ret)
>>           drm_dbg(&hwmon->xe->drm, "write failed ch %d val0 0x%08x, 
>> val1 0x%08x, ret %d\n",
>>               channel, val0, val1, ret);
