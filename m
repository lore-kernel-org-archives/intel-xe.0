Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97057CAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 21:47:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B7310E870;
	Thu,  2 Oct 2025 21:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FHEvpUWO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEBA10E867
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 21:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759441651; x=1790977651;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jmc4+P+KUiRH2diTEPU3aB42fO5Peec3in7w06mWknU=;
 b=FHEvpUWO6KD2kbBi+fm4SXM8xuLwuhIuFHiHcGay24xiBlXtM7O31Da8
 HUmTA84m3V3R8PPixwdzolDZez1L3FN+paBaRRB/SlOopyRPS57zDSp53
 6NVNvGqycJm68QkqpL6cquF4I+ojTKt0AFCUxrtL2XBzDHVLypCrm86t6
 x90LytoghBkC1sTvoSCHDI9Vo3Tfx6DdCgx/dE5j06qN8ITTiDAx7daHT
 E5fcsQWw2SZWIMlEo/d8YYZu8PBFl3KMQWWdhH6yzEX9QaTQJc0fV0zg7
 dlhGrdnqH74OG9WOilX/Yd0HSBrxD9cfA0slRTdk5hXelGEoZAx9atQH4 w==;
X-CSE-ConnectionGUID: Bc7fd6VmSpW/vaFVcQt2Zg==
X-CSE-MsgGUID: +fyYQKrpSeyitVagDz5bgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="65371185"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="65371185"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 14:47:31 -0700
X-CSE-ConnectionGUID: CL1ePT2lTUeRWe73pRRSiQ==
X-CSE-MsgGUID: BmKuaOFJTfephsOzaFddcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="178426422"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 14:47:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 14:47:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 14:47:29 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 14:47:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjaOOrVPGuBwKH2ZlTTuCe0TIvAYpni+FJBW33GUi9fQ4+Vb9kSRrsJ5snLutpUA1oeoBOrdy5kVjrF3hcVcouQnbbmZLUv8Eqkn+pw7wjjq0M8eGjn59gUfdCZPsPdAVsCGckjKhaaQaDb2aqStqgZTjtZAIPfL2ThVhn+8FDPoMHNAfYG9gsLEmN2YWQNBw7kLV0ry3niXkV7bPK/zdCBPqUjMUoY7J36MlxQnj5RPyznsOEiUPQ07DwsGkH9atRgokx+jR7rp8Wuuk+Oc6SK3tkWlnFbhdH+sKfqVIV/ULWS02Ffz9v07OIgih8bzSimicrcN6UMgBF4R5XE8Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+q/TNZMLLsc9GwjB+AcB7RrxhegKPlgWre3cUqAiAQ=;
 b=QxRUZJ9FmbIaw8aMDuwLsrzaaqkLHHvhUvc0lyYhBSok1LPPM56UM2i41xXNnwsLIQKVz4BV7HS4lY3KMw7ZzAB+pRTXhIal96z50gu9XFiokzU+gHBdmrjbcSpTnv2g4Exn8c+eUWXtBD4ZLQ0R2u8vKwxojY1RhGgIVyVOIQ6UoZ2miRofJ2/avoAwO/904R7nYSm43+1+g3pShrLPAu6HTz82rHtIo8mGWBMrYgxoDXyxONBMkBEL/16ShrrhXwb9K/LRgEHVfLIMSsSqJzgSEcWrYWOJAWwYbH2jyTaTluurt/11nT0zvtKm7t8klyY/hOPAF2t6oTcT55Lq7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 BL1PR11MB6027.namprd11.prod.outlook.com (2603:10b6:208:392::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 21:47:23 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9160.015; Thu, 2 Oct 2025
 21:47:23 +0000
Date: Thu, 2 Oct 2025 23:47:20 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/6] drm/xe/pf: Split VF FLR processing function
Message-ID: <5id7hugw634glf3y5xtszoebcady4ksnth3ps23xhsw2si2i46@7u3x5evuejpo>
References: <20250930233525.201263-1-michal.wajdeczko@intel.com>
 <20250930233525.201263-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250930233525.201263-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: WA0P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|BL1PR11MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: e0dbd555-b6f6-409f-0020-08de01fd4554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFF0Vlk5bWkydnhxamMrQXNHalBFRWNFWHJMNFlDS0JoeUgwQWRScVdoZUMx?=
 =?utf-8?B?T1NrU21pMkh5dWVFbjZlOWQrQnJ3a0RuSHVncjBXREJGakFIL3JTNmJGUlpz?=
 =?utf-8?B?NElaOFVranZ2QlFaS2JuU1laSTQ5WXVBc0w5OW5MNEtWalNsYXF4TWtqTkpQ?=
 =?utf-8?B?aEszeG1EREI0bFZIN2NVMW1qZmpvMXBmRkRSdjFnRDJyaDVMN24vZ096a3BH?=
 =?utf-8?B?TEhNdGdxaWlwR3Eva0wyMnh0blZUc0VmR0pPUlpEd3p6TnJkTjU0M0IzRW5w?=
 =?utf-8?B?ak4rRllvcVVJTXNUenpESm9zSDN5VlBYVEg4dzFoeTRENkoyUG10RXV5aWJR?=
 =?utf-8?B?ZGtJQnRPOE5La3dLTitWQlh0S1RucGhxdFpZUi9pTzNXa3BMOWtyaWZCTTZs?=
 =?utf-8?B?SjVjWUZnWm1jcVNLbDB6c3JhSzR6bHJObUtibEtLbFpSOWtvUlNocnBmQ0xt?=
 =?utf-8?B?Z3EyY2tqUnR6dVJOUnNXaS8wRURtRVpVRWU1ZTdSRUk5RVpzSmNqaENFSjVQ?=
 =?utf-8?B?T3NXb3d0TUtLZmdOaWJCZUp2bDM5bzJ5UHZOeWNFQ1dETzRxTHNkdzBERGd1?=
 =?utf-8?B?MkRiUERpMWwvd3YyVzhJaDVBK0dMQThOaEJyOFlVL1BNamcyTFc4azFzUTg3?=
 =?utf-8?B?S1c3ZnpqbXp4TWhENjBMTlFSa1FudmVUUDZTd1hRSHIzZjZDdnZCK1BlcUdU?=
 =?utf-8?B?N1h3bXJUb0dhN2s5a3lnR1BRMWtYTVlOK0ZYb3E2ZzAxVU43ZE8rbGtKRUw3?=
 =?utf-8?B?RnZtdlV6ZXNnTHc3VW1RK2pLZUZKaldhQVJkYnRPdE52YURTbjBhT1N6YWlC?=
 =?utf-8?B?QlkvOXA4Sk9PWmtGZko1WDQzMVNxNm1WODhpMi84UU5qSmlTZ0QvUUhYRmRW?=
 =?utf-8?B?YWhaQXh2c01QNklvaXhlNE1jU242YjNFdEl6bnNFM2ZHSXB6V0daN0Rwem80?=
 =?utf-8?B?VFRybE83MUtITFQrTy9qNm1neENWcVRMQlVraDhOcEJLRytDQzl6MmlWVmhy?=
 =?utf-8?B?ZFpYOWM4Tk0zQTZZK0FFSEp0MVkyQTVURWl4eTZpb2gzWHUwRHl5NU8vUDl3?=
 =?utf-8?B?aHdnM09hYWdhVnNvR1pTejY0c0h0S25LRGw0TVZjR3JsbXJGeG00VjNlTXlK?=
 =?utf-8?B?MDJ2SDNuMWQvb2pzMjJjM29VZUR3V3l4SGFlck9ndWh1UjZ6eE1kSTZGTSs2?=
 =?utf-8?B?WXFEaDZpR0x5UW82QjNubHN0RWhWUEdFcmlla2F0Q2owdGVUTUFYSnFXYWs3?=
 =?utf-8?B?eXNXeVkzWnNhNmQ1bGFBS1dLSk5rdGllcU5kZm02SWlrM1BLZHRSbkpGMVJL?=
 =?utf-8?B?SjhiY29SMkxtdjZMN3pncnlYNkh2M2lEUzdpenptRTVGdlZXbW1wUXQzRXlm?=
 =?utf-8?B?MTRqbHFsZVRQMVVhUjNXQ3FJaGhaTlV2YmNaL0t3QjVPZXNqTUlhSzRHQUFX?=
 =?utf-8?B?MVUvVEFZZ2JSK3RVZHJ3TnJDZVRzckU0aytMQmI5cGl0THBJNWVqbmxOcGcy?=
 =?utf-8?B?S2FJSSs1UGlKU2dXQ2pNaTZBa0JuQkNkQXljSitGbXFHSFYxOXJGK0lET3pL?=
 =?utf-8?B?ekpsckMwNytyenoyeUUveEVKOXE1bVgxV1I2WkRDZE9yZ1JhQ0hidFhuRmJP?=
 =?utf-8?B?dTZsc3pxbjlyVWgvK2xSSm1ZdFZ6eFlGWmx1aW9mWEU2Qkt6VGE5Z0NLbWhQ?=
 =?utf-8?B?bDc3Q09LcGxoTzg0MGhOaThvN2VFUWFESGtDeEl3Qm9jUkZDN01saVFENC9t?=
 =?utf-8?B?OTI0d2RnWXlSREFCSVZYZ1lzeXlZaW9OV2cyOS9acXNLdTJsZVpnUUhiT3pq?=
 =?utf-8?B?MG41d0pqNnlRbUhYMzduZHl4TEVtOFRGR1dQRjhTdjljanRFVzBUUnowMkcy?=
 =?utf-8?B?RUdaOGpBRXRrRlliR0tEa2RnRzF3RUN4NWRRSzBKcTZYRkp5VHhBNW4wOWRr?=
 =?utf-8?Q?HImq8O1bPhia0x8z8pCtt6F8nUkOBVdT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M29qeXlKSFJEcFlGL2hpVGpzZXhYK2ozNmxtNnNRMUhLckhEWVdySTk2YUk2?=
 =?utf-8?B?VjJIMm1zMkZNNFh2eU0xeUpzSHM4NGo1WkEvbDVOSEp3d3lacW9ya3pmZWp6?=
 =?utf-8?B?U0JTaUZGUC9BdGxZTkZIRUh5WEtpUUZoQm5nNGprRVdwVk84Znhqc1BRTWhq?=
 =?utf-8?B?R2VXUlZFY0VZYzdkVkVKZzk1aUxzNHpsWUFvTjBnbVZpUmxsYjNOOGJPc1FD?=
 =?utf-8?B?eWcrVUNGMkhyZkxVcVQvVkVySkdBTG1XRnpVNE9hUzkvcDlsSDFmQVJmT0hs?=
 =?utf-8?B?MkFvcFNjRGxZajRjZTNkWmcwcDFCUTIrWDZQRmJsVWxjQzhPMjlUMGtoUUtu?=
 =?utf-8?B?SDR3YjBKSGJXTVhld2lXT0NxNlJoUVZGWGUrZHFDeDY2dmVOVjMrOVpUSkNN?=
 =?utf-8?B?Z2pHTVdjQTdFeW0xd0hURG5IWmxiOFRReVVBcndrUUkyUFJkclUvZXZjOXcy?=
 =?utf-8?B?NEtVZUJobm5ucEJVNm9yaUUxTUR1SEFGNHZDT3c2L2RXNk5TdVU5TXZvdGh1?=
 =?utf-8?B?aUp6NldNdlBzUVRZMmJpV0diaWJndlEzS1hibUJwK3lEa0xrN1k3eCs4S0xp?=
 =?utf-8?B?VFR0SExwbWdlaXVEMXJIdHlLaDNrR2N4a2JjZEFBcnpxcDZPdHhGRmYvQmZZ?=
 =?utf-8?B?dXNxOGcvN2oyb0JSVk5FekFibW1GKzlqc2d0aWRpb3FqclBreGU1T0c5R2Rk?=
 =?utf-8?B?Z0Jwazd5bzc5YnppTFF5Y25qZGx4eFViaG5MakNpTlhOOS9DWkg0WWdJOHZ3?=
 =?utf-8?B?UWNBNk9ZWWg3bXAxcVc2UDFtTWc0dlFPNDZwV21ocFdMTHB0ZEdtdHpRbmFG?=
 =?utf-8?B?QlVJeFVzOGFhNFFCQnF2SU1jV3ZFdTZLZkFSZnUvemQydTNqSnBIUURCcXht?=
 =?utf-8?B?ckk1TDZkZTVIcHRQRUU1UUZmYU9DVElieEF0c1dKZFQvb0Y4N3Y3RGJibDl0?=
 =?utf-8?B?YlVIUlBEOE9zVjhNMldPWmdZblBZT28vL2c5L2tSVi9EMGthekdBTENpbDlz?=
 =?utf-8?B?alBBRm9mdG5XQ2ZaUkR1eEZYdUxpVG1IY1BFYVg3NG9zVmt3LytCWncxSmxG?=
 =?utf-8?B?ZHFBSFJrb3hzQVFmeEdtMVBWNjN6amNnMzZzaDVtczJyUi9od3NxdEdob3Rm?=
 =?utf-8?B?aDhVUDRiM0YwV1UybGpvYVRvQ1YrRnZUOHBGaFRYS0VwWHhLRDlraUxkLzE1?=
 =?utf-8?B?R1hRcFkrUk53ZDVFbGxVaGRhQ1NWbnNtK1JwbVlLVGFnSTRjd0l6NDBqYjY0?=
 =?utf-8?B?azZXUjVwTC9PcTN0SDlBMm5oM3NvNGcyYjJqbk1HdHJUSGRJZWhUdE0zbm1v?=
 =?utf-8?B?RnJDSkhlYlBNcXJpNy9zVGlDd05IbUxxSTJjMnhZV0lmcXNDYjVWVEkwbk9M?=
 =?utf-8?B?VzJab0lnS3BXUUtoczN6cURjajROVzZFRXl4YlB6L20wblN5L3VabXUrZ0sy?=
 =?utf-8?B?dFlmdGdLNTRkTGJGb3R3QnpBQjVJSEhvYWJZMDNrM3ZlSGo2TWgzejZSeUFy?=
 =?utf-8?B?amJkWGYxbkM5OWRvZHp5dFI1V3QzY1c3U3lLRFlGeVdFSE9yaW0vdkZSeVl1?=
 =?utf-8?B?cTUyaGFUaDI5b3UzVFpTVVJzTEdZZUhYeWRXcGs5Z0F4YTZxak5XYmVBZm1J?=
 =?utf-8?B?MjJhUHB3T1UvOGpLaDczbE9kYkpheEhPdUd1a1RBbThTV29rRlkxRzU0ZzVz?=
 =?utf-8?B?OTlMNUhRdHBDNFF5djR2SWs0QjJYZis4UDNDd2V3WDJVU2hMTXNHZEprczdY?=
 =?utf-8?B?cGlLeU5mT1ZoK1lIUTduUzNhenhkT2V3UUhvKzEydHMyYnd0ZTJNNU82d0Ny?=
 =?utf-8?B?RUo0OUkxc2hTNnp5TGNGTkJ1L2xrcCtYdE5zSzNtQUsrSlZydHIvSGx2WXY3?=
 =?utf-8?B?NWtqdm41SjN3V0pnc3B5aG9SdlhSeTZuZjhjU2I2YkRqd05mSkd0N2U3YzJL?=
 =?utf-8?B?cGpJajNkSW9xVkwxY0plNEpUUEpjSUY4ZXBtTVZpMGF1NnVhbVhvckxObG5Y?=
 =?utf-8?B?Rk85eGw1c2tHMFRPUjRRYktnU29HM0FFSFYyUlhTOGpxalNFUmNWNTYwUnNU?=
 =?utf-8?B?VmRYeFFCbjcxa3lXVGRCR2xBSENkbEtVOVVMYm9LYVV2cFZYS2c0MzRNQVFp?=
 =?utf-8?B?b1BDeXpheW94UDB5QTY0VUdFR0dBc25yQUtaK3VYa01TRnpnMjVocGJxZzV2?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0dbd555-b6f6-409f-0020-08de01fd4554
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 21:47:23.7258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iL7/qOKh380eocLvCyY8fpxVQ6Wv/6uolaKn/Po5T7VK/yOXZJaIrUyaV5qb8fqNN2i66mfA47CTO44pPNCA9VZMBDBaQUoaqHTMCiyOyIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6027
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

On Wed, Oct 01, 2025 at 01:35:23AM +0200, Michal Wajdeczko wrote:
> On multi-GT platforms (like PTL) we may want to run VF FLR on each
> GuC (render and media) in parallel. Split our FLR function to allow
> to wait for GT VF FLR completion separately.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 26 ++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h |  1 +
>  drivers/gpu/drm/xe/xe_sriov_pf_control.c    |  5 ++++
>  3 files changed, 29 insertions(+), 3 deletions(-)
