Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E800105D989
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 22:49:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E03E10E4DC;
	Tue,  7 Apr 2026 22:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJMbkmN9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1960C10E4DC
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 22:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775602181; x=1807138181;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=shIqlHpCUbkwJYmIgJPOtRktwez9DBv2RwH9xQq3A3Y=;
 b=mJMbkmN9KLB/Rqbe/3VMI7uT+SIwSJ5xMRoEx3HFR3kXXj2kqk0BIsHr
 AtCyl7AT6aw/O3dJ2xHrwloT9+4OcjBqp7lCfI1eKKbxKd6ZhFdFGQZR6
 hK0ri20JohDEoBSsOGfBmC3KJkUm9bnzJj9+gfJGIh1GtKJmoJhABf5W9
 p8DWqwYO1c3Bs+qTQjwPtTlx0hOYRRLiHbsL4wJVRlF/qkjtaadLdeXbA
 2gGaZR0RI89vLHj/xR/2Rk7hsdAPiqMvhrS3Sxk4XSiVHYcnIbPhXg2Ct
 /uNJG+zkzlXfVUTcYiZhxcH14l9Hwsx32Rsqh26D4YbGwsRhrYSoUsZYc g==;
X-CSE-ConnectionGUID: h9EQOBQWRYyA4ErVqfvmTg==
X-CSE-MsgGUID: fKG5r53/SFCMFkfKQ0EaIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="87206371"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="87206371"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 15:49:40 -0700
X-CSE-ConnectionGUID: 9VZtOk9zSZWFJ59jM7ytKw==
X-CSE-MsgGUID: uWvfsww6TNe55zbpKFcKgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="233175989"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 15:49:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 15:49:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 15:49:39 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 15:49:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+JeV78Ud5ZLCGg/xkkWPerbul528uIODPfHT2J+S1GKVlcYnaNbQoUW60cJVt7a7x/OOysrsl/pusFEP40yDGZVVChxOhpUWLv7xotPudS7Fz1+aBpesqR2Oaw4yD2Lahq2JIpdm9QOlp1Z8KILgqfMxx+1J4VTPSct1qppi2x/2hRuJ2I7zC66j4YWjP8VdOzKSfc0LIkhijXxhRvj4Ypa+WT5So4Ndf/hfxEeWEsAqGfYyYPwdOwqG1TiJh6Eqn3fsTbDWCY05nf2Ku9wFrP7UcBjUPlcEmlUKcYg3fyt4zDUjZTy2pP/44Fx2Gh+/9HgyJ3cN8XBpNSj6dOpZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8L7dKYzrMw5xNQPZIhvGNuHVA2GVHObF7vXhe2PSsM=;
 b=dahPV8EWKClkjW6OkkXJIYELHPeAKXkumPcBc+2fJlP2UhdafKlePhSf58jMRF226tpe43ZLcUqDiKEIhIkvKBroxX8SL1DUsCMiCDFU079+UfEE5VgtdU7bGY+mrn1i1KAe6YISkKfOHr5DTD7V6w4JMsNZ9HFyumrarcsJ8BlUo0jZCmelgUlzK40ssp+3KicbH4rOxPyaB7P1VG0eMiUHUpF1lelfy43SjvUpHUF3SVV6yv1G1jftPq1C7pSAi33mIT/wAIZtnwZc2fyKwz5IZLTN9Ges2c5nUuZQ1mUv0e93wbvgX20LouYMA9AojrWvnfoT5GKkBOqH3D5kYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA4PR11MB9204.namprd11.prod.outlook.com (2603:10b6:208:56d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Tue, 7 Apr
 2026 22:49:36 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 22:49:36 +0000
Date: Tue, 7 Apr 2026 15:49:27 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/oa: Use xe_map layer
Message-ID: <adWJ94RCOcgtFpTk@soc-5CG1426VCC.clients.intel.com>
References: <20260407030219.444060-1-ashutosh.dixit@intel.com>
 <20260407030219.444060-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260407030219.444060-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0064.namprd04.prod.outlook.com
 (2603:10b6:303:6b::9) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA4PR11MB9204:EE_
X-MS-Office365-Filtering-Correlation-Id: ed9a2ec3-05e3-4069-2bd1-08de94f7f0ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: GeDx+cgb6yPp/K1sasw3VkvbgNVlnnbIEmBUKrTc0cp7vcA7LQT4sOP7MmKkz5pSK/h75wY9RTUsPTCsdMHwhUDGCZU4OzAvRn8utNboDQ7DNMSiGThRUSF2Xx+7IqPwXKRCMwE58Bri8bgpNbJeX1/v5qgGD4LkgikRVm9HdgBfCDhv8dNrZwLuy5cHF3TgwZ81OUxGPAYqWOogNRXUYuEltPaYZZ91dRalkCq1/0LXpX2r5wtxDQLGxtTEz7CxVoCl/e1XROPI7XxxktpFzuzquZfMybY2iujmAAbhqlM9YPGERM2uDj+T2MFxs+twGTjrfXR286KkDvkkj1BAmB0H/lIXcpvm05pEJJKG/C3qdlTIPexMtHf09g/I/jrRSZ3S8zlTO41ENCpnS2GisF3100KkNnrwqzfDR6xVzwq/gNRP2gDty7IfnG0PCnOAJA9E0cUUJaan/JPxLi2v3WpeM0sHNGAACjMJCk+cfYVzY2TJ0J6QLH+p+YrcSixmte+7TYwp2k6SROwJJjMWb/caY+q8qUMQkzJAwUobwa27T7qSbXe4RPJIiq66LHUfmvUlu/jYdL+DLfK/LaW5hk/Yqv2pabyfo1aRXfUHnwHqcmitMnvY3o+b0bmuFAxbfpVHbl4l0GyOXsPmrAYSic8/ot17DlZ7heDJ9LT2Bz2/eSJXfvfr1TKZ2Gvxd4Eb+ONGclSQkfiTAIpUWQR5SW5K1Ij+IvmH+rstqTVfQOk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHJYblVicVk2aHQ3MFczZ2N3UUlxQm9PdURtM0p5MDBWaVZDc1JLQ0NKNE1h?=
 =?utf-8?B?ay8relVYTXd5a2JjOHR0NFR0NnNuRko0Z0NqMU01Z1ZDOFpRZ2RJZ01nTUhi?=
 =?utf-8?B?bnVYRXlVWXVmNFR0eUZZdURVS0d6MG1Wb2cvek40eDNQY3N3Tm5sbkVjYnlI?=
 =?utf-8?B?Q3ZkZGlvR3RQUDNkSVBkREZucnh4Y1VxeHlWNjQ2MGdKeEJmQjBPWGxWL2Ju?=
 =?utf-8?B?ZUJRNUpUOVVFRHRia0VNNTAwYzJYV0JMYmsweFZTSmJ1dm4zRUR5QllrMmhw?=
 =?utf-8?B?MElqNGJjdjV5VHA1UUttS295ZkNzM2daWUZXelpHRll1eWwyN2V0Y243T2ov?=
 =?utf-8?B?NmdHZHkreHY2NjFtNlpjVzU1U0gyaWwvYUwvclFsUkVLOEFMQzBGS1VTOXEr?=
 =?utf-8?B?aTN3WUdyMzVSVTNjNXk0SGFlMkdtL3JtcU1hYTBjUE5oU1FJT2VTemFXMGpU?=
 =?utf-8?B?RXVsWmRiWmFKVktOaW1nNmtuZEkzWHkyQUtmcWhSRHVQTjZhbDBteFJ5RGQx?=
 =?utf-8?B?eCt4QUVXSmVCWVVmNU54VUdyZDUyVVZNOXltT0cxN3IvbWxFTlVpN0lIcmRK?=
 =?utf-8?B?S0YvMCt1YzBWLzJ2ck5sZkxYd3NlMElUT2Q1cHFjdmNmeWN5S1hqZzAyczM0?=
 =?utf-8?B?N251S1hPaEpTbnZscjE5bEp0U0RtN2htMFVrVmllNFRYMDFiK1N3Mm1EYVMv?=
 =?utf-8?B?bjUwTjNPRFhDSC9nNjdnY29wSnNlN3czbDNTWXQyZDhGVkZFTERoYUI4NEpz?=
 =?utf-8?B?UFBVUGtLdWUyaVZiV29sK1R2TjhaRDd5VXRIc0hKbi9MVzhTdVNrU2d2dEVJ?=
 =?utf-8?B?YmkwdWV3cUl1NXNaZE9melhNTzFpaVAyYk01UDQ0cWZVTG8rU1ZVTGRUTWxU?=
 =?utf-8?B?SGtEVGZJdVk2T2lVS0ZJRWw4RnJJRWhGWDdYTkpSbFJaSEhJbVJzSTF6MkM0?=
 =?utf-8?B?T1lYRjhVRDd2V2Z4eEtiRjBHeWowWVB0MGRrMEx6eTNPcDV5TXRYSDNMV1VP?=
 =?utf-8?B?aHM5SEpNMTBJVWxqdUFvWHZLU1YrTjlSZ29jYng1c3drTmkwZ00zM2loODFY?=
 =?utf-8?B?OExKR0R2MWhGWGNQM2FVVmdxYmlOMExSd2ZNb1k5U0NXTDRud3FrS0NFZjh1?=
 =?utf-8?B?V05lNXlESlVhVmxuWnkxRXVvYlJ5akZpbUdsWmExWTRYVEdyRW5RK1U5Z2NF?=
 =?utf-8?B?MnNxblNrNm56d252bkVlbXFaYVlFKzhDM0NvU0VlcEdKd0dsNy9pU0hTdkht?=
 =?utf-8?B?ZDNZRUJmUllJSW5XL1FyTlNTeHpYVVIzVFB0bjZROVpraWJBbUE3dVUrRWZT?=
 =?utf-8?B?U0lLZW1SRVUvcDZaSmY1ZmNvZ1I2UlpUdjV4UjIwaFNES2dvRW11dmtCdlVV?=
 =?utf-8?B?dS9LZDE2SERnLzhER2Fmb05qbHBsR0ZFNmRRU1lsYUJMWjNUTEE5cTZ3OWZ3?=
 =?utf-8?B?TnBlYk1lNW8xYktDZ2RPS0dDbjVaZ3F0NkVJVWFUUm9Yc0RDSEY5YU9palU4?=
 =?utf-8?B?WCt6VjFZUzNpZmhSUU01Q2Exd1BtV1ZwY01ZODZPUVl6dXpzYWQydTV6SElB?=
 =?utf-8?B?SkxBZmtiZ1JlU003cndNOUhHWExSTHpPcGZNb3FaVGdNZWF2bC9WWlhQbGY4?=
 =?utf-8?B?MVBoUEdhSUtScGgxc1BMK29vdEFzVFBvOGUzTlRlYU0zaGJWdzNmT05zL05L?=
 =?utf-8?B?V05TZlJUUmozeHZ1WGJNSlM1eDhTVUFVV29Zd3ArRmJtRXQxNXB5SkJsVUIw?=
 =?utf-8?B?Tmo2Y1I2WFVGaGIrc2JRMVRZRzhpR0JqRlNFTnFZTUtkZDhrb2NSUDlKM0VN?=
 =?utf-8?B?NSthVkN0RHNxanhFRFhnb0ZqMzh6dUNQQmMraC9zUk1iRkFab1V4c1BsWXMw?=
 =?utf-8?B?dHduNWJVQlR5eUtkWFdBbldpdXZPNGhJTW5Qanc2bzFNWWd5SUFLZUUvWGg5?=
 =?utf-8?B?NXBDWTVTOU5HTmZLZ2lQNDI2UUkzTUJlN05LbXpTcXZxampVT0tUbzZpV3Bm?=
 =?utf-8?B?TS8ycStCMDF6K2k1Vnp3TW9CYXVHc0FtdTY3YVorK0lzRk1jR3c1MWs3aUFW?=
 =?utf-8?B?YzFuNW5JSml5dDRxNHltaGFZZUJWeHhyYjV1Umo2SHlMbjZ6NmIyVGxzbFF3?=
 =?utf-8?B?RWhsOTAxTTVTRHEydGZpZnBiNE0ycnZVMUxjVDc5TUoxZUk4RHQ2N3orUzNW?=
 =?utf-8?B?RnN3ZCs3ZTV5cFhnRW1Zb3Nyek83R0RwdWxBTVJvSFgwSnFGWDJwSmJFUHdE?=
 =?utf-8?B?L3l6Vko2YXUraFhSazQvQjh1b1JUUVhxelNCVkQ4SStLWlNXV2NucnN5WW9L?=
 =?utf-8?B?bk82a1lNdkVtZEFhM1NKdHdZei90VXprZ1dzcElpSjdrTzdzVlB6UWloVXps?=
 =?utf-8?Q?UdbRDojiM96Cg/p4ZsyYS6R+I9RNjIhVlLRly?=
X-Exchange-RoutingPolicyChecked: nKnRvN3WLbZBkSKMs7+WGvmqDT/l7l7FMlLlwX4A4EdiU9IjVeZVh1RvTjHwnoYKO1bbzKub6MJgw7HP1KJbMjS1p9G9iceNr7piaDM/lQZB9O5fmPVq/17p2ja+hnYn5LdwaEipwC/2oaEmJwPZgVEACoEZh6rgW4npA+uaD6pesmW2Jdh97PJ/HYGRwh7zB2lPxJ8Vf7b/lGVnO9IoYLy6ssZB8FRwgaI+KXnaPCZH0eCUSNKCMW7Iwl871WLebHbmuo8w8BbGFMFxIxxTOnzkaqpZ7u9kCDTSxQrNtXtx2ptuSynZa2E2Ccw1kyT8q4p/bGxFlLDQtHOtjMAR1Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: ed9a2ec3-05e3-4069-2bd1-08de94f7f0ea
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 22:49:35.8961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6c0e7AJmv5WEuAIAyt2NmznneaSSFxc3vM8CETyAg/5bZNQaYJbyYxSiXqCbzQjMGt6K1+odJW26en2wSx7aYRSgXMbNLNF5gLCBM9urVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9204
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

On Mon, Apr 06, 2026 at 08:02:17PM -0700, Ashutosh Dixit wrote:
>OA code should have used xe_map layer to begin with. In CRI, the OA buffer
>can be located both in system and device memory. For these reasons, move OA
>code to use the xe_map layer when accessing the OA buffer.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c       | 88 ++++++++++++++++++--------------
> drivers/gpu/drm/xe/xe_oa_types.h |  3 --
> 2 files changed, 49 insertions(+), 42 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 6337e671c97ae..dfd3b6a789cc3 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -213,32 +213,40 @@ static u32 xe_oa_hw_tail_read(struct xe_oa_stream *stream)
> #define oa_report_header_64bit(__s) \
> 	((__s)->oa_buffer.format->header == HDR_64_BIT)
>
>-static u64 oa_report_id(struct xe_oa_stream *stream, void *report)
>+static u64 oa_report_id(struct xe_oa_stream *stream, u32 tail)
> {
>-	return oa_report_header_64bit(stream) ? *(u64 *)report : *(u32 *)report;
>+	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
>+
>+	return oa_report_header_64bit(stream) ?
>+		xe_map_rd(stream->oa->xe, map, tail, u64) :
>+		xe_map_rd(stream->oa->xe, map, tail, u32);
> }
>
>-static void oa_report_id_clear(struct xe_oa_stream *stream, u32 *report)
>+static void oa_report_id_clear(struct xe_oa_stream *stream, u32 head)
> {
>-	if (oa_report_header_64bit(stream))
>-		*(u64 *)report = 0;
>-	else
>-		*report = 0;
>+	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
>+
>+	oa_report_header_64bit(stream) ?
>+		xe_map_wr(stream->oa->xe, map, head, u64, 0) :
>+		xe_map_wr(stream->oa->xe, map, head, u32, 0);
> }
>
>-static u64 oa_timestamp(struct xe_oa_stream *stream, void *report)
>+static u64 oa_timestamp(struct xe_oa_stream *stream, u32 tail)
> {
>+	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
>+
> 	return oa_report_header_64bit(stream) ?
>-		*((u64 *)report + 1) :
>-		*((u32 *)report + 1);
>+		xe_map_rd(stream->oa->xe, map, tail + 2, u64) :
>+		xe_map_rd(stream->oa->xe, map, tail + 1, u32);
> }
>
>-static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 *report)
>+static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 head)
> {
>-	if (oa_report_header_64bit(stream))
>-		*(u64 *)&report[2] = 0;
>-	else
>-		report[1] = 0;
>+	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
>+
>+	oa_report_header_64bit(stream) ?
>+		xe_map_wr(stream->oa->xe, map, head + 2, u64, 0) :
>+		xe_map_wr(stream->oa->xe, map, head + 1, u32, 0);
> }
>
> static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
>@@ -275,9 +283,7 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
> 	 * they were written.  If not : (╯°□°）╯︵ ┻━┻
> 	 */
> 	while (xe_oa_circ_diff(stream, tail, stream->oa_buffer.tail) >= report_size) {
>-		void *report = stream->oa_buffer.vaddr + tail;
>-
>-		if (oa_report_id(stream, report) || oa_timestamp(stream, report))
>+		if (oa_report_id(stream, tail) || oa_timestamp(stream, tail))
> 			break;
>
> 		tail = xe_oa_circ_diff(stream, tail, report_size);
>@@ -311,30 +317,37 @@ static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
> 	return HRTIMER_RESTART;
> }
>
>+static inline unsigned long
>+xe_oa_copy_to_user(void __user *dst, const struct iosys_map *src, size_t src_offset, size_t len)
>+{
>+	if (src->is_iomem)
>+		return copy_to_user(dst, src->vaddr_iomem + src_offset, len);

I think this requires xe_map_memcpy_from for the iomem case.

Thanks,
Umesh

>+	else
>+		return copy_to_user(dst, src->vaddr + src_offset, len);
>+}
>+
> static int xe_oa_append_report(struct xe_oa_stream *stream, char __user *buf,
>-			       size_t count, size_t *offset, const u8 *report)
>+			       size_t count, size_t *offset, u32 head)
> {
>+	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
> 	int report_size = stream->oa_buffer.format->size;
> 	int report_size_partial;
>-	u8 *oa_buf_end;
>
> 	if ((count - *offset) < report_size)
> 		return -ENOSPC;
>
> 	buf += *offset;
>
>-	oa_buf_end = stream->oa_buffer.vaddr + stream->oa_buffer.circ_size;
>-	report_size_partial = oa_buf_end - report;
>+	report_size_partial = stream->oa_buffer.circ_size - head;
>
> 	if (report_size_partial < report_size) {
>-		if (copy_to_user(buf, report, report_size_partial))
>+		if (xe_oa_copy_to_user(buf, map, head, report_size_partial))
> 			return -EFAULT;
> 		buf += report_size_partial;
>
>-		if (copy_to_user(buf, stream->oa_buffer.vaddr,
>-				 report_size - report_size_partial))
>+		if (xe_oa_copy_to_user(buf, map, 0, report_size - report_size_partial))
> 			return -EFAULT;
>-	} else if (copy_to_user(buf, report, report_size)) {
>+	} else if (xe_oa_copy_to_user(buf, map, head, report_size)) {
> 		return -EFAULT;
> 	}
>
>@@ -347,7 +360,6 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
> 				size_t count, size_t *offset)
> {
> 	int report_size = stream->oa_buffer.format->size;
>-	u8 *oa_buf_base = stream->oa_buffer.vaddr;
> 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
> 	size_t start_offset = *offset;
> 	unsigned long flags;
>@@ -364,26 +376,24 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
>
> 	for (; xe_oa_circ_diff(stream, tail, head);
> 	     head = xe_oa_circ_incr(stream, head, report_size)) {
>-		u8 *report = oa_buf_base + head;
>-
>-		ret = xe_oa_append_report(stream, buf, count, offset, report);
>+		ret = xe_oa_append_report(stream, buf, count, offset, head);
> 		if (ret)
> 			break;
>
> 		if (!(stream->oa_buffer.circ_size % report_size)) {
> 			/* Clear out report id and timestamp to detect unlanded reports */
>-			oa_report_id_clear(stream, (void *)report);
>-			oa_timestamp_clear(stream, (void *)report);
>+			oa_report_id_clear(stream, head);
>+			oa_timestamp_clear(stream, head);
> 		} else {
>-			u8 *oa_buf_end = stream->oa_buffer.vaddr + stream->oa_buffer.circ_size;
>-			u32 part = oa_buf_end - report;
>+			struct iosys_map *map = &stream->oa_buffer.bo->vmap;
>+			u32 part = stream->oa_buffer.circ_size - head;
>
> 			/* Zero out the entire report */
> 			if (report_size <= part) {
>-				memset(report, 0, report_size);
>+				xe_map_memset(stream->oa->xe, map, head, 0, report_size);
> 			} else {
>-				memset(report, 0, part);
>-				memset(oa_buf_base, 0, report_size - part);
>+				xe_map_memset(stream->oa->xe, map, head, 0, part);
>+				xe_map_memset(stream->oa->xe, map, 0, 0, report_size - part);
> 			}
> 		}
> 	}
>@@ -436,7 +446,8 @@ static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
> 	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>
> 	/* Zero out the OA buffer since we rely on zero report id and timestamp fields */
>-	memset(stream->oa_buffer.vaddr, 0, xe_bo_size(stream->oa_buffer.bo));
>+	xe_map_memset(stream->oa->xe, &stream->oa_buffer.bo->vmap, 0, 0,
>+		      xe_bo_size(stream->oa_buffer.bo));
> }
>
> static u32 __format_to_oactrl(const struct xe_oa_format *format, int counter_sel_mask)
>@@ -891,7 +902,6 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
> 	stream->oa_buffer.bo = bo;
> 	/* mmap implementation requires OA buffer to be in system memory */
> 	xe_assert(stream->oa->xe, bo->vmap.is_iomem == 0);
>-	stream->oa_buffer.vaddr = bo->vmap.vaddr;
> 	return 0;
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>index b03ffd5134834..2dd550c93b8ac 100644
>--- a/drivers/gpu/drm/xe/xe_oa_types.h
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -162,9 +162,6 @@ struct xe_oa_buffer {
> 	/** @format: xe_bo backing the OA buffer */
> 	struct xe_bo *bo;
>
>-	/** @vaddr: mapped vaddr of the OA buffer */
>-	u8 *vaddr;
>-
> 	/** @ptr_lock: Lock protecting reads/writes to head/tail pointers */
> 	spinlock_t ptr_lock;
>
>-- 
>2.48.1
>
