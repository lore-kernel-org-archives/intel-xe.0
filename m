Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DDDC61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 12:36:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA71F10E3FA;
	Wed,  2 Sep 2026 12:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bBLohd4U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D6AB10F1B3
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 12:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788352604; x=1819888604;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A56nBCpjcstXZsWdHbGP5SnYANIkPv3uWe5hjFp9NZc=;
 b=bBLohd4UcRvMLVQXWOaJbbmBqAsxuH7sWbJDDXv2yAKAYrZiHV89oZOZ
 WL6I6roIldk9noNLZokhwgENuobdQyimf2WHEx9y7JwY5h8mTfCv2BzMZ
 LCjnSYNrZXOiAS4bj274/yc5OmvPbMTHGx+GmK9c8fmAkDE6llroGQcIc
 ixeFlwwypSUitXy1ELOr+EjQ04bwZpK9HaqUheWTikd/rincKt2BJabEE
 hTHsOjoLRqGijUma/P0OMj4qMkrJPYOrx3tDZfvXJe+zR9gWA9OlChDE8
 WJUUkUPVvKwC4HJE1Mt3sgunAKUVcxcmAG/53XydxTM+2MEMakIRR5OFr w==;
X-CSE-ConnectionGUID: 2TEWuRUnT2eXFIRbjTBuSQ==
X-CSE-MsgGUID: qDQSt+A8R+qrxnCeG+YqfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88932462"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="88932462"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 05:36:44 -0700
X-CSE-ConnectionGUID: u2wfose+QmuduKOCc9BDSQ==
X-CSE-MsgGUID: 4K/SUVAdSnqyy+5BqRb3Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="266789050"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 05:36:43 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 05:36:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 05:36:43 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.23) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 05:36:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aazyY6nX7eM911DVI0BB41phVpWowPEJAVk3DJnDaKbkF/STrYOwBHKN19qJusm3TKhNn6DpkCiWiZFPFEfO772ihSpVhTvtQ1UAryLu7BtrzVunr3qEfeg9heEB6TfrZABwbUDV2rjyZaJwhNfF3zfXnWsnGDqDREksXKDoUNMYTITRlhqi4EhsiW0xniOqlrcG8ObhbTSzeyrcHgY37XROOyhMU2qQqUpThlpNVjWhp678iGXHE6KDZBaLzEZBgSmP8Oq169aOze7C7V8+rT2P9/DVzpv+t9HjYZoyIcizljJVuhSXIeSOmICFg44RMuKb4+4lLO1qrs0LFrp6sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/7F+uuUih4ElqKlBy3WwrkQV+KPK0dc+P15hiZFYbk=;
 b=xG9oTDoRMVWWus+UCdeBGRMRFhLB2NIi9RAwORosidSXsswR4MFplKCYaZvYJdfUlGOw7eZ1BxWzrXdO02RH6S+7HkJnMZBZlCoTE6wiyvcihWFGTscNT02bHVZ+6dyYqDFAPC9gVXIz44G6q91I3Tt/GIEjTqooZWuk2tHTUyJ1fppJLtwiTKAmaOOX/PGiu2o5JTpWpaTRKPihSXzs+Eht50ZdP2FoWa/QF7eFNdoFbLtYNtIw7V7baqnUuxkTSGt/zAI2woCUK5ifzYq0D0zmnfU6Z4DtojHgvtXMVOwfMrSiA2sO4TZspNRK2gIOS3pFSVrrld2lm0t6AkzUqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by SAWPR11MB9897.namprd11.prod.outlook.com (2603:10b6:806:54a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 12:36:41 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 12:36:39 +0000
Message-ID: <e1645499-f6ae-45cf-a535-05dcdc2832e5@intel.com>
Date: Wed, 2 Sep 2026 14:36:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] drm/xe/guc: Report reset failure using SIGID
To: Arvind Yadav <arvind.yadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <badal.nilawar@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <mallesh.koujalagi@intel.com>, <matthew.brost@intel.com>
References: <20260901063059.2547247-1-arvind.yadav@intel.com>
 <20260901063059.2547247-3-arvind.yadav@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260901063059.2547247-3-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P190CA0020.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::25) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|SAWPR11MB9897:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c20af5f-6dd4-4bcf-704f-08df08eed5e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|4143699003|22082099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: dBWuc8Y9rac8+6uAGzQNOWuR99jt8HYBVLxscZcoCIYlhvRZCUxeGgOTCGt02hcOGPaXa4Xtb8fIYjJ3QsmycXdRlfUzcNd4u/ilFXMF75b5Ro6Rj5PfAMzf5Msw7ub7m7VvtDMCqHatBw3aHBCPB5qE53hhmME63cah2Jy7U1ekAmdSAgw2FoctH0DvYMofFLFQYld60eRPSjEKo5I/PmAojR1xmKN8qG84VikIiDMUkPJYkKWFZekKTrZYAg2yeUyEthiu9ROYGU3Ah3pMXQEVqWd0NO3Ca4K6VklNM84VjzXTAziTiUu268agHGASst8DF4ZA2hdAd1BEXtNuG1ASuQox9eyJtYHuiUy5uLsxYah4iUqCMMWZMesWfrqvoS465KOr0BcWpssTVR1X5Mspkv8HMMfy34xyu6Sa/U9gixDBs0ZvC5ogcQ9m5yUGQyGzK8PK78d38b7aW4+NYB1km/uUi038K7JZbSgxkg6IOMWs1hdh5VIfKGgg6M25uWNO1DajNFu0ZtvYHz305OWeZoM6ncjWrihzREgKLglE66HyCOfxBGuTb822QxflNEKUvzqLNo3wwKkccUf5ZTfNud6SHtmdOe4rBvoz2TkMGK+Qntpzl1MKrKIMEy4DuGZE7geLj0ARl0GeD0+IY8aG0QfYlGfC94e3zjjOjrs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(4143699003)(22082099003)(56012099006)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlR3bEl6bEtwVDZBbU80VWZuNjhlNUFCV3hxS2NsUE5JM1RXYytkMlUwd1gw?=
 =?utf-8?B?WWlpM2JkNVVSUHJYR2JWZFV1VElpaG55WXcvUXY4VUo2cTNJRmo4bDVNd2pq?=
 =?utf-8?B?SGVuUVBHWFh4RVVNMzk1d01jcVRCYTlpYU9ZY2FJUHJpSGY5VkNzaEdHR2VZ?=
 =?utf-8?B?TTRzekI5UkozODlYN1RPZTE0NWlpYzNub0U3SldndnZheVlwNDl2b0pqTm9W?=
 =?utf-8?B?TzduTjkzcnYxa0toY0RRazRCOGV2U2d5K1lxQ1poNjdFd3dLVTBiVXhwR1VR?=
 =?utf-8?B?OTl3VlZaOEp4cVkvNmROdnNTM3VyZlpybHo5REF2ZnVTREwrQUFycSt6MEkv?=
 =?utf-8?B?a2tyMk81clI0cXlSQlRJT1ByVHgwUVd3Uk5MTmRwVlpDTEZjaHVUV2FEMmJX?=
 =?utf-8?B?MTBoTEhtbkJLanZqVU1iU3BFbFkwbW1Yc2JNZG8zcGFzWXQ0dUZPaEZpZWpZ?=
 =?utf-8?B?Zit5eXRLUzI4ZXBvS3BscnFrWHRLRGpLNjRuTU9xb3FYTXVGNy9LVkNuNGVR?=
 =?utf-8?B?N1QyT0ZYYXVYSDNhOE5iNFI1enI4dCtmQk1Cb0plUUk1SkI5Q1NHa1RvNDNp?=
 =?utf-8?B?anVtTDM1bFNnR1ZpdHhQTzMydWhFbTVWLzl3V1VLMVM0Wm15Y2NELzRGWW5w?=
 =?utf-8?B?NkFKOVBveG81b21sRGFRbVdGeEsxVUpOTmhFUXlTUFZJM2x2akYrRlNsMXB0?=
 =?utf-8?B?NFZWMGErMTRKQXRuOUk4Q2Y3S1MzVDFPY2ZUbVFldDdWOWlJbXRaZldwNGZB?=
 =?utf-8?B?SVRDVnJwRkZsclMrczFFL1dXUjdNVHg1am04bUd6czBuVVBQaXhLMlNkK21y?=
 =?utf-8?B?eXp3UEdSTkE1ei94S3BsQUF6OFE0UWtYWFg1MG4vbytkZWM0Rm9Oc0taTExK?=
 =?utf-8?B?SWwxbWFoYUJ5eWZzRVdkb2E4VncyS0FRNFRkSE84c2dMb3k2UVRIcVFObmVT?=
 =?utf-8?B?V3VreXZGUUJmc3d6dzFKR0I5RHhoa0pCSUp3VmYvQnpqZ0c2VkJ3STdjMWlr?=
 =?utf-8?B?Kzg2Ny9iT0UxTjNNYWR1REtkWFlzNHRDSDFPSmR3WnFZOGU0OWdacVJoTWsv?=
 =?utf-8?B?a21KMThvbUpPWlh6WmRYODVYT3k1VDhWNDFiOXg2cnl2VnY4S2JUVUdXcy96?=
 =?utf-8?B?dDZoNEljTHFxdXVMY2JsMTJJNG5nTFFuOXduR05STmtGZFkvZFpLSFBtbmk1?=
 =?utf-8?B?NkhxSExpV1hicWRNWnYzNzhRQnYwdG8yS2wxSW9XK3VQNXNWMExvWlljRFd6?=
 =?utf-8?B?SzRlYWRZZzlCV3VFbGV2bnpWMVJkNFU0VjRPbkVlVjlKeFV2V3dLVmlNYmgr?=
 =?utf-8?B?L3ozSTdCb3dPREp0d0pIN1p5WE1NSGNwUllwS3hJSFhSYzkzYUNvU2FkN2pI?=
 =?utf-8?B?K3NJRXp4eG1udjdvQnhCNS9BUXBsNnlONUFHaXk2OTVGRkV4RTVGc2NQQmZO?=
 =?utf-8?B?ZWwwTjRCVVQ2S0czdHc0VlgxTldoUzJtdEszYVlRb3BqY1NIL043MHZxT2NG?=
 =?utf-8?B?K0pZdjVKV1QwWjlxVEdQU1E4MVFvbm04bUZJb0xqdXUrMWtsRVFxY0h2eEdU?=
 =?utf-8?B?b21JaHlTY3pWeUUvdXhYSkt3SUx1aE95bWVkVnRWMVR0SFphS1c5MkNGMWN5?=
 =?utf-8?B?MGdYRWJxQXBQWS9VeWUweENNWFJYWXFzanFJVVRiWDBjOTMwUnBHeGhCQWx1?=
 =?utf-8?B?ZXY1RUxEQURPb1BzMzRWYW5sWmg4a0FNWE1jS01Fa2J3Nk1iVTVYbEJld2Zl?=
 =?utf-8?B?aThOZUk2OTQrN1E5VU1UQmVuSFFIaU9nTzR3UjczbHN1TmVnNVltOWU1T0kx?=
 =?utf-8?B?TFB0TStBU0g0Tzk1MVVlREFUZ2xjMmU0Yms5MUV2UlFtekRWTXhqczhodFlF?=
 =?utf-8?B?bmNDc2JxdkM5RCtjdHUzTmw1S0djNForVHZ4MzZZWGlVQW5JT3ppVFNocURM?=
 =?utf-8?B?ZVFZK1VrQ2ErOXNndkdYK2tubjMwcHFYSWFtUWJ4T2d6WnY0a3lxZURsQjRr?=
 =?utf-8?B?UVpxTTBPTnMyWG9DRWEwcU1XU2dZUXBaK3ZBQkRxQ25WMkVwM0EwMDVJQjdh?=
 =?utf-8?B?Y2FmclVVb3IwL3ROVW95UTFlU0gwNXdudjFweE91b3hod2VoZ3FrR0U1SzFs?=
 =?utf-8?B?SkQ3czJCRWJIOU4xVUFwV0NrOXBWbWNPb2kzRUZlZ3crUGRncUJXaWZiYlBv?=
 =?utf-8?B?Q1FLb0xWVURTYkNoVzV2Q3MrdVlUdUV1a2hWYWoyMnBKU3dJS3hybmd5N0Rs?=
 =?utf-8?B?WDF6OURuZG0yMjAwV2dmTTNZamVKN0xITDZiaHRYcTlCWGg1MWxlajJraHBk?=
 =?utf-8?B?cHhxKy9KWmVLU29ZVExCd3FrZ1MzNXkyQlV5aWpDcWs2NmxBRVliRHhjV2o4?=
 =?utf-8?Q?Y7zTeSaLSouzCuHs=3D?=
X-Exchange-RoutingPolicyChecked: dylFpKRn/N4O850CQGdIJAtshmJNaB9tvs9uEdrXllMccWot37BVxELUxF9r9v3Tmg/c31Xo0SiJlyw9LJGTLQogK2T1mZFguGpGD5EsxZ0uxZq90lq65Viak7SG2ZkxW/acUElvWWA6Sn7F7VtmEkU1OlpdGIW8zueXNdXI11luz1heUS+0K+OmtEyoagPaC2VOA1YnE/JLF+gjgOB8gdqBPntv39H+uR0XVeteFJAHNQ10gVumuVxh2LP79FeliMq+++dG+eyaFAqpNUI/MK+5XDLSHWKSCs+TFmW4hd+wdh6TARKzpuo/RaBP8//I0MurFF/Ta75GlMxTnA8CCw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c20af5f-6dd4-4bcf-704f-08df08eed5e9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 12:36:39.6411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uduk4L7Q+oTOEeI1dOMICHMqLV6zhYxLSO0NIWf74qYG/2hpQSNA/5O1Ba5bXTHCa6ILRK5TQ7lgRic7Mfox/n1dYL3p+d5b9xenyqV4RB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9897
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



On 9/1/2026 8:30 AM, Arvind Yadav wrote:
> Route the GuC submit engine reset failure through the structured SIGID

s/GuC submit/GuC submission

> logging helper.
> 
> Use the GUCSUBMIT component, which maps to XE_SIGID_GT_TDR, and pass -EIO
> as the errno value.
> 
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
> v6:
>  - Updated the log message to print class/instance as %u:%u and
>    reason as %#x. (Michal)
> 
> v5:
>  - Added GUCSUBMIT component and mapped it to XE_SIGID_GT_TDR.
>    (Michal)
>  - Used GUCSUBMIT instead of GT for the GuC submit reset failure.
>    (Michal)
>  - Dropped "request" from the reset failure message.
>    (Michal)
> 
> v4:
>  - Clarified that the GT component maps to XE_SIGID_GT_TDR and -EIO is
>    only the errno value. (Sashiko)
> 
> v3:
>  - Split the GuC reset-request failure conversion into a separate patch.
>    (Michal)
>  - Dropped GuC job-timeout warning conversions to avoid changing warn-level
>    logs into error-level SIGID reports. (Michal)
>  - Kept only the existing error path that maps naturally to GT_TDR. (Michal)
> 
> v2:
>  - Rebased on the latest structured SIGID logging series.
>  - Switched from the old xe_ras_log_() helpers to the new xe_log_()
>    helpers.
>  - Dropped paths already covered by the base SIGID series.
> 
>  drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 99d8c807ff05..1df6527130f3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -34,6 +34,7 @@
>  #include "xe_guc_klv_helpers.h"
>  #include "xe_guc_submit_types.h"
>  #include "xe_hw_engine.h"
> +#include "xe_log.h"
>  #include "xe_lrc.h"
>  #include "xe_macros.h"
>  #include "xe_map.h"
> @@ -3494,8 +3495,9 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
>  	reason = msg[2];
>  
>  	/* Unexpected failure of a hardware feature, log an actual error */
> -	xe_gt_err(gt, "GuC engine reset request failed on %d:%d because 0x%08X",
> -		  guc_class, instance, reason);
> +	xe_log_err(gt, GUCSUBMIT, -EIO,
> +		   "engine reset failed on %u:%u, reason=%#x\n",
> +		   guc_class, instance, reason);
>  
>  	xe_gt_reset_async(gt);
>  

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

