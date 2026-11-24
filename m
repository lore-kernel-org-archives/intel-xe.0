Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C05D606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QKm8WE5E;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Tc6pSPAB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA4610F3AE;
	Tue, 24 Nov 2026 09:11:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA4810F3AE
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 09:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795511485; x=1827047485;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=GWY8T8rguVfyUOJZ/k2YW1grggikS4NAGVmU1cTvfaE=;
 b=QKm8WE5E7sWZnSQO6EIc2Fxrz52qDUCNADSxlWyPyQWM42c+H0C57EEz
 Dk/JSJ4a0QsqV347B6dPVyLe5H+30OhHErzHZzwftHoqJk59QPtmJQKFj
 PtYJPmNgrfVvmyIVFKOK53qxPN3X1xNMoEALXzxeZq/clvXzRnG2zgouH
 oAl9jAf35Cj6fNDX+T3lBYsgGm0d8z6XiUtPMHSz+EjSzD8r9y2WtZHEu
 ADAl2HtW1gEWkGJJfYPxgVUGzj469gmT/wEtbuNmkxtGN6U0EfJ0gah45
 GgqPl6xChONPN8DAeYKNZ7OBHOxDa2ua79p8b1kjEQHvkfGBn+/bQaro9 w==;
X-CSE-ConnectionGUID: a0Aywi5gQJSV1p3pgdgLGA==
X-CSE-MsgGUID: iwAqDJhTQ4ep5F3wboi2CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4380138"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208,217";a="4380138"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 01:03:20 -0800
X-CSE-ConnectionGUID: U45o/LioTaOU8fcFXAwuOg==
X-CSE-MsgGUID: 0x/ibs1gQ4SRrE1RAeMi1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208,217";a="11493798"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 01:03:20 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 01:03:19 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 01:03:19 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.41) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 01:03:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hETtcZy717UfbpDjJlAiI0/F238gXAUOjPVkj3UQfrKrAMGebdIEFeza6/V2zRsc2ccmMKg5SLz8bV0cryHtMg7pr1801X2VzaGpSWgv+7PCULXl49CRQ9DnvtGQlw/2D76fC3ffedbieVysaqMIwCb+AvKq2fmJFNDfbWjVs7zEuM4ff2ACGCOj/JKQbxG6V6CtohiRqnF9m1lIlRgnicDv1Xe2JiL/IoEkbOEczv42r6r9mF0u+xuLDrn4AXeAVlr71YOSgW/kzSjsuW7TEHAPebrIbWiV69BYIH94nuXh1kk0CT3+eulNFTPizY7RicKv5Mfzf9EUv6Jua8duJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUx0tW4/vIMvPob89+z0ugonfNsGzhULyLqljRhcOcI=;
 b=Rd2xnmy75s2qJgvKL8qr+cwmgQTAA2hkgTvY8df+MZvJJRPfWccRhIBkcbs/PKP9+o5e0z2xoFynspJApcYPzr/UIvr0j6kx9c7zhK4ZQwKKaWAK354wORaLLI9Svkb1lWOKF42Wst8qTQ5ixnUU/nOwZKHf0+0ByiA2ts+CC/gXidQzug9Jhpc7vYNZO9UlkxIGzIewnIXEwuBUWmxxxWrTw6tJ7VRBZ9ZBp2oGmbpY4AfYTBWUlfaA901o+yc+dcTHSzF4EBxegWXkuY6BGn3GABOaKqFKCErvwmJiiamoYbnPNP2RjVd5e0gZnjXN2UiFjWEjh+Z/r0gNqUjhmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUx0tW4/vIMvPob89+z0ugonfNsGzhULyLqljRhcOcI=;
 b=Tc6pSPABqNXWhDj8oTQMnjA9znfjLQMLuVftQUt76hugim1nMrPbmkrWz4YDlRsV5ISSwmFazSuc9I2GzxS28jaYHRgOPi+M3HmsZvCkp60JOXceKLFIxzMUZk2IXdeNVBjqFInPLlPvz1F7/tuJ97LiJQz+n5r+lYl/UxTMisY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6468.namprd11.prod.outlook.com (2603:10b6:208:3a4::18)
 by IA3PR11MB589729.namprd11.prod.outlook.com (2603:10b6:208:620::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Tue, 24 Nov
 2026 09:03:17 +0000
Received: from IA1PR11MB6468.namprd11.prod.outlook.com
 ([fe80::c69b:dedf:a089:33e5]) by IA1PR11MB6468.namprd11.prod.outlook.com
 ([fe80::c69b:dedf:a089:33e5%5]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 09:03:17 +0000
Content-Type: multipart/alternative;
 boundary="------------TJnBSWL2w8ATYC6sB4exXtMo"
Message-ID: <97b82120-0008-4d9f-b4a2-05359f9e5c08@intel.com>
Date: Tue, 24 Nov 2026 14:33:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] drm/xe/guc: Initialize GuC doorbells manager
 according to device mode
To: <intel-xe@lists.freedesktop.org>
References: <20261026104224.1018993-1-piotr.piorkowski@intel.com>
 <20261026104224.1018993-4-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20261026104224.1018993-4-piotr.piorkowski@intel.com>
X-ClientProxiedBy: MA5P287CA0119.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::16) To IA1PR11MB6468.namprd11.prod.outlook.com
 (2603:10b6:208:3a4::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6468:EE_|IA3PR11MB589729:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc76e28-c9dd-4f85-6c51-08df4a09c78e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|261026140227099003|261102123227099003|4143699003|261022105027099003|11063799006|261021121427099003|56012099006|261009223027099003|261026121527099003|261028144727099003|261021123027099003|10067099003|22082099003|18002099003|6133799003|8096899003;
X-Microsoft-Antispam-Message-Info: tSWBA5aSmlwrc5hhWJQ6xLW0Kwx7sBHorA8NHlKW8qhV2yZR0QwBpUT1+KCox4kj6MNBLP5fu80/w5k6cQ/be8oIaXB0bSbtvAAcDZSKlDl3dp9RlEY9wkubkNb+iFXCma2SkAsCkgSS+1BQEOaOPlEAGBQnXm5Yas759LTF3fY8w/eRFtEwPTiqh4OK5aiERyKpOptkqYOlcSDQeShaxBS1mrAb8p6q495P6sMuNUxrMTd6a30DA7jqnNHTSvmwH16iSc41LaDJbY9T9wDTTm1hVWBWxJko0E0sXhQv9ERYDUpXoZQUelPc66/eUvYNtOF65REw/fKpwM3bOMC6sK33rS8rvt3D+li2/zZCkUJZ0zCAqTjl8g3snzTi4rFi2HrKtPKVSG5UXXLQLyk51wV978hx00tvXOpstN7/0fsMO5XcT3Q0az0vq/WEYRQ7BBF9k3V3H45359jQSsrkPHx6bSgPOUc253JusH81mmHyvxA1gahaqbW9yt9pjMa7v25hIepAgsW/SwKPW21PbasPFWR7Cv+9/yNr5rEHp3y6NLYbqrvG1ujTM6TmrFaNLwDnOMCy2H952QscOhAgJofclhjNh1q2CG7sMYaLG2mE555vnfKlAeRy3DzvZF6DPPhVc+mtnNv52acwtfSRBB0+1W7IisxDIopjzex6eBs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6468.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(261026140227099003)(261102123227099003)(4143699003)(261022105027099003)(11063799006)(261021121427099003)(56012099006)(261009223027099003)(261026121527099003)(261028144727099003)(261021123027099003)(10067099003)(22082099003)(18002099003)(6133799003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEZwS3VqYXIxVVYvUWN5YTdzMGo4Ty9EbGljc2h1b2gwaGo2TG1sdnJ0V0ll?=
 =?utf-8?B?a3ZWbUxITXVJaXZRTnpOK1c3eEh0RkVCdTdnQW1iQkNkdkk2bDIrNnZLaXNp?=
 =?utf-8?B?VmxFclJWRXlIV0lycWJhR25oTjZtTjk4eExSeERETFQ4Q2dRYUloM3c2WXRU?=
 =?utf-8?B?MW15eGJrcmhxTmQ1RGptUkRGbndaOXZJajJXaXN1QkJVUGZRSE1hc2QyaHY5?=
 =?utf-8?B?a3JIMERRUjdLYW01cm5ZTFM0NzE4ZlhaWWFDOU9FVXZYZTFFZFJHaEFKQVY1?=
 =?utf-8?B?cllqQTRGLy9rNjg2cVJMMFYxUDNXOGdUZU5QNXppMDA5TWxVNUswY3pscGFp?=
 =?utf-8?B?bWlUb0YyUGFGa3FyaXMwTWM1ZE5LS04xSzBkZ2x5a1V3c3BXaHZuZkE2MGlh?=
 =?utf-8?B?dkxPTWJ2cTRJdUNzQWRHMVFZZFhndFFUdWNzcFZETjN3OXFDdGx5Mnd2Z1FR?=
 =?utf-8?B?UUduK2xzL250SW14MG5CalRSeUJEcEhSbHhJbjFnRzR5cGFoYmhaOGVPK0dr?=
 =?utf-8?B?Z2RiYUcxbmNKQTlPajY4TThvY2h6VHcyc0dBZVhNOVR2bFZocjhTbk5YNGhK?=
 =?utf-8?B?SkxvemlySTk5bEk0U1pvSFFpcEtzUHk2YTR2L1pkdFpBYXVrQzQwT2lzMjZR?=
 =?utf-8?B?Ly83TU9PMnY0eGxrQldCL2U4ejZPT1pxQU9VcTFwcmQ2RlFxdjZvZWorL3Rx?=
 =?utf-8?B?L1BDRDdzTm4zOTNhblFEK29aRCtSeDBqQ0cxcWpJMGZJMGRHTGYvblNZSk83?=
 =?utf-8?B?elRhU29WWnlJMDk3MUZIdXFkeWY3cU5MUFFwVk1QM0twck5sdkJmUzh1M3lF?=
 =?utf-8?B?a3ZXMXJJQ09vZUZMcFpxcGErRklkZ0RkVGlzMTcwSXZOMi9yZWo0VVdwQ0ox?=
 =?utf-8?B?TWlEWE9NZVl2aGFjYmxSYVp3a25SYTJVQWQrU3R3bUlYZlovUFdML2xCQmNN?=
 =?utf-8?B?SnRHNC94a3JYZTRNcWttZzViRnJtVEc1YXNPUEZZVDMxbnltLzFDb083OTlH?=
 =?utf-8?B?MVZSNlhHZHFFSVRHWlRmWis5UElsTDgxSUx3ajBwc0I2WnZ4Q3FFNWRBdHRE?=
 =?utf-8?B?RWpSL3BmekhPMWVMS0RRTHB1RVRPUU0zcmsyYXVaSG1DVW5LUmo2ckYwQldZ?=
 =?utf-8?B?NVZBZFIzbkRSOEt1OEZlTDFwZit2WjRWQ1JIdXFNTTRYdW9DYlRQcGtaZVg1?=
 =?utf-8?B?WUsxSTNTK21UcGkwdm5UOWJKaGNNdWYrUjdrTjJVMWljMlhrL3ZnRjhVNWUv?=
 =?utf-8?B?Qzh1amVOcGs5U25GWnpYNEZxWjVOR1lPL1FWM25lcWdXVDJycE9nRFgxa0ZW?=
 =?utf-8?B?T3p5STVrVkVLS0lENFB3NHQxRVNCaURqWTVxWWFmWWNDK2R6WWNjd0hGeWs2?=
 =?utf-8?B?dVZDYVpOTTkwV2ROckN5MEZVekZCY0x5ajM0enBYaSsxU2ovYXVYSHF1a1V5?=
 =?utf-8?B?RCtsSW01OXlyRGV1M3JDaHV4aXBPQ1B1R3ZtU0ZoK1VvNWJDekpDYUx2YktL?=
 =?utf-8?B?OUorYWRKQmF1c0hjRkpoNTZKTkd0YUxGZ3VkRDdGUndmc2FGcElFMDcyWE0r?=
 =?utf-8?B?U1JrWmQvb2tvS2ZNbWVvT1dXa3U0akRjTVB3TVo5bkVMeHhDTGxCUHZndFhW?=
 =?utf-8?B?QTl2YUQyUFJpZEU1TzBPc1E0dWZzbGJ6bVhSL29kU0V4U1Y0dFZCUlh4VEps?=
 =?utf-8?B?VjhLWk5pME9BZ1JxUE9qblhGMktEZWk5SlNhVTBJRnZoMSt3cFhpeEo4aEYx?=
 =?utf-8?B?UkxLb0liYW5XZXAxU2R2eHBaNTNHaTNBZlRMaXBtWlIzbDZGVjNzWnVnOCsv?=
 =?utf-8?B?akVsaCtvdDRyWUNYQWNoWWwyQWN4a0dFNWk3am5HeXEvcWdPTzlKakFJSHNr?=
 =?utf-8?B?cFZtV0RGMWZoOWdRVkhpYXVSMnRQZjFnbENMYldnNk8rb3lsMzZ2RjlkcVpz?=
 =?utf-8?B?bTduMzhlYlllVFNBWDdLbjBpL1Y2RzhqVGpxZ1NSNFYrbGlBd2daMlBVb0Rk?=
 =?utf-8?B?aG5tS0ZnMFVzWEtIRFozN2RxMFA5d0FPSm8rOVlBNE5ncElCeU91Zno4SWlQ?=
 =?utf-8?B?NGZhZkp0QThKbFYvVlNhdXFzcHlrY2lWdGpuc0xqR0dzNnFuNnJQRDV0VG9O?=
 =?utf-8?B?eWx2UnJRMHZYWTEyeUdOVjRkdDdsU1htalJ6TXUrSEZSeWs3RlpsQmJzQXNN?=
 =?utf-8?B?TU9FcEhRZy8yUGpQRW00UitQY2k1akRVMkRveVQzcGRabytJNG1TaFRqbDlI?=
 =?utf-8?B?dURHQng5WlZqRmJ3K0lEays3cG1zejJOalhNckVleGdBZ0xKcmpvT0pjYVFE?=
 =?utf-8?B?MmIyUlhnSG9YQWhjcVpsdVFpQ29POTNsS1orSjJNT3Z1ZGNPOVZuSzVWSkE0?=
 =?utf-8?Q?TwE6MBRsubd5KWkg=3D?=
X-Exchange-RoutingPolicyChecked: kaQQgKoG8bt2aNZF5qUbvcBfVy+w8YifDZ/jZ++OeyS3zDqULTWAReaWoYQka2Ug7r7Y1zA9axNdi7F+5En56Vs6+HirJXS/smz1FYIEYx2lrTR4CP1d9A/zqWHPERcB6YCBdSuqG1N5n71DfmnJd3kEzE4X4dZIyqXKz60MdFU4Z2fWqnvBcSDYC7BaakpKchEBBFTPHklT9OB50kmzIAdsSDxKl7ZdN3UWTOJXfWSqVagOGFaKkuaA+L2PPsfldKMGo/diEc+q6xNMDv/aoKviP8wwNOzvzKv3naQS3ARUjcD26e6jn7ukL5dnLV2Br5BoZmsFo8t+BPoqgEtDQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc76e28-c9dd-4f85-6c51-08df4a09c78e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 09:03:17.6726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i1dHzkI96agEBo1HfGggNg+hPxRDpZE7KB/oM7KenjtelYVb3jj3wcsKeQrSjoO0U4CulygZbTFqjuRhQ4vGRHmQT3Wf663mKK6X9c61NDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB589729
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------TJnBSWL2w8ATYC6sB4exXtMo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 26-Oct-26 4:12 PM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski<piotr.piorkowski@intel.com>
>
> Configure the GuC doorbells manager according to the device operating
> mode. Use dedicated initialization paths for native and PF modes to
> expose the appropriate usable and shareable GuC doorbells ranges.
>
> The VF driver still does not need the GuC doorbells manager, so leave
> it uninitialized there.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Piotr Piórkowski<piotr.piorkowski@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c | 16 +++++++-
>   drivers/gpu/drm/xe/xe_guc.c                   | 10 ++++-
>   drivers/gpu/drm/xe/xe_guc_db_mgr.c            | 38 +++++++++++++++----
>   drivers/gpu/drm/xe/xe_guc_db_mgr.h            | 12 +++++-
>   4 files changed, 65 insertions(+), 11 deletions(-)

LGTM.

Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

>   
--------------TJnBSWL2w8ATYC6sB4exXtMo
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 26-Oct-26 4:12 PM, Piórkowski, Piotr
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261026104224.1018993-4-piotr.piorkowski@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>

Configure the GuC doorbells manager according to the device operating
mode. Use dedicated initialization paths for native and PF modes to
expose the appropriate usable and shareable GuC doorbells ranges.

The VF driver still does not need the GuC doorbells manager, so leave
it uninitialized there.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c | 16 +++++++-
 drivers/gpu/drm/xe/xe_guc.c                   | 10 ++++-
 drivers/gpu/drm/xe/xe_guc_db_mgr.c            | 38 +++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_db_mgr.h            | 12 +++++-
 4 files changed, 65 insertions(+), 11 deletions(-)
</pre>
    </blockquote>
    <p>LGTM.</p>
    <p><span style="font-family:Menlo">Reviewed-by: </span><span style="font-family:Aptos">Satyanarayana
        K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:20261026104224.1018993-4-piotr.piorkowski@intel.com">
      <pre wrap="" class="moz-quote-pre"> 
</pre>
    </blockquote>
  </body>
</html>

--------------TJnBSWL2w8ATYC6sB4exXtMo--
