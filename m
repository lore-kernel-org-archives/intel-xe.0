Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62263606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 06:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lbelujoo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9D910E7C8;
	Thu, 29 Oct 2026 06:36:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8B410E7C8
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 06:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793255810; x=1824791810;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rioIzWq9fHaj3I3xVpvmWEc7Nimb7MKyHZNBPWAXmms=;
 b=lbelujooTod1/6iDPhCwXBZRgucDm9dxoR0orc1MFNy0OG9ncIZOhVCz
 cORBBx2mxhs20LczuxDSf2MAZIescnvwEvZbeT3tx6xRmIUvAQp0a/iQR
 y5Sy0mk/6t2+2CfzEgJcvgSqgg++2R6iHdsgtUDvf1fGXI+1S+RjDj6RZ
 b3YK07CitKQNO10LOpV0CMYesYbUaiSwYdL6C2EL9OH+ja9+m5qEjdttV
 E21xs+Q9LSZAaKroWlwJMly2bgv/Q315RVi3ogxGlLOYQ4h+T+OkIwuj2
 126tibuW77xOPOOn5vy6DA+/7CsshGG8ibPjBDbV0sQr/hVnNiEi6q2pD A==;
X-CSE-ConnectionGUID: qlNvFJOaREm6kCsdMU1udQ==
X-CSE-MsgGUID: lre37UtWSSm5lCUoNg4WIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1873665"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1873665"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 23:36:50 -0700
X-CSE-ConnectionGUID: yTumFhfLRqm9IMc5aZO9og==
X-CSE-MsgGUID: f9iuK7a0QgKKsrccd/i7eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5386198"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 23:36:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 23:36:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 23:36:49 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 23:36:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtq1e2i4LsumxvUp5lUIY12TuE9aXhkYR9Q2yfOxjnpsqmw2j2hvtNZ8CxN+HIv7sifNMKkadGM+ZneSuHqRID/Z1NWajJ9bHaZLIwviLq0y3eolx6GCnd8BMGxaE39W7PPUm7CaN5T3NhuNIoBg2BJQxiJgACPvw5gc83yxE99m3tzKTvAuY+fgCIawYZ6kBuTuz9MI3z5/wT8uT3XhaUj1qlLeJG+nw5SXt7sq/bXGxz30EPthuhB0pzlznvq3I1RsUpGgqyoccJK9cptupSiGwldajCpnrdEKh1u6K82qBleiLbeSKJbqzaZB0O4vmY9PDWz9gfB82fRChKJIKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=roJRGlksnf8cWb+z3CpPeBuceSZhQ5XKZIpLBElfVwc=;
 b=U9jhXS4PFIFFhlp59ckWr8UsesQk+Os8SMf7wIl2bb5QtnertHrBhOgZy+4ghsgCeh5LFKY7eD4U61sO1AGw/9BLorEy0wXVf0oppHZ8YbuyudMDkHDmv2bpWnXjYg4bnDsrg1/Y2lu/iKKziKXdVa7wpStcqi/BF27xzu6NLWRLdBwENE68/TVF0t2q9rrTHI0ykWnNpTdMser6yXhNg9jXFXAfoZRoIlFkoLS+NdPoF44xP0KY8QfOhZn9mgogRWsD/iDsjN6z+VEKHy5S33IEvRlfua3Lvg9DJ4UCDMG6WjLMbLfiAqIsdtm1hCraEBC9Z1Dic9RsA2xDvUz0kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 06:36:42 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 06:36:41 +0000
Message-ID: <2ba9e0c5-8555-4cd3-83db-6858c014c427@intel.com>
Date: Thu, 29 Oct 2026 12:06:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] drm/xe/xe_hw_error: Handle non-fatal errors routed
 via direct IRQ
To: "Tauro, Riana" <riana.tauro@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-15-riana.tauro@intel.com>
 <DS0PR11MB8718FF0E8B9E8E9D88D87E1981612@DS0PR11MB8718.namprd11.prod.outlook.com>
 <fd0b47b3-ab33-41e3-9182-ef114a1a2d99@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <fd0b47b3-ab33-41e3-9182-ef114a1a2d99@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::19) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|PH0PR11MB5160:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fe5371c-5268-4ffa-97a7-08df3586fd8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|261028144727099003|261022075727099003|260925022911599003|260925021311599003|260925021911599003|11063799006|56012099006|261009223027099003|261022113327099003|261026140227099003|261026121527099003|261021121427099003|261022105027099003|4143699003|10067099003|261021123027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: ZgPIcIR0FYyPWZjSK9Mp7cv3iKgC2l5KM8z8ZkReRsE/LoEqZWykcbiW8BX29Ren/urk64yUe8zIfPGjAew95Mav+qtBBpR6DhVKRkDmnPeP8IWaSGmkIkpj1tbxqt51OGi5zJWol2xemR7ELn5IpXd5drNWQcd0XLHd8XEVcrJwuITRv02EiDv0Jho0ULj8A6PmaxUQCHR6Sn0u70bNpOG3wDODGjW1YpHdH+Y72l1oQvzwH1XD9EE8e996SQde1TIdVN8XXCwQjjnIzBmHWCSLIosI3QofCIrNjteYA14xIqh4pIJyyzeF7AX5AfVv7CwQfxe7zW/noto8FjO+lqMTN3r39BZEreb6wXyPNocHK7YNsDH0iRPLg1dOHI1T9Em+7uGSrRkPVx6G+7YgGcnaNfmF/+910Cx3tRgERQetNtM0GWby3JzGGkaI7gfniYJTHMNFO172TdtqU0T050s/j0i3QRh11VNIOS/1OZamTpgPwcEoWF2lLFaAFuInLsbtyFwXLoOVNywfQnT0px97eedQCo91LSW975+sjvMQwqhrYpP7Nos/BcTPi6Iag462V2K54CFrdTyYj2g3oTd6TiTG6oHkWZLt8B2Fipvlng3HRTkYAqdWKSzOfN0cSrfc/oCSouTMu2hBa2zY14DZu+E5socdYK+Dv9HdfL0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261028144727099003)(261022075727099003)(260925022911599003)(260925021311599003)(260925021911599003)(11063799006)(56012099006)(261009223027099003)(261022113327099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022105027099003)(4143699003)(10067099003)(261021123027099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkpJNmFSVkV2UzNUeUtRTXdFS1ZPMkprTlhDNUhGbHp2M1pJZG54RTZmQ3N3?=
 =?utf-8?B?RC9EMzl0UTFNV0dvY29SbnIrN0ZRbm9YY3UySDVTRnIzWDZIOGxBcUdVaTBI?=
 =?utf-8?B?aUgyQUdVdlVzTXN0MkhmLzZwbks4bUN3eDZRSFhHby9jWExEajZGNk9rTDhx?=
 =?utf-8?B?L1RJTEwyWHU3QTNHd3ByVlZhNkdnY0hDaWQ1MWtjREpEZjdvS1VDNEVkMXBo?=
 =?utf-8?B?cE5pVS9CeFpVNzNSQldwN0NPN1lGaVJ3c3ZqQkFCTlVPUDkyQzY3Q3llby9q?=
 =?utf-8?B?TFVqeTkwbTRVN2JzMHVBMUowQWJaWVp4UUx5V1ZHckZkR3FTcTMrbEJzNHFE?=
 =?utf-8?B?QmZnUFhhUzFOZGNoVmJzZDFhOG1OUVEwaTU3ZndRVGNTbGM4eStLU29IY3My?=
 =?utf-8?B?UkE3MlZHY2orNzdwQWpoSHZxSnk0Tk1QWlY0enhPQkNaWFJtQWc0djJlU3or?=
 =?utf-8?B?azR1cVZGbTNFMThLczZNRVZveGFVQ1l5MktNZjVtSXdGS09LK2l4cXVkajB1?=
 =?utf-8?B?MDgzVkZPMWUvOVZoVlQ5ZTdQZEx5ekR3ZTl5RkxMemhWZ3I0QTZVaUFPQjlk?=
 =?utf-8?B?Z3hEYU9pczVZRCtsQXo0YzZ2MjV5andZR0h2K0d2akdUUDRlUWhyN0Y5eE5E?=
 =?utf-8?B?bVVJR3Z0TnIrNnlObUZmYWtsTm53L1JaSmFqRFVWR2czSzRmRUhqY3RVeWs3?=
 =?utf-8?B?aE5ZaHdreFhqdlpZelM0ZGJFeEZwZ3loOHVZM2JFRFRxcE1aT3dxanJ6VTRp?=
 =?utf-8?B?M1N3ek1LMkM3NnN2RVdSdEtpUk1wNVMzMGFNSEJhVS9MMjVmempZUmxMK3Bk?=
 =?utf-8?B?cCtQQkpDS1N4a29aVWJVMndqOGRBMkY0aDloUEVDMzFTYlArNEhnWHF5QzJm?=
 =?utf-8?B?RkpHQ051dC9yamFwYWVKUlk1eTB1YTZzeGpQMVRFb21uWWRJN0g1YkgrMHNm?=
 =?utf-8?B?MnVhczF6Mjk5V1FPMG8zY0ZnQXUxV242THRodFkxUkQyR0dpQXg5ZWl6ZVdS?=
 =?utf-8?B?UUhEVnk3dmdkRXI5Q1NmOW54eXZkTTdoTENKd3VBc2I1QzZHSUNIc0Q4T0tV?=
 =?utf-8?B?c2RrcE9Xb3JacUdqYzFJcldhM3FFNXdBcVdlSm12Y2MrcDNSY1hQeUtJck1R?=
 =?utf-8?B?ZHMxSmlKMTZub2VaZ1ZJd293bStDREVGZHRsRmtES1VJQjY4N2QrT0NvTis0?=
 =?utf-8?B?ZENFN3F4OW11YStiRkJsQXhPL0lRL0lpY1VaWDczbGZxbGp0RU5LYzBUSzV0?=
 =?utf-8?B?OFR3UHorWkNmNlNCTkEzLzJBOEhWekM2MnNSRTB2OENXa1AvdEVYdndPRGhD?=
 =?utf-8?B?Q3k2ZjNVVm8zSFpjRUFlVHZrNlcvd0pOVVdNR1k4akd0dXBjdXg2Sk1KenZX?=
 =?utf-8?B?K3BINUNFMU9rZDA4d2MxWXFHeS9QY3pydERiWWVzdXBoZUpvdnM0RlZyMGk1?=
 =?utf-8?B?aWxhUml2ck5JdTFCalhkVnpqNk1SbnNSWUYxU1ZYQUZOQzA1RnpYZWxRUlpl?=
 =?utf-8?B?c1lmN3pvMUhvcHFSQmErU1UrRTdHdzI0SXBGdnVnNE4ySFVCdzYxSFhHWjJi?=
 =?utf-8?B?L2RrOXZYc3V2clc0d2JYb1ZmeUpsNzk3SG5LUm4xSlFRdk93bmYrZFBzVU80?=
 =?utf-8?B?Rld1d3pIeW40ZzgwRUdhL1d6UllCMXo5RTZwbGlVSE45cDA1ZUxva3pjU2Z3?=
 =?utf-8?B?YnhQc0c4ZW1wbVpKMktUdXp2dm0vWWhxSU0yYXZmL1lFcE5XR2s1ZGtOZTF2?=
 =?utf-8?B?WUlRbkdDNXd5RzdldUl5ZGNxSE8rVjRWSTFpUGg1ZjdlK2l4UWpXZjdKR2VZ?=
 =?utf-8?B?RG1IS3hTRWl0ODhnRmdJc2M2bWVrL0hIV0Y0ZURaMk5SZWVGeDJPS0krWXpB?=
 =?utf-8?B?a1pPWFB1MzR0dkV1SVlLNFpUYk1DcGtFU1owbklLSUxNTnBvYmtNYVBEcitH?=
 =?utf-8?B?VG5nYkRzUFd5T2tUbHloRnZrY3FyemVHQ0UyZnRMWGk5TWZBY0h2WkN4RTFs?=
 =?utf-8?B?ZzF0dzRJaTVsQ1M5b1lQOVdHd05aZ3FvNk9RZnJnTjR6bTYyd3MzN0FOV1Rv?=
 =?utf-8?B?T003VGxUUmdUd3BsZzRLaWFCamF0ZzZpQ3JCZWt4ZHdwbERYR1cxTG9wZ0E0?=
 =?utf-8?B?Q0NkTEJKc1U5YWtibmNlNm9mR2ZXc1FFV1Y1UXMzMVlldGUwQ0k5WW41dHdF?=
 =?utf-8?B?dGEweW04S3dJMjYxWEZXQnE2bVVpd3VmTExxcEdBNVB4a0toaW9tbnZ6cXkr?=
 =?utf-8?B?TU82UWNkMURuMWRrWVhac0VZMUhHVDN3Z3RFS2NTRUlFMFVIbWQ2cGxqWDhF?=
 =?utf-8?B?dUV5Z3VYUFNVZzVuQ2dMdlAwWEFpK01MNmpmV2JkQUNkcFYxMy9QTzlnOExp?=
 =?utf-8?Q?OzcTlQNM/sh4IChY=3D?=
X-Exchange-RoutingPolicyChecked: Y0yBm9Tf7BUw3f5uchZSJflPgCowmWAUXtZWp3V8yrMZZbaELZ126jOuTQkvqarWomavHwu9gpnUeTdmMXe7M9PHGDJY7lpG+2LHfHXWxA+P4UE4+xEv7SzY5gu8z9/sKtCkMCymIudT3pbjQSiMCeCPFxzJyLyAHniY3/asH/TOsQTdp+lX3zbKeX15d2PN54DnHYKEUBZDlgULP7m64vQQePiIpXeR+XQxUyAxrs49t/5Kq6lYtqLkMyLHULHVa+dRhQ8qtcyzr52CiHRWcgF1f1wf6vqgcHhTcaioqyFDs4I5QCC3YNr2sZUMVePBLAEiQKY/riQqaw2u3h8CGg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe5371c-5268-4ffa-97a7-08df3586fd8f
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 06:36:41.0212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xD2edxVleuNorvQcw1T6j4lgalNrMYNHDlc/rdCF/vXIkKim14w3XcuE3ZvCzrT4ospkN6uQGfT8meok9ijowlZ1KgjQeMmuzwgzpOkP9Jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5160
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 26-10-2026 07:38 pm, Tauro, Riana wrote:
>
> On 26-10-2026 16:19, Upadhyay, Tejas wrote:
>>
>>> -----Original Message-----
>>> From: Tauro, Riana <riana.tauro@intel.com>
>>> Sent: 26 October 2026 11:35
>>> To: intel-xe@lists.freedesktop.org
>>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>>> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>>> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
>>> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
>>> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; 
>>> Koujalagi,
>>> Mallesh <mallesh.koujalagi@intel.com>; Upadhyay, Tejas
>>> <tejas.upadhyay@intel.com>
>>> Subject: [PATCH v2 4/9] drm/xe/xe_hw_error: Handle non-fatal errors 
>>> routed
>>> via direct IRQ
>>>
>>> Process, log and recover non-fatal errors routed via direct IRQ.
>>> Double-bit ecc errors belong to non-fatal error category and are 
>>> reported via
>>> irq. For pages that belong to critical BO, wedge the device with 
>>> bus-reset as
>>> the recovery action.
>>>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_hw_error.c | 37
>>> ++++++++++++++++++++++++++++----
>>>   drivers/gpu/drm/xe/xe_ras.c      |  9 +++++++-
>>>   2 files changed, 41 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c
>>> b/drivers/gpu/drm/xe/xe_hw_error.c
>>> index f7799c3c08aa..269ce6a19a80 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>>> @@ -5,6 +5,8 @@
>>>
>>>   #include <linux/bitmap.h>
>>>
>>> +#include <generated/xe_device_wa_oob.h>
>>> +
>>>   #include "regs/xe_gsc_regs.h"
>>>   #include "regs/xe_hw_error_regs.h"
>>>   #include "regs/xe_irq_regs.h"
>>> @@ -15,7 +17,9 @@
>>>   #include "xe_hw_error.h"
>>>   #include "xe_mmio.h"
>>>   #include "xe_pm.h"
>>> +#include "xe_ras.h"
>>>   #include "xe_survivability_mode.h"
>>> +#include "xe_wa.h"
>>>
>>>   #define GT_HW_ERROR_MAX_ERR_BITS        16
>>>   #define HEC_UNCORR_FW_ERR_BITS            4
>>> @@ -166,12 +170,36 @@
>>> static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) ==
>>> XE_RAS_REG_SIZE);
>>>
>>> pvc_master_local_fatal_err_reg : \
>>>
>>> pvc_master_local_nonfatal_err_reg)
>>>
>>> +static const char *hw_err_to_str(const enum hardware_error hw_err) {
>>> +    switch (hw_err) {
>>> +    case HARDWARE_ERROR_CORRECTABLE:
>>> +        return "Correctable";
>>> +    case HARDWARE_ERROR_NONFATAL:
>>> +        return "Non-Fatal";
>>> +    case HARDWARE_ERROR_FATAL:
>>> +        return "Fatal";
>>> +    default:
>>> +        return "Unknown";
>>> +    }
>>> +}
>>> +
>>>   static void hw_error_work(struct work_struct *work)  {
>>>       struct xe_tile *tile = container_of(work, typeof(*tile),
>>> hw_error_work.work);
>>>       struct xe_device *xe = tile_to_xe(tile);
>>>
>>>       guard(xe_pm_runtime)(xe);
>>> +
>>> +    if (xe->info.has_sysctrl && XE_DEVICE_WA(xe, 14028434957)) {
>> I think you should have all these in 1 patch for 14028434957
>
> I can combine 3 and 4.  If i combine all usages, it would be difficult 
> to review.
>
> Thanks
> Riana
>
>>
>> Tejas
>>> +        /* If the device is in reset in AER path, skip processing
>>> hardware errors */
>>> +        if (xe_device_is_in_reset(xe))
>>> +            return;
>>> +
>>> +        xe_ras_process_errors(xe);
>>> +        return;
>>> +    }
>>> +
>>>       xe_survivability_mode_runtime_enable(xe);
>>>   }
>>>
>>> @@ -433,12 +461,13 @@ static void hw_error_source_handler(struct 
>>> xe_tile
>>> *tile, const enum hardware_er
>>>           return;
>>>
>>>       /*
>>> -     * Hardware errors are reported through System Controller on the
>>> platforms that
>>> -     * support it, and never routed as direct IRQ to SGUnit. So we 
>>> should
>>> never be
>>> -     * here for those platforms.
>>> +     * Non fatal errors are routed as a direct IRQ on platforms 
>>> that support
>>> +     * system controller.
>>>        */
>>>       if (xe->info.has_sysctrl) {
>>> -        drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error
>>> routing\n");
>>> +        drm_err_ratelimited(&xe->drm, HW_ERR "%s %s reported\n",
>>> hw_err_to_str(hw_err),
>>> +                    severity_str);
>>> +        schedule_delayed_work(&tile->hw_error_work,
>>> +msecs_to_jiffies(MSEC_PER_SEC));

hmm, why we are scheduling hw_error_work worker after 1 sec, if we get 
AER before and after 1 sec, what is impact?

Thanks,

-/Mallesh

>>>           return;
>>>       }
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c 
>>> b/drivers/gpu/drm/xe/xe_ras.c index
>>> db3cbc186a51..e6a0ee468b17 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>> @@ -628,8 +628,15 @@ static u8 handle_device_memory_errors(struct
>>> xe_device *xe, struct xe_ras_error_
>>>           break;
>>>       case XE_RAS_MEMORY_DB_ECC:
>>>           ret = handle_page_offline(xe, info->sw_address, true);
>>> -        if (ret)
>>> +        /*
>>> +         * Double-bit ECC errors are non-fatal errors and are reported
>>> via IRQ.
>>> +         * Wedge the device with a bus reset for errors that require
>>> SBR to recover.
>>> +         * TODO: Trigger SBR using pci_reset_bus
>>> +         */
>>> +        if (ret) {
>>> +            xe_wedge_declare(xe,
>>> DRM_WEDGE_RECOVERY_BUS_RESET);
>>>               return XE_RAS_RECOVERY_ACTION_RESET;
>>> +        }
>>>           break;
>>>       default:
>>>           return XE_RAS_RECOVERY_ACTION_RESET;
>>> -- 
>>> 2.47.1
