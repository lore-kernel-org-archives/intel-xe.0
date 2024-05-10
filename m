Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBFFC25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 04:24:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD88F10E027;
	Fri, 10 May 2024 04:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mFXWWoeK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C59A10E027
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 04:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715315041; x=1746851041;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pCgOaFO/+mhzrym0b8+2dwEAIEm8p4qQMAm2QcOu74M=;
 b=mFXWWoeKKDqTkofaOgIeRqjDgBE0Wb/dB1YDwFfT2z282MqxXbyoUVUe
 SUYfk3pxMu3Gx+37VmeT+Z8nVMdBdZfwW9ibeDQOBJdRMc85LjSE2xCsm
 05iaT+nBwHMo39WkHJyBl1z2GE2+fp7O0hc4i2d8bFPU+dsdIHqIm3Tux
 mMAnimq5vIrE+NdNUh1TDMoYiZcqIAQc/tuTzmhK7DZ5OtiYNimUbl/YJ
 l0LNron0uipM4hMNfkliuGqNrwlcRHeGQmJNdUU9Gsre7XZjbiLnGgCCA
 l0YmEjxqkWgcyaXm96Dct3VpR+51cR99JuLJRG1UVD+698IH2+W2uSfAv w==;
X-CSE-ConnectionGUID: sYXZO4stS2KT8Asto9Aiow==
X-CSE-MsgGUID: FtzAoTpvTC2yfNPJmHLMLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="28761109"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="28761109"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 21:24:00 -0700
X-CSE-ConnectionGUID: 4QldXoEPRd282eZc8ftWSg==
X-CSE-MsgGUID: cqW+5+8xQUmLE+eU+YW/5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="29585101"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 21:24:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 21:23:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 21:23:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 21:23:58 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 21:23:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVm6UgQfnK5MWdArAB27PkXYxiJ1Kd1stQJG7htStflAFfm207JV/bq3GvoRmNKY3JOheAxj9+SGRzDoRsUp6wIqNzRnbAhnXYsLhs0hr/LHf8JGhfo4nrsKMaxboWlP4RgNzBok3Uk5HOs84S85LOUEG8bvF/OeVuWMathuL8CWZhX09EE/+RMZtqcr7NgWiMedhmL4sLiBqM/bOVQvKo/dQZoXetErOvXmE7ZpHZ3AjZXWnMxjXFDAKRIo0duvwTTjNA5bujQcDN1jVO27eRdbxE7enU8zUl62fsZVz7r21QMSV0t68NS3YByC7SGqyV/7+pe6i81V7XmdSngoxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7pdlPN2sQz8RTBPuqmLoyAd4ZJAAXqSjJydn4QRWSB8=;
 b=PrpcY3ayjZ6yQ24UKkNesT6DmP+ZKXehsRQlPz+8gwJ8YFex6WMUTdg2volBmrCtD7ChL/YZJrVP0FCusmB9DpEDL0DZ7h1Pv9Qe+BpzGVpcr4dVLfvfEAuWB5A62HDqV655Oa3p6jD7WqaNySkIlVxWF2NH79kPMIynlCdUzh/Qqli2FiweBrZuHG/cRekYrrzk8pQF2PytsNOCNviQpCk7TB87bcC7a4DhGhzqrJinE7TgDW0AhzR+SbbefKTbjhx41sTQ03ZbID+QplbJyiX0Z+Q7fIY3sc+b0Q35icTL4w64JXexu0L46VES+GE7jVe+oc9sl//Fh7ucasZmbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH7PR11MB7570.namprd11.prod.outlook.com (2603:10b6:510:27a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Fri, 10 May
 2024 04:23:56 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7544.048; Fri, 10 May 2024
 04:23:56 +0000
Message-ID: <79b43f41-6d16-44c9-b304-ef0fbd77c2d2@intel.com>
Date: Fri, 10 May 2024 09:53:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/xe: Stop checking for power_lost on D3Cold
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Anshuman Gupta <anshuman.gupta@intel.com>
References: <20240509191657.504300-1-rodrigo.vivi@intel.com>
 <20240509191657.504300-6-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240509191657.504300-6-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::7) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH7PR11MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fc42004-4054-4c14-8c02-08dc70a901bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZldURHY0Qit3S0swdW40VVRZK1I5dmdFd01rcjcyeC9LSmhWQXhnU1R6UFl0?=
 =?utf-8?B?RUZSb2d0QjdhSFFmbitESzJMcDkrWXNTY1VFclRrZWR6aEtjU1ZDS04wanJC?=
 =?utf-8?B?eit3WnhFWFNKMDFSbnlEcTN1a1JsaFhsc2J2Tk8rVG9UTThaamlCanBoZHJX?=
 =?utf-8?B?cjh2SDl5a0g3WXJ0VDBZRlZiL01CWFptZ0RET2lRaXkvQ2Z4MERFVXNDcVh2?=
 =?utf-8?B?aUxubVFKd1pjVnRHTTAxK0l5RlEvSVZkMDZMbTlNYXhTUkRiVlpNSmlVMHNm?=
 =?utf-8?B?NnR0aXdveTJOaEJIdk1sR0UrMmRSTU9WclAvOUVXdzF1Z29MZ3d1NXVNN1Mv?=
 =?utf-8?B?WDNtNmlhemRWSHZia3JUMFZMd2RuNCt4SG5vb0paRkdWRms2dGJCNjhUQjFC?=
 =?utf-8?B?eFUwUEhOb1pBVk1wVkNkMnlQZ2xTSWVmREtXY2VIRnRuekp4aFZLbDcxMEJt?=
 =?utf-8?B?QStjMHFUUHlVR1ZPTGxTRzJ1UFN5UWhVa2d4dGdrVFIvS0F2RllGdDJEWklX?=
 =?utf-8?B?Ym5GM0dyc0l5MDdvTkxmUnJWN250UTRCRThzcUJXWVF0M2J2V3lubFRyMmgz?=
 =?utf-8?B?V0t0YU40Ri96MmRXM0ZmeWd6bzR0QVVPWllNZmlJcnJ2MkFOOE1tT0hHUG05?=
 =?utf-8?B?TDE5dkwvUWVReERHaGtCZ1p5eVBTakJmdTV3bnFZMVc2RXp2djU2M0NrVk5U?=
 =?utf-8?B?ZGMvd2FwUEFNazc4T3ovV3RvTlJBL2JSbnUwcHdiYWRpMmRUMHc4MWZ3QS8v?=
 =?utf-8?B?QmFYc3lvbGc0UkxuckRBQXA2bUxGb3dtdkNjckF0a2tURk1oSVlrZ3NZalVC?=
 =?utf-8?B?NkhHN01JZjE1L0RuazFCTEl6NkFBYmx0MFZtd1lSTm5ZU1lnVVNaemRadFpM?=
 =?utf-8?B?SVFXRlZZOVJSNkFOUE8zY3F2U29NOFp2cFhlMzN1bkc0ZW56WFBQclVPWGdM?=
 =?utf-8?B?SmN6Mys1aVZyUXNia3htTXlpMzg0N1BjYXR0RHI4MUgxSTdBdm5xU3lzSlAr?=
 =?utf-8?B?aDBnNEFtaVppeTQwa1BobVcrKzE2VlBMcHFwbHZSWmRlSVo2ODNuVjVrOTBk?=
 =?utf-8?B?cHhFcm84NUcyQ2hTVjRFOGhTai8vVkRhNG11MENlU0VsUkpwWlJQM3F1U3BV?=
 =?utf-8?B?eW5ENlg5MlNmUDZGOU4wVmlwTDZvVWlUUXova2VUTm9xdVRCNkZ6R0t3WDh3?=
 =?utf-8?B?cWZobzFFZlpVcy8zMC9hMllwbkMrdDMzbTFUdlg0Z25CenFwTlQwckNrZjhE?=
 =?utf-8?B?UVVINzhxdlh5enJ4S21YeHk2d2JSZlNyUGdKVE11OHhEblBycGY4SXFZL1BX?=
 =?utf-8?B?cGU4WXpGRlBJQThGdUJ4ckgzMndLbnQrYUpKTjhRbVdHQVdOa2pML0MvYnNx?=
 =?utf-8?B?NVpjeGV6Z2duTVJBTFczd2RvOG5KWmRabm5LRzdJejhxU2hVRGg3NTh5ZHln?=
 =?utf-8?B?WlBadjVIeEVPKzkyUm1LZjVZQUxIVy9WSStGYzVmMjlweHREWjYxekt3elhV?=
 =?utf-8?B?enpLTWdXb2VaNmd4a2UrakQ5bUNRWDRhOTR3bXh0RDdPTVBGT2JmT3ZrTTdZ?=
 =?utf-8?B?Sm5aMkdOUzE2aVFiTFhJRUNSVmRvR1EvbGJEVFVEYlk0UkNDa2N3V28xUUMv?=
 =?utf-8?B?dm1VMnNKSFlFa1pMY1NiT0tNWGNVWXdDUzFjNjJwWnREZTdYQ2d2YkxLUWpF?=
 =?utf-8?B?U3B3VVY4VjFleUFPRXp4TzFhM2NJRnpKRzhQVmlDU3VxSVRpZHlJS3dnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWdHamhoZUtvZHl3RGVMVm9NYlNzeXhSVUpYMFZFdUR1NndzNFE4RVROQWZH?=
 =?utf-8?B?YWtxeUN4N28yU2x3cGtneWpGaWRmWWwrOVJ3QkFJdlVaN3U2OXlnZ0pzWVBL?=
 =?utf-8?B?UmhNVlhwTThueUdJTTFoeWhjeFVzS0FUbUFDdEZjY1paYUcxRVJZc28wOFpO?=
 =?utf-8?B?OTE5dkpjb0JTc0ZKcjlNVlFBdmU4YjhnQURzKzNURjdKdzh2NmJyQ0QzaWUz?=
 =?utf-8?B?Z0tUMjQrbnE1Uld3WUs2SHBkMVRCUWRaZVREa1dxbGF3ZjIvbFN3dnlUWFNi?=
 =?utf-8?B?M1cwMjZpUTJoWCt2VldRZWQwQTRvSGtzc21VM1ppTGlzN1ppRmpPdEJPSHBF?=
 =?utf-8?B?Y3NwM3B2aVV4SjBnRWtFbzlFaVlRL3laaWZMOXVCWDU2Q3liSjZqSWE2YjBH?=
 =?utf-8?B?U3hPOW1rYmJ5Z2Zldkl3NFdQcXhLaDN3ejk4UzhWYXBwSmdERVVpVHovZVBF?=
 =?utf-8?B?QXNQazRieTBnQWQ5VGo5WEt3dzZwcFRhRlczaWRUbk4rZ1ZmcVlCRVkyQzVW?=
 =?utf-8?B?TVk2bGppWkpmZjB0VGtWUkFkWUZxbHlSaGpRMEZUcmNHTUVYS1V2WU53THRP?=
 =?utf-8?B?aWFrVlpBT0pEejVWTjFKNDVtUWVtN29wL1FUeU9vYmo5M0puaDlidUJQaEtY?=
 =?utf-8?B?Vm4yemVtcnhQdVdZdUkzeENjb2xPN21NdEUrMElYb3pSVzQxTnhuQkN2S3d6?=
 =?utf-8?B?RmxKRG5DcHRoK1ZZSGNxblh1eXBuVUJHY3VhWUtjbExYOUlZeXdZN0MwVVUw?=
 =?utf-8?B?c21sVHl6ZDVReEZobGt0R3VHUTlLNDVQb215aFN2RHlQb0xVbEF3bkZWL1g3?=
 =?utf-8?B?eUVvZCtUUTRpd2E1WmgwamYxTEZnQ1NTaENNL09ITW8xQU9JU3Q0a256TU1R?=
 =?utf-8?B?NkJoMnZCQUMvRXdJNTV1UmpwODlSZnRlUUtxdlRDQjJrTlBFdU9YdWxsRGtx?=
 =?utf-8?B?MTgxZXNIU0tld1ZiT1NCdDNGdytIRkgwanRuT05BVTE4bUkzcHpYcFdRcUZQ?=
 =?utf-8?B?V1dwbS9Id01Nd0lOVnlscnhJeTVzSEcrMzdsRkV0TUJrSWhKT0IzaE9PcFJp?=
 =?utf-8?B?SDRicFIvL2NrSXgzSnduNWlWT3BJVXRwR1A2QXhwVnlzNWxlQ2J6YWU0V2NR?=
 =?utf-8?B?WDROM0JnOFNZV2tqMGIyYThza0V1Q3cvQUZ3bExBRE1Xb1ZGS1dlbEo3QU05?=
 =?utf-8?B?eU9NSTU0RW9zMnBUOSt0WmdDMXB5d3hFNTBYWWtPSStBZ05QVnE3MVd5MVQx?=
 =?utf-8?B?UlRhWDNCRi9TUjdxajdSZ0JJOVpjdkJNTElCeXpRbVROM1BuTTd6aThsVEk1?=
 =?utf-8?B?S2t6cHEzMC9UUWxVU0ZRQXUwQlpobWladVpmTDc0VEVISWQxWWpuQWoxUEZj?=
 =?utf-8?B?eGd0YUhoYWNHUVpiYkVkWnJESWlBVjJ6emw1ZHE2WnV0L0Fja2w4Z0dhUEkx?=
 =?utf-8?B?cTcrWUY1KzNPZVYzSVNMTFIwR1lxcXlYZG96U2NWL3YvN1B5TWpkcDBZc1py?=
 =?utf-8?B?N3BZM242Vkx5T2kyeHBVb094SUF3Q3BkTFlQVG8zYjV5VVdETUM5NzN0bStz?=
 =?utf-8?B?WTNmMk5Ec1lJTHVuQ0ZGNmVBUVVGNnBwUmhma1E0UXBPK3IrcHBjblpNNDM1?=
 =?utf-8?B?QnNMSExaV3pyUzgzL1RNR1p1VHozRU5HRHZBSHVVc0xoTzMvYXlvZmtSYVc0?=
 =?utf-8?B?R2szTk0zZzJCZG5vR2ZtaVFaeXhnZmN3U29kNncxSU4xTStNTkFXL0tVT3ds?=
 =?utf-8?B?a0E1YUtwcWJNcTJDSkJIWndaMlNmWTJacFQra1hoRXg4aURIOGwzdzcvTFNW?=
 =?utf-8?B?SktyQzVoZDVkaHpFRTJvU25tUEF2dXZKRUpZZWwzKzA2akFROXNmUXNWNnUy?=
 =?utf-8?B?S25KVWdWSytRWno2UHZKangwdDdDQlFlcS9ReVpRNlNwWmV2cGpiYS9TNmli?=
 =?utf-8?B?ZlRqdlZ2TFg2UGZzSXFWTG9TcXU3cThoWksvNUlGeE1tbjRNWUQyVnA5NWRG?=
 =?utf-8?B?bm9mQUlYUDZiMndaVi9oVGltQXd6NzQ3RERzOE9kWXlIWW1ZQk50TjZPcWY3?=
 =?utf-8?B?UVdZbkIrWVpIdkdhOHh6YUN6dDFPTjZLdERsUTdSbWFEd1RFV0p0UlJnMGdC?=
 =?utf-8?B?ZzN0MHJIMVNpM2x3U01EYkh5MVU1ZVk1NFBHTjFUaHlSWWtpNEZlQVFtbjNS?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc42004-4054-4c14-8c02-08dc70a901bd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 04:23:56.3788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fRpxzgJ8PnvsO3/diSh9cREIOb5Fd2N+XBez2HrPEYtNcmckHTQyN+4fCMuaxnQrah4wKcPDbbHlKU96kE94cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7570
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



On 10-05-2024 00:46, Rodrigo Vivi wrote:
> GuC reset status is not reliable for this purpose and it is
> once in a while ending up in a situation of D3Cold, where
> power_reset is false and without the proper memory restoration
> the GuC reload and Display will fail to come back from D3Cold.
> 
> So, let's do a full restoration of everything if we have a risk
> of losing power, without further optimizations.
> 
> v2: also remove the gut_in_reset function (Anshuman)
> 
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h |  3 ---
>   drivers/gpu/drm/xe/xe_guc.c          | 27 ---------------------------
>   drivers/gpu/drm/xe/xe_guc.h          |  1 -
>   drivers/gpu/drm/xe/xe_pm.c           | 12 ++----------
>   4 files changed, 2 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 906b98fb973b..471c848b2638 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -431,9 +431,6 @@ struct xe_device {
>   		/** @d3cold.allowed: Indicates if d3cold is a valid device state */
>   		bool allowed;
>   
> -		/** @d3cold.power_lost: Indicates if card has really lost power. */
> -		bool power_lost;
> -
>   		/**
>   		 * @d3cold.vram_threshold:
>   		 *
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 0c9938e0ab8c..7860b720a99c 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -938,30 +938,3 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>   	xe_guc_ct_print(&guc->ct, p, false);
>   	xe_guc_submit_print(guc, p);
>   }
> -
> -/**
> - * xe_guc_in_reset() - Detect if GuC MIA is in reset.
> - * @guc: The GuC object
> - *
> - * This function detects runtime resume from d3cold by leveraging
> - * GUC_STATUS, GUC doesn't get reset during d3hot,
> - * it strictly to be called from RPM resume handler.
> - *
> - * Return: true if failed to get forcewake or GuC MIA is in Reset,
> - * otherwise false.
> - */
> -bool xe_guc_in_reset(struct xe_guc *guc)
> -{
> -	struct xe_gt *gt = guc_to_gt(guc);
> -	u32 status;
> -	int err;
> -
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> -		return true;
> -
> -	status = xe_mmio_read32(gt, GUC_STATUS);
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -
> -	return  status & GS_MIA_IN_RESET;
> -}
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index a3c92b74a3d5..af59c9545753 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -37,7 +37,6 @@ void xe_guc_reset_wait(struct xe_guc *guc);
>   void xe_guc_stop_prepare(struct xe_guc *guc);
>   void xe_guc_stop(struct xe_guc *guc);
>   int xe_guc_start(struct xe_guc *guc);
> -bool xe_guc_in_reset(struct xe_guc *guc);
>   
>   static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index a2f5a1b11cbf..de3b5df65e48 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -404,15 +404,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   
>   	lock_map_acquire(&xe_pm_runtime_lockdep_map);
>   
> -	/*
> -	 * It can be possible that xe has allowed d3cold but other pcie devices
> -	 * in gfx card soc would have blocked d3cold, therefore card has not
> -	 * really lost power. Detecting primary Gt power is sufficient.
> -	 */
> -	gt = xe_device_get_gt(xe, 0);
> -	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
> -
> -	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
> +	if (xe->d3cold.allowed) {
>   		err = xe_pcode_ready(xe, true);
>   		if (err)
>   			goto out;
> @@ -433,7 +425,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   	for_each_gt(gt, xe, id)
>   		xe_gt_resume(gt);
>   
> -	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
> +	if (xe->d3cold.allowed) {
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>   		xe_display_pm_resume(xe, true);
>   		err = xe_bo_restore_user(xe);
>   		if (err)
