Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790DAC2BD09
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 00:54:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5FD10E2E1;
	Tue, 25 Jun 2024 00:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CN60imbF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5A510E2AD
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 00:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719276879; x=1750812879;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ggV2jpXBDsHfyW1aRr1hW5PpqsIAtcy0A52NYWk8fvM=;
 b=CN60imbFd//luC5hgWo68ennPjmbYHMs+kqPoUg3uXNCkXMaJr3wsh2u
 d9OfhIIC4eLnhgjVRMvYDIO4+V7hMkXMY3wME5ZF4W9MQWOPlX38rzYHa
 A1PIzP0Rk/xfCBLiVwwZsiiiVW/Ntr9m2P8Me90sqUMXKh3hMV62C/Omq
 cDgb6Psw1RPmlr/3FJoHMoj2Jt39hed7EpeXPoU1eedUjcunrV7ZpOHmz
 hyvIuzITbWXjUBRo4Z2ASV5fZXld0eoUvijspgdot0PYsvXEPvsFoBKI9
 mIVbYyg1oL8QlGX+2UaQWzNDG1C59XrbOLfPpaUjWdsW1Nq3My3KBtWau A==;
X-CSE-ConnectionGUID: x6tXptElSu6bL8PTI7n9AQ==
X-CSE-MsgGUID: zg+Z2/pDQ4ejYGce/PWR9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="15962184"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="15962184"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 17:54:38 -0700
X-CSE-ConnectionGUID: mlJQsOpWSsC9AxaNJ51JkQ==
X-CSE-MsgGUID: kjQbrUtORsighCE4qP0IlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="43342236"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 17:54:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 17:54:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 17:54:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 17:54:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gh7vhOZtamNPFX0/18Y0f3csQvr9k1trld2F+aI24MO0ujt8cdPNQYfyASFNG5y+pIxv+2eRCL71jSCy+ayPxUDTDUHeLx65u5x+u38DXc5Ti+Vu4jlimfw593mF4LNdwx4bK6IP/6Cxaia0/ld4BZMA1X2y/hLV1Rj5YVTf/WXZzjwKhi8sOZbPSZGKQFI+d4e29qhyyIjmIqQ4XrodFSGc89YLG3LJt8CvWPe4rqGdPxKlNqoSukZgH1UYylkIRzyB/z+en4HpdnG2eh5FJe8EolwnNQXQ4i9nYAORnsHA6Ilsr0z1E8AFywqyDw8xDpW9J0xz3rYRhOf+gJyCGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cdwn4Mo9ap2y3K2vstGP53FkrqrfuY5b4hVCk3MNigE=;
 b=fe5qEceS+YeyzFdix9PNOyX24Y0Y7Keq0t21F0lsp5nVpFedRfKoBuOLCZkp1Op07F3+Aq9wb9N5sDsnDcXTnJJsoibw0r4XwzrsaOIKKpEBUbiNklcOGzf5ddySCAJcJyIOh6S4mj4yzCa5uyM4kZVXNHgr2ahMTXq5KbdeiLKAARZpZgzWHViqzCz5hIfGPmg8f30YoAemiCMfMAxmJ+/VB+XXL949ANHhJx33zur1jTg73oBD82xsVKmdWPDHju3mQHZ+FzozTy2UHFduC/h5wWXWXkRkE73dcI0Gk2gZruFEkctawRJ7qKHnP/YpbYLChFGVrw+Ljgfod2UB1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH0PR11MB5047.namprd11.prod.outlook.com (2603:10b6:510:3c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Tue, 25 Jun
 2024 00:54:35 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 00:54:35 +0000
Date: Mon, 24 Jun 2024 17:54:19 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Get XE_FORCEWAKE_ALL to read RING_TIMESTAMP
Message-ID: <ZnoVOzQQ2NVVZzm+@orsosgc001>
References: <20240621192325.227230-1-umesh.nerlige.ramappa@intel.com>
 <yolllanxh5neppqhi5whzwsdxetbqfkzurfsbaf5x63s72tppn@e7c6xhqf46eb>
 <20240624215612.GV2906448@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240624215612.GV2906448@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR07CA0095.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::36) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH0PR11MB5047:EE_
X-MS-Office365-Filtering-Correlation-Id: 0723efbe-e700-40c8-23b8-08dc94b16219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1gyYkxKYnBhWEs5YWF2bUtZZDBHRWxiWU9rQUwrMXFBMnFqZ2RsOUNNY2gy?=
 =?utf-8?B?MDlVakxrUEdoRm04RC8yN0xJOE03R1FYUDkvcEtrelBDWTUyS3FDTmZWUHJK?=
 =?utf-8?B?ZFpoMlBZazFFbkpBVGZjYWdLN2lZK3F4V1g5aG1LLzV1THRmUDNBcnZBc0pF?=
 =?utf-8?B?VzRkV3pnajRRdnQxcnRHZFJPeFpZQlMvY2tDQzB1c3ZQOXRjL1F6cVJKM3Ey?=
 =?utf-8?B?dFlMNHJBMTE5alZWc1U3OXk2TDcyTFVrSHV4YnRaSmpyS3NyUTkzSHJBdFJV?=
 =?utf-8?B?cWtPOFBTZHdmZUZaaTltVEZUOXAyK2hjemNHSit3aWJGWkQ2ajZVOTZ6cC9S?=
 =?utf-8?B?a0ozNXNTRFFxUXR1bE01VkplaEZ2MTV4dUdLQi9heHV2ckUycXllUWs0MFhX?=
 =?utf-8?B?TllPcUYxeVpQalBka3dZWGxHcFRRcWpvUXZDbGZmWmFGbXVEckdySDZOQ3Nu?=
 =?utf-8?B?dTZzTTBCMUhLWEUrV1FjMlUyVmlJUjFGbnBiSTBQM3NDdmRmcXBkWW5Zd2xK?=
 =?utf-8?B?YWlaYjk1L3ZaYUxUYWU4WHVQNmJNbEovd2xPaFU1cWl3RXFnRitkRDFjdy9j?=
 =?utf-8?B?Qm9yVzRlTUJYaWd0WTVrcURUKzJkOXFja1VOMnlVT2lYYzBJYVFyZzRwYzQv?=
 =?utf-8?B?Y0I2Z2JHUEVuTWdabG5PdnpZeWxxY1dlTXhVRUwrTXIvMGF5N09BVUVGeGtj?=
 =?utf-8?B?SC9FODludXhUSXpnQllralhuSEhhNWZmNWFzcS9yYk00NnR6RkJLVHJVV1d3?=
 =?utf-8?B?T01yMTRtY1dEeTAyeHFiMzdoS1VDTHNsb0dMVkRvdnl3cWUwUzQ4SEpkTUxt?=
 =?utf-8?B?UHBJeGFGbkRUQWp5ZW4vRzlZUzUrbzQwS2lYQ0xKYUV2ajNrQkRjQjJoYmVt?=
 =?utf-8?B?UG5mSjYvN3F6MjJROGxDMStRUHlQU1lNQVhvbWtmUEZMNmI5cjM0MmlZNlAr?=
 =?utf-8?B?RVlZNkRGVnNzaFY0SnVOTGZnMGZmSHZiMU9veVJpQ241VEtCQkZiQXRMTTZE?=
 =?utf-8?B?RG1ITUx3RGJ2NFBkczZPUnphMytnMlZMdktOZVozZlpkRUMxWUNkOFVkY0Fv?=
 =?utf-8?B?Q1VwRFVPQXZlWWFnRjNDb0N1NEpBNzdIVjNjRzFBcGxUbktMeHc2eEhwSmZv?=
 =?utf-8?B?Y2JsZE9JYS81K1ZWOEFRaFE3NUxvclNlQXZ4eU81QkVRc3Z2bTBIamdNdEtD?=
 =?utf-8?B?VHZkK3pzUEZsQWpWaGw3Lzd1TGtueDFpYWx2Sy91ZnhlVXQ0eUlFTCtwYStu?=
 =?utf-8?B?dGJuM1o5QnhjVU9UYk90b0htUXMyM1QybkFhRlNQK3B1clNXWjdjcWlpZ0Q1?=
 =?utf-8?B?ejMvbW43Y3ZEUHJ3Q0l3eVdxYUQvZHdScXdXcnp4a1ZxR2tpcHl1ZU5hdlNa?=
 =?utf-8?B?QXFuMHJERjJEMWszN3FtaUlIWDlUYWo2UFA4UEZWVkZabTVBZ1poU0s3eXMw?=
 =?utf-8?B?ZHBkZEkvL1JSSnA3SDIzOW9qaDN4Mmxiakx6bUNlaWh3MUhYaW0xRUtDVUhQ?=
 =?utf-8?B?V3g1WC9xaUZCUlFpRXhlZUU3N2VENmExT1Y5ZnRBdm16SFRuUUYzTGpzTWwx?=
 =?utf-8?B?MXZKSXY2SmlaRzZ0ZS96N25rbHFIMW5FanFCbmp1U3RMaTNTTDFtWGJoVGdB?=
 =?utf-8?B?c2V5Uk9XSGV3ZkpzZm5mbjBxNEloTkhabDU0RzQ4enhMSW9nSWFQTGhwbTJn?=
 =?utf-8?B?VlRxcTFRZDdKT2pTZTErTjROTU5JNjJ2SDNxbEU0RUVuNVVVaDduTWZxem13?=
 =?utf-8?Q?HIoTJlgq/SoLxI8+93W/XxwomucyhOsTeyhfFe/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTV1Uk42Y2RnK2U2a3pnTVpOQjZRN2RGNDRubjhmb2hQVlFpVWE4UlpRSG9O?=
 =?utf-8?B?KzRaRnRYVmllSHpqblhmR2FFS1Y5c2V5bXBiVUpCYmRDeTZRT1BxVlFlUDQw?=
 =?utf-8?B?dDJxRlpERG9pcjlhc1RDdHhvR3FoQnh5c05Bd096a0s5M200Z0xSeXNFcy9D?=
 =?utf-8?B?TmlFcjJUSTZienJ2YmY1WlIwb2x3WTFqTGlVTHFXVlZwYyt2NldGQzBwM3JP?=
 =?utf-8?B?bFE3RTArNUpGVDEvU1lmbTVpS3kvYXBTVGdCSWNqYU9yVmFqdEhkRU4rMUla?=
 =?utf-8?B?UFpGaGtYOXlNd1dGV1JRMnMwazlvNEJaNW5rLzdiQUNYNk1Kb1MvQUsvOVhV?=
 =?utf-8?B?aU9paDZFMHJlUTFlalRocU5DK290b2QyY0Frdy93YWZ2VktOeU1zRGxIRUFm?=
 =?utf-8?B?Umk0aEZva2VlMmlmWGFyRURsMnVpZElTU2V4S3l4eVBIVjVjYkdMVjRDQkIr?=
 =?utf-8?B?VHMzcTFGWjZkc1A2T04rN0FSdCsrYnMzWWl2Zlp4VFlDNHZtcEdaYjJBWWJX?=
 =?utf-8?B?ZGRsRyt3RGpPOXVtWDVSRDVObU9kdGFHdVhlZE1tM21EQWxyMk91UzlOWlh6?=
 =?utf-8?B?QXQzaEcxdlNneEcrSjZYZjBkTXNmdmMvSTJGRW5wbkhRRDFSYmNBQ2RnL0dH?=
 =?utf-8?B?bTEyVmxzOVJsNlp4SElZQ1diSzgvYmF4ZjhHTzB3aGFjelRPem5uTExVa0RV?=
 =?utf-8?B?TEQ3bmZlZy9lZ25ON2gyQ1lLUkVoV2VKdTBxejlRMlZzU0xZaUxTaHdMaVMw?=
 =?utf-8?B?SlhyVVVRaldaR1VwaENrWWlmUHp2VG9HM2RZSjZYTVF0ejBkM3QrZmN1RGYw?=
 =?utf-8?B?ZGFrL1lIWFNBZGVjcjVGbktjMWNWbFRhOU9YNmRrNThzbGRJVEFEUjNWeWI4?=
 =?utf-8?B?WFdEOEVCRDR4MlhWUTFDZzBCUVhhODlBUEN3VmxoNGtIZWpaOEg3cUVnRHBV?=
 =?utf-8?B?ODhDOTc3WWExMUhNMHhLZEhCVGo2anM2NHVhL1VtVkpsL3NpeGdFZzFnY0xQ?=
 =?utf-8?B?bWdTaEhRakthRFFaR2RUSkJ2VHB4NktwSHl5b1ZkR3JpN0c4YzFhSU1lYisz?=
 =?utf-8?B?blZNak5DSlRRMzNYL2M5ekg3ZmZpVEZ3Uk9QZzZSZzlqOURlMzJPZDk4YzNn?=
 =?utf-8?B?K2M1Y0x0ODJIM2d4U2VicklSdGlvWEFXRkhlMkhMODFQN3AvS0xLNE5mSWow?=
 =?utf-8?B?bG9JZ2N6MjQvOUt6dU81NFNpaUlUMnF2UmF5NFo2cFNGSVQ5UWFOUHN4c3JZ?=
 =?utf-8?B?VGErNnlMcllPamp2SFVBbE5uZlNuc1NFZGFFcFh2NkJ2ZW5HZWxvNUREM2hJ?=
 =?utf-8?B?WnBOTmFvc0hjWEo1VVlrKzVjWnJwdkF5RzNtNjNQdFdYNlZnMGdNQUxRdHRL?=
 =?utf-8?B?VkgycTdtUW5kM0FFWmhuZGdsMjBURkYxSGR3UWMxK1BEZkRVV2tFMWwvMVF2?=
 =?utf-8?B?NGJWS21Hc1lHTjBrS0VZUTJuUmtGVkpaaENCbU5VL25KaEI1MFc0VElMU0pC?=
 =?utf-8?B?SkRSUVkrU2F1SFBWR2pWUzdYc0NTQWZNL0J4VjRHWWNKc2xaRCtvY2JGWmpk?=
 =?utf-8?B?UzFCRXdoRzN6dnlaSVJVRTdBN3Z3Qi85cEZabi9JbCtPWUplbGlqSzN5R01u?=
 =?utf-8?B?NGFaS0pkWW5qd2pFOXNuRlo1V1BsSkFvdk9PVGNEM3Q3SnI0RlMyLzRTdEh1?=
 =?utf-8?B?Ry9NQU5oYjVFczJuMFhXZmM0eUdsNFB0TlpDcnZVckVFZGhYc2hmQlRpd2NF?=
 =?utf-8?B?azhacU5kUjFGWXcxQ2xxekJZdkpzRHNwa1Z4YW5aSUovckd0T1BPaHNWbmRI?=
 =?utf-8?B?bisxQ1lJbGRmcW5iaW5oSlZ1bnBsQkhHV1Fla0xJVXozUHlML0tLRjdRclRW?=
 =?utf-8?B?SEpLTEI1R1Z3WWZ0QUZXVDNEb3NMVVV3bWxpSHVTWDNqNEhUdG01YjVseTEr?=
 =?utf-8?B?S0NUb0JpTUtrdGEvMzE4M29xR0hjNFA3bm81TW1EMUVTQ29pRUFIcXE4cFEv?=
 =?utf-8?B?KzJrYzN6M05wYXdKZGE2ZHp2VmtEUUdtUHdLbTM3aWVwekVuYWVDNTRmS00w?=
 =?utf-8?B?WVFNSU9LOHhJUzY0R1hhdFo0TVBMMHBqRDE3WmtDKy8wbThOdFoxK21kUldG?=
 =?utf-8?B?bS9wa2ZXY0wxWWpoZ2grdWNCQjhNNjBwVk0xTHZQWFdXbmdid1VIakhZZW9U?=
 =?utf-8?Q?qyEaihItizRnTiCntd3a82Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0723efbe-e700-40c8-23b8-08dc94b16219
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 00:54:35.6933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Df81F6s4D2gspdlNjBYKW2sC2oE1XM9fYaylzsTFYr3rxIKd8udH2bM2212yGEpMFNBsqB9+Ta4U6fR09bbmr9HDZ5DlGLDaTUciYzqJrn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5047
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

On Mon, Jun 24, 2024 at 02:56:12PM -0700, Matt Roper wrote:
>On Mon, Jun 24, 2024 at 09:44:03AM -0500, Lucas De Marchi wrote:
>> On Sat, Jun 22, 2024 at 03:23:25AM GMT, Umesh Nerlige Ramappa wrote:
>> > Per client engine utilization uses RING_TIMESTAMP to return
>> > drm-total-cycles to the user. We read only the rcs RING_TIMESTAMP in
>> > platforms that have render. While this works for rcs and
>> > ccs, it is observed that this value is 0 when running work on bcs, vcs
>> > and vecs. Ideally we should read the engine specific RING_TIMESTAMP, but
>>
>> what do you mean by engine specific RING_TIMESTAMP? We are already
>> reading the engine specific copy of the same timestamp. AFAIR just
>> getting the gt fw was working for reading this register from vcs, vecs,
>> bcs. Can you demonstrate the failure with a bug open or a series of
>> intel_reg invocations showing otherwise?
>>
>> I think the simplest way to show it doesn't work is to call
>> `intel_reg write` to get a GT forcewake, then `intel_reg read` to read
>> this register.
>
>I'm surprised to hear that this has been working for the RCS/CCS but not
>the BCS; that seems backward.  RING_TIMESTAMP is $engine_base + 0x358.
>According to bspec pages 71185 & 71186:
>
> - Render  (0x2358) needs RENDER forcewake
> - BCS0   (0x22358) needs GT forcewake
> - BCS8  (0x3ee358) needs GT forcewake
> - CCS0   (0x1a358) needs RENDER forcewake
> - CCS1   (0x1c358) needs RENDER forcewake
> - CCS2   (0x1e358) needs RENDER forcewake
> - CCS3   (0x26358) needs RENDER forcewake
> - VCS0  (0x1c0358) needs VDBOX0 forcewake
> - VECS0 (0x1c8358) needs VEBOX0 forcewake
> - GSC   (0x11a358) needs GSC forcewake
>
>So I'd expect everything _except_ the BCS engines to be broken today...
>
>FORCEWAKE_ALL is a big hammer that should indeed solve the immediate
>problem, but I wonder if it would make more sense to store the specific
>domain that needs to be grabbed for accesses to any registers in an
>engine's ($engine_base .. $engine_base+0x2000) MMIO region so that we
>can avoid unnecessarily waking up all the unrelated power domains
>whenever we want to read a timestamp?

Well.. I don't know if we really gain anything by doing so, so let me 
know if (2) is what you are suggesting below.

As an example, show_run_ticks() will get called every second and would 
rely on reading the GT timestamp each second. We could potentially have 
domain specific logic here, but logic would still iterate over all 
domains since we are capturing activity for all classes.

1)
get forcewake_all
read ring_timestamp
put forcewake_all

vs.

2) for_each_class() {
	get class specific FW
	read class specific ring_timestamp
	put class specific FW
}

Thanks,
Umesh

>
>
>Matt
>
>>
>> Lucas De Marchi
>>
>> > to keep the logic simple, just get XE_FORCEWAKE_ALL instead of XE_GT_FW.
>> >
>> > This should work fine on multi-gt platforms as well since the
>> > gt_timestamp is in sync on all GTs.
>> >
>> > Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
>> > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_drm_client.c | 4 ++--
>> > 1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>> > index 4a19b771e3a0..74f2244679f3 100644
>> > --- a/drivers/gpu/drm/xe/xe_drm_client.c
>> > +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>> > @@ -264,9 +264,9 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>> > 		if (!hwe)
>> > 			continue;
>> >
>> > -		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> > +		xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> > 		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>> > -		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>> > +		xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> > 		break;
>> > 	}
>> >
>> > --
>> > 2.34.1
>> >
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
