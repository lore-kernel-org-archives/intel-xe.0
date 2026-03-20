Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4378C1099B34
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 18:35:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A4B10EAC0;
	Fri, 20 Mar 2026 18:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZAxlL2dh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5463E10EAC0
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 18:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774031741; x=1805567741;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yT0b9w3PD4qn+3PEqvlDd/1p8FUCF0wpgczs7/uH0Xs=;
 b=ZAxlL2dhUQhWzbN/s6OUxFewDn9Sz5LHJ9DaUrNHKB+c+gPbp4mjWdiy
 g0bdsK47DWdwoeUQOY/Xrg6iFSUCzwP3ICUv79dpYOGlfslrexQN+GDoN
 ahfn0DvL8/fQm12yeNMiVo7fNnmQU9Bt0saChXlL0hBjHSAckQpA7L3H5
 RhypBtgYmG83oNiN/KpLKSZBTHKYOSVfXi7SEz//60LAX0Q3Fvhv+QfiO
 fiCEbNgpUMa+qUnC09iYkfPyfUx8rK2M1d1X/NRtcgHQkU35qxahij2R8
 z3D5BHU1vj5/q6N9HHQSSTs/u9qIoLJN3uB0MtOXmNwQq5IUJC3QRpMij g==;
X-CSE-ConnectionGUID: qbvNfgLTT0yfH+jbwZ87rQ==
X-CSE-MsgGUID: 4PbFVV65T4Gu5Bumxail4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75092790"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="75092790"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 11:35:35 -0700
X-CSE-ConnectionGUID: UmpDOlnzQMKQFJj+LhYNsg==
X-CSE-MsgGUID: u1uVKnubRWC0UIwiluIUsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="222593340"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 11:35:36 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 11:35:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 20 Mar 2026 11:35:34 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 11:35:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ix8bCrt5FsVcYavlYVNZ7vap3rL7BsRtlBkiGy1JO6yN6ePY5sX1wnwbzQ67qguYQ5ANJgNOOz4oKO++P+YzzJjiJgDCiy8TwEu6KPAVr7FVmGL3iIGF3Ix/URhmfcBBpbfWQcoCR7Y1CxB7ndNg/TgrVllH+sOV4Hel9A03LkbO967UPPksBex+ZLSONOLboJt+j5RJkjOkJvFgg1kCCZBTDHhQ3Ji5b7g7rbGhJZ20kKoNxu7aNKIPuEL29uMJ1dIT9tIyvCbgxt+hzIRjo7CXpDIB8WAfwq93X3MceJV6yco/Dn/32JMoPoS2CNIcSWmN5qa2WJy+RP/wM8Tc/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Uazn86azpR4sCz/zpQppw69y+7M4islDn1ATvt/0C8=;
 b=MZhTvyxmUlSW8hGQnakkEagy8IE9P5MLI1vPYvlwX56d52JEXs0CyGVFEdccl03igNF115KEw51tuMSqbubKRGCiQozyugDtuyuKWXnn29hPz5uPiDw5avDLM+hdT5J8a5qHFEebPl2Rck0zRCgfXAyjma+GFzrVB6eofT9Nkf9FRKpjL+b9tw4eJlJ5KjMEsJDlmFPESEYXUyIrbspKn9fUP4y0DTRKvPA6rEz5zz0iRlGtXLjB35zgOsiVNY23qzXJo8iBgLFarTohNamwszIh6D5eI4At+e9PySPL2cXek7F2lj4BhC0dTTwKtJEy3omodzbNbMU0jfSKzTlTlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by MW3PR11MB4537.namprd11.prod.outlook.com (2603:10b6:303:5d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.14; Fri, 20 Mar
 2026 18:35:32 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf%6]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 18:35:32 +0000
Date: Fri, 20 Mar 2026 11:35:28 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Cabral, Matias A" <matias.a.cabral@intel.com>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Degrood,
 Felix J" <felix.j.degrood@intel.com>, "Ranjan, Joshua Santhosh"
 <joshua.santosh.ranjan@intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe/eustall: Return EBADFD from read if EU
 stall registers get reset
Message-ID: <ab2TcD8x7YP674nG@intel.com>
References: <52d991cc7e8bec514bb582717a1c42033672d4a5.1773683739.git.harish.chegondi@intel.com>
 <87se9xpqub.wl-ashutosh.dixit@intel.com>
 <CYYPR11MB8360A705B57CE5CF6CFFCB6BB24EA@CYYPR11MB8360.namprd11.prod.outlook.com>
 <CYYPR11MB83609F08EA23C7B4902042E9B24EA@CYYPR11MB8360.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CYYPR11MB83609F08EA23C7B4902042E9B24EA@CYYPR11MB8360.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0048.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::23) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|MW3PR11MB4537:EE_
X-MS-Office365-Filtering-Correlation-Id: 67cec104-a3ee-4505-5322-08de86af77c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: EAZwE9LuhAXAakdHFXPUus7sV8lGPhuCKarN+D+t/i23KoREz0hDAjJDLy5YPeGG2QixDJtEAK25Js0i4pSv+nqPKYeC4/7Hjn1CWxOuvtDdIdT8/mg1a5YAVEWhxORtuEt7T09btKuvURL4PEaHudKGOoBwVdkFDZSF+UaaO0qkAyLFi+h/7m12O5TXEZVkWZJ0+nS7S0EOc4ahrYjGDf0bwaGzqDp/y7kF50d8fDagBLdg6iiDw8N5HMqUUCatEi4vYyzdgOku8S/1WFqeZp0+GgvRii4W4pZ3+OkKRxZw9yGw0qsStFhaOjl9PGJnoND5UNOvMo0wZS0iAO8m0lXFqhxIbBbZBf8rW+DdXShM0Aae3QiWBVBs0WokRXLNItiChC7/BW81WFaz+Q4NHp9N5xyE/27bAXHAKmqffrO7cPjCH4B5GbK53W3ftLx/KpqEzzZ60c7fJrn6hR266iuQP6izApM376Vzi3UvMlDC12OjtGwzGZ0N5PgPwchG/ny1rt0zPtoKVY/qMLwc06yC3h7eZwcD3MHVBzhNHFMBsdEtlAvAmy6kPsJX0Y25V2g1FPEWOpjkmDcFtcYoqTCwLEBsm4IdKSv+SVeKTpGuXLXzRni2P2pY2qGJ1NK3y6K/G407f/c7gz5YZepqtBQ6GTeQ0vCu5vj2fJ3SpT2pVgnHsRONviTzj3oq2lHOUyM1IeQMha6X9hXH/QspsjWALszqIx5auEtTDJbSimk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dU1IT3FwZU9zYlR6bWN3OUxCbjBKUkN5eUl5bldCUWJ4dUtmTTI1NE95ajRY?=
 =?utf-8?B?MUtKNFpxN3B3TFFNUjl5bmNMazd2dzV0eStuRks3VkMrR1RqajdNZEdwRkZE?=
 =?utf-8?B?WVZ3YitZWWVkYXNpY3EwcDIrSmRmdy84NElFRjgzVlNMNWQrY2JXb2R5dlMr?=
 =?utf-8?B?TVY3VWtEdzRPQ29DV2lhZmtpd1V0MitIK25hckdtTVNqZGtQRmR4V3RxTko5?=
 =?utf-8?B?Z2NUelcxb2RyQjBOUDZWZXp1cXRscEF4YjdieVN2bHZKVzZyVHIzQllCV0Q3?=
 =?utf-8?B?WnVMcjBRVGZJZVVuZ0dmK3FSM3VzQUVSV3hvdUxPd1pYY0piL0p3dmpHckxy?=
 =?utf-8?B?WTFISlpDeVUrbTZKUVJrQjlwMXJaUXdjTGtlR3dNeHcwUFBCcmc2MzFQK1Nh?=
 =?utf-8?B?YjFSdnlCQ1lsMUYwVy9nYy95blVsTTFsMEZEb29iQjRLY2pOS3B2d2F3S0F3?=
 =?utf-8?B?U1M3VCsyS1Y1MjYwZ0dWWnR4Z01ldmxkME9PSkVnU1FlQUdHc2ZPTEZHVlkz?=
 =?utf-8?B?cFdsNmVUekgwK09ZZ2NwYjZyeGsyV0FRZDVTalNzbXJVbVdJa2pna0l5MWg3?=
 =?utf-8?B?WStTalJXdGRQL2VBL3dqbGtzNys0ekx4b3NkZDh3NGNpcytjdHZaVThyUnFN?=
 =?utf-8?B?TUVFR2NlTkNNbEkyNVRmM2R2SmpNcmNEcmFSQk5vQlhKcFpPNzlXSGJoVlhM?=
 =?utf-8?B?VjFRZnY5Ukd1TGRSN3hYS0IxeG8xRGgwS2l1MUI2STE0YzR6aWNab1BGWUpt?=
 =?utf-8?B?SWpudFNQc2g5MVR4ZnBNcmh3T1pYYTVCU0VDaFN4S0lPWHdvYjFPdTNUUExj?=
 =?utf-8?B?ZVpRaXBYdFZGbXhDSm1CQ1JoNGpZd3JsMGtaaXV1dFhrdmtiNzB1V3E2WlQ0?=
 =?utf-8?B?TTY2dWdJL0Fub0I5SS93aTRENHFDV2R1eEpGS3UxVmsyQzBjNEVrZStuZTAy?=
 =?utf-8?B?eFpFZ2ROc09oaTk0eHpIQ1lsVDIrUmhwODEyOXNwaThzZWtzY2JrdXlDOWYx?=
 =?utf-8?B?UXd4VE4wMEsyL3FCUHF6VVFvL0tFdHMwNEV3VXNoQTJFWnkwUTQ1U1pDd0o0?=
 =?utf-8?B?OHFhdVRvQnoxWmRvbXdhVkNkWkcwbkxSQkNCOW5xckJxem1ieXdtUHpTL2p4?=
 =?utf-8?B?dkl1M1lCWXZ6a0RiRGE0NHFsQWRYeEVYNXN2aTV3dVpjcW5VdG5JUjdIK1hs?=
 =?utf-8?B?UWRCUTJibVRsTTNPN1FwdUR4WkJuNjBvUGszQ3dYZ3VKUjB4b1grRGczTXZt?=
 =?utf-8?B?cXIzTkE1Zmhta3RCaEgwUDVaUjBiaHZIbmpJVDZuQWtIaEtiWkdGQUU4c1c0?=
 =?utf-8?B?Z1A5VWVBVUdRUUZON2tqSzJtcnBYb1g3eDRITUc5V3lDUkdqS2hIQSt3UFFk?=
 =?utf-8?B?bzlMMjM4T3N4UWtrbmtWQjlUaVFaamt4ZFZ1N2syVWkrT01mOTk4OXlUS1pZ?=
 =?utf-8?B?REhsWnhhcGpLN1FvSFNYZGRWU2VnQ2RhRkdnaW1pdFBpRVBCdnNlbExPdWZ4?=
 =?utf-8?B?WlhCTW5TTjdBNC9IQ09zYWFMMWxDRWh1TGt4YzZaOEhGbXh1R1BzcGJTZmNN?=
 =?utf-8?B?dExOZUVXaXZubDJ5eWxEQktacGhXYUlBZ1g4dnYwb0pJVkF5STFWYWY4bDZC?=
 =?utf-8?B?RzRVYllFZTFINlZYNFc5cndna1k2eHlUY24vTndJM29zWmU4OXZKNmgvd0hB?=
 =?utf-8?B?TGFLbC9QZVZzUlI3N0IzTjNtT1hJOEtWNm5VU0VDakJKWHpXeFFyakF1aWxM?=
 =?utf-8?B?Njd5NjlpVWFORkFQSm1pWGVLeTM5TkdRbG9UbFVYbHgyWHlxUDZnaE5mSnFB?=
 =?utf-8?B?OTRxWitadHErb3gzWG9ZZW1sbmNzOWZ6cjQ1WHlKazY2V1JPVEtyWXhYZVc2?=
 =?utf-8?B?T2xGZ2xDdVNKdWkwVTdpY0pFQ1JHd3dzYjJIb0x0MmxocndlSXlsN29SQWcw?=
 =?utf-8?B?RVhGME5mRnRHZHdadEsvR2JqRkwvNDlUMytoaUxxVnpuTVJmd29CNHBzdkgz?=
 =?utf-8?B?NHhmSHFZVWNiUTZKaFA3Rnl0NGVjcG54aHMza2tNdVp0TDhBc1UrbUFxRit6?=
 =?utf-8?B?MjZBRmt5KzRmTCtvVEgzN2ZxQVM5WHVnNE04SkkvQURwMkZUR0psODgrUWh5?=
 =?utf-8?B?QndUcko5dmpNZ3Vlam9paEUxa0psZjhpRTNVWFZ1WENDWnZzS1ZVRERtdk5G?=
 =?utf-8?B?RTZua3FrWFJCbEQrbTJpbm1DVnZuMkY1WXJ1Y2xuOUJlakJuOVNrK2FwU1dF?=
 =?utf-8?B?UnJZRVhuaGVwcnp4UHZhNnE1N1phS3J0QmJSeURSVzhMOUg1UFl0eHBqc0Nq?=
 =?utf-8?B?ZDdQZkRBaG1mVUtIbWpUcVVRZEVGdXRabWV0enYxNG5XZlJ6UzA4a0c5ZzhM?=
 =?utf-8?Q?ENNEW7AIsj9pKYcM=3D?=
X-Exchange-RoutingPolicyChecked: JoK1WARW2zC+qbiRZYqPdVfBsM8fqrSm7L2MvzJcMSfUhfFfKFPm0tJNNNqVMf5niJAEHKhozAeFMxFqDZ1ex37DhYagUOELW6OGvBLNeWORgVsIsyFL3mCf40RwT5TCq7Ep7QJygbVPyvBl223v9wSc38Tz2F6IWvgGcQI0GYfYU77A2m51ea997f5K1QsxGgNy4txDYLkWsl3JrUGortPBFMkVQOAxrAXTxtIQpsabgK+Ij+7ld39QmcM8GUxWlbBzDk37hldGHPKjkpZbZHha2/PFEtpMkiVV/LhKihxrt9HOJxZ1yHRvpOC1WQtSI06dV+rzxrMSUw6KkNypZw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 67cec104-a3ee-4505-5322-08de86af77c9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 18:35:32.1886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: frZfwvGBIP1uF+Dnsm+6OwxBKrEu+3iulI3sa4V8XfexSdH12x67AtJZmiNgqMBajhOZdG3gVIsWpzwaH6VwWLgnNkGYz7AoDft9wRQI94M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4537
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

Hi Matias,

On Wed, Mar 18, 2026 at 11:38:29AM -0700, Cabral, Matias A wrote:
> Second question: in this condition would require a new return error from the UMD read() API telling the consumer a catastrophic error happened and the streamer must be closed, right ? 
> 

Yes the consumer of the UMD read() needs to know that an error has
occurred that requires the streamer be closed. The engine/GT reset must
have happened due to an issue in the profiling application. I think if a
reset happens, the profiling application would quit with an error and
therefore the consumer of the UMD read() would discard any data
collected so far, fix the cause of the reset in the application and
rerun the application and collect the EU stall data again.

Thank You
Harish.
> Thanks, 
> _Matias
> 
> -----Original Message-----
> From: Cabral, Matias A 
> Sent: Wednesday, March 18, 2026 9:59 AM
> To: Dixit, Ashutosh <ashutosh.dixit@intel.com>; Chegondi, Harish <harish.chegondi@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Degrood, Felix J <felix.j.degrood@intel.com>; Ranjan, Joshua Santhosh <joshua.santosh.ranjan@intel.com>
> Subject: RE: [PATCH v2 1/1] drm/xe/eustall: Return EBADFD from read if EU stall registers get reset
> 
> Hi Harish,
> 
> > return -EBADFD;
> 
> Is this making the read() syscall return -EBADFD or setting erno to EBADFD ?  would like to clearly understand how to detect this condition in the UMD. 
> 
> Thanks,
> _Matias
> 
> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: Tuesday, March 17, 2026 11:58 PM
> To: Chegondi, Harish <harish.chegondi@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Degrood, Felix J <felix.j.degrood@intel.com>; Cabral, Matias A <matias.a.cabral@intel.com>; Ranjan, Joshua Santhosh <joshua.santosh.ranjan@intel.com>
> Subject: Re: [PATCH v2 1/1] drm/xe/eustall: Return EBADFD from read if EU stall registers get reset
> 
> On Mon, 16 Mar 2026 10:58:56 -0700, Harish Chegondi wrote:
> >
> > If a reset (GT or engine) happens during EU stall data sampling, all 
> > the EU stall registers can get reset to 0. This will result in EU 
> > stall data buffers' read and write pointer register values to be out 
> > of sync with the cached values. This will result in read() returning 
> > invalid data. To prevent this, check the value of a EU stall base 
> > register. If it is zero, it indicates a reset may have happened that wiped the register to zero.
> > If this happens, return EBADFD from read() upon which the user space 
> > should close the fd and open a new fd for a new EU stall data 
> > collection session.
> >
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > ---
> > v2: Move base register check from read to the poll function
> >
> >  drivers/gpu/drm/xe/xe_eu_stall.c | 24 +++++++++++++++++++++++-
> >  1 file changed, 23 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c
> > b/drivers/gpu/drm/xe/xe_eu_stall.c
> > index c34408cfd292..7e14de73a2c9 100644
> > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > @@ -44,6 +44,7 @@ struct per_xecore_buf {
> >  struct xe_eu_stall_data_stream {
> >	bool pollin;
> >	bool enabled;
> > +	bool reset_detected;
> >	int wait_num_reports;
> >	int sampling_rate_mult;
> >	wait_queue_head_t poll_wq;
> > @@ -428,6 +429,17 @@ static bool eu_stall_data_buf_poll(struct xe_eu_stall_data_stream *stream)
> >			set_bit(xecore, stream->data_drop.mask);
> >		xecore_buf->write = write_ptr;
> >	}
> > +	/* If a GT or engine reset happens during EU stall sampling,
> > +	 * all EU stall registers get reset to 0 and the cached values of
> > +	 * the EU stall data buffers' read pointers are out of sync with
> > +	 * the register values. This causes invalid data to be returned
> > +	 * from read(). To prevent this, check the value of a EU stall base
> > +	 * register. If it is zero, there has been a reset.
> > +	 */
> 
> As previously discussed, the best way would have been to not have to do this. We would just plug into the handler for the reset message from GuC, rather than to implement a reset detection here (and in other places such as OA). But looks like if we do that, because of the way EUSS registers are reset, we can return bad EUSS data. So looks like there is no way around doing this "reset detection" here and a solution with the GuC reset handler would always be racy. Just for the record.
> 
> > +	if (unlikely(!xe_gt_mcr_unicast_read_any(gt, XEHPC_EUSTALL_BASE))) {
> > +		stream->reset_detected = true;
> > +		min_data_present = true;
> 
> I don't believe we need to set 'min_data_present = true' if we are setting 'stream->reset_detected = true', correct? See if statement at the bottom.
> 
> Also, since the write pointer itself gets reset during reset, didn't we want to do this register read only when the write pointer is 0 (to avoid an extra register read every 5 ms)?
> 
> > +	}
> >	mutex_unlock(&stream->xecore_buf_lock);
> >
> >	return min_data_present;
> > @@ -554,6 +566,15 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
> >		}
> >		stream->data_drop.reported_to_user = false;
> >	}
> > +	/* If EU stall registers got reset due to a GT/engine reset,
> > +	 * continuing with the read() will return invalid data to
> > +	 * the user space. Just return -EBADFD instead.
> > +	 */
> > +	if (unlikely(stream->reset_detected)) {
> > +		xe_gt_dbg(gt, "EU stall base register has been reset\n");
> > +		mutex_unlock(&stream->xecore_buf_lock);
> > +		return -EBADFD;
> 
> The other option is to return -EIO here and implement DRM_XE_OBSERVATION_IOCTL_STATUS and return status from that. Let me think some more about this.
> 
> > +	}
> >
> >	for_each_dss_steering(xecore, gt, group, instance) {
> >		ret = xe_eu_stall_data_buf_read(stream, buf, count, &total_size,  @@
> >-692,6 +713,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
> >		xecore_buf->write = write_ptr;
> >		xecore_buf->read = write_ptr;
> >	}
> > +	stream->reset_detected = false;
> 
> So after reset, if a stream is disabled and re-enabled, we expect things to work again and EUSS data to be correct (without re-opening a new stream)?
> 
> >	stream->data_drop.reported_to_user = false;
> >	bitmap_zero(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS);
> >
> > @@ -717,7 +739,7 @@ static void eu_stall_data_buf_poll_work_fn(struct work_struct *work)
> >		container_of(work, typeof(*stream), buf_poll_work.work);
> >	struct xe_gt *gt = stream->gt;
> >
> > -	if (eu_stall_data_buf_poll(stream)) {
> > +	if (stream->reset_detected || eu_stall_data_buf_poll(stream)) {
> >		stream->pollin = true;
> >		wake_up(&stream->poll_wq);
> >	}
> > --
> > 2.43.0
> >
