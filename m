Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945B1D3B7EA
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 17:52:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1610810E00F;
	Mon,  8 Dec 2025 17:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OjaBOgJp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B1910E00F
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 17:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765216336; x=1796752336;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=skjj7OuB9WAQPqDWBpMYW6RuFHC0S5S9kLEuwh7lNms=;
 b=OjaBOgJp0thn8pXUOQK84nEteuk5IDWu1cKz2gQPjTXT0VAlemXwkN6L
 JJDSPv1ylbJYVFZ+8jhIqFRKMHfEQ44PecaH957kIXZrZ1k1CpDH5QMNv
 fTZppvfxG7Z3wRKOq+7Rc0GnCQJxfdl04jSK3wp7MNJO/CB+bKDRbDyHw
 4bd5tWIMpnViOcntw8of0ppPygeWoD84ldIEpe/IKASEjMQC8B7bfZkJd
 NufNL2z/pfZlJSY/JRssGb6KSpIqfVvYtb1LUfVRzpTdX9+G7Ntrg+WlB
 RMoI7R6c20sCT7f752yoNgxaMT4aqx+W4b0E7o959yxFjH5Rp9oNE3nNx g==;
X-CSE-ConnectionGUID: szhS8/3CQ4CiNtWuRAYwMQ==
X-CSE-MsgGUID: 9/qfKyskQQCHDiifKJPqRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="77487364"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="77487364"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 09:52:16 -0800
X-CSE-ConnectionGUID: uXTwLJ2vRqep9Mdm8cfCKw==
X-CSE-MsgGUID: hFQcdZbuRyqhfmzmKiTbhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="227023127"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 09:52:15 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 09:52:14 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 09:52:14 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.39) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 09:52:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kekTtbaprbm9v8wfqiWfSUZGuUWmhGF20lJy3DMuWFs9OwvfgB7EnkcSH8SXHdshVjqux9pHWiESVYMG2L504lHfcO43RB5Dmh5qWw2cbBnQCqYcoySwKMwS3V/h+W9pBBuPh/9fKpiQ5uE1ufFeoyUGzVnonIWPJS6kMNIOLihm7WQnyEfGzAG6mQpiTFqCqNhkOi1gQYvS+Kc3D7DfrLLIocqWXDYf85aB+cJ617b/wadvNpv/6YO7fGnDrLNJR1zi2m7CMukfUMxjJIwQK5pzt/5TfYlV9Z5oFK/dD7KpxllF/Dh8XnX4xGc7IA9b+dtajZfiTiXA1u+2xkH1zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fo3WXVXbWociwa0+Z4h4hdTS2/tsH5q4xxxGH8+i7vY=;
 b=B3esAC0B/FzLmZASHp/fSeoGbYBgMF3dB7U9sj7eAZH7/IM1FYTUFF/cjuORuf4SaPQ3CYQujjq3/vtgq3YtnCgsmK/38jN8oUVtexQzZdeoQdhOYv829Y3VwwzDyy9hcIpF3fKhnCN+hJ7bnPZisCp2WRCJ3GVvu6l3InNeFlckxW5lpEiP67U3MYJIQbq2SA8wfI1b0Hk2sDQpQ3oXdVg98efkiXyzAgOsDrAz/o+47blgtt2h2GTw55AJoJga1Fg97iLmf/IFr4v/J6p3EjGrCvVAYGcOd0wBcbAaD1vS6x7Lh67Mc7q4Ww777/YWi6qBfSX/Slm8qOY6SM6Bdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CY8PR11MB7924.namprd11.prod.outlook.com (2603:10b6:930:7a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 17:52:06 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9388.003; Mon, 8 Dec 2025
 17:52:05 +0000
Message-ID: <1c790980-36d0-43ad-b4b7-573d287df716@intel.com>
Date: Mon, 8 Dec 2025 09:52:04 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] drm/xe/sriov: Add handling for MLRC adverse
 event threshold
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
 <20251206230356.3600292-18-daniele.ceraolospurio@intel.com>
 <ba986347-f542-49f0-a4f5-796e23933969@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <ba986347-f542-49f0-a4f5-796e23933969@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::20) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CY8PR11MB7924:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f3f4e03-9e3e-43c8-db87-08de36828026
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akQ4eUhHRTJvRUE0bkVNajAzdWVONVNEemxWRm9jOW8wVnA1ekpOTHBNa0hr?=
 =?utf-8?B?T0J6MmV3dXVHY1RJclpnczV2ZzU3UlFFaFdWQloxSUtjZkVUTWpzR0RBTWI0?=
 =?utf-8?B?bkxtNGtUcnByNVNBckE0NE1PdXhjc05taUdBZDdZTVY5STd5VThzVHNkZ24y?=
 =?utf-8?B?MW1ZZzdXNlRrdVRLbTgyM1c0TlRPOEdkS0xGVmVPTWJGSkY0R2tvUFp3QkUr?=
 =?utf-8?B?OEFtcldQbzJXVGxFOXAxcVczRWZFNHQrUzJFUlJVb0hpR1U4alY0ZTZBNUh3?=
 =?utf-8?B?VHFCTzc4cmdvck50dFgvZExRMUU5eGZtZldSVERCdExGdzRpNGc3UjNVZlll?=
 =?utf-8?B?Nm1SSXZ1Yk1ranRJajlodSsxc2xlcUZuZFg1c2hOeUZ3VHo3Z3dZSVdsNnBD?=
 =?utf-8?B?cjA0OWpEWGtuQmdadE9XZFQzeGs2UzlVWFc2VktCc1YwN1VzZHhydStwUThu?=
 =?utf-8?B?dDIvM2lyN0Y0NWdTR1pYR2p3QjhXUUprNVZWOVRDNGJvN3RlQU1CV09wYURk?=
 =?utf-8?B?YW5JaHFsellMWExkOXNmcHhIT3hvMDdUU1RUYitweDdSaysyczVrN0lRV2Vv?=
 =?utf-8?B?TXpBY0RLOW5KRWI0TTdrQ3Y3ZzVNc1VYV2lzdkprZVY3TXlPV1lxcmNBbEJV?=
 =?utf-8?B?MFVRWHMyNlpZcnhjL1h2eG9YYjhvZ0pDQ0pSVlZiWGxsdlJFVnpaeHJBM0tx?=
 =?utf-8?B?YnBVbXdSOWxyRjVRMDdnTkFuN003L1JxcHI2OVhFbWg4eTdFYUVjSy8ybUdw?=
 =?utf-8?B?UktYTCtFc2ppMy9nTEZIUjQwVEpDWmpkbWF2UVNJclNHQjY1S3JoVU1vQjlL?=
 =?utf-8?B?OUlpbjVoL200Q3cxK3FtZHFXSWh5RXdXb2JSZi9hVFRwZmJXWDZSbFhxSjhQ?=
 =?utf-8?B?Zmd4cUFscHYycHZiVFpISU9KTWhWZUZJQWlIQmRtdzIvTEcvQTZLRTRQV1ZU?=
 =?utf-8?B?WGlUbVRRN3E0U2JmeW1CSktqa0RjRXIreG9WbkRCYVU1cUdyRTVRdEYyZkl0?=
 =?utf-8?B?NExCYnUva2g5cUZROERMcTNRdkl2RkVmY0dkNERVUVA5bkxjbGI4YkFFU3dt?=
 =?utf-8?B?UEwyY2xsWSs0dndQemxOWHdrZnVMMFdCRitKNXg0dGtGZy9nSnFZMkY4dUpY?=
 =?utf-8?B?cXIzVUtkSjdqUkFJTTVPMXZhRzlSTURGWGV4R21pZ2dQZEtMR0UyaGdNdU8r?=
 =?utf-8?B?NlVTcmgxcDljMG9POFc3OHJuNWMxUlo2Ym9tR0llaXBjcDdXM3o5UWloc3o1?=
 =?utf-8?B?cFN2ZDRjeG92MmNDNHA2b2ZLcVU2cUYycHIwRDNkQjRNMHRPdnorN2x2MWZG?=
 =?utf-8?B?U3FkVU50YXMzSUhuY3dNM0xlOWtVY2NLVlRWRWRKeVpLMHNQSDVsaTkvOUV3?=
 =?utf-8?B?dGt2bnN3dEF1VUhybW9WRHZwak9UWWNyZVlrYmlLc2UrR1NQRmF5ZU9XWkRG?=
 =?utf-8?B?Uk5mNzhmQkdOUEtZNU1ISlRxT2pRd2ZXQlZBZm16c0lwL2pqUStHSDZqR3Fs?=
 =?utf-8?B?Nk1JNWxrODNyOXJ5Lzc4QnMrWHFPOEtYUU1HSUtiaXNudjZBTm5rUGdnWXdT?=
 =?utf-8?B?WGYxTi9VSS8veVVORWkrZ01td09MQnA3aDA4NElQcHp3NU9MZTBIeXlIY3B4?=
 =?utf-8?B?d1UyQTZRODBPVVBBVjdYSHY5cEZsWG9iNk91NGNGR3ltcUVPNzVldVkvZitn?=
 =?utf-8?B?VDh5bHVCd1ZlWUgwQkRBNE1YemtPMzRCc0RLWFdWZWp0aWZaMzJWWC9WMFV1?=
 =?utf-8?B?blV1cEZNUlJSY3pZVUZlYmx1YmxXbU9KdXlRVVRsSUgyQ2k5UDZXRXF2Nm8y?=
 =?utf-8?B?RitWZ1FZaEl5NWtrcFo0cUJCNlVxb0xMWEIycElQRTBuU3d4aWdseG1uY0ZG?=
 =?utf-8?B?OEMyWE1Sb0p6U0VURTdqT1dOWlJqZWlUS01uUUNmaHJFYWZrTFBocW8vR1lI?=
 =?utf-8?Q?pvWuUzNc9Cuss+psBeAheaKhxfeB2WDs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGFWV1M1R2RRNnlTbHpaektiRmVZTHVLU2pXVkNLanZDNk5LS0NmanVOTkRM?=
 =?utf-8?B?dUJEQ3BURzhud2lCeW9wbzlRV1BKanBIQU1RWGN1NFRUNnh3NUM2UkJoanc0?=
 =?utf-8?B?VWtPK0dnZjd0TGNOYWdDbVNNbVBUY0EvZW41QjhrT0Z6b0YxS3hkc3JFQTJL?=
 =?utf-8?B?R0lBYUwraVFPL0RTOThWZ1kzVUdzQml3dVVkUFE1VnkzUDZIWXo0NFNCM1Ja?=
 =?utf-8?B?MHFNQXhWdTRQdVhxOGVtQ3huL3BYS3NmNXRiSklCVEgxbkpNbDN3c29yNm4v?=
 =?utf-8?B?cUlDcjdobW9nSnVtM3orREdrN0N4VXBqMm1ZOWNOMDRMVFRZL0VjU0d0SjJC?=
 =?utf-8?B?d3grZllzby8wcUFYeUt2SFd4WG05OVpFOGJlTytFZi9SMzhPRGIxZDJjbzdu?=
 =?utf-8?B?bitzR3oxK0VoRDNPZE5nYVRtUU5uMjcwc2VIT05vTXZJYjhzUENBdEd1NXd2?=
 =?utf-8?B?L3VBL1ZvYlJxVTB0UUsyamJhLzRXZGdGNCtyMUM4dDcxdEN3Z1ZFZDYyNVFs?=
 =?utf-8?B?cWJPUnpIWkZOS0tVTXdpWlB1Q1RjK1Zhd1VrZko2K1FGOW9ma0ZBMm82Qm0z?=
 =?utf-8?B?ZmNkMllSMTVxWnF3RGFQWnVmREdrUDBjUXlNRTVVcmRjZFpqdHFpZkY0WUFC?=
 =?utf-8?B?N2dIVEVjcUYvYzY4czl3WUZwNDBPMmU2VG5ML1hOaUJmWHVNcEZhbXptMmdn?=
 =?utf-8?B?QXRaOGpWOGFxd1JMM1RFaWVLdXhpd0R1eXErTjF5cFo5MHZlWXVmRUdTMUNY?=
 =?utf-8?B?T1dUWGtwK2ljbkRwVlBONVFacDdjNlRrdGh0OS9TT2F2Wm1tUzVBK0xUSnBu?=
 =?utf-8?B?d3B4MllFbTk0eVVEN2lvZlVsd0hrRThhWTY0b2FaTG1uSzJCcmJzTENJM0RI?=
 =?utf-8?B?TEk4Nzkrc2NnSElJWG0wSjVFaEtXaURYWGdMcDJqVDlmZXJsdU5jVzgwNkNP?=
 =?utf-8?B?QUZVckxBU2t1SXBSeXl3SGZWZEowRDcwWFVCK0Zjb2lxU293MFliWlc3RG5y?=
 =?utf-8?B?OWF5RkRvalU2RlZ0NGtybDQzZ1BVeEdXeHc3bm5qbzJ6U2hiTVExdmtTMitD?=
 =?utf-8?B?Y1VFdHdXN1B1a1JGNmlCZlZFbjFOYnVSN2daeWNxcVlhWGJ0bDJYNWlRMUlO?=
 =?utf-8?B?RGVEaDRIMVExRG9WRUg3RFR4bndyQVV5YWM1c2lpd3Y0dEExRjNJcERTZjVz?=
 =?utf-8?B?OHgveGEzdVNFS00yZEVoRmFWMG9nbjduUGc4WUZJZU5ZNmtha0pVeXZSRGp5?=
 =?utf-8?B?aENkY2gxRlQ1NUdSazRqcHNVaTRTZVRab0c4Mnl0dHZRbm84NDdXQmhEUEF4?=
 =?utf-8?B?aUo0aFJwYitUbU5yeXcyeGVRSUEyM0xiSkZGd1VOL1dFc0FnN3lxYTRtenZT?=
 =?utf-8?B?ckhGMVg3NktzSFNQbU5SRlZqdTJtT0hGUjVqZzMzd2tQNDlhdjVRVEY5QUVF?=
 =?utf-8?B?cHZab0NQT0xrWENJelI3TTViOE5HWUtkWTN6WVRUQ0VnZ3NyWEQyQXRXVSs5?=
 =?utf-8?B?SWxDNnV1U2d4aldUS0I5TWZSNlRtMDNjSzBFdSt0dWU5RnBkNTgwbDJuWU5Q?=
 =?utf-8?B?WW1WczRwOGJuMGtkZzg3YmNxUCtNdExGU0lnRjlvVGJYbXBVN1orbExNQ2Vo?=
 =?utf-8?B?U213NWxqVVYvZE4wd09zSUFXUDhUcXRtQ2NDOWE3eFhxYUlTMkRiWVJDUkgz?=
 =?utf-8?B?M3NnaDFjM1FkOWJvbDhSdncrWE9KYlZNK1lVSEcrQ25hclZCMzZLWXlUd1RC?=
 =?utf-8?B?T1ZaQzJYczRjT21Jb29zMHhEdWR1b2JqZVNlb3lOeWZ5M3Q5VXRWUVI4N2ts?=
 =?utf-8?B?VU80YmNWTFdzZDRJYmJNcStRU0xWQzZMT1k1Wm1zM1luYVQwSlJ6Y284SmFn?=
 =?utf-8?B?UFRYZ0hHR1pNN0orRmUwaW96Vk9URWQ0OWRwa08yZnNqK1FBd1hpd29Sd2tF?=
 =?utf-8?B?RGpFazVGVjl6NzY5a1JlaUFKblM3NFg5RWdyQldWY21ZS0J3L3UxYzdlaTR1?=
 =?utf-8?B?NGhXQnZnOE1DYWFGNC9ZZmVzWnlWZWhGTzVuMEFIS1FTdndwNkM5UU1oUHo0?=
 =?utf-8?B?S010citWS1J1aU1UYitHOHNvRGNwRXlydjR0d2k5MEVHdDRVTnhVdkxNOHRh?=
 =?utf-8?B?SE82aWdabm9zaGRER0RFOWtzcWVxb0UzKzluQ3g0dmcyVEx1S0xWeStjSXN6?=
 =?utf-8?Q?LII73PGTyNpznrB2kTPBTlY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f3f4e03-9e3e-43c8-db87-08de36828026
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 17:52:05.8528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGit0fL5dsfq7YvF8vtwUHPoFUJKwhL1XFQt6LpknD4wqvIFwg3D7bye8ZuxFLEGtkMJqylClPYoqeVA2GWKX0CKtAPa1RiLRYepOPvyXl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7924
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



On 12/7/2025 2:03 PM, Michal Wajdeczko wrote:
>
> On 12/7/2025 12:04 AM, Daniele Ceraolo Spurio wrote:
>> Since it is illegal to register a MLRC context when scheduler groups are
>> enabled, the GuC consider the VF doing so as an adverse event. Like for
>> other adverse event, there is a threshold for how many times the event
>> can happen before the GuC throws an error, which we need to add support
>> for.
>>
>> Since this is the first threshold that we have that has a minimum GuC
>> version requirement, support for checking that has been added to the
>> generic threshold handling. As part of it, some of the version code has
>> been moved to its own file and with the occasion some SRIOV
>> documentation has been added.
>>
>> v2: split from previous patch, add GuC version checking
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  9 +++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 19 ++++++----
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  9 +++--
>>   drivers/gpu/drm/xe/xe_guc.h                   |  7 +---
>>   .../drm/xe/xe_guc_klv_thresholds_set_types.h  | 18 +++++-----
>>   drivers/gpu/drm/xe/xe_guc_version.h           | 36 +++++++++++++++++++
>>   6 files changed, 74 insertions(+), 24 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_version.h
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> index edb0546fb163..30a051a0b4ee 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> @@ -376,6 +376,12 @@ enum  {
>>    *      :1: NORMAL = schedule VF always, irrespective of whether it has work or not
>>    *      :2: HIGH = schedule VF in the next time-slice after current active
>>    *          time-slice completes if it has active work
>> + *
>> + * _`GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT` : 0x8A0D
>> + *      Given that multi-LRC contexts are incompatible with SRIOV scheduler
>> + *      groups and cause the latter to be turned off when registered with the
>> + *      GuC, this config allows the PF to set a threshold for multi-LRC context
>> + *      registrations by VFs to monitor their behavior.
>>    */
>>   
>>   #define GUC_KLV_VF_CFG_GGTT_START_KEY		0x0001
>> @@ -434,6 +440,9 @@ enum  {
>>   #define   GUC_SCHED_PRIORITY_NORMAL		1u
>>   #define   GUC_SCHED_PRIORITY_HIGH		2u
>>   
>> +#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_KEY	0x8a0d
>> +#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_LEN	1u
>> +
>>   /*
>>    * Workaround keys:
>>    */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> index 59c5c6b4d994..dda671d05b89 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> @@ -269,7 +269,8 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config,
>>   }
>>   
>>   /* Return: number of configuration dwords written */
>> -static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool details)
>> +static u32 encode_config(struct xe_gt *gt, u32 *cfg,
>> +			 const struct xe_gt_sriov_config *config, bool details)
>>   {
>>   	u32 n = 0;
>>   
>> @@ -303,9 +304,11 @@ static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool
>>   	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_PREEMPT_TIMEOUT);
>>   	cfg[n++] = config->preempt_timeout;
>>   
>> -#define encode_threshold_config(TAG, ...) ({					\
>> -	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
>> -	cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
>> +#define encode_threshold_config(TAG, NAME, MIN_GUC_VER) ({				\
>> +	if (!MIN_GUC_VER || GUC_FIRMWARE_VER(&gt->uc.guc) >= MIN_GUC_VER) {		\
>> +		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
>> +		cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
>> +	}										\
>>   });
>>   
>>   	MAKE_XE_GUC_KLV_THRESHOLDS_SET(encode_threshold_config);
>> @@ -328,7 +331,7 @@ static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
>>   		return -ENOBUFS;
>>   
>>   	cfg = xe_guc_buf_cpu_ptr(buf);
>> -	num_dwords = encode_config(cfg, config, true);
>> +	num_dwords = encode_config(gt, cfg, config, true);
>>   	xe_gt_assert(gt, num_dwords <= max_cfg_dwords);
>>   
>>   	if (xe_gt_is_media_type(gt)) {
>> @@ -2518,7 +2521,7 @@ ssize_t xe_gt_sriov_pf_config_save(struct xe_gt *gt, unsigned int vfid, void *bu
>>   			ret = -ENOBUFS;
>>   		} else {
>>   			config = pf_pick_vf_config(gt, vfid);
>> -			ret = encode_config(buf, config, false) * sizeof(u32);
>> +			ret = encode_config(gt, buf, config, false) * sizeof(u32);
>>   		}
>>   	}
>>   	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>> @@ -2551,9 +2554,11 @@ static int pf_restore_vf_config_klv(struct xe_gt *gt, unsigned int vfid,
>>   		return pf_provision_preempt_timeout(gt, vfid, value[0]);
>>   
>>   	/* auto-generate case statements */
>> -#define define_threshold_key_to_provision_case(TAG, ...)				\
>> +#define define_threshold_key_to_provision_case(TAG, NAME, MIN_GUC_VER)			\
>>   	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
>>   		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
>> +		if (MIN_GUC_VER && GUC_FIRMWARE_VER(&gt->uc.guc) < MIN_GUC_VER)		\
>> +			return -ENOKEY;							\
>>   		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
>>   			return -EBADMSG;						\
>>   		return pf_provision_threshold(gt, vfid,					\
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> index 0fd863609848..5123ff1fb116 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> @@ -21,6 +21,7 @@
>>   #include "xe_gt_sriov_pf_monitor.h"
>>   #include "xe_gt_sriov_pf_policy.h"
>>   #include "xe_gt_sriov_pf_service.h"
>> +#include "xe_guc.h"
>>   #include "xe_pm.h"
>>   #include "xe_sriov_pf.h"
>>   #include "xe_sriov_pf_provision.h"
>> @@ -301,9 +302,11 @@ static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigne
>>   				   &sched_priority_fops);
>>   
>>   	/* register all threshold attributes */
>> -#define register_threshold_attribute(TAG, NAME, ...) \
>> -	debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent, \
>> -				   &NAME##_fops);
>> +#define register_threshold_attribute(TAG, NAME, MIN_GUC_VER) ({				\
>> +	if (!MIN_GUC_VER || GUC_FIRMWARE_VER(&gt->uc.guc) >= MIN_GUC_VER)		\
>> +		debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent,	\
>> +					   &NAME##_fops);				\
>> +});
>>   	MAKE_XE_GUC_KLV_THRESHOLDS_SET(register_threshold_attribute)
>>   #undef register_threshold_attribute
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>> index fdb08658d05a..9028718189ed 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>> @@ -8,15 +8,10 @@
>>   
>>   #include "xe_gt.h"
>>   #include "xe_guc_types.h"
>> +#include "xe_guc_version.h"
>>   #include "xe_hw_engine_types.h"
>>   #include "xe_macros.h"
>>   
>> -/*
>> - * GuC version number components are defined to be only 8-bit size,
>> - * so converting to a 32bit 8.8.8 integer allows simple (and safe)
>> - * numerical comparisons.
>> - */
>> -#define MAKE_GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
>>   #define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)
> I guess this macro can also be moved

I purposely didn't move this as MAKE_GUC_VER_STRUCT is specific to how 
we code xe_uc_fw_version, while MAKE_GUC_VER is based on what the GuC 
interface define.

>
>>   #define GUC_SUBMIT_VER(guc) \
>>   	MAKE_GUC_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY])
>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>> index 0a028c94756d..f7ed32244c6b 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>> @@ -7,6 +7,7 @@
>>   #define _XE_GUC_KLV_THRESHOLDS_SET_TYPES_H_
>>   
>>   #include "xe_args.h"
>> +#include "xe_guc_version.h"
>>   
>>   /**
>>    * MAKE_XE_GUC_KLV_THRESHOLDS_SET - Generate various GuC thresholds definitions.
>> @@ -23,15 +24,16 @@
>>    * with the &TAG, that corresponds to the GuC threshold KLV key name defined by
>>    * ABI and the associated &NAME, that may be used in code or debugfs/sysfs::
>>    *
>> - *	define(TAG, NAME)
>> + *	define(TAG, NAME, MIN_GUC_VER)
>>    */
>> -#define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)		\
>> -	define(CAT_ERR, cat_error_count)		\
>> -	define(ENGINE_RESET, engine_reset_count)	\
>> -	define(PAGE_FAULT, page_fault_count)		\
>> -	define(H2G_STORM, guc_time_us)			\
>> -	define(IRQ_STORM, irq_time_us)			\
>> -	define(DOORBELL_STORM, doorbell_time_us)	\
>> +#define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)					\
>> +	define(CAT_ERR, cat_error_count, 0)					\
>> +	define(ENGINE_RESET, engine_reset_count, 0)				\
>> +	define(PAGE_FAULT, page_fault_count, 0)					\
>> +	define(H2G_STORM, guc_time_us, 0)					\
>> +	define(IRQ_STORM, irq_time_us, 0)					\
>> +	define(DOORBELL_STORM, doorbell_time_us, 0)				\
>> +	define(MULTI_LRC_COUNT, multi_lrc_count, MAKE_GUC_VER(70, 53, 0))	\
>>   	/* end */
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_guc_version.h b/drivers/gpu/drm/xe/xe_guc_version.h
>> new file mode 100644
> introduction of this new ver.h file is self-contained so maybe it should be in its own patch?

IMO it is simple enough to keep here, to avoid too many small patches in 
the series.

>
>> index 000000000000..e6f80abd2f05
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_version.h
>> @@ -0,0 +1,36 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GUC_VERSION_H_
>> +#define _XE_GUC_VERSION_H_
>> +
>> +/*
> this should be regular kernel-doc
>
>> + * GuC version number components are defined to be only 8-bit size,
>> + * so converting to a 32bit 8.8.8 integer allows simple (and safe)
>> + * numerical comparisons.
>> + */
>> +#define MAKE_GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
>> +
>> +/**
>> + * DOC: SRIOV-changes
> 	DOC: SR-IOV Changes
>
>> + *
>> + * We record SRIOV-specific changes here as those need to be tracked carefully.
>> + *
> what about 1.23.0 (CCS) ?

If you tell me exactly what to write I'll add it in, because I don't 
know the specifics.

>
>> + * GuC 70.53.0 (VF interface 1.26.0):
>> + *
>> + * Added support for EGS. See:
> probably we need extra line here to render correctly
>
>> + *  * GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG
>> + *  * GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT
>> + *
>> + * GuC 70.54.0 (VF interface 1.27.0):
>> + *
>> + * Updated VF migration support. See RESFIX actions
> maybe we can list those actions:
>
> 	* VF2GUC_RESFIX_START
> 	* VF2GUC_RESFIX_DONE

Those don't seem to yet be in the driver. Should I list them anyway?

Daniele

>> + *
>> + * GuC 70.55.1 (VF interface 1.28.1):
>> + *
>> + * Fixes for EGS.
>> + */
>> +
>> +#endif

