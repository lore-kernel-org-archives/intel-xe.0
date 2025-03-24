Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF0DC36008
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 16:48:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016D110E171;
	Mon, 24 Mar 2025 16:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M93KenLY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1278F10E171
 for <Intel-Xe@lists.freedesktop.org>; Mon, 24 Mar 2025 16:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742834934; x=1774370934;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Z72HUiXjqNgzfcZF+P0i3eZkN+iKcYA07A1+ZIdPyFc=;
 b=M93KenLYSyZahhDP0NCmMXcCEjgQ2MK5YX/mC2l6GGu10mXpWAYMF7ee
 RjpI0y2Pui4MdQIj0gQmKYqZno532SsPqmqQ8PsVyDJrb0kb6Rg8gQ5+S
 hDlQBRgPSDJBO4YRfZywK20iKYFUJYHvTP4kjVmTfNXJdmYRdGvBnp6kc
 TmaSe6vIFIczvSFnuHEJ7oJPdnxd8RiLDvcF5GEPWnPvWFAJAlUwFB9I1
 yli3e0z/+HInhx1u6aP85du4YwV3s/ZYRfBRDuijyiYSzFOjV3iaKdhrs
 sEurw1EAKDL3xNh3ooPStqK9RAA+7iubxxy5V58bbi8PFyj8L9oAzF97U w==;
X-CSE-ConnectionGUID: mi4QJuePSe2CUmO/tCjpRA==
X-CSE-MsgGUID: n48vxWuhQviTj4NVBtp/GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="54256170"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="54256170"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 09:48:52 -0700
X-CSE-ConnectionGUID: 41Ye8Is3Q4iZ6kvFe3/CxQ==
X-CSE-MsgGUID: bVYElt0FQZmZ+5B+XZjJdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="128271737"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 09:48:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Mar 2025 09:48:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Mar 2025 09:48:51 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Mar 2025 09:48:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D15nSlVqc92kMr+NADd4XG6SRc25kOVYoTFzoLMZ6PaQOqropwBu4gu1JCS7yLmLUllbGtorOizjPh8jFpyLaJgJoheX5N1BaggAn5F18aK+YHO9vIFKChAAk72erIr6gE7b/ntKLeK0YzqH5SuOSqHduBK1yB3ogWBfXFISEoyphdwVebT7ABDNULKEKc8BkQuEE6S9VpBITGlm55AgFMjPF5lcI1YTBGiqkknuro1eLlBEnb4cfnCxpRHb2zWjJ4xU9rc9GhBOdDcmEBdPmm9QD4DgVAiFIzl8WWJD+pM6gw7Ce9Te0CvfmZFWDcEiVc/cGh1NvssmhLJYkxX1qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0/penWo9VE4nX/5309O91EAKCR9+EhSzqA14R/eQ4o=;
 b=IjyoZViBza2PbHqYrU0dFHbf9SIxF4Cmj91qOo9q/d8b0Df/y4T/jUhQB0pdHh8Zv04iI3rHMPlxANO9jhiIN20uLqH0KKJpaGMzniLZeG5JPQqaGA7CEWBLahQQy2HgBrnyVRnXn65ScpragZj7K2cKKxCBAAwZ09vBTSQXJ5s+GXjpYzZkJ+poBuRwX/Fr7LqKuzvidJhlig8XNUb3oDWLikuX7p3VWnF8tqz/55KSgs9HOqR6fcsFnFB3Z75jqvnXoWkdgkBuLb0T75K3ygSYJJEuDx8+MTzjHbY0y7GzWZkpUPIKeL951URThlmCQ8jYNAGsZNkClaC7Xf7+Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MN0PR11MB6277.namprd11.prod.outlook.com (2603:10b6:208:3c3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 16:48:48 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 16:48:47 +0000
Message-ID: <de0073ad-9b42-4c0e-bdfe-a47d45215cc4@intel.com>
Date: Mon, 24 Mar 2025 09:48:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Track FAST_REQ H2Gs to report where errors
 came from
To: John Harrison <john.c.harrison@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20250221031444.3820965-1-John.C.Harrison@Intel.com>
 <eaf6cf82-6d5b-4e2b-9a61-bc61d447c5ae@intel.com>
 <a72ac04b-dbe6-4840-8f5b-475bac782382@intel.com>
 <094db2ab-de03-4505-9256-5fa552babb0a@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <094db2ab-de03-4505-9256-5fa552babb0a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0073.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::14) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MN0PR11MB6277:EE_
X-MS-Office365-Filtering-Correlation-Id: 11a16e93-367f-4ac9-ad35-08dd6af3bf47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkdhaXJ3NGdKOHVnMDQ2bUVCT3VKRUs4Nzh5Zkh0eWkwSlRTanY5cjVUNy9U?=
 =?utf-8?B?NmQ2QWxMWGZYRnRGWjhkdkp0YUJTSUJnMk1LYVBBNGNoazV0dUpZempxYVRH?=
 =?utf-8?B?dHIyRnJkek9lK1M3N2JHUWtQZXhSRERoeks0dzZ3MEFRMTJha3lWSXZ2LzRn?=
 =?utf-8?B?dkZaWW1iR2N2S3lPZ0t4TGgvREdYeEJjMWQ2d1VLUVA5WXU1ZzV6RndBRXlU?=
 =?utf-8?B?SEFNTUJuUE9PdWExTUZDM3ZEODVYemJDS1dORy90cXYxQkQvY1M5SU1PL2ha?=
 =?utf-8?B?OGtxajczN05talNYRXc5SzJxcWx6T3JPcTRiMzgxWlphb3B1ZllkTDJmSlEr?=
 =?utf-8?B?aHd5S1VLcWVPM0F5aExQY3JQMnVldnZUeFF4VkZYV3NVbFREd3g3Y282aXp0?=
 =?utf-8?B?Z0RpU2Y1YUJnREhuaDhYdlY2SnYzazNjSkgvcU0yaTloMmFmYm5PVWF0eXNh?=
 =?utf-8?B?aE85QUg3Lzlzd1BiS2N0VyttSnNvelBWMWF2OWgrWll3UXUwa2pMa2hLcEJk?=
 =?utf-8?B?SkpETUhrcFcwV3hYV0hXWGhhN3hGMjUxZWdxdC9qYkdPQXRPem5DMmxCRXND?=
 =?utf-8?B?VXA5R1dxRUx4OGk3bXM4T0J0Uy9ScFI2a1pUcklDdWRVbkYxKzlRaGs3bFlR?=
 =?utf-8?B?ZGExcjBMaTJmMFhheFpkVlR0bVB5cG5PZnNxUTk1eHVmeEhlNVdRK3l5Yjg2?=
 =?utf-8?B?NjIvUW45K3FhcVl1d3VaQUhra3hTcnJQcnZTTXdJODNNMzRCYlR4WnZvZUhq?=
 =?utf-8?B?VUxvUFRpUVZKY3VmdkJYMUxZRTJYUHg1UWt6MlJHYkw1cGVZcnd2SitNYmJo?=
 =?utf-8?B?N1B4Q0tGNkYvTTdad3NwelMvY3pFWVQxUmVjKzhzVHFqTExTRS9URGdyR085?=
 =?utf-8?B?SlVZYy9mRUdYSll0eCt3ZWt2SWRhREI2Q3o4QXpHVjZFL3FQQVZKVnFTSlBk?=
 =?utf-8?B?Q0VSWGFacExXeUVGV3FRayt5bGJiNGdxeThtYTJra1VTNk43anc2bmk5UFoz?=
 =?utf-8?B?bUIwMTcxNGJpTTZEZEJyKzE2SDRuRXlVakJTc05MeWMreFhiYklXRjMrNG83?=
 =?utf-8?B?K3oyZFliMHN4dG5OYTV5NmpHM3FDb1JFOUhMVzZjWG9QK1h3bUpHaC9ZUjVS?=
 =?utf-8?B?OHgzeFN6Nm1CNHhsN0p5by8yYmtzM1JKam01S3E0MkNNODNieTFNZ0kvMGli?=
 =?utf-8?B?bG40cHMvc3dKYzgxNkR2bzVzRi9WTVlmM2g0WHludXh6ZmFVd1pzR3NZOEJD?=
 =?utf-8?B?K3ZCR3lsWXY1Q1JibW1HZ2VPSFlOMS9IaHBaQWo5cmF2VXJBaklXdGtWNk0x?=
 =?utf-8?B?amIzV3dqRnBqNGR2L3NZcmtlY0N2MlVGSmdJVW9XVmw2dm1kV0kxbWh3Ny9K?=
 =?utf-8?B?TE8wYWhyYlVvanJCSnhhWnpnTHhVT0tCL000OTIvYXhnUjIvYWN1NEgyUndt?=
 =?utf-8?B?T1lkcWVoMzM4RWJDLzB0MTBRQzc4MGI5SmVOQzFydEZJY0N1ZVp0WWQreElZ?=
 =?utf-8?B?aTd4b1hYczVUb3o3QlhIQmVyTVM3NndEb1Q2Yk1MSHZ5SDNYOGdYMWlGM2xY?=
 =?utf-8?B?N1REejZVamVVdW00Qm9nbGEwdG5URUFxOWo4ZGdhSnFDRW5DWWt0UExqWkRY?=
 =?utf-8?B?MW5HdktyVzZRR1B4UEJsVkcvV0c0aENsdUUyK0ZEVWdWVjkxbmFBaHM5Yy9m?=
 =?utf-8?B?Vk9Mc3RkWTM2bGdISjlmc3owVnlBeVFPSEtpVGxTNlp1TVczV2FMeVJ1L3Nj?=
 =?utf-8?B?bnZUejZkeVJ6OUN2UjR3NGs1dDV0djZKUVF3N0h2T3R2bzJrdlZERGNUVjBV?=
 =?utf-8?B?bmtlZGU0Yk5IWVJMd1RXSC9LVUl1bDdrUmVFVlFoNjB2ZEsrRWtxcS9sdTk3?=
 =?utf-8?Q?kLpZIHDxI5bpD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0pnQ3FZWktNaW96cFJmd2g5TTZPWXJLTC90UGpkcVFSUjcvQWdNZlZrTzNw?=
 =?utf-8?B?d3VZRHg2UXdFQ2xFbDJxVXNDa1pNNWE1dHZMa3JDSDZObTRXZCtDcGZzS2t2?=
 =?utf-8?B?d3lGUmFYYURMbFd6K2ZWSnp0VWRjek9rK0F0bWMrVFFLejlwRXJWZVcxTjFS?=
 =?utf-8?B?U2REamhsVGtrTHZpZEIwYWFXN0gyRHhaQnA0U2FLelRYejZjTUJqSzJhVE54?=
 =?utf-8?B?bzJGYXNxY1BoODMzL2lWdWcyQlp4ekJJOEpBRzJNbzFaa0grYWxiYW9acEJ5?=
 =?utf-8?B?K2lsZnMrQnFvdjFrYm8vUkxxeHlid0pFcjNnSUQ5R0lHK0haU3JNWEV1eFZo?=
 =?utf-8?B?OW93SURTOVVySEp2a0hsRnp2YnloUU45VlVpWStLM2JpNXpjcGxwdllBMGlU?=
 =?utf-8?B?N1ZadjFIU2lLVy9pd2R1cUFZb2RIQllYOGthdHI2dWlxaFlianpBakd1RG9w?=
 =?utf-8?B?d0dJZVBpeFNlaFJxWThSMkQvb1JpUlZmVW9DZDdTeHVQOG42RGNWRWt2Y1NX?=
 =?utf-8?B?bHhjT0oyNi9tTElEWFJ6Uy94TGxlenNOTTJ2Nm1WQmMxK3EzR3gvZlA4OWpk?=
 =?utf-8?B?K2svOE5TKzJNUG9WOGpZb1V3R0k4azREQ2VXVTZSUWZPbTNWeDM1QjY3SUs4?=
 =?utf-8?B?K25GdUFwTi9WYnZkdGdWdXk2a3VtZnY0TVJuclVRbnptWExka0VPNklVL2Ez?=
 =?utf-8?B?Sk5uRGxTYlo3ZEJIN1V3RzZmRU5ERkZGSTh3cE1IYldoOGZQTFlJWlRIRjQv?=
 =?utf-8?B?UFoyL1BIcE4wMUpLQzdiTTBZK2tsSU9peUxyaHhaMDhaa0RWTjBzN0FGcDBR?=
 =?utf-8?B?RlA1K0JycjBSMGhVclJNa0VWZFVyVUJLeWVnTEFnMy9MajJLaVRIZFY5aFpG?=
 =?utf-8?B?R3NEWkdyMWxYaTNKUHlwcElNVEhaMzh3MWEzcVFxWGc5RU0xWWNiMVorM2FY?=
 =?utf-8?B?THhLNmdUZStWa1RxS0crbVJ2Sm5RRmEwY2w3WklhdlhZUy9rOGpvSU40T05J?=
 =?utf-8?B?TVhILzNpRmNDWmdiY1k0S3Z6OFRlTkRDMjFac29UTFFlRm5yTWNOQnFmY2Iy?=
 =?utf-8?B?OW9rZSsvWTVTR3pnYjhXR3hoQjVBb0FwbHlrWHl1amxoQU9tMWdmaW9XeE5Z?=
 =?utf-8?B?T29VeTc4ZGVPaFI0RStYQWM2ZTl6b0FFNE5wTGpqeEI0dUJ5dTdEUnpINDRq?=
 =?utf-8?B?M2NhWGl6TmNCcHlHR3pENVNHSW5JTEtXWmtvQ0dmd0QxdnRtc3hyb2hybldv?=
 =?utf-8?B?RG1ORU1TR1IzTytVbVRxenRMcmJqbytTdlgvdHg0Z0RFaUdUamZrdkJOalR1?=
 =?utf-8?B?L2pseElZRGlwQTVySjgyNGgvTDRKdVhkc0xVUFZoTjJ1QlF2cFBBMkVMR3dx?=
 =?utf-8?B?OWFmYm04aFhzK1Zpby9GMVhwSkZ0OGErYzVRMFo2ZjBiNW9YeVlqd05USFpw?=
 =?utf-8?B?TVRkRVpPODN1d3g3aStOOXBFY3d3QnI5TVVFMW1aVE9YcWt0WTNEME1IdHJR?=
 =?utf-8?B?c1M4MGVJcVVFUzZEbC8wV25LcUZLaWFnYndwTU5YTVRURk9RZyswRVAxWGZo?=
 =?utf-8?B?QW84REhUV28wRFZlaXhlTVNtSXFCQnVTVzM1OGdqWlNxSjg4Si9xMHZ2UlJo?=
 =?utf-8?B?ZXNOR2hqQWJDd1RuTFBFOFBGM2docDVTdmkvbk9qQ3lDQWZYakdXb25wWk5s?=
 =?utf-8?B?dlg4RVlaQ3VONkNRRTdKenZyV2JVUlpwcXMzUEJEU2pDaEVSQW5JTjg4MldX?=
 =?utf-8?B?WSt0amlJYmwxekdlUFFWekUyTFVwM2xpcTJQRnlhK1ROcUpmM2pxeWxGVWlC?=
 =?utf-8?B?NmlVZTBzYVRUMmo3cHcwUEdUTExjc0hBTXJZZ3VIWXFNMDlMZ3Jna3RWN1dw?=
 =?utf-8?B?SU1XS0ZCQ1RRczY4NGQxNjJuR3JsM1FWZE9WengyM2RCOE5MWFdMMmlkdDNr?=
 =?utf-8?B?Slp1NEdsSmpuSzM2d3g0WVR5ZjNxU1lkdmNSYVptYzhwUEg2cWJRUTF5WVJM?=
 =?utf-8?B?Tyt0L2orN1kwRzdWWUlNZUw5THBvQ00xSjlCUk1ET3IzTUhhREJyYXBSWWdR?=
 =?utf-8?B?RjA2akp6SG1iSVNnRVJOYjZ3ZFA4c1RYaXRLWmxxNks4eFFGWEhmOGw2YUZr?=
 =?utf-8?B?VVppWWlPQzhOdWFCUUNkTmlvT2p1anhNeFVSbysvaWI4dk5tRkFZTE1lRkNu?=
 =?utf-8?Q?zcK6BiFTvzlkXSBIU1Zmr4A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a16e93-367f-4ac9-ad35-08dd6af3bf47
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 16:48:47.7900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mnu057sPrfkDisCScqq9QraFmCNJNSx9Sn8csNjWWNR+BJHMj9SnuF6CKaQWQ33aIGdDfFJvq1rYuZuOc7J5k/WiwFo77GYIJ6RlmkJCiFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6277
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

<snip>

>>>> @@ -1141,6 +1165,47 @@ static int guc_crash_process_msg(struct
>>>> xe_guc_ct *ct, u32 action)
>>>>        return 0;
>>>>    }
>>>>    +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>>> +static void fast_req_report(struct xe_guc_ct *ct, u16 fence)
>>>> +{
>>>> +    unsigned int n;
>>>> +    bool found = false;
>>>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>>>> +    char *buf;
>>>> +#endif
>>>> +
>>>> +    lockdep_assert_held(&ct->lock);
>>>> +
>>>> +    for (n = 0; n < ARRAY_SIZE(ct->fast_req); n++) {
>>>> +        if (ct->fast_req[n].fence != fence)
>>>> +            continue;
>>>> +        found = true;
>>>> +
>>>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>>>> +        buf = kmalloc(SZ_4K, GFP_NOWAIT);
>>>> +        if (buf && stack_depot_snprint(ct->fast_req[n].stack, buf,
>>>> SZ_4K, 0))
>>>> +            xe_gt_err(ct_to_gt(ct), "Fence 0x%x was used by action
>>>> %#04x sent at\n%s",
>>>> +                  fence, ct->fast_req[n].action, buf);
>>>> +        else
>>>> +            xe_gt_err(ct_to_gt(ct), "Fence 0x%x was used by action
>>>> %#04x [failed to retrieve stack]\n",
>>>> +                  fence, ct->fast_req[n].action);
>>>> +        kfree(buf);
>>>> +#else
>>>> +        xe_gt_err(ct_to_gt(ct), "Fence 0x%x was used by action 
>>>> %#04x\n",
>>>> +              fence, ct->fast_req[n].action);
>>>> +#endif
>>>> +        break;
>>>> +    }
>>>> +
>>>> +    if (!found)
>>>> +        xe_gt_warn(ct_to_gt(ct), "FAST_REQ G2H fence 0x%x not found!
>>>> \n", fence);
>>> Not convinced about this error message. the fast_req array is only 32
>>> entries deep, so it wouldn't be weird for entries to be overwritten 
>>> in a
>>> busy system, but the read I get from this message is that something is
>>> wrong with the fact that we didn't find the fence. Maybe go for
>>> something like: "FAST_REQ G2H fence 0x%x action unknown". Not a 
>>> blocker.
> How about:
>                 xe_gt_warn(gt, "Fence 0x%x not found - tracking buffer 
> wrapped?\n", fence);
>
>

Sounds good to me

<snip>

>
>>
>>>> +    /** @action: H2G action code */
>>>> +    u16 action;
>>>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>>>> +    /** @stack: call stack from when the H2G was sent */
>>>> +    depot_stack_handle_t stack;
>>>> +#endif
>>>> +};
>>> nit: should this whole struct be wrapped in CONFIG_DRM_XE_DEBUG? Not
>>> sure if any code analyzer would be smart enough to mark it as unused if
>>> CONFIG_DRM_XE_DEBUG is not set.
> Um, it is. Or are you saying that it should not be?
>
> That '#endif' just below matches a CONFIG_DRM_XE_DEBUG that was 
> previously just wrapping the DEAD_CT structure. Now it wraps both that 
> and the FAST_REQ fence structure.

D'oh! I missed that the ifdef was already there.

Daniele

>
> John.
>
>
>>>
>>> Apart from the nits this looks good to me:
>>>
>>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>
>>> Daniele
>>>
>>>>    #endif
>>>>      /**
>>>> @@ -152,6 +165,8 @@ struct xe_guc_ct {
>>>>    #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>>>        /** @dead: information for debugging dead CTs */
>>>>        struct xe_dead_ct dead;
>>>> +    /** @fast_req: history of FAST_REQ messages for matching with G2H
>>>> error responses*/
>>>> +    struct xe_fast_req_fence fast_req[SZ_32];
>>>>    #endif
>>>>    };
>>>>    diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/
>>>> xe_guc_log.h
>>>> index 5b896f5fafaf..f1e2b0be90a9 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>>>> @@ -12,7 +12,7 @@
>>>>    struct drm_printer;
>>>>    struct xe_device;
>>>>    -#if IS_ENABLED(CONFIG_DRM_XE_LARGE_GUC_BUFFER)
>>>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>>>>    #define CRASH_BUFFER_SIZE       SZ_1M
>>>>    #define DEBUG_BUFFER_SIZE       SZ_8M
>>>>    #define CAPTURE_BUFFER_SIZE     SZ_2M
>

