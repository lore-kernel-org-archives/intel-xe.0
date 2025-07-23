Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C280C83F1A
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 23:19:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4A910E013;
	Wed, 23 Jul 2025 23:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hb9wNGwE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AC110E013
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 23:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753312764; x=1784848764;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VhBZ71IWeEm8GHv6TeQmmaqiaIOEWCanbThDK0dllXg=;
 b=Hb9wNGwEEn1ywiUChK/pnXrqxfaQwg7Zln9tvWh3qijXgVRXhx1yVwAc
 7FixjJh1QHkkbQnps93qkQ+oqZYkzwn7jo6t5UP1ISd8yGGEbh27d8lva
 8MztiylIgxAFNpUXcZaHHDsJvaEsq1Z+Snp7Y2ignE0TtbG3qzqKRWyC2
 uUT7qUmsCAz9Z7YHHpIs0qinwknseP1MOi/kKkbDDZpj2/z6O2iZd5tVS
 YUYWGwfx4Y2cjoxZlZxng16f8Z/YxL8Ju3bgWgXU8JfL/G2+rBiT/MWdw
 HirmAtTc1TKd9+my4sEpJ9+ry/q2ywPup2Z3WZWcLOsgQTiTTpQ/u0G8G Q==;
X-CSE-ConnectionGUID: c+Yu29FtS2mTzvXa6RUPsQ==
X-CSE-MsgGUID: 4NUzhBKpT22y2g9Nk/7Udg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55760781"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="55760781"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 16:19:23 -0700
X-CSE-ConnectionGUID: dLyARZWYSSOCH1aLFaKiGQ==
X-CSE-MsgGUID: /VwlzC3JSJuOEEkgtytczg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="159828084"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 16:19:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 16:19:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 16:19:22 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 23 Jul 2025 16:19:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQAZg9cIbUqdlEAn02+GeMnLuptXfPFKkLMKBNAOOVI0VTFdfwN+5IF/n+cBnubDEI05sk4l0tsfVOMJoUZ+7lDEk8gZa3La0Yhs1WAFuJ0UpsFt/ty/xSAP5wRWk8mjkVlakTEWprWbt0kwPdEP++Y+/Q4/LoSOC6wWTXctZOF9lUUvdDt0E1oZrBRu2KDtGlcvCbSb2FBr8VHjLlaEvZMYZKBUsn2fUwka8nzPvdEhTSUCnqryrovqto3pK8LatSNTQmYhjLmXyzbVqtIXKFG9WJ2oVFfdSCwnDn+NLAla1sKjQQQdqTO+1wQkepvUpC3ivRL5k7ugSuIchqX6/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpy2AgJ5GKKk1Nk7Kk3F6cyUxGQSCevLsTrB76Ry2EY=;
 b=JaLYEBWhMUIxfMO5JjGL6S/6+Fq74E5DgTF5XIP8vk5j55W58B1l9bsYxxUPNJzPd8lksBetQtJTc3BMcua2YJtJXY++Dlj76KDL2Z4vDooIlEFqMC90PiHre5lHSGcYDga7A/vNflvxMIyBr9dU7aBxlmvFTcKR8XHtb7iYAEM+eP3p8qgc468EBmBK1O7Sr9knxROMxDBqurvRPtjAj+GzAlaWKPam2DfE9AITrqiZBn6uAc50Kxwc0u3dzHRclrfcT6gu61lmYpLyEDq51LVRVwxKW5/iZf+EUIrPusM5wmQnJJni/VOG93tu72PB0qHG4J4Iudok0p7MPeJgkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB9232.namprd11.prod.outlook.com (2603:10b6:208:56e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Wed, 23 Jul
 2025 23:19:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 23:19:18 +0000
Date: Wed, 23 Jul 2025 16:21:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Kassabri, Farah" <farah.kassabri@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>
Subject: Re: [PATCH 5/5] drm/xe: Split TLB invalidation code in frontend and
 backend
Message-ID: <aIFuYQ0BJgDoF/md@lstrano-desk.jf.intel.com>
References: <20250723182222.48423-1-stuart.summers@intel.com>
 <20250723182222.48423-6-stuart.summers@intel.com>
 <aIE1XbbGohxwvI5F@lstrano-desk.jf.intel.com>
 <aIFDe7w41uKnayGO@lstrano-desk.jf.intel.com>
 <dafc298f5f296f6d653f526fa58592aacd482caa.camel@intel.com>
 <aIFKfcST9legrQiO@lstrano-desk.jf.intel.com>
 <671fc5f3d5f61c50bc0a1df1ac7452f72bf5cec3.camel@intel.com>
 <aIFSeYFxE50ksYvx@lstrano-desk.jf.intel.com>
 <e0007dcf2b16d287c238cb1a56b0be50b8307b2d.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0007dcf2b16d287c238cb1a56b0be50b8307b2d.camel@intel.com>
X-ClientProxiedBy: MW2PR16CA0052.namprd16.prod.outlook.com
 (2603:10b6:907:1::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB9232:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ce5aad3-6b1c-46d8-b26d-08ddca3f5931
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y29lNTVvNWNXOXI3OUdmWVdnUGUveDE3Zis5U3MxM0VNNnhTaDZhcGVGL1hQ?=
 =?utf-8?B?T0FoMUpBN2tHMkNvZ2RSMnNlSWdsNmJUc0JRNmNZMHlMaDdrSlR0Z1VaRmN3?=
 =?utf-8?B?UGozUEdmNWtJTnlwQzRDVll2VFdMSm5wOVpVQWI3eklvdjBPSnhHTTRTbWFU?=
 =?utf-8?B?aitFdEJUNFYrNGdsdllYS1pxeGN4VW1qMmNQaVFaRkhyNC9kUEgvM1BBajgw?=
 =?utf-8?B?SjRqVElGMlFaNzN3dHFiaDhEZ1N1Wkxidk9PeStaMG1zdzBlN3Q0R3VNZjBO?=
 =?utf-8?B?a2FpS2kwTGFtb3ZMbkRjVHNSaWNjNzZRT3ZLclFiZ2t3b3hTTW03WkJXazNS?=
 =?utf-8?B?SXl2Q1Vxam4rdzVMK0JocHdNSXVRb0sxeGpXOG44UkhhUWdRSjk1Ky9QWTdP?=
 =?utf-8?B?N0wvakl5dDM4L3lHQnNuTi9aSEhzZzJQR3pPVmYzWDkvVWU1VHkvMDg2dkZH?=
 =?utf-8?B?VWh5b3hZNWppd1h1a2p6RzFmSjB3V0tRRytZUkdpSTQ2SDdNNFRhbnJFazF3?=
 =?utf-8?B?eE9hQnhiOTlRbXVTcnAwVXM5M2xiWUhLTW9jZ0gzNWVxakI2Y3B5TEFuR3ZS?=
 =?utf-8?B?QTdxeXAvUVhyS05QMFVJM3Iwdm9IRlg3RTdvSzFTUzhBM3BZckxhdTROVkpZ?=
 =?utf-8?B?OWxDSXU4TlQyelZEblJrVlNsbkwwQzgyZUJ0eUhXK0JUbUZUMFNVTSs0OUFH?=
 =?utf-8?B?WDR5TDAvaUVUYU1wTG1BUWVVdFdEeUZKaHU5aVo2L0M5YTBOVVRTdGhLOGtX?=
 =?utf-8?B?TTE2Q0F0aDlQVlNwcm04TjRPR25scHFMbnl2bmZmN2wvdXFybXhxcVVnT1Nk?=
 =?utf-8?B?YjhjTWtndUFFUytRVThmS3ZqNS9YalVMRDNuVVVyWFZUSHJ2a0l2WTZjY2k3?=
 =?utf-8?B?YWhCc3h3MFpRc2ZQRDB3Qm1mb29yUHM3YUFNUWE4ZnRiTG00a0crbXdjOTRk?=
 =?utf-8?B?UlJFV1dhUmlkMEttQXZSZ1UwQkRwdC9obWFlMy9MSE1kc0FlOU9MOURsV2JF?=
 =?utf-8?B?cEJmYW0xR3ZVTE1wcGNFL3FRdGFKa0V6NTc3VUl0ZDVFeWtBM2M0bDFicEx3?=
 =?utf-8?B?L01ob080ZnBYSVBUWVFBNXloU0xuWFlicnlBQjgvak13Smx5TlhodzJwdUxl?=
 =?utf-8?B?bG55RC9rM2xVdWM1TGNILzlRd0VQeVJ2WmkxMkc2WjZxZUZ0YTNMc3M0UU5S?=
 =?utf-8?B?ZnNjZWI4MXY0UU1Ta09meDdmakptOEkyVjdBVjRjamxrTmVSZUNBVmJmeEVB?=
 =?utf-8?B?emJ5VDVBTnplMmhsbmh5RDJjSzlyODdaQTY5SEkwb2NOTGhRU0JhTWxjS2lo?=
 =?utf-8?B?YjRKdXY0Wi85SmV6MVVjN2haWjJpMmx1bU9tbG9NeVdWWjVrSjA5dnRWTHlL?=
 =?utf-8?B?VWw3OW0xMzdVcEg0Tm95VHFBYTJUa2hZZ2lYM0QyNW9pT1o2elE3S2VtZXFV?=
 =?utf-8?B?NnhEQkJPS0hhUVNrM29FWHZsU1MzRTZjckxubGQvUzFpcmFGZ293OW9VQVkx?=
 =?utf-8?B?bldiSlhsN0t0c0JEOUNBK3lqY3hCd1ZTalZWTkYvUmY0NUk1VjJsQ2o4Uita?=
 =?utf-8?B?QkhJMkY4eVV1ODNVQnVoanBxQndkUTUxYndUNzdsaHRZU2RkQXFRK05XZW9j?=
 =?utf-8?B?WmtOVVZWMUZUeDk2YWhzVUNVVmdnOWpXSFFsSm8veUdraHVBYkVTMFVVYzhK?=
 =?utf-8?B?cTAyMFlhcGVubWhFcEhQUTdTNU5sSE95bzZjK1VyOHY3QXp5U29iaXJXcmJH?=
 =?utf-8?B?Mk00VGRvZkY1bHMrWVJOWEJleVlEVTVvWFZrZU1QQmlWWlNCSmJGaFFaU0h4?=
 =?utf-8?B?VWRTQnIzelVVNE01aEVmNFZWK1J3N1Z1NnNWWVQ5YzZzSkllbzdtb203Y2hD?=
 =?utf-8?B?eTcvbjhsbDRsOElDRHI5bWU5VEhCT2Z4YnJjWnJGNGRaMzQ1RU0vS3BHdlhC?=
 =?utf-8?Q?qtdARCyuN0A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3hXckxNTk5HdVphNlRybURILzc5YW1sRWh0RTV0S2Q1bC9wTWMvek5GdFEy?=
 =?utf-8?B?VXRPWTFZczBzamhzdW9OZWVaSko2a1hmVUk4VyttSUxqcjVtOXJxWGtWWEgv?=
 =?utf-8?B?ejVFSXk1UHBlcXdJUmsrSkMzaUEwL240QTFjbWxlbW9qMFNvZldvVFh1cXRT?=
 =?utf-8?B?S1J1ZzdMQnVrTnNybzFXYjBqZkZMRDYzcXByVldJLytSUXZLTUN4bXZKc1Nm?=
 =?utf-8?B?SWxLYkVyV3gwQ25GeEtoek4xYzNKc1c3OEhDc2dUZTh5NlVyVFh4Mm9CZ0ZM?=
 =?utf-8?B?L3EzdVdpVExaRlRUZGRYZ01wbzZZRUxybi9hcXdzQk5hRVNNeVJ4NWhMbzY5?=
 =?utf-8?B?SjBZci9XU0RXNGV4aUtxWmo5MmUwTVFmKzJrV2M4N1Q5Z3NoanR1YWNnNGdj?=
 =?utf-8?B?aFdMYVQ3ZEs2SGhWaVpxcXRtNEt1RThXTXgwZXRZZnBjanE0em13QVpoUHVC?=
 =?utf-8?B?ZjhHc0VMK3liY1kxWStpcjl6NW9SdzZFVHBaUExHSTZyWm96cUh4UWxVZXpa?=
 =?utf-8?B?MzRRTytuNElJR0hjOExqc2xOOEc1WDZrY1BwL1NDbE1xL2tWMjFTeUtOT0Z4?=
 =?utf-8?B?ZXZLWlJzY0xJUkF3eWRmQXRqR3F0K0l1ZmdWU1E2YUVTSUNwUG9xWGFwcWE1?=
 =?utf-8?B?VVJLMEFHdnlSekJMSmFuQzVXcmFSYnA5enpsd2FjR0Z0VENTNlhVTVJKdFpk?=
 =?utf-8?B?RW0zVVhUczlTV1NaMEJ2RlV2M2xnM3lKVHFhY2Q3UVBCWlBPcjNJamluUERV?=
 =?utf-8?B?SHU3cCtWNTNiNlZoUk5jYld3UHJ1L2VGdHpjS3I1QnYyRExiOTd5dnc0dE9w?=
 =?utf-8?B?WnB0TGxvbEV3ZEZsODU5aE9MMCtJc3RCWTA5WS9EbmQ2R0hzTXRMNGR2UVZS?=
 =?utf-8?B?TTM0T2lpaFR2UHdEdE1TSTNrNGJtL3FvQTRFUC84NFdHQUxnekNzdXV2RFlF?=
 =?utf-8?B?UVV5VURCR2JJL3hnUEtVOWJ1YkRPT0hiaXNDSEJaRlhQTkQwbmJ0VXBzc1VU?=
 =?utf-8?B?Y1FEdFo2andzdm5vcUJjY3g2OFg1V1MyTVA1T3dJNFJDVENvV0MyYXhJdDBx?=
 =?utf-8?B?ZUdmWWRjVHRkdEtmanlnWG1wczBHWWI4MFdmeWlvWFUzWFV6elA4ajFqVlJD?=
 =?utf-8?B?T1E0aVV0RnlEOXNhTEtDS011bjRPN1d1MXlSRjBSdUlkOUhHN3c4N3NOa3p1?=
 =?utf-8?B?N3JDM05tdnQxYmVGTkpBUGFsRWE1dExnTnNqc0REWGo3cXRKaHFkTi9EajFr?=
 =?utf-8?B?bFpsby9OWXF1dVNNak1PbVV0TlNrd0M3REtlb0tEY0hKaEtqK3ZMZjFRek9z?=
 =?utf-8?B?Zmh5OHd4RDlQSEo1bkNseWJDRDZ0dHgyQVFqTE11bjh6ZWZpTjRLbFFxOUQz?=
 =?utf-8?B?NEFyVHY2c2pzbW5yZmJ2YXVkUFluWXhJVWR2QkZuT2lFMnczNXBDWlpIenQ5?=
 =?utf-8?B?YjR0dlFZamRVK1dGcEJUS09RWWhPOTZKdTh2U1FWcTU3MzRYVzI4TWNnSG1Q?=
 =?utf-8?B?UklsNytadmhzd3hPaCtxcTBSa1NlYWszMldPazdQTFBiR2ozU1hrbGlRVkNo?=
 =?utf-8?B?L2RIL0xTRURCS2pEd00wQ3VjOHZKQXo2RW0yTWxPMitqNUlTb1VQQ3lhelRk?=
 =?utf-8?B?ZUpjR0Njd0YreGhwbVI5MkhXSmpseE9EbUxnSTd6ZzZTZHVKWnUwVXlhYjJU?=
 =?utf-8?B?dTJzR0w5UjJuWFFWWnY0OGEzbHJHTHo4SEFqUkljVTZzTnBSbmg5MFVvdWRL?=
 =?utf-8?B?R0F2VVRMaFJsQkdMcThRY1EvbUVKU1RwVjlFVE0yWXVaMlNaOUNHeC9vdjM1?=
 =?utf-8?B?bGtzWm5GSE5vdkRNaCtHekNCb0pWa3JQVG0rd2E0OE84RFEvYzR6MFVTQjRn?=
 =?utf-8?B?ck9ib0JiSVlIRE9DN04vZUg4djVoTHpxUHdST1J0TmpIV2g2VVpwbTE5TXpQ?=
 =?utf-8?B?SlVEOFQxejBHZlBoN1g1OHNKVHZMaWY2MndlWVlkWHo1VkxKTUxPMDF3cTR0?=
 =?utf-8?B?VmU4ZFNsdkJyWlkxUkpMeENqbkkrRUZYV3FkUTQvZ3hDakNscm9QWStaNlFY?=
 =?utf-8?B?dks5VlJ1UnEvRTBXbW0zUytQd2xjYUVHRDdGUjRKMGl0dkpiZ3NjQUQ0V2lt?=
 =?utf-8?B?REhVWFJyV2FOMmtNZk9xdC9JcGZwN3hWZmRRQUFXWEVGdHJaTzI1OUpDbUo3?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce5aad3-6b1c-46d8-b26d-08ddca3f5931
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 23:19:18.6701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wtlz3PPFaGB4DMBPdovQXFf+z8NDw3I7+klGWH2NsFFTtckj4CvaaBXQsP6LeuTXQUkYncsZ/1A5bp/2yCySsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9232
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

On Wed, Jul 23, 2025 at 04:03:12PM -0600, Summers, Stuart wrote:
> On Wed, 2025-07-23 at 14:22 -0700, Matthew Brost wrote:
> > On Wed, Jul 23, 2025 at 02:55:24PM -0600, Summers, Stuart wrote:
> > > On Wed, 2025-07-23 at 13:47 -0700, Matthew Brost wrote:
> > > > 
> > > 
> > > <cut>
> > > (just to reduce the noise in the rest of the patch here for now...)
> > > 
> > > > > > > >  
> > > > > > > >  /**
> > > > > > > > - * xe_tlb_inval_reset - Initialize TLB invalidation
> > > > > > > > reset
> > > > > > > > + * xe_tlb_inval_reset() - TLB invalidation reset
> > > > > > > >   * @tlb_inval: TLB invalidation client
> > > > > > > >   *
> > > > > > > >   * Signal any pending invalidation fences, should be
> > > > > > > > called
> > > > > > > > during a GT reset
> > > > > > > >   */
> > > > > > > >  void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval)
> > > > > > > >  {
> > > > > > > > -       struct xe_gt *gt = tlb_inval->private;
> > > > > > > >         struct xe_tlb_inval_fence *fence, *next;
> > > > > > > >         int pending_seqno;
> > > > > > > >  
> > > > > > > >         /*
> > > > > > > > -        * we can get here before the CTs are even
> > > > > > > > initialized if
> > > > > > > > we're wedging
> > > > > > > > -        * very early, in which case there are not going
> > > > > > > > to
> > > > > > > > be
> > > > > > > > any pending
> > > > > > > > -        * fences so we can bail immediately.
> > > > > > > > +        * we can get here before the backends are even
> > > > > > > > initialized if we're
> > > > > > > > +        * wedging very early, in which case there are
> > > > > > > > not
> > > > > > > > going
> > > > > > > > to be any
> > > > > > > > +        * pendind fences so we can bail immediately.
> > > > > > > >          */
> > > > > > > > -       if (!xe_guc_ct_initialized(&gt->uc.guc.ct))
> > > > > > > > +       if (!tlb_inval->ops->initialized(tlb_inval))
> > > > > > > >                 return;
> > > > > > > >  
> > > > > > > >         /*
> > > > > > > > -        * CT channel is already disabled at this point.
> > > > > > > > No
> > > > > > > > new
> > > > > > > > TLB requests can
> > > > > > > > +        * Backend is already disabled at this point. No
> > > > > > > > new
> > > > > > > > TLB
> > > > > > > > requests can
> > > > > > > >          * appear.
> > > > > > > >          */
> > > > > > > >  
> > > > > > > > -       mutex_lock(&gt->uc.guc.ct.lock);
> > > > > > > > -       spin_lock_irq(&gt->tlb_inval.pending_lock);
> > > > > > > > -       cancel_delayed_work(&gt->tlb_inval.fence_tdr);
> > > > > > > > +       tlb_inval->ops->lock(tlb_inval);
> > > > > > > 
> > > > > > > I think you want a dedicated lock embedded in struct
> > > > > > > xe_tlb_inval,
> > > > > > > rather than reaching into the backend to grab one.
> > > > > > > 
> > > > > > > This will deadlock as written: G2H TLB inval messages are
> > > > > > > sometimes
> > > > > > > processed while holding ct->lock (non-fast path, unlikely)
> > > > > > > and
> > > > > > > sometimes
> > > > > > > without it (fast path, likely).
> > > > > > 
> > > > > > Ugh, I'm off today. Ignore the deadlock part, I was confusing
> > > > > > myself...
> > > > > > I was thinking this was the function
> > > > > > xe_tlb_inval_done_handler,
> > > > > > it is
> > > > > > not. I still think xe_tlb_inval should its own lock but this
> > > > > > patch
> > > > > > written should work with
> > > > > > s/xe_guc_ct_send/xe_guc_ct_send_locked.
> > > > > 
> > > > > So one reason I didn't go that way is we did just the reverse
> > > > > recently
> > > > > - moved from a TLB dedicated lock to the more specific CT lock
> > > > > since
> > > > > these are all going into the CT handler anyway when we use GuC
> > > > > submission. Then this embedded version allows us to lock at the
> > > > > bottom
> > > > > data layer rather than having a separate lock in the upper
> > > > > layer.
> > > > > Another thing is we might want to have different types of
> > > > > invalidation
> > > > > running in parallel without locking the data in the upper layer
> > > > > since
> > > > > the real contention would be in the lower level pipelining
> > > > > anyway.
> > > > > 
> > > > 
> > > > I can see the reasoning behind this approach, and maybe it’s
> > > > fine.
> > > > 
> > > > But consider the case where the GuC backend has to look up a VM,
> > > > iterate
> > > > over a list of exec queues, and send multiple H2Gs to the
> > > > hardware,
> > > > each
> > > > with a corresponding G2H (per-context invalidations). In the
> > > > worst
> > > > case,
> > > > the CT code may have to wait for and process some G2Hs because
> > > > our
> > > > G2H
> > > > credits are exhausted—all while holding the CT lock, which
> > > > currently
> > > > blocks any hardware submissions (i.e., hardware submissions need
> > > > the
> > > > CT
> > > > lock). Now imagine multiple sources issuing invalidations: they
> > > > could
> > > > grab the CT lock before a submission waiting on it, further
> > > > delaying
> > > > that
> > > > submission. 
> > > > 
> > > > The longer a mutex is held, the more likely the CPU thread
> > > > holding it
> > > > could switched out while holding it.
> > > > 
> > > > This doesn’t seem scalable compared to using a finer-grained CT
> > > > lock
> > > > (e.g., only taking it in xe_guc_ct_send).
> > > > 
> > > > I’m not saying this won’t work as you have it—I think it will—but
> > > > the
> > > > consequences of holding the CT lock for an extended period need
> > > > to be
> > > > considered.
> > > 
> > > Couple more thoughts.. so in the case you mentioned, ideally I'd
> > > like
> > > to have just a single invalidation per request, rather than across
> > > a
> > > whole VM. That's the reason we have the range based invalidation to
> > 
> > Yes, this is ranged based.
> > 
> > > begin with. If we get to the point where we want to make that even
> > > finer, that's great, but we should still just have a single
> > > invalidation per request (again, ideally).
> > > 
> > 
> > Maybe you have a different idea, but I was thinking of queue-based
> > invalidations: the frontend assigns a single seqno, the backend
> > issues N
> > invalidations to the hardware—one per GCID mapped in the VM/GT
> > tuple—and
> > then signals the frontend when all invalidations associated with the
> > seqno are complete. With the GuC, a GCID corresponds to each exec
> > queue’s
> > gucid mapped in the VM/GT tuple. Different backends can handle this
> > differently.
> > 
> > > Also, you already have some patches up on the list that do some
> > > coalescing of invalidations so we reduce the number of
> > > invalidations
> > > for multiple ranges. I didn't want to include those patches here
> > > because IMO they are really a separate feature here and it'd be
> > > nice to
> > > review that on its own.
> > > 
> > 
> > I agree it is a seperate thing, that should help in some cases, and
> > should be reviewed on its own.
> > 
> > That doesn't help in the case of multiple VM's issuing invalidations
> > though (think eviction is occuring or MMU notifiers are firing). The
> > lock contenion is moved from a dedicated TLB invalidation lock, to a
> > widely shared CT lock. If multiple TLB invalidations are contending,
> > now
> > all other users of the CT lock contend at this higher level. i.e., by
> > only acquring CT lock at last part of an invalidation, other waiters
> > (non-invalidation) get QoS.
> 
> I mean, this was the original reason I had understood for having the
> separate lock in the first place. But it feels a little like we're
> running in circles here moving between the two modes..
> 

We might be getting a little side tracked but let me give a quick
example of the contention with CT lock vs. a dedicated lock.

- VM[0] has N queues attached to it
- VM[1] has M queues attached to it
- Q[0], mapped in a different VM[0], VM[1] 

In very short period of this occurs...

1. VM[0] issues an invalidation
2. VM[1] issues an invalidation
3. Q[0] does a submission

With a CT lock, thia is going to be the order of the H2G:
VM[0] - Invalidation[0]
...
VM[0] - Invalidation[N-1]
VM[1] - Invalidation[0]
...
VM[1] - Invalidation[M-1]
Q[0] - Submit

With a dedicated lock:
VM[0] - Invalidation[0]
Q[0] - Submit (this could actually first or a little later depending exact timing)
...
VM[0] - Invalidation[N-1]
VM[1] - Invalidation[0]
...
VM[1] - Invalidation[M-1]

The more pathological case—many VMs doing things like freeing memory
(e.g., a user-space free with SVM triggers an invalidation)—could
severely hurt QoS for submissions. I'm pretty sure we could craft a test
case to demonstrate this. Is it likely to be common? No. But that
doesn’t mean, as we rewrite this code, we shouldn’t account for the
worst cases and design our locking accordingly.

Here’s a quick list of common places where the CT lock is required:

- User submissions
- Binds (although this is likely to use the only CPU as some point)
- Memory allocations (clear jobs)
- SVM copys (both GPU and CPU faults)
- BO eviction (copy jobs)
- Prefetches (i.e., KMD triggered migration)
- In place memory decompression
- GPU page fault service ack
- Exec queue destory
- Preempt fences and resume

Again, if multiple TLB invalidations stack up, QoS for all of the above
operations could be denied.

> I do see what you're saying though, basically the problem is the CT
> send routine right now is doing a busy wait for a reply from guc each
> time it sends something, all within the lock.
> 
>                 if (!wait_event_timeout(ct->wq, !ct->g2h_outstanding ||
>                                         g2h_avail(ct), HZ))
> 
> So if we're going to stick with this, yeah I agree we really need some

Invalidations are a very hot path, so we need to make sure they’re
implemented as optimally as possible—the original implementation was,
well, horrible. That one’s on me.

We've actually already fixed a decent amount of issues already but there
is more work to do. Good locking here will help too.

More ideas:

- Now that we have invalidations jobs, we can pipeline invalidations
  from BO moves into copy jobs

- Coalescing should help

- SVM garbage collector likely should batch together unbinds of ranges
  to avoid multiple TLB invalidations

- I think we issue too many GGTT invalidations (both on alloc and free),
  we should be able to rid of one of those

- Supress G2H ack on TLB invalidations we don't care about (e.g., when
  issuing multiple queue based invalidations within a VM, we really only
  want on ack on the last one)

- If we are on native, maybe we don't even talk to the GuC and issue VM
  invalidations directly from the KMD (GGTT invalidations would always a
  H2G)

> kind of queuing if we're going to have a lot of these fine grained
> invalidations all in a row or we'll start blocking things like page
> fault replies.
> 
> I'm wondering if the better way to approach this though would be to
> refactor on the GuC side rather than do something really complicated on

Here, I'm not suggesting anything complicated, just a dedicated lock.

Some of suggestions above would get slightly more complicated but if
everything is layered right, it actually shouldn't be all that bad as
we'd just be modifying individual components in each case.

> the TLB side. I.e. why can't we do the CT busy wait in a worker thread
> and let the send thread keep going adding more and more? It would mean
> we'd have to do a better job of tracking each unique request out to guc
> rather than just relying on the current g2h_outstanding count, but it
> would at least let us do some of this work in parallel.
> 
> The queueing mechanism is still going to take work on top of what we
> have in this series to build up these chains of h2g messages with the
> CT lock held only for that last one. And IMO it still will be a little
> messy calling into the lower layer (guc) and back out to the upper
> layer (tlb) and back again to build these queues. And I'm not sure how
> great that will work if we move to a different back end than guc - we
> might not get any benefit there after all this work on the guc side.
> 
> Let me know what you think about a CT refactor like what I said.
> 

I'm not really following the above, but the TL;DR of how we wait for G2H
space under the CT lock is this: the CT is a closed loop—you can’t send
an H2G unless there’s space to land the G2H—so you hold the CT lock,
wait, and make space for yourself as you’re next in line for service.

> And I still do think we can do a better job reducing the scope of some
> of these invalidations, particularly in a case where we weanted to
> associate something like the guc id with the VM to build a range rather
> than just the addresses within the VM. At least in that case we can

I'm not really following this either—are you proposing an H2G where we
pass a list of gucids, or that we tell the GuC which gucids are
associated with a VM? I think either is worth exploring. For the latter,
I don’t see why we even need the whole queue-based invalidation when the
GuC could build a hash table keyed by the ASID and find everything it
needs to issue the invalidation(s). Maybe this doesn't scale with VFs?

Matt

> look a little longer term at something like the CT refactor and still
> keep the backend/frontend isolation intact.
> 
> Thanks,
> Stuart
> 
> > 
> > Matt
> >  
> > > So basically, the per request lock here also pushes us to implement
> > > in
> > > a more efficient and precise way rather than just hammering as many
> > > invalidations over a given range as possible.
> > > 
> > > And of course there are going to need to be bigger hammer
> > > invalidations
> > > sometimes (like the full VF invalidation we're doing in the
> > > invalidate_all() routines), but those still fall into the same
> > > category
> > > of precision, just with a larger scope (rather than multiple
> > > smaller
> > > invalidations).
> > > 
> > > Thanks,
> > > Stuart
> > > 
> > > > 
> > > > Matt
> > > > 
> > > > > Thanks,
> > > > > Stuart
> > > > > 
> > > > > > 
> > > > > > Matt 
> > > > > > 
> > > > > > > 
> > > > > > > I’d call this lock seqno_lock, since it protects exactly
> > > > > > > that—the
> > > > > > > order
> > > > > > > in which a seqno is assigned by the frontend and handed to
> > > > > > > the
> > > > > > > backend.
> > > > > > > 
> > > > > > > Prime this lock for reclaim as well—do what primelockdep()
> > > > > > > does
> > > > > > > in
> > > > > > > xe_guc_ct.c—to make it clear that memory allocations are
> > > > > > > not
> > > > > > > allowed
> > > > > > > while the lock is held as TLB invalidations can be called
> > > > > > > from
> > > > > > > two
> > > > > > > reclaim paths:
> > > > > > > 
> > > > > > > - MMU notifier callbacks
> > > > > > > - The dma-fence signaling path of VM binds that require a
> > > > > > > TLB
> > > > > > >   invalidation
> > > > > > > 
> > > > > > > > +       spin_lock_irq(&tlb_inval->pending_lock);
> > > > > > > > +       cancel_delayed_work(&tlb_inval->fence_tdr);
> > > > > > > >         /*
> > > > > > > >          * We might have various kworkers waiting for TLB
> > > > > > > > flushes
> > > > > > > > to complete
> > > > > > > >          * which are not tracked with an explicit TLB
> > > > > > > > fence,
> > > > > > > > however at this
> > > > > > > > -        * stage that will never happen since the CT is
> > > > > > > > already
> > > > > > > > disabled, so
> > > > > > > > -        * make sure we signal them here under the
> > > > > > > > assumption
> > > > > > > > that we have
> > > > > > > > +        * stage that will never happen since the backend
> > > > > > > > is
> > > > > > > > already disabled,
> > > > > > > > +        * so make sure we signal them here under the
> > > > > > > > assumption
> > > > > > > > that we have
> > > > > > > >          * completed a full GT reset.
> > > > > > > >          */
> > > > > > > > -       if (gt->tlb_inval.seqno == 1)
> > > > > > > > +       if (tlb_inval->seqno == 1)
> > > > > > > >                 pending_seqno =
> > > > > > > > TLB_INVALIDATION_SEQNO_MAX -
> > > > > > > > 1;
> > > > > > > >         else
> > > > > > > > -               pending_seqno = gt->tlb_inval.seqno - 1;
> > > > > > > > -       WRITE_ONCE(gt->tlb_inval.seqno_recv,
> > > > > > > > pending_seqno);
> > > > > > > > +               pending_seqno = tlb_inval->seqno - 1;
> > > > > > > > +       WRITE_ONCE(tlb_inval->seqno_recv, pending_seqno);
> > > > > > > >  
> > > > > > > >         list_for_each_entry_safe(fence, next,
> > > > > > > > -                                &gt-
> > > > > > > > > tlb_inval.pending_fences,
> > > > > > > > link)
> > > > > > > > -               inval_fence_signal(gt_to_xe(gt), fence);
> > > > > > > > -       spin_unlock_irq(&gt->tlb_inval.pending_lock);
> > > > > > > > -       mutex_unlock(&gt->uc.guc.ct.lock);
> > > > > > > > +                                &tlb_inval-
> > > > > > > > >pending_fences,
> > > > > > > > link)
> > > > > > > > +               xe_tlb_inval_fence_signal(fence);
> > > > > > > > +       spin_unlock_irq(&tlb_inval->pending_lock);
> > > > > > > > +       tlb_inval->ops->unlock(tlb_inval);
> > > > > > > >  }
> > > > > > > >  
> > > > > > > > -static bool tlb_inval_seqno_past(struct xe_gt *gt, int
> > > > > > > > seqno)
> > > > > > > > +static bool xe_tlb_inval_seqno_past(struct xe_tlb_inval
> > > > > > > > *tlb_inval, int seqno)
> > > > > > > >  {
> > > > > > > > -       int seqno_recv = READ_ONCE(gt-
> > > > > > > > >tlb_inval.seqno_recv);
> > > > > > > > +       int seqno_recv = READ_ONCE(tlb_inval-
> > > > > > > > >seqno_recv);
> > > > > > > > +
> > > > > > > > +       lockdep_assert_held(&tlb_inval->pending_lock);
> > > > > > > >  
> > > > > > > >         if (seqno - seqno_recv < -
> > > > > > > > (TLB_INVALIDATION_SEQNO_MAX
> > > > > > > > /
> > > > > > > > 2))
> > > > > > > >                 return false;
> > > > > > > > @@ -201,44 +192,20 @@ static bool
> > > > > > > > tlb_inval_seqno_past(struct
> > > > > > > > xe_gt *gt, int seqno)
> > > > > > > >         return seqno_recv >= seqno;
> > > > > > > >  }
> > > > > > > >  
> > > > > > > > -static int send_tlb_inval(struct xe_guc *guc, const u32
> > > > > > > > *action,
> > > > > > > > int len)
> > > > > > > > -{
> > > > > > > > -       struct xe_gt *gt = guc_to_gt(guc);
> > > > > > > > -
> > > > > > > > -       xe_gt_assert(gt, action[1]);    /* Seqno */
> > > > > > > > -       lockdep_assert_held(&guc->ct.lock);
> > > > > > > > -
> > > > > > > > -       /*
> > > > > > > > -        * XXX: The seqno algorithm relies on TLB
> > > > > > > > invalidation
> > > > > > > > being processed
> > > > > > > > -        * in order which they currently are, if that
> > > > > > > > changes
> > > > > > > > the
> > > > > > > > algorithm will
> > > > > > > > -        * need to be updated.
> > > > > > > > -        */
> > > > > > > > -
> > > > > > > > -       xe_gt_stats_incr(gt, XE_GT_STATS_ID_TLB_INVAL,
> > > > > > > > 1);
> > > > > > > > -
> > > > > > > > -       return xe_guc_ct_send(&guc->ct, action, len,
> > > > > > > > -                             G2H_LEN_DW_TLB_INVALIDATE,
> > > > > > > > 1);
> > > > > > > > -}
> > > > > > > > -
> > > > > > > >  static void xe_tlb_inval_fence_prep(struct
> > > > > > > > xe_tlb_inval_fence
> > > > > > > > *fence)
> > > > > > > >  {
> > > > > > > >         struct xe_tlb_inval *tlb_inval = fence-
> > > > > > > > >tlb_inval;
> > > > > > > > -       struct xe_gt *gt = tlb_inval->private;
> > > > > > > > -       struct xe_device *xe = gt_to_xe(gt);
> > > > > > > > -
> > > > > > > > -       lockdep_assert_held(&gt->uc.guc.ct.lock);
> > > > > > > >  
> > > > > > > >         fence->seqno = tlb_inval->seqno;
> > > > > > > > -       trace_xe_tlb_inval_fence_send(xe, fence);
> > > > > > > > +       trace_xe_tlb_inval_fence_send(tlb_inval->xe,
> > > > > > > > fence);
> > > > > > > >  
> > > > > > > >         spin_lock_irq(&tlb_inval->pending_lock);
> > > > > > > >         fence->inval_time = ktime_get();
> > > > > > > >         list_add_tail(&fence->link, &tlb_inval-
> > > > > > > > > pending_fences);
> > > > > > > >  
> > > > > > > >         if (list_is_singular(&tlb_inval->pending_fences))
> > > > > > > > -               queue_delayed_work(system_wq,
> > > > > > > > -                                  &tlb_inval->fence_tdr,
> > > > > > > > -                                 
> > > > > > > > tlb_timeout_jiffies(gt));
> > > > > > > > +               queue_delayed_work(system_wq, &tlb_inval-
> > > > > > > > > fence_tdr,
> > > > > > > > +                                  tlb_inval->ops-
> > > > > > > > > timeout_delay(tlb_inval));
> > > > > > > >         spin_unlock_irq(&tlb_inval->pending_lock);
> > > > > > > >  
> > > > > > > >         tlb_inval->seqno = (tlb_inval->seqno + 1) %
> > > > > > > > @@ -247,202 +214,63 @@ static void
> > > > > > > > xe_tlb_inval_fence_prep(struct
> > > > > > > > xe_tlb_inval_fence *fence)
> > > > > > > >                 tlb_inval->seqno = 1;
> > > > > > > >  }
> > > > > > > >  
> > > > > > > > -#define MAKE_INVAL_OP(type)    ((type <<
> > > > > > > > XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
> > > > > > > > -               XE_GUC_TLB_INVAL_MODE_HEAVY <<
> > > > > > > > XE_GUC_TLB_INVAL_MODE_SHIFT | \
> > > > > > > > -               XE_GUC_TLB_INVAL_FLUSH_CACHE)
> > > > > > > > -
> > > > > > > > -static int send_tlb_inval_ggtt(struct xe_gt *gt, int
> > > > > > > > seqno)
> > > > > > > > -{
> > > > > > > > -       u32 action[] = {
> > > > > > > > -               XE_GUC_ACTION_TLB_INVALIDATION,
> > > > > > > > -               seqno,
> > > > > > > > -               MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
> > > > > > > > -       };
> > > > > > > > -
> > > > > > > > -       return send_tlb_inval(&gt->uc.guc, action,
> > > > > > > > ARRAY_SIZE(action));
> > > > > > > > -}
> > > > > > > > -
> > > > > > > > -static int send_tlb_inval_all(struct xe_tlb_inval
> > > > > > > > *tlb_inval,
> > > > > > > > -                             struct xe_tlb_inval_fence
> > > > > > > > *fence)
> > > > > > > > -{
> > > > > > > > -       u32 action[] = {
> > > > > > > > -               XE_GUC_ACTION_TLB_INVALIDATION_ALL,
> > > > > > > > -               0,  /* seqno, replaced in send_tlb_inval
> > > > > > > > */
> > > > > > > > -               MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
> > > > > > > > -       };
> > > > > > > > -       struct xe_gt *gt = tlb_inval->private;
> > > > > > > > -
> > > > > > > > -       xe_gt_assert(gt, fence);
> > > > > > > > -
> > > > > > > > -       return send_tlb_inval(&gt->uc.guc, action,
> > > > > > > > ARRAY_SIZE(action));
> > > > > > > > -}
> > > > > > > > +#define xe_tlb_inval_issue(__tlb_inval, __fence, op,
> > > > > > > > args...)  \
> > > > > > > > +({                                                      
> > > > > > > >     
> > > > > > > >    \
> > > > > > > > +       int
> > > > > > > > __ret;                                              \
> > > > > > > > +                                                        
> > > > > > > >     
> > > > > > > >    \
> > > > > > > > +       xe_assert((__tlb_inval)->xe, (__tlb_inval)-
> > > > > > > > > ops);       \
> > > > > > > > +       xe_assert((__tlb_inval)->xe,
> > > > > > > > (__fence));                \
> > > > > > > > +                                                        
> > > > > > > >     
> > > > > > > >    \
> > > > > > > > +       (__tlb_inval)->ops-
> > > > > > > > > lock((__tlb_inval));                \
> > > > > > > > +       xe_tlb_inval_fence_prep((__fence));              
> > > > > > > >     
> > > > > > > >    \
> > > > > > > > +       __ret = op((__tlb_inval), (__fence)->seqno,
> > > > > > > > ##args);    \
> > > > > > > > +       if (__ret <
> > > > > > > > 0)                                          \
> > > > > > > > +               xe_tlb_inval_fence_signal_unlocked((__fen
> > > > > > > > ce))
> > > > > > > > ;  \
> > > > > > > > +       (__tlb_inval)->ops-
> > > > > > > > > unlock((__tlb_inval));              \
> > > > > > > > +                                                        
> > > > > > > >     
> > > > > > > >    \
> > > > > > > > +       __ret == -ECANCELED ? 0 :
> > > > > > > > __ret;                        \
> > > > > > > > +})
> > > > > > > >  
> > > > > > > >  /**
> > > > > > > > - * xe_gt_tlb_invalidation_all - Invalidate all TLBs
> > > > > > > > across
> > > > > > > > PF
> > > > > > > > and all VFs.
> > > > > > > > - * @gt: the &xe_gt structure
> > > > > > > > - * @fence: the &xe_tlb_inval_fence to be signaled on
> > > > > > > > completion
> > > > > > > > + * xe_tlb_inval_all() - Issue a TLB invalidation for all
> > > > > > > > TLBs
> > > > > > > > + * @tlb_inval: TLB invalidation client
> > > > > > > > + * @fence: invalidation fence which will be signal on
> > > > > > > > TLB
> > > > > > > > invalidation
> > > > > > > > + * completion
> > > > > > > >   *
> > > > > > > > - * Send a request to invalidate all TLBs across PF and
> > > > > > > > all
> > > > > > > > VFs.
> > > > > > > > + * Issue a TLB invalidation for all TLBs. Completion of
> > > > > > > > TLB
> > > > > > > > is
> > > > > > > > asynchronous and
> > > > > > > > + * caller can use the invalidation fence to wait for
> > > > > > > > completion.
> > > > > > > >   *
> > > > > > > >   * Return: 0 on success, negative error code on error
> > > > > > > >   */
> > > > > > > >  int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
> > > > > > > >                      struct xe_tlb_inval_fence *fence)
> > > > > > > >  {
> > > > > > > > -       struct xe_gt *gt = tlb_inval->private;
> > > > > > > > -       int err;
> > > > > > > > -
> > > > > > > > -       err = send_tlb_inval_all(tlb_inval, fence);
> > > > > > > > -       if (err)
> > > > > > > > -               xe_gt_err(gt, "TLB invalidation request
> > > > > > > > failed
> > > > > > > > (%pe)", ERR_PTR(err));
> > > > > > > > -
> > > > > > > > -       return err;
> > > > > > > > -}
> > > > > > > > -
> > > > > > > > -/*
> > > > > > > > - * Ensure that roundup_pow_of_two(length) doesn't
> > > > > > > > overflow.
> > > > > > > > - * Note that roundup_pow_of_two() operates on unsigned
> > > > > > > > long,
> > > > > > > > - * not on u64.
> > > > > > > > - */
> > > > > > > > -#define MAX_RANGE_TLB_INVALIDATION_LENGTH
> > > > > > > > (rounddown_pow_of_two(ULONG_MAX))
> > > > > > > > -
> > > > > > > > -static int send_tlb_inval_ppgtt(struct xe_gt *gt, u64
> > > > > > > > start,
> > > > > > > > u64
> > > > > > > > end,
> > > > > > > > -                               u32 asid, int seqno)
> > > > > > > > -{
> > > > > > > > -#define MAX_TLB_INVALIDATION_LEN       7
> > > > > > > > -       u32 action[MAX_TLB_INVALIDATION_LEN];
> > > > > > > > -       u64 length = end - start;
> > > > > > > > -       int len = 0;
> > > > > > > > -
> > > > > > > > -       action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
> > > > > > > > -       action[len++] = seqno;
> > > > > > > > -       if (!gt_to_xe(gt)->info.has_range_tlb_inval ||
> > > > > > > > -           length > MAX_RANGE_TLB_INVALIDATION_LENGTH) {
> > > > > > > > -               action[len++] =
> > > > > > > > MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
> > > > > > > > -       } else {
> > > > > > > > -               u64 orig_start = start;
> > > > > > > > -               u64 align;
> > > > > > > > -
> > > > > > > > -               if (length < SZ_4K)
> > > > > > > > -                       length = SZ_4K;
> > > > > > > > -
> > > > > > > > -               /*
> > > > > > > > -                * We need to invalidate a higher
> > > > > > > > granularity
> > > > > > > > if
> > > > > > > > start address
> > > > > > > > -                * is not aligned to length. When start
> > > > > > > > is
> > > > > > > > not
> > > > > > > > aligned with
> > > > > > > > -                * length we need to find the length
> > > > > > > > large
> > > > > > > > enough
> > > > > > > > to create an
> > > > > > > > -                * address mask covering the required
> > > > > > > > range.
> > > > > > > > -                */
> > > > > > > > -               align = roundup_pow_of_two(length);
> > > > > > > > -               start = ALIGN_DOWN(start, align);
> > > > > > > > -               end = ALIGN(end, align);
> > > > > > > > -               length = align;
> > > > > > > > -               while (start + length < end) {
> > > > > > > > -                       length <<= 1;
> > > > > > > > -                       start = ALIGN_DOWN(orig_start,
> > > > > > > > length);
> > > > > > > > -               }
> > > > > > > > -
> > > > > > > > -               /*
> > > > > > > > -                * Minimum invalidation size for a 2MB
> > > > > > > > page
> > > > > > > > that
> > > > > > > > the hardware
> > > > > > > > -                * expects is 16MB
> > > > > > > > -                */
> > > > > > > > -               if (length >= SZ_2M) {
> > > > > > > > -                       length = max_t(u64, SZ_16M,
> > > > > > > > length);
> > > > > > > > -                       start = ALIGN_DOWN(orig_start,
> > > > > > > > length);
> > > > > > > > -               }
> > > > > > > > -
> > > > > > > > -               xe_gt_assert(gt, length >= SZ_4K);
> > > > > > > > -               xe_gt_assert(gt, is_power_of_2(length));
> > > > > > > > -               xe_gt_assert(gt, !(length &
> > > > > > > > GENMASK(ilog2(SZ_16M)
> > > > > > > > - 1,
> > > > > > > > -                                                  
> > > > > > > > ilog2(SZ_2M)
> > > > > > > > + 1)));
> > > > > > > > -               xe_gt_assert(gt, IS_ALIGNED(start,
> > > > > > > > length));
> > > > > > > > -
> > > > > > > > -               action[len++] =
> > > > > > > > MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
> > > > > > > > -               action[len++] = asid;
> > > > > > > > -               action[len++] = lower_32_bits(start);
> > > > > > > > -               action[len++] = upper_32_bits(start);
> > > > > > > > -               action[len++] = ilog2(length) -
> > > > > > > > ilog2(SZ_4K);
> > > > > > > > -       }
> > > > > > > > -
> > > > > > > > -       xe_gt_assert(gt, len <=
> > > > > > > > MAX_TLB_INVALIDATION_LEN);
> > > > > > > > -
> > > > > > > > -       return send_tlb_inval(&gt->uc.guc, action, len);
> > > > > > > > -}
> > > > > > > > -
> > > > > > > > -static int __xe_tlb_inval_ggtt(struct xe_gt *gt,
> > > > > > > > -                              struct xe_tlb_inval_fence
> > > > > > > > *fence)
> > > > > > > > -{
> > > > > > > > -       int ret;
> > > > > > > > -
> > > > > > > > -       mutex_lock(&gt->uc.guc.ct.lock);
> > > > > > > > -
> > > > > > > > -       xe_tlb_inval_fence_prep(fence);
> > > > > > > > -
> > > > > > > > -       ret = send_tlb_inval_ggtt(gt, fence->seqno);
> > > > > > > > -       if (ret < 0)
> > > > > > > > -               inval_fence_signal_unlocked(gt_to_xe(gt),
> > > > > > > > fence);
> > > > > > > > -
> > > > > > > > -       mutex_unlock(&gt->uc.guc.ct.lock);
> > > > > > > > -
> > > > > > > > -       /*
> > > > > > > > -        * -ECANCELED indicates the CT is stopped for a
> > > > > > > > GT
> > > > > > > > reset.
> > > > > > > > TLB caches
> > > > > > > > -        *  should be nuked on a GT reset so this error
> > > > > > > > can
> > > > > > > > be
> > > > > > > > ignored.
> > > > > > > > -        */
> > > > > > > > -       if (ret == -ECANCELED)
> > > > > > > > -               return 0;
> > > > > > > > -
> > > > > > > > -       return ret;
> > > > > > > > +       return xe_tlb_inval_issue(tlb_inval, fence,
> > > > > > > > tlb_inval-
> > > > > > > > > ops->all);
> > > > > > > >  }
> > > > > > > >  
> > > > > > > >  /**
> > > > > > > > - * xe_tlb_inval_ggtt - Issue a TLB invalidation on this
> > > > > > > > GT
> > > > > > > > for
> > > > > > > > the GGTT
> > > > > > > > + * xe_tlb_inval_ggtt() - Issue a TLB invalidation for
> > > > > > > > the
> > > > > > > > GGTT
> > > > > > > >   * @tlb_inval: TLB invalidation client
> > > > > > > >   *
> > > > > > > > - * Issue a TLB invalidation for the GGTT. Completion of
> > > > > > > > TLB
> > > > > > > > invalidation is
> > > > > > > > - * synchronous.
> > > > > > > > + * Issue a TLB invalidation for the GGTT. Completion of
> > > > > > > > TLB
> > > > > > > > is
> > > > > > > > asynchronous and
> > > > > > > > + * caller can use the invalidation fence to wait for
> > > > > > > > completion.
> > > > > > > >   *
> > > > > > > >   * Return: 0 on success, negative error code on error
> > > > > > > >   */
> > > > > > > >  int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
> > > > > > > >  {
> > > > > > > > -       struct xe_gt *gt = tlb_inval->private;
> > > > > > > > -       struct xe_device *xe = gt_to_xe(gt);
> > > > > > > > -       unsigned int fw_ref;
> > > > > > > > -
> > > > > > > > -       if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
> > > > > > > > -           gt->uc.guc.submission_state.enabled) {
> > > > > > > > -               struct xe_tlb_inval_fence fence;
> > > > > > > > -               int ret;
> > > > > > > > -
> > > > > > > > -               xe_tlb_inval_fence_init(tlb_inval,
> > > > > > > > &fence,
> > > > > > > > true);
> > > > > > > > -               ret = __xe_tlb_inval_ggtt(gt, &fence);
> > > > > > > > -               if (ret)
> > > > > > > > -                       return ret;
> > > > > > > > -
> > > > > > > > -               xe_tlb_inval_fence_wait(&fence);
> > > > > > > > -       } else if (xe_device_uc_enabled(xe) &&
> > > > > > > > !xe_device_wedged(xe)) {
> > > > > > > > -               struct xe_mmio *mmio = &gt->mmio;
> > > > > > > > -
> > > > > > > > -               if (IS_SRIOV_VF(xe))
> > > > > > > > -                       return 0;
> > > > > > > > -
> > > > > > > > -               fw_ref = xe_force_wake_get(gt_to_fw(gt),
> > > > > > > > XE_FW_GT);
> > > > > > > > -               if (xe->info.platform == XE_PVC ||
> > > > > > > > GRAPHICS_VER(xe) >= 20) {
> > > > > > > > -                       xe_mmio_write32(mmio,
> > > > > > > > PVC_GUC_TLB_INV_DESC1,
> > > > > > > > -
> > > > > > > >                                        PVC_GUC_TLB_INV_DE
> > > > > > > > SC1_
> > > > > > > > INVAL
> > > > > > > > IDATE);
> > > > > > > > -                       xe_mmio_write32(mmio,
> > > > > > > > PVC_GUC_TLB_INV_DESC0,
> > > > > > > > -
> > > > > > > >                                        PVC_GUC_TLB_INV_DE
> > > > > > > > SC0_
> > > > > > > > VALID
> > > > > > > > );
> > > > > > > > -               } else {
> > > > > > > > -                       xe_mmio_write32(mmio,
> > > > > > > > GUC_TLB_INV_CR,
> > > > > > > > -
> > > > > > > >                                        GUC_TLB_INV_CR_INV
> > > > > > > > ALID
> > > > > > > > ATE);
> > > > > > > > -               }
> > > > > > > > -               xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > > > > > > > -       }
> > > > > > > > +       struct xe_tlb_inval_fence fence, *fence_ptr =
> > > > > > > > &fence;
> > > > > > > > +       int ret;
> > > > > > > >  
> > > > > > > > -       return 0;
> > > > > > > > +       xe_tlb_inval_fence_init(tlb_inval, fence_ptr,
> > > > > > > > true);
> > > > > > > > +       ret = xe_tlb_inval_issue(tlb_inval, fence_ptr,
> > > > > > > > tlb_inval-
> > > > > > > > > ops->ggtt);
> > > > > > > > +       xe_tlb_inval_fence_wait(fence_ptr);
> > > > > > > > +
> > > > > > > > +       return ret;
> > > > > > > >  }
> > > > > > > >  
> > > > > > > >  /**
> > > > > > > > - * xe_tlb_inval_range - Issue a TLB invalidation on this
> > > > > > > > GT
> > > > > > > > for
> > > > > > > > an address range
> > > > > > > > + * xe_tlb_inval_range() - Issue a TLB invalidation for
> > > > > > > > an
> > > > > > > > address range
> > > > > > > >   * @tlb_inval: TLB invalidation client
> > > > > > > >   * @fence: invalidation fence which will be signal on
> > > > > > > > TLB
> > > > > > > > invalidation
> > > > > > > >   * completion
> > > > > > > > @@ -460,33 +288,12 @@ int xe_tlb_inval_range(struct
> > > > > > > > xe_tlb_inval
> > > > > > > > *tlb_inval,
> > > > > > > >                        struct xe_tlb_inval_fence *fence,
> > > > > > > > u64
> > > > > > > > start, u64 end,
> > > > > > > >                        u32 asid)
> > > > > > > >  {
> > > > > > > > -       struct xe_gt *gt = tlb_inval->private;
> > > > > > > > -       struct xe_device *xe = gt_to_xe(gt);
> > > > > > > > -       int  ret;
> > > > > > > > -
> > > > > > > > -       xe_gt_assert(gt, fence);
> > > > > > > > -
> > > > > > > > -       /* Execlists not supported */
> > > > > > > > -       if (xe->info.force_execlist) {
> > > > > > > > -               __inval_fence_signal(xe, fence);
> > > > > > > > -               return 0;
> > > > > > > > -       }
> > > > > > > > -
> > > > > > > > -       mutex_lock(&gt->uc.guc.ct.lock);
> > > > > > > > -
> > > > > > > > -       xe_tlb_inval_fence_prep(fence);
> > > > > > > > -
> > > > > > > > -       ret = send_tlb_inval_ppgtt(gt, start, end, asid,
> > > > > > > > fence-
> > > > > > > > > seqno);
> > > > > > > > -       if (ret < 0)
> > > > > > > > -               inval_fence_signal_unlocked(xe, fence);
> > > > > > > > -
> > > > > > > > -       mutex_unlock(&gt->uc.guc.ct.lock);
> > > > > > > > -
> > > > > > > > -       return ret;
> > > > > > > > +       return xe_tlb_inval_issue(tlb_inval, fence,
> > > > > > > > tlb_inval-
> > > > > > > > > ops->ppgtt,
> > > > > > > > +                                 start, end, asid);
> > > > > > > >  }
> > > > > > > >  
> > > > > > > >  /**
> > > > > > > > - * xe_tlb_inval_vm - Issue a TLB invalidation on this GT
> > > > > > > > for
> > > > > > > > a
> > > > > > > > VM
> > > > > > > > + * xe_tlb_inval_vm() - Issue a TLB invalidation for a VM
> > > > > > > >   * @tlb_inval: TLB invalidation client
> > > > > > > >   * @vm: VM to invalidate
> > > > > > > >   *
> > > > > > > > @@ -496,27 +303,22 @@ void xe_tlb_inval_vm(struct
> > > > > > > > xe_tlb_inval
> > > > > > > > *tlb_inval, struct xe_vm *vm)
> > > > > > > >  {
> > > > > > > >         struct xe_tlb_inval_fence fence;
> > > > > > > >         u64 range = 1ull << vm->xe->info.va_bits;
> > > > > > > > -       int ret;
> > > > > > > >  
> > > > > > > >         xe_tlb_inval_fence_init(tlb_inval, &fence, true);
> > > > > > > > -
> > > > > > > > -       ret = xe_tlb_inval_range(tlb_inval, &fence, 0,
> > > > > > > > range,
> > > > > > > > vm-
> > > > > > > > > usm.asid);
> > > > > > > > -       if (ret < 0)
> > > > > > > > -               return;
> > > > > > > > -
> > > > > > > > +       xe_tlb_inval_range(tlb_inval, &fence, 0, range,
> > > > > > > > vm-
> > > > > > > > > usm.asid);
> > > > > > > >         xe_tlb_inval_fence_wait(&fence);
> > > > > > > >  }
> > > > > > > >  
> > > > > > > >  /**
> > > > > > > > - * xe_tlb_inval_done_handler - TLB invalidation done
> > > > > > > > handler
> > > > > > > > - * @gt: gt
> > > > > > > > + * xe_tlb_inval_done_handler() - TLB invalidation done
> > > > > > > > handler
> > > > > > > > + * @tlb_inval: TLB invalidation client
> > > > > > > >   * @seqno: seqno of invalidation that is done
> > > > > > > >   *
> > > > > > > >   * Update recv seqno, signal any TLB invalidation
> > > > > > > > fences,
> > > > > > > > and
> > > > > > > > restart TDR
> > > > > > > 
> > > > > > > I'd mention that is function is safe be called from any
> > > > > > > context
> > > > > > > (i.e.,
> > > > > > > process, atomic, and hardirq contexts are allowed).
> > > > > > > 
> > > > > > > We might need to convert tlb_inval.pending_lock to a
> > > > > > > raw_spinlock_t
> > > > > > > for
> > > > > > > PREEMPT_RT enablement. Same for the GuC fast_lock. AFAIK we
> > > > > > > haven’t
> > > > > > > had
> > > > > > > any complaints, so maybe I’m just overthinking it, but also
> > > > > > > perhaps
> > > > > > > not.
> > > > > > > 
> > > > > > > >   */
> > > > > > > > -static void xe_tlb_inval_done_handler(struct xe_gt *gt,
> > > > > > > > int
> > > > > > > > seqno)
> > > > > > > > +void xe_tlb_inval_done_handler(struct xe_tlb_inval
> > > > > > > > *tlb_inval,
> > > > > > > > int seqno)
> > > > > > > >  {
> > > > > > > > -       struct xe_device *xe = gt_to_xe(gt);
> > > > > > > > +       struct xe_device *xe = tlb_inval->xe;
> > > > > > > >         struct xe_tlb_inval_fence *fence, *next;
> > > > > > > >         unsigned long flags;
> > > > > > > >  
> > > > > > > > @@ -535,77 +337,53 @@ static void
> > > > > > > > xe_tlb_inval_done_handler(struct xe_gt *gt, int seqno)
> > > > > > > >          * officially process the CT message like if
> > > > > > > > racing
> > > > > > > > against
> > > > > > > >          * process_g2h_msg().
> > > > > > > >          */
> > > > > > > > -       spin_lock_irqsave(&gt->tlb_inval.pending_lock,
> > > > > > > > flags);
> > > > > > > > -       if (tlb_inval_seqno_past(gt, seqno)) {
> > > > > > > > -               spin_unlock_irqrestore(&gt-
> > > > > > > > > tlb_inval.pending_lock, flags);
> > > > > > > > +       spin_lock_irqsave(&tlb_inval->pending_lock,
> > > > > > > > flags);
> > > > > > > > +       if (xe_tlb_inval_seqno_past(tlb_inval, seqno)) {
> > > > > > > > +               spin_unlock_irqrestore(&tlb_inval-
> > > > > > > > > pending_lock,
> > > > > > > > flags);
> > > > > > > >                 return;
> > > > > > > >         }
> > > > > > > >  
> > > > > > > > -       WRITE_ONCE(gt->tlb_inval.seqno_recv, seqno);
> > > > > > > > +       WRITE_ONCE(tlb_inval->seqno_recv, seqno);
> > > > > > > >  
> > > > > > > >         list_for_each_entry_safe(fence, next,
> > > > > > > > -                                &gt-
> > > > > > > > > tlb_inval.pending_fences,
> > > > > > > > link) {
> > > > > > > > +                                &tlb_inval-
> > > > > > > > >pending_fences,
> > > > > > > > link) {
> > > > > > > >                 trace_xe_tlb_inval_fence_recv(xe, fence);
> > > > > > > >  
> > > > > > > > -               if (!tlb_inval_seqno_past(gt, fence-
> > > > > > > > >seqno))
> > > > > > > > +               if (!xe_tlb_inval_seqno_past(tlb_inval,
> > > > > > > > fence-
> > > > > > > > > seqno))
> > > > > > > >                         break;
> > > > > > > >  
> > > > > > > > -               inval_fence_signal(xe, fence);
> > > > > > > > +               xe_tlb_inval_fence_signal(fence);
> > > > > > > >         }
> > > > > > > >  
> > > > > > > > -       if (!list_empty(&gt->tlb_inval.pending_fences))
> > > > > > > > +       if (!list_empty(&tlb_inval->pending_fences))
> > > > > > > >                 mod_delayed_work(system_wq,
> > > > > > > > -                                &gt-
> > > > > > > > >tlb_inval.fence_tdr,
> > > > > > > > -                               
> > > > > > > > tlb_timeout_jiffies(gt));
> > > > > > > > +                                &tlb_inval->fence_tdr,
> > > > > > > > +                                tlb_inval->ops-
> > > > > > > > > timeout_delay(tlb_inval));
> > > > > > > >         else
> > > > > > > > -               cancel_delayed_work(&gt-
> > > > > > > > > tlb_inval.fence_tdr);
> > > > > > > > +               cancel_delayed_work(&tlb_inval-
> > > > > > > > >fence_tdr);
> > > > > > > >  
> > > > > > > > -       spin_unlock_irqrestore(&gt-
> > > > > > > > >tlb_inval.pending_lock,
> > > > > > > > flags);
> > > > > > > > -}
> > > > > > > > -
> > > > > > > > -/**
> > > > > > > > - * xe_guc_tlb_inval_done_handler - TLB invalidation done
> > > > > > > > handler
> > > > > > > > - * @guc: guc
> > > > > > > > - * @msg: message indicating TLB invalidation done
> > > > > > > > - * @len: length of message
> > > > > > > > - *
> > > > > > > > - * Parse seqno of TLB invalidation, wake any waiters for
> > > > > > > > seqno,
> > > > > > > > and signal any
> > > > > > > > - * invalidation fences for seqno. Algorithm for this
> > > > > > > > depends
> > > > > > > > on
> > > > > > > > seqno being
> > > > > > > > - * received in-order and asserts this assumption.
> > > > > > > > - *
> > > > > > > > - * Return: 0 on success, -EPROTO for malformed messages.
> > > > > > > > - */
> > > > > > > > -int xe_guc_tlb_inval_done_handler(struct xe_guc *guc,
> > > > > > > > u32
> > > > > > > > *msg,
> > > > > > > > u32 len)
> > > > > > > > -{
> > > > > > > > -       struct xe_gt *gt = guc_to_gt(guc);
> > > > > > > > -
> > > > > > > > -       if (unlikely(len != 1))
> > > > > > > > -               return -EPROTO;
> > > > > > > > -
> > > > > > > > -       xe_tlb_inval_done_handler(gt, msg[0]);
> > > > > > > > -
> > > > > > > > -       return 0;
> > > > > > > > +       spin_unlock_irqrestore(&tlb_inval->pending_lock,
> > > > > > > > flags);
> > > > > > > >  }
> > > > > > > >  
> > > > > > > >  static const char *
> > > > > > > > -inval_fence_get_driver_name(struct dma_fence *dma_fence)
> > > > > > > > +xe_inval_fence_get_driver_name(struct dma_fence
> > > > > > > > *dma_fence)
> > > > > > > >  {
> > > > > > > >         return "xe";
> > > > > > > >  }
> > > > > > > >  
> > > > > > > >  static const char *
> > > > > > > > -inval_fence_get_timeline_name(struct dma_fence
> > > > > > > > *dma_fence)
> > > > > > > > +xe_inval_fence_get_timeline_name(struct dma_fence
> > > > > > > > *dma_fence)
> > > > > > > >  {
> > > > > > > > -       return "inval_fence";
> > > > > > > > +       return "tlb_inval_fence";
> > > > > > > >  }
> > > > > > > >  
> > > > > > > >  static const struct dma_fence_ops inval_fence_ops = {
> > > > > > > > -       .get_driver_name = inval_fence_get_driver_name,
> > > > > > > > -       .get_timeline_name =
> > > > > > > > inval_fence_get_timeline_name,
> > > > > > > > +       .get_driver_name =
> > > > > > > > xe_inval_fence_get_driver_name,
> > > > > > > > +       .get_timeline_name =
> > > > > > > > xe_inval_fence_get_timeline_name,
> > > > > > > >  };
> > > > > > > >  
> > > > > > > >  /**
> > > > > > > > - * xe_tlb_inval_fence_init - Initialize TLB invalidation
> > > > > > > > fence
> > > > > > > > + * xe_tlb_inval_fence_init() - Initialize TLB
> > > > > > > > invalidation
> > > > > > > > fence
> > > > > > > >   * @tlb_inval: TLB invalidation client
> > > > > > > >   * @fence: TLB invalidation fence to initialize
> > > > > > > >   * @stack: fence is stack variable
> > > > > > > > @@ -618,15 +396,12 @@ void xe_tlb_inval_fence_init(struct
> > > > > > > > xe_tlb_inval *tlb_inval,
> > > > > > > >                              struct xe_tlb_inval_fence
> > > > > > > > *fence,
> > > > > > > >                              bool stack)
> > > > > > > >  {
> > > > > > > > -       struct xe_gt *gt = tlb_inval->private;
> > > > > > > > -
> > > > > > > > -       xe_pm_runtime_get_noresume(gt_to_xe(gt));
> > > > > > > > +       xe_pm_runtime_get_noresume(tlb_inval->xe);
> > > > > > > >  
> > > > > > > > -       spin_lock_irq(&gt->tlb_inval.lock);
> > > > > > > > -       dma_fence_init(&fence->base, &inval_fence_ops,
> > > > > > > > -                      &gt->tlb_inval.lock,
> > > > > > > > +       spin_lock_irq(&tlb_inval->lock);
> > > > > > > > +       dma_fence_init(&fence->base, &inval_fence_ops,
> > > > > > > > &tlb_inval->lock,
> > > > > > > >                        dma_fence_context_alloc(1), 1);
> > > > > > > > -       spin_unlock_irq(&gt->tlb_inval.lock);
> > > > > > > > +       spin_unlock_irq(&tlb_inval->lock);
> > > > > > > 
> > > > > > > While here, 'fence_lock' is probably a better name.
> > > > > > > 
> > > > > > > Matt
> > > > > > > 
> > > > > > > >         INIT_LIST_HEAD(&fence->link);
> > > > > > > >         if (stack)
> > > > > > > >                 set_bit(FENCE_STACK_BIT, &fence-
> > > > > > > > >base.flags);
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h
> > > > > > > > b/drivers/gpu/drm/xe/xe_tlb_inval.h
> > > > > > > > index 7adee3f8c551..cdeafc8d4391 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/xe_tlb_inval.h
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
> > > > > > > > @@ -18,24 +18,30 @@ struct xe_vma;
> > > > > > > >  int xe_gt_tlb_inval_init_early(struct xe_gt *gt);
> > > > > > > >  
> > > > > > > >  void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval);
> > > > > > > > -int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
> > > > > > > > -void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval,
> > > > > > > > struct
> > > > > > > > xe_vm *vm);
> > > > > > > >  int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
> > > > > > > >                      struct xe_tlb_inval_fence *fence);
> > > > > > > > +int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
> > > > > > > > +void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval,
> > > > > > > > struct
> > > > > > > > xe_vm *vm);
> > > > > > > >  int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
> > > > > > > >                        struct xe_tlb_inval_fence *fence,
> > > > > > > >                        u64 start, u64 end, u32 asid);
> > > > > > > > -int xe_guc_tlb_inval_done_handler(struct xe_guc *guc,
> > > > > > > > u32
> > > > > > > > *msg,
> > > > > > > > u32 len);
> > > > > > > >  
> > > > > > > >  void xe_tlb_inval_fence_init(struct xe_tlb_inval
> > > > > > > > *tlb_inval,
> > > > > > > >                              struct xe_tlb_inval_fence
> > > > > > > > *fence,
> > > > > > > >                              bool stack);
> > > > > > > > -void xe_tlb_inval_fence_signal(struct xe_tlb_inval_fence
> > > > > > > > *fence);
> > > > > > > >  
> > > > > > > > +/**
> > > > > > > > + * xe_tlb_inval_fence_wait() - TLB invalidiation fence
> > > > > > > > wait
> > > > > > > > + * @fence: TLB invalidation fence to wait on
> > > > > > > > + *
> > > > > > > > + * Wait on a TLB invalidiation fence until it signals,
> > > > > > > > non
> > > > > > > > interruptable
> > > > > > > > + */
> > > > > > > >  static inline void
> > > > > > > >  xe_tlb_inval_fence_wait(struct xe_tlb_inval_fence
> > > > > > > > *fence)
> > > > > > > >  {
> > > > > > > >         dma_fence_wait(&fence->base, false);
> > > > > > > >  }
> > > > > > > >  
> > > > > > > > +void xe_tlb_inval_done_handler(struct xe_tlb_inval
> > > > > > > > *tlb_inval,
> > > > > > > > int seqno);
> > > > > > > > +
> > > > > > > >  #endif /* _XE_TLB_INVAL_ */
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > > > > > > > b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > > > > > > > index 05b6adc929bb..c1ad96d24fc8 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > > > > > > > @@ -9,10 +9,85 @@
> > > > > > > >  #include <linux/workqueue.h>
> > > > > > > >  #include <linux/dma-fence.h>
> > > > > > > >  
> > > > > > > > -/** struct xe_tlb_inval - TLB invalidation client */
> > > > > > > > +struct xe_tlb_inval;
> > > > > > > > +
> > > > > > > > +/** struct xe_tlb_inval_ops - TLB invalidation ops
> > > > > > > > (backend)
> > > > > > > > */
> > > > > > > > +struct xe_tlb_inval_ops {
> > > > > > > > +       /**
> > > > > > > > +        * @all: Invalidate all TLBs
> > > > > > > > +        * @tlb_inval: TLB invalidation client
> > > > > > > > +        * @seqno: Seqno of TLB invalidation
> > > > > > > > +        *
> > > > > > > > +        * Return 0 on success, -ECANCELED if backend is
> > > > > > > > mid-
> > > > > > > > reset, error on
> > > > > > > > +        * failure
> > > > > > > > +        */
> > > > > > > > +       int (*all)(struct xe_tlb_inval *tlb_inval, u32
> > > > > > > > seqno);
> > > > > > > > +
> > > > > > > > +       /**
> > > > > > > > +        * @ggtt: Invalidate global translation TLBs
> > > > > > > > +        * @tlb_inval: TLB invalidation client
> > > > > > > > +        * @seqno: Seqno of TLB invalidation
> > > > > > > > +        *
> > > > > > > > +        * Return 0 on success, -ECANCELED if backend is
> > > > > > > > mid-
> > > > > > > > reset, error on
> > > > > > > > +        * failure
> > > > > > > > +        */
> > > > > > > > +       int (*ggtt)(struct xe_tlb_inval *tlb_inval, u32
> > > > > > > > seqno);
> > > > > > > > +
> > > > > > > > +       /**
> > > > > > > > +        * @ppttt: Invalidate per-process translation
> > > > > > > > TLBs
> > > > > > > > +        * @tlb_inval: TLB invalidation client
> > > > > > > > +        * @seqno: Seqno of TLB invalidation
> > > > > > > > +        * @start: Start address
> > > > > > > > +        * @end: End address
> > > > > > > > +        * @asid: Address space ID
> > > > > > > > +        *
> > > > > > > > +        * Return 0 on success, -ECANCELED if backend is
> > > > > > > > mid-
> > > > > > > > reset, error on
> > > > > > > > +        * failure
> > > > > > > > +        */
> > > > > > > > +       int (*ppgtt)(struct xe_tlb_inval *tlb_inval, u32
> > > > > > > > seqno,
> > > > > > > > u64 start,
> > > > > > > > +                    u64 end, u32 asid);
> > > > > > > > +
> > > > > > > > +       /**
> > > > > > > > +        * @initialized: Backend is initialized
> > > > > > > > +        * @tlb_inval: TLB invalidation client
> > > > > > > > +        *
> > > > > > > > +        * Return: True if back is initialized, False
> > > > > > > > otherwise
> > > > > > > > +        */
> > > > > > > > +       bool (*initialized)(struct xe_tlb_inval
> > > > > > > > *tlb_inval);
> > > > > > > > +
> > > > > > > > +       /**
> > > > > > > > +        * @flush: Flush pending TLB invalidations
> > > > > > > > +        * @tlb_inval: TLB invalidation client
> > > > > > > > +        */
> > > > > > > > +       void (*flush)(struct xe_tlb_inval *tlb_inval);
> > > > > > > > +
> > > > > > > > +       /**
> > > > > > > > +        * @timeout_delay: Timeout delay for TLB
> > > > > > > > invalidation
> > > > > > > > +        * @tlb_inval: TLB invalidation client
> > > > > > > > +        *
> > > > > > > > +        * Return: Timeout delay for TLB invalidation in
> > > > > > > > jiffies
> > > > > > > > +        */
> > > > > > > > +       long (*timeout_delay)(struct xe_tlb_inval
> > > > > > > > *tlb_inval);
> > > > > > > > +
> > > > > > > > +       /**
> > > > > > > > +        * @lock: Lock resources protecting the backend
> > > > > > > > seqno
> > > > > > > > management
> > > > > > > > +        */
> > > > > > > > +       void (*lock)(struct xe_tlb_inval *tlb_inval);
> > > > > > > > +
> > > > > > > > +       /**
> > > > > > > > +        * @unlock: Lock resources protecting the backend
> > > > > > > > seqno
> > > > > > > > management
> > > > > > > > +        */
> > > > > > > > +       void (*unlock)(struct xe_tlb_inval *tlb_inval);
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +/** struct xe_tlb_inval - TLB invalidation client
> > > > > > > > (frontend)
> > > > > > > > */
> > > > > > > >  struct xe_tlb_inval {
> > > > > > > >         /** @private: Backend private pointer */
> > > > > > > >         void *private;
> > > > > > > > +       /** @xe: Pointer to Xe device */
> > > > > > > > +       struct xe_device *xe;
> > > > > > > > +       /** @ops: TLB invalidation ops */
> > > > > > > > +       const struct xe_tlb_inval_ops *ops;
> > > > > > > >         /** @tlb_inval.seqno: TLB invalidation seqno,
> > > > > > > > protected
> > > > > > > > by CT lock */
> > > > > > > >  #define TLB_INVALIDATION_SEQNO_MAX     0x100000
> > > > > > > >         int seqno;
> > > > > > > > -- 
> > > > > > > > 2.34.1
> > > > > > > > 
> > > > > 
> > > 
> 
