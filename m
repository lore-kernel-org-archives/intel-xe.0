Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A046CF9C6F
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 17:10:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D7D10E0EE;
	Mon, 23 Sep 2024 17:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OoyCbh+c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D30210E0EE
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 17:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727111424; x=1758647424;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SjFObkyTfhj+n1tqBXNi89nkZ90YTEHEiNMJYEu6Uqc=;
 b=OoyCbh+cWV6z+OzUXV48ZwqvycIP8LzkZPyA5UDiBFRFuEqanMQhAg45
 k70EjX4fCQd4HM2BL/Ghg2cY+HFRlWLgOo8RyfDx70mZ8qGurx0i/0ULd
 erJO3l5IkOXY7cWb6L9YyaUjIXFC8+Bnpsa66SwQEPUPkYTetpO5vLpFj
 BJ/UXafOx1fImgLnNpPRolcC4ReZHE6YVPuRXfrsCywh5eNeFqchRdxTI
 8UNWJbXtbCITG/8qDeN+dvJMp/qj61GT+ad2aBHvmJMlSklDz6bK7qFMO
 rkkHEAR/2eI9C9JAN3M4sHmf/TBXgsyr7Vr4P+v0ozPXmXioFef00M94G Q==;
X-CSE-ConnectionGUID: INz3ctxHQlGiGtYvJ7MXKA==
X-CSE-MsgGUID: 4d0lyh5hSSe5oLnih2s+XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26262705"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="26262705"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 10:09:58 -0700
X-CSE-ConnectionGUID: GBFE30HbTEK0zyT55O2YzA==
X-CSE-MsgGUID: E3vhybe+QKOXJzveLXgI2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="71276182"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Sep 2024 10:09:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 10:09:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 10:09:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 10:09:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DfDsai3UzHJfRQGUDcot5YLygduDjTvhG9+sDLCCY9fEvbFcvLSIZCIBFGnf7F7LCVmgVBdqb0tipvVQFp+mesr/JID1979SN9SSB1F/cCwYgg6r7oSeBvqfWyPcRZCeoWsuxRc3BtbEI54m/r6FA0qXIuUPJSo7uTS6J0omevI5wrxL1I373FJXYN1Pr2GGDVkuzECAFlFcr9xtEHBRyE3ClhJyq9rU+qINpvaWTBk3nYe9v5B3fIaObHc8FHa0+Zlr9dwfKPeo9o5jFTqWCPUY1aKzzeXAKRRfi1a9rQQxpHG0/YLXrJbQh8wsgkfuQzPYe2aG2wprBo9MMyKFdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hM8OIzCEVZuzdwFop2/gXpgkxgy828L5QzlDP8Mhkvs=;
 b=Ao09Kr6yDJ5CbdPFo3FVjG5pKX2anUAtrpL5eciAWLR2FeqJy0cpaFJ5yj93/bfIu4kemvyqq53q2cs0+5SwuDP9aZ6E83eGVPpGRe+zZK0EVnXO+GKzhzvQ4T+q1gKSCtHknST7xAAGLk4UqgedZdHvUW/hjKtXk8BRyWvXtFnA+yxKsuwYRdloxOBwe24hlNOVmgPEl6yZWt2aJcVyVtNHHG8JrkXvpukn6iG+DagBhb+98y5lN//8MAwVhYWJyvT1w0NBMCYjum1ktvjZMOEjpEtezRqIYSiRJokIHtdTBZ6RT17+sL88YlsiS0WktJ39cThwbH2RX46Wg9PYYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MW6PR11MB8309.namprd11.prod.outlook.com (2603:10b6:303:24c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 17:09:55 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 17:09:55 +0000
Message-ID: <2b123a01-0680-4915-82e8-16312c0403f8@intel.com>
Date: Mon, 23 Sep 2024 10:09:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [CI 12/12] [For CI] Debug prints/logs to debug G2H timeout issue
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>
References: <20240920142922.618649-1-badal.nilawar@intel.com>
 <20240920142922.618649-13-badal.nilawar@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240920142922.618649-13-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0112.namprd04.prod.outlook.com
 (2603:10b6:303:83::27) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MW6PR11MB8309:EE_
X-MS-Office365-Filtering-Correlation-Id: 27974a91-7a3c-4ac2-3f5a-08dcdbf28b5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S053ZWp0RkdEZVFoMkZqY1pTcTFUTUpmQTFBem15VjNEOXZnWTVlK1d3OWVp?=
 =?utf-8?B?NnRKNk1JUEhPc2NHWEtiRE44SktLTzhzV3ZFQnJlZTZaQmZCdThXcWVFQXMy?=
 =?utf-8?B?Yy9UWFF2ZG9aY3RiUXhFYUV5YjlxdG5rNmROOUVIVk8vYmVqcUxWVC9yYkxW?=
 =?utf-8?B?T21sMktsRThGRzVkSzhpUlNwUE1lRE4ySmJCRlhCRDZkcHdkQXdycFVxQWVa?=
 =?utf-8?B?aEk0OUYyMHIweTRwUFFUQXlVMWZoTyt0Wjc0RDY2U3RKMWRPVjdTOE9rRmNM?=
 =?utf-8?B?Zm9USThDOSthUzBJdHk3amRQS3NGSGw4MkQzTlI4TzdYQ3E4WlhDdDUvc1BU?=
 =?utf-8?B?UnM0VW1CaXVsM1QrenZoVkhaUnF0d003czcxT0NuV1pMcDJrZkdYNFpHRHNy?=
 =?utf-8?B?MHJPQkk5NldoV3plKzdiOHgyM1dxQ3JaSzNnaUZ4cjd4MnZlZU9UcVBpc2ND?=
 =?utf-8?B?OHdheS9HYm5TdW9INlYySStOcnFZSlFNbnA2djFxQ3BTMlIvL0tSVlRSQ1BC?=
 =?utf-8?B?Y0ZoYmlBdDNuYnVDUVVHTUFzL044YlczQTgycXhFV3lCNzFzVUg2ODNHL24w?=
 =?utf-8?B?aDdhZloxbmQ2eUcwdStzeHhkZVdjMzlHZTcxVlRQbGgvOURDTnI4eGVaYXli?=
 =?utf-8?B?bTlGNHNZbWl5RWIyRHduN1p2bGVpZmorMFdjMmlSRklQYWI5dUVITmprU1hB?=
 =?utf-8?B?MnQxMEk5UzVtSWo3NWlPdCtYbmhXZk5Yd1RibU5TbDJVS0VuUDVweHZYK0VS?=
 =?utf-8?B?M2s4aHlmcHRHNi9EVWRrbm04dUJ6aU9GNWl0dGlONGJpUzZDSmRhZm80RHJL?=
 =?utf-8?B?RDk5am9zenpORXkxMlYzV1U0VmZpeU40a1VqY05MLzAzdjlVUWR5ZFZwZnE0?=
 =?utf-8?B?b1NFdUtQOTVaajZnUWJkdWdLUUlCeVJWZWJCcWVBUngyK2Nzc2NGUUgvZUVP?=
 =?utf-8?B?U2RaK2s5aVdXYndYS01GUlk0d2dHWXYwd3RBU1RhN2p4LzdRZWpsSW9IbmJH?=
 =?utf-8?B?bkd5Y0NzN3hPMTduOEZRYlR5dE9oWVExVWRnRHBMeUFRSEk1Zy9IZThCSUhs?=
 =?utf-8?B?UE0zaWpoZy9NM3Voc0xaU1ZxMk9oZjlYMy9TRWtFTkpqTW05d0VoaE10MWNV?=
 =?utf-8?B?YSs2NGtDTVJKeFRidmFpZUVxQUZEZVZqQWdxRDd6b0o3YzVIbSt6WXA3MUxI?=
 =?utf-8?B?NlQ5d2Z2b1IyQ3p1ZjUvV2ZOd3htVGlRYWNlVG9rOUJyWGFwcFZOMnhIdUhD?=
 =?utf-8?B?OHRtYW5Xa3ova2ZjNnp4b1BHSmh3cEhiQ0lBSTU3UHpGK0pjMzA3MUlieFV2?=
 =?utf-8?B?dzAxS3ZxbHZ2VlNmVTA3V3NiN0VodCt6UGRqN1YzbVdjeUFSS3ZNdGhrNmd6?=
 =?utf-8?B?dCs5K3RYZnp6WEx6dndlL2tVem5jM0R2Rkpyak5qTmdnVDIzOG16TEYrYXA5?=
 =?utf-8?B?MkQxL2V0MnljLzdyaTArWi9tZ3FuVGtUZVd4eW5aUW1EVDNaeTVlcnUxVTdT?=
 =?utf-8?B?M29ITlZrVkFPaDdYV1N0MXE3blNGemRieUp6ZXlxRmE3RjNZT2tpWWpRTWEv?=
 =?utf-8?B?ZkdqVmtKS1RZQThpNUx4c1doVlJtTkU3bU12SndLN0ZyVzRSaG9sSncwSUdo?=
 =?utf-8?B?aUl5ZWw5N1U2bDc0QUJvVFQ3Q2hkZkJOYjE1SWZMbHcrblVQMStEak00WW9y?=
 =?utf-8?B?SDJkV001NVM3UENGbzJXbWZ0UVFIWElPVS93VXBmS1JianZVNjVBcjBycnVX?=
 =?utf-8?B?VzU4aDN5b0lZRnF6eEdHRmp5N1Z0SnZmM2thZUlXN2tZemVNdGhUdXVxbUN2?=
 =?utf-8?B?aG9uOVBPVi90VTJlMWh2QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXozTG5uQkVjQThRVWlFNFIyWVlIM1Vtc3dNZTJvczJLd1lDMTdTNXFpSVNo?=
 =?utf-8?B?cnQ4VVNSYStvWDlhMHI2VTlRRU0wNnl2UEZsaXYzOFhxYmliVGUrY2d6N1hz?=
 =?utf-8?B?V0UxNnFidCt0OUVZNkdXZHBjQUlBTTJoYmR4WHdncVJSbDFLZFNLdHp1dGpT?=
 =?utf-8?B?dFhFMjlxOENFZ2xjemE2aGZ4QkpPNDFhaGo1SW1IVkllSkg0UDkrMEQwNGtV?=
 =?utf-8?B?VHAzR1Z3elk5Lzl1bk10ZnRIajlNVzlGQk93enJYbElPR3RqOThPSGd1c0dm?=
 =?utf-8?B?Z0hkMDlrUWEwQzdKNFBYaDMrNE12a3lZVEhZdE9iMEtmcENsVERVRS8vaGww?=
 =?utf-8?B?aGZrcWUzN2VmYnhWK003Und4OVBVczVmZjR0TWp2K3NSdFpUclBVZEtiLzdq?=
 =?utf-8?B?S0NsWGFBenU1QUNwNVVaRDlSQ0tVNXQzT3lYK3pBT0NpQ2RqZVE0ZWsvWmM3?=
 =?utf-8?B?V1FMRzdKaGZRNkhVekw2ajFtblRiU1R1c0g2S1FhcFhEc1pvNlFjOS9hMkU0?=
 =?utf-8?B?bWVwTUtqUGwvb3FBalZCeXZGaFUrUDVWQ2xQeExmVVRoVjRyMGYyUFQrRlhC?=
 =?utf-8?B?VXM2UHVobExtM3JuQlU3aGF0V1M0dktVWjZHZDIrNERWZFAxSEhneFRHVWhM?=
 =?utf-8?B?VVM2QTEvUmNCWlZHUnRHZWxCWFl3dlRCUHBFaXBESnF5MmhXc3h5RlNtWm9J?=
 =?utf-8?B?QkJDWmxoMlRrOTlmTWFpVFVyN2NjYzFlbVlHcVJ3QXNkMjZHaG9YQnRnclEv?=
 =?utf-8?B?a0JNL0xMeXRXYUNXeEVVbm9zSVAwT2pGWHpya2NuMmM0TTdzRi9GcUo5eTFl?=
 =?utf-8?B?bXRoeEJ3aXREMWlJc1hnRkY4ck9wMUR4T2NuSkIwMmRtR2tJYzAyN0lZcXpQ?=
 =?utf-8?B?UHJTa29pbjltTytjSEFlWEhzYVliMHZwRWV2aWFMejdHMlJUWVBFazBRVzMv?=
 =?utf-8?B?WTJHcy9Nb0J0eWd6ODU3Zlg1M1pFcnBFdktBL25vdnFsZ3RHVlo1VEQ1bDgy?=
 =?utf-8?B?Y2dZNHQ0a3dxeFBVRngyS290WkhJWjNkZDdhd2pQcXpYdU9QVWVRQlRQMXdz?=
 =?utf-8?B?UXJKb3AvbFVBaEVPR2pRNlozQi9YeklVTGZzdUZBaHVVV1BaUlVjaytIbGlL?=
 =?utf-8?B?SE5JRTRLM1pqVkw1Y3MrWDkwZlRjaDhUWXBmai9zS0pONUZTaFB1TWp3cDFS?=
 =?utf-8?B?UXBFV3NlTm1oNlZzdkJkZjdpNGJ0WHNMM3E0SzJYQXdYY3VzbXd0ZnJoNVQ0?=
 =?utf-8?B?Z2xsRFkwQ0ZMYkpDdnlSUEFTRzRoZTVDbHpTbmhTTGNqczA3ditNU05Ha1FC?=
 =?utf-8?B?RXdzbGtSVFBYMTRkMVNxbzFSWk9GT3dEVzJTYTBVVFU1K3lScG9rbzlSZ3dZ?=
 =?utf-8?B?cXROcWQ5NFkyWjQzSVpyWGhKN0hpOHkwUFNQVmE2WC8zTm1OT3UrMnhjaXJJ?=
 =?utf-8?B?d05LSVVSbDdla29GbWNtTXU4RjJ6M1lMQkhJRjR3L0RxTG9obWUwK2VSTVdY?=
 =?utf-8?B?ZFNib2pSMWlMemlDSEloYzQ2cWpXZ3B2ejJydzR4Mkh2eURmb1dnN1h1MzFH?=
 =?utf-8?B?TkFPNUxmUFFJMUVTUkxIc2lzRm1yOUVlT2RMM3VySWVNOThyV1Myd0xWN3Bi?=
 =?utf-8?B?SVFlNnhIcVoreElvZ0JVTEQyOG1Yajc1L25vN01uck5KQ3ZydmlrMnJDMTFW?=
 =?utf-8?B?Z3NiL3p4Qm5jTGhYSjd2N1Z4MFpydVRUWGpHU0FEZXJzeVlhVGJXaWxyaUNN?=
 =?utf-8?B?azM2ZW9DUlhhWDJISnB3dzlmZnJaT0VKWGIzaXcvald0TE1kbzlkV0dhUVhw?=
 =?utf-8?B?Qi9PUmJKbHRtRHo1cCtydFJXVUV0SVpDWXY1Z0drcDlDQnREMi92ODVUOFFE?=
 =?utf-8?B?OTBnbEM1L0tsVFBOb2F1MVdjV0xHd1d0NFdSWWR3bW1udkJZc1VNdVU0SE9X?=
 =?utf-8?B?RVZCVlYzNXdqSEdPNnhpaEw3R0lnVlMvTjUwbnM4a25ZSUtUZTBKTGhMKzJL?=
 =?utf-8?B?NUl0MCthSGRvOHY1VUtvNmViMDlScmxnVHl1dUIwbEgzbkdCL3duN3VlWHRw?=
 =?utf-8?B?U0tlWHBOK1NwcXlYanU0V3YyY1ZNQjBCbm5YRjdITTZSQ2pXNWY5UGQxQWRH?=
 =?utf-8?B?U09UTU5Zcm1iTkxxQm4yb3RtVlNaSHRIVC90QzZUU1RTYnNnNGUvOWE3cGRa?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27974a91-7a3c-4ac2-3f5a-08dcdbf28b5e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 17:09:55.1476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Sgla3aKka75RMII2cMccQsHCKOKziCw6OEWLFWwvfZHbYWc+qonum2yBAwlSkWJAjmuxuvpWiSxea8WQ3RJ+Spg9KDlNQ88eN7DrwcxW9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8309
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

On 9/20/2024 07:29, Badal Nilawar wrote:
> From: bnilawar <badal.nilawar@intel.com>
>
> Debug print and GuC log in dmesg to debug possible G2H irq delay / miss
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c    | 4 +++-
>   drivers/gpu/drm/xe/xe_guc_ct.c | 2 ++
>   2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 41ff4fe65f8b..00c0550fb80f 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1094,8 +1094,10 @@ int xe_guc_self_cfg64(struct xe_guc *guc, u16 key, u64 val)
>   
>   void xe_guc_irq_handler(struct xe_guc *guc, const u16 iir)
>   {
> -	if (iir & GUC_INTR_GUC2HOST)
> +	if (iir & GUC_INTR_GUC2HOST) {
> +		xe_gt_dbg(guc_to_gt(guc), "G2H IRQ GT[%d]\n", guc_to_gt(guc)->info.id);
>   		xe_guc_ct_irq_handler(&guc->ct);
> +	}
>   }
>   
>   void xe_guc_sanitize(struct xe_guc *guc)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 5546d4f87ebb..8f2d046bf1b5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1026,6 +1026,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   		xe_gt_err(gt, "Timed out wait for G2H, fence %u, action %04x",
>   			  g2h_fence.seqno, action[0]);
>   		xa_erase_irq(&ct->fence_lookup, g2h_fence.seqno);
> +		xe_guc_log_print_dmesg(&ct_to_guc(ct)->log);
>   		return -ETIME;
>   	}
>   
> @@ -1141,6 +1142,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   		xe_gt_warn(gt, "G2H fence (%u) not found!\n", fence);
>   		CT_DEAD(ct, NULL, PARSE_G2H_UNKNOWN);
>   		g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
> +		xe_guc_log_print_dmesg(&ct_to_guc(ct)->log);
The whole point of the CT_DEAD two lines above is to print the GuC log 
and a whole bunch of other useful stuff to dmesg (including things like 
the CT contents which could be helpful given the description of the 
issue you are investigating). Adding an extra GuC log print on top is 
just duplicating the spew.

Likewise, it might be better to add a new CT_DEAD line instead of a call 
to xe_guc_log_print_dmesg() in guc_ct_send_recv() above.

John.

>   		return -EPROTO;
>   	}
>   

