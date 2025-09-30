Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0643CAC5B0
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 00:42:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6642C10E231;
	Tue, 30 Sep 2025 00:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ot9aJWQH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F95110E231
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 00:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759192957; x=1790728957;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BgTKGQgbqhC0TkLlRTt3CcOl7AO3864P2uGTwB8LRIU=;
 b=Ot9aJWQH7wmmxzQyRijsQ0cHczFuC1kQyucrf6UFTkdM01ZTZuqWY22+
 pLFgxw7ZsW7YduZBqdRlCAtT7flX4M9uq7iPSCMR/o6ectBvJF15mEVaK
 n8n8z8NBuRLRV5MfBeJqME3GT5cQtXWLKgau6iMEyA4mc4b5z9O2rDPgl
 /ecCyj5xr0gdYyoHkYWcSACnMbQdtCv0kSsmtPtFkcW7tsAJeWM1zTRws
 qnY/LRivmLEP0QN+thq7uAviMF8940OhAAYJDhWhGnEb4uHodgIDSA6jI
 4FeK/2ku6EF91nu1THlRahna28wB7Rx/OOoKLw5qAka13oG35DY35SQR6 w==;
X-CSE-ConnectionGUID: 2UopYo1uQtm3xmiCqWxnmw==
X-CSE-MsgGUID: BuWGIL+aSyuqOa60+uVVwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="60478385"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="60478385"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 17:42:37 -0700
X-CSE-ConnectionGUID: gHqHJ8i2QlK01iF2DyPVVQ==
X-CSE-MsgGUID: LUHsE7BeQdqR3bKyp+qdJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="178325505"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 17:42:37 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 17:42:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 17:42:36 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 17:42:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9UL5HtCGiar+5KlM+hNxrSZjUSuQv30TGWWP+6ZpGDPLzw0/Oj8G0WatvxV8xA0YtPauwAAP1VJcqHpd0/oxjIjrPyBvW8sxTlPwWuMLh4hWGPJVMS8PYImkFeFXOhzuTwSn8i72ndiYE60/0IiuFB5wBCdtIBdxtOEPEaQK/W7q6ALpzptEoG7oIA6gBeuCxyHWfd7jra8txZ68FUsttCTLq+STbplk4/4t6S/71hg4il0s/+USHffcYC8qFWgYozzqC3zTxgLcjaG7EK8u+Z2Z1EPtn8BzAaaExYfzeoGwOagAHg41L313MlwKN9txsAgqrOk8K52PsAVIl/Cpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t52YkRMCfnNci+hg+/e2U07C27EfLQ/or+h8WmLw28w=;
 b=owGdvmLjPyOHMiX3XlOUvXOGXklqBnr1RZl/u0Cuh1MHZFNoLga/tkDUg43OC0MgTya9lqGGnIdtl2ZErep+TPAwnHEK2QEmwWV4xTzYqjhJK0727+c9efLlm7Cc227xv7Kw1JAIBT2HaCBoTiqn8PBsh4YhQUmH293BMgT/clIKekhPI7Z60AWg5i+UeBZlgrSWAlnv2T+XHctFngJZQGjOJ7AS2NuDCMMiS3pySaR3yOnVGvQnCF4XBUd+V1EXd/s8eWYvO0GQ0oGHJwv/ZGYRT7kY2yRl6p5ZS1heUKVF1/msyAvetEWHcy0lZsPXaDvC6DJ1e0XPiw61JOglNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by MW4PR11MB5936.namprd11.prod.outlook.com (2603:10b6:303:16b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 30 Sep
 2025 00:42:33 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Tue, 30 Sep 2025
 00:42:33 +0000
Message-ID: <2d5aea6a-0d77-4f51-a54c-0be0ccf469e4@intel.com>
Date: Tue, 30 Sep 2025 02:42:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/36] drm/xe/vf: Lock querying GGTT config during
 driver init
To: Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-3-matthew.brost@intel.com>
 <ff5ee0cb-05fe-4e82-9994-589bf279d302@intel.com>
 <aNp4asaemvWydMY8@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <aNp4asaemvWydMY8@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0105.eurprd04.prod.outlook.com
 (2603:10a6:803:64::40) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|MW4PR11MB5936:EE_
X-MS-Office365-Filtering-Correlation-Id: 253e22ce-ba3b-4e73-d6c9-08ddffba3e84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1BTeXdWVXF3Szk3QXQyLytVTW40bEtyOHlTbWhqWlRRd1NmbUlVeXF1TjVW?=
 =?utf-8?B?R283UFJSdmoycTJaR1NzOHlOUjJ6QzlGWDVnOU9abm5rUmpJSExIem9NSlE0?=
 =?utf-8?B?T2hJbDBCSjBhb2ZGLzY1R05JalNjK3NaRk8xbnIxYU9NWnJCcSsvRm5LRHJ0?=
 =?utf-8?B?a1d3eWtyem1BaTNmSHZ5UmljNEtreUgzcUU0c0Ftbk5seGc4Sy9sZkEvekVM?=
 =?utf-8?B?QXZhQm1jN2VPODJYSHNQUi9hQXZOTjhwenNwdkhqUlBtL0hCc09kRU92UWxi?=
 =?utf-8?B?UU8xaGhydDVPUnZCTTlxMGN5NVZyWVZWaUJyUERjUThpbXBUNjFTckduRnND?=
 =?utf-8?B?SllzRUJldXZsTERCenlwMjB4TTBNcUFscU45Y0JqVUVnZXVRUGUvRmRKeWlS?=
 =?utf-8?B?UGpJVVFwdjZySWl5VHpnSnZMV012dUh1dDVTaFFSbWtTWnY5ZFZOMWJ0UW9u?=
 =?utf-8?B?WE9zODVlTW9mdXhrUHpSQXVVSlBhcVZvMThpOXdVdjFqWk8rV0dvdFMxREhV?=
 =?utf-8?B?TytmU2pxWlVkekIzTkErNmhZZjdxcU9HOTgxdCs1R1pLN1lBbjBRcEs0N1VN?=
 =?utf-8?B?ZjQ0dElDM0RwanczbG1CM3BFNjMwNHRxSU9pMDN5Mk5HSmV3eEp0Zmh5dWRX?=
 =?utf-8?B?NGVOMnU4M2VYYVpCanA5MGRVR0tNYUlabTNMd3Bja2RpcHFKbDM4UytwZFRH?=
 =?utf-8?B?NlJ5a3o1aGtJb3VkZjFBc0xENjcySXNKbkplK2pZMzR0VDN1NVoybDNKYTV3?=
 =?utf-8?B?VW5CdVZtYWVzNERWUmpDVGx0OGlaTkY2czBKZXJSM0JBQndxR09NMGZCNGV4?=
 =?utf-8?B?VHBlM1BVc3JIM0lKS3piL0FRckR0eTN5azk0azBoNzFvcythS2NSWEh4OG40?=
 =?utf-8?B?L1NGZDZvM3BYOEdJUjRvczQyRDhKNThjS2xVaFAxOHJpbkhlVnA2VWx4azNw?=
 =?utf-8?B?cnJ0NUxGQmlPa2xCSTZ4TE1TZ3J0WW1MU1RTZk9MT1VHMG1Wam1hZkloamdp?=
 =?utf-8?B?RlVjLzltNzNuYjZjQThhTEU3OFV2UERPSU4zbVd5aXo0Z3NqSy9EN0pUQVNK?=
 =?utf-8?B?OGtueFo5eEZWMmhVNVpiZHB5QU9OREtLK0l2dEZISTNNcWtoRlY0Mkp5bEhl?=
 =?utf-8?B?emhQU0d2aHh6Zk9nRyt2SlhiNVVVQmtGT2wzT1I5NnVzeU80RERlaWRhRVFQ?=
 =?utf-8?B?SFFDaFA3R2JkQXRIVitYZGJ2dUZDRThwWk9hSmNRNG9iRytQd0ZoZDUrdytJ?=
 =?utf-8?B?K3JBUEpkSWN3aW9LRkNocDZiK05pK2pXTWdjQ2R3SjFCeUdkZHdZcnJvOCtC?=
 =?utf-8?B?UjNPUUlnckdMOG91dUFBRmJDS0hOYzNDNU8rMXAyMkFaSVdVR2xUZGw2OHVH?=
 =?utf-8?B?RVdPbGdxdzliK1NOb04xeFVhM0lGeXhMSWZaOXhwYXArbGZuSkF0KzVPbFpK?=
 =?utf-8?B?RXpDRVl5eGU0bnE0R3FRRFVIREU4T0dRU2lLbUMvK0lxaUpzc1pzZVdCdVVL?=
 =?utf-8?B?L25tMHFHWm43Rm9QWVFUZnJpU2N2K0tsOTRYbk9SVU9wTmZaN3dwR095dUpC?=
 =?utf-8?B?dWZDNkdQYUdjK3A1NStHek84cGhINGhBSVNpdjBQQVk0UXdWcEw3ZCtVY3h3?=
 =?utf-8?B?dE8ybXRWU1RxQzcrenlkaGFhYUY4R2xLU0JwRjhWK29BWVJxRzBzVTZyNk00?=
 =?utf-8?B?TlQwMldmYXhOV3lyeHhyeUdIcFhSQVlQaWdEbmFYbzNwZWFWRnZjelE4VkI3?=
 =?utf-8?B?dG9MajV1L0lKVVJrbTNpOVZtWHlHWEFjY0lFc3AzWC9HNjJLZ1FaYkNXYjNC?=
 =?utf-8?B?eTk5YmxmVTNZVCtpWkd6WG9IakJBS1paR0lzT1ZGWnN5N2tDcE5JamFTZkNK?=
 =?utf-8?B?UFI2YXpONzZlWmRhQVdYQWpmS3grL25PRCtCUVB1RzhoMGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZklCblJtTlptcFAxdFppcFFMMmhOZWdhMjBBaWJUK2JFVTU4eDlFOWE5REtt?=
 =?utf-8?B?b0JDWEtvZ28yd1pVa2ZjemMzV2wyRy9nZEFJak1GSnpldVhJeGovZDdZQUJF?=
 =?utf-8?B?R1FYTFNNSVU4Wis4K0hpRHZnaHE5SDJLMXNnbFRSRWFFRVRlVVlzcDUvU3hX?=
 =?utf-8?B?ekRRZUgvb29MV0t5ZDd3Mnh0R0xRdS9pY1V4ZnhSdElpb0NocG9oWmNtQzB0?=
 =?utf-8?B?REhwZUxseUZDTWRGTllmQnJwcndZeXZEbVpjekVLTXJKWXZ5R09JRXMrTlgy?=
 =?utf-8?B?RzBvdEpoTlJuNnNNdnZWcDE4ZHRDYVZMajJORkJ4YWJBUm8wUEN3SG9xazhN?=
 =?utf-8?B?Q3JLcWVPSXIrVWRPVjdmQUJNZnFITXRlbXhvdEtNRGNUNXlVMFBOT1I2U2hK?=
 =?utf-8?B?MHhjc00yaGlBNi8xbHBWOW9qTUN5Q1RqODFmYkd5NllLcW4wSFpkeFo1R0Rm?=
 =?utf-8?B?STFLekFYdm5aZ25tY0RDU25HSDhCRjZpMEROcmE2WlhkR3RKMU9hY0t4UnEw?=
 =?utf-8?B?T0NuZVNPdlJ5MTAzUERMMDRXZ1poOVJZc3hPMkd6VCtaaE5xRHpDMHFCYlNl?=
 =?utf-8?B?dFQrM3RuN0cyWlVocktYaXVGWUh2MkM3NlFjMEt5RVJrc1hzOXlhUkJzM2xV?=
 =?utf-8?B?bllWN01JRlVJT2hKZ0E2MEF1aXJHT3ZBSXQwQjdqekkzemtXNjB5Z0FmRjRD?=
 =?utf-8?B?cW9qaXJYM3VNYlhzcHRlRE5Lcm43Wm5TYjcvR2tCK0NhRm9pUVhGT3FxTy9I?=
 =?utf-8?B?amJGbUduWGEwMExpWFFwQURCb0w0U0FGSkptZXlsRnQzMXFSdnVmdHFmVVd3?=
 =?utf-8?B?UFE4ZUR2V1VjMWY0UnZFNi9XM29ITUMvMTVjam1rV3RkVWQxcXozVGU3QmpK?=
 =?utf-8?B?MXFqNGlBeXlvcjVrcDJ0aVdFNEhxOFBzZndiSGVzWnR4YlMzTVF5RTgwSWxM?=
 =?utf-8?B?dTlEYWhFMTZ1S1R0elBNWDhPUmZzaklEUFlzdldBWnNMZFczcGFVdUF1OERI?=
 =?utf-8?B?ODBNenQ2Sys5M2I4L0ZwdWprTDcvWWRQdlNmOFYrZjRQbWtuRWtZeStoejZs?=
 =?utf-8?B?WEVTWGl2Q0ZkenNRYWkrbVdmMldESG52WWN3eFJVeFRaazdITFJkN244K1JW?=
 =?utf-8?B?a3dQeUJxVjFaTHhYZkhHTUkwRm1laktFMHl1NjUyb1JBV24wM0RJWW9FdXpk?=
 =?utf-8?B?WVdBQ3NKcUNOVkdRMTdCK3NpM2NNOUpNNy9FcXpsYUd2UVg5MU15R3hLUGNI?=
 =?utf-8?B?U0pDVlNObUtsbW9GZzIwSVRvN0wvQW5xQnBjYjV1NTVVdnIyelBVN2c0bjdw?=
 =?utf-8?B?dmhRV3Vxemw1VkZmVVUwMWlJRnJTVHZRZEIzaHo1cW8zcjAxRVVYcDZKMWdw?=
 =?utf-8?B?WVZYSzMzckhFcGpGaS9NL2F6ZER0Q2pnblFQU0x4eFc5aGw0SkNZNEJWRGtB?=
 =?utf-8?B?V0VLVW10N1gyMjhId1RRaEsySCtZOHJUSDk4WWtCVzRaY1pPZkh4aTRaWTdr?=
 =?utf-8?B?Vms2cHBkZVVGc1lUb3VDZFdDamFSVzdUU3RYUG9XSnhkTmdwd3FEcW9laFpG?=
 =?utf-8?B?TC9hY05YMzZDSlNrV1ZOYTFFbXFEMUNIN0dvcGJRZkczSEhUWTVybXYxeDVz?=
 =?utf-8?B?c2VVeHVKemVZZE5xUnZRYmJWSms3cjZpc2tWYnN2TnhLazdhVWczdmRaczcx?=
 =?utf-8?B?R2ZERWhMajNYNnFtTlc5ZXhPcXVBNE5aem9HcmYzdDRNdWtmY2xZWW1uUTRD?=
 =?utf-8?B?U3J6OHljZGVQM05PMnBlVmNGRVYrUm1XbFIveU4za3VlRHZsUXpBdnJ1WXNC?=
 =?utf-8?B?ZGdlOXp0UUNTMHkwNlV2c0lDQXJYdG9UbzRMcXVlQXRTWHJsejVMRmVzMHkx?=
 =?utf-8?B?WmtKVzVzeVRRS0U4NXZJSWQ4ZFZHSExFSjdlZjB0dHZmY1pqMFltWWJaamxz?=
 =?utf-8?B?ZzBlQTB1YXFZN3huNEs5YmxJZi9NOFRGL3NUVzVOQmZNMGFIbWUxazdMRDc2?=
 =?utf-8?B?eUJqSHRCdkFZblV3WWIxNE95OXBPS2p5NFlNT1J4TDd4RUFPeXFiM0dGMWNX?=
 =?utf-8?B?ZTVxY2pRSDhaUGxZejJlejFleUlRU3ErZ05QLzJvNXpvWWtRczMwbkxWYzV3?=
 =?utf-8?Q?Jt3TD19lnkhNO97HzUsbwd3Zz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 253e22ce-ba3b-4e73-d6c9-08ddffba3e84
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 00:42:33.6489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: geDCVIemlDpDTl5hDEHjW5zJKR475xBwuta4VU/lcnZ5s6uTHBUY/X4xcJvuRYPFWJ14VGctpTGRR9/TbUewSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5936
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


On 9/29/2025 2:15 PM, Matthew Brost wrote:
> On Mon, Sep 29, 2025 at 09:42:55AM +0200, Michal Wajdeczko wrote:
>>
>> On 9/29/2025 4:55 AM, Matthew Brost wrote:
>>> From: Tomasz Lis <tomasz.lis@intel.com>
>>>
>>> Protect access to GGTT config as this is non-static information.
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 96 ++++++++++++++++++-----
>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  3 +
>>>   drivers/gpu/drm/xe/xe_sriov_vf.c          |  6 ++
>>>   3 files changed, 84 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> index 0461d5513487..016c867e5e2b 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> @@ -440,18 +440,21 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>>>   
>>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>   
>>> +	down_write(&config->lock);
>>> +
>> still didn't get answer to my earlier question [1]
>>
>> [1] https://patchwork.freedesktop.org/patch/676375/?series=154627&rev=2#comment_1240924
>>
> Again, this isn't a patch, so I believe Tomasz will need to chime in to
> provide an answer or conclusion here.
Now answered.
>
>>>   	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
>>>   	if (unlikely(err))
>>> -		return err;
>>> +		goto out;
>>>   
>>>   	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_SIZE_KEY, &size);
>>>   	if (unlikely(err))
>>> -		return err;
>>> +		goto out;
>>>   
>>>   	if (config->ggtt_size && config->ggtt_size != size) {
>>>   		xe_gt_sriov_err(gt, "Unexpected GGTT reassignment: %lluK != %lluK\n",
>>>   				size / SZ_1K, config->ggtt_size / SZ_1K);
>>> -		return -EREMCHG;
>>> +		err = -EREMCHG;
>>> +		goto out;
>>>   	}
>>>   
>>>   	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
>>> @@ -460,8 +463,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>>>   	config->ggtt_shift = start - (s64)config->ggtt_base;
>>>   	config->ggtt_base = start;
>>>   	config->ggtt_size = size;
>>> +	err = config->ggtt_size ? 0 : -ENODATA;
>>>   
>>> -	return config->ggtt_size ? 0 : -ENODATA;
>>> +out:
>>> +	up_write(&config->lock);
>>> +	return err;
>>>   }
>>>   
>>>   static int vf_get_lmem_info(struct xe_gt *gt)
>>> @@ -474,22 +480,28 @@ static int vf_get_lmem_info(struct xe_gt *gt)
>>>   
>>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>   
>>> +	down_write(&config->lock);
>>> +
>> also, commit message says "Protect access to GGTT config "
>> while the patch seems to apply locking to the whole config ...
>>
>> what's the rationale to extend this protection?
>> just unification?

That's true, the title doesn't match.

During post-migration recovery we call the whole 
`xe_gt_sriov_vf_query_config()`, which was the main reason I went for 
protecting the whole provisioning.

Since we can query GuC multiple times, narrowing the protection would 
work as well - it would just be a bit unusual to allow two threads a 
race over writing provisioning info.

But since these values never change, both would write the same, so no 
visible problem.

If you want, I can remove the protection of anything other than GGTT. 
The solution would be then a little confusing maybe, but would work the 
same.

So, which way do we go? Fix patch name+comment, or fix locking range?

>>
>>>   	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_LMEM_SIZE_KEY, &size);
>>>   	if (unlikely(err))
>>> -		return err;
>>> +		goto out;
>>>   
>>>   	if (config->lmem_size && config->lmem_size != size) {
>>>   		xe_gt_sriov_err(gt, "Unexpected LMEM reassignment: %lluM != %lluM\n",
>>>   				size / SZ_1M, config->lmem_size / SZ_1M);
>>> -		return -EREMCHG;
>>> +		err = -EREMCHG;
>>> +		goto out;
>>>   	}
>>>   
>>>   	string_get_size(size, 1, STRING_UNITS_2, size_str, sizeof(size_str));
>>>   	xe_gt_sriov_dbg_verbose(gt, "LMEM %lluM %s\n", size / SZ_1M, size_str);
>>>   
>>>   	config->lmem_size = size;
>>> +	err = config->lmem_size ? 0 : -ENODATA;
>>>   
>>> -	return config->lmem_size ? 0 : -ENODATA;
>>> +out:
>>> +	up_write(&config->lock);
>>> +	return err;
>>>   }
>>>   
>>>   static int vf_get_submission_cfg(struct xe_gt *gt)
>>> @@ -501,23 +513,27 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
>>>   
>>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>   
>>> +	down_write(&config->lock);
>>> +
>>>   	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY, &num_ctxs);
>>>   	if (unlikely(err))
>>> -		return err;
>>> +		goto out;
>>>   
>>>   	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY, &num_dbs);
>>>   	if (unlikely(err))
>>> -		return err;
>>> +		goto out;
>>>   
>>>   	if (config->num_ctxs && config->num_ctxs != num_ctxs) {
>>>   		xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
>>>   				num_ctxs, config->num_ctxs);
>>> -		return -EREMCHG;
>>> +		err = -EREMCHG;
>>> +		goto out;
>>>   	}
>>>   	if (config->num_dbs && config->num_dbs != num_dbs) {
>>>   		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
>>>   				num_dbs, config->num_dbs);
>>> -		return -EREMCHG;
>>> +		err = -EREMCHG;
>>> +		goto out;
>>>   	}
>>>   
>>>   	xe_gt_sriov_dbg_verbose(gt, "CTXs %u DBs %u\n", num_ctxs, num_dbs);
>>> @@ -525,7 +541,11 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
>>>   	config->num_ctxs = num_ctxs;
>>>   	config->num_dbs = num_dbs;
>>>   
>>> -	return config->num_ctxs ? 0 : -ENODATA;
>>> +	err = config->num_ctxs ? 0 : -ENODATA;
>>> +
>>> +out:
>>> +	up_write(&config->lock);
>>> +	return err;
>>>   }
>>>   
>>>   static void vf_cache_gmdid(struct xe_gt *gt)
>>> @@ -579,11 +599,18 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>>>    */
>>>   u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>>>   {
>>> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>>> +	u16 val;
>>> +
>>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>   	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>>> -	xe_gt_assert(gt, gt->sriov.vf.self_config.num_ctxs);
>>>   
>>> -	return gt->sriov.vf.self_config.num_ctxs;
>>> +	down_read(&config->lock);
>>> +	xe_gt_assert(gt, config->num_ctxs);
>>> +	val = config->num_ctxs;
>>> +	up_read(&config->lock);
>>> +
>>> +	return val;
>>>   }
>>>   
>>>   /**
>>> @@ -596,11 +623,18 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>>>    */
>>>   u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>>>   {
>>> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>>> +	u64 val;
>>> +
>>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>   	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>>> -	xe_gt_assert(gt, gt->sriov.vf.self_config.lmem_size);
>>>   
>>> -	return gt->sriov.vf.self_config.lmem_size;
>>> +	down_read(&config->lock);
>>> +	xe_gt_assert(gt, config->lmem_size);
>>> +	val = config->lmem_size;
>>> +	up_read(&config->lock);
>>> +
>>> +	return val;
>>>   }
>>>   
>>>   /**
>>> @@ -613,11 +647,17 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>>>    */
>>>   u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
>>>   {
>>> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>>> +	u64 val;
>>> +
>>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>   	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>>> -	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
>>>   
>>> -	return gt->sriov.vf.self_config.ggtt_size;
>>> +	down_read(&config->lock);
>>> +	val = config->ggtt_size;
>>> +	up_read(&config->lock);
>>> +
>>> +	return val;
>>>   }
>>>   
>>>   /**
>>> @@ -630,11 +670,18 @@ u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
>>>    */
>>>   u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
>>>   {
>>> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>>> +	u64 val;
>>> +
>>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>   	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>>> -	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
>>>   
>>> -	return gt->sriov.vf.self_config.ggtt_base;
>>> +	down_read(&config->lock);
>>> +	xe_gt_assert(gt, config->ggtt_size);
>>> +	val = config->ggtt_base;
>>> +	up_read(&config->lock);
>>> +
>>> +	return val;
>>>   }
>>>   
>>>   /**
>>> @@ -648,11 +695,16 @@ u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
>>>   s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
>>>   {
>>>   	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>>> +	s64 val;
>>>   
>>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>   	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>>>   
>>> -	return config->ggtt_shift;
>>> +	down_read(&config->lock);
>>> +	val = config->ggtt_shift;
>>> +	up_read(&config->lock);
>>> +
>>> +	return val;
>>>   }
>>>   
>>>   static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
>>> @@ -1044,6 +1096,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>>>   
>>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>   
>>> +	down_read(&config->lock);
>>>   	drm_printf(p, "GGTT range:\t%#llx-%#llx\n",
>>>   		   config->ggtt_base,
>>>   		   config->ggtt_base + config->ggtt_size - 1);
>>> @@ -1060,6 +1113,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>>>   
>>>   	drm_printf(p, "GuC contexts:\t%u\n", config->num_ctxs);
>>>   	drm_printf(p, "GuC doorbells:\t%u\n", config->num_dbs);
>>> +	up_read(&config->lock);
>>>   }
>>>   
>>>   /**
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> index 298dedf4b009..d95857bd789b 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> @@ -6,6 +6,7 @@
>>>   #ifndef _XE_GT_SRIOV_VF_TYPES_H_
>>>   #define _XE_GT_SRIOV_VF_TYPES_H_
>>>   
>>> +#include <linux/rwsem.h>
>>>   #include <linux/types.h>
>>>   #include "xe_uc_fw_types.h"
>>>   
>>> @@ -25,6 +26,8 @@ struct xe_gt_sriov_vf_selfconfig {
>>>   	u16 num_ctxs;
>>>   	/** @num_dbs: assigned number of GuC doorbells IDs. */
>>>   	u16 num_dbs;
>>> +	/** @lock: lock for protecting access to all selfconfig fields. */
>>> +	struct rw_semaphore lock;
>>>   };
>>>   
>>>   /**
>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>>> index cdd9f8e78b2a..d6e2ed9b9bbc 100644
>>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>>> @@ -197,6 +197,12 @@ static void vf_migration_init_early(struct xe_device *xe)
>>>    */
>>>   void xe_sriov_vf_init_early(struct xe_device *xe)
>>>   {
>>> +	struct xe_gt *gt;
>>> +	unsigned int id;
>>> +
>>> +	for_each_gt(gt, xe, id)
>>> +		init_rwsem(&gt->sriov.vf.self_config.lock);
>> as before, this should be done in
>>
>> 	xe_gt_sriov_vf_init_early
>>
> I pick up this change but again I think Michal's need some answers to
> his questions.
>
> Matt

Sure, that is also very early call so we can move it there. (As Matt 
actually did, just not in this patch.)

-Tomasz

>
>>> +
>>>   	vf_migration_init_early(xe);
>>>   }
>>>   
