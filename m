Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40120C5B572
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 11:27:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E8A10E3FE;
	Mon, 17 Aug 2026 11:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bulniwGO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1767810E3FE
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 11:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786966039; x=1818502039;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=C5baSZR1+kKOlXNqVX9KHiYRMQ2pR/QbBv+2PA8eL8k=;
 b=bulniwGOZii2unB/8I7M4KCsmi7fmQHzfXTkv9OUpFmVCl9128rzBrDp
 cX570mXbkQC1gtCIppC31mQn9nBmKAA6OQnMKapnoLVaIv7NHZ/i102RC
 nt2ChY+q4hGpGLvVxm3i9MFwpqBj5P1s1PaCwqycV5n/0LDa2U7fYwf9q
 5I2s6SPlnsgRt323jG5L119X2rIDgh5GODXzMroMVJ82cMVq1zg8cKjm4
 itFiTzRMiU3g6giE3E5YaGh1yaYbwZgI+YiR2s1qltDi5jbrpXrrM+DRJ
 mIXw5afbM6buxELwqjy/p3yy3dR1wu39flyWUbuaf9IX3r/mHWWJ9aRtL Q==;
X-CSE-ConnectionGUID: w19Ak0rwTa6i1SUbXSbYjw==
X-CSE-MsgGUID: 5O8oHcoFTkSHcKki++E9DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98592632"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="98592632"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 04:27:18 -0700
X-CSE-ConnectionGUID: qtZBK6NCRt6zGpgEi69vDQ==
X-CSE-MsgGUID: dcmIbPBXT7eEWfeURsLItQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="264432449"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 04:27:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 04:27:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 17 Aug 2026 04:27:18 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.36) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 04:27:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GHmPf85tn7CwTq2qK6Tt4EK17NqMo9tVW1BekdhhWqBDPauRBbtggwy3p6rLdc/D72KHcXQC1a0t8QkAByRV2Z6e2IxZZYCMLBnEWmwapHL7ET0DB9j8sWJ5r8zdS6x7KA8jwtiB9OhdUECiQc4JhtQypTvrm7RXSp0/55Uez0HQrwQaM9Df3b0l2LElqlzFTX65temiXEnV1USYRQZQUwMScYRyHWDCGBvNNmPaNejlsRDjUoPsePkX/TD+tiWgK41E1rHT8rzHF1isRBE+TtfSlXhN/cDu9ClxF9bkvuFFdDVLD9TS2yQj/TnsytEtABlEWrulpurXkxEUUiBlFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dh293Z/gLsYQDGfKWj4kQAV+uzeyQudHqMuWauhfBxw=;
 b=Ie5DfmNlHf1HJaqGa20+8hmCJlFzi52fl5fQ8O46NfEcAWLeEIR9hP1JBcwfXJfDvm7PnbajgciJwGq+++en2+mxgpj0+pbif9tnH+KyJnAslLoAOc6Uqdu9fhs70p4jAD7HluZH0DoJ8qto/rK+oOPQavtbE9KLETBmlJoYbQIz2F/xZDLzbPi7ARrZIYa9FZ3Ixe/DArm77iFYhAE5kHkGO1BiTATV1VL3mQR10VICSqDKaU7LiHeILwGuYQwAhfYjH99so6w8gfqidRP6KCVCq6bSb0UuTS3tvatPsIdDgQW5tgmqbwT6Myoc8+W44G3PssBV3IrDE0Ee726StQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA0PR11MB4622.namprd11.prod.outlook.com (2603:10b6:806:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 11:27:15 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 11:27:15 +0000
Message-ID: <a670328d-b5dc-48b4-bb02-ed7dfa2d48f1@intel.com>
Date: Mon, 17 Aug 2026 13:27:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V16 10/12] drm/xe: Add sysfs interface for bad gpu vram
 pages
To: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
CC: <himal.prasad.ghimiray@intel.com>
References: <20260817065055.3734576-14-tejas.upadhyay@intel.com>
 <20260817065055.3734576-24-tejas.upadhyay@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260817065055.3734576-24-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0088.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::17) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA0PR11MB4622:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eed0ce0-74a4-42c0-b390-08defc527d07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|56012099006|6133799003|11063799006|5023799004|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: Bz7oMPpGg1Yp7wTvnKUDMk0gOoXkS9bGWykMHYVnPa4zWa4FsaMwpbrYqBGhoDBL+k3FENRRpq4Gno5mgwlxS+7wMqgPPXe0rN/uJeyk54ejhwEzpH370XUPOnogIgSkbGz+i1PYF8bnP6u9ruUbU23Bk/RTlQXD//9eZ6tANdvGSJIMnIHnYryBlv4RwcqlrvJLUmiSNT8k6j/tZPNJtobeQZGL7UOD8l5DD1ETOW6TGZo/5QZ5hoOFzxJf4HJ/uurDOVFoKq/IxQk77sUu78tiyJGGiiSCueAlwbeTE4nrDYtn858SB8uZdypDc1bTZMMB6Xg3C9jZH+my7Zn2X03DRmbNYNQZhg5bTf7GV2rpgWwpAkhkl8OQ26p4b6qZQ55t8ufyene1bIH1xi0mUkArduMUFmdX48bGmlskNwyWtFMXVGGx45xFZVQl4Abo4Zqa7Z+hv9oCjtgfM4XKtoGVvtsjJCUoYx54+k9s7D+ntSesIzGlUPLmpbnn6fVbQmT1nhNbE+t61vcnPhqtsBPJdiRBfLdsyPzuuhhLsSapUnzfo+62LrY8ykpRQcGtQgFUnLx0MkTRUv6vfmolSXG6K4O1/CZVh8L68MmjbwY7iHJ/z5UawZ6SKFgeQRCo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(6133799003)(11063799006)(5023799004)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3lRTU5ZYnN0OWJQVmRNWXU3aHE3N2ZsdFVQMDhsSWwvbVZBUUwvTm11SzRH?=
 =?utf-8?B?T2V2SVBXRVUvU3lueWJqQzllejBsV1lxTlUyTUxYYmtJeHVIZkF3Vi9mZTEz?=
 =?utf-8?B?VktYeUt4VHNGVWxpdmNKekM4dTQyZ0lMSkFhNmx4QTBHYlA3WkVjNnJwd1BT?=
 =?utf-8?B?b3JCY3FoZ044Rjlyc0lDZ2hKZWpOcEdzV0ZnQWI3QjJYMVU3K0dUR3AzQXNT?=
 =?utf-8?B?MU54ZkR6a24zQnJCeUJmZWRBWStvcUV0TlhUd3RTOWJkR0ZKaHFRbTZZUXBp?=
 =?utf-8?B?UWdHckVXaXF3WlA1UzBxRzh1Z29VdDdUSEdOeVR1RE9IR1R0MFVvVmxlRDNT?=
 =?utf-8?B?N0lJMGN6SFY2SThHVllHOTlldnhWb1pyL3JWS0tybUVxRUJtK01Ja3prMFhl?=
 =?utf-8?B?TVlkMmlIdk9iOGgvTkgxVGwvOVA3K2Q0RWN5ck9JbzNGUVFFV0FTVU9IM1B5?=
 =?utf-8?B?dmhjRU5lb3VyaTR0UFhLMlNSTW5YSWI2QVdwd0U3d3VmbnBXby9jR01DQjhs?=
 =?utf-8?B?VDI4K2RIQi9XakNRWDJJSmhuSXYyNXBvN1l6bVRwcHhLZDNSVkQxa2ViZVlp?=
 =?utf-8?B?TEZYb1ZaekxNWGMzc3h6TEdhQkpDQjJxYzEwWWh0ZzFXMGRXZEJiUlhPT1k4?=
 =?utf-8?B?R1ZKS3RjejV3WFh4bnpuUktDYklvOGhEOVNhVU5semp1OFp3WHJFREd6eDFx?=
 =?utf-8?B?cm16Tnp6Mk93NHRYQjFMa3owdDh2Q1Ewc2s2NnNuNG9rckFFV25xNkJLcEVp?=
 =?utf-8?B?ZDh3cHIyM3ZkdTN0blhXRGw0Qkg4K1RaU0VRSnhEVzZrb0JtNzBPNU4zbWRv?=
 =?utf-8?B?S0hRb2dSTENXWDN2VWtwWGJ5MmZuN3h5cFFKZnhDVnR0anBsdS84anZQUmcy?=
 =?utf-8?B?c3NSSUY5NmIyOGtPc28zQ05ET3dGWmg0S1RKa0NNRkdQZER6RHpDbGtCdnZZ?=
 =?utf-8?B?WS9nUm8rTnZNNzBlN2VIZjlXMS9lZk1GdDdXaVlwdkhVUVg1dUgzczVzRk9v?=
 =?utf-8?B?Y3AvUWJ4YW45L0hxdFpMZmYzMXFlYVZENFBnVy83OEV3bm5KVWRSdS84dDFS?=
 =?utf-8?B?UHdNSlJwSk5oNW9SWWlaTmMvaHJUODlDa0hlQ2ZpUEo3YnFISFc4ZEZCVmxI?=
 =?utf-8?B?QzkwTldlNWlMcmZSMVQ2c2J0Z1czNndFUTlZK3dkTjVqTHZLMzRITEIveVVt?=
 =?utf-8?B?dkRSTFIrYTlYRCtNSWlrSUFaS3pmQW92MTBqQUUzUk4wTXgwNS82RlhZK2NQ?=
 =?utf-8?B?bGV1NkpsNUlpdWVWeHl6OVA4N1ovVXh2eWRTK00xWXJHUUNZZ0FyVy9EQzJw?=
 =?utf-8?B?b3lNZlJnSnBYSEJNUXVJYVFkN0xXOW1mNTVSOTkyanhwSDl3N0UxeFJjRWZx?=
 =?utf-8?B?QlFDY2hIMkZYSERuK2RYN2U0TURLN1Z2SDhUNHYxK0p5ejJJVUtrR3NOQWkv?=
 =?utf-8?B?MVpvb2I5OEpoQ09oakx5TzNqVHp5VVpJOUduZTJLWEJsRzVvYjBlWGFNRGRr?=
 =?utf-8?B?U0swS0JDdFR0RnNFV3h1Q0tVemFxNnluS2Q2d3kvYnlTOHZrczZOWHQybW9L?=
 =?utf-8?B?bHJRa0pEWi9pMkhENmQxcDdkdjVKSHo3UVptaW1IaEM0Wkdnak9QZTJkM3Ni?=
 =?utf-8?B?UDdUKzF6aDFjSXlrVE5EMUdESlM1dUVSUzU1alFoK2svUmNZa0pZZmZRNmF5?=
 =?utf-8?B?SlVDblhEb2dYWFlTS3l1WjV6aHZ6NmNlU3lWNzhGbThjTG51UzRZSzVxeWRk?=
 =?utf-8?B?bGt1MHJVbzdNaGE0eU1ySGZCSG5NcDZ6RUVpT2ZPMEZwQUVzSlJkRW1vT1Ar?=
 =?utf-8?B?UnQ1cWRBVGd2c1h0VHFOL1RIc0hqcmpDOHdXQ1Zvb0lJTU5sZ3NlMVZnbXo1?=
 =?utf-8?B?TzhPbEdZRXBUZW9rcm1MVlhYaGdsb01IeGd5dlNFQVVVZXY3NlFzUHZnZ0d6?=
 =?utf-8?B?NGcyakN1TW1YYTFILzdoMlEwM1Y1cE1NSkVOSzZ4QXdiQU1CbTFCa0lseWUr?=
 =?utf-8?B?VnRQSEY4aUp4d3V4VmNVaXNMd0UrRkc3cW0wTXhVY1drckdvdnRjcC9HbHpC?=
 =?utf-8?B?cTl0eElFZ0ducEZEeW9QVHRhTERPZFpMMHFNdHE1RlcxVWJwVmIveENmUWhG?=
 =?utf-8?B?OFdZSGE0VkRleUllMmFJeWdBWDN1YkF5OENNLzluRjF4NHJOYTlWSU5VOVNN?=
 =?utf-8?B?R0N4TDlnaWFXVEk5R1BwZTd2NU0ra1FiRCs1Unc1Yk9CZGRsQUFINVJ5RzMx?=
 =?utf-8?B?T3I2R1lQZzB1QU9tVVVpS3VhQmdmZyt5czBVQXFIU2lSbFFlWUpYcyt3WU9M?=
 =?utf-8?B?cGU3blo3VGxGWXZONGxBMm1oQWdKU3NtTXpZZk9tZC9kVFNTazRJRnlJZ3VD?=
 =?utf-8?Q?y5UrNcFywa8ZJxa8=3D?=
X-Exchange-RoutingPolicyChecked: r3nvLr02QgCxvsDCOdCw1FxkENPaZDbHUiZavBVdByIukj5Wa0XhCIpeet4gLW6B96tqf+PEFWUHUT6ULMPdINO06NEQvnQlAykAvfzs6Ne/MalW7dEWYqDGXzfMY7fxSjCzp83FNlptGh7TiGSeulWMc58wz/t8XF29oRnWbZq4l2K8L0dlTuRjbKM4LcXCnLL0cMyGTxlRSVH3un+SLmOnaxWY3LYO6zP1zRpdks4AJ4M93vZZbm0uoD1oU5KGScVnnu+nlkIxQBtF3n2beFfpRLyL6plA1w1IHNkA0u3kwBFYcWTLOzBnpJEgPEEz4ag99HJUnOPuHH0Z1/Xgbg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eed0ce0-74a4-42c0-b390-08defc527d07
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 11:27:15.1045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ax+NMiy2eyAZCbvlxuTYIln+5i352gq2buHs2F/6zs9dh6xZ/tElctFgwrzoRjnnitOTwM9cOwMWdxpHWMow3mim15avC4PWh08F3tBjZTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4622
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



On 8/17/2026 8:51 AM, Tejas Upadhyay wrote:
> Include a sysfs interface designed to expose information about bad
> VRAM pages — those identified as having hardware faults (e.g., ECC
> errors). This interface allows userspace tools and administrators to
> monitor the health of the GPU's local memory and track the status of
> page retirement. Details on bad gpu vram pages can be found under
> /sys/bus/pci/devices/<bdf>/vram_bad_pages.

since those new files are xe driver specific, shouldn't we refer to
them using

	/sys/bus/pci/drivers/xe/<bdf>/vram...

> 
> The format is: pfn : gpu_page_size : flags

kernel documentation [1] says

	"Mixing types, expressing multiple lines of data, and doing
	fancy formatting of data is heavily frowned upon"

[1] https://docs.kernel.org/filesystems/sysfs.html#attributes

so to follow the guidelines maybe we expose the separate files:

/sys/bus/pci/drivers/xe/<bdf>/vram_page_size		u64
/sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_count	u64
/sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_reserved	u64[]
/sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending	u64[]
/sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_failed	u64[]

or

/sys/bus/pci/drivers/xe/<bdf>
|
+-- vram/
    +-- page_size	u64
    +-- bad_pages/
        +-- count	u64
        +-- reserved	u64[]
        +-- pending	u64[]
        +-- failed	u64[]

then 

/sys/bus/pci/drivers/xe/<bdf>/vram_page_size:0x1000
/sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_count:5
/sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_reserved:0x0000000000000000
/sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x0000000001234000
/sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x0000000001235000
/sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x0000000001236000
/sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x0000000001237000

> 
> flags:
>   R: reserved, this gpu page is reserved.
>   P: pending for reserve, this gpu page is marked as bad, will be
>      reserved in next window of page_reserve.
>   F: unable to reserve, this gpu page can't be reserved due to some
>      reasons.
> 
> For example, cat /sys/bus/pci/devices/<bdf>/vram_bad_pages:
>   max_pages : 10000
>   0x0000000000000000 : 0x0000000000001000 : R
>   0x0000000000001234 : 0x0000000000001000 : P
> 
> The sysfs binary attribute is created under the PCI device kobject
> when the platform supports it and the configfs bad_page_reservation
> policy is enabled. Uses RCU-protected list traversal so reads never
> block normal VRAM allocation operations.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_sysfs.c       |   7 +
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 141 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   1 +
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |   2 +
>  4 files changed, 151 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index a73e0e957cb0..47c5be4180fe 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -8,12 +8,14 @@
>  #include <linux/pci.h>
>  #include <linux/sysfs.h>
>  
> +#include "xe_configfs.h"
>  #include "xe_device.h"
>  #include "xe_device_sysfs.h"
>  #include "xe_mmio.h"
>  #include "xe_pcode_api.h"
>  #include "xe_pcode.h"
>  #include "xe_pm.h"
> +#include "xe_ttm_vram_mgr.h"
>  
>  /**
>   * DOC: Xe device sysfs
> @@ -267,6 +269,7 @@ static const struct attribute_group auto_link_downgrade_attr_group = {
>  int xe_device_sysfs_init(struct xe_device *xe)
>  {
>  	struct device *dev = xe->drm.dev;
> +	bool policy;
>  	int ret;
>  
>  	if (xe->d3cold.capable) {
> @@ -285,5 +288,9 @@ int xe_device_sysfs_init(struct xe_device *xe)
>  			return ret;
>  	}
>  
> +	policy = xe_configfs_get_bad_page_reservation(to_pci_dev(dev));
> +	if (xe->info.platform == XE_CRESCENTISLAND && policy)
> +		xe_ttm_vram_sysfs_init(xe);
> +
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index a48196ce303f..73cd06c22d37 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -820,3 +820,144 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
>  	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_mgr, mm);
>  }
>  EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
> +
> +static size_t serialize_bad_pages(struct xe_ttm_vram_mgr *mgr, char *buf, size_t max_len)
> +{
> +	struct xe_ttm_vram_offline_resource *pos;
> +	struct gpu_buddy_block *block;
> +	size_t s = 0;
> +	int printed;
> +	int count = 0;
> +
> +	rcu_read_lock();
> +
> +	printed = scnprintf(buf + s, max_len - s, "max_pages: %d\n", mgr->max_pages);
> +	s += printed;
> +
> +	list_for_each_entry_rcu(pos, &mgr->offlined_pages, offlined_link) {
> +		if (count >= 10000 || s >= max_len)
> +			break;
> +
> +		block = list_first_entry_or_null(&pos->blocks, struct gpu_buddy_block, link);
> +		if (!block)
> +			continue;
> +
> +		printed = scnprintf(buf + s, max_len - s, "0x%016llx : 0x%016llx : %c\n",
> +				    gpu_buddy_block_offset(block) >> PAGE_SHIFT,
> +				    gpu_buddy_block_size(&mgr->mm, block), 'R');
> +		s += printed;
> +		count++;
> +	}
> +	list_for_each_entry_rcu(pos, &mgr->queued_pages, queued_link) {
> +		u64 pfn, blk_size;
> +
> +		if (count >= 10000 || s >= max_len)
> +			break;
> +
> +		block = list_first_entry_or_null(&pos->blocks, struct gpu_buddy_block, link);
> +		if (block) {
> +			pfn = gpu_buddy_block_offset(block) >> PAGE_SHIFT;
> +			blk_size = gpu_buddy_block_size(&mgr->mm, block);
> +		} else {
> +			pfn = pos->addr >> PAGE_SHIFT;
> +			blk_size = PAGE_SIZE;
> +		}
> +
> +		printed = scnprintf(buf + s, max_len - s, "0x%016llx : 0x%016llx : %c\n",
> +				    pfn, blk_size, pos->status ? 'F' : 'P');
> +		s += printed;
> +		count++;
> +	}
> +
> +	rcu_read_unlock();
> +	return s;
> +}
> +
> +static ssize_t vram_bad_pages_bin_read(struct file *filp, struct kobject *kobj,
> +				       const struct bin_attribute *attr, char *buf,
> +				       loff_t off, size_t count)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct ttm_resource_manager *man;
> +	struct xe_ttm_vram_mgr *mgr;
> +	size_t allocation_size;
> +	struct xe_device *xe;
> +	size_t full_data_len;
> +	int active_entries;
> +	char *temp_buf;
> +
> +	xe = pdev_to_xe_device(pdev);
> +	man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0);
> +	if (!man)
> +		return -ENODEV;
> +	mgr = to_xe_ttm_vram_mgr(man);
> +
> +	active_entries = READ_ONCE(mgr->n_offlined_pages) + READ_ONCE(mgr->n_queued_pages);
> +
> +	if (active_entries > 10000)
> +		active_entries = 10000;
> +
> +	allocation_size = 64 + (active_entries * 48);
> +
> +	temp_buf = kvmalloc(allocation_size, GFP_KERNEL);
> +	if (!temp_buf)
> +		return -ENOMEM;
> +
> +	/* serialize_bad_pages uses rcu_read_lock internally */
> +	full_data_len = serialize_bad_pages(mgr, temp_buf, allocation_size);
> +
> +	if (off >= full_data_len) {
> +		kvfree(temp_buf);
> +		return 0;
> +	}
> +
> +	if (off + count > full_data_len)
> +		count = full_data_len - off;
> +
> +	memcpy(buf, temp_buf + off, count);
> +
> +	kvfree(temp_buf);
> +	return count;
> +}
> +
> +static const struct bin_attribute bin_attr_vram_bad_pages = {
> +	.attr = { .name = "vram_bad_pages", .mode = 0444 },
> +	.read = vram_bad_pages_bin_read,
> +	.size = 0,
> +};
> +
> +static void xe_ttm_vram_sysfs_fini(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
> +	sysfs_remove_bin_file(&pdev->dev.kobj, &bin_attr_vram_bad_pages);
> +}
> +
> +/**
> + * xe_ttm_vram_sysfs_init - Initialize vram bad pages sysfs binary file
> + * @xe: Xe Device object
> + *
> + * Creates a binary sysfs file under the PCI device for reading
> + * offlined and queued VRAM pages. Supports large entry counts
> + * via offset/count pagination.
> + *
> + * Returns: 0 on success, negative error code on error.
> + */
> +int xe_ttm_vram_sysfs_init(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	int err;
> +
> +	err = sysfs_create_bin_file(&pdev->dev.kobj, &bin_attr_vram_bad_pages);
> +	if (err) {
> +		dev_err(&pdev->dev,
> +			"Failed to create vram_bad_pages sysfs: %d\n",
> +			err);
> +		return err;
> +	}
> +
> +	return devm_add_action_or_reset(&pdev->dev, xe_ttm_vram_sysfs_fini, xe);
> +}
> +EXPORT_SYMBOL(xe_ttm_vram_sysfs_init);
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> index d5392beff30c..eb55b0f74ef3 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -32,6 +32,7 @@ void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
>  			  u64 *used, u64 *used_visible);
>  
>  int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr);
> +int xe_ttm_vram_sysfs_init(struct xe_device *xe);
>  static inline struct xe_ttm_vram_mgr_resource *
>  to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> index dc97b0ad0e51..efcf3e1d4e80 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -37,6 +37,8 @@ struct xe_ttm_vram_mgr {
>  	struct mutex lock;
>  	/** @mem_type: The TTM memory type */
>  	u32 mem_type;
> +	/** @max_pages: max pages that can be in offline queue retrieved from FW */
> +	u16 max_pages;
>  };
>  
>  /**

