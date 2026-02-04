Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA158E9D407
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 16:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9730389089;
	Wed,  4 Feb 2026 16:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e2IwhNHC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07A889089
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 16:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770221553; x=1801757553;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IBLfLNn3aHtOycyGDtGnaUTQUblAvSj8y4uzfQKzpjk=;
 b=e2IwhNHClF9cbp3FNZrjQKZvPv59nls1CMFDkI/gem/Jo3hpne0mQF2D
 vppbIc+WDLqxioqaYQloadlu1fxIliIjkhx17u+wp9v4XnWugnLUQlEGP
 BzrwjqX745lvJASK72XVftOUtAQoSp9r2H3XUyDuJfXCo0PU52Dh+c3no
 sZ0PiGIGKI9bP0ru2wniCt+hTYU+pUbPKXq+Xya6LzJoLe3L/dbqCi0dM
 3qdD1ji/R8/Dsz29CxPEiCMlcVISU2bwYCHyDQFtV3wC9mtpn5aoANjE0
 FzItxp1EYsT8Msfpp0Ik2k7dtRH9ZW+ZvpArTFekIKuNVR9CfIUJRADUG w==;
X-CSE-ConnectionGUID: L1DyC7oJR/unh5s9g3sBmA==
X-CSE-MsgGUID: VVjFvgbmSDCobXn+nSqqeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75264967"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="75264967"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:12:32 -0800
X-CSE-ConnectionGUID: Lyb/RyzyTKmY04N3oSbN4w==
X-CSE-MsgGUID: GzgZWjq1Q+i/CmXU6dJZOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="209585709"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:12:32 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 08:12:32 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 08:12:32 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.26) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 08:12:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CySJRbdvfvTOBXC/Ky8pRh7kycogmgpLj2BLj7yMQuErsdinu5o1Kj9OFn0CS15AHHxajTltjdpQkrVKZiaqNrdB4Bnl4UGbCefU54h5K0cBDS0JbdOXpnCXcAGZ/4zj4Y8mWr8x4fOjErkfz+rCDEpqViAq9Tm0ya/pTfVJ7jIWEpmM1lmWEiH+OOJM/k9Q7gzAEI4tPalMEMFnwXObgDjF8mcOkn3R6ByO2H0xN1zwSp2KY5dK/NvmwIQ4PgoXVN0Rf62udyFxZ56IvBhYgIRnbys1Q/VYKJGoWCN5pAdydSUVBn0XljTrRCAMf/oHE92A0FQ2CpOiRzUosQzUnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxwtPOX3uBWUynPHaIVQ20hywAoqZKcC2KqtmAIVg3U=;
 b=PTMRnHyXjOOLevY9WHFx45mizemApDg18sHuB6vf4cL6T9M688PvEldKJLUvMtENwpbvOh0bmLFnuyd7wlHuIiNVtJTFa0tOJAYCsHX5CoxtDai5CKhOv69TzPkCVVY6xvDHoxgDSmWqHalUAI/unCKCOO4uYeuuv4P9vagutpGIBWhAJLB0xI1w7gOPtJmT9+fZqc+3x1mZnOHeR2Znqksjr/Qg4JoASjcO+sH6NatjdTUNkUOpDVh+lsqDjJKUAjbBVziyup8GdckWs2owwx+CH31MD0Wlr1IZuswnH15oh1x5+FCAyX5+wVRssWUCBurpaKTATItEmMnwGkaXEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6981.namprd11.prod.outlook.com (2603:10b6:303:229::20)
 by PH7PR11MB6030.namprd11.prod.outlook.com (2603:10b6:510:1d1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 16:12:26 +0000
Received: from MW4PR11MB6981.namprd11.prod.outlook.com
 ([fe80::d22f:753a:b894:9d1a]) by MW4PR11MB6981.namprd11.prod.outlook.com
 ([fe80::d22f:753a:b894:9d1a%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 16:12:26 +0000
Date: Wed, 4 Feb 2026 21:42:20 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/reg_sr: Fix leak on xa_store failure
Message-ID: <aYNv5BDjgbOPqOJD@bvivekan-mob1>
References: <20260203173639.1399354-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260203173639.1399354-2-shuicheng.lin@intel.com>
X-ClientProxiedBy: MAXP287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::14) To MW4PR11MB6981.namprd11.prod.outlook.com
 (2603:10b6:303:229::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6981:EE_|PH7PR11MB6030:EE_
X-MS-Office365-Filtering-Correlation-Id: a19bc29a-9e37-4dac-ea6a-08de64083019
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEMxb0UwVGVOdG14Qzh1YnhPVGdHZ2MwbWNQd1RseXNaY0c1eCtYa0pjbk4y?=
 =?utf-8?B?eGJHOWpiellNMW1FQTlXSmUzajBIQXBpMzBkR3M1K0NJUGFHRzVLczRpRUhN?=
 =?utf-8?B?QUtxYUw3eERsNWN5NC9kcmRHaFd2UlBsV0hORFZIS0NtcmRvSzFzcmJnb0ls?=
 =?utf-8?B?d3ltMFBUQ29qdWVkNTY4UGZOSWxOV1lTdXl3bGFOZE1oWWZTUXJhb3NFNkFD?=
 =?utf-8?B?eFNIcGV0N1RDVnR2eEkrME4rMVFDeVEvcXQ3bUtuNlFQQncxTm1LcXVBVWda?=
 =?utf-8?B?OHJ5WElKRFBFU25tVDFNM0JWYVRJZkszVkhUWVpNLzQrMG8yZzdqdjVibEpE?=
 =?utf-8?B?U0t0S1NoOWJYWHRpR2F3MXpDaElpSVRmUkE0OXYrQU0yRk8vVmZzcU5BRnln?=
 =?utf-8?B?VDdsVG5GUHlobk8ySmhmTWYzcEFCc0llc2pydDdYQ1VWM2tEeWFGaHljNGR0?=
 =?utf-8?B?Z2FzemFOdWtPNXl2aWxJS3pINjU2Qnh0WGd0OWp2bTVyUUM2TFRzUjEzdGxI?=
 =?utf-8?B?TnJNUEIrOEJYY1owNGNZTVV1L3psOWZ5cXFXT3ZFcGU0bSsrY3M4cUh5R21V?=
 =?utf-8?B?ZFFLNnRIMVlHNlQ0WXhlSmRJeGVaUHRWcEZ2YVRtSGtrTjIyQWNhV2tzT0VY?=
 =?utf-8?B?MUlEaWR3R0tSOVdFWC9FVlVOVUg3QnNyTURkNm5DYTlzS25veHp4RkJldFk1?=
 =?utf-8?B?aTMzcm52aU0wMEFyTFFBZnc3bFlFSjFMUHp2blVwK1piVkdpQWhlaklIOXBB?=
 =?utf-8?B?NlFyRzIrcEQ1dWo4OHI1N0N4Ylo0RzJyQTRVYk1iTUp1T0tFYjhrUEJQZHJu?=
 =?utf-8?B?K2ZzYWJ0Z0h2N1Z1VjRHTS8zVXpFVURHODBqUjZQYzFMdVJtblRBNmpacmVK?=
 =?utf-8?B?Q2Jza2tPaHlkTnVqTHdYYmhhdGJRVENJeDRmeVo0d1dGNzhHSnk2MnY5NXRt?=
 =?utf-8?B?OTVtc1lIQVlYTXFWdk9MVVlXS3AwcCszd2R0bDJiY2lyejFiMDBzUVFZUTN0?=
 =?utf-8?B?YTAzN1BMVXdtT1EyTjJwYWZiblUwU0haNWMvMXlRWmNlMDNkcUttREpVTzhR?=
 =?utf-8?B?MWhSY083SkhWTU94clE2TFRwYjcyU3VUT1I2bjNwZVhoRXRQUnJvdzNzL0Yx?=
 =?utf-8?B?cXQwMitHQmhvZGEvRmo4ZGFvWTU4RlJoa1NSMzV1dzhzMFVIL21MR3pXZDRs?=
 =?utf-8?B?RWhrbVlTSTVtbEh1eVdQM2tuWUlOZkNCd0xDaklvWXpCOHhsTmRxaEpTWGNl?=
 =?utf-8?B?VVNvMEE5dW1iaHhJRE1tZWFIU2xHVmQ4U0E2ZUZoV1hBMGhwbVZER3pCZC9o?=
 =?utf-8?B?MmNCdlFRY3Rmckt4VlBsU2VKVGtwcWJCSmo1QlptVlI4ODNpSUtneUl0QzdR?=
 =?utf-8?B?M0wwT3lJVXY1QUFZalBmZ3FVckVoK3VOR2FId1pLL3BVTlRXQ045TjZESHRm?=
 =?utf-8?B?aytLQ0xxWjFVUldnWG5qYm0xOG9PTEdsM2gvWUxWSHY2UERvYkV1VlNpUVJp?=
 =?utf-8?B?d0NtRjJ4c041dVJZRUVFZXVaelBmTVEvalJYdWlNRDI1NTl2RUJ6cHNzQU1v?=
 =?utf-8?B?WnN3dVhWV2RMMXFsQTAzN1UyRjJmeWZ6MGZJaUx0NUEwcHU0bzhrL3pCMlE0?=
 =?utf-8?B?VVc2VjMxQUhrZnRHMVRvY2g2Y3ByV0NLNHBYYlBYUnFIR0R5R2ZzYk1SN25m?=
 =?utf-8?B?elRSREwremdBUUxoNmxyOUNxN2JobngwcXZnMk5zOUk2a2hLbC9jaVpobjdN?=
 =?utf-8?B?dXBaMVhsakh2bUZQYzNPb3NjY1ZkL0lIaTZjZWlEb1BxUjJ4bG4zamVaemd1?=
 =?utf-8?B?d1lVclRWN2hBTlNBVWdIeHNDeDZYcHlDQXJ2b3JBemNERmtBaXA0WVhWdWt1?=
 =?utf-8?B?cnhFNnRIUlBZZEQ0bElOV29QWTY5cXc2SWV3ZHdQSXBPWi9iQVhuSjROQW9k?=
 =?utf-8?B?Yk5CcHdUYU9oeHYxNzMrK1dvUGtORVc5UEwwTXBaYjhQVlZuUVpFaTVDd1V2?=
 =?utf-8?B?YkZLWXlOYVpSbmdTMC9xUlN2VDdrTlBnU3ErYzl6aDR1dEQ1MUx1RisxSG5j?=
 =?utf-8?B?VVRveUx1QVBqUzZRWElzSVJ0UU5GT3Z6dU1hNkFEa3libzQ1NFIrQm9peHBx?=
 =?utf-8?Q?wq2M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6981.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2ZtZGx1MXdCRC8xQTQ0TmRyWG9XdCs0T0lkSmhpVS9hVEIySTBNeVNxRnYr?=
 =?utf-8?B?V1ZiOWJpa0FkZzV6THB6UzNQZHhzNGhtZlpPcWVkTjBDUlozdWdicndsK0h5?=
 =?utf-8?B?Y2dpT2N5YlJuVSt3dlFGd21JQ2NyaXBVaU4ySTY5WW5IVHJyVDBiNStrcndN?=
 =?utf-8?B?YmoweVhPT05wVk5CTXpFZkErZ3hjSi9qbUhvSnNJU0VTVTNqSG53cG16Yi9t?=
 =?utf-8?B?dE5YVVBSSHN5elBoQmxwU1hZd0lkSmpPY2J2YkVIdDFCYzJHRFhZMzJjWTJl?=
 =?utf-8?B?REhtNWtjMmYrVkhUb3RmV3FIeGtITEJZek9ZRUF2b2FpNldJS2YrUEU4SUpF?=
 =?utf-8?B?dURxNDlTYzhvQ3V3QlBOZVM5UXNNc2Y3VVRaaG9JTWZCZkFSaThOT0JpdGlh?=
 =?utf-8?B?TTVmZVVEUitha0dxTUtXbTgyaWpwTytiVU9LcDI1WDhLWG1qMDNpeHlGR3lN?=
 =?utf-8?B?UW9GcHJjM0V2UTN6eGJtMzFqckErdFpXYVZhd2FjMjE3TnJyS2pDTnFsaUJL?=
 =?utf-8?B?a1JEYUJscnhrTVY5Zy9hem1KL0xVNnRHZUZsdGxCeXJkUDc3bFV6MSt0TDFx?=
 =?utf-8?B?QUxPdWxiVE44eU1IOCtBQkNXVkdrbGx0S2llY2hYV04rYTBxWmtaYmJEa1pO?=
 =?utf-8?B?U0U4elZ2a0diQ0MyYW5WYW5EclJEanh6RFVodXNwT05yRldBcDREMkZveGsv?=
 =?utf-8?B?UlUzWDdHd0l0RUxVVDgzaitDRkFLZ1VxTjQvdHB2V0xPTUw5NjZJT2V2NnNB?=
 =?utf-8?B?eWQ5TjdDenNmMC94SWFKNGtuUkdRQ292ZjVEaFprNVZ4T1dnL3YxUTZoZ0VK?=
 =?utf-8?B?TWF6MkduR1F1TTNrZjNhbDZHRjFYSXZMNmI2WURiN2tRbzJ5NVlmUmk0RUNM?=
 =?utf-8?B?LzdiWXl4UXkybG5GY1V0bmhoVzJ0YlA5UGFxUXN3VHNXUm5PM29ZYmtJWE5K?=
 =?utf-8?B?YzRicDlSd01ZVkpsaGVIS2N5dTFtcmFVYW9mSjN2Zmg3b1F6Z0dxWGFLYnI3?=
 =?utf-8?B?UURQSFBQWTRDT0l6QjcvOHZkYUdoNmdBS2pTWVVvdk5hNjQySkdrR09QN0Ru?=
 =?utf-8?B?b1pNTklTMkNQaEhVS21yOUNkeWljZVk4ZlFRSEhvSlUxU1lVRXA5aUFRQlpW?=
 =?utf-8?B?MWRTS0daQ1JMRWx0UGR2QS9VdWkrZStzM0JnbVBsbTlsdXVYODJtWW5LQi9U?=
 =?utf-8?B?M1I3elFJWG55U1pnRnBJM0xuZnhxVDdqczBMeVVBQVdtWTFWWWVrNmhBWFZR?=
 =?utf-8?B?R0pUc1JFMGVEcVY1Q2hva2NXWC9Bejh0cm45OG9lTG5DZXRTQ1ZZYUorOXBG?=
 =?utf-8?B?UERaTE1OazN6Tmd1dkFHY1RMY0RoVGFhTFp3KzV5dlFYejh1RXRnNUJJRW15?=
 =?utf-8?B?aWdWY056UE5jL2FzWjlxb3dkTVg0Z2VCWTRzQWVTVEtPZFFwU1RVMlZNU0JB?=
 =?utf-8?B?Qmt2ZkhNSHY1VUZTV0Z2bnI5b1ZmNHZSNTVwRVkxNXVKdTZpL1NsRHVNSjk5?=
 =?utf-8?B?NUpTN2NQZmNVQzZzOWlKdC9CK2VJaDJXMGU5clZCaElIcTlLd2Z4dXdwaFlM?=
 =?utf-8?B?L2xDN21NU0dMQnpYRlgwanF5UEpUbVRoMG9mZmV6V21qcEZURW9tdEVxTjN0?=
 =?utf-8?B?Ui8wUnNjOXZPa2hRMjZqdGthaXpFL3R5MEpDUEN4L3RTZkJsMlNXRVF0R2pZ?=
 =?utf-8?B?RUdKRzlONUQzMlBGbWNjOFZpSksvd0lJM21xNlZDUCt0Ylhua3BGR280WVVw?=
 =?utf-8?B?NW1XeXYrelM5TVNHdi9KcTdlai9QTEpscENmWTlVcHVhd3dYeDBxVnBpdnU2?=
 =?utf-8?B?aURINHc3aGkyVWhoUkpVQ0ltbjBNTXVMdlhqcnlERHRmeGVTeTJVZC85YWVR?=
 =?utf-8?B?dzFVQUxaQkYzcTE5TXE2WWNGZTI2dzVPcUYyR0QrZ1pYTUJWZzJCSmJVRjV6?=
 =?utf-8?B?TmVMMm0yQmRQWFlPS2M0a2xhQ3hCOXN5TlN6ejBYdVlUaXJzam9WUUJrT2R5?=
 =?utf-8?B?c1JmL0FPQlpBTU9saDc4cWEyRzY2VjVkeW5UWHczcWdxcGJBcVFySGNNc1Fs?=
 =?utf-8?B?a2pITGR4aFp2T3RLK3pROGl2Z3ZZUGFjTElWSE9mY2ZQWWxNWWJOTk9pVUh2?=
 =?utf-8?B?dnZYcS9jTVVkdmV5NTFMVjkvdFpVSk5aRERGbnRUNERGSjlIb0picGpGcVhX?=
 =?utf-8?B?ZkZQdkVsR0dKU2pTL25SNHJ0ak9TcmlSTEpzUWV1WnNvQXp6K1docU44ZElV?=
 =?utf-8?B?NllsR2RRRURzRjFvRTM0clNySEJlV0t3QVFqOVF1N1lVdUhVbE8rT2FQblcz?=
 =?utf-8?B?TEJkcWs0ZnAvSFE1ZzR2QnFVak9qUFFOUm9OR0QyUHIyN0dieC9rTHdiMlVR?=
 =?utf-8?Q?d+ByqYZWdGMzY8xbH69E3MKg/dpd47gsX/jBQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a19bc29a-9e37-4dac-ea6a-08de64083019
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 16:12:26.4822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kDKu9mQenJn7ZfHCLmX1aHT5LH2UqyEfrdaiORWx7VfZ2Wq0/SLvAEraXovukPl/Ei34sF1MOAietJgvLsQZpO/ANDkfBwCd/KHbnC5iSfInnul55YB0+WXQAMy9NY1t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6030
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

On 03.02.2026 17:36, Shuicheng Lin wrote:
> Free the newly allocated entry when xa_store() fails to avoid a memory
> leak on the error path.
> 
> Fixes: e5283bd4dfec ("drm/xe/reg_sr: Remove register pool")
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_reg_sr.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index d3e13ea33123..ce3dab8a0f47 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -74,6 +74,7 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>  {
>  	unsigned long idx = e->reg.addr;
>  	struct xe_reg_sr_entry *pentry = xa_load(&sr->xa, idx);
> +	bool allocated = false;
>  	int ret;
>  
>  	if (pentry) {
> @@ -94,6 +95,7 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>  		ret = -ENOMEM;
>  		goto fail;
>  	}
> +	allocated = true;
>  
>  	*pentry = *e;
>  	ret = xa_err(xa_store(&sr->xa, idx, pentry, GFP_KERNEL));
> @@ -103,6 +105,8 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>  	return 0;
>  

I would suggest create a new label above *fail:* which does kfree and
jump to it whenever pentry has to freed.

fail_free:
	kfree(pentry);


Regards,
Bala

>  fail:
> +	if (allocated)
> +		kfree(pentry);
>  	xe_gt_err(gt,
>  		  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
>  		  idx, e->clr_bits, e->set_bits,
> -- 
> 2.50.1
> 
