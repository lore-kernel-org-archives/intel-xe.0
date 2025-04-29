Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B813C369DC
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 15:59:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBF910E41E;
	Tue, 29 Apr 2025 15:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AjRsEgxg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7532410E41E
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 15:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745942344; x=1777478344;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hzcgA3TMUCzloaCbgDhrbgg4UVt4x4hE7sU+Q6Xr3DY=;
 b=AjRsEgxgjNpb5PYpqOtExtZ3dEAENUU/IbHTgD2XrYQghhTykI0jS8ef
 3w2lxR2qUkWe1KK+tyHylQxXuXmU5JDJzZi/3rQ/Cfnl/eYlpCmsgPrGz
 adkUSHuMGom7PQ48U6F/6AqJQ4harW0Dqr48liN/EiJu9GH8u85LhfzpU
 fFnJ/XYDR6bqImQpw93pJkwavVwT5Nh/XwsPxqljWa8RvO6tanqboeMlj
 Ek5LJwoUgSgQTDse6NG1Pnkiq1Z9AUglKPyCvdTbxdfPhIR3wqBx4Amyq
 Ww0kq7WfUNtY0+nQnsPkecV5CMHj1UlDP4drMZ9Ga+tfbGsaPEOB9PANx Q==;
X-CSE-ConnectionGUID: 8wxGYjDlQhudMJNOSjKyXQ==
X-CSE-MsgGUID: T/DjUX+KSfKBvTjjlKWQDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47284555"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="47284555"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 08:59:03 -0700
X-CSE-ConnectionGUID: cQLGSlWuRqmrooK4EsV6qQ==
X-CSE-MsgGUID: Ae3JBhB1Rp2kpWeW3DbXXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="171098379"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 08:58:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 08:58:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 08:58:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 08:58:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yEqdyPlCTHpoVo0Ch0shMYx/a3ZDbL5szzL5cj6KqotxrN+z/5joyg2l1kI25cwQp4ROVxqtd5xEg4kRh/NY2pO5x/DJGAImMQ/JGuIh8/Ffv4NOFfWLQohk5TkxfopYSpvvycMwR1QpjRsJxeOHDxLlfCA6ev46wX+RgRdahPffly6UwdxQn+MHDRcyf6IUdrDzY9fEkBq0g36RPa1PYlTZ7snd0ZkjNoZiIvgxjzDeYcp/vXtOR/0P8uWkSCjaM6K8Md2D3q91cEDXByZKatL45Cjk+2L56T8LfyL/Kb+X4UKrtWo/noOy4aQZa5WouPyMsTWAuOmDG/bApGM2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APfCuzjhaJEbgat7nJ6BCxy9hCgjtRDF50t/zpo6+Lg=;
 b=uo5OSS/RpU8W/dWEnQzkn4JEca/NtAPT4clArivd1cAshesnfv2He8JSZqvZA0Cjtt3JkZjR4I+sovHErzF0QXiClMY7tsYuei9B5gz45bU4zLGsFJhVX7/7t9/y3m8nfMzHxhmBAJEnXE8JeyunIa/0Gl2XqtFV3FRiyciDm0QvrmUQGtVJrVvHIRKY14lBCBf5A/05AjB2T2BfSGDuZYCDjDDVcpnckGeTEWNss3GI/5USsrmXCRaVkezHR9Oti19W94Vy8/k5qMn42iWQ95NFjUV2WlnoDWyGTDTcgvqj+9QOuN/mP+qwkGQ4Pz4XxS5h2S5MO8pCW0jktJTS0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 15:58:48 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 15:58:48 +0000
Message-ID: <9fdc5f8d-3cd1-46cb-92f3-7257315030fa@intel.com>
Date: Tue, 29 Apr 2025 21:28:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/9] Introducing firmware late binding
From: "Nilawar, Badal" <badal.nilawar@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>
References: <20250429073804.972137-1-badal.nilawar@intel.com>
Content-Language: en-US
In-Reply-To: <20250429073804.972137-1-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::36) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CY8PR11MB7134:EE_
X-MS-Office365-Filtering-Correlation-Id: e3250d2c-03c1-4303-d361-08dd8736ba0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0w5S01Qc0w3Zk9QeDQxMDlrRXRVQm5PdjJvT25uTFpiNE1uTThiQlBURXps?=
 =?utf-8?B?V1Y3SlJCRHFMTHNmaU5EQ3d5VzFOSk05dGo5aVgyOHpyTHM0QW9sY0g1WkVB?=
 =?utf-8?B?ZDJrekNXM2tNdjFzZ3NvOGgvdUVOVGJGVndpRWwyeG00eGc4OExIeUlZTEJv?=
 =?utf-8?B?a3RkclM3ejVsSXNxemF3dkVUVGFpS2N3Z3l1ejFBeW9FeXZ1TExYaExqS3Iw?=
 =?utf-8?B?dVhCSlV4Mm9lalVDMmtNMnF0cFRkMzlzTEFyMEVYbzBCaTZ2UHNGaVk5Tnkx?=
 =?utf-8?B?SE82WDY2NE5NUFBHNnBlSFNpNGpYWGxhbGRlcnQ3V0FUR1h6UnlQTFpEUHhp?=
 =?utf-8?B?TThsMU5YT0tsbFJ4dVFjdy9IQmoyRVJWaW5tSTZSbTdHckJRT216cGt2MjNo?=
 =?utf-8?B?eGdxRzl6MVB3aDJsMVFrRUR5S1FjOFQ0ajBJa3VtQWRxeDdvalVKUnkxTWtl?=
 =?utf-8?B?MVJUbkRDZzN5NG5yR0RleFNycDNyQzl2c3MzOGRkSFhQdmw3Uk5oUWtLSEhU?=
 =?utf-8?B?UlZueDN2TW9EaTVtaExocFZjYU03QTMwMVEycHVSbmc2aVBUMnFKMmZxVXg0?=
 =?utf-8?B?blFmalZPdGcrWURMc2ZIVGhWZ2RNMEVyNjF4cTNTS2hTVThzNWllVk5VcHQ1?=
 =?utf-8?B?alNXRlpwc0FZZDJmaS9iSDJVVXdBallRbGE4S0V0dnBxdHRDOWNEQU5lT29n?=
 =?utf-8?B?amd0d0tWSGpDREFIRFRTRVdkZ0Rld1pwNXo1SWhOVWRqT0tHTGxva0lua3FD?=
 =?utf-8?B?ZjRlWTFGMXBoSVhmMXU4MGI5OWorZXh4WVlrM25BcnJnSmt2Ykg1bmZSa2Uw?=
 =?utf-8?B?MkF6L1l6UE9TNHlHOHE3Y0pwNVBsWTdYWEFFSVdIcVJWOWxONEF4aVVWbzBD?=
 =?utf-8?B?c2Z2dVNDWEErWVhrT0lqYmxBbHJCRTFuZktuNlhjKy9XSnowK3VnQ1BwZDIx?=
 =?utf-8?B?SUF5WkVFTHVpb0NOOElXY0lmWnF0QUhZTTNXYXZRM0NnZVJFeGhKK2tyNXB2?=
 =?utf-8?B?MkF2UlR3UFllaG1vUHZOQitpYTZWOGNDZjVKcHFDLzd3bmlEd3AvZlZObXh2?=
 =?utf-8?B?b2NZZE4ycmp6ZS9JejBjcDgzZnhpNjNFTGloQ2tpaUw2OFk4VjU4Y1Z5d2JV?=
 =?utf-8?B?d25hTXVCUWNSbFdXeHFjVjJJVkpxc0J0NTc4enY1aDR2cHpkbldLdWRlSmVx?=
 =?utf-8?B?ZmtmRnZSYUhuSGs0SlZoTUJpeVh6dU0yT2hXU2VuZkQ3aG5NNTBRVzA0aW1s?=
 =?utf-8?B?YU9pL3B5ZUZ0Z1RzY1dCNDBWcEpRS0Y5U1A3Q1hHZkxUc3RsZi9RTGJJbzli?=
 =?utf-8?B?Mlp1VGc5TkN4L0ZwU3Y0bDBoNTJPRmdudk1uaW1RZXdqekJiS0NlbmVRajRI?=
 =?utf-8?B?aVdiMjBHY3JNNEdzK1hyalVxWlFqWC90T1RuRUdBcWFnMU5PRjBIRHM5Umto?=
 =?utf-8?B?Q3NhUXNna3ZscEF0UDlaQUIvY01GZ2wvbWQ2QVduVUpzQmtla1gzZC9YS2d0?=
 =?utf-8?B?dWk5QWlVdWtkRnBic1JFS3hWNUI4NlBRWmx6RmZkc1JsMFlZRFpjR3RtS0dW?=
 =?utf-8?B?OVZHRi9zRGVMZDJSRG1xcU1IOVo3eHBCRWVpdmxLT0dxWmVIeFJSM095QnlE?=
 =?utf-8?B?cDN1Tkp5a2UwNWI4SjFuZ0RtOE5VU1FIcWxpa25uRTl4RDBpdHhlN1NKQmdI?=
 =?utf-8?B?NzNkUzQ0VXMxTklhUExxbEp5b2NaeTlkNGR2OWoxTWNpWnhFUFlmMEVMV2Qy?=
 =?utf-8?B?RzZuTFlJOFRyekJ3SFdjeFdiYXdLYVlpQnV0Q1NQU2xyUWNLTnBDVmJTOTJp?=
 =?utf-8?B?TXRhKzFXaTF4eXZnR2l6NVhjeW5samFPaXFqRy9UekdGbkpDRUNobERrU1JE?=
 =?utf-8?B?c3k4WVFWUjJFOElQWUpabnlaRVMrYWp3YXFxSEp6cTQwcThSNzN3V3VLRndH?=
 =?utf-8?Q?D35TcPl/msw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2E0akxiYUwvbE9QM0lvWGxMUEFNVWpMTm1pczVJaGVZZkVOMjQyMDQwSFhx?=
 =?utf-8?B?YzRWWUVHTkZ3WGwreUpRSXZNVnJQT3o1QjUxd0FxZmFDUG1heFMzcEFoVGlT?=
 =?utf-8?B?VUttNnhBYmR0QmNKSFNDb1E1OUxhR2V3VGkyc0RsQm1YVWx0NWJxRUxxc29y?=
 =?utf-8?B?KzJRZUgvMjRQeG51aE0vdlJydTVSbXdBTHhrc3NIUmVLMFVxS3A3MTNiSDFs?=
 =?utf-8?B?a0pPOExLVW5IZGt4R2ZweUUraWxobFFGWHcxMWhVR0h1S2JOQ2NsRWpad3U2?=
 =?utf-8?B?L29HbnYxNVJVeVpOZUFzNkdDTEJSSEl0aDBvYWljOW53SDViNWRYYW04V0U3?=
 =?utf-8?B?K2l5UVUvMndsR3laZU81YlpEbjJRZ2tYL0tCd3lGalAyNStLdElQbkZsdURs?=
 =?utf-8?B?THlnQzA3ei8ydFcxdWRUdVpkeUttcUhrNWhtTGRHMEhKUkVPczV6NHFJWWlK?=
 =?utf-8?B?KzhKS0Fxdk5qTXk0UWdDMFp4alcxMUZWWkJZTTJGWlplVUNiWkNub09reGtx?=
 =?utf-8?B?Qm9VQVdPRlAwN2pLd1VqQ1FYUXZWMVptajd4QjFXYjBGazd2dU8yNFU1RDhy?=
 =?utf-8?B?RlpQcUJJRlhWbFNoWHpGWWpQZmRuNHRFR1FMRGpRbTh5S3QvdDNvSHRSeXNR?=
 =?utf-8?B?bk9WTEpPeEtkWGJsWVZBcGFxMjN0eUVvOWFUSHRJQjJnZWVodXM2U29SQlla?=
 =?utf-8?B?SGpNOWtpRkhLaG1EK2JOY3d0RHNzTEpOODhMUjRTdnYzZ1RvNjBYc2trYnIz?=
 =?utf-8?B?djZBQ1NZNmJEVWNDdjR4N0JuYnRkY0ErSmV6ZHpJbjRaZEwwRE5jYU53aGwv?=
 =?utf-8?B?ZDVtUG1JeTRTSHcxZHV1ZWx2YVBQL29PUFNGbzkrQklCWWRJbTVZcDUvek9W?=
 =?utf-8?B?SkZYLzlQYkVjQW93SWk1R0ludEhJdVFreHJ5U05wbUdxTUZsM1k1ZVNYSUNY?=
 =?utf-8?B?YU43WFJ4K0wxdkNhMFhNSkNSb05GWlgyS20yMVMyZDk3ZTFUTFduN09qcmFJ?=
 =?utf-8?B?dWV2ZkVYUnJOR3UrblRDVFpvWis4VHZEUmhZbVdYdWt5dEF6ZGdmRFU3U3ZZ?=
 =?utf-8?B?Qm5pMHZpKy9Fc1lyYm83SEdLTzRjTlJJVjJTVjhvanJRUEswQjMyb2ZkeTM4?=
 =?utf-8?B?cUNlRy9WUHlDRUk4WkY5UnkxQi96ZnNBWmZZcHVTc2FjSzJBdExRMFRUbHpz?=
 =?utf-8?B?Y1hjcmVvTTEzb2RoRU4wek1qSmlhRk9uQURrOEFBdkt4LzVxTWVXclp1Z1ds?=
 =?utf-8?B?YW9nN3drYWs5UTYyNnZSKzJZaTBodHB5bmdmRHFON3hyZFhHSnA3K2tjVVpN?=
 =?utf-8?B?Rlo4b3IwdFBJcTh5by9BblVuc2tMazVvM29CNGlUQWdFS3dHRWRQemJoek8x?=
 =?utf-8?B?MHlBUTFwN3Q1WUtJQUZmcVZ3Vmc4R2ZiZUhyNDJjOG44MGZnTUJJLzF0RmVI?=
 =?utf-8?B?VTlsNGdacTRYY29ZY3pqaStzME5nbkV3YnhUVUdGaUt4NGI3enU3Z2FnOVND?=
 =?utf-8?B?c3hkU2M1VmFPMzRxcE41ODVKM1lPTFRPcXBRRjJBTE44bDJkZ3YwOXRBUEJY?=
 =?utf-8?B?Y1R1cG82cGcrQWsyQ2lvcmpNQTQ0dkVBRkpnTUtKYUtrVDVJYUlwOG1RRjNz?=
 =?utf-8?B?TVpEQVNGSEpkRnZSRmxXWTg0OHhFWmtwc25TZWNjTXgyNjNiaXJwM0JDMjYw?=
 =?utf-8?B?VXNEdWhyS1laSnpNM3V6QVpvMGQ5VmowakdVS3BMYWtaa1RPMEF0VWJPQnhy?=
 =?utf-8?B?L0dQWDNQcUZnTVVZSU5ocTFsSTQ1Vm1NVnhDeFVPazFVTUxEMkZvTUFobit3?=
 =?utf-8?B?MTZoMjZiekNPcHpVU3VLVXdxNStzMzJkcDU2Rkh1NnZ1QzBmMVF4d0hGQXFR?=
 =?utf-8?B?WmxVa1RiZzQ0WlJlWjFMMGRXU3p6TnVOcFpyK0tscWM4UEtqUTBvZE1leGlY?=
 =?utf-8?B?VzF3UVVmWU1IbnJxL0tJNmIrT21meExCQmNKM1R1MlNidTRNejhXMGpobU9a?=
 =?utf-8?B?T0lTdVAzL2JlVmtCZVk2QmZRald0bFRaOFF2K01pdnZubmwzYUJBR0UxaU5K?=
 =?utf-8?B?Y2w4UGhiT2NQd3BmeUdEekJFSzlzeTRjeC81b2VNM1JHMVdQYkplSFZqdUN4?=
 =?utf-8?B?c1VoTUZOajZVYm9kcGhndDh2TEdqTlIvZWhoaVlzNC96K3dkM2prN3J5aXNV?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3250d2c-03c1-4303-d361-08dd8736ba0d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 15:58:47.9662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WbvNBwXERRzPZISJlfiO7sI9pddyLob4l4oJRLb4CfCt1iZ4tKHlDRl1QnTipYhsCP43mX8mL75ODOdCrDz5wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7134
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

Please Ignore this series, I will send again with correct dri-devel ML.

On 29-04-2025 13:07, Badal Nilawar wrote:
> Introducing firmware late binding feature to enable firmware loading
> for the devices, such as the fan controller and voltage regulator,
> during the driver probe.
> Typically, firmware for these devices are part of IFWI flash image but
> can be replaced at probe after OEM tuning.
>
> Alexander Usyskin (2):
>    mei: late_bind: add late binding component driver
>    mei: bus: add mei_cldev_mtu interface
>
> Badal Nilawar (6):
>    drm/xe/late_bind_fw: Introducing late_bind_fw
>    drm/xe/xe_late_bind_fw: Initialize late binding firmware
>    drm/xe/xe_late_bind_fw: Load late binding firmware
>    drm/xe/xe_late_bind_fw: Reload late binding fw in rpm resume
>    drm/xe/xe_late_bind_fw: Reload late binding fw in S2Idle/S3 resume
>    drm/xe/xe_late_bind_fw: Introduce debug fs node to disable late
>      binding
>
> Rodrigo Vivi (1):
>    {fwctl,drm}/xe/pcode: Introduce xe_pcode_fwctl
>
>   Documentation/userspace-api/fwctl/index.rst   |   1 +
>   drivers/gpu/drm/xe/Kconfig                    |   2 +
>   drivers/gpu/drm/xe/Makefile                   |   2 +
>   drivers/gpu/drm/xe/xe_debugfs.c               |  42 +++
>   drivers/gpu/drm/xe/xe_device.c                |   7 +
>   drivers/gpu/drm/xe/xe_device_types.h          |   4 +
>   drivers/gpu/drm/xe/xe_late_bind_fw.c          | 289 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_late_bind_fw.h          |  18 ++
>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h    |  97 ++++++
>   drivers/gpu/drm/xe/xe_pci.c                   |   5 +
>   drivers/gpu/drm/xe/xe_pcode_fwctl.c           | 218 +++++++++++++
>   drivers/gpu/drm/xe/xe_pcode_fwctl.h           |  13 +
>   drivers/gpu/drm/xe/xe_pm.c                    |   7 +
>   drivers/misc/mei/Kconfig                      |   1 +
>   drivers/misc/mei/Makefile                     |   1 +
>   drivers/misc/mei/bus.c                        |  13 +
>   drivers/misc/mei/late_bind/Kconfig            |  12 +
>   drivers/misc/mei/late_bind/Makefile           |   9 +
>   drivers/misc/mei/late_bind/mei_late_bind.c    | 261 ++++++++++++++++
>   include/drm/intel/i915_component.h            |   1 +
>   .../drm/intel/xe_late_bind_mei_interface.h    |  49 +++
>   include/linux/mei_cl_bus.h                    |   1 +
>   include/uapi/fwctl/fwctl.h                    |   1 +
>   include/uapi/fwctl/xe_pcode.h                 |  80 +++++
>   24 files changed, 1134 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
>   create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
>   create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>   create mode 100644 drivers/gpu/drm/xe/xe_pcode_fwctl.c
>   create mode 100644 drivers/gpu/drm/xe/xe_pcode_fwctl.h
>   create mode 100644 drivers/misc/mei/late_bind/Kconfig
>   create mode 100644 drivers/misc/mei/late_bind/Makefile
>   create mode 100644 drivers/misc/mei/late_bind/mei_late_bind.c
>   create mode 100644 include/drm/intel/xe_late_bind_mei_interface.h
>   create mode 100644 include/uapi/fwctl/xe_pcode.h
>
