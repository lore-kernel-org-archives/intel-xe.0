Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E30C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 04:45:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2987A10E03C;
	Thu,  3 Sep 2026 04:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P1rpeapw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F00410E03C
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 04:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788410740; x=1819946740;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=74Y8t59H043ARh4laajAVvq2PMZy2OTxUbcYRGd6ZT0=;
 b=P1rpeapwBd4C5CFIyK5Li4Wudo4TQElbVsI4tneYUPtp1YmBDzZlBsr8
 hoI5zH36Nx1AtsbarTSQjx3Nbp93d6NPDMGfxGlyoxEb97bzVFdYnKdip
 PyoNZ+gPAYu2AMsmBy/eQ7JUN8pteYljUeF+1wb4TnVhhPs2uXSvfulH/
 pVBoC1eR3AvIgAyrXlBc+vXyvp0JBgP/pk7IuyheeiUAVYGZ4OUN9qlD0
 /ZPBPmxEBm5DJ51jaq9tAUXAEi4xmgy+pQYCG/ykcHtPJcOOEKgmjEqYc
 z2H+Ob/1SpBqXXIeEqZls8u/Qck8z7M4Lm1R0THZTmPLGBZnByvYtON/I w==;
X-CSE-ConnectionGUID: Ysi/HaOzSa6pflMGol3qHg==
X-CSE-MsgGUID: TzfNAT29QESLnSGpdw16OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="114420573"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="114420573"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 21:45:40 -0700
X-CSE-ConnectionGUID: fwhksjtTQuiqoM6qGG32Jg==
X-CSE-MsgGUID: fs4uaUZ1See9prtp6ui16w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="293102196"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 21:45:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 21:45:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 21:45:39 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 21:45:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qsvb4gVpl01+NjdqU6UVyWasCU/9YRxh/jYYoPCu1T/23YnNWNdHLGKwDsQwOyw6mrtPPOcHWeYkSOuq1/eAmUU5NZ5hHQjw2qKNouep9oKYqi52k3gpA/UueGU4VcJBSVCaTzy92WwK3zqInDUDMNzCGSzXQgx5VVesAibGSiSLY1lg7lLx3bLfheA6l13gRLpJZjVjoG1ZPS9nyMPildPH3aRoSY7h23zYWyyLCFmScgGc6mXSyKwC6ZoRI2C46yui5tWh1SRU0kvnf3EKTUmkbkFTVGLEewOURKmrxKrWqMIURLRWXwXJqGgoHkfwQY1qcXWbb3cWZSL39RzkwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/9qoHuXto75d7Dbmn4RbtlIvYNdE3UgahCqznYeEGI=;
 b=dnhF95nan3Ih6acVoYUV3/kY56NKtgJJn439GoCVb9lBJkip4e/YggVpH0c+uhSN/oEGnDOK444BuI6jWEaC+rE/nJdMQM2hL576YkciNppHkGZerBApODs7OxoxPJwi/R28XCs5lgYEnwRJNavBKd6HChFrYWay16VzCO/RNDj1VL2zsFuDVIGELlMrOA4ToFeqs2m/cpTzQHSrWTkPRyuiy0IEU/Ghv4M6N+0BVRjX0FPniEbDx+TZlix41G9MB85COAf0Z1+xSnqRQynjXPyQn5mJcU69yxT49YdhoRFbWV4ImhFxbdiH8Lb/xnY6ZuwSBsuYGBY0meVqS44fKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 04:45:36 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 04:45:36 +0000
Message-ID: <24241b0a-487f-4600-b305-0a0b5f7ce329@intel.com>
Date: Thu, 3 Sep 2026 10:15:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/9] drm/xe/sysctrl: Make sysctrl_read_frame() void
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <anoop.c.vijay@intel.com>
References: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
 <20260831104456.1770605-15-mallesh.koujalagi@intel.com>
 <acd3d811-fa93-4d93-b21f-1ebeadc58099@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <acd3d811-fa93-4d93-b21f-1ebeadc58099@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::15) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SJ0PR11MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ab8d75c-0130-4d36-71c4-08df0976323a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|18002099003|22082099003|4143699003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: z7ESBRGNVYu1xrYOI2jE2btXP+jjmWlBJwU6ljKKc1lZjuhNpY03cilhbalpeSPNbnn8WHPOeTfx10ilcUw16lc8NCAlbpip0LJlhyYKcHTqK4yjIrGg4hI627xWjBgX/kp9yUTnMSkEpJ1f0yQFmQFyfZYVCX5KYXQMfVK2AiyPI2T7RFtgCCCz5wOsHXDvdyDv2pQGSvOs+lRD2R49uOSYAp96RepnBTXvcZxLlHZtWSKbr0mEDydobQ502eD6plheT9SjLHsefrJyTcWyt4XKn6heneaqpsOEkx0ds44KlR3KoJkoV7aCTYyQ2OAYM1Z9zylDAqBIsJ7mUiZJqH3MpnBblgnNXrU61/VxtSdk19kZnfacxjHdgN0TYka3mnJ8zsYKdfOGAuktnrvur+B2agz1QYAyB77FcD+olMxEEOP3CJ58GpLUjykV43g1eoozqQftW+JCWq5m6w5b/NOTiNwX3Rd5ho2E5tImMrcUAzLE49SBK4kuBFwxl6/7UomL2XykL2M3HcSMjgfE85gQ4nvUcbC9TzSozze5iFt0PQQgFHc8o3FuwCOZ6Ej/xSTbbNVOo+wqVbu4TwiHgRnQdudFczKMsYkiiDBtIVdqQhgfb99IzVIiRWo/QgIXUvbHQ5Ux/QWkpA97/QNe48ovJZFHrd4LoOJflrQ546w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWY5d1A0SFJTS21XVVZ1VXRKZmNkRHJXdy9sYUZYOERkWEVXeCtCbnEyZjlY?=
 =?utf-8?B?Ym9IcWttL2xFeVNUNE5nTFd3TTcvdzN4eWZUb3hiOXlDKy9GNm9hTzc3RDNu?=
 =?utf-8?B?TEFPK1QrcEJzeVBYeCtadWtPblZzeU5GV3Y5V1VOV1J0bTQ2b3BQUlhRMjJ3?=
 =?utf-8?B?L2MyN01vRk10Rnh5VUtaKzZVTUdNak9ya1JMOSswelBuYSsySVRhNU0yWUN3?=
 =?utf-8?B?V1UvRjFpQmppVXdWZjBPTy9OYWw3Vjk2bmErSEQvdFJRejZzRlZ3S055TndZ?=
 =?utf-8?B?ekk2R2s5TVl6RkJ6MlptYXN6bnZhNFZrU3VYdk44ak84TkE0c2ZKeHdpYzJ2?=
 =?utf-8?B?SXJqVm5FM2VDN0ZmZmpuMkE3ZnNoNHZwcFRQZ2NRbXJjRU5lL1ZkTkdVL2lL?=
 =?utf-8?B?aU9yekxFbVFqM3pMTDRJYnVNR2lqTHN6ak1WVmVEYW9vT2dMaWFrL3hhMUo4?=
 =?utf-8?B?RlRPSU9aZDIrdXBVWW14Qm8vKzRab2xTdHIyNmwrRkIweC8yeHVLTGxobmxS?=
 =?utf-8?B?WEJOZStBOGJiMVhwTStkNm5GV1VQZGJCUTNiNktGV2NDZWgyVGtqZElhc2dI?=
 =?utf-8?B?YVJBcVM4RFN5Nlp1NGVWMXF2WG9qc1dWK25XeUpTMnRnREhyYjhJVkRpMVBs?=
 =?utf-8?B?WmE3Y2hnMjFxVXFBV0Q0VkRYY0FBNmNlYkhlNkRvZndKYlZJMGtPdXYraElx?=
 =?utf-8?B?OEtIdE00MUJSTHRsUEZUVTZRUkw1UTBHWVAwWjJQWlVPUGlNZ2QyRHJXb1VS?=
 =?utf-8?B?cUVmR1R3MGlmQ3BqZlBpK1p4KzJjaGQ5NXlsQW5SUHBZdCtQY3YySzU4REhG?=
 =?utf-8?B?Y3NUSXJxdGkvU2dsUllGV2hTUFRRK3RMbzlZZExPNmt0bFBnQnUvTUFxUitz?=
 =?utf-8?B?NWw1MWI4TmdPbU9lclBUV3ZkVDdOSW9LaHlTVHJERXFoSnRvM2pzQyt0WXZN?=
 =?utf-8?B?Q1FqbGM4SlBHSDNYUGtZL0w4UThOZzFZUUZIVDlRa1hXQnVkWVZ3OVRvOWVh?=
 =?utf-8?B?RjJJejB3VWVhOGhVWEZ2N3cwUkJCMlFQMFNDc0dndWloYkVESzNNajg3T3Rj?=
 =?utf-8?B?T3M3Z2tZNTRlMnJBd01mUytSem5yNnB1M2ZEV1MwZEY1RUd0cndram1oSWFM?=
 =?utf-8?B?VWtQYWZydEpJTUxldm5PZE15QkorSTBsalc0ZDFLOG5RRVV3ejhaWCt0bDds?=
 =?utf-8?B?REw5SHJPRVlVZ3htVUI5WC9yOXRkR1BFVE8xUFVWdGFGc1BIN0ZOMGlidlI0?=
 =?utf-8?B?OEtrSHoyL0RWOU45d3FpMTFvdThIS0VPVFNpQUY1dCtYMTBxa29XRjRvZUI2?=
 =?utf-8?B?cEJPVEhCZ1FzNFJEQ1N1cVh3bitxUWtRc0ZzOWRKN0I1dnAzaDVIc3NjUmNI?=
 =?utf-8?B?QnRSL0puRldCWWpueTJWZkoydlNtNnM3YmNodFpOZklPMEluYVB1cVB4M0xx?=
 =?utf-8?B?MDB0T1ZJeVZxL1lZMzRQbFlvNEI3Q2FRRWJCSTNHTjVETjFXRWZVWnpXOERi?=
 =?utf-8?B?S3hRVHAxSHNyM1BwVjZKMFpMdGExN0dwZGNiZElPVkVrRkdaWnhRSTJ3VllD?=
 =?utf-8?B?ZC9DNGNtSFB2aXpnTVVLUTZ2ZDNUZFBzQUV2bVZyRUdETDdPZHZrdk8rYkFy?=
 =?utf-8?B?bWJvMjJaY1NFSHNaZGRraHMwSTNncHNSUGxVNkV0YnFxY0J2Ky8vS01URVpp?=
 =?utf-8?B?S0drbGNEV3FGWEEvTWNHL0lVOU1ydkc2VytPSU53L214bkdFczJubmo4OG1m?=
 =?utf-8?B?aTQrQzJ6TkJNZ1hQc2xiVytyL0wwZ0Z5NXplR1BhMjlyL3krZEoyRUExQ1BY?=
 =?utf-8?B?TWRDdFVKVVhvSTA2bGI2TWVndXAvNDdBK1RmUnJNbVQybFJ3bnpFOXNmNFNl?=
 =?utf-8?B?RlFBeFNEOU1uZFYvbkpmMjlObXA5cEkzbE85YW1pY2lRVWErcDZyeG5ZVk5j?=
 =?utf-8?B?VU9YS1l5Uk9HOE9JaXE3RThIRXVKVXIzY0tqUkdLZ09nc1ZsYVhmNDVvamRG?=
 =?utf-8?B?cVQ5S2JNZmhtVXoxek5tTWJzYndBbVVoRm45TE5SUDAwWU1IWTVlTDVOb1Ns?=
 =?utf-8?B?Vm93b2puYnVUVXEyaVVxdWVGZERrdUNGdVp1QTVMd0QwdVIwcUMvdy9BS2pz?=
 =?utf-8?B?VXI0UHVBSmkvd0J5T1ZQN0RLdnBUTnFHT3hhZFI3RWRKOFFETk1ObGRaaUhj?=
 =?utf-8?B?ZmI5dW1GcFFyZFJpRDdoY0dlT1I0TU5QMUZlNzRxQnNHcFR1RnlNdklvbEMv?=
 =?utf-8?B?TmZNaGNsVEFCOGpKbDJReGxuUHgyeGkrWHVrRFdCcHJBWW96ekRRWmV0VjBY?=
 =?utf-8?B?NGR6MmNTNEtEVzVQR3o2eTBuZVVjbnlDWDJ0ekFKdGd6MmdjTFRTRjV6NVMz?=
 =?utf-8?Q?p1MNymTJo16vGV+A=3D?=
X-Exchange-RoutingPolicyChecked: 3EqbRB34A+FPsWlkl4Mplk4y/YM52qzTLbya9Dc2Ixshgak2r/xxi5uGsnB+bgwirMvhJNcP5H1khVaT1Ri5Zcn6k0gtDYC/DxuoSABaW4wiUT1ALFgflkp6EqdR+xzbZXrTjk/49UgroRg6aNnmPpYmxel4BE1qVxMo70I3yzqzA2e+tF3ClTrocXcIO4ypIefROFS8TOWggx5vR2GyViRBfvY6+ftW8bJgoOXYhvbCvkzvYOlcsbjhFt5qvVWGBuUpLGuNLsLh0ye0lGSeW2HF7arFSpy+DYpIOHPP3kcSXi/haPZzN68/Aql3KF3KwsHpyhy0KoGfSWvr6W+kYw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab8d75c-0130-4d36-71c4-08df0976323a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 04:45:36.5468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yW/LirxnsV+58cy0aoZipq6tN2X1eKLV7QZdvUdYPhIV8kQqSyDrMiClJmLvJ1hGi/BldUQcF9cDCyZkFyXx8DpROQtMHX2EjIiIotgvwns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5867
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


On 02-09-2026 09:46 pm, Michal Wajdeczko wrote:
>
> On 8/31/2026 12:45 PM, Mallesh Koujalagi wrote:
>> Convert it to return void and remove the unnecessary error
>> handling in sysctrl_process_frame().
> ... as there are no places where this function can fail.
>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Thanks Michal !!
>
> (a few tags Suggested-by: wouldn't hurt either ;)
Sure! will add.
>
>> ---
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 11 +++--------
>>   1 file changed, 3 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> index 3ef60067e226..4841dd7f2724 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> @@ -68,8 +68,8 @@ static void sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
>>   		xe_mmio_write32(sc->mmio, regs[i], val[i]);
>>   }
>>   
>> -static int sysctrl_read_frame(struct xe_sysctrl *sc, void *frame,
>> -			      size_t len)
>> +static void sysctrl_read_frame(struct xe_sysctrl *sc, void *frame,
>> +			       size_t len)
>>   {
>>   	static const struct xe_reg regs[] = {
>>   		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
>> @@ -85,8 +85,6 @@ static int sysctrl_read_frame(struct xe_sysctrl *sc, void *frame,
>>   		val[i] = xe_mmio_read32(sc->mmio, regs[i]);
>>   
>>   	memcpy(frame, val, len);
>> -
>> -	return 0;
>>   }
>>   
>>   static void sysctrl_clear_response(struct xe_sysctrl *sc)
>> @@ -194,10 +192,7 @@ static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
>>   	total_frames = FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg);
>>   	curr_frame = FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg);
>>   
>> -	ret = sysctrl_read_frame(sc, out, frame_size);
>> -	if (ret)
>> -		return ret;
>> -
>> +	sysctrl_read_frame(sc, out, frame_size);
>>   	sysctrl_clear_response(sc);
>>   
>>   	if (curr_frame == total_frames)
