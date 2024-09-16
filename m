Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8B2C3ABA2
	for <intel-xe@archiver.kernel.org>; Mon, 16 Sep 2024 17:47:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940AD10E11C;
	Mon, 16 Sep 2024 17:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bfgeh/zi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C5C10E11C
 for <Intel-Xe@lists.freedesktop.org>; Mon, 16 Sep 2024 17:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726508823; x=1758044823;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=inBxqyDe4F4z3Ltr6+h2KAl5QmjI1ing1OuW3pY+aVM=;
 b=Bfgeh/zixi/lYI8R60Yk+0YhaSQO2vlt4Im2qm13w9EthR4nJQh3VDBJ
 jxDPNAEHZda+d53tgil4yRuA5+iHMq5yxtrKIOb0OJi9gPLazWnEIAaDd
 QuSsWiq3yubDYAuFw4bbNSGn1mz3lAudoKZVHM5p2LsJ/PcONMDaHic3i
 UlmWcfzlz5YBV63sogeaBUBPZX/4i0rszzSeT79w27IFaLd8QTS1xE0Ec
 lSppM4g8dyG8UkMqFxaKKg+KxDjEbw6DVrbzi0OBwfSKkDwADPDznqFuM
 FhksE2N4luZOpvHL87AHOLXf75J+bNiVo/0UnTvmBRb9Ss8DxHyrRgDjN Q==;
X-CSE-ConnectionGUID: upijubqyQnW7HiKxS6r9gQ==
X-CSE-MsgGUID: 0eCQDXhATPK6MVI97OG6nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29093566"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="29093566"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 10:47:02 -0700
X-CSE-ConnectionGUID: h/9Ci8u/RcSULraHTyuuYQ==
X-CSE-MsgGUID: mmH3F/1oQBKCIDtd1RI8qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="73291247"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 10:47:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 10:47:00 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 10:47:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 10:47:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 10:47:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ArrAu5u1ZPB+0zOWL3DvCgM8pz+4arSeFiSkKJQaNOJzM+6cLxnYibKJu8EYy2A/QriYNd1ZjPKrCriutPJXBVbbBY33yTR45g8UqYpjjt6Zqq++GQzkwCdI1eoPzOJgVa9EBTeTYYG3vQatqoSVYuBFFaX+N3jjMwQyykhF9yyS5u1T1rHCIDLocXgda0XoxooYJEt9eGZmN3BlueKAHz0/8GF+qQBqhmHvq7RnOqlYDdKGcEe4yBU9GsOXkdJQKqEGV/2i9ZqiIGWI4uqL+GZJGQkpPjR4tfc69xjra2kX3QSp2YiTkxat+7Pd6jq1+CS6QtexyQe9F18dPJJE6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vc/uNfq85MgQQKWSqGX1vplNJlpBp0UoXKS3f7x0ClI=;
 b=LZsg3RtsbgTrNxTmvBkyWoir/Xwd/dV/wkEol+uhUO3So3cMr6ndkv4GlDv/JgTMfXVD8ccwwnCH8mxxIh+B2fq2L10Nmrfl30u6sxHU9B9itB9qXhrpC7b/Q35YZDbL7O9o+QRQ5O89Jbt2rINX8NgzgwCoxATXaYyl6kQlWuTwS9YdID8V4k8CH/drtiBYep4xydBGUmRm3+qfnPZILBbB/5cPuTE6GmvwblZzk2Ap3XSZ4GaXy4Xw3X8DwWvKaCHYur8Fm2vFeJgQqbTegt1ZGhXgGFAX/ekjMIHR4rNoo/f3cphtlg+tsZdtFTWpizhESLYeNQDWPLmJvHYgQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB6165.namprd11.prod.outlook.com (2603:10b6:8:ae::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.23; Mon, 16 Sep 2024 17:46:57 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 17:46:57 +0000
Message-ID: <00e0720b-5c36-44df-8368-61b4fa860ca6@intel.com>
Date: Mon, 16 Sep 2024 10:46:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/10] drm/xe/devcoredump: Add ASCII85 dump helper
 function
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: "Souza, Jose" <jose.souza@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Intel-Xe@lists.freedesktop.org"
 <Intel-Xe@lists.freedesktop.org>, "Brost, Matthew" <matthew.brost@intel.com>
References: <21bc8c69-3a0f-4c68-99af-63f3f029f37a@intel.com>
 <eu7zw22lmcvkldfyt66abmi7gutl6eshey2ny4ev24d62jjagq@vm7i5j2s3mjx>
 <61ce4887-9cc6-4e46-9412-958c992305a9@intel.com>
 <3jexgpnh3br3gqi4ol4c3hx3tyhwevq5nqo5xssyie3xglqohz@e7mnj4dewupu>
 <34c59c0413c51d574baa39a62a735d0de67f8a2f.camel@intel.com>
 <7c75dda1-e62b-47ff-a6e2-0da2f080126f@intel.com>
 <0daf2e5c9ece014d5f85b5bcb0cb44dafa2449c0.camel@intel.com>
 <c57ee885-2cab-4a7d-8ce3-d9e7b3ab55d3@intel.com> <ZuLzSMH_hBl9RWdv@intel.com>
 <c07f4afc-e995-40e5-aed8-1a5db0c3547c@intel.com> <ZuhPpD2lLIYjm1tP@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZuhPpD2lLIYjm1tP@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0388.namprd04.prod.outlook.com
 (2603:10b6:303:81::33) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB6165:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eb3b561-52f7-4511-e8a6-08dcd6778f3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWZERzJ4NmswYm1tWFpZTS9ma2wwRVVwSFFTekpuanYxMGNQYXdCYWN5OWZs?=
 =?utf-8?B?am1xT05sc1RCdmRpV1VqblQxd1RHdFZsbTdqTllrZk5kNStHNGVJMVNFL1Qy?=
 =?utf-8?B?a2ZVUkFWalVzNklXcjBvelArWmVpQzk5OW15ZHVGOTZTWjQ1TnNRTU03TUlS?=
 =?utf-8?B?VVNlOS9hSW0yOUJIdHpwRExsOHhnZ2wwVlgxa21BSUluOUwwQ0J0eUl3L2w2?=
 =?utf-8?B?T0xqTDV4OHBWZm9Va3ZYRlR0S1ZDMUtpUlFKT0pKVGRLT3VHeGl4SEZHVEVq?=
 =?utf-8?B?ekZNb2U3UkRsT1IzZkhicVltTGN2aE5YNEhUNE83WTZaRng2a0RNd1p1MjNw?=
 =?utf-8?B?MUkxMTJIMHFJbDZZT3B5NzVhN2g2Lzd4dE1ZMFdBMmF0QTM1VE94WlJqTG1T?=
 =?utf-8?B?V3NOY0xUVWk4ZXgwTmI2SHVxdUkyZlo1VHV4cUwyMklTK0FYcU5wTE8wLzQ5?=
 =?utf-8?B?ZGdQYVVVWkkwYkdJSWl4clJJVFZNOGhqQkdvd1Q1amdQcGNWd0xqRElSL2Vw?=
 =?utf-8?B?WEh5TTllUE5xOVM1VW5ERGpnU2pMWjJWcEVOMHBxSWxxTHROdFlZRENMK25K?=
 =?utf-8?B?OFRKRC95N2Y1VnBiTkxqUE5RTkRPVVBwMTRBUVZpQUJxZytaQjZVR2g3WUZD?=
 =?utf-8?B?UEQ1QmFVZDQ3U0RZK0EzRTVBUUdoYnBCaGlwZlVVNGpxR05KVzMwaE5tM2t0?=
 =?utf-8?B?WDBDU1JGRWplMjFNMUxPQTFSWW1sdENCbTR2Mk5vdVZMSlhmNTVZcTZDRlZK?=
 =?utf-8?B?UGhwNXF5RWJaY2V0MERJOFZ6bWVIUHAyUGYxV3k2NVYxSmdxY3ZTT1ZGN0Uv?=
 =?utf-8?B?emt5ajBKS0FTcWxwcjkvV00zdTJiNW5CeStMOS85UUdtRnk4bGJXQkRMOFNZ?=
 =?utf-8?B?UmJZcHhmR2RGeExTL1FwTUpUdjRVT2thaXdTcW1nVlVqZ3VkSGZtRFQrVGN0?=
 =?utf-8?B?dEdPMUZlSVgvN2ppcllTcGI2Z2FhT0FZNk1mYzU1ZWQ4VUs3ZHMwR0JHMDB2?=
 =?utf-8?B?VXNtMlVzbzRWSTRSNDMwUC9TSkErNlVrKzNHY0VLNG8xc1FFaFBOQjZOcG9a?=
 =?utf-8?B?cU1mZDVBbTNCTmErKzY4dFB5ZnFDV2JsVjUySW41aThZZ3hZUHNsMUxIR1Zl?=
 =?utf-8?B?b2R4NVF1M2xrMzAvT1J4TUQycnl4UzcwWmxLeTlmQWpZQVpndjFidzhmN2Jy?=
 =?utf-8?B?bnlMUVhkR0F1N0NmSHhmck5CZjQvVzhLQUtpTWFMaEZDM24yaEtwRGZhMXRr?=
 =?utf-8?B?eTdtVVk0YlZFWDl6blovMzlrSUppSUlMR3hVVHhzK3VWV2p4bnNBNGlwSHdr?=
 =?utf-8?B?U0lnS2gvRHl0bjhHV3kzWVNDQXVRSzZHc1lKQlZXQWxrUjUxMFk3c2xIOEJv?=
 =?utf-8?B?bHFIWVpKcUtHL3EwSmtRRlM3U2loZzVERzZhYnJCdmF1djMrWGs2eVVLRk9q?=
 =?utf-8?B?cXNSU0xJd2RVb1Y2OXFIR1BmajdpbTYrUncrdk5iSEdvY2dWTm1pYThoNVRF?=
 =?utf-8?B?Qzl4SzAvaXU5N2YxLzQwQXFWSGJJK3dkUzB0N3Bxa0lvcjVBM1RsNXBFOTVN?=
 =?utf-8?B?aFdmUEJVUjRkYlFra3ZONlpGamV5UGhMNHAyRENxZ3lWZDFRdkszZDNQV24z?=
 =?utf-8?B?VHF0ZTd6bFd5NVRwdVgxeTNIMlF4b2lLdW0yalluM2g2bVRROFM2ODJtSU9L?=
 =?utf-8?B?V1ZsNC9XSmZnbEZnVjFPbHhxdisyTTlaL0dKNmliMzVOam1wMnpSRnRzdUVa?=
 =?utf-8?B?aUh0MTJYLzFKemxPdHFoMWdQYVYzWThJUDJuWUVoRDkwZnhZOWRMdkVSbEdW?=
 =?utf-8?Q?/BKR7VWirNgd+DU9krqPn2Ppc+dcH26mn+NVU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDdwbmU3VHMyeXM2anl4UjNjWlBEYS9ucUEvZFphaTFjd3dFN1J6N1hvTVEr?=
 =?utf-8?B?T0g0WmNCOFowcE12a05QUHdCdjNaeG5KSEJ1K010ZlZOMXZORG4rSkJNVnll?=
 =?utf-8?B?bnVVa2k4VVdxZm0zb1NndFlYYm1oNm1wOE10c2xxNzFvQmIrcWVKajhsNWg4?=
 =?utf-8?B?dFRVdkErbE1aUlAzVHpmS2VKcE9rRFpCZEZJVnBvMDZBTHM3cTllcXBVVExZ?=
 =?utf-8?B?d1l5ZHpnMkpFdlVoTFlUTllaN2Z3aWpIQUpDazhaLzdsbytPMytPNEEvdEhC?=
 =?utf-8?B?YlYzbHBFVXhlakJzWUJRS2t6Sk4rOTVkY0NtbFN2VXRIWTF3dVg3THF6OFdU?=
 =?utf-8?B?MW5GSWwxdzk0bmRyL0ppTElWdmxySUhaQllXT1I5a0pPZHBBNTlOTE5sOWlE?=
 =?utf-8?B?K2JNZ0hWbWIxOXU3ZlJpQXZVQzJJR1Rvck9BNGVlSWQ4L1NFMGN4bEM0ZnZS?=
 =?utf-8?B?YlFUejI2N3U3UmxJZXdmOE5ieTRCb3Y2SnFYTms2SGdrUkVLOVlZdVFLSFVS?=
 =?utf-8?B?MFNhS01Ya1haaUJrQ0dxUzJ4NXFFZnNmaU1EZDNWZDZ2R2VhemVKT1hISzZy?=
 =?utf-8?B?WGVLZ3g5L0VmZCtFWSttb3psb0wzckdaVXRJQ2oyVUZiRGJ2WTc4Qm5MWFdv?=
 =?utf-8?B?dmVWU2ZNbkxFcE5FckVuYWtoaG5qQVN6Um5tNHd4UVlIdHIrWnY4NXV1WFk1?=
 =?utf-8?B?MDcyeUVMcTN4ZG1ENW5HYjZFRk5QSmpidXp6ajZHc0V3QlV3NzVYMjhNR3ht?=
 =?utf-8?B?SGpGL1NIaEZFL0orREg4RkJrOTFycDBqODU3ajU5ZHZPMS9XUlV1Sks4ZHJ6?=
 =?utf-8?B?QnhwWlVWWjdVM082S0cvcGVqTWpZRUJ6dE0waWNKZHZocGZIRkpXcEtlRkFm?=
 =?utf-8?B?UXlkR2lYdHFYL05kSy9tK3BqZ25ON1pHNkxaUWVkSHA4aTR0NHIzMzQyY1dK?=
 =?utf-8?B?Uk1aN1pvc01hSDV1RDM2MGlPUHp5WU1QRkc1M0lCZ2p5a0ZDTTdHVnRYVDlI?=
 =?utf-8?B?YzY1S29zdEoySUtFTDdpUUJvME5lSmtHcmJvcVBlOVgwWTFQbXBFNnlKMEdT?=
 =?utf-8?B?eXdTYUIxVmlGMlRVR0hZN21VVWc1dG95TVVuVDJOV0NORWo5cUFUN1ptS3pt?=
 =?utf-8?B?YldOQVhDc1JXamZyK0xkUDBjL3Vla2IyV0tSWlVZUkEyT3hNOUhpeG1WcnA2?=
 =?utf-8?B?ekFoNWRFb3hKMldVY005dWJ3MkMwdXJFRWUxVWNzR2ZCU2ZyYmJoZ0Q3eWQ1?=
 =?utf-8?B?bG9ER08zdkh3NFphMTZiL0pJM09NeXdVVkNtdExDZVVONC8rN1VMazFwZTNQ?=
 =?utf-8?B?NWtEbUU3QjVBWDFzUWgvd1QrTTU2dWgvU1NpQzdYZVVVRHMvK1U2Z3A5Snpj?=
 =?utf-8?B?czhYa0o1SWNoS3p4NThTR1FRbUtUMlFzSUVmZ21yWlAvc0hZUXkyKzROUXN6?=
 =?utf-8?B?ZmpyclFHY0NWeTduM3IxSUIraXc4M1pxM2JXcEtMSTdacGVlOU9mMGJ6Wjll?=
 =?utf-8?B?L1V1eUt5cGd0VkQ4cGYxVXBWbS80SUg2QWZrRldRdHg3S2pEdkU4YkNrTDN1?=
 =?utf-8?B?MW5ubHhyN1ZweEdpT2xRaWhmTlJ4dXA4TDlpenBpT3lqSkhxMEl2RXdON1NZ?=
 =?utf-8?B?TGNjTVo5TFVnaDBYSUV6Y29MUE1Sam9pTWZ5T2pYUjBvUjN4MVN4YlJSSXV3?=
 =?utf-8?B?elo4Z0tiWnRjU0xHUmdHSnZPaFJXZUNvMGlUTE80V3Y1ZnVObk4wejlHQ0t4?=
 =?utf-8?B?Y1VzV3JqdEIya25xRW1LT0VIUERGVzl3NlFoeWRjL1R6ZjNNVUVmd3VhRWF5?=
 =?utf-8?B?SlJ4YTZJaGE5cjNkRU5HQVUwWVJTZm1ibWx0K2c3SURCZFgrUEJIM2duSi9w?=
 =?utf-8?B?UGg0R3ZLT0Y5NGJNeUhCSmQvZTk3ajJWelRrWEtWTTN0N1B5YkNrNzA0N2xJ?=
 =?utf-8?B?N1hQVUszMVB0Q2NpMEhqTlRjRittN3k5OHU5cHhPd0xkbkdXUW9tcjFLVWsv?=
 =?utf-8?B?SS9ET1I3bFlLUXJFd0lZb3FGS3lreW95cko0UGtWaXZwZ3U2N1RRcmdMQk51?=
 =?utf-8?B?RlA1aGZLRmd0aXp1T3I5RkQvenljdTNMaXhvNEM2MHlFdDlPYXhuSkJMcmU5?=
 =?utf-8?B?ZDNPNEdjalR3WEpaSUJBcmc5RUd0ajlsRjA0elM4RWswSUtGSGZDaFI0c01B?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb3b561-52f7-4511-e8a6-08dcd6778f3a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 17:46:57.3847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aTnDmeccriK5y2/eyV87YUngcdESY2lpnPZsMM0glp2gmPEHKg16U2Q1mdJ4RwypKuvFanUDzvquHWBftC32L8XzpGXxl1GjOZF4rZ12RdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6165
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

On 9/16/2024 08:32, Rodrigo Vivi wrote:
> On Thu, Sep 12, 2024 at 11:06:20AM -0700, John Harrison wrote:
>> On 9/12/2024 06:57, Rodrigo Vivi wrote:
>>> On Wed, Sep 11, 2024 at 12:59:54PM -0700, John Harrison wrote:
>>>> On 9/11/2024 12:54, Souza, Jose wrote:
>>>>> On Wed, 2024-09-11 at 12:35 -0700, John Harrison wrote:
>>>>>> On 9/11/2024 12:30, Souza, Jose wrote:
>>>>>>> On Wed, 2024-09-11 at 14:12 -0500, Lucas De Marchi wrote:
>>>>>>>> On Tue, Sep 10, 2024 at 01:17:11PM GMT, John Harrison wrote:
>>>>>>>>> On 9/10/2024 12:43, Lucas De Marchi wrote:
>>>>>>>>>> On Mon, Sep 09, 2024 at 06:31:41PM GMT, John Harrison wrote:
>>>>>>>>>>> On 9/6/2024 19:06, John Harrison wrote:
>>>>>>>>>>>> On 9/5/2024 20:04, Lucas De Marchi wrote:
>>>>>>>>>>>>> On Thu, Sep 05, 2024 at 07:01:33PM GMT, John Harrison wrote:
>>>>>>>>>>>>>> On 9/5/2024 18:54, Lucas De Marchi wrote:
>>>>>>>>>>>>>>> On Thu, Sep 05, 2024 at 01:50:58PM GMT,
>>>>>>>>>>>>>>> John.C.Harrison@Intel.com wrote:
>>>>>>>>>>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> There is a need to include the GuC log and other large
>>>>>>>>>>>>>>>> binary objects
>>>>>>>>>>>>>>>> in core dumps and via dmesg. So add a helper for dumping
>>>>>>>>>>>>>>>> to a printer
>>>>>>>>>>>>>>>> function via conversion to ASCII85 encoding.
>>>>>>>>>>>>>>> why are we not dumping the binary data directly to devcoredump?
>>>>>>>>>>>>>> As per earlier comments, there is a WiFi driver or some such
>>>>>>>>>>>>>> that does exactly that. But all they are dumping is a binary
>>>>>>>>>>>>>> blob.
>>>>>>>>>>>>> In your v5 I see you mentioned
>>>>>>>>>>>>> drivers/net/wireless/ath/ath10k/coredump.c, but that is a
>>>>>>>>>>>>> precedence for
>>>>>>>>>>>>> including it as is from the device rather converting it to ASCII85 or
>>>>>>>>>>>>> something else. It seems odd to do that type of conversion in kernel
>>>>>>>>>>>>> space when it could be perfectly done in userspace.
>>>>>>>>>>>> It really can't. An end user could maybe be expected to zip or
>>>>>>>>>>>> tar a coredump file before attaching it to a bug report but they
>>>>>>>>>>>> are certainly not going to try to ASCII85 encode random bits of
>>>>>>>>>>>> it. Whereas, putting that in the kernel means it is just there.
>>>>>>>>>>>> It is done. And it is pretty trivial - just call a helper
>>>>>>>>>>>> function and it does everything for you. Also, I very much doubt
>>>>>>>>>>>> you can spew raw binary data via dmesg. Even if the kernel would
>>>>>>>>>>>> print it for you (which I doubt), the user tools like syslogd
>>>>>>>>>>>> and dmesg itself are going to filter it to make it ASCII safe.
>>>>>>>>>>>>
>>>>>>>>>>>> The i915 error dumps have been ASCII85 encoded using the
>>>>>>>>>>>> kernel's ASCII85 encoding helper function since forever. This
>>>>>>>>>>>> patch is just a wrapper around the kernel's existing
>>>>>>>>>>>> implementation in order to make it more compatible with printing
>>>>>>>>>>>> to dmesg. This is not creating a new precedent. It already
>>>>>>>>>>>> exists.
>>> No! no big dump in dmesg.
>> Please see other response. Dumping via dmesg is intended for internal use
>> and impossible to repro fatal scenarios. There is zero expectation and end
>> user would ever see a dump via dmesg. This entire patch set only includes
>> one actual trigger for doing such dumps and that is only if
>> CONFIG_DRM_XE_DEBUG is defined. Which it would not be for an end user.
>>
>> And if you are saying that internal developers are not allowed to use dumps
>> via dmesg then we might as well give up and go home because there are very
>> many bugs for which this is the only viable debug method.
> What I'm saying is, as a user of CONFIG_DRM_XE_DEBUG, I really don't want to see
> this big polution in my dmesg everytime.
How many times have you seen "big polution in your dmesg" so far?

Right now, checked in, as we are currently shipping the Xe driver to the 
public, the spam is far worse than after this patch set. On a CT 
failure, it will dump the the CT buffer contents as a hexdump. If the 
buffer is very backed up (which it often is in the case of a fatal GuC 
failure), that could be something like 2MB of data dumped has a 
one-word-per-line hexdump to dmesg. And that has no config option to 
turn it off at all. I.e., that is enabled and shipping for end users 
with their RedHat default kernel build. This version provides a lot more 
useful information in a much more compact and less spewing form, and is 
off by default. That is, it is producing less "pollution" not more.

Also, this feature has been part of i915 for over a year (or two, or 
three?). How much "big pollution" have you suffered on i915 in all that 
time?


>
> I understand the case that the machine entirely hang at boot and you have nothing
> but the serial log messages that was dumped there. And you want more information
> in that view. I understand the case, although I know that we should be really
> working to avoid this kind of failure to start with.
>
> A failure on a Firmware communication should never ever caused the platform to hang.
> But well, you might tell that in order to solve cases like this you would need
> information from why the firmware failed so badly, right?!
This is not about debugging common hangs caused by end users, bad UMDs, 
etc. This is about debugging fatal kernel or firmware bugs. Those are 
things that should never happen. If you are hitting any of this on a 
regular basis then the driver is fundamentally broken and you can't 
actually be using it for anything meaningful anyway. This is about 
debugging the issues that occur once in a blue moon. And if you ever hit 
one locally (on production hardware, with a production driver and 
production firmware) then I would be incredibly surprised and absolutely 
want to get that log from you to debug what happened.

>
> This should be a one off case, or a totally separate config, and definitely not
> driving decisions of stable api/abi like the devcoredump. Clear now?
I have no idea what you mean by "driving decisions of stable api/abi 
like the devcoredump". This is not changing any stable API. It is not 
changing the devcoredump infrastructure. It is adding extremely useful 
features to our private and internally defined coredump content. And if 
you are referring to the dump-via-dmesg (which is config option 
controlled or locally added by a developer themselves), that is not part 
of devcoredump. The intent is to use devcoredump as the container being 
dumped because why duplicate code? Although currently it can't because 
of how we have implemented our devcoredump capture code. But either way, 
it has absolutely zero bearing on any APIs or on how devcoredumps are 
used for regular debugging of end user hangs.

As for config options, sure we can create as many config options as we 
like but this feature absolutely needs to be enabled for CI builds. 
Plus, last time I tried adding a new config option for debug code, I was 
told that we should just use the existing one and not pollute the config 
space.

But like I said, the currently shipping Xe driver has the CT dump 
permanently enabled. There is no config option at all. So using any 
config option is still a significant improvement.

John.

>
>>
>>>>>>>>>>>>> $ git grep ascii85.h
>>>>>>>>>>>>> drivers/gpu/drm/i915/i915_gpu_error.c:#include <linux/ascii85.h>
>>>>>>>>>>>>> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:#include <linux/ascii85.h>
>>>>>>>>>>>>> drivers/gpu/drm/msm/adreno/adreno_gpu.c:#include <linux/ascii85.h>
>>>>>>>>>>>>> drivers/gpu/drm/xe/xe_lrc.c:#include <linux/ascii85.h>
>>>>>>>>>>>>> drivers/gpu/drm/xe/xe_vm.c:#include <linux/ascii85.h>
>>>>>>>>>>>> And the list of drivers which dump raw binary data in a coredump
>>>>>>>>>>>> file is... ath10k. ASCII85 wins 3 to 1.
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>>> We want the devcoredump file to still be human readable.
>>>>>>>>>>>>>> That won't be the case if you stuff binary data in the
>>>>>>>>>>>>>> middle of it. Most obvious problem - the zeros in the data
>>>>>>>>>>>>>> will terminate your text file at that point. Potentially
>>>>>>>>>>>>>> bigger problem for end users - random fake ANSI codes will
>>>>>>>>>>>>>> destroy your terminal window if you try to cat the file to
>>>>>>>>>>>>>> read it.
>>>>>>>>>>>>> Users don't get a coredump and cat it to the terminal.
>>>>>>>>>>>>> =(lk%A8`T7AKYH#FD,6++EqOABHUhsG%5H2ARoq#E$/V$Bl7Q+@<5pmBe<q;Bk;0mCj@.3DIal2FD5Q-+E_RBART+X@VfTuGA2/4Dfp.E@3BN0DfB9.+E1b0F(KAV+:8
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Lucas De Marchi
>>>>>>>>>>>> They might. Either intentionally or accidentally. I've certainly
>>>>>>>>>>>> done it myself. And people will certainly want to look at it in
>>>>>>>>>>>> any random choice of text editor, pager, etc. 'cos you know, it
>>>>>>>>>>>> is meant to be read by humans. If it is full of binary data then
>>>>>>>>>>>> that becomes even more difficult than simply being full of ASCII
>>>>>>>>>>>> gibberish. No matter what you are doing, the ASCII version is
>>>>>>>>>>>> safer and easier to look at the rest of the file around it.
>>>>>>>>>>>>
>>>>>>>>>>>> I don't understand why you are so desperate to have raw binary
>>>>>>>>>>>> data in the middle of a text file. The disadvantages are
>>>>>>>>>>>> multiple but the only advantage is a slightly smaller file. And
>>>>>>>>>>>> the true route to smaller files is to add compression like we
>>>>>>>>>>>> have in i915.
>>>>>>>>>>>>
>>>>>>>>>>>> John.
>>>>>>>>>>>>
>>>>>>>>>>> PS: Also meant to add that one of the important uses cases for
>>>>>>>>>>> dumping logs to dmesg is for the really hard to repro bugs that
>>>>>>>>>>> show up in CI extremely rarely. We get the driver to dump an error
>>>>>>>>>>> capture to dmesg and pull that out from the CI logs. Even if you
>>>>>>>>>>> could get binary data through dmesg, pretty sure the CI tools
>>>>>>>>>>> would also not be happy with it. Anything non-printable will get
>>>>>>>>>>> munged for sure when turning it into a web page.
>>>>>>>>>> I think that's the main source of confusion on what we are discussing.
>>>>>>>>>> I was not talking about dmesg at all. I'm only complaining about feeding
>>>>>>>>>> ascii85-encoded data into a *devcoredump* when apparently there isn't a
>>>>>>>>>> good reason to do so. I'd rather copy the binary data to the
>>>>>>>>>> devcoredump.
>>>>>>>>> But the intent is to dump a devcoredump to dmesg. It makes much sense
>>>>>>>> It seems like an awful idea to dump hundreds of MB to dmesg.  When we
>>>>>>>> talked about printing to dmesg it was about **GuC log** and on very
>>>>>>>> initial states of driver probe where we didn't actually have a good
>>>>>>>> interface for that. And the log wouldn't be so big. If we can already
>>>>>>>> capture the devcoredump, what would be the reason to dump to dmesg
>>>>>>>> (other than the non-valid "our CI captures dmesg, and doesn't
>>>>>>>> capture devcoredump", which should be fixed).
>>>>>>>>
>>>>>>>> If any sysadmin have their serial console flooded by such garbage there
>>>>>>>> are 2 reactions: 1) someone got in control of my machine; 2) something
>>>>>>>> went really bad with this machine. It's not "fear not, wait for it to
>>>>>>>> complete, it's just normal debug data I will attach to an issue in
>>>>>>>> gitlab".  And I'm mentioning a serial console here due to that
>>>>>>>> cond_resched() added, which is only needed because you are trying to do
>>>>>>>> in kernel space what should be in userspace.
>>>>>>>>
>>>>>>>> Oh well... looking at this the main reason to use ascii85 I can see is
>>>>>>>> because we already have parts of *our* devcoredump using it, and
>>>>>>>> userspace relying on that. That's new to me. Let's stop bringing dmesg
>>>>>>>> into this discussion.
>>>>>>>>
>>>>>>>>> to have a single implementation that can be used for multiple
>>>>>>>>> purposes. Otherwise you are duplicating a lot of code unnecessarily.
>>>>>>>>>
>>>>>>>>> And I still think it is a *very* bad idea to be including binary data
>>>>>>>>> in a text file. The devcoredump is supposed to be human readable. It
>>>>>>>> no, it's not. devcoredump doesn't dictate the format, it's up to the
>>>>>>>> drivers to do that. See their documentation.
>>>>>>>>
>>>>>>>>> is supposed to be obtained by end users and passed around. Having
>>>>>>>>> binary data in there just makes everything more complex and error
>>>>>>>>> prone. We want this to be as simple, easy and safe as possible.
>>>>>>>>>
>>>>>>>>>> For dmesg, there's a reason to encode it as you pointed out... but
>>>>>>>>>> no users shouldn't actually see it - we should be getting all of those
>>>>>>>>>> cases in CI. For the escape scenarios, yeah... better having it
>>>>>>>>>> ascii85-encoded.
>>>>>>>>>>
>>>>>>>>>> What you are adding to devcoredump also doesn't even seem to be an
>>>>>>>>>> ascii85 representation, but a multiple lines that should be concatenated
>>>>>>>>>> to form the ascii85 representation. For dmesg it makes sense. Not for
>>>>>>>>>> devcoredump.  We should also probabaly need a length field (correctly
>>>>>>>>>> accounting for the additional characters for each line) so we don't
>>>>>>>>>> have an implicit dependency on what's the next field to know how much to
>>>>>>>>>> parse.
>>>>>>>>> The decoding is pretty trivial given that line feeds are not part of
>>>>>>>>> the ASCII85 character set and so can just be dropped. Besides The
>>>>>>>>> output is already not 'pure' ASCII85 because the ASCII85 data is
>>>>>>>>> embedded within a devcoredump. There is all sorts of other text about,
>>>>>>>>> including on the start of the line. There are multiple ASCII85 blobs
>>>>>>>>> in there that need to be decoded separately. This is nothing new to my
>>>>>>>>> patch set. All of that is already there. And as per comments on the
>>>>>>>>> previous devcoredump patches from Matthew B, the object data can many
>>>>>>>>> hundreds of MBs in size. Yet no-one batted an eyelid when that was
>>>>>>>>> added. So why the sudden paranoia about adding a couple of MB of GuC
>>>>>>>>> log in the same form?
>>>>>>>> I suppose you are talking about commit 4d5242a003bb ("drm/xe: Implement capture of
>>>>>>>> HWSP and HWCTX").  Probably because I haven't seen that commit doing an
>>>>>>>> ascii85 encoding before, otherwise I'd have similar review feedback.
>>>>>>>>
>>>>>>>> Looking at this just now, so I will also have to balance the previous
>>>>>>>> users and existing userspace consuming it.
>>>>>>>>
>>>>>>>> +José, would it be ok from the userspace POV to start adding the \n?
>>>>>>>> Then we can at least have all fields in our devcoredump to follow the
>>>>>>>> same format. Are these the decoder parts on the mesa side?
>>>>>>>>
>>>>>>>> 	src/intel/tools/aubinator_error_decode.c
>>>>>>>> 	src/intel/tools/error2hangdump.c?
>>>>>>>>
>>>>>>>>      From a quick look, read_xe_data_file() already continues the previous
>>>>>>>> topic when it reads a newline, but the parsers for HWCTX and HWSP
>>>>>>>> seems to expect to to have the entire topic in a single line. But I may
>>>>>>>> be missing something.
>>>>>>> Sorry I'm not following up this thread.
>>>>>>> Add a '\n' where exactly?
>>>>>> To break very long ASCII85 streams across multiple lines. That will
>>>>>> allow the devcoredump file to output via dmesg for the situations where
>>>>>> reading from sysfs is not possible.
>>>>>>
>>>>>> This patch is adding an ASCII85 encoding helper that is more friendly to
>>>>>> output via dmesg. The patch does not currently change the existing
>>>>>> ASCII85 encodings of VMs and hw contexts. However, the intention would
>>>>>> be to update that code to use this helper eventually.
>>>>> It will break the parser and I don't think we are allowed to break it at this point.
>>>> The intent has always been to add compression as we had in i915. That will
>>>> presumably also break the parser. Although I'm not seeing how a debug log
>>>> parser counts as critical user space that must not ever be broken.
>>> We shouldn't be breaking the current userspace tools. Any change like this would
>>> need to be synchronized between all the current decode tools.
>> That is why the comment was 'eventually we would like to'. Nothing in this
>> patch will break a user tool unless that tool cannot cope with new data
>> being added to the core dump. And if we can't add new stuff to core dumps
>> then again, we are fundamentally broken.
>>
>>>>> What I can suggest is add another sysfs with a coredump that skips the binary dumps so it is readable by humans.
>>>> That will just lead to confusion and problems with people sending the wrong
>>>> file. This needs to be kept as simple and error-proof as possible.
>>> Perhaps it is time for us to convince devcoredump folks to accept
>>> multiple files like nvme folks were asking a while ago? [1]
>>>
>>> [1] - https://lore.kernel.org/lkml/1557676457-4195-4-git-send-email-akinobu.mita@gmail.com/
>> Is that likely to happen any time soon? That thread was from May 2019. We
>> need something now. And it's not clear if that is adding a filing system
>> within a single core dump file (i.e. read one file from sysfs and then
>> extract later like a tarball) or creating multiple sysfs files that all must
>> be read together and passed around together. I would strongly advise against
>> the latter. As I said already, the whole coredump thing needs to be as
>> simple and easy to use as possible.
>>
>> If more official support is added to devcoredump itself in some number of
>> years time and is actually beneficial, then we can move over to using that
>> interface (and break the user land tools again...). But until then, this
>> version works with the least amount of disruption for significant benefit.
>> I.e., it lets us actually debug problems right now.
>>
>> John.
>>
>>
>>>> John.
>>>>
>>>>>> John.
>>>>>>
>>>>>>>> Lucas De Marchi
>>>>>>>>
>>>>>>>>> And again, arbitrarily long lines (potentially many thousands of
>>>>>>>>> characters wide) in a text file can cause problems. Having it line
>>>>>>>>> wrapped gets rid of those potential problems and so is safer. Anything
>>>>>>>>> that reduces the risk of an error report being broken is a good thing
>>>>>>>>> IMHO. Robustness is worthwhile!
>>>>>>>>>
>>>>>>>>> John.
>>>>>>>>>
>>>>>>>>>> Lucas De Marchi
>>>>>>>>>>
>>>>>>>>>>> John.
>>>>>>>>>>>

