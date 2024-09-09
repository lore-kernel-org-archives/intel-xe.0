Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2BEECE57B
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 09:30:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D30C10E356;
	Mon,  9 Sep 2024 09:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nZBBkLdG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDA910E356
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Sep 2024 09:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725874207; x=1757410207;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XVDlk6nOWX7jpYPs7ARqSODCRcV/TtgyZbvcISYb1r4=;
 b=nZBBkLdGksBWunhDMTq3dUPj8S9GrdBe9UTdi/6nFrpuB3PH1m/6Vb1T
 45GH91c2otk7Z5ashpDGgif19J+2E0ougSWTqIgRTjijPgqjMIT2cyuKh
 7CP0Mcx4A9BPDjiz/ogRIN43rfOeARPUUdQhzy+laeD2jWdR4rmRTBo9X
 qRVZ/i5YaOm2AryRAKaydNGKpfifa4NyVNlMyNl21b1kocYt/QzOCfufT
 7BX532D8xLYBg4hTsFWWQMLDKs725MswOtkfTH5U2oCgTwq6+YqLW15Fy
 ez/WndPHKeHM+MeRvZzKe94e7OfDJymYT4SUB06NnTTG1YyvRHYiNkDOT g==;
X-CSE-ConnectionGUID: sAt/bKrBR7ORXU4KNwNOag==
X-CSE-MsgGUID: 7UxWR6EPT121UoBjwqaPnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24502220"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="24502220"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 02:30:06 -0700
X-CSE-ConnectionGUID: 5riSGO4cTjemTO8CL5n3+w==
X-CSE-MsgGUID: /aE5w9I8SPOvFjQfb0so7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="71408777"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2024 02:30:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 02:30:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 02:30:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 02:30:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 02:30:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pw3nSIvmqDfGOX2EM+iyLnut2xRHU6RjPeWZWCi5Hu8IkE5wVsIHifXdPKBDKFe+2jB/4Rzb9T4K4WlnaJSJON8mtVyoFHzTU51LWkIpRMcHvyQ84AwmlIV4ZpyNfe7IGXV3K+EJKMb4wR5vMDOFqtGePQtntbWgh4JpAqohslb7aqYg/vngEh6oCz/QLKIvi1ZyNLTwol5PCPtn5Iq97oROWWPd4Q9LqX7uf+aU3BFtT133UbsOCTbSYyJgYDXyO9KZ8tbyPhmNgN9y3Plg2JNSt6C12PhTQjnhlz/q1KKFWdCKObTqNffyRW2/hfXZ1vFOhZkqEE8jtDvaaurPUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpPhr0Wjsphu0Y9LqOfZEQd8Q6wZ6JC5iVj2SRdd5dY=;
 b=tMuVmAnaXnwX1VHX02aUDUiGmNuTSv90vPAtcfn+ugJfoTC4f0wsi1+zhYNxna1Arrj0STA75UMcufPxmzJ6QJTuKPnf/8S9QqbSZHWQFomvczai+ttLX2twj4KPvnFDve2CPaqY0kCgvNTrru4vCEAEBh0k/bfgRLeGGhpXkJrX+niutb5tTEPyvL0ti0XgBov8o2oEYOVl7867W8RzAcjA6luaalbRPRKlPMPU9V25gJyF1E61D2rsRAsvRr5h135Zsv9kuQxqO0agsXiTNdJmwnJTyd81UTqVLY/i/GcUjfooxmCcTpr3vBCCBbSgmzINlcQAbCTaNuWksZCjRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB8207.namprd11.prod.outlook.com (2603:10b6:8:164::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Mon, 9 Sep
 2024 09:30:03 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 09:30:03 +0000
Message-ID: <43116f22-0495-44ec-9895-aad9dcd5165d@intel.com>
Date: Mon, 9 Sep 2024 14:59:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 7/9] drm/xe/gt_tlb_invalidation_ggtt: Call xe_force_wake_put
 if xe_force_wake_get succeds
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
 <20240830052326.3707019-8-himal.prasad.ghimiray@intel.com>
 <ZtoIk-OUD7qkBvKn@intel.com> <9605f23a-ce16-468d-a7b3-2ea3d9be2f21@intel.com>
 <Ztst1yxHrJyHQMl6@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <Ztst1yxHrJyHQMl6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::30) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS0PR11MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: 39fa7204-60c2-45ba-fed2-08dcd0b1fbe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nm1CTkZiaVJ3MnBHeUVUZVB0bHRXY0FwUk9GQ2JHRlAxczkzOWhGVXIvRmpp?=
 =?utf-8?B?cWJQNlRZUTRqUkJVRWNxeVlVSCs1Qm44ZnA3QmFqWUd5Uk5ySjgzR21YWHQy?=
 =?utf-8?B?RWkxTHVvUkZHSjNFaFUrUzNVWUE0UmdlYXZ4cnFDUUtUcEhmS28xWDhOckxJ?=
 =?utf-8?B?V3NXUFRlaUNOL1R2RWpKbnZZaElab0VRMUtVZ2o2eWwrR2JyMUw5VDByWVlF?=
 =?utf-8?B?TkxRZFhtdTY4eTFuV3JoYzFsNXNzS3gxaitldGpoRERXWEYyRzB4VTVqVnI4?=
 =?utf-8?B?V2pJK1dmZFl6N1U5Y0paSXJaaEp4eHRiWmZVSklsNi95UzNORmMzMHdvTlBW?=
 =?utf-8?B?N0F4VGFHYUw1TjRGdVhzdGFsMGo2Rm9vbERzNWZOQnVaZ0pBTUd4YTJTR2xl?=
 =?utf-8?B?bFJITndzdTFXdjFrZW13V0RVcy9WcE8xSVI5RVFkQXJlK0l2OGEwMGJHS1Nm?=
 =?utf-8?B?TkRabmpjamxuYjNTR0lkSjkzc0YvQXdUZU9aT0YrNVJpZk94WXF2aE9ETUNX?=
 =?utf-8?B?aVJrTFRCcVhUR1lWSUFqdUJ4ZFNLWU1aNHdKSlZZYkVHZkFrRDBSdHNsM29k?=
 =?utf-8?B?bkRQckRNVVpkakYwKzZHQTV1dXNoc25ZN1BiWFRQMStBd3Z6ZU03eEk4WGNj?=
 =?utf-8?B?QmczNXVRNmFidUtaOUdaZS93SElER0FsYzVBWm5HaDlmOGxuSVpDaEU3c2RB?=
 =?utf-8?B?TnJoV0tBY1FOSEgva0lVKzJwWUJ6ZnZyUnROVTRBKzE5S2VZcUF5SkJ1emh2?=
 =?utf-8?B?eWtITDZxVTUrL2U5SmVhMnU5dFQ2czZhNFhndng4WjFNNXU4ZTZWWlB0RlRW?=
 =?utf-8?B?UllJUldvRXUwYURVMEVudkJSUjR1ZjlWcC9nUGFjeG55cTQ2SG1YNlB1bElD?=
 =?utf-8?B?VkozRzk1d2Iya0NkYjBEWjQrL1IxNGVmdDFYUjdOV3BxcTVtUVJPUE1FQyts?=
 =?utf-8?B?RVYrQU1MVWkxcEppTTJ4Q2Z6eVNoWm50RGdPZXEyczRxUVVtSjZaenpVdGc4?=
 =?utf-8?B?ODJTT09JMnZ4bGJFR0dGZmFEZFMycEVQOWd5K2FOWE9SR3ZNT0JpaFBMQzRa?=
 =?utf-8?B?Szc2VEgrY3A3WjRaUDJucDI5VXkwMkpoYTFGRjREa25TeHZucmpjRmJxd214?=
 =?utf-8?B?d2xMMWI0NGtJNkNVOXJkcHFiajNmZWtmR3JndmpkWVBmdHdlUW5qUnhXSW45?=
 =?utf-8?B?UUVrbTcxbjQ3aHBiN0VpQ09rNDhvSTM1Mk95ckZ0Uk5vZVo3K2h0TzRMc0c4?=
 =?utf-8?B?RnpZcVhnanRkb3FGMldoTGw2UUdEUnpIaVE0eWZNanhOdEJ3K3o0dGtkT1Rn?=
 =?utf-8?B?KzNXaE9veFFxNTNGNXdLVm9BaHhLaXY3dDQyVUYxWTk4cFpYL2FGbDRUaUxx?=
 =?utf-8?B?R3FmdEJwU3NGVUdQYTB4ai9yRDl6VnljaW9JSVgwZ01Gb0tQQXl1eXNwUFNW?=
 =?utf-8?B?WitndkFSWUY1eUdhNU1FdlN5MmQwTGlybEE1Ulo2OGVGWVkyMEtNSm83aW02?=
 =?utf-8?B?cHZZZ2h5NVdYL2dHMDhhK3JYS0s2MjB3UHZhWU5aY0ZCOVhsVTlncmRoNGpG?=
 =?utf-8?B?bGdENUt3NW1NY2pFZ3cyT3RqbS9mMlZBOTZQRTBxTnYzTEgvWnZwMFZNSGV4?=
 =?utf-8?B?RDBpbGNqVm5vMFNkTktJYzhFaUs3czgxZnl4UkdsaTZYdU9Ia0w2aDYwYVk3?=
 =?utf-8?B?dFpkbngydnF5RVVieUxwbm52eWVDMW5OOXVXUVJUTWo5K1QvOU5FOVlZVDJU?=
 =?utf-8?B?UXJYOFBPbi9YVGJxanhXUXFDa2cxb21lTGVrT1lSU1lPcC9zcitvb1Ixdk5y?=
 =?utf-8?B?NGRYRUJFNEdPRnFlajY0QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjhmTFp4bmZWVTVxaHBLdUlCTWVJVWdxa0ZISVBjZ3I3WWkzMDhYNXFQZWJS?=
 =?utf-8?B?TSs3Q3NaamV2bkd1amNtbUFENDJ4VVpkek9vbUlBWm1LN1IyMTdkOVlBTkNv?=
 =?utf-8?B?TVhVTWpUazlNWEMyclBxR0FJc2ppaEQwcW1weFpZWDJpTWRhVVplQVVyMXhB?=
 =?utf-8?B?YU5qOGZFNnpQUDNvUEZ4eHlOUU5XNTY4NStycTdONkdldUhyN0owMU5CbzhZ?=
 =?utf-8?B?OG9iaXVtNWZTVHVaMWlQUEdVMW9zWmxTTlRVRERjMC80Wmh5QTRIRkVNeno5?=
 =?utf-8?B?d0dQa2NDWG1la29xT3dYT2Jrb0o0RUNuN2Zqd3orNkk4T2s2b2M2YTdCdURJ?=
 =?utf-8?B?Q1VBUWc3cFBJWGtRWlNoMHlyS2dxRFlFSmdvbkdkSk1WNTlPYzJURnBqR25a?=
 =?utf-8?B?REFxTjNEaFZ6VXJac0N5UE1lSTZNVGFMQTBrTmF6Vko5b05hVDAzQy9EcjI1?=
 =?utf-8?B?Y0FuWXVHUFphUWRrZHdmWG05MVpVSVdCaENSMlU3aklzOVdCNUFpWEZFdzdL?=
 =?utf-8?B?eXM1cjNHczNBYmxUWW0vUStSWFdIdE9pb2YwWnFhOGZKR29jSVJORkhrZG9h?=
 =?utf-8?B?TGlKVlpPQzVQRVdVRk5kWUVLQU8xRFNjYnFMZkZ6dHFmbEJZcCtzRThrcmJP?=
 =?utf-8?B?bnVrRCtmZmlZbHZWZ0RJT2tJNDVKaTZhT0tDVXVJN1hoU2drRkRic3ROaFJj?=
 =?utf-8?B?Q0ZxbGRJTkR1RVVMbC9pVmRvTHllTG85cUdHdTRnVWZ6SWNNd2poWnNCb0Vi?=
 =?utf-8?B?NTRUR2RuWDBCcWZoOVVZeGJKYkp6ZEw4WUNOQ1hpWUI0Y29XRllHV1prSWtX?=
 =?utf-8?B?Ty9yaGI1STdleTRLeEUxTGxwb3F6bXR4NEtmZzVHQnREL0RuVjBDRDNMY1R6?=
 =?utf-8?B?WVNXMWltR1RqdmVHZFZQQlI5dXlJTkNzbXArZ3lIY25nNHBPT3ZCNVhwY2o5?=
 =?utf-8?B?Ky9TWUw3ZTRJdTZoWm8xZVVYZWFmRVcyQUNyeERSeTlvYkYvaGZOTmF0eG5Z?=
 =?utf-8?B?K3Rzb0V6akxXbmN2ZVBxSjJuMDhNSmthY0tZR0FTSmZJMUdtZU94UHpNbnNV?=
 =?utf-8?B?ajNpUisxQzA4R0tVMU1CSXB1WjJyUjcrTXFHejFmeGJ0cGVVTVd0THhFYysr?=
 =?utf-8?B?ZnNiTXZlb0pWOGpvZFpkUGY4ZlRwRUpMNFhyK3pFWk1YT2ZiWitRS29BU3RP?=
 =?utf-8?B?Z3BLQnVRWlpINEVyWldKczU3TlYrZzh1MjBNWEgzbUI0T0tHQmNYZE1KblBN?=
 =?utf-8?B?emtuOFd2NE4yUHdkc3MyVXNBS1pNa1RoOS8xcWcvUXFLeWNFLzRjWDl1OERJ?=
 =?utf-8?B?UVBtV3djN2VTTjJHL2Q3RmpudTQzRHRZZ29qWmFJWEJQQjY0SThYU0laOFov?=
 =?utf-8?B?dVB6VVUzVDc2R0U3cGhzbzYzU2lvUGQ3M0wyWStDMDhSVzNlaGlUVW5NakpN?=
 =?utf-8?B?UCtJSWxXRjV2a2pFSWo5dWxwcndBUTZvL2RXSkpEY1cvc29aY2RKdlJGT0VS?=
 =?utf-8?B?bVB6Vm1HV1FaZWVra0QycEhRK0JUYXVqQjNuaFVFb0pLM1ZxR1RtWHV2YWZ5?=
 =?utf-8?B?NnRZcFh5cWpWUmpORlNqamdYWlNsZVNFTThDY003MVEwMEVHYkVuMUEwbk9V?=
 =?utf-8?B?T3gyc3ZZbnR3ZzFBUld0cnlVakp4SWtzVVRZalRCT1E4aW80UXZIT3BXWDl2?=
 =?utf-8?B?VzhuR0ZYWjdLa2dvcGZoMGZuN3U4TnhTTm5GSWRYbGFNbGI2SFJpY2RpYUpw?=
 =?utf-8?B?YldDRitNZjFHZTYzdDh3aUpHNlQ3cG1XSkdBUkViS2JwVkI1U09FcFhXUmlw?=
 =?utf-8?B?elh0QVI4SUtybThWa0FCa3pzK25sYlFDenhzb05qbmp4NDU1V3owTjZvUFlU?=
 =?utf-8?B?NndESzVUWnNzalkwcHNrVkJrclpNa3l6MnAyM1QwSVV6NE8xNDZKM0FZejlC?=
 =?utf-8?B?ZUgwa0xXM3VuZndFS0hKU1pFMlU3SlJkclJocktyR2JXYXFEb0k5d3hva3FB?=
 =?utf-8?B?MDl3L1drY3JpeVJCZHZxSW9zWnZNcGZtNUI4ZElXZk9jVTBucFZBcUlTYTlS?=
 =?utf-8?B?N1V5WGw1OFpxODg1cFN5di92ZFpaeHlMWkl1ZzEvQVpNUGlaRUo3cmZJZFhU?=
 =?utf-8?B?eHRITmIwUU5jUkxpNUJjWmlIdEVtMWd2YlpSQnNuUFNaWjNqVTNabE9YcG1J?=
 =?utf-8?Q?EnPPYGhcHUBvi0yeM4TxGmI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39fa7204-60c2-45ba-fed2-08dcd0b1fbe4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 09:30:03.7118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: REu56Xb9O5r/hKmKZYuz7UwESPa0IJytvA0Ch8qfPzo5jkYW2W+x53Gj5bjy5PuIdvhP3nbUSsuMAQcfWi6kSDaP43vPQ+aVroLutH4CsGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8207
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



On 06-09-2024 21:59, Rodrigo Vivi wrote:
> On Fri, Sep 06, 2024 at 01:21:41AM +0530, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 06-09-2024 01:07, Rodrigo Vivi wrote:
>>> On Fri, Aug 30, 2024 at 10:53:24AM +0530, Himal Prasad Ghimiray wrote:
>>>> A failure in xe_force_wake_get() no longer increments the domain's
>>>> refcount, so xe_force_wake_put() should not be called in such cases
>>>>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 9 ++++++---
>>>>    1 file changed, 6 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>> index cca9cf536f76..3f86ab704c4f 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>> @@ -259,11 +259,11 @@ static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt,
>>>>    int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>>>>    {
>>>>    	struct xe_device *xe = gt_to_xe(gt);
>>>> +	int ret;
>>>>    	if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
>>>>    	    gt->uc.guc.submission_state.enabled) {
>>>>    		struct xe_gt_tlb_invalidation_fence fence;
>>>> -		int ret;
>>>>    		xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
>>>>    		ret = xe_gt_tlb_invalidation_guc(gt, &fence);
>>>> @@ -277,7 +277,9 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>>>>    		if (IS_SRIOV_VF(xe))
>>>>    			return 0;
>>>> -		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>>>> +		ret =  xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>> +		xe_gt_WARN_ON(gt, ret);
>>>> +
>>>>    		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
>>>>    			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
>>>>    					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
>>>> @@ -287,7 +289,8 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>>>>    			xe_mmio_write32(gt, GUC_TLB_INV_CR,
>>>>    					GUC_TLB_INV_CR_INVALIDATE);
>>>>    		}
>>>> -		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>>> +		if (!ret)
>>>> +			xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>>
>>> looking all these cases now I honestly prefer the other way around.
>>>
>>> If we called the get, we call the put.
>>> get always increase the reference and put does the clean-up.
>>>
>>> fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>
>>> xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>
>>> so, the fw_ref is a mask of the woken up cases which require
>>> the ref drop and sleep call.
>>
>> Hi Rodrigo,
>>
>> Thanks for the input. AFAIU using this approach creates issue in the
>> subsequent force_wake_get/put in callee function. Which I have tried to
>> explain in cover letter.
>>
>> [1] subsequent forcewake call by callee function assumes domains are
>> already awake, which might not be true. This shows perfectly balanced
>> xe_force_wake_get/_put can also cause problem.
>>
>> [1] func_a() {
>> 	XE_WARN(xe_force_wake_get()) <---> fails but increments refcount
>>
>> 	func_b();
>>
>> 	XE_WARN(xe_force_wake_put());<---> decrements refcounts
>>   }
>>
>>      func_b() {
>> 	if(xe_force_wake_get()) <---> succeeds due to refcount of caller
>> 		return;
>>
>> 	does mmio_operations(); <---> Domain might not be awake
>>
>> 	xe_force_wake_put(); <---> decrement refcount
>>   }
> 
> Well, to be honest, this is what bugs me in this whole series.
> 
> If func_a failed, why would function b succeed? It that's the
> case should we include more redundancy and retries so the
> func_a would succeed like the func_b is expected in your
> scenario?


Hi Rodrigo,

This is current behavior, which patch [1] resolves. I misunderstood your
comment as dropping of that patch and simply balancing all _gets with
respective _puts.


> 
> But other then that, I'm afraid that you didn't fully understand
> my idea. Sorry for not being clear.
> 
> My thought is, you do what you are doing in this series.
> If the get doesn't succeed you drop the ref count and call the
> disable.


OK. IMO, just reducing refcount is better for failing domain and not to
disable it explicitly


> 
> The return of the get is just for the domains that have succeeded.
> then the put returns only the ones that had succeeded.
> The function B will then try to wake-up whatever had failed in
> func_a.

I assumw with this, the return of xe_force_wake_get will return the 
mask, hence the caller will need to verify whether the returned mask is 
correct or failed.


> 
> Something like:
> 
> 
> func_a() {
> 	fw_ref = xe_force_wake_get(ALL_DOMAINS) <---> fails GT-domain but return a mask with all the domains except GT.
> 
> 	XE_WARN(!fw_ref);


XE_WARN(!fw_ref); will work for all individual domains but not  ALL_DOMAINS

XE_WARN(fw_ref != ALL_DOMAINS); <-- If user wants to continue -->

if (fw_ref != ALL_DOMAINS)  <--If user wants to return on failure -->
	xe_force_wake_put(fw_ref); <-- ensure to put awake domain -->
				
	return;
}


> 
> 	func_b();
> 
> 	XE_WARN(xe_force_wake_put(fw_ref));<---> decrements refcounts of the domains which were actually woken up.

Makes sense.

> }
> 
>     func_b() {
>          fw_ref = xe_force_wake_get(GT_DOMAIN);
> 	if(fw_ref & GT_DOMAIN) <---> likely fail anyway since func_a has failed, but it at least tries it out because you have handled it in your series...
> 		return;
> 
> 	does mmio_operations(); <---> Domain might not be awake
> 
> 	xe_force_wake_put(fw_ref); <---> decrement refcount of the domains you woked up.
> }
> 
> does it make sense now?


Yes, this is indeed a much better approach for FORCEWAKE_ALL. Thank you 
for the suggestion. To summarize, rather than disabling the successfully 
awakened domain in the event of a failure, we will use forcewake_put to 
handle the disabling of them and user will decide when to call it.


> 
>>
>> BR
>> Himal
>>
>>>
>>>>    	}
>>>>    	return 0;
>>>> -- 
>>>> 2.34.1
>>>>
