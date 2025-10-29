Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE856CCF9F2
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 08:15:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF5010E720;
	Wed, 29 Oct 2025 08:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m4yGUW9N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB91610E720
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 08:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761725708; x=1793261708;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fELSx6Di4m4xX+FclMqw842uk7QGlJMzU6luFk+eOo0=;
 b=m4yGUW9NFPd0V9oF2+ANNnfvoPSh+6jZNgSA+hw0lHIBZyDEIzXKyYF4
 +l4/vgov7ErdVMs9Xf91+ptEYG+jDf/qUV4QdYrhcH2co7JS6dzEQFVMD
 I2TA8B3vEP073n5kf89AQNWvl/Nmp4v6pHCdbEhv/HXLApw91beSzk+tu
 KYbLw67PayelKAkAIktCMUbXrHklZgy5dJyBR3tgS2p5rVdRlzmG0yW7E
 tRclxPHqdWFmc2hmzHXWZzji2P1yyeo2BNU1f9LybeY+LcGh0mWRrU7BC
 Tc7kmsYscCsAe/viSwZW8bOn9KQZOjXkKrDqn3oTbw0h9M96yytbKA20G A==;
X-CSE-ConnectionGUID: DtbHHHI6R7qwI7+cLV+Ifw==
X-CSE-MsgGUID: ZoB4Uc5oRH62Bwk7/1ib7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63874321"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="63874321"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 01:15:08 -0700
X-CSE-ConnectionGUID: HKMYnQ3QQi2wV59Gjk/gkg==
X-CSE-MsgGUID: S97gE6rsSFGOA+AbwfZR0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="184829575"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 01:15:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 01:15:07 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 01:15:07 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 01:15:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIi44tEvGPmgNqQcq0HTitNzZ1cZYSHSQH87hSCtm701Ps3DWMibdRcW/YsuZdJVxg+AfMqohMTkgXYxzBcso7xx7MRtLCZOdBSRJKMIz2sHYz2W0xi03Cbtag8/cuURhmD1F6tyHET0rCc+0toCw7Gj3od97aEW6KrAmSx5VZg5kmWAs8YzujGL2SPzUdIJl/8fmel3zyFqNvqYvtI7LfkbK9ivaKjBIOgD2TqKi10BEv58HkGMII61ZYZ2ijYMW83rWqE/tbxCaz85C14/QOSef6MRabYRqwHaLMdpyiEhpiKRhe/y85HDmj6iEhS+qwAjkqojpmE3zB+XWhQLBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6M6Otjd8o6uVjom4aOKKUxzBTXhBxGvlhz1VQ5DFq8=;
 b=dwveQ0RZhWe5P8JjsLEPhVZZpPHfQ7Fu8HhhlQn87IKSMm+lvSE+U8YLgNFr9jmwZnkWm7Q8bg9zWxjICFVBLSbK8XmhrH187hO+k5az1migz55fWHfdQFgB0WtVGtBF0gw+CfXT9t6Q0OwXUP6Z8LSi/G9cYzUNbQDxsXTLf3IBWUZT6uhpCSevMzI6JH5nka1OsZQ8Xx9eEsWu2vDD8JdlKYjsO66kHKb2RLNXdW5dH9B+jqRv8KfHVsTRHyzXOLAqWVgdATo47T3IHg+X1cdlL4sDqo7eoSyBE521owpCuYNO8rpxtsifSlZAfLtW6s25+DmFuvKPJdvkyg7yKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW5PR11MB5787.namprd11.prod.outlook.com (2603:10b6:303:192::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 08:15:04 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 08:15:03 +0000
Message-ID: <cdae237e-a4d7-4053-8b37-2164a1b2ea31@intel.com>
Date: Wed, 29 Oct 2025 09:14:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Allow to lock/unlock the PF
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Nareshkumar Gollakoti
 <naresh.kumar.g@intel.com>, Christoph Manszewski
 <christoph.manszewski@intel.com>, Maciej Patelczyk
 <maciej.patelczyk@intel.com>
References: <20251028200521.184592-1-michal.wajdeczko@intel.com>
 <aQFuXW5WUeUu1f6r@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aQFuXW5WUeUu1f6r@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0104.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::45) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW5PR11MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: 06f8ee46-4954-44cc-d8a7-08de16c34342
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bW44eS9XQWNTRFgxZWhvT3pobXBMQ0VyU3c2RjlQZ2E3THRMNStwdEFUR1dk?=
 =?utf-8?B?QmtadUEvVUkxbUNsOEV3N2dFRmw4ZVZwVi9xcHpaejNNNVRwWWMxTXozNUhq?=
 =?utf-8?B?VDl0TFcrVDlqaWFEZVpubUFldDNJYVhhSVV2ci9yTEo2dk16MzIwRlp6Vmlx?=
 =?utf-8?B?U2t5eWFZVk9qUy9zUnBIcjZ0Ymx2N2QwZmxBOEpTQjFiVGZKaWVINmxxUGF1?=
 =?utf-8?B?aG56RExTcTFSSHlSOWRFQUVXRTRTOGEyVHJVR0UrOFRwUE8wS3dHSDAzMGRz?=
 =?utf-8?B?UzRxMTlYRGcvcXEvZWNySklSeUtpRlBpNHBkc3ZPNUVESlRXNjR4SmcyVmhr?=
 =?utf-8?B?SGZoeWEzSm9RY3NQWXduU28yUHc0N1oyWjVQREJ3QWxKZkRMU3BwSmVXR3NF?=
 =?utf-8?B?UlhPZXhBVU1WL29JRUI3aHhWcG5wL2s5OS80MTJjdHJwN3pYVW02L2lENUZ6?=
 =?utf-8?B?ZFltb0R0Q3dGWGVMaXZGWHQ1N1FObGxhUTZnSVhrdGNQdU92SGRHL201Wm9G?=
 =?utf-8?B?aEp3Qmdjc2FXVThSakZpTGNzRkM5cFV4VXJLenRYQTVSK2dwYmd0T05TVmhD?=
 =?utf-8?B?VDNyVHg2VkxmaFdXVmo3U2R6cmY0ay95bUY1UVoxTHFtYnZVbjlwazlDeXBj?=
 =?utf-8?B?SDZkdytUK2V1VXdxR1NBS2o3b21VS0owVFp4ZVZVNUkvblROVjMvYTNobkM0?=
 =?utf-8?B?OS80am45TXR6dkFkbTdMbHR1M3M4VHVXSk9jZnFQQ1BEbHNSSXhWRDV4bnl0?=
 =?utf-8?B?YnpqdWYyUTVyL0wxaEZmNTh3eWthdEM0SjQwZlF2RitkeTdsWW44NFhjNzhR?=
 =?utf-8?B?MmFUcDFDNjZYSUJ2Z09CdFVxaUp0bzBvb2ZRTHNiaW5EZXNzdVY3WnZYeGtC?=
 =?utf-8?B?YkEwUlFUWURRY3RCNnNaZHJ4eWh2aEFMdERSMHRlTDF0RmtPREZUMW4rS0gv?=
 =?utf-8?B?NnZIMXV4UGUxdUtyTzB0ZExGbjRmTDJwd1lTS2lGYXNPNGYzQUsxZ3l4THZa?=
 =?utf-8?B?VUVKbW1WVWFkY3ZFMks2NVZteExWOUZ6N0toNWNXSE1ZdHUvdXFyZFdkdytF?=
 =?utf-8?B?bWZYK1JsV01LVlI0QjIva242WVh2OEt0Z1BLOTFHNDdVcU9xLzV4M2o2S05I?=
 =?utf-8?B?enhuRmlOc2RmNWRLWjVrV1ExL1pYQVhvK1FrOHM1Rk91TUVUNU1JMW9hLzN3?=
 =?utf-8?B?L0EyV0VIK1BlUm1XRWliNlZNbVFLUXNRL0U3NjJBYXd4Q0U3UjhCWlVoSnZP?=
 =?utf-8?B?dm1GWm1pMm03RS9QcnlOcEdiUWU4aHFSL0dnb29XN242UmY1bHBiYldhODZL?=
 =?utf-8?B?VFdOL2ZHM25VWlpVeEpoTU56Y1FjWURQSFNlT1ZpYzk3TER3MnkzZnJxQ2ZV?=
 =?utf-8?B?VURyM3F1WWZvSlU3RHYwM1FNWVhSdTVTVWMwN3hmdFUvaEJodVBDQ05pWHRi?=
 =?utf-8?B?RzJ4N0FmeGczSGIwcWFZMUI3Q3ZEZ3VWdUpCdXZvaXE0ZmhlZ3M4VkhYRXNa?=
 =?utf-8?B?Q1UyVU96NEN3WXA1SzJuWWd4byt5cEhVMUZ3WnFhNUV2Y2p1OGFXQjVzSUpB?=
 =?utf-8?B?NWZGYlF1YlhyTzFaMGNoRHBxOUNvSDhHVDBWRW83L3BXekorSFo1SHNSSDJq?=
 =?utf-8?B?MVpsRXBrNlVvMjhKdHd1MHZlTTFLdnhsSlljM00wRGY4eVFtZmpPVHdVZTc4?=
 =?utf-8?B?czFYYmdIblJwcUtYV0R3d0Fib0w4S3duTCtabFJZaEFUUTByZE1FU2M2Zjc5?=
 =?utf-8?B?RDdwQ3o5YkNMK3lReWRZZy9PdnM4Nk11bGR1QUdGbE9HQ0E4bXExY3FGMHp3?=
 =?utf-8?B?enpDM3RVdjhCVDI1aTI0S3N6ZzZKVXpKTFI1RXRxTm82TG5JNWREbTV0ZXRT?=
 =?utf-8?B?ZGpzeUhUem9UdzJkZ3VPd1p1cDkxTE50bmFoL3dqLzZyaHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2xza1lZalZ4WU9ROUpVTUx0K3FBT1dibnduUzlWcytSM2hHOVFOTi8xaDVj?=
 =?utf-8?B?ZnZqRTZJRUQ2QmpsbFVWUWFpQVdhTmZiNTlrZ2FkSENhNFhiMGs1MmdLanRE?=
 =?utf-8?B?M1U2L296ZTJDMlh0bVNLZWNkdEhoRzlaZFNrZnNubWV0UzB5WUlOc2hoNU45?=
 =?utf-8?B?ZkZodFV0ZnFKaE9RY3B6Mzd2MGQyeUZQNVRUM0ZNOFJybmpMNHM5bld4bE05?=
 =?utf-8?B?RWEzdFkreE94OThiZ3FiSnhrUzVqL2pzT2l0UnVDcU1vanNWVUorUlVBM0t4?=
 =?utf-8?B?TW96eGw2UlZad0ZjYzBIb1NTa3lkWkt6b1hmOXZoNk1rSnZxWi9CaDh6Uzk3?=
 =?utf-8?B?eE9MQ0FHaFJnL2dkM3o5K2RYK2xLcHR1c3B4cXBac244M1RFY2w1aG5JbDUv?=
 =?utf-8?B?SUlmS0YrWDZpdGFMemxNUjVVWEh5V0UrL0xBWkRhemxVWk5ka1M1dEtQOEdj?=
 =?utf-8?B?R0FBRC83RHMwTTAyTXIra0doWm1JYjgzODduWG5UTVRHL1FoK3VIdmZpR1lJ?=
 =?utf-8?B?UVVLUGxPRkJMWkRnRjIrNzczdUk4VXdJMWdRbFNwcklweDY4OXhFQVNVSFpK?=
 =?utf-8?B?MU5ZR213N3kwRkwwQitTc29IWGNwZk1PTStEamE1UlJxZE05Y1BPWG8yT0hs?=
 =?utf-8?B?SnpvZTVZYXpUSTkwbUxjdU43TGFIV1pWTHFQR2haZkpRS3hGVFV2akNnaUg5?=
 =?utf-8?B?ZGdzK3lnNmNYSkd5aE01ZUl6YmFCMkdVQldUMWh5RXN4T1k1dXZrSTBqUjZa?=
 =?utf-8?B?VEhhcnBYL3R6TGVsbzF1eTArWkZDT1V1Y05mV3hYemxGNHpicmk3eTRoNFFQ?=
 =?utf-8?B?RnpIOWJEbUloK09nb2lUY2s5TG1pays0V3ZYMjBVa1BVMlR6YklqWXFPdzZB?=
 =?utf-8?B?amIwdlJ4eTBmakJBWjc3d3d2YXZjVlpMVFBhc3ZmTTgyVHZkUnptUHhnbGtj?=
 =?utf-8?B?TG9SRnZ0a2Znb0JLS3JiWGxBbXJhSnJiUFp0L0VqbHJDbE1POTg0UDFHZDVY?=
 =?utf-8?B?OEpBTFlmTUxwVXEzT0hVQWhSSEJKdTZXbTdEbHJ2NjBUNkF6NVA5UjF5OE02?=
 =?utf-8?B?bXFOUk5BczZNcFQrVmlXT3JZYTM2MmRQTWVTLzA0OWt6aDBJaERkYVdZQS9D?=
 =?utf-8?B?YXg2T3Vnd2daUHhheXczN20rSVducHIyaE5tekFJeUU1UjVSdjc3YzJtVFIz?=
 =?utf-8?B?emhUVU5OdUUxMXd6UUtOUFZxNXdhaTVkWUZ4MDNScEFjMUgrNWJaRUNSSHBG?=
 =?utf-8?B?WWFnMGFRbmllL25pVklZUUU2RzkxTGV4Tkk0MEhIL3JuYkJYMEgzQkhQZGZw?=
 =?utf-8?B?ZjE1dlBuendaQlJMWFZ0RjhnbjBHZU9OOEVONmkwRThlTGxvbEdNcDBJUkFn?=
 =?utf-8?B?K2dna09JTmQ0TVR0UDlZcGhIVnFOT2lVdjIwbEFKa0g1SmhPQ3pNQUdCQUVl?=
 =?utf-8?B?TUJRSU8yMHVnK3R4Z3FHcjFqekhvZitWRTRDSHltUUhmbmVyNk1uVlVuZnVE?=
 =?utf-8?B?NG8xRXRoWVd3aFlUSTNUOEplVTk0OGtPZUFtQUh1NEk5WmNkM2xBT3VocHZQ?=
 =?utf-8?B?aW9SZkhRSGpqVytyT0hqUHhWSXRsQTlMYU5kbmpVeHdxTGsyL2xUQWxRUHho?=
 =?utf-8?B?Tk0vMzdjZW5tZjAyL3BMNlFWQS8yUW5rZE0xZ2pWNnIrbXgxWWZwWXFTUVg4?=
 =?utf-8?B?cnJubkdOYWhRQ2d1R1NPYy9xMWpOT2FoQ1oyU00vQ0ZVUWJLSXdyWWp1M0pT?=
 =?utf-8?B?WWZ1MmhYY3hMbWtKYm15Yk9aU1owaVI4WG5qTytHOWRESWFZcXhqbmpROUlV?=
 =?utf-8?B?bGVQTUs3TjIzWUx5bkl3NmV3b1pRQWRwQU9ORDM4MVhWSjlhVUpFQVFJS1FU?=
 =?utf-8?B?THFkQURUQUduVk1TQm85b05xVHZXNzE1SkplbW5Tc0o0NHlyRGc3Rk9UeTRO?=
 =?utf-8?B?UWNDSkdOalo2azlpaTRoQUF4eTRBeDdSVWdMWXhPSlBHUHZoWVRaSUoyaENL?=
 =?utf-8?B?RTZVZWluQU13aTRQOGVzSi9KNHdjRjVCVDV2bWszTCs1ZHRJdEhoVnJYRlBQ?=
 =?utf-8?B?QS9lTFozNTFvMkxFclAreXpFeGtvYWNWVVRPODkrL1pGN3FnUGh3T0F0ckZM?=
 =?utf-8?B?VFRrR3J6OEo1VHU0bUwwV1FsUnF2andSN1pmU1dwWm9oL2ZGRUlYMUVnNC9w?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f8ee46-4954-44cc-d8a7-08de16c34342
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 08:15:03.8580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YbV2KN7vLT8Py47dQOjFLkAhMHYTHbS/v/yVNHTxzW/RHzjOaPpp08srLeIXS9FpXOZDsU0B7vtLRXi0AQdqZJpiaCsaBgQV0sMDAmhHGL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5787
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



On 10/29/2025 2:31 AM, Matthew Brost wrote:
> On Tue, Oct 28, 2025 at 09:05:21PM +0100, Michal Wajdeczko wrote:
>> Some driver functionalities, like eudebug or ccs-mode, can't
>> be used when VFs are enabled.  Add functions to allow locking
>> the PF functionality for exclusive usage (either for enabling
>> VFs or to enable those other features, or simply for testing).
>> Add also debugfs attributes to explicitly call those functions
>> if needed.
>>
> 
> Hmm, I'm not sure about this. Why not just lock the SR-IOV master mutex
> in pf_enable_vfs? If the reason is that lockdep blows up — for example,
> if the master mutex is annotated with __reclaim and pf_enable_vfs
> allocates memory — then you still have a potential deadlock; you've just
> silenced lockdep. I'm not certain that's the case, just using it as an
> example.
> 
> Given that, I'd lean toward saying no — this really, really looks
> unsafe. If you'd like, get a second opinion from a locking expert (e.g.,
> Thomas), but I think this is a no from me.

looks that more background info is needed here

this "lock/unlock" is not to protect any PF structures/data, as for this
we have master_mutex, but to allow other components, like mentioned
above eudebug & ccs-mode, to block PF from enabling VFs while that other
feature is running or making incompatible with VFs changes, see [1] [2]

in this patch, the PF is trying to "lock" itself when enabling VFs.
if other component (or here debugfs) already locked the PF, then PF will
not enable any VFs, thus will not break this any other feature.

it is expected that other components, will follow the same flow, so they
will first start with pf_try_lock and then either abort it's enabling, as
PF is already running, or call pf_unlock when they are done.

however there is one open that we might need to solve: what if there are
more such non-PF compatible features that would like to run in parallel

with this trivial approach, only eudebug or ccs-mode will be able to run

if that's not sufficient, then we can switch to use rw_semaphore, or
maybe, if that would be cleaner/safer, use that from the beginning ?

then we will have:

components:
	xe_sriov_pf_try_lock		--> down_read_trylock
	xe_sriov_pf_unlock		--> up_read

PF internals:
	__xe_sriov_pf_try_lock(write)	--> down_write_trylock
	__xe_sriov_pf_unblock(write)	--> up_write

[1] https://patchwork.freedesktop.org/patch/667725/?series=152682&rev=1
[2] https://patchwork.freedesktop.org/patch/681266/?series=154538&rev=6

> 
> Matt
> 
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
>> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
>> Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_pci_sriov.c        |  7 +++++
>>  drivers/gpu/drm/xe/xe_sriov_pf.c         | 38 ++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_sriov_pf.h         |  4 +++
>>  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c | 15 ++++++++++
>>  drivers/gpu/drm/xe/xe_sriov_pf_types.h   |  3 ++
>>  5 files changed, 67 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
>> index 735f51effc7a..e1d34860b064 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
>> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
>> @@ -120,6 +120,10 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>>  	if (err)
>>  		goto out;
>>  
>> +	err = xe_sriov_pf_try_lock(xe);
>> +	if (err)
>> +		goto out;
>> +
>>  	/*
>>  	 * We must hold additional reference to the runtime PM to keep PF in D0
>>  	 * during VFs lifetime, as our VFs do not implement the PM capability.
>> @@ -157,6 +161,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>>  failed:
>>  	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
>>  	xe_pm_runtime_put(xe);
>> +	xe_sriov_pf_unlock(xe);
>>  out:
>>  	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
>>  			num_vfs, str_plural(num_vfs), ERR_PTR(err));
>> @@ -186,6 +191,8 @@ static int pf_disable_vfs(struct xe_device *xe)
>>  	/* not needed anymore - see pf_enable_vfs() */
>>  	xe_pm_runtime_put(xe);
>>  
>> +	xe_sriov_pf_unlock(xe);
>> +
>>  	xe_sriov_info(xe, "Disabled %u VF%s\n", num_vfs, str_plural(num_vfs));
>>  	return 0;
>>  }
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
>> index bc1ab9ee31d9..8cdd25db2cf9 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
>> @@ -157,6 +157,44 @@ int xe_sriov_pf_wait_ready(struct xe_device *xe)
>>  	return 0;
>>  }
>>  
>> +/**
>> + * xe_sriov_pf_try_lock() - Try to lock the PF.
>> + * @xe: the PF &xe_device
>> + *
>> + * This function can only be called on PF.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_sriov_pf_try_lock(struct xe_device *xe)
>> +{
>> +	guard(mutex)(xe_sriov_pf_master_mutex(xe));
>> +
>> +	if (xe->sriov.pf.owner) {
>> +		xe_sriov_dbg(xe, "already locked by %ps\n", xe->sriov.pf.owner);
>> +		return -EBUSY;
>> +	}
>> +
>> +	xe->sriov.pf.owner = __builtin_return_address(0);
>> +	xe_sriov_dbg_verbose(xe, "locked by %ps\n", xe->sriov.pf.owner);
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * xe_sriov_pf_unlock() - Unlock the PF.
>> + * @xe: the PF &xe_device
>> + *
>> + * This function can only be called on PF.
>> + */
>> +void xe_sriov_pf_unlock(struct xe_device *xe)
>> +{
>> +	guard(mutex)(xe_sriov_pf_master_mutex(xe));
>> +
>> +	xe_assert(xe, xe->sriov.pf.owner);
>> +	xe_sriov_dbg_verbose(xe, "unlocked by %ps\n", __builtin_return_address(0));
>> +	xe->sriov.pf.owner = NULL;
>> +}
>> +
>>  /**
>>   * xe_sriov_pf_print_vfs_summary - Print SR-IOV PF information.
>>   * @xe: the &xe_device to print info from
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.h b/drivers/gpu/drm/xe/xe_sriov_pf.h
>> index cba3fde9581f..2261596bb4fe 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_pf.h
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
>> @@ -17,11 +17,15 @@ bool xe_sriov_pf_readiness(struct xe_device *xe);
>>  int xe_sriov_pf_init_early(struct xe_device *xe);
>>  int xe_sriov_pf_init_late(struct xe_device *xe);
>>  int xe_sriov_pf_wait_ready(struct xe_device *xe);
>> +int xe_sriov_pf_try_lock(struct xe_device *xe);
>> +void xe_sriov_pf_unlock(struct xe_device *xe);
>>  void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p);
>>  #else
>>  static inline bool xe_sriov_pf_readiness(struct xe_device *xe) { return false; }
>>  static inline int xe_sriov_pf_init_early(struct xe_device *xe) { return 0; }
>>  static inline int xe_sriov_pf_init_late(struct xe_device *xe) { return 0; }
>> +int xe_sriov_pf_try_lock(struct xe_device *xe) { return 0; }
>> +void xe_sriov_pf_unlock(struct xe_device *xe) { }
>>  #endif
>>  
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
>> index a81aa05c5532..7c011462244d 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
>> @@ -96,12 +96,27 @@ static inline int xe_sriov_pf_restore_auto_provisioning(struct xe_device *xe)
>>  	return xe_sriov_pf_provision_set_mode(xe, XE_SRIOV_PROVISIONING_MODE_AUTO);
>>  }
>>  
>> +static inline int xe_sriov_pf_try_lock_pf(struct xe_device *xe)
>> +{
>> +	return xe_sriov_pf_try_lock(xe);
>> +}
>> +
>> +static inline int xe_sriov_pf_force_unlock_pf(struct xe_device *xe)
>> +{
>> +	xe_sriov_pf_unlock(xe);
>> +	return 0;
>> +}
>> +
>>  DEFINE_SRIOV_ATTRIBUTE(restore_auto_provisioning);
>> +DEFINE_SRIOV_ATTRIBUTE(try_lock_pf);
>> +DEFINE_SRIOV_ATTRIBUTE(force_unlock_pf);
>>  
>>  static void pf_populate_root(struct xe_device *xe, struct dentry *dent)
>>  {
>>  	debugfs_create_file("restore_auto_provisioning", 0200, dent, xe,
>>  			    &restore_auto_provisioning_fops);
>> +	debugfs_create_file("try_lock_pf", 0200, dent, xe, &try_lock_pf_fops);
>> +	debugfs_create_file("force_unlock_pf", 0200, dent, xe, &force_unlock_pf_fops);
>>  }
>>  
>>  static int simple_show(struct seq_file *m, void *data)
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
>> index c753cd59aed2..91da3c979922 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
>> @@ -36,6 +36,9 @@ struct xe_device_pf {
>>  	/** @master_lock: protects all VFs configurations across GTs */
>>  	struct mutex master_lock;
>>  
>> +	/** @owner: the RET_IP of the owner who locked the PF */
>> +	void *owner;
>> +
>>  	/** @provision: device level provisioning data. */
>>  	struct xe_sriov_pf_provision provision;
>>  
>> -- 
>> 2.47.1
>>

