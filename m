Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5C2C02190
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 04:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9398C10EA11;
	Fri, 31 Jan 2025 04:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ameWK7gC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423D210E031
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 04:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738297513; x=1769833513;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=Zj6ZtRcGLWTKKY/fI387tUev14vHrsZrgrXT3MohNZ4=;
 b=ameWK7gC2giGahKUdklPehjrXtvNuMJMmqLsN58koF0EKtsab02M/qb7
 s040mQ+TC+cuVNxO94gg92Pv8xQLgNXLqr8OQSCE6SJXIcs0mJosRJOPM
 y7CFtzJzR9U1FxhviDjhQzIysVpFR52NY8rzqzViq6eJIVhHxKqnRU02H
 VONIs3adaIFmTVQo9H5dQi5nXYJu99vu2icAbGkuaCYd1MGNsFu4hIjDO
 k0GyWQH9+by/0N/yPqKVp6HU8k4+M6idyAD9AGaRk6hksyWuMBtTp9OSI
 IoqeatzscFccjDWS2jiHJAQWIZJYt6jRRJ042yHOSsgOK+DyJTdUUpdxW A==;
X-CSE-ConnectionGUID: GmMbo+8nQJWYfQYaolA/rA==
X-CSE-MsgGUID: Udo8O5LaRxGxIH7thA9spA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="49855597"
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; d="scan'208,217";a="49855597"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 20:25:13 -0800
X-CSE-ConnectionGUID: bfqcikxXQvOBLA1ah0o7CQ==
X-CSE-MsgGUID: 3YEVlr+DT1eJL/lVz2Wt9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
 d="scan'208,217";a="109983978"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 20:25:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 20:25:12 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 20:25:12 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 20:25:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hk/3Nnp+AIDvUSR7Y5RqjPDiYmysl/u3hkXyOM0iSkoqJMyabK/SSGC9viSXPlMaiYoPETtD27qQHgFduEuELfrFTy/RrtoZX8yyerUPaYslKxdXj351bpiBh/25m/ouzRSm2ApjHPZgfLc0Qymxsn20aJNwPjGuztJpiCcFKyJU8ipW2N1Z7xbQxUj+JYX1ktX78Bjct7tV+Ueu6cnu1dfio+8rWXPIUrVeIZNbHU+O45hoZzTQksUSBOXTdWgXNOhH5PAppfmr0y7bgqdrc+o/4LMdHvg6flFAitp1ehCn5dNG6sNQjDPTMztHj92VP3uiQLUgYkjzP9Z2YnL9fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vRpCkQRehdHFIU6WL/B/WMTmUkPXdFJ8SKjDDG0x20=;
 b=a/HvqvV1LrAQxn1ToXFCVXlV9FE3iEZRMWGQIjK9K7fGarPs7KMPIOsDfH214NCEB4qG72wykKYUL8i8y6A++IESxuqk44I4WDTYkgcaxkcLCcvKWpuBYuZN5B5dD88KpTeXH8RHx+DfqJGwnT/cI3syf4Swt5yOcJdfBvrCmBT2xgee67wjd3tFu1f1LR1i/Xk7nSAMb9HpZZNNdHmLkjjOVVEjiCwS833g7K4cHLsu71TV3oIa5GXF909Zmp0sIbfgmbCZI6GP2QUw6eeVZmez2XwNssgvLdHuGrZaiMUOdZrZCwwpuL4EXf27nJmmSlLoWArP80ER3zCw3FRagw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 CO1PR11MB4947.namprd11.prod.outlook.com (2603:10b6:303:99::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.18; Fri, 31 Jan 2025 04:25:09 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%5]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 04:25:09 +0000
Content-Type: multipart/alternative;
 boundary="------------Zs0PCeu5jSvyOvZc1mu0Tld0"
Message-ID: <08bba1cc-3f1f-409d-bbb7-187ee0c63a79@intel.com>
Date: Fri, 31 Jan 2025 09:55:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/hwmon: expose package and vram temperature
Content-Language: en-GB
To: Raag Jadav <raag.jadav@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>,
 <andi.shyti@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <anvesh.bakwad@intel.com>,
 <saikishore.konda@intel.com>
References: <20250108092415.289551-1-raag.jadav@intel.com>
 <94e0bc3e-897c-48e2-950d-777d40519ab7@intel.com>
 <Z5GuzT7R0WZTr3r3@black.fi.intel.com>
 <bc971c1c-bcf1-40f4-a7fd-52107ebec05b@intel.com>
 <a79e18b1-49da-4f14-bd7d-06bc497fa004@intel.com>
 <Z5OImvYNno8VDci5@black.fi.intel.com>
 <fba28165-eea6-41dd-938d-9db749eb9f60@intel.com>
 <Z5OvwSv5OykmbTNK@black.fi.intel.com>
 <d9ba4385-ec55-4f16-b0c1-9a493c9319a8@intel.com>
 <Z5SPWwiB15ptK4hR@black.fi.intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <Z5SPWwiB15ptK4hR@black.fi.intel.com>
X-ClientProxiedBy: PN3PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::12) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|CO1PR11MB4947:EE_
X-MS-Office365-Filtering-Correlation-Id: 83b3f9f0-4fbd-44e7-0ebf-08dd41af3ed1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGp3VjEzbGpRSmFLL3hNOXpKTmd4VktGcHltWTFiby9LRG1ya2UrMTdIN1JB?=
 =?utf-8?B?Y2tJMFVXT2lVODVnODZqcFdmVml2QXZhUFRnVktpQllUUVpHZ2NpTFNpeC9E?=
 =?utf-8?B?UnlRbHU3YTRTWkVtVnZtVWR4K1RTclRLcTkwaEhCRmZmRDVVZUYzcWlRWHZL?=
 =?utf-8?B?RHVYVTAvUmFIZU9aMk0vQVFxOUxIMFN6SVZZODNwcVRJMW9sZ3RyUHJDZnMx?=
 =?utf-8?B?dElLWVpHZTBpQzFGdDV3OGcrOVlVUWRlKzltMFNZNDhrYkkvdzVKWDJqWm9p?=
 =?utf-8?B?Skw2V2gwTGlmM3o2elZRa1NJRGNjSitETzJMNzhjekpJU3Byenhkb0Z2QVBL?=
 =?utf-8?B?K2liKzVGSjgzSkp4d3NscHFiWTIzbG13TWJVNUw2YTFXT21ZU1VQeDFDOGk5?=
 =?utf-8?B?V1ZNVFlCQ252QjJERk9JQ3JTai9xT3ZlMjNHdldGelcySWtMMXRYTE1wNFlx?=
 =?utf-8?B?ZkJ5bC9WbENmdVdrVkVSdlJXK3NzWTlBY0tVcm9DL3BzNFA3TXRNOVRaNXlF?=
 =?utf-8?B?eWhUcFd6OVRMc2RUM2NqQWo3dlZOSEY5RkZjc0kvV2dldXNCbXNRVUM5aS9S?=
 =?utf-8?B?YUpheTJSRDZPU0pHKytzZWIwUUlWRGN6RzBtS1hnU1VvbWhUakplY1piTkx4?=
 =?utf-8?B?MFVHcndlazFvRjh2bmZad0w1Qmp6ZTBjTmFXT09oczV4OGRiSUluMWs0ZXEy?=
 =?utf-8?B?bmowNGRvZHB5ayt1RjZhcTc1dUY0aUhVNEtwbHUzbVpXb05wdFFleFZhbGRG?=
 =?utf-8?B?VVE2aGVqWUpkNjlVbUh5bXZzaHVwV281N0p1SDFPcmZteVR3MEJpUGRtbE9D?=
 =?utf-8?B?SXFocjUrc2x4RUxEOFJobzU1Y2U4TGpjRE8rTklhSXJhWUR4ZnZnaFdCOHpB?=
 =?utf-8?B?b3ZSNDJqY1MraVNXc3dxUmtiWE4wYzJOOW5ySXFUR1NwTmlwdVBsaGxBQ3p2?=
 =?utf-8?B?dWRLOWx1TmJCcks2UGtmbnVpd050YUNtNmVscE9hR240U0REakdlencyTUFl?=
 =?utf-8?B?R1JuWlNDeksrV0FUTHAyRVFYRzJMc0hIVFVrQXFFME5hNjFUT3NVcEN5YU5z?=
 =?utf-8?B?NXVjOXpwWXdlVE9zU0JHTWMzNWNwSW5WdER3bEFYM0hSeWZ1SitQazNSbUhs?=
 =?utf-8?B?YXB4bGtpeDlLVGEvNDhKUUN5NmFMdDBib2d3cnZCQXlyZ1A3b1E3cm9TVHNy?=
 =?utf-8?B?eFJLN05ET24vck90RjUycGI4dmduRVF2RXJHNXVieEtQMXBqMVhDR3Z2VWZi?=
 =?utf-8?B?cEhWdWpLSEFmNHRqK0w3TXJJNy9taDhGanYyL1UrOXhyeVFaZjhNVURGM082?=
 =?utf-8?B?dGFpY0lFZjc0cHlxYnBqWEJGMHNMV3c1VXVoMldxT0ExV3ZjdDVBU0x0UGts?=
 =?utf-8?B?Q3BZWjZQZkR6WFVJQUM4V1orTXJYcmdEei8yT0pNNVIrYk1IVSsrU0M1Y2ls?=
 =?utf-8?B?NGxhWXVpYjJHeVhFMmNjS0RQZy9EVGN6bnVyZjFURUlFa0E1MitrcE9oUEZm?=
 =?utf-8?B?U0FLSG0zY0lOak9kUS85eHROV1lEQXNFV3QxdzZxWkt4MlQzMEpqd1dnUjlO?=
 =?utf-8?B?Y0dJMTBFeUV3dmZiYjZadDNDMnU4b0VjbWtxV0ZUeExuc2JBaHd5WDNWR0dG?=
 =?utf-8?B?ZFFmY01mQnBmOWdqa2ZSSFRDajZJVC9sVGtvR1BJVkdpcFRQZXVMZ1NuOU5m?=
 =?utf-8?B?WTlrN2MyYkl3c3BaTktnbkR5ZEJ0bWo3Nlk4NlRpamZTR0ticFJBbVkrL2x3?=
 =?utf-8?B?Wk1VemdFTjRiOG1zejlFdmdNT0txK1FaYk9KTUd6Y0lPVXBXeXFiSHAvbDhv?=
 =?utf-8?B?Y0xtUkFWOFlFek5KYUp4REw5Q2xQQVhzZzdSZnpPUzJoSDgvbEJFOW05OHY3?=
 =?utf-8?Q?DLoCxO+9eTjJV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eG5sWDJYeFlUTUhUSzlxcEdiR2Q1d0JrMG5SM08zUHkxR2xkWXlCM2Jxaklh?=
 =?utf-8?B?cmprYzRSdUxMblNVSGNzSHdOY1M4Rk5iK2tmVjVkS2dFQmV3czRLVHZneGR1?=
 =?utf-8?B?Zkk4OHlzbW1Za3JMblRKanhRbFFZbXVwQXBIelBDN0dJOG9JMnhuTmUvVU9y?=
 =?utf-8?B?Y002cS91RWtIaDk2cHVBZ0M5WWZCZ25aeFFaQTNPUWNGVXlxV2JtREtNb20y?=
 =?utf-8?B?ZHJoSDF3NkdlYmcwRUpZNnRXZmxUUUtHOEU5L3o0TVgwZHdwV2I4VVhZRXov?=
 =?utf-8?B?by9KR0xmR25nMVZqRkVVZkRURHVzWVE3NVJQWkFiN05SRm1IdXNIYisvN00x?=
 =?utf-8?B?WktiSGllUllqUnk3cEl6aWlLaThUcytmOGx4STBtOHdmaElvWGdMNDF0d0ds?=
 =?utf-8?B?ZUxtOTBzS3RoZ1p6a3hOcTI2TVlPRWFOdVhqZzkwUnc4QnlwNEhHSHdYUDJu?=
 =?utf-8?B?YnczNkp0MDgvQ0ZnTDFIb041TzdwVXZRUmV5dXRLcjY4eVoyNlpMQnA4RlQr?=
 =?utf-8?B?WUtmbUpsbnpQQnkyK2Q4MnVaV2k4QlZKWVdBeDZKVnlFM3hOOVhWbC9KcXZo?=
 =?utf-8?B?SXFVQkpyZ2M3dTFIVEErVXpCVitnS25ZdGg0ZTBRbndITU04MEM5LytpT0I2?=
 =?utf-8?B?SFN1OGVhbUEwcFp6U25nc2FBSVo2ekVVVkNWSnJzMUhJNGZ4V2o2eUFUM1Rq?=
 =?utf-8?B?YytBQkRTVWN2Y05MM1dONG9sRU5GQkhFNXdDQWFSMEFrU2J1cFZUdlA0SzVB?=
 =?utf-8?B?OFlDV0VBR3hWQTVzaE16RkdnSGNpWHhTQVhIWTV0OVVENXNPSWt4ZURaUFZm?=
 =?utf-8?B?eGJvM29BVDltbUh1WkhlaWNDOTdWcFppSUNRaG5kckZyVWJVdll6L3FLbmZD?=
 =?utf-8?B?R0dkKzNKdXlaVjZHY0VZYmVKRjdmR1VscWZaYkptdk9OOTBoSEtIT3kxR2JY?=
 =?utf-8?B?US9MZ0lKL1lva3M2UkQwM3ZTM09BbUREMy9oTUFwMWhwNk5SY3Eyd1d1V2JE?=
 =?utf-8?B?ZVlHcHZlRHAwa2g1RXMyc0lYZWh6NlptMzVpRGJCMGEvcEd4Skp3N1lXY1Ni?=
 =?utf-8?B?cGRUcUZBTGVYWWM0Ui9weWE5NXBSN1RTSVRpM2lpenF3NWd6bHBjbG9RUVNT?=
 =?utf-8?B?M0JwTTkxdTU1U05YWFMwa2UvbXFzanA2MFpLSlkxVCtVMHd4YmpoZVBzWkRR?=
 =?utf-8?B?bkFBbEZ5bW9CUlFDWHM2Nkw4dUpNTVNDSlhidUVTN2VPSEJFeFJBaWZ2Rjhh?=
 =?utf-8?B?K2srNVdGdk5FRnpWamR6aHUyNDg2dnRjZi9qM29DcThFQWV3ZXhmbEhwaTlW?=
 =?utf-8?B?Z1BJMmxQaUZ5bFVJSUhYdjk2NHNHMGJ4SU1RU2ozbGxDUkNQQ2UzZVdsN0Va?=
 =?utf-8?B?M2h6T2JGelVueGR2SlpwVTRYNlo5cFNrSFk0cjlKUkxIYzBvc3crTFc0ZVhO?=
 =?utf-8?B?UDNvc2ZvcGJSbFJQRUFYbXJQSFhuNjlIZGVPYUFhTnhFdHBmMTBsV01MWmtL?=
 =?utf-8?B?Ulo4bDFTVmEzMDJvSEdXSFF5dHpjWGZQS2VaY1prdnVIWjgxc2sxZjkyVFZS?=
 =?utf-8?B?V3ZCN3piazBhdkV1UExyQktFN3hXY1pvT0hKeDYxb2UwMmJTKzc4Z240cDQ5?=
 =?utf-8?B?VGhVcVN6eVJNWWE4dTJCNGphNVhGSXR0dDZNZ0pSR0lBZUN6SytRblNndmtZ?=
 =?utf-8?B?anUyWWFiVXFHWTRUenFYWVJsc3M3NjJKUEhIN2dFakZ0NkJTbjFlYlNNUnBE?=
 =?utf-8?B?OWFPNVZoaHg2RVJ6ZWlmMU96NGJ2aDZRN09waVprTG14VzNEY2hnNDF1OXZF?=
 =?utf-8?B?YlQrcVJRaCs1TTQwTVdURGN4d3NLYkNadkhBSEovRVJjNlZlRFRLUS9Xdy9X?=
 =?utf-8?B?SC9HbVpLaTVuL1RrVkRrRU9PT0x4c24rS2x4RjBYcDlZU0t1UW9GZGRPYjV1?=
 =?utf-8?B?SXl5SXFQb2JSY3IybXdISDlpd3ljbXVkRjZaNis4UXBGUHNMb2pRUjBqMFBC?=
 =?utf-8?B?c3JGVjZpMGlhMTdoV1p3NFdPNE03UUNYU0lYOVl1S2RIa2FTbEZHMHAzWUs5?=
 =?utf-8?B?bHJqcnd6UGhTOHR3cnBOQXRBZXlWTFRmZWsveXJ1N3h5cXo1Y21KSFdCeTVy?=
 =?utf-8?Q?SbybI0afalDdqFiw95U1LYoah?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b3f9f0-4fbd-44e7-0ebf-08dd41af3ed1
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 04:25:09.0240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uSSBfeP+6PfBh7AgtEnt+knXo1seJKMx/vdKLOMSu00ppN0MGyfkLVdsfuqLmfNlLD3fm9bCXbs37qxulVoIcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4947
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

--------------Zs0PCeu5jSvyOvZc1mu0Tld0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 25-01-2025 12:44, Raag Jadav wrote:
> On Fri, Jan 24, 2025 at 09:37:55PM +0530, Nilawar, Badal wrote:
>> On 24-01-2025 20:50, Raag Jadav wrote:
>>> On Fri, Jan 24, 2025 at 08:27:14PM +0530, Nilawar, Badal wrote:
>>>> On 24-01-2025 18:03, Raag Jadav wrote:
>>>>> On Fri, Jan 24, 2025 at 05:29:16PM +0530, Nilawar, Badal wrote:
>>>>>> On 24-01-2025 11:46, Riana Tauro wrote:
>>>>>>> Hi Raag
>>>>>>>
>>>>>>> On 1/23/2025 8:21 AM, Raag Jadav wrote:
>>>>>>>> On Tue, Jan 21, 2025 at 01:56:05PM +0530, Riana Tauro wrote:
>>>>>>>>> Hi Raag
>>>>>>>>>
>>>>>>>>> On 1/8/2025 2:54 PM, Raag Jadav wrote:
>>>>>>>>>> Add hwmon support for temp1_input and temp2_input
>>>>>>>>>> attributes, which will
>>>>>>>>>> expose package and vram temperature in millidegree Celsius.
>>>>>>>>>> With this in
>>>>>>>>>> place we can monitor temperature using lm-sensors tool.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Raag Jadav<raag.jadav@intel.com>
>>>>>>>>>> ---
>>>>>>>>>>       .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 16 +++++
>>>>>>>>>>       drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  3 +
>>>>>>>>>>       drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  2 +
>>>>>>>>>>       drivers/gpu/drm/xe/xe_hwmon.c                 | 63
>>>>>>>>>> +++++++++++++++++++
>>>>>>>>>>       4 files changed, 84 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git
>>>>>>>>>> a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>>>>>>>>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>>>>>>>>> index d792a56f59ac..998cfb0ee1a6 100644
>>>>>>>>>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>>>>>>>>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>>>>>>>>> @@ -108,3 +108,19 @@ Contact:intel-xe@lists.freedesktop.org
>>>>>>>>>>       Description:    RO. Package current voltage in millivolt.
>>>>>>>>>>               Only supported for particular Intel Xe graphics platforms.
>>>>>>>>>> +
>>>>>>>>>> +What: /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp1_input
>>>>>>>>>> +Date:        April 2025
>>>>>>>>>> +KernelVersion:    6.15
>>>>>>>>>> +Contact:intel-xe@lists.freedesktop.org
>>>>>>>>>> +Description:    RO. Package temperature in millidegree Celsius.
>>>>>>>>>> +
>>>>>>>>>> +        Only supported for particular Intel Xe graphics platforms.
>>>>>>>>>> +
>>>>>>>>>> +What: /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_input
>>>>>>>>>> +Date:        April 2025
>>>>>>>>>> +KernelVersion:    6.15
>>>>>>>>>> +Contact:intel-xe@lists.freedesktop.org
>>>>>>>>>> +Description:    RO. VRAM temperature in millidegree Celsius.
>>>>>>>>>> +
>>>>>>>>>> +        Only supported for particular Intel Xe graphics platforms.
>>>>>>>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>>>>>>>>> b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>>>>>>>>> index 519dd1067a19..f5e5234857c1 100644
>>>>>>>>>> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>>>>>>>>> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>>>>>>>>> @@ -34,6 +34,9 @@
>>>>>>>>>>       #define PCU_CR_PACKAGE_ENERGY_STATUS
>>>>>>>>>> XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
>>>>>>>>>> +#define PCU_CR_PACKAGE_TEMPERATURE
>>>>>>>>>> XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5978)
>>>>>>>>>> +#define   TEMP_MASK                REG_GENMASK(7, 0)
>>>>>>>>>> +
>>>>>>>>>>       #define PCU_CR_PACKAGE_RAPL_LIMIT
>>>>>>>>>> XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>>>>>>>>>>       #define   PKG_PWR_LIM_1                REG_GENMASK(14, 0)
>>>>>>>>>>       #define   PKG_PWR_LIM_1_EN            REG_BIT(15)
>>>>>>>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>>>>>>>>> b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>>>>>>>>> index 0b0b49d850ae..8846eb9ce2a4 100644
>>>>>>>>>> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>>>>>>>>> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>>>>>>>>> @@ -21,6 +21,8 @@
>>>>>>>>>>       #define BMG_PACKAGE_POWER_SKU            XE_REG(0x138098)
>>>>>>>>>>       #define BMG_PACKAGE_POWER_SKU_UNIT XE_REG(0x1380dc)
>>>>>>>>>>       #define BMG_PACKAGE_ENERGY_STATUS        XE_REG(0x138120)
>>>>>>>>>> +#define BMG_VRAM_TEMPERATURE            XE_REG(0x1382c0)
>>>>>>>>>> +#define BMG_PACKAGE_TEMPERATURE            XE_REG(0x138434)
>>>>>>>>> indentation.
>>>>>>>> It's a git quirk, you won't see it in file.
>>>>>>>>
>>>>>>>>> Also you are using the same for DG2. Should have a common name
>>>>>>>> Just following the conventions.
>>>>>>> Did not find this convention in the file.
>>>>>>> BMG_VRAM_TEMPERATURE is used in both dg2 and bmg and has a bmg prefix.
>>>>>>> Doesn't seem right
>>>>>>>>>>       #define BMG_PACKAGE_RAPL_LIMIT            XE_REG(0x138440)
>>>>>>>>>>       #define BMG_PLATFORM_ENERGY_STATUS XE_REG(0x138458)
>>>>>>>>>>       #define BMG_PLATFORM_POWER_LIMIT        XE_REG(0x138460)
>>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
>>>>>>>>>> b/drivers/gpu/drm/xe/xe_hwmon.c
>>>>>>>>>> index fde56dad3ab7..5b5c844adf4a 100644
>>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>>>>>>>>> @@ -6,6 +6,7 @@
>>>>>>>>>>       #include <linux/hwmon-sysfs.h>
>>>>>>>>>>       #include <linux/hwmon.h>
>>>>>>>>>>       #include <linux/types.h>
>>>>>>>>>> +#include <linux/units.h>
>>>>>>>>>>       #include <drm/drm_managed.h>
>>>>>>>>>>       #include "regs/xe_gt_regs.h"
>>>>>>>>>> @@ -20,6 +21,7 @@
>>>>>>>>>>       #include "xe_pm.h"
>>>>>>>>>>       enum xe_hwmon_reg {
>>>>>>>>>> +    REG_TEMP,
>>>>>>>>> add to the end
>>>>>>>>>>           REG_PKG_RAPL_LIMIT,
>>>>>>>>>>           REG_PKG_POWER_SKU,
>>>>>>>>>>           REG_PKG_POWER_SKU_UNIT,
>>>>>>>>>> @@ -39,6 +41,11 @@ enum xe_hwmon_channel {
>>>>>>>>>>           CHANNEL_MAX,
>>>>>>>>>>       };
>>>>>>>>>> +enum xe_hwmon_temp {
>>>>>>>>>> +    TEMP_PKG,
>>>>>>>>>> +    TEMP_VRAM,
>>>>>>>>>> +};
>>>>>>>>> Can't the existing channel enum be used here?
>>>>>>>> Nope, that'd break the indexes.
>>>>>>> @badal/@karthik Are multiple indexes for the same channel okay?
>>>>>>>
>>>>>>> In the current code, for dg2 only channel 1 is exposed for power and
>>>>>>> channel 0 skipped. Something like that needs to be done here too?
>>>>>> Thanks for looping me in this. Yes, Channel 0 represent card specific
>>>>>> attributes and Channel 1 represent package specific attributes. That's how
>>>>>> it should be followed.
>>>>>> With that BMG_PACKAGE_TEMPERATURE should go under CHANNEL_PKG. For
>>>>>> BMG_VRAM_TEMPERATURE new channel (channel 3) should be added in enum
>>>>>> xe_hwmon_channel.
>>>>> And how does that work with hwmon_channel_info?
>>>> Check curr_crit implementation.
>>>> HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL)
>>> Exactly, and hence the separate enums for temp channels.
>>
>> No, we want temp2_input for package (channel 2) temperature and temp3_input
>> (Channel 3) for VRAM temperature.
>> Just for information, in i915 we create separate hwmon node for each layer
>> i.e. package, gt0 and gt1. During review of xe hwmon implementation upstream
>> architect recommended that there should be single node for a device. So we
>> are using channel based approach. So lets stick to that approach.
> And what about fan channels? Are they to be indexed from 4 and on?
> I'm not sure if we'd want to abuse hwmon_channel_info in such a way.
>
> Raag

Hi Raag,

We have adopted a hierarchical approach for HWMON channels and their 
entries. Channel 1 is designated for card-related information, while 
Channel 2 is used for package-related information.
If new HWMON data does not fit within these channels, we can create a 
new channel and assign an appropriate label to it.
For instance, you can map package_temperature under temp2_xxx. Since 
there is no temperature data for the card, temp1_xxx can be made invisible.
For VRAM temperature, add CHANNEL_VRAM, which will be temp3_xxx with the 
label temp3_label set to “vram”.

Regarding fan channels, based on our offline discussion, it appears that 
fan data does not fall within the above mappings and pertains to the 
entire card.

For it we can have a separate enum like,

*enum xe_hwmon_fan_channel {*

* FAN_1,*

* FAN_2, *

* FAN_3 };*

for that, with label "card" for all those.

--------------Zs0PCeu5jSvyOvZc1mu0Tld0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 25-01-2025 12:44, Raag Jadav wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Z5SPWwiB15ptK4hR@black.fi.intel.com">
      <pre wrap="" class="moz-quote-pre">On Fri, Jan 24, 2025 at 09:37:55PM +0530, Nilawar, Badal wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 24-01-2025 20:50, Raag Jadav wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On Fri, Jan 24, 2025 at 08:27:14PM +0530, Nilawar, Badal wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 24-01-2025 18:03, Raag Jadav wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On Fri, Jan 24, 2025 at 05:29:16PM +0530, Nilawar, Badal wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">On 24-01-2025 11:46, Riana Tauro wrote:
</pre>
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">Hi Raag

On 1/23/2025 8:21 AM, Raag Jadav wrote:
</pre>
                  <blockquote type="cite">
                    <pre wrap="" class="moz-quote-pre">On Tue, Jan 21, 2025 at 01:56:05PM +0530, Riana Tauro wrote:
</pre>
                    <blockquote type="cite">
                      <pre wrap="" class="moz-quote-pre">Hi Raag

On 1/8/2025 2:54 PM, Raag Jadav wrote:
</pre>
                      <blockquote type="cite">
                        <pre wrap="" class="moz-quote-pre">Add hwmon support for temp1_input and temp2_input
attributes, which will
expose package and vram temperature in millidegree Celsius.
With this in
place we can monitor temperature using lm-sensors tool.

Signed-off-by: Raag Jadav <a class="moz-txt-link-rfc2396E" href="mailto:raag.jadav@intel.com">&lt;raag.jadav@intel.com&gt;</a>
---
  &nbsp;&nbsp; .../ABI/testing/sysfs-driver-intel-xe-hwmon&nbsp;&nbsp; | 16 +++++
  &nbsp;&nbsp; drivers/gpu/drm/xe/regs/xe_mchbar_regs.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 +
  &nbsp;&nbsp; drivers/gpu/drm/xe/regs/xe_pcode_regs.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +
  &nbsp;&nbsp; drivers/gpu/drm/xe/xe_hwmon.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 63
+++++++++++++++++++
  &nbsp;&nbsp; 4 files changed, 84 insertions(+)

diff --git
a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index d792a56f59ac..998cfb0ee1a6 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -108,3 +108,19 @@ Contact: <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
  &nbsp;&nbsp; Description:&nbsp;&nbsp;&nbsp; RO. Package current voltage in millivolt.
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Only supported for particular Intel Xe graphics platforms.
+
+What: /sys/bus/pci/drivers/xe/.../hwmon/hwmon&lt;i&gt;/temp1_input
+Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; April 2025
+KernelVersion:&nbsp;&nbsp;&nbsp; 6.15
+Contact:&nbsp;&nbsp;&nbsp; <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
+Description:&nbsp;&nbsp;&nbsp; RO. Package temperature in millidegree Celsius.
+
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Only supported for particular Intel Xe graphics platforms.
+
+What: /sys/bus/pci/drivers/xe/.../hwmon/hwmon&lt;i&gt;/temp2_input
+Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; April 2025
+KernelVersion:&nbsp;&nbsp;&nbsp; 6.15
+Contact:&nbsp;&nbsp;&nbsp; <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
+Description:&nbsp;&nbsp;&nbsp; RO. VRAM temperature in millidegree Celsius.
+
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
index 519dd1067a19..f5e5234857c1 100644
--- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
@@ -34,6 +34,9 @@
  &nbsp;&nbsp; #define PCU_CR_PACKAGE_ENERGY_STATUS
XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
+#define PCU_CR_PACKAGE_TEMPERATURE
XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5978)
+#define&nbsp;&nbsp; TEMP_MASK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REG_GENMASK(7, 0)
+
  &nbsp;&nbsp; #define PCU_CR_PACKAGE_RAPL_LIMIT
XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
  &nbsp;&nbsp; #define&nbsp;&nbsp; PKG_PWR_LIM_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REG_GENMASK(14, 0)
  &nbsp;&nbsp; #define&nbsp;&nbsp; PKG_PWR_LIM_1_EN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REG_BIT(15)
diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
index 0b0b49d850ae..8846eb9ce2a4 100644
--- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
@@ -21,6 +21,8 @@
  &nbsp;&nbsp; #define BMG_PACKAGE_POWER_SKU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_REG(0x138098)
  &nbsp;&nbsp; #define BMG_PACKAGE_POWER_SKU_UNIT XE_REG(0x1380dc)
  &nbsp;&nbsp; #define BMG_PACKAGE_ENERGY_STATUS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_REG(0x138120)
+#define BMG_VRAM_TEMPERATURE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_REG(0x1382c0)
+#define BMG_PACKAGE_TEMPERATURE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_REG(0x138434)
</pre>
                      </blockquote>
                      <pre wrap="" class="moz-quote-pre">indentation.
</pre>
                    </blockquote>
                    <pre wrap="" class="moz-quote-pre">It's a git quirk, you won't see it in file.

</pre>
                    <blockquote type="cite">
                      <pre wrap="" class="moz-quote-pre">Also you are using the same for DG2. Should have a common name
</pre>
                    </blockquote>
                    <pre wrap="" class="moz-quote-pre">Just following the conventions.
</pre>
                  </blockquote>
                  <pre wrap="" class="moz-quote-pre">Did not find this convention in the file.
BMG_VRAM_TEMPERATURE is used in both dg2 and bmg and has a bmg prefix.
Doesn't seem right
</pre>
                  <blockquote type="cite">
                    <blockquote type="cite">
                      <blockquote type="cite">
                        <pre wrap="" class="moz-quote-pre">  &nbsp;&nbsp; #define BMG_PACKAGE_RAPL_LIMIT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_REG(0x138440)
  &nbsp;&nbsp; #define BMG_PLATFORM_ENERGY_STATUS XE_REG(0x138458)
  &nbsp;&nbsp; #define BMG_PLATFORM_POWER_LIMIT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_REG(0x138460)
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
b/drivers/gpu/drm/xe/xe_hwmon.c
index fde56dad3ab7..5b5c844adf4a 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -6,6 +6,7 @@
  &nbsp;&nbsp; #include &lt;linux/hwmon-sysfs.h&gt;
  &nbsp;&nbsp; #include &lt;linux/hwmon.h&gt;
  &nbsp;&nbsp; #include &lt;linux/types.h&gt;
+#include &lt;linux/units.h&gt;
  &nbsp;&nbsp; #include &lt;drm/drm_managed.h&gt;
  &nbsp;&nbsp; #include &quot;regs/xe_gt_regs.h&quot;
@@ -20,6 +21,7 @@
  &nbsp;&nbsp; #include &quot;xe_pm.h&quot;
  &nbsp;&nbsp; enum xe_hwmon_reg {
+&nbsp;&nbsp;&nbsp; REG_TEMP,
</pre>
                      </blockquote>
                      <pre wrap="" class="moz-quote-pre">add to the end
</pre>
                      <blockquote type="cite">
                        <pre wrap="" class="moz-quote-pre">  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REG_PKG_RAPL_LIMIT,
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REG_PKG_POWER_SKU,
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REG_PKG_POWER_SKU_UNIT,
@@ -39,6 +41,11 @@ enum xe_hwmon_channel {
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CHANNEL_MAX,
  &nbsp;&nbsp; };
+enum xe_hwmon_temp {
+&nbsp;&nbsp;&nbsp; TEMP_PKG,
+&nbsp;&nbsp;&nbsp; TEMP_VRAM,
+};
</pre>
                      </blockquote>
                      <pre wrap="" class="moz-quote-pre">Can't the existing channel enum be used here?
</pre>
                    </blockquote>
                    <pre wrap="" class="moz-quote-pre">Nope, that'd break the indexes.
</pre>
                  </blockquote>
                  <pre wrap="" class="moz-quote-pre">@badal/@karthik Are multiple indexes for the same channel okay?

In the current code, for dg2 only channel 1 is exposed for power and
channel 0 skipped. Something like that needs to be done here too?
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">Thanks for looping me in this. Yes, Channel 0 represent card specific
attributes and Channel 1 represent package specific attributes. That's how
it should be followed.
With that BMG_PACKAGE_TEMPERATURE should go under CHANNEL_PKG. For
BMG_VRAM_TEMPERATURE new channel (channel 3) should be added in enum
xe_hwmon_channel.
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">And how does that work with hwmon_channel_info?
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Check curr_crit implementation.
HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL)
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Exactly, and hence the separate enums for temp channels.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">

No, we want temp2_input for package (channel 2) temperature and temp3_input
(Channel 3) for VRAM temperature.
Just for information, in i915 we create separate hwmon node for each layer
i.e. package, gt0 and gt1. During review of xe hwmon implementation upstream
architect recommended that there should be single node for a device. So we
are using channel based approach. So lets stick to that approach.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
And what about fan channels? Are they to be indexed from 4 and on?
I'm not sure if we'd want to abuse hwmon_channel_info in such a way.

Raag</pre>
    </blockquote>
    <p>Hi Raag,</p>
    We have adopted a hierarchical approach for HWMON channels and their
    entries. Channel 1 is designated for card-related information, while
    Channel 2 is used for package-related information.<br>
    If new HWMON data does not fit within these channels, we can create
    a new channel and assign an appropriate label to it.<br>
    For instance, you can map package_temperature under temp2_xxx. Since
    there is no temperature data for the card, temp1_xxx can be made
    invisible.<br>
    For VRAM temperature, add CHANNEL_VRAM, which will be temp3_xxx with
    the label temp3_label set to “vram”.<br>
    <p>Regarding fan channels, based on our offline discussion, it
      appears that fan data does not fall within the above mappings and
      pertains to the entire card.</p>
    <p>For it we can have a separate enum like,<br>
    </p>
    <p><b>enum xe_hwmon_fan_channel {</b></p>
    <p><b>&nbsp;FAN_1,</b></p>
    <p><b>&nbsp;FAN_2,&nbsp;</b></p>
    <p><b>&nbsp;FAN_3 };</b>&nbsp;</p>
    <p>for that, with label &quot;card&quot; for all those.<br>
    </p>
    <blockquote type="cite" cite="mid:Z5SPWwiB15ptK4hR@black.fi.intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------Zs0PCeu5jSvyOvZc1mu0Tld0--
