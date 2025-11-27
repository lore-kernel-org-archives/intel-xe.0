Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE9ACFD2F6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 16:52:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39A310E82C;
	Thu, 27 Nov 2025 16:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kmn/UJOE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBA310E82C
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 16:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764262329; x=1795798329;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tNst+33BOZQ3TTyrwaSF+XxDkZbRKZR71kXrFjy24xk=;
 b=kmn/UJOECmwENFucAxqegp3AbpakmaswLDNSW0va5T28qAjoFtBYcsaH
 7NEkg5D+QpUT/gdvCiHcm2zVRB7kle7Re5+k/BLCD6DmT6V8P0oNCRtYQ
 uTgDDU0jGsoIwldl8zQluKnY5k6nqBpnP3cHSShGB+84RzFD/VBobRY0z
 K8TVz9in42Iwvja4Hpu/H5G/DeJfqVWou/bMg9jaLacL5ugF51xjSxgr0
 vHxNJrlWyyRjXb2FmR9I/1V7JB1y5XPpT9ByI/yR8NFtSzRrfYl1aq726
 ncyOrKVUq80rxHrepS1H6ckmX03yGtgmDgM5OJ7ZxIwyK14lEZKYHXblb Q==;
X-CSE-ConnectionGUID: kFGYOKFnTsGFhDcg3ylcJw==
X-CSE-MsgGUID: HDHH5N23RyyOnzMjbLjASg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="83704401"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="83704401"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 08:52:08 -0800
X-CSE-ConnectionGUID: Q9AXW4upT6WTpsacS9IJbg==
X-CSE-MsgGUID: 2I4UrMHEQqGKvd4/Kb8TIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="197587078"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 08:52:08 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 08:52:07 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 08:52:07 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 08:52:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=elY8leDljZ02XOmcBxQm5eyrv9qBvdNBSpx+gYsxmxcAfudLaTLubERieHSbQqSHZuZvUxnEaFd0KHyhsJcEKu2caALYzGxpXjifhz9y+U50hwshYwipbw1V7pZfDQ62gtpjWnpOAZg40T1tztPAJv565jnn0QN285uKac42AiNJj6FXnZg/tk5tdfrRnM6PfYjSQODp3oCtn68aOjLMtb5WP7g2WhMgVmUZvsFX1NQqGaM3Alafqdjnm2KfSZxI8wxpWzbO9tHglsU+auoEkflU7JX/tzEtuxx8W/PVkftp4dhjIKy6VIWb1QDK9z1Txk6B18L8lsRHQCHX6QF0Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UsRz6QCkqxYtM7f/H0W7z2iNhlaVq8ZBvG+4EOJDOyQ=;
 b=WPDt9Fb7fmvACCxAHEUI0Xi1xHG4pLW2p1blLwPPIr5HNctzveWztS4qdJQZvrXX5CJ5oAotpJzL/xt1JQ6s2QLCBGVMDy/rwzjQJCxJgAGLlJwjqc2orzDPKPOJP8If1Z7dBLjliUmn52aYb0Wz1rE0XgoJf/qB1KYYN9ObBKZTLLTk/ZR6q6q1MP7SRu3ExSjIm6C+11gV+cAA1AlcLGy8pt7TiSj4Q2kmOLh0MAHy61L4LBB4MMV0JRHkWpp9Yp/MH8SWvQUMCJj3xQGepmLvFIop3HQczxEV5WOWaqeEhQ9XrZspXCcovidFAk8RrvgFvLRf1BMX7fpKhxaaPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MN0PR11MB6010.namprd11.prod.outlook.com (2603:10b6:208:371::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 16:52:00 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 16:52:00 +0000
Message-ID: <003f49d3-fd57-47e4-bea0-3a3ef61a0933@intel.com>
Date: Thu, 27 Nov 2025 17:51:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] drm/xe/vf: Add debugfs entries to test VF double
 migration
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251124160719.29812-5-satyanarayana.k.v.p@intel.com>
 <20251124160719.29812-8-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251124160719.29812-8-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0071.eurprd04.prod.outlook.com
 (2603:10a6:802:2::42) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MN0PR11MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: dc090cfe-d345-4f85-59b7-08de2dd5487d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmR5Ty9NYWRNOWk0RlRTamY4SGxqMWt6U242OUFXY1J1MkZ2SWF1SVZsaFRR?=
 =?utf-8?B?cFVlZXJuNUo3Q1N6am04SHBaT1cxclVnUXA4WnA4WkZ1eXNBZkhDVjdtMFQ4?=
 =?utf-8?B?aERLRUE0cnNxNEYxTHk2NFRtTjhNUGpTRW94RTVYOHFkUmNDakxja3ora0Ir?=
 =?utf-8?B?V0MzdmQvL1JmNlFwU1hMaXZCZmloeXhnT3dyYkNJRXlSNVRqTVR3QzhyU2tt?=
 =?utf-8?B?a2w3YTV0eUJvNWVZM0NsWm1SQU9lRVlMNzlnbnM0VFZzRng1N1hyendiUDRh?=
 =?utf-8?B?K3lNNFhNUG5yWkQyVTg3djZoV0ZzWFFEYnh2VFdabUtQL29XaWpkVU9RWm1R?=
 =?utf-8?B?R1c0Nzc1ZXJ5TmlHWFFWMHloZDBiZXhtcDA0V0hxaURXRllpdDErRHNsQjdu?=
 =?utf-8?B?N2lsZ0RVcndnRkk1ZkFxd1YxMURMWHNoRWYzWHdQTkcrUzZuVDZva1Jqdml3?=
 =?utf-8?B?cnNYZnB0WGU2VWgyTTFNS1ArZXJ4UVB0OTI4VmxlSUlpQnZKbEdyZzdNblN4?=
 =?utf-8?B?ZDJPY0pFSkJOK05UajFRajZCUEdoQWVKRk8rdUdJNEhud2VVcmpXRElQaU90?=
 =?utf-8?B?bGdhcWFxQk9wbnNJdk5rNFlNcXBGRHUxL3haTWpudnU1SkQyTUc0Z1pYYk9w?=
 =?utf-8?B?K3FHYitMenc4OHRETjlMblU3c1JSdDYwWTR6NzR6UzhLRXUyeVhXQ3BValFU?=
 =?utf-8?B?T09OaVRTdjVpOGxKWkIwdjB4d1VlU05sUjhoZ2JCak9KT21HWFRudHhuRHVS?=
 =?utf-8?B?Q05tSHFDck9LNzd3TlZ4bE9QZkYrRzY4WHBFUFRGcVVIZXVRdHArY09KTnlP?=
 =?utf-8?B?dzVSa214M0Z1VEZndVFONWc5dC9OMlA0azFZZU92eU5GZEFteDd3QWg4QjBi?=
 =?utf-8?B?cW5ITUVtT2RyVzFOYkZsYlJjTFY0SDh6K05rMXZ2MTBBRVphT3J4T3hWVCtZ?=
 =?utf-8?B?NXFtNkJUZmRjaU9CcE1EOXp3SGswSEhoNkllTjZVcGZZVTVyTmd5ZFF1dURN?=
 =?utf-8?B?VDJOczkyMXlFbVlvQURzb01Va0R0Z3JZU1pzRHFiMmZ5alAzdTl4emYvb0pH?=
 =?utf-8?B?Qi9WSGhUYzdxRU81Wjd5YWpXamI4cFN3QVFwUmVyQXRIRGgzVlhPL3BlM3Nm?=
 =?utf-8?B?cm1Yb3dZOXRDKytFWjhWUEk4bCtodDdTQW55UjB1NFlScmlHd1BOL1pMQVJD?=
 =?utf-8?B?aE1pTFFiSWdOVFl5T2tGQmVtb0dYak84SXFRMGRPdVVHZEQ2VzkvWTZBTUFu?=
 =?utf-8?B?UzYwZjQ3OTZXcW5FQmJwbHcrV3diYjhwVDU2bkVVZ3Ftc0JHTjIwcldEcmhx?=
 =?utf-8?B?dlZKZkM1blpPQzRSWVowOVhxKy90VUVwM3BjSFRzSVMvbFY0S0ZXbEUwak1v?=
 =?utf-8?B?VjJ5SDJROVdGWDc1dDBqT3BxQ0tIeHh2MU92R3l5VjlhcDdJN21Ka3ZvcjRL?=
 =?utf-8?B?OXFJbjZkbkZLQ3VLbGs1VjU2QVU4UnM0elA1ZkVyT1ZTMTdwZ2RBaWZDdzFP?=
 =?utf-8?B?OVNHZml0bjlub09DSXRzTDBicnc2djd1aldRTCt6Smhqek83SVRUQmIvdmtE?=
 =?utf-8?B?bXJobk1BeTJYcHFkQUVWbXN1YUVGZVZUUzNnTk1lR3VldUJHZW9QSXBmb3Zh?=
 =?utf-8?B?SllYZ3llbmVQRUFva2k3NE5RdUlUcHFZNXI0cTFBbndiL0s3ZlRwQk5uL0hP?=
 =?utf-8?B?OWg4Y0FMQ2dTSEFObS9ZVERITWQvZVpTa1dBNDBNZmpsVXZzelpDd25ncmls?=
 =?utf-8?B?WGUxVXVxYU1yMFRWc0J1SzNpNVVOOExqYi9ESHpjM1gvR3JMSmZpdjV1b3g5?=
 =?utf-8?B?SjlJeUNLYjFxOUY4SEo4VVU3YnlvemJicUR1YXJ3V1B1N2dJN2JBS1dPdlEv?=
 =?utf-8?B?VDM4M2tyMWVmVWIvWHNwZ3ppMG9hUmhsLzg4Y0pUK3VrUlh1WndjaFhBTkcw?=
 =?utf-8?Q?X52fIqfGCdXcdZUvztwjieTwLOP81u3X?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDVySE94bzBYUFNRSjV5SHUrcjkvV2FTeUx3QjBXQndwajEvYitGUm4rWWIv?=
 =?utf-8?B?eXlFNlhVSjBPMHNsWlVFbGlqQXJZYWNtL213ck1HRkNCTXZrREIvTDR2QkNY?=
 =?utf-8?B?RTdac3AyMjlKK0hTU2hJZGlqRnBQZm5MRDY1Nm1Rbjd6NnhONUtLRGZyK1dl?=
 =?utf-8?B?Q0ZUbi9PN0R0WXJDQUdteGRWR1grVlZlSHk2QzZrQko3SUxnQXNKN2FacVJk?=
 =?utf-8?B?Z0NqZ1JiRUVIeFBLVCthZkxLdWVoZWNUWmIweTc3aEY1c3VyeGk3Ry9qK0tY?=
 =?utf-8?B?RzZCMnlJZ0xXb1huU3RUNjNXMDA4WUdBSGU1SVVvaGVCblNUaFlrcVl1MFFz?=
 =?utf-8?B?eXlQOWVoZGhTZzJkMmpHUndYbUhZeU5COXNqeFBkS2R3ekRlUjhUc3VZQXp2?=
 =?utf-8?B?ZVllUTdacGZiaGdGeXJwVGJlQ1JOZU5qMjI1QWk3VHNMdUsvNld0RDkwKytu?=
 =?utf-8?B?TzlwZ1VWSjdQdzNKK09MelZOalo2Zko5ZEtBM0JPdno1SXBJUXJTYW9ha3Zo?=
 =?utf-8?B?OUZENDJEYjhYKzAyU2dHVEZva09oNytPZnYrTER1QjZLZkZvOG5YNFMreUIz?=
 =?utf-8?B?Vi9YQTBDeC9mNHROUHdMbTRqaFdQUnphWDQ5TFpPYVVGbk9YenNOYXNOWTZw?=
 =?utf-8?B?c0Yxcko2eTZFelIrbjBYdjhVK1NtZkZRQlVSQmVZTUZrMGE3SjVJdVFwTjRJ?=
 =?utf-8?B?THpoN2dUbzBpWUJQV2xLL0lIeDJBSjdKUmVObVZ4Z1JwNUFTVGxEdEkrM0N2?=
 =?utf-8?B?enJRYk9ZZ0xVbmxTamZza0F3UW9FN2RFMDVVWlNJaENSN2RqWGoyOFVndnYr?=
 =?utf-8?B?UDJycEJTSkRkTUxNMGVTRk44cit4QVgwZG9oQU9yNDVsNDI4RFpqaDNPamtF?=
 =?utf-8?B?UE8zSG5zNURac1pxQlpTYVhLYjd5VEUxcm9ZNk02K0JoNnJybis3bU1xTGxy?=
 =?utf-8?B?TVg4RGs3SE1CS0dzWlM2V1NYSFVaWFN1S1B6eGNCLzg5dTFsTjZwTHd5VTVP?=
 =?utf-8?B?VzQrSkhOcEVVQWhWZmZybVE4bTNGU3lSRDZQYnVRajFzQjY1cE5SeDcyUHh1?=
 =?utf-8?B?dThyOU9zN3VGSkNXeU00S2pOUjQyZ1E2Und5MWR3ZTF1UW9TUEVhY0NubmI5?=
 =?utf-8?B?NWtQcnVRS1QvaFBMcStvWWZzV1Q2dzN6U0RMUDZlR3FtWWVRYlMzNDlSd0Uy?=
 =?utf-8?B?eERRNjl4Yjh1VmNXWS9CQ3JGUCt4ck9vU2JSL2NSVy9wMDBhNkZIMUxXdHhL?=
 =?utf-8?B?bnczS2x6b0IwUTRwWDh0TjBlcldOYlNVZEdpWDh5SjNrUjhEUy9zYXFDdUJR?=
 =?utf-8?B?UEwwbm5MVUpad0U5cm9XOFExM0duTURZeWNzSXRPbGNqQkgyQ2diMTBUbEZW?=
 =?utf-8?B?WGdyUnZ5dDB5cHpDT0dnZStSc0ZuRUpvMERieHhwbHBKYXVDR0U0dVdIV2Va?=
 =?utf-8?B?MjYxVWVrRUtZblo5b1Q1ZDBLaG1pYVM5eVhhblZ1ZGJYOWNRRXgzQ2huZ2RO?=
 =?utf-8?B?THZzVGJ6Q0FWSGFLM3NIMTE5eE10Q0h0NWV0U253S08wWjNmY3NqYTBvRVpV?=
 =?utf-8?B?UjZLZjZnakw0cDQ0bGNMYk8zYUhhZSs1QUh2WktyR0FTY1pJc2UyVW14ckl2?=
 =?utf-8?B?Z1UxNHo0NEw3T0FTcU8ydy9LRHpDVWdoNU16NFV5c2VxVS9XTUZNdG5UR3V4?=
 =?utf-8?B?eWF1OWo1WTZpOXNaQlo3Q1dYZ3oyanhtdmNqVWN6MitFajRJT0N5SXJrdEpY?=
 =?utf-8?B?eWdBVkR1MWlYRGdUWUx3ZFNJSk1IMzgyTFFvZDFXM1dLdit5RVN5SHVNeGxs?=
 =?utf-8?B?VzRaeE4zczJwVk1BTW9xOEtZSHQrQXN3WFpQS2wxNEVLV21FVkZaaHZLb2Fl?=
 =?utf-8?B?Q01zUmJMRE1qQnRpemtPdVBYRGlsZlV2T0tFdi9yVEFkVU5PaDk0b1NxaTNk?=
 =?utf-8?B?NWwrWWpCRUNKN3hXQy9FQnZRdVg2aWJYZHpwOEJiRmExM3ZEUFNFRnZxazZ0?=
 =?utf-8?B?NXlab2dpQzdWZ21OZi9kZGJaR0J5aWhwazRROUV5b1p2bnZybFdWaldkUDJC?=
 =?utf-8?B?NDdndVZtUU43Q1V5NWh6dHA4d2hRbE5zNzFndjlRUjdia2h2S3FDNXFIakVX?=
 =?utf-8?B?K3NVV3F0MFZYalBIdmJRRUxvRVgrUkZ0TEV6cXZIOUZZSXNjdHdFaWI4QXky?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc090cfe-d345-4f85-59b7-08de2dd5487d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 16:52:00.2503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5ZH8Se/0aeDf4Xo7ihtySjnXw4q2KmysvdPbLV39A+Op0+Jel69kZipvH9fFXHsDo6Dmn3MyagMrLejGoM9/TdCBH0V2JzUVHaBjLQA43g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6010
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



On 11/24/2025 5:07 PM, Satyanarayana K V P wrote:
> VF migration sends a marker to the GUC before resource fixups begin,
> and repeats the marker with the RESFIX_DONE notification. This prevents
> the GUC from submitting jobs during double migration events.
> 
> To reliably test double migration, a second migration must be triggered
> while fixups from the first migration are still in progress. Since fixups
> complete quickly, reproducing this scenario is difficult. Introduce
> debugfs controls to add delays in the post-fixup phase, creating a
> deterministic window for subsequent migrations.
> 
> New debugfs entries:
> 	/sys/kernel/debug/dri/<card>/
> 	├── gt0

nit: use of top level gt0 is deprecated (this is a link added for backward comp)
maybe show real path:

	├── tile0
	│   ├── gt0
   

> 	│   ├── vf
> 	│   │   ├── resfix_stoppers
> 
> - resfix_stoppers: Predefined checkpoints that allow the migration process

drop -

> to pause at specific stages. The stages are given below.
> 
> VF_MIGRATION_WAIT_BEFORE_RESFIX_START	- BIT(0)
> VF_MIGRATION_WAIT_BEFORE_FIXUPS		- BIT(1)
> VF_MIGRATION_WAIT_BEFORE_RESTART_JOBS	- BIT(2)
> VF_MIGRATION_WAIT_BEFORE_RESFIX_DONE	- BIT(3)
> 
> Each state will pause with a 1-second delay per iteration, continuing until
> its corresponding bit is cleared.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> 
> ---
> V5 -> V6:
> - Fixed review comments (Michal W).
> - Removed timeout and VF KMD waits infinately when resfix_stoppers bits are
> set.
> - Created helper macro for WAIT positions.
> 
> V4 -> V5:
> - Updated debugfs entries (Michal W).
> 
> V3 -> V4:
> - New commit
> 
> V2 -> V3:
> - None.
> 
> V1 -> V2:
> - None.
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 38 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c |  5 +++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |  8 +++++
>  3 files changed, 51 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 8e3fba6521f0..aabc3064c3ef 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/bsearch.h>
> +#include <linux/delay.h>
>  
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
> @@ -1228,6 +1229,35 @@ static int vf_post_migration_resfix_done(struct xe_gt *gt, u16 marker)
>  	return vf_resfix_done(gt, marker);
>  }
>  
> +#define VF_MIGRATION_WAIT_NO_WAIT			0

do we need this?

> +#define VF_MIGRATION_WAIT_BEFORE_RESFIX_START		BIT(0)
> +#define VF_MIGRATION_WAIT_BEFORE_FIXUPS			BIT(1)
> +#define VF_MIGRATION_WAIT_BEFORE_RESTART_JOBS		BIT(2)
> +#define VF_MIGRATION_WAIT_BEFORE_RESFIX_DONE		BIT(3)

nit: maybe define them as enum? and "BEFORE" tag seems little redundant

enum VF_MIGRATION_WAIT_POINTS {
	VF_MIGRATION_WAIT_RESFIX_START = BIT(0),
	...



> +
> +#define VF_MIGRATION_WAIT_DELAY_IN_MS			1000

move it under below #ifdef 

> +
> +#define VF_MIGRATION_INJECT_WAIT(gt, _POS) ({	\
> +	struct xe_gt *__gt = (gt);		\
> +	vf_post_migration_inject_wait(__gt, VF_MIGRATION_WAIT_##_POS); \
> +	})

nit: please make sure to align to the same column trailing \

> +
> +#ifdef CONFIG_DRM_XE_DEBUG
> +static void vf_post_migration_inject_wait(struct xe_gt *gt, int wait)

s/int/enum

> +{
> +	uint delay_ms = VF_MIGRATION_WAIT_DELAY_IN_MS;

do we need this ?

> +
> +	while (gt->sriov.vf.migration.debug.resfix_stoppers &  wait) {

double space before 'wait'

> +		xe_gt_dbg(gt, "*TESTING* injecting delay due to resfix_stoppers = 0x%x\n",

from this message we might still don't know where we wait if multiple bits are set
maybe just print the 'wait' bit, or all info:

	"*TESTING* injecting %u ms delay due to resfix_stoppers=%#x, to continue clear %#x\n",
	VF_MIGRATION_WAIT_DELAY_IN_MS, gt->sriov.vf.migration.debug.resfix_stoppers, wait


> +			  gt->sriov.vf.migration.debug.resfix_stoppers);
> +
> +		msleep(delay_ms);
> +	}
> +}
> +#else
> +static void vf_post_migration_inject_wait(struct xe_gt *gt, int wait) { }

nit: maybe instead defining empty stub function, just define stub for macro ?

> +#endif
> +
>  /*
>   * Reset the marker to 1 after it overflows since GuC requires a non-zero
>   * marker to be set.
> @@ -1266,18 +1296,26 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>  		goto fail;
>  	}
>  
> +	VF_MIGRATION_INJECT_WAIT(gt, BEFORE_RESFIX_START);

do we want to have all these wait points defined here in vf_post_migration_recovery()
or maybe we should add those macros inside relevant functions?

	vf_post_migration_resfix_start_marker(gt)
	{
		VF_MIGRATION_INJECT_WAIT(gt, RESFIX_START);
		...
	}


> +
>  	marker = vf_post_migration_resfix_start_marker(gt);
>  
>  	err = vf_resfix_start(gt, marker);
>  	if (err)
>  		goto fail;
>  
> +	VF_MIGRATION_INJECT_WAIT(gt, BEFORE_FIXUPS);
> +
>  	err = vf_post_migration_fixups(gt);
>  	if (err)
>  		goto fail;
>  
> +	VF_MIGRATION_INJECT_WAIT(gt, BEFORE_RESTART_JOBS);
> +
>  	vf_post_migration_rearm(gt);
>  
> +	VF_MIGRATION_INJECT_WAIT(gt, BEFORE_RESFIX_DONE);
> +
>  	err = vf_post_migration_resfix_done(gt, marker);
>  	if (err == -EREMCHG)
>  		goto queue;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
> index 2ed5b6780d30..66d5ffd0e371 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
> @@ -69,4 +69,9 @@ void xe_gt_sriov_vf_debugfs_register(struct xe_gt *gt, struct dentry *root)
>  	vfdentry->d_inode->i_private = gt;
>  
>  	drm_debugfs_create_files(vf_info, ARRAY_SIZE(vf_info), vfdentry, minor);
> +
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {

add here small info about location of this new entry (like it's done for other files)

/*
 *      /sys/kernel/debug/dri/BDF/
 *      ├── tile0
 *          ├── gt0
 *              ├── vf
 *                  ├── resfix_stoppers
 */

> +		debugfs_create_x8("resfix_stoppers", 0600, vfdentry,
> +				  &gt->sriov.vf.migration.debug.resfix_stoppers);
> +	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 66c0062a42c6..3ece00f74e46 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -52,6 +52,14 @@ struct xe_gt_sriov_vf_migration {
>  	wait_queue_head_t wq;
>  	/** @scratch: Scratch memory for VF recovery */
>  	void *scratch;
> +	/** @debug: Debug hooks for delaying migration */
> +	struct {
> +		/**
> +		 * @debug.resfix_stoppers: Stop and wait at different stages
> +		 * during post migration recovery
> +		 */
> +		u8 resfix_stoppers;
> +	} debug;
>  	/**
>  	 * @resfix_marker: Marker sent on start and on end of post-migration
>  	 * steps.

