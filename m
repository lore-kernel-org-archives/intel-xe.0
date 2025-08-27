Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4770CA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 20:44:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A299D89067;
	Wed, 27 Aug 2025 20:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lnIlO5v8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF07289067
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 20:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756327440; x=1787863440;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EFqMZhWShOKiFdnLwWGfFHTMQp6FS/n+iNUxLzzgx6w=;
 b=lnIlO5v8cDykp2fDF9LyxqNQz/VS28xB+lfaRX6jo3X/9SjcQAFuJ1hz
 fxy9YW3cC6/lGqKDUL1hz5jXXNH8KKuAeXWpu3AtrYKyCnPIGq1eqm3z3
 TDXc1HnjfYPZx+gonyeK+TwsqMrfEiQUFYI8Si71gJnbboZoK6Kb+dDlC
 Iovt/t3CU95Sg4LAfwYbGrzyfsknE3RAMJeXcd4kKAiU80+5CuFgwKMod
 OQdiRvon+2Pfr0W3sIylxsCaM1hgfoNX5brIEhO7IDZKf8ADZLpCK3xzX
 VCRlyPFcmjMdPBjuvi8UpNMnTT8QDCgcuqytAICA0pGOsGEtLrjOEaUea w==;
X-CSE-ConnectionGUID: AprMdDeNTliIANKnKVJBSA==
X-CSE-MsgGUID: hnNOOlHhRfGF8C7kbpZyGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62426476"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62426476"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 13:43:59 -0700
X-CSE-ConnectionGUID: ox6llZoXQUawpAidfZ97sQ==
X-CSE-MsgGUID: oy5bweH4TVmecnYyp0YnHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="200830306"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 13:43:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 13:43:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 13:43:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 13:43:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gkBtz/OQrUgosFRIfRwLjYE4zEN36hlUh3v53Yg3a4JlCSVw0rqf4VimrkVStB+Xy5QeZHZ7eyJdRa0wibXIJMLC5DJJhhROx5kkEbIMn2LTfPweNnI304KLdciDUceglzippllytl9aCYtxPt++F2+qDi+48PuHWS2cfQ4zUFot1eJHUbJAuBHhRfegqfjyehjUjOl8NssNxJCDsIc1nqj4nv7Pbafi4zIAgHcvRwBRP4pMqAoi2UTsg9Z9tDQRvsnGyBTwM5/SBE16EgBV1Pd6iy8VlbA3XVbgnYc7l9H4FPSAUX+6S4KrlJ4kLIiPw4G7CGuqSwKu8LVbWD2WOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSwhRzYh5QAS9M6AHFyHc0RGx5geDn1LJjUBIU4LYJI=;
 b=jGCfPQrRaRtbRWRElrI7Ql/ZPdonWLkTczZyHkiu7igjoEDdrBljerKRPMaH5I+eYzWS5uWmOuyo+ggMRjWxHf0pZ4i4nZwZDwxmBQvkq9YjFMtPDCvTH/q7QfZyLSXDn/15RQPf0MxixNGsSjyeTRfMH4kAte9E1G/4bWmMBika1xRoJ5KAu02+/GW1YX64PnkFV4dkdAtFJbQdKDpR5dVzTvN0FjC8Fedbc6b3hlkAkkqjPF1HbmAbLwiyH0QE/goMPmyUNF6AiyXNXmo9a3VacNPZKacy/tIxox/xPjGBSHXDSu/mfNim5TxKXS1KlMfrlXSbnz+xIaGOxTFLTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by LV1PR11MB8818.namprd11.prod.outlook.com (2603:10b6:408:2b5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 20:43:56 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 20:43:56 +0000
Message-ID: <c3c37370-d021-40ef-b723-c54809d321af@intel.com>
Date: Wed, 27 Aug 2025 22:43:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/xe/guc: Track pending-enable source in
 submission state
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250818172243.2649863-1-matthew.brost@intel.com>
 <20250818172243.2649863-3-matthew.brost@intel.com>
 <8295cb2d-ded1-4a00-837a-e89d1c3bdf89@intel.com>
 <aK9YFYaTHiOhK69o@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <aK9YFYaTHiOhK69o@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0122.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::20) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|LV1PR11MB8818:EE_
X-MS-Office365-Filtering-Correlation-Id: a08b071a-52ca-4f49-412a-08dde5aa70e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGxtZTg5cHY0bzNIdzdUU0FrVFI3SUZ3TWZDVjhaQmxjM2o2MmV6bEJNTWtS?=
 =?utf-8?B?c2hXOTdpTytwejZlZEV4RHRxUFBodUl0cktFcEhPUW84Y3N5MGpubXgwdXlH?=
 =?utf-8?B?Vk50WVdnOGNBTExIemJjRVFpdEJmTEhNdDRhdDYreFRLb3hXTzNXN201UFI0?=
 =?utf-8?B?TVRNaDA4S2Jjbk9tT0s4U0doVFhsR1VTTnFyb2F0bEFKQnFBSDFMUVBzbUR3?=
 =?utf-8?B?L2JCWUo0OVFQcmlLTUdPT2dmUzVneWYyck9yY2czbVRtak1OWDRPbGhDYkJE?=
 =?utf-8?B?YXhsUUQ5bDBuc093TkFvQ1V0YWUvU1pOL1VGSzFuYjRBNGlHYlBUMVgzK2U4?=
 =?utf-8?B?Z3p2RkZPOEJPdzg3UllUNUhxZDBaN05ER2t3NmxTaVJ1Ukt2dStjVVQya1RZ?=
 =?utf-8?B?dktub2JRaTJsN1FrdUFIZ3lPa2szVjBDcXVtdEhJK090Sy9EdEpEcUx2NWZy?=
 =?utf-8?B?ajl4L1VuVEQyWXhCL2ZhTXpMSEl5dkpESWFaMG05Z3Zhek9WTGxTN29xUUE5?=
 =?utf-8?B?R0J0VWdGaGw5aGRRV2lwSlBZOG9KRUFBTmMvWEdWdldCcENLMjBrRTBQSzZK?=
 =?utf-8?B?cGVkenJmcGx4emR1QkRvVlR6YWpCT0I3R292RUQwci83Z3RPTnNSL1NHMTJq?=
 =?utf-8?B?c2hBU294dThjU3VPeW5NM0FrVTJ1WXMrTFgxOTljRUg0WGx2ZkkzTERON1kz?=
 =?utf-8?B?cFBXNnFUa2hlMWNVQ0ovb0xBbjFxREc1MU9FTVVRUWF2MlNkbS9ZSzRwK1py?=
 =?utf-8?B?RkRuV2JhbUt6c2ZzOVYySkw5b3ZNS2lJTDFsSU8vVDI3aGwrUHpDMGl0STZI?=
 =?utf-8?B?VW1td3VwR1ZXQ2NhcHd6UGRBUENSUk9kaDNqaGpFcktuVlBHeUtRZk5WN29a?=
 =?utf-8?B?MkxjRHdLekJ2NjVxbFJzck9rZXNjUXQzeUFqOEczT2pKUXFKeENIRnVYNTRo?=
 =?utf-8?B?N0h0VTN5OGE2WUM3TU9FV1NWRTEyeXFGSjlqTUxJUldXVXROamN3cjJsL1J3?=
 =?utf-8?B?WFhtVVphaDZZQkY1V20yVmtVQkx6QjhjelllY3p0OHJpQkFhRTBYL1FtaExX?=
 =?utf-8?B?d0tCaXB1YzhNVnNEQ3pjMzhDUlMzeGowYkRMZVVoZ01qU0pyb0pheGhxRjZy?=
 =?utf-8?B?bzFGbGJ4akRYSExBOGE2NFdIVC8waFlqaDd6TzZOOGQ5RWphcTFzcFNsN2h2?=
 =?utf-8?B?ZXluMVN0cXg1M1ptTUVJblRkQ25WOHE2WGNLd0JBSUx6Rjk3ZVJNM1R3d1Z2?=
 =?utf-8?B?ZmVOUlVGdURVb0RqeDd1NzNScDRieVU3c1RySmUvbU5HaFZJeDhWbWszdEJ2?=
 =?utf-8?B?b1RhVjZyWVc4ZWlYUGVrSVA2SWZlTFV5K1JrM0pXcmNRTXZ1QUg5QmlCSU5W?=
 =?utf-8?B?NjZSOWdGdE0rYzNiQnJFeWNtcGxwSUdsOEkyRlRnTWdpaGRBOFpoWTNheUVT?=
 =?utf-8?B?cm9taG44bXRzTG92Q2crWnFyWEc1RlZ2dGYrNEhnZ0R5Ynd6Y29kekZjY3F4?=
 =?utf-8?B?RFd2eHlyZVBsVEw0S1c3YmtOU21DQmtzRWYyb3RXRFpHMXRrYk9yWkJhKysw?=
 =?utf-8?B?VVJnVlRldG1QTjZ3ME43U2RrMG4vcHJuSGhqZU9YZmtRRGo2NEEzdEFIbHc0?=
 =?utf-8?B?SGMvWEJBV0lDS051K2FIVUltUG5adTc2MWtaemhiczF3TkMzNFl1akk5Ym1N?=
 =?utf-8?B?NkhQc291NENkWk1BR2lteWRWN1hzM2RveGs0WnJNWlJ2ejR1cjNTOEpQemI4?=
 =?utf-8?B?OVdNT3FyT1Jkd2E1YnBrZFlNdW1Wd0dQVDRSVEZVTkEzMDEvNXlJcWZ1MVlB?=
 =?utf-8?B?aHZpcjV6bldnTWhwbnRob216RzFlQnRzZkRSNk9IUGxCekRiN1IyOW91QnlH?=
 =?utf-8?B?bFJZSzFBaUgrVTkxckJzVmFHZEZ3enhIYmNVWlFMSHAzOFpESnVEem1OM2J5?=
 =?utf-8?Q?B9CxGT+qfEs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnhvV2cwdWNnMVlKejZGbkJIREVsYXlSUWg5RkZEa0xUVjBVNjkwaWVlMis1?=
 =?utf-8?B?eWN6bGo1d2w1ZU4xNXZpWmFJU21WeTA4M2R2WWgrVXFFa0lZa0dXRnVtckls?=
 =?utf-8?B?aThXL1kyc3NTQ09wcmVGYllRNGJxa2k0RkthNEc2ejNJbGswRHZaWThtY0NJ?=
 =?utf-8?B?VUwzMWMvU2paUWZicVFGTjY3RTg5M1hKV2o1YW5KNWowL0pFSWhvQjBVcHJx?=
 =?utf-8?B?OE9FckVDZVhDVlhLNjFBTitoMHZ3Sm9xa0grbEMyZGVpWXYwMkx4ZWlhWDVq?=
 =?utf-8?B?S1RtaEh3UENmSjk1RHRsQ0YveUp5VDhxRG5hNFo5Q0pCLzNTc3UybFpmTklo?=
 =?utf-8?B?ZEwwRzN3OWJVVDcrRFZsRFFBRDN3QWdleDhROWZnR3RBMm5HVG1OZ2lONzEr?=
 =?utf-8?B?dE1pRE1iUlY4MmxuYTMrUElOdDY2SzBlcDNHeGJIMk9IUEVZTHBEVU5rUHA0?=
 =?utf-8?B?Mlh6S3VjVFJNQXFrY25DaS95a0hRcDV2SS9RQXcyVXJKd3ZreHJBZkxWT3ZW?=
 =?utf-8?B?SkJ2T3BPMHVXWGIyd0JBVVowQjVTTHFlajlZNkJrOWR6SjlMTm13UjBGNUVu?=
 =?utf-8?B?QUJVcm9OcGlwSDZJWk1NZEljWUlMR3pTOTBMaVg3bFhOVmMrMHkrejFYaXNq?=
 =?utf-8?B?bGF0YWVBYUllanNNQ093UWcveFFQSkVlVU8xYzc4TXFhL3Z5a21KOVNNQWxS?=
 =?utf-8?B?cjBhQlJYN3hEYWZHeWo5eDUvVEsrYmF1TGNPS3Z5Z3Y5dWhUc3MrVm40MHRR?=
 =?utf-8?B?b0RVNy9wMlF3bWVzNjMxZkdLcnU3eUxCOFNUSXk2RjVFSElFNE04Y3Z5ZTQ0?=
 =?utf-8?B?Qmt2OGJsWExCS0I4T09JdUw4Z1ZUSG9UMkRzVjRuUUJGYitVbUduNVA0cGhZ?=
 =?utf-8?B?QU4zZVRCenpSSGMzTTRaRStOL3BsS3c3clcvZWl6cVBCbnBLT2F4Rk55TWdY?=
 =?utf-8?B?Vkd6Ky9RM0EvTzFNNmtNSlZQNXNybk5oc2tvTUowaEh3Y3E1YXRNT2FZMUc2?=
 =?utf-8?B?RUNGeWJ1Wm9yRSswd1FHS1dUSzdyNTVKVkdCWWxYV0lXRXFGLy9iTXBCTDhW?=
 =?utf-8?B?SmdQZG5sWGVENnR0TFhyc0xkZlhkamF5SjF6ZU40UEdxY0ExeXVVdFlJVlFY?=
 =?utf-8?B?eEt6NjFjVEpsclRQT0d1cjN4aXQzSnZVcXBGbHpyTkt1OG9ZbnVKK2hqdDJ0?=
 =?utf-8?B?SUp2NG1sMklDZjFxempTTkhKQ0RlT01JYU91SUpHOE1xcTVQamlPLzVSMEg4?=
 =?utf-8?B?MGJWUkJWc204WmFReE45MFJ3a3lOMWNoeFhiTWpqVlRMakdYY3BwTVg3Rm5M?=
 =?utf-8?B?bjZLM09ORElRckVPdFpLOHNQYWszUGp5VEI0ODN3eHRZbkw1QnlrSGl1Umo2?=
 =?utf-8?B?SDhZaWppbmRZMXpPcVBYVU84RHpLd2FHajI0WVY3bXVDVWpwZEhBTVhKR05i?=
 =?utf-8?B?NnVGQ3JWNXU5cWJvWEFLbFVuTG5zc1JndWlNdENnOG5qanNGRXhYTEYvWUk2?=
 =?utf-8?B?UGdzREsxNmRyVG5sWjZZY3pJK3JVOUp5bmlRSTllOHU5SzJCVDhUT2dFZWNP?=
 =?utf-8?B?blh2blZRNUI5UmUyd2NsN3FORW1zd093QVZiSkZ3ZjIzRUh1aisvQXMySWRK?=
 =?utf-8?B?VDF1RnNjZ0JuWmJmWUl4R1ZNS3kwR3ZHUUtPZHB5NU5UKzFjVnVzb0FTUml0?=
 =?utf-8?B?YzVPeURZZnZmMDRGUkI4aFJCRFFPR29NWVNyaGpYRHM3TVpZZlY4Zmw3K0VC?=
 =?utf-8?B?b1d5cElPUzFTRHU3ckFBRG9nNVJ6eUpTb1Z3Y0d3YXhwN0E5ZVV2blpQaE9o?=
 =?utf-8?B?Z0JwRFVWNkN5Skd0S2ZtVm9GSDZYNEtCTlZubmljakEzcGNXcHVlUzQ2V091?=
 =?utf-8?B?U2xkT1ZhcEp3aDU3QitZbS9TdDhhZDh5eU1NSVFzdk1OWVJWMTcvTzNVeXdG?=
 =?utf-8?B?K0hDZWx0UG9tR2JGR3RyVEdSY1ZHL3FXMi9UYVdabFZGR3R0NUVWbW5mVHIx?=
 =?utf-8?B?UnlwNWRQVy9McVE4dXZXckVzZlBvYm1DRzk1cCt3ZGloU21TdHB2ZVhQaEpp?=
 =?utf-8?B?UG03bms2cU9KM0p5Q0psN29UUVJLU2hPbER4cGpBS0V3SWlZcjJ6ZWFCRUJz?=
 =?utf-8?Q?kh9nJbEl7sh5NQD5BiWOsJo5b?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a08b071a-52ca-4f49-412a-08dde5aa70e7
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 20:43:55.9417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8bmh1Jn9eK3G2F5CH5SCyJhjSS7kZyyC62w2e/D0b3JgdffXAe9ak0i8WEv29Iu1zpkrsXUQ+jcEQOa/gWOf9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8818
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


On 8/27/2025 9:10 PM, Matthew Brost wrote:
> On Wed, Aug 27, 2025 at 03:56:59PM +0200, Lis, Tomasz wrote:
>> On 8/18/2025 7:22 PM, Matthew Brost wrote:
>>> Add explicit tracking in the GuC submission state to record the source
>>> of a pending enable (TDR vs. resume path vs. submission). Disambiguating
>>> the origin lets the GuC submission state machine apply the correct
>>> recovery/replay behavior.
>>>
>>> This helps VF resume:
>> VF restore
> Yes.
>
>>>    when the device comes back, the state machine knows
>>> whether the pending enable stems from timeout recovery, from a resume
>> VF post-migration recovery
> No, resume is done a per queue thing. Resume can be triggered from
> preempt fence resume worker or page fault resume worker. It is about
> toggling the queues runnable state to enabled so it can be switched back
> on the hardware.

ok, can we then call it with a unique term? "Queue resume"? "EQ resume"?

>
>>> sequence, or submission and can gate sequencing and fixups accordingly.
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_guc_submit.c | 36 ++++++++++++++++++++++++++++++
>>>    1 file changed, 36 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> index 1185b23b1384..9e4118126ef9 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -68,6 +68,8 @@ exec_queue_to_guc(struct xe_exec_queue *q)
>>>    #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
>>>    #define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
>>>    #define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
>>> +#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 12)
>> you meant RESTORE. But restore is mostly done by PF side, small part remains
>>
>> when we reach raising this flag, so that is not the best name either..
>>
>> VF_FIXUPS? VF_RECOVERY? GGTT_FIXUPS?
>>
>> Maybe VF_FIXUPS is the best for this context, as fixups will be applied both
>>
>> for migration recovery and for VF PM resume. GGTT_FIXUPS is longer and
>>
>> will likely not match future platforms, where other fixups will likely be
>>
>> required (we already have compression metadata restore, and the future
>>
>> looks like more are coming).
>>
> See above. This has nothing to do VFs or PFs, it is an internal
> submission thing for LR queues.

Right, ok.

-Tomasz

>
> Matt
>
>> -Tomasz
>>
>>> +#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 13)
>>>    static bool exec_queue_registered(struct xe_exec_queue *q)
>>>    {
>>> @@ -219,6 +221,36 @@ static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
>>>    	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
>>>    }
>>> +static bool __maybe_unused exec_queue_pending_resume(struct xe_exec_queue *q)
>>> +{
>>> +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_RESUME;
>>> +}
>>> +
>>> +static void set_exec_queue_pending_resume(struct xe_exec_queue *q)
>>> +{
>>> +	atomic_or(EXEC_QUEUE_STATE_PENDING_RESUME, &q->guc->state);
>>> +}
>>> +
>>> +static void clear_exec_queue_pending_resume(struct xe_exec_queue *q)
>>> +{
>>> +	atomic_and(~EXEC_QUEUE_STATE_PENDING_RESUME, &q->guc->state);
>>> +}
>>> +
>>> +static bool __maybe_unused exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
>>> +{
>>> +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_TDR_EXIT;
>>> +}
>>> +
>>> +static void set_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
>>> +{
>>> +	atomic_or(EXEC_QUEUE_STATE_PENDING_TDR_EXIT, &q->guc->state);
>>> +}
>>> +
>>> +static void clear_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
>>> +{
>>> +	atomic_and(~EXEC_QUEUE_STATE_PENDING_TDR_EXIT, &q->guc->state);
>>> +}
>>> +
>>>    static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
>>>    {
>>>    	return (atomic_read(&q->guc->state) &
>>> @@ -1344,6 +1376,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>>    	return DRM_GPU_SCHED_STAT_RESET;
>>>    sched_enable:
>>> +	set_exec_queue_pending_tdr_exit(q);
>>>    	enable_scheduling(q);
>>>    rearm:
>>>    	/*
>>> @@ -1494,6 +1527,7 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
>>>    		clear_exec_queue_suspended(q);
>>>    		if (!exec_queue_enabled(q)) {
>>>    			q->guc->resume_time = RESUME_PENDING;
>>> +			set_exec_queue_pending_resume(q);
>>>    			enable_scheduling(q);
>>>    		}
>>>    	} else {
>>> @@ -2065,6 +2099,8 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>>>    		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_enable(q));
>>>    		q->guc->resume_time = ktime_get();
>>> +		clear_exec_queue_pending_resume(q);
>>> +		clear_exec_queue_pending_tdr_exit(q);
>>>    		clear_exec_queue_pending_enable(q);
>>>    		smp_wmb();
>>>    		wake_up_all(&guc->ct.wq);
