Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87F4CEDD8F
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 12:46:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9369D10E2B0;
	Wed,  9 Oct 2024 12:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W5Gzev0X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DBE10E2B0
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 12:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728477974; x=1760013974;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dukwqjOrz26hZuSXstJ1yrzMNoe+z5E6cC3FU8y7Pq4=;
 b=W5Gzev0XeuLQbF5+uzCNusQV4MihIh/s/GYThktc1cC0/R21juczZyDr
 egnOJjABOTh3eH3JF1SiBQ40zsIald8MQNXzS/x/YCMeDfHa2RLYXjfXT
 Emr5rqNA5xK4mTWhQghgW5gh0Ztx7Qa1TU2nNN9qToWTME+CN0HFKeO1x
 EtVR5DDh1C5DAU/+bBo+NS5XqFZaIGgn9YY4otBQ+0+3VYmCiJvaAxOqx
 rNbtd7DgEQRTMcSPlOFuoLg4tjvaCPNC8yaYfGTjGlGNgzm9ZB6qjPpqs
 K1+Q++CHJTsDeQkPfmjNHb/jDn/p5IS+oc99TlA9M8EF2poj1MazNAeVX g==;
X-CSE-ConnectionGUID: nzDYHjslRnWImSUHGz2Xqw==
X-CSE-MsgGUID: fmw8yFSIQveaAC+jw3fweA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="39165547"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="39165547"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 05:46:13 -0700
X-CSE-ConnectionGUID: TvDpvoi+TIG/M/45Dcp63Q==
X-CSE-MsgGUID: 3K/XsjEeSfyaojLhoAgf+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="76337950"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 05:46:13 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 05:46:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 05:46:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 05:46:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:46:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNDO9YTqg0NfYOaTyJe1eK/yMquv70FlUj+AKhO3gGVDcdqZJRSWlbFRILx0qikt9EEFVYsbfZjiWQ0L/PHSOUnkl/tX4GwHBBZXFSzFhr90dvVqlXROvCLjLHcFh/3bJHkche9aSlfPEI0ZKjf9msK8szfx1G+KzhpkEjgviU3vywsyfw515nWbB8IA8oi2vOio9xkWvkeVUNjkwg+FUpoyHbfv5MlK2gaDl5hxvF3Tc5yi5ngcZ8wbtjd9MM8UIRCpTyHZwFYU6Th8LMeQK3rGTUDNR2d9POw0wxjW721ATB0UC+lpw10x82BM906MO5cQBvTt/HO9REEAQRgzkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8fhtUkH+kfw6/aXKyJutV4EuDkcJ10vfBPa+PhJgFo=;
 b=AKUF2OA2OwpQU1rkih79pZC991BNki9SvDltioQh48Yly1UwqZd3qv2bZzOaAaiixx3tKlpRMtcavvUbeIivhKCxEZBzS/aydB7vYmnwmDI6y8M08nfbKdmncJMJ5wPE3+Bx9rNXdm9Ter4zyEc+oC1Xq2OQ6OgdIY9B5akUtXou3S7+2j91zbk0Iaf5izWsGHkbdam6dWgxA+N8Yy/2wHrB+BOdRvhHbXQE3l2KXpyJZXZK/QwqkeAfT+Lj51t1x+SYTwYHyrhWAbs6xEYMBr4dU+YiywO/oyUqrWWH/4qsLwMw3N4J7W2ppzVMiJVQiEZln8lvw6i7ZEUAFZVbmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB5189.namprd11.prod.outlook.com (2603:10b6:510:3d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 12:46:09 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%6]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 12:46:09 +0000
Message-ID: <876cb906-f6c5-42e1-8f80-340adafff1ab@intel.com>
Date: Wed, 9 Oct 2024 18:16:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/26] drm/xe/gt: Update handling of xe_force_wake_get
 return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
 <20241008071115.1862704-10-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241008071115.1862704-10-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0173.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::14) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB5189:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cb362d9-88a7-4fc8-a265-08dce8605924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2kvaWFXbFpvYTZKWGVnbDBaTmFUV3VVK2VNVHdOMEFXMm1YdmJxZVh4a2lM?=
 =?utf-8?B?Wkp2a0I2YjdtWWpPcHg4TGxNMUFxVFhMMzdoV3FZb3lnbWJZdkhQNmYxbEtw?=
 =?utf-8?B?MGJiS3ZRNlZJOUt6TG1uRmVnckZBbE96M2hwMG0zZHJlMzN4aXNrd1VraDl4?=
 =?utf-8?B?NnpGM3FrdmRTNUNISHlEOHBJMGZPUUFGM3NJdmVCYnhQbEUvUGN5MERUNjVO?=
 =?utf-8?B?RGlxVmgyQXpkWmtyWXRycWFHbTQyWTNOazNCMHVaeWIyL3U4clZpUWZ2ZXBh?=
 =?utf-8?B?NDVFa3ZHdnhvaEhyTnQwcGgvYUZJVm5WdE1vSGx5eFVjRXdhd0ZuZzlkMGR1?=
 =?utf-8?B?NjVGcG5GSEtzNk9HZk5UTnRad2xuVkx3Zk1OQ3ZVSHZyWWd6aUhGZFk3ZHFU?=
 =?utf-8?B?WmdUQ1NEZEtueFdoTUdyQmdIZTQvdzk5dEt5ZW0waU52VWJ1dFNPcFpQQUpq?=
 =?utf-8?B?QVg2ZVNvc3N2TmR5eTZOVHFNTCtzTkorNEFYWkNIaldiL2JDUjkzcjl5VHdr?=
 =?utf-8?B?RW52ZEFQZ1NySVRsZWI1OGYyay8weE1rZG43cGFFVklaTnlkTUJVODBNa0xY?=
 =?utf-8?B?b0xHRzdML1JCUEVGcjQ5VTFZQTF6VHNmbHA0QVZsUGYybGdjQU9wR2NIRnlQ?=
 =?utf-8?B?blpuKzc1Q3drWm92UnlUQ0VkT1dPVHozREFZUXRYVURVL0RxZ0YwMU9pTHNE?=
 =?utf-8?B?UXZUbGtPT3dpRjJONm50Y2FaYTd1U3JkZENHKzlDbFB4WFJmb3ZRQ1Q2ck9a?=
 =?utf-8?B?VW41OHc0ekFHSVh6N3BDSFIwZ2l3SXZqUTAvMGJYTFZZbFp5UUJkdm9WalE5?=
 =?utf-8?B?djl4MjN6UVNDSWhJamFhTksxQ3VqQVpQS0l1bW82Mzh5VEhzRXpnK2wwMDdq?=
 =?utf-8?B?ZFJQQTFlWXhjRDF5eXFOV3FoRVoxV0IyQXJubjlnYlZBUENpQ1ptSzA0TS9l?=
 =?utf-8?B?K0pEdm90TFBJVHZyd3dzdHY0ZURtd0F0UktzWjBjSWpRTjI5aXA1aUd5Ri9K?=
 =?utf-8?B?MHFYUGd6VVdzdjRscXdraHZtMnd4Q0JMMjZqcm9oaGNBSHlPaW5BOXh3bXF5?=
 =?utf-8?B?cUpxeURYWXhiWUtXR0Q0NHBWRElKNzViZ0xJVTg4Q1B4WnhrYy9vamxEWmVh?=
 =?utf-8?B?VWZ3YkRqcllrTjlBelgxVnBPTXdrV095cXNjOHZ6WDlWc0wrSlpWb1ZXVlgz?=
 =?utf-8?B?eUtFeFFiUlFSTURza0d6VS9LTklwWjFkaXBLcCtmUVZCaHhWYyt6enVqR0Ns?=
 =?utf-8?B?OVFLNC9lV3VPLzVNVXB2RHk0bjYxZkZxZ25QL0JodjQzb3dPSHBSQXpub2hj?=
 =?utf-8?B?djc5UlV5aDFYQUF4OS9QbWZXK1ZscndXWmVBZGZQMERobVJUUk44U2ZmV0pq?=
 =?utf-8?B?ekdxV3JncHU5QmdNMS95bElCK0VYcit0M2VrVDRsZGVCR3VPQm9MZ3RsaHlH?=
 =?utf-8?B?QWZ0bHl2QUFrOGM0YkJOR2RIUGRYV1JzY3ZJdVRLbmVEZ1BVcGR1R3FuU25o?=
 =?utf-8?B?dVB0a0JoVVVTZmdjbFlLbStTbTlXNGFqUDBKN1NYMHRNeXp6US9GRnUyNXBF?=
 =?utf-8?B?YW9VM0tYU2J1ZE10MklyUGtjYXJUWXk3aThWY3lyZW5XYzBHa2ovRmpoN1Jj?=
 =?utf-8?B?UDZFdVgvV1JmaU5WcHpKdUQ3bC9qamJaOXpwVGEwSm5qdG5jNUd1S0x4a1Rq?=
 =?utf-8?B?dXlBWjhyakNFbWJIeW1CMDRHQ2xsY2U0QTNLNVluWStwWkZBczNOeTBnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1d4ejE0cFZnZmw1TEl1K0M1NkRXbmpNek1LQjB5VzArRnhhYitIZGNod2dr?=
 =?utf-8?B?bUtUenQyQjVtRFhEMzZoQlBRK3RRYjdvNnI5dTJubll4R3Zlbjl2UFJtbGhL?=
 =?utf-8?B?Q0l3SHNyVE4zUzNTZFJvVDdCUFhmVGJsWEc1MTV1bjVwdS82RURrN080MHNu?=
 =?utf-8?B?aGVwTHh1TEJiQVlxQllZYThqUTRTeGdFcFp6Sk16a3c5V2VrY2hTSWd4eU1I?=
 =?utf-8?B?ci9iN3I1dUlodnhUYzZFR0JmRkhvc0wxKzcydXBoQUYxcFFweGxCV2hCTGRF?=
 =?utf-8?B?dkxyQktjaGVMMi9GamloeDM0TkFVQ0F2aktxWW5HUHVUTmdLK1ZvbHNWdUpM?=
 =?utf-8?B?Z00yTzAyeVZaNkkxQjUzVVpIemJheURVa1RuV0FpMGNVMDRnYUJ2U3lNdGZI?=
 =?utf-8?B?dGhSMjZzaW1BOExXazRscVgvc2xDajI1dWNzQ0pTTFQ5NFpCZUVYSzl1UUJs?=
 =?utf-8?B?d0lDbk9KZWRHWk5GZ1o1MmZhaEw0eFZBK1hYdjlmWU41UmJtNm1aaElJTHZ5?=
 =?utf-8?B?c0d1OHJ1NHh4akdRd0c1R0kvaXdzOGtyZkNaeVhUVXpiNVIxRFdmd3hIZWhk?=
 =?utf-8?B?SWZwYzN6YWZuSGRPUnczVTVLWlZKYXZJSmhBbjUzb2E2QWY0cXpFRnFXd2py?=
 =?utf-8?B?UlN2cGtTMzlORDlDN1JLTGkxUC9LSlYvdUJtL2FmNGh5b2ZLeFRWQzZWZXZ3?=
 =?utf-8?B?a3RRb09RYnJaY1hDOW82NjVxeUtBVG5wbkYyWDBXcmJHL0NKYmZwR2hPaGlT?=
 =?utf-8?B?T0o1c2NGTlNVTWVsMXRTOHU1WlQyN3hFRURlWjMwS3VsRlpBTHBUWUI5RG4w?=
 =?utf-8?B?a3FlV0xkdFNhVW0zVzNnVHNUNVRkOUxpVHY5Y2xRNGdIY3I2Um5qLzd1dUlL?=
 =?utf-8?B?enFlUXRGWFgwTm4ya2FRSHJtWFppb3FxV0FTRHNLSWY5bGpIMWdsRVNLZkhO?=
 =?utf-8?B?VDNMdlRaSkdEK3d4R0RNRkdzdlp5TEx6TzZRN3YyRzZRc0x1ZVljSjNMVWUy?=
 =?utf-8?B?WnpiekM3Y3lTbWxQaDRRbU5zSUorTGFEMFBodDdZOHoyVHFZU0ZXRmdMbitM?=
 =?utf-8?B?WXp1WjV4RHFOMmYyaEwwRWNpWWxNZStxdnRRdmc1cmZab1FxMFJ3Z2NvWGpi?=
 =?utf-8?B?eldweXlSV3lleVdCb1daYTdOb0VKVk5ZeksyQXJ2K0pHU3k1eWFWWVlpVXpH?=
 =?utf-8?B?WnZrOFd1UDJETFk0N3FseENPRDNLcjg5clpBT29teENhcVFaQmVDS094L2Z4?=
 =?utf-8?B?c1NRY1JCdzVaRUhWbkt0cktOZmoxNkZtendKRmU4QkN1cmszZVV1V3VZTTBz?=
 =?utf-8?B?ampiY2cvck5BUWpyell4aEgrajNwY3ZWWE1xRDV1bDJMa1k4THhkTTF6ajNN?=
 =?utf-8?B?RmFIT29iTGJDaUYwQWhPRG1XQi9tT0ZxWk9PZEpGN2YrRHA0UUNpYW43Mzly?=
 =?utf-8?B?MmUyZmR4Um5zT2JjSy82U2dDRFBlM2d2c2V4YXA0RW9BS3NZZ0tpaDV3UG5a?=
 =?utf-8?B?S0dkZmNMQnlCbVhYMXlPYWhpRUgvY2cxYkhKSUdxUlVKSFNhYTZDSDJHdHlm?=
 =?utf-8?B?M1BPZWNCeDBrZTlubTB3V1g2RUVKWXFGUGpseUxLUlpmSmpRQjNmcnJpZnZR?=
 =?utf-8?B?ejV6Nm9UMDVtZG9EdXFKNDBvYXd4QjV6ZVk0V0R6NE1hM1V4Y3pEY0VSQlpL?=
 =?utf-8?B?d3hHR01ZZlBNMCtYcW9USGNkckxxWU02MEpEMjAxNmpWWU50anRNcmZubjNx?=
 =?utf-8?B?bEdmaFUxMlArb1M5MjdTZVphRmh3MHRWNmpaZEVnYU9NNE1JTzhtTVNKR3Ez?=
 =?utf-8?B?TEs2R0JaNU9PT1VoL0dJWUkvakJSd3BmSExuT1ZTS1ZPWjA4SHVsMWZSaTgr?=
 =?utf-8?B?K2dnYUNBQndFUEdHUzZWdithV1BXQ2h0eHpqU0l4djNWMTRkbkwrWTFzc0N0?=
 =?utf-8?B?K1ltemNzOUZyUXBmOW9iR3VVWWZCKy80WEJUb2pxOTVjdmdNT1lJYUIyMTQv?=
 =?utf-8?B?SHVjSTkvTFo1STdpc3Zpa0psTHRaQkdoc1NMQy9pUzlHREVYd2dxNFo0ZVZ4?=
 =?utf-8?B?MlFmZ0RCN0hFci9OaXlSYWZCRlZKUzFSdnJpdjU4QmdvQ2J6ZlBLNzJxMlBO?=
 =?utf-8?Q?NYrqZoJIeuTwXYrLiMMAAFcFo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb362d9-88a7-4fc8-a265-08dce8605924
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 12:46:09.2736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8kxL6BIc8znSsP84yWIamIFGOKc9LOToVNW+74Z1pMn2HPZ+Ajvc42PH+I9vSTSc3WN+L6ARq4hthu4meODSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5189
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



On 08-10-2024 12:40, Himal Prasad Ghimiray wrote:
> xe_force_wake_get() now returns the reference count-incremented domain
> mask. If it fails for individual domains, the return value will always
> be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
> in the event of failure. Use helper xe_force_wake_ref_has_domain to verify
> all domains are initialized or not. Update the return handling of
> xe_force_wake_get() to reflect this behavior, and ensure that the return
> value is passed as input to xe_force_wake_put().
> 
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
> - xe_force_wake_put() error doesn't need to be checked. It internally
> WARNS on domain ack failure.
> 
> v4
> - Rebase fix
> 
> v5
> - return unsigned int for xe_force_wake_get()
> - remove redundant XE_WARN_ON()
> 
> v6
> - use helper for checking all initialized domains are awake or not.
> 
> v7
> - Fix commit message
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c | 105 ++++++++++++++++++++-----------------
>   1 file changed, 58 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 2d5e78311b76..409f1ab6ea37 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -97,14 +97,14 @@ void xe_gt_sanitize(struct xe_gt *gt)
>   
>   static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
>   {
> +	unsigned int fw_ref;
>   	u32 reg;
> -	int err;
>   
>   	if (!XE_WA(gt, 16023588340))
>   		return;
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (WARN_ON(err))
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
>   		return;
>   
>   	if (!xe_gt_is_media_type(gt)) {
> @@ -115,13 +115,13 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
>   	}
>   
>   	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0x3);
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   
>   static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
>   {
> +	unsigned int fw_ref;
>   	u32 reg;
> -	int err;
>   
>   	if (!XE_WA(gt, 16023588340))
>   		return;
> @@ -129,15 +129,15 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
>   	if (xe_gt_is_media_type(gt))
>   		return;
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (WARN_ON(err))
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (WARN_ON(!fw_ref))

Is seems you forgot to remove this WARN_ON.

Regards,
Badal

>   		return;
>   
>   	reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
>   	reg &= ~CG_DIS_CNTLBUS;
>   	xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
>   
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   
>   /**
> @@ -403,11 +403,14 @@ static void dump_pat_on_error(struct xe_gt *gt)
>   
>   static int gt_fw_domain_init(struct xe_gt *gt)
>   {
> +	unsigned int fw_ref;
>   	int err, i;
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref) {
> +		err = -ETIMEDOUT;
>   		goto err_hw_fence_irq;
> +	}
>   
>   	if (!xe_gt_is_media_type(gt)) {
>   		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
> @@ -442,14 +445,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>   	 */
>   	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -	XE_WARN_ON(err);
> -
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	return 0;
>   
>   err_force_wake:
>   	dump_pat_on_error(gt);
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   err_hw_fence_irq:
>   	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
>   		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
> @@ -459,11 +460,14 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>   
>   static int all_fw_domain_init(struct xe_gt *gt)
>   {
> +	unsigned int fw_ref;
>   	int err, i;
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (err)
> -		goto err_hw_fence_irq;
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> +		err = -ETIMEDOUT;
> +		goto err_force_wake;
> +	}
>   
>   	xe_gt_mcr_set_implicit_defaults(gt);
>   	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
> @@ -527,14 +531,12 @@ static int all_fw_domain_init(struct xe_gt *gt)
>   	if (IS_SRIOV_PF(gt_to_xe(gt)))
>   		xe_gt_sriov_pf_init_hw(gt);
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	XE_WARN_ON(err);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   
>   	return 0;
>   
>   err_force_wake:
> -	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -err_hw_fence_irq:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
>   		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
>   
> @@ -547,11 +549,12 @@ static int all_fw_domain_init(struct xe_gt *gt)
>    */
>   int xe_gt_init_hwconfig(struct xe_gt *gt)
>   {
> +	unsigned int fw_ref;
>   	int err;
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> -		goto out;
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
> +		return -ETIMEDOUT;
>   
>   	xe_gt_mcr_init_early(gt);
>   	xe_pat_init(gt);
> @@ -569,8 +572,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>   	xe_gt_enable_host_l2_vram(gt);
>   
>   out_fw:
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -out:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	return err;
>   }
>   
> @@ -765,6 +767,7 @@ static int do_gt_restart(struct xe_gt *gt)
>   
>   static int gt_reset(struct xe_gt *gt)
>   {
> +	unsigned int fw_ref;
>   	int err;
>   
>   	if (xe_device_wedged(gt_to_xe(gt)))
> @@ -785,9 +788,11 @@ static int gt_reset(struct xe_gt *gt)
>   
>   	xe_gt_sanitize(gt);
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (err)
> -		goto err_msg;
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> +		err = -ETIMEDOUT;
> +		goto err_out;
> +	}
>   
>   	xe_uc_gucrc_disable(&gt->uc);
>   	xe_uc_stop_prepare(&gt->uc);
> @@ -805,8 +810,7 @@ static int gt_reset(struct xe_gt *gt)
>   	if (err)
>   		goto err_out;
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	XE_WARN_ON(err);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_pm_runtime_put(gt_to_xe(gt));
>   
>   	xe_gt_info(gt, "reset done\n");
> @@ -814,8 +818,7 @@ static int gt_reset(struct xe_gt *gt)
>   	return 0;
>   
>   err_out:
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> -err_msg:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	XE_WARN_ON(xe_uc_start(&gt->uc));
>   err_fail:
>   	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
> @@ -847,22 +850,25 @@ void xe_gt_reset_async(struct xe_gt *gt)
>   
>   void xe_gt_suspend_prepare(struct xe_gt *gt)
>   {
> -	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	unsigned int fw_ref;
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   
>   	xe_uc_stop_prepare(&gt->uc);
>   
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   
>   int xe_gt_suspend(struct xe_gt *gt)
>   {
> +	unsigned int fw_ref;
>   	int err;
>   
>   	xe_gt_dbg(gt, "suspending\n");
>   	xe_gt_sanitize(gt);
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (err)
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>   		goto err_msg;
>   
>   	err = xe_uc_suspend(&gt->uc);
> @@ -873,14 +879,15 @@ int xe_gt_suspend(struct xe_gt *gt)
>   
>   	xe_gt_disable_host_l2_vram(gt);
>   
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_gt_dbg(gt, "suspended\n");
>   
>   	return 0;
>   
> -err_force_wake:
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>   err_msg:
> +	err = -ETIMEDOUT;
> +err_force_wake:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
>   
>   	return err;
> @@ -888,9 +895,11 @@ int xe_gt_suspend(struct xe_gt *gt)
>   
>   void xe_gt_shutdown(struct xe_gt *gt)
>   {
> -	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	unsigned int fw_ref;
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	do_gt_reset(gt);
> -	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   
>   /**
> @@ -915,11 +924,12 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
>   
>   int xe_gt_resume(struct xe_gt *gt)
>   {
> +	unsigned int fw_ref;
>   	int err;
>   
>   	xe_gt_dbg(gt, "resuming\n");
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (err)
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>   		goto err_msg;
>   
>   	err = do_gt_restart(gt);
> @@ -928,14 +938,15 @@ int xe_gt_resume(struct xe_gt *gt)
>   
>   	xe_gt_idle_enable_pg(gt);
>   
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_gt_dbg(gt, "resumed\n");
>   
>   	return 0;
>   
> -err_force_wake:
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>   err_msg:
> +	err = -ETIMEDOUT;
> +err_force_wake:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
>   
>   	return err;

