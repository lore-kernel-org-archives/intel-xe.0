Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B74C021B2
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 21:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19ED10E9E2;
	Thu, 20 Feb 2025 21:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f90x/4eO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3AF10E9E2
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 21:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740086730; x=1771622730;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=fr/boK6OjnShCGgnjtXuI7p+wVs5VP9BmJfSnYD2YBA=;
 b=f90x/4eOXLkr3Ty0CnHXulW26S1CVnszQrvK3RfC/oJ6U9zq8yjr+Rq8
 NnNj3cAZUXRgDaRWxyPeoCGODDqof5mUGhIhL/bbIpFNqsXi5v6Fhahya
 y3mEWfjianbWcaPAzqUSnIkS9frxzQ9r6i9fMLycQTjX3wEuTW9RKNqPr
 xvbeZIVbK+ckLFTIlpvqjjg5+cM81MiOu0YUpBufVBVFnQ8XrbZqjRWbB
 ZlzoJOqXJ4W8l/xfdjM0QFrOYpGJlXWKCJE0kfKt64WnqX1ksqQsiH8fn
 c/9WHlVQ1EFZ9fzobXs3E5BJCwA0fRY2zuArTRKCh915jXUT+X7x+ZCoP A==;
X-CSE-ConnectionGUID: yUDoKgTTShSOsW7K1ES3Vg==
X-CSE-MsgGUID: 2sdPEOQeQF6kRmhrVu0p3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40757365"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="40757365"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 13:25:24 -0800
X-CSE-ConnectionGUID: +58JQDwRQAKeFxVwzZ76Tw==
X-CSE-MsgGUID: 7MAsi+flTKCSAdY/oErUdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="138383051"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2025 13:25:23 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Feb 2025 13:25:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 13:25:22 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 13:25:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ac/In8ITUVxc3iC2vJDfMVIDZfMkemJELacMyHScipF4JNzAo0lWhQ5aWlrsCIH2JBQz1DXwiy+ezzBhznsUitg/Tp8+Tb1HLhMDLOXMYsoXlypXdVHWBZ+0s9QCYRKkGXtuQNLlqBYnPbX9+gFPCls9ZgUU53padFQIkNlWjHHYgA7VV6qp+JWkIHwxN1fE+/qweWOGw2UNd1Y21t06EvhdRC4yGLKN3+XRXU4200bNDi87XYW5AA39itadFsa3fljSZpuq9BfakeFFKE7LCf+uusi/LZMVj8OecAtOs/RJAM73YiikDqaDciLgSqyP6/zMhqtGviufaXT5cvC25g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0HUsfpr6kJq7RxhoEebov5mqOsQmyqmSNIAkvTUzWI=;
 b=sL5UnMA7RadCVevuwqy3VxPWgj+vjGdCzTC5WYS7j1HS3YZePAUyHU/AGEsbY6vaiOPjb0AEZrYzQqbuthcnbRZYfkqaFCa1zZ6BRbkpga3uAlA0TtYtZLXK/+8JpwWeN+ClO1gyo7EXBsPUmTeA38FsX9RCRoRigad2TIjuuElM3v0dUi7ftpXNgQWRDGzZ4F7L2zo6oPVQRf8cAQpInHE5YHn4nsU7s7+7+MTQ1hKnoZ9bbJxlB7WuKI3lkhrKFOfLyW2xc+4g2Iq0rQyqrmaSPdcuVNwNgaBamNfaqT2AyzF66rsBsp+zXc6TfttwohHXnvGeSKpXmJQSL8gbkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH7PR11MB5888.namprd11.prod.outlook.com (2603:10b6:510:137::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Thu, 20 Feb
 2025 21:25:19 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 21:25:19 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <174008662922.100150.5235954042052397357@intel.com>
References: <20250220172532.66613-1-gustavo.sousa@intel.com>
 <20250220172532.66613-5-gustavo.sousa@intel.com>
 <20250220211050.GX4460@mdroper-desk1.amr.corp.intel.com>
 <174008662922.100150.5235954042052397357@intel.com>
Subject: Re: [PATCH 4/4] drm/xe: Convert pre-GMDID IPs to struct xe_ip
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
To: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 20 Feb 2025 18:25:14 -0300
Message-ID: <174008671442.100150.15924162322909542604@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:303:dc::29) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH7PR11MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: d0c1554e-b877-4884-3efd-08dd51f51320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tkczc3Z6Y0FqTEpoVUQzdVh5TFMwVW1JZy9nMnNSbDJDKzVGTDlBUFJSYmVQ?=
 =?utf-8?B?cUpmT3NHbGpFVkhsNUFocTFURmNtRG5GeXJtL1VSdmliZXBoa1I3K3ZTN2pr?=
 =?utf-8?B?d3B5SDN1SGtSREswSlBUQnRiZTVBN3k3RXpYUE8zem1KNWR4VXNXblpRcDZB?=
 =?utf-8?B?aWdJbFdMaTZmZSs2Z3lHMkk0VENJQjJXRWxLbWlib0RsNFJta3p3aS9ESmFv?=
 =?utf-8?B?d2RCYzExbGRNbytneXg2SEtNMWcwOFAzSmpHTEhvbnAyWnV2QVdxVFZUQUlM?=
 =?utf-8?B?UjE4ekhhOEw3cGVOc1E2dmVvWjVCUUE5Z3hzd1ZnZHhTTGdodXNnUElucHJD?=
 =?utf-8?B?ejZlQm9hK04yQWlVNytGZW5zUnBrc3RtYkpER2w1VjlVZHgzRi9BK0JkbzFt?=
 =?utf-8?B?ZERsYnJRVWRRODlMaWt4TDZCQVFtRjlhRjRCUTJheU5XNm4vbllKVEY1ZHBB?=
 =?utf-8?B?V05CRW01VVNoSk82eFptdENSUnJDZU8xcHRSY3J0S2cvNWlucFhncEZCMDdw?=
 =?utf-8?B?SkdGekJQVDRuSVBTL2VJdlgvQ1RLdHlZRm1iUjFyR0daTVVJbVAweFB0dDU4?=
 =?utf-8?B?Y2RNVCt3ZFpEMGYybzF4bzlPRyszVDVIVVRwRXZWeXEyVzZCTDhhUmVxa29v?=
 =?utf-8?B?Vkh0ODNKd01WQzFUM0dOVXExamtWbi8ySWo0UDVXNWdpMXdwWXJNSmx4a09i?=
 =?utf-8?B?eUtXYXo3RkdHbmxweEhiZ0MwaXRFRy9EazR6MnNZTDFQRnNJdFp1VnQ2ZHpG?=
 =?utf-8?B?TmN5TzB2MFg4d2dYWE15czlhVlI4MDJnd0Z0eDFGRHpFdWE3Z25FOE5jcVoy?=
 =?utf-8?B?ME5qbWt1S204T2pWejdNUUd1aGZMQU9yR05LSVRSR2VueGlXT0VvaG9CTmx2?=
 =?utf-8?B?dG83dHU4VDh0aXFyU1hoZENLc3lYb2QvdStxNi9LZ3JXME5URWdGWDJXc0tZ?=
 =?utf-8?B?KzlncHpINis5MWZ1azM5Njl0WFNSQ0lpSlZ1UVpMa3FpdU5ieVpFclJmSXJu?=
 =?utf-8?B?TXhIeGxaYis3REl2SlZ2Smh1ZXNOWjFrem1tc01yNGw1OW02cHhwR0FDS2VL?=
 =?utf-8?B?NnUyUFNmUEx5b3MvNjVlRm9reERwZWVGb3NhZ0VMUkJGY0swMWRHWlZ2Z2FQ?=
 =?utf-8?B?WWptMjZyVGtVMStmdU5LcTgwSWJvSWFvVXNtRklXSmpXL3ZUU3Q3S20zTHA0?=
 =?utf-8?B?REhPYzZ4QUpBcGZuYjRKQ0xmSGdFa3hiRWxCeTVLaXFvUlRCL1lzbTZBUm1P?=
 =?utf-8?B?elRtVmt6UHNRV2dBeFlYQkJXN2hYZ0ZlMzRQc2g0dm5oOFpCU1RJVEpKVGZK?=
 =?utf-8?B?cVVQdC93ZzFBd0tXZWlTYjdjby9lZjl1VFJQbUJqaHpodW5ZTERCeC8xSld1?=
 =?utf-8?B?TkJ1Mlo5YzNkRGVmakhwNVdIb3RRQTdSNk1sVk95QlJrbGZHR2doRGo0dHFK?=
 =?utf-8?B?SEt0Y3lIdzQ3eDF3UTc0WGRXRld2TytoN2lBMSt0VmN4K0JBZWNXZUlmWlBn?=
 =?utf-8?B?VXJRL1p6dkZRTE83bUE5a3Y3MllQZlpsTm00MWYvWmtoS2lEb1FTOTVGWEU3?=
 =?utf-8?B?YVpoUG11b1hqT1FBcC9LS0N0UmhaSktGQUNacUg0TmdLMzZ3WjNzczFGeE8x?=
 =?utf-8?B?NnJramYzck9TYUJaT0tmMkNzM2Y5SHFzOEpKL3d1QWVwSStHbmQ2TlEwV09k?=
 =?utf-8?B?dFo5RmcwSmRVSjN6Tm9BNDBmSjZnRHEwNGxpaGtROFQwdUdtQnhCTUxXWEVY?=
 =?utf-8?B?U2l5WGppNGhENFJWdjdsUmFuYzhXaHE3Smh2d09NU0xWdGhvZ0pXVi9laElV?=
 =?utf-8?B?WlRSZmxiejdLYXNLYWt4SmhHQ3BYV2hIR2ZqbXZtZVZVcEJDbkwyVDd2cElX?=
 =?utf-8?Q?RBTW5tYclm/ea?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0hsMHNWdUJsRmZXQzBjY0dTdTcxYmZqcTNnOVhVTW83R1pqVmp5SXJQanJ2?=
 =?utf-8?B?V01zeGdSSmR5V0p1SHBsY2N0aENWcndINk5ORHRTeWhoZEZJNXFHb3R4V25u?=
 =?utf-8?B?akJDZkhEL1poMGtVN29VWWZrNWFBL0xSb1NLV3FtUG14TjlMeTN4b0k1Q0JQ?=
 =?utf-8?B?WWE0bndkSDB0c2ZqNjQva2JzNTAxOTJNS1hrQmFTSmhJbEZZQnJxUWxBbC9z?=
 =?utf-8?B?MTJlaWdIOTEvQndId092MTNhUGtsSDRoQUowVE5JMXgzc1NqcmV6NElOV25C?=
 =?utf-8?B?N1Q1TkxGNEtnSW1lS1JKUVBSSEd2Z095RkVVcVkrc1N4eFJFcFk1eGg3ckRE?=
 =?utf-8?B?end4alkreVlCZnR4Ym5YNDlVVC9LMWt0MWxlOVQ3RTdIV1hjWnlIc25ldzFM?=
 =?utf-8?B?UXhDWEowOHlrek1PMXQ5djlHZ0ZUNExmNlg0MW92N0tsRXM0amhBWENaSDFR?=
 =?utf-8?B?RENYSXVjckRSUGpYT0UrL0RnQ0FYSXExc1BNNzkzUDJJWlBZc0VldkhDNlR2?=
 =?utf-8?B?RUFPQ3RGdEJYMjd3VUppSGdTTXJWM1oweHpvbFYzUmZDVjVqSVZPRlBNTXMr?=
 =?utf-8?B?WTJpaWVqaXhyRzN5Z2RTWTZTdVNSWmxYTEtybXdPRDVkT1l0WkErTlBNU3hK?=
 =?utf-8?B?S0RMd3ZJYmkzZUdva29ENmhGdDhRS0E4STQvNkhtYkQ5RjZjcFdERk5tNDAy?=
 =?utf-8?B?cURtdS84bWQ1aUgxYkdEcGlvcXZZT0pkUG1QYmZHaHJ3SXJ2RWdNS2VWRVFn?=
 =?utf-8?B?M21rRFIyM0F5eFhSTEVVNitFYnllaytwQm85OTBHTWJBYXZBYTRLM2F0QnZZ?=
 =?utf-8?B?TVNqVGdnT1Njb3E0LzBLRm1sU2h0QjZUTHRrSGJab2l3WXR1YUtBTEJUSVlk?=
 =?utf-8?B?cE9DclFjOTNtd1BiM1gxYis0eTBXeE1KTVhHYWRiZDBsSDBocnAvL0NidkRG?=
 =?utf-8?B?dmVtRGdCb09UeTJvN1c5Q3hrZlNOb3ZxWEFHSTdJWkJLM1pJeHpkUkFzbHdJ?=
 =?utf-8?B?VHdXcHEyQTQ1S3NCOThFMVhSZkdaWWJZOE9EYkZ4bGt5ckQ3Y2tXdFRzQlRE?=
 =?utf-8?B?OWlnR0R6Z2xEYW1tRFpIenVsZk9KVDdGNnFvYVExRTFGckJuWGx0THZveVZ6?=
 =?utf-8?B?RmNVT1MyZWs3OW9rcWV0bm1NRit2akVvZVE5alMzRDY3MU4xdEVzMHY1UGVl?=
 =?utf-8?B?bmpIbWxZUEc1N2lnZ21ueXNHeWRZNXVDQTJwL29QMkl2SERzTkQxcU5wV2s4?=
 =?utf-8?B?TmdtQ2wybmtvZExNTTlpVURzbHVES1pMTk1jYkd2cTlyS0hsaWdBRUtEWjNW?=
 =?utf-8?B?dDdSdXRjbUM3Rk5lNzRDWjV0Um5RYlYydXd4Y3gwZGp4empYSnBYcldtOTcv?=
 =?utf-8?B?d25iYWxFRmV2aDRBU2pJa0JqS3MzczdmdDliclZad2trNTZNY0hzVk80Y3Fi?=
 =?utf-8?B?RlIycm1vQ3lSdUZoTGVzakNWUlFzbXRlSExtOFY4Z2EyMm54dGhHL051enl3?=
 =?utf-8?B?QlB4NGVYV2owWUZNeFYxUmlXb0FTUFBkVFRzZjFUdk1JekZHQkVSWjgvVStl?=
 =?utf-8?B?QlJ3ejF1bTZsRHZtRlJhUW5ZNFhiTnA4SE0vTXRZdHh6MExZdUREWjAvR2tR?=
 =?utf-8?B?K1lYRGROOW5DWHd3WXpjVGtESmZZLzgzbjloYWgvUWwyMk9teEJSbUdiSHVC?=
 =?utf-8?B?UCtlYWxWc0V4eFhUcm5KRXlsa21IeXpNVGxHM0N2eUVqVHdPWUpMbk9zUFhR?=
 =?utf-8?B?Y3NKTFdXY080MmsrQysvM2o0SVRlK1VubVBXanY5bE1tSk01M05waWxYL2lC?=
 =?utf-8?B?Tjh5UkY5SzlkeDV6OHQ0RS9idGV5b04yTHp5QkxoNjJvVGIrNzdvQVhxZDIv?=
 =?utf-8?B?VUJrZVVVczBzVWppQy9kREhReGZpSE9aVWR6aGpJRDNkcjNkLys5Rlc2NHRB?=
 =?utf-8?B?WDF2SlZGbG9pWWlLQldqSTgyWERtY29WRUhpVmg0SkhuRHFmazVXRDVlbW53?=
 =?utf-8?B?YStPdjNzcUR5ZngxcmNoVC91UEt5SnBIdk9wL2VYd0d6QmQ0eWJOWTdPaDZh?=
 =?utf-8?B?VjRJcE4zNkxqYWNGSW5RYkMvVVpwUmd2Y3AyQzV1Sms2eStTeEVEWnhOTlhJ?=
 =?utf-8?B?c1Z6OCtPbDBvTFZyUWtkcy9adkhtY0VxaFM4OXFkaEQxN1p2YXZsWGVqaWZo?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c1554e-b877-4884-3efd-08dd51f51320
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 21:25:18.9591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0wSF9v4q7UbRJYSKHtc/yrHuADHjhtOryjQ8AFdvECjstFO16tzQTWhWo9G0nNEry9xNSjs9rY9UGLgS35jtxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5888
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

Quoting Gustavo Sousa (2025-02-20 18:23:49-03:00)
>Quoting Matt Roper (2025-02-20 18:10:50-03:00)
>>On Thu, Feb 20, 2025 at 02:25:11PM -0300, Gustavo Sousa wrote:
>>> We have now a struct xe_ip to fully describe an IP, but we are only
>>> using that for GMDID-based IPs.
>>>=20
>>> For pre-GMDID IPs, we still describe release info (version and name) vi=
a
>>> feature descriptors (struct xe_{graphics,media}_desc). Let's convert
>>> those to use struct xe_ip.
>>>=20
>>> With this, we have a uniform way of describing IPs in the xe driver
>>> instead of having different approaches based on whether the IPs use
>>> GMDIDs or not.
>>>=20
>>> A nice side-effect of this change is that now we have an easy way to
>>> lookup, in the source code, mappings between versions, names and
>>> features for all supported IPs.
>>>=20
>>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_pci.c       | 60 ++++++++++++++++---------------
>>>  drivers/gpu/drm/xe/xe_pci_types.h |  8 -----
>>>  2 files changed, 32 insertions(+), 36 deletions(-)
>>>=20
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> index 8b8111e954c1..c88c2da1e731 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>> @@ -82,10 +82,6 @@ __diag_ignore_all("-Woverride-init", "Allow field ov=
errides in table");
>>>  #define NOP(x)        x
>>> =20
>>>  static const struct xe_graphics_desc graphics_xelp =3D {
>>> -        .name =3D "Xe_LP",
>>> -        .ver =3D 12,
>>> -        .rel =3D 0,
>>> -
>>>          .hw_engine_mask =3D BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_=
BCS0),
>>> =20
>>>          .va_bits =3D 48,
>>> @@ -93,10 +89,6 @@ static const struct xe_graphics_desc graphics_xelp =
=3D {
>>>  };
>>> =20
>>>  static const struct xe_graphics_desc graphics_xelpp =3D {
>>> -        .name =3D "Xe_LP+",
>>> -        .ver =3D 12,
>>> -        .rel =3D 10,
>>> -
>>>          .hw_engine_mask =3D BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_=
BCS0),
>>> =20
>>>          .va_bits =3D 48,
>>> @@ -109,10 +101,6 @@ static const struct xe_graphics_desc graphics_xelp=
p =3D {
>>>          .vm_max_level =3D 3
>>> =20
>>>  static const struct xe_graphics_desc graphics_xehpg =3D {
>>> -        .name =3D "Xe_HPG",
>>> -        .ver =3D 12,
>>> -        .rel =3D 55,
>>> -
>>>          .hw_engine_mask =3D
>>>                  BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
>>>                  BIT(XE_HW_ENGINE_CCS0) | BIT(XE_HW_ENGINE_CCS1) |
>>> @@ -125,10 +113,6 @@ static const struct xe_graphics_desc graphics_xehp=
g =3D {
>>>  };
>>> =20
>>>  static const struct xe_graphics_desc graphics_xehpc =3D {
>>> -        .name =3D "Xe_HPC",
>>> -        .ver =3D 12,
>>> -        .rel =3D 60,
>>> -
>>>          .hw_engine_mask =3D
>>>                  BIT(XE_HW_ENGINE_BCS0) | BIT(XE_HW_ENGINE_BCS1) |
>>>                  BIT(XE_HW_ENGINE_BCS2) | BIT(XE_HW_ENGINE_BCS3) |
>>> @@ -175,20 +159,12 @@ static const struct xe_graphics_desc graphics_xe2=
 =3D {
>>>  };
>>> =20
>>>  static const struct xe_media_desc media_xem =3D {
>>> -        .name =3D "Xe_M",
>>> -        .ver =3D 12,
>>> -        .rel =3D 0,
>>> -
>>>          .hw_engine_mask =3D
>>>                  GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>>>                  GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
>>>  };
>>> =20
>>>  static const struct xe_media_desc media_xehpm =3D {
>>> -        .name =3D "Xe_HPM",
>>> -        .ver =3D 12,
>>> -        .rel =3D 55,
>>> -
>>>          .hw_engine_mask =3D
>>>                  GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>>>                  GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
>>> @@ -369,6 +345,13 @@ static const struct xe_device_desc ptl_desc =3D {
>>>  #undef PLATFORM
>>>  __diag_pop();
>>> =20
>>> +static const struct xe_ip pre_gmdid_ips[] =3D {
>>> +        { 1200, "Xe_LP", &graphics_xelp },
>>> +        { 1210, "Xe_LP+", &graphics_xelpp },
>>> +        { 1255, "Xe_HPG", &graphics_xehpg },
>>> +        { 1260, "Xe_HPC", &graphics_xehpc },
>>> +};
>>> +
>>>  /* GMDID-based Graphics IPs */
>>>  static const struct xe_ip graphics_ips[] =3D {
>>>          { 1270, "Xe_LPG", &graphics_xelpg },
>>> @@ -380,6 +363,11 @@ static const struct xe_ip graphics_ips[] =3D {
>>>          { 3001, "Xe3_LPG", &graphics_xe2 },
>>>  };
>>> =20
>>> +static const struct xe_ip pre_gmdid_media_ips[] =3D {
>>> +        { 1200, "Xe_M", &media_xem },
>>> +        { 1255, "Xe_HPM", &media_xehpm },
>>> +};
>>> +
>>>  /* GMDID-based Media IPs */
>>>  static const struct xe_ip media_ips[] =3D {
>>>          { 1300, "Xe_LPM+", &media_xelpmp },
>>> @@ -558,12 +546,28 @@ static void handle_pre_gmdid(struct xe_device *xe=
,
>>>                               const struct xe_graphics_desc *graphics,
>>>                               const struct xe_media_desc *media)
>>>  {
>>> -        xe->info.graphics_verx100 =3D graphics->ver * 100 + graphics->=
rel;
>>> -        xe->info.graphics_name =3D graphics->name;
>>> +        for (int i =3D 0; i < ARRAY_SIZE(pre_gmdid_ips); i++) {
>>> +                if (pre_gmdid_ips[i].desc =3D=3D graphics) {
>>
>>Unfortunately it doesn't appear that we can consolidate now-identical
>>structures (e.g., graphics_xelp and graphics_xelpp) since doing so would
>>always match the first entry in the table an incorrect assign a version
>>of 12.00 instead of 12.10.  I guess that's not really any worse than the
>>current situation of having near-identical structures that only vary in
>>version though.
>>
>>We might want to add a ktest to ensure that we never try to point
>>multiple versions at the same structure for pre-GMD_ID IPs.
>
>Hm... I wonder if we could make graphics and media members of struct
>xe_device_desc be pointers to struct xe_ip instead of
>xe_{graphics,media}_desc. That would allow descriptor reuse and rule out
>issues related to matching the same descriptor for different pre-GMDID
>platforms.

Also, with that, the for-loop wouldn't even be necessary.

--
Gustavo Sousa

>
>What do you think?
>
>--
>Gustavo Sousa
>
>>
>>Anyway,
>>
>>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>
>>
>>> +                        xe->info.graphics_verx100 =3D pre_gmdid_ips[i]=
.verx100;
>>> +                        xe->info.graphics_name =3D pre_gmdid_ips[i].na=
me;
>>> +
>>> +                        break;
>>> +                }
>>> +        }
>>> +
>>> +        xe_assert(xe, xe->info.graphics_verx100);
>>> =20
>>>          if (media) {
>>> -                xe->info.media_verx100 =3D media->ver * 100 + media->r=
el;
>>> -                xe->info.media_name =3D media->name;
>>> +                for (int i =3D 0; i < ARRAY_SIZE(pre_gmdid_media_ips);=
 i++) {
>>> +                        if (pre_gmdid_media_ips[i].desc =3D=3D media) =
{
>>> +                                xe->info.media_verx100 =3D pre_gmdid_m=
edia_ips[i].verx100;
>>> +                                xe->info.media_name =3D pre_gmdid_medi=
a_ips[i].name;
>>> +
>>> +                                break;
>>> +                        }
>>> +                }
>>> +
>>> +                xe_assert(xe, xe->info.media_verx100);
>>>          } else {
>>>                  xe->info.media_name =3D "none";
>>>          }
>>> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_=
pci_types.h
>>> index f46426ef8ed8..e9b9bbc138d3 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
>>> @@ -9,10 +9,6 @@
>>>  #include <linux/types.h>
>>> =20
>>>  struct xe_graphics_desc {
>>> -        const char *name;
>>> -        u8 ver;
>>> -        u8 rel;
>>> -
>>>          u8 va_bits;
>>>          u8 vm_max_level;
>>>          u8 vram_flags;
>>> @@ -28,10 +24,6 @@ struct xe_graphics_desc {
>>>  };
>>> =20
>>>  struct xe_media_desc {
>>> -        const char *name;
>>> -        u8 ver;
>>> -        u8 rel;
>>> -
>>>          u64 hw_engine_mask;        /* hardware engines provided by med=
ia IP */
>>> =20
>>>          u8 has_indirect_ring_state:1;
>>> --=20
>>> 2.48.1
>>>=20
>>
>>--=20
>>Matt Roper
>>Graphics Software Engineer
>>Linux GPU Platform Enablement
>>Intel Corporation
