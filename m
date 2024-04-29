Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA1BC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 21:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50FC10E392;
	Mon, 29 Apr 2024 21:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LaPiUFzD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8317410E392
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 21:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714425461; x=1745961461;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TuF2JT6QtFwl+7Hmy0ST/NESqUdkTQuiFZIK4tvT+bI=;
 b=LaPiUFzD195WEV24mywfvOZhDZhykkXCzgIvQmddLmFy/TiwewTU97I/
 vGsJgwu0GupzGyqYObYMGbsOmYpAoYB7BvKrUPb7Xstrzhyw9TB3WQy70
 V2UOJTHZLA1/AYqvqXWQ12z6f6/rskE0U7xch6Y9DH1Km5yCbAy2BTyat
 iIhtZCZA9h41dKljv1b98WmKBHD8RlUTMaxJJ0n9hhzzj5Vu2HeGcHpdA
 AMPgiPY8iTEQS5cIylIL9BkPWC5zRTifjSKlC4Tlf/OFfZZ+teffrykzK
 xB8No8FDG7yHKi8vAL92giVPtnbIWyOlMkkcNRXn6aguAGSqtZEOkSiyL Q==;
X-CSE-ConnectionGUID: mE1ppf6ZQB6OHbpS762TsA==
X-CSE-MsgGUID: vND2FEA1SNezYOMMtCUBOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="27557492"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="27557492"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 14:17:40 -0700
X-CSE-ConnectionGUID: nyXi5IYHTNmJxDZwthts3g==
X-CSE-MsgGUID: rL0oj9QuTdGPTg1ZVSFBCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="31030345"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 14:17:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 14:17:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 14:17:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 14:17:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KAxdILw5+E7waophuuF/BeSDlgTQEBqJ3gOUwguXjeWHbTYEUIPu3A6AI1gIml5lKnkjMQX8snqjNrIzVTNo0RVdu9w6AF/a4qYUq3IY5DoFd1+6TN+upbV2eOKxgPte5m16heIFWGImbxvnlqAcbMYbhcmWBajXrvJirVjGaXHm0x5KuquUzTjoGm+kyYqLv/ZXyE5E5QC/cPj3lgxkbGo2ciTRXkEVyvdv8zvZz+aHCiKKV5q9IPwq72Dm9ucl4QcVoDvWp1h8+3NXhm5bhNZTH8wNCkQuouESh3Q13dLcGnnDqwL9Zm6Ez3ai4HoFFSzb5ygr3PMhZsdQlK0mXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tq8FIEtZp9hbqQUn1974CdO8b1B3u9pdzy8BMSUQCsc=;
 b=Od2ZNN98tBC4F0zfEVHcLZYTnmA3qZaSzwWqK9fbECIWvX1JF3g4cj/fqLo1ecKKjK9bVeuTlfGRo4N6jK0W7d9bHAUaXBNzXHPpxbrg/ZtoQYo/D3+ZKJipxkEXrhiTHgCK0t31AzpXUiu9Tuu5EygsAMosZWTvYEu+ASNBbNMvaRRpz3mwWKXETqLKTHn3VHMJ7UYIw0Rbunt21ePpFnXdEuJKA8gX9ISwmngCyoy4f/SI+YsL5cm/uDib3y4GXD5Z71nD0LWO32wQYgeBmBMUa3c8Xb9pAObhfXWnG689yl/recCT9DB9Mw0vZlfqe6AhzMU7Kx+Px5DtRcKS6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SA1PR11MB8317.namprd11.prod.outlook.com (2603:10b6:806:38d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Mon, 29 Apr
 2024 21:17:36 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 21:17:36 +0000
Message-ID: <5ce5dda0-5de8-4619-bab4-5875c46d9c92@intel.com>
Date: Mon, 29 Apr 2024 14:17:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add engine name to the engine reset and cat-err
 log
To: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240425121856.4500-1-nirmoy.das@intel.com>
 <ZiqW68FPS+vJ8TtR@DUT025-TGLU.fm.intel.com>
 <e2c55678-55f8-4ee8-9be9-f941f29f7724@intel.com>
 <Ziq9n0f24pKHCQTN@DUT025-TGLU.fm.intel.com>
 <2a989da8-26ad-498f-bf7d-19796eac2fa8@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <2a989da8-26ad-498f-bf7d-19796eac2fa8@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0064.namprd11.prod.outlook.com
 (2603:10b6:a03:80::41) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SA1PR11MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: 29f49172-6823-4010-fc34-08dc6891cafa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eG94RTVzdjk4aExsSHJtUFBwcUJZVU1HcGMycU42NlF3TG9pM0lYUXIrUndn?=
 =?utf-8?B?OU9DUHFGRlBjZmVUMFA3NS9obS9Vc2dXMnpaZHhlUlJsV3dWT1RNNkxxNDkv?=
 =?utf-8?B?VHVFaXpVMXg1RXRxMFdmNGE4dmRuOC9iNllFYkhaekM4dU5QbDJYZXg0RFd2?=
 =?utf-8?B?NTRLemNUYzBMWVFlbXdSVUNGcmFWVFE1azBtMFdkcVpIV2ZwM0luQXc0QlF4?=
 =?utf-8?B?RkwyMjAvbkFaanlwTGpmZzlpWjVON0tOTDZpQ2pvempTNEFLcGttRTF3ZzBB?=
 =?utf-8?B?SGFVOHFFVzZ2bWdJM0RsOEtEOEZvdXg1OVdFSWVENCsvOWhmN3kxOTJpeTFo?=
 =?utf-8?B?OXprRUt1bFllNkRoc1VLbVpmYXN4Z1lFTnB5cE8zd3QvRmh3OVh5Qm9OU2tt?=
 =?utf-8?B?Tk5hNCsyYnNqeXluczZVNlpVWGhxTUxWZi9QakxNYzFhTkl3cDY1MUlhMjBZ?=
 =?utf-8?B?Z2RPYmZZbmdxOG4xdGVYRFZBbmJ2WDNZNDMvcmcwSFB4T2J2ZzhkU0xsNFEw?=
 =?utf-8?B?ckZyMVd2blFSWkpvdEQxUVVrc3hENEJQeVBUbyt1Nm94V2FIL0lqNHVxdkhs?=
 =?utf-8?B?eHlNQVRld094eVZ2bXIrRXkzaTU3dmVYTkZIMFRUOE42eEszZnRCbDJhT0RQ?=
 =?utf-8?B?aUFYNkphRWJRRHE2ZFcrT01hU2EvQWpHTE1lUEpySys5YXpLN3FWYXhEaTVN?=
 =?utf-8?B?UStVZjVkZGF1RXBmY0gzVzBMWEc2Q0x6ZXZkK0VPRW1ZUkEwNWd6QnpRTXlo?=
 =?utf-8?B?WldzdS9GcldFVmNMYUpyaGN4MXJBRXZ5U2FkcnN1ZXBhY3hMOFFUNVl1TVgy?=
 =?utf-8?B?Y1FyMHIrUVAvRGpIMm5LaHVvQTBxRVhQRnpXcDlZb05aNktaTEFGSFlMdzBV?=
 =?utf-8?B?bnhvSHhwMDQ4UDJYTUIyZXNjSFUxd291OXZHRUk3WmducXFPakc4QUtnM0NL?=
 =?utf-8?B?WUtnR1NEWnRTWC9RREt4cFg2MWRjV2Z1NUZiblZOcE9lRWxRcFgwQ1dFUlhL?=
 =?utf-8?B?dXdvbTh4U1h3cTFpTUxQN2tiMi94MTdpakZXWU9qZVV3Mk1wOHZ0c2xuQWli?=
 =?utf-8?B?MjRENU4yelk4dDRDS2gzeGZUQ29FQlAvWVRHOUpkclhla1JnTHdlMUZNckF1?=
 =?utf-8?B?d04rQVdTSFpEazMwS203amFPbnRLMERMLzZkTnI5VVd0NHd1YlkxTDFFdGo4?=
 =?utf-8?B?eDZWNC82eEovVlV5Zm5BZlNZMDk2OE5TM0I4ZXZnRVBBb21SS2xBMnNlVGVw?=
 =?utf-8?B?cWxyMjdPV0V5aU94Y3B2eWxRYjdrWHdUNGUvRCtuWmxrd1RxN21aRGx3SmVy?=
 =?utf-8?B?WVd1ZDJ1WjBSVnYzTzUyeHNZdlB4T3dSajk1YUJzUWxIdzZ6YjVhY0JPRnFM?=
 =?utf-8?B?bXdtd0p1cmRweG42OUpsR3MzbmI1UGlrWWUrbHhLZGMwRFVaNmVrSVpISks2?=
 =?utf-8?B?Z0xHVGtwbnEwMGpzQXVGamdvbFllTTRlVTV1RmJWRGZ6dUpjNGR1amdDRGU5?=
 =?utf-8?B?aGh2L3RoamRYY3ZubVRDOWkzYTVRdnVVZkFMdkVyY0tUUit6enhvdC9vT2hY?=
 =?utf-8?B?anE4Y0k3Vno2QkFxa01rVXBVa0ZleGpVUFpNVXdEQVlrSGpqUEc1VTE1bVZE?=
 =?utf-8?B?WjgvWkJjeDJOc2pyYW9Rc1IzZUZHbzEyN2g1T2V2dnNBbWNHVVdWQVF3TytY?=
 =?utf-8?B?bitXT0ZuQ1dtU20zWktEZnlGa2s2bXRCd2d2MlNyelF0ZTRGTG4xamtRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWt1NVdhOTE1djdYNHJQblFTb1Y5THdwRklBS3ZyaFR3YWZmZTNZejlqVlRy?=
 =?utf-8?B?VEQwWkluY1picjJHaGRqeEFjdEZBZjZCQ1pKSDFWYWNZL29LR3ZDTm5nbUJx?=
 =?utf-8?B?UEJHa3FyZlNzNnNrWWtmNmpMODBEV05VY2NGOG05MWtXUWs4L1NLVGVjTGpO?=
 =?utf-8?B?bGY2YUJnL1RaeWZ6bnRydWNraG1HT2Q0aTBtM3d5bVllRnlNSmZrbWpCQkp3?=
 =?utf-8?B?akx6R1FkZThOcElMdFRwZDFIMTF2Z2wrVkZVM3BKWTZENjJMSDVsZkpZaGtu?=
 =?utf-8?B?SjZHcVpyU3YrV1FwcG9Pak9JSW5ydGxCS2R5UWk0YmJTQXAxWVRvMjNtN08y?=
 =?utf-8?B?YkczczNZaHk2ZFBNamV2OFNUcVNjWHB1dG44SFdFYXlraEtRMmdIRzJHdm9Z?=
 =?utf-8?B?Q20xcEJMOVlpbXRTV1Y0a1dxZElHVzdlZGJYZVJPTWZLaWZZdGdPRi9ZZDU2?=
 =?utf-8?B?cm1PWS9pT1JoRVVKYU1wdWFYL3NpYnRnV0ZXQjcxdDhlYWdRMUdsSmVGOXpp?=
 =?utf-8?B?c2hHM3ZBOVZmUG1ONFRxTnpWUityVUthTVkxNWNRNjR5TW1sRHhMUjRKZDN0?=
 =?utf-8?B?ak5ubGFualpSU2FQL0JFWmErOUI4VzZwdGU2SU0xdkplanhXbk43dm4rVWMy?=
 =?utf-8?B?UHdwSDNlOSsvMjQ4VHFSVFo2YkJXSk5PcmNvOXgrLzBHVGppTm1hWE5QbFc4?=
 =?utf-8?B?K2hEMjV0VkhRbXI2cVA5dFU4akZ6ZUc4ZlZQVEFtVGRYaEptbDA4bnVWYVM4?=
 =?utf-8?B?ZjZMakFIR01zVG5UZU9YblhZdGNKYWZMWVlLN2dOMGFuQWxBQy9ieVJqU1ow?=
 =?utf-8?B?SnpnSjk0WjMrcnhDVWJBWkNJUGhpRGN0OC9YRjZPRzdKY094VVRVdiswbzdG?=
 =?utf-8?B?dURsWUJZWlZ3K1Q5WTZ1REdwaXhXZUs0bXJzMVczbnR5WlEyM3BoT3JUNXFv?=
 =?utf-8?B?a2NNR3IxZ1Jad3FWNlRKdk9iNFNSNkhJNnpHMVM3TDlmNkZYQUFmZUxLdmlE?=
 =?utf-8?B?R01BNUx6UHA2N0V5Si9kY2ZpV0RtQndNQ1lYdmRNVnhlcVNRMVdYUjA5ZjND?=
 =?utf-8?B?Y2tuRUtoRmNpa2tWc2Z6ZU1KQ3hYdFUyV21UanBWcUdVbU5LYWw1bFJhK0Vn?=
 =?utf-8?B?RWNjZGdnSk9CekNudVhiaVFBQlVTeUdvNGhVZlpKUnkzOHdOd21hbTNSNkRa?=
 =?utf-8?B?eWZWNTE0S2pQRzQzQ1hmbGcwdGNHVlBvWHFYeVEyK1FMZlFTTVdvNDFaYzlV?=
 =?utf-8?B?MjQxYUFIbnJ3RFZIeWQvbmRnTkxoWXR3a3RRb0R0Z1VnMlU3aVlJRlhEUHpD?=
 =?utf-8?B?cjdWYndUcEpUb1R3aEZma0lBa2dNWkJCRkJnMnJqZmp6a1h4Y3RsUFMySGFF?=
 =?utf-8?B?QUlXT0lwZ1BVWVdXbmo1b2o1S2FIcmxXcGJrUFpWMTh6RENwdlF3T2h0Ujdk?=
 =?utf-8?B?U2hqdURxSVpKTitIZEZFd0ozK1FvM0Y5MEVjV0EvK1RPdkVFY2dMZDY4MkhQ?=
 =?utf-8?B?eVdSWC9XSzRoV1dBMGs3Y2JMNmFJTnhxWjBJcUpyWlpWQkp6RmQxOER0N2tO?=
 =?utf-8?B?SWdGTTJmeVJYOFZ4UE1RMHJGVFZHSzdzM0wxVVNnc3I5RXRiOU9jNVNxQUtt?=
 =?utf-8?B?NWRkMGhHRUFMMFRSWWFPemJkMHlwd3YwbGd3dE4weUFVTVJuNDVWdXlqbURJ?=
 =?utf-8?B?QjVmMm9pOGNhNzJPdGkyY2o4NXBHaHRNRUp6MkRiSDZnKzd1a3NYNDRYQXh1?=
 =?utf-8?B?NkZ0QjJ1TzVpejQwRHNkMmNDcTV3Mk9rUGh3eElvdWk1V0FkRmtxTmtHTXJz?=
 =?utf-8?B?bjdoYUhUQ0dQL29rOGltaWdPVVlNc09VVU5sOEpzVkFaaEZRYWZCa0wzVVN4?=
 =?utf-8?B?WE1VN1ZRZEJ4NWp3ejU3c1hOa1RoRm1XdnVhN2R0eW9TSEdIak1RRVJnL0Za?=
 =?utf-8?B?TTNkS3ZaMW4xb2pOVGtnYW1Qd25Jc2NTa0ZyeWxWWTBRdkZhUkQ3N1d3SXh6?=
 =?utf-8?B?eWwwR1pZZTQ0OGQ4QmFSeTZjY21mQnQ4UUx1S25ORExvQXVDUE1ZL3Fscmh1?=
 =?utf-8?B?b1AwSmpYYThpMDkva3JUYmg0ak54aHB6SVJ2bjFaRExKeXBCK2tCTi93RHFt?=
 =?utf-8?B?Zks1RXJLVXJ0TjVtWXBPZi85R3Uwdy9ob09TY3BIUzEyS2lqbWdxZmp4bHNP?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f49172-6823-4010-fc34-08dc6891cafa
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 21:17:36.6433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bcNcNGNLBSVZ0xbQE7NSanzTOvifYAv3aQiDxZtgPIl7INga3b+SuoYJVDCFC6nFgUrWfplnflPcowWwClwp+VkLqxQaeBn//KtAsae0f0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8317
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

On 4/25/2024 14:16, Nirmoy Das wrote:
> Hi Matt,
>
> On 4/25/2024 10:31 PM, Matthew Brost wrote:
>> On Thu, Apr 25, 2024 at 09:11:22PM +0200, Nirmoy Das wrote:
>>> Hi Matt,
>>>
>>> On 4/25/2024 7:46 PM, Matthew Brost wrote:
>>>> On Thu, Apr 25, 2024 at 02:18:56PM +0200, Nirmoy Das wrote:
>>>>> Add engine name to the engine reset and cat error log
>>>>> which should be useful while debugging.
>>>>>
>>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++--
>>>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c 
>>>>> b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> index c7d38469fb46..245e29d095c0 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> @@ -1655,7 +1655,7 @@ int xe_guc_exec_queue_reset_handler(struct 
>>>>> xe_guc *guc, u32 *msg, u32 len)
>>>>>        if (unlikely(!q))
>>>>>            return -EPROTO;
>>>>> -    drm_info(&xe->drm, "Engine reset: guc_id=%d", guc_id);
>>>>> +    drm_info(&xe->drm, "Engine reset: name=%s, guc_id=%d", 
>>>>> q->hwe->name, guc_id);
>>>> I don't think q->hwe->name name is useful as it might not actually be
>>>> exec queue is running. I'd drop that, and replace with string 
>>>> indicating
Not following this. What is q->hwe->name if it is not the name of the 
exec queue which owns the given guc_id?

Note that the notification is officially about a context reset not an 
engine reset. The actual implementation mechanism might be an engine 
reset but the intent and purpose is to reset the specific context as 
identified by the guc_id field. That is, the error report is not that 
BCS37 failed and needed to be reset, but that context 43 failed and 
needed to be reset and the fact that it happened to executing on BCS37 
at the time is more coincidence than cause.

If the q name is not meaningful and just some generic string then maybe 
the better fix would be to make that name more useful?

I would also change the base string to be 'Context reset' rather than 
'Engine reset'.


>>>> the hardware engine class.
>>> I will resend with engine class instead.
>>>
>> Maybe include the logical mask of exec queue too.
>
> Will do that!
>
> Nirmoy
>
>>
>> Matt
>>
>>> Thanks,
>>>
>>> Nirmoy
>>>
>>>>>        /* FIXME: Do error capture, most likely async */
>>>>> @@ -1690,7 +1690,8 @@ int 
>>>>> xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 
>>>>> *msg,
>>>>>        if (unlikely(!q))
>>>>>            return -EPROTO;
>>>>> -    drm_dbg(&xe->drm, "Engine memory cat error: guc_id=%d", guc_id);
>>>>> +    drm_dbg(&xe->drm, "Engine memory cat error: name=%s, guc_id=%d",
>>>>> +        q->hwe->name, guc_id);
>>>> Same here.
>>>>
Indeed. This is also not about an engine failing and create a memory 
error. It is about a context attempting to access an invalid address.

John.

>>>> Matt
>>>>
>>>>> trace_xe_exec_queue_memory_cat_error(q);
>>>>>        /* Treat the same as engine reset */
>>>>> -- 
>>>>> 2.42.0
>>>>>

