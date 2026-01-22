Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C6FD6CFAA
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 23:01:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E633C10EB8C;
	Thu, 22 Jan 2026 23:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LRIMg1Mu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9898810EB8C
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 23:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769122869; x=1800658869;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7Waod1OZu2WPuE6dQLM4jcELZod6+g1MjzbNQW7gpDs=;
 b=LRIMg1MuOcbLHJjzUAAAm7ZaGjCCbAq97bMqfCei6HVUTNfsnOy2QuF0
 NXVLCE+gZLzo+TIkAb8EHJPDbqwGonospFISeWnTikVNiOOthyFsbql4+
 +/aqkWOUMjZdStJ+vbgzEyfA32Ysn+ElKJn1m6ymF/0PxrkdEN67IK+w9
 r6qQCtwWxXCphMvI3OpEKMs6Pt6hqb69aRlnFGiqzQAHoO0zyHuBoq0x3
 fZIMvSR77m/9ExpUJVoFM3fgi8MYMDdQ+R7LJPgfCHaU3QeqZCC+NKFIa
 fa02p61RaNIvWg4IflPYUq6TGNTeGu+nHqQjjMFK856GsaEgwen+IiMCv g==;
X-CSE-ConnectionGUID: 3HcR7pxlQEejjEES2kU98Q==
X-CSE-MsgGUID: 1bdU/d5AQ5GHmdyaXA7qhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="74004696"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; d="scan'208";a="74004696"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 15:01:06 -0800
X-CSE-ConnectionGUID: chyMZtkNQIOJy+H8cYUgfg==
X-CSE-MsgGUID: 0EyrMDVuR2yh6zxKD3xAhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; d="scan'208";a="206764581"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 15:01:06 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 15:01:05 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 15:01:05 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 15:01:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XJExspdNsBqOHoemXyNnjMBMU6PXZa8SpaiTvUR+X87/o1Nn8uOha3UDoskd+/QM+if9DVB6WKy/mjGg8lv39M1fHcdiWV5g//iw1uAYjUQPNPmAxSS5vXDOspaObF/hU+ZgHlDu0sCgRHzTSNNLno0Q86JK3WW51WSXKBx/eYf8tiVwB1XFam25GfXdquDcFqc52mFSc5ah+299dbfOyMOweCdGylLXEgz1m7cZJeWUO/36k1nkpZKRD3WjyydrD5BJ8n2Xg0lmRr3PgODfIQF7RGuTbW3piDgl+br/ZlfMW7kva0A+lKDiFSN2G6HBLsGre80P4rNEOpqoLQgGsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iiW0VAGWg0qJJqmcw3+RqIasw9CsmReTGDLd9Bxk6c=;
 b=TQudY6VjvLhEIhBwYE4lDu6smjtO89hxg0W8AXy8/Do6R+sCzaG3VP030lOajJ/3k+Elmch5sbGblorcAouoPnBT95Kbes5Q8KbfijMWuqgyyQelCRAzajFGK+IW0FV1sU60jFbmVmLT7ObvInwukU1nmvfG3Gif+lnFwk72bfaxk1ZSMzW1SyDQ3HNyW0ojxKtLiL+N39jLnW2f5JuosiDt9JmdW1bhMX3XAk8ooNCW0sBC+aIweSMN56WP1uUCU2WJcxksUxX+FFhjxCxKrHbxZZ3D3kF/aAJJ2vDpXEdSfBfJsEx9+3Fpe1y5EHbvCtaGohMz7PNQYrqjuhgThg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CH3PR11MB8341.namprd11.prod.outlook.com (2603:10b6:610:178::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 23:01:02 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9542.010; Thu, 22 Jan 2026
 23:01:02 +0000
Message-ID: <4e39ee05-0767-441e-b193-c05fba770740@intel.com>
Date: Thu, 22 Jan 2026 15:01:02 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/tests: Fix g2g_test_array indexing
To: "Mishra, Pallavi" <pallavi.mishra@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "Summers, Stuart" <stuart.summers@intel.com>
References: <20260116002529.951176-1-pallavi.mishra@intel.com>
 <84622a42-64c8-4712-bfe9-374e32cdd4b4@intel.com>
 <SJ5PPFC0624F2CA292F70351251505F39D18297A@SJ5PPFC0624F2CA.namprd11.prod.outlook.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <SJ5PPFC0624F2CA292F70351251505F39D18297A@SJ5PPFC0624F2CA.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0267.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::32) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CH3PR11MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 36b8c10b-bee7-42cb-cdc6-08de5a0a1d7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1oybC9hQUpKSFlQWlF0eGUzeVVxcTBqVWx4TE03N0V1YUlXQmUvSG1HUzlr?=
 =?utf-8?B?enh5dG1UY281OW1MdGN2aDBMWVNraGdPMDJvdWxjYjZuYjFFN09kNlNxT2Fv?=
 =?utf-8?B?dTJONE5Zak51ckN2Z2dwWFlyVi9nOE80dStqWisyTUJTZUo2emI3aHNYOE81?=
 =?utf-8?B?R3dZL2RPN3VxaTJEUWlRRmFIWnZXUFRvLzNIdEt4T2hZVTNFUEhLaDZDTXFx?=
 =?utf-8?B?NGxYVFBLbmNZaHV3NjdxcXp2bk5SKzNCeUIyUFNzVHV1TS94eVdZUDQ3d1pr?=
 =?utf-8?B?ZmNEQ204NzFJQ05OM3FaY0dub3BDZkpBeW5vRGMvRE1oeHR3dll6TDQrdmFL?=
 =?utf-8?B?UzliZFZIb01pUFNEcVdEb0YyaFNpYlNjbDZoWDdLNklJTmNYR0Ntc3V3Slg3?=
 =?utf-8?B?a3V3YnE4L1RJTGpHcTQ4MytXbnRXZVlmRy80Y0R6NXM0SndIM3V3TVNMQnpT?=
 =?utf-8?B?L3VaMmYzZ3h0UXVvc1pFeUs0OGZycWhXTkFjL0I3aGJMbUZFMExDeFBZMTdM?=
 =?utf-8?B?QnMrZzhUaXZCVEorSnNsR24xekpBTHBGdjNtcGpoM2d2V1hobXBwWXFRM1Bn?=
 =?utf-8?B?VDJrU0pLa3U3YWpBTXJEM3VTeUsxUXlWS1R4aHdZczlDVmNxRkNYeXZPUlB5?=
 =?utf-8?B?WEVvUG5jRndBUWFvUCtXMzhkT0lNaThFRDhxVGw4Ni9MMWYzUzNYeGlTVzdQ?=
 =?utf-8?B?czQwbGdIbERiL1pKWC9vMUpYb0V6REtpa1JNQi9QdDh2VzE3cXZMR3g5cHBx?=
 =?utf-8?B?QnpoMW41YzloS2lwano0MGhuSDNUQWQ0SGRTdFhSYTIwRXNPaktUekJGRUVO?=
 =?utf-8?B?YzRBOHc2ZzhYTkxKdXVZRkFzcEsxWGNVZlBlcGxIY0U2VVpPalBpN0tpMUtV?=
 =?utf-8?B?U25wQ2Y2YUc2UlNiL1EzME51cWxOM1Z5YStUVExFSkQ3cVBPdE1BenowREVz?=
 =?utf-8?B?MW1jTXJuLzhsWng4QzUwZklGOWpDSG9IZ2xnaUw1NXlMVklhR2x2cGFBdHJm?=
 =?utf-8?B?VW9xUjZaYnFrT3dsT3U4N1dtUGU3RUFJeVJsRWJUcEdHVklmdzV4bEZiQjMx?=
 =?utf-8?B?RnJCOUJQOFFHdFBZeXdBOEo5M3FFRDR6QVZxd2llNERBTlNwdWJTb0JiYmxE?=
 =?utf-8?B?ckhlWU1FNzFQQncrTXVKKzduVWdRRGxabjZNMHBkM29Kd2o4UEpHZk9Zcm5y?=
 =?utf-8?B?Y2N3KzJPbGFPam92UGd0cmROU2ZacUEvWnB5Q1BROWF5d0F5SkFSY2pWdVI3?=
 =?utf-8?B?SnhCOVl1dXZLQk1vZS9aYzBBNUJaaFJuNCthbGxkeUdCRDRFV0NVNGZNK29r?=
 =?utf-8?B?V0N5QjQ2dC9hcy8zYTZIRGxuYmpZV1BzQS82QkNSZnY3YVBxQzhsY3ZuellR?=
 =?utf-8?B?MGdYUjE4L0ZVVVVoRGw1bFJINXVCWkc0SWZNWmtja3I5NkVORGtLRUJrMFUv?=
 =?utf-8?B?OVJLbjlVTHZVRWtKVHp1NWxTbk5aU2JtV0VkZmE2eVFWaTdXYUlFUjNsRDZk?=
 =?utf-8?B?eFdjTEhhYWpNcHNVRDJ1VnhTTXRONDR2c2tWZERLL3FnZTQvd2gwdkxpSExz?=
 =?utf-8?B?TDVUR2ZiZ0k5L05IckZOQlU0Z2FnVmo5NTBsWkxaNVFuZDNXNVNKaG5uczFZ?=
 =?utf-8?B?aTJ1Q1FCTUcrcWVkTnBESTJYTFpaNFJKV2hxTHpLTDdQdjlTL1ZSelRvb2da?=
 =?utf-8?B?QlkwOXdwcnBCWWFJR3lmOENUVFFHS1dHWER4cWRwTnFkSXJQZDZHNkUweWRu?=
 =?utf-8?B?d1o4S2pGTDZvZHZIWDBMaWNkZE5CV1YreERtNkFTOEQ2M2o1aDljVkJTcG44?=
 =?utf-8?B?OWJVNHdIVTZBVzVjUDVzN1EvcjRUZVBxQk4vUzVJa21vUjZsYTc2K2kveGVu?=
 =?utf-8?B?c1I5aXgvUGl6Rk9QOHJ2b1dTSWpBbjdyVmlRN2VqbnNMS3RPTm9tbHZhaUQz?=
 =?utf-8?B?bVBmNm5WMVpiWEhFZXZVcWlmN282QVRvNktweFpXUGswa0Fwb1hjN2dpcmRj?=
 =?utf-8?B?MHBGQTgxcjdLdWZyellCOUZTTDc4Q1dFdENicVdtL2ZxZFlnRkZMSE4rT2Ja?=
 =?utf-8?B?R2pHM2tWVkxQK21Wa3BGdnUwaFBOMkRxWjVYRGJkV3BpeHRZLzZHekdabEJS?=
 =?utf-8?Q?KpOk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHRaRElzdTNTU21EeDhlYWdROVZyOThPdE1KZEZWU0lZMTVtSVR6ZlpzVVdN?=
 =?utf-8?B?VlE3Q2Q1c0k5eThIdmEvZEhxYlJWQU4xcUgzQkI1Umwxdld5QnprRGhmL2Jz?=
 =?utf-8?B?L2JZclNoN2tDTW10dUpmaXVMTmQ0VzlGYjdlcDZhV1krOUg5ay9XMXdXK2JD?=
 =?utf-8?B?VjlZZEMyTENmQ0psaWZ2T1p1cWZUaGlvdXUwcEYyNWFoVTZJYzhMSzFGYjFH?=
 =?utf-8?B?NkcvdzlVWEhtejlTbDJYZENzMjl2c0xNOFNFVWt2RmxWenhKcGVLOVlBUHNO?=
 =?utf-8?B?UWZWSXJINS9yaDZNeDVJVmdScG1YZU8vR0x2dDc4ck1nWWNnUFAzcHRTQmJ0?=
 =?utf-8?B?ak1rZWN1NU9ielpCd3o3TlpxMFVWajkrSWRxZ0RpUjNLMHh1ZGd0UnQvU0Y0?=
 =?utf-8?B?eWZYS1hvSzRMdUZuMUhqaHkzYUVXVWQ1d2wyaTdMMTI2MjM0VWcybEJmYWhx?=
 =?utf-8?B?QTlEL0U5REROSW1aUmd3WDc3VXloWVZqM21WVmxDSVdTUXNlVWZiaFl3ZUpM?=
 =?utf-8?B?cHV0ODZ5a0t6MUVlaVh4WlBmaE9yTjVxQTJWOG1RR1NLZlNmSGpVNUM1ZnM2?=
 =?utf-8?B?RVJXNFgvNXZXd2V6dHhHalZqdjlsVEJNVllhak4yNTVvOHNZU3ErY1plUll6?=
 =?utf-8?B?SkxjWkpOblVROTBmSDZidFZSNXhrT1lWNEovOVRBdCtkUzBCZ3BJRHNMenZw?=
 =?utf-8?B?RGl2Q2EvK2NMYjEvd085UFFsRzluTVprMmlRand3ZEhBZWtHanp4RlFtUFZv?=
 =?utf-8?B?M2Y1a3d0NlAyV3M3SlRZa0dOOElQTjNhZzdrQnBmUjFmVGtZeDBvcU00dzFp?=
 =?utf-8?B?bmR5QjY5WkV6ajJYZnFpY1h3cHRmVFMyM3poRDRJUUlGMlI2TnhFZnoyRkxk?=
 =?utf-8?B?cW9oRE9FTkt6VFpPNmpxekJZT2U1MldxRndlME53N2tWd1REcWdWVGRBbVln?=
 =?utf-8?B?N3kyVU1xUlZDa1JkcnNicDhNS2Yyb0FOSTc0WmRmMEFzRHhDdi82ZGMwZVBD?=
 =?utf-8?B?U2lPZEhXM2VUaHh0ZUFQVys3cXZIU1l2TmNSR0V2S01Gc1Uzb3AvcmYrb3J6?=
 =?utf-8?B?dnkxS3QwaXRHbEJETWQvUSs1ZllIT2NzKzh6dVI3VDNrbG5qMEtBOEF0czBn?=
 =?utf-8?B?czk0b3paVlltUTBXVE80SHVJWFp0bTZnbm5YbktOeW0vaHpvR2RKWE1laGM1?=
 =?utf-8?B?R09abXZHWVdybjFkSWg4VTJ6RGgwR0xpeDRkMDlHTmp4Wno3TXN1cWExWklC?=
 =?utf-8?B?YjhvTzFjOE9uL2xKZlp0TlRsMWFkZEdQeEE0Q2RVWEpUbTFtdXp3SkRSc01Y?=
 =?utf-8?B?NHl1a3E0WVdiU2ZGZ2c3cFhXV0ZRUnBDYVcvc2pNVWNMaHRMZG93WTZDL0ZX?=
 =?utf-8?B?ZjF6QVVFMWNnblZOU1RkODVoWmNmbUdnWHkxR1dqeHh4MzkxTzFoc0lrcy8v?=
 =?utf-8?B?TGJjNElmbFBNc050ZE5FUzgyVGkxZGpBQlJ0cGtpZHduWDhoWlk1cEs4SkJi?=
 =?utf-8?B?ZXVReVVmYVpsZUF1dG51MEN1N2p5dnRUTFphVldQS05MVjRWQmgrRXcyd2ts?=
 =?utf-8?B?YzlVa3BvNjdieXptR21aYnJjNy9PZUE3c0hQUW5VWkJZR1dWN0Z1ckFHV0hK?=
 =?utf-8?B?ZGl6cEU2VWlYSHNGbmVrV1NhYk1EQUN3VWhieTFSUUJLcTY5ckZaWjBsNmlX?=
 =?utf-8?B?TWJNWjlpUlN5QzdKY1U1b3Q4bmNyT3VxUldWV0E4S0preEFTRWNuc2piaG94?=
 =?utf-8?B?Y2FQVU9iclZ0Q1RIR1BQZlZqVEdFZXQ5UEg5c2Z6ZkI2ZUZEbWlnVC9IbVZZ?=
 =?utf-8?B?aDZGZEJ0d1NBQ3YvaWgrRkZleU0wT2JSR1F4azNPNEExaXJTNjI2dmljSnVM?=
 =?utf-8?B?ZWQzSm03Qi9mUGl3d21uSDh4OXFLZUhpb0lKa3l3c0c4VEFyRkJQUnRuVUNp?=
 =?utf-8?B?R3VlWWhrUXlKb2swMyt6OE0vMWVoakpSYUdDa1ZaS1FNdXNuTlhTMWxmc0Jm?=
 =?utf-8?B?L2h1THVtalY1a3ZROWhsSE9KVzQ0SCs3a0IzemMxd0E5VW9IQ0pTaUV2cG5m?=
 =?utf-8?B?Q3ZVTDRuSHBIbUhrRm1UUDBXOGVHYlpRb0wrOXdUTjJBMVNLS3ZtTURlL01w?=
 =?utf-8?B?cmhSaHFRZkYrS2hEQkJ3V003ZXdGK0E1MHd6RkRJT0NKUnZqaE1BTnZIRDFv?=
 =?utf-8?B?OHZ0bXY1MmVtNDA5Sy84eFhlemVLUlNMOE5SNUx3UTFiYnNSbWNrWmZUd3lR?=
 =?utf-8?B?TVpkdFQ2YTF5c2ZPVlFzMit2QjZaWHNONFlhTFRUU2tWbThBNi9nMUJkeGNU?=
 =?utf-8?B?Mkoxd2ZxZTBmSkFjanZORXQ1QUtTeW9jUnlOM0FIVzlZazIzSnZRU2VxZ0o3?=
 =?utf-8?Q?viA3WHgNWalzWFYo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b8c10b-bee7-42cb-cdc6-08de5a0a1d7f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 23:01:02.5362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JaQqgj7PfqDrZKRRJ8k6ST0/gxP3xuxkZW4p4OyN4/eVAB/xAkkn/jWcEBAQYhWRGV476nT7qeaZjFgQ231KKTwVKdJ8adCOG/IrMRVOmAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8341
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



On 1/22/2026 11:33 AM, Mishra, Pallavi wrote:
>
>> -----Original Message-----
>> From: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>
>> Sent: Wednesday, January 21, 2026 4:20 PM
>> To: Mishra, Pallavi <pallavi.mishra@intel.com>; intel-xe@lists.freedesktop.org
>> Cc: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>;
>> Summers, Stuart <stuart.summers@intel.com>
>> Subject: Re: [PATCH v2] drm/xe/tests: Fix g2g_test_array indexing
>>
>>
>>
>> On 1/15/2026 4:25 PM, Pallavi Mishra wrote:
>>> The G2G KUnit test allocates a compact N×N matrix sized by gt_count
>>> and verifies entries using dense indices: idx = (j * gt_count) + i
>>>
>>> The producer path currently computes idx using
>>> gt->info.id. However, gt->info.id values
>>> are not guaranteed to be contiguous.
>>> For example, with gt_count=2 and IDs {0,3}, this formula produces
>>> indices beyond the allocated range, causing mismatches and potential
>>> out-of-bounds access.
>>>
>>> Update the producer to map each GT to a dense index in [0..gt_count-1]
>>> and compute:
>>>       idx = (tx_dense * gt_count) + rx_dense
>>>
>>> Additionally, introduce an event-based delay in g2g_test_in_order() to
>>> ensure ordering between sends.
>>>
>>> v2: Add single helper function (Daniele)
>>>
>>> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c | 56
>> +++++++++++++++++++++-
>>>    1 file changed, 54 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
>>> b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
>>> index 3b213fcae916..ec18086b98d8 100644
>>> --- a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
>>> +++ b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
>>> @@ -48,6 +48,38 @@ struct g2g_test_payload  {
>>>    	u32 seqno;
>>>    };
>>>
>>> +static int slot_index_from_gts(struct xe_gt *tx_gt, struct xe_gt
>>> +*rx_gt) {
>>> +	struct xe_device *xe = gt_to_xe(tx_gt);
>>> +	int idx = 0, found = 0, id, tx_idx, rx_idx;
>>> +	struct xe_gt *gt;
>>> +	struct kunit *test = kunit_get_current_test();
>>> +
>>> +	for (id = 0; id < xe->info.tile_count * xe->info.max_gt_per_tile; id++) {
>>> +		gt = xe_device_get_gt(xe, id);
>>> +		if (!gt)
>>> +			continue;
>>> +		if (gt == tx_gt) {
>>> +			tx_idx = idx;
>>> +			found++;
>>> +		}
>>> +		if (gt == rx_gt) {
>>> +			rx_idx = idx;
>>> +			found++;
>>> +		}
>>> +
>>> +		if (found == 2)
>>> +			break;
>>> +
>>> +		idx++;
>>> +	}
>>> +
>>> +	if (found != 2)
>>> +		KUNIT_FAIL(test, "GT index not found");
>>> +
>>> +	return (tx_idx * xe->info.gt_count) + rx_idx; }
>>> +
>>>    static void g2g_test_send(struct kunit *test, struct xe_guc *guc,
>>>    			  u32 far_tile, u32 far_dev,
>>>    			  struct g2g_test_payload *payload) @@ -163,7
>> +195,7 @@ int
>>> xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *msg, u32 len)
>>>    		goto done;
>>>    	}
>>>
>>> -	idx = (tx_gt->info.id * xe->info.gt_count) + rx_gt->info.id;
>>> +	idx = slot_index_from_gts(tx_gt, rx_gt);
>>>
>>>    	if (xe->g2g_test_array[idx] != payload->seqno - 1) {
>>>    		xe_gt_err(rx_gt, "G2G: Seqno mismatch %d vs %d for %d:%d -
>>>
>>> %d:%d!\n", @@ -180,13 +212,17 @@ int
>> xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *msg, u32 len)
>>>    	return ret;
>>>    }
>>>
>>> +#define G2G_WAIT_TIMEOUT_MS 100
>>> +#define G2G_WAIT_POLL_MS 1
>>> +
>>>    /*
>>>     * Send the given seqno from all GuCs to all other GuCs in tile/GT order
>>>     */
>>>    static void g2g_test_in_order(struct kunit *test, struct xe_device *xe, u32
>> seqno)
>>>    {
>>>    	struct xe_gt *near_gt, *far_gt;
>>> -	int i, j;
>>> +	int i, j, waited;
>>> +	u32 idx;
>>>
>>>    	for_each_gt(near_gt, xe, i) {
>>>    		u32 near_tile = gt_to_tile(near_gt)->id; @@ -205,6 +241,22
>> @@
>>> static void g2g_test_in_order(struct kunit *test, struct xe_device *xe, u32
>> seqn
>>>    			payload.rx_dev = far_dev;
>>>    			payload.rx_tile = far_tile;
>>>    			payload.seqno = seqno;
>>> +
>>> +			/* Calculate idx for event-based wait */
>>> +			idx = slot_index_from_gts(near_gt, far_gt);
>>> +			waited = 0;
>>> +
>>> +			/* Wait for previous seqno to be acknowledged
>> before sending */
>>> +			while (xe->g2g_test_array[idx] != (seqno - 1)) {
>>> +				msleep(G2G_WAIT_POLL_MS);
>>> +				waited += G2G_WAIT_POLL_MS;
>>> +				if (waited >= G2G_WAIT_TIMEOUT_MS) {
>>> +					kunit_info(test, "Timeout waiting! tx
>> gt: %d, rx gt: %d\n",
>>> +						   near_gt->info.id, far_gt-
>>> info.id);
>> Sorry I missed this on the previous rev, but shouldn't this be a failure? If we
>> don't get one of the previous messages then something has gone wrong.
>> The patch looks good to me apart from this.
>>
>> Daniele
> I think marking a failure at this point may be too early. Seqno check validation happens later on
> in g2g_run_test() and also in xe_guc_g2g_test_notification(). If any notification is missed or out of order,
> the test will fail at that stage.

Then why wait for it at all? either waiting for it is significant (and 
therefore we fail the test if the wait times out) or it doesn't matter 
because we have other checks later (in which case we can just avoid 
waiting).

Daniele

>
> Pallavi
>>> +					break;
>>> +				}
>>> +			}
>>> +
>>>    			g2g_test_send(test, &near_gt->uc.guc, far_tile,
>> far_dev, &payload);
>>>    		}
>>>    	}

