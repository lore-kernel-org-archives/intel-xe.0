Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C70E77188
	for <intel-xe@archiver.kernel.org>; Tue, 31 Dec 2024 18:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9C910E6A6;
	Tue, 31 Dec 2024 18:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R2kbFUY+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6F310E6A6
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Dec 2024 18:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735668109; x=1767204109;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IvF3qBt+w5S0Ai1loxTpcPABW9B0WZstYPJx71+Z+8A=;
 b=R2kbFUY+qS49EMeUgpZQdtRrLDnRE/FfdhJIv7cgaR9hHaX0rfbLtxzH
 LOfFhG0pmcMgrz2MbQjln7HJdiyn1Xx8wLpPRlDPKtXaGBt0cex5pVA15
 J1NuKDXMG8ANvG6HlEVCQuh/FCVy43Evrt9pvXzu0EoJRlaFUy2F6UpSy
 GTPkuYn/6m8iAv2eROVS3UNvcDQ6eVIW5kWx1kVEI4dBKidIJQ6FmPt+7
 WQr91iFzSiSqZCyk9LYEZWZ6LSuiNWLMTegvqNl9mCLKZf7drdlrq60kP
 0qA2g/QCEv+2mSezD3QMvAZxkDzZWw+Y7/E+EwaKLBHq/cH0kYFHVyci5 Q==;
X-CSE-ConnectionGUID: eO6oTIoWQ1avY0Scg5EP8g==
X-CSE-MsgGUID: wYh7y4RlTb+isxr1tauFQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="47308089"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="47308089"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 10:01:49 -0800
X-CSE-ConnectionGUID: zJ2R8XvLTDCOufzD3dYObw==
X-CSE-MsgGUID: 2LZGXmj3SgquaNPawHNVFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101952169"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Dec 2024 10:01:49 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 31 Dec 2024 10:01:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 31 Dec 2024 10:01:48 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 31 Dec 2024 10:01:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJRgrxMgTrESokjnQNu2TbvEa4DRHZv/nk5ZkFZ+6AwDw6tvk/RvHBTnjS/U5F1D0Y1+4gf4He4/K6UXQfOh7dEKJmDRD80votgw1QZLBZZP1YBxGiY/O8BiwwGwOEJnbBV4ULTukViQMeUt5vpQahTlvyKN0vOpc/UI8cT0MF4wWpcfkKQ6HJHKlI83xCc9qGxFSKTKABkRdxNnhhxHQLvsU5aYHc4h4va1GcvLThIL4FU2AEYaCNvSO9PRKyHh8IftgmaBdBQ7hxHUlbNGSuE26ILDJjFkNXzWG294rBHWzpdjLU4mVTccTHxcnJ21SeD+ghRJ5hydSEzZJ4OHOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OWhVx6H796uWEPaTxZJePHYcQZxz2g2+2iR7K0fMPfg=;
 b=SivL3dJpZY/gcj1eAr0tuwIrhTaII9P4rXN9is5Ii8Bfq/c2zonpJ+KFStqmUBq56/U6X65LySFWsMwHT4wzf2u9xyNsdIoxp8JlMLGLRij/hQAOuL7RK1SbCFA5C/n4sGxYyiDNF2eofoBdJ6ipetNESZH8FRiL2b+hMCL7auvsJbzQ3HeIeD5/LJSBZs9ED3NAx0G7GrjCMxOsEfvvSwLKn3iJ+9U6wL3rwYgXBwWZHdx+vi+l6/Kd5z6Fcfa8BJ0RIsRmKEPw3eK658YYT1oh5YY9mMrAulwUXjRGd2qj5hdbWNVdhh6AkADhf2h6OFJQE6a1X4hqJGzDfnpaiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Tue, 31 Dec
 2024 18:00:52 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%3]) with mapi id 15.20.8293.020; Tue, 31 Dec 2024
 18:00:52 +0000
Date: Tue, 31 Dec 2024 10:00:48 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <ashutosh.dixit@intel.com>, <james.ausmus@intel.com>,
 <felix.j.degrood@intel.com>, <matias.a.cabral@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <shubham.kumar@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.olson@intel.com>
Subject: Re: [PATCH v7 0/7] Add support for EU stall sampling
Message-ID: <Z3QxULWm-4col5VW@intel.com>
References: <cover.1734693129.git.harish.chegondi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <cover.1734693129.git.harish.chegondi@intel.com>
X-ClientProxiedBy: BY1P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::6) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|DS0PR11MB6375:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d3cfc7b-990f-491e-12ce-08dd29c51080
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWVJNGtXMGdhUUs1UTU5NU1IWHZlcUUrNWNzR1JxSXhZQ1lqNXJsNWxGY2NI?=
 =?utf-8?B?NGNQenRvc2VSUFRPMUJqVXlCMXRIaWRteGhoZ1dsbUVwZVdvVHhycHp5Ry81?=
 =?utf-8?B?eHFudVdZS3d2NHV6QUxkSVhHWW1mdHVjWEtLSVVYaXNidXpYMlVBbkh5NDZj?=
 =?utf-8?B?R3pSdEN3RiszUlhvbDc4Wm9PbVNBbmFzNXQ3SnUxNGVYQUhXa0l5bTBlVS9m?=
 =?utf-8?B?TDY2cTVQdjh0RU9udkZUL3pFZlg4QkVxY1k0YlNDQW5GNTdORjB6YVdUSzRH?=
 =?utf-8?B?M0dJaFdiakVKaFgwNGdDR2VoU1AwT3JKWlQ3aTR6VFozZFlvMUZVeHdROElo?=
 =?utf-8?B?VDlxcW9qU0trYUdFdGR5WVZCSnZzZTV5WkhQWjJjMlh1SnZuaFZ5alNxQWRy?=
 =?utf-8?B?aW1WaUpGaTAyZ0wrWGlGWmtkNmRQUTBlaklDU1IyeGpHQlFENUZqaDk0QU1L?=
 =?utf-8?B?c21rWHVaWEZRTCs1R0k3b2hMSlR1TXN5YisxcURxQ2VxQXVBVWhRb1dncjFp?=
 =?utf-8?B?cVVZejBraXBkLytUK0pkTkVaeENnclZ4YkM3S01yTmJ1Z2ErYUtPdnpaOGZO?=
 =?utf-8?B?aUU3eHVKdDNXWTBoaTY1ZEhyaXp2Uzk1VjFPWEZSS2lmTGVQRjZUSWJ3Sm9G?=
 =?utf-8?B?dnVpWTJ0U0Zid1hxVUZJeGVWdm85UWZmTGJDbVVLNWxGRHNIZW5SV2FXcVJU?=
 =?utf-8?B?ZDcwMUw1cVJrbGxQNTNJWURrdmNXMjlhV0FnYXhzOWMzVkt2aERIL2lUUFd0?=
 =?utf-8?B?VHhPYXNKT1F2cFU5cFI2YjNlNUhDejdTcXFJcml5K0VBemlYUk9VZXRBcFps?=
 =?utf-8?B?Mnc5bkhITUp6azJGNytwMGV5eWRvT1V0WE1uSWV2L2tmM2lWR2t4ODU5M2Nw?=
 =?utf-8?B?YzFnOVd6dmNWZE11bVZjbURDeEo3ZFB1WEoxSTdUR3dnUm5XZVFWYUZtY2dJ?=
 =?utf-8?B?S05yNVdoRFd6UTgyaVVLOURLYXljRDc2OGlDSUJQS3lLN3RZNFNSeWlScHBX?=
 =?utf-8?B?QmRLK0tUSzhMekpFRjNyQmVock10RXVoSnRVZnlDcXRQWWJRUlFieGVNbytS?=
 =?utf-8?B?SnpoeUE1OGFlT0RYNUM0WUtQOFFCZXU1OEhHc2g2cFVaSzcvaFArUFNNOCtk?=
 =?utf-8?B?TXZiNUcyTy8vb0RQWlV2TlFlNmRBV0dDTEdaUXVzaFZYd2VpWFRqOG1DWEVw?=
 =?utf-8?B?VTUxcFpvV3NOU2NkemEyZDNWQUFtaHUwYnNxc1FLUjZXMGZ5bUVaSkJrYzZy?=
 =?utf-8?B?Syt2cHNxWnRab2FTK3IrSzNnbFIvSm1ld1pXV1lDRG1NWi9WYTJmaTQyK21J?=
 =?utf-8?B?SUMzeE9ENklHTWkyV0tWT3U2eVZnbzRIV2F1ZzIvbTErRUQzRkY4d3BkWGxh?=
 =?utf-8?B?RmFRWFhINU5xb3FXSkRSb3gzVVc3ZTlqQkpVQjlZVnZTVEN0WFB4NS9JL0ZX?=
 =?utf-8?B?cTZTR3FwZk83OWVyNEFxSG9YSlhuT1hDelJWaStxL0xCOG93RWFiTFEvZFJj?=
 =?utf-8?B?UnhXQkJXdnZrNlVlelZueStsRmhKKzloMXIxV3hCODFQWWhadHU5cDZxMlJs?=
 =?utf-8?B?WmNlcEd1SzBKQUJFVHVEeWxsR2tQK3JnMjRIRWZHeTBmSHQ0bEpZSnhBR2JT?=
 =?utf-8?B?Q1NsZkJEbUI3eGtGd2RzaHFraUJwc25tUUdqSmczREh2QzdQajh3YnJhcmM3?=
 =?utf-8?B?Nzg1N1R1MHI1bzFML25rdklqVm9RWmt3QUtNWDVUTjBKRjBhRDJVbkFSVEpX?=
 =?utf-8?B?ZThzNGZGVTIvNHpRYS8wQzBDWS96MkpEVkxNVGtVUXY5VGcyNHJXWThXcEtv?=
 =?utf-8?B?RVc1dEplTU5STEJwNmw2dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWhRTGJvTU96b2E1OURjUU5hZWNtMVdvMXpJSWJvY0tpbzZyaE9SSXROa0VW?=
 =?utf-8?B?dElqT1VKRjVWLytIbkxsNlpOaXRGOWE0S0tzUTRFVTBsS3Y3VHFQSTAvUExB?=
 =?utf-8?B?RFgwRTNFS2dYN244bGlHZU82aDIzaWkvTDdKUnZOVHVYVE9rM0ZIVmhEMWp2?=
 =?utf-8?B?cG0waXZ6UVRzOUpSckNBVUM0d0EybVZNbmQvS0ViM2I3VDM3aDF3NFJ1dDJr?=
 =?utf-8?B?RkI0Sk5NL1NJN05wVElUSFo1alhpZ3g1elJjNGxSVE50dmphSmVHdDNFUXEw?=
 =?utf-8?B?SmJCaFlqTTJzVzlmbGdPMWNKMExLNHhqNDc4dDIxMjhrVk9DMnV5UWdYQzRD?=
 =?utf-8?B?SE1wdXNvNlU1MUhFVUZVZTRnMkVtMWFmdkgySTdFcVJpcHFzeWRFeUw4a1lF?=
 =?utf-8?B?eS96cHl4N1lRZXFQSEdVVmVGbVJnVVoybE5keGhtN3JCdkJ4OUovZm1SM1JY?=
 =?utf-8?B?bVVLVStZQkMzbEhFSXhnVFBFWHc2dllzZmJzRlhOd2YzZEU2cC9wU0FVdVpq?=
 =?utf-8?B?eFFvci96enBpY2U0NDhMeStYVHRJN0FvcDZXL1pKbDZkZjFMN3o2T3Fid3Jr?=
 =?utf-8?B?UnVmcDFpTFAxbHpEdW9zUmJERkEyNDAxdzNGTGZqTHNnMlpwbGlRK3cwa0xP?=
 =?utf-8?B?WEJkcDlBVHhPVVA3bk0zZmYxSVROQ3BEQUoyS0J1SlRrR3dkRWZCZG91Rmt1?=
 =?utf-8?B?TEdyZE5zRWJlRzREOXI5cTFWdDNrdUNqaW9yK0pHbFRVd2tpR29WRmdJSmxC?=
 =?utf-8?B?am5lM1ZpOFVtS1NPaXR2ZDA0Yno2aTArSkdMYXA5OEdSK0gvbG15VmxEaTNX?=
 =?utf-8?B?L1JrUTkrUWxzdHdvamthTzhvYkVRQ3dGazRGcExJWktucXl5TnhxNWRVSSta?=
 =?utf-8?B?dmxXakx1S0l2ZnhqSksrdEFFeXJCVzNQSWkreWs2ZWdJdzk3dlh6R2dQajZh?=
 =?utf-8?B?akpWTUlBVTNnYVQza0tZZW5pU092NjBxWi9lMnY0YUtrV212dWFHZXMxVm1M?=
 =?utf-8?B?S1JJVElvaXVFQmY1d2RIRWZGUGk1WlQycEpxbHlJcjg5aUVLTGpwSDI2bm5k?=
 =?utf-8?B?WjJyMVhmT01UaDRuQlZEVmVVQzA1cjJ6dktqTXYzZnQ3azg1ZE1kczhCNVRt?=
 =?utf-8?B?V01ua2l0YW1ud0pMZmlTRmtRWm0yUTBJa3lnUXdXR3hZUEpyM0VXemdOUkhy?=
 =?utf-8?B?V0FGZGx3K3orbldYTVZGY1lWSXZDSDJMRCtLRWRzSCtOWVU3bjZGRjR0TWU5?=
 =?utf-8?B?VHUzdXdoT2xYZ3JXT2FRcjVZbGdXUjI4SlRiaS9YRGE4OTVaTzdCOXdxeGdN?=
 =?utf-8?B?VmVaVHA0RG5oTGM3U1VhVmxlcFp6WnZ4Y0xrWlYydmdXT2hPSHRIdXdyS3g2?=
 =?utf-8?B?RjNhSDZJWWsxTkgrUEJsR0ZYaEN5aWtXZjdTNVdac08zMWRjc3BQOFBGek5h?=
 =?utf-8?B?SERRd1JyMkYvdVZNRjJqQVhhOFpZeWVZeXNwVW9GQjJ2cUpuc1hHV3h0K1Zi?=
 =?utf-8?B?aUpESS9zT01qS0RiTnFMR0JaUkpSVVRCbXdUMXBhVWhYbjVSYmZ0bVpmTWpX?=
 =?utf-8?B?TU5GclhVQjN1dWNFOG5QVGpnNnJUS1pqL3dqV2Q3SjhmWjBUcVJYd3d6UVcv?=
 =?utf-8?B?ZzFyZ0lTbnJuS0w1Y1V3SS9LdmVJYXFydU1wakl3NnEyZVk2a2RCVU8wQ0Uw?=
 =?utf-8?B?WFAyZjR2cWZLWmVpejY0bjJtQkp3WDdtcERMOWd3c3pkUFcxNkVLR2lsLy9W?=
 =?utf-8?B?Si9SaG5WOCt2Nk9WTTYwR2tVUmNrL0x2UTg5d1JkWVhLdlJoMmRYUmlNTHNT?=
 =?utf-8?B?TXJPQ0pRcXhNb0hFK0MyVnZER0xPVC8wYUY3TC8yMERBdENReEQ5UVM5aDZx?=
 =?utf-8?B?amhPcEZuUnNkcW42bnloUUFCL01LUGdGRzMwdGNZbXhONnArWTIybzFCbnYz?=
 =?utf-8?B?VUZzenArZ251SWdsdEdXNUdYR0l5VlVvZWQzb0ptaVBocGNCWVpKQWhYZlhk?=
 =?utf-8?B?Y05iaHIxRnFXWndFRFFNTkdlTTUvT2owMWNWUDdESGFCVm5kVWhycllnOURP?=
 =?utf-8?B?dnU3YXhNaS83dHBJQ2lYajBxMURFd1k2dm1POW0zNFZKQWxjWVo5ZnZwQVkr?=
 =?utf-8?B?dkhXalc2bTAyVFFOa1R5ZXZJY0pUNkVCVXRESExpMGwxT0FrNExlUTFIKzVk?=
 =?utf-8?B?ZFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3cfc7b-990f-491e-12ce-08dd29c51080
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2024 18:00:51.9846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GMzVZh2iQPFyM+3GhFToC73Ms3A4sQpVxQN841yOQJi3W3TeGVSvqYdoh9XjMC+S9DsnAe5A/mXyrW8zNZHMOa80VCLTc5sGw8IxTVAmigA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6375
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

On Fri, Dec 20, 2024 at 03:22:49AM -0800, Harish Chegondi wrote:
> The following patch series add support for EU stall sampling,
> a new hardware feature first added in PVC and is being supported
> in XE2 and later architecture GPUs. This feature would enable
> capturing of EU stall data which include the IP address of the
> instruction stalled and various stall reason counts.
> 
> Support for this feature is being added into Mesa.
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30142
> 
> A new test in the IGT repo:
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> is also under development to test this feature in the driver. This
> patch has undergone basic testing with the new IGT test that is under
> development.
IGT patch that adds tests for EU stall sampling is:
https://patchwork.freedesktop.org/series/143030/

> Thank You.
-Harish.
> 
> v7: a. Renamed input property DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT
>        to DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS to be consistent with
>        OA. Renamed the corresponding internal variables.
>     b. Fixed some commit messages based on review feedback.
>     c. Changed sampling_rates from a pointer to flexible array.
> 
> v6: a. Changed the uAPI input to accept sampling rate in GPU cycles
>        instead of sampling rate multiplier.
>     b. Fix buffer wrap around over write bug (Matt Olson).
>     c. Include EU stall sampling rates information and per XeCore buffer size in the query information.
> 
> v5: Addressed review feedback from v4 including
>     a. Removed DRM_XE_EU_STALL_PROP_POLL_PERIOD from the uAPI (Ashutosh)
>     b. Separated the patches for Xe_HPC and Xe2 (Matt R)
>     c. Moved read() returning -EIO into a separate patch
>     d. Removed spinlocks around set_bit() and clear_bit() (Matt R)
>     e. Renamed several variables, structures and enums (Ashutosh and
> Matt R)
>     f. Addressed other review feedback.
> v4: Addressed review feedback from v3 including
>     a. Split the patch into multiple patches (Matt R)
>     b. Added a new device query to get EU stall info (Ashutosh)
>     c. Renamed all Dss to xecore (Matt R)
>     d. Removed buffer size and disable at open input properties. (Matt R)
>     e. Removed the "_SHIFT" macros (Matt R)
>     f. Allocate the EU stall buffer only on system memory.
>     g. Changed the work arounds to OOB (Matt R)
>     h. Other review feedback.
> v3: a. Removed data header and changed read() to return -EIO when data is dropped by the HW.
>     b. Added a new DRM_XE_OBSERVATION_IOCTL_INFO to query EU stall data record info
>     c. Added struct drm_xe_eu_stall_data_pvc and struct drm_xe_eu_stall_data_xe2
>        to xe_drm.h. These declarations would help user space to parse the
>        EU stall data
>     d. Addressed other review comments from v2
> v2: Rename xe perf layer as xe observation layer (Ashutosh)
> 
> Cc: Felix Degrood <felix.j.degrood@intel.com>
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> Harish Chegondi (7):
>   drm/xe/topology: Add a function to find the index of the last enabled
>     DSS in a mask
>   drm/xe/uapi: Introduce API for EU stall sampling
>   drm/xe/eustall: Implement EU stall sampling APIs for Xe_HPC
>   drm/xe/eustall: Return -EIO error from read() if HW drops data
>   drm/xe/eustall: Add EU stall sampling support for Xe2
>   drm/xe/uapi: Add a device query to get EU stall sampling information
>   drm/xe/eustall: Add workaround 22016596838 which applies to PVC.
> 
>  drivers/gpu/drm/xe/Makefile                |    1 +
>  drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h |   29 +
>  drivers/gpu/drm/xe/xe_eu_stall.c           | 1103 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_eu_stall.h           |   61 ++
>  drivers/gpu/drm/xe/xe_gt.c                 |    6 +
>  drivers/gpu/drm/xe/xe_gt_topology.h        |   13 +
>  drivers/gpu/drm/xe/xe_gt_types.h           |    3 +
>  drivers/gpu/drm/xe/xe_observation.c        |   14 +
>  drivers/gpu/drm/xe/xe_query.c              |   38 +
>  drivers/gpu/drm/xe/xe_trace.h              |   33 +
>  drivers/gpu/drm/xe/xe_wa_oob.rules         |    1 +
>  include/uapi/drm/xe_drm.h                  |   74 ++
>  12 files changed, 1376 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.c
>  create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.h
> 
> -- 
> 2.47.1
> 
