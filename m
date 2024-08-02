Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF22CC52D6F
	for <intel-xe@archiver.kernel.org>; Fri,  2 Aug 2024 18:08:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A19510E0CE;
	Fri,  2 Aug 2024 18:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VMlpJe8N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80BA10E0CE
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Aug 2024 18:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722622118; x=1754158118;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jofDJIDJKvuPwJQsls5iSIkHiXt+cj0urIYSImIVwxQ=;
 b=VMlpJe8NKTmPvQ1apPuw/5wMuSDEl9vquCsPI3y4qlVI0BwF9LxLhpUc
 hn4r23Hg4ZGjhY85Qfds8fdWB3h9HNohlC+/67VeF/iJ0PWJ547SU6bXf
 WE7VbxrpyZp3QheX6JH6G+B6tTG18CtOA35IkHb4q3SIEROG7SQAakO/7
 Gbjn8Bzvuq1F1z+0GNfD2mwWkHdKvOi88AT9LvIl2Hp/+F0lvHSkP+ugR
 OZNUJ84Tu11DgPFcr664dlH8oYJOcvqrxH1tPkkbHVMgUWCAFuIO+Ykc2
 hOfNzc8ppVh5HYiZRnHzoJ+ZrHdKKF7yKV2VJxoFGREurg4BRfP/p7eb5 Q==;
X-CSE-ConnectionGUID: YvXTzMz0S1mNA6gB0/pAdQ==
X-CSE-MsgGUID: XWOJ6kVYSP+4ynal/NbWGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="31230404"
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; d="scan'208";a="31230404"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 11:08:37 -0700
X-CSE-ConnectionGUID: 1Cu45No0SrCqA4fCYKb/gg==
X-CSE-MsgGUID: fuIMN7T9Qbua27vzVPbfSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; d="scan'208";a="86080363"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Aug 2024 11:08:38 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 11:08:37 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 11:08:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 2 Aug 2024 11:08:36 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 Aug 2024 11:08:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFrTSGdClF3qOirR+WcRBdF6g1HmRhZ3Y3fOqZd/aE1Fm4ioehqWuoGih69mF8IScJiGSaqbMMa1WKu82BLsanY+smcF2u74pMuADnY34gEZ77+5OiYATCdB2JSG14h75bvF5VcLdRH14K2TP7zlgGeUGs7DMEiRYvLPeOeCXEO7ZXt0AA4U39xyZL3c0S0wNBnrULTF1FCXuCkmYmmnOgKQzVQAYTW5+4O5fIAYBnAV2fB8Ww/Khh6UCv9KB7KwxbgiGszE8J3vaotaJ3zmfYqQMMtCrnTXLeOLv6cCeDRKjbNnBFMvMQObEkUyFnILQ330HePHPefwAThbIU8G+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+T8ujwqw7e38qftJYaOf/yh1FVXjJs0b9qITdbremE=;
 b=UdZPZkw2SWDWFMb1O3w8ATWx/Uii2OQ7AAte8Jy8bF0Xx510G5XufEqOtqoYfZ0JB1mDW9iUJyrZN8ZKtLVlxeLqH0xd1/oGoldKnqs3GfPTM3wGy0BwgP7lEaSpLsuAsihrJ6IriBjsVXc2mLMhYE9SJo1z5QwJgcF0gWphqtBcXwhhDWTYVVVVgezykJH2wR38Hpa0PQwyA6PpAevDfqj6JqZ90G3d1atUJGHnOCHCWIdj0Tf1qsWkM8ss7IpgnTxAn4eHbAbxXmwHPwRTPAHAzUPRIN2A0mAKehPYT9Pg2dhVdD+KZaA37pXh/zQqa1CEAclKjYYOnGt6sghr0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SN7PR11MB6680.namprd11.prod.outlook.com (2603:10b6:806:268::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 18:08:32 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7828.021; Fri, 2 Aug 2024
 18:08:32 +0000
Message-ID: <d8322a01-7f66-4998-913f-536e0a3a0d99@intel.com>
Date: Fri, 2 Aug 2024 11:08:30 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm/xe/guc: Drop use of pre-release GuC
 definitions for LNL and BMG
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240801224241.3050352-1-julia.filipchuk@intel.com>
 <20240801224241.3050352-2-julia.filipchuk@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20240801224241.3050352-2-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0073.namprd05.prod.outlook.com
 (2603:10b6:a03:332::18) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SN7PR11MB6680:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f2b01bb-f924-4fe3-8594-08dcb31e1e8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDQySmFVNHFzSFRrcFduZW9lME1CZ3RDT1RiaDlrMW90NnJ6Yk5OWXYxa0Q0?=
 =?utf-8?B?bE1MY3AzN1Btc2dlL1JRNGdFT2FDRW84am9uYk8vSUE3eUM1OXFOY3RLSlFx?=
 =?utf-8?B?KzF0OUMyOGRaeUFjRDlaTXlzc2NhNnp5S1dvajZvNEF6d1E3ZGpwaFVDRCtj?=
 =?utf-8?B?R05CVmRJN1YzVjI0bUdPTERIckRhTlZ6N0REcTF1V3hWMW1YUlE1bDUzYVpo?=
 =?utf-8?B?Ui9QTXhEdFNvcGpUU3FPR0lRaUVvQlhDV0tMKzVFd2JybFpCaHFRZ2U2ZDRW?=
 =?utf-8?B?V2k4U0pYQXFnRFFGNnFSZUNUNHdmVVNQSTZ2MWc3SGRCc2I3T1doMEd3QlZ3?=
 =?utf-8?B?WHlBdzBHQ3ExOGJncDl3NW1yYnBqRjZNN1BNaFlLWVhzSmp3dWFHc2EvdmZm?=
 =?utf-8?B?dWZzRU50cWl4Vk04RjZiVEFhbDlZVTlzVUxoT3k3QVNLaERXRGszSXU3RC9E?=
 =?utf-8?B?VVA3QnJSUzJWZVFoaUpUQ25lMzd1d2RSZ1JYSGI4WTZjR1g2b0RxUEZ4aUNU?=
 =?utf-8?B?Zzk1QTdMMXNDMnc2Ny9Ub3lNZS9IME90Q3VwellKYkZKZUlJT2xvSHRxNXU5?=
 =?utf-8?B?aVNJZ3hzSGpPeXdzQXJDaVpNSTNjalRBSzZUOTF3RExVTUdpaDZOYmNTd1RO?=
 =?utf-8?B?bWdCdFBzdUo4Y05aeWhSMnFQZUZRd09HNE04VHc2c1RESkJmeGF2amllamUr?=
 =?utf-8?B?SnU1WStnNDZGTXNyYVZMbGRDUWhkMlBwUGRjQmoxL2xJLzFDRWlNdzVQSk5X?=
 =?utf-8?B?WlBzcEVYcmRRdXJjMFFvNmFKYlNxR3o3WFc5WU9TSG45RGJUQ3p5S2Z4ZzBu?=
 =?utf-8?B?dWxPMDJBUnFONHY3SWE4Z3dIMVlIS0JkZWJ6RzZsMUpCM3dYYkltcjBXQXNa?=
 =?utf-8?B?eFk3VWgrTUF0S0VDcEtsNzlmWnhSb0YyS2FZdG85U2ZYeXFGQXJIcGs1RWFj?=
 =?utf-8?B?aG1WZ0tWSEJCSWJCK01idlJ4WC9JTUE1ZFEvMFc4S2tLYjhaU0RlUS91eDVi?=
 =?utf-8?B?WFJTSXQrb09ybHBtNnVOa1ZFaVZNeUcyb25mU3BOTVU5dFE4aUdmQktFcGxR?=
 =?utf-8?B?dnE2eHpIZGE3aGdxYnFJbTZ2R3NwMDZHWHpURkVHdlNXSWJpY0FtRlV2eS9K?=
 =?utf-8?B?VVplU0ZYUkRqZ0prV3MrZC84bWxFamZzSFcvUWxEUTFvSUZJd3pJcDVpVUZt?=
 =?utf-8?B?a3hjMkkzeXMwWCt1L3JJZlh0R1hxV29FOEh5L29ucFVMekNvR2hZRGJyQkxz?=
 =?utf-8?B?T01YN0lXUXM5RVl5blRIUWRMSWk0UXN5ZWtDVlBWblV5eTJYcjBzTGFvYXhZ?=
 =?utf-8?B?aktDbXAxV0Y5UzdOWWloalJOYkxJRmxPOUg0R2hHTWFEMTYyVktuOUV2Uzdy?=
 =?utf-8?B?SmFsUHRMYmRVUmUzc1RtYzJwcDlwejNvd0lVSHNRTCtRNDRZTExGWkdsNVEz?=
 =?utf-8?B?SG5jS1Rod2kwcVhlSDNWbHNSeDEwOER2c0Z4d0tXTUVhZUJqOEVPQ0hVY2VW?=
 =?utf-8?B?WGtSV2VUU2l6bnJjWVJEZ2lpZVErc29KaEdtSVIydGZvZEUwUlJ5aVAzNjZL?=
 =?utf-8?B?djIrSzYra1VMMStnKzhEelgrTDlHQUZkWk1qTk5tSFlCQjdVUXJvb1hhTzdt?=
 =?utf-8?B?YzlpZmlvV0hBQUVOOTU5ZExBT1Q5N3NJb3FpSjUzZCtaWmR5bE9jU1dUREht?=
 =?utf-8?B?M0NCQjBNeHpZZUVKemsvOHQwYXp0bnkvT2ZnMWV6NGZ2NnpvZjI4N1U3QTZw?=
 =?utf-8?B?bzhFQXRnaTV5WGdDUEptMlBsK2loVlZkV21weG9jKzBzWTh2bDJCK1dRditj?=
 =?utf-8?B?OUc5ektqa2RIMXlRQVprUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHFXa0xEZjY4L2ZUN01EVkN3eWJQa25KZG44T1lIUTBZVTFGUklvMTF1Mjds?=
 =?utf-8?B?MzJPalY5M2ZxaktqSUdnTVJsNFlOYTQza3ZDc2lBM21hNFdsMmsyek9sVzNW?=
 =?utf-8?B?N2oxYzREQzlBSTJML016Z3hjMlZXa2k1Vk5WTEhuNStDN1I3WHVlV1ZTdDlj?=
 =?utf-8?B?RTE4ckdnakUwQUpmRm5IdGFUQVQ2aExHNnhRSFJTcjg5bUNMcURMakN2VVZK?=
 =?utf-8?B?YjhEaVRyaml5QXFiLzJFWVNPMUdlZlJpanlTM1BKeGFkYkFlRGRUUU9yNDlK?=
 =?utf-8?B?L3ZONm1wd1dBU1hHT2tkQVBaUmlKWnVIbFU0TXpidFBTZ2E1M2tldTRKUGJ5?=
 =?utf-8?B?U1ZKa1lSalFHWlBwYUJOVHhseCtONkloMUl6RG54d1YzVnZlaXNuTkhsZTJh?=
 =?utf-8?B?cXN3VEYxMnRsZXNTMTNEM04vd2kxUnpXVVU3TkhxRW14ZU9XUElZeTR3UWIv?=
 =?utf-8?B?dUsvU2JmYXZ5NUFqZVhhRXBWR2NpZ25ZbjBiN1FpREwzcm11dW9xRTliTlZj?=
 =?utf-8?B?N2FnNEpnYllLa21rVXV3dWo5TFY1Z1pkc0ZEN3lFczRkcWcrS1pvaEpReXBa?=
 =?utf-8?B?dWU3QlN3YVZBM0lvVDdFT21QSGh1V1F1YUdaanZ6SWxod0J0alg0K0RHaTli?=
 =?utf-8?B?MWE2ck45dS9oTXE0ODVqREl2Tk9LbTZ3QVdpNEM1bVIvQzZhbUtpeS93N0Fx?=
 =?utf-8?B?cGF0M1l1ekZyNHVKY0dmUkRFQkh0UXFWNWh4VGVCYWpEd3k2U2cvZ3dXY2Rn?=
 =?utf-8?B?WFB3TkxoSWswQmFPY1FzVDMzOGV0Qi96N1NlWjVIMmc5bEthM3d5ek1hd2dW?=
 =?utf-8?B?RWlOTXpKMkE4QUdCdFFBZTVFcENhZjVvb2E4YU5QV3hrYlBFaStPT3NGRGZM?=
 =?utf-8?B?VmNvY3JkMVNRcFovM2JrNHVLaG1UcmV5bVc2UkFTMUJYTXgxY1FXRWMvVDdR?=
 =?utf-8?B?aVhRWWZRVDFNOHk3YnF6TzlZM1g4UE5TRjU4QXlJdThXM1FjMTFBOHdKYTlG?=
 =?utf-8?B?cC9QaCszUkR5aWpTekJWMnUvaFdBdnJDVU9wK2U2V1NSY0ZuQXhLcWgrWTVL?=
 =?utf-8?B?L210UXFCaGRTeXl5NE1UTnpCL0p4WkF2TURSUHZvOEY0KzRXNGk0dXhkQStI?=
 =?utf-8?B?dDgzMWRxdXNUakVVK2ZXZyt4ZDlheFlIN2ZobDZ3TW1nK29sN0JsL2VUeHVp?=
 =?utf-8?B?UTU2aC9zRHZwZmFBcWx1OHkwNUtnN3FQSTdzZFI3ZS9KeldiTURITGQzVjU4?=
 =?utf-8?B?MkRhQ0ZtT3lxcUYrT0xKZUZUT3N2SVBuSVpkaENka296Z0NOb1JWZkNjbWoy?=
 =?utf-8?B?NGNOSU1MVGxmMWpGeXIxQ3hGTDg4QkRiVERTNU1uZjBmUjUzNk1hTXhBQUVU?=
 =?utf-8?B?bTJVK3BWS0liR3RTSTVHVngraXVtdVBUUGIySTQzRi9wMmlPZXJENEtMU1BL?=
 =?utf-8?B?ancwdXkxUUNYVGtsaitYczdvTGJ3cUhicDNKdnVaTmltemFRKzBCQllyRENo?=
 =?utf-8?B?RkNmNmd5elhxVmVSd3hwMEJ6a0RjR0dTNzhOamUvQjFNNzNyRk41bEFneUl3?=
 =?utf-8?B?ZmtTeFIyYVJsenhLMVhSV0VzazF1S1cvSDhZdjNMbzdBdGQ2b2NNZm1BNUIz?=
 =?utf-8?B?WVlScm5EbnRPeG80U0RlQlBKdms3eFRFWG1jYnB6QllKSEtLb25jS3cxN1pr?=
 =?utf-8?B?VjQ0c0FFd1VINGwvdSt5dFQrU2tzZnRGUmlvUEIvQ2tpdk9TUFVRaDFuUnNM?=
 =?utf-8?B?NzhSRmF6R1JVT3BIeDAxbWdpTWJQVXRXbDVtSnh4Wmt2dy81MHp2VnhFeXpN?=
 =?utf-8?B?NUNjTzV3TEtoaXdMTTdIK21jNGNGNjJOMVhCRHNjYlBLZjczbmhnRUozOWJl?=
 =?utf-8?B?T3dOZlJBTXpiSDN5dzI3enBqWDdRUnFPcmRLQVZ4NzNaN05UYXBZWHpnS2NJ?=
 =?utf-8?B?bXRLVklzRGVQVm1nNmlFQ2VSVTcvdGhIZXVaRyt4SFV3Ti9HUEZXRzNOa041?=
 =?utf-8?B?QmNmMTcrd3I5bXhPTERUS2xaUGRlNEFrbFlyYTB2cG5YYmw4UWExRHZkK21k?=
 =?utf-8?B?SGNnZEhybWV5NFQwekVhTkNJWlNlcitzQjA3MEMyQ3ZYOXlGVEx6MnpBbU8w?=
 =?utf-8?B?Y1liMXRxamFCL1RBOEk4K2EwRjhCZ0FOOXlzNGF2Z2czZDl4RTVpT3VMaW5N?=
 =?utf-8?B?OFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2b01bb-f924-4fe3-8594-08dcb31e1e8b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 18:08:32.3791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: McnDrcZ2/VVRPbmuyVi7nbT9sTFQKvxoZitnPCMaCWvmnUcw8UKMJfUpwhGZ6wUPtsJ2aK1pknOPefP4WCqFlBSqmtVYAl6S8/5lPPGsakY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6680
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



On 8/1/2024 3:42 PM, Julia Filipchuk wrote:
> With BMG, LNL guc binaries ready in linux-fimware, we remove pre-release
> definitions to prepare for final defines of recommended firmware
> version.
>
> This patch is meant to be squashed with the patch in xe-for-ci that adds
> the definitions ("drm/xe/guc: Pre-release GuC firmware v70.24.0 for LNL/BMG/PVC"). We want to keep the PVC definition from that patch.

The code below is a full revert of that patch (which is the correct 
thing to do), but the commit title and the text above don't reflect that 
and instead only mention LNL and BMG. Not a blocker since we're not 
going to merge this patch and we're instead just going to remove that 
one from the CI branch.

Daniele

> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 6b92255a769d..5b70d23724c4 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -105,10 +105,8 @@ struct fw_blobs_by_type {
>   };
>   
>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
> -	fw_def(BATTLEMAGE,	major_ver(intel-ci/xe,	guc,	bmg,	70, 24, 0))	\
> -	fw_def(LUNARLAKE,	major_ver(intel-ci/xe,	guc,	lnl,	70, 24, 0))	\
> +	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 19, 2))	\
>   	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
> -	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 24, 0))	\
>   	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
>   	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 2))	\
>   	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\

