Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A67C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 17:53:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108B010E9C2;
	Thu, 30 Jan 2025 17:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EBUavRIf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F1710E9BC
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 17:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738259583; x=1769795583;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pfivSKCaao8Ts2qq/DW4DvNLctRZdhhVaBczUfbRx+s=;
 b=EBUavRIfEjLFpBDdI5kKEfB2DDgR5r1eB37+9JZOgBk7NsmcwEa+PdG4
 nOfqIkRvCD/ho4rQElludpimP2Ox/9zd7uCZ9kRXnXpc2d+WRyW81JL3Z
 6IC+XDC/m7xUGBiDnMtM43E/46BHnkDsnhjyz8sXMzGWDW2zRYgFCYDTA
 zQBX2PMUSWNH3KwVD36B9Nl2iE7mxN3PCzzHqaLs2vpqrBrHMGjSt5TVc
 tqQMvYGNBTsQE9mTv0EovIqH8T5Hpb5HuQDGmhk578LsDSN9EXHXT5mZR
 LOj8XmcpYkttrGw0nqXNkuYrfZSgj15xW0M4iUmSxdnUGmgO/58X9sn2F Q==;
X-CSE-ConnectionGUID: OPjTjDGhTpGXPFZCbF6hBA==
X-CSE-MsgGUID: KrWQY/boQ/ePvhFCdgVM6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38848056"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="38848056"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:53:03 -0800
X-CSE-ConnectionGUID: egZuLOtCRzyeOeCmez5jUw==
X-CSE-MsgGUID: b9JJ6b2pTXuWJSSxngKQ4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="114411540"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 09:53:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 09:53:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 09:53:01 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 09:53:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W8FKPTYXgZN9ilk5Rvmrt8dGhqGd7WdOy+4OEcb9UUz/dclNCbcSAl1b0KT16V9T0BlZqIR3pB4ia5p03jEV2sDjy8l8MBrBAPEx8AYrKqF7TzcJLE/5VipbnQp2vxQAZ1w165WomRyfVSi1KKhwEt3ZUbONlMpIHzh1On01Ete5l+8CL0Ld3+xQ/6jmw2CkZrvFR4wYVFqTUO0wV9fuW1+Jl3BwaCgImF9l70pHzB9eGG1mshsE93zo5oKRFylX2MeghbOzMo/1g/AZNPYXLdtqUmpR/47s3kb+rWPZ39IoO16aJxLSx5afJ2Dz4g7zs3/isZy506E1Vc1IuUaFaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFiPKO29hy08rrBcxd3upXJiIhX+3MteprAaNO2jBNQ=;
 b=pWp3OHTcVRcWg6oLxspPjrJejCYTs4PVtvAKrmi2H6ktA9uJEfTvaNPl0t21nCrdE3hY0JtKN9PTNNpHtOVGqvTZwfTnJuMv253acVD1FbL9t1EKq8fZDtqRFK7FXf8Wfbz3ubN1w67twe9tywDZxKE5+GuIwz+I47vVKJPJASPkgrv3dJZ1nsb2WWClq4IKRfFIviA1BumdahH/Yi44jJj9OAHallbF0/26TVakzTi5KmUKr+Z1qr5QOC6E6faMJrUbR0tX+FgIEylepssYRA0Wgh4/t7gBfWUwuhVMqJcc/+fAFtevZlX7BnU3REd5c7F8+6MQnBotZkFLketFGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB6698.namprd11.prod.outlook.com (2603:10b6:510:1ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 17:52:15 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8398.014; Thu, 30 Jan 2025
 17:52:15 +0000
Date: Thu, 30 Jan 2025 09:52:13 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <vinay.belgaumkar@intel.com>, <soham.purkait@intel.com>, "Himal Prasad
 Ghimiray" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v4 1/8] drm/xe: Add per-engine-class activity support
Message-ID: <Z5u8TUBiDTVoMdyX@orsosgc001>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
 <20250129101653.1976699-2-riana.tauro@intel.com>
 <Z5rHtFUIbLNRfBfk@orsosgc001> <Z5rlgedsHPm6lhSw@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5rlgedsHPm6lhSw@intel.com>
X-ClientProxiedBy: MW4PR03CA0313.namprd03.prod.outlook.com
 (2603:10b6:303:dd::18) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB6698:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f18cecd-3044-4b0d-4bcb-08dd4156d504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUZSLzZHUkVZRXlOdGJZWXlpL0RqRDlCY3hmdWo4Q1ROTWtOZDhFNmdIS2N3?=
 =?utf-8?B?YlVzN09tZUdVc0s1aSs3a2dRVjl6V091Q3F5Y1dyREdja0kxUlRHSUxaMEFQ?=
 =?utf-8?B?RmNWNjBubHNPdGVyaEtOZkxNK3VrTVpqVTh3NWtwUGhTcTdtcWwxZ0NTSFBw?=
 =?utf-8?B?TXF0b0xtYUJLSENJd0o5b243ZzBGTENwOVluRHcxY1Nkd3VnMDRRZGhjbWY1?=
 =?utf-8?B?dzFGaUdjTDZzVHFGZHJFcFA3VlZ4dDloMTMzUFRCZFJ0cyt4dlRLM0J3cWFy?=
 =?utf-8?B?dm9sU2JLZ1QwbTBhUHpCMWl0MFMvN3NKRVRVSUVYakpFaFFtZ1FMK2VXN3F2?=
 =?utf-8?B?RVBoaG1oVDNLaUJDRjFBbFZqY3FxMmhOby9JYjNRdjBhYzJpZVRTeWJCeUdI?=
 =?utf-8?B?RHo3amVTeWc2d1lUSnNIRzZnUmJ3ZEpETWxRdHlUR0RnZWYzcnBIMjhRU2kx?=
 =?utf-8?B?OE1NM1RKd2trcm5kY3dGTEt6Tm9Vb2VuM2k3UmtwU2s3NDRGNHFCbWMwVGNL?=
 =?utf-8?B?RTNjN2MzVVI4eW9vMzF2aWVvaVRVaTRoc1hZUTQ1dGpWWjZxRjlvdGZXMEFP?=
 =?utf-8?B?dWRKR3BsVzJOQU02VmE5S2VuSE5DUEdPYUgvTk5jOGlML2d5SjI4eEdIYUp2?=
 =?utf-8?B?VVpkSUQ4Q1ZKTGJGeWxlTTJWUitQM1VZZUVFNFY1NUk1NEhvRjhKU0wxYlRO?=
 =?utf-8?B?TUJndVB5dmxGT3p1VzM3cnYyNHhxWFoycDRpUFFWcGpEWEVWWGJ2cXZrdWxY?=
 =?utf-8?B?SitldjFsd0lBZjAyNUZCdlVlL2k3WitNYi9Fc1dYWjIvdnByK25vRzdUdjVN?=
 =?utf-8?B?TWp2MllRejB5cUh1S3pzTjFQdGlMRG9Ock43cTh5eUFTajlMR1BmQlJkUXRH?=
 =?utf-8?B?WG9zOU9ucW85alNydnpCOTF4ZXhWOTR6WnNyN1h6a0lUUGJIeU0vOFJQczZh?=
 =?utf-8?B?WUhDalR1RXVRbnRkZ2dHMjQ3bk9YblVxYmxSTFN4MW0vL1JGMnNFYnNrWnJR?=
 =?utf-8?B?Si9wK01OK3BlbUltT21DRTN2MW5WdU1heHlpSGRrblBETCtNSEt5VU5Makdp?=
 =?utf-8?B?NkJsWXdjWThlalpnaE5UK3lsZVJ1eE9tWVIxWnhnZmhsS0hQL055RjR3eHBq?=
 =?utf-8?B?azhMTjNwaGhwaGc1QWRXeWFnamN0R050UnpVZDFZaUpMOU5JM0NqWEd2R1g2?=
 =?utf-8?B?OG5YK0kwUWg2YWhBNThSRy84LzhzalozK1YzaFVnZ29LRnRZdjJXcG5TUUlp?=
 =?utf-8?B?SnZSQmlwUXdPWW52K2w5ckhoc3ZXWXJUK3MveHQreGJHR1FQTHRRUEg4Yk9i?=
 =?utf-8?B?c3lMc3liVlY3TXB2b21iTGxNbGJwQ1g0Y3FFaVM5ek12cE9VZ2E4cGltQ005?=
 =?utf-8?B?NmFBUFdZb1UxY3UxY0lHWWxucDhLdHRSRVF4T2lFbW1BRkdDT0lQVVFSVzZq?=
 =?utf-8?B?QUNZS0VmSU15VWNzMHFreW9XSXd5RXdFTVVkdmIySVJFQUVtaEs0a3h5VzRx?=
 =?utf-8?B?VTMyanMwbDJRL3c1Q01XQmNLM3ZwcTYyQSswT0MzN1EwNXZod3d4bmhWem9w?=
 =?utf-8?B?c21WZlFtMklkUnpiL0lxZjQwL05IcmZBQnFVcElNZE9OUlZDUFkxeHRkNzhV?=
 =?utf-8?B?V1BBMHE0VjZpdHpjY0E3VWhxTWRneDJ2NUI0NzhGUWtSOGhLQkRSOXZBaFhK?=
 =?utf-8?B?MlE2alVNRFVMakt5bE5zTmpUZnJrbkd2ajRJTWZ3L0xJTWhHRVNBQUVsVTJv?=
 =?utf-8?B?ZnM2a1kxWVk1YTJQQTVka1RQZmNHZVZ0SXJMUzlwYmxta2NhWi9pUEF6NkZJ?=
 =?utf-8?B?K09ZbU14cTl1NzNLSk5pempUdVdCL0FTVzg1bTlqSXgyYm5XMW9PTmJ1aVpQ?=
 =?utf-8?Q?+ofu0BDycCZF1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0tGZlkvMXg1MmprRXZUajRXek53azlNbG5BQjdPcUN6SlRobHQ3S0VjdWRj?=
 =?utf-8?B?bm04c20vWnFXQkZWc1lSbVFQamRnT2Z5NTI2dnpGYXF4SFcxTkh5ZDVjTys4?=
 =?utf-8?B?SnEzZ2lGcElTaGoxalk1TzlOM2d1ZjlzdElKdDRPTWVOWHFIbjNwSnpKWXFl?=
 =?utf-8?B?ZzM0R2dvVzVZQkd4MDd1QXFDeXZLTkgxWDc0QmdxdWtoRm5XTzkxcTNFTnJN?=
 =?utf-8?B?T1R0SjZFRHhIb1cybkQ5UjFzeFpnWnhwMU1sampRU1c1UFBsTkRiT1FORHl0?=
 =?utf-8?B?eVZGMWFtMXNYSk9UekxKZEJqMzB1SUR3N2VxMVdWN1BZMmJBZnJ3VWs0anlV?=
 =?utf-8?B?bFJRdDB0Mkl1RmxmcVZ0TTRzWnkwV2MzajJvMG1QWDlnOUdGSk9kU1RhQUxI?=
 =?utf-8?B?N1JyZG5KYlhtS0lTWFRwaFF0aWtIWmFEOEZxVERyTUVDKzlOQSs0RU5kWGU2?=
 =?utf-8?B?VUxRdGc5SWdJQmFlRG1OaVp2eFdRQURFdE5VU1labWl2MFg2Ri9pQmN1VDU0?=
 =?utf-8?B?NkNJR1p0c3RkbXlTdjZ0QmtNeWJqamxUSEdIRzd4amhHNis4R0pMdmdjRHFu?=
 =?utf-8?B?b2UzZ3kvRVRNL1QyM3JSaXAyWnkrMDBaY1J5TWVQTWFlK3JOcldldlpMWE9r?=
 =?utf-8?B?S1BlQkowRktoNUZoWExacFZnMDcrRS9aZWN4MlJRSlgyOS8vdjRsd0dIS2FT?=
 =?utf-8?B?TnJQeDZGak1Oc1VCVXlwMk4zSFZOZ3NFNnhBNExLbVpLMlFHcGd2ekt0QVBE?=
 =?utf-8?B?TFBXRzNIcVdPSWVna3R3c250SnVFc0dSa2ZEY0ZSRnlPY3l4RmNGUUJwbHpU?=
 =?utf-8?B?QVZ1QXZaaHR4VkdwY29XMUVRMVBsaGZZM3E2L25mSHhZTzBDK3orUXZrYkJL?=
 =?utf-8?B?d1cyQzJKN3JDTHJ0NDNqUjZYSzZyWVFqaXBOQkRkM2gzVTBEWlFES1ZrMFM3?=
 =?utf-8?B?djh4eWVab0NEbXNsYUVoM3hRMnB5MzdmeWNxcFlpYmtVVlkxcDU3SzMrMGJi?=
 =?utf-8?B?WG9PbnlDaXkvZlFJZkJwL1g3cldTL3JZejAyOUpybStSeDRXbTR0SzRRdktV?=
 =?utf-8?B?M0ZNa2pBaVRkYmpWM2FFbEJmRnFpVFRoVzVMN0puNS9CancxWXZKeVQ2aXJV?=
 =?utf-8?B?ZWlzY3A3Rkx2YzVXWmV6S0t0N1N1UVRJN2V1dVRRRmdJRjBQSXJsNElDQk15?=
 =?utf-8?B?TDdNZmFxT2U4aE1nUmszdjl6WElIQ1UwNGZwVzZKMDNEcUZYd3R0RTIyZUFB?=
 =?utf-8?B?QUhjdWM2Ymhrd0IxbnJtMkg1dnRoRzF0T2UrN1MwVDRxeEtNVE9FWlhYNW43?=
 =?utf-8?B?ZWN0aDFQMVpDNG9QeUwwb3JJTDJsNzhjV2lsU3ZsWjUvMDNLZkZZTUNReUk4?=
 =?utf-8?B?c3d6dXhtRHFidHZqRlF3bUwrckZqN0dsWmJRNmRVdFI2MmMxZUxUaEUydU45?=
 =?utf-8?B?SzNtZ3BHVlQreS84Y1hiUy8xd29JUWpuTk9Sd1VvM05CWHdlQTN3anNMMk9z?=
 =?utf-8?B?MklodnIyd2pDdTFUbzhyZmxPTlFiUkM5NVgxM1o5UFUwa0Q2ZTlWMXp6YTVF?=
 =?utf-8?B?dmRvU3dsZjVTVzdFTmx3UVR6QkxrcWpIb3VMRVdRL2V3R0oyUGVEK2tFSFlG?=
 =?utf-8?B?VzJDdHdmN1RybSswME9pOUNQNHZqNTJDSXhLKytJb2xZSnN3bkRQZnd2anFH?=
 =?utf-8?B?bG5lNzRsdEoyaEVXdFAyb3ViZU52VUE0WC90dlRmMHQ5MWJ4UmxvQit6bm5r?=
 =?utf-8?B?VndLUlFZWm5RNmp3SXJWcUQzMVc2djMrNkF5N1JMbFo4bkZsREhMSDFyaHps?=
 =?utf-8?B?MHQ5UlRvU01Zc1I2TGdhREZrSFNGRlpNWGR4b0xZc2t1VlAyRmxMZHh2dDkz?=
 =?utf-8?B?UEwxdThzeDdmM0lwUEhrSmR0NXJzQlEzS1dFZS84WjhaYi9CNnR2Tm9IRFBq?=
 =?utf-8?B?dkVHTWFvTWVEQy85T3dBMHU1MkdsWWJkb25uWUZYZmV5Y2M2MHQvdWJZbHpk?=
 =?utf-8?B?TFBubnBqNHVkbklHZHc2NjBBaTMxVnJ6aHRwclVxVVFVYjZlVkRpVjJwTmZ1?=
 =?utf-8?B?N2c0TmI0VGd1OUlBL0NmNHQyeXFDUE5ad3huTUw2U1h2TC8rdVhuaHlnYURM?=
 =?utf-8?B?VHRlekNrcGsxNUUzc0wzMnUzTVdRYkdaQytscVdxeW1lbGJITDJTamQzZTVD?=
 =?utf-8?Q?C/BQSVYRd7Ll1q2jjm39CM0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f18cecd-3044-4b0d-4bcb-08dd4156d504
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 17:52:15.5565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3C7Cr+GbJt9nmyh0NnWffXZ7OQ/oqLDtXQIu9o9CorTH44Qob/LzbthWwwBnCWH3U8HRzF3k9zc1REsyuSE2tTnkd2wBWudM8RHpLLGbRNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6698
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

On Wed, Jan 29, 2025 at 09:35:45PM -0500, Rodrigo Vivi wrote:
>On Wed, Jan 29, 2025 at 04:28:36PM -0800, Umesh Nerlige Ramappa wrote:
>> On Wed, Jan 29, 2025 at 03:46:44PM +0530, Riana Tauro wrote:
>> > GuC provides support to read engine counters to calculate the
>> > engine activity. KMD exposes two counters via the PMU interface to
>> > calculate engine activity
>> >
>> > Engine Active Ticks(engine-active-ticks) - number of active ticks for engine
>> > Engine Total Ticks (engine-total-ticks) - total ticks of engine
>> >
>> > Engine activity percentage can be calculated as below
>> > Engine activity % = (engine active ticks/engine total ticks) * 100.
>> >
>> > v2: fix cosmetic review comments
>> >    add forcewake for gpm_ts (Umesh)
>> >
>> > v3: fix CI hooks error
>> >    change function parameters and unpin bo on error
>> >    of allocate_activity_buffers
>> >    fix kernel-doc (Umesh)
>> >    use engine activity (Umesh, Lucas)
>> >    rename xe_engine_activity to xe_guc_engine_*
>> >    fix commit message to use per-engine class(Lucas)
>> >
>> > v4: remove forcewake as engine is already running
>> >    when reading gpm timestamp
>>
>> + Rodrigo
>>
>> Sorry, I think I mentioned offline that the runtime pm get is sufficient for
>> reading this register, but it's not. It does need a forcewake of the GT
>> domain.  At the same time, we cannot use the xe_force_wake_get because of
>> the lockdep issue you mentioned and also I assume that xe_force_wake_get may
>> sleep and the event may be read from irq context.
>
>I don't understand this statement entirely. force wake get cannot sleep.
>It is based on spin locks. It should not be issuing any lockdep here.
>It is quite simple flow with minimal or none interdependency. Remember
>that in i915 for instance it exists and lives in the middle of every
>mmio read and write call...

Ok, I think I am confusing with the runtime pm get in terms of sleeping.  
I see that the forcewake is just using spinlocks.

Thanks for clarifying.

Umesh
>
>>
>> I would check if we can add a helper xe_force_wake_get_if_active() and just
>> use that to bump up the wakeref.
>
>I would prefer to not complicate things...
>
>>
>> @Rodrigo, @Vinay Any thoughts on this ^ ?
>
>Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>
>>
>> Thanks,
>> Umesh
>>
>> >
>> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> > Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/Makefile                   |   1 +
>> > drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
>> > drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
>> > drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 317 ++++++++++++++++++
>> > drivers/gpu/drm/xe/xe_guc_engine_activity.h   |  18 +
>> > .../gpu/drm/xe/xe_guc_engine_activity_types.h |  89 +++++
>> > drivers/gpu/drm/xe/xe_guc_fwif.h              |  19 ++
>> > drivers/gpu/drm/xe/xe_guc_types.h             |   4 +
>> > 8 files changed, 451 insertions(+)
>> > create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> > create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> > create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>> >
>> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> > index 328aff36831b..7e93461c60bd 100644
>> > --- a/drivers/gpu/drm/xe/Makefile
>> > +++ b/drivers/gpu/drm/xe/Makefile
>> > @@ -33,6 +33,7 @@ xe-y += xe_bb.o \
>> > 	xe_device_sysfs.o \
>> > 	xe_dma_buf.o \
>> > 	xe_drm_client.o \
>> > +	xe_guc_engine_activity.o \
>> > 	xe_exec.o \
>> > 	xe_execlist.o \
>> > 	xe_exec_queue.o \
>> > diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> > index fee385532fb0..ec516e838ee8 100644
>> > --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> > +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> > @@ -140,6 +140,7 @@ enum xe_guc_action {
>> > 	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>> > 	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>> > 	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>> > +	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>> > 	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
>> > 	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
>> > 	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > index 096859072396..124cc398798e 100644
>> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > @@ -358,6 +358,8 @@
>> > #define   RENDER_AWAKE_STATUS			REG_BIT(1)
>> > #define   MEDIA_SLICE0_AWAKE_STATUS		REG_BIT(0)
>> >
>> > +#define MISC_STATUS_0				XE_REG(0xa500)
>> > +
>> > #define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
>> > #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
>> > #define FORCEWAKE_GSC				XE_REG(0xa618)
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> > new file mode 100644
>> > index 000000000000..088209b9c228
>> > --- /dev/null
>> > +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> > @@ -0,0 +1,317 @@
>> > +// SPDX-License-Identifier: MIT
>> > +/*
>> > + * Copyright © 2025 Intel Corporation
>> > + */
>> > +#include "xe_guc_engine_activity.h"
>> > +
>> > +#include "abi/guc_actions_abi.h"
>> > +#include "regs/xe_gt_regs.h"
>> > +
>> > +#include "xe_bo.h"
>> > +#include "xe_force_wake.h"
>> > +#include "xe_gt_printk.h"
>> > +#include "xe_guc.h"
>> > +#include "xe_guc_ct.h"
>> > +#include "xe_hw_engine.h"
>> > +#include "xe_map.h"
>> > +#include "xe_mmio.h"
>> > +
>> > +#define TOTAL_QUANTA 0x8000
>> > +
>> > +static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_engine *hwe)
>> > +{
>> > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> > +	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>> > +	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>> > +	size_t offset = 0;
>> > +
>> > +	offset = offsetof(struct guc_engine_activity_data,
>> > +			  engine_activity[guc_class][hwe->logical_instance]);
>> > +
>> > +	return IOSYS_MAP_INIT_OFFSET(&buffer->activity_bo->vmap, offset);
>> > +}
>> > +
>> > +static struct iosys_map engine_metadata_map(struct xe_guc *guc)
>> > +{
>> > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> > +	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>> > +
>> > +	return buffer->metadata_bo->vmap;
>> > +}
>> > +
>> > +static int allocate_engine_activity_group(struct xe_guc *guc)
>> > +{
>> > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> > +	u32 num_activity_group = 1;
>> > +
>> > +	engine_activity->eag = kmalloc_array(num_activity_group,
>> > +					     sizeof(struct engine_activity_group),
>> > +					     GFP_KERNEL);
>> > +
>> > +	if (!engine_activity->eag)
>> > +		return -ENOMEM;
>> > +
>> > +	memset(engine_activity->eag, 0, num_activity_group * sizeof(struct engine_activity_group));
>> > +	engine_activity->num_activity_group = num_activity_group;
>> > +
>> > +	return 0;
>> > +}
>> > +
>> > +static int allocate_engine_activity_buffers(struct xe_guc *guc,
>> > +					    struct engine_activity_buffer *buffer)
>> > +{
>> > +	u32 metadata_size = sizeof(struct guc_engine_activity_metadata);
>> > +	u32 size = sizeof(struct guc_engine_activity_data);
>> > +	struct xe_gt *gt = guc_to_gt(guc);
>> > +	struct xe_tile *tile = gt_to_tile(gt);
>> > +	struct xe_bo *bo, *metadata_bo;
>> > +
>> > +	metadata_bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, PAGE_ALIGN(metadata_size),
>> > +						   XE_BO_FLAG_SYSTEM |
>> > +						   XE_BO_FLAG_GGTT |
>> > +						   XE_BO_FLAG_GGTT_INVALIDATE);
>> > +	if (IS_ERR(metadata_bo))
>> > +		return PTR_ERR(metadata_bo);
>> > +
>> > +	bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, PAGE_ALIGN(size),
>> > +					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>> > +					  XE_BO_FLAG_GGTT |
>> > +					  XE_BO_FLAG_GGTT_INVALIDATE);
>> > +
>> > +	if (IS_ERR(bo)) {
>> > +		xe_bo_unpin_map_no_vm(metadata_bo);
>> > +		return PTR_ERR(bo);
>> > +	}
>> > +
>> > +	buffer->metadata_bo = metadata_bo;
>> > +	buffer->activity_bo = bo;
>> > +	return 0;
>> > +}
>> > +
>> > +static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
>> > +{
>> > +	struct xe_guc *guc = &hwe->gt->uc.guc;
>> > +	struct engine_activity_group *eag = &guc->engine_activity.eag[0];
>> > +	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>> > +
>> > +	return &eag->engine[guc_class][hwe->logical_instance];
>> > +}
>> > +
>> > +static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 freq)
>> > +{
>> > +	return mul_u64_u32_div(ns, freq, NSEC_PER_SEC);
>> > +}
>> > +
>> > +#define read_engine_activity_record(xe_, map_, field_) \
>> > +	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity, field_)
>> > +
>> > +#define read_metadata_record(xe_, map_, field_) \
>> > +	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity_metadata, field_)
>> > +
>> > +static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>> > +{
>> > +	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>> > +	struct guc_engine_activity *cached_activity = &ea->activity;
>> > +	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>> > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> > +	struct iosys_map activity_map, metadata_map;
>> > +	struct xe_device *xe =  guc_to_xe(guc);
>> > +	struct xe_gt *gt = guc_to_gt(guc);
>> > +	u32 last_update_tick, global_change_num;
>> > +	u64 active_ticks, gpm_ts;
>> > +	u16 change_num;
>> > +
>> > +	activity_map = engine_activity_map(guc, hwe);
>> > +	metadata_map = engine_metadata_map(guc);
>> > +	global_change_num = read_metadata_record(xe, &metadata_map, global_change_num);
>> > +
>> > +	/* GuC has not initialized activity data yet, return 0 */
>> > +	if (!global_change_num)
>> > +		goto update;
>> > +
>> > +	if (global_change_num == cached_metadata->global_change_num)
>> > +		goto update;
>> > +	else
>> > +		cached_metadata->global_change_num = global_change_num;
>> > +
>> > +	change_num = read_engine_activity_record(xe, &activity_map, change_num);
>> > +
>> > +	if (!change_num || change_num == cached_activity->change_num)
>> > +		goto update;
>> > +
>> > +	/* read engine activity values */
>> > +	last_update_tick = read_engine_activity_record(xe, &activity_map, last_update_tick);
>> > +	active_ticks = read_engine_activity_record(xe, &activity_map, active_ticks);
>> > +
>> > +	/* activity calculations */
>> > +	ea->running = !!last_update_tick;
>> > +	ea->total += active_ticks - cached_activity->active_ticks;
>> > +	ea->active = 0;
>> > +
>> > +	/* cache the counter */
>> > +	cached_activity->change_num = change_num;
>> > +	cached_activity->last_update_tick = last_update_tick;
>> > +	cached_activity->active_ticks = active_ticks;
>> > +
>> > +update:
>> > +	if (ea->running) {
>> > +		gpm_ts = xe_mmio_read64_2x32(&gt->mmio, MISC_STATUS_0) >>
>> > +			 engine_activity->gpm_timestamp_shift;
>> > +		ea->active = lower_32_bits(gpm_ts) - cached_activity->last_update_tick;
>> > +	}
>> > +
>> > +	return ea->total + ea->active;
>> > +}
>> > +
>> > +static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>> > +{
>> > +	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>> > +	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>> > +	struct guc_engine_activity *cached_activity = &ea->activity;
>> > +	struct iosys_map activity_map, metadata_map;
>> > +	struct xe_device *xe = guc_to_xe(guc);
>> > +	ktime_t now, cpu_delta;
>> > +	u64 numerator;
>> > +	u16 quanta_ratio;
>> > +
>> > +	activity_map = engine_activity_map(guc, hwe);
>> > +	metadata_map = engine_metadata_map(guc);
>> > +
>> > +	if (!cached_metadata->guc_tsc_frequency_hz)
>> > +		cached_metadata->guc_tsc_frequency_hz = read_metadata_record(xe, &metadata_map,
>> > +									     guc_tsc_frequency_hz);
>> > +
>> > +	quanta_ratio = read_engine_activity_record(xe, &activity_map, quanta_ratio);
>> > +	cached_activity->quanta_ratio = quanta_ratio;
>> > +
>> > +	/* Total ticks calculations */
>> > +	now = ktime_get();
>> > +	cpu_delta = now - ea->last_cpu_ts;
>> > +	ea->last_cpu_ts = now;
>> > +	numerator = (ea->quanta_remainder_ns + cpu_delta) * cached_activity->quanta_ratio;
>> > +	ea->quanta_ns += numerator / TOTAL_QUANTA;
>> > +	ea->quanta_remainder_ns = numerator % TOTAL_QUANTA;
>> > +	ea->quanta = cpu_ns_to_guc_tsc_tick(ea->quanta_ns, cached_metadata->guc_tsc_frequency_hz);
>> > +
>> > +	return ea->quanta;
>> > +}
>> > +
>> > +static int enable_engine_activity_stats(struct xe_guc *guc)
>> > +{
>> > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> > +	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>> > +	u32 metadata_ggtt_addr = xe_bo_ggtt_addr(buffer->metadata_bo);
>> > +	u32 ggtt_addr = xe_bo_ggtt_addr(buffer->activity_bo);
>> > +	int len = 0;
>> > +	u32 action[5];
>> > +
>> > +	action[len++] = XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER;
>> > +	action[len++] = metadata_ggtt_addr;
>> > +	action[len++] = 0;
>> > +	action[len++] = ggtt_addr;
>> > +	action[len++] = 0;
>> > +
>> > +	/* Blocking here to ensure the buffers are ready before reading them */
>> > +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>> > +}
>> > +
>> > +static void engine_activity_set_cpu_ts(struct xe_guc *guc)
>> > +{
>> > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> > +	struct engine_activity_group *eag = &engine_activity->eag[0];
>> > +	int i, j;
>> > +
>> > +	for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
>> > +		for (j = 0; j < GUC_MAX_INSTANCES_PER_CLASS; j++)
>> > +			eag->engine[i][j].last_cpu_ts = ktime_get();
>> > +}
>> > +
>> > +static u32 gpm_timestamp_shift(struct xe_gt *gt)
>> > +{
>> > +	u32 reg;
>> > +
>> > +	reg = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>> > +
>> > +	return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
>> > +}
>> > +
>> > +/**
>> > + * xe_guc_engine_activity_active_ticks - Get engine active ticks
>> > + * @hwe: The hw_engine object
>> > + *
>> > + * Return: accumulated ticks @hwe was active since engine activity stats were enabled.
>> > + */
>> > +u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe)
>> > +{
>> > +	struct xe_guc *guc =  &hwe->gt->uc.guc;
>> > +
>> > +	return get_engine_active_ticks(guc, hwe);
>> > +}
>> > +
>> > +/**
>> > + * xe_guc_engine_activity_total_ticks - Get engine total ticks
>> > + * @hwe: The hw_engine object
>> > + *
>> > + * Return: accumulated quanta of ticks allocated for the engine
>> > + */
>> > +u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe)
>> > +{
>> > +	struct xe_guc *guc =  &hwe->gt->uc.guc;
>> > +
>> > +	return get_engine_total_ticks(guc, hwe);
>> > +}
>> > +
>> > +/**
>> > + * xe_guc_engine_activity_enable_stats - Enable engine activity stats
>> > + * @guc: The GuC object
>> > + *
>> > + * Enable engine activity stats and set initial timestamps
>> > + */
>> > +void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
>> > +{
>> > +	int ret;
>> > +
>> > +	ret = enable_engine_activity_stats(guc);
>> > +	if (ret)
>> > +		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
>> > +	else
>> > +		engine_activity_set_cpu_ts(guc);
>> > +}
>> > +
>> > +static void engine_activity_fini(void *arg)
>> > +{
>> > +	struct xe_guc_engine_activity *engine_activity = arg;
>> > +
>> > +	kfree(engine_activity->eag);
>> > +}
>> > +
>> > +/**
>> > + * xe_guc_engine_activity_init - Initialize the engine activity data
>> > + * @guc: The GuC object
>> > + *
>> > + * Return: 0 on success, negative error code otherwise.
>> > + */
>> > +int xe_guc_engine_activity_init(struct xe_guc *guc)
>> > +{
>> > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> > +	struct xe_gt *gt = guc_to_gt(guc);
>> > +	int ret;
>> > +
>> > +	ret = allocate_engine_activity_group(guc);
>> > +	if (ret) {
>> > +		xe_gt_err(gt, "failed to allocate activity group %d\n", ret);
>> > +		return ret;
>> > +	}
>> > +
>> > +	ret = allocate_engine_activity_buffers(guc, &engine_activity->device_buffer);
>> > +	if (ret) {
>> > +		xe_gt_err(gt, "failed to allocate activity buffers%d\n", ret);
>> > +		kfree(engine_activity->eag);
>> > +		return ret;
>> > +	}
>> > +
>> > +	engine_activity->gpm_timestamp_shift = gpm_timestamp_shift(gt);
>> > +
>> > +	return devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, engine_activity_fini,
>> > +					engine_activity);
>> > +}
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> > new file mode 100644
>> > index 000000000000..c00f3da5513d
>> > --- /dev/null
>> > +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> > @@ -0,0 +1,18 @@
>> > +/* SPDX-License-Identifier: MIT */
>> > +/*
>> > + * Copyright © 2025 Intel Corporation
>> > + */
>> > +
>> > +#ifndef _XE_GUC_ENGINE_ACTIVITY_H_
>> > +#define _XE_GUC_ENGINE_ACTIVITY_H_
>> > +
>> > +#include <linux/types.h>
>> > +
>> > +struct xe_hw_engine;
>> > +struct xe_guc;
>> > +
>> > +int xe_guc_engine_activity_init(struct xe_guc *guc);
>> > +void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
>> > +u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe);
>> > +u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe);
>> > +#endif
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>> > new file mode 100644
>> > index 000000000000..a2ab327d3eec
>> > --- /dev/null
>> > +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>> > @@ -0,0 +1,89 @@
>> > +/* SPDX-License-Identifier: MIT */
>> > +/*
>> > + * Copyright © 2025 Intel Corporation
>> > + */
>> > +
>> > +#ifndef _XE_GUC_ENGINE_ACTIVITY_TYPES_H_
>> > +#define _XE_GUC_ENGINE_ACTIVITY_TYPES_H_
>> > +
>> > +#include <linux/types.h>
>> > +
>> > +#include "xe_guc_fwif.h"
>> > +/**
>> > + * struct engine_activity - Engine specific activity data
>> > + *
>> > + * Contains engine specific activity data and snapshot of the
>> > + * structures from GuC
>> > + */
>> > +struct engine_activity {
>> > +	/** @active: current activity */
>> > +	u64 active;
>> > +
>> > +	/** @last_cpu_ts: cpu timestamp in nsec of previous sample */
>> > +	u64 last_cpu_ts;
>> > +
>> > +	/** @quanta: total quanta used on HW */
>> > +	u64 quanta;
>> > +
>> > +	/** @quanta_ns: total quanta_ns used on HW */
>> > +	u64 quanta_ns;
>> > +
>> > +	/**
>> > +	 * @quanta_remainder_ns: remainder when the CPU time is scaled as
>> > +	 * per the quanta_ratio. This remainder is used in subsequent
>> > +	 * quanta calculations.
>> > +	 */
>> > +	u64 quanta_remainder_ns;
>> > +
>> > +	/** @total: total engine activity */
>> > +	u64 total;
>> > +
>> > +	/** @running: true if engine is running some work */
>> > +	bool running;
>> > +
>> > +	/** @metadata: snapshot of engine activity metadata */
>> > +	struct guc_engine_activity_metadata metadata;
>> > +
>> > +	/** @activity: snapshot of engine activity counter */
>> > +	struct guc_engine_activity activity;
>> > +};
>> > +
>> > +/**
>> > + * struct engine_activity_group - Activity data for all engines
>> > + */
>> > +struct engine_activity_group {
>> > +	/** @engine: engine specific activity data */
>> > +	struct engine_activity engine[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>> > +};
>> > +
>> > +/**
>> > + * struct engine_activity_buffer - engine activity buffers
>> > + *
>> > + * This contains the buffers allocated for metadata and activity data
>> > + */
>> > +struct engine_activity_buffer {
>> > +	/** @activity_bo: object allocated to hold activity data */
>> > +	struct xe_bo *activity_bo;
>> > +
>> > +	/** @metadata_bo: object allocated to hold activity metadata */
>> > +	struct xe_bo *metadata_bo;
>> > +};
>> > +
>> > +/**
>> > + * struct xe_guc_engine_activity - Data used by engine activity implementation
>> > + */
>> > +struct xe_guc_engine_activity {
>> > +	/** @gpm_timestamp_shift: Right shift value for the gpm timestamp */
>> > +	u32 gpm_timestamp_shift;
>> > +
>> > +	/** @num_activity_group: number of activity groups */
>> > +	u32 num_activity_group;
>> > +
>> > +	/** @eag: holds the device level engine activity data */
>> > +	struct engine_activity_group *eag;
>> > +
>> > +	/** @device_buffer: buffer object for global engine activity */
>> > +	struct engine_activity_buffer device_buffer;
>> > +};
>> > +#endif
>> > +
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> > index 057153f89b30..6f57578b07cb 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> > +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> > @@ -208,6 +208,25 @@ struct guc_engine_usage {
>> > 	struct guc_engine_usage_record engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>> > } __packed;
>> >
>> > +/* Engine Activity stats */
>> > +struct guc_engine_activity {
>> > +	u16 change_num;
>> > +	u16 quanta_ratio;
>> > +	u32 last_update_tick;
>> > +	u64 active_ticks;
>> > +} __packed;
>> > +
>> > +struct guc_engine_activity_data {
>> > +	struct guc_engine_activity engine_activity[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>> > +} __packed;
>> > +
>> > +struct guc_engine_activity_metadata {
>> > +	u32 guc_tsc_frequency_hz;
>> > +	u32 lag_latency_usec;
>> > +	u32 global_change_num;
>> > +	u32 reserved;
>> > +} __packed;
>> > +
>> > /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
>> > enum xe_guc_recv_message {
>> > 	XE_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
>> > index 573aa6308380..63bac64429a5 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_types.h
>> > +++ b/drivers/gpu/drm/xe/xe_guc_types.h
>> > @@ -13,6 +13,7 @@
>> > #include "xe_guc_ads_types.h"
>> > #include "xe_guc_buf_types.h"
>> > #include "xe_guc_ct_types.h"
>> > +#include "xe_guc_engine_activity_types.h"
>> > #include "xe_guc_fwif.h"
>> > #include "xe_guc_log_types.h"
>> > #include "xe_guc_pc_types.h"
>> > @@ -103,6 +104,9 @@ struct xe_guc {
>> > 	/** @relay: GuC Relay Communication used in SR-IOV */
>> > 	struct xe_guc_relay relay;
>> >
>> > +	/** @engine_activity: Device specific engine activity */
>> > +	struct xe_guc_engine_activity engine_activity;
>> > +
>> > 	/**
>> > 	 * @notify_reg: Register which is written to notify GuC of H2G messages
>> > 	 */
>> > --
>> > 2.47.1
>> >
