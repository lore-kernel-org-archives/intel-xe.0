Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583A0D3F091
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 16:35:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1957D10E2CC;
	Wed, 28 Jan 2026 16:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f0LeLJGv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE6A10E2CC
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 16:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769618127; x=1801154127;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=r7YSxR7jqaKmRKNwPMUtm5fxoyvWZ2D5wk90pgvaeFk=;
 b=f0LeLJGvOqGSh2ydJPpgBYgE8iuyqtALdSfkObnr5emFyYe7yscdymnJ
 B5kd3j9EhyxLG9vc2IaxjfVA0w1sQ5R04clGHpmlGK/ulmIe3wTLp2mLh
 uhGsDzlj7NTBPAKY3jjfKJePXDhS0cKMOfCd7ljWbhBRTXR5etiAUmP5g
 9rOIa9wvNaB9gvYihY6OLMTHMJq1AMkG+gVhPUWMHlYrEl11hQXID6moF
 AnUkoGPImsOh8KwLs+s25bnb5VbiLa0gkXJs8WfCWTA1kY+b4kUPg1v4N
 8lCoXEhGRunRP0P4d0EsQ+gQ7dm91uCUznSSoPdwWuDNwo21PdpzTjw4b A==;
X-CSE-ConnectionGUID: lvwdZCsuTDqhruMo4KdWiA==
X-CSE-MsgGUID: busc1Ey2RJedAphRjnDlTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="74461191"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="74461191"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:35:27 -0800
X-CSE-ConnectionGUID: msyjpr9FSO2WGsfokhSd2w==
X-CSE-MsgGUID: +oMkWK/WTA+YTNyk47A0sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208747828"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:35:26 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 08:35:25 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 08:35:25 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 08:35:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cIzH+v1bmqScp5DEB53jUClDcGhVnyMWhgLFf0zSo9ti1DA+wvbZ42RaUZ3hA+80QlZ/rHbg0TeLmevdhu29EoF3V7fIn8eSGNLFKa65stJtxfhjhSMIpbmQDuZnnKDXI6pX7jy30q7OBgZW4Cdhl35Nq5ATIR9Zjff5xWnj6R5r96WKCiSHh5Z1fqoLJhUV+KdRqfYbQ94HpizPn/rivOW9maSqe4GOHFq4o9TmzGatXuJYoaNi9ut/Fi/nG4EhlyGrCOQZyaMDGh9ihSDLhG8xSt1zcVFJ6ACA1WPFJNsSZZo5arXAY/+gF5LfXoWR8b2tXxFtb2A4ByfHoBEOSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9PPw4n4b43s9+juXzjaYKnepQRMRzFwlwY/LDsjd3Y=;
 b=EG0r0yUeMAqnreXrlVckZEPGtFhro74r/jrGf/K2FgY1W3GWVKUwrYMjNsGxszkboLiCx3zgvNUvkqOCzVkjgpA9kLfdb9iSLwj5f7aicq1ogD4DohWSY5escXteTPmx3QMIzWxdMl93MGY2/hwukVb3yqGuMITzOfsQ29/BnZ+j+QrpHxj4DdLyfxgF3BMI3Kr4mG+YOSOibYsr2HEsVC5W8+/gxUM49KjbcoZOiSYzoyQBrnOQNhcFK45YJmDgRHjgsn+r3m6SndnegZ11rEBCqOB+76gPADDhXWTjkOr1IMCbZc7+Z+dlrB2R6uKnLm1VTWZgTjATfG3R1zwKBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA1PR11MB7197.namprd11.prod.outlook.com (2603:10b6:208:41a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 16:35:19 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%5]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 16:35:18 +0000
Date: Wed, 28 Jan 2026 17:35:14 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/5] drm/xe/configfs: Add sriov.admin_only_pf attribute
Message-ID: <20260128163514.snhhdbgdwzchu3x4@intel.com>
References: <20260121214218.2817-1-michal.wajdeczko@intel.com>
 <20260121214218.2817-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260121214218.2817-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR06CA0133.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::26) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA1PR11MB7197:EE_
X-MS-Office365-Filtering-Correlation-Id: b2966b56-f02e-4775-6025-08de5e8b38ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azVnSUp0Y1VicnlJbEl6ZGZJcU91dG1VWk5LYk83RWMxOXVaVW9pU1hwRHAy?=
 =?utf-8?B?L2RQaFhmSGh0U0ZNOFYwZkpwQXNzY05waEpkZGpMRGdBcHN5b1lCenR0WG5j?=
 =?utf-8?B?UHRqTFhtTS91Uy8zRGFxVWR3MTVTN3YyR0V3cThOeXhoSGtnT0dJY1ArQWJP?=
 =?utf-8?B?TE9tNG9DY2hxbXhDbk1scDhaZW0wNytyQXQzVE5QbFVRWmdwcWVJbUpjUFNz?=
 =?utf-8?B?LzVoSnozZFpuWFRVd3Y3NHZiT3RlMVRsMHdNYlRPN3hJWDVKdWlBekdBWWpW?=
 =?utf-8?B?aEwrcSs1N3J1WStDamsxcjFEVVF3b20vMDdqZStSOUY0ajBFcWFuVm1wd012?=
 =?utf-8?B?QUlFRDNzYTc2UlNsRWxoVkZTYmEyU3JYUEVZaTMyZjdPenBKN0FjS1h1cXY3?=
 =?utf-8?B?RWNVME5HcWtsWC9CcEVFYk5RRm43dTJnM0Q3MFpaV3hnRFZkZlAybGxpRUxV?=
 =?utf-8?B?TEw0SU4va0VXa3AwcVlsZndBRnRhczV6dGd2VHdsM1llcUl1ZUlVY3lLVHZw?=
 =?utf-8?B?N2o3b2N3dFNicGZheFFvWkh6b3l3UkNwOERWajA5SC9EVTI5QkZ6R0NmVm9H?=
 =?utf-8?B?YktXN1UvdmV0UW85aWtzWVdtUTNFVFZFU0MxaU1DUlVHK2RaMS9vYnRKRUkz?=
 =?utf-8?B?dHN0SlY3MUdmZER4Z2xORFAxY0xBalBFUmV1ZnVZbVdMN0E0ZWUxTURjVzVl?=
 =?utf-8?B?TnNkS1FaaUxkbi90VHozazVxZk5YM243RGNWU1BDV1QrMm42WktlY0JFOTUx?=
 =?utf-8?B?b1RKVVBNYngwQnVzTkxid3pEb0tRaXRZdSsvMjZkNEpPeFpCS2ZyWit5c1Bv?=
 =?utf-8?B?SlcweTRxOVpUd0llWW9JckdNTlBjSHZnZ2ZlUFVqd05vOUtqYzFtVWtMclRm?=
 =?utf-8?B?Rk9FKzBXVm5Za3JQUEd0cnBzTGxUcW43em5idWl1TzUrSzI3Z2JzdGdqY3VS?=
 =?utf-8?B?anlHZU04d3ZseGE3aTR2VDJMd01XbmVGdG12Tjk5a3JDWnZ5UTFhdlZIVitO?=
 =?utf-8?B?VHBnOHFuN0dkdzZqVURXeWRMbm5wYWJRdUNpeVFxbi9lQWtXR3g4b21vOC9i?=
 =?utf-8?B?NjJQeVhHZ21wZnZGMURvVFV4eDlSQkpxNmxsSTJQdHFRTnVWdHVnbGFWZzdN?=
 =?utf-8?B?YmE0d2tHU0FkSHRWSXRKWXZmdW4yYkhjYjNNWHMvME9icFJJVWRtNkdpbUJn?=
 =?utf-8?B?UnNjRnowYlhzQnlzTUZRT090cTZMbE9pdXBHcWJTQXVOdXdJMHZjNGJNVS9v?=
 =?utf-8?B?bUtEYzNkbVVQd3ZDRjhZZWduMndpcEIrRHJ0MmdYMXBGK0xmYlZYWnJDOU9y?=
 =?utf-8?B?L0FpRlZsNHZZMVNkWWwxQzJFMUt3K1hUbkV5OVp5dEtMWlNhR1lKYlZ5OGlH?=
 =?utf-8?B?dTlzSStRZlI5eVZQS0lQcjRZWGlWMXlaeHJnVGFHZmQwcStDRjFsS2d3SFNU?=
 =?utf-8?B?WGFyejBsVStDeHUrTHQ1NWFoaitPd0VsQWFuMnJpMzdiYTZPdzB5Z0lzNUJH?=
 =?utf-8?B?cm1HeFQ5Vy93MGZGQlNFUDNJamg1NGJ1dzA0MlorTHB0SUR4TzF2RG9welJL?=
 =?utf-8?B?V1JMV2FKS3BFNitIUG5rR0tSczBZSUVNSnE5elFROFFLb0ZoK0NQTC9GOWlU?=
 =?utf-8?B?WlJuTHk0cWRhaDJ5OW8vckM0bVJ6T0RKcytzWWRGTmtMeDRHWk9yOEM1V0Jn?=
 =?utf-8?B?bFRZakdKcDVGVEFVbnNyOVNpQU1FWHJ1NEt5UmhVdExrZEJ0LzNRYW1JY0NZ?=
 =?utf-8?B?SnkvUGhsVjcyc3ByOUlRYmpJYllXUGhVbVFEV0FnajZ6TmxWRDYrNVY1Y0hR?=
 =?utf-8?B?NllyS0dTMzg1TUJXMGhMZHZzdFJXQTBXcVN0OFdScU1iVHYyNEpZTWk3c0dZ?=
 =?utf-8?B?M0RpejBINW9BZUlqTEt1RktEeEo2N3hFQlFheEdPSDhzeWdpK0ZNc2o5UTlO?=
 =?utf-8?B?d3VrbVBGbWQrZUZtREJuUTJpZ3Y1V3djOWdCS2tWci93aVA1R00rOGprNHJs?=
 =?utf-8?B?NTk3ejl5ZGlsbzlIbXp2QmNRcTNOdDFjbE1wampOZ3k3dXF3THJ1bTlEb2Jh?=
 =?utf-8?B?dWR5UG9QSm1CVStlbHBIbW0rSTFoMURVRGdFWUpRVXU2Y000ZzVRSVJwcVJ5?=
 =?utf-8?Q?OZWU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0lyZUx2ZlpMMTdWS0RyeHR6YUF5TzFHc1N3RFFITjZ1VlI2TEZPT1F2Q1c1?=
 =?utf-8?B?aXBOWXovUTNKMUFYUTBuNEs2cUxDSGxkUVJrVnBIRHFYTC9XRGdYRVNTZEhN?=
 =?utf-8?B?TCtSU1FlUGFTd0k3NjQyTS9rSTJNeHczWkgwOHJYS2Z4Mk1oWk9RcUIxcHpm?=
 =?utf-8?B?d2NEOW5nZE1xK3JuRmZvTTVVbjZCbEh4VnRkZ1dIVVZjOVhLY01keFNaK1Y1?=
 =?utf-8?B?OTBlSXdZcDRVR3g1R0MzeTdrbytNYkFvKzZHRm1vWmdyZEhXUDNObW10WGhL?=
 =?utf-8?B?d0xXOHE4ME5aRUIzbUl6MkFZbFRRbmJaaHlyUmMyaXdIekhXRVpBenlrTUZ3?=
 =?utf-8?B?eWdQMWlScmduZU1lUE9PNFk5UTZFUXZRc3B5emVBMnJHVlR1UXQ2MU12eFJs?=
 =?utf-8?B?T3lSMVBSZ3k4bmJocVVOdm9EVnhQU3ZoMVQrSTN2bmM2NnVKMEN2bXBhMDh2?=
 =?utf-8?B?bnN0Nm55dUs0a2tJRlFOQWZuNVh4bkoxWEZkSExlMDE3eXJEdGhSZm1WUU1j?=
 =?utf-8?B?ZnBDNDNZOXUvVm4zdnNqVWdTN3N5eW5QVllPWjV0TUUzYlllck16TmxERVdV?=
 =?utf-8?B?OFJ5Q1dnNno4Yk1NbHR1OFRhczVOL0I0cUNHcE9lTEt6UnBqMkNIR09pd3JZ?=
 =?utf-8?B?ZDVXYVIwWDVWY0c4NUYwSkNaVko4QU9MNHBXeitvV3MreHhpbnNNVmJEMWNj?=
 =?utf-8?B?cE9lSWtBVzZUSHg4NHluclhxL3kzQ2NYNkVQVXgwL2ZMclJ2c1JFMk1Ubkxk?=
 =?utf-8?B?WkJ0RFZrdzYzRmFnMVA5bzBsMkFwUjA4eEh5bGJ3TGsrT2FodUtRc3AyRlZV?=
 =?utf-8?B?SHFLU29uQ0UwZzZTR3hQdnFEM1UyaytocmpSc0sxamNZSmlaVm5kaWJtUitx?=
 =?utf-8?B?N25rVG14K2hUZlFLUzdSNUNIbG1mN2REY0VUK0dQR05vRThGUitPT0ExZnM0?=
 =?utf-8?B?MmluaW5HaThSajVlc2FmbTJTUnZmb0k1Zi8xWS8vTm5jd2kyd2d1Mkdld3pF?=
 =?utf-8?B?MmhHSHEwV3pxNDhhdTByeERTR0ZFUG5wTUdrajZ3dFVLM2lPSVJmOVdsMVZS?=
 =?utf-8?B?QXUybDFtQ1h4TXpCWGZSZ3VxTk9PUGE2MEZmZ1ZnQkhjYnFGYTI3YzVodUsx?=
 =?utf-8?B?OXBLUzhWUlNLZVEyWnViSFJzemwrR2hGSkE0bVhsUVVEZ0ZFRzZjNHhCSWlR?=
 =?utf-8?B?MWlpaHlWUXpHdStHU1RTbkFiWWM1ZnF5QXd0NTNoU0NqQUcvOUFQVWltS0lL?=
 =?utf-8?B?ZXhXUDFQMDhTTEF0NDBnVHRBNkRFSlV3N0tKL1BJZWlNWlA5VE1FakphL1k0?=
 =?utf-8?B?ZjhGeWhlcDhBZFEwd085NHdjYk50d2tMMEZRTnQyUmRuc2UxVGp3NWg2MlRw?=
 =?utf-8?B?WDdVVFREU3VvdElGWTc1S3F0MmJQYTVHV3pHU3RuekVNRjhMSXVjT0RDTTFX?=
 =?utf-8?B?RVVBSnVWV253MWtWK3FrYzdWWDVlQWd3K1Q0Ykw1Y0dMMFR1emZCTVBoVUsv?=
 =?utf-8?B?MlNjUWNQc3o4QjMxckxRN3oyckpaZHhMV2NCMWZId2ppSXJtbGtFYkdraDlK?=
 =?utf-8?B?bmZqbVc0REU2OFF6dlJ2NWp4ODJOM0o4YzJKWUhGdkZSU0NYQ0N3SEV4NmMx?=
 =?utf-8?B?bFJRK0pjKzZhNmdtQ013Snk2akc5UzROanYxbTNDK1R1TkM5c2NoZzA1ZDdK?=
 =?utf-8?B?RUJUeTdwUGdIRHMweUVnK09mb09ZQWQwbFpWNWRvVG5oQnJKODZqVHIxeWhu?=
 =?utf-8?B?dWpFT0djUy9DL09SYlptTStrWWFWNGFjZGJlNXV6U2gwRmNuK1BSbHBKN09H?=
 =?utf-8?B?bUtzaGNyeGhnQm1ta3JLSEF2SHRpOU4zbFh0QmJPWjk0ZDgvbXF4ZklyMlVn?=
 =?utf-8?B?eUthdnhSRnlYemZoQTlaVTVsUmtkdWt3MGVVdlZqNmZPOHpsUklnck5lV3F0?=
 =?utf-8?B?WnhYY2UrTHpjamJKc2tYaWNvcXZURUEraHVDNStyWCtBdWhlVDNQV05XWStJ?=
 =?utf-8?B?VWtSSXRrUW5MR3NQSkF6UlVxQW1EZHU0VjIzTy9CVCtrU0Z6Z0lyY0hlajBL?=
 =?utf-8?B?Zjl6a3hzU1lPK3hDQ0M3TGllTnF4OWczK0ZOd2dFS3pCYmxiR0tjWjlnWjlS?=
 =?utf-8?B?K09QNEVGbCtnUG5jUDBNQy9oZldlcnhqM0RDYlZHanFjT2ZHcmpNYWVSNzlQ?=
 =?utf-8?B?QWRQVitJNy9XTldJL2dvZkU2ejIxeUgyMktKSmtsaUtaS3Y2cnVtRkFRTVB2?=
 =?utf-8?B?R2x2SXk1MWdwLzBkQmgvVnJTNFN5V3Y4UGpwWG9DdGo0OFBGclJ1MHN3enBw?=
 =?utf-8?B?SllYb2R5UDVBSXJCeVdmVWZ0TEhQS2pkb2wvSWY3V1FDbGVDU2NHNDh6TENq?=
 =?utf-8?Q?2hO6puea+O7VHQZY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2966b56-f02e-4775-6025-08de5e8b38ba
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 16:35:18.3997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AEj5WrVJhIrhbUFj1xsEOiB1u7UGIHnb+f8qW0HXYKd9ORuyR0YIuGEoC3jgRwmHEwAUphep8+FFYX3zvxnUXvg7uG8gsj7JUNbhPOcmEyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7197
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2026-sty-21 22:42:16 +0100]:
> Instead of relying on fixed relation to the display probe flag,
> add configfs attribute to allow an administrator to configure
> desired PF operation mode in a more flexible way.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 61 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_configfs.h |  6 ++++
>  drivers/gpu/drm/xe/xe_defaults.h |  1 +
>  drivers/gpu/drm/xe/xe_sriov_pf.c |  2 +-
>  4 files changed, 69 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index a823b0bd4ebb..2596810f4366 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -264,6 +264,7 @@ struct xe_config_group_device {
>  		bool enable_psmi;
>  		struct {
>  			unsigned int max_vfs;
> +			bool admin_only_pf;
>  		} sriov;
>  	} config;
>  
> @@ -282,6 +283,7 @@ static const struct xe_config_device device_defaults = {
>  	.enable_psmi = false,
>  	.sriov = {
>  		.max_vfs = XE_DEFAULT_MAX_VFS,
> +		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
>  	},
>  };
>  
> @@ -898,10 +900,40 @@ static ssize_t sriov_max_vfs_store(struct config_item *item, const char *page, s
>  	return len;
>  }
>  
> +static ssize_t sriov_admin_only_pf_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
> +
> +	guard(mutex)(&dev->lock);
> +
> +	return sprintf(page, "%s\n", str_yes_no(dev->config.sriov.admin_only_pf));
> +}
> +
> +static ssize_t sriov_admin_only_pf_store(struct config_item *item, const char *page, size_t len)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
> +	bool admin_only_pf;
> +	int ret;
> +
> +	guard(mutex)(&dev->lock);
> +
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	ret = kstrtobool(page, &admin_only_pf);
> +	if (ret)
> +		return ret;
> +
> +	dev->config.sriov.admin_only_pf = admin_only_pf;
> +	return len;
> +}
> +
>  CONFIGFS_ATTR(sriov_, max_vfs);
> +CONFIGFS_ATTR(sriov_, admin_only_pf);
>  
>  static struct configfs_attribute *xe_config_sriov_attrs[] = {
>  	&sriov_attr_max_vfs,
> +	&sriov_attr_admin_only_pf,
>  	NULL,
>  };
>  
> @@ -912,6 +944,8 @@ static bool xe_config_sriov_is_visible(struct config_item *item,
>  
>  	if (attr == &sriov_attr_max_vfs && dev->mode != XE_SRIOV_MODE_PF)
>  		return false;
> +	if (attr == &sriov_attr_admin_only_pf && dev->mode != XE_SRIOV_MODE_PF)
> +		return false;

I assume you have a reason for this, but without an explanation, I don't understand this approach.
I assume that sriov config should only be available to PF by definition, so I don't understand
why you are checking for individual attr. 

>  
>  	return true;
>  }
> @@ -1065,6 +1099,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
>  	PRI_CUSTOM_ATTR("%llx", engines_allowed);
>  	PRI_CUSTOM_ATTR("%d", enable_psmi);
>  	PRI_CUSTOM_ATTR("%d", survivability_mode);
> +	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
>  
>  #undef PRI_CUSTOM_ATTR
>  }
> @@ -1243,6 +1278,32 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
>  }
>  
>  #ifdef CONFIG_PCI_IOV
> +/**
> + * xe_configfs_admin_only_pf() - Get PF's operational mode.
> + * @pdev: the &pci_dev device
> + *
> + * Find the configfs group that belongs to the PCI device and return a flag
> + * whether the PF driver should be dedicated for VFs management only.
> + *
> + * If configfs group is not present, use driver's default value.
> + *
> + * Return: true if PF driver is dedicated for VFs administration only.
> + */
> +bool xe_configfs_admin_only_pf(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	bool admin_only_pf;
> +
> +	if (!dev)
> +		return XE_DEFAULT_ADMIN_ONLY_PF;
> +
> +	scoped_guard(mutex, &dev->lock)
> +		admin_only_pf = dev->config.sriov.admin_only_pf;
> +
> +	config_group_put(&dev->group);
> +
> +	return admin_only_pf;
> +}
>  /**
>   * xe_configfs_get_max_vfs() - Get number of VFs that could be managed
>   * @pdev: the &pci_dev device
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index e0a555b871b3..487531269511 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -8,6 +8,7 @@
>  #include <linux/limits.h>
>  #include <linux/types.h>
>  
> +#include "xe_defaults.h"
>  #include "xe_hw_engine_types.h"
>  #include "xe_module.h"
>  
> @@ -28,6 +29,7 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_cla
>  					const u32 **cs);
>  #ifdef CONFIG_PCI_IOV
>  unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
> +bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
>  #endif
>  #else
>  static inline int xe_configfs_init(void) { return 0; }
> @@ -47,6 +49,10 @@ static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
>  {
>  	return xe_modparam.max_vfs;
>  }
> +static inline bool xe_configfs_admin_only_pf(struct pci_dev *pdev)
> +{
> +	return XE_DEFAULT_ADMIN_ONLY_PF;
> +}
>  #endif
>  #endif
>  
> diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
> index 9183d05b96e1..5d5d41d067c5 100644
> --- a/drivers/gpu/drm/xe/xe_defaults.h
> +++ b/drivers/gpu/drm/xe/xe_defaults.h
> @@ -18,6 +18,7 @@
>  #define XE_DEFAULT_FORCE_PROBE			CONFIG_DRM_XE_FORCE_PROBE
>  #define XE_DEFAULT_MAX_VFS			~0
>  #define XE_DEFAULT_MAX_VFS_STR			"unlimited"
> +#define XE_DEFAULT_ADMIN_ONLY_PF		false
>  #define XE_DEFAULT_WEDGED_MODE			XE_WEDGED_MODE_UPON_CRITICAL_ERROR
>  #define XE_DEFAULT_WEDGED_MODE_STR		"upon-critical-error"
>  #define XE_DEFAULT_SVM_NOTIFIER_SIZE		512
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> index 919f176a19eb..47a6e0fd66e0 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -22,7 +22,7 @@
>  
>  static bool wanted_admin_only(struct xe_device *xe)
>  {
> -	return !xe->info.probe_display;
> +	return xe_configfs_admin_only_pf(to_pci_dev(xe->drm.dev));
>  }
Overall, it looks good. I'd really like to know what's going on with this approach
in xe_config_sriov_is_visible.
But still:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
>  
>  static unsigned int wanted_max_vfs(struct xe_device *xe)
> -- 
> 2.47.1
> 

-- 
