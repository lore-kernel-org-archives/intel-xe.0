Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4101FCA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 22:13:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C5710EAEA;
	Thu, 28 Aug 2025 22:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Df9yUMMP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48B810EAEA
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 22:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756419193; x=1787955193;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7+3H9aH2H7tqZbwvoGbDoPrppRoRGeyxg4Kze7XcOkA=;
 b=Df9yUMMPykO8c04WZf4eZdmZ/2YtAcDK89c4LqSvGPf/GzdzXuvePjjz
 K4vC89fAZQch+/ZG+1f+py+ynSVKjv7fiNtqN8zDvPojrEU/iOBcKz8jk
 kvKCB6gSedbFEIFSrXTdSu6kpqvzGriBWachZhWHFwnX4aKQ4DFVcJ94U
 exG/dFFgNSQ9vfH3Icu4Ga6KT+9fnoozTrcdWD/S9+VrGNFDggI5jcXpx
 Wg5RFQgxHB0PtNovzsLT+JWBFfpht9fc9LYGVeX3CZBGHUHO6LuG2Mzom
 LIpR9vQ64F20v5ugY4ItKW1MR7mhu/BcK5CLpymGCR15DXwX0Df4v77Es Q==;
X-CSE-ConnectionGUID: /pt9zXd9TQ+pKAQDzTKuOA==
X-CSE-MsgGUID: fYtDyHjFQtqInfp8P81nmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="69297346"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="69297346"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 15:12:50 -0700
X-CSE-ConnectionGUID: iErUwV2eQ0GQssZBGu+Hsg==
X-CSE-MsgGUID: uuOsLzvPTZaJWId6HwvIbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="174575325"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 15:12:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 15:12:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 15:12:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.74) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 15:12:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KrGGUZlwuuJeXme+mr9GLZZMaCFRW2wshKhkl4Xt76B0jxGOp7OxhtT4hGrUoVG4inO2O/A2pBxi48pRV9SJFmpxhUQU/oBIalheICY1t3zwB4SMri1P4vvKxRHremFKBjFpCO3MKoVO2XsVMEZuwa43YXMM7pJkSHzPmcmyzeUnqQVvbzbGn4cNlAjFeu95kNzCQ+6yUYZOS5QyXO328cSm2xb5ySXsg4+5jUV6IMTUT8j3brZdWxFTq98gOWiZljIYDM6jMBxRVKN6fvEuEdvbsbG2iVUtV5c9GwfwLX+uJo/hIklOOMuQUsaLWT4ZQXqp2fgNrJ/znCIssyIuYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozv14zmeQldIF+HKhtyZUKxLJS2IC+RmmDKarLQvSec=;
 b=VA32cLxFGL8gGFc+hSuIX3MhJLRYZ/kB2JqDof4SK5jZsvLusnBxzalVdm8QMNeE2t2Zp9TLTRc4QmC3QL4r3eYIWFTVGAIUkUq8cjt8YPsfqwis7AmHROYPy6WuD+0mWZm7SPiHRpXiVHud337os7mEwP1A6EXJ1pDk5peMzopabM/vR9f/NeVam32+mcy3nHtpdLahQNqOVP9IYbzcetGRr66kwS/tFRk04tPBU6a8vC+tj8L3xQUIF5empb/Kv8U4DjnQSHHGoqk6BomxxksDKcl+YqTe8RrfocOw9+ZihtaIpLB2rUTnNVSTBtDwDgWrzlp4VAdx8IU/bmA1fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by CH3PR11MB7324.namprd11.prod.outlook.com (2603:10b6:610:14f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Thu, 28 Aug
 2025 22:12:37 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.9073.016; Thu, 28 Aug 2025
 22:12:37 +0000
Message-ID: <46a8709d-4ad8-4bc0-a1a0-3d6b7e33eb52@intel.com>
Date: Thu, 28 Aug 2025 15:12:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Update GuC log buffer type value
To: "Summers, Stuart" <stuart.summers@intel.com>, "Dong, Zhanjun"
 <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20250827215217.1030775-1-zhanjun.dong@intel.com>
 <658967b09cecdf0f20ad3547d4ab5ed3e016964d.camel@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <658967b09cecdf0f20ad3547d4ab5ed3e016964d.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0269.namprd03.prod.outlook.com
 (2603:10b6:303:b4::34) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|CH3PR11MB7324:EE_
X-MS-Office365-Filtering-Correlation-Id: dccd58ed-0afd-48ea-dd20-08dde67fff08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTlvdk9TRFB1ZjEySWdqUkY1OWdyb0prNHZLMWowV2YyUzJCVHgvQjZmaXZN?=
 =?utf-8?B?c0o4Wlg0b2RIUEZqdWkrQmlnYjJRZ25hMll3d0J1K203Y0NwR1JpVW9tMEdy?=
 =?utf-8?B?eXlGK21sVldDcy9XVlo3Z1Q5Y1A2V0R1clFHanlpMHN5eVUwZVUvc1NLOTR5?=
 =?utf-8?B?cUcwOGpNTWwxa0pQQ2l3S3Q5RFl3ekFhNHVPNGZGYUVVbmZsVklpVmJsemFz?=
 =?utf-8?B?aUdkcHh4cnV6OGpYR2laUWNldkF3VlpUL1I2bmxoYnVYZ205Umc0MTQ0NTlR?=
 =?utf-8?B?a1VuU1VoQ0lqTDRkTTlHVVkxd0QrYjRXZ2ZUQ2hjWWdWd1E5OGk1UmpNQ0xx?=
 =?utf-8?B?VVJDMDJ0REtXZ3o5L0d3UWhOclVvRC9BMFRZTm1yY3FwVDcyaDNaanNFeVU4?=
 =?utf-8?B?b010Rk5HTGdnSjZrTTh6Ylh4Vkh3S1d6a0MxOEk0OXkyL2pDZExrRDd4c0tC?=
 =?utf-8?B?ZXJBN2RDcTY3QS9QUUhNMUo5SWtmbmxsM1VvN0FYREgweUNZSzdlZlZ5WmRC?=
 =?utf-8?B?RUdvanNaMWxKMHlpUGJsRksybi9LL1V2d3pMcVRubkF1N09SV2tKUUhNNXZa?=
 =?utf-8?B?c3l1Zk1tdS9NMHF1cHBXRGlpTVhEM1hXNGdFODlYM1VqVU1zM3c2UkVMUTdw?=
 =?utf-8?B?OHBPaFBNak1LN2lFV0FkajRLYWZvMlBsVnpucEJoeFlkKzVWZkpEOENkRS9i?=
 =?utf-8?B?S2poTGFtOXAyckNSS2ZFdEZoYVpnZW8rVkx3QkJtOTZLTkJwd0FnVnVrd2Fi?=
 =?utf-8?B?Z3RKZ2MrZ3lPQm5Zek8vejBvQ1J5bmlFbDBaKy9xYlFZaGl1LzUyUEVkUjFs?=
 =?utf-8?B?N3JvR2MyUEhSN2F4OU10THRQaFYvVHduZzlKdHd6L1NXQW1iOFF3V0ErbmJC?=
 =?utf-8?B?WXNEV0ZEbDg3RWV4VnhNR28vbFF1L0VIekozT3FYQURrZnlvOGcxYnFhenYy?=
 =?utf-8?B?UGRIQVNzOHpHS2NOcG4vZ2xiN2RpMjEvaFQ0NlZ5Nk0zNytxdlY1bFZPcGVJ?=
 =?utf-8?B?TU5HMTFJTk9GUUI5Y1E5UCtrdDV2SEN4Vm91WnVHMk5NV3I1VG5aZkk1MXhO?=
 =?utf-8?B?S0pBQTZaWnltb0sxVFhNcnFBQ3lLS0FEZHlGWUpHUDhFd0liM1FGanVvbUY4?=
 =?utf-8?B?MU9RdUNDUmpNeGxFR0xCVmZxcENNV0xsS3pKSmx1K3FTd1M2ZUM3Y1g1eHg1?=
 =?utf-8?B?QUdQM1p0cm1jV2dDM3ZMQmlTWCttRzE5SWpOMWw5U0d4OU0rR3FxdTF1RXJa?=
 =?utf-8?B?dHlXQlJuWXU3SXV4VU5TczBPMzZJckdsS0kyN3F4ekFPa1F3UlJEZEM3cVBm?=
 =?utf-8?B?aENjdmk0WmdkYTdQL05wc29xeisxU0xYUkRGOFE1T3V5TlpOdWpWcU40NTl4?=
 =?utf-8?B?QkUzbXd4SjBzK0Z3YzFNQ2QxNWdyRXlEelRtZE9KY29KT0tkSW1WRWZTS1pH?=
 =?utf-8?B?WnVoMzlva0o0OHkzUS9QVXRQZTVTRHZVUUdNcjNablVYM0o0NVBmc09qZGpU?=
 =?utf-8?B?K2VhZ3dkY3MyZzBENWVUTHZxWTlPeGx1L2xYcjZGU2xqeWg4MGhlYU9yaG00?=
 =?utf-8?B?dVVFd0hERGZLQ0Y0b0hXMFZXQ3pSanpSVlB4OE5GK3JXWUN5MlREdXU4UTVq?=
 =?utf-8?B?WUN6RDZVRFFNSVgxK3ZqWVhHMWdPWm11WVBtWGhOMWk1NEx6UXZXbklGTkxF?=
 =?utf-8?B?R3FyTnFqajk1ekZjdmNjYTRVdWZMN3FqMTZ2Q0o4YWpUa3BDWWpQZWRHNExa?=
 =?utf-8?B?YXJra0dyZXdwYVhJR0JlOXJYWERWbEh0NHJJMnErY0pWZkNwS29tOVA3T1lU?=
 =?utf-8?B?c1NEa1lGWmp3S1lpZEgrUU9jNWFEdnZ0R2dZY1RqSFViM3ZYQlNSU0xKZjlY?=
 =?utf-8?B?TXpXWUdONGJzQTI1MW5xNzltSC8yZHhESXB5eCtLM3MvWGlBK1d1L05kZ0to?=
 =?utf-8?Q?gB32xgRj1p8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXJhQlJoQlVhRGQrRUZsZHhlM09sUDN2N0J3V1ZaUUVNV1hsdXp0Qkdic2RI?=
 =?utf-8?B?OGFsS2V3dWZYK1UrSkttRUh4bFhGeDI2MWtXVVNhbWZwMEtOMTZpVWRJUW5k?=
 =?utf-8?B?NHNUelJTWEZDdmY1MkxYMUFQbVJBamtiYWtJdDdFUEo0Uk9GTjg4c3NTVEto?=
 =?utf-8?B?enpkUXlnYThHamlnQ3pGTFlWb0FYMmovN2VuSnpxRW02a2NPSVN2VjNtaTFC?=
 =?utf-8?B?OUNYenZYc0tBU01HbSt6UDhzcitQYkJncWZnK3BOOGh1RDJwUTRxRzhBUUg1?=
 =?utf-8?B?eC9YRjZFQUhQYkRCbjhtaWhvamdjTURvUFJaT29QdmIrcCtaZ0h6TmVKbHJT?=
 =?utf-8?B?T2NZaGhyMytYTzRGL2oxOE9BYnpwRWFrK0VyVlNKdjNESzVsM0hSTXJPOXlx?=
 =?utf-8?B?SGhMN0xEcFRXRXRJcXVDWmpsTXZaeWhMT0ZMSEdDaE1FLzM2dGhhWEo0cHF3?=
 =?utf-8?B?RHBneTV0ZlU5eWFDVkpRMmxXWjdqdUFybE5OeXk2WVRYZGFsNTJZNWRkdkp2?=
 =?utf-8?B?Y3NpVEZKYUpyL25uR0hvYXBFM3RFVEFyRVBVZk5tVlhLcG51bmpCNzhOMk44?=
 =?utf-8?B?bGk3ZGVQei80WkpVV2hpWXVxcW9WeTlUUXRsNkcvVzVraXhTSU5jSkIrVXJB?=
 =?utf-8?B?Y2lrTHdLeTA0SU84ZzFyaWVjbkd0SWxJYzNrU0RDblpnZHlCa0djcXBkQVVi?=
 =?utf-8?B?OFpEeWVUN25ZQzM1L1dhY0srM2lTTFk5QVJjSmFLcmRLNUtsV0YwRWNyVThm?=
 =?utf-8?B?c2c0cE9RNit4Z0pPTEFobkE3TENna0xmeWM3SHZYVVhKaThhZkh5d0lucnJz?=
 =?utf-8?B?cHUyZS9oUHZhUW9adnJvNkkrTkVFZjdkUWozZ1UrQzRQRGc1ZWMvUUpzckNH?=
 =?utf-8?B?YSsxb013M05pMGQ3N2FMMkVUZnNETzhZR1ZxYWcrM2lETUtRVDNwdzdhZXN5?=
 =?utf-8?B?Yk5nUm9nNlhDK3IvUzJjYXFNQnZ6MW5Xci80TmRDNVg4T01rR1hSWDlVSkxh?=
 =?utf-8?B?UTVNWEcvRVE5QkVvV1IzeERoWmRiVzh4VTllRExqSXF3WENhM2xGNmcvQlFX?=
 =?utf-8?B?R2NjSmtEajk1aU9zL1VpeS93VE4rb1R0NWVkZW1CdkRvRlVFTkpMZ1pBVklv?=
 =?utf-8?B?YU16WldtV2N2WGVyWkthVmVXdHNoOWk5RDhyOWNnRWh4ZmFzUTJiTHFzN3Jm?=
 =?utf-8?B?OXg0LzlZdkJaMU5jZWhuekhHUWFiajRWb2ppdDEzR2h3V1lTMUNnUnlPbUE1?=
 =?utf-8?B?bDB0MUg0YUNCdVpsNzl4dW9GVWl5UTVJU3RDQ1FtelFRMExXZWo1dm1xOGhK?=
 =?utf-8?B?V3BDdVhWeGhlbFZuemhWeElybkRVMGsyMU53enhHWUw5Qm9PY2hEVUFpSllY?=
 =?utf-8?B?UE16TmFxcmlOWHhJOGRoaHhySUhVUGM1am10VThGRGs4Qm9JbEFqVlNVNXpo?=
 =?utf-8?B?UkxoS1B4Z2liUk9uQkZTQlN0cnJ6elo0NEFDN1BYenpETGQ3STBpVTZyK3JD?=
 =?utf-8?B?V2FGQ0Q2V1YrbE5BK0phMnczYm4zc29zNFVBTmR4YkxpbkJBRVdzb3h2TmZS?=
 =?utf-8?B?RGZwK2xsYkpUZWRNTXVkSk9GNnNoMlhERG5DSlUvOUFLUDNvVitSSXdFSFYr?=
 =?utf-8?B?TUd0eDlsSXJ2ZlMwMzhqaDBRMEg3a0FVMW0xZ3ZhdnFqVHZNUlFNMGhmM3FK?=
 =?utf-8?B?N1liMUYxMHFPZERtcS9nL055TzEzb0xYVU1Id1lUT3QxTEw0RzBLckhRVi9r?=
 =?utf-8?B?RUNkbHNDUUpJeVJUenhVVU5ZNW1pRjhvOXJGVm1QRC9CTEJPS0JCSEFBYysr?=
 =?utf-8?B?Y1pxVUU5a1RKSDFiVjRHQWlhUXZtbDBzSE82enVIOUVEL0E4b1k4bXN6c1o4?=
 =?utf-8?B?RytKOW5GR3BLSU1GZmhJMUJYWHlMMGJHM0hwMHlWM0FKejBoQlZieVljYkpn?=
 =?utf-8?B?ck1iZm00V3VUb3BmL3IrcjN2N2FzbGUzMXFEMnN4RWpLSS96ZFAzU2NNOXZS?=
 =?utf-8?B?MEh6eHl5cDk0VUg2T0h1TmdyRW1jUU5mMGdXdXVkRnY5bittYS9wcmxYTGVo?=
 =?utf-8?B?R3pqMStObDJZMElaMzUrREY1MmZGYTJYVWJCVUdVZ0RqdXhya245WXJzandW?=
 =?utf-8?B?Sm1WelNaV01ERjk3aE56MS90TG9hMG9mckdkWnZJMFN0T1pUdjRNc0NGSkMx?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dccd58ed-0afd-48ea-dd20-08dde67fff08
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 22:12:37.1795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YVwjUPmHe+SW9Xs3VCE2iiiz8NPu60O7xTSEzexjZloWjMIRnM1cBX+5s9/dxqGZOZ/YR28FcWFCZiQfJ07pOWV285p6Hwcp0bdJntY8AQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7324
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

On 8/28/2025 11:59 AM, Summers, Stuart wrote:
> On Wed, 2025-08-27 at 17:52 -0400, Zhanjun Dong wrote:
>> Update GuC log buffer type value, make buffer types equal to
>> guc_log_buffer_type in intel_guc_fwif.h.
> This is just to maintain consistency with i915? Can you add in the
> commit message that intel_guc_fwif.h is in the i915 driver?
This has nothing to do with aligning with i915. It is about aligning 
with the GuC! And there is no actual ABI definition for this enum.

>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_log_abi.h | 2 +-
>>   drivers/gpu/drm/xe/xe_guc_log.c      | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> index 554630b7ccd9..b1819679fa35 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> @@ -10,8 +10,8 @@
>>   
>>   /* GuC logging buffer types */
>>   enum guc_log_buffer_type {
>> -       GUC_LOG_BUFFER_CRASH_DUMP,
>>          GUC_LOG_BUFFER_DEBUG,
>> +       GUC_LOG_BUFFER_CRASH_DUMP,
>>          GUC_LOG_BUFFER_CAPTURE,
> Can you move GUC_LOG_BUFFER_TYPE_MAX in here as the last enum also to
> align with i915?
>
>>   };
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c
>> b/drivers/gpu/drm/xe/xe_guc_log.c
>> index c01ccb35dc75..470c83ead543 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -330,7 +330,7 @@ u32 xe_guc_get_log_buffer_offset(struct
>> xe_guc_log *log, enum guc_log_buffer_typ
>>          enum guc_log_buffer_type i;
>>          u32 offset = PAGE_SIZE;/* for the log_buffer_states */
>>   
>> -       for (i = GUC_LOG_BUFFER_CRASH_DUMP; i <
>> GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>> +       for (i = 0; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
> I see that i915 is going from i = GUC_LOG_BUFFER_DEBUG and not from 0.
> Should we do that here too?
Not sure why that was done. The intention appears to be to skip over 
'uninteresting' entries at the start, but there aren't any. So starting 
from zero seems more plausible to me.

However, such a loop is fundamentally broken if being applied to the 
actual in memory structures. In this particular function, it is fine 
because we are only looping over KMD internal stuff (functions, not even 
data in this case!).

But the capture code does things like:
         log_buf_state_offset = sizeof(struct guc_log_buffer_state) * 
GUC_LOG_BUFFER_CAPTURE;

And that is officially broken. There is no mention of buffer ordering in 
the GuC API spec. The official method for finding a specific buffer is 
to loop through them all and look at the 'marker' fields to determine 
the type. As it happens, GuC has always used a specific order for the 
buffers (which should match what i915 was using but not what Xe was 
using). But there is no guarantee that ordering will not change for some 
reason.

So we really should fix the driver.

That means moving that enum out of the abi file and creating a new 
'find_buffer_idx()' type function that things like the capture code can 
call. Or just scanning through all the buffers at init time and saving 
named offsets to each. The capture code can then just use that directly 
rather than calculating it each time.

John.

>
> Thanks,
> Stuart
>
>>                  if (i == type)
>>                          break;
>>                  offset += xe_guc_get_log_buffer_size(log, i);

