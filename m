Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44488CAC587
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 09:21:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C0F10E349;
	Tue,  9 Sep 2025 09:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UoODDds8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E3C10E349
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 09:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757409712; x=1788945712;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8c494gUp1UYT1CIlrNprUc67lfHhQkNPL9Uck5BAfnk=;
 b=UoODDds8lnkonIc519cxmMnwiGZEVj1trcCUHmbDCUExcysoqrIn+Olz
 JhB7SeWQLz71+wknER/PHwogsILKZanZV78ex64bfAEEMBcs5tQz1cNG4
 CfuIDyb21qS66zYI+ykgpHOoye7477FqwuO+cH+xDajGd3JuVzFX++qlf
 34+9HMrsqPabq8d6BshNdvMJA8MZXd/TklT//b65T61MsX6nZVM8Q1pnH
 lOrurwvOVqqkCNc7XTFY6shOi30MNb13RP5yOOMTUbuSYnUzd053xczoh
 QDw4jtW71zCY/N8uB62cTcgyG5N/rmQrxukPtb8qitCzWDzWFKPSR51CM Q==;
X-CSE-ConnectionGUID: i/X64pyWTHGFnzR8DITqxQ==
X-CSE-MsgGUID: cxc2dUklQSipfBilT+ryjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59613106"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59613106"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 02:21:52 -0700
X-CSE-ConnectionGUID: QNNQGQ6zSQ+m+Yn23Z9n1w==
X-CSE-MsgGUID: VxNOb1aQRJq7ExrUPLvPFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172302032"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 02:21:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 02:21:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 02:21:51 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.48)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 02:21:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwdMk2Z3i6CpWSvCt+6jMbGb+EISVOvOiU+PcC2jDRvKcZKDzko2OnmSV457fmF9mesOX9yLsjI7eO7GKijwpz2ixnCoEw6GtQ7iVU0uMg/b6LxAcNogUsgmVkknQUeIPt6S5svwaTH8jfiI2+NIUWN4rDuwDZvuZnfw6jbdiutPzzJOfEOnKmbWPpXxWwvp1aBN5FcNcen4t9NzH/gL9oZU+rDHDuR4+P+wNL/3lJI9+VRVEhOUrqmF66KAfLHXOv7Q6w36Uh9BjV2Kh86GZV5eaaf1/0h8WJ4+e57+pwZ95rToAZE2dw2Zi21ZCwIAWMjXa7j07c2fr5nWdLmeYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fr5KvZ1fMbmfDdSFntcwFl/SS1TbI2KHLcc9vJ8wfRg=;
 b=XfbR829SyjfxQyXzSt4AqooInuG9zNQXViolpPHg1rqDgy3drSIrtEyzlbaBaDjPuGnOPhgRnvrYyZtbyIsqtGTXGmH49+LF1A9R48DOaB6UwsT1c+kiR+QKwa8g5FuBUU+BmU9MQMASSOemMMpNgzBGswsrpeRzzWI+VbW6hu0L2cwwTdE/CVVJjMrw26v8K7z9iF6GyaoqFZlNxjsuJhiww+DXKAsDqEhELeieOWLyzP/rxOqA4osV56qXf+vwuLNI/nmPXII1/qISzSc9AA34xt3gkH+5mhIlu7YINprG4mVQu0fs8Av+c9cjLXyqNmMeTv6Bl9AU3z8Hy6skMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SA0PR11MB4671.namprd11.prod.outlook.com (2603:10b6:806:9f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 09:21:49 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 09:21:49 +0000
Message-ID: <a72352c4-43a8-4ae1-9dc9-987f646e60b9@intel.com>
Date: Tue, 9 Sep 2025 14:51:42 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Small_impro?=
 =?UTF-8?Q?vements_around_VF_CCS_=28rev2=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20250908123025.747-1-michal.wajdeczko@intel.com>
 <175739166983.315434.4929150351171117907@1538d3639d33>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <175739166983.315434.4929150351171117907@1538d3639d33>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::23) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|SA0PR11MB4671:EE_
X-MS-Office365-Filtering-Correlation-Id: c26e6c35-973c-4e54-b359-08ddef824dbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWlSRnVFcnBjeDBMNSs1ZXRFQUluaVM4UnhmN1MxaFBhQW41cFBMWmNUaVN6?=
 =?utf-8?B?OXFWL2hESjZLUlFLUUVsa2FRQXphOHJSSWhJdm44Y2JQUmt6eWRtQWtVTUEv?=
 =?utf-8?B?MzYyUjN5L1NKRzhWcFhySkhSN0FDQWE2VWwrU3pMVG5EaFpoZFl4ZEhjNCtM?=
 =?utf-8?B?WWFyRjdlelNHaHRoeGo1OVllSGNjTHVQd1VsSU5nVEMycndFeG9pYXNJcDNv?=
 =?utf-8?B?RVZ2RTAyQjNoZWJ6a0EvODhQWTVzUUZpclZxMzZLSmhZRUFsNU4wVmtQaFo3?=
 =?utf-8?B?OStPcUhBZHBBZWR4NEJ1dU51YWtQU1lnZENwKzhhbWt6RXAzVW5GYUNFaWNw?=
 =?utf-8?B?QlZ2T0libWdUdnpRNHNVZmtxMkdjSkVWL1BMc0w0WjlpY1c2cGtJSlJ6RDFP?=
 =?utf-8?B?YkI2eHUxWnZIS3pUK1lXVTlCcW9NSFI2WVREeWFzTjZRdEdwT05PQnlsMHBC?=
 =?utf-8?B?MzZtVjhEZmFSUm83dmdONHlrbENkYkNJWXNSeGdPSHpReUNhSnNjM25aMEg1?=
 =?utf-8?B?VTRHcDlHY3UvNXp3cU5tR3hrTkZlTzlhMkQ2WnMrVlpCR2M2MFQ1SkJtWGlB?=
 =?utf-8?B?YWFZMURmbUNHNXA0M2Q4cU95VzBDajlseFArZERKMS9VLytGUjEySzNWMTdy?=
 =?utf-8?B?bVp5ZkpGM1FyOVM3WXdTNEFoWjd5bDJaN2RlSTdtNDR4UVp3VWdOM0lNby82?=
 =?utf-8?B?djJoTHU1RU41MVRaMFR0SnJIRVppWURPWUlLNkw5b1Y3U05nSnBtdWZBdlNT?=
 =?utf-8?B?UzhPQUpkUlZUNnR0TkxJM2pOeHFJSXZQNE1sZVdYcFJsb2FZNVFoMW1HVldP?=
 =?utf-8?B?TlZHSTd0RW5yV04wUGJZZk1odE54N292QVJhbDk0cjRmMDVEaFRKdTB6SUJk?=
 =?utf-8?B?RjVoVWl2ZDd0bnBrLzJuVEpyNVYyZ2tkaC92Sk9RUGVVaERxR2crZUF1V25W?=
 =?utf-8?B?b3hSYkM4V1BnZlc3djUyYThYQllHaDlKYmdtektBcG4rWjRPSGNGbHlTbmxw?=
 =?utf-8?B?aXo1UUZETUdFaE1nbG9LRW8vYnoxSFJyclVrMUYySzhVT2tOeDF3T0syMGQz?=
 =?utf-8?B?MXFjNXh4ck96VS9FNkk2RUJrNmw5V2ttZmZZTmpGUXRkWUJZelJVREl3elVC?=
 =?utf-8?B?Y3d6TFc5OHNsWUlTRFR3WW94MmpjdjZTWkpyTXgrSjZEZ29BWUprNHVhUlpp?=
 =?utf-8?B?S1J2QzErMG5VOEVCZW5kM2s3R3N5UUgxSGlYckZNOTEzRXQ2Qk1DbUdFU01Y?=
 =?utf-8?B?bTQ5UU5Hb1pQcGVScFh1anI4RWsxcHpBdnliS1VIaVlRemRkdG14NTgyd1Ri?=
 =?utf-8?B?Y3Y1cmFiMkk0dEh1V3lZUVp4cHFlMWY0UlR0eDk1a2lnV0hoR3R3ZXdEN24x?=
 =?utf-8?B?L0dtSEJTSFlQVjZlQVljTko3cWFmZTUyVWwvVUZCeDFTYU5BWU80djgyb1VN?=
 =?utf-8?B?SjNlRHBjY05RVFVydFZxWjRBa2RaN3pxOTdUazlmM0lEU2M4SnllZ0dMdU5R?=
 =?utf-8?B?V3NQSkw2d2VTTk5zWFNSbjBUdjk1MFF5T2hRNFQxck5SZHBQQXN4ZlJrcVBM?=
 =?utf-8?B?QUZjU3RxRlZMalZ2OE9ySVM1a2tDTnArK3U3VVNrZUZTdlJPYitCWTBHelFp?=
 =?utf-8?B?SXRLekVlc2lFZ0NUT3M3NXIzWll1OW9wK08xQUg0RGlxS3hnc05tRlM0clBM?=
 =?utf-8?B?QzRNMVZoMitZUUx3RDhoUloyZDFNaHExYXNKeDdMQ0l4VktqRUFjZXRWZDYy?=
 =?utf-8?B?ajlYbk85dnRtNHNIU0wrZVk4ZXJhNlZBZTkyb1g4YktFRER4ejZremZJN29v?=
 =?utf-8?Q?bGbcnCIIU75lHZJxI4xyS+xXCcR4RYeHYK8Fs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDhUbjNJR2lyQURncVhMM282UmpMY2VhUkREWVlob3A5L0NaTTBkWDhTallG?=
 =?utf-8?B?TU9TeVVNTzFHakNJQVIwUjJQQkZUa0Rod1ZpVUlzcFdxRWJ5azZodURwTElV?=
 =?utf-8?B?Wnp0K3JnU1h5a2NnekRWckVEdWpSSGdhc1NnbitGMnp0MU0yRDJpcHljWkdG?=
 =?utf-8?B?TnIxT04yZU5UYThrSExtNmY1SUp5dTJpV20yaGNJS1VtWmZEQTVSTlEwTjM5?=
 =?utf-8?B?KytvaXN3eFlHWTdWOWN6WHRDSXZqWDNFZ2tYeEF4VWFMc1dwVVp2RWd6YjE5?=
 =?utf-8?B?dk9YRFNsNHphVmExbldYeUp4TW14VHBRRk9BN1hIbmJwSUFMNVhjb3VKWWJV?=
 =?utf-8?B?aFhwVlVVTE1ZRUhGU3hoSHJpWmNOUit5dFFPR0FURGFyRXU2R2QxUTY3eUFP?=
 =?utf-8?B?S2FNYTBQVHh4S3BvWGUybE1qaFVUUDhuQ3FrZWFOczQ4SHdqSW9ac3BEVW5n?=
 =?utf-8?B?dUF5RGZDODAwc1ZSemFkbnFiT2llTGRBM1BDQWlkVDhGMXF3Q2F4djlkM0Q1?=
 =?utf-8?B?T0ZscWx0Ylk0Ynd3K2ZxOWJ4d2d4YkxPSzNEVFREdXdZeDNiaDFBRTdqRmhC?=
 =?utf-8?B?aDlmTmkyTFRHZC8xTlU0M1kxaWx4dmZsQ0xvRTdHcEhwK2F3SkdNcjNFcWx3?=
 =?utf-8?B?Zzd1dzdBNzRSa3FhTkV5VnRCVTY5bUF4c2tMUjRob1huV29WUkl5Q1d5OFpz?=
 =?utf-8?B?a3Y2ZDNVTFZEWERNQXN5QVF4L0hEMkw4ODA0WEhtR0ZkS3hnblNZN2tRd2Zr?=
 =?utf-8?B?R1Iva3U2R1I3QTJoellEMUYrUUF6SFFRQURJT1VzTjlwVVNrTGFzRUZuVVNh?=
 =?utf-8?B?ZlRYU2d0Uit6aExtaEsrZm1TU2V6cGxZNTJEaGlWeTdoVWk0MGdacUJEL3l2?=
 =?utf-8?B?Zi9EU1FTVFRoWGRnMWdpb1NQMmhlc05Rd3FIUDFPN1puY041c3pUUThBZTU2?=
 =?utf-8?B?TXNXNDlUSjllMy92R0ZkOG1vR3BLTXB5UGowRDZBWjdvcldseTFZU1VmL2hZ?=
 =?utf-8?B?R1dhdXk5a0FrMkEzVTFxMzVmUkhMNG9sbm81NDBzRFRWODlTRVdNc2d6RGht?=
 =?utf-8?B?Ym9VUFdWSzBJdklIZGVSejJlNU5LSTliUjhWWFpNZDdXSFErTE9QS2lhMVpp?=
 =?utf-8?B?ZHcwK1hKbzQrNmcwWmFVZ3hTWnNHY2FaeGtSOXR2YzYyNDgyblgyWHdHN1ls?=
 =?utf-8?B?RG5acVRLWDd3UE05LzJvb3pBTzZpSURPVFd2SHk4WmR2WVRsOStOYnFIbUlO?=
 =?utf-8?B?L2hmTjF3cjlSalNkWkpkSlNxb081KzhIdzh3WUo3UlE4NGMrL0c4WWVvM3J0?=
 =?utf-8?B?ZThMTTRIcFJVTUcwUzZ2K3M2NHJ3eHZuTHF0ZEVkUkZzY0ZNdVJxdStWOXlj?=
 =?utf-8?B?SmpJMGQ0eFRUVlFIYjhTd3pqV1NQSk10b0dLUnJGaWE3TWs3U3oxUEtJRGZo?=
 =?utf-8?B?MDRoMGxram1DQzFYRlNEdlQ3LzZwSEZMVjhDYXhaWVI4WDVmbFBuZ2VKNzlv?=
 =?utf-8?B?OXpKTVE4QnZhNFRvcUsrWHdhb3l5cW9CelBmdUx6OXE1UEduZHhMVVhJR0xs?=
 =?utf-8?B?K0RuSnhIa2docnkyRW1ReFRnWUtkZXlYMmdBQ3NtVlNWUWt6anFHUHNlaVBu?=
 =?utf-8?B?M3BlZFhsblpMSXBIMlVyV0pJL0R5RU1KUmlCUE53VXlzWGVUWjg4VVZDS1BT?=
 =?utf-8?B?MEg4UjdMRzREU0FqUGRvV1Z4RXdSVW1VdzNiYVJHMFRHUlVJeTV2b3M0by9M?=
 =?utf-8?B?SFVsU25CbVUrd3lzZGs0NHZMOTEwOEY3QjRRTXIxNDg4SHFjTTNyTTdHRExN?=
 =?utf-8?B?cUNPVG40OVRPaFdjZVJJTE04SVVGOEpVVmE2RW0wQVNSZWUrS2RtMEFsZVNa?=
 =?utf-8?B?NEdRRGNiMXdTZW0veTdSNFZqb3VtZjBrc0loRDQ4am5odTU5dXlHb1BLK1ky?=
 =?utf-8?B?SDJPeTlxYTBrczh3dlJteFY4Y3RIN2o1QVR1dGNZWjQ1Y05yNDlPZDh1Wk8r?=
 =?utf-8?B?WEp1V1JOam45cWwvNnRSaTRJSVpHWFBSRU1WZ3FoZ3Bwd2NkWFFzZk1idk8y?=
 =?utf-8?B?b3NpRFNoZ1pDMmQ0ellEaUJOR3pnQVdlNFFvUFpNZXhwdDlwWTRsMHVHNkhY?=
 =?utf-8?B?VUtwelBBYlhLWDdkc3JLbG1mRjkvWXNHdEtsSWhkRkN4OW1NWk9EZFp2ZzQz?=
 =?utf-8?Q?whUAUR9MmT8j8AsEKb4UAX0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c26e6c35-973c-4e54-b359-08ddef824dbf
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 09:21:49.0700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M38+KOsk1BtkyIjvxxApnpxZ/4AKp+t8jxg0Qbi6hLwU7V918AqGNdSZJsdp0jr5u67W7yzF+iIPzcL80Gj8mb2P/nZ4YoKpqYS0+gPUGCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4671
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



On 09-09-2025 09:51, Patchwork wrote:
> *Patch Details*
> *Series:*	Small improvements around VF CCS (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/154054/ <https:// 
> patchwork.freedesktop.org/series/154054/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154054v2/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154054v2/ 
> index.html>
> 
> ERROR: The runconfig 'xe-3704- 
> d45ca10a9305e2c3658bdb677087f0f88e57f6c1_FULL' does not exist in the 
> database
> 
I have checked this series and it works fine. Looks like CI is some how 
broken.
-Satya.
