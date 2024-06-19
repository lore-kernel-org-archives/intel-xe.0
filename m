Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADFDC27C79
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 07:26:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47E110EA87;
	Wed, 19 Jun 2024 07:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="blSPx7OO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAAC10EA87
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 07:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718782006; x=1750318006;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eExKTxq1AXEyLi0HAzNc6c2iYay5mr9MjO2HFMryqzs=;
 b=blSPx7OOylIVBdHu+PvY3aD8G8fqK1MTCbxkHIgUeGE7mobhz9Sujr6+
 458GaaG/G8tJZqsdFYQA9A3WBOpBLqqW1z4lv5dUxqUY2HS1dTdd8Z2JE
 LtJrM7o1KNh8EJGSO64UKG5SH08WPVlJd75Rb/ODEYgE2egWlDChbrzXE
 WLepDDtRcHy6oCefo7UYm0g1KiZDOlqBbBWLRWdsw9YPy2i+M8hUHdsCM
 YbwO3Yp+L5ENg6JKTlnB+JVp1WfQM82utd9FJseI/qYihm+KYoqLQJWfd
 RV3XbUC/M2ltucHiLHs8HqastBNygJHZ5j5qTlRWsijrUTS1rhqQVOTeG w==;
X-CSE-ConnectionGUID: 5ajli77FQTiLsFiu2Gzq+w==
X-CSE-MsgGUID: iwfX9ToESkCXzlD1Q6m6iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15831372"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; d="scan'208";a="15831372"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 00:26:07 -0700
X-CSE-ConnectionGUID: EonaaFOwTOye97a0TyX+lQ==
X-CSE-MsgGUID: JzpAdrw8RaKUvCsXAhNmJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; d="scan'208";a="46258629"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 00:26:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 00:26:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 00:26:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 00:26:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hN4cyjre7Mbk0kAngnm1QE7zdgBZ+SpCeVYVe9sLl9rCKn2GAALLNvVTcUmnAfQCO1w5NZhhRP0dzvMxv4OwgjMQipjq1TzDBlbseq/QWyqJhyxTKYLaJmVQXp8QX6I1ej2svaH24AgCVeJaiAlSobHqOWAqe0/O1xkkoPPXHA0tTu2503AfkPndQqH/FioyfZp4p8wiWIkq99F8VY7UcjiT9fCAkxn9ssRdIlN3Weu3jpt59gA8s0mFXFfqE3BVqdS8a3D1WbgnkhuiJqALLMkE2F6E+f9aWsljrnL3fhTqiqCxQlCzdM/wGLQaTZDlfMG5O4c5UMZOzTwFpBiOzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKrc6HnBtQm6iuHjFzpBrcCu7f3f5s5J7ra5FqXYrRM=;
 b=E0kEIFyR6zvbt4XEK9NuNJ+8VqppT3lHedSBKIwEwBGsmz40Qk0EAVxwZ5bfiBgXYMQ/rsBLAxke+gfSht9mNpo+i8mIrw+EVEvQTMzF9n//Y9T2KWxf2KIEVuHUq07bMD2SSMGDYLB0XCuEK9sSpYk/G26LYvi3wpRvjG5FfT4HbRn0RAHtTCsidxiGX/jRPIUqU0wSlqonHbbAAEmJw6PkJE5OsUPkmulnbjJ+ZkeE+mMy8CYhle4uOgDpQIt4zZWTbMgXPAY0IRhNd2oXcvq82LiZ8cDoV1pNMq0MXJXsNCOr4/0bRyctBhP1vFYoKFThskLBq+hg7FkA+hvLVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by SN7PR11MB7468.namprd11.prod.outlook.com (2603:10b6:806:329::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Wed, 19 Jun
 2024 07:26:04 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%4]) with mapi id 15.20.7698.017; Wed, 19 Jun 2024
 07:26:04 +0000
Message-ID: <c624c5b6-497b-48cd-9e03-e64efd28caf0@intel.com>
Date: Wed, 19 Jun 2024 12:55:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xelpgp: Extend Wa_14019877138 to graphics 12.74
To: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240619065614.131151-1-sai.teja.pottumuttu@intel.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <20240619065614.131151-1-sai.teja.pottumuttu@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG3P274CA0022.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::34)
 To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|SN7PR11MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ec32408-c412-4893-f6f9-08dc90311411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3lkZk5VcDNhMkI4MWc0bTlSVVlmT0twVGxCejlISWpqRWNnWUtKSFB4N0Jq?=
 =?utf-8?B?MG92bko3MytHd3pERGN3SDBPY2xjMGR0L2FoMzF2ckJSN1ZQSmE4NlJTR2Nk?=
 =?utf-8?B?RWZJUXNwN3laL1lxU0pXUG5BRTBhZHlmNDhiV0NrVnhoN2k0R2g4OG4rN1RI?=
 =?utf-8?B?TU5ZeGdiRFRscHhZZVdIaFpjS3h0SloxTk1lUlZGQnRDUkZvN3hQUDAxZ0xK?=
 =?utf-8?B?SU4zaXQvd1RPd3ZrY2txUzNuN1VEWmg0SHd0UVFCQzk1S0daRmg4QVRjMFht?=
 =?utf-8?B?Q0xWK0J4RHhuVWJkcmRqRmYxMnp0MmJmUVVnd0Fua2YzcGd2c0MxbjNmc3l2?=
 =?utf-8?B?Wm9jTU53QUdFZEEvc0FsVVN1NzFEQW9oTjg0Z2tOZXF3bW5XYkdPT1c0bnpH?=
 =?utf-8?B?cndrTHNBcG9mVnk2c2UvZTlyVnlHN2hlanlaZGwxR3MrNkF0N1Y3Zms2QWhS?=
 =?utf-8?B?V2J2cWlLLzdEVFVCM2ZyV0U0T3ZxMVRIbWdjOE5HRnJzUTNPbnpwY0F5OEdZ?=
 =?utf-8?B?ZC9NZWtTZC9Oc091TW82SkIrMnc1STRrRi96b0RReW9oUWI1UENYZEZpMzRM?=
 =?utf-8?B?VHkyeThBNkpNMWZBWC9BZEtOTjNTdzNDWXMzWWlJR2M4aEtqYnZSL0NnbWNk?=
 =?utf-8?B?U0dGK1dJZEQ1OEIyaXJWMWhkWFQ1eFZvMTRERlYvYjVwOTk2VWprb1JiVU1O?=
 =?utf-8?B?Wkd2Q2dpTWptbHQ2VHlTa3JpZ2Mwc2plYURONzJMOVkxU0kvR3NveUl3Wk1o?=
 =?utf-8?B?alo1UWJ6OFQxMm1TeVhHd1Y4WVV4eEkxNlBtQy9nUmdZaVFTZTBkUkppa1Rx?=
 =?utf-8?B?TjlxYUVMajYyOEh4OU1STEZwalk3YjBVNmt3SE1scnBWRk1Ub2N5ang5Yi9O?=
 =?utf-8?B?SmNXMlh6RTluY2gvdlFrZlhwYmFGbnhxVlVSTit2VDRvRGtCTTNxSTBFTUlC?=
 =?utf-8?B?NTMrUThuKzIrMk43TUU1RTlFRHhMQUpVMjYyQ2FvV3lWQUFwMUN4MXE0V296?=
 =?utf-8?B?SEJBV3NTOFRRd3k3QU82c3BSOFU3M0U0b0pVcmlEVEJyQlJWOFAxQkNYeEdW?=
 =?utf-8?B?WEJDUlNNVXhVVGJHMTVBSVVrZ0NNVzlhRFdSQTFoTWFBQ3VvTXB3TWhQOS83?=
 =?utf-8?B?RDl2VEZvNi9nQXMzc1hOVllxZ3Q0dklEYjBiTEhGQ2xUcXNQNmxXUmg2QjUw?=
 =?utf-8?B?TzNuNStDaUdxaDd2dXFsUUwxNHptaVA5VWZiK1hsRzhaRjQ1ZW8xWW0vMGhI?=
 =?utf-8?B?RlJMaFN4aEJ6OGY2dENNWmhtaDRiQWZ4djVSaFJ4WGVOcFZJUFV6QnF5Mzln?=
 =?utf-8?B?dkZxQVRWbFRGZ0FSTk1sTlJTWHNROUxrbCtLUm54TlNDRjZZSEMvRVFORklH?=
 =?utf-8?B?M09SU1Q2dnQ4elJVWjlwRzRkRnBKdWV0T21uYUVYNEhpeXdnK0MyTEdWdXJa?=
 =?utf-8?B?T3cveHFtcFdaZ3BORzNJbDEwRWZxRzFkMXE1d2VpQmQ2dDQ4QmZ3U3dEcWlE?=
 =?utf-8?B?Ui9sL2NraGx0NUhGbkhzR294bnRlLzl5eDRzZks4MUZvNU13REhyVFROZ3ky?=
 =?utf-8?B?MU8xTUZyQi9WeE0xdXlhaVJiME5ieUdxMVpjbXhIM0U4dmxzK3BMSzFZVVFT?=
 =?utf-8?B?TDJGcG9HV21KVForWElnVThLS2V4MnFkLzU2b2VzZFBYcW9xVzBCemN1bjJV?=
 =?utf-8?B?Y202cGRkQ2ZiV0RIVXYzYkZQU0kvbFRybXFqdlBnVlp5L1VzUEpnMDRsSE1I?=
 =?utf-8?Q?pCkrij7QVO5kUiqq7s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzEySGFIbFhoUjJramRyemxMcUhCMFBxY3cwNnBvLzN3QnBjZTRCekFhanJX?=
 =?utf-8?B?Y29wT3FFZ2NTYnhJTVF2OGdJUlJnRmU5VkE0L3pJcXN1QW5kSXVhNnNHVU0x?=
 =?utf-8?B?VnlsSXhDVXhKbFU2VE8vVzBoRUc1VWdDZjJDOWpJMlEyL1Z6c0lhUkh6UXl1?=
 =?utf-8?B?TGZUaGNKTXM3NWRzdERTS3pObStlbWlzdk5neGczTHRlY1lzSkIva3J2ZExE?=
 =?utf-8?B?SVFnTTVPWkxCYm5GMFBYYk5BS0dLTEFYZy9yOU5xUGZBbm02dkpjSXhnVWl0?=
 =?utf-8?B?VFdHSlR6a2F5WnpJUXMxdEw5OGxDQjlIK1UvVHVodFBBWGQzYTdGZVJ0dTNz?=
 =?utf-8?B?VHp5V1ZlT0hFQnZWTGFyMzAwRU1JVDl2bnpBQndTL2dWa3I4N1ZpY2U2aEt3?=
 =?utf-8?B?RXNtdnl0cWtLT1ZPMzM2NUhPTEFYQW1SVHJVa291RWNCL09COWVlNllwN0Zl?=
 =?utf-8?B?cEp5SzkrQjBnbEhVVUJ5L0V6YThsVjBDQjYxcGxGUzZoQUxISWhKNzNDb1pS?=
 =?utf-8?B?a1R6akcwRXVzOXNxTVRGSTdiYXJSSzllKy9oRGdHamFZVkFKWmh4aU9tUnI2?=
 =?utf-8?B?RW1LdXZXRG1sY0Q3T1BwVUJXSlB1UDZwMElCd0NxOU1kd2gxV2NjRVd5MktS?=
 =?utf-8?B?ZWhOYmEyTkNYYmZSZEZNckdpbXROYjRGOEhQZmdlSlROUzcwbGx3a0dzZDhl?=
 =?utf-8?B?WU8zbXlKcWVaNUo0OUVRY0JCaVphZHZmODZtbkorMmFieUd2K1lyb3VjbTF5?=
 =?utf-8?B?a2pRcW52YXh3Sjh3SncvSks2MmZRR0FHSVN2My93c0NTOXkxUjFsNW5tQlNu?=
 =?utf-8?B?WXltVXJSWUJuYU1LYzZJUGJmU1U5ejROMFFKaWRZY3M3cHZrQWhGS1N1eWsr?=
 =?utf-8?B?RVV5VEU3ZDQzOTdBdXY0ckxuYnk4bXZZKy9DT0N2bkkwNWcwVGt2b2VHQVRz?=
 =?utf-8?B?M1pSTkVPM0x2NmlrL2VDVGhYUXA5SzBuWG9OWFpkYUJLekJWWUNpeGxkL3Bz?=
 =?utf-8?B?Vjc3cHFVU1Y0MGU5bXduVFBmWU9yRkZZd0dmS3BWU25MeHJxY0dsc2xvWnQ3?=
 =?utf-8?B?S3dxTW9wVVF1VkpBcG4zaXI5V2VoUGI0ZG1pWFNLQ08zVXNrS0xtbGUzMEpr?=
 =?utf-8?B?enVlbDR3cXd5cHJycDRyTkRRQUUyamNKamhqaWdnNjgrYXdCWGx2V1J1ZmlR?=
 =?utf-8?B?RmtBU040MzRTQUFTZzEvcmp6QXRvaTN5VFA1UDR5Y1FIZ1RCd0xnemMvWHlm?=
 =?utf-8?B?enBKcUtKNGNzaThZSGRYYkhGRjlGZWZFcHkwcXBGSnZVeFR5Ymtlbmt6NjJx?=
 =?utf-8?B?b0x4cnNXVFV2bm12MkRYcS9aYS90V3J5UG1MaEFLUVFUOExiNmZxTUp6cTZO?=
 =?utf-8?B?bm83QlVIYXlsOXpKMEhYT1JCWTMvVzFaNjF4Zlkzb2d6KzNRRktqSFFDN0RJ?=
 =?utf-8?B?Q3ZKVmM2VDFqNlVDeWhLSE9ZVUl6ekQ2TnBhS0VaeVI5MHBQdi9wVjhqZnFK?=
 =?utf-8?B?dTFtWlgwQTZCTVRpK2sxTWwxS2N2dllSTnhWRWhsOHdIdU1NbjBlZSsxekR1?=
 =?utf-8?B?VElneHRBemxFUlNJbUdGRDJqTFZDUVFrZTBCSmZiTGVNSHpXOExGbGZNRWcy?=
 =?utf-8?B?TGZUQ1pTeTgwTXhidzYyUFBqUkhSU2NadUVGYUFrYjFFTEZIeHREMGZMemlh?=
 =?utf-8?B?bUhyTzIzRzZoQTYwZGVBNWtQeEswM29MNXhqd3lWTVRYSmU1TFJYeS9naEtB?=
 =?utf-8?B?eWxxT2k0U2l4K0x6TmFXTGJyYUlTb3g4RFB4QlFBdGtIWis0US9FNGdyMGZi?=
 =?utf-8?B?QUVEYXl3QVRrcitLdks0TzNjZXZkMWx5QlB3YVpxSjI2Vk9tUVlZVXl1UmVo?=
 =?utf-8?B?YmZGcVZkL05FQnBMMHU3OFpaR2VpUzF0N1ZTMWR1VldLZVcydUI1dWF2clNU?=
 =?utf-8?B?SWxBOTdzMjZFVjNyNWgrM3cwMlpxMXBNSjhsc1ZkdWxKczV3VG81blNSNTdj?=
 =?utf-8?B?dTFwNkY0NW5hdXZTbTQxUlpIY0JUYlpTZFc5emRkRUJjUVdwT3FESXluSmZJ?=
 =?utf-8?B?Ynh1bHhiSXJVazV5ZjBhck1LYkdkS2wyY0ZHT0hQaTJkOEFUVENMaEd2aktG?=
 =?utf-8?B?bFVLUVVxZXRzV2ZrRktmVzFhUlpJWkxBOGJUcmEvaDAycjF6Q1ZwNmFHRGdy?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ec32408-c412-4893-f6f9-08dc90311411
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 07:26:04.7322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sG7o1PJIymyvrVK0dmuL4UFJeIRcN5VDu5B5mm70wUWehEstncsxetH247ZzzFjuIO6/uXL1GWLz3/klh8PfHPc30+pTLPgI7zLjgp7rf4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7468
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


On 6/19/2024 12:26, Sai Teja Pottumuttu wrote:
> Wa_14019877138 is also needed for xe_lpgp graphics 12.74
As a good practice, make sure to add the BSpec wherever 
necessary/applicable.
>
> Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_wa.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index a2725a150441..cf546801289a 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -629,7 +629,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>   	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
>   	},
>   	{ XE_RTP_NAME("14019877138"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274), ENGINE_CLASS(RENDER)),
>   	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
>   	},
>   

-- 
-shekhar

