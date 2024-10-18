Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2214ED3C533
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 00:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8FD810E338;
	Fri, 18 Oct 2024 00:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vp7s/PPP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2FB710E338
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 00:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729210029; x=1760746029;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aHsJ5AQ5zFeK2W48py1KGU0PaKzS7rzrHFNPjmlZNw0=;
 b=Vp7s/PPP6mM1g/5e56iFj0Z3NVzDFTE4KNvFI90NIH3xL6sJUeOTQCnB
 Hut7AJRIC/29IO56xl28HMTK3S+hih7KhZTziJuoYy06gAoJSsb7TovyW
 bBx08533f4/BDdfiDT12AKrRXzZUferKit8A9qIm90wWU0pnbB/3G0LcY
 HiyWa76cxXCIUC4f7QQOOfYc6C83gjk+ur1IHmosXQuYRsEyz9RR2nbzx
 7vVKYAFmK7gkq3PW8rl55d6JbNxqsZlpnhY66KZdoL9AUbDPSHqYVlv1B
 +V0PiabiNaY0V/nhg3zzRqkP2AWNdc5q+p88Gv1Tuml0JtqKELA2tY1bM w==;
X-CSE-ConnectionGUID: sHcWO8IwTbqiwJaD0i9YsA==
X-CSE-MsgGUID: bNi8u2OLRQuDFIYT/mtU/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="40128768"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="40128768"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 17:06:27 -0700
X-CSE-ConnectionGUID: NW1EZIm2TZK0sCPm9+5/kg==
X-CSE-MsgGUID: 4/+7PFaZRReu6uYvxiBJGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="79055184"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 17:06:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 17:06:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 17:06:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 17:06:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 17:06:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JAMTHVAAODHjUyXmK1jee7R+dkSvyOr5TkvnUbtUo4Gk9lZnHEF75s4nVa5yqXr3hKsNFbBfciqtzgQhqjNSBd8hB3PIr9rzKfpdrEedJnPx00Zicw77/mpxEoGSHBDLJVGSXZvv+9yF4RGozgifEMd38cD5ZnUXuVtlP2c89TPRIQDmXs8e7HD+H6g/YhJgDEGTGc3UbnTlZtjOx58+eIkNfHJ7Wpbrhib+aYB2zGtOvCU1IQOjyFoPXv83P61kNBAtzlcNg74buCekRQ7SUP8nf5h7Y8YTqqcyEw8s/mwIwFZ6NY0wg5mPSovpa1mDVtL0usby/Vko521O5we45Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJJ+lHlFYN63dVSApwAPzXTNCKttGX++9lut0XcbjQA=;
 b=h3pvltarl8yhDqOeng4F50fFsquVNZ8Dz53h3XaYHPtj67taqFXpbTpULUdPRUt4+e+O+LiYx90o6q6wxQzXjTvUROVC0/ZvEQR5X9mRWq3hur22jwHH7K8vlhINmSfC2B9tmv21SvWt8EfkFV2qKsn0LyeaEQNE/hqvP74qUnNUdgngUmfZy12G4FiqU56skd8rfLFA3wKEnhKlvTJRJiS3oHFOaq2p91C3V5QeCO5lcNKYAr8heMp50y3CCBQzMb+NogMUR8VTU4EUhmuT4joaw0L6m5qNEWJfs0OE4xINkNWkFf5cXPIqHdKk4dgrvcsuFV6tq0qzqDDQjnZc8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MW4PR11MB5911.namprd11.prod.outlook.com (2603:10b6:303:16b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 00:06:22 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8048.017; Fri, 18 Oct 2024
 00:06:22 +0000
Message-ID: <fad8baf0-6171-4b97-b543-c17a04358f78@intel.com>
Date: Thu, 17 Oct 2024 17:05:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] drm/xe/guc/ct: Flush g2h worker in case of g2h
 response timeout
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>, <matthew.auld@intel.com>
References: <20241017111410.2553784-1-badal.nilawar@intel.com>
 <20241017111410.2553784-2-badal.nilawar@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241017111410.2553784-2-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0313.namprd04.prod.outlook.com
 (2603:10b6:303:82::18) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MW4PR11MB5911:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d54d893-29ee-4924-1e00-08dcef08a62e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cC9ORDN6MlZjbHFvamZJRXdHdWthL2RZNytrMXpBQVJiZXUvVWtMMkhVOTJt?=
 =?utf-8?B?OXpGYXd1enJqQzkycWZtOWNGVUhwc0V3RGFkWjNXYSthblpHV0c5NW13d3Iv?=
 =?utf-8?B?VUU2dGtMaGNmTlg1cmo3NjRocWxxYmtwbE54WUVQNDdrUW5YMGZNcEFNd0tP?=
 =?utf-8?B?UWE0NHBqcXltRjhDL0M5WEZKb1FVRnRWNE55SHRZd3pycm94aldZTDV4Z1FI?=
 =?utf-8?B?T1NpWUNqVDJlSTlUb0IxQitDeHB5bVdUVEpzVnZ2VmtHci9kelhtSWJMdTU4?=
 =?utf-8?B?UlZvWlBvVTlHQ3RiU2RWYnhIbEYwdXZxQlJPbUtkbnFOVWs5YTNFWFdxSitU?=
 =?utf-8?B?d09IK28yeGovcTlYOFQrUlhpNnVRWER4TTQvY2pVOU5XUERXQ1dieUdueXh4?=
 =?utf-8?B?WDlLY01MTGlHKzlQTHNvTHdhSUR6eEFXeU9oSDlrYjR3VlM1Rm5haGJoZ1FK?=
 =?utf-8?B?WGgvVTYrYUVXK1Vhb0pSb0ZHcjdNMzllMzNhdUJkZXJMMk43MkxVZlNrWWlQ?=
 =?utf-8?B?MG1lYzVyRlRtVFp3WnlNWkxDWklGZ2Z4b212UzlTeThtd3FDOStYQWRac204?=
 =?utf-8?B?UlMvY2wwQVVrLzhvNDAwSWEzbjlYOGxLbzZNUGlrMld3Lzd0Y1k2bVUxeGwy?=
 =?utf-8?B?dmZXVUFyR2dadnEzUGl1dGpLUGZxYUgwN1lzZVdEM09PQUJlUDc2WjNYeHN1?=
 =?utf-8?B?eTQ5dFhxN2krL0FjUkhBdjUySWpaS2hKdVcvejUxSzVmYzA2Zll3VGVEeFFp?=
 =?utf-8?B?eDhZTFRlem93SGhLYWtNNmplYlJVZnpGN0s5dnhDS0VUa09UUUkvdXRTWXRz?=
 =?utf-8?B?TncwblBNY0dzN20rOE4yUGd5bVNrM2xBL1NtdDFkQVNhSWxrWGdYM2NyVGIx?=
 =?utf-8?B?NmEzS3l5WE1SbWNtcmRLYldoeEVWT1ZzUnVWckpYV0hCZGZCRkNLWXorRmxk?=
 =?utf-8?B?Tmt6WEc1SmsxdllZaml3Zlp4RzVuTzhqcjRCcGJvWGZCbGFOK3J0ajRyYWk5?=
 =?utf-8?B?SDRTQkZzRHhEU3REZnozRmh1Qnk4V25EaGZLYlIwdU0zWG9kT2I3M1FqWFho?=
 =?utf-8?B?YkRxMlFVdElHSWg5MTNPT2UxUHlaWVUwdFR1NUlheWpKWlptZUljaE1vOGJR?=
 =?utf-8?B?emFOcXZsejZvQVZHUmJPRnpSOE1BWDBDWG9zbFY0aTU5OUJZWkFCNktDR0xL?=
 =?utf-8?B?WWRWWWRid29RNzB3THB6UDF1Z1JVSjRpcjBMWFBvblFSUmZNOFV5cTZXWkJl?=
 =?utf-8?B?QnhRRE8xMmZ6Mk01R0NHQTRJUkxuMlJMbm9kQ3hlUWJhNEZhUittYXo5UmVH?=
 =?utf-8?B?TllGdk9YS3FTSy9yRmJZbVhZZzFVMkN5a0hHbkRGV28zVmZJOXltVEJTS2Vi?=
 =?utf-8?B?Z09CNk5SWUxZWHBDQjdqcms2UHk2dTUycDB4MnR0MTM1R21wSTBjWllueTVD?=
 =?utf-8?B?Nm8ySTFIektxNGVUVGN3NDAxdWpnK3c0RCtuakRoMms0WlhpSEFuakhocDk1?=
 =?utf-8?B?eW1sOEZIU1Y1K1BSMnZhWnRCUHFRdmlzRmhJWGoxRjQ2WG8rZ2plYTB6clhF?=
 =?utf-8?B?ejJIMWJrOHRtcnRqNFJsNGRYOWlvMlpiNCt6Wkc0eDA3VEplOHV3UC81cXpY?=
 =?utf-8?B?dndYbC9ZUWxWemk5UmpnQlpwZHdJRFpaa01taHlvVTNJc0ZTY2FobnVVbVA0?=
 =?utf-8?B?cjdvZUNHakVvRmdSUUZuTzNXelFZYzI4SUxlTktyK3pCU2phR2YvZXZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3pIRFZUNytDMS9iZDZkZVBIcWc4TEowRnphbzR1QVlhNGxPd3dycUZQSktj?=
 =?utf-8?B?WXdMOE42Tm9vYWJiNExQMEV6em9WeVJDaUcwQ0xsRWJob2htbC9BVXVrS3Nu?=
 =?utf-8?B?MVFUQ0FlSWN0NzRZU2Y2cFoySnJuYjZac1ZzOVRaSDJzQjF3eFZyeGVwdXFj?=
 =?utf-8?B?alEvZFo5VTFoWEdVY3JCc1FwRnMzY2hYZkovWnlWMGhUclRaYjlaME5xaW41?=
 =?utf-8?B?Y0pyRjFmSTIyZnJiWUFPU0M4QzdLVWFjKytDSSs4ajFIa21kREpZUGovYnV0?=
 =?utf-8?B?WXU1OWhUZ0dUa3d5blJzOFNOK2xSaERwSENTYVFaU24zVHVoRHJ2OVllYXhq?=
 =?utf-8?B?MHRpZGozWnlRY2hwRWhKaitQVjA5RkNIYjhTdldvNkNlQkl5WjlOWjZGNFVZ?=
 =?utf-8?B?ZEticmRmbWFZYW05OFkxWW4yOXpEaVh3ZDEvcXk4YlJIVEgvdlI3NnhDWlYy?=
 =?utf-8?B?L2sxbjk3SXNSUEZUVVRORko2bWhlK3YwOU9xaXM4WCtLNVlVSUdmdTdhR3R3?=
 =?utf-8?B?djk0dXhFVU95dnRNcEhFK3oyMCtQbFhOTjdXM2tXN1ZsTlY2K0dIM2Rya2pX?=
 =?utf-8?B?d2h0cHRQR28vMmVTdlFPMmFYeVU1UEEvcVFBN1lWYnlPUkFic0FVUWlrU3FQ?=
 =?utf-8?B?MFcxR0hacGlsZUlxSGljdE05SXltektPdmNBa28xOFVTaDNQekxRaGVUS2wr?=
 =?utf-8?B?aDduVmlweXpXaVRGdjg1VVpUdDJyWkl6M3J0S3QzcXRLTkJ1SERvY0JZdHdH?=
 =?utf-8?B?c2FocmsrSEZrQWJ2OXlyNndUUThZbGw5anBZL3hLK3pwbmRiS2FvbjFySWFj?=
 =?utf-8?B?ck5hYWRhMHNyc0JwT1RXRHFxZnlhMVE4b1JlTVVTdmZ4aHdmWWpxMUFEd2NQ?=
 =?utf-8?B?eVgwdkIzMWh1b1UydjVyaDA0ckd2elB5TVBOcVhOM2NBRVZaRWROOUUvRTgw?=
 =?utf-8?B?UHgyUEVlcUJiOVBmTHZVYWZtSW1tY05pUGZKZ2o1SWlVQ0R5MnFjdC9EUTFl?=
 =?utf-8?B?M1lGT0VzVFJ1NlVDbndjZ1hoY2xlZzR0THZsb2lmOGh5TGRyckpHYjZZbUtZ?=
 =?utf-8?B?VFlUQjdPR3ViSHdSa0RnTmcxUGhxT0lWcGd1R0FiZlJXU05SaGMxQnRKd2ly?=
 =?utf-8?B?dEZBYm1UZ1Y2YUo5c2Ywcm4zUUhXVTZhcTZhaWE4Q0tTL0M2M1hJV0tBZi9q?=
 =?utf-8?B?L3lZS0dKZjA3K2xTUzZPbjZ0cnB1YnR3d1RPKy9TR1BkN3lBSHVDYXNBUzVC?=
 =?utf-8?B?YkhydHZzalh4UHM0bCtXUTlHN1E5Q1lNUFVqdG1uU3RuakRndkxBZGY0R1NR?=
 =?utf-8?B?VTJFdkxhOWVrTXZBQTJEeExwQnA2ZWprQ1hKbzIySUcrMXRXdWRPMUtEYnhi?=
 =?utf-8?B?RXk2eU1ZVmwxenNvVDBOc3pwN3VRTlVFRHBabVpkSFF5VHl3QjRweXNYK1hh?=
 =?utf-8?B?eFBBaFYzanN4bmo1UTJ1WlhxRFZ0cURxYWlKYUxXWktwSXNrRlc0emZhYXZm?=
 =?utf-8?B?Nm8vL3pNZHhwdE1nNkRsUVdjSm44VFlFM3RWakZYUHhVOEp3ak9mellWZENR?=
 =?utf-8?B?VUlBK0xueTJqZ1Z5MzVTa0lLZmYzNkRGT2RSNU9BejBvU3JDOUQvazI0T3R2?=
 =?utf-8?B?Yi8wVlB1ZzY2dmhHeUluWHlmemgrSjg4YTZvSEJueTYrWUNEZzk1QkIxYWNj?=
 =?utf-8?B?YWNLWllzQmR5M3llYm9yOHBHSWJxM25IaktUODFRVy9hTjQ5d0dJQjhYNFRn?=
 =?utf-8?B?M2NUNUtuODhMSHNMTXlRRC9pQ0wrRUkxeHV6cHVVOGttQUdMM2xRZGhuWDNY?=
 =?utf-8?B?QlA3OG9JbnROdHdnaEc4QWsrT09wdHQ1TUZEWnVOcGFIUEJTOGQvRFJDV1Mv?=
 =?utf-8?B?dm9DZ3NCR2Vyam8xVTVNSGVsR0V4Mm9EL2M0MlNPYXRmbUxJSFNEcUZqTG83?=
 =?utf-8?B?U29QazhmNXV0cDRBTURrZ3hlc2s2SkpoS1dDeVFDMUsrV0pHc25uSEY2TVl2?=
 =?utf-8?B?aFN0enVBUC94WVpFMy90ZWlXTW9TSng4YURLNndiOVdPYndhaG5QdzFSelhG?=
 =?utf-8?B?RlpCdy9kc0ZKVTR4YmJGelFYVUh4bUZIbXV0RWI2YlB5QnRTTnpQeUYrMGcy?=
 =?utf-8?B?N0xnK2d1dEt3NkNDQThVL0p5bkdxTTJ0STNzcUFXdm9TOHpvYzJoald4Q3pp?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d54d893-29ee-4924-1e00-08dcef08a62e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 00:06:00.8343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fUbuAH7njUDTZyFVBtGsucMHR5hJT8YjO+VNzXR34ST0/QT4Fgmnl9aBrx6QhV5dqOj5ViI/TQKwScHP25IcpGzL2c95sdwBv9eHY35EomQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5911
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

On 10/17/2024 04:14, Badal Nilawar wrote:
> In case if g2h worker doesn't get opportunity to within specified
> timeout delay then flush the g2h worker explicitly.
>
> v2:
>    - Describe change in the comment and add TODO (Matt B/John H)
>    - Add xe_gt_warn on fence done after G2H flush (John H)
> v3:
>    - Updated the comment with root cause
>    - Clean up xe_gt_warn message (John H)
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2902
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index c7673f56d413..c260d8840990 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1018,6 +1018,24 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   
>   	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
>   
> +	/*
> +	 * Occasionally it is seen that the G2H worker starts running after a delay of more than
> +	 * a second even after being queued and activated by the Linux workqueue subsystem. This
> +	 * leads to G2H timeout error. The root cause of issue lies with scheduling latency of
> +	 * Lunarlake Hybrid CPU. Issue dissappears if we disable Lunarlake atom cores from BIOS
> +	 * and this is beyond xe kmd.
> +	 *
> +	 * TODO: Drop this change once workqueue scheduling delay issue is fixed on LNL Hybrid CPU.
> +	 */
> +	if (!ret) {
> +		flush_work(&ct->g2h_worker);
> +		if (g2h_fence.done) {
> +			xe_gt_warn(gt, "G2H fence %u, action %04x, done\n",
> +				   g2h_fence.seqno, action[0]);
I'm not wanting to delay the merging of this as CI really needs it! 
But... The above is now a warning that basically says everything is 
fine. The previous said 'done after flush'. That tells you the warning 
is because a supposedly unnecessary flush was required. The above 
suggests it is a bad thing for fences to complete!

I'm fine with this being merged as is and a follow up patch to make the 
warning message clearer. But I do think it should be changed.

John.


> +			ret = 1;
> +		}
> +	}
> +
>   	/*
>   	 * Ensure we serialize with completion side to prevent UAF with fence going out of scope on
>   	 * the stack, since we have no clue if it will fire after the timeout before we can erase

