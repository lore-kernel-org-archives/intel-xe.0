Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABC6C44507
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 05:23:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDEC510F268;
	Fri, 17 Jul 2026 05:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YWhuRQW1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E335D10E68E
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jul 2026 05:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784265807; x=1815801807;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1Ln8W0wGZsmW2t5LP1upBT0q7Ch71/UPuetmtsxw8Q8=;
 b=YWhuRQW1MGQTt5sHeVlvdZeIvGy3yrEkc97EBw3b+rU+MvXxFW1jfLxy
 kiF2Y542IuyqcIDIPQ+HbRSTidEhmJ+cy2kcrQ+SQyLAq4DKCBLjQzoiJ
 Vie/si2aKRZ9pS/l5aDWQmTnrGmy49Ys8BWweNt8yRqP4RbmLdf2M0R6j
 +frXRqeFbNioL3XGdW8huTUTrI+MWfHkUr3aK74abz1zjcg+ZTtqOxoAc
 ZB1sWK/bsh7Z2nJwu2vYfKJEJCYQM5uGoKeKQbcg/ZqFgmenz9gF9Z9YI
 Ts4ETNgLtKopGhV0UK7gXmnTnzxGzABEVoCv5aaZc9rD3zaDUGSRqIVsW Q==;
X-CSE-ConnectionGUID: x4k6+T1sSCCvsAw+LeaH6A==
X-CSE-MsgGUID: sjLbktxjR+WbYe8YKiF78g==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="96069490"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="96069490"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 22:23:26 -0700
X-CSE-ConnectionGUID: bWMGU4RsR1S57rzudk6C0A==
X-CSE-MsgGUID: 1R06YY1mRT2Tqrc+xjaOXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="281139184"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 22:23:26 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 22:23:26 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 22:23:26 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 22:23:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fdUBGx4Zzxf5FagXYCEVOYblxLdVrxWOJ4DYyDbxRJrO4s9NrDSF+tZdjbBVoxod15g0QIegnFkqdeSsarIYwrDSCOU8fote+8hDyQUuL6ojqzHa93PDT0+coVl5Okb6BHdajrStpjrMHUeHuIu771BmC+eUkAS1+ehvdauaIfYIs5jUlHhH3kVdhfrMRxlk4VsinAtB5IdniXKQdtbayVphrxDGzXwqZTTAqVTSq05bnVacuQ1+ldhMjW8jl0t0qigCKEfTaFqrsNP5nPNPBcs8IZtFRCl63HbjUm8c1aHaTbAHDXFjCDEsmX0lMGiAFITdwLv9kXRMPJO+kkfBgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMVZLErejnLnCY8vZQyfBN+UjX9H+pyofxDPpS/whYQ=;
 b=JC8Lvo21w3mrmB7rJ5GHrHRfBoUBC3yie5HKI6raBN1CJhihcKG7jP5s+6pMhJDxvbEyu/yS16o9Uakq8cxx8JjqniqMxTYHLybgCfMOnAm/h+lm65u/gUDIacJsvuTfhok7v4sVvLKclOYETZO0FolE6uLo6U3FA9EPmdH7ogiBcUx5nrT+hI9TcmF2Jp/dt23n2ZJJ3ttsSFY7sObuj2bS+QQOFdwYP9mzedIoFdv/nJBFCEgffKYmIrbLF3tLx4x1wbsfkaChoRiEnx7aQGma9waATpY2YN/Q91B2tAICVJ0bTvVtOlGwVozl27LJhyHETLVNK/zuC9lCSoTgZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB7429.namprd11.prod.outlook.com (2603:10b6:510:270::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.12; Fri, 17 Jul 2026 05:23:22 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 05:23:22 +0000
Message-ID: <f69cfc9a-77f2-473d-907b-8e007490c70e@intel.com>
Date: Fri, 17 Jul 2026 10:53:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anoop.c.vijay@intel.com>, <anshuman.gupta@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <badal.nilawar@intel.com>, <mallesh.koujalagi@intel.com>,
 <rodrigo.vivi@intel.com>, <andi.shyti@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>
References: <20260716073600.674089-3-soham.purkait@intel.com>
 <20260716073600.674089-4-soham.purkait@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260716073600.674089-4-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0178.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b794050-5363-4d7c-7b6f-08dee3c384ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|6133799003|3023799007|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: oCGsO/t5kBvWFQpfgvJISJ6gq9u+sMGARSgyjO0v4paeLh7bBu/o3ZUmn/ciA7IT0jtJyhyiDPXYTcxYCHhO6K9eQSjHG07MtU4VSPm/f4W6+Yh/Sd33xLhbQfiJ9sXQ/1c3WuLhT+soFYDLzaW3CjBcOk65PRsTznvYyIWxXbJJw0UtQ/oWLGAJ9OJLT+58ZAbm4o1XXAU133wdh5jkC2xWGV0rv6dYYgdHTrytq8oqHwyfcqSMqFbLrlO8IJeFvOulwBTLSZnRr3Gd172KFLz/nJektUWD4C1I4hn+s2qKUhJGvUCiMXnwim1Tite0DNf33VA5pmsHwnd4asxXK1sMdoPOwX92VHwhSbY0u+JSVRKCHS3zHEDvx2ENJGzaipoOCsDg/2+kRoYLjMX+BU/MxmVFKCR96vJqn7JfNgqHqzwIhdgxpeo6AD6/8NYrvQKo8pIUy/TNEs1K2zsGCxwtDvXl6TsC1mQ7c/IYXIRRa+bJsR2Bbzu5DW+vToiRxGBS+/axIjlYpBk+pWbj2bL3JhwALKYnBd1O/rqDOlaDhoKoDyM6qTHZe2bavUfshlQZc6oPQpYZ4vOgJBhjjw5Mvj1S5ovlZTigLWwT38v7l2C6+jDXmV4vQBiWoJGnFtv5osy+DbBuarrqs8SscVhKg+r/waiQGUCeG5XFUd0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(6133799003)(3023799007)(56012099006)(4143699003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjY3cGFjQzRmak1JVzVyS0wxZDlIdERzQXMrSUxvMko0NnVpTTRHb0MxUE9Q?=
 =?utf-8?B?Q056Wm1zZjlTY1EydmJSTjZxQzlGWGV2SWFRM05uTFNTS1plOHpia1duN24v?=
 =?utf-8?B?ZFZhOVIxY3NiMjhGa3VsZHR3SGFNbzZVeTV2c0YxTnJBUTA0VUJtYWV3UDU2?=
 =?utf-8?B?SUUrMlBJTzdieU80dHNKcUVwS2lsTXR4RG9TbmNucHhYMEdLTkZlMTFvWWxX?=
 =?utf-8?B?SmNEZ2ZCcEVKNjIwZkQxdXA5NzFCckVJaHZkZmtQTGE0MGwyUkd3eTdpUmFE?=
 =?utf-8?B?NzE3STBhSkFyWElFaklPemFaQ01yeUgzTFh3VGpuV2paaFpvMHp4U0hmMzha?=
 =?utf-8?B?eW51VmlkWmRING5sQU9ST2xlaENteEIvM2xZVGdpcDdOOE5sQzRLbm9qN1JU?=
 =?utf-8?B?eTU0Rzh2NGRIaU5PcDRJNnNoVmNKdHNLWFdtNFZKYVhPRTBwc2t2UjFnOGo5?=
 =?utf-8?B?KzJ2VFZXVmkzUEIzeEp4S0lGbGNQMVFXbGl1ME1UWHFsOVFSbDA0RlN4TDJm?=
 =?utf-8?B?cFV2MGdWVjJxeURub2tpL05jd2huYTFVMnRYUU9lSXB5SnlmVG11WGE3S2Vk?=
 =?utf-8?B?Y2FQN0FCS2lKN3d1c0tBUjNMY0svV01OQkpCbnJvT2tJVHRSM3p0WUJFbFFa?=
 =?utf-8?B?QmtuY3BxOXo2UUNRUlJkR0tvUzZEdUJVTCtibUVjcVhTdGFkalA5UVErQ08r?=
 =?utf-8?B?NTlFay8xWGJHNExhRkd3L2N6cGUxT1VMYmR1SVlJcGNBcFFlZlpGMlNjM3FB?=
 =?utf-8?B?SnNZSExKMGVtWTFCL00zR2JoZWtqQnRTZnAwMGkrTDFwY0F5SGFyTXhNdngr?=
 =?utf-8?B?M2ZxSnpBcHdzeityejB1WENNR2IxRVJVVm9RbGdNNWFoTC9QdG1aQTIzRy91?=
 =?utf-8?B?bEJ2OW0xSWk1WEQzbW1OYzJodFNDWHFZLzRRUzljQ1VzbWlRWFBSSlJ3VDM0?=
 =?utf-8?B?U3k5WjhkL3I5OFl6aWROT2VjOW5SSXJFamJtSkhKWUdob3A5ZE80TDRHN0hH?=
 =?utf-8?B?YjlnVHFxQWJVeElldWRWSUlvVkxJay94dTJWZmlGUlJMSjYveWViRWM3eG1H?=
 =?utf-8?B?eG5KckNWSEhpUURBbnRrTHdFWHY1bmhjRUoyMWVkWnBHbWdIQVNSa0poTGVK?=
 =?utf-8?B?ZGpSSWZCT2Z5eDR3dHhHRW8yb2wvakhGK1N4bm0vbXpSSXFLanMvNVVmZWdV?=
 =?utf-8?B?WGZIbyttK2dWaTZTMFVheFBSSFNmL1NKSURGeHl0ajlWN21UN2tPWXNEdVg3?=
 =?utf-8?B?dHpkSUF4TWQ4dExMRnRQcEIyWTJQWHgxeExSbmJXL2NkMDN5T2lveS9mYW5o?=
 =?utf-8?B?Sm4xOHFEUDhTSnByaXdyREJ5Y1czbHJoWG8yUzRMUDlUKzFKTmltNG1aNDFQ?=
 =?utf-8?B?eTU1eWRMWm5NTnlBNGZDNnpTQytYSlRlZFI4VmRXUVNZc1c4TWE5cmg1Tm5a?=
 =?utf-8?B?bTMyMmZpUklIRWhMVUVLUFUyamYxNzZ4VHhWVkxIcEpTYWNuZDZuWmMyQjhC?=
 =?utf-8?B?WUpuWlI5aDk5UVBRN1dQcTRDK1oxQ2NqYmJBeHEyZXRnT2ZQOHJqaFZtMkh3?=
 =?utf-8?B?ZDRDbnI3YlpoOGluK0NVZUlmazdsYjBXVFFWNTFoWDJrQW9vL1lHT1hCaW1L?=
 =?utf-8?B?cXhZVEkydHR1OElYN21lNmI1eXBwK3c0eFpEeXFGY1IxZjY5Q2V2cmRpbkVJ?=
 =?utf-8?B?c0dCU2NnSTI2VXJ0YnVHSGt2ZzV3bVlKNVNmNXY2NGZYTExUd3czV2ZhTWR4?=
 =?utf-8?B?bUQrWEo2dy81eFFtR0hIbTVuU1IyVGxTcHNyNVdnRVgvYi9oQXRZUVRqd3JF?=
 =?utf-8?B?VWZLWEhtaDZZeVNTTEhWdGNubzZQUnZXaGkxZjVNckNQNERuaG1hOGI0SGZS?=
 =?utf-8?B?dTN1S25sYndQTHcyMW5vQzU4WExwaklqcWxFV3A2QU4zb01jWjBhSGFZd0NX?=
 =?utf-8?B?VFR0N2hPN3NuNHVQSWRaTjQ5VDMwdVFPMUVOUlpzSmlhV1d6bk9rRWVleVNl?=
 =?utf-8?B?eHhmeHdtcmM4VnREakJuZ2l0VEE4VDFVYjdQcEozZ2V4ZjVUMEE2cEVKQnVC?=
 =?utf-8?B?bGV1TmJqOGNQTmJkRkYyeWV1cUl3U1M1ZlpFSERRRmtST2RNT2x3MWhnOWxy?=
 =?utf-8?B?SHpZR0ZRWmM0RUtFZmczUGdKSldzS2J0bmlqZ3FrTDZiODJJWEVPSkorVlFa?=
 =?utf-8?B?dVJ6bVJhbmZMWWM2eUFJQXJQeTZlNDNWUGh0VlRISUhHU2M3SkZ0Wm9aRE5h?=
 =?utf-8?B?V2Vway9xV0h4OGtFb2JLem5aS2h1bUpHU0x2Q0pnVFB0NHZuQWpBandTY29Z?=
 =?utf-8?B?SjV0REgraUp1YVducngyVEFuSjRCVUNvaTEzSWc3d1VCN290OVJyQT09?=
X-Exchange-RoutingPolicyChecked: orOxCygikW3ykl1h840d9VGiEmVsUmcT9i2+lKNpmQkQeCv2/Xqx5MyGAMaoEBWQccTh7kI3SyeGIViU71zFLH3vrhLyHndzBfbPTVNoF8oVuepyl9vO/BDkBGKtE/40n4S8oq/nwkwrVr6BAltISJmJjaz7vd3HK+fNVPQ409F2ZHMmNVzVN6nwahwYvGrtmUAIDsQNv+6dP46V9QpDq0xgIeEslzsr0j4u+Ua1oZzPaxU0dbigpfTkknOl8LC/PUEKUZzAEl0xkPkhFrCertXptQN/Iw+A/kTTuCa/HM6JhNAizCUgaqo2bP3x3/mnJcFrPPIilE6yHwR9OnIL3g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b794050-5363-4d7c-7b6f-08dee3c384ba
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 05:23:22.3046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/ZT7qVcaFbWZxnO8cEYPRF+KV1xef5v+AptspKHF+h/7lR98ifPdiFO4subSjRQqY1ZwEvvDNnyegfuHhmlkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7429
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


On 16-07-2026 13:06, Soham Purkait wrote:
> Add a sysfs interface that reports the current GPU health state and
> lets admin users and management tools update it but is readable by all
> users. Requests are routed through the sysctrl mailbox. The interface
> is present only on platforms that support the GPU health indicator.
>
> The interface is a single read/write file at the device level:
>
>    $ cat /sys/.../device/gpu_health
>    ok
>
>    $ echo critical > /sys/.../device/gpu_health
>
>    $ cat /sys/.../device/gpu_health
>    critical
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Acked-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Pushed to drm-xe-next

Thank you for the patch.

-
Riana


> ---
> v9:
>   - Return only the current health state for sysfs read. (Andi, Rodrigo)
>   - Add documentation for sysfs interface. (Andi, Rodrigo, Anshuman)
>   - Make logs and structures consistent with their counterparts.
>     (Riana, Raag)
>   - Add correct KernelVersion and ABI Date. (Rodrigo, Raag)
>
> v10:
>   - Move enum xe_ras_health to xe_ras.c to match the
>     placement of the other internal enums. (Raag)
>
> v11:
>   - Rebased.
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-ras     |  30 ++++
>   Documentation/gpu/xe/xe_device.rst            |   7 +
>   drivers/gpu/drm/xe/xe_ras.c                   | 153 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras_types.h             |  41 +++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
>   5 files changed, 235 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-ras b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
> new file mode 100644
> index 000000000000..3870e5a03a92
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
> @@ -0,0 +1,30 @@
> +What:		/sys/bus/pci/drivers/xe/.../gpu_health
> +Date:		July 2026
> +KernelVersion:	7.3
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		This file exposes the current gpu health state and allows the gpu
> +		health state to be updated.
> +
> +		This sysfs file is present only on Intel Xe platforms that support
> +		the gpu health indicator interface for RAS. Reading the current
> +		health state is available to all users, while updating the health
> +		state is restricted to administrative users only.
> +
> +		Read returns a single line containing one of the valid values for
> +		the current gpu health state. Writing one of the valid values
> +		updates the current gpu health state.
> +
> +		The valid values for the gpu health state are:
> +
> +			ok
> +				The gpu is healthy and operating within normal
> +				parameters.
> +
> +			warning
> +				The gpu is experiencing minor issues but remains
> +				operational.
> +
> +			critical
> +				The gpu is in a critical state and may not be
> +				operational.
> diff --git a/Documentation/gpu/xe/xe_device.rst b/Documentation/gpu/xe/xe_device.rst
> index 39a937b97cd3..d3a022362ade 100644
> --- a/Documentation/gpu/xe/xe_device.rst
> +++ b/Documentation/gpu/xe/xe_device.rst
> @@ -8,3 +8,10 @@ Xe Device Wedging
>   
>   .. kernel-doc:: drivers/gpu/drm/xe/xe_device.c
>      :doc: Xe Device Wedging
> +
> +====================
> +GPU Health Indicator
> +====================
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_ras.c
> +   :doc: GPU Health Indicator
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 845b0e99754c..ed609912fda1 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -55,6 +55,14 @@ enum xe_ras_response_status {
>   	XE_RAS_STATUS_MAX
>   };
>   
> +/* GPU health values */
> +enum xe_ras_health {
> +	XE_RAS_HEALTH_OK = 0,
> +	XE_RAS_HEALTH_WARNING,
> +	XE_RAS_HEALTH_CRITICAL,
> +	XE_RAS_HEALTH_MAX
> +};
> +
>   static const char *const xe_ras_severities[] = {
>   	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
>   	[XE_RAS_SEV_CORRECTABLE]		= "Correctable Error",
> @@ -74,6 +82,13 @@ static const char *const xe_ras_components[] = {
>   };
>   static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>   
> +static const char * const gpu_health_states[] = {
> +	[XE_RAS_HEALTH_OK]		= "ok",
> +	[XE_RAS_HEALTH_WARNING]		= "warning",
> +	[XE_RAS_HEALTH_CRITICAL]	= "critical",
> +};
> +static_assert(ARRAY_SIZE(gpu_health_states) == XE_RAS_HEALTH_MAX);
> +
>   static u8 drm_to_xe_ras_severity(u8 severity)
>   {
>   	switch (severity) {
> @@ -446,6 +461,139 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
>   	return 0;
>   }
>   
> +static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct xe_ras_get_health_response response = {0};
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_get_health_request request = {0};
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	const char *health;
> +	size_t rlen;
> +	int ret;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_HEALTH,
> +				  &request, sizeof(request), &response, sizeof(response));
> +	guard(xe_pm_runtime)(xe);
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to get health %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected get health response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +	if (response.health >= XE_RAS_HEALTH_MAX) {
> +		xe_err(xe, "sysctrl: invalid health state %u\n",
> +		       response.health);
> +		return -EIO;
> +	}
> +
> +	health = gpu_health_states[response.health];
> +
> +	xe_dbg(xe, "[RAS]: get health: %s\n", health);
> +
> +	return sysfs_emit(buf, "%s\n", health);
> +}
> +
> +static ssize_t gpu_health_store(struct device *dev, struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	struct xe_ras_set_health_response response = {0};
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_set_health_request request = {0};
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	const char *health;
> +	size_t rlen;
> +	int state;
> +	int ret;
> +
> +	state = sysfs_match_string(gpu_health_states, buf);
> +	if (state < 0)
> +		return -EINVAL;
> +
> +	request.health = state;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_SET_HEALTH,
> +				  &request, sizeof(request), &response, sizeof(response));
> +	guard(xe_pm_runtime)(xe);
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to set health %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected set health response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +
> +	ret = ras_status_to_errno(response.status);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: set health command failed with status %#x\n",
> +		       response.status);
> +		return ret;
> +	}
> +
> +	if (response.health >= XE_RAS_HEALTH_MAX) {
> +		xe_err(xe, "sysctrl: invalid health state %u\n",
> +		       response.health);
> +		return -EIO;
> +	}
> +
> +	health = gpu_health_states[response.health];
> +
> +	xe_dbg(xe, "[RAS]: set health: %s\n", health);
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(gpu_health);
> +
> +static struct attribute *gpu_health_attrs[] = {
> +	&dev_attr_gpu_health.attr,
> +	NULL
> +};
> +
> +/**
> + * DOC: GPU Health Indicator
> + *
> + * On Intel Xe platforms that support the gpu health indicator interface,
> + * the driver exposes this sysfs attribute for in-band access to the gpu
> + * health state::
> + *
> + *     /sys/bus/pci/devices/<device>/gpu_health
> + *
> + * Reading the attribute is available to all users and returns a single
> + * line containing the current gpu health state, whereas writing is
> + * restricted to administrative users and updates the state to one of the
> + * valid values.
> + *
> + * Management tools and administrators use this interface to query the
> + * current gpu health state (e.g. for telemetry/monitoring) and to
> + * update it - for example, to mark the gpu as ``warning`` or ``critical``
> + * after diagnostics, or reset it back to ``ok`` once remediated.
> + *
> + * The valid values for the gpu health state are:
> + *
> + * - ``ok``
> + *     The gpu is healthy and operating within normal parameters.
> + *
> + * - ``warning``
> + *     The gpu is experiencing minor issues but remains operational.
> + *
> + * - ``critical``
> + *     The gpu is in a critical state and may not be operational.
> + *
> + * See Documentation/ABI/testing/sysfs-driver-intel-xe-ras for the ABI
> + * specification.
> + */
> +static const struct attribute_group gpu_health_group = {
> +	.attrs = gpu_health_attrs,
> +};
> +
>   /**
>    * xe_ras_init - Initialize Xe RAS
>    * @xe: xe device instance
> @@ -454,6 +602,8 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
>    */
>   void xe_ras_init(struct xe_device *xe)
>   {
> +	int ret;
> +
>   	if (!xe->info.has_drm_ras)
>   		return;
>   
> @@ -471,4 +621,7 @@ void xe_ras_init(struct xe_device *xe)
>   	 * causing the driver to enter survivability mode.
>   	 */
>   	xe_ras_process_errors(xe);
> +	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
> +	if (ret)
> +		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 8d344691b549..766b4b41768e 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -177,4 +177,45 @@ struct xe_ras_compute_error {
>   	u32 reserved[15];
>   } __packed;
>   
> +/**
> + * struct xe_ras_get_health_request - Request structure for obtaining gpu health
> + */
> +struct xe_ras_get_health_request {
> +	/** @reserved: Reserved for future use. */
> +	u32 reserved[2];
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_health_response - Response structure for obtaining gpu health
> + */
> +struct xe_ras_get_health_response {
> +	/** @health: gpu health value */
> +	u8 health;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_set_health_request - Request structure for setting gpu health
> + */
> +struct xe_ras_set_health_request {
> +	/** @health: gpu health value */
> +	u8 health;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_set_health_response - Response structure for setting gpu health
> + */
> +struct xe_ras_set_health_response {
> +	/** @status: Status of set health operation */
> +	u32 status;
> +	/** @health: Resulting gpu health value */
> +	u8 health;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +	/** @reserved1: Reserved for future use */
> +	u32 reserved1[2];
> +} __packed;
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index f12bc99ee31b..d0341538ad05 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -26,12 +26,16 @@ enum xe_sysctrl_group {
>    * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>    * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
> + * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
> + * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
>    */
>   enum xe_sysctrl_gfsp_cmd {
>   	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
>   	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
>   	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
> +	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
> +	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
>   };
>   
>   /**
