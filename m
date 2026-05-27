Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881F1CD5BC9
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 10:54:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DEA310E77F;
	Wed, 27 May 2026 10:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zq/LDTUd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9075410E780
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 10:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779879242; x=1811415242;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sTtmsctMKxOB8pamIYVx8vKD8xg1JPyhE9ulkKt/Ef4=;
 b=Zq/LDTUdD8peqvAhm07mtkCtYJeoAM+lzNSQm+5r69FMyc0ZQN/VLSE+
 ssuy07nfo3Je2bXdDC9EpcXbh3G6MPwsJv3jN/ug6ZKLqnHmgo9+lEQc2
 Xsqy6LvtVOPpNl9G1DHxuK+URDGvQrLC/VObNwOVBGZeSbpr4RC4huBlL
 YpMiOQR/s03fSlxwOwQlEzf+5PlH+EJhXqjCm5LNO66qyLq0ncKhcT+a7
 Qxl3e2sOzNGZ/vtsk+bGIdr5FmKMRxUnIzzdUBH3a1gpEQy2rlZ/vn6mC
 XYOxyoi/8vdIsTRT06liOgM4RwS5mkUTzs+pPPTzR9Iyv78qPGPLu/9Q6 Q==;
X-CSE-ConnectionGUID: io3Fr6jDTwqpKiAhUcBKJg==
X-CSE-MsgGUID: qZeQOpdFTmaH17CJKQd4DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="92176242"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="92176242"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 03:54:02 -0700
X-CSE-ConnectionGUID: ocCFxiaGRD2uqIFEsY0gjg==
X-CSE-MsgGUID: GRLKJjBzTzOWcQR1ozXf/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="242035607"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 03:54:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 03:54:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 03:54:00 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.37) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 03:54:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nnZCVfJQW3u4uLhsqZnA7wsqUwrdm+IhnF78wVYqhnTgee+uHPke9b8WoweXwgqo3QQgoWQ4ajrZMmzdyQ+nOVK4hZtIX5Whx9fEamhE1EhhXhCqTL40u/TpaMPbmPXaMkKgOKscb9RT0So8nYVsZOcmb8xBNEtWep1TwRTk2t103ZJOwwpNLV2rOs/Dc+UcrEOa+ngB9cFjaEe9BkHtCU8fMZbayY2LUZWiLVPlBf17h7hhkysPCIPLfG7DO3OjYg7ehW4fbeHFrOyaRe6tymkJna3BmDKGWGFV7Q5e76M1GMs5HDbgCUgEz20d6mBTHbBYPTr3zqoThdSQvMoVIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsZC1LxVF9blnFEsMQAX4CO2Dc2F+0geR66vXywNwqI=;
 b=wnoUrtopTB+nPdoPxra1WBM4vCTo4U/LMxJOQBV5W9JQ2vR9SwwDaj/UW83UrDeNZUn+IN0oPlnT5GyWxipEBcgwa3pvf7quUAhb/7ipiN9cu0/fEFgG82RUGcx1ossxVhWDgt34Whtvr+Ywasaif3fto6yXTaEiCf1l0SPti46HE3ohMh5FYmZQZprEpF9MQpLYIjye2fr2nAUgyf/Xl0PV1Px1n0ALaq+ntVG7V59vIbLqCdghEl4WQaVpNPLtEHY05j7m5dIolGLngbto4lOKVyDRIu9v7z/ZdeEthw9uqbSMxLDDL3HL3JSK3n4g1W0man5KTYseZGalWl1oLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB8546.namprd11.prod.outlook.com (2603:10b6:610:1ae::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.11; Wed, 27 May 2026 10:53:51 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 10:53:51 +0000
Message-ID: <3d129884-e11d-428d-ab0c-3974bd376230@intel.com>
Date: Wed, 27 May 2026 16:23:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: add configfs knobs to disable RC6 and MC6 at
 driver load
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <karthik.poosa@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20260527100401.612233-2-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260527100401.612233-2-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0269.namprd03.prod.outlook.com
 (2603:10b6:303:b4::34) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB8546:EE_
X-MS-Office365-Filtering-Correlation-Id: c0dbf444-06a3-4d04-ea8d-08debbde3d11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|11063799006|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: OJXUjhmfRKLxJlq67NK33/10zfl+4wKBfww4FjbVmMFbjWiK/mzvqq6IWwmZQfDFOK102WF4mI0bjsDSt+rIxvDhNgkr6o0jhsacF4IVgVlZK5qg/1dCFBZck7N9HMA2dZ2szRqST4RAX5nQK4iD2mR+y2UY5we15ibCSxHwPETE3HYKmoiKVF9rrg+5rhjST4S0MqHFKwUATzrcKo544F3zfVgEBccxwldtwL8+BZgn9Oxl3kb4iQxfMu9IS305BCPapuQN4vQ5IzbxtiBPpTb5aLIt0cApi2ULFRcxrxuD754Us56MXSof/nOA6noPJwv/s2VOtUwRxdrS68VNhDhuQqQnKqFABsAC+cyCF8UjgL6Wfp3qLyZfcc/FZpOlzvGHfBLH6fcZiMs8hH8WfFUyfwaicVfD0OL/aP9edaJzqHihk+DZxuVRcAUKojYzzxMqsce2j5Z1bfu+zaimyrTRkCKTqBxAQ37dkxFdDRPyrGjLG+ubnIifqFBkEwT1uXvcuP6hykfAFgJGuXhPjRCskCofuWwQBi3ffL9/3EosFpRXwBugmLJgRXHbdG5/MoZdnWxuVPyJw39v1kkIL7fwtz6W95nAmjfJAHNoCYJ/loXdSH7wNzW8giQ+J970YGpmdp+0aYHWj4jMwtH6ag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(11063799006)(6133799003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWhxSFFQSmVQakI2ZEJpRnlGZHlKVW5uNFVxWHNkZGR4YU14MXhVQmVFZFd0?=
 =?utf-8?B?d2g3cGt4TEpsb1dNZCtBUVdtQS9UaHRNb005YUF2bElpUTdrcTlKdGFBRFlU?=
 =?utf-8?B?MTlVbUlEQURPeERkVm15NkdNaFlWTlR5Ty9jUXZFMVRVZkNHVnlQN2J6UGVn?=
 =?utf-8?B?VEhOU0tHZWFCWEtOR1ZsNnRTQWtlKzA4eUd4RHRpRDRkNGtmcCtjNVBBRDFI?=
 =?utf-8?B?QXJGWVpSb1gxMXdoRDh5bzB3bU5HMm93MTVCUWZFUCtBa0RqNWx4T1BvbGtI?=
 =?utf-8?B?TURaUGxZcG9Zdys5ZWhzekIwd2dieUcwNkQ2SUxtSkFiZEdWVDVOR1h4V29F?=
 =?utf-8?B?QWl1SEFmQlBaNFg5eUZ0U2tmK1Z0b3BmWEtaL0duQzE5UnBUZmJGcHk4WU9H?=
 =?utf-8?B?MWQyQkZIbU82QXNKRkFPRlpWVDZGTkVFTXF2SVg0d3RoYStCQkt4R01sektj?=
 =?utf-8?B?MHNiV0tJRnV1dlMvNkZHVmFubkdtWTFQWENJQzF6NHpla042NU56RUdjQlM0?=
 =?utf-8?B?dnN3SVhXZ3J4RmtHN1JXOC9CaUdTWkZtWGxBWmxsTWhyN3lNSjgwZG96TEtH?=
 =?utf-8?B?TVhieVk4dlludWtaT1AwcHlMV2l0RldMQ0dpTFQ2d2hWM3ZNSW9HTUxzODFw?=
 =?utf-8?B?MnJSa0xtQ0R6aEJCbDduaTc0b29kUklSSkg3bUY1Lzd0dUd0d0MyZWJhQXZG?=
 =?utf-8?B?Z2hWQkJYSkJvMVFvMXEvNzFsZzBxMFZqcUhuR1ZmVzhpQTZ3QjBjdGVTNFV1?=
 =?utf-8?B?b1NBTFdwM0Fjc3Zld3ZQMlpMU1lnaHdHY3llY3prMmtUUll6a1ZZR2Fnd09X?=
 =?utf-8?B?MjBqQXJJZmpxNUlzUDNhNTcyaXcyaDIyVFM4T3R0dHJzVitiN3BZZ3lzQjJh?=
 =?utf-8?B?NC9zNWJ5S09uUjBGL3dMTG1rRWNrdE5pd0pnN091bXhxK0FrQlNtOFFCZGJ3?=
 =?utf-8?B?cThobkdKd1Z1d2pHNnRmTG1ydEdIWVdjaXJFL25INWFtRHcrOVhqdDkwM2lm?=
 =?utf-8?B?SU9UNG9YdGsvRDZqc245ZXd6d2xHd1VPQjRzejdmM3NDUkFudlNLdFF4NzE2?=
 =?utf-8?B?R2szVUVQSVBtUHJwUGsvUUtmb2ZPSDZBbXlzT2Nxek1zWEVPV0tzcXlaTlVh?=
 =?utf-8?B?UmU1NFF5Wm1sa2w2UUxaNHZDTXcvOVU3aXRZaUxhRzlRRis5RkthRUVQOVdU?=
 =?utf-8?B?S0loaGw0MWpZTm9EUTYrcTgyalA4MCswY2NhSGVlRWp2QnZ5cWt3cGNLRW4w?=
 =?utf-8?B?REZDTXN6VWZPN0F2dmZOQUpWamJNZ0hOS0pxU01VSE1xRkhtMGM2UFBPM25S?=
 =?utf-8?B?cnNRcWJNZ2pYNTlhMzgxQ2ovcGNiVW10MmYweitNNEZlVGlCTFdCTTVMckdl?=
 =?utf-8?B?bkxpRDUyOU41T203Zm9nUHY2ZXUxYklRSm5GQ2VEb3dwcEhYaWdBYy9CZjNW?=
 =?utf-8?B?Y0E0QWcvbVg4M3pFVmgwTTJWKzYrSFZpK1lrWU8xWlZyN3pQSEgvNkZvZENM?=
 =?utf-8?B?NUc0TStBdXE3aGN3R1h6Ky8xRC9WRkUwd3N1WnRWRk9LUzY3R2F1NkxCOTEr?=
 =?utf-8?B?WUh5dk1LL01ZMUVYMk1LRTdyQkt6bUhXZ3lhcEtZS1o1U1pnZnp6endaZlU2?=
 =?utf-8?B?R3d2Y3J2MFcxWU9BM3p1bjBBWlVjMjRVa01ualgrUjduVTRmUjNkYUlUYzVm?=
 =?utf-8?B?K3hOS1BLS3BuRXBacWJqQU1yZ2k2d0ZMWWV2d0tTM0dHWHh3TmVTR2NXWVA0?=
 =?utf-8?B?MGFFM1ZUNFhzSmNuZlJhRWE0MEw2d1loZHhUYklpRVRPM2s5SDhXRDJFWmpl?=
 =?utf-8?B?R2FjS3R6M1c2V3pBM3FQVjJwSzJGcEVZcit1aUhnTEVEVk9lSll2UkdkNmxi?=
 =?utf-8?B?bnlvcjJXOUdDWmVnOVpQVzBrQi9QTFYwbzVYQXN0bzhnOXBZOHhvVW9nYU8v?=
 =?utf-8?B?cU9GTHJPSWdNRXowMDVBSW9KcksrZHliMGpRRVpWZGlSRXErRFE5OXFqQWxk?=
 =?utf-8?B?SWtMRUpWQzNYZVV2c2lzV2M1VWorT2h4bEMwdkJYeEwzL3ZmMmZGZ2trNXVS?=
 =?utf-8?B?T0RTanNoRXArYzNIT3N0NnAxODEyYkFIMnpkNzV2Y1BLSzlvQzFvbXFFMDho?=
 =?utf-8?B?TzJOLzRqSHJ3SjNUMzh2M0xmS29mSzFOYWI3L2dyQzlRSWlYU2xwWlA1L3pO?=
 =?utf-8?B?WWJ6cVRuU28vdUdPSmc1OG1xT2QrNU9EeFpYSmM5c3dvWVFwLzhTV2ZIYjJw?=
 =?utf-8?B?cW9pWXUrZk1tYXFrblBNQjlzMEw4eVN5bFhzajhLaEorU2ZVSU14WTM0RVE0?=
 =?utf-8?B?M3RqUmIyMkU4QysvbDF2bjcxL3dRcmpqNjdReCtnK1dKTk1UVlAwQT09?=
X-Exchange-RoutingPolicyChecked: sCbtYTs3nUsVCLhtIiKgNXAqJnboE6+Mmk/f774u6KpwFSHYcg6684baixIxOQEf3Yeg/3OTgxvqptByVIDr6eryEnVW0oES6rQlz414dTcRx9pIi0Os52SrfB5hBp4gqOha3x4qagpr6isN3cQoNUjLn6xJLUxFmiuheh5gBGyT8RIPwQkb2Hd6v1q+F2ane7EzO5X1vwprYQm4w0PLc8FGt53hTa/yjErdPXhdNtjSVNkTG5NgRDROYJaIu53G8ZcoQRmVTaUkEx3zJcNqX/YQx+a67YHzpJH3M0mfuIm28fRbFLHCKfowI9saFhVxG60dVGSA7Wxt4naHTYh36A==
X-MS-Exchange-CrossTenant-Network-Message-Id: c0dbf444-06a3-4d04-ea8d-08debbde3d11
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 10:53:51.6495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8I5OQ0f1nlZz2IFxdIbX/GjZHtRm6vLNreM4gDZBrxVPfB1M+EDEpY2OhkuNZewExwhlJgnlro6diwtp+Zisw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8546
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


On 5/27/2026 3:34 PM, Mallesh Koujalagi wrote:
> Currently RC6 (render C6) and MC6 (media C6) are always enabled by
> the driver when it programs RC_CONTROL. There is no way to turn them
> off before the driver starts using the device, which is needed for
> power, perf and silicon debug.

This approach was actually removed in i915 in
https://patchwork.freedesktop.org/patch/msgid/20171201113030.18360-1-chris@chris-wilson.co.uk
Can you please elaborate the reason behind re-introducing this?
Also, debug/testing knobs belong in debugfs instead of a sysfs/configfs.
Have you considered using the forcewake_all debugfs?

Thanks
Riana

>
> Add two per-device configfs attributes that gate the C6 enable at
> driver load time.
>
>    /sys/kernel/config/xe/<BDF>/enable_rc6   (default: 1)
>    /sys/kernel/config/xe/<BDF>/enable_mc6   (default: 1)
>
>    echo 0 > enable_rc6   -> rc6 is not enabled on the render GT
>    echo 0 > enable_mc6   -> mc6 is not enabled on the media  GT
>
> The values must be written before the device is bound to the driver,
> exactly like the other xe configfs attributes. Defaults are 1 so
> existing setups keep prior behavior.
>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_configfs.c | 119 +++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_configfs.h |   4 ++
>   drivers/gpu/drm/xe/xe_gt_idle.c  |  33 ++++++++-
>   drivers/gpu/drm/xe/xe_gt_idle.h  |   2 +-
>   drivers/gpu/drm/xe/xe_guc_rc.c   |   2 +-
>   5 files changed, 157 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 32102600a148..7ad488c0641a 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -61,6 +61,8 @@
>    *	    ├── survivability_mode
>    *	    ├── gt_types_allowed
>    *	    ├── engines_allowed
> + *	    ├── enable_rc6
> + *	    ├── enable_mc6
>    *	    └── enable_psmi
>    *
>    * After configuring the attributes as per next section, the device can be
> @@ -159,6 +161,21 @@
>    *
>    * This attribute can only be set before binding to the device.
>    *
> + * RC6 / MC6 idle states:
> + * ---------------------
> + *
> + * Enable or disable the HW RC6 (render) and MC6 (media) idle states. Both
> + * default to enabled (``1``); writing ``0`` causes the driver to skip
> + * programming the ``RC_CTL_RC6_ENABLE`` bit 18 of ``RC_CONTROL`` when
> + * the corresponding GT is initialized:
> + *
> + * The two flags are independent. Examples::
> + *
> + *	# echo 0 > /sys/kernel/config/xe/0000:03:00.0/enable_rc6
> + *	# echo 0 > /sys/kernel/config/xe/0000:03:00.0/enable_mc6
> + *
> + * These attributes can only be set before binding to the device.
> + *
>    * Context restore BB
>    * ------------------
>    *
> @@ -262,6 +279,8 @@ struct xe_config_group_device {
>   		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
>   		bool survivability_mode;
>   		bool enable_psmi;
> +		bool enable_rc6;
> +		bool enable_mc6;
>   		struct {
>   			unsigned int max_vfs;
>   			bool admin_only_pf;
> @@ -281,6 +300,8 @@ static const struct xe_config_device device_defaults = {
>   	.engines_allowed = U64_MAX,
>   	.survivability_mode = false,
>   	.enable_psmi = false,
> +	.enable_rc6 = true,
> +	.enable_mc6 = true,
>   	.sriov = {
>   		.max_vfs = XE_DEFAULT_MAX_VFS,
>   		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
> @@ -575,6 +596,58 @@ static ssize_t enable_psmi_store(struct config_item *item, const char *page, siz
>   	return len;
>   }
>   
> +static ssize_t enable_rc6_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = to_xe_config_device(item);
> +
> +	return sprintf(page, "%d\n", dev->enable_rc6);
> +}
> +
> +static ssize_t enable_rc6_store(struct config_item *item, const char *page, size_t len)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	bool val;
> +	int ret;
> +
> +	ret = kstrtobool(page, &val);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&dev->lock);
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	dev->config.enable_rc6 = val;
> +
> +	return len;
> +}
> +
> +static ssize_t enable_mc6_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = to_xe_config_device(item);
> +
> +	return sprintf(page, "%d\n", dev->enable_mc6);
> +}
> +
> +static ssize_t enable_mc6_store(struct config_item *item, const char *page, size_t len)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	bool val;
> +	int ret;
> +
> +	ret = kstrtobool(page, &val);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&dev->lock);
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	dev->config.enable_mc6 = val;
> +
> +	return len;
> +}
> +
>   static bool wa_bb_read_advance(bool dereference, char **p,
>   			       const char *append, size_t len,
>   			       size_t *max_size)
> @@ -813,6 +886,8 @@ static ssize_t ctx_restore_post_bb_store(struct config_item *item,
>   CONFIGFS_ATTR(, ctx_restore_mid_bb);
>   CONFIGFS_ATTR(, ctx_restore_post_bb);
>   CONFIGFS_ATTR(, enable_psmi);
> +CONFIGFS_ATTR(, enable_rc6);
> +CONFIGFS_ATTR(, enable_mc6);
>   CONFIGFS_ATTR(, engines_allowed);
>   CONFIGFS_ATTR(, gt_types_allowed);
>   CONFIGFS_ATTR(, survivability_mode);
> @@ -821,6 +896,8 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
>   	&attr_ctx_restore_mid_bb,
>   	&attr_ctx_restore_post_bb,
>   	&attr_enable_psmi,
> +	&attr_enable_rc6,
> +	&attr_enable_mc6,
>   	&attr_engines_allowed,
>   	&attr_gt_types_allowed,
>   	&attr_survivability_mode,
> @@ -1098,6 +1175,8 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
>   	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
>   	PRI_CUSTOM_ATTR("%llx", engines_allowed);
>   	PRI_CUSTOM_ATTR("%d", enable_psmi);
> +	PRI_CUSTOM_ATTR("%d", enable_rc6);
> +	PRI_CUSTOM_ATTR("%d", enable_mc6);
>   	PRI_CUSTOM_ATTR("%d", survivability_mode);
>   	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
>   
> @@ -1225,6 +1304,46 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
>   	return ret;
>   }
>   
> +/**
> + * xe_configfs_get_rc6_enabled - get configfs enable_rc6 setting
> + * @pdev: pci device
> + *
> + * Return: enable_rc6 setting in configfs (default: true)
> + */
> +bool xe_configfs_get_rc6_enabled(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	bool ret;
> +
> +	if (!dev)
> +		return device_defaults.enable_rc6;
> +
> +	ret = dev->config.enable_rc6;
> +	config_group_put(&dev->group);
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_configfs_get_mc6_enabled - get configfs enable_mc6 setting
> + * @pdev: pci device
> + *
> + * Return: enable_mc6 setting in configfs (default: true)
> + */
> +bool xe_configfs_get_mc6_enabled(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	bool ret;
> +
> +	if (!dev)
> +		return device_defaults.enable_mc6;
> +
> +	ret = dev->config.enable_mc6;
> +	config_group_put(&dev->group);
> +
> +	return ret;
> +}
> +
>   /**
>    * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
>    * @pdev: pci device
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index 07d62bf0c152..971cfc24d1ff 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -23,6 +23,8 @@ bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
>   bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
>   u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>   bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> +bool xe_configfs_get_rc6_enabled(struct pci_dev *pdev);
> +bool xe_configfs_get_mc6_enabled(struct pci_dev *pdev);
>   u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>   				       enum xe_engine_class class,
>   				       const u32 **cs);
> @@ -42,6 +44,8 @@ static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return
>   static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
>   static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
>   static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
> +static inline bool xe_configfs_get_rc6_enabled(struct pci_dev *pdev) { return true; }
> +static inline bool xe_configfs_get_mc6_enabled(struct pci_dev *pdev) { return true; }
>   static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>   						     enum xe_engine_class class,
>   						     const u32 **cs) { return 0; }
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 04b24e1c8b78..2d77b1331e7c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -3,15 +3,18 @@
>    * Copyright © 2023 Intel Corporation
>    */
>   
> +#include <linux/pci.h>
>   #include <linux/time64.h>
>   
>   #include <drm/drm_managed.h>
>   
>   #include <generated/xe_wa_oob.h>
>   #include "xe_force_wake.h"
> +#include "xe_configfs.h"
>   #include "xe_device.h"
>   #include "xe_gt.h"
>   #include "xe_gt_idle.h"
> +#include "xe_gt_printk.h"
>   #include "xe_gt_sysfs.h"
>   #include "xe_guc_pc.h"
>   #include "regs/xe_gt_regs.h"
> @@ -400,7 +403,7 @@ int xe_gt_idle_init(struct xe_gt_idle *gtidle)
>   	return devm_add_action_or_reset(xe->drm.dev, gt_idle_fini, kobj);
>   }
>   
> -void xe_gt_idle_enable_c6(struct xe_gt *gt)
> +static void xe_gt_idle_enable_c6(struct xe_gt *gt)
>   {
>   	xe_device_assert_mem_access(gt_to_xe(gt));
>   	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> @@ -415,6 +418,34 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
>   			RC_CTL_HW_ENABLE | RC_CTL_TO_MODE | RC_CTL_RC6_ENABLE);
>   }
>   
> +/**
> + * xe_gt_enable_c6 - Enable C6 (RC6/MC6) honoring configfs gating
> + * @gt: GT object
> + *
> + * If the corresponding configfs attribute is disabled, the HW C6
> + * enable is skipped and RC_CONTROL is left cleared (no RC6/MC6).
> + * Defaults are true so unconfigured devices keep prior behavior.
> + */
> +void xe_gt_enable_c6(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	bool c6_allowed;
> +
> +	if (xe_gt_is_media_type(gt))
> +		c6_allowed = xe_configfs_get_mc6_enabled(pdev);
> +	else
> +		c6_allowed = xe_configfs_get_rc6_enabled(pdev);
> +
> +	if (!c6_allowed) {
> +		xe_gt_info(gt, "%s disabled via configfs\n",
> +			   xe_gt_is_media_type(gt) ? "MC6" : "RC6");
> +		return;
> +	}
> +
> +	xe_gt_idle_enable_c6(gt);
> +}
> +
>   int xe_gt_idle_disable_c6(struct xe_gt *gt)
>   {
>   	xe_device_assert_mem_access(gt_to_xe(gt));
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
> index 9c34a155e102..d9f21d7ef507 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> @@ -12,7 +12,7 @@ struct drm_printer;
>   struct xe_gt;
>   
>   int xe_gt_idle_init(struct xe_gt_idle *gtidle);
> -void xe_gt_idle_enable_c6(struct xe_gt *gt);
> +void xe_gt_enable_c6(struct xe_gt *gt);
>   int xe_gt_idle_disable_c6(struct xe_gt *gt);
>   void xe_gt_idle_enable_pg(struct xe_gt *gt);
>   void xe_gt_idle_disable_pg(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
> index 99fa127b261f..5c16c159f518 100644
> --- a/drivers/gpu/drm/xe/xe_guc_rc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.c
> @@ -123,7 +123,7 @@ int xe_guc_rc_enable(struct xe_guc *guc)
>   	}
>   
>   	if (xe->info.skip_guc_pc) {
> -		xe_gt_idle_enable_c6(gt);
> +		xe_gt_enable_c6(gt);
>   		return 0;
>   	}
>   
