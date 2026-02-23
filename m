Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB316EEC2AF
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 23:51:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6711F10E464;
	Mon, 23 Feb 2026 23:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B5lNTkoD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A33B10E464
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 23:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771890702; x=1803426702;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Sakm1rPvuP/FomVd8vsZt3oULm8Zoyj5urv/hdWHKoM=;
 b=B5lNTkoDCfpbb3MlfaBkCmTWknQeWYeDxlZniBNmO3Krvm4iSelBHpTO
 2iA4P3Q2Z1nxt0rp3rOE/MZe1TLf4OjGcwc9TVA129JWoa3IZ5NtCsrNU
 4OwF570zLzZXKAdfDQ+sswkajbWaRdHP2X+tbjtoJvORRG7B2+3sXbu6f
 Oq7bYbd0qvKlKvOVg736n1pVkyL1N6fPfpm05EVA7Gvq7zcDmA77MZCiF
 88ZT94MWsmyLffi5sjsDSoPSeXv94tefFUoV0sBpxIvOJPrlT5Dhl21cg
 7gpt2l8GxQAwJq6O7PTlfHpb1dHOp8KE+6eGsYLbhcv+NkgUaylIMFA2g g==;
X-CSE-ConnectionGUID: 7pqFUUwATjmqcwC/57vtmA==
X-CSE-MsgGUID: RdOQMwSNST++U3FOZYP2ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83221409"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="83221409"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 15:51:41 -0800
X-CSE-ConnectionGUID: zt96dptqTmG00sHA1uxjtQ==
X-CSE-MsgGUID: Wy5ZWWmvRkaaPBFDKKnhCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="219826126"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 15:51:40 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 15:51:40 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 15:51:40 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 15:51:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NuklJUldE11pudQpbWdqJ5YX9oH8knYEc/ACe4f11uYt59PSno1sZfNA0/Sjk6JyUueDwngJIANRHlZsmtN9SGXXKTEV5vza6ePBZZXJJrgj9OrkxKPskn/Pdf2WFB0Y+f43qn+t6/rF2vtMxBR11fj0YWNRjBPq8yxSlob5GKRduxLGX61W9h6dAIguGSPqrI1DNg9PYRyVmGZQYL14mmeqU13KXjzYNIgCqwbr00J9nTGG2+qPyXBiCQC9JmmU7OCzXEGmgPIdGzy7pVPfqzBk4cJQQbTFkqQNFG8qx+iGZkmLq7idAx2li0XAl9Oen2akB2wjynq5pgeJcEyPkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Fep+pdHObnMDdl2o5+2Jucr491JfXaoYpNMLGMASqQ=;
 b=DumpHYVIlOytAvUZrEiNr9J4MghIuhch9w+tk0L7rEIBEF0uot3QfMciw4IRk+z0i6+Bn4o46xakDbXPKrwbNgY2kBw4F1zBlKaIOcukjkaqwQ836Ro/0EYLwKF3whta684xBODZCPtFEQCZI7pM4M+1dh69sawHmXy0ezr3NtF6xSZexfmMYhqEV/WmY8Vp2mJ9Xn9OVmYH1AqOJYIb1+NraKuTlRp/CfOWwKWPy4C6JzbWea92y/E99nZ414u61a2WwP/d35LvnXQAvbAcSJiKWX4tVie+iONpiNqOMc8gH1cdgn8QZjDW7eY91sK6UbDhwEyKihur/U36f/STgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by DS0PR11MB7649.namprd11.prod.outlook.com (2603:10b6:8:146::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 23:51:37 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%3]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 23:51:37 +0000
Message-ID: <ae2e9af9-7925-44c9-bc61-9eef3d664aa3@intel.com>
Date: Mon, 23 Feb 2026 15:51:35 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/pxp: Clean up termination status on failure
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
References: <20260219002627.1208210-5-daniele.ceraolospurio@intel.com>
 <20260219002627.1208210-6-daniele.ceraolospurio@intel.com>
 <8afd21ec-48b5-44b5-828e-da4e49d2fe74@intel.com>
 <3f44097e-d95f-49f6-8a50-b0a6949116ab@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <3f44097e-d95f-49f6-8a50-b0a6949116ab@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0271.namprd03.prod.outlook.com
 (2603:10b6:303:b5::6) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|DS0PR11MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 79a1cf47-a944-4366-da12-08de73367b80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWtYUnU1aXJKU1ZhcDhnNXE4aGRZM3R5NEhBWStzSVBxb1ZLRkQwaCtMSkxC?=
 =?utf-8?B?ZTl0U1kxeTFjVVloY0FuVFVOalJyUy9ZaVAxbmRYK24vMU5UU1J5UEF6bmNw?=
 =?utf-8?B?cFBxVHd1VzVaVXJ4bDc0K0x5RGgvbzlKSzVLYzVMQjM0Ri9MWUFzTmw5UWR2?=
 =?utf-8?B?akZVVGN1QzhjNnlmR3ZlYUttMVYyZlc3VnR2WG1kY0QzT0FGM0ovMHFoLzBV?=
 =?utf-8?B?TWhmTjg1OU9ORVhEKy9IbVVrQ09pOHR1Szk5aHhJYmlBQ2hQV1pERUFGWXBo?=
 =?utf-8?B?TGdsOU9iTXQ0bzNqQzJzV050YnpNZWNqSGs2QXNsdlA5RDJ3blhuQ3NNYTZi?=
 =?utf-8?B?YTJvdk9FZEY0VnhYcmFJSS9YTzJkdGR3ZlJDNkZSREozU0l3dmJrd0d3MzV1?=
 =?utf-8?B?WkJDTEtoanAzK3dxTzA4MjQzZ01RRnBIcmdCME13QncvVVA2ZUtMNExLaVJw?=
 =?utf-8?B?WkdoSW9UYmpWc1dhZUw3ZzZWQjJDYjlCZWZlM0Nla252ajdFU1I2QzBFaEFZ?=
 =?utf-8?B?YWxrZkFDME5ESFkyYW40MzFBMUZ6dGYrM1F6ZkpTM1JYZ3g3RVFpYXFUNG52?=
 =?utf-8?B?Z3ZXclpxbi84UnNaMTVlbWE1K3lZREpqbG4rK05IMjhLV2x3bUlkQ214QzMy?=
 =?utf-8?B?ZVdBYStROE1peWxHUmhpSUZoNUZrQ3NsRU44K2VNQUMrcXJVNnlPbUhjNElu?=
 =?utf-8?B?M1RiTS80UVhmdDlQL05KVUhWa0VMcWo2LzdnRmVHYldXK2hDTHJsVkRLWWJX?=
 =?utf-8?B?ZGQrQVk2cG1qeUdGSkZoTERQaUVKaUdreURkcWhqdzJpYmJ1ejdaTUQyKzQ2?=
 =?utf-8?B?SmN3K3pKWWtneUZVR01qbVladFF2R3NqaGRGaTIvb201MGV1QVZmN3JBSyt2?=
 =?utf-8?B?ZlZSYkZZR1VFTWJ1b0RTdzFtYkxVdVhvZ3hCeG54SElKcE9vMEZGZUFIa3do?=
 =?utf-8?B?ZnFEbHdDbit6K053QWQ0M1p6T1hJTEhsc0UvTUk2SDdXa1E0ZG0zOXJZRVRq?=
 =?utf-8?B?ME5CeHpGdWJQb2tMenpsWDZlMTJheFJJV2xSWWhVdkhURk12WHplK0pUSFEv?=
 =?utf-8?B?KzBHeVh5NTlXakVmL0lDWEhQZFpmYkthaUgxZk1UUHZwa2hwbjN0bldZMlRH?=
 =?utf-8?B?SlliZ1drZm1XSWdpbUs3SVhHYi9mSW1ESnovd1Q2NklJN3hDVThrVHlQR09h?=
 =?utf-8?B?T20rNUkrR0VuTElyVDZHanJPV1hPUzBjR00rNFEveHVZejRjZ0lPcnBsY2t0?=
 =?utf-8?B?empwOVNHUk1ud0xxOTRub3pIYnNaTXhiandkMHl5bW4yalBCMU12R3F1TmxD?=
 =?utf-8?B?akJVYjlmQ3EwRUl1eFMvNSt1NFg3Y00yb2gxeXV2eFFWZktzR1dodFArSVFK?=
 =?utf-8?B?ZHRUaExBNTh3aENERDdja1loZi85ejhHK2dWM0pZdmJyc0lTQklETmdIMGc3?=
 =?utf-8?B?UU9yYU95VnhyUUxMZzd1ZTBVRkxTNzhmc2ZENWlXSVNHeWlMNG0zOWJaZmg2?=
 =?utf-8?B?KzRaOFMrVldJYVBDYTM4NTJQbzFVSjBIVUcwL2ZvclVQaXRXWW1UNk9NNFVo?=
 =?utf-8?B?Ky85L1hmSFRlMGErNXIvZFJNZnY0UmpaaW5hRVhaVU0veVBVeVE2b1FjK3Rh?=
 =?utf-8?B?Si9kNEVlOGQ0d2lubjZaMXpQSzhGRjlLajQrcUUwejkyZzZ3K1YzOXcyTEhM?=
 =?utf-8?B?UGxRK05CQXdTRTRVdjlBeENQbjFDOGREMkVObElUWlVBZTlab1dXTVBtYU9R?=
 =?utf-8?B?Skt2R2pTQ2FKNjkrblNZY3R4N2N1SFhROS8vbk5odkwwb2cvVW1zVXFwbWpx?=
 =?utf-8?B?VVZRSjRpZzI0ZVZzMjlTb3Rqb055VVFhN3ptekhqcjVLNENSUm43bDBqUkVD?=
 =?utf-8?B?REFudnpxc3YzNmJINHZrRmtmRTlDdkEyWVNWK04xanNTai9rNkZESm5LOFlp?=
 =?utf-8?B?TFZTbThrR2NZZ1F4Ri90NFBST29lUnFobGRtdFF0M0ZqQ1B6Mm1jMDRZYUZr?=
 =?utf-8?B?T1J0WkE2bXQreDhhVDVmNWdsbFBuYjZyeWg1SjM1S2pUekdyVzBEUTFiYnMv?=
 =?utf-8?B?RGVMb21NMTI2Y1BaTk91NmNCclhsdVdvZ2RLYWQ2NEhIZ1dnMk1mM1J6THlp?=
 =?utf-8?Q?Ib0k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDBmdU5EM0l1T3dTL2lNQVFFMGEvWkNDNDRGa2lBMzBNQmVMejhaN2lveWgw?=
 =?utf-8?B?ZFA3dU03SnM3TXhSMVNIL3FueGFiT3VvYmROWnQzQzh6dEU2M0NKUW5mbisy?=
 =?utf-8?B?bnVSV0wwNS85MkYrUEZoaG9CazVBYkc3Z3Z4MzVyUWJkREpqRSs1VWpBMzZk?=
 =?utf-8?B?blVtOU5TVXliRUFrQzBUR05YUG1GZzFaajdNUlpOVUI3SlorTVk1QittQmg0?=
 =?utf-8?B?bGtqcnBxWEdGd1JnNG96RVNnVUQxWnZiUHo3bjB2QlNieVNSRW1RUVAwcU1L?=
 =?utf-8?B?S01OV2JjclVCS1orbXdUQzN3RFhkSE5Ybmw0aE1sSlJEWjJRS2ZpV3R0MTdC?=
 =?utf-8?B?bXJ5WVREK1Nkdjl0WVQ1NThaUGZiQnVVYzd0cHR3S2NpZ3o5dFdpYVZ4bUxn?=
 =?utf-8?B?Z2hYZkk2VmFXd0hYNkcwK2xZbHJmeC9EV0xkUTBMRHUxakJuUjF4bngzUGRw?=
 =?utf-8?B?NnNzbk5ScGhuRHFGd2RGUVRmQlBJajNlWEQ4K2dqZWtRVGZKeWtHVENHcGlq?=
 =?utf-8?B?RFphVlBkeTM4cUhFYVM2eWc4ZzVGWElQdldCVVpoUUNWNE1Zck1qdDNaQnNW?=
 =?utf-8?B?L1gzek5HWFkwbjRrSUwzRkJGQm9tT3NsT3dsYXl6Zm43OEdMdE9xMzU4Z2x3?=
 =?utf-8?B?RDdBZWlXckFxNUw3WDUzbm9ybDVUUVhyWWxWTENoSm83Tys5Qy9relJVUEcy?=
 =?utf-8?B?UDAzOThJYUlKRVAwcFRKb0VwRjZYUHcwajlUYm1KQVRMaDJ0NXl5MGVCa1ZT?=
 =?utf-8?B?eHJJM29EZGRPTGpuWlZ6elFPck5pK0JRUVQ3TzR0Ukk1Mmt3aXp5ZWJ6bVRo?=
 =?utf-8?B?aUhJK251czZMbmJRclIyT0wyN1Z0SjVGUXQxNHRoNUlOdXRBek5RejdSREN2?=
 =?utf-8?B?aFRORW8wWWNORHdRdDF3b0dwVzN4SUk0Um5Tb2ExaGh3Y0c3ZW9JbEZtSmRl?=
 =?utf-8?B?OXQzMlFTOTljc2p1TEVRQWVhSkJ6Vk43dGdVNW85U2F4cmVLbEhNUm1vSmlS?=
 =?utf-8?B?OW9GSjNXZ1o5WE9xWUxrNTNZLytDWlc2K29uYzVDdldHVTFWU3RpY1FaallM?=
 =?utf-8?B?Z3pQeVRwM1Rmc25CRkFKREZhY0d0cGNOUS8xV3Flc1VFZFZKKzduMERXUEJu?=
 =?utf-8?B?ckxUWnYxMTdEbjNPY3lvUmlJWHRCWUpPNmVRMU40aEs0bmhjSnY5a29oNmVL?=
 =?utf-8?B?UVVpdUgxSG1ocG9JbE1rMlRwZU5PVWpMK2NtczhJUGN1c0kvcncxRVFZaGNG?=
 =?utf-8?B?eG56eE5rWXFSK3RnVVJXMG83K2lBdDEwODBCYUwrbi9lbStWek80emVDZHU5?=
 =?utf-8?B?WE96cFdrT0YrV1pPYnd1d2dXUHlXY212ZmN4UUM1ODdtM1FMeHlZYm5XQzFv?=
 =?utf-8?B?alB5WkRCdDhiVngrZ0MvV1NqdkFBYjZoMEkrU1ZoaHpnVjNHRWFVMW1Xd25P?=
 =?utf-8?B?TStmWmF2WDFSNk50ZWFyR2lxK3VMN2JLZTkwajY5Ri8yS1NwNDBhRzdnV0dn?=
 =?utf-8?B?czQ4UGY0c0tMVGd1VXVYYTJiTThrRWk0RXp3QVRsMVNkU2dhM2d4NGJsNEl5?=
 =?utf-8?B?aTV0dlRzQy9rV1J1Q2dBUmMvdEkxOGlFVzN1S1FXSGwwdnpKams1SnhyUTRi?=
 =?utf-8?B?eFJ6eFJSUlNoNVMxS245R0Rvbit3ZzlGQnpENjViaWVvdlA2Ykp5L0lwdC9s?=
 =?utf-8?B?Y29sNFgyRERBME5ySHFsSDV6b3BRVDB3VzJ3VHcwaVlrVmQxVExpNDdiWUtQ?=
 =?utf-8?B?elRCU08wWkVzWlVVQ21uNzVxN3VvRUxTSlVMc0hlVWhkc2w2WElWQW5wVUdY?=
 =?utf-8?B?K1BPZDdNQ3luclRmYmF4SExWWnE2WUdGZERvUXEvN3Z5T1dGNlFydHhabmJy?=
 =?utf-8?B?YTV4ekJXeGZJcHRUcVIzbmpzQ29ocHl6aE5oVzFHajRiYzJSUXZaU1dzeFVh?=
 =?utf-8?B?M1pTR1JIeHk0WEdGd2RDa2N2WnBQaDRFcUFiYW9WYkEyNUFNbVZHL1VRUG5w?=
 =?utf-8?B?SXY0c051bFppcWx6YkpDUVBXbVlXcG5ZZE00QkhjeVpSbzE5Y2hqWXpLYVp0?=
 =?utf-8?B?Q1BXbFFnNEt3TFY5eGFmaHFEcmQ1dFZBVm9URE5aNThtczd3aUdrNEUxV09X?=
 =?utf-8?B?N24zR1JLZklFVDdRNkhEeTVTV2hNWEJnZitjWm40V0ZJaGNaVHZaZi9VMkEw?=
 =?utf-8?B?OHJOcGNWOXhNY1BPTXI5bDgvaENUNlgvQVpzdVY1L0hHVVJvZDJhY3dsL1JZ?=
 =?utf-8?B?YVNvY2gzT1p2WkFIVWs2dW5tREZJSHFwYjVnNm5Sb2R0UGU0c1lkQVVHa01y?=
 =?utf-8?B?VVhTeHhtTGVJV1lmQ0VKSDN1UU93RXY3OFNwR0hybmFua0tTamp4VkFlelQy?=
 =?utf-8?Q?V9HjVqJRhg/q94rM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a1cf47-a944-4366-da12-08de73367b80
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 23:51:37.2755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: waGrHku1wgg4b6Oh+dXAtTMqdD7e6UYrjvMFJ+a8bm/1R0yVaYQKL+asXRKH0zpDhdb8ZnBw2unA+YidWQpDvJVYBxAb62XwCGdN5BEjkrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7649
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

On 2/23/2026 2:29 PM, Daniele Ceraolo Spurio wrote:
> 
> 
> On 2/23/2026 2:14 PM, Julia Filipchuk wrote:
>> LGTM
>>
>> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
> 
> Was this meant to be an r-b?

Yes.

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
