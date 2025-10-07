Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D6CCCA470
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 16:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C978810E2AA;
	Tue,  7 Oct 2025 16:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tj5Ol7Ft";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846C410E2AA
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 16:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759855513; x=1791391513;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jfqcpkLyEbeWf3ZHP7NCaDv4OhFBLnlLlAS+ykCsBV8=;
 b=Tj5Ol7FtAzxX+1ZVIO229Dz82+16xhyGns+fwPM0nD4w4O3W/AI0T6z3
 1le7XBSbRb4MBfziv0LKXfP6pLnIoxUXPghimqOmN47FL/Rb01HAmmXUm
 xZXepHq8aKAh7qkoWltW+6BLJ59O8XXM9LYpF8G9WiJdEQMkA6GhR4F7I
 im0G/8B8FgKamKrcrODIjeWeWvnNlAMDPKfGgR/VDvX3ml8STPx2EjkfN
 ojmSFQ7JteUVVzFawN0hSyevL98Ezeve/9dgAFZnYF0Rd4/6f9J6cyXMR
 g6R/7twwzIhDFloyamGxqY6ocpdJaby/4GHc+f7f2lOsvq0yAUZsjlsgU A==;
X-CSE-ConnectionGUID: X1FDSNOrR3akwUSBkSoyWA==
X-CSE-MsgGUID: PIfyzz7cTvmhxW8PenhaQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="62077605"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="62077605"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 09:45:12 -0700
X-CSE-ConnectionGUID: 4lRuEt+YSQWeQ7qkILvOCA==
X-CSE-MsgGUID: KHvLtnmTRyS+wTTOwwelMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="184470966"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 09:45:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 09:45:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 09:45:10 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.20) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 09:45:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MaW6DzxG09IuG1clRpXiPYUXChuVLYGjrtSPRL6YK6+CmRI/PbfAml1Hm6jWQKLhY8IEvg03LCkUP9GuE445nAfiptvsc+ltEhEguhry0tHDHLCxtZUQcGq0ZkNJ3zXN3WDIBD7AJ6HoJd9TovBAWtO17w5Q+ny0aomxfsS7DA3JH4rnCoq3QqIRxzEK5cwjBn3+um57khcKRTODZpp88lY1M2UqzOB8f9345YhjL0m4jDfUe2R0MChJ6priuBnMePdIkljLhsMka3+DAvmmWo/zdQPneKWVr9PPGu3VXqqSG8DVWC+7UG09BDU0uWog9bHqVyR8XtSQiVTu2CA6yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ygZlwrgcCF+rPwDpkohED/9R2OUP8mS8P9SMa4qP4Q=;
 b=S5L/BOCKhcGE8RyVOPnWagsAt6sZuhJaM/ApbEq/x4TFZ5vGiM/rahDoB08W3lM4hcagizy56zOLyJ8nLZy+DpBM/NbD+Bgv7dBRbk2j0lRWLJQW0acZv0ATQ8mXUEBtAQWwiv+kXQYghbYeBllVSXha/FqhaHgLvBOydIMVs9Va/SH5c9XeK2aucyZFGZfmayjuQV3EP9Z9BnSe0TuO7Q6roq0JJfvOgrBuWGe8Sx4Bz1OpCaNidqOiGpPXi/iLmAKHxrGqk1RirlkzvFTl5XzW6kQ33TqyyNWK9GUWVjdRtk1Jzb+rSNukTx8jTwudgP5RgjkgEhRK+ls/iyhMOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SN7PR11MB7420.namprd11.prod.outlook.com (2603:10b6:806:328::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 16:45:03 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 16:45:03 +0000
Message-ID: <b8f3e9b3-5665-418b-ad21-eac33886ebce@intel.com>
Date: Tue, 7 Oct 2025 12:44:59 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/xe/guc: Add prefix to guc log buffer macros
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
References: <20251002150302.99524-1-zhanjun.dong@intel.com>
 <20251002150302.99524-2-zhanjun.dong@intel.com>
 <pfqh62crf6qveer36aofmwom2zh7ihvqezaedmnsvb3lof7rjk@rnkpsetbrsb6>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <pfqh62crf6qveer36aofmwom2zh7ihvqezaedmnsvb3lof7rjk@rnkpsetbrsb6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0143.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::28) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SN7PR11MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: a5ff10f7-aa0f-4f18-fe84-08de05c0dcc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVc3QnY4dm9wOG1XWnZzaHFET0VESjdFR29vcHM2UVRIUHUxbERDOEVJSUt2?=
 =?utf-8?B?dVd1b3o1SFpzek5HUTR6S2NTbjV5ckozTUhkdjV1Z2tXNWlFN2xzdHZWOWsr?=
 =?utf-8?B?WFp2Sk9NWUQzZWhDT1dwOVZnc3ZkUWpQYUY4MkplYVp5cVhZVEY4SGZ6MHZR?=
 =?utf-8?B?QmtVM21qSzVCSW9mbjExVVBOL29MOEV5WnNweGFCUUJNeFl0YWdzV0dnY0tZ?=
 =?utf-8?B?RXNSdGgvcTc2OVc1Ni9OcGJUVndiSVkrWG14N2pEMDdldHpVejMvSEtjekNR?=
 =?utf-8?B?bU11K1VLN0gyWm54VmI5UzRKbFdFMGZ5bHNoNXBBTVIzckk5K1BCbUwvZW9X?=
 =?utf-8?B?bWRIZzZjZ1c3VGcwekw4blhaWnFrN2w2Q3ZocU1adjd4VkFlbkF3b0VUK2FD?=
 =?utf-8?B?OEtFdzZLZHR1aWpTYkdiWFpIMHloa0ZqaWJVVnpvbGR3RzVmRXFjdVZ1Nzgv?=
 =?utf-8?B?MS9WWnNuMzQveS9tTWRNcm5EaUdZTU15akRxdUJ3anMyWTltRXBZeUg4UDF2?=
 =?utf-8?B?aDZrY25VK0pCbGhBdnN2SUE4UGo5MDJaYkIxN2tkcEN2TnBsR3VDejdBTlVP?=
 =?utf-8?B?K200RXhwcmdWSjRNWmxHYlB6dDN5V1pUOVh5Z1Rkd2dTQXlnWm9NS3lWM0xn?=
 =?utf-8?B?ckg5UTlTQ3kwSE5VQmVIRlVQMW5XZUM0NDdLUjNITmNSVklnYlBnQUdEdjQ1?=
 =?utf-8?B?cUkzdEdMSkZQTGlaUVYxRjZrelY5NmZnL25wWlVELzFQUEZKMjJDMU9DMG1y?=
 =?utf-8?B?N0lXeUF0dDNVWnl4Qm81UFFzNEd4TGc2MW82Qy9GZjl1Q2RDZFJPUkRFcWN4?=
 =?utf-8?B?Slg2R1Q0RHZpY0ZkblBjRFJ2WEQ3aWJQcHNaTFB6amxtOVB4VTVLTHo2eUh0?=
 =?utf-8?B?SXFJOUZjbDB1Uk4rbVp3aGNnck1sVFluSjJsMWtnU2h0Nkw4K1I2VWdlalp3?=
 =?utf-8?B?NGV4Njc2eFRkK3hUWDVDdlpkUHNJN0RmY3crZTJPeDIxK0E5QzUyM3BIS3k5?=
 =?utf-8?B?UW5TZldFMDV4NjVrSU0ySkxBYVpsdFVtVEFzWTJtdlR6NStvV0N4b0Jkc3VO?=
 =?utf-8?B?T0hUdFY3UHl1cW9DVVB1WEVBamE2ODk0Y3JKZkpJQ2lDWlBuenZjbTh0MmF1?=
 =?utf-8?B?dlMybFp4TDdSR2lCOWlLL3NPSlJOY0V4eXpMUDJseVVsdEhDcGQ2TW1oS3ph?=
 =?utf-8?B?VEtGamRZMmlBd1BlUzFKVUZWa3lIbnU1VU4xZ0ZWN0pjRG85TjlVckNYY0dV?=
 =?utf-8?B?SnNDRXVHTkh6TXFyRGFpemJMK29zbnlLUjVWM29xT25IVkJHeEpqOVV6bDZu?=
 =?utf-8?B?TGFKQWpUenBXWlplSCt5clZ2Y3hrS2JTZFpzMnY5R29mWURLWm9jNnpQRGRG?=
 =?utf-8?B?V24zOXQzSUVpU1VJRTk5Y2hkdGU0aGRsTlgySmo4dGtYV3ZWMEZmcmxqOWs3?=
 =?utf-8?B?ZVBKMXNYZTBvLzZhVVA2KzMrVk9vRE1DRlhTdHBUb1RGTnZnS0VUNWpIaFp1?=
 =?utf-8?B?WFpSMkQrbG0wam9tRGNiRjdlRVJCanRINStNTzR6WUFLS2pGV2R3Q1lTYjhx?=
 =?utf-8?B?eHQzZDFrcFQ1ZUtNcGI5Wm5DNFhuSnpXeitPQmhzSG84RGRCRHlmSUE5VGtX?=
 =?utf-8?B?MGR0cDRza0E5Yyt5ZUZYUjAyM2w2QVpIcnYyY1VjcjUrMnNPelhQeFZzODFp?=
 =?utf-8?B?MVlHVjRLaU4xcjNZMjM2RCtCSWlESUcyZzBqVG1OSFdCaDVCZ1J1czhpWWRn?=
 =?utf-8?B?L0R4bGJNRmZsb2h3R2twWlJyekRYcTAwYzJxQ2dyVlV4enJiZDkyc3pTNSt2?=
 =?utf-8?B?TWtpKzZudGV0QktOUi9CeVNSeDdoVUdmcmxXY1o5UGRMNmN1c0lZS3ptNTAw?=
 =?utf-8?B?dE1mcFpVVEVocFVZcUpnWGkrRjB1YXNxUHJQNmxHQmJRN2wzT3hDdnVib1Az?=
 =?utf-8?Q?7U+3cELRtNMETvxEAiRl3WG33so+JqOy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0wzajcrYmN2bnFCMmNDSVRSbStITEhoR1I3R0pyNnVTbEdQWTV2THNiWG5k?=
 =?utf-8?B?TW50QWIzMGxqOHo0SHR3Z0dteXp3K0RFV3I1MThUNVlPdWo3dXBORHlkbzY2?=
 =?utf-8?B?VVgyS1RSL0RIS2Njdk11MFhDZEVmUWxTWXZ3VGkxV1pPdlpJWDloQldoWEdZ?=
 =?utf-8?B?SXUvQkkrZklCS21UcTRjTGczcWt1dWNOUXNFdVZqRjR4SkluWnlNNlBSamdH?=
 =?utf-8?B?OEgzdW96U2NrdXlGbi9VVmEyVVhIcFRkak9WQUw2WDcyRktDeWg1eStycUZt?=
 =?utf-8?B?TjR1YjdDaUluYThvN201bFVoN0dBdkFtaGZZVVFWKzgxeUdMTzMrdkd6enVT?=
 =?utf-8?B?UGdQRFRuZVArTTdWM1dzNWRIbEdHQ2kvOVE4ZkxPWmhkdEdhS3ovQ094OG9i?=
 =?utf-8?B?ZlExeTVZT3hLNEl6SmFlSVNDL0tWYU0xelhmMGtnNExVY1ZmeWFiUTR3T1kz?=
 =?utf-8?B?cDBmcnJ2U0tuY292Q3NXY2lUWVAwZ094d3E4dXF6eDFTK3l6cHA1RE1kajJz?=
 =?utf-8?B?RXhIbVNta1dRYWh6akFPdFcxMHl1OFlyYUc2UnF1SDg4aVQ1SVhQZXFLd0dk?=
 =?utf-8?B?Vmc5NFl2dW5NZVIxM1JoTVpNRTNzRm5SUUtoS091QXc1dVA5Nk8rU29yRkZP?=
 =?utf-8?B?K3RpTmlkbmVBVHFMM3k0NzlxZitMTVlONEM2SkdQbmtIWXYyclNRNUpSVUQ2?=
 =?utf-8?B?MHB1SUJKc3NrUmVqb0ZTbWVJaDFqYzMzRlc2V0xHMjhmMVdMeUFnU09zTmMv?=
 =?utf-8?B?REFjMVc5aVcyZmNMV0NtQTBrUmpscXdCRXJGRjIyZHhOcTR5RjFXQ3VuTGYx?=
 =?utf-8?B?TVFaZUtxeE5qSFM1a09namhETlBOWkxkcTViU0VEWnljVHhsZVdHQVAyWHhz?=
 =?utf-8?B?R2p5M1pNWWt6Zmh5L1dxM0ZXb0lrdjl6bk5lL0cwZGxiTE5DQ0F1NHRaL3Bh?=
 =?utf-8?B?TVU4bU9yNTh0S0FrcWQ5c0xVcktsU2hCUnlHT1FpSWRkYVRtZjk5R2l5aWtr?=
 =?utf-8?B?T0tlZHdqQVh5WWZMc09XN2hoc3g4bmpKVzRLZUhnSk5XYTNYYllVY1ZwVERY?=
 =?utf-8?B?SjdLa0s4S3l3WFdSVGE0b1MvNTl3dWVQNUxWM2lYSGM5Q0lQNFhNa3FWS0tV?=
 =?utf-8?B?MWVHMWZKZFVicUNST1JrRGlxL0JiSW1VbllTQXZFeEJ5UDB2TUw1M0g3dGJj?=
 =?utf-8?B?OGlaWXlmeUhQMVduQ3dHbk9OSUNEeHEwblJzYXl1UGJvanN2cEVnUHNwRFY5?=
 =?utf-8?B?MWtoRm9FWm9qYU9JbWhLZFRwYndNOVhGRVdTdGc2MmFzRWtVVXNNNUI0MWhp?=
 =?utf-8?B?alRlQ3pDckZGS2FsdndDRTRia2RvVS90TEVjb3BQMUJYTG93VWtQTXM0NFQ5?=
 =?utf-8?B?YW92bUppelBDbDVGNWdNTjA0S3NpYSswWklQMUdFTnBsQ2E5Y2FuSHBRQ0Iz?=
 =?utf-8?B?U2RHSG83VmxXWHNRRUg0Q2pnZ3NIeXJmZitmNWw0T2dhdzlkMklrNGMyY0lm?=
 =?utf-8?B?OEp1ZmcvTDlKaTE0eVUyYThjL3kvTHA2disyTGRmYmV3aHE5cVRadjhkQ1FJ?=
 =?utf-8?B?TzdBbk4wK2l0RVJPS3JjUDFUek5oaHlkWFpCRWFwRUNPcEJGNFE1Q1lrbEpl?=
 =?utf-8?B?MXdTTjdad3I4K3ozZVcyTkQvUnltbDhTdGhpYnVNUlM3OGVUaFlJaCt1Y2pK?=
 =?utf-8?B?N1pxTVEzdTBBTDR5TnpoQXgyMXVSZWZEcWpZbW0zZitGWnVpajBQaXB5MWJS?=
 =?utf-8?B?QWwvMDJ6NnRLOTFBQUZaK1NiaW9yK3Frd2RDS3ltdEwrL1E3RU1ZTGtRTS9P?=
 =?utf-8?B?K3VndFRYd01MV09ORmhhRVl2c0FuYVpXUHpWRUIwbnVXVHVjVW5RcDd1b1lx?=
 =?utf-8?B?cFgyelNwU014SnRoaWRMc05INUtVVHJpTjArUHhEMDNRREk0d3lxc1B0Wkdj?=
 =?utf-8?B?cW51ejhuSXJVeDRJQTAxa01iR29RZWQxbjZwVmRxTjgrNm8xSXBTY2hScjhk?=
 =?utf-8?B?RVhldnNkeXd5dGZQUmNMSmdHSFQxYTN5c3dkK0xEbFZzZEhhdzdwK0ZHUW1E?=
 =?utf-8?B?L3BPRldxcTJEZFBLVXljWS81QkRXSnFNeUxoUkVTbTlhQmQwcENqY1YvVWQ4?=
 =?utf-8?B?VkkyaXltblZETlBuN0JZeG9NNVZodUtDRXNQQi9JQ0NoUFQ4cFM1UHNWWlFw?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ff10f7-aa0f-4f18-fe84-08de05c0dcc2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 16:45:03.1096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pf+4FiWClf57Ik7opwRQuUtHRCVrqVPRungq+M3WJUsOObm36BGX5sVFRFIrI2jmrO1ArqNox5jXvvXpnkT9mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7420
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



On 2025-10-02 12:00 p.m., Lucas De Marchi wrote:
> On Thu, Oct 02, 2025 at 11:03:01AM -0400, Zhanjun Dong wrote:
>> Add prefix to GuC log buffer macros to follow Xe naming styles.
>> Remove helper functions, replaced with macros.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_guc.c         | 22 ++++-----
>> drivers/gpu/drm/xe/xe_guc_capture.c |  6 +--
>> drivers/gpu/drm/xe/xe_guc_log.c     | 71 +++++++----------------------
>> drivers/gpu/drm/xe/xe_guc_log.h     | 14 +++---
>> 4 files changed, 36 insertions(+), 77 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index d5adbbb013ec..b0ea9a13847a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -99,7 +99,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>>     u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
>>     u32 flags;
>>
>> -    #if (((CRASH_BUFFER_SIZE) % SZ_1M) == 0)
>> +    #if (((XE_GUC_LOG_CRASH_BUFFER_SIZE) % SZ_1M) == 0)
> 
> can you also add a patch to remove the excess use of parenthesis and
> indentation? Should ahave been:
> 
> #if XE_GUC_LOG_CRASH_BUFFER_SIZE % SZ_1M == 0
> 

In case of CRASH_BUFFER_SIZE defined with expression like:

SZ_2M - SZ_1M

expanded macro would be
   #if  SZ_2M - SZ_1M % SZ_1M == 0

due to '%' op is higher than '-'
SZ_1M % SZ_1M is 0
SZ_2M - 0 is SZ_2M
SZ_2M != 0
Result: false

That gives us unwantted result, expected should be:
(SZ_2M - SZ_1M)  % SZ_1M == 0
Result: true

We might still need parenthesis to prevent operator precedence issues

> 
> 
>>     #define LOG_UNIT SZ_1M
>>     #define LOG_FLAG GUC_LOG_LOG_ALLOC_UNITS
>>     #else
>> @@ -107,7 +107,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc 
>> *guc)
>>     #define LOG_FLAG 0
>>     #endif
>>
>> -    #if (((CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
>> +    #if (((XE_GUC_LOG_CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
> 
> ditto
> 
>>     #define CAPTURE_UNIT SZ_1M
>>     #define CAPTURE_FLAG GUC_LOG_CAPTURE_ALLOC_UNITS
>>     #else
>> @@ -115,20 +115,20 @@ static u32 guc_ctl_log_params_flags(struct 
>> xe_guc *guc)
>>     #define CAPTURE_FLAG 0
>>     #endif
>>
>> -    BUILD_BUG_ON(!CRASH_BUFFER_SIZE);
>> -    BUILD_BUG_ON(!IS_ALIGNED(CRASH_BUFFER_SIZE, LOG_UNIT));
>> -    BUILD_BUG_ON(!DEBUG_BUFFER_SIZE);
>> -    BUILD_BUG_ON(!IS_ALIGNED(DEBUG_BUFFER_SIZE, LOG_UNIT));
>> -    BUILD_BUG_ON(!CAPTURE_BUFFER_SIZE);
>> -    BUILD_BUG_ON(!IS_ALIGNED(CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
>> +    BUILD_BUG_ON(!XE_GUC_LOG_CRASH_BUFFER_SIZE);
>> +    BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_CRASH_BUFFER_SIZE, LOG_UNIT));
>> +    BUILD_BUG_ON(!XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE);
>> +    BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE, 
>> LOG_UNIT));
>> +    BUILD_BUG_ON(!XE_GUC_LOG_CAPTURE_BUFFER_SIZE);
>> +    BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_CAPTURE_BUFFER_SIZE, 
>> CAPTURE_UNIT));
>>
>>     flags = GUC_LOG_VALID |
>>         GUC_LOG_NOTIFY_ON_HALF_FULL |
>>         CAPTURE_FLAG |
>>         LOG_FLAG |
>> -        FIELD_PREP(GUC_LOG_CRASH, CRASH_BUFFER_SIZE / LOG_UNIT - 1) |
>> -        FIELD_PREP(GUC_LOG_DEBUG, DEBUG_BUFFER_SIZE / LOG_UNIT - 1) |
>> -        FIELD_PREP(GUC_LOG_CAPTURE, CAPTURE_BUFFER_SIZE / 
>> CAPTURE_UNIT - 1) |
>> +        FIELD_PREP(GUC_LOG_CRASH, XE_GUC_LOG_CRASH_BUFFER_SIZE / 
>> LOG_UNIT - 1) |
>> +        FIELD_PREP(GUC_LOG_DEBUG, XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE / 
>> LOG_UNIT - 1) |
>> +        FIELD_PREP(GUC_LOG_CAPTURE, XE_GUC_LOG_CAPTURE_BUFFER_SIZE / 
>> CAPTURE_UNIT - 1) |
>>         FIELD_PREP(GUC_LOG_BUF_ADDR, offset);
>>
>>     #undef LOG_UNIT
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/ 
>> xe_guc_capture.c
>> index 243dad3e2418..acb95a93b530 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -816,7 +816,7 @@ static void check_guc_capture_size(struct xe_guc 
>> *guc)
>> {
>>     int capture_size = guc_capture_output_size_est(guc);
>>     int spare_size = capture_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
>> -    u32 buffer_size = xe_guc_log_section_size_capture(&guc->log);
>> +    u32 buffer_size = XE_GUC_LOG_CAPTURE_BUFFER_SIZE;
>>
>>     /*
>>      * NOTE: capture_size is much smaller than the capture region
>> @@ -922,7 +922,7 @@ guc_capture_init_node(struct xe_guc *guc, struct 
>> __guc_capture_parsed_output *no
>>  *                  ADS module also calls separately for PF vs VF.
>>  *
>>  *     --> alloc B: GuC output capture buf (registered via 
>> guc_init_params(log_param))
>> - *                  Size = #define CAPTURE_BUFFER_SIZE (warns if on 
>> too-small)
>> + *                  Size = #define XE_GUC_LOG_CAPTURE_BUFFER_SIZE 
>> (warns if on too-small)
>>  *                  Note2: 'x 3' to hold multiple capture groups
>>  *
>>  * GUC Runtime notify capture:
>> @@ -1368,7 +1368,7 @@ static void __guc_capture_process_output(struct 
>> xe_guc *guc)
>>     xe_map_memcpy_from(guc_to_xe(guc), &log_buf_state_local, &guc- 
>> >log.bo->vmap,
>>                log_buf_state_offset, sizeof(struct 
>> guc_log_buffer_state));
>>
>> -    buffer_size = xe_guc_get_log_buffer_size(&guc->log, 
>> GUC_LOG_BUFFER_CAPTURE);
>> +    buffer_size = XE_GUC_LOG_CAPTURE_BUFFER_SIZE;
>>     read_offset = log_buf_state_local.read_ptr;
>>     write_offset = log_buf_state_local.sampled_write_ptr;
>>     full_count = FIELD_GET(GUC_LOG_BUFFER_STATE_BUFFER_FULL_CNT, 
>> log_buf_state_local.flags);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/ 
>> xe_guc_log.c
>> index c01ccb35dc75..fa1d490dca0d 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -50,16 +50,16 @@ static size_t guc_log_size(void)
>>      *  |     Capture state header      |
>>      *  +-------------------------------+ 96B
>>      *  |                               |
>> -     *  +===============================+ PAGE_SIZE (4KB)
>> +     *  +===============================+ 4KB
>> +     *  |          Event logs           |
>> +     *  +===============================+ + 
>> XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE
>>      *  |        Crash Dump logs        |
>> -     *  +===============================+ + CRASH_SIZE
>> -     *  |          Debug logs           |
>> -     *  +===============================+ + DEBUG_SIZE
> 
> what happened with DEBUG_SIZE? in drivers/gpu/drm/xe/xe_guc.c it's
> referred as DEBUG_BUFFER_SIZE
> 
> Lucas De Marchi
> 
>> +     *  +===============================+ + XE_GUC_LOG_CRASH_BUFFER_SIZE
>>      *  |         Capture logs          |
>> -     *  +===============================+ + CAPTURE_SIZE
>> +     *  +===============================+ + 
>> XE_GUC_LOG_CAPTURE_BUFFER_SIZE
>>      */
>> -    return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
>> -        CAPTURE_BUFFER_SIZE;
>> +    return SZ_4K + XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE + 
>> XE_GUC_LOG_CRASH_BUFFER_SIZE +
>> +        XE_GUC_LOG_CAPTURE_BUFFER_SIZE;

The comment in layout is DEBUG_SIZE, while code is DEBUG_BUFFER_SIZE,
will cleanup in next rev

Regards,
Zhanjun Dong

>> }
>>
>> #define GUC_LOG_CHUNK_SIZE    SZ_2M
>> @@ -274,49 +274,6 @@ int xe_guc_log_init(struct xe_guc_log *log)
>>
>> ALLOW_ERROR_INJECTION(xe_guc_log_init, ERRNO); /* See xe_pci_probe() */
>>
>> -static u32 xe_guc_log_section_size_crash(struct xe_guc_log *log)
>> -{
>> -    return CRASH_BUFFER_SIZE;
>> -}
>> -
>> -static u32 xe_guc_log_section_size_debug(struct xe_guc_log *log)
>> -{
>> -    return DEBUG_BUFFER_SIZE;
>> -}
>> -
>> -/**
>> - * xe_guc_log_section_size_capture - Get capture buffer size within 
>> log sections.
>> - * @log: The log object.
>> - *
>> - * This function will return the capture buffer size within log 
>> sections.
>> - *
>> - * Return: capture buffer size.
>> - */
>> -u32 xe_guc_log_section_size_capture(struct xe_guc_log *log)
>> -{
>> -    return CAPTURE_BUFFER_SIZE;
>> -}
>> -
>> -/**
>> - * xe_guc_get_log_buffer_size - Get log buffer size for a type.
>> - * @log: The log object.
>> - * @type: The log buffer type
>> - *
>> - * Return: buffer size.
>> - */
>> -u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum 
>> guc_log_buffer_type type)
>> -{
>> -    switch (type) {
>> -    case GUC_LOG_BUFFER_CRASH_DUMP:
>> -        return xe_guc_log_section_size_crash(log);
>> -    case GUC_LOG_BUFFER_DEBUG:
>> -        return xe_guc_log_section_size_debug(log);
>> -    case GUC_LOG_BUFFER_CAPTURE:
>> -        return xe_guc_log_section_size_capture(log);
>> -    }
>> -    return 0;
>> -}
>> -
>> /**
>>  * xe_guc_get_log_buffer_offset - Get offset in log buffer for a type.
>>  * @log: The log object.
>> @@ -327,13 +284,17 @@ u32 xe_guc_get_log_buffer_size(struct xe_guc_log 
>> *log, enum guc_log_buffer_type
>>  */
>> u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum 
>> guc_log_buffer_type type)
>> {
>> -    enum guc_log_buffer_type i;
>>     u32 offset = PAGE_SIZE;/* for the log_buffer_states */
>>
>> -    for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; 
>> ++i) {
>> -        if (i == type)
>> -            break;
>> -        offset += xe_guc_get_log_buffer_size(log, i);
>> +    switch (type) {
>> +    case GUC_LOG_BUFFER_CAPTURE:
>> +        offset += XE_GUC_LOG_CRASH_BUFFER_SIZE;
>> +        fallthrough;
>> +    case GUC_LOG_BUFFER_CRASH_DUMP:
>> +        offset += XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE;
>> +        fallthrough;
>> +    case GUC_LOG_BUFFER_DEBUG:
>> +        break;
>>     }
>>
>>     return offset;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/ 
>> xe_guc_log.h
>> index 98a47ac42b08..0cc059cedb9c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>> @@ -13,13 +13,13 @@ struct drm_printer;
>> struct xe_device;
>>
>> #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>> -#define CRASH_BUFFER_SIZE       SZ_1M
>> -#define DEBUG_BUFFER_SIZE       SZ_8M
>> -#define CAPTURE_BUFFER_SIZE     SZ_2M
>> +#define XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE    SZ_8M
>> +#define XE_GUC_LOG_CRASH_BUFFER_SIZE        SZ_1M
>> +#define XE_GUC_LOG_CAPTURE_BUFFER_SIZE        SZ_2M
>> #else
>> -#define CRASH_BUFFER_SIZE    SZ_16K
>> -#define DEBUG_BUFFER_SIZE    SZ_64K
>> -#define CAPTURE_BUFFER_SIZE    SZ_1M
>> +#define XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE    SZ_64K
>> +#define XE_GUC_LOG_CRASH_BUFFER_SIZE        SZ_16K
>> +#define XE_GUC_LOG_CAPTURE_BUFFER_SIZE        SZ_1M
>> #endif
>> /*
>>  * While we're using plain log level in i915, GuC controls are much 
>> more...
>> @@ -51,8 +51,6 @@ xe_guc_log_get_level(struct xe_guc_log *log)
>>     return log->level;
>> }
>>
>> -u32 xe_guc_log_section_size_capture(struct xe_guc_log *log);
>> -u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum 
>> guc_log_buffer_type type);
>> u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum 
>> guc_log_buffer_type type);
>> bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log,
>>                    enum guc_log_buffer_type type,
>> -- 
>> 2.34.1
>>

