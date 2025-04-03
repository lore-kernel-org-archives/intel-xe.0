Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2D3C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 21:47:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F7410E25C;
	Thu,  3 Apr 2025 21:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mA7+/LRJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC9710E25C
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 21:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743716841; x=1775252841;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ipQJpurTR3LgomNpQqEgxdyqrYXYVhcc1/x/9mmcYHk=;
 b=mA7+/LRJZrkFyxzE0sDTSBJMUJN1LLd9E7+tk+daDPDRt7/lyg3xopIS
 a24Fyfe/d742+MLkYAvi4P8s9XSNRnxYn5W6J93TopyMCuff2p5hJUqGy
 W69riANlDEW3SqW1Y3lA7atFO8VKe5IeceQZPA8NpbCnHUWL6l9TjXw+k
 y/zLgeXh6lzox0rMEZ5sHUmVoQf/PkqomCjk1Xf+q1boxb7yM0aH2ZSSc
 vdypBth6FukVz6+CyIsEEBaKLhMXClH26x1e9nV5PMI7wxNKy92JNJVe4
 mxHxfomVn6D4WYf5ZGzqp2h872Hc2sOjQBdSCUrZShLv7bTy1IcpH8bj6 w==;
X-CSE-ConnectionGUID: HG8wkQIJSNKw+0gnxPzMQA==
X-CSE-MsgGUID: xHNa5YPfQDa5c6I8ONATZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="70521220"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="70521220"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 14:47:03 -0700
X-CSE-ConnectionGUID: NfGVH9I2Qm6nLwpNGnimiA==
X-CSE-MsgGUID: Dzi4ZygyQjCVVsfrUeI5PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="131848979"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2025 14:47:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 3 Apr 2025 14:47:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 14:47:02 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 14:47:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6dS4ElycWO473mZbi8L5SFPhFk8kZVqwqrLjztnlBbJ9N7neWnu4N7cS+YyJx+Jru/JxdXYVhbQT/awDlISXDv9Ibh7sUIsJ7HR+yNJKtnJL0ed84iUEjFF2Yfpez3IoLBSaRv9cjdJajvpHS6ehbL+xno20ernbTLMKLYXRQpPx33zp0LMe3WzBTNKiYU45KdB1XXkvHcUWE6jPp766gdNB3GwsSrwI8uph4z5YIpNXnniqrMrzLWLmOey2D0mJAtB6o6ob2JaTciVpMsDfqILCv4nW006OF/g72u8OO8KNCBsDwuTkGaYXItZDSoRD4rmJH6zbPnXcjiLoCnvmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7G9FrQl4hUPXuPn4Rr1pqh5GSSmUko73NutF/SS3fbA=;
 b=t9Zn0LqsYrDeWvehcVwc3KacEaBaRUgOhqHGH2fD4xu16Z73FHfzNQzHsfVzcUuLNHWTqPFz/VxyG0D4Ja5w7nM0fzkn9fCK7GHaxgNXAzVJZyf3F49DWStOrA4M+IXB/e1FpL38DAAiloQzZel3+Ek6lSIZpYuZcWdGYEWXsTUAX8J05Z3hXdSrrTSIvRGjJ9xMP1BQINjcm5T+0qP1DefHDQKeIZM7uUN+sQgNLT61NuvHnMSDwEb7AaqLhpSX+5fvGrXUCqdEAyodlpotdwIcrs8jkfj1S9mRVFd/jTfddu/uGdLlzHVD7jkQFqYmiETzei9uFd9xvS4R3QO03g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH3PR11MB7202.namprd11.prod.outlook.com (2603:10b6:610:142::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Thu, 3 Apr
 2025 21:47:00 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 21:47:00 +0000
Message-ID: <e95240b8-78f5-43d7-a114-cae1270ea9b5@intel.com>
Date: Thu, 3 Apr 2025 14:46:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/guc: Only add GuC crash dump if available
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250327234028.249314-1-zhanjun.dong@intel.com>
 <20250327234028.249314-3-zhanjun.dong@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250327234028.249314-3-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0203.namprd03.prod.outlook.com
 (2603:10b6:303:b8::28) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH3PR11MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc299c3-d317-457d-592a-08dd72f91010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFZhVFpPV1R6bStzZmNHVzNXOGZ0cTV5enlTNG41dzVzUUxmV0hxZDFESi9y?=
 =?utf-8?B?Nis1UXB5SzVXMnZ6bmw2S2cvNU1WY09JdXVpalh6K2FES2MzUnlnemQ4WEJN?=
 =?utf-8?B?eElCS3RxMkgxaVA1WklpdG8wQVRDUDhJbGxybTJ2Mzk2VUs1VmJWZS9jQjFN?=
 =?utf-8?B?aXljNEc0elMxRW5VdmJHZ2dFRnFVcEQ1anMwTldJMU1XT3Rja1NreDNaYXMy?=
 =?utf-8?B?d3h1QXZkL3Y2MExkL3BTTFJqcXUxVy9Vc1ltdmFhclJMKzJuc2xmRTZvcU5x?=
 =?utf-8?B?UHJ6TGxRaEJ0S2JnMkJPa1lIcUsvNm9QcXl5dlFKN05hN1RsWjh0UHdrcUUw?=
 =?utf-8?B?ODM0Q1ZzVUowZXFUT2FFeTlrc0hrTi92OGJoczBhdXpFa0d5cEJMdHlDZitY?=
 =?utf-8?B?TExVOTFCd0ZaVGJYSXZ3K0psRWZGQUtaK3BscXhIYTE2Mlk5Mlo5YzNVdUV2?=
 =?utf-8?B?SGJSb0tkcEtreW5SMzV4TGhFVWhESzJCRlhLbXBUNlF6YjRkT3dOUUNSdTJY?=
 =?utf-8?B?bUNRTS9zMTEyc051SkN4SGkxdEtHMkRzNitkSytDOWNhWlJ6MndzcGpCQkcy?=
 =?utf-8?B?U3ZsZ3FqWGxXVzQzWGhLQWVQWlQ1Y0NGVEJGZDZXNXlPdHo3NWZKa2kwUGtP?=
 =?utf-8?B?eGtCalA2NHJOOWRmMFNyTHpGbGMwbEJ0dlluckRlaTYrY0wxVkZEVkdMbW5Z?=
 =?utf-8?B?eC93RjBvblNqZGlTMGMrRGJCaHByOURVNjdFeFJVNGJ2SVNlWDQrTnFHOTJJ?=
 =?utf-8?B?Y1pybVNMcWF3MzFJZ3hCeEFXY2laQnBkOUc0YVVTWFhmcW1YR1RRUDI3NVli?=
 =?utf-8?B?bHJPc3IzQm1DRWtNRG5EazJ3bTJpYTdZK2hqYXNmUkVpRzRiYUpHOHhLOFFM?=
 =?utf-8?B?WlIxMzBaeFFZSXBGRGN2b0hnOVNYVXdUWVY1VjFrNEZ5cEhtdjNsVnJxOC9U?=
 =?utf-8?B?YmUwSGsxbi9wcEl4R2JjNjlpeVlZOFY3RUJLbFdjRC9iYmxselU1ZGlDc3ky?=
 =?utf-8?B?YW85UmVDWDNpTXZmU1M1VE8xSlJ0SlhWbjRNWkJweTJLd2tnYTNZTUtLdlEy?=
 =?utf-8?B?b2lwQUNra2s3aUlQTlVyR0ZLc3QxM3Z5cVpzODh0TnR2UDJ1aDVvWm05MVor?=
 =?utf-8?B?cXVWVjdsczBLWFNvQ1FwTXdUb0VNUHJaVjVvdmtHRkpZa3ZGa1ZodEpCRThZ?=
 =?utf-8?B?Nk1BbndYcjlYZzBmZmVLQ09hUUx3RmZoNERsMlV5OVlzSFh0MXcwczM0ckM5?=
 =?utf-8?B?eWVmM2JvcCs5QTlsWG92a2ZpQ3htS3FOSWFVTUFRSnVEaGNyaVQ3UUU0YWsx?=
 =?utf-8?B?eUo0NWlhZTA4QUlRUFZqOWhlRTFjK1Q0K2tmanJMUnJ5RkMxMGR0ZFN5US81?=
 =?utf-8?B?YVBKU0Y4eEU4REpQLy9rY0oxQS9rcmxvVzJFcmYxdFJ6QVoyVU03Umtxbm9U?=
 =?utf-8?B?KzRBVjFWTlNWMHRSR2M5V09OU3V4bUJXNjhJWHQ3ZVdFMkxpM0l5V3RGRWI4?=
 =?utf-8?B?c0MwcHM4M3pXTXVaVitYbW1EN1E2clM1VDN0U1c5Qy83VUFMRTRVekc4MHpq?=
 =?utf-8?B?R2ExSlEyYlkwaHh3VWR5U01BUklTdkR6VVRTNEI1OFJta3hITnozUnQ4cDMw?=
 =?utf-8?B?NDB6RVRqYWRzcnhFam9Dd1hFUDE0cnRGdjNLTzRhMmoyeGw1KzA5YUYyYUJJ?=
 =?utf-8?B?MWdncXhuVGFLSEZWT2MrYnlrWjdTVG9PMzZwUzRDRWVXRVFaaHQ3Y3pUZVVr?=
 =?utf-8?B?RkdhY05nWGtkOURvbmpaTlBjTXhmNGZ1V0t4YURPMEVzVVNyV1NOZlB5RlJM?=
 =?utf-8?B?dXVUREFJL09wdDkrd0pJTVZJS0hTdFFyTmpsQkMxNWo4Y2tPZytKTUljZVdx?=
 =?utf-8?B?SEdxektZdzg2dmI4YjF5UWZ0dUsyd1FJYzU3ZEo3Z0hITmtvSTE2OTBmcjh2?=
 =?utf-8?Q?hSf4peLjVZE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGQ4UTJpZkxZazBOaFgwMW5rZzZRbUYzWFRQWXpmam83SDZpL3gxVk81Z3ZX?=
 =?utf-8?B?akJ3alVGVytNbFRTOCs0WG9TMVhYU3dwdTVzYWZVb3BpQlZKM2JSS1N0Y1Uy?=
 =?utf-8?B?MnRaWCtKNFRlMkJQUGIzT1lscjdSampvSVk4YU9rZjhJRjZEWDlYYit1elZr?=
 =?utf-8?B?MzlEcDVWSXduNUJWenFSNkN6S1EvOGJJMmgrKzhmWUM4SnNjT09xVXNCbnNz?=
 =?utf-8?B?emlXRHB5bzRWNWJtay9heUdLbWMxaEprdVMzSWozSHlsUUZWYjB6V0VXSEdl?=
 =?utf-8?B?TzZHTjVEQ2c4WWpSTG91akZCOVZ2L2p3VU5XNStHUUlpOS9IeTZ2alh6aDkx?=
 =?utf-8?B?dzk1YlRnSUI5ekNMMHFnam95Zm9xelpuS0lick1vaDY4bG53Nm1DR3l2YW0z?=
 =?utf-8?B?dXlDTHNpNmJpMEJmMXMwUlFERDdFcmJVV2U4b2xFQVk1VU9aWVJHRDE4SjE3?=
 =?utf-8?B?aDFPdGYrbTdPUkV1NGxZQmlRWW43dWxFSjZ1b2hrNjNscEFLT2paczZuZ29S?=
 =?utf-8?B?L0U2Q0o1VDhFdkxoQkx5U29LY0ppZlU0V0IvV09jcmE1ZFZRcjA1L2E4K0x0?=
 =?utf-8?B?cTh3WDl0MWdlUmVVZGJVY3NhUlJtOFlpN0pnV3A5V3k1RmhZQkZsc082T2FC?=
 =?utf-8?B?VUl1dklYbWUzVUwzWGd0aUUvSTNEVGZlZjg0bkxROXMwbHBaaTlOQ1RScFZu?=
 =?utf-8?B?NEQ3RTZhQkhvMmNtd1pLTzdubk11YVdLdERJM1JJaGtudmdFTlRmWW45Umt5?=
 =?utf-8?B?SWpNeU5YQTVsYWlCMXJtenI0STZBS0E1N0YrTGtmb2l6bkRscGdDOU85TE5C?=
 =?utf-8?B?VFpBVXEzSEJvQjVhd21lNlRJVlIxTEkxMFpZdnJYcys1dVF5akcrRXBLWUFn?=
 =?utf-8?B?OVNyOHhvZmV1SlQrVjRWVWdmQTBrTjdVWnFaMVFQV0w2UDVPQXAvVFhDbmhW?=
 =?utf-8?B?NmR1Q3YvVnEvR0NPRS9ZTVVndTAwaFJyTmFoTmIxYmt1cFdValpyOUlBUzJt?=
 =?utf-8?B?OWZnOVk4MHRYR2FOTy82MHJBYldkMVptUm1MZDdUVTRWSVhwWk56RVBxN3pl?=
 =?utf-8?B?dGlmK09HQTdGWWZRVGJvZGI3WEtnejZWSEdTU3liTEIxbXRrSEg0RnNFN2dQ?=
 =?utf-8?B?ek54dDlDVGlhaG1ZUXpHQWY5cC9KSjBoSU56R01Ib2lReXNwVUczSnJRQkFl?=
 =?utf-8?B?TWJCd0U4SU9oZ01oUnJ6bVB5L2J6cWRoejFCeUpPenpoTE4wQ0Z4aTRPMTl6?=
 =?utf-8?B?cXEyclJUNmlWV2xmUWtaNVlFSUkvWEV1UnFlTVR0TUF2M2gyL1FRaTUwdlJO?=
 =?utf-8?B?dGUxVWczb1l2UXlRT21aSFA4a21oMUFRM1RiVjNvNGFiUDdYM0NhNWlRMTV0?=
 =?utf-8?B?UldFQXRFazFnbk5qa2hjNEFlN0p1V2txNHhnWnBjZzlZQjhVNEF1a3BDb1lO?=
 =?utf-8?B?UElMbVg1aXlPUXMrVG5WZlNxUmMzaUwwSkxTRDR5Ym9mUzZEZVFPQnBFT1lH?=
 =?utf-8?B?K2JaWEIrbkNtTGJHSlRyR25JS0Z4RVBoZHdCYmRBM3NyeVlSaGcxbG83VHBy?=
 =?utf-8?B?cURlVjZkN2hiOXM3bnVEdHc5b05BNVAwQktYMVN5MkhveXhnakxEcXpBcTRC?=
 =?utf-8?B?Q1g0K0tCRkdZb21GM0Z2YUhGU3RUcksyYWtTOTdDYnBJWERqWGROSDBUQTNT?=
 =?utf-8?B?RThzbStoWFM3TUpFb3hKeU5mbDNRMk1BVW1VbG81YU0rY0UxZTYwMnhrZVM5?=
 =?utf-8?B?dkdvYkd0cnhydGVFbWxwZU5jRGtleHQ3bDlDRElzKytKck1tZGdCeTV4S05K?=
 =?utf-8?B?YUQxKzNjZzhEK2ZzN3N3T3NrNjlmQXJSZERBOGVWK0doL004Rm1QbmE3NmFw?=
 =?utf-8?B?Mlc1RmhrMENHT1hmL1Fia1FkUm52eGN0endBQTlEMTZLckxXWkFwSXBDbUx0?=
 =?utf-8?B?VExuaVRXZ0Z4ZmZkVTNNekRZbGplaWtZWlFhUVRFSXBRdU5FRkVKNzdmcnZq?=
 =?utf-8?B?a0t4a3U0bkM4Nk5GZjFjZ0d2WUhzQUtTcHBKWEZpYUZSdTZkaThjOXZQRCtB?=
 =?utf-8?B?aVloOWtjUGxlRnhuS3lVK2FqQjRQM2VCRjFlTUVjaDE5eXloYWJTUVFDWWRs?=
 =?utf-8?B?RTR0UHUyY3FPTlYxaE0rQW9xaFhoamRMSEV3T21mU24rQVpodzBRMk5oR0Ux?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc299c3-d317-457d-592a-08dd72f91010
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 21:47:00.0327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /5eSS5cvBsEumrEX6Y/O/Wxb9yfW9rIsy9DVe3YU0nE0OC0n0l08NTysUn2PtBohQrBm8XIUswFnZk/lQal4ozBQIorqwwZzCWryuSCwIhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7202
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

On 3/27/2025 4:40 PM, Zhanjun Dong wrote:
> Add flag of GuC crash dump received. LFD only include crash dump
> section when crash dump is available.
>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c        | 13 +++++++-----
>   drivers/gpu/drm/xe/xe_guc_log.c       | 30 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_log_types.h |  2 ++
>   3 files changed, 40 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 72ad576fc18e..44c11ec662e5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1127,12 +1127,15 @@ static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
>   {
>   	struct xe_gt *gt = ct_to_gt(ct);
>   
> -	if (action == XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
> +	if (action == XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED) {
>   		xe_gt_err(gt, "GuC Crash dump notification\n");
> -	else if (action == XE_GUC_ACTION_NOTIFY_EXCEPTION)
> -		xe_gt_err(gt, "GuC Exception notification\n");
> -	else
> -		xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", action);
> +		ct_to_guc(ct)->log.crash_dumped = true;
This will also need to be cleared in the GuC reset path. There is no 
guarantee that the log will be saved via the LFD system before a reset 
wipes it out. And then a subsequent save will see a stale crash dump.

> +	} else {
> +		if (action == XE_GUC_ACTION_NOTIFY_EXCEPTION)
You can use "} else if( ..." to avoid the unnecessary extra level of 
indentation.

> +			xe_gt_err(gt, "GuC Exception notification\n");
> +		else
> +			xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", action);
> +	}
>   
>   	CT_DEAD(ct, NULL, CRASH);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index 5659d60e41ab..29684393a62d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -536,6 +536,36 @@ static uint xe_guc_log_save_to_lfd_buf(char *buf, int size, u32 *guc_log_bin,
>   		return len;
>   	index += len;
>   
> +	/* For Crash dump, rd/wr ptr has no effect, only add if crash_dumped is true */
> +	if (log->crash_dumped) {
> +		struct guc_log_buffer_entry_list *entry;
> +
> +		entry = &entry_list[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH];
> +		if (entry->buf_size) {
> +			int i;
> +			u32 *buf32 = (u32 *)&bin[entry->offset];
> +
> +			/* Check if crash dump section are all zero */
> +			for (i = 0; i < entry->buf_size / 4; i++)
> +				if (buf32[i])
> +					break;
> +
> +			/* Buffer has non-zero data */
> +			if (i < entry->buf_size / 4) {
> +				len = xe_guc_log_add_typed_payload(&buf[index], size - index,
> +								   GUC_LFD_TYPE_FW_CRASH_DUMP,
> +								   entry->buf_size,
> +								   &bin[entry->offset]);
> +				if (len < 0)
> +					return len;
> +				index += len;
> +
> +				/* Clear flag */
> +				log->crash_dumped = false;
> +			}
> +		}
> +	}
> +
>   	return index;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
> index b3d5c72ac752..d351f639727b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
> @@ -46,6 +46,8 @@ struct xe_guc_log {
>   	u32 level;
>   	/** @bo: XE BO for GuC log */
>   	struct xe_bo *bo;
> +	/** @crash_dumped: Indicate if crash dumped */
> +	bool crash_dumped;
>   	/** @stats: logging related stats */
>   	struct {
>   		u32 sampled_overflow;

