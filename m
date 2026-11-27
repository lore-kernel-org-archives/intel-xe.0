Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FA9606A32A
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 06:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GszMEnjC;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=kHP/t2yN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D5710FE16;
	Fri, 27 Nov 2026 06:03:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2EF810FD6E;
 Fri, 27 Nov 2026 06:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795759421; x=1827295421;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HyyAy7KpmpIkjMxvLVptBQRXjgXhjAW6hPUMvOy1WOw=;
 b=GszMEnjCdplFHsd8aacAIiVpCbi4akntTlyYN9/zGq+XvQyRLrCCBy52
 kD2BVkzD8EabbHHDsxlVd6P0ns9pJXmWhzEXQIi53pk086h08jvtNyg1D
 qMBn+E4NpRTgu+BRK3xSkAbE+/kANHuIvD1l9VIUiPjW3DjZGt6O7ZjR+
 c1eEJGGY7zKkjtvzPJYMOXA7g750OKP4RyzC8O+e+kXSJGWcnsYakk2le
 aysubn9NOFyYIeZcfQgqblhNtSU4vv4eFU1WNqOA5Ag7Cwj2T+IJaUw1P
 Dc9QUTCpLdN5r0QBHfgu+QO4OKN+kogHqEcxIOCc/dUXzDC0Ulo4vPz+c g==;
X-CSE-ConnectionGUID: yNc2NPtqRRqkjsWPwQTXiw==
X-CSE-MsgGUID: y2PWOHI5R1WQq95vpbP1nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4577597"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4577597"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:03:41 -0800
X-CSE-ConnectionGUID: EQ+Ipk6SRI69dilWwZIeug==
X-CSE-MsgGUID: 5dg4wE3RRXyMFQA0MXGBdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="14361369"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:03:40 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 22:03:39 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 22:03:39 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.7) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 22:03:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ud6bKnzPEXTnvKQxNkfQX/KdnjsbvW7kPFZwPfa/QtDHKsvChMYixszDUhoHw5ftFAfWYyxAG3gwnVFgctaWKQn2aNzGHJKFv6Gpz0aMVz8d3Sm//NDeNdTG1/z9UF+7Ub3dM2yZAykLQJJT6NnPtVMg0mf4wQU60OgOWGcKKWmDSq9t8pJrt2TNiBdjfxDc0ed7me9s/SW3yTLUwD3kRHQcXlOUAD6tlSqzZ0knIZnK7ow0shIYsyCc5yXSLTGw6Qqcxe5BX9a0wgr2zLgwvbjimgbdNKkhGGqXVeLiUHH/Wdw3kU+xutQGclKIBdhA3/ml4vuOBE7GHVsX0voAmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBbyy2M8hb1nF4RRZqBL2Kpvsevw5ztmJSPtld584R0=;
 b=SDe60JGpmRQDY31ffBy5/LrgCjtJ0PIZ3r5cKZGoPGyRwQu+mh7WU2IKIuY33ogd7jywVNHkpeIi+TW8X5YcCqdudNU+/0nhmP/HTWU5BVfEhIowcVXeul1D2AH44K2NGBVehbRqLLbqvP9BGTON03jxDEIXz4JvEhgIhQkpElIu8++J4Xivr7MLajSUtMC3vAWc6zpoz3gRnI9oUlG0KrOTF6SOP/Dymlru2JB9CIhvnCx0kWKXxgRMuQWHLnrAJnYGi8o1f1jNMNdCKlkfbo+uBWz5+2eHoV7ZSfgstlgICkJRX46KVI7jag8pF3D1zDKugFWQ5+3vk2/f/6MLFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBbyy2M8hb1nF4RRZqBL2Kpvsevw5ztmJSPtld584R0=;
 b=kHP/t2yNNPmMnr/3XiBIbUI9j+Q2XkvcHIehiINnFPrj+xUCGPEriq/tYJ4YK/RdQmPkEV5+Q4kTMOvJOy3I0nVFrwdTVNvBg8O2rM5TCB1O0iBVD8nEi5DusGjDeILtFBeRDxk0WzswEwyVnDMDGKv+Fci4TGg59T1A7/1QK0g=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by IA3PR11MB9397.namprd11.prod.outlook.com
 (2603:10b6:208:573::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 06:03:37 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 06:03:36 +0000
Message-ID: <ceb67aff-32c4-4818-8777-90ed679f6960@intel.com>
Date: Fri, 27 Nov 2026 11:33:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] drm/i915/vrr: Introduce
 intel_vrr_vblank_start_live() and use it for MMIO vblank evasion
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
 <20261023165803.31016-12-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20261023165803.31016-12-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0337.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::13) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|IA3PR11MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d146d11-06ae-4269-2971-08df4c4c2ce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|261026121527099003|10067099003|11063799006|56012099006|4143699003|261009223027099003|261021121427099003|261021135927099003|261102123227099003|261021123027099003|261026140227099003|261022075727099003|261022105027099003|261028144727099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: TzQ9DvxPt6FDqxMgPaBIFRxNgH/2s2ki681Q3UCCY0Gzk7CABoemAQ16z2cLT/hUbSKLpy5lMGP2s3pMZBwv2bLMcLiea5Mla9wi4zDbgOnBLa1gf7MkCM5zWaYgLYcPO/8pzSeJtFZbiF7837YaoTS+ldSRQoFj8XteVWoGkfCGRcibKgI7peX6sqeUnxaeSP16YNYDyjhnTHKobN9neeGznM+ia09N9R+N8UNzj1gmnYxLR9SlYizQrOp+W25ah81bdOs2vBCwPjs0L0U8oVG5fIfAnXkZ4hl14ExTwJwO1i8JVFbafXJ9xcBduo0D/No0Qx4FL2T0zTD6jkPsMkHkJHrmdeWxTHd+2V6/oTVZy4pBGOPArJEH8Y/5inocfCk9YeVPy3N7vmHgaUHl8gCOBwXIquY7j/DzlbvDc6wCKYPpAIDtRSeYL2NLDKTS7xVBw/zW0LOs4NcEm2Cqr3+JDAaRtjaD4JJbQVxXdJgGxRI/zIJohI+/OogLFweyJxXbO5OWQTDQh6/3rQvz/pmzNBrCsi3YX2RuMlt5TKfPIylwSKGEd6ckdUt9d/EUUcuYRZOM6+dIXwbZrvXBNsj9bSfACnKNmwgtlvxGT18yF9deBsFbYEAHYpxIh6D1GHIF+VC9AXIPcKNpWSCPKwlt7MsoYmbFiT/FzPCaZjc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(261026121527099003)(10067099003)(11063799006)(56012099006)(4143699003)(261009223027099003)(261021121427099003)(261021135927099003)(261102123227099003)(261021123027099003)(261026140227099003)(261022075727099003)(261022105027099003)(261028144727099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDNTaFRTbzlWMEhzTnlUZVp3RDZEK25IVUo3TG1hKzZtcitOalM1N3hQQ2JQ?=
 =?utf-8?B?VzNTWFFFMFlkMzQ4M3BjV09GSVppVTJVTWp4M2U3UlpwMTFwNVNYVWdseXh2?=
 =?utf-8?B?OFhoSFVGdW9PaTAzdVZRT2krbU8wQ1lSZGs4MzRnK1F2SEFZWFY1MEJPbC9r?=
 =?utf-8?B?ZGljT1dzNjVDMmJ2Zlo5eEFIUDNHUklzVTNEZDdhZ0lKbHdseFRxWDRIaGtR?=
 =?utf-8?B?N3BTYm0zTzZNRkhwaTd2cWMyTEgxVDE2cGVOK0xYcTBPVUx5djhscHdPSkZC?=
 =?utf-8?B?ejJiZ0hpT21lRjBTa2l2RURtQjhIckdxTG1DMTFWa0U0SHkyV3RzNkZrKzhV?=
 =?utf-8?B?QVlobXEzeTloejJQa0lVSmV2dmlzcXZRMS9ISnpIS09xSGhhMHZycy9xdUtO?=
 =?utf-8?B?RjdIZG5pUGRXRmpiZk1mRC9FVmpCempLMGJNL3lhQUE2eWxlLzNkRmZvQjlp?=
 =?utf-8?B?Q1hzOWsxTEE0NkdYZDFvWFFhdSs5M3Z2UmJvRVFXOUJ3bUlXZkxIejhIYkd2?=
 =?utf-8?B?T2RSa0Z0MVZoZ2dsUHcycjVxZ0tIZFhvc0ZkWVh1UDB6c2FEUXJ1c0VxWWJq?=
 =?utf-8?B?Mk9TQnNKSDV2d0F1ZGwrOUFDNDNUT2k3M09oR0RkajR2Yi9IYUpkSU1OV28z?=
 =?utf-8?B?MGwyamhXaXM2cVVmOGN6UHp4KytmbS9KK2JZZHlHekNock00WEhrNDVKZXYx?=
 =?utf-8?B?eWQrV2RBTCttL3ZwbkkzMWZmalEwSTBiUENVUW1JT0t3K1hKeTUwaDdrWk1R?=
 =?utf-8?B?SFlnQ0RHeHNsNDJqaEVDdHhtTEN5aXBHRWtLcUZuV2o3ZDlpR09peURxeTZy?=
 =?utf-8?B?U1JJMk9zekFxeERUaWdEeTNXVE5udnM2MitzTGZBWnNDM1RvSVdNazNYNGFB?=
 =?utf-8?B?SzZZK1E0VGNFL0lXd2xrbngzSjFvMWVRTWVtYnpMWkJDSDNYVytSaWY1VVVL?=
 =?utf-8?B?RzRKYnY5R1RHMzdoSm9YNm5uWkI3S2w1WFZvZFFQZzlNSkNBRlRWbk5MRS9k?=
 =?utf-8?B?QTJHZ1pYS2JtRVFLYUV3bEw5Ry96d29tS3R2bzFIdll1ayttZnBNUG1GZjlC?=
 =?utf-8?B?SFpBbDN2emlLSUYwK3dwbmJsbXJJNlk2ZU9IS2xSOTlLRC9QTmNpOGo1cnpZ?=
 =?utf-8?B?bVFsV3owTWhIT1U2bEdrZTdsVGFXTzZrSi9jdTZxbWU4WXF5cklHZXNBek16?=
 =?utf-8?B?a29QaGpEMFpOUEIwRmFpV1RDZWdPWWxxUklJTU9ka3ZDSHMwanlhbTRPSERk?=
 =?utf-8?B?cUlIeWxjb3ovQUgwL1I1bENQY0FYT0NVakhEUHBJOE1sQVBZTkQyTEY3N0Nu?=
 =?utf-8?B?SElzeEV6TmlSbHBta0d4Z2dmazRzMUdUNVJrb1hpRTltdk13b0FTV0pHbzdS?=
 =?utf-8?B?YW5sajB4NHFqd1djMy9EWUdoNllwMU5uOTJXcVNjcm1LWmd0MmsyTzJMeWZh?=
 =?utf-8?B?N0dGT3MwcGVmZ2ZKT1dmT2Rmd3hNcVdWQWV2NUc3MkI4M2puaTU2VCtoOW00?=
 =?utf-8?B?UEhkVndmWFN2bXB3S0Q0bVNTM2tnVFVvbU9wbmZtM2plUlFQY09kYkVMWVhK?=
 =?utf-8?B?bStGdFF4cnlxQ2szczhYUWw2Y1NlQjVyOXU0eG92RlZyaXFvK2cyTE8ySFo5?=
 =?utf-8?B?aC9ZVytkSStVekxyN1BCK005azhaOThRRjU2TU5oSXVjem9xdWZ4WnFMWjRD?=
 =?utf-8?B?bmFJQXZvR3dWRGFFeEF4U1gvaGVSdVhPWHhERUkzQUpxVnBHWGExVi9uRUYx?=
 =?utf-8?B?UmhYTld1NUpycDdXY1g4Zy9VckIra2VYRE4zczZKbVFmTzNhWUlvUkQrSXJJ?=
 =?utf-8?B?T0UvclBtcWh6WEFYd3BJU3lNbFRUWUo2NE5ueE5IMkNQTXZnMitmOXZobEVw?=
 =?utf-8?B?Q0ljcW1UbzhBaEVCdmdPMGhKdWVMQzJlejZhM0VCazJwWnZMd0Y0d0RDQVNl?=
 =?utf-8?B?R1FYY0cvamY1NHR3NUJIejhzNVl5TkZHVXI3UXlhSUg4akI4K3c2STZMV3Ir?=
 =?utf-8?B?TXo5ZEZHRUVHR01aS0FkUVVxcFRpaDFsbUlIV2ZOaXFrT1cxZUpEak5OK2JB?=
 =?utf-8?B?Y3grQXNZOElEamJoRlQxRHdTNkFqMWR0VTUvSmsxZHVoVy93UTMzTlJRL1pD?=
 =?utf-8?B?eDBuMHN4cTBWbkdSOGFoOEc3ZHRhbmZGaFBnNlNVMGFYMWRaOGI2eG5xRnEx?=
 =?utf-8?B?QUlneXlkdXplQ2duWDE5eis1dEQ2b2lrcDZXR2tXTzdmMXh0eEg0SUQ0ZGho?=
 =?utf-8?B?eTVrVGtJQzh3MVNUT0xTR2w1aXdwUFpQNndGQUNYTHErd01XdEhZNHovajNM?=
 =?utf-8?B?bTVlSVRXWU9jc2NJcmhqNFI0MFp1RDREMHJ5UkM1eWZKV3Y2WDRlbnZoQ0JR?=
 =?utf-8?Q?4Yv/JfoYNCqXNIMM=3D?=
X-Exchange-RoutingPolicyChecked: POWAOI8wdFsQ4TK3K7LSa1BqwjlV2qhs1EuGDsxrif8tnJ8hCgXL/jxipcnVNIpiyKRjelb/DRrIZ1NlJiZ1f5l81zP2NxvT+S3+NWf0wHsBXor+qT9/8uK5T01AzTEmUR6BleAQ0X5KAgSBaAaVHxDYsuWXwdsHzyUheV4Mg/eFRA0Noa182wIJFJ1AbYoAMeA7531LaZ8oKm0rJVM1j+YpXTg7MjRpUU7tqfVgP/utHmBxaia47gzqrQCgYnU9lXmX4nHhyv+xXYPz7udKDrjyFnzJ0QF3MuzwS08KP1codh8swERakvVOW2qIlOBXIc65gNIQoUSiI3bpND8Ajw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d146d11-06ae-4269-2971-08df4c4c2ce4
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 06:03:36.7002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kgp8laT39AW2E63+IYMxLHwq4eCSZRgRGwRbcL4/aeb4mX58321SAeDs67HVO9bgevSDA3PA5zh0BZ3BSoCPZUrTtEaRcvn0aBeK10CgQxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9397
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/23/2026 10:28 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> vrr_vblank_start() in the MMIO vblank evasion code is duplicating
> a lot of stuff that is now implemented in the VRR code in the
> form of various _live() functions.
>
> All we need is intel_vrr_dcb_vmax_vblank_start_live() and
> intel_vrr_vmax_vblank_start_live() (we already have the vmin
> counterparts) to finish the puzzle.
>
> This lets us hide most of the VRR details from the vblank
> evasion code itself. All the vblank evasion code is concerned
> with the is the location of the next start of vblank.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_vblank.c | 30 +--------------------
>   drivers/gpu/drm/i915/display/intel_vrr.c    | 28 +++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_vrr.h    |  1 +
>   3 files changed, 30 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
> index aa108ed27de7..084f6aaea61d 100644
> --- a/drivers/gpu/drm/i915/display/intel_vblank.c
> +++ b/drivers/gpu/drm/i915/display/intel_vblank.c
> @@ -654,34 +654,6 @@ intel_pre_commit_crtc_state(struct intel_atomic_state *state,
>   	return pre_commit_crtc_state(old_crtc_state, new_crtc_state);
>   }
>   
> -static int vrr_vblank_start(const struct intel_crtc_state *crtc_state)
> -{
> -	bool is_push_sent = intel_vrr_is_push_sent(crtc_state);
> -	int vblank_start;
> -
> -	if (!crtc_state->vrr.dc_balance.enable) {
> -		if (is_push_sent)
> -			return intel_vrr_vmin_vblank_start(crtc_state);
> -		else
> -			return intel_vrr_vmax_vblank_start(crtc_state);
> -	}
> -
> -	if (is_push_sent)
> -		vblank_start = intel_vrr_dcb_vmin_vblank_start_next_live(crtc_state);
> -	else
> -		vblank_start = intel_vrr_dcb_vmax_vblank_start_next_live(crtc_state);
> -
> -	if (vblank_start >= 0)
> -		return vblank_start;
> -
> -	if (is_push_sent)
> -		vblank_start = intel_vrr_dcb_vmin_vblank_start_final_live(crtc_state);
> -	else
> -		vblank_start = intel_vrr_dcb_vmax_vblank_start_final_live(crtc_state);
> -
> -	return vblank_start;
> -}
> -
>   void intel_vblank_evade_init(const struct intel_crtc_state *old_crtc_state,
>   			     const struct intel_crtc_state *new_crtc_state,
>   			     struct intel_vblank_evade_ctx *evade)
> @@ -708,7 +680,7 @@ void intel_vblank_evade_init(const struct intel_crtc_state *old_crtc_state,
>   		drm_WARN_ON(crtc->base.dev, intel_crtc_needs_modeset(new_crtc_state) ||
>   			    new_crtc_state->update_m_n || new_crtc_state->update_lrr);
>   
> -		evade->vblank_start = vrr_vblank_start(crtc_state);
> +		evade->vblank_start = intel_vrr_vblank_start_live(crtc_state);
>   
>   		vblank_delay = crtc_state->set_context_latency;
>   	} else {
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index a549807586f8..3d31d37af4e2 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -1250,6 +1250,18 @@ intel_vrr_dcb_vmin_vblank_start_live(const struct intel_crtc_state *crtc_state)
>   	return vblank_start;
>   }
>   
> +static int
> +intel_vrr_dcb_vmax_vblank_start_live(const struct intel_crtc_state *crtc_state)
> +{
> +	int vblank_start;
> +
> +	vblank_start = intel_vrr_dcb_vmax_vblank_start_next_live(crtc_state);
> +	if (vblank_start < 0)
> +		vblank_start = intel_vrr_dcb_vmax_vblank_start_final_live(crtc_state);
> +
> +	return vblank_start;
> +}
> +
>   static int intel_vrr_vmin_vblank_start_live(const struct intel_crtc_state *crtc_state)
>   {
>   	if (crtc_state->vrr.dc_balance.enable)
> @@ -1258,6 +1270,22 @@ static int intel_vrr_vmin_vblank_start_live(const struct intel_crtc_state *crtc_
>   		return intel_vrr_vmin_vblank_start(crtc_state);
>   }
>   
> +static int intel_vrr_vmax_vblank_start_live(const struct intel_crtc_state *crtc_state)
> +{
> +	if (crtc_state->vrr.dc_balance.enable)
> +		return intel_vrr_dcb_vmax_vblank_start_live(crtc_state);
> +	else
> +		return intel_vrr_vmax_vblank_start(crtc_state);
> +}
> +
> +int intel_vrr_vblank_start_live(const struct intel_crtc_state *crtc_state)
> +{
> +	if (intel_vrr_is_push_sent(crtc_state))
> +		return intel_vrr_vmin_vblank_start_live(crtc_state);
> +	else
> +		return intel_vrr_vmax_vblank_start_live(crtc_state);
> +}
> +


Wow! This ties together nicely.

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


>   int intel_vrr_safe_window_start(const struct intel_crtc_state *crtc_state)
>   {
>   	struct intel_display *display = to_intel_display(crtc_state);
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm/i915/display/intel_vrr.h
> index 3928554c0424..332f9b4a57cc 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.h
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.h
> @@ -40,6 +40,7 @@ int intel_vrr_vmax_vtotal(const struct intel_crtc_state *crtc_state);
>   int intel_vrr_vmin_vtotal(const struct intel_crtc_state *crtc_state);
>   int intel_vrr_vmax_vblank_start(const struct intel_crtc_state *crtc_state);
>   int intel_vrr_vmin_vblank_start(const struct intel_crtc_state *crtc_state);
> +int intel_vrr_vblank_start_live(const struct intel_crtc_state *crtc_state);
>   bool intel_vrr_is_fixed_rr(const struct intel_crtc_state *crtc_state);
>   void intel_vrr_transcoder_enable(const struct intel_crtc_state *crtc_state);
>   void intel_vrr_transcoder_disable(const struct intel_crtc_state *crtc_state);
