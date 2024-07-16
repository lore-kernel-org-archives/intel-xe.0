Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB83C3DA59
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 23:20:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9CBB10E90C;
	Tue, 16 Jul 2024 23:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D7WDrKD7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B8510E90C
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 23:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721172041; x=1752708041;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vGxHft5gX47Ud57j6IV1uPlUh1ekSgIvgiHzLa8tomA=;
 b=D7WDrKD7w6IS8uPAOTdjbXOtyOaF1vFMnLFxg5xcFiA6NnfFwUKrkw3f
 mbXUDFjq7GVH5zpdIdrGumnzbHaNAQACnrQ7uAzTzudbjRd1Cabd5CM20
 wS1+1mxkdnVc502/dhhrAlcOBNhy7e5cw18dWqA/Ar7ycoRiuIkScu1Ah
 gUW2WVmXBalnPLDfA0uFBziWatnl7czinfBkPQtUDWR8mx9cANd8sBVAL
 CRkXUigrRAik59QnwwaK96AygoaHfTEuj1MuIOE2fvHG6CUTppEcH5cVc
 yFaNNAU3ijISm5ohYnY2TfrtrrZaV59HN5+w0xpIcEO10bheKYyBgvk/7 Q==;
X-CSE-ConnectionGUID: sBo1RHTdRGCX8AvsnDnaSw==
X-CSE-MsgGUID: OEthKvrPSKOzSPB2GEg+4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18458329"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="18458329"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 16:20:41 -0700
X-CSE-ConnectionGUID: POVrW6GYT++7NOaRxJZ1VA==
X-CSE-MsgGUID: 41+90RcESSyNU0BDxN6TiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="80844321"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 16:20:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 16:20:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 16:20:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 16:20:38 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 16:20:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3AY9lmgvc9mL8Jlcz2hEli932CjQDvieWfEjChhAGPkycazSoHfovVwoi+Ahc5nVE7CuGxT9i+Xk7h/Y49+R9Uo1fGQmz3H7O4sI3QFTHDi4bQNzoPrTC0u8RcaUVX837JHhQen8i26boN4rhfuJs1lnIGRRzW9nnytZrYAthFPHZ/ky3hLEPiwHgtoB5OgGjJ6MFVBA5bPIScnJQIzMVoXmi9Fk0zfu2k59qWnOBN95eauvlw3tpWGca8OxEzc3+tM6Tg4EQU22/5MSHzFxwc3mwH9LdsloALXeo+cQ82ZMj1yXs/VGzvc+QObeXVtBiqe4cqoaPyp9bJxXrSORg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJbSOsr50N0H4dIcfh7MvRGOpW08CNT0wgGd05IIlR4=;
 b=xRLHKcLyj/4WPfOsGWpoNIGUjSgvNhQn1p0ZghEm87xN2qBy+McPLIkk05U7iGfwPwY3zLR678n6yU9Yq7sf0GVoH/GZxixPhGZI3rFv8MTs589l9M6QUxCnsVw4gxvQhOPD+D6/fNcr1t1rXISYxv/I2/4al2SKzMQ8rrEi9FkWTmjZ47XtOyBGU4L7ko/53LOjfT5BRp3j1DwoAvVi7PkDm1Q/4bNprfBezjRpIpiArPpdVENluPJSSrkwhAA3NmljPdlJtHVYs25IYwrGSv/u17NYQqF0Nx4jXEfj2Ka9KTc0h9MvBQ4s/yp6HmwsmAPf8EjuJ+a/672xu3tkbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6938.namprd11.prod.outlook.com (2603:10b6:930:5a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 16 Jul
 2024 23:20:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 23:20:36 +0000
Date: Tue, 16 Jul 2024 23:19:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <akshatajahagirdar6@gmail.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v5 4/8] drm/xe/xe2: Introduce identity map for compressed
 pat for vram
Message-ID: <ZpcAFSoYGsHDRyAl@DUT025-TGLU.fm.intel.com>
References: <cover.1721170212.git.akshata.jahagirdar@intel.com>
 <a719903c03e9c59f7fb365dd7188a52b0a2527af.1721170212.git.akshata.jahagirdar@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a719903c03e9c59f7fb365dd7188a52b0a2527af.1721170212.git.akshata.jahagirdar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0367.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6938:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c4baca8-691f-4598-2bc2-08dca5ede5ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1c0Z2ZVOXJsR0xzaHFFSldYOVlrdUo0NTJOZHIrRnMyazNmaWNsQ0F1eTZr?=
 =?utf-8?B?S2ZlK0dZZEo1NWFWcnNJVUVDTTltMFJtQnNHY3ZvbGlqb2dYM3RUSlc0dit4?=
 =?utf-8?B?V2J6VU5wbjdXSUR0VVRuSjdURndBWEw0WEdrcmljZXMyTyt2NWt1Y0ZGc3Ft?=
 =?utf-8?B?WFBaNGpUM0ZFR21DRitqTllIa01lb05Bc1BrU2tRN2V0bkQyUmh2cWFIR0pY?=
 =?utf-8?B?enk3R3NtcjliSG9BTjFDditML0xzeFhmcEtub3hnekgvT2JPbnFYWGpQZ09Z?=
 =?utf-8?B?UE5uVW83NGxMYXhmWjlZdmFnazhtazk0Q0RpY3k3UjJLdnJ2OFhKWTlndndw?=
 =?utf-8?B?b2JzMXc1cWhFY2pVdUp3NEo1K09PWWdwMjlVNE1UbWdWK09FV0t1dFpOb014?=
 =?utf-8?B?RTN6YUJERHRTL1ZSMUJRWnF4YVVPZkdtYUdCRjdiRDJ3UWhZM3dwdzJMSGFE?=
 =?utf-8?B?UEZmd1ZYRzV0elRHYUdCVFltSkdjZ3RqbVhHVDU1bWd0dERiZEZQYWQ0SHN3?=
 =?utf-8?B?blFnNUpvSDVpVEYyWm1kSitpeTgxTDNqTUdiVWgvUG9jVVB2WWxJV2dDb1dF?=
 =?utf-8?B?NGVTczJGdWczbG9xN1p2dWw5blUveE9ReTcvOWxYYnRrQ3lBSFh3TGx1Y1kv?=
 =?utf-8?B?OE56Y0oxc2NoRE1CNVNkdlZseW81SHl4OWhhV3JrdWs1NHJTWkVnVjFyM1pO?=
 =?utf-8?B?T1J5T3BPbE05QlA2YURsMERBd0NYdFBBRXB6RnFtcDhnUW84VFFxM3RFbitB?=
 =?utf-8?B?M043amRjTGtZaFdOSHc4WmpCUFVsZTF4TVlIMU9PcC85UmxRQVFrSHZFZ2ZH?=
 =?utf-8?B?WURaUW41aFc0bXdPbkVDZHpHVEdkdEpoUk00TXlXa2NQamM4VGp6dTYvcW5C?=
 =?utf-8?B?bVhSSU14cWtYU0lWYTF4Nm5jNE5JOTY3Sm9lTVdsNlVHamY3SWdXUjM1SXZZ?=
 =?utf-8?B?U0d5TWJaMmN3SVBLdXkzdXhlZERrVlltTlYwcXFtRnlNaDg5NGJSMmx3bCts?=
 =?utf-8?B?eEpXMStBWmpvOWQ0NEFHaXE2T3lXbWo1S0Z0MndFY0cyNHJkUEpUU3QzT1J2?=
 =?utf-8?B?VnorS0ZralAxME0rTE94YzNGNXFJL0w3TjVVSjYvMWdzVGlaQTFibjRXcHY3?=
 =?utf-8?B?MWtNNk8wVnVCTmp3VWp5M2wwdjNETUE1UWpFd1BmWC9MdUkyWUxjdWZaa0Na?=
 =?utf-8?B?L29mNkZSWGZoTW1PNS84TDVTQll2bGRGWk5aQTdYMHkzYTFQV3RUcFk4b3Ru?=
 =?utf-8?B?UllFVHAranFYNUEzYlN3SmllZlV4TWpTaVkzTVRlVTBuYVJyU2dLT1NDL2pX?=
 =?utf-8?B?dDJsR0E5TkxXdWZqVXAzeFJVNHcyTGliSWVoOTZ1T0dlVEJUUUU1cXptSmJ2?=
 =?utf-8?B?cW5MOGRPL2oxRU55TFd4bGhEVE1RSHNsSGxrZklBaS9Nc3lPNEZEYVNrTWt5?=
 =?utf-8?B?eUtjWXluRUtTMG82UXlWbFpNNlRBSGwxd29ITmx1TWVSc2xoMGJiRXI2VDZF?=
 =?utf-8?B?eDBZL0o2cTFFL2NKWDNXSjBNQkhpVmMwcTYzVElQdTRlOEptMkNKd1ZlQ29H?=
 =?utf-8?B?T1pCMlFIaFcvN0lHamxRRlRIUC9FbDl6MmlEaDZxaTFQR2ptQ3IxSkZTL3VZ?=
 =?utf-8?B?T2ptNkRvaGUrL0lzb3ZYeTZ3MzI4VGZ4YVJkSC8zK3dWZWFxazE1TmR0TWZH?=
 =?utf-8?B?OEZNNS9IRlBNeVJVL2NFTDJ3ZmgxVEwxaDh2YTVvWkFaUm1sU0kvWnBvaFhh?=
 =?utf-8?B?VGkxUlRnK1BNOEttNHp0N1ZxeGlqUmZZWVRxOTFnTGt1NXlSYWFMYm91a1BO?=
 =?utf-8?B?bWsxcHFrYmhMR1ZNb09Odz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjM3aGxGOFg1OHZQZDkvQXhkUjRqamQzTnlyeU5LVFNoQXQ2eVhnYm4yVXRX?=
 =?utf-8?B?RmhUQ3JZSUV6ZTRTak5XQ1NCTjdLY2l3VkJCTjZtTmtrQ1FnbFVpODZRYjhQ?=
 =?utf-8?B?VDdRWVFEa2hZVlQ0WTM3UWlPVy9UUnNBUUJmb2t1TmJCeTNNMUZ3TFlVaWZH?=
 =?utf-8?B?Q0NQOXAvUmtHZEc3NWxIaXVGSlNwYXc5RGpaMytabnZDMFc1Y096dVYvbjdt?=
 =?utf-8?B?dkJWVy9SaXZTNWR5NGJ5eTVrMktDY0NYbG9adGZCSkZJT2ZiL3JEdkhOUkNB?=
 =?utf-8?B?NDY2WlY3YWxjK2JHZjZsd3pVNmhqbVFGb0VzQllvOC9TS3pJQUFHc0x6eWR1?=
 =?utf-8?B?alJmVzhNeEN3YXEwbDZVbVpCNktTSmx6eTBTZkVLR2d6T3ZFZ2NUNTZGaDkw?=
 =?utf-8?B?cW5mNE9rc2VhRUM3NW9PSjhFWFBNL05Ja0NseWVwRkNENHBsVGxueEd0SHFl?=
 =?utf-8?B?YWdNQzRsd0xMZkVZL2E0dXliTUFzdGZMbUpmM1k2Ri9sVUM1M2x4R1RlYjkx?=
 =?utf-8?B?eFNjQWRnbzhicjdoK1ZKRGVXMldsZUk4SDBsUjdRcTYwVTg2VHlSMVI0a1cz?=
 =?utf-8?B?NVFCN2l4bUQ5TnpudE00bUNuYkZIa0QrS0tWeTRRZ3BqN1JmT01MYm9nLzY3?=
 =?utf-8?B?KzJpZGJDT1ZTdDc4a1ZzQUZjVG5zNk1POVN2MXVXMTJ3QXRTcVhOOGN0VE9p?=
 =?utf-8?B?eHBqZHlsTitqZitNOWNNMkxxVjAwdTBQVGJ3eDlHbVRZKzB4dXpBeFdKUUdv?=
 =?utf-8?B?V0RpaG5id21nWFlncG5PdnlGRzRoR3lsSnJYZkVGWWlQaVBNNFFSWCtDcTFl?=
 =?utf-8?B?aFFod3h6Mk1YZXBpM1pHSnlOb2JUcjJFTHFiVSsvTkZENFdtSy9NbU9semE0?=
 =?utf-8?B?NFJrWU5EOTRLaVhKZldtSmZCZVVpZXZ0TmQvRkRUMm9hT3hkQzRrZHdndU4v?=
 =?utf-8?B?UmRHUkVqMVI0NFZDZXBlTG1SSGt0K2JJWGVlamtWQ1VDUFVNcjJoNDRnRFRw?=
 =?utf-8?B?cUdibHdPNndEempCc1FIbXdsSnpaVVM2YWdSamg2d1ZPV0wyNmdadEhLamhV?=
 =?utf-8?B?Y0h2Tm1sNUpWenpnUTd0a2RDOExyR2dnWjRLMFBlRmxVNHQxMWsyRGE2M0xL?=
 =?utf-8?B?dVBaMUhmVDQvSmgydmNhT0tXZTVqdFVTdytsTEFYOUpjejlNektKeGl0WGQy?=
 =?utf-8?B?Tm41clpEZGVQYXFKbDJ3a1M4RlU1WXE3VDRoaVlkdXNjbEFhY2w2NHM4clpJ?=
 =?utf-8?B?cWJHWXk3ZVBwNmVyYWRFbTdON3FsN2ovNUZwVVhwaHo1VWpOR2NQQ3FHRXJ6?=
 =?utf-8?B?OS9RSERtL1h1OHAycEVsT0N4d0loc3ZkUk4rUVYxZGM1WHFxYVJXckxDNWM5?=
 =?utf-8?B?azZMWDlTbVNFWStmVU5oVWNGZzUwVEtMKzgxY2tlR0FhRVJWRWlXbjJNQlM5?=
 =?utf-8?B?UWIvZmRoMTQvbmJTOVdDTCtuMld6ZXVBR1RtSUlxNW1YVkMxL2lIQVR4M0NN?=
 =?utf-8?B?cVZFVWNZMzNUYzFsbmc2YUVaaE9qSCtmY2dnemV5MkhUVjRpNTRITWo4Yjli?=
 =?utf-8?B?RXRGS0RlQVRDRFFZbmFVOXpHL3VGTktsbFZCeTM1SjdHQVhIQTFqQ3BnZnQ3?=
 =?utf-8?B?b3RNNDFFTy9NZlhqTEFMQ2ZYYkZMUGtqcTQ5TXVBa1Nwdk1CdldRVkxiM2N0?=
 =?utf-8?B?NHRRMitnRWZ3TnJzS0Y1Q2NQUVVWbzE0NWJGU3NLTmRUb3JNbkZPTVNGVWQ4?=
 =?utf-8?B?N1Y2d2VNbWd4Z0QrL0kydk92YnNKWGd3MnNmVTU3ejc1TkJpN3NjSWdzVTBS?=
 =?utf-8?B?dzhiWkJvNEpkME10NHJLOU5wZ3BSbXdGZml3NkpDaTRPeUxaSlJWWHhVZHB3?=
 =?utf-8?B?eS9rUzBGdVpmaDhhUDJuOWVOc0g1NjVCd1d5VlY1clBjZjdWVVliSE1XaGRm?=
 =?utf-8?B?ZEhkN2VGekZ1a3ZCSEhIdVZBMjlyZUVxbiszcWhZQmJoVnF5R056cGc2QXlM?=
 =?utf-8?B?RDlwWjJabWRsQU1neEdweDlUNFRrdGI4N1B1NWJCUUxCd0RYYmIrZmszT2Zs?=
 =?utf-8?B?d3VqT2tXK21qMWc0WUFFUWpqMGlnVXBGR3FvVDlwZzdRekFiWkJ6WlNLTXJ5?=
 =?utf-8?B?anJnRTI4Z0VtZEFVOE0wUTd1UkpQY0xtQXV4MnBJQmVFVWZaWW5EYXY1RFJt?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c4baca8-691f-4598-2bc2-08dca5ede5ed
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 23:20:36.4152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LHC6HkiTUbu/rfpvuAE1LG1CnZjOeEmfwxJClZ9eRVCPhTUrMz8QY4ZXLPX6Qhd52Xfoq1NX5LYDSHKWxCFAvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6938
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

On Tue, Jul 16, 2024 at 10:54:05PM +0000, Akshata Jahagirdar wrote:
> Xe2+ has unified compression (exactly one compression mode/format),
> where compression is now controlled via PAT at PTE level.
> This simplifies KMD operations, as it can now decompress freely
> without concern for the buffer's original compression format—unlike DG2,
> which had multiple compression formats and thus required copying the
> raw CCS state during VRAM eviction. In addition mixed VRAM and system
> memory buffers were not supported with compression enabled.
> 
> On Xe2 dGPU compression is still only supported with VRAM, however we
> can now support compression with VRAM and system memory buffers,
> with GPU access being seamless underneath. So long as when doing
> VRAM -> system memory the KMD uses compressed -> uncompressed,
> to decompress it. This also allows CPU access to such buffers,
> assuming that userspace first decompress the corresponding
> pages being accessed.
> If the pages are already in system memory then KMD would have already
> decompressed them. When restoring such buffers with sysmem -> VRAM
> the KMD can't easily know which pages were originally compressed,
> so we always use uncompressed -> uncompressed here.
> With this it also means we can drop all the raw CCS handling on such
> platforms (including needing to allocate extra CCS storage).
> 
> In order to support this we now need to have two different identity
> mappings for compressed and uncompressed VRAM.
> In this patch, we set up the additional identity map for the VRAM with
> compressed pat_index. We then select the appropriate mapping during
> migration/clear. During eviction (vram->sysmem), we use the mapping
> from compressed -> uncompressed. During restore (sysmem->vram), we need
> the mapping from uncompressed -> uncompressed.
> Therefore, we need to have two different mappings for compressed and
> uncompressed vram. We set up an additional identity map for the vram
> with compressed pat_index.
> We then select the appropriate mapping during migration/clear.
> 
> v2: Formatting nits, Updated code to match recent changes in
>     xe_migrate_prepare_vm(). (Matt)
> 
> v3: Move identity map loop to a helper function. (Matt Brost)
> 
> v4: Split helper function in different patch, and
> 	add asserts and nits. (Matt Brost)
> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 65 +++++++++++++++++++++++----------
>  1 file changed, 45 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 6b952ed98a51..601c9e790dae 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -73,6 +73,7 @@ struct xe_migrate {
>  #define NUM_PT_SLOTS 32
>  #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M
>  #define MAX_NUM_PTE 512
> +#define IDENTITY_OFFSET 256ULL
>  
>  /*
>   * Although MI_STORE_DATA_IMM's "length" field is 10-bits, 0x3FE is the largest
> @@ -120,14 +121,19 @@ static u64 xe_migrate_vm_addr(u64 slot, u32 level)
>  	return (slot + 1ULL) << xe_pt_shift(level + 1);
>  }
>  
> -static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr)
> +static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr, bool is_comp_pte)
>  {
>  	/*
>  	 * Remove the DPA to get a correct offset into identity table for the
>  	 * migrate offset
>  	 */
> +	u64 identity_offset = IDENTITY_OFFSET;
> +
> +	if (GRAPHICS_VER(xe) >= 20 && is_comp_pte)
> +		identity_offset += DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
> +
>  	addr -= xe->mem.vram.dpa_base;
> -	return addr + (256ULL << xe_pt_shift(2));
> +	return addr + (identity_offset << xe_pt_shift(2));
>  }
>  
>  static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm, struct xe_bo *bo,
> @@ -182,10 +188,10 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
>  	u8 id = tile->id;
>  	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level,
> -	    num_setup = num_level + 1;
> +	    num_setup = num_level + 2;

Nit, maybe do something like to better self-document.

#define VRAM_IDENTITY_MAP_COUNT	2
num_setup = num_level + VRAM_IDENTITY_MAP_COUNT;
#undef VRAM_IDENTITY_MAP_COUNT

>  	u32 map_ofs, level, i;
>  	struct xe_bo *bo, *batch = tile->mem.kernel_bb_pool->bo;
> -	u64 entry, pt30_ofs;
> +	u64 entry, pt29_ofs;
>  
>  	/* Can't bump NUM_PT_SLOTS too high */
>  	BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE);
> @@ -205,9 +211,9 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> -	/* PT31 reserved for 2M identity map */
> -	pt30_ofs = bo->size - 2 * XE_PAGE_SIZE;
> -	entry = vm->pt_ops->pde_encode_bo(bo, pt30_ofs, pat_index);
> +	/* PT30 & PT31 reserved for 2M identity map */
> +	pt29_ofs = bo->size - 3 * XE_PAGE_SIZE;
> +	entry = vm->pt_ops->pde_encode_bo(bo, pt29_ofs, pat_index);
>  	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
>  
>  	map_ofs = (num_entries - num_setup) * XE_PAGE_SIZE;
> @@ -259,12 +265,12 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	} else {
>  		u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>  
> -		m->batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr);
> +		m->batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr, false);
>  
>  		if (xe->info.has_usm) {
>  			batch = tile->primary_gt->usm.bb_pool->bo;
>  			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
> -			m->usm_batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr);
> +			m->usm_batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr, false);
>  		}
>  	}
>  
> @@ -298,10 +304,27 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  
>  	/* Identity map the entire vram at 256GiB offset */
>  	if (IS_DGFX(xe)) {
> -		u64 pt31_ofs = bo->size - XE_PAGE_SIZE;
> +		u64 pt30_ofs = bo->size - 2 * XE_PAGE_SIZE;
> +
> +		xe_migrate_program_identity(xe, vm, bo, map_ofs, IDENTITY_OFFSET,
> +					    pat_index, pt30_ofs);
> +		xe_assert(xe, (xe->mem.vram.actual_physical_size <= IDENTITY_OFFSET * SZ_1G));

Sorry to change my comment from my previous patch, realized this after
sending.

Techinally this should be:

xe->mem.vram.actual_physical_size <= (512 - IDENTITY_OFFSET) * SZ_1G

Or 512 replaced a define for the number of PTEs we can map in 4k.

>  
> -		xe_migrate_program_identity(xe, vm, bo, map_ofs, 256, pat_index, pt31_ofs);
> -		xe_assert(xe, (xe->mem.vram.actual_physical_size <= SZ_256G));
> +		/*
> +		 * Identity map the entire vram for compressed pat_index for xe2+
> +		 * if flat ccs is enabled.
> +		 */
> +		if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe)) {
> +			u16 comp_pat_index = xe->pat.idx[XE_CACHE_NONE_COMPRESSION];
> +
> +			xe_assert(xe, xe->mem.vram.actual_physical_size <= 128ULL * SZ_1G);

The assert needs to go after variables, pretty the compiler will compain about this.

Also s/128ULL/(512 - IDENTITY_OFFSET - IDENTITY_OFFSET / 2)

Same comment as above for the 512.

> +			u64 vram_offset = IDENTITY_OFFSET +
> +				DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
> +			u64 pt31_ofs = bo->size - XE_PAGE_SIZE;
> +
> +			xe_migrate_program_identity(xe, vm, bo, map_ofs, vram_offset,
> +						    comp_pat_index, pt31_ofs);
> +		}
>  	}
>  
>  	/*
> @@ -309,7 +332,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	 * [PT0...PT7]: kernel PT's for copy/clear; 64 or 4KiB PTE's
>  	 * [PT8]: Kernel PT for VM_BIND, 4 KiB PTE's
>  	 * [PT9...PT27]: Userspace PT's for VM_BIND, 4 KiB PTE's
> -	 * [PT28 = PDE 0] [PT29 = PDE 1] [PT30 = PDE 2] [PT31 = 2M vram identity map]
> +	 * [PT28 = PDE 0] [PT29 = PDE 1] [PT30 & PT31 = 2M vram identity map]

So this would now be:

[PT27 = PDE 0] [PT28 = PDE 1] [PT29 = PDE 2] [PT30 & PT31 = 2M vram identity map]

>  	 *
>  	 * This makes the lowest part of the VM point to the pagetables.
>  	 * Hence the lowest 2M in the vm should point to itself, with a few writes
> @@ -488,7 +511,7 @@ static bool xe_migrate_allow_identity(u64 size, const struct xe_res_cursor *cur)
>  }
>  
>  static u32 pte_update_size(struct xe_migrate *m,
> -			   bool is_vram,
> +			   bool is_vram, bool is_comp_pte,

So two bools get confusing and is prone to bugs by mixing but the
argument order at the caller. Can we switch this a flags field?

e.g.
#define PTE_UPDATE_FLAG_IS_VRAM		BIT(0)
#define PTE_UPDATE_FLAD_IS_COMP_PTE	BIT(1)

pte_update_size(struct xe_migrate *m, unsigned int flag, ...);
{
	...
	bool is_vram = PTE_UPDATE_FLAG_IS_VRAM & flags;
	bool is_comp_pte = PTE_UPDATE_FLAD_IS_COMP_PTE & flags;
	...
}

Other than these nits, the patch looks functionally correct to me.

Matt

>  			   struct ttm_resource *res,
>  			   struct xe_res_cursor *cur,
>  			   u64 *L0, u64 *L0_ofs, u32 *L0_pt,
> @@ -500,7 +523,8 @@ static u32 pte_update_size(struct xe_migrate *m,
>  	if (is_vram && xe_migrate_allow_identity(*L0, cur)) {
>  		/* Offset into identity map. */
>  		*L0_ofs = xe_migrate_vram_ofs(tile_to_xe(m->tile),
> -					      cur->start + vram_region_gpu_offset(res));
> +					      cur->start + vram_region_gpu_offset(res),
> +					      is_comp_pte);
>  		cmds += cmd_size;
>  	} else {
>  		/* Clip L0 to available size */
> @@ -791,17 +815,17 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  
>  		src_L0 = min(src_L0, dst_L0);
>  
> -		batch_size += pte_update_size(m, src_is_vram, src, &src_it, &src_L0,
> +		batch_size += pte_update_size(m, src_is_vram, false, src, &src_it, &src_L0,
>  					      &src_L0_ofs, &src_L0_pt, 0, 0,
>  					      avail_pts);
>  
> -		batch_size += pte_update_size(m, dst_is_vram, dst, &dst_it, &src_L0,
> +		batch_size += pte_update_size(m, dst_is_vram, false, dst, &dst_it, &src_L0,
>  					      &dst_L0_ofs, &dst_L0_pt, 0,
>  					      avail_pts, avail_pts);
>  
>  		if (copy_system_ccs) {
>  			ccs_size = xe_device_ccs_bytes(xe, src_L0);
> -			batch_size += pte_update_size(m, false, NULL, &ccs_it, &ccs_size,
> +			batch_size += pte_update_size(m, false, false, NULL, &ccs_it, &ccs_size,
>  						      &ccs_ofs, &ccs_pt, 0,
>  						      2 * avail_pts,
>  						      avail_pts);
> @@ -1042,7 +1066,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  
>  		/* Calculate final sizes and batch size.. */
>  		batch_size = 2 +
> -			pte_update_size(m, clear_vram, src, &src_it,
> +			pte_update_size(m, clear_vram, false, src, &src_it,
>  					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
>  					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
>  					avail_pts);
> @@ -1159,7 +1183,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
>  	if (!ppgtt_ofs)
>  		ppgtt_ofs = xe_migrate_vram_ofs(tile_to_xe(tile),
>  						xe_bo_addr(update->pt_bo, 0,
> -							   XE_PAGE_SIZE));
> +							   XE_PAGE_SIZE), false);
>  
>  	do {
>  		u64 addr = ppgtt_ofs + ofs * 8;
> @@ -1493,3 +1517,4 @@ void xe_migrate_wait(struct xe_migrate *m)
>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>  #include "tests/xe_migrate.c"
>  #endif
> +
> -- 
> 2.34.1
> 
