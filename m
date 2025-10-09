Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B803ACCD183
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 18:49:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5688410EAF9;
	Thu,  9 Oct 2025 18:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wzft3Vb+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A8D10EAE0
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 18:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760035764; x=1791571764;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WxZbaNLbAvOxyDfs9ef7y/vsWQXmoCEWJajtrFr651k=;
 b=Wzft3Vb+tiIWLCtzDjy2gvLL4Kmg86avCTzPpraK9Lkxel3Vkp3tGkiD
 mo+CRdOWy+HXtLa7ZgRfCI2gO5zZM1wK6WTArUyQPMcWVT+dr4B6WDtm/
 PtMyrod3VV+WQ+oDueLAKhQoPlLUwrT42IjdiVNrf0O5xlKUlXJHDTgy5
 /cE6zxgGB9aLdMvuCkRyLIAgSAVrSDgo1X2XTjQHykAuIwD1ZkJ2cVslk
 DNuzGan0hqUHB46WbQ1LJynRviHoDejOJJn1GndJuts79GRkKc7LU8U23
 +WrG+6c6h6Ojnnset85JKNoU+R2fTxmFrQvJMwuk+RJ112ylJmO2O8r65 w==;
X-CSE-ConnectionGUID: A7xa9jh/TIS+fxY9+WeABQ==
X-CSE-MsgGUID: yJ8cEDgnSnuFvZKqntIPPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62140658"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="62140658"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 11:49:24 -0700
X-CSE-ConnectionGUID: UIZPIokxSwis+ZGnDbHx1A==
X-CSE-MsgGUID: wIiw9f0uS7GBqtv+9i8d9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="186044279"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 11:49:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 11:49:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 11:49:22 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 11:49:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WxP2TDaYK2sYU8pkizyJ96+YCJxhAmBcSrOJK3DKAH8XEGu+s9xSxCMfhpTzAOHp3qbY7Uo9kZ3jeQiKfZYAa9t2CTfxJEkE5Yg/NhcnLB0VRHwV5JVS4adUCyh8DHfZU5I4cuoWAXCdQ/I0pzuu/bx0m2QX+v9cSRf6DSep70xKDPmH83mwuIV+8JjSpObmNogoLCSMeyneIR/wxFmc08K1qC59aS38TOM5rxOvTckzysJe8kWbUq2H3tbmlrc23464iIJ5r7CItzfQcMwKb4HcRLEE9BSf7EVrPiOCtH12ot+ZW55z+9stomQrYd6V6yOBrTPziI0AgSKzfkal1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3JBoGRp/cWWqzrMjvxQXqU2tdkRkqOXdxSo7rbfZFM=;
 b=EXmgtYa/RiV2NFAXo13JYMaTMyzHxG9SdF5JSyXdqTCl/G5Lkb1rwbKzsdiWwb/x7muSw5+SLlh6DbMxvo3XRN24lmvXA6+KPM7yn8rL37flvjKm0qmf04y3d086KE/rYPmC6sHNax3Sz30hu73JeUyPw91T0Q1MT9+WIl4s+j60vPMEaxKrMHdIu644KmxAvWIPfjRcGBir9cVWNHhIVEa1EzShEIeY2JOl3yJPev+uVJkGL8UqKKdvvf0XqlCGyzl11dhYlKOxhDpPWq6QdHLv4NA8/e0A5M8do9ZuQNBSyNq+Ao4jxjgwQM0zyDrUilydJ8e4vC22JzzMO1L5fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6773.namprd11.prod.outlook.com (2603:10b6:806:266::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 18:49:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Thu, 9 Oct 2025
 18:49:18 +0000
Date: Thu, 9 Oct 2025 11:49:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v5 1/3] drm/xe/migrate: Atomicize CCS copy command setup
Message-ID: <aOgDrJhtrEqgpAJk@lstrano-desk.jf.intel.com>
References: <20251008101145.11506-5-satyanarayana.k.v.p@intel.com>
 <20251008101145.11506-6-satyanarayana.k.v.p@intel.com>
 <aObsmCaIbrSgHrvd@lstrano-desk.jf.intel.com>
 <aOex-1E8yBlGFbwI@intel.com>
 <aOfeoWV87W+Gt6HH@lstrano-desk.jf.intel.com>
 <aOgAXul_Az3JLC0V@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aOgAXul_Az3JLC0V@intel.com>
X-ClientProxiedBy: MW4PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:303:8e::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6773:EE_
X-MS-Office365-Filtering-Correlation-Id: 01dc4ba7-0269-4437-cb22-08de07648d87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Uk02bFgvd0J0Wlpqc0k2RjNwczFodU5aWWJYMEhHVmpoTnFmZ3hONEZKOGtp?=
 =?utf-8?B?Q3Q1RjRlRFRXOUh4OUhkc2JKK0pMZW9HeEl2TFlYT0M3Y01NR2NFTnZaWTlp?=
 =?utf-8?B?ZGFPbVlpaU1vWVhacGJsYXFyeHkvd28zU0FmRkh2TEFWQTgraVhWNTZ6WC9p?=
 =?utf-8?B?OFBONTVOd0NEdUlOTCt5c3pYaG54UEpSallMQVE3S1pIWWxuS3EyNng5ZGsw?=
 =?utf-8?B?VWgwNFBvY1FQSC9MOW1mbFhvNFgxVlVqUEJuVURVVzZQclE3dEZrTThBZzhy?=
 =?utf-8?B?Zk02bWVuNVA3dGlncTBsM3JHdVdFOWRXVDlMRm5PZnNNN3dJTFlHNFlLczl5?=
 =?utf-8?B?TEJzREhnN2ZSZyt5Mm83OVBaQ2x3blk4QkY2d1g1dENWclJUMXpMSmUrbGhP?=
 =?utf-8?B?WHZyTXh2MnV4UWx3elN0OVNNWUFXaGowb3FFUUwrOXFNWjFoMWRCVnZZbG93?=
 =?utf-8?B?bllNanovZ2sxdzAyZ0I5RkhydjdlcVptb0JYd2RrWmZVSjBZK0drZjdXbkdk?=
 =?utf-8?B?RFkzYkIzM2VNbnd0cFh2TnZhbmdPVFpGQkd0c0VuNVVIdWJ5VHFzd2J0K2FU?=
 =?utf-8?B?WkdUWkxQMTVkUHdBZFkxRjhlMHdjYUNjQTNTUzhaNzM1QnR0NlRYK0o0NVQv?=
 =?utf-8?B?M0JRSXJ0RkRWdnA0L1NKTVZBQi9HQXFnNUp3cE1PWGZvdURIcEhPZW5SQ3px?=
 =?utf-8?B?UFFJMjZSa3kwMnJzNEpobVkyMkxRajFHajZmeEJMbTJsUXBJTEtmQ3lsKzI4?=
 =?utf-8?B?aGVXRFc4eWZ0a0hZMEcwbzJiRjI0L283cDBBVDd6VzYxWDNjQTFSNDQxY3Ex?=
 =?utf-8?B?TnpORHZHOEVlVkt0cWsvcVJwZUVRQzFveWxMWTQvUnYxczZzSlRwZldZMnEv?=
 =?utf-8?B?Yktweno2Nmg4SjVheU9WdGZadmVvUFhVT0VEMm5PSkFZT1ZJWThkSHc4QmNX?=
 =?utf-8?B?eTJvSGppNkliaC85L2tkQ09nVTFXeW0wTEdyaU1VNFpuVGtnVVU5T3l6TTl5?=
 =?utf-8?B?dGVUUFJoNUhrMkVDcGJFL3lPajdPRHBJcDliK0pGN1RGNmRPL25MZXZIdk5i?=
 =?utf-8?B?emFkZzhXNDV0bWxoQWkyYjdnUmdxNDZxamcwY3dGVzIwbFM2TGtHQ1o0SnR4?=
 =?utf-8?B?Y2N2MGYwSkM2WUtyTXEvckp6bHNaS2laWnFHSWpyb1VQZEZuUyt2OWdYZHlw?=
 =?utf-8?B?NUtJcDI5OUJnbStaWkF3MlJkQjBTV3ZzeGdSQzZ1K3RrMkw2N3hBSjJ6WFc3?=
 =?utf-8?B?S0pXcHBVYURaYmxUVjRLRnpza2tuSjNrWUdUNzZyQW1MeTZnWWNvV2VvMGVu?=
 =?utf-8?B?ckpsbkIrNHVjbDRzdXZaS3NmeGNzRitRakxUVWY5dVU5eW5yc2o5R3grNC9K?=
 =?utf-8?B?QkdLbHV0d0pWakY5TklTTHpuTGNjVk9tM0JvSzZ4NVFSS2VFZjF2NGpVMGVJ?=
 =?utf-8?B?bzBzS3pobkdYQ0t6aE1ZMVdSMW9Ja09QYVQ4UjRFVFdIdFBmSjVwRmlIKzF4?=
 =?utf-8?B?VUp3bWJCQTR6UzYyck5RRFliMFRnWXpsS1gzSjgwOVMyOEdmaEFUNWhKV0VP?=
 =?utf-8?B?dHBlTVoxak1zalhWUG9GNGMxSys5cEMrTU4ySEg2dGJBOVk4MnRybVJDZUJL?=
 =?utf-8?B?WklSL25CTE02MjM1c0FsVDdkeXR4c3pHaTlHWUlGdkh1N3JvS0VMc1R2ajBi?=
 =?utf-8?B?WmkyUW5aVUxJOGhxUmE5eTM2UFltWEFzSzN0bWI0QWR2Z0s3OEVIU0ZJTzFF?=
 =?utf-8?B?TUROd2l4TitqR0ZIcTkvSmVoWm9pVy9aeDRkb2lkMkF6RjVkZ0UzV1ZiUSsw?=
 =?utf-8?B?L1pVVEtpYXUrT0RlWFo2ZkhGUlZpTUxoN1gwSitoTDJxNkd1eURNeFgreXQx?=
 =?utf-8?B?OXBqR2dBWVc4TmdObnRNdCtoMEJVMElKNUQ3QkhETXVYZ0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXk5THB1UlhzK25Fd0svazExc05LTDBqVGg3eUxsV045SlRLWWlCSXIrZHJW?=
 =?utf-8?B?Ny9nbVdCbmxORWFiSmZqRTh1a0VuR0ZWZWNWaDNVSnIrTEphUyttWnFVRWtU?=
 =?utf-8?B?clRqU3BpY3hpc0QvTXBiL1Ixb29yd3RrMks3MUVoOTl6aWlwNUJ3YTRNM0VN?=
 =?utf-8?B?MlhmTUZVQkNtUzRjSnlPNlBiME82VlE0N1lQZkxWeDFDVWYwd1ViK2RrRmdY?=
 =?utf-8?B?bTlReG1xZmsxYkYyOTl5WSt0QmlUY013OGI3UHNRL2hkaVoxbW0vRGllanhC?=
 =?utf-8?B?dmEyYVBEMDgxb1BzZ2h3cXBONGUzY0x4ajdPQS9sVFFMTUdscTBlVXVFOHZK?=
 =?utf-8?B?NmlETkE2TWhibzFLckVVcEJsZEZDb2dQQllONjJ1N04rZ2pLYnFHQWJNd3p5?=
 =?utf-8?B?QXI1V1pWL0twSnVtVmM0N28rMWNmRHRVaDZ0dnZ2bzJWN0MvTFNKalpTZ2la?=
 =?utf-8?B?VFhlcm55c3A0TGtjNU15S1VBMnBTOE9VbjFYUm1Ob050aWh6dWxMQVJOM1Ru?=
 =?utf-8?B?Vy8vbmZQTWVJd0pxeEVQTEVZVlBXZ3pVdjJ1eXhZUTdab2s4a1Q0bEFhYXcw?=
 =?utf-8?B?aGNlUE44bUFCclh3ZWl6SjMxcWRDSVpjMFVTM1JhQVY5eC9zSWNRNUMyakd4?=
 =?utf-8?B?ZnRiN0tueE56QWZNZGxlSnI2WjNUaU5zQ3QxUXNWTWZSTU4rMTFxSVlLQVh4?=
 =?utf-8?B?QTYydGlzQUxCNkFQWStPUEN5S0JLRlBxMU0zcXJuUDN1Mk9IbXBMY3dodFNy?=
 =?utf-8?B?MjJqL3BJYmZxZzRhWldPeHdmcjZVNVk0ejFGRjdlam9kRCtTa1JzZURLZ2pU?=
 =?utf-8?B?M0pNWUhkNGtrY01UUCs0ZElleG00TTlQdmVUTlFTYy9vZDFSaEpyMDhXd0VW?=
 =?utf-8?B?V0lrdEw0QlpHYjkzMDVzOUN3N2pSM3J6Vk44RkZGeitCbldXaFR6V2hLMUNv?=
 =?utf-8?B?QUNPOTZUM1BJQ0UzOTIvWTdqb2IxWWNCQmxCRDFhQU1kU2YyMkk2TFpYMEhX?=
 =?utf-8?B?aTNtWGN0SnRSN1FjYXgvQzN5ajFVcmhLeDN6RUg4Q2NEZzdnWmxuNFZXZnMx?=
 =?utf-8?B?dzNZdENvZW9pNFhrUVdQUVRmYWxYdE9jUG1PVFpXUDN4aWVCRE9mckVXQ21F?=
 =?utf-8?B?d2ZQdGRkUTZIVVg0ZUR1aHhVd0ZLb0Y1L1hrbzNHNUprTW9KVU5sOWdqNEt3?=
 =?utf-8?B?RXRNWEtHbWN5UXhLemNhVXFLNUxIMzJ4eWtHK2NEb0t2eUNmZzhxbzF5Rndk?=
 =?utf-8?B?YVliRThiUm1MaVc0RzJVQWRsUWJQN3NaYWNuRk5pbVZtOGlTUWpHM00wbUIv?=
 =?utf-8?B?aEhLNjZvaUtENkpLYSt2cTNnNWNORXpJNDNXZERlNStOYTI4UEJqUURQeWJ6?=
 =?utf-8?B?Qys4L0Mwam1RTk14ZVpEQnBaZG0zU0d5T2hMQ3RUOU5PSlFwN2xtWU9qVFdz?=
 =?utf-8?B?Q0dENUZRb2wyVnFsbFlaOHQ2dUI3Y0t3a0xoMUFPS2FkeGJFektGOU56Q1RH?=
 =?utf-8?B?UWp1TFpIaDNTV2pwUVl4UHZSS3hkenFrc1ZtNktTN05CYWdtYkU0RlA3M2FX?=
 =?utf-8?B?TTg0Qjcyczl0ME9NV0JrZEdqSjlFRS9vcHltRCtacWdhSjlwT1piQzgvMGVZ?=
 =?utf-8?B?ek5oeHY4cnlOa2JXNDFsTzdHdHczbGViQjdkVGtWZ2lTaDdHUXJkR1V3UVdF?=
 =?utf-8?B?clFySWtjSzd3S3lodzdFbWlzUDhIdVZvSjQ1TnJmbENIcmJlb2hMUExENEhi?=
 =?utf-8?B?NXA4ZUJDUExka0dRcTZUeUgvdWhzTlhVYzdwRCsxUlBxRTk4cHRUaGlBNkNz?=
 =?utf-8?B?QmRhUVloSHpFbFlIS0Y0Uk9wU1VWck1URHlIU05RWXJzSXRkQ2JiNkpvWDZy?=
 =?utf-8?B?cFpmYzJMc3M3QmFTdUVFS2xBeW5ycFkwbEc3OVFqUDdyL1h0M29PcmoxZ0R1?=
 =?utf-8?B?djlGdThIWVpTNUV0TytWcDVrUVZWc1ZrQjRKWmMzcFVNRjZXc3o0M0ZvRjhz?=
 =?utf-8?B?TWdPN2diUWkwMCtsWm1Bc2g1cmhJRlRlS0taRk9sdHB5bVBqNmwxLzBKZ0s1?=
 =?utf-8?B?YWNtcWx1Mmh0aG4zbS9rZGZVMlVXTk9xMnhCS2Y3U1ZORGRTNkRqV09pRmxo?=
 =?utf-8?B?VXZ5OU9UL3ZYMUs4dE1ES0R5cnRQQnpjdHRrNDJ3clFGdlVRTTA3c1FSUmVM?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01dc4ba7-0269-4437-cb22-08de07648d87
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 18:49:18.7390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bmwx8W2wPVdk+W9ndt8t/atKhYxJySij0RcHelkOFWeEfeAZOjK+Dtueq6aLHolLe7XFTC3muxc5Hn3VZCmwzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6773
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

On Thu, Oct 09, 2025 at 02:35:10PM -0400, Rodrigo Vivi wrote:
> On Thu, Oct 09, 2025 at 09:11:13AM -0700, Matthew Brost wrote:
> > On Thu, Oct 09, 2025 at 09:00:43AM -0400, Rodrigo Vivi wrote:
> > > On Wed, Oct 08, 2025 at 03:58:32PM -0700, Matthew Brost wrote:
> > > > On Wed, Oct 08, 2025 at 03:41:47PM +0530, Satyanarayana K V P wrote:
> > > > > The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > > > > save/restore while this sequence is being programmed, partial writes may
> > > > > trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
> > > > > instruction to write the sequence atomically.
> > > > > 
> > > > > Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
> > > > > 8 dwords instead of 5 dwords.
> > > > > 
> > > > > Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
> > > > > chunks.
> > > > > 
> > > > > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > 
> > > > > ---
> > > > > V4 -> V5:
> > > > > - Fixed review comments. (Matt B)
> > > > > 
> > > > > V3 -> V4:
> > > > > - Fixed review comments. (Wajdeczko)
> > > > > - Fix issues reported by patchworks.
> > > > > 
> > > > > V2 -> V3:
> > > > > - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
> > > > > - Updated emit_flush_invalidate() to use vmovdqu instruction.
> > > > > 
> > > > > V1 -> V2:
> > > > > - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
> > > > >   (Auld, Matthew)
> > > > > - Fix issues reported by patchworks.
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_migrate.c | 93 +++++++++++++++++++++++++--------
> > > > >  1 file changed, 72 insertions(+), 21 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > index c39c3b423d05..b629072956ee 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > @@ -5,7 +5,9 @@
> > > > >  
> > > > >  #include "xe_migrate.h"
> > > > >  
> > > > > +#include <asm/fpu/api.h>
> > > > >  #include <linux/bitfield.h>
> > > > > +#include <linux/cpufeature.h>
> > > > >  #include <linux/sizes.h>
> > > > >  
> > > > >  #include <drm/drm_managed.h>
> > > > > @@ -33,6 +35,7 @@
> > > > >  #include "xe_res_cursor.h"
> > > > >  #include "xe_sa.h"
> > > > >  #include "xe_sched_job.h"
> > > > > +#include "xe_sriov_vf_ccs.h"
> > > > >  #include "xe_sync.h"
> > > > >  #include "xe_trace_bo.h"
> > > > >  #include "xe_validation.h"
> > > > > @@ -644,18 +647,49 @@ static void emit_pte(struct xe_migrate *m,
> > > > >  	}
> > > > >  }
> > > > >  
> > > > > -#define EMIT_COPY_CCS_DW 5
> > > > > +static void memcpy_vmovdqu(void *dst, const void *src, u32 size)
> > > > > +{
> > > > > +#ifdef CONFIG_X86
> > > > > +	kernel_fpu_begin();
> > > > > +	if (size == SZ_128) {
> > > > > +		asm("vmovdqu (%0), %%xmm0\n"
> > > > > +		    "vmovups %%xmm0,   (%1)\n"
> > > > > +		    :: "r" (src), "r" (dst) : "memory");
> > > > > +	} else if (size == SZ_256) {
> > > > > +		asm("vmovdqu (%0), %%ymm0\n"
> > > > > +		    "vmovups %%ymm0,   (%1)\n"
> > > > > +		    :: "r" (src), "r" (dst) : "memory");
> > > > > +	}
> > > > > +	kernel_fpu_end();
> > > > > +#endif
> > > > 
> > > > Everything in this patch LGTM but I think we maintainer input to ensure
> > > > we are breaking some rules about inlined asm code in a driver (no idea
> > > > if this exists) or if a better place would be somewhere common. Can you
> > > > ping Lucas, Thomas, or Rodrigo and ask them about this?
> > > 
> > > Well, it is possible and we have asm code in i915 for instance (i915_memcpy.c)
> > > 
> > > But the rule does exist:
> > > https://www.kernel.org/doc/html/latest/process/coding-style.html#inline-assembly
> > > 
> > > "don’t use inline assembly gratuitously when C can do the job. You can and should
> > > poke hardware from C when possible"
> > > 
> > > In this case here, please explain why exactly memcpy with smp_wmb barriers and
> > > or WRITE_ONCE code combined couldn't solve it.
> > > 
> > > Also, please explain how exactly vmovdqu guarantees the atomicity promised by
> > > the commit message. On a quick search here my take is that for this 128 or 256
> > > bits, atomicity is not guaranteed.
> > 
> > I don't think cache atomicity is what we're after here—rather, it's vCPU
> > halting atomicity.
> > 
> > Consider the following case:
> > b++ = XY_CTRL_SURF_COPY_BLT;
> > b++ = addr;
> > 
> > If the vCPU is halted during the instruction that stores
> > XY_CTRL_SURF_COPY_BLT, the address will be invalid. The GuC executes the
> > batch buffer (BB) that is being programmed as part of the VF save. This
> > will clearly cause the BB to hang due to a page fault on the copy
> > command.
> 
> okay, perhaps this is what is getting me confused most
> what I don't understand in the flow is: why GuC is already
> executing it or going to execute it while you are going to a halt when
> writing the command to the buffer?  and not writing to the buffer first
> and then sending it to the exec queue?
> 

It how this feature was architected, will send over SaS link of the list.

> > 
> > If the entire XY_CTRL_SURF_COPY_BLT is stored via an AVX instruction,
> > then either the GPU entire instruction is written or none of it is. I
> > believe vCPU halting guarantees that a CPU instruction is either fully
> > executed or not at all—regardless of how many micro-operations (uOPs) it
> > decodes into. If this guarantee does not hold, then the entire
> > architecture of CCS save/restore on PTL is fundamentally broken which is
> > always possible.
> 
> Okay, this is guaranteed. I mean, the vCPU won't get halted in the middle
> of the vmovdqu nor vmovups. only before, between, or after them.
> 
> But is this uncached and/or coherent? isn't there really any possibility that
> the command finished, but GuC mid-flight executing things aren't still
> seeing different cachelines?
> 

The GuC won't start executing until vCPU unpause on the save flow.
Restore flow is bit more tricky as vCPU are live when this happens but
we can W/A that race in software I think. That part is not in this
series.

> > 
> > > 
> > > So, imho this patch is introducing a unmaintainable, complex, and fragile code
> > > that is not even doing what it is claiming to do. But I will be glad if someone
> > > can challenge this and prove me wrong.
> > > 
> > 
> > Let me know if the above makes any sense.
> 
> Okay. But how to handle cases where AVX might not be available? really not needed?
> 

This iGPU feature for PTL so shouldn't be an issue as PTL has AVX
instructions.

Matt

> > 
> > Matt
> > 
> > > Thanks,
> > > Rodrigo.
> > > 
> > > > 
> > > > Matt 
> > > > 
> > > > > +}
> > > > > +
> > > > > +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
> > > > > +{
> > > > > +	u32 instr_size = size * BITS_PER_BYTE;
> > > > > +
> > > > > +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
> > > > > +
> > > > > +	if (IS_VF_CCS_READY(gt_to_xe(gt)) && static_cpu_has(X86_FEATURE_AVX))
> > > > > +		memcpy_vmovdqu(dst, src, instr_size);
> > > > > +	else
> > > > > +		memcpy(dst, src, size);
> > > > > +}
> > > > > +
> > > > > +#define EMIT_COPY_CCS_DW 8
> > > > >  static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > > >  			  u64 dst_ofs, bool dst_is_indirect,
> > > > >  			  u64 src_ofs, bool src_is_indirect,
> > > > >  			  u32 size)
> > > > >  {
> > > > > +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
> > > > >  	struct xe_device *xe = gt_to_xe(gt);
> > > > >  	u32 *cs = bb->cs + bb->len;
> > > > >  	u32 num_ccs_blks;
> > > > >  	u32 num_pages;
> > > > >  	u32 ccs_copy_size;
> > > > >  	u32 mocs;
> > > > > +	u32 i = 0;
> > > > >  
> > > > >  	if (GRAPHICS_VERx100(xe) >= 2000) {
> > > > >  		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > > > > @@ -673,15 +707,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > > >  		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
> > > > >  	}
> > > > >  
> > > > > -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> > > > > -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > > > -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > > > -		ccs_copy_size;
> > > > > -	*cs++ = lower_32_bits(src_ofs);
> > > > > -	*cs++ = upper_32_bits(src_ofs) | mocs;
> > > > > -	*cs++ = lower_32_bits(dst_ofs);
> > > > > -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> > > > > +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> > > > > +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > > > +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > > > +		  ccs_copy_size;
> > > > > +	dw[i++] = lower_32_bits(src_ofs);
> > > > > +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> > > > > +	dw[i++] = lower_32_bits(dst_ofs);
> > > > > +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
> > > > >  
> > > > > +	/*
> > > > > +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > > > > +	 * save/restore while this sequence is being issued, partial writes may trigger
> > > > > +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> > > > > +	 * write the sequence atomically.
> > > > > +	 */
> > > > > +	emit_atomic(gt, cs, dw, sizeof(dw));
> > > > > +	cs += EMIT_COPY_CCS_DW;
> > > > >  	bb->len = cs - bb->cs;
> > > > >  }
> > > > >  
> > > > > @@ -993,18 +1035,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
> > > > >  	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
> > > > >  }
> > > > >  
> > > > > -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
> > > > > +/*
> > > > > + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
> > > > > + * save/restore while this sequence is being issued, partial writes may
> > > > > + * trigger page faults when saving iGPU CCS metadata. Use
> > > > > + * emit_atomic() to write the sequence atomically.
> > > > > + */
> > > > > +#define EMIT_FLUSH_INVALIDATE_DW 4
> > > > > +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
> > > > >  {
> > > > >  	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
> > > > > +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
> > > > > +
> > > > > +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > > > +		      MI_FLUSH_IMM_DW | flags;
> > > > > +	dw[j++] = lower_32_bits(addr);
> > > > > +	dw[j++] = upper_32_bits(addr);
> > > > > +	dw[j++] = MI_NOOP;
> > > > >  
> > > > > -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > > > -		  MI_FLUSH_IMM_DW | flags;
> > > > > -	dw[i++] = lower_32_bits(addr);
> > > > > -	dw[i++] = upper_32_bits(addr);
> > > > > -	dw[i++] = MI_NOOP;
> > > > > -	dw[i++] = MI_NOOP;
> > > > > +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
> > > > >  
> > > > > -	return i;
> > > > > +	return i + j;
> > > > >  }
> > > > >  
> > > > >  /**
> > > > > @@ -1049,7 +1100,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > > >  	/* Calculate Batch buffer size */
> > > > >  	batch_size = 0;
> > > > >  	while (size) {
> > > > > -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > > > +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > > > >  		u64 ccs_ofs, ccs_size;
> > > > >  		u32 ccs_pt;
> > > > >  
> > > > > @@ -1090,7 +1141,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > > >  	 * sizes here again before copy command is emitted.
> > > > >  	 */
> > > > >  	while (size) {
> > > > > -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > > > +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > > > >  		u32 flush_flags = 0;
> > > > >  		u64 ccs_ofs, ccs_size;
> > > > >  		u32 ccs_pt;
> > > > > @@ -1113,11 +1164,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > > >  
> > > > >  		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> > > > >  
> > > > > -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > > > +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > > > >  		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> > > > >  						  src_L0_ofs, dst_is_pltt,
> > > > >  						  src_L0, ccs_ofs, true);
> > > > > -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > > > +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > > > >  
> > > > >  		size -= src_L0;
> > > > >  	}
> > > > > -- 
> > > > > 2.51.0
> > > > > 
