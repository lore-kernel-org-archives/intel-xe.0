Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A81D68BD5
	for <intel-xe@archiver.kernel.org>; Sun, 21 Dec 2025 10:49:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B96410E153;
	Sun, 21 Dec 2025 10:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nzs/6W57";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7436B10E0AE
 for <intel-xe@lists.freedesktop.org>; Sun, 21 Dec 2025 10:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766314148; x=1797850148;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d+p8gy+GQFUn62VPHQxmRCgdl41YV/8DFP0Ua0Dbk4k=;
 b=nzs/6W57dcv2GRiKQuRmYwmuW+C2bXHnSZBM95aA55BFFh+zipSJ3Zd3
 QEscK+JX+yTQ4HbasxO2GeRimo1rFF6yAD6ZtOdYi12bo0aaJyw7XL8dJ
 nXMzaNdc4ACEv+VGdKdWQ/0Cgo86F6VwV3RNddXc6FzWTUm7PxLE+SDI0
 XwnctCgskkuQJUY8EfPt6JmmDXX+2/l1zGugWUjNyvWTXrqzEztZoFiy/
 12QRRpqL/ROymGJTJwTUO+8IGGq2iyalCM+wdZ1H9cNqu1hDCv/mF0T+W
 SZTkaw5kC00yw4sStCD6u+Mc8C8JMbGh905Q4qASG6gyT0QLxKl9vMMPu w==;
X-CSE-ConnectionGUID: zU7bJnvPQ+uFHhqqz5uzRg==
X-CSE-MsgGUID: kQKmeYdhTOCJ2+Uk2k8/TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="93677340"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; d="scan'208";a="93677340"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2025 02:49:08 -0800
X-CSE-ConnectionGUID: UAEl0Oz4RxOmpS30rHlPIQ==
X-CSE-MsgGUID: mcNeYlheSWWzNJWJxbj5Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; d="scan'208";a="199185503"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2025 02:49:07 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 21 Dec 2025 02:49:06 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 21 Dec 2025 02:49:06 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 21 Dec 2025 02:49:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VjhjcoREKgvJEZAiSHEDWADD2l37E8Eb5NxlNeoVbF4Qx9Iowlwx644TM4/jXmN3k8uqeo7nwvb5xGfqo6eWzsJSb+SXJpS81kiU5D1heZbqu/TWA0PBc4ESWYtIozHVS2FW8ogsXv2wjPAKrMClZtKf1CZ4A0lyeeX46Zf5l0jxeUKO/MczmyAO3xjuUnydb5c2b2kPr/wyb3jNoRFnGEXarciSaAxr9lO7BJP8iDn7aAOMrvI+PAcT8o/irVou8+uT1Z0bcoYP4seYbULdDcBLOXrcHCM6bcGNtgX5xTEXulHvx+POlaOz/YnpU7lvK31UbumCpQCIjT77b19KRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHh2tw8zMheEn7VWIy8HE2rnRjzZFrfcRSzWFs2ww4k=;
 b=khWOw5257P26Jg1aEqSiR85ii/wKTvoTdJiDD/ylDzsNrkA2/LOFns3pUN78sBav1Xa6sbKKPeWmmzTrKmx3DIUL6ez9sBTxH0XGpyacqRo6Vwy3fln58JP6hzfxzLB/5qfsG/xjcpdfTikfZqoMNobrv2Bj/AmCdiZUe24qlqnTuSKuXrs4aP42pIFdfZXjqWayY2nbPzhsYp+WBaR8LL4BDlGbNVqSJ3Rh6B8THwYu56mhQE8Pn+63IdR36xq7/m7mz/pwBmg6BUtaVNdNkcZf73JgYVUlxmHwfO16vn4Fa6sXP1BElTVaWwOY+fz7l6EdfM5EXJcRaP+zwFeRPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ0PR11MB4846.namprd11.prod.outlook.com (2603:10b6:a03:2d8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Sun, 21 Dec
 2025 10:49:05 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9434.009; Sun, 21 Dec 2025
 10:49:04 +0000
Message-ID: <18e569c3-188f-43eb-931d-3aa7f449aac6@intel.com>
Date: Sun, 21 Dec 2025 16:18:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: select CONFIGFS_FS dependency
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>
References: <20251219080513.848072-2-riana.tauro@intel.com>
 <aUV3dk3wUpf7U6tP@intel.com>
 <20251219163238.GN4164497@mdroper-desk1.amr.corp.intel.com>
 <43529e9d-3bd4-44d5-a603-8394a7a0f049@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <43529e9d-3bd4-44d5-a603-8394a7a0f049@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0029.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ0PR11MB4846:EE_
X-MS-Office365-Filtering-Correlation-Id: b2047312-df47-43c5-bf9e-08de407e8f29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3NEd0lFc0xzYXZaYnBZSjZSakRRQUNMU0dQKzU0UHZkOGloN0FUZ1o0MHpD?=
 =?utf-8?B?WGJYQ1l4bEgvTVprQkNBb1ZrOVgrMkdwNXhSQm9HcCtzVE1PVC84YWpXQXAr?=
 =?utf-8?B?Qm1kLzNuc0hXcEh0NzZtZTQvRURZbmErWUN0RVI1aVJldzQrQ1JZeEt3T1FJ?=
 =?utf-8?B?UHhnNzgxZzVDbi9Zak90L3hVM0crZThqUmVpbU1qeXlMWXk1eWRsY2ZoOHJN?=
 =?utf-8?B?cVpETWpzaHVFSTVqWnM1dDduRTJlRlZCSzFOZUVFelNrdnc3WmdsazBRYVFz?=
 =?utf-8?B?RE1lSFRiMTJnNEhjcWtiMElOVkJPbkNtT2dRSHFJSlU2RWFPa20xbUhSZmhq?=
 =?utf-8?B?bGdmNjRuWWxJdldEVUgzR2pYakEyUjg5eUl1QmQzcDFsdGZvQThUV2pIVVl1?=
 =?utf-8?B?OVdTQkxFWitUWk5JT3NHdVdLMzF2OHZ4MUJ3RkxBUGswY2hodjJuZm5OVWhl?=
 =?utf-8?B?akZPNlNvbnNpd1pDMytCczB3Z1hob3owWll5YkNONmVIVGI2ZHl2UE4wQkc3?=
 =?utf-8?B?Vk92VWE0TkZEcGhFQUFuck9lZGtLQTJtYjIrdHRzNzl3Z2wwZXBCM3JSZXV3?=
 =?utf-8?B?bHN3Q0JEdHFPTmoydGc5QTVZZ1NJVTJlUVZhU29ZL1pRRXJsSURsSU9UdDZW?=
 =?utf-8?B?cE1SenlyZjZKTGN2ZGo0dmxHV2tWTUp3UnNsNDBvRXNzNmQ5ZHFiTHBQbW5D?=
 =?utf-8?B?cnQ4VUk5bGN5bEU0cWZheVZBMG0wanlyZzBuM0FncFhISjNmN3RFekxOUmhH?=
 =?utf-8?B?a0M1em9oNnZKTGtrelRzdThTNGRuY001aTM0QkhqM0xibi9mdFlGUDBUbGhI?=
 =?utf-8?B?bXpIZlhUYkJ6Y1MxOXJhcEpyaG9ZQnZXMmNtZkxkZTY1cWloaGhodHROc0or?=
 =?utf-8?B?Z0ZuU0NSTnl4ZU9mWTR5Zit1VDF5ZkE0MXF6aGltK3dHUGtKYVdYQU82MU9q?=
 =?utf-8?B?YU5LcHNkZzBJZU1yY1daSnlJTDZZQlRUMlQwcDJ1RWtnbWdPakJ1WEwyNmtQ?=
 =?utf-8?B?cnkwMDF4NGhEVWJHWWJnbDQ0Z3FpSnFldUhJbFR1L05BMVhPam5DUFUyZHE2?=
 =?utf-8?B?LytDclRFT0JWc1BVWlNyYld4N2FRNGVVbk9RVlhkb1FLUm01V3c2Y3gzb1Zk?=
 =?utf-8?B?MmcxM2ZreGJGdmZrQ0Z5LzNwMldnUGJjdjlXeVFPalVJVUZOOS85eWJQWUVK?=
 =?utf-8?B?YjlvaWNjTlFaOTY5V3pWRzh0Q1h4bGRqWWp1RWRTaWtZZW8rUTB1SVN1UlFn?=
 =?utf-8?B?bmpjVDlpcWRmMEVRSUg4WllUTFF2RU5kMXp1VHV2VTRYSWVtbEZkbitFNGFL?=
 =?utf-8?B?VTdiSmQraFJzSUduTFBESEExSFFzRWRmZVJMWmZKSjZlTDJZeGNrSGVsZFNP?=
 =?utf-8?B?clFnUEJEakVScVlEaGp4aXEwVitqRmlnN2VSWGkrT3JtLzk2d0g5VFFsK2Q5?=
 =?utf-8?B?bGNsM2NFUXVVOXRyN3VEQXpybXFtWjVNc1BJUmJIN25vUWh1YjJhSzRKYVlL?=
 =?utf-8?B?azJhdFJFUEVVNW95RUFRbm9oVVdhYjh6cVh3QUtOS1l0Q2V6RS9xMlgvSnNi?=
 =?utf-8?B?NjNEM3hlZXZYRWdKWS9GM3BFbW5VbXd5M1ViWndFWjZ2VGNuaDlnZWxDakUx?=
 =?utf-8?B?YzltRzlUUHY0OWRkYkZqQlJrZFBNQzduSU1kdnRaK3hidWRRN1FBZVhIWW9E?=
 =?utf-8?B?b0Y4NUdYamRKSEVCbWVXcmJUVGVCMURjYlg0dUF5V0Nxa2xVTVNvZXF4b25K?=
 =?utf-8?B?OGJxa0hocHQ0aWZtcWlpTkRqaVpEVnpld3FUbHFUL0RYdFN0L1RCem5lWndm?=
 =?utf-8?B?Wm9FZjJLQ056WC9iRkdCU0JGUGlMTS9ZdDVxQmZnc29SaGNZdTlhTGpLSHVK?=
 =?utf-8?B?cXpmUUFpZXN0ZXVveUxYOFlBZTRCVlFDckt0SVV5TXJQSHo5SDEzdTRPR2NF?=
 =?utf-8?B?TUllSnpzRlV5aFErOTdtcnV4VTZvSmp0QklmcVdiOGJvMEE3dnVDcGRyRFVY?=
 =?utf-8?B?a2NOZTQvL3VnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGVpaWtmaXZjTGZPK3lsbTJhL21lSFBzMFlVRTBSV2ZKd1BUbnVHSFllRWhK?=
 =?utf-8?B?Z0kvQmpUZXM4dTZKcDluWU1ZK24vRUZ1NHJKd3RJZ1A1WU1pTlJGZFlGUXR0?=
 =?utf-8?B?aFMrbDFnVElhdDdPNndENGhnN3c3R2dDWlhQQ01PTkZlb2pGUXE4ZEpiV2FB?=
 =?utf-8?B?UEhGVmMxaXhJY1c1bHhiSXNaNnhqQWFNOCs5SjUwQUwwZVZyVkVmK2JBdG5F?=
 =?utf-8?B?a2Q4K3Q4dVRMMitTbFZBMStoaGcwakk3S2tnYThWczIwL1E1L0pZNlU4WGdP?=
 =?utf-8?B?eWVQVFE2VG8zN2tUb0xoOHVyLzhzSWxobzJ3UVV1MnB4eVh5ZG5tVnd0S2Q3?=
 =?utf-8?B?V1Nka0c3RzFyem44ZjBwVzZrQ01FQUcrbmwxcHBpc1dYQ0xmUHpkNTBFeFhL?=
 =?utf-8?B?Qk1YWmppa1crQ2hiU2drZ0NpcUwyT3NqeFVlYncxdlA1bHFTWllxaElOeUZl?=
 =?utf-8?B?Z2dYT2N6dXVDaEJZWjJDSE1aWm1KVm1Hb2M4alBSVzkvTFhhM2lHUnlQZ3Y1?=
 =?utf-8?B?ZUFjT2Q2bTdlSllBT2dRdWpxN201SWNvbUxNYURJSzFBUDVvRjM4VzE3a2FY?=
 =?utf-8?B?K2tSaENId1JOK3hsTm5MSnBKUTRJSjRwL0hqL1gwTlIvN2ZXRjhOaENnc2FQ?=
 =?utf-8?B?RDlyS1ozNUFaY0p5Z2ZybnNIMHdDaENYbCt2ZllhSzdLalAxRXpCcGtuNU1r?=
 =?utf-8?B?NWVGS1VjTFlOVmcrQ0I0Nld6YXhnS01pMHZUYk5YN1lCcnA5Z2VQWEluVm51?=
 =?utf-8?B?T2dubmtEOUlMclJiMnVBVldVaDVBYXJJY2ZtQ1cvaUlEYXRkZ0ljYSt5SmFq?=
 =?utf-8?B?U1NLVnJNVUdjMFJ0aU5aeEkrcWZPM3BVUW9hcmFXTDFWcE14L3RZU1J6c3NK?=
 =?utf-8?B?a3ZWQm10R2lBbTdBWTBSTGdGemY0cWk3RW96Y2tSM3hjRi82WnJzVm1NZ015?=
 =?utf-8?B?cU9WY2dBNTFLUjBFb2ZadHYreGVQZG0yU1B3YXpGM016Tk1CSmlwNjZsUHE4?=
 =?utf-8?B?ekZWNFJQYkNWWURNaGM3alBlY2JYdXJCdW0xdEllZjdZdHhYdUdVdCtlbU4r?=
 =?utf-8?B?Nk80U3RSZGFrK25yWmY2SU5Vbmp5YTUva2p2RmJNdUI4V0s1SXVNb0JQYS9N?=
 =?utf-8?B?eFlPUE5pTW1UbC93U25xMktuYmFRVTlYcU5RL0NZcjQ3akRyMDFSMWJaWjRN?=
 =?utf-8?B?WGtCakNvMkQvZ1dURDZZbnp0RHF5aytXZ0gxeWpEZkdwRHorcDJIai9hY2lP?=
 =?utf-8?B?eUJvTDN4dGM3dFlnMDdkNmFJbjd3NmtwcW55U3h5U2Vwdml4bkc1c1UySjh4?=
 =?utf-8?B?Qnh1Q2xWR3VhdXhQU0F1U1hxOVQxZEthZndQRFpBYmZ0MG1scm0vNFdweEZr?=
 =?utf-8?B?Z2hYNVVLQlFVbFJGSlAxUjRmWi9tbTB6d3BNenFQUnROejQyTUNTZlVBSi9r?=
 =?utf-8?B?MmdHKy96Ti8vZlZSSUNXVVRLUUdpbFRSK3VETWlYbzU2Y0RXdlpvTGtyWnFm?=
 =?utf-8?B?T1lUT3lvTHFiTmNoRFJYYkxwZFNaZjk3Y2RmbkNIR2pneE1sdGVUdW51cmpE?=
 =?utf-8?B?emdQRW5OTVM1cXIyOFpPYmxPN0lQaW1BOGkyMlBTVUh2RTFhN3VzWC9pc3ZV?=
 =?utf-8?B?cW9QRWhJQUpyME5nbGlya0pIbjJjTDJ2Y21ScWEwNnZycWtYWTV3Wk9GcHVC?=
 =?utf-8?B?UHpvVjVoMUZSaDVCVXI2Rzh2UDA2YVlsV2w3NWFWeGdoRnNQTnVpOHJQS21x?=
 =?utf-8?B?TjdKZjlHWUsxRWVZaSsxNzJWNWdzcFU2QTBUSjFHSHptL2dMR004cURzY0xT?=
 =?utf-8?B?ZmpETlRuc1Z6Y3dGZ1NBQVRoVjM4c3VzNTA2L0xDY3hHb1M5ekhFLzJOU1BJ?=
 =?utf-8?B?MFlvbFUxTDdrTksyTHlyUGp5V3VXNTBzZXlrcTRoZ2g3RGQ5emkxOGQ3dXRp?=
 =?utf-8?B?UWljaGp6Rmp0amVZSW0vRGd3c1p5TGY2QTJ1TjdseFUzSTd6bmoxNU9wbWJj?=
 =?utf-8?B?WlFyWngvY2FNVzRqNTg5NlJmN0QvT09jbmw0WjdPUkFIZXFLRkJrMmpkSVBY?=
 =?utf-8?B?V045MFNpbUJGMFc3anRHMC9JWEdhTWtWblBnRFZuOFRMN2lOQ085bzFkZEUr?=
 =?utf-8?B?UkVRd1U5allSQWZUY2lYeE1KM0p4ZThSWmJoYlN2a3BHNHhUaWh2WkloMTN6?=
 =?utf-8?B?QXEyTnFPTVFhQmlKOW84MGZzMDRCL0s2eEptUTRqYVZzOFMzZHFsTWNmWCtn?=
 =?utf-8?B?YVhYUm1hY2w2RERNK05PU0RlMU96bkwraENwU3lrVVM2QzZsRWs3NjI0aThu?=
 =?utf-8?B?OG40eEw2cy95OFlRbFFiZ0tqQmIrMjQvWEloQ1lwNTBtN1NsaG5JZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2047312-df47-43c5-bf9e-08de407e8f29
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2025 10:49:04.8414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9kikvp54Kgw/raf1xuqwlMXwzHBj9TpAlPVibTTcfGlGe7xa6rwjVy3qCW4YGV1vo4OIOedhgWU+0H9xuT/V2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4846
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



On 12/19/2025 10:12 PM, Michal Wajdeczko wrote:
> 
> 
> On 12/19/2025 5:32 PM, Matt Roper wrote:
>> On Fri, Dec 19, 2025 at 11:04:06AM -0500, Rodrigo Vivi wrote:
>>> On Fri, Dec 19, 2025 at 01:35:14PM +0530, Riana Tauro wrote:
>>>> Xe driver uses configfs functions to expose configuration to userspace.
>>>> If CONFIGFS_FS is built as module (=m) when Xe is built-in (=y),
>>>> undefined reference errors occur.
>>>
>>> Perhaps we don't need  this middle phrase. Only the first and the last.
>>> But anyway, we need the patch in. I just pushed it.
>>>
>>> Thanks,
>>> Rodrigo.
>>>
>>>> Add select CONFIGFS_FS to ensure configfs is built at minimum required
>>>> level.
>>
>> If we make this change, shouldn't we also remove all of the #ifdef logic
>> we have to support running without configfs?
> 
> but is it a good idea to always back select CONFIGFS ?
> maybe the actual fix should be like this:
> 
> -xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
> +
> +ifdef CONFIG_CONFIGFS_FS
> +       xe-y += xe_configfs.o
> +endif
> 

Hi Matt/Michal

This was the first approach i tried. But if CONFIG_CONFIGFS_FS is set to 
m we get undefined references for the configfs functions

drivers/gpu/drm/xe/xe_configfs.o: in function 
`xe_configfs_get_psmi_enabled':
xe_configfs.c:(.text+0x182c): undefined reference to `config_item_put'

  drivers/gpu/drm/xe/xe_configfs.o: in function `xe_configfs_init':
xe_configfs.c:(.init.text+0x24): undefined reference to `config_group_init'

We should either change the header checks to have IS_BUILTIN

or select.

Since there are many other drivers selecting CONFIGFS and this is seen 
in powerpc builds. Sent this as the first patch

drivers/gpio/Kconfig:1979:      select CONFIGFS_FS
drivers/acpi/Kconfig:518:       select CONFIGFS_FS

Thanks
Riana

> 
>>
>>
>> Matt
>>
>>>>
>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202512190827.IeXYj4qg-lkp@intel.com/
>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202512181854.hPyTAXc5-lkp@intel.com/
>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202512190407.CcUFXX2F-lkp@intel.com/
>>>> Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/Kconfig | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>>>> index 4b288eb3f5b0..1094c5fc5bdf 100644
>>>> --- a/drivers/gpu/drm/xe/Kconfig
>>>> +++ b/drivers/gpu/drm/xe/Kconfig
>>>> @@ -46,6 +46,7 @@ config DRM_XE
>>>>   	select WANT_DEV_COREDUMP
>>>>   	select AUXILIARY_BUS
>>>>   	select REGMAP if I2C
>>>> +	select CONFIGFS_FS
>>>>   	help
>>>>   	  Driver for Intel Xe2 series GPUs and later. Experimental support
>>>>   	  for Xe series is also available.
>>>> -- 
>>>> 2.47.1
>>>>
>>
> 

