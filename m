Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BFCD2C57C
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 23:55:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED4910E082;
	Tue, 22 Oct 2024 23:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JNU7RIdT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C3010E082
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Oct 2024 23:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729641336; x=1761177336;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=jjV2/CzaSKZh02tDoDQApVGtAquRZkDBWSU8SidFv9M=;
 b=JNU7RIdTptLTEErWLWHBzYpN0V1RWYpTbEFf0zV2mpR+BOJhVG13p5dQ
 Upb0NCk1HeOrp9tzVHPyghSwEShqAd9Z5Vuvl+yGphdh8TzYdFbHKtboT
 wsKpz64C3zhxWafXr1cj4mFCMePxBDcZESOlrUGNMuzlMNGX2LA9D6VWv
 5kq9qJFWmcosyq3w2HsDSAWM0rbf2v9Z05I1HSS8Ofz4w6IOWY5HzKRvR
 zkA+y12Mqld3BMMK0YR8haipaTZ1znNLaBnOCHoevJIvcubLJbGQO6l4Z
 xYJExX7N0oSwN1roqWOKmrArpGCPzBsTF0SCgAJKMGKWQyfCPAbQyTdwk g==;
X-CSE-ConnectionGUID: Hpr1Po1GR9qIGLGHFVgekA==
X-CSE-MsgGUID: cXIWWMoGQwiW13+OMH+Gqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="39787660"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208,217";a="39787660"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 16:55:36 -0700
X-CSE-ConnectionGUID: hp9uw3d5RvW/42Iowiq6Tg==
X-CSE-MsgGUID: c7N3MTU3QwGG8yGG4A3h6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208,217";a="80358146"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Oct 2024 16:55:35 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 16:55:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 22 Oct 2024 16:55:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Oct 2024 16:55:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jNonPWdCEnvhhFKsnUGpXPwEA8XYoP9Kla6tvOum6P6TVRHSKaz2ofAMDR4AXLJ11s2EtY68rSpEZzgPqEPSSSrKruSYKb3D8Bo0vW4DwoZi6/o8k+NDOIgxQ0ijdmdaAsIMdVrm2OoSKHtDge4RB5O0LSR+ceykTW+74AzKKNxpUT26htTxHuS+MladzWATCr3tnYUdTrVLUP0vgc9ShRLqNjLQAIxGrFvaXuD2OrAMgYwKeZpLqboh2BwKNAx8L0ywpKiXUYZpSHt2rOAeWFKSwA3ORHZ9PxZJEQ7Z0rUfxpRj3sKidlRSsKrH7MufS8UlSa6mzQDkd4geQhgtIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Drglynv1J2y4WgOVahHUKRtWQYQtHLUPgdoYJ0cZ5Eo=;
 b=dV8JernVb/UMl1JUBrTd4WHs0JzFNVTcIDwMOpPPteNQ5+Q02sxD+4YM6F9p5MTxtl6tmf/1M14B/t13NhJvsyT53ilMwigoM0rV8nf6Gl3ZG3J+QbNSV+WyLLbwNUcSS0ffl7+AJ0+tqwMxbCCImsjZ5lJmB4Rgd1CSRiS2wCJVqfWaDZnI9nxKW6Z83NTuaFjZbvoVJ/yR/4QXToOyxwtzAO7dO/qzNPEFe+EiJ+A2D6I7UN3+LBpOGrmubGLXg0sCGfX+aXQ0HUqqIsnrCod8nPuqT5sugYCy1NeV++tX34Q94tte1pCKJ/9SBHH6t2sV7n406IBRPCH57y8IwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by IA0PR11MB7258.namprd11.prod.outlook.com (2603:10b6:208:43d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 23:55:32 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%7]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 23:55:32 +0000
Content-Type: multipart/alternative;
 boundary="------------m2fQy9Sf2WMXTIzDhxwYPC09"
Message-ID: <7bd2073a-553d-46b0-a507-9aabbb6d486b@intel.com>
Date: Tue, 22 Oct 2024 16:55:30 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: Introduce GuC PC debugfs
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20241009183648.36948-1-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20241009183648.36948-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR02CA0057.namprd02.prod.outlook.com
 (2603:10b6:a03:54::34) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|IA0PR11MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: 4085a36c-7a7b-4a74-67f3-08dcf2f50385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eU9QdndWQnEvOWl6OXdQZUpwRmNqZnlYRDU1N2pOQ3EyVnBHaXh4VFZ2b2Zs?=
 =?utf-8?B?Qit0STJIcHFTTWdqcWFCYUxJN2Y4SWZ3WjVMTkFadW03RkJUQzhaKzlFaXNO?=
 =?utf-8?B?dVhwRzd0QnU5SGN5cGdtdk5rMWJxV2FJVFY2Lyt4bjhzdVZpNGFrYnN3cFdK?=
 =?utf-8?B?ZkMxeVFXbUtpNEh5MnZXdndsNXRhTGRLdlg5eTJrVWJrRkd2eE8yelkwNWxm?=
 =?utf-8?B?L1BTeml5djEvSHVUWHV3SkFaa3k0NEJyVkdkVmJlRkZiOUlkT0l5ZEd5dmMv?=
 =?utf-8?B?dE51Z1FBOHFVL0xkUG80aVc5N1I2SDYwMGhta0xsbWJ6Q1RkdUhieTl5eEJi?=
 =?utf-8?B?WVZBMEh1NVIzOTlGckhpNGpuVFJkZmR0TU8zMDl3L3U3L2xRUDNBcEgwR3E2?=
 =?utf-8?B?NGlqeGNuRnNOSGNtQWthRzRreEZGWnFhdTgrc29kMzV2Umsvd24yaC9MTXdI?=
 =?utf-8?B?SCs3NTFNNHp2L1JGVWZReUtCQklHRVplZlVHYkVXbEpzblRNSklMcmRuNlRH?=
 =?utf-8?B?eHh3WVpjT2c2S1BWbzhNNWhNanNpcXJIWlJBeURaZVIrblVzWWRhWm1vSGdn?=
 =?utf-8?B?bHNPNTBpb3RBMmlraFdnL3ZxejFnZE1ZNm1XOVlDMW5KZDVlc1EybGNHYk44?=
 =?utf-8?B?RmZmeExzZHRQUzkrMjlTVWFDMzloTWF5M0w0YTg1RjVSZGQwTU1EaGZRa0Iw?=
 =?utf-8?B?ajdHdzZWaVM0Mk1kWjBlQnZ6dHVhVjljZlh2Y3lpVGFEYnRYeWR2dnUxREI4?=
 =?utf-8?B?Y1p0VGJRWGJ0WXVsVkhJdmxxcElZTnFXVUpsNS9hMW5NSEpJUDkrdjN1eVNV?=
 =?utf-8?B?ME51bU9NcFpXaDBqSHA5RGJKQXVkRG5Fd2k5dGxDU0xPbDNQRjVTNnZma0xS?=
 =?utf-8?B?NzNDejEwU0J3eEhiVnZTeVlSWlpwdGh4UjVraENoSWlDOXdaT2ZCMEFNMlN3?=
 =?utf-8?B?WE5aR1diMXR3TmhSc2F3QnJzTGE3elJ5SVg1eVh5QjZ4Z1I0THZtM2d2c2dG?=
 =?utf-8?B?ZU5kWU96L2lhRmhlSzMwbWtwNVhYTG5QdUtyWHgzQ1QzSHNkb3M3Q2xTaEN4?=
 =?utf-8?B?OC9wVGVtNWhTcHJ1b0hMTytpMVhoWHdiNC9yM2ZGcFMvOGNUWmJCTXpMdURU?=
 =?utf-8?B?QUV5R3pqd0VES29KaG5JWm1mR2hGMEg2Q0dHWktHeTd6dzIrK2g4NmNvTmEv?=
 =?utf-8?B?c2Uyb2F3elNMM3FCUnNMQ2h5SWxPc1RLbWZJV0tvRjFkUHQ1a3M2dURLWGVs?=
 =?utf-8?B?K2hQN0dKczUxcmJrcDUvd2Niay9sbWRpVFI2dytXVHFoRHB3UW9sOUJOSCtm?=
 =?utf-8?B?b2ZCME9qWTFJSXNQaERFOVFWT3Y4c3NiaW5xWWdVL2RHbU1mcVRGVURScTVR?=
 =?utf-8?B?MGFCVmZONW1lYjBkaXpFNEtHWk1WRkltVnQ0aXUwSTU0bjV0dWpMeEsxaHpp?=
 =?utf-8?B?VlltUGlYNWFqTlBKaU9hMEZuQ2tXdTBDa1BxSkZjb1FUc2RSMGhlN2N5eDI0?=
 =?utf-8?B?MmpEL1NaWWV0amJReEFEbHpraHErRlBwNjBLZHRtQWRTOW55RHFUdW5FVmhQ?=
 =?utf-8?B?emJuVm5tNkdNbVFrWkc0ZVJPMDJPeGN2SG9EZ2xKZi9icnVUcEZoaTZ1OEg1?=
 =?utf-8?B?UGxLM3ZaWHhGcTlvUXM2U0F5VXIyMk91UitJVXdid1Z0R3NKSzA0QmRLTXFP?=
 =?utf-8?B?Wkd5bHRMME9tbVhGS1Q0OXpJa1B6RTNKQnpFL2U5TjJiTjFnaVh5UHNML0lY?=
 =?utf-8?Q?RGiOhjlaSjIijl+cM8i4Dr86VRO/a6Bui343vwR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekRjdEFPaUZFOFI1blpkSWVnNU00Myt0T3EwN2plRWVmYk5jWjdkNnkybm1o?=
 =?utf-8?B?M2VuZk5TNTFwUEN4U3hpeGYyaTVXUlhNSVBFRjM4RmpTRFJMSy9SL04vamo0?=
 =?utf-8?B?dHJLTzlwdUpZUXljRE0zUFFYemZIM2lOSFpKMnFUVjAzMXRzOUJVRzRiN3E1?=
 =?utf-8?B?dWlFQzMwbW9EeXd6aUtWcmgrcFYveis1TEdTMmx2Q2FPUzV5R2FBamkrVUdh?=
 =?utf-8?B?dDZCWDVhQTFZZFU2V3pjRkxpcFE3T013YXo3Y2llUkhXV2Y5Skd5TUNlV3RB?=
 =?utf-8?B?QWZDZ0lDT0NESkh5Q0NQRnZDVjRiWmpyOEhaMlBRQ0lYdVkvZTN3dXkzb0NM?=
 =?utf-8?B?Tjl0NEtNVlQvWlowQ3ptTll5ZU9XNnJZZ1dOaXZ3YysyUjhJaTgvbnZEK2Yx?=
 =?utf-8?B?dmIwTmJxS0RYMFMyWEUxeHIxR3NCeTlzZ3pVcUZ2QTFqdnJ6MHhjMVgwREVP?=
 =?utf-8?B?cEdLNGpMOHVzeEFiL1RLSExGNU93TytzSEFpZVBGVXlrZ205ZFU0K1ZDOWEw?=
 =?utf-8?B?M2hwaU9kVW5tVEMwRlQwdjZ0amk0MlNobmNmTDYvQ1hNWlRHZnFaY1o0ZnNl?=
 =?utf-8?B?T0daUkNFRWFqMWFMUkp5S2RXdmg4TTZBd3pmVUNuc3NXRDV2RTFkL3U4NVFo?=
 =?utf-8?B?Mk43RTMyRmVRMWRuQUJZem1xVk4rc0RwSnlYWGtCQ3JjVTIzbWU0c3ZnbnBJ?=
 =?utf-8?B?Q2hQck5mRi9GR0kvQlVUWDdsQ3BSNHJBSS9uZXZGamVjd1loVmZaYzNaRnAy?=
 =?utf-8?B?NW9TOFVkTVl0YVRqT3p4NXgwUGttejJLZ2RTZ2pVNnFPeUJiMFozYURCenJU?=
 =?utf-8?B?eGN1VUNab2JFSXY2bGtnVm1iSkI4TFlOY2RFN2NWWHEvN3d4M05JOEpLcmxJ?=
 =?utf-8?B?MFcwNEUxODh1djFnTzNoYlowSHhaVmpOaVBtOEhmOG5XaEhpM0VZalhIOE9o?=
 =?utf-8?B?NWJMVUJsallwejlrS2lpWm1YQ3MyVCtXblYxSU51OFBHQXdyVjhERnlveTVC?=
 =?utf-8?B?NThJb3dJdzVZeStGWnlESVIrQWwxaG1qaHdCb3JBaWJ2S0RzKzJKOFpsMUIv?=
 =?utf-8?B?MGwwS1lkVDA3ZzJWMG9RWk15aU9RUXdId3F0ZE1sVXBERGE3MzVOdERZMUw4?=
 =?utf-8?B?R0Z2eEw0akp2eTNkTWdzemp4dDVJcXMxMmFYOUl5T2tYYWkraWZPaG5UdElI?=
 =?utf-8?B?VEtBRWVTTHpNVW9kVTMrVTM3WkhyZHZSYUx4UU9IZjM5WkJFdUxpQXVOWU5u?=
 =?utf-8?B?UlpoQkRxbG5CR01lTzB2alk3UUlPRkVwWHpBVkg0b3Z3T3ZFREh1U3hBc3dE?=
 =?utf-8?B?aWZRekVrcEpMWVRXZnI0OGJBaGMvUkUzNzJSNW00TlQ4bzBIU1BJcDFKNkdK?=
 =?utf-8?B?R2V3dDVSLzNWTVZhZVhIM3JpL2Z1YnRkaG1oLzBjZ0xwWFMzYTlSM25KNjRv?=
 =?utf-8?B?cExncVNGaW4rc1NENXZKY3lLMnZ5RUhxRlpZNFF2TTAxNENDaFVBZG1PV2Zk?=
 =?utf-8?B?Y0lVb2Jnc20yTWFaZXNxWnM0dGF6YjY2czFEeGpMTUkzVWF2MjVxMHUrUDlt?=
 =?utf-8?B?eEFUNE8yajk1RVV3bDNheWNJdU00K1NSblh6NWlIVkFDaXAzdm55UUxac3JQ?=
 =?utf-8?B?N2xBZlFyRmRHeWFOemUyYXBtb1krSTladWlHaDFTTFNNb05RTEoyRVZXYzJv?=
 =?utf-8?B?WFl2ejRHcGl3N2tCN1ZKTnRCYzZHZWhlYXR3eHFaVU1sYmNjdUg0aUNiRkdM?=
 =?utf-8?B?Q3QzUE56SnpnV09Tdk9mUjZpYVpZcHBOc2p3K2N5QlB0K21TTkoxaFF4WGJt?=
 =?utf-8?B?cXIrbFNHWDlCeGlHUUtZU09mMzcyZG1pdkVwUVlmZnRoT29YdWJ4Tk10OXVY?=
 =?utf-8?B?ckYvQXBlalVTbkg1SDVVZTJmaFYwUW0zSGRhK284VmhCbkFVR25oc0R3eUlU?=
 =?utf-8?B?RkUzbm12RkFLL1JVRGJZbHdXWDhIbEtPd01USm9qaUVxd3lheDlOSFZRN0tL?=
 =?utf-8?B?RVR5WnZiNGpxSVI2Rzh2bTE3aE41UTR2YVFMQm5WOEFHdnYvVm9JcFJHSFVk?=
 =?utf-8?B?Yjg1MXF5QXBualQweHpPcTZHcEkvdXJRTXZUQnJPc01QUGh2M2JxZXhVdkhs?=
 =?utf-8?B?NS9Mbm5zSzhJb0g0K05DRWwxaEo4V3VMd2I1QTk2Tk1EQ0pITW1OSTlPWjUy?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4085a36c-7a7b-4a74-67f3-08dcf2f50385
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 23:55:32.1763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vQ9xXw3Z2N/qH+ywjCIBJ8fXWt0ei1m6o+6kbFjZP+lQMjijh+cikcQzo6LaOoz6961BR10YiLUq2zy5pYXD5VlgSAtSj31cBRvnkpU1bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7258
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

--------------m2fQy9Sf2WMXTIzDhxwYPC09
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10/9/2024 11:36 AM, Rodrigo Vivi wrote:
> Allows the visualization of the current GuC power conservation
> status and policies.
>
> Cc: Vinay Belgaumkar<vinay.belgaumkar@intel.com>
> Signed-off-by: Rodrigo Vivi<rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_debugfs.c | 15 +++++++
>   drivers/gpu/drm/xe/xe_guc_pc.c      | 67 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_pc.h      |  2 +
>   3 files changed, 84 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> index d3822cbea273..8baa4913dbc0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> @@ -13,6 +13,7 @@
>   #include "xe_guc.h"
>   #include "xe_guc_ct.h"
>   #include "xe_guc_log.h"
> +#include "xe_guc_pc.h"
>   #include "xe_macros.h"
>   #include "xe_pm.h"
>   
> @@ -47,9 +48,23 @@ static int guc_log(struct seq_file *m, void *data)
>   	return 0;
>   }
>   
> +static int guc_pc(struct seq_file *m, void *data)
> +{
> +	struct xe_guc *guc = node_to_guc(m->private);
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	xe_pm_runtime_get(xe);
> +	xe_guc_pc_print(&guc->pc, &p);
> +	xe_pm_runtime_put(xe);
> +
> +	return 0;
> +}
> +
>   static const struct drm_info_list debugfs_list[] = {
>   	{"guc_info", guc_info, 0},
>   	{"guc_log", guc_log, 0},
> +	{"guc_pc", guc_pc, 0},
>   };
>   
>   void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 2b654f820ae2..4b38523c49e9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -8,6 +8,7 @@
>   #include <linux/delay.h>
>   
>   #include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
>   #include <generated/xe_wa_oob.h>
>   
>   #include "abi/guc_actions_slpc_abi.h"
> @@ -1082,3 +1083,69 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>   
>   	return devm_add_action_or_reset(xe->drm.dev, xe_guc_pc_fini_hw, pc);
>   }
> +
> +static const char *slpc_global_state_to_string(enum slpc_global_state state)
> +{
> +	switch (state) {
> +	case SLPC_GLOBAL_STATE_NOT_RUNNING:
> +		return "not running";
> +	case SLPC_GLOBAL_STATE_INITIALIZING:
> +		return "initializing";
> +	case SLPC_GLOBAL_STATE_RESETTING:
> +		return "resetting";
> +	case SLPC_GLOBAL_STATE_RUNNING:
> +		return "running";
> +	case SLPC_GLOBAL_STATE_SHUTTING_DOWN:
> +		return "shutting down";
> +	case SLPC_GLOBAL_STATE_ERROR:
> +		return "error";
> +	default:
> +		return "unknown";
> +	}
> +}
> +
> +static const char *pc_get_state_string(struct xe_guc_pc *pc)
> +{
> +	enum slpc_global_state state;
> +
> +	state = slpc_shared_data_read(pc, header.global_state);
> +	return slpc_global_state_to_string(state);
> +}
> +
> +/**
> + * xe_guc_pc_print - Print GuC's Power Conservation information for debug
> + * @pc: Xe_GuC_PC instance
> + * @p: drm_printer
> + */
> +void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p)
> +{
> +	drm_printf(p, "SLPC Shared Data Header:\n");
> +	drm_printf(p, "\tSize: %x\n", slpc_shared_data_read(pc, header.size));
> +	drm_printf(p, "\tGlobal State: %s\n", pc_get_state_string(pc));
> +
> +	if (pc_action_query_task_state(pc))
> +		return;
> +
> +	drm_printf(p, "\nSLPC Tasks Status:\n");
> +	drm_printf(p, "\tGTPERF enabled: %s\n",
> +		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
> +			      SLPC_GTPERF_TASK_ENABLED));
> +	drm_printf(p, "\tDCC enabled: %s\n",
> +		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
> +			      SLPC_DCC_TASK_ENABLED));
> +	drm_printf(p, "\tDCC in: %s\n",

DCC in *use*: ?

Otherwise LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

> +		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
> +			      SLPC_IN_DCC));
> +	drm_printf(p, "\tBalancer enabled: %s\n",
> +		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
> +			      SLPC_BALANCER_ENABLED));
> +	drm_printf(p, "\tIBC enabled: %s\n",
> +		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
> +			      SLPC_IBC_TASK_ENABLED));
> +	drm_printf(p, "\tBalancer IA LMT enabled: %s\n",
> +		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
> +			      SLPC_BALANCER_IA_LMT_ENABLED));
> +	drm_printf(p, "\tBalancer IA LMT active: %s\n",
> +		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
> +			      SLPC_BALANCER_IA_LMT_ACTIVE));
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index efda432fadfc..e333eddafcef 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -10,6 +10,7 @@
>   
>   struct xe_guc_pc;
>   enum slpc_gucrc_mode;
> +struct drm_printer;
>   
>   int xe_guc_pc_init(struct xe_guc_pc *pc);
>   int xe_guc_pc_start(struct xe_guc_pc *pc);
> @@ -17,6 +18,7 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc);
>   int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>   int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
>   int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
> +void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
>   
>   u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
>   int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
--------------m2fQy9Sf2WMXTIzDhxwYPC09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/9/2024 11:36 AM, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20241009183648.36948-1-rodrigo.vivi@intel.com">
      <pre wrap="" class="moz-quote-pre">Allows the visualization of the current GuC power conservation
status and policies.

Cc: Vinay Belgaumkar <a class="moz-txt-link-rfc2396E" href="mailto:vinay.belgaumkar@intel.com">&lt;vinay.belgaumkar@intel.com&gt;</a>
Signed-off-by: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_guc_debugfs.c | 15 +++++++
 drivers/gpu/drm/xe/xe_guc_pc.c      | 67 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.h      |  2 +
 3 files changed, 84 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index d3822cbea273..8baa4913dbc0 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -13,6 +13,7 @@
 #include &quot;xe_guc.h&quot;
 #include &quot;xe_guc_ct.h&quot;
 #include &quot;xe_guc_log.h&quot;
+#include &quot;xe_guc_pc.h&quot;
 #include &quot;xe_macros.h&quot;
 #include &quot;xe_pm.h&quot;
 
@@ -47,9 +48,23 @@ static int guc_log(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int guc_pc(struct seq_file *m, void *data)
+{
+	struct xe_guc *guc = node_to_guc(m-&gt;private);
+	struct xe_device *xe = guc_to_xe(guc);
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	xe_pm_runtime_get(xe);
+	xe_guc_pc_print(&amp;guc-&gt;pc, &amp;p);
+	xe_pm_runtime_put(xe);
+
+	return 0;
+}
+
 static const struct drm_info_list debugfs_list[] = {
 	{&quot;guc_info&quot;, guc_info, 0},
 	{&quot;guc_log&quot;, guc_log, 0},
+	{&quot;guc_pc&quot;, guc_pc, 0},
 };
 
 void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 2b654f820ae2..4b38523c49e9 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -8,6 +8,7 @@
 #include &lt;linux/delay.h&gt;
 
 #include &lt;drm/drm_managed.h&gt;
+#include &lt;drm/drm_print.h&gt;
 #include &lt;generated/xe_wa_oob.h&gt;
 
 #include &quot;abi/guc_actions_slpc_abi.h&quot;
@@ -1082,3 +1083,69 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 
 	return devm_add_action_or_reset(xe-&gt;drm.dev, xe_guc_pc_fini_hw, pc);
 }
+
+static const char *slpc_global_state_to_string(enum slpc_global_state state)
+{
+	switch (state) {
+	case SLPC_GLOBAL_STATE_NOT_RUNNING:
+		return &quot;not running&quot;;
+	case SLPC_GLOBAL_STATE_INITIALIZING:
+		return &quot;initializing&quot;;
+	case SLPC_GLOBAL_STATE_RESETTING:
+		return &quot;resetting&quot;;
+	case SLPC_GLOBAL_STATE_RUNNING:
+		return &quot;running&quot;;
+	case SLPC_GLOBAL_STATE_SHUTTING_DOWN:
+		return &quot;shutting down&quot;;
+	case SLPC_GLOBAL_STATE_ERROR:
+		return &quot;error&quot;;
+	default:
+		return &quot;unknown&quot;;
+	}
+}
+
+static const char *pc_get_state_string(struct xe_guc_pc *pc)
+{
+	enum slpc_global_state state;
+
+	state = slpc_shared_data_read(pc, header.global_state);
+	return slpc_global_state_to_string(state);
+}
+
+/**
+ * xe_guc_pc_print - Print GuC's Power Conservation information for debug
+ * @pc: Xe_GuC_PC instance
+ * @p: drm_printer
+ */
+void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p)
+{
+	drm_printf(p, &quot;SLPC Shared Data Header:\n&quot;);
+	drm_printf(p, &quot;\tSize: %x\n&quot;, slpc_shared_data_read(pc, header.size));
+	drm_printf(p, &quot;\tGlobal State: %s\n&quot;, pc_get_state_string(pc));
+
+	if (pc_action_query_task_state(pc))
+		return;
+
+	drm_printf(p, &quot;\nSLPC Tasks Status:\n&quot;);
+	drm_printf(p, &quot;\tGTPERF enabled: %s\n&quot;,
+		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &amp;
+			      SLPC_GTPERF_TASK_ENABLED));
+	drm_printf(p, &quot;\tDCC enabled: %s\n&quot;,
+		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &amp;
+			      SLPC_DCC_TASK_ENABLED));
+	drm_printf(p, &quot;\tDCC in: %s\n&quot;,</pre>
    </blockquote>
    <p>DCC in <b>use</b>: ? <br>
    </p>
    <p>Otherwise LGTM,</p>
    <p>Reviewed-by: Vinay Belgaumkar <a class="moz-txt-link-rfc2396E" href="mailto:vinay.belgaumkar@intel.com">&lt;vinay.belgaumkar@intel.com&gt;</a><br>
    </p>
    <blockquote type="cite" cite="mid:20241009183648.36948-1-rodrigo.vivi@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &amp;
+			      SLPC_IN_DCC));
+	drm_printf(p, &quot;\tBalancer enabled: %s\n&quot;,
+		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &amp;
+			      SLPC_BALANCER_ENABLED));
+	drm_printf(p, &quot;\tIBC enabled: %s\n&quot;,
+		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &amp;
+			      SLPC_IBC_TASK_ENABLED));
+	drm_printf(p, &quot;\tBalancer IA LMT enabled: %s\n&quot;,
+		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &amp;
+			      SLPC_BALANCER_IA_LMT_ENABLED));
+	drm_printf(p, &quot;\tBalancer IA LMT active: %s\n&quot;,
+		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &amp;
+			      SLPC_BALANCER_IA_LMT_ACTIVE));
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index efda432fadfc..e333eddafcef 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -10,6 +10,7 @@
 
 struct xe_guc_pc;
 enum slpc_gucrc_mode;
+struct drm_printer;
 
 int xe_guc_pc_init(struct xe_guc_pc *pc);
 int xe_guc_pc_start(struct xe_guc_pc *pc);
@@ -17,6 +18,7 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc);
 int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
 int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
 int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
+void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
 
 u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
 int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
</pre>
    </blockquote>
  </body>
</html>

--------------m2fQy9Sf2WMXTIzDhxwYPC09--
