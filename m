Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2B5C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 09:14:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D38410E793;
	Mon, 31 Aug 2026 09:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jU9iILSX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F7A10E797
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 09:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788167695; x=1819703695;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eSQd77WaVL3BEAZiRp43Q1PzxQvYdyveMHnmKpOPHSQ=;
 b=jU9iILSXZxFHaslkY4O0/tsTcdFz0gxEwEvv5eQlkomoa3z/o3bj1OAj
 H9KtttEB476+LORjEk9GWF0vfKL2d396O/2yXuUEJ/Jy9NCxFMkzJgke/
 yLCJfvo5AQXY0J+ZqRsklOgusbzPba9ymRChHKr3TDM9Yk911JWpc5tHa
 9cL88OTDeV5/5aLVEBlbGnDSMn/BszO/trJdsss72Ns1J9AlnIf/2OkZw
 VmwkoodiDMQDdTS8tfSo8pAwleuW7AJ7PCiK4u6qB6iL5OYqPZ9k8GtJJ
 uip/XoMuob3xDeggD8mxidGalo1RjP3dJXBHObQRng8AFoUk6X5/aLxNP w==;
X-CSE-ConnectionGUID: D/T2ooHfSWS3tTh5mXCkkA==
X-CSE-MsgGUID: PHZgF4aCRYiMzjo3/02vsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="91083047"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="91083047"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 02:14:54 -0700
X-CSE-ConnectionGUID: HILFMClZTh2xA6kd6whh1Q==
X-CSE-MsgGUID: hWYkXSsbTuu6cOs8HHigXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="306981888"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 02:14:54 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 02:14:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 02:14:53 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.62) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 02:14:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lRrqywIeiJuuZVyRyckp6L+yKErHfAiaM1lXb9YWq4G6xbFGWGbZNsYvYpOibX3RgHwI9qV9iTja1lHcRNv30YQZrmY0Gae5lAl/2jlj7+TbrvoQxXdizci0ei93dMGj32birvKq1zPpq761QQ2Ypf9D1/RYiw5Kqd2Zc+BzqH1jHK7Al6pu4Q7XWwEMGjyjfDTjsBTsp/kAPYIvlAuwOAkdsYCpxs7ImoC+KPq/+tSqkIYoFGFG08b01uHYfekGpHyPwFSnuokzo7jXl9RbrjNzPBq5WphxPomkObSX8AXpaZG3WoftUeC3/bWQRc6mc8vuGHOMDk3xW47aQeTCvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2C30tZ8mQIg7tEaSt0P4u3tiolpS+fF88+eHAGI6PEc=;
 b=YPmZftk/GUWXL+llvt6Y6d4PDRCZ54i2+NqIS47gaPVisjLJM6ZDcgIm70B/wcu6WiLNJKkWrd9Oxb4BqBIKUbve+74FCtLMnQ9IoMN1rpI32u3+x2SWN0OL2P64Aa8d8POnijWjObLv7fh+UkHZxbPd3AxuWijoPdNKyTxQ/O57UPuxMrSxj//lAYPgRIFXvoq3CKdODMfxDF+4iBP+9v55X0pIAkH5y5d1S5SKlffNyWxBu052VmS8xdjvyuZWqTxGhJlbBWxfL/lR4EPBJyGY2nG0YrmgvgO8EOAcqAPrNxi2Fy/sTMxiz8PFTeWjN0TeWygNyDNbsPvBSiX8bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB5909.namprd11.prod.outlook.com (2603:10b6:303:168::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 09:14:51 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 09:14:50 +0000
Message-ID: <d8d2f3e8-3d86-4364-ae0b-719edb9cb120@intel.com>
Date: Mon, 31 Aug 2026 11:14:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] drm/xe/log: Add GUCSUBMIT component
To: Arvind Yadav <arvind.yadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <badal.nilawar@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <mallesh.koujalagi@intel.com>, <matthew.brost@intel.com>
References: <20260831080507.2364687-1-arvind.yadav@intel.com>
 <20260831080507.2364687-2-arvind.yadav@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260831080507.2364687-2-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0281.eurprd05.prod.outlook.com
 (2603:10a6:20b:492::31) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB5909:EE_
X-MS-Office365-Filtering-Correlation-Id: 79bc02cb-69b5-48e9-d8bb-08df07404f33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: fSsVjRp1k3WGAQ1E+AKY2Phbp8RdZBRT0Dr4EESfGO0SYY5fcbPw7ONLU2RJB6dKnefdKCTOuNlIK/5hf4KIiA8hFgRZcvoRlmSJtzKtRQdBv77NvWDPeEj40VJTSmDJ5LWg8uCQznhlYGSjGbZAOjgotIMIh3hl+i0izIAYW7LjyaQDDzleFSH4owTn/TvZ3MTi23Gvxq0rgEW08DFjxP906oMbiaNY6vxnHhdJWgY4w6aR5oZZJ0Mcy8GHAi839QV4kw/dGYiOVwRQG4A5e9Po/eUMkxb2RXTrK0LcQAuMg6bvgf8hNgQwAcPVH3M8vR7vhUOlnvJgJ4RlsTORfGe+gkNJle+TFc5+wVG4d3g0sbAkUuNu5DqRLHSvv9IXyYHo8YFo5HHmf9luTvO1OufAstefOa5I9aWedTD7yUNuF0K/qp7w4QR/ObZe3Hpq6XAl0cKHK/gm8svx0S5rWGUEb5bePy84Qm735O1UePPE9S7vrK3zNfBnydXb5z3OE2imKtozUKds4DdeZOxMwgcJKRaiVDLhFDJyO4aYlbWeUlKA8Fh7kw7MOxAtnlpVuoWFsDD2tlguOXb1vgLMJUjvbWmASmrNkvrncCeoxxR3/2Zg7MHaLRcni9043hXwl0d7b9jzOUnI6BmFjExhdktdtMKneU+7OhunZTnxyRM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWppM0J1RnMyaU9rN1g4VktJYVNPVkZwZTNwYWtOVVV3N0RaVG1tbTdZV09o?=
 =?utf-8?B?N3NFTnFVcC9ha1Nac0hzWHpxMXkwejBSa3VsRFlMRjBZTGNEQ0F5SFdXOU52?=
 =?utf-8?B?cjVlclowMDhLSkRXZ1JqWmJIdkdUeHhWZnlmWitrVUVUTVZya1FDV1pBWk1m?=
 =?utf-8?B?V3kzNjBpZm1Ha0NGdHAyUmlHZ1BKS1RFak1uNlNpRDJIOHlaUVduN3A5OXQ0?=
 =?utf-8?B?U0ZJakFNR1BJVVU5VlFTb3p5clNPMXdhaHZ6WkpGOTdYUTRRMUpmLzBaUzVJ?=
 =?utf-8?B?T1J1aXZUNVFlZkFVSXZlRFVKMUcvdk9nSCtrMHdpbFZGUmg0Q3NSODZrTWg2?=
 =?utf-8?B?UitjSUFrRjRZU1Avc21vMUwrK1JPanZGNmtZU3UzZHRRNjh2SElLM1JSa08y?=
 =?utf-8?B?NU1IVTF5OTUzSGZBWTlXdFptV2hVaDdCNFkwMVpjYlBrd3NLRHpWMStBZVVG?=
 =?utf-8?B?M1YrdThDd3drdW90ZTFDU2E2NzJGalJReFhab3ozOG5sL3ROTlU3Z08wclk5?=
 =?utf-8?B?SGhSZStIT0VjRHovYmlBQVQ2OG5GZ3EySU5VdzFpQy8rSVhGbHRSK3dQa2lN?=
 =?utf-8?B?UXNRUS8rWW52NVFNUjJCSXFmbkRlZCs2aDFLZlpjZk9Bc2lSMlB6MU8zc3R3?=
 =?utf-8?B?TSt1YU5DWlAyQ0VJdUtaOGtWK1hDalJXdVVPc1RyZGl2REp6QVFndVNQZW81?=
 =?utf-8?B?NGhEaEgxbzdCUjN4bmRNb2p4bGQ1b2FrTlpQWVBXQUZJQ25odmh3RThGTzdL?=
 =?utf-8?B?cFZKWGpDbVVzR3ZNY0ZDM3FFV3U0RXBMZVcvdkZtVEdQQi90Q25uZlRGdHhi?=
 =?utf-8?B?TTYrZHNvOCthZE5SS2dmMno3NVZzajlpdG5qTU0zaE5qdkJVZ3JueXdzRjh5?=
 =?utf-8?B?YStXazNwcDJBbnlCVWlPSmNCNVZSSFE1VitFSFZTQnJvVG1vRUJMUjhWVXVo?=
 =?utf-8?B?cDhRa21UQ3gzVE1IcEFreGNiZGZuRUpTYkZxaUpSKzNjRGN1RVRSQ2s3Y0xY?=
 =?utf-8?B?T0ZWNlNDTzFjem9YU29hd09jcHlnU2x4N3dYc01NR29ydlBBUmV4WnNHMVVi?=
 =?utf-8?B?MDYzc0VKNitnMjBJVERNMkcyMG80ZjhUeWUxM0dIcDk2UXlTcTUrNGNUYWZC?=
 =?utf-8?B?d09Gdk1mMG9zOHgydGJLU1g3blc3K0pTSjN4ZFNHZVg5c2tjSmZzRHV5M2FB?=
 =?utf-8?B?TWVOcHF6d2x5NEtNUCtlTGNFWTJTNkFlUGpnNHM1dFdBa1VwNkM0M1grK0Ry?=
 =?utf-8?B?b0JyMEpPaEdqMEoxV1p2bjgwbUdrYlgyMkxPaFdFbWc0M1U1K3JaNEZJVWV3?=
 =?utf-8?B?Ny9KcStoL2d3a0pPMkkwRmRFK2xyQU5NWGVWcUxnTnJ2Mm8xQTdMQ1lVTWxu?=
 =?utf-8?B?aG5ma3JobTVZNU5KeGRBemVQd1BZTEE2aEJnR3d1VE1XOXErMjIremkyb0h0?=
 =?utf-8?B?bzJ2M0xEN3JwTk16M2c5MnM3ZVZIbTJhVS9tUzZNU04yWlYxeDBtT1IwSU9Z?=
 =?utf-8?B?NUtudllsbEhJM0MwQXpVWUtSYldOcXAzd2ZIdjAwVGF4ajZrcEJTR2JEV0xY?=
 =?utf-8?B?aHU4UVQ1Nmd0eC85L0tWSjFlSXVreFYxYVJoaU1VMlpuWXFMWU0rYm8wOTJE?=
 =?utf-8?B?NDhGMmMweGdJejFESndENHp2RzhZWWRMMkxCWnRLRlFTVU5pbHc3NklmZmFP?=
 =?utf-8?B?S1lBdlFKcU5pMjdrL2VJY1ZJZU1Oc3ZGTFZNOUFqNUtOQWdnTGtRQjJEMVVI?=
 =?utf-8?B?UUhwM3JpcG1Yek1ZWHBJU3dFanB0TjJWTUVUWE9KWUxOV0JoSUJ1ZlQ1VVF1?=
 =?utf-8?B?OXIrS0h3VzJ4R0VJNUJHSlhVOVlZSklQRnBQK1lRaG54V0hEZ2k3S1MySEFs?=
 =?utf-8?B?cmhHYlkraHhYeEJ6VGp6TFk5SkhobEJUWnc2N3ZmU1U5YUFFWGxCWjJkL2lr?=
 =?utf-8?B?aHdBLzRCblcxSlhyTkVrRHdSaHNDUWp3OUxaZTkzMm5PZWV6SUZVdHRUSGVq?=
 =?utf-8?B?L202VU5oUnZMQW5rZzdkVmhMaG1UNXdrUXNLYk9yTm5tNUY3UFA4cTY5ejdx?=
 =?utf-8?B?Q0NaYWpjVDdzckYrWHdRK2g2cVNtTDdlUXRZRUdkeURaM2dWb21Ia1d3bHZK?=
 =?utf-8?B?VHY5Q0xmb1VNS3owMTBKQWJuTTQ2VE5pcUZTMDdYOHBlbU95WkRSM2JrUnll?=
 =?utf-8?B?MUs1VjhMMEQ3Z0NSQXdNMlV1dGI5ZmpnbTZKc2sxTjhxUDkyS1F3OXp3Wk5M?=
 =?utf-8?B?aWhXTkZ5eGwxSkk3S3dWR2ltYm9hT3d0NzR6OCtVVDg2cmcrNjFrN3JlY3V5?=
 =?utf-8?B?WDAvV1dhVC92QXFJKzZGUHhYYkxSVGttSldMbHVZUjE1am5vZDlkOGlLY09v?=
 =?utf-8?Q?8JeM93lUM/2gjrgQ=3D?=
X-Exchange-RoutingPolicyChecked: LHdXCc0GFGtuF+5wzL3Ogyp1l5QSfUQLfT+tQ3jUg7+akF+UhAun3yBttPJn/Vw5uctEA10Z7T7+KYODDhxXd1ldguBPRANGoFYDr/xwmjdb9Z9ppvpjshRcQytpa+8PkluPJcnAWrGOzZCW7Wq5PmN7CYpIi7hcxKwrny5HDbihjhwvmS6Ngr/7B9NGRc0kjx4szOJ+nEmDotHnAc6okGRMUbZuV1oW5GgMxt94jLRyMBPBJ7iojYBYidY8AtF10DsDthl6Um5J4yYCk/w9QlqqXGhBteqlK+BHdw/c+/pnSXsBCYLN5F+sryF/D0Y1v7TNMgtDxQMpUUAcHtgYzg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 79bc02cb-69b5-48e9-d8bb-08df07404f33
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 09:14:50.0465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Woa0BizlMRivuf8k3KDm8qezGAYRz0mYcAbOdmZdUwG48JO0hOSt60iG9muUl/pVyB40BevDT13JBD4e8MYr8evizDrlTfrQWdgXwyiAi/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5909
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



On 8/31/2026 10:05 AM, Arvind Yadav wrote:
> Add a GUCSUBMIT component for structured SIGID logging.
> 
> GuC submit failures can still map to an existing SIGID, but using the
> generic GT component hides the source of the report. Add GUCSUBMIT as a
> separate component and map it to XE_SIGID_GT_TDR.
> 
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/xe_log_abi.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
> index d6105520173e..19976df21532 100644
> --- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
> +++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
> @@ -159,6 +159,7 @@ enum xe_log_location_bits {
>  	define(DRIVER_FIRMWARE, 1, GUC, RUNTIME_FW, "GuC")			\
>  	define(DRIVER_FIRMWARE, 2, HUC, RUNTIME_FW, "HuC")			\
>  	define(DRIVER_FIRMWARE, 3, GSC, RUNTIME_FW, "GSC")			\
> +	define(DRIVER_FIRMWARE, 4, GUCSUBMIT, GT_TDR, "GuC Submit")		\

hmm, the goal of the DRIVER_FIRMWARE class was to have a way to
differentiate between different firmware used by the driver, as
in SIGID space there are only two RUNTIME/DRIVER_FW categories

IMO "GuC submission" should be just a DRIVER class component,
like we have PAGEFAULT component

>  	define(DRIVER_FIRMWARE, 16, PCODE, DEVICE_FW, "PCode")			\
>  	define(DRIVER_FIRMWARE, 17, SYSCTRL, DEVICE_FW, "System Controller")	\
>  

