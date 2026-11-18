Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893C9606A33D
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 12:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j0i32vj/;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=YupkvufY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FB010E7C4;
	Wed, 18 Nov 2026 12:48:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB47810E7C4
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 12:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795006074; x=1826542074;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=FPq+l2DPjZgtbOVUDzg6KCKXYaDKFbUWDHSZf65UBYM=;
 b=j0i32vj/NsTN8Yn7TKp8IBv3tgPtmEhVjO+ysE3EtbIuSnllK8VGaxVq
 MUzAM87fGpE86wJuHujSTKuGFr22g52CPNWOkDieGUnezXb9I8y5kR7ev
 XCjpuSVnmDKFjGRjLtoXUR5TcV/PlqAr+eCcefrLyi1fUd6kXNYJ1k+9B
 om77HGdYN6zI9sfS7kGWUsGZUV3KYq72T3nQjJsT6vJYhVzQvCsY8eRAR
 K1o/0uMhPX1thQWp9gYV95WYSprXuJxz4WSktP+HrdEUE6dG+QB79srN6
 yf0UIiI9Fu1c+48rtzTPiVOTRc+CuQSHLsdp3Vqoxxm07eW1dCtrnVfS8 g==;
X-CSE-ConnectionGUID: bO7jmqBOSxOtBKd3BKmfyQ==
X-CSE-MsgGUID: msdJcSiIRFu1bgF0OzmbIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3804741"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3804741"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 04:47:54 -0800
X-CSE-ConnectionGUID: 8swGfudSRJKR6xOKjoAAbQ==
X-CSE-MsgGUID: cjKKD5z+SGmN4PEJwcCqtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10025792"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 04:47:53 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 04:47:52 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 04:47:52 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 04:47:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WEHq2xE9A8+kVeGxnfsf3V0fLZMW+c1o45SXVNv8GOV5tuZ/GlX76SlMiufHrIDjQv0OphGpXwOL1dwZcZFG8EsoLszAJ2cBglXarV16qqAHPRosOtuYTKMkWVwFMkt4uDfD1Dn+yIIxy8xt6MmKtl7TsMhFv+1CwwHwgC5kvkZW9c/peRNxtG/RaPDTimep22KzUe4F1QvD3HZNEAKEna4+JHEL4HryoL6SVC6ayqsFIkOv5lgLqmYDbVWPXP4Ck/qKdClGw9q9u/20xg+A+X4evmV/SBwK2D3W7PgRTHkx9Gh009LFcTDPBoPUn3THMkfjkIUR4vJNwMdAgRK4DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=glXxZ4OQXBhoN127k0spYTvRvV7k4czMBBVl4JXuvaA=;
 b=LTZcM+TqwnpyNup1B5WR04TyNNHkyMxZ5K9/NK/kgjK4Pv2u2Nd7IG63TF6+TSYHefoq2jfzsr0NmNM0WcvarWpK5IFCFqJ0uUSY+egFTSz5AT6ZHffr+3oTTdNk/FDFsPOA/K673mYMCo6bvH76MqMgHI77QqO4ehfmIAxflIn0awDqbihLX5MTnDnYLmYqNXuGiyMbtFVVohs5I9RVufNCP6UtPCaQWgmnNG/TtCS3Z22zAMNedkIfDiK2Z+fqoda0ZMnCBvCLW6O4Ku4PHzDKqlAMYWe3+6bpAIUB1KgNahyMFsiUeqA9saTeGMXwbRivzkIVIpsdizdFvEyc6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glXxZ4OQXBhoN127k0spYTvRvV7k4czMBBVl4JXuvaA=;
 b=YupkvufYZ/yMDaFY6Idbff5MGNjkvXEyJas9dMfuMDHqL9XwKhkUb/LNyFlAbhEAf69Gz6dIECjwteX/QP72a1N+l0aZKCSvlmqORauB+Lql3AMJhVlfpEDW1LCT3+UzGdKc6422pcCqkIxmIvgBAaLs87ROUEt/vpZhT8Sdm5g=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by CO1PR11MB5186.namprd11.prod.outlook.com (2603:10b6:303:9b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 12:47:43 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c%6]) with mapi id 15.21.0615.012; Wed, 18 Nov 2026
 12:47:43 +0000
Message-ID: <d17d89c3-8d4b-486b-8eb1-c8ca5e2ee307@intel.com>
Date: Wed, 18 Nov 2026 18:17:35 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBncHUvYnVkZHk6?=
 =?UTF-8?Q?_Fix_quadratic_cost_of_range-biased_allocation_=28rev6=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20261117145435.1629839-3-sanjay.kumar.yadav@intel.com>
 <179498430084.41175.14252269461998235222@9ac1b63fe3ea>
Content-Language: en-US
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
In-Reply-To: <179498430084.41175.14252269461998235222@9ac1b63fe3ea>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0205.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::14) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|CO1PR11MB5186:EE_
X-MS-Office365-Filtering-Correlation-Id: 24251363-1565-4906-7699-08df45722348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|261022113327099003|261021123027099003|261021135927099003|10067099003|261022075727099003|5023799004|56012099006|4143699003|11063799006|261026135527099003|261026140227099003|261021133027099003|261022115727099003|261028144727099003|261021121427099003|261026130827099003|261021130227099003|261022105027099003|261026121527099003|261102123227099003|261009223027099003|261009221227099003|18002099003|22082099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: yHjcZDrfLvO1/mr7dIpDKC25JFp7THQk4ci+0ym1zeTGtlhUJxfi4qU0z7NNF3twQbaM0CpAzn1I5XUmBEjtJFZJSG99ox0nVNMjgW+wY8snkRdA4ivH6KSc3s8KVAkv9PoT3dxayj6gA8t/oDUTwHBadgZpzYguel3bJJw6uJeObeSIBaRntA8fwOPyJjwGNmDzyQ+Iy1Q3/W/M2Jq4vhOCfDO5k/MHqJszYnZQ7mnEHf/ci//DGxa0WDH63CvdBViD3+c+yit8vqATZxCRuPBYBjRzgKJRvazHPz8g1pA50VoGzLWkDDa/6zAyOZSo+xfChhpLr7nhOluRQ89UiRFq3+VW1981IoZp5yMT3CkiRk0mOpXHfK5tkfBAImCfusuaMOnmo3C2WKkYoJWebzFJXHYkIgmgYMVTfSTOWhsduTRJpf3N8nCELTofyDT/wh/lbKLGI5z9VfFVVG8o3jeU+9a4aMMLk43Eekuh3eUl7XJ6136/wlGdOthxwyYpUM5KzBN/8KdxHmPcdTD+D8OQvFWW/7NqPJ4EGBjh/eiKPPht1UiDi8iL8Ms6bnWC6B0n44rOzRNaN8pYAyjaUG22742+WnRWfgiTpnI/DCI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(261022113327099003)(261021123027099003)(261021135927099003)(10067099003)(261022075727099003)(5023799004)(56012099006)(4143699003)(11063799006)(261026135527099003)(261026140227099003)(261021133027099003)(261022115727099003)(261028144727099003)(261021121427099003)(261026130827099003)(261021130227099003)(261022105027099003)(261026121527099003)(261102123227099003)(261009223027099003)(261009221227099003)(18002099003)(22082099003)(13003099007)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTdlTGRlYVZiTFZtY0pxTUR2elpxRGI2Y1ZSYWxRL3Y5enRWQ0ZhQWJKekQx?=
 =?utf-8?B?YndwVDd0Ykl0TXdsUmNyTjlUNEN1SFZVSDVpaE0yYjBUSzV0RlpZbCtVSEpi?=
 =?utf-8?B?WDZTK1pzZm1xbTZDR1gweWdjNGg5YytIWHRReDhDUm5Ec0UrVHphS2NaeTVO?=
 =?utf-8?B?N0MzQkpEOUV2dDZCNjh2WkdUaHZsV25EbFp4ZEtSOVhPUjBEYmc3akZmaTBP?=
 =?utf-8?B?MzlSaXJudzlSN2gzSVdiajNKS3ZEVnZiSHZsMGxNTGxnRXZMN01oWEJzbWN0?=
 =?utf-8?B?aHo4K2dNUEx5QkxBK1ZCZzRTSzE5REgzSmZNTFJFb0prUnJxZlkvQWlPRGo3?=
 =?utf-8?B?aXZPa3IzSUVVZXhMNGN1SDFSQzZHVWtBdERYa080b2VOL0FGVmpNb0E1eEFJ?=
 =?utf-8?B?cnlmNUVDTjJsZ1NXRVNMWHg1VkYyYkQwQ2N5YmVad3Zob2VKcTNuNDBsa2x4?=
 =?utf-8?B?a3dXbkJNQWI5ZmcxK2NNOWw2NUlyYlVKU2l6bHViS3QwMW1vRFpBQ043RENK?=
 =?utf-8?B?TmdZMzVyc2hycnhTZy8xNmFWakowNHB1djNIc3hxQmRyV0NmNWJwNWJzR2lZ?=
 =?utf-8?B?Rys0aXl4UHpHVUhTMGtidnRPV0lYTkFyR09EV1BQZUlqZnFVNE1maWkrcUFs?=
 =?utf-8?B?YXR2Mk9hNkFBNktDVExwY1VYRXp6ZXpmcnRxdVgzcENVVFNNSnF5d0RKcGM3?=
 =?utf-8?B?N0U2Nlo0OVZqZDJscUpPRmhSWWFoZXJxOHFRT0xhUURSd0ZRQURLZkd4bGFx?=
 =?utf-8?B?VzAzSmd2dTVYV0Y4TFBucTJuM2t1bkFhdXhyNUVXbWQyL0c2RTlVeVlodnFx?=
 =?utf-8?B?aVZCaEVxZDdPSWF3UDRITlF3OGx4eCtmNDFNZXNZNkk4NGpJZmpxRVhpY3hT?=
 =?utf-8?B?cENRMjNxcmp4ZSsxcGswSStHa1BuWGpJQWx2SWRFVkNmV0tjT1lWYzZYR2Jr?=
 =?utf-8?B?bVdzcGFFY21yR2JSenFQN09UMUljNDVLV2NoMmtMMGJORi8xZTFOSGJqeE52?=
 =?utf-8?B?TlFqZTJsZE5JdDJnaTNKSFV4SitFQTR0WjJ6U2Zsa3NFRlc2aTlRTWtWMnJq?=
 =?utf-8?B?bGtaNHFVSXhRVXFGNmZRMUNMT1dxL3E5cSsvRnh6SFJndDZ3dnNTUWZTci9X?=
 =?utf-8?B?MjNzeDFwUjlpM0ZUd1NGUkJhbXU3cjl5bTJtR0NsbUVzSnBzTmJ6QldkQWtk?=
 =?utf-8?B?RFhSOVFLYklqaENmOTdybkpQNllQWjdNRHliWmlXMXRYVmxYUEx1cTBHWE1z?=
 =?utf-8?B?WlN0K2RrSU1aRHMySXlJczd1cmdBdThSS3ZsWHhkZmRqK3BkbCtWdExUdHVn?=
 =?utf-8?B?MitTcklxUnQ5ZGJwRWlFeUZBNnFmcjdDSWV3YmZsanFFdHJRSWZzWFBpTW1s?=
 =?utf-8?B?NWVJd2d2ZzRRZXExU3dvOUQ4bDd2bkVJUldoeG1wbDZwTE1sOUN0cTgrRGx0?=
 =?utf-8?B?bnNRVXJWQTBIVFR0K3RmK1hjeERJWVVjQkRJV3NrcC9qODB4SHh0cVlZQ1B1?=
 =?utf-8?B?aTNWWmE0WWtSbk5hNUdwbEJtb1l5dHhPSXF5em1PYndGaVBjd2R1dTdrQnFt?=
 =?utf-8?B?QS9FenBxSjBZcnZnT09JYlJKSkxNcy9qUXJwY0p0eFdNTXRHUUpQSk1FanlQ?=
 =?utf-8?B?aEVvb1pNOG5xNGpyWHVTZnRGVWNOYVdGY1VtTUkzeTRNdHFtTXNXRjkzNGpW?=
 =?utf-8?B?dENTWWlPQ2FVN1FXNi9uVTRMR09wUjNSRHY0NkZyL1BGQXQ3U3BLenMzd2hp?=
 =?utf-8?B?Tmg0a2svVFRsdW9mbWpsM0lzSXVVSHJLOXBLZHBWZmpmWnE3K0pnTzVWQ05T?=
 =?utf-8?B?UnBOQnZuMmU0WkdFODMzeGZ1NWdOTHFLamNHcXNsb1hEdUNBUGtsbVRCbzNT?=
 =?utf-8?B?TE9NNEZOR1pvbm1MZkxBQUJ0cU9iTHM5aHQyUUwxVVpyNG9zaEtXSWpnMmZ4?=
 =?utf-8?B?bmt4S2NIdlNyYXBsNmpHdmFSb2hTaW84RzE4UG9TcVlLdlJ5bDRhK1JydEMy?=
 =?utf-8?B?dnI2cHMrTkpoZkk3b3BWRmFPNGRMaGhjekJvMTZUVTdlUGQ3UEdVMHAvZlZ0?=
 =?utf-8?B?NzN0eUt3MjhZNVJSb2ZEaURKd2haTVNpUVM1dDcyNXhoNnllUndHK1hmUnFK?=
 =?utf-8?B?RFBoeTNIUzJ3LzJnWjZqWDZUSktCenFZWVdsWm90eHV5WmNHaFdabHc0aFc1?=
 =?utf-8?B?WDVTMm43cis4OGNTZUZreC9SdDFwM21BejFzQ0tKN0ZoWFNIbU1haXpCeDdh?=
 =?utf-8?B?ajNhSUVRcnBkckw3alRtckU1M0hGMm4ybTUydnEzM3pSUzFNQmYxK1lIWjBF?=
 =?utf-8?B?QWxqKzJFUEhWYjY4WE4vOW5zQmZKNDNUWnhVYk9oSFdScUE3K3lWMU15amhv?=
 =?utf-8?Q?Yn3Lc1ty1SDGF6ec=3D?=
X-Exchange-RoutingPolicyChecked: IsXIMHLdM9zzqHusnT9+HpVpf+WEz/RtweA7QZY97B7bOpY4KvElzn+kvwKaH43q1PPJrr+M3b2V4dfTnh6NeLPLJEvAPMia8G4fTKzR+GUv0LtiwX88s1vAmpFP9D59Eta0saUMYg6z9Atf2EuCGT4LCaMj9VTQg8W/f36VTlwENv+Xni6t9Fgj9Xsjydf5IwtZ3+uP4FfAi+Elv3zA4I1UTQlRojG1qEVAkbKqwA5GHBcQgPPwp/F5wemXdkj4ygmecham8D/azv7CR19CPtJJvrLRsjIrxAyVfCdQgh6VmklwrucyqpDK7RjL/tzTnTjLJeb/gRp9fenHEb7bYQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 24251363-1565-4906-7699-08df45722348
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 12:47:43.4734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRAvJdqoKp98LwjdnYphZ3Fma0eQYNiXu5gEhcHnh7e/keAXJShnN1e+/TrUPZcdwRmmJ0t/vjTURjwsrf0mUv/noosx+KaXZyFEM3dCaxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5186
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
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

failures are unrelated to this patch,

Thanks

On 18-11-2026 12:15, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	gpu/buddy: Fix quadratic cost of range-biased allocation 
> (rev6)
> *URL:* 	https://patchwork.freedesktop.org/series/175945/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/index.html
>
>
>   CI Bug Log - changes from
>   xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7_FULL ->
>   xe-pw-175945v6_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-175945v6_FULL absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-175945v6_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (3 -> 3)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-175945v6_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
>
>       o shard-ptl: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-1/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-4/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html>)
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-ptl-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html>
>         +1 other test fail
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4:
>
>       o shard-bmg: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-4.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-4.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4.html>)
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html>
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4@pipe-b-dp-2-pipe-c-hdmi-a-3:
>
>       o shard-bmg: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4@pipe-b-dp-2-pipe-c-hdmi-a-3.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-4@pipe-b-dp-2-pipe-c-hdmi-a-3.html>)
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4@pipe-b-dp-2-pipe-c-hdmi-a-3.html>
>  *
>
>     igt@xe_pm_residency@gt-c6-freeze:
>
>       o shard-ptl: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-3/igt@xe_pm_residency@gt-c6-freeze.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-4/igt@xe_pm_residency@gt-c6-freeze.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-8/igt@xe_pm_residency@gt-c6-freeze.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-5/igt@xe_pm_residency@gt-c6-freeze.html>)
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-ptl-4/igt@xe_pm_residency@gt-c6-freeze.html>
>         +1 other test incomplete
>
>
>     Known issues
>
> Here are the changes found in xe-pw-175945v6_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@core_hotunplug@hotreplug-lateclose-with-load:
>
>       o shard-bmg: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-9/igt@core_hotunplug@hotreplug-lateclose-with-load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@core_hotunplug@hotreplug-lateclose-with-load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@core_hotunplug@hotreplug-lateclose-with-load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-2/igt@core_hotunplug@hotreplug-lateclose-with-load.html>)
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-9/igt@core_hotunplug@hotreplug-lateclose-with-load.html>
>         (Intel XE#9463
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463>)
>  *
>
>     igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>)
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-dp-1:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-dp-1.html>
>         (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_audio@dp-audio:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_chamelium_audio@dp-audio.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>)
>  *
>
>     igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html>
>         (Intel XE#7358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358>)
>  *
>
>     igt@kms_content_protection@srm@pipe-a-dp-1:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-7/igt@kms_content_protection@srm@pipe-a-dp-1.html>
>         (Intel XE#3304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304>)
>  *
>
>     igt@kms_dsc@dsc-with-output-formats-bigjoiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html>
>         (Intel XE#8265
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-render.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +1
>         other test skip
>  *
>
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (Intel XE#2387
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387> /
>         Intel XE#7429
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429>)
>  *
>
>     igt@kms_psr@pr-cursor-plane-onoff:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_psr@pr-cursor-plane-onoff.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>)
>  *
>
>     igt@xe_compute_preempt@compute-preempt-many-vram:
>
>       o shard-bmg: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-10/igt@xe_compute_preempt@compute-preempt-many-vram.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many-vram.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram.html>)
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram.html>
>         (Intel XE#9279
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9279>) +1
>         other test abort
>  *
>
>     igt@xe_configfs@ctx-restore-mid-bb-invalid:
>
>       o shard-bmg: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-10/igt@xe_configfs@ctx-restore-mid-bb-invalid.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@xe_configfs@ctx-restore-mid-bb-invalid.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-7/igt@xe_configfs@ctx-restore-mid-bb-invalid.html>)
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-6/igt@xe_configfs@ctx-restore-mid-bb-invalid.html>
>         (Intel XE#9463
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463>)
>  *
>
>     igt@xe_exec_fault_mode@many-multi-queue-prefetch:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-prefetch.html>
>         (Intel XE#8374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374>) +1
>         other test skip
>  *
>
>     igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html>
>         (Intel XE#8364
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364>) +2
>         other tests skip
>  *
>
>     igt@xe_multigpu_svm@mgpu-latency-copy-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@xe_multigpu_svm@mgpu-latency-copy-basic.html>
>         (Intel XE#6964
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip:
>
>       o shard-bmg: (FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html>)
>         (Intel XE#3718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718> /
>         Intel XE#6078
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip.html>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2:
>
>       o shard-bmg: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html>)
>         (Intel XE#6078
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html>
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-180:
>
>       o shard-lnl: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-8/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html>)
>         (Intel XE#4760
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-lnl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html>
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:
>
>       o shard-bmg: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-9/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html>)
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html>
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html>
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>
>       o shard-bmg: (FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>)
>         (Intel XE#7809
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>  *
>
>     igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>
>       o shard-bmg: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-9/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html>)
>         (Intel XE#5408
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408> /
>         Intel XE#6266
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html>
>  *
>
>     igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a3:
>
>       o shard-bmg: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a3.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-2/igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a3.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-10/igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a3.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-7/igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a3.html>)
>         (Intel XE#3098
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098> /
>         Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-5/igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a3.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank:
>
>       o shard-lnl: (FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html>)
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
>         Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html>
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>
>       o shard-lnl: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html>)
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html>
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>
>       o shard-lnl: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html>)
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
>         Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html>
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o shard-bmg: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@kms_hdr@invalid-hdr.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-6/igt@kms_hdr@invalid-hdr.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-5/igt@kms_hdr@invalid-hdr.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@kms_hdr@invalid-hdr.html>)
>         (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-6/igt@kms_hdr@invalid-hdr.html>
>  *
>
>     igt@kms_hdr@static-toggle-suspend:
>
>       o shard-bmg: (INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-7/igt@kms_hdr@static-toggle-suspend.html>,
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@kms_hdr@static-toggle-suspend.html>)
>         (Intel XE#9792
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9792>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_hdr@static-toggle-suspend.html>
>  *
>
>     igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2-xrgb16161616f:
>
>       o shard-bmg: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2-xrgb16161616f.html>,
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-4/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2-xrgb16161616f.html>)
>         (Intel XE#9792
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9792>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2-xrgb16161616f.html>
>  *
>
>     igt@kms_vrr@flip-basic:
>
>       o shard-ptl: (FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-6/igt@kms_vrr@flip-basic.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-1/igt@kms_vrr@flip-basic.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-2/igt@kms_vrr@flip-basic.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-7/igt@kms_vrr@flip-basic.html>)
>         (Intel XE#4227
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227> /
>         Intel XE#7397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-ptl-5/igt@kms_vrr@flip-basic.html>
>         +1 other test pass
>  *
>
>     igt@kms_vrr@flip-suspend@pipe-a-edp-1:
>
>       o shard-ptl: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-7/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-2/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html>)
>         (Intel XE#4227
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227> /
>         Intel XE#7397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-ptl-1/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html>
>         +1 other test pass
>  *
>
>     igt@xe_exec_fault_mode@atomic-many:
>
>       o shard-bmg: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-2/igt@xe_exec_fault_mode@atomic-many.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-7/igt@xe_exec_fault_mode@atomic-many.html>)
>         (Intel XE#8578
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-10/igt@xe_exec_fault_mode@atomic-many.html>
>  *
>
>     igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
>
>       o shard-lnl: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-2/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-5/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-3/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html>)
>         (Intel XE#7850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-lnl-6/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html>
>  *
>
>     igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
>
>       o shard-bmg: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-10/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html>)
>         (Intel XE#9463
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html>
>  *
>
>     igt@xe_oa@non-zero-reason:
>
>       o shard-bmg: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@xe_oa@non-zero-reason.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-9/igt@xe_oa@non-zero-reason.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-5/igt@xe_oa@non-zero-reason.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@xe_oa@non-zero-reason.html>)
>         (Intel XE#7334
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-3/igt@xe_oa@non-zero-reason.html>
>         +1 other test pass
>  *
>
>     igt@xe_pm@s4-basic-exec:
>
>       o shard-ptl: (ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-4/igt@xe_pm@s4-basic-exec.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-1/igt@xe_pm@s4-basic-exec.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-7/igt@xe_pm@s4-basic-exec.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-3/igt@xe_pm@s4-basic-exec.html>)
>         (Intel XE#9362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-ptl-1/igt@xe_pm@s4-basic-exec.html>
>         +1 other test pass
>       o shard-lnl: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-2/igt@xe_pm@s4-basic-exec.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-3/igt@xe_pm@s4-basic-exec.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-8/igt@xe_pm@s4-basic-exec.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-6/igt@xe_pm@s4-basic-exec.html>)
>         (Intel XE#9476
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9476>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-lnl-5/igt@xe_pm@s4-basic-exec.html>
>  *
>
>     igt@xe_pm@s4-vm-bind-userptr:
>
>       o shard-lnl: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-6/igt@xe_pm@s4-vm-bind-userptr.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-5/igt@xe_pm@s4-vm-bind-userptr.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-4/igt@xe_pm@s4-vm-bind-userptr.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-1/igt@xe_pm@s4-vm-bind-userptr.html>)
>         (Intel XE#9362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html>
>         +2 other tests pass
>
>
>         Warnings
>
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-bmg: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>)
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426> /
>         Intel XE#2509
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509> /
>         Intel XE#5848
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848> /
>         Intel XE#7437
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426> /
>         Intel XE#5848
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848>)
>  *
>
>     igt@xe_pm@s4-mocs:
>
>       o shard-ptl: (ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-3/igt@xe_pm@s4-mocs.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-2/igt@xe_pm@s4-mocs.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-8/igt@xe_pm@s4-mocs.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-7/igt@xe_pm@s4-mocs.html>)
>         (Intel XE#9362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-ptl-4/igt@xe_pm@s4-mocs.html>
>         (Intel XE#7727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727>)
>  *
>
>     igt@xe_pm_residency@gt-c6-freeze@gt0:
>
>       o shard-bmg: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt0.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt0.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@xe_pm_residency@gt-c6-freeze@gt0.html>)
>         (Intel XE#9254
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt0.html>
>         (Intel XE#9254
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254>) +1
>         other test fail
>
>
>     Build changes
>
>   * Linux: xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7 ->
>     xe-pw-175945v6
>
> IGT_9196: 9196
> xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7: 
> 1bcf6d6c4e900492a190123010854ee3e5f6a6c7
> xe-pw-175945v6: 175945v6
>
