Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D96FF8855
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 19:11:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751C410E04F;
	Tue,  5 May 2026 19:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CBL1IOQg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF2910E04F
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 19:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778008298; x=1809544298;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=9hhyp4W5M9oKD5NgYSAF/JeXYCVvB8VoHX7ovy4EBbM=;
 b=CBL1IOQg964sXpDiT+GlN8pGcN37KdI8zaljMTj6SFxQ9GkTjc5902az
 DWsec8GnR0fCBGgBcsAnR32+t2DF37/lkqxUjMUtNbTyFZmI00sAj+B+3
 1ZQQgSo3t+6vBoi2iIiI0JITCzNUl1YsjcVqbi4kXpdjkEJu0D11xsrIC
 EFc33BapD7a0L8oe6AGixrU09r1Ahc1dwck1FbGU7pYt4VT6lwlMvAG2d
 caQ+09zp2EHCtAV95DFcXHqvYqMYo7Fsu+w+i8c72Ol1hXIbFWbGsz5+N
 fbnkDd18xTFM16qXVS/9y9THO1c2JgXP+UDaHfG8rRoyU/uimtB/S4Jhv A==;
X-CSE-ConnectionGUID: nJQHKnUFQr23uWvEH69Uwg==
X-CSE-MsgGUID: oAoajD7BSRywu/JkllfYEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="104345493"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="104345493"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 12:11:38 -0700
X-CSE-ConnectionGUID: 0tNlRIslQgO/MVAk1Z9AgQ==
X-CSE-MsgGUID: y1QxEijRSJmXVlFXspxSzQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 12:11:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 12:11:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 12:11:37 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 12:11:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0x7ktZV6UffZZz4ccmqkyFaXNZr1G/CUWMeu+wwBhS43tbD9D0mh2DOOJCZQ0p/BeKbJwJSIV869YIbK/saiOe5h5FG0Bwrm69TCqGC7h/AVcIadgv/hcSiTSVhN+sesFlbyQyiK+lvzG1T41qqJSjzNe9Hyh9baBchdS/XyAO9ZU/lcclz38AZfXmD3ad13H5BL5TZEg35NzfdRXs/NoCYzHBO0y8DGmoJUpuoPb2/TcQQ4725mH4/+SBOVmvx6hm+RjiMPFO1NKDEgHsCRZfuX4/vd2TFZi7UhdpOfhbwVlXCRc1PCQ998laPXx8dLJmBFGUH94+e2uGgtMEF8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzzdDsXCn8qpN2Nl5Qla10Y0hbbPsEMJxbllRStF7oI=;
 b=W5uTgoDhL5anM6t4839pz7fuUseiJ8+ulhQlKh3Wx5a+6Jya5e/8t1RSvC96r77oyI8xnfvGXJ/jN3DBWtcod0OOwKAvWez49zQ0J5JGYaUNW0DV9lKU/lQtpaV9PACo/+qDHF3nb+McnsGKuwH4WHcYfWBNNtbteAdwuGCzsJDfj6gTgzT9Jkqhn5LccaYq1M17S0aqL+b6gghFOVjKiaTy9QLfAmtRzTWMzdpI4pgOwThQFXs2qAvDtL4OcMsRsHpf0X7VFjv/kKS76G/fcJuqPi5Zdt67EEyTtvMEFSGD/aN8BgzsC46b6y50IkKwwH6XECWz18GqaQfCeno4FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CH9PR11MB9904.namprd11.prod.outlook.com (2603:10b6:610:343::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 19:11:34 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 19:11:34 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 05/12] drm/xe/kunit: Abort test if MMIO operation is
 attempted
In-Reply-To: <203dac4b-2de5-4eef-8bee-e274701db2f2@intel.com>
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
 <20260116-rtp-mcr-check-v1-5-d420b9c1a327@intel.com>
 <203dac4b-2de5-4eef-8bee-e274701db2f2@intel.com>
Date: Tue, 5 May 2026 16:11:30 -0300
Message-ID: <87lddxy8m5.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR05CA0094.namprd05.prod.outlook.com
 (2603:10b6:a03:334::9) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CH9PR11MB9904:EE_
X-MS-Office365-Filtering-Correlation-Id: fee42ae6-0647-4783-3a86-08deaada1fab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: rA5v8vyXanux/9G7HS5/tRNsB/JbI4GXvOYKBs1WfqdHT514boRQTnE3Wzx5usGG5vVZrLgr2G5StUEoS3c/tFH0PcqZDSYLbw7gahq9AxDiILp1ThhUqGipxgKPGcwYEP3UhvtwAgcAZxLnf69U1BIHq+cHuy1RClVjcKIWGH5Z9kXy7y80VLW+X5PXRC6bY2o3p4qqfGLFOQqU/d51uUCjj+x/YqGf7076e0fXj/XMCw/YkLcIaZEFjHWrViRQ0IT4GUJuQFLMEb33cHtHW/EhHGw21R9+yICXayZA7g115uLUbSzxjzalK22ktDnUsxFMhpuYMJaGm7pCdR+t5tb4fLh6Cfs5+0XdtSOQEcPY7/y7lp1+VFE+x1Dqt0QYTEY8gAlrlf+DMoy/65OIEwcQ6eXWsAB5eIbu+CIr/uPl8jUWvVye/OPZQOc2Dg1tW3z12/qF/ABaAtuE8Rhk7i1GiETkKaGt5VkBqCZeCVBS1KBQ+hsXKUV6siRFfRvkZLZc+QjP1I2qgcGyvbGZzYNhTIsey5BJpxBpegWIaIgdwR862tC6LF0IMp+1mJA/nCZfsTJw2b0lv7EhXLjhB6h3VP4Xtf60nNzlS7CMIPASJrdiYF08Hg3UcWiQV7n4rfDmOwgR/Zuko342WN0ssuNWOaSjFeOUv3pBBz7aGhdK5/nDZg+pgQmtobgibYmv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTVzK3pkU1o0ekw4UWM3UUdYYnVTZWV1Nks5bWIvVXFDZmhzOHlmcmdvYTB0?=
 =?utf-8?B?L0ZGeVo4WVZwVGd0MXVjOVZEdUpZOE5qVDhKcU01ZXlQa2dQL1NlbStCMzFx?=
 =?utf-8?B?ZGZGZ2xiQThnWVJGUDZCbGI3TGtLYlhKYzBka1JJQUgrMFRVUzlPbGNYaXRZ?=
 =?utf-8?B?c3M1bDgwS1FOWEhublFQY3V4RXBuUmEyK21sTUVTTVdXT1p6UzJjWXA5eEV3?=
 =?utf-8?B?WEEzdWFQRUowcHlUL0dadCtYdnF4NTVrVDM4VDFUZFJpbGZYdTR0SkRXTXc1?=
 =?utf-8?B?NVBLaWkxQjRMV2lnNDFQaWk5TWtLUm9vSnBNVERrS0pQQXcrdjJCSS94d3h1?=
 =?utf-8?B?RlhpMzlMVm4ycUQ5dkV5WjJpOU1ERWhyNUFQMGpkZ0M2bVM0YThxQmlJZXpF?=
 =?utf-8?B?WG53eWt2UVpQOVk5UTBNV3BJN0RSQmpuNWlGRkErenJacFNXZDdUcXQxYWpE?=
 =?utf-8?B?VEdDNFMzRnZUYlh2bzZUM1FLTmNKbEw2R2FITlRzM203U3pxM011UDhnYlox?=
 =?utf-8?B?OWcvZGg4YlZMNCtmMGtlcmwzQ3RCQnJEdnFYd3B6M3JubDhJMldqMlkySWkv?=
 =?utf-8?B?N3ZRNGRLUGJJN0dVZVA4dS9lWFlNbkFmNnpyS2NtRnpOQmpwMUVGWWNkeVp4?=
 =?utf-8?B?QVFoQ3B3eCt5NWFURS9pVG54MU9iNUFMVjFaVE4wVHRzMkFYWU5nMkx6MkhK?=
 =?utf-8?B?VkJXaVA4TGJHbkMwZExzMThtVHBJUmRQeXRiWmdCT1laSEJ1NE9OVFM3RHo0?=
 =?utf-8?B?dGpBTFZTYk1FSDRkN3NaRDBpYjJhTkpQeU9qTWVaNEVHcFo0ZDdHb0pNZ0J1?=
 =?utf-8?B?RUNjdlFsbjZnVnZtQVJGc0paNGhGUEFmVytvUExGMVpBakQ4S3BTVFhmTkZH?=
 =?utf-8?B?WkVUY0tEWExOY1gwS0tIWE4ySi9RcTFPTk1menpub05OV1M5RG5zRi9oU2l3?=
 =?utf-8?B?WVJoTVZmc1Z1bVlsM0ZWMkR0MWwrc2pJb0kvK1NPT1d5UkR5elhnU1U1UDZ5?=
 =?utf-8?B?Uy9NZkxHOXIxZEJnRHlaQVRNdjdodWhJc2N5REJwUGY0eHhYR0wrS2xTNita?=
 =?utf-8?B?WUh0TnpKeEt2UXFGZjNhRzVmUzc3RnBvRmJNSTd1R2pJZXhoUm5ZSHVtdXYz?=
 =?utf-8?B?eG9kMmFwOHo2cENFMGd5bkc2U3Fud0txTFBPckMrUldSYTU1UEZIZ1VMQWJ2?=
 =?utf-8?B?TUZkbnlaaUhrdEllNGx4a2VhM1pSRjRYZFlIRWNPOTIwVVZ4c3BITG9sL1Vq?=
 =?utf-8?B?TmZ1ZGRRR1BxdUFUTWNMWFptRmUzeC9Fdk9kazRBSDVLTTVqZnRaZlZ1b1h1?=
 =?utf-8?B?ekUwQ2UvRno4amlOMHR3QVJ6ZnFIMG9VQTB3YXd0d1VmK1JxcXlOREh0OUVM?=
 =?utf-8?B?QkliM0ZiSzlVeDZ0RnBJeFQwSDA2WWlxdzdsNVJvc1p1REE5VzV4L2ZkT0RQ?=
 =?utf-8?B?bzVlU0NOL3pVb1ZFaUhpUVVvOEczQnRuVE5TTE9kd1YxZmZGM0REREt4YzEw?=
 =?utf-8?B?YzNqZlRkSTlQRGVCQmpYcERzOHlDTjNqYiswQ2V0ZFRkcTlhTnBhV0x3dHZY?=
 =?utf-8?B?cGVUSXRtL3dQU2hkd2I1N0VSdVBGVkpocTFGRldadTRlSkJrQlMrdDNKZGtl?=
 =?utf-8?B?dTcwWnJLYWg1M0s1QVZqaEZkc0luR0xxRzZHbCtYUGJMU2xhL3p4ekJYejl5?=
 =?utf-8?B?U2haWUIwSjhSdVNnOER3UEJ4K1RvaDNWcGJPRXRhT2lsL20xVWhGVXNDR1B1?=
 =?utf-8?B?WWUvd0ZzQXBmUG1BSEM0eVZFQTcrYjFxUHp2eFZVbzVuWi9iRlFWcUtSQWUx?=
 =?utf-8?B?R0l4L1FySkg4dkVudEVpRk9NNWhVR2FpeWhLMFJTcjIxNFJzbm1uMGdLbFFl?=
 =?utf-8?B?cG94b3NLNlVPSWpxeXdaNXdWQjRHTlVMY0JTaHJsZDJzaFFSUEtEMUJtTzFQ?=
 =?utf-8?B?SE5sWkJ2TjFlbEpEQ0RTV1J5N2dscWhRa2J1L0FkNVVzZFVjVCt2WWNxUnpa?=
 =?utf-8?B?UXljR3FXWmhlZUtqU3RWamw3SG1hbDVHVG1idEM3UU1rQm80cG5vd2lMSk9C?=
 =?utf-8?B?amNPT1pPR1dmamlXRVZBNjZhUGR4WUdDajREQlhaaDRhbUZLYjRlaXNpVm9I?=
 =?utf-8?B?bmFZVnVoeXdEQlVQa2JTNVVDdzUzWENCNUxYL1QvbldSVjJ5cDErVHhEUnpj?=
 =?utf-8?B?ZTBMUnR0aDhqV2x2UmlZNWFZd3gwNHFNRUs5R2hieTg1UlA3cS9HTkNOQ0l3?=
 =?utf-8?B?RTZGMzM4S1dQTUMrTXFFSktSeFYyQ0RIUTFkcFIxMWx4YVN3QVI5T1RiZ2h2?=
 =?utf-8?B?RU1hSzZ5YnJtYWFQM3dpTGtzWnFpV25JOFRORHJCTjBmaStPa0tJUT09?=
X-Exchange-RoutingPolicyChecked: K1Mgde3Bm3m8ffLpHGlEluZk/aEVU+tDsoloPy9+UCoOAfY1gtRpkPXAG8u+NiHXa4fOtXsgaZX4pA4KaRulbjw7ToNl7Q6rDiyDy1TIO+oHnFL5kkqkqErblP+S7gk3mihcSf1HM6Y4jTR/5rD6R7zLJENbEvJO00NEdvXyb88Bix//iwu7d9NPbh7JPM9TpPV86eVbUIKAHZt55TzCD5N0rB5ZzInHq1h4Qj/yaHAjyaTipUxUFUiNkeBPl1RQ0Xx8jjTaDWdSBqWG/rNCbxPnZu6j85DL0oZVhkoxvDhrUVTHD7BM/UDOEq5rkJAMHTx85WcF9atDKNHZSxrFtQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fee42ae6-0647-4783-3a86-08deaada1fab
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 19:11:34.7523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3DLh1VOM4WaDOIFqBGdYxjX437gJD4jAlKvh+izWD82P0XImRU442hyAsKLx2TcV1i9Eit6eNU5nQK73GiNiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR11MB9904
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

Michal Wajdeczko <michal.wajdeczko@intel.com> writes:

> On 1/16/2026 11:12 PM, Gustavo Sousa wrote:
>> Regular Xe KUnit tests (i.e. not the live ones) are usually run in
>> User-Mode Linux and do not have access to the real hardware and, as
>> such, should not attempt to do MMIO operations. If some test ends up
>> exercising a path that contains MMIO operations, the test should be
>> rewritten in a way that the MMIO is skipped or simulated (e.g. via a
>> static stub).
>>=20
>> Let's make sure to abort the test if MMIO is attempted on non-live
>> tests.  Before aborting, use drm_WARN() to cause a stack trace to be
>> logged as a debug aid to the developer.
>
> maybe cleaner solution would be first to add to all xe_mmio functions:
>
> 	KUNIT_STATIC_STUB_REDIRECT
>
> and then (in separate patch) activate "abort" stubs in xe_pci_fake_device=
_init,
> similar to what we do with read_gmdid & xe_info_probe_tile_count
>
> if any test would like to intercept some mmio read/writes it will just pr=
ovide and activate its own stub
> and such usage will be no different than any other use of stubs
>
> this will allow to drop patch 6 which introduces (IMO unnecessary) anothe=
r layer
> (where test should stub another test function instead of the real functio=
n)

Thanks for the feedback!

After seeing Matt's feedback on patch #12, I think we will end up
dropping this MMIO intercepting stuff.

I wonder if there is value in keeping the "abort" part though, to ensure
that we don't accidentally try to read info from non-existing hardware.

If so, I guess I would just keep this patch, but modified so that we
don't need the separate xe_kunit_mmio.c file.  Also, that would be a
matter of a separate series as well, since it would be orthogonal to
this series.

Thoughts?

--
Gustavo Sousa

>
>>=20
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/tests/Makefile        |  1 +
>>  drivers/gpu/drm/xe/tests/xe_kunit_mmio.c | 35 +++++++++++++++++++++++++=
+++++++
>>  drivers/gpu/drm/xe/tests/xe_kunit_mmio.h | 27 ++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_mmio.c             |  9 ++++++++
>>  4 files changed, 72 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/test=
s/Makefile
>> index 0e3408f4952c..8f3a594449c8 100644
>> --- a/drivers/gpu/drm/xe/tests/Makefile
>> +++ b/drivers/gpu/drm/xe/tests/Makefile
>> @@ -8,6 +8,7 @@ xe_live_test-y =3D xe_live_test_mod.o
>>  obj-$(CONFIG_DRM_XE_KUNIT_TEST) +=3D xe_test.o
>>  xe_test-y =3D xe_test_mod.o \
>>  	xe_args_test.o \
>> +	xe_kunit_mmio.o \
>>  	xe_pci_test.o \
>>  	xe_rtp_test.o \
>>  	xe_wa_test.o
>> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_mmio.c b/drivers/gpu/drm/=
xe/tests/xe_kunit_mmio.c
>> new file mode 100644
>> index 000000000000..debf8bd3f9dd
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_mmio.c
>> @@ -0,0 +1,35 @@
>> +// SPDX-License-Identifier: GPL-2.0 AND MIT
>> +/*
>> + * Copyright =C2=A9 2026 Intel Corporation
>> + */
>> +
>> +#include <kunit/test.h>
>> +#include <kunit/test-bug.h>
>> +
>> +#include <drm/drm_print.h>
>> +
>> +#include "tests/xe_kunit_helpers.h"
>> +#include "tests/xe_kunit_mmio.h"
>> +#include "xe_device_types.h"
>> +
>> +/**
>> + * xe_kunit_mmio_abort_if_not_live_test - Abort test execution if not i=
n a live test.
>> + * @mmio: MMIO target
>> + * @reg: Register on which an MMIO operation is about to be performed
>> + *
>> + * This function must be called from xe_mmio functions that perform MMI=
O
>> + * operations on the hardware.  If the current process is a kunit test =
and it is
>> + * not a live test, it will cause a warn and abort the test; otherwise =
it does
>> + * nothing.
>> + */
>> +void xe_kunit_mmio_abort_if_not_live_test(struct xe_mmio *mmio, struct =
xe_reg reg)
>> +{
>> +	struct xe_device *xe =3D tile_to_xe(mmio->tile);
>> +	struct kunit *test =3D kunit_get_current_test();
>> +
>> +	if (!test || xe_kunit_is_live_test(test))
>> +		return;
>> +
>> +	drm_WARN(&xe->drm, true, "MMIO function called on reg 0x%x\n", reg.add=
r);
>> +	KUNIT_FAIL_AND_ABORT(test, "MMIO function called on reg 0x%x\n", reg.a=
ddr);
>> +}
>> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_mmio.h b/drivers/gpu/drm/=
xe/tests/xe_kunit_mmio.h
>> new file mode 100644
>> index 000000000000..d46ac2b82969
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_mmio.h
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: GPL-2.0 AND MIT */
>> +/*
>> + * Copyright =C2=A9 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_KUNIT_MMIO_H_
>> +#define _XE_KUNIT_MMIO_H_
>> +
>> +#include <linux/types.h>
>> +
>> +#include "regs/xe_reg_defs.h"
>> +
>> +struct xe_mmio;
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>> +
>> +void xe_kunit_mmio_abort_if_not_live_test(struct xe_mmio *mmio, struct =
xe_reg reg);
>> +
>> +#else
>> +
>> +static void xe_kunit_mmio_abort_if_not_live_test(struct xe_mmio *mmio, =
struct xe_reg reg)
>> +{
>> +}
>> +
>> +#endif
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index bcb6674b7dac..0f9a1d5453df 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -14,6 +14,7 @@
>>  #include <drm/drm_print.h>
>> =20
>>  #include "regs/xe_bars.h"
>> +#include "tests/xe_kunit_mmio.h"
>>  #include "xe_device.h"
>>  #include "xe_gt_sriov_vf.h"
>>  #include "xe_sriov.h"
>> @@ -146,6 +147,8 @@ u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg=
 reg)
>>  	u32 addr =3D xe_mmio_adjusted_addr(mmio, reg.addr);
>>  	u8 val;
>> =20
>> +	xe_kunit_mmio_abort_if_not_live_test(mmio, reg);
>> +
>>  	mmio_flush_pending_writes(mmio);
>> =20
>>  	val =3D readb(mmio->regs + addr);
>> @@ -159,6 +162,8 @@ u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_r=
eg reg)
>>  	u32 addr =3D xe_mmio_adjusted_addr(mmio, reg.addr);
>>  	u16 val;
>> =20
>> +	xe_kunit_mmio_abort_if_not_live_test(mmio, reg);
>> +
>>  	mmio_flush_pending_writes(mmio);
>> =20
>>  	val =3D readw(mmio->regs + addr);
>> @@ -171,6 +176,8 @@ void xe_mmio_write32(struct xe_mmio *mmio, struct xe=
_reg reg, u32 val)
>>  {
>>  	u32 addr =3D xe_mmio_adjusted_addr(mmio, reg.addr);
>> =20
>> +	xe_kunit_mmio_abort_if_not_live_test(mmio, reg);
>> +
>>  	trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
>> =20
>>  	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
>> @@ -185,6 +192,8 @@ u32 xe_mmio_read32(struct xe_mmio *mmio, struct xe_r=
eg reg)
>>  	u32 addr =3D xe_mmio_adjusted_addr(mmio, reg.addr);
>>  	u32 val;
>> =20
>> +	xe_kunit_mmio_abort_if_not_live_test(mmio, reg);
>> +
>>  	mmio_flush_pending_writes(mmio);
>> =20
>>  	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
>>=20
