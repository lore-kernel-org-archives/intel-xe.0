Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED6AEE57DB
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 21:19:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9443510EAAC;
	Wed, 11 Sep 2024 21:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P2s9QCBT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7101E10EAAC
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 21:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726089597; x=1757625597;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YaxkeTj8o5s+pR7TkpJAIOwBeK9mATCMClPou/BQ+M8=;
 b=P2s9QCBT/pisKIuKRJYOKFBlTKYBhzKNpugqlrLC6hLsMrqKIIBYsoMg
 IkgtnKgSYg1ezppAk37DlDQSB50UwgZW1U6/alGZKRxeIv2/0UFZLe/W1
 gW8eyEoA24db2VGJFRBbow7LoZL8WFrBtChyyff5asUg3o4cnVjqnXdGD
 ZzgXianMNHK/FL7yQFez89PKXG1eyY/9z+qFR/AsNgq4EsTMDMeYgeaeS
 LpsbAfPhcCySC83n+dYDG1D0H6zuQ1Du69UIlxbhE3x/+V9mzzaFRkXkF
 1R0Zw/bV5ZAt6B6LOwYkuYuiDjolS/OmptVayaEGqYU5Yrk2wKMtMVJVJ g==;
X-CSE-ConnectionGUID: 6Kk08s8/QfmqWfMC+BCo/w==
X-CSE-MsgGUID: rjBALFG5RPKtkQzeE7wwJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="28651554"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="28651554"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 14:19:57 -0700
X-CSE-ConnectionGUID: LmHSmYkET5aPim3VLFZq+g==
X-CSE-MsgGUID: aa0lbPU+Se+LiZVgxnp51A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="67551658"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 14:19:56 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 14:19:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 14:19:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 14:19:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQQuo1rP2wrdVwuksfyB7s3H88jYY3Gm+CDiC5VJIPRGZUj9dvKigqbkHAcyebUMi2vM5IxPu/oRJV0ajvhREfsDnviJJCsHUGZ0ED7BI7r3gdaFGs1uAvwET4sbUT6fg5XDXS/4erZnryKAjtRi4+QCzuFY24H4s5vGvbPchjExTGDD9KwNyQ25cdsb4YWvIX5K7Geg2SnYK+FTgtu2bFpGKSPn2KyFFmFD6Be/zEuLq6wsX4uZ7FwAMpdOIQTGvh3qZesowqir3hOVXll6N+0xdRZXkdR+gmmLR7vNRQGezZ4qwbXaaSI4DF+kQkSX2zZAtm0i4hrCeASv98zEFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gv+SrsxpGvvRxOK2U0z2NjJ66j48Zdqx9Aq+G9XwSUQ=;
 b=OvPXk9H4to/N+JFvvDW404hYvp9xvNGb1lLa6MUgucDGRl2fJgiYAg79OH9IiGoYTzILOLbA+NaEFTB5iPoV6KrhvZgOG/5AWAc2QSxv7otQJi0B1xhoAfVfEI4vEWLHZ6+4uZxMijSseWV6i+XR+yj9z3A5df+89OtYZfpn2K+JZ/BBNkXoGhbRnH2pcrQnCCwLPWtriX6h8kgcRH2jEF8VOIUY1wFoub8APWFHzaqpIKNrO5FCs3vXjrIgeR6c4bdufydAD/136LckPx/ulJKtZ2acFCC/e3kTmt3kgTnWofzL+o3uNnfnkF94aV0J1yb84ZiF/Oaoi8mrgQey3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA2PR11MB5147.namprd11.prod.outlook.com (2603:10b6:806:118::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Wed, 11 Sep
 2024 21:19:52 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 21:19:52 +0000
Date: Wed, 11 Sep 2024 21:18:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Francois Dugast <francois.dugast@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5] drm/xe: Add driver load error injection
Message-ID: <ZuIJLu/fH04fHS3E@DUT025-TGLU.fm.intel.com>
References: <20240910152241.1554435-1-francois.dugast@intel.com>
 <ZuC2BiKnZEaXAY1N@intel.com>
 <tpweqdb7sux3pfnz6762omn5jate6xugqfxmm7wcfq3gf7qfmv@5ukqvov3au42>
 <ZuFzhBHH3TKDAPel@fdugast-desk> <ZuICC_gKCSyxRj2H@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZuICC_gKCSyxRj2H@intel.com>
X-ClientProxiedBy: SJ0PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::11) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA2PR11MB5147:EE_
X-MS-Office365-Filtering-Correlation-Id: 91140370-600b-495f-de86-08dcd2a779b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3pEV2w2KzQxTCtOQkxxNFlENFE3WDdCL2E0aWI2ZlAvT1E2a2t5Qk1vc2Vx?=
 =?utf-8?B?ZHhLYzNaWEdiRGg4VmtVaXlCaDZHMk1rQlRJRkFRY1I2dVhUYzE3dWliSFB5?=
 =?utf-8?B?OUYrUEJncW9qQUdYVEFTWk00bHRNSkJiTzBKaHpDVnZnQ0ZabzA4WkJ3aHUy?=
 =?utf-8?B?cDBSSFZIbFNBemorTmI5VXI1cUJCQ2xRdkJZTVNFMHBFQ3JqZHowTkwrQjVO?=
 =?utf-8?B?QTZpMExjREFubm1lTG1lOWFHcGNaZktpK2wxSUNTdVdGeSt3UGc5UytWZGFs?=
 =?utf-8?B?V2hPTEJXdWp2NG1sU0tKS09FUFU3SFVLWXBjY1dCczkyUzBxL2tTWTNLNDVp?=
 =?utf-8?B?WWdHWUc2Y1YvZUVPTmJ6UkoremtsQXl2UitYTDZRdFlaUTRxZmpJZ0xIQUZu?=
 =?utf-8?B?Z3gxdVBJZDIzS3lQdWdLSWMxbERqY0dPekhKM1ZCRkZ0QjJCSktWcFNOdElJ?=
 =?utf-8?B?QTRQVlpWa2xZMUdhWmdCUzhlOUxueEVja0VPR3NHd2FwN3d5RDlaZXVWUzFu?=
 =?utf-8?B?M1N6clNBb0NRME8rcjBKQWk4QWFNS0FQdll0amdEdm42TFAvMGJoSkxFNk9Y?=
 =?utf-8?B?YkYreit3c2JZN0RRVmpxYXNWNjlvSG03YlR6TDM5M3VPeHV4Tmdyb3R5RnBi?=
 =?utf-8?B?cnhDRGZPdW9jL3lUcEJrckJTNml3ZFlJUThTSldxWUE5Smp2aWVKWUUzelRR?=
 =?utf-8?B?WmxjN3dheGUvZ2lKYjVETFZZSVJKc3lFT2VNeWtRZ256enNmdzNqdmNRN0RW?=
 =?utf-8?B?cXRyUGtTWmZKclA0NE9vcUNpcW1PYVI4d2x5Sk81eTdpaGRzTzZRemQwMlBx?=
 =?utf-8?B?elA0MVp3K3dybkxZYTNRdi9YRGREbnkzMHJURHRSL2s4L3FBVnJzMVJiY3Vo?=
 =?utf-8?B?endiSmtydkRTUGdNTG9WRTlKdmQvK1p0cEE3WlpPdnBxV05xaWRLNWdGeTdn?=
 =?utf-8?B?SHA5MWI0b01LaFZkK3YraEcwcjRCZ3NKZUg2UTVmTXhzdkZobzhzNHdlS0Ja?=
 =?utf-8?B?QWRQTkhSYTVjcEsyQ3dkV29EY214SVI3VjRvSEJnN3A5ZXBVTlRTZEFkU1o0?=
 =?utf-8?B?RENJODZPMEd4TlU3UXYvSUV5dVJnWHhlYW1ncktqcjVLTjcrT1hyYUtGZERa?=
 =?utf-8?B?OElOb2M4TEJxcmJjNzBGbzR5OGpFcFBIbWhTbnhMZzVIMXZiN2RDdkgwUE1H?=
 =?utf-8?B?UlhuTUw0VHE0THBITnlHOGNFNGVpa2daWW9vbC84cnhmeDlhbGhmckYySDc0?=
 =?utf-8?B?MWI5ajVpbHpPbGZxSjNZV1gxMUsycXBSRXFpREFnVnVXNjZvbmZlUXZrbkI3?=
 =?utf-8?B?RVlBTlRhb09xZDFBRml4RWkrNndQOG11MVBEQm1GNDZLQmgvWnJtdzZQODND?=
 =?utf-8?B?bG9ScllLOXYrWmVuR28yS21jbHpjbkxORVh0Y2RaSG0wZkFyeE1EVVpQRnE3?=
 =?utf-8?B?SVE4eDhZY2psQmc3bW5SdlFaMUQvNUhNQVNnQURadVRyd05DMkkzYmx6dDFX?=
 =?utf-8?B?aG9lMmhtTXBKdjhXcXExZHZ6cVhJcWlxcEdHUVYzb2pheUJ4M2syRXN5ZUtj?=
 =?utf-8?B?RDcxNlpTWGdkaGRUWUF2RDRjWEF6eTU1eXpxL1BJN2lxRkUxWVQxbGJRQ05F?=
 =?utf-8?B?c092OHowQ080TXdzaEdMQ0wyd28vcWZ3UXNCWk1FNFRFMHF1WnlHeUlxTnNF?=
 =?utf-8?B?Mjh4enAwNFo4cCs2RTlmbWtCWXNRWHo4eHFjUnVzV2tpaU5EWVJPT2x3Yk1M?=
 =?utf-8?B?Wm5zRTBSSFdmaDVUd3c1bWd0aVVqc3BHcjFNZHFJbTROUEVtbkRWaitwMDNJ?=
 =?utf-8?Q?s/0r+iCMzWQtk5P7vfJJqXtJdPtX08i5xgjCo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjQxSXFIT01UYjV2aFhFeGp1TzY4Y0pnZVY1NGhtaXVGRFU4SVM5N3dFaEg5?=
 =?utf-8?B?TGxoZzdvcnBCVDZuWHlLeFhFalZZK3pEQ3N5TTVEamY4UU15bVl1Q05GWnpl?=
 =?utf-8?B?Kzc2RGlvQnQ1TC94N3hUMzd6clRYSzdvd0Y2K3liMnZaY1dqaHZ4K3kra29V?=
 =?utf-8?B?aFdzbC9RVGxHdzFpdVpWempSNGFOdFJDWEFiODdlSUdHcUlYU09sYUlSMG1K?=
 =?utf-8?B?VWRja1VDeS80c2xLbHY0eldTMjBsbVR3MEpSKyt3QjRyNXgza0FVZDk1eTNy?=
 =?utf-8?B?R0hjTi9aa2tZQmpYWFdNRzJVbndJYmxpcWJQU2pJckNzVGdpSDFaWUFmS3cz?=
 =?utf-8?B?Q3VRa2FHTndmbWFrR3A3Vk4xNVFINjcxV252SEJJMU4vdUVnQTFqVStydXo0?=
 =?utf-8?B?NHdjMURsWWtseUY2cGIzcFpYSmdpcGxIZlFmYm1JYUFxMXpmOENuczVqLzBV?=
 =?utf-8?B?OHNYZHJ1R3pmajhDWlBRQUFCdUVPb0FWRU95UnhtTFNnYWF4eGxnTkoyQXNi?=
 =?utf-8?B?Y1IzeXhDQjhpVFpGLytwWjVDNnQ0QWxBUE5ydmdZVzhiSHZ0cDQ4Umt0VGph?=
 =?utf-8?B?Q3NoNkdEdU95ZXkwdTFKUVdwL3BNTnZtTTMwdUgzOUJUbFFqVUFsRlpmNjgv?=
 =?utf-8?B?MUI4cFVVQ1Q2WTd5MFRSNmlJN1ovSU53UWlQWGRuZ1ZubmUvNTZLTGZURDVI?=
 =?utf-8?B?UEZhUHpGdFY4dzlWaGFRRmUrVnhNd1pyUngwNTdoZHZGVVYxV1VHRitoSTl1?=
 =?utf-8?B?M3RaODdVMnpsOVNYV0VaQzZnU2M0TmZVWkhYNTdEYk5oendWcms5elVXaVNX?=
 =?utf-8?B?TURNaldqK282VmJGd081RjB1bGNFS0ErdWNSMHl2dkZGeSt0RUxZU2JGaGl1?=
 =?utf-8?B?MXYraVl5d1VCQ0EyZCtFZUZ4M0tqcjhaNlRWVFJzWkFLanZ3M2YvVDB2YjE3?=
 =?utf-8?B?a0hDMUJHTENXTVdtRFlQRDRGL2JIaWdYcGM0UWNWdHpTSWR0OTgzUHhYUHlP?=
 =?utf-8?B?aGpjR05aYzVocWNNbDBSZ3k4SHRnWU9VZkFBczE1YWdRSFQzc01XY240QTVK?=
 =?utf-8?B?MVIydENZSUhRR2JYdVhqMER0cVVwRGcwaVdJVGt6Ylh2SXIyZ2FGRWxQT3hV?=
 =?utf-8?B?b042M3NjMmM5bE1mTzA0VSt6ZUR4S3NBdGl2M0JScjFERzdQVTJuZnpUQ3NI?=
 =?utf-8?B?VnV0MEg4d0QydEIzbzdkTHozYXZhcHhMZ0dLMXlQbXY5MVU2ZHpOZk52cHNR?=
 =?utf-8?B?ZXhNYTdTQStEMFRJYWVUdmFKaGdQWWp0N3NTT1hScUdXUndiNElTeXN1YkV3?=
 =?utf-8?B?RjhDQlFXME1XNFpoeGlIWXp4V1d6VG1QUEkxV2pTRzExUUpydm1iS0xjTGUw?=
 =?utf-8?B?R3VrZW9DVzlINTBhZmxpcVFFVTVRYWdubTVDellsVmVMR2wxMytlM1pkdUJa?=
 =?utf-8?B?UWRMcnBDUEJTTkpydlFWcUhSRFZFR3pEd3dUM2hZOWppdkhNQzBjbTB4SWdH?=
 =?utf-8?B?TFlmRENUMFZIRTJ5Tmk3MFlQSVJaRkd2akUzZlYxalZHMDhta0VuOEYwU1pM?=
 =?utf-8?B?MElocDdFZVdDcnJzZlVNckdjWVNvcTE5RUhGTWMwcjFyTWM5dGNvNktscmVN?=
 =?utf-8?B?cWZLckJiU3NRM3YrcmlaeXRDWnhpdmoyOUh5UFk0aE50L3pCNExQUythMGxP?=
 =?utf-8?B?L3Y2SGQrTFZZSDJoSHlKeWlqbVF2VXVXVmFPR2QyOEFHWFVORE5jU0VsL1Vj?=
 =?utf-8?B?bTVGVVkwZkxRQ3FYWkJCdG0yRy9NenNRdWd0aU1VNVRPMlExQTlOY1dWR3RB?=
 =?utf-8?B?RG1JZG1Hakk0NU5qZFpKL09XcEFQZXVRS0ZUQlU2cEI0YXFlQ0lVZU10b3Jk?=
 =?utf-8?B?L3BNQS9icHZtVnhZODg4aHpOdDJPbXhjWmFhUlA5L0ZNU2RaUndobHNLUEhS?=
 =?utf-8?B?WW9EWnZ5V3lwbmY3MjN5anVuT0xiVlN1VkFkNFdRZVJlMi9ObUk3Y0FFMnRp?=
 =?utf-8?B?c0d3cjJJWnNFNURNMEF0MjZ2YytlZC9yZXY1bG9VbFdQeCtacDQxTzJnTmJL?=
 =?utf-8?B?dkJtVGxrT1NRbi9yVjZBem9vUjVLZS9HWGtCL3dJeTZsdGdzYkNsOWVVRzQv?=
 =?utf-8?B?UFRQZ00rNDdPTEhCaTJaVWZsWmNFbHRqSGlBNXBDQ1Nod2s1TERGN243dktE?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91140370-600b-495f-de86-08dcd2a779b6
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 21:19:52.5048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gUs9TKl86BA0QO0EkO5QEE1/6FuQgZsNIDcu2yQTGUR4t1e4S53Lp3LA3/z0rZ4C2dbV04OaOmQrGqyXmGiceQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5147
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

On Wed, Sep 11, 2024 at 04:48:11PM -0400, Rodrigo Vivi wrote:
> On Wed, Sep 11, 2024 at 12:40:04PM +0200, Francois Dugast wrote:
> > On Tue, Sep 10, 2024 at 04:33:21PM -0500, Lucas De Marchi wrote:
> > > On Tue, Sep 10, 2024 at 05:11:34PM GMT, Rodrigo Vivi wrote:
> > > > On Tue, Sep 10, 2024 at 05:22:41PM +0200, Francois Dugast wrote:
> > > > > Those new macros inject errors by overriding return codes. They must
> > > > > manually be called, preferably at the very beginning of the function
> > > > > that will fault, otherwise if not possible by turning this pattern:
> > > > > 
> > > > >     err = foo();
> > > > >     if (err)
> > > > >         return err;
> > > > > 
> > > > > into:
> > > > > 
> > > > >     err = foo();
> > > > >     err = xe_device_inject_driver_probe_error(xe, err);
> > > > >     if (err)
> > > > >         return err;
> > > > > 
> > > > > When CONFIG_DRM_XE_DEBUG is not set, this has no effect.
> > > > > 
> > > > > When CONFIG_DRM_XE_DEBUG is set, the error code at checkpoint X will
> > > > > be overridden when the module argument inject_driver_load_error is
> > > > > set to value X. By doing so, it is possible to test proper error
> > > > > handling and improve robustness for current and future code. A few
> > > > > injection points are added in this patch but more need to be added.
> > > > > One way to use this error injection at driver probe is:
> > > > > 
> > > > >     for i in {1..200}; do
> > > > >         echo "Run $i"
> > > > >         modprobe xe inject_driver_probe_error=$i;
> > > > >         rmmod xe;
> > > > >     done
> > > > 
> > > > can we have an IGT test so we ensure that CI is tracking and we are working
> > > > to close the existing issues?
> > > 
> > > yeah.. that would be great. I think it would make more sense to use
> > > bind/unbind in igt.
> 
> Hmm... but that would require a deferred_probe and then the bind to force the reprobe...
> kind of complicate things here...
> 
> > > 
> > > > 
> > > > > 
> > > > > In the future this is expected to be replaced by the infrastructure
> > > > > provided by fault-inject.h
> > > > 
> > > > I was taking a look at the fault-inject again. It could easily be a
> > > > global fault_attr with a module sysfs entry, then during the test
> > > > you load the module, then unbind the device, then change the fault-inject
> > > > probability and time and then bind it back what will reprobe, but now
> > > > with the fault-injected.
> > > > 
> > > > The only problem with the fault-inject idea is that it would require
> > > > a very granular thing with multiple fault_attr, one per failure.
> > > 
> > > when going with a real fault-injection, I'd actually try to cover it per
> > > function as described here:
> > > 
> > > https://docs.kernel.org/fault-injection/fault-injection.html
> > > 	/sys/kernel/debug/fail_function/inject:
> > > 
> > > 	Format: { ‘function-name’ | ‘!function-name’ | ‘’ }
> > > 
> > > 	specifies the target function of error injection by name. If the
> > > 	function name leads ‘!’ prefix, given function is removed from injection
> > > 	list. If nothing specified (‘’) injection list is cleared.
> > > 
> > > Integration via ALLOW_ERROR_INJECTION() is similar to the
> > > KUNIT_STATIC_STUB_REDIRECT() we already use.
> > > 
> > > In my review I didn't bother to go with fault-inject directly because we
> > > will probably need to refactor the code so the failure points are in
> > > their own functions. Something we don't have today. Short term it's
> > > important to fix the current/unknown problems. Mid term we can convert
> > > things piece meal.
> > > 
> > > Are we on the same page?
> > 
> > It is also my intention with this patch, get something in with minimal risk
> > and changes so we can soon focus on solving potential issues it highlights.
> > 
> > In parallel I am preparing a RFC based on fault-inject with a proposal how
> > we can use fail_function with a few real examples from our code that we can
> > take more time to discuss thoroughly.
> 
> I'm also on the same page. Let's do it.
> 
> But we need to at least:
> 1. fix the documentation return statement
> 2. fix checkpatch on module_param_named_unsafe huge line
> 3. IGT ?!

IGT can be bash loop...

for i in {1..200}; do echo "Run $i"; modprobe xe inject_driver_load_error=$i; rmmod xe; done

Matt

> 
> > 
> > Francois
> > 
> > > 
> > > > But at least this really ensures that we are really testing all the cases
> > > > with more reliability.
> > > > 
> > > > I just realized that this i915-style probe injection might have an issue
> > > > on platforms with discrete platforms. Well, the pci subsystem won't
> > > 
> > > one more reason to go with the bind/unbind. Then you control where it's
> > > happening and where.
> > > 
> > > Lucas De Marchi
> > > 
> > > > probe in parallel, and likely it will be the same order of probe on
> > > > every module load, but if it doesn't the Nth point of the failure
> > > > won't be the same everytime, so in every load you might stop in a
> > > > different device and end up with not covering every single entry.
> > > > Unlikely I know... And I don't believe this should be a blocker
> > > > to move forward with something...
> > > > 
> > > > (more below)
> > > > 
> > > > > 
> > > > > v2: Fix style and build errors, modparam to 0 after probe, rename to
> > > > >     xe_device_inject_driver_probe_error, check type when compiled out,
> > > > >     add _return macro, move some uses to the beginning of the function
> > > > > v3: Rebase
> > > > > v4: Improve commit message and comments, keep if/return rather than
> > > > >     change the flow inside the macro (Lucas De Marchi)
> > > > > v5: Rebase, add comments, keep existing return points (Lucas De Marchi)
> > > > >     Add finish wrapper, move to function beginning for all xe functions
> > > > >     (Michal Wajdeczko) Bolt into i915 error injection (Jani Nikula)
> > > > > 
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/display/ext/i915_utils.c |  4 +-
> > > > >  drivers/gpu/drm/xe/xe_device.c              | 48 +++++++++++++++++++++
> > > > >  drivers/gpu/drm/xe/xe_device.h              | 30 +++++++++++++
> > > > >  drivers/gpu/drm/xe/xe_device_types.h        |  5 +++
> > > > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c |  5 +++
> > > > >  drivers/gpu/drm/xe/xe_guc.c                 |  1 +
> > > > >  drivers/gpu/drm/xe/xe_guc_ct.c              |  1 +
> > > > >  drivers/gpu/drm/xe/xe_guc_pc.c              |  4 ++
> > > > >  drivers/gpu/drm/xe/xe_mmio.c                |  5 +++
> > > > >  drivers/gpu/drm/xe/xe_module.c              | 17 ++++++++
> > > > >  drivers/gpu/drm/xe/xe_module.h              |  3 ++
> > > > >  drivers/gpu/drm/xe/xe_pci.c                 |  5 +++
> > > > >  drivers/gpu/drm/xe/xe_pm.c                  |  5 +++
> > > > >  drivers/gpu/drm/xe/xe_sriov.c               |  7 ++-
> > > > >  drivers/gpu/drm/xe/xe_sriov_pf.c            |  6 +++
> > > > >  drivers/gpu/drm/xe/xe_tile.c                | 13 ++++++
> > > > >  drivers/gpu/drm/xe/xe_uc.c                  |  4 ++
> > > > >  drivers/gpu/drm/xe/xe_wa.c                  |  8 +++-
> > > > >  drivers/gpu/drm/xe/xe_wopcm.c               |  7 ++-
> > > > >  19 files changed, 172 insertions(+), 6 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/display/ext/i915_utils.c b/drivers/gpu/drm/xe/display/ext/i915_utils.c
> > > > > index 43b10a2cc508..11d8377a125f 100644
> > > > > --- a/drivers/gpu/drm/xe/display/ext/i915_utils.c
> > > > > +++ b/drivers/gpu/drm/xe/display/ext/i915_utils.c
> > > > > @@ -4,6 +4,7 @@
> > > > >   */
> > > > > 
> > > > >  #include "i915_drv.h"
> > > > > +#include "xe_device.h"
> > > > > 
> > > > >  bool i915_vtd_active(struct drm_i915_private *i915)
> > > > >  {
> > > > > @@ -16,11 +17,10 @@ bool i915_vtd_active(struct drm_i915_private *i915)
> > > > > 
> > > > >  #if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
> > > > > 
> > > > > -/* i915 specific, just put here for shutting it up */
> > > > >  int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
> > > > >  			      const char *func, int line)
> > > > >  {
> > > > > -	return 0;
> > > > > +	return __xe_device_inject_driver_probe_error(i915, err, 0, func, line);
> > > > >  }
> > > > > 
> > > > >  #endif
> > > > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > > > index 449b85035d3a..f22d94ff302e 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > > @@ -319,6 +319,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> > > > >  	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
> > > > >  			      xe->drm.anon_inode->i_mapping,
> > > > >  			      xe->drm.vma_offset_manager, false, false);
> > > > > +	err = xe_device_inject_driver_probe_error_override(xe, err);
> > > > >  	if (WARN_ON(err))
> > > > >  		goto err;
> > > > > 
> > > > > @@ -477,6 +478,7 @@ static int xe_set_dma_info(struct xe_device *xe)
> > > > >  		goto mask_err;
> > > > > 
> > > > >  	err = dma_set_coherent_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
> > > > > +	err = xe_device_inject_driver_probe_error_override(xe, err);
> > > > >  	if (err)
> > > > >  		goto mask_err;
> > > > > 
> > > > > @@ -498,6 +500,11 @@ static int wait_for_lmem_ready(struct xe_device *xe)
> > > > >  {
> > > > >  	struct xe_gt *gt = xe_root_mmio_gt(xe);
> > > > >  	unsigned long timeout, start;
> > > > > +	int err;
> > > > > +
> > > > > +	err = xe_device_inject_driver_probe_error(xe);
> > > > > +	if (err)
> > > > > +		return err;
> > > > > 
> > > > >  	if (!IS_DGFX(xe))
> > > > >  		return 0;
> > > > > @@ -750,6 +757,8 @@ int xe_device_probe(struct xe_device *xe)
> > > > >  	for_each_gt(gt, xe, id)
> > > > >  		xe_gt_sanitize_freq(gt);
> > > > > 
> > > > > +	xe_device_inject_driver_probe_error_finish();
> > > > > +
> > > > >  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
> > > > > 
> > > > >  err_fini_display:
> > > > > @@ -1000,3 +1009,42 @@ void xe_device_declare_wedged(struct xe_device *xe)
> > > > >  	for_each_gt(gt, xe, id)
> > > > >  		xe_gt_declare_wedged(gt);
> > > > >  }
> > > > > +
> > > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > > > +/**
> > > > > + * __xe_device_inject_driver_probe_error - Inject an error during device probe
> > > > > + * @xe: xe device instance
> > > > > + * @err_injected: the error to inject
> > > > > + * @err_real: the error returned by the actual function
> > > > > + * @func: the name of the function where this is called from
> > > > > + * @line: the line where this is called from
> > > > > + *
> > > > > + * This is not meant to be called directly, only through xe_device_inject_driver_probe_error.
> > > > > + *
> > > > > + * Return: err_real if != 0, err_injected otherwise
> > > > 
> > > > Not just otherwise....
> > > > 
> > > > Return 0 if this is not the Nth iteration of the requested iterations from
> > > > modparam.inject_driver_probe_error
> > > > 
> > > > Return err_injected if in the Nth iteration...
> > > > 
> > > > > + */
> > > > > +int __xe_device_inject_driver_probe_error(struct xe_device *xe, int err_injected, int err_real,
> > > > > +					  const char *func, int line)
> > > > > +{
> > > > > +	if (err_real != 0)
> > > > > +		return err_real;
> > > > > +
> > > > > +	if (xe->inject_driver_probe_error >= xe_modparam.inject_driver_probe_error)
> > > > > +		return 0;
> > > > > +
> > > > > +	if (++xe->inject_driver_probe_error < xe_modparam.inject_driver_probe_error)
> > > > > +		return 0;
> > > > > +
> > > > > +	drm_info(&xe->drm, "Injecting failure %d at checkpoint %u [%s:%d]\n",
> > > > > +		 err_injected, xe->inject_driver_probe_error, func, line);
> > > > > +
> > > > > +	xe_modparam.inject_driver_probe_error = 0;
> > > > > +	return err_injected;
> > > > > +}
> > > > > +
> > > > > +void __xe_device_inject_driver_probe_error_finish(void)
> > > > > +{
> > > > > +	/* After probe finishes, stop checking for error injection */
> > > > > +	xe_modparam.inject_driver_probe_error = 0;
> > > > > +}
> > > > > +#endif
> > > > > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > > > > index 894f04770454..c410e55b6b09 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > > > @@ -178,4 +178,34 @@ void xe_device_declare_wedged(struct xe_device *xe);
> > > > >  struct xe_file *xe_file_get(struct xe_file *xef);
> > > > >  void xe_file_put(struct xe_file *xef);
> > > > > 
> > > > > +#define XE_DEVICE_INJECTED_ERR -ENODEV
> > > > > +#define xe_device_inject_driver_probe_error(__xe) \
> > > > > +	__xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJECTED_ERR, 0, __func__, __LINE__)
> > > > > +#define xe_device_inject_driver_probe_error_override(__xe, __err_real) \
> > > > > +	__xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJECTED_ERR, __err_real, __func__, \
> > > > > +					      __LINE__)
> > > > > +#define xe_device_inject_driver_probe_error_finish()	\
> > > > > +	__xe_device_inject_driver_probe_error_finish()
> > > > > +
> > > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > > > +
> > > > > +int __xe_device_inject_driver_probe_error(struct xe_device *xe,
> > > > > +					  int err_injected, int err_real,
> > > > > +					  const char *func, int line);
> > > > > +
> > > > > +void __xe_device_inject_driver_probe_error_finish(void);
> > > > > +
> > > > > +#else
> > > > > +
> > > > > +static inline int __xe_device_inject_driver_probe_error(struct xe_device *xe,
> > > > > +							int err_injected, int err_real,
> > > > > +							const char *func, int line)
> > > > > +{
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static inline void __xe_device_inject_driver_probe_error_finish(void) {};
> > > > > +
> > > > > +#endif
> > > > > +
> > > > >  #endif
> > > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > index ec7eb7811126..582b8b7cdee4 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > @@ -487,6 +487,11 @@ struct xe_device {
> > > > >  		int mode;
> > > > >  	} wedged;
> > > > > 
> > > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > > > +	/** @inject_driver_probe_error: Counter used for error injection during probe */
> > > > > +	int inject_driver_probe_error;
> > > > > +#endif
> > > > > +
> > > > >  #ifdef TEST_VM_OPS_ERROR
> > > > >  	/**
> > > > >  	 * @vm_inject_error_position: inject errors at different places in VM
> > > > > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> > > > > index 0e23b7ea4f3e..b5da321bbbea 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> > > > > @@ -12,6 +12,7 @@
> > > > >  #include "regs/xe_guc_regs.h"
> > > > >  #include "regs/xe_regs.h"
> > > > > 
> > > > > +#include "xe_device.h"
> > > > >  #include "xe_mmio.h"
> > > > >  #include "xe_gt_sriov_printk.h"
> > > > >  #include "xe_gt_sriov_pf_helpers.h"
> > > > > @@ -275,6 +276,10 @@ int xe_gt_sriov_pf_service_init(struct xe_gt *gt)
> > > > >  {
> > > > >  	int err;
> > > > > 
> > > > > +	err = xe_device_inject_driver_probe_error(gt_to_xe(gt));
> > > > > +	if (err)
> > > > > +		return err;
> > > > > +
> > > > >  	pf_init_versions(gt);
> > > > > 
> > > > >  	err = pf_alloc_runtime_info(gt);
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > > > index 5599464013bd..eb764b44ced7 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > > > @@ -353,6 +353,7 @@ int xe_guc_init(struct xe_guc *guc)
> > > > >  	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
> > > > > 
> > > > >  	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
> > > > > +	ret = xe_device_inject_driver_probe_error_override(guc_to_xe(guc), ret);
> > > > >  	if (ret)
> > > > >  		goto out;
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > > index 4b95f75b1546..51ffb05605bb 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > > @@ -202,6 +202,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> > > > >  	ct->bo = bo;
> > > > > 
> > > > >  	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
> > > > > +	err = xe_device_inject_driver_probe_error_override(xe, err);
> > > > >  	if (err)
> > > > >  		return err;
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > > > index 034b29984d5e..d27d843057e7 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > > > @@ -1064,6 +1064,10 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
> > > > >  	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
> > > > >  	int err;
> > > > > 
> > > > > +	err = xe_device_inject_driver_probe_error(xe);
> > > > > +	if (err)
> > > > > +		return err;
> > > > > +
> > > > >  	if (xe->info.skip_guc_pc)
> > > > >  		return 0;
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > > > > index 3fd462fda625..a4cf082d3261 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > > > @@ -136,6 +136,11 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
> > > > >  {
> > > > >  	size_t tile_mmio_size = SZ_16M;
> > > > >  	size_t tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
> > > > > +	int err;
> > > > > +
> > > > > +	err = xe_device_inject_driver_probe_error(xe);
> > > > > +	if (err)
> > > > > +		return err;
> > > > > 
> > > > >  	mmio_multi_tile_setup(xe, tile_mmio_size);
> > > > >  	mmio_extension_setup(xe, tile_mmio_size, tile_mmio_ext_size);
> > > > > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > > > > index 77ce9f9ca7a5..3de603e0438f 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_module.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_module.c
> > > > > @@ -56,6 +56,23 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
> > > > >  MODULE_PARM_DESC(force_probe,
> > > > >  		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
> > > > > 
> > > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > > > +/*
> > > > > + * The error code at checkpoint X will be overridden when the module argument
> > > > > + * inject_driver_load_error is set to value X. By doing so, it is possible to
> > > > > + * test proper error handling and improve robustness for current and future
> > > > > + * code. One way to test multiple error injection points:
> > > > > + *
> > > > > + * for i in {1..200}; do
> > > > > + *     echo "Run $i"
> > > > > + *     modprobe xe inject_driver_probe_error=$i;
> > > > > + *     rmmod xe;
> > > > > + * done
> > > > > + */
> > > > > +module_param_named_unsafe(inject_driver_probe_error, xe_modparam.inject_driver_probe_error, int, 0600);
> > > > 
> > > > we need to break this line... or perhaps get a smaller word for the param name?
> > > > 
> > > > > +MODULE_PARM_DESC(inject_driver_probe_error, "Inject driver probe error");
> > > > > +#endif
> > > > > +
> > > > >  #ifdef CONFIG_PCI_IOV
> > > > >  module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
> > > > >  MODULE_PARM_DESC(max_vfs,
> > > > > diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> > > > > index 161a5e6f717f..47cefaf8d79b 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_module.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_module.h
> > > > > @@ -20,6 +20,9 @@ struct xe_modparam {
> > > > >  	char *force_probe;
> > > > >  #ifdef CONFIG_PCI_IOV
> > > > >  	unsigned int max_vfs;
> > > > > +#endif
> > > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > > > +	int inject_driver_probe_error;
> > > > >  #endif
> > > > >  	int wedged_mode;
> > > > >  };
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > > > index 3bce0e550a63..9bb60b300727 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > > @@ -644,8 +644,13 @@ static int xe_info_init(struct xe_device *xe,
> > > > >  	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
> > > > >  	struct xe_tile *tile;
> > > > >  	struct xe_gt *gt;
> > > > > +	int err;
> > > > >  	u8 id;
> > > > > 
> > > > > +	err = xe_device_inject_driver_probe_error(xe);
> > > > > +	if (err)
> > > > > +		return err;
> > > > > +
> > > > >  	/*
> > > > >  	 * If this platform supports GMD_ID, we'll detect the proper IP
> > > > >  	 * descriptor to use from hardware registers. desc->graphics will only
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > > > index 9c59a30d7646..a059be07a11d 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > > @@ -258,6 +258,7 @@ int xe_pm_init_early(struct xe_device *xe)
> > > > >  		return err;
> > > > > 
> > > > >  	err = drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
> > > > > +	err = xe_device_inject_driver_probe_error_override(xe, err);
> > > > >  	if (err)
> > > > >  		return err;
> > > > > 
> > > > > @@ -276,6 +277,10 @@ int xe_pm_init(struct xe_device *xe)
> > > > >  {
> > > > >  	int err;
> > > > > 
> > > > > +	err = xe_device_inject_driver_probe_error(xe);
> > > > > +	if (err)
> > > > > +		return err;
> > > > > +
> > > > >  	/* For now suspend/resume is only allowed with GuC */
> > > > >  	if (!xe_device_uc_enabled(xe))
> > > > >  		return 0;
> > > > > diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> > > > > index 5a1d65e4f19f..c7512d8acc28 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_sriov.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_sriov.c
> > > > > @@ -102,11 +102,13 @@ static void fini_sriov(struct drm_device *drm, void *arg)
> > > > >   */
> > > > >  int xe_sriov_init(struct xe_device *xe)
> > > > >  {
> > > > > +	int err;
> > > > > +
> > > > >  	if (!IS_SRIOV(xe))
> > > > >  		return 0;
> > > > > 
> > > > >  	if (IS_SRIOV_PF(xe)) {
> > > > > -		int err = xe_sriov_pf_init_early(xe);
> > > > > +		err = xe_sriov_pf_init_early(xe);
> > > > > 
> > > > >  		if (err)
> > > > >  			return err;
> > > > > @@ -114,7 +116,8 @@ int xe_sriov_init(struct xe_device *xe)
> > > > > 
> > > > >  	xe_assert(xe, !xe->sriov.wq);
> > > > >  	xe->sriov.wq = alloc_workqueue("xe-sriov-wq", 0, 0);
> > > > > -	if (!xe->sriov.wq)
> > > > > +	err = xe_device_inject_driver_probe_error(xe);
> > > > > +	if (!xe->sriov.wq || err)
> > > > >  		return -ENOMEM;
> > > > > 
> > > > >  	return drmm_add_action_or_reset(&xe->drm, fini_sriov, xe);
> > > > > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> > > > > index 0f721ae17b26..8d75bb6570f0 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> > > > > @@ -80,8 +80,14 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
> > > > >   */
> > > > >  int xe_sriov_pf_init_early(struct xe_device *xe)
> > > > >  {
> > > > > +	int err;
> > > > > +
> > > > >  	xe_assert(xe, IS_SRIOV_PF(xe));
> > > > > 
> > > > > +	err = xe_device_inject_driver_probe_error(xe);
> > > > > +	if (err)
> > > > > +		return err;
> > > > > +
> > > > >  	return drmm_mutex_init(&xe->drm, &xe->sriov.pf.master_lock);
> > > > >  }
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> > > > > index dda5268507d8..774668ac67b4 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_tile.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > > > > @@ -114,6 +114,10 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> > > > >  {
> > > > >  	int err;
> > > > > 
> > > > > +	err = xe_device_inject_driver_probe_error(xe);
> > > > > +	if (err)
> > > > > +		return err;
> > > > > +
> > > > >  	tile->xe = xe;
> > > > >  	tile->id = id;
> > > > > 
> > > > > @@ -127,6 +131,15 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> > > > > 
> > > > >  	xe_pcode_init(tile);
> > > > > 
> > > > > +	/*
> > > > > +	 * xe_tile_alloc() and xe_gt_alloc() only fail with -ENOMEM.
> > > > > +	 * drmm_zalloc() is used so resources will be freed even if
> > > > > +	 * an error is injected.
> > > > > +	 */
> > > > > +	err = xe_device_inject_driver_probe_error(xe);
> > > > > +	if (err)
> > > > > +		return err;
> > > > > +
> > > > >  	return 0;
> > > > >  }
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > > > > index 0d073a9987c2..6eaef7a3c58e 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_uc.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > > > > @@ -135,6 +135,10 @@ int xe_uc_init_hwconfig(struct xe_uc *uc)
> > > > >  {
> > > > >  	int ret;
> > > > > 
> > > > > +	ret = xe_device_inject_driver_probe_error(uc_to_xe(uc));
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > > +
> > > > >  	/* GuC submission not enabled, nothing to do */
> > > > >  	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> > > > >  		return 0;
> > > > > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > > > > index 28b7f95b6c2f..8baad6106968 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_wa.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > > > > @@ -825,6 +825,11 @@ int xe_wa_init(struct xe_gt *gt)
> > > > >  	struct xe_device *xe = gt_to_xe(gt);
> > > > >  	size_t n_oob, n_lrc, n_engine, n_gt, total;
> > > > >  	unsigned long *p;
> > > > > +	int err;
> > > > > +
> > > > > +	err = xe_device_inject_driver_probe_error(xe);
> > > > > +	if (err)
> > > > > +		return err;
> > > > > 
> > > > >  	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
> > > > >  	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
> > > > > @@ -833,7 +838,8 @@ int xe_wa_init(struct xe_gt *gt)
> > > > >  	total = n_gt + n_engine + n_lrc + n_oob;
> > > > > 
> > > > >  	p = drmm_kzalloc(&xe->drm, sizeof(*p) * total, GFP_KERNEL);
> > > > > -	if (!p)
> > > > > +	err = xe_device_inject_driver_probe_error(xe);
> > > > > +	if (!p || err)
> > > > >  		return -ENOMEM;
> > > > > 
> > > > >  	gt->wa_active.gt = p;
> > > > > diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> > > > > index d3a99157e523..70674b30c4c6 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_wopcm.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> > > > > @@ -206,6 +206,10 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
> > > > >  	bool locked;
> > > > >  	int ret = 0;
> > > > > 
> > > > > +	ret = xe_device_inject_driver_probe_error(xe);
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > > +
> > > > >  	if (!guc_fw_size)
> > > > >  		return -EINVAL;
> > > > > 
> > > > > @@ -252,8 +256,9 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
> > > > >  		guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
> > > > > 
> > > > >  check:
> > > > > +	ret = xe_device_inject_driver_probe_error_override(xe, ret);
> > > > >  	if (__check_layout(xe, wopcm->size, guc_wopcm_base, guc_wopcm_size,
> > > > > -			   guc_fw_size, huc_fw_size)) {
> > > > > +			   guc_fw_size, huc_fw_size) && !ret) {
> > > > >  		wopcm->guc.base = guc_wopcm_base;
> > > > >  		wopcm->guc.size = guc_wopcm_size;
> > > > >  		XE_WARN_ON(!wopcm->guc.base);
> > > > > --
> > > > > 2.43.0
> > > > > 
