Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB4BC25B4F
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 06:15:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37F710E0FE;
	Fri, 10 May 2024 06:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D5Hrg3YH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6218F10E0FE
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 06:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715321708; x=1746857708;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3vRmKo02/w/TRK51cFwAGBRROeVVU+Q29c7bv/7mdV0=;
 b=D5Hrg3YH4weYeZSsPIxI6RvJndGICYZtuvBsgL17HyGSV3jHcnxXIViq
 i/PeBUik9Jfouh3Oto55s5nGdMlKfINRt5EAkhPRJynjJnIpAjyBm3Ekr
 oAyum404GzBfbZ7t+1NmvruPuEJRXWyW4tlc0+YmbCUqg21DfeSEuxhIY
 EHMPxS5ihYpAqeWesynIkHSn9fHVvmybmFj9PonIOkY1q/P2xZ8vpiAQH
 33UBSl/9sTgEaIjUA+/IGgWJPUlmmlVlWAW87iloKmXzAJAo/Pxb1HH3N
 5/52TZ+KfR1fQPdU5ip2l5ZxUAXPzmxGArw931Y8hSUvgS49/Ou4zA1GW Q==;
X-CSE-ConnectionGUID: lQavripgRueNeQyNWQFF0Q==
X-CSE-MsgGUID: lKzQif4wSW6eqjMteFJXuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15119325"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="15119325"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 23:15:08 -0700
X-CSE-ConnectionGUID: VTl0kwfHSIWAR1TdylUvDQ==
X-CSE-MsgGUID: mEdtlF3OSKWRLNhSJManGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="29885231"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 23:15:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 23:15:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 23:15:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 23:15:07 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 23:15:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBjRPx4OYdDNEcVczf9+4CaVuNUMZO+4SNI5bJF/VgtkiS7TutBsDaEdQOXrTQUkONf0cLsRPt7L+24ZBM6ovO25EstiYU04MLKiLtLLgvj1gqOyUp4MIY31yChhroLskVbHGi79SHbOI/x2lA6P9+DAwqDls5GvvwKYGeOBBOIZV3BxTR88ZU1yrO9JH+590B6uQj35z9lEea88xHWY7wd2dxaILDyfk3cI3EXsRuH/CuhMDtcaAiC5QUe0+nRTWTeNIRQNW/kNUJAAZY6L3vxN/kt2nFzwcrrvNAVATYRGcMwjdcxp97+2JL+tWNzxbe1jDgeNhiYjvZkNoeFrAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DRjBMCwPdmvs+BTKiLxFbthwa+ZPzb3xZt/9t0N6BQ=;
 b=GEXK0JkRe5gGCh8WE3gnSI8Xb082VSXlmhmuDa+EnB8uqUJEXKl31Fj/MIu9TI0jjIAxmF86HKWzDTKGm+Uwo+bzl9dFzReHGtZvTjxXQVsdxpfv/VYCC5WhjFlDYv8N9TCw5ufXOEEjH9skBz45jcLkIDL4teWgOcXq5P0lPAoVCib2RL9Lc40r4OmffZhwDz9esGBUzlRE9sMLBO8ZZdCAy+ZUKQoEMw0lH++/uokepnjPEB8FtiFg10k34DsHk6AvgBu4QYK5zEh5PIUCsz2k9YQGzX8FPBYW+a4/hsImODR7JeDcZ2ZO/e3/IAtE/6FLQCsX0QGEnS9YZ8KKHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA2PR11MB4828.namprd11.prod.outlook.com (2603:10b6:806:110::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Fri, 10 May
 2024 06:15:05 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7544.048; Fri, 10 May 2024
 06:15:05 +0000
Message-ID: <2ffd302c-db00-4547-b272-4592ea2445b9@intel.com>
Date: Fri, 10 May 2024 11:44:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] drm/xe/hwmon: Update xe_hwmon_process_reg
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Karthik Poosa
 <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>
References: <20240405130127.1392426-1-karthik.poosa@intel.com>
 <20240405130127.1392426-4-karthik.poosa@intel.com>
 <2rghstrxzerqq74k2papk3nwafptzsfzgli7ceyf4shstmejy6@n4efergznjwb>
 <ZhWOV9puU8o3-qZM@intel.com>
 <yow562hwodxuhhobwndyphp52espvswyecjzzcncpo5xvghjho@f6tly3xklwjo>
 <d33c69fb-c84a-4ef5-a28c-b0190b8fef65@intel.com>
 <ohb6qlpknazjbaqf25sevflq5gtuxge4m4jle54szsnucwq6rd@l5qrumod4a5t>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <ohb6qlpknazjbaqf25sevflq5gtuxge4m4jle54szsnucwq6rd@l5qrumod4a5t>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0143.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::28) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA2PR11MB4828:EE_
X-MS-Office365-Filtering-Correlation-Id: ba6e1c3c-d2bf-43fd-e900-08dc70b888f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmNlaTFma0JZUkVMekpuMldLcFF5TTBhamlYTGI5VTRGVE9vWHdkNEhqRnFL?=
 =?utf-8?B?dEpHODdhSFhtT0RzRFhQQXFxUHJncHVYazlkRFA2c1J3MVdobXFuRjFYVkc3?=
 =?utf-8?B?OGJLZGM3M0lNem5RUFcvTlJCNmFvbG15WkUwYktwZHJmVm1IVkdiWWluVjd2?=
 =?utf-8?B?dVNlNmppcCtoRk5JZVV3eXlHY2xJYmRCSW1aajdJSCt2eWI2L21PY2ZGYlZG?=
 =?utf-8?B?TTRtMWRxZEd3MnE3cVRvK1hqYmNoNkxCVDlYMXlHQUI2bVBrbURrMVhESmVD?=
 =?utf-8?B?cEVBMTdlUzhzOGVBemkzVzNKdHpDbk9tUm1ZcWFlUXFLdkowUk0zeGlxanMv?=
 =?utf-8?B?OGtiaGhEV2xIbXVsTDd2ZFluOWxCVm03RnhGZUVkZTJ2YzZ5WktTWHBqSmZI?=
 =?utf-8?B?QThwNnFLOE5idFJXdGJxY1h3QmR2eWo4QWhyL21lRVF3NUJYaWJoTkd0bTkr?=
 =?utf-8?B?Zmt2S2FoQ0ZRa2FMemRTSllHWmZzTVQ2VjBhdytzN0NRUEVGcHoycVd6aWFw?=
 =?utf-8?B?RFhpYVp1WEJiT3JzRFh4OWJKQWhMNDIwdk1GTzM3Mnk5NjBZY1Yvc3F6elpn?=
 =?utf-8?B?QWV6ZHoyUVFST1YydlJDeDFXdy9NSytBSkZVVHRWb0JiOGloL1p3K3pma0lX?=
 =?utf-8?B?STFRUk5TSDZDOEd5dHRVTzZYWnk0TlpmeW1sWlU1WmVrSUc5N0dLT3BQN2lv?=
 =?utf-8?B?OVdxNTFEK3Y2ZTc1UzZqSzloN3NpRmh5SjBsWEtQZ3QwOHZNVk9VenJrSkQ1?=
 =?utf-8?B?TXNCZy83UlZ0dDQvUDIzaEMvNmdLTG9ncmpERzZ2a2d0UHdWQm5UM2cra2V5?=
 =?utf-8?B?Yjdkb0dlMU1tNEMxMlFWOXlaaC84NVY0bk9JbFZXZWd2dkF5ejcvS1F2MEdv?=
 =?utf-8?B?T2FtV28yaTA3cmh5N3V6YkQ0UXg0S0U0SjFoWUwrOHEzWGxSSDRERGozeVlP?=
 =?utf-8?B?eHZFMVJiMmxBeXRJTDZKVTVBOUhwNTZ6SmluRzZ6RDZWQmFzMTRrYS9Cb2lV?=
 =?utf-8?B?aGpBZ2Y0d1NJUXBIUUgvWGNXdlhHaGNEOVVVTW5lT0hkRnN4cm5QN1NTck42?=
 =?utf-8?B?ZitlekMvM2lnUk03cVZZQU80VnMyYjNZVFhEa0JPbHl2NW1oQlo1T3ZmWlFh?=
 =?utf-8?B?K1F4elRIMkUrZEF0cUdMSWlwVGVMSmtKR1B6TUJmQzdmQkgzdWJoZGNLWUx2?=
 =?utf-8?B?WTZWbVZoVkJoUm8zbE1CZTN3TDdZdzZKNS9VYy9ISHlNa25mN1VUVGdCWUw2?=
 =?utf-8?B?Y3JHVG9acitITXR3c2NXN2xWdlc3dDRuYzhhS3dTQUhSTzAyejVTZTFXSHJJ?=
 =?utf-8?B?NWZPdjgzMXNhcWlVRTZzbkJYM1pGZW1FaG5CYUxnL2VmZ3RBbjdVK0h5THFa?=
 =?utf-8?B?NDExUlF5aEQvdnQyaVJPQnkxL3JSTS9DaWhicExwNnUzTy9qc09KWGtld1dE?=
 =?utf-8?B?a3dJMzg5R2YrSStUTG5RY0ZZVTdOZHRZTWVodVI0bzAxSElsVWpOeWR3VG53?=
 =?utf-8?B?Q2tReFhHVnd3cFJoTEJmWGVLMFhNazBqMk1Ialg2cTVTanRTOUkxWklCQnhN?=
 =?utf-8?B?cDBnT0l0TEdzQTU3WVBFUGp3TEJwUXpONFd5NVZyaTEzdlU1Sk1TOGlCb2tR?=
 =?utf-8?B?YjJmdi9yKysvQnZBQVFtQkJqd3Z1SW9rZXoxZ2k2YStZWGNxdUJidUhrOGlp?=
 =?utf-8?B?ZTBMcXFLQk9pNmtob1BHbnFUUkV2VzZGVHY1VmIrRkJNb0RNTEZ6WXhnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2x3clZOOWp1T25XNHF4VGR1UFUrQlF4OUxlTFczU3BUY1ZwVnMxT1hJa002?=
 =?utf-8?B?Z2N3MG5SRFhYZ0I3U1NvZWJybFZaa0VzanNkWU9FY0JNd2w0THZXcUlaOUpI?=
 =?utf-8?B?K2dsS0Z2dWh1c09qQ0FKQ1YzSFFINzduQy9ZeTRQaFo2RWt1ZFYwbi9UdmpT?=
 =?utf-8?B?QjI3QmZUTFc2V0c4YURwQUdYL2FYc0JSczlzbW1ibkRkUTVkZTVKRzNyVHhv?=
 =?utf-8?B?NkpWOHdIRVpCS1d1WTVmeDluWE85WHlMYS9Ud0RVN1lReXpDSE1aTHdKRS9P?=
 =?utf-8?B?TVpoa1JMUG1xU2FZN2NsMk9Bc1VQejUva1drYzlXdGh2TzJXbXlmS3Z5Tk43?=
 =?utf-8?B?cVRpQTUvcjQ5eGNUYXgwRG9lM0JkMDJlTUhhckkwUXlMUzM1MHY2VGxyREgx?=
 =?utf-8?B?cW9mSFZ6eDU4UkdWajVvSXlEYk5ueU00S2FrM2VUeTJ1dGV5RStBeUprTEV0?=
 =?utf-8?B?blJiVDVRY25GL1JMRngvUTBJeDhkcHhuZzJJQUJ2VHVuY25XcExvcWxhS2Nz?=
 =?utf-8?B?cjl3M0Q4NE44eUcydTJYUTg4TGxaMFJ4bm5hRjArazRxNXdtOWlKVUFEUHlQ?=
 =?utf-8?B?N2dRMTlwbEZzMXdXQTBBR2NYNC9kRGtOZ1U2WlBFQy9yTmtZY01uWlhOOG9D?=
 =?utf-8?B?VUh5cXhhN0JuM0J3Zmk4eHdyNjhEUEJoSExHNVZrUmJNdjYyS29vblVVYTRt?=
 =?utf-8?B?aTZ5dDQwMHB1ZjNoZ09TdENvc3RWdkV1eUZSK1hrdklmRExiM05ndWNNK3Ft?=
 =?utf-8?B?ODl6Z1VVdlpTRDZSU2hEbUpVT080UnVzc0hYUTJ3Y0VyczhRYmV4T2JZaUt1?=
 =?utf-8?B?aVNHYk0wUVI4UUFMSC95bVV5U0x5ZjNldW1HdzgvcHI0Tk5nQTVlMkhqeVBa?=
 =?utf-8?B?a3o2REg1Sk85aVJSZXc5QXhpUUlDdm54d0Z3MFp2R1VUNnJZREZYclY5dWdO?=
 =?utf-8?B?aUhhSkxyZExWcGJ4S2JvRkxnNnQxRTlqb29RUVlLZnpUWDZWM2dsWFNWUXhL?=
 =?utf-8?B?TytNUWMvWkhoZEhwc0QxV0xibkJQYkpaSWVOeS8wK2Mrc1VwbGdNYTV6UnVL?=
 =?utf-8?B?dm1GVnAwMVV4N1hFVCsxNjFKak5aeUcwTk1DY05CWVdta3hMamFrNU1LSlF4?=
 =?utf-8?B?bE00QUwxMVltNGUxcFA4RmdMYWdUMGxxaEZNYnlRaXRrTkVWRjhna0o3YTdo?=
 =?utf-8?B?M2JhTlZPL1dxYjZNRk9qS2huMkNYTzdKK3E0TFU4eE4yMWlMSEIvb0ppbVNE?=
 =?utf-8?B?ME9rcDdva2pvSmxFck1QM2MxRXFTalk4MnNQcnFlRGY1NEYrUzF4akJ6SHRE?=
 =?utf-8?B?dEF1dDNyVWhUTW9lTFlMdkxnWmZVZk5CYkRQTDBMd3JBVEVuSTJzWkhSUyt2?=
 =?utf-8?B?TDUyejF5NmprNHgxd21MSnhXdkdrVS92b3h6NFVYQ0E0ZGNKOW5tZGp5bEtX?=
 =?utf-8?B?TnJxYnRXTm5pWXdRK21KNUU0MC9iV3d4dmppeE5JWGsxWVAwK2JDVUZTUXhk?=
 =?utf-8?B?NTRjMy9xd1hHU25JOFdUbDF0RDdWNjhNSXAzYTlnVDFkcGo5OW1DR1VuQzQx?=
 =?utf-8?B?UmFzRXkzNko5YjBqbml0N2dXU3lHTEthTnU0M0QwN2dldFd0Rlg1N0hRMzdx?=
 =?utf-8?B?L1psNUcwN1BNZHVOTzlRMmV3NVlUd2prVXJSbTloSHNBTUluTzQvNTJjbGFY?=
 =?utf-8?B?b2tWTVpWL0VGRUh2NCtIa08rdXNuU0svaGJhbXdrZVZUV0tCdmdLZ3ZYcjFB?=
 =?utf-8?B?RElHcC9OL3BlbmtKWkc4cDZFb05TWm1aTWhyeGFZbDFjSEc4eTZCUUNicXdp?=
 =?utf-8?B?eTQxc0UybUpxemZXanhiK0c5RnVIOG94RW1OQ291cjQxa0xMVk5HMWE1L1BR?=
 =?utf-8?B?bWRmTWk0Tkpja3hIV0hlWVlIWW82SlZDdkVsT2xDNG04K1d5L1pNa3ZXUHl0?=
 =?utf-8?B?TXFJV04yd2ZJZVpnRzJxcWRnYW40VTdhNlVsL054WnpCZ2dtUWszWnY1alRH?=
 =?utf-8?B?cGlXUTVZSkFTcUNuQ2NsaTdIeFQ2ZVJoYlBnMTA3YVJwNUZMM3hzdXk3VFZl?=
 =?utf-8?B?c1ArU2ZNVlRrVTZmNVVlQzVjVTdEMzExbTZ4Rk1ySitGNmVxN1drazllVEUr?=
 =?utf-8?B?TzZBbWdBZUUzcUhJL1NrMWZ5N0wxcnRid2YxcFpoY0pDeUZLSEMzVjdUQmVq?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6e1c3c-d2bf-43fd-e900-08dc70b888f1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 06:15:05.6798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QkntVDQ8aVDGYsUWiH0RvbMsbQDYQ2QZUZu5aFO9rIgkzsoulWc8W5N9RWvcQYatSN4ao6C4aiTtenevqMmy9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4828
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

Hi Karthik,

On 24-04-2024 17:10, Lucas De Marchi wrote:
> On Wed, Apr 24, 2024 at 01:46:45PM GMT, Nilawar, Badal wrote:
>>> I's my personal feeling. I don't like the pattern xe_hwmon.c is using
>>> since it's very easy to introduce buggy code. If someone wants to give a
>>> r-b and merge this particular patch, fine. But I do think this pattern
>>> should be changed.
>> Idea of xe_hwmon_process_reg to abstract the register accesses. In 
>> i915 we maintain register addresses inside the hwmon structure. During 
>> reviews that idea was not much likeable. So we came up with 
>> xe_hwmon_get_reg, xe_hwmon_process_reg.
> 
> xe_hwmon_get_reg() is totally fine. It is xe_hwmon_process_reg() that
> abstracts what it shouldn't IMO. As shown in the snippet, the only thing
> it does is to make it easier to introduce hidden bugs.
To xe_hwmon_process_reg effectively we should validate all the regs 
hwmon attribute is using. For power1_max attribute we should have 
validate PACKAGE_POWER_SKU as well. But PACKAGE_POWER_SKU is legacy 
register and on some platforms it may not be valid but 
REG_PKG_RAPL_LIMIT will be valid. In that case it doesn't make sense to 
block power1_max attribute. So please feel free to drop 
xe_hwmon_process_reg.

Regards,
Badal
> 
> Lucas De Marchi
