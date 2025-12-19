Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED98D711D2
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 01:10:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4B910EC22;
	Fri, 19 Dec 2025 01:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R2GXO86A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E85C10EC22
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 01:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766106633; x=1797642633;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5fgQIXRdzyoHFJI8+ZFaH1YyNRLBlTr3dC6S7UyNaGU=;
 b=R2GXO86AdC1GQp82b8VNMpLgoiieS5WVMZXGWSj7Z90miD3Xd28B4CIQ
 S5C6Wr8EYK/FEDreZDiTzitjVzP+xxOEnGSeAkiDapXfHJ4/AgR4IxTKY
 gvdN1RLftHutcfdktyTHbLU8OvPc5EIglR2mxdNyTFKdeWlWfIhg42qsG
 M+nAYAB6cFG3XYrX0fLW8ln5/NBXa2JXBSvuk10xK4FGW7THZeWd966Ba
 Pr/To2/lDqGxAFQ63Y3lf8w8mxPzwojB2asAgfInrWNsNAISpNvU7nJ7F
 5WDQIDX2Yn84MLzCvGWA1mMwyZdgwpmOfMyBVkckS46uzU1niut4eaQxI Q==;
X-CSE-ConnectionGUID: ettVB3KyRduYksmAKbnjqg==
X-CSE-MsgGUID: IgB4C++FQuqwN4FA3Y85oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78706777"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="78706777"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 17:10:33 -0800
X-CSE-ConnectionGUID: JSnrhMgfS7ivlnUeDacVag==
X-CSE-MsgGUID: p3+k5052TriGVYnntMxUwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="197876148"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 17:10:32 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 17:10:31 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 17:10:31 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 17:10:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gA64D5zHCPJM5goSbVKvCQTljp3xGjYm1hN4qTZU7bfCPfvNx8aOxFz6Aj2/42zLQhWuHmxcUsH5cHOC8SyjKA8ofag2MFco+XGrATqTYerifd9NM7Nsybmja02RIkDmv3dCJ90cKeJRhCnjqw1q1XHwJTW5EFuqKf84IB9VRBIANicH4klpJ+eKTDQVwyzrMsTSmR8wNrmWr0RHyHJDEzH/8ob9WhytCHPI2pmc9naKesFNOvp4ua+Yxtt6MKrhXFOHdXJLvIj9OPoDXjnvaQ1yreuq0t5JHsAwRwj/VSvajWuPRsfkMX7R/e+uPXS+HqklEHzLJT8m13JCJ87TKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEsYXsF/WAwlkx3ZZAxLkSQnykz9puVRcYxrx+BodOg=;
 b=LeB5eJ3EiYjJNVpKW+yd7DORjoAj5BWV0B5gwFJ9hgdeLndQOk3gaD/Kw8YVk1Kx62h99YepCOqFgDK6Gz2bMAutping/IDYj8YeAV3tUcT2shjy1nl4gypXLkVhPyFw6rGK2z8cyFRc+GmIUteqq1G6N3C2+c08cHpYM86xsLwKBd/Uvv3cPRCzvsMtCCWSjLZJPv+SIVfUlgc2zCy5sFZPOcRIDIw94vSn1mfrCMjrnhwl81BuF9VWA4QgvGj6EHtXjfFbFtycqdhyBhOyDazJg8eto+Xk3M0VX4FVsIi95SoIrZBRxPhuOs6UrmmJ/byzt/LA8eJyNZ6anlPBIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7425.namprd11.prod.outlook.com (2603:10b6:a03:4c0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 01:10:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 01:10:27 +0000
Date: Thu, 18 Dec 2025 17:10:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/3] drm/xe: Trigger queue cleanup if not in wedged
 mode 2
Message-ID: <aUSmAdQ8bY3GjlFJ@lstrano-desk.jf.intel.com>
References: <20251218214418.4037401-1-matthew.brost@intel.com>
 <20251218214418.4037401-4-matthew.brost@intel.com>
 <24018a6e534cba02a43e7036eed4bf8965b30f4f.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24018a6e534cba02a43e7036eed4bf8965b30f4f.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0254.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b868448-23d6-405d-e000-08de3e9b6585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGpCUTYvNGF1cDkrK1A3VmdTcjdNMlRrS3JtcWdoUTNNL1ViNDdzYlJ6NkEx?=
 =?utf-8?B?cEFweklOd2RJd2tLQVNJVDQ1YWRJS0crVWRoMThQYzhvYnF4clFVdW82OENM?=
 =?utf-8?B?bGdvL3J4eERXd2l2R25aa0R5bkpzT2o3d29peUNqVVVpQ0pLdnpaT3NiOTZ2?=
 =?utf-8?B?R2d6b3lQOHNJbm9kYW8vSDdkSnljTUpDYkJBMFRGOVVqa0V6dTI1b3FiTEIy?=
 =?utf-8?B?b2NXUFZMMW5XbEFxYTJVN2VtMWx3VW9GOElrd3R2UktNNHpaa3N2OCtOdUVP?=
 =?utf-8?B?cEt5N2tLdlZsbnpESm9Uc2x6RUdiTENteXRPS2NoZFlQMVEvQWROWUFyMXg5?=
 =?utf-8?B?MGlsWnNUV3BLVGV2TjNrZkVCR2s4ZW5nNXdXaWlyNHJRL0xuN3lSenJEM0FD?=
 =?utf-8?B?WHIvTEFVTGcvREowSGZmL05GVVZUMUsrMHZ2R2lkOTY1MzZmT1lqVmkzWFJF?=
 =?utf-8?B?VUR2dEN3bVhqeER6eERsYkswaTdXQnZTalpkQ0FXd0tUTFIxUEhlalZPRk5C?=
 =?utf-8?B?QVFPTUxRQWpRVEZzZXc4MTI3NVBSd0diNmxCdFkyeGF5elpRbEZ4U3RPZ1d1?=
 =?utf-8?B?N3F0QWtQL3lwUmlTeDRFc05IYlYzczhudHBJWHB6Y1MvNm5DTjNjeURERUMy?=
 =?utf-8?B?Wlp3aUdFZk5BelRwQUt5WVlpQzYwYkk4SmYxWmsydnJOSnd3dTRaK202NHZL?=
 =?utf-8?B?bFIvTjRsMUdKRnlzSTdveTQxdWZnSUZhbzY2WTc0bnh3MXlBbnIyYmJrNUx6?=
 =?utf-8?B?N1VJZ1JwZGZzRnU0eG84dUFDVEFLQkgyV0NrM2dubkR1OGxmeUlqZUlTV1BY?=
 =?utf-8?B?eG40R05MdUt5bTZWclJFMzNmKzAyWU5WaTh0czZXT0lxQm1mWG9hNWFFZ0JU?=
 =?utf-8?B?L3E5dkNxczkxWmpjN2IyVGZNclNyWXl3eHJKbGlxZ21FTnIzSDUvTURJbDdJ?=
 =?utf-8?B?MUFqdXBrUDB5NGN6MkxRbzl1R01JdHlWZlRKT2lZaUQzeHRiTHVqSXVzYmJn?=
 =?utf-8?B?Wi9Bb201R3ZYLzBxRkZqODFUeVN3VjJKY1FITlozZi9wTDNvSm5wRlFaZGJN?=
 =?utf-8?B?dEdnMEduc1Y5U3BYMXVEc2ptbGljbHptR2c1SWE3T0lzMXV2Y1F2RHBiT2E2?=
 =?utf-8?B?MktSa09vR0FUV0NaZGgrQkNuK3lWcTR2QlRvVUJ1MU9DU1JBWmJDdXRhL2xl?=
 =?utf-8?B?Y0J0MGRwdTc3QWpKWGEvblUzMVR6K0RDRWxiMXc1NmMrWW5yWXJrdWtna3lI?=
 =?utf-8?B?THNIcVU0MGpwUmF0N0V1VzJNdWdyUk5wR1FoT2NNcEI4d1hlN2lGV1JHSmM0?=
 =?utf-8?B?VzBhclhJZnQxUVNWbFRDd0ZvMEVxOEwrK0dWK08vZkNSS3FQbml6dEU5KzRm?=
 =?utf-8?B?YXV5VlY4Uk8xczZQU1NZWkthbm5PTUE3UG1OaE4rbUdxT0xKWE1VTTd1aTJa?=
 =?utf-8?B?RWVXUUtvZ2FLbDBNdG1kcVMydmFMR296d25ZdURzSTBFRGZwRVVnVmh1RXFv?=
 =?utf-8?B?dFFTYklDOVVSRmpHMWRiMlJhVkhUdzIxaXhVMGRBRHJpenVrREFCc1FtdWtQ?=
 =?utf-8?B?VVdueDZQbmt6eFU3UTZEY3BNZWJ5dFNkdmZNVWJoTHlBN3dUV2twT0JEV0xz?=
 =?utf-8?B?MEFZR0I1d1dHL2s1aFNzeWtyTy9vcE1HbS9YODZKbW1kYld2K1ZlM2Fiak0y?=
 =?utf-8?B?MDRyeUpzeUxvTVdCcjRKM09hVmd1aGZ2a2k2dUx2L1FaUjgvMHp5dityOXY4?=
 =?utf-8?B?c2tiNTVVSXpGU0pmdk1FcXN2cW5BNUpMUThjYkxGQVNrR1RKbjBJTUJsTytI?=
 =?utf-8?B?WmJ2Z3lsRmsyOUxodEowVUZXUklxd05sZ1ZwNUhPNThrSWlBdWhzZGR3L1hK?=
 =?utf-8?B?QTg3dTlTWkFuWHh6TzJBM0JVNVYvc3VWUXdGWXovT1F6U0kwRi9yZDBFNnpU?=
 =?utf-8?Q?Dq7SEFM/8lFCEgrJ214ciPgaU9QVcx8J?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUVsOVhBa1VqVmozMDhEdERmVE1XSi9SbXNLaFF1NStqcUlzdFpQRVRGTVli?=
 =?utf-8?B?QzgvS2p3K3ZXeW9VQkVSNjFRS0ppMGoxNzlWQXo5S2k5YnduR0tjd0hEd2VO?=
 =?utf-8?B?Y0MwZ3JLbXQ4Q1Q1dnJYdHNNOG4yUW16MVFTWm5ZNFBURDdHZ2QzbFBEcG9O?=
 =?utf-8?B?Z3M3SVJGTllyam9XM05LRDkwVHlDNUljNjZzY0p4cElPbjNYeTJaVW5pUXFx?=
 =?utf-8?B?M21Rdm5Ham1neTJMOThzZS81anZ0aisyOHREWHNEczI5U05rUVFvZHAxOVIz?=
 =?utf-8?B?Vnp2K0luQllKWXQ5MzBKSC9PaGV4NG1OVS9ZWW5hUE84Y2FXWERoN25Qc0Vl?=
 =?utf-8?B?eGpGNVBET016SUwwd2hQTEpkUDlwc3R0YktuMmN6MGcxcnJWZVR2Ym5teVVs?=
 =?utf-8?B?V3RUT3QzV1RxK0xwdmtTUWlvUHN2UXR4UVArNSszaUlvU2pWQzQvVGwzdjlz?=
 =?utf-8?B?RmppVlVQdGYrMkxEUmdDVnc2dU12K3ZLUkN2OFNFMUdmR0ZZb1pRekI4Mi9U?=
 =?utf-8?B?djU5RkhKMFRuc2I4NkQvNEpRVUNZQ3d5V09pM2RXSVFoT0d6VDIrZTArTm15?=
 =?utf-8?B?bFRnWllsZ0Rsb0tGbTJlNEd5MkcrUW5tQ3BLbUUxNDc3N3g0M2VuRU85cUhV?=
 =?utf-8?B?Y25wWGNGUkY2Sk1oajVrZTRWM3FZSy8yWWgwWW16MGdCdkJSQnBaYS9YeFpm?=
 =?utf-8?B?bXozb2J2b1pSQXRYSDI0dHNCKzVRTm9qMitaWG5iZnpCbXdhZGZhZmFsTE5y?=
 =?utf-8?B?VU4zQU0ydVBQazk3SStGbDhnMDVBNkFEb015b0dCL2pRN1lXdnFiR2p3MUZY?=
 =?utf-8?B?NjNSSjhURkRJNFBzWWx0YU9oWXk3Tm1QcmJzb01ZeTBtSUNrbVdsVSttZzlr?=
 =?utf-8?B?Q3FKL21qNHZocGlNY0FDKzRXSzlvcmpOSnlPWFJXRWlXM2VNeWcxTGVyMFRD?=
 =?utf-8?B?a3MvN01scmZucldUQ3RDdFlvcmpvTEh6V2NZd2lyUjNsSnRVL1JpZC9vWVNY?=
 =?utf-8?B?Z3lzSjN6WW96NWtGRzRUbGo2eEpzaE5IVHcrV2tlSmJEbCtPcXpOWXI4UkVP?=
 =?utf-8?B?YmdEQzYvTm1pYkFRS1Uzb3labEk4WTY0cmJjMnIrUmZtbHlwNjd0UmtScFBZ?=
 =?utf-8?B?dm4zWjBXaHZlQXhkYzRSM216c1dvMlhlbVppZjdMOW9jdHcxNFdLc3hDM0Z5?=
 =?utf-8?B?T3hFUUZjd1lNVzQ0Vm9VRG1sVDFTaUlMQVd6QXIybm1NcEpjeXJKRzFnbmhX?=
 =?utf-8?B?M0MrRWkwMDI3RGgrZDNFSHJmVHhISC90YUtDbk0zbVVQMk1QckhjK1oxMkZH?=
 =?utf-8?B?cmZmMEJRRlZyVmxEZHJ6cjMycVlSZWRaeGc2cERhRis1L0FLNFhSMUNxdG1Y?=
 =?utf-8?B?UkJ0TEdpSW82VURHL2lSdnVSa2l6aTU4Y1NGTWgzTFdjZ205V05ybUtRczVO?=
 =?utf-8?B?Wk1zdFhPeEN1L2ZvWElQSER2SnhiczlWeGdFNkl3SEFpQWN6cXhQNlVSeVpN?=
 =?utf-8?B?bUhGYUlBUG5LNERRUzJOUkk3QnFkRWp1L1NiSFRtYnZuZ2Rya3ppTDRuRjYy?=
 =?utf-8?B?SGV4a3JsY3E1bWtIalM1OXBMNk5FQ2FxaE83VVZPMk9NcEIvT1kzcWNMME5O?=
 =?utf-8?B?QU40cTJTc2lPUHNMd0IwUFJJc2ZOdWhuc21BeXEzdGdJYkhLeU55cEFVeU02?=
 =?utf-8?B?VXovbnhOc2cyVlYvMmxpK0ZoeUYrUHVoaHNBTzB5eFZNV0VDN2NQOEFwVUdL?=
 =?utf-8?B?aXlvYkQwTzZnKzlRT2FOdkNMZXJSenY0RmV4U01iMGYzQ2RIN1FWWEtFbW5y?=
 =?utf-8?B?Y1BwaCtEMFVwN2NCTUgrOWxaSkJjb3V3WnN6WkdyYjlxT2IrTXl0akxYalFR?=
 =?utf-8?B?SEpiTGR2aFg1eGhJWDd1ZkxDVHRnK1E0c1pUR1c4UlFGOGV4OXNFTGc3MzBu?=
 =?utf-8?B?NWl2VnNFek5MNnU2Q1k4cmprcnlsOTJZOFJuTkRtM1EvUmFsK0tBMkhHM3Zz?=
 =?utf-8?B?RnN6bG8rNFpmdFhYalBYcmZSNDNPbUFRbVRrNkxDbU53Nk0rUC9PT1grdjUz?=
 =?utf-8?B?NEx2bHB3ZUk3ZkRvMGRCM3hDNVJDN0JpaHFoVFV2RFRlR3NiQ1YzeTVtZVlt?=
 =?utf-8?B?cjJPaDEyZDBkRllWOGpTWEtEd1d1V0VXeEt6L2pDL2VPcE9JVEJ2bktjMmt4?=
 =?utf-8?B?Y0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b868448-23d6-405d-e000-08de3e9b6585
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 01:10:27.8981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0Rxnj14GqoVqpJspMIVTcriYt86aoGibYc07qQW5/33auFxSrF0a+Ub5yxPwuP+38bsOOGjXLopvug7HL8D6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7425
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

On Thu, Dec 18, 2025 at 04:45:02PM -0700, Summers, Stuart wrote:
> On Thu, 2025-12-18 at 13:44 -0800, Matthew Brost wrote:
> > The intent of wedging a device is to allow queues to continue running
> > only in wedged mode 2. In other modes, queues should initiate cleanup
> > and signal all remaining fences. Fix xe_guc_submit_wedge to correctly
> > clean up queues when wedge mode != 2.
> 
> Yeah this makes sense. Should we use this for the fixes instead though?
> 
> commit 8ed9aaae39f39130b7a3eb2726be05d7f64b344c
> Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Date:   Tue Apr 23 18:18:16 2024 -0400
> 
>     drm/xe: Force wedged state and block GT reset upon any GPU hang
> 

Maybe both? I suspect those went into the same kernel release.

Either way, this series won’t apply cleanly to any stable tree. I’ll
follow up with Rodrigo and Thomas on a strategy here, as this is
definitely something we need to get into all stable trees as wedging can
take down the machine.

We also need to expand our IGT coverage so that we run jobs (likely with
userptr), forcefully wedge, and ensure there are no hangs.

I’ll open a Jira now for this test case.

Matt

> Thanks,
> Stuart
> 
> > 
> > Fixes: 7dbe8af13c18 ("drm/xe: Wedge the entire device")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > ---
> > 
> > This fix will not apply outright to any stable kernel as it depeneds
> > on
> > functions which have added in the KMD since the original commit.
> > Likely
> > will have to manually send out patches to stable for kernel which
> > we'd
> > like to fix.
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 31 ++++++++++++++++++----------
> > --
> >  1 file changed, 19 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 58ec94439df1..63b984f6d78d 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1313,6 +1313,7 @@ static void
> > disable_scheduling_deregister(struct xe_guc *guc,
> >   */
> >  void xe_guc_submit_wedge(struct xe_guc *guc)
> >  {
> > +       struct xe_device *xe = guc_to_xe(guc);
> >         struct xe_gt *gt = guc_to_gt(guc);
> >         struct xe_exec_queue *q;
> >         unsigned long index;
> > @@ -1327,19 +1328,25 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
> >         if (!guc->submission_state.initialized)
> >                 return;
> >  
> > -       err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
> > -                                      guc_submit_wedged_fini, guc);
> > -       if (err) {
> > -               xe_gt_err(gt, "Failed to register clean-up on
> > wedged.mode=2; "
> > -                         "Although device is wedged.\n");
> > -               return;
> > -       }
> > +       if (xe->wedged.mode == 2) {
> > +               err = devm_add_action_or_reset(guc_to_xe(guc)-
> > >drm.dev,
> > +                                             
> > guc_submit_wedged_fini, guc);
> > +               if (err) {
> > +                       xe_gt_err(gt, "Failed to register clean-up on
> > wedged.mode=2; "
> > +                                 "Although device is wedged.\n");
> > +                       return;
> > +               }
> >  
> > -       mutex_lock(&guc->submission_state.lock);
> > -       xa_for_each(&guc->submission_state.exec_queue_lookup, index,
> > q)
> > -               if (xe_exec_queue_get_unless_zero(q))
> > -                       set_exec_queue_wedged(q);
> > -       mutex_unlock(&guc->submission_state.lock);
> > +               mutex_lock(&guc->submission_state.lock);
> > +               xa_for_each(&guc->submission_state.exec_queue_lookup,
> > index, q)
> > +                       if (xe_exec_queue_get_unless_zero(q))
> > +                               set_exec_queue_wedged(q);
> > +               mutex_unlock(&guc->submission_state.lock);
> > +       } else {
> > +               /* Forcefully kill any remaining exec queues, signal
> > fences */
> > +               xe_guc_submit_stop(guc);
> > +               xe_guc_submit_pause_abort(guc);
> > +       }
> >  }
> >  
> >  static bool guc_submit_hint_wedged(struct xe_guc *guc)
> 
