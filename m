Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C4DCAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 04:06:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9ED910E637;
	Thu, 18 Sep 2025 04:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FUXRvZMA";
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KjiPj8Na";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B8A10E635
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 04:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758168395; x=1789704395;
 h=resent-from:resent-date:resent-message-id:resent-to:from:
 to:cc:subject:date:message-id:in-reply-to:references:
 list-id:list-subscribe:list-unsubscribe:
 content-transfer-encoding:mime-version;
 bh=NxoPBqAMMTtD++6yxRbH1kmeEbtwYAd56gvAqdZ/Ybk=;
 b=FUXRvZMAQt8EU4YK3WqqrzNlo4OcOW7B0q+h6DIPUS3+usG0yh8GFghr
 B47fE0nJd1FyTyBPtCAK6eCJOZHa4f6SvTgv8RSP5FrMlurS86pZKKouD
 QpGDjxAzq5wN0U/wd2SRpJi9V6Bt2h1SRk2cguICYu/SsVhkAtZ9Jj2qC
 15zeEsy5fJ8Ar/Z6n2/Dyy3cF0JgF9DYKuPS5jvc4H/nxpC4EKD0UGTzA
 s+WEkumugtkGow6eJHw04WhgZO+Et1qEuoJq0i2ikIhkPEhoHdGsXczxG
 PDe35qUtk+KZ6q24eYG84hmlsG+K7r4HrIXLYSHdLMxXOSVHcyCLfa/qa Q==;
X-CSE-ConnectionGUID: Vy3Ri8JySy2rLrTXultzgg==
X-CSE-MsgGUID: ecV1Ctp5QsmE3v1mIVkB9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="77924728"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="77924728"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 21:06:34 -0700
X-CSE-ConnectionGUID: 5VeAseidSZmAGggWDvKujQ==
X-CSE-MsgGUID: 34S0y21PQ2+mA5d4/6wzuA==
X-ExtLoopCount2: 2 from 10.22.229.23
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="174542655"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 21:06:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 21:06:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 21:06:34 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 21:06:33 -0700
Authentication-Results: dkim=error (no key for signature)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4960.namprd11.prod.outlook.com (2603:10b6:a03:2ac::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Thu, 18 Sep
 2025 04:06:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 04:06:26 +0000
Resent-From: Lucas De Marchi <lucas.demarchi@intel.com>
Resent-Date: Wed, 17 Sep 2025 23:06:24 -0500
Resent-Message-ID: <ptklpvt62yujhgonhba2ghm27i3txc2ueidbggye66b6xrtpgz@co6s2p255b62>
Resent-To: <intel-xe@lists.freedesktop.org>
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=198.175.65.18
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1758145077; cv=none;
 b=OLhWX0gA3jHqwPhq3PjejgqZfqg5QPU6yk9gmc1tG8UMWWqFEv3vPBpmICOCTGH75yrAsO3Rqdko/LpT3ApHmPct/1GtuZVSZv6HFKB687Ffwra2ETgH7vgntsPcQmgqEuFQv5MOTgpaAssSA55sdNJgCAgcWVibQcYXBZ6M0oc=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1758145077; c=relaxed/simple;
 bh=NxoPBqAMMTtD++6yxRbH1kmeEbtwYAd56gvAqdZ/Ybk=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=SNCH+WOk7T0+/Nu2FatxfEiwt2EmmUEcjuMls0EPabmLvi0+h8FvahckKkvxzD4cu4nf+K3fJ2Y7AQ+/LQOBkm68Yi+08Zb7oIe/+EkOpM4irq3foz/jxaL+HeaBIhKH+X8i8U1cMC3w077MuvztJqIbf6ZpLA/LtVBNZgBhUJE=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none) header.from=intel.com;
 spf=pass smtp.mailfrom=intel.com;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b=KjiPj8Na; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org;
 spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KjiPj8Na"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758145075; x=1789681075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NxoPBqAMMTtD++6yxRbH1kmeEbtwYAd56gvAqdZ/Ybk=;
 b=KjiPj8NaAdezWFdFFLlPInFVc72yZMGHVhJxOAuLPVf4oSZ4O7V/jdmz
 4gddoN1kTQrJuJFhgEKKrMWwgQDaqWuksmTnqnVm9dDrWGRjY65eamYtv
 NvGbekFJfuabzIqLUeB8TZlQpmzieMmJcL7aNsMgLFLA95uNOcV3Swn++
 i4t+5gbq8e7OMH6d9dpQZnxclu1mTk/10C6grOVYcIdueWNmXRrmE8+fD
 vy9OVSoj1HNTl2PsZyOzbCG+kerXYvvPbkqPgruNPRkdcb81BBoIbaksx
 HKTZiAiatwW+N89PYIs1iecHZMMwHelS+qukXMW890xW0jss27Z6dnsEb w==;
X-CSE-ConnectionGUID: gqUIUYUVT9e0r5VxpK+3qQ==
X-CSE-MsgGUID: 4or4PML9Sni8FE4uzfF11g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60522749"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60522749"
X-CSE-ConnectionGUID: 22efr6U7TMOuU3Q6qFAiMQ==
X-CSE-MsgGUID: QrgrSi3nRKi7W76cavP4BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; d="scan'208";a="179643057"
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH 2/3] drm/xe: Move rebar to be done earlier
Date: Wed, 17 Sep 2025 14:37:31 -0700
Message-ID: <20250917-xe-pci-rebar-2-v1-2-005daa7c19be@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250917-xe-pci-rebar-2-v1-0-005daa7c19be@intel.com>
References: <20250917-xe-pci-rebar-2-v1-0-005daa7c19be@intel.com>
Precedence: bulk
X-Mailing-List: stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:a03:217::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4960:EE_
X-MS-Office365-Filtering-Correlation-Id: b9e60927-fe88-46c5-72df-08ddf668bc9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|4022899009;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2ZiMFhvcVlJWFEvNnNCZXQ0OWZXbytwTWx6Y3lTU1Y2MHphUVFuczdaK2NY?=
 =?utf-8?B?LzU5SUMrbWN5anI3anprOHRJUjRtcm9yamJ3TVkxN2NmTE1sS1I4SUUvSDJ5?=
 =?utf-8?B?VjJPUlRrcGFuZEs2ai9iTzV0THVmTXlkS1dTZlpwVzRGQ2RiT1F2N1NTekNB?=
 =?utf-8?B?NGkyM05xRllzd2kybU1FNUF6VjlSVE51Y05XaWlvWUJlaW5xT1ZpR2RPQ3ph?=
 =?utf-8?B?VnVsWXhnem1XODNUN2pQR0hBSDk1ZkhBTCsyYWs5empxU0FiOGRwR2laSkN3?=
 =?utf-8?B?L1U1RjI0VGdRT09TRi9vZFd4MDRhUUU5empSUElDK2g3Q2pOcE1nZHR0ZFpu?=
 =?utf-8?B?TVNKcHQvSmJlN2hoMnBLYnIvMVdGdjdqOHdsNjJWZll3UG5tVG0zOHRsczVN?=
 =?utf-8?B?UlU1bWI3RkNzOExrcUhRaWxaWVdsNlBNVHhiZmx3QWRWckhlNWRCdzRqbGNF?=
 =?utf-8?B?djlEUDR2YmZXaW9IaUh0blJ4YThGSHhIK0ZESEp1YzRESlFiREtYNEdWMllE?=
 =?utf-8?B?SE03SGhOUmIxNHo1OXN6dFV6Z2hYbEdSTTdWOEplSVhoMktEYUthRlNxWldF?=
 =?utf-8?B?UzhjOXhTSFp5dmplZVhHODNiMmRGbWRNNWUyblFFanZtTFZtR1NQR1E0YlpL?=
 =?utf-8?B?TDVzdUJJSnEyRVI3d2MzZHdzdXJ5RFZ5UDZ0QkgxRlQ1a05BWnpuZW1FQXpn?=
 =?utf-8?B?Y3ZhL2RCWjdkRE9mMHlLM3FDalFCOTJRLzJPM0lESWhqZms5d0xOU0lYcFRp?=
 =?utf-8?B?T3c1bEVGa05LazZ3TzZiejQySFZwTWUzVHAxdzc1Y1QxalBFMmcxNzJsOExP?=
 =?utf-8?B?OG5sS1JTRnJMYjBjdTBuT1FjVTFxSitjaTV4TFp6U21nSVFFMm9YMDQ5ZUQy?=
 =?utf-8?B?dWJhekVwellBWWFkbHpZNmhTNzZTZDJqQytkdGNieVJQWGhaMGpTb21sbGlT?=
 =?utf-8?B?Z29IdHdCOGhsQ1hVbnkxdE5jc2FJS0VSYlB5TkdPR2duNG9lTmJ3NE9HK3NM?=
 =?utf-8?B?WWdLRUpVekxnaC83SXlwd0o4SnM1Z0EzMVd6bXM3V2I1c2RWS2N3YnpvMEt5?=
 =?utf-8?B?dmUrbTNIMlZEcDRlazNwNDRlOU40RUQ4Q0JsZUdQM1N2S3NnWWpHRWh3ODdE?=
 =?utf-8?B?SWlkMmUyOERScVR2ZEF0VlFEMVhqQWdNWE40akJxdXB1YVdxcllRcXlvZzYy?=
 =?utf-8?B?THlpS3VvTXpURFdVdjUxaGFRc0JJcWV0QkJwaHZhcUFSaStMeW94SzJBb0do?=
 =?utf-8?B?SUszbjdjWGVjcDNoQzJkOGVkczl4aGUwTGxZS1pRZjBIK0JPRDFxakdTTGRs?=
 =?utf-8?B?ZVlkaVNUR0JZT2ZnYnRvc2I3Y1ZYeHZSY25FY3lwOUE3amFCM2N1SjdPcFIy?=
 =?utf-8?B?QUtUL0V3V1p5K1o2cnRYdEN6OThBOWp1bUs3YUJxbTdlREJ5T1d6SzNVZTds?=
 =?utf-8?B?Wk9FQWo2QWZaeFFIcFlGTkh5dU5GaE5WeDg2TEJDMWJxKytOMnVpd0ltdkNr?=
 =?utf-8?B?M0xyKzJwTWFEYUJNOUx6TzlpZ3E2SllJcmNsVUllR2g3RFk5c2JOYjBwUk1w?=
 =?utf-8?B?MGZ0WFVVYnB2cDVGNVoyUE15Z2Z1VUtNd0Y4RFBMdWZ5K3VIYnpLamo3TE80?=
 =?utf-8?B?b2gxSE8zS1JXTTJnaHFRL2J2b2F5aDd3YnA0K1kreTc0QTF4MGk1bmlIdWJ2?=
 =?utf-8?B?Tm91M2o3dWwrMGg2UDYrcDJtZTlBTlVOQ3dPdzc5b2x1WTFUTUc1RmVzMHNV?=
 =?utf-8?B?UzArTmhMdHB0Qlcwc21HdUo5TGtsWEJkRFlHMitKcjNSV2NmQUVHSUtZSjZo?=
 =?utf-8?B?WGUzcGF2YW9iZnVsWDNpRTdSMjJIRU9YVnZSTHBNZ1Q5VGxBMncxdlphUk5o?=
 =?utf-8?B?Z3J5elhvbjFaem1DdEVQcE1Gc0IraUJJSW0xM1NNNHNQQjJ0ZEZvRXI0VjU3?=
 =?utf-8?Q?4RKY//FN8Ow=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(4022899009); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDF2N2JlMlh2WWhEM0ZPdDhtQjhMS3ZUbDIyZko3b0tMUFNBWlRiSW5RMVVm?=
 =?utf-8?B?OHpCdlVMelhrcW83eG1tWkE0Z2NCK2Z2bzl5Z2FNREhqdThZTnFud25Ddktz?=
 =?utf-8?B?TEI1RHVSSUtheURYeXpMRjRIa3dtc0JCVnJuYnlEL05wNWRxdnVpRjcrbUJS?=
 =?utf-8?B?YnpmUDhMR2tmWFBHYk5PenFiUHhmWFlnRHNFQTQ0VnJBakR6SWdsYXlzWkJz?=
 =?utf-8?B?c1l3a1c3SHhGYkdobGkvdzNmZnJDbi9maFdRRWRRNmttdk1zdjdEaHN0YVZG?=
 =?utf-8?B?NGoxRTlGYTdQaHFNMmE0ME83SFlZck9lYkFrcE9NTW04TG1MQldFeW9QYktH?=
 =?utf-8?B?biszWmtkZmNMK3daS1J5cjMxaVp3NlJLVTdFOG1wcXNjTVFrcENxbHRKSCsx?=
 =?utf-8?B?U1hjVVdjczE4U2dncXFaUEFtZk5yMkgyTEFpR3M0bGkrREtqRE1heUhXWnRQ?=
 =?utf-8?B?aXNKSVc0L25rU1F4QjdtdlhzK1J5NVBEUGc1c1FrSUE0RUxLQkFRTHlhNjJ3?=
 =?utf-8?B?TEIyeXNBaXVCc2NVK0ZIRnZIODU1cTN2U0JoVGk5bC95UnlNT1NlR2JnTG5Z?=
 =?utf-8?B?ZkxablR4OVMweHRZdWJVRmRrckZxdUtaRitIWUpsQS8wc2VWcTB4SEdmb1pB?=
 =?utf-8?B?d3V4T2dDQVVXdDBuRWxoWGQ4Z25zam5KbTJlMkJlMk9XQjlsR0RrNEV5N2ZM?=
 =?utf-8?B?VUVzMzB6RjBMMTQrWTlndWZXUCsxRkNvVFVrcHA2RFgzNTVtZTViVnpvNERa?=
 =?utf-8?B?U3llY3RqU1B5b1FxNG1PNTEwSVpMbWlrT2gzQTlUOExXelZ6QWFBOEltTFN2?=
 =?utf-8?B?Nzl1S2FlRmdkanJseFJMaGZMNUxCc3Nqd1NBck9WbmJuWDhvYlVEQVdrbTE3?=
 =?utf-8?B?cjhvVkU4YWYvRCtGaWhJZWNabi92Z2hqSlNyWnJSendlYXBzTFNrUEFqSmZZ?=
 =?utf-8?B?U29ER3JIRzAxMFA3ZVMyRTExa0ZtY1hkR0QyQlVFWHIzVjB1Y3JFZzE1NjVS?=
 =?utf-8?B?a1cyc0gzWEFIMVJ6bmpFdDBhVGVjSUo4akxzRzEyZm5BTlRyRUlsRFhpWkpw?=
 =?utf-8?B?MmVEOCtraFhWK1ZTWE5nZFllZlpNMUQvems3dWMvdXlHcm00V3FocHAwRk5w?=
 =?utf-8?B?S0NKU3J6WjY1RjlvcWxReUVWWmxwK05VeWtBMGZObk05bDF4RWlaaSs4dHJi?=
 =?utf-8?B?WWRralp2NzVOVHdkSWJ4ZG05Ny8wVm5SWDJWeXloV2RMOWFzN2lHaUdKZXNI?=
 =?utf-8?B?ZE4yd0FtelJoemxLdlVhVitoMnI1SU93SnBHMnNPb0hTSkxQNDJtS1pGMUIv?=
 =?utf-8?B?SEk1WGlIelRCbXhtZ0s2OVpmclpDOTJtNlZYT3Q4Kzl4eGU2bGhNd0wza0NS?=
 =?utf-8?B?b1MxZFpXMUtuRU1rYlJsTThkamJnY0dtOHhOc0JWcDlYeVd2Q0Q3UGloQ0NP?=
 =?utf-8?B?bjdSSHFZRlVWYUUzOUw2b3JIWGk5N1BOZW41TlRRL2dSbjNBSXF2b1FUOHFl?=
 =?utf-8?B?Q1NGZVIxcFgxZUVXdi90RWV4dUNOekltaE95RGxMbGtrMXUrOHQvazlManZ5?=
 =?utf-8?B?YVJTK2swNmJ0dER3elBwd1B0ZjBxOGwybFZ4cjNTeVI2V0cwVm1KK3k0UUhv?=
 =?utf-8?B?cmlFOGtYanZSS1MrMSthbmdHSVlrWDBRRTVJdXdhZWxtNnZYV0syS25ocXBQ?=
 =?utf-8?B?NlJSR1lCNzZ0VVRZU29BNVMrYi94Y21IZ1p1LzJYLzZjVFZjUG9oM2x6RENQ?=
 =?utf-8?B?QlRvZWZSNFNNR3VhSGJFaWxNdnZYdUliU2JQN09YaUswRHhRUWhvU0NCSkhI?=
 =?utf-8?B?KzhCeERVTU9zUkl0RGk4WmNJWDh3V2pyUG4yY3RzWUQvWm5waTFkZkNESkgz?=
 =?utf-8?B?THhJTlZ1cXAwTWo2cmoyc3YycGY4alQvTDZETG1zN2tlZHNSMStySnU2aUZo?=
 =?utf-8?B?TUd4R0pNWldFWU5PN0gxY2FJYWExemg2WHE3dTQ2RGtJUnBJOTJ2Z2w4OXBV?=
 =?utf-8?B?b01wSld0SHpRVTZocTUrTkNnaGJPNmZWZ0RPNHpGN1QzY0ZPSHJiYzk1dmZX?=
 =?utf-8?B?enFhK3BWNlp0Y1A0eDY3M0h2b3lzMmFMMmVjdWs3aXFvWlJBWlRIdkZzNVJD?=
 =?utf-8?B?QnA3TkY3Wm1IcktwdXJheWtYODFQN1hjQ0h0UFNqVnFFRzJTNFA3eHFVZ0dX?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e60927-fe88-46c5-72df-08ddf668bc9a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 04:06:25.9337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K2OyrfjRTFMCgL7TDD4bcwegPsAvg9DeUESA07wAtl1ltP91jvtFRbm9dtDHTmPoCJ0ayYzSKJ8BESVpv25JlP8S4QI/vABabWBaLvPS/Bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4960
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

There may be cases in which the BAR0 also needs to move to accommodate
the bigger BAR2. However if it's not released, the BAR2 resize fails.
During the vram probe it can't be released as it's already in use by
xe_mmio for early register access.

Add a new function in xe_vram and let xe_pci call it directly before
even early device probe. This allows the BAR2 to resize in cases BAR0
also needs to move:

	[] xe 0000:03:00.0: vgaarb: deactivate vga console
	[] xe 0000:03:00.0: [drm] Attempting to resize bar from 8192MiB -> 16384MiB
	[] xe 0000:03:00.0: BAR 0 [mem 0x83000000-0x83ffffff 64bit]: releasing
	[] xe 0000:03:00.0: BAR 2 [mem 0x4000000000-0x41ffffffff 64bit pref]: releasing
	[] pcieport 0000:02:01.0: bridge window [mem 0x4000000000-0x41ffffffff 64bit pref]: releasing
	[] pcieport 0000:01:00.0: bridge window [mem 0x4000000000-0x41ffffffff 64bit pref]: releasing
	[] pcieport 0000:01:00.0: bridge window [mem 0x4000000000-0x43ffffffff 64bit pref]: assigned
	[] pcieport 0000:02:01.0: bridge window [mem 0x4000000000-0x43ffffffff 64bit pref]: assigned
	[] xe 0000:03:00.0: BAR 2 [mem 0x4000000000-0x43ffffffff 64bit pref]: assigned
	[] xe 0000:03:00.0: BAR 0 [mem 0x83000000-0x83ffffff 64bit]: assigned
	[] pcieport 0000:00:01.0: PCI bridge to [bus 01-04]
	[] pcieport 0000:00:01.0:   bridge window [mem 0x83000000-0x840fffff]
	[] pcieport 0000:00:01.0:   bridge window [mem 0x4000000000-0x44007fffff 64bit pref]
	[] pcieport 0000:01:00.0: PCI bridge to [bus 02-04]
	[] pcieport 0000:01:00.0:   bridge window [mem 0x83000000-0x840fffff]
	[] pcieport 0000:01:00.0:   bridge window [mem 0x4000000000-0x43ffffffff 64bit pref]
	[] pcieport 0000:02:01.0: PCI bridge to [bus 03]
	[] pcieport 0000:02:01.0:   bridge window [mem 0x83000000-0x83ffffff]
	[] pcieport 0000:02:01.0:   bridge window [mem 0x4000000000-0x43ffffffff 64bit pref]
	[] xe 0000:03:00.0: [drm] BAR2 resized to 16384M
	[] xe 0000:03:00.0: [drm:xe_pci_probe [xe]] BATTLEMAGE  e221:0000 dgfx:1 gfx:Xe2_HPG (20.02) ...

As shown above, it happens even before we try to read any register for
platform identification.

All the rebar logic is more pci-specific than xe-specific and can be
done very early in the probe sequence. In future it would be good to
move it out of xe_vram.c, but this refactor is left for later.

Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: <stable@vger.kernel.org> # 6.12+
Link: https://lore.kernel.org/intel-xe/fafda2a3-fc63-ce97-d22b-803f771a4d19@linux.intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c  |  2 ++
 drivers/gpu/drm/xe/xe_vram.c | 22 ++++++++++++++--------
 drivers/gpu/drm/xe/xe_vram.h |  1 +
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 701ba9baa9d7e..1f4120b535137 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -866,6 +866,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		return err;
 
+	xe_vram_resize_bar(xe);
+
 	err = xe_device_probe_early(xe);
 	/*
 	 * In Boot Survivability mode, no drm card is exposed and driver
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index b44ebf50fedbb..4fb5a8426531a 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -26,15 +26,23 @@
 
 #define BAR_SIZE_SHIFT 20
 
-static void
-_resize_bar(struct xe_device *xe, int resno, resource_size_t size)
+static void release_bars(struct pci_dev *pdev)
+{
+	int resno;
+
+	for (resno = PCI_STD_RESOURCES; resno < PCI_STD_RESOURCE_END; resno++) {
+		if (pci_resource_len(pdev, resno))
+			pci_release_resource(pdev, resno);
+	}
+}
+
+static void resize_bar(struct xe_device *xe, int resno, resource_size_t size)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	int bar_size = pci_rebar_bytes_to_size(size);
 	int ret;
 
-	if (pci_resource_len(pdev, resno))
-		pci_release_resource(pdev, resno);
+	release_bars(pdev);
 
 	ret = pci_resize_resource(pdev, resno, bar_size);
 	if (ret) {
@@ -50,7 +58,7 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
  * if force_vram_bar_size is set, attempt to set to the requested size
  * else set to maximum possible size
  */
-static void resize_vram_bar(struct xe_device *xe)
+void xe_vram_resize_bar(struct xe_device *xe)
 {
 	int force_vram_bar_size = xe_modparam.force_vram_bar_size;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -119,7 +127,7 @@ static void resize_vram_bar(struct xe_device *xe)
 	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
 	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd & ~PCI_COMMAND_MEMORY);
 
-	_resize_bar(xe, LMEM_BAR, rebar_size);
+	resize_bar(xe, LMEM_BAR, rebar_size);
 
 	pci_assign_unassigned_bus_resources(pdev->bus);
 	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
@@ -148,8 +156,6 @@ static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *
 		return -ENXIO;
 	}
 
-	resize_vram_bar(xe);
-
 	lmem_bar->io_start = pci_resource_start(pdev, LMEM_BAR);
 	lmem_bar->io_size = pci_resource_len(pdev, LMEM_BAR);
 	if (!lmem_bar->io_size)
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index 72860f714fc66..13505cfb184dc 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -11,6 +11,7 @@
 struct xe_device;
 struct xe_vram_region;
 
+void xe_vram_resize_bar(struct xe_device *xe);
 int xe_vram_probe(struct xe_device *xe);
 
 struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);

-- 
2.50.1

