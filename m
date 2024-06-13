Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5763FC27C53
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 00:43:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7D410E013;
	Thu, 13 Jun 2024 00:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V2ngwFwy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2667A10E013
 for <Intel-Xe@lists.freedesktop.org>; Thu, 13 Jun 2024 00:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718239432; x=1749775432;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gD9PnB9zGuoIoTGNzxadecHNdsJZOzBSma7E/mPrB0A=;
 b=V2ngwFwyjhcI1wbn+Wa8ocil1pNBFbeqsHc2gUYv+O7FELmKVWsGmLbc
 e9akpvxEr1XW+cu/7OvUO5FFuqTFG3+kFo66d0VIstDnYlGP6tq2N2aEV
 lo/rCSbprXw3MaQ8cYK6xZH99aSiSOa5BAIqPM/98Nmh0E/dBk7eyOdVB
 XAtA9oA6nGjHagXALDbUx5J0nVuVTh5KHbG1+mKWCkLQ/cKQXzwhpPdBf
 OU0z9p0OATB1MHrZ/3tTGr4ZOx0h9FGNiv3zsGM2si4fpeLT5pGp/uY9u
 j3q9fTmcVn0R+65eAHLsBsuVhMSmJQmcvWdZSAIzkJzgB7u7siyHWrzre g==;
X-CSE-ConnectionGUID: LihWy9GsS4aMsaWd2kTHAQ==
X-CSE-MsgGUID: 4KiVVpYVTL2aUoKuOcYP0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18889301"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="18889301"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 17:43:51 -0700
X-CSE-ConnectionGUID: qoOY5p83QSiT93inWrbgwQ==
X-CSE-MsgGUID: tkefA0Z8SSusgksK6eV/0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40066388"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 17:43:51 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 17:43:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 17:43:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 17:43:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQJ4IjvEzhq0FCvBY1eJQuVECYrQFQFYypIqiY5LXEvcewLscah3PGY+eNG/RDbkoo9FyAOjXACkA0k0T081figOokl3pwpZUIT2hpvbtyUmnTjiqobygZBb4NOScCdY84gjo6pa+mJ87nQpojJWaQ8QP/aTrjv6367DO7ztaoYTtQzyTmvO5ahWW+e6OY+ufOcSWtqjDFFrK2y7cd1gcyFbJFJoTdiFB36PV1mwZha3AIh36nHe+LDIJ4dTkLiX98lwThkfs35zgH1H6qcQ6YflILY+Ef/7mlJKhWXOkh1u0DrTEpArT0+zHH9VuGEseLgtUOGR4cVu5+KaTsmHSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjUfBd7TnWbylCndClWN7/qbREzIyslxxetEv5kqJKk=;
 b=BGFyBCvZPYibDbbEQO6EEsByjb4CbRBUCGso61+F2xfPP0Hu+CpJCRzBvMPQoaHCX3Yd6Q8XqI9zxR8UcJLqKz5tqXTEW8oIVgYQyhun7Q2up1Yw+2dOADBKmjXqXBXj0zuxddOplhldNmlnTG4uKArHmn3zc0PFrqRl4mBLIcsJ7JiCQFObhMNZSAADYP2vvawSqME8uOreWqJUFSb6lkhVOa4eEcpPIOci6RNlqRpgbqNFDctfjsJR/0UQerZXM8igrkv/HCgrX+HqH+KYFCrFhpbauEeHw0RgDEkvLWf8rFXfSMOtif2qQYghOtn1K2gGasq3sGZHZ19KQqyv/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by BN9PR11MB5308.namprd11.prod.outlook.com (2603:10b6:408:119::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Thu, 13 Jun
 2024 00:43:43 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7633.037; Thu, 13 Jun 2024
 00:43:42 +0000
Message-ID: <59ce06f9-e133-417e-8146-3080bbc40e65@intel.com>
Date: Wed, 12 Jun 2024 17:43:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] drm/xe/guc: Dead CT helper
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240611012028.2305024-1-John.C.Harrison@Intel.com>
 <20240611012028.2305024-7-John.C.Harrison@Intel.com>
 <cc9f73d3-3a0c-4dfb-b3df-b2484882055e@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <cc9f73d3-3a0c-4dfb-b3df-b2484882055e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR2101CA0011.namprd21.prod.outlook.com
 (2603:10b6:302:1::24) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|BN9PR11MB5308:EE_
X-MS-Office365-Filtering-Correlation-Id: e0dec39b-e9e4-497d-8369-08dc8b41dfca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|376008|1800799018|366010;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3lrYTVDQisveEZ0WlVseEhhME5ma0VJK2hqL01ENktZQlVidG5SVjdwSnJD?=
 =?utf-8?B?eDFMU0NWS1Ewc2VNd3ZiWnpYMkpES2lKaTF0c05lWHhxUEYrU1BJVURrSnpT?=
 =?utf-8?B?eUlXZGdLeDdSb3pOVFFYbXZmdGwvSGlIWlpjU2JHYXpDWnJLTnBnYjIyUXFH?=
 =?utf-8?B?ZEVZenJxdE1hcGI1K2hXRTAzaWtNbEhtUitFQlRnUUtQaTVMSC9YUGFzWWNo?=
 =?utf-8?B?RlZUWGJ5NWl0aDRmdVNESjNycWtITWFGUm1sWVg4Qk5QWjBCZnFEQ1Q1TzRk?=
 =?utf-8?B?Y1VVb09La1NMMGh2OWJBMVI4UisxZldxQ2Q3UDFKeCtPNmlGSkZSSGsrYWZp?=
 =?utf-8?B?Vjdic3BaZ2NCMTE3ZE1zWS9oUFZrZzFrTWRBdVJWTXhtYThDdERnY2pxaWxs?=
 =?utf-8?B?dEt1dE1aYUJqVFlyZHhQZlE2dHVFU0Z5TWJ0TU0zL1ZtNGFwWjJPbUZBaFVL?=
 =?utf-8?B?VXhsaERGSVBGNTFXK2llNmVrUGFGY1JBL2hOVm5wVkRIbXZSYjkzME9IUUU2?=
 =?utf-8?B?UEI0MlVaRWdMTkxQZm5HRWRtSGZ6ZWpiS05sNUhlK0pMdkhsZ0VTSEx3L3ll?=
 =?utf-8?B?VTdua0lIcUZBdWpKNjF1eGNFd05uVVJkVXlLd2lvTVc1WG1SaUp6OUtXVW80?=
 =?utf-8?B?M1NsdlFIMy9jSE42clc1RXR1RDY1V2tkSVNYSVJFeGU0aHV3a0g4K0RXdVQ2?=
 =?utf-8?B?V2tqSXlFSm85ZnluYU1rbi8wSi8xTlZQWTMwc3R1Z20wWldkLzhwemtZWG1p?=
 =?utf-8?B?TlJuV1R3RXZjRWxZRWtHSy9GM1pmS25QMVlnQm5GaVRneGt1ci8vZ1VuWCtl?=
 =?utf-8?B?Q3lkd2srdU9BSElLK3dNTG9sOUdtQUM1Y0JzdHFoL1VpSy9FeThrWWZ5dFND?=
 =?utf-8?B?OWEyYThRaCtrWXcxQmNuL3ZubWlaVDg4eWdGZXhIQ2tkRXhPcU1PQzVtQXIz?=
 =?utf-8?B?S2ZCWkpvUWtuQkpMQmJXckhETGo1dklFelE1UlVYQnIzSWFpZE11VlhZMldq?=
 =?utf-8?B?aHB4MUpGbzdUUUIwd3NSdHZ5cjFwSmhBTkVHWHpkaGtGZnhTSWlXK0N5N2l0?=
 =?utf-8?B?bUJWam9rM3dtay9yM0trMytlek13Z2xjRmFDUFBGbTJpVDA3Q21FZzBCZHpa?=
 =?utf-8?B?VDJRajlIMXIwSkdwdGY4akU5Qm1lVDd3VVh0K2Q0TFVNUTh1RnpmeU5xamFV?=
 =?utf-8?B?a21LNUJzVU56M2dtekN4WEtHQW1WaFNrajJSekJkQi83MEJ1WGlHbUZUTE1E?=
 =?utf-8?B?Rmg2bS9hWnZqV09Hb0traEMreGdtbXFoZ0ZkaHllcWRmUXlCYm5SalFjT1hV?=
 =?utf-8?B?SVJJZFZuZVZZN05sYWFMLzFPTWdNTGo0bXZGVmxqZkVpVGhieFM3d2FvYWhY?=
 =?utf-8?B?Ty9QdmdXSW0yZVQzREcrU000cVJldm1MZUFxUGRjSGF6ejVyRVJZYVFXVzlj?=
 =?utf-8?B?N0FyWnFYMUlqMXJJbktZUXpTNjNXTHd5QXdTY3BqU2doZGtMeExVQ1gzMkph?=
 =?utf-8?B?d1o3ZWFtZDQvV1FiSTRHbkZjS0tQdGxGSWxHSFd6U1VaNGxmMjRyYUp6dkR1?=
 =?utf-8?B?ZzllUVlvSnZQbVl5Vnc5TFdQZEFiMndsNmJWL3hibVN6Wnd6OHpaSVIzZXU1?=
 =?utf-8?B?UXpYWkY4aG9RcFM4U2x4NS9JQks4KzdhMWpXTkJuWUtYaGtnWTY4dHlJNWxI?=
 =?utf-8?B?bWFwdkcxV2hrNEVuQ2huS1lVenc3ZFl6UFMrdDcrYTZ4NlNVRTNPNE1Jenlz?=
 =?utf-8?Q?tcJdALp/fxxG2D2yVKS3hM+3XDUGl9rFH/YbbN1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(366010); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGNqUDYraER3SFZteUNjRFFMUStRWHBXVnAzUmY5T3Nuck5MOWxKSlBtTURB?=
 =?utf-8?B?VmROTlFXVHRZa25WelpvbFFndTU2aDc1eis4dHZNY1Y4U1lYZDdjVWRyalFa?=
 =?utf-8?B?bW5DYUM2ckhhb1BleUtTT2JObDJLZmlUd2I0cGRObDZsZm5JaWNFeVc0RzJE?=
 =?utf-8?B?Wnpidm13bmJNMDJuWUxPRDR6MGRaSjZaVGg0ZnJucHJXMDFIR2llYXpSeEVN?=
 =?utf-8?B?VEdXQVdxb0xCVm1DY2VaVmIrT3dDSTZZaDFiYXdIdDl5TWgyY0VUVHVwaE01?=
 =?utf-8?B?ek5Uc2JaMkpxb0N4c1p3cHFSc2E2QjExQUgzU3UvandvZ3ZlVDlvcVdpSmxv?=
 =?utf-8?B?RkJKcUJwZ0VnQ3gvL3lFQmZ4VVVSejQzZUpZODhRQ1dkVjc2NFhPaHQ4YmUr?=
 =?utf-8?B?NG9ZcjhyaXhxdU94amxlR1U5ZkM4T2xLc2JCRWNaVGxObEpmWFR2SW1hU2E5?=
 =?utf-8?B?K1RjOVQ4QlFGQVhMcGNBRUpsR1VNWnoxSFVvZ3l1cnJucm5lcEtNUEhpdUor?=
 =?utf-8?B?c1ZlQy8xVHVGT2UrNS9MRk9OOHEvRkE0OXVOYzU0VU1wajZ3L1BSL1FGRnYz?=
 =?utf-8?B?anJIa0czSHRDY2MzS2lic3pBTGxTSG9hbFBjNWs4YTZjT29FTVEyQ29Bby9w?=
 =?utf-8?B?b1Z6T09uSEtxTTF0S2JkMTJPVkJCS3NjSnhFOSs1ZW50QzFlM1B3TDk5U1BL?=
 =?utf-8?B?MlRFUlg4ak5hZVdvOTJNNUFOMFYrako3OFRSdlphU3psalpnVnZLeXU2S2Zv?=
 =?utf-8?B?UDlIT2tRbDVmam5ISEkyMm5mZmhuMDNqOGZDM09XZE9kTnBJK1RGa3R2enJU?=
 =?utf-8?B?UGNKbzVxNmowQm5samNpMWNaV2FNUVBxd2ZTWDRSR1BtVm5KbS9qQlM3c2Ew?=
 =?utf-8?B?T0tMR3dkQThLY2RhS3pwUzc0RGVrRFhqZHQvWWhycXQ3M09LNjdZSkpsN0Vn?=
 =?utf-8?B?NEV6U2I0NWlocW02VEhLOHBkaGtBTm82MDdNT1pmU09aU1UvMWlPNnlYUEhP?=
 =?utf-8?B?cTh5M28zdUttMjNIQmxybUhZS2wyMS8zVlZjZ2ovb3FtNkhSR0FxNmpmTjR5?=
 =?utf-8?B?eDR3djFEUFR0OFNqZklXYTFTVjdyUFFEaytUczJLdTN3b1RWQXNhVUNZdmY3?=
 =?utf-8?B?NlQ2OUYxT1JkTUJxVUlDYTlJZ3JtdmhoZmtobXZiSWRwRkxHZ1hucmtabXFC?=
 =?utf-8?B?amRreDBKdWc5TUl4cEJYYjRyYkxwbkNtTG1vVEpaUHlYc1g3OHdhTUxWN1BQ?=
 =?utf-8?B?YjdyTFoxZDl6VXdnVGJGWmVvMDNLUWNwRkNSTkdxbGN1T1h0VkZsZGFVYmFz?=
 =?utf-8?B?TExVaWM4UTVTaXVKK1FEaktqWHpxYy9POGsvV08rRVlwU0w1YUVaSE9tU1pE?=
 =?utf-8?B?bUJkZ0RmZjlKU1drOE1iZUZpbE1YMHRGQ2dQOGVQdjFXaStwZGZWQk9UVUxN?=
 =?utf-8?B?NFk2UnVQM0xWeit6ZFRsYk5PV0txczVQMUpuOVptT2pjdlFVeS85QWlBWW5K?=
 =?utf-8?B?V3puRG13T1dqNE1LTEw5bkhYZVhVNGllS29mdkFFY0NKN3hOWENpakRJTmIv?=
 =?utf-8?B?UU5qMXNrM1hvWmpiU3FIbHdHSG56eUhzQ2pvMU8vZVVQaUFyRFNFS2U0dEwz?=
 =?utf-8?B?OU1JSjBiS2JOWlFSR0MxdlkvZjJ2VXR4WGlzQkY2KzI0UTBGVXNpeGYzL0RN?=
 =?utf-8?B?TVc0ZXV2eXY2bG8vZ0sxQUc1TURyWVJRY2JtMXpmWGdCUE9xMHkreFZ4WlAr?=
 =?utf-8?B?dHNvT0VTaWlXbDQwSFdBZldpSVNlOWNQc1hqblMxRTR6UWdDRER3ekt6a3lC?=
 =?utf-8?B?cklDLzNCZkZtbGRuK0V1Z2RqS05iZHYyQUdRSjBnd1FZWkc4L0VoOWdjQ1Rh?=
 =?utf-8?B?RDRJNUpyRkZXYWh4RFo4UUM5WHNBdmN1UXNGRGlZcTAyT3lFRHd6eGpieHdQ?=
 =?utf-8?B?UUZwV2dKZTRvOVUvZGxncEFLZ0FidGVCQVJaTCtya2dDMGFyQnd4enJzS1RG?=
 =?utf-8?B?RG1VTGxXcEEyNENNdi9Fc3JhZG9HMEN0NFhtaVEvY1o5VTBJb1R3by94QjQz?=
 =?utf-8?B?eE9QOVJRZXFhMXZneDBLa0g5L2drRmhSOWhHUUN0MjVadk1PMmdDL2VSVnhj?=
 =?utf-8?B?eEN2Q3BmUjZreVdKOCsxSzBqeTk0cmJzV1JyWEJ3bFVmaUUrL2hoNE1WK1Mz?=
 =?utf-8?B?YWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0dec39b-e9e4-497d-8369-08dc8b41dfca
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 00:43:42.4768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DsgLVtNWr+87hTjAvIa1eN5ZG6jmf4f1nrGJgWX5MDa0qG7H60kV0xfr0hiV8rSaiQoGoNrFIoUSgJNPVwtYd9LxEp0cMsp7ptOysa9pJ80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5308
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

On 6/11/2024 16:20, Michal Wajdeczko wrote:
> On 11.06.2024 03:20, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Add a worker function helper for asynchronously dumping state when an
>> internal/fatal error is detected in CT processing. Being asynchronous
>> is required to avoid deadlocks and scheduling-while-atomic or
>> process-stalled-for-too-long issues. Also check for a bunch more error
>> conditions and improve the handling of some existing checks.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   .../drm/xe/abi/guc_communication_ctb_abi.h    |   1 +
>>   drivers/gpu/drm/xe/xe_guc_ct.c                | 257 ++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_guc_ct_types.h          |  22 ++
>>   3 files changed, 259 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
>> index 8f86a16dc577..f58198cf2cf6 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
>> @@ -52,6 +52,7 @@ struct guc_ct_buffer_desc {
>>   #define GUC_CTB_STATUS_OVERFLOW				(1 << 0)
>>   #define GUC_CTB_STATUS_UNDERFLOW			(1 << 1)
>>   #define GUC_CTB_STATUS_MISMATCH				(1 << 2)
>> +#define GUC_CTB_STATUS_DISABLED				(1 << 3)
>>   	u32 reserved[13];
>>   } __packed;
>>   static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index fd74243c416c..744402f9e774 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -25,12 +25,58 @@
>>   #include "xe_gt_sriov_pf_monitor.h"
>>   #include "xe_gt_tlb_invalidation.h"
>>   #include "xe_guc.h"
>> +#include "xe_guc_log.h"
>>   #include "xe_guc_relay.h"
>>   #include "xe_guc_submit.h"
>>   #include "xe_map.h"
>>   #include "xe_pm.h"
>>   #include "xe_trace.h"
>>   
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +enum {
>> +	CT_DEAD_ALIVE = 0,
>> +	CT_DEAD_RESET,				/* 0x0001 */
> all these annotations seem to be wrong as CT_DEAD_RESET is 1 and
>
> 	(1 << CT_DEAD_RESET) will be 0x0002
Doh!

>
>> +	CT_DEAD_SETUP,				/* 0x0002 */
>> +	CT_DEAD_H2G_WRITE,			/* 0x0004 */
>> +	CT_DEAD_H2G_HAS_ROOM,			/* 0x0008 */
>> +	CT_DEAD_G2H_READ,			/* 0x0010 */
>> +	CT_DEAD_G2H_RECV,			/* 0x0020 */
>> +	CT_DEAD_G2H_RELEASE,			/* 0x0040 */
>> +	CT_DEAD_DEADLOCK,			/* 0x0080 */
>> +	CT_DEAD_PROCESS_FAILED,			/* 0x0100 */
>> +	CT_DEAD_FAST_G2H,			/* 0x0200 */
>> +	CT_DEAD_PARSE_G2H_RESPONSE,		/* 0x0400 */
>> +	CT_DEAD_PARSE_G2H_UNKNOWN,		/* 0x0800 */
>> +	CT_DEAD_PARSE_G2H_ORIGIN,		/* 0x1000 */
>> +	CT_DEAD_PARSE_G2H_TYPE,			/* 0x2000 */
>> +};
>> +
>> +static void ct_dead_worker_func(struct work_struct *w);
>> +
>> +#define CT_DEAD(ct, hxg, reason_code) \
> by hxg we usually mean actual message, not guc_ctb (which, btw shall be
> named xe_guc_ctb)
Because it is called by passing in ct->ctbs.g2h or ct->ctbs.h2g. 
Therefore it seems sensible to name the parameter hxg meaning h2g or g2h.

>
>> +	do { \
>> +		struct guc_ctb *_hxg = (hxg); \
>> +		if (_hxg) \
>> +			_hxg->info.broken = true; \
>> +		if (!(ct)->dead.reported) { \
>> +			struct xe_guc *guc = ct_to_guc(ct); \
>> +			spin_lock_irq(&ct->dead.lock); \
>> +			(ct)->dead.reason |= 1 << CT_DEAD_##reason_code; \
>> +			(ct)->dead.snapshot_log = xe_guc_log_snapshot_capture(&guc->log, true); \
>> +			(ct)->dead.snapshot_ct = xe_guc_ct_snapshot_capture((ct), true); \
>> +			spin_unlock_irq(&ct->dead.lock); \
>> +			queue_work(system_unbound_wq, &(ct)->dead.worker); \
>> +		} \
>> +	} while (0)
> for clarity, can you align trailing \ at the most right column
Are we actually allowed to do that? I thought the linux kernel style 
guide explicitly forbade any kind of vertical alignment via whitespace?

>
>> +#else
>> +#define CT_DEAD(ct, hxg, reason) \
>> +	do { \
>> +		struct guc_ctb *_hxg = (hxg); \
>> +		if (_hxg) \
>> +			_hxg->info.broken = true; \
>> +	} while (0)
>> +#endif
>> +
>>   /* Used when a CT send wants to block and / or receive data */
>>   struct g2h_fence {
>>   	u32 *response_buffer;
>> @@ -158,6 +204,10 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>>   	xa_init(&ct->fence_lookup);
>>   	INIT_WORK(&ct->g2h_worker, g2h_worker_func);
>>   	INIT_DELAYED_WORK(&ct->safe_mode_worker,  safe_mode_worker_func);
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +	spin_lock_init(&ct->dead.lock);
>> +	INIT_WORK(&ct->dead.worker, ct_dead_worker_func);
>> +#endif
>>   	init_waitqueue_head(&ct->wq);
>>   	init_waitqueue_head(&ct->g2h_fence_wq);
>>   
>> @@ -392,10 +442,18 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>>   	if (ct_needs_safe_mode(ct))
>>   		ct_enter_safe_mode(ct);
>>   
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +	spin_lock_irq(&ct->dead.lock);
>> +	if (ct->dead.reason)
>> +		ct->dead.reason |= CT_DEAD_RESET;
> can you explain why RESET ? it's 'enable' call
The dump code suppresses further dumps after the first error to prevent 
spamming dmesg with dump after dump when the system is in a bad state. 
This is saying that the system has been reset and thus the dump code 
should re-arm itself and produce more dumps on the next error event.

>
>> +	spin_unlock_irq(&ct->dead.lock);
>> +#endif
>> +
>>   	return 0;
>>   
>>   err_out:
>>   	xe_gt_err(gt, "Failed to enable GuC CT (%pe)\n", ERR_PTR(err));
>> +	CT_DEAD(ct, NULL, SETUP);
>>   
>>   	return err;
>>   }
>> @@ -439,6 +497,19 @@ static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
>>   
>>   	if (cmd_len > h2g->info.space) {
>>   		h2g->info.head = desc_read(ct_to_xe(ct), h2g, head);
>> +
>> +		if (h2g->info.head > h2g->info.size) {
>> +			struct xe_device *xe = ct_to_xe(ct);
>> +			u32 desc_status = desc_read(xe, h2g, status);
>> +
>> +			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>> +
>> +			xe_gt_err(ct_to_gt(ct), "CT: invalid head offset %u >= %u)\n",
>> +				  h2g->info.head, h2g->info.size);
>> +			CT_DEAD(ct, h2g, H2G_HAS_ROOM);
>> +			return false;
>> +		}
>> +
>>   		h2g->info.space = CIRC_SPACE(h2g->info.tail, h2g->info.head,
>>   					     h2g->info.size) -
>>   				  h2g->info.resv_space;
>> @@ -490,8 +561,16 @@ static void __g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
>>   static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
>>   {
>>   	lockdep_assert_held(&ct->fast_lock);
>> -	xe_gt_assert(ct_to_gt(ct), ct->ctbs.g2h.info.space + g2h_len <=
>> -		     ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space);
>> +	if (ct->ctbs.g2h.info.space + g2h_len >
>> +	    ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space) {
>> +		xe_gt_err(ct_to_gt(ct), "Invalid G2H release: %d + %d vs %d - %d -> %d vs %d!\n",
>> +			  ct->ctbs.g2h.info.space, g2h_len,
>> +			  ct->ctbs.g2h.info.size, ct->ctbs.g2h.info.resv_space,
>> +			  ct->ctbs.g2h.info.space + g2h_len,
>> +			  ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space);
>> +		CT_DEAD(ct, &ct->ctbs.g2h, G2H_RELEASE);
>> +		return;
>> +	}
>>   
>>   	ct->ctbs.g2h.info.space += g2h_len;
>>   	--ct->g2h_outstanding;
>> @@ -517,12 +596,44 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>   	u32 full_len;
>>   	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&h2g->cmds,
>>   							 tail * sizeof(u32));
>> +	u32 desc_status;
>>   
>>   	full_len = len + GUC_CTB_HDR_LEN;
>>   
>>   	lockdep_assert_held(&ct->lock);
>>   	xe_gt_assert(gt, full_len <= GUC_CTB_MSG_MAX_LEN);
>> -	xe_gt_assert(gt, tail <= h2g->info.size);
>> +
>> +	desc_status = desc_read(xe, h2g, status);
>> +	if (desc_status) {
>> +		xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
>> +		goto corrupted;
>> +	}
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> likely you can use
>
> 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
>
> and use normal indent
One could. I guess these checks aren't directly related to the CT_DEAD 
dumping.

>
>> +{
>> +	u32 desc_tail = desc_read(xe, h2g, tail);
>> +	u32 desc_head = desc_read(xe, h2g, head);
>> +
>> +	if (tail != desc_tail) {
>> +		desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_MISMATCH);
>> +		xe_gt_err(gt, "CT write: tail was modified %u != %u\n", desc_tail, tail);
>> +		goto corrupted;
>> +	}
>> +
>> +	if (tail > h2g->info.size) {
>> +		desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>> +		xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n", tail, h2g->info.size);
>> +		goto corrupted;
>> +	}
>> +
>> +	if (desc_head >= h2g->info.size) {
>> +		desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>> +		xe_gt_err(gt, "CT write: invalid head offset %u >= %u)\n",
>> +			  desc_head, h2g->info.size);
>> +		goto corrupted;
>> +	}
>> +}
>> +#endif
>>   
>>   	/* Command will wrap, zero fill (NOPs), return and check credits again */
>>   	if (tail + full_len > h2g->info.size) {
>> @@ -575,6 +686,10 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>   			     desc_read(xe, h2g, head), h2g->info.tail);
>>   
>>   	return 0;
>> +
>> +corrupted:
>> +	CT_DEAD(ct, &ct->ctbs.h2g, H2G_WRITE);
>> +	return -EPIPE;
>>   }
>>   
>>   /*
>> @@ -685,7 +800,6 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>   			      struct g2h_fence *g2h_fence)
>>   {
>>   	struct xe_gt *gt = ct_to_gt(ct);
>> -	struct drm_printer p = xe_gt_info_printer(gt);
>>   	unsigned int sleep_period_ms = 1;
>>   	int ret;
>>   
>> @@ -738,8 +852,13 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>   			goto broken;
>>   #undef g2h_avail
>>   
>> -		if (dequeue_one_g2h(ct) < 0)
>> +		ret = dequeue_one_g2h(ct);
>> +		if (ret < 0) {
>> +			if (ret != -ECANCELED)
>> +				xe_gt_err(ct_to_gt(ct), "CTB receive failed (%pe)",
>> +					  ERR_PTR(ret));
>>   			goto broken;
>> +		}
>>   
>>   		goto try_again;
>>   	}
>> @@ -748,8 +867,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>   
>>   broken:
>>   	xe_gt_err(gt, "No forward process on H2G, reset required\n");
>> -	xe_guc_ct_print(ct, &p, true);
>> -	ct->ctbs.h2g.info.broken = true;
>> +	CT_DEAD(ct, &ct->ctbs.h2g, DEADLOCK);
>>   
>>   	return -EDEADLK;
>>   }
>> @@ -976,6 +1094,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>   		else
>>   			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
>>   				  type, fence);
>> +		CT_DEAD(ct, NULL, PARSE_G2H_RESPONSE);
>>   
>>   		return -EPROTO;
>>   	}
>> @@ -984,8 +1103,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>   	if (unlikely(!g2h_fence)) {
>>   		/* Don't tear down channel, as send could've timed out */
>>   		xe_gt_warn(gt, "G2H fence (%u) not found!\n", fence);
>> +		CT_DEAD(ct, NULL, PARSE_G2H_UNKNOWN);
>>   		g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
>> -		return 0;
>> +		return -EPROTO;
>>   	}
>>   
>>   	xe_gt_assert(gt, fence == g2h_fence->seqno);
>> @@ -1027,7 +1147,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>   	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
>>   		xe_gt_err(gt, "G2H channel broken on read, origin=%u, reset required\n",
>>   			  origin);
>> -		ct->ctbs.g2h.info.broken = true;
>> +		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_ORIGIN);
>>   
>>   		return -EPROTO;
>>   	}
>> @@ -1045,7 +1165,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>   	default:
>>   		xe_gt_err(gt, "G2H channel broken on read, type=%u, reset required\n",
>>   			  type);
>> -		ct->ctbs.g2h.info.broken = true;
>> +		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_TYPE);
>>   
>>   		ret = -EOPNOTSUPP;
>>   	}
>> @@ -1122,9 +1242,11 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>   		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
>>   	}
>>   
>> -	if (ret)
>> +	if (ret) {
>>   		xe_gt_err(gt, "G2H action 0x%04x failed (%pe)\n",
>>   			  action, ERR_PTR(ret));
>> +		CT_DEAD(ct, NULL, PROCESS_FAILED);
> I'm not sure this warrants triggering CT_DEAD
> or at least I just hope it wont trigger full GuC log dump into dmesg
> that would kill normal debug/bringup activities
Feel free to disable it locally if you are working on something that is 
likely to generate failed notification processing. But that is not 
something that should ever happen in a live system. So if CI hits one 
then we want to know how and why.

>
>> +	}
>>   
>>   	return 0;
>>   }
>> @@ -1134,7 +1256,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>   	struct xe_device *xe = ct_to_xe(ct);
>>   	struct xe_gt *gt = ct_to_gt(ct);
>>   	struct guc_ctb *g2h = &ct->ctbs.g2h;
>> -	u32 tail, head, len;
>> +	u32 tail, head, len, desc_status;
>>   	s32 avail;
>>   	u32 action;
>>   	u32 *hxg;
>> @@ -1153,6 +1275,52 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>   
>>   	xe_gt_assert(gt, xe_guc_ct_enabled(ct));
>>   
>> +	desc_status = desc_read(xe, g2h, status);
>> +	if (desc_status) {
>> +		if (desc_status & GUC_CTB_STATUS_DISABLED) {
>> +			/*
>> +			 * Potentially valid if a CLIENT_RESET request resulted in
>> +			 * contexts/engines being reset. But should never happen as
>> +			 * no contexts should be active when CLIENT_RESET is sent.
>> +			 */
>> +			xe_gt_err(gt, "CT read: unexpected G2H after GuC has stopped!\n");
>> +			desc_status &= ~GUC_CTB_STATUS_DISABLED;
>> +		}
>> +
>> +		if (desc_status) {
>> +			xe_gt_err(gt, "CT read: non-zero status: %u\n", desc_status);
>> +			goto corrupted;
>> +		}
>> +	}
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> again, use if() not #if
>
>> +{
>> +	u32 desc_tail = desc_read(xe, g2h, tail);
>> +	u32 desc_head = desc_read(xe, g2h, head);
>> +
>> +	if (g2h->info.head != desc_head) {
>> +		desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_MISMATCH);
>> +		xe_gt_err(gt, "CT read: head was modified %u != %u\n",
>> +			  desc_head, g2h->info.head);
>> +		goto corrupted;
>> +	}
>> +
>> +	if (g2h->info.head > g2h->info.size) {
>> +		desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>> +		xe_gt_err(gt, "CT read: head out of range: %u vs %u\n",
>> +			  g2h->info.head, g2h->info.size);
>> +		goto corrupted;
>> +	}
>> +
>> +	if (desc_tail >= g2h->info.size) {
>> +		desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>> +		xe_gt_err(gt, "CT read: invalid tail offset %u >= %u)\n",
>> +			  desc_tail, g2h->info.size);
>> +		goto corrupted;
>> +	}
>> +}
>> +#endif
>> +
>>   	/* Calculate DW available to read */
>>   	tail = desc_read(xe, g2h, tail);
>>   	avail = tail - g2h->info.head;
>> @@ -1169,9 +1337,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>   	if (len > avail) {
>>   		xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
>>   			  avail, len);
>> -		g2h->info.broken = true;
>> -
>> -		return -EPROTO;
>> +		goto corrupted;
>>   	}
>>   
>>   	head = (g2h->info.head + 1) % g2h->info.size;
>> @@ -1217,6 +1383,10 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>   			     g2h->info.head, tail);
>>   
>>   	return len;
>> +
>> +corrupted:
>> +	CT_DEAD(ct, &ct->ctbs.g2h, G2H_READ);
>> +	return -EPROTO;
>>   }
>>   
>>   static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>> @@ -1243,9 +1413,11 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>   		xe_gt_warn(gt, "NOT_POSSIBLE");
>>   	}
>>   
>> -	if (ret)
>> +	if (ret) {
>>   		xe_gt_err(gt, "G2H action 0x%04x failed (%pe)\n",
>>   			  action, ERR_PTR(ret));
>> +		CT_DEAD(ct, NULL, FAST_G2H);
>
>
>> +	}
>>   }
>>   
>>   /**
>> @@ -1305,7 +1477,6 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
>>   
>>   static void receive_g2h(struct xe_guc_ct *ct)
>>   {
>> -	struct xe_gt *gt = ct_to_gt(ct);
>>   	bool ongoing;
>>   	int ret;
>>   
>> @@ -1342,9 +1513,8 @@ static void receive_g2h(struct xe_guc_ct *ct)
>>   		mutex_unlock(&ct->lock);
>>   
>>   		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
>> -			struct drm_printer p = xe_gt_info_printer(gt);
>> -
>> -			xe_guc_ct_print(ct, &p, false);
>> +			xe_gt_err(ct_to_gt(ct), "CT dequeue failed: %d", ret);
>> +			CT_DEAD(ct, NULL, G2H_RECV);
>>   			kick_reset(ct);
>>   		}
>>   	} while (ret == 1);
>> @@ -1374,7 +1544,7 @@ static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
>>   				       atomic ? GFP_ATOMIC : GFP_KERNEL);
>>   
>>   	if (!snapshot->cmds) {
>> -		drm_err(&xe->drm, "Skipping CTB commands snapshot. Only CTB info will be available.\n");
>> +		drm_err(&xe->drm, "Skipping CTB commands snapshot. Only CT info will be available.\n");
>>   		return;
>>   	}
>>   
>> @@ -1532,3 +1702,48 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic)
>>   	xe_guc_ct_snapshot_print(snapshot, p);
>>   	xe_guc_ct_snapshot_free(snapshot);
>>   }
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +static void ct_dead_print(struct xe_dead_ct *dead)
>> +{
>> +	struct xe_guc_ct *ct = container_of(dead, struct xe_guc_ct, dead);
>> +	struct xe_gt *gt = ct_to_gt(ct);
>> +	static int g_count;
>> +	struct drm_printer ip = xe_gt_info_printer(gt);
>> +	struct drm_printer lp = drm_line_printer(&ip, "Capture", ++g_count);
>> +
>> +	if (!dead->reason) {
>> +		xe_gt_err(gt, "CTB is dead for no reason!?\n");
>> +		return;
>> +	}
>> +
>> +	drm_printf(&lp, "CTB is dead - reason=0x%X\n", dead->reason);
>> +
>> +	xe_guc_log_snapshot_print(ct_to_xe(ct), dead->snapshot_log, &lp, false);
>> +	xe_guc_ct_snapshot_print(dead->snapshot_ct, &lp);
>> +
>> +	drm_printf(&lp, "Done.\n");
>> +}
>> +
>> +static void ct_dead_worker_func(struct work_struct *w)
>> +{
>> +	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, dead.worker);
>> +
>> +	if (!ct->dead.reported) {
>> +		ct->dead.reported = true;
>> +		ct_dead_print(&ct->dead);
>> +	}
>> +
>> +	spin_lock_irq(&ct->dead.lock);
>> +
>> +	xe_guc_log_snapshot_free(ct->dead.snapshot_log);
>> +	xe_guc_ct_snapshot_free(ct->dead.snapshot_ct);
>> +
>> +	if (ct->dead.reason & CT_DEAD_RESET) {
>> +		ct->dead.reason = CT_DEAD_ALIVE;
>> +		ct->dead.reported = false;
>> +	}
>> +
>> +	spin_unlock_irq(&ct->dead.lock);
>> +}
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
>> index 761cb9031298..db1d45b7be2b 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
>> @@ -86,6 +86,24 @@ enum xe_guc_ct_state {
>>   	XE_GUC_CT_STATE_ENABLED,
>>   };
>>   
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +/** struct xe_dead_ct - Information for debugging a dead CT */
>> +struct xe_dead_ct {
>> +	/** @lock: protects memory allocation/free operations, and @reason updates */
>> +	spinlock_t lock;
>> +	/** @reason: bit mask of CT_DEAD_* reason codes */
>> +	int reason;
> if it's bitmask then likely you want unsigned int (or long)
Yup. No need for long, there aren't that many bits defined yet.

John.

>
>> +	/** @reported: for preventing multiple dumps per error sequence */
>> +	bool reported;
>> +	/** @worker: worker thread to get out of interrupt context before dumping */
>> +	struct work_struct worker;
>> +	/** snapshot_ct: copy of CT state and CTB content at point of error */
>> +	struct xe_guc_ct_snapshot *snapshot_ct;
>> +	/** snapshot_log: copy of GuC log at point of error */
>> +	struct xe_guc_log_snapshot *snapshot_log;
>> +};
>> +#endif
>> +
>>   /**
>>    * struct xe_guc_ct - GuC command transport (CT) layer
>>    *
>> @@ -128,6 +146,10 @@ struct xe_guc_ct {
>>   	u32 msg[GUC_CTB_MSG_MAX_LEN];
>>   	/** @fast_msg: Message buffer */
>>   	u32 fast_msg[GUC_CTB_MSG_MAX_LEN];
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +	struct xe_dead_ct dead;
>> +#endif
>>   };
>>   
>>   #endif

