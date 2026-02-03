Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B52E7FDF3
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 01:03:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA8B10E45D;
	Tue,  3 Feb 2026 01:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZTanOJwU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B05410E45D
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 01:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770080591; x=1801616591;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=nPCuDZjh76GydAa4WtknFRFF6cgmf5qIKQ3sk93y0Xo=;
 b=ZTanOJwUIgkQM/9SN6YXZmg3itRqQEzrg76AmKQL4VUj3IkNor6IVNh4
 gKNtij95TXqLJAC6VkwzYT3RqpE4l7K73fkux47bc7cZCpMdS+mjpA2c7
 C5Xkp51YCIa4hokeinDoTyrqlPr+G+6pu5So1J4K8t86OUeB96BWpBaYj
 wUhlZD/A7q0do0GQLcJHOUj2E1j1Ho0OhwfXff8zJL/4DntTE6jG0VBSc
 dLFbK4Ztx1EHIOECgIEG8NlyLbFkIAR5ioqTmWi+zVhUmag6YNMEyyAqs
 cVGXODxvIoMCcvKfyHoZGid1u17V/jLu/ts4bj1XR1ZSG5x/y1KRcPFxI A==;
X-CSE-ConnectionGUID: Z8lPpRAyTGmoHWBpCdPutg==
X-CSE-MsgGUID: 5+OsLvgcT8CLOi4X70tx6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="81560643"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="81560643"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 17:03:11 -0800
X-CSE-ConnectionGUID: fRik3jvoQwSfDJTDkM5qzQ==
X-CSE-MsgGUID: Dhx9R1t3RWGynp8/S/7YrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="240359429"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 17:03:11 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 17:03:10 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 17:03:10 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 17:03:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lijxbZs1ZZJpe2deUhwNyUSl0Y8H3ymmGJDqoBW4x4xiEPN0SceYTu7sMm1PDzSdvAvfGqtbh2auAd+9tluzwq4qu8lR1Wdq96BWkxNKfpyI3hd9sxMIetpy9yrxq3dkh8zh3yh+ObvUyEZUyktxvrOItWAkM2i9LxAKHflaeUwv6Hy4PKtJO2HQOCqNngHmGmhkfaEqgiZ+GhOUrMl7Pkw/+fCPhVuu2l8GtnrRHpaipvTJ/I0lpVtZFhWWuEYVD3CzNRU6qFbguXiDlvfZtQrzBD3YSUG6X09h0ICWgaxcn5qmv0+XvcQwX+kHC1wUetfI1OHBc1s97yNz/Ei7NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66JkzXY4PIi/492kysn2ZHKpqE5EN918PS0qpcLXt2A=;
 b=ITET9rdO9ASOmULza0AGO1TAqfrJ2mfSDCc6LR5rl3zNKV8fcMNS8FCIZq+oQZkmAVPDUtcQVcoQMOD7osaEqUizOsbekGpy6WjZCRwoSw57npOb4A5oD00YvP4g6us4zi2X+oMgb9FMkauwIYOgxCchfwGgbBSqoOINxA6vodvkm4XDfKZAtPd9Co4DNMTjO1z7CdYcSTNYnU37EPqIlD2IEccBGSC/9fr5xwOdJiogBPUSPq+0yTsAxBlH9YpkwZ6pwgT+7UCRIVg+3irfo1/YGboqLazmQkfPrpprk9cfxO8Bv/ZTS2UR7J7BbBpfBZwmOOi4A8CwTgAHp5yNXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SN7PR11MB7091.namprd11.prod.outlook.com (2603:10b6:806:29a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 01:03:04 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 01:03:04 +0000
Message-ID: <b1ef6434-add7-47db-9c16-9de738e99c73@intel.com>
Date: Mon, 2 Feb 2026 17:03:04 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] Revert "drm/xe/xe3p_xpc: Enable Indirect Ring
 State for xe3p_xpc"
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260130210120.2682085-5-julia.filipchuk@intel.com>
 <20260130210120.2682085-7-julia.filipchuk@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260130210120.2682085-7-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::11) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SN7PR11MB7091:EE_
X-MS-Office365-Filtering-Correlation-Id: 201de63e-5a82-4d1b-f092-08de62bffc76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTc4NXlRSnRmSkJLUkR2SVQ5Kzc2RDZoOG5Gcm4vUE1MUytFRXNKYVVndTVG?=
 =?utf-8?B?Um5HT3FOUFFhVHkxd1BmRy9WU2cveEYrbjFuNTVaYTNsK05uZC9xeWlKRURn?=
 =?utf-8?B?aFFhQ0c0OER6dmQ0dUF6cnVLeHlXeDlMQ0dXV21BbnBQVUdOSGg4UmdJbFhv?=
 =?utf-8?B?ZFZjajRjSGZJR09NZEE1dGZZSTVSNUx3VHA1QWRmSGtEQXU5aFFaa1FscU4z?=
 =?utf-8?B?UXk5WkpjaThCcXdJc3g3Mk5VQUlwRzI2Tkd3TEV6S21OWXpsSlFxUTVNbEhh?=
 =?utf-8?B?Q2NGaklrMHdoR01ieHVKNFNKUWdCUGZkQWVGOVcyQSttdkRtVVp3akhURGZn?=
 =?utf-8?B?Mzd3UkVxMm9ZQTBKbDJrQWVwK1Byc2JYYi9kUjZ4ejZ5SnRvZlc5d1h5d3pm?=
 =?utf-8?B?MTNham5IbWlYdXk3ZFlQYmVJVU1CNUNUSkowM1ZhV1g3NGE0cklVNWMwM00y?=
 =?utf-8?B?WE02ZE5mTlMyR0xDNnFrQ2lVS0tlNTU5TzhzL1YzemtvUEE2Z3AxSkVhWERs?=
 =?utf-8?B?Rytwd2dzRjZ2N1ZreGhLdXVqTWp3WWpmRSs1eEUwSnFpTlBJd0NrSjBKNnh0?=
 =?utf-8?B?cUVKSWVQb0tXYXhNRGZjL0VVbmIvbXhQV1ZNZ3J5bXlGcU9lWEc4STlaSm5r?=
 =?utf-8?B?ZXl3QUZiazJ3Vk9HWXgraWp3bkhHRG5JMDdhM3dTWWRFaEZjMlY4MThSakNl?=
 =?utf-8?B?YS80MWJWVmlUODhlcHhnc1hQdlhlNmhhVnZDdUF4UUZGd0YxQWlmWlhRcEpv?=
 =?utf-8?B?U1IrTHVqZStvVndsbHpoczdBblRHZFR2ZjRCM3pNVENHK0UraFJFVzZFaUpX?=
 =?utf-8?B?dWgrMFRCRFBCZURRcGdPclRXdUJiU1JLV1dWdklwR3gyVDBleWlyYVRIMm5n?=
 =?utf-8?B?eXFwbm9VZnI2c2hIaU9oY0U2UGozSEQxZEYwQXRtWVlZY1FZU0JrUENGK2Nn?=
 =?utf-8?B?aVVNTkt2VFZGdkd4TFM5bjVBWFVac2YxSWlzSVRuby9WWDhwenI0a0VCNjdj?=
 =?utf-8?B?TURpRUtraXNRNlhVYWdMeWp3QkxxdktkU2VXVHpEU0lTbXpXVUpYY0xWV204?=
 =?utf-8?B?emRUK0R0MGl1dmUrRjlSV1hYRGRPMVJ4VXkwaXZOQzE3SmY1cUFEVC9aYXdv?=
 =?utf-8?B?RWROSTE2OENHM1kyWDhXN0pWdkNSRGpZTjAxdDJnTVFPTGZDSmI3Q1N5S2tW?=
 =?utf-8?B?VlBWUUhuWmJLdDhYcGM2Q09DVzYrL21sYUt0ODVuMnNiczRuQTcySE00OWhV?=
 =?utf-8?B?bk9QUitVZzdmZzZ3SUxEdU56MUovZDRKenZtcnBFRUpZbHpxNnluOWJCcnVW?=
 =?utf-8?B?OGpDbDh3UkdxL2hiaWhNYmFSaFBOelN0OW9QSUN4QldPWmtMd1YvbFJTdkpH?=
 =?utf-8?B?NERRN1FVcXppTmJ3bjBuaVV2RnE5SCtZVS9NdDFaWDFkSGxNSzhzMHV3emps?=
 =?utf-8?B?QXIrK0xnbjFnTERncU5rL2NSNEVCa0NhSE5yNkVMTkZnQWlUb3o3M2ZNdTZP?=
 =?utf-8?B?bVdrRlFlUzEzRXdSN0RncUFoTDVKYmp3cy9URkZiRld4OGhFT1hjMjdSbisx?=
 =?utf-8?B?N0ZuQW4vbGlHODltT0RVYThza0E3cTNUVUwrV0Nvd2cvQjhqRUtNaEZwVHAv?=
 =?utf-8?B?UUhKMG5DM3FoQmt2SlFCZnVETitpTkV3RTl0eXhuVzR4WGQwK2F6eFVSUjZp?=
 =?utf-8?B?c2kxOEswZlpnSHgyY1JYQnhLWXpDZklkdXNvbHM4VnlwMHBxSzZ3dG12MmxR?=
 =?utf-8?B?WGNUbTJWRzBmL3ovcGtyL3o2dVNnaHdMeGx5a1RUWlZvanFSYmRscXZEVC9Y?=
 =?utf-8?B?YlowMFA1N3ZpMEQzYmxKMTN0Ri9FdUdZUWZYQjY1aEFkbi94UzQ5em5XVUdO?=
 =?utf-8?B?Ri9LUFlLd3JVVkY1SU5UcWhRUVlBNVZLWXVFUFU4ZmgxT3p5RkVhd2VoZWlq?=
 =?utf-8?B?Rlk4OWpXMWx6SHdTRzFZVGFtcEpzVm92MDNEa1ovaDNJSXFJeGdVZUhtUnk3?=
 =?utf-8?B?enRjM0FqNkViOVIvR2EzOEdPZ280N28zS0NVaE81UWZDOFcwUEJiMkNlRlA1?=
 =?utf-8?B?VDFZZ2toejltUlkrbVVKV1lWaGF2c1pxR1RNRGlsVW9mKzdGbHV3ZXVoK2w5?=
 =?utf-8?Q?pFqE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnZRd05oRlJCOHAxRi9VSlBGV0tOUU01QmpnckorbVllS3BqUkw3RDlsRGU4?=
 =?utf-8?B?bzZlU2puc2xDVXFvMVAwMEMyTy9pUHgyYzRCY3oybTJrNEdLTHZhekhBVWpo?=
 =?utf-8?B?QkNyTXBRYmQ1L3h6VjJOOFFsdkRuU24vWnVmbUt3cU5RNHRYcUlXZnRhN1FS?=
 =?utf-8?B?bjJiWjVId05EY1RTTjBzRkdrbVZxaGpIcnRLRk9uZ1J6bFN2ZHF4SkkrODRp?=
 =?utf-8?B?WjhPZUM3a0ZGNmJNcUd4MkR3b0trNUxEVllBV2RDWmNxVXlUQmUzL1p6dGZD?=
 =?utf-8?B?eGpqRG8xTFliSEVmUVBLdnhyaWZKWUpOUzRxZGlQRnh3Z3BsTXg0ZUZXRzRU?=
 =?utf-8?B?T0REb2YyaUJSZ0JvTHcvMUhKQzNFL3dQcjVDdy9rOVVFM2VCS3V5VGpIYVlr?=
 =?utf-8?B?R0hzci9RbHFvNDJUMlZWdUg1ZTI4YUxSOVg3QlJqYmhqTU5QTnZWN1VJNmow?=
 =?utf-8?B?eENITmRhSTVTai9qdWYwR1hjNjFIRVU5emNvSEpZRW11bm9jMnNMR1Z2MEVn?=
 =?utf-8?B?WEpXdisyUFFhYzVkUHdLZUNxY0dIZUtTWWE3bmQyb0NsU0RTRzR4dFEzOTE4?=
 =?utf-8?B?bFdLbzFWdkEvZjlRM1g2cEk5ZjFFNUxtSkJORmNDKy9wNm43Y3NYdlFuQW4v?=
 =?utf-8?B?cDBrbVI5SUdCMXpudlZiWFdNTWx1Y0drcUxZeCtYN1BBRk8rSnI2cGN5cE5N?=
 =?utf-8?B?R2x6Wmd5Y00vdEhUS0diTjJFVDR3SDdpOElzZWcwOWFsMzNLUEp1dkdkamVG?=
 =?utf-8?B?MHZLT2VsYndRaEJYQnBQYlV0NHFkNU5TWXo4blY0YlRQSTJMZHVWNFRLYjdi?=
 =?utf-8?B?cnlwN3hUeWZRK3FVSjA4M0ZtSWMwZEZ5Z2VNdEJabzRxbjBqam00dmRlblhn?=
 =?utf-8?B?ODVtSlpqVmpYWTVLSzlJbktsQytZRWFsTi9NODJMZmFTdjRXZ3VUeWtqbytu?=
 =?utf-8?B?cElFNmhjMTlxT214KzNpeStPTmVOdXdYaWtsZ1NoeE1LcDZXZnFsdllnaDBD?=
 =?utf-8?B?QWp0a25mWTU5eEwrSFpxcGJ0MkdVb1E4L1NFdG9vTWIxUkNYWmxPenIzRUhL?=
 =?utf-8?B?OWpXQ293K0NlOXJUa0NsQzQrVmY1bHd3d3NheXRBbnkwWGxhWnlRTWVFdUds?=
 =?utf-8?B?ZURCRXM1VXM4ekRlMkRlekZLN3QzOEVzTk91UEhwRU9hQzNpV0Jkc1BEY0Z6?=
 =?utf-8?B?MGpuS2kvbUVvNmErUnV4YWZYRTFFTzQrUWZLdVBDWlUzai9FdmIza245ajdj?=
 =?utf-8?B?TmtseFlkL0cvUWNBSDFRR0FqU3daYnZqQm5MbTIwaFJzbUtZTTBiYklPWXVa?=
 =?utf-8?B?RS80UW1PVjkrZUtjME1ITWQzTlljZVVwV2hUUEZYYzFuZHdRN0JaQml0eHVk?=
 =?utf-8?B?Y0w1b1h1Q3JSUmtNRG9XNXIyMHEwL1VxRW13YlBVOW9ybTVtTXQ1anQ4LzdQ?=
 =?utf-8?B?WFpXRmRPcnF1dXJUVnpDNjZnR3FvNFJJNkpleCt3WVhteU41V1FmSE9zUlFs?=
 =?utf-8?B?amJkU3FaMFlSTWc4Z0hFZTU1amhkNUhRYWZkNHdYTkh6NGliQlNDejN6NDdn?=
 =?utf-8?B?aWcrd0FiS0cyQ09MSlJrSmg0VlpBZE14QkdxeDlUU1I3MTlUNEh2SW1RSDkv?=
 =?utf-8?B?WUd6dGswTXdvN0U0WWF6SUdpTFUrOEowd0wwejd5OGVPbUU0VGd3dGFPSlA3?=
 =?utf-8?B?N004eEdDZmFJUVA1bVllclpXeXZlSkZhenNGRndXbHBZYzliSnFhMENhdS9T?=
 =?utf-8?B?cGNzTkV1Y2REZ0V0cmwxV25MdHF0ekw3bkFuMzRzMnJjRVYxcGw1Y09DQmNP?=
 =?utf-8?B?SnI1VGdXMWFCU3gycGhBS0Z1eHovL1dYSU0reWtVQ2JiczZGMjZQOFFPbUhF?=
 =?utf-8?B?dktRT3plcXVLcXFkSnBhUU42ZXN2QnhaSUZPbEZCZjNUSnE3Y2dKdkM4MWV0?=
 =?utf-8?B?NXBlRGF2dEIwWTYzQTlFbUpiUXArTDFoM2o4SENVdktGYVlwbkZiK3JQaHRy?=
 =?utf-8?B?aldiWEw5OVlnZlB6UXBobG54K0ZsYWZSVjg3ZkZOTWNtQlNhRlFnSmYyc3Rm?=
 =?utf-8?B?akRZdkFZd0s5SWN4OGF4ZEtpNXIwK1hTM3Q5aHRrenZTM2tuNE5idzRPOVU0?=
 =?utf-8?B?SXJjVW15dzFMRklwQkI2ZVA2bUM0NkVGWTlyYVRvVFd1UFBIRXp0NXpNRWd0?=
 =?utf-8?B?QktZYjlFVVUxdjk4cEl4dFMvNGs2eDFuZ0gzOERjZVdRNjB5Z2FJcUNISlZm?=
 =?utf-8?B?bGkzeGNNYkRINU9nL0ZrOGwyUnVEcnlTZ05CamxxU2kza1FFYytDTFQvQlJK?=
 =?utf-8?B?Q2pYbHpPaVVydUhCVmpMSnBlekN6NHdiNjhLejNzVmNnb0FoRHNCaFhLZ0sx?=
 =?utf-8?Q?L5gMyWJxbsR2Gjyo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 201de63e-5a82-4d1b-f092-08de62bffc76
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 01:03:04.8522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCG/bk4gP3HgffolBev588pVyNtWWtw+mqSpMqb4Y+CNzJ1dCxVQKjOgwgHRssG1CZ9G7ZIbrQFBsGZKEVI3dOtnrluMAvXvh7VWTK8EjIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7091
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



On 1/30/2026 12:50 PM, Julia Filipchuk wrote:
> This reverts commit 81e77c028848b7131d7653dd443a4049334a920b.

This needs an explanation on why this revert is occurring. Also, This 
patch and the next one should be swapped, otherwise if a bisect ends up 
on this patch the feature will be disabled.

Daniele

>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index b5e8935fff1d..779546ec8836 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -108,7 +108,6 @@ static const struct xe_graphics_desc graphics_xe2 = {
>   
>   static const struct xe_graphics_desc graphics_xe3p_xpc = {
>   	XE2_GFX_FEATURES,
> -	.has_indirect_ring_state = 1,
>   	.hw_engine_mask =
>   		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
>   		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),

