Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D19CC77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 18:55:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDBD10E0DF;
	Tue, 24 Jun 2025 18:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kZuS797D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799BE10E61F
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 18:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750791324; x=1782327324;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=frtAkl6mgnWirrmLqToqw+cM5F8dV/l89xm9y3/6voA=;
 b=kZuS797DZdhslJmFcCvJSJB9Wph5veHJX2pnXuF0Z+jVPx4mMAnnchEq
 DZlXqO9VkxhKj/kfLfZEJMEgos4xWm/qKMHnckpHv4kDLXUycV9PC/I1X
 F1jesTgQu0K3WU62w21lPNgApkdNf4k6RNHenMV4odST1IdZ6PK5l61S8
 +C4w7/IFiOerQ3TLrXVNu4T6ubtJ8rJM0/02pFS7tC1FDPLGLwoI3S9JX
 z68eri6+SOdM+AxiSiQdZYIIPuBk4wMPnT2TGKFehbhSbdhVS2eejUmhH
 kjBU063ZZZvkZSEC9QH0xFbTDvE19J3Ks0SctzOf7ejC4Ld2cXJjiQQYX w==;
X-CSE-ConnectionGUID: d2SvO6GGSOaibJkJOhPMDg==
X-CSE-MsgGUID: BR6ZRkyiRYieErzgtbuvdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56720466"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="56720466"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 11:55:24 -0700
X-CSE-ConnectionGUID: wziDINLxQxOs2SjIFg80Og==
X-CSE-MsgGUID: hyYJ6TBYRdyMWgbuzR8Gaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="182882456"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 11:55:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 11:55:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 11:55:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.76)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 11:55:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3o83+GbD3tP6CoKVdhmayr3GEg0t37GdVSPNNpqqaAzBCL9ahrFVvL70KN5I67UlY+xxTUQShf904BZ5nSgVUYLHsIs8yaHO0r+PokTnQc2eXMtimOPrPM3B1PPyL654uarTKOd+Vs8Hlv2OwODAM4hA94iw4P544cXajHmjN1INeS+7MtCsMMKQFjTn/K6qoTL77Scwb/R0Rc/RIQKlpLGzd8DE3uoEa/xSLBB0m/5Lepe1xcyMCgrEk509Lo2PMQ9S9s2ctPfOwewXs9j4n1In1RX+DNt2ljQGZo5hm0ujomtPJJgZx9tJFPPrz+rzS+Jbt2wxvf85ssiXYyGHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KojjMlZNTWiVjaY1una7sce7vbAaF/U+luHgkHkXLfg=;
 b=owSni87cckRKquu8rCIiIOuRFAT/GCoOprIcH4LwavxJaiqkTx7+NaK3H9MY31l2jgicMOiyCPTyyfM3DgNaL7Pi3s7Is+HtezInDb2DG4/kqqzw0d9Ho176lIjS9jr6mw91aWN84Shu2I/KqcYt6Iue/fOixOMPFUMwuMh45rS23iteaQvBoPiTCmRZGHdlkzVGpwPbjRRvo36CMxfiIjsr+JW7lS8K19ChPRcHvDOHnHUf31ojVsIkGcXlcWEiSChSqiUaw53RrBiFgYF9ia15omToUsI4KRPkdbmGpnK4EdvIIyxKngeEc6jRxvnUf/OVTzF5NKb89isc/dHhmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7611.namprd11.prod.outlook.com (2603:10b6:806:304::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Tue, 24 Jun
 2025 18:55:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 18:55:18 +0000
Date: Tue, 24 Jun 2025 11:56:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 16/19] drm/xe/svm: Consult madvise preferred location
 in prefetch
Message-ID: <aFr0+mC6nPxSLdcf@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-17-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250527164003.1068118-17-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BYAPR06CA0037.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7611:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d479c1e-3141-459a-c517-08ddb350a9e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUYxcWtyTDBPWVV0YjJ1eWwvSGNSQXhvTG91VUdUeWJmUFprWUxQS2FoMm1Z?=
 =?utf-8?B?VjJONElKcWxnZVA3YVVOMDc0RDIwTFJhZ1dnbHkzdUdPR2wxME1RUXU1UUd6?=
 =?utf-8?B?QWgwUWIrRGx4TklKcmJoaG5MYTlPU1A2bGZHUGFVY3ZtVXpuREhZMmY0TWVX?=
 =?utf-8?B?REJKUy9yUHRjQzR2Tnl3U3BxNTgxVGQzWHBSN2tRaFJPcGk2eGJXV3RDOXZD?=
 =?utf-8?B?NllndFNYWlBBU0t6bkFQVzRnZUNodWZmQVA5NzBzNHFvS3dyRytMRDZwYUIv?=
 =?utf-8?B?OEt6bXFxdVhVNjhtMUNrMklDMmdzcFR5dzhzUWgzZFprck5nTHFOMlFNeTFh?=
 =?utf-8?B?Y2V5aUVIMG5Vd3QxOWNsSmxDQ3R6TzQ1cjFjaFhxTXNKNkI1RFpoL2wrRFhT?=
 =?utf-8?B?enJoK2VZNm1pZGtSZUpwN0FRQnhYRENIVThFUGdrd3kyVGErMitEVXEwSEw1?=
 =?utf-8?B?TjZFbnVhc0I1L2dxbnFYOUJZdGR6WEtjQngzV09adTgrZDVYd241a2J0TmRr?=
 =?utf-8?B?aExtVGhtZnNKczZWUG42em1uWVFJTzZ3Z29PQzlPcFlVcGJxY0NsdmJjVlZl?=
 =?utf-8?B?dkFLSU53NFFva3liMUxJZ1VpOUpNaHEyZ1o1MDFrRVE2MTNXZ3N2KzI5ZXFn?=
 =?utf-8?B?ajJ2L1llOHUyamFza01Jbkg3ckdMdGJMT1piam5OQXpiSU1lT0grQUtrUkJV?=
 =?utf-8?B?VTcyN2VVQzYwYjFvUWdvS2MyWWpFZE5qcU84bngwNm1EcTZmRkw4WVNSY2ZZ?=
 =?utf-8?B?V1dWSkgwdDJhOFRuc2JkS0pJUHJrU1g2NDUrTDQvR09JNGE1RFZvREFYUzRB?=
 =?utf-8?B?Mmp6d3VGUUVsV2M1Vnh5SHZHOVF6eGQ3d2tnMXZYQU9HOFZPMlYzL0lMZE5H?=
 =?utf-8?B?M1ZxWC9sWGN1VVV0OXcycU1WLzJYQmptRnZ6U2w1c3ZTNThIZURCZ3JIM1FT?=
 =?utf-8?B?K1V3a3RNeW01Wll0TUczSWZZU0J1b080TTBFanNaN3QyT1RMWlk2cElJVzBp?=
 =?utf-8?B?TVpsSG1oQTlGbWZLZG4rV1AzZnR6MTJwdHlDTzNPVzFjcnJZZVlaYXVKSVpu?=
 =?utf-8?B?SWFPdU02ckRVWE4xL3pPbnhXN3pEKzYrZkdFUjR4Q0lMWXZ6Y0dUVUp0TStk?=
 =?utf-8?B?d1ozMy94ZWpwUUw0WUk5eUdSaS9uemFJd1dhMm4zbGhzUHYwVjBCTTFmMlVq?=
 =?utf-8?B?R3JIUWpkSlhFOFdpTHRuWjNjVDJpaXc2aWswdkFPdzFwUGg1c2pYdFgvUzlU?=
 =?utf-8?B?K1F4OFF4Nk1vQXRZNjlVQlJxRFg2NWhEZXlZeDQvSHJiWGRKeU9IdGhqdDJG?=
 =?utf-8?B?RjAxVDNiNVlGekJvU2s3cXptUHBLNUNNNGl1OFYwSDhsNnJRRkhKODBIekhh?=
 =?utf-8?B?YTNlNVA5QWpuTHcza3pWQlVDSk4xblU3VFlMeXVRQTFydXFvWi9LUEFqdTVB?=
 =?utf-8?B?ZTVWNTg0cjExY3FuNGhoNytlejJsdUo0WHhidURZUk9Xd0I3L3BZMGJlbUYv?=
 =?utf-8?B?MHZpZlQzZUtsWFNSUUROZWsxTVAxdEZETEx1ck05b2h2SElaOGRzSVZqR25p?=
 =?utf-8?B?N0VYOFFFakEza1Q5ZU51RzU2cm1nRVdBSCtRcm1xV1FJSjJsL0NqbTJBN2hp?=
 =?utf-8?B?SFdaQ1ptZm96Z284N0I1eXpQc3FGUXl3MmFlazNGYWtEbE9DTzVjV1RlTzh4?=
 =?utf-8?B?VUJZWTJndHlaaEZrb2lDMWZ6SnptSEl2RUxCdFdsR2VoSVpZZHY3WTdZVExj?=
 =?utf-8?B?TFZHZkgzeHNsTWp5d1Q2TDRCZFZDUitxdGEwQ29FYStMOXlhb1pXRlpwMk9r?=
 =?utf-8?B?Q09ZWm5PMEFiYnZPN1hhUEZkcVlEWFRUbjBVTEpyZFIrQ1pTWU9RTXd2VURX?=
 =?utf-8?B?MmZXcy9TZHdXamJNeHlGZU8vSnd3MU4rUVUva28ydmRRRUlRWUZWZm1DRnJ1?=
 =?utf-8?Q?DMpk6m9pghA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejBMbFhaM2dYbjdlbU4xY1ovMS9YUXprODM4b0NZbjdYNlZLTnM0MlJMUXFq?=
 =?utf-8?B?OTltbEk4UjJ1VjJrYyt0TjlCai84U2crVXdQZlhLeTBISEs3alJ0MHlRWlJH?=
 =?utf-8?B?eDcyRGU3eGVET2l5bWNjUmM0YTI5ZUoxRzlVMXRLUVNrVG1kempYeG1mSDVS?=
 =?utf-8?B?U1M4MFd2RDI1aWM1c2lXN0ptSXoyV2RZQWptK2g4RC9FZnNEMS9uVTlaR21x?=
 =?utf-8?B?NjFycTVHRVVvcXYyM2oxakpRcmRMVE5YVU85RTFJS2FXWm0rd0p3bzEvM2xm?=
 =?utf-8?B?OEpNSTltejFjZUdiMWppVXJabG1QSW9HMU0vbzlpaTZmWkNURk5zakd2bnF1?=
 =?utf-8?B?OWxzbnNmYU1MaDR5Nkkrdk1NSmRYclpmUnZxMHhvdzhqeEhHQnJWWXU4STRy?=
 =?utf-8?B?d2hzL2t5RGJUZENWS0xPQll5VXUyRTJsSFVJSFk3L2RTejUxZCtCaDBndnVv?=
 =?utf-8?B?MWdyTW5CTGR3V05HK0ZvUFNGeit4VmpiY2dVN0dXc1MzRG01UkVuL2hOMTZS?=
 =?utf-8?B?ek5lMzBsTkNBUHJBTldyRnczNmFIYlViTWRFaC9rOVp4a1Q4OWl5RDRLZ2hv?=
 =?utf-8?B?OXBGNUxZdktiazNpOC84cWlrTkc2U1dBcDBOSXhOYzdGalhmY0RKUDBFQzU2?=
 =?utf-8?B?M0QyZi9WUmZ2U1cxeUQ1YlN6Q051eW5wQ0NtREdRL3BJQnRGbjVDUEF2MUZE?=
 =?utf-8?B?SDZYbXo0TitoZzlIZGRYZEhscWIvNkxHTCthc2dVRThiM3hibkxFTGt2ZUhh?=
 =?utf-8?B?N3p4d0E1dVhLa1FjZGp2NE9aOEg2cVN4LzhBY29Rb1Y5VzZCK0k4L25XM3hQ?=
 =?utf-8?B?RWFoRnQzdVRObUd1aFBtdS9GVThrd2VzQnZLL3VDR3VoR015dFRTMVhzeFov?=
 =?utf-8?B?SUVpSWl1ckdGc3VlVUV1M0xXbHdUNkFMNTRvYjdrMDVNVEJFK001cUFJUTFM?=
 =?utf-8?B?U21aazFvbG5UdjZseERpTGJYR3p5NzZFdmJja05iRUFVT3R0MEZLaDZENWlu?=
 =?utf-8?B?eEh0WkFlTDBsTEJ0RUljSExLV003VjMvVlpqLzd0emlXZlFqWHVaYjZJeW5L?=
 =?utf-8?B?TFlGcXpwOG5vQ0N0TXV2dmxsMUxnNXY3ZXpVSG5PYVN0MXpVVks5WXcxMTdW?=
 =?utf-8?B?ejFMd0NkYzAxT2crMUhyTlNMaUNiaXZPZjcvczRmcVI2eHFxemtJWVA2c3Fr?=
 =?utf-8?B?MGFGc3dNc09GcmVBek84RnI5Z2lWUTJub3NXajlONElNZ1Y2eE9vQ1R4dld3?=
 =?utf-8?B?NHpBUGF1K2tXNGdLSVBZbGFiSlpHNkZuUjREb3FOTW9nMXc0VUJPWTVVNEl0?=
 =?utf-8?B?WUh2Z3VZVXdMbkp5a0Z6TEF4V05TZDNaaUluVUhtbFdHa29YV3RnbURLcEVG?=
 =?utf-8?B?czFyRXd5d3YrYzlGYXk4YlZFSlZCUEttTjhmNnJoY04zZHVLb2NqanNVazU4?=
 =?utf-8?B?MlVsRWM2QnBOTUtyNE5wY0JuRDN5dlFDQmdNbDBlblBDY0c2WnFCSUMrVUln?=
 =?utf-8?B?UkMxczJ5b3FWbHJUcmlmK08zTWhuUFQrMEsrTitDYkV6enlqZERXQVVjUmpo?=
 =?utf-8?B?NTZxK2pyYURUZ1hkWGZLRkpyZUJrM3BudUtGejBiMnhCMXRsYU92VGY1UE1a?=
 =?utf-8?B?d1B6RjlTeE5nR3lIQStHYWR4emVIRHprU3d4T01RbWh2bFdtQmpxUXVDZUFr?=
 =?utf-8?B?SDdxZG1jWVV5RHMzY3V6U0ErZ014MHVWcFZ0Qm13NG1Kai9lUEYwWXhtM3Zh?=
 =?utf-8?B?M3FQR21POGRZbVJadnNNWGxNMHBpb1Q5YUFRL0pDQnlrOGFuT2Zkd2ZXamVN?=
 =?utf-8?B?Vml3SFZTTjBNUkNnWjY5UG9Nb0ZJNWpZSXE0Q25idnV0RndJM21qSjdzeGl0?=
 =?utf-8?B?L2d0YjlLYjVieTVsMUlka2JKLzNuUGk3dWRGT0dBSWsvdlBUbjkyTlRHN0lS?=
 =?utf-8?B?Ry9Qd25IWUU5S0RuRE44ODhvSTIrVnNnUmx5Yk1CQ0k4UmRPTzVlUE5OL2VQ?=
 =?utf-8?B?OUhiRWpGNnVQQkJrM0Rkc2RURytMYVJYTXBXOTRoZXdmdXBJNXhDTERPZHhJ?=
 =?utf-8?B?ejJ1LytORnNuOXAzNXpkaU5CTE9FcWVUeVVFbDJrODRQZERuR1h5RDR4Mjlv?=
 =?utf-8?B?QWhoWGJWMCtMSDNoOHNDd2NibkdnK0FzNFJKYTdtbzRXK2VoTmp5anhENGc3?=
 =?utf-8?B?VEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d479c1e-3141-459a-c517-08ddb350a9e5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 18:55:18.7753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vVboYr2VpnjpqeWLdXz/+4DhTVNY3Ze6w0RvMcr8O3ZJprlQpPDx2t9se4l8aLYI9kBA/jzozRm0hTWqLATFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7611
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

On Tue, May 27, 2025 at 10:10:00PM +0530, Himal Prasad Ghimiray wrote:
> When prefetch region is DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, prefetch svm
> ranges to preferred location provided by madvise.
> 
> v2 (Matthew Brost)
> - Fix region, devmem_fd usages
> - consult madvise is applicable for other vma's too.
> 

Not strictly related to this patch, but we should also update
xe_bo_placement_for_flags to choose the order in which bo->placement
entries are populated based on the desired placements. We might also
need to call xe_bo_placement_for_flags when setting the preferred
location VMA with the BO in order to reorder bo->placement.

Additionally, prefetching may need to move the BO based on this
preferred location. Lastly, if we find that a BO needs this preference
set before being bound (e.g. at creation time), we may need an extension
to the BO creation IOCTL.

I think, for now, this is probably out of scope, but it’s something we
should keep in mind.

Matt 

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_svm.h |  7 +++++++
>  drivers/gpu/drm/xe/xe_vm.c  | 30 ++++++++++++++++++++----------
>  3 files changed, 38 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 8b6546ebac72..0c929eb192e7 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -822,6 +822,17 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
>  	return NULL;
>  }
>  
> +/**
> + * xe_tile_from_dpagemap - Find xe_tile from drm_pagemap
> + * @dpagemap: pointer to struct drm_pagemap
> + *
> + * Return: Pointer to xe_tile
> + */
> +struct xe_tile *xe_tile_from_dpagemap(struct drm_pagemap *dpagemap)
> +{
> +	return container_of(dpagemap, struct xe_tile, mem.vram.dpagemap);
> +}
> +
>  /**
>   * xe_svm_handle_pagefault() - SVM handle page fault
>   * @vm: The VM.
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 344349313001..a8b5bebf7a54 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -97,6 +97,8 @@ void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end);
>  
>  struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile);
>  
> +struct xe_tile *xe_tile_from_dpagemap(struct drm_pagemap *dpagemap);
> +
>  /**
>   * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>   * @range: SVM range
> @@ -328,6 +330,11 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
>  	return NULL;
>  }
>  
> +static inline
> +struct xe_tile *xe_tile_from_dpagemap(struct drm_pagemap *dpagemap)
> +{
> +	return NULL;
> +}
>  #define xe_svm_assert_in_notifier(...) do {} while (0)
>  #define xe_svm_range_has_dma_mapping(...) false
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e5fc2c2be8b2..4520e475399e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2917,15 +2917,24 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>  	int err = 0;
>  
>  	struct xe_svm_range *svm_range;
> +	struct drm_pagemap *dpagemap;
>  	struct drm_gpusvm_ctx ctx = {};
> -	struct xe_tile *tile;
> +	struct xe_tile *tile = NULL;
>  	unsigned long i;
>  	u32 region;
>  
>  	if (!xe_vma_is_cpu_addr_mirror(vma))
>  		return 0;
>  
> -	region = op->prefetch_range.region;
> +	if (op->prefetch_range.region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {
> +		dpagemap = xe_vma_resolve_pagemap(vma, tile);
> +		if (dpagemap)
> +			tile = xe_tile_from_dpagemap(dpagemap);
> +	} else {
> +		region = op->prefetch_range.region;
> +		if (region)
> +			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
> +	}
>  
>  	ctx.read_only = xe_vma_read_only(vma);
>  	ctx.devmem_possible = devmem_possible;
> @@ -2935,18 +2944,18 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>  
>  	/* TODO: Threading the migration */
>  	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> -		bool needs_vram = xe_svm_range_needs_migrate_to_vram(svm_range, vma, region);
> +		bool needs_vram = xe_svm_range_needs_migrate_to_vram(svm_range, vma, !!tile);
>  
>  		if (!needs_vram) {
>  			xe_svm_range_migrate_to_smem(vm, svm_range);
>  		} else if (needs_vram) {
> -			/* If  migration is mandated by atomic attributes
> -			 * in vma and prefetch region is smem force prefetch
> +			/* If migration is mandated by atomic attributes
> +			 * in vma, and prefetch region is smem, force prefetch
>  			 * in vram of root tile.
>  			 */
> -			region = region ? region : 1;
> +			if (!tile)
> +				tile = xe_device_get_root_tile(vm->xe);
>  
> -			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
>  			err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
>  			if (err) {
>  				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> @@ -3014,7 +3023,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  		else
>  			region = op->prefetch.region;
>  
> -		xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
> +		xe_assert(vm->xe, region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC ||
> +			  region <= ARRAY_SIZE(region_to_mem_type));
>  
>  		err = vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.prefetch.va),
> @@ -3432,8 +3442,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
>  		    XE_IOCTL_DBG(xe, prefetch_region &&
>  				 op != DRM_XE_VM_BIND_OP_PREFETCH) ||
> -		    XE_IOCTL_DBG(xe, !(BIT(prefetch_region) &
> -				       xe->info.mem_region_mask)) ||
> +		    XE_IOCTL_DBG(xe,  (prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
> +				       !(BIT(prefetch_region) & xe->info.mem_region_mask))) ||
>  		    XE_IOCTL_DBG(xe, obj &&
>  				 op == DRM_XE_VM_BIND_OP_UNMAP)) {
>  			err = -EINVAL;
> -- 
> 2.34.1
> 
