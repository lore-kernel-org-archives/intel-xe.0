Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EA0E87829
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 13:46:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750BA10E65F;
	Tue,  3 Feb 2026 13:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XZuHlTL7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8DBE10E659
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 13:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770126383; x=1801662383;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=k4V8GtxpBs9X5cWQkC7ditHgY94Zd2Yfwphnmx0qedw=;
 b=XZuHlTL7JrSncsKmgccQbx4vtEidI/H5TKCpOAfpkanrsFtKXMb2+dsa
 T7E3LQpFjUWxgCgJqNR0t112dZpt2FlBI5BT80t+9DIiYA1r+vicXyeDO
 J0oDViIJEsPgED2X7PI3ywal4g0QmDyZLgxP96rbgzHKsYT8DoUDrEyAz
 NuveZ1WiGkanErIZTfwMm2FfP1t96PM2qdvZvTT9Xnt42Zystd5aQPBVY
 zi6nID1NNis8k283k7HV8eYOivPW/hFgUoqSEK9S+JwxXsR6pYQmrGiPe
 q75TkQ19tjCyjFraMmCaGV7R9/GaWLZzcOZLy4nrKkZXrixT3tq2weaGu Q==;
X-CSE-ConnectionGUID: yLeRrlqTRietGbGLI96tIQ==
X-CSE-MsgGUID: gvuTSr1XTjiENZpZDtWntQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82721770"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="82721770"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 05:46:22 -0800
X-CSE-ConnectionGUID: z9tx/CkkRjifaau9CD31bw==
X-CSE-MsgGUID: UMcqT/aXT3CQtcqVWXFN8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="209965178"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 05:46:22 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 05:46:21 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 3 Feb 2026 05:46:21 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 05:46:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FG6mrJerMWQlF5LMluMIJ6pIqSg0sa4jVYKQRDwMhD8GlPHTelVeCZs5EaLM0+RQJ8erTUR8yyOsvugGhxD3scZWgZQg4s4sFgeUjr1b9hPrcZ4Atx8S71qP7GMGgzEo34TTvYR9RfUMDHPYBWgjFNBQRhRWip9mdUkSUb23ia0ejo+6mFQr35XRD1jfn7JCE68HJynrNfeqhQig2+WLJjTgVy0LXi+0V4fSm3ZBrD0Tn1KzJrhBYjdVOPOlX9ScPXxY+JToz8k4AFW6sSaYjqCJoAfmxZhzG0T2/9yZU0YeIRNzLFr+xCi0vqx9ylJVn7w3oKTwnVe0bl0MYg671w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DowiJ+ctjsX5Zz+E3L+seuOBMosuNSTgDx6cP3MNYzI=;
 b=aa+jHS37xpPDU57g6fZn4JtlbnaXFwuWQJTihk0dI9nrgDxWc/6BhjO+wdDDnIn5iQW2CTlYDphnDdtWSLGANvmRTwjFUpCVvgWL744GFK+T5Ty5xK1tsqKHh++zyTAIFx9LaXQzaZENRlnkDGLhsz53e5PIJZGDtcZ8XXg8JFiNF4EHFjx8Ls3cZT0wH06DZ8KfVv874sw6UmrkkDLh8/GSBVf6PSvCTAhlssxgOrZ3GX6a8t4P8yytCMAaO5nH/uvtpTMZcR0q7i7DMaP831EEjAW2faE7AQY2+dZUa4IERUr2itWmxpCZMWPG5eAdUsZRGR75beNi+kMnPn5H2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by IA1PR11MB6172.namprd11.prod.outlook.com (2603:10b6:208:3e8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 13:46:18 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 13:46:17 +0000
Date: Tue, 3 Feb 2026 19:16:08 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Alexander Usyskin <alexander.usyskin@intel.com>, Shuicheng Lin
 <shuicheng.lin@intel.com>, Soham Purkait <soham.purkait@intel.com>
Subject: Re: [PATCH v2] drm/xe/cri: Add check to verify if CSC is a PCIe
 endpoint
Message-ID: <aYH8IOX_kv2_7xxz@bvivekan-mob1>
References: <20260202165351.2020699-2-balasubramani.vivekanandan@intel.com>
 <debe7ede-51ac-490d-8e3d-ac10a69a591f@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <debe7ede-51ac-490d-8e3d-ac10a69a591f@intel.com>
X-ClientProxiedBy: MA5PR01CA0173.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::7) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|IA1PR11MB6172:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cadfde8-c930-4d34-5844-08de632a9b16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmJWRVoyNFd2eDJvOXY0YkhWRDNjRHhxVkZNSm5DVFh6TG1wUC8xYVhJWVow?=
 =?utf-8?B?bnUvdU1EczdxYjBFRVJ0clQvUDdQbFhucWRBTUtTcUpKQlNFcG1XV2RReWJj?=
 =?utf-8?B?UzQ1bm1GaElMRmNhVG1lRUxKdmFqYjI1dHhZS2t6SmlQR2w0S0p4d29QN2dn?=
 =?utf-8?B?dTR0WmZETTVKMHhRVFBUTW1wV3kxb29VdkU5MUVnbEhtcld4WFpJWFJzbVk3?=
 =?utf-8?B?blNXdmRDa3VkMXZ4d0JzSnZNQjhVUXF6UFJSZXIwWVRLS2VXMGhOVHZnV3pl?=
 =?utf-8?B?c1JrektpNnRjN0NsL3JleEg2NDFGUExkcG5MSHJUb1B1MUZFYlpjR2g4eGFu?=
 =?utf-8?B?ZHI4alJQaXVEVlJzSVVML013V0pWQTRDU0tXY3ZsZTNXM04wUTc3VUpFdTFP?=
 =?utf-8?B?WUFnUnk5QnRkNUN2c1prQmc5VXFjVnozZ0pYQzAyU3FvWEhMRHc2c01rS29j?=
 =?utf-8?B?M1FOM2E5RXNBT29lZ2FadkxHRVFpbHQwVDJCNEhzM0RhL0pMTW1IeDRCWHgr?=
 =?utf-8?B?UjNkNm5sRVMxQ0FYd3ZleVVhNWI3dFV1eFNVd3c4RTQwUi82SitzZGhxYlNJ?=
 =?utf-8?B?WFl4d0g4NW5TYkhiODJkVldDWVNLaFFxbE1uRVdYWmIyaVRqd3FUdjZwaGVE?=
 =?utf-8?B?eXc0eHBLbkxYMlN4emxoRlJTRm1GODJYMi9WUmRORXI5Rnl6TTk0eldwNWtS?=
 =?utf-8?B?QVFrS1oraGk0eVdReWNSa2dJa0pzSkl6eXlXUVV1MnlkVlVOTk8rbTNKREhK?=
 =?utf-8?B?Wm1SNDg0aGdwTTAwQjlKYnBYVkRvd1R4NjJoMmVDQS95OTVSeEFoL1JVQ0wx?=
 =?utf-8?B?Z280RC9zZ3JaT1VGUVlHMVR3V28wbXQvaERRVW9lTWRHY3ZCcUJUOW5uWkJ1?=
 =?utf-8?B?S2NDY25tUWVsemtMZWlDWm51QXY2UkFsK0Q0Q1pEZzFlU25qN2VGTURjRC8w?=
 =?utf-8?B?SlJCd2VZQ01peUxjcVN2VDhaaGgvcDJxTGpNakFOd1pQRm10a1VPRDlBejhL?=
 =?utf-8?B?N0NaTE1TOHNSWW0rWVUzeFU1Z2Q3R2NiQWJKNW83YWpCQ1NGczhpNXRzYyt3?=
 =?utf-8?B?elJ2c1hjNlF4SVNVeVlVZStzdDhwSHdKSnE4dmdWQ2drYWgxdFVhRTlVMWxT?=
 =?utf-8?B?amxlQUJNYml1NFFqcFpXRC9rVDNoSm0rRDNXWjltY21CNUt1Z0pPdVIyblZw?=
 =?utf-8?B?UHYzOXc4TjZTRmdEOE8wSFV6U2tQcFMxTXNmcFhYYXF4b2g3SHF4akRBcUZ1?=
 =?utf-8?B?TGtkNVJvLytIdjFEMWRZRzVwcWlzbVJNOGR0WGJrVkwxRHYrS2w5TTkzc29M?=
 =?utf-8?B?NDN5cUhZSmxraWRHU2taUytVQnBuaW9xcjRNOHgxRittMHRMbUw0Mzd6dHNs?=
 =?utf-8?B?b1ptV1h6d3ZQaUtLZ1FWWTRFcVpJNU1YZnAxR2dwZzhWZlFFbXlBdVVLOVRE?=
 =?utf-8?B?Q1VhcE54a0JRZWxWdkR6blhhNmxFZkFWd1ZDbFZ0bXBZK0RTbHlsUHBiZzZX?=
 =?utf-8?B?Mnl2YWk2Z2hXdWpEa29JYUw0eDI1Y1VMWkc5Q0VVSmlFcEFhS3ZzM09XbHV6?=
 =?utf-8?B?LzhueEpvOUNjdmNxVnoyVDF6UVhuQUxzNDNISHpJYVZUcHkzRkxaVHZmbGs5?=
 =?utf-8?B?eit1VXRaNTZoOTlXR2ZtOVhQd1pDMUhtQTlOYms1U1FIbmdVYVkzc1JoN2hq?=
 =?utf-8?B?azZ2QlplVWJYaFdoeHNGK1h4SXpGZzg5SFFkTStvWUhwOGhsc3lpMHhqTkJL?=
 =?utf-8?B?QStIYXowYUI2NkxhaS9rNzJabVdzS1FhaFpxLzh5YjI4SlE4aE1aV01mdm5Y?=
 =?utf-8?B?NGtMemVrQmgxdU1BWk1SQ0tiSmZSVmZhcDFqL3hGbkI3SkxOdzU3Z0FYYnZS?=
 =?utf-8?B?R3VwcXZaNzcyOTdmaTJ1Um03R044OTBtOTNGOXhSSm1KQzMzVmpsQ0tGYWl3?=
 =?utf-8?B?NkxPNVMyNWZVOWRQL2QxR1piY0FsS3NIK2tIRnFkZWJUTGVPOUlmWUFFS051?=
 =?utf-8?B?bmw3dGVNU3YxbEJORWUrdGlZbnkwcUZKSk1rbm1wTFlqUjJjSHVtMDhSSUhO?=
 =?utf-8?B?UlczMGt1OU5tV0MwRWxQYkk0ZGgzVVdWeno5anBZNGlSNU5aRkp4QXZ5Qldi?=
 =?utf-8?Q?yQRc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VThHdmwyQ1h6dGdCVk1rS1RIMERRNGQxZ0NJV21qclcwWlZLcVdpdmxqeXNO?=
 =?utf-8?B?a1M5clJ1ZWQ0WUMzWFNNTG12cXo1OVlYVnZzYnZWczRoblM2cUJ3NFVnS0sz?=
 =?utf-8?B?Y2pSK0E5aVorL0VVUGhtOVJkYXRBWGhBNy9OdUVRZ1NReGZPaTJTTEFBZi9E?=
 =?utf-8?B?Uk1UUmx5eEdqZG9DMWFoNWVZRjZUdFdzcGovclRsdG0vczNiOXpvdEZXVC9H?=
 =?utf-8?B?T3V5RzJpUDhxanpZamxMOWlQSlFYbW9seXRIUVhxRnNrbHh4WnNTL1c0cG1Q?=
 =?utf-8?B?aHFNeDBYUnRQcHZCejVxd3NSWjA3VjIvUkZ4ZHVicGdMcForZnZVUlZSczNx?=
 =?utf-8?B?b3Y4NUJJS2hRSjAyNCswQVpvQTBScjh5MWhPc2htbnc2QmRSRWtQMTNOUnVu?=
 =?utf-8?B?dWNKdHgyTDdWVUtDT1BvbSsrbWF0d01iQWVuYk9ldVBaM2Z2VGJ1SEEwUkMz?=
 =?utf-8?B?SzEzUGRIaVJaYkFqRm85YlozQUJLUFpwcEtxaE5Lbk53aktDZ011b2dxMU8x?=
 =?utf-8?B?enpJd2pOZUNTZFE1aTVrR0JTaDJhUG5wN2tNUzZhbXg0WTNHR0t3akJEeS9F?=
 =?utf-8?B?VXFSd1NKcTJTT2R4RzNKaCtvQUFFL0RVdmJ3ck9NdU5xdkVyN01OdWxnZmlC?=
 =?utf-8?B?NXpBZi92U0RxZURWdkdVTXVuZEg2YUZwSzNWU3oxWFBLS1hGckpscXZXUjJN?=
 =?utf-8?B?UHhnL3pPcGZDM1EzcGZySlhSZWJoV2JXdmZwYWw3RFBNRkltWW9TRGw4VW1o?=
 =?utf-8?B?US92QXVxWWxOOEVjY3VkSWg3aHN5QWpuU0xtSHFMS1VIUGFBZWZhQlNEcWZn?=
 =?utf-8?B?TzRCWU5nUXVGU1F6TDNCNTFSUXA2Z0U1TXM4SktDcHMvVnFvSUtWeFpRVHlX?=
 =?utf-8?B?dCt0SDFsYU9ybHdteUV0QkViTXVyUXczRk05aVJmbjVmdDIrdVdFeWQyNXBl?=
 =?utf-8?B?SC95TGFSaUtySHMrb0RuOTFtZUJZcVhuSHZCVmJYOTFsUHBzNVdad3d0ZnRq?=
 =?utf-8?B?SlNZMWpxRGpPTWdwWkNqRitUWVJtK0syWVFPOTg0b3Q2dngwMHpXczM3RlNw?=
 =?utf-8?B?eXNtRVdwL2p5cTRoUHZMQ1RUWFBmcjhRZnVZNmV3MnEzMlUrZG84WDZNU2hD?=
 =?utf-8?B?eG1nUzNITTVEcjBiL2pqMDFVZ0o3UWVHRzNHSGtxb0lHQ281T1ZYdGRFT1hN?=
 =?utf-8?B?NENaeEJtL3BNSkttc0cyV0w4SHFXcm4yUzVzMjZMRUJCaFNDMUF1ZWdlQlBS?=
 =?utf-8?B?L1lPUUszRytEWW04RHFBaytQK0pYL040M0lJQ241UUNBc1VTdmZlQkNoU2JS?=
 =?utf-8?B?UGZFeXYrUVlZVFlhcHJ4Qjk4QncwYU9TQXZ3WEpPV2ZyYjV3VjhYWnZiL21r?=
 =?utf-8?B?N1lYVHhhOXJIRXlqQW5uVzNRc3BUbWhvOEdQMkJMYlpjdGdqTmVHejNkQWx2?=
 =?utf-8?B?RVlBSk8zVGI5WCtZV0tuNVE5WnErKzVRMkY3UU1paVArYXpEUmV3S05hKzUy?=
 =?utf-8?B?SUhpL2M4L3l2RnNNZHFPbUZuUEpBa01mcHV4eXprclJyajZ0MTNLdGhLTWh6?=
 =?utf-8?B?Z1V6WFZyQ2xPTW13TnB5WEJrQS91K2F3UmIrdkYzQ09kb0xTSW90OEhGV1FO?=
 =?utf-8?B?c3ZsV2tDWGswb0QwbGRKVzRSaGR5VlN2V2hDRzc2K2htYzFySVRSSG5QbVVr?=
 =?utf-8?B?ZkxzUUdMWis2Nmt1b2pzNVIrN1o5OWwrcG5GY3VlZ0FXYU1CdDRPQm1iSE9t?=
 =?utf-8?B?eHZ4N0hZa2U5ZmlYVVE5SENxM1I1VGFpZDcvQ1RvZlJudFZweDZSWjBWR1li?=
 =?utf-8?B?Z0JxV1I2dFRCeUVXV1pIeDZ0OHBqcXlPelIxbjRqY1hucjdyZHFKSWEyYW1V?=
 =?utf-8?B?T0QrSkl3NkNkMjBnVDNIcnpkK0dpQ3kzUG9YZTVYcHZxVFhYV2FWUElIVVJ1?=
 =?utf-8?B?aG82dzBOdFJsM0xON29PdHRnbUUwVUxaVDZWODByTTAvdktsYURla2xEdy9U?=
 =?utf-8?B?TUord2sxS3Z2djZRcHVxTU1UM1NuZWJYa1gzTTFQbnBmeDl6L1M1S0pRNjRR?=
 =?utf-8?B?QVd6NllzblE0UjhtUmRpUG41dmFoTnlldEMyL0pvdGlFUm12eXhzOGZPZjBJ?=
 =?utf-8?B?WHh6ZExISDAvN0VZQWhxSTFQMk5Tam90Qlpnd2N1RDRGaFBpVE5CTTlWMi93?=
 =?utf-8?B?WFF2ZUc4RWRsRGhQZkpHNEVEODc3Q21zb0JZNjZKSDc1S0lMeG1OV2lBWW00?=
 =?utf-8?B?UEtmbXB3ZkpNNFd1bzJPWXZwS2RiL25qTVRFeHFIanRNT3ZIdm1tamlWYzBC?=
 =?utf-8?B?WXJoWjZNaDN0UXBsQnVqRU1SY3k5WmpJS1JBN0JoRFl2SzA5OG5yKzRaNUJt?=
 =?utf-8?Q?3WcA8DMv2OlWmqZ0ZS/etN/sQRlV6SwQ0eTTN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cadfde8-c930-4d34-5844-08de632a9b16
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 13:46:17.7493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xsKVM4+M3245kS+Tsjit3kuw0rE74Xe/5zNWjGH41IKdmOqwcdZM/dTZNEmeMBT2Rk8eZIvZqEiXJGBoWGt9+Y/BVxfcAAbkkUNQpvNdRqocGxA5XMAWSD0XBqRKVh1p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6172
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

On 02.02.2026 23:37, Michal Wajdeczko wrote:
> 
> 
> On 2/2/2026 5:53 PM, Balasubramani Vivekanandan wrote:
> > From: Soham Purkait <soham.purkait@intel.com>
> > 
> > Add check to verify if CSC is a PCIe endpoint via pcode mailbox
> > during xe modprobe. If this mode is not supported, an auxiliary
> > child device for the MEI driver is created as a fallback flow.
> > 
> > Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > ---
> > 
> > v2:
> >   - Use scoped based resource management for runtime pm (Shuicheng)
> >   - Initiliaze return value of xe_pcode_read (Shuicheng)
> >   - Assert when CSC is not supported as a PCIe endpoint
> > 
> > ---
> >  drivers/gpu/drm/xe/xe_heci_gsc.c  | 35 ++++++++++++++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_pcode_api.h |  1 +
> >  2 files changed, 35 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
> > index c1f15313f92e..48b830c99997 100644
> > --- a/drivers/gpu/drm/xe/xe_heci_gsc.c
> > +++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
> > @@ -10,10 +10,14 @@
> >  
> >  #include <drm/drm_print.h>
> >  
> > +#include "xe_device.h"
> >  #include "xe_device_types.h"
> >  #include "xe_heci_gsc.h"
> >  #include "regs/xe_gsc_regs.h"
> 
> btw, this include should is in wrong place ...
> 
> > +#include "xe_pcode.h"
> > +#include "xe_pcode_api.h"
> >  #include "xe_platform_types.h"
> > +#include "xe_pm.h"
> >  #include "xe_survivability_mode.h"
> >  
> >  #define GSC_BAR_LENGTH  0x00000FFC
> > @@ -42,6 +46,29 @@ static int heci_gsc_irq_init(int irq)
> >  	return irq_set_chip_data(irq, NULL);
> >  }
> >  
> > +/**
> > + * is_csc_pci_ep - Checks whether CSC is exposed as a PCIe endpoint
> 
> nit: functions shall be documented as:
> 
> 	is_csc_pci_ep()
> 
> but this is a static function, is it worth to document it?
> it doesn't seem to be extra complex,
> its name already suggests what it does

I will changing be this from a kernel-doc style comment to a simple
comment to explain the function.

> 
> > + * @xe:  xe device
>           ^^
> 
> double space
> 
> > + *
> > + * This function queries whether CSC is exposed as a PCIe endpoint,
> > + * through pcode mailbox sub-command PCODE_STATUS_SUBCOMMAND_CSC_PCIE_DEVICE_STATUS.
> > + *
> > + * returns true upon CSC as pci endpoint, false otherwise
> 
> use proper tag:
> 
> 	Return: ...
> 
> > + */
> > +static bool is_csc_pci_ep(struct xe_device *xe)
> > +{
> > +	int ret = 0;
> 
> no need for explicit initialization, it will be assigned right below
> 
> > +	u32 val = 0;
> 
> likely same here, as I guess it's a xe_pcode_read SLA to setup val in case of success, right?

Presently xe_pcode_read is not doing the right thing to clear the val
variable when it bypasses pcode read say when skip_pcode is set. We can
fix it in a different patch. For now, we can have val initialized to
zero.

> 
> > +
> > +	guard(xe_pm_runtime)(xe);
> > +	ret = xe_pcode_read(xe_device_get_root_tile(xe),
> > +			    PCODE_MBOX(DGFX_PCODE_STATUS,
> > +				       DGFX_CSC_PCIE_DEVICE_STATUS, 0),
> > +				       &val, NULL);
> > +
> > +	return (!ret && (val & 0x1U));
> 
> no need for outer ( ) and magic 0x1u - use proper define here
> 
> and maybe it would cleaner to first check for the function success:
> 
> 	if (ret)
> 		return false;
> 
> and btw, will be there any message that pcode read failed ?
> if not, then maybe extra message here is deserved ?
> 
> 	if (ret) {
> 		xe_err(xe, "Can't detect CSC status, assuming not PCI endpoint!\n");
> 		return false;
> 	}

We don't need debug prints here. I have added a print in the parent
function whenever is_csc_pci_ep() returns false. Though it won't
indicate where pcode reading failed or CSC was not exposed as PCIe. We
don't need such detailed level of logging as it is a very unlikely
failure.

> 
> > +}
> > +
> >  /**
> >   * struct heci_gsc_def - graphics security controller heci interface definitions
> >   *
> > @@ -179,7 +206,13 @@ int xe_heci_gsc_init(struct xe_device *xe)
> >  
> >  	heci_gsc->irq = -1;
> >  
> > -	if (xe->info.platform == XE_BATTLEMAGE) {
> > +	if (xe->info.platform == XE_CRESCENTISLAND) {
> > +		if (is_csc_pci_ep(xe))
> > +			return 0;
> > +
> > +		xe_assert_msg(xe, false, "CSC not supported as a PCIe endpoint\n");
> 
> we use asserts to enforce software correctness
> 
> we shouldn't use asserts to check HW/FW
> 
> and since we can be here for 2 reasons (error, no cap) maybe we should better report what is going on?

I will be replacing the assert with a kernel warning here.

> 
> note that asserts are compiled out on production builds
> 
> > +		def = &heci_gsc_def_dg2;
> > +	} else if (xe->info.platform == XE_BATTLEMAGE) {
> >  		def = &heci_gsc_def_dg2;
> >  	} else if (xe->info.platform == XE_PVC) {
> >  		def = &heci_gsc_def_pvc;
> > diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> > index 85cc7478b787..391a98c8b5fb 100644
> > --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> > +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> > @@ -35,6 +35,7 @@
> >  #define     DGFX_GET_INIT_STATUS	0x0
> >  #define     DGFX_INIT_STATUS_COMPLETE	0x1
> >  #define     DGFX_LINK_DOWNGRADE_STATUS	REG_BIT(31)
> > +#define     DGFX_CSC_PCIE_DEVICE_STATUS 0x3
> 
> shouldn't this defined using REG_GENMASK ?

No, it is a value of 3 not a bitmask.

Regards,
Bala

> 
> >  
> >  #define   PCODE_POWER_SETUP			0x7C
> >  #define     POWER_SETUP_SUBCOMMAND_READ_I1	0x4
> 
