Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E718ECCF9E7
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 16:44:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F9F10E103;
	Wed, 25 Sep 2024 16:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aSVn1RM7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06DE310E103
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 16:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727282687; x=1758818687;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zA3QzFaPzPgHEOzot3iS6F9NpmZvR1uyKX2ZJYo5Zj8=;
 b=aSVn1RM7CsSWyeq9fWJafKw7aUOEVfxnkFTfwKHmX24obbZgwOBGRPKR
 gp5vMBJLc5vrMejwS8VVTQfez9yuaa7fpTTGIf8gAimBEYMj40+NpDOJz
 AAu/7LrzgfSpAP6+AyBtYNTDSnV6qrs8V2aSMZrMiXRbddFqaKeuT9WoB
 dSFuI+pJul0giM2Y2y3VZ1DNggAicGRra80HEi0m5aK9KLgwOS2nu8xuu
 eFFf/BWVCZDyznlpvgo0GCM4H405nSr6VUyFi5i1HrQGMEalLpoEVhgUD
 89c4v5XF7iA5h18c10Bwe/b709DM0OYnI8UTmBkqPhCtWN5FQZCneL0ZI g==;
X-CSE-ConnectionGUID: g1/L+iZASAWXWNMwC6+mOw==
X-CSE-MsgGUID: 5MdIi3RPTwufwrPvtPvU3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26156579"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="26156579"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 09:44:47 -0700
X-CSE-ConnectionGUID: wZjXEmFmQa+rzvCEpHXOng==
X-CSE-MsgGUID: bR8ElWm+ScqbYj13fdSZ/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="71720735"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2024 09:44:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 09:44:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 09:44:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 25 Sep 2024 09:44:42 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 25 Sep 2024 09:44:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uF1O0BfdlDFikgfXQaS6fWiX7EodRhTUzw5f5bKZ3g+O/Mj+lemGuANCb07kUqe3qaVUjjFAHz9zWMdDIORnfXK89564mbCay5x6w3YLY2wKIWlast1KEx1nGRBSIim6HW2CEJ/bLQvwfdGG2YFRwVzdi2TgG+D5dL+MJ7cyLL3zs9Aem/9j4gXTf2p+6ASm5CEJYl9b4xtPuNAqBb/lndDnOp+OWIoYGIu0Ddke/DRzCoMLWJeAKWHc08NkGKBC7VRmZFYqKhC86MqQDHBrJPIjhO8j1o4lxS8MRO1pcJ5MhZyiX5ADWGitY29pN0Nkf0sqiXrdFL1CQVtm+DB2Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1vMKVsXiEBuuNvfPaCJJCHix8tywzkAAK3UZAIBghw=;
 b=uT3D1pnp/6byTUthRVrsLv1d6P+eN5/WS8F7BfGf/doUYrO23H38dwxMql9aNaJPsFUPlCQaMRaObxZAgACWQ4YttkyhCoFAcxEJkwR1tXVKE939NqNjzMiLf2e0hTFOAiUsTN3Bvpp8MSDXhP4i9VKZ5CxjW5riXwwHJQ7/z8fgrgYKppEnFgFZv67O35R4XTG+F9pTkbuDnj4bCP4IcY5AnVZMBT0ciJmNrFOj5hiUlBTOWqxADS3FqTs37Chuh+X9tA0ZH8SkaZiHAg0WO0bBVYgiTnGof7A/QjVRdG6Rp/ZmOKWklVLLsFxt/KU9aml8wVgrAOHOcIYQ2x2PNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB7298.namprd11.prod.outlook.com (2603:10b6:610:14c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.26; Wed, 25 Sep
 2024 16:44:40 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 16:44:40 +0000
Message-ID: <e783d388-4242-4531-8593-8cd13749f6fb@intel.com>
Date: Wed, 25 Sep 2024 22:14:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/23] drm/xe: Modify xe_force_wake_put to handle _get
 returned mask
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Badal Nilawar <badal.nilawar@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Nirmoy
 Das" <nirmoy.das@intel.com>
References: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
 <20240924121641.1045763-3-himal.prasad.ghimiray@intel.com>
 <e9a4259b-0e24-483d-822b-6bb2478075e0@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <e9a4259b-0e24-483d-822b-6bb2478075e0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::19) To PH7SPRMB0032.namprd11.prod.outlook.com
 (2603:10b6:510:135::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB7298:EE_
X-MS-Office365-Filtering-Correlation-Id: ccee2676-89ad-413b-33c8-08dcdd81585b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjMyaExZSGdOY0Q5QjVZWVNoVWpMcFhwaDY2OHpOWG5tRGhRZ1FXNUg5YWdx?=
 =?utf-8?B?bTdldVhNUzlyKzk2R1BrcTZFNlV4OXlUNk01ZUVTSUIvZFNWMURKVlF4ZVZy?=
 =?utf-8?B?R1B6bGF6UXBoNFUyZ1VGUjNWLzZMaXJVdCs5TTRNQlVPOHdzdmJQaEFjaXA2?=
 =?utf-8?B?WEZ2VkM4NXBTNE4rWnNRMUVVNUp2ZEJ0ZHlLZzlpd1N6eEd5N1E5dk1zSWZj?=
 =?utf-8?B?TzhpWGdYVzFHSmpFT243N09PM2sxRjFkWXpadkxFWUhkMzhDUGV4ZmNvSzho?=
 =?utf-8?B?WDZvUlhMOVRvZ1dQSFNocW1yVEg1a0cvZDAzMnFjOC9LREI4Qy83WXBEalQw?=
 =?utf-8?B?dERzUXhJY2dRcC9pWUtCZmtoY1dzcDhLZXhvL0ZhcG56aVFRS1FOaVV0VElx?=
 =?utf-8?B?VHVUd1RBNnhOUU1DTVBHa05hZTBXb25Nem9weXduSDl5TkhBNE9LWVo3TTh3?=
 =?utf-8?B?Z1cwdzg4dVlsMTZ2YlFaOGp4UnpRc05TWHRRR2s0aEdVOWxDRDlyOGR4SENS?=
 =?utf-8?B?Vjg1cXArdy9UMjFwaVExOVRqanhrZUVLUU9wdGlBKzJ4bEE5bUZNN2hobFFQ?=
 =?utf-8?B?c3ZUVWJMMUFzRzhsQ0g2dUcrVStnVHJzeFQ2cis2eHlLcXJzL1F2ZFBMMmly?=
 =?utf-8?B?eXhzVHgyR0Q3ZDNTWDAycEpuNUZGMHRSQkZJTVd2eUhvSGRXeU54YTgwdmkr?=
 =?utf-8?B?b3ZGYlhTTmNxamlxVDZ0WnpneWl3SU9CVmNXWDFmaHdtOW96RFJobGFZUkxa?=
 =?utf-8?B?NWNaTTM1cTkvQWlSWWZpa0dxb3pLZTdaTEhTRkRYVnltOUFUVGNDeTB0NTMr?=
 =?utf-8?B?SndVRGd4WnhwMjZDVXArQnl2d0hwZ3d0a0g5SDF0UDFhaUh1b2NpbjYwR2FR?=
 =?utf-8?B?VkhhL0NnNTdJVEV6aUE0dUZvMGJzVzIvUVZaRmt6emhFUDhJM0FBY3QwOERL?=
 =?utf-8?B?T29vZGt2VWdWZENtYUFoTWhJWjYxN1dIaExvYXlIZFFNOE5sWmE1Tmd3K1RM?=
 =?utf-8?B?bkdoSVBwOXk5eGNweEJORE0rOEgrNlpNWGROcnE5M0RTUTl6ajBNblpnSEpQ?=
 =?utf-8?B?ZXVPeERoblRWVmk2TDh6UXRpVWNWVlI3eGFJWkFFSWJhVUp6WHlyZnZHL1g3?=
 =?utf-8?B?d1hWWWVJTmpiWjZwVWI5M3k3Wjd5UUNxY0lQK3ZDdDFhb3JobUhBL2lsVzh3?=
 =?utf-8?B?RTl6S1B5V1ozelk4dUJ3T0FteW92cEswVVNyL2V6aE9UaXIzWVN0WnJnQmZF?=
 =?utf-8?B?K0tLM2h6cVpHQ08yWDZiQlUyK2ttNmF5eTJjS0JsNWw4UHdWNFMxTzdnM3Rs?=
 =?utf-8?B?ZUd4cjMvSHpxNHA3YS85eWxCTnEzbzVqUjZlVWtESDFRK3JNWTMzeUtvdEFS?=
 =?utf-8?B?ZUpRNFdLNWNHVzhZTHhPN1h3aFpxa1ozWG9QR1JlWDQ1QWlsdHR6ajcrY05F?=
 =?utf-8?B?Y1NsUW1FMVVUZDdLRzFGdWhkUmpQMXM0bkxEN215Sm9KWDNDVnNEd0xkTzl2?=
 =?utf-8?B?Qis1SjlualQ3MkFtZFozTVhucGo0cURnY1dlSGNpWmFZcUhIZThwUjhIOHRJ?=
 =?utf-8?B?VWNlNFhPY2lvOXppK1ZBUDl5YkRZUGF1MXIxZzRQbGZRcHFGQjQ3Y1FhZHNz?=
 =?utf-8?B?QlpIRzBXNjdpdE5DSEc0WC8rUzZvdS9VNk1EMzMwajNMK0ZxZGNVRVRrRS9I?=
 =?utf-8?B?UUt4cWdBdHJUS09EcG9pMUxVekZZVXBIKzZidFJ4dWV4Mkk2ZUtrWlUwN2g4?=
 =?utf-8?B?MGQ5L01KOCt0bS9WUkU4cWNBblBsYjNiS0pJcm9LdXoxRzVyeWdneDg5QjJ2?=
 =?utf-8?B?L0lNVGs5MGIvMndyT1daZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVZyQWp0Zm5Tc1dWYmowbzh3dmVoMmdkUDVSRllJREErOW03SEI1TE5FZXdo?=
 =?utf-8?B?M0lQYWxJWWtGa1FqVVh3bEY2dERYT1BOUHBZQWc0VFAxN3pHaVV6M0tkY0dy?=
 =?utf-8?B?VTZCTDVoZWFaYW5rbHVGNTZ3a2phUlJ3KzBWZ2FXck5TZW5tb0VRQmhIMVho?=
 =?utf-8?B?QW85VnM3R2ZDTCtMWEVwMGo0ME00YkpERWVvQnV4c1ZGU25relMrclFmbVZB?=
 =?utf-8?B?VlUvOFE1NXJab0VwREFGT1N5UHduUTNxZTZkaUtXY0NseGFDYUNDdGVteUxs?=
 =?utf-8?B?VmFJTW1jZGNES285aHBXclhNdnRlU0dKNXhIR1lkRUNtcjVhdWJVRmhUQlNJ?=
 =?utf-8?B?OFJtbHlRM2xsK1VQQVBNeElKWUF5ZUY3R0pwcGs4NWJIU2dBRmxmVWYwalJ0?=
 =?utf-8?B?MHhMcDh1d3MrRHVJeDVITUNqdGRZR0Mvb3E1QTN0cnJOeFBsSXJoUGowcTdX?=
 =?utf-8?B?eDRXczA5NlF2MkhwK3dvSXlPY1VkeHkvZVFydmNlRUdTOE96Mkt3Kzg3RHdZ?=
 =?utf-8?B?ZzhFbmd6TENlSmRud0dUcjJQcHptMUFDN2R0ZEdFaE9Vdm1wZEFlQloxOFkw?=
 =?utf-8?B?UHhkMTBESlE5d3VpQmttcFVHRlMrMjI1UmRtdzJLc0JqdVNIeVJ2eFdWbEFz?=
 =?utf-8?B?WVM4MEVkcHN4MjRwd0E3akZubUZRUnowS091RUpibjVtSzlRWXR6MDR2R2h2?=
 =?utf-8?B?T0FnVVJVYk1vWkljZURHckhEek1wZXQ5Q2JZRUxoL1o0cGZIU0taUWFrdGpl?=
 =?utf-8?B?V1d2YlpGdGp2SElNZFNBZERqMm1ydmV2akc2VUEvR0pra1NQVHlhSFFBNXRr?=
 =?utf-8?B?Ynp4SjRSekQ2RVVnN0srNFhUK3QzQkxQd1crRVU3OGM4b2RkQ3BRSkl6ZWl2?=
 =?utf-8?B?enpMM01ZLzdkcWI4eTJ2NFhuS29KeHdSajVWNnk0REtqT2gyMEtOc3BJLzNJ?=
 =?utf-8?B?ejR1b2lnV0psQVk2QzA1SEdLcE9qV21SaWlJV2FRU2xjWkVMMkx2dTM5cWpD?=
 =?utf-8?B?ZktZc25rYzczbllWNEpmSS9JUER1Z0FtMjhHa0hacG1rSnRwN1I1TzA3TVY4?=
 =?utf-8?B?UXpLSFlUaDNXM1lMaXZxSk5Gcm9qUHVVMUtaTXVyVERnQUhtNTJ6K0x4WFda?=
 =?utf-8?B?Y25BWFQ4RTROTURsQVBYeFg5TTBMT24rVXVwNDJtMEVwWWJXVEtST0RNalla?=
 =?utf-8?B?bFExOXBMamlxaTNBZnF6blRyT3VRNFA2VkxKSURTbXRvVkljdmU2WjlCK00r?=
 =?utf-8?B?ZXptM212UjhMbDVnVXluNmR0NXVMZk9wYXlrTWdxc080L21FeDRKQTJjNUhr?=
 =?utf-8?B?SmlaK0JUU0VLamZ2S042MGxZdG01OTJTVFNsSThWUGdpUGJIT2c5T2JCejlt?=
 =?utf-8?B?bklvZk9vc1JXa0djM3pxYnAyblNXQy9HT3JHdEsyUE1TSjhRTGVqVE0wN0Np?=
 =?utf-8?B?Tkhac1A5dkZFc2tnMi9oNVNpc3o2VXZoUVVzaXk3a0JDRE9JMG5aWkMrdmtM?=
 =?utf-8?B?KzdIeUpRTHFnVmZ5RGYwbm1Ra2tuOThhRG9memZUSFV3S2w2dDAvKzIzbWda?=
 =?utf-8?B?ZmZtN1JDcGk0OUw2S1dKZTZJd2FrOHRSQkF5S2dDazk1YytvWVBOb29WLzd5?=
 =?utf-8?B?NU9vSGZVQm0raU9zN0U5MnAwQlNKVHZaT2pUeml2ZUNnS3R3RmxBaHFKVE9C?=
 =?utf-8?B?YUZLKzZtRkpFbXp3U1U3TEoxTFk0RGFGVmRhNHU3d3ZoVmxYcWltY1QrUE9o?=
 =?utf-8?B?VWo2WUd6TjZCb1hQR2xGVm1oZFN3QlBZQ3NPa2ZySTlrYzdvYTZtSXNwVEc2?=
 =?utf-8?B?WS9xb2R5dnVEdkJtTVY1cW1WM0lucHlKYk9vc2JlZnRuSGc2eTlxOXlrcXV4?=
 =?utf-8?B?NHFSUXkwaXh0NWVFUEFGbXJ2T1YxQXVuajdBdWZuS3EwTUNqbk8yM0xhLzUw?=
 =?utf-8?B?U0xpN2V1dkYzUzRzbjM0S1RtTWFmdWFlUUZnRk9qdmJpekoxdWZHV2sxelZu?=
 =?utf-8?B?eHlSUWhtTFhHSWowM3BSellBNVFKcWtFWlk4UkNPcis4dzdFNTVnWU85cW43?=
 =?utf-8?B?a1BJVjZ6SnpRVmc3emlXOVhJSmFQMjl2V2s0Q0VvczR6RFY0ZEtUT2dBbTVU?=
 =?utf-8?B?bDZBRTF0cG9zYXUxaVdrc0NMdUwram9MUVBGdXBVVjd2NjNHcFhVbE5jcE5B?=
 =?utf-8?Q?h9sLoTX3ZR2GXmHhF/NxbAU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccee2676-89ad-413b-33c8-08dcdd81585b
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0032.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 16:44:39.9743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ONTpEzxTlfyhdd8AxMnNrXqbd/XQSx1cUO+q51KMGu8P9PPhTGiL4+oHYzdQ2qmxDKDScrxZcqCktqx80ce4mf3JHmbs463V/awy8D1lyTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7298
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



On 25-09-2024 19:33, Michal Wajdeczko wrote:
> 
> 
> On 24.09.2024 14:16, Himal Prasad Ghimiray wrote:
>> Instead of calling xe_force_wake_put on all domains that were input to
>> xe_force_wake_get, call _put only on the domains whose reference counts
>> were successfully incremented by the _get call. Since the return value
>> of _get can be a mask that does not match any specific value in the enum
>> xe_force_wake_domains, change the input parameter of _put to xe_wakeref_t.
>>
>> v3
>> - Move WARN to this patch (Badal)
>> - use xe_gt_WARN instead of XE_WARN (Michal)
>> - Stop using xe_force_wake_domains for non enum values.
>> - Remove kernel-doc from this patch (Badal)
>>
>> -v5
>> - Fix global awake_domain
>>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_force_wake.c | 21 ++++++++++++++++-----
>>   drivers/gpu/drm/xe/xe_force_wake.h |  2 +-
>>   2 files changed, 17 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>> index d190aa93be90..c805214bc348 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>> @@ -197,26 +197,37 @@ unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>>   }
>>   
>>   int xe_force_wake_put(struct xe_force_wake *fw,
>> -		      enum xe_force_wake_domains domains)
>> +		      unsigned int domains_mask)
> 
> it seems that in whole series you're using "fw_ref" as var name to hold
> return value from the xe_force_wake_get() so maybe the same name should
> be used here for the parameter instead "domain_mask" ?

Sure. Will update in next version.

> 
>>   {
>>   	struct xe_gt *gt = fw->gt;
>>   	struct xe_force_wake_domain *domain;
>> -	enum xe_force_wake_domains tmp, sleep = 0;
>> +	unsigned int tmp, sleep = 0;
>>   	unsigned long flags;
>>   	int ret = 0;
> 
> in patch 23/23 (which personally I would squash into this one) you're
> changing return type to void, so keeping the local var named "ret" is
> questionable


Will change var name from ret to ack_fail.


> 
>>   
>> +	/*
>> +	 * Avoid unnecessary lock and unlock when the function is called
>> +	 * in error path of individual domains.
>> +	 */
>> +	if (!domains_mask)
>> +		return 0;
>> +
>>   	spin_lock_irqsave(&fw->lock, flags);
>> -	for_each_fw_domain_masked(domain, domains, fw, tmp) {
>> +	for_each_fw_domain_masked(domain, domains_mask, fw, tmp) {
>>   		if (!--domain->ref) {
>>   			sleep |= BIT(domain->id);
>>   			domain_sleep(gt, domain);
>>   		}
>>   	}
>>   	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
>> -		ret |= domain_sleep_wait(gt, domain);
>> +		if (domain_sleep_wait(gt, domain) == 0)
>> +			fw->awake_domains &= ~BIT(domain->id);
>> +		else
>> +			ret |= BIT(domain->id);
>>   	}
>> -	fw->awake_domains &= ~sleep;
>>   	spin_unlock_irqrestore(&fw->lock, flags);
>>   
>> +	xe_gt_WARN(gt, ret, "domain%s %#x failed to acknowledgment sleep\n",
>> +		   str_plural(hweight_long(ret)), ret);
>>   	return ret;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
>> index 6c1ade39139b..731a9a5a29a4 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>> @@ -18,7 +18,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
>>   unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>>   			       enum xe_force_wake_domains domains);
>>   int xe_force_wake_put(struct xe_force_wake *fw,
>> -		      enum xe_force_wake_domains domains);
>> +		      unsigned int domains_mask);
>>   
>>   static inline int
>>   xe_force_wake_ref(struct xe_force_wake *fw,
> 

