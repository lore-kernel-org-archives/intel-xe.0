Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FF2CA0EED
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 07:52:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9B510E246;
	Wed, 20 Aug 2025 07:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="myU1Q+KN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9699810E246
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 07:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755676364; x=1787212364;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KF8d308+aWzCyiy45HSYox6wvQX0ED/F8A5g54Fysg4=;
 b=myU1Q+KNqHtHOyfWDxRnjCfoaWbABybqtnDKhVIb90yateIxUz7+hU97
 zOFotN/DSJZaPXQSe2EmPN2SYC/9AFNWkD2KgsryWk8Qi4vc9wu2rZ3RM
 8vJ6ULw1z+bh0K4GTTbDuBFIp/QfOLK4lwvZuC32fAHbvKNscJDdeXjkm
 /TTHXrhbKZgflO0Bg3Vm4sd+psEWUGuDWyYm7k4tCpnB14YOWwQOMIO6S
 jFWPB6xuNFVZBT+rpN/l3sROIM3hbclsUMVz1St+OC+M79adE3Bj0Pvj4
 kFUTZDNJcbtgH8hQBW165dmB5Y+aAGfO9IRmN7dQYKc9U5YYjgRBIWhwx w==;
X-CSE-ConnectionGUID: pDPs56EcTr+F9NhLBLKDlw==
X-CSE-MsgGUID: BESvlLWeTRafws5mea58xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57795285"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57795285"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 00:52:44 -0700
X-CSE-ConnectionGUID: 7s/QKR3STraqFkD5eIBZLQ==
X-CSE-MsgGUID: edB5Fi3KTSSz9h+W8W23FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="199062684"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 00:52:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 00:52:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 20 Aug 2025 00:52:43 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.77)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 00:52:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xdlm4zQroWDRFNBT6NVHgilIb5cxV62mgveVF4nJquqcnPKrycAz1cMuP8AuDzkquuj1JfaKx103DM10WDK2HMnAeRvpanitWP2EmIna+mVlZqyrkxKjMbQZ0HhUQYTua/Uxhha8Ba43O3ZbX+oD2cvE3A7PVdoO2MAlw9qeTKnSOlx5FeMy92ayISlXqQUnoJc//tKyIS/4WjpNY6tN58/VDAhv/1rx3MyJWRKIBCMvA42/mAMmmi3o6a68fRpR4Qv/op0akDLIqoz+8HKy1i24RZQdbhHjuraMLj0dFIXFTWbcMOj1QfKzR94C4R0EETqDFYQZnMb3R6bA+/hAgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bu+Jz3aAkYNe8YF6bjmA9l1boAC1Qj0UVgo4LK72GME=;
 b=sc7Wt/pjWWmjoflf6yb2GpjqT1Kw5sQzo8Wpn55Ht3CRnM7o1SKbMEacYqm1macar6Dg+0vWNce48H2z6Kk7ekypHgXGmXZ5umAGhk9YGihEfkQUDGs7hJ8kmdq6Xo8F8p6BNTaG/XX8JGd+ZLdxsEGSnfU4YLiKeJU0nIGPNAJ0nw2HeC3/p4Kg99luEWyBbFCQXZBGkyYgTmaFx0Ly3+3aZ3duNaobKrw3gBtCLYekunh3daLy9dtQQnZXog8tbtc/WjQqL3ioHWoH6lRKDv4cekQzGqrjiKKW35gcOKBLY3Btte2d/YccxQKqaHSf0NkRplfepFQmeDOb6yqWBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.23; Wed, 20 Aug
 2025 07:52:36 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.9052.013; Wed, 20 Aug 2025
 07:52:36 +0000
Message-ID: <574b0341-1bbc-4916-85dd-5ea7c4052cf4@intel.com>
Date: Wed, 20 Aug 2025 13:22:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/13] drm/xe/configfs: Allow to enable PSMI
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <prashanth.kumar@intel.com>, <dnyaneshwar.bhadane@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, John Harrison <John.C.Harrison@Intel.com>
References: <20250818-psmi-v4-0-a330783ce1c0@intel.com>
 <20250818-psmi-v4-7-a330783ce1c0@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250818-psmi-v4-7-a330783ce1c0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB6098:EE_
X-MS-Office365-Filtering-Correlation-Id: 646084c8-e9ba-464a-9ce4-08dddfbe86ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZG5uVlhGa3lDRkVkbnZXVU92aVFjbi9IWndOcTViZ09Damt1K29wWHA3UGZk?=
 =?utf-8?B?VjMzdWRVRkdzZkkvODdtYlRnNG0zY3NmTGFRZjh4Y1RsQmlnYldBUzlMWWNH?=
 =?utf-8?B?T295aS9zcWl2b1pBb3JEL0Y2YnFCYWxYVE1pOW1uOVlwcDNGWElTejNyMlZ2?=
 =?utf-8?B?bG5YeWhkb2xDa3BHTGZrc3VBeTVtdStRT3VrZ2lIZkNNQ1ZhRXo2TEtuTDVV?=
 =?utf-8?B?SzgvbGFBeFZRdlEweElkV2FKMGxLMS84WWlnWXp2aGF4Mk1DTlJJVGFPQlpw?=
 =?utf-8?B?MUt2Sks2eUNqekVJYVhxbG9WM3d0UzBVNURjZitNcVJGWFFzWVYzb2Z1SDFO?=
 =?utf-8?B?S3p1aGRaRFNJWVA1VXlmREJWY1k1bXROK1JITXZLZWkwZVlCbmc3SEh2bkVD?=
 =?utf-8?B?aVBGSHVmSUw5a2tnQmZRS2pIVEVkdE84MVIyak4yUjlBdmZZQWllMVdVVERR?=
 =?utf-8?B?UFhsYk1RUEhDK0Z3eDYxZnhmb1JtTnRxMlo1dzMrdEdROFA1RGZRK0c3MjlD?=
 =?utf-8?B?VXRwQnNwalkxcEhIc05PbWJ0MU1rUFpsZnR2N2hXTDNsRndoU3JrMWVRc2p2?=
 =?utf-8?B?WUFUQ3hTUmFPdVEvZHZuVG1nVXJLSjdHNlVkbVY1bWhtRDFTc0lQcFNWVHJ0?=
 =?utf-8?B?VmdIZGRkOGE0S3JQZ3lSNTRzZU50OVREb042a3pVUzQwOGpIWUYwWFBQZGRI?=
 =?utf-8?B?Q3ArVitjN1RDOXhHcnNyemMzSkN2WmNXLzFSTGNSckY0eU90THJUWW1uVkYv?=
 =?utf-8?B?RCsrR0NRVXRZZ2h2STh3WmFycWpwTEJBaUtubURuakovejV1Szc2OTlCdUZ5?=
 =?utf-8?B?SEJiRlp2SWQyQml2WTdZOW81WFo1L3Z1eDR2S2dFY0Z6VHFtRkFyWk9mNmZB?=
 =?utf-8?B?M2pkV1RZa2NpWlY4bkJwdWNVcHNkaVlrMVdRMXBPMzJRVVE0RDJ1VHpCcnh1?=
 =?utf-8?B?aUUrVGd5VURHNjNJZWdjMTI5MVVQMDVJVERCUGhaQmRLOUJFOHdGL3A5eFNt?=
 =?utf-8?B?ZUdlTzZzcTM3TEUycVBYZngwNXU3L1JxODNVSGd5M2M4WXdLQytEWFFqNHJT?=
 =?utf-8?B?Y3VZNlBxbWROY0dWS2xlU3N3dUhCVXc2Z2p0THlqOURpdUZyVzFMbDVZUXlj?=
 =?utf-8?B?eXIrYlBiOW1kdmpKU1YxMWc2UE01SEt0YkQwWUphWFUxUTZZRzdicGJCQlJ2?=
 =?utf-8?B?L2Excm8vcGlTYzFQRWhEMjlGL1B6UzY0ejllWmF0ZXBSSUpWMEIyMVFmbE84?=
 =?utf-8?B?YytTZXdWTVZzUFE2TE1XZDdhRnBqdTVQSW1nY29NU1pJamdNb1NUWjltUk5C?=
 =?utf-8?B?UXZ4THVDSmhmakpGTXlscnFoQldMSlllSGkrelpqRXB0bll2YUxjUDdjRzhh?=
 =?utf-8?B?VmFlbnJHSEFta3B3QktBVitrVGI1SWVoWXVQRXNPQmx5K1FiRUQ5dG9YRERF?=
 =?utf-8?B?VUlIM3l5Tm5sMGNscFFHNkdCbm9PKy9OVFFYYjRWbTBQalcyVEhkYmJWYVhQ?=
 =?utf-8?B?dUdlRXlBQmZXbjBlQXBKMkJDS2dXNFdRVHVqbGQxY0xJbVRtWFc1NnUxOE9Z?=
 =?utf-8?B?bGwvM0o5M3NXNzZKc0JqaDg3SDdQTnhUcnB1SEFVSHdwbWhMTmt0ZTdtVDIv?=
 =?utf-8?B?THRLR0wwUUdpaE50eUVVVEE1QkFmQ3VOUW1NZmJaTHF6dnFTZS9nSTBKNTU4?=
 =?utf-8?B?aU8vbzEyWXJvcUphMk5XT3V2am95WlpwYWVpSEw4aHRSN0VJUG53TkhDV2RH?=
 =?utf-8?B?aFhWR1k2T01jM2htV3VIZzh5ejgydFFXejVBeHN2K1hXZmlMWUtXRUdiVkdS?=
 =?utf-8?B?UThwWUtwS1UrWVlBdGNlRDc4U0IzQlFReFRKU1dIU1JTRjNENUprTldDOTh5?=
 =?utf-8?B?cnlVcnMxK1NhdnhMcGpNUDVTR1hXWHJDdTVTeW44djBnSnE1OXBFRWE4d0li?=
 =?utf-8?Q?xNfZxKu9J+Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEJNVVFSNVozS0NneHB3aTZyWEsrdTgyQXJOUlphOTJWdGtuNjQ1cHpuYzgz?=
 =?utf-8?B?YUcwTnhMS3hqbHFCa0lFcGMyNUMrVTJOSlI4Umt1QjlheGZkemZYMGRiV296?=
 =?utf-8?B?akhsTnllWGtIOC9NMnJEOG1FS0kzb0l4NGoxNWxmOTRQWkN2RThNdlg1QnBG?=
 =?utf-8?B?bHhOQklQSlk0cGpVSjBwa3VJMVJRUGFIQmZHaHBUNmxML1pqb3UrdU5MZVUx?=
 =?utf-8?B?N1RIcGhUVThiZnRtaS93a0dqRHRUbnl1bzZvMHJsRldWRENjZTRHZzlhZER3?=
 =?utf-8?B?Ly80RnJuNXFudEVjZHdMdnZXbGhPWnVaOXFpTGx0c3JpckRxQlh3MG95WUpr?=
 =?utf-8?B?VHNDVWRndWpmbWxId3luUktyaGJSWEFTbVVKNHBrc2xYNVpjUXhFUjhIQm5H?=
 =?utf-8?B?OWUwelhoK0FPdFNpaktVOUVwVUVGdmFIK3VKbVlqZVdoRDFocmVoRHN6cldm?=
 =?utf-8?B?MzQ5ZmVEUzVpY1lGbVNqUFlsMWdLVXBFRzVaQmlFNUppSjcvVzN0TTBjS0hv?=
 =?utf-8?B?M0ZHNHNlenlJekh1VUhrcy9hOEpMYTdnNm0zMHNja0R6VUF2Y2E1RVdVS0d5?=
 =?utf-8?B?NFRmVFkzekRpNjlPTzUvZnNwbWJ3b2ZqQzVJMFhZbFpuVXF0TEk1RGJHaEJo?=
 =?utf-8?B?VWtNblJGTUV5QnNCcXU3TTFnRlJESHhIS3llNjdOTkdmcWQzSWlZazFNK09F?=
 =?utf-8?B?U1ViRE5Hd3hmTytWVmVRN3l5TFRDY0JSMUwyVWpkeGUxbjVUQ3hMWFBTRzVh?=
 =?utf-8?B?OU85Q1Zjck9DRkZCdlp4WDF0VlJSN3A1eFhBMU5jUlRyVFl3eFNJaGVHOTNW?=
 =?utf-8?B?SU1iQUwzR3JkdjdqR0l4VlZsdVdsTTR3TUpudHFpYVBrK0s0VWlsaUxaRUVK?=
 =?utf-8?B?eGh3ZVFwNWl1R1ozVlhpVzZQTjlXbS9sNVcwaUEwZEUvRHFmQ3JoYkZPS0NU?=
 =?utf-8?B?V2xRNWdMc1hmazVUVW8yaXFaemZvSHRYaVJGc012Lzdlayt4Q0VTLzRGMUlT?=
 =?utf-8?B?VlpWaHBIZTVWV1lwWE8rd21CR0ovc1JVc0hRbjlHZmxiRUZtK2pDNkkvNDNI?=
 =?utf-8?B?RVN0VzhPN1paUHJHVzZYVllpZHJMWXJyM3VYUmZuTDBTUEJBZTNyTXMzdGdG?=
 =?utf-8?B?dzNRa1l2b2FrVXdmRDF5TkV4WDIwTnJ6bWlLTHZjT25vb0V1ekR3blR3eGtF?=
 =?utf-8?B?d3VyM2lrWkxXcHhZeVpsOE94KzhrTlQ5cnJLNFFFYjVCZ3FXRDhjcGhGSmQ1?=
 =?utf-8?B?T0tyd0NNRTgzVXkzQkhKV1YyNjhEZUpCRkJET1BlQTM4Nk54QWJVU1U0WlAr?=
 =?utf-8?B?Y3dsTEZQa01zb3JCL0orMFRvejNkODFFelFjUW92eXdtMnJSZjM0cGRNS0lz?=
 =?utf-8?B?OGE5TTRFOXY5QUdxOW5paE1HYk13TFFoZDVWSG1xTHBReFgxUHY4OWxvekp4?=
 =?utf-8?B?MzNsRkhHSjcvSHcyR3VpMjdDdEhQVFoyQUg5ejAyTCthRThOSmJla3U2ellY?=
 =?utf-8?B?NzAxMG9OU2Q1NVZQZnQvQXBNMUh5TkgwRkRQMVV4OTlaRVFhU3RNa3hxdXQ2?=
 =?utf-8?B?SzZ2ajhUb3Z6akNXMUowZTBxOTh5NStRNytrS0xLc0I5SWc1azNMMnFuZDYz?=
 =?utf-8?B?b25USytSdmxiTm1ja0tYbDYyU252R080Q2N6VVpFdDQvMTJvUFJBMjNLT09r?=
 =?utf-8?B?NkYwc1RWcFl4NlplWDlMc3FlcXJlZzkwb29QZER4MnpibEMwbHVGNTBtMGQ5?=
 =?utf-8?B?RkJFYjhDenIza1ZtYm83eHBmM28wNFRYdC9VckJySUhtdHBTcnBXMC8zS0lB?=
 =?utf-8?B?dklLL3BXbE16aFExTjNmVWJLSUNvQU9sVE9QUGx4SFoydUlQWWRieis4ckli?=
 =?utf-8?B?eS9vcUV3biszekFpdHVjZVlld3BqT2tRTktvbFJwMWFJd0xNWnE4YjNwTDRX?=
 =?utf-8?B?SFg4NTJ0QTNyTzNiSzQzVDNPTEhVYWhud3RtUmp0YTFEdjZGU2pMNDVVelY0?=
 =?utf-8?B?QXNNa2svTnpBeHJDS09qM0R4T0wrN0FqQjVhN3pydXN4S3EzSnloZ0F3bFRY?=
 =?utf-8?B?dTgyTmhCWmxyUnlpSE5kZ0g3cllCMDdOL1UvaWZUR3NQZEVoYThyUWJaQjZV?=
 =?utf-8?Q?BoSszWq246OmQYvqTA9EM2R/C?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 646084c8-e9ba-464a-9ce4-08dddfbe86ef
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 07:52:36.0717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJOcCqppX7LQNp2sB44O5UKVkdlPfIh+oCm+/DXCIXy9KIgIMOE/Wwh3seFIB0So/Ky4TyLEzKHIqaNY9K1/vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6098
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



On 8/18/2025 11:07 PM, Lucas De Marchi wrote:
> Now that additional WAs are in place and it's possible to allocate
> buffers through debugfs, add the configfs attribute to turn PSMI on.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> ---
> v2:
> - Define CONFIGFS_ATTR in alphabetical order (Riana)
> - Use to_xe_config_device() (Riana)
> - Fix typo in documentation (Riana)
> ---
>   drivers/gpu/drm/xe/xe_configfs.c | 66 +++++++++++++++++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_configfs.h |  2 +-
>   2 files changed, 63 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 17b1d6ae1ff6a..61376dfc74bb3 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -77,6 +77,16 @@
>    * available for migrations, but it's disabled. This is intended for debugging
>    * purposes only.
>    *
> + * PSMI
> + * ----
> + *
> + * Enable extra debugging capabilities to trace engine execution. Only useful
> + * during early platform enabling and requires additional hardware connected.
> + * Once it's enabled, additionals WAs are added and runtime configuration is
> + * done via debugfs. Example to enable it::
> + *
> + *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_psmi
> + *
>    * Remove devices
>    * ==============
>    *
> @@ -89,8 +99,9 @@ struct xe_config_group_device {
>   	struct config_group group;
>   
>   	struct xe_config_device {
> -		bool survivability_mode;
>   		u64 engines_allowed;
> +		bool survivability_mode;
> +		bool enable_psmi;
>   	} config;
>   
>   	/* protects attributes */
> @@ -98,8 +109,9 @@ struct xe_config_group_device {
>   };
>   
>   static const struct xe_config_device device_defaults = {
> -	.survivability_mode = false,
>   	.engines_allowed = U64_MAX,
> +	.survivability_mode = false,
> +	.enable_psmi = false,
>   };
>   
>   static void set_device_defaults(struct xe_config_device *config)
> @@ -243,12 +255,38 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
>   	return len;
>   }
>   
> -CONFIGFS_ATTR(, survivability_mode);
> +static ssize_t enable_psmi_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = to_xe_config_device(item);
> +
> +	return sprintf(page, "%d\n", dev->enable_psmi);
> +}
> +
> +static ssize_t enable_psmi_store(struct config_item *item, const char *page, size_t len)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	bool val;
> +	int ret;
> +
> +	ret = kstrtobool(page, &val);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&dev->lock);
> +	dev->config.enable_psmi = val;
> +	mutex_unlock(&dev->lock);
> +
> +	return len;
> +}
> +
> +CONFIGFS_ATTR(, enable_psmi);
>   CONFIGFS_ATTR(, engines_allowed);
> +CONFIGFS_ATTR(, survivability_mode);
>   
>   static struct configfs_attribute *xe_config_device_attrs[] = {
> -	&attr_survivability_mode,
> +	&attr_enable_psmi,
>   	&attr_engines_allowed,
> +	&attr_survivability_mode,
>   	NULL,
>   };
>   
> @@ -443,6 +481,26 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
>   	return engines_allowed;
>   }
>   
> +/**
> + * xe_configfs_get_psmi_enabled - get configfs enable_psmi setting
> + * @pdev: pci device
> + *
> + * Return: enable_psmi setting in configfs
> + */
> +bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	bool ret;
> +
> +	if (!dev)
> +		return false;
> +
> +	ret = dev->config.enable_psmi;
> +	config_item_put(&dev->group.cg_item);
> +
> +	return ret;
> +}
> +
>   int __init xe_configfs_init(void)
>   {
>   	int ret;
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index c14588b86e833..603dd7796c8b2 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -16,7 +16,7 @@ void xe_configfs_exit(void);
>   bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>   void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
>   u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> -static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
> +bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
>   #else
>   static inline int xe_configfs_init(void) { return 0; }
>   static inline void xe_configfs_exit(void) { }
> 

