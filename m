Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8E2606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 14:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eK4Au9dG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D5410F599;
	Tue, 27 Oct 2026 14:11:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3512210F599
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 14:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793110266; x=1824646266;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=vezWR3IMjtQGM+O4KHvvswxFITa0xsaUi/B6zggFaT4=;
 b=eK4Au9dGe6jwt2/ooIWlGVETPNHkyZSycJc54m4gdzLdqwLkcU5c9IaN
 YlJALgvRotBGp8oRjSlPLz4tps6+S7Forgf7aU4/vfBdHM9o69enBV3Mx
 M1jhCnqORkq90XAI2euP0NFEnYqf+CzMnx565Rtq2flG93E/CMrHBbANQ
 5PQTmHZpISl4FvCU8M9G3mHTl06YKquzrbuSvMZhUAEyrrSEoqmZegpD8
 NP7EATIA0+QHFrFOISWQ3wQSSehAc2+P96/b3OHj4tTXyhdnBgvbTqiU1
 /O9atAEfXS+tPWaoADzVLQxBqDb17M9nV28wAHXrPoUt2AZogdqb6RvIS w==;
X-CSE-ConnectionGUID: JmWPdBkqR4eHQsgX/xJSjw==
X-CSE-MsgGUID: ANlqAwLgQw2wwDxCPtS7sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1841978"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; d="scan'208,217";a="1841978"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 07:11:05 -0700
X-CSE-ConnectionGUID: +48VtLc7SOastAUtP4x+fg==
X-CSE-MsgGUID: 9MVLClzFTPiHNT4PE7KtwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; d="scan'208,217";a="4627170"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 07:11:05 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 07:11:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 07:11:04 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.69) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 07:11:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AP+301GuUVeESm3e9VQOBFtYjIXVUP5HoudaQVP67b0UjM99JCVyefkv4Xu2GD8WhZjsShVW/P6GmPMIl+9UDqcwR0+i2TcBJM9fsRrPnNiqEeW0F/RBUHx0DpTfxNwEjf4lejAFngEUCmqlmghqGxOLx97cvqq1QRCmbzjhFNEuf4IX8nGuOYFLfOBOidsL0QT5/WjonGavxF0oifTGmC9J56vhejRmmLc2FzNIhNW6/mInU+Ucg+D8VeEl8APJwC8lOFNO3lyTJEcBI4u+ilwmAlEOvtc6sBdUqAuEQyjeojxQ66EOYsYZnHC/TzEpuuTkHaM6FYDE/Wwg/VM0Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uZCSJC4/qZni2cv/B7LNYkll/hOlFRXkBj8j/U08Dw=;
 b=ggvMNzgRAuw6FqovhYOSPb/O1oa3Ha0arFWKamIkCdhx+sViy3kJKCfmHuEdEGkCjiG58AbkZrB9/QR2yMjR5bXevz6csUK+andaflzAfCm1a5GrNWkxTQEtMr2WJqvMW75wFPCluS75MpC78QiU28ynMcYFKOgqi63Maueo9zDE7PLvgrFOeqD7R5I7zO9mLXo1uASZaLT2tqWW/2755ce8l35M1U923RC5tL9keiYoXv1FddvZlwwB+vDz9piPMcccxjMupkIBoHv/73vDxo/m/KmjdNox0azniVFTyJARDKEZSYhugvbXMHq7ouoJPgQ9naGxaONm1R7sskeCrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by PH3PPFE1E3F709D.namprd11.prod.outlook.com (2603:10b6:518:1::d56)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 14:10:56 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 14:10:55 +0000
Content-Type: multipart/alternative;
 boundary="------------AVylO4WNDSlO1w4DXmy3zTge"
Message-ID: <2e963c77-a907-4ca0-98b3-cfd5e19ab7ab@intel.com>
Date: Tue, 27 Oct 2026 19:40:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/12] drm/xe/cper: Construct CPER record for hardware
 errors
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <riana.tauro@intel.com>,
 <mallesh.koujalagi@intel.com>, <aravind.iddamsetty@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <arvind.yadav@intel.com>,
 <syed.abdul.muqthyar.ahmed@intel.com>, <nitin.r.gote@intel.com>,
 <pravalika.gurram@intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-18-badal.nilawar@intel.com>
 <as9Zvxl3-Lx4H6En@black.igk.intel.com>
 <332beff5-53b6-4043-8b60-7c73ca780eff@intel.com>
 <03767785-851a-4b84-8271-388d33d7669c@intel.com>
 <atrHUMcymdVC9T-l@black.igk.intel.com> <20261023230429.GB6078@mdroper-desk1>
 <a08dda76-d331-492c-b1e9-0359f7975d9b@intel.com>
 <ebce511f-ee26-478b-9669-66e35e5d3d83@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <ebce511f-ee26-478b-9669-66e35e5d3d83@intel.com>
X-ClientProxiedBy: MA5PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::11) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|PH3PPFE1E3F709D:EE_
X-MS-Office365-Filtering-Correlation-Id: 965fd4ad-1ac8-48d7-9e22-08df34341de7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|261026140227099003|4143699003|11063799006|56012099006|261022113327099003|261022105027099003|10067099003|261009223027099003|22082099003|261026121527099003|18002099003|8096899003;
X-Microsoft-Antispam-Message-Info: wqFIqrB7/uzYkEdVSlwa6vpvdy9P409DGcjBsYLtdRDUIDlCwPeEqhYvBA++YXnJemMnca0dhATAt16b5pPh6hrLFSICmIacOBd8SqJ5erCK7SVZJ2glu5K9NHhPhCOtVhEJRXUifhlNv2ZkDmtDT56IKAfwX5b9j0ePMPRaWCLEMNOf3/t1ioWHmffgT8VmYxINOYmFDa0xZTSmbaEj3n9zMaflgGmjstP9kinroqEBDTD5P9kqaKxrrrlwywAGplOsKrnZ4GrDMB/ILHmKEveOXI4ozd9UvGZkmZdVvsEhZDyB1K8RPYTO91IGydDdrW0iVIeDYyrbi4OgXfs35yizTEnCZTmNWvOTUGW2GP65aNXXKeQjCmw2Arur6KUn2MwSbuqZIFRj+wYyZRH5vuuATecbs4zdNnHYhmlv5zk06dYSSwdrvbTbNnyxrXcoJ6UDhbdcHLYX+T+SVUpaC6FVJBuDbVi9Wh8WI/V2la5AkR2BP3CjoDv5xmJSnWXEhNFZaefPZdNg478u9xerrPMIftnofr8iErntbJb06LYrL+UWQtRIMcg3ogAymsYhR4Mqpj/kXTBnN84A2pNizLn7d5Vb5/Q2ic18rnvq4rHMjbtYNdmk0Mqbv1EhDvhtr53tHl61wpONUhL1bFj8hEzJnffpZAfuYJ4fiEo8cac=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(261026140227099003)(4143699003)(11063799006)(56012099006)(261022113327099003)(261022105027099003)(10067099003)(261009223027099003)(22082099003)(261026121527099003)(18002099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmNLdlUrN3VCRkJleW10cXZUa0VKS0VFU1JCa2FUUWE2eUZkRnFhVmZIZnNj?=
 =?utf-8?B?bWVwZHdKaEhRUEhGcGV0Z2N2MFc0bGZxckJNS2ZwVGRteVY0aEVuL001R2tR?=
 =?utf-8?B?K0I3NTFQcVVoajdtYWcrdElBQ2d6NlhjZG0vRU1MdjI4MTFyeGVyVzQ4Q1B2?=
 =?utf-8?B?RXRTSWNFSzhyUlNua1F0Z2xBdS9rRHVkYlo5MXRUK2hFZXZiLy9IV3AyQkNC?=
 =?utf-8?B?aVMrVDJwck5pekdKYmE3cFIrREtrUHdtbnVFekRpaEFrbXhjVGpVakt4blR4?=
 =?utf-8?B?T3BqWWdUUE94SXdpRTAyZWhza1lqT3Z3TFhxQk1pdTdYUEswakhkK2I3K09L?=
 =?utf-8?B?NDB3aXZBYjR6cFNiM2xicjFVNnFNUmM5YlQ0dEZOUkxZdGhyL3p3US8yTWZK?=
 =?utf-8?B?UUV0NG91NUVTUDlPeTVLZjV5QkVRSE5iM1VsZVVUUy9CQy9oMURhSmJFN2JW?=
 =?utf-8?B?NUVreVg2bDc4NmppZi9OY2pJRFJuaFhBOS96ZVJuSlcyVkNpS1FrOG9wV2Ux?=
 =?utf-8?B?OEZ2aUNnak1HeXRlSUVpaUlsNUpaaDV6OHZmdXRDSFlYa1lWcHNwNTljcUhT?=
 =?utf-8?B?TWZPa3pNWTlhTFVLSHV6dWY1bmFoTExNTDlWUlM3SmJ3SFFuS2hyS1JQZFU3?=
 =?utf-8?B?c2NLWGFDd25jUWluYzl1akhNalB2aDVpcW5Fdlg4UUlXZzNmSWhFZjNsWmJa?=
 =?utf-8?B?WmxrbG9oa1d3Z1FRQVcxeExUNXFvTStOZHVpMTUyRXlkWmxHUmoxVThQMkJi?=
 =?utf-8?B?bzduVHFhZlhFczZYOVFXY3I0dWFzWUMrOEMvOGlsZVlkYUw3NlRKSVdDMW1s?=
 =?utf-8?B?b0VQZTl0TG52a2RzV3ltaTVHSXB0UmRCOGhnQVR1Umgwa0pYZXZpdGo1Ulpo?=
 =?utf-8?B?ZDZmbm5manpuRVk3aTNSMnZkek1Ed0NldE03Mi9TRmIxYjdtZGxMdEg2M21t?=
 =?utf-8?B?QXc0cy9abWd0VktZYnVwdS92anFpMVZ0b3lmWTl5QzQ3ais2QmdtZWdFZldE?=
 =?utf-8?B?U21xT28rRDlYVzRnYnYycENHMVMzOVdXYUU5WEJrakFVV3haWDhMaUJkRlRj?=
 =?utf-8?B?OTFEME1yaElsbHZtMmgvR0ZUbENxYmhYT3hnZnArTE90YWYxSHd1SFREaEhF?=
 =?utf-8?B?RkdsMGd0V0dzVkFQWFMvc25DeUluU1M0V3JKb2YycEJ0ZERsdWVZRVA1bzl1?=
 =?utf-8?B?MGVJYXRDVXdwYWpMTWlsazQ2NGNQSTFiSlFnUUZSTVRpcWFtN0JneEdlc0Nn?=
 =?utf-8?B?WkUyMlB4R0p4N1VGVjBpMDlJTlhJbWJxUncwZTNKYzFZV25hMnFkOTJjT0dH?=
 =?utf-8?B?eURrS2gvc0pHdGxVNGxOMEh2UkFjd3VvUzdrYzhaSUxiWDNSODJuUldTVENp?=
 =?utf-8?B?elVSWkZET2ZXL1AwZ2RhcFJGejZBSXZZNk92TGF5TEthUHpnMDNxU1pJZTJq?=
 =?utf-8?B?TmtNQlNDZGpnYTNoSmFZSlRDZXVNY0hkY1NMWFM5TkJtWE92Mlg3bW12TWdU?=
 =?utf-8?B?QjNweTZMUjZ6SFgzTFJNRHg0anlPR3RmWHd0VE53M1NzK2JoTXR5SWl6U3U2?=
 =?utf-8?B?MEhCUmlJRFM1UTltZmNLOFpyemMrcWQ4MGVDZUlNc3hjZFQ4bk13THg4QVlO?=
 =?utf-8?B?OXcvV3I2eFZJVXppTEtqVjBtNkEwMEplY2J4bmcvc3NERjltL1pFSzIrYVRM?=
 =?utf-8?B?Z3NLZ2hVbW1HYW00QXdWcW1Pc0ZtQlpydCthMFBDN0hlWVViME81QUg4L1lO?=
 =?utf-8?B?Q0I2NmlZa1A2aU1POU13eEYyQkw3SjR3TmQ1ZnpvTitZbkdnNURjTWovVWJS?=
 =?utf-8?B?VkhmVDRwVHFrNzVBTEIvZ3ZHc0hGWG5EVGpXWkJUVE1obC9QUjJ0TWxqUFJt?=
 =?utf-8?B?SVpyZEYrdWwwWG1pSEtnTUo3SStkdk5MVTNvZ3Vmb1cvQ28rTVNscHU3UGc5?=
 =?utf-8?B?RDV2a3laRXRrYmE1dkt1Z2VPbmFNd3NVY2x5ZnY3bVJZT05ObnNrMGZZOXRB?=
 =?utf-8?B?RThWNXRJc0xSZTVuQ00vZFRXTWtrZjBwODFSQW80NmNJUVFtZnRFTDdCT1RE?=
 =?utf-8?B?K0tNaHNnSWVBakxxMUVmOTVVT3FYS2lJc21QR2FYaS9seHRlc3BwTHBNemZl?=
 =?utf-8?B?Szl2dTgzelJIeGdtOW81VFRzOHNRUVg4dVRqcFRDZk9zYTI3VUgxVUZWRFMx?=
 =?utf-8?B?ekx6V24vZTRrRzN4WE5GL3RBdmgzWVQ4N2pGaklCK1lNNGxHWXZKQnhXcTJH?=
 =?utf-8?B?bHc1SlNDYks1NGpuV2NDcjI4L1pXajFKOVdUWXhGa1F0eWxqbjBaK3lmSmlv?=
 =?utf-8?B?TUx5MzQzcmt1QmY0STM3bVhYdkZ6a1ZRTjBaSmZKenpycHpHL1ZBZz09?=
X-Exchange-RoutingPolicyChecked: tB3ccOUGUZlI+n/X6BGzswEelGY9x6C+a05tYzmmwsPX+lrNRr0/TNce1USXEhwxkv8YhysQxlHraBAo1OCzLPN4Na59sdsq3QP6A52q32SMEtlCpTO0VDtO6KYmIJVCVVcBdaX6zraxCTaLaAMZf9KhbEgf298p+j90FYndc5VOFkEenYdY8l6820zWEk8hZ3o9lz15J8WzLa8XC0w7TZbgX/QWm0RAaTWI4j3Y8nOFUtchYqB+8LNMWKwJRyhzax/V6vEFIf5NYQSwKb6lJUeZEKC7XmiVcR+g8XZ/VAp6EJzVkPefr/INp+lg1CR4rYAzXg5+I5SWDPmlSrmeIA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 965fd4ad-1ac8-48d7-9e22-08df34341de7
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 14:10:55.7697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jl6EEG/pRflBcdDgPZeSjCA91hSi71uLoeT9yCbvsjr/8/fNHg2ZRPhuCBBWhH+SDJMT3bujnCLMXaeXPai5nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE1E3F709D
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
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------AVylO4WNDSlO1w4DXmy3zTge
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 26-10-2026 23:06, Ceraolo Spurio, Daniele wrote:
>
>
> On 10/26/2026 10:21 AM, Nilawar, Badal wrote:
>>
>>
>> On 24-10-2026 04:34, Matt Roper wrote:
>>> On Fri, Oct 23, 2026 at 04:32:48AM +0200, Raag Jadav wrote:
>>>> On Thu, Oct 22, 2026 at 10:24:45PM +0530, Nilawar, Badal wrote:
>>>>> On 22-10-2026 19:10, Nilawar, Badal wrote:
>>>>>> On 14-10-2026 16:00, Raag Jadav wrote:
>>>>>>>> +static const struct xe_platform_id_entry xe_platform_ids[] = {
>>>>>>>> +	/* 0x674C  platform/8086:674c */
>>>>>>>> +	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
>>>>>>>> +			    0x86, 0x14, 0x92, 0x55, 0x0d, 0x9e, 0x9d, 0xa6) },
>>>>>>>> +	/* 0x674D  platform/8086:674d */
>>>>>>>> +	{ 0x674D, GUID_INIT(0xf95911b8, 0x6564, 0x5905,
>>>>>>>> +			    0xa6, 0xa7, 0xb9, 0xbf, 0x54, 0xab, 0x6c, 0x27) },
>>>>>>>> +	/* 0x674E  platform/8086:674e */
>>>>>>>> +	{ 0x674E, GUID_INIT(0xb8d24106, 0x0108, 0x59f1,
>>>>>>>> +			    0x8f, 0xfc, 0x9f, 0xc4, 0xa9, 0xc9, 0xb7, 0xb0) },
>>>>>>>> +	/* 0x674F  platform/8086:674f */
>>>>>>>> +	{ 0x674F, GUID_INIT(0xdd8dd88e, 0xef2f, 0x59b1,
>>>>>>>> +			    0x99, 0x15, 0xdb, 0x6f, 0x1d, 0xc9, 0xb4, 0x5d) },
>>>>>>>> +	/* 0x6750  platform/8086:6750 */
>>>>>>>> +	{ 0x6750, GUID_INIT(0x1dd66c44, 0x87d5, 0x524a,
>>>>>>>> +			    0xad, 0x6e, 0xfc, 0x18, 0x9d, 0x42, 0x6f, 0x1a) },
>>>>>>>> +	/* 0x6751  platform/8086:6751 */
>>>>>>>> +	{ 0x6751, GUID_INIT(0x17d0dd04, 0x2fad, 0x5400,
>>>>>>>> +			    0x99, 0xc8, 0x9b, 0x45, 0x51, 0x3b, 0x67, 0xe3) },
>>>>>>>> +};
>>>>>>> This is unrelated to cper and shouldn't be here. I'll rely on Matt's
>>>>>>> input on how to deal with these.
>>>>>> Agreed, I don't think this is the ideal place either. For now, I'll keep
>>>>>> it here and, based on Matt's input, consider moving it to xe_pci.c,
>>>>>> which maintains the PCI ID list for the platforms supported by Xe.
>>>>>>
>>>>> One reason I placed the table here is that these aren’t general-purpose
>>>>> platform GUIDs; they’re UUIDv5 values generated specifically for CPER’s
>>>>> platform_id field, using platform/8086:<device-id> as the name.
>>>>>
>>>>> Since CPER is their only consumer, keeping the mapping with the CPER code
>>>>> seems reasonable to me.  I’m happy to follow Matt’s input if there’s a
>>>>> preferred place for this kind of mapping.
>>>> My only concern is that we usually don't have device ids lying around in
>>>> random components, but that I think is upto the maintainers.
>>> Yeah, I'm not familiar with these structures.  If they're CPER-specific,
>>> then keeping them in the CPER file seems natural to me.
>> Fine, I will keep them here only.
>>> But it's also
>>> true that it could be easy for these to get out of sync with our general
>>> PCI ID list if PCI IDs are added/removed.
>>>
>>> If a new PCI ID shows up, how do we know what the values should be here?
>>> Are they documented in the bspec somewhere?
>>
>> No these are generated as using uuidgen utility as UUIDv5.
>>
>> $ INTEL_NS=$(uuidgen --sha1 -n @dns -N "intel.com")
>>
>> uuidgen --sha1 -n "$INTEL_NS" -N "platform/8086:674c"
>> 9046afe5-9041-5124-8614-92550d9e9da6
>>
>>
>>>    How do these values wind up
>>> getting used?
>>
>> This UUID is populated in CPER record to identify the platform/SKU 
>> associated with it.
>>
>>
>>> Are there uapi / ABI implications of these values?
>>
>> No uapi implications. As they are part of CPER record should remain 
>> stable for given platform/PCI ID.
>>
>> I am considering generating the platform UUID dynamically using 
>> UUIDv5, with the PCI vendor/device ID as the name.
>>
>> This keeps the UUID deterministic for a given PCI ID and avoids 
>> maintaining a separate mapping table when PCI IDs are added or removed.
>>
>> +/* Namespace: uuidgen --sha1 -n @dns -N "intel.com" */
>> +#define INTEL_CPER_NAMESPACE \
>> +       UUID_INIT(0x3e54f727, 0x549c, 0x5ab3, \
>> +                 0x90, 0x73, 0x52, 0x2a, 0x81, 0x15, 0x20, 0xe7)
>> +
>>
>> +/*
>> + * Platform GUID is UUIDv5 (RFC 9562) of "platform/8086:<devid>" in the
>> + * Intel CPER namespace, stored in the mixed-endian guid_t layout 
>> used by CPER.
>> + */
>> +static void cper_platform_id(const struct pci_dev *pdev, guid_t *guid)
>> +{
>> +       static const uuid_t ns = INTEL_CPER_NAMESPACE;
>> +       u8 digest[SHA1_DIGEST_SIZE];
>> +       struct sha1_ctx ctx;
>> +       char name[sizeof("platform/8086:ffff")];
>> +       int len;
>> +
>> +       len = scnprintf(name, sizeof(name), "platform/%04x:%04x",
>> +                       pdev->vendor, pdev->device);
>> +
>> +       sha1_init(&ctx);
>> +       sha1_update(&ctx, ns.b, UUID_SIZE);
>> +       sha1_update(&ctx, name, len);
>> +       sha1_final(&ctx, digest);
>> +
>> +       digest[6] = (digest[6] & 0x0f) | 0x50;
>> +       digest[8] = (digest[8] & 0x3f) | 0x80;
>> +
>> +       *guid = GUID_INIT(get_unaligned_be32(&digest[0]),
>> +                         get_unaligned_be16(&digest[4]),
>> +                         get_unaligned_be16(&digest[6]),
>> +                         digest[8], digest[9], digest[10], digest[11],
>> +                         digest[12], digest[13], digest[14], 
>> digest[15]);
>>  }
>>
> If we want to go this way, IMO this logic should be placed in 
> lib/uuid.c and not in Xe. But ...
>
>>> Aside from everything else, should we also add some kind of kunit test
>>> that makes sure we each PCI ID has an entry in this table and vice-versa
>>> to make sure we don't forget to update this table when platform PCI IDs
>>> are added/removed?
>>
>> Agree, Kunit can be added as follow up.
>>
> ... any reason the Kunit isn't enough with a static table? If we add 
> it immediately instead of later, we'd be sure to get a CI failure if a 
> new PCI ID is added without the matching GUID. Compared to the dynamic 
> generation, we wouldn't get the GUID for free if we get a new PCI ID, 
> but overall it should be less work IMO.
>

Agree, a static table makes more sense. I'll keep the static table and 
add a WARN_ONCE() for PCI IDs without a corresponding GUID. Since the 
current table covers all existing CRI PCI IDs, I'd prefer to add the 
KUnit coverage as a follow-up with the SW CPER work.

Badal

> Daniele
>
>> Thanks,
>> Badal
>>
>>> Matt
>>>
>>>> Raag
--------------AVylO4WNDSlO1w4DXmy3zTge
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 26-10-2026 23:06, Ceraolo Spurio,
      Daniele wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ebce511f-ee26-478b-9669-66e35e5d3d83@intel.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 10/26/2026 10:21 AM, Nilawar,
        Badal wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:a08dda76-d331-492c-b1e9-0359f7975d9b@intel.com">
        <p><br>
        </p>
        <div class="moz-cite-prefix">On 24-10-2026 04:34, Matt Roper
          wrote:<br>
        </div>
        <blockquote type="cite" cite="mid:20261023230429.GB6078@mdroper-desk1">
          <pre wrap="" class="moz-quote-pre">On Fri, Oct 23, 2026 at 04:32:48AM +0200, Raag Jadav wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On Thu, Oct 22, 2026 at 10:24:45PM +0530, Nilawar, Badal wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 22-10-2026 19:10, Nilawar, Badal wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">On 14-10-2026 16:00, Raag Jadav wrote:
</pre>
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre wrap="" class="moz-quote-pre">+static const struct xe_platform_id_entry xe_platform_ids[] = {
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
</pre>
                  </blockquote>
                  <pre wrap="" class="moz-quote-pre">This is unrelated to cper and shouldn't be here. I'll rely on Matt's
input on how to deal with these.
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">Agreed, I don't think this is the ideal place either. For now, I'll keep
it here and, based on Matt's input, consider moving it to xe_pci.c,
which maintains the PCI ID list for the platforms supported by Xe.

</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">One reason I placed the table here is that these aren’t general-purpose
platform GUIDs; they’re UUIDv5 values generated specifically for CPER’s
platform_id field, using platform/8086:&lt;device-id&gt; as the name.

Since CPER is their only consumer, keeping the mapping with the CPER code
seems reasonable to me.&nbsp; I’m happy to follow Matt’s input if there’s a
preferred place for this kind of mapping.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">My only concern is that we usually don't have device ids lying around in
random components, but that I think is upto the maintainers.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Yeah, I'm not familiar with these structures.  If they're CPER-specific,
then keeping them in the CPER file seems natural to me.  </pre>
        </blockquote>
        Fine, I will keep them here only.&nbsp;
        <blockquote type="cite" cite="mid:20261023230429.GB6078@mdroper-desk1">
          <pre wrap="" class="moz-quote-pre">But it's also
true that it could be easy for these to get out of sync with our general
PCI ID list if PCI IDs are added/removed.

If a new PCI ID shows up, how do we know what the values should be here?
Are they documented in the bspec somewhere?</pre>
        </blockquote>
        <p>No these are generated as using uuidgen utility as UUIDv5.</p>
        <p>$ INTEL_NS=$(uuidgen --sha1 -n @dns -N &quot;intel.com&quot;)</p>
        <p>uuidgen --sha1 -n &quot;$INTEL_NS&quot; -N &quot;platform/8086:674c&quot;<br>
          9046afe5-9041-5124-8614-92550d9e9da6</p>
        <p><br>
        </p>
        <p>
          <style>@scope {  }</style></p>
        <blockquote type="cite" cite="mid:20261023230429.GB6078@mdroper-desk1">
          <pre wrap="" class="moz-quote-pre">  How do these values wind up
getting used?  </pre>
        </blockquote>
        <p>This UUID is populated in CPER record to identify the
          platform/SKU associated with it.&nbsp;</p>
        <p><br>
        </p>
        <blockquote type="cite" cite="mid:20261023230429.GB6078@mdroper-desk1">
          <pre wrap="" class="moz-quote-pre">Are there uapi / ABI implications of these values?</pre>
        </blockquote>
        <p>No uapi implications. As they are part of CPER record should
          remain stable for given platform/PCI ID.&nbsp;</p>
        <p>I am considering generating the platform UUID dynamically
          using UUIDv5, with the PCI vendor/device ID as the name.&nbsp;</p>
        <p>This keeps the UUID deterministic for a given PCI ID and
          avoids maintaining a separate mapping table when PCI IDs are
          added or removed.</p>
        <p>+/* Namespace: uuidgen --sha1 -n @dns -N &quot;intel.com&quot; */<br>
          +#define INTEL_CPER_NAMESPACE \<br>
          +&nbsp; &nbsp; &nbsp; &nbsp;UUID_INIT(0x3e54f727, 0x549c, 0x5ab3, \<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0x90, 0x73, 0x52, 0x2a, 0x81, 0x15, 0x20,
          0xe7)<br>
          +<br>
          <br>
        </p>
        <p>+/*<br>
          + * Platform GUID is UUIDv5 (RFC 9562) of
          &quot;platform/8086:&lt;devid&gt;&quot; in the<br>
          + * Intel CPER namespace, stored in the mixed-endian guid_t
          layout used by CPER.<br>
          + */<br>
          +static void cper_platform_id(const struct pci_dev *pdev,
          guid_t *guid)<br>
          +{<br>
          +&nbsp; &nbsp; &nbsp; &nbsp;static const uuid_t ns = INTEL_CPER_NAMESPACE;<br>
          +&nbsp; &nbsp; &nbsp; &nbsp;u8 digest[SHA1_DIGEST_SIZE];<br>
          +&nbsp; &nbsp; &nbsp; &nbsp;struct sha1_ctx ctx;<br>
          +&nbsp; &nbsp; &nbsp; &nbsp;char name[sizeof(&quot;platform/8086:ffff&quot;)];<br>
          +&nbsp; &nbsp; &nbsp; &nbsp;int len;<br>
          +<br>
          +&nbsp; &nbsp; &nbsp; &nbsp;len = scnprintf(name, sizeof(name),
          &quot;platform/%04x:%04x&quot;,<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;pdev-&gt;vendor, pdev-&gt;device);<br>
          +<br>
          +&nbsp; &nbsp; &nbsp; &nbsp;sha1_init(&amp;ctx);<br>
          +&nbsp; &nbsp; &nbsp; &nbsp;sha1_update(&amp;ctx, ns.b, UUID_SIZE);<br>
          +&nbsp; &nbsp; &nbsp; &nbsp;sha1_update(&amp;ctx, name, len);<br>
          +&nbsp; &nbsp; &nbsp; &nbsp;sha1_final(&amp;ctx, digest);<br>
          +<br>
          +&nbsp; &nbsp; &nbsp; &nbsp;digest[6] = (digest[6] &amp; 0x0f) | 0x50;<br>
          +&nbsp; &nbsp; &nbsp; &nbsp;digest[8] = (digest[8] &amp; 0x3f) | 0x80;<br>
          +<br>
          +&nbsp; &nbsp; &nbsp; &nbsp;*guid = GUID_INIT(get_unaligned_be32(&amp;digest[0]),<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;get_unaligned_be16(&amp;digest[4]),<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;get_unaligned_be16(&amp;digest[6]),<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;digest[8], digest[9], digest[10],
          digest[11],<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;digest[12], digest[13], digest[14],
          digest[15]);<br>
          &nbsp;}<br>
          <br>
        </p>
      </blockquote>
      <p>If we want to go this way, IMO this logic should be placed in
        lib/uuid.c and not in Xe. But ...</p>
      <blockquote type="cite" cite="mid:a08dda76-d331-492c-b1e9-0359f7975d9b@intel.com">
        <blockquote type="cite" cite="mid:20261023230429.GB6078@mdroper-desk1">
          <pre wrap="" class="moz-quote-pre">Aside from everything else, should we also add some kind of kunit test
that makes sure we each PCI ID has an entry in this table and vice-versa
to make sure we don't forget to update this table when platform PCI IDs
are added/removed?</pre>
        </blockquote>
        <p>Agree, Kunit can be added as follow up.&nbsp;</p>
      </blockquote>
      <p>... any reason the Kunit isn't enough with a static table? If
        we add it immediately instead of later, we'd be sure to get a CI
        failure if a new PCI ID is added without the matching GUID.
        Compared to the dynamic generation, we wouldn't get the GUID for
        free if we get a new PCI ID, but overall it should be less work
        IMO.</p>
    </blockquote>
    <p>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px"><br>
      </div>
      Agree, a static table makes more sense. I'll keep the static table
      and add a WARN_ONCE() for PCI IDs without a corresponding GUID.
      Since the current table covers all existing CRI PCI IDs, I'd
      prefer to add the KUnit coverage as a follow-up with the SW CPER
      work.</p>
    <p>
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Badal</div>
    </p>
    <blockquote type="cite" cite="mid:ebce511f-ee26-478b-9669-66e35e5d3d83@intel.com">
      <p>Daniele</p>
      <blockquote type="cite" cite="mid:a08dda76-d331-492c-b1e9-0359f7975d9b@intel.com">
        <p>Thanks,<br>
          Badal</p>
        <blockquote type="cite" cite="mid:20261023230429.GB6078@mdroper-desk1">
          <pre wrap="" class="moz-quote-pre">Matt

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Raag
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------AVylO4WNDSlO1w4DXmy3zTge--
