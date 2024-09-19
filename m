Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF19DCF3963
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 19:24:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFB010E1B8;
	Thu, 19 Sep 2024 19:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GLrr47kx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94B410E1B8
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 19:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726773869; x=1758309869;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=3cjpLAAMCMGzVaNiyBKGP4n13rzef0lge8w/MeXas+8=;
 b=GLrr47kxuG3/t8UcyO5A8+uP5Iftz855Aujx+13MXOXsjvblV4qqe4Iu
 R4/P6IbcU8q01GQj1uYfGyjtXQZ0d0els9YxyOcsAMckYDs+qYhu50wDk
 4xl/C1Ln5dBnfsgfoL4zne4c1HVuUjpDxmwXezk+Q++b1tjU9TKNcRHEd
 sAjWhO742spJsktSPJHWMZFf9ERyD7mlSsMWPM7MHL7ig0Ac7oH+SGXCK
 Fp2vZWa01qTsYz46nkABJd3laKXMac5ivbpPSu08huyeOxasADiJeoOav
 2LCgJNRaXBLAwKQPhy+ZdWlHjBin/csIRMHGl72f3b43f4VkgfRyQy9eN A==;
X-CSE-ConnectionGUID: 749HDuxiTi2BuYgFk0q9HA==
X-CSE-MsgGUID: Nm6C8GPQQ+aJAKkL/nJgFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="48294115"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="48294115"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 12:24:29 -0700
X-CSE-ConnectionGUID: KQIDy+RQQXOJbaBjn2ixkg==
X-CSE-MsgGUID: A52mrb3LTVKWtV+2q8nf/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="74156784"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 12:24:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 12:24:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 12:24:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 12:24:27 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 12:24:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bc/YJCR7/zv75D0OX1NWxwAVbXcKz3iHoAiPns/lSvKGw8Vf0X8NJrZ0U1BUO3ZlH5iVfaa2qKzQ8EkW0JFvt4Bg7y9fZcM+rehmq+gFL3rej+vC0yrelCNQlIqZBVYmtodvN8Jl8LEjZpOZO/0i3zvduZDFadO9KIaK79pKH0J77XeGhNj/BHnjEVOAJbZvRo3v9knXw99ueVM0JI19hR27EJyXLyUz8mh98uW1bEPoyqzU3XDVy3CyeYXg9Jv+BQVvtO/M/ri2xNbdkfPJAcl1hDXxm3JcEmD9T2Y0SK3oHJFJRYH+yfyS1KpvxLHuOHBs7Zqn18lc27PWt5yKoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V95kQ7gb5UjRhL9+ebBPeLVzrmj2vz8+JMOdFQw6LyM=;
 b=RgDWlvNiiIS/4Rn2I/hooj5CQyV6P+Remwc/Nd7V+rD299G000MIX2lVcVTKYurMpifKl+V55yWme8G3fW9pAnbbQ8PrXEUvCQCDOlX4KZM2p1qPkpZvpPW4gNtCgcNZiUPDp8xz7glopjXeCc61Qho4JWrtgSQMpgaTAro3Osa7jhPCYo8O+UiLhz9orMK+8V1SLubqhu1aPCaVZb1o8FCu3/WkPdCzJr9zOoiVwtMaC5zRbNsbYrAyoeXHfmiRu1zXZnNVVXFBPfLtrehrcqD0Hf9+9AYzSHU8DJ3IrbK5PkBS6dv/a8dpnMZk+k10TGmd+EbIL683/KhmlCHxaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA2PR11MB4876.namprd11.prod.outlook.com (2603:10b6:806:119::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Thu, 19 Sep
 2024 19:24:25 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.7982.016; Thu, 19 Sep 2024
 19:24:25 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <SJ1PR11MB620488E5BFA1FB516114662E81632@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240918204830.49880-1-gustavo.sousa@intel.com>
 <20240918204830.49880-4-gustavo.sousa@intel.com>
 <SJ1PR11MB620488E5BFA1FB516114662E81632@SJ1PR11MB6204.namprd11.prod.outlook.com>
Subject: RE: [PATCH 3/3] drm/xe/xe2: Add performance tuning for L3 cache
 flushing
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Date: Thu, 19 Sep 2024 16:24:19 -0300
Message-ID: <172677385930.58088.6492678739635646603@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4P222CA0030.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::35) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA2PR11MB4876:EE_
X-MS-Office365-Filtering-Correlation-Id: 230a2410-9a54-41d2-103e-08dcd8e0abd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|16122699012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHJBK0x4anI2a0sweUhqelFVTWFTOTFPSUxqSFkzQXRCMDNNUUQvMkZzTFFJ?=
 =?utf-8?B?Q1NpS3dZM1lwRGRtUDhPTEd1MTI2YXp2bkI2TS9XSXF0TEl5anRXRXRiLzBH?=
 =?utf-8?B?dTBOWGVKdTZXemVTR0R2VDJLakF3ejI1cXRGTjVUY1NmaEttOElhQnVMMzhF?=
 =?utf-8?B?eGZ2dEZ3NU9ERU5rSkl0SkdMZlpxcFVuSXZSUFZDNjBSR0cwSlVLdDZxZThX?=
 =?utf-8?B?YzFaTCtwK1FGUGNpZDFJRjVCVXBJRzdUZkRiV1BYL05vYVNzVWtMZHFtaVZ5?=
 =?utf-8?B?WUFpUXRJUmtRUUdtdEdzRUgrNitpTXh6K0xUUkpoOWZSUFhWV29lb3NHQ1VT?=
 =?utf-8?B?cWZlSjRBektESHhOQ3BQOHVVczdMeUpBeWNFRG50Y3hQZGJsZm95dVgvem4v?=
 =?utf-8?B?R1lmaHcyd3ZpaGVyMVgxbWJza3lONU9qSDIxbG8wZi9sMmI3aFg3aDd1eHl4?=
 =?utf-8?B?b3lCNFpnbVQ1NXhyV0lFZFRJak1EUUhCRHNhOHQxK21tY1hibk1EZzQySk52?=
 =?utf-8?B?dUV1dnk4UlhZcHFWSG5OeGlFQnJuSGYzNSt0S1hzYjF2Y0RJdmFPMXVVT2Jp?=
 =?utf-8?B?bmQwWVVwNWZkUzlycFZFL1B2SFVaMFlZQjhRTDgvSm5pT2dmS3J5UU1jNnRl?=
 =?utf-8?B?SnFUbkJzbm1SekpjVEFPYlpTTkhiYXd3RVVod1FKUjFYVTRJRksrRFhKSC9B?=
 =?utf-8?B?Z09hOWM4cFdNZ3YrSmZYNnFSUDI4YU55VTlmMzVrbXJQaDFETUdML2NCYmhY?=
 =?utf-8?B?NW1hdmlwTFlUSzNUcjBIOElpREFsUEJPM0pWeEFaVVZjRXJjbG1TeGU3ZCt6?=
 =?utf-8?B?ekg0bVBSclo2K3pOSEs4ZS9Ua3hQMkNROWcvY0oyeUp6UkFRMkJ2dVR5YjBB?=
 =?utf-8?B?V2VLMy84d0Q5YXVBWTQ4VlRRQWVxNGc0L3Qxak85bjNHZVpOY0RpL3VkMnlo?=
 =?utf-8?B?TG1HRk5tMm94L0N4NW5wQ25MNGJSYTE4VGhiQ2dUWXM0azcrOXc1aGh1Y1lT?=
 =?utf-8?B?SmgwTzN2ZlJVdzQvT1Qzc1diYmpMTzZVUTNSZUtCQ1ZNUnVLdHl5UUhRY3lM?=
 =?utf-8?B?UHRlYXZvL2trUk9hcXljbS9UblJpQURTS1Z3TVlqQnpiMUcvTWZCd2ovdVBn?=
 =?utf-8?B?cThVbDIrbHc4d28yaEVoQ0hMVkxRcHRJaGpPaGdXcS9Nam1Rc2hzMmJlK0F4?=
 =?utf-8?B?V1JHaU1hMU0yc092WlJwei9PNWIxYVUwdStuc1RTbHpQSHNla2dUc0hYcWJk?=
 =?utf-8?B?ajU2clpJVXFBd1M5b3d2YlhuSkVrdGZxZTczbVFYaldKb1FLSjdzSmtJS29q?=
 =?utf-8?B?djRZemxVVlgzL0dsZzdFT3I0cWtHbFRRY3ppVWRrVVNqdlR6MXhHanQ4SlFs?=
 =?utf-8?B?TVY3RW91ejI2OFQ5UEFydnBFZEtucmVhbEl5UlN6dmRCR3ZNT3lqMVozb0FF?=
 =?utf-8?B?N1l2bXZGU1diTnNQS2o5ZVFZQkV1UW1IRXVQbHZ6YTVGVkFxN3M3SmtXTU9N?=
 =?utf-8?B?bTFoRXFMbnA2SzdqQzJhVEgyVEVCOE1ZUFg4bkFyVGZzOEQxdWFWMThZL3Zr?=
 =?utf-8?B?ei9PSmJubUExWU5QUmN3TjFQdk1BVkFQUFRzZVRZUktZdHhBVDFoS1FvUFdG?=
 =?utf-8?B?bmZnVndZVXUrbFR3UExYb1lWeksyd0lnZTJJWENuZVNUMDdDaUgyUUJIM2xL?=
 =?utf-8?B?S1BKUklLcHJRUVBNTXpGUFlxcEM1YXJnTHNKTVFodWNWUy9ONnRXNkh4aENh?=
 =?utf-8?B?YlJ1cUowVXdyak1MUmo3Q3h3dWF3NXhNRUJzQ2Q4N1gzY3o0SFB4djE3aDdD?=
 =?utf-8?B?aUVqVDBxM3pNRlcrLzVsSXVuY1Brc29obFdWZVIvdERVQ0IrcmhNTzVqZThw?=
 =?utf-8?B?dzZ5S1FVNVhoQlJyZFMyam5tZWJsSW5JV05JN1FBNEI0ckE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(16122699012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjFqV05yZUhFOUFGZnFZbTM4TitpM1RuOHF0b1JnenBDRER2WW9qbktqSERI?=
 =?utf-8?B?bDNONnlndHFDdS9IQUxXOGdyMDdGb3RvaDNQTWRYNWJKNVV2M0JXbXdudHVI?=
 =?utf-8?B?VTNLZUFRSUFIQkJTNHZCVnd2b0wyMXBTdHNVUFBMNng2YzZiRnVQNVNuOExZ?=
 =?utf-8?B?K1RheUd4eXV0aG1ENHJCZDl1KzNUQ3poYkMzOXpGOXp1NFkvbTVGN2tLRmI4?=
 =?utf-8?B?QUZ1am82cXNuZFVqMkc5K0VBa2NMTkhMYlpNUHd2OUx0NTBTbE9tS09ES1NZ?=
 =?utf-8?B?WFJRVFRRKzBxeSt1bUU1cXRYdTliMkYrbXFjVXpQSGduR3o3Q1FWZ25wZXRa?=
 =?utf-8?B?d2s0NDRORGh4amFxSkR0OWI3RXZUbnBWekp2WXJ1Q010cUNRNDhITTRsL1dM?=
 =?utf-8?B?c3Nic0dJM0I3YTQyQVdZRGtCc2UvdHlwVjhYcCtSd0F6U0g2QWcrc3VFbkFI?=
 =?utf-8?B?dERISFhyT1U4NDZ4Y3FPYXRBS3c3Qys4MWxmR25VQkI2WUZ6UUE5Nk5uc01O?=
 =?utf-8?B?R2RkbC8yenNPVFd2V2VDclhUSlVzMjZhZVgxazdpZFN0dVV2bjA2UHF3VTlD?=
 =?utf-8?B?a3FFMjgwY05KWUQyYWtoU241YUVQTHJIc2l6U1YyU2VWVUxCVnFGOTBjZGxV?=
 =?utf-8?B?ZEN3OTdnaHpiazJIcXRnbzljdVVKaWU0Q0crNmp1ejkreDB5RzAvSG1DbUZ4?=
 =?utf-8?B?YkUwS3lLRENtamVTenRrbW5iaTNPNmNoRTRqSHpZdkVBaTdaNFVkNXQ1YVg4?=
 =?utf-8?B?TS9KWGJSK1k4WUNSVUZPKzhIdFQ5L1Q4b0VuK2ZLTFFzR0RhQzhoaXo4emNM?=
 =?utf-8?B?M3NTT1ZXMmNlOFVnOEJBOVZVYUZUWERpT3djVVA1SzdPK2FoQTVsNGFqb2xl?=
 =?utf-8?B?WDZsQTVKNGg2SFd3OFkrRWJhZHJmY3BONWZOdzUwMHIreFpsL05PaER2M2lB?=
 =?utf-8?B?c1V1d0lrK1pPNEFaSzFrQWJlbXZFR3RFcmFrTlBIZlRXbS9nWG1oc01OcXpR?=
 =?utf-8?B?OUVkeEowcXBZK00xcHpoTmNaeXVZMUlpdFByeExTRDh2cGdKWThlamVvN2Rt?=
 =?utf-8?B?anVFSFRGTENmQVZvZG1wQnpGRkpmUWJkSkFDMjNBV3VvM1VnSjBPeVRjcWQ5?=
 =?utf-8?B?a1hDTmR0MTQ4RVU2dFhBSi9aMXF6dWprbVc3dVZINXdrVkpxbCtjTnhHVkZa?=
 =?utf-8?B?Tm92TmFHYnNwMUJyRjJZejhzTS95MlU4bGhNdm16Nm8vT25udmhQYWMxcmhR?=
 =?utf-8?B?TmVBOFF5VUJnU0xLZm5leWF0d3JrVzFXaU9LSk9neU5oMEY1YUVKVzZOQWlL?=
 =?utf-8?B?VUJOdU94aDVpY205N3lLK1Z2L1NHaDU5R2hjRlpZMlowMHFjaXEweW10cVBW?=
 =?utf-8?B?cUNZNGVIbllMQVBKdFozWTdjWG9FMVU3UUxLdkk1bkFqc3h6Zkc1cmptVjJu?=
 =?utf-8?B?cllzcWlGWmhwMURodEdDT0lGV1c2T3hLRjFEMWxYTE9oZE43ZlhRVCtGMTJV?=
 =?utf-8?B?MFlXdzIvT0d1VXZtSzI3NlJsQjZSUmVHbkdmQU5pVkJ0M1NaWTh1dmF2ZW8x?=
 =?utf-8?B?dVgxazJsVHVSUXREWmVKRlQwdUtRbnBkN1BWbFFvaGtDSnNUbElRMWVWQ3dG?=
 =?utf-8?B?cDBNOEwrRDFvUXNTcXcrZkZTYk1aOUtvSFV1R0FMQW5iWTBaSHNaMjlmbGNj?=
 =?utf-8?B?VWd5SXA1SVJNVHQveG4zNzJROFJxNW5ZVGpRd1JlN29WNVRxdWJSQ2RhTkw3?=
 =?utf-8?B?dnFheWRJMXluUTJ2ZnR2WE5hNTVKUFgyWncwN2JxTzhndmg0VUQvc2pCWm1W?=
 =?utf-8?B?aFhnVEM2V1RUaVJCYVQwSjg4U2tqekJiVTJTRjBGRkRqQ0k5UWVUNVV4VkNz?=
 =?utf-8?B?QzZWRjdVSzJGZUdEdTdxQ0FlUHVGL3liQlBLaERxaEZjUTdVNFhJMEpYUTVs?=
 =?utf-8?B?S2ltd3BaOTFKR2FyTklubENTTG5YWGhqRUpEVGF3c3J3ci9TZjRvSldZbzQ0?=
 =?utf-8?B?MUxpYlAraFh5Y1BiZFdQN29WeElXYmVrdi81bSs4dGZ0SnBFMGVCOFV6Q29h?=
 =?utf-8?B?eFJ3TXlESk13dkdZaGV4ZlVuQmNuR2lja01aZENCbWVCRittbmZCdk1wai94?=
 =?utf-8?B?WEd0RU90eUFZcDJiQzZRUmdwL2ZaQzA1K0JqRlhQQVZ0ZTlVaVQvV2lsRy9I?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 230a2410-9a54-41d2-103e-08dcd8e0abd1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 19:24:24.9406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4PgDYHDxBiKoOAmB1xETy8nYBL5vRBHwrf51lMrBsnOCGR9S2Ut2uuuRkkyFidpC17lZLYKMRPrbXNVp2VXasg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4876
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

Quoting Upadhyay, Tejas (2024-09-19 05:22:50-03:00)
>
>
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Gus=
tavo
>> Sousa
>> Sent: Thursday, September 19, 2024 2:18 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
>> Subject: [PATCH 3/3] drm/xe/xe2: Add performance tuning for L3 cache
>> flushing
>>=20
>> A recommended performance tuning for LNL related to L3 cache flushing wa=
s
>> recently introduced in Bspec. Implement it.
>>=20
>> Bspec: 70821
>
>Yes bspec needs an update.

Yep.

>
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 5 +++++
>>  drivers/gpu/drm/xe/xe_tuning.c       | 8 ++++++++
>>  2 files changed, 13 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 6ec2d2c11d77..ccd18cdd5b50 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -389,6 +389,9 @@
>>  #define L3SQCREG3                                XE_REG_MCR(0xb108)
>>  #define   COMPPWOVERFETCHEN                        REG_BIT(28)
>>=20
>> +#define SCRATCH3LBCF
>>         XE_REG_MCR(0xb154)
>
>Please name this SCRATCH3 only as bspec mentions.

Looking at our register database, it looks like there are other
"SCRATCH" registers from other units. So wouldn't it be better not to
use plain SCRATCH3 here?

Probably SCRATCH3_LBCF for more readability...

>
>> +#define   RWFLUSHALLEN                                REG_BIT(17)
>> +
>>  #define XEHP_L3SQCREG5
>>         XE_REG_MCR(0xb158)
>>  #define   L3_PWM_TIMER_INIT_VAL_MASK                REG_GENMASK(9, 0)
>>=20
>> @@ -406,6 +409,8 @@
>>=20
>>  #define XE2LPM_L3SQCREG3                        XE_REG_MCR(0xb608)
>>=20
>> +#define XE2LPM_SCRATCH3LBCF
>>         XE_REG_MCR(0xb654)
>
>Agree with other review that we should name this MEDIA_SCRATCH3 for future=
 use well. Also this does not look to be MCR reg. Please double check.

I believe the prefix XE2LPM_ is enough to differentiate this from the
primary GT version of this register. It is common to prefix registers
with the name of the IP that introduce the difference with respect to
other versions of the register.

Please note that the same pattern is used for other registers that have
different offsets on the media GT.

--
Gustavo Sousa

>
>With that addressed,=20
>Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>
>> +
>>  #define XE2LPM_L3SQCREG5                        XE_REG_MCR(0xb658)
>>=20
>>  #define XE2_TDF_CTRL                                XE_REG(0xb418)
>> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuni=
ng.c
>> index f62622f0be85..4dd77b44ac82 100644
>> --- a/drivers/gpu/drm/xe/xe_tuning.c
>> +++ b/drivers/gpu/drm/xe/xe_tuning.c
>> @@ -80,6 +80,14 @@ static const struct xe_rtp_entry_sr gt_tunings[] =3D =
{
>>=20
>> XE_RTP_ACTIONS(FIELD_SET(XELPMP_STATELESS_COMPRESSION_CTRL,
>> UNIFIED_COMPRESSION_FORMAT,
>>=20
>> REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
>>          },
>> +        { XE_RTP_NAME("Tuning: L3 RW flush all Cache"),
>> +          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004,
>> XE_RTP_END_VERSION_UNDEFINED)),
>> +          XE_RTP_ACTIONS(SET(SCRATCH3, RWFLUSHALLEN))
>> +        },
>> +        { XE_RTP_NAME("Tuning: L3 RW flush all cache - media"),
>> +          XE_RTP_RULES(MEDIA_VERSION_RANGE(2000,
>> XE_RTP_END_VERSION_UNDEFINED)),
>> +          XE_RTP_ACTIONS(SET(XE2LPM_SCRATCH3LBCF, RWFLUSHALLEN))
>> +        },
>>          {}
>>  };
>>=20
>> --
>> 2.46.1
>
