Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86B2CCD199
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 16:30:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971A810EC82;
	Fri, 17 Oct 2025 16:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jy1ZPdwq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0053C10EC82
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 16:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760718600; x=1792254600;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1i6Lxl0p8EtPKet55Wk+vZPVqe5dYuPt327rqJ9jWrI=;
 b=Jy1ZPdwqyHDl+c6l2uLrBM6AMTecywBD2RAPlzpZLSsxp0eWCoqO7x3X
 YInHVhN6r6dTMJFuiMBUPQwmzRlExbi2LKfBNnEIPWZNcUnP6pk3ZUf3q
 0yV2vLXomB5qlAsR5hfgXq3lOkIuSg41IqhdNXduOAKI52CBxb3cID2Ac
 DvKWOEYFmqAjVVctjtsMpGCiWrRUdxGFh05M0wgk99PFtj6hE8y3XLbZg
 6A/zgVtoMF2o/H1jAAvhon9PJIQjGNvQL1OFClFYkQElOVStwIKlaWEQR
 X/6Dz7VnNvrKOxAtZoBAwdVQRuEh11ZQ6R6fGIrCeOtha6DVB5Va+TqxA w==;
X-CSE-ConnectionGUID: uRXR8T3KSlWGsUab4HLoxg==
X-CSE-MsgGUID: jHAei0amT6uCIsa4qhSoag==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="63081416"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="63081416"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 09:29:59 -0700
X-CSE-ConnectionGUID: Xtti7QERSyybLWSmzJniKA==
X-CSE-MsgGUID: i5UKXeVNSwKmhXyuCBkM7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="181962565"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 09:30:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 09:29:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 09:29:59 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.10)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 09:29:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJ0cKvFq4G/E+3UyjhMiQ17uUdwKFUyPO8QIgbBtoYxpDw0fSK1hJC1t4H7vJ/xLUk2si8kmg1HYBTajgTkEhkEwArGgdm74gs9/qAXGzEUEJmaXSfbNS/gf6pj4qcgrB9P2lBsgmjlHFxaDpO6bq3WygK4UdUA+k2DZRj4iNmVpfmFN0pzu16Us5OBFm/MkcUSsVEnxBxQiaOCUWHcNFTfD6MLAqIDvkjAICXjnRXN0Jg2Mn6fuUkicUT90yqC5n+3xDgwiVOBLbtfBLfGFICZDyMsi5CMKCVCk5beemt+J0bUF1KtVOuuba+Fg2Tk/6di3oiLPFDhxZvvSfVXS2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uouEInvQAsRiZZej9NqFTecJFy4GmOomHYpaPUE7TRA=;
 b=X2eQNBUIeA5TntblcamtF7BeSmfghVIUmiovXhR4gc+xqmiYuneIlmE8Qr9hVBCLD1A+bU0Zs/4bl7C5u5YlYqJLXa296UvwG6ZZQvc1MbRb6GzTtq49M8l2LfIleSKCncUNUUXr3sb/OkPuC5J2V+GXEMJn2Ok4gCuy05VWNsad8a2BKKrahYt9iwHWG5KTWdcFLPKk5omR1RhvXP4Yz3OLPAGYo9qs+a6k08FsfIQFgQVf94Uu4xv+/9xx/+kyF9os0prhDKUsxBT1tG6yvg+zTbbozaUlEkwbZgqXIgTCAzefpejQ/0hjGEuiUdly4xyokaY4+Zp5t0jZt4AeXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SJ2PR11MB8323.namprd11.prod.outlook.com (2603:10b6:a03:53f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 16:29:56 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9228.009; Fri, 17 Oct 2025
 16:29:56 +0000
Message-ID: <34f2d811-6d95-450b-978f-e4fa2d21c986@intel.com>
Date: Fri, 17 Oct 2025 21:59:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] drm/xe/migrate: Atomicize CCS copy command setup
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
References: <20251017141226.924-5-satyanarayana.k.v.p@intel.com>
 <20251017141226.924-6-satyanarayana.k.v.p@intel.com>
 <aPJSNo8XM3cpGZCb@intel.com> <78cc87ee-6d2d-4a85-9e42-7836b97ea435@intel.com>
 <aPJgP9ShLrvSeXzU@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <aPJgP9ShLrvSeXzU@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::8) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|SJ2PR11MB8323:EE_
X-MS-Office365-Filtering-Correlation-Id: cf8d7b53-9485-40f2-f6d8-08de0d9a6867
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXFvOEJ3WHZxQzlEanR3RldtTUpaY3Y0ZE1rY0FHNHltUTJkQUROekNpdGh4?=
 =?utf-8?B?bmNKWXdnZk5rVHd1SHFXUzY4cHMxdTk4MUl4WDdWVU8xVElzNVJ6MWw2SHlv?=
 =?utf-8?B?ZEFIY3FOajJjaDBhaVRBeXRlcFVDWWM1Z2dBVmlBSTJya0pXanJIQ3hPTDly?=
 =?utf-8?B?WVgwaHM1RzRtdVJoSVJTdk1wVUdRMERvR1l4NzU0QzJKYlcxVFdXZEFvZU1o?=
 =?utf-8?B?S0xZQzI5UmhYWisxNzErQUxoc3loL3kwZlhZV2gySEorRHhxUHFtZDZzeEw4?=
 =?utf-8?B?ZUQ0ZzhsVldWVURCdXBnK1hoNGgzN0JBK1JPWndaSkxvTHlreWV2ajl6SWYr?=
 =?utf-8?B?dlBYR0Q5dmp0RzhhbjZYTmxPL2pzbEpqRHdYVG5CcTgrNVUxMGR3YnVwQ2Y2?=
 =?utf-8?B?TGZZMVY0ZTlGWVZuTlNBUnRWTEF1TE52K0xoeFpPY2NUaGlSckxkVHljdStF?=
 =?utf-8?B?aU1JbC9FZTRvL1gxb2wzWHNuaGdQemg1RFEwbWtmanQxenU5YVVmNlpvaVVV?=
 =?utf-8?B?YzBYbVJ5QUg2RkhDRy84WWpiV3hrdnRXNis4RGFxS2ovQ1NabEhlYThQZmVF?=
 =?utf-8?B?eno2M1Z5UG5WeEZIS0tFMU9Zd0tPcm1qd1FuY0w2TE1CdmFSU1NTaCtRT1pN?=
 =?utf-8?B?eWthSE9rTVFjajhjWG15TmpNNWxFRGM5RVVadXFTTDdOa3p4ak1GSCtFTHVi?=
 =?utf-8?B?VnhKWGY5MEZMdGpNVUtJa1RhNzhpR0Ria09nSXRhT1NaS04rMUlTaHJVelox?=
 =?utf-8?B?ajdlYjY0STV3dlEvT2MyM0d2MTByZnBWZDFCbjJXQ2Y1YTJhWERMbzExa3FN?=
 =?utf-8?B?d3BVbmhrK2djZjdJNHlEZDVPcTBQb3RiVEwyYnNkQmgyZy85Q0ZrRVR2R1pK?=
 =?utf-8?B?bDdxNUFSV3IxazZWRDNMS1ZUY0JBZjFSam8vb1RxdjNLR2I1VDlNVWx5OXgy?=
 =?utf-8?B?dVhiS28zMlcxVnAyZDRybEdVaXdER3RsaEs4UkRlM0hkNGdYTmtTUFNJWkll?=
 =?utf-8?B?TVBneXFSTTRaR2kzWWo3K0dscXltWi9TUzRNRVJPWUc4amZBT1hrNGtqTnVp?=
 =?utf-8?B?WTdxKytHNWZwZ3FrSDJCRFIxd0lCNDhOTm9xR2JlMUVhM0FmM3N1Y0VCQjRq?=
 =?utf-8?B?VkRkaWFTaDV3eFljeEY3YjRTY3RJTlpBRDBURWRaSWNEUVQzREM1TUpKdUNk?=
 =?utf-8?B?M2Z0a0RGdXd6SUtES2t2Ukdud2tqakhIUTduaWQrRWQ3Q2ZmYWRQcTRoVzl6?=
 =?utf-8?B?VTk0NG5lUkFoeVBPYWJKeWVVeURIU1EyTmxPV04yTUYyUERXZ0h0V0R6V3lh?=
 =?utf-8?B?WFhpTDByVjdCdThNcnoxZEkvS0FRMVhGa0hNSUwrMFJRNHpUVi91czdQLzd5?=
 =?utf-8?B?TldZNjk3VWEybTVkSitsTjEzRCtOQUc2eWxvNjhVaHRPeGNQWDVSTmRuM3lu?=
 =?utf-8?B?S0IvTkhnTTdzVkQ2M1czYmF4WnFaR3pBZHZtVExQM0M1NlVhY0wxZzNBYlhM?=
 =?utf-8?B?NDZuMTIxUnFNelhxVTJ5Q0xvRGJJY1VaQUZ4SnhSUzcwNHNhRFFFbnE2NEpq?=
 =?utf-8?B?Q2NnTk10OTFmZHlFMTIzZXZWdURLOVB6ZzJFL3NVYUR6cXJjZ05ackRyRWpP?=
 =?utf-8?B?ZGtUd3lDVVExbG0xdzByZ2lSdGRnWFA0dyswVFRpc2JIVDg4SlNvN3R4OWJL?=
 =?utf-8?B?MnROelMrNjVLRU5pbW5iYnRwaS85cW82ZFZ0RjdpSW84VFhESEx0QXBsTE9m?=
 =?utf-8?B?N2lkemVwMTVwMkNqYjhBaUJwK1NlblR6cmhQYnd2ZEdWaUhJLzdWZHJ2ZU1K?=
 =?utf-8?B?OUxDZ1A2Q0xjSncyclpOenBDTVpBRHBZeTlDNkFXZldGNmlkN2V4bVZBUVh6?=
 =?utf-8?B?dGN1VHVwbXh5LzRTOXkrMm1iR1JTQXBmSHFRbUtSdnA1K2R0Q2RmNFNHeGpK?=
 =?utf-8?Q?1+SMlRmyjl+Gs7oW7a+MlG71Olvb2dg9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3ZBWjh5MDJwc3ZBZXZMTW5KVUFxMFpCNjBleGN5S09IYjJPSVU0TVdsYVJM?=
 =?utf-8?B?Sks4aXZhelYyQkR2OVNpRGc5dXVXSTlkeTRvd3J2KzVEL3cvclhCaXUwcWY1?=
 =?utf-8?B?UkZHaTVOTnkvNDUvL2R1S2dVR3pBTlMvNTRyU09uNmlhanNSTVhYOHo5cG5p?=
 =?utf-8?B?WlFYM1ppUUNCY1Z0NkF6ang2V0RJMFRleVoyUi9vRUVGSjcxQmEwMkNWWXFX?=
 =?utf-8?B?QVpmRzM5MUdHd3psdi84VFpkblBNSTRZV0w4eTVwbGhkRzVxUEZzTzVuWDll?=
 =?utf-8?B?dkZ5ZUZtMG5DMTNRZkNTUCt4b0M1UkNPZ1g2clFPcFBGUGdHVEpjMll1S1la?=
 =?utf-8?B?Y2VRNm4vT0dMdWRTSmlHZ2RuTXZ2MzI3dldqbkRkNjRyOUlCS3B0MjdrWS9O?=
 =?utf-8?B?UUlrMmRvTS9pdTI4Q2NXbDlzdUJsM3hEM1ZzcTdVcUMxWFp5NDE4V1J2TDl1?=
 =?utf-8?B?eVdMNVcrclhQa2QwY0ttaXM2Y3F5akN5SDQrcWxVV3Zud0kwU3ZPMHF0U2pB?=
 =?utf-8?B?N2pjK2x6Qmg4YVJhYXcxeVd0dk0wbEFjNEFRTG9MaGxPcTdVTHBEK2hnOG0w?=
 =?utf-8?B?akVTcTFSamJrS0VSNWtkS284SHpqTFpPeDV1UjlQRmlWcUN4OThCR0JzUHh0?=
 =?utf-8?B?OVQ3MzBTOVFLN04weTZXWEtEalVQNVcvUmNXVE1jRVMrVU1hVVFRYWdnVWs2?=
 =?utf-8?B?SHk5dTUvcm5WYXlZQml2R2ZGdEpnWUtkZkxtTlkrQ1VvSytZR3U0OVhjcStX?=
 =?utf-8?B?L2ZpcS8wcWJzd05QckdKb3NYM2lLUlIxcnV6YWk0azVuaU9SRVkvejY3VEtI?=
 =?utf-8?B?QU94cElheTUvbnVIWUFUNkQzbVpxNU4rdEVpZUt1YVd6dWFia2t6RzFMQkZB?=
 =?utf-8?B?Vk9qeTc3MldGaXdUY0tOSk9zNFdVOHFYemxJTVl0TEhXTlZiTkZ6WjR6YmxO?=
 =?utf-8?B?OUpySDM4SktnNlVWdVV1Skh2RzVvTVV2eE14ZTkybExkUUQwVXY4V1ZZaXYw?=
 =?utf-8?B?cHdEbVJaOTJGUFJjSlNRY0wxN0IrdTBmSkltWVFMME1sSENCZUp4ZEtwQUxa?=
 =?utf-8?B?OFJrcnRyVk83Q2s5VkVWbDRhbmRwK293cEJVQk0rWjlrbjUzWCtScG9MNDU4?=
 =?utf-8?B?b0lPTk5iK2ZybW90amNMazFWSGpYbERnUTcxNW1vby92MXNCREs4R0NYM2xJ?=
 =?utf-8?B?Q3F6a3NPeXUzUHVyLzl1QjZCRHBWd204UnVJeVVvNHQwVGZhZUE0L2wyK2wv?=
 =?utf-8?B?aEZGeWRnbkxDV0dmUlI5UXBsUDBWY3BHd2VLZUx3bHZFQTJ2d0ZaK2FXV2RR?=
 =?utf-8?B?Ull0cnlQcnRkZW9XTEpqNzZRZ0RZNTJ4OEVRdlU0Qk1rUFZ6cTF4V0FiMkJN?=
 =?utf-8?B?QU1FUThIalFNTjJyTVJ5NmdrQWx1cW9qRHhLdmo3MUxFNHZvWTNwUVFIYS9q?=
 =?utf-8?B?aUFrd0tyM3VRN1ZsdG04YVBBeG9iNmVNYUFTb25HKzlVd1c0K00zNmFHc2Jw?=
 =?utf-8?B?cDBPejkxUE5sd0ZvYTVaVTg0akVYZVVBU3JtVFBDY3E2VTM1TFFVT3RtWFNR?=
 =?utf-8?B?YzlJazdmS0RmSmI2d2FUYlpvZzg4bFd0UVJyUVFtSUhPSjEybVNveWk0ZXBG?=
 =?utf-8?B?SGhGN1FYOW1ZcTA5dHFpWFcvN0RCaFVXcUZGK0FadGRNeE9tWUkySS9VUFhV?=
 =?utf-8?B?a09UNlRORXFQSXZIdW52UVVCaHlmSkZsRElZRWV5Z2t1bDJPT3R4T2ZBYXVZ?=
 =?utf-8?B?UDFwQTdyYVNOcHZISi9xbnFiaTFQS0o5TXExOC9EVFlLQzl4MTVVL0tJcEJF?=
 =?utf-8?B?Yk5SR3M0OGdrZkJDK0RiK0dSSnBna0dxNmtNeDR5RGd5ckprb1djMTFtRXhB?=
 =?utf-8?B?U1V1TGJpOUhIRXM3UXdmWUNxMzdQYVBySW9EdG9CcCtBVlBseGlkK3VUcThj?=
 =?utf-8?B?b2ZtUnc3OGE4a0NUZXcwQlMzNEhFaXo2TDVXVmFtOEw2ZHF1ZDh4NXg1aXoy?=
 =?utf-8?B?UGhDZE9MWVNGaXdZOGxZT0c0UmxSenF6YTBIK2QvbzI5YVJkeW00MndSMHpB?=
 =?utf-8?B?a3k5L2lndUpiL0llaTZOZnM3Rm55M2tEMlBOZnMxT3JyMDE3d0ZwL2Nobzlm?=
 =?utf-8?B?Ynp6bnNtenlDencxNGRrcWlIZVZaaG9PYllIMFMydjVhb2xkeDI3cWt4eWZ0?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf8d7b53-9485-40f2-f6d8-08de0d9a6867
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 16:29:56.5118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: akvTsTh1wtnK9ThsxwbCXv4RMsG/yA1W7Xf7OKA2+PQJcB/Sk7BcPg/FMl8oiOnEYaBwt+lRwwNEM5j5QSjWKHcJsbW6gUT2MXxXT7a0aPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8323
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



On 17-10-2025 20:56, Ville Syrjälä wrote:
> On Fri, Oct 17, 2025 at 08:46:37PM +0530, K V P, Satyanarayana wrote:
>>
>>
>> On 17-10-2025 19:57, Ville Syrjälä wrote:
>>> On Fri, Oct 17, 2025 at 07:42:28PM +0530, Satyanarayana K V P wrote:
>>>> The CCS copy command is a 5-dword sequence. If the vCPU halts during
>>>> save/restore while this sequence is being programmed, partial writes may
>>>> trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
>>>> instruction to write the sequence atomically.
>>>
>>> If this whole thing is so racy why don't you always add a new
>>> BB_END after new commands, and only replace the previous BB_END
>>> with NOOP _after_ the new commands have been fully written?
>>>
>> We maintain a suballocator for batch buffer management, with size
>> proportional to system memory (e.g., 16MB suballocator for 8GB SMEM).
>> Batch buffers are dynamically allocated from this pool based on the
>> number of active workloads. The entire suballocator region is submitted
>> to hardware for CCS metadata copy operations.
>>
>> We cannot insert BB_END commands after each individual instruction
>> sequence because additional GPU instructions may be appended later.
> 
> You *overwrite* the previous BB_END after the new commands have been
> appended.
We do not know where the new BB allocation will be. It may not be 
sequential and every BO has a BB. BBs are allocated and freed so often 
based on BOs getting created and destroyed. So, we can't use that approach.

-Satya.>
>> Instead, a single BB_END marker is placed at the suballocator's end to
>> terminate execution.
>>
>> This patch ensures race-condition-safe CCS metadata save/restore
>> operations by guaranteeing atomic writes to the batch buffer, preventing
>> corruption regardless of when save/restore operations are triggered.
>>
>> -Satya.>>
>>>> Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
>>>> 8 dwords instead of 5 dwords.
>>>>
>>>> Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
>>>> chunks.
>>>>
>>>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>>
>>>> ---
>>>> V6 -> V7:
>>>> - Added description explaining why to use assembly instructions for
>>>> atomicity.
>>>> - Assert if DGFX tries to use memcpy_vmovdqu(). (Rodrigo)
>>>> - Include <asm/cpufeature.h> though checkpatch complains. With
>>>> <linux/cpufeature.h> KUnit is throwing errors.
>>>>
>>>> V5 -> V6:
>>>> - Fixed review comments (Rodrigo)
>>>>
>>>> V4 -> V5:
>>>> - Fixed review comments. (Matt B)
>>>>
>>>> V3 -> V4:
>>>> - Fixed review comments. (Wajdeczko)
>>>> - Fix issues reported by patchworks.
>>>>
>>>> V2 -> V3:
>>>> - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
>>>> - Updated emit_flush_invalidate() to use vmovdqu instruction.
>>>>
>>>> V1 -> V2:
>>>> - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
>>>>     (Auld, Matthew)
>>>>     - Fix issues reported by patchworks.
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_migrate.c | 112 ++++++++++++++++++++++++++------
>>>>    1 file changed, 91 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>>>> index 3112c966c67d..e0be7396a0ab 100644
>>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>>> @@ -5,6 +5,8 @@
>>>>    
>>>>    #include "xe_migrate.h"
>>>>    
>>>> +#include <asm/fpu/api.h>
>>>> +#include <asm/cpufeature.h>
>>>>    #include <linux/bitfield.h>
>>>>    #include <linux/sizes.h>
>>>>    
>>>> @@ -33,6 +35,7 @@
>>>>    #include "xe_res_cursor.h"
>>>>    #include "xe_sa.h"
>>>>    #include "xe_sched_job.h"
>>>> +#include "xe_sriov_vf_ccs.h"
>>>>    #include "xe_sync.h"
>>>>    #include "xe_trace_bo.h"
>>>>    #include "xe_validation.h"
>>>> @@ -657,18 +660,68 @@ static void emit_pte(struct xe_migrate *m,
>>>>    	}
>>>>    }
>>>>    
>>>> -#define EMIT_COPY_CCS_DW 5
>>>> +/*
>>>> + * VF KMD registers two specialized LRCs with the GuC to handle save/restore
>>>> + * operations for CCS metadata on IGPU. The GuC executes these LRCAs during
>>>> + * VF state/restore operations.
>>>> + *
>>>> + * Each LRC contains a batch buffer pool that GuC submits to hardware during
>>>> + * VF state save/restore operations. Since these operations can occur
>>>> + * asynchronously at any time, we must ensure GPU instructions in the batch
>>>> + * buffer are written atomically to prevent corruption from incomplete writes.
>>>> + *
>>>> + * To guarantee atomic instruction writes, we use x86 SIMD instructions
>>>> + * (128-bit XMM and 256-bit YMM) within kernel_fpu_begin()/kernel_fpu_end()
>>>> + * sections. This prevents vCPU preemption during instruction generation,
>>>> + * ensuring complete GPU commands are written to the batch buffer.
>>>> + */
>>>> +
>>>> +static void memcpy_vmovdqu(struct xe_device *xe, void *dst, const void *src, u32 size)
>>>> +{
>>>> +	xe_assert(xe, !IS_DGFX(xe));
>>>> +#ifdef CONFIG_X86
>>>> +	kernel_fpu_begin();
>>>> +	if (size == SZ_128) {
>>>> +		asm("vmovdqu (%0), %%xmm0\n"
>>>> +		    "vmovups %%xmm0,   (%1)\n"
>>>> +		    :: "r" (src), "r" (dst) : "memory");
>>>> +	} else if (size == SZ_256) {
>>>> +		asm("vmovdqu (%0), %%ymm0\n"
>>>> +		    "vmovups %%ymm0,   (%1)\n"
>>>> +		    :: "r" (src), "r" (dst) : "memory");
>>>> +	}
>>>> +	kernel_fpu_end();
>>>> +#endif
>>>> +}
>>>> +
>>>> +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
>>>> +{
>>>> +	u32 instr_size = size * BITS_PER_BYTE;
>>>> +
>>>> +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
>>>> +
>>>> +	if (IS_VF_CCS_READY(gt_to_xe(gt))) {
>>>> +		xe_gt_assert(gt, static_cpu_has(X86_FEATURE_AVX));
>>>> +		memcpy_vmovdqu(gt_to_xe(gt), dst, src, instr_size);
>>>> +	} else {
>>>> +		memcpy(dst, src, size);
>>>> +	}
>>>> +}
>>>> +
>>>> +#define EMIT_COPY_CCS_DW 8
>>>>    static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>>>>    			  u64 dst_ofs, bool dst_is_indirect,
>>>>    			  u64 src_ofs, bool src_is_indirect,
>>>>    			  u32 size)
>>>>    {
>>>> +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
>>>>    	struct xe_device *xe = gt_to_xe(gt);
>>>>    	u32 *cs = bb->cs + bb->len;
>>>>    	u32 num_ccs_blks;
>>>>    	u32 num_pages;
>>>>    	u32 ccs_copy_size;
>>>>    	u32 mocs;
>>>> +	u32 i = 0;
>>>>    
>>>>    	if (GRAPHICS_VERx100(xe) >= 2000) {
>>>>    		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>>>> @@ -686,15 +739,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>>>>    		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
>>>>    	}
>>>>    
>>>> -	*cs++ = XY_CTRL_SURF_COPY_BLT |
>>>> -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
>>>> -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
>>>> -		ccs_copy_size;
>>>> -	*cs++ = lower_32_bits(src_ofs);
>>>> -	*cs++ = upper_32_bits(src_ofs) | mocs;
>>>> -	*cs++ = lower_32_bits(dst_ofs);
>>>> -	*cs++ = upper_32_bits(dst_ofs) | mocs;
>>>> +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
>>>> +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
>>>> +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
>>>> +		  ccs_copy_size;
>>>> +	dw[i++] = lower_32_bits(src_ofs);
>>>> +	dw[i++] = upper_32_bits(src_ofs) | mocs;
>>>> +	dw[i++] = lower_32_bits(dst_ofs);
>>>> +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
>>>>    
>>>> +	/*
>>>> +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
>>>> +	 * save/restore while this sequence is being issued, partial writes may trigger
>>>> +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
>>>> +	 * write the sequence atomically.
>>>> +	 */
>>>> +	emit_atomic(gt, cs, dw, sizeof(dw));
>>>> +	cs += EMIT_COPY_CCS_DW;
>>>>    	bb->len = cs - bb->cs;
>>>>    }
>>>>    
>>>> @@ -1006,18 +1067,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
>>>>    	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
>>>>    }
>>>>    
>>>> -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
>>>> +/*
>>>> + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
>>>> + * save/restore while this sequence is being issued, partial writes may
>>>> + * trigger page faults when saving iGPU CCS metadata. Use
>>>> + * emit_atomic() to write the sequence atomically.
>>>> + */
>>>> +#define EMIT_FLUSH_INVALIDATE_DW 4
>>>> +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
>>>>    {
>>>>    	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
>>>> +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
>>>> +
>>>> +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
>>>> +		      MI_FLUSH_IMM_DW | flags;
>>>> +	dw[j++] = lower_32_bits(addr);
>>>> +	dw[j++] = upper_32_bits(addr);
>>>> +	dw[j++] = MI_NOOP;
>>>>    
>>>> -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
>>>> -		  MI_FLUSH_IMM_DW | flags;
>>>> -	dw[i++] = lower_32_bits(addr);
>>>> -	dw[i++] = upper_32_bits(addr);
>>>> -	dw[i++] = MI_NOOP;
>>>> -	dw[i++] = MI_NOOP;
>>>> +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
>>>>    
>>>> -	return i;
>>>> +	return i + j;
>>>>    }
>>>>    
>>>>    /**
>>>> @@ -1062,7 +1132,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>>>    	/* Calculate Batch buffer size */
>>>>    	batch_size = 0;
>>>>    	while (size) {
>>>> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
>>>> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
>>>>    		u64 ccs_ofs, ccs_size;
>>>>    		u32 ccs_pt;
>>>>    
>>>> @@ -1103,7 +1173,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>>>    	 * sizes here again before copy command is emitted.
>>>>    	 */
>>>>    	while (size) {
>>>> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
>>>> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
>>>>    		u32 flush_flags = 0;
>>>>    		u64 ccs_ofs, ccs_size;
>>>>    		u32 ccs_pt;
>>>> @@ -1126,11 +1196,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>>>    
>>>>    		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
>>>>    
>>>> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>>>> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
>>>>    		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
>>>>    						  src_L0_ofs, dst_is_pltt,
>>>>    						  src_L0, ccs_ofs, true);
>>>> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>>>> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
>>>>    
>>>>    		size -= src_L0;
>>>>    	}
>>>> -- 
>>>> 2.51.0
>>>
> 

