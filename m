Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B8CCA1007
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 18:16:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99CA10E812;
	Tue,  2 Sep 2025 18:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D9cUQcU5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D565A10E812
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 18:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756836970; x=1788372970;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CtrxVo3mYdU1Z0+Ii55wM7BUZ4TqSmFYAsBU7uq28BQ=;
 b=D9cUQcU5Y5V9NL+Y05uxFZvZzpmqmTCW4q2zZCWQDbXWUDIlfTDeUXD4
 C4axgVDCnaKElgdfzPOsj+l+Ljx7hz4LypBk08/zXe6SO6GLIIHU/N83K
 q1d7D+MSyOBX+kz/lFqAzlYp95AxeoFhoveWEqkyk1kTXtWJUt/U5IftA
 foJ+xCZ1RMPXkcUuB71VhoW1K2LbFxT286NgCD6AmL3OtQ5guSHtRUF40
 FFRsZHS4D6/vNRCizWuIjjCRbYpc2tYWrDee1qk4aiv+cB0q2gInqfEdA
 kk5GeSwLG1vhHzjFIs1YNtj1Efwz/eqMPvAsDvsCHRa7cj4ce26eHeKEi Q==;
X-CSE-ConnectionGUID: nP6X/YVKRhCmjmPvZVWUwg==
X-CSE-MsgGUID: fZZ8QlK0Quq/ZeKLeI1Mfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="69388464"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="69388464"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 11:16:10 -0700
X-CSE-ConnectionGUID: LxqbZV4yQlyorbF4XjhubA==
X-CSE-MsgGUID: Gjuq3iybSvK2kVCliYI4ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="171506246"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 11:16:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 11:16:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 11:16:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.76) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 11:16:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=enAmWGwVXKFGvriXGIq/HgPWD1eEsu6xvHRCys+d/MFsY/pN3UlGkEvTxKro8KhKt22RvH1OodC53JKtzyD29uU89iU2w4YIKeJ2ByrwU/nU8/SQJOpiNHm9+up38exrXCT/g7rh0FC9CMBaIxuX/1pQCaCRgy+FJ2axCFGA+l+2hIb4cQpCg5RcR3KsqF0zsVaimlMa7ZLfEpkAhq2H2rYzQ6ljxB6kHuBdRt8LH+pqHYqIz1UVPk5RfFnrAMjA2IGmiOpCIiMGen0LEYGc4j8yRvJ4RKeKtE5/R4OvaeESSEux0QeQFKH1C+0hjPFnSRGf0P5cp0vCxskuqSRh6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoBct3NDagwBfSrXH19Qa6INRk7MajZjfVqaGzJSQ+0=;
 b=ZbE3xtvxtnYd/sfNv7wkgu+mh/s/9xiJMGkRMcJWwbs+AzHfj5v0V0lvEZbz5gTArSE7g0vflq/1RzmmAVh60rUVGVQqMqvPdIOA15pbi+lyN00CiauSqU3Lp/Fdbv/vyqbojBeA5HCDvSLF2BFyfZ+eywMnzmDLMVEWP1+bsuQ9Cb7+pDtt3OK1duvGCZB1yLJPcum0Wksy6kR1BJkFpGClOK/ngIFdyk+CzFgBfuH4EiMXUb6CgRZ2KeJDu24/omYgH1ASBaCg/+CWclopwEltzp8zoqCokmwmPq5TdamPB/jjaascB3AcwbO5KcCw3Q+0tnIC1kkw2Qv2OrywLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA2PR11MB4825.namprd11.prod.outlook.com (2603:10b6:806:111::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 18:16:06 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 18:16:06 +0000
Message-ID: <619ae479-8e0b-40ac-a1f4-a6086f19e896@intel.com>
Date: Tue, 2 Sep 2025 20:16:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/configfs: Don't expose survivability_mode if
 not applicable
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Tauro, Riana" <riana.tauro@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
References: <20250902131744.5076-1-michal.wajdeczko@intel.com>
 <20250902131744.5076-4-michal.wajdeczko@intel.com>
 <cb4d9b4ea275b9d8dfad37a7e078cea8477e9bda.camel@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <cb4d9b4ea275b9d8dfad37a7e078cea8477e9bda.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0037.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::17) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA2PR11MB4825:EE_
X-MS-Office365-Filtering-Correlation-Id: c0a5febe-d27f-4319-afc3-08ddea4cc86d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aURsOVlqa0FkUTU0ZnlmVGROQTRFektTMHFnd1lGSTNoUFRPZldQN09tMDZN?=
 =?utf-8?B?Uk1nV1BFOVlnRnRibEN0aGZkQVpNb0U1bDNUaXFldXkrbjZ3NUVOSnI0YVRO?=
 =?utf-8?B?cUEraTVYekx0ZFVDMG91SEF3djhzRzkwY2pPeVppQi9mUVEyZUhHSDZMRVps?=
 =?utf-8?B?M1NVeEtzbFdaamh0MjgzdHNXWVdEL2Nua1RVQ3ZEaWhndmkzN0NCNitjN1g1?=
 =?utf-8?B?OGVFREpYSk5KOFc4azhxOWFYeTR5cXlEeEd4VG5ONklWcTFCYTZTVmR1ZjFT?=
 =?utf-8?B?NjB2TUlSMWhRME5LMVRBcElOR1V3VVJtaWxBNFRMdFpZYVA2VmJGeFVXMndH?=
 =?utf-8?B?RVRZbmV1T3lJN2o5UFBEUVBUMEtxbGk3YldBN1VseFVBL2xnSWlmMmJ6ODJE?=
 =?utf-8?B?TWRDdnd3Y3FsR2VrSmVaZm80R2RHSDkwbU8rTFNLZlgvZksyTkV3dWU4S2Nv?=
 =?utf-8?B?TTk4Z2lzakVBSWxCWHZWcGFGREdkcHdJRjFueEpZTjhPZzZSREN0cU1xNDZH?=
 =?utf-8?B?VFhaSC9VbG9zRDVyZWJ3ak5qb1lFWjNTbFdpdDR3RTMwL3hpWWtEamNhL0cx?=
 =?utf-8?B?MjgvSDRJSWMvRmplaEJobmcxbDZqL0FyUEhKVzdtV1BhVlhBVHZyNzFtTW9C?=
 =?utf-8?B?d3hEekw5SjY0L25WYVU4T2xxUzZaRGVYb0x1ellNZk1EWlpEQzBSZTdqMUlF?=
 =?utf-8?B?MDlvak9IRFlkUUwrNnFrU0lNNjhrcTZFVHk0eXlyaUsyTkE4ajRVOFJqRFNV?=
 =?utf-8?B?WWRHU3dPN1ptTXVja29XNVJYa2hFcVpUaWRRODVmbSsyNFJmQ3k5dWExcnNn?=
 =?utf-8?B?VStqc0dmZkptc3NkMURSczRVMGVTM1oyREhOZXk4UVovT1I1d1dObTh3QTRK?=
 =?utf-8?B?NGZhcnlqcEpybXl5OFQwVjc5WDRYM05pN3lVV254Q2FXTFZ5VkNROE1yTUc1?=
 =?utf-8?B?THdTSXRMNVAzWDdlekJxeWc2NE9KekNuTDRsU24yL0Q3OTRCb2JPWGQvN2Zs?=
 =?utf-8?B?VzBxVlBlZVREc1NocTRIVVhSRzQzbXo2dS8rb29MeDlmdE43U1Q4RnVMb1NW?=
 =?utf-8?B?SlZOb0NxK21ncUpyOXRNYnpLZEZlejU4Z2wyQythcVI2bEN5bThPSGpHU0pm?=
 =?utf-8?B?cHVCL25qKzJPK0V4MXNzK3BxNE1BZmFEdytsTm5yZzkra2FJbjhpbjBLZWpl?=
 =?utf-8?B?QlFSQ3pTa1czYWVLeG9xR1p4QjdWd1J0czFIdUNVWjY2UUF2eFZzMngwSlJ2?=
 =?utf-8?B?Q3FpZ2w1U1piM0x6U2syZFFkUUovaFI2RUExdlRKYzdJdGphQ2RRYldFK0d4?=
 =?utf-8?B?TUlCNG50eUw1SXpvNlUxRkY4VjV3c00ySEczNHpiQnlPRlJPWHR5ektWaFd4?=
 =?utf-8?B?QnNzT05nNS9LNDFrVm9XTkE0S093dWtlMkJNYU9vL1gvV3FaMXpXczBIcGFk?=
 =?utf-8?B?M3NGZXcvRWRXanJmWmVhVXJHUGNJSFdtQksrOCs1Mks5aFJTUFhmUFNDTVJp?=
 =?utf-8?B?dDFQaTV5MDFxTW5oK2szUFo1c3h3QWRKR3h1VVo1clk5UUtHdFR4d1pNOEVw?=
 =?utf-8?B?SjlUSWd1MEZGRmQ3dVBhbEQybFVGTjhsM01FVjZQTkJFaGFSUUNJLzd3dUtv?=
 =?utf-8?B?cEk4OEwvY1VwUEFnRTBxMk1PQzM0Q2VNQkRtL093Q3pCZUsyTk1va3BtaVI0?=
 =?utf-8?B?RlJNRnJjYUEvY1dBVjZLN3lWeEhCVlRuMVYwYkhYR3hmSlhidzZvLzZuSUI1?=
 =?utf-8?B?UFhmYlA1dHlITW1QTkQ2VC9zQ3dIbGJMUWJIbFFQOXFlL0hjSlNoSFd5S0tW?=
 =?utf-8?B?TFlEb1NOM1IyQUtLL3krdndsZi9XV1hLMldDeTNVbXNYRTRHek16UmQySzRu?=
 =?utf-8?B?bjhjKzVkNVltQkhtYnNUQ2p0OHpJaUI0RklCSUpLYjE0ZHhlaVJNOEdBRk0x?=
 =?utf-8?Q?IfX0+A76XH8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzFZMGhjV3ZIWWN1WWVSL245NWd1dTZtK096TDMvUWJBRXBXOHh1eTY2czZR?=
 =?utf-8?B?MmdBOHo0RWdrbms0VVFIMGZteC93VWlyTDJzeFFmOHJHTjUyeVBzQ05IbnJ1?=
 =?utf-8?B?YWtsdDdlMVU1NWxicmFYaVk0dU5pRi9sZmV2ZGhKVTFSK3BLdks0cVhKT01y?=
 =?utf-8?B?cTYrdXBwbytPamRzWWF3bU5Ba2dHMTljbENPdlJsekdvbzdWRGl1MlhxWGFa?=
 =?utf-8?B?dW5RNWl2ODg5b0FMUmxuV1QwMHhXTi9ydnNNckQ4LzhkRHhHaGlOS01LRmlZ?=
 =?utf-8?B?VFl1YmhUMGthMFF0WHZvemNORENDcEdLS0xVMXdUNTZZYm1sSVZ3MVdaUURy?=
 =?utf-8?B?K29aK1R5elY3ODZvZ2JmNGltS2Y3aCtPUW1YbXp3YWJuVFYyWTg0WTRnMlFC?=
 =?utf-8?B?L1o4aCtTbE9weGNlclZXdjJtT1IxR2N0RGVVOHVpajR1S1d3Q0ZEcis0SG50?=
 =?utf-8?B?alRuQ045L2tObDRJbG5SQlM2VVk3RDY5VVQzR0V4NFhlQWQ4c2VUR2lHY0I3?=
 =?utf-8?B?dFhJUDZhL204eVpiMS82RC9RY25tV1NLMTJuWkdLK2p3R2pmVWpnK053UCtZ?=
 =?utf-8?B?S1J1SlFDbkdWeDUyeUExR1ZKdWRuM2Qwa1VFVUEwdVltMHd1N3o4cEFpNnhz?=
 =?utf-8?B?STlrZlA2R2orTWk1YlFmVld1Z0pKTjFUbUkxQ3pmSDMvd1BZaEhOL2tFRGtB?=
 =?utf-8?B?ZDN4bTg3dDgvQzVBcEZOTjg4NDhrV2F6V3lKODV3bWNieWh6NmlKTWNmUkpw?=
 =?utf-8?B?NDZkMENqYmF0M0JvOEo1b1Fyem1iT1ZRNzM5eHBUY1c3RVdBODZHMmwvZ21J?=
 =?utf-8?B?UWU5ckxUUy9kTmVWMndyQ2U1aG54dWVxeW93ZVZYWk91eitUTGJrOEczMUFU?=
 =?utf-8?B?S29JZU1LcExPQzc0ZWtDZU90anRrVDVFaGFzNk85a2NXaTJUc2V0QlFLK055?=
 =?utf-8?B?REZhSWxIQzd3N01JZ2xHQUlHY24rVlQzRWR6SnVqaEN1WTNJS1BZNDRYaE1H?=
 =?utf-8?B?K0pPNW9KTlRReU5EM2JVdmhxdDd6QU5odEtQOVBId1pjMmg2aXdSR0ZzRlZq?=
 =?utf-8?B?b3dzdk9vd0dJMWlweDJITUxUcmZXeVlTME1rdTduTU1FZ0FkMk0xUXhFWEJj?=
 =?utf-8?B?TWJwRnJnWVZXQlNSNGxqd28xNlM5cTZBd25WSE1iSXZPaWFKY280cVg4L3dt?=
 =?utf-8?B?MlQ0WE9IczZPM3BKc09TQ1pwMmN0Qk51eTlSa0RLblBDTlVWSHZCVmM5cE50?=
 =?utf-8?B?TmlTdW1jVGE4K3JvSzZ5TEthVTNTS2FaVG5WSHNqaE90ZmRwU21jSzA1d3Z1?=
 =?utf-8?B?bk9QYkM3ZHBRalA2SnVObkk0c05ua2hLUkxUTi9JU1dhQ3NiUHFnbG8rbFl4?=
 =?utf-8?B?RnZZWVZCSm0xUFFhMUN4dnBsM3hCNCt1VnNNYlhkUGRsdWRiamtPTW5hY2hX?=
 =?utf-8?B?NGtLTkpxVmlQajkyNTNKa25jMDFzQTJieXg1cVVNUjRsalg3OVh3S3EzSUZq?=
 =?utf-8?B?ZnVOMm1EWXBORXVQdFV1TWcvZys1UXN4VHZlcDNxaVppV1UveUJZOXB6elNT?=
 =?utf-8?B?aDJpbUdTUmlQSGJ4a2RpVFRNRnVaUGhGUUpZQW9wRXhwY2hHdUgwaGQ2WTI3?=
 =?utf-8?B?dTFsNWVtN2RhN0VlMzdSSTJ5SXFacy8rbGN5TTNRdnNLZFBpU2tTN0puOU9N?=
 =?utf-8?B?c0hpLzFzUkxLNVQ1Rlhtd08vR1BUQkQzb0FKcEJyV1dqZkN2SGMySmozaW1M?=
 =?utf-8?B?VjhxbTRIalA2VUxlMm1tekI5Y2pUblBuM0VMdEFxTTB1VnlqTm1rSWlDVFJa?=
 =?utf-8?B?a1lEL0ViZkhMcC8rWmVYZk12elFFeDRrcW9tY3FmZDVBdk8yT3VCWTV6Q2Va?=
 =?utf-8?B?NWFyMFlqVXdWdHd2dm5LcTFSdFdlUmY5Y2Nsam15ekxTdGdjbmtkaGtiaG1i?=
 =?utf-8?B?ODJaaDU4R1dPaFFLeWlGWmNENWU5TURHUnEvQnE2MnVaVlE1TjJiSHg4UGNx?=
 =?utf-8?B?dmg4bzFBMlIzS3JVSHIxeVNWWDFxMjhHTjRNL0h4VEpDY05kY3pUcFNsNU9S?=
 =?utf-8?B?dlE5c3dEdGU2a2dDblpNN29QbW9RR2plZGQ4R3dkZkhwRitEOHdRek5UUmd6?=
 =?utf-8?B?L1Zob3YwOGpLVWViaTNFQnJ2cGlSYVkxQlk0dXZWWHYzWWJtMndpcmlWTm9X?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a5febe-d27f-4319-afc3-08ddea4cc86d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 18:16:05.9806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jDitBUXgZXHSwcU0uQ8IIcJSeErlUFpv022F/U+ZS7j+SiKDrJ4BudmT5Hq+f8jpAT/Y97KK6cNm/LroYPLp+IoUgUz3mj/1xR0T16OwRjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4825
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



On 9/2/2025 7:25 PM, Summers, Stuart wrote:
> On Tue, 2025-09-02 at 15:17 +0200, Michal Wajdeczko wrote:
>> The survivability_mode attribute is applicable only for DGFX and
>> platforms newer than BATTLEMAGE. Use .is_visible() hook to hide
>> this attribute when above conditions are not met. Remove code that
>> was trying to fix such configuration during the runtime.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_configfs.c           | 24 ++++++--------------
>> --
>>  drivers/gpu/drm/xe/xe_configfs.h           |  2 --
>>  drivers/gpu/drm/xe/xe_survivability_mode.c | 11 +---------
>>  3 files changed, 7 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c
>> b/drivers/gpu/drm/xe/xe_configfs.c
>> index 43f000260752..0337811864cd 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -369,7 +369,12 @@ static bool xe_config_device_is_visible(struct
>> config_item *item,
>>  {
>>         struct xe_config_group_device *dev =
>> to_xe_config_group_device(item);
>>  
>> -       return dev->desc; /* shall be always true */
>> +       if (attr == &attr_survivability_mode) {
>> +               if (!dev->desc->is_dgfx || dev->desc->platform <
>> XE_BATTLEMAGE)
>> +                       return false;
>> +       }
>> +
>> +       return true;
> 
> Why change the return here? Can we either leave this as dev->desc or
> otherwise use return true for the initial implementation (previous
> patch)?

the reason is simple: in patch 2/3 I just wanted to show how to obtain
the device xe device desc here to make some decisions based on that.

with plain "return true" in 2/3 I would have to mark desc var as "maybe_unused"

and OTOH leaving "return desc" here in 3/3 is redundant since we already might have de-referenced the pointer

so this one extra line in diff was IMO minimal cost to have two separate patches
(as I didn't want to combine survivability_mode change with introduction of is_visible)

> 
> Everything else in the series looks good to me. This does seem like a
> better way to approach this.

thanks,

> 
> Thanks,
> Stuart
> 
>>  }
>>  
>>  static struct configfs_group_operations xe_config_device_group_ops =
>> {
>> @@ -558,23 +563,6 @@ bool xe_configfs_get_survivability_mode(struct
>> pci_dev *pdev)
>>         return mode;
>>  }
>>  
>> -/**
>> - * xe_configfs_clear_survivability_mode - clear configfs
>> survivability mode
>> - * @pdev: pci device
>> - */
>> -void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>> -{
>> -       struct xe_config_group_device *dev =
>> find_xe_config_group_device(pdev);
>> -
>> -       if (!dev)
>> -               return;
>> -
>> -       guard(mutex)(&dev->lock);
>> -       dev->config.survivability_mode = 0;
>> -
>> -       config_group_put(&dev->group);
>> -}
>> -
>>  /**
>>   * xe_configfs_get_engines_allowed - get engine allowed mask from
>> configfs
>>   * @pdev: pci device
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.h
>> b/drivers/gpu/drm/xe/xe_configfs.h
>> index 58c8c3164000..1402e863b71c 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.h
>> +++ b/drivers/gpu/drm/xe/xe_configfs.h
>> @@ -15,7 +15,6 @@ int xe_configfs_init(void);
>>  void xe_configfs_exit(void);
>>  void xe_configfs_check_device(struct pci_dev *pdev);
>>  bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>> -void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
>>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>>  bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
>>  #else
>> @@ -23,7 +22,6 @@ static inline int xe_configfs_init(void) { return
>> 0; }
>>  static inline void xe_configfs_exit(void) { }
>>  static inline void xe_configfs_check_device(struct pci_dev *pdev) {
>> }
>>  static inline bool xe_configfs_get_survivability_mode(struct pci_dev
>> *pdev) { return false; }
>> -static inline void xe_configfs_clear_survivability_mode(struct
>> pci_dev *pdev) { }
>>  static inline u64 xe_configfs_get_engines_allowed(struct pci_dev
>> *pdev) { return U64_MAX; }
>>  static inline bool xe_configfs_get_psmi_enabled(struct pci_dev
>> *pdev) { return false; }
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index 79426ea46861..19a1732e33d4 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -287,19 +287,10 @@ bool xe_survivability_mode_is_requested(struct
>> xe_device *xe)
>>         u32 data;
>>         bool survivability_mode;
>>  
>> -       if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>> +       if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform <
>> XE_BATTLEMAGE)
>>                 return false;
>>  
>>         survivability_mode =
>> xe_configfs_get_survivability_mode(pdev);
>> -
>> -       if (xe->info.platform < XE_BATTLEMAGE) {
>> -               if (survivability_mode) {
>> -                       dev_err(&pdev->dev, "Survivability Mode is
>> not supported on this card\n");
>> -                       xe_configfs_clear_survivability_mode(pdev);
>> -               }
>> -               return false;
>> -       }
>> -
>>         /* Enable survivability mode if set via configfs */
>>         if (survivability_mode)
>>                 return true;
> 

