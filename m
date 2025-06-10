Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C855C5B552
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 09:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B59E610E4D2;
	Tue, 10 Jun 2025 09:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q6El2Chq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA01C10E4CE
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 09:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749548334; x=1781084334;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1kj/+VvrXYGZjoqHWUOPbbARZjnS9EhQdEW2AUxNfZA=;
 b=Q6El2Chqbn2gzemVvKlUcL+IpnplJWonQSZ7krgtb/tZTjoRzk/4ocME
 3QMI+ZJxrWa4eNbS6Z6K1Fe53JcBytS/SUtC8BADy6F7/KE3C7y2fUcnF
 vGj9/dzvwYPoRUlI+4IULZZzITcpSeldYMyo6E0fK+x/c5gZwAU87BwRf
 HnFbNiMkgHhw/+MxWBVm8eMvwgs6dcwrbiFInPJZSOdTfpLUFdRMLfS1e
 UlT4EUTNySWnjDfVTDj77eEIcknHNHDDp+94itY5sSr1A0AlZWjWfLFru
 VLvPQYEItZFQMuUHiolAVj9qt2dwh30HYU0389rQzl5Q4i2D58xeqIZ+7 A==;
X-CSE-ConnectionGUID: LHA+tVrLRlKzVBGaDcWX3w==
X-CSE-MsgGUID: QJ+FP+jJQgq6LElwtkxPAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51794250"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="51794250"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 02:38:53 -0700
X-CSE-ConnectionGUID: Np9EuTPMSZKFxuj7Hb1eSQ==
X-CSE-MsgGUID: Z7Kiirp3Th+sN30kriUCsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="147722468"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 02:38:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 02:38:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 02:38:52 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.47)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 02:38:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mfpVVEqiSdVMA/MAEYHTHIgoxt6m/TnOX+rZU4u2AgTzG40+ksTTM/fQYdzVG7bCCga/7uSauTOSH2nCgt5pnNzsipU0pp/TW7NncMbMsY33z6eQWtfVCXiXyLONicu9XLH+Yh4kEgd6mpN949wf7xaHjrEUuDIbWWYwoaN0yN5SevHDS0KyTrXtjmnNYR7dpTXNwIRxrPFu2vBp+A12mJA+EfCMuS4Q1NlGf7CHgx4QnKIit2mdv1Tvq8wleyOM44pem9FmtdpoyLdRy/j7fc4XBPQhWWqujFZvWdhunHsgkbECPOw9YHLzYYHOf1j7bjDelzEeGGI5vraU8BR2Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wo4ETTP05Yg8PSnJC5wQ/jugGbeKBkP1L/Uz6idR33Y=;
 b=V8jbLZfA0nghmOmrxTvHotqydvRe/BGPECFWyOskUUOVHYa2s80pdNNvolJr1Ymh/LFTtLlUPb+zdr93zM1+EIubcc4b/kjfuVhmGCz6wc9Q5x7AJ41pJmGRn+l7Prp2W8H1DvydA8AKe1Mt8C+qUbWhPbTyGwNN6AhvWy330hj4RDuRvD9SH7+zESgWIu3QyXzwacVyOfqvJa0oxhDyUSBNu2eRewzbGXqMIr3IPnV5Hy2Vxji0fnlFq1ZhrfW0kLFEqKWWfBAsHFWjyJg6k5/D0aLJHpX4yK6g4cha4hY+oW72nu66oGTxP1jOX603rBHuyqh7WKR6vC2YqmjvTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by DM4PR11MB5972.namprd11.prod.outlook.com (2603:10b6:8:5f::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.30; Tue, 10 Jun 2025 09:38:45 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02%5]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 09:38:45 +0000
Message-ID: <47547e84-4d10-4037-9f9b-d1b02fa3fbac@intel.com>
Date: Tue, 10 Jun 2025 12:38:40 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Support for mmap-ing mmio regions
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Elbaz, Koby" <koby.elbaz@intel.com>, "Sinyuk, Konstantin"
 <konstantin.sinyuk@intel.com>, "Avizrat, Yaron" <yaron.avizrat@intel.com>,
 "Haimovski, Moti" <moti.haimovski@intel.com>, "Freiman, Didi"
 <didi.freiman@intel.com>
References: <20250609095938.16782-1-ilia.levi@intel.com>
 <SJ1PR11MB6204EF8ECD2EAE0F8F5AB93C816BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <SJ1PR11MB6204EF8ECD2EAE0F8F5AB93C816BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL2P290CA0028.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::10) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|DM4PR11MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: 027aacd8-d761-46d6-1935-08dda8029856
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFR3cWNyTDZSb1BpampHWFAydzk0OXNCZ0oweHJKc3pvYlUzZG9XTWZQS2dT?=
 =?utf-8?B?QW4wU0JET29WZzdjdmg1VVhlcVl3eFNrV091MmVMNlZLNExVMXBmVXFuVmJm?=
 =?utf-8?B?dWhsQlJIbDgvWnIxZ3YvMCs1YmMzdWpTUWp2NTRzZmRBSFp0dndnclFEcVNl?=
 =?utf-8?B?Sm5TRGRnSlo0OThVY2JaVTF3a3V2dVV4dk1Wa1BBOGZPVkxMcVk1c3U3Ymxu?=
 =?utf-8?B?U2ZILzY4eEJLQXRqOVdRcjM0Q3ZhYzl3SDRQMFp6Zys2WGdPdS82VTY5Nzh5?=
 =?utf-8?B?S3NCZnVLenN6bWV0OVRpZUpMampCYjYyeXNmcndkZGRPYmVveEh1Um5hWHBv?=
 =?utf-8?B?MlIxYUhmSkY0dHRvR1QyelB2Y2tTbEJKODFsOFBCUEdSK2lNZWxvY1FkZmtz?=
 =?utf-8?B?RnloV0hzVWdSekdZTVdLSGo1TWd1cEpzV25yN3UzRkZ6T0s0aFJVTGx6MjA0?=
 =?utf-8?B?UTRiREIwWWU3Y1EwM1JHNFlkajZkeThSQ0VTZ3lhWXZYa3RQcm9Pd1FtekU5?=
 =?utf-8?B?dWFRMGtEZW4rMm1KQUVTK2pvOE56VkJVbzNBOHRRNG8vSjVVWGdsN0FGYnpk?=
 =?utf-8?B?aDlBeC9yZEF5TkNOQkczU1FJby9WTno3VFl0VTQ5ZUJ5L1F5d0k4VUlMSEpC?=
 =?utf-8?B?MW1PaEpya0F0Tk1ramh0MlZpeUpLcUpmYXFGZFhNMnNneC9lbEdvbEEweWx2?=
 =?utf-8?B?KzJzNW5VTHhPdWJRWEIrMUY0NUk0WE0zTks3eldGb0FvVG85TFp5MkhpaUtT?=
 =?utf-8?B?cW9YdGVWaW1rYlp4RTc5VmJuOGxQNGVBQk02N1B0MTZaZjVIUDdEdU5zajNn?=
 =?utf-8?B?RGQrUk9mZGNGV1lsLzVNTGRFQit4Rnd5ZnVxRHdHVEVacjh3Y1I2aWNvWlFy?=
 =?utf-8?B?UXM4WjlDT2lpa1J2QWJnOGV5SGJlL0UyM29jV1J2YnZDVlBuckN6YTNVOWli?=
 =?utf-8?B?eTEydnhpeFNPY1g2R3RBRHZDcXRSekoydTdqVmk2eFNQdFhoZWhzNms5RitC?=
 =?utf-8?B?U2t4REdYN2dIck1lTVlKajM3ZU1ESUkvLzlMcmc4WVFLZVo1SS9rSmtRcERr?=
 =?utf-8?B?aytxa1J2c041TFZTK1hEbmV6cENJVUh5TEJTeGhrdXZIVEszdkgwK3hqd0lh?=
 =?utf-8?B?d1llZ09mdnN0Vkt2MWNYdThQYlc3dnV6eXcwZndxSExxT2NRVTlFcXBuakRY?=
 =?utf-8?B?S25TbDU4R2NMUWlGMWlkUnk2VzJpaE1qR1dGZk1lckswY3ozRitzNWtvWjV4?=
 =?utf-8?B?OW85ajMvVnMva3orTzhDdWZlOXBacHNQTW9YNm9VV2YxbDNxME9pdkFDbkxy?=
 =?utf-8?B?M2tqSGpiZ0E1WVZHeU1Ic2RJZ3VLR3RNOGNEVng1QWdjTHU5TXNVKzJaOTJC?=
 =?utf-8?B?WU5mR1hCUlZSR3ZKSVNDNUFyUDQxMkFXWEx2TE5KemE4TGdRRUFPR3JFaDdH?=
 =?utf-8?B?UVFmdUg3OW9DQi9RZkQwaGFOY0UxZUI1SlA2OUlJSGRCSjJsZFdnRUhUL3Vw?=
 =?utf-8?B?bjJzdmNmUTJMeXBnWkQvcThhYStrM1FIS0NrVUZITnBLSzF5a2Rma0tEMlY3?=
 =?utf-8?B?YnBmUHBXNWF1QnZiUUV0ZnA2V1c2QUhZK3JrYTR6Q0VqNFpEOWUwdTJtSkFi?=
 =?utf-8?B?SjAvaG5DcnpEUEdNTWZRODc4NE1JZmJNMWtpMC9Hb0tkMkVlVW9qdEJKSUUz?=
 =?utf-8?B?S0pDSTVmSTJsaU80cnhCeG9zMmdlaHFMVG1vVzRKa3FMNHFRaTZrMmQ5ZWNJ?=
 =?utf-8?B?Ny9ONjdGQm1oaVhESHBrOCtHcEhja2FhZzJkYWc3OVhZbXlEakR3SEIzSWRL?=
 =?utf-8?B?LzdHSTFuV29VOWxKemJWQ2ZNdFhhaVZ2NFh2SEcxMXNmeWRVNFVWUlJHOFlK?=
 =?utf-8?B?eFRCV21IaGNRb0p3R2sveVdkalNwM3kvQ29ZTVpZMGRoL0RvdmdBbHFDMjhU?=
 =?utf-8?Q?7iKAtN6B5NI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFZOTWVBNFlieGRCcmg5U1VXMEx2TC9XU1c0SDVSMDVJSWwxSTFtVXpTY2Fx?=
 =?utf-8?B?V08xNTVYZk5MYVdRWVNpMmlEdm13Nlo3eTNmdnRNNUNHVE9LZjlUdlFWVHlN?=
 =?utf-8?B?L0UyaDNWZFJEQnhmWDlKNnBYSGgvYUExM2ZDV2EvdHFySUlUME9PNHRSSjg4?=
 =?utf-8?B?ZjdZZjVkNDFiM3phVDFqa0lCWTB6cUo2bk1JWmJCRHlSOUNrRTUwb3Y2MEo0?=
 =?utf-8?B?U0xBNVArZzJiRTQ4Vk1MLzFhWHdnaTl1dVRQVXVkck84TlRUVm4wdjlLVHQ5?=
 =?utf-8?B?eXZvdUVNQSt6Y0hxQzBZREtZNEwrVVozT1NveVhSL24vMnJFVVdzSUtoK3ho?=
 =?utf-8?B?MTFGY2RrZjB5Sy9wY3YrSFR0S1FaeDVVVVEwWlJEK2dKNS9aRlVZeHFuNHpN?=
 =?utf-8?B?N1MyTnJIY3pXb3N2SDM5dmpKSG16NjJZTkpoNGRUSEhnMm1wdlJqZWo4Um5E?=
 =?utf-8?B?L0p0Z3JJeldPRnZNSXdRY3ZCa1lqcTBOTEtQVWdWbXZFY0pRNkUxS2lrM0N6?=
 =?utf-8?B?VEtQbm9XVm1mK2llT05jbnZYZk9DcGY1dk5Fc0l6emZoWjlUSTJ1VXh2TStZ?=
 =?utf-8?B?bXA2UnRaSFdiOGVoWkdCWWNFc0FSOS9uNWJFNWlKVEVYN1dCM05uSVB6Z1ZI?=
 =?utf-8?B?L3RjMDQzQTRUc1I0alBvQUJ3STlTVm1LekZFOUxkcTVuWkY2RUpYMTJNZXNo?=
 =?utf-8?B?ZCtSZ3BKcWEraEU4cEJ5aFNod0lFeEQwUUcvRzlTcWxwNnNCL3A2S1NJZTk2?=
 =?utf-8?B?cE5vWGVhTmJ2ckFXbktDdTFKVlg0NGNwRGNNd3V1dGQ2MXo0OGdxUXloODFn?=
 =?utf-8?B?ZHZMLysyWXdXaUVJb2lZMGJvakdzYUhsQ2lHR1oyTk1ZNmhvWVA4aXJSM0kz?=
 =?utf-8?B?VWNidDd4WHlDdE9sOEtTSWlodUdMVERvUDhjQ2hlYXVsVnRJbXhQN2U5dnBu?=
 =?utf-8?B?d1lNWEdwYzczeW5nM0tTQjdDWWw4WWFqQnFQR1ZqTDU0YVVQV2J4bmZMM0VY?=
 =?utf-8?B?MmlRVlJnYVVUZGdFU3pFQS9QOEwwRHdHQVE4WWtaMC95aUZFc2JhVGtmbWJ3?=
 =?utf-8?B?YVZYM2QrdGpmeE4wYldPT0dTeHpyclgwMXRiSmhGTHowQUtqK3NsTVF1enYr?=
 =?utf-8?B?b0FMSFcvZCtCTnYyQ0Zla1VJVXJHanJjVmRQeU40Mkl6ODZWU3pnZGkrZ1lQ?=
 =?utf-8?B?RzhqQUtIYzVML2ordWRLdnJtNmNpdVZ6cDgvdlJZcC9QVEJYc0JWaHlvcGU0?=
 =?utf-8?B?WFlQRjhPaVpBQWJ6UVFGcGRNNW1iZGFtajlQckxTR3ZRVElMU21hblltczZO?=
 =?utf-8?B?NEQxd0E2Qkp4TXBNdFZJM3RsK243ZUtEZk1uNHE1Z2x1L3NXT0VsZ1hNWmlh?=
 =?utf-8?B?a2UzdUU1M2EyMzFHbis2SHlZb2Y3aCtPVjhJVDdJeE9wQkR4aEo0QWJaNERy?=
 =?utf-8?B?SkhkRHUvc1BwQXNzMXdnMEF5dWhwc3lMM3VvNkpIaVVuaHdVK0tvS0JSbElr?=
 =?utf-8?B?bGlwUERaWnB4NVhwbSt1MVcvM1NkcmtVNkc4amxKbC9vZVNnSjJlZEM3K1pH?=
 =?utf-8?B?ZjJDZW1UZzRjNTBuUzBlZkM2dWxpVUkrSnNod2N0ZitOSCtsbHYvQmR6OE5B?=
 =?utf-8?B?NWV4MjBObUYwbXExdG5CM21mL1FpTGlPaVlzSCtmQnd3UFpvd2wrNWhuY08r?=
 =?utf-8?B?dC90UUg0aTFZWksyVEc4SlNDeTB3Skg3M1lGcnJaNzNHMmgwVFY2Y2xaUVNX?=
 =?utf-8?B?ZTNLTUY2STNzMVNCMHlySTk4RFFzY3kyVGhPOGl4VjBtTVA4YkQydnJLRVNB?=
 =?utf-8?B?NWdocFlTOVA0NDF5Ykl6cXliN2swUjJyVWtPM2ZFVkdIWlhsVkVNQ0VHbGhq?=
 =?utf-8?B?WWgrUG1CRUVvV0RvZkRrMmk1N1ZsTllQbHRCZ1ZaK1J3dW5oa01ZdUxaK1JQ?=
 =?utf-8?B?RHpZS0JWT1ZDSURUcHdRQmptdWJuT1A5OFVGOGZjQmJSUk9EM3FEN1RDUW13?=
 =?utf-8?B?TXRRSnpDTzYrc0JSMU5iMitSZ1RoQVBad3V6WWdXM2FVankzcUtteDRucmY5?=
 =?utf-8?B?eEFHVk9RNFJqTUVZcnY1aGU0RWVsdUsrVStGeGMvNm5OVkIwa1dWektRd0Ey?=
 =?utf-8?Q?1hDV9h13ewD0YPmC9JYxHklR6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 027aacd8-d761-46d6-1935-08dda8029856
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 09:38:45.8120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PGAWSEaaKIzzsEDDl76QuGl1hPzQdhLcZH3daWpiT+f79AYd0KkWAVROLD6K7jH7dcZf1NjS83ptJkJmdcR97Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5972
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

On 09/06/2025 17:20, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Ilia Levi
>> Sent: 09 June 2025 15:30
>> To: intel-xe@lists.freedesktop.org
>> Cc: Levi, Ilia <ilia.levi@intel.com>; Elbaz, Koby <koby.elbaz@intel.com>;
>> Sinyuk, Konstantin <konstantin.sinyuk@intel.com>; Avizrat, Yaron
>> <yaron.avizrat@intel.com>; Haimovski, Moti <moti.haimovski@intel.com>;
>> Freiman, Didi <didi.freiman@intel.com>
>> Subject: [PATCH v2] drm/xe: Support for mmap-ing mmio regions
>>
>> Allow the driver to expose hardware register spaces to userspace through
>> GEM objects with fake mmap offsets. This can be useful for userspace-
>> firmware communication, debugging, etc.
>>
>> v2: Minor doc fix (CI)
>>
>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device_types.h |  14 +++
>>  drivers/gpu/drm/xe/xe_mmio.c         | 142 +++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_mmio.h         |   4 +
>>  3 files changed, 160 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index ac27389ccb8b..78542de0d48d 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -10,6 +10,7 @@
>>
>>  #include <drm/drm_device.h>
>>  #include <drm/drm_file.h>
>> +#include <drm/drm_gem.h>
>>  #include <drm/drm_pagemap.h>
>>  #include <drm/ttm/ttm_device.h>
>>
>> @@ -161,6 +162,19 @@ struct xe_mmio {
>>  	u32 adj_offset;
>>  };
>>
>> +/**
>> + * struct xe_mmio_gem - GEM wrapper for xe_mmio
>> + *
>> + * A GEM object for exposing xe_mmio instance to userspace via mmap.
>> + */
>> +struct xe_mmio_gem {
>> +	/** @base: GEM object base */
>> +	struct drm_gem_object base;
>> +
>> +	/** @mmio: The MMIO region to expose */
>> +	struct xe_mmio mmio;
>> +};
>> +
>>  /**
>>   * struct xe_tile - hardware tile structure
>>   *
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index 7357458bc0d2..6bfa915a9602 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -408,3 +408,145 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio,
>> struct xe_reg reg, u32 mask, u32 va  {
>>  	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val,
>> atomic, false);  }
>> +
>> +/**
>> + * DOC: Exposing MMIO regions to userspace
>> + *
>> + * In certain cases, the driver may allow userspace to mmap a portion of the
>> hardware registers.
>> + *
>> + * This can be done as follows:
>> + * 1. Define an xe_mmio instance that represents this portion.
>> + * 2. Call xe_mmio_gem_create() to create a GEM object with an mmap-able
>> fake offset.
>> + * 3. Use drm_vma_node_offset_addr() on the created GEM object to
>> retrieve the fake offset.
>> + * 4. Provide the fake offset to userspace.
>> + * 5. Userspace can call mmap with the fake offset. The length provided to
>> mmap
>> + *    must match the size of the xe_mmio instance.
>> + * 6. When the region is no longer needed, call xe_mmio_gem_destroy() to
>> release the GEM object.
>> + *
>> + * Limitations: The exposed xe_mmio must be page-aligned with regards to
>> its BAR offset and size.
>> + *
>> + * WARNING: Exposing MMIO regions to userspace can have security and
>> stability implications.
>> + * Make sure not to expose any sensitive registers.
>> + */
>> +
>> +static void xe_mmio_gem_free(struct drm_gem_object *); static int
>> +xe_mmio_gem_mmap(struct drm_gem_object *, struct vm_area_struct *);
>> +
>> +static const struct vm_operations_struct vm_ops = {
>> +	.open = drm_gem_vm_open,
>> +	.close = drm_gem_vm_close,
> Should you remap in fault handler, to make sure mapping is there always?


Hmm, do you see any benefit for lazy mapping here?
When a user maps HW registers (presumably a page or so - not much more) I think it would be ok
to do the mapping immediately on mmap. But let me know if I'm missing something here.
- Ilia


>
>> +};
>> +
>> +static const struct drm_gem_object_funcs xe_mmio_gem_funcs = {
>> +	.free = xe_mmio_gem_free,
>> +	.mmap = xe_mmio_gem_mmap,
>> +	.vm_ops = &vm_ops,
>> +};
>> +
>> +static inline struct xe_mmio_gem *to_xe_mmio_gem(struct drm_gem_object
>> +*obj) {
>> +	return container_of(obj, struct xe_mmio_gem, base); }
>> +
>> +static inline phys_addr_t xe_mmio_phys_addr(struct xe_mmio *mmio) {
>> +	struct xe_device *xe = tile_to_xe(mmio->tile);
>> +
>> +	/*
>> +	 * All MMIO instances are currently on PCI BAR 0, so we can do the
>> trick below.
>> +	 * In the future we may want to store the physical address in struct
>> xe_mmio.
>> +	 */
>> +	return pci_resource_start(to_pci_dev(xe->drm.dev),
>> GTTMMADR_BAR) +
>> +		(uintptr_t)(mmio->regs - xe->mmio.regs); }
>> +
>> +/**
>> + * xe_mmio_gem_create - Expose an MMIO region to userspace
>> + * @mmio: xe_mmio instance
>> + * @file: DRM file descriptor
>> + *
>> + * This function creates a GEM object with an mmap-able fake offset
>> +that wraps
>> + * the provided xe_mmio instance.
>> + *
>> + * See: "Exposing MMIO regions to userspace"
>> + */
>> +struct xe_mmio_gem *
>> +xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file) {
>> +	struct xe_device *xe = tile_to_xe(mmio->tile);
>> +	size_t size = mmio->regs_size;
>> +	struct xe_mmio_gem *obj;
>> +	struct drm_gem_object *base;
>> +	int err;
>> +
>> +	if ((xe_mmio_phys_addr(mmio) % PAGE_SIZE != 0) || (size %
>> PAGE_SIZE != 0))
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
>> +	if (!obj)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	base = &obj->base;
>> +	base->funcs = &xe_mmio_gem_funcs;
>> +	obj->mmio = *mmio;
>> +
>> +	drm_gem_private_object_init(&xe->drm, base, size);
>> +
>> +	err = drm_gem_create_mmap_offset(base);
>> +	if (err)
>> +		goto free_gem;
>> +
>> +	err = drm_vma_node_allow(&base->vma_node, file);
>> +	if (err)
>> +		goto free_gem;
>> +
>> +	return obj;
>> +
>> +free_gem:
>> +	xe_mmio_gem_free(base);
>> +	return ERR_PTR(err);
>> +}
>> +
>> +static void xe_mmio_gem_free(struct drm_gem_object *base) {
>> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>> +
>> +	drm_gem_object_release(base);
>> +	kfree(obj);
>> +}
>> +
>> +/**
>> + * xe_mmio_gem_destroy - Destroy the GEM object wrapping xe_mmio
>> + * @gem: the GEM object to destroy
>> + *
>> + * This function releases resources associated with the GEM object
>> +created by
>> + * xe_mmio_gem_create().
>> + *
>> + * See: "Exposing MMIO regions to userspace"
>> + */
>> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem) {
>> +	xe_mmio_gem_free(&gem->base);
>> +}
>> +
>> +static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct
>> +vm_area_struct *vma) {
>> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>> +	struct xe_mmio *mmio = &obj->mmio;
>> +
>> +	if (vma->vm_end - vma->vm_start != base->size)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map
>> the
>> +	 * whole buffer from the start.
>> +	 */
>> +	vma->vm_pgoff = 0;
> I am not sure, but is it confirmed this offset wont be used by anything else?


Yes, I believe it is used to lookup the GEM object in drm_gem_mmap and that's it.

Also many (maybe all?) drivers do exactly this, for example see:
mtk_gem_object_mmap
exynos_drm_gem_mmap_buffer
rockchip_drm_gem_object_mmap
__tegra_gem_mmap

- Ilia


>> +	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
>> +
>> +	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND |
>> VM_DONTDUMP |
>> +		     VM_DONTCOPY | VM_NORESERVE);
> Do you want to allow cow_mapping?


Good question... I probably should enforce that the user passed MAP_SHARED, thanks!
- Ilia


>
> Tejas
>> +
>> +	return remap_pfn_range(vma, vma->vm_start,
>> xe_mmio_phys_addr(mmio) >> PAGE_SHIFT,
>> +			       base->size, vma->vm_page_prot); }
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>> index c151ba569003..2990bbcef24d 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.h
>> +++ b/drivers/gpu/drm/xe/xe_mmio.h
>> @@ -8,6 +8,7 @@
>>
>>  #include "xe_gt_types.h"
>>
>> +struct drm_file;
>>  struct xe_device;
>>  struct xe_reg;
>>
>> @@ -42,4 +43,7 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct
>> xe_device *xe)
>>  	return &xe->tiles[0].mmio;
>>  }
>>
>> +struct xe_mmio_gem *xe_mmio_gem_create(struct xe_mmio *mmio, struct
>> +drm_file *file); void xe_mmio_gem_destroy(struct xe_mmio_gem *gem);
>> +
>>  #endif
>> --
>> 2.43.0


