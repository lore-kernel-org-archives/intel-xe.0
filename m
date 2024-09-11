Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4444DEE57CF
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 20:08:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD5910EA8C;
	Wed, 11 Sep 2024 20:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aNg/yplt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0417910EA8C
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 20:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726085286; x=1757621286;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=CP4XuLKBR7LxAY+Kta9M/Zvl12ZFrnKA+th+gTgSAq8=;
 b=aNg/yplt20Mhpi3JtyBe6P+Lsd7IvnULcfNbEWMVyAr71hMjGvlSvCGL
 vRcIhpfhm4EwcfBz1L5rPfwYGLNU5OicSaiz6aV5S7QA5w3qte8aFqfqe
 72JjtFY0p0CqXpXa4FtWSI6gef4ELkA5q5NUt0GB+9Pc5uRWO8SxKHVyO
 XXXw6rGcpJkqNM/rAmRJ2absqoh9WhJKB7xba68wsmPBW4lAtpEfnt1I7
 cLGx8fmxdzHhmnnBrfr3tW9pjYCp4Dvo1NdASCq3OIcCbBWjZooZ0gbfQ
 MaF3ug9/WSLdBaCPmi0i5G7TaOf6CSKYY8jFLJETUAPi5y0fuRfgw4YOo w==;
X-CSE-ConnectionGUID: K3Fl7sPfQHmJycr45zrdig==
X-CSE-MsgGUID: EmzpxuBCRyazTEcYDRZV7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24400847"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="24400847"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:08:06 -0700
X-CSE-ConnectionGUID: 0xLaPXmzRZmyr5EF/zg0LA==
X-CSE-MsgGUID: WqmPMuRSTnODs6PKsV/ijQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="98312941"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 13:08:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 13:08:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 13:08:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 13:08:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bKD/pjugylN8ipDv49HIneHrYNCb0Bz8g4Lb4a7OCwulhTbsXLgxXywgeh/2JML9Cu842G98NSXXckrwODnujEeJVGXHJHuyt20COQOHHMDufQFBUhSWIKferaehpR5GlacduLhMVXmt8Wx9ds6igi10l95Mh/eEyH7oPP7YPBD2/AtaD5gzXZ+muPqU/cIyCqAscVc+2CZ6avPmkOYoHzDQwa7iQCJObcM0ve2jbR+fdAjs6mu0EWGqBLwb77KFjCTjwHnUZzyukZUH2to+hOwd+2NPn7NZs4midoqPZLtSLunE4Ry5BWc/d8AFfmMAyyGbz1hpe4AlOaaVtoFDeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnFyggEkEGtOKyC4kZ2av85WLquIFCpbMa6ZnNRdggA=;
 b=Yq5Mmm+KOdEwoBiKVrkNAWMMP9yk+oBYcvmLrH67NrpC5ZrTM9Ead5j1uyf3D1HHhh06ThxLj//1CZEImDtzg7xxBKLe4H7J/dg5R/8TUSg9n+n4ZBe5ns87WF/xyRo9S8kMZp2HKL4y8E41vW9dUf/BCN+8vvFAfGLwJQv8+4T4h4754m4bV3tl+PLGJujpIXPVc/vB34qi5w+MeyxTn+Q07Lyb4jod3hqgJqqjGva+5yROcyAPqfZQrpjk5HsBNgMz1g6uBweJDBVI+IaTuOEPd0iPoVfx3rhbQk+rVGbsc6jrThleZh7IYQOzlGmP417HfgNlkqcteP8fztKumA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MW4PR11MB6569.namprd11.prod.outlook.com (2603:10b6:303:1e1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 20:08:02 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.7962.017; Wed, 11 Sep 2024
 20:08:02 +0000
Message-ID: <d48d695d-7cb6-4843-b163-d2ede3055048@intel.com>
Date: Wed, 11 Sep 2024 16:07:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 5/6] drm/xe/guc: Plumb GuC-capture into dev coredump
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240906222006.279581-1-zhanjun.dong@intel.com>
 <20240906222006.279581-6-zhanjun.dong@intel.com>
 <829abeada55176bdb07af5daab48de7ea1a9469d.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <829abeada55176bdb07af5daab48de7ea1a9469d.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0022.prod.exchangelabs.com (2603:10b6:a02:80::35)
 To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MW4PR11MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: f3954b1f-86e2-4004-4425-08dcd29d70ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHJjc05MMFJVYXZ5SEl5dUJBNkxVZHdGRGE1MzJKVFJ1elBWdEgyTGIvYW9M?=
 =?utf-8?B?aVh6VzVBMUExTXMvSjN0MGF2aXpLa0VmSDIyVTJrUDF2T0RwbzhLUE1sbmZB?=
 =?utf-8?B?SmFLSU5URDQxNXh1ZHRLOFM0YkN6L2hXNVFDT29JdkNCcGlDbjFPcXRtZW5j?=
 =?utf-8?B?K3Q3ZWM5N0tVUm5GbmRIMU5SdGdxcE9MMGt4Z1QvbVlFTVlLZEZkK3RVbmFq?=
 =?utf-8?B?Y1U2TGtRRFlYU05YTjdRODU2eGRQYXBPRWt6R1Ixc2FubWtvbk1nMWJHVnZa?=
 =?utf-8?B?TnpBVCtNU3N3aVJCcHhFVzNGS2dabzREY2JpS3lIdUE2RFFOTW1Lb2J1bzNz?=
 =?utf-8?B?NVhSeHMwT21JWGRRY3Nla3kzWno5bTl5dWh4UHZUWXlFbHllbVVod2pVaGZp?=
 =?utf-8?B?U1RpZk5DcHdMZU51NkF3YnV1RVJ5SUtCaEcyMDh0ZnYvYlFzQkRxWWhaWUU5?=
 =?utf-8?B?VWtDdnlIN1hUUjFQTDRJekhpazlZVWlTcCtvUHZYMExuOXl2aWJSZXp1ekZt?=
 =?utf-8?B?VEJCZzJhaUpUTkI5dnFicXlGbXFVMzROTDhrdFo5eGx6UkhpUmZJUElZSktz?=
 =?utf-8?B?RlpLVW1IcXdJcU9Dck5VVTg5MGFLTFM1TSsyaTk2ZkY1Q0pvRUw3WDdxWXdk?=
 =?utf-8?B?V2Fld1hYY2RnMHNhNEJzdXh2OEVxOUZXczRNbWltVUtVNkpPNjQxOCtmdHhq?=
 =?utf-8?B?RFgwamppRWhoZW44Q0dNNGw3bmNaRGlENFNLRXhnVmUxSkhsZ0RKNmsxTTRE?=
 =?utf-8?B?RTN2U1RrRVcxSmR3b1BoSGpRd0hlaENNZ1pudGozNW1QNy9TUnNJeWpZVkpY?=
 =?utf-8?B?Vk5NbE55TVpnSithT3ZVRktGQ0YvUEFUV2c3eXEwTU1pcXdzM1hFOXZFM2xZ?=
 =?utf-8?B?alQ0d1JUcWE5TFAwMlJ2djNubzgzVlR4S3hJRloxZWRxeGo4RDQraG93U1Na?=
 =?utf-8?B?bFFQeHYzalNROEVrZ0dCZ0krcWJkZ3gzV2xkQy9nd1pONlFkbmQ3dUpuZGtX?=
 =?utf-8?B?MjNNbFhneVJSckY4M1drQmxmSnVhZzJXcE9YZ0FZMTQ0VEp1V1ZicXI1Vlps?=
 =?utf-8?B?aE9SOUpHbUdTb2ZpUjFtejVOb0crOHJBeHQ0a2pQSm1xT3Y2Z2REbG9vS2ND?=
 =?utf-8?B?TGR0aGZucUpFSkpNdm9BNlZZSnB6SkZSTy9mdUYvaytuRlZkUkVEWURMcm1D?=
 =?utf-8?B?TFVENUxuTDBVY2FHOEJYTkZsQk1NMFU3emRsd2VOdGQ4VDQraWgxc3VmSzZO?=
 =?utf-8?B?MmRGVUliWSsrdFptUnJGTk9sV2c1LzJlTnRZRXRIVmFYRWwySjVWSWtLT3Rp?=
 =?utf-8?B?M0JHckJhMnNOa0ZsNGRIYnp6VmlnVkJBR2pXNkxLbFM1S3RMTDFhVEtLNGRU?=
 =?utf-8?B?SUtmYWZ5QlVXd1dmSFZqZWUyM21xalp4bGI4WWNYTHdnYSticTVpcGhWUUlh?=
 =?utf-8?B?STEzTmh0REFVRjF2SlM5NXJ6SUFIOFZYTU5BeGlldkFiN1lEL0l2MHl3S0lj?=
 =?utf-8?B?ZUN1SjVjektFeVdpYlNmZHNYbms0c2J1Z3dCWkw2Y0ZTcGNqRUZwazVJL0lW?=
 =?utf-8?B?V2lkQ01rSG10aG9BYzhVTFVTRXF0NnczOEREVWZYNDh3QU1KSVhRNFJCMDJS?=
 =?utf-8?B?cDdtdDdGRnVxVG54K1dqZCtpWThDSU12RmViUVpyelFzZjRqS3ZLeW12cjFB?=
 =?utf-8?B?eUFQbm1wdjZUQ1JPTEVBaGg4aUV1T2FrWGN2Q2t4RDVsRGpJOGQ3anYyUGJi?=
 =?utf-8?B?MHJWckdpcERjZk5jV1kxOVByWG5CYmlBQ3dKRWlXNmMvR1VmNkxTOHBlbFBt?=
 =?utf-8?B?VDdaYUxnV0pvQmc3VDQvQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0xheUpqWVZ2dzZYYTRJRnpYYldxOWYwSklXZUZOR0svY3E1aXJPYloyODZ4?=
 =?utf-8?B?Ym4yNitYOWx0RjZpU2U1UWw1bTlOT1FJQlBSekFXaS9QTkRGc1hrVlRFRUdF?=
 =?utf-8?B?R20xU2tHMnZuSXhtdkFvTWJCSU11dGsxREpYOUQ5ZVNnN2drNWVIWDdxYVRH?=
 =?utf-8?B?a0NGRkNUNGlYYnpHZytsQThWZnR5bGFqcHZpd1R5dm9BZDBYUHk1anlOR0o0?=
 =?utf-8?B?Z3Q3TXJ2bTRoekowenJodllaVDVDTVpCRUhKMDZCMGpVYWJZVzVNYjZxUnVo?=
 =?utf-8?B?QTNVVFZHMUJUM1hjM3Bma1k3NVRsRldUeDhyYzNkTEVLV0ExbzZMblI3QTVx?=
 =?utf-8?B?NWMxU1JBdU4zYnkxcTc2SUQ5aG9OTEhyRmdCM0ZJamc3M3AxUnkzRlJCL0tD?=
 =?utf-8?B?cWJxK3NIZzIvZGV3cXhKeEVEa2xqeXB3VkxYb2FJR09xUU45TWV3VkU4RmY4?=
 =?utf-8?B?YXR4RVZWOWVyalNFVE1wNDUxbGFDSGNEVnZHdXd6dmJjWlBScCtTRXhObUJF?=
 =?utf-8?B?Y3RvYUx2T1p0Ty9JVlVhL3Vmd0NjKytXeG1ZbXc4bE5wc3pPeWJiLzAwUnYv?=
 =?utf-8?B?MVg3Q3VsaldVUUROa3YwYlpNNml6MHN4a2kyK1hDTDR0cEtsVlIvV3JEYWFH?=
 =?utf-8?B?YllLRXdNMkZYcDFlbnZNaVVVVHI1OEpyNmh6RDdGYUlXRWdmZHJmcjh0YThF?=
 =?utf-8?B?QlM5bG03Q1ladVF6TFNRVFFsZ3BIUEs4em12RGtndEFnWGpvY3NIdXJldkps?=
 =?utf-8?B?MFZLalBPSGFCbGdkUFhYZFB6VFN2Y3BueFIzZHR5K3dhWmRDWEZZL2lFcHY0?=
 =?utf-8?B?bmgxbXRKdXp0TUd6T2tSb2pnWVMrQk1GS3o5czFzWVZ2WFBIM1czUGR3b3RE?=
 =?utf-8?B?RWoySHdrL05BWU1waDNRWXprOFVkSWZHV0Z6SEtpQW1DQUtteUFCNXJOeUhJ?=
 =?utf-8?B?OTViZFBNakZrNlhnQ2tIekljcmg0NEh5VUhNWVZXMVNpOGRJTytTUk1LS0xV?=
 =?utf-8?B?c3NXbHRCSHZGUEJJKzczRForMFJOYmZzNEs4RGlCdW1MVEozbFBCNHpDc0pT?=
 =?utf-8?B?cHp3MDdRbEwzUWg4dlNGV29qc1dSa2wyZ2Zya290NE8wdzBud1VhSlcxTzM1?=
 =?utf-8?B?elBDZXBxNk0yempIZ21mbXlGOGR6djlYbEUya2M5Z3RndXdTZW55L2Y2UzlM?=
 =?utf-8?B?SnJyK3MvbndRakRjb3Q2S3ZIdGlHOHhhekNWaXZwTHhKdkVVa0ptdGhRM2ZX?=
 =?utf-8?B?L25wbmdaRnpuUDVDM2xiTTM1V3g1alZpZ0NkeHcrTzJGTUt4V0NMTEZKVldp?=
 =?utf-8?B?TXRWTkkwUVhVTVJRdnp0ZldHZk80UEdNbU03YmY2RENld2RraTNObUtUaW91?=
 =?utf-8?B?SVBiaHNsYnJUUHp4TWRYZDZFTkZvbHpwZHJoN3Y0ZHlCQUZ4SjBYWi9qUy9N?=
 =?utf-8?B?VUNOSWpJT1hMMGFtTEQ1bkNyTW90WnJzY0xYSzZQb0krUjJHNWJOaEMxUktr?=
 =?utf-8?B?N0NWdjNwc0daYWk0VmFkU1RTQkZvaEVhMU5WZjVNRi9NOCs5ZWl3Vm5PaVVY?=
 =?utf-8?B?SFEwamRDYWFHdGY0ZExEVTNQaUtHNnhEY1JSM3JOaEMzMVFRTEZ0Ym54RDcz?=
 =?utf-8?B?OFlmNzdwbzNQNzZrSFhGOHhPTDJUcXpiaTFMTlZFRjNjVmE5alVqR21nVnI3?=
 =?utf-8?B?ODl1eWdsakVBRi9vUGVseEJnWVdKR01RdlRNZWVlUnlaclZTTkViUlZ3Zmdk?=
 =?utf-8?B?SHE3YzBqU3MwSlhLcmVwa3puWitveEI3YXlsa0lwVnYzSzFnM0ROLy9WOGVt?=
 =?utf-8?B?VStaYlhkU09xSVU2WkVjaHlST2VjcmFod2VvQk43T1hsUzhNK0lqemxlcVFQ?=
 =?utf-8?B?Zlc2VjYzeVozclJleWxhR3FDblJXaVhZNjlHbTZHVDdlU1lPTnBkZExpbnBU?=
 =?utf-8?B?R05pRzU2cDNjOEdWOU4xUnJSYStPcGEzRTlrcjR3cmpwZ1VLL1hybGcvcGxh?=
 =?utf-8?B?NDhaTDM4SERoQUErWTZOQWc0NzVteFBpeFpRZFcyVUpNZ015Z1JnTUcvSVF4?=
 =?utf-8?B?MHBjWTVNUVFUc1lxeUZkTUtRMnZIRXR0R1lZSlozcDRsdHU1d29iTk9qWHVL?=
 =?utf-8?Q?1V4r6b+IKmP/V2t1/wZjFgHGa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3954b1f-86e2-4004-4425-08dcd29d70ab
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 20:08:02.3252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCtAN72GWl6Ceq/yva4sOx9US3dWz+Q9MDaQ/TKXzoTiyQPNOBN6vVdvLFB6KAeObWXQ9GG+EUJ+U0/SFDQhVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6569
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

Please see my comments inline below:

Regards,
Zhanjun

On 2024-09-09 7:23 p.m., Teres Alexis, Alan Previn wrote:
> Thanks again for the diligence on those many recent the offline conversations + testing
> to make the code flow more readible and also tacking the all the race conditions related
> to the link list usage for both the kmd-manual and guc-captures.
> 
> I have 1 trivial issue that i believe needs to fixed and two nits.
> Thus, here is a conditional RB (need that fix or an explaination):
> 
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> (feel free to keep this on next rev if no additional changes were made).
> 
> 
Thanks Alan.

...
>> @@ -805,13 +834,14 @@ static void
>>   guc_capture_add_node_to_list(struct __guc_capture_parsed_output *node,
>>                               struct list_head *list)
>>   {
>> -       list_add_tail(&node->link, list);
>> +       list_add(&node->link, list);
>>   }
>>   
>>   static void
>>   guc_capture_add_node_to_outlist(struct xe_guc_state_capture *gc,
>>                                  struct __guc_capture_parsed_output *node)
>>   {
>> +       guc_capture_remove_stale_matches_from_list(gc, node);
>>          guc_capture_add_node_to_list(node, &gc->outlist);
>>   }
>>   
>> @@ -822,6 +852,31 @@ guc_capture_add_node_to_cachelist(struct xe_guc_state_capture *gc,
>>          guc_capture_add_node_to_list(node, &gc->cachelist);
>>   }
>>   
>> +static void
>> +guc_capture_free_outlist_node(struct xe_guc_state_capture *gc,
>> +                             struct __guc_capture_parsed_output *n)
>> +{
>> +       if (n) {
>> +               n->locked = 0;
> alan: This function is getting called from two places:
> 
> In case 1, this function is getting called by devcoredump to release
> the locked reference to a matching node that devcoredump requested
> previously when it called "xe_guc_capture_get_matching_and_lock".
> 
> In case 2, this function is called by guc_capture_add_node_to_outlist
> (after a fresh new node is extracted in response to G2H-Err-Capture-Notification)
> to remove any old node that happen to have the same guc-id and engine class. This
> is intentional because if its one form the past, it will never be used for a
> future devcoredump call to get a match.
> 
> 
> However, this function SHOULD check the lock so that:
> - if called from case 2, it should not free it since devcoredump is actually using it.
Yes, that is a bug, and will be fixed by add condition check of !locked 
in next rev.
> - if called from case 1, it should free it since this would happen at the time
> devcoredump is freed after user has retrieved it.
Right, it should be free in this case.

> 
>> +               list_del(&n->link);
>> +               /* put node back to cache list */
>> +               guc_capture_add_node_to_cachelist(gc, n);
>> +       }
>> +}
>> +
>> +static void
>> +guc_capture_remove_stale_matches_from_list(struct xe_guc_state_capture *gc,
>> +                                          struct __guc_capture_parsed_output *node)
>> +{
>> +       struct __guc_capture_parsed_output *n, *ntmp;
>> +       int guc_id = node->guc_id;
>> +
>> +       list_for_each_entry_safe(n, ntmp, &gc->outlist, link) {
>> +               if (n != node && n->guc_id == guc_id)
>> +                       guc_capture_free_outlist_node(gc, n);
>> +       }
>> +}
>> +
>>   static void
>>   guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *node)
>>   {
...
