Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A70FCCF2D5
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jan 2026 10:40:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA6110E3E5;
	Mon, 19 Jan 2026 10:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NF4p+YwB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1EEA10E3EF
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jan 2026 10:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768819218; x=1800355218;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MWiDv/c7/MN0fBylBXuqnLm04mXjARxXdKjivyp9fkY=;
 b=NF4p+YwBcjIyBY+eT95zgFVRw88orDbCpXYxArRrNBukwqW5LU4rls9l
 bNh0882LKGqmlHYUDcIsL6humKjk2j9DITbjQdiEkmLqNppwvjukyBzHu
 Cd5XBfKPCtrOIVZrBWMMLyA/XCKdrW7MYT4LXX4HEkjQOGUH7jHp+mnhT
 rrcQwq6wikzjHMuyWk7NVBTnQHO3qCEe3QinaP4bsNFpPJLX1UZewfYdW
 MC1NiIxRlhzUT6jwc2HPv1/8Hysmr1v2gipxMNnrfiRT9DIX3XD2G+cth
 sIUc+EbCd7p/bRD+g4QRm8xScFeIuWU4Y8pNUKg2RzFBDY/bN+X7eAzXJ Q==;
X-CSE-ConnectionGUID: P/dm+ew8TxW7TZwyHgBCTQ==
X-CSE-MsgGUID: 4L/6eXdJTYOC4Zb9FfzIoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="72619830"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="72619830"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 02:40:18 -0800
X-CSE-ConnectionGUID: u3/70yfDQGGKp0OLupX+Sw==
X-CSE-MsgGUID: DcJdt3GrQsO/T0K3oMpvVg==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 02:40:17 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 02:40:17 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 02:40:17 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 02:40:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=geQELk6hyaP5ORPUHQ1ANae6acBMZk9ZrP9/hM6PeNaEtrB7Fk9KXz3+46AJeR+nc6htZrdasqijwlfzZ1+weFduBlp1PO9aKuoLUqn0phoRIxB4Wau2ZpcOYAUraZoFO3uAChaKyf59hdN1LQrfIyjJlJbxbhCiMczkeAIMNiEmoWqWr4ttqzA6bYTUn91+SCvT2E4lJ87HdxILKhHlpZWg3cMD1F0XQsVen2fDW7HZK+szboGOMqRqEudBSVmnJrQpzK3kPgpxs1G01lvxOBXHaXQe8p0/Q7Cr3gpvNNladVUzG7Q7+7QF4DxQZzKvQ31Ie1LKRdJDL2KDdfYdUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cO07GDfIhDtysIG2NOi9KNKeEQuGmIkU/TBCXtiIm+s=;
 b=AqbzW+pGw+4imZvLdbsbBphTDMsNRx4qXn+xxc1wqW/LQmP5pcjGdlyybsNrv8XSZUsHPimBot+ECi9BDPfKMGCWtGYc4Q11LrdXa2UliJTkMnUbnpWiWBBZZOr2FdDyUb2xSzxE4776KabkAagtDQkKUhOILCdSca242g23fdN1TwDRrV0+YDlIbmL2tVcF1wHs2d10d6pmEXr4xr24vtBMPjc5i93DH3+jrxPz3NXVegMHWkSzO/18rzIQQx4mVVVsXx/E/57uCHvi+J5QNnc1de5jOftjLQzwq8/cZP1gLcXP1EdEaue3kyr6zZfqnAP1da9W4IwsLF8euxA+UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by SJ0PR11MB7703.namprd11.prod.outlook.com (2603:10b6:a03:4e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 10:40:15 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563%6]) with mapi id 15.20.9520.006; Mon, 19 Jan 2026
 10:40:15 +0000
Message-ID: <c5f979e5-2efe-476c-bfe9-a6840e77a79c@intel.com>
Date: Mon, 19 Jan 2026 12:40:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: add kernel VM BO unbind helper
To: Farah Kassabri <farah.kassabri@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260118102431.5085-1-farah.kassabri@intel.com>
 <20260118102431.5085-2-farah.kassabri@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <20260118102431.5085-2-farah.kassabri@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL0P290CA0009.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::6)
 To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|SJ0PR11MB7703:EE_
X-MS-Office365-Filtering-Correlation-Id: 08758276-1f86-4237-51d7-08de57472185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlpXaWpHaHRIS2hEdG5MaHR2N0RqSHhIWlpTZFBpb1RiRC9HcGVncU5tOXkw?=
 =?utf-8?B?OE43QzNzeWVJL3BOYmltTlFjMkdVQUdISXE2djVOdU1mbmNYcDVycXl2akFM?=
 =?utf-8?B?YytVNW5jbGxMTHVkOVd4UTdSZWdnNkM1anVHUm5GM0JjOUwxaHd6cGZJbHlW?=
 =?utf-8?B?akhSVCtuVUg5SHF2b1orUmI5aFMwdjdscThES3VXYXVQNDdmYzhXa01jbTFw?=
 =?utf-8?B?Sm9tbWxkempYMEdTMlVQS1Y5K3ZUcy9oc3dNOHVUNWRCazUzUzU4V2x3UVNv?=
 =?utf-8?B?NnJQMXN3QVVESm5yRzJsYXg1QU5WNGlwQThsR3hqMTRDZ0IyZldYMnZvR21p?=
 =?utf-8?B?bzZxYlBlR2doWHliUkJTZk9ZVXRCTURYbE1Da3hXTWFGNHF0R2RUS2RETUJT?=
 =?utf-8?B?aHJyZ0F0RytBV1dPcE9BKzdpNE90UytHWHJZeWIyMkVVMndiWFNlNkFzSlhw?=
 =?utf-8?B?R2I1RlpvUWdDOHNoYkREbXk4eGNSSnh3UUROTnB4Q0xrejdtNXA4bkpmdkVI?=
 =?utf-8?B?bHVDS1MwSGh2S2ptbVZ1ZGlacE9UK0N3cFhqVGd5clNZTTQ0RSt6MW9yRlAx?=
 =?utf-8?B?anZIcFdDZndHeHpyMi9zYzRSUG5ZZisyWEkzN0ZNUzhVbnR6TGNjd0hiOEcr?=
 =?utf-8?B?SVN3NG1IaEtrVXZNNWErNFQyQ3llRmxzVk85Y3dmeVRJZXl1YmxtdVZCN0xx?=
 =?utf-8?B?Wm83ZWRkQVF1czM4eStwUjlaS2dhaDI4d1lQL1JwdkxLWWlTSWxlUXdJaE9z?=
 =?utf-8?B?Szh4TEUwMkNjNHR5YTVaYzNCcGR2dUdjYmVhelNvR2Zld29Sdk5TKzRQNzdq?=
 =?utf-8?B?SnJKNE1HV2YvaFBxdFFIWVVJVlBSY3pRYzFLV21Cd21NazROVGdFYUIveE9o?=
 =?utf-8?B?Vmo5UStqRzdXZDAwVWtqbEkzQndyUEw5M0lHSWlXNTdnejlKdVN6dldqejNR?=
 =?utf-8?B?anhmUi9RODdNcjNPV2IyUUIyYXNMZFVEQUsxZkc2NWZyWjgxUExoNytPVE1V?=
 =?utf-8?B?SXRnMTVWTS9qZEJTRmN2cXNlNzFRdE1aWm53bVlxL1g1dkl3L1YwTkIyNzFR?=
 =?utf-8?B?eTJ2bFA0YU50QkFoVVdybDBHRVl4U2pUVkpGQzNwN0RoUDJxTW81SGNzWVZz?=
 =?utf-8?B?R0liNDhNRnJtaHFqaG1tUXllZ3RueGhuTDJDQlF3b3c1blNLTkVYS0FWRWw2?=
 =?utf-8?B?azBFdWdodXBXbThhN2VUeTVEUE12Wm50L0RCQ1AvU0xsMDBzL2dTTTRVRnZp?=
 =?utf-8?B?T2NZZXNFSWtHdGU4R1NmZDVsSzdWZ2ViSXUwYWNVMkpGdFh3eGJoMGFkdEFl?=
 =?utf-8?B?Um1JL0U4bGRRV1VMTXVVSm10MU9jTVN6cklIWFM5NDJOdFNXZE11T2pBU1E0?=
 =?utf-8?B?OEF0MUhYZzZLRzV0K1MrWjVoRmtUM05QU25yRTE4d24xT2JqNi90RytOb1lz?=
 =?utf-8?B?Z0JmSGxPWThLRXVoVHAwUUFMajFYV1I1TWJXTXU1TStkY2hBY3Z1dVhlUitk?=
 =?utf-8?B?bDBsbG1aWGlncmg2UkdQVGtnbzNta2hTbDd0YzdlcklMWTNUT3B4Z3hIalMx?=
 =?utf-8?B?ZXZqNHBSd3ZrNGFDYkJiZEpYL2t5djVmMGpreE1FSWx5a2Q0cnBpamdaYlpT?=
 =?utf-8?B?K0VzeUw1UCtrb3lyOHQycWk1MFNJVXlDTm0wd3c0WVkwU3pCWjlIUEk5MFRm?=
 =?utf-8?B?bFlQYzVLQmNYMHMrNDV6VHQzYjZFRE1EOS9JUXppRzhvMGtCOWtha01kaGlT?=
 =?utf-8?B?NWxaTmpsclpaNFNiU1ZxMkZzZFllSHpOc2JVdmFFSndMOGo3cVFzeW5DeWNa?=
 =?utf-8?B?dDdsUHhtbE1LalZJcXlkRnJPUFZ1eGVFMGxoblVra2MvdVRHWCtLUGUxajha?=
 =?utf-8?B?eHBBMkQ4TGlyT0pvalRNMjZKOG5wMjM4U2QramRFekV6eHJoUWNZY3JZTmpx?=
 =?utf-8?B?THA3M3VNSDM5S1BZc29XVnpjY2pMM0ZmM291VUVRdWVRbjlYRDl0bGV0UlVS?=
 =?utf-8?B?WkhQU2FaVm1PUGQrUFBDd0JVZFBweFBEQ1dBU2RUUjk4Z284VmZhZyt3dmo5?=
 =?utf-8?B?Qk9FYlkzOGQ5YjlyZW1PNE8xT2lDcFNWTEhmQUd4VEtjeUFWSnh1TmJrNXY3?=
 =?utf-8?Q?bbCI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2lmYzlaNEg3bEhQOHpGZU5hR3F3cGV0S0h0ZWprVzNtWFI3d2JWY2t0NFVt?=
 =?utf-8?B?K2JUeG1ScEJxOTJDcGY2MW9jWjB6UlZWK1hodzJaR3B2cEJOZ2FHazdVNi83?=
 =?utf-8?B?WlAwd24wUzNvUSthbW83NGZkOFNrT2dCLzNjRStVOUIwOUdPTGY1dFI1dEZv?=
 =?utf-8?B?bkVETHNYODdmMWtWa0UrazFCY3F4UkpQcEU5Zmc5cTRXaGs3ZEZ3Q2cyemha?=
 =?utf-8?B?dG01MkNuZENSd3VtRXF6YUYrOFovbE9hblQ4NWtwRE5Sc2x5SDFyeS9QQUsz?=
 =?utf-8?B?dzNtc2l3ck51US8rdlJzZUFVZkF1eU5TeG0xbG9PUFl0MytoaS9BdkF6Si84?=
 =?utf-8?B?bDBsUURxdklRTTdLZzArTXFGaTJZc1UyOHYyU3h4eHlOaUZqMWdhb1YvL0h6?=
 =?utf-8?B?RE9zd2lRbmpnclRJanc5RTlvUXE0N29aM2xnVkY5VktzY2JGMkNJWXBWZXhC?=
 =?utf-8?B?SElnek0wYmhDb3B2L09SOEZ2bG5yYm9waVdDL2t1YTBNNHpSak92cGN1bk03?=
 =?utf-8?B?TXdKajNMSitxU1NFVWJsREpkR25iRGJCM1RpakhEMSsyQzNvMnB2KzVlOGxm?=
 =?utf-8?B?UDM2Mm92VkJlZGhvNTVnMFBJNmNtb1RMbmZQY0VJdUlGM291SmhMcjZITStN?=
 =?utf-8?B?em54OFFkaUp5ckdYOTR5NUlPTkREcXgwMTErYmFkdGhaTTlkZlpWN0g3U2Jh?=
 =?utf-8?B?RkZSeU4xT2pqays1R29LbG5IWVBnOHlRN1NlcStZZDVuU3hUa2taYlJ5ZEpK?=
 =?utf-8?B?R2l2bzk5V3lXQ2M2UlB3NWRjNWFnNHZEUHNGYzBCdVRRQU9BNlZxZGJWUHQ1?=
 =?utf-8?B?SFVWZ0lsQmhNVW9VYkJ4RHo1Tk00ZzNhbGFtZEdNUUlIQ0hCaXdRU3VhNVFH?=
 =?utf-8?B?R09qZXNkcmdpME5MMjFNTy80MVhmWkpVZkd6QTlMNUxucEphQTQyalFmS2Fa?=
 =?utf-8?B?dWRBeU1pR1JNcFJkUGtwTmZpWDd4MzY2UHZjbFFMT3JtVm1vSWxHQlh2M2xM?=
 =?utf-8?B?LzhmdVduQzBhUllOMHBHY2lsZlVFOC9TTlFwQU1BYlJlMUxsOGhsYzdHYjRJ?=
 =?utf-8?B?YnNWV0FhR3ZlKzJiVENuN21FSkV3VU16amhsdU1vT0VzdmMwMzdaZDllRWNM?=
 =?utf-8?B?LzdtR0xmbmtwcnorMFFHM1Myc2JMMHM5ckpFaVRzZFpKWEJWbm5HUjZxK0dH?=
 =?utf-8?B?WjZoVU9tVWtTR2FvVHR1SnZlRmRTeUpkYzdDdmpGWHAvS00wWEw4bC9nRzRQ?=
 =?utf-8?B?Nko1WUNnZFpaRGtTZG02cnZ6YVAwWUpqWDhEWWUzcU1BaG8xdnQyTm9vQ05P?=
 =?utf-8?B?ZjJuQis0TmUvbnM0RWhpbUlOYW5VdW5IemhIMHRqVFpJc1Zzc0Y3YitaRmxl?=
 =?utf-8?B?V0hDRnNyRkZyWFJvVXRNaGk0N28zSjI1SmVsNTZKTElUOWc3dmUrK0VjZi9D?=
 =?utf-8?B?QlY1T3Npek00V2tWWkkwMWUyZkoxNm9iUnc4bXFjS0FkVFpXeERMR0lXTGY0?=
 =?utf-8?B?YlhDRGJuaGY2YkF1UWUrV0tYUHZ4TW0rZW9hUlZLbnA1cTkvc2ZwRk03UjVM?=
 =?utf-8?B?SGtERU05V0hjdlJsczJZRnZIckxEcWhGNEhTemNibUxFYlQwK3Vpa0tDeHFq?=
 =?utf-8?B?dnpXNE8vc0hNU2tIeE85cXdDZVI2ZURnd3YrY29VK1dnWWE1d0d4UWRPSlJR?=
 =?utf-8?B?UnJnT01DMVZ2MnZkNlVHenZyN0QvUHBTOHBXdUJkNkRLSGZBQ0hPV1Y4L3V2?=
 =?utf-8?B?VzRYL1BRYkk5TlJCaUZRbzd2K3d0MEtacVREVzRqNG1BK2JnUmpja1JmR3Zi?=
 =?utf-8?B?aC8xYjU5dWFhbExPbmw1TlZRZjJMZGlEVERkdHBHMTMrdGxsSWFxS091SHBO?=
 =?utf-8?B?dDNlM2NNMFhpV2dOWnB5NFZGQWVReWtEcXU0eDhSeDh1Q09mOG1yOEpKeXlO?=
 =?utf-8?B?ZW1jaERPS0x4d3YvUHcyT09weEVSaTZaS3I2QUVGWStKL0VYRU4vNDdHdjNk?=
 =?utf-8?B?VHFoMHFsK3l6eTZKN09FN2tEV1VGeWQxaGYxUzlCQzcvOXR4ZXI1L2o1eTNK?=
 =?utf-8?B?K2w3dU9wdFlGSHFaSVJ5TVRLbE1tOFBBTUk4VURWdlFSNUFydkhxN3ZhQTlq?=
 =?utf-8?B?ZkhIL3IyamhncGNwanhHUkJiak80QmtndGpVR0Nod0FpVHc4R1lRRjVjMVQ2?=
 =?utf-8?B?VHhjazJsakg1cjRkTkVlY1NnbjkyT1VNcUVRWjBNekMvS0tUWFlHa0xFWDAz?=
 =?utf-8?B?bExja09tZjhJUzBFM2E0TnN0Sk5uVXdFaXVSZlBUTHE5dDY2clFGL3ROaUU1?=
 =?utf-8?B?Smx3cHdKU0h4aE9IMkNGQUVuODkyc1RQNzdiZC9sKzJwUGJwakZHUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08758276-1f86-4237-51d7-08de57472185
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 10:40:15.2377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rysreBsNJJ7Gywvr7APqOA3Bi3VdZlUX1dDOxpmeX3wKwwukypzYY6ZP39kxJ5lj4A6SctcPBRzQk5zw6c+ZRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7703
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

On 1/18/2026 12:24 PM, Farah Kassabri wrote:
> Add xe_kernel_vm_unbind_bo() as the counterpart to
> xe_kernel_vm_bind_bo() to provide symmetry in the kernel VM BO
> lifecycle.
>
> The new helper allows explicit unbinding of buffer objects from
> the kernel VM, enabling proper cleanup and preventing stale
> kernel VM mappings when BOs are no longer needed.
>
> Signed-off-by: Farah Kassabri <farah.kassabri@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 59 ++++++++++++++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_vm.h |  3 ++
>  2 files changed, 54 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a27145a4137e..91ae5d511771 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3830,21 +3830,22 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  }
>  
>  /**
> - * xe_vm_kernel_bind_bo - bind a BO to a kernel owned VM
> + *  __xe_kernel_vm_bind_bo - internal helper to bind/unbind a BO to/from kernel owned VM
>   * @vm: VM to bind the BO to
>   * @bo: BO to bind
>   * @q: exec queue to use for the bind (optional)
>   * @addr: address at which to bind the BO
>   * @cache_lvl: PAT cache level to use
> + * @do_bind: true for bind, false for unbind
>   *
> - * Execute a VM bind map operation on a BO to bind it into a kernel-owned VM.
> + * Common code for binding and un-binding a BO.
>   *
>   * Returns a dma_fence to track the binding completion if the job to do so was
>   * successfully submitted, an error pointer otherwise.
>   */
> -struct dma_fence *xe_vm_kernel_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
> -				       struct xe_exec_queue *q, u64 addr,
> -				       enum xe_cache_level cache_lvl)
> +static struct dma_fence *__xe_kernel_vm_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
> +						struct xe_exec_queue *q, u64 addr,
> +						enum xe_cache_level cache_lvl, bool do_bind)
>  {
>  	struct xe_vma_ops vops;
>  	struct drm_gpuva_ops *ops = NULL;
> @@ -3860,9 +3861,13 @@ struct dma_fence *xe_vm_kernel_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
>  
>  	xe_vma_ops_init(&vops, vm, q, NULL, 0);
>  
> -	ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, xe_bo_size(bo),
> -				       DRM_XE_VM_BIND_OP_MAP, 0, 0,
> -				       vm->xe->pat.idx[cache_lvl]);
> +	if (do_bind)
> +		ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, xe_bo_size(bo),
> +					       DRM_XE_VM_BIND_OP_MAP, 0, 0,
> +					       vm->xe->pat.idx[cache_lvl]);
> +	else
> +		ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, xe_bo_size(bo),
> +					       DRM_XE_VM_BIND_OP_UNMAP, 0, 0, 0);
>  	if (IS_ERR(ops)) {
>  		err = PTR_ERR(ops);
>  		goto release_vm_lock;
> @@ -3903,6 +3908,44 @@ struct dma_fence *xe_vm_kernel_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
>  	return fence;
>  }
>  
> +/**
> + * xe_vm_kernel_bind_bo - bind a BO to a kernel owned VM
> + * @vm: VM to bind the BO to
> + * @bo: BO to bind
> + * @q: exec queue to use for the bind (optional)
> + * @addr: address at which to bind the BO
> + * @cache_lvl: PAT cache level to use
> + *
> + * Execute a VM bind map operation on a BO to bind it into a kernel-owned VM.
> + *
> + * Returns a dma_fence to track the binding completion if the job to do so was
> + * successfully submitted, an error pointer otherwise.
> + */
> +struct dma_fence *xe_vm_kernel_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
> +				       struct xe_exec_queue *q, u64 addr,
> +				       enum xe_cache_level cache_lvl)
> +{
> +	return __xe_kernel_vm_bind_bo(vm, bo, q, addr, 0, true);


Should be cache_lvl instead of 0.
- Ilia

> +}
> +
> +/**
> + * xe_vm_kernel_unbind_bo - unbind a BO from a kernel owned VM
> + * @vm: VM to unbind the BO from
> + * @bo: BO to unbind
> + * @q: exec queue to use for the unbind (optional)
> + * @addr: address at which the BO was bound
> + *
> + * Execute a VM bind unmap operation on a BO to remove it from a kernel-owned VM.
> + *
> + * Returns a dma_fence to track the unbinding completion if the job to do so was
> + * successfully submitted, an error pointer otherwise.
> + */
> +struct dma_fence *xe_vm_kernel_unbind_bo(struct xe_vm *vm, struct xe_bo *bo,
> +					 struct xe_exec_queue *q, u64 addr)
> +{
> +	return __xe_kernel_vm_bind_bo(vm, bo, q, addr, 0, false);
> +}
> +
>  /**
>   * xe_vm_lock() - Lock the vm's dma_resv object
>   * @vm: The struct xe_vm whose lock is to be locked
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index ff32f43aa1d8..b87e80227c79 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -272,6 +272,9 @@ struct dma_fence *xe_vm_kernel_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
>  				       struct xe_exec_queue *q, u64 addr,
>  				       enum xe_cache_level cache_lvl);
>  
> +struct dma_fence *xe_vm_kernel_unbind_bo(struct xe_vm *vm, struct xe_bo *bo,
> +					 struct xe_exec_queue *q, u64 addr);
> +
>  void xe_vm_resume_rebind_worker(struct xe_vm *vm);
>  
>  /**


