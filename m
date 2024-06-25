Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4667C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 21:57:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED4210E181;
	Tue, 25 Jun 2024 21:57:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="frzfIQ+i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C42D10E181
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 21:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719352647; x=1750888647;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P/fdaVs2EIazuGQ8Ke/d4LF7VhsFmZ8drbSHT83VpJw=;
 b=frzfIQ+iKYVTtYjfmin/ZMLwGnnbpY43DmsMyDtmDmL3IxL5xRIFp1Ho
 5/D+fFEOy7otn1Qi2zZmgTWRst1lj3fC70t8YZGoNAW2juLtR24rxrzDc
 kD7QGLU5FZONEPQUxXP1pXj09O4VX+G89d04mQZMSfrg1MZGrwBVLfPT5
 YNdPOkPVP9SAFScpf5e4CzqpA83/4JOqiTRoKFISF+qWUVspled2Sp3gS
 P49ZcolUAvp/nTWEg7PAPHDF0afwLobvFg8gOvKDzBAXOaT+jtGXsStDg
 XnUq8ca10JJszq7XFikyr0QEaKdA353OSR7j3pBr387QC5EqpkOm9fs7/ Q==;
X-CSE-ConnectionGUID: mwvf74StTRi2y1+VLAXPfg==
X-CSE-MsgGUID: GJwRKlBJSdegRvRsh5Wnng==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="26988428"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="26988428"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 14:57:25 -0700
X-CSE-ConnectionGUID: 00FUuG0LQbG1bd2R1/mNIA==
X-CSE-MsgGUID: iRsIkgbUTb62cAbIEkxKHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="43761655"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 14:57:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 14:57:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 14:57:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 14:57:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 14:57:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9k34ahyXisW2IAAeeMHbxudLGMzuWIQvG/XAjAwoJFW6ws2CjzWqI2x/9sfWTPps8n1RO//7qgJ28n662pC/dLDhccY28IhSWeRXr82x2ouHH79lnU+4spWBMvV1ST29q5uRAAvM4qg/H5HGNi9IpsOgMLrkGuFWTSROqU/rx5CFrJT3Syg9PnoSHAGe/FCdps7VXcvYgp+6MlKH7swBzeBZLfh56/OSkeuVBDDyx3099GREX0puZ4oQsmZwhv5rJaPxf4tqBdkvJu0gXFd/Gt5pN1t86QifF2t6qyQCztJeGpfzoFN79B00i5Ghj/xw5GcYbtlwsO9Tx10jBQaDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kS6p++VuCacAVxaIJhE+Q/UIiX75YuC4bFUIijShmrA=;
 b=HmYiHGsXxhhreem4LxKATHx4zaXfE6SWjA7CQnDhkSgkchrOZZxWRDhErTK+JceGalrcsKSyhvXUoUhdE2FPtKbufpGXAK1N+23AbpglGCLGBweGELimXGz9lRFmHC1DFhgqY80UDMR8MVujPP2ugKK6nzinoFmbfWyObyleYXIkONxNtFkGqceC7GRpEjf4wyaezG759573PIZT+wGQT+Gs9/9P/yrtT9W0IjKoLB3wKXcPoJY5WN5xiL07UUcMCbMjDW2FR0RHphTlpRlyv1OJpaeSyVXQdrfM7/rQxySot6Uctv62OqBqeFJw3Vh+aks+D5luSRL6kTqdbrwJMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ1PR11MB6154.namprd11.prod.outlook.com (2603:10b6:a03:45f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Tue, 25 Jun
 2024 21:57:17 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 21:57:17 +0000
Date: Tue, 25 Jun 2024 14:57:15 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>, Jose Souza
 <jose.souza@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Exec queue op's to enable/disable preemption
 and timeslicing
Message-ID: <Zns9O4SNJ5YIilUR@orsosgc001>
References: <20240625201518.766925-1-ashutosh.dixit@intel.com>
 <20240625201518.766925-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240625201518.766925-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY3PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::24) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ1PR11MB6154:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dba1c2c-a9a4-4aa4-5671-08dc9561c7a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799022|366014|376012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blNTNW1ZZ0tMK0hRd1FPTnA1RlpLYzFwakNhYjFYTFlXUGRzKzFiZWNJUFVO?=
 =?utf-8?B?OHJyUkkwVFFmVmJXU1hRd0JFd1BUdi9nMWlWbTdYdlFDWVRIZHpoQUdYZll6?=
 =?utf-8?B?bEJsRFY2dFYySEhzR0Q2djc2WWJxMW84MWJTb3BaVC90a3d6eXpwUWFDTDhW?=
 =?utf-8?B?VXIyMFdnYlhTRUlJVFlaK21JUWYwcU1kQmg2ZXk2ZTNIZVhWREZKQ1M4ZHZF?=
 =?utf-8?B?bk5vN0I3LzVPcXVqMFdyZlRKOHF0Q0thbENLaGI0aEtLUWI1OFluQnZsam5T?=
 =?utf-8?B?clVySXc4SXZoQWUxa05QOFgybkExOTBJN282R0hJRjVQV0ZGd2wvSDFxbzhH?=
 =?utf-8?B?eG5xdmRmRHRORTJBNGd6U1VGR01XMXJkc1p5d0htU1lycTI0czM4UTZPc1Qw?=
 =?utf-8?B?eWtNWmNEb21XVVB3WGlMWnNnaXgzVWk0VEdIVmdTaFYyUmlkcEtwKzk4MjFz?=
 =?utf-8?B?Rk1WRVpwREttcm5rcy9BMlFKd3djcGdNRVhST1UzallVRFYrczFMK2lSRjY5?=
 =?utf-8?B?U0c3Qmg3ZzJXTWd3eHgyb0VZclJUeEwwWVRLU1g2eDJ6TzlQVTVFVk5CbEFV?=
 =?utf-8?B?cGU1U3hOZVl1bEJXRE9Pckd5dytDSG5nb3hSdFcvWTd0MFhkbnQvOXZZcHR5?=
 =?utf-8?B?VjJZaWhBWkNVTDJYekNRS0N4emh5dTV0eDl5UVNEb1VvaHdJYTVZTUNvWkNQ?=
 =?utf-8?B?Tmx1QW9BcWM4SmdqRXp0OVZxNVlOTHNOdk9za0lxRjZvTXZYTTIzOWdvdHRl?=
 =?utf-8?B?N0ZaaEliOE5DVzZBamNMS2lTdnEwMHBpeXY4c3NFNmZVZGNldmFaTzJFaGZa?=
 =?utf-8?B?ZmdtWHpBSWNYQXFXMS84eS9TTlNiY0RSSzFNM2c3ekU0RmZzcVp1bWVNTG51?=
 =?utf-8?B?SVJINXVqbmN3V1NGVFVUand4QjdHeGlWQ0dlb0hLWWRJaUxSZDhEVlJZeUxJ?=
 =?utf-8?B?dmJLNDN5UHRNQlBjRVlReElmY1NWSEJZUmo0T1lURWZ1aENPUlQ4S1UyWGNk?=
 =?utf-8?B?dFR6Ky9CemlhMllWbGhFMTExejRNMzVJVklsZ2htSkxXVGlMNXU0anQwd1Fu?=
 =?utf-8?B?ckM3cExHN2dhZlZUT3dlQ2lvYTkvV2xpQXJZRWZRMHFDYUg5VFRZMzNvOVVp?=
 =?utf-8?B?Qmt2N2txelRVRTEvcHFYV1lqbE9GR09FNEt6cGw3K2VnMTd6S21nN0xUcFpX?=
 =?utf-8?B?Q0hHNGdlVnZDUzNkdmhnZFoxcklMVWVIbk5OQnc5ekRYdHJ2d0JuOVV6Lysw?=
 =?utf-8?B?RUljcUhITUhSdkg4b2pjczNpemdEcWN2N0lOV0RHa0p3amlERzdBU2o0RXhH?=
 =?utf-8?B?d2xxY3A3SFd3MXdtMks3dk9XQjFnbjNwVVQ5ci9GcTFyOXAyZGlZS0N5RzlI?=
 =?utf-8?B?NlVyaUoyclRSamd5MU9EV2NWdGF1OFhxWGlYenErZFpCMVJvSVRMaHNwcVBm?=
 =?utf-8?B?WTNqRGdWZUt5T0RmcDlieFJpR05IU0h6Zng3cnVoZ1BHUEtCN1hyTTZFcTM4?=
 =?utf-8?B?cTFqUVUrbmd6UlVOUElvU2l2eG9JOEJZbFlYeCtmRTBYaXBpQllTMkNHMXRH?=
 =?utf-8?B?aVJWelFid3J3MTF5ZS8rSnRZc2pSNjBaWVhXdkplNUl4aUJLeTk5ODNPUFVM?=
 =?utf-8?B?QytZMWxUK3VYTWRTMW41TmFaZGJsaHVtOGphOFozTG02ZDNPNUtjZmJjVEZv?=
 =?utf-8?B?OWhzZmNQTnVrM0JKb01BZmNmUG1GdG91MlRpMk1LZTVmSkFlZTZabFlJY0J5?=
 =?utf-8?Q?4XRQXcCOMFSiQU9lMPGmJdioSBoSic9HoiH49hM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(376012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ui9YV0dFUExEOGNqNlRCZ0hVcE1rVy9pN0pkZnZlQ3QzbzBRRGJmdlZRRHI0?=
 =?utf-8?B?dzBvN0ZNcnJuaUF3b1pQTllPNCtLK3pvZ0xCbG41SjE4bDg0UjBqcHFMdDJZ?=
 =?utf-8?B?U0lOeit4amlFZ0Z1TXlCNFNrcmEzdHpTUStTSW9QOWFVWDRmKzVjMFg4SEhj?=
 =?utf-8?B?bEJCYzdRaWxuTUc0cUtjNlVBV1NlNlR5NENhbVpwZ2VIeHY3bnBza1pqYmFL?=
 =?utf-8?B?RG8xVnFYdjVnTVc1ZTFYZmxPNzNNVDk5VnMrQW13UVRGOGNKeDJOMFBPZGts?=
 =?utf-8?B?bXZCOGRHSUxRWUlPbFJqd1BOT3dKcDl2SUgzRWxvMTNyQ0pFNUV5RUxwOUZi?=
 =?utf-8?B?M0RrZlV4ak51a25zL28wWGZmRWpNUVFpM1Jodm4wazcwZEdmK3kwQ0FvQXNQ?=
 =?utf-8?B?MVZIR0JhZXllNnExSWxRQmRuRys2bHdaY3V5MU8va2JnWlNESTNUczJKYzI0?=
 =?utf-8?B?UlpLNHlBNkQ0cW9tYVBURzdJYjRQRFhicVZhVFVoL2JUSi9ZNDI4YlZjdVh4?=
 =?utf-8?B?RlpnckRQb1VUeE9oVjRjNkZwYTQ5QUUzN3QwdzIrbUxrSTJKTU5SMVlHb01B?=
 =?utf-8?B?bVBZR2xYTklobjhCVzhJQnNCd0UxY3E5ZmVselJqTldJRDc3bDcxcTUveGgw?=
 =?utf-8?B?NlNFV1hSUVNxeHVOKy9tdXE4cC9yU1p6SG94UzV4ZmkrMlI3UENKT3FHKzZ3?=
 =?utf-8?B?RW5qeXRBZjIzR08zY0pyaVJkVkFNS2NHZkN3MENCdUpmZzVCVDFPa3pxZ2xU?=
 =?utf-8?B?UEhkMXhuSzUyRnhzeVRBM08xWUpFTzdCbmQ5V1h4YzkwZTBVcmlTbmRQODJC?=
 =?utf-8?B?NWEzZDc5UkRtK0NLdWpXUnRWS0VEQWp3eURZU2hEL2NVOGhvWnV4TUtqcWZi?=
 =?utf-8?B?MFNRK2pBN1V3cVNDSVMzYnpMWDlKRjRoengyMG4vSVdQQ0hEeXQ3MWwvRG9y?=
 =?utf-8?B?WHFnaWNCRW5kUW1KZWxGWjVHWGtZUG5nSlBndmNSdGFUSndyZkFhMTZVdktF?=
 =?utf-8?B?dFhYVHNnUkJPcUxGeThBZ0FobDBxSjVTMXBIUlNiYWRiVGxuZjRMZ2d6YUg0?=
 =?utf-8?B?bFpKUy9MeS96OVE2NFdxc05xcVoySmJPYXBnS0U5K1ZhaG5uWkVIUWZtRkZJ?=
 =?utf-8?B?SDFtbkVhQjF6eXlrZnRpVHhtY1o4NWtjcUs2dHMxbEhiNUxNUnBCbGxYZW5s?=
 =?utf-8?B?WFMvTVRLSUxncEZpYUltOUN5amZkUHpiRUppQVYvNmZMTHErSXNYZUVrUHAx?=
 =?utf-8?B?RytDTlJTQlZweU1XcTduSFdmbjlJL2VuM2U2ZHlTcnlUb3RmaWl0YWRocHVC?=
 =?utf-8?B?bkxHZXpGbk1XbVBvWEQ4b0FpMGw1TnVUVXRRdnYyMmFDK1B0Z2h3R2ZSbnM5?=
 =?utf-8?B?aURRMTZ4MHA5TTZQS1k1aWpzeGd6Yi9NcDRMQzFLSW1qa1VYTzhKVlVzOURH?=
 =?utf-8?B?Vm11YytyclBVcTRURitkSWNjQlVWVDV5Y1AweHRyMkdtSTdHQWFNS0ozOWtX?=
 =?utf-8?B?WEoyYVVrTThwaUp5UG14Mkptdm5BU1BZYlBQSUhYL29uUURUR0djT01Sc213?=
 =?utf-8?B?eUR0MnE1SlNZSUVyQ3g4K2YzMFZ2SUFGUjJQK3RnQnV2ZXpVVGcxRjRyTWZG?=
 =?utf-8?B?cTFSUDBtR2lrY0hmWXBuNDhLc0ZuV2pwNktTYlluMDllaWFyTTFGWE82ckxl?=
 =?utf-8?B?Y1haVHF4OUdFVE9ZUmF0SlBMaHpZRDdBSU1OZUxncmJLb2ErVi9rL0ZQTDQ5?=
 =?utf-8?B?bG1OSEU4aVRqQXVsNGs2MEZ2UWFjdlJNSVdkZkdMSklZazVjRG52T3JFbEp4?=
 =?utf-8?B?YkpFOUZQNHh2V1lKUkFSbVFucHkzUEs4YXNoNU9aNC9abXpFYmdkNS9mdFRO?=
 =?utf-8?B?ZWxrSWZuMFlVdGh1OWF1Ukhzb0p4dDdLWjI0UXBHSWtoZTlyWmRubkpJRTYz?=
 =?utf-8?B?Um9WVUhBOEdYdVZiRXBFa2krSkcyT3BadE42SzNVc0UwVjY3OGRNVzkvSnha?=
 =?utf-8?B?dlF2ekt2ZTlJR3dpL0psWlNCUDcrTno0ejhsMWZRQS84eUJnMjQ4N01iQWd1?=
 =?utf-8?B?Z3lNR3AzNmVMZnk3cFV5Zk1wSnpkN3VlWmd6ckNPVzY1NDBIZURBNEkyc2Zw?=
 =?utf-8?B?ZkxKbHRkajllU3FHSmVwWFNiK24yM29VVVNaWlh1aGYvZ2pQVlZBZjVOd3Vo?=
 =?utf-8?Q?KxNL6e/GxU6p5NAeddd2NzE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dba1c2c-a9a4-4aa4-5671-08dc9561c7a6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 21:57:17.4862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8lW/0PGwMveb/3v7uAMXHrMj0KAIwyXJkMaPILZzQ21SmxFkIhXan/A6CZ2/YjdS2sH4gJ2oHNHe8SjyWA4vOMMF9FQmc/qN1hdZokN318A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6154
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

On Tue, Jun 25, 2024 at 01:15:17PM -0700, Ashutosh Dixit wrote:
>Introduce set_no_preempt and clear_no_preempt exec queue ops.
>set_no_preempt allows an exec queue to run uninterrupted (without
>preemption or timeslicing). clear_no_preempt re-enables preemption and
>timeslicing. The functionality is used in OA in the next patch.
>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 +++
> drivers/gpu/drm/xe/xe_execlist.c         | 14 ++++++++
> drivers/gpu/drm/xe/xe_guc_submit.c       | 45 ++++++++++++++++++++++++
> 3 files changed, 63 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>index 201588ec33c3..8d64c2277e96 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>@@ -164,6 +164,10 @@ struct xe_exec_queue_ops {
> 	int (*set_timeslice)(struct xe_exec_queue *q, u32 timeslice_us);
> 	/** @set_preempt_timeout: Set preemption timeout for exec queue */
> 	int (*set_preempt_timeout)(struct xe_exec_queue *q, u32 preempt_timeout_us);
>+	/** @set_no_preempt: Disable preemption and timeslicing for exec queue */
>+	int (*set_no_preempt)(struct xe_exec_queue *q);
>+	/** @clear_no_preempt: Re-enable preemption and timeslicing for exec queue */
>+	int (*clear_no_preempt)(struct xe_exec_queue *q);
> 	/**
> 	 * @suspend: Suspend exec queue from executing, allowed to be called
> 	 * multiple times in a row before resume with the caveat that
>diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
>index db906117db6d..04a2c7e86019 100644
>--- a/drivers/gpu/drm/xe/xe_execlist.c
>+++ b/drivers/gpu/drm/xe/xe_execlist.c
>@@ -416,6 +416,18 @@ static int execlist_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
> 	return 0;
> }
>
>+static int execlist_exec_queue_set_no_preempt(struct xe_exec_queue *q)
>+{
>+	/* NIY */
>+	return 0;
>+}
>+
>+static int execlist_exec_queue_clear_no_preempt(struct xe_exec_queue *q)
>+{
>+	/* NIY */
>+	return 0;
>+}
>+
> static int execlist_exec_queue_suspend(struct xe_exec_queue *q)
> {
> 	/* NIY */
>@@ -446,6 +458,8 @@ static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
> 	.set_priority = execlist_exec_queue_set_priority,
> 	.set_timeslice = execlist_exec_queue_set_timeslice,
> 	.set_preempt_timeout = execlist_exec_queue_set_preempt_timeout,
>+	.set_no_preempt = execlist_exec_queue_set_no_preempt,
>+	.clear_no_preempt = execlist_exec_queue_clear_no_preempt,
> 	.suspend = execlist_exec_queue_suspend,
> 	.suspend_wait = execlist_exec_queue_suspend_wait,
> 	.resume = execlist_exec_queue_resume,
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 373447758a60..3fd5523baf0f 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -1548,6 +1548,49 @@ static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
> 	return 0;
> }
>
>+static int guc_exec_queue_set_no_preempt(struct xe_exec_queue *q)
>+{
>+	struct xe_sched_msg *msg;
>+
>+	if ((!q->sched_props.preempt_timeout_us && !q->sched_props.timeslice_us) ||
>+	    exec_queue_killed_or_banned_or_wedged(q))
>+		return 0;
>+
>+	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
>+	if (!msg)
>+		return -ENOMEM;
>+
>+	/* Setting values to 0 will disable preemption and timeslicing */
>+	q->sched_props.preempt_timeout_us = 0;
>+	q->sched_props.timeslice_us = 0;
>+
>+	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
>+
>+	return 0;
>+}
>+
>+static int guc_exec_queue_clear_no_preempt(struct xe_exec_queue *q)
>+{
>+	struct xe_sched_msg *msg;
>+
>+	if ((q->sched_props.preempt_timeout_us ==
>+	    q->hwe->eclass->sched_props.preempt_timeout_us &&
>+	    q->sched_props.timeslice_us == q->hwe->eclass->sched_props.timeslice_us) ||
>+	    exec_queue_killed_or_banned_or_wedged(q))
>+		return 0;
>+
>+	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
>+	if (!msg)
>+		return -ENOMEM;
>+
>+	q->sched_props.preempt_timeout_us = q->hwe->eclass->sched_props.preempt_timeout_us;
>+	q->sched_props.timeslice_us = q->hwe->eclass->sched_props.timeslice_us;
>+
>+	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
>+
>+	return 0;
>+}

Why not just use the .set_timeslice and .set_preempt_timeout hooks 
instead of defining a new one to do both?

Also how do you check if this operation succeeeded? Is there a response 
from GuC indicating success?

Thanks,
Umesh

>+
> static int guc_exec_queue_suspend(struct xe_exec_queue *q)
> {
> 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
>@@ -1598,6 +1641,8 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
> 	.set_priority = guc_exec_queue_set_priority,
> 	.set_timeslice = guc_exec_queue_set_timeslice,
> 	.set_preempt_timeout = guc_exec_queue_set_preempt_timeout,
>+	.set_no_preempt = guc_exec_queue_set_no_preempt,
>+	.clear_no_preempt = guc_exec_queue_clear_no_preempt,
> 	.suspend = guc_exec_queue_suspend,
> 	.suspend_wait = guc_exec_queue_suspend_wait,
> 	.resume = guc_exec_queue_resume,
>-- 
>2.41.0
>
