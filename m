Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB184C021AA
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 06:32:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8531510EA25;
	Fri, 21 Feb 2025 06:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RHn3Kzh4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C69210E146
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 06:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740119534; x=1771655534;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cvnHAj3LJTeTqzrLcbNUAmzDuVCpGjPRzZh+lCl+msk=;
 b=RHn3Kzh4kqCdp68FKdOHvf/fKqwYfVjlvbg6ias/kg9bxpDVTCv+9MP7
 3cbvd4cirK/+cRnkVN8LyBYhfgR9pnLDP8nMlnY1L8P6pI5GHaOY0Y3x7
 oKoT8OtASa6JQmuDjrNlM6T4ZTIPxD3KDRLAzuIbsUktGGYPOkmwvd524
 7yQksx1BSXJJ2dLJjWTpx0vJvYlzD0Q/8+sN3otx8WeFC7AmXFfb3sA/e
 TFvlH/1Kkd2C/Ae0ZmR2VbUhukQRe0GLLMHyd20d5kuTaZ7RTIX5w/hAq
 PRsr/4+UFqF88ehRu+VMZaaxrOV9DvpU21GeTFlAIoMnvzTr47HMUpiuP w==;
X-CSE-ConnectionGUID: 1k9iC8YyQbqtAa6Qb49BeA==
X-CSE-MsgGUID: hyuducmrQFanNE0pC/w4pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51144778"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="51144778"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 22:32:14 -0800
X-CSE-ConnectionGUID: McqWZHueRv+JJ84iC7lOOQ==
X-CSE-MsgGUID: PkQhnPiDRI2iv7p5qqkzrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="119905785"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2025 22:32:14 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Feb 2025 22:32:12 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 22:32:12 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 22:32:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/7BGT4/Sk1uybgelKwW0toNyQYcdQMn6r6+60r5YOLsjZVdf2kPIKAEtjufSI/EN+1572gcxIyhJAQihz6+1Bj5ryGc63MT+bYStUjmpWuo9YnGwqbAG33YWWIvTOGKVuVdxUy1K1z08kP0IJRYKPfe1NziJyihCDCkoiaKKERnkysxmU6AMuNjqVOifFbTRGuoAw2F97fhiD7qfvn3sgDOAouLtO8XigYBeMYMx824TFBNCYwRMmQWa09MD20JVV+SV7aOhe6NFB9+Dz8eGBC1yjmA2OYefmICvc4Bzc7PGRkKdG/Nz5iBqOcxg+AnT3ZifqBThQUAHV25gAR86A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrpCyJR9MxadeshXsASDBZVWmfZ79NlDvU/wQFx6/2Q=;
 b=Hd8QJ3PFSI2Fi71df+wBP5BCqMKC8f++soo/3xYwjMarQ6pWGX4hJpgABt154GohVaqm/mWbwWVI7Uc4sh1L7ld2wykvM2LF6+9BPDrwcyhN1VvKSEuF04eBeTKGEEi4yXS3FC7mFDAxgsSuIF2jqXn7jBX7uhihi3kOJscvg0G986JPxGGMz20KkQoEJGc/cPGAm3qi0IOuRNa64Y1phhhA9G2+qe+dd/8N29onDDviL1xOFL/Egy7ym+7Tov6A7Fz27xz1O3xShAtK5/uMzTja7kNpBIhFRftxgjXpkyrhr8kaAcBy5XqNT6m/aaX7p5dQZoafMm5x4OUpDR6wNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV8PR11MB8584.namprd11.prod.outlook.com (2603:10b6:408:1f0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Fri, 21 Feb
 2025 06:32:10 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 06:32:10 +0000
Message-ID: <bd6ea1a4-a53c-4333-9cda-95d844f64b82@intel.com>
Date: Fri, 21 Feb 2025 12:02:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] drm/xe/xe_pmu: Acquire forcewake on event init for
 engine events
To: Lucas De Marchi <lucas.demarchi@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <vinay.belgaumkar@intel.com>, <soham.purkait@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
References: <20250214100819.798544-1-riana.tauro@intel.com>
 <20250214100819.798544-6-riana.tauro@intel.com>
 <tkee4kttili63cqcpreoc6wqz3r6depkmixt34ctilypa5rb46@ddqsv44zsvi3>
 <Z7fTX2X1qrdcv0fb@orsosgc001>
 <bsmgo4sti6ue46ocarjt3qltjke64ln4gf3vol2novnbw57goo@iihu3gswpjnx>
 <3isbafrfmgy7bi2vqjq4ixecuhugqk7o7tzdlsib3wx5wtfku4@g34iofqphcxs>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <3isbafrfmgy7bi2vqjq4ixecuhugqk7o7tzdlsib3wx5wtfku4@g34iofqphcxs>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV8PR11MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: 98f022e1-34b7-43f8-7517-08dd5241781f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3o1YTFEUElGVktPNk0xdGowY2NNeFV0OGVrV2Q4VkZlcC96blFvN21XYlBi?=
 =?utf-8?B?ODNNQWJvN2FtdXplT25yanQrYzE5T0VOWkpEdWFrTkRtMGY3Q2R1cGdkbEJF?=
 =?utf-8?B?anM3byt3VElVU1AzRGVDY0FMc0szT0hNY2dGWFVJazgrTkRaaEcwSjdJOEZQ?=
 =?utf-8?B?a3BaQnFHNGlPTkVrRDdaVFFMMEtJdzNMZG9XZ2FjbWswMDIwMGZiejZrRm1u?=
 =?utf-8?B?bXRteFMzc1c4cnJlWGJTODJ5THl2QlJBbW9iOFg2NFNWRUdCWitzc2QxTGJP?=
 =?utf-8?B?RFpHZmhvbGx3dDFGRHRLdDlGaEFOMGJBd1JBZEhIaHhyb1NUc1pyUWs1MFhw?=
 =?utf-8?B?S0J0WFJSY2lrOXBVZkN0Szc2cEtucElRc1JoRTk1K0ZRR25zMEw1UkdHaHN6?=
 =?utf-8?B?NXhrNTZjZEo4dW5sdnZrV3ppWWxwNlZTcXluRWN5RUUyTlJLd09vcHdHOURw?=
 =?utf-8?B?eDJYUHpxS1BlK2llQmcrVklKak56OVdzVUh6VlB0SjNBS1QwK1VrUno5WWQ0?=
 =?utf-8?B?SmlYcUsxYXNqUHZ0d3h0OWZSb1JqSjloODZsdnNGVkVDMnVXNG5pZ1B1T1M3?=
 =?utf-8?B?NWhsL3VqdUVjM2Z1V1VPaWM4S0NBT21WWHFhQkFIVnU2UG5uaXhHMHRmMDNr?=
 =?utf-8?B?L1gyZnlwNjBELzlneHN0cHVkeDV5WEZZeU81R2g3cFU1bFpraDhCTWdkQXhN?=
 =?utf-8?B?OFVnR1RibWJXQndEcVBEQktDQnVod2tPSVF6cFN2cEtKWFJadnZVU3ZkZ0Zn?=
 =?utf-8?B?WHFYc0lBUjErcWZyNVZLU1ZiNXl1ZDNqSlNMQnV1bUJUcTgxb2NFdFYwdng1?=
 =?utf-8?B?UFhtNWJoVEJzS3BGZXM3QmUyQ1VQZHhuS1pEb3IwYkI5Y200YWVEK0lCbEts?=
 =?utf-8?B?ajBTSEM0MlFzZkk4V1BvenZYVXd5cTFJQ1BBS0YyMU9YSWlKelk5amQ3MnVT?=
 =?utf-8?B?RUhJLzFNYnkyOG1nUTJSamw3RitUb2tDMWpjSHFLTGdQcktUVW9lcVdGbHJO?=
 =?utf-8?B?Z203RTdUV0xlelo4S1AyWFRpYmFvWFY3K015ejZqTjRqNjVxclZKV1dPb0p0?=
 =?utf-8?B?RklBNTRMYkNleUJxdWlMZWgvYjRLVDBPOVY1YXhSbUFzcEF0N2lhYjBPRTVW?=
 =?utf-8?B?SFpyNDV4eUFRYWFoYlhiZEJvUXppTDA0N1pXZEpGQzdjRGtwWHBpYWpsbDBz?=
 =?utf-8?B?bXVsRitJUkdKL3VUWjRZMkRndGMxdGxhcFJMWmtWY2xQajRIVHpiOENSSEt5?=
 =?utf-8?B?ckhNV1N1NStYV04xUkQ5V2JQWC90VzVEd2RFMFVFOWRyVTJ4a0k2L2w0azFV?=
 =?utf-8?B?ZXVpY0VTVUo3VmhzVEo2UWptMmNsMDFVTGhoNTg1QjVxYkVuTE1JZ0NtV09R?=
 =?utf-8?B?VC9KaCtBMXp1V2dJMzUwZnUyQVNvVXZlVlRveTAvNWllQ3BoY0pjZnQrSmpZ?=
 =?utf-8?B?MnBuOUhhR3FRUytObmJ0SFd6Wk1ZYk5OeWtpc0xnMHRYRUd4LzU5bENoZVQx?=
 =?utf-8?B?Y2NzZGlLTWZ1QWRmRlJGRUw3L21TWkw4Z0xqbE9QeEFQbTgwZWxxcTJuRElG?=
 =?utf-8?B?TXhLN2FVMGZRZDRNR3RaUGNBQURVaWgzMVBlQkoxMkUvb0JwNjRDWFdrWEo2?=
 =?utf-8?B?NEluN0RzemlSazRBaGljZjREbHc1Vkp0SVhybG9MWE5BckJoemRENHl5aDlX?=
 =?utf-8?B?S1VFY05pOWlyeDVTZFZBamlKcHo5Q2htdjZvNitVTTJWM2hjTWMwL2ErZHJ0?=
 =?utf-8?B?NDNnWlB4aSt3UDcyQ1ZlR0RxcXNsZ0k2VHR0cysyWEtVZlR6bkFEaWhjMEs2?=
 =?utf-8?B?VW1xNmJmMTJqd2srMExQVXVXS29zMWlRVUdpWGY3Mk94NXFNaDRkUnF5Q1Fu?=
 =?utf-8?Q?dkpQ8aI+sdG4S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1RER3EwcU1sMTNJWmkvNkgrc0d1VzJ5RDJ3UUtMdDJhSlUrTmFDMXc1N1Z2?=
 =?utf-8?B?V2NkY3V0STlWbzdWWjhsY0lrZ1NnY29pVVhTUWZ5UHhuZlU1eCtuRGpSTG1l?=
 =?utf-8?B?VWl2SnV3Z1BTZXlVU1JPa2pqMHlqb0kzcjJkeG9paFRnaXFqQUthN0w5eGRK?=
 =?utf-8?B?TVBBVmVVczdtWUNoNTdzbmV3bmwxMUZndWNvaVZlWWE3S2Z3SThid05pMTE4?=
 =?utf-8?B?bnFMNkgzVGVPTExjei9JTmJxVGFjU3RNS1FuL3E3dDhXWGtpSEFNcXZEdktY?=
 =?utf-8?B?S2twNlIwUXQyOGZuSnk4NnovaGZicFVvMHd6SmVlWHlrWGoyUEdwQUs3YmFr?=
 =?utf-8?B?NTdOMTNBakdzRjBVN0xZTnRsU2pyZWR6L2dnSWpZWVJkeWdvNFQxREFDejM2?=
 =?utf-8?B?MjdYTmgrQllNcUE2bVBTZmN2QUp3L2hKZEZxNXFuQ080Wk1XRm4zclRJRXQz?=
 =?utf-8?B?M1YrZythZkJOTi9RY0xvWnJMRnV3RTJZNVRoMjdMSnA3OC9jcjJpV2Z1a3VF?=
 =?utf-8?B?U0lKNjZ0SW9FcHowbStHUC85TTU3V2VQUGJKd3BCelUwNllScFhpZzVFY3Vs?=
 =?utf-8?B?RUgremFBSkRxd2xrSEM1b0FkZW9SeCtZUnUwQitpOElQeFo1TUZ3NU9zdlY3?=
 =?utf-8?B?Umk4R0hxK0F1czM5d2poYlpWNDc4a2hSWHdLT0pyckZWcDBYcGx2YnBVVmdm?=
 =?utf-8?B?SG01VUhkeGQ3Mm5abmlLdUxCNXE0ZHBQUmx1SHVwejhYRjQxL3lobk5BVHpL?=
 =?utf-8?B?WUhlMHRlTmxIUHNMbGtYQ0ZTNWJ2bm54OHJyV1dSZHcvQWtzcGYyd1NJLzh3?=
 =?utf-8?B?bEsydXRlM3BWZ3VqRWhWWm9sVWJySTVQbXNiYTBHeno0cXVBaDd6SWtpYmc3?=
 =?utf-8?B?eVZoRmV5SXVCaFh3R1FIOXl3NFVneG9TdGxCWEU3aUJPUktKejRyUVcweWZv?=
 =?utf-8?B?bGVLSmtLYlh0a3hiNXRsMDRsdDdRSGY1U0hSV0dIbmRBNmJCYXA4am96b2xL?=
 =?utf-8?B?RXpEQ1dWSzVqdVN2cmdXS0lacm1tMk9GSHpvMFRNbDhzZHJGQkhSUXdFdjh3?=
 =?utf-8?B?bHVlTXZtQ0sxQmxnaFFCR0o5aSsxdGNDRTBrcHk0SnVMcllMbWZPcENCQWQ4?=
 =?utf-8?B?bVZOSnNTSVhLMUVnV0g4R3E0dGkxY2M3ZGtlYzRMdHQ3RS95L2NiY3E4Qk4r?=
 =?utf-8?B?QWMxZG5YVm52bjNGT0xPYW9oSmJtV2RZRUhZOTNNc1hZT0RnSkFIdGMxOWhl?=
 =?utf-8?B?SUIwTWR5TSt3SkZBODhFaXgxYmxaanNvbzBGcVY5SjE0Ym5GSEJ2SzV2c0Nj?=
 =?utf-8?B?eitUVEh0ODdPWldTb1dWZk1ZSkw2anpIcnRZcWFvd2hxMHRtaVRIQjFXVWE2?=
 =?utf-8?B?dGpIdUh1cjNJT211TmdJUWZxT1BWTUxmdFlndzZZT29ibFM5eHFidjVmK0lm?=
 =?utf-8?B?SG92dUFYREpVeURtWndCWTBQcTErclpQb1B4WDF2bEJscXBPSm9CWm16aWl1?=
 =?utf-8?B?cmxqcEhKTGNRT3pqSUluR2tvTElxbWprRFJqU0VYMEd5dE0zUmpMcmQ0NHBj?=
 =?utf-8?B?MU83aEhBRTljTG9FSlFIeXQzY0E3ZmZTbGtpRytWTGlVaTRrWmkvWVNOejBs?=
 =?utf-8?B?MW94Q2grd29wZ3NEZk5jZ2d6MDZYNklyY1J2UE5rMHB6SzkycGNoZURJL085?=
 =?utf-8?B?bFZHQ3M2VlRGdmNtZGJWRXg4MDRqdXBoelVURmoydytZYjNjaUlWczBpeTFw?=
 =?utf-8?B?ZFEzc2FRWndnUWREa1NkRXgrdGhrcGY1NnpldExkUStGSk93OVEzM0dUaURn?=
 =?utf-8?B?OHM5aEVpc1BhdUJUZVE4UzdlbjFuTU0wTEVodFNTMmtYVkhiLzh3azRENnpu?=
 =?utf-8?B?V2hadHRhSkZ5NlZ6aFBZcVZRQy9zQVBaUG5Ob2NBZFQvYnhyVU4veVZWS2ZL?=
 =?utf-8?B?YXRuQ1QzTktiV1FVRkhOOXhIOTVrb1hxSFU5ZUwwTVNiN2RKNnI3SkJTclRW?=
 =?utf-8?B?OG1ZdGhOKzlwSjFqUjNUUzBUbHNOUlloWVVNbXJBdXpGR2dHZHlCWlpPL2xT?=
 =?utf-8?B?ZDl5azlLSy85VTVtZE5SNkV2WEgwblU2dTE0NVRzbVZrZTVxZEZuWmd3ZXNq?=
 =?utf-8?Q?RnkmgfpA+tFWdf6R/xx01L4s8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f022e1-34b7-43f8-7517-08dd5241781f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 06:32:10.3486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQZ4RmIxJvobaQR9yWKEpEzJcoHuLGp16evW0FLASjQX36wzE7KthafrDFF908v0NlZvu7qEOAyiM9419XBn3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8584
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

Hi Lucas

On 2/21/2025 11:56 AM, Lucas De Marchi wrote:
> On Thu, Feb 20, 2025 at 10:45:46PM -0600, Lucas De Marchi wrote:
>> On Thu, Feb 20, 2025 at 05:14:07PM -0800, Umesh Nerlige Ramappa wrote:
>>> On Thu, Feb 20, 2025 at 03:46:55PM -0600, Lucas De Marchi wrote:
>>>> On Fri, Feb 14, 2025 at 03:38:13PM +0530, Riana Tauro wrote:
>>>>> When the engine events are created, acquire GT forcewake to read gpm
>>>>> timestamp required for the events and release on event destroy. This
>>>>> cannot be done during read due to the raw spinlock held my pmu.
>>>>>
>>>>> v2: remove forcewake counting (Umesh)
>>>>> v3: remove extra space (Umesh)
>>>>>
>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>>> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>>> ---
>>>>> drivers/gpu/drm/xe/xe_pmu.c       | 52 +++++++++++++++++++++++++++++--
>>>>> drivers/gpu/drm/xe/xe_pmu_types.h |  4 +++
>>>>> 2 files changed, 54 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>>>> index dc89fa6d0ec5..67693d642f5a 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>>>>> @@ -7,6 +7,7 @@
>>>>> #include <linux/device.h>
>>>>>
>>>>> #include "xe_device.h"
>>>>> +#include "xe_force_wake.h"
>>>>> #include "xe_gt_idle.h"
>>>>> #include "xe_guc_engine_activity.h"
>>>>> #include "xe_hw_engine.h"
>>>>> @@ -102,6 +103,37 @@ static struct xe_hw_engine 
>>>>> *event_to_hwe(struct perf_event *event)
>>>>>     return hwe;
>>>>> }
>>>>>
>>>>> +static bool is_engine_event(u64 config)
>>>>> +{
>>>>> +    unsigned int event_id = config_to_event_id(config);
>>>>> +
>>>>> +    return (event_id == XE_PMU_EVENT_ENGINE_TOTAL_TICKS ||
>>>>> +        event_id == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>>>>> +}
>>>>> +
>>>>> +static bool event_gt_forcewake(struct perf_event *event)
>>>>> +{
>>>>> +    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>>>> pmu.base);
>>>>> +    u64 config = event->attr.config;
>>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>>> +    struct xe_gt *gt;
>>>>> +    unsigned int fw_ref;
>>>>> +
>>>>> +    if (!is_engine_event(config))
>>>>> +        return true;
>>>>> +
>>>>> +    gt = xe_device_get_gt(xe, config_to_gt_id(config));
>>>>> +
>>>>> +    fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>> +    if (!fw_ref)
>>>>> +        return false;
>>>>> +
>>>>> +    if (!pmu->fw_ref)
>>>>> +        pmu->fw_ref = fw_ref;
>>>>
>>>> how this shared fw_ref is supposed to work for multiple
>>>> perf_event_open()?
>>>
>>> Agree, not ideal, but I don't see an issue. This forcewake is only 
>>> being taken for engine-* events and the domain is always XE_FW_GT. 
>>> Looking at xe_force_wake_get(), I see that it returns a mask of 
>>> domains enabled. In this case, it would be the XE_FW_GT. The return 
>>> value is just stored so that the corresponding event destroy can put 
>>> the forcewake.
>>>
>>>>
>>>> fd1 = perf_event_open( ... gt=0 ...);
>>>>
>>>>     event_get_forcewake()
>>>>         pmu->fw_ref = xe_force_wake_get()
>>>>
>>>> fd2 = perf_event_open( ... gt=1 ...);
>>>>
>>>>     event_get_forcewake()
>>>>         // get the forcewake, but don't save the ref
>>>>
>>>> forcewake for gt1 is never put.
>>>
>>> pmu->fw_ref should be identical for all events taking this forcewake.
>>>
>>>>
>>>>
>>>> Or even multiple perf_event_open() for the same gt: we will not handle
>>>> the count correctly.
>>>
>>> The count is actually handled in domain->ref in the forcewake 
>>> implementation and note that forcewake is always taken for every 
>>> engine event that is being initialized and hence always being put for 
>>> every event that is destroyed. This code is not refcounting that.
>>
>> so... we never set pmu->fw_ref back to 0 and any event destroy will 
>> try to
>> put the force wake? That seems a different bug that avoids the bug I
>> was thinking about.
> 
> try calling perf stat multiple times and you end up with this:
> 
> cat  /sys/kernel/debug/dri/0/info | grep "force wake"
> gt0 force wake -1
> gt1 force wake 0
> cat  /sys/kernel/debug/dri/0/info | grep "force wake"
> gt0 force wake -2
> gt1 force wake 0

This would be for non-engine events and engine events with non-engine 
events as leader?
> 
> and
> 
> [ 1614.778054] RIP: 0010:xe_force_wake_put+0xab6/0x1430 [xe]
> [ 1614.778370] Code: ff 41 53 8b 85 f8 fe ff ff 50 ff b5 f0 fe ff ff 44 
> 8b 8d e8 fe ff ff 4c 8b 85 d8 fe ff ff 48 8b 95 d0 fe ff ff e8 4a c3 27 
> df <0f> 0b 4c 89 e2 48 83 c4 60 48 b8 00 00 00 00 00 fc ff df 48 c1
>   ea
> [ 1614.778381] RSP: 0018:ffff88812cb2f7d0 EFLAGS: 00010046
> [ 1614.778395] RAX: 0000000000000000 RBX: ffff888138b000d0 RCX: 
> 0000000000000000
> [ 1614.778405] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
> 0000000000000000
> [ 1614.778413] RBP: ffff88812cb2f968 R08: 0000000000000000 R09: 
> 0000000000000000
> [ 1614.778421] R10: 0000000000000000 R11: 0000000000000000 R12: 
> ffff888138b000e4
> [ 1614.778429] R13: 0000000000000001 R14: ffff888138b000d0 R15: 
> 00000000ffffffff
> [ 1614.778438] FS:  00007a9b757acd40(0000) GS:ffff8883f0e00000(0000) 
> knlGS:0000000000000000
> [ 1614.778447] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 1614.778456] CR2: 00007fcac269d5e0 CR3: 000000012a8ee003 CR4: 
> 0000000000f72ef0
> [ 1614.778464] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 
> 0000000000000000
> [ 1614.778472] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 
> 0000000000000400
> [ 1614.778480] PKRU: 55555554
> [ 1614.778488] Call Trace:
> [ 1614.778496]  <TASK>
> [ 1614.778506]  ? show_regs+0x6c/0x80
> [ 1614.778528]  ? __warn+0xd2/0x2e0
> [ 1614.778545]  ? xe_force_wake_put+0xab6/0x1430 [xe]
> [ 1614.778867]  ? report_bug+0x282/0x2f0
> [ 1614.778892]  ? handle_bug+0x6e/0xc0
> [ 1614.778906]  ? exc_invalid_op+0x18/0x50
> [ 1614.778919]  ? asm_exc_invalid_op+0x1b/0x20
> [ 1614.778953]  ? xe_force_wake_put+0xab6/0x1430 [xe]
> [ 1614.779318]  ? __pfx_xe_force_wake_put+0x10/0x10 [xe]
> [ 1614.779650]  xe_pmu_event_destroy+0x143/0x240 [xe]
> 
> 
>>
>>>
>>>>
>>>> In summary I think this fw ref needs to be per event... an easy way 
>>>> to do
>>>> that is to use the event->pmu_private field, to be populated on init...
>>>
>>> I am not opposed to that since that makes it future proof so that we 
>>> can indeed have events taking different forcewake domains, but let me 
>>> know if I missed something here since I think this alone should still 
>>> work.
>>>
>>>>
>>>>> +
>>>>> +    return true;
>>>>> +}
>>>>> +
>>>>> static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
>>>>>                 unsigned int id)
>>>>> {
>>>>> @@ -144,6 +176,13 @@ static bool event_param_valid(struct 
>>>>> perf_event *event)
>>>>> static void xe_pmu_event_destroy(struct perf_event *event)
>>>>> {
>>>>>     struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>>>> pmu.base);
>>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>>> +    struct xe_gt *gt;
>>>>> +
>>>>> +    if (pmu->fw_ref) {
>>>>> +        gt = xe_device_get_gt(xe, config_to_gt_id(event- 
>>>>> >attr.config));
>>>>> +        xe_force_wake_put(gt_to_fw(gt), pmu->fw_ref);
>>>>> +    }
>>>>>
>>>>>     drm_WARN_ON(&xe->drm, event->parent);
>>>>>     xe_pm_runtime_put(xe);
>>>>> @@ -183,18 +222,27 @@ static int xe_pmu_event_init(struct 
>>>>> perf_event *event)
>>>>>     if (!event->parent) {
>>>>>         drm_dev_get(&xe->drm);
>>>>>         xe_pm_runtime_get(xe);
>>>>> +        if (!event_gt_forcewake(event)) {
>>>>
>>>> if you group an engine vs non-engine counter, this won't work I think.
>>>> Can we test it?
>>>
>>> When you group events, init is called for each event. From the Xe PMU 
>>> implementation perspective, grouping shouldn't be any different.
>>
>> the event->parent is a shortcut to do this only once per group, but 
>> then you
>> can't look inside the event to decide if you need to take the 
>> forcewake or
>> not because it may be true for one event and false for another. Try
>> creating the events with the group leader being a non-engine event.
>> AFAICS the forcewake will not be taken.... something like (typed here
>> without testing):
>>
>> perf stat  -I1000 -e '{xe_0000_00_02.0/gt-c6- 
>> residency/,xe_0000_00_02.0/engine-active-ticks/}'
> 
> it seems like I mixed up here. Neither of these will have parent
> set - afaics that would be the case for events inherited from one task
> to another which is not the case here.
> 
> Lucas De Marchi
> 
>>
>> Lucas De Marchi
>>
>>>
>>> Regards,
>>> Umesh
>>>
>>>>
>>>> Lucas De Marchi
>>>>
>>>>> +            xe_pm_runtime_put(xe);
>>>>> +            drm_dev_put(&xe->drm);
>>>>> +            return -EINVAL;
>>>>> +        }
>>>>>         event->destroy = xe_pmu_event_destroy;
>>>>>     }
>>>>>
>>>>>     return 0;
>>>>> }
>>>>>
>>>>> -static u64 read_engine_events(struct xe_gt *gt, struct perf_event 
>>>>> *event)
>>>>> +static u64 read_engine_events(struct xe_gt *gt, struct perf_event 
>>>>> *event, u64 prev)
>>>>> {
>>>>>     struct xe_device *xe = gt_to_xe(gt);
>>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>>>     struct xe_hw_engine *hwe;
>>>>>     u64 val = 0;
>>>>>
>>>>> +    if (!pmu->fw_ref)
>>>>> +        return prev;
>>>>> +
>>>>>     hwe = event_to_hwe(event);
>>>>>     if (!hwe)
>>>>>         drm_warn(&xe->drm, "unknown engine\n");
>>>>> @@ -218,7 +266,7 @@ static u64 __xe_pmu_event_read(struct 
>>>>> perf_event *event, u64 prev)
>>>>>         return xe_gt_idle_residency_msec(&gt->gtidle);
>>>>>     case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>>>>>     case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>>>>> -        return read_engine_events(gt, event);
>>>>> +        return read_engine_events(gt, event, prev);
>>>>>     }
>>>>>
>>>>>     return 0;
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/ 
>>>>> xe/xe_pmu_types.h
>>>>> index f5ba4d56622c..07c4e592106e 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>>>>> @@ -30,6 +30,10 @@ struct xe_pmu {
>>>>>      * @name: Name as registered with perf core.
>>>>>      */
>>>>>     const char *name;
>>>>> +    /**
>>>>> +     * @fw_ref: force_wake ref
>>>>> +     */
>>>>> +    unsigned int fw_ref;
>>>>>     /**
>>>>>      * @supported_events: Bitmap of supported events, indexed by 
>>>>> event id
>>>>>      */
>>>>> -- 
>>>>> 2.47.1
>>>>>

