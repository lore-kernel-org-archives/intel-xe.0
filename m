Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E10ACA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 19:47:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB19110E7FE;
	Tue,  9 Sep 2025 19:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8f+Q6et";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803BF10E25A
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 19:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757447268; x=1788983268;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6+eU1th5jST8BThby5QlLCxv8vYMhy2tBRWMrDRYxuE=;
 b=h8f+Q6etjWT3CZaa845rLkukOi90yq0lzUNlj5oXFNfnVmAFNlowJN80
 HCKoWL2HJU3zy+dxB3eqyprr0ygfOqctXaNiIgBFG0Y9fnXKlT21Z5J6k
 /cx5YWDD67qUAkylAEieCmhsg8XvUQFYTWKR8GrNFHove9X5FGi0o6QC/
 2x4R+Dr1IIPi5RrVL67ykr38fB0XXCfLlbUyZX1AZis/xx99bqcRWHUkj
 DLCO4KoXTf7zFoYSQQ8Ro7ITOE34RONNx39Q8kcEpgQe2nnkNrBOk61mo
 UKjwTYTsD3XfcAo84D+7zb30W9StWsRZDKWC9P8pKGSEH5HC2ksIzUD8Y g==;
X-CSE-ConnectionGUID: SbiU83kxQPmS4O9kEbZJRQ==
X-CSE-MsgGUID: 9aXeaEpQQT+nMTdYhRN9nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="71164250"
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; d="scan'208";a="71164250"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 12:47:47 -0700
X-CSE-ConnectionGUID: sBxuJQcxQyyQunMiGXzpXg==
X-CSE-MsgGUID: j8HgQEXgQpS12CcB2yWsMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; d="scan'208";a="203951917"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 12:47:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 12:47:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 12:47:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 12:47:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CUKuw3E0dA0lfM+cZPj6alwNQhM/FMqWwj2ys617pu1ZRB0WCR3v2DlhIh/2JOa9Xy8Lvdrnzp8mzU4GAy+TSSh/4z/6FGZHlka7NmZOMUvxYMuICtM3b+TrmioaNjo0Tr0D7bAN+9SjU6pbzTty0VUpzDrvIVOj1IdTGMZxllwjzdoTX2dP2UynSkINjrPQ9Z7Ck+I/ZkpoQBX7YvnPSQfO8nhjLXrvLvoi/cIY+97/VOHXPM0vZjz3hN9HgMsRwAFlIOkEBEQ2gi0ukVJNK/l5XuGKjNsXMXIvcOGkXXFOuEKw6X3/UDmpET/7dB5HQMol+2rRDCaHwtnawz/2rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clvool8ss5sHIwy4ZDH49z4t9wmIJl4UMXs2lOy5LBk=;
 b=ku+Yl9RGwdL/bakQ18t+aKuepWE1Hq14ez416V0kA1ClBEdv0GGMgnk/Fd00MLnUGE9U/YCDNt0sEtb8J6E1Izx6wTR0hE3BcBz7nKO9wXrzldJzVI51j/4SuSJXZPFeW4TWEPSmrcERH14F5Jdb1HZj0l4YPCkirB4HJVZyLAv8evWkHfaW+QqVZJQMcAz8AW6oMquoIpA3RVRVtqOfizUYYQOS9icsu04UNmYTMVHGWWfxImcwlYUPJL04kl+Nx9tPy0TufhD4KhkJk8lkySpGOq61KXbgqmuFKf/0JJBPk8BmhasZKgyJtCjgbYyCN4o7Olt4h5N0EDpk/rDWLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by DS0PR11MB8667.namprd11.prod.outlook.com (2603:10b6:8:1b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 19:47:44 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%5]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 19:47:43 +0000
Message-ID: <5dbf5476-a2b8-4eb5-a436-632d4bf5475c@intel.com>
Date: Tue, 9 Sep 2025 12:47:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Move ADS BO realloc to xe_guc_ads code
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20250905143538.7927-1-michal.wajdeczko@intel.com>
 <e505dfe3-19ec-4323-8833-30a5b00efa19@intel.com>
 <c599e5f8-ae8b-4437-89f0-f3246544c502@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <c599e5f8-ae8b-4437-89f0-f3246544c502@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:303:2b::15) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|DS0PR11MB8667:EE_
X-MS-Office365-Filtering-Correlation-Id: 182097ce-c06f-4045-b254-08ddefd9be52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3J5UHY1aEdUNFBYZGdlTkFHcGwwRHZTd29GRUNpNjZocjNZMFprZHpRVE1x?=
 =?utf-8?B?UnFGcENWSkhlRmMzRmtRelFRZVRMNFd5bm5wZmh0Y0ZxdE9hMzhBbG5hRzl1?=
 =?utf-8?B?ZXZJUVcrcEVrb3lBendqNHc5MjRSNVpyQW1VNUpKRmg1SmM3SWMwTWVSY3Bz?=
 =?utf-8?B?TXc5U09CSDdzM0Rjd1ZBbWtXTE9laXQrc2lxQVc0T0dlQjk3WUZWNTh2ZTIw?=
 =?utf-8?B?Zk9UeVRhM1RVQzlDVW8vWGhobGVMZXI4WXlsR3B4c2dzRUtORkNXVmk1Qk5Z?=
 =?utf-8?B?eUhLaGhtaGlONkc2ZDRhUXhYSjZXMXlLSGNIZVEzaXczZnBmMGRsOXIxVEVo?=
 =?utf-8?B?c3RuZFhYZ01YZHZmUnJTeHhiYlVNRnBaa3NYdXNBWWthZkNJYTdtdHQwWksy?=
 =?utf-8?B?OWdVQ0VraFREVm5DU215OEtzeU8zdng4RFBUcVhxTEdYdUNMbm1iWXk3RzlT?=
 =?utf-8?B?MDM5aFVLdzZoUzgzb3E1VnNxUHhqY3pzd09iN3FCT0FpL2JqZFp0SVBLRmdW?=
 =?utf-8?B?TjliOTNHU3RWU3NrMWtIb24yZWxIeU1DSWZFdDJpMS96L1BwSGtXNXpCRlBU?=
 =?utf-8?B?cDFOeXd5Y1VUVFkxZ3RvRUVlZ0ZSQzNpODJSZ2hsU09CMzkwcyt6ckkwWFZi?=
 =?utf-8?B?QWlqOHRPcUNtV1p0MWZuNlpSUUlUeW1mb1NKTFVXQUNjQ0dKSy9nOWp1Rk9T?=
 =?utf-8?B?TmY5RlR1aUVYMm1LajcwZU1FeTh1Mm5pWXh5YzZNNHlpL2FQeGcrSndIYVpj?=
 =?utf-8?B?RlI0MU5rZmZ0YkM5ajZBaW9QNnd4eFZUWnNzU3MxYzk4ZWhEeW16ZUxxMGFV?=
 =?utf-8?B?V0Zzdzg5dGlqTGd3Nm5RZm52Z0EvTk4yekMyWWZzS0llcWFzdEhVWWtYLy9k?=
 =?utf-8?B?cEpsU3FmYitXNEl3bWRpRG9tVGppemZ1Y1hVL0E5czhMUUdVZ1hRRGw4TDBB?=
 =?utf-8?B?ejc3WHYvZHdxU1pVQnlCZS9GcG11OVYvbDdSQ01JTDRhWGVIWlJOVEVoTUlW?=
 =?utf-8?B?NlFmbkU4ZFNKQlNyRmdsYTNPWEo3TmNSZEVjYlRlTXZRSmVkbWp1NjFQNmda?=
 =?utf-8?B?aEVoWUxBTlNTQWNJNUNlemg4N0JraTd4RHQvbWNsWHZCWXhLSTUxVjZWYUV0?=
 =?utf-8?B?cjNGa1cyTHhFLy9aSnZkWVp6N3VJMHR6NEdvM2ZseDZ5eGhjampqSVpEeWxm?=
 =?utf-8?B?ZGY0QTdmb1BuQzQzNXVLcUNGWVl6OWlLYWdyd0hiMkVieWZYNzVCTkxFQWZV?=
 =?utf-8?B?TGhTQVhmNnE5N0lqZ3dCczR4VXRnQVZONVhpQThYWXZsNUN3RXlBS1ZBNjZn?=
 =?utf-8?B?NnVSbUt6cTlhbFBSbU4rRGNUTVhMcWM5WTBGQytCaE15bXFnQTNzcDhQZzUr?=
 =?utf-8?B?ZGc4SXhFOFl4R3FheGNtUHo3amd0Nm1KdXNBT29oOUlGOWJ1VjFlUUFzcXp1?=
 =?utf-8?B?bDhySnBWWDlEKzNULzl2NXArT0hGZHFyaHlrb1ZHLzNuZzVFWlFIb09MWlNK?=
 =?utf-8?B?ME5WbDhnTDMwUUpFVnhZM2JmdEFaMHdpMndpWVltMVF5QVdKY2hhVWJoSHRQ?=
 =?utf-8?B?Z2NmK2NJWkdvbzNnY0lac0ZqNjhYUm1yVmQ0QTFoSXlUWmJlMUFWK3g4d3Bp?=
 =?utf-8?B?VEpsZURoSUxkNEk4UlVRQ3RodzFGZFZoZHV1OGI2OFZhajJBOWdlaytVOHNN?=
 =?utf-8?B?dEUxYkZ6SzFQYlQxWHlvdk9nM3VGQlFOblZQTXYzaVhUM0Foc1pNNW1GS2JF?=
 =?utf-8?B?ckFsTWU5ZVBiVDdDMzhWVXVYblV3S1lTRlpYVnpRTThuWHA0ZXVXRmphdDV1?=
 =?utf-8?B?TmxzNk1TY25ka255dnVHR2lIa3NES0tnYm92enBCRm44Z3ErdFhvMDlvYXh1?=
 =?utf-8?B?VnI0RVZoR0VWQk5EanRSRjVFT1dSU0Z2V3RCcWhZaGgwMW1TYk84TUVHSkQw?=
 =?utf-8?Q?et63l0Bzi0Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWVQcDNYKzl4dTVlaW5uQU80WVZSajhMS2RFVjVpVHFqL2hQYWFHVEVYMnNy?=
 =?utf-8?B?SjFCZEtUaHBRdmJOU2NmOXYwcVRUZGpHQXdmZ2xUWnU5WnlXcjM5YnZPZXln?=
 =?utf-8?B?alZ6VDR6Sk13RDBpUTduV0NsNUlqQ1dWMUVjQ1lNODZDTDF1NzFDQ2JnVXhm?=
 =?utf-8?B?R0xLMCttZGQzSWc3OVRqcUh4amhSbWZpdk1MWVF2ajBVTE43NTFqcE9ka0Nt?=
 =?utf-8?B?SkZvZm91RlRaQVlrVCtFSWo5SFBoTjBYblpMVUtJUjVjTllNd0M4YzVyNkZX?=
 =?utf-8?B?RDlaaWZ2c2Z0TmhUZHMyQyt0SHEzVmhNQUJLR1Z2Vy9YYW1aWWRuUk0xazFD?=
 =?utf-8?B?VW8vU3pySEp0RGlhdmhKVzV5UFlPbXBCNVB6c0kyWC9HVmx4RTFqNFR3Q204?=
 =?utf-8?B?SzJrRkp4VC96cmMyVnpZK3Q1R0pSLzY5VFJubVhaTUIyQ2FEaWxIbTNoOHdh?=
 =?utf-8?B?Ryt6RGVZb2UwM09QQk16b25RY0VvQ1ZWY0J2cnFOOEtkT3JaTkljaFVMZytm?=
 =?utf-8?B?K2t6N0hOa0k5aTd6UTBHNDBSYU9KeFQ4ZFpaSHhSTUhjbHFyZGM0T0NxZXE1?=
 =?utf-8?B?OEVJYXFSOTBBYTU5OWtVMGNqMlhnTVlXQmZFQW5qczFrYm5aZzhMZUlxbG1h?=
 =?utf-8?B?ZWcrazZJbjY3K3Byem1KbndXajc3TndEOHlJLytsb1ZMNTZ2bUwxNzlvYldN?=
 =?utf-8?B?U1YxaHJkN05saGwvT29XQnkxaG0rd2xqaE9tc0FmV3JXRUhwWG1SQjhIempo?=
 =?utf-8?B?OGlVTEJGNTViUDlPcTVBQkU2V3RZc2pLMUVwYnZZekhjaEdReWF4N0Vodm9J?=
 =?utf-8?B?b1VwSUFtMGg5bXJLQkVITkQ0K2ZaYmxwaEtCQTNqN1FuTEcxOGpQYWZUU2V5?=
 =?utf-8?B?ZEswbXhrU2E3TnI2WjdLdzlSNzl6cU9ZV05FRWhBMHlsOFBpVktuZDBpaS9p?=
 =?utf-8?B?YVFVNDlSSTNtWElnbWhWRFg3NUxSRTZld3VycVJOZUR1NkZ6U0l2ZzAyU1hS?=
 =?utf-8?B?NG1SaEROR3N3SDdTdXJsTzNyMGJMemFvZ2Z1azJGSUtvVlVkV05lOTNjUU0x?=
 =?utf-8?B?QVV5SHg1bEFlclZpdFdqUmlEREZVUE04MFJibEVvYTB1YWF6WUp4c1piNkNQ?=
 =?utf-8?B?VUExdW1uTUJuTjJodWFtQkY2b1M0QVlvOEt1VkFHKytudXovZlROcDNWVHNZ?=
 =?utf-8?B?YmRFdzMvWFNFdFNoZGxiYVNySHB2bmFqb0RDZXZRV1NxbjQxM0c3LzN6dHNE?=
 =?utf-8?B?ZHlqQXY3cXRkVENmdmJaUmJ6ckRFMkp4eU04Y1RzZlMxWlZnL2lnZCtvVmwv?=
 =?utf-8?B?TkdiRFVPYnJIdzJWb2ZGUnMyWTJrNTR0ZXNVaWF4VlI4SkJlbGh1STloaHlo?=
 =?utf-8?B?UzVGSEFQdytTTmJPb2FSRlJGL2Fteno3YloyM3BscGhWQnZBakJxd0hlUEdv?=
 =?utf-8?B?VkhUUjU4cThZSGRma2tpT0pUNCtsTUZOT2lMSml5cmdYdm5YYjBZZCtHV2tZ?=
 =?utf-8?B?bjJ3MWVOamtSK3ptZ1duMWxzb3BCK25KbUVsR0dFbjdMLzZIU1ZYYXVOOUZV?=
 =?utf-8?B?Zi9saWVCR05Hd1VUSmJwK1VCa1RDZmJCbzhnblFwRmFkcDdVVFIzRUZ4cm1R?=
 =?utf-8?B?TnptMUNJUWdWQm9BeUtjUXNCNCtGOE8xYkJwcnVJOVBMbjFESlZFa1cvWmlo?=
 =?utf-8?B?RE1kYlpzbnQ2ank0amFSdXROT1FVV2UzM2o5TjRHTHRkYldZVnNNL01EZ2RG?=
 =?utf-8?B?L0NvWDB0TGc5K0dwMTQvSTNnRkE3RjBONzNJMDNFLzQvTTlqNVFVTnNLR3Yx?=
 =?utf-8?B?dGxnZDdQSkhjQVYxRjlrSy9LbTZUYnBwRnZpcit3WU5kWURwVmlnNDU4SmJy?=
 =?utf-8?B?UGc3RklRNXNRWjNxM1hUSVNGcWRpR2htSGJ2VlUxTklEdFh4U2gxWTRtSUlp?=
 =?utf-8?B?SWFkMTRUa1FJb0R4SnlWcDluZXdsZkI2SG9WaGxicXQ0Mkc4RzNlUlFEaVhU?=
 =?utf-8?B?aCt2SlcyUEFPYU5jamJZSlNkMUNRU1l1N0U3alREMXczNER3eHNWRGFobllm?=
 =?utf-8?B?d3hGV0pzR2lpMXAxcC9UdlhPTFVGeVk1bHUxQTJub3gwN0IyV0Q5eXpKNXRT?=
 =?utf-8?B?YWJwZEVOOHFVbmNkTGVSY1FRek1Wb2xyTWFUTWUrQXlIR1Q5eDhId2g2MzlE?=
 =?utf-8?B?Y0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 182097ce-c06f-4045-b254-08ddefd9be52
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 19:47:43.8035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bjuR4RMbiYxiM9RT2H68EUH3evWS3QgoQwwU075a8n4NXMmes694Hpwd+8cgy40+jBbZ/etHvMzRodV0Bz2dZ8CSYCkXcynQOUtnjQoEgI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8667
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

On 9/8/2025 1:20 AM, Michal Wajdeczko wrote:
> On 9/5/2025 10:03 PM, John Harrison wrote:
>> On 9/5/2025 7:35 AM, Michal Wajdeczko wrote:
>>> We already have dedicated GuC ADS function that is called during
>>> the post_hwconfig step. Move ADS BO reallocation there to have all
>>> of ADS BO management together. Note that since any BO reinit must
>>> be done prior to the point where we prepare GuC boot params, as
>>> those include BO offsets, we have to move up call to ADS function.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_guc.c     | 10 +++++-----
>>>    drivers/gpu/drm/xe/xe_guc_ads.c |  8 ++++++++
>>>    2 files changed, 13 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index b3a6408a5760..a62c483c9d88 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -705,10 +705,6 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
>>>        if (ret)
>>>            return ret;
>>>    -    ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ads.bo);
>>> -    if (ret)
>>> -        return ret;
>>> -
>> But the sole purpose of 'xe_guc_realloc_post_hwconfig' is to do the re-init in VRAM for all GuC objects. Why split the ADS object out and then have to re-order other things to cope. This is the sensible place for it to happen.
> But those "GuC" objects are not directly owned by the GuC (aka xe_guc), nor were directly allocated by the xe_guc.
> Instead they were allocated by the GuC sub-components in their corresponding init() functions:
>
> * GuC CT - see xe_guc_ct_init()
> * GuC ADS - see xe_guc_ads_init()
> * GuC Log - see xe_guc_log_init()
> *..
>
> So since we logically separated CT/ADS/LOG into dedicated sub-components, handling their internal data from the GuC level is a clear violation of the layering and we should continue to let sub-components manage their data on their own, and this means that it is up to them to reinit theirs BO at the post-hwc step.
>
> Note that in case of ADS it might even mean that ADS size can be adjusted as we know actual config (something that is not possible to be done at upper GuC level)
Then surely the correct change is to move all those re-init calls into 
per-sub-component sub-functions that are called from 
xe_guc_realloc_post_hwconfig. Layering is just a matter of adding extra 
function calls into the stack. The point is that this function was 
explicitly added as being the correct point in time / sequence to do the 
relloc operations. So having most reallocs at that point and one 
somewhere else entirely and having to hack around other sequencing to 
make that work, does not seem like the correct solution.

John.

>
>> John.
>>
>>
>>>        return 0;
>>>    }
>>>    @@ -847,6 +843,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>>        if (ret)
>>>            return ret;
>>>    +    ret = xe_guc_ads_init_post_hwconfig(&guc->ads);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>>        guc_init_params_post_hwconfig(guc);
>>>          ret = xe_guc_submit_init(guc, ~0);
>>> @@ -869,7 +869,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>>        if (ret)
>>>            return ret;
>>>    -    return xe_guc_ads_init_post_hwconfig(&guc->ads);
>>> +    return 0;
>>>    }
>>>      int xe_guc_post_load_init(struct xe_guc *guc)
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>>> index 5631722f34f5..fc2c37ca9dbc 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>>> @@ -424,11 +424,19 @@ ALLOW_ERROR_INJECTION(xe_guc_ads_init, ERRNO); /* See xe_pci_probe() */
>>>     */
>>>    int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
>>>    {
>>> +    struct xe_device *xe = ads_to_xe(ads);
>>>        struct xe_gt *gt = ads_to_gt(ads);
>>>        u32 prev_regset_size = ads->regset_size;
>>> +    int ret;
>>>          xe_gt_assert(gt, ads->bo);
>>>    +    if (IS_DGFX(xe)) {
>>> +        ret = xe_managed_bo_reinit_in_vram(xe, gt->tile, &ads->bo);
>>> +        if (ret)
>>> +            return ret;
>>> +    }
>>> +
>>>        ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>>>        /* Calculate Capture size with worst size */
>>>        ads->capture_size = xe_guc_capture_ads_input_worst_size(ads_to_guc(ads));

