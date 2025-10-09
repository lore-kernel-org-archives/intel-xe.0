Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5A6CCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 20:35:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B7710EB0C;
	Thu,  9 Oct 2025 20:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPON7AVM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2200210EB0C
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 20:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760042105; x=1791578105;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/wzdDU2oMcQvmepVUanbC8AUlE8gPZjqTrfSNxRHj/w=;
 b=OPON7AVMjs4fOsDfWfyBpzgmBsQa/dLs+gwPDD4M+eIO0ICcSp2ESuOR
 c6m11L96So1ChmDHjE0sHuiCZpyOqpJf1yrmwiTXINMOQHsJYusD93B5K
 hP1/IgL95blz8cziLKyxYjohosKMWVlsscjZ4CDlRzzY8RHl76RrNAG8H
 nOD04pvqFwK7XcUP61d3lZzw2zb5q4/4hhChZq6Wjo3lA2pOiTIqvagte
 ld7Igi78ej8a6xc3WcTpt9GzPFoJeLvtilhiz/KDpdleavVUPVGBjYBGM
 IkiNB8uvJ0QNY0fLaS3imiWwOUSwQB9xlysyRe4rTyNJujJzvi4Pt2SSf Q==;
X-CSE-ConnectionGUID: +OnNdakHQ0yQCPeB4BxqYg==
X-CSE-MsgGUID: jN1Mz6HeQtCJ5Pjap9QlCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66093663"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66093663"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 13:35:05 -0700
X-CSE-ConnectionGUID: wg1aKJ7tQTqp7WGcwygNew==
X-CSE-MsgGUID: 8/fMYavVS6S1dLY8p+Q3xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="181579434"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 13:35:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 13:35:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 13:35:04 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 13:35:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTznTCTB1+/qgPR2OlGC/3+/hJK7zPWk3fgi4+QAdkmbDL74VNawuKteFxi3R5cj7MYd/MSj4FQnxzpKZ63aJHpWOmBDyiLc4oIFECWw2aaGUu6vxH6cqyundfyxXOj2t88zYVS4CH7qKBrOn1gf2Df54fcWbo0zea7oNP+wFYyPyaB6+mAE18geM/RTyMyj9T3eqt9MAMW/Us8EgbSnzAAFrCU4PfG2zUTCHVkyQ2WV6Ak1qHnMKrMAe84PV+jJkKK2+bU6Mx79FPom/T31oKGFy5rAof3LCRhWjLBHtScS45+BgyDVGHtfkQlUPAXSbY8W6bdB6/uaJDElViRTCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWy0NbRFHhudvq6tLWc96/OcrFRBpyWtZJ9UJM/aAmY=;
 b=aSFSc+5KlIna+Wfis/10fvg3TQ2XCqFzMIEVf1JnHVUhmhY9ACDh4leCuBzA0jzmBXqKQ8MnCmmmuwJdb3dpf2ZtS4b+A3kMF6+MT3/Nqs8gthnzDTliWsNvLfYLGI0ZxoPm7ZJTy9YfsHUMm035OirG1SobqMOs8AuWTB6Ut44LNqlnx4fSFRredHAsbc3pI3x1EOaL5tdQO6hQy6ci7XQ84RzY/pLlbUKPoAeyRp501OGOMsXrwki50/zGeuepCX9HmLfXS42topsOn7FqkWWAG+M7qIRlcG6Bw8TYB2vrHBli8Sy//f9Xnae27/yu9Na4TBVuVI4fdHJxAEidAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SN7PR11MB6922.namprd11.prod.outlook.com (2603:10b6:806:2a9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 20:35:01 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 20:35:01 +0000
Message-ID: <4ab4fda5-ae59-4370-9947-020ff1b3133c@intel.com>
Date: Thu, 9 Oct 2025 22:34:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm/xe/migrate: Atomicize CCS copy command setup
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
References: <20251008101145.11506-5-satyanarayana.k.v.p@intel.com>
 <20251008101145.11506-6-satyanarayana.k.v.p@intel.com>
 <aObsmCaIbrSgHrvd@lstrano-desk.jf.intel.com> <aOex-1E8yBlGFbwI@intel.com>
 <aOfeoWV87W+Gt6HH@lstrano-desk.jf.intel.com> <aOgAXul_Az3JLC0V@intel.com>
 <aOgDrJhtrEqgpAJk@lstrano-desk.jf.intel.com> <aOgRzyimIIPmLdW0@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aOgRzyimIIPmLdW0@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::10) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SN7PR11MB6922:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e780a33-75c0-4e3b-ade5-08de07735233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmpyQWhqUEduNXZqZGowWmFRclltMVl1UmdrTTJBb2EwUytmM21VbDRUQjNX?=
 =?utf-8?B?QllFTDgrRUQxcDlGYVczbzMxbmhHL2JiUDdmZVlBQ2UwOWpkSFRXclJUQzZJ?=
 =?utf-8?B?ZWxldS9kVDBMSVUwU3ZmSVVKcnUwU2tpMVErcGFZY3NLbXh4aWtYakh5VG1U?=
 =?utf-8?B?S3lvVzE4SzhZbDhwcUE4TEtJaGZ2Y1IyS3VYNU8wQzIvUzFGSXozdTFHWExZ?=
 =?utf-8?B?REkvR2pUT0ZLN0k0Rm5ZLzlIT3F2MDFOZytqZk8zYmsrQWV3WGhBS2VEekJK?=
 =?utf-8?B?Y295Wk9pK2NJWFI5SHJyb1U2YVRXb1lsVkc3V29DczBvTis5eW9JQmpTVWZq?=
 =?utf-8?B?aVFHZGY2U3VKZ2pQMGQ1emp5RjhLWjc4L2lnMVpmcVl1ZnMvQXlZUm9UeDZM?=
 =?utf-8?B?aXh0SzR0V1BZeGFrRS95S2dSR2loY0YwSU9GUHRMaTZyV09kY1k1NmE1NURR?=
 =?utf-8?B?U2FnVExLQlM5dmlHSXIwQVhKcnZQNkkvRW1YU2FVOHlQV2pnamxFUnREOE1J?=
 =?utf-8?B?QjU4WkxpbG44WGgrTVdOVExYbS9DbmRmS2NWZGVsWldjQlRkZlM1NWc0WVll?=
 =?utf-8?B?UFF1aDhjUlNvVm1yWFI3cUd0NkpKaWZJZlVFZkxwUkQ2YkNRcnpMOXJ3R3hY?=
 =?utf-8?B?UFNveDVGMFNQaDZNWE1xOVhXRGZ3RUViY3YzUTNjaEk5SGYvdE8zdFlzUGFo?=
 =?utf-8?B?WUJUWVNWN3NPbE9GTmZWV0J2K2dsQytiOUNZYWNiamplei9uN3dlbERrTUFH?=
 =?utf-8?B?Z3NXWTJKZTVEY3BwMU94SnFNcklJMHpEVzZZRVZaZThQZGlUL09IcHlGV3I4?=
 =?utf-8?B?MFF5YWN2Um0wbnE1TTNjVVdGNzAxaWd6d2VJUWNLdTBFSzc0SDVSZlNkY0lZ?=
 =?utf-8?B?eVJ3L1ErN2s1QjBvOU5rU3FKbzVDcUNibmJZTGVBOURRVVFHN21pT0pTbC9P?=
 =?utf-8?B?M0VmSXhtMUpmKzBOSXo5aDZ0TTFoaE5YV1lyUG9HMGErZ3hIcjhPbjkzeXc5?=
 =?utf-8?B?RUpROWZ6VWR2WUZtZE5pOWZuTUhIYjFFQ0xBdVF5NXozL1BXbkF5SnEwV1Bp?=
 =?utf-8?B?eVdOWlErTHhMeWhjK0YxbklLS1BvS2hTcHlIcWIyZThRZjhWck9TL1JUOEpP?=
 =?utf-8?B?dnY4SFp3TGRYc3lwRXhXaWh3bFFCUTg5NGJpWVNCUCs2RmxFVGM5b3N2cklD?=
 =?utf-8?B?WkdRRDU1aTFsTnZCMVd0ZnRmRktqYkJZQjhtOTNzNmpXdmpLTXdNVDh4bWh2?=
 =?utf-8?B?dWxlM2FvYW5hajR2aFV0R0RtT1R5bGw1emRJVkJsdjRnV0I1NmxKc3NiblhJ?=
 =?utf-8?B?K3E0TGNZaVRtNmFnMmhvSDVmOExLODNURHNRbVVqNHZ5MllsOUNMUTZTSDBq?=
 =?utf-8?B?U1lQN0kxTW9zcjBOYlZ1dUowQmFrb2J0MVlRWkhHUktTV2JHaUNyVjBGeU8y?=
 =?utf-8?B?N3ZCQU5MelJtVU5PN2N0aVhlRzVEZmJCcFpMeXhPdmhuUk8vd2YrNVdJdENR?=
 =?utf-8?B?Z1FsRnZPbkRlaWNMck16aXAwTCtGayt6ekVyQWc1NTlOdDlZWmQwUlJFdWY2?=
 =?utf-8?B?ZWlSWFBOOVFBS2UvRW5XcXZ4aFNMSk1sVldyMWY2NHdVOUtoenhhOUd3Sm9a?=
 =?utf-8?B?L05TbjMzOW9yeG5pcEFFNDdlNDgrNzdmYXViRjF5aWhWN29IN1Y3MzVSVWcy?=
 =?utf-8?B?bkF3RDRWMzNuUTArNHo5RFFmbmF5UjJlbVZTNEd3dnZoUmY4bHJlVkRJTHJO?=
 =?utf-8?B?VEs0L0xlZUlKWVlqaDBsNDNPYzBZWWs3T09sMlVSaTdHRjdtZmpjWWJIY2ZV?=
 =?utf-8?B?YnJXQUtVWXdNYStvV0MwVUF6VXpDcnR4VW53a2FlMW91RGtYWmJ1dUZjQlJa?=
 =?utf-8?B?V0FmRU5wYmNoS2dLb0FtNlJtNkFsZ0RnQXpsNnF4aU5LUWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmczS3JCaVg2ZjVzTEZMbHJUVHdvZnhIUEFUM05QVHRPaVVpRHY3RHVwaXl4?=
 =?utf-8?B?eGNvMU9jak1LRU9lU2JNeWNDRHh2VVpUSlRldExyQmZBa0FCUWVZOExWamQy?=
 =?utf-8?B?OUtYOEVsT2hwOHlTdUlpcERjZEV6ckZMZG4xUzgvTjJjN1RqWHBFQkhOOTVr?=
 =?utf-8?B?V1FhajdIbnl4cDNXL1dyUjMzWXYybXBJOUpscE9qRm5ZNUVZTEVzY3Vyc1Vt?=
 =?utf-8?B?VGsxOTlodDBKRWRsRHBZUWZQOTAzQ2krSlJiZmwwT3RlYjlKVnoyZ29VWkdT?=
 =?utf-8?B?RUV5Rk9WYWlaZnU1UHYyVVZGdk5KRXlvcTVaZkNjMHRESnBpSlQxSU5CWm9P?=
 =?utf-8?B?ZUNMTTJiaUFTTzlneVQrdlBSRzRQckd2N3pwak5SWGx6azNEbjVXWEhjYllL?=
 =?utf-8?B?amtsV0NFdXkrYW5zQmZQU3ozbzl6dGg0ejBmamw0WHpHQStiM2RpYlZaaGxR?=
 =?utf-8?B?aTJzMUJ3a1Bzd0JDd3ZzQ1NENTJJcHVLMkNlNWowVXZPbWRpTVBVa0N2WTBp?=
 =?utf-8?B?VlhCeS9lMUY1TzBiakVQR2NXUnhKclEyVUlYSE1ycnd5YW9jbXk1YUdPMzRN?=
 =?utf-8?B?aWx4dUxrNjE3SlFNUXJpSkVNYjFiSmJ3bEhIeWlwbVErdEJCTXc0RXRXS2xI?=
 =?utf-8?B?S3ZQQUp2eGxrVWJ0ZjJSY0Y4cmsySWlBU3NPb1g5YXNqY3E0NU04clRXT2xB?=
 =?utf-8?B?alNxMGZoUmcrZWsxaTViN1hITm1QcDFyS0FzdEUxSFpVOWdCWWZEblRTL21p?=
 =?utf-8?B?WE5TbFB6UnVGSXNOTjN6TE8vUndtbGtjSkdtcENFbTB1SWo1cFhYT1hYVE1Q?=
 =?utf-8?B?YTV4TWlUSHZCSFh2TzAwU1cxSnpLeWhHQ2N1cEJOUm94Z1NtOGhpOEd1SUtD?=
 =?utf-8?B?VGoxTnhIS0RMbWNhWTAwcWlHMkZTNWFtNFdyN1Z3RGdsZGRSRkFlZ0YvMzNC?=
 =?utf-8?B?YVY2UFdocno2bkxOdG5reVpIUGpKVUVaNDN6NXR4RDFYQUtUa1V0WUVPbmNt?=
 =?utf-8?B?N2UwK2FBaENidEpzZkhVODJHSGtManZPSVdlNkR2SFgvZTFJSGRIZGtQSGtv?=
 =?utf-8?B?eW11VHljbjNTN2Q3QnVnaEhGUWp2em10MGZZSVp2dDJNQXRFTFEwekNzZVlS?=
 =?utf-8?B?TVZyWFJ6VDBjRUV5OUFpN3dIUFpRSnJabWR6dEVZL25zYm1UdVZEQ3kzM2FV?=
 =?utf-8?B?NG12a1JHVEZINHV3WjZTOHVybllYVFBOTHlCYm5kU2hPMlN4a3NpdExWNlVa?=
 =?utf-8?B?Z0JSV1JQcWdqYnNHWU9CRkhjR3lMZytSZG5sZnM3N0xFYzB0N0p2UjJobU5q?=
 =?utf-8?B?MVZxaVNyZVBOMHByR3g5SCtvMU1xZllHVEU3QzZKNXdXU29BSk8rL1YzdlhP?=
 =?utf-8?B?L1l0Q0czRFlvb1JZZy81YzdqL2psQ3BFTm5wMnQ4a0h3TlBiR3BRYUVtUW1S?=
 =?utf-8?B?YVUyOXJZdVYvZHVWamR2U0tPWVZaQXRyNnp3Z2FrSDZvM2JySlUxRUxPZmpF?=
 =?utf-8?B?YytVTktaRm5hQ0JqZkxsdksxV013OFB5WGlLQXBUVGZFZmFObm43SkdRWjIz?=
 =?utf-8?B?UHdRSzIxSkFpOGkxUXp4ZzdwVzFyUVJrZ0ZmNGkycHlickI3RVQ3dVJQV1FC?=
 =?utf-8?B?OG5xUmN5SElIUVVoWTQ1V2ZHWm44ZjFrQnNIQzJQL1owOW1NQ3BYbmM5THpG?=
 =?utf-8?B?ODdHVTBMcXR1NkszWDBOamdWNEhBTG4zN1FrNE5naVNPc256OGVLNmlRekVa?=
 =?utf-8?B?K1FjcVZoaWVjNHN2SXJibUZNQkFJcHhDRFR6WGt0MnBBQW5iQWJhT3RCbVpR?=
 =?utf-8?B?N3lacUhqS3FwZitWT1BNUlNDdmVLUU1ndlRhSGIzajJLVm8zdHVNc0FITWMw?=
 =?utf-8?B?YW91MWlybkNBb0p1K0p5NTFQbklqOG4yV2h1SytVL0EvU0UwN3hROFJ1eHB4?=
 =?utf-8?B?dVlURzA4RHpIMU5DdEdSUTlIK3ZFL0o2WVVWK3RwbXdwbTZmdFRmUG1pamIx?=
 =?utf-8?B?MCtub1ArVlJ1YUV1SnhqVDhNSlpCQ09raGhjejJYWWgvNUZheGZwTjNXcXFr?=
 =?utf-8?B?RmFuYWxXSm1ZcXY5ajk0MVlGZEtvdGd0V2ROWk5GTDg3OHBFZFZIbVA1b1Iy?=
 =?utf-8?B?WTgwRzlrYUFROE9xUDlWZGpHZFIvd2JsUW8yc3h1b2haWC9wTVJDWjdWRFpo?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e780a33-75c0-4e3b-ade5-08de07735233
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 20:35:01.6989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uvLTL8sWTm0j1DJ9Wo/Ca12cKAH6h2v5gWSpQZdhxmJzvXTD1hsRvkY2ibnWp2ZVMfrNVxFdi1QE7A8CYUArXcvmiRErZ+IeeSeQjYPN3hE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6922
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



On 10/9/2025 9:49 PM, Rodrigo Vivi wrote:
> On Thu, Oct 09, 2025 at 11:49:16AM -0700, Matthew Brost wrote:
>> On Thu, Oct 09, 2025 at 02:35:10PM -0400, Rodrigo Vivi wrote:
>>> On Thu, Oct 09, 2025 at 09:11:13AM -0700, Matthew Brost wrote:
>>>> On Thu, Oct 09, 2025 at 09:00:43AM -0400, Rodrigo Vivi wrote:
>>>>> On Wed, Oct 08, 2025 at 03:58:32PM -0700, Matthew Brost wrote:
>>>>>> On Wed, Oct 08, 2025 at 03:41:47PM +0530, Satyanarayana K V P wrote:
>>>>>>> The CCS copy command is a 5-dword sequence. If the vCPU halts during
>>>>>>> save/restore while this sequence is being programmed, partial writes may
>>>>>>> trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
>>>>>>> instruction to write the sequence atomically.
>>>>>>>
>>>>>>> Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
>>>>>>> 8 dwords instead of 5 dwords.
>>>>>>>
>>>>>>> Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
>>>>>>> chunks.
>>>>>>>
>>>>>>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>>>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>>>>>
>>>>>>> ---
>>>>>>> V4 -> V5:
>>>>>>> - Fixed review comments. (Matt B)
>>>>>>>
>>>>>>> V3 -> V4:
>>>>>>> - Fixed review comments. (Wajdeczko)
>>>>>>> - Fix issues reported by patchworks.
>>>>>>>
>>>>>>> V2 -> V3:
>>>>>>> - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
>>>>>>> - Updated emit_flush_invalidate() to use vmovdqu instruction.
>>>>>>>
>>>>>>> V1 -> V2:
>>>>>>> - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
>>>>>>>   (Auld, Matthew)
>>>>>>> - Fix issues reported by patchworks.
>>>>>>> ---
>>>>>>>  drivers/gpu/drm/xe/xe_migrate.c | 93 +++++++++++++++++++++++++--------
>>>>>>>  1 file changed, 72 insertions(+), 21 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>>>>>>> index c39c3b423d05..b629072956ee 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>>>>>> @@ -5,7 +5,9 @@
>>>>>>>  
>>>>>>>  #include "xe_migrate.h"
>>>>>>>  
>>>>>>> +#include <asm/fpu/api.h>
>>>>>>>  #include <linux/bitfield.h>
>>>>>>> +#include <linux/cpufeature.h>
>>>>>>>  #include <linux/sizes.h>
>>>>>>>  
>>>>>>>  #include <drm/drm_managed.h>
>>>>>>> @@ -33,6 +35,7 @@
>>>>>>>  #include "xe_res_cursor.h"
>>>>>>>  #include "xe_sa.h"
>>>>>>>  #include "xe_sched_job.h"
>>>>>>> +#include "xe_sriov_vf_ccs.h"
>>>>>>>  #include "xe_sync.h"
>>>>>>>  #include "xe_trace_bo.h"
>>>>>>>  #include "xe_validation.h"
>>>>>>> @@ -644,18 +647,49 @@ static void emit_pte(struct xe_migrate *m,
>>>>>>>  	}
>>>>>>>  }
>>>>>>>  
>>>>>>> -#define EMIT_COPY_CCS_DW 5
>>>>>>> +static void memcpy_vmovdqu(void *dst, const void *src, u32 size)
>>>>>>> +{
>>>>>>> +#ifdef CONFIG_X86
>>>>>>> +	kernel_fpu_begin();
>>>>>>> +	if (size == SZ_128) {
>>>>>>> +		asm("vmovdqu (%0), %%xmm0\n"
>>>>>>> +		    "vmovups %%xmm0,   (%1)\n"
>>>>>>> +		    :: "r" (src), "r" (dst) : "memory");
>>>>>>> +	} else if (size == SZ_256) {
>>>>>>> +		asm("vmovdqu (%0), %%ymm0\n"
>>>>>>> +		    "vmovups %%ymm0,   (%1)\n"
>>>>>>> +		    :: "r" (src), "r" (dst) : "memory");
>>>>>>> +	}
>>>>>>> +	kernel_fpu_end();
>>>>>>> +#endif
>>>>>>
>>>>>> Everything in this patch LGTM but I think we maintainer input to ensure
>>>>>> we are breaking some rules about inlined asm code in a driver (no idea
>>>>>> if this exists) or if a better place would be somewhere common. Can you
>>>>>> ping Lucas, Thomas, or Rodrigo and ask them about this?
>>>>>
>>>>> Well, it is possible and we have asm code in i915 for instance (i915_memcpy.c)
>>>>>
>>>>> But the rule does exist:
>>>>> https://www.kernel.org/doc/html/latest/process/coding-style.html#inline-assembly
>>>>>
>>>>> "don’t use inline assembly gratuitously when C can do the job. You can and should
>>>>> poke hardware from C when possible"
>>>>>
>>>>> In this case here, please explain why exactly memcpy with smp_wmb barriers and
>>>>> or WRITE_ONCE code combined couldn't solve it.
>>>>>
>>>>> Also, please explain how exactly vmovdqu guarantees the atomicity promised by
>>>>> the commit message. On a quick search here my take is that for this 128 or 256
>>>>> bits, atomicity is not guaranteed.
>>>>
>>>> I don't think cache atomicity is what we're after here—rather, it's vCPU
>>>> halting atomicity.
>>>>
>>>> Consider the following case:
>>>> b++ = XY_CTRL_SURF_COPY_BLT;
>>>> b++ = addr;
>>>>
>>>> If the vCPU is halted during the instruction that stores
>>>> XY_CTRL_SURF_COPY_BLT, the address will be invalid. The GuC executes the
>>>> batch buffer (BB) that is being programmed as part of the VF save. This
>>>> will clearly cause the BB to hang due to a page fault on the copy
>>>> command.
>>>
>>> okay, perhaps this is what is getting me confused most
>>> what I don't understand in the flow is: why GuC is already
>>> executing it or going to execute it while you are going to a halt when
>>> writing the command to the buffer?  and not writing to the buffer first
>>> and then sending it to the exec queue?
>>>
>>
>> It how this feature was architected, will send over SaS link of the list.
> 
> It probably deserves some comments around the code on how that works and
> why we are doing that.
> 
>>
>>>>
>>>> If the entire XY_CTRL_SURF_COPY_BLT is stored via an AVX instruction,
>>>> then either the GPU entire instruction is written or none of it is. I
>>>> believe vCPU halting guarantees that a CPU instruction is either fully
>>>> executed or not at all—regardless of how many micro-operations (uOPs) it
>>>> decodes into. If this guarantee does not hold, then the entire
>>>> architecture of CCS save/restore on PTL is fundamentally broken which is
>>>> always possible.
>>>
>>> Okay, this is guaranteed. I mean, the vCPU won't get halted in the middle
>>> of the vmovdqu nor vmovups. only before, between, or after them.
>>>
>>> But is this uncached and/or coherent? isn't there really any possibility that
>>> the command finished, but GuC mid-flight executing things aren't still
>>> seeing different cachelines?
>>>
>>
>> The GuC won't start executing until vCPU unpause on the save flow.
>> Restore flow is bit more tricky as vCPU are live when this happens but
>> we can W/A that race in software I think. That part is not in this
>> series.
>>
>>>>
>>>>>
>>>>> So, imho this patch is introducing a unmaintainable, complex, and fragile code
>>>>> that is not even doing what it is claiming to do. But I will be glad if someone
>>>>> can challenge this and prove me wrong.
>>>>>
>>>>
>>>> Let me know if the above makes any sense.
>>>
>>> Okay. But how to handle cases where AVX might not be available? really not needed?
>>>
>>
>> This iGPU feature for PTL so shouldn't be an issue as PTL has AVX
>> instructions.
> 
> Some comments around the code about that to be clear that we don't try to
> reuse this later in any discrete.
> and perhaps an assert ! dgfx?!

this was already suggested offline to make checks for all prerequisites when declaring readiness for the full migration support,
and then just add xe_asserts here without any misleading runtime checks
> 
>>
>> Matt
>>
>>>>
>>>> Matt
>>>>
>>>>> Thanks,
>>>>> Rodrigo.
>>>>>
>>>>>>
>>>>>> Matt 
>>>>>>
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
>>>>>>> +{
>>>>>>> +	u32 instr_size = size * BITS_PER_BYTE;
>>>>>>> +
>>>>>>> +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
>>>>>>> +
>>>>>>> +	if (IS_VF_CCS_READY(gt_to_xe(gt)) && static_cpu_has(X86_FEATURE_AVX))
>>>>>>> +		memcpy_vmovdqu(dst, src, instr_size);
>>>>>>> +	else
>>>>>>> +		memcpy(dst, src, size);
>>>>>>> +}
>>>>>>> +
>>>>>>> +#define EMIT_COPY_CCS_DW 8
>>>>>>>  static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>>>>>>>  			  u64 dst_ofs, bool dst_is_indirect,
>>>>>>>  			  u64 src_ofs, bool src_is_indirect,
>>>>>>>  			  u32 size)
>>>>>>>  {
>>>>>>> +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
>>>>>>>  	struct xe_device *xe = gt_to_xe(gt);
>>>>>>>  	u32 *cs = bb->cs + bb->len;
>>>>>>>  	u32 num_ccs_blks;
>>>>>>>  	u32 num_pages;
>>>>>>>  	u32 ccs_copy_size;
>>>>>>>  	u32 mocs;
>>>>>>> +	u32 i = 0;
>>>>>>>  
>>>>>>>  	if (GRAPHICS_VERx100(xe) >= 2000) {
>>>>>>>  		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>>>>>>> @@ -673,15 +707,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>>>>>>>  		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
>>>>>>>  	}
>>>>>>>  
>>>>>>> -	*cs++ = XY_CTRL_SURF_COPY_BLT |
>>>>>>> -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
>>>>>>> -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
>>>>>>> -		ccs_copy_size;
>>>>>>> -	*cs++ = lower_32_bits(src_ofs);
>>>>>>> -	*cs++ = upper_32_bits(src_ofs) | mocs;
>>>>>>> -	*cs++ = lower_32_bits(dst_ofs);
>>>>>>> -	*cs++ = upper_32_bits(dst_ofs) | mocs;
>>>>>>> +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
>>>>>>> +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
>>>>>>> +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
>>>>>>> +		  ccs_copy_size;
>>>>>>> +	dw[i++] = lower_32_bits(src_ofs);
>>>>>>> +	dw[i++] = upper_32_bits(src_ofs) | mocs;
>>>>>>> +	dw[i++] = lower_32_bits(dst_ofs);
>>>>>>> +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
>>>>>>>  
>>>>>>> +	/*
>>>>>>> +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
>>>>>>> +	 * save/restore while this sequence is being issued, partial writes may trigger
>>>>>>> +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
>>>>>>> +	 * write the sequence atomically.
>>>>>>> +	 */
>>>>>>> +	emit_atomic(gt, cs, dw, sizeof(dw));
>>>>>>> +	cs += EMIT_COPY_CCS_DW;
>>>>>>>  	bb->len = cs - bb->cs;
>>>>>>>  }
>>>>>>>  
>>>>>>> @@ -993,18 +1035,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
>>>>>>>  	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
>>>>>>>  }
>>>>>>>  
>>>>>>> -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
>>>>>>> +/*
>>>>>>> + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
>>>>>>> + * save/restore while this sequence is being issued, partial writes may
>>>>>>> + * trigger page faults when saving iGPU CCS metadata. Use
>>>>>>> + * emit_atomic() to write the sequence atomically.
>>>>>>> + */
>>>>>>> +#define EMIT_FLUSH_INVALIDATE_DW 4
>>>>>>> +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
>>>>>>>  {
>>>>>>>  	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
>>>>>>> +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
>>>>>>> +
>>>>>>> +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
>>>>>>> +		      MI_FLUSH_IMM_DW | flags;
>>>>>>> +	dw[j++] = lower_32_bits(addr);
>>>>>>> +	dw[j++] = upper_32_bits(addr);
>>>>>>> +	dw[j++] = MI_NOOP;
>>>>>>>  
>>>>>>> -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
>>>>>>> -		  MI_FLUSH_IMM_DW | flags;
>>>>>>> -	dw[i++] = lower_32_bits(addr);
>>>>>>> -	dw[i++] = upper_32_bits(addr);
>>>>>>> -	dw[i++] = MI_NOOP;
>>>>>>> -	dw[i++] = MI_NOOP;
>>>>>>> +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
>>>>>>>  
>>>>>>> -	return i;
>>>>>>> +	return i + j;
>>>>>>>  }
>>>>>>>  
>>>>>>>  /**
>>>>>>> @@ -1049,7 +1100,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>>>>>>  	/* Calculate Batch buffer size */
>>>>>>>  	batch_size = 0;
>>>>>>>  	while (size) {
>>>>>>> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
>>>>>>> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
>>>>>>>  		u64 ccs_ofs, ccs_size;
>>>>>>>  		u32 ccs_pt;
>>>>>>>  
>>>>>>> @@ -1090,7 +1141,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>>>>>>  	 * sizes here again before copy command is emitted.
>>>>>>>  	 */
>>>>>>>  	while (size) {
>>>>>>> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
>>>>>>> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
>>>>>>>  		u32 flush_flags = 0;
>>>>>>>  		u64 ccs_ofs, ccs_size;
>>>>>>>  		u32 ccs_pt;
>>>>>>> @@ -1113,11 +1164,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>>>>>>  
>>>>>>>  		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
>>>>>>>  
>>>>>>> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>>>>>>> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
>>>>>>>  		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
>>>>>>>  						  src_L0_ofs, dst_is_pltt,
>>>>>>>  						  src_L0, ccs_ofs, true);
>>>>>>> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>>>>>>> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
>>>>>>>  
>>>>>>>  		size -= src_L0;
>>>>>>>  	}
>>>>>>> -- 
>>>>>>> 2.51.0
>>>>>>>

