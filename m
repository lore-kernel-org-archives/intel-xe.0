Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44EEC61DB2
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 07:18:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DB210E067;
	Mon,  9 Jun 2025 07:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WfednR9t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0E210E1A4
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 07:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749453526; x=1780989526;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=gnjoOA1WpGv8Ovx5kWXeHnaPvMAQKIgkxT1NfveJQ2I=;
 b=WfednR9t1GlVMY7N33lYT4RXyxEdIf+/tkuVWIFecZfR5xkp6u3R7cSp
 Sdo523J4WrCMKzBlC1yhzM1Ko++Xsd01BI2Ahw0pfCTTIMr3PtQxU50Wd
 bv1gVCgjM1jlHOSVqYqtKYh1JRS+KohiDMpp9kMFfDIiyD7DVYv4hP1Si
 N1UGGzAJ4+uVTHSRuV2y0vhApkheGHjbTCeeJ6binTBXQzXorYfM4e5Ic
 QqU2N2+9SP6Y+HACO6HM7BNNi+Pofrb5LoxC8deVnQvPCrd9re7au8rZI
 vAoKfEpX17BmvLlLjRKb+cvRfYBWm0PaAxHUQW+mpBHRyrxyqL4M9ZAEM Q==;
X-CSE-ConnectionGUID: ikkBfpBDS1y3eWmx+aIpKA==
X-CSE-MsgGUID: bK5YJUYzT7uUUGUlrQwVSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="55187649"
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; d="scan'208";a="55187649"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 00:18:46 -0700
X-CSE-ConnectionGUID: NLzc75ZDQ/qC885jg2XIzQ==
X-CSE-MsgGUID: UuHVN7MFSMqfSY7NO28NIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; d="scan'208";a="146339540"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 00:18:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 00:18:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 00:18:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.88)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 00:18:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SFAgRgxfuqIeqbTf/MkDeTn39fwBlf7b/1opLsXadg3XElGCUJ7qcWb6Ub/LVUrW0DfCL19kW7Wk8VVdi8vWJ3vqebTpBhSqEiLWTQV5hqC8BEGZheL4wu2SeHKcZGSu4AIkGHvIQNrXy9idJOYmn7pTDM4ylkFyYGuG4Q6xIE3oosHmFKIu3n+sGXe+tncmHqUCALDlk2QWZWvTmr6K/YO0gHX8u1csalKiZBY727uOSo1JN4s7eLeO4MUOfCtq8f4DWTBoxKNtQ398Pt/HWlBsH98MFNhHv67SvyS20W7e7htJX8/RTokAWlhfojBgqZymO6pqj8alP4R0HL8tVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4u03FYoNvZZNPP1UC8Ue3OfNYbcmshuqNlN/nPtxjU=;
 b=weLO/JpoqGuaVRElNxk3JaCSrXiqGlsh93lNNJ0TljeOnu+dAwpRQLi8uQF6XaS9AHr6nQiTY+QbNsPbllXJqPLi/iNaffmQmKBzCazxxIdnxqnsjERn7QE1knFmhSZBQ61di0o/KHbMKY33oDfF3imaFFVh6absFGdxu1zosadAC2YJDXKT/irLrRZBCV338qWgKpTuuUNOMIEP6SrVu0I58MlgffxM4ByMvq7sL+vXZgw7hQ9CNlP1bR7RZPhEUM2eviMHcsBhHteLqMvU54doB0dBv/jTNpamAJTL9huSKM04djCTsbXXBO1wWCu7GBWU+VXkEKje+znmGBW41g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SJ2PR11MB8565.namprd11.prod.outlook.com (2603:10b6:a03:56b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Mon, 9 Jun
 2025 07:18:24 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 07:18:24 +0000
Date: Mon, 9 Jun 2025 12:48:18 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 9/9] drm/i915/xe3lpd: Extend WA 16023981245 for display
 30.02
Message-ID: <aEaKuotfceheCnFJ@bvivekan-mob1>
References: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
 <20250606195104.1771715-10-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250606195104.1771715-10-dnyaneshwar.bhadane@intel.com>
X-ClientProxiedBy: MAXP287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::16) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SJ2PR11MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: 469a7eaa-72e0-412b-cfae-08dda725d256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVN6NmRtQzBKZm9Hb3BmQ0F4MG1YUldqUlhUdVFVdkovTGp4MUlrQzN3aGUx?=
 =?utf-8?B?M1dTVi9tOVRqb3FlbEhMQTZwUnZOZ09OS0loaFRrWlBJK0l2T05mVzY3VWcz?=
 =?utf-8?B?WEordGpVK0IrRkN3NVdPK1IrSWt2dmIvM2RLdU5JK1Y1MnBaYWNmc3UvR3ht?=
 =?utf-8?B?c3RmL29US0E1TG1MamRXNHV2TlFnV2ZqUHpYbWM1eUFrNmI3OUZjOWsxcVkz?=
 =?utf-8?B?YmRMZFd5YUdPUlRmTDZIbWlYNWZJSlVCRVBjcGo0T0o2VmExeEVoTSt5VUcx?=
 =?utf-8?B?QVRSL2Uzb0l5NVRLM01PWVJuZzB1b0JITXBaNUQrMmtORm03YXF0SVRMYjVw?=
 =?utf-8?B?TkhZdnB6MlJvRjg2eHVod29SbUU2MmFxUU5mY3lMb0tMejdXZHhSNEpNK0VG?=
 =?utf-8?B?ZUJkMGtCVkZBQThIeVRVRkxnS2kydU5OSllRYktWOExNN0hsRHNzdVZaUTJq?=
 =?utf-8?B?T08wUXd3dm1ETFYyNDVIVWN5ZlU4MU0wRThmMmVpT1hYRkpkblNzYkZzcXdR?=
 =?utf-8?B?R29wTVlnUTB0KzE2cUJiRHBmKzkreHNNNExLUVZWczNnTldGTHhyOFhkd1kw?=
 =?utf-8?B?NWtZOXkvc0gvSFM0dnFndnJIOWZuTVl1UUh4enVWbGVTekFhYzBhUHpKRVpL?=
 =?utf-8?B?dTdGMlRYTG9oa3lLa3Z6c2RuNUt3VUxRMjNYODBaVFlOYlFRYTNNbEFPOEJW?=
 =?utf-8?B?LzV1ZEVrYngwanZaNjdkWnd3SHNQTktwTHYyZnV3NUZMcjdYQmlwbSs4UXB1?=
 =?utf-8?B?SWJiRnkzck4rb0tuTzdzWVU2UzlNQWpxSGtxVmJLTElGTU5jSjl6N0dmUE40?=
 =?utf-8?B?Rm11Vldyc21JakU5c3QraEN0bTkvQUhZTExVc0tmZW1rZlVQMm5PVTk0T3NT?=
 =?utf-8?B?NmNuYkIrWExUVUVKYXgzTHJ0NmFTaWhhZTNXSUtORWc0eVJtZExBTUYyN3d1?=
 =?utf-8?B?eWlUUmxSZHFWTUJDeVJiT1lrWWwrT3NjbWwvRloyQ1QvYUg3b2FEMFJKU1U2?=
 =?utf-8?B?MTdRdFUxcFA3NGk0OEJLOVVLOVh1UnBKVGpNcWY5OXlQZUFPandqZkNQRjAx?=
 =?utf-8?B?TVFHQjJCYW03b0FQZ1pjcy82ajVoV041dktlTEtld09XRGE3Rlg2ZWl2ZUpi?=
 =?utf-8?B?REVKUEZNeCtmL0dEeEtLQ3A1OERzay9MNGRRUXd5Sm13dXZFR1Y2Q0IzaWZz?=
 =?utf-8?B?QVRBSHV0Z1ZUVHQwbGlkTGwvZUthcENwYmlDM2VSN0JiZ1NPUTBNd2JxT3JN?=
 =?utf-8?B?Q2ZucG5Vam9hc0pQTFl0TWs4UnJueFpVMUJXM2xxRmxodXNpMWFKYmwyQzFo?=
 =?utf-8?B?blROcTdrd1huWE43VTlTNzlNTnBNYVVQZmJYR1VXKzFnWnlaYUVaM0F2eXNF?=
 =?utf-8?B?KzdZZldjbUUxRVdkTXozcnVEZCtaWHhYdTRYQ1ZiSHhCdTd5Y3g0L0hTK2xJ?=
 =?utf-8?B?UVJCZnYzUjNzd3NZd1RFd2loYjE5YnBPMzc1d08xbkJUcWtOZk5tSnd4c1A0?=
 =?utf-8?B?cHNVWXM4ekFvT2Rqakt0MzdWWW5uRDdWSlBaczIvYWxUcnF1amMzUE1oUDha?=
 =?utf-8?B?ODZ4ZTJWU3gyQzluSEFOLy9ZM1RQZWxzVEdnY1VqUlZRRy92d2J0bHdrUmZK?=
 =?utf-8?B?eDEzL2JtOGNwM1hXWlAxMTZXZE5hQm9hR1pMMjZxR05LRWRacVk4MHMrK2JU?=
 =?utf-8?B?czJRU1pjN1IwbXN4TlJ2YTlCSzJZRm5LVWZpSWFxZWVPWGMrRDlaWW1xa2Nl?=
 =?utf-8?B?REJ4TDRNUGVob3BCeFlMUE1ydG9WWWJ4ckg1TWRBTmIxZnJqY2x2UEpvNU5V?=
 =?utf-8?B?c2tzMEJKTllqTXlxOUl5UkpmMEp1YnVXdmVsajRML3VUNG9XMkVkTzJXZVQ3?=
 =?utf-8?B?aFBFSFFNelJacFRmWnp2QmprRDB2STV0WHBKa3E1U1F0NUl0TFFQKy9TMU1s?=
 =?utf-8?Q?JGscnbZXcy8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTNQZlJXZ3ZpTi91MGpLZjRMK2NwbTIxT1dwUWxMK0txZkhPaDRjYk9yVUpP?=
 =?utf-8?B?aTdQQTMzQ2VWVFA0RmNyN0lLcFBEb2hLMW1jOC9jV2RxL0VBWUtwQWpHQlBN?=
 =?utf-8?B?aW9Ma1gyZ256Z01PMHVrQTBjT2d6OUFRQysrd2UxNU5FZ0xENmdzL0wrYVpr?=
 =?utf-8?B?YUpON0xOenlFMHJacEJhbHNLK0RvYzZERUpTVWxxV1VyUXAvZUJiVlhIY0JF?=
 =?utf-8?B?Vlhib3NMMjl3U3BzTWg2RUJvZm41Umc5K3BlS2lzYS83WmIwQ3F0TTc5MVky?=
 =?utf-8?B?V2o0dkY4YU96Y3VSVC83V3RTZjJDL3BkYi9YSmZNVXFyUjkyK0FLRUc5TC9R?=
 =?utf-8?B?RmVNemZESXp3eENXcjZndXY5bld0TElmWW1McFIrQndvVlJFNHRDb3dKaXd0?=
 =?utf-8?B?RzZ0MDdzaDhabDAvSnBldGdOc1cvcW81MFhSeUtUMjdRa2pwcDBCVm15ODRs?=
 =?utf-8?B?Nno4ZmtCRzZES0FvUFk3dTFXT0Y1NmFpZVVzMEtNWkhKazZqa2ZnbjVBcDRW?=
 =?utf-8?B?azY1RXh4endLUzdjOFVVRmZmZ3FLbjNmeFFIaFhwMzlyZFVOK1pkaGF3WjRo?=
 =?utf-8?B?bWhMRDRMMDJuV2w2NmJNMTNxbC8weFdKUHZpZlhuQVBEemYxT2JUeVBDMWk5?=
 =?utf-8?B?NmxwQTlwNVU5VGxaV3ZXZXFENnQ5VmlHVXhhWUZIVmtRQTVGSjFBTTcxV21H?=
 =?utf-8?B?WnRJbENpNUtNY3dwcG1HUjNXekNrSThER0l4YXpaMHgvY2l2MlNmdUVPLzF0?=
 =?utf-8?B?Nk15eDNYbTVMcitPM1pQZ2NGaHZDSUhDWm9ZR0hQc0FKb25xT1NWYnJPM0kw?=
 =?utf-8?B?Q0IweGpjNWg2YUx4VTdHMERpOUM1QUhkVVhuSFoyR0hwRytsSzZEK201WDc4?=
 =?utf-8?B?aVpOSFdYcCt6OG05MW0zOStVT2ZFYkZ4TjRkbEh5M3VhQ1FSWmhMRUVRalZt?=
 =?utf-8?B?bFM3Y1BwVzBMZlZYM0swWWc4ejdTMmg3RGk5QzlsTFZhcFNWbEd0YW9paWU3?=
 =?utf-8?B?cjBlQ2RTS1ZDYXdXUlVMRmZFWnVGZkt5QVAzdCtYZGltQWFaYW1URmpWUWV0?=
 =?utf-8?B?OHE5U3l2Z2JQaUMyTGRPcnNEOWFCK01RaGJIaVI0YTlBYURYd2s2L052eExK?=
 =?utf-8?B?b0VrbERlS3RuSy9VQzlpbXdUaGx1dVF0VCtWT3dmVm1yNGpSRkdMc0p5b0tN?=
 =?utf-8?B?VzJyUXRLSjNRKzlZVHJKQnA5QWFWSDA1SVVpRGxOSW9KL2x1Z0xkbEVKVm03?=
 =?utf-8?B?NFdpNFRpM3BWeWVCUTV0Sk85eGMzV3k4YWluUmVqeWVTVDR2c1hWdXdxdVMy?=
 =?utf-8?B?SEM3Z2F6N0RKWmFIRGQrSmFoYXlUSXBYdUp0UUVBMW9tSFg0OHg4QzNQMk1y?=
 =?utf-8?B?bksyQ0hlc1dSQk5FWUFOYmNKcFVuM2FDSC9xQ0VFM1B5R1hBYU9vK1lSNS85?=
 =?utf-8?B?bGZsMEtOTkxyZUpoaFF5TFZEczNIdGJYY2dpcGY1TGRSVW1hOE53TG1kRGd0?=
 =?utf-8?B?aUdqZHE1K0QzeHJKQm8vM3A3enVDOTk2L1JBOVpqd0t1a1FCSW45bGI1M3R3?=
 =?utf-8?B?NmFQbm9wOUwwcWNHdVB3SzdEVk1yeHZIdXlBcndGUXFIcUxmaklVaDhqM24r?=
 =?utf-8?B?VG9nZVVZZHZ3d3JjcHIyV2tEWjVWaDFDMjBXNmhIZ2MrNTBRdDdVVkdtUlhZ?=
 =?utf-8?B?ZytFdGpNaFBpK2UrYWRBWHl1QkVvVjRqWTRVWVpvUFhwQ2QxMnI5QkY1SU10?=
 =?utf-8?B?QVVUTlBVV2NSeXhJRmxBOHNQd09oMm1iQVFMTHRKWU02ZXRNYjFoSVk5ODE4?=
 =?utf-8?B?YnF2K2FFVDVCNWVmWDZtcHdhNkxFZFd3cmZ4dVlQZGFVRXd6MWJLMFNxbnU3?=
 =?utf-8?B?VHFQTDJFY3BKN0VjcG5jWjBQb0oyenpuYjZpYlFRMDJ4bDdJcEg3aWdGeC9X?=
 =?utf-8?B?QkZLeTcwTFdXZlZyYWhBQzg5NGF6M2RwYkcyVkcydmNpcWNOelF0WGxiNW1M?=
 =?utf-8?B?WW9uQWsvOHFvU2d2eHVvSCt4djIxc0xlVFRVVytOZjlhS1lWcjJ4Q01MT3R4?=
 =?utf-8?B?MWtUYm1XNU83citMSnl1NzRHR21hc2I3WUFWUlA2WXVtTUNzWnIxc0tCcTU0?=
 =?utf-8?B?NUltUy8vUTkwanpaQ3A1dVFYODdCaHV1c29BOENHUEhCTkp6emdlUnNsZkFV?=
 =?utf-8?Q?AdF8vmBoVce7WSnO8qXTPAQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 469a7eaa-72e0-412b-cfae-08dda725d256
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 07:18:24.2139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6g7NRzbdrMBDFISwszzjAO6t/XgeRZfbRWZsEYFpiqVse5IHpqVmcZxjCpInNzF5jyz8zMP+YuWqMBjeTMyF4jN0vQGVNw+HTXKOtQyJZAD+OXLUGkmuFjugSFHH0xnn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8565
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

On 07.06.2025 01:21, Dnyaneshwar Bhadane wrote:
> wa_16023981245 need to be exteded for display version 30.02
> 
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_atomic_plane.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> index 15ede7678636..e0336c79c294 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -1085,7 +1085,8 @@ int intel_plane_check_src_coordinates(struct intel_plane_state *plane_state)
>  
>  		/* Wa_16023981245 */
>  		if ((DISPLAY_VERx100(display) == 2000 ||
> -		     DISPLAY_VERx100(display) == 3000) &&
> +		     DISPLAY_VERx100(display) == 3000 ||
> +		     DISPLAY_VERx100(display) == 3002) &&
You can simply the check to `DISPLAY_VER(display) == 30`

Regards,
Bala
>  		     src_x % 2 != 0)
>  			hsub = 2;
>  	} else {
> -- 
> 2.34.1
> 
