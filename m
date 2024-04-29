Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA90C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 20:42:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D4A10EC49;
	Mon, 29 Apr 2024 20:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SW0Iw7ui";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3659D10EC49
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 20:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714423336; x=1745959336;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3oTeyPgor50We3+UdsF9Tgqr+PJ885fvntGvWBfnN2Y=;
 b=SW0Iw7uipW8wF8Lqi3kNJ221pSpWmhxmq6jMCMH7AV/Jf+XOjTZVDn65
 w/Ux3JA9/zGuEhFcWHXSegRD4sijs8g8jc2gVY8rS4xxIT0YXMSNkIMm6
 5ekyj122SuK5wr6kL+VUEH86M4l+To9nPc2b9PFy8wTpfoowfOqOMnmpC
 l8/Jwmcut3IQGLx7qk/u4JbgoiBlUNjwtgK6cz49K71uDv5dAH2+tg2eo
 JCpPxsOayZ2nvOQGLsbGR7znssjQpcivnv1pToOykzsmfSgLA097dIWQT
 qfWt52oGRbs28tMlia0Jvipgd4qClwLsxyo5rFpcqAgBPNmxDL2VraA9D g==;
X-CSE-ConnectionGUID: vJZV7lRiR6OoaNr2Nm2dVw==
X-CSE-MsgGUID: oHB507GwQNW25QSzxdm7cA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10226246"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="10226246"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 13:42:16 -0700
X-CSE-ConnectionGUID: HwdSeajTSCS93rELYH2qbA==
X-CSE-MsgGUID: /uw4TIvjQGq7Fj9ezBH88A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="26633155"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 13:42:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 13:42:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 13:42:15 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 13:42:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RyASuNhr+NEh/VYtGwXrBfFJg2O20zPryb+otFz5Irmhlm6RHeYwe2aCiNWrnjMMhCBIey/x/iS7mge49VEnez4aVRvybV6sP0bF2PvsM49yc2Y00rNZiUP26CjUxR9fSBo6CisnIy4e5S5iOudzEMf+tA0k7QifgdyBs2kwgrmrPwM7GyYy+xxWV0v9+oG9ptCIblygMz8Hj9WEv0OF83wxCX206ZG+dra3cF4CVcpKLTtou8HnGO23P6IKf79e77i4JTcqsnpkeoGBHMA0ooJ3TDd08oCqqPZD78L0Dlz76cK9muuzMmTJPyTssNzgDC7kyd2Tbbo0smsK3p4ZQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMprf0N4WcCbgs4DTJtCMy/I/mZ6k4xfN50TvDajJH8=;
 b=R+FsX4nsh/VW3Gypj//m2tyt0VjeusXqOma5vDit6pAH8FKn1ErWQx6mSq7ezGjiEB7rZSsYHsoiMo51Dt/BsR65lS2RwHlCRMVy2uSjZboyVMEpAWW6M+afmNsa6f5vDWYGasU2Zhjq/7nrGQV5f3orpyGWG1R+rWFsetDJmLI9byo2DLN5gKjO9kRL59Nxe81zRA7kvTGWV7AlYHh3RtNfLYo26XMFxSy63hLh4TXZGDPbDr4fDR3LPxG9k3Jmigfn5YdRejnUkPmNSK0v8IvDpmfZSTG2MbGuJXYxZaqK3DsGtIfr5r1iq30Z4BIyh8obtzWoPYculq661A2b7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 CY8PR11MB7170.namprd11.prod.outlook.com (2603:10b6:930:91::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.34; Mon, 29 Apr 2024 20:42:10 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724%7]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 20:42:10 +0000
Message-ID: <9d48b092-a227-42e4-875a-c1ca8909cd7c@intel.com>
Date: Mon, 29 Apr 2024 22:42:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] drm/xe: Introduce has_device_atomics_on_smem
 device info
To: "Welty, Brian" <brian.welty@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Oak Zeng <oak.zeng@intel.com>, =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?=
 <jose.souza@intel.com>
References: <20240425222346.13026-1-nirmoy.das@intel.com>
 <20240425222346.13026-4-nirmoy.das@intel.com>
 <28a6818f-b047-46df-acdb-4005d1be64a3@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <28a6818f-b047-46df-acdb-4005d1be64a3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0275.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::10) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|CY8PR11MB7170:EE_
X-MS-Office365-Filtering-Correlation-Id: 97e3c224-a362-470c-220f-08dc688cd779
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1FEQVRvMmR0Y2JDNGJDZFg4cjhkM0VQZlRjVGFpRjRtVHQ5ZExwT21GZDBG?=
 =?utf-8?B?SDgraDY1T2FzTXBaQ2JBNzFxWDhMSFg5dWJFTWwzOHRpS25Uc015N0oxVWNM?=
 =?utf-8?B?b1F5UEo1YWRWeUpvOWdNcm84SlJDWjhvY3pkM0l2ZElUMFhmUHF3M2d5Y1o0?=
 =?utf-8?B?T1M2c2p1dzVvR2l5dElOdXUrckRIQjFJaHFRMnlnZUxTd0Mvdm9NOThJVldL?=
 =?utf-8?B?bGpZSVdTK3NrbG5WakhWaVBwMXpEREgrUXN6NlRvN29sOFIzUzJkdkVldWVs?=
 =?utf-8?B?OWlXRGdFbkVPT1JRTUdoV0JWaUFxMXUrSEh3RmUrOWtXSE94azJWcklHaTFp?=
 =?utf-8?B?S3gxWXR5Z1l1YXJOZ3ZyL1FGd2FXRkFRNXkyNGZFSjRXRzhiRS96QzJQQytV?=
 =?utf-8?B?RCtoZEk1MGgxWURBb2pQalhxclp6YlN0V3JSbjRKRDJzTEZUQmtZOE5SbGtV?=
 =?utf-8?B?WjgrcFVyd1NjdXNLTlRtUDQvRkNTTnhLSUcvVmJUemRpZkRkeU5GbDVMb1Bo?=
 =?utf-8?B?Y1I2WVc0ckxMcmtkeTYzMTlsYU1tSUMxcGxPeHM5d2xac1RQb3Rha0dGSGdY?=
 =?utf-8?B?enBVUXcvaXZrcjZlUFAwRzdpZlBia0xZWHNhSUZ0c1E1dXVoQ29aMk5xenls?=
 =?utf-8?B?UkZPbkZPekx1bS83S3phV2syRWdjcjdUTExTMDdYRStKbkUyQUdHZml0QXNm?=
 =?utf-8?B?ZVNQZjN5dWlOclRHZE1vbVNvbzVhYzVBZTZDUi81b3BiYmlxSjdTM0UrRHhZ?=
 =?utf-8?B?Ri9LbnlHN1F6VjJwR0cvNldoRDltRjJBZU1tUDRNdkRHdC9vMndoK2RzUFBj?=
 =?utf-8?B?cmRlNFhERFVmTnJHdDBTWFcyRkJJRXg1cjZpTHBFdE9ZMElxRFBWNGpOK2lH?=
 =?utf-8?B?ZlNBY3RqTXhKWXVIdjlDVXBIKzJPQ01nK1RscERBWTJYblY3SW1JbmloMDdv?=
 =?utf-8?B?djRvbnZGenJscjhhN1ljSnFkYnJxNUtFZVhqT0hjQm9KVTBHNXJEOVlraVNn?=
 =?utf-8?B?eHJyUlhCZjU1eEJpVFU5TWo5VGwzako2dWFQMkVGQWxxeWYvMWtuekhBOVdu?=
 =?utf-8?B?NHI4cFM4M3oxbkxqeFJ2U3FMTE01S2hkUGw4bHpUbnpKQ09kNHRkMnM3aHhn?=
 =?utf-8?B?MFpwWUt2NlhkUDlxbEdITUxlTDBSU2NMY0RqQTFleXdSRzBoVHI3S3hQNHpT?=
 =?utf-8?B?MjZFQ0JDS2J6d1Qwbk44Lzd4VVV0RmN6bzFkUjdveTg2ODduTCtodXBWNzlh?=
 =?utf-8?B?TG5LOUE1cXNkUlF4M1NTUjNBQXY0TXlCQzdtL055SGNndUVKMDBsWk5kcWdU?=
 =?utf-8?B?TkM3OE11SXUxMUF5RVpjSVptN3J1Sk1aUlhaY1NKOHVNZFhNRHpUVEQ4TnV2?=
 =?utf-8?B?SUdpWUFuUURlbXh0NVoyTVJaWkw0a3YrdE9RRWxBckJ5UGx6TmhkQlloTzNI?=
 =?utf-8?B?emNCMTBNaEJqeVc2QWFxM1p3dnM4dnhoTjFQcW9UeDZaejV4MVZVTGJXYUxC?=
 =?utf-8?B?VWFRMFZNVFRMNjVNOFZSenkzQ0lzOE9iRk05YWxwRWxUYlBCRU90b1ZZRWh1?=
 =?utf-8?B?VFc4VHhGSE9pdEhjcm1ZTWc3eC9YelF5TnNnQytOR3IyQktyaU1qc3hMNlNX?=
 =?utf-8?B?Ykk5bys0ZUp6ZVlKekhLbTlhMFQvRzhublhmak5JM0l6UTcwTU5TMzFQakdQ?=
 =?utf-8?B?RHl5a1ZjYWtOblhMcHBrcGNzVVVGTTZkeXRUSUk4dFU0MG1waEJtbHZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3RrWkEzVEhDU3NtQzR6UHVRc0hncXpwTHFtemlSNXBMWk9PQk5SUlpaakwz?=
 =?utf-8?B?SmsvTE1iakJwcU0vMU1jVDlPSGR0dWVvNkxDUFQybU4yOE9tbis0VGw1cG5q?=
 =?utf-8?B?N0tpWEp0N1NiYmZhb0dsZnJlTkNCVlJxL0RIek1weDkweGVobyt3SkdqOUF1?=
 =?utf-8?B?eWtxUWdENEg4dnZZNUJYdkZyekVucFBpNlR0dkU4MmpaZlhjaUpyQTQvQTZ2?=
 =?utf-8?B?YXR0OUxmZXZ4SStnVm9pbzNtdHYxYzhDV01wclpsczJlemxaeVZhcUNQSlJj?=
 =?utf-8?B?Smw0TzJFc3BvUXN4TWVzYXJQdTZxMjFnVGZTRXZrQ21TQUhsM1RVZUN6M2Fh?=
 =?utf-8?B?RUFSdXorNkpOMDlaYi9NV0xCcmVyeUdmejIvM05BdkNHc2loTWlTWXNYNnNt?=
 =?utf-8?B?OFBEd2VSWnorVm55MmorNEtyd1NTQWpDTEYrdTBLZXNmai9kN3c0K2d3cWJs?=
 =?utf-8?B?OGowWE5UeHYwakp5SnNVN21YWEtoMGxUV2pOS0dUTFpqaUkvNitCRnJ6NUlt?=
 =?utf-8?B?ZnZYallKTGh3YU1HVlNKa2J2QldGNVFHc3hnWUxRUW50UXRnMGV1b1hwUDlM?=
 =?utf-8?B?MHM2dmNLb1ZHdE8vUEozK3F3U2lrOU1sWml4Ly93WXhyQTdWc2dnRlZZQWJl?=
 =?utf-8?B?MWw0TzB0ZEczMFd4Q1EvTGYwWXhvb3Vqa3UvYmxRS0o5a0pqOVA5QmlhVy92?=
 =?utf-8?B?Vjd4ZCtoSFZJVHIxeVlVQzEzeE9meUtOcUhJOWVFZmtER3doRUZJcGJweEhN?=
 =?utf-8?B?SzlsUEIrbnVWZjR6QmU1YWpORkVuOU83ZU8zZHNxR0tUZzljSEJKZnQyMkNX?=
 =?utf-8?B?OXIzc1VBL1hnNHRpcHhJTzNjdDhqMXhQMURqUmdPN1o2SFVsUmk3N0F2WG9X?=
 =?utf-8?B?cFIzOUV5ZmR4RzBLcXZqUTh3aU1MYy9xcS9vOWV1OXJRQmUzYVdqdkQ3RzM1?=
 =?utf-8?B?MzE3SG9qMzNjYzVDVEJ3M0wrRk9OYmpQN1NEN1YrcWtHTjBoRUo5K0sva0dC?=
 =?utf-8?B?SG9mVG5JT3RFeFUrdWVWUWo2bGVKT1RGS3RHeFU1Rms4cDdmWTBGK05JUXp3?=
 =?utf-8?B?SWQ0cFdvWXhzUVlrK05aUmpsZ1FaNnpadTFzcmxQYlBKMjZFU2pYSEVyZVZx?=
 =?utf-8?B?d3pHK0JaYUxMa3VBSkpqY1lPRitaSVFpdVpBdTJPN21yU1htY3U2Uk9sWkhU?=
 =?utf-8?B?YVpOdWlYVXhCQjIyd2w5VTE5T3lkOXpJU0toTEg3dTFTQ2VxYS82dkJxL0lW?=
 =?utf-8?B?bjlzTjNRR0xTREFKVE5RbXV0UFNBTmRoTVIyYnRhRHJST1VpVXNHaVo5bmw5?=
 =?utf-8?B?S2VHT21YbGdYRUtueXoyaUpteWk2dGdKSk9NOHR0dk5JYUU2bWFPbGRYK3lN?=
 =?utf-8?B?R3NMNzZxYVlXY1JGeW9JZUFNaEphTXpWVFgxZ24rTGNCK0NSTU5NUEFCcHV1?=
 =?utf-8?B?UmJYNXN5eWl2RVRUSjRzK2hQc2prTmNTa1JpaFlwKzFOWk1kVXNtR3Aza1A5?=
 =?utf-8?B?WU1RUGRiSFVveTVHcVdZekY5UnZ5UEhZVkJvcHkzZFN3RmVZZE1VWGowYkRX?=
 =?utf-8?B?VjluUmxnR0tkR0lxZEhlRFlySlNOYmZIRXVHelN4MnA5eTRqOHMwc3o5Zkp5?=
 =?utf-8?B?SWJqaTBCWEpocDBnK2g1akdKZHc4dy91L0s1VDNSaSs2RnlMMTZ5Q012c1l3?=
 =?utf-8?B?dXRrQ2R4SDVMUmFpZUh3b2VzRm9KYStsU3BySXlWbEpTS2g2dmduZlpaMVRt?=
 =?utf-8?B?YTRVMCttYytLb2QxclpPSnA4ZStwVEV2NGp6M0V1SklEYWRqcitDODJoZCtY?=
 =?utf-8?B?ZHhGdVB6OFZZZ0ZmQ0RPaThaejRZU1c1L3dMTTh5SW1vNloxQjVGVlJscGpF?=
 =?utf-8?B?Y014Qmo0YXM5TmI0S3JHNmR4UEIwOURJSld6ZGwzK1ZFSHVySnBUbDZzbHpW?=
 =?utf-8?B?b1lHZTIvVHZ5clYyMFhJTkFBR3F4d1o3a2pDbEdDeEJxMEIrYVJTR2pMd2x6?=
 =?utf-8?B?T2xtM1FQYlI3VEZvdWt0d0Nnb08rQmpkdXhtai9FUGxYQVRWK2lTVTFGeFFr?=
 =?utf-8?B?bTc4ZG4zTTVoVHF4UGhoTzhwdXQ1RXplQ0Z1dmhBRUV0OTliM2FVdURHdk5w?=
 =?utf-8?Q?JU5sFDUXkaltNhgCJS5V3uUeG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e3c224-a362-470c-220f-08dc688cd779
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 20:42:10.1463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DIyP7U6wRF3nOaqUgKSUOOdkXjD6WTgH8EsGo+Dp0On7NnXqQFyqNbyQdHWhGdXKM/YRnJ0ndyYM22nIQk3PYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7170
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

Hi Brian,

On 4/29/2024 10:19 PM, Welty, Brian wrote:
>
>
> On 4/25/2024 3:23 PM, Nirmoy Das wrote:
>> Add has_device_atomics_on_smem to specify that a device
>> supports device atomics on system memory. Currently XE2
>> supports this so set this for XE2.
>>
>> v2: Set has_device_atomics_on_smem for all platform but
>>      PVC.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> Reviewed-by: Oak Zeng <oak.zeng@intel.com>
>> Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>>   drivers/gpu/drm/xe/xe_pci.c          | 2 ++
>>   2 files changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index 7cddb00f9c35..0af739981ebf 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -283,6 +283,8 @@ struct xe_device {
>>           u8 skip_guc_pc:1;
>>           /** @info.has_atomic_enable_pte_bit: Device has atomic 
>> enable PTE bit */
>>           u8 has_atomic_enable_pte_bit:1;
>> +        /** @info.has_device_atomics_on_smem: Supports device 
>> atomics on SMEM */
>> +        u8 has_device_atomics_on_smem:1;
>>     #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>>           struct {
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 5618318e6f3a..c6e8a264348c 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -632,6 +632,8 @@ static int xe_info_init(struct xe_device *xe,
>>       xe->info.vm_max_level = graphics_desc->vm_max_level;
>>       xe->info.has_asid = graphics_desc->has_asid;
>>       xe->info.has_atomic_enable_pte_bit = 
>> graphics_desc->has_atomic_enable_pte_bit;
>> +    if (xe->info.platform != XE_PVC)
>> +        xe->info.has_device_atomics_on_smem = 1;
>
> Minor comment...
> I guess no harm with how this is used later.
>
> But seems best to not set unless has_atomic_enable_pte_bit is also set?
>
>     if (xe->info.platform != XE_PVC && 
> xe->info.has_atomic_enable_pte_bit)
>          xe->info.has_device_atomics_on_smem = 1;
>
> Or:
>     xe->info.has_device_atomics_on_smem = (xe->info.platform != XE_PVC 
> && xe->info.has_atomic_enable_pte_bit);

In earlier review for a query uAPI of this variable, it was noted that 
this gives an impression that only xe2+ supports atomics on SMEM which 
is not true.

I think there is no harm with this change and in case we want to expose 
this a query flag then it won't misled anyone.


Regards,

Nirmoy

>
>
> -Brian
>
>
>>       xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
>>       xe->info.has_range_tlb_invalidation = 
>> graphics_desc->has_range_tlb_invalidation;
>>       xe->info.has_usm = graphics_desc->has_usm;
