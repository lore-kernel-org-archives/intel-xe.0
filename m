Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77E2CCD199
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 17:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694DC10E243;
	Thu, 16 Oct 2025 17:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fhcjpres";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D7910E243
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 17:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760637054; x=1792173054;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8mdEaxB7fVSK1hqX5+BaVONN7j2CnEGBg//EmuemGTI=;
 b=fhcjpresS8QXXdtrT2WvdwlJiNyF3+7kYKB2py+kUjGgNxqXo6HNipxl
 cVqxWbVqXtVslmo+ezeEtYlEYgJ7fAnYPq2mDz/NKhXzgTNitxU97qBZD
 xJ0aS34hQyal7PefN1W/XHI05UWnzFQI5/lxX/Ohi1hsQAo+L42qIJ229
 sooMKYYvUMC+QFk/WA+4xNfRenSQJ3weOoRSji7CIwx/LOjVw7vQhsJn0
 sHGT3ZTdSuQfCrpHoYc24aFIWslfGDsCyW5x6D/ejl8zftpa14Rp1vx5f
 Lf4+ZdJre0A96EiGlEAAA6p6cma5LAgKeFgEV7YtuHKD/cxrEbT85LM8c g==;
X-CSE-ConnectionGUID: E3Uqmv3WS7ig48B2w5DajA==
X-CSE-MsgGUID: 1s9v1X3CTAa1Dbn52kGI5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="73512641"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="73512641"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 10:50:53 -0700
X-CSE-ConnectionGUID: elN1JLz0T36ZFu49ai0i2A==
X-CSE-MsgGUID: bK5Nt+NuRHKteupBpSR80w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182997842"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 10:50:53 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 10:50:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 10:50:52 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 10:50:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJehTsVH542q63ALzTw/1UIni8p0+2BtNfICq4XBGsnjZ/jrc0Tv1ki23W+4ICoSwfTsFBQ3QqpKlL2PwohDhFoP4XG3986dkRNLQ56tytfOb8c6tHMORQZ+OVUgTSvac7/4FvgB6y9sZfbRFfEbZoCTH3bjZ1FFvVxp6UVrsOgdKLCIuYGsojGkOywzOh244+JCDgLo+7xUNpKErqnzDBrYVBk15sUqsB9zJQ0rcrAynUX4TqNNZwtKOH8ZNCp+spoL2+HpR+nhZw5QxjTCllknIfULDmfWorWHabH+jAj8ranpiHoGvFgH66eVL0xLcYENX0MN1dfciQikYMl4ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mdEaxB7fVSK1hqX5+BaVONN7j2CnEGBg//EmuemGTI=;
 b=mwUz2znz7XEeFiDfpDILbCRdyor8Fgfv2rScq4Zy/5trphooZuoJm0OX0r3NyH02E1n8orY1u3qvZqmAnA/2Rqy4ymMUbznH4yaYkAqwMdWgiXSzPkZWGEfAUByzS1Ib363MYZAUat1IQ9BmHzfAIcPzj0ps3Y5eU3NOmJx6jy/mx31FmC2Y7nNBx68lZ4zszFV0V+ahWRsDwo+gJjFu2o8ExPqIIv5jUyrw/GcHpnDlgXrTOjG9uCzANoSqhK0r5FEbQKi1TMp+hhTSdxcVzG4HGOdYmqgUzD3K4mHFHa7VM/uqdiPWvpWs5tONe1sdrl9pxRZ6q+OGCLzTKlccbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MW4PR11MB6763.namprd11.prod.outlook.com (2603:10b6:303:20b::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.11; Thu, 16 Oct 2025 17:50:44 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9203.009; Thu, 16 Oct 2025
 17:50:44 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>
Subject: Re: [PATCH 6/6] drm/xe: Clean up GuC software state after a wedge
Thread-Topic: [PATCH 6/6] drm/xe: Clean up GuC software state after a wedge
Thread-Index: AQHcPTW52nNpkmZQjEa6el8c+p1XyLTDnh6AgACFKYCAAO0WgA==
Date: Thu, 16 Oct 2025 17:50:44 +0000
Message-ID: <6b77ddd884c30312f76ded9adfd1cfb79fb9f92c.camel@intel.com>
References: <20251014180927.105077-1-stuart.summers@intel.com>
 <20251014180927.105077-7-stuart.summers@intel.com>
 <fa2d3d56688c64f27baadda86bc1aa8be118179b.camel@intel.com>
 <aPBpkZCqyqgfGO4g@lstrano-desk.jf.intel.com>
In-Reply-To: <aPBpkZCqyqgfGO4g@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MW4PR11MB6763:EE_
x-ms-office365-filtering-correlation-id: 86d24324-851b-4a83-6e3c-08de0cdc880d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?VkJoRXFoQjI3L2NjWTl4NkMwbFRJK1djWHJxT1U2WWtJQ2tLZ0hxYjd0MkZS?=
 =?utf-8?B?NVVCZjFzZnp2S0Vnek9hYzhjRG4ydkFDdFNSSXFDZEJmSlo5QUowcjFyWEJm?=
 =?utf-8?B?Ui9CRXcxcWtYdUVOWUlKVytrd1hqdHNFWkk0dVBHR29CSG5nR3FOSmVvcWFS?=
 =?utf-8?B?QmFMNlo3bDRsYVBmaDl1TmNLc3VwNlVBUzlBSzIyYTZuSjVtMVIyK1YvNGxj?=
 =?utf-8?B?SkR3dUFnMnRZREJVeUVMUjBFeU9nSXVNZVRXLzlacW9rb3dNOUF0dWs1UXAw?=
 =?utf-8?B?b0pYenZ3RmQzcmRZeXlPMjVhY1ZpWVEzR3FHZlZHczJRb1plRll6V1ExOVVL?=
 =?utf-8?B?elZJZGtnVVV6L3NGK0JlYk1YdndodGJ4dDRvMzA5UXlTUFY4RnNFVmpaZ0lB?=
 =?utf-8?B?a1FNU01FMWlYcStWWHFBYkNVS0VxVFBobk4vQWcxMFJ2N2g1OWdZVUJnOVh1?=
 =?utf-8?B?d3V5V3I5bS9CZlpXUEYxYWFkWnRhTVFjUEZ2WjF1bkhlbDVNcWlZcURmeE43?=
 =?utf-8?B?RU5XVzdBenNLSlR6WDRUVG5nQ1dhUW9tOHowcEV1OHRxZjl0N0lreUxPTk43?=
 =?utf-8?B?VEk0MjNwQWlCQnZ5OVIzd2lpYm9XdGlyaVVwdjR5dzZuczlWekp0TUVkeGg5?=
 =?utf-8?B?bEZMeVo2Y0FzYkd0WkhkWmJhZzFxTVN6a1FOV2Rac0J3QjgySjhkSGZkNGp6?=
 =?utf-8?B?U2xoWmlXeDFWR0VYQzdQOXFiZW8wOEhVUjJuMVgvNTgrRFovRk10UytMR1hU?=
 =?utf-8?B?THBpZXFnNVdrMS9TL1hRN1RpaGlzLzBEVmVsMFJ3Z0lZYUxlSTBvdzEvRHUw?=
 =?utf-8?B?TlpkQnA4QW1JaDgxd2gwRVcxNTREb2FsK1hFeVUvRVhCT3ZmcG0vaHo3Y21U?=
 =?utf-8?B?eTc0TGlBbnRjQkdKNEJtUWIwMUZSZHpDYXFtMVFwTER1Z2ZERXBRSEF0eWgy?=
 =?utf-8?B?VEs0T1QzaCtLWmhzRk4rQzVrdVMzQUNrZkozMDVtR2lZQTdScEFxZTQva1Mz?=
 =?utf-8?B?UHhoSVpzSDc3ZjFjVUY5OWtDNERKYi9HZGI2S3BzWkY3TzEwYzArQWpKa2dl?=
 =?utf-8?B?TWlLU21kZjJhWTcvM3lqbWJXQjdXWFJWQWlBazh1a0lkMWU3MmNvK3N2ajY4?=
 =?utf-8?B?TnYzNXhWSG5wU1JZOG5LdC9ORXFFT2dsa1pUWVJQRTdUSlBnaXZCbG5wSVhq?=
 =?utf-8?B?VEcrMWtiNkFnZGpQYWtOeHBybjhUeERCUUtBV3BUOTA3eUNISzVYSzJMWGMx?=
 =?utf-8?B?TmsyYkF4ajlYN2tFQWxUYjVYZS95Y0pJVDJDdnluZGV3RmVmb2ZMQ2s5VDc3?=
 =?utf-8?B?VS9Ea0lUc1R4QTlSZG5zNTlzUndhVUhWT1Ztdjg3RmJyQzRGQkxTd1ZzK1Zj?=
 =?utf-8?B?Q1puaUJlVDRGKzVFYzgrbm1JQmFKL0tYaUdWbXV5SHNBS0FlenRDTGFyeUNl?=
 =?utf-8?B?ZjIxZXJTOXNVUjRNTWUyOWljMW9PcEtSa2hYWEFWSnZWcmlXL2JsL2FoU05I?=
 =?utf-8?B?TGxCbVZQQnNqNDc2ZU5vS053ZW1NOWg2L1Jhc0FhMjR3TTJNL0FHclpsRmxw?=
 =?utf-8?B?TkI3dUQ2SzQ4ekVKL2ZFNGQ0MTVmVStJUW1WL1VWclh0cndUbEZERXRlMVUy?=
 =?utf-8?B?bVdyMGE4MEZHMHVoZ0l5bG0yMzR6TGJvQ28wM3FMUFowYitvV0xRK2JPRytG?=
 =?utf-8?B?SC93QVBmRHNsOGNmTDBwT1dGVnlpMWJ0N3I0aW5TUHVLc2FjeWd3aGtOc3Z5?=
 =?utf-8?B?VG9BQzQxTkVac3ZBTW9VTkwzMHNWNlEzdmcxQXErQWk4WlVxSmpxRlVadFlH?=
 =?utf-8?B?NjJvbDk3dGxnZ2FZc3ozbHVydURka1pna0VJL0lTTjhoUkZxS2IxVGtwdjdQ?=
 =?utf-8?B?TVVuSkJnUmRGdmpLRVhIa25xcWJwYXQwWGduN1VxU3l5MUpRSlJOSi8yem1C?=
 =?utf-8?B?bTlsOWxnekVVTUxzbGV3S0lWV0t4Z1dESHg4SG40dHpvbmFhTXhWMXpWaFJl?=
 =?utf-8?B?ajFTYU5UZ05ub0J0dDJ0dVJqY2VlSGdSNkc2Y1dJbVQ4ZGtQRDhOckhoNFA2?=
 =?utf-8?Q?+bZAlC?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGNWakVaZTEwYzM0cmFhaU9ESCtaWjFTQU1IbWYxRWZWOFd0YzFmbEpZOXkz?=
 =?utf-8?B?UzMyS1NHVWNGZm1aeHNrSml5M2d3bThzSXhwZVdaQ2c0dFJZaEFHMjYyRlpX?=
 =?utf-8?B?YnN2bEhQeUk2VWxQNStzK1JQQzFXTklhbDNXYWordUJ4N3V1cXhocCtXN21Q?=
 =?utf-8?B?K0ozS3FacWo5MEhCeUZhMkFoYmNHTXpDdXJBcnZUTmE3Q3dSeEpMQVBlL01t?=
 =?utf-8?B?OWhNQ1VTUVZmQzhYSUhXZXIvRGZqS2xyWFNtUDBSZWo4MkdmNUVjN0hvQ2hm?=
 =?utf-8?B?R3M5MUtpWTdHTWtlVWtVcEVuZTZSczhLVWN5bVBFcHVjem5LWS96VFBBSVlw?=
 =?utf-8?B?ZXpIbUVaZVROZFJUcEhvZTlkVElKODMzUnVPNjUrVEhzQ1RpWjN6dUZsYzhw?=
 =?utf-8?B?Y1Ara1BwWUhERTl0VzFNcFlPeG4ranlVMSs4bTVZQ3g3RGVsakcxRDZOM3Yv?=
 =?utf-8?B?MWVkREN2eHVZS2wyYVR2WDBFWTV4NmVBSEc2endBUm51N2NIVWszemRmeTVk?=
 =?utf-8?B?N1pNRU5ETjVGYU9vaWJjRHBMamFxZHNxcUlRcEFNNWs0UDlFbDRRdHByS1VC?=
 =?utf-8?B?Z3dZc3M4dG9hM2JSSlNmMUh2V0pMam1xaW9xUzRJSE42TVh1R2c2L1pHSGNK?=
 =?utf-8?B?QlpDZXphN1EzOXd5ZVFxUE52c3ZudzVMdGZhZTByZForbjJCUXdXWkUrYTA3?=
 =?utf-8?B?MFRPWU5kR2pXMlQyUGFkdEI5bEY2eFNxbzZNUm5CUUM1aWhFRjdZb1ZIN3VB?=
 =?utf-8?B?M0wzUnZtZmhMMmNBcEJMVlc1ZWFoTGJod3JXOVJoNHQxT0dZV0xqcmxmdlRH?=
 =?utf-8?B?U3hOS3R3S1hLUDQ2SHB0VTUxN0Q5QllRMWdTYysyVGpMZHU3MzZXckhOWlRU?=
 =?utf-8?B?Nk9XR1RiNmdYem9takU1WWEwZ1BUdS8vdWc5YUo3aW9qTzMzcm1MZnRybVlP?=
 =?utf-8?B?V1JPWlc2dDZBczNrUm5GbEgxRzFtVTZjeXgxdDBEVFRtZTNpZS9ObUJLN05n?=
 =?utf-8?B?UE1nTm1XV0JXR2ROdTFBNGFDUC9lbUQzZzBXV2VtNlJUU0hRblJtU0h2OFA2?=
 =?utf-8?B?bXhnSGdVZ2dQR3JEQldjd01OM2srcVMwQ1l6ZitNMTRxRFEzT1lPdVJsbGQy?=
 =?utf-8?B?R1FkTDhBQWh0cHNsZ3hJakMyMHA0OFBDWncrU1Z1dDFuQ3JYV05FSzFFQlpB?=
 =?utf-8?B?bVZpMTFnTmwrMDRyZ09NNGhwRjhBWUxZbmcyYUQ2M1B5ODg0ZlJTRjRmRDN4?=
 =?utf-8?B?enZ1QnZrdjRjR2dMdFp4RmxNRm1GM0NOdXNiMFk0UzdQMEQrZndLbW52T0Nh?=
 =?utf-8?B?R3VaMzFQREt5OGVkSk5YZmVudDFyaDN0NzV1QVZJd2dlZC9RTStIUHFhaDdP?=
 =?utf-8?B?dUVwMGhaQjBUYldDTXNBS3BOOGtCeC94RkYySGgxVzNhM004Q2JOcFVzODgw?=
 =?utf-8?B?RHJrcG4vbmpYZ253ZzNIOWRVY3d5Tzd2QzJrVWY2bnhUTkM0d05PbzdZM0VR?=
 =?utf-8?B?Sjh6QmlyY1k5aTBHZDd3R3dIQkdMK1NJZW0ybmhVSncrcEIzTDIzWmlha1Fq?=
 =?utf-8?B?cldFaXV3T2YwK2pXZVdCakVnWkQyVm1tMFZHK1BDTkkyZmpvandkdUcxUXlj?=
 =?utf-8?B?cXgrb1B4dyt3cmdMbGZJVW9JQ2dySmZxaXZmcWorYVlQZDNOdEErbmYyZU5P?=
 =?utf-8?B?WGJpYXFkQnRTWmZ4dmZwVUs4YzdLeGNkaVlzN1ZIVW1yMDRsWTJKdk9XM1B0?=
 =?utf-8?B?TE9BODVVaUR5UlREZ29nMmRvbldXaXpSbk1UQ2JqVE43aGFPR2ptcUFoT0hx?=
 =?utf-8?B?MmxmUE81YzBQRndmY0ErbmRnQ3pLVm9IakNDa3FKNzFqODgwWC9PNzcyMWJH?=
 =?utf-8?B?UlFVQ2d5RnFLSWZtYzBCcG1lcUFlZkUzWjJjWE54eTg2Q1RxQ1BZQURMTVZU?=
 =?utf-8?B?Ni9OOVc0UEM2NEU1QnZRZFdIZDF2M25HTHlmN2R0bEZqTW5jUFBQWVZKYzZC?=
 =?utf-8?B?bnh0NWNqVTRtL2dDM3dQbGk0RUhHbEVyTFpKbWVybHFaR09xZDZGOUxqREpK?=
 =?utf-8?B?dzViQkpUbDBBbWNFcVpjdExLZlg0anZLRGg1K0JRRElmVXVRbWlyV1EwbUZZ?=
 =?utf-8?B?R3IwTzczbXk5STQ1bm5JRnpjR01IaHJ5MWlua21qaXErWDZrakE1UmVmQWxY?=
 =?utf-8?B?Smc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8100A1994DFEF94A84CBE0431FC7875F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d24324-851b-4a83-6e3c-08de0cdc880d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 17:50:44.7651 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kKj6oErCUCX7ZxxQdNKHQXVuo8TMmxxuosVsaZCrJjaZVZMBLO0CT9ToFGJWuffnmJN9zv1PePFbcwthN1hr92xXIz/Cu22KxTViIqWOYhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6763
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

T24gV2VkLCAyMDI1LTEwLTE1IGF0IDIwOjQyIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBXZWQsIE9jdCAxNSwgMjAyNSBhdCAwMTo0NTozNVBNIC0wNjAwLCBTdW1tZXJzLCBTdHVh
cnQgd3JvdGU6DQo+ID4gT24gVHVlLCAyMDI1LTEwLTE0IGF0IDE4OjA5ICswMDAwLCBTdHVhcnQg
U3VtbWVycyB3cm90ZToNCj4gPiA+IENvbW1lbnRzIGFsc28gYWRkZWQgdG8gdGhlIGNvZGUsIGJ1
dCBpbiB0aGUgZXZlbnQgb2YNCj4gPiA+IGEgd2VkZ2Ugb3IgYSBoYXJkd2FyZSBmYWlsdXJlIHdo
aWxlIGNvbW11bmljYXRpb24gd2l0aA0KPiA+ID4gR3VDIGlzIG91dHN0YW5kaW5nIChlLmcuIGR1
cmluZyBhIHNjaGVkdWxlIGRpc2FibGUgb3INCj4gPiA+IGNvbnRleHQgZGVyZWdpc3RyYXRpb24p
LCB0aGUgZHJpdmVyIGRvZXNuJ3QgYXV0b21hdGljYWxseQ0KPiA+ID4gcmVzZXQgdGhlIHNvZnR3
YXJlIHN0YXRlIGFzIGl0IHdvdWxkIGluIGEgdHlwaWNhbCBHVCByZXNldA0KPiA+ID4gc2luY2Ug
d2UgYXJlIHRyeWluZyB0byBzYXZlIHRoZSBzdGF0ZSBmb3IgZGVidWcuIEhvd2V2ZXINCj4gPiA+
IG9uY2UgdGhlIHVzZXIgdW5iaW5kcyB0aGUgZHJpdmVyIHdlIHN0aWxsIG5lZWQgdG8gZ28gdGhy
b3VnaA0KPiA+ID4gYW5kIGNsZWFuIGV2ZXJ5dGhpbmcgdXAgZm9yIHRoZXNlIGV4ZWMgcXVldWVz
IHNvIHdlIGRvbid0DQo+ID4gPiBsZWFrIG1lbW9yeSBvbiB0aGUgRFJNIHNpZGUgKGUuZy4gTFJD
IG9yIExSQyBCTykuDQo+ID4gPiANCj4gPiA+IEFkZCBhIGtpY2sgc3RhcnQgdG8gdGhlIERSTSBz
Y2hlZHVsZXIgdG8gaGFuZGxlIGFueSBvdXRzdGFuZGluZw0KPiA+ID4gbWVzc2FnZXMgb24gaG9s
ZCBkdXJpbmcgdGhlIHdlZGdlIGFuZCBnbyB0aHJvdWdoIHRoZSBHdUMgc3RvcA0KPiA+ID4gZmxv
dyB0byBzaW11bGF0ZSB0aGF0IHJlc2V0IG9uIHRlYXJkb3duLg0KPiA+ID4gDQo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KPiA+
IA0KPiA+IFBsZWFzZSBob2xkIG9uIHJldmlldyBoZXJlLiBJIHRoaW5rIHRoZXJlJ3Mgc3RpbGwg
c29tZXRoaW5nIG1pc3NpbmcNCj4gPiBvbg0KPiA+IHRoZSB3ZWRnZSBjbGVhbnVwIGNhc2UgdGhh
dCBjYXVzZXMgaXNzdWVzIGFmdGVyIHdlZGdpbmcgYW5kIHRoZW4NCj4gPiBkb2luZw0KPiA+IGJp
bmRzL3VuYmluZHMgaW4gYSBsb29wIGFmdGVyLiBJJ20gd29ya2luZyB0byByZXNvbHZlIHRoYXQg
YW5kIEknbGwNCj4gPiBwb3N0IGEgbmV3IHNlcmllcyBhZnRlci4NCj4gPiANCj4gDQo+IFN1cmUu
IEp1c3QgY291cGxlIG9mIHRob3VnaHRzIGJlbG93IHdoaWNoIG1pZ2h0IGhlbHAuDQo+IA0KPiA+
IFRoYW5rcywNCj4gPiBTdHVhcnQNCj4gPiANCj4gPiA+IC0tLQ0KPiA+ID4gwqBkcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jIHwgMTUgKysrKysrKysrKysrKysrDQo+ID4gPiDCoDEg
ZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gPiA+IGluZGV4IDVlYzFlNGE4M2Q2OC4uMGJiYWUz
MzZjNzIyIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJt
aXQuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+
ID4gQEAgLTI3Niw2ICsyNzYsMTQgQEAgc3RhdGljIHZvaWQgZ3VjX3N1Ym1pdF9maW5pKHN0cnVj
dA0KPiA+ID4gZHJtX2RldmljZQ0KPiA+ID4gKmRybSwgdm9pZCAqYXJnKQ0KPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoHN0cnVjdCB4ZV9ndCAqZ3QgPSBndWNfdG9fZ3QoZ3VjKTsNCj4gPiA+IMKgwqDC
oMKgwqDCoMKgwqBpbnQgcmV0Ow0KPiA+ID4gwqANCj4gPiA+ICvCoMKgwqDCoMKgwqDCoC8qDQo+
ID4gPiArwqDCoMKgwqDCoMKgwqAgKiBJZiBHdUMgc3RvcHBlZCByZXNwb25kaW5nIGR1cmluZyBk
ZXJlZ2lzdHJhdGlvbg0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgICogc29tZSBxdWV1ZXMgY2FuIGJl
IGxlZnQgaW4gYSBiYWQgc3RhdGUuIEVuc3VyZQ0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgICogdGhl
c2UgYXJlIGFsbCBjbGVhbmVkIHVwIGJ5IGdvaW5nIHRocm91Z2ggdGhlDQo+ID4gPiArwqDCoMKg
wqDCoMKgwqAgKiBHdUMgc29mdHdhcmUgcmVzZXQgZmxvdy4NCj4gPiA+ICvCoMKgwqDCoMKgwqDC
oCAqLw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgeGVfZ3VjX3N0b3AoZ3VjKTsNCj4gPiA+ICsNCj4g
DQo+IEkgdGhpbmsgd2UnZCBuZWVkIHRvIHJlc3RhcnQgaGVyZSBhdCBtaW5pbXV1bSBhZnRlciBj
bGVhbnVwLg0KDQpZZWFoIHRoaXMgd2FzIG9uZSBvZiB0aGUga2V5IGlzc3VlcywganVzdCB0cnlp
bmcgdG8gZmluZCB0aGUgcmlnaHQNCnBpZWNlcyB0byBpbnNlcnQgaGVyZS4uDQoNCj4gDQo+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gd2FpdF9ldmVudF90aW1lb3V0KGd1Yy0+c3VibWlzc2lv
bl9zdGF0ZS5maW5pX3dxLA0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4YV9lbXB0eSgmZ3VjLQ0KPiA+ID4gPiBz
dWJtaXNzaW9uX3N0YXRlLmV4ZWNfcXVldWVfbG9va3VwKSwNCj4gPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSFogKiA1
KTsNCj4gPiA+IEBAIC0yOTUsNiArMzAzLDEzIEBAIHN0YXRpYyB2b2lkIGd1Y19zdWJtaXRfd2Vk
Z2VkX2Zpbmkodm9pZA0KPiA+ID4gKmFyZykNCj4gPiA+IMKgDQo+ID4gPiDCoMKgwqDCoMKgwqDC
oMKgbXV0ZXhfbG9jaygmZ3VjLT5zdWJtaXNzaW9uX3N0YXRlLmxvY2spOw0KPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoHhhX2Zvcl9lYWNoKCZndWMtPnN1Ym1pc3Npb25fc3RhdGUuZXhlY19xdWV1ZV9s
b29rdXAsDQo+ID4gPiBpbmRleCwNCj4gPiA+IHEpIHsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAvKg0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAq
IEtpY2sgc3RhcnQgdGhlIHNjaGVkdWxlciBzaW5jZSBzb21lIG1lc3NhZ2VzDQo+ID4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogbWlnaHQgaGF2ZSBiZWVuIGFkZGVkIHdoaWxl
IHRoZSBzY2hlZHVsZXIgd2FzDQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICogc3RvcHBlZCBkdXJpbmcgYSB3ZWRnZSBldmVudC4NCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKi8NCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4
ZV9zY2hlZF9zdWJtaXNzaW9uX3N0YXJ0KCZxLT5ndWMtPnNjaGVkKTsNCj4gPiA+ICsNCj4gDQo+
IEkgZG9uJ3QgdGhpbmsgcG9zc2libGUgdG8gZ2V0IGhlcmUgd2l0aCBhIHN0b3BwZWQgcXVldWUs
IEkgdGhpbmsgaXQgYQ0KPiBidWcgZWxzZXdoZXJlIGlmIHdlIGRvLg0KDQpIbS4uIHNvIHRoaXMg
d291bGQgZWl0aGVyIGJlIHdlIHdlbnQgdGhyb3VnaCBhIEdUIHJlc2V0IHByaW9yIHRvIHRoZQ0K
d2VkZ2UgKHdoaWNoIHNob3VsZCBoYXZlIHJlc3RhcnRlZCBhdCB0aGUgZW5kIG9mIHRoYXQpIC0g
d2hpY2ggaXNuJ3QNCnRoZSBjYXNlIGhlcmUgLSBvciB0aGUgam9iIHRpbWVkIG91dCBhbmQgc3Rv
cHBlZCB0aGUgc2NoZWR1bGVyIGZvciB0aGF0DQpxdWV1ZS4gU2VlbXMgbGlrZSB0aGVyZSBtaWdo
dCBiZSBhIGJ1ZyBpbiB0aGF0IHBhdGguLi4NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gDQo+IE1h
dHQNCj4gDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChleGVjX3F1
ZXVlX3dlZGdlZChxKSkgew0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgbXV0ZXhfdW5sb2NrKCZndWMtDQo+ID4gPiA+c3VibWlzc2lvbl9zdGF0
ZS5sb2NrKTsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHhlX2V4ZWNfcXVldWVfcHV0KHEpOw0KPiA+IA0KDQo=
