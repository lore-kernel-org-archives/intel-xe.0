Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65219C61DB2
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 05:16:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10BEC10E1AA;
	Fri, 13 Jun 2025 05:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O7MnoUfl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4450310E1AA
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 05:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749791781; x=1781327781;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vl+pnBKq08FsArYgc+Ua4hy0IAdoesb7p7ZDJjV/epc=;
 b=O7MnoUflQ8/A1JMSTzMq4tZrltPAO4cTXYQ4z4MKGT0qFlF/BDSmRNd7
 vSUO3eIEmWoZ7UNZlb7yvF4aN0Qo7J9ISVxCSLLyeMnVhTHsrJvYJkcKK
 1oCqtvZ4C90dEdGUhPxZ4d7+m+L0oxamwGhkwZHiwyyaJnKoWinPFywLs
 BkpwiifeLL9ioB6izWITZAd0sU1Qnp2QVotHTkquzo1yvcYjleJhDKDCp
 ftpJL3N5h4j1msy/R8U9gwts1rA16/tWHow+ipPxlOVTjpNSISYqf0pT1
 y45TuIvNvVbIBxXxWtIp3hheYFSJsDXGVzooPtesiTraV4WKtNmJyUN1A g==;
X-CSE-ConnectionGUID: 7fztjiaZSruGwjEgDctHCg==
X-CSE-MsgGUID: jHqh740BTiiZ41NOX/mMSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="74530472"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="74530472"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 22:16:21 -0700
X-CSE-ConnectionGUID: cxMQq9DXSPyyWJBO6wrloQ==
X-CSE-MsgGUID: jWc+F6EnTw+M8ON11/lhkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="152494948"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 22:16:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 22:16:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 22:16:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.81)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 22:16:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IAIpHtsfiQDyYjP/GrRLjlIiYVDz/UnDYTyMVjdE0/UCqgjRpSf5B6GRQvZ31k8czIuIJ9eax0qTd5bPZNljSrMnIG0JVevr5/0tLszr3Ehw6booJ/DtPXkBbi1dv6IMPnRXvQSFQjjc/Z/5WU+pBB7uQHJ+7p7U3ZPo49dWRZgyooKtgcmFscYlRIJYeu2qs8vHaPrOKb9n2SrjFuPCI7xU2YzHJOJbLxuLZhYxBDvCpfhPOksgj/1FZenp74/C3O/BtWviAqAD2cWP/Wgi30rhZNoUw7rFxhF9mYcTjv42Lexs6u1kXi4bUr+GXZ1JJjTfkCmosx8S8D047XXnTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkkWfpVtYBnjSXv51ldOv5pAOwYGZsM7k8GZSjjOZ3M=;
 b=brRp644cFPDqp5ILi3DhD+XbWku+Yv4CZFRK/00a/WAGkbGaRyS3vz0vtzoGC3DKUHdpnNNoI89WoDGYQldHdUp9dY9XyyZJRrA2JNaUWFeBsJzeYE8yDlrj1y2rMF3NGFlG2YpWmRZF4VCeLXBKpyluAyGolt9hevQIAvZdd0XOJSUKPR1+5JcgBOBaatZB7JkZwsgpKZgrFXD9Jr+rQntMhh3oHO2wAusBZ/6oFmQbryu5hTl1MG3R+wHbnIsRkOSbRYPKrURMAn501JSoSUdo1n9/6w1AjR/YlxB/qqe/NmpCGs81Q1G5UQSQ7+p+5/O7i3piLbjI3m0DWub4KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by MN2PR11MB4615.namprd11.prod.outlook.com
 (2603:10b6:208:263::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 13 Jun
 2025 05:16:03 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 05:16:02 +0000
Message-ID: <6b68b367-7aaa-45c1-8ca4-0d3a2e025bad@intel.com>
Date: Fri, 13 Jun 2025 10:45:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Opportunistically skip TLB invalidaion on unbind
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <francois.dugast@intel.com>, <thomas.hellstrom@linux.intel.com>
References: <20250613043645.255351-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250613043645.255351-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::20) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|MN2PR11MB4615:EE_
X-MS-Office365-Filtering-Correlation-Id: 28179e41-69cd-4831-13d6-08ddaa396419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SndLUGRXSTBxSjAzWWNyZTlUK2ZPQXZteTN6QkJ1ZFBVU1VQMVU5dE4yTVNx?=
 =?utf-8?B?K1hzM1RFMkRKa3lud2ZteGx4OG5TeWZxYXc4YTNmU0J4UC9lUXhSeExXTlMy?=
 =?utf-8?B?K1prbHdnbXBPVFdweTFDT2hLaGtDaXdTWmRSUEJoRzZXaHRHSVdUNFdxY1Yz?=
 =?utf-8?B?dk4xMWNpamFLTXVEMGdOMlg4anhMNUdwRlRQRVFRZnpDcVNHczhzWEgxTnVa?=
 =?utf-8?B?V3lSZFR1TWhxSXJPdXAyR202a21pdWFYMjg3OXE5UXg4RmRxc1E4Y2xIaDVY?=
 =?utf-8?B?b1ExU0JvTGVxdW1jMlprWTZJRGVoWDhwMzlDNHUyVTNTeEtUcFJEMmpUello?=
 =?utf-8?B?RGFDalBUQk9wYVVFd1ZhamRlbEJIaWs1S1N3a0tnWXBpVWw3QWNhUG55dG1i?=
 =?utf-8?B?enFPOFp3SlVpVFpHVWdSQ085NFFCamlQSEUvTU9VejJZRHZxSHFYVXJMcTBo?=
 =?utf-8?B?YjhiWjdWTzBIeUtJVEJLTWxxaXdueHVaUFd4L0xwWnRsL3FTV3ZQbm5ycGdQ?=
 =?utf-8?B?dWdNMWYwa0pveGJITWs5Rks2bzZDbVN2WEhQUW9VYklTWExmaHBCTUZobk8v?=
 =?utf-8?B?WFIrTXF1OHdCK2REWmdjdXhSYlNTa0NxT2NLZXRXNHlCcGk4MjJUQk1ORUpC?=
 =?utf-8?B?S2VVZUZpVXNqSC9Xb1Z2b2xIZDJ5YkR5NTJUUm9aQTMvV2hJWTluT2R0Uzc3?=
 =?utf-8?B?ZVN0NGFjV1RITW1lRSs3MXNQU2hCTFAxOG4wQSs3VDhDQnhpdXhTcGxKTVo5?=
 =?utf-8?B?V3dFVm9zc1F6M2IrN21SSUdOVlVGSjRLdE0wdHhubWVpL3p3VWRYUXM2eW1S?=
 =?utf-8?B?U3ZtS3F0ditMSkRBaHdzOW5zRDN4eHlYNnduTzlucEVsUjFlSFBETlhqbThH?=
 =?utf-8?B?cUJobDZ1dTN2YWVzTVZVY1JVRXM3VWVKZWUzSnRZTmZ5ZzU1Tklmb3dkb0U3?=
 =?utf-8?B?TUNXMW95ZXA4VjN2bzdmWGVjZDVrUkZGeWZVWm1EelZsRVRPbnhTTDg2KzRi?=
 =?utf-8?B?RFNoNlBIeS9kM2ZxL2hUdzRzNHhHdmowV3A3SW05SlpwKy9HUU52YklRak5B?=
 =?utf-8?B?SVU5Zzc5YlRsekVYRU96OC9od1pZRlMySk1haE5CQ2trZHF4UWRHMHduY1hx?=
 =?utf-8?B?c0ozNWlEa0lzS0dYbHVaNnBkUG9FVnN1SlByemg2bnBJOFVwWEJYTFdxdWZ1?=
 =?utf-8?B?bmVtcitaOUd0ZFhYdG5jbyttaG5veWo1b0ZHMXhDL3V4c0ZTUGtWem9PaXFP?=
 =?utf-8?B?WWR0MWtleGI2Mm1pRXJhazZGSkw2YVVNZnN0cDhiZm81andqUk5pVkd6YWZH?=
 =?utf-8?B?dTlaZ3VTaVRLRW1IT1RwMGtXZVlXL0IrRlpIMWlwWUVCVGZoUlI1QnJ0Myt0?=
 =?utf-8?B?RHQ2U0lQTEQrUHdVN1ZuNFRMdDlhQnBUdFFVVnhhSWorQWdqSk5DbzRLRVVu?=
 =?utf-8?B?UWEwc2hySGtsK3FuVk5hS2VJNzZyZkRlT2hSZWcvSmN6Nk1JSlJmcjdlODJu?=
 =?utf-8?B?LzFqWFdjcnpRQXJmaEJuaE1oaFJ4OXcvUVJyQVY2ZzVtaVZ6WE04b2h2YlpU?=
 =?utf-8?B?Z2hMQ2xnTG5Fd1BsbzFNUTJ6UkQwYjVJZDZNZDg5OUtQZ0oyQ1RVWkV1ZGlO?=
 =?utf-8?B?VEFrTlV6dGkyY0Z4c0lRMGRDcmpKOTV6VWFTcjFzQmN1VjMyenprTmZJNHVI?=
 =?utf-8?B?ajR5OUp5NE0zWC9UaTdpTjRuUDNlRExqSEY4SjVsU0dtaE1GckI5ZU00a0Vz?=
 =?utf-8?B?TDlZSlFBZmxCVjRVS0NJYndxN2U4MGFwQStJZDhXaXNUZEZScHBRaml1UElr?=
 =?utf-8?B?NXVCQXljUkx1TktxYU1Gb1dYVTlMalB2ZllLWEFsM2tvVVZZd2t0OHNUNERr?=
 =?utf-8?B?NXYyVUlQS3RINDFYZ2VqWjZQTmx1dXVVc09GcHVaR2RmZlBRL3pIVWxZRDVT?=
 =?utf-8?Q?lMl6dL7NgGE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmF1dGhoY0NoRHZpRmdWcEEwWHFucEpIUkE4SlBQenIxZW05aExWUjN4alZq?=
 =?utf-8?B?ZGhFTDN6cThNbGJuUDZCb09iSFd5TTJjU1c5MFo2UUJEYUdSVmR0U3BlNE85?=
 =?utf-8?B?dkFWR3d5WUY0dEtRMkV6Rkk1MFVCdVhYdTYxYTJhMk5EaHZMbVBGZFdkdUVn?=
 =?utf-8?B?azhLTWw5VzR3UFZXekNEdnYwMUp5MVdad0dkTTNLL2pqZlUzcWlDdEt2d092?=
 =?utf-8?B?SENRRUMvM0FCeGpnSnpyNFlkTGdXc2VHeHRyWUYyeExjcmx2cGtSb3RqeHF3?=
 =?utf-8?B?N1NWWC9SUVk5TDdzWURsbkRiOGpzei9Wc2NtVU15eUt5anJpQnlUdkI0SnlQ?=
 =?utf-8?B?MGhoQ3crV2xSdXNBTWFURThMcmlWY1NGemV6c29CeHR0TXhLaHEzSE5YVzRC?=
 =?utf-8?B?WmlWaWI4MFJGZE5GVTZ3Q2o3SCtFSnlHUStmT0NnWGpPd05Rb2tDcGNIbkNO?=
 =?utf-8?B?N3l0TzFJVzZ5VFowYjhyb0wyaEFZUGlEMVo5MzdDdU1ob3d4T2lPeGMyUHBl?=
 =?utf-8?B?aXBjNnJ1MllpUEJHY0tvd0lLSXlHeTNaS3NMMXh1ZWF5c1dLbUkyaWVubkZI?=
 =?utf-8?B?V2thMXBDb0cxQUoyajFieTA2TTU1WkdUc2pPMUtEMmYzQmVUbnpPc0NBZmti?=
 =?utf-8?B?dXhmbTlnajQ2Kzc3cmFGTHQzNjQ3VE01Mk1GaVgzRU9Qem1MTlFyeUVjVFRs?=
 =?utf-8?B?OXNrL0NEbE44VmdaandRditRczZVdmtqLzZpVGdyVHYrNVlweEpvU2VUSFo2?=
 =?utf-8?B?UGgrSFYrVERKYXNnUzFLd0xIci8ybVE4ckVkZTdnZ1RxZUR3VkNGdXlFbTlN?=
 =?utf-8?B?d1hDZU1HNTR0Z1JXUXJ5M2REbUxRQXJoOXE3V1J3enBqRjhpakZvSVVCS04x?=
 =?utf-8?B?cXcrWHJGNVBKOEhVMDJWTm5PS0JKajJqOFRZbGZrYm9lWXZuL2p1OUFtSVhw?=
 =?utf-8?B?ZTZpeDdNeGdVVEgvaUMxak5UVG5kd2V1MnVldDFyU0Z2Wko0VjBqQmtqOFRL?=
 =?utf-8?B?TS9HVDVNMzJUalZ1VGtKS0F2WHBwT0ZrYUdKSGNoOFRiT3UzK0lFYnA0OTZq?=
 =?utf-8?B?VUJraVNqVHphbHVDYm9odkxCbGZyMk5YTWdGME1xMWtLMkYwNSs1TmFmc1ZQ?=
 =?utf-8?B?Wk8wWkI5cTBoc2drZ2xnSEpqWjFIeEhZUnJ0UEpBQitTQVlJOTJxOWVDS1FF?=
 =?utf-8?B?Q3NvZnNOVWh1MzFYblBTYytKK1NKYU5VallUTHhqSU9aSlA5VHFETStFN3dO?=
 =?utf-8?B?SWNCcldCQWNTWXNGV09Dc2d4UGI0Y3NhVWp0NDFsNVVTYlVBUkV2ejFpOUZN?=
 =?utf-8?B?VW8ycmtib3VwWGtNL21VMm5qaUxsaEdFOC9pL0E1eXNnTjJZNlV5cXVNQkZT?=
 =?utf-8?B?OFhvdGRKdVkvU1ZTNlo4SVVEdDlGNzBqMFdYbEoyLytIQS9DeWtvWHowK2Jx?=
 =?utf-8?B?NWhkVU9jaEo0WHJ4RUltcSt0cUp6dzlpTWtsMFllckVJcXFIeU50OEJEMitU?=
 =?utf-8?B?Q1FWUEROSlBPVjJ3ajlKSy9IMG1sRDZzNmFjMFoySVVHZS8xQVlCNUdGOW91?=
 =?utf-8?B?Sk1NNFBmbThGZnRYb1Q2ZzhWTHRJVnROd2oxQ09RSXQyYnpsVkd0Q3REQTZ0?=
 =?utf-8?B?MEhyN2VqYjRsSklwWFBZSzJsd2lneGpTVGE3bkZ6aXBRN1NDc3dPVkFlTWxq?=
 =?utf-8?B?a0RvemxsWnNoR25tUTZaNjdQYjdKcHNtcTJMMU9SZ0syME9vYmhDKzMvLzdt?=
 =?utf-8?B?eE5vOHI2Wklxb1hvSFg1RHVJdmpoSENkbmdPSmpDbmhTekUxTXVsSTk3SXhI?=
 =?utf-8?B?dXpSTVd1YkZvbDJ0eXdRVGhSRWJLWm1kU1FXZGUySWw4RTZ3LytaTkxFRTYy?=
 =?utf-8?B?Wnh4V3BodkdPd05GUkpENm5uVlF0em1BZG9OMUFMN0w2R0d2MFZEdmc0amNi?=
 =?utf-8?B?VU5Ha3NPWDJSQTl5VXdwMDVhMW5jS1gvdGNDSGp2MENQYUFCSHlmNmFqSlcz?=
 =?utf-8?B?NjQ5bWIxeDh3QnBLVEM0K2xBV3F1QnV4aDJja09tWjF1Y2lhN1kzY1B0T3kx?=
 =?utf-8?B?OGJiSFBRQUFqSjBvRjlRVHNwR2dJRFhXWFZwUUQ4cjNmVVZYd1MvQW5vVGt1?=
 =?utf-8?B?UVYzWXM4bGw4ZzRtVVBQUVFsNklCMDkyaVlxOFhuSU5zb3RJM3pIcmR1S3FH?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28179e41-69cd-4831-13d6-08ddaa396419
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 05:16:02.8977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OnfNojDAHx3XVoNVnDG3Fm4c5B1T5YI6dBPP3pt0tZTUFaTIYcmqVtH+jmiRVOoKZrRsj3fClVbNeYZ0TEcKVrI1TPXlZSUb3N7pAPrECa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4615
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



On 13-06-2025 10:06, Matthew Brost wrote:
> If a range or VMA is invalidated and scratched page is disabled, there
> is no reason to issue a TLB invalidation on unbind, skip TLB
> innvalidation is this condition is true. This is an opportunistic check
> as it is done without the notifier lock, thus it possible for the range
> or VMA to be invalidated after this check is performed.
> 
> This should improve performance of the SVM garbage collector, for
> example, xe_exec_system_allocator --r many-stride-new-prefetch, went
> ~20s to ~9.5s on a BMG.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pt.c  | 18 ++++++++++++++++--
>   drivers/gpu/drm/xe/xe_svm.c |  5 ++++-
>   drivers/gpu/drm/xe/xe_vm.c  |  5 ++++-
>   3 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index f39d5cc9f411..09c3ccc81cca 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1988,7 +1988,14 @@ static int unbind_op_prepare(struct xe_tile *tile,
>   					 xe_vma_end(vma));
>   	++pt_update_ops->current_op;
>   	pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
> -	pt_update_ops->needs_invalidation = true;
> +
> +	/*
> +	 * Opportunistically supressing invalidation, READ_ONCE pairs with
> +	 * WRITE_ONCE in MMU notifier or BO move
> +	 */
> +	pt_update_ops->needs_invalidation |= xe_vm_has_scratch(xe_vma_vm(vma)) ||
> +		((vma->tile_present & BIT(tile->id)) &
> +		 ~READ_ONCE(vma->tile_invalidated));
>   
>   	xe_pt_commit_prepare_unbind(vma, pt_op->entries, pt_op->num_entries);
>   
> @@ -2023,7 +2030,14 @@ static int unbind_range_prepare(struct xe_vm *vm,
>   					 range->base.itree.last + 1);
>   	++pt_update_ops->current_op;
>   	pt_update_ops->needs_svm_lock = true;
> -	pt_update_ops->needs_invalidation = true;
> +
> +	/*
> +	 * Opportunistically supressing invalidation, READ_ONCE pairs with
> +	 * WRITE_ONCE in SVM MMU notifier
> +	 */
> +	pt_update_ops->needs_invalidation |= xe_vm_has_scratch(vm) ||
> +		((range->tile_present & BIT(tile->id)) &
> +		 ~READ_ONCE(range->tile_invalidated));
>   
>   	xe_pt_commit_prepare_unbind(XE_INVALID_VMA, pt_op->entries,
>   				    pt_op->num_entries);
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 13abc6049041..5e5bf47293ad 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -141,7 +141,10 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
>   	for_each_tile(tile, xe, id)
>   		if (xe_pt_zap_ptes_range(tile, vm, range)) {
>   			tile_mask |= BIT(id);
> -			/* Pairs with READ_ONCE in xe_svm_range_is_valid */
> +			/*
> +			 * Pairs with READ_ONCE in xe_svm_range_is_valid or PT
> +			 * code to suppress invalidation on unbind
> +			 */
>   			WRITE_ONCE(range->tile_invalidated,
>   				   range->tile_invalidated | BIT(id));
>   		}
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d18807b92b18..b296ac37347b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3924,7 +3924,10 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>   	for (id = 0; id < fence_id; ++id)
>   		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
>   
> -	/* WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c */
> +	/*
> +	 * WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c or PT code to
> +	 * suppress invalidation on unbind
> +	 */

LGTM.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>> 
WRITE_ONCE(vma->tile_invalidated, vma->tile_mask);
>   
>   	return ret;

