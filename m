Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E638C5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 13:23:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D8C10E2F6;
	Thu,  5 Jun 2025 13:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V99ZsLDu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617B910E882
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 13:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749129812; x=1780665812;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:mime-version;
 bh=kI9V3z57gYHB8Jwk0QKD0T+D80Soo1cViWZAdJjA5uk=;
 b=V99ZsLDukPvAardNN2mQ7rAsd+iIgRGvEQcIeEBwolQlJoZg8kxpTiKR
 iQdqfINIuQgznIA0GbMZt44aqpA+MxhE8Yvjiv1u8YIQM0H9g/gQatLUb
 gTHMwthXytza6on4+sQhkBoazrlwT3nNFoY/z7S6tkBJQrDwSHcmAnoug
 K4taq7N2p9ST+9aR11gA/EUesSw3rFm7dBmuk2mIBVXS7nrRjrfyI3Sdp
 2lRwol5nb6epVPnvzAVRc7rPjEN1B8+3AYU+7QU/B7KKVHItWcOY6nuj6
 57XWC8Jh7Hcqyl8vOtrm6k0QKzt2KM4de0px/jboBpRcsHA3Yy2Xvdpjj g==;
X-CSE-ConnectionGUID: NpUnhonfT4qapPug6b0XqQ==
X-CSE-MsgGUID: ZJa7o6gBS3SavGbf1bpXAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="68803488"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208,217";a="68803488"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 06:23:32 -0700
X-CSE-ConnectionGUID: Zg65WsIdTgyWX/v3vCgo0w==
X-CSE-MsgGUID: 6+oFrZK7Tca9WycbknvJgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
 d="scan'208,217";a="145467039"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 06:23:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 06:23:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 06:23:31 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.75)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 06:23:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKOnlhMzHqOHMes8t9CkTS1WoFxnrSHlT60tk4J5H3Y+NNRtynmHVg2AYEeaBePFJhfclLdXSMrDiQXESCeP2woOW1keJPilCdplh5dgHjQx33ZfnketdVd6PG1yxX0dFkKrqUSvjd/GaXm5krjwbfeolr5TkbXHWC5LAvVKPq01zHHbZp5jEW2WY0gumR+Y/Z6J59PH2GA5XLu2H/c93k/OTb9ou+BrmRA9Jc96uP2RxMSyGCwbwax6kjkj9SCol+Q0zI09XStoBeEhfaqr6/CyhELYFd5nu0b+ytYutLt28gDVC8Vgil694FKdvKPPH9N02InXjIIoRmpF/lG19Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikxIKullwuUleJlszN5iGg/EE6OQWbagZwwBMFQ11No=;
 b=rz9LX9IQ8/GOmvCbybjdrv5NTNOp4x/ZYxtSDrqc2joVF39JWofT4PiPT6LczR35VQIS7uVVuErnLRacrLX7iN0WQHd3atPH9xl6+jB4Akkxbl9w0Bk+qO6rdthZT+p+/rf7JqUGKIFgCf/E7GHtxfFIkMZdnHfDop8xIpgRLiixvjtHyWbjsqcmKGvimTae5m5FAQ6h7736wj4BLpIWMaRVnYDtZRfDqQ0EMGjwz5YehuHlcQAZM32EICJHYURJD0oKPZVL+3DliTth9gDSvVNzPv62phyWh2btZqD3/mCpLiIJOWZQgW1GKaJPEwjg2MHNH0ejFxgiKRJwIWOlpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 LV8PR11MB8534.namprd11.prod.outlook.com (2603:10b6:408:1f7::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.22; Thu, 5 Jun 2025 13:23:27 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%5]) with mapi id 15.20.8769.025; Thu, 5 Jun 2025
 13:23:27 +0000
Content-Type: multipart/alternative;
 boundary="------------eiWML6pijh5mR7rPtzuSBYlL"
Message-ID: <06e5253a-20b5-4f42-a121-067837bdd5d5@intel.com>
Date: Thu, 5 Jun 2025 18:53:19 +0530
User-Agent: Mozilla Thunderbird
From: "Poosa, Karthik" <karthik.poosa@intel.com>
Subject: Re: [PATCH v3 1/2] drm/xe/xe_debugfs: Exposure of G-State and pcie
 link state residency counters through debugfs
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
CC: <lucas.demarchi@intel.com>, <ashutosh.dixit@intel.com>,
 <riana.tauro@intel.com>, <jani.nikula@intel.com>
References: <20250603181205.1680363-1-soham.purkait@intel.com>
 <20250603181205.1680363-2-soham.purkait@intel.com>
Content-Language: en-GB
In-Reply-To: <20250603181205.1680363-2-soham.purkait@intel.com>
X-ClientProxiedBy: ME0P282CA0002.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:20d::13) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|LV8PR11MB8534:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a1a4bd5-a120-4158-08a1-08dda4342817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkpTcVlLa3JPbjJaSEFKY1FldUVCNmo4aWFkd3R0dUhiVUxUZjZIYlNuSFZZ?=
 =?utf-8?B?MWloKzBITm1PNG0zdEQyTXBxQWJIRHV6VWZQTTd6L01pNExpNXkzZmhqdGpK?=
 =?utf-8?B?NFlsdjV2VHJFM2lXUDF5VlE4SUs2VmxwenFUbFpkM1VUdS9qalExUThwdEh2?=
 =?utf-8?B?Ym9ZNUFwQVdwY1AyeHpiV014elIzUGxxZU5xdUsxNFd3VHV1YThhY1czR1Jz?=
 =?utf-8?B?RFJQT3lnTTRXa1V5eHpEOUNPSFZXcjVBM0R2NDFYeUNRZFV5TFlJVGJlMDhO?=
 =?utf-8?B?TFV2aGxDcGhHc3VwTFNVQlFXWHkycFR1ZXZ6L013dStDWnFIR09ONEsrR3VG?=
 =?utf-8?B?dmNJKzRhemtaK0ZnOFdHNm9KTWkrMHJrQjk0YU1NelJFNklsV3QrZ0JCT000?=
 =?utf-8?B?SXl3SlppUTdkZ3BUaDRoWmlENldmdytxSDBrTnA3Ui9zU0xBWWVNWkZ3RFBt?=
 =?utf-8?B?aVM0Mkx5bVJ4dmdVRkNPSUF4OERGL29xQ2lRT3M5bUVxZUxjTXQyZ2huVnVx?=
 =?utf-8?B?OVUvU3I0Y0Jaa2FrVEJCQ0Yxa0l4Vm9zQ1Q1UFpZUXAvNFlmSnd4REFTNlEv?=
 =?utf-8?B?RmI1WGtNM3ZGTGhQaG93Z1puOHp2azh6L2pQTUg1cWlXSCsxSjhZdFlFK0Zp?=
 =?utf-8?B?OWJlMXZPajdsbUNTdE1aSS9Ha2U0eWl6aE12NXFiVTN5Z1pLK1B2YlY3OEhN?=
 =?utf-8?B?RUZFTC9vS09zc3g0NXNUejR3cVVPd2pDb0xyTmVrYytNQlNRcGw2SHFTR2ZW?=
 =?utf-8?B?bXJaVktscVJCV2RHZ2JtVEFyYVJPY2t1NlZPT0JZYm5HbUVLUVNzZmdWMTEr?=
 =?utf-8?B?RTEzQUtLZTFzVnduZWFTTE9jSVI3bGxyVXJxRTJCcjArMy8yb0hkdlBaLzFR?=
 =?utf-8?B?N3Yvd1FDSEtucEdJcndzaCtBaWJKdExXdzdxcEVrSHBqWm9RUWxvYmlMZVRM?=
 =?utf-8?B?aXpvNktMbXdVcjFjbTQ2Zk1BTkNzZFpVdUpZL1B0eTRGN2pIQ3l3SGVzUTlv?=
 =?utf-8?B?TFU2c3JMS1Bjd0VmNVFockUrY1VGRDhEQmk0aG42cGZXcGhlYkpzVmVLVkhO?=
 =?utf-8?B?YThpbUdDRlNPUkJBSmRQbk5GYXNLa1BoS2RrSUNCaFV3dnBHMEVGMDd3dkpy?=
 =?utf-8?B?YStSTjl4OTJBQThubHZSL3B5WXN6SE5ZUnIzSmxkOEdFMnl4ZXJmR1NMa09Y?=
 =?utf-8?B?eEo2Q3RxbkhxS0psUDA0ZlBybVJjZ3phOFkxc2dXSkEzTFJPZ0pSdTUyQzhM?=
 =?utf-8?B?bDhhQ091d0xWckJKeU1wSWFIaEVjZFFFcjNDdG1kSWExc3FCZUpWQmlFbi9W?=
 =?utf-8?B?dmlZbTJNcWk1SERJOHBtaTRUODlnWFhjRkZXblEwWnJIUmV1cnY2NWZzdU5z?=
 =?utf-8?B?c1YwaC9qcDc3Z3N3OG5tMDhxdExVQjlQVHdKZ3M5WEVMM3Q4RGVqUUxLZHFm?=
 =?utf-8?B?RnVKdmlQdzVPNHJkNkFJdUdpSW1NRkFDVk45S2drdW96ZENDeXAxdGhBK204?=
 =?utf-8?B?dHJTaXp4M2FkWW5Pa0JzZGs3b0dvT3dJc1JwK3lBd0UyVUdTY1ZFaDBnOUZh?=
 =?utf-8?B?dXhlNEtnTGltSFZLdWt5WmdUdDc5QW85NXlmQXAxaTdRU25VQWMwSzcwOXAw?=
 =?utf-8?B?NWUzbSt2RVlPZzV0YmE3dG4za1c3MExudzV1dDFzbi9LaUhuallaMXc1eitx?=
 =?utf-8?B?UWVNTTMvdkFwbTNwVXVVZllDRTA2N25DUEgyVkxWTVV0anFxY0JHQlZjV0xq?=
 =?utf-8?B?bE5xUG80UmR6S1hUYXF5RWd4U1Z4UXFVYWJjZ0lnZEROYTMyUDhadFpZWktZ?=
 =?utf-8?B?QXRkR3RFbmxTWlhkNVRWZjhrK0lCNktJTUlsOElxMTlET0FwSFZPNlBWRGh3?=
 =?utf-8?B?Y0Z4SmgzNjRhZW1vUWt5VGVwTFVEMzlqNVZNR1NySEpvTGUzS054WmJEckxp?=
 =?utf-8?Q?R62QRrPiZn8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDE5TEJpUEplUDNPVWlsNE1uSno3R3oyY0hBS1BTMXZ6S0dBQ3loNU00VW9E?=
 =?utf-8?B?aHVyMTdHZFVTMmpYLzQxM0FEeDZVY2xGV0dTTVFrYS90QklTcjVOSkdOL0t2?=
 =?utf-8?B?ck5uU2RlczBhNERaUXc2ZG5rTTdmelVPNURJcGJaVENqZU1GbEovYkZwZHl6?=
 =?utf-8?B?S0ZydEJCdVNIbzBJV2k3VC9oY3IyWFF6bmlycStXUFkxaEx1aVU4SXRsbTlr?=
 =?utf-8?B?cHJ6a0RudEQ0dDBmSWc2NVZDV1lZZEwzWkNmYVFnQ3Q4QzVCYU05RDJ5bHVE?=
 =?utf-8?B?blRMb0pmVjhMVVJ5Qy9hNXNIQ215UjlUeG90M3EyTmVSSTYzWkZWYVpUeGpS?=
 =?utf-8?B?V0VjUkI5bEZKbmJ4N1ZMc2Y5bVBXcEhETDF6M2cxbGN5cjYwRUlPbVdyekV6?=
 =?utf-8?B?NmpwU0RZaG5NQ1dFOFlCcnJWSUIwclhEZXZTc01tbGNYb0dtaEMzeVh4aHVx?=
 =?utf-8?B?MFB5NENyeGlIeCthZDlXQUxXaEpLRENQdnlHb0k3ZEtuR1BlVVNmeFVoeUNn?=
 =?utf-8?B?YThGa2dIMnVneVY1REZtMkc1cDk3elp6Y0ZnMWYwVkFmOEpNbDZLY1VqT1Ux?=
 =?utf-8?B?dXJDa0YwdlozWWU2dFVFWDVtMU9vYjllenQ2ZkJHUThCMlY2bHZxdFVGcWt1?=
 =?utf-8?B?eUo4dllKZngwOE9zMjRRS3paRDFCVXMyb09tdi83aWNYWU0rVHNEc1BHRGp4?=
 =?utf-8?B?ZFJlZHZjU3hNWWswcXY3ZkIzQW02QU9Ka2lHbUowc0xwWHp1Q2JsVm91aHFQ?=
 =?utf-8?B?cDRxSG05WktRa0lkRFNMSWwxalp4YWZHZ1RSZ0ppYWdaZ2w1anE5NTE0MEhl?=
 =?utf-8?B?dkoyaFpnaVlMZC91dm1rLzNGa0szbkQvTmNLTnp0L25yUERYb0NiekgvVVJi?=
 =?utf-8?B?c1hzbWJ0bWpHREJnSTlKa1llYmFQbjlMOGg5S0oweXU2dURRNitoZ2xGWjVr?=
 =?utf-8?B?TVROR3R1MVNHUWFDNlUzUElPVG5VQk1xdndXSXlhQm5vWTJHeDJrV1NESWNL?=
 =?utf-8?B?WFF5cDRqY09JZ0tKWEZTUGdjWFhQUTFlZk9iYm9nYTJEZFc5b283V1Y0ZElq?=
 =?utf-8?B?R1c5SzM2Sm9SaGdBbjB0cnJBYWFNeWQ5eVpTOE9SMi9vWnMvOGJiQlFHdEJT?=
 =?utf-8?B?bGIzY3pBandUZEMwMXFKbk9KYk5KRVJzWTRZOGNSVHlzZVlFa084dWw5c0hs?=
 =?utf-8?B?Ui9UZDNHRGtoaDJicjB2a0p3RndqajJLc1d0ZVNxdURyYkVFekpNY0VQajFT?=
 =?utf-8?B?WHA4MEtBYXoyVmZJcmNLZjY2YllMMjZWeHpVY1FzUDlFaktROUtsWDE3cjJU?=
 =?utf-8?B?MFRsSVV2NmRIc08vZUY1OW16NnJobU5iL1RtMU1iQkhvRURBemh0cnFtNHpx?=
 =?utf-8?B?dy9TVVNnL29pZTREc1RGaDk5K0RTUGJUYUN1bTVXaURnMmFyT05lUWNwZ1pJ?=
 =?utf-8?B?K0RMaFVlUWVNS2d6dUg1ZWRtd2V1WjdOcjdMZVUxZHQ4Z3RmT25raENwVW54?=
 =?utf-8?B?T0JLOXRZTTUyNGFZeGlOU0FmQkxPV0lXY1FuVWZub0R0L3RRQ3hSdmFUVTFl?=
 =?utf-8?B?UmNLcFh4Z21NeThZVTcweGFhQldNSmJXeTErQVhmbUV4VFpKNXZ5SHhaSzRY?=
 =?utf-8?B?TkxNQmJlNkI2OHY4USt3ZUVCNUV3OXBPMVRuOWswSzQzQUl4T1cwUzc5WHZQ?=
 =?utf-8?B?ZzgrUWxSS0dSaFFLZ2ZOVFEvOWo4OThZUng5WTBiSWhuUkl2T0hHUHdsRzFV?=
 =?utf-8?B?cWsyMXh4NTd6ZjVMTW40UlE5WURtVFhEL0lNenNZZzBKczNUaTlTZ3FxSXNy?=
 =?utf-8?B?Vm9GTnBFVDcrRERuWERuZUhQc0thMDRXWFEvbGgyRCtYUHhkSnllZks4YUtG?=
 =?utf-8?B?S2VGUit3ZDBpS2c0UGE2S21ldHJrTndaaDBwUE9yNGI2SVlNTUxoMlp3STE1?=
 =?utf-8?B?ZzVPdy9maEJpd2dDMFJUUlVhWDRZbG9qM0ZqYktySk1yQ0oySmxBYmwrY0t0?=
 =?utf-8?B?elZNNVdNYmlUS1RzTmpPRXZFdjFqVzVKL0UrNjB2dThhRnpPR1gwRTZ5eTRQ?=
 =?utf-8?B?d0E0Nis4c0xMQnBxdWtWelBwRXU4dmZtb3cyMVp1UmptOEN4bGVYd2VJb25p?=
 =?utf-8?B?UWdZV29wNnpiVklEZGVoRUlXR2NqeU9WY0JMV000dzVBWXJCUnlHQnE3d2tC?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1a4bd5-a120-4158-08a1-08dda4342817
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 13:23:27.7639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ThJgb2eXf7qPBHiJRXiL29q21Wtlc3JN6vbW5WuJ7U03SrNOIUqiawZrGDRpJ1YfX4wTF+0YAZNOItVWQXSB+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8534
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

--------------eiWML6pijh5mR7rPtzuSBYlL
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

You can rephrase commit title to: Add debugfs for G-state and PCIe link 
states residency

On 03-06-2025 23:42, Soham Purkait wrote:

>      Add two debugfs node named dgfx_pkg_residencies and dgfx_link_state_residencys
> in order to obtain the G-State residency counter values for G2, G6, G8, G10 &
> ModS and the pcie link state residency counter values for L0, L1 & L1.2
> respectively.

1. what are the changes done in v2 version of this patch ?

2. rename dgfx_link_state_residencys -> dgfx_pcie_link_residencies

3. Commit message can be changed to,

Add debug nodes, dgfx_pkg_residencies for G-states (G2, G6, G8, G10, 
ModS) and

and dgfx_pcie_link_residencies for PCIe link states(L0, L1, L1_2) 
residency counters.

> Signed-off-by: Soham Purkait<soham.purkait@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c | 99 +++++++++++++++++++++++++++++++++
>   1 file changed, 99 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index d83cd6ed3fa8..c339f05ce42e 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -11,16 +11,19 @@
>   
>   #include <drm/drm_debugfs.h>
>   
> +#include "regs/xe_pmt.h"
>   #include "xe_bo.h"
>   #include "xe_device.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt_debugfs.h"
>   #include "xe_gt_printk.h"
>   #include "xe_guc_ads.h"
> +#include "xe_mmio.h"
>   #include "xe_pm.h"
>   #include "xe_pxp_debugfs.h"
>   #include "xe_sriov.h"
>   #include "xe_step.h"
> +#include "xe_vsec.h"
>   
>   #ifdef CONFIG_DRM_XE_DEBUG
>   #include "xe_bo_evict.h"
> @@ -185,6 +188,86 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>   	return size;
>   }
>   
> +static int read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
> +				  u64 *dst, u32 offset, char *name)
> +{
> +	int ret = xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
> +				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
> +				dst, offset, sizeof(u64));

int ret = 0;

Please separate declaration of ret, before usage.

> +	if (ret != sizeof(u64))
sizeof(dst)
> +		drm_warn(&xe->drm, "%s residency counter failed to read, ret %d\n", name, ret);
residency counter read failed
> +
> +	return 0;
> +}
> +
> +static ssize_t dgfx_pkg_residencies_show(struct file *f, char __user *ubuf,
> +					 size_t size, loff_t *pos)
> +{
> +	u64 g_states;

you can rename g_states -> counter, i.e

u64 counter = 0;

> +	char buf[256];

We can avoid this buf by using drm_info_list, similar to sriov_info in 
the same file

static const struct drm_info_list debugfs_list[] = {
         {"info", info, 0},
         { .name = "sriov_info", .show = sriov_info, },
};

> +	int len = 0;
> +	struct xe_device *xe;
> +	struct xe_mmio *mmio;
> +
> +	xe = file_inode(f)->i_private;
> +	xe_pm_runtime_get(xe);
> +	mmio = xe_root_tile_mmio(xe);
> +
> +	g_states = 0;
> +	read_residency_counter(xe, mmio, &g_states, BMG_G2_RESIDENCY_OFFSET, "G2");
> +	len = scnprintf(buf, sizeof(buf), "Package G2: %llu\n", g_states);
> +
> +	g_states = 0;
> +	read_residency_counter(xe, mmio, &g_states, BMG_G6_RESIDENCY_OFFSET, "G6");
> +	len += scnprintf(buf + len, sizeof(buf) - len, "Package G6: %llu\n", g_states);
> +
> +	g_states = 0;
> +	read_residency_counter(xe, mmio, &g_states, BMG_G8_RESIDENCY_OFFSET, "G8");
> +	len += scnprintf(buf + len, sizeof(buf) - len, "Package G8: %llu\n", g_states);
> +
> +	g_states = 0;
> +	read_residency_counter(xe, mmio, &g_states, BMG_G10_RESIDENCY_OFFSET, "G10");
> +	len += scnprintf(buf + len, sizeof(buf) - len, "Package G10: %llu\n", g_states);
> +
> +	g_states = 0;
> +	read_residency_counter(xe, mmio, &g_states, BMG_MODS_RESIDENCY_OFFSET, "ModS");
> +	len += scnprintf(buf + len, sizeof(buf) - len, "Package ModS: %llu\n", g_states);
> +
> +	xe_pm_runtime_put(xe);
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
> +static ssize_t dgfx_link_state_residencys_show(struct file *f, char __user *ubuf,
> +					       size_t size, loff_t *pos)
> +{
> +	u64 link_res;
> +	char buf[256];
> +	int len = 0;
> +	struct xe_device *xe;
> +	struct xe_mmio *mmio;
> +
> +	xe = file_inode(f)->i_private;
> +	xe_pm_runtime_get(xe);
> +	mmio = xe_root_tile_mmio(xe);
> +
> +	link_res = 0;
> +	read_residency_counter(xe, mmio, &link_res, PCIE_LINK_L0_RESIDENCY_COUNTER, "PCIE LINK L0");
> +	len = scnprintf(buf, sizeof(buf), "PCIE LINK L0 RESIDENCY :  %llu\n", link_res);
> +
> +	link_res = 0;
> +	read_residency_counter(xe, mmio, &link_res, PCIE_LINK_L1_RESIDENCY_COUNTER, "PCIE LINK L1");
> +	len += scnprintf(buf + len, sizeof(buf) - len, "PCIE LINK L1 RESIDENCY : %llu\n", link_res);
> +
> +	link_res = 0;
> +	read_residency_counter(xe, mmio, &link_res,
> +			       PCIE_LINK_L1_2_RESIDENCY_COUNTER, "PCIE LINK L1.2");
> +	len += scnprintf(buf + len, sizeof(buf) - len,
> +			 "PCIE LINK L1.2 RESIDENCY : %llu\n", link_res);
> +
> +	xe_pm_runtime_put(xe);
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
>   static const struct file_operations wedged_mode_fops = {
>   	.owner = THIS_MODULE,
>   	.read = wedged_mode_show,
> @@ -226,6 +309,16 @@ static const struct file_operations atomic_svm_timeslice_ms_fops = {
>   	.write = atomic_svm_timeslice_ms_set,
>   };
>   
> +static const struct file_operations dgfx_pkg_residencies_fops = {
> +	.owner = THIS_MODULE,
> +	.read = dgfx_pkg_residencies_show,
> +};
> +
> +static const struct file_operations dgfx_link_state_residencys_fops = {
> +	.owner = THIS_MODULE,
> +	.read = dgfx_link_state_residencys_show,
> +};
> +
>   void xe_debugfs_register(struct xe_device *xe)
>   {
>   	struct ttm_device *bdev = &xe->ttm;
> @@ -249,6 +342,12 @@ void xe_debugfs_register(struct xe_device *xe)
>   	debugfs_create_file("atomic_svm_timeslice_ms", 0600, root, xe,
>   			    &atomic_svm_timeslice_ms_fops);
>   
> +	debugfs_create_file("dgfx_pkg_residencies", 0444, root, xe,
> +			    &dgfx_pkg_residencies_fops);
> +
> +	debugfs_create_file("dgfx_link_state_residencys", 0444, root, xe,
> +			    &dgfx_link_state_residencys_fops);
> +
You can drm_info_list to create the debugfs as mentioned above.
>   	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
>   		man = ttm_manager_type(bdev, mem_type);
>   
--------------eiWML6pijh5mR7rPtzuSBYlL
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>You can rephrase commit title to: Add debugfs for G-state and
      PCIe link states residency</p>
    <p>On 03-06-2025 23:42, Soham Purkait wrote:<br>
    </p>
    <blockquote type="cite" cite="mid:20250603181205.1680363-2-soham.purkait@intel.com">
      <pre wrap="" class="moz-quote-pre">    Add two debugfs node named dgfx_pkg_residencies and dgfx_link_state_residencys
in order to obtain the G-State residency counter values for G2, G6, G8, G10 &amp;
ModS and the pcie link state residency counter values for L0, L1 &amp; L1.2
respectively.</pre>
    </blockquote>
    <p>1. what are the changes done in v2 version of this patch ?</p>
    <pre wrap="" class="moz-quote-pre">2. rename dgfx_link_state_residencys -&gt; dgfx_pcie_link_residencies</pre>
    <p>3. Commit message can be changed to,</p>
    <p>Add debug nodes, dgfx_pkg_residencies for G-states (G2, G6, G8,
      G10, ModS) and</p>
    <p>and&nbsp;<span style="white-space: pre-wrap">dgfx_pcie_link_residencies</span>
      for PCIe link states(L0, L1, L1_2) residency counters.</p>
    <blockquote type="cite" cite="mid:20250603181205.1680363-2-soham.purkait@intel.com">
      <pre wrap="" class="moz-quote-pre">Signed-off-by: Soham Purkait <a class="moz-txt-link-rfc2396E" href="mailto:soham.purkait@intel.com">&lt;soham.purkait@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 99 +++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d83cd6ed3fa8..c339f05ce42e 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -11,16 +11,19 @@
 
 #include &lt;drm/drm_debugfs.h&gt;
 
+#include &quot;regs/xe_pmt.h&quot;
 #include &quot;xe_bo.h&quot;
 #include &quot;xe_device.h&quot;
 #include &quot;xe_force_wake.h&quot;
 #include &quot;xe_gt_debugfs.h&quot;
 #include &quot;xe_gt_printk.h&quot;
 #include &quot;xe_guc_ads.h&quot;
+#include &quot;xe_mmio.h&quot;
 #include &quot;xe_pm.h&quot;
 #include &quot;xe_pxp_debugfs.h&quot;
 #include &quot;xe_sriov.h&quot;
 #include &quot;xe_step.h&quot;
+#include &quot;xe_vsec.h&quot;
 
 #ifdef CONFIG_DRM_XE_DEBUG
 #include &quot;xe_bo_evict.h&quot;
@@ -185,6 +188,86 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 	return size;
 }
 
+static int read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
+				  u64 *dst, u32 offset, char *name)
+{
+	int ret = xe_pmt_telem_read(to_pci_dev(xe-&gt;drm.dev),
+				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
+				dst, offset, sizeof(u64));</pre>
    </blockquote>
    <p>int ret = 0;</p>
    <p>Please separate declaration of ret, before usage.</p>
    <blockquote type="cite" cite="mid:20250603181205.1680363-2-soham.purkait@intel.com">
      <pre wrap="" class="moz-quote-pre">+	if (ret != sizeof(u64))</pre>
    </blockquote>
    sizeof(dst)
    <blockquote type="cite" cite="mid:20250603181205.1680363-2-soham.purkait@intel.com">
      <pre wrap="" class="moz-quote-pre">+		drm_warn(&amp;xe-&gt;drm, &quot;%s residency counter failed to read, ret %d\n&quot;, name, ret);</pre>
    </blockquote>
    residency counter read failed
    <blockquote type="cite" cite="mid:20250603181205.1680363-2-soham.purkait@intel.com">
      <pre wrap="" class="moz-quote-pre">+
+	return 0;
+}
+
+static ssize_t dgfx_pkg_residencies_show(struct file *f, char __user *ubuf,
+					 size_t size, loff_t *pos)
+{
+	u64 g_states;</pre>
    </blockquote>
    <p>you can rename g_states -&gt; counter, i.e&nbsp;</p>
    <p>u64 counter = 0;</p>
    <blockquote type="cite" cite="mid:20250603181205.1680363-2-soham.purkait@intel.com">
      <pre wrap="" class="moz-quote-pre">+	char buf[256];</pre>
    </blockquote>
    <p>We can avoid this buf by using drm_info_list, similar to
      sriov_info in the same file</p>
    <p>static const struct drm_info_list debugfs_list[] = {<br>
      &nbsp; &nbsp; &nbsp; &nbsp; {&quot;info&quot;, info, 0},<br>
      &nbsp; &nbsp; &nbsp; &nbsp; { .name = &quot;sriov_info&quot;, .show = sriov_info, },<br>
      };<br>
    </p>
    <blockquote type="cite" cite="mid:20250603181205.1680363-2-soham.purkait@intel.com">
      <pre wrap="" class="moz-quote-pre">+	int len = 0;
+	struct xe_device *xe;
+	struct xe_mmio *mmio;
+
+	xe = file_inode(f)-&gt;i_private;
+	xe_pm_runtime_get(xe);
+	mmio = xe_root_tile_mmio(xe);
+
+	g_states = 0;</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:20250603181205.1680363-2-soham.purkait@intel.com">
      <pre wrap="" class="moz-quote-pre">+	read_residency_counter(xe, mmio, &amp;g_states, BMG_G2_RESIDENCY_OFFSET, &quot;G2&quot;);
+	len = scnprintf(buf, sizeof(buf), &quot;Package G2: %llu\n&quot;, g_states);
+
+	g_states = 0;
+	read_residency_counter(xe, mmio, &amp;g_states, BMG_G6_RESIDENCY_OFFSET, &quot;G6&quot;);
+	len += scnprintf(buf + len, sizeof(buf) - len, &quot;Package G6: %llu\n&quot;, g_states);
+
+	g_states = 0;
+	read_residency_counter(xe, mmio, &amp;g_states, BMG_G8_RESIDENCY_OFFSET, &quot;G8&quot;);
+	len += scnprintf(buf + len, sizeof(buf) - len, &quot;Package G8: %llu\n&quot;, g_states);
+
+	g_states = 0;
+	read_residency_counter(xe, mmio, &amp;g_states, BMG_G10_RESIDENCY_OFFSET, &quot;G10&quot;);
+	len += scnprintf(buf + len, sizeof(buf) - len, &quot;Package G10: %llu\n&quot;, g_states);
+
+	g_states = 0;
+	read_residency_counter(xe, mmio, &amp;g_states, BMG_MODS_RESIDENCY_OFFSET, &quot;ModS&quot;);
+	len += scnprintf(buf + len, sizeof(buf) - len, &quot;Package ModS: %llu\n&quot;, g_states);
+
+	xe_pm_runtime_put(xe);
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t dgfx_link_state_residencys_show(struct file *f, char __user *ubuf,
+					       size_t size, loff_t *pos)
+{
+	u64 link_res;
+	char buf[256];
+	int len = 0;
+	struct xe_device *xe;
+	struct xe_mmio *mmio;
+
+	xe = file_inode(f)-&gt;i_private;
+	xe_pm_runtime_get(xe);
+	mmio = xe_root_tile_mmio(xe);
+
+	link_res = 0;
+	read_residency_counter(xe, mmio, &amp;link_res, PCIE_LINK_L0_RESIDENCY_COUNTER, &quot;PCIE LINK L0&quot;);
+	len = scnprintf(buf, sizeof(buf), &quot;PCIE LINK L0 RESIDENCY :  %llu\n&quot;, link_res);
+
+	link_res = 0;
+	read_residency_counter(xe, mmio, &amp;link_res, PCIE_LINK_L1_RESIDENCY_COUNTER, &quot;PCIE LINK L1&quot;);
+	len += scnprintf(buf + len, sizeof(buf) - len, &quot;PCIE LINK L1 RESIDENCY : %llu\n&quot;, link_res);
+
+	link_res = 0;
+	read_residency_counter(xe, mmio, &amp;link_res,
+			       PCIE_LINK_L1_2_RESIDENCY_COUNTER, &quot;PCIE LINK L1.2&quot;);
+	len += scnprintf(buf + len, sizeof(buf) - len,
+			 &quot;PCIE LINK L1.2 RESIDENCY : %llu\n&quot;, link_res);
+
+	xe_pm_runtime_put(xe);
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
 static const struct file_operations wedged_mode_fops = {
 	.owner = THIS_MODULE,
 	.read = wedged_mode_show,
@@ -226,6 +309,16 @@ static const struct file_operations atomic_svm_timeslice_ms_fops = {
 	.write = atomic_svm_timeslice_ms_set,
 };
 
+static const struct file_operations dgfx_pkg_residencies_fops = {
+	.owner = THIS_MODULE,
+	.read = dgfx_pkg_residencies_show,
+};
+
+static const struct file_operations dgfx_link_state_residencys_fops = {
+	.owner = THIS_MODULE,
+	.read = dgfx_link_state_residencys_show,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &amp;xe-&gt;ttm;
@@ -249,6 +342,12 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file(&quot;atomic_svm_timeslice_ms&quot;, 0600, root, xe,
 			    &amp;atomic_svm_timeslice_ms_fops);
 
+	debugfs_create_file(&quot;dgfx_pkg_residencies&quot;, 0444, root, xe,
+			    &amp;dgfx_pkg_residencies_fops);
+
+	debugfs_create_file(&quot;dgfx_link_state_residencys&quot;, 0444, root, xe,
+			    &amp;dgfx_link_state_residencys_fops);
+</pre>
    </blockquote>
    You can drm_info_list to create the debugfs as mentioned above.
    <blockquote type="cite" cite="mid:20250603181205.1680363-2-soham.purkait@intel.com">
      <pre wrap="" class="moz-quote-pre"> 	for (mem_type = XE_PL_VRAM0; mem_type &lt;= XE_PL_VRAM1; ++mem_type) {
 		man = ttm_manager_type(bdev, mem_type);
 
</pre>
    </blockquote>
  </body>
</html>

--------------eiWML6pijh5mR7rPtzuSBYlL--
