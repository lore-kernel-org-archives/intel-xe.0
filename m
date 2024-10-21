Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEF0D0E6D9
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 09:54:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00BD10E2D3;
	Mon, 21 Oct 2024 09:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OVr6e3yr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA7010E2D3
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 09:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729504479; x=1761040479;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IdDJRRgipG0FfP1eSjyjoyJbEs8VzL+DGuF7gh5GH+c=;
 b=OVr6e3yrm37AhH0Gd6YKZngqzcpfZVDlPznqMEB6Jbj37NAiUMjo443o
 gQegsBQurxGVWIxxvFxdN6Hg4Dl4xLpDF3+LrjspP8utth/P6pBvrwQaP
 4d5a3ddnXg4c3YG2q1xCj3itETsxc7/h7dBSqU7CA5o8LgVI7YeX7sy+u
 qQvf4mtdq4G+Zt1FDvC+GuOl2EZZf/JArvk0me6aoF1RVwMZZs7u8oBTJ
 g3snLa2HK9o0CceNEoBBQhEkKTM76g03/7EfITWoY8GYNL/wBAklhoJY8
 BcbtRzsmNbh+AgWZY4MO1OgMrvUp3RHHMKrtzNJaDCN17LjI1OtKPfLNG A==;
X-CSE-ConnectionGUID: MGx55wtyTXGT0nWJHTDXcg==
X-CSE-MsgGUID: ofuoDv8dQ1uPF5K+aqcyRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40350168"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="40350168"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:54:38 -0700
X-CSE-ConnectionGUID: R0DCUC66SFC30IDZVZjRNQ==
X-CSE-MsgGUID: Vdsye3P4Tm652hbfwWC02Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="110316637"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 02:54:38 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 02:54:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 02:54:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 02:54:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yttGbgGyQg3sP4wkNwA1mnWCKgq2zQ+abF2I/HGKiRnto/HTJjOzOGCCf/D/w+qmCo5ne/7g1YX64EOyvSWrsRzgBcPl6nupRk1S8jyEQF3Ig5MwUwd+o3Ii/EYtbiBJjhIezNV3VBCZoUFZGzYyK1S7u4Po2lhQeQU2RZWsX9Tlt/xpbrw8W1Zocg7T228TnFJCIM+whqw6dG1no4wdy6NRhPIAmvFJx8QS9dY6p0Hd07/TnOtkCbRLGXTX3dS/Anio7W+nxFTNazUa4uTsm9GQS4ArrQ0AghF+wtefhE9tUNCsuo/qJnJeWUaOu3mVv+Jgwma4L9GKN7ZpyviM0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akPUs/BSZLXi+LTCEpb1ra+LfJyGboCj9eecjLj6JJM=;
 b=SnAY9gCVPrpkgVfAb3qTlAIEMVRqeTlCG3shHcsWpMJm0FgYNhp1DhQ0BZLhw4H3HPNWSffY4bxdm26+yNO0JNg6voN+nmP6TTFADTVRKnOxAbXwtaYY+3fWpbW8FzhxOqZK7r0E1bQZfrIldERaSw2NDCAvXwdSwjur1PqJMUrieRpW+Qu/1XSKnsO8O610uYD47cPCxZDdHmO50zMRVHSXSjjoauOI+YYZ+5+3GWKkhpuToyLQvVSNBBcLWY+apR76CgpjQV6hQjanRIjn/RJRBaDPt4VRkL+t1s+wvcpDmgH8/cN+yWu+zfBQ6+7BxCbcZ+hD2qQSfZ0b5oUbXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by SJ2PR11MB8516.namprd11.prod.outlook.com (2603:10b6:a03:56c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 09:54:34 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%2]) with mapi id 15.20.8069.024; Mon, 21 Oct 2024
 09:54:34 +0000
Message-ID: <e50c5fdd-2872-4d92-a60f-d1db53fd1b79@intel.com>
Date: Mon, 21 Oct 2024 11:54:30 +0200
User-Agent: Mozilla Thunderbird
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Subject: Re: [PATCH 12/18] drm/xe/eudebug: implement userptr_vma access
To: Matthew Brost <matthew.brost@intel.com>, Mika Kuoppala
 <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Maciej Patelczyk
 <maciej.patelczyk@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
 <20241001144306.1991001-13-mika.kuoppala@linux.intel.com>
 <ZxVI8IpkcgAq7PRx@DUT025-TGLU.fm.intel.com>
X-Mozilla-News-Host: news://nntp.lore.kernel.org
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <ZxVI8IpkcgAq7PRx@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::15) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|SJ2PR11MB8516:EE_
X-MS-Office365-Filtering-Correlation-Id: ff79413d-eded-46ca-c4ce-08dcf1b65e13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjN6elNOVk5zY1REQ25vcDZMMjIwKzBzNnd0MTg3T1J3eFJiZjljbjNSYUgr?=
 =?utf-8?B?VnZiTTNDQ2NEU0pEMXMvZ3dSazdHTXlaQUVPVkpKUFF3Qnd6NmUzNDlEL0V4?=
 =?utf-8?B?RlgzWmdoK25IOWlRS3RncTh2cUREWjF3TGMxd0x4YzJKcEx0Z3JWVDRUMzk0?=
 =?utf-8?B?UXZ6S3ROQ1pvdFZ2L3Q2ZlhSbFJzTElCbFJVVmlRbU05ZFg1VmNIYkZxRVdZ?=
 =?utf-8?B?QkJJLzV6RHprdWJIakZRQ3V3elNqaDJsNXZNVm53SkcyZHFQaU5IQ0t3M2hU?=
 =?utf-8?B?bURxWC8wek5nQy9ubW1RS1g3RDd4ZGRiYjVFWlRyelFSZTBRVFowd2FNN2lN?=
 =?utf-8?B?aUczMTFOT3piTkpXdWRYNmVFY3FUZUNRUWVpVUdzRHh5T0pDc20ybWNCcnhK?=
 =?utf-8?B?aTMwZktUbEZqdjA5L1FZZnRXaXlEeFF2eHAybmUyZFVGYlA0VlhNVlNDeXhO?=
 =?utf-8?B?WHhQWlh4MHdYTnZ0YndPcmhsN3A3YnpVRHdKeHg5ZFA1VnpBQWlXTk02ZFBZ?=
 =?utf-8?B?cHZZVTJHM093aEtnUklNNVRnaU5ZTFJVQWdYTFNHczdxZlluL3BSQy9iY1pK?=
 =?utf-8?B?ZlNEYldJODRXdlhBcTJnZjFMSTNvaEFWN3BzOS85cnU2NGdtSWFPbzFIeUda?=
 =?utf-8?B?RWxtUGlaQkllVHlFbmd2VGlGZlRIMmI2bjREOWpTZk5GSFBWMmVNc0Y2WWhm?=
 =?utf-8?B?KzQ5NE1nZGNaL3NoaitveVRCaXU1YlpMbTZVSERLMElueE12UmhpYUQ2djNi?=
 =?utf-8?B?aEhIdHFIOFBJc0M0SEtha1FrclRVcFc5Q2VMaGhkODVoSGRjSVR1WjFJNmVN?=
 =?utf-8?B?Yko2K2Fvci92dUFaT2VhSWhXeEo0MHRuS1BYV1hXajdqckh5a3BneXVjVUly?=
 =?utf-8?B?aHBWbVN2Qnorc2ZncHNGaEc0Q21nVFEzWXBXRGJBTlZ1cXhCdHJ4T2dYL3hU?=
 =?utf-8?B?S3pNM0d5K05IQ1VUdkN2c3Y3eldzS29WZk45TzBabFBSSHBVRWdwNUdQMUVK?=
 =?utf-8?B?SCt4c2tUb1ZzRzk3RjErZFBBZkJ3K21MZ0RqWGhZRHVYNWdTcHBVTzZnbTZI?=
 =?utf-8?B?ekI2UGVxMGRhaG5zUWE5T0k0RHdwQ0dZZDFJWWdWN0xiZlo3dHhKeU53QS9j?=
 =?utf-8?B?RFE5c21YU0lMdWdlY25kbGpwcldYdFhEdmZsM3NuUkNINm9IZmJZNWVzZThp?=
 =?utf-8?B?RFNrbmdtL1ZIZTErUDJZTXZ6V3VQanUxaVV4U3ZLRU9RTWw0Tmt0WFFZdklK?=
 =?utf-8?B?OHpiMHN1Sm5Db0lINUF1bFNXWDVBTStQTURFQVYwejMzV3Bza1FsK1dLc0VW?=
 =?utf-8?B?VWhadHFJWE1iK1k4MVpkamdkaEtZVUhoS0VkbExRZmFKZ0lZbE1LUTV0aXFi?=
 =?utf-8?B?WkZDMVpIeGZDcFJ5MXRuWUk4M3ZSR2NYQmZiNzJLVXdrWkJKbU51Z2VIRzAz?=
 =?utf-8?B?R3lWV3QwQlJJQXVEcmh3L054Vk1lZmxtTGVzTjJqcVM3bEJyL0owdzc1NFBk?=
 =?utf-8?B?ek4yd29sS1RQMllDKzhHY3RCdi9qQUNJODBLbGJxaDhwSVFmeWUrWUM5cmRz?=
 =?utf-8?B?b0pZa3BNQlphbk9LYVJUT08rdTlEMXpWT2F2UW9JdEk0S0xkR2srbDZYTUp2?=
 =?utf-8?B?cFVCRG93UUN5eTJoK2VyZGJtVjBMVUc5UWk4bjlRdVNsdHBXQ09EeTB2VUhO?=
 =?utf-8?B?QWlNQkpzZVZMVStzUHVTL2M1UUlBT3czeTlITjl1WmNOckdhZUVuNjVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTd2UG5Kc1dNYjBLdFhCZ1NjeDV5T0k5bDZUREdnT2VQYTFJZ1R3MjIzVTY0?=
 =?utf-8?B?TTVQR0U5TjVKS0JuZy83Um1IOGZsZmtaem5xVWFrTTVTQjFjS3JqMDNkN0tq?=
 =?utf-8?B?L1BZK00xZjZxeitla2g0NHE3alB4M3dTRGY2RXpYcmVSb2RwRjIyYmphb2da?=
 =?utf-8?B?cmVJVkovVUlzRjc4dzQ4MmFnY0QxdEtJSEtBdFJ6RTVVM0tNcHNmTWptSHhR?=
 =?utf-8?B?NDM5b1E4OWs0SXdxZjB3Nkx3bUdRajJWVDFaWnpnZ1FLcmxtMFFQcG9PclQ0?=
 =?utf-8?B?UmRKaVY5c0hsV0kwMFcrZ2x3SVl4ZUxKS214TXFHMHkyd0NNNEhLazlvNVZN?=
 =?utf-8?B?Ny9OU2MwSzNCbGpwb0JhaHhMV0NSN2xOaHoxSFJyWUF2bzJsZGt1Q3lWeEY5?=
 =?utf-8?B?TE9PWGlLU0lrTC9vRTFqNWM3ZkVDcU5McUsrdlpscUYzblB1TzQ2d2lRZlBG?=
 =?utf-8?B?RDNENWt6d1VMVHYyM1Y3dFh6Mi9XVlZzbmZicnphVno3b21qMXBoTTEzeFpX?=
 =?utf-8?B?QmFGaVhZR3JMSHBOQWZ3MjAwQ3I2R3FoTUxOa1FRcUswcjhURmVLMEVLM0g2?=
 =?utf-8?B?cjZyYkM3a05tbG1ZdWJkS3h2NjRJcDdEbmFacXJpZjRidjBVVFI0RUIwZnd3?=
 =?utf-8?B?Q01wNks4NWpsUnB1My9tRnU5MkR3N3NvbGx6bmpwL1FTWGRTUEpEdmFBRlY4?=
 =?utf-8?B?R1FIZDdlbitQNVo2YktyMHFUME8vbWNPM2Y1a3VEbGdKZ0JVOWJ1SzZzQThP?=
 =?utf-8?B?M3BQVk4vNnhNTlhHaFNVSlRQakROUjFVY0NmNkdQM1dWWkpXQnQzMFFaT05H?=
 =?utf-8?B?MXNDMFlZUXJ1bWsxclduV1QvL0lsNjZwaWsyblFqMzg3WkZVUUxSVW15NUx0?=
 =?utf-8?B?NVNvbHVGaUFSRGw1QkdJQ3hYa0NMakJUMlpYMlhGaUliZEdTbTQvVVV0c2JE?=
 =?utf-8?B?OVJHeWR5cWdGbW1rQnZ1QnpSNWF1YlA1ekFEMDkyWEFFb3I0MlQ5RDFqc2dE?=
 =?utf-8?B?NFEzZFJiL2lsWUJwM3Q3TURwSmY0dExwL2VkTUFPaGVuV3p3bmczL1pZcDd2?=
 =?utf-8?B?VTA5YVhMOWRrRjJ4Uk81aWtvbzROQXZyNzhHWXVLV3QvTit4dFVrSWlGUTRr?=
 =?utf-8?B?NU42dm5acGdKSHdxRWdBdlJyaFRzSlVVRTFqRWlGVHVyRzVPMTlHQzVNc2Zu?=
 =?utf-8?B?L3JmbGhCTjE4cGpyZzd6L3cwVFh6TWJtUmRxUEhXMXpzaHdWK05SL1YyM2RQ?=
 =?utf-8?B?cFFralFZM0Y0M2YrelJDOVg2aXRrTTdSMkgwRFFqem05cTFSbnVTQVZxTVNQ?=
 =?utf-8?B?TUs3czFjcVZNdjQvL3RLdXJ5QjlKQ3NkTFBvdWFkZWlmMTM0VEZRdHhmcW5V?=
 =?utf-8?B?Mzg5Y1BjWnQ1MmdCTjhoQXk1cnBLeUZzTWNKdklXQWdpeDVOUVkxNlBIM0Uv?=
 =?utf-8?B?UmdBSTVlUExSczhac0tYMENKRHN4K1hMcHBrNkRZem1TODE0cHBXRjFQN2ZS?=
 =?utf-8?B?N1liT2J4UjBZV1piYmpLeWYxbXRhUUJYRjgva2dTYmJUZjNpQmF3WVJUS2lV?=
 =?utf-8?B?NkJQUHdzZ2J1WndnZGpOV1dsTHRPd2x5a2Mxdk9MYjl3OWlhdjg4UHJoUUNt?=
 =?utf-8?B?QTFBVzB0MFlNUHVlWGhPcTdGNlVYQktmY3oya1p5bEFKQlBhVnpWc0xpZDAz?=
 =?utf-8?B?ZDVjcDdXYnhBSUhOdEtRK1JJblRFYVk1djkrMnlLM2FySFRUYVF5bFE1TTR0?=
 =?utf-8?B?NTBQYjBDOGRjK2V1T1YrdHJ5SEtLSTBlU2w1dGxVb2JRSzNDWHVmc1pzSHk1?=
 =?utf-8?B?UEQ0ZUw2M0tGTXgzQlFWRmV5R3N2ZDRwV0FkSHFqdjg1Y1ZRSkJ0K0ttZlZz?=
 =?utf-8?B?NEpNUmhZNFBHclJqYUlSZlJVeWovWWtTbWc4MEN0NkZpRElUNzRzTXJ2Y1JV?=
 =?utf-8?B?TkpNclRYd2lvemVmc2Z0ZmVzUzdKUzE5VHovaXBCVGhKZUlodGtzMFFYS3Vo?=
 =?utf-8?B?dFl1TFNtc3Q1bW1iTGFTZ1kwaE1oZkZYUUtrY255N1UrQWNKYU9aSmRoazRx?=
 =?utf-8?B?d3BKcDcxWXNzVkJCZjkzR1BTR21aeHdicFdCczJvRVo3cjluZjZScWtpdElq?=
 =?utf-8?B?cy9VemZuRVh1VEwySXJQQVUvWExIaERIK1dTTHlsaE13UFg3VHdsaFdIbUw0?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff79413d-eded-46ca-c4ce-08dcf1b65e13
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 09:54:34.7068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S/JpYNWW9YnTFceWQEyuR5EbJfRuDcFeE/tuWoN61jYcns1wyZjAFm2ODwIcNSQ2Wl0YQ7qGg0vXWI4AFzGebQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8516
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

W dniu 20.10.2024 o 20:16, Matthew Brost pisze:
> On Tue, Oct 01, 2024 at 05:43:00PM +0300, Mika Kuoppala wrote:
>> From: Andrzej Hajda <andrzej.hajda@intel.com>
>>
>> Debugger needs to read/write program's vmas including userptr_vma.
>> Since hmm_range_fault is used to pin userptr vmas, it is possible
>> to map those vmas from debugger context.
>>
>> v2: pin pages vs notifier, move to vm.c (Matthew)
>>
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
>> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_eudebug.c |  2 +-
>>   drivers/gpu/drm/xe/xe_vm.c      | 47 +++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_vm.h      |  3 +++
>>   3 files changed, 51 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
>> index edad6d533d0b..b09d7414cfe3 100644
>> --- a/drivers/gpu/drm/xe/xe_eudebug.c
>> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
>> @@ -3023,7 +3023,7 @@ static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset,
>>   		return ret;
>>   	}
>>   
>> -	return -EINVAL;
>> +	return xe_uvma_access(to_userptr_vma(vma), offset, buf, bytes, write);
>>   }
>>   
>>   static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index a836dfc5a86f..5f891e76993b 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -3421,3 +3421,50 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>>   	}
>>   	kvfree(snap);
>>   }
>> +
>> +int xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
>> +		   void *buf, u64 len, bool write)
>> +{
> 
> Maybe dump question but are we overthinking this here?
> 
> Can we just use kthread_use_mm, copy_to_user, copy_from_user?
> 
> If not then my previous comments still apply here.

This function is called from debugger process context and kthread_use_mm 
is allowed only from kthread. Spawning kthread just for this is an 
option but looks odd and suboptimal, could be kind of last resort, or not?

Another options:
1. Keep reference to remote task in xe_userptr and use 
access_process_vm(up->task, ...).

2. Pass xe_eudebug.target_task reference down from eudebug framework to 
this helper and use access_process_vm. Current call chain is:
__xe_eudebug_vm_access - has access to xe_eudebug.target_task
->__vm_read_write
--->xe_eudebug_vm_access
---->xe_eudebug_vm_access
----->xe_eudebug_vma_access
------>xe_vm_userptr_access
So to achieve this multiple changes are required, but maybe it is valid 
path to go?
One potential issue with 1 and 2 is that multiple UMD tests were failing 
when access_process_vm/access_remote_vm were used, they were not 
investigated as this approach was dropped due to different reasons.

3. Continue approach from this patch, but with corrected page iterator 
of up->sg sg list[1]. This was nacked by you(?) [2] but I have problem 
understanding why? I see lot of code in kernel mapping sg pages:
linux$ git grep ' kmap.*sg' | wc -l
61
Is it incorrect? Or our case is different?

4. As you suggested in [3](?), modify xe_hmm_userptr_populate_range to 
keep hmm_range.hmm_pfns(or sth similar) in xe_userptr and use it later 
(instead of up->sg) to iterate over pages.

[1]: 
https://lore.kernel.org/intel-xe/20241011-xe_res_cursor_add_page_iterator-v3-1-0f8b8d3ab021@intel.com/
[2]: 
https://lore.kernel.org/intel-xe/Zw32fauoUmB6Iojk@DUT025-TGLU.fm.intel.com/
[3]: 
https://patchwork.freedesktop.org/patch/617481/?series=136572&rev=2#comment_1126527

Regards
Andrzej

> 
> Matt
> 
>> +	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
>> +	struct xe_userptr *up = &uvma->userptr;
>> +	struct xe_res_cursor cur = {};
>> +	int cur_len, ret = 0;
>> +
>> +	while (true) {
>> +		down_read(&vm->userptr.notifier_lock);
>> +		if (!xe_vma_userptr_check_repin(uvma))
>> +			break;
>> +
>> +		spin_lock(&vm->userptr.invalidated_lock);
>> +		list_del_init(&uvma->userptr.invalidate_link);
>> +		spin_unlock(&vm->userptr.invalidated_lock);
>> +
>> +		up_read(&vm->userptr.notifier_lock);
>> +		ret = xe_vma_userptr_pin_pages(uvma);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	if (!up->sg) {
>> +		ret = -EINVAL;
>> +		goto out_unlock_notifier;
>> +	}
>> +
>> +	for (xe_res_first_sg(up->sg, offset, len, &cur); cur.remaining;
>> +	     xe_res_next(&cur, cur_len)) {
>> +		void *ptr = kmap_local_page(sg_page(cur.sgl)) + cur.start;
>> +
>> +		cur_len = min(cur.size, cur.remaining);
>> +		if (write)
>> +			memcpy(ptr, buf, cur_len);
>> +		else
>> +			memcpy(buf, ptr, cur_len);
>> +		kunmap_local(ptr);
>> +		buf += cur_len;
>> +	}
>> +	ret = len;
>> +
>> +out_unlock_notifier:
>> +	up_read(&vm->userptr.notifier_lock);
>> +	return ret;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> index c864dba35e1d..99b9a9b011de 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.h
>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>> @@ -281,3 +281,6 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
>>   void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
>>   void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
>>   void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
>> +
>> +int xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
>> +		   void *buf, u64 len, bool write);
>> -- 
>> 2.34.1
>>

