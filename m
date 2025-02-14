Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7836C021A4
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 16:52:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7597910ED11;
	Fri, 14 Feb 2025 16:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HcDw1ukU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC03410ED11
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 16:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739551950; x=1771087950;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qJGCgx6Fn2uqmwSzwWH43VulK6yx5yhEfEvGNu5HETQ=;
 b=HcDw1ukUDjcOrP0I4/tr2+IGPOXspXOaQqGo3/tVN2hoQPcMVkiJCoJm
 FdPinNNHiN3yLethwx54MGoLt8YSkyvP/tC3iDroanB/voU2ot/akATFV
 e6JkAAsYwoqcTkKbmx/tLq7pH6i5vvuD8V9dMBH+Ol4nC3ZWpA01etZnU
 C02tUh6BLKNWzqAvqbt2RmblDu05RmjHu2GUrd5ODLt0aFFY/dLfCNmrQ
 8Qb5YS8yQQwWxjUNOa7+u0q/3b4h8LVnCG/q5tz9YC+ia1DGNa8ju+fen
 sxasqMk6Wq3QXwmPcefIgEMFBnIWg4ys/NSINuWhWDe5paBN+xlF/LUqB w==;
X-CSE-ConnectionGUID: 9gBNIk3ySWeJyPZ0HLA4Dg==
X-CSE-MsgGUID: XEEKjpWRT+SmFgv8jB/FEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40573949"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="40573949"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 08:52:29 -0800
X-CSE-ConnectionGUID: uUm7gbZ5RJqMtTH2+Wy/xg==
X-CSE-MsgGUID: Ktcd4dnJTYWRrGLc2wjKKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="113232658"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 08:52:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 08:52:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 08:52:28 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 08:52:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffjTdQA9Vmc4SGrstNcZsU63VTRNXOjT6iLYM+bH9f9ZS4MocYkGWFxloAFAkiHIgQFEonm6Q41pd666IaoN82RnCc2qLstLk2O9IHBRtH+JFSQe9nkK/B9O2sA40pNec1vK32JE1q/R+cDuMaG0tltfQw7J+yYsZQSsl6tKxr8Ip6Gxf4/HTU6rJ4f5myDzND/X7AQT72inGPiTO7K5jPf49rRF3zbpzlSy/sRWuAfX1NDjSmexmfPQ2rvvMrOji+DXVcsZMHrFH5FpR7X+yFTJrQgw0RjQBKdvWfRXE6MtvobuUirdZNACZDErskSstjhIwdrVZDfXCdbaauiAAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUahbGOAaentCNjkMu+jR2jh1Wykna223lpBHQqgHSs=;
 b=xyWOXJt/mfwTSjaiswrWc7baa35Qcb1Tjxxu4Qpfr9Frx1ib/PEN7WpoB7DWDMtiWbKIYdvSEQspxs+XJj9uE2LjSdOgtHfFrzPaueFMpW4T74ZeyWDSaitDmMNmgVnWp2aT+MxV/eZxdzsafEpkDo0hsTJUk12K5IAHennTUOjCCXS8rObtYliBU7If9UDsnm8ciu0iyaZdyIkuo1gOS/I4CcuRWzlX3fMLX8Fgwc4gK0lyiWd/v6K+VHZE5q+QHJ1Ui2bNbzURjsHeZ1LVc9/KUh7/gqrJhcRywMhzCfWG4keZaNNEVzn+1TayDgz2Db+J9Ejl509FGxkxTmcXNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CH3PR11MB7389.namprd11.prod.outlook.com (2603:10b6:610:14d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 16:51:44 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.8445.008; Fri, 14 Feb 2025
 16:51:44 +0000
Message-ID: <c6affc31-830c-4c17-a653-55ae81bf0587@intel.com>
Date: Fri, 14 Feb 2025 08:51:42 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Stop reading masks from device memory when
 populating the ADS
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Harrison, John C" <john.c.harrison@intel.com>
References: <20250213214053.2191635-1-daniele.ceraolospurio@intel.com>
 <LV3PR11MB86959FA32C69826118242F65F9FE2@LV3PR11MB8695.namprd11.prod.outlook.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <LV3PR11MB86959FA32C69826118242F65F9FE2@LV3PR11MB8695.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0015.prod.exchangelabs.com (2603:10b6:a02:80::28)
 To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CH3PR11MB7389:EE_
X-MS-Office365-Filtering-Correlation-Id: 539593a4-5e4c-4772-fd17-08dd4d17dd05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzNpdzlOckNhNjRBRXM0MWdxQmRXN2xnbjRNNGN0aTg3Q0JDUHJFZEZ5U1Za?=
 =?utf-8?B?dGJPaGV2TFBUUHRsczZJWWZIM0Z0bXNTMXh2UmxYQXRNVUd1KzdzYkNVYW5R?=
 =?utf-8?B?ZEdMTjEwUS81K1pMeXp3TFE4YkprZVlBTTU5ZjRaK0dka3ROYXVSQ2M0SEwy?=
 =?utf-8?B?N2k4RmZ4VGtreEgrVDlHdTNaZXlER09ySUQ3SDBERE9OeTN5UjdxZGpxTDl6?=
 =?utf-8?B?VVlpN0JLS1BxdGlIRVliQXV4OTlibzQ0cGc1RlNOVWZQRFVmTnowN1lUcWtQ?=
 =?utf-8?B?bXhVUU4xSGVSbmUrYnFKSE05dTN4T0xrYUJTL0dUUHJBekl5VjFaUElPS1hH?=
 =?utf-8?B?Y3JIcmdBRnVsYmNyTVNtZ1hsYzNNRjdGK2VxYVBIZzZaMC83YWRTV3I4L3V1?=
 =?utf-8?B?Zm9qTFRYSWNxUVNVbFFnK04vVGh2cHVUWGpIZitqRVpReTVPNFpid1ZpdDJK?=
 =?utf-8?B?R200ODZPUnRFbUhhakZFY3daa25IMS9vZHJaR0dlVE5LYWc0NWs4Y2M0QTNI?=
 =?utf-8?B?UW9BNHY0YkpqelFnZ0dxWXhVeDZHS0NzUnlldHFSTUdwdU82VEo5YXpScEhl?=
 =?utf-8?B?bVdSLzNQWDhoWTFGdUU4TFhpRHVVVzVqbjNhZ1BoRHZtMjJhaGlwdWxaNDh5?=
 =?utf-8?B?Y1N4RzNUVXBQQnFYWGZLbW1IZ2RsdmtKUGdOKzFMT1RqZnRXRUtLMmI3UVdY?=
 =?utf-8?B?Q0hYbWVtMjdKSGxZV3ZQRmRUeVVFTHN4VDBoWDlyUnJEaXgrQ2grWGZHalBC?=
 =?utf-8?B?aTIxYzd5bDNvaWVCZHErQ1c3Ri9zdGhVZGxnQjE1VGpHS1lXRGp1cmsvRWhG?=
 =?utf-8?B?T1F4dmxrTUdSUk1ueUQ4RStyYVB0YlloZ2svdVFtdHRvdTQwNklUOVpmYVMz?=
 =?utf-8?B?c0NuQS90SEdwd3VwRWx3VWh3R2FLKzlnVXpMY0pkTFR6U0lkZWJURmNySy82?=
 =?utf-8?B?dEFwNzcva3k3RmtiSDJmMVZGb0dQMTFlakhpT0dzVFBHZmVaSnBEdDBFY1Nj?=
 =?utf-8?B?UHZNNFZDdmNOOHZjL3I3dXk2d1RJSnNSWlR6QTBvZHpIRmhEZDV6WEdYVU5S?=
 =?utf-8?B?dDZ6ZDhmK0M2K0w2YjFyVmQ5QlJqTmNwc2Y2bnA1bXQ2bmpJNE12OFFFQVl4?=
 =?utf-8?B?czFDbmwvbFNMWWNUZjlDdytJMVRrRlFaTHpjd1dCNlVyb0huN204RDhLMGxv?=
 =?utf-8?B?UCs2eEtPaUFDU3dhZnNnd3JHMVg0UkpNZ3VTcjAwdC9TN2JpdkdPdHA5akJj?=
 =?utf-8?B?dTRTMGg3aW9pam8rak5ocmxtdFZhN0xaUUs3d0FKZytGTmwrMWJTemxucEtF?=
 =?utf-8?B?dXA2OXNBTktvcFU1anUxMDhYV3B5VVh1WWdXMzVmaWVpT0VpemxaZVpaY2xh?=
 =?utf-8?B?enFHWVpueHdmWmRndnNadDJGZ0JuWSsxeVgwSGZuT21NNGZ0a2tzVkxzVk9T?=
 =?utf-8?B?VlpwdzV5Tnk5Z3R6YUtXRktOcXRJTnJPbGJtU3UvMUhZbHhEVGJaUExSNmtH?=
 =?utf-8?B?S0lRQTdKNmZCWFFjeWVNc2hpRzE1ZHhDQlBHbW5nT0UwaWxUSUhIVklWd1Zm?=
 =?utf-8?B?RlVQREU5Skc4dGJHMTZIWUxoamhtNzV1TSsxREJjMTVLYjY0L1pla0p2emZP?=
 =?utf-8?B?VjlSYit6V2ZrZGRnamlTdGlCNlhZUXd0emEvbzVFSCtOZzJCbXIrRG5iV0c0?=
 =?utf-8?B?aWNGRWtVeTFjT0FjQVVLbzNKbEJJQXhmU2I1Rml1UFlSa3czbDBNalFia21V?=
 =?utf-8?B?OU84cjZuVi9URHpUVkJKUjByMHBhNlBSQXlieDJSNkhxVHVrTWxlWmNOUmlm?=
 =?utf-8?B?Z1dMZVZvMUZ1c1NUMFArOHJBazJobURLSHRnM01tcHo3QlVhbWNXem1GQ3NW?=
 =?utf-8?Q?BUc39FA2XWG8H?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGtVRDNwRklXV05HME81aWppcXVybWxMMXBiQWNvZXVMSG5zdk5jYzZ4a2lF?=
 =?utf-8?B?QUoyNTF1RTFCbFlVTFNqTU9PVjRNTnczdGlDZTlJTlE4Q3B2d0hybWFTRVpB?=
 =?utf-8?B?aHhaS1B6bVBHSVlQNzdCTFdLQ3VrVW55MGhUUWhKTm1kN1haMXFEV2RkZXFo?=
 =?utf-8?B?MkpudENydjMyMGtZYlZqeFBCdEU3RWp4WFdYYk16bkphcDAwcW9ZOUxFdFMz?=
 =?utf-8?B?c3lhM05ldHNlcE9sY2VGejBxblh3V1R2NG9UWCtlQURaWS92ODNITmZKNkJ2?=
 =?utf-8?B?bmlCcDFVVUh6YXh3NnF2em9FVU4vMXVlam9WUmJGTGlibHRaZ0VDZ1RralRT?=
 =?utf-8?B?Vnc1ZDlwejh0d0haaVJvTjYwYnlaWE1SYlNNM2ozUEYwT1R6UERoN3RnV3dX?=
 =?utf-8?B?VW9XNWYwTFI2WlJVVnp6YVJRYVd1NWZkZHloZlQ2cUtSYmYrMk1EL0hVRU8w?=
 =?utf-8?B?dWFGWnNpZGZIdG5RVjlTdmhRaVlNQzc5dFA1VWJkbXF6NW1QT0NOQVFoTEVT?=
 =?utf-8?B?aW8rK2Fld2I0ZzNpaHhlVjFFSEJIZ09xQU9EWGFpdU91RUpyRGtha1RTd3k2?=
 =?utf-8?B?SjNLcUlCM2MyYVE1NmR3cHVocWVWTGZUdXBUTTRON0dDQnJobHQyeFdCZVNE?=
 =?utf-8?B?aFY2TUJkM1pKaFlyK3BzOE9oc1lPa21uVFZPYzhPbnhxLzdKaERNdGRBSFVD?=
 =?utf-8?B?T3BkUzZyTDBTNDJLd2YwUGt3MzN0WnpvV0dOY29QcFpQWWVJcnl3OCtyS1lv?=
 =?utf-8?B?Z2hxYmNPRTZyb0tvbTRVQ083QStiMExKWWJTam5JY3NVb3pNZCthc1UwSE1C?=
 =?utf-8?B?TFlWV2ZCZFU1QnNUa0RrZE4rM2d3V3MyZjkvck1PM0pqTXlPaUVHNDZUaTVm?=
 =?utf-8?B?WnhENkVTWktXK1NmWWZQZlc3bHNzTEE2RG52ZmhJUDdmb09xaWd5NEpUQjdj?=
 =?utf-8?B?N09UOUxPQnUwVHVuSVlmNHc2NjdtNUFMRHNuR2dVUlMyWHFwNmw5ekJpQUg2?=
 =?utf-8?B?MnpNK2pUZlpqY3FPa3VqS1R2TXo2NENNRnFKRUg2RUlEZERRL3I1T1FncE9i?=
 =?utf-8?B?UTBXYldXMWpPMG9mQ1BGTit2bERIWTA5ZFEwbzNsTnlvYjZBd1MxcnNWLzZq?=
 =?utf-8?B?S2w3Zm9USjdRcGFJYjVBKzNGNkhnaSszcm1DcjRERkZhTEJpUlREMGpRNGI3?=
 =?utf-8?B?S0lOektaVDhzZ0g5Nzd2MGw3WWNPbGNWeHJoNld6N1NFT1BYaElHMXYyaVF2?=
 =?utf-8?B?OWFneHVmekxEK0QrSUtYTGlITGVtK0RwUEpjd3BoWUd4bjA3TVc3Rm9sUXgz?=
 =?utf-8?B?SzZNRDREMWhlcU9pcFhCUTJtUlgwSkplYzNWaitGaG1nVmpkUG5rY2xJQVdV?=
 =?utf-8?B?UkNTaWttcWdYcEdZQkVYWlhPT2NVaTJ2K2o2L2J2cXpJYU5Yek83WkoybWVm?=
 =?utf-8?B?NXF0Qk5zY1lkUFl5emxnTjk1YTRlbVNrZkV4RU5vNTVwRGs1aUtUMzVPeGs1?=
 =?utf-8?B?amI5cjlQV2NKaVJDbmVKVFJJOHRkbGhKY3pvRERTd05peHR6eWZDR0dVd2ox?=
 =?utf-8?B?RVBwS0QwTDUwajJmcEYrWXNKT2kwRE5CUnhYOW5jSVZoSkJCUXNROFNJdHdO?=
 =?utf-8?B?Wk8ycEJMbDR3VFhHT1hJRnVwUzhWUDFJMWk2QXh6OEZVRkZkRDVBdXFOa0kv?=
 =?utf-8?B?L2xnM0JHZ0p4dFlCUW5CU0pJYStNQllra2IrSDVQNDdQaHdudHgxZnJIZW5h?=
 =?utf-8?B?R2hlOTlkeTgzZ3laZlk2djhUc2NQbi9pVlFKa1picUx1UkxyVnl1ejVERmlP?=
 =?utf-8?B?YzdaM0MvQjNWYXhKYzAyTHF0cTJsMm8vT2t6ZEdLNS9BTnB0akVkckpVRzla?=
 =?utf-8?B?eGk3ZlJNcTBabW1JdnRXNmlyUmo2U3dDTjg2SkJ1OTRDRTlud2xsSHRiUXpa?=
 =?utf-8?B?MU1CZXJTSUF6WXZBRUlWTDY4OFpOWkREOFpsSzFxQWxQbTFpZk00NU82R1h5?=
 =?utf-8?B?aWpGVXNhT2hTellhY2VWMlJwdG10elpoUzZJcHZiWDJSYU96b0VCeW5YRkdZ?=
 =?utf-8?B?UlIyRjl2bFE1cHZsWWZpOGdkVzh6ZE1ndTFiNFFQampuREd1ZFp5Tzg0YVRo?=
 =?utf-8?B?dGdoa0txVmo3eUoxU3praStvNE9ITVF4cDhRR2RXZ3pTNnBYQjI2d2Vrb0Q3?=
 =?utf-8?Q?qpf973xWBASJ9YLDZU/vtXc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 539593a4-5e4c-4772-fd17-08dd4d17dd05
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 16:51:44.5571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1YgqHE01EBLieSdbmlD2wC1YaxOJ3gpEYs1Snz7eu4aX0tYo5EJHONHLVNZxvQThHJ59bZbYMe7HiI07K0ec8EChj07rhttmWAx/ooQrUps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7389
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



On 2/14/2025 1:54 AM, K V P, Satyanarayana wrote:
> Hi.
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Daniele
>> Ceraolo Spurio
>> Sent: Friday, February 14, 2025 3:11 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; Harrison, John
>> C <john.c.harrison@intel.com>
>> Subject: [PATCH] drm/xe/guc: Stop reading masks from device memory when
>> populating the ADS
>>
>> If the device memory is corrupted during the suspend/resume flow, the
>> masks might end up being random values and using them might lead us to
>> trying to set values for engines that do not exist, which in turns might
>> lead to invalid memory accesses.
>>
>> Given that the driver does know which engines are available, we can just
>> calculate the masks instead of reading them out of memory.
>>
> Let us log an error if there is a mismatch between what is read from memory and the info available with driver.
> This information will be useful to debug issues (if any) with corrupted device memory.

I disagree. There are a ton of places where we touch memory and could 
perform such a check, so we should either do it everywhere or nowhere; 
we shouldn't special case the GuC just because there happens to be a 
patch in flight for it.
Also note that this issue is likely due to the memory being 
non-functional, because the value is re-written after resume before 
being re-read, so we're not trying to read a pre-suspend value (I should 
have clearer on that in the commit message). If we want to test that 
memory works we should add a dedicated local memory health test in the 
resume flow and not do it as part of GuC init.

Daniele

>
> - Satya.
>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ads.c | 36 ++++++++++++---------------------
>>   1 file changed, 13 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c
>> b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index fab259adc380..10e2ab5791b7 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -129,9 +129,6 @@ struct __guc_ads_blob {
>>   #define info_map_write(xe_, map_, field_, val_) \
>>   	xe_map_wr_field(xe_, map_, 0, struct guc_gt_system_info, field_,
>> val_)
>>
>> -#define info_map_read(xe_, map_, field_) \
>> -	xe_map_rd_field(xe_, map_, 0, struct guc_gt_system_info, field_)
>> -
>>   static size_t guc_ads_regset_size(struct xe_guc_ads *ads)
>>   {
>>   	struct xe_device *xe = ads_to_xe(ads);
>> @@ -493,13 +490,12 @@ static void fill_engine_enable_masks(struct xe_gt
>> *gt,
>>   static void guc_prep_golden_lrc_null(struct xe_guc_ads *ads)
>>   {
>>   	struct xe_device *xe = ads_to_xe(ads);
>> -	struct iosys_map info_map =
>> IOSYS_MAP_INIT_OFFSET(ads_to_map(ads),
>> -			offsetof(struct __guc_ads_blob, system_info));
>> -	u8 guc_class;
>> +	u8 class;
>>
>> -	for (guc_class = 0; guc_class <= GUC_MAX_ENGINE_CLASSES;
>> ++guc_class) {
>> -		if (!info_map_read(xe, &info_map,
>> -				   engine_enabled_masks[guc_class]))
>> +	for (class = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
>> +		u8 guc_class = xe_engine_class_to_guc_class(class);
>> +
>> +		if (!engine_enable_mask(ads_to_gt(ads), class))
>>   			continue;
>>
>>   		ads_blob_write(ads, ads.eng_state_size[guc_class],
>> @@ -546,25 +542,24 @@ static void guc_mapping_table_init(struct xe_gt
>> *gt,
>>   static u32 guc_get_capture_engine_mask(struct xe_gt *gt, struct iosys_map
>> *info_map,
>>   				       enum guc_capture_list_class_type
>> capture_class)
>>   {
>> -	struct xe_device *xe = gt_to_xe(gt);
>>   	u32 mask;
>>
>>   	switch (capture_class) {
>>   	case GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE:
>> -		mask = info_map_read(xe, info_map,
>> engine_enabled_masks[GUC_RENDER_CLASS]);
>> -		mask |= info_map_read(xe, info_map,
>> engine_enabled_masks[GUC_COMPUTE_CLASS]);
>> +		mask = engine_enable_mask(gt, XE_ENGINE_CLASS_RENDER);
>> +		mask |= engine_enable_mask(gt,
>> XE_ENGINE_CLASS_COMPUTE);
>>   		break;
>>   	case GUC_CAPTURE_LIST_CLASS_VIDEO:
>> -		mask = info_map_read(xe, info_map,
>> engine_enabled_masks[GUC_VIDEO_CLASS]);
>> +		mask = engine_enable_mask(gt,
>> XE_ENGINE_CLASS_VIDEO_DECODE);
>>   		break;
>>   	case GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE:
>> -		mask = info_map_read(xe, info_map,
>> engine_enabled_masks[GUC_VIDEOENHANCE_CLASS]);
>> +		mask = engine_enable_mask(gt,
>> XE_ENGINE_CLASS_VIDEO_ENHANCE);
>>   		break;
>>   	case GUC_CAPTURE_LIST_CLASS_BLITTER:
>> -		mask = info_map_read(xe, info_map,
>> engine_enabled_masks[GUC_BLITTER_CLASS]);
>> +		mask = engine_enable_mask(gt, XE_ENGINE_CLASS_COPY);
>>   		break;
>>   	case GUC_CAPTURE_LIST_CLASS_GSC_OTHER:
>> -		mask = info_map_read(xe, info_map,
>> engine_enabled_masks[GUC_GSC_OTHER_CLASS]);
>> +		mask = engine_enable_mask(gt, XE_ENGINE_CLASS_OTHER);
>>   		break;
>>   	default:
>>   		mask = 0;
>> @@ -907,8 +902,6 @@ static void guc_populate_golden_lrc(struct
>> xe_guc_ads *ads)
>>   {
>>   	struct xe_device *xe = ads_to_xe(ads);
>>   	struct xe_gt *gt = ads_to_gt(ads);
>> -	struct iosys_map info_map =
>> IOSYS_MAP_INIT_OFFSET(ads_to_map(ads),
>> -			offsetof(struct __guc_ads_blob, system_info));
>>   	size_t total_size = 0, alloc_size, real_size;
>>   	u32 addr_ggtt, offset;
>>   	int class;
>> @@ -917,12 +910,9 @@ static void guc_populate_golden_lrc(struct
>> xe_guc_ads *ads)
>>   	addr_ggtt = xe_bo_ggtt_addr(ads->bo) + offset;
>>
>>   	for (class = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
>> -		u8 guc_class;
>> +		u8 guc_class = xe_engine_class_to_guc_class(class);
>>
>> -		guc_class = xe_engine_class_to_guc_class(class);
>> -
>> -		if (!info_map_read(xe, &info_map,
>> -				   engine_enabled_masks[guc_class]))
>> +		if (!engine_enable_mask(gt, class))
>>   			continue;
>>
>>   		xe_gt_assert(gt, gt->default_lrc[class]);
>> --
>> 2.43.0

