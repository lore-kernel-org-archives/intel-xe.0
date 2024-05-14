Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E997C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 15:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41ADD10EA6B;
	Tue, 14 May 2024 15:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpQSJ3bs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C1210EA6B;
 Tue, 14 May 2024 15:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715699974; x=1747235974;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ORG1QLkJL1zgOPKZkVQqTnucnIp+GwnfyJLFjzzl1Gg=;
 b=jpQSJ3bsAX9ZLfO+5F4Ghh2/G7tlcm+9Z8rfLiXA/YVBUR1eaRGHZulq
 rrfMrVbS5X8VwkEDkwlx9uBGow4VqhGm/3OaCTt/1/uE5hxq6vkzZpSPV
 fizkDKFjdhmzkO1Xlg1hAD3LGuBI1x+yh+SbELSBVkdKNsRfZYqbjajBy
 sZ31Ty7sJg6Ghyws536ttlTZPWRmo6u18f66vBJZR6P+Bw2eSFySn1LFD
 XZPgObfDx0LrEyBLoq0cJh7oXTuZfIBhWr76FkFoyIUzZQCc6ZN2WBhwN
 4WpP7EyN3F0hJtlCj/OZIToM3jolA3r8f99mZRkgS+ptmixrC99PANM/h w==;
X-CSE-ConnectionGUID: XY6T2wMtQqCSk+kQnu1DIQ==
X-CSE-MsgGUID: F+uztw2OS+i62qoWK08FCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="22360489"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="22360489"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 08:19:33 -0700
X-CSE-ConnectionGUID: jHiKqAX2TGur9AcPKUfFfA==
X-CSE-MsgGUID: hcuE9RvqQsSSLhPwDclXow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35483999"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 08:19:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 08:19:33 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 08:19:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 08:19:32 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 08:19:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=it+G2TX2sUv0kX6+8Kvm4uOJKtb3xdUawbOla7y1hRU4TlsEe9Nvt7hSp7UdZ7H1DlVbyQovBBxK1HQ4CZMEfW4DAY5DK9lg6vjnFtyjJfv0HxselOGInlw3VKbNpEbMfiKLbdCwDJ4GY1HXYBt5hObbDhZxtmWRUklF0ODsMjgKGewAkDiiFpKADMvexs9L7Br1ofYMmBSDyxn/iVxD1ev2I5XREI+g2PMID2XRlsefUc0lZVeMBD42bD6ttEf0WiEiBYoIpYGledQn/swZl+O80B0GEeJRf525YMYfSg0Z2Qpca7eJ5ZXjYALk3EjtHE16r/jsrRKvJV5i0bgZww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4br7FSYq2IeXTdz0MNla/ihybpUZ5mM8YtpjuDgv9I=;
 b=iXtKV3dZcSfj2fUytgR15KBoVb1odBJampQ3h9rF8mym0tnjtqlbliU2wkntHHud0g7syt7nhtv8S8NT3i8VaHFptat9BpJ6J8iZxelmBanT7Jr2ofrzltscf8YGiWj7AKsuBwZXVCWS92KgeMAx0S7tZfbZIyvUXwevCqOer4pkX2VyMqAh7L0WY6sCfsaHd96ad1seOpU4Rmk88FzYKmqJWV8jHuhoUbJ8T1KJ/kiSm7iypwnnl3lQzA/1rD8KIj0FbMs0tbg+KeRX3q1WRO3wHFj2JKsfEhS0SNFyy3Y5x8swYc4V6QxHBzbkoKnkuH90zF2G/fWUr9rff3yyTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SN7PR11MB7537.namprd11.prod.outlook.com (2603:10b6:806:348::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 15:19:29 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7587.025; Tue, 14 May 2024
 15:19:29 +0000
Message-ID: <c33614a5-2e89-427f-8e8e-6126ef728901@intel.com>
Date: Tue, 14 May 2024 20:49:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/5] tests/intel/xe_pm: Only check the rpm resume
 after the first mmap operation
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Anshuman Gupta <anshuman.gupta@intel.com>
References: <20240513185518.772398-1-rodrigo.vivi@intel.com>
 <20240513185518.772398-4-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240513185518.772398-4-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::17) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SN7PR11MB7537:EE_
X-MS-Office365-Filtering-Correlation-Id: 43f07416-4b6c-4760-79d6-08dc74293ff4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjVoTjhYRGJnZ3l4UmFYemc1NkVHNjhpYU56dC9pRmJkTVEzWkxEZFBkRmZD?=
 =?utf-8?B?Z3JES2VHSXcwQTFydEh5Ym01SkltQUxvTGl4RkN2bUZoT2lJakpxZVJmTUd0?=
 =?utf-8?B?a3U2aHI1YkNYaHNuSlRvRFlEbmRlWnZwdmxoTTQvRk1aM3I0cWtCUnBzWHV5?=
 =?utf-8?B?QUNUdDFVbGhIUi9MOE4xNUM0TEttek5vTGZkT3EvTG5xeVk5ckhmaE05TTk5?=
 =?utf-8?B?VlZwZHRNRmdUdDVlL290YXhLVndxZlZnQkJOek5ZamMzZ3hpbHBPVFVyYnpn?=
 =?utf-8?B?OVJYT01HdG9QUVhXc3JMalpYUWh3UDlJZ2lYTnl6YnA3bmRQOFdXc1hYREZN?=
 =?utf-8?B?WElvUUhZeHd4TDIxN3pGczBQN3ZxOVYrMGtScHBEQldWclhQLzZCcjQ5M3JG?=
 =?utf-8?B?d1E3bEFoMkJUbVg4dEY2dFNaNFF2SVk5ZVZCSmRsdE1hRm41TVpVNXp2bEZi?=
 =?utf-8?B?aU9qWGVRNG14RUVJL2hnWW41eGtNQ3Y1c0tudjQwV2IzT0haWUY3R3BDdmgv?=
 =?utf-8?B?ai82ZGNXQzVSNmxZczQrTnpMdEVwUlNGNzRUUEE2TGpkbTd1UGo0NndZaW16?=
 =?utf-8?B?WCtiWnhWQmplSEFFRkFTZFB0NUNTMCtPVDJSRmhBektEWFArWVBLSklrQ3FD?=
 =?utf-8?B?YTdqTitOcW5oTmlTdnVXakhwbE94QXJGa3FMbUpTT0ZUV1loVC93bTR5ZEx6?=
 =?utf-8?B?OUpHZHIreHVMc1AvUmtydTY2cHAzNndIT1lZdTBjWFoxM3h4TUdPanA5Zk55?=
 =?utf-8?B?NlpSUU5Nayt2ZUJKTTkzZnBqRHFRaE1aT2pCQ3hmZlh4NWx6R1h2ZDRvSS9t?=
 =?utf-8?B?NjMva2ZJTGs2ZzRlb3AyUjBaaWxweFI0MjNWR0JTZnZnMWdXZEp0Rk5kSHNS?=
 =?utf-8?B?TnRMQlg1NGhUVkJOZ2hDaktBY0s1c1hjU0RzdkxQalQzMnpDQnJVZERoRGJF?=
 =?utf-8?B?czlRbmIvSlBaVENYUXE3eEgycHgrS0lqT0orQzBTYVNLM2dmN3NqVmF4KzJL?=
 =?utf-8?B?V2o3ODIxRWZGbzl4QXBPelM0RUlHaElVaVFxZFpyV1VLa3FZK0tTWEg5Y2NI?=
 =?utf-8?B?QTlnNnpiSFdhdnppTjlzWnBnZ213bFpLMW5jdDlyR1JydjNiK2dUUmhmRlNa?=
 =?utf-8?B?TzArRHNEZ0FQUkJWQ0NGRUpHOHFSV2RXdllpOS85ZGRSMFV5S1JqOGQwei9B?=
 =?utf-8?B?cnB6eUpqUThJM2pqQjd4VjFLRWJYbWpVWU1WeVVCL2p6VitPZU4waUJhcnhr?=
 =?utf-8?B?Q2tHSFZmNzd6SzRUWkZmS3BZNmwrSEp6RHRMakF4UTRBSUlUR2pTWFlqa1Ni?=
 =?utf-8?B?TnZOdzZEeUZrRzJUMytaK21lbThuM001OUo5UzFMUmZ4SGVQL3NyT2ErdTRJ?=
 =?utf-8?B?WWNZQ29qSEFSbERsK2dhdEd4dEFlc1p3QWZ5bUM3OWpLYTJlSkFOaExwRWx3?=
 =?utf-8?B?YVlQQ3Q5ZmFZZi9LazM3SXlNM2o0TDN4YmRHUUNaOXhVZEVmR0h0U1pLOGx4?=
 =?utf-8?B?VmhOU3dMaEdCZ1dtekZzcmFMY3dBeGMwemdlNUlBRGdwT1lIcE5zZlF1cnVq?=
 =?utf-8?B?U1dDNGVERndmdTdzL1l1QjdBRCt0Q3dIeXFVVENLWjJCMG1vK3djZzNvOHAv?=
 =?utf-8?B?R09ucHZOUytOUnN4UlJlL29adjRKNG1Bc2c3TVp1V1p1Q1c0WFBkTlpwSTNv?=
 =?utf-8?B?YW91QnkvcXhKcDBjODVrdzgwcFBhcFF5d0oxTkt0T2FYSXB4MDNxdDFnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TndhNnd3eTVXYmx6dExNMytSNDJNbHJ2SXI2QU03OU5JbTROTUFsK20wS1Y2?=
 =?utf-8?B?SlpVa2Y0MSs2eFQ1dE42THFTdHpJUThiYS9naUdudE93dTd5ZnVpMzVZdWJw?=
 =?utf-8?B?RHppTVUrU0VhUlY0QTBKTU83emhLaW8zYXdWOVpybXZWeFlwcnVoeEw3RmxT?=
 =?utf-8?B?Qk5FbXRyajJza21PYWJUbmVscEpwajhmbFFoWVVLVFdYSDVhQkhOY01OMVNG?=
 =?utf-8?B?bjBMSGFRQjVoVkl0ZDgzckc5OHFvVmtQZ0htN213Smd1c3dlYjc4UnVEcnRF?=
 =?utf-8?B?ZnA4eVRENjd0NUo0dml5UW9JVjFrZ1dUNmpFU21CU0J4bm91MytHbXROMmc1?=
 =?utf-8?B?YVFqLzVCdndOTVE0c0Y4RVJhV3Z5Y1AxSHFzQlM0ck8zeWt0YXI2V3NQT0o4?=
 =?utf-8?B?VFlLTzhiQUdlVWtySDZudnpKa25lUkV4U3UvLzQ3QmtjMUl5dGZESFJHUmZI?=
 =?utf-8?B?ekpYNTk4bGtieC9STWl4VjhlVEJDMFQvczh1NEVYQjNRS2tUaHNYcmJBSEp5?=
 =?utf-8?B?cjlxYVRzVXJNMW51aHBmejhTblhIb2dmcVY3OFdQeHlEOW5EZ0I3dml6MmdN?=
 =?utf-8?B?emUwdmF0ajZnSjZ4OFZIYm1XSFZwK3hUSzFOOWVPODVJQ0QvemVHRDdHdFlC?=
 =?utf-8?B?WjNMcnNXQkJrY3VHeEQxQXg0b2pkZ1VvNGZlcGVONVZhcnJDMDNvK2x1S1pz?=
 =?utf-8?B?cytNTGhzOWtwUkxvdTJpaFlrN2tRTWJGNVBvN3hLYzROdHMwQWhMbzZBT3pI?=
 =?utf-8?B?bjdVeFgzTjltVG4xNlkxNjJ3aUhUZmI4bWg5Tkl2L1RUdEdMMlEyL0lJRjMw?=
 =?utf-8?B?QjU1TW4wMXZ1M2dxcWhQSkpFNFBJUEdhVzYrc0N1WGZiQnUrdm1jN2FLZ1B4?=
 =?utf-8?B?SW5HV29aQTNmYzhHakpuMlUxTWFRNkI3eFJWRTFwTldTNEFCWXczOG0wNnBr?=
 =?utf-8?B?M1ptNUdOWUpyV2VKMHZDUk1IU3JRS00rOHNueUVFWFlnY280MjlpSm0ybHNm?=
 =?utf-8?B?K0N0WWJtbUI5amFNS0UvNjBXMzh0dVNnZXNPUnljSk5YalM4bHNKcGNxU1d6?=
 =?utf-8?B?V1Jhd2h6dGRXZWw2R1RMcUdQdjZTTktrZ2F6bEhLUWFQVHdrYVFFNmpJeTBN?=
 =?utf-8?B?ZE95em1rM0cxTmtGRGdkUXNnRDh2dEpsbG1ZS055eHE0eXkvUFZFSDFWa0ZN?=
 =?utf-8?B?VEdXWTBqLzcyU0JJZll0OVdyVE94S1RMZFdrM21lbGtnOEJtWDhpSjREamR0?=
 =?utf-8?B?UEJHcWpwenRZUGFlNlN1ODNMNjdHVFRjL0l4Ui9SREY5bTgxMC9tR2xjaGNl?=
 =?utf-8?B?bkcwamxmcDdITU9TVTJpdEVaSEJKR2R5U3c0K29aQndkRjh1a1RtdEQ2WGVl?=
 =?utf-8?B?bVk3aFJaLzJsM0tDbVFpWTRRNlF1b0IzWEFOTmZRWVMvbTVzUWQ1dElOZ3d4?=
 =?utf-8?B?TEkyTjJwcitTY1AzUi8xcGdoTUxaOGRCUVNSUHp2djN0eGtveVlMMDJMeEM0?=
 =?utf-8?B?cmJWMDJVeVpIa0pPcUtwSWpuMVljMlR1bWlvTGJTYkRwTU42ejVpNkY5SWx6?=
 =?utf-8?B?UTZtdE1xUWlLZ2EvQ1RXY2JFM2hicUpUZGpFdXI3bXEwa2laejdrbk90RmNO?=
 =?utf-8?B?c2Y2RGFDQlVmZDhtL3lYYnlON0kzOWI2eXNSR0YrY2JPR2VON2FvZExJQVlE?=
 =?utf-8?B?alY4L3liWXBTVkd3aUttR1VoQnFENWpmazh2d0NKWXRBeUNZMlB6MXBUUVRL?=
 =?utf-8?B?ZHMvak9UNTdtTHkxck5iN2Iyam96OHdnT3FDd0MrRGFicFRIMDl4WHBZOGNa?=
 =?utf-8?B?R3VRbmprRi9jRFN3RkpISXdqU0ttSzNGQ0ZGdjZ4bXp3OWlicUFxcUlSdy9r?=
 =?utf-8?B?OHV4aDV6cDMxREoyOVNiT3l4bnIxWEhVSUlHQll2SitCR0pnSkxpOHM2OTVJ?=
 =?utf-8?B?MkE2dVp3UUp6K0RPRXlKaHdYcVNyOXBiUDBacERENEZkQ3k0YnpiL0lNYVZ3?=
 =?utf-8?B?SW1ZQmI0SnpRSWlWQTd4MTU5dmZBOWNidFQxT2hEMW4yU0h2ZW8xa281ajVk?=
 =?utf-8?B?NHJWOEErN09YaHhRSFhTYThLUkZUcUNiTlpFREJzUExRT2dTODlqRjBrYnVD?=
 =?utf-8?B?VFBLdUw1eCtZQ0grUnRQN2JvdmtZNE4ySno1d05iUkduZGZ2TGdiQmF4Ukc0?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f07416-4b6c-4760-79d6-08dc74293ff4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 15:19:29.8257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EVOtyovckpyRnVj/dXGfrob5OxzG1JiTz0tq0e6+ihW73qGGoZLqqVhq4bH6VEyZ/zj8e+ofloXFG/kNfszJSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7537
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



On 14-05-2024 00:25, Rodrigo Vivi wrote:
> The very first memory operation on a mmaped region after runtime suspend,
> the device will be resumed if the memory used is vram.
> However, after this first operation with page fault, the memory
> can be migrated to the system memory.
> 
> During this migration, Xe kernel will get a notification at
> xe_bo_move_notify, and the bo will be removed from the
> vram_userfault list. Then, on the next suspend, we won't mark
> bo for page fault and resume won't happen and the active count
> won't increase. This is okay, since the bo is now in the system
> memory we don't need to wake up the device. But the current
> test is wrong, because it assumes that the bo keeps forever
> in vram, what is the issue here.
> 
> Only checking the resume after the first operation is the
> enough. But also, ensure that both read and write operations
> are actually validated.
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   tests/intel/xe_pm.c | 36 +++++++++++++++++++++++++-----------
>   1 file changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 72d484163..81226a910 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -37,6 +37,11 @@
>   #define PREFETCH (0x1 << 1)
>   #define UNBIND_ALL (0x1 << 2)
>   
> +enum mem_op {
> +	READ,
> +	WRITE,
> +};
> +
>   typedef struct {
>   	int fd_xe;
>   	struct pci_device *pci_xe;
> @@ -525,7 +530,8 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>    *
>    * Functionality: pm-d3
>    */
> -static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
> +static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
> +		      enum mem_op first_op)
>   {
>   	size_t bo_size = 8192;
>   	uint32_t *map = NULL;
> @@ -563,8 +569,12 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
>   	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
>   	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
>   
> -	for (i = 0; i < bo_size / sizeof(*map); i++)
> -		igt_assert(map[i] == MAGIC_1);
> +	for (i = 0; i < bo_size / sizeof(*map); i++) {
> +		if (first_op == READ)
> +			igt_assert(map[i] == MAGIC_1);
> +		else
> +			map[i] = MAGIC_2;
> +	}
>   
>   	/* dgfx page-fault on mmaping should wake the gpu */
>   	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
> @@ -574,12 +584,12 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
>   	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
>   	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
Above line can be removed.
>   
> -	for (i = 0; i < bo_size / sizeof(*map); i++)
> -		map[i] = MAGIC_2;
> -
> -	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
> -		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> -			   active_time);
> +	for (i = 0; i < bo_size / sizeof(*map); i++) {
> +		if (first_op == READ)
> +			map[i] = MAGIC_2;
> +		else
> +			igt_assert(map[i] == MAGIC_2);
> +	}
>   
>   	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
>   
> @@ -781,7 +791,8 @@ igt_main
>   			     "when device along with parent bridge in d3");
>   		igt_subtest("d3-mmap-system") {
>   			dpms_on_off(device, DRM_MODE_DPMS_OFF);
> -			test_mmap(device, system_memory(device.fd_xe), 0);
> +			test_mmap(device, system_memory(device.fd_xe), 0, READ);
> +			test_mmap(device, system_memory(device.fd_xe), 0, WRITE);
>   			dpms_on_off(device, DRM_MODE_DPMS_ON);
>   		}
>   
> @@ -800,7 +811,10 @@ igt_main
>   			/* Give some auto suspend delay to validate rpm active during page fault */
>   			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
>   			dpms_on_off(device, DRM_MODE_DPMS_OFF);
> -			test_mmap(device, vram_memory(device.fd_xe, 0), DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +			test_mmap(device, vram_memory(device.fd_xe, 0),
> +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, READ);
> +			test_mmap(device, vram_memory(device.fd_xe, 0),
> +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, WRITE);With a comment this is
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal
>   			dpms_on_off(device, DRM_MODE_DPMS_ON);
>   			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
>   		}
