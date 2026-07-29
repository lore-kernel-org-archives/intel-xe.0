Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58385C54F51
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 21:52:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF9010E0A8;
	Wed, 29 Jul 2026 21:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CJT09oZU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E0510E0A8
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 21:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785361948; x=1816897948;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a+51of5Iu6a5dTZTu0atVF0Hj28LJ/qjkhAXnk96dhY=;
 b=CJT09oZUnCRQahUReYwLSk3xNWqD8+BclKPFPESFc2lH44lU0h1wOa0a
 Y6D+V9Zbxo7HqG9DzKh4JuIm6s6yPydKUGIkA5ad3jhhVwl17TtFrW0f6
 A0G1lEqe7oV6rk4q5fC2QZH7l+/U7x3Is5Xx17+qvqJG7XfMaAVcbfiRu
 YX8mx8ro9F7mUnAh7qXbo8X5JOSh/SVS4HdEbNj8rDiP8VL+pbfspPt84
 xlgMZzTx0G0eZwJNDXaREK+nq14Iz6x1mdx5dHUisPNXT2A13mOoQOF5T
 5fAa3sFv7KtLN09pVdq9GUtEYEnDLTA/thl6tDscRwpcRuJIqqfYTyRnD g==;
X-CSE-ConnectionGUID: rUTOz2d3Q1yW7a9go4azOA==
X-CSE-MsgGUID: vEpPw6UwQ2mbbJ5cUJoDOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97352343"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="97352343"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 14:52:27 -0700
X-CSE-ConnectionGUID: a5w1dPkHQJGqi9X0rjg2QQ==
X-CSE-MsgGUID: EZycoWuqQkSHaborBMrKWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="284697497"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 14:52:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 14:52:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 14:52:27 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.24) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 14:52:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/xtS5Emu4UN8tozW84vvngQE1/B3csIw3rACvotPne8TBTwcjjPprl1AoDeuxRGbk+9ONq9Xo1P3IZ0DyyUtZOybdYtz+Jmwyx9+Y+p1O1ldyNy1A+3ykV/qB1AN9oXLJHD+keeHrXhA+Sls0PK+hFD/8zJ04UYxhcBmK2XoNjWvtLY5dRWiOxd79yHOmL6RLGW+Q8HiK7JpHHulFhi37LF6sgvIthPcSRs0FvJM5RIhR6jTF8y2xAWS/MvPIQUmKEHe6CZHArXnhILVhmxIjbTObDp2zyoUTo4KwthORfCurhU7hzL1U3ReGEsg9lKblDxDfVODvSxZtIvNU4+iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OouGbaJdMGpurbxU4BpBWfGvd+vHtpT3fRMgo7rh/XA=;
 b=yd5zU3eKNXgUyKy1zzbZFCRLegRvKIeRdatPQE/UD1+AqVId3eATmQ4od+MWWoAo6XIakRaNMrygNJ3qVhBOTwfQzbq1++ZGDqFrD0qSeYGfWm1l0PjfJ5k0Dcrb4dhed6QEKWM7I6fL9gVlabCxpwtdv05GFOWKP2hJ7UrR9b6hV434IvOsv60oXFIBze2ZVoRNJQJAbfwQXYN5Cm6FpmFObc4fNU4jyJIWW1IWieQCtwbdu9L4Dcu1LQVGTF/Wiu4AS5/LBqHztw2+phNRz73jkBzE/o5Rdz3NQ8D4Jb0jJ+mft4FfbJJFGa32IPYVUXfKaFFGubnKTjM9zoEsJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH3PPF3DE9570BE.namprd11.prod.outlook.com (2603:10b6:518:1::d18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Wed, 29 Jul
 2026 21:52:24 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 21:52:24 +0000
Message-ID: <35793f4d-e32e-4a35-9d3c-69914686c298@intel.com>
Date: Wed, 29 Jul 2026 14:52:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] drm/xe: Add debugfs for IA/GT bias
To: <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, sk Anirban <sk.anirban@intel.com>
References: <20260729213141.374812-1-vinay.belgaumkar@intel.com>
 <20260729213141.374812-3-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20260729213141.374812-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0151.namprd05.prod.outlook.com
 (2603:10b6:a03:339::6) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH3PPF3DE9570BE:EE_
X-MS-Office365-Filtering-Correlation-Id: 128dff21-a9fa-46d4-e8e1-08deedbbacb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: rq0iaBOomFNYnvKScg/C6uI2nueKtNLcAZQ+jZUKmXaDYOzilrIhrVd/qJOS0m82NBW/6JQLqyU4TgevBW0CJBUk5Ah6NPvI4bmkbPhGyEfE8319WNLkoee7JC/DrJNx0OiM4T6XJMuqGYZZmQWqAnqfHHN8VhfMyabKlMSV1N4SbnxvWve2OdE3Aq+HElkVhj+FXcMvsz6WImilA6wesFOpGWFWA437gX5n2/zvgdL0Mzpbw91+7VIYrxAsgoYRmG0l+2JdLr/46+yuz2D/4tZATELBvdApeab3oF7gOftlePQeGyuiycisgQDQaS+o3S40MiVUAm43wxsxYrHy+hF8OhlqjS2a0oVMFllgp5xCCEnfQ6Z5EmuGvtMRdu/iC4IHLWrEJdOQTwUiP1wloDMw4sQ2oXZnsJi6Xun7b7c38qf24Pzr8AOzb+PDY/GQHo8D1JFKY+Rv8Wmoucq88ZhngvWMocoksME/OzdGZ6HuCxPPJK30E4yoRTaE9cjdiNiff36DE1RVGFsO03Tnw51yHmysMXJC3v8EMi61+A+Nsp/AJlsxMKFCHJncjTg2iH1/JE7vYUjfqslSSXEGI5zM/3dyAjOgNCIw/0klWusj+zCAex/qLGr3bFmMni367DTpyiVfyQR844t0DFmc3pa3D9ceIm773wXGOmfzlDE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWNjTmdxMlVpWktMb21PdzVRbnlsMm5maUlCL09HTzI5SEhKNWhOaGtNeDMy?=
 =?utf-8?B?aHI4TEV5emZNL0o5bmcycEZiQUlxT1kzb2JmQTR3aEp0OVZqMXhHNW41YXhu?=
 =?utf-8?B?REQ2OVp1QngzV25JdE9aWEdjNnN3b1ArK29lQXJuQllhTTJlemlsTmNpRWJK?=
 =?utf-8?B?S1BqL003b3lKM0dyOHQ2VGhLM2JtK0ZlNzNkbEkxYXBqTitzenQ5cklrOUVC?=
 =?utf-8?B?TFhseGpNWXVBdHZaU08vL1BmREI4Q2pSNHUvelAyUlRDczZoaWFYV3l3YWw3?=
 =?utf-8?B?VThla2JRUVQwdE1lUnZtVDM5MEt0cDYvdkpqeHdzY2s1YVYxWlFjVWx2Sjgr?=
 =?utf-8?B?WWV6ZVI3cThuTkhoYUZ6NFVsb0NSOXRTaWdWWWtob0tocVZzbXkydzQ1dm85?=
 =?utf-8?B?Z2cvdTgxdXZxeUlQdGVJVUdEWFJUaHo0SWpOeTlYQ0dOY0ZmY3A3SlJKZG1r?=
 =?utf-8?B?RUtzalI1Sy92ajkycUVIZGExdWZJN3JRbW02TWMwYjVuZSt0SStXRHJqaXVv?=
 =?utf-8?B?WjU3REhqdnB3Wnl5R0lTMytkQlk1YVhwVmZqcTgwRkZWNjBKajdqdStCUWo1?=
 =?utf-8?B?YUUyazRZeElvdXFtOGJSMXU0M2pYNVh6dEZMd1NaaldmYTJQakRkanNOKzhU?=
 =?utf-8?B?OGlTRzFpZ3VvSjZpM2Jwa01JN0sxSjI3NnRvTnJHdjc0YWpqbEE2K1BQdk81?=
 =?utf-8?B?OTdmT1hnT2lxaXhwU3JmYWtkYjgvRlZzZ2htUm1yb2FTNlBITkJlUWZBalhx?=
 =?utf-8?B?YTl5b0tmOHMvTlpvbElEbXlkcUdvMHgvSGhqbjN2Q3VGM3Z3REVHUHQzc3BX?=
 =?utf-8?B?OXlkbkE2UzNPb3hNUFZXaVhMaDJ3aTJYSUkyRVpJbjRRb0Q2V29IL1VTTWs5?=
 =?utf-8?B?QnNFLzRFOUw3RDVXRWVxazlsbDllS1BTMm1ES1FTb1UzQlJqWkhyWXNUbzAv?=
 =?utf-8?B?cU5kMWl5OWgvOVFyczNlbjhXVnlEVmhTcmR3MW5Ta3daZTBEWlRzTW5TL21k?=
 =?utf-8?B?cFBpbjRZWmxBSW5lL0ZOVlcxbWhweWsvempYNUVSQXFtdXZ2MUR2amlJVEJC?=
 =?utf-8?B?eXluZy9lUE9DY3J4bm9ZdlhmcmFrNVZQclo0TytkaGc4RHRYdVFQNGhUTFVr?=
 =?utf-8?B?VDJpUS9MZG1TeFYyUzM1VUw4dFdxaCtKN1YxVktZa1ROS2VzTlZNZ1BwOWRw?=
 =?utf-8?B?eU5idVNtRHlUQ24vY1ZqYUczNmRWQUhhSWxaejVYNWtQcDk5S2JaditaRGtB?=
 =?utf-8?B?RThnbVg4Ni9QdHhmY1p4VFpBdTJORXdHM0c3NkV2Q1JFM3p3K1NGNE9xdHhw?=
 =?utf-8?B?eERmc3hGYTB2bUZlMnR0K2Y3Q3pKWTZqRTNyZm1IcEtacTNpbnMwYTNaYXdv?=
 =?utf-8?B?M25kZ3JvYTV4TU9jcFBiZ1FZNG5rYWYybDJieGRvWEp1dThwU3FYT2NZWjBG?=
 =?utf-8?B?dXkyT3AvMzg1MkhxUXFyUFZBSStFSVJRVGRid1BlTGJuaWl6NS9rd2hOWDVk?=
 =?utf-8?B?anREb2J2alRzY3lHaU0xZ3VJazFSQXdkYk5zNGM5bTFMTFJaaUNqL0E4QTk3?=
 =?utf-8?B?Qk8vK3Y2R1hnSGl5ZTVNZXhLV0Z2dkNpU1d1ZElmNFdwa0Z0bVJMUjdQZHFM?=
 =?utf-8?B?YzI4TVZ3bU5rSFlWMkhCYkkrRGI5V3FOS25Zcmo1eDhZbWk4cVpMQnNXb3li?=
 =?utf-8?B?cnIvbncxalY3V0JKbHl2L3h6QnhaY0pxZHZNd28zd1BTNXFVbWJSRTkya0FK?=
 =?utf-8?B?RHN0bjJSbE1ZUk41NFk1WkNrTzZJdXY0T3NvZlFhRTBFenE5VVNMZEx4YUhR?=
 =?utf-8?B?Yk95NjU5VlBjN0E4YnRidTZLOXdDY2c1d3VCc2k3bi92MW9DZmNMS0QxakxN?=
 =?utf-8?B?RDE1TUlQZW1qdkJROWxBY2VpTlNKQ1p4K0I5NThqOXc5bTFHZUx4aThjOTIx?=
 =?utf-8?B?cVRoby96emo4RklkdTVNR3lQTkw5RzlaTFQxY1VzSUVSN0twMlVPKzJvWXBD?=
 =?utf-8?B?d014ZE1Xcit3MURwcW44a09OQnZtR25FS2VUVGZ3SGNtd2VsZHpnTmZ2S1Ir?=
 =?utf-8?B?allXWC9lK1lPalc5NnNaTkU5TnBaZ1FwV3V2ckF6NGl0OUVydXBma0ZKWjYw?=
 =?utf-8?B?R2huT1JmUEJ3cG1BanFEZG54VnJMU0VBcjFhM0dzandSNWU1QWl5VmxXWWg1?=
 =?utf-8?B?cG9PQytYenJPSVlUVlVHRzdVTGNER1BDL2NMbmJHeG1oSHZ1NDVxWGZEWEdk?=
 =?utf-8?B?VjVpdEI1cnZiZm80NWVsU1YvanVOblA4RkhCb1FHVDlqeFRUU0U3WkJGUjdX?=
 =?utf-8?B?UHFGOWRDUElob1dXc0RRYm8rY2JCOWo5b0RtUnc2cVdwaVFLcHNKbTArZ0ta?=
 =?utf-8?Q?+0+6aM+wtZLe3Nds=3D?=
X-Exchange-RoutingPolicyChecked: lpttNZamrV7FplFNajKXobEDTuXR3gjr5v0GQgquK8DYo6X7eVCInpX2WBkTm1j0e2WCk9aOfVnNDRR+Y6uN9xgq/vnO6JFYK7I2xyywzzeIlp98gaQIjn3TMSmSmkLWddJUJVhcU5Hm7DMzwXw9OoGKPOEg20dSPhwp3YGCiJdph6bdYRmzjCR7t46WA3XX8s0uhkuaDWIsyuc/xyUakHHmOWc1Kt8Pww71u3RtZPE5xSNKVOhbZ4SHD+PRKtncfOjPR2trN4TO3UOvSy0a6F3PlFY+A+TjMMnIsT3P1DvyZhlCSr9ku9eL7QSuqWBq+oSquEXN7YqntKlOjLpyHQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 128dff21-a9fa-46d4-e8e1-08deedbbacb6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 21:52:24.7304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g/95KI41KZWhC/tHFONfVl+3V0iG3NC7Rc3Y1AWJQ6QiN+yvHLmxjLsjCdGmiFoeU7VRSyvsiRwHl857Ko7EtWACcwXbE6WoSCE6CDid1MM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF3DE9570BE
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


On 7/29/2026 2:31 PM, Vinay Belgaumkar wrote:
> GT_IA_PERF_BIAS_REG indicates power budget between IA and GT.
> Lower 16 bits correspond to IA and upper to GT. Higher value
> indicates more bias towards that plane. The values are in U1.15
> format.
>
> $ cat /sys/kernel/debug/dri/0/gt0/ia_gt_bias
> 0x80004000 (GT: 1.000, IA: 0.500)

Forgot to update the filename here, sending out v7. Please disregard 
this version.

Thanks,

Vinay.

>
> This interface will allow us to observe power budget changes while
> running workloads and also, if needed, tune it.
>
> Bspec: 51878
>
> v3: Add a helper function for U1.15 decode (Michal)
> v4: Validate input values (Rodrigo)
> v5: Comments (Michal, Rodrigo)
> v6: Rename to gt_ia_bias (Anirban), check lower bound (Michal)
>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Assisted-by: Copilot:auto
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  6 +++
>   drivers/gpu/drm/xe/xe_gt_debugfs.c   | 80 ++++++++++++++++++++++++++++
>   2 files changed, 86 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 08251c7a1a4b..48c515d91882 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -634,6 +634,12 @@
>   #define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
>   #define GT_GFX_RC6				XE_REG(0x138108)
>   
> +#define GT_IA_PERF_BIAS_REG			XE_REG(0x138158)
> +#define   GT_BIAS				REG_GENMASK(31, 16)
> +#define   IA_BIAS				REG_GENMASK(15, 0)
> +#define   GT_BIAS_DEFAULT			0x10
> +#define   IA_BIAS_DEFAULT			0x10
> +
>   #define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
>   /* Common performance limit reason bits - available on all platforms */
>   #define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index c38bcacb27e4..ea78b57b1c31 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -9,7 +9,9 @@
>   
>   #include <drm/drm_debugfs.h>
>   #include <drm/drm_managed.h>
> +#include <linux/math.h>
>   
> +#include "regs/xe_gt_regs.h"
>   #include "xe_device.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt.h"
> @@ -22,6 +24,7 @@
>   #include "xe_guc_hwconfig.h"
>   #include "xe_hw_engine.h"
>   #include "xe_lrc.h"
> +#include "xe_mmio.h"
>   #include "xe_mocs.h"
>   #include "xe_pat.h"
>   #include "xe_pm.h"
> @@ -336,6 +339,80 @@ static int force_reset_sync_show(struct seq_file *s, void *unused)
>   }
>   DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
>   
> +#define U1_15_ONE		0x8000
> +#define U1_15_INT_BITS		GENMASK(15, 15)
> +#define U1_15_FRACTION_BITS	GENMASK(14, 0)
> +
> +static void u1_15_decode(u16 num, u16 *i, u32 *frac)
> +{
> +	/*
> +	 * In U1.15 format, uppermost bit is integer value and the
> +	 * rest 15 are the fraction.
> +	 */
> +
> +	*i = FIELD_GET(U1_15_INT_BITS, num);
> +	*frac = FIELD_GET(U1_15_FRACTION_BITS, num);
> +}
> +
> +static void u1_15_decode_decimal(u16 value, u16 *i, u32 *frac, int digits)
> +{
> +	u1_15_decode(value, i, frac);
> +	*frac = (*frac * int_pow(10, digits)) / (FIELD_MAX(U1_15_FRACTION_BITS) + 1);
> +}
> +
> +static int gt_ia_bias_show(struct seq_file *s, void *unused)
> +{
> +	struct xe_gt *gt = s->private;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 val;
> +	u32 ia_frac, gt_frac;
> +	u16 ia_raw, gt_raw;
> +	u16 ia_int, gt_int;
> +
> +	guard(xe_pm_runtime)(xe);
> +	val = xe_mmio_read32(&gt->mmio, GT_IA_PERF_BIAS_REG);
> +
> +	ia_raw = REG_FIELD_GET(IA_BIAS, val);
> +	gt_raw = REG_FIELD_GET(GT_BIAS, val);
> +
> +	u1_15_decode_decimal(ia_raw, &ia_int, &ia_frac, 4);
> +	u1_15_decode_decimal(gt_raw, &gt_int, &gt_frac, 4);
> +
> +	seq_printf(s, "0x%x (GT: %u.%04u, IA: %u.%04u)\n",
> +		   val, gt_int, gt_frac, ia_int, ia_frac);
> +
> +	return 0;
> +}
> +
> +static ssize_t gt_ia_bias_write(struct file *file,
> +				const char __user *userbuf,
> +				size_t count, loff_t *ppos)
> +{
> +	struct seq_file *s = file->private_data;
> +	struct xe_gt *gt = s->private;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 val;
> +	int ret;
> +
> +	ret = kstrtou32_from_user(userbuf, count, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (REG_FIELD_GET(IA_BIAS, val) > U1_15_ONE ||
> +	    REG_FIELD_GET(GT_BIAS, val) > U1_15_ONE)
> +		return -EINVAL;
> +
> +	if (REG_FIELD_GET(IA_BIAS, val) < IA_BIAS_DEFAULT ||
> +	    REG_FIELD_GET(GT_BIAS, val) < GT_BIAS_DEFAULT)
> +		return -EINVAL;
> +
> +	guard(xe_pm_runtime)(xe);
> +	xe_mmio_write32(&gt->mmio, GT_IA_PERF_BIAS_REG, val);
> +
> +	return count;
> +}
> +DEFINE_SHOW_STORE_ATTRIBUTE(gt_ia_bias);
> +
>   void xe_gt_debugfs_register(struct xe_gt *gt)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> @@ -378,6 +455,9 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>   					 ARRAY_SIZE(pf_only_debugfs_list),
>   					 root, minor);
>   
> +	if (xe_gt_is_main_type(gt) && !IS_DGFX(xe) && !IS_SRIOV_VF(xe))
> +		debugfs_create_file("gt_ia_bias", 0600, root, gt, &gt_ia_bias_fops);
> +
>   	xe_uc_debugfs_register(&gt->uc, root);
>   
>   	if (IS_SRIOV_PF(xe))
