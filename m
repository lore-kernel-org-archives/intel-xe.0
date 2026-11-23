Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E902606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 07:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ETYmEFEx;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Ab9PKZmZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0554610E61E;
	Mon, 23 Nov 2026 07:29:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F16B10E61E
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 07:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795418944; x=1826954944;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vKjI5UwRzexEPg7AAwu6T6f8uAh2wOrRD5bKrVE69pM=;
 b=ETYmEFExy+uPaMz7GKRiIUse2U3r4c1I+SqPQnDp1HOg8Z+/ODooWy33
 Qm6LfB3mQ2+qv1jhUtItWlMT4cvzaWvjdMHWru1UssYC1ClUEJOQixlLw
 fSHa8EU5tluy8Q8Vku3rsNt2IgK2AE08e1avbMn06SmynSlufKaYnJcmE
 Urdexbfg9mZ+uXMcQmHJd2MXz08WX66Ikq3knVKuvIwR/vgGI+GQbk4EL
 bpcbeszGH4Nt9/M2RyNEhQn46R6X5Kxg54x5gYVdM273kOuqoOgQE6Puo
 puJspmDYtC+DeRwgfIj2ap5NduBSO3c2RY1R4zlkMKyLfXy7HliggAWXP w==;
X-CSE-ConnectionGUID: 6j+ILMagT3mfU4k89eaIrw==
X-CSE-MsgGUID: gaTlkd27QJGSsWUt89nkwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4265741"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4265741"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 23:28:59 -0800
X-CSE-ConnectionGUID: N3XYGp5IQSCg5ZKL3dXSTA==
X-CSE-MsgGUID: weBzSb03QkeIc7S7h/NJYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11315841"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 23:28:58 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Sun, 22 Nov 2026 23:28:57 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Sun, 22 Nov 2026 23:28:57 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 23:28:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zD6oA9gMOV9rDAStyq57HKafKLZga4JnFmtybOF144dt+yogth9+Cf6T9iR9NxujBl7A8e9CkgIzXf0PrMXOPwa0EX5DB24f3mTGG+Cuu9kA8+Juyvj3rI3UkNodER/D0D6ZuomanHC10g94V9BvVFPn7/KB5dbR7Gthli9lZYv6zq6g7HfJzVb0q9lkjx75gTsO1LSKcF/xzFsmUW3hqzDhEL/C35qneiakGHiBdWyG8+CrOFolLJgaw+FxwNt81hUH4W/X2wOk9f6geHxkgqxlKL50PM4d+OaCRIblJx6GLV7VSa9F7QJCTdCOgM+02bxwg3A7fShHO4zYyVlYxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qr7GCw7LLshRWW6eHfCkGJF9npTHIpaOSx+DvaAhebM=;
 b=UtS+MeFPh8FI2SqAAgCjshXVsXzQ0D5sLTYSAshPgPHUB0JycHhA9i3bXmMGygffE0saEU7xNMPPgaD1s3vFg5mzEn+HXL7ndfj7PKPqlLEI/MeucEJc8iySMowQYyPwJzPUFyImpaJCTRZoVESZ9tuR7M3aPPBOZOmEFLChxxEfKS5wep4M32K2diXgYl8f/QBf2BILeQM91v0KdK535MODo1D7ukhiFVj9TxOWEqM3aU7fH2gCK8wnYwZlDwZXRGFM7LlKm2zJicm41PQRlFuS5dVU79P/+jwZKflgkIYXEC4Yn92S/NX2SFgI/MZQbvggGzcnUCmPEpIvJHgnfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qr7GCw7LLshRWW6eHfCkGJF9npTHIpaOSx+DvaAhebM=;
 b=Ab9PKZmZyik6k0gh8oTwT6muRzexbgOSuaenJhP8D8vI0HUlL2JAssZIuUmpxuuOhjWK7ums3U4/uUcvWFWk+kddR1Y+YGifKD6K4u+FJPB5/9WELgRdRUmHcnM7oKWQOIX6v6rt0BpYwVdl1ZS3JwRiQIi6EgRwqbHhjnotOcs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS6PR11MB139798.namprd11.prod.outlook.com (2603:10b6:8:4a5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 07:28:55 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 07:28:55 +0000
Message-ID: <c336f40a-457e-4a62-986c-376c153b535e@intel.com>
Date: Mon, 23 Nov 2026 12:58:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/ras: Handle SPI out of flash error
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <rodrigo.vivi@intel.com>,
 Koujalagi Mallesh <mallesh.koujalagi@intel.com>
References: <20261123070221.1611306-2-soham.purkait@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261123070221.1611306-2-soham.purkait@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0358.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS6PR11MB139798:EE_
X-MS-Office365-Filtering-Correlation-Id: 945f8436-8781-418c-8b69-08df49336e37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261026140227099003|261026121527099003|261102123227099003|261022113327099003|261022105027099003|261028144727099003|261021121427099003|11063799006|56012099006|10067099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: YtRPHaaFMYM8EAAyw8/d12+2lipROOWlz7ZJdSRsABv/zLYRh5C2HWhOBOPYmUAnEOsy6ER2WqhetPGvsSw5/XE+QzUTHDIw/xI+nbtA4DNDOcAFVBciXof9CTfV/LzRKXrjnB/mrC1coCn7mZ7BwE8KSC5in5lXMYpriaE3tXOkCYvWa5z1efo6ItNK5Xdye3H1UK3nKZPd1rozezaO/FKyK4fpbEsFa972wnVQz/+78L7uhq7shofCspg68bs37Sxrkk3yIhUOiot+uf4/Ah0mKxPjJ+kEOmUxWcKbigt/7h1Q0iF1jJSvFjEH6HfvtqG2w3ilLVQUWNS9fAPUW/9T9YMsXcH8zNPVx2/149pNERQXz7CTo3XZAEzTdyhp1y1Z1uEhNiDkXD7soXUwLfBuJ7qvoOyj558qqiiWktRlx425w8tDNC8xlg5ksYEfg9c/+rFvWTvgSyvlbLy6lZbCSdMmQc9MoGF09AX/7S7RDZvylbONwA255u7HUGO2qvFd4/Y7pFnTfyr6zxv2IPRogk6WaF5+aZHgzGNcMg9oBZbSQ2wl76xWeMVbDRff1yblwC1I2NbfPjjdYlCbJUNickN6qCblyDO4hM1uWNgSFejxBFzVpljoOvBBQ1JyLFZWqdDh+JlVmg5aSP0/8GVXerZNidD+Ac+pyz0u2mw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261026140227099003)(261026121527099003)(261102123227099003)(261022113327099003)(261022105027099003)(261028144727099003)(261021121427099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUdQTngyYzFFL1ptRlNkYnBIOUg4bG14d21VSmZob1lYanp5YkdiVlh1Ui9r?=
 =?utf-8?B?OEFjaTE0REF4THlMd1QvK3JqVXpOVGRZUnUvcnVmN09IYUUzMUVpcGpzRGhh?=
 =?utf-8?B?U0VyblhSUkVOYnBZaDAxM2R3ME43SVR1cTBnTU1IRmx0NmFOL0hsM09uVTl0?=
 =?utf-8?B?Mis0SjF1cSs3MEVBK0x2MEVEdlR6RGswSVV4a2hhOXFXRW1vSk8wcEFnZWNV?=
 =?utf-8?B?aHFrVnZKL3NYanhISUZrRk4yZjk3MXJGM090cEFOVldHUTBYWWF4ZER1SWhJ?=
 =?utf-8?B?THoyamIxaGVrb3hFbGtlYk5SbzRFZTFvbTJCMWw3Z3VnRkhFckh5dHc4WmE2?=
 =?utf-8?B?NmNESUh6VzUxRjc4REUrdnltOUtLakdlTXEza25rdFhpNlVFRGZjdHRGTFFx?=
 =?utf-8?B?U0hTNldwbi8xcWxiQUNZTGVZRExCNW9jYVZDblZ0ZEFCcVFzSmhpWGswL2ZC?=
 =?utf-8?B?TUh1Uk00a0hRVFNPKzRUenNBTkV0UlE2NTJjQmFneGhabVZmNEN5Y2ZZY0RJ?=
 =?utf-8?B?amU2VHRvcTRyd3ljUVA2UmhTWXNuSDJRV2NjUFBrVGlSRGJKa25mY2JEVFNX?=
 =?utf-8?B?R1NJZ3ZqckJhekY3NTNsdHVqaWhIdkRXaTFvK1FVcld1eWhkRUU0R1p0aG5k?=
 =?utf-8?B?NzlaYjVvaE5INnRXM3lVeUI0VXVZNkQrVXJLbGY4NHhnVkV5aWUzOHdKSWNp?=
 =?utf-8?B?T2ZZRUMwNTJ3MHovRklBTTdQSlkwSHhhV1l4WVF3ditrcVFMcmdhVVh2YnJx?=
 =?utf-8?B?eFJlbVlpWE9LdjVGTXc1OEgvZXUxOEppczZDS1VLV3J2VDJjWFF1dGdUWEVi?=
 =?utf-8?B?M2wwcitqRDVMazRLWWZ2cVBaNDRuMHRZbWQ3MmYwVkNpWGNteDlMK2NpbmNT?=
 =?utf-8?B?TEhJQmhyK0VrVUJUVFhiUHcrY0VjcWhQbTdDSVpFSjErUGNIVGovd3N4Mm0z?=
 =?utf-8?B?c3dXdmR2aEpmR0ZnYlBiL2Q1ZDFmdk1ScStKaEgxdzQyY1lMM3QwdnR6SXNp?=
 =?utf-8?B?WndyRXlyenVBRU9VYjNrQUtHU2VyTUs0UG4ydnhJY2Z5Yk1WSG4wVUxDb2VY?=
 =?utf-8?B?S3FEbllWSzlEdkFJRlgwRnhsVDU4ZHNhT1V6Sk85WlB2MUd6VjZwWVlWMEd6?=
 =?utf-8?B?OUhoZnZQVzNqUlU1QlZzemxtVHJoRzV3Y3kvL0VLcUxVM3FYb2wrUDk5RzRs?=
 =?utf-8?B?MjBIUVJrQ252b3NUM2NFN0p0ZVdMZWZQblRaeHEvU1Npb3k0Q2FzTXVjMnFh?=
 =?utf-8?B?c3dQbnREWllyRGJ3YkR5ajFOQU1MZlpPUTJaZUV1WWg2VW1laytEQW5tWnlK?=
 =?utf-8?B?MUw0VmxTZ2h3L1hxUTBmNytndVJBNXpNa0NjaG5KMGJ6MEt5QVBJYnk0WHZQ?=
 =?utf-8?B?b0p1ZHdyc01makxtRDRoN3diaHprQVJiZ2tyVEZDdGkrcmcrejkrTHd5TlF3?=
 =?utf-8?B?K2dteVd6aGt3MkFmSmhPdDNNa3FndnM1TGtYR1VRUkVMSGxzazZtOWVTd0xJ?=
 =?utf-8?B?N01STjlGL1AwemJId3JFdC8ySGNDSG1GelhielJ5ZlB1aFBRQWpmd0hsdFlS?=
 =?utf-8?B?VjdnTWVxS1NxUGxNQ2dUc1JQaWliOVNFUTBNYkpTVzVvYVFiU04wd29kUGpL?=
 =?utf-8?B?eHRpemJQbU0wTW13TWRZT21oalh1cDk3WjUyaWlDM2R6czhqVVdxRmVTU0RS?=
 =?utf-8?B?aHlIV0RoZmNZOHRHRUhiNzVKM254UjAxeVRBYjQ3VHpvWTBEQ0NTaW00QmhC?=
 =?utf-8?B?UHlaUXBEcHh4QUlyU1grZ3YwcXBtS1dGVzRKdEtoZFl5VmU1RHFpdDgzMDRS?=
 =?utf-8?B?aVBPMHpISEE5YjhZZlZWcmJ4ZnFDZG5EczNDdXA1Si9DKzBSQjJpaWNCZzZF?=
 =?utf-8?B?bFkzaVZpRkcwdWdjSlhhTWNtN2FhN1YvTlErQnZFcUhUc1d6K2FqdWxFZ0Ir?=
 =?utf-8?B?cDVhRkVWbWg0MEd1ZGdRRVIxNkRxRzA3SlVmYUFXL3EyVm1TQTZPcWRFaFRu?=
 =?utf-8?B?a2UyRzRHNWd6bU1lL1UvSktWRmVBQ0RxdG5IWGhCdXJ5ZTBOZFNxbmtrUmlV?=
 =?utf-8?B?WjFBMGlIYlkwSzlSMHRteitGeUdPUVBNVGowblJaendkSXJzY21yS3Rma2hY?=
 =?utf-8?B?dkYwTDFkUk4yTHRNR1FmdER6b3B5SklORXpFUTFNQ0Y3RFdNSnQwNmhsaTh5?=
 =?utf-8?B?NSs5OVgyNzYzQUF3d2RGc2FQUU94T2FDK3l0d2tZMXh1OTlpb0pPRnpuN3lj?=
 =?utf-8?B?dXVYdGZmOE1ib3VsSHRKVHd6SHFxV0hqemM2U3ltam5ySTZGWVd1eVM3Y2dy?=
 =?utf-8?B?bmR3cVY1NXBZZHp4eVJsUkFOR2p2VnVsajJWSDBBU04wNnhiQWxFZz09?=
X-Exchange-RoutingPolicyChecked: Y/pFp6TkfNS9CEp1vB0BLo4sUhYNVhU9dy4LOL5fDcdLbwOjO9EYlbMubYNuXJWXk9Iy8JfYT34wrEPnTxnKTR3JlTWhkkSggTJGRR8KIwGLeaGYk5rtrrqCxmVYrURkzOQoMKhHPT6CIPX98QnM0zqLCAaYMiCGz4XJn7QjBCRjHWjO7pa1lXH4SpDLfOm0aZgZQzgFAixhst1z0EvejX/M8iD4e+/xz/T33WwUfj/h8AQGYoDoYJozu7U/f7c4k+CJBz/3PxxH2Rcpa39OA+LiPFAoHrCXU4TMf6jcWJv/0ZMNAcHKI3stDX3YID0UNFAriY8snm5Xxpj0g2JSfw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 945f8436-8781-418c-8b69-08df49336e37
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 07:28:55.2365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JzprJXh7EVMbStD89UmhQ7f0y70JlwFd+9xGOeWxRebw0XAYOT6GXWJL1ePU2lrAq8Cu6ZBFdh5rBnU5c7EINQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB139798
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 23-11-2026 12:32, Soham Purkait wrote:
> Wedge the device with an unknown recovery method if Page-Offline returns
> OUT_OF_RESOURCES, or if the offline list is full at probe.

Subject: do you mean flash out of space?

Maybe just mention offline list is full?

>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 0fb891d00b36..76441858391d 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -80,6 +80,7 @@ enum xe_ras_response_status {
>   	XE_RAS_STATUS_TIMEOUT,
>   	XE_RAS_STATUS_HARDWARE_FAILURE,
>   	XE_RAS_STATUS_INSUFFICIENT_RESOURCES,
> +	XE_RAS_STATUS_OUT_OF_RESOURCES = 0x9,
>   	XE_RAS_STATUS_MAX
>   };
>   
> @@ -226,6 +227,7 @@ static int ras_status_to_errno(u32 status)
>   	case XE_RAS_STATUS_HARDWARE_FAILURE:
>   		return -EIO;
>   	case XE_RAS_STATUS_INSUFFICIENT_RESOURCES:
> +	case XE_RAS_STATUS_OUT_OF_RESOURCES:
>   		return -ENOSPC;
>   	default:
>   		return -EPROTO;
> @@ -299,6 +301,11 @@ static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
>   	if (ret) {
>   		xe_log_err(xe, SYSCTRL, ret, "page offline command failed with status %u\n",
>   			   response.status);
> +		if (response.status == XE_RAS_STATUS_OUT_OF_RESOURCES) {
> +			xe_log_err(xe, SYSCTRL, ret,
> +				   "No space left in SPI flash for bad pages, manual intervention required\n");
> +			xe_wedge_declare(xe, 0);

Why 0? Use the defined macros

> +		}
>   		return ret;
>   	}
>   
> @@ -504,8 +511,17 @@ static void get_offline_list(struct xe_device *xe)
>   	struct xe_ras_offline_list_response response = {0};
>   	struct xe_ras_offline_list_request request = {0};
>   
> +	struct xe_ras_state *state = &xe->ras.state;
> +
>   	process_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_LIST, &request, sizeof(request),
>   			      &response, sizeof(response), &response.common, false);
> +
> +	if (state->max_pages && response.common.total_pages >= state->max_pages) {

Post processing are we sure total pages will have a value?

> +		xe_log_err(xe, SYSCTRL, -ENOSPC,
> +			   "Offline list full (%u/%u), manual intervention required\n",
> +			   response.common.total_pages, state->max_pages);

Consistency in log please..
@badal/mallesh for sigid usage

Thanks
Riana


> +		xe_wedge_declare(xe, 0);
> +	}
>   }
>   
>   static void ras_usp_aer_init(struct xe_device *xe)
