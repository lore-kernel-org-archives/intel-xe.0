Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB32DCCF9F8
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 15:41:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B17F710E2AC;
	Wed,  5 Nov 2025 15:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQvwkfOs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D35510E2AC
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Nov 2025 15:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762357265; x=1793893265;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+DUEwAs4dOyE0BIhJSuf4+CFcb6HLj9WnVBWWUi4OBQ=;
 b=EQvwkfOs7EdcrmX41TO+X9nzMTcAKKgli9RzK9zOPuM8m92cx+kYwtGM
 IDsyfCmdvoViiKQgPHCdxbkIckCo3vu3aMinXSYKMVAhIukmqhYHczkp1
 AH3uO/rkfOhlOGQMYGUE6HqoWwcDdUjJb1FuNnBQmwJqDMT3z2cbnrJco
 h7iVwMeDmCubdu1ete+UWIGxtvWc7CHD9PmFSWFHxVx5Y2lfU3LQSBqN1
 UrLr7k0frsQycx6/P4+OQcgKceu/mM5WKfjNcSc5Q18TLvlx8nJnSJqr/
 YSALjKF2IsqI8ljHd3MWUPgHOBwKeqjATVtva6j7s8T/AxPxsstvwf2g2 Q==;
X-CSE-ConnectionGUID: ESU7dkTwTEuOD1f2ne6dMg==
X-CSE-MsgGUID: lm7bnFWnR6i2I2slWXjSDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64574167"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="64574167"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:41:04 -0800
X-CSE-ConnectionGUID: 6Bl4tNVlRviuOg+yct0LVQ==
X-CSE-MsgGUID: Lr4JR2fbSvmNb2mQ/JAsXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="191845931"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:41:04 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:41:03 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 07:41:03 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.26)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:41:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqVjDoc15ptdAZ+Rq2yCDyDaXX1Zntv/U0ngSlUDNxJHiOFB/vWP2BVtD3SoYUYKwo7J7Xbb89QqYJs/c49QIovZasRmyMa/IxFnBOtP9jSW67cLhkrT15z1KVL567XZnMUo6A02jEmytygYsC/MzBvUUFPCyrBlw34+szNoBbLylYxhC1ZYMy08ZsMcMOBVIk/A1yb5fNm6tCA9ExXRSZAF82PR+ZlObl/U/redPl96rn6Y4Kky90JTG7gQNnAiWsHKtFS2CnEpKC8pr7uZDWHuQj2dbNMzSI4ftJkp7AFKXSm5VUlM9gNkZq0gPpNgVsp6RbtRc2yhIltu2yEIKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fO93AmpXYMBFw87f0db1xA3wgo5FLJpCrPDuT46fPls=;
 b=UNhM7q1TuhKn4+nZEcT7efPhJ8H13TS3Ik8vRmqkd30M7BE9/v8/qH/5dgOKwLlI/0GcUAqAhnMBqgc1cVDK50yqqgX54/fuHiaGkZLTM8JkabCLiqdReE9BNXDhaAdeVATgAP2n8RePjErXWtG+mZ+H08h3QpYI5Xb1GWU5sUXT+ajA2BNTgxhzwpneARHEH1CGWdfPFtT2iryBCJfOS6KbRRfJhR9LDkCKNrRipEq0pG7uIeuhRFtkayY/bXQQUMNZjgBGKPtrSnat1ynr7OCAAEypc52DNfzVIDjG8gFhO1JEZFw8GAn9qerX5IPA3A6NmhFVoDdsjJdcUvSoKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.7; Wed, 5 Nov 2025 15:41:01 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 15:41:01 +0000
Date: Wed, 5 Nov 2025 16:40:57 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Remove never used code in xe_vm_create()
Message-ID: <acvpfdgsqjd7syrmou6ozpjum7bn4odn4aw6aoks52o7ityxxk@uenerivmd3wd>
References: <20251105011311.3177875-1-gwan-gyeong.mun@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251105011311.3177875-1-gwan-gyeong.mun@intel.com>
X-ClientProxiedBy: VE1PR03CA0021.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::33) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH0PR11MB5095:EE_
X-MS-Office365-Filtering-Correlation-Id: a31cdfbb-8fc7-4652-6e0a-08de1c81b8c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVF5YVpjRTVpZC9WRlBtL2VxQXpoZmt0c2l4QjhoNTdCTGk2dE1hRHE3YXNa?=
 =?utf-8?B?MElWMTVJa2J6UVNqWU5TVjl4ZXdja0R3STNPemtWZXNHeExYbXJtemJZZzU5?=
 =?utf-8?B?K2xrOUR2bklIYmZTWlF4aWNzMXkyM1N1NHVIM214ckc3MU52SG40M3c0dVRx?=
 =?utf-8?B?K2I5d0dMWDFQSDIrVjNlWkloUlJneE55cEh3dGJEZzZ6bDlXdURDVTNVYlU2?=
 =?utf-8?B?cnZmRk9pQnRza0hycXpwUERwdzBYSDJMOWN4R2VmNmhTVU9jUFB5ZzZadFp3?=
 =?utf-8?B?Z0xVbCtTM0FOVm9tZGpZdmgxbzg3d1JCbk1WOW1pZG5WRUJqNkhjeFEyeDZi?=
 =?utf-8?B?ai9DTFhmL1d5MGVLWFJ4L0ZjWUk5a2U1K2Z3N3kzQzRYQVlNa3BQeUdXbHVm?=
 =?utf-8?B?TldmYklCR2FaakpCSml3T1hQSkRyU2hLTVFDdjRzbTgyMFlOdVlIVTNjVkps?=
 =?utf-8?B?YTJxakdiMzR2V1V6QUg2RlU2ZXhLL2NxTzBRMUxEWFBmRTZYeVJNWjY3VW92?=
 =?utf-8?B?V2kxRDU0WVFMb1JjVzhNS05tYWl2MU9VRGFhNmdXZkhvNnptbXNTM2VBM3cx?=
 =?utf-8?B?VVNqV3Z5Qmt1QnhSVDQ0Zk5MQ3F3RXo2WkJyQTBkQTFaakhzcng1bmFxQVJQ?=
 =?utf-8?B?SU13T1BGSXo2b1N1cXZ0OVNkUXF1MkZPdFBjR0J4VnBabHNpRlFaM0dwa1Fm?=
 =?utf-8?B?RStPZnRRS0JzTXNjeW9tT2MvZVUyOUJzYTE5Y0p3K3RlOW5zeFlkb0RVWE1G?=
 =?utf-8?B?ZkU2TG5neFN0NVFwY3l6Q1FMZWhsUXhqZHhpeVlpbTJDL1p0ellldko1eDNG?=
 =?utf-8?B?anpJcWszTXZIeEtubWZuelFCaW5VQUZFbldINVJrZWE1YUtTL0hxK0FzNjF4?=
 =?utf-8?B?OXFqYnR4UFdGd0pPT1ZLYmxRT2tvZkFnWEFod2FxUkcxb0JUQWxJK3RNa3Q1?=
 =?utf-8?B?aW1JUUV6ZEFVY01pYzg5SGJXYmVrR1ZhNS95Sk1Lem53R1BSUzFJaFlGbWU0?=
 =?utf-8?B?b2IrK1JBUnFzN3FpSjVZZ3hVZ2NNMy82VlplRTJzRTNsMFdveXd0ZWx1Q3hv?=
 =?utf-8?B?NkNRT0p4aHNiS1hTOWVRTmRvK3AyQlU2OFFXQ2c2ckZKRkxJYm5PMEtOWWh4?=
 =?utf-8?B?ejE2NURVVGVhQU1zOGc3SEJmdjE3c3owUXRaUXdWNTJnbStLQ3ZYMzc4b0t6?=
 =?utf-8?B?QWFvNlBXa3J1SFpWbWdhM3gyUzhKVjFDR3B5RkZ6MjZnVkZCdUFpWllUMW5D?=
 =?utf-8?B?QTNUK1luSlNXc3VWUlJvUjkzT2x5alNCajlibWYrWUxDYWh6QzI2YXNITm1O?=
 =?utf-8?B?SWFRMWVjTU5wTkh3a211anJBMUk1YjFlV0pmZ2o5L2FoWDhRdmdudHpKWHZr?=
 =?utf-8?B?WnRUQytxcmk1dDR5NU9JRHhYZUJKYnZQazVuNVE0eUxjNGo4VzY4R3kraWdr?=
 =?utf-8?B?eCtjSjNlb1VqeHpjWGNGTXdCYkc2U1dsRXhJYW1PSlpJMEk2NmxGSHlUZ2VL?=
 =?utf-8?B?ZzdDaGlRNzEwTDdFZU1LQURNQVNoZ0pobm0xM1c0VkVSV09hc25EeC9yQkIz?=
 =?utf-8?B?MVhiZjFlZ2RTMHFwMit1TXQyeThsaXQ4eGlKRk0rN1Fhamx4Q0hnNkoycTl6?=
 =?utf-8?B?bW94RmJ5cGw0ajhYcDlXTFpndWU5WFFJT1g3Z2kyaWluNDlOZ3M4RTZiOWY3?=
 =?utf-8?B?aXNBSEFXTlFrWEFJNWR3a2U2aUhtUzBtOVZnN0xmeVhqd2pFdGlOeElVcE9J?=
 =?utf-8?B?eVFhOXJFN3EwUWZBRTV4VVVWc0JkZjhyZzlmR1VGWTFQMFd6L1A4MHhjdmxP?=
 =?utf-8?B?cmRCS3o1R21sSDY2OXM0MTQvc1RMVXlZZ1NRUW4yYk5kbmxsZFpKT2lXYWdx?=
 =?utf-8?B?OTQzSlMwUHBBYlV6b002dGNyNkVxa2U1SjFGK29MekViUlhzMnF5bllMOE53?=
 =?utf-8?Q?G2ZmOPiaDVO1HG2L/TUt17IMWjgQBCq6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MU9jcjQ4NGUrcFB0VnVYOSt4U3l4ZytvV0YwOFA4WERBcHRVRzNBbm5vSUNu?=
 =?utf-8?B?Z2w1T1dmS1RxWXp0OXhkZDV6cU11KzBhUkp2cnBIWkdHQzZXaXBMS002amwx?=
 =?utf-8?B?QzVYWHpDdlo5RHNpdDZHSU0rOS9SWFBBSHU4Y254Yi85YUxrbkh4L1oxNi9O?=
 =?utf-8?B?UUEyT1pZWkh1S1BzbFppVzJyQnhDaWNrWmltWGZlU05uNjBDVUQrQUROckRU?=
 =?utf-8?B?Wm53QnJlOG55WmR3VEUyM0tHMUJHTUV4Ti9YU1JObHBSMjBOeUFWcUJOdHNm?=
 =?utf-8?B?NzRjKzVqeWVRcjVBN25rbUxrc2NSM0xNVURtNjBIT09vUzdWMmsweU5mbEJX?=
 =?utf-8?B?cklBVG1ZWEtlUVR0ZU9ob0pwUHcvSVhsZzlCRTNpVnZETE1rRklsQWF5MTE5?=
 =?utf-8?B?d1Qvak9NT1MwNXp6ZkdBb1VKS29yM3pHVExjbCt1aUxHandTY1Q3Q293SjFP?=
 =?utf-8?B?V2pCY2tsb0pKMTU3Tjk1Vk5JcnJLZjdkdE1aRkhyUHNlRHA1bzVDaHB1THAv?=
 =?utf-8?B?RUFkMTQ3Z210UTBwTFVsdWE5Yjd1NEJEalJoYXU4YmMwTndwR2VrK0dCQ1V4?=
 =?utf-8?B?b3IvejQxdGNGUEgzQzZoeS9NRWg3SW1jMFhrTlNwOFM5SlFtN24zREhMN0xU?=
 =?utf-8?B?Y0p6TG1TQml5SWlMY24rdE1EZVlJRWx2SlV3TzJWdUh3RTEwSUt6a2VkNGNp?=
 =?utf-8?B?dlR6bTc2blh1N1dUejlDZEpmT3Y2YkVsTElWRStPYnFTRGdnc3cvbVRyZ0kz?=
 =?utf-8?B?ZXdVblRGTEZqbm9XLytuM1E2QzlPVHFXa0Y0a29pczlZb0w4N0Zab25WaEVI?=
 =?utf-8?B?RUJZaFNzbC94Y0gvQmpZK0tYcG1KV2ZYblZhMEQ0NGZPbGpodjhJZWV4amx2?=
 =?utf-8?B?bDRWZFhFc3drRHQ4eXlmbDRSV3Z4a2dvN0pIclhITDJIM2ZaUnBuVlEwUTNS?=
 =?utf-8?B?b040RjVyMWxhdDExOUtBeXZDNVE0dk9vcmM0dExtN1pKbDBUOVh6VE1wNjA1?=
 =?utf-8?B?RHFYcU1NZWV3enFNbXFZRDVOS1JXOW9EZFI4YkxuTWdqSzJKV25NWmplbEtF?=
 =?utf-8?B?Q0RjSGlvQ1ptSEh6bEhGdmNLNlIrNUEvdVg2dlpIVkdLeThIaHRGamU0MkVq?=
 =?utf-8?B?dFBRVlIvZzh5RVVhVWxNR1Arc0g1b1Z3aFJUNy9NZFdhc25PZzZoZThRWmpB?=
 =?utf-8?B?M3UvVUVoT0RyY2FpNCtlY1Z4cE5GSW1SdWZTQUt6V1o4R1N3a3NzTWl1Q0hS?=
 =?utf-8?B?UG1VYitpWWVlYnFhYzV0YTRVV2k3K3lKZEVBMzJITDFNNDhScGdsNTVmWlQx?=
 =?utf-8?B?L3VpU0RhTWxTenYrcW5FWWtKQlNEdVhEQjNqT1R4RFZqMHRhRjRsUzM5d3Yz?=
 =?utf-8?B?Yi9NeVQ3OXI2MkZiVFc2N3kzR3RnVzVZSjJYZVk2RmlkME1scnZaOTRvUFBO?=
 =?utf-8?B?NzVOYTZ6UStHaml6WDBrWTh4SVUyWXJxemxiOVNoODNWNTREMFM5Rm44VXdr?=
 =?utf-8?B?SE1rOHNpVStVRG5jcEMwQXpHUTNkb3VCa0t3MlVlMVovZ2ZTNDJKaDRhbWty?=
 =?utf-8?B?SmsxRnFsRUx2NW5naUJGSDNrS0xkR2REQ3lMV3E5WTl1R1lNVk1WVkdNWks2?=
 =?utf-8?B?aDFjMEJhNjR4blIwWldMbWkvYllsV1psU3ZkTW81cjhRZHJ6dmRZUTdpSlpj?=
 =?utf-8?B?dVRmZURuREJ1L3dwb2d2WFp2QTBIWkpQRHNpUmRSMkVvaDdWVTB4bDVzZVR3?=
 =?utf-8?B?WW5FZEl6VXFiZHVpVWluNFJWWmYxOXRhVXJDU0c1VVYzL0VzNHhmVjVMNGwz?=
 =?utf-8?B?WDFld1RUTmptaGlGOXY3am1lVkV4Kys0UkhOTjdORVVveGsxV2VuaTZtbEY2?=
 =?utf-8?B?c2J1TVlZVVVieWlsSXhlV29HaVVWbGZSbTRzUndQaG02TjgzRWxjSlNQUVhX?=
 =?utf-8?B?N2NWWHV2SzZBQ1J2ZThOR0RncTFTRmJJVGFPTEdmZlQ2ejhkNmJzT2dkTGtq?=
 =?utf-8?B?czUwaEEybmx2bmhaYk1WUmdTb0xiTWx2aVhNLzBmK0c3UzFUUnR3Y2E4WDBX?=
 =?utf-8?B?eEtkM1JveHFqaVYzUkRKeFFaRk9vT3hYSEFHQ3VyblJETGRwT3ZYbEVPZmNP?=
 =?utf-8?B?YmZWVEFCbUMxTmxtM2o0UkNwN3ZTaU43VTVWOUgzL0NEYm1MWmpHWDF5OWlw?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a31cdfbb-8fc7-4652-6e0a-08de1c81b8c4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:41:01.4309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ArZoxHbGBxoyVECI4tJE2gfwd5L+Ev6YgH97OB043pk/Fcv9wnWnSm5ZM7EIj888J/pTLLpMQfvYf0lZ8vYnFcXj3lOUXdH0LGqIQE0/Krs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5095
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

On Wed, Nov 05, 2025 at 03:13:11AM +0200, Gwan-gyeong Mun wrote:
> Clang is not happy with set but unused variable (this is visible
> with `make LLVM=1` build:
> 
>   drivers/gpu/drm/xe/xe_vm.c:1462:11: error: variable 'number_tiles' set
>   but not used [-Werror,-Wunused-but-set-variable]
> 
> The use of this variable was removed in the commit mentioned below as
> "Fixes:" but only its declaration and update remain.
> It seems like the variable is not used along with the assignment that
> does not have side effects as far as I can see.
> Remove those altogether.
> 
> Fixes: cb99e12ba8cb ("drm/xe: Decouple bind queue last fence from TLB invalidations")
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

Just noticed it as well.
Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

-Michał

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index ce2f2c063eba..8fb5cc6a69ec 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1459,7 +1459,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
>  	struct xe_validation_ctx ctx;
>  	struct drm_exec exec;
>  	struct xe_vm *vm;
> -	int err, number_tiles = 0;
> +	int err;
>  	struct xe_tile *tile;
>  	u8 id;
>  
> @@ -1620,7 +1620,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
>  				goto err_close;
>  			}
>  			vm->q[id] = q;
> -			number_tiles++;
>  		}
>  	}
>  
> -- 
> 2.51.0
> 
