Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B1BD0BB46
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 22:40:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA3A10E139;
	Wed, 23 Oct 2024 22:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hA0rdyEj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E425410E139
 for <Intel-Xe@lists.freedesktop.org>; Wed, 23 Oct 2024 22:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729723252; x=1761259252;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bilAcUMCuLYIZKqvqbCgwkt1siGPF+/kdNjPtPPxmYk=;
 b=hA0rdyEjAIkzATZqsSii0RATkrudkh1Ij71tcULXukfSYJrfWIZfYDFX
 /g0g+2pDJPHHyho7JYALMRAYBi8/6HQ5gdVoW7ZES5JnwNNnKGA0c9mtM
 ht4f23m5mmCqwPSvCOugtx6HTizLwGNLZnqoKy0cVNwC9/K01aDDWpPzm
 b9IfAs/dPPnvMY0OTFDC57Dtss7Cc3BtAuP4UHeT55T/EXPc2Szcm3Rnp
 uaEFZChAoSuGf+xMdjHU/fELpLvXLIjVNJvTVdVckgbi4TCQ6L1pyZ++f
 Fo9iweuUl2t4CbVTEtjWDJ3gbceWLs251SOTaKOjvR0o8Ec4DbdufoQ/w A==;
X-CSE-ConnectionGUID: Kje1mwTSRmOrxDoxpfoHKw==
X-CSE-MsgGUID: vj/Qgoh1T7KFXjuhPK7gMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="46820891"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="46820891"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 15:40:52 -0700
X-CSE-ConnectionGUID: aicwEkCERIyBOLIUQoqdiA==
X-CSE-MsgGUID: ghMz7FH/RzODelW+WG1W4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="85191817"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 15:40:51 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 15:40:50 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 15:40:50 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 15:40:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7clGrSoffNJcTomAEY4zGX54LbABjkgueUVuJeVXIp9TMcKpep1bTAMBrlesiX8lrTlc+yPgfFH/5pwvu2GA68JzHRIKdxbcZAgijxUuTsAhiH6wAJw6YBjdwBJspZ8+VSgFis1EF5kjKM1Av1Gu5AubXY5OoZFYAnAt/bGuZgyvZQOnURAQNlat8VqbfhIYw92BNl/71MPV/GswngRdjfujQfdhggY2GM8oDGlI/zF/yMHA/BU9oVOoJAKq1Xx3sMnNGN3r2QTTHA4c+WLhF2XWl1YCOIYO3Sr/O9/wUkiZR33yeisqeIsY/MAxmRnB9J95K5UNsMvC5gXve9qxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HYRw7PsvjJB2x52V0hTW0VEMeB8C23AiL2IOMyvRP4=;
 b=bbG4AjVIPg5LwlSiSfW6KD7n+Chlx8Q8pptO28BhZpbUFI5XfZd5L9Jnsf8juALrXk+6jAK/GtavBLe+C2gVqNJNHsF8D6lshjecIO3jBsBNIZFbfIm3WHs4J+NyDGiCh+E1UUYIKcMg9kC6pWBgmvBes1V9vYW9A4vz0vIVyALxBne8+ejx/PDNeR26yVuRhay/9xNcbSez62H9GSJI+3xXg4XlwqsPnrCJcjjTny+5Wc3zCKwiWGmfGnyYzTDrnF9KCEAimqc2On4yOWwPgDBiTdQOx+S+FlUI7VFM616NxZ7HlxTO7yutQUhCMefq+p83qfsgS57C3lwLAoZnIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM6PR11MB4657.namprd11.prod.outlook.com (2603:10b6:5:2a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Wed, 23 Oct
 2024 22:40:48 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8048.017; Wed, 23 Oct 2024
 22:40:48 +0000
Message-ID: <0a1d002f-b6df-46fe-935c-3ab1504affd7@intel.com>
Date: Wed, 23 Oct 2024 15:40:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Separate full CTB content from guc_info
 debugfs
To: Matthew Brost <matthew.brost@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20241023001736.1766523-1-John.C.Harrison@Intel.com>
 <20241023001736.1766523-3-John.C.Harrison@Intel.com>
 <Zxl2Bj56VnzU4S2n@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <Zxl2Bj56VnzU4S2n@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0355.namprd04.prod.outlook.com
 (2603:10b6:303:8a::30) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM6PR11MB4657:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e5c9c65-56f9-4e0d-6d7d-08dcf3b3bd25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWt5bi9La093dGl3dHQyYTFhWjAyZXROS0J1b1p6TStUK1JHQkx6Mjd4Mmxn?=
 =?utf-8?B?SkQwY2xzTWhGTHFYc082QkE0WnFmSGl3b2UrakNHTTU4WDdyUGZxYnlqSS84?=
 =?utf-8?B?ckN4Rk9iSldWRmhKRVBUT0tNeXdYb3Q3Y3E0WnQxQkNkVHJ2YjJNRDhQc0lZ?=
 =?utf-8?B?cGFBbnFNalQxa3I5WUpOdGV6cWVwU1BIbzErbjRGVkxJTGkycUwrTmhXclFy?=
 =?utf-8?B?Z0RhbmxqYWUrVmhQOVV1RmRzK0VUV1JGTXhIWmFrZjRWR2t4dDdvQXd3T3FW?=
 =?utf-8?B?NlUvQ1pSSVFTS2tGdVhxZm10OTNzd0xsK1BDZTMwRjdFN2tlbDI1a1FHa255?=
 =?utf-8?B?MHcvcWJPVmNmcjlZWDk0ZlljT1hVcFI3ZTNMY2NUenQ2QUl1cnVkdFR1WElh?=
 =?utf-8?B?dUxMaThsTzEyeFR2VmZlUENGeStOcTQrUGx0M3RCWCtYWkpaNzZTcFBUQ25p?=
 =?utf-8?B?T1crTkR3Y2dPbGVpMkRDTE1ocVhoREtwaFkvanlsVVkvN3FncmxGc2wraVJL?=
 =?utf-8?B?YmJJS0E3WGt4dWw4WlVRTS9sVzNSejA4cyt4L3lRdkI5ZzhLL21malB4L1VI?=
 =?utf-8?B?a3lRNGN3ajRvSmxyMDZtTmZndVFXYTdRclUyT3YybForVmpzVFNBUlp3cUJB?=
 =?utf-8?B?V0lMME81eU0yQXo4b1Y0ZGNueVloRzVJbW9lS2N3ZHA2SE52eVpneXk3Sy84?=
 =?utf-8?B?Rm5laUJpOEU5MTVxNmRxSDlKc2Vjc3hNUzJuaHRDMzNMejJVN1NkQ1BoUldO?=
 =?utf-8?B?bFNRcmNCTHdsaVcrN0Zkb2dYNWgyTVU0cVFrMEtXRFVCK000bXZxK3RRVVdj?=
 =?utf-8?B?ZkpCbDRkOXhzU29PaUdyUUNvbHlLS0VudTUrb0xzUDZuR0JlZk1yTXVvaitj?=
 =?utf-8?B?VncxbnhRUnlST3U5N2NKZ3E4QW5ERGNuUGkrZnh4SzlNQmVtMkxDY1Q4Qkx1?=
 =?utf-8?B?L01RbEorQWVJSjlyajBZcEU0WXFDZU5VZlBEYURLTGpvYzN0SjljN2ZJb0lK?=
 =?utf-8?B?Y25UbE5kMm1qZmJ0dkgxR1BGN0Q4N1BKcWtLWVZtMmpKakxrRDRtMzgwNzd0?=
 =?utf-8?B?M3NPc1E4em0wY2dNeGlseTgvYTFJS3hVUldTZVVsSnNNbWM2dWl2S0dZa3l4?=
 =?utf-8?B?WXVNL3RzUForVlpZR1pKbjRrVHZLaTl2Y01kZmhtMi9SNzNSODJKQVVUbFhz?=
 =?utf-8?B?dE1QUmxlaERtSDM0YW9uZGdWKzFlajBYQlJKeGk4MXJGKzNScG1Oc1l3MGww?=
 =?utf-8?B?eFcxVUhpaWRWc0xQelJUVHlXa3pqUWd1ODg0S0JmSVBkK2NVZTQwSEtZY1N6?=
 =?utf-8?B?S2NLRUVSWW52YVhrbVdGRW8vVXhUWU1RczNjRmh2U0tlMXd3WFRQbytrUTBo?=
 =?utf-8?B?d0FUZXpENDVkb0pCR0M3bjBEOEZ4Y3hkT1FQcEdXV2I0dlFWYm1remxlbVNk?=
 =?utf-8?B?WjJCTVFQbUUydGFOeDZNWmZ6N2RPZ3ROQVpuYk8zek03SVRkZEFVN016Kzha?=
 =?utf-8?B?MjIxSWZVZ0lLZFMrdldVbDVMZTl1THdiTE5OdlcvazhPdVY0Z2x2K0d1cHdK?=
 =?utf-8?B?alUzZTZDTk5BVjQyb2lDaUhZSXFVK1VRWE03djNwTnBkOXF3NGJOaGhuM3Bi?=
 =?utf-8?B?eG42d0ltNXB0bjFGcnliYjBjY0Zpb2pTYm9HSzdBVVQ1SXZPMG5aNTdSUVFX?=
 =?utf-8?B?c0ZOWVo1UDJhL0lHUjZQc1JtaHNUN0o4ZEVYek1LOGU0Vi9VamRkdDRMd1o2?=
 =?utf-8?Q?CwaT88W4BermpZgqEGvRQwfgrN0ta4EhyXsKNVF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHFhR01DdEZWL1o0YzZ2R1ZqN3NRcUdFUXhLYlZiMmZUWXptSGVFcVRLS3V1?=
 =?utf-8?B?WFZ1dnBTMHNYdTRHL3FKRUlmTHk4MktVaGhRZmZOR0xTakliY0Y1UHhpY0l0?=
 =?utf-8?B?WWNMV1FST2VGeFlHLzZVWmhKVkpKeFFvaUNSYnJ5VVpsSnpWY2NGeVR3Nnhu?=
 =?utf-8?B?VnBNbzVMajhvV0gvMUdtZUhOQ3UwOElUYjd1Z2RTb0g5ZUplOTRNbkR3VE9k?=
 =?utf-8?B?Z1lveVc2UHloN0pKQkVTZHlLajlPTEU5WWhkd1Q4ZEtDNTdLTFExSzJvMk43?=
 =?utf-8?B?SEptM2p6MEF6V1p6Z1FyRG1OVnlVYlNvL05DNzVUaVBVS2R6aUw3NlVBS2RD?=
 =?utf-8?B?UE53Snhja1BVMFNhWVdpOUtWcFJxd0ZTa0pOdlNWTHBLdWdoNm1mcjJUV1JQ?=
 =?utf-8?B?bFp5Z3ZGaXhkTWxnM2IvMjBNd3JNMzN6MHpZemh2TkZYLy8xekN2WDZSUlo4?=
 =?utf-8?B?WW1qMytlNkQ0UmtmODFHZ0E0bDRqUzJKZkZwLzBUV003SHBGa1NmK0NkSmlt?=
 =?utf-8?B?R2dIcUJpSWtpbFFSZ1d1QitmZ0g0ajVmY0tnWGk2ZS90eEt3Sm5OQzZTMzVF?=
 =?utf-8?B?Wng5Y3FtcXNVQkNhZm5uRHFRT29HRFRqRFJRZU4rNXJRWC9kd09KUXFBYXoy?=
 =?utf-8?B?eWxvR0dMb3gxZHc5ZmFkRHRObDJIQnFZQktLOHM5b2xoR2FSRUFvM1k3TE5U?=
 =?utf-8?B?NHlIaFJRdng4aWVLeHdOSGpVdWVONVRNL0l1VlVnQm0vb0kwc0kyVFRvQjF4?=
 =?utf-8?B?U1luTXlVUHVyK3BEdWZZVTBhNDdRaVNLNUh5V0JWU2Noc0NPb24rNnloK05M?=
 =?utf-8?B?djM2UGljQTcyc2xEZE10a1RlSmFGaVZ2SUplU0YwOVNmNFhaV0x1U3JERFRT?=
 =?utf-8?B?aXVLdjd0VHBEL1c5djgwQmtmNlFKMHZ0Zm41WXVqb2cyTUJMekt3U3d3YmV5?=
 =?utf-8?B?b3RHbFltNXVmZG1yaUx0d29MZVBPNElGQkpvWUkyTUZHYThmSFFodTkvMVMv?=
 =?utf-8?B?bC9UakJnN3lEZVlUd1l6MWlyeTlDeitMYnMvNWNKQlBjT0JHZDdkckdhQmtB?=
 =?utf-8?B?cloxU3lkakxrYUNGWFBrazh5Q3lOU1k0cWpERW5YVFMrSXMwWWE0ampYcklh?=
 =?utf-8?B?NTE4Q2R6MlBPbUlnS2I1Ujdsbkp2UnlFWmlVSHBsbXZUQ1hINFpJR29QbktZ?=
 =?utf-8?B?MWhTWXNMWFZ1cThCUVpPQzJFbytmdEExbzk2NVVzcDVOaERsaEJBUk8xMXg1?=
 =?utf-8?B?RU5rY0hvdG5ua2p1Ukw3ZmJzOVluaW5QTXI4bno0aldueFJoMmwzbjFPVmc1?=
 =?utf-8?B?QVp3UkpCNG5ydDYwaGJCYjByT1dTY0psdGl6cXIzcjd0bTJPUTVsZm00TzAw?=
 =?utf-8?B?b3FSWTBRbGJ5ekxmR0hRMTNWdmdUZ0pGVThEM2pnRzFablFXYW1zSnVUdTVB?=
 =?utf-8?B?V0RGK0RhaUs1R1MvTzQrcENjSUxlK0NkSlVQb0VWbTNxTXhCcU5rdWg2cVFE?=
 =?utf-8?B?VnhIajRtbnIxVytoUmRoNXBJZWFiOFJhdW5TRnExaEJjYmxxQnVKZDdUT2h0?=
 =?utf-8?B?TUdvalhvNlEzakNJb2xaa3ZOajFJU2hVYUhLOGU3UHZpK0JzMGhaWFUyWXVM?=
 =?utf-8?B?UEYxVHlBYUNmUXZVdWpRYWhkTXp6MUZESW82cHpRZlFoemlIekdGVWhOWUZL?=
 =?utf-8?B?WTd0enFYWTlBVmtSb0RIT2VIOGNEQkNFdFJnZGU2YitEbFA3NEJ2Zzg4LzJJ?=
 =?utf-8?B?UXZmYWJ2Zk9NU0Nkd0pCWmRZbEJuM1c0ZG9jblpMM0Z1bzI0ZHN2dTdyKzBR?=
 =?utf-8?B?alErMXpBVlVoWjUvSXlqRVlwREtZRzlTV2pXOFpCSmtWRDBjOEVYY3B5M3dE?=
 =?utf-8?B?a1Jad1czcTNDcXA5SkE3eHpGUDUvQ3JOQUU5aStBZ3NtYWYvTGtKQUZwNGxp?=
 =?utf-8?B?dVdIeHdIR0RaaHMremNaeGJidEZxMUFTM01JZXpIL085dDI2dVBhUm51ZEsx?=
 =?utf-8?B?SmpsQUdadysxNitoTzZPcW1zaUh2NWs5QzJyTml6VVE3MzFlUTZHTFF0NnpS?=
 =?utf-8?B?OWc5MW9JeTR0RTZxSm96Ung1VXVCZWRad1NvUVJ4eDhmaW9ESm9wT2dQNVhN?=
 =?utf-8?B?d1FDT1pSeURSNVY1emhJWk15aUc3aGh6UnBjakRKUEJHa0ZOaW1hVEkzMCs3?=
 =?utf-8?B?RHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5c9c65-56f9-4e0d-6d7d-08dcf3b3bd25
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 22:40:47.9487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GBOJWkZ9p5Pt2mNtxJLJ6a+cl0q0euRN5F+EWgyWmW60E9KlPqzdhFtoqqKET+Ab5sJcPdR5QTOPx6QoiIr7F7fGclnWpDsP2vz5kefvKw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4657
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

On 10/23/2024 15:17, Matthew Brost wrote:
> On Tue, Oct 22, 2024 at 05:17:35PM -0700, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The guc_info debugfs file is meant to be a quick view of the current
>> software state of the GuC interface. Including the full CTN contents
>> makes the file as a whole much less human readable and is not
>> partiular useful in the general case. So don't pollute the info dump
>> with the full buffers. Instead, move those into a separate debugfs
>> entry that can be read when that information is actually required.
>>
> I did notice this when using the debugfs entry and yea a bunch of asic
> isn't all that helpful in the common case. So change LGTM but one nit.
>
>> Also, improve the human readability by adding a few extra blank lines
>> to delimt the sections.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_devcoredump.c |  2 +-
>>   drivers/gpu/drm/xe/xe_guc.c         |  5 ++++-
>>   drivers/gpu/drm/xe/xe_guc_ct.c      | 25 ++++++++++++-------------
>>   drivers/gpu/drm/xe/xe_guc_ct.h      |  8 +++++---
>>   drivers/gpu/drm/xe/xe_guc_debugfs.c | 14 ++++++++++++++
>>   5 files changed, 36 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>> index 8b0ea77661b2..5d7d8192d6f3 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -267,7 +267,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>>   	fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
>>   
>>   	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
>> -	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
>> +	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct, true, true);
> One bool, not great. Two bools, yuck. Anyway to refactor this without
> bools all over the place?
It seemed excessive to create a whole set of flags. But given that this 
is the only instance outside of the GuC internals, it would be simple to 
create a wrapper that hides all of the internal only params.

John.

>
> Matt
>
>>   	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
>>   	ss->job = xe_sched_job_snapshot_capture(job);
>>   	ss->vm = xe_vm_snapshot_capture(q->vm);
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index b065bb9973e9..fcb540003e53 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -1187,7 +1187,10 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>>   
>>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   
>> -	xe_guc_ct_print(&guc->ct, p);
>> +	drm_puts(p, "\n");
>> +	xe_guc_ct_print(&guc->ct, p, false);
>> +
>> +	drm_puts(p, "\n");
>>   	xe_guc_submit_print(guc, p);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index c260d8840990..352673b6974a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -1607,7 +1607,8 @@ static void g2h_worker_func(struct work_struct *w)
>>   	receive_g2h(ct);
>>   }
>>   
>> -struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic)
>> +struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
>> +						    bool want_ctb)
>>   {
>>   	struct xe_guc_ct_snapshot *snapshot;
>>   
>> @@ -1615,7 +1616,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool a
>>   	if (!snapshot)
>>   		return NULL;
>>   
>> -	if (ct->bo) {
>> +	if (ct->bo && want_ctb) {
>>   		snapshot->ctb_size = ct->bo->size;
>>   		snapshot->ctb = kmalloc(snapshot->ctb_size, atomic ? GFP_ATOMIC : GFP_KERNEL);
>>   	}
>> @@ -1650,6 +1651,7 @@ static void guc_ctb_snapshot_print(struct guc_ctb_snapshot *snapshot,
>>    * @ct: GuC CT object.
>>    * @atomic: Boolean to indicate if this is called from atomic context like
>>    * reset or CTB handler or from some regular path like debugfs.
>> + * @want_ctb: Should the full CTB content be captured (vs just the headers)
>>    *
>>    * This can be printed out in a later stage like during dev_coredump
>>    * analysis.
>> @@ -1658,12 +1660,12 @@ static void guc_ctb_snapshot_print(struct guc_ctb_snapshot *snapshot,
>>    * by using `xe_guc_ct_snapshot_free`.
>>    */
>>   struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
>> -						      bool atomic)
>> +						      bool atomic, bool want_ctb)
>>   {
>>   	struct xe_device *xe = ct_to_xe(ct);
>>   	struct xe_guc_ct_snapshot *snapshot;
>>   
>> -	snapshot = xe_guc_ct_snapshot_alloc(ct, atomic);
>> +	snapshot = xe_guc_ct_snapshot_alloc(ct, atomic, want_ctb);
>>   	if (!snapshot) {
>>   		xe_gt_err(ct_to_gt(ct), "Skipping CTB snapshot entirely.\n");
>>   		return NULL;
>> @@ -1704,12 +1706,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>>   		drm_printf(p, "\tg2h outstanding: %d\n",
>>   			   snapshot->g2h_outstanding);
>>   
>> -		if (snapshot->ctb) {
>> +		if (snapshot->ctb)
>>   			xe_print_blob_ascii85(p, "CTB data", snapshot->ctb, 0, snapshot->ctb_size);
>> -		} else {
>> -			drm_printf(p, "CTB snapshot missing!\n");
>> -			return;
>> -		}
>>   	} else {
>>   		drm_puts(p, "CT disabled\n");
>>   	}
>> @@ -1736,13 +1734,14 @@ void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
>>    * @ct: GuC CT.
>>    * @p: drm_printer where it will be printed out.
>>    *
>> - * This function quickly capture a snapshot and immediately print it out.
>> + * This function will quickly capture a snapshot of the CT state
>> + * and immediately print it out.
>>    */
>> -void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p)
>> +void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
>>   {
>>   	struct xe_guc_ct_snapshot *snapshot;
>>   
>> -	snapshot = xe_guc_ct_snapshot_capture(ct, false);
>> +	snapshot = xe_guc_ct_snapshot_capture(ct, false, want_ctb);
>>   	xe_guc_ct_snapshot_print(snapshot, p);
>>   	xe_guc_ct_snapshot_free(snapshot);
>>   }
>> @@ -1776,7 +1775,7 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
>>   		return;
>>   
>>   	snapshot_log = xe_guc_log_snapshot_capture(&guc->log, true);
>> -	snapshot_ct = xe_guc_ct_snapshot_capture((ct), true);
>> +	snapshot_ct = xe_guc_ct_snapshot_capture((ct), true, true);
>>   
>>   	spin_lock_irqsave(&ct->dead.lock, flags);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>> index 338f0b75d29f..01d3b0183bf0 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>> @@ -17,11 +17,13 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct);
>>   void xe_guc_ct_stop(struct xe_guc_ct *ct);
>>   void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>>   
>> -struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic);
>> -struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
>> +struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
>> +						    bool want_ctb);
>> +struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic,
>> +						      bool want_ctb);
>>   void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p);
>>   void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
>> -void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p);
>> +void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
>>   
>>   static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> index d3822cbea273..995b306aced7 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> @@ -47,9 +47,23 @@ static int guc_log(struct seq_file *m, void *data)
>>   	return 0;
>>   }
>>   
>> +static int guc_ctb(struct seq_file *m, void *data)
>> +{
>> +	struct xe_guc *guc = node_to_guc(m->private);
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	struct drm_printer p = drm_seq_file_printer(m);
>> +
>> +	xe_pm_runtime_get(xe);
>> +	xe_guc_ct_print(&guc->ct, &p, true);
>> +	xe_pm_runtime_put(xe);
>> +
>> +	return 0;
>> +}
>> +
>>   static const struct drm_info_list debugfs_list[] = {
>>   	{"guc_info", guc_info, 0},
>>   	{"guc_log", guc_log, 0},
>> +	{"guc_ctb", guc_ctb, 0},
>>   };
>>   
>>   void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
>> -- 
>> 2.47.0
>>

