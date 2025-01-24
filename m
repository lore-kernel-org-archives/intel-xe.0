Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1313DC0218B
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 23:57:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7BFA10E0C5;
	Fri, 24 Jan 2025 23:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXxlPnIG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BCD10E0C5
 for <Intel-Xe@lists.freedesktop.org>; Fri, 24 Jan 2025 23:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737763037; x=1769299037;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JbLBxy9UXxiAzAEEn/9BOf0/YVPrGXMbdu2Zt33eF3k=;
 b=dXxlPnIGFUW0qBH9CO017p3shXCRR2vCNhEVLHH1QP1vao/MZiXvpCCU
 8/Fsd8b0DHBZI8RNhFmmN/rTDNAEZA0ciPIVP9unbDZE9yzwrE9Yl+mRp
 Rg488NvQBNhpYIsMT2NtVaFtaXhHUuIK70UYgk8XBwVyilYZ5ONPMySXX
 bkKdKqAbw08HSrfzIg1wo9ypK2pP060E4yIVbBgNNaMdUpHjs2EGYmlDl
 dkAWvJSFwZejODjU+ZadvMBxH759rMw3onVMsyFCHYyJ9qvD1JjDciD0d
 0p9YhZ+w7NUkX8S8ij3Y3zEx613GEjH/u7KopP1hNsQEwNgrHn/zUDfU8 Q==;
X-CSE-ConnectionGUID: 2ojfKpnsReG3DwgJO5tZdA==
X-CSE-MsgGUID: 3tXnpx5fQnGaOuX2K9sWSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="42242732"
X-IronPort-AV: E=Sophos;i="6.13,232,1732608000"; d="scan'208";a="42242732"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 15:57:16 -0800
X-CSE-ConnectionGUID: wFANvwa3QMCGt2wItLbYfQ==
X-CSE-MsgGUID: jSNUeGUkQUW7laiKHCMeDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="112851645"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2025 15:57:16 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 24 Jan 2025 15:57:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 24 Jan 2025 15:57:15 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 24 Jan 2025 15:57:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aoAc9USdqH0ANujOx+dzF16Dt7oEVBZkmhOqDhIxmtuYIEM0Cne9bHhV4Zb4ZKuoTd0cqRgTUP6ezI8r3ZbMetXXAfU7+EGsUSJZNz08j3TRHAKnRFDfXjsQj9P/PfqjLib2WGMYuKcBSutTaYohYk9X+Xk5meeaX4vIUp1OtZyJcDmvoGVkUlUOz9pNYP8RRt4C91FGR+74b6izyAjWgNKiEBvzD4onrWi7wC4PWpz3iUkxRJjDIzoPLaAR3mwYsZ+xepcwcnoea/BKjGrKwtVrlhaK8lAVXwiclp4ZcahI+ruFAzmpp0KNVbojHbBQb7Qbm4/a1BCySvZuJjcaDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VycA+7B8GupyW5uQ1FKYs+p+bOFKoUvPl7LTWb3Uy4o=;
 b=Eei341lNTCe5HZ/cOQKyR6EdknJuMhbq46Z92s3E7lMt2k6LaiboSmMhQ0shbfDDK/TPuTqOjIRy7o6QjBZlOqTmHWh5aicTEJme8u94UR6Gqdh7aUvmtiSBCD/T3NS9Oln/E8QOf6zQ4Decn67GuwlmihvLaG2T3AfDARMA2sBYfQR8QXup/ZAlTM6HhaivLFG+StFrncku8c85stWX8lgkiNIlXMZ6WAq/Yl5KB9WjKDOFP33/omjH8j2SSp0C2WBjoLWBPk38A5S/F03T1UhheY3tzULnB5YevFd1M4PIVwqpxVz33DlW6x21FgROiCjqiv3Fw5ozq6A2joTY9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MN0PR11MB6184.namprd11.prod.outlook.com (2603:10b6:208:3c4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Fri, 24 Jan
 2025 23:56:56 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 23:56:56 +0000
Message-ID: <cb6a29e0-7baf-4872-8ae9-5374998a5a6d@intel.com>
Date: Fri, 24 Jan 2025 15:56:54 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Upgrade complaint about missing slice info
From: John Harrison <john.c.harrison@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>
References: <20250118005403.2960807-1-John.C.Harrison@Intel.com>
 <02d1075214e3ba35645686c1cb479dd5c74b5571.camel@intel.com>
 <24263415-c44d-47d5-bb92-d3fbc0aa356e@intel.com>
Content-Language: en-GB
In-Reply-To: <24263415-c44d-47d5-bb92-d3fbc0aa356e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0177.namprd04.prod.outlook.com
 (2603:10b6:303:85::32) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MN0PR11MB6184:EE_
X-MS-Office365-Filtering-Correlation-Id: c965aa43-bd7e-4307-cd5b-08dd3cd2c88c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aE1pK1hmL3dwaUFwZGN0TkswNmZGbkw2eENodmVnUHFVV2dkT1pHRTNONTls?=
 =?utf-8?B?OVI5cmtFUkR6Yldidk1KQmFFeGtGTUVpMlBqaE4zeG5GK2JqOW1KUUl5WUhm?=
 =?utf-8?B?TVJyeldNUThxUlhDV3lTbml3NmhXaFZ2NFArc1RYNHZ0bWRiY2I1Z0xHTTho?=
 =?utf-8?B?aWhPTlhlNldQTndLdzFuOWxHejBCRUptLytrcnlXem1xZUlWR2NDbWFvcmJn?=
 =?utf-8?B?a1FOazVNSGFFV2FxK3I2VWV3bURuVjJIRUIrSHZHWWc2bUJOTmk0TExJWi8w?=
 =?utf-8?B?VUVTNURyM2tERnllZGZOWGpZN0RoRmVvMjdUZ3NNZzN2ZG9NT3pNbXFjdFRB?=
 =?utf-8?B?VHVrZEJaOFY5bG0ydGd3TEU2UXVrY1BoRHRIUTNzbmticTVMOFppWFdQbVY2?=
 =?utf-8?B?Tk9WR2xFUXR1MXI4U3NnYmxNU1JVaXBQeHVPK3pFWC9WNDFqenNYajIyYUpr?=
 =?utf-8?B?RjlDdlkxL04vbUF2MiszYklMbE5DcFFGQjYyaThaQlVGZkoxbFBobloxVHdq?=
 =?utf-8?B?anBPUk5Ca1VrZHZyK0t4WG1UdmNQYmlZTVk1RFAzTGc1UGhSU3ZIdnUwNHgw?=
 =?utf-8?B?bHk2NVM1MzhDa1I3dDBhN0Z0WWxuV1YwMGRKZ2I3MUhnTzFyRXhrL2tueGYv?=
 =?utf-8?B?NGRHU0hid2xsUGZRYlBTMDQ4bWd3bGRPdWwvUUpBdEpGOS9qUmNkMXpJUHdE?=
 =?utf-8?B?NzdKNi9LcEpjako5ZHJJMGNURFhGOGltNW5SVTFpK0IxZnNIdkNjak5JcE5U?=
 =?utf-8?B?YUNNZUY0UUN4UnpPcUhJMzBJODRNNnNiTU5VQk8yU0ZJWmR0ZklZQ1l2QTFJ?=
 =?utf-8?B?TmtqalFPN2ROT1VOZmxqMnh5alV3UkhHYnk1L2ZWajhGczE1NFJKdVo0UWMv?=
 =?utf-8?B?dEs5RCttMkFxUDZWU01TeGxCUHY5UVpoamVFT2JTOWVtSCtoam9tKzdKQXdW?=
 =?utf-8?B?ZnR3d3RCUEdsdENxL2IvaVRrY1lDcXBTeUdNM3VVM2xKZEpDR2RmZytlU0F1?=
 =?utf-8?B?NXl5N2hVZnR2NjZpWlF2VWtPSGN0TTBvTlVRRjA3MEtpMXoyRDMydTZqdTE2?=
 =?utf-8?B?TklQN0ZoR2NGSDdEUzBtc1BCNklEb2Rta1BYc1dkNUV0M3JERCt2a0ZnYXFO?=
 =?utf-8?B?Rm1MOWtKSnNDekhpcWRrTW9zUHZ6aUQxdzZPNHFwS0tNS0RySTEvdnZoVjRT?=
 =?utf-8?B?MXJLZnJrTEQ0RkhqUU1kZFRDT3dYMzdvRkpqZzVhd0ZneTRTc0F1Zyt0TEFV?=
 =?utf-8?B?b2l4dEY4dFJuUUZ1U3VZVkVFRy9NL1NIakVVWUI1dlNSUTFQcEVLUk12S1Ba?=
 =?utf-8?B?RmoyejJaN3I5VVdlM3E5MmE0WTU3U24xUDdlbXcwOEcvaFZnVmVOeXRhdHpa?=
 =?utf-8?B?YktIWEJidG4xSCt1a1B2SHB6QmZhMzFBNGxsTUFvU1BRdG5MUXNPdVVjVjVv?=
 =?utf-8?B?dkFUVzYwKy9tTVBMd0pKbWlGajBxU2ZuL0dDRHljYTNrSzBZbGlUdUdPbGUz?=
 =?utf-8?B?L2xrbVl1TTQ5V1dvbjdqKy9PU3RGZmVJSWxSdE1sWVU0ckFPUEtDQTJTYm1v?=
 =?utf-8?B?TkNyTllNK1FMcXc1N1dkZ1VzUitYY0gzTHU5QlYvN2F1K25FaXNaWHA2WGNH?=
 =?utf-8?B?VjRXRVVPOGYvUFpwV3d2NndLOWpRekpVRE1WV1RIdlNZU0w0allTY2RGREFJ?=
 =?utf-8?B?ejhUTE5WU3BrRG1aRE4vTDY1SStpVW1oZy9zMUJkdWNtaUVLZ2gzemhHTGR3?=
 =?utf-8?B?aDB3b2NxalZ2Y0QvNjVKMW9ueUp6VjZDMjdzTkVXM1pNZTZwTkd6RWVvNFlE?=
 =?utf-8?B?M0NXdEwzKy9RclVnWTVnc0ZjeFprS1puLzB3QTBrZkI4T3ppYUZrWms4UFlr?=
 =?utf-8?Q?m+YjTBMmmH8GL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHZMUG52bnAxZ1VYNG5nS2VZTVV2SEZ0OUgrSlBRR05qSkptUmFLMytnMTlG?=
 =?utf-8?B?MVJKV2lJeExuMGFtbk83NnJsUWV6b3FsOXc5by80d0ZJcWhtbnNzV3k2ZW9q?=
 =?utf-8?B?ajllNU9zc3FJYmVKNVpiUEIwMjlYZUxySFJFUHlBK0FoNStPSzhHT1FXMjlN?=
 =?utf-8?B?SHkvVjhOV1pkS212aTN6WDVJZXNMeWlTVHhIakZLbHRab3VaaUNBc2RUSGtu?=
 =?utf-8?B?dW5EekRaZm5VWHJoLy9iSkhCUHRGdGtVRkVVY2ZKRWxpVS90OWRKT24rOEQv?=
 =?utf-8?B?Q0MwUllUdyt4bnJwNGdIYWQ1UG8vQVZtbUltSWZoNm16SmxQNEkwUkF6djlO?=
 =?utf-8?B?blFNSVREKzZzSk5pR2lIMEx1UlQwS0ZSMDJTb3hQNUowU080MXNuRXJCSlJN?=
 =?utf-8?B?SzNELzUzUUJYSDdDVG1HVXJBOHpNYkdPckRXa2VPaTNYbGxsNVhxQktCM2tN?=
 =?utf-8?B?Tkh6NXNDanhYNmliUW1JT3N1dFBoZTRFa2dwdk92bGl3UE1qM0loRzVEUUJ0?=
 =?utf-8?B?dERkdWFremJGUm5zeTBxZ0JlbWhuTnYyVWxwSXBMSk9xYnhKSXkwS3NiSmNC?=
 =?utf-8?B?TEFlajBJQkdMQkc2N3VoN1dPZlVJamFSWFdmRDUyODc3d3VGdkRxNyt2THhS?=
 =?utf-8?B?eVBleWxib2srTHMveWF4SUF5S0ZZdWVZeng2YjJ3MCtQSy9PQ2cwcHVhdlk4?=
 =?utf-8?B?V0p5KzFDM1F1SGZmMjRlTVNCMkZ0SjExTzExOVZET0FCNkVyY0RvTnlTL245?=
 =?utf-8?B?cFNuQ2dRbGt3TEZXME9XaUhUY2pSKzdOclBZSWxqZXpOU29aMGNmRUw4bEs5?=
 =?utf-8?B?UUc4cVN6L0pRbHdvYlAzVXpYL1h3cE81eWNQTHg4ZTkvQUo4dENNeW1GajN0?=
 =?utf-8?B?WDZvMG12aU1sTDJjY0ZVcVphOUc2N3lFUDdvaWJ1VlRCNjJMdTFmTnJPSnZN?=
 =?utf-8?B?dFZpcTBCVVFJNFdSVnRHSHdISldCZFBKVTQydWRSQ1BuNXF6dXBWMXNNUXFo?=
 =?utf-8?B?bUY3a1VjMzg1NnFsTnJFWFJxL0pCUXZ5ZWZpSUtPeS9yUjFwTVZoRFV3c3hw?=
 =?utf-8?B?SVpMeTdmbzRFUlJ4OEE2REhlRVIrQmNKUnF2R0wvekZYRkdGelpCYWZTTDhI?=
 =?utf-8?B?bjZxQmpnRDV1UEl4d25ldXhPdXFVVWV4WHFXbHJXaldXZXAxM2JROUVCV2hV?=
 =?utf-8?B?SEU0R25wVjdLbGpXZElqNkpZM0w1ZE5mbzZOc0NNNTZzQXBTRUxnNzhGclhh?=
 =?utf-8?B?c1ozd2xJZDRxY0FGOS9pU1R2Rnp2czl2V3pweEU2dUhsSjNua0FwY1ZiWXA4?=
 =?utf-8?B?V2pYVkd2dmgraTF4NWd1aHR5M3FXVlBXaWdxZ1dXajA0djczUkxmb0pnWXow?=
 =?utf-8?B?d2paQ1VsRElsSElmRXBFVFhKTU5COUg3OU1CSm43Z3VQUTRFUzR1a0tJSExm?=
 =?utf-8?B?aHN1cXprRG5Lak9ucWgzOVlIUTRtY09yV25vYXlpaXRGR1AzdVdTZEtlS2Rk?=
 =?utf-8?B?STJKMVVXSThHVk0weTBaNVdGZEdxWXFSVFVnVGMyQnpFaXRCeDU2ZDd3bTF2?=
 =?utf-8?B?MVFRUjJiQ0ZJNVcxVmR1VkNrdXppZ3p6cXppY0drK003MFBlclF6U01CZ0pL?=
 =?utf-8?B?ZmFQd0xRMkxJeFgwWHlzNmRtUklibi9HRnBDZk1pdHVPVks1S2FUdWova3lI?=
 =?utf-8?B?N0huZnRacHJWNjcxcHdqV3VDcjZaQi9ybndMMUNjNmlaZ21yL0FiMGx3TWpy?=
 =?utf-8?B?Y0o0OXJubFVNazNiS3NHcmw5Qk1BdTd3Rm96emFPdmRyRGEyUE5Ka2FuZDZv?=
 =?utf-8?B?UktDeUtzcnNtTmxPcllpeFZmZEh5Y0NYSi85bkxsa2RsVDZOa3J1QTI4aEZL?=
 =?utf-8?B?OWQ0VkEwaUp6ODA1RmhOQm5Fd2N3UHdVd21yNXdGMHpJQTlCYWxreGtDeGhL?=
 =?utf-8?B?VjdMT1dWS092N1dTUFRPTktld2R2Y1hhYmlMWjhocmVMZU5lcXAza2xocU02?=
 =?utf-8?B?VzVYa3VoejJZWkdrVk5TRk9YZVFHR0pQMjY1dmlsdWhLV2NWMGc4eHJiT3hp?=
 =?utf-8?B?blhkcU9ycHVqeE85MTRzcTd0SHlsYlJ1cUowRVVqYytlbjc2aWhxRmVtcUlR?=
 =?utf-8?B?cXh5ZG5ld0tqM3VLKzhFV3AxcEZaSS9jS0VUSnY2eGV1RVVwQjRpb3JjcTFH?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c965aa43-bd7e-4307-cd5b-08dd3cd2c88c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 23:56:56.3798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LWV0y82DefGbON8yY/cMchg1XVB80o17jxbnz2/X3u2k/bzRZYks+BG9nPSe/YoaCIyJQWg3iN9a+wmAlI9dMam87Zrc7fVzA7Y2P7KlBZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6184
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

Ping @Stuart & @Rodrigo? You still have concerns or can this be merged?

John.


On 1/21/2025 11:10, John Harrison wrote:
> On 1/21/2025 09:42, Summers, Stuart wrote:
>> On Fri, 2025-01-17 at 16:54 -0800, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> The steering code needs to know slice/subslice counts and this
>>> information should be retrieved from the hwconfig table. However,
>>> earlier platforms don't have it, hence the KMD has a fallback path.
>>> Newer platforms really should have the entries and if they are
>>> missing
>>> that is a bug that needs to be fixed in the table.
>>>
>>> So update the complaint to be an error on newer platforms and remove
>>> it completely for older ones that we know are bad (but are not POR
>>> for
>>> the Xe driver anyway). Also, re-word the message a little to make it
>>> clearer what the issue is.
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_gt_mcr.c | 8 +++++++-
>>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c
>>> b/drivers/gpu/drm/xe/xe_gt_mcr.c
>>> index a1676b787fdc..605aad3554e7 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>>> @@ -341,7 +341,13 @@ static unsigned int dss_per_group(struct xe_gt
>>> *gt)
>>>          return DIV_ROUND_UP(max_subslices, max_slices);
>>>     fallback:
>>> -       xe_gt_dbg(gt, "GuC hwconfig cannot provide dss/slice; using
>>> typical fallback values\n");
>> Agree with Rodrigo that this is still interesting for older platforms
>> to show the expectation.
> But it does not provide any useful information. You might as well just 
> have a loop on initial driver load that prints the warning out ten 
> times for any platform prior to LNL. The comment below has all the 
> information that the above message tells you (and more, because it 
> actually tells you this is expected rather than unexpected). There is 
> zero use in spamming the user with debug messages to say something 
> that is an absolute guarantee on a given platform.
>
>>
>>> +       /*
>>> +        * Some older platforms don't have tables or don't have
>>> complete tables.
>>> +        * Newer platforms should always have the required info.
>>> +        */
>>> +       if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 2000)
>>> +               xe_gt_err(gt, "Slice/Subslice counts missing from
>>> hwconfig table; using typical fallback values\n");
>> I understand the intent here, but IMO it would be better for this to be
>> a warning.
> Whereas, if this is a platform which is supposed to have this 
> information then it is absolutely an error if that information is 
> missing. Something, somewhere is broken and very definitely needs to 
> be fixed. Also, while the fallback should be accurate for the 
> platforms below, that is not guaranteed to be the case in future. In 
> which case, using a fallback may lead to incorrect register accesses. 
> Which, again is very definitely an error.
>
> Either it is a new platform and someone forgot to add that information 
> to the table. Or it is a new platform that does not conform to this 
> way of accessing registers and thus needs a KMD update to support it. 
> Or it is an existing platform that got broken because of some 
> regression bug. Either way, it is something that we need to catch in 
> CI before the cause of the issue makes it out of the door and on to 
> end user systems.
>
> John.
>
>>
>> Thanks,
>> Stuart
>>
>>> +
>>>          if (gt_to_xe(gt)->info.platform == XE_PVC)
>>>                  return 8;
>>>          else if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
>

