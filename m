Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E92C28B30
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 20:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB3D810E2A7;
	Thu, 20 Mar 2025 20:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JMbPuQwx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E6D10E2A7
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 20:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742501310; x=1774037310;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t7T4q/dwhfKcT8nRHXej9ImLZ1XwgFhOCfRpmdiYW+U=;
 b=JMbPuQwxBbM9YuBSJc5d98+2YLKCq968Yn/bLQk0M0xdmEq6GFmf7UHi
 p0pR1Rx/FiEWW0oOgZUjZXE+YuMhu3h0AtuJQDpCiX3NYyCteL4X0vtgK
 ME4SD3aZqf5nXCRTAWi37B8FFheJRxzIewAan7KjiNXIeKDPQngiqxXwC
 zOMUDZoO8whbeaUW35iU/feWyrmRL3Fp1WlC7NNgudcSBcERrtRebZOox
 S5pf5TjUUscVmn0ZLtpNS3HHNzBhD6Vgd7Kh4qasEkGUEkXT+3hlfGczt
 qqsjlwwXe9VLO8qbtjhs9rSdCtJf1ltNomzWN21TkTlVr581PS12NX3v+ g==;
X-CSE-ConnectionGUID: u0IpPBhbSbyLobcT8IW7ug==
X-CSE-MsgGUID: AbuZePI/QsO9HdSjUN3rhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="61279796"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="61279796"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 13:08:30 -0700
X-CSE-ConnectionGUID: 8GT8nnTTRLuCjtieRdv0AQ==
X-CSE-MsgGUID: WRKIx8S4S0iz28PgYRSCNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="123223456"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2025 13:08:30 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Mar 2025 13:08:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 20 Mar 2025 13:08:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 13:08:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jMvj26DkX0Kogc7sJ8eIvPWZ9+mEkQxsGbWoRR3/JrPd7tH04/On85DbaewoviYP6gPq4JU3lemrw1Kkt6AzebW1Sq7oYz9BZK1qF5w1PY5SS86e1+wiB0CYVVNVRkOspJuDxxY0C0K0tkkXTrm5EJ4qO+ny6Y5VZjiNbrqCF5Pq+HLkd84pmgrPva+oYSRVqBDVkKS9bPGq2u/KY3RCVBABQWHA8898qPbaSxjiRxnGqexQBWI4apIwxr8QCN5KaA8gDKPGLppwXXPMQw+LJmzE7ZvkoaMOxlDPcHu4+cYMVJV1EaKl6aMBZna7E89EsVr4UCYkhecCIsjZZt2zFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PczSYiWksl1m3GwEuTO2bPW6H+xllmdfsQNN3bEWYX0=;
 b=QNiJ0hNX+tihd8pTKWueYP2flubD3mXjbei5MO7MycNpoP8SHZ9IgUG/utn7vXAL7i1dLcho0lVPAoEYDhj7Lp35dwQelLcnKD0kHfR3YuXSzcAK8PExzWg5pl+a1iPe/dfOhVbI9taVbiSzr8CLeaGog/o5sxhyaNlQAyqCaSZeGhMgYOhLXxmvUMbJeGDreKYzl1QKLoFNFN5R+g4NfuXhv3DFa7t223bZ5c70ity9j6/B9R1CmXAVefYqZvgs6+ZQhJs7IJP4YoKg3mrrskoTelsVbqav1+O8w5GagGgCX1MhDyyzpJZYrauE0xmycGfTqb5JL9yjoa/NDOw4yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH0PR11MB5830.namprd11.prod.outlook.com (2603:10b6:510:129::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 20:08:21 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.8534.031; Thu, 20 Mar 2025
 20:08:21 +0000
Message-ID: <f24020f6-b6ac-4a1b-8f4d-75574582d726@intel.com>
Date: Thu, 20 Mar 2025 13:08:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/uc: Remove static from loop variable
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe
 <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
References: <20250307-xe-per-gt-fw-v1-0-459574d76400@intel.com>
 <20250307-xe-per-gt-fw-v1-1-459574d76400@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250307-xe-per-gt-fw-v1-1-459574d76400@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0029.namprd02.prod.outlook.com
 (2603:10b6:303:16d::34) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH0PR11MB5830:EE_
X-MS-Office365-Filtering-Correlation-Id: 63346d7e-a15d-4cee-830b-08dd67eaf69b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3FXWGdmNksyNWE5NVFYOVIxMmszdzRScmsxOGlZWlM4bDlYQkIxaFpxb2tE?=
 =?utf-8?B?djV0V3lDQTFZVHg2SGhhcTNCRUNCWDZqYk1zYXlZS1NMTnRJanZNTUtxSWVa?=
 =?utf-8?B?ODB2bmx6R3NYZWF4alRnZVN0SWNMb1hFM1hGUmdXUnFObkZxb3lxRDlQaTZ1?=
 =?utf-8?B?WUZoNVFnMFRIYkxiWHM5d3hwd3hXbmhvUi9wQzIzazgxdHJvaGt2NUgyTUta?=
 =?utf-8?B?SWpNZnAxK0xNM3RPeEx4VjZYSmNYODI1cXhoZ2FNWHNxc1Q3Vm51YzN1aGZK?=
 =?utf-8?B?U0FZalVpR3IrL0ZBTEhZTVB2SVdPa2xXdXRiZ2FIbG52cEVhcGN2Q0thcXlL?=
 =?utf-8?B?VGlsQWxmOVovMndrMytvUmQ2UERMV2liZTVkOWVkZGRiak5qZlFyK3hIbzZD?=
 =?utf-8?B?TWpSNDVHN0JtcmRlM3VTRTd4Z0tSMTJmQ29UR0x1YkY2a2RtRkY4VElacmcz?=
 =?utf-8?B?V0p5TkhTcytxd21tMS9ta3VHLzdNb3JDRHlQV1YwUjJDYjRyNGJQU3VKbTBt?=
 =?utf-8?B?S2ZiUzJObkRJd1RHeGpNMzh0RktFOW5XTzR2VWhnUFlTSi9ncnd6VGh4MUc2?=
 =?utf-8?B?cGI5dGVzZ3l3VmY3bEdvTGxmTGRiRGZSbStOZVZZZ2E2cWNyTk9xQ3hlTDIr?=
 =?utf-8?B?MExxd3IwajVoU2Z1Z3V6VzNoWmZaY201ejdCTk1BbkphWUJ6T0RmUkdSdHgz?=
 =?utf-8?B?d2dtVFNKM253MkF1aDJJeHJGVUVhR083RmNQSmZjdHhMZmZCZE9Va1JyMnl5?=
 =?utf-8?B?RVhyaW5oYzR5Um01d25JSHFtb0ZvYkx0dGh0dnQyZkFiU2x1ckYwQnJxZmFK?=
 =?utf-8?B?Y3htbG9Qb2twakpnYmx3VC9nakE2cnhQVTkvdi9Zamx2SG9TdnZMaEEybFJk?=
 =?utf-8?B?TnlYeUpJd3NaNkMvYkRTVCt0YWlFcmlwSHhXdVhKTDZpSEVEd2xLbCtUUUY0?=
 =?utf-8?B?U1ZXUlFobG90T2tWMnowdGZnVVNqRVlRRjloRnRCWDlQNGFJVHRDajlIekFu?=
 =?utf-8?B?emR3TjVRUjEyMzFCMjgzRlBJQ2xkT3JYdXp6OFc0UXVxZnNyQ2ZYTm5UQ0tz?=
 =?utf-8?B?REUwNDYxaW1BaXQ4S2Y2SDgwSmpwZmc1V2lrWGFqL2t1N2RjS1Naa0pUODR1?=
 =?utf-8?B?N2NSdDU5ejM4K0xFUEU4SnAvenZuamFkazJqcC9IbERHaGpGL0ZFb05SL2p6?=
 =?utf-8?B?SXo1dUNZMHFYZkRSRG4vWlVQRkNIVi9tQUZNemFPcU1sbGtvcnBNays1RVFh?=
 =?utf-8?B?K1gvZFZVYVNxcFhwZklwemtta3M0TmVGOGRwYnNsTW9KRE8wSkQ5Mkx3bjZQ?=
 =?utf-8?B?K0hQdFdwZnU1Nm1pcVo0MTk4V1psWlp0NnZlQzdJUnJaZjg2VW1UdGJjMU90?=
 =?utf-8?B?NkFodEphQitJbUpRNEc3T0JlQ2FkakMwZGt1WHFYZUVqT2FSTWFNbjJGSGwr?=
 =?utf-8?B?cVRLWU5yNGlkS2wzNXNKbVZlaktHODFtNmdSZ0ZXNktwSk8vd1ZqZTk1V21w?=
 =?utf-8?B?TWIyMjluZWRKSkxrZ21Pd2o3eWdxY1ZBaXR0OXZLWDNGOExZTy8wbzNpRE1M?=
 =?utf-8?B?cnJVRlJvVXhvYVhQRjVFWFlHZnhXVGw0aklsd3R4NEtvaWVjbHFvcGlJbXRL?=
 =?utf-8?B?U09sR3FNaGdITG1hV0hsM3puclNWbWhSSW5QNi9HZkF4cUxIWnQrTEhZbjdN?=
 =?utf-8?B?am1HNlFlV3dCdXlBeFNXYWdJUFM3bWlJMmFob29scjBnTmtlUEpRSHNBVFdw?=
 =?utf-8?B?RUVCVVdDOVBjaU9CNmlGaW9lb1NRVWszSnBici9OZnQyTEhSUFozenlFWFl2?=
 =?utf-8?B?dDhkT0cvUFBjNURzT2RNenhmSGNRd0JQamJpc0djTkZNdWdYYXhvMGRZaVQ0?=
 =?utf-8?Q?R0azF/jY9nLuf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFFzdnJFM2I0R1pKcVhFVVpNV25lOHphcnNTcktyTzM2aTNranVBd2JORCtE?=
 =?utf-8?B?aXVLMnpFYU9UdndySUs5dmkvNEd1VnQ2dkFvTkdSQTZ0OFFOUGxENmk4RjBo?=
 =?utf-8?B?c0tMbDZucjRCZXczRkdaUk9vTHFwYUJqRVc0WUlMTDR6RXpjNjh5d2xOVURa?=
 =?utf-8?B?NzVMYkZmblNHNXBSM2ExTHYxMzF5Yk9tSXplT29EcEQzYlJHblV3TGxuTG9z?=
 =?utf-8?B?Mi8zcVcvSGJoT0F4UEhZY3JkWDdyaEhCUlhTU0Y0Zzc0WXNLWHZYa3NNQXdw?=
 =?utf-8?B?UWJCVXhpSFBNdy9OWjhoOG1DblNHUGpPYUZmSm5xRU9ETC94OUtVYk52OXMw?=
 =?utf-8?B?bWhSVmNmaFZteGpsWWxpb2VKdGFxOHpER2ZFUUFkckwxL2hwY1BqcVlwQkRP?=
 =?utf-8?B?TTJvb05xRldBaHA4am1zYzZQY2Y3M3V3VW9pQ0lXVEdxMHBuaDExNUttcWxi?=
 =?utf-8?B?SkJET3ZQV0lLQmNuWG9pNlViRDZ6bXk0SXFFT3c2ZStybURRSnd1QWMrZi91?=
 =?utf-8?B?REVQWGJ2NERGTDJjUWxOQkFhdTllMHQ4c3cyQ1E5SlBBMzNrOU44MGxUMGkw?=
 =?utf-8?B?SVRvU1AzTUZuQXhTLytjd095TGFXNXBTZlBselVCdklGQVkxa1pWYnlGRkl5?=
 =?utf-8?B?cDVwYWtGSWlxVm1jM2dWR0xwbjl1L1JsbEI2Szg1WklYajJLcWRGMVc4dXJi?=
 =?utf-8?B?OWJkVFIyaUdQOFh2ZEtxOVAzYUxqOGZkRzFyKzIzWGFNOUJqOUNNQWtINTVW?=
 =?utf-8?B?VzFLb0gyaEtkZTY3Z1FWYXV1b3ZDTDlRUEZMZVpCNFdvSkJJQ0Z2T1JETXBT?=
 =?utf-8?B?bEtER0J5Y3QzSEc3WnFrWHAxeFN1NEI0K3NsVG5Xb1UwN3U2RkR2RTlxQytR?=
 =?utf-8?B?UjZuRFFGdGVuWU1obThRdUxqMVVMd1BMWWFBckVnRmlYeGtGa0c1aFVaSE5Y?=
 =?utf-8?B?WUZrVm1JWVFkMDJIbkVjWVpZNElDNkdMcFg0REtBQnZOM2ZRL25HaU9QNi9r?=
 =?utf-8?B?SUhpSDdGR1FIaWIwRGRnVUZQR2pjZ1R3S2lkRDc0QXByOFl4M3F3S1FlNkRS?=
 =?utf-8?B?OTM0OVdFNjJGQnJBL0pyMU5vbVRmK2Y4R2tnaTl6WjZRRnBFdStaZmZJUExm?=
 =?utf-8?B?MHZGdmlQaXZ1aEw1M0RrS3FrRmFmV212Y2w3ZWJIdVpVQjBNLzNJR0dtMlR5?=
 =?utf-8?B?UWlXOWhKNlVBTGg5dVF2c0FhQktmS1BDY2drT1RMWk45aUlPOGwxZWMwUmpr?=
 =?utf-8?B?V2FiNzlvR2xNL2hNMTdSVGlwMlFlR3Z0TWs3dC85MVJ5SWY5R1ZFcXZaQXVz?=
 =?utf-8?B?bVNuZ09hQm50ZGswb0xjdVlLU0habVhqbFhDR1VYckF0UG05TU9pdit0U2tw?=
 =?utf-8?B?blJ6L0JPZTIzZTN5NjFTdGlFd2RweHBDOTRFb0NaUEZQU1dKc2xZTi9DSmVr?=
 =?utf-8?B?VXVwREljYVZaYXhvUXlUNEZldkF2ekhuYmtQWE9yYWNyL0pyeFBsemJGanoy?=
 =?utf-8?B?MFlFUEF6SEJJVjVIV1ptSkVFTGZ1emhDSUpyZFlPYUduZGRvcU1nbmtuN0xi?=
 =?utf-8?B?VjE2emFwQjlLeUE1U3diaHRoV21qSnE5eE51eVZjWUc2d3MvbDhWRmVWVzV5?=
 =?utf-8?B?ejMzNTluZ2l2L2djM1plQ2N3ZGQwZlBkdFhQNlFuaVZyZXV1T2t3MDJ4ZGdq?=
 =?utf-8?B?dVUwWUQzN2ZTdkVvUEk0UlNvdE0vdXkvdDJVTWp1VnR3Tk8wUmNpM2VBQ0JH?=
 =?utf-8?B?RkxyYkpPQnFvM1FkbGM3QktXTWhycXhQR2ZZVFhDNkVMUXVGRHVTdXNvV2dh?=
 =?utf-8?B?TTF5K0YwQmprTTM1VUdaRnRYWTJDQVdyZ01OeVUzaUZxWXZNTmp3WnhwSEM5?=
 =?utf-8?B?ZHlNY2JNVDF5VEJQZ0hLWm1DREJWbFNpbktCSGlFVUJQdjdYc0JTWlRFYWpp?=
 =?utf-8?B?OXRla3JFOHU1Y1JrMk8zb24zNktrRTlmSXpmOHljRTFTK1cxMkcxdElUK0Zw?=
 =?utf-8?B?UDhaOVZzZkdWNFlvL1FHZUdWT2JjVE5jSmZGakJVMnlxMTJNUDhXS09RZTVy?=
 =?utf-8?B?VWViYTZ6Ykgzc1d0TzE4eVB1VWcvZS91TWpBd2x3VG9SWEdtNTNQWkhLeGM0?=
 =?utf-8?B?TGNINXAwWjVFbE9tS0NxNTloMGg5VHZIMTNKeVZ5RytuVitZMFlvNFpuRVlF?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63346d7e-a15d-4cee-830b-08dd67eaf69b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 20:08:21.5988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8cbBkGIcIaw9DRJnjlPsZXbDhRKb+SaI1yDOUo6S9JmIR3LWaWayjWbe8aT8q2whTz0/Teh3orCQNieoqwyfFxOUIFFtgGqBLAZC21gbX/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5830
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

On 3/7/2025 10:13 AM, Lucas De Marchi wrote:
> The `entries` variable is used to loop through the array - it's supposed
> to be const, but not static.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 18e06ee9e23fc..c22da0ce9fb0d 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -225,8 +225,8 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
>   		[XE_UC_FW_TYPE_HUC] = { entries_huc, ARRAY_SIZE(entries_huc) },
>   		[XE_UC_FW_TYPE_GSC] = { entries_gsc, ARRAY_SIZE(entries_gsc) },
>   	};
> -	static const struct uc_fw_entry *entries;
>   	enum xe_platform p = xe->info.platform;
> +	const struct uc_fw_entry *entries;
>   	u32 count;
>   	int i;
>   
>

