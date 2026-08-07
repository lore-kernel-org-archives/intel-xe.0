Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EE9C5AC7A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 11:20:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8994610F473;
	Fri,  7 Aug 2026 11:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TPrG9zHG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD2410F473
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 11:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786101643; x=1817637643;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hbUZDcYyhDY1NXhc2OuRZ52eX+C3yyyCd+yoKWPGf5w=;
 b=TPrG9zHGOPwggNDY1ubMU8BlhrxVPLuHWleGJUHU5CMhZQPg67giXrSu
 dAp55/hMFrqS+UtpydH+x4KVdNNdvex4ITHoH+sD01kZyra47cFEcD7pb
 4JNH3rXf2onr0PxPUcqcWkfSu9VsxLGpPztdfxP93YBqIW3Xh4Jjotvyf
 4Ua4DoKXK4j7sRRZtlPHmv/5ngqx/lxZzZ7N3fsfdtxmtPFWBZs8JCqvJ
 //7p/mo+KUIc7gU/RApweYw0AZmSBiRxBEizBdKNrhcYrTM/luH5fgltP
 BymWJjyLtGrnBpjC8si4puHLt5hGNQg397wJNaQfmcP1FCR2Gw+GhEj9B A==;
X-CSE-ConnectionGUID: pQS+eu5bSFmZlOlYg3MOew==
X-CSE-MsgGUID: mnvEPx0YQXGoJnYjNv60+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="90524436"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="90524436"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 04:20:43 -0700
X-CSE-ConnectionGUID: dw9nl3KSTX2zZ5rwqEehaQ==
X-CSE-MsgGUID: Wk/cTe1iR2CdTPTMNKFNEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="265843384"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 04:20:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 04:20:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 04:20:42 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 04:20:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJqE9hDZ2/JkwPFTU311E1JoQLbak/hPWghu4tmGjCq4AB8SITjVbbV3fkJ7YfdypBSlKQlheafeHnnwNJ9YieHEcuBFgzVVqgt7sMIeNsYelT3D6T12IG4EOEXRTK3AoDTPnjb+y3TNWQcNJD9E7Vd9DrcEJpZDHI2dcfU9og6wYmrlRLnXp9TicaDJvlb789XpRQMV6I7AwsvX+CHBaqejWHpsfsesic4gwXSyctSzGPWqEN6b0O6HQWYNXBPR11IURJfolR1i7/kd6WJhTOh/L3Rmre4anqi3vKl0arDxqcuVwyZRtvvrKJKGffPeIdaPeG6rxrWTNjYFzkqhzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCbsU8nD6+uzzztCWO644gyhVbtyW2CzZHWC/N2Zwm4=;
 b=WhMN6I7mVD06GkP5qK730c7zL6se/VJaF5WuP6Vw8ZIAWXCBXTQy8aFt/Rqk+mwau59SC/ArtvusYCPYBxEcSvaQS29AFz1GnO6AtaojROWQyowhRIajK7bWNINVggmg/ZhgvW5gWNNqvHiQISIBtOM0mcZKJ2UmYqeanySY0Osh434iL3x/JYoAaxZ6rFfSuEkLGP06Od2yiszWH1sjKW1OC0JLlotxdAcXVx09Y0banYTJV1L63ECAZ67U5xNu5kCg6ogT86hqCuutnhIZalcBasEOcYs3F9ra2zFLklSh5B/7iL/p93I+7fAxcyhU4BLkhWU+8bNqELm2Y9hZhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SA1PR11MB9660.namprd11.prod.outlook.com (2603:10b6:806:4df::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 11:20:40 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 11:20:39 +0000
Message-ID: <3d95db1f-4d99-4022-bb61-e25dba8fd1e8@intel.com>
Date: Fri, 7 Aug 2026 16:50:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/hwmon: handle CRI+ power interval encoding
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>
References: <20260703153320.1368225-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260703153320.1368225-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0249.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::15) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SA1PR11MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: 61b9b4ce-a17c-4b57-e259-08def475e968
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: MZoKbe9Qb4toJxRG5W7PTLw15GhqVNh0Z2E79hNLKg+ADAgyS1WZxST+EmXSyJgaS1bIJfZSMj+eVNqEcKXUZTlVGpAQJJpKLEn5+/kZVvH7c25Hw91ry/6v96h4HevxUaLftp1/WwXr7auQeiHFzEAh9RmOWC0nETiMmRjE5UsCVWRNLHHPO0UutYQsGHlcmv08fiJ5pRuCUZUVLXognZ2WkoWIcWggzAeYyQjJwYmAMLP19FbqbXeAAC4wBw9htEKT71+buw7riFUJqGgpA1CtXqqdZYW+1kovF4CQvamfqTjuzcggwAeXrVjZYy4U6R78B9f3bQHmyWSF55Vpj4sc4bBu4AwvgBLsCZ/iBSGUvKpTbKChgD+dOSj0fqd6NcQYbVtSl7tk2XYqcOuqVIoLvnf6Y4iwk/QxsYwLJy/N/0wEAE0j+jzWEC3JSd8QFctPe+LwUJauXtU8f+m3ZUHc4ddUbyNTDCXul0Wk8wg1+PjB+/sd88zPT4Q9obD2swA19nDre5xNAsZpZsIWudwptV8OAOc14GfzbWUnidH8bvdOL/KF/JqeYtB5OvBlIxPrtRY/pp5RewuSN4ThLY479ijVaVRkVcjIQI3yweLUI3Qv2sIH98Df9XJshq8xF+923y2Xg/sFR4yyTRaPeI+ONa54vAGSlKTNqqi9LEw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVZvVUFNSlkrYk9ITTRlYllBNlFXdEFURkd4RzByZGovRTdkRngzbEoxT1Nl?=
 =?utf-8?B?L2J2eHdhQVdRWTdlZEF6NUY1LzRnUkFtVHByS3lIUUFmWHFrRC9Xb3NsT0ls?=
 =?utf-8?B?ZTlqczBCRkdXZnVyUS9JaE5GTHd0Qjd6M2tzQ3Z4cGVsUm1pNHhWRHdrTEpr?=
 =?utf-8?B?bjRnSUQ3WmxRWVFWOXU3YTlyWnM1dHo4d2JuaTVmN1FtbVJhOTFDRnNhTWty?=
 =?utf-8?B?MHVPUGM4K3lyVlZQc2ppZTA4NVJDMDNGeDlic3pKdG8wOXdFTkx6S00rSThN?=
 =?utf-8?B?WFFOYkx6c21XejVOZlNCMmJMd1QwTktQMWx0Z010ZmpRQUJrUUM3Z2l1bmsz?=
 =?utf-8?B?NEJQR1VYZVAxSjZOb2FzQnd4TVZ5ajVEaXNYWGZ3b1pvYndUaFd3QlNRZml4?=
 =?utf-8?B?VnpieEZuQXhNdlBIS1RNTHJQejAyYUxpbGVGMXFoQ1ZlNzZYNXpZLzNYbnFF?=
 =?utf-8?B?Mk4waVZzVWQ3QlorTnBSYXA5L05Qd0dwQjBnUzFNQWcxTEhRbXk2enFQdUJw?=
 =?utf-8?B?YWc2UUY3d2tZVUtKMENxZmFGWXJDRG1LRHN4NzJ3OFJjdGVoWXYvQzhUcG9q?=
 =?utf-8?B?N1BGR2VWSWlZdW05M0JoQ0M3eTY0VlhWZjZYbTJxRGpYOFhRWDhjd1hxT2RI?=
 =?utf-8?B?L1QxbGU2UzBpTjdxV29FdmtBZ2UxbW1Uc3d2MVkyN01wTkdmNGUvTWc2Mldk?=
 =?utf-8?B?VlhNVjNRZnN1ckVod1VHTzV0Q0NKSFdEYys1QXFISWNsKyttUk9zRW9vb3RS?=
 =?utf-8?B?Z1V1cVFKbWRkeFprUFA1UjhpVzd6Q2d2TGdpaVJYdDZCTUV6TTVwQjhSQzU0?=
 =?utf-8?B?WEpveGpZNVdSZTJpYW9Yd2N3RlZtUENnbkpqc0xzdkVxMm5Bak90Njlsc2ZX?=
 =?utf-8?B?dDYwYnBNQjlXUzQ4S0hTT3FPU3o2VTRaaFVqR3dLbmRtSjJGTVRIeVhJRW9P?=
 =?utf-8?B?dUxWUUhWV25lMzh4NlNXcTNWVTNPRm9rTnZwbmFDWGJpSHBEUGhzT3MvSEJR?=
 =?utf-8?B?S2ZqRWtZcGFsa0cxbXBLWHJJcUlkS0JCb3BDMFhwV0xNb2p4ZWc2UUx4MzlJ?=
 =?utf-8?B?TXh2MGhZTHFpMjFxTVVTZ1VzaXRSN01UVnNQNWhCTU9CZnFtdXpURllHZTFp?=
 =?utf-8?B?OW93SzZXNmpjcVZzNElrSFpGUDhROGxBeXl4VEZCejJadkg1aDF2ajFPMVdQ?=
 =?utf-8?B?RVd0MktzYXdIamJGWVErNldPSzdKZHRHcEpRaW45V01FTmU3VmFsM3R1bW9Z?=
 =?utf-8?B?Ty9uMmJxSzZiNHNWdUdKVDdUUG1kdHI2M1F4T3M1dm1zNE0rM0l5ZjF5RkhV?=
 =?utf-8?B?VVlCUHNGL3ZaS1RRZGpzdDY3TWtFMkMrWkQzZTlWeWRiYm1YR1pJT2xVOUJv?=
 =?utf-8?B?MlFTeG1QNzlLRmQ2N2p0MXdPMjdpZXRmMHdib0VTbFlqWGN4QUZKeEJQd2dn?=
 =?utf-8?B?elBEcGQ4ajVvUDA5THFEbTZENlR5MmRTdGRWd2I2VHJ5RW9QdXpENThSNytC?=
 =?utf-8?B?RWt0NEpPS0MweE5kZ1VJVTJUL2FtQlBCK1Z5bHBuQkpXMTJPVG1WZU5EY1Fu?=
 =?utf-8?B?aU40eHJNRTk4amg1V29vc1JTTlRGSytpY1pFRVU5ZFphQ29KOXBOYlVpTzNU?=
 =?utf-8?B?TGN1Q2tMRTNkdUFXWmZLVU5CTkFOejBPZUg5VUg5M0VKOWMxUWJzeThDUmo2?=
 =?utf-8?B?ZXZPd1F0UFFxcEhuOXAxZ055ZDB1L2xNYVhsdlUva1M0VW9RNTFPWjdFdElu?=
 =?utf-8?B?bmphZFhHZmdlbHRhRTc3aTA2MlpFQUUwK0RIN0kxTkFlNTlGbXA5OGlnYUJW?=
 =?utf-8?B?MVZNUDZiT3ZidlVJK2ZwUXFScHhyZWs0V245eFdKazFjOHBSSHJvaWxxcmFm?=
 =?utf-8?B?dVg1V1Q5TGF2UjZTWThhaGhTeWpObzJMNTEwSmxmLytvQTNHRlMxNk95bldy?=
 =?utf-8?B?amlsZ1g3VEEzLy85Slh1Tklhem9TOWRKTDNUU0xhamtXZU1DejYyMEY4YlpB?=
 =?utf-8?B?TllNcndWQ0hJV2p2NGFsMEN4bGcwd252UlZOa2J1MjFLU3kza3VoTWRZcjhr?=
 =?utf-8?B?OG1ZRzFJV2grUXdQNE9ISHdkZ1B4aE9sTi9BRU90Z2xLWnQ0bXpHdTZEZGF3?=
 =?utf-8?B?Y0VDZS91Yi9jOStIajVFK1cvMlhCVllVZlM2eVdUdWRUdXVVSmM5TVVMSnE1?=
 =?utf-8?B?TFJjeEZ6MjJEZExxQUFZaWIzMWZ1elpqSkhQZS80RW1Rc3kxY0ZpQklVZUQ5?=
 =?utf-8?B?VEVyRVk1a3RhNDNUdVhYbWF0ZHJuWHVLcXphenBIWUpiQjFubUkyZmdLVldG?=
 =?utf-8?B?ZklDL09mVUVsYXZ6bFI5V01jenQzZHhWeXhHRktTSG5CSWZoMjNCUT09?=
X-Exchange-RoutingPolicyChecked: pHNf8mM7gYNOosSV6/JK97hy6ion32vYlPIAOMIADVXkMhfFNCWgHVEmsAOWEx+tpuUSK3wPe+P7rugtSMLbcbJ1GatvwpQpT9DU3DehWlBTLl8rFDizLYOmhAXrBuPaNDTLFWg9AeSBHw8fyPF/zczhSHmm4+QyBqyMl2ajsHlTczXouVDvU7L5ip+O9vHD34ytQafCLaqfSO+Mh8sRtTBk73wZRnhZTW4VTY+Ex5C2sFGwoByaMnGgdGVMKLRzDfV8KTxUemVF4BT1KOYJHjHFm/amQ/Vnpqv5NaA9ZyO8h8+1cdR1YRNAsq1uWE4thCqRQOr+IZh3XO3qi6JMDw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b9b4ce-a17c-4b57-e259-08def475e968
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 11:20:39.8196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HSb91FcsSipflJ+cvCeWAjzLChkKtwRSXfSUNFUj2ylSf0uJ7gqrx0PcFxcIWr8E0ODwV4iYGFf6+jhsvXasXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9660
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


On 03-07-2026 21:03, Karthik Poosa wrote:
> On CRI and newer platforms, the power-limit interval encoding is changed
> from the legacy 1.x * 2^y format to a U5.2 value in milliseconds.
> Update the interval calculation accordingly for CRI and future platforms.
>
> v2: Round the fractional bit to 1 for values greater than 0.5 ms in the
>      show path, as the minimum supported time is 1 ms.
>      No special handling is needed in the store path since sysfs inputs are
>      only in milliseconds. (Badal)
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 86 ++++++++++++++++++++++-------------
>   1 file changed, 55 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index de3f2aeffc3f..49f7e0edcc4b 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -575,23 +575,36 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
>   
>   	mutex_unlock(&hwmon->hwmon_lock);
>   
> -	x = REG_FIELD_GET(PWR_LIM_TIME_X, reg_val);
> -	y = REG_FIELD_GET(PWR_LIM_TIME_Y, reg_val);
> +	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
> +		/**
> +		 * On CRI and newer platforms, the interval encoding changed.
> +		 * The value is now stored directly in milliseconds as U5.2,
> +		 * replacing the older 1.x * 2^y representation.
> +		 * Bits [6:2] hold the integer part and bits [1:0] the fraction,
> +		 * so convert to milliseconds by extracting integer/fractional parts.
> +		 * Round fraction value to 1 when it is >= 0.5.
> +		 */
> +		reg_val = REG_FIELD_GET(PWR_LIM_TIME, reg_val);
> +		out = (u64)((reg_val >> 2) + ((reg_val & 0x3) >= 2));
> +	} else {
> +		x = REG_FIELD_GET(PWR_LIM_TIME_X, reg_val);
> +		y = REG_FIELD_GET(PWR_LIM_TIME_Y, reg_val);
>   
> -	/*
> -	 * tau = (1 + (x / 4)) * power(2,y), x = bits(23:22), y = bits(21:17)
> -	 *     = (4 | x) << (y - 2)
> -	 *
> -	 * Here (y - 2) ensures a 1.x fixed point representation of 1.x
> -	 * As x is 2 bits so 1.x can be 1.0, 1.25, 1.50, 1.75
> -	 *
> -	 * As y can be < 2, we compute tau4 = (4 | x) << y
> -	 * and then add 2 when doing the final right shift to account for units
> -	 */
> -	tau4 = (u64)((1 << x_w) | x) << y;
> +		/*
> +		 * tau = (1 + (x / 4)) * power(2,y), x = bits(23:22), y = bits(21:17)
> +		 *     = (4 | x) << (y - 2)
> +		 *
> +		 * Here (y - 2) ensures a 1.x fixed point representation of 1.x
> +		 * As x is 2 bits so 1.x can be 1.0, 1.25, 1.50, 1.75
> +		 *
> +		 * As y can be < 2, we compute tau4 = (4 | x) << y
> +		 * and then add 2 when doing the final right shift to account for units
> +		 */
> +		tau4 = (u64)((1 << x_w) | x) << y;
>   
> -	/* val in hwmon interface units (millisec) */
> -	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
> +		/* val in hwmon interface units (millisec) */
> +		out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
> +	}
>   
>   	return sysfs_emit(buf, "%llu\n", out);
>   }
> @@ -637,24 +650,35 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>   	if (val > max_win)
>   		return -EINVAL;
>   
> -	/* val in hw units */
> -	val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME) + 1;
> -
> -	/*
> -	 * Convert val to 1.x * power(2,y)
> -	 * y = ilog2(val)
> -	 * x = (val - (1 << y)) >> (y - 2)
> -	 */
> -	if (!val) {
> -		y = 0;
> -		x = 0;
> +	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
> +		/**
> +		 * On CRI and newer platforms, the interval encoding changed.
> +		 * The value is now stored directly in milliseconds as U5.2,
> +		 * replacing the older 1.x * 2^y representation.
> +		 * Bits [6:2] hold the integer part and bits [1:0] the fraction,so
> +		 * convert from milliseconds by shifting the value left by 2 to fit into the field.
> +		 */
> +		rxy = REG_FIELD_PREP(PWR_LIM_TIME, (val << 2));
>   	} else {
> -		y = ilog2(val);
> -		x = (val - (1ul << y)) << x_w >> y;
> -	}
> +		/* val in hw units */
> +		val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME) + 1;
> +
> +		/*
> +		 * Convert val to 1.x * power(2,y)
> +		 * y = ilog2(val)
> +		 * x = (val - (1 << y)) >> (y - 2)
> +		 */
> +		if (!val) {
> +			y = 0;
> +			x = 0;
> +		} else {
> +			y = ilog2(val);
> +			x = (val - (1ul << y)) << x_w >> y;
> +		}
>   
> -	rxy = REG_FIELD_PREP(PWR_LIM_TIME_X, x) |
> -			       REG_FIELD_PREP(PWR_LIM_TIME_Y, y);
> +		rxy = REG_FIELD_PREP(PWR_LIM_TIME_X, x) |
> +				       REG_FIELD_PREP(PWR_LIM_TIME_Y, y);
> +	}
>   
>   	guard(xe_pm_runtime)(hwmon->xe);
>   
