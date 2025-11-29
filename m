Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8751CD116EA
	for <intel-xe@archiver.kernel.org>; Sat, 29 Nov 2025 21:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B9A10E226;
	Sat, 29 Nov 2025 21:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BaiQId8v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A63410E226
 for <intel-xe@lists.freedesktop.org>; Sat, 29 Nov 2025 21:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764450480; x=1795986480;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wxBfxPZYMqhYMvULmWrdKROd/TmPZNe832jg5rYuCOw=;
 b=BaiQId8vkgUXPj6s2cJ6eybq23Tb+gyc/ZYZ72q88h/szbkv09qKTkQW
 nTZwJ1YXMC0afxJSVPnFMOi/QDZW4+2jwVHCJOXuL3namxdk2/hSVFCYu
 9azm6XPb+qPYctZviztSAU14VIfw9SKWPifPyNQvppDWOOumVuXOO/6Kw
 9Y1xS339wQ7kjhFd4/dQTPaCI7KGIIpC1Vji4ZgYmI494CNZD5Wl5pSWe
 kNRRRcOCMCQO8Ba2Gan09vxtJjKh9sjECl5V/K3dZDLOqHLE1he9zX4VS
 vmcX10gfQWb96sayFZ+21bV20BS10I8LNCD9R6Gvt5oOm36fXAxQlMiNR g==;
X-CSE-ConnectionGUID: KUGW0NerRUOjtIbdsaAsQg==
X-CSE-MsgGUID: Q/J1XCedQtqO52G/lMcJNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="53991714"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; d="scan'208";a="53991714"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 13:07:59 -0800
X-CSE-ConnectionGUID: Ow9PzLRkTUiatCv9QY2zyg==
X-CSE-MsgGUID: XDe4rJc/Qy62LiP3hXNKhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; d="scan'208";a="224668904"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 13:07:58 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 29 Nov 2025 13:07:58 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sat, 29 Nov 2025 13:07:58 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 29 Nov 2025 13:07:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TW4P/lxUbJge39lV7HieC3++X7U7v84kyIvyZJ6ahxdbyAqejfIfl+xAfrnecTfXQQ6sQfMuSFPGpSJU7bGiReZTxifcxkbVl+nudegUk+ez810p5lf2dybSNMS7J+uJi31LCH9Zicwwsc3HARD7XmB271wewlY8ipcNQ0rD9cDhBQPzkveBEF0b/EBULOLFgOGf+gz0hQ4XFknbSgaEmFjNY1HECFQGk1rmmZ8bh76d6yF7BG3tCRohHu7SqgQcTBh4x2uIuW2rQ3J/nHsEw32kJE3JBjPkLbV7fKUG1pvXbWwrbpTUl88QF3cjh9Of9OeJqwIgAF9b4SGSWK4U5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6x5KAto3qAMSZpCGcpJLYi/9TzWabFUpaZ7QZWldXk=;
 b=Sk/B8cIws58jJ/NrDm955iN549Hu9WoxgXTzR9TfcnQbegnA0D/r68d4lTz5b+AnrTBYyFPk/KFbNbG/4AOIkjh6phx4HlvcBLOZsIslndWZad5MNcmaxcrnFqbdn4tcuJWbSQnnVgj8Xb39oQsh+AdvzG36dzZLmL5bsHFVrXdZREQK1xNeBSo40GdTXpo67Ssjt1nvdNvYHdDHtwjLFFxAE0UbMNDfRC61WyEg+O9hcxaeqDX7FgbKldnpZEAg93c9FV4c9c3UpH+rCTEUJx/zrmaZ2z1i07BppDiNltm8+CNe33vtKPIseT0s9GH4vn37a4ECCSsX62nuQWNf8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS4PPF399DBF572.namprd11.prod.outlook.com (2603:10b6:f:fc02::1e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sat, 29 Nov
 2025 21:07:56 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.012; Sat, 29 Nov 2025
 21:07:56 +0000
Message-ID: <245a8d6b-d359-416d-9238-f7a4bd604e4d@intel.com>
Date: Sat, 29 Nov 2025 22:07:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] drm/xe/vf: Add debugfs entries to test VF double
 migration
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251128133052.17120-6-satyanarayana.k.v.p@intel.com>
 <20251128133052.17120-10-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251128133052.17120-10-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::8) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS4PPF399DBF572:EE_
X-MS-Office365-Filtering-Correlation-Id: d500cfe0-64df-4eea-7923-08de2f8b5e73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVMyc3NZdWVjRE5Mb1hUOUNkc2hrWjlaeUNXeDBTbTlGM005eHRvK2dBWWI0?=
 =?utf-8?B?MHI5bFZuMkxrbUF4dGJGMEg0TjdHZ1hKVm84dDFRU2tTNkcxNktqVGcxWnhl?=
 =?utf-8?B?OHVzMHpZVWhBU2VOVjFRdWRtenBYZ1k1bzZZZ1h2THBCTnNEOGpXUGtBbzdu?=
 =?utf-8?B?UkZqRGhmS0RpbzJRMnh2SHdJZVpiQjFVT2h2SmVRRFlCK3NjckloWUQvQi9l?=
 =?utf-8?B?MzE1Yk5QYjk4NmE4dUxQWHpzZEh6bUU5ZURrcVkxRW5wYWV5V1E3OGtHR2pK?=
 =?utf-8?B?TWhNc29DSzBtOTBJRFVpaDdFcHVvbnp3TWdzbTNqOXdxa0FhR3RxNjRUTjVr?=
 =?utf-8?B?eWwwR3l4TFY2ZFcxWThMbkJrbFp0WGJFaFF1d0xTaU1lbFhpLzIrVHBEUXIv?=
 =?utf-8?B?azc0UWphd1NDeXZ1MW1STCtsT3NUSDR5eTFJQlk3WGVGaE1ManZCK3dOM1dj?=
 =?utf-8?B?dys3Ukptdkdqb1puc0ZXQmxtdXh2My8yNlVEWk85N3BMTUtJUW1KUDNKMkps?=
 =?utf-8?B?Tmx4NmRBcFd0cFdaS2twajRMcDc3U21qMG9vYTJLUUtWZUhnWnhoOFVNbGo0?=
 =?utf-8?B?STBHWEE1UUQ3TjRxd0p2U2x6MS9jRjl4eFgrOHdxSFI0YlM4M0JmZmI1OUk2?=
 =?utf-8?B?VFpHYllJV2pSc0xqYkdLeDJlZ2F2ZDdYbWRsZGJqSkxoaUlxN2NOQTNjazlz?=
 =?utf-8?B?ZmRZWHVJenhDNlk2MCtTUk5SU0N2Qk5NRFNGRjN1TUdZN0t5UkllOW5ObmFS?=
 =?utf-8?B?SnlaWW5QU0puL0lIaE5YNkNVL1pwdm5VNEs0emg3WjBzV1dQYnZQM2FPajg5?=
 =?utf-8?B?STRFbzFZRjVzRDRsaE9NeUF5bU5lNVE0UGxZcDA1eE5XSktOZW9TTG5pSFdM?=
 =?utf-8?B?ZVlUT3dFWjhTbzI1eVVBRndDVTljQ3ZaUkpvMEFFZHZPWGgrWFVKeTVzQXJP?=
 =?utf-8?B?TEhqd3ZydW9rUE9oL01yZTh4UEdQOWZ1NVZpeEcyUTQ3Q2FNbkowVG5QdHoy?=
 =?utf-8?B?ekFsSCtwd2J5eHk1Vkl0NG9UcVNobE56Nlo5YmNhQzR3eDNxWUJHN0I1TjRo?=
 =?utf-8?B?TzZiM1U2VGhmd0NVZE4vc2d0aWJROEdOajY1NDUxN29jTWpxczA1eHRBZHVX?=
 =?utf-8?B?RFdBVkxtNlYrZWFxcSs1bGtLRzZMMTA5STBncDBKL1FsNTRJU28rZW5CWlE0?=
 =?utf-8?B?ZVh4RkdJRmtCODNvNnNXQ3R3RU1xa1l6L0Q4UHVYWS9rNjc1ZEJuRndXQm12?=
 =?utf-8?B?NmljS2RydSs5cXEreWNUcENXSTJIWmNsRlpjaXlFczdNamxDV2I4L2VVWU04?=
 =?utf-8?B?RndWVHRVeW5uSHptSkRxQjd6Mm1CclVqRnR2ZjB0Znc4WG9tcnIvNjBoMzVy?=
 =?utf-8?B?Q2tCanRnRUkzRWNEU0NYdVJObFdxL1VnZHNCT1J4enY4M1NKRDRIL21sOGJU?=
 =?utf-8?B?WjAySjdrQ1hXNzJoMlNyazlxRkpxanhDdWg3ZU9oNXY0YTNLVTJBT2E5VDh5?=
 =?utf-8?B?emFmZHZVa25iSXE5VE1BeHVMWWJMbVpqcVZOU2dvTmtCeHplSVBlQTZ4b1Vi?=
 =?utf-8?B?NGRsbFF1OXZNUXhSV2hiclRKYmh1algyb1RUVmhaZG1ya2tJSlFCVzRBb1o0?=
 =?utf-8?B?eFRwZkVRcWJ6cHdwdFBNM1Rtb0UyTGhuSUZpdjhuZTd6Mzd2dzk2bVd1OWxa?=
 =?utf-8?B?WEprSjRGZGxGb1JkbTltR3JjVU5ReXJjNzJlbUxtYi9ZM1Ixb1ZnMXRtMGE4?=
 =?utf-8?B?U2NraXFZZVEzQUJrSFViSktPNXBIdXZmL01RSXJoa083NGtGSFZRVjg4bmdl?=
 =?utf-8?B?ZTBhNVRPVGtPRENzWG9qRjVPYjR5S1paTnd0cC8zVW1rZFlCZFZJL1JheWpo?=
 =?utf-8?B?QUpKY0JwazQvQTN6b05hUlFiQTNNOFNacFBpTFIxR3lLdDE0dDRyazJuUVNu?=
 =?utf-8?Q?t8DA5MI/tN4qImy1WAdeDm2h+ZtefyBJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enZPQllvWUprUkJSeHFsWENWd2w1RUlnVG1QTy9tN3hHOEs5OFhHQXk3T0JJ?=
 =?utf-8?B?ZFY0ZW5ITkx0bVZQMlpaTXk5dENGOEN4K0lsaEVyZi90MmJGRVFkbWdaL3FV?=
 =?utf-8?B?ZUZaamswVjJFdXF3N1hsY29ycTRDOUt3WDJHRTA0eElPYzFuRUcxSEI1dmkx?=
 =?utf-8?B?ZnN2cU5ENkQrK25OSkxsUVh2aUxEc2JUNmFXRTIrU3RlUlBKYVNFeG9iKzdp?=
 =?utf-8?B?czc2VklwbkQ1VEVMT09zOURxVWZKcGJCcHp4Y0lKK252djlWZ2FDQ0FkYVRx?=
 =?utf-8?B?NXk0ZThMQlBJZEc3QWwycjB5YXdEUVU2SXN3azhyeXRzb3dvcDl1dGZNZEdl?=
 =?utf-8?B?citKblhRREVQMkpycllrNFBBdWYrNGY3d2xPblkwd2NONzlTeHBJMTVPYnp0?=
 =?utf-8?B?Njc1SU83V2tqRWtpTk9zRnFicXMxODM5OW5LdDc4T01jN3VTeFNjUUV2aDhI?=
 =?utf-8?B?VjJjU1R3WlQ3a1BsLzIwbVJmN09rN0ZyNDZDQk5MZ3RHTktKeXJ4dTBhUzQ2?=
 =?utf-8?B?Z0lwY0ZvaFZuWU84VDQ1YlB3dDhqY2IvZmQvLzhPODl2YUN5c29DY25oQVR2?=
 =?utf-8?B?aHZRNkY0TlFWSmZjUVZwTWVSZmtEZnUyQ3pUWGZnQy9haFFaZEJqUy9TWGc1?=
 =?utf-8?B?MXBTZDEzSlc0dk12a3B1cGp0Yko2QUFobjZ0YmJ5UFdCRkxjbmd6UHVSSDlt?=
 =?utf-8?B?cFJ4NWhEb2Z2bmxSVURycGtMUUN0V1h6T3dBb1ZEcHBJamJJWFhwU3dTRjZX?=
 =?utf-8?B?aG5CaU1vQmFvcXVlM0E3YnpGOStqY3hZbjhMQzE0NGozZTBBeFNmV0FETisv?=
 =?utf-8?B?MERCNjdBWllWOXc1YTBOWXY3Z3VyVEQ0WXl0cHZOaWlHWVdhOWIxVUZDNEVN?=
 =?utf-8?B?aG0yTHRTNjNydmNVaXNDclR1NUdnQUN1WEQwSm1yM3lRdElRdGlMTjJVMDNG?=
 =?utf-8?B?QXBza2dCTnJEMjNkdmhjZytrM2RYWDhUeHJKSFFweE5pNmlsaTJRN0hGQ3JZ?=
 =?utf-8?B?cHlValZGNjZ6ZGUzUkhIUFVleC9sSkNVZjJsT04valRLVEFkbWpYL0lNU28x?=
 =?utf-8?B?eFVDNEdOSFRvNjM3VTh0bkpIK1dVaHJ3ZnpUTHU0VmJ4Rk9nd1ZnU0YvRDk5?=
 =?utf-8?B?SDlkUjc1TVF6dHJyN2lTd0FMNDRFUmNKdkZqNXBxNDl4NHh2UVJ3SFFnRERs?=
 =?utf-8?B?RmdwRG5sSEpWTlJ5dWZ3SVl1amg3ckFua0hVVDVqSzYrZW5KS2JNTUo4b1JR?=
 =?utf-8?B?d3lhR2EwT2RqVzcrN0t1WWpEMEZ3TzZ6Z04vK1plWmFYZnhUcVpLdnIwWW1N?=
 =?utf-8?B?aUgzblJYT2luTkRjM2YrUFg3THF0cTNueStJZG9nNDRSVU1WREY0ZTVSc0ky?=
 =?utf-8?B?bXBOR1ovMy9FRDBLQ2RWY1NNWU92N2R4LzJXbjY4KzR1ZUtGVWkrekx3VkMw?=
 =?utf-8?B?TkFvNXI2REYwbjZndUNhOU53VWFXUkpzVEhZdGV6Rm1Bdkhsb3JoZnJTRy9B?=
 =?utf-8?B?YU1SUlQ3S2ZNQ3A0c1ZLb2NPSTIzZHcva2FiaVVoZVZoL0lBbjIvREdzeSt4?=
 =?utf-8?B?ODVMM2V3MmEwRXhvRk5meVUrSDVFUWoxYnc2dE8vOWgzSUZXallOalBRMHd3?=
 =?utf-8?B?c21FbkZTWWxjc0l2R3NDbnM2L3FSdUQwTk5VMWtXV2hpNXl5Y0tGZ0NzNW1a?=
 =?utf-8?B?UWJHZ1BXRDJnZ2NBWGQ1VXViZ1B1SHdqYkRQZ2FKM1FSMkc4R0swbExEZXBN?=
 =?utf-8?B?ZWlsYVNEekZ4SjBrdmxIYlpKRkpzYldBT2JJZzVzbEcvQ1lPVUlQWnV3Uk53?=
 =?utf-8?B?WGlpdUo2N1h4cXNmY09BZmo1cVhZbTNUSERXYWdNc0NHclcvRG15T1VmUTRP?=
 =?utf-8?B?blM3QkZZamxFN0tuWW9kYWhrakg2UFpFeThRNW5VVkR4V0xRZDZzVVkyN1dW?=
 =?utf-8?B?WlQzY3dzS1JKQXQvSHFvRlduWjJDckk4RWZWQjRxaEtENk5rRVJiZ3llM1hs?=
 =?utf-8?B?bERSUzdvNHI3OUJOVmN2ZkhBcjR0dmRZZUgzNnpKOWxaKzJQL0w5eHdwYWpH?=
 =?utf-8?B?bDU2c2RubzZSaE9sTm1RWXRVcEpDRXFWQVpKRHpLVTlkbVdibWMvQWt4VjF3?=
 =?utf-8?B?V244bGUwM21oNGV4dXgvaUFvUVczR0wvckRzdVNpVzBMM0MrVjJ1cHNQMGEz?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d500cfe0-64df-4eea-7923-08de2f8b5e73
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2025 21:07:56.7005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12be0Eywwz2vBK9wqO17vcgWO3BC3WHV6wB5c0FQ2nv9CKH1vsGkd81YuzDz5TzwyTCPL3u0dJvx+RXGRSN7x6bWzTA3ztjGfRN2F40BTFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF399DBF572
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



On 11/28/2025 2:30 PM, Satyanarayana K V P wrote:
> VF migration sends a marker to the GUC before resource fixups begin,
> and repeats the marker with the RESFIX_DONE notification. This prevents
> the GUC from submitting jobs during double migration events.
> 
> To reliably test double migration, a second migration must be triggered
> while fixups from the first migration are still in progress. Since fixups
> complete quickly, reproducing this scenario is difficult. Introduce
> debugfs controls to add delays in the post-fixup phase, creating a
> deterministic window for subsequent migrations.
> 
> New debugfs entries:
> 	/sys/kernel/debug/dri/BDF/
> 	├── tile0
> 	│   ├─gt0
> 	│   │ ├──vf
> 	│   │ │  ├── resfix_stoppers
> 
> resfix_stoppers: Predefined checkpoints that allow the migration process
> to pause at specific stages. The stages are given below.
> 
> VF_MIGRATION_WAIT_RESFIX_START		- BIT(0)
> VF_MIGRATION_WAIT_FIXUPS		- BIT(1)
> VF_MIGRATION_WAIT_RESTART_JOBS		- BIT(2)
> VF_MIGRATION_WAIT_RESFIX_DONE		- BIT(3)
> 
> Each state will pause with a 1-second delay per iteration, continuing until
> its corresponding bit is cleared.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> 
> ---
> V6 -> V7:
> - Fixed review comments (Michal W).
> - Updated commit message.
> 
> V5 -> V6:
> - Fixed review comments (Michal W).
> - Removed timeout and VF KMD waits infinately when resfix_stoppers bits are
> set.
> - Created helper macro for WAIT positions.
> 
> V4 -> V5:
> - Updated debugfs entries (Michal W).
> 
> V3 -> V4:
> - New commit
> 
> V2 -> V3:
> - None.
> 
> V1 -> V2:
> - None.
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 40 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c | 12 +++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |  8 +++++
>  3 files changed, 60 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 937554657440..75c5c6ad0b75 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/bsearch.h>
> +#include <linux/delay.h>
>  
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
> @@ -41,6 +42,37 @@
>  
>  #define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
>  
> +#ifdef CONFIG_DRM_XE_DEBUG
> +enum VF_MIGRATION_WAIT_POINTS {
> +	VF_MIGRATION_WAIT_RESFIX_START	= BIT(0),
> +	VF_MIGRATION_WAIT_FIXUPS	= BIT(1),
> +	VF_MIGRATION_WAIT_RESTART_JOBS	= BIT(2),
> +	VF_MIGRATION_WAIT_RESFIX_DONE	= BIT(3),
> +};
> +
> +#define VF_MIGRATION_WAIT_DELAY_IN_MS	1000
> +static void vf_post_migration_inject_wait(struct xe_gt *gt,
> +					  enum VF_MIGRATION_WAIT_POINTS wait)
> +{
> +	while (gt->sriov.vf.migration.debug.resfix_stoppers & wait) {
> +		xe_gt_dbg(gt,
> +			  "*TESTING* injecting %u ms delay due to resfix_stoppers=%#x, to continue clear %#x\n",
> +			  VF_MIGRATION_WAIT_DELAY_IN_MS,
> +			  gt->sriov.vf.migration.debug.resfix_stoppers, wait);
> +
> +		msleep(VF_MIGRATION_WAIT_DELAY_IN_MS);
> +	}
> +}
> +
> +#define VF_MIGRATION_INJECT_WAIT(gt, _POS) ({					\
> +	struct xe_gt *__gt = (gt);						\
> +	vf_post_migration_inject_wait(__gt, VF_MIGRATION_WAIT_##_POS);		\
> +	})
> +
> +#else
> +#define VF_MIGRATION_INJECT_WAIT(_gt, _POS)	typecheck(struct xe_gt *, (_gt))

checkpath.pl is complaining here

-:86: WARNING:MACRO_ARG_UNUSED: Argument '_POS' is not used in function-like macro

so maybe all you need is:

#define VF_MIGRATION_INJECT_WAIT(gt, _POS) ({					\
	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))					\
		vf_post_migration_inject_wait((gt), VF_MIGRATION_WAIT_##_POS);	\
	})

and let the compiler optimize that out?

> +#endif
> +
>  static int guc_action_vf_reset(struct xe_guc *guc)
>  {
>  	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
> @@ -320,6 +352,8 @@ static int vf_resfix_start(struct xe_gt *gt, u16 marker)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> +	VF_MIGRATION_INJECT_WAIT(gt, RESFIX_START);
> +
>  	xe_gt_sriov_dbg_verbose(gt, "Sending resfix start marker %u\n", marker);
>  
>  	return guc_action_vf_resfix_start(guc, marker);
> @@ -1158,6 +1192,8 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
>  	void *buf = gt->sriov.vf.migration.scratch;
>  	int err;
>  
> +	VF_MIGRATION_INJECT_WAIT(gt, FIXUPS);
> +
>  	/* xe_gt_sriov_vf_query_config will fixup the GGTT addresses */
>  	err = xe_gt_sriov_vf_query_config(gt);
>  	if (err)
> @@ -1176,6 +1212,8 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
>  
>  static void vf_post_migration_rearm(struct xe_gt *gt)
>  {
> +	VF_MIGRATION_INJECT_WAIT(gt, RESTART_JOBS);
> +
>  	xe_guc_ct_restart(&gt->uc.guc.ct);
>  	xe_guc_submit_unpause_prepare_vf(&gt->uc.guc);
>  }
> @@ -1199,6 +1237,8 @@ static void vf_post_migration_abort(struct xe_gt *gt)
>  
>  static int vf_post_migration_resfix_done(struct xe_gt *gt, u16 marker)
>  {
> +	VF_MIGRATION_INJECT_WAIT(gt, RESFIX_DONE);
> +
>  	spin_lock_irq(&gt->sriov.vf.migration.lock);
>  	if (gt->sriov.vf.migration.recovery_queued)
>  		xe_gt_sriov_dbg(gt, "another recovery imminent\n");
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
> index 2ed5b6780d30..507718326e1f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
> @@ -69,4 +69,16 @@ void xe_gt_sriov_vf_debugfs_register(struct xe_gt *gt, struct dentry *root)
>  	vfdentry->d_inode->i_private = gt;
>  
>  	drm_debugfs_create_files(vf_info, ARRAY_SIZE(vf_info), vfdentry, minor);
> +
> +	/*
> +	 *      /sys/kernel/debug/dri/BDF/
> +	 *      ├── tile0
> +	 *          ├── gt0
> +	 *              ├── vf
> +	 *                  ├── resfix_stoppers
> +	 */
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> +		debugfs_create_x8("resfix_stoppers", 0600, vfdentry,
> +				  &gt->sriov.vf.migration.debug.resfix_stoppers);
> +	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index db2f8b3ed3e9..510c33116fbd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -52,6 +52,14 @@ struct xe_gt_sriov_vf_migration {
>  	wait_queue_head_t wq;
>  	/** @scratch: Scratch memory for VF recovery */
>  	void *scratch;
> +	/** @debug: Debug hooks for delaying migration */
> +	struct {
> +		/**
> +		 * @debug.resfix_stoppers: Stop and wait at different stages
> +		 * during post migration recovery
> +		 */
> +		u8 resfix_stoppers;
> +	} debug;
>  	/**
>  	 * @resfix_marker: Marker sent on start and on end of post-migration
>  	 * steps.

otherwise LGTM, so with macro fixed,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

but it would be nice to see some ack from the val team

