Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57E5EB28D6
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 07:29:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F71D10E3A4;
	Fri,  6 Feb 2026 07:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UxmrLy02";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3A710E3A4
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 07:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770362986; x=1801898986;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=bbFSEQhIcB3qdg68yv1lwisPPTUptS1Ji1jTjgd72Tg=;
 b=UxmrLy02pFXBX1ojwqhNDz3h3C8EJs4HiTCwoCijE9zqEIagC1zT/cYO
 2eC88nlKD5vk7vnSG6bQcPkqnYNGfXMMY9PxjiyhNSxaWgTF8hW1yqFeV
 mCtOzv/Hp18OMFhQChl51bbIbLlwU/5bHKv61r61R4UTRLvNJ7CyoSukT
 Ar6aBWzL1Sb+Ark2mbJVFO3hHyq6cbSwGVrtME4Q87gUTn4kNFhD33Cnc
 z7pS7IxpSDtKL5eXq7rpSWeavTe1NGKaFUhcaAnb7ktblbulRcxBXPOaA
 n98MCJ+nSrelM3S9mahsTztE8+r0+rA0haBFtxZw+Iua4js8n6GTcdVvE g==;
X-CSE-ConnectionGUID: rMN/fCfeTPafJlUOXaSRmw==
X-CSE-MsgGUID: bEgy1AyiR5SZQA5yaANndw==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="88993009"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208,217";a="88993009"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 23:29:45 -0800
X-CSE-ConnectionGUID: R8kmHh+PS1y6XNl96X9okA==
X-CSE-MsgGUID: 9CfZhRUxRvuKELiBCVI+tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
 d="scan'208,217";a="210635920"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 23:29:44 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 23:29:44 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 5 Feb 2026 23:29:44 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.33) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 23:29:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8x5s7YQ1Lvr/IyN5IAyrUHqIPv6r71XP6sJU7AuUe6k7XJPpeP2ClOsuJqVerlYgT3YPrNizWdmXP0JxCxMJle2uP7zkjNTRQsplX/aLSuoNpRoaJbb7AH2NzM0/2/fuYnOdr5AMohKXtMOqdzG8K9rY+EH+82OeiiKEsd0jvVsKYjPHRM5dA8SCFXUe5d9UvK0pLOnV/FkOtEWVs4nzsyZ9GPbWp9qfT9J9Q5HUy5dpToGoL2UFyHvT/HXJiBjtpc+Uujdc77pu4ZsNlyUO922/0tTDOpCDD4sB6BuHISkibmJiS9E/XFwWUewbKuEOwsk2RMXqiTbYCbeoBQvoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JropteJg7zG4wkSRjebuTWWzqYZ3ohnkyyYxKNDNWrQ=;
 b=Uuhl3+/6Nnq8u+iMXh3S/AJynsTjWPMoqWIcuH37p1BLdW77Ncf16e8Z+g4oFzRyHXJFpa2027DnFVj3Zhe10P1T7CJR+fOIaUrf8NuShOxrxSg252mFPVD2/nfotM0IxaoFyc3mApV0YctOYNY6H5Mj89L48Szl6KjwGcbEhIPPrWG3jD1TSDozDDQIhUznSFtRvPRInQbmUuDzTCvZUB2a/Tts7Ll9Hlu6HK8yeambem3GK7i68ThsXp00YetsRFgWoaN29EGn66UdQsUSBTzrP7Zb/mrHb+bcvSejNq0ASlRzGwMySLrBTAKoUyMdkAbtacABkOk3eFlLWhTX8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by MW5PR11MB5907.namprd11.prod.outlook.com (2603:10b6:303:1a1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 07:29:41 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%3]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 07:29:41 +0000
Content-Type: multipart/alternative;
 boundary="------------vnURyjgBWCQiGkVD8cUyEHRv"
Message-ID: <87b81701-57a5-4e12-9115-2a69b9832185@intel.com>
Date: Fri, 6 Feb 2026 12:59:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Prevent unintended VRAM channel creation
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>
References: <20260119143138.1362379-1-karthik.poosa@intel.com>
 <aW-FTFpA7cvJOoMa@black.igk.intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <aW-FTFpA7cvJOoMa@black.igk.intel.com>
X-ClientProxiedBy: MA5PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::13) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|MW5PR11MB5907:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bbca262-c373-4219-c989-08de65517da2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEpINXhNN1BsSDhYeHgvV3BDSU1sS0dYb2tROGFkY0NZa1lwdWVyQS9JZm9j?=
 =?utf-8?B?ZnFEVDVTK3VSZnlSQlNYRVdqU3BYZU1QaEVuRVdadUVVMnM3eXlwRlVqd0p4?=
 =?utf-8?B?RVR0SUNVSmpDdm9tandla09BdmR3eVRXOE9Pd3VJaUdKWSs1c2psU1F4NUs1?=
 =?utf-8?B?WEZFTG12cFBYcHMzNG1hT2RyVFVTa3JOeC9mZ0dwSkdpWUsxa3VjUWdWOFhh?=
 =?utf-8?B?ZmlKN2NQRWhoWndXQTExamRWR0JUR3NwTWhlTTBZMnJuVndqY3h1N2ZhUHkz?=
 =?utf-8?B?ZFErcnNNQkpaSnFTWUVMdjZYeXlyb1pwbU5iWEI3R3NXN3NMK2VFM1FGYXNE?=
 =?utf-8?B?UFByM1ZtVU90OHpSWjhCa0xvTkRyemJwOWhwWFVYakRvV2p6UGlwSXhtc3Ax?=
 =?utf-8?B?SDFncVJpNk1zK0tYOUJBRW1Ja0NBTTJrUitJQ0FNL3E0a0tNa3BhVjFqSVVO?=
 =?utf-8?B?SVhxQTJtZVVDcTZKU0RycDV6NTZ1ckMySmUxaUgxZzVqVm5makErMllYeHBE?=
 =?utf-8?B?T2ordDFIMzF2RENwN1kwTFRUMlprV0tML1l4YUpoeEFoRlhHNGwxNEdVaisx?=
 =?utf-8?B?eG4yaU5XTjlWeVJCVHhLcU5VTk9UYXQ2SFBuV2lDMWI1VitzUGtEamxvVWh6?=
 =?utf-8?B?Zm9QcHFVTlZDajRyRkx0blg4WG5IMHUvYnVyeHpCc1R1Ym9kWHVLUjJ0OFps?=
 =?utf-8?B?Ym5hYVZkYTZDOGUwYTBMcVJEMC94OWtrc2RQbXJoaFRVd3U1QjNUZm1Vd3F6?=
 =?utf-8?B?amJzQTR0SzhHVnVnNlU5WjM2bWg1ZDNlTnJnOEZQTnBrWnNoeTMyZVFpcVh3?=
 =?utf-8?B?Y2lkVTFxVHk2LzZEdzE1RTNQYW9oYkNMZXptekNFMzhhdVZpODBqVmVkZ2lv?=
 =?utf-8?B?VVJsZWsxTEpqanFEZ2xGOEo4bVFqbkpHMTlNRloxU0tTejBrZ2RaeUFaMmc4?=
 =?utf-8?B?NjErTExrdnFodFFPWmR1M0hpbnhVU0hCem5abnBKWGtjOEExU2M3K2xFZzEy?=
 =?utf-8?B?NS9tUExucEs0UGZCUTN3YnpBalZKeUlUZkY1VU5qZ1Z4WFFKZS9yelZCM2Jj?=
 =?utf-8?B?dVFQZVE5UU1scURTOW1YK0phMUJIMVBrZGJqdXl3SDZVTGN6ZkEwOGducVlm?=
 =?utf-8?B?aVdCNEp5MkJhSDEweWhFOUtjZWZOTTJhOVdYYll2Rnc2amdVTjhEVTRiZnNN?=
 =?utf-8?B?OXFXVjA2UXVUZWp4MHpvRHpOcEFiTC9qbW5vSmgyOHlvajR4cm5LK0pKU082?=
 =?utf-8?B?b3drcDZadGE5UFlXeXUxa2g2ZlBjaFZDdkp3M010RnFMaWI1VTlrUGJaeWsy?=
 =?utf-8?B?QlNoZlU5NEJQQWNKZUNYemdjNk9aN2ZIcTcvK2V6ZUZJMGlac1JYM0dReDlI?=
 =?utf-8?B?T2ZsRWZJSmtjcWx4YjUrekdTdnV0TWRqbzlPNW0rOUNnd2QzRTJBRHNnZjBC?=
 =?utf-8?B?Zjk4UTlSU3VDSXYyYVZ2UGpqN01iQkRBSElqcGpzVFRjd1M3YmUramZ3WDVR?=
 =?utf-8?B?SERUS0RBSDFwTXFXZWN6M1RpTGxqaUE3WU1BRk80WGZ6aTFaYVIxK0hFSFU3?=
 =?utf-8?B?cVVBN1hGSEJuYnFybVlYSGRMSW1HUW02MDFmWWlTYUEzcG03NDFNSE04SGxV?=
 =?utf-8?B?eHBLTVc2SWZCaWRFd1ZUV2g3K2Q3WVo0d0t6NnVsSGZpTXdZbC9Cb1NnVWNC?=
 =?utf-8?B?VXFOVXNQcUNWNGpmVVlwQnpGc3UvS2RrV1BlZUFSVXN5b09lMjlsNmNJMXlk?=
 =?utf-8?B?b0d5WTRNZzA2N3BCTzQ1R2FFaXVBWTd4NVNKRXBaazNieVNmMkxzaVJpTC9t?=
 =?utf-8?B?b1YyYisxbk5rR3BoL1RqRFNlcVVoeTJ4TnBoVCt0RjdNVUdySFVjV0dUbDBW?=
 =?utf-8?B?SFlncnlmZ0pxMWZZTTZzZk5kcFQ3VzFWcitHc2FtWmhFaWRxcmJlQnlDRFM3?=
 =?utf-8?B?eEFyWnpaTFp4a1YxOWFka0NzSHBlcGd3TVdncUViSk5NNHRHY2g4MFBlKzhM?=
 =?utf-8?B?YzM1RW5yMmlzTURqdWVZbE9hclhuNWxLbVpzMzJpN2ltcERtMGJHU2MvUERh?=
 =?utf-8?B?QXVLOHpoNHF1SUg1ZFFMRXkxUjF0MXk4TjhvK245MzBNWlNoN3l3YmVXS0FI?=
 =?utf-8?Q?YDbA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2FkTTVvVHRDSzFuQkNjRndDT2hicWU1aENFbGxaTzBzTnlDbGVPUWhMbzEr?=
 =?utf-8?B?WEVWTWdzUlhhU0NTY1RUUVhOMWlxNE1YQ1B6RjRMZndzNDJLQ1lSaGdQbFFn?=
 =?utf-8?B?aDIwNE9xV1BWby8wR3BrTHY1RnVpY2c4VGptUmtwWUtoa1NnU1B4TlB2ZkRV?=
 =?utf-8?B?ZnZGV1o4bUJyaFFaZmJoZmVVYzVhV0MwT2IwVkpyMjQ2MWZVSElrV1ZSV3lh?=
 =?utf-8?B?K3hNZTYvMGRzNXR6S0xrektUdjBuTVp1OWhVTUVuWm5jaXZPdy9yOFpveHJ0?=
 =?utf-8?B?L3AzY3JiTS9ObXdSTzlSQ0dYSUNsclVaeGluU01nbStEWW9Kb2w5L1VQb3pQ?=
 =?utf-8?B?WXN2cVZLcjhKUEk0S3pWcU83TG9LTThVdWpERm1jSlZySEVFclBQOWFpblgr?=
 =?utf-8?B?dDBTUnUxbEswb0RjN0lXZWp6MWxZcXBRNkJ2SEtwU3VSbE5tNnhUWWlCSXh0?=
 =?utf-8?B?eHVUVzBZc2Nnc1VMWHRUN1psNGdYKzNFZFlsMmFHREVmbXoxNFI4TjlaMTV0?=
 =?utf-8?B?SzhSWVFBNnFqVTFGYlNKWWF1a3QyOVdQWlZuQklTUCsvRmNtZmdCNFpXUDVV?=
 =?utf-8?B?MkVxK1VHTDY5VFVXeERIZ0s1bXp6dGtoMnluU0tzaTI1NWpNZ0o5clp4RS9h?=
 =?utf-8?B?c3gyNGIxc0YyWitKR29BY1lBOHJEWGROd0tKbEl4ODQrVmk1ZFcxYy9nQkhv?=
 =?utf-8?B?MlU5azBETEVUU0RXSFhWUTBRNitKemZKVGdoTFQrZWNrVVNUUmVKb0ZwTm10?=
 =?utf-8?B?SmQ5VC9VYmJTUUVNN0ppaGprZmVrODYxZVdNU1g1NDV0dUFaZzdMTGRTZG02?=
 =?utf-8?B?MDlXWk9NUm83emtwQW1QVVM2VDgyWmVzZW9aK3N0OHAzcVlyeWhxQko0aTJH?=
 =?utf-8?B?L2dFYWJ2eEZtdi9UMXFyeUNtSlhNejFZemRVUG9vS2Jvc1JpdmRyTjRmT1Ax?=
 =?utf-8?B?aHNoZk9lT2JiMVpyNFYwTWFEZjhTTktlcklnSW02Wk93Vi9hK2hpaC91SG9D?=
 =?utf-8?B?MElCWXBMb0R3ZzVNUUl5b1ZkS0gzYk5wTW1BTVZSN3JGeUY3VEc5dnNVSGY5?=
 =?utf-8?B?VTFGdVZsdm43anBWNTBodmE4b1hGTDM5eGozUGNyaUFxUlMwZ2QvZTViUjIw?=
 =?utf-8?B?MXFneXB4ak5lN2x1K2FoTkR3YVFxSnAvV3RqQnJLcFA4NjdRVTc4czZJOTMz?=
 =?utf-8?B?MGgyWThoelZHMzNzZGF6ckQ0UUplVWs3cXlvaEljckZJRkNoOGdWb0VzWk1x?=
 =?utf-8?B?SFgvMWxKWFlmZVFrVnkxK0huWFl5UEo0SUtoYUhxY2Q4bzl1Vy9NS1d3MUFP?=
 =?utf-8?B?aG5BeGswY3c4WU52cDgyVnkybmU0RzdWSTFteC85SVFqV29TUmZKV2l4blov?=
 =?utf-8?B?WXpRNlVYeE9nUjluOUVsc2p1NVhaM3RxL0VxMUpScFovNXBkUEFaWXpnbzlu?=
 =?utf-8?B?OGdNOHA5aktoekN1MzdTaStDZ1U5bmo0WFJHWFV0UGIyTkxjUzRqZWI2ZXJC?=
 =?utf-8?B?cC9kc3llSmZ4Ty82V3RWVm5tUjNzQ0UxU2NESVNNSCsrenFzeVdMVUw2cG95?=
 =?utf-8?B?L3RoUmUwdWZ4U1lJbURPTmxPc2tDQXU1cDlON3llQ3hjRjI5eVNCTHF4dER4?=
 =?utf-8?B?dnlrNG5wNFBXc2xDVi9LZElMd21mMFZ1bDF2aHRMN05meWREU0tPRVRGdnM0?=
 =?utf-8?B?dFJBODA2MlBOOFZ0QmpCYVFzNEthQUJWeXluTUxsM0s4Q1hleGNSS01WOEph?=
 =?utf-8?B?RFVpSndVZllNaERtQzNKNkRaUkh6QmFsRVZIVUcrZUk2ejVCb1JScHI3OGpB?=
 =?utf-8?B?ZkdhUzRwU1Z0QTFodXk0MDFlVW9BaWNwbUtWNU5IOVNPalRZWTBENnBiMlhN?=
 =?utf-8?B?SXkvRlRuUnY5TEFUeWhnRDBMc2R6MmFod29PRHRWbTNENnV0ekJtelZYSTMv?=
 =?utf-8?B?UGRYL0lOT3IvUzdHNmhvbEFvK1hhS3Z0cUtRbzlBWG9qMk10ODBaNkwxMjJ4?=
 =?utf-8?B?TlFWbjJ3ODVMNDFKR28wT0twWEdtOTVOaDdQbDR5dGZnc0RBSmpxaW5zanlE?=
 =?utf-8?B?emFmNlU2UUZldzlmeWJNaUJnSjdpRXllbUF5Q2tqSjhsWitadkNyMXlGci9I?=
 =?utf-8?B?VFZVT0QwN2hjcEcwajhMTldxL2tROVhjeGtDK092TzVLNVdyYjZoRTFyMTVn?=
 =?utf-8?B?bnZDWkZqdER5emF3Nm9JOEh5WHR2VVUvUTF6OWNVeHN5VzVYWk5WcUp2SXds?=
 =?utf-8?B?WlhYTnVIVVhIcUFOTEhPVlBlVkRkNXJyaktIV1laaU1PWlBBcFlxUEVqS2Mr?=
 =?utf-8?B?R2M3dDBPb1hpc3VEMm5kSDg3NHRxUU9ZQ0NZQ29oOXJmbTV3OHZRdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bbca262-c373-4219-c989-08de65517da2
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 07:29:41.1686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1RiVPI93B+TmsReMwHLSPlzehs08l6S6ZlxR0A7yJB3sTxrzdNDIvdlZM0W6oVwIk7xFBp0z5CBaHXwY9cSySQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5907
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

--------------vnURyjgBWCQiGkVD8cUyEHRv
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

2

On 20-01-2026 19:08, Raag Jadav wrote:
> On Mon, Jan 19, 2026 at 08:01:38PM +0530, Karthik Poosa wrote:
>> Remove the unnecessary VRAM channel entry introduced in
>> xe_hwmon_channel. Without this, adding any new hwmon channel
>> causes an extra VRAM channel to appear. This remained unnoticed
>> earlier because VRAM was the final xe hwmon channel.
>>
>> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
>> Fixes: 49a498338417 ("drm/xe/hwmon: Expose individual VRAM channel temperature")
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index baf277955b33..f614f1308dec 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -48,7 +48,7 @@ enum xe_hwmon_channel {
>>   	CHANNEL_MCTRL,
>>   	CHANNEL_PCIE,
>>   	CHANNEL_VRAM_N,
>> -	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS,
>> +	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS - 1,
> Can you also check in_range() logic and investigate how channel id greater
> than CHANNEL_VRAM_N_MAX (for example 23) is delt with?
>
> Raag
Hi Raag,

We are not seeing new channels with in_range() + CHANNEL_VRAM_N_MAX as
1. hwmon_info[] has defined only CHANNEL_VRAM_N_MAX channels,
2. CHANNEL_VRAM_N_MAX is the max channel supported in xe_hwmon.c
Checked in_range implementation also, you are right, using 
|MAX_VRAM_CHANNELS| with |in_range|() is correct, |as it |requires a 
start value and length.
Using |CHANNEL_VRAM_N_MAX| instead would pass offset which also includes 
extra offsets from CHANNEL_CARD to CHANNEL_PCIe.

I will use MAX_VRAM_CHANNELS with in_range in the next revision.
>
>>   	CHANNEL_MAX,
>>   };
>>   
>> -- 
>> 2.25.1
>>
--------------vnURyjgBWCQiGkVD8cUyEHRv
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>2</p>
    <div class="moz-cite-prefix">On 20-01-2026 19:08, Raag Jadav wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aW-FTFpA7cvJOoMa@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">On Mon, Jan 19, 2026 at 08:01:38PM +0530, Karthik Poosa wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Remove the unnecessary VRAM channel entry introduced in
xe_hwmon_channel. Without this, adding any new hwmon channel
causes an extra VRAM channel to appear. This remained unnoticed
earlier because VRAM was the final xe hwmon channel.

Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
Fixes: 49a498338417 (&quot;drm/xe/hwmon: Expose individual VRAM channel temperature&quot;)
---
 drivers/gpu/drm/xe/xe_hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index baf277955b33..f614f1308dec 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -48,7 +48,7 @@ enum xe_hwmon_channel {
 	CHANNEL_MCTRL,
 	CHANNEL_PCIE,
 	CHANNEL_VRAM_N,
-	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS,
+	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS - 1,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Can you also check in_range() logic and investigate how channel id greater
than CHANNEL_VRAM_N_MAX (for example 23) is delt with?

Raag</pre>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Hi
      Raag,</div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px"><br>
    </div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">We
      are not seeing new channels with in_range() +&nbsp;<span style="white-space: pre-wrap">CHANNEL_VRAM_N_MAX as</span></div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px"><span style="white-space: pre-wrap">
</span></div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px"><span style="white-space: pre-wrap">1. </span><span style="white-space: pre-wrap">hwmon_info[] has defined </span><span style="white-space: pre-wrap">only CHANNEL_VRAM_N_MAX channels,</span></div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px"><span style="white-space: pre-wrap">2. CHANNEL_VRAM_N_MAX is the max channel supported in xe_hwmon.c</span></div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px"><span style="white-space: pre-wrap">
</span></div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Checked
      in_range implementation also, you are right, using&nbsp;<code>MAX_VRAM_CHANNELS</code>
      with <code>in_range</code>() is correct,&nbsp;<code>as it&nbsp;</code>requires
      a start value and length.</div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Using
      <code>CHANNEL_VRAM_N_MAX</code> instead would pass offset which
      also includes extra offsets from CHANNEL_CARD to CHANNEL_PCIe.</div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px"><br>
    </div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">I
      will use MAX_VRAM_CHANNELS with in_range in the next revision.</div>
    <blockquote type="cite" cite="mid:aW-FTFpA7cvJOoMa@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 	CHANNEL_MAX,
 };
 
-- 
2.25.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------vnURyjgBWCQiGkVD8cUyEHRv--
