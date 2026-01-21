Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57109D262B2
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 05:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0681C10E010;
	Wed, 21 Jan 2026 05:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lBX97KZk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3E310E010
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 05:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768973447; x=1800509447;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B7BfWxWiQMzorkEBLZn0eR6UKCcZ550fZKVKiMZbovU=;
 b=lBX97KZkJd03eF9VOr+B8DY0cdjl8+qvuP2sn3hF1YPz7sPRukekhA2c
 x1n4PTQtLyTWulGbCiW6lR4b6DG2bx7Sn6D1RJbL1EtEBGppzxiLPU06g
 dmFl72TWJkW/dA/tsqKLyD8GGMgYWV20UTApXNyaioCiDp4CLDfOARmaC
 EsBGXFVqS9xs1DqWjdRH0QgglXezeGgwMit5l7nMK/KCzNkUUGq97cOrA
 GsHdNabqbygWLzzDoxAvDJQXkuLXzzH5m+jhQGe9i7eAiZHmJBVUbcidr
 /9CeLOoDOoQAon0Mg2I+xBMTo0yFDSdF4xknJE8Hq/j83noj7FSrP2sKf Q==;
X-CSE-ConnectionGUID: p40/P+jWQjayzZDVGHXVsg==
X-CSE-MsgGUID: vryOkzjZQe2/6RVDrjiJAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70100624"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="70100624"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 21:30:47 -0800
X-CSE-ConnectionGUID: KEmq4R89TDutDtEbPTQxkQ==
X-CSE-MsgGUID: xPmOfEIVTZmhG+noKiUnZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="237600166"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 21:30:47 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 21:30:46 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 21:30:46 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.11)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 21:30:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eW9HV8TYnyY6K6aqDeJa8m8jRYBQIPkvj8Jj4tKfi5H+ykvsyMUj9QrQSYyVGHtXxGm/dIyagWDIw3EgtefFhz9FGYA/fo6gEqLn0oQg1uZE+vry5amqzLv6zxFw0gOVLjCfUejJtIUdkYOPCkbI7PKsj+w/7b1BAD0QRpLnmHhqyHkhcg42uo+NPGKxJhfsO8CjnWRPjZPhLaVdIadYjorpXI6GMOj7en/2hxqSrBei2T+62r3RMDIvqPAGizy2XIIP9iFE2IioX+4dKI1l3Rwtj6SjWCP37laahhZI26itTG9aY5B0Aumpjq6j7WdCGwSpZITY3g/wjjZuoEjU0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNgp49cUha1KtSDfW4HJDFNXxAEuVZ2UeIa2bDYCVZ8=;
 b=zNDp9YuZZndne8pmlnYgi4KQem6+VHI2rTVtGfv9I0GJKB8zDlFPjpUMMaMKrjIOzePzaMKXD8emZIkv1H8hkBdyaOAMfltgMjcgl4zjj7Q/gJFC8phKYM1QcaF5UFgoxn54a9yG9eOOV0fh9iK/A8bR5ol+jYnvk6KqCs5TXmMP1Btiduz96ay+C75RmjhOc49DrPMCZYziHjBxRClyX+kQm5RtO0dYsTVQSG7JrG/Djb6LZOaq+NWv02UO8kwuvYU8X5tandEqgAbOWwn5mFL7jwEdgyGjnQw9htWSyqlaXT3Imu741qd+vyIIQqDq+DOlap5IpwKbwrR842M8BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3052.namprd11.prod.outlook.com (2603:10b6:5:69::29) by
 DM4PR11MB8204.namprd11.prod.outlook.com (2603:10b6:8:17d::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Wed, 21 Jan 2026 05:30:44 +0000
Received: from DM6PR11MB3052.namprd11.prod.outlook.com
 ([fe80::c685:30c9:fec0:40d0]) by DM6PR11MB3052.namprd11.prod.outlook.com
 ([fe80::c685:30c9:fec0:40d0%7]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 05:30:44 +0000
Message-ID: <2c8c60b8-36ef-4ab3-b4c0-a8d3fc1d441e@intel.com>
Date: Wed, 21 Jan 2026 11:00:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] drm/xe/bo: Add purgeable bo state tracking and
 field madv to xe_bo
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
 <20260120060900.3137984-3-arvind.yadav@intel.com>
 <aW+/LsX/Od66W8NX@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <aW+/LsX/Od66W8NX@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0166.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::36) To DM6PR11MB3052.namprd11.prod.outlook.com
 (2603:10b6:5:69::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3052:EE_|DM4PR11MB8204:EE_
X-MS-Office365-Filtering-Correlation-Id: b72a75ee-fe7c-414c-f99d-08de58ae38c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3lNaVd6c08rK3JUODRrdHBEd09EYi9xZFk2KzBvb2tJWlpSWEYwNmN3ZmpI?=
 =?utf-8?B?WFFFT1VCcmdXOUZZSnBZRjArMHdmYi8zWE82MmFOY2k4VVNxcDZJV1hFZStr?=
 =?utf-8?B?MzIvaFg1SVZ4Y0d1RWNObllDSTBOeG5XNi9WSUh0N1NQTDZyejBodWhBb0Fp?=
 =?utf-8?B?eVRFVi9tWU11U0lEakhuQ0hoWWNkcUhrT0Q2QXpka2xZMVdseWFVV1lKaFN6?=
 =?utf-8?B?R2o5anNFOEkyOXQ5SHF4YzFFRGJsTnlwZy8wNzBTV1dEZzdheTlObktTWHBW?=
 =?utf-8?B?SndQSE1sSnlKdnNoenBZck0vcERQLzVFQkJVeGY1Y0RDNUNLZHRzWUk3TC9q?=
 =?utf-8?B?dCtMbkdnMjUyZGZmdGcxdkNuNSs5MDNZMzlRSnBFN2RIUDZQSjZKbTZ1ZDVL?=
 =?utf-8?B?YkdtREozdWxnUXYvaXdzTHU3cUU2cnZkeEYxZCt2VHd1MDh1RTFwMzJLcVJG?=
 =?utf-8?B?WVI4WXlYTlNpNFhSZ0pFMFhQVnU4WWhzeGNOc1dJVTZmQlJnVVlPcHordmdB?=
 =?utf-8?B?bVpBMnNsYXEvYldDTEZjcVdaWjlDSzdXY2g1N3N2MGNLMEIwZXlWZXBMREVM?=
 =?utf-8?B?c0FZeU55Y1ZyZTdVRzE1L05TaHNwWEQ0eWdEMmkxdDR3bFkzdG1QRXFrYjFJ?=
 =?utf-8?B?NDloL0h4QVNyUnZJRmluZXZSakZicXZ6Tk5OcW9tbnZZTHBNdnloZDF2YUtK?=
 =?utf-8?B?ekNtYndCZ1dEUU9Qa2E0Y0VIMmROTWZaNGNlR3oyTklxUjRqd0NkVlkvUlBX?=
 =?utf-8?B?MGxPR0RDNTUyVEdmQzJONUlKZmpRUWY1RkZIOG1UeHJzay9hWlFyMjBkZTdX?=
 =?utf-8?B?NVBVUU9SVnZDQVpRNjNyVEdMTEtac05SUGNheXM4Ymc3a0N1c1NjTktpU252?=
 =?utf-8?B?V1dSdHZWcGpMdU1iZiswWVUyYmN3cko0NW5GWFhEaUhKL0s4N3VPVFBLa0l5?=
 =?utf-8?B?RXNRS0xyOEpKNW81ZXZUZTUxNXlmOExKb3FuVmNWQnBhelFNYnE2ZTNhc2t4?=
 =?utf-8?B?NmkzZW84YU03S1MxNSs4TnNhdTRQbzlKQ0RSQWoyeGFvN1pMS1N6ZVJZSSth?=
 =?utf-8?B?L1crUzhmUENUcmpnLzhURGh6VytGTmpQanRyVG1rc3g3K1U1RmVuSjNLQkNv?=
 =?utf-8?B?OG1rYlpYTXNqbEl4ZjMvODFQbHRlR0lKTWpTdXBLaG93TnNmaXZuUzk5M3N6?=
 =?utf-8?B?RUMwTnUxS0VSTEFuVFhSN3VPZnh1OWNNdVB0WlJJbTZjK3VnYVcrNStDeE53?=
 =?utf-8?B?N3lySzJyaUdhRERUaWhCcGN3cEpCaVl2VHNwRUNuTElzYkxIcXQvNXJidGkx?=
 =?utf-8?B?MUFFdS9CNE8rRjlnVi9EYWdBMWNKdXhoTFFhVFczUzArSXpzRTQ0T1RWZDBx?=
 =?utf-8?B?Q21YTWlZWVFsSDJadlh6Y0k2em9ySUh4MnVHajlPL3NRRkZ4QnNKNFJEQ2Uy?=
 =?utf-8?B?SjhMWExKYUJyRjQrYTdMbmpCZUxvOHY3Y2VmR084RTRnUTZ3MkloazFiZUVz?=
 =?utf-8?B?bVZ6bDdXaXptNHNiSkNNYjNvL3lRWkZzT2FKSHlYRGZTU0ZrUjVUcUtGSGlS?=
 =?utf-8?B?ZXpoM3hTZjgwQ2dlYlJkQjk3cTJmaDd1YVo4SGwxb1F5Zy9JM1pVUnEya3BQ?=
 =?utf-8?B?R0tXOFpueERtUTFTeFM3RG03YktIbWRpOUZEakoxdEcxOUxzZkxqMzBLTTY5?=
 =?utf-8?B?UGdBaktxOGpCNHlJSEQ2eTR4dHNidE5zTi9kVlRoSnJwRlA4TWwzSmtWbUln?=
 =?utf-8?B?bHZVa1EvdEEvMGlvUWt3M0JHZGs1UmxwNFA5UGl4c0NlR0J4blc2OCtFeXBs?=
 =?utf-8?B?cGhyRFdBdXJIV09xejhFNVR6OTY0RzNPVGhneGNpaDhNOExqZElKM21pUDRm?=
 =?utf-8?B?WldrMlJYU1pCVFBoQlAwdnlTNDJDMkpNeVI5VGhvUDR6SmszM0M2QU1zQTM5?=
 =?utf-8?B?WHVoK20ydjl0dkxoQnRhQUdzK1VmUnNYN0FabVB2bnhVSzJmTUVURmo3aDVC?=
 =?utf-8?B?UEhzaXBYdW9TSTFmZW1qK2JyaHJoMXh4aEJyVTl2ZWFzNVN5L2hwMGErbVBa?=
 =?utf-8?B?Ny9DeVVTTTM1U2NVcStNNTE1K3pTKzgvK0tmbVE0TGRJbVpaUThsNmdTT2pQ?=
 =?utf-8?Q?jrZI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3052.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkVWTnNLN2ozZ1ZrSUlGSXJ2RExpUGYzWHVCSFpab0JWSkVTNFVRT1Vjcmta?=
 =?utf-8?B?akR6MkNBQ3V3UUNyWHV1WUdZYkFPWU8zQ2VhUEU2aTFsRVQvT1pwMTcweDE5?=
 =?utf-8?B?aHJvamlJNmk2RmhFWCtaMlNoaUNqb24wZW1hT2YvbEhTbUJJYTAyV0xDbTlh?=
 =?utf-8?B?bE9NT3VmeWlqVVd1aWZSa1g5Y0ZISEw5VHJBZHB6QjNsUmZuWnRWNUd3RUJv?=
 =?utf-8?B?d3B0OUtOYWlKUlRETFU4UisrRFNTYjE5dWg5bEFkTFBDTlhDbGl0enczeEhW?=
 =?utf-8?B?QXVkQkU4UTNxSzNLaFVIRHhveVFwWXAxTUJ5UDJNdEo2aEZlN3F5UkdmN0d4?=
 =?utf-8?B?ai81ZDk3T2trWFBldnJib0JuWEJVSkJjWHFkYlFJR3FBMjNCZDJuSFZVOGtP?=
 =?utf-8?B?dEVEMWlEdlhUWjRxVFhDd2JUZGdGR2x2VTNYZTU0K1VhSjFsSm9qVHJvRndJ?=
 =?utf-8?B?NnJCUGN2SG9yaE1kbkU4alF6NWh5MmRpNTZCVXFsdnppS0JmeDhheUtGTDdY?=
 =?utf-8?B?NWJwbm9sQm0vakZUNnYzRnZPeWF2emVXY3AxYmdubTNiOVd5dWsrZmxKMmpE?=
 =?utf-8?B?bUtiNW8wMmhBaXF5bkFGTjRWVTlQaUZDdG9TZ1BhYjhkMVdkakozOHJtK2tF?=
 =?utf-8?B?d3ZjM0RzdnlUckFPNGVYT1QrTXRZanE3Y1NuUlJtN2Rudkx2ZDdsWG83dHBl?=
 =?utf-8?B?cFRBVklKUlNKbVdJcWlOd2hxYkJBclkvaTJzVEhuN1pzSmZ2Z1ppdmlUMU1p?=
 =?utf-8?B?Y0FWVVJEa2dTSUlrV3lKMnZ6dWFPWW8vaG91NEF0Wk9GVmhGdzBBbXVpWHdE?=
 =?utf-8?B?MVd5WHFFaHcvREhCMTBHREQ2ckQyb3lmRUpva1dwWjR1Z09MMHQ3a1hkaTFk?=
 =?utf-8?B?bXJxTmpSRHQzVy91V0prUDUrTlVMRE8rWURTMGpjSlhJaXRjNU5nS3EwVUxp?=
 =?utf-8?B?RUJyMWFkbFlhaEhML3Z0cDhyY0dneXpYUUVOY3BtbTZvOWZiMGNOVDB1TGJa?=
 =?utf-8?B?cmhIS0l6NFhsLzY0NWthZjJxSnpXVi9DL3JSZWNlK2hDSVVGaHhjcEx2VGlI?=
 =?utf-8?B?bmxWZWJ2aHpWYkZYWUZlaXB3dmZRYjVjM05FRHhpSnNVNGlxUXQyUm41YzMr?=
 =?utf-8?B?N0pzK3BWeXc4N2thYXBQa25GZ2ZZUUlkV082WE9sck9uNnF6a1FkN2YweU5i?=
 =?utf-8?B?UDlwSjl6TzA1bnNqZzc0SCs2bWN0NzI3STBoUnd0UzMrZjBrRDM5aTZscUxC?=
 =?utf-8?B?RG5RaTJwNjA0bjdnMnF5Vkw3bHRyZDdqUW9OeGVPTEh4YVduUDZMb2hZUmlW?=
 =?utf-8?B?bVc3N2pyS1djSGExNUpiVE05YWxvdHFjbmlLUnhEZFRlZlhUSVphS05Eck8r?=
 =?utf-8?B?cEh2ZTJCVmhWRTVsM1lYUVBxZXdRK3RQNm41SlVPNUFuOGt6aXJ3YTdacXV6?=
 =?utf-8?B?OEFuUlRFM2VwVTVuUFRoZWp3bTA2emh6OVlML3dnSGRrMU8ydE1nQnQ5SWp4?=
 =?utf-8?B?RVVtRDExRU05TmZUY3pTVlgxa000K2RTUThtaVJsVm5semhvWE9DeElvc1dx?=
 =?utf-8?B?ajU3YlhOb0wyNm50MjNRNGlmK0ZkL2tSRno4NFdQRG1BbVZQVU1EZng4aStO?=
 =?utf-8?B?TFBlc2wyby9OL3VINm1mOUtXb3lzenA3Ulo1bTJlakZlb3IwSjYyeVFTVmJT?=
 =?utf-8?B?am1uekRSb0Z3SXJuQ2hIY0s1bXpvWmd1TmxlTURReE4rNzZ2d1MvWDFnU2I3?=
 =?utf-8?B?cVVnR0ZhRkxhalAvUSsrRGFKYVVyZHY0ekgra3lVV1h3bkJJSmpHa3dqWFVE?=
 =?utf-8?B?ZDZ3cjJUNmZKWGRTZER1ak9TL2x0Z0FuTnpqMmo0UmsrOFdkbmJtbDZYbWRF?=
 =?utf-8?B?SWNQT1c0SUhkTGROZEdvd2MrUDI3VW5lTG9RN25KRFdjYU42VHlvcjZrRVNq?=
 =?utf-8?B?RUk5bC91ZzRYRDlJSWdhcjhSVWhNWURLU2ZlUnJQYVY1UiswK1B0K0JBbUph?=
 =?utf-8?B?a0VJTVgvbldLOFhYM0NpTGNqS1c0eVJ0Y1BJUEJRSjhLdVFFTnNRdW5LejM4?=
 =?utf-8?B?bEFJZjVqWVBwZEgyTTNsLzlQYWZvUzRUaDlYQVFJMCt2a3MzRlBHdXFibS84?=
 =?utf-8?B?cFFFZzNtWW5QTHRiU3lXUEdmL3Zjc0xySzZMTW1RQmlyYWsrUEExMXNITHZk?=
 =?utf-8?B?Q05zVm1mRkQ1dVBlUzFGUTRqNkhQM0Jqa3ZtTE5BOFhhUld6RTRKVXZkeWx6?=
 =?utf-8?B?cG1EbGdWRy9UYTFMY0pNd2NnS0ZaeDBTQ0gzWUdqYWx1N1UzRlhKMmk5UVpM?=
 =?utf-8?B?Z3JuMjYvbHpsdzVTdTRwMTcxVWpUKzNKOXFac0dEYkExZkJxL0h1dz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b72a75ee-fe7c-414c-f99d-08de58ae38c6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3052.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 05:30:43.9776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +MaGnGGtd1rOmj9BVJLWHzjsZk9HXDhFadGzcjDV2drYi/ABCptTK3XcJpRYgx+CsRiORLjesd/rbNEAMWPz+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8204
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


On 20-01-2026 23:15, Matthew Brost wrote:
> On Tue, Jan 20, 2026 at 11:38:48AM +0530, Arvind Yadav wrote:
>> Add infrastructure for tracking purgeable state of buffer objects.
>> This includes:
>>
>> Introduce enum xe_madv_purgeable_state with three states:
>>     - XE_MADV_PURGEABLE_WILLNEED (0): BO is needed and should not be
>>       purged. This is the default state for all BOs.
>>
>>     - XE_MADV_PURGEABLE_DONTNEED (1): BO is not currently needed and
>>       can be purged by the kernel under memory pressure to reclaim
>>       resources. Only non-shared BOs can be marked as DONTNEED.
>>
>>     - XE_MADV_PURGEABLE_PURGED (2): BO has been purged by the kernel.
>>       Accessing a purged BO results in error. Follows i915 semantics
>>       where once purged, the BO remains permanently invalid ("once
>>       purged, always purged").
>>
>> Add atomic_t madv field to struct xe_bo for state tracking
>>    of purgeable state across concurrent access paths
>>
>> v2:
>>    - Add xe_bo_is_purged() helper, improve state documentation
>>
>> v3:
>>    - Add the kernel doc(Matthew Brost)
>>    - Add the new helpers xe_bo_madv_is_dontneed(Matthew Brost)
>>
>> v4:
>>    - @madv_purgeable atomic_t → u32 change across all relevant patches. (Matt)
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.h       | 56 ++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_bo_types.h |  3 ++
>>   2 files changed, 59 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index 8ab4474129c3..00e93b3065c9 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -86,6 +86,28 @@
>>   
>>   #define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
>>   
>> +/**
>> + * enum xe_madv_purgeable_state - Buffer object purgeable state enumeration
>> + *
>> + * This enum defines the possible purgeable states for a buffer object,
>> + * allowing userspace to provide memory usage hints to the kernel for
>> + * better memory management under pressure.
>> + *
>> + * @XE_MADV_PURGEABLE_WILLNEED: The buffer object is needed and should not be purged.
>> + * This is the default state.
>> + * @XE_MADV_PURGEABLE_DONTNEED: The buffer object is not currently needed and can be
>> + * purged by the kernel under memory pressure.
>> + * @XE_MADV_PURGEABLE_PURGED: The buffer object has been purged by the kernel.
>> + *
>> + * Accessing a purged buffer will result in an error. Per i915 semantics,
>> + * once purged, a BO remains permanently invalid and must be destroyed and recreated.
>> + */
>> +enum xe_madv_purgeable_state {
>> +	XE_MADV_PURGEABLE_WILLNEED,
>> +	XE_MADV_PURGEABLE_DONTNEED,
>> +	XE_MADV_PURGEABLE_PURGED,
>> +};
>> +
>>   struct sg_table;
>>   
>>   struct xe_bo *xe_bo_alloc(void);
>> @@ -214,6 +236,40 @@ static inline bool xe_bo_is_protected(const struct xe_bo *bo)
>>   	return bo->pxp_key_instance;
>>   }
>>   
>> +/**
>> + * xe_bo_is_purged() - Check if buffer object has been purged
>> + * @bo: The buffer object to check
>> + *
>> + * Checks if the buffer object's backing store has been discarded by the
>> + * kernel due to memory pressure after being marked as purgeable (DONTNEED).
>> + * Once purged, the BO cannot be restored and any attempt to use it will fail.
>> + *
>> + * Context: Caller must hold the BO's dma-resv lock
>> + * Return: true if the BO has been purged, false otherwise
>> + */
>> +static inline bool xe_bo_is_purged(struct xe_bo *bo)
>> +{
>> +	xe_bo_assert_held(bo);
>> +	return bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED;
>> +}
>> +
>> +/**
>> + * xe_bo_madv_is_dontneed() - Check if BO is marked as DONTNEED
>> + * @bo: The buffer object to check
>> + *
>> + * Checks if userspace has marked this BO as DONTNEED (i.e., its contents
>> + * are not currently needed and can be discarded under memory pressure).
>> + * This is used internally to decide whether a BO is eligible for purging.
>> + *
>> + * Context: Caller must hold the BO's dma-resv lock
>> + * Return: true if the BO is marked DONTNEED, false otherwise
>> + */
>> +static inline bool xe_bo_madv_is_dontneed(struct xe_bo *bo)
>> +{
>> +	xe_bo_assert_held(bo);
>> +	return bo->madv_purgeable == XE_MADV_PURGEABLE_DONTNEED;
>> +}
>> +
>>   static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>>   {
>>   	if (likely(bo)) {
>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
>> index d4fe3c8dca5b..6acfed0c0bb4 100644
>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>> @@ -108,6 +108,9 @@ struct xe_bo {
>>   	 * from default
>>   	 */
>>   	u64 min_align;
>> +
>> +	/** @madv_purgeable: user space advise on BO purgeability */
> , protected by BO's dma-resv lock.
>
> Everything else LGTM.


Noted, I will do the changes as per suggestion.


Thanks,
Arvind

>
> Matt
>
>> +	u32 madv_purgeable;
>>   };
>>   
>>   #endif
>> -- 
>> 2.43.0
>>
