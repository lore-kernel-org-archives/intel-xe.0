Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB77FC87FC9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 23:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67CB110E056;
	Wed, 30 Jul 2025 23:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TBOEJtAx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CB910E056
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 23:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753918874; x=1785454874;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2ljtAC7cSZfSdr9vDq/O52l+L2/mzOuY40vYHF37KwA=;
 b=TBOEJtAxMhs9pzNJrU0jd9Zxm4NW1fP1S1cQdcJlSgdbop2IumXU5eck
 cGeQW9ipOET5gBj94FZI5Rrio/MlAOSwDgYS/Jj1rytVpVjdXU+m3H/NO
 e3x46TlX5cM/6VEIGG2j3x+vGI3vrFgdcqsjWm1V7hHPHINEhz4vyniuY
 PVD7UWiGFauuQUu5o23jTDwKOudU8pWSekV/PjBwyN4J7M8HYN6NUA0RW
 JzKmgnVlRH5mp0duwvoxh9H1sx+MOjJWyB7ttnGicHe7NHFcHVMPlWwTW
 Z9WQbCOs+sPXpubnXVKEf+dfdN4cJQ4Mp2m5rlinWjyIlPd4TkzdJNZED A==;
X-CSE-ConnectionGUID: nt9FZiwWQmqR2y0bBywOzg==
X-CSE-MsgGUID: kDN6WE6UTiS2yL0uztTGCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="73692466"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="73692466"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 16:41:10 -0700
X-CSE-ConnectionGUID: NNVLVqlZRYGKxz+QJEBhpQ==
X-CSE-MsgGUID: OhxDsE/fS/Ktw7IoQhH4uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="163562537"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 16:41:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 16:41:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 16:41:09 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.69)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 16:41:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LbTmF2DHB8+IXtKxcU9B93FaVUb2neFs4w8+CEATomTDs/nlD/f8xHUFDOiRkOaZGrOvVP0/fSCq9GKgLuKxB8EVESQ+4v9DwONPKxoUC5P2QIKmUWT8ZxDtuJYqxeFJ4m2hdYWGpe1whoX9DQakbpZEBgWY+fTK8R2RlHVQ0/Qi3Ni8IJDlMgiCgepft7aRfxI5wpTsNRdLuVcuwJg3HRCmTj285A5YSH6iS7mo/gh6eOUzWD3xHXCpDP9dONMhQgylw6Zmkyxi1UBClo5L4gq/RmMbGSGoXkL1GE44SWL5LtL6ihKeIq8lAXsfEQrGvfvUgSWfVTOD6M0oVJvnFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRJrqVMn/vjPtoibXVtRm1K23PQ2WuJofb0LSrBgmWs=;
 b=gaK+6rYeA6hnqwtoCcmkcfjMWBK3I8Gv4l+EFhx28CsvKv8UeE6ynJVlrOU+oLu9l3IzdcxiIdAbd0QMkdKCRK3PiasT1DnJNb8agfkHkgI0GRSk4d69tSFEPi4hSPq3UCAk4lKeU0bh2I+oJ7Y3PFqlWzdNL2DO2aHDGT3XLkolhT9QaIsRTl849Tj+nUu4PCDW8FrT9iIlek0aUO9a4pZ8a+1lWeE26Bz6xhdxvM1TUOtj0hL9KwfhZeYaWBKK7ls1YC03cDo14sDqaFm69AQWTKbZ49mM6BiJgMfJHa/yuXUPi6QVJaSAZM12TkpaMoUDfsQhmiUX4MsADIxgjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH8PR11MB6564.namprd11.prod.outlook.com (2603:10b6:510:1c3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 23:40:37 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 23:40:37 +0000
Message-ID: <ce8abaad-0dba-4cd6-8364-d83e882f69ef@intel.com>
Date: Wed, 30 Jul 2025 19:40:35 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] drm/xe/guc: Add GuC log init config in LFD format
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250722013553.1266218-1-zhanjun.dong@intel.com>
 <20250722013553.1266218-5-zhanjun.dong@intel.com>
 <4c3a225f-fbeb-45c9-9659-ddfb1046d0f6@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <4c3a225f-fbeb-45c9-9659-ddfb1046d0f6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW2PR2101CA0010.namprd21.prod.outlook.com
 (2603:10b6:302:1::23) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH8PR11MB6564:EE_
X-MS-Office365-Filtering-Correlation-Id: eb2d9129-0e91-483e-6b54-08ddcfc27c61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmxrTnhDS3lEWTBTZjZTZ2tsY3ZDOWZ1c3oxV29pempnUmp3bHRqaU5hU1VZ?=
 =?utf-8?B?Ly9qMmtiMENmUVdWMkZlcDZXb0J5K2V0V0NCSjZSNEtpVnU2SXdueUxmbXN5?=
 =?utf-8?B?SEJKd0hGZHVBNXJVb2FxWDdqZXRWdzdabjR4V2JSYjcrdHFycC9sdHh4MGZv?=
 =?utf-8?B?VGV6cUYrOTlZVHFKN0p4RjY5TThtSDFKM1VnV2JXL1l6dFRndlFxYTJ1bm9q?=
 =?utf-8?B?Tmh2MGVJVWxtUjJaQm54cXI4YzM3cDd1bWxQQnhsVStKT3RubVd3cDkvbndi?=
 =?utf-8?B?eU1LZ3N0SUhmQlc2TE0yMGNBeFN1Myt2ald4SDFiMk5acHgrbmIwbjZLeUFk?=
 =?utf-8?B?cG9xWnE0V1grYmdBcTRNTVdnZDZTSjFGUE1iWEo1RGtnZGlLNUQ5Skgza2Vo?=
 =?utf-8?B?MUYxQUpxUkkwdkpzdHZ2OTdpaytMZm9oUFFGS1kzS1Z1ZDdORmVNTzJsMjl3?=
 =?utf-8?B?R0g3dkN3TkNRMlJGUWd4eW1pVmhFNkhsNXlrcGVneVYzamFlVXFDRzlkT29n?=
 =?utf-8?B?OS9LdGRYL1I0SDF1d2M4Y3BrOFhnYXp6TkJMSmJMYzZITDNCR01zY1AyN2Vs?=
 =?utf-8?B?ZWl3VW5CdGl3SHU5UEpJOTJqYk45SHd2RlplYzlKajlpMDJUUmlCZ1ozcWxY?=
 =?utf-8?B?ZUhIMkpLRTJWUEVQZ3BoT1AwOUcyd1kyWWJJdjg2K2tUcDBCbDg3UUpnSi8r?=
 =?utf-8?B?czIycjZuVTdVRmp6ZnlqbExSK2lub1pjL3hRU2VqSmFBTnJXSzRleEJXYk0z?=
 =?utf-8?B?L0VmYlZrY2xzN29PTWFKaUtNY2U3Q296UHdzS1RXcE90VzZENGtORk01akx3?=
 =?utf-8?B?QmU1bCtrSXZUOFZCdkRUMVhHRzZVREJtbXRmZ3dsZ3dkQ004aU1oNXlpY1h2?=
 =?utf-8?B?RTNTamRYSUdEbjhvZGtFMWJUbTN4YWZ2cVJJY3g4S3pPb0VBSnl2RVExaG04?=
 =?utf-8?B?TllwSThISzF1RC94QnkxZWRBczdYSnk5OGJkUVJiNTZ1ZUVDQ1NkTktkZUlt?=
 =?utf-8?B?NGZoUStrYXBlT0VSSm5SRmRMSG02OWRLcFRWNEx2ZWxlV2wxVkhaRTBxNkhy?=
 =?utf-8?B?S2NKNGhsTFQxUmcrVWUrN1ZOcjRteU5LVldWbmNabUREMnRTZWZRdEpMb3g4?=
 =?utf-8?B?TnNXQ05QbUxTN3VkOEk0U2ViTlArc1E5YzZoc3pBRmhOSHF3eVVZcExLMlBv?=
 =?utf-8?B?cXNpVXdERFFQZ0tEZVZHbzczTkZnVUNQUE9KNmEzeHBYdGliNlNZTDBGQzBK?=
 =?utf-8?B?dFYwbmVWYXdFd2ZleWRCbEc3R2tKQWE3M0JJOGxmU3R5L3hxUW1rOGdGOXoz?=
 =?utf-8?B?QVk3QjgwMURPUXQ1QWQxcGhiNG4rcERRaHlmTElYMUZnb0x3WFdaM0FpVEFW?=
 =?utf-8?B?cGhaQTJ0cEFPVTJUZzV1OC9PcXI1clluMmc5MUpMTFViTjFMVHF3SnFDY1Fr?=
 =?utf-8?B?ZDZvS0drT0xiaDk0YTlTYjNkVkg1cUpHc2VmbHVXVmorOTBydXNNaDZtMktB?=
 =?utf-8?B?c3M0SGxjdG9XdFBkUCtvc2Z2N2trdUxXb2lXWGxBOFdNVzB2aWVsanI0azFL?=
 =?utf-8?B?YWpOck1FVUpyM0tUbCtPZTFrYmE1WmZvODUrd0cza1J4eUxkSWU5cFByTlVN?=
 =?utf-8?B?eU9HcG8rdjF4SDlBOVNqVHNNVWMvZTJzOUlZdUdwc2ZNTlhmZXpNQjYvekgr?=
 =?utf-8?B?TDJ4Y2tqVmVJaWdnM3Z1QTByMTJBVGlJR2tmRXdvV1ZMVVZJUDI3S0QwN0JN?=
 =?utf-8?B?N3hmZmtvSWpqVDFTMW9hY0xkaTVlSWdaNzVzdDlRZThWMHJVQlkvQVFCM3R6?=
 =?utf-8?B?RjlqUUpac0FxSWxZWm5UdmhZTHM2dlo1cTNpMEVFZmExdXM1akY3Z01sU09w?=
 =?utf-8?B?OFVTUVl2Ti9HbzhvMlVnTWFGV2hmR1ZRVjRpRXNIYWpoKzRZMHY5UkM5bzNm?=
 =?utf-8?Q?IGjNfRc7Nc8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1VSUURjelFsWEwyVUF6VnBBOVI0ZVJCRmpPd2xXYzQwd2wrbEZZUzdPRFVX?=
 =?utf-8?B?d210c2hndFRhL0ZtR2RzTXI3T3hqTnRkYURnMGNLVXZBR2tsdi81a0lObE9Y?=
 =?utf-8?B?M0d4ZXp4MUZnZ1hrZHp3SHkyc0N6aERmUkxRaUZsQU80eTZMRmhiNE13RmQ4?=
 =?utf-8?B?T2FHV1NoMm5sQk4reVQ2Vk90dXR2TVFIT0pPalB2VXI3UmJFY1NHZVhwUHpv?=
 =?utf-8?B?VytEVUs0a1RvR2p4MUFRanFFWVhjYnE0ZkRtWW1IRTdlc0YxaVpLTW1XWTR2?=
 =?utf-8?B?elkzM1hLUHRtNjVLL0hCRUFCZ2xtSTdaQWcrTHVNSjQxU3pSK1I1cjhZZXFa?=
 =?utf-8?B?ZGtSeW43RnN5NDVzRTZ5VUNvTHNTTkg1M01ZTjc0U041Z2tWTHhlMmcxUk1W?=
 =?utf-8?B?Z0tOME81bkUxK2ZvNUlERFhPOGVaYmNlTS9DdFlFbzBFYkpidHkyWTJGbTds?=
 =?utf-8?B?aS81aUoyUGhYSXpJSyt2bXhkbThlTE9ldVVUZU5sVlhFQ0J2NGJPaW04dGo0?=
 =?utf-8?B?OWJxTzQ0UkpXdTFpblRxUUx6TFVxNkFMK0YvRVdDV0NxK2s5VjZ6SThMRXF3?=
 =?utf-8?B?MU9ET3lrOVoxdk01WkI0WkxSWWhiZGhEejhHblhoMy9YcmV6c3N4aXlTbXc4?=
 =?utf-8?B?a3VTcXNZSTd4aHd0Y3ZRQ3dIRTRVTUh2UEkzTnlWMzRvQ0dYRVEzMkk1OGJE?=
 =?utf-8?B?RVpiYnF2Y3ZSRFd3NHYvam52b2lyK21rYnA3Y01FQWNEdUx6c3JwVlZtUFJC?=
 =?utf-8?B?NDUwZE95MmNJZDdvR1RNOElwWk5hNmFRQThZT25rMXZjVWw3Q2pod3AvbUMz?=
 =?utf-8?B?T25hWWlHUHZQRTNUMDNtS1lRR2MxT3BaQXVYVHNqNnFJVGpvV1BMOFMrdysy?=
 =?utf-8?B?VEo4RXJuR0FSNEJGdTZlaUxBZlVyc09ob29CS0ZIVk5Wek5rMHdKOXV4clV6?=
 =?utf-8?B?TEtUMkRUek00MnJMREYxYk45ckRFWUdpSjZLSFpsbnhMaHI0NU1hSkh2TXpr?=
 =?utf-8?B?RkZFTHZReGUxRVVWcngvUUZmRmFPMWIxUGpNUkFhRHhZK3luaTNXdStzWXBY?=
 =?utf-8?B?c1dRVVpNL0MwNndlRFVlNUN3ODdBNmtwa1pmVjUwLzJCU2cxY0FzZjkxNzJY?=
 =?utf-8?B?ZldIUzg4WCtpNkVBN2d1YUlMejVYRWNPUC9SU1FxS0JvZHc0TjB2S0JhUERR?=
 =?utf-8?B?clFFcHVjQWtlSWxOWHM3cDJuQ1NIR25xYjdQWEZCbDNIVHIrY1ZBODcrdm5j?=
 =?utf-8?B?TEJoNUFjbW8zeFhhTUJ1UGR0U0RhcnBHMTZCMytPcWg3K3dFd21ZTEhMM1pW?=
 =?utf-8?B?ZUtxY3k4cGZkSXZsYmNFOHBnREh5blBsY052NkxsNTZScVZyWmIzejBMVmpU?=
 =?utf-8?B?My9ZVHFrRUZWbW9oTVhhYUEvMXd6TWh3Uk9pSEpuWElqbjBpMnBJM0dDNWpZ?=
 =?utf-8?B?MUQ4a1JZZVc3Yk1ma252NUdKb210bFhGOFJMOVJ5TnN5NCt6enpOeEhYMmts?=
 =?utf-8?B?b2dGRGNwRGJWNC9qSUcwUmkzV1o0YTRLTkhka01XcVllbDlxdEx1NFhXQWdY?=
 =?utf-8?B?UnNRVzV1U1c1S3FQUDRhRlYvR3kzbUY0bWF5N3pKdCtqUWo3clJXM3MyYzFi?=
 =?utf-8?B?ZmRsQ1lpMXdnbE4yb0dUUStQTHlmdmdJMDhuNWlaVzh1SVBwUUxiQ2pnbmpt?=
 =?utf-8?B?U1c2cElKY2M3QXhMYW9KODhzUGNJT3NuNkhaUlJBdEFtR1o2VkFYL2tiWUtB?=
 =?utf-8?B?UFZ6QU1hZEQwU3RSTEJsTXR3bjJoampNMzFIWDltY2Y3dHdZQXZydGtyUHJw?=
 =?utf-8?B?RUhBWU5sZWVURng0TXp1K0hnQmtNU040N2YwUDloSEtuSzZLSndXbDE3NnVI?=
 =?utf-8?B?ckV4eHBodXMzT01YSEhGQzliUTRwWVNsRlEvTVFaT3B0b1ZnTDZyM3d4Nm5Q?=
 =?utf-8?B?V2kyN0R4b0tHMXlMeE15VkpLWDMxajlBU3c0cXJTMTlQVnI4Z3lNQ3doYmlQ?=
 =?utf-8?B?SlpLbUFuL1hGMVZ0SXFDQ0FEclEwUmd5eTc1cThYWEtlNE5xWXhUVUtBQUd1?=
 =?utf-8?B?b1M4RGxBNGNkNWMrWldmZmczazJlT1JpTHAxd1ZkamN0UUtyWFZwL1pJeTMr?=
 =?utf-8?B?UmJqVWdObFpXK3pOYng2cnBFZFNvdXdORTJBTnBHc05IcnhDc0Vjb2ZCbTVV?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb2d9129-0e91-483e-6b54-08ddcfc27c61
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 23:40:37.6060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qpWrVR1r5nljuANIW5Hzbc59eeZmntlbdgE/YnpQTjSGJw81obhpmLVSWhYipujZGBqSkb7NudKGXhYAD2iNtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6564
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

There are multiple comments, this reply is focus on 1 topic, see my 
comments below.

Regards,
Zhanjun

On 2025-07-29 8:27 p.m., John Harrison wrote:
> On 7/21/2025 6:35 PM, Zhanjun Dong wrote:
>> Add support to output GuC log init config (LIC) in LFD format.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_log.c | 204 ++++++++++++++++++++++++++++++++
>>   1 file changed, 204 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/ 
>> xe_guc_log.c
>> index d2256773aaf3..609a9fd5ba0c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
...
>> +
>> +static int
>> +xe_guc_log_output_lfd_init(struct drm_printer *p, struct 
>> xe_guc_log_snapshot *snapshot,
>> +               struct guc_lic_save *config)
>> +{
>> +    int type, len;
>> +    size_t size = 0;
>> +    char buf[GUC_LFD_BUFFER_SIZE] = {0};
> This will add 1KB of zeros as a global static object. You should never 
> give large arrays an empty initialisation like that. I recall someone 
> once doing that with a 16MB array and it took us ages to work out why 
> the driver was so huge in debug builds!  Also, this is putting a 1KB 
> array on the stack. Kernel stack space is limited and you should never 
> put large objects on the stack unless absolutely necessary. Just use 
> kzalloc() for this.
> 

I agree with you for static or global arrays cases, which will cause 
.bss, .rodata or other(depends on platform) read-only segment increase, 
that's because the static/global data is initialized by loader, loader 
copy data from .bss/.rodata segment to memory, that's how it works.
While for this case, which is clear local stack memory to zero, that's 
not load's task, that is compiler's job. Compiler will generate either 
memset call or machine code to clear it to zero, for example on X86, 
disassembly code is:

xe_guc_log_output_lfd_init(struct drm_printer *p, struct 
xe_guc_log_snapshot *snapshot,
  501:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
  508:	00 00
// I set GUC_LFD_BUFFER_SIZE set to 0x258(decimal 600), compiler has 
some calculation and make it 0x268
  50a:	48 89 84 24 68 02 00 	mov    %rax,0x268(%rsp)
  511:	00
  512:	31 c0                	xor    %eax,%eax	
	char buf[GUC_LFD_BUFFER_SIZE] = {0};
  514:	48 c7 44 24 10 00 00 	movq   $0x0,0x10(%rsp)
  51b:	00 00
  51d:	f3 48 ab             	rep stos %rax,%es:(%rdi)
		size += xe_guc_log_add_klv(&buf[size], GUC_LFD_BUFFER_SIZE - size, 
type, config);
  520:	49 8d 47 10          	lea    0x10(%r15),%rax
  524:	4c 8d 34 04          	lea    (%rsp,%rax,1),%r14
	index = xe_guc_log_add_lfd_header(buf, buf_size);

Data cleared by instructions, there is no access to RO segment.

Local buf={0} should be similar to a memset call. If you have concerns 
about support of compiler/compiler options/processor combination, let me 
know, we can change it to memset call.

About the size, I see warning of stack usage is more than 1K, will 
reduce it to 600 or 800 to avoid the warning.
LFD header is small, 600/800 looks good.

