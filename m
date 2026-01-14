Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1192DD38FE2
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 16:15:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA97410E273;
	Wed, 14 Jan 2026 16:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mfc0ML+d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B4A10E273
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 16:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768407335; x=1799943335;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=+nAYGeCvQV5iBkAlqQXLeIZpjk1psi9ORRfn7DIer1k=;
 b=Mfc0ML+dI/GIyTMPXSRmbq12rg3aQ+xMG+s3+lPjcDh3hcnbMAlLMxSn
 KlE8ojRcsWQTh26+/N7Q/AdeUF5ePheOSCRcjN+dpL6YFGitOP9HnsyBA
 CtZS3c1DFq/9c7drovwMQSCvi7yWn6aUAZVTcfMIsCz5j0r3uXtRvSjag
 1QTsglWc1LI4iSY6zwhhrnF4En80lV7BR/cxS2tJnOC7XvO/QyR/kWgTX
 0zxcX92yDBz+O7dVII0Bsz6BKu7Vwy5Z2QlKFykQz2g9spUW64Us1osOE
 WyF8Ihmu5IpSQp0euowEpec8pgTisHSHj7abab+eD7MT7VM7UWGevMfLZ Q==;
X-CSE-ConnectionGUID: aCe1VXgeR2KV9usrAn0KLA==
X-CSE-MsgGUID: qirAwD2GSASIH6JHC5jZTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69686320"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208,217";a="69686320"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 08:15:34 -0800
X-CSE-ConnectionGUID: IFy/vqdvS8OvgPrOoYTrEA==
X-CSE-MsgGUID: zovBcCgfQXe3yQL77v7dAw==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 08:15:34 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 08:15:33 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 08:15:33 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 08:15:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oo5SMfMAtkxUpWUbkFasjhWOUPOZWNvEM/+d9ieIBKG3dhZjmNADPNSi0nPWWmxMjYX7GBHMxWb8ZdQbczoLqm8P6ObdrvKcefpf2VL1sco6YSF6wYlMrJIfvXRDYkW0RX/0ttJfID/VAqJWHhymfvttcafTA3WEwEwSl9hz3YBS0ff2PqbeO0eUXKu1HKrgqMg1RfZmRz4mOw9Qw4YCneam1ITlb0xvUzQueJq7p9jSkb4G7SfQCvWb7uaQcttUCCbm9Aiv0x8ZC/ln29sPebQgsd8x7qtW+8ytqofyPgKKgd3UShYmosUR9dnLyPJC+T1voPw65RxrvZ2u0W6mhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RY3jBBE3DtJrb2x+JLQsLqbdbz6dkMUzcBi+bMb4NoM=;
 b=Rb1K+gYBVZbEo/WqBX+BJH5dI7ugzCYwKrbItIvDaR6Tfd7CvmEHBeYZyNOdhzU0H3C8UafBKMQdLB0aWokeng+493zVSxPVK6JghmUnezSMUbd1NOq7RIar395DWUKPjaRI5+3sJOOP5fDgPpx83fxabWtI2w4reUogeSUvmkslctp+BjgYX/UCXd4jWezn3IRiQZ0sZFzC9Ez72WppC2RgyJT+FrNPjYLh5t42jegQudWgGea25lrX30YIKEAooP+fASI+5BaX1Hh4mzb/svYwVjKQ/R8ik++aOgpguTxWrC3nfY6ScV0b3cGThY9adiS/aO946HxW1ajT1nUgPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CH3PR11MB8210.namprd11.prod.outlook.com (2603:10b6:610:163::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 16:15:31 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb%4]) with mapi id 15.20.9520.003; Wed, 14 Jan 2026
 16:15:30 +0000
Content-Type: multipart/alternative;
 boundary="------------TjXUnWlPbxs5e2AQmEq0G9d2"
Message-ID: <d3fe7cda-3428-49a6-9104-9b3b729e0c9c@intel.com>
Date: Wed, 14 Jan 2026 21:45:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Add Wa_14025883347 for GuC DMA failure on
 reset
To: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>,
 <daniele.ceraolospurio@intel.com>, <nishanth.p.reddy@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20260114130015.3917770-4-sk.anirban@intel.com>
 <20260114130015.3917770-6-sk.anirban@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260114130015.3917770-6-sk.anirban@intel.com>
X-ClientProxiedBy: MA0PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::17) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CH3PR11MB8210:EE_
X-MS-Office365-Filtering-Correlation-Id: b081fc8a-3f11-43e3-3fbd-08de5388232e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clBGZ2RGMGNWTEdTYlBkQXpQVlFPenR2a0FxcTk0a25aZ1NuY0lVS0VqRjRB?=
 =?utf-8?B?WHpybW5aaWVyOUtUZUp6VCtBUDUzUVNNRk1vZWpPekJQbkJON3kzd0s5ZStT?=
 =?utf-8?B?SkVxSGJNYUszVnJJODdCSnU5dTdMb0h5ejF5ZUFMcWVvM3I0RGdmMXQyMm55?=
 =?utf-8?B?WStKNFpQWHNRdlY4UmNyUGRucjh2emo1QUJNSDlJMFNOdEFnREM2bUd6QS9v?=
 =?utf-8?B?MUI1Zy9XWW40b0czSG85c1FOU1JnT25LR0xUYzVGaWs2V1dZaElsczgydThO?=
 =?utf-8?B?YVlwSEZxeGQvSHhPcXB4b1kyVGNpUTQvRnF4cW44WUR1a09HSEt6eFZhL3Nz?=
 =?utf-8?B?eDFaRnJENCs1L0pQZEpyZWFkTHY2S1ovOGlZTHlVNHJObGVXY0tZNmlvRXQw?=
 =?utf-8?B?bWMrYzFlbVZLMUxGWWN0LzNoUFF3SXpnTklzc3ZhbXcxa0VOVWljSjR4VFFr?=
 =?utf-8?B?S1g5eXNnbTZyT1FwSVVrb2c0Z09YMGJ2WEhwaFc3bnJoTFRuUFFlaC9wRXFx?=
 =?utf-8?B?cGhZeThVeDNTS3R2cDlCUStvL1k5V2E3RldJbk5aK2ZqajhtVzQ0N1c0dEJv?=
 =?utf-8?B?WTR3Mms0TjRGaWJxWWFheWNBQ3BQWlRabkx1dUVqNTZSTEd4U2lYcVVBMUpB?=
 =?utf-8?B?TmZPSlFSbVRNWW9ZY1BQRzgzRWlBZ1RRVVRSWjRQZWE1RFRsdHBuczBMOEhN?=
 =?utf-8?B?Y1F5cldKV1kxdnJvK2lLelVmTHZvL3dWcTdFSFcxbmJvN0lBVE5oMm1ROExF?=
 =?utf-8?B?dDBTUWRMblYxK2FORVNYZVRSR04xSk5SMThTL01wNDY4RHliQ0dEbFcya1lH?=
 =?utf-8?B?WjV6UHpSRFlEUHU3aDE3d1FxQUY3QktRVDNHY2h4dVVKUWpqRHJDMWtpZHhx?=
 =?utf-8?B?c29ERUhveVo4dHhBcHFsSjdYUWNrbkV5YXlmWThTUUlLNStVSS9lZlBscEN1?=
 =?utf-8?B?andlSjNQRSt3SnBrLzlDRkluWThOVGZCYlZNa3hBaGEwU04vd2VyN3dXb1lR?=
 =?utf-8?B?ak12bXZ3ZTVySG5MR0t4UXBqcCtGS0gyQ0NDd3dOTlQzeG50MWlCV3NtaGJp?=
 =?utf-8?B?Ry9RNFd1TktKYTRoQTlTcFBxT2dlcVI5NkV0SytmOVV1eVRMMjJBVWlLenRV?=
 =?utf-8?B?SVRqVENOVVppVkdrRGNLUmVkcmc1MmpyeEhDUGFiL3pmK3JEaWd4TWJRUDUz?=
 =?utf-8?B?eTVCVkxtdDlLK0R0OUM5dTlaTm1pZGczbUcweEREbWRvWFVOcEJrTHhRYWhh?=
 =?utf-8?B?T3YrbjZYRmxKOXo0R21TZjBWeWdDcFlKanFJOEp0VFYrcy9ONlJzNHUvNXhW?=
 =?utf-8?B?UStRbW5SZUROalRTMnd0eTNIckk0L0J6bTZYR29OckJWalBjdWhmZkRPUGF6?=
 =?utf-8?B?L0dNNko3ZDR0M0pkSlJvWWFoY3VOVFVINSt3U2psblJYUVEreDRrOG96b3pE?=
 =?utf-8?B?T3RsMkxPOUR3MUhUVkp5em5EeTQydFBXTFVKRlBXMWZ4NU80U1lJNVZCVDhW?=
 =?utf-8?B?dEd4SVRDRWNhMUhFT09EdGtUOEdvRGdyaGRHMHA2Qys1aGd6V0o1OEo2aHlH?=
 =?utf-8?B?cXRtdHZmcHZkaW5ZZ1U2U2tMSit0bHNkV21vVmx1TWMzU0VHaC90amR4aU1Z?=
 =?utf-8?B?aHlza1laS0ZsVFYrU3pmZ2xaTk1JZlltbUhWTnpQUWZWT3BReHd1MHB2czNq?=
 =?utf-8?B?azREZmM5eHZCN05paGdBSkk0akd0Q2VlM2NhQVIzTmZEeWVMSUUvODB0WTVk?=
 =?utf-8?B?b2F5cWx4TkxSRHptSXRTcng0cWc4VUZ3YUNGaGVUYStPS1d3Um9ldWJxeVha?=
 =?utf-8?B?eWQzQWhCODgrSzI5YXl3a2lFRHdCMFBOcXBhWFJkMGFTc3RHTWoyMFFuRGVI?=
 =?utf-8?B?aUhLdnZEbkhENndlbVFWaCtLMkZXYjNkMW1EcnRGOUNHSTJwK0t0TWREZFE1?=
 =?utf-8?B?NnZkQVB6SXpDemNJd1Ywci80ZnV2TXJiUXpkd2E4MFNtQXdoaXFkeUdjWjdo?=
 =?utf-8?B?dmNZSm54MEtwblBXZjdSTXVTaEcxeU43UyszRTZDdlJsWkFIU1hoNmQ2Y3oz?=
 =?utf-8?B?V2hrNkZJbzZxbER4OVVBVEZpUzY0alRIY3lWOFV1bURvUlMvbVR3TVpjbGx3?=
 =?utf-8?Q?leT8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkJEVU1EZDU2UXdQeGhFU1hJbXpycVErTHlyaEpYOHh0cGVkSm13bE55akQx?=
 =?utf-8?B?MlRkM05XdjVTN25Tem4wMW9LZmxKcTVId1I3SzVqajFNZnladGJhY0NjMUMz?=
 =?utf-8?B?cXk4N3lZUTRTVDhBejlmSVRxY1VnMDBFYmhBQ2V2bUhMY2RacGlWMUp3MFor?=
 =?utf-8?B?VGhSZTVuMXBCQkxGRVZqa1dMTjl3V2RlaGlqeXkzMVpCUUgvU0FwbEVBMmxt?=
 =?utf-8?B?TjYvcGZkNGRoTnFxN052VTR3RzFReEVmOWZNQStwblRsRlQyZEpjWUVFOE5J?=
 =?utf-8?B?UU1xOXU2K3k1ZXhFcnA0RXBndEtsTVNrUlBNbjZaYlBXNHlYOXFJQW5oNEh1?=
 =?utf-8?B?cWVyaHRYN3pPNHdVb1N2a1VaNGdobkVxWU90Q3lTWWhpWUg3TnYzSGVJTnFR?=
 =?utf-8?B?dVBBbmNqb2RWcWh0ZURsY2VLcUI4dkJ6RmhjZU9QOXZlQ09ETnE2elQ1eWxH?=
 =?utf-8?B?TGZMZVBLWXQ5cjhGVWY0eWdRdGxPZWFsRGZqcEQxWkk2MEdpWFhCS1VtZVNP?=
 =?utf-8?B?STZBYTV5Z0x3bkF0QURXM3cwdXp3TzZYR1JsRVBhQk9WWHZIam42bkhRaXlq?=
 =?utf-8?B?bDJMZE10UmlLNjVEVWRBVTVieXlFZDZlc0orOStjZURhRnBEd2h3dXpXcngw?=
 =?utf-8?B?U0VFRWIrbVdhem5pZVZpWXozYm5OT3E1cTZKYnlaZjREeWd1UmpRS3NaQWZu?=
 =?utf-8?B?VDRpL25DVlJtOFgyZjc0SnplQlVISGQrQnJCbTQrbms3eUVCUUh5Mjhxc3Fo?=
 =?utf-8?B?L1piTVo4STdVSGRxd0pGZ1BjMGxMb3JjVmtIV1JxckZxOVJ3dVpFUmc4dk1C?=
 =?utf-8?B?VEtCOHFxUWNoM0lBbmFWSWpmLzhidVVDSlpOdlk3cjZYU3VBOXl0QmFVVm1C?=
 =?utf-8?B?cHhFQ0VrcEJvRHVRTFBLMWlaaC82a1M4U0gwVDgzVjRscmRoNTJjekY3bE1q?=
 =?utf-8?B?Q3Y4NlpEamVzeUxqZjFyUWd6L1VqNEVtS1FGZHJRTVN1czVkeFRJZUt4cFlM?=
 =?utf-8?B?ZnBvTTBocEpOeEtrZ0tENFhxN2FIQ09SWE9DYTZmejcvcGZMcW9oY3Nia3Vn?=
 =?utf-8?B?YTFCRlJKNmhPRzQvai9RSHU1SUJ1NG52RUsyM3Z4RGdjOVhNcDRkM212Yzd2?=
 =?utf-8?B?OWRxRkNtTnZwa2t0Nks5aTN6YjYyNHRnVWxDV3RmN0xCRGsvRTZBWTlOVjBI?=
 =?utf-8?B?czYrWmlWcXVRTnpqK2lBbkJhaXJUMCtibkhjR3RPN0E5cHJNdHNDQnpvN29T?=
 =?utf-8?B?S292SGc1OFpUWGZYMk16RVM1ZllReHlQMkpsM29IQXlCNUlLNUpEU0hhV3pF?=
 =?utf-8?B?bkllbWYxL1ByMXJiYkVlWW50dnZJMytQVnY2UjFDUGRDcVZ4cTBvRnF1ZEdF?=
 =?utf-8?B?emt5UTgvRkRtT0FUc2VURVBEQkhGK2hlV1dNd08xVW1CdGVnb21WaVJkUzFU?=
 =?utf-8?B?MGZGYWlZRjdlK2lyYU8reHdlcUZwZFNadjJPbWNjZkJlKzF1NWtMU2EvcWd3?=
 =?utf-8?B?UEw4cDZzaTFaSFE4YkxNMEF1allYVGRkemFxVGlDeWt1aHlzdE9Sazlqb3pV?=
 =?utf-8?B?R1pwVnV4cTdhZHM4R1FGQXlNZllpbzBEdlNWZnRtV1E2eHppeFFwRW1jclNx?=
 =?utf-8?B?YmM4ais1OGlINkZ6RTBLd0RwWHFndDE4QmtyS21rQ2FQc3F4UXp6K3I5ZVE3?=
 =?utf-8?B?SnVSYlNqV2VibDVYeDRwY3dQaGNWMU5kcVQwdGREQmVPTzRIS2l1WUdMTU9r?=
 =?utf-8?B?UVd4dXZvaXpOR0tLbnJGblFkMTcvZ0huc1pVVHdRR0NqUlBFWmprUERLNEJY?=
 =?utf-8?B?MXN1YjlWYjUyNGF1bVpkRklqVFBZZnlUWmdXTzBWVytVK3RJdEI1SXJyd3Vr?=
 =?utf-8?B?dFk3TUMrWUhTbHRReTAwV2NaamgzeDJsVXZwNFJjc0hsSGNNVGYyd1JWZHVs?=
 =?utf-8?B?SERMQmt3MFFoTGMzK0NEc3pqOUpLK1dDSitkUXJnVkxoUU53YzdBcnB1Skor?=
 =?utf-8?B?c0xET1RtaE9Sc1dsUHFpOTJ3SHhFNjk4Tm1nYXhhb1FyS0FNK21qM0g4Y3pz?=
 =?utf-8?B?QjErbk9QUWNwYWRydUVIMXNmdUFsUm9Ra2h2R05La1UrRHdnS1U2UUI4S0Nu?=
 =?utf-8?B?RXF1azBPMHE5ZytNM1R3bXlBaG1jU2s0MERTUTlTWk5oRXV2bkpLcFByczA3?=
 =?utf-8?B?YldHNE5ZSzZpMUFkK3Zyb3RrZ2FQeExjNVlySUs3S1hlSnlTdVRhMzlWbHV1?=
 =?utf-8?B?Z2ZxbFM1bHpUNGZDM0Q5NE43d0JkeXhybmhKZTB2enRGV1RpcWVib2tFdDJY?=
 =?utf-8?B?cUUwWENnckQ2a283UDg2SDhnNWU2L1BWcTJScDFEN2RlUVM5YmxGQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b081fc8a-3f11-43e3-3fbd-08de5388232e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 16:15:30.7738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bnh7l1rtBoZglB5Xhaxti+GKVGajUo8yAG/vlLCthj+ymSn3ULmXIF2jrMNUFPGDQ+5mSWVf+5Ls34uDcNbJJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8210
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

--------------TjXUnWlPbxs5e2AQmEq0G9d2
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 14-01-2026 18:30, Sk Anirban wrote:
> Prevent GuC firmware DMA failures during GuC-only reset by disabling
> idle flow and verifying SRAM handling completion. Without this, reset
> can be issued while SRAM handler is copying WOPCM to SRAM,
> causing GuC HW to get stuck.
>
> Signed-off-by: Sk Anirban<sk.anirban@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 ++++++
>   drivers/gpu/drm/xe/xe_guc.c           | 37 ++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  9 +++++++
>   3 files changed, 53 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index 87984713dd12..2f38fd231083 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -40,6 +40,9 @@
>   #define   GS_BOOTROM_JUMP_PASSED		REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
>   #define   GS_MIA_IN_RESET			REG_BIT(0)
>   
> +#define GUC_HASH_BOOT_CHECK			XE_REG(0xc010)
> +#define   GUC_BOOT_HASH_CHK			REG_BIT(31)
> +
>   #define GUC_HEADER_INFO				XE_REG(0xc014)
>   
>   #define GUC_WOPCM_SIZE				XE_REG(0xc050)
> @@ -83,7 +86,12 @@
>   #define   GUC_WOPCM_OFFSET_MASK			REG_GENMASK(31, GUC_WOPCM_OFFSET_SHIFT)
>   #define   HUC_LOADING_AGENT_GUC			REG_BIT(1)
>   #define   GUC_WOPCM_OFFSET_VALID		REG_BIT(0)
> +
> +#define GUC_SRAM_STATUS				XE_REG(0xc398)
Fix the indentation.
> +#define   GUC_SRAM_HANDLING_MASK		REG_GENMASK(8, 7)
> +
>   #define GUC_MAX_IDLE_COUNT			XE_REG(0xc3e4)
> +#define   GUC_IDLE_FLOW_DISABLE			REG_BIT(31)
>   #define GUC_PMTIMESTAMP_LO			XE_REG(0xc3e8)
>   #define GUC_PMTIMESTAMP_HI			XE_REG(0xc3ec)
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 44360437beeb..b5ec08a16aaf 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -900,6 +900,35 @@ int xe_guc_post_load_init(struct xe_guc *guc)
>   	return xe_guc_submit_enable(guc);
>   }
>   
> +/*
> + * Wa_14025883347: Prevent GuC firmware DMA failures during GuC-only reset by ensuring
> + * SRAM save/restore operations are complete before reset.
> + */
> +static int guc_prevent_fw_dma_failure_on_reset(struct xe_guc *guc)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	u32 boot_hash_chk, guc_status, sram_status;
> +
> +	guc_status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
> +	if (REG_FIELD_GET(GS_UKERNEL_MASK, guc_status) != XE_GUC_LOAD_STATUS_READY)
> +		return 0;
> +
> +	boot_hash_chk = xe_mmio_read32(&gt->mmio, GUC_HASH_BOOT_CHECK);
> +	if (!(boot_hash_chk & GUC_BOOT_HASH_CHK))
> +		return 0;
> +
> +	xe_mmio_rmw32(&gt->mmio, GUC_MAX_IDLE_COUNT, 0, GUC_IDLE_FLOW_DISABLE);

To function RC6 properly re-enable Idle flow after reset.

> +
> +	sram_status = xe_mmio_read32(&gt->mmio, GUC_SRAM_STATUS);
> +	if (sram_status & GUC_SRAM_HANDLING_MASK) {
> +		xe_gt_err(gt, "SRAM handling not complete (GUC_SRAM_STATUS: 0x%x)\n",
> +			  sram_status);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
>   int xe_guc_reset(struct xe_guc *guc)
>   {
>   	struct xe_gt *gt = guc_to_gt(guc);
> @@ -909,6 +938,12 @@ int xe_guc_reset(struct xe_guc *guc)
>   
>   	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>   
> +	if (XE_GT_WA(gt, 14025883347)) {
> +		ret = guc_prevent_fw_dma_failure_on_reset(guc);
> +		if (ret)
> +			goto err_out;
> +	}
> +
>   	if (IS_SRIOV_VF(gt_to_xe(gt)))
>   		return xe_gt_sriov_vf_bootstrap(gt);
>   
> @@ -931,7 +966,7 @@ int xe_guc_reset(struct xe_guc *guc)
>   	return 0;
>   
>   err_out:
> -
> +	xe_gt_err(gt, "custom GuC reset failed with %pe\n", ERR_PTR(ret));

Rephrase the error message.

Thanks,
Badal

>   	return ret;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 5cd7fa6d2a5c..ff2efc7a68cc 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -73,3 +73,12 @@
>   15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
>   16026007364    MEDIA_VERSION(3000)
>   14020316580    MEDIA_VERSION(1301)
> +
> +14025883347	MEDIA_VERSION(1301)
> +		MEDIA_VERSION(2000)
> +		MEDIA_VERSION(3000)
> +		MEDIA_VERSION(3002)
> +		MEDIA_VERSION(3500)
> +		MEDIA_VERSION(3503)
> +		GRAPHICS_VERSION_RANGE(3000, 3001)
> +		GRAPHICS_VERSION_RANGE(3003, 3005)
--------------TjXUnWlPbxs5e2AQmEq0G9d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 14-01-2026 18:30, Sk Anirban wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260114130015.3917770-6-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">Prevent GuC firmware DMA failures during GuC-only reset by disabling
idle flow and verifying SRAM handling completion. Without this, reset
can be issued while SRAM handler is copying WOPCM to SRAM,
causing GuC HW to get stuck.

Signed-off-by: Sk Anirban <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com">&lt;sk.anirban@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 ++++++
 drivers/gpu/drm/xe/xe_guc.c           | 37 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  9 +++++++
 3 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index 87984713dd12..2f38fd231083 100644
--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -40,6 +40,9 @@
 #define   GS_BOOTROM_JUMP_PASSED		REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
 #define   GS_MIA_IN_RESET			REG_BIT(0)
 
+#define GUC_HASH_BOOT_CHECK			XE_REG(0xc010)
+#define   GUC_BOOT_HASH_CHK			REG_BIT(31)
+
 #define GUC_HEADER_INFO				XE_REG(0xc014)
 
 #define GUC_WOPCM_SIZE				XE_REG(0xc050)
@@ -83,7 +86,12 @@
 #define   GUC_WOPCM_OFFSET_MASK			REG_GENMASK(31, GUC_WOPCM_OFFSET_SHIFT)
 #define   HUC_LOADING_AGENT_GUC			REG_BIT(1)
 #define   GUC_WOPCM_OFFSET_VALID		REG_BIT(0)
+
+#define GUC_SRAM_STATUS				XE_REG(0xc398)</pre>
    </blockquote>
    <font face="monospace">Fix the indentation.</font>
    <blockquote type="cite" cite="mid:20260114130015.3917770-6-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">
+#define   GUC_SRAM_HANDLING_MASK		REG_GENMASK(8, 7)
+
 #define GUC_MAX_IDLE_COUNT			XE_REG(0xc3e4)
+#define   GUC_IDLE_FLOW_DISABLE			REG_BIT(31)
 #define GUC_PMTIMESTAMP_LO			XE_REG(0xc3e8)
 #define GUC_PMTIMESTAMP_HI			XE_REG(0xc3ec)
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 44360437beeb..b5ec08a16aaf 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -900,6 +900,35 @@ int xe_guc_post_load_init(struct xe_guc *guc)
 	return xe_guc_submit_enable(guc);
 }
 
+/*
+ * Wa_14025883347: Prevent GuC firmware DMA failures during GuC-only reset by ensuring
+ * SRAM save/restore operations are complete before reset.
+ */
+static int guc_prevent_fw_dma_failure_on_reset(struct xe_guc *guc)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	u32 boot_hash_chk, guc_status, sram_status;
+
+	guc_status = xe_mmio_read32(&amp;gt-&gt;mmio, GUC_STATUS);
+	if (REG_FIELD_GET(GS_UKERNEL_MASK, guc_status) != XE_GUC_LOAD_STATUS_READY)
+		return 0;
+
+	boot_hash_chk = xe_mmio_read32(&amp;gt-&gt;mmio, GUC_HASH_BOOT_CHECK);
+	if (!(boot_hash_chk &amp; GUC_BOOT_HASH_CHK))
+		return 0;
+
+	xe_mmio_rmw32(&amp;gt-&gt;mmio, GUC_MAX_IDLE_COUNT, 0, GUC_IDLE_FLOW_DISABLE);</pre>
    </blockquote>
    <pre wrap="" class="moz-quote-pre"><font face="monospace" style="white-space: normal;">To function RC6 properly re-enable Idle flow after reset.&nbsp;&nbsp;</font></pre>
    <blockquote type="cite" cite="mid:20260114130015.3917770-6-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	sram_status = xe_mmio_read32(&amp;gt-&gt;mmio, GUC_SRAM_STATUS);
+	if (sram_status &amp; GUC_SRAM_HANDLING_MASK) {
+		xe_gt_err(gt, &quot;SRAM handling not complete (GUC_SRAM_STATUS: 0x%x)\n&quot;,
+			  sram_status);
+		return -EIO;
+	}
+
+	return 0;
+}
+
 int xe_guc_reset(struct xe_guc *guc)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
@@ -909,6 +938,12 @@ int xe_guc_reset(struct xe_guc *guc)
 
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 
+	if (XE_GT_WA(gt, 14025883347)) {
+		ret = guc_prevent_fw_dma_failure_on_reset(guc);
+		if (ret)
+			goto err_out;
+	}
+
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return xe_gt_sriov_vf_bootstrap(gt);
 
@@ -931,7 +966,7 @@ int xe_guc_reset(struct xe_guc *guc)
 	return 0;
 
 err_out:
-
+	xe_gt_err(gt, &quot;custom GuC reset failed with %pe\n&quot;, ERR_PTR(ret));</pre>
    </blockquote>
    <p><font face="monospace">Rephrase the error message.&nbsp;</font></p>
    <p><font face="monospace">Thanks,<br>
        Badal</font></p>
    <blockquote type="cite" cite="mid:20260114130015.3917770-6-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 5cd7fa6d2a5c..ff2efc7a68cc 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -73,3 +73,12 @@
 15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
 16026007364    MEDIA_VERSION(3000)
 14020316580    MEDIA_VERSION(1301)
+
+14025883347	MEDIA_VERSION(1301)
+		MEDIA_VERSION(2000)
+		MEDIA_VERSION(3000)
+		MEDIA_VERSION(3002)
+		MEDIA_VERSION(3500)
+		MEDIA_VERSION(3503)
+		GRAPHICS_VERSION_RANGE(3000, 3001)
+		GRAPHICS_VERSION_RANGE(3003, 3005)
</pre>
    </blockquote>
  </body>
</html>

--------------TjXUnWlPbxs5e2AQmEq0G9d2--
