Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8D2CCFA05
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 01:51:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A2C10EA1E;
	Fri,  7 Nov 2025 01:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l0uxI9Bb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BAD10EA1E
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 01:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762480304; x=1794016304;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0oENyo+LCHxGrKzskDx4rgBnVb/+LEZDer3x9wWq7ag=;
 b=l0uxI9BbbQ9rvU7Z3G8W0fUFncDYbfuZoylCy73OprynP0AU05A9YHTx
 W3TqtHAFpWi3jEUGEMalj6AkooPCFyOFeL+vxA28M1jOkEiytJbtn7dYi
 2kv/Jyt4Szr8oAPMOFZ2G52FxSJuW/c5OakWM+YQvtuDp0olN79M3us43
 B605vfQVDsvSeDxi17Vks/FsEUb48EMyOhOLsiBecb9WneY7Zb1YA9jqC
 PHxcP5rlgeZS6CsS9u5i3s4lg2k6PIeyc9EOTDkT3H9xcdbIVON/gU6FV
 vtVHGU1jpu0voNF6BG9IoPAPXQMZG604cPWoIVL6fgJIFWV2QYbvJ66sC A==;
X-CSE-ConnectionGUID: Tc4fjgt0RceZ0Sqhikk0Mw==
X-CSE-MsgGUID: 3+VeqkcxQbG/PXJyjVJuMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="82034636"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="82034636"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 17:51:42 -0800
X-CSE-ConnectionGUID: 4bGZ8YrZRGWSrj0wXena2w==
X-CSE-MsgGUID: 9PwH4+1bQQe3PBUPPNcMyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="192183143"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 17:51:41 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 17:51:41 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 17:51:41 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 17:51:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WRQ7/Pe9hSuE+uUihkCUJm+tKuq8O0NNoCWnFwcU7Z96gdnthX0llVVrPvL+1o3XLowr3tmOaDxCXNStSP+x5Uy8KJk77F7O6jFafURNVQQnQrBxw//Hu/PMmMneGb2vzw1j0rpD4ywxvQb9gunmihD9Dq/DtOA/inr9z47vzaoaWx8H7xDjNPFFULRKEsovTvSJiOYzUR4TnLMx4nlPUKKwI/eOB/XAJyrpVlqbAz7LF4KrbNw6S8P/W0d8iqB8gTg60lHlz/Js9088cHjAN+KmuH8AHUTn9eOHi02W94pQroQu1/VyvGYZIJOGcWTu9lN3+VkCsnHfK4MdZ2RAyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wc1dGc704cyRupd9SKxOddmyjpWQChf2MSR+b4MmV7Q=;
 b=JAq920SwrJiXlHYvCKYiGiZcl7057JQc+qjb1UnY8fY6yBb1K2L7oFH03QteJoVjSGRefwQ+cn4CIYmfD35ON9NKvEn19poXR5nGdgdVg/pdMvF5WArmlkQSv/ImFXg+r0IZUJZzvyp9RHxofiPPpMXrejjsLq2tF0s9eWaSyfQG/8UlU67Sc73A8cfxzz0iEVJZ+9dqwaCL2Hx8RlHk/3M1/eYVf/d2DZtrP85Rr8+7DAf1Jk+PwbMGyRHO2mWBCmVT996oWQFyVi+4Db+dt3Hdc5Zfp4Rf7fnMI/UIvj7cAKhyFPc1cQwNM2mSMymiLG09cPtKUT9DEYUj6UScdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DM3PPF1CEB6B7EF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 01:51:38 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%2]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 01:51:38 +0000
Message-ID: <6155410d-2774-4b5a-bb8c-6806487b6e3b@intel.com>
Date: Thu, 6 Nov 2025 17:51:34 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] drm/xe/guc: Eliminate RPe caching for SLPC
 parameter handling
To: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20251104195735.1606126-4-sk.anirban@intel.com>
 <20251104195735.1606126-5-sk.anirban@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20251104195735.1606126-5-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0224.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::19) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DM3PPF1CEB6B7EF:EE_
X-MS-Office365-Filtering-Correlation-Id: e6fe96d3-a933-4986-25ab-08de1da03085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXBKaEN6ME1YdEw0ajhPdVJyMEJVVy80UTEzRFpRU1FENHhSWUxkV3R3WWcr?=
 =?utf-8?B?alRyNmdwRWcrcUs0OGxnU1BzTTY1SDBxa2dDeDZvZEViL1RITlNkSlR0ck9O?=
 =?utf-8?B?TWNrVlhFZFp2MCs0NXZwWHovN0JQNE1yN1krV1pZdSt1dmhzQVJEK2dWREU1?=
 =?utf-8?B?c01DamFqbEFoTnp4LzV1WXEzOC9oYm1ZSEcwcXFKNEYranY2OWNIVGRaWDRr?=
 =?utf-8?B?Q3RVZ0ZlcmVTRjhyckZIWG92aGdCSzV3ck5nN3Q5aHpPdlBmV2tKMzZ4WUI1?=
 =?utf-8?B?dzF1RmdzTlU3SmZjZGY3bTVSMkNKdi9YcmtiNUUrK24rZ1cvQ2VpeUJBZGMx?=
 =?utf-8?B?cXBWSDBDU2JoR3dTRFQxSWdpQWJ2RDhsQWhyOTlUTG0xRWV2Z0x2K0NSanhy?=
 =?utf-8?B?cXNXOUdQbnJicHRRWFVsMHhlamRnaEM1aUtxT2Z5RWJEWUxzaGhoekVjcGc5?=
 =?utf-8?B?OHl0d1ZRamU2VlB1cmJTc2ROdWtPZ1N2Sk1wVzdPZThoa3FSRzVYMVRydDdB?=
 =?utf-8?B?cDdKWXlBMEZYc21iZEhzaG1JYW9NaXQwZHFqd3hza3ZweURCZjJEcGR3ZURZ?=
 =?utf-8?B?Z0d5Yzl0MDQ0aWpsYm1Kd0lLbXAwNHJjYk01MWY0Vm00OFFER0V0QUhRV3FZ?=
 =?utf-8?B?dkNIbXczcW1BNHhuclhSZUQ1WGFiY2U1S0l2SzFsNWR3Rk1wOFZkQ1kwYmZt?=
 =?utf-8?B?bUlKUnIvY3RDZURQa3kzRm1SeklGaXhPTTdxRWExWFRYWHVka1h1SDQ3YjFY?=
 =?utf-8?B?VjJxdjZNNUxwRkxnNHU5dGw2NktRU051RGRaR25pSXAwWDZxZmdnK1lnQi92?=
 =?utf-8?B?aG90d0VXZlJpanJQMEc1eklYelF4UEQwMVozcS9KZ2x5NmtaZFlQZDl0bklC?=
 =?utf-8?B?bEhIaDJKRUtQc3p2aHdINnJSVWtjcENuTE1jY1dvSW15aXNpTjZKemU2T2ZZ?=
 =?utf-8?B?TWxOQ1dlMjZHU1JpaGZJaVhqWWlrZlBHcTlrZk91YkJGVXc0V1kvNFNWd0pQ?=
 =?utf-8?B?aitibFZVTk53YnUxWE0xUFlTRUpFb1NLbzUwNTVsZTV2WmNvbXRsWnJSTUZP?=
 =?utf-8?B?UzRkcEQ2Nld5NnNUREhLT0pISk85WHNtdHFGb3ZpcE43YmJ1T3B0NW9UL1J4?=
 =?utf-8?B?YVBzWkxzbXB3eDhZbmFaQWJ6UXJzL1h0by9pcW54d3NtSlVBMVZqTERsUi9O?=
 =?utf-8?B?b1haMU9EdHY0ZVNDNXVqMVc1VUY5VDhickRZZkI4QTFtSUtSQkFSdUlmc3RL?=
 =?utf-8?B?V1BZTmhUY3NVckxEb1dSelEyNUFFTnYrR1NjUThqcnE1SGZ0ZlZxNDlWakFZ?=
 =?utf-8?B?dzBaczFMVlRmOWg1cEtNaW5hbzljejVQcU5kc09nNjN2bGdZTVpsVGljVm4x?=
 =?utf-8?B?OVVJK0tBNmsrY2V4Q25yZE5qbytkSFRhOXBqT0lXOVF6emVIWW02SThpaFJS?=
 =?utf-8?B?MmJsWnFDeW5qRWtzNUZMZG5aK2M4N1NDUGMybVgra0VrMW05M1NoT3lrdVg2?=
 =?utf-8?B?dmJrelVVRGpFVFNuQnFpOVVPZEo4ZkU5T3ZKY2wvMzN6eFJjazZ5T0kwVjhi?=
 =?utf-8?B?RGNTa1h6eEd1Z3V2SjNmRlcrU1hESlJDOUgxUms1L3pnZFZsTEVEaUdXeFVD?=
 =?utf-8?B?b1k0Nm9kcVhQVzd0ZDRma1hlYUg3MStLaWhaYzc1WExQYkk3R3FkRWMzTUsy?=
 =?utf-8?B?em5nT05neXU5T2xCWGdLZ1JrVEN3aXV0QTFmUE9VdEtKTmd5QURIa3M5Si83?=
 =?utf-8?B?RnFVVjF2eWViZUdhMHNCQUJocHBleHZxVjlEc0VCZEVKUnZKcnFGb2lZSGFG?=
 =?utf-8?B?bDFucHp6QjZ4MWE4MVpSUDZuTlE1cnNGMnhneUQ2dVhtMGlvQXAyaFhYOXhP?=
 =?utf-8?B?eHgxQkhtQy8vRjJaMU9KSk1UZ0ZSaGw2WjFlcEZISTl6Snc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGhyc3orVGR0WFhYc2EwQ1RMYUZtcUQ0NERGU1FFdUtKUDlkdmthU0Z3MEt3?=
 =?utf-8?B?b3pFMmN5cjJBejJoUVh2aklXRHZnMUZwYk5JTk5kOFNNVUpDb0ZPUktjditw?=
 =?utf-8?B?dmFkUlc3UEdncjJrMTZPcnpZeXRtcmdPSVNlbTJYYTlkWWJuZkNVd294OWd1?=
 =?utf-8?B?MFhzME9hWVo1SWJpaDVVQXlCVjhiQ3Ntd3VlQ1VONlZUWW5BU0xhbkJ6RkFE?=
 =?utf-8?B?TnphUnpnRDZ2azdLZW1uOEw5aEptZnN5ZldJMnlCZC9DaUR1NU40L0N6OVF5?=
 =?utf-8?B?S2luTlUzOTgrRjZqZ28vc01GbGp1ZzhTY0R4elViZkJaT3B0VjJoQjl2bDA0?=
 =?utf-8?B?N1k4dk5IZUtlRWZQTXExakJKdTg3SDNTODdPVEIyMVFGQjBtazArQWFicVhD?=
 =?utf-8?B?d3AzVGZSbDhoR1JCRGtrdzdzcGwyWm1wSXo0QzljSUpPVjUzUGdRU0YxRkdG?=
 =?utf-8?B?OVJLeHRIalJNb1o2aVg5ek5WTGpRTWNhcWVqWFBVcEZyU3J1dlBWUk5GQlNs?=
 =?utf-8?B?T0U0RGJZTk5RbGFYaUpwbG9BNDY5M2tReW1oVURMSWFlRkJ6emxaYUx5NXVj?=
 =?utf-8?B?Z3QzMkpEeWo0MDBLaHozdFc5ZGtQcFRTdVdNQjV6Y0R3Ymx4MDZFMGxoekI5?=
 =?utf-8?B?SWwxSURNSUxDRWFIK3VyZng4cHllMXlPOW1IWE9LUGwvaVpUamt3VWo4N2hL?=
 =?utf-8?B?d29nRmpYOWJUZE5rRW9ueUF5V21zanlnN2FWclMzaXBaTFFMcmJaMStXYjNT?=
 =?utf-8?B?UFhYZmZwMmQwMzRCOEhzWStLSFAxTnFHMTdoREZVMXNTL2krY1Z0REVjM2du?=
 =?utf-8?B?akM3MjQ3L2hSMW81bGVOWmxQQ0F6UnRnbXJkODdCaVQ4VkhWSHZYZ0l3ZDRh?=
 =?utf-8?B?b09pdEM2SDZPUGhMS2ZPbDVIRWhydUsvdmhxRS84anpFK1NvTXFZNzZGQVpP?=
 =?utf-8?B?YkpQaWFaanVGdmNjSmRiRjdBVWxRSkU0YTY5ZWpJcXg3aTc4cFFZeHFyUisz?=
 =?utf-8?B?NEVBK3duNlN3clVGSW4vNGUyeGVjYTJPTm1RTnQrQUgrRTRabzJER2NBREF5?=
 =?utf-8?B?ZmVuUklJSjNML1NFeDhyd2tpZXc3MGoyb280Vmt0RlRlOHF6THoxYy80R1Bq?=
 =?utf-8?B?NEpSd1IrZEtiMGtWNHBLSUdtUkh6UElRSERTUTVDVzJlaXpPdXhPd1o0ZEJI?=
 =?utf-8?B?cDFJY0lQTTFsa09RODZwU0srazJRVFFBWnhGMjA4dHFQSTZncU1jR3JocWtK?=
 =?utf-8?B?QTZGK1FQc1pGRXJDREtCdEdFalhScytHYVhHVDV6YUtZNWhyVmQ0S0RDMHBx?=
 =?utf-8?B?ZEN4UW1QcHc0OVp4aDJ0bTRMdDk0SG9Id3R2ZGNkOW83ZENnY3p4cnU2ZjA1?=
 =?utf-8?B?QkRYdk1PbUhuMUI2ZElXREpyMUxKaG90YVU1Y2w5UWJyOWF0ZjFXaVVmOFcz?=
 =?utf-8?B?c0svQ0dJMDNJZ2xrWXZjZ210bFI2N1c5OGtidGtUUjBTVlhWZVU4a0FreGVZ?=
 =?utf-8?B?eEdlZ1c5Uy9ZYkE1VnhDTWRXaEZrWUlpZnEzSE1ESUp2ZWt2WmJCNURnOVNE?=
 =?utf-8?B?T3FTWnhGZVk5ZWorK0hzVXdaMHNjd3ZqZmpoUU9qMjVSaHlqNzFSRXpOWG1F?=
 =?utf-8?B?WFNVSGxXOHdIRWowdTU5WnB3ZnJMR0NUaFVVL29wWmIxYWVQbjViM09nTXB4?=
 =?utf-8?B?YUxOdVBXQUJWMi9yMGp3SDZCU2JsbExPbHArQUp3aXcrby95YXhHdDJ5Rlcv?=
 =?utf-8?B?WGR6UjJDZUtCd3VjV0FhVW9ldThrL1ZYM3pUVEhnWCt2SGdwUUF4RWJvb29o?=
 =?utf-8?B?SU1vc0d1bVAwL3E2U2IzMHF6VjU2eUVMRE5TbmdLMFlQMHJ4MGpuWkxGQkpZ?=
 =?utf-8?B?VC94a0p6aXNZWGkvUWJYdVE3M0dCOW5JRFpWU3U4VXNEN3ZYaGRBMGVlOXJ4?=
 =?utf-8?B?Z3VUb0o5UWhwbHN6RjhTc2hEL2JnTk9MdWU3VW5TRHFZNEFTUno4V3dsNENP?=
 =?utf-8?B?U0Q2VDgzMWFTU1Ntc3J6VTMzT1U0Tjl2OXZwY0c2cE1HZFVoWllob1dUVE1J?=
 =?utf-8?B?aWllTEhaTHdjSnRvYzhXTVFKOEVKcVI2L3o2QjFydzVWNDA2WXZmVjVHWmZB?=
 =?utf-8?B?S28vdkNGRkRhR1BWeU91RDcvaEE3SGpWSGd3bTkwczZoQVI1dktBejBsTkdZ?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6fe96d3-a933-4986-25ab-08de1da03085
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 01:51:38.0786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhTdQZ7sJjlhm8FLsv0ruwo00pOEsGowlrNx3mHr/yw+Rcj+7nMn96E1xOYs2MoFGCq5dFBqx235SyXADtvKWwnEbEug67EUOP21C1gwu+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1CEB6B7EF
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


On 11/4/2025 11:57 AM, Sk Anirban wrote:
> RPe is runtime-determined by PCODE and caching it caused stale values,
> leading to incorrect GuC SLPC parameter settings.
> Drop the cached rpe_freq field and query fresh values from hardware
> on each use to ensure GuC SLPC parameters reflect current RPe.
>
> v2: Remove cached RPe frequency field (Rodrigo)
> v3: Remove extra variable (Vinay)
>      Modify function name (Vinay)
> v4: Maintain a separate function for PVC (Rodrigo)
> v5: Avoid RPn update while fetching RPe frequency (Rodrigo)
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_pc.c       | 68 ++++++++++++++--------------
>   drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 -
>   2 files changed, 35 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index ff22235857f8..efa9318c4587 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -331,7 +331,7 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>   	 * Our goal is to have the admin choices respected.
>   	 */
>   	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
> -			    freq < pc->rpe_freq);
> +			    freq < xe_guc_pc_get_rpe_freq(pc));
>   
>   	return pc_action_set_param(pc,
>   				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
> @@ -376,7 +376,7 @@ static void mtl_update_rpa_value(struct xe_guc_pc *pc)
>   	pc->rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
>   }
>   
> -static void mtl_update_rpe_value(struct xe_guc_pc *pc)
> +static u32 mtl_get_rpe_freq(struct xe_guc_pc *pc)
>   {
>   	struct xe_gt *gt = pc_to_gt(pc);
>   	u32 reg;
> @@ -386,7 +386,7 @@ static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>   	else
>   		reg = xe_mmio_read32(&gt->mmio, MTL_GT_RPE_FREQUENCY);
>   
> -	pc->rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
> +	return decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>   }
>   
>   static void tgl_update_rpa_value(struct xe_guc_pc *pc)
> @@ -409,24 +409,22 @@ static void tgl_update_rpa_value(struct xe_guc_pc *pc)
>   	}
>   }
>   
> -static void tgl_update_rpe_value(struct xe_guc_pc *pc)
> +static u32 pvc_get_rpe_freq(struct xe_guc_pc *pc)
>   {
>   	struct xe_gt *gt = pc_to_gt(pc);
> -	struct xe_device *xe = gt_to_xe(gt);
>   	u32 reg;
>   
> -	/*
> -	 * For PVC we still need to use fused RP1 as the approximation for RPe
> -	 * For other platforms than PVC we get the resolved RPe directly from
> -	 * PCODE at a different register
> -	 */
> -	if (xe->info.platform == XE_PVC) {
> -		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
> -		pc->rpe_freq = REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> -	} else {
> -		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
> -		pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> -	}
> +	reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
> +	return REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> +}
> +
> +static u32 tgl_get_rpe_freq(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	u32 reg;
> +
> +	reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
> +	return REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>   }
>   
>   static void pc_update_rp_values(struct xe_guc_pc *pc)
> @@ -434,20 +432,10 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
>   	struct xe_gt *gt = pc_to_gt(pc);
>   	struct xe_device *xe = gt_to_xe(gt);
>   
> -	if (GRAPHICS_VERx100(xe) >= 1270) {
> +	if (GRAPHICS_VERx100(xe) >= 1270)
>   		mtl_update_rpa_value(pc);
> -		mtl_update_rpe_value(pc);
> -	} else {
> +	else
>   		tgl_update_rpa_value(pc);
> -		tgl_update_rpe_value(pc);
> -	}
> -
> -	/*
> -	 * RPe is decided at runtime by PCODE. In the rare case where that's
> -	 * smaller than the fused min, we will trust the PCODE and use that
> -	 * as our minimum one.
> -	 */
> -	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
>   }
>   
>   /**
> @@ -561,9 +549,23 @@ u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
>    */
>   u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
>   {
> -	pc_update_rp_values(pc);
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	struct xe_device *xe = gt_to_xe(gt);
just use pc_to_xe(pc) here, we don't need gt.
> +	u32 freq;
>   
> -	return pc->rpe_freq;
> +	/*
> +	 * For PVC we still need to use fused RP1 as the approximation for RPe
> +	 * For other platforms than PVC we get the resolved RPe directly from
> +	 * PCODE at a different register

This comment makes more sense in the pvc function where we are reading 
RP1. So, maybe we can split the comment and put in the respective 
functions?

Other than that,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

> +	 */
> +	if (GRAPHICS_VERx100(xe) == 1260)
> +		freq = pvc_get_rpe_freq(pc);
> +	else if (GRAPHICS_VERx100(xe) >= 1270)
> +		freq = mtl_get_rpe_freq(pc);
> +	else
> +		freq = tgl_get_rpe_freq(pc);
> +
> +	return freq;
>   }
>   
>   /**
> @@ -1022,7 +1024,7 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>   	/*
>   	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
>   	 */
> -	ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
> +	ret = pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc)));
>   	if (!ret)
>   		ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
>   
> @@ -1340,7 +1342,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>   	XE_WARN_ON(xe_guc_pc_stop(pc));
>   
>   	/* Bind requested freq to mert_freq_cap before unload */
> -	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
> +	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), xe_guc_pc_get_rpe_freq(pc)));
>   
>   	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> index 5e4ea53fbee6..f27c05d81706 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> @@ -21,8 +21,6 @@ struct xe_guc_pc {
>   	u32 rp0_freq;
>   	/** @rpa_freq: HW RPa frequency - The Achievable one */
>   	u32 rpa_freq;
> -	/** @rpe_freq: HW RPe frequency - The Efficient one */
> -	u32 rpe_freq;
>   	/** @rpn_freq: HW RPN frequency - The Minimum one */
>   	u32 rpn_freq;
>   	/** @user_requested_min: Stash the minimum requested freq by user */
