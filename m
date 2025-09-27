Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B741CAC5B8
	for <intel-xe@archiver.kernel.org>; Sat, 27 Sep 2025 11:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54FB10E197;
	Sat, 27 Sep 2025 11:21:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JJ+EfHip";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D3B10E385
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Sep 2025 11:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758972073; x=1790508073;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DM3UIjmHWYcWhN6x296IjH92dij6UsI15KwmXcVMu0Y=;
 b=JJ+EfHip2SrOuanbPRYVnDwA9Y2vZU3dxANYW+Z4aup/cD7fSXKv5KlY
 9Qz153qoQpENaQPvUR7T13xCTDcTNccxvfcTgcM3NgrC+dAhQ++H2euj3
 9+HFZbh4ci6Hn4d9dziuCJX7nqGQvimDsFzgQxvlVRJxUhzfGLQ9JUzvl
 IlhQjZrrGgceuCSzeAgnIoghkzlMxlU+jr8S980uMhBEc2aJOYdjq6f44
 r1u0LSTwD86hQrgeCf8eU2N28R2RAIQ/CwH7lqjdV23qFPmDqH1LVkAU8
 7yXfiTWv1dboe+DJPHXS5jgQT3flNixqdq2bTxRLmEChvugOVkRckliBw A==;
X-CSE-ConnectionGUID: 0pQ34X/NScOFpgt0mfZLjQ==
X-CSE-MsgGUID: KysE4byNRpuRk6nqa7nw5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="86732532"
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; d="scan'208";a="86732532"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 04:21:13 -0700
X-CSE-ConnectionGUID: hFhGwxD6TQG0yVyY8TEl5A==
X-CSE-MsgGUID: /Sn8joTTSyKQ0C7ZSLeNcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; d="scan'208";a="182226369"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 04:21:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 27 Sep 2025 04:21:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 27 Sep 2025 04:21:12 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.65)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 27 Sep 2025 04:21:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CyLA+k6wnVyVriPQ5kDAmZsQIGHjJ2ZZyg8Oa/BvRTGtcyA2/eYb6icazTw3hUj5A9HO6HOAE89nvVzt2NyjsJ3Tghi29xb+jgM7lF3xCCVmFbClq9btqoQ4pC0W/b/tP3grdxVajXIAQtPPZA/CU6JBInwbHdIcEXYnEl3Sgnuh2y7aL8mJ8GViXVZnZT3SmiQbCZSvAg2i+FsV/SfVNZEJpK610H2NnvO+kqJdLgcEDUC4fw97Fz6k9eFgl0kMLLHQ6RApoSpnXKWQ5C0J1ApI9mI9x1lgHVfOOgOwFAXUr7UIepshXI/CLh20dxCjzg9erNMtSl8liAwOyC7MVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRh1FuXEWoXkTHEQ923Y8yk5SLdC+IVY1CaPBaR1RX0=;
 b=dkV9QmKbyP29P07XdL5D+656dcpr3/+QLfp1Q0LuRYXkayhTct8PgWiQGf42sn+RkDd//CtNpQGB+asYeo37wwv76VBP112msa91r/K8WfuqgLb3Eq0tNUXcGRDIBmGV3sLoFlxQzqcgo/5fp2Go35OPWZSrMJzFnaRz8tALvtPg72L6H1Bu7yWS9QupcSPI5r/sRnx3Kw97bdlmdX5R26SYyjJkm1gTub23zUOhK2DUbrDXy+BlnmEcDeGyp5bmLncAxSf/l00X8QMMhmdpbcz57vu70/spK0N2ZYDT2FyIKbtRXB4S046p30HaIbZkUQj4L8yQ7VHhIKK71aD1yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SJ2PR11MB8321.namprd11.prod.outlook.com (2603:10b6:a03:546::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Sat, 27 Sep
 2025 11:21:10 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Sat, 27 Sep 2025
 11:21:09 +0000
Message-ID: <6573c9d3-3fa1-44fa-b32b-6ace101cfac3@intel.com>
Date: Sat, 27 Sep 2025 13:21:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/34] drm/xe/vf: Kickstart after resfix in VF post
 migration recovery
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-24-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250924011601.888293-24-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0202CA0004.eurprd02.prod.outlook.com
 (2603:10a6:803:14::17) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SJ2PR11MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: ef8562aa-b97f-4aaa-5a78-08ddfdb7f535
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M24vOUJGbklMQWxYK0RlZE9ITkRzNk9WRzBQTEpBN24vTER3VnhPKzJRRXNl?=
 =?utf-8?B?M3Boelg3M25Qa3Zra2lvRVd4WUlvWkFJWXFLQm04YTVWZ0lvNUxRTW9sTWxY?=
 =?utf-8?B?UlQ4SjN3dE9Lc21hSU1mL1JRRFp0TkhYR1AvOG1nbVIwN3Z2MmRrV0N3TGto?=
 =?utf-8?B?dXNlelRKdDlLektZNmlDK0hXOG9lUFlSR2hTNzkxRFQ1OW9Qako2NVlkMzB6?=
 =?utf-8?B?WWIzYXJYNmtqY2xHMk0wQ2FKVjIyVXhHeXphZXplRE1YQ1VSOTBRdDJIR1kv?=
 =?utf-8?B?N2kwTjRJVFF5Q0g4anQ5NDIrSjFqcEZ2ZFZUZm56ZGhFQmFuNUI5MTl5aU0w?=
 =?utf-8?B?bXZScmhTa001b1lQNlUyazNodTFyNmhCSnVheUJHVDFUL0hZOUwxR2FNODE4?=
 =?utf-8?B?WjZsWFlScE0wOUQ4SUFYaDNqMnYxd2tDKzJ0aU0rdjJYUExlV0dCM2k2WW1C?=
 =?utf-8?B?aThCcnZLOVh2U2ZQa0dCRy9BS2tzSWI4REJOOU1GM3FlMFFvcjYzV3NLNXBi?=
 =?utf-8?B?dDV3elBIRXVHUFJjUytnZDV2SlpGTStPNVJtcEd2OFJkUi95N0lWUS9pUXJw?=
 =?utf-8?B?VWF4VktvSW4xRFVFeEN5Y2lvYXlZSExJVUQ0QlRuczNvZXdhNUNteHRTOTJV?=
 =?utf-8?B?K1BYa2tkVVl4eGQ2WUVMZHFhV2FmeCtHU0NJWENiN3hMWUFZVXhpSXZESjN1?=
 =?utf-8?B?K1Ewa2RiN2xaVXk4ZWMrMkRGOVgveks2dVVFaENBOWxWcUZZZW93NEhicTcz?=
 =?utf-8?B?QjFpNEpCZUY5eTBsRlVWczI2NU5rakpreGQxZ3lXTG9sMnJJSWN4VkhFbDBz?=
 =?utf-8?B?aGphWk9MdnBWRUlkLzdJd25xQ3pmNjB5bS9JS2tUTkZlc0R6R0lqVjZ2d1lC?=
 =?utf-8?B?ZTRyNW5yTzFLQnZvbVp2RDhMVldaa1NvOTIzbkxwWUJIb3lTbVFuWUNWdDlT?=
 =?utf-8?B?MnFKU2JpSkkzOXN1alRmbkozdldnUzh3dEU3RTRSWlZ2anhTN3hOUGtoV2hx?=
 =?utf-8?B?YzljRXZIcy9yMjFzb0JOYUhsWlFyWGtCQ3BDbVdpbGJXcUhPK1RxaGFPNWk0?=
 =?utf-8?B?aTJvZzdyTXhWZlpJMlZ0RTF0RlFSSGVYMFBRU0tzWElxRUhzQVd5SFhsUlgr?=
 =?utf-8?B?RWc3aHZWeURBQ2tQaStQQ2k0allubi96NHN6RFB1YnZncWlCKzl5Nm1yTUVB?=
 =?utf-8?B?eUJZR2o0TCt3VGNXNll4UmpSQzArS0V4SVRjYVp5N3JLbzlCcDJGejJNMVRW?=
 =?utf-8?B?SXFtTjRHcnNJYjBTN3AxZkViYmYrdlQrL05udlNXaWtFMWtQSmdWVnM2eFhq?=
 =?utf-8?B?YThKYkQ1QWRPcUpnOWRPcmlNVXQvTW82SVU2WTU5M2dUd0xDZ2RBYUJQbVJ5?=
 =?utf-8?B?YjFsT2xtTVpmOTN5ZUlMcmsxaG5DZXNYNGRsUy9tR0VJcTJxaTdzQmlHcUJx?=
 =?utf-8?B?KzVrWm0xMTRpRTlmUURFUVVpTTB0YXV5M1lMOEhRRGFmcG5DVlQ5Q0c4cEVz?=
 =?utf-8?B?bVJ0dzRua2NjWWFXSWNuNWU3MnR5WFBQTW90WFkxa1NLSHQwZUZmL1MvQjNP?=
 =?utf-8?B?Q2R3SHFjTytjR0pmK1NLVXcvSVdLQmpDWW5LWXliampyVlM4Um8rYWwyTTAx?=
 =?utf-8?B?TUdQd3hxcVQrZldFMjUybEg4cGlFbythY2pxZ093MTh2d0pKcjRWY2NjYmRP?=
 =?utf-8?B?SmcyQ1AvZEdrMURvUDZUbUxWcDM5Z2ZFM1duVlJTc0RpeDZyWnZGeGFlR203?=
 =?utf-8?B?SW1nNEt4dHBOaGhrb1I1a0FVdHIvTStKSTlKMi9ZdW51RlhWZWxwUmZpQjA1?=
 =?utf-8?B?dk9DcmFkWWxicWZOVDRhYnhDbUowblE4a3JkSWVkOVBFMEdvMnFsYlhRbmwy?=
 =?utf-8?B?dVNVWGM2VGhEd3BLa1Vmdit4THZVSm51a25TYjY0WmdTYUhFUytsVFNDOTJz?=
 =?utf-8?Q?aTy7jb37g/9yn6FI63QGul3UzB11FEhT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akV6QW9OQ01rODFEdE5iRUlkUm5EM005eVltQU95TmN6ZklRNjBuWlY5VjlO?=
 =?utf-8?B?ajRZT0ZCbTZoNmI2NDJYSzVDcmRVcE50bXk4WGkxZHN4d2NLVkEwNFJRMW15?=
 =?utf-8?B?andlK1J3MVg4Q1VPbEhrUGdIKzlrUWRHaExHbWFWQnJvd2lGUEF2S3FQbGVk?=
 =?utf-8?B?Z0NJRFVGUWJubXZVQTl6RjVSa25XMGJIUk93anZEYWpTc3JqeU5vNzJmdFdN?=
 =?utf-8?B?czludU44bXA2RnA5TnhvQXpuWnJMQlU5VWVsM3FPamFycExJMHhuUmpHYy90?=
 =?utf-8?B?TFZhVHRTR0FlUGsxUUptWlhKVCtheTVDNUkvM09iR2g2a29CQjljb0d1THly?=
 =?utf-8?B?Yy84V2g5aml1NWhVSTZoT3g1bVNPeGhkMGVNc1g5NHc0QUljbThtVmpKTDdP?=
 =?utf-8?B?NHYydDlmdEIyTW5LMXhKVE84QlN6SFhVUlpnV2xFSVlkWTIzOGwvdGVreUJY?=
 =?utf-8?B?TnRsem42ZVIrVUdYcGhRUmIxZGhndy93OHNpbmF2dFVKY1p0eksvenZSMzdt?=
 =?utf-8?B?OEptSTNwKzRSTXJLaS9RVVpZa3pOcElxM3MrNE5VT21zS3h2cS9sRW1YWGJF?=
 =?utf-8?B?QUcyLzRFVDhZSW9iVnpLSmlpRXA2TVdaaWtZZ1gwZ1Q2aFo5UHhpb1B6K3U5?=
 =?utf-8?B?V2pLQ2NINTJDNmRGZURuOFYrM0tjK3QwcTB3Z2dUL2xtUnpyMkx2eVJGTEFt?=
 =?utf-8?B?T1ZGeGx3aVZBQjYxUFcwY3ZCMzQwWWNaUUJ2c3JUOUs2VUZ2emN5ZW5KeTJj?=
 =?utf-8?B?Tnp6T3diR1IrWXdVVEtmVnpaMHZpL1lNakZZUFlQZ2FwNSsvS1lOcGZnM0s5?=
 =?utf-8?B?UjMyMXNZS0hMSFNteEw3NDYzZWxIT0tCemRIZEllR2pGaGo5Sm1MWjVCQk9l?=
 =?utf-8?B?Vm91NGxtOXFBWXlkNTZzdjEyZ001L0h5OWlhZTQzU3VhTHpKYnA0SjR6Vncr?=
 =?utf-8?B?RnV1cXcxdVNHSmNFM0dYWVo4d25KSlZNZnYvQktJbDBMbU5wT3EvNXlyKy9i?=
 =?utf-8?B?STY2RDBRUlNyWGtBVWg5MzZiUUFMTWM3K1hwRGtQMHJZaVlyZmJTY3NwVFpa?=
 =?utf-8?B?a3UyNUxabGxiYTZ5QWlvMDhGL09LME1rWElsc0N6QWFDZnZMZlk4M0hjanpU?=
 =?utf-8?B?N2dyWmwwK2FOUGkreWpDRjJYU052U1FOS0s2eGxMdXVlbTNyZ3hqRHVKbHFi?=
 =?utf-8?B?U08yeGl1bjNvaENjODlaZjN3LzJJd2piYk91aS81Vnh2RHlyZVJNd2JBTWtX?=
 =?utf-8?B?czBWOTZrU2M2S0pvcnZSclN1UkZNcm9hVG4zdmJLd3pMS0I1YU1ZOG83RVRw?=
 =?utf-8?B?MnFFZEthSCs2dldIaVNpS3d2Q0dvenJzUFBjejhuRUNIK0lBdk9BRWRIMEds?=
 =?utf-8?B?dGxkYzE2VDZjVENFTVpDbjIxaFl0VWFiQ1ZkeG03S0I1U3IyNWlxTW1tK0F6?=
 =?utf-8?B?NUhWdHNJUE9TeHN6MHZWRVNwemJ0MlV1eGh0cGRLRFpwYkhaeVhzR3Nxbk9I?=
 =?utf-8?B?bzJweUNUV3FWR09JS29EUThsVGcrNDZraCtxS2Y4TFVLWnBLUHMrM09icnNU?=
 =?utf-8?B?WHJuNUVHWnMvcFNzMzU2M3ZJZU8vR0p6ZytWczJwVkdrYkM3clVHMENnUXp4?=
 =?utf-8?B?NVo0M2szYjdLeFVwNGJ5OWhhS0VrVHV5ak5NVWx5NGp0RFZSODkxSkNxSVlZ?=
 =?utf-8?B?aFlURXZ1YWFSeVdpWlh0bUlFWDlDV0NiZXNQam43cDczNnYvZk5xMTYzNUI2?=
 =?utf-8?B?Z0RnTE55WGQ4b0cxeDVBUDgzeUdJekp3RFRPVTc2Yk0yWlVVWEgxOFBpdGNR?=
 =?utf-8?B?NVZvRkt3STdyc1VGY3JPLzVwODJPdWtCS3dYUVpUclZ1b291dGgxS3hiVXd0?=
 =?utf-8?B?R1BhQlJYZVV5VlVRWThuaDVSaUk5RUxvT1ZkSFdpc3hoUXZWTEY0ejQzcmFk?=
 =?utf-8?B?N1FVQWpCb0ROdlhsRDFPeUtleU9KUmpqR3FBTjNNem9MdVhrUjRuV1kyVTB4?=
 =?utf-8?B?M1JCSEMwdEE4Sm4wQmxmMlM0QUhFc2t3c0F6YmNpdklIemhYYVlNR1hTeWtj?=
 =?utf-8?B?eS9RR1MvNEhlYmkxdGw5ZytuaXRHSjB3UHZPb1dmTTBjOXdtbUliWkZZVGxU?=
 =?utf-8?Q?D9g9KDFsRwEVm5luZEHef3zmR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8562aa-b97f-4aaa-5a78-08ddfdb7f535
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2025 11:21:09.3720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kq+CaDUR1k4owHz4nQHvaxi2MTBpLLf/IWOo7rwpAY/BlvKh2qJNV68yXCk7kftKlUBki6GXI7717ZV/1L0jJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8321
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


On 9/24/2025 3:15 AM, Matthew Brost wrote:
> GuC needs to be live for the GuC submission state machine to resubmit
> anything lost during VF post-migration recovery.  Therefore, move the
> kickstart step after `resfix` to ensure proper resubmission.

All good.

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

-Tomasz

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 01399a871f12..2a077a98e92e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1216,13 +1216,6 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
>   
>   static void vf_post_migration_kickstart(struct xe_gt *gt)
>   {
> -	/*
> -	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
> -	 * must be working at this point, since the recovery did started,
> -	 * but the rest was not enabled using the procedure from spec.
> -	 */
> -	xe_irq_resume(gt_to_xe(gt));
> -
>   	xe_guc_submit_unpause(&gt->uc.guc);
>   }
>   
> @@ -1239,6 +1232,14 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
>   	}
>   	spin_unlock_irq(&gt->sriov.vf.migration.lock);
>   
> +	/*
> +	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
> +	 * must be working at this point, since the recovery did started,
> +	 * but the rest was not enabled using the procedure from spec.
> +	 */
> +	if (!skip_resfix)
> +		xe_irq_resume(gt_to_xe(gt));
> +
>   	return skip_resfix ? -EAGAIN : xe_gt_sriov_vf_notify_resfix_done(gt);
>   }
>   
> @@ -1262,11 +1263,12 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>   	if (err)
>   		goto fail;
>   
> -	vf_post_migration_kickstart(gt);
>   	err = vf_post_migration_notify_resfix_done(gt);
>   	if (err && err != -EAGAIN)
>   		goto fail;
>   
> +	vf_post_migration_kickstart(gt);
> +
>   	xe_pm_runtime_put(xe);
>   	xe_gt_sriov_notice(gt, "migration recovery ended\n");
>   	return;
