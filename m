Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A8EC25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 20:03:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744E910EB21;
	Fri, 24 May 2024 20:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OWmxwX9x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C17A10EA1B
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 20:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716581015; x=1748117015;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6BCQEae1qafxnUeFkb4a/8pejtLX69RZrXRxMG4+Vpg=;
 b=OWmxwX9xkygi29Oa8OGOgaPQhXEtKwgj0WjPrSkQ1/loKK1/O2IXjtKz
 H+OPMYjmQJjDRd8JDkOlRPFmV6xvpIVZwupvMKmquomT1yQV+/oN5S0Jl
 vhUgGos/Me/jjvle0IhM+Y6rwx4pMrHLyuPOmNlodhFwKsVPgNzWVB5kb
 er41eOIqfbuF4U1HkW2VnS5BFEpzrJGm1gIWOTLLlXqUjvjrRa1Vnbw+Q
 SXOWkc0TjdIL4WK2y0GcQN1kkN3/JOqA3nYS24OZqryQl+D8qGiI0H//D
 Lpg7+De2VZoi9bqPqXsfMYu412GNmgSUg4/sFBdemk5G5DVVT+4bRB2pO w==;
X-CSE-ConnectionGUID: PVdmJ/0CTvqWZ72QuuBuDQ==
X-CSE-MsgGUID: H0IaGeuPRJOmmMidiImiFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="30491436"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="30491436"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 13:03:35 -0700
X-CSE-ConnectionGUID: SE0ighD/TW2UtGIL0YnfkA==
X-CSE-MsgGUID: htVfi++FSiCnzuFwIOlmZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="65352366"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 May 2024 13:03:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 24 May 2024 13:03:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 24 May 2024 13:03:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 24 May 2024 13:03:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 24 May 2024 13:03:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgEZCxx7Qh4xdkKFpZdIA4ntUekXxHw5AC5I0wzJVsKzILmXw5v68WtVT+uOWW+eeiUsBGr+9Q60+l7B9o7K8Ko3ZIz+/BBksekpJoXOTxHtNuT9sy6wvfnCIn+dPbeFg3ndNj+VR2NRWEp2hhv9WXZ3sO6U3njxe2LvrC8UO/S7nwmKX+WzV4OEoCjeearsA2pMyUQf9OJj4p9f3rjkC7izYNuM6JH78G3UmVvybyVOjyryaDkw6/cksu137UON1l+0nm3QzKWK8HZK5BnzxwlUpr5yWjaxLjrCcajQ0/FjJTOjZVYuxO2AwUMgIDEhWzeADXlWmHjkDSCs6NajnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKMoelPQCllOTnbHGKLMWyhUkwShlSLiCRVJHxXrk1o=;
 b=iZJyYL4fSF5seWr4Um41dDipxNW1flxz1vOEQ0rtZAryMvSmXkxc0wvVCGXH88wIp9z6cy7RhIOG9MLqERbE0QVNtxJizmHD3e6CPe6j9Oc75Z41bYIzQSJOs59pXRHdmtO+X2nu90zaF5Mg1LbaO2xTnTPTepkDJw3md/+hmjqN6FRZ9npE2o/txWWjzqVWD951ZR/OrO1TD8+qO+Z8Xw6XHPqKiV+NSaBuoQFNcBt2Md+/rJNkcrgVLoPuHOQqoQT3dFD1fjbuwTX2IiMtfWRU0CYp187hB6XtyNV2T7ssq2L8sHBCnhhJMRdh6Y5uF1UBlcTrtCQeSBYxi/eZWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY8PR11MB7315.namprd11.prod.outlook.com (2603:10b6:930:9e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.26; Fri, 24 May
 2024 20:03:27 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.7611.025; Fri, 24 May 2024
 20:03:27 +0000
Date: Fri, 24 May 2024 13:03:20 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jani.saarinen@intel.com>,
 <matthew.auld@intel.com>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Do not access xe file when updating exec queue
 runtime
Message-ID: <ZlDyiFeau/FlQ4ux@orsosgc001>
References: <20240524184958.1344787-1-umesh.nerlige.ramappa@intel.com>
 <ZlDsBOpHS9ybagbt@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZlDsBOpHS9ybagbt@intel.com>
X-ClientProxiedBy: SJ0PR03CA0294.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::29) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY8PR11MB7315:EE_
X-MS-Office365-Filtering-Correlation-Id: fb4b763e-276d-47d2-59d0-08dc7c2c9329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGZXanFIcTFmc0tqSnM4dTJLaGJkR2FYdGs4czhxZ01NTXhocEZaR1Q0VUVE?=
 =?utf-8?B?QlI1SmN5MUlWc2R2WTdFdjhaNkdROWEwSk93S3NNL2ludHJHYytyQUJRc2Z2?=
 =?utf-8?B?ZjZNS2xqWWdHL1NQOFptN0Z3SGIwbGU1SUNkdklJWUVEWEtEMk5oaGZkUzIy?=
 =?utf-8?B?TGU4Y1FMbzdYM3pWNTdwZktFZzFKRThsK3JaWk5Fcjl2dkZqaDk1cCsxNnFH?=
 =?utf-8?B?OHhzODVPZ2ZjYkNSZUFjQ21GZHBWVjNnS21QRjQydnBlT1ZoTDFGTisyTjNP?=
 =?utf-8?B?cWo1d2RJcmlhV3l3citOUWRVZlZ6UHZRc2MzbHlDcVNFZXUwVkFLUEV3RUls?=
 =?utf-8?B?Y1kyckU2VHpVeWlVcTRzaDlMWkRGaTNWcjAvRWJaZExublkwQkxiK1FYSlNP?=
 =?utf-8?B?ZXlmTU85ZmJiQThVdUpGUHNlWW9HSy8wa09ndXpQOGJ0anpTWnZSSlQza2dS?=
 =?utf-8?B?cnQ5OXJmWVduZ3RTKzFZWW9XN0RvVWRJdG0zNkxMT0hZVzFKRTZrVmJjMDVO?=
 =?utf-8?B?cFhNbkZDTGJSM3JPMkU2clI2clNGU2pMQ0llYnZSb1ZMV1FmdUZldHd6SkN2?=
 =?utf-8?B?T3phakFOUDNscUZGWk5ZUmhJRHZmcWdDa1FpYmFrbVBiT0U5djg2Q24vQjIr?=
 =?utf-8?B?VDlGZjgyMEV6YmhtYmdvYWVCRHcyQWtqb1JBVXoyNHJIYzdwQXFSU0NndUN1?=
 =?utf-8?B?T1poWUJ2cHBvQUhGSGlhdXViV3RDQWxVSFVFTUlJTzlHdVJaRkJoWnNFYWVH?=
 =?utf-8?B?M0RDTjNza0Z5QzhVZlpNc2NOck1pTzA3ZVlmVEloOWtGNUNRTzZlYTM4N0tP?=
 =?utf-8?B?ZU9GTDh6VzRZUG16R0JBQmpjZ3ptREIzcWVFR1N4SzFINEwycURFaGNVOWdo?=
 =?utf-8?B?UU5UVDJTNFNCYWRneGYrSzZoQlVBV3Y4bVUxUDBkc1VxUnFENFpZMW9vTU9S?=
 =?utf-8?B?cVhiY0J0Tm9UTEpRNWpKUmk2SGs2YTBFUnpvTU5GdW84RCtieERvRVRyWlNU?=
 =?utf-8?B?cGRoVkhHUDBmSHBUUDlCRm1vSGI5NlVOS0ZVaEVXbkFsT1dmc3dYc1llWEtE?=
 =?utf-8?B?V1lKQWlrN0tnZm5vdlZPanZTWEp0aWtLVmY2NWhaV1JGaEhleFZmaHJFUGZO?=
 =?utf-8?B?NHZIcUE5RldqZmZOTHJmL0todURkTU16MzFCSHJYOW1pcnU4UlNlUGx1OVNE?=
 =?utf-8?B?MzZzZ1RyeFJwaEwraFFLR1A4UGF0VzR4b2hWVFM5aGpEODdKYUlUaDNXb1FL?=
 =?utf-8?B?K1FJRWIwdHdSbXFhQ20wa0V4Vi9nTXJwVEgwV09FUGw1RkxYQjlONUhTK1ND?=
 =?utf-8?B?ZnNhTHRCWjZEWFVBSXp1VFNZd0I3UEJsdTZ6ZUNFOG1JeFY3dHF6REpjT0dP?=
 =?utf-8?B?eHhsUTBSOU1uT0FtcVZJYWNibW5WTDNEV2pscU8rREZQTS95VFhCaGZ2YW9a?=
 =?utf-8?B?aSt2RVFsWFhVUEN5OFk4U0laaWM5ZlRyKzQ5alJ3OGhBL0ZoU21WQkxCc1RO?=
 =?utf-8?B?OGNzd1hIUHlNbTc5eEV5bGNQdXQxSUdDV3AxZkFnZy9RaTd0Ry9kaHh4Qkh6?=
 =?utf-8?B?S2RmSUp6OFJTV2V4R011ckQxSEJWS2VHZU1oUm1jTENqMStWdGVDOEhkMVNM?=
 =?utf-8?Q?s3Dhi+2hF52zjw1/OAvjEXKaN+FgnLTJkMsIx8VHH4Hg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3JQZ2Z1OHJDbG9IUC82Nms5b001b2FPZGZuVDdOSXlTa2hTaE1XbGVrRXUx?=
 =?utf-8?B?RG9aNjA4VFI4K2hEcjNTWk9jSnk2c0plcnNxMnpwaElMWjRCZEJpVWxhZWdO?=
 =?utf-8?B?Q2xNNWZhdS9OT3pCZ2ZFTWlTOXhMNWVRTDNUaXg2c0lFN0Y1WWhwOTNDWlNq?=
 =?utf-8?B?SmdZUVhzNGQ1Szk3S0dDSmRBdXVCaWtUTjFFWHdRTWszYXJCQWNIOWFmcUVL?=
 =?utf-8?B?d1d1bTJtOTVaNlRLM0pEMnRWaENxOUNjTDZOaHdlWWV0U1N3VkkvandTcy9M?=
 =?utf-8?B?SWVqM2ljbjBYUGhNVWIzMkttWWFMcG55N01WRGgvcVNhZnRoU01HYTFQc0ZK?=
 =?utf-8?B?Z2E0R2llbVBtWUJOejcxNGdmR3F3TlpucVlicm4wOUNKL2MzOFY1Q0lLM3po?=
 =?utf-8?B?OXNWZUc1aDAwckU0T1c5VU1yYXcvTHorNW9VUGZHMk9vemE2VXo5V2pWQUlu?=
 =?utf-8?B?QjZsSDByY2lGOVpsZVRCNno2ZHFTTFFYK1ZiVUErcGNDKzJVYzFVUW92dmRp?=
 =?utf-8?B?V2VLZkxjQnp1b3pVYi9XRHp2M2ovc0J6WERxb0RMN2JCRzBhT0h5MzhzeEo1?=
 =?utf-8?B?KzM3eDBVeGJodHJOaDFZOS92a1JteHRSS3plY2t6eC9iZUQxVWR0bTA3NXdL?=
 =?utf-8?B?YXYyeUo1N1pDYUMybGZrd01nTFJOK0pXbHAwdnMxamRuYm14M1c4ckZpdXVx?=
 =?utf-8?B?by95Y3p2K3hrN0w0dUpSYVF2ZTJLekpKTUcyenJ2NlVFRzQxaTY2c01PdjF5?=
 =?utf-8?B?TUpJOHoxVXN6MUVFV1lxbUsxZXJRNytpYUJUd0oxbUtsZ3ZDUnRoVk9mMCto?=
 =?utf-8?B?c0JORW5ZSyt4OW45dllINFBTMGZSWXVyU2plYTZld2FPOTZpUHo2cXhoUGJh?=
 =?utf-8?B?QWFKQUYrbmpXOHpaSkhQWDdGMVJPbGlNOVlYQlVpNWV1QTBWREwrOVU4VFhH?=
 =?utf-8?B?UHBlYnlUK3g3d1ZHSTlVZzhXVkg3YTNCMWN4aEdiRlFlbzFpRmNQUTFQajN5?=
 =?utf-8?B?YlpEZlN4ZFRwZmZHRFhoUmhUc3RNdkVrVklWN3JLNGF5MEtRS2czaWRvaGFt?=
 =?utf-8?B?RU9TRGkxeWFtNWQ4WHpOTFk4UVRua3pROFFTWGw0Wm1QT3RQSmxiL1I0V0oy?=
 =?utf-8?B?ZzBPY3Z0QXpHSC9KV25mWHR6RmYrRzZONktTTlNMb2ljaVZmYnMrS04zcE9F?=
 =?utf-8?B?dWxBYlo2clJqNnRMRVVJelFSV2xGVUd6Y1lEUjUraDhCYW1TY1ROK3pxeGRL?=
 =?utf-8?B?ZTBrenR3U3gwZWwvaWI0eDlzQ2lyY0d1RWVXaEIwazJqQ0VFMTVocElNdDhT?=
 =?utf-8?B?MnJLUFAwcHovcmFkMkt3M2U4STdJNlVHVVIxRkJDK2hSbW5kQ1ZuNlVvTjIz?=
 =?utf-8?B?czhReSsrdU9jUU1UdFlDWHhCMVJHZkpQaDdDeWk3K2RYNjNRQjRvUGhmRmE3?=
 =?utf-8?B?LzhMVmdLTmQ2S2pKYU5KV3o4aXgwUEc2YVJpUXJjRytIeTEvRHk0YVdnMmd4?=
 =?utf-8?B?Q3l4U3k2VkNvRUNZa3ZNeDlvd0VOdUJZU3J6Ti9YQVduclpLWUE3bUorRWQz?=
 =?utf-8?B?RmlYdmhtdDJIa0dkb3VsRFNaREpyd05KSE1ZYUJ1R1RKeDBDRy9JNy9TaE51?=
 =?utf-8?B?K3RrUlkxSXdYdWlObSs0blhQbHJCL3FidndLMmU2UmUyVTIwNVdnUXBhbngw?=
 =?utf-8?B?UzZ1U2k3R1BJYm5oTDdTYmRuTzI3bDhkcjcrRXZEbDRJcFlidTllTXVqNGZl?=
 =?utf-8?B?VnR5TG81MDVWUWdwamFOVXU4YjZrcUJpVC8yTFgxS1ZyMkZsQjByL2pXeHFO?=
 =?utf-8?B?OWVsWFZUbEJUZFlFd3drT1lGS1pPQUpmN081Vm1UU3h6QlBYTmhjK0NkRTNk?=
 =?utf-8?B?ZHRBanUwMzF1bGtIMTlVL1RUTWpFNWV1MW1TakI4dE96RnI5S0ZWcllNaXpn?=
 =?utf-8?B?NUVmUGRUYjBRRUxUTkVrS1hEVnVSUnpYeGZqUHhKNUluS0p4dFJ3VDFZT1Rq?=
 =?utf-8?B?QW5odWtTZ3pab3hPODUvb2VIeFJDUEw5Ry9IUWZxS2swUUdWS2cySWFOVCt1?=
 =?utf-8?B?RlZJOE0wTXg2MFBwOUZUclNMNlJNbnNaTWlBcVRxUEgxK2JLbk15bUVFUVFZ?=
 =?utf-8?B?V2wwMCtHU2dkd1o1bnFRTEo0MzBxcG9oa0tJZDNXd0UzaWxSZi9mdEJFVW9X?=
 =?utf-8?Q?npoUJzlvYtpccOn57ccBJ5M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4b763e-276d-47d2-59d0-08dc7c2c9329
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 20:03:27.0446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8tivxPRR2oppeTJminhy/eAwRlEwxKC10lEGaxXWg22Edy5XQSVxqNmhLY8+xPMqUh15yYPIYCju4GzCmAm6d3grhGX1e1CNn5E34lP6Hg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7315
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

On Fri, May 24, 2024 at 03:35:32PM -0400, Rodrigo Vivi wrote:
>On Fri, May 24, 2024 at 11:49:58AM -0700, Umesh Nerlige Ramappa wrote:
>> The current code is running into a use after free case where xe file is
>> closed before the exec queue runtime can be updated. This is occuring in
>> the xe_file_close path. To fix that, do not access xe file when updating
>> the exec queue runtime. Instead store the exec queue runtime locally in
>> the exec queue object and accumulate it when the user dumps the drm
>> client stats. We know that the xe file is valid when user is dumping the
>> runtime stats for the drm client, so this effectively removes the
>> dependency on xe file object in xe_exec_queue_update_runtime().
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1908
>> Fixes: 6109f24f87d7 ("drm/xe: Add helper to accumulate exec queue runtime")
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_drm_client.c       | 4 +++-
>>  drivers/gpu/drm/xe/xe_exec_queue.c       | 5 +----
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
>>  3 files changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>> index af404c9e5cc0..a6a15562b8f7 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>> @@ -251,8 +251,10 @@ static void show_runtime(struct drm_printer *p, struct drm_file *file)
>>
>>  	/* Accumulate all the exec queues from this client */
>>  	mutex_lock(&xef->exec_queue.lock);
>> -	xa_for_each(&xef->exec_queue.xa, i, q)
>> +	xa_for_each(&xef->exec_queue.xa, i, q) {
>>  		xe_exec_queue_update_runtime(q);
>> +		xef->runtime[q->class] += q->runtime - xef->runtime[q->class];
>> +	}
>>  	mutex_unlock(&xef->exec_queue.lock);
>>
>>  	/* Get the total GPU cycles */
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 0fd61fb4d104..a0775a96efb1 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -765,7 +765,6 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
>>   */
>>  void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
>>  {
>> -	struct xe_file *xef;
>>  	struct xe_lrc *lrc;
>>  	u32 old_ts, new_ts;
>>
>> @@ -777,8 +776,6 @@ void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
>>  	if (!q->vm || !q->vm->xef)
>>  		return;
>>
>> -	xef = q->vm->xef;
>> -
>>  	/*
>>  	 * Only sample the first LRC. For parallel submission, all of them are
>>  	 * scheduled together and we compensate that below by multiplying by
>> @@ -789,7 +786,7 @@ void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
>>  	 */
>>  	lrc = &q->lrc[0];
>>  	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
>> -	xef->runtime[q->class] += (new_ts - old_ts) * q->width;
>> +	q->runtime += (new_ts - old_ts) * q->width;
>>  }
>>
>>  void xe_exec_queue_kill(struct xe_exec_queue *q)
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index ee78d497d838..085a7dce7565 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -151,6 +151,8 @@ struct xe_exec_queue {
>>  	 * Protected by @vm's resv. Unused if @vm == NULL.
>>  	 */
>>  	u64 tlb_flush_seqno;
>> +	/** @runtime: hw engine class runtime in ticks for this exec queue*/
>                                                                          ^
>missing space                                                             ^
>
>good idea to move to the exec_queue
>
>> +	u64 runtime;
>
>could we please find a better name for this? runtime what?
>or do you mean run_time?
>Is this the total run time of the exec queue expressed in ticks of the eu clock?
>
>My poor brain parses runtime as the phase of the operation, vs
>run_time as the time spent running.
>
>or perhaps 'run_ticks'?

It was xef->runtime earlier, so just carried over the name to exec queue 
as is. xef still has a runtime field that will accumulate the 
q->runtime, so I would need to change it there as well. I will pick 
run_ticks for now since it is indeed ticks.

Thanks,
Umesh






>
>>  	/** @lrc: logical ring context for this exec queue */
>>  	struct xe_lrc lrc[];
>>  };
>> --
>> 2.34.1
>>
