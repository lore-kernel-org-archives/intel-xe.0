Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7964DC79FB9
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 12:59:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F42F10E22F;
	Thu, 10 Sep 2026 12:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GPxlqe60";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8CE10E22F
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 12:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789045157; x=1820581157;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V5bbrV68SxaIlK9JNZl6+9qrCUjKtPn/dA1VJ2Ika0I=;
 b=GPxlqe602YMfGy9iWq1zf9wQc5/wAokED42ivmba1e4EvA3/cs3pSTxi
 EU7l49vKR/PeTOkG4H/iVLKqGuP+2B/Ceki4XCrYoJYhKSYBGxTqLnn3l
 BZE+b0c6Ywu2DlR8uAQwVahv7zg+P4MEphtw7+fVEsvgVrgL/HGVpE8i+
 rxz27sLk1vusnYMDYmLzKwXHzDjzCU0NPzQmOUnzHh8x338nd949yeYIY
 9KwtYQdUPRR8NgS4+UPK2oQLYxaASh5/IDn7lg5Wf5+/2laPFlgxlQtU4
 Bfxo5dLcLQrhb4kANdCYxJdVZYQ63n3bgbtpnZh9LLUuX5YAe+9S1D2Ix A==;
X-CSE-ConnectionGUID: /H3R5Lv8SZyKs49RAJNYGg==
X-CSE-MsgGUID: bubNyQSiRRmwL6zqVom/QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="115038988"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="115038988"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 05:59:17 -0700
X-CSE-ConnectionGUID: LITnuuxSS8yTsT3QqzNSpA==
X-CSE-MsgGUID: qGPEFt/gTUGRyQLVAKqrNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="269059446"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 05:59:17 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 05:59:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 05:59:16 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 05:59:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tqr+F5GcDdzJKoDVcpLfJ5kSdm6/4df51EB7iks6FmNRQ6Ltp19WpG3n8Z4dyU3Iar2clI8UQANEPSrXTs6usvGV+R3Bru7y+kjpbsDX1hAkI9r0DWH4sA+x46vEqvmyLUYzElEBxe6W/wkideLdeMx2NaIxiwR8NdPZO12ckPfVJRWrkDok0/yQYoyae5vOikhmqcxlRNzT/3Dke6GA6SZRNZanjkEqD8MzIhluimGmA7rYxQH9WS9zdvGoLSE6J2pV5Pm0pe9nBjHn8LmpA9oqV9M7xvdzaMIZ5bwShbyzqHYwalI2qCysGqeJP+p2of41p0B9SmCX2MZsCUJJVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bclO3rJC62h9dxqUDwtiQ6IMi9txBkITiQ1FEDj6h3o=;
 b=FnESkQVIbLwxWP9CGmsMUXmm2L2yn7gsaoiXNSqTlFyTt+72j28kXw0Rz/xmaqk+G/R8/MM2B2/66Hda5yrFYNCyHsjBcj6DHSg3vWQv/FjPJ2zXVfi1Sww9GwqHJyrIpe7gv4kB89ti7GJToeaTw5l9egrRs1yzI+Gkq2BZLKyEcOzCQRixiANSz6YVQcFuhsSqS6RpKq45Q8a41OwdTeRc1D97HKdiVdxK/LhYLU6Us12m2YFQlQ053ryMkDV0hpxZ29tH5mr9iAVlnOIu1BkVP2Ti8NmrAWkYOpC88fh4GKf9M3eSzi/YMBVPLuWICwlWydGQcTplqw9ZwmxhwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by PH7PR11MB8550.namprd11.prod.outlook.com (2603:10b6:510:30c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 12:59:14 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 12:59:14 +0000
Message-ID: <5214c20f-ab36-4a8e-899e-351bca1d4026@intel.com>
Date: Thu, 10 Sep 2026 18:29:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] drm/xe/cper: Retrieve the error counter record
 for CPER reporting
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <daniele.ceraolospurio@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <michal.wajdeczko@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <arvind.yadav@intel.com>,
 <syed.abdul.muqthyar.ahmed@intel.com>, <nitin.r.gote@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-16-badal.nilawar@intel.com>
 <ap_gdX1GeLLatl2H@black.igk.intel.com> <aqD4syBajVA2sZPy@black.igk.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <aqD4syBajVA2sZPy@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0063.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::14) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|PH7PR11MB8550:EE_
X-MS-Office365-Filtering-Correlation-Id: d7d94886-acec-4670-5420-08df0f3b50b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|6133799003|10067099003|4143699003|56012099006|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: RHcx/uPPoFUheS/94U5SGES/Pt1yOvYngLULDLJkrwNMZLTu2jnF7BTznIgtkZf/p3Pk7QsluO8cC0DRC5jvjZvjbgcIDCFw+9QBFuAF1VfkP8HGEvM6qMEdzBUTxfWhqNWpVEyaxFasOpDlFkHtMRh7ipjQcjA4n14RP6AVh5zi8VsUvEK7cPIClCuZR8isXpZnF79LDYEY4UETLcm5PkVfINOgvKnUH2w2w9mfJBpKGNU11gTXkk/DpcGfAxFAHOAc3YV4Bk0KhXErJdyLIo6iizMQSo3KtjxLXIxsNd6yteY/vJJ/hbw3s8fNx4XAp5s3vAINfB6cJC5CW2z4un9YuZcs+5/GK4q90VneIQ1Aba2WBZ5W07rORkoMxkcA2Z5bibjsDWg93dFBzF9tU0oerb0Z/WwWobWyK6ZGJ0LJmHl3my4uwgB6J5tKKeZ1X2omouueiWFrVJeR9xxtom7MzGlYz5HQxQ4gWiAyywvggCyFA5/jZsi7xrDnTQOPmglEayQ1BzNF7Qu0ZVhYoo1bcFEHGxcE+WJDPvuwJGzo0yUfsw2poaKidp8v+1M4izCZy7quG3A4Ce4FlgSFw5oGt4ncP/CmHNch+A3K8f5ZqmV52RcX67oL7K3k7//a4BoE6nEN2qsI2TZT9hP3Veav+uUSOUHcYJafNSSEY+Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(10067099003)(4143699003)(56012099006)(18002099003)(11063799006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0F2VVpaaFZleFlBYnNtQmJJNk1YelM5Z2o2QUUxQktCQ0ROUk5TaDNDdWZs?=
 =?utf-8?B?OXpqZFQrdlJ0b1Q2N29WRnRnSW5kWGRWWDJFcE1yMGU4NEF2NXh5VTZBek0r?=
 =?utf-8?B?NC9VcGFDRlFJVmovdS9KWlVqdDV3WEoyWE8wNVVTZFdicmFLWjRlbm5ITWx3?=
 =?utf-8?B?bzhJVU5ZNlRXVVVENVBibE5xaGtmc1Z5TzlkV1pSY0NtbFZuM2E5WkM3djZP?=
 =?utf-8?B?bDFmSmpTaldEK1ZSb2QwNVJzMThvWUtoUEp5Qkp2TktCTnVHUHZHb2lGREgv?=
 =?utf-8?B?L0hVRHRoQjN6a1hZS2E0cDdXTFVYZlNTaDVVWm1CZjB1RkZNUGQ2TjhZbHEz?=
 =?utf-8?B?Yy8zNWlGRS9pT29wekpIZkl6TGwzdDRDZDFwcFE2bG9ZSE4wTFRGYVZNNklZ?=
 =?utf-8?B?VGl2YUdSeTBVZ2xnWjBCMkg0clR1MFhyazRsYXBtSUF3czNIRGIvRVR1K0pL?=
 =?utf-8?B?dFJEN2hIZUl4S2ZNekxQQlVnQ1UzZkZxL2RlbDZkY21HalBlWHJtNVNGaFls?=
 =?utf-8?B?NWY1RjNTRjNNWW00ZTFFV2tHVC9pU0R1WXNKWTVCRkpyOWdyYXN4Wk9lYkcw?=
 =?utf-8?B?bk1FZENvVE96YnNuYUJ4aVVIMFU5ZTErRnBtZisvSDFQV0pFbUZseGsrZFJQ?=
 =?utf-8?B?SE9kWEtDSjgrSng4RFA0Wncvd2dxNy92UjQ0eWJiUjFkWk5zYXRaZUI4Ny9a?=
 =?utf-8?B?bDhrTENoM095ZUxiMDRCOTVkME5kbXh4R3JIUEJVM1ZOV0doRlZpUkpKSlI3?=
 =?utf-8?B?OGYzcHkyQlc1b0lkbW1WMGUrTnpxQlRUM1RTbnl1T0k3Y2wrNWZrOGx5Z3hw?=
 =?utf-8?B?YW81RHQrZ2pLYW40N3c3aGFLQmxpNTEvWjZKVnJETmZDQ0pjR0ZwUEZCY1d3?=
 =?utf-8?B?L3c5eVc2azZUUyt3OEFZOUJzZytqb0VGYkNMK0t3b25jYU85Qlh1bllZa0RP?=
 =?utf-8?B?U29zOTFMeng2MXRGOU1QMUtNTXZnRkdOWWRLNHlpWnRoNUpOdTM4bituNkVW?=
 =?utf-8?B?Vm9yd2RSY2RZYTFWT1J0S2hCbVluUkRQR3Fla2svRFVDVlJYc0YzOWdkNVcz?=
 =?utf-8?B?ZzkxR0FXZHh6cWMyN01OTXJ6b2VXZk1LZzREaXdHM0sxOS85LzllOC9wTE8z?=
 =?utf-8?B?VlpmM2Uvb2g0MEt5ZTd4d2l5MmVMa2xjSUo0MG11Wmw4bVhPdldEQTRBYnNi?=
 =?utf-8?B?Zk9jSjMvUE95MHBBOHduNUplV2Q0WHZPZm1mbXpTSWZxaGlqajdPcEwzVkpP?=
 =?utf-8?B?WHdUeFBQbWpIUU52ZUd1Skd5c0FCb3BMQktld2tLekpPRURCN25CZTQ2Z01x?=
 =?utf-8?B?UnJZazd6bGppTHV5clpPWjNwdVhNRVdjY3lTWTZsbFJSLzcrQzFYMHJ3WVEx?=
 =?utf-8?B?M1crYW1aSjQzelJoQmFMSkR1by82YTRZY2ZwWUtHbk96QS9VaDJ4bmpzVXRK?=
 =?utf-8?B?VmFYZ0M1WXhCOHk0TG1EQWJxLzVMWS8rQ1kyVU5DblRDUkRXeFpJbExGWFF6?=
 =?utf-8?B?ZG9oSk5IazE4blN3eDYxQ0tjeHhwYXBuKzdVK3ExY2J2Z3J1Y3c0UDdzT3Nk?=
 =?utf-8?B?Mm5UZ0RvL2cwQ2tFczZoMVh0ZmRENU1Fd3diMmdqOTVDMnE0QVdPRlJYOGY4?=
 =?utf-8?B?SDBNNmIrS05xbFZSSU96aUpzc29ma215dzIyUCt4NzBFdzJPRVFsZlIraFlr?=
 =?utf-8?B?Vm1JZ1FQdlhXakREd2RNM1VKUklhMFk0QnlINDNtSm9qYVdzc0QrLytKRmdu?=
 =?utf-8?B?U1M2QXdIWVErYWNBV3JWd3hzaUtSWFkyQWk2c0lTTHJ3QkFqVVhnaG1ibzFy?=
 =?utf-8?B?QWYyRjdPeXFPRmYrRktNVlM2MVM0RFpPNS9sQXQ3VkpIRldzNlVDdGt1ZDUy?=
 =?utf-8?B?UEN1cWZGb2srTkdRem5SZWpHNmdxakJZMlRSdlJaV2lQVGxNbXhwdFA2OVpG?=
 =?utf-8?B?S1BNdktFeFZRQnljN1FRSlZXbTVxaXcxL0N2L2V1b2RycHlUV25XdEpoYmMv?=
 =?utf-8?B?eEFqUnZWaW5td1NEaVYzL1FENWxGczFLYk5PZ3htYzhXeVdYcjVpNHdtSWtX?=
 =?utf-8?B?dDlFeGg5ZjFVNnVTMzY5T0ZDT1hWWC9Dak1rTndjMUU3MzlWRXYrREl3ZDZi?=
 =?utf-8?B?UmNaUDJUNk9Edy9Dd3VsQ0d6M2o3K2s4NStvNkxQWjVpY1Z2R3JxYnMvcDgr?=
 =?utf-8?B?MmlSb1BUcm9LcUNYMlNsR2MrRlB3cW8wdlovcUZkelM2NmJxeityYndxSVVa?=
 =?utf-8?B?R0F1ZWVRaDVBZUt0TWhRY1FCV3huVlZyR0FRWkZYc2NwNGo0REdndnZLb0gr?=
 =?utf-8?B?MzlIY1ZvRnc1SDRFWE5Ld3llSzI0aVlHbUgyN1VWUXFXcEFlelptQT09?=
X-Exchange-RoutingPolicyChecked: TjiaKG13YzCBaGlYmFVLRRVqLhbc3z/EI9stNR/JNWd6xHqb5dvE0WaH7Plo6+zLJWPL+y2fTi+dNb3uz7nRhXf0khZEbzf27aS7Bieo9QewogmP5gaD2X+F+Ut7yMYmZaTPueMVgbf0dwJo7g4m7rcIhJtYNYcGf18tT9UNd0x2ZElm8DXtaI4rWIFY1y5dqpuyLKKGesK4VH09fLXTQTcObshLH+Ze90mWTyXmIV9h66ouTg5zs8UQLrcd3ulijOUFa1xovaRS7GJOBcD9ODfErm+kXhpr9s1SYzrtswLPX48Quey/VkCWn8Vz54IQITF7Yy/j4dJUg54exHVDqw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d94886-acec-4670-5420-08df0f3b50b0
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 12:59:14.1975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRbJUTHeL3BYbbRdUNUYNVjRnMmgQ+2T5f0GGxASSVkmZET7hbIBirIQj277PPmPFYxr+s2x7h7/VWPyjNEYLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8550
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


On 09-09-2026 11:42, Raag Jadav wrote:
> On Tue, Sep 08, 2026 at 12:16:27PM +0200, Raag Jadav wrote:
>> On Sun, Sep 06, 2026 at 10:56:07PM +0530, Badal Nilawar wrote:
>>> Retrieve error counter record required to build a CPER record when
>>> one not provided by the caller.
>>>
>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_cper.c |  15 ++++++
>>>   drivers/gpu/drm/xe/xe_ras.c  | 100 ++++++++++++++++++++++-------------
>>>   drivers/gpu/drm/xe/xe_ras.h  |   3 ++
>>>   3 files changed, 80 insertions(+), 38 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
>>> index e8017e3ee3a0..f04a91223a43 100644
>>> --- a/drivers/gpu/drm/xe/xe_cper.c
>>> +++ b/drivers/gpu/drm/xe/xe_cper.c
>>> @@ -9,6 +9,8 @@
>>>   
>>>   #include "xe_cper.h"
>>>   #include "xe_device.h"
>>> +#include "xe_printk.h"
>>> +#include "xe_ras.h"
>>>   #include "xe_ras_types.h"
>>>   
>>>   /**
>>> @@ -26,6 +28,8 @@ void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sig
>>>   				 struct xe_ras_get_counter_response *response)
>>>   {
>>>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>>> +	struct xe_ras_get_counter_response local_resp = {};
>>> +	struct xe_ras_get_counter_response *counter_response = response;
>>>   
>>>   	if (!xe)
>>>   		return;
>>> @@ -33,5 +37,16 @@ void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sig
>>>   	if ((int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START)
>>>   		return;
>>>   
>>> +	if (!counter || !xe_ras_counter_is_valid(xe, counter))
>> Why? Should we even be at this point without a valid counter?
> ras_counter_is_valid() is already part of get_counter() and !counter
> should be covered by IS_ERR_OR_NULL() in patch 1, which makes the entire
> condition redundant.

get_counter is only validating ras response not caller provided counter.

Check is needed for data[] payload from xe_log.

>
>>> +		return;
>>> +
>>> +	if (!counter_response) {
>>> +		counter_response = &local_resp;
>>> +		if (xe_ras_get_counter_response(xe, counter, counter_response)) {
>> Dumb question, shouldn't the whole xe_emit_hardware_error_cper() be the
>> consequence of get_counter() and not the other way around?
> Thanks for the offline pointers. From what I understand this is diverging
> from the original hw cper design and correct for whatever we have in place.

Ok.

Badal

>
> Raag
>
>>> +			xe_err(xe, "[RAS]: CPER: failed to get counter, skipping record\n");
>>> +			return;
>>> +		}
>>> +	}
>>> +
>>>   	/* TODO */
>>>   }
