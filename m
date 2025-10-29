Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE578CCF9EE
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 21:39:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57EAC10E140;
	Wed, 29 Oct 2025 21:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RvuA+B/U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A96910E140
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 21:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761773960; x=1793309960;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pWzE+2bIT9VoWgG3o7mU6LNqTIsYBn9JSlANq7nn7mQ=;
 b=RvuA+B/UBpEsT6SkcigZzJzvT/faBxvmNL8Dw7xgFs0iJfaQEBiNfwKB
 PCnKSrWI/PfxR5ZBYMphhCC6TGywvLGfBob6ncT6aaUyPTMdcPiObLZrC
 QZUv/I3JkRWFrlpecc352Fs+Sj/93d/mKArdJtpbQrD+ThiAjmazII7O1
 A+KRG7iP9OK4hLNE8BbxV4rIuVA7+xpNcv87NCf5yG4KPNFbsGQyqzihH
 7KGI8VsEnC6PDJQmnIUrqgwSZZQjcyBZkryYK9uwTx0m5p57SlQnEHLz2
 px4LEZ6a0PInzdBLEYfsdwYUiZ9VaILhbuA9FNWrp+L17DlJA76fPUKwo Q==;
X-CSE-ConnectionGUID: vNaoSCPyQ4KM1ZXOGncbtw==
X-CSE-MsgGUID: fuk6qd4WSrWP65idCU2t3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63839236"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63839236"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 14:39:19 -0700
X-CSE-ConnectionGUID: P0q0C4DHRlSiMoo5OU9aWA==
X-CSE-MsgGUID: 5PzaOb+2SrS8Nx+xjq34kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="185862938"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 14:39:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 14:39:18 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 14:39:18 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 14:39:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/XKUekkBVuE3lOVaOxuYKmdCEXgJKm+TCiZZZLmyVOreX9p0TAtfcfcd2po5beBfQNQuBIp7xfDibXKjqF7984NJ6mOJjD2zWapOK5qm9YprwN+yY+ItbMGp2GJHxnYcFnRNCLQExSN+iFJsu3Ht3AJKn+pML9SXI5Y+tfdsTKWJxGfe+o5i5sxRNfTDxjKqaBFNXCOFpo5ZZn2t9Z5CRSQwvERJhcbDb14idLjM+KtnidtKxFmG2Tt552xtjnHcVlqEul1chf/wW6r8IXmCOde+4CuWqMXlEmA51ZBhJVwGzaXVb0xEHUZvblvjZyQv6+AulKoSyMzijMnJ4TBCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9K4EAC5N7DzNxBKqG9Xk/ZDMFjrADBmgFUaH8H3sQU=;
 b=V55T88Pa3447I1eFcGLCRh3OEl5I2HI/k7D7Skm58xqT4+QsCSgamROalVonJG7Bs1DoaNo+pzLnBJtIC8k6hGTZfcwxafgsZOCyzyXougBSqJV9s+5LCaJ/XVJu9DkNpx0Fbl/FHY6OxLJFxismGE6dqqh1TZXAVGHvU0iarYdPf8jAqsl3eJwFatRlUxsjXH428fLdYBdUJAralHZI3WtbsMTqRPAdhr90fYw4c3xs6eH9+vZMcktaop7IQuj89T0Wem/d1gNv749TS8SucdUTsmaY8Gj7chhIdI/UkSjqsWI/R3ktUYKXVGLhXd2dbEhrLfi/ai6Taz7anZ/ChQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB4801.namprd11.prod.outlook.com (2603:10b6:303:9c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 21:39:07 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 21:39:07 +0000
Date: Wed, 29 Oct 2025 14:39:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Wang, X" <x.wang@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>
Subject: Re: [PATCH] drm/xe: Dump PAT entries with reserved mark
Message-ID: <20251029213905.GD2806654@mdroper-desk1.amr.corp.intel.com>
References: <20251022215504.5559-1-x.wang@intel.com>
 <SA3PR11MB804663C2A664A60E8713D7AC86F3A@SA3PR11MB8046.namprd11.prod.outlook.com>
 <20251029194825.GF5409@mdroper-desk1.amr.corp.intel.com>
 <SA3PR11MB80467E85601D84EE3BEA906C86FAA@SA3PR11MB8046.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SA3PR11MB80467E85601D84EE3BEA906C86FAA@SA3PR11MB8046.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY3PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB4801:EE_
X-MS-Office365-Filtering-Correlation-Id: 20bd8076-520a-48d7-4e29-08de173396d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bE96VUIyMzBSZjY3eTNQS3RaN29HeFNxdHRPUEswV3pnek4rVXhVbmVQNXBM?=
 =?utf-8?B?eDZiT3RPS0hYZ3lKcVlsSlg1OUtzU1p4dlBLZkFOa0ZDR0NhVzhBOCszbWRs?=
 =?utf-8?B?TzlaZFFRTk1sUmJrVDNwNTRadlRkSEZSb1dycGVQcnlHRUxPOVFTak9yMEFT?=
 =?utf-8?B?UGVjSm5uTDZYdloxUFdVM1N5eTNEeXZmRFFUaU9kZVkyUFBZdkgxTDROVDBN?=
 =?utf-8?B?VEk5bzYwbkFxczRSalZRcWVNdnIvT3JkalJ4NHJ3dXFoUjZmUDBEN3UxZ0pr?=
 =?utf-8?B?cnN3ZUpUdmRyUitNY09peXNUZEltY3QyNklMT213YTVVUlRTeHBwWklBRCti?=
 =?utf-8?B?cG8zeldmZE83eHUra3BYR3c1VG1Ld2lqbHhJbEdWcXZzZy9jQStYcnpWZmh1?=
 =?utf-8?B?OHEwakk2eTZiRFoxN0REYno1djNxcER0a2VGZTZjNkxoZDVkR0FqcTh0aDIz?=
 =?utf-8?B?RDJhKzY4MFRoblNkQXhwc0tCSmJmS2JjM3ZwWU84R3dPWTNSdmFTOHIrQ09h?=
 =?utf-8?B?R2FnazJldzc0Rm1XUS9HdFlRYjdtWldpRmJ4VWl2L25aWlE1U3JkZm9jeE1o?=
 =?utf-8?B?Z0t5NnVYK1RaRGg4UnFmRkNFYjZWakVYTWlGUkNrdlZVY3p1RUNhSHhZOE0z?=
 =?utf-8?B?RWRMNlJlcHFOSHNOb1lhTk1MZzV6cDc4KzFNSXpoZmtNWUt5bENIY3NYbnhs?=
 =?utf-8?B?Zkx2bjljSnFSME9qU3BZejkwd0tIMHREaFBvZ21FSk5MeldBNkh2dzJLUXE5?=
 =?utf-8?B?MnVhOGdWdEs4bEM1VDVnanNXZ3JNdy9Ma3lkemV5dUt0THVkUS9sclZrUzdU?=
 =?utf-8?B?R0VNdEFNV2IrTytsNlkrWnlHQUR2SFRtR1dqay9XWmk1MFlncVlnNjkzQTNW?=
 =?utf-8?B?MFJxczNYMmRPRUY0Uzl3VEVqTWZkWlB6T3B3SHVLOGt2WnF6Z3kvbmFQdSsx?=
 =?utf-8?B?b0F2V1hDOTRpM2R6c3UxMThhNGFYRUtEMlYxdzFwZ1o4Q0g0Y0xteW44eUk2?=
 =?utf-8?B?dWk0MlVaRkdRRjNTTjEwVzM4TGx1M0dUK3lTQURrbDBpZGt0NmdmY0NQbzBU?=
 =?utf-8?B?bzRLQVNGangwbW00UU1HRTVUMXV6aDBTcjdFVWRHZkJ1c2plNmJaL3RpZDdK?=
 =?utf-8?B?ZFpBTlhGdzJCdmhXTDR1bFc3WE53Ykp3YXhyNWdaQkIwQUcwSHl2VW5jT2tM?=
 =?utf-8?B?VGI5b1N3UjE4OFVVOGZUanhKMStlTlA2MXM4dG1tNDl5ZlI4eVFIc0JCU3h0?=
 =?utf-8?B?SVVob2FIZ2IrY0p6TVVnQ3NScEFXTWJ0dE82bElYUkNlL3B2THplT3UwSTJy?=
 =?utf-8?B?WitCQU90MTNSSHg0YTBtUjcyaUVNWGZzamV0QmJ6UW1VR09uNnF4ZWlLZGJh?=
 =?utf-8?B?cktJQWlFNmNBS3dSNHcwRzhZa3o2U1FwVURHTThiQlJNY1k2VzFtanhpdkU1?=
 =?utf-8?B?dmNsazRXREdJZm9FR1U2Q0F5bVhBaW9nSnVMVTZhSnZvZ2FJbEp1SUVhK2dY?=
 =?utf-8?B?OUh3RTVmMDA5WS9nbmVvM3JtL1lyQjVFTkF3QXRpY0FUQ3lUZGxZc2l4SkVw?=
 =?utf-8?B?MVNxQW5rQUloNDlxQnM4T2tVeWMxTTFOdm5yZzJvclVWcklCSU9BVmgybU1a?=
 =?utf-8?B?MGpMa2E5WkFKTWVtOHpXL0FMSk90YnQ0Uk0wbEdPeWNrd3lJWkpwK1BSWklC?=
 =?utf-8?B?OHpkNmd3WUxRYnEvdEJuYkVmOHJpcENmS2hNUzdtL3BETnRieDZ1blorY0Ro?=
 =?utf-8?B?dXNjR2RENmNudWpKVStiOUJJc1lUcGcrV0M2STJtYkVFVmlZdG1WcEZqay9J?=
 =?utf-8?B?OGlUUTZrYm1UbFZzT2VHYjY5N1NlcTY5dzE0Vk43ZFRHQnNucmhsVFpod3hU?=
 =?utf-8?B?SW10UmRPUm1OWTBuVGdpcElUTlcyT1NkaTV6THV4all2TUttU2NPdklick1E?=
 =?utf-8?Q?m4C4qLmE8kU+t9OXMRSr5mGV33//qhGA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnI1Z2k4bC9Ha3R4eXgzc0dVSXExRHU2eVhSUXBxOS9NZXA3NnRUQ2EydTJH?=
 =?utf-8?B?TnNWUGptTSthcE0wQTJVOGtzUkdzSGlnNEMzZXhLNEdHMjFxVnhQQWRuN0Y1?=
 =?utf-8?B?THp1VkYwQlZTamZpaXB3S3RwTUJoV2x1VThMek40dG5MRGlTcnZwQkNmWmVL?=
 =?utf-8?B?SFlCUk5hZXNxT3R5MnhCaEhHT2ZpbXlOdVhyTEd3bXBPSHNuQTdVQSszM3dU?=
 =?utf-8?B?aFRPOURTZHVRaGpxR1BkTFY0bGRlcElCYVVieVpDZk1BU2JNeEp1MXFLeFNq?=
 =?utf-8?B?T25iQWhIdnM1cjM1V3I4eUpLSThKQUFxK2FOL3RaZWs4andVU0ppZG0vNkJK?=
 =?utf-8?B?bFNVMHJsTzN4aEZtSzNYaW9FZi9JblBwRVp4aXNWNzdXck8wWjhXcG5Kdk5C?=
 =?utf-8?B?VTIyTFViTFEyTi9NVDROWVVtbTNLWDEzN29vZ2dITzMrNVcxQks3cGY0ckRi?=
 =?utf-8?B?c0hDRVlYNnEvMzh1ajVuQVZZM2JkYTRJNHdXMS9LQ2w4cjM1bGxOLy8zaE5o?=
 =?utf-8?B?N3dZYy9ScEtQaU5MbkNDdG55aHo4MVhWUnlOTDNGNEVidkFCVG8xWEtGakpR?=
 =?utf-8?B?RzNXWm1JUjc2dE9SekJreW9EWnM3S3pXTDdKR2gxc1BZS3VLVVRxeDY3ZFlL?=
 =?utf-8?B?NXYxZEVIMmRIUUVzZVMxYlR0UjRFczZjUndiOTdvVVQyZnBQelhoaFJRYWI5?=
 =?utf-8?B?V1d5NnZNd1EyWGJIQ3JuNXJiaDdmYlRCWHE1a0k0VCtRVVl0bkxJeERIOTQr?=
 =?utf-8?B?YTN6cnk3NFVpSm5xb2FNU3RpenJDTGp2aVZ4WHBBVUpZNkZCR29CUjFUV2ZP?=
 =?utf-8?B?amtueTZuOHp4dzEwdGpqU0dZQTZTT1J5YWdrQjVqbzJNUjE3UlBMSnJ3Nmg5?=
 =?utf-8?B?NFVvZ3ZBd2lEOW5zYy9kZWdXeTVyZWh3blhCcVp4dUtyQnlyK1ZrMHVXeW1C?=
 =?utf-8?B?SW1QWUY5cHovdzZ2bHhYald1V0YyMXBNTHVkLzA1L0F2MUFLMVlmTUF5OTRz?=
 =?utf-8?B?UmgzbjRzMXpHZENkcUZMVEFuZDVSU1BDejl6SU5uc2FzZ3AwVXphOWNLTUc3?=
 =?utf-8?B?eTJzelE0RVdEeEswdWUyZENOeTBtaXRNbTE5SUIxVnNZRkN5ZFBpbkF6Szc3?=
 =?utf-8?B?bytlNDUwSEdhL0MydktCQ1JQNjBkZWVwQUVDczE0d0VEN3FNbDBaNUpqY1N2?=
 =?utf-8?B?cFdyS0JMTkEvVHpRK015RzBtSlN2ZzI1MERQem1WbTFIQkZyRWN4emRreTYy?=
 =?utf-8?B?VUJUM3NzUXRjcVRldGptVVZyMTlqSFZJSHlyc0Yzbkg3Qm1wejJXVjAvM3RM?=
 =?utf-8?B?aXNzcEN6U2hxTWRtbXBHam40WVI4UHp0eFlHMkNTQ2p0NUVVODFSSnR3OEhD?=
 =?utf-8?B?UUZaTEJiU1ppOU43QXdmQ3JrOTQ2bzdQMVJhQWY4dmI1UFQrV29nZE9TZXFH?=
 =?utf-8?B?RWhoUE9ROGZnR2o5T29nV0JrNzg5TGNEMWhwdThZN2NLd2FCcUZXYjBJajh2?=
 =?utf-8?B?ZlBzejRTVUw2MTZzQXhTMURmLzJOVjFOUGhLK1YxUXA3MXVrOW90Q2g4QWRN?=
 =?utf-8?B?b0wxdFF4QU5qTjd3RkwxdW5VcHZiNzEzSTZWMk1FeEUvUzUxbW9iWVVDbHFD?=
 =?utf-8?B?SjNVWnhUdTZUZlpUQUYrNGFEZm5Nc1E5MklJcFRnNklHaWJzQUVwR3FmOFRz?=
 =?utf-8?B?VVJpSzVUcldQTFlSWWpVV2Z3eXlOb2FJWjF1dm5YVE5zTmxWdUtvM1BuWWlI?=
 =?utf-8?B?YjhLNDRaT1BvYWJLVnBBcU5VOEtzOVdUZVczVEsxWlNGa25TbzBRL1hWUFlF?=
 =?utf-8?B?cGNPdFFNVlFKKy9YNkMyc2NMSGhFSk9FY3FQdFM4cVpSbVd0MlNOZ2xSVy9T?=
 =?utf-8?B?MmUwb05qRExGUmxBaWdKRXBiTTFNT2ZTNXBrUVdXOGNtVDZqb3I0UHJDVXJY?=
 =?utf-8?B?L0orZ2YyYzZNNC81QVZFbnFaTnNEajJlWWs2anhDU3ZlSWRUa0FiK1lMRVZx?=
 =?utf-8?B?ODNzOHBuMTVHbk5SL2V5UmFjMHNLQkpKTm9wZXByWitsMUlyc3huWmR0SmE2?=
 =?utf-8?B?WG11VFlnR1JHTGZ5VWtmTERTR253QUNNeU5LRFNjVDloSHgxd3ZwUnV5WGZy?=
 =?utf-8?B?VG9ZUFI4dklMU1B4dUpGcGRBMDN0VVRXQTV1OGp6SU9SVWJIeklQRnJ6SDRm?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20bd8076-520a-48d7-4e29-08de173396d2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 21:39:07.5288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4XHVDxVe8g8/5xyaW2I45cwdPj8X73mhJr2QAO3vrL286CvXQdPtD6gkxb9Tm2l4vDGl9LzeTfd1ZgX1It1vI0Xvch68flTbgEVIeG+quJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4801
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

On Wed, Oct 29, 2025 at 09:28:37PM +0000, Wang, X wrote:
> > -----Original Message-----
> > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > Sent: Wednesday, October 29, 2025 12:48
> > To: Wang, X <x.wang@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Lin, Shuicheng <shuicheng.lin@intel.com>
> > Subject: Re: [PATCH] drm/xe: Dump PAT entries with reserved mark
> > 
> > On Wed, Oct 22, 2025 at 10:09:01PM +0000, Wang, X wrote:
> > > From the gt0/pat file on BMG platform, we can easily find the pat[13]
> > > is a valid entry and PAT[16 - 19] are reserved entries.
> > >
> > > /sys/kernel/debug/dri/0/gt0# cat pat
> > > PAT table:
> > > PAT[ 0] = [ 0, 0, 0, 0, 3, 0 ]  (     0xc)
> > > PAT[ 1] = [ 0, 0, 0, 0, 3, 2 ]  (     0xe)
> > > PAT[ 2] = [ 0, 0, 0, 0, 3, 3 ]  (     0xf)
> > > PAT[ 3] = [ 0, 0, 0, 3, 3, 0 ]  (    0x3c)
> > > PAT[ 4] = [ 0, 0, 0, 3, 0, 2 ]  (    0x32)
> > > PAT[ 5] = [ 0, 0, 0, 3, 3, 2 ]  (    0x3e)
> > > PAT[ 6] = [ 1, 0, 0, 1, 3, 0 ]  (   0x41c)
> > > PAT[ 7] = [ 0, 0, 0, 3, 0, 3 ]  (    0x33)
> > > PAT[ 8] = [ 0, 0, 0, 3, 0, 0 ]  (    0x30)
> > > PAT[ 9] = [ 0, 1, 0, 0, 3, 0 ]  (   0x20c)
> > > PAT[10] = [ 0, 1, 0, 3, 0, 0 ]  (   0x230)
> > > PAT[11] = [ 1, 1, 0, 1, 3, 0 ]  (   0x61c)
> > > PAT[12] = [ 0, 1, 0, 3, 3, 0 ]  (   0x23c)
> > > PAT[13] = [ 0, 0, 0, 0, 0, 0 ]  (     0x0)
> > > PAT[14] = [ 0, 1, 0, 0, 0, 0 ]  (   0x200)
> > > PAT[15] = [ 1, 1, 0, 1, 1, 0 ]  (   0x614)
> > > PAT[16] = [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
> > > PAT[17] = [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
> > > PAT[18] = [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
> > > PAT[19] = [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
> > 
> > The general idea here looks good to me, but my only worry is that down the
> > road people who weren't involved in this discussion will wonder what the "*"
> > means if they don't dig through the code.  Maybe printing something like
> > "[rsvd]" instead of "*" would make it more obvious what it means to a human
> > viewer, without negatively impacting the automated use you have planned for
> > IGT testing?
> > 
> I agree that clarity is important. Instead of repeating [rsvd] for
> each reserved entry, which might feel a bit redundant,  we can keep
> the * marker and simply add a note after the PAT table: header, like
> this：
> 
> PAT table:  (* = reserved entry)
> 
> This way, the meaning of * is immediately clear to readers without
> needing to dig into the code, and it keeps the output concise and
> script-friendly.  Let me know if this approach works for you ? I’ll
> update the patch accordingly.

That seems fine to me as well.


Matt

> 
> Xin
> > 
> > Matt
> > 
> > > PAT[20] = [ 0, 0, 1, 0, 3, 0 ]  (    0x4c)
> > > PAT[21] = [ 0, 1, 1, 0, 3, 0 ]  (   0x24c)
> > > PAT[22] = [ 0, 0, 1, 0, 3, 2 ]  (    0x4e)
> > > PAT[23] = [ 0, 0, 1, 0, 3, 3 ]  (    0x4f)
> > > PAT[24] = [ 0, 0, 2, 0, 3, 0 ]  (    0x8c)
> > > PAT[25] = [ 0, 1, 2, 0, 3, 0 ]  (   0x28c)
> > > PAT[26] = [ 0, 0, 2, 0, 3, 2 ]  (    0x8e)
> > > PAT[27] = [ 0, 0, 2, 0, 3, 3 ]  (    0x8f)
> > > PAT[28] = [ 0, 0, 3, 0, 3, 0 ]  (    0xcc)
> > > PAT[29] = [ 0, 1, 3, 0, 3, 0 ]  (   0x2cc)
> > > PAT[30] = [ 0, 0, 3, 0, 3, 2 ]  (    0xce)
> > > PAT[31] = [ 0, 0, 3, 0, 3, 3 ]  (    0xcf)
> > > Page Table Access:
> > > PTA_MODE= [ 0, 0, 0, 0, 3, 0 ]  (     0xc)
> > >
> > >
> > > > -----Original Message-----
> > > > From: Wang, X <x.wang@intel.com>
> > > > Sent: Wednesday, October 22, 2025 14:55
> > > > To: intel-xe@lists.freedesktop.org
> > > > Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Lin, Shuicheng
> > > > <shuicheng.lin@intel.com>; Wang, X <x.wang@intel.com>
> > > > Subject: [PATCH] drm/xe: Dump PAT entries with reserved mark
> > > >
> > > > Add a marker * in the PAT dump output to indicate reserved entries
> > > > more clearly. This improves debugging and makes register inspection
> > > > easier to understand.
> > > >
> > > > Signed-off-by: Xin Wang <x.wang@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_pat.c | 8 ++++----
> > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_pat.c
> > > > b/drivers/gpu/drm/xe/xe_pat.c index 7649b554942a..82c221aacebf
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pat.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pat.c
> > > > @@ -376,14 +376,14 @@ static int xe2_dump(struct xe_gt *gt, struct
> > > > drm_printer *p)
> > > >  		else
> > > >  			pat = xe_gt_mcr_unicast_read_any(gt,
> > XE_REG_MCR(_PAT_INDEX(i)));
> > > >
> > > > -		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u, %u ]
> > > > (%#8x)\n", i,
> > > > +		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u, %u ]
> > > > (%#8x)%s\n", i,
> > > >  			   !!(pat & XE2_NO_PROMOTE),
> > > >  			   !!(pat & XE2_COMP_EN),
> > > >  			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> > > >  			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> > > >  			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> > > >  			   REG_FIELD_GET(XE2_COH_MODE, pat),
> > > > -			   pat);
> > > > +			   pat, xe->pat.table[i].coh_mode ? "" : " *");
> > > >  	}
> > > >
> > > >  	/*
> > > > @@ -431,13 +431,13 @@ static int xe3p_xpc_dump(struct xe_gt *gt,
> > > > struct drm_printer *p)
> > > >  	for (i = 0; i < xe->pat.n_entries; i++) {
> > > >  		pat = xe_gt_mcr_unicast_read_any(gt,
> > XE_REG_MCR(_PAT_INDEX(i)));
> > > >
> > > > -		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u ]  (%#8x)\n",
> > > > i,
> > > > +		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u ]
> > > > (%#8x)%s\n", i,
> > > >  			   !!(pat & XE2_NO_PROMOTE),
> > > >  			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> > > >  			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> > > >  			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> > > >  			   REG_FIELD_GET(XE2_COH_MODE, pat),
> > > > -			   pat);
> > > > +			   pat, xe->pat.table[i].coh_mode ? "" : " *");
> > > >  	}
> > > >
> > > >  	/*
> > > > --
> > > > 2.43.0
> > >
> > 
> > --
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
