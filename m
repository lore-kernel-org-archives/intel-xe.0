Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222CBC0218C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 18:18:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7E110E899;
	Thu, 23 Jan 2025 18:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DpSobFiQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F30B10E8AF
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 18:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737656300; x=1769192300;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2vH7fTtMs+vGlrEj65ckUCA7X/VIL8d8azxu3Kawl5s=;
 b=DpSobFiQdXpIGc5QV8snGXYPIR2lU6sZgrgCjU4F0qLHZ6+esmvG74Ev
 1azJhBFu18kbd5z6oAjeYyTPDzdISYZPCNwuphFl30v7pibgKB2xMX785
 Qtu3gCpbcKPsihDUWgZYuOtpwcQhDKkOfWjuv5jePz4w9wTsy44bS5vO+
 0rnMgDO+NuoAbhvEOPy80CElASvsi1Hhrwhn8k9shjslcpBXDNnFh9BpH
 ioKJP07s8SrvnUvWhSuhlclY+oBgefkDFxdATCZI/LYnL9aNdJEkClAPU
 2fydt6SjkTE4FPcQGJLdNbcNmQIY3hmTKSuGpEmy2y4Iq1wRqomhclFyL Q==;
X-CSE-ConnectionGUID: pEnrAhYAT12SORcND2vb0Q==
X-CSE-MsgGUID: 7fPcVazcTZmArLUfeajdVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="49572376"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="49572376"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 10:18:19 -0800
X-CSE-ConnectionGUID: cuCN1giNS1m78iR0s9LJng==
X-CSE-MsgGUID: zxvq69rXShKk6oO5fgjxTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111574041"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 10:18:19 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 10:18:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 10:18:18 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 10:18:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbZzyYj9cqG4FbI8N6gkOF0N++MYqcsaI4jw16lOI5P5NcFtgXWuxx8YK6Xv3Xh6t3BAYPc8rxJ9ezjonRI684TW0cN/bH487LitJRt5QIQDagvJKEND5CEC43CCOPfL4sQk6Kzm2X3aOfNpU0NV9Dux9G9BFUr8rDBtTs/gLACnRR1Icz9S5Cg9jbzGjNlhYvAFWUJrZSY1HRfnO9eqBX8fICUmRvfl5uHFPyzQDHyxMM6saBagKshAhCKPEtYnriV6rBMT71D1ZAZGtXj3nyHO3QZ32x+p52G3uiHguy/sbq+TVDFVmjgI3aVyw63Qn6fNm+nJzJiPVnW2+qgOtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIr9/zoxzoT2FVBH6BMtZ3OXBVLQd+8PxA3Dwc/F81I=;
 b=AuL6QTCnlmBijjsjp0Mjnf9Rty5f7OiWEboYDJBZIe9gHMNQmvk8Q4CPHhhmjnAty5Cq5OLn21LZxp1i9cJEr/58hr2IRgza0xpUPT3Y/CVyu23/WfZ0o5DBWPxq/soT1WIFao1DCwqaMCHqUxJGyPtWzoT3ea05MwPC36yzbO+3q+x8LaaF6tilEe2opVJ4U6phPbNLH+An+FzyRZJvYkKNCO0YlvOglhbH1pGgPJFbf2OLB4xLmlPw2LBntMapMpgwYAseQxQKvC/667Ex0QuliB5BuUHG7IjWhG0DZC9AaNNj8OGeNKuLCyDlaAx2aaHnSoVKxsswone+ZBAnJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8450.namprd11.prod.outlook.com (2603:10b6:a03:578::13)
 by IA1PR11MB6394.namprd11.prod.outlook.com (2603:10b6:208:3ad::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Thu, 23 Jan
 2025 18:18:08 +0000
Received: from SJ2PR11MB8450.namprd11.prod.outlook.com
 ([fe80::5c1b:f14a:ef14:121e]) by SJ2PR11MB8450.namprd11.prod.outlook.com
 ([fe80::5c1b:f14a:ef14:121e%4]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 18:18:08 +0000
Message-ID: <09e5ad52-be12-4d39-9b64-ca75b4851307@intel.com>
Date: Thu, 23 Jan 2025 10:18:05 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe: Drop duplicated information about GT tile in
 devcoredump
To: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250123180320.66198-1-jose.souza@intel.com>
 <20250123180320.66198-4-jose.souza@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250123180320.66198-4-jose.souza@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0044.namprd03.prod.outlook.com
 (2603:10b6:303:8e::19) To SJ2PR11MB8450.namprd11.prod.outlook.com
 (2603:10b6:a03:578::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8450:EE_|IA1PR11MB6394:EE_
X-MS-Office365-Filtering-Correlation-Id: d0c6ddcd-c3a0-4ef5-ebad-08dd3bda4991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUJrTW9zdHBMU1lmOVJTN1hsQUExSUtYQ3QxTjRWcmpoWGFNMmZIaXY5QlMw?=
 =?utf-8?B?dkVhMjhpUlVlVmpZMG5xQ3RBdjZlYWRnTjlOaHIxT3U3eTJNSCt4bGdRNkVF?=
 =?utf-8?B?NCttNXgzSzFqdTI3Y2ZzSFR2Q3cremlqaUxFSXo4Uit0Rk9lOEs1bDR2b05q?=
 =?utf-8?B?enJ3VFg4YjNNa0xqMG1ZOGRJT0ZUcnZaazAyczFobTBDQTVQaUpUcTBuZ3gw?=
 =?utf-8?B?UHlHMjBoU0pPSWVtbFFURzFvUTlIcDdmZG9wUkZpSWJiaTgySU15SDJneURa?=
 =?utf-8?B?ZCtvVEcra2NMR0FWR0lFY2pqNC9vM0hPT3NMRWJlWVBhOVhYQmUzb21ncjI4?=
 =?utf-8?B?NklNUWJJWC8waExreXB2SVQ0bldLQncvbWlESUxpWGZETGtjYkFNcWE5QTEz?=
 =?utf-8?B?dHZtSkYvcXVLc1QwTXN2STBxMVZNZ0w3N2NMYktBTEJTZmNmR2tCM2I2QjdZ?=
 =?utf-8?B?elhrVUNuQ09xZHhEWmhiK2cyeXh2cjVQcEp6UXNCMU5LTEZ3dUdtVC8vN2V6?=
 =?utf-8?B?OG1wRlZXY1psZEkxWDlPQnRJZ3BKZG5QME9HYjBRR0M3NEs3MjgxcFlubzkz?=
 =?utf-8?B?QUIwZWdLemtnRmZocXhsRFVYVUhxUlB4blZEN1JTZWxFUFJYT2VkcXBIQjdI?=
 =?utf-8?B?M2RZaE93WnVVZlNtUlpPTUJxSE5rUm5HMGhPV1JSQmROQWpEbUlxcUlGSUIw?=
 =?utf-8?B?a3UySXdDbTlxS01SRFdVUFNlU3VSMFFuZisvY1lSOUtIWmxmTkVHdmJnenFR?=
 =?utf-8?B?TENyQ3ZwaHhkdHB3NDlWMVlDcHNFMmpmWDMxdVhPUFY2eFY5N3p6ZGlqNmVk?=
 =?utf-8?B?d1E3SHhxNnEranYzVkkvaXE0Smd2Z1dhTldEMVBnekc0QUszTzFFdDJMKzVi?=
 =?utf-8?B?K3dLYURxdEpjMVhmS0M3L1k4WDV3WHk1R3VBT0VvYnpINCtuTVk0NmF4S0Yy?=
 =?utf-8?B?NkNGWGpvMTBVbnVabk96ZWFRUG9PN09aekJJSUgyWFl2LzlwWUJlU0ppbnFI?=
 =?utf-8?B?bFRMaENiS2VIMVp1NThQZWJtanh3VkhwVmNTNmhjd3BRZDJsZHhnNlF3VEV5?=
 =?utf-8?B?L21GTGFORVYvMW5FQXNacU8wdjh1NFIrK1Y1NEVXaCtQc2ZvYm5yK1p3c2g3?=
 =?utf-8?B?UnNjT0owT1VuQzFCQXdySjBBTk52Ulh6ODVoSTRVa1k1QWsycFVKQkdQQXFa?=
 =?utf-8?B?Vk9SRFFCS05GK3hwZStuNHlOai9rOE1mWG5ha202OUZmKy9wNTJNdnduTnlu?=
 =?utf-8?B?clNiOTl3N2huaXlseXhuSGxCS3QrZTl0UXBIUGdjZTVEWkdpd1J6TjlHdVdk?=
 =?utf-8?B?MnlYei82WHo4Q0hGUDlvT0FveC9makxNUzMwbHJiUXRRcmR5Z01aUEFlMlZa?=
 =?utf-8?B?VzZSY0J5YTlnSTRieFFacWd0Q1dMR0VuSEJCeHV1eW5NWG5HaE1lKzA0TzBx?=
 =?utf-8?B?dDBsZXJDYUJYMlkwcEVHNXpwalgrQ2R4dXZYS1hZWUZMSUUxMEl6amxKbk0y?=
 =?utf-8?B?VndZRzZaSENYMXp4V0JoT0dFemhwQmlMTlV0ckJCUW1xSCtkeWczZTVNTnhN?=
 =?utf-8?B?ZTJ3MTZoRGN3dVpFMEVicFhmMTgxV0FHVnhyZDJJMXVaSHVGaDgwcUlHZmc4?=
 =?utf-8?B?SFhDckIwdVM1SHhTdEhFWjZGWTR4QXEvd0JDeXdEeXRyOWlLZkM0WFdwN0I4?=
 =?utf-8?B?OHpPUDBPbHJwWElRV2t0aGs4ZHFuQlEyR01RY0Ixang2NHl5V2krLytaU3pn?=
 =?utf-8?B?ZkR2dzFWbHUrYXpMT013Qm5CT3R4ckpwdEpmVmJuMEtIdjY4MFZjN1Y1ZlR0?=
 =?utf-8?B?OTNYOFZVa0EzbnZOOWxuc3AzSjhHeFcrUlVxb2MzSDVJS3p0eDhaa2kySVE1?=
 =?utf-8?Q?DTqXZLRmqv4kh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB8450.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzkzbXR6VFNCc0ZIQU1NdktLVm05ZUxHQnNRaCt4emFXNG5BaDlrbGJLcXR6?=
 =?utf-8?B?TnZNWDh1bU5OVTJObEdyUmNNQlpsSlFWS2tURzVabnBJemt1L3F4bVFQQU1i?=
 =?utf-8?B?MmNiWEJTUnhlUlJxazMwMWRxYzg3ZmZhd3p2aVh1TXUyT3JDbEpOdUNMeUJH?=
 =?utf-8?B?TFFUSFc5M293NWlkVE5xZFlYOEp4UWN4QlUzTTlWV2t1disyOUVKVFByWjNv?=
 =?utf-8?B?eTc4RlRCcEdpYk16dlpUTExHUHJKbmtuT25mNXA0ZWF1UXVvMDVtWjdNRVha?=
 =?utf-8?B?SjNJNFlseXRWSjZDNEhSN0tVbGZQQzk2L0sxeFFuN3dteG5ua0oxNUE4Um93?=
 =?utf-8?B?YmpXRmhucE5UV3hyZDJUd1hqczdLenhFZFd4TmpFWmNja0tPMjVpQTNaUXFu?=
 =?utf-8?B?MHpOZ202ZWVERFlOM3FRQzFGMC8xSVdMNTNMdHRoVEFYUlMyWUVKaHRtQytw?=
 =?utf-8?B?RzRzbDgvL1QzVSs5ZU5iMHlsY1M1bDNaeSt1aDFiZEdvZGFqTmNZSVR6UVN4?=
 =?utf-8?B?UmRtM1JwUTd4N2FYZG1HUi9RZ2p4enB3MkdrWG9yLzVqRUlGRVNmaFRmd1RH?=
 =?utf-8?B?UTg1b2Q3WHZIYnpWSlJISDU4ZUlWSmRma1kyYlV4M0FOMmFFeU1VeXZZdFo1?=
 =?utf-8?B?ckpsTTVDaW5zNEVJWUVTRnk2WFZwQjZyMEphdUpLTXJCdGVpN0ovUVJJQmQ1?=
 =?utf-8?B?dWJPNUhEcVFqVm91VzJUZHpyT1JJdXB1bnREME1pcWtXVWxwbWhhUG9DMHJW?=
 =?utf-8?B?dElFOUdSZk4xK0hPLzFPcVNPSHlYeUhGRm9rQVNlYkZHbm5vSzZuSnczSklt?=
 =?utf-8?B?bHlUMEFLdnZqSTl2S1F5eWRLdUFpQzRlOWs3Z3FMV0lFb1pJa1oyYmNuTzNS?=
 =?utf-8?B?ZkxBSzBnbFErcUhIKzNBWkJBVjlNUE44cjk2ZTRRVkloNlZtWDJtTmJ2cHlZ?=
 =?utf-8?B?dERmakpkSjByQVpKenU2SGxhUzFWd1FqSkkwNkhqdU5tV3Bnb0ZBTWpxOWpw?=
 =?utf-8?B?bFErYkhGcXREb3UyN0x4djNZT2N3VG5oZ2h6UnhuWS9tTndBVU9UbjZva29o?=
 =?utf-8?B?a3B3SzNsRGRESm1jaUFYWmhJTmFGRjFBeFNoVWZGVDFENHVBQUFURmozVmU3?=
 =?utf-8?B?dExNNUpLbHVnMkczbmQyVTFhZ3c2V3JvYVRNNWZubENtSTV0VDlLUmc4UGJn?=
 =?utf-8?B?RXlHb1pMenpyTldYMWFOanJFalpYNWJhUEZrdkY2UXkyQlo0czhVSlR3ejJR?=
 =?utf-8?B?eXJ3Ty9iYmNYS2txN1JCRW9pT3dhbDJGdUNCakNBK2IxenZZYzVid0t3cVYz?=
 =?utf-8?B?VWF1TWt0SUNVd041MmlNczBpM1ZmR1laOXZqT0UvRWFnKzFZWUVOZENyUVQx?=
 =?utf-8?B?cVQrQTBnMSs1RlNHYmY1MkthWURvUW9oYWlVdVpJeHlCWmRUeDFuRTA1dnFa?=
 =?utf-8?B?aGtmUzZMV0JCWmlONFVQeFJYbTN4SWRWWGk5TVA5MWo3RFVxVEMxRG9pR2F6?=
 =?utf-8?B?cTh5Y2NyOU82S0dlK1J1NzFRb1QwU2pJWVB2Q01MVGgrKzIzMTg4bHY3Tmhv?=
 =?utf-8?B?NldsQUovTGJZd2NPbkc0bCtxVXpJRWhISnpaSDFTbUtKWHFUNjRJNWFXZFI5?=
 =?utf-8?B?TUtXb0ZUcCswZXZaZmNxOVo1RzJpRURzYkNmSURFZElnSlRydElNcGpPQUZP?=
 =?utf-8?B?MDVsUTNvR2R5RmU3cXBRZFgvcndkMEFUdFNTYktMam9MbWsvdHBpRGV4U000?=
 =?utf-8?B?ZmRDTU55Wmd6VXJ1eEd4akFMY2hmbkRSeFdQbTFQaUdReENIZHoydjhkUjFL?=
 =?utf-8?B?c3RwcnM3c2VmdjJUOEx6MFRVazZ2azR0cWtvcENCaDFXNEVXZ2ttWXNObVNE?=
 =?utf-8?B?ZHhHcnhLN2VOZ3RyQTJlN2tZNlNsWTBIa3QrQU1Ca0hFY2g3MVF4VWx2OG1T?=
 =?utf-8?B?WFFkUEVQdGJtZ0lOeXBCTVBNWlk0UlBaTHRTcllUdjRHRGVuNUpTaU1tNnkx?=
 =?utf-8?B?NWg5TU9WYzh0TjgvKzNmSEdpV0ppZXhhUFBZUjQrbmZ3TXJBMnIyMFJIL0Nw?=
 =?utf-8?B?VXpXNGF3dHJZSmpySWthUzVndkZGWFhNYzNzWUkrSEQyUTE0em5FcmNkNCto?=
 =?utf-8?B?TmR5ZGVscExSRnBuc0VlSkx1Tkt0bzdBODhKdEFwMlhyamxGUGxTeTY3NERE?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c6ddcd-c3a0-4ef5-ebad-08dd3bda4991
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8450.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 18:18:08.0893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r+EobxCpU7PEBVT9ZbNEFICE0+yPyyYPsW947sdq10LoiQ8WeXdWwEKb/GSi8aXeOmgGpRMcfGYo4APWs80BsOYDVM5D25ncqgcMkqCwve0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6394
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

On 1/23/2025 09:59, José Roberto de Souza wrote:
> The GT tile is already available but was added again in commit
> c28fd6c358db ("drm/xe/devcoredump: Improve section headings and add tile info"),
> so here deleting it.
>
> Here a devcoredump example with the duplicated information:
>
> **** Xe Device Coredump ****
> Reason: Timedout job - seqno=4294967170, lrc_seqno=4294967170, guc_id=13, flags=0x0
> kernel: 6.13.0-zeh-xe+
> module: xe
> Snapshot time: 1737573530.243521319
> Uptime: 2588.041930284
> Process: deqp-vk [8850]
> PCI ID: 0x64a0
> PCI revision: 0x04
> GT id: 0
> 	Tile: 0
> 	Type: main
> 	IP ver: 20.4.4
> 	CS reference clock: 19200000
> GT id: 1
> 	Tile: 0
> 	Type: media
> 	IP ver: 20.0.4
> 	CS reference clock: 19200000
This is an overview of all GTs/tiles in the device within the global 
section.

>
> **** GT #0 ****
This is a section header telling you that everything which follows is 
inside GT0.

It is not duplicated information. And if you remove it then you now have 
the information of all GTs back to back with no indication of which GT 
they actually belong to.

John.


> 	Tile: 0
>
> **** GuC Log ****
> ....
>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_devcoredump.c | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 1c86e6456d60f..2996945ffee39 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -111,9 +111,6 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
>   	drm_printf(&p, "Process: %s [%d]\n", ss->process_name, ss->pid);
>   	xe_device_snapshot_print(xe, &p);
>   
> -	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
> -	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
> -
>   	drm_puts(&p, "\n**** GuC Log ****\n");
>   	xe_guc_log_snapshot_print(ss->guc.log, &p);
>   	drm_puts(&p, "\n**** GuC CT ****\n");

