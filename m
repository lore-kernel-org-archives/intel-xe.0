Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3DD60A3830
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 15:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ADlGQ34T;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=fTtdzsu9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF6510EC25;
	Wed, 18 Nov 2026 15:18:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D84E10FDA6
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 15:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795015095; x=1826551095;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+T9Ogmcwhgpx+FQLAFQuf0zJapF7fYgl+glumJOPs7Q=;
 b=ADlGQ34TODQ27F6Z0jEZul34pcJk/rSy91lf0/CA2p8ax8fH/pGABayy
 j+ygJyO+pbAyWzSHEKXa9rM6gl5XK4ozwzahcfGcJU2pPrXUSKXY0yT8k
 WCCa6cBtvk/VcLTNJ9rw3t1PnN4RAOBjX9Gcat5nn47bg1mdBEDvUdzq1
 VD03LuPnYFwAlPklgjysj/88X+ixVb3T1SLOClzUegp8pTQ5KA1AWoWNh
 CkADiwOacibeVq/kvpOldls1+vKiamkZMM6EtK7psEMGbArpQPWUWsTqd
 UZEBNyzoL0dJYIcXZ8En7dXAt0FyjJev6J84dYC6x1qPtog817RhT2JjY g==;
X-CSE-ConnectionGUID: I0sLF4ZLS0a5Qdsm3vAvrQ==
X-CSE-MsgGUID: wT+tcbRdTM6fMgXyuH3PfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3830391"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3830391"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:18:15 -0800
X-CSE-ConnectionGUID: oflGlddaSauwapDitYoPWg==
X-CSE-MsgGUID: KRCSlxuwRpueG6XYRP07JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="11900327"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:18:15 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 07:18:14 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 07:18:14 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 07:18:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6/h17Owm7caMsAPsOf2l+geVSpCMByp5juROhu6Up1T3eXRtA2lf/lS3/eJHavv3Y60H0cwGMnuzHPNSqSDphbNrwAXq+gEAfPWXDmTB0L7opyyKa7Ypidno1Ux8iXM67T/RtXQmNT6XRMi5FK5jDLO/ZEl6HsoTUGHFvHgKcIBTiQFNPvSxayNiLSDjIwYPo2zx3ImtJEKgTE/mBSN6y8EwrIHAi/utY7H5a1jTka92Rg2RWw8CpzH41iFHDslQsdhTiheH+rmsJGpKCCmwLlo4ezKuNaT+PnMe3ktPhrB9PdGaqjRL/UOBHYxNB5nLeXT3KW2XkXuKqlOzrvIjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXO7k/wz2sgh+WePlK1iSE0M2lycuVCAW4xf1c8FIPg=;
 b=eeKJT58JQ5DkOfXBDzFgAmz5yT8dXDd4nIFaDzekwj7JiSbDzp/MMbkatWGZUJxSDSD6qJq7Skk+YUDvzd/CBPWonGLmkBzHL8btKDwf2JjNwIU2yYjPI0IAUhjuFtKwhzq434Cyuc+SiT+nCk+Qhn2JGQLCQV8YoS93KNwXaLE3U3WuhiaZYPCM5sVXLETBZVGDpUw8MXMeViifctl1910IyQcEuarV+sDb0HmIe6M6LtK9Z82zogCInv1CTF2Ag/XyTbEi4RmwTMeskb6XdF7KgOF0yS1d65TU6oelbhRX+g2hsmHuKXMxOOFkmacvN/ulFi8a/XGvkEdD9dntPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXO7k/wz2sgh+WePlK1iSE0M2lycuVCAW4xf1c8FIPg=;
 b=fTtdzsu9/yedmINVcKxw1CyU74yWCqQS70S3nskpt05eoyEwLyr7NyMmWdP0rYpZ5ooGgCVjuYi9sTBa/AozaiThCudDv+F8Bu6lyZMOoVru17NB5fi79tzLoEmJF+IhlfTfsGpC7vK0y3TGS8rNoOFudvusZ5IUdsNAEcmmouc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS3PR11MB088214.namprd11.prod.outlook.com (2603:10b6:8:43e::10)
 by SN7PR11MB6559.namprd11.prod.outlook.com (2603:10b6:806:26d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Wed, 18 Nov
 2026 15:18:05 +0000
Received: from DS3PR11MB088214.namprd11.prod.outlook.com
 ([fe80::ca0:ae4:8e4a:85f3]) by DS3PR11MB088214.namprd11.prod.outlook.com
 ([fe80::ca0:ae4:8e4a:85f3%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 15:18:05 +0000
Message-ID: <bbcf2436-fa6a-4fa0-8de4-90e54a7a2b8d@intel.com>
Date: Wed, 18 Nov 2026 20:47:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_late_bind_fw: Skip OCODE late bind if same
 version is already running
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20261117125904.2877468-2-sk.anirban@intel.com>
 <avxyUc1VLSYm7DbG@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <avxyUc1VLSYm7DbG@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0260.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::8) To DS3PR11MB088214.namprd11.prod.outlook.com
 (2603:10b6:8:43e::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PR11MB088214:EE_|SN7PR11MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: c583dc27-6840-4a80-72c6-08df458724e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261009223027099003|22082099003|18002099003|261009221227099003|11063799006|56012099006|4143699003|261026140227099003|261102123227099003|261028144727099003|261026121527099003|261021121427099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info: AFjb1RxrT7IMdp8kL6RwXdFGDl98gypHnRsDivx27qEU9FdbG61eJlupwIwbw4Dw3u/DXCNZFKfCxrOkQ7af+D7i3OU5wQ6XERkQPHwBIszLuq5z/SUoVq/uO1UjOway+YAYVWXLPzddwKLCL4OND0XzvotlVqgo8r0XnqQ5QxShgsZ7rxHjWLRunKiVyFl3yGvK2LAtO3JKdnZXrvJpLkceOA0bKsJvBqBwhkPTe8BhwqUKGEA9J1mk2bq7kJczh0yGzhmQgIGrrfRUz8V5Z/t8MSoKsal7KiOUgfRY1idK2BgJ3fBjWfb/u7ALNQArt6O/D5F/d602w9ufrz0tTc0dd4OTjrkG5mNLwF3VkG4tRSlrJWxrQK79eM5HygNBghAKvqfd9r5XKFBxziktWM0XVFMDyW5THuT7fVhbe7h6q3linL76YShPHoqGn5rPrqlL8xtrwB17dIg36OEUoslNqo4177tU/sVxPoc2++m2BgznDuFg9O9pI5Y7BlzvSdV+gWDEX+vLipzSEncHUHf2l1Ws9TFfhH9BAYrBwzRvQhSvzJ4tKOjn29X0OGntjq962XH63UiBFEViTaCwAXs6Tz/TV8OM0KgtQmuZrdnxJJ39K1T+0jRk7ci6JEKzt0BCzCBoMPZUrfSr7+HZLA57XelvvWz2pQSkWp/nWzU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS3PR11MB088214.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261009223027099003)(22082099003)(18002099003)(261009221227099003)(11063799006)(56012099006)(4143699003)(261026140227099003)(261102123227099003)(261028144727099003)(261026121527099003)(261021121427099003)(261022105027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1Z5ZmdrcHZnU21MSXNwbFZWdVVoVDhGT1RCOGgzWDVaR3VtMzNrT3UzVk1r?=
 =?utf-8?B?c1BiYVpMTUpMSnZtYkZKVFVhUjN5RkNPZTQ5MEUrUm1MbllVQjJaRERsV05I?=
 =?utf-8?B?a2FqaTkxcGwwSCs2d0FGOENvNjZydER2QnkvblloMjZEZTNBQzZqUnJ5Sms3?=
 =?utf-8?B?akhDVWNZaUZqMEdmeWlOVzU1ZDBYYWllWDBsb3ZtcG1HdFlNcll3bEthTHVu?=
 =?utf-8?B?bzZpQllLTEtFUVBHVUY1Q2Fob20vUnNkODNnU0Q4TERZZ0I0TldHemJHVGE1?=
 =?utf-8?B?Y1BLTHJDelF0VzBwcVdjTUdybTh1T095bXJpMmZDb1R0VlV0OG5EUnRlcFVW?=
 =?utf-8?B?OWNnWVdnc2l3NzNNS2hKSUxRWTlWMWZBNStXRFF3QVNoRVloRncrcmIxYThC?=
 =?utf-8?B?Z0xybXhyVnNiNnQ4UnBtbFVsSytmeFpLbWNXM1Z1MitIK280TUNtMnRwdGdW?=
 =?utf-8?B?dmx4ZzFERGQ4ODJwM3cycEhPckFhWStGL053QjhzZHhIUlhYR29NQXBvdENX?=
 =?utf-8?B?RUVhRWdnUEdPODhJTTRWZDc3cGg4NGdtV1FzOThzSEdOUlVsMzk0cTRIa2hD?=
 =?utf-8?B?UUxlZko3YW5wcHlCVkpUTjdYSWZMaWozOHBkK0xBMW1INXJHQk9leWZKLzFq?=
 =?utf-8?B?UkZZSWZuZ0dzWGNxclVhTzZuZFEwLzlWRGJERkxDeXJTcDB5M0hjUklBU3Zs?=
 =?utf-8?B?eWVNeERsMWR2WFlRQlNncnJhODI0Vm1zQzdGWTA0Q0NDMklnb0ZHZ0hheHFJ?=
 =?utf-8?B?dWJkS2duZHVzZERicUtrU0lmQTlBbzVBSkQ5NU1FcE5HTCtXSE1yZmFzbm1P?=
 =?utf-8?B?dWpCOXkyYnppVFRNWmV6T1NJcnBUbkxNNmp6NkZETkQ5YngremVOdUxXck1S?=
 =?utf-8?B?MEswYVhid3pDdkZSTGZ3cDcvTlZaMHI2ZnA4cUdOSUlnYjNjaEZRdCtUTjdl?=
 =?utf-8?B?U2Y0bmNubFVPUlJQTFRsQVpiRDJPZ2ZhdGRjdUdqOUU5VkFXcy9YYTM3aEFz?=
 =?utf-8?B?N2hJSmQwMHJpZ0IveFE1VDh5K3VIRTVGbXNxbk9KSXdNWWZWTndaL1ZudTh5?=
 =?utf-8?B?Q0syV3pTOUtWK0YxTERGQURuRWVMUVRBbmZDdHJMa3ZpSUlMRjQ5S2hrQTEr?=
 =?utf-8?B?K0l1L0JDalc5S2tCNEZoTUsrOU9tTFJvUG1EZGpMMzVmOWtOYTdvbTRqeGxN?=
 =?utf-8?B?dW01TnV0cGxPQjRBR0dvenlFTjdvZVc4TW1UK3RsRmFNd0pHeVpPZVBtMm1C?=
 =?utf-8?B?Wkh2bldzSXNrL00yRmVsWVZicjZhMjNuWTdxdXR3L1ZLbVhENUdJOXl2TTYv?=
 =?utf-8?B?RHhkSlR4bEVJZkFCdDhvNnlBTFVlUU5iUjZra0tla1FBWHhnbG1nSGRZdGVX?=
 =?utf-8?B?bVR3TDlqSHVyc3UvTmtUSlppUEcyZ0kvOEJmU2t0cmdmeDdYaXNQRTJQWlhR?=
 =?utf-8?B?OGxNb1RCSDJYSlRhUFpHZk9tWDNFNldTQ0l3U0ZBamlYMG5YZy9tQnc0RE1K?=
 =?utf-8?B?dWJhbktXMEdRTnJDOXFNM3liaHRHR1NEdThucFN1YWMxSFlkQWpya0IxREtR?=
 =?utf-8?B?eUt0QXBVUXhzZkJxR3poWmRYNjVjd0xCVExvdWd2VWdwRlhBdnRuVCs5aGlR?=
 =?utf-8?B?ME16U0VrQllDOTJLQ1p4czRPUjBKdEdyREgvRllBSms3b1FFVmtncEJKK2F0?=
 =?utf-8?B?RVVFdDNyaWg4V3JtcEtEZmNXbnc4Zys5TTJtZ0hGSUlHTDZ6VFFjZEtQVHNN?=
 =?utf-8?B?ZWpFS0t2UVdveUpOUEk3VkxyZHFkZWpSK0ZqR25YTkZXT2ZhYWF5Q1pqWDQr?=
 =?utf-8?B?RHE0OW01akNlN3RBL25UbkxXaW1aaWpsWGFvazFXVVAxeHVzd0Z3Q2pGbHRa?=
 =?utf-8?B?TUZBY2t0RjQrVEVkMWdKQWE5RnhvUVJFd004OHd2VE90UzBuVm8xL3Y2Z21D?=
 =?utf-8?B?by9WRHRmdmtTYU1aemgrK0VNcEtZaTNYNzlzU0RKazEwbWJuS0J2L2EvUVIv?=
 =?utf-8?B?empRRFZWRnhoVWtmUWFGbFRlbmUybGRoNjhZaVpoSFRNcEJkakVWNXMrckZQ?=
 =?utf-8?B?SW1SbVVvdGd1emV6SWZtVjZXamEvRlUrWDJvUmNTTWxRcjNid3RRdllyMFp1?=
 =?utf-8?B?cXI3TUQwMTkrZ0s0WVhIdVF4Tm84TzZkeDVDMFlDSzFQUjBBSEkzSU9HaXFY?=
 =?utf-8?B?U0JJc3FleE9pSWY2dlhWSTJxMGpFSkhnUTdYVkdndk5hSDNKN0xWamZzREYz?=
 =?utf-8?B?enVWUG9mRW5BV1RVeXBhODZHYWNDSVVvRkFrRDhNc0g5WWllcWg4Uy9pZ1RB?=
 =?utf-8?B?dlZiYXdVVUNpMXBCeUkyZDlGdDI1dEZlRGppb20xTnpVazhudFNydz09?=
X-Exchange-RoutingPolicyChecked: mGbRTPv3kDpeGPYJz4PENdAga4vlHu9Lty6y1vm+aSWdHju04aE683/1W9khTyb3K9yLr4ykIUHTdRHeaF5dv49S8ghq18r5llFOnXHFPAxD2SXQOqQteEBVhRA6EoPMor2SeBx/cZDB9H+miFJHt72Zwaio4Zk3Xe9AH5w+lPurNUz0m/Lss9XRL4kFPttVIHh05jhf/9pNgdUc/MXtV8VxxqSYpdbiiznTgQ8DghvUjyNtL6t/A7kzb8+LTFBKfjKZkzcZZY8ynm+ZqCSkuSiA+1lm3/M0Sbu5R6b/c6FbY/CrHsodNVXx2BnID/9cQW1f95qPaVLzT15B8ATDug==
X-MS-Exchange-CrossTenant-Network-Message-Id: c583dc27-6840-4a80-72c6-08df458724e1
X-MS-Exchange-CrossTenant-AuthSource: DS3PR11MB088214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 15:18:05.2711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BYf5smrCGCbXaiz7btFuJsW9S7XY6bVIZ9DGo2SKIc9Mud4MS/htAEoWdxal6/BNpD2zrw5vs1vz2iwLeVJPAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6559
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 17-11-2026 20:57, Rodrigo Vivi wrote:
> On Tue, Nov 17, 2026 at 06:29:05PM +0530, Sk Anirban wrote:
>> Late binding currently uploads OCODE without checking what is already
>> running. Before the upload, check whether OCODE is initialized and
>> compare its version with the payload's. Skip the push when they
>> match.
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_late_bind_fw.c | 31 ++++++++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> index 355d7c841871..4b8c48871d8c 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> @@ -246,6 +246,31 @@ static void wait_for_worker_completion(struct xe_late_bind *late_bind)
>>   	}
>>   }
>>   
>> +static bool xe_late_bind_ocode_is_current(struct xe_late_bind_fw *lbfw)
>> +{
>> +	struct xe_device *xe = late_bind_fw_to_xe(lbfw);
>> +	u16 running_ver;
>> +	int ret;
>> +
>> +	if (lbfw->type != INTEL_LB_TYPE_OCODE || !xe->info.has_sysctrl)
>> +		return false;
>> +
>> +	if (!xe_sysctrl_is_oobmsm_fw_ready(xe))
>> +		return false;
>> +
>> +	ret = xe_sysctrl_sdk_api_version(xe, &running_ver);
>> +	if (ret) {
>> +		drm_dbg(&xe->drm, "Failed to get running OCODE SDK API version: %pe\n",
>> +			ERR_PTR(ret));
>> +		return false;
>> +	}
>> +
>> +	drm_dbg(&xe->drm, "OCODE SDK API version running %u, payload %u\n",
>> +		running_ver, lbfw->sdk_api_version);
>> +
>> +	return running_ver == lbfw->sdk_api_version;
> This is always true: __xe_late_bind_fw_init() already drops blobs with a
> different SDK API version. It isn't the oCode version either.
>
> Overall we need this behavior, but it needs some changes. Please:
>
> - Drop the sdk_api_version check (it also saves a mailbox call). Just check
>    xe_sysctrl_is_oobmsm_fw_ready().
> - Subject: "Skip OCODE late bind if already running".
> - Adjust the commit message to match: if oCode is already running, keep it;
>    a new blob takes effect at the next device reset.
>
> Thanks,
> Rodrigo
Yeah, for the D3cold-related calls, we don't need a version check. For 
the other cases, we don't currently have mailbox support to determine 
the running version.
So, I'll split the patches for now, and we can add the version checks 
for the remaining cases later based on the requirements.

Thanks,
Anirban
>
>> +}
>> +
>>   static void xe_late_bind_work(struct work_struct *work)
>>   {
>>   	struct xe_late_bind_fw *lbfw = container_of(work, struct xe_late_bind_fw, work);
>> @@ -258,6 +283,12 @@ static void xe_late_bind_work(struct work_struct *work)
>>   
>>   	xe_device_assert_mem_access(xe);
>>   
>> +	if (xe_late_bind_ocode_is_current(lbfw)) {
>> +		drm_dbg(&xe->drm, "%s firmware already loaded, skipping\n",
>> +			fw_id_to_name[lbfw->id]);
>> +		goto out;
>> +	}
>> +
>>   	/* we can queue this before the component is bound */
>>   	for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
>>   		if (late_bind->component.ops)
>> -- 
>> 2.43.0
>>
