Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A4ACAC5B8
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 15:17:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AD110EA8A;
	Fri, 26 Sep 2025 15:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M5T6fncP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F94F10E0F7
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 15:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758899820; x=1790435820;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=by5U+JP4EyGXxHdsosMmEb0EHe8AGaE73E0fsIWcEXQ=;
 b=M5T6fncPkpiP3ktl3AFNKiXYZS8zfLbnmYZG94Byd3YbdPk444Jsj+go
 DOtpMaDpOCY5l5LZVRgYxR+/82dEy8uIEEQrn77wQ0huWjPqiJ2HdcTC6
 uZP7j2h1oIWgPupO8afzA++HCHqjD9VAchTKDtrae1EwSUr7XJ6wQc48Z
 7T/1cgoza8+AJkElKgmmsZ2K5DjkgLM+iXnIaK9hC2JYrv0QyswrCfVJu
 3EUlNpqM0G+KQIbra85NRsw7oK6q7Yu9TQaa6edipKqbNtgNs3+1qa/PP
 KzppDtw2p3uv+O+DVEjjj7XE9pHyeSv/J08fYZCUUsNjHgwCigIOQc3+I Q==;
X-CSE-ConnectionGUID: F2rYut0nRNSJjc4cGSczng==
X-CSE-MsgGUID: S8S6y/tiS+6OnJMUdTMa5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65045953"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65045953"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:17:00 -0700
X-CSE-ConnectionGUID: ZMGnfXodT3S9+AsgPSt0aw==
X-CSE-MsgGUID: liu/j58OQg61d6sSz6XV4w==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:16:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 08:16:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 08:16:43 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.22) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 08:16:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R9pNkaDJY/bNff0+zpN1a/zciDw8qXYOiUajhNKNPKlxRSirca3N+1499/maC80vr4175mpGGPt4+PoaLekfj+bQ5gN1Q+r3P4RrqMiK0/08GJSvTNlwGPkmGddzYagJ6G9C/joqK3naOGmbifKuA4BDbMQsmbHQ3JJ1rLvlG9y6FpOsxScycyds0LmxCQdOOM0pEJ17c010x5Dck2/t+uqb1KnsiLzfzwIeLwiFq2wXas3QD9oWF98apVi8MwR+LcKEzaK/AEsTD3aFufaV6mDBnghn2W8Tktbj0cP9z72LcySS3o6mWBQ2iytiyt8+3fU8aDnefZR0DWRmlFo/pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JwKTxRADOj47RuGy9eDl6eGmr5A0Y1CTI+roMOz3Y0=;
 b=HE+zCY87gJhtxVbmdS9GB6KPb1k4DbxtnrNvQbWHHw/Yx7X+dcahDpx2gsJ62uDO5nBghB2OGquYpSnIiJ87Vb1iMSRfEYbJh2lt3Od3ngwFFbAHPaLV8RDVf4wqGtrUCEVrQrD5Ijyrzu5da8LfFj6IOd3WlhYSU0iCx0IRCvw7j/g9FXdmHnku3C9XpYIkuBgno2/FychirVPK+eSn5CNSrNdUExeUOPCn4D1KmAwyEL1EipUJjgT5YnVVEMmU7Xn6X9/+UZlgBMZsGAy6N8+YJ8oZ8ZshCiD14d4xXbVmvOCFZV60HUvXHRBx8oKx6GZKAScTcy8aaqcFat2RlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6949.namprd11.prod.outlook.com (2603:10b6:510:227::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Fri, 26 Sep
 2025 15:16:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 15:16:41 +0000
Date: Fri, 26 Sep 2025 10:16:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 6/6] drm/xe/pf: Make GGTT/LMEM debugfs files per-tile
Message-ID: <lbzuzndwkq4lwe7gwpgpbhwfnphgc3nopmubkesp5i33m4kh3x@j6qp2xl2xs7l>
References: <20250925220425.196860-1-michal.wajdeczko@intel.com>
 <20250925220425.196860-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250925220425.196860-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ2PR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:a03:505::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b431c0e-d933-4e86-de52-08ddfd0fb224
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?am05SWE1dkd3cUk3NmFPWjgwVFNpQnY4M2twSDRZM0RIU3JOMXVDWXQwVW1r?=
 =?utf-8?B?Z2FaT09zTG1yNlV0bTc0bnJ6ZWZDbXZoa1NpUUgvbW12NXNvOEx3blhqdlZM?=
 =?utf-8?B?MGNjSDdoOC83QzdoOE9NOTVKeXA3Nk9xd0NRVHB1NzZxbmFEUy83UFBUck5h?=
 =?utf-8?B?dTZKRkxRMEw0enJWNEVTakpEM3NpV0xwYkM2OGJQRG85QnhmM0Q5OStsa0Fj?=
 =?utf-8?B?cTE5Tm5Ob1U2ZU1La1ZyMHdLYkRLOU1RdnJTckRyeFc3SjZTTGxuVm9OeGxD?=
 =?utf-8?B?R1RISFZ5RlhCb0dOZmNYUU44ZExPZ01IdmZnNjd0c1BYTDEwWGd3WWpqbFA4?=
 =?utf-8?B?K2VkSkt0OWlDVStydnAvQ3lYWUM2cU55VnFqTjNySkxvTUtQYzMxdmZVNFdy?=
 =?utf-8?B?ZDEyMzI1amtTYVdhL0hzdzdjakM1WmZ2UmpycGhVTVlxb0pneVlJWkVoUVNJ?=
 =?utf-8?B?TTkwVXc4S0NEdTQrYVI4cnBlNGNveENHSyswbDcrT3cwd3NJV2tzY09JME9U?=
 =?utf-8?B?UGxpS3JhQmdZTVZjWkYxdEhBYjF0Q0tNTTN6dDB6d1RSTk5WSTVkVTRtVDJX?=
 =?utf-8?B?SGRkM3pzaURyRWNBRUtvWWtFM1VrdXBPOW5oLzUwYnhIREwrN3ExUWxZOE5u?=
 =?utf-8?B?b3dWWWNUM2c2dmJSOVI0bEFBb1dZL0ZGMzl6b3c2NFQ2RGZTU216V1c1NHFu?=
 =?utf-8?B?UEtQMHJzRkI0NjFiSXpSMEUvWVoxY0J6cDBlQUNZWDJMZ09DcTYvWXJmekti?=
 =?utf-8?B?a1hMdWlybEU2MUNzZGo1VU9FVkxkVzFsQlQ3WjF1Y3l6RWY5eG8wT1hUS1Bt?=
 =?utf-8?B?ZXF4MHc3OU4rZDE2em9xSm1yMGYxdVg1S044cWIzNFVQYWVSZnBGdjMwclpK?=
 =?utf-8?B?Umg0OG1JMmVKVmY0TnduMDhwRnNmZmxkZHZOSENEQmtzVGZkR3l4Q2dKN2dr?=
 =?utf-8?B?bW5PT2JpUnlPMncwVGhxejlzaTZEakNlR005c2diTXIwdTNSL2dCM0xSU29m?=
 =?utf-8?B?UXZ0cGRmTGY1V2hVUExmRzAxQ1BlRHNuMGQ1RG5aSEtMdjI1L3NIVHhvUHY4?=
 =?utf-8?B?aG4ya1RYZEF3UWlSOEVzTzA5R2R0NVlQMnk0K0RUUXJmTE9CT29BUGRDeHdm?=
 =?utf-8?B?N0R5KzZiQ2lReW1seGs1WnU5TDdtekpKSjM3V1dDZ3B2dFhLcmYySWJFb2R6?=
 =?utf-8?B?S1NyNzFZZ2RVY1Q5U05ZRHJxSnphQVRtTk1EcjUrTWNZaXc5a01nbktxRTk0?=
 =?utf-8?B?SjJvVnpucFltS09SL0tlcVlWVGUzK1dOOHBGWVVXeHU2blFoclQwcmR2eVMz?=
 =?utf-8?B?ak5LUkNOK05JeXNVZEtQTTR6TnJVZjA2K0dvOEJiTTdQdG9oYUlyLzVWUVFK?=
 =?utf-8?B?MGJoQjQyYzF4TlhYREpKeGt2RnVaODBDR3NPTHUybkxSaWNySWtOckxSWWVT?=
 =?utf-8?B?SjRadU11R2R4R2F3L29CT2JiSWdUNEZZRVhvY1hyNXMzLzNrYlpDWW1MUXZ4?=
 =?utf-8?B?WFNka2xTTXlRSXEwVjBQWDloRHdwU3hSY1lLTjBWZ0tWQVdvc3p1WW1VK2dy?=
 =?utf-8?B?QmUzd2xzQlZueFJENkZPSWw1N3ZLVEJzWkd2ODFlckhPblVURzdKT2ttRVFG?=
 =?utf-8?B?VmQ0STFMSFdrQURVZTI1ZDBvQS9wcldUeXlmWlZ5TkpGcjVSL05RWnNmK3Ew?=
 =?utf-8?B?bUtvck5WSGVINGU3Vkg1Nkp2ZXZMZjJPakU2TlkvWFZGck9kV0tRZEF4elFj?=
 =?utf-8?B?SU03NWRBVTAxTkM0Q3dRSFV0UXVoZzI3dlpwWGxnVjFRZFpPUzVWeUU3U2Ji?=
 =?utf-8?B?TTZHRWxDVnhLZHF2dEhvbHZtTVVuYjl4emU4Ti92c0VLVWN1RzlSZmEzNnhF?=
 =?utf-8?B?SWRuQm1mbndpUXhhY1ZLNThGVHVBYWlYWWNZSTgxOEhXZWl0WUpJek9SWWJE?=
 =?utf-8?Q?1uOzT1lW99g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFZZNGVpNmdsMzRSdGJNY1lmdSt6cldTbGMvdVlBUXpBL3dNTnRzZk92dytk?=
 =?utf-8?B?ZHdqWnpuN3FSTlRVTVlGb0R6S1ZmNWo0NFlpOTZjNTVRQ2hseFdMOGRVOWZs?=
 =?utf-8?B?T0dwalRPbFVIYTVYak5sWjRIZHFKd2hFOTA1Yk5JeFZNRUJjQVFsZXlQZzgx?=
 =?utf-8?B?OXlPUk1yMHdLMWdXRW9LQmtwWDJOZWNpT01xZEVUM0xZeVNWVHhrbG5hZk9D?=
 =?utf-8?B?RmxBYnE2Tm0xSlFHTnpLbkJsNGxDNTFvVVhOWkY2SVQ0VThjUVFFc2RKYkJS?=
 =?utf-8?B?U1lSbzd6Yll0R1o2QVEvamluRnphbGhYWE1kV1pOazNMTFFLejZ6SWd0Q3kr?=
 =?utf-8?B?Z1VFQmFnMFMxeUtxVzV2MzVGRENtUDZwUENVS0k4dkoyRjE3cXBFMUFkdWUx?=
 =?utf-8?B?R0NvaVlaRG92KzZyTjZ6Z2kvRTZRL1BmeU1FT0VuZnh6NGFqZENyVExnbVRm?=
 =?utf-8?B?TU5XY0FKWGc3b1I0T1greDgvd0tocUtlUkQxN3ZaOC9iZ3JEbDdGd2lYekZR?=
 =?utf-8?B?c1RsSk01WStGbWl1VW1TeHBuL1IrNXNFVm9vV3ZBWjRMQ1ZJbURsNkpCWU1Y?=
 =?utf-8?B?WHpVbWpyRDJjM3psT3duWktQNTNraDdTYzg1VFdpbnBxMXdLdVcrRG9ib1JJ?=
 =?utf-8?B?d3NWZmF6WUdLcWh0VTUxTEIzTzBOcGRYYlZUZm4yNUgrV3hhUFFDc25LbXp3?=
 =?utf-8?B?Z3pmcnlXcXFWK0RDM3BtZEk1ZGxaT0JEcDV1VUswak5SdUprUlF6VGd6NERs?=
 =?utf-8?B?cnMxTlluamhrNnFPeFBTVXQxUlFaQ1Z1TGpBMW5vdFo2WXlVeXRRTkdYOW5B?=
 =?utf-8?B?QWRZQWZZZWJYSUtjemFhVHdIeGZmSHMyM1ZMU2RJM3ZvRjMwZC9jdmp2VDJu?=
 =?utf-8?B?aHlIdndtZmFmUCtXNFRkSmpoR1YvR3ZaZ2ErZ0VEaDdjWTlZTzRUM2J4OTEw?=
 =?utf-8?B?TEYwTnZrNDBobTl2aWdzOHRNYm5wM2p0V0gxaGNhYVVXWmRmUXRKeDJsYUc4?=
 =?utf-8?B?T3VOMWdLL0lkc3RrKzBQQ2VEanJ4dEIxZ0pZZmxRZzVTMXR1cUh2ZDl3a0Nz?=
 =?utf-8?B?K3dVLzd0VHNIM28vWXltNU9pdkZ2TTZ6Z202OHBoNG9zWmNBd0U4K3g2WGpq?=
 =?utf-8?B?VHJja0dpU044a3QwTm5Vd3R2VkdyOHFZVXM4OFFPK1JoN0oyWms4akJ2cW9Y?=
 =?utf-8?B?cktBWmNYcmk2RjZQMkQ2WXgyNzhMdllPSkUwM0JOdHRHbnFINE9RcVRXL08y?=
 =?utf-8?B?dFpMMGlxUXhUNVlpdU1PSVczYXg0NFhudURlTm03bURpb1Y0clg0b3IyZHVW?=
 =?utf-8?B?SnpXOW5scFkzTmdxV1JWSlhBc3pUS2FFc1hiMVZnQUo4M3JqalVyT2FESzcv?=
 =?utf-8?B?ZVZMTWtGMWR6TTk4OW9NWWpkcEhJanNtM2wvVzh5V2NWWkhBQVB4NjZjVllw?=
 =?utf-8?B?dWhEVVEzTDYva1Z1Y1JHZC9NY244MDk3VTdscDJONzI3Q0VGTTVIMFI2cE51?=
 =?utf-8?B?ZjIya1lTN3Q4U0poRFI0NGtFbHlEVTNRWFgrQUJSWjZCNU1JUHFSUkd5K3Vi?=
 =?utf-8?B?eVkvclJqL2ZKRVlwdndlc25ySGdpRXVXN2NDU3EwMkVYZVdoOFBBaFgxR0dO?=
 =?utf-8?B?WXJyWXhuc1NBUGVJY1cybllWQi9BcEt6QTBEb2N2MHBPdVU0dUNOOFZrL0xw?=
 =?utf-8?B?dnNDMUp3N1ZoTGMvYmxXSFFIeTk5ZjczNC8wdWw1c0htanZ3dm1vNTNOdS96?=
 =?utf-8?B?dmp5bGtRMjlJNVFDRDZLS0hyL2pnWWFYRXlwNThxN3krcHlGSUNJb2oxOFQ3?=
 =?utf-8?B?eW03R0E4UERRWjZJUklzUmlPeDEwU3JWT211MEFKZEMvakNEZkRhVkF0VmZ6?=
 =?utf-8?B?ajNySzFVREJWQmYxOWc3WGJnVUdOaXB2UHBaSHNuN0ZGWHlnWFgrbzBoaExK?=
 =?utf-8?B?VnQvWHl2NTdWOWtySWJUZElQZ2pSS0Z5R21tWGQ4S2xEdC9xeWFrUWlWRmRY?=
 =?utf-8?B?Y0E3MVcwNGRrd29UZmRYejVxTXE1S0F1Vkl3SzI1bG9tb29DN0RjclpGWFkr?=
 =?utf-8?B?YkZFSnlKVTJxOHBHZEhER3lGaVh3dXRaMUZUME1rV1BaVEF6ZGxheTZtb1ZB?=
 =?utf-8?B?RmRDdTdqelc4NW5VYkhYMWdUUllCNHhjMkdJYnVFT3RWc1pZQ3JCNTd2cUpN?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b431c0e-d933-4e86-de52-08ddfd0fb224
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 15:16:41.3597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ggONwl0LcY44cjcTmQDDXF7lFlAtBYW22+gwidKfYKdLFgQIj82gmE2hRELRXfoXdCtZeyb3GBuJ+OhRZNH0PjtuQ/7wVJ8w/OT1eVdxOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6949
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

On Fri, Sep 26, 2025 at 12:04:23AM +0200, Michal Wajdeczko wrote:
>Due to initial design of the Xe debugfs, the GGTT and LMEM files
>were defined on the primary GT, instead of being per-tile.
>
>While PF provisioning code is now still maintaining GGTT and LMEM
>also on the per primary-GT level, this will be refactored soon,
>but we can fix debugfs layout now, as part of the new SR-IOV tree.
>
>For backward compatibility we will provide some symlinks that can
>be removed once our tools will be fully converted.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  92 ++++--------
> drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c | 136 ++++++++++++++++++
> 2 files changed, 163 insertions(+), 65 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>index 21065394e1b5..dd66d47bd987 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>@@ -100,46 +100,6 @@ static const struct drm_info_list pf_info[] = {
> 	},
> };
>
>-/*
>- *      /sys/kernel/debug/dri/BDF/
>- *      ├── sriov
>- *      :   ├── pf
>- *          :   ├── tile0
>- *              :   ├── gt0
>- *                  :   ├── ggtt_available
>- *                      ├── ggtt_provisioned
>- */
>-
>-static const struct drm_info_list pf_ggtt_info[] = {
>-	{
>-		"ggtt_available",
>-		.show = xe_gt_debugfs_simple_show,
>-		.data = xe_gt_sriov_pf_config_print_available_ggtt,
>-	},
>-	{
>-		"ggtt_provisioned",
>-		.show = xe_gt_debugfs_simple_show,
>-		.data = xe_gt_sriov_pf_config_print_ggtt,
>-	},
>-};
>-
>-/*
>- *      /sys/kernel/debug/dri/BDF/
>- *      ├── sriov
>- *      :   ├── pf
>- *          :   ├── tile0
>- *              :   ├── gt0
>- *                  :   ├── lmem_provisioned
>- */
>-
>-static const struct drm_info_list pf_lmem_info[] = {
>-	{
>-		"lmem_provisioned",
>-		.show = xe_gt_debugfs_simple_show,
>-		.data = xe_gt_sriov_pf_config_print_lmem,
>-	},
>-};
>-
> /*
>  *      /sys/kernel/debug/dri/BDF/
>  *      ├── sriov
>@@ -199,9 +159,7 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
>  *      :   ├── pf
>  *          │   ├── tile0
>  *          │   :   ├── gt0
>- *          │       :   ├── ggtt_spare
>- *          │           ├── lmem_spare
>- *          │           ├── doorbells_spare
>+ *          │       :   ├── doorbells_spare
>  *          │           ├── contexts_spare
>  *          │           ├── exec_quantum_ms
>  *          │           ├── preempt_timeout_us
>@@ -209,9 +167,7 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
>  *          ├── vf1
>  *          :   ├── tile0
>  *              :   ├── gt0
>- *                  :   ├── ggtt_quota
>- *                      ├── lmem_quota
>- *                      ├── doorbells_quota
>+ *                  :   ├── doorbells_quota
>  *                      ├── contexts_quota
>  *                      ├── exec_quantum_ms
>  *                      ├── preempt_timeout_us
>@@ -249,8 +205,6 @@ static int CONFIG##_get(void *data, u64 *val)					\
> 										\
> DEFINE_DEBUGFS_ATTRIBUTE(CONFIG##_fops, CONFIG##_get, CONFIG##_set, FORMAT)
>
>-DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(ggtt, u64, "%llu\n");
>-DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(lmem, u64, "%llu\n");
> DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(ctxs, u32, "%llu\n");
> DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(dbs, u32, "%llu\n");
> DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(exec_quantum, u32, "%llu\n");
>@@ -331,13 +285,6 @@ static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigne
> 	xe_gt_assert(gt, gt == extract_gt(parent));
> 	xe_gt_assert(gt, vfid == extract_vfid(parent));
>
>-	if (xe_gt_is_main_type(gt)) {
>-		debugfs_create_file_unsafe(vfid ? "ggtt_quota" : "ggtt_spare",
>-					   0644, parent, parent, &ggtt_fops);
>-		if (xe_device_has_lmtt(gt_to_xe(gt)))
>-			debugfs_create_file_unsafe(vfid ? "lmem_quota" : "lmem_spare",
>-						   0644, parent, parent, &lmem_fops);
>-	}
> 	debugfs_create_file_unsafe(vfid ? "doorbells_quota" : "doorbells_spare",
> 				   0644, parent, parent, &dbs_fops);
> 	debugfs_create_file_unsafe(vfid ? "contexts_quota" : "contexts_spare",
>@@ -558,6 +505,28 @@ static const struct file_operations config_blob_ops = {
> 	.llseek		= default_llseek,
> };
>
>+static void pf_add_deprecated_attrs(struct xe_gt *gt, struct dentry *dent, unsigned int vfid)

nit: "deprecated" doesn't age well. pf_add_compat_symlink() would be
better IMO.

Other than that, Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
