Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB8CCF6BF0
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 06:01:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638DA10E00B;
	Wed,  7 Jan 2026 06:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RPZup2d5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36ED10E00B
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 06:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767765674; x=1799301674;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Eer+E65cDKfiIvLRQyQhWTxsx41NfDP/NoS0LbbR+Qw=;
 b=RPZup2d5yKxyrEZTlVpNelHcKD6Jvw8ySBZNisutaUjJulIkJAYQOc2e
 g3IQ8IPlZkWgTXURL4dnJfY2nZ6QSA6nTAdo90TVt8iZ/p8FuOkpwCuP6
 X4Yzt20ELq8dSaB6Wwc/GznpGfryAHAzzeXQhz6XNG0kVgZpvxe7XprRH
 DAgllX/7ZiRHBAwTBqeq27Lm/+yaEajEY+54ZaDEyN8wCbdgdMkVHSO6S
 oRaJMGCzR4KPAo8lPK5j7H8WHkxRHfC0Jt1Lzbo8jVS/91n4F3cPoykRm
 +p166v5sKqrCuAawaq4MRJQcNq8/wuX/NdOaG7Apn0SGEeaiSBHhODu1u w==;
X-CSE-ConnectionGUID: zxd4OCIZR0CyovABn2miRw==
X-CSE-MsgGUID: fXI0uDzbSAqp/fvkzA59Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="79434215"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="79434215"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 22:01:13 -0800
X-CSE-ConnectionGUID: QldMoXvuQfm15GgGq+GNrA==
X-CSE-MsgGUID: pQwNvwgNQ4u4f/3s9h+FSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="202746653"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 22:01:14 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 22:01:13 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 22:01:13 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 22:01:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AssraWvr3RnAfKoQ8ey4BWJYGtnDJkkFww+nCXStnwmVVQ+rw12LAhhiUa9AOl+PRUT3pevArYuQLuuYccpEtMv7/N62TQBlqVpALBTDIIPYSWMzZ/2HzkP4PVn9NvCrlrDLIjlEwVBhfVVoYloprF9TIMZB5z3b79wk2lo4jJ+dOJ+BwdUu6oEm98Uu1j6QIHsuf27VUdtitiEDpnwuDw6BgZ5J/jn4lV6NFVTWm8pRTYhqdV+1A3IPebfvskCT6vGYTTeLCH1ai0MlMKubaV5QPM+Xvhzp1g0QC3xeE9CR5rYlP5QPqKRhe/0DLfMA9UhMitM6UVmjnCTf1Dv+Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xsqZ2SucpuexjMQb5nTYuh7ne6O23pc65YEJWChxQy4=;
 b=Tb8i0QAIcpirupoRAbHYZ39mHW6hVyiq3Qpk3efpVCGC+V1o7mNkhy8hyeM/pdJ2Mm7G0GLsq4DQPqlGHIBe/snAREm10yeXqyd4r1iXG/gRjWsh4Xz239pk3/em1xjMhRWRREPy+c7C2C3xSpGD3kvJpZekcaIChjkm8Orj/PpmQcTPae4929ix9F8KPoMtXXz41z5pwh68PQjyOFGtBIHkWldFGpePbftQAMX0Pqakp3trR3/l2Sapepm5Flky8SmJDMk4BufcnlkV+8NxZXC9g/CpTYosIGb16R2182bmO+mzVaqOSQciQLBj1HRbQewO3IFavh3albuEbXGJAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB7660.namprd11.prod.outlook.com (2603:10b6:510:26f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.2; Wed, 7 Jan 2026 06:01:09 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 06:01:09 +0000
Message-ID: <6c2f38d8-8d91-4795-b0a5-76c5fb8552c0@intel.com>
Date: Wed, 7 Jan 2026 11:31:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe: Add a wrapper for set/unset params
To: <intel-xe@lists.freedesktop.org>
References: <20251223085129.412961-1-vinay.belgaumkar@intel.com>
 <20251223085129.412961-3-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20251223085129.412961-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e3b0ae5-73fb-48b8-9e05-08de4db22770
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bit4ZkQ1OXJtUFFpTzI0Tkk1NVBlOEp2TjNON0lxeS9BRS84VWlORndJL2Q2?=
 =?utf-8?B?OEtsSHNsUk9NaTQ4cndmOXFMQlBLeTk1Ty9sTENET0x4S1M0allQSHRIWlp2?=
 =?utf-8?B?RDN3c1EzU1hRSERHWXI3RXRwN3NNeXA2Tnp4d04xZ3BMYTB5MlozSW45ODBl?=
 =?utf-8?B?N1o0b3JPbzNmcWZBdmpUdGRocjN5YTczZ1RtRTFFQ2VvOGZSMGRpZTUyQ1h4?=
 =?utf-8?B?ejJDS1RUcks3NUxSUFFHUTZaRzd4RjZ5MytxWWFjZU5NTGd2MkNIblA2UkZk?=
 =?utf-8?B?OFUrQWJQVG90bmNIVFZHeDNFSVp0cVNMaWhVaU5TaEExM0xESEZKbFRJODZ6?=
 =?utf-8?B?dDBWYlVENU5aMnJkMlZ0SkJvRDFqb0RVMEc0V29SeWV4bk9SdkN1TjlvdDJF?=
 =?utf-8?B?M0JtOW9VbHkwbWhUYVdZVE1QSGVHWFFxS2tvb2ZVdDhzYWpLU0pqQWppUUZo?=
 =?utf-8?B?OXgyeWRwQXcyc0E3NEp1c01JOFU1dDNpeXFHVTcyR2NuTGgrUnRtUDhsZklr?=
 =?utf-8?B?OXJDd3pPWVZPaFBYZzE5NGFSK2VTYlFYcXFmdkpZS0kwR2lONTNoN1VSZkdw?=
 =?utf-8?B?cVk5Q1EyVEI3dW9xMldGRUtLV3ExamFZNEdIaDUzWStYaVg2T29PN3JGaUJi?=
 =?utf-8?B?L2hyS0FHN1NTVDJmY0k0cVpCWUlIMHlHaGFQWTdyVGRvSEhlRHRBcEwrZXpX?=
 =?utf-8?B?R2JuZkU1WVd1Tk81cUxqQ1RRUWNuY20zaVJlNDdsSWFtNXZOTHBJYWp4NU14?=
 =?utf-8?B?NlNQS2tsQVNTdjBydGtiampDa0ZBNDNNQnZrS0Rtbzd1T2FEYXBIbm5CUUZh?=
 =?utf-8?B?a2NoYnJyZnE1VE9CSGFYeHROd1FFL3JCWWRsZkFzOVA0UmtCaUVzdkZsZUZs?=
 =?utf-8?B?cXljYy81ZjNSVmlzYWRwSHBaK2FGR1lVRnpQUVpjWkNyK1pZa3FvZXhiMnhh?=
 =?utf-8?B?d2JjeXZyaFpjMTRLMmRpRUxPVElVcnRVWVlidEZXQTY5aVI4QW1Qa05nYVVJ?=
 =?utf-8?B?OTBPSWw5elFmWXkrTklrQ2d1QnhMTEI5ZTNWUDByUXlTd3RqaDFXM291Yksv?=
 =?utf-8?B?NEF1RWdobUxZU2xTdDRkN0ZvTHplZUg3RW40ZjdVT3R0YUVUS2ZpelJ2OTMv?=
 =?utf-8?B?VTlibW1QNlhLNlJRRzNwRW11RkZvVnFqT0NZS0ZUdlErV3YxZ2o2QVZQRFRw?=
 =?utf-8?B?SmtWY3F4RXo2YlpmU3NKNVRuSFVPd0ljMy9TUkNONXI5YlhaajRJUm45cW55?=
 =?utf-8?B?MGdqazFiN25qTlRQY1IwZW1DYi9VbVlhcE1BVlhpRFFjM2RQRWRSTkt3R21m?=
 =?utf-8?B?azVyb1hoTGNpMlZWQmhKMjNRSVl0TituSlJDZzhnS1hHQjRXSStpN0hRekg2?=
 =?utf-8?B?TWswbDBzVWVGUFBhbjY5bmp2RVJIZW56dWlqaG1FdmFtOWJxTXJuSVFPRDVn?=
 =?utf-8?B?Zy9EdmsvcThLanNqUnVxeENVVjVXQWNDdWgyL2pJdktVNFg0bFcyQWRqVDI5?=
 =?utf-8?B?SThneWQxSUZ4MU5rQUJPdHJyVWxhVHdaSlFJQkdEQ1JxUlNCWkw1OC9kYjBu?=
 =?utf-8?B?dXFLRmVySHl4NVJTa1EyamhlUk05OFRjbFBvYVdFYnZoQ0cxakE1U3hreDVw?=
 =?utf-8?B?ZTZkOFJ3VmY4QnZMNHBCaHE2RnhPNkRmV3k1NStldkRDZ3RncVI1Tlg3U3Rs?=
 =?utf-8?B?K1o2aGZiUEpQUlcrT3EvQkk2bUE0eVFYTzJLalUxSW8vRHdZL2lIY2lzd3lK?=
 =?utf-8?B?ZVc5RElFTkw2bWp6enZGZ05laksvekF5QWxiOE5ESTE5b243Y1JWTDYyRmJY?=
 =?utf-8?B?TXVuUHpKdU1NUEYyNVJSRnQ2R0EwM3NTNmYwOWg0NkY5WXhwWXRoWW8wQVRo?=
 =?utf-8?B?cVp5dmR0U1orZ3VRaVNGbFIvaFdobkNya28rWVlQODFKUjNYa0crVGxtdGtB?=
 =?utf-8?Q?6xeTpt90pN6LqPlHMlEW7cI3o2ezGYDZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWRVeTE3cm5vYk12NTlXWUFxV21WRmhZczEvREZRcU5mOWRudTU5NnNGSGxs?=
 =?utf-8?B?SWxiV0dzaC9LeUhFaVdWR0NFQmU5alJTSmYzenJoRUV6M3ZZRloxdm92VWlQ?=
 =?utf-8?B?TWRwSlZQZHluZnB5N3FuZW9ZcXY0ZDNVbzArcGxwNmxlZ2hRZEZTVGgxUHAv?=
 =?utf-8?B?MVZCaFlVbEJteWRjT20rMEd3TTdlZkswYitYTFN5amFqS3J5UmR2WDhSWE44?=
 =?utf-8?B?bTNxeEU1dXBaM1JTKzFZQ0RqQkt1VC9NcVRpbzg5bGxqSWxCOXJiN0RaQWI5?=
 =?utf-8?B?LzV5MENOUis1QmlnQytGMDlUNmcvdnFibVc3M3dhN0NSemJ3cXMvdXQ4Y252?=
 =?utf-8?B?bzl3ZVdXZVdMcDhyNWl2dXpLMzZidWZtbkFKenVrZlZPbmgrRjYyNUtRNHhZ?=
 =?utf-8?B?akZuZXhJSnlWakRZZXYydzhDK1pzd0I0MHVkK1g0eDRidEIzZzBON1Y3aVRB?=
 =?utf-8?B?VlpxeEZzZG5EOStOd1MxaUo3YSs0UGVsbFNOY0NxYkQzTUtnUFBMRW8wUGpn?=
 =?utf-8?B?STBSalRqcjFmS2RYT3pybkc3ZWpzTnh1c1ROQ0NmUTl1eDlFcVFPaXU2MFZF?=
 =?utf-8?B?V2wzNzdEeUdwSUVsN1ZIRGJxOVE1MGJRR0RZV1pHVE1VTXJ3VzB3Y3plTGxr?=
 =?utf-8?B?LzZUdUpRVmNHV1lHZ21PMmJYTTlNTVhEaE1VVGxITFdTVkdjMW9Vci9wbFZM?=
 =?utf-8?B?M0VXeWJkV1plQjd6VFZzUGhlMmVvdjV1emdkWm9RTFFweE1ZMzc5YTQrdWQw?=
 =?utf-8?B?UGJYWEYxU1dsTkU1SVk2SEJYR1Zob090S1ZFZzZTdk1vUmc3MnBoVFpXNFh1?=
 =?utf-8?B?clpUUlVyRmY5aFJZaXIyeFZGMkZkNnhxVytVNnpGYjRXZGNrWHByTVBaallP?=
 =?utf-8?B?TVdLUXk3blN6K3RSVXRod09MdTJuL0pZcWZLWkNCVHB4cUtBRVNJOVNWWDlJ?=
 =?utf-8?B?QUNUYlVCK0cxOGxIV29wYXdOKyttcG05bjc0RjZZSy8xdDB3UUhrekZwUStq?=
 =?utf-8?B?WGtpSVBnZm9pWWpEL1lzMTZqK1c4RkFVQTJVWFBZZnlkZUt3ZjViV2tRWmVh?=
 =?utf-8?B?RXN1TXhzZXdabjhGM1p2dWlhRytpK3UxY3czZXJZYzhscWlTMFdkNkRFZDBv?=
 =?utf-8?B?cm83TFpHamp3RXRCU3ZkZFM0UkRaR04vQWZQcDN5eUs5YzdxU1NFcDZWVy9Y?=
 =?utf-8?B?S2tXeDBXbmgyZzgzUjl5TXA3djFPTXdNSUJVZllleEtia21IM3kwaFk1UnRU?=
 =?utf-8?B?aXMxcldCUWRtQkZOVzJ6aTB4YVBlVnR4Zll2RVRLbUpodGNCR21VaGRoOENW?=
 =?utf-8?B?QVNseUhmRXBoOWI3NmJ4NGtsdGUycGFlUUZwTVIyWVpOME0vWmtFWDFvT0tT?=
 =?utf-8?B?NTlONDZMUk5TRXMrdmZKWTVHcTVOMUJKcDdhNitlWXJ4MHRaOHBMTkRHRG9T?=
 =?utf-8?B?K0lNNHVFd3JheG4rbGN4ZXFIS1FTUWpWaGM4YkRBdW9DWnBmb21ZME04dDFi?=
 =?utf-8?B?R3paWDZBNGxvM2tzWndwYnpmMlVWTlE2cWt0bnR0MkJyWGlHbHdjTkxKa2xq?=
 =?utf-8?B?T3NzamhYejZjR093WWZrdzNwSE1xRWdGZDFDajdWN2htLzVLbkZneVVMb3FV?=
 =?utf-8?B?cGFJTzlLVHpaTitPa2NyS3RscWlCcXhJN1dSaFJhZ3NUdW1SSGkxRDlKaFg1?=
 =?utf-8?B?dFhKSDNnd2pFMS85Qk9ua2FGNHZvWlJrNXlpNi9qVmxZUXFhWW5Ncmp6bHVt?=
 =?utf-8?B?S0lSYTd4L1hEVG5RNG05VENuMmEwUTVSOG0yQ0ZUN1hsaW5NQ3dMQ3o2V293?=
 =?utf-8?B?WCs1NEtaMlVVUWNYVElndzY2YkpTdGNpU0UvYWNYd1d3Q1lYTHc1L1hSczZw?=
 =?utf-8?B?cy8wRlQxcENQaGNSSy9sQXp2SDFjaVc5ZEM3L0ErNzk3RHJSVWlndnU1dlJx?=
 =?utf-8?B?SkNLenVlM2I5VUYzbDhXdWpTd3hDVXh5UHNNN2FQQmlUOFRxNVZoT0MwbmZ5?=
 =?utf-8?B?RFYzem03by9raE84bTRDWVZ1eCtjMWd3T05uSVY1ZzNjK0dOS2ExbUN5K1My?=
 =?utf-8?B?cVlDSUtDUndxL01RUnJKUUVUTTFYbE5rYWVDWGhmWXNKMWFidXhUWXpxMDJs?=
 =?utf-8?B?RUUxKzRta1hFYktKZEtVb3duT1JkTCt6eVJhRHY0UEludE82WmkzcjcyV3hv?=
 =?utf-8?B?WDY5SG9rWU1ETjVxZWp0V1Uwb2k4ZDlUeHVLRmNjRzNCRXhTT1BsOUdXSWFl?=
 =?utf-8?B?d1gwVG5pN0FFdnFQSzFhYnJsejRGVGRaa1EzZ1dYQUNZdUtJa0lWV0JSRHlI?=
 =?utf-8?B?L1NwZDRoakNmQzJ4SnhYVk1tOEd4M0VxRk5Oa09IQjdxU1FOZ0JuQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e3b0ae5-73fb-48b8-9e05-08de4db22770
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 06:01:09.5344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85B7iiqLpniUdm3pxr6KR+5kl6wkWEWV0qNz3K3CO91LZr5gP2ChmXHUeLRJvaMYuU//DLaFJhQ60UcRkRGVxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7660
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

Hi Vinay

On 12/23/2025 2:21 PM, Vinay Belgaumkar wrote:
> Also, extract out the GuC RC related set/unset param functions
> into xe_guc_rc file. GuC still allows us to override GuC RC mode
> using an SLPC H2G interface. Continue to use that interface, but
> move the related code to the newly created xe_guc_rc file.
> 
> v2: xe_guc_rc functions to use guc pointer instead of gt (Michal W)
> v3: Assert if runtime pm ref is not held (Michal W)
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_pc.c | 48 ++++++++++++++++------------------
>   drivers/gpu/drm/xe/xe_guc_pc.h |  2 ++
>   drivers/gpu/drm/xe/xe_guc_rc.c | 26 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_rc.h |  3 +++
>   drivers/gpu/drm/xe/xe_oa.c     |  9 +++----
>   5 files changed, 58 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 3e7173130066..93f4d56c6f40 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -264,6 +264,29 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>   	return ret;
>   }
>   
> +/**
> + * xe_guc_pc_action_set_param() - Set value of SLPC param
> + * @pc: Xe_GuC_PC instance
> + * @id: Param id
> + * @value: Value to set

Missing Description and return doc

> + */
> +int xe_guc_pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
> +{
> +	xe_device_assert_mem_access(pc_to_xe(pc));
> +	return pc_action_set_param(pc, id, value);
> +}
> +
> +/**
> + * xe_guc_pc_action_unset_param() - Revert to default value
> + * @pc: Xe_GuC_PC instance
> + * @id: Param id


Missing Description and return doc

> + */
> +int xe_guc_pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
> +{
> +	xe_device_assert_mem_access(pc_to_xe(pc));
> +	return pc_action_unset_param(pc, id);
> +}
> +
>   static u32 decode_freq(u32 raw)
>   {
>   	return DIV_ROUND_CLOSEST(raw * GT_FREQUENCY_MULTIPLIER,
> @@ -1045,31 +1068,6 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>   	return ret;
>   }
>   
> -/**
> - * xe_guc_pc_override_gucrc_mode - override GUCRC mode
> - * @pc: Xe_GuC_PC instance
> - * @mode: new value of the mode.
> - *
> - * Return: 0 on success, negative error code on error
> - */
> -int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode)
> -{
> -	guard(xe_pm_runtime)(pc_to_xe(pc));
> -	return pc_action_set_param(pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
> -}
> -
> -/**
> - * xe_guc_pc_unset_gucrc_mode - unset GUCRC mode override
> - * @pc: Xe_GuC_PC instance
> - *
> - * Return: 0 on success, negative error code on error
> - */
> -int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc)
> -{
> -	guard(xe_pm_runtime)(pc_to_xe(pc));
> -	return pc_action_unset_param(pc, SLPC_PARAM_PWRGATE_RC_MODE);
> -}
> -
>   static void pc_init_pcode_freq(struct xe_guc_pc *pc)
>   {
>   	u32 min = DIV_ROUND_CLOSEST(pc->rpn_freq, GT_FREQUENCY_MULTIPLIER);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 1b95873b262e..00182a02a49e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -18,6 +18,8 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc);
>   int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
>   int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);

We can remove these functions and the enum

>   void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
> +int xe_guc_pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value);
> +int xe_guc_pc_action_unset_param(struct xe_guc_pc *pc, u8 id);
>   
>   u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
>   int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
> index b7dab3158060..4d75babc4d28 100644
> --- a/drivers/gpu/drm/xe/xe_guc_rc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.c
> @@ -14,6 +14,7 @@
>   #include "xe_gt_idle.h"
>   #include "xe_gt_printk.h"
>   #include "xe_guc_ct.h"
> +#include "xe_guc_pc.h"
>   #include "xe_guc_rc.h"
>   #include "xe_pm.h"
>   
> @@ -137,3 +138,28 @@ int xe_guc_rc_start(struct xe_guc *guc)
>   
>   	return xe_guc_rc_enable(guc);
>   }
> +
> +/**
> + * xe_guc_rc_override_mode() - override GUCRC mode

nit: This can be named set_mode

Thanks
Riana

> + * @guc: Xe GuC instance
> + * @mode: new value of the mode.
> + *
> + * Return: 0 on success, negative error code on error
> + */
> +int xe_guc_rc_override_mode(struct xe_guc *guc, enum slpc_gucrc_mode mode)
> +{
> +	guard(xe_pm_runtime)(guc_to_xe(guc));
> +	return xe_guc_pc_action_set_param(&guc->pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
> +}
> +
> +/**
> + * xe_guc_rc_unset_mode() - revert to default mode
> + * @guc: Xe GuC instance
> + *
> + * Return: 0 on success, negative error code on error
> + */
> +int xe_guc_rc_unset_mode(struct xe_guc *guc)
> +{
> +	guard(xe_pm_runtime)(guc_to_xe(guc));
> +	return xe_guc_pc_action_unset_param(&guc->pc, SLPC_PARAM_PWRGATE_RC_MODE);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h b/drivers/gpu/drm/xe/xe_guc_rc.h
> index f2a6ae7f05d8..581c66ed7e3a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_rc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.h
> @@ -7,9 +7,12 @@
>   #define _XE_GUC_RC_H_
>   
>   struct xe_guc;
> +enum slpc_gucrc_mode;
>   
>   void xe_guc_rc_disable(struct xe_guc *guc);
>   int xe_guc_rc_start(struct xe_guc *guc);
>   int xe_guc_rc_init(struct xe_guc *guc);
> +int xe_guc_rc_override_mode(struct xe_guc *guc, enum slpc_gucrc_mode mode);
> +int xe_guc_rc_unset_mode(struct xe_guc *guc);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index abf87fe0b345..ae811c9c5303 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -29,7 +29,7 @@
>   #include "xe_gt.h"
>   #include "xe_gt_mcr.h"
>   #include "xe_gt_printk.h"
> -#include "xe_guc_pc.h"
> +#include "xe_guc_rc.h"
>   #include "xe_macros.h"
>   #include "xe_mmio.h"
>   #include "xe_oa.h"
> @@ -875,7 +875,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>   
>   	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
>   	if (stream->override_gucrc)
> -		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
> +		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(&gt->uc.guc));
>   
>   	xe_oa_free_configs(stream);
>   	xe_file_put(stream->xef);
> @@ -1765,8 +1765,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>   	 * state. Prevent this by overriding GUCRC mode.
>   	 */
>   	if (XE_GT_WA(stream->gt, 1509372804)) {
> -		ret = xe_guc_pc_override_gucrc_mode(&gt->uc.guc.pc,
> -						    SLPC_GUCRC_MODE_GUCRC_NO_RC6);
> +		ret = xe_guc_rc_override_mode(&gt->uc.guc, SLPC_GUCRC_MODE_GUCRC_NO_RC6);
>   		if (ret)
>   			goto err_free_configs;
>   
> @@ -1824,7 +1823,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>   	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
>   	xe_pm_runtime_put(stream->oa->xe);
>   	if (stream->override_gucrc)
> -		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
> +		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(&gt->uc.guc));
>   err_free_configs:
>   	xe_oa_free_configs(stream);
>   exit:

