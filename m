Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4910CA0EE4
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 02:13:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F7D10E077;
	Mon, 18 Aug 2025 02:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BN59MXDy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E855210E077
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 02:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755483194; x=1787019194;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=t62MImjozP1hurZT/yO9Eec8QJD9ACGMKzSn+5lxOGI=;
 b=BN59MXDyQ7QAryhlMCu/1CWkWItNQmsu9LUlJGtSMyJQUPfO8SSIfAmm
 ps0SCixNXbRWslvB93QYzOizSrJHCzJyYb8p7yDQ2grpkdWFNj7K1U/hg
 Ot3Z1kBAHjiXVePj7agFwtFkKRK7kUWPfZkTWeiYB4bILhru91K3Tq/PM
 AGnu0rG0bPbsZTe5FhSLPW0CBLRoBQ46KJ135ELvQ2wC45rb9BTkCRtwf
 lw19eWSWU27YkiYxlFnYBAyWIJlLtOpOeZow9jMc3wUwaEmRcAl2qMtxq
 Ig4dgcxwWFipWMJjqwVUdjGfzHHfsuk17XeJ78mFM+LctjR7A6AW0Uz7n w==;
X-CSE-ConnectionGUID: fGGp5ecpSguhRvOFYJiCug==
X-CSE-MsgGUID: UnYttst/TcSOXOYoAJRBAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="75153276"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="75153276"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2025 19:13:13 -0700
X-CSE-ConnectionGUID: I8GJQvCPSMyYqFGTVOxkQQ==
X-CSE-MsgGUID: IjjSLmqVQHyysIP0sjCM8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="167701481"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2025 19:13:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 17 Aug 2025 19:13:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 17 Aug 2025 19:13:13 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.49)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 17 Aug 2025 19:13:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kWxWSScFS71cVg/89Py9/OSPDLEiJtVjlL0r+RdypCdxk7VPdx2oJqV6l8y/RZhNdc4ik00x/CK1BPfNdBYc2xRW1ZOtw4XYEEAvooqJXJ2wMo4LabHp6x4W4SbRwR7/RqzQsGsqj9Amd/DK8dwRryq6iXJWKEetdEemcOdF2u8ExBIKpunqbxMcQ0CaHnWSmtDkBsV3E/JvXvmqFvH4jFjuJyw6oax+6PXZoq8qCktF6Ojo89ZKAT69ZaoVl5kf4JBrPKfnltUu1FjBeRqynPNW4H2BLxzoDOfyU6/1tKvckp96qFrfNNPA9iLJwKRrneaQRHUJ+ZENcBLHED/9Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wuxQkBr6B7Bl8EcjBGuUeUhc8bSK2j7E+dHlN4GGYCs=;
 b=jbXPTbbXG4Y2rJt0K67lArj+1sXwOuE3O31JBycggUrpPQZz7aCw6GGRSP/Vo1Zd1JaM1rNzBzl9Lqa9zUOMg4TAw3/vQauEJB0zJVMSh5x6O4J1jvmnhwgpUo1X/jst5N+Ilk76usKwz9Mm7PRvWujn250ztzGXpN7mo679JPG1BOFrEqsPWtefbb5pqMZ7OH8NBItDSDybzzcyO7rY8jQC2wfRflpDOvIfhC081O+L1tB9Nz/h0U6aaJ6k5kGuAfxxhpxRI8laeSfDZXXO5y+aenfVLjiWKFdZn5Y9JhV4zJAiayRtbiVLYQ8oEjbKnioWJwycSxXNyYB6m7CNmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7549.namprd11.prod.outlook.com (2603:10b6:510:27b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.20; Mon, 18 Aug
 2025 02:13:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 02:13:05 +0000
Date: Sun, 17 Aug 2025 19:13:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH v6] drm/xe/pm: Disable RPM for SR-IOV VFs
Message-ID: <aKKMLn7becx6s4Gh@lstrano-desk.jf.intel.com>
References: <20250812163613.9954-1-satyanarayana.k.v.p@intel.com>
 <aKIGF3wKoK3U6bVu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKIGF3wKoK3U6bVu@intel.com>
X-ClientProxiedBy: SJ0PR03CA0191.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: f13590fe-dbce-450d-0b3a-08ddddfcc447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlNST050L01EdlVOU2dzcjVjM0pvWmRvTmwwdW5PbklEZG1sKzl3TmZ6U3RB?=
 =?utf-8?B?dUpQTDRDNTFtWEtSU2ljMlRpZWdBMW5RR3BKSmNkaUhDWEljUkhES2crQ25L?=
 =?utf-8?B?N3Y1dXhRam1WK0YyYXlaWnd5VjczbDBIVURQc21vMnQrLzZ6S2lBS3Y0TExC?=
 =?utf-8?B?dmplVVdZQndNbXFyb0pPcHV5cUVzcXNZZ0ZVTWF5akpxMTBLL3o4dG81c3Mw?=
 =?utf-8?B?Uk9sc05RZzRNTDVDSlcyeEdNMXVvM1F0WE5JV29kWEdwSWJxaTJ3ajFpdXlY?=
 =?utf-8?B?MHhHVm94VTRONS9HbjNQQ0hyOHVxR1Vkck5YVWF5amJ6TkZHdWpjTUFqVEZ4?=
 =?utf-8?B?UHdPblpGZ0ZKZGE1VnBUNFIyNHMyaWFhdW9TTUZDZFBab0N4aTdMT04xK2Mw?=
 =?utf-8?B?VzA1WDJzMEZIYVZGWFRSTVgyclJ3ZjJNSE9uZDYwK0pFTjR2QldtRURXeUQv?=
 =?utf-8?B?K1hoNUlRSXE2ME90MWl2c2RLN1V4b2N1bVBsVUxibXpIY1lHckl2QzV2aGVs?=
 =?utf-8?B?YVdONGV3amxldWZkRTVKVVV5akFrK2U2U3E4dXBrYmFaRFVQekxhaTFVUjBW?=
 =?utf-8?B?TkQ5dFdCZHBkSHorekNUWGtPd3JNLzB2QUtXU1FSSHR2ZGp6dTh6S001alQ1?=
 =?utf-8?B?N3FwZHgza05qUEl1UVRLcnFlMUNnckUwQWRoek5nQjdHZC9hRVZSdVMzdkFa?=
 =?utf-8?B?SWdNaTY0L0NBeVNKc082WUZodm4xZEFocmlwaGV5YlVWbWlFMUpYL2g4UEli?=
 =?utf-8?B?US9rTnVRT2wvb2YwbXNSTmJ6NmtabG1lK1FOTHMvdW9kM3hVSnVGT0lRMlZm?=
 =?utf-8?B?NzFZWFo4dE5BZ29QRnlMNnNXNVVSdVRhR2NUVklzbjBHNTBpSzlWQStoWXI1?=
 =?utf-8?B?bWg0YjEwRVBNZjQ0TlVvL3prZjFWb2hwTlNWL3h4STJaMEx1N3dXeS9OSW82?=
 =?utf-8?B?REc3TDRyR0tRdm1UTW9PVUtYblNscGZldW5PRnRmYWl3Z2xQTnlpVG84YU9S?=
 =?utf-8?B?M1JxRFJwSVlieHloUVVEMVl2QUxWVW5HMjQvUWVMVFF2ZXNpdmw0QTlZTDhT?=
 =?utf-8?B?WGprOXdLNUNnMC83K0RlRGVGdUtZMG1QWEdodDNLLzNFcE51U3EyVDNyalU5?=
 =?utf-8?B?U2JlUEUzU0RQdGNzRDM2elV4Vzc5N3dqZ3JrR1RVanppS2RqMllEa0VjOGF3?=
 =?utf-8?B?eE50aE44ckNZZklhR2hnaXdoNExJSXRhWG5VUEhDZHYxL3FiR2JsNU81LzVF?=
 =?utf-8?B?T3lycCtSRXlVektYSFd4WFRabmdUb091MUdIdVlWTXd2b1BVNU9pbWx3M0dw?=
 =?utf-8?B?ZFNSWkZPbk0yekRpQnhxUzhIa2pDaytCYzM1UVkyMXByc2VhTngxNm9ybFoy?=
 =?utf-8?B?WGxVUnV5QXgrcDhpL1JjZE4ybGJrMUVXdElMbW52Y2s0SEdiSnIrQWJEZjZz?=
 =?utf-8?B?dlFXOU5OZ3QxNGQ0S3lJb001V2ljbk4xOEhuTFVwbDJBZC9oelNERnZoc3Ji?=
 =?utf-8?B?ZXE2RE14cGZlOHVOSW93MkhScjZUKzErU2p2YmU4ekFEYmJha2ZrRFNwNmxk?=
 =?utf-8?B?S1BoRzEvRzBOalVNVlNHT0FCcHRyMmRDVU4vRCt4MjlZQ3RLcmRRdkQrR2FC?=
 =?utf-8?B?TnUzVjdIOHNFVGJxUDN2U3k2QkgySnVxLzViTk5JQjBlTzRuV3FxR3BHQWhp?=
 =?utf-8?B?dmFYNzBpaDB3enBkZG5XZ0N3bWxIWmlzVDNNT2FwK0NFWG1mS2QwYXd4eFVz?=
 =?utf-8?B?cUtIZmROcEVMQnYvNDV3WllmTnppRHpUcTZ3OGtaN1lUbUloUk5JcU5HRVFN?=
 =?utf-8?B?eXFkNDhZL1dsTkdFSzdpdEFFREpsZk1EUTBWTSs1QU9qRVlqeDhiakgyVkdQ?=
 =?utf-8?B?VThEQ01EL1RqZXRIRC9mamcxOElLNHpvSDg5bEtiRUE4WmViQ05KRHdCVTl6?=
 =?utf-8?Q?lltCUNqfO0o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZG9JWDVndzdoNzRBa2RoM25ORDJranA4VHZEclFKbUx0RGs5YXEzaWRPV2w4?=
 =?utf-8?B?SjRXelRrQXlUaUNEUzl3dHR3SFZSa0JIN0ZDS0ZMQk4xYTB3MnlRU2xzMmdj?=
 =?utf-8?B?RUlvSXRuTkRYbXhxbHhxWiswNlFGZ2VQWStSVFhDSkozelRSZlcrTGJyL0NM?=
 =?utf-8?B?LzNKc0dGVXorODgyTlRBTUJaTW1sMFk5bVBiNGF1aTY2R094UXF3eFhIR2Qz?=
 =?utf-8?B?ZzVzSE5IYlRTUVpPQXdxNXp0UEdxZXhySWxLbmNHbWorYkhxVmhXYWMxb3Na?=
 =?utf-8?B?Vnd6czMrdkZDdUE2V0JyeWNRQkFVT0Y4VUJUTVRyTGdSUFJkRy81SGhYeGJz?=
 =?utf-8?B?cFp3NU96TUxSTkNJOXlkUUl2RUpTMnpUV0V4bitzQldManNGNmh3KzUzaWpO?=
 =?utf-8?B?UmlRaFVXdGM2UjY1czJqSWxlOE8veGd3azVtVUFPaUR1SFBTejZ1ZHJnV0lJ?=
 =?utf-8?B?ZHEvd2NTTU8wL2FHZGw4eURSNyswQ1pHTnprbThhRVpVd0ZaYTF2YUcxd0JL?=
 =?utf-8?B?SDNqcEl1QkxWaVdrc3JzdVpaMEpydm1UVytRaWhNQ2dOTVdpdXd5YTlmK3RU?=
 =?utf-8?B?QzZVTE1SUWowUFk0bnFva2pmSEJ5YzRqR2FFUFBuUUl5bWJIUmJZVnJoNjVV?=
 =?utf-8?B?ZzFLZkJLS1ZTVGxsVFJMR05VMFJHa2g2bE9YOXlBZS96Vjg5REV2RHo2N1p4?=
 =?utf-8?B?bEsyUVNDRENONnBMeVVsK3cySzYrWWNTeHZxNE9kcTVDTnF6aE1EaEovMEhG?=
 =?utf-8?B?MWI5a0VDT1F1SGs4TE5nRS9tYXI5RzdnQjh3bHg2Um5kOXVGeUh2YkxnU1Jk?=
 =?utf-8?B?QUJ4WFVCeXprdTFKQnd5SXZZbGZHRnlKQXUvTXF4WXVBRkRBaGdtTjh3WFVJ?=
 =?utf-8?B?azVIQWJWRWdtaG5lall1N0FvSWNjbHBHS0IweFJQZW9CZ0U3THdyV2NmeXRv?=
 =?utf-8?B?NzlLQ0RUWm96N3ArMTd0VFlFRjdZWjk1bWJOQTBnMnI4bU1IdzdTVGhHTmh0?=
 =?utf-8?B?YXovTytadHNkWUJlekJsa0w3Y0F6WnRDUCswRjFCVmJwMWpldFNNUXFYY2k4?=
 =?utf-8?B?REZpWmQ5dUdRV1VRSDRST0ZaR3JJUGRPU01DZXhOWXpPQVZxN3pESzlNMng4?=
 =?utf-8?B?WDRMSVIrZWhwVlgzWGFmSnpaRVBoa01xaWQrcUl6R0dVKzNqdnZMbW85ajBS?=
 =?utf-8?B?ZUM4YWU0M2JhbjloU05JRk9TbmZqeVIwV2lkd1ZaVUErc0IxSVN4NHhTb1Ev?=
 =?utf-8?B?UWpPWGxRbi9YWG1KRVFoM0xKRzBCaUcxUWJrOVZSMXFoMjBiaEpnek9XSFND?=
 =?utf-8?B?ODZNTktNQ1VGQ25leGRpTmR0K2ZVMndldjVXMDdGY2FGbko4VmpFUkhuT2sz?=
 =?utf-8?B?a3AydUw5eDNYSWY3MnVmNE96dEg4NVlVcitBSW9yTG51aWoyZUwxY1dtNWZM?=
 =?utf-8?B?QUFCMUJDUVYvcDcyRS92TEdsS3Q0UWFnZ2JBdGZyOEFzWHNmcTBDMkI1VXNY?=
 =?utf-8?B?dHN6UTdlU1c2aVAvdHVZZlh2U0lXeWRHY2dEbFN3aEFIOHJxTEprRXczS1VQ?=
 =?utf-8?B?R3FXcllXR2ltVWRiUkNIQys4VGNKYkExK3Fzd21PMGtsTTg5SHhJbGJMcGlm?=
 =?utf-8?B?WVVMNzRiVGdwbWdqUCtKcEVnMFd6Q0x3ajc3dU1PNUVqK1k5bGVQVlYySFpo?=
 =?utf-8?B?NUhEWnRVaTFYMk9qdGcwTTlQVzFOYnkrUTFTYkpSQ2V5RklTWC9NVzY3RmMy?=
 =?utf-8?B?WisrdUJWZ0w3TklteE45bUdZSzFhV0Z3YXNHUWpZYlVwcUExaUFxWFhubm1B?=
 =?utf-8?B?SXlEdUs4RUFPQ21RRUpwL0lGcWZ1ZXl5UjFsMURHSXp1ZGR3dVVUSTduTWxt?=
 =?utf-8?B?RXQrK2NDNjNueHZ2eUtyUzdsK1FBaTAxRG4zYWZTbEZmdlBrUXVLWFhseVQr?=
 =?utf-8?B?cytub3ViRFdnUlhraUQ1akp4OW1XQlhzRFAvRDRHb2l6RXJlcWNzcVhMVXVv?=
 =?utf-8?B?KzBzdG1QQkhRcW56TnVZZUhCSzRRTzVKSWxRRTFxMzliWFg2WkxVNVBhYzF3?=
 =?utf-8?B?YUNrd3BRcFBKUWFPQW9CMnorZzZVelJjL2JHK2swcFkwaTFtTS8rRFZoMUZv?=
 =?utf-8?B?SzdITDhjcEFVSmtEZTVHcUs1cHdZNFk4RmJhdStDdDNiVklQZ3NhYmhIOHc2?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f13590fe-dbce-450d-0b3a-08ddddfcc447
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 02:13:05.2451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sqa9pgRLcS9+4OHRPhKT9wKUsqhwZCt2Cmo3u4oaSevfGQGMiTe/eAAwQ4SZoWur/LpH8kjVKMO5d9fmMFb+mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7549
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

On Sun, Aug 17, 2025 at 12:40:55PM -0400, Rodrigo Vivi wrote:
> On Tue, Aug 12, 2025 at 10:06:13PM +0530, Satyanarayana K V P wrote:
> > VFs without native PCIe Power Management (PM) capabilities inherit their
> > PF's power state as per PCIe specifications(§5.10.1 PCIe Base Spec 7.0).
> > Enabling Runtime Power Management (RPM) for these VFs trigger unnecessary
> > driver suspend/resume operations that ultimately perform no PCI-level power
> > transition.
> > 
> > Since VFs without PM capabilities cannot independently enter low-power
> > states, the existing RPM workflow becomes redundant:
> > 1. Driver executes full suspend/resume sequence
> > 2. PCI PM transition step becomes no-op
> > 3. VF power state remains tied to PF's status
> > 
> > Disabling RPM for VFs eliminates this redundant processing while
> > maintaining proper power management through PF dependency. This
> > optimization ensures VFs follow their PF's power state without superfluous
> > runtime handling.
> > 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Michał Winiarski <michal.winiarski@intel.com>
> > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Maarten Lankhorst <dev@lankhorst.se>
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> and pushing
> 

This might need a little more thought(?). What are the full consequences
of this patch? For example, will xe_pm_suspend()/xe_pm_resume() never be
called on a VF? I think that’s correct and desirable, but consider code
paths like:

if (xe_pm_runtime_get_if_active())
        /* Take action assuming GPU state is valid */
else
        /* Take action assuming GPU state has been lost */


On a VF, this is now broken, since we don’t lose GPU state—unless I’m
missing something, or xe_pm_runtime_get_if_active() always returns true
on a VF which in that case we should be good.

Matt

> > 
> > ---
> > V5 -> V6:
> > - Updated comment (Rodrigo).
> > 
> > V4 -> V5:
> > - Disable RPM for VFs without checking pm_cap (Rodrigo).
> > - Updated commit title.
> > 
> > V3 -> V4:
> > - Fixed review comments (Rodrigo & Maarten)
> > 
> > V2 -> V3:
> > - Fixed review comments (Michal Wajdeczko).
> > 
> > V1 -> V2:
> > - Disable RPM only for VF devices when PM cap is not implemented.
> > ---
> >  drivers/gpu/drm/xe/xe_pm.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 5e8126ca8e27..51934d5dc44f 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -247,6 +247,10 @@ static void xe_pm_runtime_init(struct xe_device *xe)
> >  {
> >  	struct device *dev = xe->drm.dev;
> >  
> > +	/* Our current VFs do not support RPM. so, disable it */
> > +	if (IS_SRIOV_VF(xe))
> > +		return;
> > +
> >  	/*
> >  	 * Disable the system suspend direct complete optimization.
> >  	 * We need to ensure that the regular device suspend/resume functions
> > @@ -367,6 +371,10 @@ static void xe_pm_runtime_fini(struct xe_device *xe)
> >  {
> >  	struct device *dev = xe->drm.dev;
> >  
> > +	/* Our current VFs do not support RPM. so, disable it */
> > +	if (IS_SRIOV_VF(xe))
> > +		return;
> > +
> >  	pm_runtime_get_sync(dev);
> >  	pm_runtime_forbid(dev);
> >  }
> > -- 
> > 2.43.0
> > 
