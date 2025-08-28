Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0A5CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 09:40:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B77B10E95F;
	Thu, 28 Aug 2025 09:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nEjzUtdU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956A810E95F
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 09:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756374054; x=1787910054;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tpkOVeeLRxuSXRrpqgrYBjhTNY2A1NtrKWYvR1CSGew=;
 b=nEjzUtdU/fqoAReskGoMw8qpd1bxDbnD3WYcT21WDtYABJ+o4CqFY5oh
 W0S5EzNKED0Calq3qa5IxSAnOcRVvyPEByOQw1QawcA2HwzQoFGf5+Wii
 V4//EVImNNgGbYR2zpmmdHBOwdRJpep2BNeldA9YOaB7glrMID+0TS1Ut
 5ypyvLxiLYglKJYARPdOFbixe4bhzm/1Sls57AFtp2O/+EYOIZ5EG/nZL
 rYG7wWq37/qO9fAoKOhCpOXsAGav+rQrnivyhF5xY5wR+kBY7ytBvFej8
 C6I3FvV5VFqk1p4zyBYZbGVlKObYVdAqd89TfMqD/Rxt8scGTWP18MtWw A==;
X-CSE-ConnectionGUID: 2AMRk4n6SFmpv7Bih8ifAw==
X-CSE-MsgGUID: Z4T7cFvJTheDX9V+rE9BKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="68911009"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="68911009"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 02:40:53 -0700
X-CSE-ConnectionGUID: 7/F5N92zSmWzorAEW4bGYw==
X-CSE-MsgGUID: IwlXBMnMQ4yRaCb9NEaNkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="175362311"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 02:40:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 02:40:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 02:40:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.45)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 02:40:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOXYTe6S7fhbGfe/ZEbPSVsgb6K4tXPUFoarrIFy6mzljQSWNNKr/Go0En8FCK2uujeVxzU8auyfZerGupqdU2gtDLyEgkVaP++sIhPX1MJalMm1nKCrwq0NY0pOrB7VorT4Q/hgOA0Exl5+zgFbCHD7eCo24D5nX46xH3O1kTiWDNkjhihXw7QV0ZkAbD9QJmrIIMUIPk2QwX+5AM5VFKnDWXk0nIQcW2xfkYOE48EHyc5EOWY36gUBPdt/FkQhJJpEuMwqyf9Vg2u+w5+ZgHtchjp3ephX88L51/Kuuigvd/BDxk9mqN/ZRqDV4VPYXYLNtnqNeKcHnrG7WH2SGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fu95FoF640D6pix6vS9OIYnbCLIZprLuGz6BaM4ZRHM=;
 b=nkiAp696xnT68bxHas2JRXgwRU6uFQE0G+X6o5Hmc7EXfC1/gqHfpjsT+I50LlG7cvS80ZUx5YjwzKmDKBu0yeQ5AjDMJwJlHkqxY/dNo7pqookBP2f2FH3JPw+1yFzzQ3gqFGv5FaQsG4VsYKaximdJbDXKBL1kYljcRJZ/QOTQHYaO2+kGzPc1C1/LFU0GsQcuRJlugHDOLF7wMAMpvAj8tYvglcQY6KjzUxN11Ba0PqYO6LtwOV/jSUSH+2Bo0fkTWuWErheb7RWmitt6ZQE4m4JleRBppvPnXZT0em7dOHraZ89j1/9O1y4aIAEEzvqbvKs0jvSqvqAoxEqb/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DS0PR11MB7829.namprd11.prod.outlook.com
 (2603:10b6:8:f1::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 28 Aug
 2025 09:40:46 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab%6]) with mapi id 15.20.9073.014; Thu, 28 Aug 2025
 09:40:46 +0000
Message-ID: <37b7ff75-8931-4244-add9-02cb0e30e02b@intel.com>
Date: Thu, 28 Aug 2025 15:10:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] drm/xe/uapi: Add UAPI for querying VMA count and
 memory attributes
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <intel-xe@lists.freedesktop.org>
References: <aLAa0ZEWi5mGed2S@stanley.mountain>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aLAa0ZEWi5mGed2S@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::36) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DS0PR11MB7829:EE_
X-MS-Office365-Filtering-Correlation-Id: 486b02f7-1a58-42db-880f-08dde616f6c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUYrL3Jha1lqMU9SMWxWZlVDMmk1VTlBQnQ0UEEzTkxoZG5hVWQybCtWZCtY?=
 =?utf-8?B?QjFvWmpHZ3NzVUUzUDhtWUM0Z2xTd0cyaU9naDR4VHRpQ3hYYmdPeVk1MlB4?=
 =?utf-8?B?akFTUmgvN0YyZWF2WVBGRHppZWlGWUtrb0lxNitQYTR3ZlorQndPVUVSYWxC?=
 =?utf-8?B?S2crUmJKNVQvdUF4Ly95NG9MdDJKV1RKbVhXN05IL3FKRXIwWU1RNFllSExJ?=
 =?utf-8?B?dmV0M2toQkZVVHZLUmwzRlU1VEFVTW0vMXpLS3RmZE1oUFl2UGJoZ1NsV2ZK?=
 =?utf-8?B?Smxyb2l1WnNOajFZeUxhUUQ4WWVVdW9jV1RUc1FKVXdackVwcWQzbmF1Tm9n?=
 =?utf-8?B?dC9IaEdsZTI5ODUvSTV2djhKNnlYUndUSmErMVJJK3BCcW1nODdMNUI1Z1hF?=
 =?utf-8?B?QVlzTnV1ZHBIV05JUU1kS2pmcVdKVWJrZ2lBbHZlWDRHUUtJTFJjUXczTk5m?=
 =?utf-8?B?bDJ4bVdQbXVVdWNuTEM5enJJUnhhZFMrYk5kOGptMkdTenFmNUpKYllmZjNy?=
 =?utf-8?B?azQwbjk3Rk92WEdSMlg1VngxcU9VKzUxYWhsNFF3aTd3VkNua0RZb3ZpZmM0?=
 =?utf-8?B?ZFlxQnQ1eXZhTWxwTktxTnZkRFFwOWtBTHFnaGxMSWoxQnQ2SVp1YUNJZUJU?=
 =?utf-8?B?TXRLVXc1Zmc3eXVvaENML0hQc0dTZ3Z6SkdEZjBKMUZQKzdBRkdwSU5PenZC?=
 =?utf-8?B?Sm94ZENTaVEzcE9zVDdYVExsMjk2VUkvYU1pb1AyK1FwSFB6T3ZIY3E2bTcz?=
 =?utf-8?B?SFMxNi9raXg4b2ZRRncrRHFZSFBEWnZ3U0hwdzVkSlFkZSt6M3FzQlVoTXgr?=
 =?utf-8?B?enJNbkdjT0pWN1BEV0V2Vkg1M2dxbkcyUWNiNXU4b2ZidXdjajFyZHZUbHp1?=
 =?utf-8?B?UlN3Rk4rYXNIc1JPMkMrLzdpUkdNQ3JXa2JVK2t4QkErcENwZC90WFZzK2ND?=
 =?utf-8?B?TTZCa2tUM0tTcHltSG16ODhQdUV3Z3l2K0VxZ0t6cTV5SnZrazgwVmRrSWsv?=
 =?utf-8?B?WGl1Qmtoblk5blNiaWpqSkJiOHd6VE95Y1E1ZUJnbDVBck5OeXZWSEhYV1dB?=
 =?utf-8?B?V0duTmEzV0VtZHQvbDJ0VmxuZ3hBNkhWV0NQeFIyNE5MSGRyaWZWVWlhVXhC?=
 =?utf-8?B?VGp5eEVhUlJhRFFjWHZzcCtsRmR1ZjJ3Uyt0cFV3Y1NjYUgwSFdsMVA1ZytN?=
 =?utf-8?B?ZEgvOHhxTWdlOTJIRDNnbXNSZURuL0ZHUy9OT2R6ZFFIekVCRGVOTkR6Qno1?=
 =?utf-8?B?Znk1OEE5Q1lNaG9nS1ZyZzgrY2s1cnBJZm1ZRUE5N3NBbHdrQW56a0xCV0Z3?=
 =?utf-8?B?V1lNM2k4U254Z1BwRlMvZEJPQVhadWJqWDl0bHJWR3VzTUpvUzgvSkQyTXlI?=
 =?utf-8?B?K2VUUU03dEh0SlJCRFJBV2wxKzllaE85cWlUU3EzZGlSakZTMXA4N2ZJcnlI?=
 =?utf-8?B?d1ZsOXI1cEJNOFFEb0hDTkU5a0xpek1VYUN0TFZKWHNCRXF2djlBUFUzaG0r?=
 =?utf-8?B?ZU13SEUxQlZEazA3elNQK3IwWU1ZYUpBbmhzVkRKYngxQ2FPbFZYVmFMeW91?=
 =?utf-8?B?dlcvOU9vbWhLeGFEMFA0aElWMWhNNmJ0amJlQ3hGa1lRSnNacExnSUVKK1My?=
 =?utf-8?B?T3BRRHFwUGRhMXYrbnVYeUNJZ2RhVVlneGIyd1NvNGpjbndKc29hUU1zSktI?=
 =?utf-8?B?bDAwVWhkbUlHbzlQdE9sZnEzWGVqWFV6TGI2MkhpallESU1VaWFkRmgyVk5C?=
 =?utf-8?B?UGk2dGdia1YzdjhFMi9STEtzNXZnQ0RJUTFPOC9yRGFvSStTaHY1WG80QzFJ?=
 =?utf-8?B?bXp2dkh0LzlWem5VMFhrMm5TNVMrOXdYZE1lRE9QNjhGbzlYYW1SUHBHWExs?=
 =?utf-8?B?NXFIdGFYZW9QdHlTR3YvdFUyUnV6aUg0bURZc0hDeElnRDhCZ3pGdXFTRXVK?=
 =?utf-8?Q?qzXR9e+bmYE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlZmSk1jVk9xOEwzbnhmT24xMTdjMUVsVnVSamI1UXcxbGxtcFJ2K1hFMXo1?=
 =?utf-8?B?Y1hDR3lONE9HY0xLV1B3K2ViZnVUS1lqdjdLaXNIM1lQYmd3Y01LZmh0QTVJ?=
 =?utf-8?B?MFdXK2YyYitPSFNoTWZFKzVGdXhKb0kwcWxaSE1QNWIvRGF0RzV6aStNdWdi?=
 =?utf-8?B?Y29xT0ZhWDYvcmhnaTdTblNDdlFvYnovMzZtMXlNa1dMejNHK3RPV21VemxM?=
 =?utf-8?B?T0svUGMza1pmMXYzU1UwczR2OWhJdlVBRy80WXYrbE1XajFnYlRJaEJKQzVW?=
 =?utf-8?B?Y2FFTkRmQURpWm56cSs2YmNtTkROSXEwVDB1V2FjVks5azNjRTBZMUw2SXNh?=
 =?utf-8?B?UzZWVVVBTzZYMVVpaDA4NU0xMDdTQVJOdlI4R2FlaHFORnFBVGM2aUNlOUlN?=
 =?utf-8?B?d3JFRDJEMWxoWWp5VE9qeWl0OEtHektrRE9scW14SDIyWCtKVXVzSFF0RnBh?=
 =?utf-8?B?dzEvaXk0a2pQSW0rMW56OFl0MmdMdGtnRXlNbVEvT3ZSRkpkMWZUd3VrbWdO?=
 =?utf-8?B?a2RJWm93WTFtcXowWVRoUkhGV3FpZVpQU0ptUzFuSWxkVTJRbmgxaFh3bStv?=
 =?utf-8?B?akp1cWl1SkRQMmo0RGRXcnptNzk1QWRWbVVjUVVZKzBFbC94UUV4VFIxY0pZ?=
 =?utf-8?B?OGpRT2txZGMyRDJWb3R5OFQ4ajB2a3dFSlhGbjc3am05SEVWVmFEcHArOXpQ?=
 =?utf-8?B?NmRlRGVoTzZWNTJ4NERtNTRsdlB1ZGk1dDg3U0xjTGExQXpnV21oSmVXWWJU?=
 =?utf-8?B?bURGeDJQdmxrT2FuYjBmbXZ1OXUrcndRT2U0dlI1aklyNUh1ZzhXUG4vVG00?=
 =?utf-8?B?aHhWeDRoOVF0Tjh3RnQ4VTFVUlNMUy95R2hRYkVITTdLRndvN3Y1Tm5jKzVF?=
 =?utf-8?B?cTlrbEw3NXdvV2diQWFlSzlYNVJISWpaUEwzMU9Vc3hGMWRoNDlCdGM2dDA4?=
 =?utf-8?B?WlltZTY3ekliNzRpS0taeUlrTFhWNkZETzNYTE9heWNrRHFFZEVIK28vbHpR?=
 =?utf-8?B?eG00Q1FWTGFuc3B1dENPcUdmRU40clVEcEFuV0FkczRPK3ptN2EwbXA0VjBz?=
 =?utf-8?B?TnRPL1BETHFrV3Q5WVFNSzJnZmNTVXpJRzF5MHNrNE5zemhsMnAzNlZib2Vp?=
 =?utf-8?B?Y0p2YzYrNGt4Ti8zQjdPSUh1N0NSVTYxMVJXa25tYUlCSU1kdU8rQjZncUVi?=
 =?utf-8?B?UE01c3ZzQW5GZlZzYm1ybTIvZzI3RVJUL0QxdktPZms5bHZZY1dKelVPNlV3?=
 =?utf-8?B?V0p3ZDB2VnY1ejE2MURRNmlwNmpQZlMveEtJdnE0aENsQm5kaFUzLzhLcWpR?=
 =?utf-8?B?RDFOWnUyeVpoQ215Yzd1YXRnZTl3MGlJb1NSa2xpTElkRWk1dUhnTzlZZElE?=
 =?utf-8?B?WHVuQmJrY2I5ZjlhSVhDbW5LeTN5a0xUQ2dSVnlvSnlyR0lkOUp1NXp0c2I5?=
 =?utf-8?B?aGowMkk2S0ZaM0tiQk9pdlhsRm1sMlpTWUlXSnZQalFibC96MnlSOW9rZUVh?=
 =?utf-8?B?RTFnak9WamhMRlEyS0pQZWRXMlFHUXd6VWhiOG1jcjRiT3gyT1BPaTVnNnVV?=
 =?utf-8?B?VjFoaTMyaFRKS0pFYVl0REtEbldOaFRWU2M5cFQxdHNpU1Jod09OTFpEbU51?=
 =?utf-8?B?SWlJakFuZ2JwUDBCaVB3dG41bWQvZjJqbnIrbjcxdFc4K3BGejM2aDlENTVk?=
 =?utf-8?B?elVtdFc4dEE1MmpPQzFRMEZ6aUUvMVdJVWF4UlBndElrUkYzVFdxQUlpRUZ5?=
 =?utf-8?B?RXg5L00zY3lyNkJ0eEdqSDVCZU44bVVHQXJRV2ZaUVFCMUZINjFhcitlR0tJ?=
 =?utf-8?B?NVFzTVVIVjFwSEU3VGo5OWhSUjdPVjZZU3Z2eS9QajRyVFU5cmRoak1wUUZD?=
 =?utf-8?B?aTg4ZFpPVHZsdzhvTzRxblgzWkpCSVYva1ZnK0g0ZXRtSDNWU3JPUGxuNUhj?=
 =?utf-8?B?cmxRMWxKTmxLOGxEeUZ5b3RBTXFLdTJsRFJ2bjRJUUpDWEoxaC9hZ3Ztc2dU?=
 =?utf-8?B?U203UWl2OVRhUkVGRWFwZ2c1YUc1M1J6ZU5ZQnM5LytDbitNdTFuOUxwVzVH?=
 =?utf-8?B?SExUUEU5clNXTExxNGlEMzRwTmhDWk54c2txMnVFZHl3KzRLNjliTmVQUGVT?=
 =?utf-8?B?MGQ4emlibmh5VytGclkyV3pNdWxvZ3lMZnRCL1VqVnBJNFhlaVc4MVpyMkJn?=
 =?utf-8?Q?ybgxj4x3PoI364alyXa+2E8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 486b02f7-1a58-42db-880f-08dde616f6c0
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 09:40:46.4001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2gdDkpR8ZIoTs3i3bMRG/QQeNN25pQ/zBZxGv/Ta66qLBVcHczRn88L7uDCIde3URZb8dPpCgdoPWT1B7ToOLNEX9t/av0RC00UBNf2EIjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7829
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



On 28-08-2025 14:31, Dan Carpenter wrote:
> Hello Himal Prasad Ghimiray,
> 
> Commit 418807860e94 ("drm/xe/uapi: Add UAPI for querying VMA count
> and memory attributes") from Aug 21, 2025 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/gpu/drm/xe/xe_vm.c:2298 xe_vm_query_vmas_attrs_ioctl()
> 	warn: maybe return -EFAULT instead of the bytes remaining?
> 
> drivers/gpu/drm/xe/xe_vm.c
>      2240 int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>      2241 {
>      2242         struct xe_device *xe = to_xe_device(dev);
>      2243         struct xe_file *xef = to_xe_file(file);
>      2244         struct drm_xe_mem_range_attr *mem_attrs;
>      2245         struct drm_xe_vm_query_mem_range_attr *args = data;
>      2246         u64 __user *attrs_user = u64_to_user_ptr(args->vector_of_mem_attr);
>      2247         struct xe_vm *vm;
>      2248         int err = 0;
>      2249
>      2250         if (XE_IOCTL_DBG(xe,
>      2251                          ((args->num_mem_ranges == 0 &&
>      2252                           (attrs_user || args->sizeof_mem_range_attr != 0)) ||
>      2253                          (args->num_mem_ranges > 0 &&
>      2254                           (!attrs_user ||
>      2255                            args->sizeof_mem_range_attr !=
>      2256                            sizeof(struct drm_xe_mem_range_attr))))))
>      2257                 return -EINVAL;
>      2258
>      2259         vm = xe_vm_lookup(xef, args->vm_id);
>      2260         if (XE_IOCTL_DBG(xe, !vm))
>      2261                 return -EINVAL;
>      2262
>      2263         err = down_read_interruptible(&vm->lock);
>      2264         if (err)
>      2265                 goto put_vm;
>      2266
>      2267         attrs_user = u64_to_user_ptr(args->vector_of_mem_attr);
>      2268
>      2269         if (args->num_mem_ranges == 0 && !attrs_user) {
>      2270                 args->num_mem_ranges = xe_vm_query_vmas(vm, args->start, args->start + args->range);
>      2271                 args->sizeof_mem_range_attr = sizeof(struct drm_xe_mem_range_attr);
>      2272                 goto unlock_vm;
>      2273         }
>      2274
>      2275         mem_attrs = kvmalloc_array(args->num_mem_ranges, args->sizeof_mem_range_attr,
>      2276                                    GFP_KERNEL | __GFP_ACCOUNT |
>      2277                                    __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>      2278         if (!mem_attrs) {
>      2279                 err = args->num_mem_ranges > 1 ? -ENOBUFS : -ENOMEM;
>                                 ^^^^^^^^^^^^^^^^^^^^^^^^
> 
> This is a weird check.  If args->num_mem_ranges is zero, then kmalloc()
> will succeed with the ZERO_SIZE_PTR.  If it's 1, then
> args->sizeof_mem_range_attr is quite small.  64 bytes.  The allocation will
> succeed as well.  In real life err will never be set to -ENOBUFS.

This is false error.
> 
>      2280                 goto unlock_vm;
>      2281         }
>      2282
>      2283         memset(mem_attrs, 0, args->num_mem_ranges * args->sizeof_mem_range_attr);
>      2284         err = get_mem_attrs(vm, &args->num_mem_ranges, args->start,
>      2285                             args->start + args->range, mem_attrs);
>      2286         if (err)
>      2287                 goto free_mem_attrs;
>      2288
>      2289         err = copy_to_user(attrs_user, mem_attrs,
>      2290                            args->sizeof_mem_range_attr * args->num_mem_ranges);
> 
> copy_to_user() returns the number of bytes it failed to copy.  It should
> be:

will fix it.

Thanks

> 
> 	if (copy_to_user(...))
> 		err = -EFAULT;
> 
>      2291
>      2292 free_mem_attrs:
>      2293         kvfree(mem_attrs);
>      2294 unlock_vm:
>      2295         up_read(&vm->lock);
>      2296 put_vm:
>      2297         xe_vm_put(vm);
> --> 2298         return err;
>      2299 }
> 
> regards,
> dan carpenter

