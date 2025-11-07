Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F978CCF9E3
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 19:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D419610E127;
	Fri,  7 Nov 2025 19:27:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YrMPMbIt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAD010E127
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 19:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762543655; x=1794079655;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Rpi5le7Fy6dkmum5BNTyiIgkn83QQ+kwfSQArhLxIjQ=;
 b=YrMPMbItCI4aavG5hwPitEvBNj8xh0rcg+zlZ6mFoQOXrM+jhNVR/Qz0
 t9Up0IOqHw7W3B+GuHKLLfnaB/fVpMaCS+Yl2otvsuY4CLRVRtECpbKBh
 +zTaeOxfKwdb+7nOu1gCzcSLLkUwgG70c4B6g6IDGGzUyL7GdM88zgTwO
 7W6yDtlTJTtUqmx6ErCpRsxA3lKC8t9sjZj7OiR3GQw9Pdf3uv9PBbP0R
 zY9u10nnvmT+KzFx+1YpcMROu7P7XKAfmceQdoHgMmFuk4q2tZRCUce/o
 vJ/3N8ZDO64Ph3FRCOXi49YK38I88gHzuP136CE+tGww0wvu9iQPVz2d+ w==;
X-CSE-ConnectionGUID: VGosauyLT4aFdDwUgTrwcw==
X-CSE-MsgGUID: d2q3b0H0SwSBej/MB+dPIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="74992522"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="74992522"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 11:27:35 -0800
X-CSE-ConnectionGUID: vuq0xABtRkGA6msUebSICg==
X-CSE-MsgGUID: OIR1P6pOTCeX5w++9g4n3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="188057549"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 11:27:35 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 11:27:33 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 11:27:33 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.41)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 11:27:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYj1612l4EfR4laPBbUt2ps9OsSJ8lIADE0DlQZr+8ZO+jhoM0aLRSqKtp1LdlPE+Hj0jKfJWLlDf+itWeIEwKETVmSW1GRTGuUURLgesHjZZANjntBwxUp8VYuCPgQ5fgQKjBZjDwAcHiUjO0e0z8IkJo+UHBTP7hD7BitrTA+vE1egM9GyEiPml0bf6qvwYl4dotQVDXADhJ92AusjPATfkBuIYw4+B1D0SL25rQGg62Dg35pE5N+JqwCbERgJ56gt+MGqHJrHzPCeDE8qlxqer7parQ4TM51X4wijBatkLR6RPA8cODDXIpsLFs9U3X3iR26e9+ed+1a+aBeyZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpjewhS3mcNJfBkWjxSOG7TSGXCc+eMtoe+cxH4N3VY=;
 b=sJOHfncKCCzIkOyFg0TN6I3rgFbJCgUJpCVzT8pLzxejax8gWAv2im4mpQGK/tDswFuY9oewUJ5VQC1+umlSWDbSznS5HlOlE72mxXQSfpT80u1w02LYDhWVwcsbjr15iI9stDNJgVs2fxNx0s2ARw0iNsyB7NbdQZF5vyWjjfjVBEhU1RUKxq/RA+BFj3W/Ith+7ndy7u0t140PH593jsnsNnv5rYW+jcHN6DjjpvJl6ztq+R5mOdAP5DGTUx3ZcsRNnCqAN3v3+znbt1KNdbBUa+DtNLbSPi+60ZpdsyHfR2SU4HhGP2v7gF7VcHCMsx7xYn1yzCH32t3InXh6FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY8PR11MB7057.namprd11.prod.outlook.com (2603:10b6:930:53::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 19:27:31 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.015; Fri, 7 Nov 2025
 19:27:31 +0000
Message-ID: <b93f3fe5-a39c-4e9f-82e1-4f3e1e328161@intel.com>
Date: Fri, 7 Nov 2025 20:27:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/33] drm/xe/forcewake: Create dedicated type for
 forcewake references
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
 <20251107181315.631642-39-matthew.d.roper@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251107181315.631642-39-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0460.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::21) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CY8PR11MB7057:EE_
X-MS-Office365-Filtering-Correlation-Id: c5ac9c78-1946-4aa5-c82e-08de1e33b1e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Yjd6OGlEKzJYUEVzWVNPR0VqZFdTNlQ3Z25SQy9TcW4venE0YkQ5eUtlOWlk?=
 =?utf-8?B?bWxGUld1WlJOcVQyYnI5UnVKNGZHS3pyTUhldWtMSjE3cXdFRTJ0UHc0bUdx?=
 =?utf-8?B?ZWRJNlg4ai9jdGxRUDA4QjVBK3RocTd5NzlBcGZnSFFrMmN0ZWg4TXU1NERS?=
 =?utf-8?B?RW1taXJtOVNxemdyQmRoM2VGMWlXczN0RURyTG1ISmg2WU9lZEJoUjk0V24z?=
 =?utf-8?B?c2JLZUlGSzVpZkNPSkZCNngzL1lQWVFKS1FlcytDVFIvYWEvTXBOS1c3bVhH?=
 =?utf-8?B?dTFqQWQvUURvdWFNYis3NWJBRUgzU0xrQ2tlL0JOVGswQnFHeWJPaHV4bUJo?=
 =?utf-8?B?eERLVlN3YittYlIwUHdGWFA3VFRoVVJBRUw0QmFoUnlYN2cxd2s0eXBTNmZX?=
 =?utf-8?B?Z2ZSMEpVZVc3dUVzdzMwZHRPQlUzZ2FHdFFYZE5zVjlwK1VPRjZ3SVBIZXBE?=
 =?utf-8?B?bVFoRkttaTRqamREdi82Mzg5U01rMWNPSnRaYU9JMXBwendVaE1aZG5ISU56?=
 =?utf-8?B?QytPdTMxSzFtazhHRG9jZ2N1M3hWY2pXU1pFTXA5V1RrUXQrWld4MkRRQXNF?=
 =?utf-8?B?VGNKUkQxWlVBU1V0QlpPaDIwTTZMdmxhUDNkT0p5U21TbXJJWmVLN210UFpW?=
 =?utf-8?B?VFlibWwzRnR2UlVQM09uUXVUclZvRVgzYnVlZHgwc2ZtajJqK1M5czlZR0Q1?=
 =?utf-8?B?NW9RQ3RZM1kzR2lyeDIrM2tCSGtnbWluV29KR2dzdnNTSjNreEZuNEpRZHdR?=
 =?utf-8?B?a0I1UnRJMDVBMExDNHpwTTFjS2RMT0xzNDhjTnEyRTZhblN4a0VFRWQzVFFS?=
 =?utf-8?B?OHNIaGU1blA1WCtJZDJTd0RwSlJYTkpHMUN5TVhEbjZyb3pXSTFxNlVUYU85?=
 =?utf-8?B?dG92dDNWUFl6WTh2Zk94UVhwSWl5a2JaRnJudGJmY2xoSXcwRE5ycG1qMkRu?=
 =?utf-8?B?R3c1bUFJK256QlU1M0xVR0l0UlNDUzRqQjdnU3NlRTlsSEttUkhqUnFSM0xO?=
 =?utf-8?B?SXJIMGpvSzNPWExWL0g5TUZ0R3V1R044bXhiVUxwS1dqVTR1SkZZQ1E3VElS?=
 =?utf-8?B?NXRSL1VDcXVoVkZmN0V0Y1V6RFJyZnVZZVZBQ1gzdDF5cFdlVTF3NE1EemJZ?=
 =?utf-8?B?elh6SXkzQzh2T29zRzhmQjdtbll1bHhRazdOcmJyeFkvOUx1MkFNaHlMbXVj?=
 =?utf-8?B?YWZFZ0xxczhpWWZ1WjlVMGxoTWNVMk9FL2xnZmRoK2JRSG00ampWVlNjR1lk?=
 =?utf-8?B?UjZPMG9YaFQ0eUwvRXdqU21ORUc0QzExRGt3VE5vb3BXRC9OV05lZGh3S3c2?=
 =?utf-8?B?SlFXWUdUTVFuTFZnWEdXM2RFendVbHhwZCtVdWlXcTVYMU5jYmNCSnBJSm5N?=
 =?utf-8?B?SWdPRlExUzNzcTdqWFVyNGpVNTFHejNBUXljeDQ2WDlOM3h2RjNrWW8vQTZz?=
 =?utf-8?B?bWFpdzI0L0gyZFlUVHRwZ2RFa0VyWitmTlJKQ3JLenZORDVrV1ZaMjNrNVhR?=
 =?utf-8?B?ejJwbUREKzdKdGtDNzlBVjViVFNnb1JIV2ZHTTFBWHBkUHdkRG9zN293Wnp4?=
 =?utf-8?B?ZDhxQWpQbEE1RE81K1BLL0xTQlJNd2x6TEdNYkowTEpoRXBHVWlLK0dkQlNh?=
 =?utf-8?B?Y1QvNGkyV3F2UitrRzA5WDQva0JLOHJFQTIwUEdoU2NKM0pVYUlFeEVzUkh3?=
 =?utf-8?B?TUZ4ZmQxVVpPWnV4c1VFYjJheThJY3pGTTlpc05VYnNJOCtlS2lMSzMxTmVX?=
 =?utf-8?B?VkVadXVEUlFRakV2YjhkSzZpczRwSmhIY2J4NElhTUR5S1hYSm1QQ1RkTU9v?=
 =?utf-8?B?blUrRFg5bDlaN1o5eTZ5c0FRSTJOaTFBY1JtUDVnVTdjamIrQUlaK25UdzRY?=
 =?utf-8?B?Q2FETHE5azlQNUpkclM4LzJVbEpjTGpCTGNoRHpqVXJUcFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0dvcGhETkZmRklhc2ExNytIYTV2T1FUVFM4NDNnaVZoRFZ0QmxneVFNMFZT?=
 =?utf-8?B?Q3RtTUVxTFdrc2hGS3FKNFBoMmtyL1NBOVRIS2NZRysvdUdrYkFXTUlNL1N0?=
 =?utf-8?B?S2d4RDNBZkRCVm1Uays3WGllUGpnbmJvem9HcC9xY1BJU3ozYjNYWG5DQWky?=
 =?utf-8?B?ejkrSkdqK2ZCZy9jR1V0Tlp3d2tjTU9tcCt1UkVoOWhMYjQ2djZtaS9TNGFM?=
 =?utf-8?B?dHk1akxrQWUzRHJSRVFkejgwc0JRSWFzNFYrYmFqTmhzR2s5T1k5M3gzNlZG?=
 =?utf-8?B?Y2JPQVdGbEt2WStmR3RnaWREYnNOeE5SYVJMOHNKekZWZ2JrRzFodFJ2bkFX?=
 =?utf-8?B?RHdQRHFib2F3RVV0VFZNODJMcmgxdjJwR1lWSytXU29zaWtFanpQVklGdzdk?=
 =?utf-8?B?OVlBSkFmRUczWWVaYm0rczRiNE9MeXJQRUppSkozeVpuVlh5QVJoUnpaWTZG?=
 =?utf-8?B?aXF1WFNyRzlrNFU4SFZic1VvZkt6REh1ZThKY2dBYUo1UVphNHd0NW1Wb1h0?=
 =?utf-8?B?RzEvQ1NnNVpFc0hhTnNxanlrek9BMGk4QXd4ekZ3YkpOcHhnRmhPNEg4U0xw?=
 =?utf-8?B?aktoVlhZU3YvbExlTzNDbWQ4S2k1ajA0VnlzV2ZlNkk2cW1IMFc3QW9OSFJO?=
 =?utf-8?B?WmxmbDdiY05uRWVXZ2czaXJ4REgvVFFrOWpFWXhyd285U3VvOWluM08wNlg1?=
 =?utf-8?B?SFBTRTBMM04zUy9EU1dlYWhCcUN3eENXV1N3dEIxYTlEa2NVZFhEWnVEcjQz?=
 =?utf-8?B?VjRwbTNWWlFJa0wvWnJOV25IYk5KU04yUzJDRXhpYnhNM25KTStxWXJveTVP?=
 =?utf-8?B?RUJuUEZwVjZCUmRqVUU4K29ZQ1lKdWgrRXREeVJTSjhGSmRDYm1BbXNIcmEz?=
 =?utf-8?B?SG1nVGdGTHpGOVcvUERWc2x5c00vU1VGcmRTQ1huenRBbHNaOGZxQWZBcHBs?=
 =?utf-8?B?ZUZpaVFNUkdyZlJtM0oybkVNTUp6QWhKa1lWU3orRmtsd3ZsT1d4ckFWOW1l?=
 =?utf-8?B?eHJ0OGZLRm5ncWE1UlZGQnNSWmlWeW9rQUppNHE0QWhpYWdCNnI3VjkvL2Rh?=
 =?utf-8?B?UnpOVEpLUXZHTVRHcWxSNVd6K2hYdkpmbzFScStOcWRQdHhZMGJKNm1tSVk4?=
 =?utf-8?B?NG1jWmxrNWJ1YStZbGFiMnBhREh1bUhsNlpOdGxpQXMvOTdNZEpua3dUc05P?=
 =?utf-8?B?Z2d4QnJCbDJQZDh5RC9rVTNTSEpIaGVnZXZUMGxkd2ZQamxOcEo2Y2RWTS9l?=
 =?utf-8?B?R25ZbXRiQnM1SkV3ZzhWVWl6R2xLWGlFbDB2VVFYYW1FdVNsQzZjSldrS1BC?=
 =?utf-8?B?eGRMdnZYTzBwUW1ld3JMUFdEb09jUTdlU1Q3Q0xQQktmeFhmWVEvdXJBRG1V?=
 =?utf-8?B?WU8xbExQWmhwaWVFN0dPVDhKVUFuajk3Zm8rT1NOaklwaVJONHlDWFUvbVhB?=
 =?utf-8?B?WlZ3bUpsSUU4MnR4Q3dQUnVDaTdzSjAveEU0QTVXMGFIc3FwYWNGZnZLNElw?=
 =?utf-8?B?d3ljakhTZ0FoSllGdmhRTVdUTTB5NjhUU3lUZ0IrM2VuRHVSZU8zMjh4MDVj?=
 =?utf-8?B?dGwzaHhSSm1OL05ta0VpUERHclpaY2Nxd0p0cE9pdDhpRnJNeUQvTDJFWWJ0?=
 =?utf-8?B?NmFrb0Z3WlBnR3BTd3N6Sk5Zbnlxa3AxSXRla3VrZHZpVmEzSzF4dzdJQ2Nx?=
 =?utf-8?B?aVZ4eU1jbm1mdDFZVUxxVXBGYTRzekRtT05XNUZKeE9zcWd4dHRBazFENjZN?=
 =?utf-8?B?bTF6aElIR1FWaTNlZXpTUExaQ2JxZUQ2blNlb1dZTGFXZHVlejU3QWlaZUhl?=
 =?utf-8?B?RC9ueUE3c2hyc3V0V29RbGd5VUJOZkdwVk1rMHcxaUhBU3RGNW42dVJVem9K?=
 =?utf-8?B?RlIzWGVYS0VYTkJ0T0NNWmNYUFpyOVZZTVIybzQzRDNPRnJQdk8xMmdaQ3FG?=
 =?utf-8?B?aElVRVNjNDRhMUtWWGxqZGlXUDE5ejFqWjFWU2JqaTk4dDBEYng5cTVhUCtk?=
 =?utf-8?B?ZjFCQzZTMHZ4eExFTDUvcEhpNEp6TmVuVW1OeE5xc0dKYUU0YndxK2F1clB2?=
 =?utf-8?B?QVpVTGtkQ01IdjdVSmcyYThFeXJBVFdpREhEdmwrQ1hUcXY5eGs1ZW11Mm9K?=
 =?utf-8?B?ZWx4UllrVGF2bjgyaWFuN00rUVBaaEdqZ0Z3NzViUm41aGFTektONWdabFRr?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ac9c78-1946-4aa5-c82e-08de1e33b1e5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 19:27:31.1859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Hv+nkv7x17H4q9hTmyw2vMsJJbgXvQlVBiN89DXGl811UMLdyItFIEQvJW+GpUS/miSpwYfe1z2saayrmLxdJkQQ3tEvD0R5BOAOa/OLFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7057
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



On 11/7/2025 7:13 PM, Matt Roper wrote:
> xe_force_wake_get() currently returns an integer mask of power domains
> that were successfully awoken; both this mask and a pointer to the force
> wake collection must be passed to xe_force_wake_put() to release the
> wake reference.
> 
> Create a dedicated structure type to hold both the mask and the
> collection pointer.  While this change does little on its own, it will
> make it easier for us to add scope-based cleanup of forcewake in the
> future.
> 
> FIXME:
>    For ease of review, this patch contains only the manual changes to
>    add the structure and change the get/put function definitions; it
>    does not build on its own since the rest of the driver is still
>    trying to call the get/put functions with the old signature.  The
>    next patch contains the coccinelle-generated changes necessary
>    elsewhere in the driver to adapt to the new interface.  The two
>    patches will be squashed together when applied, remain separate for
>    now to help reviewers.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---

...

> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index 0e3e84bfa51c..86e9bca7cac9 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -15,9 +15,9 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
>  			   struct xe_force_wake *fw);
>  void xe_force_wake_init_engines(struct xe_gt *gt,
>  				struct xe_force_wake *fw);
> -unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
> -					    enum xe_force_wake_domains domains);
> -void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref);
> +struct xe_force_wake_ref __must_check xe_force_wake_get(struct xe_force_wake *fw,
> +							enum xe_force_wake_domains domains);
> +void xe_force_wake_put(struct xe_force_wake_ref fw_ref);

but is it really necessary to change signature of all existing xe_force_wake functions?

in my previous attempt [1] this new helper struct was just initialized inside the CLASS
so we can start use new approach and still use existing xe_fw API without any massive changes

+DEFINE_CLASS(xe_fw, struct xe_force_wake_guard,
+	     xe_force_wake_put(_T.fw, _T.ref),
+	     ({ (struct xe_force_wake_guard){ fw, xe_force_wake_get(fw, domains) }; }),
+	     struct xe_force_wake *fw, enum xe_force_wake_domains domains);

[1] https://patchwork.freedesktop.org/patch/625116/?series=141516&rev=1


>  
>  static inline int
>  xe_force_wake_ref(struct xe_force_wake *fw,
> @@ -56,9 +56,10 @@ xe_force_wake_assert_held(struct xe_force_wake *fw,
>   * Return: true if domain is refcounted.
>   */
>  static inline bool
> -xe_force_wake_ref_has_domain(unsigned int fw_ref, enum xe_force_wake_domains domain)
> +xe_force_wake_ref_has_domain(struct xe_force_wake_ref fw_ref,
> +			     enum xe_force_wake_domains domain)
>  {
> -	return fw_ref & domain;
> +	return fw_ref.domains & domain;
>  }
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
> index 9cfa28faf7bc..26df4adba4c5 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
> @@ -107,4 +107,19 @@ struct xe_force_wake {
>  	struct xe_force_wake_domain domains[XE_FW_DOMAIN_ID_COUNT];
>  };
>  
> +/**
> + * struct xe_force_wake_ref - Xe force wake reference
> + *
> + * Represents a wakeref for a subset of the power domains belonging to an
> + * xe_force_wake collection.  Returned by xe_force_wake_get() and passed
> + * to xe_force_wake_put().
> + */
> +struct xe_force_wake_ref {
> +	/** @fw: back pointer to force wake collection */
> +	struct xe_force_wake *fw;
> +
> +	/** @domains: mask of individual domains held by this reference */
> +	unsigned int domains;
> +};
> +
