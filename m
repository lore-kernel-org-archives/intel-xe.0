Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53640606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 13:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KQ1hSgzs
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B70E112638;
	Thu, 22 Oct 2026 13:41:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B360E112638
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 13:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792676460; x=1824212460;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=10HxkUHMdtR+VBLJ0kkbYLn6c3Xr1PO9ka9Y9GBK+NI=;
 b=KQ1hSgzsW8Us++rlWqr9xUW9p1Veq8tHXuvEAyHKRNDKKFubB1GQjQz7
 xOmkhWmjOeusdPATvucKPymya3THg/kL6I9W94XNi2e/ItmnVO82720pZ
 X6VvoGgkjVRk35r/zAsHRx4pF3OQPjlNwanAjyt1GZeCdkC2DZQrddyun
 9AJT1Puy8l4RdJFwO781Km+n/IRht1R4tnlHpcKHr1IkyFcPbJJx7Y/9i
 mcwFsGxB1cciHGtLEOC5OGvzjIVuQIYJuX4n+slzKtpHQSmKI/mkhsosm
 vx/TeLEvy5C1U9rW/Q30CvOIHVbSOZFsXPJNAdB5c204Kp9uhsHTN7Liv Q==;
X-CSE-ConnectionGUID: o5s3IoRKTR6NepqLxI1UEQ==
X-CSE-MsgGUID: eDnNjMzIRzmH3PtXtW/64w==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1440049"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; d="scan'208,217";a="1440049"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 06:41:00 -0700
X-CSE-ConnectionGUID: vtCaiCazQI2ln38L66QN1w==
X-CSE-MsgGUID: d6dulziRRWefZCbrer5Btw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; d="scan'208,217";a="3702291"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 06:41:01 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 06:40:59 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 06:40:59 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.28) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 06:40:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/nLgtnA2dWmoREZJeoj2sTrzpEWoiLrqNwaRFXTVMziWAZrKyjEIQ6PeBIwvbH5/eSm6pZt0qIX0MrLX5/+QwmcD+4V/JAD+0n4GPW8rNSpe9qBbNtJFyQE4YYBtNbgUI6yggkvCA8Z8oWQ6w4uNO7NhSTFDeyxTtJvaebZSBFjVhcKxJF3scUglbeikbWaXX0zh7XjTzpnZwENqgw2oAH2icZHJ3ltiC7Kb5u7mnYD5ABKSkPFpxiwm6RFcHrv/YQ0Z4EXeTM06YleYSluCcdEdLTy2TgBOoYflUqc7hS5r/cc/WPsZ8y2dtFbsfWhMH6iAQ2xI4aI71gV4GyLfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8VEVn9MIQhukBAXlHnPWAdQRis8i1Pqfk/0k3HRPx4=;
 b=Yad2RWmqCxmOHHV0yS7BpyHMABvobumEzrftEfPeK4djurmooLQs25BL7cjhRwprqL3jiZDe+Me810IqIb6G6L+47w1TYj9iN6Hg48K0JKuHXRShyA0n8XoHu+ctJS7ps3lumPhofUyGzcVWwd9X6DqVXSvVqxJEAr+kGjyCLstQyulEXLZz4dSb2pHNnHpQ04pv9qIIQScIOrkgTYvgQxBRWKDi5kPzKemZzyVidbSmuDOPKM6qqW2Bp1mAVY8anGgoYpfp8f/5hqkZPuu5gbrwUUGWXjiil9QEYqUK2+sGAKT1mkOrF6DAIVPlF506i3Jl5ZSV5ZUDMrhZq3SmFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by DM6PR11MB4707.namprd11.prod.outlook.com (2603:10b6:5:2a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 13:40:52 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0546.016; Thu, 22 Oct 2026
 13:40:52 +0000
Content-Type: multipart/alternative;
 boundary="------------1J3pVuLUHy4VutDWA8TQdTZU"
Message-ID: <332beff5-53b6-4043-8b60-7c73ca780eff@intel.com>
Date: Thu, 22 Oct 2026 19:10:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/12] drm/xe/cper: Construct CPER record for hardware
 errors
To: Raag Jadav <raag.jadav@intel.com>, <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <daniele.ceraolospurio@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <arvind.yadav@intel.com>, <syed.abdul.muqthyar.ahmed@intel.com>,
 <nitin.r.gote@intel.com>, <pravalika.gurram@intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-18-badal.nilawar@intel.com>
 <as9Zvxl3-Lx4H6En@black.igk.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <as9Zvxl3-Lx4H6En@black.igk.intel.com>
X-ClientProxiedBy: MA5P287CA0334.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::11) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|DM6PR11MB4707:EE_
X-MS-Office365-Filtering-Correlation-Id: 48ff2e97-c165-4a98-0529-08df304216c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|261009223027099003|10067099003|56012099006|8096899003|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 79OFtJ3ENV6z5h6PJp1qwelr/BPzto0rXlmlGtbNzpD2LGm6JqBN+uVR0g1FNffvgWohqaCWIMn/elRzXwRFRc4RZV4pMTJEiVsVpv4iOXeZ9xuvtO9Z+M5d9Taox4zWM0OC4sv1W3ANDwN88N/458c5nxnfJybOYmGxndosUUS5boGB6Aq2nH2DzixJ71tNaIj0tuuW+UoHOBxo8Yq2bNfENA2v3Ow9ZHK7lGM70wpgMrNRjQlQ0JD9RYrSkRiJEYOKR2iTH8TtHRigIvHw8i7XNlIq1DaD0HJEnZF5pF4EYLv7zG0zF9lnR7HZDh7M0cOQOpViceCUJSuXAXjes+XCWGzYZc4JRNy2fNSMkO7LgmtD3uZC3n/ABpYgSYc1OKcZY0L1m+m6xAGGY1uNy5fPYY+aIbzS/d/xNi/5xw5x+HvxEhScQyARhkK0Zeo91DHmLmtxTmPrmm3INMAj/VhpuCEuaSE0hcxI87vPYsA50Dis6BfgQ2kGX0jDc46FVQTi4aHsVzzWbXKZ72YUiBctWCBJBRYQXjZR6Lh2bZolQJtsZEGLWaBsSdqSJvmWUXC37nBUhb/Q8341qtFObRitOKRStvmPn3G6T17aBObptfWdd7gtc6p+mjNF03AkO/5KMueQtlOFDJsF+q3zqz3/SoOnK7Wo1niGrgCZKdo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(261009223027099003)(10067099003)(56012099006)(8096899003)(22082099003)(18002099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnBQNUxwMVovVjg5QmtoTEExd093cUJsQlhpRmQ1bDlpU3JtWDZyWmE2U1ZE?=
 =?utf-8?B?OStnK1B1T2dkV0JnWUsvYUFnYmNUZzFvVzI3RFpGcHVDVUJHdXAybXNJeFNM?=
 =?utf-8?B?WG9CcUwyTm1RTEpmT0dQa0JMRlUySW9OcHpVVXdkcXI4cURGRTcyNHkyaDB2?=
 =?utf-8?B?clR5TUp0VE9pa0dVTUNxYm9pS3cwaDlQQWJub010dTlOZS96UFRXZFQrS3Vl?=
 =?utf-8?B?dnhwcmdFQW5VZ1JpVU1WNWw4eXVKSEs1dXN3dkxQZEpabTVkUFV0ajJkZ3pq?=
 =?utf-8?B?ZE1YSEhNYlRxQlBxNWFEZFBZaklXU2Z1ekcrTWIwa0I5bkFjdlZQZ2VsMFh2?=
 =?utf-8?B?Z3ZqZWdvUTd2b1d2bFZnWFRYdmdDc09OYVBXVnI3YW5jT3M1eTMwcndUcjFX?=
 =?utf-8?B?VmkwN1I4bThiM3B4ckt5Sk04TnRwMkJMeXN3cEg1dHlObFNLc0VsTEU2VGxU?=
 =?utf-8?B?ODF3ZXNNb24rS3NEUDdZSU1jUmRRMGZrN0dhWkhEUHJyM1lFc0xhd2VFQVIy?=
 =?utf-8?B?azIvWTc3OGkvbG94aXFBeFFIdFkxYU44c0E0c1JWWmFKd25QY1l1NDNVek5J?=
 =?utf-8?B?bytEdEl2ZFBiQU5jSkdmdkZ4VGVydlYwWmhia2tJQXJTOXZ2Q3FLQ25kdWtv?=
 =?utf-8?B?Mm5NcGV0NXkxdkFHUkJtS1IrMGhwRlNMZUUvM1lXQlJhdnh4VlBTTWFPK2xY?=
 =?utf-8?B?a1hXeUs0UG5KS2x3UGpramhCTWQrTjlXRGw4aDcwUERlMjMrUFJzS0haU29r?=
 =?utf-8?B?RHMzbHpaaUhJNWlhTTVoVzhGNFRIYlZuTnpUUkN6Qi8wcFQxZGxPdVozZUpT?=
 =?utf-8?B?R1c2V0RyYU4yRWh0YmJ4Y3Myek4zTTY2QnE1OTVobWtuNTlHaGYzbUVPZXd0?=
 =?utf-8?B?UU1OdExrYmxtOHRESjNBWkV6UmJlS0pLK0hncU1jNEIwKzY2OEY5bUtCNWcv?=
 =?utf-8?B?bXUzS3hCQzNDeisrVFdkVDVKSzg0T0ZjSjd3M0orbW55ZEdrcEN6NEJmM09C?=
 =?utf-8?B?U0pzK2JMWlZ6emwwOTdlOWdvTFhIbHBKZnNyTndlYjhrZEJXRFFXYWw5Wlpj?=
 =?utf-8?B?cVVVc3ZFcFZteEVhWmpwU293WHRHemk2UkE5WVNKUTJsNzB3d0tZcU92OUY3?=
 =?utf-8?B?bXFneDFlKzQ3cmhGc2c1bWxOS3REMlVwK2YxeGloZUlCS1pHV1E2SE9PSTZP?=
 =?utf-8?B?bGpSK1hjK2lGUm11YkJJWXdaTWcyRG9oRjNVWjE3TmFULzNJQXFWKzJidzVy?=
 =?utf-8?B?WjMwbVM3VVdSMW4zbUdKUkNBYTdjdkJRcFI4MnNXcmlGanN5ZnRSc05XeUZi?=
 =?utf-8?B?U0hiS3VKZ3BxNUdwNnljeGIrUndqYWhKME4wTzdDVXpDMCs4UFc3WDFjemth?=
 =?utf-8?B?cjJsUEJad09ld25paG1XTHhORVBmSFlBSWtHVm1FVmx5ejM5S2xJb0RWTk9a?=
 =?utf-8?B?UjJ2YU43eXFJeUNqOXp4U21Mako1dUhhV01rVXViWkdnZEpTdDNTQkxmV2ZY?=
 =?utf-8?B?aFdPd1JBMVRmc2J0NHRIZ044UGp0WjltN0REdjVvRTk2STN4UkZjcFJZMFlT?=
 =?utf-8?B?SnlnL0U2NWhhOC9CaCtHMU43K3liL3JIVHNrSWRQdENFSXJwVGI4ZzdtU0c4?=
 =?utf-8?B?K05DYXMyM3V0c3VhYVhFKy92U1FQaHJxcGJGczZWVFVnWVFHQUtGQklTYzRI?=
 =?utf-8?B?SHFQRmwyYXNYRmkxakxYdWhCMmMvMU0wMzRFejZ0UHlHYzBBQnhHTXQwaEFw?=
 =?utf-8?B?dWZTOGM2UEVjOWMvRHAxdjYySUw5ckFFTGdFWElxNXVVdllKbkh1RWM1NmQv?=
 =?utf-8?B?bUlKS21CKzdmNVlKeCt3L1BhWkN2U0UwaCtDN216YXhnT1pSV1M5Um9kWGxi?=
 =?utf-8?B?ZEhSbGFzbkZrMjJNZEkyL2ZhUlVINCtjc0dkMkNvYUFlN0w3Z1Zoc0d4YUh2?=
 =?utf-8?B?MzR0akhaQVRQNVd3dG8wU3c5Qmk3emJHRC9ENTBteS8zeEVGNHJuSFhHNlhp?=
 =?utf-8?B?bWpBYlJoSCtmNVZWTkNNTVBnb0FJcHJoRFJBcGwwdkFaNUhEQjNmak4rNHUy?=
 =?utf-8?B?U1JYRkdVUG9QUFlPd2thd295L0dSR0pGWDRBMmtqOGxTVHVjZWg2MFV0Qi84?=
 =?utf-8?B?VUJqOEd1WjRwcUxzY1FxRHNvdDVRZHZFd0lZdUpzRklSVythSVk1ZHNuY2RB?=
 =?utf-8?B?RStyNUFXTm4ybktCZHhSOXVkeU91MHlSekJHcFdhV2ZMdjV3TFVHSXRoRndH?=
 =?utf-8?B?Yk0yZkpZVjdXRGsxZ3BxYzd1SmJIV0UwNmFPN3FLK3lCMThQaXVrS2M0WFZW?=
 =?utf-8?B?ejhtZ3NJeU9sTHFuVE9mRTNmR1dvR3BieW9NWDVCWjIzdHJFbkRLdz09?=
X-Exchange-RoutingPolicyChecked: Kr8sfNaw7h4c1YmVy6LLmmeEexwA2S4anvKEF07LhQu3BKlC8C11/q/Fcgts92OM4vR7936SjytaFkZTZm9RtSbwpH2kUtrH4kIv9OTMGZjIMRVGp6F/qqBOXEBBxdvt6KE5+2THAlhiQGLlDd48no0WaqfH/qa0nSNlMHktX0bmAOtsSMfv+Smfwnjw+tDtQe9ieLGCLMFJ/fQFJp/Ciuua6LrsSVHM0jsgkGdluDFfCum5e0j+og//gPtDoXM0+Ux8UQbliHWMIK9BgfH6W7P70PkH1woI2dUEoSJ/uRaHYxDaJ5bRiwwkGFM4sAdjcReJ6QT8+yAAf/cPhFGBCA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ff2e97-c165-4a98-0529-08df304216c9
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 13:40:52.1734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mu+pMG9cwRo9PxDab0YxzcdhAuFx3W2cxb/9nEoFG6qR0PLL03sBFlbXJFcSJ8bxx00b/CXJ0Yy3rZBHYfE1vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4707
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------1J3pVuLUHy4VutDWA8TQdTZU
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 14-10-2026 16:00, Raag Jadav wrote:
>> +static const struct xe_platform_id_entry xe_platform_ids[] = {
>> +	/* 0x674C  platform/8086:674c */
>> +	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
>> +			    0x86, 0x14, 0x92, 0x55, 0x0d, 0x9e, 0x9d, 0xa6) },
>> +	/* 0x674D  platform/8086:674d */
>> +	{ 0x674D, GUID_INIT(0xf95911b8, 0x6564, 0x5905,
>> +			    0xa6, 0xa7, 0xb9, 0xbf, 0x54, 0xab, 0x6c, 0x27) },
>> +	/* 0x674E  platform/8086:674e */
>> +	{ 0x674E, GUID_INIT(0xb8d24106, 0x0108, 0x59f1,
>> +			    0x8f, 0xfc, 0x9f, 0xc4, 0xa9, 0xc9, 0xb7, 0xb0) },
>> +	/* 0x674F  platform/8086:674f */
>> +	{ 0x674F, GUID_INIT(0xdd8dd88e, 0xef2f, 0x59b1,
>> +			    0x99, 0x15, 0xdb, 0x6f, 0x1d, 0xc9, 0xb4, 0x5d) },
>> +	/* 0x6750  platform/8086:6750 */
>> +	{ 0x6750, GUID_INIT(0x1dd66c44, 0x87d5, 0x524a,
>> +			    0xad, 0x6e, 0xfc, 0x18, 0x9d, 0x42, 0x6f, 0x1a) },
>> +	/* 0x6751  platform/8086:6751 */
>> +	{ 0x6751, GUID_INIT(0x17d0dd04, 0x2fad, 0x5400,
>> +			    0x99, 0xc8, 0x9b, 0x45, 0x51, 0x3b, 0x67, 0xe3) },
>> +};
> This is unrelated to cper and shouldn't be here. I'll rely on Matt's
> input on how to deal with these.

Agreed, I don't think this is the ideal place either. For now, I'll keep 
it here and, based on Matt's input, consider moving it to xe_pci.c, 
which maintains the PCI ID list for the platforms supported by Xe.

Thanks,
Badal

>
>> +static const guid_t *lookup_platform_id(const struct pci_dev *pdev)
>> +{
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(xe_platform_ids); i++)
>> +		if (xe_platform_ids[i].device_id == pdev->device)
>> +			return &xe_platform_ids[i].platform_id;
>> +	return NULL;
>> +}
>> +
--------------1J3pVuLUHy4VutDWA8TQdTZU
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 14-10-2026 16:00, Raag Jadav wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:as9Zvxl3-Lx4H6En@black.igk.intel.com">
      <pre class="moz-quote-pre" wrap=""><blockquote type="cite" style="color: #007cff;"><pre wrap="" class="moz-quote-pre">+static const struct xe_platform_id_entry xe_platform_ids[] = {
+	/* 0x674C  platform/8086:674c */
+	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
+			    0x86, 0x14, 0x92, 0x55, 0x0d, 0x9e, 0x9d, 0xa6) },
+	/* 0x674D  platform/8086:674d */
+	{ 0x674D, GUID_INIT(0xf95911b8, 0x6564, 0x5905,
+			    0xa6, 0xa7, 0xb9, 0xbf, 0x54, 0xab, 0x6c, 0x27) },
+	/* 0x674E  platform/8086:674e */
+	{ 0x674E, GUID_INIT(0xb8d24106, 0x0108, 0x59f1,
+			    0x8f, 0xfc, 0x9f, 0xc4, 0xa9, 0xc9, 0xb7, 0xb0) },
+	/* 0x674F  platform/8086:674f */
+	{ 0x674F, GUID_INIT(0xdd8dd88e, 0xef2f, 0x59b1,
+			    0x99, 0x15, 0xdb, 0x6f, 0x1d, 0xc9, 0xb4, 0x5d) },
+	/* 0x6750  platform/8086:6750 */
+	{ 0x6750, GUID_INIT(0x1dd66c44, 0x87d5, 0x524a,
+			    0xad, 0x6e, 0xfc, 0x18, 0x9d, 0x42, 0x6f, 0x1a) },
+	/* 0x6751  platform/8086:6751 */
+	{ 0x6751, GUID_INIT(0x17d0dd04, 0x2fad, 0x5400,
+			    0x99, 0xc8, 0x9b, 0x45, 0x51, 0x3b, 0x67, 0xe3) },
+};
</pre></blockquote><pre wrap="" class="moz-quote-pre">This is unrelated to cper and shouldn't be here. I'll rely on Matt's
input on how to deal with these.</pre></pre>
    </blockquote>
    <p>Agreed, I don't think this is the ideal place either. For now,
      I'll keep it here and, based on Matt's input, consider moving it
      to xe_pci.c, which maintains the PCI ID list for the platforms
      supported by Xe.<br>
      <br>
    </p>
    <p>Thanks,<br>
      Badal&nbsp;</p>
    <blockquote type="cite" cite="mid:as9Zvxl3-Lx4H6En@black.igk.intel.com">
      <pre class="moz-quote-pre" wrap=""><pre wrap="" class="moz-quote-pre">

</pre><blockquote type="cite" style="color: #007cff;"><pre wrap="" class="moz-quote-pre">+static const guid_t *lookup_platform_id(const struct pci_dev *pdev)
+{
+	unsigned int i;
+
+	for (i = 0; i &lt; ARRAY_SIZE(xe_platform_ids); i++)
+		if (xe_platform_ids[i].device_id == pdev-&gt;device)
+			return &amp;xe_platform_ids[i].platform_id;
+	return NULL;
+}
+</pre></blockquote></pre>
    </blockquote>
  </body>
</html>

--------------1J3pVuLUHy4VutDWA8TQdTZU--
