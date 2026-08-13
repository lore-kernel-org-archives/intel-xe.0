Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EA2C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 14:30:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0721B10E044;
	Thu, 13 Aug 2026 14:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eUp260K2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6889E10E044
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 14:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786631432; x=1818167432;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=oOH1jfw8Cr8hytTbDOvGJg9Kf3T5JuyesIGCR2XvgEU=;
 b=eUp260K2b167Lf4Klb6zG1S7Jn8VQysA3vlpMyDYcAtPcpaWFBYbX36t
 OsUtk5x9SmkfA94x+NPRr16vZ45rRt/NAwhLOPTtB1ZgejFeupTQCXVH1
 GgL8GHIJIcg1k4kz+eSLnGLT/+QYICG/xCOMTop9yLIRg26WZxc0YLY/S
 zQxjRGA6WvOdkeWfLWMuzSXrQ/+/kZVQWBHlMLOuuEUAPBqrN9R8RAp2p
 lVnh7JzUEbBIDtwDQd6bG/LRRxwFAN8nC/9zDtXvkzuRf2oVg/UPnrUy6
 rBEFquBYeMOCqOuO0/NAfO61ZCwx5rJPJGYh8Wh0kyJP1B8NR8V7rJHfa Q==;
X-CSE-ConnectionGUID: mYCvbrTTTX+4tW46YnbmAQ==
X-CSE-MsgGUID: X4HjvxIaT5Wl1dYyHBw/2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87087724"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208,217";a="87087724"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 07:30:32 -0700
X-CSE-ConnectionGUID: u+DFhWc4ShyPq0/gUgU4cA==
X-CSE-MsgGUID: bKoGTUgoT2KWLilM6w4SLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
 d="scan'208,217";a="302211248"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 07:30:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 07:30:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 07:30:31 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.16)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 07:30:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ak+zaMLpak7hwh6uMXFQ5gGRCsapoZRs+aCY9H6WvBwMtN7ipFa6JErCUkhfrIIoJzwSyZo96flIbmeFlrUNdU6u3Y5ORPAewSpkwwsSppYTiIGftS600oWCVOp84qr5I8yaog+skp0+OdGNHvFIbCAwaCrrywj+IfQe12zSb6BkhTgcp/7IVzXuXS2NmSY5ZiLRPuKBHeREm134znmmvkiHPZ5hwgLg0CCeJILDHljPedxea+XSiVjtU/PRwtpBCAequrtygubjieBJeMJIqkTm3wN9V4R4VbX4bDscW+4Yvfd+0uSXm4ACnuwPOUKcY18sRivPWkkfpeaRiqibAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QtTpfGdlekVEbQM4kMCNYsq+BOSoc4Dtxdw+QdRJSfw=;
 b=ibHLk6bNEBZ5VGXC0IdSgxbvqArKRv+btU7R9xRL61kP39D6QgEApCVBNrK0y5GVwpf6rlYT9sPHm+AflApEp/j8RT2IcvMW0308or5ugHovvBTvC9RmofFHGjV7Ui6Zp3aoOvxeuEIik0r2+b+uaXB0SQ5lSq2/mbfMqVtNsa1hJHBlrr8NlgvP8oc+eju7uR0NJu7+M4Xt0LFhUH1wGXPO0W445K/drSUolQcN6yrB/RTxJA/a/heLTy1JkTugQZgb023AXZbksXtrjQ9RZVKWHSfhmf27mxoMEtkWhwlxQRTeZW7NbEdN47FnvSg5dh0fryfw8PtSEqodUHB3Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by SJ0PR11MB5006.namprd11.prod.outlook.com (2603:10b6:a03:2db::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 14:30:27 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 14:30:27 +0000
Content-Type: multipart/alternative;
 boundary="------------nANT00UCBikxkb1Z1P6gJ7hK"
Message-ID: <0e309e05-01d9-404e-9f44-6638175a05f8@intel.com>
Date: Thu, 13 Aug 2026 20:00:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,10/10] drm/xe/vsec: Update PMT internal access for CRI
To: "Michael J. Ruhl <michael.j.ruhl@intel.com>" <michael.j.ruhl@intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "hansg@kernel.org" <hansg@kernel.org>, "ilpo.jarvinen@linux.intel.com"
 <ilpo.jarvinen@linux.intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "david.e.box@linux.intel.com"
 <david.e.box@linux.intel.com>, "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
 "Nilawar, Badal" <badal.nilawar@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Ausmus, James" <james.ausmus@intel.com>
References: <20260812193742.2170188-22-michael.j.ruhl@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20260812193742.2170188-22-michael.j.ruhl@intel.com>
X-ClientProxiedBy: MA0PR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::20) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|SJ0PR11MB5006:EE_
X-MS-Office365-Filtering-Correlation-Id: a7901cdc-8082-4f92-96c0-08def9476b0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|8096899003|22082099003|18002099003|56012099006|11063799006|10067099003|921020;
X-Microsoft-Antispam-Message-Info: W0IUIWSpAjr4HDPRuvCVuPs0ZnzekfOjWGCfmgcxa0EexDw+KEQK66RIKrSv6xo5Acw2XzleTeqOu7ZAZ1N80NysZr1fVFAH0Y1XHp/hfw7MouNnEpN6OPiwHhXGe3cyv4QxtVm0UPIv9mGScegwv5isUsBwWkq9h33+bzqB7ZU2ZAjCDbTVp7Y8kLxybv1p27DaarnQPkyptcEppqExSw3GUdoBQfyqZxc+hDZUFNcgeYHVAivG1rKsS29//8T26EDBDrgcxDlA63FaombN+5bsjFaKZPg1PXZWaSoLjCRU9n4n3Po5EBYrjo1GI3StgG3M+dKvNYgQBa6Os3JB0A0pPvNyM687URNEBvoXuaCk/zvpRhLYiNQIfaUSxQN6T0zfhcB9/kDhJWDRrGZ8GVTJ2Xf3L5lu5iCM64B9ilxhuWegRzHWIc87+wLBTCQKdCQOCCJnL1fDIW6/RDDTQhcb8Ulz3wTIkTIlCu+z0LumwIV7yEQC8Lj9F7vW9/mvW68LUu3jubHO5PI60rQj90dMBX/K6J68rV9FoSrY2tgiHR+rETo5VBP/IZiErK4e5PSsVN7BfDpy4lN/kvYJ3i9N9953OSwLnx6gSmkNCC3XjffayhwkmvpMc4GSFjhS3recb4TuMy8lMcK8kdCpgkgEsk/P4b5MLcHe2bCLzHYZBr+SkB/lA029942ezNJFIFpwe3xEizK5WAAXqViD7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(8096899003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3ZjSDBzbGM0N2ZWUjdUTkVhMXRCajVIWjRENFFNLzVOenErVVZaY2lOTnpK?=
 =?utf-8?B?ZC9HeFVWVXdaV0MweHFCVXEzOFZ3MG5HVXZLaERKb3dlUnNFajB4RWtjOWJE?=
 =?utf-8?B?dWx3US9hRGtBTWh1SjR6Sk4zSm03M0taY3JYdzBUVTdORTNxaWdoYjZpZlFI?=
 =?utf-8?B?SXRYYnJXQWIvUUVvajJMNjdGLzZ4WGR3dmFWOVdQQ1JUZ2x4SmZLVmxmdEtR?=
 =?utf-8?B?bVQ5eUUyY3RTTTV5WHBIYjJHLzdJOEhiVjNTZjNLQXI0cVZORXU5YVhwNHNQ?=
 =?utf-8?B?RFhNQXpaeWxkU25ONGpucC8rRFZMNk5IeVhDTG9vcU9PdjY0eVprVDdYai9s?=
 =?utf-8?B?WmFCTnJLRThmc3JBUmRjSUpwZFpjNXlzQmgranl4NWNNaWNmVFRkM1ZXZ0pO?=
 =?utf-8?B?ZzVpRmVvSUNSai83cDJoOHpXdExEbjVFQ2JyUWJTcFVrUmp1cUZkR1VLMW4w?=
 =?utf-8?B?ZHNDSi9aOExTdElROFB4VG1wQmwrZ3hsUjBhZUpNWW1yU3k2M0llZ3FYN29m?=
 =?utf-8?B?YTRBYnN3ZzdpRHpINFdUWERVWW9uMWZnRlZ0a1Q3Mkk2YTlUejFYQ0c4a3Rw?=
 =?utf-8?B?WWtsMDRqZHVpbGpJYnhiSFRTN1lRQndBRDhUMUE2Zyt1RGZ1bTdpMXNuMFJj?=
 =?utf-8?B?b09aTi9EMFFma1A4bUovZm9hQlNZUEVXMlNKRlBNM2FtWVh4SnJpWUw5NFVN?=
 =?utf-8?B?eWczVmZsc1RaV1BuWmpUZUFBVlNvNjlLbEtUbWdsakZHZmUrRFJvK2J3TUxH?=
 =?utf-8?B?eHJrWWEzRmZleGpvcC9kNDh6UmF5Q0VhVi9FN0t1K2N2VlFIYldPL0pnMTY4?=
 =?utf-8?B?Ulp2OFFnVWdWQUM5cFN1N2FXRzJaS0tGTVRhczJGQVhVSkQ4dFdFTUJVWWFB?=
 =?utf-8?B?dCswRERSUDUvQVRUL1pBMzZJdGhKcTZaWnBjVXg0bnYwOFAyTHBhNE1lYWxE?=
 =?utf-8?B?MzJZTEJtdDJsNU5Mb3ZuUVhXUDI1dDJzVWV6eWJmS3ZTUURZTWpVb3FTUExD?=
 =?utf-8?B?c3JzTVVSbnlkNnBhL3BOZDhLbTFIZnpVUXBrVzVvcWU4VGJJWDlwRHhROGZy?=
 =?utf-8?B?TVR6Sis5SFErQ204bGErUElWdmFmZHBnQ2kvWXdGb2JlZjV4RDNGUVNKNEZl?=
 =?utf-8?B?K2NPQjhJYWRlOWtoUW8zM0F2c0I1ekZmc2k1QjltV3ZxZUw3V1NXTHRZK2Y2?=
 =?utf-8?B?SEJaOTczTTRLYmZScXd4NENVSG1nV1V2bXJqeUZPU3IvUDlWdXRyd1EvVGRY?=
 =?utf-8?B?VEFuYkZlK1lYUE1hbnJrQkhDREtkaWtVc2R5ZktUViswK1BuWXRYemJLWEdv?=
 =?utf-8?B?dHFod2xrMWpESHd5Q0llQnlXQ1lPRTVETVFuZUlOTzhJcitCQWdoN2t5UUZt?=
 =?utf-8?B?WHdYU2tHRTJKNnFidjJ0Q2plWFkwTVJIbWlyVmtUcDRrdGpIa3hpYXdrckhq?=
 =?utf-8?B?ZDVQaHppc0hxWG1GZ09wSlg4NUV1cXdZWXhJaHdZZmRGRzRQcHZVZDN3VWpW?=
 =?utf-8?B?c28xODNQOXBCcEtOS2xjL1JScTlaUmh6aUduOEhGOXplZXRiYkU5UUhlYUJH?=
 =?utf-8?B?ODhIZElRcmVEM0xLakZpclpmVEUzcCtVT0g2RXI1UXFkeDlDQW5QMDU1cG9o?=
 =?utf-8?B?bHFkZkcyRDBPZGl5eDRjMDhlRTJYM05DUTd6WVBrRlZteUozUWVPc3RTSkhn?=
 =?utf-8?B?Nng3dW9rVG1HQ09iOXRhRDNpbjZETXpyU2xZZitHTnMrTGJDcDNRcUk2SXJG?=
 =?utf-8?B?UWJUSi9TQ1BNSU1YWGtiQnBNRU5Xc0xyWU02aUc4aFd1Vk1EMmpTQmlWWFhG?=
 =?utf-8?B?NHVCa3hyeG1wZGdhdC9IdVRHb1hQenRHVmJvSXo0dXJPSWsrb25BMlE2UUR0?=
 =?utf-8?B?UTkzMWxmSW9OSlBFeXFNRlZucWNBZ25SdkxPNHVHRVZCYU03VlZxcHZFZVNQ?=
 =?utf-8?B?L0J1N1ltemtyT1pLMjFCZlFRUmtNdlJJZmY2dlRYSVBLL3J1MTk5Q3F4Ulp0?=
 =?utf-8?B?aHVpQWE5QUFMb0gySVMycVQ1MFhBK1htQTcreVlOS0IxeDVtbUJUeUhpbER0?=
 =?utf-8?B?ZkJzZ2RKYnNzbThNZUF6bm80dFBkaVl5MWhoNzRzUUtaZ0NBRXBhS1hRVkpp?=
 =?utf-8?B?cVY4b1prRWxDZHlyNjc0RFdGQSthL3R1RERyNzdXV0xvdmt6UnFWQ0hXb2Na?=
 =?utf-8?B?SEhjcVRndzA2c3ZCODVqbDVlbEpCTkMyRnVUajhjcndJL3JjRWdici9WdTVO?=
 =?utf-8?B?S3E0L1BjMy9TNjQzV3k0dHE5a3lhZWZLUkMzcFdzTVZHWlo3Mm9aanhPL3po?=
 =?utf-8?B?M215VS9Bdzk0WWQzNWZMTHovK3AyeDl1dWNLREthRXZEQ2VVOVVHQT09?=
X-Exchange-RoutingPolicyChecked: DxfoZ7HoC/oo+YuaHfwk2UKz63uzrmxPiO/s0fcmW+V0Cx5guGP8O+bV64sxWeLGaoAi+AdoHE1nWMeVmtdhzstFFQ9LBfbzAJmMwVlDkJvP8tMVccU+koJlOQsm9AQCmtXHKTYyb7BtuqfbOVx8c7Ntk1bWtj4TLHohAvKxMci9zuPKbS/t0G/1BZx7Uph4SwphWibZkd02gqKu3g+/jAQ1FJF+PPM6TRgEfwuyC9C81p6BUxwgh4sy3lx5/UJyO2z8ZvEjHRFNaeqFD0Kv+57XMrml+LQnWZcqGqMkvPMeAMIcRX1yeXzaNI6AddytwjxnRc2THuqOudp55ryDfA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a7901cdc-8082-4f92-96c0-08def9476b0e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 14:30:26.9011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: brNBIGPbSr6MhDRgyR2Nc072OeLwIQ4rnUNkBpPYLO1I/c2tAzllEQnuAJJNlRkw/sN41m3kbvnE6tX3jycrJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5006
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

--------------nANT00UCBikxkb1Z1P6gJ7hK
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 13-08-2026 01:07, Michael J. Ruhl <michael.j.ruhl@intel.com> wrote:
> Xe access the PMT infrastructure directly. The current usage
> is supported ONLY by BMG devices.
>
> CRI has further requirements for access.
>
> Add a new API to access the GUID based on the platform.
> Use the API get the GUID for each device.
>
> Signed-off-by: Michael J. Ruhl<michael.j.ruhl@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_pmt.h |  4 +++-
>   drivers/gpu/drm/xe/xe_debugfs.c  | 30 +++++++++++++-----------
>   drivers/gpu/drm/xe/xe_hwmon.c    | 10 ++++++--
>   drivers/gpu/drm/xe/xe_pcode.c    | 10 ++++++--
>   drivers/gpu/drm/xe/xe_vsec.c     | 40 ++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_vsec.h     |  1 +
>   6 files changed, 77 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
> index fc9c9cb6a830..683bf401dc9d 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -10,7 +10,7 @@
>   #define BMG_PMT_BASE_OFFSET            0xDB000
>   #define BMG_DISCOVERY_OFFSET           (SOC_BASE + BMG_PMT_BASE_OFFSET)
>
> -#define PUNIT_TELEMETRY_GUID           XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
> +#define BMG_PUNIT_TELEMETRY_GUID       XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
>   #define BMG_ENERGY_STATUS_PMT_OFFSET   (0x30)
>   #define        ENERGY_PKG                      REG_GENMASK64(31, 0)
>   #define        ENERGY_CARD                     REG_GENMASK64(63, 32)
> @@ -25,6 +25,8 @@
>   #define CRI_DISCOVERY_OFFSET           (SOC_BASE + CRI_TELEMETRY_BASE_OFFSET)
>   #define CRI_TELEMETRY_OFFSET           (SOC_BASE + CRI_TELEMETRY_BASE_OFFSET)
>
> +#define CRI_PUNIT_TELEMETRY_GUID       XE_REG(CRI_DISCOVERY_OFFSET + 0x4)
> +
>   #define BMG_MODS_RESIDENCY_OFFSET              (0x4D0)
>   #define BMG_G2_RESIDENCY_OFFSET                (0x530)
>   #define BMG_G6_RESIDENCY_OFFSET                (0x538)
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index eeceab4a9901..67903c854562 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -97,11 +97,16 @@ static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
>                                     u32 offset, const char *name, struct drm_printer *p)
>   {
>          u64 residency = 0;
> +       u32 guid;
>          int ret;
>
> -       ret = xe_pmt_telem_read(xe->drm.dev,
> -                               xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
> -                               &residency, offset, sizeof(residency));
> +       guid = xe_vsec_get_guid(xe);
> +       if (!guid) {
> +               drm_warn(&xe->drm, "PMT device is not powered\n");
> +               return;
> +       }
Instead of reading the GUID for every residency counter access, can 
|xe_vsec| read it once after OCODE is loaded and then use the cached 
value internally when |xe_pmt_telem_read()| is called?

> +
> +       ret = xe_pmt_telem_read(xe->drm.dev, guid, &residency, offset, sizeof(residency));
>          if (ret != sizeof(residency)) {
>                  drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
>                  return;
> @@ -706,23 +711,22 @@ void xe_debugfs_register(struct xe_device *xe)
>                                   ARRAY_SIZE(debugfs_list),
>                                   root, minor);
>
> -       if (xe->info.platform == XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
> -               drm_debugfs_create_files(debugfs_residencies,
> -                                        ARRAY_SIZE(debugfs_residencies),
> -                                        root, minor);
> -       }
> -
>          /*
> -        * Pcode version read from PMT is currently only supported on CRI and BMG platforms in PF
> -        * mode, as both platforms support the necessary telemetry read mechanism and have a fixed
> -        * PUNIT_VERSION_OFFSET.
> +        * Residencies and Pcode version read from PMT is currently only supported on CRI and BMG
> +        * platforms in PF mode.  Both platforms support the necessary telemetry read mechanism
> +        * and have a fixed offses for the required data.
offset*
>           * Attempting this access on other platforms must be verified before enabling support.
>           */
>          if (!IS_SRIOV_VF(xe) &&
> -           (xe->info.platform == XE_CRESCENTISLAND || xe->info.platform == XE_BATTLEMAGE))
> +           (xe->info.platform == XE_CRESCENTISLAND || xe->info.platform == XE_BATTLEMAGE)) {
> +               drm_debugfs_create_files(debugfs_residencies,
> +                                        ARRAY_SIZE(debugfs_residencies),
> +                                        root, minor);
> +
>                  drm_debugfs_create_files(pcode_info_debugfs,
>                                           ARRAY_SIZE(pcode_info_debugfs),
>                                           root, minor);
> +       }
>
>          debugfs_create_file("forcewake_all", 0400, root, xe,
>                              &forcewake_all_fops);
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 49f7e0edcc4b..db48594fcc1f 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -517,9 +517,15 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
>
>          if (hwmon->xe->info.platform == XE_BATTLEMAGE) {
>                  u64 pmt_val;
> +               u32 guid;
>
> -               ret = xe_pmt_telem_read(hwmon->xe->drm.dev,
> -                                       xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
> +               guid = xe_vsec_get_guid(hwmon->xe);
> +               if (!guid) {
> +                       drm_warn(&hwmon->xe->drm, "PMT device is not powered\n");
> +                       *energy = 0;
> +                       return;
> +               }
same as above
> +               ret = xe_pmt_telem_read(hwmon->xe->drm.dev, guid,
>                                          &pmt_val, BMG_ENERGY_STATUS_PMT_OFFSET, sizeof(pmt_val));
>                  if (ret != sizeof(pmt_val)) {
>                          drm_warn(&hwmon->xe->drm, "energy read from pmt failed, ret %d\n", ret);
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index ccc3bdeed6bb..1b93fda1f41a 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -368,11 +368,17 @@ ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See xe_pci_probe */
>   int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *version)
>   {
>          int ret = 0;
> +       u32 guid;
>
>          guard(xe_pm_runtime)(xe);
>
> -       ret = xe_pmt_telem_read(xe->drm.dev,
> -                               xe_mmio_read32(xe_root_tile_mmio(xe), PUNIT_TELEMETRY_GUID),
> +       guid = xe_vsec_get_guid(xe);
> +       if (!guid) {
> +               xe_warn(xe, "PMT device is not powered\n");
> +               return -ENODATA;
> +       }
> +
> +       ret = xe_pmt_telem_read(xe->drm.dev, guid,
>                                  (u64 *)version, PUNIT_VERSION_OFFSET, sizeof(*version));
>          if (ret != sizeof(*version)) {
>                  xe_warn(xe, "pcode version read from PMT failed, ret %pe\n", ERR_PTR(ret));
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index bed5103dac19..a56f988d13eb 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -565,6 +565,46 @@ static void vsec_disable_late_bind_work(void *arg)
>                  xe_pm_runtime_put(xe);
>   }
>
> +u32 xe_vsec_get_guid(struct xe_device *xe)
> +{
> +       struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +       u32 guid;
> +
> +       /*
> +        * Both supported platforms (BMG, CRI) require the remapper callback to
> +        * access data. CRI needs it for the GUID.
> +        */
> +       if (!xe->soc_remapper.set_telem_region)
> +               return 0;
> +
> +       /* caller must ensure correct power state */
> +       if (!xe_pm_runtime_get_if_active(xe))
> +               return 0;
> +
> +       mutex_lock(&xe->pmt.lock);
> +
> +       switch (xe->info.platform) {
> +       case XE_BATTLEMAGE:
> +               guid = xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID);
> +               break;
> +
> +       case XE_CRESCENTISLAND:
> +               xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +               guid = xe_mmio_read32(mmio, CRI_PUNIT_TELEMETRY_GUID);
> +               break;
> +
> +       default:
> +               guid = 0;
> +               drm_err(&xe->drm, "Unsupported platform: %u\n", xe->info.platform);
> +               break;
> +       }
> +
> +       mutex_unlock(&xe->pmt.lock);
> +       xe_pm_runtime_put(xe);
> +
> +       return guid;
> +}
> +
>   /**
>    * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
>    * interface
> diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
> index c4a1e2fc67d8..43c3e9f227c5 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.h
> +++ b/drivers/gpu/drm/xe/xe_vsec.h
> @@ -10,6 +10,7 @@ struct device;
>   struct xe_device;
>
>   int xe_vsec_init(struct xe_device *xe);
> +u32 xe_vsec_get_guid(struct xe_device *xe);
>   int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset, u32 count);
>
--------------nANT00UCBikxkb1Z1P6gJ7hK
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 13-08-2026 01:07, Michael J. Ruhl
      <a class="moz-txt-link-rfc2396E" href="mailto:michael.j.ruhl@intel.com">&lt;michael.j.ruhl@intel.com&gt;</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260812193742.2170188-22-michael.j.ruhl@intel.com">
      <pre wrap="" class="moz-quote-pre">Xe access the PMT infrastructure directly. The current usage
is supported ONLY by BMG devices.

CRI has further requirements for access.

Add a new API to access the GUID based on the platform.
Use the API get the GUID for each device.

Signed-off-by: Michael J. Ruhl <a class="moz-txt-link-rfc2396E" href="mailto:michael.j.ruhl@intel.com">&lt;michael.j.ruhl@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/regs/xe_pmt.h |  4 +++-
 drivers/gpu/drm/xe/xe_debugfs.c  | 30 +++++++++++++-----------
 drivers/gpu/drm/xe/xe_hwmon.c    | 10 ++++++--
 drivers/gpu/drm/xe/xe_pcode.c    | 10 ++++++--
 drivers/gpu/drm/xe/xe_vsec.c     | 40 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.h     |  1 +
 6 files changed, 77 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index fc9c9cb6a830..683bf401dc9d 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -10,7 +10,7 @@
 #define BMG_PMT_BASE_OFFSET            0xDB000
 #define BMG_DISCOVERY_OFFSET           (SOC_BASE + BMG_PMT_BASE_OFFSET)

-#define PUNIT_TELEMETRY_GUID           XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
+#define BMG_PUNIT_TELEMETRY_GUID       XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
 #define BMG_ENERGY_STATUS_PMT_OFFSET   (0x30)
 #define        ENERGY_PKG                      REG_GENMASK64(31, 0)
 #define        ENERGY_CARD                     REG_GENMASK64(63, 32)
@@ -25,6 +25,8 @@
 #define CRI_DISCOVERY_OFFSET           (SOC_BASE + CRI_TELEMETRY_BASE_OFFSET)
 #define CRI_TELEMETRY_OFFSET           (SOC_BASE + CRI_TELEMETRY_BASE_OFFSET)

+#define CRI_PUNIT_TELEMETRY_GUID       XE_REG(CRI_DISCOVERY_OFFSET + 0x4)
+
 #define BMG_MODS_RESIDENCY_OFFSET              (0x4D0)
 #define BMG_G2_RESIDENCY_OFFSET                (0x530)
 #define BMG_G6_RESIDENCY_OFFSET                (0x538)
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index eeceab4a9901..67903c854562 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -97,11 +97,16 @@ static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
                                   u32 offset, const char *name, struct drm_printer *p)
 {
        u64 residency = 0;
+       u32 guid;
        int ret;

-       ret = xe_pmt_telem_read(xe-&gt;drm.dev,
-                               xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
-                               &amp;residency, offset, sizeof(residency));
+       guid = xe_vsec_get_guid(xe);
+       if (!guid) {
+               drm_warn(&amp;xe-&gt;drm, &quot;PMT device is not powered\n&quot;);
+               return;
+       }</pre>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Instead
      of reading the GUID for every residency counter access, can <code>xe_vsec</code>
      read it once after OCODE is loaded and then use the cached value
      internally when <code>xe_pmt_telem_read()</code> is called?</div>
    <br>
    <blockquote type="cite" cite="mid:20260812193742.2170188-22-michael.j.ruhl@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+       ret = xe_pmt_telem_read(xe-&gt;drm.dev, guid, &amp;residency, offset, sizeof(residency));
        if (ret != sizeof(residency)) {
                drm_warn(&amp;xe-&gt;drm, &quot;%s counter failed to read, ret %d\n&quot;, name, ret);
                return;
@@ -706,23 +711,22 @@ void xe_debugfs_register(struct xe_device *xe)
                                 ARRAY_SIZE(debugfs_list),
                                 root, minor);

-       if (xe-&gt;info.platform == XE_BATTLEMAGE &amp;&amp; !IS_SRIOV_VF(xe)) {
-               drm_debugfs_create_files(debugfs_residencies,
-                                        ARRAY_SIZE(debugfs_residencies),
-                                        root, minor);
-       }
-
        /*
-        * Pcode version read from PMT is currently only supported on CRI and BMG platforms in PF
-        * mode, as both platforms support the necessary telemetry read mechanism and have a fixed
-        * PUNIT_VERSION_OFFSET.
+        * Residencies and Pcode version read from PMT is currently only supported on CRI and BMG
+        * platforms in PF mode.  Both platforms support the necessary telemetry read mechanism
+        * and have a fixed offses for the required data.</pre>
    </blockquote>
    offset*
    <blockquote type="cite" cite="mid:20260812193742.2170188-22-michael.j.ruhl@intel.com">
      <pre wrap="" class="moz-quote-pre">
         * Attempting this access on other platforms must be verified before enabling support.
         */
        if (!IS_SRIOV_VF(xe) &amp;&amp;
-           (xe-&gt;info.platform == XE_CRESCENTISLAND || xe-&gt;info.platform == XE_BATTLEMAGE))
+           (xe-&gt;info.platform == XE_CRESCENTISLAND || xe-&gt;info.platform == XE_BATTLEMAGE)) {
+               drm_debugfs_create_files(debugfs_residencies,
+                                        ARRAY_SIZE(debugfs_residencies),
+                                        root, minor);
+
                drm_debugfs_create_files(pcode_info_debugfs,
                                         ARRAY_SIZE(pcode_info_debugfs),
                                         root, minor);
+       }

        debugfs_create_file(&quot;forcewake_all&quot;, 0400, root, xe,
                            &amp;forcewake_all_fops);
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 49f7e0edcc4b..db48594fcc1f 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -517,9 +517,15 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)

        if (hwmon-&gt;xe-&gt;info.platform == XE_BATTLEMAGE) {
                u64 pmt_val;
+               u32 guid;

-               ret = xe_pmt_telem_read(hwmon-&gt;xe-&gt;drm.dev,
-                                       xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
+               guid = xe_vsec_get_guid(hwmon-&gt;xe);
+               if (!guid) {
+                       drm_warn(&amp;hwmon-&gt;xe-&gt;drm, &quot;PMT device is not powered\n&quot;);
+                       *energy = 0;
+                       return;
+               }</pre>
    </blockquote>
    same as above
    <blockquote type="cite" cite="mid:20260812193742.2170188-22-michael.j.ruhl@intel.com">
      <pre wrap="" class="moz-quote-pre">
+               ret = xe_pmt_telem_read(hwmon-&gt;xe-&gt;drm.dev, guid,
                                        &amp;pmt_val, BMG_ENERGY_STATUS_PMT_OFFSET, sizeof(pmt_val));
                if (ret != sizeof(pmt_val)) {
                        drm_warn(&amp;hwmon-&gt;xe-&gt;drm, &quot;energy read from pmt failed, ret %d\n&quot;, ret);
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index ccc3bdeed6bb..1b93fda1f41a 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -368,11 +368,17 @@ ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See xe_pci_probe */
 int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *version)
 {
        int ret = 0;
+       u32 guid;

        guard(xe_pm_runtime)(xe);

-       ret = xe_pmt_telem_read(xe-&gt;drm.dev,
-                               xe_mmio_read32(xe_root_tile_mmio(xe), PUNIT_TELEMETRY_GUID),
+       guid = xe_vsec_get_guid(xe);
+       if (!guid) {
+               xe_warn(xe, &quot;PMT device is not powered\n&quot;);
+               return -ENODATA;
+       }
+
+       ret = xe_pmt_telem_read(xe-&gt;drm.dev, guid,
                                (u64 *)version, PUNIT_VERSION_OFFSET, sizeof(*version));
        if (ret != sizeof(*version)) {
                xe_warn(xe, &quot;pcode version read from PMT failed, ret %pe\n&quot;, ERR_PTR(ret));
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index bed5103dac19..a56f988d13eb 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -565,6 +565,46 @@ static void vsec_disable_late_bind_work(void *arg)
                xe_pm_runtime_put(xe);
 }

+u32 xe_vsec_get_guid(struct xe_device *xe)
+{
+       struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+       u32 guid;
+
+       /*
+        * Both supported platforms (BMG, CRI) require the remapper callback to
+        * access data. CRI needs it for the GUID.
+        */
+       if (!xe-&gt;soc_remapper.set_telem_region)
+               return 0;
+
+       /* caller must ensure correct power state */
+       if (!xe_pm_runtime_get_if_active(xe))
+               return 0;
+
+       mutex_lock(&amp;xe-&gt;pmt.lock);
+
+       switch (xe-&gt;info.platform) {
+       case XE_BATTLEMAGE:
+               guid = xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID);
+               break;
+
+       case XE_CRESCENTISLAND:
+               xe-&gt;soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+               guid = xe_mmio_read32(mmio, CRI_PUNIT_TELEMETRY_GUID);
+               break;
+
+       default:
+               guid = 0;
+               drm_err(&amp;xe-&gt;drm, &quot;Unsupported platform: %u\n&quot;, xe-&gt;info.platform);
+               break;
+       }
+
+       mutex_unlock(&amp;xe-&gt;pmt.lock);
+       xe_pm_runtime_put(xe);
+
+       return guid;
+}
+
 /**
  * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
  * interface
diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
index c4a1e2fc67d8..43c3e9f227c5 100644
--- a/drivers/gpu/drm/xe/xe_vsec.h
+++ b/drivers/gpu/drm/xe/xe_vsec.h
@@ -10,6 +10,7 @@ struct device;
 struct xe_device;

 int xe_vsec_init(struct xe_device *xe);
+u32 xe_vsec_get_guid(struct xe_device *xe);
 int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset, u32 count);

</pre>
    </blockquote>
  </body>
</html>

--------------nANT00UCBikxkb1Z1P6gJ7hK--
