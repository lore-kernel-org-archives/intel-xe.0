Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED856C5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 18:43:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA8410E032;
	Tue,  3 Jun 2025 18:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="klXVN/8h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD83210E032
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 18:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748976180; x=1780512180;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NsJpK1kD06p+R5m2agb3CjYTXWV7Beyn5aplgJfZHSE=;
 b=klXVN/8h8xHniiOHNhbEMUqxmxxA3o6QtOfwWNXYY3Z9rap73Nano+Tf
 88oVJTaAG06+GTc4Ms5VH7m3w6qsBJ16CsxoxQM/uOEeG0yammJ/6Yqgt
 ANvIottHgVLijTryThzqVMySQa813WsvPAXgV7L5nK4EbcKWmxUEE29jC
 lrYzLHPPMkRT0nVc11XoljgIA0rAhDU7CWP8oZp6ZzHHceWcrwCM0Doe6
 IZQgdZzZVbZ6kn5Iw24yRvFcKJ5rDuGatG4Op3k81+mHNMt2W/oe6WhDW
 cX1X6K2rCenInI+hoCU1wODtzEjeMZ6SrCEpNLnA8EvQ0nOAVl1c9hYkv A==;
X-CSE-ConnectionGUID: ssrRYr5oRn+ftBmYCVm56Q==
X-CSE-MsgGUID: 81rcEDWURxeY80Hx3WiXmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62389957"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="62389957"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:43:00 -0700
X-CSE-ConnectionGUID: 4qJMhoSRQveI04847Aax4Q==
X-CSE-MsgGUID: eDJV8reVR4OqKq4DhYTyWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="144968784"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:43:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 11:42:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 11:42:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.74)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 11:42:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YItELByLTXb/JkKaQXg2xzBY7mG6fCUHiHiLX4vHPSqxIe7YoNTYFpy8BSGIheibhmaNopU5za8qas2U7Rs8LLsPXvuFXsXfGYL7u0SUsbrVtuI9FQ1xdJeuWqJlR/e8xBKSVpp2A7qI/+dW9FJQGlPhOWf9NCa1Fy4WSMfHcnoL48MX16utNdDYy9YT9iSaLkJhdYrT3Oagdaj7dAR3DbipploKNwk8kZ2rVE0TvVOh1C8MgWgTJe2hUN7HvX/huGBUg34D4s6/8yJGEzFATseseVnGjxeCbhTqnTgEqy2DeyvOqoTQ+Z2V/cbZpAClMsVM18twWGhfAJrEioejlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gn/qilKP4O+UZ10y9SqvxXkoo0v/ufxY7yoxKmIXSOs=;
 b=Oxn3P53VimG1mVX7RpOPFZEYt0g7wM6vnrMaeScKihcFyFl02nOKZcFcChnoS3FUWp3Qkeops8LnlR03RZzEctaNdC/RaSFftqfroOGnxDeAmvti604B2nD0r2nzUp0iGazike577wOoEffWDNsUPUl9b0XIbWqLtGlET+GvsRYF7ySeXObTnDeKwncfUr0Qae/tnZGNIhcQW7uKsjziPFrPFkOqws6LCpOSR/U7TZeF+zoftIDGVUYqhncgkROwjBzIMzS4aMo1OAe2BBklTHPdDAFH+DW0EY106lQwI40jWllCEGhnGbfCUb/w5wIKzBY6rDdhVN2KGGYoUiR7Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Tue, 3 Jun
 2025 18:42:56 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.8769.022; Tue, 3 Jun 2025
 18:42:56 +0000
Message-ID: <5f735205-387b-4a60-91ff-757747b4275a@intel.com>
Date: Tue, 3 Jun 2025 11:42:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/xe/guc: Ignore GuC CT errors when wedged
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
References: <20250602234415.2015921-1-vinay.belgaumkar@intel.com>
 <20250602234415.2015921-3-vinay.belgaumkar@intel.com>
 <11b5e74326ea99b8d809e5018621bbbf3383b6df.camel@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <11b5e74326ea99b8d809e5018621bbbf3383b6df.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0112.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::27) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|IA0PR11MB7752:EE_
X-MS-Office365-Filtering-Correlation-Id: 18cdf987-c162-4d8e-c70a-08dda2ce74fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U253RU5sQTVINURmbDh5ekYyMkl6MmY2MWhEa1l6citmdTNMMncxYndSblU3?=
 =?utf-8?B?RWxVNXUrR2lTbTlyeURlZkQxVVlTYjUwVnAvN1MxOWp4SSsvK2F4TTJva1F4?=
 =?utf-8?B?ZzZ5dW5tUzNSS2szQ0VwZThDQjdsdUJQY2x4aUIvMUYwT0libitNRDFsTTFv?=
 =?utf-8?B?VmFUWnFoZWoxbWpmc2pDeXpZOFBhS0lsMFpuOEdqODhLVXlzMW02L3lLcFpJ?=
 =?utf-8?B?ZlNYUi9RSmpmL2cxVGRNeEJsakZMeGQ2V0tCNjFzcW01Q0NvU24wTG5sY3VI?=
 =?utf-8?B?SFlIRXVoWVB6THhzT0NEN0RWWjM3MTVvd0VhRWNEYTBsQmF4UFRBMk52LzZv?=
 =?utf-8?B?NUd5emk5Q05FOXRoUVZEWE1jUkVNR05RdHNFVzlOaGNBcEJIcStWb3NQa0l5?=
 =?utf-8?B?S1B2WkxMTE1aZmV6bHUvUzUxbVZYY1hodjlvS29xSS9ZT2NXeVd2QWFhbmN4?=
 =?utf-8?B?YmNPb01HaUI5Z0VOV2ZUeittWFpHam0vbzBWZ2RJV1FHWHRua1g5SDdwUHFD?=
 =?utf-8?B?aHllWDhoMmtLL2k4NXBLc2VodkIvRmtyMXNvbS9ZazA1a1MzWjVOc0d4aVRy?=
 =?utf-8?B?TWRxdEJpcThYWnNuckUyeTBMWlBOWDZHUlJ1NTVIVkFLbUFhWmRjY3ZrZ0hB?=
 =?utf-8?B?QmR2RzhzcW5MeFptSTJOUXdrUjhZNUdIdHJFUi9teFFUWG9ycVg0citJSGIy?=
 =?utf-8?B?dUlZMUNDOVI5ODJSUHlic3ZQRTBNcUFpVUZWUUczaUI1dWxEMmNjd0hWRmdT?=
 =?utf-8?B?L3JzVDl3V0tlQ2c4OE5QK0o2cENXVm9nczdEbGdBZytOblhBVU42YmphQ09q?=
 =?utf-8?B?WDNTSFdHYThTdG4zSC8ycklMRjZadVJjMXgxTFA1WXpDV1F0Z1lrV3V2aDhh?=
 =?utf-8?B?amFEUDRiU05FTVJpNzNaMDN2Y2lHVGpBY3p5ZnUyNW1BQ2xkUlFKSmJZODFC?=
 =?utf-8?B?bUFCSzR0dWFSUDl2MjJ6UkxTRWUvMTZ3b01uN2xTQ21BMk41QUo3NytLT0ow?=
 =?utf-8?B?VExXZmNVQUlITndqTHpOMHhhR3FMd3R6OWhkQUc0cjdQM0dnWWcyRHdpSVRs?=
 =?utf-8?B?MmVrTGc0UHdqY0VMUUxWR3RBOEJEQTBsUEgvVEwzQ0V4MS82RmRENnRxNVBY?=
 =?utf-8?B?Y0k3M1VVd20yYW5YZXkvWjBkQXVGMEZ3OVY4M0tCVVJYZ0FCTGRLYW9Jaktt?=
 =?utf-8?B?ZFZHUm50bmdTdWJUd1lSOUZ3Z1k5b1hFaEpGOGhPb3hlR0JlaVNyUzMxdXJC?=
 =?utf-8?B?aVlZUW1idXQvYU5GWUFQdExZYlhQZVBxQWY2RzdweUloUC9tNXV2VnpzKzY5?=
 =?utf-8?B?eWl2ZU1pazBSMnhydlNNbEhNaDZsOWFXSUxjQXpKenJjUkdZV21UNGlWMWVC?=
 =?utf-8?B?cStuVXh4V3dBYzBGR244aUdEYkdUU0QxSXBsNXI2RXRYb3lVempWZlFUbUtv?=
 =?utf-8?B?Q2gybXZDSC9rOTh0amtLZXJZSVc1b09TVHkyOW1DNkNMTVJiN2VUUCtjVHF4?=
 =?utf-8?B?Ty9QN3VJYk5TbWFDb2VENE80QUVjTDM3OXdWbkVIaTN0NE1ZQnJGRytEYmVq?=
 =?utf-8?B?THZZRU1yQmxZWWdxQmgrZ1FhRlFhZFFNTVN5VW9UU2Q1dDZIV29WMW9sK3o1?=
 =?utf-8?B?a0lpbHB3ZXN0bUZUb3BXcCtjRlh0VGE3ODJSU1hJSnVMb0ZZbDFaZ2NuWXRh?=
 =?utf-8?B?ZWg4OU1lcHdjZXJBV2RqY0FNTUIyMVdZSFZCSTA5Z0xBL04yTTI0ckQ3WVdw?=
 =?utf-8?B?RUlJV29LaXhRVTFnWDAyTGFVS0Ztc3g3eGJPaGhzaExpM2prS0F6ZmhUUzZT?=
 =?utf-8?B?YUFRaSs0TWpGenZvanNZZGhlejFmTUk4eDNISU42V2V3QWJKTHdPUzl0WnBv?=
 =?utf-8?B?STRHUzk4Zy92TzU1NE5nRmdFZ2lEcEFBVGc3ODV4eWFiZ2FHazE0d2tpbFdu?=
 =?utf-8?Q?Te8ZFTRti24=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjRGNFZ2dUUvTEtmNTUrb21pNExXV3ErWThyNkxHaGVaYzhzbHhiTEhJL2tZ?=
 =?utf-8?B?OVllVVpwSEcycmEvN2NLalRXTXdPRDN1RkFJM0dMeDd0T2hXRU5SSFV0UWoz?=
 =?utf-8?B?TWtWSUxNZ3llUWF0dURSY2k5Skw4cWZXa2ovamd4QjBQaCtORXJ1aE0veVNq?=
 =?utf-8?B?dVZmeWRZOUF3Ym01UEU1N3UrdGxkOVJNRmxBb2N0RkNrMVFBdVFORVVFbEtl?=
 =?utf-8?B?MlZHdnpaVGc1d010cTcwTzRva0VPb0VZdzVzNmhjd3JjRTJ5V3Raa0lUNE1K?=
 =?utf-8?B?aW1IaTkxV0xraW9vV2R5c2RZRStRQWwvUU9EcHNyTS8rYVRNclR6RytMQVVS?=
 =?utf-8?B?aC8vMkFOVzUvMlpiSmFYRmw0eDJVZ09QSzRSNm1KL2JhdWxTaExyRGJRYzBU?=
 =?utf-8?B?YTBrbVpJNzB3ZTR2NVF2Qmt1eU1ZNUYxVElDKzBBNk9lSzN2ZjlwdkR2TzdM?=
 =?utf-8?B?aGlCUWRKTHRrMzZxdTdmSnU4aGY0b1BNaVYySUxYd3VJUGJlSFgzRVY4b0sy?=
 =?utf-8?B?NFJheGQrVkpTMjEwT0NMSFY2a25yUHVIN0x3R3lLb2pBVEZ4ZVRCdTlpcUlL?=
 =?utf-8?B?L1E5RGtRRlFCNUd4dXhxLy9FaTIrMVEyR1ltRk5lcXRiQUQ0STZsMEI2QzB3?=
 =?utf-8?B?aVJPODZjcDhHbkgwRUlpZURBcUhEVTlOWHlvekU0SjZDZkJwaC8valh1QW5Z?=
 =?utf-8?B?RDdRVXJPYTNYSVBLN3dwSE91cTQ5NTlsY01YVm9CWXF5cnhuV2Y2Q0hFOFZs?=
 =?utf-8?B?UlBlVTk5YU9CQjVPNXBVa1NCNjlwNHNIWnJtWGgvRHRpSllFVENwWnI2a3A3?=
 =?utf-8?B?ei96SjZScysvN0VPMDlENUFadW4rbnJFMGF3dWVPOWFQRThJb25wMGFHU0Zh?=
 =?utf-8?B?Y0xMWmV0clpuM2RIaXhGYmtUdmZ6TmZTNUE0Yk1PMlJPak81L2RrYnBKK2xB?=
 =?utf-8?B?MFR0V29XNGpMN2M0SW5ESW5SUXFoaEZZTkgyc3VyYVNIeTNlTU1RRE9jN1JY?=
 =?utf-8?B?RnRwM0xUTkdSSmZqN0FzL2FvbFR3c09zTTN3M1RYZVgwdnFkcllGbE4vNW00?=
 =?utf-8?B?VlRiNm82TDBlVUlQaVlpSGV0RmIyQ3hFOStnM3NzZkd4Sld2SEFQaHdLTUVP?=
 =?utf-8?B?VFBvK2dwVUJiekhYWHNvbVpJbTdYaXRURTZsU0ZEWjB0QU1KRzNKaFpQZlZB?=
 =?utf-8?B?eUxIMkQ0aE9sSUJGZTRFRTJlcXVQdGxQenZ4dTNkakR2YjNDaU9ZS1ZsOU5K?=
 =?utf-8?B?dG9QOEN0Nm9LcnlYWFZJZGM2bGJucFRFQktzampIZVZUOHN0Z2l0cjk5dnBt?=
 =?utf-8?B?V1B1eHV2elUrZlk1dmV0ak1MZHo4UWd3VTFMaTl3RmhpSEVkQ1g0UklTTkpP?=
 =?utf-8?B?L3cydDc0SjNndzZlN21HcG94QU91ZUNFK1BXUmlvUHV1czlPWWNwNzRVTjkw?=
 =?utf-8?B?OUtxMHFUekhyTENIVHBEbldVczFjQnFlbXpUSXl6NGtZVGUvN08yc0MzcEV0?=
 =?utf-8?B?MWQxMmVGUGJLdExMd3ZtdXNjYWFoMmQrRlV5TGx6NGZaY21HMk9KVkZxeUNp?=
 =?utf-8?B?ZWtSTlZjOStvY1o1TElyNG1xL25mcUQzZ0xYanlnMVgrWUQ2SDBNcklzWkMv?=
 =?utf-8?B?NE1UekVMNVJHNCtyTUZNZ29CcHlTNDFwVi9NZm00RXZHT3BHL01YUnAyQ3BM?=
 =?utf-8?B?ZzUvQVBJUUFYZUxqdHZROU5GTkNKY0hHdDc3OUdUMVFRdlNtVlNJVENESVRT?=
 =?utf-8?B?ejYrT0ovRjk1Q1J6Nnc1MXJXSWhsMmIwQjhoMDlsNitMTUVRVWFlNElqa0ZZ?=
 =?utf-8?B?NndUQVhvQkpCL3k4UzA3bmJDK2ordldyaHBPSWJ6Y25VZjFEYVd0UjF0dVho?=
 =?utf-8?B?MFltbzJkYmw0WENOU2xtQ3pTaE1pWDdMMTBpM2tnOXJjeDZlWUhiREJrR1hB?=
 =?utf-8?B?S0VIRVFUTUZaWCtGR0ZhbTVYa0ZnTjRKUXFJMC9walZmVVZlMjZUU0VqVDg3?=
 =?utf-8?B?VlpFeFVlc1JxckNYMHRkWHNmNTNXQXFQeUVFT0E5aEltanEvS2V1UTlibTN6?=
 =?utf-8?B?Zm9yYVZvSjlQNlBONWk0V3BLaHVkVUI4R04zTEFqTWgzOUlrU2h4SVNrSm5E?=
 =?utf-8?B?Z3Bsazg4d1IwRmttbjdBTGh3Y2lTdmx1Wi9LUURPYWM1MXhpTXR2UlJSMnBx?=
 =?utf-8?B?M3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18cdf987-c162-4d8e-c70a-08dda2ce74fd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 18:42:56.7877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4RsGxFVL65dN36oii0pAeL1eHukEP8wAwDlI20FnHHTxF5nszPzV68xHP7UZiJuufQ3+VffOtkAXzhRFNGY/4t2g5O4x7T5d9eQSQJBEdRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7752
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


On 6/3/2025 10:34 AM, Summers, Stuart wrote:
> On Mon, 2025-06-02 at 16:44 -0700, Vinay Belgaumkar wrote:
>> Messaging to GuC may get canceled when device is wedged. Don't
>> flag this as an error in xe_guc_pc code.
> So if we're wedged already we are already in an error state right? I
> can understand flagging additional errors maybe gives a false negative,
> or rather would prompt us to look at the earlier errors to make sure
> these aren't just cascading, but do we really need to check for this?

Yes, to avoid flase CI errors. This was actually for a CI failure seen 
in the previous patch.

Thanks,

Vinay.

>
> Thanks,
> Stuart
>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index cb0563494fcc..793df3486d1f 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -154,7 +154,7 @@ static int pc_action_reset(struct xe_guc_pc *pc)
>>          int ret;
>>   
>>          ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>> -       if (ret)
>> +       if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -
>> ECANCELED))
>>                  xe_gt_err(pc_to_gt(pc), "GuC PC reset failed: %pe\n",
>>                            ERR_PTR(ret));
>>   
>> @@ -178,7 +178,7 @@ static int pc_action_query_task_state(struct
>> xe_guc_pc *pc)
>>   
>>          /* Blocking here to ensure the results are ready before
>> reading them */
>>          ret = xe_guc_ct_send_block(ct, action, ARRAY_SIZE(action));
>> -       if (ret)
>> +       if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -
>> ECANCELED))
>>                  xe_gt_err(pc_to_gt(pc), "GuC PC query task state
>> failed: %pe\n",
>>                            ERR_PTR(ret));
>>   
>> @@ -201,7 +201,7 @@ static int pc_action_set_param(struct xe_guc_pc
>> *pc, u8 id, u32 value)
>>                  return -EAGAIN;
>>   
>>          ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>> -       if (ret)
>> +       if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -
>> ECANCELED))
>>                  xe_gt_err(pc_to_gt(pc), "GuC PC set param[%u]=%u
>> failed: %pe\n",
>>                            id, value, ERR_PTR(ret));
>>   
>> @@ -223,7 +223,7 @@ static int pc_action_unset_param(struct xe_guc_pc
>> *pc, u8 id)
>>                  return -EAGAIN;
>>   
>>          ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>> -       if (ret)
>> +       if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -
>> ECANCELED))
>>                  xe_gt_err(pc_to_gt(pc), "GuC PC unset param failed:
>> %pe",
>>                            ERR_PTR(ret));
>>   
>> @@ -240,7 +240,7 @@ static int pc_action_setup_gucrc(struct xe_guc_pc
>> *pc, u32 mode)
>>          int ret;
>>   
>>          ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>> -       if (ret)
>> +       if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -
>> ECANCELED))
>>                  xe_gt_err(pc_to_gt(pc), "GuC RC enable mode=%u
>> failed: %pe\n",
>>                            mode, ERR_PTR(ret));
>>          return ret;
