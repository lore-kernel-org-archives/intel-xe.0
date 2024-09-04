Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D59CD3431
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 12:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806E710E085;
	Wed,  4 Sep 2024 12:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hkkZ5neM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2093110E085
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 12:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725453238; x=1756989238;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PtSNlOvKLNsXv9XFb7bKbQqNWm3k+iWFaEvt0gPQkK4=;
 b=hkkZ5neMX+mvv3STGSEl/SAKTX4NMIfNltKo1ktXAcH/bL0omG9m+Wss
 pVX//BIdDXSXoDZ0qIYXBiDmNsu61sPFCYx0Jam/RqCkw9yCtiGUpAjPU
 OZlHNAo2N6Q3XiSdVQKeUrIt4crJtLe3XnaCv3YP7GGwnizUiZLQM5C2v
 kz0H9cpENXi3HGNZlV68+OYclPnom+vkn1pYCOtNaW8J5+VX/LAIyV767
 rLrluQUyIk7z9ASCqb9blBBAVNzVlPmX75ftk1ETd42UuXl8cjU5pTdUm
 kHB4zyeG0riNcCKucfgq0sWWLm0jKaPsMzxD80z3Cb18g2mIBVKE6oLSp w==;
X-CSE-ConnectionGUID: LobPHNV2SHW0etO7/tNAzA==
X-CSE-MsgGUID: /9Wwrgr1TzCwFclZrDWOAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24272589"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="24272589"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 05:33:58 -0700
X-CSE-ConnectionGUID: Zt2PSDFVT9K7rYXjJhb9tg==
X-CSE-MsgGUID: h+2PY4UeSwKC/KWo49vCAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="96056313"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Sep 2024 05:33:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 05:33:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 05:33:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 05:33:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1vZw3m5KKUOK+bgEBfDbAzPfgqAyrWgjTiDSh4Mjrww2X4n+aOfC3QUETLg65HYviiSIP+yMPw/DjYbyu5+Vzp4m+D0ssWC15vvzZVUl+9/jd5Hp9u5zW3w92WLKbVASQjGNs6eX2HpXWIRWxzjvJpG00mrcNxVWf2/x7f5s1ibLwN0EQeLcnduDk3tcNegHIOtMsMugmnhAMltHehUqWJdnTC0yS3Xw9RzQ2NO+O8z8G52/Qq9Bq/tCwHwX09PXrk0dWOasLg1GA2USC1XZSlzcq3+H9eGCkVy/TdY3mQU4H9JZkyXVez/6AA+oQfQq4nREdborRBbDY6bojCndw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEITHE1jhoOeJhUykJqWg0pCrxE1oazmkcbmYvjIrjE=;
 b=DJdng5SKHQtLwheLxAtmAYcuiFM4Z8oeLNY48qVCpH8eutpj8Hugh6igQp5ff4WvGY8iOiizued1Cajrc/RnSg4lysTXLj6c+iWQxiGXFy0ESO/5Yqw7JdCBC74BqZanjhCBX/1OY3DT12gvsuNXzEoc797OUV80tx95ZD9ADqy/Xu/CuSwccsOPpAgUAf/BmaDnici3C8rcp+I7uIb8k7nsvDocKjFzHwQfHBZRma39cvibHi66WtzRRaom1u6b9JOUp6cfkPnwCvL+H9sCWlByUtwZxpWm9NyewLZpAHE2CqyWDtbOjoTdD2mI0kFvx1vM08FKQ0hDiL40oATpEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS7PR11MB7805.namprd11.prod.outlook.com (2603:10b6:8:ea::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Wed, 4 Sep
 2024 12:31:36 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 12:31:34 +0000
Date: Wed, 4 Sep 2024 14:31:30 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pf: Sanitize VF scratch registers on FLR
Message-ID: <20240904123130.ire37dt5z6vakmrl@intel.com>
References: <20240902192953.1792-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240902192953.1792-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI2P293CA0010.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::20) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS7PR11MB7805:EE_
X-MS-Office365-Filtering-Correlation-Id: 59d5171d-5071-4b73-b49a-08dcccdd835f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SS9yVUlTcDh2NTBHaldWaHpFMGFEWmZtaS9nc1dUbllQQkZmQ1g1OVErbWZu?=
 =?utf-8?B?WDErVG5TcktvemtrMmJrbHR6bU5IK09tdlI1aFU2VTRJMjl0ekF3ZnNSamRB?=
 =?utf-8?B?K3JrVWphM1lUb1g3YUlSUEFFZHRJVFlyVGJPb2RiazdJRGkxcmM4eHhyQU5Y?=
 =?utf-8?B?dStldm9lcmNNYnJhVlg3c1pEZU45WUJLRHlFalpwRC9KNGZLUGtpNi9nVjgy?=
 =?utf-8?B?ME13TmV4dTA1WDdRbkhiQmxwN2lwWnRLYUhhM2x5VGt1UVZyQ1NIaWt2UTcz?=
 =?utf-8?B?TWtIZm5keG5za3hvV0ZaZG41WXBxbUJCcWZwV3pQWjM2UzR3WExhU2FiM1V2?=
 =?utf-8?B?SFVCWExvdjNMbVg1alUvN1ZLa2JqbVE0SXdUT2ZhbTlraG1uRGRiKzQxT2hl?=
 =?utf-8?B?WkNwaktXTkJBaGdWM0lLNWVEVzY1SFprQjJkZDcvV3g3Y0FSRFVkdlg3NXlr?=
 =?utf-8?B?eklNR3BiTUNlNGtkeXAxTS92STNxUGE2REJVVi9pdmJSM210Mno3aVJIdjll?=
 =?utf-8?B?YWJUb1BtM1VnR3E3cWU2Y2xXcldiMExOTFgxK3lOSFEwR0hQcDZhaWxDbklw?=
 =?utf-8?B?UmZlRFZmTVBzVXhqck9RczZkNUlNUGN6YzZNaWt4Ty9SdVFyV3QrRkFsZEhl?=
 =?utf-8?B?bW9CUzZNL1JwYzBqajlidlZjcldyT0Fka05pajJocG1kQXJJNlNxUS85MTF3?=
 =?utf-8?B?eC9MOXlZRlA0RnkxVkxuRTI3bGtBb2ZqL1M3ZXNTWWpCa0crRzE0YWpXWncv?=
 =?utf-8?B?S0JpTTVvWlhaZUZiQTB6aTM3ZTBlaHhEejhyVVMwWDlVaG1abTBQM1piYUxr?=
 =?utf-8?B?L0MwZlljVC9xTE1WR05PYmhxS08wc2FNWmtJYWNjV052VlpINmNDd29RRUVO?=
 =?utf-8?B?MWQ4SmpLVFlFallGOU5VK2NwS3JNWTlZek5wUldxUW9vdnVINHgyRVVSVlI3?=
 =?utf-8?B?RXpIMmVMbkN0STNNOUErQTA3UUJDbGVUb0t3Uyt4bER0bnkwWkh6TUYwNEZi?=
 =?utf-8?B?WkloRFVlaThkY0ZSNWRhQkk3WVpnMWE4QytGRDRrek8zZnJXSWNHbFoxSjZp?=
 =?utf-8?B?TjJTd2FkSHdob2t6OVJldkdKaVZvMDhUaHVrd1c5RllJaDhYMzZSbzV2R05r?=
 =?utf-8?B?NkhXLzQzYjBYemZmQXhDVjE2Z2M2Z0phbEJnK1AwcitldExHMkhOUUkyU0ZT?=
 =?utf-8?B?TTg5QmxMdGE0MmFlWTdiT01MZXk5eG9TTE0vNFJCaWJ3S3FHL2VrSHBkS2FN?=
 =?utf-8?B?VktBRC8yN0dYWk1MNUVUVnk1M3kzRnMwL1N1TkxGdVM0VWpQNlZydm9vWGMw?=
 =?utf-8?B?czJFNDJTKzQvSGpaelFoSXVoV3BGUE1NNklXTngvRkpEK2xjWWZ0R2JLd21i?=
 =?utf-8?B?Q2xUVVUwT1d3K096Tml3bGNzZkpiNTdoS2RKNzlkYmRqSGd0RmlZOWNOSDEv?=
 =?utf-8?B?Qzg1ZXQ4RUh0Zkc0K0MvTis3bVBCZFB6cG56ZGlHTXJQUXZnRC84VnR4Y2tp?=
 =?utf-8?B?UDA3eUZ6QjFhU0hHdHFjazk3Kzk0VUJyUlFZRUJSSFcxdkEySmVIZmhmTG42?=
 =?utf-8?B?a0RpZEpUbEV3cDVhOU8yMHVkOEJMdUl5TUFVeVdaakQvMDRPemwzTSt2ZTV4?=
 =?utf-8?B?VnZYUk1HTGs0dnlqS1FUY2xnb3N6RXBHMHRpN0Q3T2tadlJacVlHN29qOUR3?=
 =?utf-8?B?bkNWaU1Yd0ExSEpsL2hvVDdKVkRBd3JMWGJUUUh1SWhMZzlXVjFXK012WVJl?=
 =?utf-8?B?T1N5SGFCZW5ZVjVoeUxrQkhjRzg1b2VYZkFnVmNaNWZiVjRab29yanNhSXF2?=
 =?utf-8?B?UXBhdFBodk9iSWQ4WDgwZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlErMDh5RWx0VDhhSkpIWkFLWjIzMS81RVFKVGRoNEdIQWp0REQveTQvR1Jo?=
 =?utf-8?B?UTgrd0F3TGR1U012bmpiNTFJOVNlVjhRb0kyQUFINkd1eS8zMGJCME5SM2hi?=
 =?utf-8?B?eFh0MENIQ3MrSC80SWMrS2wvanJpWkd6WlA1dWFIZ0NnR1BZK3ZrZURDcnFl?=
 =?utf-8?B?NnJPMlJnbWljNEExRndHa1lsOEVYUTc3aVU3RGJyODRqRDhTdzdOTVF1eUhm?=
 =?utf-8?B?Z2NBMHdPa1gxTEhobnlVNmJzSkhJVzZDbXJmRnpUOHl5OUg2NW1vb0NoMTYy?=
 =?utf-8?B?eFc2M2wzQ2ZwVmU5bDVzOWV5R1pMVms5Wkd6WFMzSlAxTkhob0lBWVJjWmlF?=
 =?utf-8?B?YzFLaHMrdG5sVkNEOXpXSWg3NGMyb0NHS0ZEWGNlcHgwa0VJWjVGNFhWRitU?=
 =?utf-8?B?eUpCTjZweEt6K0pKdyt2dS9GQm13clNEWnlVVU10a2V2SUl2bEJIOFplS1VF?=
 =?utf-8?B?M3d6T01RUWc4eDZjUDFlYzE1SUUxVWhMWDZXV1JaYWM5ZHhNUXAycmZhVXdp?=
 =?utf-8?B?UEEydHhkUi9oblNLTTh1Ti9xM09vREpUWDlhSDBocU53QjRnZllHWmRVMGFw?=
 =?utf-8?B?UGdLcjZIRzdxcU5oaWlSTGxQR3FPcGdjYytKamFtcTlWVURVd2hZUlRoTGxP?=
 =?utf-8?B?Z1BMUm9UemxnZktuQjlRQnljbzYvTW81K1BGcG9WTC9aandLeENXWmtkTXBE?=
 =?utf-8?B?UkhxT0dSTkVvUWpHMHRUcWpBWjVVdDh2NCtLSHZkU1NXKzJnbzVPSjh5UjFD?=
 =?utf-8?B?NHZCVW5Palk0bmg5dEFjVlZwa3QxTFZsWkdGQTFxbFFSSzlHdVdERm1SNjBR?=
 =?utf-8?B?VUJqUDR6WDRIL2ZzdWU0REc3T01EUXROdHpnY1NrdnJIcUYxK2o2Z25yM3F3?=
 =?utf-8?B?azJLS05DTU15SEFFbVZFQXU0SGtOcHMwcUtGWWxkc2RZRWN6aVNMczNqS2s3?=
 =?utf-8?B?Z3lNeDRxN01hYUlDWU1sZ2ljV0svZTdBbUdyU2lwMHJpWVluaHdKVDUvV3NT?=
 =?utf-8?B?Yy94Zm9jdVNGS2VxMEl3QUplVjZqSVpOSmtvYnJ1a0paZkIyVGpqa3dnR21z?=
 =?utf-8?B?N0hUTW5sbEhUV0hMZjlRdjFSTklnTjRKbEV6TGtlZWxsbDBDQmJzREgxbER2?=
 =?utf-8?B?ZXZJTS82cUlqY0U3ZlVZNGdvam5wNjNTb2lsSE0zQkp6dklmdHgvcmpOYzRB?=
 =?utf-8?B?SkVERXczQzNrUnhwYisyTzlVVStoT0xLK3c0TkZEUzFCZFFTNG9OdkJ6UUda?=
 =?utf-8?B?d09VV0xPeithRHJqY210MSswaEdwVjlPeEZLK0xiQ2ZVKzRaUFJvd0tmSkFs?=
 =?utf-8?B?TWRSTzRpb21tdEtyMDRKYnBmUHNoallBbXNpdnNFNGs2WlowNTJpazNuQ2lP?=
 =?utf-8?B?K1ArcXQyVUc5cFRzQ0l0YnZGSHh2cXd5TTVZN1VDUCt3ZkM3MEc3VTc5TkN1?=
 =?utf-8?B?aXZBS1BTYUdkNUI4WnRwQ1EvTGh0YkdXZEM3RDdsQ3BwYUdtMWVNbmlHaHBu?=
 =?utf-8?B?L1JUVVA1aGRCQWxFcmZzOXNpUUw3emNGa05VYllvbjNGakdwNWdGdGhBcFEr?=
 =?utf-8?B?eldiSlNsUjROZWxBTnMrOXU3cGtCNHdEUngyMi9EcXE1cnp5TmVkbDEybnpO?=
 =?utf-8?B?T0wwRUdYZk9nTGxXQTA4a1Qwamk4M3JkR0pUdm9RMzZMT2pHWCtvZHgxeW1R?=
 =?utf-8?B?ZkM0NE1vTmdjcWRwM1JLWldsQ2h5NU84MEZRRXc4WGU2aUxaNG82V3BvVFdk?=
 =?utf-8?B?bHV4cWNLWHc4bWlvSTlQODI4Znh1WVFNK1FKWEtHK2MvOEJzQnJIQWVYSkti?=
 =?utf-8?B?bk1CY2w0a2pLQ01HTVpUQUs4NXQzek9DU0FEU29aVlhWaElDSTlHaUNLbGoz?=
 =?utf-8?B?bldnVklkVTNQTmJscXRMeXlLY0p6VTVjWG0yTDR3ZVQrck1QelBBbFZ0SGZk?=
 =?utf-8?B?Q1htb3hXMzRlUG9VOHRtWTB6RTlyN0ZndFVEVmJNQm1vODIwczJncVdmZU5l?=
 =?utf-8?B?VHBHM0ZnTlcwbUkrNWIyQ21hSHBkZ1JwbWxVa3pmWGhha3lSTnlNU2Z5dXJz?=
 =?utf-8?B?NlYxM3c4dGRzQURVamkyOVhzOVIvQ21NTW41NTNwamhmWVFOaHk4R1FyVVNY?=
 =?utf-8?B?bTBMdklIcnZLYk9rZ0h3anFIYlh4UjlGalFKdU9WQWFPNXFIZXV2MWw3QytI?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d5171d-5071-4b73-b49a-08dcccdd835f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 12:31:34.5004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mxc8yjFXXlWUHKRfrahCeRKKQAI7BGmJn66RXo1oQd5Yb/Lg4OMWiCn5WecrciOEXthikXYpByefpOZ/P+jk1E4ivjtd8Ojh61TRzgYLTTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7805
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2024-wrz-02 21:29:53 +0200]:
> Some VF accessible registers (like GuC scratch registers) must be
> explicitly reset during the FLR. While this is today done by the GuC
> firmware, according to the design, this should be responsibility of
> the PF driver, as future platforms may require more registers to be
> reset. Likewise GuC, the PF can access VFs registers by adding some
> platform specific offset to the original register address.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c         | 52 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.h         |  1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c |  3 +-
>  3 files changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> index 905f409db74b..919d960165d5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -5,8 +5,10 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "regs/xe_guc_regs.h"
>  #include "regs/xe_regs.h"
>  
> +#include "xe_gt.h"
>  #include "xe_gt_sriov_pf.h"
>  #include "xe_gt_sriov_pf_config.h"
>  #include "xe_gt_sriov_pf_control.h"
> @@ -89,6 +91,56 @@ void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
>  	xe_gt_sriov_pf_service_update(gt);
>  }
>  
> +static u32 pf_get_vf_regs_stride(struct xe_device *xe)
> +{
> +	return GRAPHICS_VERx100(xe) > 1200 ? 0x400 : 0x1000;
> +}

NIT: Maybe it's worth moving it to the header.
At first it seemed to me that we have some header xe_sriov_regs.h,
but I see that for SR-IOV we use xe_regs.h - What do you think to move it there?

> +
> +static struct xe_reg xe_reg_vf_to_pf(struct xe_reg vf_reg, unsigned int vfid, u32 stride)
> +{
> +	struct xe_reg pf_reg = vf_reg;
> +
> +	pf_reg.vf = 0;
> +	pf_reg.addr += stride * vfid;
> +
> +	return pf_reg;
> +}
> +
> +static void pf_clear_vf_scratch_regs(struct xe_gt *gt, unsigned int vfid)
> +{
> +	u32 stride = pf_get_vf_regs_stride(gt_to_xe(gt));
> +	struct xe_reg scratch;
> +	int n, count;
> +
> +	if (xe_gt_is_media_type(gt)) {
> +		count = MED_VF_SW_FLAG_COUNT;
> +		for (n = 0; n < count; n++) {
> +			scratch = xe_reg_vf_to_pf(MED_VF_SW_FLAG(n), vfid, stride);
> +			xe_mmio_write32(gt, scratch, 0);
> +		}
> +	} else {
> +		count = VF_SW_FLAG_COUNT;
> +		for (n = 0; n < count; n++) {
> +			scratch = xe_reg_vf_to_pf(VF_SW_FLAG(n), vfid, stride);
> +			xe_mmio_write32(gt, scratch, 0);
> +		}
> +	}
> +}
> +
> +/**
> + * xe_gt_sriov_pf_sanitize_hw() - Reset hardware state related to a VF.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function can only be called on PF.
> + */
> +void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +
> +	pf_clear_vf_scratch_regs(gt, vfid);
> +}
> +
>  /**
>   * xe_gt_sriov_pf_restart - Restart SR-IOV support after a GT reset.
>   * @gt: the &xe_gt
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> index f0cb726a6919..96fab779a906 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> @@ -11,6 +11,7 @@ struct xe_gt;
>  #ifdef CONFIG_PCI_IOV
>  int xe_gt_sriov_pf_init_early(struct xe_gt *gt);
>  void xe_gt_sriov_pf_init_hw(struct xe_gt *gt);
> +void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid);
>  void xe_gt_sriov_pf_restart(struct xe_gt *gt);
>  #else
>  static inline int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index 02f7328bd6ce..b4fd5a81aff1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -9,6 +9,7 @@
>  
>  #include "xe_device.h"
>  #include "xe_gt.h"
> +#include "xe_gt_sriov_pf.h"
>  #include "xe_gt_sriov_pf_config.h"
>  #include "xe_gt_sriov_pf_control.h"
>  #include "xe_gt_sriov_pf_helpers.h"
> @@ -1008,7 +1009,7 @@ static bool pf_exit_vf_flr_reset_mmio(struct xe_gt *gt, unsigned int vfid)
>  	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_RESET_MMIO))
>  		return false;
>  
> -	/* XXX: placeholder */
> +	xe_gt_sriov_pf_sanitize_hw(gt, vfid);
>  
>  	pf_enter_vf_flr_send_finish(gt, vfid);
>  	return true;

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
