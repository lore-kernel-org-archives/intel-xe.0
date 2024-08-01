Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCDEC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 10:04:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7CE10E8E3;
	Thu,  1 Aug 2024 10:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AHkz6FNg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A31C10E8E3
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 10:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722506649; x=1754042649;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Yn14YDgWNl+krOM5chYj6K554I1HJgp2p+voAkmb+u4=;
 b=AHkz6FNg7kOVISBuzuFe+EDBRYlBF+EP0ftEMtsAqvZZyYXq9WOsfscI
 s7bFz1zJ885oDxfik093XYb0UdkQXc/zQLJh4XhMjNBYDbMck2v3UF5XG
 H5ai8U3eXDejq66UFssh2dwfl1iea5eDzwsQpe7D+P6rJhJ15IvmA8TtU
 7cgs3wzDiLmrALwjIR5FdQv8SuOnzzSilJVIA7bJGbKcVDaLOzLkcEGNG
 wuuHj57QaH60dw+/I03oP23FdoGVcgtfBPBxljLUbXTJXApVFHR3hXhyN
 La3nnVfEDOz6m2j671wyYzW+W+WTOoBZRV2tjrsoD8/Jy6plYxCLvaT1u g==;
X-CSE-ConnectionGUID: xsTbYfpnRC6aPmNyUGjusw==
X-CSE-MsgGUID: MtpJLKg+RHiZCjOoVC2R1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="37915179"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="37915179"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 03:03:48 -0700
X-CSE-ConnectionGUID: lGJH27dkRteyvddlvwQ9BQ==
X-CSE-MsgGUID: IArvb09GR0mnfomHQAAiSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="54900009"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 03:03:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 03:03:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 03:03:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 03:03:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 03:03:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sSNCy7Kv3b37Jo4V4gX52xBCOFj7TgavSjZ5hXgJ2xb7dFJhSxLu3ETyVjVPFH8ULh/9gJY6BuSX+HA35ud4nppsaxhF+SzEbB2UG5tic+tDMVY64kUg0kewcYVQJaP9XrAGiuAkXro4yCAgW1pDmM9KvOKtA8+76KbM5HzU67z20H8sjMMP7og2mX8AhnE2XNTy6J/A9UIS5/4e9tIT6BiJg2OMg6IxTqIUBfZmGuCqSerifQSsDAItdtwgMgOpnmy0c48PWgV64+x2+8GUBaOtArnd+mInvwWhDhYQNmBrlf9mjPJh21Djpd3yCN13Y2zi+RVZ/P1boHIZmgt+PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=183g2YJ6aXwFHQeqgnb+92J53IJCpwltRodHH1FXzx8=;
 b=QYraDQ1GBk2UOYhiEpZGKoS9lOhmtbhDx1ZC23LlzMoz4pngN6dog1hDdttAVexqnStC9e5L/kNo68+cf7iteSwVVijjbDQTocRuHlaJgo5y9ESARmxsu0ag1GKl8rzrv9VITaeVEWgGgm+Gk7DdscMQvCsfRpQrxKOcDzhmUbkIkEBOIKG9j3Nij8zKtPmSgwe+oo3sP36HorzDTUHp6BMx7vPuxsbujzQX/i8c8+P2UAgAIn0YU5GQjCX9FPQyHGNz55RuvbplgWzTaRY4YQNTTH+sOp81eTu2/gaSSv2+xGxrpmBOYo79y85nn16fypzgBJmLfZAv5A7HJLw5Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA1PR11MB8246.namprd11.prod.outlook.com (2603:10b6:208:445::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.30; Thu, 1 Aug
 2024 10:03:44 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 10:03:44 +0000
Message-ID: <8f3bb44d-fdd7-45ae-8b46-2a41fb5ed45d@intel.com>
Date: Thu, 1 Aug 2024 15:33:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/xe_gt_idle: add debugfs entry for
 powergating info
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <matthew.d.roper@intel.com>
References: <20240801095305.1209046-1-riana.tauro@intel.com>
 <20240801095305.1209046-3-riana.tauro@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240801095305.1209046-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::18) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA1PR11MB8246:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e7920a5-6105-4ccb-83aa-08dcb2113a31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUdYM0d3a2xIZzM4dUlORG5TOWlpNVl0Q2IyZHZYbDlpQ3RUNUtCTWdqbGc0?=
 =?utf-8?B?NVlkZEFCcEllbWNZVnM0bkNsVnRzeW4zdVc5cjVRT1BYbFAwVU1sT3FZZXVO?=
 =?utf-8?B?K3hxZWI0eFo5LzBXRlFGRjZZOU50TDFISTk5MllRdkdySU1ZRVFFOTJPM2xE?=
 =?utf-8?B?bjczcTdVdjZSVUViSHVGR3k4ajVRa0lpeHpOTDFuaW1tWjVaZ0t2TDRoSVlp?=
 =?utf-8?B?UzBUV25UUG9BSlgxUCtPS1MwbjFEeEJkR2NIRTE2R3R3MHAwY0NxQzFET0tL?=
 =?utf-8?B?YXU2TDd2TUU2OUFNUS9PT2hMZlY0ekFpVTNRLzhqK0xCcldIMGlYcTlRajNy?=
 =?utf-8?B?bzRzWFJ4OHRRdi90RDdEZzZTeCsxaml5eGs1Rmp6YjBjRENSOVByZGpMN1lX?=
 =?utf-8?B?ZnF1TGxsaGZCcWJSSXluUWgvOElScFkvQ2d4UXdiMXI3dklKUUJpZUJOL0FL?=
 =?utf-8?B?S3gxU2JyUitpTU9DVGo1Tmd4NEE3REExNWNneUZrZVFMa2lvb2lrMG0wTnYy?=
 =?utf-8?B?bHRpOS83Y1NuQituMldBMDMvUUZIVnR6TFdxS0xXNUMzRlEwSGZiaGsyb3dp?=
 =?utf-8?B?RE50c2EyY1F5KzM2dmFYUW5wWi9Wc3RYVGRNOWQxbWd2ZXI4ZHNrZ3FudW5h?=
 =?utf-8?B?MUJoRDV6NTNhbDZCTW9EeVp6Nk9kb3ZoQk1oTEhzbU05OStPbStScUlISm9n?=
 =?utf-8?B?WUJVdG0wNjcwM1QzSGZMNEl5eE8vKytBZXRJSEpkUjYvVkd5b2VtR1ZZcUN2?=
 =?utf-8?B?Y2dFWXp4bW9PdDNqVXpKWW4zcCtLZ2orOUZsVWFBM2taWEtyc21PeWhGaThS?=
 =?utf-8?B?VUJ4citPN1o0aXZQREtxQVVVMFBPMENLN1JtY1g1RnJPR2xnWTJUM1N4NDh1?=
 =?utf-8?B?OW9lUVdYbjdpNVY1VXpqUXZiRFRQZzd3QmQ5VVNNMGFkOCt4SnBHRGU5RnBY?=
 =?utf-8?B?QXczb3RMUDdrTnhZaDM1WW9aMS9TRDdxTEtRZ1JsNUlJMS9MTzgxajdZQ1dh?=
 =?utf-8?B?bGxMODdmVEFLZ3pRQkF1RGIwWVR4OXNSeng0VWJLb1VBWnVrWVJGZmRTYWUv?=
 =?utf-8?B?OVNaSFl5TlYrSW9LdWVEem9WNnY5RVdhUGM2OGNwVnB0WlVGRUVyUjRySmQy?=
 =?utf-8?B?Z0tPaVRlR1p0Rk5RQVZsNDZWMXZZTnJDT0V0RnBlN0grbmNUaW9EL3ljKzNq?=
 =?utf-8?B?K2FBN1VtaWtTMUJ1cEx1ZTNienVlSmdjVkRxZWZ0SG9sZE1xVlJ5Q1puczBi?=
 =?utf-8?B?UE1IR0h3OGwwV3hQQ0tkQ1dqMEZnMVFuMldTTTk2a3ZnUVlsVnFrejkxZ052?=
 =?utf-8?B?VWk0YVB4RGU5ZUg2NWFWSTA4VEc4U2cxWkViejd1M2JNeFZBSzlJaHFwSWdN?=
 =?utf-8?B?b1hGK2t6Yy9vdHgwZmZqRllxeTkwWSthNFdXVnZmMTVHVUJWOFA0bXNDaWEz?=
 =?utf-8?B?bWw1RmdmWkpNUWk2d0hBd2gyU3haa2h5aFV5U0R4TFh1VDVxVnRDNmFtdytz?=
 =?utf-8?B?MHMwd2dJOHd5YzI0NU9nNm13YkluUUhobStSRk1SaUUyemozSmZwQjJXKzRT?=
 =?utf-8?B?TFlsd1BOdnYwamtqZ3RvbjlZRUhTMTNra1VabzJTTmhYZVczSVhJSHc4d25k?=
 =?utf-8?B?aXkvamh0R3JvT1A3czVmREc1Yk9iSmN3OFRWUS9WamNXRUVvRVpTTlUzVWNU?=
 =?utf-8?B?K1BldUREWmtNQXhvb3gyajU2dTNMenBadkRvL2t2eHNYTWRsU2d2UjZmYzlK?=
 =?utf-8?B?ZllyMEpWSllYY3RYNjh3MjhxSmZ2SHpOZG8zRHFxSGxSdGNDYVpyNVFmVHJj?=
 =?utf-8?B?RXRWMFMzaGdnd2E1di9Ddz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkpFVXJOK2dZWkFuMDdxNWg0SXNhVEtWbXlVOVc5eUxoajlMRlZsSEg3d29Y?=
 =?utf-8?B?TndkSVJKeTNsc0hlOFlzZnFES1lQeFU5dVhDTjZGNE5QM3ZMcm95VnRMSmFL?=
 =?utf-8?B?cmwxNnpFR2dPOCtzMThNcmU3YzdnUE9ycHRYZkNnVEh1OURubHdPcFFKYmcr?=
 =?utf-8?B?Nk9lbGlhdHBsb0MwaUZhNWJxSllsRmJ1L3h2NjBDcVNNOW8rNm5lMGRySFNl?=
 =?utf-8?B?eXU4RjVtQnlWZnBzWW4xYTh0a3hkTGtFVlY4VVk2Q210OWxCMk14dHRGNVBM?=
 =?utf-8?B?b3hrQzc3NTFsNnFuM3Y3T00yb1hsR0tEZm5uR2QwclByNVh5RFcxMmpLdTJZ?=
 =?utf-8?B?U2NDTFREYkdUbkorT21aVDhwd1pyWENoYnZVMDkrdkl6eTNRSnR5KzZ6VXRE?=
 =?utf-8?B?T0k2RHN0K0JqT2txajZzWEpQcFBTKzB1UVlzWE1RaWJXNHNZSTZBa2p2RTN6?=
 =?utf-8?B?VWdKc0pBOUE4MmxWQUZ5U1AwVmViMlJXOTl6OS9DbldieW5RWHgvUTFFS2xs?=
 =?utf-8?B?Nkg4bXQ3cWNSRG9lOGoyVndsbTlyd2c1QWI4clNzbmM5R3prRE15em9CcTFq?=
 =?utf-8?B?SHloN1NHYWlZMGNpR0JhUjdUYnlKRTJWZHlIZFMzc0NweHNWUzRsRWQ0NUFM?=
 =?utf-8?B?d2pRNHo3K3UvMXloeHd6akFJdGw4MWorSVprNmMzaHcxcW1aMXdjaWRZYlYv?=
 =?utf-8?B?b0VuTkZkRmdISEpSQjV2dk5NbG9OSHdTa2pSbUFFMEZaaDVzSlZDZ3BhNnB1?=
 =?utf-8?B?aDFUTDBoYlg5TjBTbzc4K0hUNVdFcFhuLzc1bDNzY3pZTzF0SnlpZG5qQ3R5?=
 =?utf-8?B?NVpXeUJiczA2eGNodHRkOFdCWHlyRTRvd1JrdVpHYlZNRzcvOUljb2RUbHdY?=
 =?utf-8?B?aGJ0UmVZWkJ5aVkyVmRUb1laK3RXTUxvOEdCajkrTjdYK3pYL1JuSkdSOUdN?=
 =?utf-8?B?NzU2c1FCNmJSYnJZQlFvd0d5ZUVYa1cxTzJWNGtOeHhBY2t6WmpTZWsxdEZi?=
 =?utf-8?B?WmtuQzNZV2l4VzhzREtUS2tnNUJ4MVN5a0U4REgyMXF6NDVuTVZXTWVxaGgw?=
 =?utf-8?B?WHJGTWxjVXBqRnBkbUZhU3A4NjFHMHNldG42dkhtWGtIamRuUGRESC96NkhP?=
 =?utf-8?B?Y2JyWldqSE1WQzRwWVpoNXg4ZzAxRjgxd3RsMENkSlFPZEVVM1R4OXk3SkxL?=
 =?utf-8?B?K1pZYTV6WDd4RjQwRGtBbDJqelpiZGpjaEd4cVhWNWR6SThjZFE1T1VldGhi?=
 =?utf-8?B?K09zWEs0RVFidTMzWWJUenF5YzZxTm1VTWhzNHVtK3NCSUcvd3p0alNDMWlP?=
 =?utf-8?B?c3lXQThabFRKZGdYejVvWmVXYWsyN3J5MlY3N2szOHdGT1FhZ2tqdDFvSUR4?=
 =?utf-8?B?Rk5wTjMwMXdpUGNxTS9CekUxc295cThhSXRPME9aVGZNdVpRdW1qQ3pzM2pP?=
 =?utf-8?B?ZmNsMjlWaU1kZkxVWVc4allvaW1uOVBWT1RZeHdXb0VnZVNhY2dIbDhRVlpB?=
 =?utf-8?B?QXhOWDJxYWRRbnhJaytEc3JYNnhXUDM5R09ON1BoWG1SR05aTFNwMUxwQTNl?=
 =?utf-8?B?OFhjRTJYTDh6SWpKTVI0ZFpBa1IzcWhXMXdhaWxjUFNWTldIYjFxeVVuVDBQ?=
 =?utf-8?B?UnFLaXQ5RmgyNjZyU0tqdVdQOWpxMjgveEFmaVBBU1o1S2c1K0R0QlRYRzlF?=
 =?utf-8?B?SkdZeFcyeWxiSW4zQmg2VGhrcEwvdWg0aURpWWNhQUsyT2FFVXpUNTZiZTNX?=
 =?utf-8?B?WTBOSjNXa0dGTDVmLzB0RVp6S0dVMXlvMHdtZmFXVk5EbWMzM1lYVUk2V21u?=
 =?utf-8?B?c0NQTnZjdXRhZEZEdmhVZ1ExZkpiNmRac25IL3VwSVh3ZmVnUFRkVDJUd3pv?=
 =?utf-8?B?K2FGdFRIdlRVMXQ4MGtqczhTY2F1dHFHdTdpOVp2RFg1S0xNaitXQnhwek94?=
 =?utf-8?B?azVmTnQxTWhwd1ozVkNmWHdmdDQ2RE1HTWJIVThqTEl4K2dzejh6SnBBOTBC?=
 =?utf-8?B?eGp0bEN1WlppYzhGbTVDeHV2YjdBYkcrU1pSTWpHQkdzM3Uxa0ZhMzBTRk82?=
 =?utf-8?B?MVVYYWdjd0NrZmxXOUk0N2JzamwxK3QrYjQvSGdnaUxDakczc3I0NHFCN2VZ?=
 =?utf-8?Q?LCeVQWSElgY3QV9tJdvZK1Se5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7920a5-6105-4ccb-83aa-08dcb2113a31
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 10:03:44.3242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2HgQ3yF2epZMH6DgvSPYftWMQYhyBTH6FmbYq6c2/lPW/b0+B+DMqt5VToMZ1UYpgDEnz8ks02V7vpqTwGLEMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8246
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



On 01-08-2024 15:23, Riana Tauro wrote:
> Coarse Powergating is a power saving technique where Render and Media
> can be power-gated independently irrespective of the rest of the GT.
> 
> For debug purposes, it is useful to expose the powergating information.
> 
> v2: move to debugfs
>      add details to commit message
>      add per-slice status for media
>      define reg bits in descending order (Matt Roper)
> 
> v3: fix return statement
>      fix kernel-doc
>      use loop for media slices
>      use helper function for status (Michal)
> 
> v4: add pg prefix
>      do not wake GT if in C6 (Badal)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 +++
>   drivers/gpu/drm/xe/xe_gt_debugfs.c   | 13 ++++
>   drivers/gpu/drm/xe/xe_gt_idle.c      | 91 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_idle.h      |  2 +
>   4 files changed, 114 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 3b87f95f9ecf..279d862c306a 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -337,6 +337,14 @@
>   #define   CTC_SOURCE_DIVIDE_LOGIC		REG_BIT(0)
>   
>   #define FORCEWAKE_RENDER			XE_REG(0xa278)
> +
> +#define POWERGATE_DOMAIN_STATUS			XE_REG(0xa2a0)
> +#define   MEDIA_SLICE3_AWAKE_STATUS		REG_BIT(4)
> +#define   MEDIA_SLICE2_AWAKE_STATUS		REG_BIT(3)
> +#define   MEDIA_SLICE1_AWAKE_STATUS		REG_BIT(2)
> +#define   RENDER_AWAKE_STATUS			REG_BIT(1)
> +#define   MEDIA_SLICE0_AWAKE_STATUS		REG_BIT(0)
> +
>   #define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
>   #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
>   #define FORCEWAKE_GSC				XE_REG(0xa618)
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 5e7fd937917a..47e3a1ca2394 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -15,6 +15,7 @@
>   #include "xe_ggtt.h"
>   #include "xe_gt.h"
>   #include "xe_gt_mcr.h"
> +#include "xe_gt_idle.h"
>   #include "xe_gt_sriov_pf_debugfs.h"
>   #include "xe_gt_sriov_vf_debugfs.h"
>   #include "xe_gt_topology.h"
> @@ -107,6 +108,17 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>   	return 0;
>   }
>   
> +static int powergate_info(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	int ret;
> +
> +	xe_pm_runtime_get(gt_to_xe(gt));
In suspend resume path I am seeing PG disabled and enabled. Will it 
cause any race while this debugfs entry is being exercised?
> +	ret = xe_gt_idle_pg_print(gt, p);
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
> +	return ret;
> +}
> +
>   static int force_reset(struct xe_gt *gt, struct drm_printer *p)
>   {
>   	xe_pm_runtime_get(gt_to_xe(gt));
> @@ -277,6 +289,7 @@ static const struct drm_info_list debugfs_list[] = {
>   	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
>   	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
>   	{"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
> +	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
>   	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
>   	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
>   	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 7188542aea43..2ab0eaafa7d7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -53,6 +53,11 @@ pc_to_xe(struct xe_guc_pc *pc)
>   	return gt_to_xe(gt);
>   }
>   
> +static inline const char *str_up_down(bool v)
> +{
> +	return v ? "up" : "down";
> +}
> +
>   static const char *gt_idle_state_to_string(enum xe_gt_idle_state state)
>   {
>   	switch (state) {
> @@ -147,6 +152,92 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>   }
>   
> +/**
> + * xe_gt_idle_pg_print - Xe powergating info
> + * @gt: GT object
> + * @p: drm_printer.
> + *
> + * This function prints the powergating information
> + *
> + * Return: 0 on success, negative error code otherwise
> + */
> +int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_gt_idle *gtidle = &gt->gtidle;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	enum xe_gt_idle_state state;
> +	u32 pg_enabled, pg_status = 0;
> +	u32 vcs_mask, vecs_mask;
> +	int err, n;
> +	/*
> +	 * Media Slices
> +	 *
> +	 * Slice 0: VCS0, VCS1, VECS0
> +	 * Slice 1: VCS2, VCS3, VECS1
> +	 * Slice 2: VCS4, VCS5, VECS2
> +	 * Slice 3: VCS6, VCS7, VECS3
> +	 */
> +	static const struct {
> +		u64 engines;
> +		u32 status_bit;
> +	} media_slices[] = {
> +		{(BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS1) |
> +		  BIT(XE_HW_ENGINE_VECS0)), MEDIA_SLICE0_AWAKE_STATUS},
> +
> +		{(BIT(XE_HW_ENGINE_VCS2) | BIT(XE_HW_ENGINE_VCS3) |
> +		   BIT(XE_HW_ENGINE_VECS1)), MEDIA_SLICE1_AWAKE_STATUS},
> +
> +		{(BIT(XE_HW_ENGINE_VCS4) | BIT(XE_HW_ENGINE_VCS5) |
> +		   BIT(XE_HW_ENGINE_VECS2)), MEDIA_SLICE2_AWAKE_STATUS},
> +
> +		{(BIT(XE_HW_ENGINE_VCS6) | BIT(XE_HW_ENGINE_VCS7) |
> +		   BIT(XE_HW_ENGINE_VECS3)), MEDIA_SLICE3_AWAKE_STATUS},
> +	};
> +
> +	if (xe->info.platform == XE_PVC) {
> +		drm_printf(p, "Power Gating not supported\n");
> +		return 0;
> +	}
> +
> +	state = gtidle->idle_status(gtidle_to_pc(gtidle));
> +	pg_enabled = gtidle->powergate_enable;
> +
> +	/* Do not wake the GT to read powergating status */
> +	if (state != GT_IDLE_C6) {
How about if (pg_enabled && state != GT_IDLE_C6) ?
> +		err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +		if (err)
> +			return err;
> +
> +		pg_enabled = xe_mmio_read32(gt, POWERGATE_ENABLE);
Is this needed?

Regards,
Badal
> +		pg_status = xe_mmio_read32(gt, POWERGATE_DOMAIN_STATUS);
> +
> +		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +	}
> +
> +	if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
> +		drm_printf(p, "Render Power Gating Enabled: %s\n",
> +			   str_yes_no(pg_enabled & RENDER_POWERGATE_ENABLE));
> +
> +		drm_printf(p, "Render Power Gate Status: %s\n",
> +			   str_up_down(pg_status & RENDER_AWAKE_STATUS));
> +	}
> +
> +	vcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
> +	vecs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
> +
> +	/* Print media CPG status only if media is present */
> +	if (vcs_mask || vecs_mask) {
> +		drm_printf(p, "Media Power Gating Enabled: %s\n",
> +			   str_yes_no(pg_enabled & MEDIA_POWERGATE_ENABLE));
> +
> +		for (n = 0; n < ARRAY_SIZE(media_slices); n++)
> +			if (gt->info.engine_mask & media_slices[n].engines)
> +				drm_printf(p, "Media Slice%d Power Gate Status: %s\n", n,
> +					   str_up_down(pg_status & media_slices[n].status_bit));
> +	}
> +	return 0;
> +}
> +
>   static ssize_t name_show(struct device *dev,
>   			 struct device_attribute *attr, char *buff)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
> index 554447b5d46d..4455a6501cb0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> @@ -8,6 +8,7 @@
>   
>   #include "xe_gt_idle_types.h"
>   
> +struct drm_printer;
>   struct xe_gt;
>   
>   int xe_gt_idle_init(struct xe_gt_idle *gtidle);
> @@ -15,5 +16,6 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt);
>   void xe_gt_idle_disable_c6(struct xe_gt *gt);
>   void xe_gt_idle_enable_pg(struct xe_gt *gt);
>   void xe_gt_idle_disable_pg(struct xe_gt *gt);
> +int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
>   
>   #endif /* _XE_GT_IDLE_H_ */
