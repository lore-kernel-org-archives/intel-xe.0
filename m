Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E1EC3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 05:12:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9B610E1D8;
	Mon, 22 Jul 2024 05:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aidI4Nn4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9C710E1D8
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jul 2024 05:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721625161; x=1753161161;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0MOijJ6GKl/7tkKFNFsHC/Ul5lbj6drXhdC+G3+G8r8=;
 b=aidI4Nn4dH5xRepZODU015muyOse9uLyX4Qwp+4qR01JMXC0NoB7BAvF
 6zs1RuUubU8pJyMl5XPvcTE1xhriv5qa7KXeUlX/NkHGanhiMBdxwArpA
 HrsOSABUiye9aTvifN+kmZvRccpvsUb3EA3PCyMHhxfYQ1hLEGnhJI+uW
 8Kmbefn/LIwJbeYUhuZc+HH9pRPYeEOZeTugMllLtl+okMrwplZ0XWl+w
 X3ZeeK4crE6jwcRS2kCDUUFw28cJCYbEh0gkyvJxlI6t1cAaryL8OqRpr
 UIG630XUyVAogHm+/njUsg4pHk5qu+5AnCJLmDvqEHydW/43RBxMCcg5E A==;
X-CSE-ConnectionGUID: QTluBoB9Tl6wqVjQE0+eYQ==
X-CSE-MsgGUID: BxOc3WKAQ1mnpWeEUQeQMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="30561827"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="30561827"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2024 22:12:41 -0700
X-CSE-ConnectionGUID: xZila0s4S9aIRzRAzkoLCA==
X-CSE-MsgGUID: ya+xEOeVSDS2GAS4fRb5JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="89215396"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jul 2024 22:12:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 21 Jul 2024 22:12:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 21 Jul 2024 22:12:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 21 Jul 2024 22:12:39 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 21 Jul 2024 22:12:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zfo/xqKUceH8d/WYVQCbsw5zCezAbBZkv58Ne4j/CnDZYDAqXuN/KwToUi7TAox+m8ujtKolUzE6s7hpUDFwqGBgSCC0rXCEzRMqPrUZb1eonY+JF3psSxM/lDC8Ed2ixCZ3S6LVP5AxVDT3ro8J4q7rhkeeQciNNJmuiosiXx4aGtSkNV2LJkCbIIbLBe7OKEQLRbxL6TzHtar8Q6Hm6H6l8/SS/iYtJPw84StenG/t1se6neh3FU7QlI0UC8aq+st0ozPbjz1C7kTV4KhT7oiCjrfzkUe5qubZJREGl2LnHirpsoeB23rTNW6Ikp9pBT0CECIR0Xko6bYaK8YD3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bG5i9CIIRV6xd9fXcLC1juvLkiabAC5te3TRofvkwCI=;
 b=PT2l2V47sWuNistLHg2l4ko+Mff4muLxKyAybnoVWWPspwKa4FrxoXvPURrTSNEcb0Nz61rV/LSVvTd0nMiu/o8CgHI8AjayYHa7avtvaB9Nh4aDeKTXlj1ajoo4IhqVq/gjSO1UAqHalV8eNJq/HaD+RUyMLCdNkcH8mcAoUP8aPAbrcfbOWpqvGsiJFyevVk2T4OwZWKdVURsBbQrlLhXiBk6NzkcrMM36MarJAyT41vJdsb+v0mdHYOb62RFiKYMdVhpngOa/Aixy6XnZLPLZx2ZFmu59DsXD7rbeBLMSJAPCF8M2rR/kMOJO9C0Rtf3lwd6eXA6uK4NKGIEeGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA2PR11MB5065.namprd11.prod.outlook.com (2603:10b6:806:115::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Mon, 22 Jul
 2024 05:12:32 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.7762.027; Mon, 22 Jul 2024
 05:12:32 +0000
Message-ID: <27476ff3-3cdb-4b51-add4-4e071986a5b2@intel.com>
Date: Mon, 22 Jul 2024 10:42:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Delete unused register from xe_regs.h
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
References: <20240715105555.2220444-1-himal.prasad.ghimiray@intel.com>
 <20240715105555.2220444-2-himal.prasad.ghimiray@intel.com>
 <SJ1PR11MB620416EAAE7A6BAE9368159881A82@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <SJ1PR11MB620416EAAE7A6BAE9368159881A82@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::17) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA2PR11MB5065:EE_
X-MS-Office365-Filtering-Correlation-Id: dce65b8a-e677-4c5f-620c-08dcaa0ce3c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dERWMzhKOVhRclFkbFh6OWRRc2pHbms3WVQ5QXhwMU1SSTR1dlNEWXg5Wnc5?=
 =?utf-8?B?SkhEU0dMZjVBc3o0ZmdFaFlqa2pPRENlZUNQMmZQd3BlWUJtOGFRaGloZEEy?=
 =?utf-8?B?Wm9vY0Y4VVpMMzF1UVJ3cHZRN0xaWDlsNk95d2pNM0pJUzZ5MFpzV1dyM0FG?=
 =?utf-8?B?aS9hdmdCVkpoc1NNQ1JOSzh0c3FhcDVuNERSRStWM3o2UlFLZktRb1dzTll3?=
 =?utf-8?B?SWNqcm9FZ2ZCZTNJVDJGQ2tzd1paVVBvNHVSclhXejVQZGU4ZHN5Q0Ywa1ZH?=
 =?utf-8?B?MnZrUmphUWVzbVlZeGh4aUxQa0tpNm1GMmFYbk95TVpsWWw2Z1RBVEpIeWx5?=
 =?utf-8?B?aHZyOGlPTk0xOFR4SlpSc2FaeklYOTlPVkZkLysraTVnT0JwOFY1Y2QrMld3?=
 =?utf-8?B?dlp2Nkc3ZGFFQkp3NCtReWo4SFBNSjluQkhKYlNDZHd3VmdEbkgzcEV3WGov?=
 =?utf-8?B?TVdXZWoycWVBZGYvK1VIbVhQTjVVUERaRG9pTUdQa1F6OVR4MmxZRTBMM283?=
 =?utf-8?B?azJCc3BpUXpBNWdQbGh2U2tadHVOWVA2V1lZMHFxSEdKNmZ6clJEMnRhN1pa?=
 =?utf-8?B?UGRGekdhR2dBWFhON2VyTk1PdHZIMDdhVjUrQUIzb0hRbDA0TVVPbjZVL2Nr?=
 =?utf-8?B?QnZKV25mb2pUL1B6ZkVXWHJnekVsV3hUZllScGc1TWU4elNGWUc0ZXhiM0Jm?=
 =?utf-8?B?aGhpOGVnb0ZpNm0xdmhHRXhNWGhrRWtKczNCUkRScWFoQTJ4Wm9VMmF6MGkr?=
 =?utf-8?B?R3ZvdWJ0RTJhMHlucElHNitudVB2ZjRNZHR5NGVhamJoRkkzZDVmMnNWY1BN?=
 =?utf-8?B?WitBUm1RNWlMM2FMVlBteVlGN1hZam93OXhHK21pQ1JzU25hOVNXU2dLc2hI?=
 =?utf-8?B?WVBQRVNmREV1OUpveXE2cnFUempLV0MvVU4yRndlMXdjL2Y5OHFRejZiTi8r?=
 =?utf-8?B?TkxUVGlEV1diSzc2UHAyMzR0K1RXZStRMWxYY3ZETE1WSWhCdDFMRCthZEx5?=
 =?utf-8?B?U3YwZ2hTUHdVN2xxVHVoRklLMTd4aCtrOUs4UDFSdFMzSUFvY3FQdFprMXR1?=
 =?utf-8?B?SDlpK1l5OWN2NVZuUEg4dVdPNCs0TjNmWGxHdDQrQUpkWFQzaHZVUldLTktO?=
 =?utf-8?B?aUgxbTR3Y3dJck1FUUhBMko0d2lXRTVxZGo0a1FUd0IxSzNxbldPQ2RSdG1Y?=
 =?utf-8?B?SjlrSGFxNS9oUExzbWxCNFdJQXlra3FtVjZFckJqNTZ6cXlhL3BkNzgvalJK?=
 =?utf-8?B?cExRbEFXM0k2VDlLNm5tRlNTU3d3U2VCR25DODZJQi9sQmNRVlVhdGc4di95?=
 =?utf-8?B?Yk83NWJaWFNpMHM4amlrcWhvM0pqWFNLdUpVUXhoNXNJZEJDZURiMEpRQWhQ?=
 =?utf-8?B?OW9EN3BRSTc4c1V4ZEl2cUFyUjc2NGMzdW1hUHB4aFlsQ3NaUUhRR0RQSnFr?=
 =?utf-8?B?YWNQbU45bmh4R1FUMUtLM2ZiT1hlR1RsOWRLaTBBWHBENzVWUXRaSWJnVVVQ?=
 =?utf-8?B?bXlGUWltOExjSjZWdVluUzR2WFZydnJ2VXZXT01lNzBVc2RTalBZWEg4VVI2?=
 =?utf-8?B?bmdxK2k3S05uS2xNNTRLL0dXVTVsMzdkR3kzbUZNOE1QQlA1aGxNek1WaUNS?=
 =?utf-8?B?LzUrSXN6cWpyZnZ1ZTE1NkhIU1lYbkQvcXlVQ3A0ekMyMCtlUXlwV2g4WDJP?=
 =?utf-8?B?ZFhNSjV1MkttUWFsdHFoRExlWmNNMHpUTFNnWDFxOVJsaUlkSEtGbHkyYmli?=
 =?utf-8?Q?J52pN/6GdMCdHSy7ts=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFRrdG84bFhKWmNsejBMUDg0RHlhL3huY1JwdXhiL0VGVUt4UnRhYkxERmxk?=
 =?utf-8?B?Q1FrNVF2ZGhDVHZ5elNaQzI4UlE0VlVzakdOc0ttR21MZDZMajl5bk1yYSs2?=
 =?utf-8?B?SnViWEFoclhwTnVuQUtVRVBHS1d5QWpNOEhIeGRTcXVUbkNKcmdkUWxTMVlC?=
 =?utf-8?B?UlRhYmZxczYyQ0xRbVVRaVcxZHhuQkF6K1k3QUZYK2RRTmk0YUcrb29iaDRx?=
 =?utf-8?B?Nk1nYWtVN1hSRlhiV3VBMHpaNW5RbkhoY3JFdG8zR0tVVjk5blpUVFNWTEl4?=
 =?utf-8?B?L2RVNEdnTnUvajk1TFdWNVdpMFJKeWRJZ21ERVp3RmhRNC85eEFMRStFSzU3?=
 =?utf-8?B?NDF0aGtOUHd1MGhIRThFR2hMSWVsb09FLy9tQVNtNDZRTmU1SFhadGdmb0FW?=
 =?utf-8?B?bnJ6aFNxWHp1M1FvTUdKd25EYVdWSitNZmx4NjFrMnFXdXR2NjlVMW85SldB?=
 =?utf-8?B?MUYwb21UWVB4VXVYSVFTQVYwbFRVOEJVSmR5bnVkbTFJUXZBQytRME5NMFJL?=
 =?utf-8?B?L3RvZExNMmhxeWZoZEJOMUVVamhETDZIMzNWUkJtNmNIZmMvVWRqbmlVenNR?=
 =?utf-8?B?Qlp0UXdWaDgrS0lBNTgrQ21LRUNGMDMrNmR6WVo5WEVHUVdwc1l5b3hjbEFD?=
 =?utf-8?B?c01UaE5nUWFVWU4yd0t6ZUlDRFF4UmQ4S0VkS3JwVS8zbEdFbHh2amdlT2Y1?=
 =?utf-8?B?OVQ3ZTZZY1NGWUdmR0dVMnA1alh6QlVJMitUQ2JEMTJpT2JDQmJPbDI0TUxu?=
 =?utf-8?B?TkdoenpJcjV5UFhnSG01dHJSRER5RStPMTYzY0hDN3VvNXJGZlZER3RuWEFU?=
 =?utf-8?B?OHc5ZXVQak5TYUdQRHpxaWJmVWV4Wk1uaWpPMXp4Ukk3aFE2elhWZmZBemVT?=
 =?utf-8?B?SG1KVTB5WDhpc2o4RXFxc1dSQUZZK0Jpb1Z2UUx5dGtyRUtxV0xsVDhHa1ZG?=
 =?utf-8?B?R3psTTFRcVdyOWhDZTdaQTRUQzVFOUM2aXFQRk5hUEwzVE40bEh3ZXlXakpL?=
 =?utf-8?B?VXU4VDNUTmYzSGtaV2gzVXdyYWR3NlU3cnM4UGc4WjNkSHdNY3cvZjVEM1ZZ?=
 =?utf-8?B?Z1hzT1lSMjZKTDN3MlI2SjdrV0NUa20vdExZbVYxRmR4N0pFQmhLckh1bG9n?=
 =?utf-8?B?U3BYMHdIaG8wV1h5MFdHQ0ZKMU1tY0dXYVJHaTlkaU9xcC9JblVYb2VzT3I1?=
 =?utf-8?B?WDRna3ZpNU1hWitJZHhHMGhndmdBZS8wS2NKVTQ1VlpWVWV5NVg4WlN0dUNn?=
 =?utf-8?B?cVlrdXN2ZWRIeGhBVEdXaWxuZ3c4Sy9EbVY3R3VwZ1NOZG5Bc05FUTdXTk9a?=
 =?utf-8?B?Rm1lZE9oMlF3WlZSRTR4TFk2bnY4RUdZR3g1RkZ4ajlJTS9aUGwwY1htWnZ4?=
 =?utf-8?B?eTAxWDRBcjVtMDI5aUVsU0pUSENFSDVpMkJVTFZCS2ZhYTc0RlIrZ0NvaDRK?=
 =?utf-8?B?WTFYeTA3ZHlEMUFYY2VaVm1HRHMzMTVoR3pPdkdHRHhQV2o4dDVQdmgrc3di?=
 =?utf-8?B?N0d4Z3ROd2pXWDlCS21FdElhZDUrNXQwalJ3MUEyUS82RXpZdkRXSXBIZ3NV?=
 =?utf-8?B?OXA2MG44RXh4Y3RoUFlkV0VaeGxyT0MvazloekgwbmFCYUkvUzh6ZzQ1OVRo?=
 =?utf-8?B?T3VsUVEwRUFRV0M5TzExbXEzaGFiUTBKZ0hVT05pQ2RLcGpxTFhqWjVtNElY?=
 =?utf-8?B?RnJkazRIcWltbjZka2lrcDVvcThjZ0tjSUVzdytZV3hvZDVqT2NsWmdDQzhI?=
 =?utf-8?B?V0hKRFE1bGJXSkdUeTJiTEhJTFhGVFBDZEk5VGJWRnZaNURnZkN4dVRrbnc5?=
 =?utf-8?B?UFJGbVVZc3ZVWDZZdXRNamk2OUt4bmlPMEc2b1dmc3UrNXRhVUROdjBtTEgx?=
 =?utf-8?B?QWdVaVZVZCtSNWEzMEpaNlk1N3hpTmhXb1J4MmxFNE1GSTFxcGdvajZneXJp?=
 =?utf-8?B?RDJuVHVwZk94cFYra0t3TkYxZDkvU3RJUGFLVjlZOEJvSFdSZHp1WUc4allC?=
 =?utf-8?B?RHBxdHJZVmFBSUlUTTBkNUFTOFNESVhMOHJyQk1pZmpvZnFaYUlqUlkvRHl2?=
 =?utf-8?B?OWRmU2d4RXh0TEFMcFhtcWJjL2ttSzdqOHRLREl2VkhyRVFCR1FTNEF3aW1H?=
 =?utf-8?B?Q25xb21yVk5qZ2RzVnVwbTBONVVGUDJkdXNYcUNiSHFSNU1LejE2U3NDRjdq?=
 =?utf-8?Q?z7Xrx9jsKzXJz4LkvO73LJU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dce65b8a-e677-4c5f-620c-08dcaa0ce3c1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 05:12:32.0006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dArXiJOjECjceJLoNysZACoGLMn5Z7lo4FlfS60ri1Ywk8f6sqQcSFxr1v3hRiBDXIB966ZX04mun50gl69FOiGRACNPg1bQp0Q/DPmhiQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5065
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



On 22-07-2024 10:23, Upadhyay, Tejas wrote:
> 
> 
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Himal
>> Prasad Ghimiray
>> Sent: Monday, July 15, 2024 4:26 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Wajdeczko,
>> Michal <Michal.Wajdeczko@intel.com>
>> Subject: [PATCH 1/2] drm/xe: Delete unused register from xe_regs.h
>>
>> Register SOFTWARE_FLAGS_SPR33 is unused; therefore, delete it.
>>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_regs.h | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h
>> b/drivers/gpu/drm/xe/regs/xe_regs.h
>> index 55bf47c99016..dfa869f0dddd 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>> @@ -15,8 +15,6 @@
>>   #define GU_MISC_IRQ_OFFSET			0x444f0
>>   #define   GU_MISC_GSE				REG_BIT(27)
>>
>> -#define SOFTWARE_FLAGS_SPR33			XE_REG(0x4f084)
> 
> @De Marchi, Lucas I see you added specifically this register in below commit, was there any purpose ? To me it looks fine to remove.
> 
> commit 8cb49012ac171698b1253dea45e56c284e997d38
> Author: Lucas De Marchi <lucas.demarchi@intel.com>
> Date:   Sat Feb 25 12:10:39 2023 -0800
> 
>      drm/xe: Do not spread i915_reg_defs.h include
> 
>      Reduce the use of i915_reg_defs.h so it can be encapsulated in a single
>      place.
> 

The register was being used for ensuring write barriers in dgfx earlier. 
Which is modified to use VF_CAP regs now.

For background of the register usage.
https://lore.kernel.org/intel-xe/20240702183704.1022-4-michal.wajdeczko@intel.com/ 



> If no concerns from Lucas, then
> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> 
> Thanks,
> Tejas
>> -
>>   #define GU_CNTL_PROTECTED			XE_REG(0x10100C)
>>   #define   DRIVERINT_FLR_DIS			REG_BIT(31)
>>
>> --
>> 2.34.1
> 
