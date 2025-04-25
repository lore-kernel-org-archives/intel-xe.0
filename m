Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E68C369C2
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 20:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3132C10E9CF;
	Fri, 25 Apr 2025 20:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JYJcgN39";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F28A510E9CF
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Apr 2025 20:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745613331; x=1777149331;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9QqcSD9RxJUIu/4xu8e/CLvReskgajIka5iB+rxTlGg=;
 b=JYJcgN39VFkyMXrCHyE32xNNk5+r2h1bMseWitpIPs8nsvEssXUiR0DC
 srGTf6opN2VQi+JyPpGVX14CGj4gRPpbYPVWiuMmgohDAOOgo6hj/Gsqi
 BeuAc8b5rTwmBXJQKjqKxl6V6Yk09ePSbYV//zKlRwc9S8fTZuEpKDTHC
 PsK9g54GiEAAcWZ6N2Ph8kbtMepGjfsWKYYpx0d42RDG6dGTPl+GaBZvJ
 s5pGIa2lLM5QwfyB7k5X6G88+otOHvdf2UJwiOIIQzzINGtFHnYXxd0hA
 I/4PYUgUy9+oFuAgHrccvlIwwvNAArCowE+9HMtvffCPoM6g/8PZYpECj A==;
X-CSE-ConnectionGUID: GuWuORHdTQa/6OfsC2NTqg==
X-CSE-MsgGUID: I541WKnoS5G5CpJNtC4Ugw==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="34900217"
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; d="scan'208";a="34900217"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 13:35:30 -0700
X-CSE-ConnectionGUID: 3s04OxrORvmAwg5ErT5I9A==
X-CSE-MsgGUID: QU7leFCKRo2e+fzlydsmbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; d="scan'208";a="133968639"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 13:35:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 25 Apr 2025 13:35:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 25 Apr 2025 13:35:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 25 Apr 2025 13:35:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GAtY0kIylxjU3If0ZVzRjQ5Ji9Yx55xab7Ft5yHarFtAbptRBEUA4W6y5nQJD/jSqs4DWaxW7vUFDGqhCeajy0GNLDGMV9kWXeFfb9dCcL9/YuTPpfYq9icgfTGGBuE2NZRzauyG+qz18rDDylNzdTTVZjezfvWQHqyM5r6tSQ4HTzdZPyu8zEoNFGJYvGtAckTS5TtkyjrYToRTLexfAFsjoUrPhsCMSsWR4etdPROikOg74J2OoqkgcGbiwdkCimh5DbBGSD/c4sQSNiT1/SDEDEFsYkTiWajd5QTJsthtMil+eSaUB8bK8//ndnV+OPR+9eX2suJVdQ6amZM9iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TiRomBsH2sPXWhjvxkQCgxW76CA1b/TdlqizKHXMWhQ=;
 b=COoIIxHSRbrP3+FspB3c3YKOUlS1OL2q2JC+QQT12/lWj1cE4ss4ZOsmzP2rEqqBg5Sd9LY0kvfKA6+/s9hOFFHN+X70NvvVT+cVQrvuR8uA6hvAfSofDn6tnc6ddWp0MMMp+NZjoXxnZve924rxxX1nHjT6LF8j1nn0leLuduRG7Sad8A2nbLU3sCOIf1/zkpQBecNg0coMqprR4DAUzHuHvcQOGvicObWERHIdC2Tp/LA7qDjdusr4fVFCZDhpg7wJDUmHxy4kw7XfE4tqvaddX8Ab52MuYXIgDwF7yhGo2DbyR5SUOp8jDvYRvcHbNAtIVO9KvsKXxoy5dasuNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB6605.namprd11.prod.outlook.com (2603:10b6:510:1b0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 20:35:26 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 20:35:26 +0000
Date: Fri, 25 Apr 2025 13:35:15 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Add WA BB to capture active context utilization
Message-ID: <aAvyAw7fiN1H0wqy@unerlige-desk.amr.corp.intel.com>
References: <20250425191039.1551559-1-umesh.nerlige.ramappa@intel.com>
 <aAvljJkPgAXhA8cs@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aAvljJkPgAXhA8cs@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW3PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:303:2b::17) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB6605:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d763d4a-cf80-4ac2-c437-08dd8438b5bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDBXUUkxWkZEU1MzNTdjamxHTmQ2TFd6U2UwdXF1emdTbS9wd3JZVjdDTkxx?=
 =?utf-8?B?OVVlM2RsZ1lwWUtTMlpjWk5IZjFqNFYxTUxjQlNKRnIxdVZxSHNkNEl4QTAv?=
 =?utf-8?B?OU80bTA0MHVrUXN1eGVXYUNnYnlFSDVENDZqS25BREZlWHRyWXowc2RpY2tk?=
 =?utf-8?B?QmxVRS9lQlZqa1BobWdlNHBzM0ZFRWdDcnFDQ1ppZWJnNFpUSTZyc2RlYUtO?=
 =?utf-8?B?NEFDaHVzWTl5MUY0VkhLL2NhLzZBYmpvUkxIeXpHRm91MVlhb3JGMkJhL0M2?=
 =?utf-8?B?cUt4Y2luTTdJK0NFMFRuemZJQUNpVW5ETUpvSURUbDdNOE5FZ3FuNUloM2Fr?=
 =?utf-8?B?VVd1amZ0UGJSbEo5M3MvZDNKckE4RWdNMzRnVHUwVHNNeTYrT08xU01EZEZx?=
 =?utf-8?B?MFVNYzBIeXRleDVHOWZvZStnbEdkT05XN0U1REhhQlo5K0VPdGdmeU1vSm5a?=
 =?utf-8?B?RVR2VFVmN0ZGOEVBU1ExdlpQSVF5U3lLRU1vc1ZkcXJ4NVVieVNvZEJFbGRa?=
 =?utf-8?B?aFJDY1dhVXNYNVNDeGMrYVVidzdZV3FNOTFRR2pqakdLUlRFeVEvOVZEOVhD?=
 =?utf-8?B?L0w5SHpaMjhsNTF4OFBGZXJDdUQ1cHlIaU9RV2htY1dWRWFGQzM3Zzl0Q3Nl?=
 =?utf-8?B?VHdZMTlLdlIwT09RYWlIV0dWaVRROGc4ZkFUUmtLQTlKdkw3S3lVdWdaaEFz?=
 =?utf-8?B?Vzk4eFUyUThpUmZqdS9KSmJCRXNIczU1ZnJPeWlHRnJ5WmV5UHVva0laRHQv?=
 =?utf-8?B?V0o0dld5TG1velltVDZQRU1ZN2tIRXl0OEo0SElOWmZmOE9HT1Vqc0FwdlNZ?=
 =?utf-8?B?OVpQVzlNaTRrNkVha0FaamtyWXlReTlOVWhFUTNOUkU0amJaT3FZeS9Vc05v?=
 =?utf-8?B?bm1KYVVRQ1Qzc2JQeGwwaG5DNUVtVEFDNWhLTXhITUdzaHhmVEhQaTYvZEdY?=
 =?utf-8?B?a3VRclhWNEp3TGtVQjAwbUJzM2lONnpSaXV1M2JQNncrUmdwQ1JVYlpReThv?=
 =?utf-8?B?Uk9rbWRUa21PRG9odk9MbXRVM2VEbHhGNVJxVlhvakRPcmZKRjVSZDBpNU9z?=
 =?utf-8?B?TFlKRnMvZVMzUnQ0OHVVSjhaQlJJUWxPSkZ1c3dPMzdXc1pHYlVWT0FwR2Yx?=
 =?utf-8?B?bks1Z1NhalppY3A0cGFhVjF5MERCUDd2ZFkxSzMvcGNnU2FGL2hwakltbm0y?=
 =?utf-8?B?aW96ZGRSYWVQUlJFWVkyODhPUG5ieEdka21sSStONWdoRVRMTTcvMnlQTzUw?=
 =?utf-8?B?Y2xQYW1ab1hNZ2ZNTjJscktNc0tUeEwvRElEMW9WU3hNVzVXQ3h5dW1PQzdO?=
 =?utf-8?B?bnRVUEdjNkhwOTZTR3dMZ3dReTVHbE0vdDFUTzRkbzREa3NQNzZGM2pzbTZS?=
 =?utf-8?B?b2N2em8ycGZGOHY1YU15WDJyeE4vQUk2K2lsaW1WdzRhM2dzekN1Y2JsRnRS?=
 =?utf-8?B?QlZQb2lPVTJoUVdrbDdZWktPaExieXB6WUpScllUd21JOTdmemhTSldBWUFJ?=
 =?utf-8?B?RlMwRTNGZVJkdTdnQmppcFFlSFpvSGZkaFhxcjBubTdZMys0RG5oa2U4bUtm?=
 =?utf-8?B?cThHL1FxT2ZwSUlNZlNwWDZQdjFHMERnMWdJRGNPdlVKRUNOdXU1SkxyR0ZZ?=
 =?utf-8?B?Ymdlcnp0SDdnQ3BCdlR6QVlaak9TcDJweE8reDk0eWRHOGhkWEJUamVJN2xT?=
 =?utf-8?B?clBpbWRJMm9yT0t1YlR2V3Jia2ttOE4ySjFjME55T2ZjQ1Faem1xMzBYTWpk?=
 =?utf-8?B?eXo5M1hVeUtkT2s4RjRpWHVzQy9DL29pcVhMN0tBQS8rdTVwRHU3SnJ5VmFt?=
 =?utf-8?B?SHdzT24xMVF0MWs0Uzgrc0JvUWdVNm9JOElkYlJYQ0hvYTNIdjY2bVQ4dXNJ?=
 =?utf-8?B?SUxYTldXaTR2RHlCRXErS3VjclYwR3VtRUZwWG9sWlRxYXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFA0ZTBqK1ZuR1RQbGVnK2RyOHFhN3BTUVlValhOdGR1bExtZFhVcVEzUkFn?=
 =?utf-8?B?am9CWTdSRzJnRnlTdS9wR2VwN1A0S2ZxZThYUEc2T0FHR2ZxcHhMVWpBNk1j?=
 =?utf-8?B?akZxVmoyL1RTUnNiT2JlbTNDQndrSFMwZTMxMlo2UnlOdU9XRERvY0RoK0Q2?=
 =?utf-8?B?ZlNLK3hLS09lUWpicEcwSnViT3BNTmFlM0tMQklJSDZTWW9IMGViNk1rV1Zi?=
 =?utf-8?B?MlloU3djWUZoZHhrL3RCRkorOEhTRVFieEVJQnNtZTJzV2o1TDcvYmtIaHhF?=
 =?utf-8?B?Ymp3emxORU8zSXQ3OEFmMTZJdzBHQW5nR28rSU9QdnNOQzd2T1RnUnJlZkxj?=
 =?utf-8?B?dS9iVEFTZFRxZHJOaE1CTDQyOHJpcmJZdXRXT2s4aTQ4dkY0VWVhdWJGWWtF?=
 =?utf-8?B?eDlQWmpCdFVtU3NDMVBTbzlPeVhoNzdXZ2xReGV6SUtnNG5jSkFLRUw1a0lE?=
 =?utf-8?B?eHAyS2JwQWdlSTZzbmhISjUyZ1pzNFdFcUpaazFnUk1kWFArUk5WS25CNWRu?=
 =?utf-8?B?RDk0L0JkWjFPT0hldHpwSjhDZmlFZVkxVjJHNmwwUklYaHhJeVhOVE1NNHhq?=
 =?utf-8?B?UlNrVFBEa25kU0RxY1RGNkE5WEdTRk9pd1V5REJsRGdza1NaUTkyOFlnUEUx?=
 =?utf-8?B?Z2FCVjN3NUNUT3UvTkthdGNRWGpzbU9FbXh3MjU0QmlXaUtpUHZnRXhRelky?=
 =?utf-8?B?emoxNVoyS1N2bjZtUFl2VEdER1Z4ZElUeUd6c2d1MnpHWUhJYjFVZWFueTJS?=
 =?utf-8?B?QnRJdVBETkNTZDN5Q1R6YzdlYktnaDUraDlyNll5cEhxVitycFBBR0NHSHNG?=
 =?utf-8?B?dTNySXg1ZndxaXh2eGVMc2IxSDhydTRkOWJGODNXYy92T3BWMm9WNksvMEdF?=
 =?utf-8?B?S2wrSlNCQWJvNXhXSFp6NHZES2tOTTY5aXU2aDA2elFLZGcrSlJ5b1ZLZGps?=
 =?utf-8?B?UTkwZ2xaVXpYMTJwZDY4RHVwOXBBZkVpRWFlOStFeWJ5YXFZSnNodHF4VThw?=
 =?utf-8?B?Z2hEWVdGaURRRkFIMFNGOGZKdTE5T2pnN3FuMmtyMm1rbEVGcGpOZTRLelFC?=
 =?utf-8?B?dmRXQWZabThUeVJNeWFXODl6U1g2Qk9YVExoZ0xrTkZXcEdJTHN0ekczaFFI?=
 =?utf-8?B?T3JHcHduTzdydEVaRllCd2NITjBOMzFScDdtSFVHNFdDSDJmNHdmNDFzY0tC?=
 =?utf-8?B?TFBwaTVtcWVHRXY2L3FiSzRMS1dRbzJyaXE3NDZRamQvb0RmR2FGRE54T3lW?=
 =?utf-8?B?d2R3L2tHNGdxZUxjbVhBdUtMWDdhc2NlSDYveUZKc0x6NGVFYUlzdjQ1Tytp?=
 =?utf-8?B?Rm1nUS9neWtWeVp4ZXIyTk8rT2wxRno1RnNhV0duTkk0ckhZRGwyOVhlaGxm?=
 =?utf-8?B?SFRncnFJZW5EY0dOc1kzVTFnS2I1VUs0V2MxZC9FN1lYeGw0bzJJc2FQcGRy?=
 =?utf-8?B?dkFaUWQ2eVp1YzZIZmFESVlYalJ4V3F1dXpvNUxqNkdmSy8rTjE2NWVJV21x?=
 =?utf-8?B?OU1SeW03QVlNTmUwRUNKeDcvaGlMTHE4Y2QzZ0FZUW5oVDhXaSs5bHY2MHhE?=
 =?utf-8?B?SUNyUFhnRGEyUXY2b3huWHhWbGJqZVc0SFoyNS94NTc4NUd0TmlDRjlMVWZM?=
 =?utf-8?B?RkVnT2l6RVhkODh2b2czN0svWWN1Vm1kMFN6bWp5ZjB0VTZaTnZFS1lyTXN3?=
 =?utf-8?B?bWdWTmh4amFtU09ubDFUYXg2N3IzbUwwOVlZT0hNc0pXam9jYTVia2N4VGow?=
 =?utf-8?B?azc0Wnh4Rm0ya25PU1ExWjNpL24wSDd3VXFWekd3c0NpTjdHYlVSb2lWNTdD?=
 =?utf-8?B?SndRb3hhQmo2UG5IQVlab1V5YU1ld2pvd0RKSTlCYU5vRXhudzArVWFwdjJG?=
 =?utf-8?B?OHdGd05XU0l2Q3ozRUY2KzhtWUVRWXNURXhwK29XMFBPcjFFTUIyME1xNDlB?=
 =?utf-8?B?aUM3UG9hc0NYUGVGbWZ5NU1yOTcxZjdoeWNLWjZraWEwdlRWNThpU3F3MFhy?=
 =?utf-8?B?M1J4NERSSktGL2w4R0ZzRDh6WGVLaDBtaVNoODVVMEpJS1dYMFBvRi9Cc0g3?=
 =?utf-8?B?cDArVUlCQkFsdUpGQ3ZKdXBhdjlnTWsxQVlIdy82eWFBL2FpTDR0MUh0dG5T?=
 =?utf-8?B?clBpRUNxNVdpU1NsMExhVnp3aGpzN1puNmhld2U1L1c0cTU2bEM5TlNwenhl?=
 =?utf-8?Q?sXYklGzUR5CBfm+/Jucpg5c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d763d4a-cf80-4ac2-c437-08dd8438b5bc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 20:35:26.0399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4bDIvBR7hni1tSvk4zkGv/xjkWBnIcNhPTWXOHLsTV1Pz3X0IaxYL/Dz2byk11gPW2TA1rHu+qXhtLD+utgfzq6+H2oNxpDoDjbe+bzQ64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6605
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

On Fri, Apr 25, 2025 at 12:42:04PM -0700, Matthew Brost wrote:
>On Fri, Apr 25, 2025 at 12:10:39PM -0700, Umesh Nerlige Ramappa wrote:
>> Context Timestamp (CTX_TIMESTAMP) in the lrc accumulates the run ticks
>> of the context, but only gets updated when the context switches out. In
>> order to check how long a context has been active before it switches
>> out, two things are required:
>>
>> (1) Determine if the context is running:
>>
>> To do so, we program the wa bb to set an initial value for CTX_TIMESTAMP
>> in the lrc. The value chosen is 1 since 0 is the initial value when the
>> lrc is initialized. During a query, we just check for this value to
>> determine if the context is active. If the context switched out, it
>> would overwrite this location with the actual CTX_TIMESTAMP MMIO value.
>> Note that wa bb will run after the context has been restored, so reusing
>> this lrc location will not clobber anything.
>>
>> (2) Calculate the time that the context has been active for:
>>
>> The CTX_TIMESTAMP ticks only when the context is active. If a context is
>> active, we just use the CTX_TIMESTAMP MMIO as the new value of
>> utilization. While doing so, we need to read the CTX_TIMESTAMP MMIO
>> for the specific engine instance. Since we do not know which instance
>> the context is running on until it is scheduled, we also read the
>> ENGINE_ID MMIO in the wa bb and store it in the PPHSWP.
>>
>> Using the above 2 instructions in a WA BB, capture active context
>> utilization.
>>
>
>I think this may break the GuC code, which samples the context timestamp
>to determine if a job has run long enough to timeout.
>
>Let me explain how that code works.
>
>When a job is started, it stores the context timestamp into a scratch
>memory area in the LRC — LRC_CTX_JOB_TIMESTAMP_OFFSET. See
>emit_copy_timestamp in xe_ring_ops.c.
>
>When a TDR (DRM scheduler job timeout mechanism) fires — see
>guc_exec_queue_timedout_job in xe_guc_submit.c — we toggle the
>scheduling state to update the LRC timestamp. We then compare the values
>to determine whether the job has actually been running too long.
>
>It’s common, especially when the engine is timeslicing multiple jobs,
>that a job hasn’t truly exceeded the timeout. For example, a batch of
>parallel dEQP test cases (e.g., Vulkan) could easily trigger false job
>timeouts without this code.
>
>If I'm understanding this code correctly, with the WA BB we'd now always
>copy a value of 1 into LRC_CTX_JOB_TIMESTAMP_OFFSET, so I think this
>will break.

Hmm, looks like emit_copy_timestamp is written to the ring which will 
run after the wa bb, so, yeah, it will copy 1 and break existing logic.. 

>
>Can we not clobber context timestamp in WA BB rather set a bit somewhere
>else that gets cleared on LRC switch out?

This was the only safe option compared to other fields that get updated 
on context switch-out.

>Or maybe we update
>emit_copy_timestamp to read a MMIO value rather than from LRC CTX
>timestamp?
>
>Presumably in the TDR we could avoid toggling the scheduling state too
>and hook into this new code to get an accurate view of the jobs
>execution.

Let me take a look at the TDR logic and see if it can leverage stuff in 
this patch.

Thanks,
Umesh


>
>One more nit below.
>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  .../gpu/drm/xe/instructions/xe_mi_commands.h  |   4 +
>>  drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   4 +
>>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   1 +
>>  drivers/gpu/drm/xe/xe_lrc.c                   | 168 +++++++++++++++++-
>>  drivers/gpu/drm/xe/xe_lrc_types.h             |   6 +
>>  5 files changed, 181 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>> index eba582058d55..9153a7cd2ceb 100644
>> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>> @@ -62,6 +62,10 @@
>>  #define MI_LOAD_REGISTER_MEM		(__MI_INSTR(0x29) | XE_INSTR_NUM_DW(4))
>>  #define   MI_LRM_USE_GGTT		REG_BIT(22)
>>
>> +#define MI_STORE_REGISTER_MEM		(__MI_INSTR(0x24) | XE_INSTR_NUM_DW(4))
>> +#define   MI_SRM_USE_GGTT		REG_BIT(22)
>> +#define   MI_SRM_ADD_CS_OFFSET		REG_BIT(19)
>> +
>>  #define MI_LOAD_REGISTER_REG		(__MI_INSTR(0x2a) | XE_INSTR_NUM_DW(3))
>>  #define   MI_LRR_DST_CS_MMIO		REG_BIT(19)
>>  #define   MI_LRR_SRC_CS_MMIO		REG_BIT(18)
>> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> index da713634d6a0..cc698136a6f6 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> @@ -43,6 +43,10 @@
>>  #define XEHPC_BCS8_RING_BASE			0x3ee000
>>  #define GSCCS_RING_BASE				0x11a000
>>
>> +#define ENGINE_ID(base)				XE_REG((base) + 0x8c)
>> +#define   ENGINE_INSTANCE_ID			REG_GENMASK(9, 4)
>> +#define   ENGINE_CLASS_ID			REG_GENMASK(2, 0)
>> +
>>  #define RING_TAIL(base)				XE_REG((base) + 0x30)
>>  #define   TAIL_ADDR				REG_GENMASK(20, 3)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>> index 57944f90bbf6..210be0ef12f2 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>> @@ -11,6 +11,7 @@
>>  #define CTX_RING_TAIL			(0x06 + 1)
>>  #define CTX_RING_START			(0x08 + 1)
>>  #define CTX_RING_CTL			(0x0a + 1)
>> +#define CTX_BB_PER_CTX_PTR		(0x12 + 1)
>>  #define CTX_TIMESTAMP			(0x22 + 1)
>>  #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
>>  #define CTX_PDP0_UDW			(0x30 + 1)
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index 855c8acaf3f1..11eabe4216ef 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -24,6 +24,7 @@
>>  #include "xe_hw_fence.h"
>>  #include "xe_map.h"
>>  #include "xe_memirq.h"
>> +#include "xe_mmio.h"
>>  #include "xe_sriov.h"
>>  #include "xe_trace_lrc.h"
>>  #include "xe_vm.h"
>> @@ -654,6 +655,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
>>  #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
>>  #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
>>  #define LRC_PARALLEL_PPHWSP_OFFSET 2048
>> +#define LRC_ENGINE_ID_PPHWSP_OFFSET 2096
>>
>>  u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
>>  {
>> @@ -697,11 +699,21 @@ static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
>>  	return xe_lrc_pphwsp_offset(lrc) + LRC_PARALLEL_PPHWSP_OFFSET;
>>  }
>>
>> +static inline u32 __xe_lrc_engine_id_offset(struct xe_lrc *lrc)
>> +{
>> +	return xe_lrc_pphwsp_offset(lrc) + LRC_ENGINE_ID_PPHWSP_OFFSET;
>> +}
>> +
>>  static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
>>  {
>>  	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
>>  }
>>
>> +static u32 __xe_lrc_bb_per_ctx_ptr_offset(struct xe_lrc *lrc)
>> +{
>> +	return __xe_lrc_regs_offset(lrc) + CTX_BB_PER_CTX_PTR * sizeof(u32);
>> +}
>> +
>>  static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
>>  {
>>  	/* Indirect ring state page is at the very end of LRC */
>> @@ -731,6 +743,8 @@ DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
>>  DECL_MAP_ADDR_HELPERS(ctx_timestamp)
>>  DECL_MAP_ADDR_HELPERS(parallel)
>>  DECL_MAP_ADDR_HELPERS(indirect_ring)
>> +DECL_MAP_ADDR_HELPERS(bb_per_ctx_ptr)
>
>Is this used anywhere? I'm not seeing it in my search of the patch.
>
>Matt
>
>> +DECL_MAP_ADDR_HELPERS(engine_id)
>>
>>  #undef DECL_MAP_ADDR_HELPERS
>>
>> @@ -880,6 +894,58 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>>  	xe_bo_unpin(lrc->bo);
>>  	xe_bo_unlock(lrc->bo);
>>  	xe_bo_put(lrc->bo);
>> +	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
>> +}
>> +
>> +/*
>> + * xe_lrc_setup_utilization() - Setup wa bb to assist in calculating active
>> + * context run ticks.
>> + * @lrc: Pointer to the lrc.
>> + *
>> + * Context Timestamp (CTX_TIMESTAMP) in the lrc accumulates the run ticks of the
>> + * context, but only gets updated when the context switches out. In order to
>> + * check how long a context has been running before it switches out, two things
>> + * are required:
>> + *
>> + * (1) Determine if the context is running
>> + * To do so, we program the wa bb to set an initial value for CTX_TIMESTAMP in
>> + * the lrc. The value chosen is 1 since 0 is the initial value when the lrc is
>> + * initialized. During a query, we just check for this value to determine if the
>> + * context is active. If the context switched out, it would overwrite this
>> + * location with the actual CTX_TIMESTAMP MMIO value. Note that wa bb will run
>> + * after the context has been restored, so reusing this lrc location will not
>> + * clobber anything.
>> + *
>> + * (2) Calculate the time that the context has been running for
>> + * The CTX_TIMESTAMP ticks only when the context is active. If a context is
>> + * active, we just use the CTX_TIMESTAMP MMIO as the new value of utilization.
>> + * While doing so, we need to read the CTX_TIMESTAMP MMIO from the specific
>> + * engine instance. Since we do not know which instance the context is running
>> + * on until it is scheduled, we also read the ENGINE_ID MMIO in the wa bb and
>> + * store it in the PPHSWP.
>> + */
>> +
>> +static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
>> +{
>> +	u32 *cmd;
>> +
>> +	cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
>> +
>> +	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
>> +	*cmd++ = ENGINE_ID(0).addr;
>> +	*cmd++ = __xe_lrc_engine_id_ggtt_addr(lrc);
>> +	*cmd++ = 0;
>> +
>> +        *cmd++ = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
>> +        *cmd++ = __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
>> +        *cmd++ = 0;
>> +        *cmd++ = 1;
>> +
>> +	*cmd++ = MI_BATCH_BUFFER_END;
>> +
>> +	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
>> +			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
>> +
>>  }
>>
>>  #define PVC_CTX_ASID		(0x2e + 1)
>> @@ -900,6 +966,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>  	int err;
>>
>>  	kref_init(&lrc->refcount);
>> +	lrc->gt = gt;
>>  	lrc->flags = 0;
>>  	lrc_size = ring_size + xe_gt_lrc_size(gt, hwe->class);
>>  	if (xe_gt_has_indirect_ring_state(gt))
>> @@ -920,6 +987,14 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>  	if (IS_ERR(lrc->bo))
>>  		return PTR_ERR(lrc->bo);
>>
>> +	lrc->bb_per_ctx_bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
>> +						  ttm_bo_type_kernel,
>> +						  bo_flags);
>> +	if (IS_ERR(lrc->bb_per_ctx_bo)) {
>> +		err = PTR_ERR(lrc->bb_per_ctx_bo);
>> +		goto err_lrc_finish;
>> +	}
>> +
>>  	lrc->size = lrc_size;
>>  	lrc->tile = gt_to_tile(hwe->gt);
>>  	lrc->ring.size = ring_size;
>> @@ -1026,6 +1101,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>  	map = __xe_lrc_start_seqno_map(lrc);
>>  	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>>
>> +	xe_lrc_setup_utilization(lrc);
>> +
>>  	return 0;
>>
>>  err_lrc_finish:
>> @@ -1245,6 +1322,21 @@ struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc)
>>  	return __xe_lrc_parallel_map(lrc);
>>  }
>>
>> +/**
>> + * xe_lrc_engine_id() - Read engine id value
>> + * @lrc: Pointer to the lrc.
>> + *
>> + * Returns: context id value
>> + */
>> +static u32 xe_lrc_engine_id(struct xe_lrc *lrc)
>> +{
>> +	struct xe_device *xe = lrc_to_xe(lrc);
>> +	struct iosys_map map;
>> +
>> +	map = __xe_lrc_engine_id_map(lrc);
>> +	return xe_map_read32(xe, &map);
>> +}
>> +
>>  static int instr_dw(u32 cmd_header)
>>  {
>>  	/* GFXPIPE "SINGLE_DW" opcodes are a single dword */
>> @@ -1792,21 +1884,93 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
>>  	kfree(snapshot);
>>  }
>>
>> +static u32 get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id)
>> +{
>> +	static u32 base[XE_ENGINE_CLASS_MAX][XE_HW_ENGINE_MAX_INSTANCE] = {
>> +		{
>> +			RENDER_RING_BASE,
>> +		},
>> +		{
>> +			BSD_RING_BASE,
>> +			BSD2_RING_BASE,
>> +			BSD3_RING_BASE,
>> +			BSD4_RING_BASE,
>> +			XEHP_BSD5_RING_BASE,
>> +			XEHP_BSD6_RING_BASE,
>> +			XEHP_BSD7_RING_BASE,
>> +			XEHP_BSD8_RING_BASE,
>> +		},
>> +		{
>> +			VEBOX_RING_BASE,
>> +			VEBOX2_RING_BASE,
>> +			XEHP_VEBOX3_RING_BASE,
>> +			XEHP_VEBOX4_RING_BASE,
>> +		},
>> +		{
>> +			BLT_RING_BASE,
>> +			XEHPC_BCS1_RING_BASE,
>> +			XEHPC_BCS2_RING_BASE,
>> +			XEHPC_BCS3_RING_BASE,
>> +			XEHPC_BCS4_RING_BASE,
>> +			XEHPC_BCS5_RING_BASE,
>> +			XEHPC_BCS6_RING_BASE,
>> +			XEHPC_BCS7_RING_BASE,
>> +			XEHPC_BCS8_RING_BASE,
>> +		},
>> +		{ 0 },
>> +		{
>> +			COMPUTE0_RING_BASE,
>> +			COMPUTE1_RING_BASE,
>> +			COMPUTE2_RING_BASE,
>> +			COMPUTE3_RING_BASE,
>> +		},
>> +	};
>> +	u32 c = REG_FIELD_GET(ENGINE_CLASS_ID, engine_id);
>> +	u32 i = REG_FIELD_GET(ENGINE_INSTANCE_ID, engine_id);
>> +	u32 mmio_base = base[c][i];
>> +
>> +	if (xe_gt_WARN_ONCE(lrc->gt, !mmio_base,
>> +			    "Unexpected engine c:i %d:%d for context utilization\n",
>> +			    c, i))
>> +		return 0;
>> +
>> +	return xe_mmio_read32(&lrc->gt->mmio, RING_CTX_TIMESTAMP(mmio_base));
>> +}
>> +
>>  /**
>>   * xe_lrc_update_timestamp() - Update ctx timestamp
>>   * @lrc: Pointer to the lrc.
>>   * @old_ts: Old timestamp value
>>   *
>>   * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
>> - * update saved value.
>> + * update saved value. With support for active contexts, the calculation may be
>> + * slightly racy, so follow a read-again logic to ensure that the context is
>> + * still active before returning the right timestamp.
>>   *
>>   * Returns: New ctx timestamp value
>>   */
>>  u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
>>  {
>> +	u32 ctx_lrc, ctx_reg, engine_id;
>> +
>>  	*old_ts = lrc->ctx_timestamp;
>>
>> -	lrc->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
>> +	ctx_lrc = xe_lrc_ctx_timestamp(lrc);
>> +	if (ctx_lrc == 1) {
>> +		engine_id = xe_lrc_engine_id(lrc);
>> +		ctx_reg = get_ctx_timestamp(lrc, engine_id);
>> +		if (!ctx_reg)
>> +			lrc->ctx_timestamp = *old_ts;
>> +		else
>> +			lrc->ctx_timestamp = ctx_reg;
>> +
>> +		/* read lrc again to ensure context is still active */
>> +		ctx_lrc = xe_lrc_ctx_timestamp(lrc);
>> +	}
>> +
>> +	/* If context switched out, just use the lrc value */
>> +	if (ctx_lrc != 1)
>> +		lrc->ctx_timestamp = ctx_lrc;
>>
>>  	trace_xe_lrc_update_timestamp(lrc, *old_ts);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>> index 71ecb453f811..1c973d71ba98 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>> @@ -28,6 +28,9 @@ struct xe_lrc {
>>  	/** @tile: tile which this LRC belongs to */
>>  	struct xe_tile *tile;
>>
>> +	/** @gt: gt which this LRC belongs to */
>> +	struct xe_gt *gt;
>> +
>>  	/** @flags: LRC flags */
>>  #define XE_LRC_FLAG_INDIRECT_RING_STATE		0x1
>>  	u32 flags;
>> @@ -53,6 +56,9 @@ struct xe_lrc {
>>
>>  	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
>>  	u32 ctx_timestamp;
>> +
>> +	/** @bb_per_ctx_bo: buffer object for per context batch wa buffer */
>> +	struct xe_bo *bb_per_ctx_bo;
>>  };
>>
>>  struct xe_lrc_snapshot;
>> --
>> 2.43.0
>>
