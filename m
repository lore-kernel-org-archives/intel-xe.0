Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA38606A329
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 09:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aJJXff6J
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4840610E06A;
	Mon,  2 Nov 2026 09:48:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E0810E06A
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 09:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793612917; x=1825148917;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vdcipDXmfB7zaGCh4IrfVRKFTAexZzbAyt4yLH4DpVA=;
 b=aJJXff6JZqRkHJMMD9OW9/Ac0p+7+z0dL623yOhcNKmfYHbn0/cFvxTh
 PVN5AnUbrPv5LizizRE/srRkeZjDqbzEqgF+ho9rUxTMEJCIuYdJLmaUn
 dHDZfoH7OW6UYKAJEnX4eO2oN8woxYToAGG5blCkkQZXym8YRzDubLAlJ
 tWgZhbsksdRAM/uEmj335Q0g/nGa8XZ1FY8IqrqQcyQ2QxNZlY4JPk9Og
 KAMqnCfVEGexlZ6gMvn1M57+5xiYggKdFaBCPgDVzGcpZLboexIh5rlLK
 dSNtGMjF4NNoy2YL3qTC1z2Z7FlQznTvf7oYtnqyD5sSlE4I3bsWe6aWt w==;
X-CSE-ConnectionGUID: rxX2qOWMTomypNVCmNCbug==
X-CSE-MsgGUID: mvLKVF8hTmqExmCKNdNF4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2290008"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2290008"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 01:48:28 -0800
X-CSE-ConnectionGUID: Q5ysvrJkRreV1FfqfgmVAw==
X-CSE-MsgGUID: 2HndgCxYQcGgWqvXBnaXoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="5899794"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 01:48:28 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 01:48:28 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 01:48:28 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 01:48:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9XjIxLQeQ1rEgyOxKl10qnYMNNrkMt0Bf87OGICiq5JeJupqA21M3c669jYGXmrzg1jnRg+QQFHfkmUGK+P3ZYpgysTtnvWMTmhbXVrHQHQKGvRlnafieSWnhE5PqrKf78mdT81m+OpDpPm3YnXsFrYpV6zPAUhhpF9pHLVb+lwtzgvP33RXboTqhEfY1s/PKCST4RgpZQwbOjwSXq1T0nayHe9/kFPFW2yCcbHzrfBvYFs2may8q90FYdwyggtz3D/q8895Nq5gUGFbKhObgUM6w+qad6WkE65SvoXd4LV0rCwfbVymG7SYvapa2ghg1sOcIr3/ZAPEq/adddlUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVSLzaXuk1Ar25uNf+6/KVPFR1AamQm1hfCaGOCK8X0=;
 b=R8gPCuRtrrbR5ky1pqgLc32hZxIT+YHMPRb2xHaoTnx9ftttnqt7RoEfhQJzDwT8oCk5hrcAO2atAuB3uqqTdjuGLDxk4q2J92XPK+gkj19XZPgnIAU3W/To05pOO1i8S1xyYblIXmZhhYiclok8nU+RkDKIHXCqXLBZLgL5rNFCTblMFyteLoVjFCtf2rCrbWpeaMhq2Oo5G7j11tnt0x80yWwWu4O4k2Kccz7rIxNUjLMb7Wfhc1yibOB+KbBTXioto4wo2GANHK7G7QT9NJByS1Yi3vCTYqG6NkR1HkbmxuIkKfKYbiR7m4u9LSu7ExLwp4oEVdwS8NwWmertgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB6377.namprd11.prod.outlook.com (2603:10b6:510:1fb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 09:48:20 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 09:48:20 +0000
Message-ID: <91520b1a-4e5f-472a-bca6-b1b557883614@intel.com>
Date: Mon, 2 Nov 2026 15:18:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] drm/xe/xe_hw_error: Handle non-fatal errors routed
 via direct IRQ
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-15-riana.tauro@intel.com>
 <37efee46-93fc-4f65-ad23-33b4666351cc@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <37efee46-93fc-4f65-ad23-33b4666351cc@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0105.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: a341f007-74c5-4e30-178d-08df38c66cdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261021123027099003|261021121427099003|261022113327099003|261022105027099003|261022075727099003|261009223027099003|261026121527099003|261026140227099003|261028144727099003|4143699003|11063799006|10067099003|56012099006|260925021311599003|260925021911599003|260925022911599003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 9Ai5fsrIKLnG/SQnHWyhbRuVaOEbhH8XQfsYSBrCZhT8UPkliRuTRhfdQznVcJ+2w2xQcevtK39ayB+P3Y2PvRC+/fdUyLr40wKttLBmTKY9sVEOf0Il9pzfuRX5NmHfiTHFKEfssya52Y/KZehpP9KZpGpnbAoAIGnIIyKcppVSHc/l18bY94YMRQllOKtMB9EoK9brDkn3Rss9uh9Y+aJIpqenNZ8U2nGId5wR7nzKGGCEgjrbaVV/x1/vvKfWBGsB+cFQhkehuqu15UxQFde7r38AmsuBsszqVPaMmzkGTheEtGMJ00LXEaHY3jblQ7fvidBUz5bU0uV8TrQdiYIqiYyKnd11bE03/DNxLY0IcGOs/BXgXBElw4S36M0SreDKHuBJnJtMIlb2mIvKO4+M732ATQ8RgDnmkcX0/taHP4vTDYmNujIgArzy18OMNqa21vk16uggYoiq49lYW3q94oXSWC/XzucbP1Ovw65Oqay+Sf8xw738HHWdkf/ygtucEKEhqGzDryvS3qF9zgDytNooRHrePEG/O6Ss0y/OB/LIYbsvgXLdNyLhdaNS3TftHkL3fzscuBT52w/nlbRJ+d1N5rs0A4/Y3WOrCBzuAdBlNSmn/qXdkLl2tPFtqQoFYWQG3ItUmpPOiYZkd1WIYx7OenINkUrNUO2rCbU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261021123027099003)(261021121427099003)(261022113327099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(4143699003)(11063799006)(10067099003)(56012099006)(260925021311599003)(260925021911599003)(260925022911599003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFM2ZGdLbGhsVm5BeGhXQk9mdVVJZzNpWXA3bkJOa1JTSThwcE5ER1N5dmsr?=
 =?utf-8?B?eDBnTlhkYVZUTXBGeS9ualJVSWNUVUgyVkVEbFN5RVNNcG1seG9QL2pwOG9E?=
 =?utf-8?B?V2ppWUZnQzlKc1V0Z0p3YkdiSnJMNmpUMkZjM2d5NzNmQzFGa1lHY0JTdzNX?=
 =?utf-8?B?WDZYN251NFh1RE5jYlhwVW9YSGE0U1hwUEJLMnhuNS93NGV0N1FHa3ozMHNH?=
 =?utf-8?B?NWZhSnVCR2xpWUhiNm1OaElPR05iMDE4SitCNjlObUkzUGRsWVlna0dRd0xp?=
 =?utf-8?B?SEZ6ZU5OY2p3VzcrTGZaNlk5N2RiRUJ2UTArYlAwMmZyZHY5Tk1PZ2NPVVpl?=
 =?utf-8?B?VUlQN2dzQ21HenR4V3NkUCtXakx1ZExUUDV3YWlnMnU3dXZuZDk2dGpJaVJS?=
 =?utf-8?B?RVF6ekFwZnExNGhEL0ZoaHhUQUlneUhFdWd5NHAwZXpUazUzc3d0NTNEcG05?=
 =?utf-8?B?S1JmM1hQcjhRNndOVXVZS05kd3dOOGxyMTU0Wm90WGlXb0JvQXpwM2dKbWJs?=
 =?utf-8?B?TGtrMFhqa2RFeUNzR05XRkdDNEZNU3pHajBFb2Y0VmZkeHk1WCtmS01rOTJY?=
 =?utf-8?B?UXMwTnZCMTJ5Ym1NUVNqSFZKOXZoMjlLUGxmZFlMVEdudnNwZmNVdmJjVEU2?=
 =?utf-8?B?ZjZFT2JkNUJlamptcGpjbURDTm1XQWxnWWU0Q0NLM0F2U3pkS3lzd09kdFhU?=
 =?utf-8?B?TjU0UmRPeml0OHA3WEQ0NCtIOFlaQ2RkcTVEVTMyNUkzcVlWVldiZW5mbGVj?=
 =?utf-8?B?OVpUVm0yalJsRzhFTk1BdlJJQ3lVOWQ0Wk9CYzRuRlYyWlc1YVhCVDlKT2Vt?=
 =?utf-8?B?cW5QUmdqTUQ3bEZPMEVoaDgrVS9wZ2RvcUFHa0d4clpPVFBrZUhYVm4zR3p5?=
 =?utf-8?B?cDdvSUZqOEFldXpoVk5hVDEzTXdqV3p4U3h0SE9oRXJxMGM3dHBRK1FrTmpt?=
 =?utf-8?B?ODhTenQ1Wmw4QVZqL01teXZXTVFxc1VWMGc0VlgycS9sSTZ3M0VGLzMyLzJm?=
 =?utf-8?B?VzBMWCt1eTRXTHh3RndwUVVhaFVMVmN2aTFJUW9tQURkS04vM0J1S0JJN1Nu?=
 =?utf-8?B?Und5VzJHY0hYeU5BVi9VM0dUVVlNL3VhdEE4VEtsK1VjOGNUYVQ1RjQrcWdJ?=
 =?utf-8?B?eXpkVG1PK2lxQnJBWWZMMXhOQ2gyWFJpVEs3ZGkrdDdxWFZhZERLSmVjU3Rv?=
 =?utf-8?B?Y2FFSWJCT2IrMGlKRVpPNFl4S05FakxuTFVwektQUk9RcDFacnhMR01TeXZr?=
 =?utf-8?B?UFlsKzY2dlBydmhQV0J6L3NybEFKT0dVQlFCaGgwYk8vMndpZ0pKK3lYRFdC?=
 =?utf-8?B?ejJoVDIxVEtPMms0eG5mckZCZDYvUW8rblh3Z0d2K3NHZTEybUNGV0JKQmYx?=
 =?utf-8?B?bno0VmVaWld1QUxtS0c0bGhtRG1YdGtJMU1kaXNDWDMyenlFNkVBTHNGUFg4?=
 =?utf-8?B?VXh6dEtxZWJIR05TRW9lTDlCWXZzdUlodEZGSVNMMjFVcFpSN3g0RTFGdlRR?=
 =?utf-8?B?UERkcVVUS1MzK2ptNjBaZ2RLcmhjRXRITUFMVlZMSEMySFU1VURSdjRJMXc4?=
 =?utf-8?B?RlZPbDJnNXRFYUdDMjZ3aFMxeTZJNDFxYzJ4T1VGeGNaTnZsbm8zb3dkOWE3?=
 =?utf-8?B?WVFyaWUwWE54Q2tma3R0MTI3NnpOYmFZM2N1NDdSWU44RkYzYlJjNXBMZXls?=
 =?utf-8?B?OTgvWXpvRFZIaXB2ZU9oQzRHWFFhMWM0dnZkRUVyVVlsZXQwY0RPb0pTWHp6?=
 =?utf-8?B?ckVIQUdDRmw4NnpxWGlnVDhicnNHSGxjMitLbjc2OERqOUFZRGVNdVR0QlBo?=
 =?utf-8?B?Q0Z0YmVpSGtSQjEwZGxBVGJNaUl3b1V0QmtzYVRYU1d3Q1RCOTlhczlobWdX?=
 =?utf-8?B?TXJtTEtNWXZEUkdzaTBEREsvRHZ5NG0xVzNqUGE3MHBUTk9xN3d2Ym9kb1hr?=
 =?utf-8?B?MjZRdTZzcEprUW53Z1owUW56bmdrYUlqMk9XMmo2TzJzcno4Ym9xMkpzN0hC?=
 =?utf-8?B?OWpncEVGUHVKUi9xNjdnL2RHTlBFRWY3a0p6MGRQRE1OVkRLZm5CUXRCTHRq?=
 =?utf-8?B?a2VWR0dMckZrS21HUmxMcGQ5ZDBKRUVHdHk2bTVkdWpKS2NnQUppZW1IRGFZ?=
 =?utf-8?B?YXNHQXRpMXAvRnhDYmE5Z3lqc2VYeHY3M1dVcjA0RmM0WVVTNHR3Y2dtMUtG?=
 =?utf-8?B?M2dGbXdjYXkyMHVFaXM1d0tPcUpqbGZsQXVrWUlZSWJBdStyNUFyMzJQZVZP?=
 =?utf-8?B?ZmVsV3ZSR1BVTFBCY0xqNmxxRFV1SHh3MjRmQ0lJNENUOGx1ek5MWWlmTEZv?=
 =?utf-8?B?akl3SEI0SEgxZ0cyN3NHQVVJWjNMK0VuZjRYNkZKSkdMNjYzVURtZz09?=
X-Exchange-RoutingPolicyChecked: Sp0YxRBC7wjyQiPlq6Z+NAlW6qHrwTztC1oYxSMYTUdMoYrEOk+AkdEaCJMigjr5YUzfwfvqtr7PPrwGvfotQ0b/ecvBPttCzYbWcYsoWEV5XtmrTUqzQydKf3uiKqEKIXETztc7ONT/3y1ZDOcng105X73NKUD+PVF2ySUxBHId8h0P4mYMXmSUU1MoQv5CIYREp3STopr/A1iTbNRL6xOJQwuSZ1osHW3Il7EzNmzk4ZciMgzNihbb2KE6WUyjm0mbHeBD4JBIEWJ+Cgq+phXsxgeDBM4uBZf6oLssPSE9cAAGiqD9qPy59adqzicgW0hwJknBYdzy1/b4ZjXZzA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a341f007-74c5-4e30-178d-08df38c66cdf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 09:48:20.1203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0putFE+9MnMahVAChDh49DPNScibN3KPrPDLBvyU6JAm5dNNvXSetKPE3mD/RS3UUCT2MvRA5vZbjyN0Av77cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6377
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 30-10-2026 19:43, Mallesh, Koujalagi wrote:
>
> On 26-10-2026 11:35 am, Riana Tauro wrote:
>> Process, log and recover non-fatal errors routed via direct IRQ.
>> Double-bit ecc errors belong to non-fatal error category and are 
>> reported
>> via irq. For pages that belong to critical BO, wedge the device with
>> bus-reset as the recovery action.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hw_error.c | 37 ++++++++++++++++++++++++++++----
>>   drivers/gpu/drm/xe/xe_ras.c      |  9 +++++++-
>>   2 files changed, 41 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c 
>> b/drivers/gpu/drm/xe/xe_hw_error.c
>> index f7799c3c08aa..269ce6a19a80 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -5,6 +5,8 @@
>>     #include <linux/bitmap.h>
>>   +#include <generated/xe_device_wa_oob.h>
>> +
>>   #include "regs/xe_gsc_regs.h"
>>   #include "regs/xe_hw_error_regs.h"
>>   #include "regs/xe_irq_regs.h"
>> @@ -15,7 +17,9 @@
>>   #include "xe_hw_error.h"
>>   #include "xe_mmio.h"
>>   #include "xe_pm.h"
>> +#include "xe_ras.h"
>>   #include "xe_survivability_mode.h"
>> +#include "xe_wa.h"
>>     #define GT_HW_ERROR_MAX_ERR_BITS        16
>>   #define HEC_UNCORR_FW_ERR_BITS            4
>> @@ -166,12 +170,36 @@ 
>> static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == 
>> XE_RAS_REG_SIZE);
>>                            pvc_master_local_fatal_err_reg : \
>>                            pvc_master_local_nonfatal_err_reg)
>>   +static const char *hw_err_to_str(const enum hardware_error hw_err)
>> +{
>> +    switch (hw_err) {
>> +    case HARDWARE_ERROR_CORRECTABLE:
>> +        return "Correctable";
>> +    case HARDWARE_ERROR_NONFATAL:
>> +        return "Non-Fatal";
>> +    case HARDWARE_ERROR_FATAL:
>> +        return "Fatal";
>> +    default:
>> +        return "Unknown";
>> +    }
>> +}
>> +
>>   static void hw_error_work(struct work_struct *work)
>>   {
>>       struct xe_tile *tile = container_of(work, typeof(*tile), 
>> hw_error_work.work);
>>       struct xe_device *xe = tile_to_xe(tile);
>>         guard(xe_pm_runtime)(xe);
>> +
>> +    if (xe->info.has_sysctrl && XE_DEVICE_WA(xe, 14028434957)) {
>> +        /* If the device is in reset in AER path, skip processing 
>> hardware errors */
>> +        if (xe_device_is_in_reset(xe))
>> +            return;
>> +
>> +        xe_ras_process_errors(xe);
>> +        return;
>> +    }
>> +
>>       xe_survivability_mode_runtime_enable(xe);
>>   }
>>   @@ -433,12 +461,13 @@ static void hw_error_source_handler(struct 
>> xe_tile *tile, const enum hardware_er
>>           return;
>>         /*
>> -     * Hardware errors are reported through System Controller on the 
>> platforms that
>> -     * support it, and never routed as direct IRQ to SGUnit. So we 
>> should never be
>> -     * here for those platforms.
>> +     * Non fatal errors are routed as a direct IRQ on platforms that 
>> support
>> +     * system controller.
>>        */
>>       if (xe->info.has_sysctrl) {
>> -        drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error 
>> routing\n");
>> +        drm_err_ratelimited(&xe->drm, HW_ERR "%s %s reported\n", 
>> hw_err_to_str(hw_err),
>> +                    severity_str);
>> +        schedule_delayed_work(&tile->hw_error_work, 
>> msecs_to_jiffies(MSEC_PER_SEC));
>
> A:  Fatal error via AER
>
> B: Non Fatal error via IRQ/MSI
>
>
> Did u check behavior or impact with below combination? 

Since this is a race it cannot be manually tested unless a race actually 
occurs.

>
> 1.  A occurred then B occurred
>
>

AER will flush and disable pending hw error work.

>
> 2. B occurred then A occurred
>

Same as a hw_error_work running post which an AER is triggered


>
> 3. A occurred B then A occurred: 1 sec before and after.
>

Same as 1.

>
> 4. B occurred A then B occurred:  1 sec before and after.
>

Same as 2.

>
> 5.  AAB: 1 sec before and after
>

Same as 1. Two AERs won't have any additional handling.

>
> 6. BBA: 1 sec before and after combination etc.


Same as  1.

>
> Handling two asynchronous event bit tricky :). Hope it should not 
> break it.

It is indeed tricky. This is the best effort where we cancel the worker 
processing non-fatal errors as reset is imminent.
Also the firmware query is protected with a lock so race there shouldn't 
cause a issue.

Thanks
Riana

>
>
> Thanks,
>
> -/Mallesh
>
>>           return;
>>       }
>>   diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index db3cbc186a51..e6a0ee468b17 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -628,8 +628,15 @@ static u8 handle_device_memory_errors(struct 
>> xe_device *xe, struct xe_ras_error_
>>           break;
>>       case XE_RAS_MEMORY_DB_ECC:
>>           ret = handle_page_offline(xe, info->sw_address, true);
>> -        if (ret)
>> +        /*
>> +         * Double-bit ECC errors are non-fatal errors and are 
>> reported via IRQ.
>> +         * Wedge the device with a bus reset for errors that require 
>> SBR to recover.
>> +         * TODO: Trigger SBR using pci_reset_bus
>> +         */
>> +        if (ret) {
>> +            xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET);
>>               return XE_RAS_RECOVERY_ACTION_RESET;
>> +        }
>>           break;
>>       default:
>>           return XE_RAS_RECOVERY_ACTION_RESET;
