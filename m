Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E503CCD199
	for <intel-xe@archiver.kernel.org>; Sat, 18 Oct 2025 02:50:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FEA10E352;
	Sat, 18 Oct 2025 02:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cKCzb4kE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8513410E1DC
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Oct 2025 02:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760755827; x=1792291827;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2UGdQOIvwGLSji0B8G7GTkVqJpsxRd0KkJtJeRoDgBA=;
 b=cKCzb4kEEjI+5kTXw+0JU1H3fwJz3Z2WJd9IoeELUfX0u5sGh/YRQ3i+
 IDlpkK5lRGl3ETvdg13AHGeIITxVMstJl3q/QrNZbj4jwslcNuDZcOcIH
 uXygeWMJ3fmdXbHJeJDZYKEgON+EsAG24sL45AawbM6qRv3NXATW2sOnE
 AnJJ7yucUkKddYOC3upeso8hPGQvusjjSonRB7+95USDcRKSs9rOF1rs1
 tLRaqBBwXg84DVV/VzSHlb6I49kWm+UksuuDAhAALYpjK6pIYqG1pfGy+
 mz0kr33QvvnoK0R/dO1YdzwuyR57xILkEAl0D9rlKKAxHc+0ujzkdt8b5 A==;
X-CSE-ConnectionGUID: jTmTvosrQ7+mzOehgM/86Q==
X-CSE-MsgGUID: em8Snk3NSIORx1omEgqhxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="65586695"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="65586695"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 19:50:23 -0700
X-CSE-ConnectionGUID: xBFAmstATieo/rwvSn/BUQ==
X-CSE-MsgGUID: NaMUUcPqReKvtrmxO7Xhnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="182820066"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 19:50:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 15:45:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 15:45:17 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 15:45:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VSHDlRY03WOScPqdugUiX4pIchzOGdldtVQxzwpwfTBWXkRNWUZzpVqydHvz5Fnf5AnO1Y9GC4q69BflXVuOypfzLk5BMOkzeYfAKA9Ax37fiTx6+KagkqRFToNJqYHJKlFex0CGxLcTO3jC9P5I29Ea9/tffY+fDRffS1HzVK8r/SS3ghubAoQJZ4aNpJR9cIqVeYtzSbb0n9jRR1Pc131vmHxxL0heWxqLR3y7G8A4aOGDQstTioMiV9tFj4tRYsO6MIRCswsJ2notPMKbwQ865Vu9UpIGz4TxnRKdgwGdXlwSILNlLGMsuQKAcEKr16HT1P/G6ZOlVkf4LS9s5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MZv/v/7AfVjEaApyqksStOUyeraBK2Tv8eHtB6nccI=;
 b=flSziv+ZZevIAUMpCwxNEseegG4pUKHfmGA6ri5BrK614cMjFQlTaTIN4ArECKpzK/7FeBIfckuMtAZK2bYQXEuEaGvXDXPAVZcU1vFBDj9mG/ljh0X/xmdT+BYgnMeTCGiToodvLU++1eSOb1Ru32Kc0FiEtTs6w9mK/BRkwcHpdNeNR7aW46feA1uzn4c5QdblZmpFO/WkNVcUh+ro+GEU6l3e3rW/CVO5gx6XSYPuqHdN27ObEdKGDRCSteW2T3uFO5wMrUfxJ0EBn3j4JDVula/dl4UXdXYkqiFJXq2lPyTy266nSMxwuhs1Yw+QPyGgxeICLu5FJgWqgLkFAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB5947.namprd11.prod.outlook.com (2603:10b6:806:23b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 22:45:14 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 22:45:14 +0000
Date: Fri, 17 Oct 2025 15:45:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>, <intel-xe@lists.freedesktop.org>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v7 1/3] drm/xe/migrate: Atomicize CCS copy command setup
Message-ID: <20251017224511.GZ1207432@mdroper-desk1.amr.corp.intel.com>
References: <20251017141226.924-5-satyanarayana.k.v.p@intel.com>
 <20251017141226.924-6-satyanarayana.k.v.p@intel.com>
 <aPJSNo8XM3cpGZCb@intel.com>
 <78cc87ee-6d2d-4a85-9e42-7836b97ea435@intel.com>
 <aPJgP9ShLrvSeXzU@intel.com>
 <34f2d811-6d95-450b-978f-e4fa2d21c986@intel.com>
 <aPJ0I7V4srCj6qo4@intel.com> <aPKJRxvJzdvEZ69f@intel.com>
 <aPLEmxlCHYgcrwbx@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPLEmxlCHYgcrwbx@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB5947:EE_
X-MS-Office365-Filtering-Correlation-Id: b8ebf38e-41c1-43a1-5ad0-08de0dced60c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkhxMjA2VHlIcUVBMG1tT0U0K1ZTSS9ndUd4clkrY3VHQzByUGNaVGJmcktZ?=
 =?utf-8?B?OUFlanBSRW9iMHc5ZVhEbGp3Y01vbzFmU2kzUDJZQ2U4YkZxM1pDanc5Y09M?=
 =?utf-8?B?TzFCbWFCZFl1WC9CODlJS0MrZVdXcW55QW5JS2plMklwS1pMaHVvUVUyN1Bm?=
 =?utf-8?B?NERGd29YZmtGOHVmay9kYndvUDgwblNJanArQ0ZDL2FPK1ZFV0xhU002OU85?=
 =?utf-8?B?bXFrMHB1Z1VWUHpaby9BYlF1VHBkcjA2RnhiQUJRK0laUTE0ZUNGS2RTU2hn?=
 =?utf-8?B?QWl1aHIrWlByZTN0ZVRabnF1aTlLZ2VXeTg1cDZybVZJbVdXRjErQnVDNDh3?=
 =?utf-8?B?Y2FtcjJ3V2VYZnF4VEJNNjhKcEZOVUFxVWJXQ0xucXZWTEM4dFJlZXZUcTkx?=
 =?utf-8?B?M2cxM1pmWWxpaE9CM1lrUFdzbjZJbHFzRmczaExtd2hxdWpHbUpKYmdFZUor?=
 =?utf-8?B?c3U3VzNIVy9TSjZCcFYxQXpvaHQ4T016T0VhOWpqci95d0RRN285dVg5aFNa?=
 =?utf-8?B?eWxDc1hDWDlGenhVeHl4WHhoNWI2RXVIMkR0UWZ5YmpRdE9rakM3N0hQVDlr?=
 =?utf-8?B?MUdRbVNjYVVwM0Z4NVNJN1ZDQVZMK2YzTTJMaHhCMmd5OHd6RklWL3dYdWpv?=
 =?utf-8?B?emo1YTRGMEdDYU1uK0thK2s0SUFadzBYaFBMT2x6Si9KMi9BSkE2ZHZuRUs1?=
 =?utf-8?B?RHhrY2RwMEp3Mk13cGZpRno1UUNwQWRiVzZ2N2w1eEllV21YTjg2QWtUcnBV?=
 =?utf-8?B?ZytIODJ1cWg0VUxuU0p0elZzR3ZJRWlRRHEwazA4eElaU1EzMVBta1ZjZFFm?=
 =?utf-8?B?UlJ2ZFo0UHU5SWpKZkUxU1lDQ3VFV0Q4M1d3aGluUEZkSFpsdEkzZkpnclJQ?=
 =?utf-8?B?bXg0elVzUm4zOE9GT01EbndDV2VGRk8yNThONGE4NFhIQ1FMR2Mrem1ockhQ?=
 =?utf-8?B?ejg3Zk1ncDZSbTE4QUlsNEFjSXpaTXVMckNDRjM1Zm5pcnd4N20xeWN4cnE0?=
 =?utf-8?B?cHJ6MHdwaERYeEZ2UFAwYmVGY21ncnJmZGpNSHZOMUJMMUNOZVJSeWNCYXV2?=
 =?utf-8?B?Q1FPMFJkd2NHVFM2T00wZThmSlMybFRsdEdSWUZxZ29XYmRPelJreHFJTTJO?=
 =?utf-8?B?VG1DaGNjTjRCclgrR0h1aXI4VURyRWdoYldDektlYXBSMkRXcWdicEhnRWZE?=
 =?utf-8?B?cm1CRmRnU1F5UjFXNWhZMHhtVmZZYkxYaVF1Kzd3a21KMG1IbUVDYnYxVzhE?=
 =?utf-8?B?OUkwNzc2S0h2b2tLcGtMUDJMRS9OTnVoUHlxbzZaK0Jia1hRSUtaWTROZkE3?=
 =?utf-8?B?Q2x0TzVOU0Q0ZFpqNDNFaCtNVitYTDdYMlpUZXBXaUJEcjBGRkJYREllemoy?=
 =?utf-8?B?UVVjZk5NdGtVZFE1MlA1NmtIbzVvRVBNMTZvT2NRMHFqL3U0VGJGNjYwZDlw?=
 =?utf-8?B?OVozVTB5dFlDd1pDWVRqZFZQSEE4R0dFdU1hV3N2N1BtTnRUdWFxeEtBZGIy?=
 =?utf-8?B?UktvT0pkeDVvRFFIdk1PdnRVMjB4aUF6OGdzRHlkU1U0czUzV0FxOEMyem9O?=
 =?utf-8?B?dEhvbWRhcFZIRVR6VktlVk5telpibXpkWDJ3aGlNRGl2NytlTVNQbUtpTEl0?=
 =?utf-8?B?bjlQNytRcDkvZEI3ZjJNcDN0WS9jeVU1ZDlqQ3d5V2t6ODFHbDFBMjgrV3JV?=
 =?utf-8?B?ZkdYZHNPcXc2eFZlckhvNDdkWTB2UEFjMWhTOFVieXZuQ2l4WWJKaWxVd25M?=
 =?utf-8?B?ak83S2Z6bnM1Y3JCTnZ1dWdxVytPMWIrL0cwTXEvWGMrQ1hSdk1YR3RQT0ZE?=
 =?utf-8?B?a1Q3dWIvb3VRQWtZbEtnM2MySHljVlEzTWhaVTV6cTgxUTloekwrZUlnS29S?=
 =?utf-8?B?UnZySjRWcEtWbW1oUkZKQSs4NzdHSGRrbExHL0pwRlFvSWJmU0hwQ3FqNk9X?=
 =?utf-8?Q?7hxtFa2wUJkVITwl/BB2fB1MKvhT6VGT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDhzQkJHYzJKelF4MGdpNHFyRGlYdXZpZ21wVE5WNEJ1VzZhSW9VdjNweU9k?=
 =?utf-8?B?WUZ1c2ptR3dGOElJdmdLRUdDbExwRkRIMVlVcUR6ajVveXA2eGhEQnZoNXlU?=
 =?utf-8?B?UnBQamxZbkN2elhsRm5KZ1pUd2NCdm5jR2pZRlQwMGRDcVc1U3F2czExcG0v?=
 =?utf-8?B?TmI4enlvTkFsNDA2VTNYUUxvNGNxZllFemR5eElMRDBUR0NsNmE1U2NBL0w5?=
 =?utf-8?B?VDR2T1M0L2JxM3puRCszUHkwdE9UQ0JOMXRxaEwydFRUZWxqODBqNG0vdmV1?=
 =?utf-8?B?cy9tWmEvT3ZoazEwZWp4TmRzNDd5RElnSktyMnFKM3UzMUpLYm14UitDak1D?=
 =?utf-8?B?SnhxenV3MHl3YlFHb3ZjQ3VtZ3NHN2dhNGVpM1VhNTlpTFg2VDhEMUdQUy9o?=
 =?utf-8?B?UDBZejFvZ3JPTWx3d0xJVWlsWEZtQU9mRS9CYzcvaEYxUkIyVTFFQ1UvRFVy?=
 =?utf-8?B?Z1ErTFRUK2ZFMXh2Y2VSWHFWaTYxc1RXSG9CVFVPVHRocmNZR25uQTRkd3pO?=
 =?utf-8?B?bFBpNXc2QllmakRTbzkvUitEU3VIM242a2xxWEluclByR1ViRVlQNmQzRVhL?=
 =?utf-8?B?Y1J6c05QQzhwbUxoQkxDMTJSMGhPa0pTU3V4RDB0Z09rbFZiZkZkQm53Q29C?=
 =?utf-8?B?dElnZXg3TkRkU01rRFhsc25KcURzM3pjY3BzemNGQWViWE1xL2VtT3VHcTBj?=
 =?utf-8?B?VGt3ZmpTdjFIWnRycE1jVk16ZWZ4U2N6N3pCNWdVaDdwMFh4NkdYTE8ya0hY?=
 =?utf-8?B?Q3FhNE41N1JacVpmUGFLSFBORFNaZ2VHa0wrdmNzdlA1bFFKQXcreWNLS0RU?=
 =?utf-8?B?Q3V3L1p5bVEzbUR2YkNUUFFSUDFmWFVVdHZMdS94TGZSOHAreXBaUEM2OVNi?=
 =?utf-8?B?ZXRrOHg5Y1pHWFZ5eUFabG8vSmNaeXJ2Z3I3SnRtSkVWbWtRUDZpVUdZTVpZ?=
 =?utf-8?B?N1pGZzFaMGVWelpkNHV5MVU2VzYrNGlGWFAxcXBma1ZoenFEOFZ4by9OV0Mz?=
 =?utf-8?B?VzZuZE15clM2UXg2L01YMVk5dytHTmRVamlzeHhMVnV0T3JyS3FKY2lkcjl3?=
 =?utf-8?B?aHk1ampzQmtIdE1kbzYvSVhVaXUrSVYvaXYyK2JLeC9adFRweVBmTnllR201?=
 =?utf-8?B?VTNRdnErUFp5Yk5lbGRoL2ZLRjZRSDZuT21XQ1ZzbjNWWTlscTFSeHlKUmdP?=
 =?utf-8?B?SzJreWovWkNUdUFXdUZhNFBHem1aejg2VjdYTUJrNXJWcUxPY3R0QXdET1hr?=
 =?utf-8?B?cUFSYmNkWkwzRjQwZTBZRSt2UVN4Q210RUVmRlM2QWZ3LzlaNmw4WDI3SGJF?=
 =?utf-8?B?dWROREUrVjVXZG1UYWlBaEZ5aEFqTEwzUlBKelF4SUgrcmtHZUtaa3h1MmtI?=
 =?utf-8?B?ZUYvejA5ODFybTlQd1hONTFPS2VLU3JRRE5ybG5TRzVTNExHYkFSNU9OZGVL?=
 =?utf-8?B?ZWRzMVhxTVJ6bjBBdUVqYkcxY3E3TFIzNTRKaUgwN1lOOFFpT0JZUk54a3dY?=
 =?utf-8?B?SUpUa25TbGIveHN3K0dTYVNPZlZDRzZwTVh5c3lXMERzdmhUNEdDNFkrUVFz?=
 =?utf-8?B?QUpmcUExL2tBZUFFeGUzVzhqa0poSEI1NVczSnZBVWwwTDVCb3hHeGo1bFRk?=
 =?utf-8?B?RjhMTmZZSURDT3BmYnpTTVkxZmJ0MU5UQnExM2xrQ1ZIYTh3ZTRmOVBydHJF?=
 =?utf-8?B?S21aNy9YcFhTNWlzaXFHQ0hlTHdRL0ZrYWk2SDBsRDA2L1FkNWVJdWpRRWk1?=
 =?utf-8?B?Y1JqdHFCSDZKajNRZkZoUjIyTnNmNkF0SzYvcGVEYXQvSk5kUUlWM3VKSHIx?=
 =?utf-8?B?N1VpT1c4R1JSRnpRVGNwVkFadzIzWThGdjEzeURXZHVjaU9YT3dySXJ5SzE1?=
 =?utf-8?B?OVlWZWpuMmR6STJCYUg2VnNta1F4SlZzWDVIa3NGODFBYitzd0J4eitwZURE?=
 =?utf-8?B?ZE1PU29JR1h4SmlvUDdOYUI3SkUwWDQ1QW1DYnZnQks1YmttMjhjYXB0cVNi?=
 =?utf-8?B?d2Z3UkhEVy9YazZpWVkxamphZW9lRGViQ2Rqb2NYa0JsaWloM21PYm43K0FZ?=
 =?utf-8?B?bTRSUk5UWWNTSnNzb0hkSkU0Rk1OeDVDb1ZCM3lUdnFDSlVjb2h2S1RyZzlF?=
 =?utf-8?B?VWFtcWZoTmJDejBwTDZ1VEd2S3R2bUQxRWhyS2M5RVQ3TCs4Vi8xazV2QXBX?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ebf38e-41c1-43a1-5ad0-08de0dced60c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 22:45:14.1150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjlusIM6+nVUEXwDpciROSUvcaXPkli7u0IWP06MQ/LOorGAvxpoKby0Cn8xYwiXbDP9KbgMoG3DYCgvsnctpNNCqJ0VknG+99BROa/SueU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5947
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

On Fri, Oct 17, 2025 at 03:35:07PM -0700, Matthew Brost wrote:
> On Fri, Oct 17, 2025 at 02:21:59PM -0400, Rodrigo Vivi wrote:
> > On Fri, Oct 17, 2025 at 07:51:47PM +0300, Ville Syrjälä wrote:
> > > On Fri, Oct 17, 2025 at 09:59:48PM +0530, K V P, Satyanarayana wrote:
> > > > 
> > > > 
> > > > On 17-10-2025 20:56, Ville Syrjälä wrote:
> > > > > On Fri, Oct 17, 2025 at 08:46:37PM +0530, K V P, Satyanarayana wrote:
> > > > >>
> > > > >>
> > > > >> On 17-10-2025 19:57, Ville Syrjälä wrote:
> > > > >>> On Fri, Oct 17, 2025 at 07:42:28PM +0530, Satyanarayana K V P wrote:
> > > > >>>> The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > > > >>>> save/restore while this sequence is being programmed, partial writes may
> > > > >>>> trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
> > > > >>>> instruction to write the sequence atomically.
> > > > >>>
> > > > >>> If this whole thing is so racy why don't you always add a new
> > > > >>> BB_END after new commands, and only replace the previous BB_END
> > > > >>> with NOOP _after_ the new commands have been fully written?
> > > > >>>
> > > > >> We maintain a suballocator for batch buffer management, with size
> > > > >> proportional to system memory (e.g., 16MB suballocator for 8GB SMEM).
> > > > >> Batch buffers are dynamically allocated from this pool based on the
> > > > >> number of active workloads. The entire suballocator region is submitted
> > > > >> to hardware for CCS metadata copy operations.
> > > > >>
> > > > >> We cannot insert BB_END commands after each individual instruction
> > > > >> sequence because additional GPU instructions may be appended later.
> > > > > 
> > > > > You *overwrite* the previous BB_END after the new commands have been
> > > > > appended.
> > > > We do not know where the new BB allocation will be. It may not be 
> > > > sequential and every BO has a BB. BBs are allocated and freed so often 
> > > > based on BOs getting created and destroyed. So, we can't use that approach.
> > > 
> > > Hmm, could perhaps use second level batches then. Each BO would gets
> > > its own second level batch, and the first level would just call them
> > > in sequence. Or is this already running as a second level batch?
> > 
> > This I'm not sure...
> > 
> 
> Embarrassingly, I’m not exactly sure what “second-level batch” means.

That's just referring to batchbuffer nesting.  MI_BATCH_BUFFER_START can
be executed within a batchbuffer to jump off to a 2nd level (or deeper)
batchbuffer.  When the nested batch buffer hits MI_BATCH_BUFFER_END,
execution will return to the spot in the first batchbuffer where it left
off:

  - <in ring>
  - MI_BATCH_BUFFER_START    --> start executing first-level batch
     - MI_BATCH_BUFFER_START --> start executing second-level batch
     - MI_BATCH_BUFFER_END   --> return to first level batch
  - MI_BATCH_BUFFER_END      --> return to ring

I believe current hardware allows up to three levels of nesting, older
hardware allowed less (and early hardware didn't support nesting at
all).  If you do a MI_BATCH_BUFFER_START in the highest level possible
on your platform, then it's treated like a 'goto' (i.e., the next
MI_BATCH_BUFFER_END won't return to the current batch, but rather to the
parent's batch).

There used to be an option MI_MODE that disabled nested batchbuffers
completely; I think we set that in i915 (see
fakewa_disable_nestedbb_mode()).


Matt

> What I can tell is that this is a batch buffer (BB) executed from a
> single BB start command in the ring.
> 
> > Matt, do you know?
> > 
> 
> I actually thought about this, and I believe it could be made to work.
> However, we would need two BOs and suballocators. The first BO would
> contain only jump-to-second-level batch instructions, while the second
> BO would contain the CCS copy commands. Even in this mode, the
> jump-to-second-level batch instruction would have to be written using
> AVX instructions. Maybe this approach is better, but it would also
> require a significantly larger rewrite.
> 
> > > 
> > > It might also be getting a bit complicated I guess, but at least it
> > > wouldn't have all obvious problems of the SIMD stuff:
> > > - looks like it will explode on non-AVX capable x86
> > > - will be broken on other arches until someone implements the equivalent
> > >   code (assuming the arch has such an atomic copy instruction
> > >   and supports in kernel SIMD stuff sufficiently to use it)
> > 
> > This is Pantherlake only. And the reason why I asked to add a
> > check with error/warn for IS_DGFX()...
> > 
> > which by the way is an assert... I still don't believe it is enough.
> > I believe a return with warn_on seems more appropriate to really
> > never try to run that code in case of a big future mistake.
> > 
> 
> We don’t have an issue here since this is an iGPU—for now. Let’s hope
> that a future dGPU doesn’t consider a solution like this a good idea for
> anything, as this PTL approach is questionable at best. A big WARN_ON
> with a return is probably not a bad idea.
> 
> Matt
> 
> > > 
> > > > 
> > > > -Satya.>
> > > > >> Instead, a single BB_END marker is placed at the suballocator's end to
> > > > >> terminate execution.
> > > > >>
> > > > >> This patch ensures race-condition-safe CCS metadata save/restore
> > > > >> operations by guaranteeing atomic writes to the batch buffer, preventing
> > > > >> corruption regardless of when save/restore operations are triggered.
> > > > >>
> > > > >> -Satya.>>
> > > > >>>> Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
> > > > >>>> 8 dwords instead of 5 dwords.
> > > > >>>>
> > > > >>>> Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
> > > > >>>> chunks.
> > > > >>>>
> > > > >>>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > > >>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > >>>> Cc: Matthew Brost <matthew.brost@intel.com>
> > > > >>>> Cc: Matthew Auld <matthew.auld@intel.com>
> > > > >>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > >>>> Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > >>>>
> > > > >>>> ---
> > > > >>>> V6 -> V7:
> > > > >>>> - Added description explaining why to use assembly instructions for
> > > > >>>> atomicity.
> > > > >>>> - Assert if DGFX tries to use memcpy_vmovdqu(). (Rodrigo)
> > > > >>>> - Include <asm/cpufeature.h> though checkpatch complains. With
> > > > >>>> <linux/cpufeature.h> KUnit is throwing errors.
> > > > >>>>
> > > > >>>> V5 -> V6:
> > > > >>>> - Fixed review comments (Rodrigo)
> > > > >>>>
> > > > >>>> V4 -> V5:
> > > > >>>> - Fixed review comments. (Matt B)
> > > > >>>>
> > > > >>>> V3 -> V4:
> > > > >>>> - Fixed review comments. (Wajdeczko)
> > > > >>>> - Fix issues reported by patchworks.
> > > > >>>>
> > > > >>>> V2 -> V3:
> > > > >>>> - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
> > > > >>>> - Updated emit_flush_invalidate() to use vmovdqu instruction.
> > > > >>>>
> > > > >>>> V1 -> V2:
> > > > >>>> - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
> > > > >>>>     (Auld, Matthew)
> > > > >>>>     - Fix issues reported by patchworks.
> > > > >>>> ---
> > > > >>>>    drivers/gpu/drm/xe/xe_migrate.c | 112 ++++++++++++++++++++++++++------
> > > > >>>>    1 file changed, 91 insertions(+), 21 deletions(-)
> > > > >>>>
> > > > >>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > > >>>> index 3112c966c67d..e0be7396a0ab 100644
> > > > >>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > >>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > >>>> @@ -5,6 +5,8 @@
> > > > >>>>    
> > > > >>>>    #include "xe_migrate.h"
> > > > >>>>    
> > > > >>>> +#include <asm/fpu/api.h>
> > > > >>>> +#include <asm/cpufeature.h>
> > > > >>>>    #include <linux/bitfield.h>
> > > > >>>>    #include <linux/sizes.h>
> > > > >>>>    
> > > > >>>> @@ -33,6 +35,7 @@
> > > > >>>>    #include "xe_res_cursor.h"
> > > > >>>>    #include "xe_sa.h"
> > > > >>>>    #include "xe_sched_job.h"
> > > > >>>> +#include "xe_sriov_vf_ccs.h"
> > > > >>>>    #include "xe_sync.h"
> > > > >>>>    #include "xe_trace_bo.h"
> > > > >>>>    #include "xe_validation.h"
> > > > >>>> @@ -657,18 +660,68 @@ static void emit_pte(struct xe_migrate *m,
> > > > >>>>    	}
> > > > >>>>    }
> > > > >>>>    
> > > > >>>> -#define EMIT_COPY_CCS_DW 5
> > > > >>>> +/*
> > > > >>>> + * VF KMD registers two specialized LRCs with the GuC to handle save/restore
> > > > >>>> + * operations for CCS metadata on IGPU. The GuC executes these LRCAs during
> > > > >>>> + * VF state/restore operations.
> > > > >>>> + *
> > > > >>>> + * Each LRC contains a batch buffer pool that GuC submits to hardware during
> > > > >>>> + * VF state save/restore operations. Since these operations can occur
> > > > >>>> + * asynchronously at any time, we must ensure GPU instructions in the batch
> > > > >>>> + * buffer are written atomically to prevent corruption from incomplete writes.
> > > > >>>> + *
> > > > >>>> + * To guarantee atomic instruction writes, we use x86 SIMD instructions
> > > > >>>> + * (128-bit XMM and 256-bit YMM) within kernel_fpu_begin()/kernel_fpu_end()
> > > > >>>> + * sections. This prevents vCPU preemption during instruction generation,
> > > > >>>> + * ensuring complete GPU commands are written to the batch buffer.
> > > > >>>> + */
> > > > >>>> +
> > > > >>>> +static void memcpy_vmovdqu(struct xe_device *xe, void *dst, const void *src, u32 size)
> > > > >>>> +{
> > > > >>>> +	xe_assert(xe, !IS_DGFX(xe));
> > > > >>>> +#ifdef CONFIG_X86
> > > > >>>> +	kernel_fpu_begin();
> > > > >>>> +	if (size == SZ_128) {
> > > > >>>> +		asm("vmovdqu (%0), %%xmm0\n"
> > > > >>>> +		    "vmovups %%xmm0,   (%1)\n"
> > > > >>>> +		    :: "r" (src), "r" (dst) : "memory");
> > > > >>>> +	} else if (size == SZ_256) {
> > > > >>>> +		asm("vmovdqu (%0), %%ymm0\n"
> > > > >>>> +		    "vmovups %%ymm0,   (%1)\n"
> > > > >>>> +		    :: "r" (src), "r" (dst) : "memory");
> > > > >>>> +	}
> > > > >>>> +	kernel_fpu_end();
> > > > >>>> +#endif
> > > > >>>> +}
> > > > >>>> +
> > > > >>>> +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
> > > > >>>> +{
> > > > >>>> +	u32 instr_size = size * BITS_PER_BYTE;
> > > > >>>> +
> > > > >>>> +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
> > > > >>>> +
> > > > >>>> +	if (IS_VF_CCS_READY(gt_to_xe(gt))) {
> > > > >>>> +		xe_gt_assert(gt, static_cpu_has(X86_FEATURE_AVX));
> > > > >>>> +		memcpy_vmovdqu(gt_to_xe(gt), dst, src, instr_size);
> > > > >>>> +	} else {
> > > > >>>> +		memcpy(dst, src, size);
> > > > >>>> +	}
> > > > >>>> +}
> > > > >>>> +
> > > > >>>> +#define EMIT_COPY_CCS_DW 8
> > > > >>>>    static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > > >>>>    			  u64 dst_ofs, bool dst_is_indirect,
> > > > >>>>    			  u64 src_ofs, bool src_is_indirect,
> > > > >>>>    			  u32 size)
> > > > >>>>    {
> > > > >>>> +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
> > > > >>>>    	struct xe_device *xe = gt_to_xe(gt);
> > > > >>>>    	u32 *cs = bb->cs + bb->len;
> > > > >>>>    	u32 num_ccs_blks;
> > > > >>>>    	u32 num_pages;
> > > > >>>>    	u32 ccs_copy_size;
> > > > >>>>    	u32 mocs;
> > > > >>>> +	u32 i = 0;
> > > > >>>>    
> > > > >>>>    	if (GRAPHICS_VERx100(xe) >= 2000) {
> > > > >>>>    		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > > > >>>> @@ -686,15 +739,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > > >>>>    		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
> > > > >>>>    	}
> > > > >>>>    
> > > > >>>> -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> > > > >>>> -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > > >>>> -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > > >>>> -		ccs_copy_size;
> > > > >>>> -	*cs++ = lower_32_bits(src_ofs);
> > > > >>>> -	*cs++ = upper_32_bits(src_ofs) | mocs;
> > > > >>>> -	*cs++ = lower_32_bits(dst_ofs);
> > > > >>>> -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> > > > >>>> +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> > > > >>>> +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > > >>>> +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > > >>>> +		  ccs_copy_size;
> > > > >>>> +	dw[i++] = lower_32_bits(src_ofs);
> > > > >>>> +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> > > > >>>> +	dw[i++] = lower_32_bits(dst_ofs);
> > > > >>>> +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
> > > > >>>>    
> > > > >>>> +	/*
> > > > >>>> +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > > > >>>> +	 * save/restore while this sequence is being issued, partial writes may trigger
> > > > >>>> +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> > > > >>>> +	 * write the sequence atomically.
> > > > >>>> +	 */
> > > > >>>> +	emit_atomic(gt, cs, dw, sizeof(dw));
> > > > >>>> +	cs += EMIT_COPY_CCS_DW;
> > > > >>>>    	bb->len = cs - bb->cs;
> > > > >>>>    }
> > > > >>>>    
> > > > >>>> @@ -1006,18 +1067,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
> > > > >>>>    	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
> > > > >>>>    }
> > > > >>>>    
> > > > >>>> -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
> > > > >>>> +/*
> > > > >>>> + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
> > > > >>>> + * save/restore while this sequence is being issued, partial writes may
> > > > >>>> + * trigger page faults when saving iGPU CCS metadata. Use
> > > > >>>> + * emit_atomic() to write the sequence atomically.
> > > > >>>> + */
> > > > >>>> +#define EMIT_FLUSH_INVALIDATE_DW 4
> > > > >>>> +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
> > > > >>>>    {
> > > > >>>>    	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
> > > > >>>> +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
> > > > >>>> +
> > > > >>>> +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > > >>>> +		      MI_FLUSH_IMM_DW | flags;
> > > > >>>> +	dw[j++] = lower_32_bits(addr);
> > > > >>>> +	dw[j++] = upper_32_bits(addr);
> > > > >>>> +	dw[j++] = MI_NOOP;
> > > > >>>>    
> > > > >>>> -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > > >>>> -		  MI_FLUSH_IMM_DW | flags;
> > > > >>>> -	dw[i++] = lower_32_bits(addr);
> > > > >>>> -	dw[i++] = upper_32_bits(addr);
> > > > >>>> -	dw[i++] = MI_NOOP;
> > > > >>>> -	dw[i++] = MI_NOOP;
> > > > >>>> +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
> > > > >>>>    
> > > > >>>> -	return i;
> > > > >>>> +	return i + j;
> > > > >>>>    }
> > > > >>>>    
> > > > >>>>    /**
> > > > >>>> @@ -1062,7 +1132,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > > >>>>    	/* Calculate Batch buffer size */
> > > > >>>>    	batch_size = 0;
> > > > >>>>    	while (size) {
> > > > >>>> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > > >>>> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > > > >>>>    		u64 ccs_ofs, ccs_size;
> > > > >>>>    		u32 ccs_pt;
> > > > >>>>    
> > > > >>>> @@ -1103,7 +1173,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > > >>>>    	 * sizes here again before copy command is emitted.
> > > > >>>>    	 */
> > > > >>>>    	while (size) {
> > > > >>>> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > > >>>> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > > > >>>>    		u32 flush_flags = 0;
> > > > >>>>    		u64 ccs_ofs, ccs_size;
> > > > >>>>    		u32 ccs_pt;
> > > > >>>> @@ -1126,11 +1196,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > > >>>>    
> > > > >>>>    		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> > > > >>>>    
> > > > >>>> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > > >>>> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > > > >>>>    		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> > > > >>>>    						  src_L0_ofs, dst_is_pltt,
> > > > >>>>    						  src_L0, ccs_ofs, true);
> > > > >>>> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > > >>>> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > > > >>>>    
> > > > >>>>    		size -= src_L0;
> > > > >>>>    	}
> > > > >>>> -- 
> > > > >>>> 2.51.0
> > > > >>>
> > > > > 
> > > 
> > > -- 
> > > Ville Syrjälä
> > > Intel

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
