Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2116C25B5F
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 20:07:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F5410FCB0;
	Wed,  8 May 2024 20:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="khB2LFbY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03B110FBEA
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 20:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715198844; x=1746734844;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=/pqZwMzyIsXXmyYv1qmVdsesOpMxJ1rw2rmm1YsBFGM=;
 b=khB2LFbYwFdXk8/9zqQr0g604NhiD8eotbfUeUCssjBJ8sdMPoGlk+wE
 1622pUYYsy25w0AnTc6GyIQCQ8myZYGynvab+pN3WhEEzslnp82odEPxz
 9y7IW6rUHmzUPvbp3qcla++V5YrE83fZOpOwO7cuZfzXtfX0eC2biQrpl
 cifFJjHBV3NNVFWHUjwAOunkY6n8/UiB2qcJ8VrtpwbjMmEg4BKHrgJ+n
 2IYkKPNzWZNIzkJ6Rbk41FciPcDebqFQRK+7/sz7RHqSJdBpzTdm8pUxu
 inLQgJJVgaP4lxbSLvTFfUH4uKBBhTPOuwvxVmWtrww1s5u2GK/KHoy2a w==;
X-CSE-ConnectionGUID: SpGHMYKoT8eONGeLu3rkgQ==
X-CSE-MsgGUID: m3RP/8vdSP6qsbFZXGuejw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="33595234"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33595234"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 13:07:16 -0700
X-CSE-ConnectionGUID: SLcIedVwRraEVaD1C0mZrQ==
X-CSE-MsgGUID: YO8yRgvxQZS9Oa/O/pm5Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33834313"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 13:07:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 13:07:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 13:07:15 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 13:07:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNYjyozxi0bJY4eCjYXekiv7oerWe5oynB6FEq9ZCBRI7OeG5xdauwzHcQ+sK0Tiztkarv2gTvPqEJ7xVyFf1uoanEeynfzBnUGCM9z6R8xI+/2UCFYMPvsjEkyhYQMO+15R8qxtNm9NKW5ZesiDP7GB3EKrfKdhfz/1+FH67/c+NhP3qTkS1o7oJD3xsD+vKsE7CXy35l2r8nKPFc+un4au5M81gJWCSaR79UPKusjPZErROvt17EkhgMajtye8o8kcWFc42GeV890+C2NJgJ5w+5/YsiTzk1LjZtaTGSSXYk3JUYwvl6X/X0Kpa6RNBkXJn5stJdXS4ukZkYXejA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxI46xrwJYvw4yYcwyDBRP99Efd3/4+6Tk/8MbxjVBk=;
 b=drK6d0AWQR2gPagKICJCjyjyop4gBuSzUFHAWGJgT5NUCevt0JzVxE6RfnFiFME2Wor1PfRg43QM0IkH901QHFCq4WFSSbCSpYbx5qmF/PeQVUdTjmovKG3TSq7fv/yriUK4hSHWkclYbbUZYWOhu/ORIqGLg8E/iDa1QuLKGXHdXeNW/Y5vimu8F7wA4/70apV8bCbWWaM2ZUdl2OPGkCP1wIQFdpKEDF4t00GeWo3usTtr2k7gXvmx9H3zOgo5k4ZYWFNYb/GL5tPNqYsIIilRw+fH9QUMjM9ncYwrCA0+V1O2gGgOjWy25evpQRnWV3fmzk99r9yAl6IIObYRIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA0PR11MB7210.namprd11.prod.outlook.com (2603:10b6:208:440::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Wed, 8 May
 2024 20:07:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 20:07:12 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 1/7] drm/xe: Fix xe_pm_runtime_get_if_active return
Date: Wed, 8 May 2024 16:07:01 -0400
Message-ID: <20240508200707.375414-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0059.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA0PR11MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ffd57f1-49a7-4c2b-8aea-08dc6f9a72e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFdaanNXMW42MDFnNzBOb25Dd2h3THBxSmRWTGFQMXBMRGJzUkVPSVI2V0pW?=
 =?utf-8?B?dTR3MFNDV3hlbGh5REdJNC9kQVpNMTlOYTgrY2tEY3Z5U200YVdwdnNsRGtU?=
 =?utf-8?B?eHdpT05yUkVRd0VsQ3huWlJYQUQwM1JCbysrQU5CK3c1TGk5OCs2OU9hKzZY?=
 =?utf-8?B?UFJMU0p1Q3JGQVBzWGtRRjk3RkwyazZuWHV4L1pHaWtRSWJhWFVwUmk2RVpx?=
 =?utf-8?B?UkN3TkJvak5MRFYzV3MrVFNzVnJFclFuYks4eW9WcGZDYzR5bi84TGkwOWNk?=
 =?utf-8?B?VzdMR25kaUYwSndQZ0Q4M0kxQ0tQUCtqUXVOTDZyZFBMZlMxeFVjajB0Rkwz?=
 =?utf-8?B?Z2hJM2VBbHBoTnp3VHJSbk1TN0FpNm1hRjUrNXFPQ3NHY255SHdlaWNrSmp0?=
 =?utf-8?B?M3JCWXJhS1l0ZTc0dWFmeFFCVU1zeFltRlRRc3VTcklmQlRvT21JcGRKL3kx?=
 =?utf-8?B?SFcvb2dRRVNEelF4dHdkTjN1WXhBZWJQMDVEOS90T053ZUVqaGIvdWpWTXEy?=
 =?utf-8?B?QTBZZFpiQk5GSnRTb25GSmpjRHR4ODY2OEU3TGdZbnNPWExVT1pCNzQvYTly?=
 =?utf-8?B?a0FUWUxSc1dBTTlYNU9IcmE3YUQ3MGVvVW4vMm4vUS9OOU9WZUtHWk5GRFV5?=
 =?utf-8?B?cllPYytRWTgvZ3d1Rm1uWTMrWklxUGt2Rk1Oa2NseklNOTlONVlHMHN4TmtE?=
 =?utf-8?B?TlNTSlNuMGtQNExUU1Z0MkJwd2ZVMXE0QWJueTdDc1VSbUJoT2doZjAyYlBZ?=
 =?utf-8?B?TkErczFBZjdSY3JFeUY2cGlKanlSMDR0SEVyL2tkaVJ3aERGc3JiNTJSWUh3?=
 =?utf-8?B?QUhtWHQ0cUx5Y05Jazg1Si8xeGsvZDRZUWkza2Y4blEzYmFDK28rU1RPZ3JK?=
 =?utf-8?B?aXdtVVE4WEdaMWNNbmh5aTdpamZabEQ4TCt1RlNENDQvSkY4YU9PaTlUejYx?=
 =?utf-8?B?R05GS2xtVzRhakdHUU5Fa2JuakFobDRiR2V6Tm94SEE0QkppMWRuWER3SzBp?=
 =?utf-8?B?WFNVUVhPTHFlNVl5VUQ4K01DVldzSzNJMjdzYk13cFBVZFNBcW5neC96SDVU?=
 =?utf-8?B?ckIvMVZMUUl2R2dGK3lkWk9ETUFPZStmNXp4bmcwRFErR3RWMXZCQktseFNu?=
 =?utf-8?B?U1MxS2pTdTFxY1lHdE0xbjhBcVZWSnRnQ1RXWnhWWGNKQmdCd2pqK1F0LzFo?=
 =?utf-8?B?ZVJEbnRMR0lPTkhIblcxeXRqYzlZTEJQN0E3ZldzVWxkM04zV2lLZGFTNVNx?=
 =?utf-8?B?em4yS2ZtazNQV0kybmc3SXBRWlVOT0NHSHBNNzdaUFp0b0ZVVU16WnpBNUlR?=
 =?utf-8?B?UzN2NFpqeGZhRkc4c2pESkRPOERtQmlDeE9LeGdnNUJ2VUttb0o0bkZHTXhR?=
 =?utf-8?B?ajRCTlBhWVVQTGFIVzc4Z0N4emxjM2xiZ1g1WGF5bGlNSXIrdjVtSGpkOEZj?=
 =?utf-8?B?djdwVm1RL3JrUVFZUWNhUEEyQURvUnNxbkVkVzh3elV2cTBLU1hUMHlHaUtE?=
 =?utf-8?B?bjBCVnRtN2xKbS9QMjB2WXMxUzFCUURqUUh6RU9PWERZNmdNeFZsQ1ZtMTMx?=
 =?utf-8?B?aHY4ZlR5SmxRTG95ZjRVUE91Z2dGL1RUWHhZQ1dOMllhT1R4blJIdStNZkxa?=
 =?utf-8?B?V1l4cGlJZ01tYWJmR081ZjdOTS90UU9DOFRBVUR6ZSs3ckE5dzNqekZEeFQr?=
 =?utf-8?B?bTdmRUpkdkpsKy9zWmRiUE1Gc0Y4UmJMTmw1dU5XNFo4Zko3Y0dJUG1nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0syQ2ZvNmxRbzB1dVBibmxUc04wOXNOM0tPbHhhMkpKVDBwTVdQQXJSTGxi?=
 =?utf-8?B?WTlHaWJGdW9NS1dXTW93RUlGMHZQVW5SWEtjTDVSY2xOMGVMNFlWak1INXM2?=
 =?utf-8?B?cGd5MkdsMkl0ZUNKaFQ4N0pFVGxSZERsM2xVMWhSaXZ5eTM0VGVvQVpOZmwy?=
 =?utf-8?B?b2lFSzR4WFk2SUl5djJNZ1JWcnJlWGhRbm9aRWJGNHhqODNkck1ZYlhkdWZa?=
 =?utf-8?B?d1JsWno0VFROQjhReEdIMktERXRCaXRlbDdVT2R1TFFPaW1nczhBNDlvWW9P?=
 =?utf-8?B?dzNZcFNLTWZrNzFNU2ZwUlRaTlpnMXE2c2FzVFdxMnhRRk0rWnFUVnJRZTFo?=
 =?utf-8?B?MzdXN2RwMHVSTVdMb3hBNEYxMHhnL2Q1T0ZDbUk0T3I4aGNBK1I5S2k1MytB?=
 =?utf-8?B?TjR0ZXpBbmNyWWJYQkFYUzZhMWxRaVRJRk53YWVRWklPUHlRT2hkTVlyZkdU?=
 =?utf-8?B?WnJIUDZDSlRHTHc3TnF1NVU4aGpEOVpQaS91WllzV3lHbXh6MEpXdXlkaGJo?=
 =?utf-8?B?M092dlBCVVpiQ1g5bUo3U2x2NFBkSmdESExKR1hlOUdTemQzU1F4V0NsbFBJ?=
 =?utf-8?B?ZGF5TlpkbjZoQ09UR3hXcnFSV3V3TzdBOHZpWlJLNWIzdE9kUUpXOVBSK2J4?=
 =?utf-8?B?NjNOVlBtZG9XQ2hmb3RPMDFTdkVZT09zb0N4d0hzMDE1UVRuZit1WERreHV5?=
 =?utf-8?B?MVVtMmNsbkVXQjZTVE1DWlRTSW12dTMrRDdaa3VQSFRHNVllNU9CbXBjSVR4?=
 =?utf-8?B?VXNqWVpXUEpFeDZBK2I2N0VvUWMrRyswT3d4RUtOVDdkMHBCd0dFR1ExTkQr?=
 =?utf-8?B?ZVZhQ1gvdHJ1VFgvVVUrSlhNWFlLL2d0SUt4SkxGSDJxd2M0UEMzdWsxV28z?=
 =?utf-8?B?akpBVHJOM0ZIQ3JGWCs4SEN1clkwZGZGWTNmbjBLb0tUcFpKSXZUSUZlOS9y?=
 =?utf-8?B?ZW02L2VDbE0xNTRPQjhZNDY0MVVLYnpCMDl4V0M2b0JxemlSTHoyUEl2RTl0?=
 =?utf-8?B?UjZZZkdPSFJ5THdkdVdMZFBBdzh6TUxUclZmTkt1WUJhcHFWNk5ldmN5TXNS?=
 =?utf-8?B?Uy8wQ3NvTVlnbTBzSEZ2TDVNK1kzWEtRR3dTR0RvVkdHM20weGQxN2lVUVE3?=
 =?utf-8?B?azhBVlJLd293d2NtQTkzaWJWYzRmOVdieWpIUmNsSzdFOWJXZ1BRTjVWeHFX?=
 =?utf-8?B?SXlhZWpRZk53RWs5Q04ydVgvQWpESDBQSzhNYzBsTzdlRFVRT2dFekRKRUVP?=
 =?utf-8?B?dGJ1ai9zMFJYQmFlZkNZNFBYaDFOS2FhWEZRVDM0OUxkalFQSzFvekdtWGN2?=
 =?utf-8?B?OVNPUXRSQzlsVk9uNitxTWNjdWtlYW14bnZlQTFSYnhLYmY2R0JMMlNOMFJ5?=
 =?utf-8?B?OWZnMVlWOGJCRkdsZW90RGVrUjZVWXBXWmsvbUdOcHRxQ2xrYmNobFp6bUFw?=
 =?utf-8?B?ZGUydSt1RG54VGZvVitRS1NNUnVHSHF1bk5TUFlMcGNWODJObm83Unkvb2pL?=
 =?utf-8?B?VWdsYng5MUZqVlJjTWc4VGxpWEsyMnlxSFlNT2dVVXYvbjBvSjJyZmJpWGxh?=
 =?utf-8?B?S1dDOCtPSXFDY05CYWFHYmVmQ1JVM3ovVmtkR2tsa3h4RllOcXptNVpOSjhZ?=
 =?utf-8?B?NHZpdzJzWHBwQnhjKzcwWnRYUldyVHFjM0cxTGZ0YWRVYmZVZVd4OEpUQ1lB?=
 =?utf-8?B?Y2NJbkx4UkFKbWVzYlMzTjFsNnEySWVvdVZ3WmlSbnVleGdSbEs1MndzMVZu?=
 =?utf-8?B?QlBtSVU3SnAya2FkbE9Ob0lBS01nSG5KeDc1THFOSEN0VFdzQUtDZjMwZnNY?=
 =?utf-8?B?UHFKYkZHaUhQcHpkeGI0eE9hbGlHS2IwMWdmb0JVeEVDOXV4WFJSL05ibDIw?=
 =?utf-8?B?OXhqNU1WaXlRdzJ4c2sraURQSWQ4SEJSQlZNYmYxbUI4dElzLzZpbXdQRk5N?=
 =?utf-8?B?YVdIcG5tRkRpa2RtY1lCTjdRTUJCR0dVTVU0SzFINVF4SzdGcEpkT0MvRndy?=
 =?utf-8?B?OFZZemQybFlEKzhsZU9aa1oxNWtvbmFtM3pPZ3VuOXBWcC9XeHR1ajFGNVBT?=
 =?utf-8?B?TDEvM2xTbkFZSU5JTDZpN2xlUlUvbVVLSXRjSG1nMUllZkRxSkdWKzlkcFRy?=
 =?utf-8?B?YjU1NU8vYXJ1cHd0UW1Ha0NOOEdLTGNtRkkxNTBPSmo5ZmhmK0JtU3BtMmcx?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ffd57f1-49a7-4c2b-8aea-08dc6f9a72e9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 20:07:12.5448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g015bIC0gm3l/XvfFAILapAKkK7oPr+qPU3oNrbOAdR7duFJJ7THbUQbtDmadTickpayYSqpASZmgkxMqnYA8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7210
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

Current callers of this function are already taking the result
to a boolean and using in an if. It might be a problem because
current function might return negative error codes on failure,
without increasing the reference counter.

In this scenario we could end up with extra 'put' call ending
in unbalanced scenarios.

Let's fix it, while aligning with the current xe_pm_get_if_in_use
style.

Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 8 ++++----
 drivers/gpu/drm/xe/xe_pm.h | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index c1831106ea4b..d14741f35cc4 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -505,12 +505,12 @@ int xe_pm_runtime_get_ioctl(struct xe_device *xe)
  * xe_pm_runtime_get_if_active - Get a runtime_pm reference if device active
  * @xe: xe device instance
  *
- * Returns: Any number greater than or equal to 0 for success, negative error
- * code otherwise.
+ * Return: True if device is awake (regardless the previous number of references)
+ * and a new reference was taken, false otherwise.
  */
-int xe_pm_runtime_get_if_active(struct xe_device *xe)
+bool xe_pm_runtime_get_if_active(struct xe_device *xe)
 {
-	return pm_runtime_get_if_active(xe->drm.dev);
+	return pm_runtime_get_if_active(xe->drm.dev) > 0;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 18b0613fe57b..f694005db278 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -29,7 +29,7 @@ int xe_pm_runtime_resume(struct xe_device *xe);
 void xe_pm_runtime_get(struct xe_device *xe);
 int xe_pm_runtime_get_ioctl(struct xe_device *xe);
 void xe_pm_runtime_put(struct xe_device *xe);
-int xe_pm_runtime_get_if_active(struct xe_device *xe);
+bool xe_pm_runtime_get_if_active(struct xe_device *xe);
 bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
 void xe_pm_runtime_get_noresume(struct xe_device *xe);
 bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
-- 
2.44.0

