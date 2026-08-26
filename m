Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990B5C5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 09:39:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F94110E29B;
	Wed, 26 Aug 2026 09:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GeiW4Csf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055F910E28B
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 09:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787737178; x=1819273178;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KQ+GdCTgpOKDYXjlV3b3yQCYgCbXJjzDkzLiwUk67HA=;
 b=GeiW4CsfByfdlNWTnYvzfI0JePBlrPkuxln1OqGvG76PdZcFw+Y+Jkgd
 FcL1o3t0vI9nvDJ2dcx+4cFD38oxPEC1hMV25BWjI7E8f7qGZcE+VuyFe
 rJMXVxF9NmN6nogWc9RIbeSF06ypOuDVB61DC/r7EhJ4e0e3oyQoigGtT
 GszXSEKpq/9gxiEmptwAjqW9Flt3+hrUl/nFsfkzdAhx6Hj0dNs/OlBSx
 IyR0JB0tgqi9YFgoI7cLuxmu5oKlBxnYjcnqJvpw5z+7wWtfqJe5XDs5M
 O4BT4/FD8KtYnEIcnZlZaU4mS1l+NMi4TIbKvi/AhO9hmAvDeceESixOK Q==;
X-CSE-ConnectionGUID: 6f5pLaMMTKef8heTxTsmSg==
X-CSE-MsgGUID: JSJPMNt3Q5mijanoZ6isNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="105739459"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="105739459"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 02:39:37 -0700
X-CSE-ConnectionGUID: VobAxE2+Qw6OCj4lRqaYEA==
X-CSE-MsgGUID: lmaH+vk0RAONaR8nRyynhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="264265252"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 02:39:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 02:39:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 02:39:37 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 02:39:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hknMd/Zgn1uyFcnCdLqUQxnkg8UhwYdxKpJwUaYirIxMT8hcSANSI+UYNjGZV+UY7oD0MHm1tIzFPJaDoDD2C/eF8FwGAGBFi9OVcRjcVUOCGEPAG5WYeOgMAFJJG5tHAo2nNHwZXXatB63g00HYPHxAHYVIb27rhSl2PbIWaKWBNmjWKzWlBSpeZWcSI0glR5GTQ7EjxXUqKeG30wv8gnzGukuTJVscMselBiHW7UCjkGYL+bChOqnDx28+8vPkfXdg1muEi8LSMvr5YPS/pcFsnGW61IsIadKKfvzSfvlCkVCSFDTG/2bXrjUgyZurCVnr/UNGDJBVf6AwnyxjHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Inob7ztScVzCz9+UM0bPfNONDO0kPrRqGA3EN15/HtE=;
 b=lkb9lyEQ2sbamhv0EqdT0hyRUof10Hf7xRMllW0pzC7u2I65LM5QuF5eto3v4FhnkbzwzAbceV7DR0GFFYTi+DLQedG16BKAo5P9F7J4fFHsSsM/pAKZpP5q9Ga5MSD9DGVnQ0c8JmxG0+HOQik0EeVOBumwYKNm//b5ThUw1ifSSNw5MOEh7qdpPi5h9+tUO5GEuEizn7+fBZ4gsZKHX/ROMeNG4/U3JmTWwf3R6oBjyDa5xS+G44o6bWNG4muXzq7CEnON8aBCT4BTE+ORBAq8NkSj3dkTZ5ReWubEPhLjzzsJr6/t3ZQsBXjKoytBx63BS0plJoJTi7/exzm5Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB5326.namprd11.prod.outlook.com (2603:10b6:5:391::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.7; Wed, 26 Aug 2026 09:39:34 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 09:39:34 +0000
Message-ID: <fcd99d4a-b7b4-4bfd-9e78-65ff1ea2d7d7@intel.com>
Date: Wed, 26 Aug 2026 15:09:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 03/10] drm/xe/gt: Introduce FLR helpers
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <michal.winiarski@intel.com>,
 <matthew.auld@intel.com>, <dev@lankhorst.se>, <jani.nikula@intel.com>,
 <lukasz.laguna@intel.com>, <lukas@wunner.de>,
 <daniele.ceraolospurio@intel.com>, <badal.nilawar@intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
 <20260821112436.545405-4-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260821112436.545405-4-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0066.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB5326:EE_
X-MS-Office365-Filtering-Correlation-Id: 6488baf3-ca3d-42f1-68e0-08df0355efdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: c78Wz/4hWS3dSrZhF0qne31maJD+xuGwn+axujoScA1vIsc1Pn22HgTAR+TGrNjFn+WqGmeB+QJG/kBiFChv8iqHsKpVjpwwOlha288jX66xJT5rbsamtFfeMFqO7vNZR3KFxfWzaTURDkba7OG1Q4A3RM8ZJTVKOd/L4QHn1m1c1JSQXWta78EwkqCjpAizbUUHvq4YGNtToO361JeyZs/AJWTS2wlJ8PxdX4bj2KhRsKdVp+j7W4ok3s14NNOXyH+VxCt9pwgBfPIAux/ohW73UZ8HLTayirClaGy62+FuIrRNng0nMunzPy+s8l3cn2OR1+Eiyh7WRZEVfrgRaRXz1CXnZ4wtwzeE1RcB1xMSwrLUDqphcBjJEjHltPFuuPX6j6zjIsHaf0RH0+5CFbEgBnKw0yvm/+9t7LepCdwOndEHavvocYvJEBSZfQbgoijluRcBydOehygi3hlIUeEgy5VWKI1q/bz2EcOkGxxZ8Vp7ik2iJskhDgCHYhwplHQxkSDNZmjTCnw7RwV4vFyXGP5xpuIs00jTFJVSSlQAYyyfq9m+Tc04wzpb2DGMrzzjNGaCXtmhSXiz1WvBGRgSFHynOSEJ5NuuzntOox9fs3wmfhjyNXQC0UEIYGTeIcbc2RZwnZUT9cr1/uvyQPqqS4b2CCJYZoabmpQFRMs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDJJNmhXOWEvbzNtSkxiQ2RQeldRYWsyZ1JQOElOTEV4YTRXUmhFMGxBTHNu?=
 =?utf-8?B?Rk5oQVN5VTd3Nno5SnltcnBEUXZGTVQrQm5xS3hTbEhYZjhqWGZibnRSVWZv?=
 =?utf-8?B?Q3p6UHIvckhCUFhJWGxDU29mamNUdWNSRXo2T1Fvb1hYbzB5TnZ5Vm0yL2RJ?=
 =?utf-8?B?YW9kZ3g4K0x3Mit4ckdqaDZpZVNsQldJeGNnQnh3dzh2WExwNVR1aDJhUG56?=
 =?utf-8?B?M1FuaWZuK2lSbko5UUllQ3pGZ0p5RE5TT1VTRWFEaHlDWEpEYVhCOEJNbmw5?=
 =?utf-8?B?YUdWNWgweTRSZzE2QTNzVEN2SmdhVjUwc0FSbG14NGxWWlRXWEpab1hLblIw?=
 =?utf-8?B?SGwwdHQyUmt4NnArOWI3elZ4YUVVa0QrUkJGTGkvUjhlaDUrRytZeUdDQlFv?=
 =?utf-8?B?Z0grY1U5SGVBZkt1OVpIUnVGS0hkKytsOUs4T0twY1VZdDN4eUd3S3UvSzE3?=
 =?utf-8?B?aW9yR055d3ZIcEVlSVRONm0vb0FSdjFrSHJwU3pIZkFNUTJFaUhoMklOQm5P?=
 =?utf-8?B?dmtONTFnTkwrVVc2ZTZiRFlQbnZPU0tBb3hsUmlUSUl1L3NlbVFqQ0NZQWFR?=
 =?utf-8?B?aXJjWE5GdHRFbjYvUjJ1clhFMWEzSFBGY2dFbUxjMDdBZE9qRzNISkl6dGRO?=
 =?utf-8?B?MkVLNDQzY0ljSGdXZW5XQUNFVWRhemlvZm5SOEo5eEZ0dWZ3eFpPMzVQZUl3?=
 =?utf-8?B?dXcrWm94YWROWTUwUDU0ak9TNitHWkpLMGpiajdzd1Y3TVJ6aVFOeGFSNCts?=
 =?utf-8?B?S254SWNEekZ6WGQwbSt5VlZYa1g2N2lHOHNUMGJkMW9kdlErV0M0V3B0N0dI?=
 =?utf-8?B?NlpIWEp6blR5M3RYSnNyR09hc2g1R0xjbXNEczlIVWxNc0FSTjMwaHltUy9G?=
 =?utf-8?B?eUtEUXI5RWJ4UUNKbTFWcHhhMWtuVXE3NHlGVEZTRGFQQnBuUU1HSmxFU1Fr?=
 =?utf-8?B?d3p4V2lSY1ZPK2VSaEo5S25EODJldG9KU2hXc1JjSVJSWlo0SE51aHluWkcw?=
 =?utf-8?B?bTBBc21mcHo1akhsWERkZEcrb2o0dVBHU3FNWjdORGJrL2ZocG4wM0VYOE4z?=
 =?utf-8?B?WXFQYzl0a3Q0N1hmMjVjREFucFdndzFVRlRSTWlwaDdIM3RFRnhOUXoxSWxT?=
 =?utf-8?B?ZGQ0THd6RCtuWWwwYUJqVG5rMC9EMG9QZXBDZUpwU2hBYmlLZW91cU83Yk9s?=
 =?utf-8?B?Z2UzZUJpUGY4c1lmMHZLRUp3K3crRWxiNzhKSDlQZkxBOVd3RldoYTVkR2tU?=
 =?utf-8?B?Y0hDZ2hJZ21qbnZ2bmtDVWtsYkZuc3RBZEhEUWtFV24zV1N5c25zRURxcmNv?=
 =?utf-8?B?Q0ppWm5POFg3cDhYVENSOWdFQTNNNzlHbjR4bFk3MnFZc25JZFJBTS91d3ZW?=
 =?utf-8?B?R0hBdkJUeVlaVDUzR0h4aEk4eUFhMkVJVWkxN2FWeVdhRDhBSWphcHJtT2Vw?=
 =?utf-8?B?ZGorSkxFWGRyclFOaVBEaGZoZ3lFY1N4RFBoWW56QVBJcng2ZGE5cTdNMU9O?=
 =?utf-8?B?QlZWTVAreGVBak13NE1URTkzUFdRZm12aElPUzBPWUZ5UFNIZjNMV0c2cDZV?=
 =?utf-8?B?N1R1cHRzNDR3aTR5OGxyRHU5ZGo4ZS9VMkJrUTRhVnE2U2U0ZHNxVW4zVFUr?=
 =?utf-8?B?ck5wOUJBYnNRc1lON2RVNEFNa08yZnArSUY3bmtYMjNDaU9GSlNuWmU3Um02?=
 =?utf-8?B?cTMzZDF0Q3l0L2cxU3o1TDRFWlEvQW9HQlppRlZqVG4zeTNJcDN4UldxVmxx?=
 =?utf-8?B?aFNocU1wdTdobWQyaHJ4RjBlOXg1dEFleUN0WXlUK09MZE55aHh3SjFVdnps?=
 =?utf-8?B?NmJoRThEMGp5cGkvNFdJcFFrdG1rbXpSWlZwYmdURk9HZm9UanJVTnVoa3lL?=
 =?utf-8?B?OW8zZXhvRUFtc1lXUnppSTc5NG8rcGU1azg3SVlQemVOZWgzLzJFVnFkdERI?=
 =?utf-8?B?T1VWWmk0UGlaRTRsQ0xORm9sUkw0NTc2cUhPRExiL2R6MGVNRzBLc0x2VXB4?=
 =?utf-8?B?NG80cFRaQWhyNXc3OW5lSFBuVlQyVy85b0NUaXVSY3pZb2NZTXhZWkFRUFZP?=
 =?utf-8?B?K05meTRaRjNIcTY0bytNV1gyY0hVQk93Z0xWQktvN1h4dEFZQUNwOU9lRkVp?=
 =?utf-8?B?Mk01bUFZWHYxL1JzM2g5RVJhd0FVZ2JnZk1OTVdqSlBYcTd1THkxclhDVDhM?=
 =?utf-8?B?NTRzUjJFajc5cFpDZnpCVkZ0SVhDRG1TSHY4VUx5bldrM09YSWw4dWlXeHZh?=
 =?utf-8?B?a3RBZ2RjZSsvYzFLY1F1dE1nSkhQL1J5LzZ6cDMyZTFyMHhKRVpnamFxMGQz?=
 =?utf-8?B?NFo5VDcxRHVJQ25YNzZRdk00UnNaY3QrTlVyMnpadzU5MWVvRlZQUT09?=
X-Exchange-RoutingPolicyChecked: 05iIfyREQ0OQnBcrzKB1fyKaS2mc6/0p7bb7DX2lgIL2Vyks7NMV9pRKO0WMv5MHWfa2WkluKHwzmrE/P6GYdgalXwseoGguxn86MfMqkwyWbK2H2qef/r2hBRQNuVGwE/Y9SnMXmtVvA69nYTUc5uZVGB9Dm9feOH9shmU7MXJflcPoSLPQ8n1X4JVmgnGf6avgL4eJsffuXjG3InmF5QsTupWpPLAlRxR+kRkDpz7J2GD8A1zvjyp91ut2tRgazrFwmlZQyGL51ecdeQSCmov/YcBYjZt7uBZfwoi4W9xJDFE6YdTWZLNyF+bcmu39UiGBuLfcRS/9sjSAnfimiQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6488baf3-ca3d-42f1-68e0-08df0355efdf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 09:39:34.3942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pak5QRpNa3RhV2YajLeDItlahZ/LTwkjZXnvIRNtW1+satgrR2cgtqEdfQSfXJe+i0zGgoc6QadeN8buhyoznA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5326
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


On 21-08-2026 16:53, Raag Jadav wrote:
> In preparation of usecases which require preparing/re-initializing GT and
> all its uCs before/after PCIe FLR, introduce flr_prepare/reinit() helpers.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
> v2: Add kernel doc (Matthew Brost)
> v4: Teardown exec queues instead of mangling scheduler pending list (Matthew Brost)
> v6: Add IS_DGFX() assert (Daniele)
>      s/flr_done/reinit (Daniele)
> ---
>   drivers/gpu/drm/xe/xe_gsc.c      | 14 ++++++
>   drivers/gpu/drm/xe/xe_gsc.h      |  1 +
>   drivers/gpu/drm/xe/xe_gt.c       | 23 ++++++++++
>   drivers/gpu/drm/xe/xe_gt.h       |  2 +
>   drivers/gpu/drm/xe/xe_guc.c      | 29 +++++++++++++
>   drivers/gpu/drm/xe/xe_guc.h      |  2 +
>   drivers/gpu/drm/xe/xe_huc.c      | 14 ++++++
>   drivers/gpu/drm/xe/xe_huc.h      |  1 +
>   drivers/gpu/drm/xe/xe_uc.c       | 73 ++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_uc.h       |  2 +
>   drivers/gpu/drm/xe/xe_uc_types.h | 14 ++++++
>   11 files changed, 175 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 524ac56bdcc7..475e44455c9e 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -548,6 +548,20 @@ void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc)
>   		flush_work(&gsc->work);
>   }
>   
> +/**
> + * xe_gsc_reinit() - Re-initialize GSC after FLR
> + * @gsc: The GSC object
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_gsc_reinit(struct xe_gsc *gsc)
> +{
> +	if (!xe_uc_fw_is_loadable(&gsc->fw))
> +		return 0;
> +
> +	return xe_uc_fw_reinit(&gsc->fw);
> +}
> +
>   void xe_gsc_stop_prepare(struct xe_gsc *gsc)
>   {
>   	struct xe_gt *gt = gsc_to_gt(gsc);
> diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
> index b8b8e0810ad9..ce390bffb163 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.h
> +++ b/drivers/gpu/drm/xe/xe_gsc.h
> @@ -15,6 +15,7 @@ struct xe_hw_engine;
>   
>   int xe_gsc_init(struct xe_gsc *gsc);
>   int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc);
> +int xe_gsc_reinit(struct xe_gsc *gsc);
>   void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc);
>   void xe_gsc_stop_prepare(struct xe_gsc *gsc);
>   void xe_gsc_load_start(struct xe_gsc *gsc);
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 6805e0d3bf21..d4fac8c4d8a4 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -910,6 +910,29 @@ static int do_gt_restart(struct xe_gt *gt)
>   	return 0;
>   }
>   
> +/**
> + * xe_gt_flr_prepare() - Prepare GT for FLR
> + * @gt: the GT object
> + *
> + * Prepare all GT uCs for FLR.
> + */
> +void xe_gt_flr_prepare(struct xe_gt *gt)
> +{
> +	xe_gt_sanitize(gt);
> +	xe_uc_flr_prepare(&gt->uc);
> +}
> +
> +/**
> + * xe_gt_reinit() - Re-initialize GT after FLR
> + * @gt: the GT object
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_gt_reinit(struct xe_gt *gt)
> +{
> +	return xe_uc_reinit(&gt->uc);
> +}
> +
>   static void gt_reset_worker(struct work_struct *w)
>   {
>   	struct xe_gt *gt = container_of(w, typeof(*gt), reset.worker);
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 65a4655b0994..1e56355318c9 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -37,8 +37,10 @@
>   })
>   
>   struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
> +void xe_gt_flr_prepare(struct xe_gt *gt);
>   int xe_gt_init_early(struct xe_gt *gt);
>   int xe_gt_init(struct xe_gt *gt);
> +int xe_gt_reinit(struct xe_gt *gt);
>   void xe_gt_mmio_init(struct xe_gt *gt);
>   void xe_gt_declare_wedged(struct xe_gt *gt);
>   int xe_gt_record_default_lrcs(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index c7f8bbd4cb92..ffe7f0847e76 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1709,6 +1709,35 @@ void xe_guc_sanitize(struct xe_guc *guc)
>   	xe_guc_submit_disable(guc);
>   }
>   
> +/**
> + * xe_guc_flr_prepare() - Prepare GuC for FLR
> + * @guc: The GuC object
> + *
> + * Stop GuC submission and tear down exec queues.
> + */
> +void xe_guc_flr_prepare(struct xe_guc *guc)
> +{
> +	if (!xe_uc_fw_is_loadable(&guc->fw))
> +		return;
> +
> +	xe_guc_submit_stop(guc);
> +	xe_guc_submit_pause_abort(guc);
> +}
> +
> +/**
> + * xe_guc_reinit() - Re-initialize GuC after FLR
> + * @guc: The GuC object
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_guc_reinit(struct xe_guc *guc)
> +{
> +	if (!xe_uc_fw_is_loadable(&guc->fw))
> +		return 0;
> +
> +	return xe_uc_fw_reinit(&guc->fw);
> +}
> +
>   int xe_guc_reset_prepare(struct xe_guc *guc)
>   {
>   	return xe_guc_submit_reset_prepare(guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 61e3ee19a59b..e0226cc28046 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -32,10 +32,12 @@
>   struct drm_printer;
>   
>   void xe_guc_comm_init_early(struct xe_guc *guc);
> +void xe_guc_flr_prepare(struct xe_guc *guc);
>   int xe_guc_init_noalloc(struct xe_guc *guc);
>   int xe_guc_init(struct xe_guc *guc);
>   int xe_guc_init_post_hwconfig(struct xe_guc *guc);
>   int xe_guc_post_load_init(struct xe_guc *guc);
> +int xe_guc_reinit(struct xe_guc *guc);
>   int xe_guc_reset(struct xe_guc *guc);
>   int xe_guc_upload(struct xe_guc *guc);
>   int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> index 57afe21444b1..c73e1acbd091 100644
> --- a/drivers/gpu/drm/xe/xe_huc.c
> +++ b/drivers/gpu/drm/xe/xe_huc.c
> @@ -296,6 +296,20 @@ void xe_huc_sanitize(struct xe_huc *huc)
>   	xe_uc_fw_sanitize(&huc->fw);
>   }
>   
> +/**
> + * xe_huc_reinit() - Re-initialize HuC after FLR
> + * @huc: The HuC object
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_huc_reinit(struct xe_huc *huc)
> +{
> +	if (!xe_uc_fw_is_loadable(&huc->fw))
> +		return 0;
> +
> +	return xe_uc_fw_reinit(&huc->fw);
> +}
> +
>   void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
>   {
>   	struct xe_gt *gt = huc_to_gt(huc);
> diff --git a/drivers/gpu/drm/xe/xe_huc.h b/drivers/gpu/drm/xe/xe_huc.h
> index fa1c45e70443..cb1a770b4a9c 100644
> --- a/drivers/gpu/drm/xe/xe_huc.h
> +++ b/drivers/gpu/drm/xe/xe_huc.h
> @@ -19,6 +19,7 @@ enum xe_huc_auth_types {
>   
>   int xe_huc_init(struct xe_huc *huc);
>   int xe_huc_init_post_hwconfig(struct xe_huc *huc);
> +int xe_huc_reinit(struct xe_huc *huc);
>   int xe_huc_upload(struct xe_huc *huc);
>   int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type);
>   bool xe_huc_is_authenticated(struct xe_huc *huc, enum xe_huc_auth_types type);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 65f59f06177f..4b9b5ea4fb08 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -18,6 +18,7 @@
>   #include "xe_guc_submit.h"
>   #include "xe_huc.h"
>   #include "xe_sriov.h"
> +#include "xe_uc_fw.h"
>   #include "xe_wopcm.h"
>   
>   static struct xe_gt *
> @@ -278,6 +279,78 @@ static void uc_reset_wait(struct xe_uc *uc)
>   		goto again;
>   }
>   
> +static void uc_flr_prepare(struct work_struct *w)
> +{
> +	struct xe_uc_flr *flr = container_of(w, struct xe_uc_flr, work);
> +	struct xe_uc *uc = flr->uc;
> +
> +	xe_gt_assert(uc_to_gt(uc), xe_device_wedged(uc_to_xe(uc)));
> +
> +	xe_uc_reset_prepare(uc);
> +	xe_guc_flr_prepare(&uc->guc);
> +}
> +
> +static void uc_flr_sanitize(struct work_struct *w)
> +{
> +	struct xe_uc_flr *flr = container_of(w, struct xe_uc_flr, work);
> +	struct xe_uc *uc = flr->uc;
> +
> +	/* TODO: Sanitize GSC firmware */
> +	xe_gt_assert(uc_to_gt(uc), IS_DGFX(uc_to_xe(uc)));
> +	xe_gt_assert(uc_to_gt(uc), !xe_uc_fw_is_loadable(&uc->gsc.fw));
> +
> +	xe_uc_stop(uc);

Apologies in advance if this question is basic or wrong,

I was checking the suspend path and i see uc_stop being called before 
submit_stop.
Any reason why this is not done here?

What if an execqueue is already in the process of getting destroyed and 
is waiting on g2h.
Shouldn't we stop ct before the stopping and killing exec queues?

Thanks
Riana

> +	xe_uc_sanitize(uc);
> +}
> +
> +/**
> + * xe_uc_flr_prepare() - Prepare uCs for FLR
> + * @uc: The uC object
> + *
> + * Tear down pending work and stop all uCs.
> + */
> +void xe_uc_flr_prepare(struct xe_uc *uc)
> +{
> +	struct xe_uc_flr flr = { .uc = uc };
> +	struct xe_gt *gt = uc_to_gt(uc);
> +
> +	/*
> +	 * We'll be tearing down exec queues which signals all fences and frees the
> +	 * jobs but all of that happens asynchronously, so make sure we don't disrupt
> +	 * the scheduler while jobs are still in-flight.
> +	 */
> +	INIT_WORK_ONSTACK(&flr.work, uc_flr_prepare);
> +	queue_work(gt->ordered_wq, &flr.work);
> +	flush_work(&flr.work);
> +	destroy_work_on_stack(&flr.work);
> +
> +	INIT_WORK_ONSTACK(&flr.work, uc_flr_sanitize);
> +	queue_work(gt->ordered_wq, &flr.work);
> +	flush_work(&flr.work);
> +	destroy_work_on_stack(&flr.work);
> +}
> +
> +/**
> + * xe_uc_reinit() - Re-initialize uCs after FLR
> + * @uc: The uC object
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_uc_reinit(struct xe_uc *uc)
> +{
> +	int ret;
> +
> +	ret = xe_guc_reinit(&uc->guc);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_huc_reinit(&uc->huc);
> +	if (ret)
> +		return ret;
> +
> +	return xe_gsc_reinit(&uc->gsc);
> +}
> +
>   void xe_uc_suspend_prepare(struct xe_uc *uc)
>   {
>   	xe_gsc_wait_for_worker_completion(&uc->gsc);
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 255a54a8f876..e06f7937111f 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -8,10 +8,12 @@
>   
>   struct xe_uc;
>   
> +void xe_uc_flr_prepare(struct xe_uc *uc);
>   int xe_uc_init_noalloc(struct xe_uc *uc);
>   int xe_uc_init(struct xe_uc *uc);
>   int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>   int xe_uc_load_hw(struct xe_uc *uc);
> +int xe_uc_reinit(struct xe_uc *uc);
>   int xe_uc_reset_prepare(struct xe_uc *uc);
>   void xe_uc_runtime_resume(struct xe_uc *uc);
>   void xe_uc_runtime_suspend(struct xe_uc *uc);
> diff --git a/drivers/gpu/drm/xe/xe_uc_types.h b/drivers/gpu/drm/xe/xe_uc_types.h
> index 1708379dc834..2b47382f7b3b 100644
> --- a/drivers/gpu/drm/xe/xe_uc_types.h
> +++ b/drivers/gpu/drm/xe/xe_uc_types.h
> @@ -25,4 +25,18 @@ struct xe_uc {
>   	struct xe_wopcm wopcm;
>   };
>   
> +/**
> + * struct xe_uc_flr - uC FLR teardown
> + */
> +struct xe_uc_flr {
> +	/** @uc: uC to schedule FLR worker on */
> +	struct xe_uc *uc;
> +
> +	/**
> +	 * @work: worker for FLR teardown to be done async allowing to safely
> +	 * flush all code paths
> +	 */
> +	struct work_struct work;
> +};
> +
>   #endif
