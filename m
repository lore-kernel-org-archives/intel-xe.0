Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA742C624D6
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 03:13:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6433D10E07F;
	Fri,  4 Sep 2026 03:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VCYmPSDL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E770E10E07F
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 03:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788491598; x=1820027598;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=xqeCW+HfgeEu2El/0hBNQEY2vmtJyIwaA2m+a4tYQ4M=;
 b=VCYmPSDLe5SyS079iDykCab97P+xEsh+s+bQgMuPwttINbaKjKuC+7pb
 0w7J0pXLaZ1cexkBEiQao8pjgyIcUW7mULq6S71bDr4eCk8o0+Wd9fUrI
 T8APap8iEnxpeIFVQZHCSHLaxA6Sl+HeC5hGbzNG2anrOfnTw6IYcvxX1
 E7Wz8obxPUb2StLTk3e9cpngGfBS6AnEhTpv37TvVfGI5bKEq+c6VYc2C
 0YRTzAmzikV4mWladPtfpD9oTLzxICeBLSI8rZRNGIgUxF0lS4+8pAnl4
 bWgw8bRewnObcl/BcnzXSwRmd4oOksmK8510bMr2ajiHAps2TM2xLplOH w==;
X-CSE-ConnectionGUID: sED2h5/fTwe54GPodkmd7Q==
X-CSE-MsgGUID: aFBmM3MATg+7xDqdejDa9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="106356531"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
 d="scan'208,217";a="106356531"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 20:13:17 -0700
X-CSE-ConnectionGUID: lmSuBFKcT1eRU3zcj4b3og==
X-CSE-MsgGUID: jWfocra2STq0npL0TVE2oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
 d="scan'208,217";a="308136340"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 20:13:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 20:13:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 20:13:17 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 20:13:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qw6W8KSLTSKpmJvQHEshA75SzBVrOfnK2r5IANzwFA/Em7vVMRDS2fZhBg2LPUpdsYrUxYPS8dWc/BOWVQO5aHsO8ciwkf6+DF9ekqkz8Ar5xDLIGEeKgdwMzEoNH0tyd/ap1DVXzwJ9WQR1VMpcLzTX7pudM21Dapt9n1MpBUdrFygpouDcXmNwE1DdTt3AFtIKwBFdndvz4H/0pcdCd+S/dzlk+67ty6v7pzuE3rFbaquqCOIvprYZ80cv4yCgtxo+NTec7hxYWuYj2EgQ1gc0vHY89dRw4FGmxX0NVLIWZqicJ8Djmr7jXMePBvQBWoLwDBc+uwNcTZwfmOgjEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6q0phXpDWfKizjlvhIiDU+8IbGt4SIXm31pXAqnOkDA=;
 b=w+LY5ZGKaUZroUK96CsCgIFarOfa3WBVgjyaKZK5gavwqnxx+xad7pmUvvYQrQe+QU3ire/9WfgTBwTgs7q33qLarUM9Ffpg+EgGZP+vFIq4iGdq4s3Qx3U/0FX1G5CV9i+uzTM9Gziu+nL3hTzLckA9heX//uKXMMz/psxMkY/V1ie3bqP7A7OfxzViQA5TKrIzeJybw7ehEaOO/40rD7QTWZJiJjT8CQ+x0WCKz0NZPZ5HYoRpkGoxU2OmjFNWwVp1bi61xeue9ixHpVUViu6t6zj3zN58WJRJcpW9ikRVUF3P8ZPA+p1N+4uaX9qBaacjpnroTzsU6f2bPadg0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7556.namprd11.prod.outlook.com (2603:10b6:806:31f::21)
 by DS4PPF1B1B74C09.namprd11.prod.outlook.com (2603:10b6:f:fc02::e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 03:13:15 +0000
Received: from SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c]) by SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c%6]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 03:13:15 +0000
Content-Type: multipart/alternative;
 boundary="------------oBNF2I2Ic8Z2WJzy0R2wBmIy"
Message-ID: <baeee600-4805-4fd1-a9b1-1f8c1595dfd2@intel.com>
Date: Fri, 4 Sep 2026 08:43:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] drm/xe/sysctrl: Add System Controller get
 application status
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nilawar, Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Iddamsetty, Aravind"
 <aravind.iddamsetty@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Luse, Paul E" <paul.e.luse@intel.com>, "V,
 Mohamed Mansoor" <mohamed.mansoor.v@intel.com>, "Nasim, Kam"
 <kam.nasim@intel.com>
References: <20260903140340.83500-6-anoop.c.vijay@intel.com>
 <20260903140340.83500-7-anoop.c.vijay@intel.com>
 <apnH4aA3m1B7UAkM@soc-5CG1426VCC.clients.intel.com>
 <62002808-d906-4cf0-a5f8-d5368ccb86a2@intel.com>
 <CH3PR11MB04614958B7615D42C3DD5A4930C1B62@CH3PR11MB046149.namprd11.prod.outlook.com>
Content-Language: en-US
From: Anoop Vijay <anoop.c.vijay@intel.com>
In-Reply-To: <CH3PR11MB04614958B7615D42C3DD5A4930C1B62@CH3PR11MB046149.namprd11.prod.outlook.com>
X-ClientProxiedBy: MA0PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::10) To SA3PR11MB7556.namprd11.prod.outlook.com
 (2603:10b6:806:31f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7556:EE_|DS4PPF1B1B74C09:EE_
X-MS-Office365-Filtering-Correlation-Id: d2f3c752-1cb3-4f4b-eaf1-08df0a3275f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|5023799004|10067099003|4143699003|11063799006|6133799003|3023799007|22082099003|18002099003|56012099006|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: rlx4jiIsBQKnzGut7IdWbVALcIGtCp3TTc/tkrbOsGrVBmZiidVmnS24JA8u1aPu2B4jATb/7uSQPN+x9ygr+w9PsJ6wZzEXP0rKyfIz8ItDmYaAyvOLwbZzPCHSy29y0wfVWa4J+9waN/gNDZRCIkQhYXcWDV+z6FZFCLC8yrnADJFxuAm21RzLuEG0QO2RdejQB5hT9g8zhDuK8D6W/J68Ghv076jyaU299swjyC6cqIOnqeXst3Y6SP89HAC92J4QhccieIXuXbCwhrrcaTqJbEtHuddDtk+Ho4VYEPKDHCY22jAMQZ22N/dKieDymjiizuMb+f285Se8TFupyejQU7ACiTSeJePCi0X+uKJZQ+6G3nE5zrynUZ/6Vc7XomkUNyQYzjGfBNO2gSKb8hY4U0Djk/yyL7PNNSrZBzywhGDze+UHJrOyl9Yi/2/cDEpLydgdlk6o8Eva5LDg/EmJVKtF+X+mLNdjBvcQJ/ZelG/3CNYOQikoldxYIBiqZOIA1ij1urCbwOn1KfNlsuCelqnnZJNVY3GGLgFqKLM+heE9DEDgDVToaTf9HXwAFwl03/TMAPbajDP3vgL7B9OWeY3tz4p1D5k+SuVlc1hSVo1MhTjALUhZK5fIPkdx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(5023799004)(10067099003)(4143699003)(11063799006)(6133799003)(3023799007)(22082099003)(18002099003)(56012099006)(8096899003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dk8zMTBjQWNYa21GbWNqQ2lBT0NNbXlVYTdkejF5WEQxWklsYjJkaE91RHFn?=
 =?utf-8?B?RWd4aCtDcStiQXUxdDFpeWtBbk1zY2wzbDBKNXpMSXR6Ri9sWXIrdkcrbi90?=
 =?utf-8?B?VDQzSEJQVUJsWWM5OWN5YjF4STUra2llajZ6SFhGeC92dDhjNW9CTzVscXpX?=
 =?utf-8?B?TitTS3Z2RWY2WHg4OVYrWWkwZmtrM0wwdVl2VWZ3cm9PNVNGa3h6K3Mwb1lx?=
 =?utf-8?B?YWJBSTUvUThqaHhtY0pKZVY2ck9ES0FYVXV1bXpXdGNoM3hNNmxwRERLbkt4?=
 =?utf-8?B?ZGxWdm9WTzcvRGtBZGpQeDJ0WituWFJ5OW1kVlh4bnZnaVdlaVo5bWYzaFor?=
 =?utf-8?B?Yk1qb0o1bzRZV3pTOFVpZGpNQjJ3SCt2T0Y5czNqMnh5S0ozM1U4Wko3YkhT?=
 =?utf-8?B?N3lQS0NLdUtBL2I5aTJ6K1l3N0RtZUVYV21Ga09Bai9ZMzVzTFR5TCtnWGpJ?=
 =?utf-8?B?eWt5akozY0w3ZmYrL01hdjNJYVRDOVpVblJ3ejNJYkRkQmtVWmxYNUx4TnEw?=
 =?utf-8?B?Qm1iY3FWZGQ4NzdrR2MzbHBBaVpZenhobHdHZ0FDT2tYZ0FpTjhxeXN2ZjlX?=
 =?utf-8?B?SmVtTDJsME5aeERhTkNudXFRYzl4WWdKZWkvRmZVKzcyV2dGRmhRTlExRzRH?=
 =?utf-8?B?R3ZBUWJJQ3RiL3pyT2RGZTZJbHBZZUJrdExrck9MeUFBU3NHbFpEbUNhOWZR?=
 =?utf-8?B?SGVrYThueFRiVit5ZEsvZllPLzlCemhCNExZTHE3VGF2dXR3N3ZqVDdwZGZB?=
 =?utf-8?B?eHlvZHdubndqR1VqYXJMNHF3OE13ck9qRFA1RFdJd0RoV09UeFBmaG12OExT?=
 =?utf-8?B?a2YxWGZ2dHJkeWZucnI5NmhxQjFVdENXNHFLOVZZNTUweWJ5Mnp5NmVhdDUr?=
 =?utf-8?B?N1ZWbE85SDBtc0dXNVJPODJqYjdINEZIUVJrU0tDZE5NRm9IMUgvaXR3a2RG?=
 =?utf-8?B?MjROYXJzRElJNXI5L1BuWjRxelI4ckhlUGZjcm4rL2lhangreTBaYmNxT1N0?=
 =?utf-8?B?MisveWJ6TWVCVHFRM0k0RlBzMzNDUmJBaENCUE9VQVJrZE1Pd1dKbnRFVXk2?=
 =?utf-8?B?TGFucTVYbTdRcFFERE00OEdpQVFyaXN4STF1aEZPWXh5N0lkeTB4cGswMmNG?=
 =?utf-8?B?dUIxWFJoTFhoQytrTFZtVnAwVG9hb1dEZXBMREgxN1puakd5OEpOTlEvK1M1?=
 =?utf-8?B?M2RHK3VzckZVQUV1Q1pVMHBBVzU1c1ZFTDZTYnJVVWVZWVQ1SzZqNW1lb2Jl?=
 =?utf-8?B?eVpUa1BGWlR1ZzhoNTNNOUU4OEVIdUQ2TWNxRU1kZ3NLK0hlZVhxcENUai9x?=
 =?utf-8?B?UFMvb2lHWlVLVmErK0Z6T1IzMVZnb05iSjNxWm91d1E3UGR4TXpabW5oYjlt?=
 =?utf-8?B?VzhPQ2tUNDh0VTFqTUFxN3Q0MHV4Lzh3R2hySVE5NExTRkpkT0E0bjBtd3Rm?=
 =?utf-8?B?KzhrZHViVytPOFJLbVo5aitXTjZMUVpiWEZuQkllN0pGa096MUxlNHczaitm?=
 =?utf-8?B?dkYwUDczME9neU05cExBbDE1SU5KYmU4VzNPMWhCSzV4NTUveS9OMlNOdkEx?=
 =?utf-8?B?R3BxdlBKYnB5alI5WmNwSHhGLzQzV0VxZVh1VCtaOWJCTkJPN2JKcm9RNGE3?=
 =?utf-8?B?RFdaUkRnOC8vdTA5ZDdVTXFDV0RuY1JsWjU3NFhCQmhYMmJEZTFOTW00MjA1?=
 =?utf-8?B?L0VkNFpHanVhNEZRZ3lpUkdUMUJRSFVxY2FWazhJSTgrTm9HOGllS2hEdTlZ?=
 =?utf-8?B?aEtRL0phS0pIYXUvalhJQ1AvS3FFcDN3cVNhc2JIMDgrTWxFZU0vOTc2YllT?=
 =?utf-8?B?QlJBZ2wrMkpUU3JUOWN1UjQxWnlYd2Z0N1BsV3pnY3ZkN0RkTW5vekU1aEts?=
 =?utf-8?B?Q09lb1hQdDd1ODYzWnlDc1dzdFErS0pNMGY4MlBHOTNBak1XUGNzOU1WVm1O?=
 =?utf-8?B?c0ZBcjRGZFlqa0k0eG9HUkZrdWpkRGIyT01rNHp2c0dQdlpLcVlSZzI0TXJX?=
 =?utf-8?B?YStNdlhkaHVVMjloRjVzVEVPcXJQWmg2R24rRFZPMzFDbzY3OGNkbDU1UFhy?=
 =?utf-8?B?bzFxY3FqQzBiTldjNUFPcldjc2tmSzJVUmM0cTgzV0ZrR3JLZWJoa3dBZ29v?=
 =?utf-8?B?eW5PcHRscGVNL25oZndyMVBOenNHeW12L2xyMnNhcUF3Si9idkpTRXVOaWVK?=
 =?utf-8?B?ak04bzIvbDVuR1pVL3IvcWlTMDdKcFFnZ1ExcVJDdmdFZzgvTk5hLzY0ZEwx?=
 =?utf-8?B?QWpDNEZXQUpjbHZOS296eXQ0dGhWM056enRkOWs1UXllR1AyWUJSNEFadE0y?=
 =?utf-8?B?ajFXdnowMWJqU3JsRTdrdkRYTVd5MjFHOEVxdEtuQ09RY1pKY3RDR3dTejVT?=
 =?utf-8?Q?MIgNQR6bRYgWxeVY=3D?=
X-Exchange-RoutingPolicyChecked: VD2zqH7rysJDrYmaxCNTzDHYPKitwF/x7PwbslNzUOrB3ZWV2RPRRQ5wkp0kGFnSUEO9yofFzGWMV27Cg3buvMyjX6Lo025g4KFx0LmLKxJ5GASu/VsCtVanWa1nBIYcomqQS0Ft7zDww0FEYXKryCI4hYZ1bjFXbycV0/pfpIwGiYnuaf9CnjoaBZPHNOy2QCptQl6tQm5Q75jlAB2ZLS+kqZ5cFiIGr6knb4DHXvbDzpFlxpZdhrSJCPSTHjZ5hXZTBSrJXjsLdU3MO0CynBaMn3sn2kyBU5m0d1cNDuJIotM4VVy5HMxoKURnd1l2KoAUlarPMsww5yvJkFXgMw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d2f3c752-1cb3-4f4b-eaf1-08df0a3275f3
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 03:13:15.7144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRqSHKlOo4Qyo4sc67DmK2C6MbsJkDTit/trZztnkpMIuTMoRjDKEW+wVScyWg6VFUl6BBZZHqmJTVjZ3u4e7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF1B1B74C09
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

--------------oBNF2I2Ic8Z2WJzy0R2wBmIy
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 04-09-2026 02:12, Ruhl, Michael J wrote:
>
> Anoop,
>
> The XE VSEC code will only use this API if the device is CRI, so yes, 
> removing the NOTSUPP
>
> will work.
>
> Mike
>
Thanks for confirming. I will drop NOTSUPP handling and the 
corresponding checks in the _ready() helpers.

Anoop

> *From:*Vijay, Anoop C <anoop.c.vijay@intel.com>
> *Sent:* Thursday, September 3, 2026 4:13 PM
> *To:* Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>
> *Cc:* intel-xe@lists.freedesktop.org; Nilawar, Badal 
> <badal.nilawar@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; 
> Iddamsetty, Aravind <aravind.iddamsetty@intel.com>; Tauro, Riana 
> <riana.tauro@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>; 
> Roper, Matthew D <matthew.d.roper@intel.com>; Ruhl, Michael J 
> <michael.j.ruhl@intel.com>; Luse, Paul E <paul.e.luse@intel.com>; V, 
> Mohamed Mansoor <mohamed.mansoor.v@intel.com>; Nasim, Kam 
> <kam.nasim@intel.com>
> *Subject:* Re: [PATCH v4 1/4] drm/xe/sysctrl: Add System Controller 
> get application status
>
> On 04-09-2026 00:47, Umesh Nerlige Ramappa wrote:
>
>     On Thu, Sep 03, 2026 at 07:03:41AM -0700, Anoop, Vijay wrote:
>
>         From: Anoop Vijay <anoop.c.vijay@intel.com>
>         <mailto:anoop.c.vijay@intel.com>
>
>         Add support for querying System Controller firmware application
>         status. This allows callers to determine whether a given firmware
>         application has completed boot and post-boot initialization.
>
>         This patch is carried here only as a build dependency for this
>         series; it is authored and under review as part of a separate
>         get-app-status series and should be dropped/rebased away once
>         that
>         series lands.
>
>         Link:
>         https://lore.kernel.org/intel-xe/20260814095306.2482289-5-anoop.c.vijay@intel.com/
>         Link:
>         https://lore.kernel.org/intel-xe/20260814095306.2482289-6-anoop.c.vijay@intel.com/
>
>         Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>         <mailto:anoop.c.vijay@intel.com>
>         ---
>         v4 (Rodrigo):
>         - Added lore links to the parent application-status series
>         ---
>         drivers/gpu/drm/xe/xe_sysctrl.c               | 82
>         +++++++++++++++++++
>         drivers/gpu/drm/xe/xe_sysctrl.h               |  2 +
>         drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 65
>         +++++++++++++++
>         3 files changed, 149 insertions(+)
>
>         diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c
>         b/drivers/gpu/drm/xe/xe_sysctrl.c
>         index 62ccc9be71b4..5da591ade4e4 100644
>         --- a/drivers/gpu/drm/xe/xe_sysctrl.c
>         +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>         @@ -13,9 +13,11 @@
>         #include "xe_device.h"
>         #include "xe_mmio.h"
>         #include "xe_pm.h"
>         +#include "xe_printk.h"
>         #include "xe_soc_remapper.h"
>         #include "xe_sysctrl.h"
>         #include "xe_sysctrl_mailbox.h"
>         +#include "xe_sysctrl_mailbox_types.h"
>         #include "xe_sysctrl_types.h"
>
>         /**
>         @@ -125,3 +127,83 @@ void xe_sysctrl_pm_resume(struct
>         xe_device *xe)
>
>             xe->soc_remapper.set_sysctrl_region(xe,
>         SYSCTRL_MAILBOX_INDEX);
>         }
>         +
>         +static enum xe_sysctrl_fw_status
>         +xe_sysctrl_check_app_status(struct xe_device *xe, enum
>         xe_sysctrl_app_id app_id)
>         +{
>         +    struct xe_sysctrl_app_status_req req = {};
>         +    struct xe_sysctrl_app_status_resp resp = {};
>         +    struct xe_sysctrl_mailbox_command cmd = {};
>         +    size_t out_len = 0;
>         +    u32 flags;
>         +    int ret;
>         +
>         +    if (!xe->info.has_sysctrl)
>         +        return XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
>
>
>     Reiterating previous review comment - based on the users that you
>     had listed earlier who query app status, we will never get to the
>     above condition, so it can be safely dropped. Once you do that,
>     you can drop the status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP checks
>     in the below (_ready) helpers.
>
>     Instead, if you want to retain this check here, then each of the
>     below helpers must be split into _ready() and _supported(). The
>     split versions should check for the specific case. It's the
>     caller's responsibility to handle the cases as needed.
>
> APP_NOTSUPP was added based on Mike's earlier feedback to handle 
> non-SysCtrl platforms.
>
> @Ruhl, Michael J <mailto:michael.j.ruhl@intel.com>, can xe_vsec 
> perform platform check and only call _fw_ready() on SysCtrl-capable 
> platforms? If so, I'll remove APP_NOTSUPP. Otherwise, do you need 
> separate _supported() and _ready() helpers?
>
>
>
>         +
>         +    req.app_id = (u8)app_id;
>         +
>         +    xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_CORE,
>         XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID,
>         +                  &req, sizeof(req), &resp, sizeof(resp));
>         +
>         +    ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
>         +    if (ret)
>         +        return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
>         +
>         +    if (out_len != sizeof(resp)) {
>         +        xe_err(xe, "sysctrl: unexpected get app status
>         response length %zu (expected %zu)\n",
>         +               out_len, sizeof(resp));
>         +        return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
>         +    }
>         +
>         +    flags = resp.flags;
>         +
>         +    if (!(flags & XE_SYSCTRL_APP_RESP_VALID))
>         +        return XE_SYSCTRL_FIRMWARE_APP_INVALID;
>         +
>         +    if (!(flags & XE_SYSCTRL_APP_RESP_BOOTED))
>         +        return XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED;
>         +
>         +    if (!(flags & XE_SYSCTRL_APP_RESP_INITIALIZED))
>         +        return XE_SYSCTRL_FIRMWARE_APP_BOOTED;
>         +
>         +    return XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
>         +}
>         +
>         +/**
>         + * xe_sysctrl_is_oobmsm_fw_ready() - Check if oCode firmware
>         is fully initialized
>         + * @xe: xe device instance
>         + *
>         + * Returns true if oCode firmware has reached the initialized
>         state, indicating
>         + * it is ready to handle requests. Returns true also on
>         platforms without System
>         + * Controller support, as there is no firmware gate to wait on.
>         + *
>         + * Return: true if oCode is initialized or sysctrl is not
>         present, false otherwise
>         + */
>         +bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe)
>         +{
>         +    enum xe_sysctrl_fw_status status =
>         +        xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_OCODE);
>         +
>         +    return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
>         +           status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
>
>
>     See above comment.
>
>
>         +}
>         +
>         +/**
>         + * xe_sysctrl_is_diag_fw_ready() - Check if diag firmware is
>         fully initialized
>         + * @xe: xe device instance
>         + *
>         + * Returns true if diag firmware has reached the initialized
>         state, indicating
>         + * it is ready to handle requests. Returns true also on
>         platforms without System
>         + * Controller support, as there is no firmware gate to wait on.
>         + *
>         + * Return: true if diag firmware is initialized or sysctrl is
>         not present, false otherwise
>         + */
>         +bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe)
>         +{
>         +    enum xe_sysctrl_fw_status status =
>         +        xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_DIAG);
>         +
>         +    return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
>         +           status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
>
>
>     See above comment.
>
>     Thanks,
>     Umesh
>
>         +}
>         diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h
>         b/drivers/gpu/drm/xe/xe_sysctrl.h
>         index 090dffb6d55f..b69a3f474236 100644
>         --- a/drivers/gpu/drm/xe/xe_sysctrl.h
>         +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>         @@ -20,5 +20,7 @@ void xe_sysctrl_event(struct xe_sysctrl *sc);
>         int xe_sysctrl_init(struct xe_device *xe);
>         void xe_sysctrl_irq_handler(struct xe_device *xe, u32
>         master_ctl);
>         void xe_sysctrl_pm_resume(struct xe_device *xe);
>         +bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe);
>         +bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
>
>         #endif
>         diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>         b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>         index 66e7cbcc3f91..d756b50cde6b 100644
>         --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>         +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>         @@ -14,9 +14,11 @@
>          * enum xe_sysctrl_group - System Controller command groups
>          *
>          * @XE_SYSCTRL_GROUP_GFSP: GFSP group
>         + * @XE_SYSCTRL_GROUP_CORE: Core group
>          */
>         enum xe_sysctrl_group {
>             XE_SYSCTRL_GROUP_GFSP            = 0x01,
>         +    XE_SYSCTRL_GROUP_CORE            = 0xFF,
>         };
>
>         /**
>         @@ -42,6 +44,69 @@ enum xe_sysctrl_gfsp_cmd {
>             XE_SYSCTRL_CMD_SET_HEALTH        = 0x0C,
>         };
>
>         +/**
>         + * enum xe_sysctrl_core_cmd - Commands supported by Core group
>         + *
>         + * @XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID: Retrieve application
>         status by ID
>         + */
>         +enum xe_sysctrl_core_cmd {
>         +    XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID        = 0x05,
>         +};
>         +
>         +/**
>         + * struct xe_sysctrl_app_status_req - Get application status
>         request
>         + *
>         + * @app_id: Application ID for which to retrieve status
>         + */
>         +struct xe_sysctrl_app_status_req {
>         +    u8 app_id;
>         +} __packed;
>         +
>         +/**
>         + * struct xe_sysctrl_app_status_resp - Get application status
>         response
>         + * @flags: Application status flags (see
>         XE_SYSCTRL_APP_RESP_* definitions)
>         + */
>         +struct xe_sysctrl_app_status_resp {
>         +    u32 flags;
>         +} __packed;
>         +
>         +/** XE_SYSCTRL_APP_RESP_VALID - app_id is recognized by
>         System Controller firmware */
>         +#define XE_SYSCTRL_APP_RESP_VALID        BIT(0)
>         +/** XE_SYSCTRL_APP_RESP_BOOTED - application has completed
>         its boot sequence */
>         +#define XE_SYSCTRL_APP_RESP_BOOTED        BIT(1)
>         +/** XE_SYSCTRL_APP_RESP_INITIALIZED - application has
>         completed all post-boot initialization */
>         +#define XE_SYSCTRL_APP_RESP_INITIALIZED        BIT(2)
>         +
>         +/**
>         + * enum xe_sysctrl_fw_status - System Controller firmware
>         application lifecycle states
>         + *
>         + * @XE_SYSCTRL_FIRMWARE_APP_INVALID: app_id is not recognized
>         by firmware
>         + * @XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED: application is known
>         but has not yet booted
>         + * @XE_SYSCTRL_FIRMWARE_APP_BOOTED: boot sequence completed,
>         post-boot init pending
>         + * @XE_SYSCTRL_FIRMWARE_APP_INITIALIZED: application fully
>         operational
>         + * @XE_SYSCTRL_FIRMWARE_APP_NOTSUPP: System Controller not
>         available on this device
>         + * @XE_SYSCTRL_FIRMWARE_COMM_FAILURE: communication with
>         System Controller firmware failed
>         + */
>         +enum xe_sysctrl_fw_status {
>         +    XE_SYSCTRL_FIRMWARE_APP_INVALID,
>         +    XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED,
>         +    XE_SYSCTRL_FIRMWARE_APP_BOOTED,
>         +    XE_SYSCTRL_FIRMWARE_APP_INITIALIZED,
>         +    XE_SYSCTRL_FIRMWARE_APP_NOTSUPP,
>         +    XE_SYSCTRL_FIRMWARE_COMM_FAILURE,
>         +};
>         +
>         +/**
>         + * enum xe_sysctrl_app_id - Known System Controller
>         application identifiers
>         + *
>         + * @XE_SYSCTRL_APP_OCODE: oCode application (firmware ID 12)
>         + * @XE_SYSCTRL_APP_DIAG: diag application (firmware ID 13)
>         + */
>         +enum xe_sysctrl_app_id {
>         +    XE_SYSCTRL_APP_OCODE    = 0x0C,
>         +    XE_SYSCTRL_APP_DIAG    = 0x0D,
>         +};
>         +
>         /**
>          * struct xe_sysctrl_mailbox_command - System Controller
>         mailbox command
>          */
>         -- 
>         2.43.0
>
--------------oBNF2I2Ic8Z2WJzy0R2wBmIy
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 04-09-2026 02:12, Ruhl, Michael J
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CH3PR11MB04614958B7615D42C3DD5A4930C1B62@CH3PR11MB046149.namprd11.prod.outlook.com">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered medium)">
      <style>@scope { @font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:Aptos;}@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#464FEB;
	text-decoration:none none;}span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}div.WordSection1
	{page:WordSection1;} }</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal"><span style="font-size:11.0pt">Anoop,<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt">The XE VSEC
            code will only use this API if the device is CRI, so yes,
            removing the NOTSUPP<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt">will work.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt">Mike<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p>&nbsp;</o:p></span></p>
      </div>
    </blockquote>
    <p>Thanks for confirming. I will drop NOTSUPP handling and the
      corresponding checks in the _ready() helpers.</p>
    <p>Anoop</p>
    <blockquote type="cite" cite="mid:CH3PR11MB04614958B7615D42C3DD5A4930C1B62@CH3PR11MB046149.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p>&nbsp;</o:p></span></p>
        <div style="border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in 4.0pt">
          <div>
            <div style="border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in 0in 0in">
              <p class="MsoNormal"><b><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">
                  Vijay, Anoop C <a class="moz-txt-link-rfc2396E" href="mailto:anoop.c.vijay@intel.com">&lt;anoop.c.vijay@intel.com&gt;</a>
                  <br>
                  <b>Sent:</b> Thursday, September 3, 2026 4:13 PM<br>
                  <b>To:</b> Nerlige Ramappa, Umesh
                  <a class="moz-txt-link-rfc2396E" href="mailto:umesh.nerlige.ramappa@intel.com">&lt;umesh.nerlige.ramappa@intel.com&gt;</a><br>
                  <b>Cc:</b> <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>; Nilawar,
                  Badal <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>; Vivi, Rodrigo
                  <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>; Iddamsetty, Aravind
                  <a class="moz-txt-link-rfc2396E" href="mailto:aravind.iddamsetty@intel.com">&lt;aravind.iddamsetty@intel.com&gt;</a>; Tauro, Riana
                  <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>; Gupta, Anshuman
                  <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com">&lt;anshuman.gupta@intel.com&gt;</a>; Roper, Matthew D
                  <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>; Ruhl, Michael J
                  <a class="moz-txt-link-rfc2396E" href="mailto:michael.j.ruhl@intel.com">&lt;michael.j.ruhl@intel.com&gt;</a>; Luse, Paul E
                  <a class="moz-txt-link-rfc2396E" href="mailto:paul.e.luse@intel.com">&lt;paul.e.luse@intel.com&gt;</a>; V, Mohamed Mansoor
                  <a class="moz-txt-link-rfc2396E" href="mailto:mohamed.mansoor.v@intel.com">&lt;mohamed.mansoor.v@intel.com&gt;</a>; Nasim, Kam
                  <a class="moz-txt-link-rfc2396E" href="mailto:kam.nasim@intel.com">&lt;kam.nasim@intel.com&gt;</a><br>
                  <b>Subject:</b> Re: [PATCH v4 1/4] drm/xe/sysctrl: Add
                  System Controller get application status<o:p></o:p></span></p>
            </div>
          </div>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <p><o:p>&nbsp;</o:p></p>
          <p class="MsoNormal">On 04-09-2026 00:47, Umesh Nerlige
            Ramappa wrote:<o:p></o:p></p>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <p class="MsoNormal">On Thu, Sep 03, 2026 at 07:03:41AM
              -0700, Anoop, Vijay wrote:
              <br>
              <br>
              <o:p></o:p></p>
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <p class="MsoNormal">From: Anoop Vijay <a href="mailto:anoop.c.vijay@intel.com" moz-do-not-send="true">&lt;anoop.c.vijay@intel.com&gt;</a>
                <br>
                <br>
                Add support for querying System Controller firmware
                application <br>
                status. This allows callers to determine whether a given
                firmware <br>
                application has completed boot and post-boot
                initialization. <br>
                <br>
                This patch is carried here only as a build dependency
                for this <br>
                series; it is authored and under review as part of a
                separate <br>
                get-app-status series and should be dropped/rebased away
                once that <br>
                series lands. <br>
                <br>
                Link: <a href="https://lore.kernel.org/intel-xe/20260814095306.2482289-5-anoop.c.vijay@intel.com/" moz-do-not-send="true" class="moz-txt-link-freetext">
https://lore.kernel.org/intel-xe/20260814095306.2482289-5-anoop.c.vijay@intel.com/</a><br>
                Link: <a href="https://lore.kernel.org/intel-xe/20260814095306.2482289-6-anoop.c.vijay@intel.com/" moz-do-not-send="true" class="moz-txt-link-freetext">
https://lore.kernel.org/intel-xe/20260814095306.2482289-6-anoop.c.vijay@intel.com/</a><br>
                <br>
                Signed-off-by: Anoop Vijay <a href="mailto:anoop.c.vijay@intel.com" moz-do-not-send="true">&lt;anoop.c.vijay@intel.com&gt;</a>
                <br>
                --- <br>
                v4 (Rodrigo): <br>
                - Added lore links to the parent application-status
                series <br>
                --- <br>
                drivers/gpu/drm/xe/xe_sysctrl.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 82
                +++++++++++++++++++ <br>
                drivers/gpu/drm/xe/xe_sysctrl.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 + <br>
                drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 65
                +++++++++++++++ <br>
                3 files changed, 149 insertions(+) <br>
                <br>
                diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c
                b/drivers/gpu/drm/xe/xe_sysctrl.c <br>
                index 62ccc9be71b4..5da591ade4e4 100644 <br>
                --- a/drivers/gpu/drm/xe/xe_sysctrl.c <br>
                +++ b/drivers/gpu/drm/xe/xe_sysctrl.c <br>
                @@ -13,9 +13,11 @@ <br>
                #include &quot;xe_device.h&quot; <br>
                #include &quot;xe_mmio.h&quot; <br>
                #include &quot;xe_pm.h&quot; <br>
                +#include &quot;xe_printk.h&quot; <br>
                #include &quot;xe_soc_remapper.h&quot; <br>
                #include &quot;xe_sysctrl.h&quot; <br>
                #include &quot;xe_sysctrl_mailbox.h&quot; <br>
                +#include &quot;xe_sysctrl_mailbox_types.h&quot; <br>
                #include &quot;xe_sysctrl_types.h&quot; <br>
                <br>
                /** <br>
                @@ -125,3 +127,83 @@ void xe_sysctrl_pm_resume(struct
                xe_device *xe) <br>
                <br>
                &nbsp;&nbsp;&nbsp;&nbsp;xe-&gt;soc_remapper.set_sysctrl_region(xe,
                SYSCTRL_MAILBOX_INDEX); <br>
                } <br>
                + <br>
                +static enum xe_sysctrl_fw_status <br>
                +xe_sysctrl_check_app_status(struct xe_device *xe, enum
                xe_sysctrl_app_id app_id)
                <br>
                +{ <br>
                +&nbsp;&nbsp;&nbsp; struct xe_sysctrl_app_status_req req = {}; <br>
                +&nbsp;&nbsp;&nbsp; struct xe_sysctrl_app_status_resp resp = {}; <br>
                +&nbsp;&nbsp;&nbsp; struct xe_sysctrl_mailbox_command cmd = {}; <br>
                +&nbsp;&nbsp;&nbsp; size_t out_len = 0; <br>
                +&nbsp;&nbsp;&nbsp; u32 flags; <br>
                +&nbsp;&nbsp;&nbsp; int ret; <br>
                + <br>
                +&nbsp;&nbsp;&nbsp; if (!xe-&gt;info.has_sysctrl) <br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XE_SYSCTRL_FIRMWARE_APP_NOTSUPP; <o:p></o:p></p>
            </blockquote>
            <p class="MsoNormal"><br>
              Reiterating previous review comment - based on the users
              that you had listed earlier who query app status, we will
              never get to the above condition, so it can be safely
              dropped. Once you do that, you can drop the status ==
              XE_SYSCTRL_FIRMWARE_APP_NOTSUPP checks in the below
              (_ready) helpers. <br>
              <br>
              Instead, if you want to retain this check here, then each
              of the below helpers must be split into _ready() and
              _supported(). The split versions should check for the
              specific case. It's the caller's responsibility to handle
              the cases as needed.
              <o:p></o:p></p>
          </blockquote>
          <div name="[object Object]">
            <p class="MsoNormal" style="line-height:15.0pt"><span style="font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif">APP_NOTSUPP
                was added based on Mike's earlier feedback to handle
                non-SysCtrl platforms.
                <o:p></o:p></span></p>
            <p class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;line-height:15.0pt">
              <span style="font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif"><a id="OWAAMF5FF79921C2D4C01A1A3E587CDDED972" href="mailto:michael.j.ruhl@intel.com" moz-do-not-send="true"><span style="font-family:&quot;Aptos&quot;,sans-serif">@Ruhl,
                    Michael J</span></a>, can xe_vsec perform platform
                check and only call _fw_ready() on SysCtrl-capable
                platforms? If so, I'll remove APP_NOTSUPP. Otherwise, do
                you need separate _supported() and _ready() helpers?<o:p></o:p></span></p>
          </div>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <p class="MsoNormal"><br>
              <br>
              <o:p></o:p></p>
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <p class="MsoNormal">+ <br>
                +&nbsp;&nbsp;&nbsp; req.app_id = (u8)app_id; <br>
                + <br>
                +&nbsp;&nbsp;&nbsp; xe_sysctrl_create_command(&amp;cmd,
                XE_SYSCTRL_GROUP_CORE,
                XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID,
                <br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;req, sizeof(req), &amp;resp,
                sizeof(resp)); <br>
                + <br>
                +&nbsp;&nbsp;&nbsp; ret = xe_sysctrl_send_command(&amp;xe-&gt;sc,
                &amp;cmd, &amp;out_len); <br>
                +&nbsp;&nbsp;&nbsp; if (ret) <br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XE_SYSCTRL_FIRMWARE_COMM_FAILURE; <br>
                + <br>
                +&nbsp;&nbsp;&nbsp; if (out_len != sizeof(resp)) { <br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_err(xe, &quot;sysctrl: unexpected get app status
                response length %zu (expected %zu)\n&quot;,
                <br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; out_len, sizeof(resp)); <br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XE_SYSCTRL_FIRMWARE_COMM_FAILURE; <br>
                +&nbsp;&nbsp;&nbsp; } <br>
                + <br>
                +&nbsp;&nbsp;&nbsp; flags = resp.flags; <br>
                + <br>
                +&nbsp;&nbsp;&nbsp; if (!(flags &amp; XE_SYSCTRL_APP_RESP_VALID)) <br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XE_SYSCTRL_FIRMWARE_APP_INVALID; <br>
                + <br>
                +&nbsp;&nbsp;&nbsp; if (!(flags &amp; XE_SYSCTRL_APP_RESP_BOOTED)) <br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED; <br>
                + <br>
                +&nbsp;&nbsp;&nbsp; if (!(flags &amp; XE_SYSCTRL_APP_RESP_INITIALIZED))
                <br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XE_SYSCTRL_FIRMWARE_APP_BOOTED; <br>
                + <br>
                +&nbsp;&nbsp;&nbsp; return XE_SYSCTRL_FIRMWARE_APP_INITIALIZED; <br>
                +} <br>
                + <br>
                +/** <br>
                + * xe_sysctrl_is_oobmsm_fw_ready() - Check if oCode
                firmware is fully initialized
                <br>
                + * @xe: xe device instance <br>
                + * <br>
                + * Returns true if oCode firmware has reached the
                initialized state, indicating <br>
                + * it is ready to handle requests. Returns true also on
                platforms without System
                <br>
                + * Controller support, as there is no firmware gate to
                wait on. <br>
                + * <br>
                + * Return: true if oCode is initialized or sysctrl is
                not present, false otherwise
                <br>
                + */ <br>
                +bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device
                *xe) <br>
                +{ <br>
                +&nbsp;&nbsp;&nbsp; enum xe_sysctrl_fw_status status = <br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_sysctrl_check_app_status(xe,
                XE_SYSCTRL_APP_OCODE); <br>
                + <br>
                +&nbsp;&nbsp;&nbsp; return status ==
                XE_SYSCTRL_FIRMWARE_APP_INITIALIZED || <br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP; <o:p></o:p></p>
            </blockquote>
            <p class="MsoNormal"><br>
              See above comment. <br>
              <br>
              <br>
              <o:p></o:p></p>
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <p class="MsoNormal">+} <br>
                + <br>
                +/** <br>
                + * xe_sysctrl_is_diag_fw_ready() - Check if diag
                firmware is fully initialized <br>
                + * @xe: xe device instance <br>
                + * <br>
                + * Returns true if diag firmware has reached the
                initialized state, indicating <br>
                + * it is ready to handle requests. Returns true also on
                platforms without System
                <br>
                + * Controller support, as there is no firmware gate to
                wait on. <br>
                + * <br>
                + * Return: true if diag firmware is initialized or
                sysctrl is not present, false otherwise
                <br>
                + */ <br>
                +bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe)
                <br>
                +{ <br>
                +&nbsp;&nbsp;&nbsp; enum xe_sysctrl_fw_status status = <br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_sysctrl_check_app_status(xe,
                XE_SYSCTRL_APP_DIAG); <br>
                + <br>
                +&nbsp;&nbsp;&nbsp; return status ==
                XE_SYSCTRL_FIRMWARE_APP_INITIALIZED || <br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP; <o:p></o:p></p>
            </blockquote>
            <p class="MsoNormal"><br>
              See above comment. <br>
              <br>
              Thanks, <br>
              Umesh <br>
              <br>
              <o:p></o:p></p>
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <p class="MsoNormal" style="margin-bottom:12.0pt">+} <br>
                diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h
                b/drivers/gpu/drm/xe/xe_sysctrl.h <br>
                index 090dffb6d55f..b69a3f474236 100644 <br>
                --- a/drivers/gpu/drm/xe/xe_sysctrl.h <br>
                +++ b/drivers/gpu/drm/xe/xe_sysctrl.h <br>
                @@ -20,5 +20,7 @@ void xe_sysctrl_event(struct
                xe_sysctrl *sc); <br>
                int xe_sysctrl_init(struct xe_device *xe); <br>
                void xe_sysctrl_irq_handler(struct xe_device *xe, u32
                master_ctl); <br>
                void xe_sysctrl_pm_resume(struct xe_device *xe); <br>
                +bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device
                *xe); <br>
                +bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
                <br>
                <br>
                #endif <br>
                diff --git
                a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
                b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
                <br>
                index 66e7cbcc3f91..d756b50cde6b 100644 <br>
                --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h <br>
                +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h <br>
                @@ -14,9 +14,11 @@ <br>
                &nbsp;* enum xe_sysctrl_group - System Controller command
                groups <br>
                &nbsp;* <br>
                &nbsp;* @XE_SYSCTRL_GROUP_GFSP: GFSP group <br>
                + * @XE_SYSCTRL_GROUP_CORE: Core group <br>
                &nbsp;*/ <br>
                enum xe_sysctrl_group { <br>
                &nbsp;&nbsp;&nbsp;&nbsp;XE_SYSCTRL_GROUP_GFSP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = 0x01, <br>
                +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_GROUP_CORE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = 0xFF, <br>
                }; <br>
                <br>
                /** <br>
                @@ -42,6 +44,69 @@ enum xe_sysctrl_gfsp_cmd { <br>
                &nbsp;&nbsp;&nbsp;&nbsp;XE_SYSCTRL_CMD_SET_HEALTH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = 0x0C, <br>
                }; <br>
                <br>
                +/** <br>
                + * enum xe_sysctrl_core_cmd - Commands supported by
                Core group <br>
                + * <br>
                + * @XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID: Retrieve
                application status by ID <br>
                + */ <br>
                +enum xe_sysctrl_core_cmd { <br>
                +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = 0x05,
                <br>
                +}; <br>
                + <br>
                +/** <br>
                + * struct xe_sysctrl_app_status_req - Get application
                status request <br>
                + * <br>
                + * @app_id: Application ID for which to retrieve status
                <br>
                + */ <br>
                +struct xe_sysctrl_app_status_req { <br>
                +&nbsp;&nbsp;&nbsp; u8 app_id; <br>
                +} __packed; <br>
                + <br>
                +/** <br>
                + * struct xe_sysctrl_app_status_resp - Get application
                status response <br>
                + * @flags: Application status flags (see
                XE_SYSCTRL_APP_RESP_* definitions) <br>
                + */ <br>
                +struct xe_sysctrl_app_status_resp { <br>
                +&nbsp;&nbsp;&nbsp; u32 flags; <br>
                +} __packed; <br>
                + <br>
                +/** XE_SYSCTRL_APP_RESP_VALID - app_id is recognized by
                System Controller firmware */
                <br>
                +#define XE_SYSCTRL_APP_RESP_VALID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BIT(0) <br>
                +/** XE_SYSCTRL_APP_RESP_BOOTED - application has
                completed its boot sequence */ <br>
                +#define XE_SYSCTRL_APP_RESP_BOOTED&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BIT(1) <br>
                +/** XE_SYSCTRL_APP_RESP_INITIALIZED - application has
                completed all post-boot initialization */
                <br>
                +#define XE_SYSCTRL_APP_RESP_INITIALIZED&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BIT(2) <br>
                + <br>
                +/** <br>
                + * enum xe_sysctrl_fw_status - System Controller
                firmware application lifecycle states
                <br>
                + * <br>
                + * @XE_SYSCTRL_FIRMWARE_APP_INVALID: app_id is not
                recognized by firmware <br>
                + * @XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED: application is
                known but has not yet booted
                <br>
                + * @XE_SYSCTRL_FIRMWARE_APP_BOOTED: boot sequence
                completed, post-boot init pending
                <br>
                + * @XE_SYSCTRL_FIRMWARE_APP_INITIALIZED: application
                fully operational <br>
                + * @XE_SYSCTRL_FIRMWARE_APP_NOTSUPP: System Controller
                not available on this device
                <br>
                + * @XE_SYSCTRL_FIRMWARE_COMM_FAILURE: communication
                with System Controller firmware failed
                <br>
                + */ <br>
                +enum xe_sysctrl_fw_status { <br>
                +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_FIRMWARE_APP_INVALID, <br>
                +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED, <br>
                +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_FIRMWARE_APP_BOOTED, <br>
                +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_FIRMWARE_APP_INITIALIZED, <br>
                +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_FIRMWARE_APP_NOTSUPP, <br>
                +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_FIRMWARE_COMM_FAILURE, <br>
                +}; <br>
                + <br>
                +/** <br>
                + * enum xe_sysctrl_app_id - Known System Controller
                application identifiers <br>
                + * <br>
                + * @XE_SYSCTRL_APP_OCODE: oCode application (firmware
                ID 12) <br>
                + * @XE_SYSCTRL_APP_DIAG: diag application (firmware ID
                13) <br>
                + */ <br>
                +enum xe_sysctrl_app_id { <br>
                +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_APP_OCODE&nbsp;&nbsp;&nbsp; = 0x0C, <br>
                +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_APP_DIAG&nbsp;&nbsp;&nbsp; = 0x0D, <br>
                +}; <br>
                + <br>
                /** <br>
                &nbsp;* struct xe_sysctrl_mailbox_command - System Controller
                mailbox command <br>
                &nbsp;*/ <br>
                --&nbsp;<br>
                2.43.0 <o:p></o:p></p>
            </blockquote>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------oBNF2I2Ic8Z2WJzy0R2wBmIy--
