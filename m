Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96C9C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 19:25:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F218110ECA4;
	Fri, 24 May 2024 19:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nz4EUTK/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A2310EB1A
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 19:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716578712; x=1748114712;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yryTIybBMLfwXd5hVwqHWJ5PnOEtK/EZoJRyPUq2+jY=;
 b=Nz4EUTK/n5nmFNdV/XkO4ZBYDxeJWCLI61kr12IXLl5XSCdfe2lylw18
 jqn+qiT7RuDGIRUALk68uYoD9zQ/8MoDqhYu3C5IPZhs/6uNGcHio/dbm
 v5PVZ+A6TfgIuxk4QNtZXTOFwIyzen/nOXYq5pqmxFZ8nFZWYyHsPEyHR
 0Dr+cCrASHzGAbwUI3QPS7kzQOtXfFphgH6nIoc4D9uCOhE865p4U8Pqu
 sIvnT1Z+M/aJ76orrBWLFTlkPiX52CFDWSAES4ujGg32AwGWRbW8bqyse
 +kJ3KP6Cw384VRPOh2cRq3DoNWq9HHnHR0tH27CXKhOYlYPBBuMMJZ/I8 Q==;
X-CSE-ConnectionGUID: dEai1aAXRamOtaXhKPnbKg==
X-CSE-MsgGUID: WXKep0aBQiG04N8AoSe1SQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="12796364"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="12796364"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 12:25:11 -0700
X-CSE-ConnectionGUID: v3s9eK0YRuuU4bdWSZKAxQ==
X-CSE-MsgGUID: tNaZI157TGO0zgKUJmKH1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="38536444"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 May 2024 12:25:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 24 May 2024 12:25:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 24 May 2024 12:25:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 24 May 2024 12:25:10 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 24 May 2024 12:25:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGgzZZqlJmkciaGbsZzHapZiZAKNPk5fIXjD1W7HaEyVbSdtWJE2E8ia8pphERMgxF/ynCIyTvEKCD20wn5IwMvoow1VW+IVCqhWf2poeFn/JvtDuB/V3jnq/WEtKUPyI5yMuYQP6OGstnda3Gczjt7ufqeaotXGehz4J+jt2kVq9buxV35FUH6FgghNJnB4tsMba/PxH7TPwKtb6WhC655hEL8KPSa3eawhwV0ohdZy4P1hObJpPQ4cypAVyV03Uln4wILm6IU+dcsmfV1oHIPOxVS+pIG2caUNei9JJMosijAyU6njrekHH/vgVAxt2sLEc+lvuaSeAhfaiCLvVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCW+/3hmPJEHK7JAFTRHSmToSbL7dSyPM3DkOAUmpr8=;
 b=j/EtURtP3EUWp6aDnNmLhkTC477gT6rF0rdj8bFKmP9OObN3FLewociUqxltLLZve1xaLvWEhwD81IDgKQ9j1SbIMYjo3LdNLlFdv88t8a6oOzQo1Aas2JwA0zhE0fl2Ws0XLpowy2Ir5ERYjEkcpWaQWD1Tk/eW64SL8XPbNRQviHJ2JVpAnszX83LGDpMyjSPhWdxUJExy9lMS8gUfhNOEm+L6ZQ8wZmntaT0w1zY1aArZEn4LxVkH8EMhu2eHE2u7NdduaiM4SBvicni//IlmDB85Uy8eUJOC28ME6mP0ImXE1hJTrAAGdD1AqQ3UtIAT+jI1mJ8+1qWR/Z78yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB7375.namprd11.prod.outlook.com (2603:10b6:8:101::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Fri, 24 May
 2024 19:25:08 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.7611.025; Fri, 24 May 2024
 19:25:08 +0000
Date: Fri, 24 May 2024 12:25:00 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <jani.saarinen@intel.com>, <matthew.auld@intel.com>,
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Do not access xe file when updating exec queue
 runtime
Message-ID: <ZlDpjOJbfzE6BIDB@orsosgc001>
References: <20240524184958.1344787-1-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240524184958.1344787-1-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0225.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::20) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d3a8f2d-dfa6-4e90-9a35-08dc7c2738ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVdESk45cDc5WCtJSitqeUFxQVNHZDZTem9jMXlMcTQ5SDBod2FWTk5DUTVr?=
 =?utf-8?B?QlhZMWZ3aFZOVFNGOWZPbWpXQ1pGSnpmOWhJMUhGVFhVT1YzdGMycGFPd3Bj?=
 =?utf-8?B?Y053RTVSdDM5TTRyZEpFVjVwZFNyRE0xdXljaUlZRWE0Sjd1eC9UcUdLeGtR?=
 =?utf-8?B?Zks2ZkErNGtpRGJ5bm5pN0NCekxBV2t0Umt2d1QzN01UWkZmOXJ6Z2JLSnV6?=
 =?utf-8?B?SXFIM093UjVJcTVQTVVMODBoeWd2akQ1YUJvTHhSTTg0dkpMQm4yVEpyclhO?=
 =?utf-8?B?RG9FTFE3blJjUUFGZVEzUFpsWU04QThRTTlSS1p1VzdTa0VBcnBvZlQxZVZK?=
 =?utf-8?B?Vk1VWHhJVVQ4QWVybDJjdXR1NmYxZDk5UjhiWGpzMi9HWEthWXdLRlhBeklC?=
 =?utf-8?B?bmdLdGtSZEtoNEFhNWlNZTFIM1V5ZDlZVlpTdStVS1FFV2VUUFpDM1lrRXFE?=
 =?utf-8?B?VUZyZG5hRWhNcHI0Y0ljb3lWTWVsTHZib1E0b1RrM2VMSGg1eS9FSFhKMm9L?=
 =?utf-8?B?Mk5hN3NXRDhqUkJIMWVobCtyM2JJQlJ2ODJxWXZ2R255RkY3VUNBanNWU2x3?=
 =?utf-8?B?MURLTko4aTJQOHNyL0hldXVqTlJrbm1rT2FMZzQrdk53ZU55WFNBb3hlZkFJ?=
 =?utf-8?B?K2Y4VDhXdm4yVzZjSXREMGZKRXFMZUJjelVORTR3U3ltZlhsdktOaGMxb1RB?=
 =?utf-8?B?NmN6QjExUEw4ZkhBMGZwdEp3a3o4ODZCM2FqcUl2RFNOY1l6ei8zNlYzdHdu?=
 =?utf-8?B?ZnVuZXllVWZsaTZPZTdETmNBRWJGYVlzUVVXM0pXcmxnalp3YzBoWklPd3VQ?=
 =?utf-8?B?TzVaMndBa1htcUdMa2xLQkpmVDhCZVVUUnJlQ2hOODQyQ0pMdUlzZWp2enpt?=
 =?utf-8?B?RGtZUnZTa0tUOEp0ME96RlpqakdRQkdvckkvMjJtakVFQ0lmc3d6VlJPL3pB?=
 =?utf-8?B?bGpsSG5YVUNmUFM2WDkwRjhocHRETlJVMGFKUWNBdEEwL2F2cnJ6eDQ2bEZW?=
 =?utf-8?B?MDMxeVRwSzgwOERSN3ROSlNWalhhSmQ1QU9laUNvS0d6d3hiR0s2elladmR6?=
 =?utf-8?B?THJYN0dPTmJjOFMyTGxVS1dZa3kxMDQ5Y3NHWjZWTllsMHlaZFpYUkhaam9y?=
 =?utf-8?B?SUFINExiZjRpWDB6UkhURkp5MnQ5Qkl1RS90VHg3SzVyWjJmdkhTQWZZR1l3?=
 =?utf-8?B?NnNQVHVhZTBzWmFwSjF0NmczMEV5bTgwYW1ENWQwd1NZSW9qZ1hmMktJSFJ3?=
 =?utf-8?B?YWp6cStmeHBDSThIandwd21BQWY5elNFYXRJRTJHOW5ZNWRMUzBqZXFmSm4v?=
 =?utf-8?B?UXdyNVVtMWVMOWdBdG1lNGIwWkhPVnRCTzJvekJibE5uUllPb044RXdqRjdr?=
 =?utf-8?B?RldNSWdEWVFCKytwNmlyanQzZDhhUjBhSEFkMGwxQmphYk9aNGt5NElxdzhx?=
 =?utf-8?B?Y3dXRkNJL0hNTTZsM0MycXhmNDFFdGEvUy9Oa2dEbXZmaTE0MHg5cWEzWFpj?=
 =?utf-8?B?M3pZeXZ0ZTd2S2Rja1lidDgwMGdMc1ZmVlVVK0pldThxSWt3WkxDeGpvRzR1?=
 =?utf-8?B?RmtkMVhoZGprOUkrSzBYelI5RU9tOFhkSkxkY2dsUytDaE5xRVdGbkRSL2k0?=
 =?utf-8?Q?uiUByxBODHXAe8J3M3oBvbz764et25coFRDMqA4AqE/o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2VVRjFuVndIK0gvWDMrWlhCZkZkdGdqUmhHaDhDbGNXTXFEa2s2clprWFFL?=
 =?utf-8?B?SlV3dHZXTHdoOWVpZW9LVlBWbnBaOGlDZmEyVWFVbHRkdGJ4YlNQallMRUlO?=
 =?utf-8?B?eGp1MjdVVUR5d1IxT3FKbTFXUFpPUnZTcnFjVWZheWxNOHRKQlg4eGRsT2hp?=
 =?utf-8?B?MCtuM25vbVJVVkNCcnVXVnJlQlpYM24wRFpBcm5xTUJackpKVHd4ZElvZXF6?=
 =?utf-8?B?ekVqZmxNdW5JbXdGTlQyc1hKdmYxQWMweDJiODNJdUs1aXlSZ3B0VDhQS0ZI?=
 =?utf-8?B?ZUgyM3RwZkJjajNwTHJkQWJnMVRzdmtBUDBDWVhNazJpNkhMY1d2YzZLWkUr?=
 =?utf-8?B?WGcxNGtkeit6VDV4VVllazlYZnhNS2tlNEY4TEZpVUNGL2cyZW54a1hHcUFH?=
 =?utf-8?B?UVlDeFJBcUJ5V3I5bzgrd2I4R0ZHY1k4T0FXVUJSVzk1d1pTZVpsbEZvZWsv?=
 =?utf-8?B?azQxaFVENDFoY2xDZkl5dzlkbFdEd0h2OEIzajVMV3RDSFhISzBsQW1jNUU0?=
 =?utf-8?B?cDdacklvampvWkt0cU9KbnBPbkdUeHQxK1RMTFFUR1djYkI4TzhYOTdwekh1?=
 =?utf-8?B?bDZ5OTh2cys1OVd2MEMvSWYxQWVKNHRNZTdZT2FPRkZXNllGZkUyTEJXc0ZF?=
 =?utf-8?B?NHRFR1c5REFVOTlJVE9adWhPQUsxbHNscWZlOFBhNHhXRWVmMXhBYWRsWVVS?=
 =?utf-8?B?dC9BOHJrdWtmNjcxcWJSN2xHTGpKNGlpajBZTVhXVmpNUjIySFZlTmJybUto?=
 =?utf-8?B?M2lvSHZ0ZnltWVpIeU9WeEwzcDB0REdLaEt5SWt2bHR6VVpSOFJUK01QZ2pV?=
 =?utf-8?B?dXdZMGpPNE1RTXl6eFZMa3Z4cVNOcWM3eGdIbCttczlMTUNLd1huajdMblE2?=
 =?utf-8?B?TitxTnpFeHVKWkVvelFldFVieGwrM3lpVW1ibUNRK3cvdElDd1F3OXFDdjZZ?=
 =?utf-8?B?cnBQMHRrSDFtci8xenl3d2xpZU5mWG9tU2Fsb3ZxWDdFVFNxOFptZnI4VXdn?=
 =?utf-8?B?R3IwNC95S1BtQS85UmNMNnVYUHUvRXdRUGtxcG5VeUd2Ly9mOUtkZm95Nm5C?=
 =?utf-8?B?MjFhN3lvbnhYVVVuRldXOGJFRGUwNGx3TUxmenUxNHYwQkN4Q1FRbXlVakx4?=
 =?utf-8?B?VHFxMUphT3g1a2ZUbytRbHg3cms5L1ZqWSthQ1dPUzBiTDRwKy9IZGdEamho?=
 =?utf-8?B?UmxRYU5YLzQ4L2hqNTlYUXA3cGpMOHdLc2IxMXkyZWI4dEQzSWhsaXM2czZN?=
 =?utf-8?B?UG9hYS92VFJZOXppbjlZL3Q5OUc5MTlLSU5jM0thN1piR0Rsc0pzcTNPMEg5?=
 =?utf-8?B?OW0wRVo1SzFkQVV5TFRGQ2wwNzVCWm9PNnROMkNaR0ZxN3BzSHVoL3BPTzdB?=
 =?utf-8?B?aEFaak5VT1VWbGJqK2tnWW1ncFdFM2QyVnNMcmlodENlNlVTWnIzdDBSbGRS?=
 =?utf-8?B?VGlUNnhLZ2J6b3NpcGI4bXpkTnc3SG9EczZCa1V2blczSk91SXFjMzUyNENU?=
 =?utf-8?B?UDFzS0NkNWxyc3NBOGxobzBseVlMSDZHZXFXeGpxRTlqbDdUKzBVYWhOangy?=
 =?utf-8?B?VEpKWCtFN0h6bXNDVEhBR2ZweTNNdVUwZms5T0VPV2EwLzlpL0FLem1KL3Bh?=
 =?utf-8?B?MjBKOTZ0bU1ONGREayt5OEwxRzhJY0UwODY3WHNoSFpma3dNd2VaS2xkUVFL?=
 =?utf-8?B?bG1IY2MxUG9qdll3L0FRVmhPaXhqWjNxN3ZtOVNvbXE1YmFkRFBxUnJwU1FP?=
 =?utf-8?B?RE5OS1Y4a2J2dVdKRnpLNlFxWGZGM29LWVF3a2hTWHJITWxyZHZoQnd0QTgz?=
 =?utf-8?B?YXYyaGh6bkFBWXp6WGZzcjArL0hMaUVzaVBHRmtaeTBDd0o4RCtUdFBtdDl1?=
 =?utf-8?B?ZjA4V2kvWnlWK3JWbkMvd0NXeHd2R3RvTFA2NE4zdG92MndJeVQzYW9YNFFI?=
 =?utf-8?B?cGxGOEk3YWdZM0NuZldsSlBtcitXdSszZXhTWkQ3U3ppSkZZblhabnFiR1lE?=
 =?utf-8?B?KytRSDRNMDd5SXdOUnhQdVhweTFwNmFGT0ZCSTlSaVRXNlZVcUx1dEZvZ0hm?=
 =?utf-8?B?TUgvR0pVYnFjMVNiMmpxd2tobkNkY1pYSGlwa2JkT251d2RaQVNFcnFTRGdy?=
 =?utf-8?B?WU1YTmg5Smg0QTNJcVU0MEl1bFlJdlk2Tm51SG9Makc5NGdtZnlWZlhxWGdx?=
 =?utf-8?Q?tNoML6iU9b0xRVoyH6Fy+6k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3a8f2d-dfa6-4e90-9a35-08dc7c2738ee
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 19:25:08.1761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FLROkr4R5jBms8CzpS4RxN1W50+pc/gn9tiYj5mTI7LFQC2E8VzbMIryBPAVyQUvWwZ4aa2Z2QIHXmItNbvCXX1riAiaG1kazDXXiwCyHQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7375
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

On Fri, May 24, 2024 at 11:49:58AM -0700, Umesh Nerlige Ramappa wrote:
>The current code is running into a use after free case where xe file is
>closed before the exec queue runtime can be updated. This is occuring in
>the xe_file_close path. To fix that, do not access xe file when updating
>the exec queue runtime. Instead store the exec queue runtime locally in
>the exec queue object and accumulate it when the user dumps the drm
>client stats. We know that the xe file is valid when user is dumping the
>runtime stats for the drm client, so this effectively removes the
>dependency on xe file object in xe_exec_queue_update_runtime().
>
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1908
>Fixes: 6109f24f87d7 ("drm/xe: Add helper to accumulate exec queue runtime")
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> drivers/gpu/drm/xe/xe_drm_client.c       | 4 +++-
> drivers/gpu/drm/xe/xe_exec_queue.c       | 5 +----
> drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
> 3 files changed, 6 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>index af404c9e5cc0..a6a15562b8f7 100644
>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>@@ -251,8 +251,10 @@ static void show_runtime(struct drm_printer *p, struct drm_file *file)
>
> 	/* Accumulate all the exec queues from this client */
> 	mutex_lock(&xef->exec_queue.lock);
>-	xa_for_each(&xef->exec_queue.xa, i, q)
>+	xa_for_each(&xef->exec_queue.xa, i, q) {
> 		xe_exec_queue_update_runtime(q);
>+		xef->runtime[q->class] += q->runtime - xef->runtime[q->class];

This needs to be delta for the specific queue. Will post another rev.

Umesh

>+	}
> 	mutex_unlock(&xef->exec_queue.lock);
>
> 	/* Get the total GPU cycles */
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index 0fd61fb4d104..a0775a96efb1 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -765,7 +765,6 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
>  */
> void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
> {
>-	struct xe_file *xef;
> 	struct xe_lrc *lrc;
> 	u32 old_ts, new_ts;
>
>@@ -777,8 +776,6 @@ void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
> 	if (!q->vm || !q->vm->xef)
> 		return;
>
>-	xef = q->vm->xef;
>-
> 	/*
> 	 * Only sample the first LRC. For parallel submission, all of them are
> 	 * scheduled together and we compensate that below by multiplying by
>@@ -789,7 +786,7 @@ void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
> 	 */
> 	lrc = &q->lrc[0];
> 	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
>-	xef->runtime[q->class] += (new_ts - old_ts) * q->width;
>+	q->runtime += (new_ts - old_ts) * q->width;
> }
>
> void xe_exec_queue_kill(struct xe_exec_queue *q)
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>index ee78d497d838..085a7dce7565 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>@@ -151,6 +151,8 @@ struct xe_exec_queue {
> 	 * Protected by @vm's resv. Unused if @vm == NULL.
> 	 */
> 	u64 tlb_flush_seqno;
>+	/** @runtime: hw engine class runtime in ticks for this exec queue*/
>+	u64 runtime;
> 	/** @lrc: logical ring context for this exec queue */
> 	struct xe_lrc lrc[];
> };
>-- 
>2.34.1
>
