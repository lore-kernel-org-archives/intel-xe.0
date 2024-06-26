Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6DDC27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 17:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4FB10E0FB;
	Wed, 26 Jun 2024 17:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KFkCylVi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0A510E0FB
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 17:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719421242; x=1750957242;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hwluuisH0qAFiSuw4xB9sUNZO18/jxTlkFtv4GdQxh4=;
 b=KFkCylVioeb95IVWuzddCiSNr7Ww2LIhqEPX43qGYP2UPRU+DjC/NW81
 Ayr1KERKeqy9HfUXLT6wLVEUto/TUvwACOVvpeN9TW5RvYMQm1KKWlrCr
 x2goHpGBXtzZi6hlGZ2ouLoZ7RokcZLP1CV5zBHy9qh7M9MJc1cqAxEgP
 eLpPC0SMUS1pUwKy1BCZLVgcwWdglYePaXiuOGHcOdU71tMdETHctRVsw
 qd0FT/knbvUS7X05RwldLBp0+bDQtJGP6/YDP4At03c7K4tPV+voUSl+G
 ckFyYxbilN4fBSZa00l80/Dzl7F4gqWQ+HwZINUEBfdisOR4wG5gZiF7n A==;
X-CSE-ConnectionGUID: jZVCWFQfRiKWX/WWWu84ZA==
X-CSE-MsgGUID: BdMl03PZSv+RF5NSWyzhgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16656965"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="16656965"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 10:00:42 -0700
X-CSE-ConnectionGUID: n6meBcn7QcmbofZctdnpnQ==
X-CSE-MsgGUID: sjutyznoT1y3hqI+wcMUMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="74831802"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 10:00:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 10:00:41 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 10:00:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 10:00:41 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 10:00:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqaoZ/p9PaN/CW4uHqw9LDHxrO0XgFiRamnPrXpC0nkn1q8oNlXrLQx0+JOfIavGkf4UgK1bltd5gktg2/t5UT56RrG5g63oMPglJdCjOjnWUBqxFU0z1KIMA0T0UGn4ofYtLZMg9acq4isOeh6JCskRrSWeOYAlaKG+ARqWOUdM3Ye94HnQYr6/mwVuLvW28gpxwsye9F5v3TO+iofm54DcWLn4HicVLTjqhPYhSsL6v3Z3vBUnaPbEvLpDNM8zC5Eq0V9i4GatkHITyXhKkx6521YOGSNazDzM4KmUMFu11wneFzEc80F+0UOsOX2HxCh0U/DwK/casb4Y+3PohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHDfNRGYBJzFeAp38KfqKYVgN3m9Lbwrg7gldTKCKiU=;
 b=Tewu3NXh56WQfFqV0L1+FJzdV4BiCped4jQdbmADDYmTtfFMEnW6NlrxfW02QNI1IODgE1rG4MPhGlZs7Deg2rk/HAyZIzZAGbxCp8cRj5BUVQuiAsjwmlwLKDr8H9RhQTuEJ3vn009O5VydYVnd3xc4XhsF4JnOJsOa477F0RFpP0IdLcsc/Ckon8S7oAIDfMeHzkcNKHvxyrLPT1WMxox3XsukKMF3WuNH6tZctx7/OXa+lC8NYWtzvU3uLwbu2tVsqu3NUmv3epeOLPfNPLrrjXfLjwj7KOcMN4tBvfDaG8TbPq4IJlZr1LBCgLWYGtKwyVeByiMln6CgKEzbJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB6215.namprd11.prod.outlook.com (2603:10b6:8:a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Wed, 26 Jun
 2024 17:00:37 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 17:00:37 +0000
Date: Wed, 26 Jun 2024 10:00:34 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Get hwe domain specific FW to read RING_TIMESTAMP
Message-ID: <ZnxJMrxGuZ2KYzEA@orsosgc001>
References: <20240625153842.41070-1-umesh.nerlige.ramappa@intel.com>
 <20240625221354.GX2906448@mdroper-desk1.amr.corp.intel.com>
 <f8efa132-d3f1-4234-8169-94239294c54e@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <f8efa132-d3f1-4234-8169-94239294c54e@intel.com>
X-ClientProxiedBy: SJ0PR03CA0210.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::35) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB6215:EE_
X-MS-Office365-Filtering-Correlation-Id: 434f8c3c-b681-4aa3-f02d-08dc96018004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|366014|376012|1800799022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnM5VmlFajQxOXlRTmEwTTRYSEU3RzU2OVpVem5FTThCVUtWRTJZQno1UEJx?=
 =?utf-8?B?dE9rcXlrekQ1VUFVYmo5Y2JGNmdxOFBLMG1YNlNLUks5Qkc5aGNkVlZDbGE3?=
 =?utf-8?B?dzZNeFdqT2pSNmFpclFDOEFxVkhTMmczL1MvN2U4T25FWDBiRmxIbWdTV1RH?=
 =?utf-8?B?WjVjNzc0RmcrZlFUSFExdDJoNllzZG1QQmo3SlNzWEpaWWFmVW82bWRVbkVV?=
 =?utf-8?B?UnJwZVZIZ2N6ZVpBcEdVdHhzT1RTVnp5U3V5YlErSGplSXlOK2tadGh5RkNW?=
 =?utf-8?B?Z1JRQ21FT2RIb0RTNm1rMm1QVHdaVGFsRDIvdERqSUt2dW9WM1F5RlBpbFN1?=
 =?utf-8?B?R0ltcGlqLzdNTVFFUktyaUxETFRCWWdPY25UeXh2N2tJc1lNWFdtNjFMS2NL?=
 =?utf-8?B?TllMOXhGVEZ4VkptMGpBY0VEaWNKNFozTmhZNmpMVVI0SGN0V2J2RHhtWW8x?=
 =?utf-8?B?VVloVUF1VG9iZVhhOG0vSTJwRUJtdmxEeXMyYXZ6eUZPTnhLazh3bmF3NFhT?=
 =?utf-8?B?cnhZRGJLVmt0cUIzM2lneFNqN2JBZy80SDBwTnRaSFIvMXpySFZTb2tNUml3?=
 =?utf-8?B?RVJRVGgyWXNqKzRiZW5GN3AxZFRJQzNIRE9GUy9aSWlGYVQ1Qk0rK2tJQkJJ?=
 =?utf-8?B?M29zaEZtY1A4TlBHTVRzYURCM0ZENCtRNFJvd2FFU0tLMUdOU0s0QUxBUWxJ?=
 =?utf-8?B?RjdLbGEzcEFwT2pOTWtrQUoyTSt6cnQ3RWlzcmVPdHh0anJhbm1XSWpFR0ts?=
 =?utf-8?B?NHl6bkVyemFnUFY5d2pqYTZqOC92VEM2T3FtTFZ0eThPeGFwZExYZTFqT3Yv?=
 =?utf-8?B?d2F6KzJscUpLNjdHamNvdG95VXZ2Zit1cWVmY0QvaFJhZmJwWDlqVGg1UUR1?=
 =?utf-8?B?RkRJeUpCdUMxRWZDcVo4K0JqdnR0QTlLcythVG1lbUQrSHUvZzBLUmo0RWdL?=
 =?utf-8?B?T3dxRWM1S254STF5dUVGbHdJcFNRbUluQUVGb2NFK0FjY1NDeFNscGdBOHho?=
 =?utf-8?B?Z3BQaUM2OVhvUzd6eVZwY0s5YkdXb0VMVk5lUFBwNXdmYmdKN1RrcHdwMEFp?=
 =?utf-8?B?M2pNWmRoM21CN0x5M0hjZmRNaVBnZWc0ejRsbUlIRWh5ZE9zSzBsMnFJOWxp?=
 =?utf-8?B?c2pPVTcxN2tuZ01SbUc5SWtOVDV5NEluNFNhSWU5VUdpekVvSWFVK0RPMHIx?=
 =?utf-8?B?SUVPU0tBaFMxdjF1QlovKzByZnNsdWJkSEM0L24vRDFodEh2ZjlTaHlSUU1L?=
 =?utf-8?B?TndYR0dZY25KVW9oM25YZVppclZUdE1HSzE0Q1FhTHhTbzVYdlc4Sk94MkJD?=
 =?utf-8?B?cE95WG1pY0g5ZGcxRVpZdjhRd1RqNi9zRGh0SmpBQnU3ajFGb2wyM1dtam9P?=
 =?utf-8?B?NTRUWm9Vc0ZWbWtUNy9MNkFxNFYyRHA5VjJnZ2FibXNudlhZWXAvWW1Rdzla?=
 =?utf-8?B?a0V5azVYWVh1eVNJZkh4WnBZY0lOaEMyT3hZYTRIUHN5eStoZVVpZVdEV05u?=
 =?utf-8?B?c2tBblBvTUthdTBZbUljejFMYkt3aVREV3dSV0QvZXRMQU1TSXBZMGhFamVD?=
 =?utf-8?B?ZUFUM3pTeXdxQVV5bk0zM0Y5clVyTHZOREY0bkh6U0M2dHRZRVZ3Y0YwQTdJ?=
 =?utf-8?B?NlJhdHduYjdtbmxyNDhmTFpDL0hHenc4QTl0elprUTcwa3RmeUdFaVpmbjBZ?=
 =?utf-8?B?Zkc4U005RG1oZ2h5Z2plcHJydi9YKzgwTVljaG9ya2pKY09FeFJqMUY2aW5v?=
 =?utf-8?Q?Xm9eLEdOMedPPaggQKVmNM0+PlI7NQPmeHedXGj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(366014)(376012)(1800799022); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTFZMkxSUnAxUVNMWGtoaXp3S0dKak5KYUREYVBITG9yNkNtLzdQNmdiVkV1?=
 =?utf-8?B?aEloSkt6bkNCaWpJYWVqS2RQMUVnbDZEY09BVlA1M21uVTkwTE1LOFlJcTdq?=
 =?utf-8?B?bFhlTWw5M1RwZTF6MWhkREdXU3ZWK1NIODg1QUh6c2hLcTV4THREc0QreWE2?=
 =?utf-8?B?b2N5dmZRZ1VHemdlT2FlNENRWlBJbTVMbTZwbGlKbjhXS0hWc1k5WG5xWUtn?=
 =?utf-8?B?WExHam8wbnFJZTNqcUdzZXl1d1F1ZXR0QjBMSk1ZWEw0VTgwVGs1VnVCNU8w?=
 =?utf-8?B?Sk4yNWlyYnRTakVCcXFLMmR0VWo2WEN1eERPSk55UW5aajA5eFJCREd4WW9E?=
 =?utf-8?B?WnhjNVh1Qm1zREpkUFhyMlRZbnhwVjFEWHdURERITjE4MkdxdEVISnUrSHdR?=
 =?utf-8?B?S1Ntd2tLNWdVMWJQMDFZMXE3cEhKcTZteU83R3pPS1JtMTlON3c4YmNhcjVp?=
 =?utf-8?B?clMvbzViNDBOMGRKYzhhWjFNMjRRSG1zWU1ha0lMQk0zTHlqVVl4QXhZR1Vr?=
 =?utf-8?B?WWQxRFhaQUFjZkR3SW8zNnlJUGE1ZDJ3dGU5VUdPamhENFF0bERXRU15TDh6?=
 =?utf-8?B?NGNiNFIySmkrc1M0cGNHK2hTNS9ENWJ6VHN4NmIyRVV0VERSWFkrMkhhekgx?=
 =?utf-8?B?TjlSTXVxZXlqbVRIcnY0M3ZPbmlldlR4MjduQTRwaGIvSVFIMVlFV1JQTVpZ?=
 =?utf-8?B?ZkNaVHU5RW1zNzRpMkRNRFUxN0owMVZNWHZhK092MWpOa3NEZEFUNXZjTTVv?=
 =?utf-8?B?SU5LV2tSaWd6dXVMK0c4YmhVeElZcG80Smc0UXNrbkpqdVMxMkZUQ3N1VS94?=
 =?utf-8?B?SlYwelhlblE1Z204WnFDSTh0WklraE1KSTFoR3pqdjRqR0dRbkZBbUk3UVVo?=
 =?utf-8?B?WklPL1daclNCVjhWSkZzbVJVU2hPZzFyUE5BMDR3RHdqcGVaTVNSV1htd0tH?=
 =?utf-8?B?MUpZenBqN3pPbXVvZVVIM0U5M3lwNUQxL1YrZW8vM2Z4U2VsSUptVVBoamE4?=
 =?utf-8?B?SUdhNEViemNPem9oWnJyNkFObnNJQzMyNUFocUszMWFwcC8vd2VUd0o2b04w?=
 =?utf-8?B?R0hEbFBBaHkzdkYxVXdMdGl5S2NOYWtYSGdqb21HMXlNVWt0eVZ5SjVJZXg5?=
 =?utf-8?B?R1ZhUzJHK1hDOUh2TENLOUhTZzBzVjVtMjNVd1EvOUN4WVRhUkU2MmNWdFND?=
 =?utf-8?B?Mmk4ME1KanE3cm5BTnRoT3Q1czVJZlpwTkpYcXdLaFI3YkFLWGYxTW8vdWxL?=
 =?utf-8?B?dVhvVHJidmN0T09yekUyZmlkM2lJcFMraDc2a0hUVDhZTll5SVBSajhaRFRV?=
 =?utf-8?B?S3Fyb3BxeEdvNTN4SkFudE1IZEFvOUQ0VnQxUWJkR1c2elBDcTIybk1QcFM1?=
 =?utf-8?B?Z1B2OURDTkpJeHE5RXUvV1QvM1dka3FteUtzMnhOamRiQlMreFNLSDhSaGVn?=
 =?utf-8?B?bmJEUVZ1cy94WlVIY1hibzQ4NGpueUY1SVBKUTBWS0lQaEN3U2ZyL21KZGxQ?=
 =?utf-8?B?dDAwNGF6b2ZrRlhHWThqR3FVeFNFejZ0MXljbGtGZmtJSm5TSURxdnBqcnk4?=
 =?utf-8?B?SXl2NnRxbXh5cFY5T0RYMFpxYzZIdjc4N1BNY3h2TVBJbFZkYVBrRmMydThZ?=
 =?utf-8?B?Y2lPK3JURjdZalV2VWNTMTdiOGk3NEZxZ1FHRlNLMDVzSFhCajRUUFNreVlt?=
 =?utf-8?B?aDh4eWRSV2xCa09uRTdtNEVNcU9EOUNROURneWhTUVgxTnJOL3V6clFyQTUy?=
 =?utf-8?B?c1BDSkZUZ20yRW5pb05PRXd6STMrTWM2YW4yL04xSkl2WGR4R3lMWU5ReE5G?=
 =?utf-8?B?NEwwOE91YmEyRzlickFuQW5kOGlxT0ppTWRuRjIyYUlvU05Ra3dQUW50V0hI?=
 =?utf-8?B?cTRnZUFDM3F2YUlySzRENTdZSkt3Y2tCWjJFVm85cHBTOUhsM1hkWFZLVWxJ?=
 =?utf-8?B?U1RPWVFhWVcxc1RicStxUlZwcnNPUGhhQ2s2dGpuOEE1L2xrQlZJekFidTBy?=
 =?utf-8?B?WE1vR0tqNTNYeTdKc1Z0WFpsVWwyTVIyTGFldmhqYkZYbzNGblZIenBIb1NN?=
 =?utf-8?B?TUdEZ0l6VVYwYkRIaGRqUGlGWjVVTTNOcDNzeHVJQmNwK09iVXgrWXpTWmZR?=
 =?utf-8?B?b2FqeHloVFZtUFVvOTZ1dEl0UkNmNjJ6czBuRUhqRTdzY1R4TVd3TmhnUVpt?=
 =?utf-8?Q?mRo7F0t8ffrknyrVh0Se/0M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 434f8c3c-b681-4aa3-f02d-08dc96018004
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 17:00:36.8733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Z6BvYKgLrbIhxk6mkDilVqVABTfZLxVdf3CBycsPfMD3LX7EVQPKEraYeErCkhqmVyy4ipgvubWK89maPMuIJ2J+e+Xm+MOuqzhn6AXn4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6215
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

On Wed, Jun 26, 2024 at 09:55:39AM +0200, Michal Wajdeczko wrote:
>
>
>On 26.06.2024 00:13, Matt Roper wrote:
>> On Tue, Jun 25, 2024 at 11:38:42PM +0800, Umesh Nerlige Ramappa wrote:
>>> Per client engine utilization uses RING_TIMESTAMP to return drm-total-cycles to
>>> the user. Current code uses XE_FW_GT to read this register on the first
>>> available engine in a GT. When testing on DG2, it is observed that this value is
>>> 0 when running test on some engines. To resolve that, get the hwe domain
>>> specific FW for reading the engine timestamp.
>>>
>>> v2:
>>> - update commit message
>>> - use domain specific FW (Matt)
>>>
>>> Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
>>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_drm_client.c | 7 +++++--
>>>  drivers/gpu/drm/xe/xe_hw_engine.c  | 5 +++++
>>>  drivers/gpu/drm/xe/xe_hw_engine.h  | 1 +
>>>  3 files changed, 11 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>>> index 4a19b771e3a0..886965e81465 100644
>>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>>> @@ -260,13 +260,16 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>>
>>>  	/* Get the total GPU cycles */
>>>  	for_each_gt(gt, xe, gt_id) {
>>> +		enum xe_force_wake_domains fw;
>>> +
>>>  		hwe = xe_gt_any_hw_engine(gt);
>>>  		if (!hwe)
>>>  			continue;
>>>
>>> -		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>> +		fw = xe_hw_engine_to_fw_domain(hwe);
>>> +		xe_force_wake_get(gt_to_fw(gt), fw);
>>>  		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>> -		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>> +		xe_force_wake_put(gt_to_fw(gt), fw);
>>>  		break;
>>>  	}
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>>> index 78b50d3a6501..97f43ba3a00f 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>> @@ -1130,3 +1130,8 @@ u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
>>>  {
>>>  	return xe_mmio_read64_2x32(hwe->gt, RING_TIMESTAMP(hwe->mmio_base));
>>>  }
>>> +
>>> +enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe)
>>> +{
>>> +	return hwe ? engine_infos[hwe->engine_id].domain : 0;
>>
>> Not sure if we really need the ternary operator here since it wouldn't
>> really make sense to call this function with a NULL hwe.  But it doesn't
>> hurt anything either, so
>
>except that now function returns value 0 which is not a valid enumerator
>from enum xe_force_wake_domains, so I would suggest to assume that hwe
>must be always != NULL and remove this trouble maker ternary operator

Sure, I will drop the check.

>
>>
>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>

Thanks,
Umesh
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
>>> index 7f2d27c0ba1a..900c8c991430 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
>>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>>> @@ -69,5 +69,6 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
>>>
>>>  const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
>>>  u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
>>> +enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
>>>
>>>  #endif
>>> --
>>> 2.34.1
>>>
>>
