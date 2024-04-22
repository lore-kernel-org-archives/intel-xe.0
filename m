Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7593CC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 17:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3465F10EA49;
	Mon, 22 Apr 2024 17:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pq+EAazx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D47F112C8B
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 17:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713806295; x=1745342295;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Sc7MM7pxyq5mH8SZvlPSlPvjx3EtDH4UZGgfxW63kK8=;
 b=Pq+EAazxqkF8NEKd2iy7PPczipK0afaLZrzW7ecUwh6VKjkQcGAZbCFg
 NGLH60l/en+BF2v4Bnx/dyqT2CruyL90Zc+e7uxFleVAZt4FSd29O/0NO
 D+bZ54EKeKqzhB9ERNLRkPPbpfkSUm+04npuO8DNmxtUac1Dl7Nj92nsK
 gSucHGmS1QIxHTkXPMYr271R/snGiFlYeyQfAh2orVbhYtkpe/DhIdVkB
 hNUBbEtKdLYt4EFHdCLd5jgdXgfpfuFxrA1KuMfsZpBWdYjcbelQQFD1O
 cHw5vK60m7LKePnpVKDc/OkLmvAAMCRF5YdZHdRMIHCSr2+oi1J9CztpG A==;
X-CSE-ConnectionGUID: 3o5bN2/lRPObmBuwKVzlAA==
X-CSE-MsgGUID: xqt7/oVKSIe/b+FQkCOvlw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="13192109"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="13192109"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 10:18:14 -0700
X-CSE-ConnectionGUID: yromFvSESPGkPt7+Ob3BBQ==
X-CSE-MsgGUID: hjri7y+GRRSk+PTGTR+eDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="23956536"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 10:18:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 10:18:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 10:18:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 10:18:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 10:18:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgvDyV8j+fBJ7Hh1tF1PKLmaK+7b+1/ys+wza3Z03J0CoXlY539AEiISswqg6HFIyJQFjLL6bhHbGyZNl1Eysu3tT07gyzpnC5CjNt3WBdWOvThgDYjy6fRCLQNJQH10i+KxAbl/n0XZudWJ1Yikz4CLFXGfoeiGYWSwlPtf09XXgsUNWFi915Ptb2609jZziwPNf7ywExELL47qL8kqPRnUrG65zERd3dXbL0fp0WlDW9HoqkGWukwH9vPVedxP7p4/o9ScqDeaJ4aCNC+wXGrYammz1gvc+E+/qLsqe/VD1+XcPCV9InwGfNQdUW6N0YxDnByiFg0W1fdZoQEwLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rizcjzlkZnFwWI+VUiXLPbRelPn3uIzkLD3lKEjShjw=;
 b=MEkdqMZiljfiWsCSlki+YdU2asILD4NgwJvn3kA+2LOBS0+YlWga3wsyLM+UuaU6WT8o6G3z2D9DkQh0jPMsh3y3c53UioGJC0apzOilQARmhKVTS47xfZDdYQj6p1Sib8qOART/YJVefpCDcu8V1P+i6PSAbEd8ocjZCD9nU66oSQxp9TE88gomsZxUi+XdXjPpOPotcASQpkb0e6kzuw3dTp7npQ2tJ0sIUBX4yw/pTRT2e3kZgVmYwMd20ZT5tLgoUkhstqZimP6Aeid5kaDzU0McIghy3JSA8mJNv4ksce2tTAaWvUY+MWkVgKe2B1FA4OXr10nlDo9Bs8k0Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW3PR11MB4521.namprd11.prod.outlook.com (2603:10b6:303:55::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Mon, 22 Apr
 2024 17:18:08 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7519.020; Mon, 22 Apr 2024
 17:18:07 +0000
Date: Mon, 22 Apr 2024 10:17:57 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 0/7] drm/xe: Per client usage
Message-ID: <ZiabxU10TpNGzUgU@orsosgc001>
References: <foccqtfvgz65tg6yoar5tsqjo4bndmftgwlsm3vujjjdin2wts@7cc3m4fcapyb>
 <6490842a-65b3-4b84-9a8a-ebc9f7b9ac07@ursulin.net>
 <thplv5pk26br3tou6if2otdoq6owb5lmdhfzi3wcboni4vyeos@sqiu7zpgmgrf>
 <8e2af1d5-5d22-47d5-8cee-f8bd1e54c0ed@ursulin.net>
 <fzl42hvf67tb7373gcpovcjjcufs3ba6jajmpt676uymsat4qs@qolxcmhfh6mz>
 <ZiAyUcuQtQ25xnWw@orsosgc001>
 <6ib4borj4paiuj5l6digeoc7mgnabtji6vtvdtvcafi64y3j3n@vqid357khkai>
 <c47f5e70-e09f-41e1-bc0a-b547475e17a1@ursulin.net>
 <ZiMDh2ddSsx+t+Qv@orsosgc001>
 <a8234a4b-df87-498f-b414-5f6a34fc9223@ursulin.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8234a4b-df87-498f-b414-5f6a34fc9223@ursulin.net>
X-ClientProxiedBy: SJ0PR03CA0157.namprd03.prod.outlook.com
 (2603:10b6:a03:338::12) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW3PR11MB4521:EE_
X-MS-Office365-Filtering-Correlation-Id: be43510e-4c39-4244-c8ab-08dc62f02d81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGR4MklCcGxHdnZCcndlZ1p2YVoveTN5VHVQK0ViTVd4aUlYOTMvWE1kdmdI?=
 =?utf-8?B?aWdtclNqUXVyNm8zYVZxR0R1OWs3ZGx2UW1NcWhlelY1bHVwczZFUVhCYVZa?=
 =?utf-8?B?VHJhYmJZRHF0QTZaN3dXSVREbmcrb1JkVEk0Sm5Rc25yTUkrQkNsc3p3a0xC?=
 =?utf-8?B?b2hhQ0p5bGY4ZTV2ZXVJU2dySDVJV3JwMnZFTjRBSWpEWTRFd2FuTW03L0Yw?=
 =?utf-8?B?RlkzU0hId09sL1JoeEVhb1g2TXQ3cmRqUzM3ci9OUUY2QzY4emZXQzJIb0JV?=
 =?utf-8?B?RWc4cUVTaXlvV1FTcnBtNkRqOXRwR21mSVg5d0VsYnVZOUVnL2FrZTg2TTlW?=
 =?utf-8?B?SVMySXpsanJGK0hPQnZUN212NDZTNTVSWkY5eW1LTnhwR0lwWndEdWttM2ww?=
 =?utf-8?B?UHc4bm1SZlNkZkFBSVJHeFJrSlMwaDd1QnlUczNaZlJGYnNJV0ZpV3VFeDQr?=
 =?utf-8?B?NzM0dm5iYVpHS3k2THp0bDlUVjZMOEFnYzNrTG8rUUF6SEQ1ajZxcmZRN0Vn?=
 =?utf-8?B?MDY1UkMvUjFCSUtjM3NvSDFXUGZpb1Q1SWZSc2VvQjdYdWhla0dkQ014MDdO?=
 =?utf-8?B?QkZLK3FsNGFWdW5TbFpXdW11ZithU2xKZ1FFSGQvN085OVp0NDNtSXovRmxY?=
 =?utf-8?B?dngxZnltKzUrMEV0VzdkL1J6TU1nWU9FRWVOa0gzaHFkR0p5RTRCQnFCNTJP?=
 =?utf-8?B?WGU3OGROQ3cxMVBSNk1uem4xMTErZFY1VUltNTNXaEsramQ5RHlpbEsrU3hY?=
 =?utf-8?B?L0dDVEk1ZXdYaGs1bTgzUWZFdjBTalF1SHpZUXRjNW9tb09GVTRvYmtjUFJw?=
 =?utf-8?B?cTdjMkRKOWhuanNGbWZmcGFNYnc4TW1WaXNYeHlHNWVjVFV5NFE5dVdJSW1s?=
 =?utf-8?B?Y2RrT0Z6M3B3M1d4TkJ1b1FDQ0JUaUZQZFNvZlNCMnNkYXV5TmpqUW5DdWZs?=
 =?utf-8?B?QnBQNTRGRHBjbW56NWRVS2dBbVlwNFFkZEVTVmZ3YTlNQkF5M2Y4cDQycUEx?=
 =?utf-8?B?K2VXcjVxVDcybEl0a2R4T0VsbzJEMGs1N3h0Rys4WDBGTXU2ejI2ZnQvYmRT?=
 =?utf-8?B?V2s5N2NqbEpzd2d3c0N2RHpHV1M3a256R1hNRE1GdkhqTndoTnBEUDQ1MVJX?=
 =?utf-8?B?VzV4dFhSRWF1TUppTDU0VzAzb0FlS3Y4WnVuTDlQdnRocW5ka1BFL1dMOUw2?=
 =?utf-8?B?TkFVWWgwUXJQS1Z3aHVvbHBZOFVFVUlvSHJJN2VaYzJlOENZcU43a2pERVd0?=
 =?utf-8?B?eElnU1ArSk8zQWVBbFBmUHRtaS9WbVVpdElPRVY1U0NjUnBxeTlNWnE2V2Y1?=
 =?utf-8?B?b2ZLS3gycjVnS25leDJhdHVpMTBZZDJ3OUVCV3lINnBPQ2RPcnRGbGFMMXl0?=
 =?utf-8?B?NXM5c3l3bzBxanIrMCt5Yng1YkZjTFZJTU8za3pMUmpIL21NWDkvWFduMmdO?=
 =?utf-8?B?R3RFTzJkaVZtcTNiZ2tTVkdWdGlFZjFWMUF2T21VdzhrYWl3dXZBdWF0Qm4x?=
 =?utf-8?B?U2tBeVllWUFnaDQzYXNIQXF6NTNXaHFRbWw2WHkxc0t0WHlSMGhpREg5WTBv?=
 =?utf-8?B?cmgwczAxbTQrTDJURGl0bFZTUlFCenluU2NOMEpwNE4yYlk0TmlDcWtvZ3VU?=
 =?utf-8?B?NW4rOTNQaHBjYjJmZzU1dDBNTHdaTUpwc2RQVm9vWnllekp0ZVFSL0pJRzZ2?=
 =?utf-8?B?bmNvUW1zMG1sUk1semtzbVFIbEJrZ21STkVDV0d1ek9HRnQwWXBYVDBRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkhvODVVdHZ0V1pzK0tJOW9vUWczV01raUs3SklISkZieE1IbkF1b05jMGNu?=
 =?utf-8?B?T0l3V2MxL1AzSzM3blV5d3hDYWJxNkx4cnBXL0lEMlM0UitkUUs3emRJOThZ?=
 =?utf-8?B?ajI4eUdyMlljZmMxb0ZaVHdidDdaTUJtaVR1a2pCWWIxTWRMN2F6U0ZmVlZz?=
 =?utf-8?B?WThTVHpHdnAwejl0ZDUxUmQ3djZpNFNkWXhiKzZqSDR4bUt6QTNhK2llV21o?=
 =?utf-8?B?c3VyTURpZWgrTXowVjlTa1JhVWNoUVJleFRGVDZhd1pad1Jyd2tDUlFzNmxV?=
 =?utf-8?B?b01KczRZZ2JNYkJDWVk5RytUMEZuaS9EVERZVVN2aW91RkcyYmErS0NQU2do?=
 =?utf-8?B?LzVOOUdmMFlpclpneVU3a1hUamI2WGpmd1NxNVBNdlhxczZNVmJmTDZVNGdp?=
 =?utf-8?B?RnVFb090dEYzRnNWUjZMR1MxK1pIUHBPLzdLOGxvTG1ROXVoWFYxSlFtMjBl?=
 =?utf-8?B?K0xsR1hydnN4OG1UY01mUENGSk5GdDh4ck5OVUY0a0wyVDAzamo4ZkRjS09U?=
 =?utf-8?B?QU5XSStIaU5lVjZUbWVWSUhNeTZQeVVqTkhManJnZTRxT0ppM0Z4SHlpN1dx?=
 =?utf-8?B?MDNZckNaNDdVUzdiK2o1dEo5WnlaeFVVMElESzZZczZBSVZIRXhsNlUvWGs0?=
 =?utf-8?B?eWxnZVdMb1N2ZGpZNFg0QlRTNjQwWFFBbGdTZnNycGkvTXZCQVpIWlR1Zk5L?=
 =?utf-8?B?QWhYeXpwUWRJTjRxTWEwbmdOdlVnTW9EZGVFYktUUUg0djFJaGJ1NmExTlpj?=
 =?utf-8?B?emRReHFCaGZhOEJQWEg2QWtnc2hGMjh2TmV2YUdSQmF0eFZKaHhoNWRaL3Ra?=
 =?utf-8?B?eng1bUpqQUN0VmIzSGFGaERTNGxOVDA1elNWazRnQlZ3RHdKZThvUVc2RVE2?=
 =?utf-8?B?S0o1MGdqN1B3dk1sQlBtQmsrRTE4NC9ldCtJM3Q1SzVkV1E4U245Q3lqWWtz?=
 =?utf-8?B?NVZJU1hDQVFKc05XVXdTRGQwR1hYRkJKL3o0QjRLSklVeGhMSU9HZWpRbHls?=
 =?utf-8?B?ZStqR3pwNnF6bERqdlI5cjc0S0l1QUl4R3dHeDJQWWRXUVMrdjJvdnl4ZjYw?=
 =?utf-8?B?dUJNZWZDQjZuOWtzaU5OQ0xOWHNxdGpPMldOMUdKVmZleEprTXdlZGNBQ0VG?=
 =?utf-8?B?d2MyVUViRWZWWHJBc2RjbXpjSUc0NHYyRmJ2Z1h3ck5EdW9VcFRYcFlBcXFD?=
 =?utf-8?B?TkkzNjNSYzBqMjlSZXNOSjl0OHM3aUNmNzFwbjlHWWhtM3c5QjB0MUJ3VXpJ?=
 =?utf-8?B?WGlVajhBVVVDOHB1Y2FsYS9rM0llU2RIZk52UDJpaTVMT1ZrRXJxaW8wTk1y?=
 =?utf-8?B?dUdScXdlaXRFY0VlVVV3Y0M3NzU0UlgxSXU5Nm40Mm9NT0ZHd1EwTmlRS3hP?=
 =?utf-8?B?WHo1dFFjNmJCMUoxK3UrUE5nSDRka0l4V3ljcHcxTzVpU2lSNnlQWEtmb1E5?=
 =?utf-8?B?TW00ZTlqSlFYZnR3NFBtRWZRbzJwQXhseUxhSDBobS9MRGM0b1NvYXZVS2dC?=
 =?utf-8?B?Z2hhNTFkZ2ZsdVg4cVJyR2ViRTJBdVV2TjFmWmgxdW1naXBsdER0bE9jbE1F?=
 =?utf-8?B?QzlqOWNROFVSN04wR252NWViZkhNcHZ2TmZ0ckxYSzJzaUR6c0crbFhObXp4?=
 =?utf-8?B?dTZDdXpLNlNVUWt4MEgyU05oNVFGNC9iZmFFM1k4U1FtMGswNzJTMlpWM2FW?=
 =?utf-8?B?bFQzODd4ZzhhbTdpNm1DSkVORERxTnFwbkdSWElWSkJNaEpLcGRpS2ZjRWJi?=
 =?utf-8?B?bnZJYzY5QzVCU3NMYXNqR0JwSVNRaXRyS3d0aEdkMkxocmgrc2lDK0NYQ0gz?=
 =?utf-8?B?YzdvdU1QeGhNWVY4Qmw4cWtIbTdOblBPVkdjMGpscGpvaWw2TjM4ODhrUW85?=
 =?utf-8?B?OFNPOVdjQmh4WCtNM3RHR1E0eTVremc0QmdmczNOTHNpOE9WMTB3anRzaFg5?=
 =?utf-8?B?OXNaRDNTQTd6WTBXUGFKODdBblZTbkt6NnF5VkJKcjVaZElkaENFMEFVSEY4?=
 =?utf-8?B?WGduSllHTWYzME5BTVNDcmMvdFJyUktnai9ycTc4d0J5OVIwNDUvYUw4Q0pZ?=
 =?utf-8?B?Tk9sQ2lSQ2JzRHpSWS9TRFAwSTAydHJad0t2eFg4U0xkZXlkRWF3QTNYMnhn?=
 =?utf-8?B?N1hnaU5pWno1MTc1S3gxcllJLytpWUZIclNHM3o1eU0vNVB2eVFxb0FvYU1P?=
 =?utf-8?Q?PN2vKNTJ/Fg0/EUi5x2Agv4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be43510e-4c39-4244-c8ab-08dc62f02d81
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 17:18:07.7133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0KnSzmJ/+BCMJ+ups2qU+C4BZ8UV86Yco8q+GLPMvNsgt4Cn4m88+vzt9EGyPqfS92E4mO/06Cw1hAjQIVQ05Ln2wQNQ5rwg40Ee7/QBx4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4521
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

On Mon, Apr 22, 2024 at 11:40:33AM +0100, Tvrtko Ursulin wrote:
>
>On 20/04/2024 00:51, Umesh Nerlige Ramappa wrote:
>>On Fri, Apr 19, 2024 at 11:44:46AM +0100, Tvrtko Ursulin wrote:
>>>
>>>On 18/04/2024 00:19, Lucas De Marchi wrote:
>>>>On Wed, Apr 17, 2024 at 01:35:29PM GMT, Umesh Nerlige Ramappa wrote:
>>>>>On Wed, Apr 17, 2024 at 02:05:40PM -0500, Lucas De Marchi wrote:
>>>>>>On Wed, Apr 17, 2024 at 09:51:42AM GMT, Tvrtko Ursulin wrote:
>>>>>>>
>>>>>>>On 16/04/2024 19:29, Lucas De Marchi wrote:
>>>>>>>>On Tue, Apr 16, 2024 at 03:22:21PM +0100, Tvrtko Ursulin wrote:
>>>>>>>>>
>>>>>>>>>On 16/04/2024 14:51, Lucas De Marchi wrote:
>>>>>>>>>>Forgot to Cc Michal, doing now.
>>>>>>>>>>
>>>>>>>>>>Lucas De Marchi
>>>>>>>>>>
>>>>>>>>>>On Tue, Apr 16, 2024 at 08:30:33AM -0500, Lucas De Marchi wrote:
>>>>>>>>>>>On Tue, Apr 16, 2024 at 09:37:44AM +0100, Tvrtko Ursulin wrote:
>>>>>>>>>>>>
>>>>>>>>>>>>On 16/04/2024 04:04, Lucas De Marchi wrote:
>>>>>>>>>>>>>Add per-client usage statistics to xe. This 
>>>>>>>>>>>>>ports xe to use the common
>>>>>>>>>>>>>method in drm to export the usage to userspace 
>>>>>>>>>>>>>per client (where 1
>>>>>>>>>>>>>client == 1 drm fd open).
>>>>>>>>>>>>>
>>>>>>>>>>>>>However insted of using the current format, 
>>>>>>>>>>>>>this creates a new one with
>>>>>>>>>>>>>the unit "ticks". The intention here is not to 
>>>>>>>>>>>>>mix the GPU clock domain
>>>>>>>>>>>>>with the CPU clock. It allows to cover a few 
>>>>>>>>>>>>>more use cases without
>>>>>>>>>>>>>extra complications.
>>>>>>>>>>>>>
>>>>>>>>>>>>>Last patch was a quick implemenation of a 
>>>>>>>>>>>>>gputop-like tool in python.
>>>>>>>>>>>>>I ended doing it to cross check the gputop 
>>>>>>>>>>>>>implementation. I's not
>>>>>>>>>>>>>really meant to be applied here.
>>>>>>>>>>>>>
>>>>>>>>>>>>>I tested this on DG2 and TGL with kmscube 
>>>>>>>>>>>>>(console-only) and vkcube
>>>>>>>>>>>>>(in a gnome session), but it would be good to 
>>>>>>>>>>>>>soak this under more
>>>>>>>>>>>>>tests. The biggest goal for this patch series 
>>>>>>>>>>>>>right now is to get
>>>>>>>>>>>>>consensus on the new UAPI.
>>>>>>>>>>>>>
>>>>>>>>>>>>>TODO: Add documentation on top with the new interface.
>>>>>>>>>>>>
>>>>>>>>>>>>Yeah a drm-usage-stats.rst patch would be nice 
>>>>>>>>>>>>to have in the RFC so one does not have to look 
>>>>>>>>>>>>into the driver implementation to discuss the 
>>>>>>>>>>>>proposed uapi.
>>>>>>>>>>>>
>>>>>>>>>>>>Nevertheless I understand the proposal is to add this:
>>>>>>>>>>>>
>>>>>>>>>>>>drm-engine-<class>: <GPU_TIMESTAMP> <RUNTIME> ticks
>>>>>>>>>>>
>>>>>>>>>>>yes, the gputop patch was more explicit about 
>>>>>>>>>>>this. Should had added in
>>>>>>>>>>>the kernel patch series too.
>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>That's two values per key. I guess "one key 
>>>>>>>>>>>>value pair for per one line of text" does not 
>>>>>>>>>>>>get strictly broken and that you propose a 
>>>>>>>>>>>>heuristics in parsing to detect that the 
>>>>>>>>>>>><RUNTIME> cannot be mis-interpreted as the unit?
>>>>>>>>>>>
>>>>>>>>>>>the current format is
>>>>>>>>>>>
>>>>>>>>>>>    drm-engine-<class>: <RUNTIME> ns
>>>>>>>>>>>
>>>>>>>>>>>the "ns" in the end should be parsed by userspace to know
>>>>>>>>>>>what it is about.
>>>>>>>>>
>>>>>>>>>Right.
>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>Not sure it is a good idea though. If you 
>>>>>>>>>>>>instead added a new key for the gpu time what 
>>>>>>>>>>>>would be the downside in your view? Like:
>>>>>>>>>>>>
>>>>>>>>>>>>drm-engine-<class>: <uint> ticks
>>>>>>>>>>>>drm-ticks-<class>: <uint>
>>>>>>>>>>>>
>>>>>>>>>>>>Or maybe even obsfuscate/generalise as:
>>>>>>>>>>>>
>>>>>>>>>>>>drm-engine-<class>: <uint> gpu-time
>>>>>>>>>>>>drm-gpu-time-<class>: <uint>
>>>>>>>>>>>
>>>>>>>>>>>I think both work, but I fail to see the 
>>>>>>>>>>>advantage. This alternative is
>>>>>>>>>>>slightly heavier on the parsing side since you 
>>>>>>>>>>>have to correlate the
>>>>>>>>>>>values from 2 keys, possibly dealing with them 
>>>>>>>>>>>appearing in different
>>>>>>>>>>>order. The only possible breakage remains with 
>>>>>>>>>>>this alternative: if
>>>>>>>>>>>userspace didn't parse the unit before. I checked 
>>>>>>>>>>>nvtop and htop and
>>>>>>>>>>>they were doing the right thing. I sent a fix to 
>>>>>>>>>>>igt a few weeks back
>>>>>>>>>>>for it to consider the unit:
>>>>>>>>>>>https://lore.kernel.org/igt-dev/20240405060056.59379-8-lucas.demarchi@intel.com/
>>>>>>>>>
>>>>>>>>>Advantages are that "drm-engine-something: 1234 5678 
>>>>>>>>>ticks" isn't self-explanatory (intuitively humanly 
>>>>>>>>>readable) and that it doesn't
>>>>>>>>
>>>>>>>>maybe I have a different expectation from procfs. When I do e.g.
>>>>>>>>
>>>>>>>># cat /proc/self/stat
>>>>>>>>3861283 (cat) R 3861233 3861283 3861231 34816 3861283 
>>>>>>>>4194304 90 0 0 0 0 0 0 0 20 0 1 0 1321348797 8560640 384 
>>>>>>>>18446744073709551615 93979016876032 93979016892449 
>>>>>>>>140720658378704 0 0 0 0 0 0 0 0 0 17 51 0 0 0 0 0 
>>>>>>>>93979016907440 93979016908904 93979037196288 
>>>>>>>>140720658380605 140720658380625 140720658380625 
>>>>>>>>140720658382827 0
>>>>>>>>
>>>>>>>>it doesn't seem to me "intuitively humanly readable" was the first
>>>>>>>>concern for people adding files in procfs :)... I'd 
>>>>>>>>rather think "machine
>>>>>>>>readable" was more important.
>>>>>>>
>>>>>>>I think you are pushing the argument a bit now :) since 
>>>>>>>IMO we should evaluate drm-usage-stats.rst proposal more 
>>>>>>>in the context of drm-usage-stats and other fdinfo files, 
>>>>>>>rather than the whole of procfs. In other words if there 
>>>>>>>isn't a strong reason to regress this particular file lets 
>>>>>>>not do it.
>>>>>>
>>>>>>:) I like pushing arguments if it helps revisit decisions (human vs
>>>>>>machine readable for things in procfs). I'm not
>>>>>>trying to push the 2 counter approaches though. I think other reasons
>>>>>>like discussed below are enough to consider the other keys.
>>>>>>
>>>>>>TBH I was reluctant at first to add a separate uapi rather 
>>>>>>than re-using
>>>>>>drm-engine- without realizing there was already a second one (not
>>>>>>implemented in gputop).
>>>>>>
>>>>>>So AFAICS i915 and amdgpu use drm-engine-. msm and panfrost use
>>>>>>drm-cycles + drm-maxfreq.  And none of them seem suitable to xe.
>>>>>>
>>>>>>>
>>>>>>>>>diverge from the one value per key plus unit format. 
>>>>>>>>>Latter we would then document clearly.
>>>>>>>>>
>>>>>>>>>Different keys potentially appearing in different 
>>>>>>>>>order does not matter since userspace already has to 
>>>>>>>>>handle that.
>>>>>>>>>
>>>>>>>>>>>>Potentially could also add a key saying how much 
>>>>>>>>>>>>wall time is one unit of GPU time.
>>>>>>>>>>>
>>>>>>>>>>>I wouldn't add it really as it may not make sense 
>>>>>>>>>>>depending on the
>>>>>>>>>>>vendor and or usage. Examples: the gpu time may be different for
>>>>>>>>>>>different engines depending on where they are 
>>>>>>>>>>>located (tile/gt). The
>>>>>>>>>>>correlation with CPU time is different when 
>>>>>>>>>>>running in VF mode, and may
>>>>>>>>>>>change in runtime depending on the number of VFs. +Michal.
>>>>>>>>>
>>>>>>>>>Yes, that's why I said "potentially", which was 
>>>>>>>>>supposed to mean if and where it makes sense and 
>>>>>>>>>perhaps adds value.
>>>>>>>>>
>>>>>>>>>>>Also, if the userspace side really wants to know (why would it?)
>>>>>>>>>>>it could be just calculate from 2 samples 
>>>>>>>>>>>(possibly repeated a few
>>>>>>>>>>>times as it updates the output).
>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>Or.. would even the existing drm-cycles, plus 
>>>>>>>>>>>>abuse of drm-maxfreq, work? Ticks == cycles, 
>>>>>>>>>>>>maxfreq == ticks per wall second.
>>>>>>>>>>>
>>>>>>>>>>>I think it'd be up to gpu vendor what clock backs 
>>>>>>>>>>>this time. For the
>>>>>>>>>>>current Intel cards, it's the refclock and it doesn't vary the
>>>>>>>>>>>frequency.
>>>>>>>>>
>>>>>>>>>Right, but that doesn't matter. What I was saying is 
>>>>>>>>>that if you exposed ticks in drm-cycles and tick 
>>>>>>>>>frequency in drm-maxfreq it would even work, no? 
>>>>>>>>>(Assuming support for those two was actually in 
>>>>>>>>>igt_drm_fdinfo/clients/gputop and could be used as 
>>>>>>>>>fallback to time based stats.)
>>>>>>>>
>>>>>>>>oh... I was looking at the output for i915 and missed that we had
>>>>>>>>drm-cycles as currently i915 doesn't use it. It seems to 
>>>>>>>>be a similar
>>>>>>>>thing. I agree the drm-maxfreq- is unfortunate and that we don't
>>>>>>>>actually have support for that in gputop.
>>>>>>>>
>>>>>>>>So, instead of the 2 numbers + different unit, I can adapt this to
>>>>>>>>rather use drm-cycles. However for maxfreq, it doesn't seem to be
>>>>>>>>what we need since it doesn't scale for VF. It brings 
>>>>>>>>back the cpu clock
>>>>>>>>domain this series is trying to avoid. The difference is that using
>>>>>>>>drm-cycles- and drm-maxfreq- you are expecting the userspace to do
>>>>>>>>(let me know if I interpreted the docs wrong):
>>>>>>>>
>>>>>>>>    s1 = sample()
>>>>>>>>    sleep(period)
>>>>>>>>    s2 = sample()
>>>>>>>>    engine_utilization = ((s2.drm_cycles * 
>>>>>>>>s2.drm_max_freq) - (s1.drm_cycles * s1.drm_max_freq)) / 
>>>>>>>>period
>>>>>>>>
>>>>>>>>... considering the drm_max_freq may change from one 
>>>>>>>>call to the other.
>>>>>>>>if we simplify it and assume it doesn't change:
>>>>>>>>
>>>>>>>>    engine_utilization = ((s2.drm_cycles - 
>>>>>>>>s1.drm_cycles) * drm_max_freq) / period
>>>>>>>>
>>>>>>>>we'd need different drm_max_freq reported on VF driver 
>>>>>>>>that would need
>>>>>>>>to know the number of VFs enabled to scaled it 
>>>>>>>>correctly. Maybe this is
>>>>>>>>abusing the "drm-maxfreq" a little bit?
>>>>>>>
>>>>>>>Yes it would be bad if the observed VF GPU clock will be 
>>>>>>>variable since maxfreq is supposed to be static.
>>>>>>>
>>>>>>>So on VFs would reported GPU clock moves by the VF "used" quanta?
>>>>>>
>>>>>>s/used/available/. That's my understanding, yes. Each VF has a quanta
>>>>>>and the gpu clock moves according to that quanta.  Note that 
>>>>>>as I said,
>>>>>>this is not the case right now (we are just reading 
>>>>>>RING_TIMESTAMP), but
>>>>>>the intention is to have the UAPI side ready so it's already prepared
>>>>>>for that.
>>>>>>
>>>>>>>Where "used" is defined as time given by the GuC, not 
>>>>>>>necessarily used
>>>>>>
>>>>>>s/used/available/ as above
>>>>>>
>>>>>>>GPU time. For instance 16ms quanta, VF GPU clock would 
>>>>>>>move by 16ms if the GuC decides not to switch out the idle 
>>>>>>>VF? Or it could move by less than 16ms if it switched it 
>>>>>>>out earlier.
>>>>>>
>>>>>>no, afaiu it's 16ms, not less. But the quanta depends on the number of
>>>>>>VFs enabled, which may change in runtime.
>>>>>>
>>>>>>I'm not 100% certain and people in Cc may correct me.
>>>>>>
>>>>>>>
>>>>>>>>What if we had
>>>>>>>>
>>>>>>>>drm-cycles-<keystr>: <uint>
>>>>>>>>drm-total-cycles-<keystr>: <uint>
>>>>>>>>
>>>>>>>>Then the utilization can be done:
>>>>>>>>
>>>>>>>>    s1 = sample()
>>>>>>>>    sleep(period)
>>>>>>>>    s2 = sample()
>>>>>>>>    engine_utilization = (s2.cycles - s1.cycles) / \
>>>>>>>>                 (s2.total_cycles - s1.total_cycles + 1);
>>>>>>>>
>>>>>>>>Capacity still to be added above, but we'd need to clarify if
>>>>>>>>drm-total-cycles-<keystr> already accounts for it.
>>>>>>>>
>>>>>>>>Here instead of the conversion to cpu clock, I'm expecting to read
>>>>>>>>"total_cycles" from HW and that being different (slower) for VF.
>>>>>>>>AFAICS this is not the case with this current polling implementation
>>>>>>>>since we are simply reading the RING_TIMESTAMP, but 
>>>>>>>>there are planned
>>>>>>>>changes to get it from GuC. Umesh/Michal Cc'ed may know better.
>>>>>>>
>>>>>>>I think this works and is clean.
>>>>>>>
>>>>>>>Although I have some doubts about the usefulness on VFs, 
>>>>>>>if the clock movements are at the mercy of the GuC 
>>>>>>>scheduler. Like what does 100% mean for a VF? Maybe it was 
>>>>>>>full quanta, or maybe it was half a quanta if GuC decided 
>>>>>>>to switch it out early, either due going idle or due some 
>>>>>>>other scheduling decision.
>>>>>>
>>>>>>in the scenario you described above the quanta could change 
>>>>>>according to
>>>>>>the scheduler and 100% wouldn't mean much. That's not my 
>>>>>>understanding.
>>>>>>100% always mean the VF used all the allocated time. I see this line
>>>>>>potentially getting blurred a little bit if the scheduler tries to
>>>>>>maximize the HW usage and distribute quanta unevenly, but I think the
>>>>>>interface already contemplates that.
>>>>>>
>>>>>>Another case is the VF not being able to reach 100% because the PF is
>>>>>>submitting high prio work. But I still think the current interface is
>>>>>>sufficient and it's the implementation by GuC/HW that could 
>>>>>>be improved
>>>>>>(e.g. adapting the gpu time reported).
>>>>>>
>>>>>>Michal / Umesh, please chime in if that is not accurate.
>>>>>>
>>>>>
>>>>>Irrespective of how much quanta a VF used, all calculations 
>>>>>will be based on the quanta that it was allocated. That way 
>>>>>the VF would know that it could have better utilized the 
>>>>>allotted time if busyness is less than 100. This does result 
>>>>>in more than 100% usage for a VF that was resource hungry and 
>>>>>scheduling policies allowed it to run more than the allotted 
>>>>>quanta, but this is a known limitation of the solution 
>>>>>provided by GuC. When looking at the overall system (say from 
>>>>>a PF), the usage should still add up to 100%.
>>>>>
>>>>>>
>>>>>>Thinking out loud: IFF the execution quanta is available for 
>>>>>>VF to query
>>>>>
>>>>>For the VF, GuC intends to provide a factor that can be used 
>>>>>to scale the wall time and deduce the VF quanta. This scaled 
>>>>>value is used as the second counter in a VF.
>>>>>>and we are ok with just scaling drm-maxfreq, then maybe we could even
>>>>>>just use the current interface instead of adding a third one. Although
>>>>>>it could be confusing to have a that freq changing.
>>>>>
>>>>>Assuming you are talking about using the drm-cycles and 
>>>>>drm-max-freq. One of the concerns when supporting VFs was that 
>>>>>we cannot actually export busyness in absolute time units to 
>>>>>the user because the GPU is shared across VFs. If we scale the 
>>>>>busyness such that it is stretched across CPU time, then it 
>>>>>helps get the right busyness % relative to CPU time, but the 
>>>>>value of busyness in time units itself is false. This was the 
>>>>>primary reason to use 2 "unitless" counters.
>>>>>
>>>>>fwiu, I think by using the drm-maxfreq, you are going to bring 
>>>>>the same concept back in the discussion - exporting busyness 
>>>>>in time units. Not sure if that's a good idea. Let me know if 
>>>>>I got that wrong.
>>>>
>>>>no, but I think it would still work if we can scale the freq 
>>>>according to
>>>>the quanta.  But that's probably abusing the interface.
>>>>
>>>>Anyway I think we are settling on
>>>>
>>>>    drm-cycles-<engineclass>
>>>>    drm-total-cycles-<engineclass>
>>>>
>>>>so I will start changing the patches and igt while checking this for
>>>>more feedback if any.
>>>Another option came to mind - expose a quanta ratio as a new key. 
>>>Given it has no security implications and is to be used only for 
>>>calculating real VFs GPU utilisation. Like:
>>>
>>>drm-engine-*: <uint> ns
>>>drm-engine-time-ratio-*: <float>
>>>
>>>Unit would be a ratio of time over quanta, for instance 1000ms / 
>>>100ms = 10. Which would mean scale down reported time by 10 when 
>>>comparing against wall time.
>>>
>>>New key would only appear on VFs. Otherwise assumed 1.
>>>
>>>Or could be avoided per engine and just have single global:
>>>
>>>drm-gpu-time-ratio: <float>
>>>
>>>Am I missing something or that could work? It would have the same 
>>>problem as above mentioned "could go over 100%" is one. I mean 
>>>this comment:
>>
>>I am hesitant to expose the quanta ratio at this level. We get that 
>>from GuC and that interface could potentially change. If that 
>>happens, I'd prefer that the uApi is unaffected.
>
>FWIW this idea was simply a time scale factor and I don't think it 
>should have a connection to any GuC implementation details. In other 
>words the observable result of time*scale/elapsed-time vs 
>ticks/total-ticks should be the same. At least with the semantics that 
>were discussed in this thread.
>

For the drm client busyness that we are discussing here, the VF specific 
interface is still wip. The quanta ratio is more of a engine busyness 
concept (see below) that I presume will be used here as well.

>>>
>>>"""
>>>Irrespective of how much quanta a VF used, all calculations will be
>>>based on the quanta that it was allocated.
>>>...
>>>This does result in more than 100% usage for a VF that
>>>was resource hungry and scheduling policies allowed it to run more
>>>than the allotted quanta,
>>>"""
>>>
>>>I read that as total-ticks would never be reported as above the 
>>>configure quanta - always equal.
>>
>>Correct
>>
>>>Maybe I misunderstood?
>>>
>>>Second topic - are there any plans to allow the PF to monitor VF 
>>>GPU utilisation? That wouldn't work via fdinfo aggregation since 
>>>VF clients will not be visibible in a PF. But it sounds like a 
>>>basic and important use case.
>>
>>wip. Engine utilization will be available per-VF from PF.
>
>How it will be exposed out of curiosity?

This would be supported only at the engine level granularity. Client 
level, like you mention, is not possible.

Like here, the % engine busyness is exposed as 2 counters - 
engine_runtime (how long the engine ran) and total_ticks (how long the 
PF/VF ran).  Internally GuC provides the engine_runtime in ticks and KMD 
derives total_ticks from quanta_ratio and elapsed_cpu_time.

That information is available to PF as an array of functions that can be 
indexed using function index.

A global busyness is also available (aggregate of all functions).

Reg: KMD<->UMD interface,

1) 2 counters are exported via the PMU interface.
2) Function index will be part of the config bitmap used with the 
perf_event_open.

I don't know yet if we will end up using kernel perf interface for this 
on XE (separate topic though).

Regards,
Umesh
>
>Regards,
>
>Tvrtko
