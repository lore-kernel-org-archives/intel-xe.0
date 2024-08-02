Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76361C3DA64
	for <intel-xe@archiver.kernel.org>; Fri,  2 Aug 2024 01:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00C010E8DA;
	Fri,  2 Aug 2024 01:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QAdMZYj6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A77E10E8DA
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Aug 2024 01:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722563975; x=1754099975;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yJAjniLzuNlfCh+LaBNHJ/fPQCz6To7GDRabsRQydGA=;
 b=QAdMZYj6WblNukeMhwfS9cYqq2T0vMBISuFdhcqPRCZzAEQXneUHzIEB
 VSXe/Zwb5Qtrcs9HqW8nq/RGViYae97uPL8S6OXWLET/74l5t6wC1/1fQ
 mp89ur5bJ21AEOvSge8hdpkACJvAqXyfYarj53T8KQ9e+N5VQBS0eL2BQ
 IAG1LNH3P4iyjFuG6FNUni6Y/X7c8Vq+1z7jBBep9RBYUPdgg0qIlmSU0
 bjm0yqj/TeLpXm/f0tdhFW1PvFDe6Oh3nSc+79/Ot2kBtXa+4F5yhwCs0
 4MIh7AvlCuFuhjTkdmi0yfiHPuV2BT/pvsTbrkTT+0dFaM6kp3LULirr3 w==;
X-CSE-ConnectionGUID: fzy0EDp7QDO4z10FHjaaFQ==
X-CSE-MsgGUID: aShpq8whTYSpp71+k7FbXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20236750"
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; d="scan'208";a="20236750"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 18:59:23 -0700
X-CSE-ConnectionGUID: pwL1snX1TJWFALdCe/B4hQ==
X-CSE-MsgGUID: rHAn3WWaRHuviY5yN9eYIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; d="scan'208";a="55155023"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 18:59:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 18:59:22 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 18:59:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 18:59:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 18:59:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEoSNqq8GuUUQsupAXoQ9+E4rs0q6WAA5m8/3xmKstUb4M+bsd5wWzoewMMvpsWWFhWtVix7c+dTuX60LSSt+uO4cMX3sEsjvbTRWf2Puiv4vKv3r947m6nUGwbpXG1UaMsjbRgbRz0ipGJTDAVkNrGwAqYdVlEFuuWnip5NJ9cV6x5aYvXPm8rQxOLhruPkuxRsebEVMTJONupjvD3q0Y0dlQ0UMroByRjgNFy540Yq6MPooF31UyYcqN0uEUfR1wQF4SFagL4iBa/MKcwIzFZxfvN4LarHn0xLK1yVvGC8F1z8OjnF+Ad5Rb43tF5AZK+U7rUbVAIIyuZExeAINg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uunaj5aCZZpoMtgqeb9SvJrDusLcy6xFtSx3x5IV8Co=;
 b=pfRAxgPRrxs1luL6B9B9SHHf19lTAwn1/V1bDTY4lRAArG7CXdg4s6qugxuzcoHBlVr7mu2ahur1yFJwuCTSPogdlsR9WZWUxF1ihv/aEbvZZ0G1V0ze0YVtGeJtSBfRJpS2DicKE41rCyRZJbKUg0GT5dFH+enzJgW3Pc7Qcwk34kYRgoyTG1FrvO8sP0maXOcKaBMIWkUPCFTFMEdOp72t08ExbwcZtHJRw+WKNa82MGqJux1+05Pp1P+4h8455KIgqVj4HtnM5HBwFFUhN2GZ2WW+g7K2JmPQX1jAyZmkxfn0pkOUaozv/7Uy58TD8asX/gXD9JCCS6HynJ8ftg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 by DS7PR11MB6040.namprd11.prod.outlook.com (2603:10b6:8:77::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.22; Fri, 2 Aug 2024 01:59:19 +0000
Received: from CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::ae3c:acd2:8d33:99d7]) by CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::ae3c:acd2:8d33:99d7%6]) with mapi id 15.20.7828.016; Fri, 2 Aug 2024
 01:59:19 +0000
Message-ID: <b90ddae7-8a9c-4cae-8b81-9931b06c27bd@intel.com>
Date: Thu, 1 Aug 2024 18:59:17 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] drm/xe/xe2: Introduce performance changes
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>
References: <cover.1722591343.git.akshata.jahagirdar@intel.com>
 <3e8ff481eeba3f9b20bd542fa8d304e5736bb704.1722591343.git.akshata.jahagirdar@intel.com>
 <20240801213600.GJ2685051@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
In-Reply-To: <20240801213600.GJ2685051@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::11) To CO1PR11MB4977.namprd11.prod.outlook.com
 (2603:10b6:303:6d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4977:EE_|DS7PR11MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d7d1d24-0ebe-4f5e-9ef6-08dcb296b898
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eU5WdUdqc3FVTnhsTFJZcmxlNmJLeHR4c2RXY0hyODk1YW93bVlFTk1IREJV?=
 =?utf-8?B?K0NqaHRleXdWTTU2SE5QWUtUYWJCUHoyRHpqLzVIT2ZSR2FTL0hUeXpPY3ZZ?=
 =?utf-8?B?YUJXOFpsU2p0YU5VQUllS0s0bnZNSDdGTHRCNGxvaVltRm9SeUUrWExweFNW?=
 =?utf-8?B?Q2hMTXF5Mm1WQ0ZsdmR0UWtzU0dMYi90R3lUdmgwdHg4REozRngwNlVVQ2dQ?=
 =?utf-8?B?TitEVlhtVGMvOHc5TW5kdmFjYUNSZFdTNUxKZXk1Y0llSGVmNktPOU9nSFZ5?=
 =?utf-8?B?NS8vWGZyZndmNzE0dWlZNDdCMzlNZHlzYVlUd0QxenN2dk9pSi9RT2YyWmVw?=
 =?utf-8?B?MzE2bFBmaU0xZHlVMlFjeG9RSDZxYUtUQTZTOTVNSlZGZjNmclVCb2FSaDlB?=
 =?utf-8?B?WVpGblJJRU1aclRDTkZwd2ZmNmNpWnNZM1dqRnNiRG9mc0prWm84WTNYRnoy?=
 =?utf-8?B?aWxKZUdocm9VWFNES0ZDME9nNG44WTQwV2pKOWdPeENidmtudXVYdXUySk9V?=
 =?utf-8?B?QWxPR250L2VQY2pEdkVDMWo3Q2dza3kwLzZubHJ4YVVUWGhnMGtkcS9iZXJI?=
 =?utf-8?B?RzBMQXI3dmtJVThKdkp1bXRyR0N4ZmpBTS9zODhnbG8yd0FRUnRsVzZUeHhS?=
 =?utf-8?B?b1Y4YWNGS052TWl4RXgxcXFVK3ZpZnV6cDAxemptalFEUm0vUmRwU09NSW1P?=
 =?utf-8?B?RENqb0RRNGxBSVY3TklOOEg3Sk13cmhGWStQenlRbU9CdllmbWxka0NtVWlk?=
 =?utf-8?B?SU01cDB4LzVUMHRDSUwyMnE5VWNBWFYrVHlxYXJWSG0zUjRyQklSUzU2KzRV?=
 =?utf-8?B?V0ZjMmg1aHZtZXYzUGdxdjFlWUl1ak1kWHNPc3l4WUVLOVVXZkZtYzMvSnlH?=
 =?utf-8?B?UEdNdjlzQk15QlVaVzRybGdwU1pBK3MwM0ZBRHBId0xodUlSazQyUTlML1Ny?=
 =?utf-8?B?NGY2Q1VHUHlNQ0prbjRwV21iNzdQTjY5am9tQzMwWTRISW1RSXlncGF5YnBU?=
 =?utf-8?B?dUJnMGZRWm52aHk3UUt0UTVsZHFkSjJpakNQWWdXM3NEZk9sMGM1bit5dTZ1?=
 =?utf-8?B?M0V6eXZrSWlTZCsxcks3VVYwdGs4UzhEamk4MGp2MS9aNDNwZmRWdS83aUNC?=
 =?utf-8?B?Z2p6TlQyUUdKTGtvaVdNdFZVaTczQTU5TTRzK2cvTFREWGZWRlNwZ3ZJYkdq?=
 =?utf-8?B?eldvYVhyaVYvUXdqTytWYnRRTVM0OHZEWm4rK2JGZnV1RVRCUUFSZGU3VnZt?=
 =?utf-8?B?dkdiNzluS2tsMTdFSHZLRE03LzV5bk1GWEthZ0hudFdtQ0pQWHl1c1NQK1or?=
 =?utf-8?B?dHZhVVk5STF5TndSWW8vU1Ryd1lxLzNyQVIxWXdTVkVNb2xMdytYSUd5bjBn?=
 =?utf-8?B?L3U3eWNuK1FDZkRXN3p3UHFGanFhaEh3YnN4MlZvbjUvcDd3QTRyOXNwOWpx?=
 =?utf-8?B?NXU3OTJRd2RXRm1VZEh6K3RmbnVZbENVQ0s1M3dMMkVDQnAwSlllS21RRnAw?=
 =?utf-8?B?SmlRdWpsczRJMUFJSzFjb2QwWDFnY1FtdWVwbFFONXp5aHFGZ1JQVWxFOTJV?=
 =?utf-8?B?dHhuOHJtY1JmMlBKV1VKK1Q4TUxURytnbmxncXZML1Q3a0R2S0NsTEJDYnEz?=
 =?utf-8?B?VUtRbFNpMVcvRU1PQVVLUEZPMDJvL3pTUzd1QUJmRzBhb29pSDR6b3BpTmpP?=
 =?utf-8?B?OCtUc2VzVXREcm0wQlVyYkc3U2RxYm82QUp4MVhOK2MyaWxNM0RJOSswTGJL?=
 =?utf-8?B?d0NFVDgxVHRvbWtlMGl0VWI3TkVWWUZXUEIvalBTa1ZVWHlyOVZveitiYy80?=
 =?utf-8?B?N3R5dnJYUmI5aFA4NCtEZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4977.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzF3dE51VHA5cUFMMGU1cjJETmtuYTRjNGl3TWpkMG1PZ1BkWVhQWklsdUlI?=
 =?utf-8?B?c3RWZW81MktHVTNWYUwyOFN5bjNJN0VTT2MwQ2FZOWdIQXM2dUJaVXBpTFpV?=
 =?utf-8?B?WTRyMkU5TkIyQ2VQYjYrbTEyL0pZWXNQNE5JRzBIdnh1RytiZUxYTnJpRUJr?=
 =?utf-8?B?bmNLdDNCTjZIT0lpOGd2WnV3d2NpQ0QvM1RXSENNWnJLZHpOUWhtUUdSVDZ2?=
 =?utf-8?B?bUZ0S3VId2dKZU9UczJsL1RXTTNFSXRydmVDcm4zenRKUXR0UTBpZXp4TWFU?=
 =?utf-8?B?c3R2L2s0MXBJQm02eHppMVlES1RpYWMyTDlGNkpDeC9tU21tdE1KNHJSMkRS?=
 =?utf-8?B?c1dXNmF5UGx6ZVVlR2dCR29nT2JrUnU3c2N3dDNNak9KK2VpS25GSjlPa0t1?=
 =?utf-8?B?dUVZakI0bHJWRHYrU0J1cWJYTlRjZWpJa0lhTGZsMkxlTURPdmpnaitITVFh?=
 =?utf-8?B?citaYXg5L2Z3ak4vT1FubXBxWGE5YkdlcTdmS3c3OUNQUjVFSi9xeExIVWVE?=
 =?utf-8?B?UzZNMy9QbXFKMTNpSHF6UGZ1YmE0VC9zaE52NkhJeisvbDZaQWVnbTNiRW9N?=
 =?utf-8?B?MFc3MHg2aENudlI4QWdlU0JVZExWYi9HanRBK2wxZS9TY3FnbVFaWm5CSTNi?=
 =?utf-8?B?aWdQL2ZRTzhISVR6UHJXYmJRUW9LNWdySzF2Y1hGYktaTDkremtVTlVxRlk5?=
 =?utf-8?B?T2dPU1A3SDlUTUVBcEIwOU9obk1VdzFYOHpySFhJOGtXbHc4WkU3MndQTnpW?=
 =?utf-8?B?SDFzdk5FS24ySGtPTTVwMlI1QU1ka3hsazFWWEhQc0ZVQnVCbHVXN1RUYnN2?=
 =?utf-8?B?TDhHWHhpU2xwakZpN3cvSmpxcUNnL25lVi9OUERLSGJ4dDluVTlNRHNURlRM?=
 =?utf-8?B?Y2RLZjF2MSt2MzNYdlpwcVBpa3pJYUpVYUh0Y2xqV21EZnZIeCtkZjJHN1FB?=
 =?utf-8?B?M0wwT0ptV0dablgyTmE4cHRjSS84bnlzUUNUUkpXSndOUEI2Nm8yekFzM0ds?=
 =?utf-8?B?OEdjdlBtbzR1em1sTitvVjZ5R3ZCYlpOVklPZ1lDbHVqOEdtMW5qRjV4a0w2?=
 =?utf-8?B?bnQ1TmhQYTF4dWNTclVkdG04cUpvUnNzR3NaakFQV2VQOU5kQjdaaHNJbk85?=
 =?utf-8?B?ZGFiTmQ2eTF5ZVdUaWhrblpiYi93dTU3SGN3WC93ckhyYWRhbHRLK3dENkRN?=
 =?utf-8?B?TWV5ZW5uZmZPdHhPeS9SRm5aQ3N6a0dmRDdyV1FBWXFYZzg5bkVTWEg0b1BZ?=
 =?utf-8?B?dXgwTFp2eTV4ejlXS2JjVkdPOGpRc2NCcTNGb3pTYmNpU0lsUllLVFh4Zlk1?=
 =?utf-8?B?cTJuRFZDcFgrZGt0UTdtaXBYZnBTbEpUUmRsYm5XVnZIalpRdDAxdDlSZm5O?=
 =?utf-8?B?bkU3Z1ovOUxnZ2VPcUI1QndIRHphOHI0K2JSdUI0aHZLS0I5dWpMWmFqVEZF?=
 =?utf-8?B?aTlZSXRMbzhFNWZ1cmVqZ0FTMXpWZ2YvTGpKRTFHMEpNK0FTWmF3TjVMdzM2?=
 =?utf-8?B?YVR5RnNNdGVsVmZEYzNHc2ptYWdxZnJRTTBrOEZVTHpPYWI1ZENrN3drZE90?=
 =?utf-8?B?VUxMZ0VmZDZYNEpMYmlsOFN6Y1U0Wm9LbjU3STNuUUJsNGt5Q3lsaCtONk96?=
 =?utf-8?B?dVRkSmlJS2VvcDNOZGxUeDZqWlJUVDduT3YySjdQUUx6c1FSWDExSlhidmNV?=
 =?utf-8?B?TS9KZG1rQjZ0N21Hd1JOVmd2NkZOZ2VPZkRYSExObEZRVFozY2ZRMEo4dVdY?=
 =?utf-8?B?Y1FyMktPODFVeTJVZ2RCVlNObTMzNWdXRkl4SURES2Y2WEpCeWE2VDVVeG5O?=
 =?utf-8?B?aUN4N2cxQjU1SUFURWpYUFJ1TTh1L3BrWHpmSFFkWThTSGJpZ2lEMXAvUVo1?=
 =?utf-8?B?RnJoTDlOSks0MUtlRFF3N0E4TFlrVzVSZ1RjSVNuMUpGY1dyT2lJMWM3SG9n?=
 =?utf-8?B?TjF3WWR4WEZIVmFENHBmaUNVNVBLOU5haGN2clpJOXdNUDBjZitSWC9lMTlk?=
 =?utf-8?B?ditTaHZMeSt3VzNPcWJlTEdXaXlhVm1HS3FRb3JFbUQwNnZvTCt4NDdDRXJQ?=
 =?utf-8?B?MlBXZXdzTDM5K3NMTlByVTVIYzBTOFBhRGpxd1NETmkyYTN3VFNSRlNnWFEz?=
 =?utf-8?B?cDJxbjF3QWdCVVpwR1RZamZ6cHdub2tpcmQvOURJTXd0eXdDaDg2djNTVU8w?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7d1d24-0ebe-4f5e-9ef6-08dcb296b898
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4977.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 01:59:19.2494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1q8MTy6TwUA478gJwb9xVsVNyjqEsOxjDZpWuTuVftI7gHNyxMwtDjbFGiw9xuTb8BtRVbgbcLlgsJ4Q64QCJk6C8SeiunWP9h3D/XxaB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6040
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


On 8/1/2024 2:36 PM, Matt Roper wrote:
> On Fri, Aug 02, 2024 at 02:39:29AM -0700, Akshata Jahagirdar wrote:
>> Add Compression Performance Improvement Changes in Xe2
>>
>> v2: Rebase
>>
>> v3: Rebase, updated as per latest changes on bspec,
>>      Removed unnecessary default actions (Matt)
>>      formatting nits (Tejas)
>>
>> Bspec: 72161
>> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 4 ++++
>>   drivers/gpu/drm/xe/xe_tuning.c       | 6 ++++++
>>   2 files changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 3b87f95f9ecf..0d6a73a3c8c7 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -367,6 +367,10 @@
>>   #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
>>   #define   XEHP_LNESPARE				REG_BIT(19)
>>   
>> +#define L3SQCREG2				XE_REG_MCR(0xb104)
>> +#define   COMPMEMRD256BOVRFETCHEN		REG_BIT(20)
>> +#define	  MEMRD256BOVRFETCHEN			REG_BIT(14)
> Looks like we still have an tab character here where we wanted a space.
Will fix this in next one.
>
>> +
>>   #define L3SQCREG3				XE_REG_MCR(0xb108)
>>   #define   COMPPWOVERFETCHEN			REG_BIT(28)
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
>> index 77d4eec0118d..b41fdb350411 100644
>> --- a/drivers/gpu/drm/xe/xe_tuning.c
>> +++ b/drivers/gpu/drm/xe/xe_tuning.c
>> @@ -45,6 +45,12 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>>   	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
>>   	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
>>   	},
>> +	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
>> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
>> +	  XE_RTP_ACTIONS(SET(L3SQCREG2,
>> +	  		     COMPMEMRD256BOVRFETCHEN |
>> +	  		     MEMRD256BOVRFETCHEN))
> Bit 14 = 1 here is also the hardware default, so we don't need to
> specify this one explicitly.
>
>
> Matt
Ah yes, Missed this one. WIll update in next revision.
thank you for your review! :)

Akshata
>> +	},
>>   	{}
>>   };
>>   
>> -- 
>> 2.34.1
>>
