Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2884FCE7B13
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 14:19:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D492110EA83;
	Fri, 14 Nov 2025 14:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lUfOfrJr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D770310EA83
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 14:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763129953; x=1794665953;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ggl7ZMo+x1FiZegXLUcn2ixnWH/y1C4LIyg6tL4vI3k=;
 b=lUfOfrJrlYBs6T7Nlkq5exaPKHcDnZFhllMBDYjk68zr34CYMyqaBxf4
 AKj5q1WGs44F3cXDwGCvsoPeiug9g5fHBnXB7kINi3MRbVK/BruXLogL4
 Miov5vw/pUp3eeKyQffzhcKGCCutDdqn8QdcjwQDFnJ6HPMZ/mt/5qsp2
 L77SzQGolqgaobZYzDMauwGBF/IMAUOQIxgq0OG4kmBZrV26saMiQEvd/
 OuPQ1nqael/I7BbUo9JpfHq1KMK4dn/QgteC73w9rgKT/D8K3J+6CkWRw
 si3+GoYbHKjkEoHQXKrftkBFwpTu19uzQGrU3VmvripRnBuRC1+MsEBr9 g==;
X-CSE-ConnectionGUID: bpB4/+sKSBCVsiPkIKLJvA==
X-CSE-MsgGUID: MjA27wt0RZi0cbvIZ681iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65322743"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="65322743"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 06:19:13 -0800
X-CSE-ConnectionGUID: 0Wfg/5bSSou2a1uXOFmnlA==
X-CSE-MsgGUID: E5gc38k4SoSkDQ0UVmO/cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="193893070"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 06:19:13 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 06:19:12 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 06:19:12 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.53) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 06:19:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GvoMdQL8KxE6ZO8BuCBjTX48glsnM+TfVUePkVNO2P9/xCwaoz/85UKDJTJ50a4dccVKAk0kbVSUCLcaq2oDPeoMNluiqNg27mLVgyvMmEDPCt56eq9OUjNV47o0UPAViBFj8k7PMQ6wAZtU3dZTXXQdId2eEeG2FMumYBrJGsGOR4Cvt5Z+kYIidcY8rkBqKhCVGfzSAFZUna6SOH2v2/WNLd0jfyHV7AD05/SorAGidvoc2Gd8vZY3vhOMegEytXAYrxDHAtQdwzTR2stfFJtHENF0DNxKkBZaFm5X+/Td210ZjkiFfc4f1QXWKjxoq9Owok5IERODrZiQd4FZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLEHpJRxOowHMMWLGtUXxWCq1SnQx03Sfqr7M2dK6mk=;
 b=Yhy06pEp0xuCEAwMsh0dUgUp3dVLJqnvfL8uMp8aRnlDHlA41HWN/brTw+mLBoR+DssR/znshJXo4cllwScJnt+yg+ku0Mi8sOcpwiVTF4wXmROzbHOZ3t4ORop69DTG/7dTxK5llZQEQVAmN5MghGK2Voc+mWB3X4mr3ep6i3e4+ycREUrBdmuZOYSRddiSk0IRnR9SLKjHgG+gQoRRNVytFTJG1dy7ozoMl7R2LMInXpass0Zvk4TOomY59/hfdVpWfWVI1ZTfS8daMLSvCWAEuOMw7nIZ/dSrURAnaPhX/bz0JVAar1CL1vJrM/G8HCjjF3oHXMzub2q9Db/7sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB7161.namprd11.prod.outlook.com (2603:10b6:303:212::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 14:19:08 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 14:19:08 +0000
Message-ID: <007705e6-a4fd-4024-b79f-4f87063aa313@intel.com>
Date: Fri, 14 Nov 2025 15:19:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Fix kernel-doc warning in
 migration_save_consume
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lukasz Laguna <lukasz.laguna@intel.com>
References: <20251114134030.1795947-1-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251114134030.1795947-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0055.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::32) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: 83127899-e33d-44a3-60df-08de2388c596
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXZXckIyTk0zR2dOb1hWK2x5ZmRTRWk4cDZEQ0RtWTdWMGtFYllPSm9mUDFs?=
 =?utf-8?B?cG1leThXWWhGdExQaVVWanBqSjQxSlJvWlN3aVY5ZVE5cUdXR0ZDV29wQWVy?=
 =?utf-8?B?RVczVnJpMVFINStYekdVRHNyRUt0SUNKbFNSYkk1NzVsTVpTRTN0U2ZHSnk3?=
 =?utf-8?B?N3BaMjdBT0RiZW5sYUF4UVFBZjJ4WjJ6amtpNkpSU0h1djdKZHdUOGlUVmNO?=
 =?utf-8?B?Z08rMWJ3cDY1ZEpoSHJoQTk2anJsNlE2TGljS1BYam1HWGh0aS9pMXo0bUVC?=
 =?utf-8?B?TkZIbkw2Rm5EZWZiRmo2Zk01RkVycE13Q0JmSktmUzhuc3J5MXQzSUhrR0xN?=
 =?utf-8?B?RkFuM08rWHNVYlBmTVM3NmNxWnVwd1BoYXNuQkVNQUhJazE2aCtad0dTSWVN?=
 =?utf-8?B?NVQ4ZTBObWE4OXZVRzM0dmRqOHZaTGR6THRUTVdSZFkzTkVLVVJveUtwZVhQ?=
 =?utf-8?B?SHdnaVFSbXU3bHFZQWVneThMUDNYeWhPVHlZSUJXRWJHNkdvd2RIamhrTUdk?=
 =?utf-8?B?THRwMWtBR1g0UHpLZUh4ZGlzNVlJdDRlb1dLMFpnTDVyOHBzaFNoeThjZkIx?=
 =?utf-8?B?TGNsamVNZVJLQ29UbDBRZ0g2b2NyTHdKRmt3N1doRWNzYVF6MDVYb2lwZ2dO?=
 =?utf-8?B?dXphMXZ1WERaaGI5VU5sY0xHMEVJRENqSGViZDNaL1U5aU5yVWZvcE5oc09V?=
 =?utf-8?B?US9yc0JNNS81c3FSdFFCNW1EYTE2NENNQWVXZ292cEkvNnRwVUx6UXNvdGpw?=
 =?utf-8?B?K1lrOS9qZm9EbFVEUTYrTlY2aXdYQmFmNTdDUVNYZWovY2ZqKyt6T1d1dURq?=
 =?utf-8?B?SURTVDdBRVo1UEp4SCtMNU91UTNrUEdEMWNYaWFySjJiWUtNOWtPeTVpUTQ4?=
 =?utf-8?B?a2dqV2h4QTJQQlVRNGprZy9kQWJCNTg0WHNlSTZEaHpZeTlCU1ZlanBkSUJh?=
 =?utf-8?B?WnRwMG9SbFA1VC9ESUY1MTFLTkdIU0ZjdjBvSHRqbFRTZVhSOEg0aGxiWmdk?=
 =?utf-8?B?UW5teTMwYjNmTDJGUXBXNTVHZXRvdk84L0FmS0dza3BJdTJzTjZrbkpsbk5P?=
 =?utf-8?B?Q2RYV2s1Y1RwRHZSMThBR0tvZm1VQ2ZMQWs3Z0xlMDdlZ0tXUXNuMk1uelhZ?=
 =?utf-8?B?cXV1clIzUUk3SDFhWE5XdUpZWGR0OHU5eGY3eUlkSHRiQnlsKzdZRE1VV00w?=
 =?utf-8?B?dVdpOWtaMy92QThJZ1FsSDFRUUtHWlJUTUJQUGsxV0JkVXVLTUh6VjJWTnpn?=
 =?utf-8?B?L1RJK0JKVDYvaGR5VXlUSHd3MlZJNUd3OXhwNXRRWCs4T3plZlp4SEJ4RjB0?=
 =?utf-8?B?NDJad3l6UGhWMHVkbENNc2dhL2t6b1lXcEFaR2JldnMxZjViVHN0MlBRbmRU?=
 =?utf-8?B?U1J0b084aXpwWmVRT242bjNSNHIvT1lKM3F3R1RiSndub1NPQ09FMmlQczhQ?=
 =?utf-8?B?T29OOTNTUjg1SERxbHRYTnRHckI2ZGJGajk5TlVwRGs0N1U3QkdnY1RqZ1V0?=
 =?utf-8?B?alZ5cWpRMFl2YnJpY2p3d0xJMVJZNUVlZkhiVkVnR0xicS9GTEI3a2lxOE1i?=
 =?utf-8?B?YmdzOTd5dzljRUVmUWhZZEN4Ui9VM2lSUFR1b09rZys5MVFDREFMYVRLVjNO?=
 =?utf-8?B?QVUxWmlEWFRmbU1IMjRwRkhsZU1lQVlsZk1wWlNoYzk3MDVSWklKbElxeEw0?=
 =?utf-8?B?dlowQTVTQURyZjBsUEF3UFlZNEVqa2FpU2RhYll0WTFscDdNbk9hU2dMOG1P?=
 =?utf-8?B?SkpmSTd6SVUvbWpHODJwWVJLZzBUdHpSSVBxMEdXRll5YUIzYnJzWlBZdGxU?=
 =?utf-8?B?NWluNjhMcjBUUkRLc0l4b0Z2N1VWYkp3MkFNcjVOY3JSUWZET081WnVpY1N6?=
 =?utf-8?B?MUdVYTNNVjhvQXArS2M4OXRBM3Q4OGpFYlhyUEs3akROWXhZcURyWWVDYlVZ?=
 =?utf-8?Q?FD3VHsKON0aCgy1JVc5mnkKvqm80VKVI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnVEWXRpeGlXUU1rSWRiZ2VuMGpBNUt5eUR1cXZuSmYyUDFBWUZKVGwxTEgx?=
 =?utf-8?B?UjhZVEx0WE92WlNlR3RPV2lZSDFzVzJPbE94OWtZTFFqMDVqbGllR25RVmp5?=
 =?utf-8?B?UzlXTmVGNHd1K0Q5TXNwWVNiWkZNcHh2bm5DUDZpSmsvcWkwMi9IVGVNUitU?=
 =?utf-8?B?RnUzQ2RoV2lDaDd2VWVkOE8yczJWdTV5enV6U1pzRUtVcnJhWTJwUHRyT3R6?=
 =?utf-8?B?VS81QTFBTEYrNkxBdml5SXpVRGU3d2FmRXJhazVWZTBUekVFUU1nVDA1L1l3?=
 =?utf-8?B?WXdOTjZCdGd0Vk9YL2N2NEZ6bTEvNjFtNVRkZWZxYmVOK0VLQnpPbm9MVlhy?=
 =?utf-8?B?ZXlhTGUwam5FMUpUT25RNjdDeDNMVHptZWZyNy9iQ3AycW5ZNTE0Vitqb2pI?=
 =?utf-8?B?cjIzdHR3ZGlmemVHRFNJaEtaNk1NNVlJS1pTQllNSVlLVmhwbDJkTnRQRzZv?=
 =?utf-8?B?czIydFlqczB4MEhIOVZYcEE5clZEQmNSQ2E1c1YvZGtVZUx6U3o2cjVvZWQ4?=
 =?utf-8?B?dXZGd0dsZis5clBTL0ZmL3ZuMEM5V1M3VTNJMG9tQUpnWmt2Sm1RWkdrWXZq?=
 =?utf-8?B?ZXR1eUh0VEQ0Z2RpUEliMmFnNmVUNTl6TmFUamk3czJBYzRKMXdLSWJ6RjJB?=
 =?utf-8?B?NUlYZDZ2VGl5bXNsNSs4Yk01Q0VnUnJWUkM4LzdydTRHakMvY2VlTnE5bENZ?=
 =?utf-8?B?ZitMWnNjMmpwalBTMmxFTUc5dDFWOWQxM0tIUEM1ZjZHbm5tWGV1bDNLNDkv?=
 =?utf-8?B?RzY0L25QaWdaZ0QyVXRxQmRWYm1BZXl3Y3I2RHIyYkxWYUxCSFZMN2M4Uzls?=
 =?utf-8?B?L1ZEaWZsbDcyek5aUVE4Y3lhNWYrL0Z3YkN6RmFzWFA2VVlyNHNhZ0QwS3RV?=
 =?utf-8?B?RVA2QkwzcGdWaVU0WHZhVldXTkY2SnB4dW5KZk83MEI4aDUwMHRWVUx0N1FD?=
 =?utf-8?B?WTNqYjVpWExXNW5pUFBzcWZTNUpOYjVEMWNEN2RKUGltVGtSSVQybVMraXJt?=
 =?utf-8?B?UTNvWWtObTNyT0RlYXg4STQweFlsbXcrT1EraUxRQlNxM3FaNmY3MWx1dnZR?=
 =?utf-8?B?NWpydTFRMDEyMTdDaEdZZVVHYVlSSW1zYmpQYTM4L2pTTnlNYTNOazlIS3o0?=
 =?utf-8?B?alN1WlFPLzUyZTdveGxzNE5LV3Q4M3Q5NElERS9HRTZXVS9MOUpPUE8rc2p5?=
 =?utf-8?B?U0NYQ0l0MjY2dUJ1ZWpZMzVkMDFlaVhNWlV6R1BVQUFNUlZEMkFsTXROMVhD?=
 =?utf-8?B?OTAyVEhzZFlsOGdoWjVEakE1dUl0ZFpQcTNnQndNZDRkVXpEeXI4ZFdqT2NJ?=
 =?utf-8?B?eXlFQ2J2Mi9xcUlqZjFDN2VCNzdlMW9SaUJvbHRsbE01M2luUWJXUHQ1VXBI?=
 =?utf-8?B?WmQ4cVpKdm15QWJVaEFHWVJnQURvT0VYd1UydUJsckFHRlcrVy9pcFlDM2xu?=
 =?utf-8?B?Q1hnWmZ4UU1xMTc2TUhJOTJDcmg5dW9LbkdmbFdIamg3QVlWaW1kQ3hEUTU1?=
 =?utf-8?B?clNweHVIS3B3bjZSTWxHdHEvS09BS1FxSjNleXJNcmZsVUZMVGs5OGJFU2I1?=
 =?utf-8?B?KzV2Vm4rdFU4QVQzeGFyZjB4bG1OK1BMbk9Wb094TmYyS0IzZkVSVzlPWGNB?=
 =?utf-8?B?M2tGTThMRFZwVHRodEwvN2piTFgvRUYwSUVsSXVvdStuaVo2R29meFp3QUJH?=
 =?utf-8?B?SGN5ejJhaXMxQ1RqRkMrTDZlWnBsTUQ3bDR0MldBSmgzVDFDNzFHZlZjckxy?=
 =?utf-8?B?MkVybGZneFNYSzVpdUFha3gyVjk3UmNFUTFvQlUrZ2Y0aUw5N3FiN2o1bjNo?=
 =?utf-8?B?VlVST0hNaFY4ZG1TSW56aHVJbDZKNWFvUWtGSDE5VlBQTW9vVVk5ZVFHZFJX?=
 =?utf-8?B?WlQ5ZTkzY1l5V1Y3V1ZsNGs0ZEMvTUIrOHJJK00rK3ZMdmhSNGVhaXlERTkx?=
 =?utf-8?B?bDBNYUx1ZC9kNUNKWXNNdkJzYXdCOXFKOTA2S2NJRXBXSVErbnNQYnJqUEtj?=
 =?utf-8?B?YXZXY1BtWnVKNmVTRmVIZVFxM3VDMVRkNmV2enJmOWM2MEpaSGM5RHhWbXVV?=
 =?utf-8?B?RExKaTU5dnJFUU8vQXlXZEFxa0JmQmpveTFuNXVFVTZUcTMzRmNSNUZaN3Zt?=
 =?utf-8?B?SUpWV0w5OVpMdGcrejl6SVhHWHliRmMzZERYMWdWYVEzMEY4NEpkT0ovUXUv?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83127899-e33d-44a3-60df-08de2388c596
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 14:19:07.9368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uR/qlT2BExBKeXTnZr71jhmtbKfQs9tPcB61U0UhLx3rnvEDzRv7hrSfYpFmqiJsm/7PqBgo3D/rWG5Z1LTGQbbGgHWYeznvhXLOTRUqdB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7161
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



On 11/14/2025 2:40 PM, Michał Winiarski wrote:
> The kernel-doc for xe_sriov_pf_migration_save_consume() contained
> multiple "Return:" sections, causing a warning.
> Fix it by removing the extra line.
> 
> Fixes: 67df4a5cbc583 ("drm/xe/pf: Add data structures and handlers for migration rings")
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> index aefc6d81c2552..c10873b6acb34 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> @@ -170,8 +170,6 @@ pf_migration_consume(struct xe_device *xe, unsigned int vfid)
>   * Return: Pointer to &xe_sriov_packet on success,
>   *	   NULL if ring is empty and no more migration data is expected,
>   *	   ERR_PTR value in case of error.
> - *
> - * Return: 0 on success or a negative error code on failure.
>   */
>  struct xe_sriov_packet *
>  xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
