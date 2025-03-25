Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FF3C36002
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 02:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F2A10E06A;
	Tue, 25 Mar 2025 02:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ACcrofba";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57FA10E06A
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 02:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742869053; x=1774405053;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NyW20NoGLH8Z+7sv3r8p+kBSagJTR+pZk9eUaslwpdE=;
 b=ACcrofbanZ2fyrJCwXRoaq7XKl6+luRl7C4zBghcv+nwrZqU1rzB/QQJ
 A/G9aPIXai1Ex9sO8YKPQQDwpD0hhr8M9Thin0lsziGRKK1qVtuL6pj35
 +8/2Arh9PqAnimtjYzF/Lxzf9XVjpT8tlvqJGwxP1woh7C1FTYdhIRypA
 ewbSYH04CxabYwMpTK3Ec4Pn8xZ++qyBqiqQUYBW+HrW2WCNWzLQOeGWv
 jeCmvyMFv68GvSNqMesk6neimvucwvHtpgjg8VwbiD3ZCyFLeVJSl2QQ0
 EGjAlm+PK3McH9GuPRfNC1inzlfjG1ZHDmGUN/RbWz2bxA2yDXwYT2xSG A==;
X-CSE-ConnectionGUID: K8TqfFp9SH2d2hIsJv6edA==
X-CSE-MsgGUID: txwgZrQfR0qR4fP88UjZlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="55471538"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="55471538"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 19:17:31 -0700
X-CSE-ConnectionGUID: WPEzSi7GRaGgq1y8SniUdQ==
X-CSE-MsgGUID: EJdHS9wjTsiEr0GuJxWFdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="125008202"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Mar 2025 19:17:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 24 Mar 2025 19:17:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Mar 2025 19:17:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Mar 2025 19:17:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IaILKt667QANiyxUo0E0XIVyvSOtshJU5E0S55SOBjTNYpNDZEKoKQfmzlSdO+Baam0hnsBuRt4jFaG6/X8WvkX4BJW0h98ooSLEesvRp31PphtL9+TUbWOp29k3OvOdXltWAjtpiKFD8C1Fzb9iMrCWX6xdasbrIh2iS/oUC+CZ6Qly1ENvSHhda2W66I/OoQAIbTuP97iMLo2QR4KGDmDjd92II/enRdyt8S4A3ykrZSYZnXEswEYck11PT3QMjEU3Va3OrJOME8WfYH9UTmX9wNPNzvqXX7m0W4aF0Ql/6sD4QeOWyux6ACD5wDsoctFUu+vrSR3WLv89VPyUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Scl3pVcHJH1j5NX3sRg0GuxRzp9y4jcY5JsbEnlz2Hw=;
 b=qrfAiqMo4pqAZR9SxfQ0/FPbZZeHP686vRR5CuS/qVHDIdi9zdIRUn5ydNBYpla4Ov/PuykGLfbEsubOuZZ79O1XXsE+qRDLqVIydvnUB2YMevBfAxu99BM/83jur3n1RyzPxYYxrigJy36qcOdbElWfJe9qQfzbQnxMWcLV5HaGflS5xuyiSo9OB6jIxPL6dSVTUZQVIzbZrGR9jIaF9wCpqTf26D73vquEJ8zdpNJpwFxCImOMr1P+YmPWspSI3tEcsT1eiHZYf5YdqqR78dP6hRLqILLld3MM/eKNlR39t2ghf+rmTxU1B/FFDM3vR6BPCUzfhD3CilBBIab+vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by LV3PR11MB8742.namprd11.prod.outlook.com (2603:10b6:408:212::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 02:17:14 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%3]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 02:17:13 +0000
Message-ID: <c35d3be8-5443-4f41-a39b-eec89ff068ec@intel.com>
Date: Mon, 24 Mar 2025 19:17:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/pmu: Add GT frequency events
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Tauro, Riana" <riana.tauro@intel.com>
References: <20250312001408.804125-1-vinay.belgaumkar@intel.com>
 <vx26ng5q4asspsg6lktrj5ok73gbiy3bfg7icu4fybekyt4zad@5h4bsek2mukm>
 <4283fcec-5ddd-4d06-9eae-8e622e9695ee@intel.com>
 <azol66l3wmb6r6cy6kh2j5ooglx25bduwj2ybifdxtpvpej23d@jxw766ana4kv>
 <87o6xsai7y.wl-ashutosh.dixit@intel.com>
 <iizcoecokne5qgkpr7kp4misfdok67eo2scj5czijpo6vqitks@xs3ehyr3kcbb>
 <87ldsu9z1s.wl-ashutosh.dixit@intel.com>
 <bmooz4uz4lutnr3hnbcjj7dltpnlxmctd2unltcde3wxahcbap@htjihczan7ks>
 <Z-G8FXgZY7WnhYTw@intel.com>
 <DM4PR11MB775771A5CE91C519E4C62A1D85A42@DM4PR11MB7757.namprd11.prod.outlook.com>
 <87iknxap9i.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87iknxap9i.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::9) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|LV3PR11MB8742:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cc3e7b6-59c5-437a-4470-08dd6b432812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXZZL0lud2NGUDVMSStndkJ6aXRwcTIraVZobmsxVHQ0Q2cwN3Q4T2FPbjRC?=
 =?utf-8?B?VlhBNHdBMC85U01tS3QzS2p2TzVxWER4bU9lK0NvTzI2bVh3cE1PS3NKWE5P?=
 =?utf-8?B?M0dnd2NLckd3aFhrank5a3JVZm0rVFRJMWFpRU8weDZqWkc0OTQ2Q0dQMmZF?=
 =?utf-8?B?UmlXNDNCWUV5ZkRvUzk4dEtsUWE4TFVhcTJ5bmE4ckZUWnFTMElhRnUyMW1l?=
 =?utf-8?B?bm10ZUdMTHh4dnFObjh0QkRBc3U0M0lqQUtmSGtlN0hUcUFHLzVWSUM5STN2?=
 =?utf-8?B?U2xWR2lpZStXdlRTLysyWEVlWjlhVWdSU3VMcEFMOUJMSlVKQ0RkUnpDSXha?=
 =?utf-8?B?TVNlM0krU0NCWUlqNlY5bzFZZENLa3Q5UXZuUHVWNXNiSzR6Y3g5YU1GcnlD?=
 =?utf-8?B?eVNYNWFKOHVvelZ6VE5QUFZ5eHhkcHpLMFNuZnVJdTVTN3FoRDFuaTBxYkxI?=
 =?utf-8?B?TGcrbE1mZG1EbVppVXhHNmowWDI2NHE1VzJFN3ZSQW9IOXNQUGhvYm9XME4y?=
 =?utf-8?B?Ny9XVEx4Tzk0Q0V2M2hXZXNVQ0Z1emlDNG1DM1lYOERucmROL0hPKzYzb3lh?=
 =?utf-8?B?Q29NTHQ2UVRWY1VMejhzeEo2VnBNRGczT3MxRWRTbDVpN3lLL28rVjB3ZklK?=
 =?utf-8?B?TjJiRXhLL0NoazRUei9XRytLSTIrWDBkZUVoVlNrYzcvdE9ZeGpRVE5OcTZK?=
 =?utf-8?B?NXhHTGQyU2RPU0tKVS9OZHdGbGJtSFpaU05ESzZCUTFZcXN6em9QWFprNVN6?=
 =?utf-8?B?ZUpRb25mQjgvNHdLMGE3bm40YW00SUh4MTgyZkdlTW9PN0ZpZ1pBbGFVdHdM?=
 =?utf-8?B?bTdLbVVVOXFOTi90MmY2azltdFpiZ3pKMXJ1Y1VRU2NKdW5SSWgrdytHSjN2?=
 =?utf-8?B?RmcwZGtvMXREcUJTR1lZTmxhRGxqQmNNeWJ6dkxqZWlVRE4yQnNOWUJLdURp?=
 =?utf-8?B?K0QwdTFHanh3SFQ5TFJRTTA4b0poQUJPcGtTY05nbUtROEpBY2dKVEZqNi90?=
 =?utf-8?B?aE9semgxU1NzWnEwMmU3ak80ZXRFdVdpaHBGYlVVMDhYVGJGNkxucmJoNmhs?=
 =?utf-8?B?UU4vaWZVMlIzdG93WWl4eFJoSkhlVndNRkNITWlTNU41REFoeFNxRVFwekQ4?=
 =?utf-8?B?NDUxWVUwNVNobEpRL1hJaWFEZC9CM1BXUmlHeXpvMzl2MnJmalV4WkZlOVhx?=
 =?utf-8?B?MVlMaHlld3JoT0h6elFEOW1zeEZGOUovZjREZzgydmgvamhDbkdIWlAvTnpZ?=
 =?utf-8?B?cjdzeVpTeTdLeHkvVjJDUG9uaFc2V01aWS9nU2NCUkc1SFNIcm03bG45Nk1Y?=
 =?utf-8?B?dndseU9Vdkl3TTNYcmxwV2N6RWI3Rnc3YWZoek11eHJBclVxb1hqSE96c21a?=
 =?utf-8?B?KzB0OXAycXF6azBYaUtPWlhSTXJXcXEvb1QxSm5HQ2VLZ1AyTlNvUWtzdUtj?=
 =?utf-8?B?Y09zeUs5Q0VSZmJXbjFja0xMTUlQdUk0V2hiVmJQeGRQS3JXdm9UMllvNVBa?=
 =?utf-8?B?a1MwM2dOOEdxcFRYSUNjNXpZdFExSjRWMm4yNi9Vb2lnUTVQdGNRSFh2WGp0?=
 =?utf-8?B?Z2w0bDJzVTdGL1hNRnhRTnVNMzlUaEpUVFc3eEVWVmRvTUM1WjFyV0E2b0Vv?=
 =?utf-8?B?akVET0JuSlNWTjNaVFVuYWwzbGM4SldJZUpZU09oejQ4TUhmRGNnTm5odUxN?=
 =?utf-8?B?NjA0dERZQW1DSzB5eC80M0JMbkZZdG5qTUpQdWY3SWVaOFBzZGJBbzBTTGpz?=
 =?utf-8?B?U29keWlJOSttanpvL0N2UVFBUEplM3gxQjUzNG8zYnNZbUovOG14WDJybGxO?=
 =?utf-8?B?LzU4dzFydytjcitBRE45Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmRVdlpsNFJwUHpFMWtGUDVhbUc1RG0xenhVakZRWWpMbVZJNURKaWxmZW5Z?=
 =?utf-8?B?alVrRkp2dlJKUDI0OW1vMjkxVndlQWFsV0xVMnJ1aWhXOGlFR0s2bXJzL2NF?=
 =?utf-8?B?dUcweVBVOTg5eWFnajVRZTVsZ3NvY29PQlBlSSt3Q2k3OTFYRjV6a3NzUFJn?=
 =?utf-8?B?NnVaam1Zb3VsU3FhQk8vdEo2R2FiRXdHMXdtWXNkaGM2ZExSVm92MDRNTHI4?=
 =?utf-8?B?OTNQUFg0Yk0rYTNWM2huQlJQR1BJY1N3Sk1hYTVCSStMWUluUzRicDJYWkNC?=
 =?utf-8?B?bEMwem1qbStwWFh2TGpvSXZYTWFWWXcyNmYxY3BVZmQzNi9ucG5EZlZ5cDly?=
 =?utf-8?B?R0JvYVh1VUNRYlZ1L3dWSEYvR0djN2xvTWlCd05Lc3lDVEdwUjV1Rm9JblRD?=
 =?utf-8?B?cEh3QkhsOWZJSktybzQrTTl2ZGV5YnpSNXQ4N1l5Rm1WNUdIN1BqYnQ5RjNi?=
 =?utf-8?B?ZU9Rc2NpWXE2RTRrYU5tclZjT1NtbmUrK3k2SGNGay9PZ2VDWHRQNWVsNnlq?=
 =?utf-8?B?M1h1dVllajVnY3dvUzBLdFdOSlZWR1JtQ2VKZUswTnVZcnRoMGJMWTYvS3VH?=
 =?utf-8?B?MjMxN3I3NWVuajBzaDN6Qy9sS3kwTXpDL3BCQjNibUo1WjRkMm91dGhaMzJk?=
 =?utf-8?B?U2lKN2I1cmNiQ2t1cVBuVzQxSStHTy9GTFpoUjU1Y0U5OGkrMXFvdThwdzV4?=
 =?utf-8?B?b1B4OE95TVFxbVdVcWZqRWt1OU9MSm1vZXlFMVR5UElEOW1FM1pKWTNBVVNM?=
 =?utf-8?B?b1N1VlRVWlRSRFNadUtCZ3daS0ZvZExMenBvTURtTXVRK2dDb0toZHlsMVg1?=
 =?utf-8?B?ZGZUYnkraWp6Y3JwNzFJNFBid000bE5QczJkTkZnVkl1MHJwZDJqc1p2T0ZH?=
 =?utf-8?B?RG5LVHpUYWRhMnJma1hLTWpla2NwMnZsTzQweHpWNlZyc3dZczYrYm9yelZp?=
 =?utf-8?B?OGlIU20rd1ZvMFNrWHY4MnJUZTUyYnduam1sUnZ3TTZJM1lHaXh3TTBxdjNk?=
 =?utf-8?B?emNoT0NYd1VsNi9HV1p5YWs2bi9MNzc5Ynl6Vk4vYk9NMXd3NVJJOG41UVdB?=
 =?utf-8?B?bkZ5SFVWUjVMZ3o3UXVSdEpDVjZiT0JpUzBCbVN0VkF1WXFmY2ppV0Z5RGdY?=
 =?utf-8?B?aWZzVnBwMStLVlF6dThzS3VnZzd2N2VJSjhvZjZVaVFQSXNIYTF2enV6Qzdu?=
 =?utf-8?B?VXczMVA5MFRJSlg1UmpKblIvN0wrTmJIRGlva2w2YSsweWI0Rnk3YkZoS1Zx?=
 =?utf-8?B?dGYyUkwrdGpoYVNIVVNHbHE0RncvbklvcWV0Q1p5WEZzM0c3c2hrVjR3TU5N?=
 =?utf-8?B?RTJ4cm5KZUlsV29uaVpLNUV6cnZBSjg4VVhOdUdOYytiR01sU0puSVFaS0Rv?=
 =?utf-8?B?cjVHL0pOY0hkSWkxWUNsV2djM3paUThndWQ0Yk9yb3VyajZUMnFxcHBaakFw?=
 =?utf-8?B?Z2xlL1pYaXJDL0xDc1I4Wk0wYW14ZTE5ZGNZUlZHd1MxWmNyY2hmT1pVS2lL?=
 =?utf-8?B?TTh0emZJZ29jYkRvODJkZUVldHBnWVNKUU00R1JFUC81bWlwN0ZHUWFKT0RE?=
 =?utf-8?B?NTIvRnpOWUFLZk0yc2s0Q3oxSTIxR2NxSnBTL0k5NktRaGJWOEt2VzVxcHl5?=
 =?utf-8?B?eDBSclQ1c241cVVWM25RditWQk1SMUFjOWFVQnVvQ1BBdVJ0UGMxa2MzNDBx?=
 =?utf-8?B?OCtNcDZjZ2tncHFEMGFIVVR1WHV5MzBLWURHMmE0dlpFdnRNU0N3R3NpTEIv?=
 =?utf-8?B?TVV5eE1VeEdOZG9wb2N2TUorb05vNG01VFJrbXgveEpqT2pZQXkwcXA3YzZq?=
 =?utf-8?B?bG1DUndKcVRnL2FOQk1TWFRudmZURDd1VUVqelhBR0VJSGo2Vm1hZHJoWm5W?=
 =?utf-8?B?UVVBOGFLZkZBYjJuM1lWMDUyeHRnUnVTRFJaVEF1Ym5qSTM0cEc1Z1ZYVEEw?=
 =?utf-8?B?eVFzNFk5NE05V0lIMjBIZnV5aUFTWmZFNENtVm1tREZRUDdDNzlRNmkyeisv?=
 =?utf-8?B?aFNxU1FuK1htR3lVMTlPU08weEMxVEZjUm9HUi9ZNjlFTVdwVzN3cDFpK2Zy?=
 =?utf-8?B?RTNMVnFrS1VpRmlEcWJRVzdJQ09YN3BvVmVLQlAvZkdDWWJHa3J0YVI3MGNq?=
 =?utf-8?B?WThrRkUwbHlzY3RpZEUwby96QVpiQnU4LzNvVFFwd2lWN3h6Z1lVK3BDRE9m?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc3e7b6-59c5-437a-4470-08dd6b432812
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 02:17:13.7458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a5IRaRAzDkZVCuN+vDkzKfVJVYLrGGvnQt0uQwabp0tQDp8ij0ZiFYEk2wSYB17m37u5BDhNFurjjHUjQwdx7OD3Ey4EUrVPDsv3pCym0tw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8742
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


On 3/24/2025 6:10 PM, Dixit, Ashutosh wrote:
> On Mon, 24 Mar 2025 15:14:55 -0700, Belgaumkar, Vinay wrote:
>> On Mon, Mar 24, 2025 at 02:07:32PM -0500, Lucas De Marchi wrote:
>>> On Mon, Mar 24, 2025 at 09:24:47AM -0700, Ashutosh Dixit wrote:
>>>> On Sat, 22 Mar 2025 19:47:04 -0700, Lucas De Marchi wrote:
>>>>> On Sat, Mar 22, 2025 at 02:06:09PM -0700, Ashutosh Dixit wrote:
>>>>>> On Sat, 22 Mar 2025 05:57:12 -0700, Lucas De Marchi wrote:
>>>>>>> On Fri, Mar 21, 2025 at 03:45:21PM -0700, Belgaumkar, Vinay wrote:
>>>>>>>> On 3/13/2025 2:45 PM, Lucas De Marchi wrote:
>>>>>>>>> On Tue, Mar 11, 2025 at 05:14:08PM -0700, Vinay Belgaumkar wrote:
>>>>>>>>>> Define PMU events for GT frequency (actual and requested).
>>>>>>>>>> This is a port from the i915 driver implementation, where
>>>>>>>>>> an internal timer is used to aggregate GT frequencies over certain fixed interval.
>>>>>>>>>> Following PMU events are being added-
>>>>>>>>>                       ^
>>>>>>>>> why do you use "-"  instead of ":"?
>>>>>>>>>
>>>>>>>>>>   xe_0000_00_02.0/gt-actual-frequency/              [Kernel
>>>>>>>>>> PMU event]
>>>>>>>>>>   xe_0000_00_02.0/gt-requested-frequency/           [Kernel
>>>>>>>>>> PMU event]
>>>>>>>>>>
>>>>>>>>>> Standard perf commands can be used to monitor GT frequency-
>>>>>>>>>>   $ perf stat -e
>>>>>>>>>> xe_0000_00_02.0/gt-requested-frequency,gt=0/ -I1000
>>>>>>>>>>
>>>>>>>>>>      1.001175175                700 M
>>>>>>>>>> xe/gt-requested-frequency,gt=0/
>>>>>>>>>>      2.005891881                703 M
>>>>>>>>>> xe/gt-requested-frequency,gt=0/
>>>>>>>>>>      3.007318169                700 M
>>>>>>>>>> xe/gt-requested-frequency,gt=0/
>>>>>>>>>>
>>>>>>>>>> Actual frequencies will be reported as 0 when GT is in C6.
>>>>>>>>>
>>>>>>>>> I think we need to document somewhere, but at the very least
>>>>>>>>> in the commit message what the event count actually is. Let
>>>>>>>>> me see if I get this right:  if userspace is sampling every
>>>>>>>>> 1sec, and assuming the gpu is at 700MHz for the first 0.5sec
>>>>>>>>> and at 1.4 GHz, userspace should expect to see ~1050 as the
>>>>>>>>> value. Correct?  I find this frequency handling very
>>>>>>>>> different from anything else reported via perf. Other than i915, are there any other cases you know of?
>>>>>>>> Yes,  user will see a gradual ramp. One thing that could work
>>>>>>>> is something along these lines:
>>>>>>>>
>>>>>>>> @@ -324,7 +327,10 @@ static void xe_pmu_event_update(struct
>>>>>>>> perf_event
>>>>>>>> *event)
>>>>>>>>                  new = __xe_pmu_event_read(event);
>>>>>>>>          } while (!local64_try_cmpxchg(&hwc->prev_count,
>>>>>>>> &prev, new));
>>>>>>>>
>>>>>>>> -       local64_add(new - prev, &event->count);
>>>>>>>> +       if (is_gt_frequency_event(id))
>>>>>>>> +               local64_add(new, &event->count);
>>>>>>>> +       else
>>>>>>>> +               local64_add(new - prev, &event->count);
>>>>>>>>
>>>>>>>> This will give us instantaneous values and will not need the
>>>>>>>> use of an internal timer.  Should be ok to do it this way?
>>>>>>> yes, I think it'd be preferred. It's much simpler and don't
>>>>>>> prevent us from eventually adding an avg_* event if the needs
>>>>>>> arise. Which would also be clearer on what that is.
>>>>>> Instantaneous values would show 0 if the sampling instant landed
>>>>>> when gt is
>>>>> instantaneous values make much more sense from the perf point of
>>>>> view IMO. perf is **sampling** them - other than the same thing in
>>>>> i915, I've never seen an event that returns an average (not even
>>>>> documenting it as such).
>>>>>
>>>>> What would also make sense would be to support perf-record so the
>>>>> samples are recorded in the buffer that is passed to userspace. In
>>>>> this case setting up a timer to save them (since we don't have
>>>>> interrupt for our pmu) would be nice.
>>>> Afaik, typically userspace calls into the kernel for PMU counters
>>>> relatively infrequently, say once a second (1 Hz). However, if this
>>>> low rate does not yield good freq values (say freq is showing lots
>>>> of 0's), now
>>> why do you say it's not getting good value? is 0 not a good value?
>>> Should the kernel be returning something else instead of doing an
>>> average with "lots of zeros" and returning it?
>> well, zero is not a good value because it is not real. The register is
>> zero because the GT is sleeping, but that is not the accurate thing.
> Not necessarily a not-good value. For example, if the freq is 1 GHz 50% of
> the time and GT is sleeping 50% of the time, you could say the average freq
> is 500 MHz. But userspace would have to sample at a high enough rate to
> figure out GT is sleeping 50% of the time. Maybe 10 or 20 Hz is enough, see
> below.
>
> i915 disregards C6 so would report the average as 1 GHz. The 200 Hz
> sampling rate for averaging in i915 was designed based on host turbo I
> believe.
i915 does not disregard C6. If the GT is in C6 long enough, the average 
actual frequency will also show 0 there.
>
>> but tbh we are already taking this decision to our sysfs interface:
>>
>> $ cat act_freq
>> 0
>>
>> But well, for this instantaneous it may be good... we just need to
>> educate the consumers to see the zero as gpu sleeping in a chart.  but
>> zero is an outlier to the average of the frequencies that it will bring
>> the mean to a very lower levels and the charts collected with PMU will be
>> so out of shape to the point it might be useless...
>>
>> True.  Better to stick with instantaneous value in this case.
>>
>>>> userspace will need to call into the kernel more frequently, say 10
>>>> Hz to
>>>> 100 Hz, just to get good freq values (all other counters are fine at
>>>> 1
>>> It should be perfectly fine for an application to setup a 10Hz timer
>>> and getting it multiple times if it wants to average.... I don't think
>>> it needs to be at the hundreds frequency.
> This could depend on how fast SLPC changes the freq and maybe @Belgaumkar,
> Vinay might know what is the typical rate at which userspace would need to
> sample to get a good average.
>
>>>> Hz). This increased rate of calling into the kernel may be ok for
>>>> 'perf record' but not sure what happens to say 'gputop'.
>>> oh no, perf-record works diferently... it's not calling into the
>>> kernel with that frequency. It's perf-stat that works that way.
>>>
>>> For perf-record it more like kernel pushing samples in a ringbuffer,
>>> shared with userspace, and then waking it. We (currently) don't
>>> support that mode in our implementation:
>>>
>>> static int xe_pmu_event_init(struct perf_event *event) {
>>> 	...
>>> 	/* unsupported modes and filters */
>>> 	if (event->attr.sample_period) /* no sampling */
>>> 		return -EINVAL;
>>> 	...
>>> }
>>>
>>>
>>>> I think considerations like this went into i915 deciding to average
>>>> in the kernel.
>>> as you noticed, maybe there was actually a lack of thought on the
>>> matter and then later it couldn't be changed anymore... ? I saw
>>> several odd things in the i915 side. Exposing something with a Hz unit
>>> is one of them.
>>>
>>>> Also, if we are going to expose instantaneous freq, if gt is in C6
>>>> (when userspace calls into the kernel to sample), could we save and
>>>> return the freq /before/ gt went into C6 (to avoid returning 0 freq,
>>>> and returning the last freq as it was when workload was running)?
>>>> This might be sufficient and remove the need to sample more
>>>> frequently, though not sure how complex to implement.
>>> if that data would make more sense for userspace, then I think it
>>> should be ok. So, let's say gt in in C6, what does make more sense for
>>> gputop-like and turbostat?
>>>
>>> 1) read 0 from the kernel and report 0 to the user
>>> 2) read 0 from the kernel and report min_freq to the user (min_freq they
>>>     can read once from from sysfs)
>>> 3) read min_freq from the kernel
>>> 4) read the last frequency before going into C6
> This depends on what we want userland to do:
>
> * If we are asking userspace to read the freq's from PMU at a high rate and
>    then average those freq's, we should report 0
i915 does report 0 as well after a few idle iterations.
>
> * What I was saying was, is it possible to always return a "representative"
>    freq, so that userspace does not have to sample at a high rate and not
>    average the freq. If we can return this "representative" freq, without
>    averaging in the kernel.
Not sure what's the best way to calculate something like this. The algo 
would certainly need special handling when the GPU is various shades of 
busy.
>
>    Can this freq be the last requested/actual freq before gt went into C6?
>    If SLPC is changing the freq rapidly, this would not be accurate either,
>    but maybe it's good enough?
KMD will not know when exactly GT will enter C6.
>
>    And we'd have to tell userspace that it should *not* average the
>    retrieved freq, that would be inaccurate. If they really want an accurate
>    average they should use sysfs.
>
>> The GT requested frequency will already show us the last requested
>> value. Assuming no throttling, there is a good chance this is what the GT
>> was at. Besides, KMD does not control when GT goes to C6, GuC does the
>> idle indication (since we are using GuC RC).
> As mentioned on v4, if we are not waking the card up, the requested freq
> would itself be 0?
No, requested freq register will always remain at the last requested 
value. We are using a forcewake in the KMD function that reads the 
MMIO(blitter power well). This register retains it's value.
>
>>>>>> in C6. Also instantaneous values are already available via sysfs.
>>>>> with the caveat of a slower interface, but yeah... that's why I
>>>>> was asking earlier: do we really need this if it's already
>>>>> available via sysfs? I was told turbostat wants to consolidate all
>>>>> the data to be read via perf instead of reading a bunch of files from sysfs.
>>>> OK.
>>>>
>>>>>> Also, the way i915 calculates the average freq is itself
>>>>>> controversial. i915 computes average freq when gt is awake and
>>>>>> disregards those intervals when gt is in C6. There was this
>>>>>> patch to suggest that average freq also take into account those intervals when gt is in C6:
>>>>>>
>>>>>> https://patchwork.freedesktop.org/series/109372/
>>>>>>
>>>>>> But it was not accepted since it would change uapi.
>>>>> one more reason not to fall in the same trap. Let userspace decide
>>>>> if it wants the average or not. If it'd need to sample too
>>>>> frequently, then I think we need to look at supporting perf-record
>>>>> rather than doing the average (which is actually an integration,
>>>>> using the rectangle method, and then dividing by the perf_read
>>>>> delta time). At the very least, rename the event to make the avg explicit.
>>>> OK, we can return instantaneous freq for now and if that doesn't
>>>> work out, add an average freq later?

Makes sense to keep it instantaneous for now. Sent v4 with that change - 
https://patchwork.freedesktop.org/patch/644758/?series=144164&rev=6

Thanks,

Vinay.

