Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CF4CEB2D2
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 00:59:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7439710E5B0;
	Tue,  1 Oct 2024 00:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GyX0z7LH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BDB10E5B0
 for <Intel-Xe@lists.freedesktop.org>; Tue,  1 Oct 2024 00:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727744391; x=1759280391;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=W8ahWlNeatoPntwvWPgT8bW+j+TfHyo1D37+LNhy13k=;
 b=GyX0z7LHIeciYzvoPy/SwM4u3uypBneHOEgoEp5GSvn8AAJmNtBBjug0
 89888SCOudXJhvyHMZhSejAYWkJHIsXSyDenP6d7km6MCVH6XlXyrJ6q/
 /9zdmOvLcwzpHdaEtqjPhtje11CmJ+meOzIUX91u3/Y3bprKc2zcRcbud
 ANKjq9uGhWvHVxijmRc0be2iQTOeujbk/fse/CtfSWrKQlJtdynL8vyu9
 KNfp8WqRG8K6DmJWSjjW4KcEy4z3ys/hkSW+3u+ndnB7mCCYMrPvXDwcS
 +CZsgTdQwmc6XHZAVWQAd/7y9rnFVv2xCaFYMri/7+FB4mDlELSclDfGj A==;
X-CSE-ConnectionGUID: vVkZxNLtSnmEjGZaV7INOQ==
X-CSE-MsgGUID: 3WbaNkRDRYypDo71SMJvHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26736461"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="26736461"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 17:59:51 -0700
X-CSE-ConnectionGUID: +hVIME2RQBOmAYIr5gkV1g==
X-CSE-MsgGUID: lDHyDnnTR6KXJo3bwd05mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="73527723"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 17:59:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 17:59:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 17:59:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 17:59:50 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 17:59:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPvzBSN+3mMfahya4JU6rj1SSN0ZpuqpO8v8arADf4ftmxEiY6uvkF/A94z9gNP0KFN8izEUEwN094bVuh5M6rtH55wOS59gVKbb6qEsia6RzV6RRqiNLldLvDV+e6/v7WBosu5R9+wNbvcWZBYP8HDDAV7ZxD/M51eMyv9eDw8Wnh6qbdANR2EoBcEyZL1lMDMYqFAdrM4rdbt9CwLS9TfUZaqbrsBUQJVR71sFurptw+t2gefyAmfGMPTc2NzeFnS+cZ8hI5SZmXmdKAyVMoKkXaM73B1HU4DxVTNABKirONWxFS74vAIArp25jMsWXsdpC/F1k3wo07d6UUdXkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8ahWlNeatoPntwvWPgT8bW+j+TfHyo1D37+LNhy13k=;
 b=mhj7RIVajOcZ0Weevkx/jW7dxkujmQqMd/L8U7J7svo64fLrX0/u4qYlejb0DypPpw/etPObS571kUZWo7sA8uPUkQ/zSmeySrtzo+EzIQcbq+gmRodBi1rAW3rkQYCsQJkpDuKM5sW3/HOF2dvjDoT8mprvxQODYLl/CkGXFBvRO2o+xa7+rpWm24eRW9x2izFJFwENX9J+jmgR7/WzWIEPKlO4wmg5rzZbIppODguoSZDwU9K86uXNEMp2+4h+o1vH6GLn8Gc4Xn13pyayz1C+mpwbqg8cJ/pOELLKnSkrPv37SLiFyXEaH+VY+rENrZVqMxHwtXKu4J8EGEWm0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by MN0PR11MB6010.namprd11.prod.outlook.com (2603:10b6:208:371::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 00:59:48 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%5]) with mapi id 15.20.8005.020; Tue, 1 Oct 2024
 00:59:48 +0000
Message-ID: <b35cd0c8-c58e-4d75-a84d-bbdbaaa60fda@intel.com>
Date: Mon, 30 Sep 2024 17:59:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/11] drm/xe/devcoredump: Use drm_puts and already
 cached local variables
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240920032108.629796-1-John.C.Harrison@Intel.com>
 <20240920032108.629796-3-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20240920032108.629796-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0045.namprd16.prod.outlook.com
 (2603:10b6:907:1::22) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|MN0PR11MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 964b0859-8468-4b53-a288-08dce1b458c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDZleFd2Q09yTmx5ditBSWZrY0ZaK2h4YlhZd01LWGFzaERhVVY3RXowTmY4?=
 =?utf-8?B?eU1GcTNPa0h4YUlpdk9hd2hXQXFCbmJLaHc1YnJsYS94Tms4NCtZV1hHM3I2?=
 =?utf-8?B?TDVhQVdlUkk1dmRyZm9CamIxempERFAzM3hlVUFwZU9xVTE4OGIyOFM4MDJY?=
 =?utf-8?B?ZUNVSWdaS0JSUm4vMU1tNnJ2RDF5Qng5bDFQNEloR1lkeUpMVnFqVmJEYWdF?=
 =?utf-8?B?bjl0UkV1NmZYQ3cvNGtIQXduRHhhQ2lSb2xnbHhGaTVIaS9WdVJFWUtNTG9w?=
 =?utf-8?B?OGM0akx3QjN0cGU4dHY1MkhHbnNIRnJpZm5lUVdidFJlbG5WbXdzVXpqVUxS?=
 =?utf-8?B?MWtwc2thM1JHVGZzUWw4SkRhbTcvOXMzSm5Xa3ZTN1N4TDgxdlVqWWQ1OHJm?=
 =?utf-8?B?NE9yNkF6bGVyd1ZHdmZGS1BTaW5saVQ2cmNQYTdNL1V4MEdocTluQXcxbURh?=
 =?utf-8?B?b1VScWF6NWowNXl5b01PMXl2VFhPQ1NvRzJuZ1pFTkpoTnlQaGdicGNPUDdv?=
 =?utf-8?B?ZEVlTUgwd0h1OGZoU0dCK29MS2pqaSsyelNsRjhiamluVVF5QUVTOUkrcDNi?=
 =?utf-8?B?Ukx0Y2Z3bTVMR2ljbEZmdVJTS1pHNkpCRzhuTGdkWXJ1VzRoM0F1T0Zad2Na?=
 =?utf-8?B?cXQ0eDlPTUw0OTdla2hTNEdGNVlLUHNLeG9tcGlmclN6Z1RhN0Z2UUxyM093?=
 =?utf-8?B?c0ROMXJDYnVMcklPR2MxT0JOUHhtdGlOZEtiZzJaOWZmcnVuQUJQV2hRVHJE?=
 =?utf-8?B?Q3lxaXNZb0ZYMHBRaExFRXBMUDlOWG5lM2FKaVpDcGRKR3VPMDJCMStIL2Yr?=
 =?utf-8?B?eGUxWllJS3Vtb2tKcUt3bE5nNVJwMjZTekdSQmxnL0UvRnhCQk1KSjR2S3pT?=
 =?utf-8?B?V1FkSXZaQmJpYktCTlFqNGovdi9CLys5Snd2aFFYT1ZJQ1FLaXk3anM5ZDNW?=
 =?utf-8?B?d2FqODErVmd6cis5TnBXRytHMSt3ajg0QlJqbHRTYmErYnZiUmdqaVJ5SnJN?=
 =?utf-8?B?MFdnUXlvSUVSRlZBQlUwUEI1SDlXT21vclZzRGtOSVBlWXJUQUMvbndCOUVx?=
 =?utf-8?B?Z01DbVpvMUJ6a09iOVgxMWE1ckxkczhMUno3clJJUk1JUmo2SEdEQXRyZzJ3?=
 =?utf-8?B?ZHlYeEJ4ejZmcTY0UHZtNENYbzdJeWc1VkhOdElXamFoSzkzWVZxTTlxVlg5?=
 =?utf-8?B?RUt5MlhHQitLYWFjQUdEVjdpUVloSGNqUDJvY3pHaGY2c2t0dEpISVU0WVVh?=
 =?utf-8?B?ZlhueThFMzRnVGhOaXRuR1RxRURaaWlMbTZVSGxlV01VU3U1YnFHNWNRY0xK?=
 =?utf-8?B?RWRwcHk1aXNicGlwaDZIUHA4TUJuY3ViQmkyMkwxU3NHOG5QTjN5NDZWb21k?=
 =?utf-8?B?TzFrdXdXMk92TGcvVDd0S2UvY0dCcGhXVlRUaVA3MnJuNWNUT0FQMnFzN0tZ?=
 =?utf-8?B?NEwyQVBvYWZ6aDJMZ2xwMEN4dUxsSHpzK3FVaFBRVWFjUlhUU1JKZFJIWTla?=
 =?utf-8?B?QnhNRUlNejJZR0tGR1VjaVhEZ0IxdFVYV3o4ZUY4MU9RaUIwU3ZIS0lxdTZr?=
 =?utf-8?B?Y0hoT1Q5SEFzVEdsNXMzTXZhdG9DbnBCV0d6UDNaYTB1Rk90UkQ2dG5Bc0lZ?=
 =?utf-8?B?cXY3T094L1ZvcFJKdTJneDNma3o3RVJTZFRUNEVKZklBemQ1WExYZTlmOFBa?=
 =?utf-8?B?OHczTytHMXR4UGJ2N2RXOExSQStMU21zU05JemdVazVPazJLbkhLTHV3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0tpekhrOXRjalhnYU1pTkZXNnl5d0M4MWtmQU9lN1pZUG53aDJEOGltSVJh?=
 =?utf-8?B?MnlhN0V6MFBmMXg3NVM1dnExVXlNUVJnYVRVRGl3cXJqWkJqNUo4anE2TXcz?=
 =?utf-8?B?OHlaL2NiSU1pYkFRMW9BQUN6MFdYL1pPNm14ZjNtc2JzTGppSFdyZTlGSjZs?=
 =?utf-8?B?VGhYTUtJZ0hHcjlDbDNodnZGc3dnVjNNSE53S1RGZDhDMk1QK0xHTm5kRHNy?=
 =?utf-8?B?aitGSDZIc1Y1SVU1cGdCRkxOeVo4SndHMUhIVE0rdFJubmlnQkV6U3VMYUZo?=
 =?utf-8?B?UXBPcXgycUJjOXcxVGd2bGQyd1lFQ3lKbmZVL2J0ZlZveGVoOVAwRWVaZGN2?=
 =?utf-8?B?eG4zRTZLUG5abmhpaUREcWdBNG05emhEK05lZnV2WElUNkpnVlpVK3d6dzA2?=
 =?utf-8?B?UlN6M2pTSENRNU9IMFpjSXlwYk1lKzJQMklzczM0UmJaSmdZNUU1dTZzd1Rp?=
 =?utf-8?B?L2taSUs2WnUrY1F0akxBcGV6OGhjOEV2emJtVG5FTEZTT3VrZ3pIWFJyb3FF?=
 =?utf-8?B?R0tOVVdpMTc2RjJvUzFhVjJHc0VnUlpFQ2Q1U2tjcUpDMVBOR25CU2oxbDZB?=
 =?utf-8?B?a0dLUEU3ZW1wY29QQjRWTGlqZUErSElZZ0JPQS91RzZEK3lDSHBYaEN2alR1?=
 =?utf-8?B?cUJzN3NDNVVhanA2MVZ6ZkZCL0dnMVEwRWlqcFgxbGZBakNqRXFaNFdqbUg2?=
 =?utf-8?B?RVJDNmVOR25Jckc4K24vbUdnaXVOZWdRSis4bHQ0aW5BSldoeDFyaXFrZ3gw?=
 =?utf-8?B?RElBdGszSld5ZVdtWTM4MjNuQVl1a1pHNlNPZVVkcklMWm0xK0o2c09nVzE0?=
 =?utf-8?B?TkwrYlBaMWY1MlRMbUNPbUlIMkErTzJjcUQ0MERQUDlMNXFkOXY1RXA5QzRn?=
 =?utf-8?B?RXdjRk5kcm4rUUc1Y25CYm1DdVdwUjUrL0puWkdhdVJnejhJS0VQRjF5bTlT?=
 =?utf-8?B?RzgxczRSbFRCOEsxL0Eva1REUFhmN1lGS29YOFZZeW9sb1FDbmxIWmw4VENn?=
 =?utf-8?B?SXprTnFLYStLSDN2b3NTUmpQR3BCaE03M1FBTzBSQlVsSW5rSDZGZEt2ZDVY?=
 =?utf-8?B?TGFhL2hYUk9taEdwZTRMRkxZcmoraTljQkc4S05CUnMxMFhjdVlhUzIyelNW?=
 =?utf-8?B?TGptajZFdnlTNEhub2xCUlczVVhYSGl3MVFoQ3k4cWhKWnluNXVCME90WHpX?=
 =?utf-8?B?QkFRUzJhTlJJQW04ZytXMTFCQ2ZJT0xVREZMOThxYUkxN1dPRnV5d0pScVor?=
 =?utf-8?B?RWExaTZjK0t4L2FlYldRYSsveFJmVDZpWmNTbkVIYUpNREJhcEVoSCtvUkg4?=
 =?utf-8?B?WFo2QVd4RU9oR1kxeXdVUEVqTXl4UWtnR210TWIzYlRHMUJ5YXRQZjlLKzBK?=
 =?utf-8?B?NTM0MHBqRk41YS9pSHI4d2hOcitxSzlnUmdLdlZaN0ZFOUxramVzUThpNFdz?=
 =?utf-8?B?Z1FlTyt6ZHpIVEtYK0RJSVVIUXB6RGpFbllYRXQ3ZnRuZHo0Z3BJdWRXNWU5?=
 =?utf-8?B?ZkxHa2p0SVlmcENmV3FjQzBIN2orSDg5YkZlRWZYaGlCd3ZEdWE3TXdLYmhJ?=
 =?utf-8?B?R3BwRUpPMG04UnBXeE1ldFFlQXlnL3Fjayt3QVVweXlpQ3FtcUdjRjRmRHJR?=
 =?utf-8?B?ODdLTHJGbWtNN3lTNkZvSFhCai9sNU5oQmFyNTF6WVEvVnk2eFE1MGhoaFpx?=
 =?utf-8?B?elh0SWlyY1pQbjNFVFJPbTUvVUtvMjNyV0pUQ28ra3dnRWRsazdDNzl2YlVN?=
 =?utf-8?B?MmluQS8vUy80b2REUlFoVTZ2eS9KRkRLblhvRmYxdjNkWXhublFmWlRPa0RD?=
 =?utf-8?B?cHBkdzBxSFJpRU9rdzdITkNQbndVdXdrQS9FRnZSVk5TYzVvekJGSTNqYmtz?=
 =?utf-8?B?ZUJCWWJ0bS91UGJkTFp2Q01NUWxCalBaYjhjc21IVW5FbGpxMDI4R1owaEY5?=
 =?utf-8?B?MU1Ia01TK2htTkRnSSttMHlkNTN4K0c0dlJHQy9ucWJxZnREVFZ4elpRQ0pU?=
 =?utf-8?B?S0VIR2xwL29rSldMVmdaa1FKYkx6YnhoZExGbVdxeUxHQi9wekt1VjE2MVBy?=
 =?utf-8?B?RHZBaVdsQUNPdVRGZEJNanhkRjdra2JkNjU4ZEJEWjRqVWlTTUtuQ1hjaGty?=
 =?utf-8?B?cVVxem5WeGtLTVJTMk1TUWkzdHQ5VkJSWjN0bytieFhEZTR0R0hsL0trZTRq?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 964b0859-8468-4b53-a288-08dce1b458c3
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 00:59:48.1212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g8ZpK3CbNEhosSt+T6BB5rc7lqF7A+Ab+ku2gmHrYu1gQ0EaL2yI0ffdC+TBv9wsGPLQ9Pa+btkevUmbfgJKejKLFIubw3ZasApLXm59ZSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6010
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

Looks good to me.

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
