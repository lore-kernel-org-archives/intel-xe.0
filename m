Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36589D2ED0F
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 08:27:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8E610E11F;
	Tue, 20 Jan 2026 08:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O798ImEs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12BF10E11F
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 08:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768897648; x=1800433648;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a2yvETQFI+/Akm466MnFTjtJqbTeXmNpvwo5Fz5flVk=;
 b=O798ImEsSCjUAtMegtImIYnfm3sUFE6Wv+1STNTB66wsgBHAPhoC+EFa
 Qw/FFy9UF/02T8gUcax+r7uBd9TylEP/TDXgI7neKaqRX4fwQqfU/qaM8
 CabFU8yH/UlC1PYS+Vulr13izSuO0r33f0c28updrRURBd4nsx6SHZNBA
 B+um+1QveVQ+QB7Q9DSLbanQG/G2YiLU45lrgahqPoVL3QkP0BUjDINHn
 ztISSGi3tDg5SRIRKsCePeqpek7/b9uaMlg68bAZpRNdtBjZceQTWoHcp
 4Zr31j+zMt9M1Xkx+aMUsgRtM7nTTUBxUwgsVTETH1L+kCzZqGVlXcmbL Q==;
X-CSE-ConnectionGUID: Z1Fab+Z1SayJBClzaD5RAg==
X-CSE-MsgGUID: 7y3CC+jKRu2vfN1A168ERA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70000371"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="70000371"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 00:27:26 -0800
X-CSE-ConnectionGUID: vHyUEbClSqaI4DdKqqkyyQ==
X-CSE-MsgGUID: xqPkPX1ZRUOhqBEb9BtaqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="206093613"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 00:27:27 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 00:27:26 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 00:27:26 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 00:27:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f73CCpCyjxvyGIUjW+TUXrNsfPMOEoMguRPEThNaxto079od8AOLmiL5NjIy+orFNEBJ97s1fdWwMs9916cAJuh3ZksPGiwjk18affvExsIf+gNzawA3StcO7AdeZ2f8ZzJFpV3393QrN7w3xR2K9fZs4fJdUqTUUCtDr68QItHtFjx4ZZ20GtaqIwIhSFnwulEx3TNI95CrMAWmxjXY/IKqjNkL2tkZSsrbUwq3YpUQ+TPOIAeMQeFI5VuKRf3RKzJXbG3qV57C6401bMQ9xFM6wQiB51+AQdNL08wCraD5CcDB6Khx+Y3Yi/nJXx/glRRcVGwtHOtFDi2tIwj+5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPYQ0m2WtCcs06/jBOlxXaiUWblxiVNFfmu9gUjkPOI=;
 b=o0lB6w1rBf96NfV5D43NOORVHJcWK7DEesKLF0eALaocD/VDJRfGIIE5jWfcLv2ggCrjU4/CgH9cjO/Fzrj1s+/aDmwzUafh+wtCndc05j6zBg4D94rQJ3DAXtpEkvUEh0X/nFgqPCBYDckHiZqsdRfWjgNNM7WzirKzJc7B5x28+6LSLZCAHqZ1ciWfxC6crmdInco49zhBvHW37f1I9SP/JxCmTXmOo9hbETR8toRUUmd4111p9bHFSC8JOTs/Uk9zf9EIq6tSGmdpv1KM/6d1ZGSk7mGD0RXHtUZP+bm/Hf2bJqUe9S9hsZinHQX/yUeD9EAtRHNxpqIhP/xVzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DM4PR11MB6094.namprd11.prod.outlook.com (2603:10b6:8:ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 08:27:24 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9520.009; Tue, 20 Jan 2026
 08:27:24 +0000
Message-ID: <84c23355-5fae-4093-989c-ddf2e97376c1@intel.com>
Date: Tue, 20 Jan 2026 09:27:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/4] drm/xe: Update wedged.mode only after successful
 reset policy change
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
References: <20260107174741.29163-1-lukasz.laguna@intel.com>
 <20260107174741.29163-3-lukasz.laguna@intel.com>
 <be4475588e406334276f011a11f918ab73f73bd6.camel@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <be4475588e406334276f011a11f918ab73f73bd6.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P189CA0025.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::38) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DM4PR11MB6094:EE_
X-MS-Office365-Filtering-Correlation-Id: 4be735dc-c1e4-46c3-e207-08de57fdbcbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3RpRHhJZzd6cWJMZ2g3MnV5YWgwRVdDTTVKdVkxQ2JKVWRsb2FqeUk1QVVp?=
 =?utf-8?B?QXBhWjJ2R0k5NnhRdHFyeW9Ldzdma3BkVERieDhXTmNNWjJXYU5nc29Vd3Qx?=
 =?utf-8?B?UEt6a0UwSy9xOU1kS05uZHJtWHNkcE5scldhaVFNTWhyV3dncUdqT05zRUtP?=
 =?utf-8?B?Q2twQUE5L01FYlNlZVdkaisvK1IvV1lpRDk1R0lMQXJRU1ZLZUxhV2VBbWxq?=
 =?utf-8?B?S3dPdXk0YXVMdVZLYXhQak52azY1WUFXNXp6MzJuQU9tcDJZaUJQUFNMVFFD?=
 =?utf-8?B?REh4aFVEemRDVzIyUlB5b2xFeVg1SjNsMDBhMnE2NndScG1CUjd0dE83UEhK?=
 =?utf-8?B?Wm01M242Z3Y5VDBjK014VXdLQS9YVXQxeDNvVVhsSjRCak5NWlN3WWF4Q0o1?=
 =?utf-8?B?QzJlM09yWGdONllJYitpNlYrZlJqT1hvVTV4a0VTdDNUaXBhdEJ6VU5BdGF1?=
 =?utf-8?B?WjdUVk9CMURrcDV0UWtWblNxVXNrdmRkVEFpTktlTXFSRzNTRGR4MlpDYkli?=
 =?utf-8?B?SE55STVXQ0xwaXJTMzkxa20zbWZoaUgrRWpUaGpicDRCei9idWdyWjBkaGE5?=
 =?utf-8?B?K2doTVFBbFBQTk9nWmcvc3RLNXFJLzlvaFFjTzRoYVczSGhJWjZIMVJTekUw?=
 =?utf-8?B?WForK0ZCUkR3QjNGN2xFQUJxa0tBcjhZUFFvbThSY1FqZ3l5YXVIaWpmaTBw?=
 =?utf-8?B?aXpOQWNjdDRJS0VhWXVXaGF4TEFiUHBRYkNuYUxiMHRwV0h4bGpYM2JiZzJI?=
 =?utf-8?B?dkRqWXBTckxBWXQwbUxVWWt2S0tGQ3B0WWZZSGxXcGthanFsL2tWczZPTUpu?=
 =?utf-8?B?V3FUTnNzN0dLZXpNaFN4MXNDZVdOOXhpblB5U2J2ejFoek5TOUREdFNSNXNP?=
 =?utf-8?B?UDRWejRzUUl3L3kxOXpEYlA3WlhTbVkyT3VaUVhwZnoyUFF5azkyVUlOb3FP?=
 =?utf-8?B?TlhNbERqVS85QkVCLyt4UHN1N2wxWFZYcko0aDBoV2JaSm5SVWdzS0cwTzU3?=
 =?utf-8?B?Q2NhY2FLc1pNZ0JINzlyWmxlZXpLekZ3V0FERVN5dkkyZFpvVDJySDAzL2M4?=
 =?utf-8?B?T1JYanIvQmRrR040ck5veStZd0QvSWNKZG9peWRBNDhqNTRlZHFDODBxRE5L?=
 =?utf-8?B?T0lXU2NWVFAyNlBUUjNpbGJMcW9Pc3lUM2pjUzBFakVDT2J4akZ1MW5CckZP?=
 =?utf-8?B?UDNEVzhaWXpRRXBTTm5kZzZGOVo4eWgyaVlYeTNGdVNKeWVOUllwY09FKzBp?=
 =?utf-8?B?VEJXbk0xMm1UcjU2eVVlUnRwNnJoaVlyN2xmNVNlMmpRcGhEODZGSnNuQk1U?=
 =?utf-8?B?MWRSaEY0ak85TDVoNmxVTGlqbTBlTE10TDJSY1Q1Nmh3ZllTS2tKamFNVnFp?=
 =?utf-8?B?TlUvbHpEWHhXV0V0OWMxcVJrTDVjS25vQTkwQ2tDQ3ZaVldSMkk0anNZYUhQ?=
 =?utf-8?B?c0FqaDhiQkM2Uk1Hb01HLzJyTWVtcm42K1BRMUlsdXRxN3BiUkJzK1dEUldx?=
 =?utf-8?B?cDR5WjNNQkk5NmFXNjhkK24zaUhBSElDZnpqcjQ3bXArdVpZY3lyMkFQRGVr?=
 =?utf-8?B?eFVpSVBCR2dpbGZ6RFJ0WWpmUzJlZ2I2RFhpbTNqSG13Uk00SjE0VzYrek15?=
 =?utf-8?B?by9LZ2ZjY01jclRmeVFncndnSjVhUUhSd2FCcm9FVUd0WWRCM2VVNXV3LzJC?=
 =?utf-8?B?cnkweHBaTEJlbmhqRm1YQkxSb0ZUeW1qSUNwRmsyWGJqaVZJdnRBMmlBRlo1?=
 =?utf-8?B?Wm9sWHU1NFhRd1EvaFlrV3hyekNuSzhCQTdvcFVvZ3Z2UWVGVFgzVEdxdnh1?=
 =?utf-8?B?TmVWTC9XSnZaRjRFWTd4cTFjSjFRSXJtSEkwalhaVWFJZjFZTHUzZVhKNkFM?=
 =?utf-8?B?RlZYZFJZRzBjY2dLYU5kZUJLQzdNZTdCZWIrbzdKRFVXaHI3NVBXcTVNMTBH?=
 =?utf-8?B?QnBDYWtaTkVBTkRpZk1lZ21ERFcyaWg0ZmNLbmNZeFVyeExVakRJMDBuMFdP?=
 =?utf-8?B?VzVmMXdLTFNZcFlCTGZaUkF2M2Q4blg1L1ZNVExFOHdWSnNPVGlNN2lHNld0?=
 =?utf-8?B?K3pkMUZ5TlA3VTl6VDZFN1BDeVFYdXNsNzNYRSs5eU8xRkNiSVNndEN0TEdX?=
 =?utf-8?Q?DjYo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDUwVTFkdmdweGxPb0ROYk1lazVzTWMvVEZrUld3czlmc0xZeDJyRldvcE4w?=
 =?utf-8?B?UCs2VEZVMHBNd2JOT3BsY1o0b2t0VlFHNlhoYzlkYnhBWWdGWS9oVWN4UzBk?=
 =?utf-8?B?eXlvQVdRZkIvTFZGcXlkalMzeTM0ek56UGVnaWxrWmxqN3U5QkFrT3EwNUw4?=
 =?utf-8?B?WWM5bFFIZzQ5YVlLS2xTMndWaWVvaWdjSGg5K1dtbVlnWTZlZ1h4S3VMb2o5?=
 =?utf-8?B?L01WOFd4MDlmTDFBb1RUL05DZ0l5eHdFKzQ2bkdmcDl1U1BreFVDdFhTeXdy?=
 =?utf-8?B?cGczcno5UWVMdnFHb0hCVkVsUVpwNVM2WGRVMFljMHM1QThwYUowSXZIRE54?=
 =?utf-8?B?b0FuSkNMNUJMQVBEamJtMTJidk4wN08zNFF4blhuZmpmQ25TRVZhWUxjQy9u?=
 =?utf-8?B?K2NvclNDVFZ0VmpRaEMrNTA1bzZhYVk2MEVsVnp3c1F4MDlrSEhSNkVpQjcz?=
 =?utf-8?B?OXZSSm94RHVLUTNrZ2J6Sm0zOXdaUGhIWEdaeHR3cEFmdDI1Q1NDTDhMNmVY?=
 =?utf-8?B?cnJsVEpRUmNWanBXc3grWGxNQUwwLzBKeWErMzE1ZkxtNFVGZkZjSytUQmU1?=
 =?utf-8?B?amZrRWwxeUhlaVIxVXVYYzBUcmRvRitjMk5Gb25tMnUvS3lTR2ZxY2NQK2hP?=
 =?utf-8?B?Ui9lbUpQRzdFTWdlWFE4THlROWRCdm5ndWxOeXdPbm5sSjU3eVhjQzhGWVM1?=
 =?utf-8?B?R05MWFdVajdIcitKSHZRTnU2VWE4d1FnYXRBUHlKenExb1BaQXZjZDFIeU9V?=
 =?utf-8?B?UnFuRStHaURpalAwZG14eTg2cVhYL256U3U2VlI4QnZ6SlZmLytQL05peXpS?=
 =?utf-8?B?NG5Oak12cmFxM3dEYTdxdHhQbHo3N1hDNEtwNy8xNTFadTlNc0lqQ3FsTm9I?=
 =?utf-8?B?QkFlekFtRHJITjhrNUczeXAycVhWcGZ2S2gxbk1WWlJISXJoMllKeFR2L2Ri?=
 =?utf-8?B?YVA4QU50UjZad0FaTVJlU3RVTERCZFRKQnFJQklGSkRKTFBxZ3poZHNldTdo?=
 =?utf-8?B?V0hsVjIwbWtnNXNDUmZKZDZiZTQ3Q0gyWGVPcnl1eXN4RnJLa3I4Q3AvNmJ0?=
 =?utf-8?B?aVNCcVZ6dHRVY0dpZlZKZU9wQ0QxTzhubXA0eVZlVklQU0RaMUt1TmMvRFFG?=
 =?utf-8?B?TnBFWGVnVDcvNXhUeDMwQVhlNmJEaVRUMml0S3ZLaHdCcXdSckJjSmRIN1VJ?=
 =?utf-8?B?eGdObVVvV24vOUFyMVhYWWhyVTc3d0FaaEoyQXhVanFIUGVsa2RCZXphM0tu?=
 =?utf-8?B?M0IzTEt6MFI4eXU1bWwzYTVBcTRKRm8yL25SYkxrM1RuajNlRE9OalNmRGM2?=
 =?utf-8?B?eGJtWTV2WVVYNHNnT3JTQ0cvWG5XQUkxTTZsOWdWUWQwMUlKK1FqeXpmTGVT?=
 =?utf-8?B?RGdkRVhoaCtKSVFLWUpPV04xZEJhMEpEL01Ra0NsZUpGSGxlV3hNeE5oWFVz?=
 =?utf-8?B?eWd0OUJqenhrYmF6K2IzbUxXZmUybWZPcXMxRVpuQlBIZ2pYMkE1cTJTVmd6?=
 =?utf-8?B?UnRWVTBsL1pQU2UzNVZNNEJCSGMxajkzckEvWDZ2T1dzdkFkbzNuZWE2bEtN?=
 =?utf-8?B?MzBkUXMwbEx3TldtRGZQNndLNmYrckVwMUswRWJ6OVY0Y0l1bk1mVVN2clE2?=
 =?utf-8?B?d2VHNzgwbWMxZXR5b0RKWC9SUkdZRmNybFAveVNFdjJ4TjAwbTkzNi9QUXJF?=
 =?utf-8?B?V2thdGhMR2FzLzh3ZWZxTFlLb2RoMi9HVEY0L042QUx4ajZnSUtMaHBjZGMw?=
 =?utf-8?B?MjVSV2JiOFJ4MTNPNkdlS0licVVETk5oSU1zbCtLcGdZbDB5VWtoWVJlb0I0?=
 =?utf-8?B?TW1pVDdFVU1qOGZYeERBaWR1bTBUNEVlMkZIZUlEc0RtT1RQOC9XR3kySW5u?=
 =?utf-8?B?ZnpiblNTUjcwaHpwZld3TFdXVlExaG92SW0vT3BIWERlZEpUVFRSYU5ESnJo?=
 =?utf-8?B?am5pVzZ6ZjNldVFOMkNtN0ZTcUhLQU43SnBLN3NQNFpRL3RyR05XZVdLOXJL?=
 =?utf-8?B?Y0l0TjV4TUI4cEVQVXdKODBPbks4R0MzUjZubWdpajVzZVViMHFiSUMxZ2NQ?=
 =?utf-8?B?ZzRpZ2cxQUI0U0VESCtoNUZuaER2dzV0NFVYbThhc3gyVXlDWFEycm5oMkJ2?=
 =?utf-8?B?YTd4N3VhNGphdXlMV1FiZmFtdmNiT3ZXM1AxQVoxc2F1ZjZ6ODFleFM0TkRF?=
 =?utf-8?B?Z3ZHT2RGZzlGTGlPVmxUVzFQSmhiVXNNbGxIbmRHUkU1cXZlK2hsaGJDR2d1?=
 =?utf-8?B?YXNWSk5aTTRNMnJqR0dxeHdyeHFrZ2dFbloraUQvNC85T1V2UkllbWQ3TzQ5?=
 =?utf-8?B?citXb1NBWTRXWWtVUnBnSWoweWpud3YwZ1JLMU9adzJoUmF0NWpEUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be735dc-c1e4-46c3-e207-08de57fdbcbd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 08:27:24.0157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S53nVngpjKpIFfQrgjrDY7Eeh+QiG2+/6QOiUXxHhvzysfQHc77qhGEITobJPCin9K+WQqhxNhejXopAqQx/Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6094
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


On 1/18/2026 15:39, Thomas Hellström wrote:
> Hi, Lukasz,
>
> On Wed, 2026-01-07 at 18:47 +0100, Lukasz Laguna wrote:
>> Previously, the driver's internal wedged.mode state was updated
>> without
>> verifying whether the corresponding engine reset policy update in GuC
>> succeeded. This could leave the driver reporting a wedged.mode state
>> that doesn't match the actual reset behavior programmed in GuC.
>>
>> With this change, the reset policy is updated first, and the driver's
>> wedged.mode state is modified only if the policy update succeeds on
>> all
>> available GTs.
>>
>> This patch also introduces two functional improvements:
>>
>>   - The policy is sent to GuC only when a change is required. An
>> update
>>     is needed only when entering or leaving
>> XE_WEDGED_MODE_UPON_ANY_HANG,
>>     because only in that case the reset policy changes. For example,
>>     switching between XE_WEDGED_MODE_UPON_CRITICAL_ERROR and
>>     XE_WEDGED_MODE_NEVER doesn't affect the reset policy, so there is
>> no
>>     need to send the same value to GuC.
>>
>>   - An inconsistent_reset flag is added to track cases where reset
>> policy
>>     update succeeds only on a subset of GTs. If such inconsistency is
>>     detected, future wedged mode configuration will force a retry of
>> the
>>     reset policy update to restore a consistent state across all GTs.
>>
>> Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")
> This patch causes conflicts in the drm-xe-fixes branch that are not
> trivially resolved since it seems to depend on various previous
> patches.
>
> This will likely make backporting also to earlier kernels a pain,
> ("dim fixes 6b8ef44cc0a9" indicates the fixed commit goes back to linux
> 6.11).
>
> Could you please provide a backport of this patch that compiles and
> works with the drm-xe-fixes branch?
>
> Thanks,
> Thomas
>

Hi Thomas,

Yes, I'll prepare a backport.

Regards,
Lukasz

