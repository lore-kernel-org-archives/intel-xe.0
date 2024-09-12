Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A02EED63F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 18:50:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA52910EC19;
	Thu, 12 Sep 2024 18:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KJcarq8V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA70910EC19
 for <Intel-Xe@lists.freedesktop.org>; Thu, 12 Sep 2024 18:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726167030; x=1757703030;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=uYjku1hKsHt6HCMbnprOrmCgeEMLhMRTNlWfeKiQ69s=;
 b=KJcarq8V28OuH8/CantzTO9tRKLPEohjTTGJAjaK0jH8ZB2r6zxHCylx
 0Z91oWERzBBSK8EPqiBQ4K2tCgFZhKi9YyRYByCvl5V6banTwt0DmiDw+
 hvqGXirSF4sWtdT6602AYHOI60wQR254CyCvyq/WUAEGiK9Zyc3Ambzyt
 wosQfWa54zyL+A3gu/INCvH0XHdIQHyDfOBl3IZttFLkt+UjHOL/Lqog3
 7CpKi+NtyCBAR0dwsk41o9QR7/KnbxaSU1Sf0AM2SP2M+QDHkfdpgMm+2
 WEUT5Hnf/aRho1udrxz7u5fcfCAmjrL2qjE3jM69gQ5Ga+aGAUdWJslIZ A==;
X-CSE-ConnectionGUID: TwDvxeM1QouRJrhpbPAGcA==
X-CSE-MsgGUID: NlXyC2gTSae9tKSaKtwApA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25201996"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="25201996"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 11:50:29 -0700
X-CSE-ConnectionGUID: pGDxCNxaTpeZ1RSp5sCY0g==
X-CSE-MsgGUID: kNys6rWjSvC5esFY6n42rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="105262332"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 11:50:16 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 11:50:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 11:50:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 11:50:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mew3yXjCX/Plt4yGlv/G2kbA/yphu1U44ffsZdVZUf3faYm2zl8KAqBQ6mnwomyP3iE6+TUcaEl4aBxSzo/umAxt25jmIxgOZeGa50B3PcJzArtgJwPUN1ggHxM2BSgxMjADuemRlCtDrHsWdPt1aaUdPESijpjtDukNM7vkrtLiNJ+i4K3j1kU7tK+mE53gKH4IHeV6G/FocN/dHgyCCh/ZWcesDv+n44yvm6M4p/nBH4paOj61Q/lQcGWVSt89tNN50LMocgwa63t1uSeDIARq4sNthlEdaAdgVH9wlV4+6tO4w13VncT8gabiuxohNjpvC39H7ALKuph+iThQ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d25wn+aHoRMiW1DVkbq/H3anEH+Gf5mkzkjf0D5R1js=;
 b=Ze91S3NN/1mtBj+AcRw7a65lB+0qiUZLflxj2vON1qcgO08uTwVO/mcHTrUsj3prgTQwI42TY6GwAcqAyPnvsmrXdxqz1EpJNRYFd577xecbv+EB6ipNkyX/2Kh0vAl/DLjknbU4Sb1Ea66QHVs2szLsnRW6/ceMuyEQ049+FSyiWH0NiHM/hYyQgp7YUQfodhau0Qiick82bXrPtHIAVs9Ev3zJgVJrV6sN2JmGr1AEFHzDRLpzyew4NKnei9FwSPvoa1qfqWaUkpgGzoZ9XuzFtWL1sWlB0xAc3bXIKE5KqrDdkBtLatInZhiHEo2p5LfAVL4QVTLvAI6gGQCrog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SJ1PR11MB6081.namprd11.prod.outlook.com (2603:10b6:a03:48c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Thu, 12 Sep
 2024 18:50:11 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7962.016; Thu, 12 Sep 2024
 18:50:11 +0000
Message-ID: <b292e3a5-9291-41f2-bba1-ae87b17bd5a7@intel.com>
Date: Thu, 12 Sep 2024 11:50:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/10] drm/xe/guc: Improve GuC log dumping and add to
 devcoredump
To: Jani Nikula <jani.nikula@linux.intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <877cbhi64e.fsf@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <877cbhi64e.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0200.namprd04.prod.outlook.com
 (2603:10b6:303:86::25) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SJ1PR11MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: 3914d7b9-746f-49e6-654f-08dcd35bbb17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmlkbGdsWVJ0OWxpN3V0cFlNTkE2dDRtMXRPOTRYOE0vN3lFdUdDVHUrNmto?=
 =?utf-8?B?YlZjWWZTbko3TmZkLzR1K05pRXpWRDhja2p0NzRiY2M5NDI3YTVQa3QrNFFj?=
 =?utf-8?B?bkhHR0F3b1o0V29FSTRTSlI5aEljRE5RazhXMFJrYzFDcGFIU3F5ZFZTeENx?=
 =?utf-8?B?LzNzM2U3WEZmTWhEWWtRSFl0eit4Zk1jamNUV0dLbFc1bnpLeWc5ZkNTaTc2?=
 =?utf-8?B?VXBNdkYwZ2pyYytaTGR0dGVnZmRKOWpoQnEvL0xxVGhtYVZVZzNFbFQ3STZV?=
 =?utf-8?B?K3M3R3BTdkJSQ2s4ODBOaFBrUFlTWTh2NnM5ZEc0d2NGOXpQZU5QeERUMUhC?=
 =?utf-8?B?Mk9ROGltVWtFbVgzVlYwUllzVDZLOUJRcjRxdDdUY09CNGxtcW9Od2toSjRZ?=
 =?utf-8?B?QVF1dzIySlUzOUZ5RWdQbGdYcUlVam5VcjRuMXNqQVgyWExnQklqWWRiVFhP?=
 =?utf-8?B?QnQzREpPbzNyeEV5eDFVeVZXUUZuL2ZENlROZmNGSFRVYzdlVXJ4Z1VvbVBj?=
 =?utf-8?B?QlJqQ2xMdFZNVnMrd01pWGUyM0QrU2d5ZFR4K0tuV2ZZTlRTLzdaSGRUMFJJ?=
 =?utf-8?B?VDJFWm1saENpS1VTNFNnb25nblU1UlZtMG9uVjVpQ2Z1QlBuZDZVSnp3ZGY1?=
 =?utf-8?B?S1BhZG5HYjd2ZkNlanYxZUtiZTRCY2NPbVNRa3BFdWFZQU11UkF1c3JsSGsz?=
 =?utf-8?B?Mks1V2sxYzhoaUhSWUpsQmNmZDRsc0Evc0xTUFp5ZHBNTmFJczV2N0NsMWhq?=
 =?utf-8?B?blgrTW5UV1d2OHFzeUhjUEs2blJlM0JxdVpZMy9LdlY0RFR4c0laaVBhc01x?=
 =?utf-8?B?Q2Vob0d4dnNFZEt4Z3UrbXVsWkFqNjJYWGtNZU0rVDZDQkNYM2tlc2xNVlRJ?=
 =?utf-8?B?dU1sYlRJNlQyQlhYeE4yazlvMnlqNk53TWIzREcydUhsMUZKTTFUOG5TYk40?=
 =?utf-8?B?N1VveFQ0cU1ZUkRuZHlwQmV0UW9jaHZUdVN6dDFVWkU4eW4xb0hHQzlPdXhU?=
 =?utf-8?B?VlhnWW4wRGloV0hGWndaK2xrRU90S2tkcWE5VUM5UHJ5V1NDNWI3NHFRSS9r?=
 =?utf-8?B?Tkp2UnRHSjZTaXhBbWFCL2RGRWxDc1IybVdMRk9rZkpSVjB2K0lMTGR1TGRk?=
 =?utf-8?B?Q1ZycTBTbDcwdmkxUTlKUmpObEdiK0FOd3ArQXdUZmw4R1p0dWtCMDdhRnlD?=
 =?utf-8?B?ODI4NTlLMWlES3J6N0NrQlN5MGF0M0I0UWsvYkJpVzJ5MGFMZjRKdktnZVBS?=
 =?utf-8?B?UWN5V1ZocFZEeDJxcEZvTThadEdJSDRSVlkwS0ZCZEFob1p0cVZrWXBJcEMw?=
 =?utf-8?B?MS9Na090R001V2pDK1BPcmhRcTRyZStNNmpQaUtuRU5obmN4TjV3clY3OGwv?=
 =?utf-8?B?bEtzN1lETVVJSDdrclJCM2VJNlM4blFnTC85dVV2YksySEZwV3B5QlEvYnRu?=
 =?utf-8?B?cXQxM0Z1ZnFFYzJBWnNneHVENks2S1R1VUZYRGhUWkw4WnNranRMRDVHOXJo?=
 =?utf-8?B?U2psNjRGanlWRk45NlVLUjNpMldJZVk3aW0xaTNEa29PSWV1SGZGdm1jcTJs?=
 =?utf-8?B?SkxZNWtnZUZxUU41ZnV0RktCSTIvYXZGOVc0TlpWVDVnNDQxWGptYmNMMmNS?=
 =?utf-8?B?czBldFMyUDRJME84ZlZYVnJLKzhYaFdPOUZLbldTd1kyK2ZLc2pudnBVQmNy?=
 =?utf-8?B?dGhSY3ljT2U1T1dNa0xWcS9rM1BYbFhacnk1TWRURWpjUkg0Sms0bFpRRkI3?=
 =?utf-8?B?dHZCVUZ2bmY1SW9BTXJIa0hiNkpWTUxpbWR4T0F1bzgyL24vbFVMemVZNmJm?=
 =?utf-8?B?bmV5aHNWZnZkZUlLNStsUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHFlTGhuZ0VqUlJ4Vnk3TjFteWlXVGZ0cjlwYVlCNkZkcDBkOWdKak5INGxX?=
 =?utf-8?B?SnJHK3pUZG5rWm9hY21hTzJhTUptb1R2NmVkdWt1dlNkeUFQNGxXdXlFSWdF?=
 =?utf-8?B?dmFZK1F4UjAwbFEyRzZFWVNiS2d5WHZQR2ZpYk5KTmMxRllPaXBRZEVsZmpa?=
 =?utf-8?B?RGthdk9CZ254aUlDd0ZUWFBZaFhXZVZKdzJjRHUvWXJKMDN5NTZrcEZFSnMv?=
 =?utf-8?B?cXNuZS9wODFHbml2bGdYU2o3MDRSN3o0bXFRVDZGcWQ5RThJaHFUbElhdGFG?=
 =?utf-8?B?My95MXpWbERra1ZKUytKcmpCbTR2K3krdEhMQjJ4VWJvdHptWDRhRnRPWWtY?=
 =?utf-8?B?QWwzL2VidithZi9jaUtlakE0WkpwRnIyUGZKTHRFT1puc0J4MXYzTGtRK2Nr?=
 =?utf-8?B?L21ua1ppV1hBNDM1bjRqNXBSa0hmVGtWTXY2RG0rZlNDUWlaT3V6c1RlV3Nj?=
 =?utf-8?B?cllRU0YzVEFUa0NRRTVVaStGUlFhUDFhWC96eEpIOHcvdEpiRDFtZ3pXRkJp?=
 =?utf-8?B?SElzRjRHWkxHOFhqY3M5V0dReWljcUR6QTRrU0ZFR21IQlJZQjBqSW82SWpY?=
 =?utf-8?B?eFRHQXBMVTZoYUFHelN1NkNBWTRoQ3NFSHlremJhU3RqZWljVzJweU0wMUJt?=
 =?utf-8?B?MkJwWmNydEt1M3ZRdlRtV1I0Ty9rekdZQTlDVi93SGNOZG1NWGRtL0Y4ZC9F?=
 =?utf-8?B?WVdkYXBqblVJVDhOOTdDT3BZK0NiMFpPczNGdVloa1dMdTlNZ1ZRMWNrRnpo?=
 =?utf-8?B?UVRzaEJUbDNDVnlJamNUR0xPZFcvWEJTbXZteUtrRHNaaTJWNU5VWUYyb0w1?=
 =?utf-8?B?Umx6OWhOZEJZWEUyWUJEN094OEJMQ2RBWmxOZi9ab1UwUTIyY0pBdStMWnJX?=
 =?utf-8?B?YU9GVGJDZ2VpNEpCYjlTV0hHU3lTMzJDU2FTWHJteGQvT0RMYjhrcE9xUHdj?=
 =?utf-8?B?OHRFWGhDOExkU1hJRWVZY1hub2NPamVRckQvNkdwKy9TcWJJbWpkVi9mZ1Ju?=
 =?utf-8?B?WERxZUd0eFMxMy9nVnAwQVBrN0swQStEbXd5cTRVTU44RDVQVG9GMkpMSnNR?=
 =?utf-8?B?aURkN3orNTBXV0duLzVQVTNKMCtnZ1ZWNFNHdTluT2FyZ3puZWNnS2owT3B6?=
 =?utf-8?B?OXhqSFJtb0RXaTdhOGxDTEVZbERFVVd1VG13TFppT2pwa1hoekFWZnZsc2Nq?=
 =?utf-8?B?VmF2TWZQQkZVdy9jMEo3MkM3QXVZOURzd0w1Qy80QzdDeWZwcEUzMUdzWE9l?=
 =?utf-8?B?SnFsNWRhK1RNM0RYMlNpdXdicmVsQjNwN3NPQzJ5eUxpaTAyS0pyUzNxeDND?=
 =?utf-8?B?QUJjNFFUQkZuQjM5Qzc5Yy94UHpFeEkzUXFCemZKcS95VFo0M0dmbHJUZmdz?=
 =?utf-8?B?RjVQODBURzVxd0hRRFVqNm56MFg3YjFmRElPbDVjZGtZZnd6WG8vZ3BremRl?=
 =?utf-8?B?bjdCNFNuWjMvVUFGbG5wNG45UHpnb05wSHdaejRZTUNhT3BHdUJDY2wxYnRz?=
 =?utf-8?B?MjdkcU55NXdmaTNtYmo1b0FpbVEvTTVCT0NUVkRrK01pR0tSNm1VRGtoWGpl?=
 =?utf-8?B?NExtemdlV29STUhJaXJjR0xMalNqdzdwaW93MWt2dWZSSTFMVWFzcHBJSDgx?=
 =?utf-8?B?VjhHN09sMjJ0K2JXS2pua0tRQ0NEbmJoUGxjYkk3OTVSa2lsL1NSTThPWFBZ?=
 =?utf-8?B?S0JlN2lmMW9FVFIzWHlYUjhrVmx1cHZ0cWFKMmo3OEQ0SDEzQlFTN3Y4S0Iv?=
 =?utf-8?B?NVAzK1dodUZBd1NUSVpJczd6cTRVeHkrQUI4OStFK1VJam51NlFFTkprRWsz?=
 =?utf-8?B?TGJ1Ui9Lejg1bXNKQkxMQm1Ec0NXZW52WGEwam1QR2xFbFk5RHB1S1k4T045?=
 =?utf-8?B?UjVTenhBcTBOS3Vud1U3MWo3eWRLUkppZzhJOEtpT0pEcVZCdVA3YjRRdEY3?=
 =?utf-8?B?WW4wNXNtMGpJRTVtdjlGVXVxb3lLMFhnMGgvMS9aNWJub2piUTdnaG1oVGJO?=
 =?utf-8?B?N0dGZktnTHFOYUJhOTZJVWRRaU9qRFRWTEpWN0lZd0hQU2UzTFRna0FkYlZV?=
 =?utf-8?B?bkI4YTFDbWNDWkdXUWFvYWhVS2JKMXZBN1MvcWZvbnZGQnlNYiswQXBUNGwr?=
 =?utf-8?B?djFabmRlcWIrUzZ1Zm50K0w4VFdKb1U3L1dwQ1dURjczNncxWi9RTkx1OUFN?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3914d7b9-746f-49e6-654f-08dcd35bbb17
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 18:50:11.6058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+IgffyF9kTF3CD+2Qlj7dEDe05yg1nzFWYefhKmZG45r9utI9dnmkic+2ld3MTKxcDx5hT+QsNCqb+W6Z/QuzsSDqlwmxBwqcSLPXDRe+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6081
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

On 9/12/2024 02:16, Jani Nikula wrote:
> On Thu, 05 Sep 2024, John.C.Harrison@Intel.com wrote:
>> Michal Wajdeczko (1):
>>    drm/print: Introduce drm_line_printer
> Given the discussion around other parts, it might be prudent to just
> upstream this separately via drm-misc.
For what purpose? Without the rest of this patch set that one patch is 
pointless - it has no other users and it has no other purpose.

John.

>
> BR,
> Jani.
>
>

