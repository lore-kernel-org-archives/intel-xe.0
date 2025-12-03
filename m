Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CC0D116F3
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 07:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0454A10E078;
	Wed,  3 Dec 2025 07:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ncbt/Msx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74B010E078
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 07:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764746764; x=1796282764;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=98hb7kpvqQoCTDodMQGfhQb9yUwFaNsic7M2JmrJKEQ=;
 b=ncbt/Msx919/X+TIYUl7AE/A5qXLDzIoEGZCLnex2Fin/r43PNxl70CJ
 ioPiIKhe3+TxI8NUjtlcCLe3WJ3AzBcvaehmkceZqiXAwpxsvBMF/rr5m
 eKR18nlPe1uCaED5RUtiVNIx41MVTVS50xrRINGm2lzNtX4/JAk0ZXjju
 gSk1cyUYf1FyH/IJ6b1dGVz2xp2aZsW/wnvgVam0xh8iWOOyIpgdGhSRt
 DP37ncs/CVmefy7I5E3yO49PP3UpIjQiCUjZYH/DjOftJ271guQU4UxCv
 jEOeBBVVrQ0td5OXz1KGn32hxaVrAj0yqba4dhF39U4aLK8VcXn6utkKb g==;
X-CSE-ConnectionGUID: gjZEWKWdTQit17Zr2XvYfg==
X-CSE-MsgGUID: Oumb3h20QLG33cAjS8WaBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84130732"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="84130732"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 23:26:04 -0800
X-CSE-ConnectionGUID: cMOjmzePQRy1mKRI8KIoEA==
X-CSE-MsgGUID: /ZmmCQaCSnCEs/VbCNMhqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="199541799"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 23:26:03 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 23:26:02 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 23:26:02 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 23:26:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MTxN3vzNHn2QhGuMO3a+3lmBu2E/6Z9QxqRR1OYEPwYgKNd9SVbBDent3jZKQjPMNFv4JliJvXgOaCW96qVLoZ+IgucQUA9uZE5nYMGpcuxOrsJJClsmKGaW16lyQqwOlHtiv459t+xbE8zBwzzf7sbhoqY3VLRlEPjKgessneCdupc+twD25AIzHNGtarVSDgGeWvHZtkLWR4lVoWjt91DtIPXYzrzIYeFNhWxBHZqhBD1Zp/uAHWk3DvOKtfkOMFgrnHqBGaGQP0YRXcME87rKjABLB2Nqs1OFiP/VHAWZBg0t7UVn0Oyc0BfkfOpL3aDFdppsBCSEJU0H/aukzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/eSQ848tv4YnY/SMat6LSu/NQYHr7/8091zBEbvQIaA=;
 b=NBN9JBjbUwOHbRNB3IHnCxNU3t+DsBgknDJWt/0XRt/IIR6ESrYHJOAB9nn5CpjEohfMHOykoM4BLhxGrZpk168IyXeb4jjduqzBz7dSn1fZo/hI8O6SnWUlT74fIOHabwkyRsUZg/LpyYVi8bOoR00Vgd23AiDpeYWRsa2yZFtYobRDOKUgziQwCsafivSeP1Z5IaGiP1DPUG1hQsA/l7qaxXTU8uv/3nJpIva1ok2HTao9xn9pPCNRLCA1857Va2GHtBYmwSbDEqBgKGKdgCRUfoQXBU+XUH3s2uoKRFItkG38Jz2/A2tMF/nkfTxs6Gb0abCfQe1hCQo+ZtpSOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3041.namprd11.prod.outlook.com (2603:10b6:208:32::17)
 by MN2PR11MB4533.namprd11.prod.outlook.com (2603:10b6:208:264::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 07:26:00 +0000
Received: from BL0PR11MB3041.namprd11.prod.outlook.com
 ([fe80::8f61:c439:8828:cbb3]) by BL0PR11MB3041.namprd11.prod.outlook.com
 ([fe80::8f61:c439:8828:cbb3%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 07:26:00 +0000
Message-ID: <605b6378-abff-4c24-b8f0-85d7ea51ea30@intel.com>
Date: Wed, 3 Dec 2025 12:55:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 5/9] drm/xe/bo: Handle CPU faults on purged buffer objects
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
 <20251201055309.854074-6-arvind.yadav@intel.com>
 <aS8zH+PBu9yDmRc0@lstrano-desk.jf.intel.com>
 <aS80edjt8NMTWNYo@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <aS80edjt8NMTWNYo@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0031.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::8) To BL0PR11MB3041.namprd11.prod.outlook.com
 (2603:10b6:208:32::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3041:EE_|MN2PR11MB4533:EE_
X-MS-Office365-Filtering-Correlation-Id: d424345f-f7c2-4a46-afa2-08de323d354b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmUrN1ZaR0ErMkZicFYzc3UwSzFtU2JhNHBJUUo5aktrc3ZCMWVyUFgvaFhH?=
 =?utf-8?B?QktCTzYxbG96dklncGxJSlRXUjJjbysvUXgvTHVyVDAxUHN6QjNtRnVqWldX?=
 =?utf-8?B?OCtjMnlQaWQyY2ZEZ0QzSUNxUldEWlF6c0dqaXRiaGpJSGFMY2pRMVZTSkht?=
 =?utf-8?B?em55S0FBbUYxMlA2S3g3cU1MR2R6TkltZnIzNk04ZnpkSkNOd3NNa0NpSW5r?=
 =?utf-8?B?TS9IUVdRcnRPa3gxckhtMmY5a0t4dnhYRXVDSTlBWHRBaGJ2MEV2akRWUGlo?=
 =?utf-8?B?VEE5dkZGcUpBMkFMODdUelBrWkYyREJTYVRvaS9PeDZPMDVPQk5xc3VpSEdm?=
 =?utf-8?B?eThwbWd5SkhTNytuTWh2SkJoYTkzTjNUamlDYlIwbnptNGhucXAvbVdDK091?=
 =?utf-8?B?SzFNdjVRS0ZwMk44OVdOY1RDR0JYT3REU2pyemhqeTdxQklKRENvQnUxQ0ZG?=
 =?utf-8?B?aEtzaVFEdkE1YjNhODRmM0g0azB6Z2dKWUdCZnJsMFdxWG0wWk81elg2ak5p?=
 =?utf-8?B?Q2pvbWExbEQ2WCt4ZUdrZEo4TFRXUTZ0MDVxM3J0V3RYSjdvTjlBYnJtdU0x?=
 =?utf-8?B?eE1KWFJPN2llNzAydWdocFQ4eWl1TG9sd0MxU09DSVRuTDZ2ZFovdU9qUTls?=
 =?utf-8?B?N1oxeW1zWm9hREhYSnZUWUU4ZTZQNjJTMFpxNHBpSUcxZTk0eDQ4RSt1RUZi?=
 =?utf-8?B?b25kRkExK0VCY1RHcnYxZ3pHcGRQVjJoKzE3S0pYNDlKQ3dadmE2VkFLbHRL?=
 =?utf-8?B?NmgrYTlpNmJ4K2pSbzVVMWY5NUkrais1Q25FSWRDODEwTnRiNGNyZjJsZndw?=
 =?utf-8?B?ZEVsYi9TaEdhQnYzVWJUMFR3ZHNmYjY5bVVXbnQ5OG9uV0p6cWxUNVRjUU41?=
 =?utf-8?B?aHB3QTIvdHNpTjJubE5NVjJHTnRDU2NsZ2k2eGNmTlNPemRqYjF6OXAzN1Rj?=
 =?utf-8?B?ZHh3dG9GaUhFTUZ1UUFsa1dzLzFhSzN0VGZWS2xKeW9qaTh6ejZKREtQbmVj?=
 =?utf-8?B?eGdJUGM3ZS9FRnRrd3VOWHFXSmhDWHFobGNDTmZjT0pjZndRUEpqOGEvaVhU?=
 =?utf-8?B?T1FFd2lCcmI1anE0ZFdtdmlxWkFPWVFtamVEWlhnQWNhU2pFZTZqSDNScGp2?=
 =?utf-8?B?YzZlek9rYjJyb0lDS2hjVVdLVlV1TDFUR0hxOWlvclI5Sm5EeDRhTStDRmVG?=
 =?utf-8?B?TzA5eTAvQ0tnbmZrbTJ5b0RzcUhoZ0Z0R244NFNXTUZzU0FWSEdLcVlPaDI4?=
 =?utf-8?B?RFBpNFlKQjFkQlp5b3FRRTNNYVpNckpUWG9RUjZkVkRxWU9lREJzYmNQMGZR?=
 =?utf-8?B?QTk4VFRHQlQzemlnL2dJY01VR0l6WGhsTWZ6T29YdW1VMGR0VXV1Y29ML2dz?=
 =?utf-8?B?NU42Y1M1LzNSQmRnWjRENkgzM2MzYVJqcHJGb0llaERRU0JnWnB2M1hjWm9y?=
 =?utf-8?B?ZW5VVS9DQXVzTnRkK1d1cXhhdm9FNHhuWnV5T1IzVEFnbkpwa1BxMkR5MVlE?=
 =?utf-8?B?R0EvL2s1Z1pBL0VqYVp6Z1VMUTJGaUFBOUxOb1RPOXpoeXdpVlBkbWduaUlH?=
 =?utf-8?B?UHJNRHBDdnBQYklqNUhUSHhEMGZUSWlIbUtBTHFTOEdsaS9iQnlEMmRHVGlS?=
 =?utf-8?B?QStmU2dtajdHWHprWEVlZnZ3ZVZOVGpyT05ubmlDU1pRKy8zbytZVmo0Tkls?=
 =?utf-8?B?NVhDWVV5N0g0dVlGWGZJRXVHbDh4NWg5ck5VUkxpOEE1YUNpMzUwc1JKalZM?=
 =?utf-8?B?TVNPSUNpTVJTOSsyS3RYZ0paQTRhcGtheVd3RG5sdTczOWt0UEtNNGhJaGZx?=
 =?utf-8?B?RjQ3anNvTEwvRDJhUnlIZEovMnVHakh2aGNxMWI5QlZYT2hRQ0VQN3E4TEJo?=
 =?utf-8?B?WFVHK1Z6WXR6Ty94S2s4dDFzUkh1TmVPZDdjMEhBWmdXVCtlSjdnQi9sRmJw?=
 =?utf-8?Q?odPLjFTRh0pWMnWcxS0TyZ28Kcf3uZih?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3041.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aC9DN2RzQklTU0VGS2JDUnBoQ2NWL2NiZlVpWmNPdXZSM1pFbVF6YThTVHRi?=
 =?utf-8?B?TjFWNWYycGxhNE1BTldkZTJyMnZSeGk2TXByMVk4TjQzdTVabjdzengzMmJL?=
 =?utf-8?B?VjRLL0ZUOTdEaW9tSkIxQVBqM01WZDZoVS90Z1YzYldlR1RIenpvcEdlVmhN?=
 =?utf-8?B?NTRoc3JNUFJJUFZaRG1PeVV2NE1LSjkxWWxvRkVZWTVrbjI4eXhBM1IwQ2hn?=
 =?utf-8?B?NjJzMVJ1azJlY0hCTnRuWUpVRmFGaFZJa2ovdmZDWjN2dDFPZUp3dVlRR2Qz?=
 =?utf-8?B?WGt6SHBzSDBhaW9oV2M2NVB6RzQ5d0JmMDFvYzlSbkNhYVFKbDlFMHVQdkN3?=
 =?utf-8?B?amxTTlNQMzBHZ2k3bkpIVThMY3czL083b1VtZzcwR1dtNXVKRDdaUzk4bUVi?=
 =?utf-8?B?VGx6aDZwSUtMa1Fpd3dPTDhpZjhLMEVGRGw1ZU5OeEs4d0ZWWUhMUEt4OWxX?=
 =?utf-8?B?NXl0MHVySVlYMHN4WUV6UklEUVhNcjdjbzNxMXNBUFlQZHZMMnpzemRWdklj?=
 =?utf-8?B?eVZYbWFQc0lSLytId05mUGJXVEM2OG9HRFNiS29qckdmQWxNNFY4ZmxOVUdF?=
 =?utf-8?B?TlY4ZlVQd0Y1TUhKKzhmdDJCV1owUmRpOWUvT1pXdW42VmhvM1h5Z0R2Szgw?=
 =?utf-8?B?L2JRVmIyMzE0VFk4VnZLUldqRUVTdTRQclIvTmNCV2dYVFpqRFNFVUlWMXBF?=
 =?utf-8?B?Rkk5bGZuSDNmK3dOVklaUE5ISUN6UElBM0wxcCtuL3FhTGR1N3FQaUxqM0ox?=
 =?utf-8?B?ekdpYldVTzdBUllxRGVHb2dDYS9GUWNUWFMyVm5yZEdhSzFwcDJZdVZoT2U3?=
 =?utf-8?B?WmdlZURySFlQZkprMmthTjVtdlFFYnpRZ1dLaGh2WC9acjM2OVM5YnBYalk1?=
 =?utf-8?B?T3M3NmJHelFXc3VCd0Z5Mld2RXlZVzhDTWNCR1JZOVJ1OU9BZ2hJY0VTcmVM?=
 =?utf-8?B?cW8vU2xjMlpSOFZ2RjdCWEJlVUdaZ3RZVW0vUUpYYXNzeGJVcmhNT2NkLzN6?=
 =?utf-8?B?TS9ERnVoTDByNjBVMzdIUUMwcy9iZ2FMTFR5RmVqZjA1T2pQYjJIK1pGQ3lI?=
 =?utf-8?B?UnBYSHY4Vzl2ZElXdTBOcEFKUVF1M3JlSnl3Vkw4cFBNanRWMVJzeHA2akk4?=
 =?utf-8?B?ckY0c0lZeTFnd211T2x0eElnQWhSR0JScnlGVVZFYmhkenZVbGgySVR5NXdh?=
 =?utf-8?B?SWJ5Vm1BTlUyUzl1ZjczZEhnMmpUSnRjN2ZrU2xDTXpoaWNRWDNialZEV3VE?=
 =?utf-8?B?NG9NOWVXZUg4V2xJZ0NrbVRoSEhkY0RLMkFlcDEyMWtQTEZJL0lEK3BSYlo0?=
 =?utf-8?B?em1LTVpqZUxuNlU2eXpZeXZFSnNaaGNiaFRCUDVEK251YUd0K29kWVRralBa?=
 =?utf-8?B?b2ZCTlNZb0IwaHpLMFRFbWdURzFNbDh2Z1lJdnpyMTVDa2lvRmxRMUVMKy92?=
 =?utf-8?B?MnB6RmIyZVZ6WSsrcEFNNE5kR2Q4aTJhYlNhaVF4U3ZaaDRYaDg0YVJkVTJY?=
 =?utf-8?B?UnM5TlRkY3Znd3NWaWtMZ3hYcXFCSUNOM2YyT2ZVMFlaMHZQckEyWmdHYzF3?=
 =?utf-8?B?MDY5eFJVM2FnL3ozWFFrRUgrQzNxSGg5MElIa0o3STE1SVlnSHl2N3BqcWZP?=
 =?utf-8?B?UkYxOGtGR1FZbEhsT3RvYWduQ2djMzdrN2g3eExhQ21GMEY3L01oRURRVkRq?=
 =?utf-8?B?ZUVPcjRRL0FpdkNRSTNnUGlMaVVsOHVaczRzQ0FKTGR3OEFnWGtTU0dLenhW?=
 =?utf-8?B?eTBKSElXYWhBRk03d2txek5ya0w5NGFJLyt3djhvdmJ5aC9CTUFwaDRzV1pP?=
 =?utf-8?B?QTlDZFpDWGEwZnBoZnBROE5HcnFOTlZZL3lMM0EzSnViWENVN0Y4eTErN3NQ?=
 =?utf-8?B?dXhNb1N0aXpYNUdFbUhJb3NTeFE4emhaQXR1NUFXR0ZEdFhnb2JZa2d2RXhT?=
 =?utf-8?B?eFdpR2t6dVBrSmIrbFFHSlppS0JwKy9IV3F6WFpTV0ZVbi81a0xqUGdPTlZk?=
 =?utf-8?B?OWhxNHl1MDMrcjh2OFRpQ2VpejRHNUN6Mmh5RCs0RmNlSFV2SEJleklpTndG?=
 =?utf-8?B?d010eGZFQ0R1N1RvOTNvNkZ5YUhlNFN2cU1xTy9zei9FK2RuanJGNlZEaXVF?=
 =?utf-8?Q?X9OycqhDV2/iJ7Bq6+ydJln1D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d424345f-f7c2-4a46-afa2-08de323d354b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3041.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 07:26:00.6083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 799lBnFhlJZWwPEBDBd/ZsR3TrAH1D4k91Ok+ekFOXEwImoR1JzobHlB2kWhT6ZtWwydiJlfMM7OISLfzmD64A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4533
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


On 03-12-2025 00:18, Matthew Brost wrote:
> On Tue, Dec 02, 2025 at 10:42:39AM -0800, Matthew Brost wrote:
>> On Mon, Dec 01, 2025 at 11:20:15AM +0530, Arvind Yadav wrote:
>>> Modify the CPU page fault handler, `xe_bo_cpu_fault()`, to correctly
>>> handle access to buffer objects that have been purged.
>>>
>>> When a buffer object is in the `XE_MADV_PURGED` state, its backing
>>> store has been reclaimed by the kernel. If the CPU attempts to access
>>> this memory, it is an error that should be reported to the application.
>>>
>>> v2:
>>>    - Added xe_bo_is_purged(bo) instead of atomic_read.
>>>    - Avoids leaks and keeps drm_dev_exit() while returning.
>>>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>
> Ah, actually I think I made a mistake here.
>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_bo.c | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index f0b3f7a13114..7f5bcf114ed4 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -1992,6 +1992,16 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
>>>   	if (!drm_dev_enter(&xe->drm, &idx))
>>>   		return ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
>>>   
>>> +	/*
>>> +	 * BO content is gone. Signal the user process.
>>> +	 * Once purged, BO remains permanently invalid (i915 semantics).
>>> +	 * Application must destroy and recreate the BO.
>>> +	 */
>>> +	if (xe_bo_is_purged(bo)) {
> Doesn't this need to done under the BO's dma-resv lock to avoid a race?
> Consider the case where after this check, TTM evicts this BO changing
> the state purged. Now we grab the BO's dma-resv lock and try to get
> pages on purged BO. Seems like an issue.

Thanks for catching these issues!.

>
> Also with that, xe_bo_is_purged likely should have lockdep annotation
> asserting the BOs dma-resv lock is held.
I initially added xe_bo_assert_held() to xe_bo_is_purged(), but it 
causes crashes because many callers don't hold the lock.
For example, in xe_pagefault.c (this early check), no lock is held. I’ll 
recheck the call and update accordingly.

~Arvind
>
> Matt
>
>>> +		ret = VM_FAULT_SIGBUS;
>>> +		goto out;
>>> +	}
>>> +
>>>   	ret = xe_bo_cpu_fault_fastpath(vmf, xe, bo, needs_rpm);
>>>   	if (ret != VM_FAULT_RETRY)
>>>   		goto out;
>>> -- 
>>> 2.43.0
>>>
