Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048F2C87FC9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 10:28:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF37510E164;
	Wed, 30 Jul 2025 10:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UDPL7Xcc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADC910E164
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 10:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753871288; x=1785407288;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=w56OPvSCIqHUpSeFpWLJD2Xhy0I/v7GdZjmi/O8leL4=;
 b=UDPL7XccvMHAvSSsZ7JAGh3YzJPmBsgOFhecXV6kOD0Slx1RsdpHLCM1
 /sidXdp7LR6S/m3i842+Ng15Q36S0NZ1Z/4L/5/JtVRIblBF8r89hq3fz
 Dhqk+nNiaD4THdHL9zYS2Zn7M+9a1ZBOBP51AJKZD2AftDcVwZweyjUF1
 SOoEcmLaHs2IfC7pAWHrjtt0aohUE4n/2eRyrot0x1Kb1ygAdD6mOLTbF
 xVOOepN3hovfiTqKy2GfrUGnxyO3evZuFJQm1e6E76koVcinftUlGeM4q
 QPzO+awT2GFOzXWIBUlguRdAF3uQcvgXky10CFBZOOxSK3ii72NX+b3Vi w==;
X-CSE-ConnectionGUID: sZgklEAgTkWnNUJlO3I19w==
X-CSE-MsgGUID: UaBdTHMeR3K4Tqm72sjFqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="67247099"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="67247099"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 03:28:07 -0700
X-CSE-ConnectionGUID: 5/CVQzaYS72TTqxmr0bv2g==
X-CSE-MsgGUID: +OWLBPBhQFagsMAlb71rjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="163400668"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 03:28:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 03:28:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 03:28:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 30 Jul 2025 03:28:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDWd5GbAhfPwjYHSZj/ioFHqCAm8c7DE5yiEC83msoq+hKUlqQrU1nY82vajS6sPVLFk4+fMLm1WTpqMf2fF6eoxwnSloryeF35hg7VPMjPYxWpMj+NFF5Z+caiDlAMduEeX6lubE89moMKwS5AhD79+zyhEc0RJHwSgyAjxsJ17KO7IESR9vgR2nyNlRSkgplLMIM/pMgJnEnCXzGvsrlsA7YLH2hQWbiY23M0fTbtDJ1kumavU1sLhioc/eGAh58E/XR/2ifoDh5fsohM5Fph1Ugtj2txog/1XVEejDJyxs4+yA/ORsq8oyKrDJoDJJZbr2RFticfP8BVuMUHU+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VR9EtGN6n02uzjgxtuooAaZjFwQwmsbqOp/PYOiXXY0=;
 b=v644fsTSwBZl3d4HLn29EN4YzyoYkVIPoNxpd+CFFPSgTm7KSTPY7FVpKRSdvJoamNDgGgsqYjxUQMCYAmifMxLbU814v3+IibNpo+nCo9MG4Gt0jNfNKxo1iQr5O1qwDmyX18n9rk864zKtPY9AGX7TyOcUtGDLSy45SzmHHifOfsDSde0Pr8op2INtBKD1M9+BWcjkespItJFSsaUZacJ/VVHK3LLJHgC6BhTzu6vGwKrYbmc6zYe8ooI5qZFtWIrC0EuZ7/W8EXxKgqxQiWuY8AwuzuvJIANbrnbNJfoBPJN1KzZtvvas7sG0Fpf33FQrIDIy+eb/U1DaOZpnVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB7767.namprd11.prod.outlook.com (2603:10b6:8:138::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 10:28:00 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%4]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 10:28:00 +0000
Message-ID: <82099ca9-d17d-4982-acac-ff6603ecce9f@intel.com>
Date: Wed, 30 Jul 2025 12:27:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vf: Disable CSC support on VF
To: Lukasz Laguna <lukasz.laguna@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250729123437.5933-1-lukasz.laguna@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250729123437.5933-1-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0174.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::31) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a627567-d287-47a4-d804-08ddcf53c205
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MldLSWgrUE0wbXJQUURaRTRCNHZSb0dNRk9Sekc1WHZqVnc2b3BSblJaSlMy?=
 =?utf-8?B?SVFDYWQvM1hxQTVURzFITUJrQjRqM2crcVJjdjB6U2F2aWxXekgzQld1YWpo?=
 =?utf-8?B?UkFVM2xQeW5CbWR3emsvQkYyWjhzRVlLaFpCUDFRb0pJZnBKYXVIcGQyNThG?=
 =?utf-8?B?QzBxR0tTTXlqb3BJSi9wNUU1RTA4OHR0YjhhS3BVNjRaMFd2YzNTTndrYkdy?=
 =?utf-8?B?SVVJVDhOZGw0emxMemFsQkdGSnMvbFF4MisvMlBuRnRsSysxUGp4TVdPbEZJ?=
 =?utf-8?B?a1JFYTFOaVZUc0hrV3JwSUZObE1IZEpmM0NvVUFmendiS0pKWENpZFVqcmZC?=
 =?utf-8?B?V2UyKzRxSDE4K2dOY1JFOC9SelBaSWQzQmFEWW5PSXA2Tm1TSXByYmFSNjlI?=
 =?utf-8?B?Vm5uNS95Tzl2UDE4MXdhTjRhRUNxblRrYnRCSmM1ZGhLMXNVNzBQYlFFclhO?=
 =?utf-8?B?cVNoTmxyUkpjTXFqMzNkZStCcHAvaWo0dHNVMXArcUVCWGY3KzM0V3M2QjY2?=
 =?utf-8?B?UW1iTS9taVo5bVE0RGVJYldWYW01WlpmYlRBL2tLOVZDdzRnUnllcHk3b1dB?=
 =?utf-8?B?U2J5QitUcmJaSnhheXlMc0VrZ2RSL3RkakZNUi9seVNHdHJmanZVNnF6eXhr?=
 =?utf-8?B?N0lQWXZ3c2tIQWZIandhcFBCTTI3SnVmVm15QWpqWFljSVJ4WkRkcVBzMHhW?=
 =?utf-8?B?a0tNT0I5c1dIL1lXbjdqN1pIcjI1WGtPaUtEZTZCNkhRejNFeXhxZGlyUXIx?=
 =?utf-8?B?cURYZnBZSUZoT29qUHFvRDlwMmU3bnQxWXh1azVDR3FyRUpRb2JmUUl2TzR6?=
 =?utf-8?B?VEoreE15d2pzQWQwcWs3SVNpYzZ5ZnBYcVY4b2o5bDgrNGdaRTBSOElvaEhD?=
 =?utf-8?B?eUpPOVo5SXZGWFRDdHlJZGNVclNTbTA5WmRQRDZpbkh5MzVvclNmU0ZMdVA5?=
 =?utf-8?B?bjhsRnlaVzh4bXRHM045OWtPLzdNS2djS2ZSWVJmemRNVm5tNzczVGlOQU43?=
 =?utf-8?B?aDNZTVhQcmFKWHNFRVdsQ1RrN2FwT2IzVEd5U09DVXRobWo3Ri8vU2h0WmJR?=
 =?utf-8?B?dThFTklkNGdPMitHTUpoZ3IyaEQxdzVYVnRvYjB0YzN6SjAwRVY4cVAzNFEv?=
 =?utf-8?B?d0ZjL3lZOFRHM2E2Y0ZJanBLTjU4dFdGc1JaSVh4aVlTbWI0T2Y3MWZ6WU0w?=
 =?utf-8?B?UUVLY1IxZkxnOXg1S2dPSDVUR1M2anFOMzV2VVA0UldjNkxZSVM1QkIwek1J?=
 =?utf-8?B?Mk5yVGlIYjRzS3VXM3lkNWsvOFk5OUVCSFFRSTdVWVF0WituT25OSDluV1c0?=
 =?utf-8?B?T0xDcDB2SitXeXVGL0lzYjNrWjNQWklOV0F2N3RxNkJIa2NQSGRQV0JtQnJ6?=
 =?utf-8?B?OW9TcGZWeTJrbjc2MnZCMWZHRk1mQ0VhenMvTlU1S2JTNlNLaFNEekZtNnlC?=
 =?utf-8?B?NVhaN2xmempQUTVLTkxKZlcxeE1SbEdTZnZwSWlJZFk3Z214SHF5ODRMY2tq?=
 =?utf-8?B?L3J6NnpFQ0RjYjdna2l1QWdrRm9BOUZuQUhRdGVDbUdzOWVaeDc0aGNQUmJx?=
 =?utf-8?B?enRPU3hCR0oxQk1pSWVvbS9GSlltaFFLWFlHcEE5V0FVWVIxK1UrckhnOHNH?=
 =?utf-8?B?VFkyUTBFWGRmQTM4UFlFTkh6ZW84UzQzbWZta3BIbDFUMUNTNXlvU2ZmZ3J4?=
 =?utf-8?B?bDQzSXpkbWh5dVViTTFSdWtkbFo4aG9yeDlUVHBGU3VTTWFkRGw4WXoxUzN6?=
 =?utf-8?B?QjR3a2JOUjV0cEFBdVBrbHhPTnJUZlNqM2ozZkIrbytLYStNR3NWeFF1WG42?=
 =?utf-8?B?SlVUakdxNHBBOTI1UW0vWW5xOWt0QU9ic0MvZkVWVUNhTHo0RnludFdOUnZU?=
 =?utf-8?B?dy9RcFJyS1B4NXJyMmZUUjgxb1JOVERZYmtLUmoxd3E4YzN5dmtpdUZRUDBV?=
 =?utf-8?Q?5bV9ldlZKpE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajRXZFVYMTd3bEM0WU5ZOEJBUkJQRTE2ZmQ4RElzN0laMmtocEZPSmxsakZy?=
 =?utf-8?B?bXdhcFlidFYvKzJLSXRTWW01TlFKQU52WnlWaWRpQ2dIVGpNQXVjRlAxZnpk?=
 =?utf-8?B?Q3Buc01VbTdBUC81Qm5HcWZiN0dRYkdMcTB0SUtxaTk5dnRzeHFOdXc0VWk5?=
 =?utf-8?B?WUdrTXBTRUdMRmRtR2wvZVRTdjJHRWk2SW9Gc0lERW9ZZDllaFhmZ0VCVEw4?=
 =?utf-8?B?L0RwQWRTTHV2VmM4Qng2YkFLcjArRXo3MUtCQXRCOU04ZGl2aTM3MmpXN0pq?=
 =?utf-8?B?aUNmbGMwWUpoU2FnTDN2Vk0zdVFpLy9JM0lyK2JCYk5aancwZCtnWlRtNDN1?=
 =?utf-8?B?d3ZUdEdxTHN5cGkxVHNaMGVFd1RIS2JsV2VqSk9peTN3OXNxZ09JY25tQTU5?=
 =?utf-8?B?UzhMN2xLWnlDejg2N2FNRE9OckJlVEs5c3JMWmNkVmJVUXVKdU85NTN1elVN?=
 =?utf-8?B?MEU4YnF6eVN1bmJxUkt4OHhaOVNGUTRFV29hcU9qTFloYlU2WHloZUxXclRT?=
 =?utf-8?B?MDlvT0lNc1BXOUVDWmxXbDVackdhS1M3d3oyQ0EwdkIvR2ZZN1orcUxaRDJp?=
 =?utf-8?B?M0Q5SDdmVGEyMlNmaWZNdE5BMHkyK1ZYbVZ1Q2RkZmJ2K05aL1JXdVNBQ1M2?=
 =?utf-8?B?ZVdqaklYSXgvYkdjTkh5eGlVSDl2R1gyRlc1RmJjSVdTeXFqNCtGNy8yR20v?=
 =?utf-8?B?NHBrVTQ4MnJ1TDE0djZra3BtZDY3NSt3SDlPNlkvV2RLSUtBQnlzZlU3Z3ha?=
 =?utf-8?B?YVUvMWI2NkZJcWJTU1g3UUJZc0JTWTR5RU91ZmV4RjN2U05FRFlETjFOMndz?=
 =?utf-8?B?YnBvaTdzcXhLcE9ZSUJ3Q2FjS2F5MkowNFd2WVlpN3BNNmZ4dDlrM3VyaTZm?=
 =?utf-8?B?VDl1TlpvRVk2U1c3bjF3U1RWcmlCY3UzT1J0bDU3U3J0bGdaTElkQ3h3SkI5?=
 =?utf-8?B?OWxIRW1SV0tDWUFqNUp2M2R0NDhBTXdDRnBadUt0QTNGYTMycHZFVm15ZkNF?=
 =?utf-8?B?OWdaUXdQcHR4S0pOZDYzQVBuYkdEZ3UrZkNKdTN5V3drL05FVUxMZzNnZ3lT?=
 =?utf-8?B?SzBuNmU5SnFoamdJZVdKU3oyVEJMOGprYm02eGg5Tm81U1Nic0cxc3BEbGFM?=
 =?utf-8?B?Mng0Z3dCMitsTm1qTzVGWFdGUDRFMUhkRHcrMjMrUWY2UDZiTGVid2szOG1X?=
 =?utf-8?B?SDdaK3BvK2ZoSGVxTTByUUlvUm9qaGdRWWFZbnIvR0pna2F4aVkxTTRkM2lG?=
 =?utf-8?B?ak03MXNGLzhQZXYwbmRYdHAwVTdtdUNucVhreXJTeDBlMmZuQVNFakR4Ylpo?=
 =?utf-8?B?SUNYZkJvVUV1ZERrb21IMUkxLy9NRitBQklhenJYL1pva3c4dHJiMW5wdVRF?=
 =?utf-8?B?MGNORytPTGxzVDA5M2ZTMXBBRkwvcEwvVmd6NEE3cndma0V4U25RZFQxRFc1?=
 =?utf-8?B?ZkxvTmhNK2FhcUpMZFNLdnErVmF4VGVHd1U4Z2FDWE02amZnZjF5Qis3czBq?=
 =?utf-8?B?b2ZiOFlRSjR2akMxRjdBVkNEZHlXUFZDeTRJdGZIRzdBNTV6OFI3bStVeUlO?=
 =?utf-8?B?U0U3YjNyQ3ZBNDU4NTBsN2ROUk8rSDl2OXNHZGVQU0VmZmZ3UVQybWpQNjBT?=
 =?utf-8?B?SkFvL0g4WHhYOEtOcUJsMXNnK1NzK21NcXQycWlrRDFUMDJmYUpaRXBNbjFQ?=
 =?utf-8?B?WFZmYzFHVytCUGVDbFlKRENEMG5hYThERUVaVnAwNk5vQmtkOCtJUFpRMGF6?=
 =?utf-8?B?MzZVQWdoTm9UMGRzVTlRSVhmQ2lPK2RpUWgvVitZRDJKbURGRWtoc3ZheXhH?=
 =?utf-8?B?S2JuRUNpajFXK2FxSFBrOFJ6WmdNZ3RXaDFJK1djTkZTTFZjdlpmQjY3MWpY?=
 =?utf-8?B?V1pjVUlGT2JyVFVtWkRlMUwyNmxIWld0bnk3dTlBOEhZdHdVTVFUTFRpZEVm?=
 =?utf-8?B?ditaREFZVWVkeXpoNGFPQ2pKVjJwMUpaQnlnVkxvakplR0VvSTc0NDB5c0hT?=
 =?utf-8?B?SUJBMklOZnlZclRPMVZnWHZCcWF5b3lkUE1oQ3p0b2lSUDRpRHY1VkpxcmZZ?=
 =?utf-8?B?UEZCNzdkalp0WmNaOE1Dak5MNmtablRKRWI5eXlRU0pXamlUb2svQXhJWE5x?=
 =?utf-8?B?V2EvYks3dldvT2xjUGpZZWJ4MGk1SDdUaCtPaVRxN25LYm0wd1hhYkt2NUQ4?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a627567-d287-47a4-d804-08ddcf53c205
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 10:28:00.3142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZYjLhfVLqcQQoj/O/wUiUzuPIjMAhIjD/DN/9aG8MDo2ou81Ghw8stJCL/8ICP1Hpypb+F7EuYlPUUiOQgODFsRmCPgMKbdtImay6YR+9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7767
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



On 7/29/2025 2:34 PM, Lukasz Laguna wrote:
> CSC is not accessible by VF drivers, so disable its support flag on VF
> to prevent further initialization attempts.
> 
> Fixes: e02cea83d32d ("drm/xe/gsc: add Battlemage support")
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Alexander Usyskin <alexander.usyskin@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d04a0ae018e6..c754374f1a8d 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -682,6 +682,7 @@ static void sriov_update_device_info(struct xe_device *xe)
>  	/* disable features that are not available/applicable to VFs */
>  	if (IS_SRIOV_VF(xe)) {
>  		xe->info.probe_display = 0;
> +		xe->info.has_heci_cscfi = 0;
>  		xe->info.has_heci_gscfi = 0;
>  		xe->info.skip_guc_pc = 1;
>  		xe->info.skip_pcode = 1;

