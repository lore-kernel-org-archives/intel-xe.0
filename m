Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CB5C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 13:51:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75D5112BF6;
	Mon, 29 Apr 2024 13:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X4nr9Hg7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191D7112BF6
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 13:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714398706; x=1745934706;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=krjiUq2PZmaOHY5uV+1nhwvfMJzzeb+oWlrsLs5Auh0=;
 b=X4nr9Hg7PB2zi1R8jVLG4fZpsMem1APZkYxQdxDSnuGClnGtCYJK/AlZ
 XlspTZGva+wVWYni2sHLduil0TXTmh9xxsa6k8rp7MfvitGMrhARwGe9G
 cFDXnDFB5qP09mqf/zPxfUK926VnAaWKNtiIEParw+ShcgGQ6cc3lwdW1
 LZU7TLUsAcOzU6LqFVbhp6OamzWOE4c0ziZQWZPr0SoAujUOnVohfyDCZ
 wEaimmi15gExN9mfygXZ0vGqML0OoORyg4QPdV9VYcmZsl3b6MJ5rNyeC
 7OtA9mI8xSpD78UURhBD30opWm/GWE28/y8uKgka7m5esgvlGsYYPSTQM w==;
X-CSE-ConnectionGUID: gTz3uh2YSeWRDcKDHeg3Yw==
X-CSE-MsgGUID: t9CqYWS8QsShINE/Y0YLPg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="27509085"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="27509085"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 06:51:46 -0700
X-CSE-ConnectionGUID: roV1k0mYRGSVpdvEUqRWQA==
X-CSE-MsgGUID: ydxDNB0YTdS3zHNqnwlbbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="30589331"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 06:51:45 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 06:51:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 06:51:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 06:51:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GijQxWa9SwgdUw0p2NAyX1teIpCyBv5wtlocLt7OKKTzrvMpvUXdBOBIyhQw+3Y7FbGVSw72rhhZR1uMv1yI/RU9ZIe/f/BLtEsACsp35Mh2/Pb/eLKbd5RlMsgbh/8/xTfBaOYKba2fWkIWOpJUlV7Ehvcxg2re01WpBsNEPfIdtDaOyThGBZMb7lsCWxZBc2mDcTmjIhTOxT4XXTI5RGMTsoFlJNo8wjopaD9qeJU1m/BHfDX0UVvAAi/N4e4lr4InY8iLxQ8M5lGpeUnBTDmRSjS6foChfVFgLRnTFzH4H/UzpRXa0C/odQYeVGAeaWsToc28VwxIOoRGhwXiNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=spM+LBNVLj4z9SyrN4I9QWWhCCW3qBS1F2vjQK4a4XY=;
 b=akmRTHeZm+omj8urlub70iUD9pkdeUj2gaKdW6+EyNxBmwHbhdPlv81rhinKLyArq+N7P4DojAhDGua+vRPy8fLTj3rIqV6bOGMLs8GE+pRNMVtlQQWWOPW9oi+f/lqmi5k03TsNqQog07TrTWH2J1j8av52ODsCW/7AMcF6asvF1Eqy99Owe/mSFz5rBYmWS2rOKyPSEwkHQzjejl5TFLP9N1M/kVJMTf/+4haV23+NRHS9bnJwa8khtwrg0EC1gXyrYq04OO4UHmo3unzKZQZYvy9lrx8GBSaIBe5OlG7AYqfKYwnd2RQ4Bwio44gL/WfOlmsbq8CcBJ87IToV4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM6PR11MB4547.namprd11.prod.outlook.com (2603:10b6:5:2a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 13:51:42 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 13:51:42 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <sw42yhgzfjqdvkhwfzyrjh46ncle2zq5mzohnzxlria5xqsgns@li2vup2xf4ea>
References: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
 <20240408170545.3769566-9-balasubramani.vivekanandan@intel.com>
 <sw42yhgzfjqdvkhwfzyrjh46ncle2zq5mzohnzxlria5xqsgns@li2vup2xf4ea>
Subject: Re: [PATCH v3 08/11] drm/xe/xe2: Add workaround 18034896535
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>
Date: Mon, 29 Apr 2024 10:51:36 -0300
Message-ID: <171439869685.11427.366527084236681194@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR03CA0284.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::19) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM6PR11MB4547:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d663389-458c-4977-1005-08dc6853800c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RkRxYjFOdzNKQWhnMUhjanZxTGloNlZEcUtZWExrcTVKdG9WL2RJQWh4N1Zl?=
 =?utf-8?B?ZzM3WEY4anR3WXFIaEtybVVrOXdGNnY2eEZRUHpMTmZXakZ3dlhid2o3NTVK?=
 =?utf-8?B?S2FTeFBVZkN0Q1hVK1Q3SzBsTXgvK3ZlMngwVjdxeXp4UXZYcGV5S0xvbVdn?=
 =?utf-8?B?a2MyeGdRMkJhRUMwdFhmbU9wdUg3RlhiNE55WVJ6bzY0NUgyeStVL1l2ZWpU?=
 =?utf-8?B?SGJSWG9qZE05VG5zYmI0d2ZJSEtwVHB2b1ZoaWFxZ0h1US9YWHVNbkpxaEw4?=
 =?utf-8?B?MkhsclVXdy9vME1nbllQZjVTMTlzZ1NoVG1JYmJKM0lob2x5UHpLZjRySExN?=
 =?utf-8?B?ZUNjSmNSY25aL2N5UmFhaXh1Vnl3UUw4MVpaQWNXN1NSaUpESWdReDVUazBu?=
 =?utf-8?B?Wk1oUTdBNko3UnAxL1JmaGhsMHBsc1IrYWM4aCtUUVg3TnVwVWljV1NWMUpW?=
 =?utf-8?B?MmlzVERzYm15OFRVd2tVdmJRN1pTNVFKeHFYSXk4NDZyTkZ3dWFvK0hMMFhV?=
 =?utf-8?B?QUQ5cjZQdUlxNjRCWUFNN0xYUFNUbk94ZGYrQzdPUkpVWk91TkpzcWFFL1Mw?=
 =?utf-8?B?b3hQclgwL2N0bEE5THBacmlJUy9wbUFNbmJoMTY0clVTRUcxemdhTEVEZHZr?=
 =?utf-8?B?Y1RnM2hlWDNHc1A5K2l3N0lNcTdmVE5COEREa2F5Y0tBcjZvQUM4enVhWUhW?=
 =?utf-8?B?akFNazRPWGlmNnJLUktEMm40TE9NWUFqc2NwNW41WnhCa3NVeHltT0lHMUdj?=
 =?utf-8?B?dTlYNHRsNUxUWi9meld1bUhYZ2FhZGMvSjJBL2NGcXBodzZRNmVBTEVjbnFs?=
 =?utf-8?B?S0QyMExscndHWlROWEtCOTMyWUtibi9VamgvSURsTU9lY2p1T0lOZXhPaW56?=
 =?utf-8?B?MzhyUzV6eTJDL1NRK3MzTTZtblZKR3ZsSkdKaVpTNHdlcnpYdmo4V0VzZWVw?=
 =?utf-8?B?Z0ZrVzFMUit1clBHMFZyWWRrdzY2QnluczZhS1V3eFA1QXY0YU9QVGZ2Kzc3?=
 =?utf-8?B?NVkrZ2hDelhheWRkMy9DMEs3dEEvcjg1YThVZFFPZEJVUVZ0RVd1bGdxZU9P?=
 =?utf-8?B?cmF3bWZqWkVTcjlTSjNGSGdFWXJtSVlVQU9uVnZONzZVOTVGRGx0SXNldUFo?=
 =?utf-8?B?L2ZZYmxaU2lJTTZaejU0cHgwUytjS2UrYmdGSkhTRHFiWjRpd3NiNGFqK2Zv?=
 =?utf-8?B?Z1NPaG5wRlhDUVBVUk5KK2NDR1d5aDdROTdNS2NXaUQrMTFseDJranlJbGUv?=
 =?utf-8?B?Zyt4UVl4Wm03c1Nya0l0TUJGak5CS2M4WWw1VzF5Z1BuQzFIaUl2TTVlMFI2?=
 =?utf-8?B?d0pncUw3R1lxT0pVdlJrODFnQ2crMmZBc1p0VzVUb0dnT2w1WGR3dm9JSnFW?=
 =?utf-8?B?MWxlYnc0VGJsTDUyYWdIVm8xQ0hoMnZiMVVVQUVIblhBSWVDOTVhdXFsbFBU?=
 =?utf-8?B?SEppdCtNMFA5UmordXdmUk5JdnovT1JYcklqV2xMUHkydFhSSnR0S0NhQjRM?=
 =?utf-8?B?cHpCdWg1T0JHS1BGWEJ2WHp3eWpNVzVOdzNSYjdETFVVTThrKzF2bjFKdHRt?=
 =?utf-8?B?bmhuZFJJUURpMEVQcjQwL1hibzk1R083dlhOaks5Y1NOL09NSHRsQ2ovZmJJ?=
 =?utf-8?B?VVl2M0NXQjB3c1g4cGNyODNxWU9VSzlib25kWUs3Mk8wWjh6THA3WE1JS2RL?=
 =?utf-8?B?MW5CckErNENrM0o0b3RZWXdDeVFYUE1Jd0RlV25FZlo1a2VUbGl5NUNRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3BSVWg4Tkk5QlpObVZVdUdxZzhweURNV3dOS3RiSU1uSjdMamU0UU5FVFgy?=
 =?utf-8?B?bzJISnZDaWR1SWJmei91YWxBQndxNVFsUGNXN2F5S2hUZ21BZHB3YTEvalcv?=
 =?utf-8?B?ZThpcmlGYXQ2WXNlYWJ3cGZIMTRqQ2Z4Y010NDIwYWxpempNbXdCY1VsQk9z?=
 =?utf-8?B?cG9tTjdUOFc4ci9tazJhbzNBRmVobG15SGFaWGVkTllrTFE1UE5hRmtnYk9B?=
 =?utf-8?B?cGo1eFhVRkMvNVFZYWJIWFMvL1FDbGJYSjdLVjJmSGdjQ1FIekxmMlUvYmtl?=
 =?utf-8?B?b2xBZFRVQXlwbGc5ckdTUVVVTlp1NU9KcHdJLzFHdUhPTzllazRNRzkrdVU0?=
 =?utf-8?B?MWdwMU5LYjZLWEsxMEl4TWZqYU5ndXNVM0ZWNXNFYWtVZ29weVlVdU9tSzZI?=
 =?utf-8?B?RHB5cG5UWTlCV2lFOVVtNEg1TVhOSXVCc0ZqaWhHUzV4QW5pMmcxU2ZPZmJT?=
 =?utf-8?B?VFRBWDkrNFJPbC9xRDVDcTVJU2c0RU0wblp5R0pzNGdUMlhXbEZKN3hDeCtC?=
 =?utf-8?B?UTFNMlRlUExIWkJsWlErME53Z0FRa1AzbzIxWnRFMmg2YVlyUkdaMTJFcmNC?=
 =?utf-8?B?QmljQ3VWb21zUk5aR0p6VXM3UG42RThSdjZ3b0ZXK1cwUy9mczlxOXd5MXlH?=
 =?utf-8?B?cXFDdlZBNUxTSGgza0drdFllWkw2c1dVRXc0M252Mk1qTHB4MHZMZldQSVpo?=
 =?utf-8?B?enpEczFZaURrZUIzaXo2ZklDTGxZcUk4azhIeFYwL3F0YzJ5SXNSZU0rdWpJ?=
 =?utf-8?B?ZGZ6TktHeGlrQUZqWGlISHI4RW52Q3o5S1dLaHY2WVo3RkNRRTlEdENQRGhy?=
 =?utf-8?B?Y2NEaW5PbjdXL2huT3MvWS9zVHh2T3BKT3laMjVhSW42NWhHeFpka0JYdDdz?=
 =?utf-8?B?anZQUytFTHJDbmdsaytPQUlUQnNSNmFpK1phVWd4WnFYZXkrVytwMTRNRWlj?=
 =?utf-8?B?YXpxeTBZdy9JQUEvWHdsek04TE14U3NMYzc4d2tMSlNkbEdZTEowR3diTWR2?=
 =?utf-8?B?ZWRSb0dmeFY3YllGWjZZbnd5eVcvZkxMUlppQkorRnI5a1hPajNYRWM4dHlq?=
 =?utf-8?B?R2xrQUs5dzdXQnl0OVR2WlFacmh4eHBYbCtkOVdtdGZ0bWQ3ZWIzVzVxa2RI?=
 =?utf-8?B?UFdNM3c0cU44bkxNUEpwNzJwcFY4NDMxY21OSEhKYUh6Uzh5SFNQckZsRWhw?=
 =?utf-8?B?ZStub3plMzJIZkkyNmRFT0treHNXZC9tanBlL1JmdHZUVnN1dGFMLzhjaXlI?=
 =?utf-8?B?Z3hjVytBOWlISHhiVEFTeTR0SlF0cjRMOVpVSWpyVWtOeHE4YXgrdFJZT2Vn?=
 =?utf-8?B?a2VXY0NTZXJrclQyVXlSWkgzVmJVZnNMMU5NU3JRazZSTnJzeEt2MEtKMWph?=
 =?utf-8?B?aHJ0RUk4Q1l0cERYMHVXMnZOWk0xUlFvR2pMMUl4MFpIbThPT2NuaDZzWURR?=
 =?utf-8?B?OUEzTWVvbDZTa0N2cWJhNDlHRkkrZzBBUXhYZUhkVmE3MU5BYlBzMWJGMDN1?=
 =?utf-8?B?QUJpcXhnSnRRUEVneXRkNEJyOTVtOU1xd2ErZkJHcWRxaUtNWnAzTFVZVEg3?=
 =?utf-8?B?Ky9BQ2gwZnJQQnBGcnJMWE4vVHRsVk5sM0RKZWczTHZKNVlXbjllbUdNZGJu?=
 =?utf-8?B?SWYrcFBWTkdWYmxRb3JIMmNtMWJXYVZyRGJPUkJqdjJyK0FmVG9IcmJxbks4?=
 =?utf-8?B?U1pYcFBLcE9OczNNUUZ1UENRcDl3QWxLcUtJWGVrTnp5TlI0YnVJN3pFWVk3?=
 =?utf-8?B?RU5jZ3ErR2VlVGIrcEJVM2lEL2M0Tm5xVzFGcFA5bVdFallBM1U2UEdaYmdU?=
 =?utf-8?B?SzhUOENpS2lpL2FINFVBV2oxc08xNE1VMGtuU2xFZ1hmcmFWM1VjUXFUaHJj?=
 =?utf-8?B?WWUxUkFtUng0SHVnZTRGZmEyUXVNaTNSOFFxZWgxeG1adjZWQ1VFNTg1clhU?=
 =?utf-8?B?MUtRb2NLbVBlOWtWWXljR2pxdXo4alNQN2hmRzAwRStwRGRDYktRU3pwSyt3?=
 =?utf-8?B?dXRtRzlhSEhOUkNienhWVXA4VUVzcUpGZkwrR1FXdnZxV05MQWNsV0oxYVZR?=
 =?utf-8?B?R0l2dFFyVEswWHNmVUtkQXVYVlFBV0ltUVZaM0gwTHFGL25XbUl3OXVXemV6?=
 =?utf-8?B?YU5BeUNJRlh2RlhvQ0lYVVZoeXQ1ZDZmNG8wRmV4dGpKZUcvSmN2bDVKWE5W?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d663389-458c-4977-1005-08dc6853800c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 13:51:42.2873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AcXcw7hsKZ1b1wt+H1n7CXDFbQjTtBwTSARgthTLIAspw5GYiVqoYyK6WmGvp5smxzwp+D8LiGwhf4ZLp6UzJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4547
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

Quoting Lucas De Marchi (2024-04-26 18:02:49-03:00)
>On Mon, Apr 08, 2024 at 10:35:42PM GMT, Balasubramani Vivekanandan wrote:
>>From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>>
>>Add 18034896535 as driver permanent workaround.
>>
>>v2: 18034896535 and 16021540221 are two independent workarounds
>>that just happen to have the same implementation, hence keeping it.
>
>that doesn't work though. Now we get an error in LNL:
>
>        xe 0000:00:02.0: [drm] *ERROR* GT0: [GT OTHER] discarding save-res=
tore reg e48c (clear: 00000200, set: 00000200, masked: yes, mcr: yes): ret=
=3D-22
>
>That's only visible on stepping A* in LNL. I'm seeing it on a LNL I
>have:
>
>        xe 0000:00:02.0: [drm:xe_pci_probe [xe]] XE_LUNARLAKE  64a0:0001 d=
gfx:0 gfx:Xe2_LPG / Xe2_HPG (20.04) media:Xe2_LPM / Xe2_HPM (20.00) display=
:no dma_m_s:46 tc:1 gscfi:0 cscfi:0
>        xe 0000:00:02.0: [drm:xe_pci_probe [xe]] Stepping =3D (G:A1, M:A0,=
 D:**, B:**)
>
>It looks like in CI we have B0, so we don't see the issue.
>
>        xe 0000:00:02.0: [drm:xe_pci_probe [xe]] XE_LUNARLAKE  64a0:0004 d=
gfx:0 gfx:Xe2_LPG / Xe2_HPG (20.04) media:Xe2_LPM / Xe2_HPM (20.00) display=
:yes dma_m_s:46 tc:1 gscfi:0
>        xe 0000:00:02.0: [drm:xe_pci_probe [xe]] Stepping =3D (G:B0, M:B0,=
 D:**, B:**)
>
>We may need to revisit 2 things in the RTP matching:
>
>        1) The stepping is non-inclusive, while the version is
>           inclusive.... this is confusing

I believe that behavior comes from the way we did range checks in i915
and is intentional.

For temporary workarounds, we usually have the stepping that fixes the
related hardware bug, so the workaround usually applies to steps before
that one. An exclusive ending value is useful here, since we can just
use the stepping with the fix and "forget" about it. If the end of the
range was inclusive, we would need to keep track of latest applicable
stepping.

Now, even if the workaround is temporary, we usually do have a defined
range of IP releases for which it is applicable and it makes sense to
have a closed end for version ranges.

--
Gustavo Sousa

>        2) Maybe we should just log rather than giving an error if the
>           value is exactly the same?
>
>           Currently we do:
>
>           /*
>            * Don't allow overwriting values: clr_bits/set_bits should be =
disjoint
>            * when operating in the same register
>            */
>           if (e1->clr_bits & e2->clr_bits || e1->set_bits & e2->set_bits =
||
>               e1->clr_bits & e2->set_bits || e1->set_bits & e2->clr_bits)
>                   return false;
>
>        I remember this was useful to find duplicate workarounds though
>        (or some that we were implementing both as WA and tuning)
>
>For now I'm thinking to just merge the entries and add a comment.
>
>$ git diff=20
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index 9d9b7fa7a8f0..db7c7c7875c5 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -449,12 +449,7 @@ static const struct xe_rtp_entry_sr engine_was[] =3D =
{
>           XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_re=
nder_or_compute)),
>           XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
>         },
>-       { XE_RTP_NAME("16021540221"),
>-         XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
>-                      FUNC(xe_rtp_match_first_render_or_compute)),
>-         XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
>-       },
>-       { XE_RTP_NAME("18034896535"),
>+       { XE_RTP_NAME("18034896535, 16021540221"), /* 16021540221: GRAPHIC=
S_STEP(A0, B0) */
>           XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
>                        FUNC(xe_rtp_match_first_render_or_compute)),
>           XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
>
>
>Lucas De Marchi
>
>>
>>Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>>Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>Cc: Matt Roper <matthew.d.roper@intel.com>
>>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>---
>> drivers/gpu/drm/xe/xe_wa.c | 5 +++++
>> 1 file changed, 5 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>>index c904e55ced9c..43fac92e5d20 100644
>>--- a/drivers/gpu/drm/xe/xe_wa.c
>>+++ b/drivers/gpu/drm/xe/xe_wa.c
>>@@ -428,6 +428,11 @@ static const struct xe_rtp_entry_sr engine_was[] =3D=
 {
>>                        FUNC(xe_rtp_match_first_render_or_compute)),
>>           XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
>>         },
>>+        { XE_RTP_NAME("18034896535"),
>>+          XE_RTP_RULES(GRAPHICS_VERSION(2004),
>>+                       FUNC(xe_rtp_match_first_render_or_compute)),
>>+          XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
>>+        },
>>         { XE_RTP_NAME("14019322943"),
>>           XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
>>                        FUNC(xe_rtp_match_first_render_or_compute)),
>>--=20
>>2.25.1
>>
