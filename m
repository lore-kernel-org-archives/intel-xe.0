Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96DCC54E60
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 03:09:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6362B10E3EE;
	Fri, 15 Mar 2024 03:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h3Y8Pgxy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282DC10E3EE
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 03:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710472153; x=1742008153;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ouFQfgEsfE4fMmlrbAqPRMgk+cxa1VPwUJlAm1vJWH0=;
 b=h3Y8PgxyAMly3HAOZQmaYtG9TfP/1p5NjymgQr0lcZQ0u+KmR2brY3p4
 Zz9lavfdHxb48DxvjtpYwsvGBR8lEOYiA/ZTUt/mh+bzY8iVexgBWuke0
 3sgqlWN9Jje8jyxgHSi8LYzA0DM0dx75A5PZ92plxYSdM+jpIFdwspxEq
 p1qPwtXzd8vfo3/gFMjK5z6gfvt+qK6Y/pxOxyyQ463yxqXwrS2HFGYf1
 AifdOxl20pyCdDqT9ksseqUhWjrLfY6Oe6hsPA5+3V/Ky1vZjdq/P5Ebs
 S8/MCxzcyeNKUIfRcEBvKzRgnYrb3/R7oPFEGJ/ZIRHarP1LZKx1QGuVZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="9108554"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="9108554"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 20:09:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="12592854"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 20:09:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 20:09:11 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 20:09:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 20:09:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 20:09:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGQeGjDE6E2iUr0VpQwT2ImTsO7o3s3DAzx6VQlWMcIHu8M4w7gEOoiSEqK6Y/yzAkHAA6aw4G/aVzsAJrL7SZaoe2pbyfguSOzQr7JgJs4WcpsqoJSwhMD785dGcNA7IZCuTfGrEj7BdVKHnlRuQEo8hTXmfl18sJPF77QPBeT97nxhAcWI8h3T+KF5QSdiM7POTmjkJb+4QQ/QAWG9d2hNOF3dgYXKNk6P+/8SSverJI7IsybRYlAw8ebQcL4QvtiK9MbO3Q6zzcntNZb2gPAM2Vv+dK3GVTu6DABqRdo4CS7Q+7hIu8jJzG5rFjHpa7dui5Zz0sqvQO5iPLS77Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wy6AnzoVLuyFvavoSfs3YhQ67UbXTvlVMuNQG/UsG3A=;
 b=MDMkipuVEOFABsq1rQk/ulmtkhBmo5OMGXhv5ixqfG0SQorReFJAJhiIv8CRLZxZBIuBhLwGMPlaQ9t9P4kJosgP0PNvKmgvllZy5tIojW5Qh0t5HDqDEZG0Qlw0phpdyMBwaD0EkNv8HhmgZKVtoUQy8Zs78pqXwPRIHbyqmBLr7r44P1Y2M4NG52rPZEIJDhJLbiq5KG9NJ720Ky/zZZ1WvuKoFcUXQ4gsk9XOWTpny1RLbs2iiPBWOcN5YiFmA6SY7ls1fjtK6HVJvUg64sDUkzDvrXv3MafrZ3+DjWTfXWKfY6qh65ZWci3Xt0ZUZOpxgQZzysNw/6OMyZ0Bgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6612.namprd11.prod.outlook.com (2603:10b6:510:1cf::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Fri, 15 Mar
 2024 03:09:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 03:09:03 +0000
Date: Thu, 14 Mar 2024 22:08:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Introduce a simple busted state
Message-ID: <x33ypp37prplkx5tttj4oepoxfgilo7rqwkk54bzno22omutfs@xmawmkglpvjw>
References: <20240315010317.193756-1-rodrigo.vivi@intel.com>
 <85sf0s5lvr.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85sf0s5lvr.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR02CA0045.namprd02.prod.outlook.com
 (2603:10b6:a03:54::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6612:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5667c5-6143-476c-4b5c-08dc449d4486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tjcuw+FPyovnnO6dL+tsKZvzFxmD6J/p3yd9IBMjE2i1YyylYhfe6n2U+fgBDKGrAUCUXRGJVuxBXnj2Uqbiu8USJi7PV3EiMXYR6a7ywZ8MuMYiGVF3/bu8BdK6OtguQMt5WO/BDWtKr4EhXP6DBCnzGEalB86BBkiuWFrNDomWvo4GoyJMBkLhLDZZoiQblDdy+Frr/9oj49RcA+PyY5yhrAFPAnNZpXzIlFyD6/XIl6Gb81diCZ2M3WVNqZB7CCgcFEVUj8E96j4hDi5mpyqIDRwJQsiUpuLfrOST/3xKH2P9rEmv7IhwZkU5oWNnSSgDgROQmG5MsBSlG7tqs4cAU/JaQNGMVSm809bMPdcnmaltnG5MiRADOo5BNv8kOIg1SmiU8Fu7k9Cpe8A0BFbzvqtRO3lCS/gciR4raMNHV1hNk89ftWCs3kb09ms40NRGQfK351L74pSSL+4IiRFTdtVx1hXtULQVE9UzBSz+MOeQAG+OC4pNO0NUWKdIoIJ7XqEGXN9ikFEdM6/Vs3t//jWZoO8skoctS2q09QiE2EgVX2RR58WyaYGpI60VZMRT60j2uTbUfKW4gnV9gRyvHOFyF+pUp+XKphUcF8u5yJqPnnejHssiMViHrSdEVZpEe5mC1E3rNSbPT3G+YszxxAlcatCRMHFirbu9SgW4druZxrF7pTeaeCvp7D2dG+/i4Mquhi7oYIzutUpcFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(27256008); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGFTV0ZDRks2S3RoUy9zVVZTTGJRRjk0Ri9YU2hoeXNsZWlyejZZQXFkWENq?=
 =?utf-8?B?ZjRmcTNjTFZGQytPWCs5SU5wM2VYZXg3UHJ0eHR2YlE0SjB1d3NPOW51cXhQ?=
 =?utf-8?B?UTIzM1R0NWs0cmZKRDNKbkx0U2lIZXJvRlhpdXNrNXZLMXZaSGkrRzB6Z0lD?=
 =?utf-8?B?UE1tOEhuVUdWVDN4eWY1SE01RzYydWdhaDlNOG5wdFR1aHhIRHZhYjlzdFFy?=
 =?utf-8?B?ZFJiQVVUUlBiOVJIUytzMzhqSy9kUUYyUWE2UjU2UmRHa1QzZFczMG5FTVV0?=
 =?utf-8?B?SGwwdHU4YVhLWXJHcXVnbk90Q1RwOWJlSG8zeFhBRWRXYWpWRFAyUGxGbmRw?=
 =?utf-8?B?RjBpaWdXeVBjalpzSWsrNEZraGQ2bVlYSHlVTVhSTkpqRW5PTDh4NHhLQ1lU?=
 =?utf-8?B?eEcxR2RrR3A5RHlIY0FUTkorSXRrR3hDT08zOWJSaXJBZmJjLzNiblhCajdW?=
 =?utf-8?B?UjUwOXJWY25jbVR2RSsrWTg3SWppMU14bHdpM3YzOXJ6RldoYkwwelR6QjNR?=
 =?utf-8?B?bzRtUUxYR3dkWFRQY0llVTMva1E0c2VQbVFMd3FxQ0RWYTR0VEtaZFd4Qzly?=
 =?utf-8?B?QXJzYzYrT3c4Wkx6ajRuTzlZN3pLdUs3MzJVZXg3RU5WMXRjeVk4NG5nUmtz?=
 =?utf-8?B?c2JGTnlNRExSa2JlUVVOeW14NU1zOStUbnViOHFROEJzVjNnc3lMVTFVMmdz?=
 =?utf-8?B?QTg2a2kzZ1B1WHVxL1QrZ0Z5LzFzaDBPTGduemJUR3A0TFR0TDU2V3pTYnpV?=
 =?utf-8?B?M0RQeU5KRmpiTGI4TnlXbHpXREc4TXp4UjlFYnlTbUp6Rk42V1B2KzZ0U0ph?=
 =?utf-8?B?NHNSeFNzdGc0MlJpRkpCL1JkV0o5OWVxVTl5bTdKK0tlQml4c2VocGIzclNw?=
 =?utf-8?B?OUVQSE1ZUzNrRG42eTlHZFVJRFlCWGRpSHNMWDVIeXh6RFZYNlFvYjV4ZklX?=
 =?utf-8?B?Ynp6RzNla3M3cmxiUHRleGNNdVMvNWMyWHlzL0NNOHVPNDQ2NlNpQkdISmoy?=
 =?utf-8?B?NkZ5VUJrVytOSEpCTlpXbTJhbkU5ZWRSY3JMSW5XdDBJOFBPOXFpWXlYTktE?=
 =?utf-8?B?QUw1MG9mTVRuOGphdURMVWV1YjVDQXg2QUQ3bEtvZ1Vlemx0bXhnYmRPS3hw?=
 =?utf-8?B?NWF6UEd0MzI5aTZvNTcwR2tHdUgycGF6TXBwQ2RJbUhJN3BJdjNBWjhLZjh1?=
 =?utf-8?B?aE9YMTkxT0xTdmFkRlhtWjBTRGY3aitRajR1ZlZweGc0bWgvVStSWExDZURO?=
 =?utf-8?B?VlluZkdtd2tDR3ZsQkFWY3JuamcwZHZrb2ZCQ3BIRjhjVU1rcEpaN2tLRFVT?=
 =?utf-8?B?SmhZVnVjYjAva1REQXJkUGV3RVErN3VjYURXWHlIMTBQOUFVWW1vQWQvUEla?=
 =?utf-8?B?U0VaVWFibGExaXdQMnM3VXlBcXovRzJwY3U4ZHB6NWN3YlJsYlc4cmZHV2J3?=
 =?utf-8?B?N0lmM0lqTXNQcGlRWFhXZDlPVmo2dlgwM3dSaVdYZXlyZXFjNnV5WnRibG9I?=
 =?utf-8?B?eXFXaGd2cFBUWnFjdHd1dFlRTFMyUHhsZmxFNmhBcW9SaHkxQTdsSDNHQVFJ?=
 =?utf-8?B?eExleExPVmFZVGkwenN3TVBCeXVqV1NySzRxYnA4VjF3TjhQMjdQeDRjT3Jt?=
 =?utf-8?B?TDZRMmR6Z0xXQUIwZ0lIck11Qk9qZE1uM3ZOK1YrOG5ia00yV0hiZEtjOURn?=
 =?utf-8?B?WU03L1kwZnRHaDVXS1RlZUNyYW4rQUlEM2p4ZkVKZGZJRXhxY1AxNWkwaW1o?=
 =?utf-8?B?WmpTWGwvd3ZXN0pWNXREQWVkN0M2UWN3UDBHU1YzUENZWjJ0M2RQQktmREdT?=
 =?utf-8?B?c3IyclpvQ3I1eEdDbkJWYVM3ckd1dWU4azZBVUFXNHNSOUYzOTU3VWQvM3VZ?=
 =?utf-8?B?c0pCbGczRTNYMCt3aEwzM3paR1BBOEdlZHJRNThnaHUzcGRjRTJMMWlYejMy?=
 =?utf-8?B?SFlpMlNKZ2E4dXJDZlNVVktzd0p3aUxMY1QrT3JBVTUxeWlCUFJNbmRVNXZZ?=
 =?utf-8?B?d3ZORC9sTmpKSVBpZmVSbGZmd1h0enlRNW1vTkhkV3VxRjBRZnA4Tis3S2hB?=
 =?utf-8?B?VmtNMDdvYVRmaU9UNTRMSXgvaTU5Z05Cb3FYMWpSc2tXLzAzTXNYQjRMY29l?=
 =?utf-8?B?Tlllem5TakNYMmNURXdYa0I1Uy9VZXNSZHpBNk5XeTZuNzRiSVEvRGFnUzRK?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5667c5-6143-476c-4b5c-08dc449d4486
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 03:09:03.1843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5xxILf9XjV6J4yt1THEaHdsAP7rSap/9uWPposFUq3xH9fRnhWSGHEu5SuJ67S4ID5zC7eLZuzTrCSiL6tAl3HXkV0lurIoYoOalXRGz2ZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6612
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

On Thu, Mar 14, 2024 at 06:23:04PM -0700, Ashutosh Dixit wrote:
>On Thu, 14 Mar 2024 18:03:15 -0700, Rodrigo Vivi wrote:
>>
>> Introduce a very simple 'busted' state where any attempt
>> to access the GPU is entirely blocked.
>
>Busted?
>
>busted. / (ˈbʌstəd) / adjective. informal caught out doing something wrong
>and therefore in trouble: you are so busted.
>
>Why not wedged or lost or down or dead?

not sure what dictionary is that, but for me it shows:

	to bust:  "break, split, or burst (something)." origin: mid 17th
	century (originally in the sense ‘burst, break, fall to
	pieces’): variant of burst.

example sentences in google shows: "He busted his watch when he fell. I
think the camera is busted."

In one of the previous reviews I expressed my dislike for "wedged"
since I don't think it shows the true state of the GPU and suggested
"dead", but I like "busted" too.

Lucas De Marchi

>
>:-)
>
>Ashutosh
