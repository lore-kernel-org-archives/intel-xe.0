Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F032EDE9AB
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:28:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A59310E8E7;
	Tue, 10 Sep 2024 18:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J8UEjBMH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A43A10E8E7
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725992896; x=1757528896;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Dyh8BHu/K2qvN5LoorlEBTmUVaMia4g02gdSroQ6X1I=;
 b=J8UEjBMHxqiTYyAFArWDMc9O6QGVVBRvCP+QqaPMQsUFMrhnO1+ZgOem
 4WVokIMuqgLzrypVsshP2tpEuJgh58r4wgDJM4OfS9OU+N3j5gskL25P4
 caLLxlbIsCTv+X3voyEiLw1e8SOLs5We/ad/Tw0CvzGskIMDAJGO638gK
 lVwiAhcMD7t+J+L/T6jr4hLKYcuQTITFqD3K9Opmh0HXAKqKsn+Nns+9p
 +TVYdJaXOlm/heLQNd8suEdn142yC9ZFzINE/CG9SegWHHfZlIfI9BL/g
 jGPjw13HTP6m/q8n580QCiwIZfzpa1Q+nW3MLLgB4KmhzFF6/gogV9rUc A==;
X-CSE-ConnectionGUID: MZVNf8TYRDijo4C/pcKOmw==
X-CSE-MsgGUID: +YumE+TUTnaaMNYl+pH1CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24902369"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="24902369"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:28:15 -0700
X-CSE-ConnectionGUID: uW3RMoGjSSOeHF4XevKwvw==
X-CSE-MsgGUID: lvkG1zbRRJKIffsPGKhXlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71736828"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:28:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:28:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:28:14 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:28:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wi+C3ThmYrUjJxaEP7AMmrCuvcDCnrod3Wz5foPWbOCt/LIsnsUymbBoeAAwxOCZT0ygTPhRMioTMD3aX/z10PeXqJU3M/cbwxYbaKz0LwzizKN/R2aboVFuNpX0GEKc0nj4P3jmxEgXsDf9kvdFgkDoV+KfXKepT5vAZ8mXgt7aXaxP4idHUlQZwKj3v+f3ZlALeKgfcxk3tVG8airyBM5Oxe1ENFvc3huYx0quCxTgpnQbbKE0EntYRgiy3nYOChFErZEJn2HAvozj9mrh+aPFXrW8yx4YxZC4JiW1CjX4POT+peBMAoRo3L278+wAyFXqn587BMWSKLGhv/WDkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBO5KqVN20ZTvTSreoxRfTuT/HPrPI951RlnUHj4pDI=;
 b=POb7LquRnUjt6qArCC4UCPbWx4pEMihryacWx93cI5/4H7vFUzw+AYLM46kiGaB93k2Yypa/5vR7x0Gbf59GjW5rRgW5yC6k1/W80ZRH6wXbxyQS+yxF4C7KObLszoldyQ9XFvBSdtLbPz9QyuR5KKQZtDLOeGcmKPlxvELAqJzuZCOpmSe27K8WFOEE3BFhKoLWXSC2o7rNvwLgQ02vr+I7z33+uRhSz7ymiXSEqy0qHl9aOinSWuqct5AlKxRhAWnR3xd4EmmYDexo+jvPbUdNBtQq4vZRfBL6YpohhxotxIu7X4JaW7c6VGHk2r4OJ33GLi6Qbjf0mkiq4m03NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS0PR11MB7786.namprd11.prod.outlook.com (2603:10b6:8:f2::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.28; Tue, 10 Sep 2024 18:28:05 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 18:28:05 +0000
Message-ID: <5d29a6d1-80ea-4b21-b14c-619d719a7d23@intel.com>
Date: Tue, 10 Sep 2024 23:57:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/9] drm/xe: Error handling in xe_force_wake_get()
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
 <20240830052326.3707019-2-himal.prasad.ghimiray@intel.com>
 <ZtoGpjVmZbwLsD1s@intel.com> <82a78b3a-14e6-472a-8e45-2cb4af2ff3a2@intel.com>
 <ZtsrTvFHbMuNvXvk@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <ZtsrTvFHbMuNvXvk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::12) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS0PR11MB7786:EE_
X-MS-Office365-Filtering-Correlation-Id: bc2bffd2-7958-47ec-8b63-08dcd1c64f90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1ZncytwNW9qYzBnVEVTZk9lNlgrc0xlYUdHU3VRbjBHc0xxZTlZejJOMngx?=
 =?utf-8?B?cUg4N0hnMEs1V1E3a0lxbXZhdCswL0NYUDRMU2Z5RzJYU1g0c0ZLNUJkNEJJ?=
 =?utf-8?B?S0lJeVF0NVNQRHlpdjl3TnpFdVlVZFFTT0QvOERQb3cwSEdsTGRzY2o5ZWRo?=
 =?utf-8?B?M05vOGcwNjIxQzRXWi9LYmxhYitqMThyVnZjbzhqK2g1cFdaaFh5MnBwVUxQ?=
 =?utf-8?B?eWZmeU0wMW11TFR3KzhhMDZqNmgyWEozTUNjUkVwNzk5MFIwd1RJZHp2eTk3?=
 =?utf-8?B?N2c3K2NiMXEzVVFMT0RTV0NhZjZ3VnAyVkFjVDhSeUdwRTdET1p4cVQ2VDBx?=
 =?utf-8?B?Yk5Ebk8rUEdiQXpYdGVFYWVTU0JmT0ZlSDQ5UnNHcjFTMUhUMDNXV0pKODJC?=
 =?utf-8?B?Z25hSzlROElNVXZueURtM01DeTNtaXAyaTREK1NwUnpCYzJEWGlRRlFiZExr?=
 =?utf-8?B?bDkySXRsRElocllZUDdtWjlFU2tYM0VqMmIwQUdEams0cHFObHdqaEtRd1Y3?=
 =?utf-8?B?Wkw4N0NPQ205V2VsNy9YK2M1NkZhZHp0NkdZMytoamVkb0E3OERKQnlZL2o3?=
 =?utf-8?B?WkwwcGsrdW5GeHN1Yis3MUo0a3ZnY1dVQS9FbG1mNGJUUitLRDNYSzc4V1Ju?=
 =?utf-8?B?enZWcnQvUU9vUHlIaW9FV3FLeTI5T0xVZG5KUFd2UitxMGVzSVVGd3RVQW92?=
 =?utf-8?B?R1IvUE1xc0xJSHZLd0E4Wi9XYzUvb3BsMWFHVGJZOVI0TERGV1RDNklQZUdR?=
 =?utf-8?B?R1pORkZ5TnNXWFRSY1hwTFdSYlp3ODUxc0tVYjZHbXNPOFphNGhtbHVvQkIz?=
 =?utf-8?B?Tmdtemp5QURaa3dlNC8yUm5PTTJzTWFaQ05FNWxtcFFxNUg5dE9VcVdybm9B?=
 =?utf-8?B?eXZRY0lKaDgzU2gyMC9LNTB6cjQ1aStvaXRudWRPSlhWSlFZbjhWMU5WOGZB?=
 =?utf-8?B?RGJLNEZWWVh5NUhTeldydWpXUjJab1J6MTZvRmtnUFlVNUJwUjM1SmxVaDR0?=
 =?utf-8?B?bEFCT2ZWRkNSRE00aVF0RTYxODJDKzNaODhSNHNBdGVGOWlob3VsaUVBZ1M5?=
 =?utf-8?B?QUp4V085Wjk2cWkvdjdQK1k3VU5mMHRPT0p4aVNXdDlpSWQ3RW4zSksxdFpt?=
 =?utf-8?B?bG5uUUhwYmxZQ09iaUY0L0t0OXphNDBVc3d3cUoyK0hvdUNVMFhqY2VQUy9Y?=
 =?utf-8?B?ZjNRcW1nZWNaT24zc0ZIdTVndFBFeFdwZVRLRkxjZGVFeWFTNVBvVGNSN1RG?=
 =?utf-8?B?VWlYS2FXamZ4c0pwV0NFZ21CaXhBcldLc0cvYU4yekppU0dyQ0Zvd0dTbW1M?=
 =?utf-8?B?Z0F1SDVGN3BiQTdXcG9HU1lXSyt4VmtoLzYvNkFUY2JvbU9idm9rUzFySnVu?=
 =?utf-8?B?SEdhb0VqVDB0S2lXYzJUOUpRRnRQWitBNm5oMVg2dzVXd3YvTlo0UXcxaUtM?=
 =?utf-8?B?RGJ0cVFkOGU0RURZbVdIWUcwMkRIV3BGdmlvTE9rMFJHZkI5Y3RIdmJsZHRz?=
 =?utf-8?B?VTBkYWFyZEdKejVKcmR2bGZKa1llT3JzYng5R2NTcGZaczkwbjlBYVhNT1ZC?=
 =?utf-8?B?ZVFPT3FDa1hDSVI5bUgvZXJzOUp1THNMMUFYTHRhaFBmMmtpZXF6OTRFd3Q3?=
 =?utf-8?B?eVRNczBsbyt0cGxOZk0yQms5S3J6V3YzcXZxSEhVZXo0aWlJa1NDSUxocVZ0?=
 =?utf-8?B?dGVESlJvZUFYdWhGMWc0M2NUeGtjK2t6VnVsOXFrc1c1MTJGQlJjVWQ3M1Fn?=
 =?utf-8?B?YnJUTWhQUWViYWVuRzlkSEs3NEJ5NWd2bGZWMWttdVg3bnlGWHRoZzdJckp4?=
 =?utf-8?B?NmFYb3IwRlJwckprUW0zdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0dheWJXUnhvM1RDcnNqNmNTT3ZyZktqbTFIYjJnTnI0OVVYTEpOZzFyV2ZV?=
 =?utf-8?B?a25zUm15MzNkYXhUeS9SYm9IUGNEUUxud04rTGxQZU9lUS9LcEtmcUtEczZO?=
 =?utf-8?B?U1I4Sk1pc3BZWWNaTEVRdDFqVWtqU2N5dnhsZTNZWGI2bTYvUEVlWDBUUTlq?=
 =?utf-8?B?NndCM1ZMWEplUmFyU1VPRTVEbW9Hdmk1YVMxVTlmTmRlV0pIZlZwRmpBTWpH?=
 =?utf-8?B?TVRZYXJGVmpKTy95djIrV1BvL0x1ZktWeEJ0T1AyaWZieWU3UHkrYTR1dnBK?=
 =?utf-8?B?MDFrSE5OUDNLWmZIMTc4VE5abWZmSDJMeGFOUXBaY3RlWllGK0ljeTJ1aEhH?=
 =?utf-8?B?MDlzV1IyT2hvVGtLcTBFWUQ5SmFFTHlUQjA1cFVKTmhUdWw0eDBoUDJ2TElC?=
 =?utf-8?B?dnlCWnMzcStDcmJJd2llY1JSd3NFVTJ0b2FBekJYNmJML3BQOUtYOHM0Qkp3?=
 =?utf-8?B?Umg1WWd2S00wb0lpaURlbkNxT2Y1WmxrWC85Z1Q1SU4rYUcwU2R4dHlIb1I2?=
 =?utf-8?B?NCswRnlJaWlzQ3Z2ak9Xcnp6TW5iSUFOYzBHTjhkNW5ySXlGMzRIdmFGLy90?=
 =?utf-8?B?cVdWbGlTOHNDS0NwTUc2NTJROEcyTzlBbUlpOUNZMW1qblBoeFdyV2pOK3dY?=
 =?utf-8?B?K0ZLVk14Yy8velJWNDlFcEQwRk5GNHpFSERLZmI0QlZDNG5oVmRWMjRFSk5n?=
 =?utf-8?B?cU9SV2N5ME1VSitsNjN6WjlzRk1JZjBlMzR3a00rcnM0ME16K3M3WkhSTFd0?=
 =?utf-8?B?Z1lEOHVVa253eGJBeWR2bzlmLzlEcW1USzlCMm4ydlVRV3lXQkw2anJOVklE?=
 =?utf-8?B?eW51eWE3amU2dXJ2TFQzK2ZVSWU2allqaGxsZ2k0VnhjdEpvaHkzMTk1KzEx?=
 =?utf-8?B?bHRnLzliL2puTURRdjk4eWFBa2tTQjIyQWI0a3lZTUI0aCtBeHVUVzhoRzlr?=
 =?utf-8?B?VFp3ZjdNbHc0aXNBbFJMTEI3cGNhY1hiMzdRaGpua1ZQQWZEU1A3T1NMWkI0?=
 =?utf-8?B?Q1VSUFp5OHZueXFtSmdxMjBYYVRLM0VxcjdtSUgrcmswS1pXWXJwOWRZOXdv?=
 =?utf-8?B?NjBvSFFtVVBWejloaVQrMlVwRSt4aHJXZGVxZG5VNjdsalpobEtVaEVmQUlz?=
 =?utf-8?B?dndITjBDZHhEajFtZXFUNnplMWZoR2FWMFI0bUp4d2NRRWVLcWt2OGhmZnlk?=
 =?utf-8?B?SW15a1UvbmFzQTNmSEZwbGlqUy8zMG5SWEdXeUY2TVkwWUpndnZzN1ZlYm9F?=
 =?utf-8?B?WnFoNkYvR29SL2JUbmNFZXVmZzFIOFNzWVJUbVVvekh0bnUzYzVhM1kvMnJO?=
 =?utf-8?B?UkJ6bUxJMTdhM0doUVBuZVZYeFhSc1JVenVGYlQyM1hPSHE1K0hWVlM1NTlj?=
 =?utf-8?B?ZEIxaTE0bVc3eVltZ2Y4Zm93ZjFUeUprZkJtcjR4QmE0TzQrVEUwTWpZZzJk?=
 =?utf-8?B?dlM1MUFaNnlGTkVnbUo5Q0pocndtK2ZzOHpCZW9vRlpySGNzMTNTQ1B3L240?=
 =?utf-8?B?SGJEV1JhL2xWRXZEU2twTDdUWllvV1JyVEt6VUFMYy9yS3ptRm84ZTNJWHFK?=
 =?utf-8?B?OW9aZTVwUkhVT0x6bEorZ0Q4YThaeHR0cDE1WEM0dlFpb25QeUh3enRtL1Nw?=
 =?utf-8?B?b0hBWjMxSk5PZWs1dFJmZE1HSnpzOVhDWDFWSlFWc0R4OEE2aFd2WHo1bUNO?=
 =?utf-8?B?WHdFRGVDQjNIMGNWejVlek1vYVRoVnZhZnVFYnkxZm1wcjNBanJhWkU2VnJF?=
 =?utf-8?B?dDMwZ2JJQVN2T3dMeEVzeUVrRHdDMXRtUzZzdWR1am16OGV2OFJTTFoxNFhY?=
 =?utf-8?B?TVBqb00rZHBNQnd5N3RhVzN5ZXRwSkI4YjBKSGxtaWo3RTk4RTZza3BQTCtQ?=
 =?utf-8?B?dWh0OUZMNC9HOVkrSy9FVHMyMXYyaTZPN2ZPb3lkMmVoamNXWmpWWE1tZS94?=
 =?utf-8?B?OHB0Ynl0NnlCS2tHbU94aUZ2dlVnWmthT1BqOGZJOFZSS2FpYVRUWEZlQm5y?=
 =?utf-8?B?bUx4dWxDSVJVVlV4Y1QvNkJBbXFOaU9PbzhoMkVEbllrWGx1b1VsSkRFdElR?=
 =?utf-8?B?OHdrKzc4aXRwNzFlSWFYZy9xQWpGQkFDTVJlK2kyZXk5NlVsSzcxM3dYMytC?=
 =?utf-8?B?SHN2Wk5nczlQenVIZWdwNkVJQm1TMDR1T1hFanJla2w4VjNiN2xxOEFGby9j?=
 =?utf-8?B?SXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2bffd2-7958-47ec-8b63-08dcd1c64f90
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:28:05.1480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 63DwtfbjrIN8yViRrKSakhNiGIQPyBpDKMwquNzvExApLaMLYpxIWuE8GphtbUV92fGl/xs7wSdze/93D4swzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7786
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



On 06-09-2024 21:48, Rodrigo Vivi wrote:
> On Fri, Sep 06, 2024 at 01:32:38AM +0530, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 06-09-2024 00:59, Rodrigo Vivi wrote:
>>> On Fri, Aug 30, 2024 at 10:53:18AM +0530, Himal Prasad Ghimiray wrote:
>>>> If an acknowledgment timeout occurs for a domain awake request, put to
>>>> sleep all domains awakened by the caller and decrease the reference
>>>> count for all requested domains. This prevents xe_force_wake_get() from
>>>> leaving an unhandled reference count in case of failure.
>>>> While at it, add simple kernel-doc for xe_force_wake_get() and
>>>> xe_force_wake_put() functions.
>>>>
>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_force_wake.c | 52 +++++++++++++++++++++++++++---
>>>>    1 file changed, 47 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>>>> index b263fff15273..8aa8d9b41052 100644
>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>>>> @@ -150,31 +150,73 @@ static int domain_sleep_wait(struct xe_gt *gt,
>>>>    					 (ffs(tmp__) - 1))) && \
>>>>    					 domain__->reg_ctl.addr)
>>>> +/**
>>>> + * xe_force_wake_get : Increase the domain refcount; if it was 0 initially, wake the domain
>>>> + * @fw: struct xe_force_wake
>>>> + * @domains: forcewake domains to get refcount on
>>>> + *
>>>> + * Increment refcount for the force-wake domain. If the domain is
>>>> + * asleep, awaken it and wait for acknowledgment within the specified
>>>> + * timeout. If a timeout occurs, decrement the refcount and put the
>>>> + * caller awaken domains to sleep.
>>>> + *
>>>> + * Return: 0 on success or 1 on ack timeout from domains.
>>>
>>> * Returns 0 for success, negative error code otherwise.
>>
>> Hi Rodrigo,
>>
>> Sure. Will fix in next version.
>>
>>>
>>>> + */
>>>>    int xe_force_wake_get(struct xe_force_wake *fw,
>>>>    		      enum xe_force_wake_domains domains)
>>>>    {
>>>>    	struct xe_gt *gt = fw->gt;
>>>>    	struct xe_force_wake_domain *domain;
>>>> -	enum xe_force_wake_domains tmp, woken = 0;
>>>> +	enum xe_force_wake_domains tmp, awake_rqst = 0, awake_ack = 0;
>>>>    	unsigned long flags;
>>>>    	int ret = 0;
>>>>    	spin_lock_irqsave(&fw->lock, flags);
>>>>    	for_each_fw_domain_masked(domain, domains, fw, tmp) {
>>>>    		if (!domain->ref++) {
>>>> -			woken |= BIT(domain->id);
>>>> +			awake_rqst |= BIT(domain->id);
>>>>    			domain_wake(gt, domain);
>>>>    		}
>>>>    	}
>>>> -	for_each_fw_domain_masked(domain, woken, fw, tmp) {
>>>> -		ret |= domain_wake_wait(gt, domain);
>>>
>>> now you suppress the mmio error code...
>>> should be better to find a way to propagate that.
>>
>>
>> AFAIU the only possible error code from domain_wake_wait is -ETIMEDOUT, was
>> planning to assign same to ret below, which I missed in the RFC.
>>
>>
>>>
>>>> +	for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
>>>> +		if (domain_wake_wait(gt, domain) == 0)
>>>> +			awake_ack |= BIT(domain->id);
>>>> +	}
>>>> +
>>>> +	ret = (awake_ack == awake_rqst) ? 0 : 1;
>>>
>>> s/1/-EIO/ ?
>>
>> How about -ETIMEDOUT ? Since this is same error which will be propogated in
>> case of domain_wake_wait failure ?
> 
> hmm, I guess it makes more sense indeed.
On patch 9 discussion we are aligning with returning mask of awake 
domains. Make sure whenever the error code is required to return for 
_get -ETIMEDOUT is maintained. May be document this as guideline.

> 
>>
>>>
>>>> +
>>>> +	/*
>>>> +	 * If @domains is XE_FORCEWAKE_ALL and an acknowledgment times out
>>>> +	 * for any domain, decrease the reference count and put the awake
>>>> +	 * domains to sleep. For individual domains, just decrement the
>>>> +	 * reference count.
>>>> +	 */
>>>> +	if (ret) {
>>>> +		for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
>>>> +			if (!--domain->ref && (awake_ack & BIT(domain->id)))
>>>> +				domain_sleep(gt, domain);
>>>
>>> wonder if it would help to extract this in a separate function to be
>>> used here and in the -put function.
>>
>> Let me think around that.
>>
>>>
>>> But more then that, I have a question here...
>>> Do we really need to sleep other domains if we are not getting ack from certain domain?
>>> Doesn't it generally means that we are busted anyway?
>>
>> I have no strong opinion on this, main thing is refcount shouldn't be
>> incremented.
>>
>>>
>>> But also, if we really need to sleep, then perhaps shouldn't we also
>>> call the sleep function even from the guys who didn't ack? perhaps the ack
>>> timedout, but it really woke-up? how sure we are that this is not possible?
>>
>> I didn't want to change the hw state by calling sleep for the "ack failed"
>> domain, so if necessary, Debug tools (PythonSV) can help us pinpoint the
>> exact failure state of the HW registers.
Agreed, let’s avoid putting a failed domain to sleep as it will aid in 
debugging. It’s possible that the acknowledgment timed out but the 
domain still woke up. As discussed in patch 9, subsequent firmware 
get/put calls will put the domain to sleep. The only concern is if the 
device is idle and forcewake is triggered via a sysfs/debugfs entry, the 
domain may remain awake until a forcewake get/put call is made.

Regards,
Badal
>>
>>
>>>
>>>> +		}
>>>> +		awake_ack = 0;
>>>>    	}
>>>> -	fw->awake_domains |= woken;
>>>> +
>>>> +	fw->awake_domains |= awake_ack;
>>>>    	spin_unlock_irqrestore(&fw->lock, flags);
>>>>    	return ret;
>>>>    }
>>>> +/**
>>>> + * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
>>>> + * @fw: Pointer to the force wake structure
>>>> + * @domains: forcewake domains to put reference
>>>> + *
>>>> + * This function reduces the reference counts for specified domains. If
>>>> + * refcount for any of the specified domain reaches 0, it puts the domain to sleep
>>>> + * and waits for acknowledgment for domain to sleep within specified timeout.
>>>> + * Ensure this function is called only in case of successful xe_force_wake_get().
>>>> + *
>>>> + * Returns 0 in case of success or non-zero in case of timeout of ack
>>>> + */
>>>>    int xe_force_wake_put(struct xe_force_wake *fw,
>>>>    		      enum xe_force_wake_domains domains)
>>>>    {
>>>> -- 
>>>> 2.34.1
>>>>
