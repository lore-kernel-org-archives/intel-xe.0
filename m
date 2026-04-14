Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD17F34C6B
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 04:33:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650F710E09C;
	Tue, 14 Apr 2026 04:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EWhwMdnW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52AE210E09C
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 04:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776141192; x=1807677192;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qgrIQF4cvN0IWVEI1NTFqhS0BoQgXOjPvVnn2qFlLjM=;
 b=EWhwMdnW/VmrmfnTzG/809sDCBWXGvLeOGmi3USC2/AW2esSgcn6t7S1
 gNxMhYscbBkndx4cQgWmHx5oiN+19MCWi89Ew1aFizh8dJdbAhYnxA8lJ
 R4UvgcQ9dr0gwHMYACSbK66reA0G6njBDDA1xqXzrOAJhoJYIngCYO0iy
 et1It4FbgCCUqx/BjWiBbpXTv3qDH1xy60yN6UWo66K6YRjNcrVKBDA7E
 g51CMwrI6ziR8VHExBLCAJswRq9enjD1beJr64cVGg2qme1THLKpLsIkT
 fnujIY0IF648QF7lrE3SQMBnBtkovp/KZDNkr6hNtgYImUDOTppH8mxcF w==;
X-CSE-ConnectionGUID: ulggEJ+9TfeMCUaTIMP/8g==
X-CSE-MsgGUID: H+oMNTmkTOG57IqlaPuW2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77197737"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="77197737"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 21:33:11 -0700
X-CSE-ConnectionGUID: lqxzQXoxQQ6LBJg57Qyg6w==
X-CSE-MsgGUID: Z+BrZnzgRmuiTOqVfDqK5w==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 21:33:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 21:33:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 21:33:11 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.55) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 21:33:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+fQUzaYacr1D4sRngz8n02nnMFpgsDFXgLJNZy3Ot27YW2arS/rnV5Iax9D1IcBChvgWw8yKunfMCMHhdgaInCSa+e+9qMezuNISGnmSzsLzzZ5nPHZqQnki8VBiPx6HDPXPGlC3bnj3y/Yp/buK6PfRLTGLu9TcNnPSFYg8AazE7oZQCg2NwDP01BStWiAi+9BuG7nqnsWsp8X34moD4g+eTlpqw6/96bzGUOvQW2Aioo2yeJzYtDnK8V29JYpbU57YzrzZOpOLUPMuU7L6lLhKMEijjsm/I8xwy4eEzthZrIclrxD6KWapdbv50MtAbThfvTgWzATh7jbZ7nvXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSfOw+Agrvlwtt8rDru5OJ8iPKG0MZkZWKUC/YnuNv4=;
 b=IRaoJ44Xk59oFi+v2E3cI+KYxqgSvx6nGhZqjZ2Shp9DHvnziHhc+iQ+F45eKF1qP/CIHU1w5L06AgZPRA+e3/8I7RZy9cBqVCJGSiSqW9HjmjLF4uuTobX3Dq90n+zbwq5a9vN4gKGFM1agi1cn3rNvP9VFXxuzhxk4k2zTPwhQ5LkypNlEnLmr/89icHrM7y+gO44Vy+WMfFODoDk21wMbA0wjFWsLIVY8alE0k9IwqDPpbhooZbEwoIdTuxs8wfAQJlqr3VJqcDvQGf5uFVcmOdKWP6HozQMTo122Dj2hcs6JogtGup4epZW3vvpIiJdWaBM+/xTMGWOykkj6EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.48; Tue, 14 Apr 2026 04:33:09 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 04:33:09 +0000
Message-ID: <91da4b75-0f61-469c-9231-fe632325f64e@intel.com>
Date: Tue, 14 Apr 2026 10:03:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/ras: Clean up coding style in xe_drm_ras
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Nguyen, Brian3"
 <brian3.nguyen@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20260407225913.3397059-1-shuicheng.lin@intel.com>
 <20260407225913.3397059-3-shuicheng.lin@intel.com>
 <SA1PR11MB8839B6A60B4934022AC2F0FEAA262@SA1PR11MB8839.namprd11.prod.outlook.com>
 <bddccc37-87b3-4451-ac34-35f2ce22ac10@intel.com>
 <DM4PR11MB5456D44F0891F8E46BE9827DEA252@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <DM4PR11MB5456D44F0891F8E46BE9827DEA252@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0215.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS7PR11MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb74aa9-f747-44e1-5a1d-08de99deedfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: KZiFCZorc69W0eylSOoqEwDXfpWV50UDrRDA+xt6+boDiztpxf2ig6dMvr6C/Wr1JIfsqe28B+KlUsJAsUduuMmE/lf5QOz0AUCglV49aGJUyI6Ml6dxzzU1LzhIdDI3A2n1EifFw/6MGY59JoXPYpNymkbr7WwOJo/6eJIqwJ0Fi2JsB+5PfWCDJ4V1TqKR6Z13HIVKyHHOC8pwfvaHlQFZtbEJptRfYOlw7p/bQu8u49nSGCGkjMU5GgUa1JW1QbvSu8bh+XMtCp0U87+sQC2dGpyeo1/XQHLt5kiwCl2vjER7aeTiF/JZWYK73zffYFJzkvcN5N/qT8lLPRv+6U+vc008k3VLNmRtqu60g3fiiGjEbcsgJpRvMh9oKeHN5EnqG+6NNW3vKc7PGNnU7u3qzQnta/Ps2K3RuxkuaiRePlNpRoRDccuY/Y3/AVObhWpRxPQSzAB4BjoZq7QiZPxWx71y3nVpmqkDV5gLhz4XndQ+Zd1M7b2VzqNlnXmpVxc6iZAD6rV9NDnjLPeLHLV+rjN24gg97wRhxaMqeKqD1cfAmVTM1cItt20eq3cd++WQRJ8JAsQ6Qi+3hVIMv2SuFse+GOXU/9LLjZTMAlMAJjRiEyGVMv4sJ4JUxQcKS3wYxc0rpEsmSgTx1tJivZy8e2ghXpdEZDnBjKYIYJqDmUmjLxojxuypEu0K7v2HJdNvCqC/6jEF8GbODusAK69zTon6y9El7SYu69QdQj0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anIvMitQVjI4SU9LcTB1bHZwem1XQzBPeUI4WHRIWmtQbHBLY2xZa1NDUWZ2?=
 =?utf-8?B?c2VBUHcvbzN0UVFmZ2tIL2Q4M2U0dVdLeVhJSWhPdXpQendrWlNoWjF1ZjRV?=
 =?utf-8?B?YWZnT3F4aktBWE8zb1B4WnJyU1NnWnhpVTBnK01hbElERGpSMHUyOUpaQSs3?=
 =?utf-8?B?ZDYvaHc0RmVYUDNTbkdSM3QyMWJSbUhzM2dlT29ITUltcHVMVFFVcXBHMkdR?=
 =?utf-8?B?Y2NpVUJNdlhIZ0VYNFN1MWsrUlZEeDlCVHQ1d2M4dlJ1NS81KzVGL0pPUUIw?=
 =?utf-8?B?alV1UmtMUmZRa3NMcmZ1SzBhVzRhQ2x1cVJIY2RkZXowUENjT2RwTkxEanN5?=
 =?utf-8?B?d1p6WGJUeEVZOVFETzZOem15WS9kMGU3QjBzTk8wa004cEsvdnYzQk1Fb0dX?=
 =?utf-8?B?YzFIM0hTTVBFbXVzbDA5QTdJODY4RXpKQWJFbitCWFhRL1BqdTRoazliN05S?=
 =?utf-8?B?bERVK2lWSDdFeHpqRXpMMi9PaGdJNG5YZHd4RXVnREhyd3VDY1NIOUlCcVF6?=
 =?utf-8?B?WUpnNzVsTFB6UDdhR3lNMC9sMWVTMVpqc2NFQ0RQNEh5RWlmK0sxWmowQUVI?=
 =?utf-8?B?VWo0aElObEJ1VHhHaERjblJleGovVW1wbDRiQnpVYW5WWGJWN2RZUmtMOUdu?=
 =?utf-8?B?WWUzK2d4UGkxb09hYVRWZnoxRW4vL0x2Vk41MWJaU2piKzl6UEVUbmlxeUV3?=
 =?utf-8?B?ellRNlRMaGtGZUdkNThHK0s2NDdiNFBUeXJycjdsQkdLWE9iUG9qaDZ6bm81?=
 =?utf-8?B?UGZSUmFVV1lkbVFPMWxRMjVKWHMyWXBYVVhkNmV0ejZacjN2TklQenNEL21u?=
 =?utf-8?B?aS9NR0FuNVZVRjJYbFl4VFNTdm83WkJINjZTbWdiVEx2dU1nWVU5clp0Qld5?=
 =?utf-8?B?ZHRsWTZjTUdTZ1JUcUlBTzlrbHAraGNZNk5CV1VjSEsxSVN5TGUva0ZNMkNo?=
 =?utf-8?B?R3NZZUhSVkJLZWRPcWxxdk1XR1RVNFdVQkdjL1doSnB3cG9sSFhaTzlaMmZn?=
 =?utf-8?B?dUFEK21senlDc0RHelJMWFIwUW9OZWluY3A3ZFQ1Qm1xQXAwWFd5dktYQ0Ri?=
 =?utf-8?B?TXE1T2RpUkhOTjBPRzVMamZLeVB2ek9ZZUkvbUVaVVozUy9OMUI0WVNyZTBU?=
 =?utf-8?B?ZmJJc25sVGY0Y0dOS0gzbFZkK1pDTWNhTHFIMlJ4Y1c2eVpndVZBZEFwSzAv?=
 =?utf-8?B?VjllOFl1ckJPU1NPNnEwMk4yRkNXV1U2cjQ3OUdrTVFKT3RZcG1YcWtrMkJY?=
 =?utf-8?B?MDV5SGp0NlRrQXJ0K2RHR0d3dnFMVWZ2clhoY2N3M1N5NHQvd3JEN29ONk1p?=
 =?utf-8?B?Q1J5aWxIeGJyWjVpdTlIaEFva1JYcm44ZTgvdnJQLzRneHFDYnN2YklTUnNE?=
 =?utf-8?B?anJZSWVwZXpmRlE0ZFkvRnJNZlZqUFJWaWh2d1hYUWNxUFEyL2tJM21kM3Nh?=
 =?utf-8?B?ekJZZm5uYU9Hb2JaNW1GQXVndjYwdEhFcWdzTWdlMXlUZGRJRTBxaFgvc05u?=
 =?utf-8?B?b29kTVQzZDFtQmkxeXFsRW1NZnJ0ZGtPRnJ2a29FeFNPT09ubk5va1dyRFZl?=
 =?utf-8?B?N1NSMHBnQmMwTnR0bmpZamZuM0w2ZVpyRXRLRGhuSnE1aFM2dUN5eG9PZ3NZ?=
 =?utf-8?B?emlMTXpDS1gyRmtiS01YWktTejRLd3dzWWJrK2lYTEMzVVUwczh3TWhneGZ2?=
 =?utf-8?B?WmNkT2pFYXBLdEhWSnBDRzZBc3BBSEg3enVKQzhnYm9IYUs2Q2lYa0hQNTNC?=
 =?utf-8?B?Ym90Q0tGUS9XbGprdlY4QWllRlo2Zm80OUtIVkloWERpZ2RPaWdLaWJ5dW9P?=
 =?utf-8?B?ME81VjhaU3ZhalhZS0EyV0VnaGZnQ2FwclcwVGZJMWJlL1l0enFEQzRTdUF1?=
 =?utf-8?B?K2tKRTlVRC9hQ1J0em1QeklvazlZTFhqM0xzZ1JDMnVhdTYxY2lBTVFTSm15?=
 =?utf-8?B?OUpJZ1VBOFhuU3NiRTEvTDJPZ0lETThmZnVGemRZZml2RnZSL0hJZWE3RWE4?=
 =?utf-8?B?dXMwWkdWWXhpMmtoOWhxWll2RU5YaSs5M3laQkpCSlpkOFN0Nit1VGVmbkZZ?=
 =?utf-8?B?ZEdrbFpuRWZiNU9rdFhpcVZ6ZUx2R1I0c2FLSjlJSkRwYVBLVnlrY1JRUE5q?=
 =?utf-8?B?VUFIQm5XWGtNTzFiTlFUZjhxL01BWmNVbkhnTi9MZ00zNjY0cUVwbm9VR3Iy?=
 =?utf-8?B?WFhMZHAxUzUzM2NvVkJXUWJ4MU4zSGI3N0tkTGhGY3AzZTR1cXoySUlZK25F?=
 =?utf-8?B?clRxMVhpR0EvRk52QUtyZlorWW9mNHIzeDJUVFhYMjlhZUZwWWQ1NVFxSndh?=
 =?utf-8?B?VzIvZ0crVWEvM3hQSjdleWtwSlB2d2Riem8wKzZmZXZmOWJRY2JsQT09?=
X-Exchange-RoutingPolicyChecked: NWNBeeeB3bn8YTZnAig8QozNlebQpyVWROXTdCdKDEFYoPiz+IQjYroSkDIhT6H5ph9GxaW3bR3xnh5ACrhXwNJndX7LYS4rkGJGjxWs8gX+V1JhLxbJK1aFPtMCvJLdveVr6vLFGW7KfTy7nmIxs2Gtx10t35nvpl+uHTFXlJxSKywYRoJFkmVdj9ba1BDzVjsC4O34vyNUWnu5ZfD1kP74JjOG5TnXv95amiDeGZQKmpfWg8Z5pYUcgvSlShUppQl9R0i83OGF9uo5nh/O/7JhPqataBv+tX6mvLZrqRNFPcf0RsY/Ty5btpAJIbTbw5MH6lLyvNOG+RKNCDtQ8w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb74aa9-f747-44e1-5a1d-08de99deedfc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 04:33:09.0983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BaL8QUpFcNir9SrPLbRa4DcWm1m2l1I6Nx5L29Pdh+H5+apST039cKZoU9OE3cDax7M77sIgDlTG5WVxHv6zwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7859
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


On 4/14/2026 5:57 AM, Lin, Shuicheng wrote:
> On Sun, Apr 12, 2026 9:46 PM Riana Tauro wrote:
>> On 4/11/2026 10:24 AM, Nguyen, Brian3 wrote:
>>> On Tuesday, April 7, 2026 3:59 PM, Shuicheng Lin wrote:
>>>> - Fix long line in cleanup_node_param() signature.
>> All checkpatch errors were fixed in the original series.  The line length is in-line
>> with checkpatch.
>> Please provide the checkpatch error if you are seeing.
> Here it is:
> $ ./scripts/checkpatch.pl --strict drivers/gpu/drm/xe/xe_drm_ras.c
> CHECK: line length of 101 exceeds 100 columns
> #103: FILE: drivers/gpu/drm/xe/xe_drm_ras.c:103:
> +static void cleanup_node_param(struct xe_drm_ras *ras, const enum drm_xe_ras_error_severity severity)
If you are re-working the first patch add it as part of the same.

Thanks
Riana

>
>>>> - Drop unnecessary const on pass-by-value enum parameters.
>> This can be added as part of any other functional series. A patch just for this is
>> not necessary.
> I am OK with it.
>
>>>> - Simplify xe_drm_ras_init() by removing redundant local variable
>>>>     and redundant error path.
>> Any reason?
> This is just code refine. If you don't agree with it, I won't insist on it.
> Since you will have new series, I will drop both patches, and feel free to integrate any change that you think worth.
> Thanks.
>
> Shuicheng
>
>> Thanks
>> Riana
>>>> No functional change.
>>>>
>>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>>> Assisted-by: Claude:claude-opus-4.6
>>>> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>>> Reviewed-by: Brian Nguyen <brian3.nguyen@intel.com>
>>>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_drm_ras.c | 19 ++++++++-----------
>>>>    1 file changed, 8 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c
>>>> b/drivers/gpu/drm/xe/xe_drm_ras.c index 802e4bcb731c..9cddad2be549
>>>> 100644
>>>> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
>>>> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
>>>> @@ -68,7 +68,7 @@ static struct xe_drm_ras_counter
>> *allocate_and_copy_counters(struct xe_device *x
>>>>    }
>>>>
>>>>    static int assign_node_params(struct xe_device *xe, struct drm_ras_node
>> *node,
>>>> -			      const enum drm_xe_ras_error_severity severity)
>>>> +			      enum drm_xe_ras_error_severity severity)
>>>>    {
>>>>    	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>>    	struct xe_drm_ras *ras = &xe->ras; @@ -109,7 +109,8 @@ static int
>>>> assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
>>>>    	return ret;
>>>>    }
>>>>
>>>> -static void cleanup_node_param(struct xe_drm_ras *ras, const enum
>>>> drm_xe_ras_error_severity severity)
>>>> +static void cleanup_node_param(struct xe_drm_ras *ras,
>>>> +			       enum drm_xe_ras_error_severity severity)
>>>>    {
>>>>    	struct drm_ras_node *node = &ras->node[severity];
>>>>
>>>> @@ -174,15 +175,13 @@ static void xe_drm_ras_unregister_nodes(struct
>> drm_device *device, void *arg)
>>>>    int xe_drm_ras_init(struct xe_device *xe)
>>>>    {
>>>>    	struct xe_drm_ras *ras = &xe->ras;
>>>> -	struct drm_ras_node *node;
>>>>    	int err;
>>>>
>>>> -	node = drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERR_SEV_MAX,
>> sizeof(*node), GFP_KERNEL);
>>>> -	if (!node)
>>>> +	ras->node = drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERR_SEV_MAX,
>>>> +				 sizeof(*ras->node), GFP_KERNEL);
>>>> +	if (!ras->node)
>>>>    		return -ENOMEM;
>>>>
>>>> -	ras->node = node;
>>>> -
>>>>    	err = register_nodes(xe);
>>>>    	if (err) {
>>>>    		drm_err(&xe->drm, "Failed to register DRM RAS nodes
>> (%pe)\n",
>>>> ERR_PTR(err)); @@ -190,10 +189,8 @@ int xe_drm_ras_init(struct
>> xe_device *xe)
>>>>    	}
>>>>
>>>>    	err = drmm_add_action_or_reset(&xe->drm,
>> xe_drm_ras_unregister_nodes, xe);
>>>> -	if (err) {
>>>> +	if (err)
>>>>    		drm_err(&xe->drm, "Failed to add action for Xe DRM RAS
>> (%pe)\n", ERR_PTR(err));
>>>> -		return err;
>>>> -	}
>>>>
>>>> -	return 0;
>>>> +	return err;
>>>>    }
>>>> --
>>>> 2.43.0
