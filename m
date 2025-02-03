Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB520C02193
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 06:27:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9119610E2AD;
	Mon,  3 Feb 2025 06:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A9g+mCYe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0740710E2AD
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Feb 2025 06:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738564052; x=1770100052;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v48jK2em6xc/rAdhQkwo3kdiRJv6kKKzLkF0mfb4ekM=;
 b=A9g+mCYe8y5Lo0HCRPVHdrWWb7PimGccfzl8X0BYiYcTvNLNy6JMPVI6
 2Ud9GibOmaPzRPDgIsYtdOiaGofSELUCZfsoMTd8sgufUSJ4gR4osiBiZ
 909FKUVcPZmASPdaRS25kiNlfsypszGOis+IJ5iPsy0phfEdwqwLurzQ4
 TTF3paIoZ7hfI5tzuTHhn/tlxyuGHYA/kn5kyOWBsABovDw1uCG9oNaD9
 utfEo0VFoOPYPjgfEIDx/pMU1yHpJgs5+pfxPSEaWV6xVaNx5v4Tz4E45
 dbSbXj658+Z0NTjSGrGxgoqs0ZL1eaFBpa4XGWn0MXXBCK6mDiNQGs4o+ Q==;
X-CSE-ConnectionGUID: P0TVHmljSFiYZw5gCkN+9Q==
X-CSE-MsgGUID: I34pN5SgQpWXnoogIbPM0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="49703787"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="49703787"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 22:27:31 -0800
X-CSE-ConnectionGUID: Lj6JFA1YQCO/pr3vtEupwA==
X-CSE-MsgGUID: VvSjL1fhQoWL4VWNVFa/+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="110146451"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2025 22:27:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 2 Feb 2025 22:27:30 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 2 Feb 2025 22:27:30 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 2 Feb 2025 22:27:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BiBMP9zkpA58QvMH6sH6DFUVSsKYxLeisQtNzDtzxwaKKq1VRQC7NzO3QhaeIfQfs8NintPwxQ3nuAoa8R/lrYbZT/UtO5c/c11RUTX0kIVX9ormXjCTUsX/vE72PDVBrOnj28knyCynx83r4ib9y2Zl0DL/Q88ZWdiks3Ts5vp6LAxGJ6UnTdUaE7v5wPDS597ptjQ31TDBHq1T1+75E2BiSKCyljJx1FRRXBBW8j0EQYXlLDnG3XmX5gHz/A6GStJdnGoeBpHnX0M4skltTIUcCroLtTrPyT3m35KXCBuFah5qXzolu/fdxMhtVKnTh/FR1SxENNiyi9pT5yzMew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcUjp42VFBAbsX11w9ofcPYkG26AGfztIglzncXLPic=;
 b=cD09hiam7ofnQXCkvZqUmWpoUA0Q2kIdqh+O8aq/cvCrMsKZ1bgyZOZBYDvirTLEeouySEY/dnT018JFVcBuJpe7MCscVTJoYP1Rk7ZqVeAqshIRwFtbngJkbbvXfK9alB2N5lIM+y7syFYbYlsBzDOGBK7/GkJmD06jyxgMN8EhwLC1Xrbk2unMVg9yYW7qrUK06DeJTYysHMWbG2CBo7CMBxomdzxibAhZCK/uQWR3RH2jfV6wwbGlMcplEzDhFESxpuO9f1u54bswvsW1fARB48MKkmwjAONnqO6mzqEu+eNBHHAroc1XFgfpTSP/4l9b2f2cYi5bNrEpQGqufQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA2PR11MB5081.namprd11.prod.outlook.com (2603:10b6:806:118::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 06:27:27 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 06:27:27 +0000
Message-ID: <cce1eb5a-b738-4283-8d3d-e782da14067a@intel.com>
Date: Mon, 3 Feb 2025 11:57:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/hwmon: expose package and vram temperature
To: Raag Jadav <raag.jadav@intel.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <matthew.d.roper@intel.com>, <andi.shyti@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
References: <20250131054502.1528555-1-raag.jadav@intel.com>
 <2c9ce022-56a6-4d25-a274-32d9013f8c49@intel.com>
 <Z53BOTXFSsZ5WKFs@black.fi.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z53BOTXFSsZ5WKFs@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0125.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA2PR11MB5081:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b532b44-dc53-4cf9-b735-08dd441bd431
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWNJZXlKZzNuVy9HaVJ6UTZMdm4xTzBUQTQyYWxlaWdJM1VWSGRqR2dRTnps?=
 =?utf-8?B?SVp3a2M5dWxiOVpoc3RnTUtOVW9zeWFlYjU1cE1XRnc4M29Ham9vVExxR2hn?=
 =?utf-8?B?TnlwU05acTlRczJuOEM3ZVNTRUp0bzZNQmVZRnc5YkRiL21IRnFtVDRyNU9r?=
 =?utf-8?B?T2NYZmhYQzUvcms4Y010T09mM0hoMVhjYWVoZDY1UHBpZEl5dFUxREoxVDQz?=
 =?utf-8?B?UVgxRy9zUHRIeUpUZ3hNeTllSDRQVzVOYkJhWGVjcTdaYWw3bldwMW9YQU90?=
 =?utf-8?B?Y2lNQ1c1MUNFRDgySEQwb1RWcEJtVXdBSTB3VFNZMXc5T0ZBc0o0czlQS29E?=
 =?utf-8?B?RHovZEJsZ3V0UndDNWFEV2hjc3JtSXdjdVNiVU10OGcwUGVpMU00c1NQZm8x?=
 =?utf-8?B?VURVcU9sM3VjRENjRVNLbFBHU2JTeG05ZXRKbmdVMlBjajR0cGw2N3I4SDh2?=
 =?utf-8?B?M2FVTDY1ZWtjWDEyb1MxYSs1YmJKelVXWTlYV01zb3FBQVRBOGprY29QQVcy?=
 =?utf-8?B?WkMzNVd1aGlWb0ZvaTZTZnVTSnUxZFlJVHpOYjJRUnh6ZzNPbGYxM0ljT3kz?=
 =?utf-8?B?RFU1Mm9LYzYvZlJDblJsL2l5N3Bya2JFeHNHQWpYL3VuTXhNcUFXcC80c3o5?=
 =?utf-8?B?d29JeE1PVHZaMDMvRzEwUGZHRmZUYWNabnBFUjRSeXFRRjZFN1NtN1lYNVp5?=
 =?utf-8?B?aE5KRDY0NWRRV0kvNVhwL0VLVkVkZXR5dWRjTzJNSWNqRU5oM0tORlFkRDVP?=
 =?utf-8?B?UG5HMmJqR1Y0SWQrMXZYSVVtSW9sNWg4eFpxa1YzNW5TdFlSVmFGZ0JtNU5K?=
 =?utf-8?B?RWpmTXFSb0dEWCtkcVJ5QTYrbHdEeDFRMEhxVXY4ZllPV3BLaGp3K3Q1MzFR?=
 =?utf-8?B?c2Q0MkRXVWc3WnZ5NWUvTmZHNEh3a1JpVG5tWVNKZUY0UmdrSzlwa0VkaDdl?=
 =?utf-8?B?Z3BqTXE4U2Z4QW1qZm5pby83bTArK3JHd1pTOXZkTm9uK00rNlFMYlRxaHBH?=
 =?utf-8?B?cWM0TXpjcU5hTkZYRVhROXNIODZTN0lPMWc5dVMxZFpQV0VrZEJPaEIwVlkx?=
 =?utf-8?B?Z3JUZlJWZjlLa0hpbEhSU1ExaUZGdjYvVHZDNm9RUlV6NmpVdytsc0tCTlF3?=
 =?utf-8?B?Vm14elhkTEZMUGxRQUdNQUpuWUpVcDJNOUpFWmQ2R3ZBZCtwaHQ1NHZGRkF4?=
 =?utf-8?B?VHB2MTRyd0ZrNWxPY3lRUXpCc2s4ZjJRNXREbE1UL3pUbW1IWEtkeHY4VWZx?=
 =?utf-8?B?enl4ZFJYRXJVS2pHSUFaT0NmQTBMUGhlZlhwd3BkMG01dkp1RTcvYjY3WFhv?=
 =?utf-8?B?VFgvYitZd1BNbnRiWWdaZlR5a1huMFRnVkJaVDA0MkFHV0FWaldpTngxazNP?=
 =?utf-8?B?L1hiVlVsaTZua3UxN2h2RjEzQ3VOVU5GNVo5U0daZVErV3FRTmpOZGVTSEwx?=
 =?utf-8?B?b2dxL0lRbXU5Vm5wT0Y0ZlNFOUVod3ZGSHhRdGp0Ujd1MDJINGRUUDJsMnEx?=
 =?utf-8?B?aENuak13RUNYaXRoN0pwSjlkUWt2NnVuaHd5a0pzT0Q2STJ4OEN6dnA2dm9Z?=
 =?utf-8?B?RG81WEVJK08xY3VyN3VZbDJweXpyMHQyV3c4cjZlVXdsZVc2UFpNdnEvZUlD?=
 =?utf-8?B?YjRZVEZKd2lZL1dKSHRacU43YW84NW1MdkZ4ZlMrMGZ4ZVRydXlpdG5TSkRD?=
 =?utf-8?B?b1ZvelVQRDI2M3dRdmQ5M0VtNjZBVEJLMThFR3lUSGM2ZVEydzJJdXpMYWtQ?=
 =?utf-8?B?YVVJYW54bzVlSnlLMWxwT0RLTkxmK0I5QkVZMlZZUFNZYUk5a3d2ZFc1WmNM?=
 =?utf-8?B?MllMREw0ZXBqZjlEUlYvQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vi91SkRZV0xqYXZydCtBQ3EvaFNVRjlwQTVtd09MUVEyRExMdFhBRWdTbzJl?=
 =?utf-8?B?V24zRFlLT3VzTmtMdUZ6enZLVFZTV0RjSVcySlFRbjBoSHhJSTRCU251cWZv?=
 =?utf-8?B?cU1lTVQ5VzJpL3pMaDNiUUpycWhEWDRHWFdXVnhHODM5RXhlblVFb0tVVDFs?=
 =?utf-8?B?YXFjK0dCOVZ1cUlKbkttdXA2U3l5dWFxbTZ5dUtOWmdCYjljTTcwcWF6VkEy?=
 =?utf-8?B?TXpwbmIvZHJSYU5zVGpXSVJVUUNsQjYyR1NKNlVLVTRCak5iWGJCRk9sWjh5?=
 =?utf-8?B?RnhLV0tpUkZlMDNOMS81SllQV0cxSDVhMUpCMUg1VTlZa05tbW03bUd5OWlV?=
 =?utf-8?B?amJZdEg4cThMZG9YcE5IRXcvYUMwUlIrenVySlhRSDBGZGZmTS82QXllWGda?=
 =?utf-8?B?VzJacG8xLzJQQWQrOHZ5RTVpK2ZzUlFTa3NueWtHZHZvck5sSlJybGMzMWpO?=
 =?utf-8?B?M0NJTGFlaFdVSE9uY2JLY3VldDlhVkhDVUNSVUtLK1h4ZHZ2c3FkbXowMVd6?=
 =?utf-8?B?WWNiQlk0M2UyN1d5OXQ0OUZ3NVMxcGZLR3VHdFpnTzJGNTIxS0dHTmVHSUZV?=
 =?utf-8?B?bVJqVjhRRkw5UnBudUVzV1dUa2FWOENLbysxWDlIcTRPSHZUQ3RZYlVpT0Rm?=
 =?utf-8?B?RDRNbzNWMysxcTlWTmc5QnVFRzQ0OG5KckJyckswQ3g4cHR1UldjY2NCczJm?=
 =?utf-8?B?VkRyZTRPdW5JaFBrRGxOa2JrVmNaWWdhQ1ZxVU9LSit6UjBjVVBLTEc2b290?=
 =?utf-8?B?dmNqd09wM0syREpGb0hDSGJoZ1hNcEgvMkU0VDg2RDRMVUh2WnRFV2JTeGdC?=
 =?utf-8?B?UjNidzdJd3FvS1ZQS0MvV01vSnNKZGxEUWVxR2p6TjVmMDNRNzhrZTJDUzV5?=
 =?utf-8?B?MSthTFdNNGdIR1JReittcnRDWXdKNnEyOWUrME4yMUgzT2xhWXhMaUVxcXlx?=
 =?utf-8?B?MGpMb0ZxQ3Q5dEpKaFlpckRWRFdBdEd2bWdpR1BpSXR5RnhHTE9TbTlxMGtD?=
 =?utf-8?B?QXJ0SkJ2VWdrZjk4dG42SzJMY09GUUhyOVRiQTlUYW1OMFo5dXdQNFdVdUc4?=
 =?utf-8?B?bVhJVGlnNDM1SWpOc3lnaEttdTdvblBYdGx1L05RS3JONDR3T1JkQ1owRzRl?=
 =?utf-8?B?aTh3MjRPWEkyYzFIaEFZRGlzbUgxVnEzU0dUSXBWRlZiWEpmV2pvQ2U0c1BJ?=
 =?utf-8?B?Z05lT3hqKytoMEJDTlpxN2xxUnlxak81ekpMRmx1eDRHUGFtQWZlK3k2ejlu?=
 =?utf-8?B?WHFDWFVXSHJKaVE5ckp6TUIzdi9ld0NLZ21hUTZqOGJwUkRYc29iNGdBVnN2?=
 =?utf-8?B?S1dhZXBLVmI5VjBLcFg2ajZ5RTVCcTBoVUdiMW1JbzI1S2NqWGY2NzJ4bGs0?=
 =?utf-8?B?VjNKYUpDcThIdThvdk1yZnhMbjV6c3hvUXhCWmVyMFVjYnVRUCt3MCtSS3M5?=
 =?utf-8?B?Y3pSOEk5N1VFdlBHMFQ5R2crWnNPbktocm1mcXZhRCtudi9CNGMrdHl5dyti?=
 =?utf-8?B?OFZYK054RndsVjJmcE5HSGcxL2FXZkNqQk5SQXNJMHVWUmtGRmhPV1lNYmc5?=
 =?utf-8?B?QmpSTXBQaGJ4T1dtN1lObXFvSkx3SEpZdjJzaWhPbytEdThqM1RacjhDNVZF?=
 =?utf-8?B?dEpqcmhGU2lYcEM0YVA5UktkVXQ1cXlyb1NQcDQ3Ry9EMmg0NFNIcFZocE5n?=
 =?utf-8?B?V2ZCczFyQkJJNUt5RFVrMmlsSWM5NUUxUzhXVzc4TVNVVTZTTFp2ZDRzZzd1?=
 =?utf-8?B?SmtLaDNvYkdDSFVhR3FhNGdpZTlKR1ErSE1DZlpSaERCaG1tYzNGTHlLUDZP?=
 =?utf-8?B?djdxdmxJMS96cWdMUTFJcDdueHZ5OVNnTmJtZFFwSEpXTDc3Yjk0ekFqNnJh?=
 =?utf-8?B?QVZ3ZDg2d0VkeFVJRVFsTEhwaG9EeEpEUGRCK3I4Qk9QaExNc0IwOUlTVlBh?=
 =?utf-8?B?UTJheEpKbDBmMkVWV0V3ZVMxTlZ4N1NTbzdVdnRMcW54bWZ4NjhSY05JdXI4?=
 =?utf-8?B?a3Yyd28zdXVkS01ybk40MS9PYS9FVnpwRm1wTGVlc0t2bkZUMUZBNEp6RExk?=
 =?utf-8?B?MkhSWFVWRUhTcFlXTkJwSkV4MmpxeitKQytkeTg5YXpudXpKNU50eSsvUEhK?=
 =?utf-8?Q?szl6LwkkUGH8LTt/OQnK4QdH+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b532b44-dc53-4cf9-b735-08dd441bd431
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 06:27:27.2560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2ls+PFizjaTmlzpg8FdYPf9rJLXIVAaGe7hJzS0ey5jx6aPO5pTq5lT0BUN5iW5wnSOMRcYlxwBtt1pU2tmMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5081
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



On 2/1/2025 12:07 PM, Raag Jadav wrote:
> On Fri, Jan 31, 2025 at 08:13:15PM +0530, Poosa, Karthik wrote:
>> On 31-01-2025 11:15, Raag Jadav wrote:
>>> Add hwmon support for temp2_input and temp3_input attributes, which will
>>
>> Add hwmon support for temp2_input and temp3_input attributes for supported platforms
>>
>>> expose package and vram temperature in millidegree Celsius. With this in
>>> place we can monitor temperature using lm-sensors tool.
>>
>> With these changes, package and vram temperatures can be monitored using lm-sensors tool.
> 
> That's pretty much what it already says, doesn't it?
> 
>>> v2: Reuse existing channels (Badal, Karthik)
>> Add a new channel for VRAM temperature, channel 3.
>>>
>>> Signed-off-by: Raag Jadav<raag.jadav@intel.com>
>>> Reviewed-by: Andi Shyti<andi.shyti@linux.intel.com>
>>> ---
>>>    .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 16 +++++
>>>    drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  3 +
>>>    drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  2 +
>>>    drivers/gpu/drm/xe/xe_hwmon.c                 | 60 +++++++++++++++++++
>>>    4 files changed, 81 insertions(+)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>> index d792a56f59ac..9bce281314df 100644
>>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>> @@ -108,3 +108,19 @@ Contact:	intel-xe@lists.freedesktop.org
>>>    Description:	RO. Package current voltage in millivolt.
>>>    		Only supported for particular Intel Xe graphics platforms.
>>> +
>>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_input
>>> +Date:		March 2025
>>
>> January 2025,
>>
>> February 2025, if there is a next revision after v2
>>
>>> +KernelVersion:	6.14
>>> +Contact:	intel-xe@lists.freedesktop.org
>>> +Description:	RO. Package temperature in millidegree Celsius.
>>> +
>>> +		Only supported for particular Intel Xe graphics platforms.
>>> +
>>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_input
>>> +Date:		March 2025
>>
>> January 2025
>>
>> February 2025, if there is a next revision after v2
> 
> Something to follow: https://hansen.beer/~dave/phb/
> 
>>> +KernelVersion:	6.14
>>> +Contact:	intel-xe@lists.freedesktop.org
>>> +Description:	RO. VRAM temperature in millidegree Celsius.
>>> +
>>> +		Only supported for particular Intel Xe graphics platforms.
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>> index 519dd1067a19..f5e5234857c1 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>> @@ -34,6 +34,9 @@
>>>    #define PCU_CR_PACKAGE_ENERGY_STATUS		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
>>> +#define PCU_CR_PACKAGE_TEMPERATURE		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5978)
>>> +#define   TEMP_MASK				REG_GENMASK(7, 0)
>> TEMP_MASK -> TEMPERATURE_MASK
> 
> This is consistent with other GENMASK() macros here.
> 
>>>    #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>>>    #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
>>>    #define   PKG_PWR_LIM_1_EN			REG_BIT(15)
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>> index 0b0b49d850ae..8846eb9ce2a4 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>> @@ -21,6 +21,8 @@
>>>    #define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
>>>    #define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
>>>    #define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
>>> +#define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
>>> +#define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
>>>    #define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
>>>    #define BMG_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
>>>    #define BMG_PLATFORM_POWER_LIMIT		XE_REG(0x138460)
>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>>> index fde56dad3ab7..7f327e334212 100644
>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>> @@ -6,6 +6,7 @@
>>>    #include <linux/hwmon-sysfs.h>
>>>    #include <linux/hwmon.h>
>>>    #include <linux/types.h>
>>> +#include <linux/units.h>
>>>    #include <drm/drm_managed.h>
>>>    #include "regs/xe_gt_regs.h"
>>> @@ -20,6 +21,7 @@
>>>    #include "xe_pm.h"
>>>    enum xe_hwmon_reg {
>>> +	REG_TEMP,
>>
>> Any specific reason for adding this at the beginning of enum ?
> 
> This follows the ordering of enum hwmon_sensor_types (as the rest of the patch).
> 
>> Generally addition is at the end for any new enums.
>>
>>>    	REG_PKG_RAPL_LIMIT,
>>>    	REG_PKG_POWER_SKU,
>>>    	REG_PKG_POWER_SKU_UNIT,
>>> @@ -36,6 +38,7 @@ enum xe_hwmon_reg_operation {
>>>    enum xe_hwmon_channel {
>>>    	CHANNEL_CARD,
>>>    	CHANNEL_PKG,
>>> +	CHANNEL_VRAM,
>>>    	CHANNEL_MAX,
>>>    };
>>> @@ -84,6 +87,19 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>>>    	struct xe_device *xe = hwmon->xe;
>>>    	switch (hwmon_reg) {
>>> +	case REG_TEMP:
>>> +		if (xe->info.platform == XE_BATTLEMAGE) {
>>> +			if (channel == CHANNEL_PKG)
>>> +				return BMG_PACKAGE_TEMPERATURE;
>>> +			else if (channel == CHANNEL_VRAM)
>>> +				return BMG_VRAM_TEMPERATURE;
>>> +		} else if (xe->info.platform == XE_DG2) {
>>> +			if (channel == CHANNEL_PKG)
>>> +				return PCU_CR_PACKAGE_TEMPERATURE;
>>> +			else if (channel == CHANNEL_VRAM)
>>> +				return BMG_VRAM_TEMPERATURE;
>>
>> This doesn't look good.
>>
>> Can you add PCU_CR_VRAM_TEMPERATURE with same offset in
>> xe/regs/xe_mchbar_regs.h ?
> 
> It's not mchbar register.

add it under the same file without the bmg prefix.

The other registers are platform specific and have the prefix.
This is common and can have the PCU prefix

Thanks
Riana
> 
>>> +		}
>>> +		break;
>>>    	case REG_PKG_RAPL_LIMIT:
>>>    		if (xe->info.platform == XE_BATTLEMAGE) {
>>>    			if (channel == CHANNEL_PKG)
>>> @@ -431,6 +447,8 @@ static const struct attribute_group *hwmon_groups[] = {
>>>    };
>>>    static const struct hwmon_channel_info * const hwmon_info[] = {
>>> +	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
>>> +			   HWMON_T_INPUT | HWMON_T_LABEL),
>>>    	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL,
>>>    			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT | HWMON_P_LABEL),
>>>    	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
>>> @@ -506,6 +524,36 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
>>>    	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
>>>    }
>>> +static umode_t
>>> +xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>> +{
>>> +	switch (attr) {
>>> +	case hwmon_temp_input:
>>> +	case hwmon_temp_label:
>>> +		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
>>> +	default:
>>> +		return 0;
>>> +	}
>>> +}
>>> +
>>> +static int
>>> +xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>> +{
>>> +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>>> +	u64 reg_val;
>>> +
>>> +	switch (attr) {
>>> +	case hwmon_temp_input:
>>> +		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
>>> +
>>> +		/* HW register value is in degrees Celsius, convert to millidegrees. */
>>> +		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
>>> +		return 0;
>>> +	default:
>>> +		return -EOPNOTSUPP;
>> Can you add debug log, printing the unsupported attr ?
> 
> We don't have it for others, anything special about this one?
> 
> Raag

