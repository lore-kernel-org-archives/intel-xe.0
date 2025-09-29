Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B6DCAC5B5
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 08:44:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E553E10E3CD;
	Mon, 29 Sep 2025 08:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ri+5aB1R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9951110E3CD
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 08:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759135461; x=1790671461;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YOeWqidop2grpqY8hiFzluDHKS0VPsC3gCZecvN2XVg=;
 b=Ri+5aB1RcTxrmmy6jMquTYt80kYsiUvbNotLRk7eyAIyCWUiFh+y5e+n
 lFQgzS1NbuAcbIoe8XpDpi6bc9LIY0x+1dEMkQsVnf+feKCFrd91ugpvr
 wMKPRg0AYRBAbDzMWIm2jkH+l8lGILM0MvSNHjloF2nQnWpLNC2uECtmS
 Nr9+8ziJRTmxgUmnD+1x5tQ2NT7yeYT7pCVAVXtdx9kGgbW2b2k1sdKgN
 DKzJyyS4XbJTgyxZ9zGIN/EUt7h9eXKPhmb3TKNy5EImcLjJJsOaCAYSP
 lspMduhuR8094j3lH/sHZQwltn7p2iSCgDLHmfi3UjGeF9jfiwt4dFart g==;
X-CSE-ConnectionGUID: OpuxweoLQFSnuLG3bPMthA==
X-CSE-MsgGUID: CU1OpTnMTeOv7z4H9XfiYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65190010"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65190010"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 01:44:20 -0700
X-CSE-ConnectionGUID: yu1ZnPvcScq9skET50cFug==
X-CSE-MsgGUID: NARX3XAMQyKekHojuXVqNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="178565198"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 01:44:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 01:44:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 01:44:19 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 01:44:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C78AWzP9w0Pol6u71fI5pngDNBqkE1TfqyujyjGZGO9EEzzjKFRYuc6ZVTiZfY4nZE8cLmyPq05zKl2y+OeYH5q7yBGJo3p+t8LTRxCllFpSHFBOx92U2Fm4R53kDSYZEl41clUVY/PrP6ebvUmrClinObEKc7OTPZEyOXH7pKyub6gzRbbYwFsxo8slMtOuVncw7L6pR7K8sk7DP2tJ46AUmTg2BhEzug0BbxO0d8fHGCA8Lm9yjfaIRKQw3iCBb37+Jk+gLl+JpcH508NQCGG64KGBfN2xYdFnCfuFfYoYknscwaNhUC4wV0Si0rvRWf+aIFb64VtVH0j/5HmKgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSLrWT52aXafwRnESuAAcUz8mEQnp6lhxOutVFa+6eQ=;
 b=hNp5OM7K1XsY9fuWlk+PbuYX9Rie4LYqKlBlSMYMohjCg06cHZH2PcRhZNkvBaMsjVXUImvIlJu9fPtegYcHk2cERPLT1ugupJ1M2aQl96cKEiAu36qnVazrCT50qd0hnt91E//kXvJbyZzqnwNCiNvFY7xekjHyQLJnUj1lQjWDi6QUL0y+I3GFxwlqq3Zn5503jvUMD6RSKRYszxv0hZkc18jIvlz9LDiSucFABxoVt3gFnqaSXbwMv/8zqEo/7LT5G0FEtV5tJdniEiAODrvOR4zzwFMqmegCXpabYT6CnP2OUSuchfvFibWEAUKeKZ8X0OEokqNaATKgzCkT8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS7PR11MB6221.namprd11.prod.outlook.com (2603:10b6:8:9a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 08:44:11 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 08:44:11 +0000
Message-ID: <59b3be2a-15d1-414f-91f9-cd3e0a748651@intel.com>
Date: Mon, 29 Sep 2025 10:44:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/36] drm/xe/vf: Close multi-GT GGTT shift race
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-17-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250929025542.1486303-17-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::14) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS7PR11MB6221:EE_
X-MS-Office365-Filtering-Correlation-Id: a567f4d4-db83-4ff3-1c88-08ddff345cab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFh5ZHRUaVNJbWk4TzdYUCtoem5rbUluYlVyNzd2MnBJdXovVHVvZEczQm5i?=
 =?utf-8?B?QXdzaTFzUFhrTXZCTmNUUzdUQWNCcXlkeDhQTEcrcldwM3hiOStVRGpwUENw?=
 =?utf-8?B?OFdsaE1VNzNnTEhTYnY1L2tEWDFyV25CeWlMTmRBWnlqck9KcnlxcFlzZ1Jj?=
 =?utf-8?B?OFB3b1Z3aTFOMlhnVVFBREVFOVRocnJJbElFY2orZ00zazNaUytML3c3emh1?=
 =?utf-8?B?ZVB2a1ozOVBvR21DQXN1b0llWit0RWxxZStvdVhJdFVrNVo0ZS9wQlhaWjJj?=
 =?utf-8?B?ekZlRXpsd0hMQVl2elFaRXJndlRGVThFSytEUm1Cd0R5VDdHZEl3SXFkY0dI?=
 =?utf-8?B?cTlnU1U4V1dGTk81azdlWk5CUkNlZ0x1OXYxZXQ1K2pNTGxSSWFibm5yY2Mw?=
 =?utf-8?B?MkJYejJHaUdPbDlwUjFWOWVyR2Z0dkxaYWphRnUvNHNoNHJJdXFtNmJxbURU?=
 =?utf-8?B?MDU4L1l5UFFDVnZyc1JGNXhRT2JkOWp6V0toWXZYK1ZmcW51VDEzWjVJcldJ?=
 =?utf-8?B?Z2lHWWZoNnBLQXhiWG51NmlxRDNHTFZIN0dTc2VlWDRuSjVnVXBTRmFxMG9D?=
 =?utf-8?B?ZXlZcjZMdTFSaHQzRGJhU3IxemVlN2greVgzcWZOOEpqRGJObkJ6T2tyUlJC?=
 =?utf-8?B?aHljUUZ2WkEvTExRT2JUS3ZFNmo4dTJaY3lrVzlJZ05CeXR6d2traXJDek13?=
 =?utf-8?B?TXh6NER3bnF0WUU2b2hicnQwT0ZCWTVPYlhEK0c2c2lpM2xEK205VC9BYmMx?=
 =?utf-8?B?QTZaeXZCYlczSWU1TnNQeDBNZkVvZDFPS1pRNGlUbGpRODlaVEphdjF6bE9a?=
 =?utf-8?B?WnlhRWdua2FSeEtsaUYyRm9FSEVtSU9VRGpXdmxTTG14VGN0VStOOGhwZDFZ?=
 =?utf-8?B?b2RWcVMwZGJNT25PWWJ3QW5XYlJwaEVhaUN3N3JWek82b1Q3TlVrdjlnVXVR?=
 =?utf-8?B?bzhzUHRnOGRlYkhZMFM0NUdsbGJ4Z3R3K3RPdUl6bFBMeU43WXlFK29LVDEx?=
 =?utf-8?B?b1JST3c5Y0ZPSWlINWowNWUzazBMQWtCWE8rLzdkb0k3R01WcStTdEpqdWln?=
 =?utf-8?B?T1BFbVNYdS9KcTZnQitjU3BwejczaG9Wbi81Z0plSjQwY29FRlpZaUlPTytk?=
 =?utf-8?B?ekZzUW5rZDl4V1JqVll1ZEpnL3lxZVdoS0RmQ1RPTTdnUzFqQ1poQlMvb1Fr?=
 =?utf-8?B?ZG1HbzI0Q3NyYXk5SEVRWlVDbmMwaDZ3c3dRTDBMWHRML2I0QythQ0NQOFdU?=
 =?utf-8?B?a2RiajZxLzhRQ0VSMHVGcmZjUFYwaloza3B3Q2NtK1ZnUzh2QVJyaWhMckNK?=
 =?utf-8?B?dXFlV0ViU2hSSUNDWk02ZkhnVi9FM0VSTFlSbmp4VUFsQnR2NjhMVWsyc0pi?=
 =?utf-8?B?dkMwYjhDS25MZm1PVEpRdkptODNlRGJzaEpWRzczSG1RYy8vbVBSLzIxVjRQ?=
 =?utf-8?B?MU9wTGtXZHpudWdXL2JuZmtyaEJpQnJ4RExFYlZ4YzZwcldvdVNUcTJhd3FS?=
 =?utf-8?B?UDZBbVRHNzE3M01lNTJkWlQ5ZGJHZHRqRnczRmdGazRZY050eThqSm0reitW?=
 =?utf-8?B?aTNLdlB3SHIxKzVQMWdaUFAxYThZV1JVZTNEb01semxlMHdMT2xEYU9aeldN?=
 =?utf-8?B?cjM4c05jZlkzTjFRMjNpT1FkUHhBVVViWTZMNlozNXR5aWRrOHFzUkZnTVM3?=
 =?utf-8?B?cjB0RWdaVTk3OVByZklRbGxscmR4TlhtcXR5dkhpZm9hRFlNUTJTOEdGRFZa?=
 =?utf-8?B?LzZleS80a1BCSytNSnFDV0c1cUd2bTV5d0xiNm44ODlsRWloazA4SUdOSUJz?=
 =?utf-8?B?b1pZZ0JqSTlzMzRsMlVLUTJJYWVzM1dEck5vSWdJSnpDbFN2VzlEdVhPKzhJ?=
 =?utf-8?B?cElla0FJKzFrdHdEZENWRDZ1TGgyQVY3QmMwVElLZnptM2Vwb0dvcW5sWXJh?=
 =?utf-8?Q?a0gESXcaQMSjDNGQYgHKsbg4dorxxI69?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHpUeEpBSHVURmtoUEpreWZGZE1iWjg4eE5JSWxSL1dRVGZPYU5iTWZPVkk5?=
 =?utf-8?B?S0dzUENOSG81M2hEQU9DQ3FPMlZacHVrc1pkdlhUcndQSVVBelI3K1Uya2Ny?=
 =?utf-8?B?TTd6WXZCRXpHNTFlT2EyNjVZVGZoNEMxc0FxVWFpTUR2N1dEQm91eDRwTGM1?=
 =?utf-8?B?VVFSWVlrNlBvcHNXeG5iUldFSVExbWFSYUFvcmU0SXkrQXp2cHlsY29RSThW?=
 =?utf-8?B?Ukt5ODBIRklpdUVROGFEVytPc3VVRmh5ZktZYWdTQ1NnWHhwanhndDRYYUtP?=
 =?utf-8?B?NjUxclB2ay9uNURPYmI3NVh0eTBEekdZTHhjMVJaTFlRMzVOTEFrR3BUUkJ2?=
 =?utf-8?B?TEpRbDFIZUdXamxPU1AxY3ZWVUhWdFpoK3hBZ0tGdW5MYm85UHloQllEbnRr?=
 =?utf-8?B?emlEM3hpTG5ZNk55V3pxRXpuYU9PMFp1bk1KVDU1d2FYbk01b3hJOEV2dE4v?=
 =?utf-8?B?QXA3alJyeTNyTnlZUGllZ1NUZGlpaTd1cGVqSnJlTU5ucXRXYmN3Ui9sTFB4?=
 =?utf-8?B?TW85akcyMitBbGNueFZmeWVpTW1xYno3TGN0RFZBRzBkT0ppeloxNFhIM1Fy?=
 =?utf-8?B?MEhVT2VUNGJNMVFNRnowUlpnOTZVVGQ0K2lpc0RtT21uN3pBQjRKWkFQRkNs?=
 =?utf-8?B?bTcrR2FPZnJXRk43eWlRNGZEL2VsZ2FoUHlHcWdVMWh1UVhtR0lBUVg2dUJO?=
 =?utf-8?B?NXp2V1FmZjltOWFVNklZY2RabTQvSENOVUlhb2UyVXg4TnV6OUhWQlQ2NVFt?=
 =?utf-8?B?a3ZWSytHWWlmK3lsMmJISVBrWUpSV3ZoVG5xeWRldTB6TjlXRS9nTWp1d09w?=
 =?utf-8?B?Zm9zVC9RK0hycnk3UjdxY2lpcUhaL3lpdkNZejVTRVB0VzJ6bjhTV2VZM0Ra?=
 =?utf-8?B?SFdqUHZBOFF0QWVKbXVLcFY0bTV0OU9ZNVUvenUraGlyMXZJMzhHNGdNMm1D?=
 =?utf-8?B?d3J0bjJtTEdPVnYrRkJoRTAxMDVhTVRvb3N4ZHRnaGZGMWlNZ3FUQmlYcHZw?=
 =?utf-8?B?MGxVUXN1dUNmdml3aDNuNUxBTGZNSUJ6bmM0eFI5RE9QY0lLRXpMSGZteWZx?=
 =?utf-8?B?N0xWTDJJbGdsMkpROUoyQ3ZvZHZRS3c2OVRHcDVDaStaVVl2eVJTOHJ0K0dF?=
 =?utf-8?B?WWVmUXh4cDF5eVA1akpHLytMN2NZdll6VWJ1NDVwK2NJUVc1YnJvQmdJaFgz?=
 =?utf-8?B?NFlGZW9hTzBhK3JPOHhhZ2lWTG53cmxPQTdYanpLYk5BbnlkUVJHM0VEdi81?=
 =?utf-8?B?WTE2L0xiUTRjblk1OG9EODhwVnVlU1hpbXBKSFZ1Y2I4V3k3UVAyRW1Udzdr?=
 =?utf-8?B?eVJSb1Y4K1V0UU9rbS9qd2VLOU5YaFFhQ2ZrN1hBbHAvaWtodU1XL0NmNlg1?=
 =?utf-8?B?bTYrZjM2SVI5dWx2MENSa0pmWE9pOWdMb3gxVXBnYk5yODlGbWtwQTNpbG9x?=
 =?utf-8?B?YmUrWDVnMndXamtyMWpld0xWMFBpZzJ3aVVxS3Y1ODd5bHlxb3NPa3RlRmRL?=
 =?utf-8?B?OTc2ZGFnSFRoWW9GQy80NmJVQ0ordGxRa0NObVhLcThYb25LMWI4ckNNaXdK?=
 =?utf-8?B?TzVENlJqUlA3QjhLMDJUN1RBRUJ4ckMzNFhGUXJIcFRYaVpoTy9ITEVTV0lm?=
 =?utf-8?B?VGZFbHJ0cmtlMlNzYXM3dXUxb2QyVDA4V053dTAxTlRSQk9laVVpRnRZN285?=
 =?utf-8?B?NVRpN0RaV2ErY3hhbk5lK0FQT01KVXN3cHlHSmpSUVcwVU4vS3FRYVZDaEJC?=
 =?utf-8?B?ZDZ0cmNxQzkwdFozZncxNzF3dlQxZEJqa0tWV3ZDU2dpeVhBU2ZVTFU3VFYz?=
 =?utf-8?B?T3JuWE56NkZNcUM4SEVlbmhjOFFyV0FqaUpOUmpLV1dUV2FVSmxnQUZxYTFQ?=
 =?utf-8?B?UDd5c2tkbk1GbEYvLzRJS3pJcW1BOXlNdWdiTjU2dWxDRzgyYXB4emZSQnJP?=
 =?utf-8?B?TXBPMll1Z2NnSEREWnRKVWVMZmZNOXA2ZE5xWTA1Y3NaLy91N0RrUm02MG1N?=
 =?utf-8?B?VnhMcVZ3WWp2RmlacmRGU1RqQjhUUDBubDVxcmRsZnBIT0ovZVoyclcvRitO?=
 =?utf-8?B?OWpuakxyNWdTZkk0cjAxV0FHdGplQnAyU1NOZUVOdEVIbkpPc3RtOXJBNGhQ?=
 =?utf-8?B?R2ZmdXFDVjBSR1prU2dqc2xmMXlZTXR1bWt4eGhwcWJUeVNaVjNPdVRmNGxv?=
 =?utf-8?B?UEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a567f4d4-db83-4ff3-1c88-08ddff345cab
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 08:44:11.6743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0UQRMWUrmCq/UaLhROvD+cMPcKVCDMFzSg/McS4P0yuEL1N6upv/GFQaWZXGCLSg9DRoFduWeh0VDrCffpiTUU3b059oRb+OpTt7gDe8Sj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6221
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



On 9/29/2025 4:55 AM, Matthew Brost wrote:
> As multi-GT VF post-migration recovery can run in parallel on different
> workqueues, but both GTs point to the same GGTT, only one GT needs to
> shift the GGTT. However, both GTs need to know when this step has
> completed. To coordinate this, share the VF config lock among all GTs
> that share a GGTT, and perform the GGTT shift under this lock. With
> shift being done under the lock, storing the shift value becomes
> unnecessary.

maybe better (and more natural) option would be to move VF GGTT config
from GT (xe_gt_sriov_vf_config) to Tile (xe_tile_sriov_vf_config) ? 

and protect it there with single lock also defined there ?

I'm doing similar changes on the PF provisioning side...

> 
> v3:
>  - Update commmit message (Tomasz)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 95 +++++++++--------------
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  3 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 11 ++-
>  drivers/gpu/drm/xe/xe_guc.c               |  2 +-
>  drivers/gpu/drm/xe/xe_tile_sriov_vf.c     |  6 +-
>  drivers/gpu/drm/xe/xe_tile_sriov_vf.h     |  1 -
>  6 files changed, 51 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 6f15619efe01..ad1d63b5b8d1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -436,16 +436,19 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>  	return value;
>  }
>  
> -static int vf_get_ggtt_info(struct xe_gt *gt)
> +static int vf_get_ggtt_info(struct xe_gt *gt, bool recovery)
>  {
>  	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	struct xe_gt_sriov_vf_selfconfig *primary_config =
> +		&gt_to_tile(gt)->primary_gt->sriov.vf.self_config;
>  	struct xe_guc *guc = &gt->uc.guc;
>  	u64 start, size;
> +	s64 shift;
>  	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> -	down_write(&config->lock);
> +	down_write(config->lock);
>  
>  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
>  	if (unlikely(err))
> @@ -465,13 +468,17 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
>  				start, start + size - 1, size / SZ_1K);
>  
> -	config->ggtt_shift = start - (s64)config->ggtt_base;
> +	shift = start - (s64)primary_config->ggtt_base;
>  	config->ggtt_base = start;
>  	config->ggtt_size = size;
> +	if (recovery)
> +		primary_config->ggtt_base = start;
>  	err = config->ggtt_size ? 0 : -ENODATA;
>  
> +	if (!err && shift && recovery)
> +		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
>  out:
> -	up_write(&config->lock);
> +	up_write(config->lock);
>  	return err;
>  }
>  
> @@ -485,7 +492,7 @@ static int vf_get_lmem_info(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> -	down_write(&config->lock);
> +	down_write(config->lock);
>  
>  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_LMEM_SIZE_KEY, &size);
>  	if (unlikely(err))
> @@ -505,7 +512,7 @@ static int vf_get_lmem_info(struct xe_gt *gt)
>  	err = config->lmem_size ? 0 : -ENODATA;
>  
>  out:
> -	up_write(&config->lock);
> +	up_write(config->lock);
>  	return err;
>  }
>  
> @@ -518,7 +525,7 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> -	down_write(&config->lock);
> +	down_write(config->lock);
>  
>  	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY, &num_ctxs);
>  	if (unlikely(err))
> @@ -549,7 +556,7 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
>  	err = config->num_ctxs ? 0 : -ENODATA;
>  
>  out:
> -	up_write(&config->lock);
> +	up_write(config->lock);
>  	return err;
>  }
>  
> @@ -564,17 +571,18 @@ static void vf_cache_gmdid(struct xe_gt *gt)
>  /**
>   * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
>   * @gt: the &xe_gt
> + * @recovery: VF post migration recovery path
>   *
>   * This function is for VF use only.
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
> +int xe_gt_sriov_vf_query_config(struct xe_gt *gt, bool recovery)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
> -	err = vf_get_ggtt_info(gt);
> +	err = vf_get_ggtt_info(gt, recovery);
>  	if (unlikely(err))
>  		return err;
>  
> @@ -610,10 +618,10 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>  
> -	down_read(&config->lock);
> +	down_read(config->lock);
>  	xe_gt_assert(gt, config->num_ctxs);
>  	val = config->num_ctxs;
> -	up_read(&config->lock);
> +	up_read(config->lock);
>  
>  	return val;
>  }
> @@ -634,10 +642,10 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>  
> -	down_read(&config->lock);
> +	down_read(config->lock);
>  	xe_gt_assert(gt, config->lmem_size);
>  	val = config->lmem_size;
> -	up_read(&config->lock);
> +	up_read(config->lock);
>  
>  	return val;
>  }
> @@ -656,11 +664,9 @@ u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
>  	u64 val;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> +	lockdep_assert_held(config->lock);
>  
> -	down_read(&config->lock);
>  	val = config->ggtt_size;
> -	up_read(&config->lock);
>  
>  	return val;
>  }
> @@ -680,34 +686,10 @@ u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -
> -	down_read(&config->lock);
>  	xe_gt_assert(gt, config->ggtt_size);
> -	val = config->ggtt_base;
> -	up_read(&config->lock);
> -
> -	return val;
> -}
> +	lockdep_assert_held(config->lock);
>  
> -/**
> - * xe_gt_sriov_vf_ggtt_shift - Return shift in GGTT range due to VF migration
> - * @gt: the &xe_gt struct instance
> - *
> - * This function is for VF use only.
> - *
> - * Return: The shift value; could be negative
> - */
> -s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
> -{
> -	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> -	s64 val;
> -
> -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, xe_gt_is_main_type(gt));
> -
> -	down_read(&config->lock);
> -	val = config->ggtt_shift;
> -	up_read(&config->lock);
> +	val = config->ggtt_base;
>  
>  	return val;
>  }
> @@ -1115,7 +1097,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> -	down_read(&config->lock);
> +	down_read(config->lock);
>  	drm_printf(p, "GGTT range:\t%#llx-%#llx\n",
>  		   config->ggtt_base,
>  		   config->ggtt_base + config->ggtt_size - 1);
> @@ -1123,8 +1105,6 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>  	string_get_size(config->ggtt_size, 1, STRING_UNITS_2, buf, sizeof(buf));
>  	drm_printf(p, "GGTT size:\t%llu (%s)\n", config->ggtt_size, buf);
>  
> -	drm_printf(p, "GGTT shift on last restore:\t%lld\n", config->ggtt_shift);
> -
>  	if (IS_DGFX(xe) && xe_gt_is_main_type(gt)) {
>  		string_get_size(config->lmem_size, 1, STRING_UNITS_2, buf, sizeof(buf));
>  		drm_printf(p, "LMEM size:\t%llu (%s)\n", config->lmem_size, buf);
> @@ -1132,7 +1112,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>  
>  	drm_printf(p, "GuC contexts:\t%u\n", config->num_ctxs);
>  	drm_printf(p, "GuC doorbells:\t%u\n", config->num_dbs);
> -	up_read(&config->lock);
> +	up_read(config->lock);
>  }
>  
>  /**
> @@ -1215,21 +1195,16 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
>  static int vf_post_migration_fixups(struct xe_gt *gt)
>  {
>  	void *buf = gt->sriov.vf.migration.scratch;
> -	s64 shift;
>  	int err;
>  
> -	err = xe_gt_sriov_vf_query_config(gt);
> +	err = xe_gt_sriov_vf_query_config(gt, true);
>  	if (err)
>  		return err;
>  
> -	shift = xe_gt_sriov_vf_ggtt_shift(gt);
> -	if (shift) {
> -		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> -		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> -		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> -		if (err)
> -			return err;
> -	}
> +	xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> +	err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> +	if (err)
> +		return err;
>  
>  	return 0;
>  }
> @@ -1316,6 +1291,7 @@ static void migration_worker_func(struct work_struct *w)
>   */
>  int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
>  {
> +	struct xe_tile *tile = gt_to_tile(gt);
>  	void *buf;
>  
>  	if (!xe_sriov_vf_migration_supported(gt_to_xe(gt)))
> @@ -1328,7 +1304,10 @@ int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
>  		return -ENOMEM;
>  
>  	gt->sriov.vf.migration.scratch = buf;
> -	init_rwsem(&gt->sriov.vf.self_config.lock);
> +	if (xe_gt_is_main_type(gt))
> +		init_rwsem(&gt->sriov.vf.self_config.__lock);
> +	gt->sriov.vf.self_config.lock =
> +		&tile->primary_gt->sriov.vf.self_config.__lock;
>  	spin_lock_init(&gt->sriov.vf.migration.lock);
>  	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 0b0f2a30e67c..ff3a0ce608cd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -18,7 +18,7 @@ int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
>  void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
>  				 struct xe_uc_fw_version *wanted,
>  				 struct xe_uc_fw_version *found);
> -int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
> +int xe_gt_sriov_vf_query_config(struct xe_gt *gt, bool recovery);
>  int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>  int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
> @@ -31,7 +31,6 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>  u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt);
>  u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt);
> -s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
>  
>  u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>  void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index a63b6004b0b7..6cbf8291a5ab 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -19,16 +19,19 @@ struct xe_gt_sriov_vf_selfconfig {
>  	u64 ggtt_base;
>  	/** @ggtt_size: assigned size of the GGTT region. */
>  	u64 ggtt_size;
> -	/** @ggtt_shift: difference in ggtt_base on last migration */
> -	s64 ggtt_shift;
>  	/** @lmem_size: assigned size of the LMEM. */
>  	u64 lmem_size;
>  	/** @num_ctxs: assigned number of GuC submission context IDs. */
>  	u16 num_ctxs;
>  	/** @num_dbs: assigned number of GuC doorbells IDs. */
>  	u16 num_dbs;
> -	/** @lock: lock for protecting access to all selfconfig fields. */
> -	struct rw_semaphore lock;
> +	/** @__lock: lock for protecting access to all selfconfig fields. */
> +	struct rw_semaphore __lock;
> +	/**
> +	 * @lock: pointer to lock for protecting access to all selfconfig
> +	 * fields, all GTs point to primary GT.
> +	 */
> +	struct rw_semaphore *lock;

this could be placed in tile.sriov.vf

>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index d5adbbb013ec..c016a11b6ab1 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -713,7 +713,7 @@ static int vf_guc_init_noalloc(struct xe_guc *guc)
>  	if (err)
>  		return err;
>  
> -	err = xe_gt_sriov_vf_query_config(gt);
> +	err = xe_gt_sriov_vf_query_config(gt, false);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> index f221dbed16f0..dc6221fc0520 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> @@ -40,7 +40,7 @@ static int vf_init_ggtt_balloons(struct xe_tile *tile)
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
> +static int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
>  {
>  	u64 ggtt_base = xe_gt_sriov_vf_ggtt_base(tile->primary_gt);
>  	u64 ggtt_size = xe_gt_sriov_vf_ggtt(tile->primary_gt);
> @@ -100,12 +100,16 @@ int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
>  
>  static int vf_balloon_ggtt(struct xe_tile *tile)
>  {
> +	struct xe_gt_sriov_vf_selfconfig *config =
> +		&tile->primary_gt->sriov.vf.self_config;

with GGTT (and its lock) stored at tile level we will not be forced
to look at the primary-gt any more


>  	struct xe_ggtt *ggtt = tile->mem.ggtt;
>  	int err;
>  
> +	down_read(config->lock);
>  	mutex_lock(&ggtt->lock);
>  	err = xe_tile_sriov_vf_balloon_ggtt_locked(tile);
>  	mutex_unlock(&ggtt->lock);
> +	up_read(config->lock);
>  
>  	return err;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> index 93eb043171e8..4ee68d1fb28e 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> @@ -11,7 +11,6 @@
>  struct xe_tile;
>  
>  int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile);
> -int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile);
>  void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile);
>  void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift);
>  

