Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FDECCF9FC
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 13:43:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1A810E0A1;
	Thu, 30 Oct 2025 13:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRYE9fw/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C79F10E0A1
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 13:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761831834; x=1793367834;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Gswx1ky8P5YwuNOBC+8s1VYCg2sgfUWWb4isxK7yGUs=;
 b=VRYE9fw/yTQM1TIX11zQMxRs70dYj2y9y6hqhpk8Xr+pTOx03YTSL9J3
 SlydexGuexFIe5sLxoMFBT9NpmR1BmDqwljWYvkfu4PCqeokM69I7agUM
 SBdD59unLHQni/tl8liBSAX5yctjAoN3+kd5XTVd9GGuHpj75uC9K0tTX
 8JpreBEXU9/rvYqFXifZ0is1XBEtzreHM/q3H41AJJt+YAXHk7eKTWXCI
 1lxr5PUwJnn2yzewnJ2ZsjvX3RbRDt7D8WXyHh5Hq4MoS2x9z6+UohHqt
 3HDyJ+9yXhBpxLswmAHeS5xx48c7Q4P1lKsTWGZS7HgEYz0bN5unyBQQn w==;
X-CSE-ConnectionGUID: pWCdoYAtRi+IGk2V6UqKtA==
X-CSE-MsgGUID: gARrLWvcQw+4jGy+AdXSgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="74264697"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="74264697"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 06:43:54 -0700
X-CSE-ConnectionGUID: 6LAg+tjMTJCNpqpUqa1RfA==
X-CSE-MsgGUID: 8OrGQuY/TuK5Aw3UueX/Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="190031716"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 06:43:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 06:43:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 06:43:52 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 06:43:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQvCUXnBUCnwWNSc0OJRQvLO3REQtVD7IJ2XfpPT1jzkLu2g3znkGnUF0j5gDK1DLSudEOLHVF3SDqBo0VCsyjKUQ7YfYSeisPYpRunVOY0xisrdYWdtdkf/sVzFGYM4EFlFQBvnxXyzhBjDquxjpiNlzppDL/ZYmae7gXZEyin+gwI1apgEf82SP6Cb/RwGFxRkH+kTLU6xlBQOCAWGq9J03FcTr96PzjRuQonyQA3wufqcIHddumd4vq7d5RBmf7Q8ftcMshxiLRfEDkwO7wc2y9oarMiMiU5Nkavp3s/VvlyuKgC7hb9/XItYePkb4S2yn568njMs70+bBUKaQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvaTdi+tAPxVTjdgmkvs+el2JKx96HnZrnOUDXnYx1Y=;
 b=VhozwbSx6gA8ug4xxVI9VDb6tQzlK+4m2RmQZjVFqXDIRvyOrZzSdWSjlXeD3myo1Yr6BLyaHpkqKN2J8tDr8Ke4Vk1oUnWdKV803dDnSII0vwVc/8wVLKqA18Qq0iD5AwSvSnH5duX8PARbZjzV4QE8M/e6DjVu95+JsZV2pgyTxcmIL10SvGUh2ztE3foUiPrhoRQWaqVFocQcC4WdWHt86pBdb7W5Bn6asfMP2M84XtzUULv2FL2tsIOmBSn1+t+fonlZEtqD5lkFYdK1sRcyuLplIBhMIJ3ssCI+4TdTGdoKenELtTYj7XLNiDs6Oe+2xTTB1hkYzZ2NKZVtgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6769.namprd11.prod.outlook.com (2603:10b6:510:1af::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 13:43:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 13:43:50 +0000
Date: Thu, 30 Oct 2025 08:43:47 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 16/17] drm/xe/pf: Allow to stop and reset VF using sysfs
Message-ID: <e4gagt4kem37ogz3ccxzlggznmsveh6pfa44ybghma5zav4swe@edlwn47v2kzt>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
 <20251028175832.184534-17-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251028175832.184534-17-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0119.namprd05.prod.outlook.com
 (2603:10b6:a03:334::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: bde3a9ae-8e10-4f81-6adf-08de17ba5b66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0thZkR2V3Qwc1RtQ1E1VXBIR01FODl2c215bWFNNHBhZVNMZkN6UWs3bkoz?=
 =?utf-8?B?VG5vNmZkeG82bXhSaDI4Y2E0RjJNSWYwS2NLeG1NbGlwVkVDdWRGTms5ZUph?=
 =?utf-8?B?NTF6bUVsU0VXR0Z5L2xabHJGK3FyWmp6c2tyOCs1Q0QvalNEMk02Q0ErZERw?=
 =?utf-8?B?b3gyS0Q2ZkJiRVh5UzFuYWZ0TVZFMTN0QTg1ZHBKbmlBMUVrR1hVbUUxbnhO?=
 =?utf-8?B?TnNieitnODV6RmtNd2VrbjAwejB0T1VrWGw3aUNKaHAvVHpPVEIwNGg4MkNv?=
 =?utf-8?B?dDI0bmc4TmlJTDFoMjFDN0NMMkxUM1RzQTZTS1Z3RDY3N3RkSjZIM05waEJJ?=
 =?utf-8?B?NG5mWnQwbUNnNTJiS0NHTXU1MEJZbG1aYi9wRzdFU1V0WW1YUkdvc24rNnZv?=
 =?utf-8?B?TjNReHM3WDZKM2h1YVgrdmNkdTkvMmh3WlJ4ZTJjY3AzdFVjemdmMWhRTFhE?=
 =?utf-8?B?VFE4dVRtQ212ZDJGQURPdWNZMU9weEZQcmhEWkdOS0JFUTFXME9DSFVrc0Rr?=
 =?utf-8?B?VVhjTm9jV0M2WXpadngvem1yTW1POFUxMG83Rk9XYSswR2VyVUoybFduZnhl?=
 =?utf-8?B?R3l2bTVhVTRXYllLeml6cHpRM1NwMTNMcFlIakpDS0tRU3BxdjNRNzdwSUdU?=
 =?utf-8?B?ejZFRlNYZFFVUEQ1L1lYOHdvUHMrWCs0Z3NOeEttWGVnMnczcXFGZ0xDWHFm?=
 =?utf-8?B?U2pEdnY3TnowdkVMZVVhcDZCWVBvMkVJVmE5VUtDNllKb0ZkWkZCRlBCa1pC?=
 =?utf-8?B?WHZVN05DVGpzWDdMQ3YySWhZQ3BmRmhVTEpwVGZjbXdaaldDQkVXK3ozOUkx?=
 =?utf-8?B?LzRnZUVxRUpVdGdSMlBoR2QxSWhoSXlRcG9wdXBkR0VMb09yWUl6dUZBYXZY?=
 =?utf-8?B?RUJFUzdWTjByR0dEZWtETUloUWF1ZVh1VklzWm5oYUZ0NUNKeXlxNEZKUWYy?=
 =?utf-8?B?bVhpOVorbHlRUlNaaDFoeUZuK0t6N0JtOFZ0M1RKeVhhK1lrZ2ZkRUJEbjd4?=
 =?utf-8?B?YzAvSkwra0NuVHk5cTlqSGxPaS9NamtXcjJ2ZFprNUVDSzdobHlRRHMxVzRT?=
 =?utf-8?B?VjhTRGdJMUZjWFZ3aVpXd2JqT2h6Z25lOGlEanpMQWl4M0w0eDNrZzFaQm9u?=
 =?utf-8?B?dnh4L3JyM0RWRnc1N0FzcDd1cjlaMDBiZ3RFaEtONUtFV3F6S1B3d1dRVkNO?=
 =?utf-8?B?SFlBckRNMVFrbVhYTDdaRExFR0NrQUo4Zm9iRlJTSFhIQzhNT1dRVEZrdFBp?=
 =?utf-8?B?M0VpbE5FV2cwNlo1SjR4MktMR2F0Tk5SV3BLQ1RQU2E2QWpzRVlET0JzSkZs?=
 =?utf-8?B?Qm5ZVW95ZXluR29qOThJUmh5ekp0akttYWFmV1FJb3N3ZUdBK01oTEFsTUJW?=
 =?utf-8?B?N3NWem1PejZvcXBaRmZxK0wrNzNLTHpCWVVSWTNYQXpFUVRhUVpFUkZOUmNi?=
 =?utf-8?B?R00xRThBVDVobDhzbWVuanZWL0xUbzVtT096c2hHbkhoZmtNck5iUFlrZ29y?=
 =?utf-8?B?eS8waXdvRW1TU1hpMllHbXozZ3N2S0dWZlNuejAzTkxOalJITGVSRHB5byti?=
 =?utf-8?B?OVhlSmRZZkprQlAyemZXQmorc2s3R1dQeUtsaklxMjZrYXJiL0lVVTQrT0t4?=
 =?utf-8?B?VEtNZXJheXphOE16WFJ2QWVSSGI2R0RhNnV6SDR1Ym5kU0d3ajdZMGNYcGhh?=
 =?utf-8?B?a29qNm9udi9sOVpDVExpako5ZDN2bUNvQVB5MDRiWlZKQ2JIaytqZW5tTWtz?=
 =?utf-8?B?K29HajJCUW9nSXZ1akd0cGszN1ZHTDVuMFRkNDVsOGovQUl0SWZwZVJOWlJ3?=
 =?utf-8?B?YTBidUFneUVsdnN2VGtpY29OL2dNbGFpNytCZlRGQTNTVUYydFE2UE9XRXFp?=
 =?utf-8?B?ekZFODhYYmpkWXp6aCtaQlZRMW5xck5UT003UlFhTVBIbm5kYWNxZ0tXaE50?=
 =?utf-8?Q?2gfA3orLRCqv6geAmcqG6teTkDG4KjUp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUNXRlJUOVdDcFV0YmpvNW05TitaQWhXVmxXcVg5K3FJNnJJRHY2QVpFd2k1?=
 =?utf-8?B?YTEzR0xkVFd4cHMzeGs5V2s1MFAwa25Lb3ZlWWgrbTNtWlVJdlQwVEZCanlM?=
 =?utf-8?B?Nk9uZndlN2h0Q0hYSDlvSTNlOXF3VUIvZS8rTkdrUFFJcElGRjFxb2dRY3Vx?=
 =?utf-8?B?REFxNVhzMytXN2d4VWtlQTc5dVJTSHh4VjdnTFZiTFM0UEM0SVdEZHhMUDgx?=
 =?utf-8?B?eDB6M0l6L3JacXhVd2diNkx2RmdiM1VWNEhkaE1uakdIdHg2aXlpWEdPcW9h?=
 =?utf-8?B?c3Y2OUdML2NZenFDYnk2WEtHRXNheHVIeDZkeE1Oa2VlNTI2d2JpUlRnRHdB?=
 =?utf-8?B?TG5RYXhnRXJsZW1nWTNsWm9KTTdJK2F0eVJFMzRoekFJR2FrQlJJNWZFYmxG?=
 =?utf-8?B?QVoreDdJem1jazcraThHWm14Mmh6Qk9vZVZYems0d0NuSVo4ekc0MGlqVkIx?=
 =?utf-8?B?UFlldUVyNUZKd09TbHd6VnFrSHpoOEgzN1N2WFk4TFNENGZKMmFsVGk2TWtH?=
 =?utf-8?B?d0cyNk1RSmpzNnpmVGloRUwzMVRidVVmaGlQMzZVa2drU1dhc3BIK2RQaSt5?=
 =?utf-8?B?WWFoM0hrRzhMSFRXYVkxRTR1T0VlN0NEME5qR1hqaXFURmlUdXB4NGNuMGlJ?=
 =?utf-8?B?T3FyZ0s2ZzZsNHNNZi91eHFNTlB1NllBVjM5dVEyZEg3MzJNYkcvMG5NRmxl?=
 =?utf-8?B?Z3lpQng5dExURHRwT2pQMW4rWElWcU1rTERLbGdScjR3dTVaVk94RjJUdkVh?=
 =?utf-8?B?UjFmSEJ4cE9lRkNuTy85cmNiSUZjWjIzOWR1TTFVT2hXUm1oaVlubnAyTENK?=
 =?utf-8?B?QVdWNWg1bDNvKzNDTkQyM2M5bEZkSVpZcFI1dFhPeVB1TnIvMEJFTFdEUFZE?=
 =?utf-8?B?VDNta3NyV2F3cThWQTEwK1ljNzF5N1QwOE43bFdmWGpYUFRzM3VOeSsyZlQ4?=
 =?utf-8?B?RXNBZG1aRGFMTTUvcHNCemdtZEtJVEg4VlZJdnBpWXQ0dGdGV1Q0OG03UVZV?=
 =?utf-8?B?TVdzS1NvY3NBUnB6ZjhqSGFIeFkvKzdUQ0RnWkdQSnpkei9ZdENJM0N3ckl1?=
 =?utf-8?B?cVJVTnlyNjJpdTV6dFRuTUlicGx5aVZGVFdwNHlkUStTTm56Vmk0My9jdDZG?=
 =?utf-8?B?VWQ4V3BReXlTa3c5bXMzcmRQTEQ4MjEvTlBaUUE4enlHZ25UYVpVb0hxblhH?=
 =?utf-8?B?VmdCSi81ZHZOMlFRbjVkNXY3VnArdVhWV1ZLSmtlUlB2SjFsZEdnZmV6V25q?=
 =?utf-8?B?QlZNcE5LRHdGUFdpdmNqeG13dUFqb0J1a0F2RDh2SWhDbWJlczJPVkp4UFR4?=
 =?utf-8?B?Q293WllTUHVzM1JLVWhMU0xpbHhNeWlCMkxkdTZ5Q2xyYm1McGkvQkNYREU0?=
 =?utf-8?B?SGtkSm1MV1ZpcmFNc3IrZ2RrMmxTNW83NXlyczJPeU1XZ2taN3dNUDJBdW8w?=
 =?utf-8?B?bCtxR1oybTBGY3hSenJLNG5OQUhjdWk1UWJJb3R3RVBLR2J3TTdJdUsyMTdQ?=
 =?utf-8?B?SXJQaU56Smw3MFpVVnRERG03RTR4QTU0OEh5VlI2Nkg3VHI4WXI1ZnB6U1Ar?=
 =?utf-8?B?R0pxV3NGdGtiMGc3ZmNPL1hxcXNHK2puVjNBa2kzODljZUovdEY3dEZOYzNN?=
 =?utf-8?B?WE5GTXVBUVJsSVVPNW5zalJUUm5kaEk0QmVjYjRpcWRrUGZjeTZmQldjNENR?=
 =?utf-8?B?dEVNdWJPZnNuUDZ4Z3lBK3F5NVl6NmtCQnh2Zm4rUmpaSzhlNHE5RGJmVS9F?=
 =?utf-8?B?bm90MkhjcVpwayswTkQzYVI4M3pQS1ZxOTdibloveXhIaVFoemVnNktYK3dh?=
 =?utf-8?B?OTYzRFVJY3J5N28rOTdjUXIvbEo2enhBcm1xNWt3dmRBR01JZ2xQTzdMbnpw?=
 =?utf-8?B?aFY3Q2swMjZncEp6VGZCQmhzWDBaNXdkQ1lFTWxtZm9WOXF3aUxIUThXa09K?=
 =?utf-8?B?SjYzSnVPUnhmZGFhNVFTbDJBT251aVFWZGxzekFuNzhreDd1TVBRVFlxYUdI?=
 =?utf-8?B?UnROSU1oNVNxcVk1MjlNdlpyK0UzTGtneHRsak85NFJEdmtpOHVWaUMya1E5?=
 =?utf-8?B?UzF0R3ZrRUsxZW1wby93UTF6TkxvMVp5V0FENFlzZCtHYmFYUnBkZzNCdXpn?=
 =?utf-8?B?TUUxQ3VDTnExZDJqNCtnek9wUVFxYmRUM2NxUElWYjhJTnRUbXR2aDRzYlJ3?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bde3a9ae-8e10-4f81-6adf-08de17ba5b66
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 13:43:50.0158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /N/FsKAAooSFGFFImhAPE4mPCeGsR6Y4koWWKDQ/V1i4d05x+5JKlafsGtObhepMBFBZApEgNDioHHahZlCnzOIX0bA/aQZVRWp9Kbzy770=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6769
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

On Tue, Oct 28, 2025 at 06:58:30PM +0100, Michal Wajdeczko wrote:
>It is expected that VFs activity will be monitored and in some
>cases admin might want to silence specific VF without killing
>the VM where it was attached.
>
>Add write-only attribute to stop GuC scheduling at VFs level.
>
>  /sys/bus/pci/drivers/xe/BDF/
>  ├── sriov_admin/
>      ├── vf1/
>      │   └── stop		[WO] bool
>      ├── vf2/
>      │   └── stop		[WO] bool
>
>Writing "1" or "y" (or whatever is recognized by the strtobool()
>function) to this file will trigger the change of the VF state
>to STOP (GuC will stop servicing the VF). To go back to a READY
>state (to allow GuC to service this VF again) the VF FLR must be
>triggered (which can be done by writing 1 to device/reset file).
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
>v2: drop reset file (Rodrigo, Lucas)
>---
> drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 49 ++++++++++++++++++++++++++
> 1 file changed, 49 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>index 360b0ffd9cb4..3a8c488d183c 100644
>--- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>@@ -13,6 +13,7 @@
> #include "xe_pm.h"
> #include "xe_sriov.h"
> #include "xe_sriov_pf.h"
>+#include "xe_sriov_pf_control.h"
> #include "xe_sriov_pf_helpers.h"
> #include "xe_sriov_pf_provision.h"
> #include "xe_sriov_pf_sysfs.h"
>@@ -52,6 +53,7 @@ static int emit_choice(char *buf, int choice, const char * const *array, size_t
>  *     ├── vf1/
>  *     │   ├── ...
>  *     │   ├── device -> ../../../BDF.1
>+ *     │   ├── stop
>  *     │   └── profile
>  *     │       ├── exec_quantum_ms
>  *     │       ├── preempt_timeout_us
>@@ -291,8 +293,55 @@ static const struct attribute_group profile_vf_attr_group = {
> 	.is_visible = profile_vf_attr_is_visible,
> };
>
>+#define DEFINE_SIMPLE_CONTROL_SRIOV_VF_ATTR(NAME)					\
>+											\
>+static ssize_t xe_sriov_vf_attr_##NAME##_store(struct xe_device *xe, unsigned int vfid,	\
>+					       const char *buf, size_t count)		\
>+{											\
>+	bool yes;									\
>+	int err;									\
>+											\
>+	if (!vfid)									\
>+		return -EPERM;								\
>+											\
>+	err = kstrtobool(buf, &yes);							\
>+	if (err)									\
>+		return err;								\
>+	if (!yes)									\
>+		return count;								\
>+											\
>+	err = xe_sriov_pf_control_##NAME##_vf(xe, vfid);				\
>+	return err ?: count;								\
>+}											\
>+											\
>+static XE_SRIOV_VF_ATTR_WO(NAME)
>+
>+DEFINE_SIMPLE_CONTROL_SRIOV_VF_ATTR(stop);
>+
>+static struct attribute *control_vf_attrs[] = {
>+	&xe_sriov_vf_attr_stop.attr,
>+	NULL
>+};
>+
>+static umode_t control_vf_attr_is_visible(struct kobject *kobj,
>+					  struct attribute *attr, int index)
>+{
>+	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
>+
>+	if (vkobj->vfid == PFID)
>+		return 0;

I think this will be the case for the entire group, isn't it?
Should we go ahead and just return SYSFS_GROUP_INVISIBLE so even the dir
is invisible instead of having an empty dir?

Lucas De Marchi

>+
>+	return attr->mode;
>+}
>+
>+static const struct attribute_group control_vf_attr_group = {
>+	.attrs = control_vf_attrs,
>+	.is_visible = control_vf_attr_is_visible,
>+};
>+
> static const struct attribute_group *xe_sriov_vf_attr_groups[] = {
> 	&profile_vf_attr_group,
>+	&control_vf_attr_group,
> 	NULL
> };
>
>-- 
>2.47.1
>
