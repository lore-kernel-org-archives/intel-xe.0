Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB49CAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 21:50:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E2B10E139;
	Mon,  6 Oct 2025 21:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VkLeLP7u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F008810E139
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 21:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759787453; x=1791323453;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=bUphrdqQPoVNIAFDRO6LColW+J5BneE8PDQ7tkmmyzo=;
 b=VkLeLP7u8AHMZ1HA0s/t5hevSzN+Ejw7U12wcVB/uG20+9i3gi+q5FgW
 jtXIvAHayzLYSIqLECQKb0axDGeWA1YaT6lkfNvryq5NxEuGg1JHyg2C4
 aoNjMOzI1qd5qMpliNe8vhqPnm/U1HWh2pr/g8MJLS+K3CfdQcHiqc59+
 G0ur4uw65Cm3b/TTGleu0AAlhTdzE4gG30ixJQENOQOYMZyIFlubKKQx+
 Du+tnKv3oTyRI8plo5MXDDJCDkFx7zIe/KQ2Hx/8TaSyPDwifQAMbgkur
 10U6PYCsn6mr4q/6j3vgAPiOE5JI4ATuCkUM54+SSN6J34jUeaSCMbGx8 Q==;
X-CSE-ConnectionGUID: PDGpEJdFSMOf+LIsxH+fTQ==
X-CSE-MsgGUID: mgx3Ove5TmSPDUc5xiothA==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="72223358"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208,217";a="72223358"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 14:50:50 -0700
X-CSE-ConnectionGUID: E81opDpURpKxPe75L7C9VQ==
X-CSE-MsgGUID: jiq1uHIfTf2/ZlC1YyQiCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; 
 d="scan'208,217";a="179571731"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 14:50:50 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 14:50:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 14:50:49 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.70)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 14:50:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IS8nN0we13nUv76F26RPR4+kyuM74TKJuR8eF4ASFZ2flyhXgq1EyUE78IlUyZUKK60JqQpftiSqmoYv3p6bnmFIbdop64JpCagVCC+kxvOPFou/ry0QTJ/jN+PYVn+qMOG7xb7oHj5FtVr3Qc59o0FZlUt+sB2m7YRx3oYpEzPe3o5qncoAwoImJkXGzgFWDTd5KVkE1MyBABLJIyDGp1SabZrWPFU9SPYT+z0zhIr0iFRn/xGMvmjWvzrIeNFMsQMRtM3waRX1O9DdAdE5tS9UZxsf0/m55gpZKmDPUqQBW2DoRBMVo2rtJYZq5Exqk9byGzBFYd0wyxc8HDheOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MrqedOREW1pf5V+ZgIxghYJh92z/7MreR6MDcYPc8H0=;
 b=ECX45iITCUB4KdNSR7bbvTv88JSLunqjHpjZozYpzPGyP3rof5hBpIYfbxtk5BendViiyopG0864qsYQPpueXA2RzMWihDWwF/BM1HPltSvTD6xiVCiK+g7Jr3Sslq/h+gQLhFBMhCBvXJeVN9iybylLUK8HzPUFrfHIowe5nJsliMlkbqC4a6/yOC9Yv36/KgbEkAl7Vcz9scSsay728di802Xr2CYgf2epLRhSZMMAIISHV6h2jgBqrYlLxIfWTIXfSpBPahqJxOvDFL6aRNfSBkuuV7Fl1kCVb6tZp0wMhvoZb9+AH8hFNshgSAiriHJ3DCQyXhdyPocboqIBmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by MW4PR11MB6809.namprd11.prod.outlook.com (2603:10b6:303:1e9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 21:50:45 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Mon, 6 Oct 2025
 21:50:45 +0000
Content-Type: multipart/alternative;
 boundary="------------zWl4cMmoZa54vFul35clyq4w"
Message-ID: <ee7a0bf0-59d0-4ab6-a5b0-cf93c3d39fe6@intel.com>
Date: Mon, 6 Oct 2025 23:50:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 20/30] drm/xe/vf: Start CTs before resfix VF post
 migration recovery
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
 <20251006111038.2234860-21-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20251006111038.2234860-21-matthew.brost@intel.com>
X-ClientProxiedBy: VE1PR03CA0004.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::16) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|MW4PR11MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: 817df33a-16db-4feb-d1aa-08de05226717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVlIdEVkQ1F2QzMzTEVtRnVHcFVJdU1pbWRQdzhadWhYQ0ZNOVdKVVZSRDlM?=
 =?utf-8?B?TFZ0SWhhd3h5TVhQQkxzNmtLdHdjanFKWnNZRDgvb3E2NkpvK1htdm1CUWlY?=
 =?utf-8?B?bnU0MnF1VHd6MU81bm9INU1DTkZkdjd5Y2VLTWJNZ3hOMGJOVDhXK092ZGFw?=
 =?utf-8?B?NHpqQkQ4elFXb2x4YUM0OEJsTWY2MmJjdXUzOUVoTVlkQU00V2hKL1RTUUlE?=
 =?utf-8?B?TzhBRWZTbmlSejVTanVOemNpa3VCT2JkSzNXQVE3V1plNjZJZkR0N2s3WGVN?=
 =?utf-8?B?VlBlYXVRSmFZdkRlV08vRjVmejdvY1VtbDU2R2JDN2NSN2VzbU1lcGNGY2dz?=
 =?utf-8?B?YjF4eDRONFNLREkwM2hZbDVkMkhRTkI0dE5NenlTZHprTWVSWnZPekx3UU9I?=
 =?utf-8?B?ekNxWXJWQlpIWXI5WVVLZzV2Q0FMeEwvKy9hYXdvTGhHTUhXdEFaSUtJRURD?=
 =?utf-8?B?RTE3YzRrMmhIZEZGaEJkZ0pxZStxQ2huL1Nhb2pUMWJWK1lzejlkZVlGZGtP?=
 =?utf-8?B?bDFvLyt1WGVETWdyaVM2WFI0UXozSmNzMzliaUdzUnEvTThLOVUzYXpvUFdB?=
 =?utf-8?B?NEVZTEVaK1pXUzNlTkFXVm5hMm1ZcERDSTB0RXdmcWs5VndOVG9zaGxZZ0tx?=
 =?utf-8?B?cXZCa0NEcHdQeVh5SFg2RllqWlZVYnh1bnh6MEVzRmtWZTErNmdEaTd6ZHRC?=
 =?utf-8?B?a0dLL2RzR3RuYWxTMVdaQXowenBHTTZjc1F6TzRSSGpvQXRGWEVxOTBzMVFK?=
 =?utf-8?B?S0N5OHRJY01JbGsvT0x2TWNuWkpLS1hQOFVOdVBUSGlHZmZMVnJqUEdhWk5O?=
 =?utf-8?B?VzRDNytDMTdra1VFcVVlRnc3T0U4WC8vT0d1M2R1ZG5UZHJhVmdBMHQ3UFpq?=
 =?utf-8?B?NjV1S0JtTjk1N2tGdS9RajNzYW5pOTYxTkxaWmNKVkxhYmRzUzFsRi9oamZO?=
 =?utf-8?B?MDc1eGpzWk43SjE0Zy9KNE5ZKzYvWGowTG5MWkU1SXBoQ3BuOXlDTjFxZW03?=
 =?utf-8?B?aGtTNUJQZTh3TWUyT01xcFowWGRmei91WGpJM2IvUnBxQVdQbW1nZkNiWTRm?=
 =?utf-8?B?Rm1jYUpHS0VGU3FiNThXNUdXQnViTDQ3VGhrdjNJVmhOMGRwZmZQU1VQQUlL?=
 =?utf-8?B?SHdpZ0NaZTVsSmEwUmFHVElBYUxXaHZNSUxEbnVYcERud3VsV0JKQmplbmF2?=
 =?utf-8?B?dnV6U1dFN1gzTW1JQWI5MmZ1d2NKUGZXUEZuTVJHZUs4MDE1VzVwSUJweVAy?=
 =?utf-8?B?b0Nva3N4aGZOSzkxaHBEMHQ3UnFlT0pUbUdTelp6bnZTVlVTZGI4d1NOeWZq?=
 =?utf-8?B?MTFNRnFRSEt1WXY4eGI0L28zOGUzNEVkaTczWnZ2MDBSSjZNY0tySENWZm1p?=
 =?utf-8?B?eXk1aEwyN29NVnM2K0p3c2NsMDFRN1RTKzg0Q0daUGhxNUhGVk9vMW1SWEJn?=
 =?utf-8?B?bkhMREhnUTdPSkRnWjh0eEdLRTRvQjg4S1NqME9kcFFBMTlMRlRxdTVvMGZh?=
 =?utf-8?B?WjFOdW9lM3dHODAycmx2UnUxUzJYM2tGK1dvZmZlK3ExWkM1WHgyaDdpUUJL?=
 =?utf-8?B?M0hkTmV0SHd3L3dBV3lvSXl2RVNMWWVCcXFFSTNzZHZ6RFFrZUZlWW41aTcw?=
 =?utf-8?B?MTdxdEZUTkpVZjViRVpXa1FTV3YwYzY4YUN5NU1aVVUzNG4rSFpONFVvRDhR?=
 =?utf-8?B?dnEwRmhZYkpBMHZuU29KSVlCMFBhb0F2dEtBcDl0bFJOUk1yclVqck9Oc3FZ?=
 =?utf-8?B?VjRndENVTVdabjE0UFJRaFZ1ay94SmdROWJwV2JBT2tZUGZ2RHUyVEtVZTZS?=
 =?utf-8?B?TUlYUUtnMVVyNVU4U0k2Qm1TdldzeEFNd0UyanB4ZGhrSFM1aEpDbnpkMjNU?=
 =?utf-8?B?bHkxZDJHR2V6enY2ZFFYMEovSmhUYjdMMkxlMWRxT29vNGhPM3poc1ljUDFJ?=
 =?utf-8?Q?6c3gNfMaBXcFB4pvMcmjGztoz8fcswuo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXNnNGx4aVBGZitad0N6WFU3dzIxcUs2SEU1T1p1SHZubDVwUjdtYldOalMv?=
 =?utf-8?B?Sy9DR1AwL0F4SXFaYXd0dncvZHJNL2E1MWJ3allZQm1xUDZTYWMzancwSEYz?=
 =?utf-8?B?YXJEZXRTWlRqeU9oOFQ2TXpmVkFIcERvQXJtRVpTZHhZYkR5dndnMTNVM1Ur?=
 =?utf-8?B?cCtnWGpoSFNSck91TzN6N1lTbVlEcWNuUTZha0dNSjdQUm82VXJJdmFkU054?=
 =?utf-8?B?Y0VITXRJQlhWOXdZVXZkYlo0ZVhXY3FhVnh5bno5VjNUM2ZWeXBBWjNEZldJ?=
 =?utf-8?B?OWQxRm15amVQL1lOb3pSSzMyUC9ueENucWRBTE9kYVZmdi96d1RhUWJlY1do?=
 =?utf-8?B?ZVgzY01Wby95RGJBNjZ5VGwrRkgxNzdXeHhZcVJHeTUxbU92bm1LUE1iRVpy?=
 =?utf-8?B?ZjNxczk1Y1ZRTmtxSDNGT3VZWDJLdHZSb2R6ZDJFVVNEUllUS2Z4bDFnNkor?=
 =?utf-8?B?T0wzSFNvMjV6RHdnUzcybDBpTEJ4VzlPZE12dGhTSEhCYml4WlY5emU5NzdW?=
 =?utf-8?B?MWFTL0hTTEVqbnZ2VEN5Z0tQNmJKRjBYZjRNVTVmMkZFOVdSaGR3Z3BCUFNy?=
 =?utf-8?B?R0x1amppQTNvWTlJVll3TlV4MWdJUEhIUDNFYXdwZmNzREpNN1FEYU1pclpC?=
 =?utf-8?B?bWRrd2ZlaEZCRlNvYkFEd0VGeS9nTWFDYWFZVjdpbnhRcTdFM0ZCL3RxUDM1?=
 =?utf-8?B?akhxOUNpdGZpUGpHck5jWm1aSndOSlpNYldEOW1HTm9Ibkp3VHhsTzh3bFEz?=
 =?utf-8?B?N2J1TytreFVYSVBUKzJ2L2pucUJwQVBHT00rcGJaRGJxK1d4eDdoZ2p6aGxi?=
 =?utf-8?B?RjB3bkR4a3V1N21sYUNodG9hZFlycldlaVc0NXFIRmFieXhsZVV0b3V6OGdp?=
 =?utf-8?B?TUNvQlcxQjlmS3A0RHA0L3BhRHpTTUxZdklXVzU2aS8vMUdvUmV3NlZ0RU54?=
 =?utf-8?B?RFZmR2F0a051ZFJIcldvTmZUeXdWMVR3cW9udWkvRnFXbXlpRW1PbUU3S0l4?=
 =?utf-8?B?QXIwaVhncFpONTd6Wm9jNUlxK0pxOUhMMjJxdGhsWjljNlFLcnlHNnBROWpI?=
 =?utf-8?B?TGF6NmEyRUVOUkVEWWk4U0hTVWpsN093VDFCZFVBWlNmWFdtWlFKeU84ZzlH?=
 =?utf-8?B?aUZpOXhtSmFQQ0JESzB3bkRQdEl4dDhIbG52SUZMeFEzb012dmY0Qkk0Y2lT?=
 =?utf-8?B?TUJHWVZXNDd0U0hINzVMdHh5ZEI3NlJqNXVlUFB1bnR3ZmFNZVl6c2xzL2pq?=
 =?utf-8?B?c0tETnh1OEtDV2dyNDVnc0thV1ZaYVhGMkFSeHlseC80d0R1T2xVbzZsYTZQ?=
 =?utf-8?B?ZVM3Qi9UZTdEN01WY3pta1FhemthMXh2K2ZnbFZiemJNcENQM004S2dzSzF0?=
 =?utf-8?B?Q0ozV3FhNzQyWmVwbEg0cks2Nm9rcll3MGlQblNlWVdGU0V3bForZnowTlll?=
 =?utf-8?B?SmtGYmFwd2xUUDRpckRZMlg0SFZGUWQvanJjTGxnYStZTU9RVmJHL3pLRHIy?=
 =?utf-8?B?cWlsN0gyRFFqV2FoeFlZRXR2SXpCZk5SUHNISlE2L2ZzL3ROVFFVRlN4dzZu?=
 =?utf-8?B?SG0yektJeGZ3azhjd05qRVZvMjd2RHU1K0JvMEVwZDA3UzNtcGFwMUE0eGRr?=
 =?utf-8?B?KzFWOERaREJUWlhOYlN5d045UFhtNVJhSFpRVXVYWW01eVBiRFAwVVI5bk5k?=
 =?utf-8?B?Z2dieGdXY0pFaHFJUFpNbGprS3prTzQvdHJFSHlSMXhoZ3JqWDFUU05aTS9w?=
 =?utf-8?B?ZS9ucWhzVUY4ZlVKVnF0RG1tZjA5eXE3dUxJdDFFOFZzdFFTbUJLb2ovOThX?=
 =?utf-8?B?N0s0RDltdnpTQVM1cUw1ZkNwRDdvbjlFMEFzcmZoOWE3T041NnpPSjFaVkwz?=
 =?utf-8?B?c25WRTVCZ3kxemlrZE92ZlNnWDBpdjJKUSsyWVdvU0V2TXVXUElCQ2hLUzZT?=
 =?utf-8?B?djJsemUyTEdmUktic3cvM2ZPK3NPZ0RHQzFHSmFEZm1hYlVzUFk3b3ZGYUps?=
 =?utf-8?B?bkw2R2ovNFJ5TG9DMUhUSkM0eFM1S0FicEZlYWtrWVdWV0MxSXh0eXFhM1cz?=
 =?utf-8?B?Tk1wc2NCeWZZRDFWWEMrbE5vVWUrQldlTGVCQVBENzFGdDFxdTlQbWlBQlBv?=
 =?utf-8?Q?BKNTs8Az6NqNDz3VbJsLxrs5C?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 817df33a-16db-4feb-d1aa-08de05226717
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 21:50:45.2264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nmUdFtIrZ44yVjc1OyNykg80yonn7/xRsNrqrlhRDmBcUKmEQ2A2WwS3P4H6BXRgBsz9zNDmUq69Qz/6l1wPhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6809
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

--------------zWl4cMmoZa54vFul35clyq4w
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10/6/2025 1:10 PM, Matthew Brost wrote:
> Before RESFIX_DONE, all CTs stuck in the H2G queue need to be squashed,
> as they may contain actions which contain invalid GGTT references or are
> unnecessary after HW change.
>
> Starting the CTs clears all H2Gs in the queue. Any lost H2Gs are
> resubmitted by the GuC submission state machine.
>
> v3:
>   - Don't mess with head / tail values (Michal)
> v4:
>   - Don't mess with broke (Michal)
>   - Add CTB_H2G_BUFFER_OFFSET (Michal)
> v5:
>   - Adjust commit message (Tomasz)
>
> Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  7 +++
>   drivers/gpu/drm/xe/xe_guc_ct.c      | 70 +++++++++++++++++++++--------
>   drivers/gpu/drm/xe/xe_guc_ct.h      |  1 +
>   3 files changed, 60 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 2a988eb3e904..6052c7302cc6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1139,6 +1139,11 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
>   	return 0;
>   }
>   
> +static void vf_post_migration_rearm(struct xe_gt *gt)
> +{
> +	xe_guc_ct_restart(&gt->uc.guc.ct);
> +}
> +
>   static void vf_post_migration_kickstart(struct xe_gt *gt)
>   {
>   	xe_guc_submit_unpause(&gt->uc.guc);
> @@ -1190,6 +1195,8 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>   	if (err)
>   		goto fail;
>   
> +	vf_post_migration_rearm(gt);
> +
>   	err = vf_post_migration_notify_resfix_done(gt);
>   	if (err && err != -EAGAIN)
>   		goto fail;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index f67575b1ed79..c0d261abf735 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -167,6 +167,7 @@ ct_to_xe(struct xe_guc_ct *ct)
>    */
>   
>   #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
> +#define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)

We've agreed today to separate the CTB_H2G_BUFFER_OFFSET introduction to 
its own patch within this series.

(as in comments for rev4)

-Tomasz

>   #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
>   #define CTB_G2H_BUFFER_SIZE	(SZ_128K)
>   #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 2)
> @@ -190,7 +191,7 @@ long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct)
>   
>   static size_t guc_ct_size(void)
>   {
> -	return 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE +
> +	return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE +
>   		CTB_G2H_BUFFER_SIZE;
>   }
>   
> @@ -331,7 +332,7 @@ static void guc_ct_ctb_h2g_init(struct xe_device *xe, struct guc_ctb *h2g,
>   	h2g->desc = *map;
>   	xe_map_memset(xe, &h2g->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
>   
> -	h2g->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE * 2);
> +	h2g->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_H2G_BUFFER_OFFSET);
>   }
>   
>   static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
> @@ -349,7 +350,7 @@ static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
>   	g2h->desc = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE);
>   	xe_map_memset(xe, &g2h->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
>   
> -	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE * 2 +
> +	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_H2G_BUFFER_OFFSET +
>   					    CTB_H2G_BUFFER_SIZE);
>   }
>   
> @@ -360,7 +361,7 @@ static int guc_ct_ctb_h2g_register(struct xe_guc_ct *ct)
>   	int err;
>   
>   	desc_addr = xe_bo_ggtt_addr(ct->bo);
> -	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE * 2;
> +	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET;
>   	size = ct->ctbs.h2g.info.size * sizeof(u32);
>   
>   	err = xe_guc_self_cfg64(guc,
> @@ -387,7 +388,7 @@ static int guc_ct_ctb_g2h_register(struct xe_guc_ct *ct)
>   	int err;
>   
>   	desc_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE;
> -	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE * 2 +
> +	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET +
>   		CTB_H2G_BUFFER_SIZE;
>   	size = ct->ctbs.g2h.info.size * sizeof(u32);
>   
> @@ -501,7 +502,7 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct)
>   		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
>   }
>   
> -int xe_guc_ct_enable(struct xe_guc_ct *ct)
> +static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
>   {
>   	struct xe_device *xe = ct_to_xe(ct);
>   	struct xe_gt *gt = ct_to_gt(ct);
> @@ -509,21 +510,28 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>   
>   	xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
>   
> -	xe_map_memset(xe, &ct->bo->vmap, 0, 0, xe_bo_size(ct->bo));
> -	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> -	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
> +	if (needs_register) {
> +		xe_map_memset(xe, &ct->bo->vmap, 0, 0, xe_bo_size(ct->bo));
> +		guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> +		guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
>   
> -	err = guc_ct_ctb_h2g_register(ct);
> -	if (err)
> -		goto err_out;
> +		err = guc_ct_ctb_h2g_register(ct);
> +		if (err)
> +			goto err_out;
>   
> -	err = guc_ct_ctb_g2h_register(ct);
> -	if (err)
> -		goto err_out;
> +		err = guc_ct_ctb_g2h_register(ct);
> +		if (err)
> +			goto err_out;
>   
> -	err = guc_ct_control_toggle(ct, true);
> -	if (err)
> -		goto err_out;
> +		err = guc_ct_control_toggle(ct, true);
> +		if (err)
> +			goto err_out;
> +	} else {
> +		ct->ctbs.h2g.info.broken = false;
> +		ct->ctbs.g2h.info.broken = false;
> +		xe_map_memset(xe, &ct->bo->vmap, CTB_H2G_BUFFER_OFFSET, 0,
> +			      CTB_H2G_BUFFER_SIZE);
> +	}
>   
>   	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
>   
> @@ -555,6 +563,32 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>   	return err;
>   }
>   
> +/**
> + * xe_guc_ct_restart() - Restart GuC CT
> + * @ct: the &xe_guc_ct
> + *
> + * Restart GuC CT to an empty state without issuing a CT register MMIO command.
> + *
> + * Return: 0 on success, or a negative errno on failure.
> + */
> +int xe_guc_ct_restart(struct xe_guc_ct *ct)
> +{
> +	return __xe_guc_ct_start(ct, false);
> +}
> +
> +/**
> + * xe_guc_ct_enable() - Enable GuC CT
> + * @ct: the &xe_guc_ct
> + *
> + * Enable GuC CT to an empty state and issue a CT register MMIO command.
> + *
> + * Return: 0 on success, or a negative errno on failure.
> + */
> +int xe_guc_ct_enable(struct xe_guc_ct *ct)
> +{
> +	return __xe_guc_ct_start(ct, true);
> +}
> +
>   static void stop_g2h_handler(struct xe_guc_ct *ct)
>   {
>   	cancel_work_sync(&ct->g2h_worker);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 02eaa452b400..10d05193e51c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -15,6 +15,7 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
>   int xe_guc_ct_init(struct xe_guc_ct *ct);
>   int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
>   int xe_guc_ct_enable(struct xe_guc_ct *ct);
> +int xe_guc_ct_restart(struct xe_guc_ct *ct);
>   void xe_guc_ct_disable(struct xe_guc_ct *ct);
>   void xe_guc_ct_stop(struct xe_guc_ct *ct);
>   void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
--------------zWl4cMmoZa54vFul35clyq4w
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/6/2025 1:10 PM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251006111038.2234860-21-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">Before RESFIX_DONE, all CTs stuck in the H2G queue need to be squashed,
as they may contain actions which contain invalid GGTT references or are
unnecessary after HW change.

Starting the CTs clears all H2Gs in the queue. Any lost H2Gs are
resubmitted by the GuC submission state machine.

v3:
 - Don't mess with head / tail values (Michal)
v4:
 - Don't mess with broke (Michal)
 - Add CTB_H2G_BUFFER_OFFSET (Michal)
v5:
 - Adjust commit message (Tomasz)

Signed-off-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  7 +++
 drivers/gpu/drm/xe/xe_guc_ct.c      | 70 +++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_guc_ct.h      |  1 +
 3 files changed, 60 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 2a988eb3e904..6052c7302cc6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1139,6 +1139,11 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
 	return 0;
 }
 
+static void vf_post_migration_rearm(struct xe_gt *gt)
+{
+	xe_guc_ct_restart(&amp;gt-&gt;uc.guc.ct);
+}
+
 static void vf_post_migration_kickstart(struct xe_gt *gt)
 {
 	xe_guc_submit_unpause(&amp;gt-&gt;uc.guc);
@@ -1190,6 +1195,8 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 	if (err)
 		goto fail;
 
+	vf_post_migration_rearm(gt);
+
 	err = vf_post_migration_notify_resfix_done(gt);
 	if (err &amp;&amp; err != -EAGAIN)
 		goto fail;
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index f67575b1ed79..c0d261abf735 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -167,6 +167,7 @@ ct_to_xe(struct xe_guc_ct *ct)
  */
 
 #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
+#define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)</pre>
    </blockquote>
    <p>We've agreed today to separate the&nbsp;<span style="white-space: pre-wrap">CTB_H2G_BUFFER_OFFSET </span>introduction
      to its own patch within this series.</p>
    <p>(as in comments for rev4)</p>
    <p>-Tomasz</p>
    <blockquote type="cite" cite="mid:20251006111038.2234860-21-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">
 #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
 #define CTB_G2H_BUFFER_SIZE	(SZ_128K)
 #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 2)
@@ -190,7 +191,7 @@ long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct)
 
 static size_t guc_ct_size(void)
 {
-	return 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE +
+	return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE +
 		CTB_G2H_BUFFER_SIZE;
 }
 
@@ -331,7 +332,7 @@ static void guc_ct_ctb_h2g_init(struct xe_device *xe, struct guc_ctb *h2g,
 	h2g-&gt;desc = *map;
 	xe_map_memset(xe, &amp;h2g-&gt;desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
 
-	h2g-&gt;cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE * 2);
+	h2g-&gt;cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_H2G_BUFFER_OFFSET);
 }
 
 static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
@@ -349,7 +350,7 @@ static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
 	g2h-&gt;desc = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE);
 	xe_map_memset(xe, &amp;g2h-&gt;desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
 
-	g2h-&gt;cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE * 2 +
+	g2h-&gt;cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_H2G_BUFFER_OFFSET +
 					    CTB_H2G_BUFFER_SIZE);
 }
 
@@ -360,7 +361,7 @@ static int guc_ct_ctb_h2g_register(struct xe_guc_ct *ct)
 	int err;
 
 	desc_addr = xe_bo_ggtt_addr(ct-&gt;bo);
-	ctb_addr = xe_bo_ggtt_addr(ct-&gt;bo) + CTB_DESC_SIZE * 2;
+	ctb_addr = xe_bo_ggtt_addr(ct-&gt;bo) + CTB_H2G_BUFFER_OFFSET;
 	size = ct-&gt;ctbs.h2g.info.size * sizeof(u32);
 
 	err = xe_guc_self_cfg64(guc,
@@ -387,7 +388,7 @@ static int guc_ct_ctb_g2h_register(struct xe_guc_ct *ct)
 	int err;
 
 	desc_addr = xe_bo_ggtt_addr(ct-&gt;bo) + CTB_DESC_SIZE;
-	ctb_addr = xe_bo_ggtt_addr(ct-&gt;bo) + CTB_DESC_SIZE * 2 +
+	ctb_addr = xe_bo_ggtt_addr(ct-&gt;bo) + CTB_H2G_BUFFER_OFFSET +
 		CTB_H2G_BUFFER_SIZE;
 	size = ct-&gt;ctbs.g2h.info.size * sizeof(u32);
 
@@ -501,7 +502,7 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct)
 		xe_gt_dbg(ct_to_gt(ct), &quot;GuC CT safe-mode disabled\n&quot;);
 }
 
-int xe_guc_ct_enable(struct xe_guc_ct *ct)
+static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
 {
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_gt *gt = ct_to_gt(ct);
@@ -509,21 +510,28 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 
 	xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
 
-	xe_map_memset(xe, &amp;ct-&gt;bo-&gt;vmap, 0, 0, xe_bo_size(ct-&gt;bo));
-	guc_ct_ctb_h2g_init(xe, &amp;ct-&gt;ctbs.h2g, &amp;ct-&gt;bo-&gt;vmap);
-	guc_ct_ctb_g2h_init(xe, &amp;ct-&gt;ctbs.g2h, &amp;ct-&gt;bo-&gt;vmap);
+	if (needs_register) {
+		xe_map_memset(xe, &amp;ct-&gt;bo-&gt;vmap, 0, 0, xe_bo_size(ct-&gt;bo));
+		guc_ct_ctb_h2g_init(xe, &amp;ct-&gt;ctbs.h2g, &amp;ct-&gt;bo-&gt;vmap);
+		guc_ct_ctb_g2h_init(xe, &amp;ct-&gt;ctbs.g2h, &amp;ct-&gt;bo-&gt;vmap);
 
-	err = guc_ct_ctb_h2g_register(ct);
-	if (err)
-		goto err_out;
+		err = guc_ct_ctb_h2g_register(ct);
+		if (err)
+			goto err_out;
 
-	err = guc_ct_ctb_g2h_register(ct);
-	if (err)
-		goto err_out;
+		err = guc_ct_ctb_g2h_register(ct);
+		if (err)
+			goto err_out;
 
-	err = guc_ct_control_toggle(ct, true);
-	if (err)
-		goto err_out;
+		err = guc_ct_control_toggle(ct, true);
+		if (err)
+			goto err_out;
+	} else {
+		ct-&gt;ctbs.h2g.info.broken = false;
+		ct-&gt;ctbs.g2h.info.broken = false;
+		xe_map_memset(xe, &amp;ct-&gt;bo-&gt;vmap, CTB_H2G_BUFFER_OFFSET, 0,
+			      CTB_H2G_BUFFER_SIZE);
+	}
 
 	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
 
@@ -555,6 +563,32 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	return err;
 }
 
+/**
+ * xe_guc_ct_restart() - Restart GuC CT
+ * @ct: the &amp;xe_guc_ct
+ *
+ * Restart GuC CT to an empty state without issuing a CT register MMIO command.
+ *
+ * Return: 0 on success, or a negative errno on failure.
+ */
+int xe_guc_ct_restart(struct xe_guc_ct *ct)
+{
+	return __xe_guc_ct_start(ct, false);
+}
+
+/**
+ * xe_guc_ct_enable() - Enable GuC CT
+ * @ct: the &amp;xe_guc_ct
+ *
+ * Enable GuC CT to an empty state and issue a CT register MMIO command.
+ *
+ * Return: 0 on success, or a negative errno on failure.
+ */
+int xe_guc_ct_enable(struct xe_guc_ct *ct)
+{
+	return __xe_guc_ct_start(ct, true);
+}
+
 static void stop_g2h_handler(struct xe_guc_ct *ct)
 {
 	cancel_work_sync(&amp;ct-&gt;g2h_worker);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 02eaa452b400..10d05193e51c 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -15,6 +15,7 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
 int xe_guc_ct_init(struct xe_guc_ct *ct);
 int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
 int xe_guc_ct_enable(struct xe_guc_ct *ct);
+int xe_guc_ct_restart(struct xe_guc_ct *ct);
 void xe_guc_ct_disable(struct xe_guc_ct *ct);
 void xe_guc_ct_stop(struct xe_guc_ct *ct);
 void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
</pre>
    </blockquote>
  </body>
</html>

--------------zWl4cMmoZa54vFul35clyq4w--
