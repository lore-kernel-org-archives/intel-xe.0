Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB47A606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 16:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=imFkS0hN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D7910E676;
	Wed, 28 Oct 2026 16:03:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693FB10E676
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 16:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793203390; x=1824739390;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NR0OCGgbUnzSqykuCXFQx/63QZFYQSOwlF9crYacvN0=;
 b=imFkS0hNnT0kS8vDwNVqQJEBFEnPau9v3+87N70CMc1pTmE8GihN76ZQ
 /Jx8ph3lLdIm4eMIGWDVstqpJOYvbBrSOvAFNFwgVsWbF7xo/qrBA7lNx
 J8bz4RXB7O9WmnCmKGhSLGm5OQtag0WFnW/VPXFQCmIdi+i2idMVLPp/L
 SeBUjGnCE3HBoko6SUFNiMy1/HeC0k2BS1zO4BrHxcLx6QjHGLZDAxhe9
 xsBmyL8w8pWqDLrRAEi5gGk4OVhw6QkUcZBR+jAWwtvbb51zugRdfc4d5
 h+zJprh9XqlRA5Ogl2KFwl1B72/0OgSlArMgNB9jl6nTY/c+xRm2ZxQiI Q==;
X-CSE-ConnectionGUID: gko3K3caTBeQSCMsdsckOQ==
X-CSE-MsgGUID: YGf8NGiOTLa2N8BSeP/3ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1932008"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1932008"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 09:03:09 -0700
X-CSE-ConnectionGUID: 7VArp620TYe43IaLg2TvWw==
X-CSE-MsgGUID: LNcdP8KUSRG6EF+Jg74pTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="4889251"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 09:03:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 09:03:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 09:03:04 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 09:02:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouvx6ISxVZLmuFZVUBjpI12YIOOqRWp+SrmZ+fIbGxrHabE9SQYt7ofb6Qi6RiKW7GXtggqLN7EzwopbHMsCzPSRCiZbeHgwQOOdTl0GRYiuBTaifj9xFCkY29TN1pHBajuWnVLn6PeV84oJX/mIj5m5V+Nq+vk4jZbJHAUN5b9nX84RsksHpRfgZKfjDgXdmYu5KweOETEE2ylglPISTiw9PH69gcGZu+qaoc0C91iiqd1kKbm60FgzjYnfjej+O7BV2SUYmY68DWBbEIaTlSBHEYHcbTrvhxkR3/SnDwI0hacluTcoUWfIxGfdGgBU63L7KLUxv6UX+kAQUJX/ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgvOTQ3VvWkfHr2luCadLn10Iq/qEYhVFazxF6iennk=;
 b=kaNG0s7OsTM4kB6I4UzdH7qdLzuTi8g1i/gurKOJ3HGv0UdcSIyl4t8zj/Fclsp/noSptktbOIU0TOpLDgLiUp0aRcUDXpxgPGVu7a+gN5ULZ1EIFTjEc9tOZNjgtW3CHRjoEgnpdP6S37/2MbNKTC3FDFKhJZQTJY7m1N5A2AziU6auEjkWkLBPEfcdoHV3m64HlD6klaGf+IpEOExZ++VQF3N42U62LPxRDEzC5qGUrF9kCKul/HcLnxghYE0UQIqf1b4AkjtjqCjOPPX0azJCRQ4Wi6WCitHtqPc42gaAf9TI9mAG4kly29jX31ItmG/beup/JUdBmZ6/a7c+qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB8856.namprd11.prod.outlook.com (2603:10b6:8:253::22)
 by LV8PR11MB8488.namprd11.prod.outlook.com (2603:10b6:408:1e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 16:02:37 +0000
Received: from DS7PR11MB8856.namprd11.prod.outlook.com
 ([fe80::6613:5e2:a45:1111]) by DS7PR11MB8856.namprd11.prod.outlook.com
 ([fe80::6613:5e2:a45:1111%4]) with mapi id 15.21.0546.012; Wed, 28 Oct 2026
 16:02:37 +0000
Message-ID: <eb2cdda5-9df3-4994-a95a-a51168cebfdd@intel.com>
Date: Wed, 28 Oct 2026 21:32:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Store mailbox temperature data as bytes
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
References: <20261023103631.432279-2-mallesh.koujalagi@intel.com>
 <5f4ec40b-ae68-4a04-8f57-573e02a29d3c@intel.com>
 <507815d9-811f-47ce-a449-e7cf9aeb05cf@intel.com>
 <239f14f8-87bc-4671-8564-edbe6b14481a@intel.com>
 <812be929-0fb2-4eb3-9cc8-310e945848cc@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <812be929-0fb2-4eb3-9cc8-310e945848cc@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::8) To DS7PR11MB8856.namprd11.prod.outlook.com
 (2603:10b6:8:253::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB8856:EE_|LV8PR11MB8488:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a3525b3-f6f8-4358-559f-08df350ce2d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|261026121527099003|11063799006|56012099006|261009223027099003|4143699003|261021123027099003|261022105027099003|261022115727099003|261021121427099003|261028144727099003|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info: DQLLWIX0orQdhggNAOuRxJ+lVKoe/6k8xjfNBRu7XVbeexWukiflyNVyArxhs5CKSdmN288Ke7nSCWjui6ujA/VaHopWWtX7ZYJwaW9bY83fGwi66Wf2ZW13hphfD+WEQLOLz73wCPKGnnOXuiSmMQEurBjhS6WEh0zytnBQPF5yZK5YMUYqLA+1TGriUCSInTVuzEHYhRpVAfrzaKB/iN3asSztTFWtPt9/36KGcB9STlOHeMMksMpumbl/A4Ztg977trr9XL22dfX+QWLxMSSeMq6moZ+C8nm2VgXz6hKK0SXb9Nph//pCtMB5fDd/At3n6g+TCOxkwoY2Cl+g+76AerM2WpvDZ3fqbtrliZ8byCIyEFQzo/KVVAHWKdNwyj2wt0SPk0YNmeEuC3ofZAg43vqLBQCJJtM+gV1EZ6boD0jxXA79F30aPwpp/0JWZZyCLDvumrY2/gy4FS8afVJ3yIVsAPf5G6TWmt3Npcm2z2yrWTPKpTYGfzwIx4DIAl47FG74icc1WusY1EfqO8OOp98ok3FM+x9Os7XSR6zDcycnW/0jihENA39d2rJL6U8rq80SPRC+8OG5K2Q4KpEE3wF6KRADe8yRxz/RiXHbwtjFJO9ILMA93vNf96yjYJbCYj5LjqPJOcH2gpzr3TraHTTfpWrMFMCZOBvq0B8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB8856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(261026121527099003)(11063799006)(56012099006)(261009223027099003)(4143699003)(261021123027099003)(261022105027099003)(261022115727099003)(261021121427099003)(261028144727099003)(261026140227099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1FpNCtGMHdrdnpWY0RXQ1FUdUlqRnFpVUlxVDlXZ2xzTE1wWGNvNGpSN2JR?=
 =?utf-8?B?MEM1akVYNmVMUkh3NStQTU55SXArdE8xblNYNlBhNEFpNk4wOHV5QlpSemJF?=
 =?utf-8?B?eXZuN0FUZTNTRzBSODdCWGNTc3pQbVh6K0d3T0tsc2QwU0MrNDJ2QkxzcWc2?=
 =?utf-8?B?eXFxWExyVm84dnhpbkpYTzVIa2dPWnFNVnhzSDlEU2grODNhMDB1bHE5OXBH?=
 =?utf-8?B?SXAyZytVTXdYM2xiWWNXb2NEdmNZRUNkL3RrMjk5WC9POFN2aFBHb3RVS1lH?=
 =?utf-8?B?OW1NczlKc09mOURuODk1V0pJb2VxNXFVazBzcFVweDNRbFdNMnRaSU9ESTYv?=
 =?utf-8?B?bzNVWmZsVFNCcUFPZUhSR1BQZ1prSzhEQ2xGRmw5a3NIaFBiUE1ydjE3eE9n?=
 =?utf-8?B?blMyYlB1YmJId1dVR21NcUJ4YW9TUUtWV0xsWWFwV0wzTUN0U0hWR2tGb2xK?=
 =?utf-8?B?VTZrN29UNldZQTZVRlplZUJtZnhOaDRGLzFDSG1PRnM4MDEvVlBDZmJOTHBG?=
 =?utf-8?B?RncrMndnUUJzUnZBK1o0ZFJtaUFHUzZTYkx3Y3JIc0pSTm9FWXozSWh1U3pP?=
 =?utf-8?B?bjBBN0l1Qi9kZHlEVEpWSFdXOXlpdFdDd01BN3BodGRnVVJ1YVdOd1BSeEJq?=
 =?utf-8?B?bTVQeDdsVUJmK1FnSC9NeEhReU5TVlJpYVFaZ2h5VEhVaHdLYkFPa09Db0Fs?=
 =?utf-8?B?eHA0eGZhWXJmTXpkQXJjS09tc24vNjA2UERLU2s5ZXJ5RnNhc2VLbDZGRkE5?=
 =?utf-8?B?cHBOTXplOGd4bDkwSzlXK05qTnhHeW9sUkZrdXlseUQ3S1hMclNTT0pUTEg4?=
 =?utf-8?B?cTZBSTVBaDhvTFplU01JQW1SN3FuTVF1ZWZMSXBZbUZnZURwTEJkc3QvK1dZ?=
 =?utf-8?B?dDBpNVNkOXNPckdHOWFuSHVuZFRvOXlTbjhFVlN3Ynd3WENFWXFFK1Urd0tR?=
 =?utf-8?B?b2U5NVoraFFudUkwKzMxOVZheDZscXh3aHFtK1MzNUxla3lodDg3ZWl5NHRt?=
 =?utf-8?B?V3p5dHJ6cmV6Vm9CN3pGWTd6MVpUT3lCRUxBb3dSSXQxd09sMWlTek5SRUpP?=
 =?utf-8?B?cVZHenVDeGFWRnYxUmRwWlBGbnZoTGhZWnRNS3hKZkh6cFZVN1ZpNHZJUFZm?=
 =?utf-8?B?cVhWR1d2dVFEY2dIZEk0UDJwSWdRQWg5NWRjMnNsYkxMOHQrR1NEdUZCT1lN?=
 =?utf-8?B?NFl4OURiOTFjNWNFYlBZdTl2NjZvdE95MUVySk4rLzNKMno0aHR3d2tLTEdz?=
 =?utf-8?B?Qld5ZXBnQ3hReFpDU0h5YVErNHo3Z0dVSXREdmRoRDZTakhocys4OTVIeHpE?=
 =?utf-8?B?RjU0WGRudU8yTjdSNk1zbnNqeXBueUx5MWdmQjEvVWsxekh4WkFoYU81alpn?=
 =?utf-8?B?bCs2K1ZMUE0zeU5ORHRnNTRieHd6SHhCUzhVbGNnMkJ4WFppN1JRdFY2c0pU?=
 =?utf-8?B?QnBMVlZlQmJhOW9WVUR5ZElQYVBGeVBlL1RpZ1d3dW5pc0tNN2poTmNGTUZi?=
 =?utf-8?B?Tjl1Y1J1YXhuVENHOVNjYWxqSlBEWFhPVklCTm9QSVAzeUI1dmh4a3BpTG1a?=
 =?utf-8?B?ejN5eXhqamg0RTY5NjdQaUl6SkorcHdOeHFSTE96SS9aaU53bEZSTVZtdGQw?=
 =?utf-8?B?ZVdXcGFpQjg1TUo2WW5Da3NheUt2bmU2NkNpSDRwM3NNTmt0UjRNaVhTVElt?=
 =?utf-8?B?eVBZMy9rYnN2L2kxbjZKK2lGZE0vM0lRNllMbGNrTVZiKzRWU2RUNkhJcko0?=
 =?utf-8?B?YUVySmRsaFVuTXhpOUwyQjEwYnhzYnZSNjgzSFkzY2plM2xxV0xwaVprVXFI?=
 =?utf-8?B?ejg1K0J1Z0YveGpxT0x6ZEx3Zzg1b3U0OXBTNkJDWGRidGRleEFyOGFCRWpE?=
 =?utf-8?B?c1hDRUNvZ1FlR3UzcTNyb3M2K0FOay9SbjFBRURtcWJjWmxYSjhmekh1a0x6?=
 =?utf-8?B?YTJiQXRtbUxVN3hFaWJyS1JCSGpySkRndEgrZDdReHczNFQrRnFSZjRtWWlU?=
 =?utf-8?B?WW1TV2wrM1VLblNqRjlpMCtJaG9HNEtVd2ZnclJML2FUc0Z2VTlGT00xMmtn?=
 =?utf-8?B?Qm1CWkR6U0ExOWsrbWJPOWlPakd4ZHljLzVDWFBGRGFwL1NEQzNTZ0YvdHFD?=
 =?utf-8?B?WHFMc2hkVTdvRE1tK3VPUGM5ZFNMRVpLRFFCTEtwNjhnUnhZRHpMV3BUYy9p?=
 =?utf-8?B?YTRaUjFaei9YUGhua3M5eFRhN3dMK2xaNm1UNWJpOVczYUllcUJVZlBURFBt?=
 =?utf-8?B?Q1gxYWtML29aRzd1NmZ1NURKanBCdzYzdTNKVDV6UDJkS0d0Mkp6cFFsYnN1?=
 =?utf-8?B?bDR1em40dWswTjcxcnRzVktBUEk1c29PdEhueDA2anVQR2g1U3QxUT09?=
X-Exchange-RoutingPolicyChecked: t1xbdCrBt5AWZiNYTmxd1M3gH1mkaKULYONqQEsqpRfLJsb0r8Msh8/RrFupck79oNKtsQOOSffHeKPAeQNfDcqTNs49TgtW1E3PZT5Xzunp4/b2+XZ/1tn+JJMwrOR9R2X9AfB6ph2ypZ3pA5u6jz+cqObAvodgq+uhkP9d4TO3TAselz9x6HKVzF1ZBSqFshwShogRRYv54499qzEzs190yUA5uBSaHNu9XT66Ckr89VNMOFHjdH6NVwCCwBGTPsvFGsg2V3pWZrTsdnk4EKFdwkUb0bnCoQrxF3XmYy/h6xP571Rt28d+FlR95J8mtLlxALl/rNZh9+tuifxzSA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a3525b3-f6f8-4358-559f-08df350ce2d3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB8856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 16:02:37.3413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qyzDmxOk24zqOXkzcZHx/JTRHINKIFMtB5QuYs/1hm6cKbxc9LxiI75ZKBzLBZ0Zf5ihwx1QTHleXw2gpTzFSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8488
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


On 28-10-2026 18:36, Mallesh, Koujalagi wrote:
>
> On 28-10-2026 05:06 pm, Poosa, Karthik wrote:
>>
>> On 26-10-2026 17:24, Mallesh, Koujalagi wrote:
>>>
>>> On 26-10-2026 04:47 pm, Poosa, Karthik wrote:
>>>>
>>>> On 23-10-2026 16:06, Mallesh Koujalagi wrote:
>>>>> Store pcode mailbox temperature data directly in the byte array
>>>>> using put_unaligned_le32() instead of accessing it through
>>>>> different views of the same storage.
>>>>>
>>>>> This keeps the layout unchanged and makes the data access
>>>>> consistent and endian-safe.
>>>>
>>>> 1. Is this patch addressing any issue reported by a static analysis 
>>>> tool?
>>>>
>>> Yes, it's reported by static analysis tool.
>>>> 2. Given that |cpu_to_le3()| already handles endianness, do we 
>>>> still need this change?
>>>
>>> Yes, cpu_to_le32() already handles endianness correctly. The main 
>>> reason for this change is not
>>>
>>> to fix an endianness issue, however to address the static analysis 
>>> warning about inconsistent union access.
>>>
>>> The code writes data through temp.dword[] and later reads it through 
>>> temp.value[], which was flagged as
>>>
>>> inconsistent access.
>>>
>>> To avoid that used put_unaligned_le32 writes directly into the byte 
>>> array that is later
>>>
>>> read, making the access pattern consistent.
>> I understand the static-analysis warning about writing through 
>> |dword[]| and reading through |value[]|. However, since |value[]| is 
>> accessed as |u8|, there should be no alignment issue, and 
>> |cpu_to_le32()| already provides the expected byte representation. Is 
>> there any known functional issue with the current code, or is this 
>> change solely to address the static-analysis warning?
>
> Agree, no alignment or endianness issue since we are using 
> cpu_to_le32() which provides the correct byte representation. This is 
> purely a code-hygiene cleanup to silence the static analysis warning 
> via put_unaligned_le32 so I'll drop the Fixes: tag and add no 
> functional change. Please let me know.
>
>
> Thanks,
>
> -/Mallesh
If there is no function issue we can drop this patch and mark issue as 
false positive.
>
>>>
>>>
>>> Thanks,
>>>
>>> -/Mallesh
>>>
>>>>
>>>>>
>>>>> Fixes: ca6e33701de8 ("drm/xe/hwmon: Fix thermal sensor data 
>>>>> handling")
>>>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/xe/xe_hwmon.c | 15 ++++++++-------
>>>>>   1 file changed, 8 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>>>>> b/drivers/gpu/drm/xe/xe_hwmon.c
>>>>> index 42acfeb8818c..7bb1223dc30b 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>>>> @@ -7,6 +7,7 @@
>>>>>   #include <linux/hwmon.h>
>>>>>   #include <linux/jiffies.h>
>>>>>   #include <linux/types.h>
>>>>> +#include <linux/unaligned.h>
>>>>>   #include <linux/units.h>
>>>>>     #include <drm/drm_managed.h>
>>>>> @@ -165,12 +166,12 @@ struct xe_hwmon_thermal_info {
>>>>>       bool available[CHANNEL_MAX];
>>>>>       /** @msu_mask: VRAM subsystem enable mask read from MMIO */
>>>>>       u32 msu_mask;
>>>>> -    union {
>>>>> -        /** @value: per-sensor raw mailbox temperature; 
>>>>> bit7=sign, bits6:0=magnitude */
>>>>> -        u8 value[U8_MAX + 1];
>>>>> -        /** @dword: sensor values as little-endian dwords, 
>>>>> u32-aligned for pcode reads */
>>>>> -        __le32 dword[DIV_ROUND_UP(U8_MAX + 1, sizeof(u32))];
>>>>> -    };
>>>>> +    /**
>>>>> +     * @value: per-sensor raw mailbox temperature; bit7=sign, 
>>>>> bits6:0=magnitude.
>>>>> +     * Written one dword at a time via put_unaligned_le32() to
>>>> Written -> Write
>>>>> +     * avoid inconsistent union access between dword and byte views.
>>>>> +     */
>>>>> +    u8 value[U8_MAX + 1];
>>>>>       /** @vram_label: vram label names, dynamically allocated 
>>>>> based on vram_count */
>>>>>       char (*vram_label)[MAX_LABEL_SIZE];
>>>>>   };
>>>>> @@ -995,7 +996,7 @@ static int get_mc_temp(struct xe_hwmon *hwmon, 
>>>>> long *val)
>>>>>           if (ret)
>>>>>               return ret;
>>>>>           drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 
>>>>> 0x%x\n", i, data);
>>>>> -        hwmon->temp.dword[i] = cpu_to_le32(data);
>>>>> +        put_unaligned_le32(data, &hwmon->temp.value[i * 
>>>>> sizeof(u32)]);
>>>>>       }
>>>>>         for (i = start; i < end; i++) {
