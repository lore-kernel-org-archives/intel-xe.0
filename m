Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC06CD5BD0
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 22:20:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6E110E280;
	Tue, 26 May 2026 22:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RIQ5fq9A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9863110E280
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 22:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779834024; x=1811370024;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=uH7llrLMnYYp1F3ktidEx35NS9dSEiaG45iuRK7O5U4=;
 b=RIQ5fq9AFzv2+TQ+eqs6YV1LB46xyhnKG4dMCmcBOtXju1YvFOKbxaSO
 JYzcmCLDMaphn/2tPy8klO+3w7z8KuZstvASs7NfBL+gg5NFhnDyz0gcj
 drf0zJVQHqHWqNUSYoMPNKtZMupeRuNv3OPp4W0jAGhcuFtZyfWNsYUk1
 4rlaMf0xvLR5A9u2VuZKNFUFoNWTypolSsm+RlKpLyt993k2+MTfAKl4x
 ZycLNe1oDM72hUYqb0vX4/ohH0V8cyFegreuHf9EKsVRqtG4uzfFOf7Su
 2l18aL9D5rc9bPV7nBSLAm+7JG+MAXs8oU/wsIyQhZEwRLgkmrKwTZTqE g==;
X-CSE-ConnectionGUID: iDZ3XiaASP+cc1+Ii5vm+w==
X-CSE-MsgGUID: ZOR1IhG3Sy6BmL2mbLz9HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80387426"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="80387426"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 15:20:23 -0700
X-CSE-ConnectionGUID: dDjk43ylRyWfkbayEs8wEw==
X-CSE-MsgGUID: TcYR3qJ7RKKoV0370nnENw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="241010658"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 15:20:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 15:20:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 15:20:22 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 15:20:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SMnjaQcm4fUJ1RTxUkb6oyCyMSCimUUu/4r5D0TTYNZ2zvjyn8u6t/lUhs0fJJGR8w2yIW/mv8rNDo3gBqNaXLIMC9X6VZbPm3Mjhji8Dxupxz3BHLVe6JHRn4U46w8wPw0kRxAiWKdgd7m3SrsoNNoCAeW1+MKDaW5mk+MGaSOy904YsOmN4ToLyukoEUPsOgJ3TZe8DBOU5KHdp0uGvM8vY/A3wugBH7cCr1kDQh0kquBf2mpIoFU3rydCZ0PB4rZKzQJF/yuYTAN1uLbJfA1rlY73WAu4HerZHZw3VPJZkayVeyTsqn4tMEm7srjJzEpG41be0xrBZJBvr2FE7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvcaligZRX4UfRiQTzo2+oRz3y7EmDCGdWDp+nNiNF8=;
 b=VmmysssDRHBB+wRuXI7e4JEXoGzXX7zt8AseFkcV5l5GpnYA0xRmbFVaZjJMEHwY1fYoB9pLRnaxakl1aDNIhrq3txoz+flvhRYZCovM/q8xAX3MyJV/8sfhFxmU9xagRG35nO8VOiSCUWqfsL8V3Iq4Mqa0pHQex2JkL7VCb6jrvzLmfWFYrjFY6Bz+AVeooW0W4Lzzk1HpD7lVV8QVKZNIDmHXuOBk5NTgiGgyIw68CXcndDDdnbV4fX+w0ZE3DM6ahEwkcQr9AugZcehmCRte+0qFQj2HGHPW37yYL3uZee7GMAdrFZTn1SC+UaRg1g6tEs/ZCCA5ZZMfRhCnbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA0PR11MB7742.namprd11.prod.outlook.com (2603:10b6:208:403::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 22:20:19 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.21.0071.011; Tue, 26 May 2026
 22:20:19 +0000
Message-ID: <37ffcc51-8e68-4a52-bc27-40fbef28adfe@intel.com>
Date: Tue, 26 May 2026 15:20:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/xe: add exec queue suspended ops callback
To: <tilak.tirumalesh.tangudu@intel.com>, <matthew.d.roper@intel.com>,
 <thomas.hellstrom@intel.com>, <matthew.auld@intel.com>,
 <stuart.summers@intel.com>, <x.wang@intel.com>, <brian3.nguyen@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260526082700.1383831-1-tilak.tirumalesh.tangudu@intel.com>
 <20260526082700.1383831-5-tilak.tirumalesh.tangudu@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260526082700.1383831-5-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::13) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA0PR11MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: fe1fd2f2-f4f9-4d62-576b-08debb74f868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|11063799006|4143699003|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: gy7xBr08V8jOLDyTXZq0l+Gq7IRWzbUG2Pi9IKM/VR8toe/oA7AIeDQ66M8MlkwDoSSDEpaK5c/Pqzf4Gu6RaV8DJhhpZrUp0rH+sQfsepA8CVTmwnrf5Vzz5fQ5/DyewdKn7odM15p/MzedukmneOhhjCdSLYZDcTUuQPRtOL4slZptjUxW+16J03gk6rA/Oxm3cZwe+BtzpBaO+atw9/2EfhH1ptUBctb3cvXIB/gxbtkuKjr/GxveZVEcYqJg4iAVswnmVu74YxMxyEe1heSFYBkJ2ES6lpitG08tameWyYQMcrVoRwoO1b3PM1KN3naUjrbUIqkvTu/WNpp4DEZFqLGfNrEDO8+iTQrm+sRvNWv/xHWpNieJVhRqAKkrYZq0fZ5hmD6mC6GKoYQ5ujAl5hjGVwtQ1IpzOAyK3h130HqJzroTG8R0xMerMaoa98uNRF3ZhOeqcuFeLwLeFFmTtpwjfZYOWAkdbqeCqy1N2YxYprBrY7RAkmTuvOhnUinqtGRU/jEUdX/VNfhgoIZHxEqcDQdrSrgZx5gN0RD/proR9SZvacSKOKq+CijROb5a0dlPPRfqll1c0dqixwFCmaLjnI9QjYMIeon6SFYursAQVETgqOtBfYWq/xTgqydViwEdRoG8JciEj1/VmXz0E0C9woWvsPh6nJ8Vrpmsi73lYLOFRlLta80zZ9b6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckU3Znk1dW1UQjErNjczN0xIQXVCWjgxT2NBM0NYTUNUNzBGTXdsQmtodi8y?=
 =?utf-8?B?Mzd5SitTQS84T1JOZnVRVUNWSE1xTUM0RDZQY1JTZlNNN3hsMG0wMnBpOUV5?=
 =?utf-8?B?WXRMNXN0bXQ4NzJ5TXpYVzU0ZUQwT3duMGQ2RU1tWjlyZCtsZnlHYmM5eFVh?=
 =?utf-8?B?SzZsUXBtU1BXb3BZUVhxTThGd1p2V1JsUVQxYTk1ZzJ4anBsaHZxcWwwZExi?=
 =?utf-8?B?dGNveXZZRGlBVkYwcElDQUs1WVkzMVhNWmJTaEdMVE1jSTAzOUJPMHdmbUJE?=
 =?utf-8?B?Z3dnNGM5Y05uNGg4QWxuSDhnWjVsR2p4WUlKd29FcFk1MHNiL1orK0l0RGxU?=
 =?utf-8?B?Y2tIRlhxaW5Xd2IwZDRHVVBRbDNFaTNrWWVXRVkvMkhSb1luUlVaTEZJcnly?=
 =?utf-8?B?NHQ4YldqbUU0NmlvK2drSld3eTdiQ0JlSFhvWGhNU2hTdnhWTEdGMU9CbWt6?=
 =?utf-8?B?aDdaeEU0MTZWeHhJN3RXZ2c3cjlodm5FcHI2VTZzWWx1UktyaTBJYlVlYTJS?=
 =?utf-8?B?TTdQMEZzUUR3bnFYTXdnUEIzUEFqSmpzNzdWZFNlbldhRWZDNGFQbWFBRGJV?=
 =?utf-8?B?YkhGdU5sdmVyVStCZXhQZTJDbDQyYkoxTXRKZmdSUDhjSjNwL0JrbTVvN2Q5?=
 =?utf-8?B?MXcxVmdTTXF1c0ZweEtSWVpXY0RDbjZ6NW1COWZLNlBRdnJ1U0UwSThxVEZU?=
 =?utf-8?B?VGFwVTFyVFhIVlByanlQYjR1V3NyRGxkVjROWlFhRmFNSkZRb2VIUlNMSTNB?=
 =?utf-8?B?MzZTTmxmK1dFUGsyTDFTNGFsVWRBZzN3b05vL25TOWFJajM2SmVrWGxKQW1M?=
 =?utf-8?B?VWlSR3l6dzJZVkM2N0ZXaG1QQm1KbTVuQW0wNzRnTlBsRjZLZHV3cnU4bjhh?=
 =?utf-8?B?SkVUcjB3YkQ2b0haTzdVa2dXRERmbDRUTWdtUkNjY1JEdVdMc1VYV1dZUW8y?=
 =?utf-8?B?S2RoUk9XbnBYSGVCSWY4TUJINlZWaHJjaExrR1pVL2o1SmZROU1KN2o1dENZ?=
 =?utf-8?B?YW1QM0pOb0N6OWl5U05PQUc0dWcxWlF0OUM5ZGo5UjB1ZGRnRVVWWG5ReFZa?=
 =?utf-8?B?UG52dldNOVFrc2ZyN08wRnpuVUVmeTFCV3dDTzJmSWs1cys5dzRQZTlGeTJT?=
 =?utf-8?B?cXRlZDcyMExQS2hCcHlUdWZEL2NTLzZGL2tiYmR6VXVLc0FuWnZaYWJ1RExQ?=
 =?utf-8?B?ckhLV0s5cmZ4NDdHVmEvay92VnZKN1B1aUpYMGtYN2pQVWtERHQxMTNVMy9W?=
 =?utf-8?B?SmRCQ3UwdlNydGdsZktzcTVCL2grR2J5UXV0S2N2UmFHbVpnU2QwZUtiQ3pn?=
 =?utf-8?B?NVZORzRoeS9GRDljWXdzMGtxenhqZ3ZvZGhNb0hHL05iWEptcVhOK0VJS1Ev?=
 =?utf-8?B?cGY2T004WTFiN2tTdXJ1aTJzQk5wR1A3K1RBQWNVWHJEaEZSbndUdEgrczJN?=
 =?utf-8?B?a2VLMjBMMnVzcjU1YVdtd1NISTlEcEt4dUwyNXhkSGNsanppQWhFYkVsV3lh?=
 =?utf-8?B?MExvSHlOblh4UVdydXVDanI0VEVhTlNVQVVNajE5dGlQZFdqdlhlcDVPODla?=
 =?utf-8?B?bzdFbzBjQ2Rxc3FlNXJwN21WcEJBWHI4TmY5NVA4OC9QaXpLdmw0aHJDZ2ZV?=
 =?utf-8?B?Mm1McHdtSXJHK1VsY2lidnFsQjdSUUl3cXlGeUtCNFdlaENxQlhub3BmeXd0?=
 =?utf-8?B?d2swVURCZGhHZDVyY1dCZ0xpRzdEVnI5a1BmVnJsRmwrRjE3ZlBMSDdFNEdS?=
 =?utf-8?B?WEpYSTBBK1paRHVlNmk1VjczRGczTis3am53aWtnaHlvSXVwWHVBNXd0OGhw?=
 =?utf-8?B?VVVSaUc3dDFUTHBtREt0bFR4YXVkd3pCN0dKOVFBdTJKOC9NT3p2dloyVXJq?=
 =?utf-8?B?enpuUUxVMlBRRmpkQVB3MUtsNlFEdTZ2dXBlZTZvUFd1STdKOFpXc09TU3R4?=
 =?utf-8?B?bkt1T21kQWdtMzEvNG5NUXdHcXJ1MjBKdlYvUVN5VGpHYXcwa0Ztakd2SWJh?=
 =?utf-8?B?VnJOaFkxajNlUlVEMktmQ0U3Z0lqbk5iVm55dFpYWjdQYmFEcVJlN0xpd05a?=
 =?utf-8?B?Ymh5MGxIYUh4LytXREMxRHV6SEtOZVdrSlJNMURRMkJnNU9GY3JoVTNrVkRE?=
 =?utf-8?B?amZyVW9LckR5UVFna25Uc3FFQkRoQ1lOeCs5Y3Q0VUVxTzBmUHpiT0xQM1Fs?=
 =?utf-8?B?VDlxUWJjQ1ErNmRkUy8ySHc1dlQxbThNRG9UdkIvZ1pGRmlieXpKaUJueHla?=
 =?utf-8?B?TnUzTVFnby9jamY3QWhiUXBHcnBiMTl2UmMyNmpqd0xsSDBvanJXcUVDSnJK?=
 =?utf-8?B?WkYzdm5kSUM0OU5aU25kcXJmKzBIYWs0SFpYMS81OStYS05NQ2tqcVRoMWNj?=
 =?utf-8?Q?ZyWEHbvZCRsoq984=3D?=
X-Exchange-RoutingPolicyChecked: rg97dEfzfCpWQGZ7UZpY20eASCMV5JfdDOaXH3TspYPMLEk9EQLZjHcHxmbNlqfQTw8nAhINxdWptd16GX22JG0QJSlP2GDaROh65Rj2yCnmLWcNr00kscarWzGH247GGD5aslrZHVO8Tw86jKJMt5y/XwbfgaBhuLfdXbgqfzbfHxPrziqVKFsh7derHMDFIBvH9Excqz3DJ8dg2eN5Dpn+nIYZRedqEbY+FpKcxVIb9zThJOLJufUk6lryByITQGqzMlTJobT4H1BL8VgLxgu8vGtaKd2sXWls0j29+Uq4uRTsq83buDYTlQD2FP4vQFPV0te8h6GP6FDuUPnqOg==
X-MS-Exchange-CrossTenant-Network-Message-Id: fe1fd2f2-f4f9-4d62-576b-08debb74f868
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 22:20:19.4470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xELCcgAXgG8Emk8pOorV2BqKMdQhB9Aw+ODAgDwe3kzkkP1i32WpCHukPSH8pD0m6zqpBOg5ibgwgQlFpChshnOUeJ3hOjiGLTWeCZNEVZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7742
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



On 5/26/2026 1:26 AM, tilak.tirumalesh.tangudu@intel.com wrote:
> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
> Add a suspended callback to xe_exec_queue_ops and a generic
> xe_exec_queue_is_suspended() helper.
>
> Hook up exec queue suspended-state callback for GuC.
>
> This allows callers to query suspended state through exec queue ops
>
> Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec_queue.h       | 5 +++++
>   drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
>   drivers/gpu/drm/xe/xe_guc_submit.c       | 8 ++++++++
>   3 files changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 0225426c57b0..b66637325a11 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -116,6 +116,11 @@ static inline struct xe_exec_queue *xe_exec_queue_multi_queue_primary(struct xe_
>   
>   bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>   
> +static inline bool xe_exec_queue_is_suspended(struct xe_exec_queue *q)
> +{
> +	return q->ops->suspended ? q->ops->suspended(q) : false;
> +}
> +
>   bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
>   
>   void xe_exec_queue_kill(struct xe_exec_queue *q);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 2f5ccf294675..0cb7d49a1c83 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -320,6 +320,8 @@ struct xe_exec_queue_ops {
>   	bool (*reset_status)(struct xe_exec_queue *q);
>   	/** @active: check exec queue is active */
>   	bool (*active)(struct xe_exec_queue *q);
> +	/** @suspended: check exec queue is suspended */
> +	bool (*suspended)(struct xe_exec_queue *q);
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 787a02c46652..2d7f25880cfb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2217,6 +2217,13 @@ static bool guc_exec_queue_active(struct xe_exec_queue *q)
>   		!exec_queue_pending_disable(primary);
>   }
>   
> +static bool guc_exec_queue_suspended(struct xe_exec_queue *q)
> +{
> +	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);

Are all secondaries guaranteed to be suspended if the primary is? 
guc_exec_queue_suspend works on the individual queue and doesn't seem to 
guarantee that.

Daniele

> +
> +	return exec_queue_suspended(primary);
> +}
> +
>   /*
>    * All of these functions are an abstraction layer which other parts of Xe can
>    * use to trap into the GuC backend. All of these functions, aside from init,
> @@ -2237,6 +2244,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
>   	.resume = guc_exec_queue_resume,
>   	.reset_status = guc_exec_queue_reset_status,
>   	.active = guc_exec_queue_active,
> +	.suspended = guc_exec_queue_suspended,
>   };
>   
>   static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)

