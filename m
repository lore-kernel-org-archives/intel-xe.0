Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45501C02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 19:27:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD1D10E899;
	Thu, 23 Jan 2025 19:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QYwyIE6e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B6010E89F
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 19:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737660462; x=1769196462;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F9y+qJRCZksQw3B51psAoZkt1Til9ltfhBBpxKl+xz0=;
 b=QYwyIE6e4LHZRkhmvrxi6ec909xpY3S+gQnvsqwPX/O8RtdmqbzVAgU1
 2VpKrLK1wzJ64c0QgJXg0Kmk4S/yR127snigsJfJ4Ji24e/lfLdanzlkS
 ABvhskGN27zTHvFqLi93YCdnqiCjY7Rb+J5r/JCaFFZmN19edHnLGyjJw
 qT4Rsg/+pbD8cJrnZA7Wx/hp/uyZss/Zn0YQCshtamS9Of8I6/9yrJLz0
 pxJG4W0RK1lqYcsgwXMw98RrOvYxclxfT38dibvU0c5YVuLmQeji40Dtk
 tU9hXHLMQc+8BGthxkdEwRQbfQK59Q6lpcgOQDayYyQvOGbeuoDbgux9W w==;
X-CSE-ConnectionGUID: P8C9oLMcQrmwAXatgoyWyQ==
X-CSE-MsgGUID: GEPaUXJIQfavpV3YfmJrOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55726999"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="55726999"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 11:27:38 -0800
X-CSE-ConnectionGUID: kgE2dQb5QryQ2yI0hMSzaQ==
X-CSE-MsgGUID: EkW0nm6kQmKgJotDXb9CMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112188115"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 11:27:38 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 11:27:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 11:27:31 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 11:26:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qs4sFhVGCCncFUafiedle4EBp7TBnLDQVx09ERnidwNwgB09gLCE2H8uSIxtnafw3jv/Mt5fQc21f876LwmhxFijdeGQ6N6DRQlHbyOD7EoBe+A9a3XJ7ftFo+sV+iJdXfObgK4dKwESkGxYwajcpYQ4M7Plx1HqHI88CbQXVCxuGweR8vsmmkTxLvRmu/xToWUUj/1JdmdGt2YERwRikxWaZ5bk7I7g90CAeFn9vquCPAFZFF4wKcd7uLX+sbrCcPhGiAFqtx7Bt5xu0G6A/Wj0+oQVxrZsvKXs4ulYxhFMdcycyEgin0NaEOWFA/XFr6x8fLjsG9wSy8jkKd3DnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4XBTSS1UiBI1bySYzDntqUNndKmZFh1pb1c/zrEcWek=;
 b=swh1FEsN3zHZ+B9RduKzcUGZeUNp48Vtg3jDcUOPTpIBUVVHDALyq/mYeQz55LORKMVP80m20g/i1kIqvBVvT+gmmxoeKruFG5+hH7ZLButxN7/AtG5ewWkEFEaPxGdWLw8fqz005NfLGSqoUZKFu4fwzmOgtA680wt1RH1QWYqbXgRCWLTK69vZTds6YSiUJxbCclEOOkRKg4yFVHAYfJ7wZAevfpB8lH3ikN7ijiA6KaTfi6q/B5zHngiLkogm9mH99J8Ablx/fL+usUjq2zHRWpyHOfkfGXMY2Puc/biXSBzNoxwUeV3ynpVUh7bOep6mPxUXYMqXVaFK91VXGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8450.namprd11.prod.outlook.com (2603:10b6:a03:578::13)
 by DM4PR11MB8129.namprd11.prod.outlook.com (2603:10b6:8:183::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Thu, 23 Jan
 2025 19:26:37 +0000
Received: from SJ2PR11MB8450.namprd11.prod.outlook.com
 ([fe80::5c1b:f14a:ef14:121e]) by SJ2PR11MB8450.namprd11.prod.outlook.com
 ([fe80::5c1b:f14a:ef14:121e%4]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 19:26:37 +0000
Message-ID: <460fbd0f-2d62-4e9d-8aca-48176f015648@intel.com>
Date: Thu, 23 Jan 2025 11:26:34 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe: Make GUC binaries dump consistent with other
 binaries in devcoredump
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>
References: <20250123180320.66198-1-jose.souza@intel.com>
 <20250123180320.66198-3-jose.souza@intel.com>
 <9c1e56c4-4809-4f11-a41d-ecf6754de6ca@intel.com>
 <c9c4edd6ff425db18c189e09d12365f27aefbdc7.camel@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <c9c4edd6ff425db18c189e09d12365f27aefbdc7.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0147.namprd03.prod.outlook.com
 (2603:10b6:303:8c::32) To SJ2PR11MB8450.namprd11.prod.outlook.com
 (2603:10b6:a03:578::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8450:EE_|DM4PR11MB8129:EE_
X-MS-Office365-Filtering-Correlation-Id: d29bdbbe-0b16-4ef7-6f31-08dd3be3dade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmxZL2pNZWFMZkE2Sk1GaXFHdEswQzhKaU4vTFUveE5KSXVEZTEvay9BZnJT?=
 =?utf-8?B?NHh5R1JhYksxNDdCdzhGby9OTFV2NUVaaUdqUUx0TDNtWUpuYi90dkt2NG5D?=
 =?utf-8?B?aFBZSXZSR0xCeG8wT3dzMUt5S3dObFA3TE8vL1pXTUp4MVRZMlg1elNoTmFE?=
 =?utf-8?B?S3hJa09BVlMvdloycnZLYmV2S29xdzlWQjNLcXB1YWFqczF3UmJMd1lzbUpT?=
 =?utf-8?B?RTNTRWZvM25vMHQ4dHlBSEJlRU10T1E5SUplRFQvU3VKMEdvcFJOMS83eDFK?=
 =?utf-8?B?TkNGY054SkM3Wmoza0NkMWhTem1XRE5iV2VNazZ5emNFSW9UZ0VIUHJ4Y0ZP?=
 =?utf-8?B?bStQMStTcGNlVnBGWWV3M1ZKTTZXNytVY1lYWDZMQ0wvS3pCMlhOVk1zZWF6?=
 =?utf-8?B?Q1p3ZmhkQlV3Y1J2NGRRUlcwb3paR2hrWWw1N0RkeDl5dk1uRDJvdW5TeFJt?=
 =?utf-8?B?V2NWdVVjMzlST09zaElBdVB6OHFLZVRYYnloN25vSTRWWCtFY2xxSnhCL3FM?=
 =?utf-8?B?YnB1SzVuMHpSL2NudkdZRzF1Tk43RGh3QURKWmx4LzNYdnVXZGRHWXUrMXd5?=
 =?utf-8?B?RnI0ZWtycmNVSTV4RXE3d3crS3h5dDFIV2p0Ukx4NmNFQWhuNDNIOE5obHNF?=
 =?utf-8?B?TC81allmT3NLQldlK3c2ZldHMkNUR2cyUjcwQVdMV3NrclJLSDJiV2d0UTdW?=
 =?utf-8?B?SW01Q1FqWkxhNWVIQzRNREpQNjhpcENaS1VmeUkwUE1jTEI3dFlhWXlVUFNp?=
 =?utf-8?B?ZTl0NUtpbG96anV3MldQUC8wUUYvaituK1ljRmphV3cxYkpTYXpCSVJoRVZN?=
 =?utf-8?B?d0pReEdWZHprZDBrUVJ2SC9rZG55WG1oSHhjV0I4eFoxK1JoSk5TMlVzeVBn?=
 =?utf-8?B?UUtTaFVvQ1FaYVNoSVd0eCtCMjV1V2toYkk4VkdVdFRQM0UvZ3dwb1dJVDNC?=
 =?utf-8?B?Q3BFMTdjakJhamN1aGU4WG5GWlhwUEhnditlVVdUdjBMeCtVa096dUtLNHVy?=
 =?utf-8?B?eE5sY0xQK1NmQWxGZnovOVJsLzJFNDU2WlVJMVZ4M1FkWG94TTIwOGhDYmtW?=
 =?utf-8?B?UmI0Z3JtWlRnT2JTZ2oxcDdBaGl3UStDbU9XNldnZi9WR3N1UzYrQnQxVHhm?=
 =?utf-8?B?dlNOVzZ0ckI2NjZ0YzFIZTlWS0tzeDgrM0NLMDJ2dmg3c2NTdk1YTzUyNTNi?=
 =?utf-8?B?b0cwQmIwSHh2S1l6K1REYzltOVFqbDdyd3FkREI2MnM5OVQ0SmlBSmZTdWU2?=
 =?utf-8?B?MEtrN3cxb2MzNlg1Ny85ajR1c2poMmpqQnRySnh3NmtXUXQrd3dEWjhLejlj?=
 =?utf-8?B?ZFpZSUZYWXY5bTFMNjFiRHgxUTJZb0JkYTczZm5JdjdpZnJXdmtyckdpRzVj?=
 =?utf-8?B?SWpaTFFreitwclV5cTEzYm1lYlpVK2NPUmtDbERkYkVLZk9SbnBWMG80NWxz?=
 =?utf-8?B?WExVV3BEWE1oUXZIR1paSlgrSEhZeGZ2M3JnZ05QdDV1ZHRPMjdFMWtrYXpm?=
 =?utf-8?B?dUNJWENGb2JYVXJwdTgwdHBlbW5HQ1NRRU1qenRyRmVmMTMwa1NOQzk5dDVl?=
 =?utf-8?B?a2JmaUhRM1RtT3JleUdsOFFmelFJN2l4M3NNRXFHdmc2U1NsbHV2Y0g1Z1pW?=
 =?utf-8?B?RE1NM3ZjV1VTTldDTGdkNXZSVXMvS1Z3UG1oTW15ZXBOeCt4QXI2NDVVUnds?=
 =?utf-8?B?QjloMzR1VjVCdGVHRFdmMVZGWDdteHA5WXVjdG8yc1Q4UWprSTFsVXhQeGpO?=
 =?utf-8?B?OVZlYUI1ajkvV3A3bEdROXpvdXIyMVhxalRIcEJ2YUkvdVVEUEVjUU9KR2JC?=
 =?utf-8?B?cU12K1A3NHdEWW1iYXVYZXdxSXJZeXMwWkRjRWExcGUxTUt6N1JPa0JtU3lK?=
 =?utf-8?Q?Kz6dMqdDYx+Ll?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB8450.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejRLdnovQzVkYUpFaEplR1JLYVlWWGdEOEkyc3ZRemZPdnRzM3B5Z1JwdnZD?=
 =?utf-8?B?bTBCUXRTM0VWVmhlTmdCeEpVanVLQ1kyMVhHR21YbUdSNzdkT1o5WldBWHhX?=
 =?utf-8?B?OW0wa0lYTjRveFkvUjNGLzZDWVBXcTVMclR1ZDlJWStJVkRsbU9JUnBUNm9s?=
 =?utf-8?B?RktuaGRsSHhkVXlock52R0ZFcjZ3cjMyZmx3Q0ZHMmh4SThKRUdNbERzZkdx?=
 =?utf-8?B?em45QVlZSWlOWUppcU9wdE91MCtvbmNOYnphcU13RmIrNXhmeWRKMDVkTWNZ?=
 =?utf-8?B?NWVPaVE1Ly9pb3U2WW1xM29TTk10V0NMNmdlVHNSRHBtQ0VZK1ordUhnNlMv?=
 =?utf-8?B?SFJCTU41Wnc1L1JOK0FzS052clBIR3NUZGF6cXZBQlJndWxzSVJkVjNHbDRO?=
 =?utf-8?B?QkhqYU81QWYxTm5PcjRtMnlLaVY2L3FVVi90SFFxYzd5MDJ6ZEE5b3JMaDJ1?=
 =?utf-8?B?SkhEejloT2hsM1NzL3M1QVdPT0RxTEJoSENiUWUxaTlraG9sSVRaTmQ5ZFRn?=
 =?utf-8?B?eWFXYU5nUDdKanVORjlrVFJXT0R4c0toMUJ2Z0V5dEYwTG5jYzBabFpQUXh5?=
 =?utf-8?B?ZWxVY09TUy8wRVk2cUtFNS91eHMrS044N3EvbVVoVTViMkFaVmovNDZEMTJx?=
 =?utf-8?B?K0NGR0k1azJnQk5URmltU3VYWWQyd1c3M1NSaUZIQzNhNC8reXlURFpQcWd3?=
 =?utf-8?B?U09WK2oySHpzVVE5NXFxOW9mdnNmS1BMMWV6cGxiWDJaUFM2TUdLNHk5NDNP?=
 =?utf-8?B?V3hreU5lelBWYXA2dStITGJMYWVOaVE1RUtwUUdVeHorcUljTStpcHZjUC84?=
 =?utf-8?B?WGFIamJuUThic2FybyswTzRVY216NFFqNHlvRnRZTC80RkxRd1o3K0ljWUM3?=
 =?utf-8?B?ZkkwWGN4aHJhS3M2S2tMOS9LSUxYYUplbkJrTEc2OFFkbmY3aHFmWmRpcEdl?=
 =?utf-8?B?WGZ4WnA0blVDeXl0aXN1VGhZYzF0OWpicS9XMDRWTkgvbFFaa3dwNjBhQm9L?=
 =?utf-8?B?cG5NaEQyeFhaNzg0b1hiOWJrZndvaTFNRklDY2NLT1N0VHp3ZkxxWU5oWXlW?=
 =?utf-8?B?dCsvS3hNSzFLTjMybUJmSzBEb3I4TTRJV00rVldqdHdNdEc2dlR4eTFJcGNH?=
 =?utf-8?B?MkRrMFFOR0FUN0U1d25pOHJ6TFVDUDE4OUpLeE9LdGVmV0RRaVA0RUpwc21x?=
 =?utf-8?B?Vyt3TlcxUWJXTXFYWnFSZjVYUlRMNXpLZFZNUjRIdEJVNEkvaDJlK3pIRjdu?=
 =?utf-8?B?NnlOY2Q2U2svUW5kQkhrS0RoeFVLM3ptT3pDR2RWTzhHa25ZVmhBV2h3Sk9B?=
 =?utf-8?B?NktEQ3lVRjNITmdCUGt3T1VPWXNpa3o3WVF2cFZ1TTlad1hYbXZFR0ZoSjJP?=
 =?utf-8?B?TDVtVkdyQ0R3c3hJTHRjL2RXcmZBQmJORCsvTG1LQ2hiY2Nlb3NQdVoyU1gr?=
 =?utf-8?B?bE1xRkxzTFRyREc2OXM0VjBzTXpidzl2Y3ZpWE5HMFdNOEY2R0hLNEFmUHhk?=
 =?utf-8?B?UGl2bEJpdCtEQVQ4VGQvYlZCYUg3T0VIamp4NWJ0U3hTWGQvdG5GcXhjMmMr?=
 =?utf-8?B?RHNGUXFsOW56aHBUSHV5NS8xcHdFQTBCMzdEWldIZ1NOM2tkSThURHdMTVg2?=
 =?utf-8?B?MHpFN1E4OVV0RittQlNrQ1VQRlphNnhxckh1eGZadHp1VWt6OExLVmlURjVU?=
 =?utf-8?B?eW9GVU1yT0RCbmloQW84eUtZc2VpdlJBKzBMM2JNckcyOERlT0FCWWpXMGxI?=
 =?utf-8?B?RkdhTCtaM3pEbFRJeVlaWmN1N0h0WXhIVzV4Rk9uRjR2amRtRkJlOGRPR0F6?=
 =?utf-8?B?bkhxczhxZVg2NDYrVXFWUEo0WUp5SExPeFhqb2x6N3lmM0hUS0Vpc2lUMmNU?=
 =?utf-8?B?c21ta3hkNE1vNTB0MlYvWDdhMnRSYmxnTjRrQnJkbU9nU2NQTGQwcjUyeklF?=
 =?utf-8?B?QkZ6MFhWM1N6SzRlSWxQTmhlZ04rdFpwRnVWL1U2cE9MRHA3YXdsZHJteG9m?=
 =?utf-8?B?dGpOKzIwNlgxdWs2N1lmZHdSckJCdThyOXdmZEUwYlBsUmJqNTdBZVJzY3ov?=
 =?utf-8?B?dC9SUjhXVU93VkZoa2hSenovL2FNZnRlald1VWp2b0dDbmdkRnY5UUlvYzUv?=
 =?utf-8?B?Rkh0UFM0L29kakdQM080WHB1WThkLzRTdVIrL2ZLZTRHNXB6WnlhYUs0cTky?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d29bdbbe-0b16-4ef7-6f31-08dd3be3dade
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8450.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 19:26:37.3673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uMx9Lrub17oK4S2zwsrr/udXYjJ3lsmDQ+Mhv6GKReNoJ25LLQqJmosxH3H8PSRsjOB/2W158eV873A64jvi+9+qVzJgZglPpzblOHIkuHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8129
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

On 1/23/2025 10:45, Souza, Jose wrote:
> On Thu, 2025-01-23 at 10:17 -0800, John Harrison wrote:
>> On 1/23/2025 09:59, José Roberto de Souza wrote:
>>> All other binaries follow this format:
>>> [name].length: 0x1000
>>> [name].data: xxxxxxx
>>> [name].error: errno
>> What is the purpose of including the name in []?
> Make easy to identify if the line is a binary dump line or not.
> We have that pattern and should follow now.
>
>>> The error ones is just in case by some reason was not able to capture
>>> binary.
>>>
>>> So this GuC binaries should follow the same patern.
>>>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_guc_ct.c  | 6 ++++--
>>>    drivers/gpu/drm/xe/xe_guc_log.c | 3 ++-
>>>    2 files changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> index 50c8076b51585..497036675a38c 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> @@ -1723,9 +1723,11 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>>>    		drm_printf(p, "\tg2h outstanding: %d\n",
>>>    			   snapshot->g2h_outstanding);
>>>    
>>> -		if (snapshot->ctb)
>>> -			xe_print_blob_ascii85(p, "CTB data", '\n',
>>> +		if (snapshot->ctb) {
>>> +			drm_printf(p, "[CTB].length: 0x%lx\n", snapshot->ctb_size);
>>> +			xe_print_blob_ascii85(p, "[CTB].data", '\n',
>>>    					      snapshot->ctb, 0, snapshot->ctb_size);
>>> +		}
>>>    	} else {
>>>    		drm_puts(p, "CT disabled\n");
>>>    	}
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>>> index 44482ea919924..462ec4bb98bb9 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>>> @@ -204,10 +204,11 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>>>    	drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot->stamp, snapshot->stamp);
>>>    	drm_printf(p, "Log level: %u\n", snapshot->level);
>>>    
>>> +	drm_printf(p, "[GUC].length: 0x%lx\n", snapshot->size);
>>>    	remain = snapshot->size;
>>>    	for (i = 0; i < snapshot->num_chunks; i++) {
>>>    		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
>>> -		const char *prefix = i ? NULL : "Log data";
>>> +		const char *prefix = i ? NULL : "[GUC].data";
>> This is not printing the GuC firmware image, it is the GuC log buffer.
>> It should be called 'Log' not 'GUC'.
> okay, GUC_LOG would be better or just LOG? will change that.
What's wrong with 'Log' or even just 'Data'? This is in the '**** GuC 
Log ****' section so there is no need to repeat the full name.

John.

>
>> John.
>>
>>>    		char suffix = i == snapshot->num_chunks - 1 ? '\n' : 0;
>>>    
>>>    		xe_print_blob_ascii85(p, prefix, suffix, snapshot->copy[i], 0, size);

