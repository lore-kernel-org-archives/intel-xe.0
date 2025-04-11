Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FCDC369A2
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 22:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A4210E182;
	Fri, 11 Apr 2025 22:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eI8zSINx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA56C10E182
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Apr 2025 22:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744411220; x=1775947220;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TjmUXtcFN7jRTibUcBYF3az2lPd1lBJ3qlg3Np4EWbM=;
 b=eI8zSINxkJmaHizL1kMtjrbHri7t+EUVosLdAwg+EVcCwD5z1bV2KNKe
 ChrcSntr3xBRInGma/VrwFH7jcHSbTElj6rQZERV9bxE6g0NwoQngc6c+
 q+Mp0b/l4ERHTsUdlQ4In2Fp1Pt2BtKx8K/CnItXBTnIOtMsZb18rfKxx
 xtlaMrdfRcJTah2UE3uRrn1vVu8/UXxAOMQn4LfhX/5xkL6kPnR51M5u8
 +415dal0sViAOqBZn3sYUMhr+6T8IuDSRhqclhEtZxtYaGYtplPKLaCLM
 8JvPN4Wxs4PKhB7ByTOcUZtTtLg5J/TOj07l6VRLswTcOOMKcDaVpSyDB Q==;
X-CSE-ConnectionGUID: L3vPXZLERRa4VMN9IeuvhQ==
X-CSE-MsgGUID: nHJUxhu0SbO1l1H5dmnBBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="71356027"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; d="scan'208";a="71356027"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 15:40:19 -0700
X-CSE-ConnectionGUID: OjP9EOy4Sqije3y/pGeSqA==
X-CSE-MsgGUID: 1T38aIqnRx+RdkoZS43M0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; d="scan'208";a="130151307"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 15:40:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 15:40:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 15:40:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 15:40:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZBTKeg9tsBP4a/+tzGSQ/XDyijItEIJL5heQ6ybESiNVrj1WqtrnaGOvDz3yrHuNPWVQXM8Q4iiwUFrB8f4AQ3Xq2l7p7DJa7iCz9EJ4Tqz+NaJYkTWlpRaMkqJ1t10MF1Nn1LH6dYSDsIX+q7YXJVFjnQy5Ca/DX4RbRWRJ8osvOZG/V1j3jbfMgHubTgzrSH+KrfZVPy5cji0Qh3HXzDLhXMHu//PVhpZZEhLYGUEu6mtCrAJS7NR8586muf5+08wt0jIkxM/vK/W5iIAF0JrCz90xDB5IlSQBO0GMWBJB2b9K8Jx+VvrRccO7Y77yWKnooIzO/CP3y4Km8AIPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJ4wLYnwr+Yeev6E8aQkuWctoKYpDQ09QesL1fkpHO0=;
 b=XnnwGUOvXhIhS476nEeFzd9Jbo+e+8ZaFXGAYxhaVCejHgP7zwf/j35v1Me1DZYMGfIbGmaTi5PxiPQ/G+sndlLOtzxsct2H8RrZnIa4/sSIoDIG2OG2Yuq0e8k4o0xUWvYrl57u6Z6btduw9z8+B6sgZKgMeYur1Zd+r9R7ponW9V6uubhcs9vVQlPkmZK32AIr8tri6GQLyrLyxkwYVxL+mmzlh8x+xxAQOjZrdY1+Cmpk5lR93WyaO4s4uoiD95iX/o4qwgfEjTO48P9pyzCfWSeRbFr3hgpWvl9O7eGZnleHEeVGmGUnGMuluJk7D0G4JuogmCjjl32fJFfFeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH7PR11MB8276.namprd11.prod.outlook.com (2603:10b6:510:1af::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Fri, 11 Apr
 2025 22:40:16 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 22:40:15 +0000
Message-ID: <e4c66c7a-d4d6-48aa-895a-aa0e335cc8e1@intel.com>
Date: Fri, 11 Apr 2025 18:40:13 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/xe/guc: Add new debugfs entry for lfd format
 output
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250410155853.574830-1-zhanjun.dong@intel.com>
 <20250410155853.574830-3-zhanjun.dong@intel.com>
 <95d22c4d-73b5-47d8-b619-ed466ee0741b@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <95d22c4d-73b5-47d8-b619-ed466ee0741b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0092.namprd03.prod.outlook.com
 (2603:10b6:303:b7::7) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH7PR11MB8276:EE_
X-MS-Office365-Filtering-Correlation-Id: 9975ef31-7c90-4e6e-5bde-08dd7949d420
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlVRNTFTK1I4UkJmSThzL3NqcjVTV1R4ZTRRS1pLcmU5STNvNUl0RHBzK3NI?=
 =?utf-8?B?RWppd2QzTmlzd29iRlJubmV3aGNMcWFybHVYMDM1ZitKR0hUbkx5QXZENkU4?=
 =?utf-8?B?TW5HK0ZrQ0VaUzFWdC9GQXZoL2prY2d6VnBBS3gxNWtvL05pWW9FakxNNHh5?=
 =?utf-8?B?eHcyOVFxbjhmb1dxbVFjNkI4UDNMMGdHck1xUTVJVUpOQ3g3TElOb3dZcm1l?=
 =?utf-8?B?SGlXN3ZLUGdCMVN1QzlGeGFyUkYzRFpyR1VzeHN6S2xHWlJ1c2NSWVNJR3NF?=
 =?utf-8?B?czZrS2ozR3RJeDM2UnlrRDE1Qm0wR3N0a2RZQ2k1ZHpKb0YwWTljdjFUL1Rr?=
 =?utf-8?B?RUozZ0xrS2JRTm90NFNJVnViNXJGc0VTVXh5SjhKenloZ1Vtc1J5Tkw1V0NW?=
 =?utf-8?B?YTN4THd4VW8yalAyblNKbWIrbmtoVHNlU0hQN2pCcllpU2h4NUJhVEZTTG1q?=
 =?utf-8?B?d2M2Ym9VYUhYVC9GL2ZFOC9wU2JWY1NoTUxtNHMyTG5YazBReGtSZHZkNm1l?=
 =?utf-8?B?ZXZTTEQ4ZmQrTHVzTWZHQXRQQjdFZGJrZ1FmTGZaWHFDL2dhb2VlSmR4REEv?=
 =?utf-8?B?dm84eUJ3aUJWTEd3WWQ3OEFzbVYwTU94VW5SRUE5K3V6ZDFNcUJ5Vy9HeWpH?=
 =?utf-8?B?bHNNTFNuc2Y4KzFVeVlWYlNmL21taTFaMTg3R2dRNGNSSXZPWWJ4OWphejVv?=
 =?utf-8?B?MEh3dytQNTNWVHRvcnlVSk9yOGhxbmk2dWJPcGFqY1E5RzB6dTZaSkdqY0ZD?=
 =?utf-8?B?MlNWWkVHVUVhNGxjdkErOGpodkd5UjNqQVo2TDFvSTVNT1NjdU1OUWU1NklW?=
 =?utf-8?B?MmhPcFBBU0x1YmMrODZoWGRmSVJqbGpWY3dRVHl0cnNXbU01RnBTN2ZyNHlO?=
 =?utf-8?B?ekErdWpkTGNaWm9NK3NHKzRTQmxyOXlCeW9JUzk2Z1ZnYS9JbXRjOGRnb0Vu?=
 =?utf-8?B?UmZsMVZXZGVMZmJWMGZST09iQmxnR2wza3N0aTRpS3d4bUhjRElUYTgxbFZC?=
 =?utf-8?B?VG5pUmdoNW1ZZTNBQUNrSkNjRXNtckZ0MTZMWmVBdkRzUUdTcUwrUWRqUjc4?=
 =?utf-8?B?ZHhXYi9EYjFYeGpIbG52NUo4Vnh5WGJKZFhaVy9ycmtzeEF2MTd0S2g5dE9Y?=
 =?utf-8?B?YXNjV3JmNGRIS1NkZUNINnZZMkNmUXZtbUY1Wk1EdGltcWVYR1VoZmtoT0kx?=
 =?utf-8?B?TGdISThOY1BxOEhKTG11MEQ2ZGFjQ0xnK3llRGVzM3BoN2JOSVIzOCtMSkRy?=
 =?utf-8?B?NlBROTZac3N2a1d1cUZ1TmpRTlJtdHorQm0rbEpVeWVPdnBxbjRwcUE4dm1U?=
 =?utf-8?B?djlsREZqaDF1NVF0eUJJZ2toNnBSUSs0V3hMeTJhendJQnBldTJrTnJvc1h1?=
 =?utf-8?B?bUhWaFJiOHNYYjVJWERJN29ZMjBZend2SUU1VVlncG5lcVZYZGZoRThNL1h5?=
 =?utf-8?B?QXpGSmZUcVVMNWhhZ2Z4dUVqNWcyT3ptdW5Ga3RMdVZrNmw4SGkxNkEwVjZF?=
 =?utf-8?B?Y2IzZVJRQ3ZaSG1tR0ZqQWdKZy8wZ01CNnE0dEVTWnpQQWtIRXRJTTI0YjRL?=
 =?utf-8?B?c1NFZDNnMW1TT1FQTTFHQnpvTEVRUDI2QitvOTdSa3VXV3FLMUMrNTdXMGtP?=
 =?utf-8?B?dkJMeG5YVldBVlhWb09CZmlGbEkzN1VNK3JUYld3eWhvSEdjODkxUlJiU0Rh?=
 =?utf-8?B?T0ZsbGJDMDNnRzc3MkllWURhUkZudURMMHo0NzM1MGZZSkt3ZHhleHNGTG1P?=
 =?utf-8?B?V2ZZbWZnb1FxMFY5SG5BYnRBVVhVdlN0RDNNaC9vU2JTaUZFZmlOWElXaUJD?=
 =?utf-8?B?dGRPNHRxVmNra09ZT2YxV1NUMGVEVFRKL3o4Y3MxUHVFUEovY0JJeE12dnE1?=
 =?utf-8?B?Nlo4cm9TTHNiKzBoWm5pZm1xWCtSbHErSXA0ZUJlcjVpZTIrN1l0RnFZbHNi?=
 =?utf-8?Q?yXkc031DKEk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YS9kdmkwWVEzekZ5NDh5OEJtait4THVMZUFtT3hKQytXM2pJS3d6K2l1WXpt?=
 =?utf-8?B?MkZCd3FPS0N1UnlSNjdOb1NNaTJheFMzYlRTbDFuWXI1TkwvWmhRdnZuVnMy?=
 =?utf-8?B?QWU0YkMzbW1wT2M0cTVucGRYNVV4UDBSMTZ1VjlSNnFuZjlvVTd2WWdic1I3?=
 =?utf-8?B?TDJCN3RzRmJ3bE1JcjBOWVZ4QkpRUHBkVUxrcGp6ZXpGWWMrQVZxUGNqTU9t?=
 =?utf-8?B?NFZyVnhRa29JOENUUDZOWWl5Q0NtSnJDV3NBbUo1NDczQ2FDY0N4ZVZIVTY5?=
 =?utf-8?B?RFIyVUVHUDZNbWdTWE5PRWY0US9EbnFGNGpYNWdibCtmT2VqTDN5dzBQbmhV?=
 =?utf-8?B?M2d4Y2xjamZlaHA5VnVidHBpb2JpVmdxbWRpVkt3VE1HRmkyUTdld3NZUFQr?=
 =?utf-8?B?OUw3RSt2eWZhNmU5WTlaaTZCWEladHZnMHNrR1JlZlBOTmhIZmdGWWgvamhP?=
 =?utf-8?B?L2g0bzUyV1JIT0JieHh4NjNkaDdRSy8yYkljL1lOR2lnekFob25pZUV5RS9I?=
 =?utf-8?B?TGxGY0VmVjBpdUZHOGp4WmNGaDhLNU5RUkJZaG1Qa1lwaHAvNFoxeng2NFRi?=
 =?utf-8?B?Ylh0dVhZbVBQcnNZWUJhZVlxemdtZVBQcTk1L25LOXM0QVVnU0IzU2tUU0l2?=
 =?utf-8?B?dnZPdE1tR3Y2M3BkbXFqeXBDblNDcVNZQ0dZSXlzb1VlaVBUWEdVclhnWENJ?=
 =?utf-8?B?cGIxMjZ1TWlaUUhyWDRydHlUYTI1RWlmT1pseDdOQmlvTmFBWmJSejdaRlQv?=
 =?utf-8?B?K0pvRW80Ky9qZlFUMWVOMktUZ0FWK3o5UnllcGNMa3E5TzhlZGJObElCYnFx?=
 =?utf-8?B?K0MxcW0yRE83bVhlUzI3eVhrR3NORDdWckJmdjZ3UHRCcVRPOTJ3M3F5VWN0?=
 =?utf-8?B?U1RITnNwcEIwY0ovd05vUjA1cHRyQmh0VHp2MFplc0dNdGRhREtkTTNLbk5G?=
 =?utf-8?B?cmhWcDN3NzM3MVR5QjhudmdPSG9NMFVkSHBaM3A2Nzh6amgxLzRSM1VMWE1y?=
 =?utf-8?B?cmVFSnlNb0tLcnN4a084a2RGV3RnazJsQnBvZG5ISGVrNTB6cXpIVktHb3ZX?=
 =?utf-8?B?dytBR0l3V0hJa1hHdjB2WWNNL0NieHBlMW9ldDZDZkt4U09aaE95K1VSenp5?=
 =?utf-8?B?VmNSNVprZ2ZrTjd1dFhkM1Y5SnRMQjNzZm8rdnhwUlV6ZWdQbHBTRnQ2WHkv?=
 =?utf-8?B?SjdmWURqUFRsMjlCVHZPUDdlOW1ZMndzU2JZSS9CaEU4NkludnMvUC83dTZD?=
 =?utf-8?B?ZmdaTDU5TlphSW1nbEhmNjRwZUpJZVZSTnNydnFaN0kyUXlEM0FKMU9tRlN1?=
 =?utf-8?B?ZENzaWwyelhRUElMWnlEYlhBb0VIdGxsR21SZjFjaTRqa1lBUmdRK1J3anFm?=
 =?utf-8?B?aUsrcWh6OEhwSkZRZTMvdXFpWXZ0cUdqTmJxSk9tYThPVGNKaTJCdjVBcVY2?=
 =?utf-8?B?YTYySG9JaHNCWjVldHd2Y053WURjOHoxL0ZnbVdZSXlVcmRnNUJsV3NjSmE1?=
 =?utf-8?B?ZXk0YndrK2tWNjlOS2NkS0dNS1ZvU1lxYm1QOWt4VHBRYm1oM2ZZbGJRYmlS?=
 =?utf-8?B?b3JoTnRhSWFzZEwvQmdXOVVLNmkrWk15U3hkUjExRDV2eHJ0c2UwMW4rVXFm?=
 =?utf-8?B?TmdSWFUvUG9Hak01YzRSL1NHSDlKa2dOT0lObnJrcjZFTWZiTzlJTTRuUVZi?=
 =?utf-8?B?S21GSFF0Z1M3TFdSSkhQcVRtekZnUGhOYzhidTNsUUZNTEpkQTFNZkVyemd0?=
 =?utf-8?B?cXgvRDNPd0Y5U3FJdmltQzBqRlA3ZmcyQXlmNXJNRWRaTlNnZHNoZmJUSjJr?=
 =?utf-8?B?ZkZQRjVmbXFsWGZTQnNwbDFzKzFubTA5aWVzYVlRaXVQZkgyUElQdmFwb3p1?=
 =?utf-8?B?clVXeWxkWDRDTFd1SjhHS28vL0tHTklGWGFMWGFkdFA3dFFEdjRDSGVnc3pU?=
 =?utf-8?B?WU5jVGtUTVB5QkVnYlJWaUdNUU5UdnlDcFBadWo4anVCQnhMSkk1a0tBK1ZS?=
 =?utf-8?B?S29XVXg0R2VocjBPRG1LaFRnWE9iSWtETG1uTlQwanVBcTh5bFZ2UEIrSnpz?=
 =?utf-8?B?WG1jYVB3OWFBVHlNQ3ZXYUpCYWsySlFEOFZpUWZNUHV3NDZjVmJZbGYzeEE3?=
 =?utf-8?Q?f70fuyGaPFT7VqcYwrJkkyJy5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9975ef31-7c90-4e6e-5bde-08dd7949d420
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 22:40:15.7833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UHIsIyo3EQY80LQ6xleSod1S6oPkyrNH3C6Ye7qaxvwAwpzQ/S5ZUkW0WALTCNVQPp+9XDTfp+vrlcEf1NJqUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8276
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

Thanks for take time to review.
Please see my inline comments below.

Regards,
Zhanjun Dong

On 2025-04-11 11:34 a.m., Michal Wajdeczko wrote:
> 
> 
> On 10.04.2025 17:58, Zhanjun Dong wrote:
>> Add new debugfs entry "guc_log_lfd", prepared for output guc log
>> in LFD(Log Format Descriptors) format.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_debugfs.c | 14 ++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_log.c     | 34 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_log.h     |  1 +
>>   3 files changed, 49 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> index c569ff456e74..6449c9a69b8a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> @@ -48,6 +48,19 @@ static int guc_log(struct seq_file *m, void *data)
>>   	return 0;
>>   }
>>   
>> +static int guc_log_lfd(struct seq_file *m, void *data)
> 
> this needs to be rebased due to commit e15826bb3c2c ("drm/xe/guc:
> Refactor GuC debugfs initialization")
> 
> and placed in the pf_only[]
sure, will rebase>
>> +{
>> +	struct xe_guc *guc = node_to_guc(m->private);
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	struct drm_printer p = drm_seq_file_printer(m);
>> +
>> +	xe_pm_runtime_get(xe);
>> +	xe_guc_log_print_lfd(&guc->log, &p);
>> +	xe_pm_runtime_put(xe);
>> +
>> +	return 0;
>> +}
>> +
>>   static int guc_log_dmesg(struct seq_file *m, void *data)
>>   {
>>   	struct xe_guc *guc = node_to_guc(m->private);
>> @@ -89,6 +102,7 @@ static int guc_pc(struct seq_file *m, void *data)
>>   static const struct drm_info_list debugfs_list[] = {
>>   	{"guc_info", guc_info, 0},
>>   	{"guc_log", guc_log, 0},
>> +	{"guc_log_lfd", guc_log_lfd, 0},
>>   	{"guc_log_dmesg", guc_log_dmesg, 0},
>>   	{"guc_ctb", guc_ctb, 0},
>>   	{"guc_pc", guc_pc, 0},
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> index 38039c411387..df849a0ee7e5 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -216,6 +216,26 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>>   	}
>>   }
>>   
>> +static void
>> +xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
>> +			      struct xe_guc_log *log)
>> +{
>> +	size_t remain;
>> +	int i;
>> +
>> +	if (!snapshot)
>> +		return;
>> +
>> +	remain = snapshot->size;
>> +	for (i = 0; i < snapshot->num_chunks; i++) {
>> +		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
>> +
>> +		/* To be add: Output snapshot in LFD format */
> 
> what's the point in adding debugfs entry without implementation?
> 
> add required function(s) and only *then* extend debugfs
To split into smaller patches as Matthew review comments
This is patch #2, #3 code will be called by #2, so this need to be add 
first, reversed order will cause "xxx function not used" build error.>
>> +
>> +		remain -= size;
>> +	}
>> +}
>> +
>>   /**
>>    * xe_guc_log_print_dmesg - dump a copy of the GuC log to dmesg
>>    * @log: GuC log structure
>> @@ -251,6 +271,20 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>>   	xe_guc_log_snapshot_free(snapshot);
>>   }
>>   
>> +/**
>> + * xe_guc_log_print_lfd - dump a copy of the GuC log to some useful location
> 
> s/to some useful location/to the drm_printer
sure, will do>
>> + * @log: GuC log structure
>> + * @p: the printer object to output to
>> + */
>> +void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p)
>> +{
>> +	struct xe_guc_log_snapshot *snapshot;
>> +
>> +	snapshot = xe_guc_log_snapshot_capture(log, false);
>> +	xe_guc_log_snapshot_print_lfd(snapshot, p, log);
>> +	xe_guc_log_snapshot_free(snapshot);
>> +}
>> +
>>   int xe_guc_log_init(struct xe_guc_log *log)
>>   {
>>   	struct xe_device *xe = log_to_xe(log);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
>> index 5b896f5fafaf..37ff4d11e6cf 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>> @@ -40,6 +40,7 @@ struct xe_device;
>>   
>>   int xe_guc_log_init(struct xe_guc_log *log);
>>   void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
>> +void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p);
>>   void xe_guc_log_print_dmesg(struct xe_guc_log *log);
>>   struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
>>   void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
> 
