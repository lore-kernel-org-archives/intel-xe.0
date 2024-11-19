Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F08D60D00
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 00:53:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC2710E1D3;
	Tue, 19 Nov 2024 00:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TnC9LU4X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251AB10E1D3
 for <Intel-Xe@lists.freedesktop.org>; Tue, 19 Nov 2024 00:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731977607; x=1763513607;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Sumi0oZv2aeLlqW9OW0F9Rf4rp3SvbRE+v+z6fTAFu4=;
 b=TnC9LU4XFqOh3p7nC+IUZyC38vEybs8+Ev4Y6L4lRnZFSR2vUlS3DjMC
 2G8GiFIpZmYSRKuQ4zZShDrfrkrm4qdP0aETcJdYEA/ICZNkdXihkWajt
 wXMkN7213KeutoWN7eo8pRug6fueM8die6KXryv8043RSDwz56jXHS9dC
 cyRPa1hnvQBZJKbqYunFGFwtHEbBl2dojKbhGQ1A3Nrx2w9UDqgcYBwBi
 Rr3fuXgok9nPyP8JwaEDN5anVnT+R1QduAzSj4aekRKUTAGUMLJkwzj37
 QfMM8fSE54KOcfln55GRP8nEpvv5U1G/al1PbTh0QJsg6DnOuT+/RkHRI w==;
X-CSE-ConnectionGUID: 23UMjnRHRXKXmjVWPDgHWg==
X-CSE-MsgGUID: QqUw1Cu4TT2VBOr+/Uj8pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32195532"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="32195532"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 16:53:26 -0800
X-CSE-ConnectionGUID: SyNySMddRdiK65Dcq/z3og==
X-CSE-MsgGUID: mLaXPcJITbqtc6wA6SyyEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="94444633"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 16:53:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 16:53:25 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 16:53:25 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 16:53:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0qJ4LAShDwvw+NqySU4azctG4lk4k2fBPyfeLvzxzRjXHm8vapkSW6d4lp/BvPHmt7Z3OD5+yGUO7oeL41uY8y6jxOx/UTeMZZv6TwunhAqM0A1GI+r67AxTfF8lkSMF8Kq6J/87cZpNJ1CwoqGl2qi7ZRkpsLHWBQZ25Y9n3vngd0qo2lXLSz3z+h+z0Os+ogaPdpWb4DsfYWrB82sN/3K5JXI8d0t5+pPGWU0Ty1BZAwMgc4rAoG/0lP9txQTODrieGKwlSFlmqKD477Bod/OPEu98+ahEuxK+PTAHT2Dio6fQGH4pIrnWVkLBVhnDVMaUHKUyi4vOTFtrR798Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khi8fVU67r1bcxJE4TaAyJMHRmJ4yHAvBPykrKdlt3E=;
 b=ia3BF5N9iDjM2cSll3tLfcHG9DPcYenPCu8mozujG2PUQhS08ZhOHCY9xCK7K4NhgGHqth44zPElKYuTArAgT7BWvFqAUYrec+N6pzhR+6aXNFCzKqUcSRYsH/y/Bgd9EMdyCpf59nvcvjvCI1yn31YfbPsCLvMa3Hf4/IgT+mYhOov9RAI5aH4+JzXFHhNx++RROc7URMqL18mlrrGW6uf41ajIw9sXO2Pda5FSJ5xCHS4xGkoncEpOCa+UbqnTAg6S/Xx8hlPcVbp3EJrQnS34Tn7R+rpTiouoOsI4Z6I4osDpdkc1HiGhF/s8M74Di8Z478LzSUzczJe+PHpPrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CY8PR11MB7136.namprd11.prod.outlook.com (2603:10b6:930:60::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 00:53:21 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 00:53:21 +0000
Message-ID: <23822e25-84d5-4f8d-bab9-63ae20784d64@intel.com>
Date: Mon, 18 Nov 2024 16:53:18 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Add support for G2G communications
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <Intel-Xe@Lists.FreeDesktop.Org>
References: <20241108202216.2020164-1-John.C.Harrison@Intel.com>
 <20241108202216.2020164-3-John.C.Harrison@Intel.com>
 <df4db3df-2a2e-49de-905f-a1c51793b8b9@intel.com>
 <be422e54-dac9-4890-bee5-fed54f090b76@intel.com>
 <b579cd76-42b7-4737-9a29-89913693889a@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <b579cd76-42b7-4737-9a29-89913693889a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P223CA0008.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::13) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CY8PR11MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: c39b8d49-ba22-441a-130a-08dd08349042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFZKR1J4eDRxTUNsOTJQMEIvdW14SmJyK1BFVDhBK2pyTDdWUElVZHk1bmZU?=
 =?utf-8?B?UHhkRkI3Y3FCbkZkWU1KMU0yVmR2bUxSRis4bXVEQmF4N2VIbzhGMGF2UlNT?=
 =?utf-8?B?c2R5NWJ6em1GZjh4Q2ZyM1VKakRDYkdpY3FCV05BRXBoV2tLU0ZLSm5Sb3g5?=
 =?utf-8?B?YmsrSkJwUkNwb2dTTUZnWllkam5Ya1BqVEdnQXZ0OUl3VTZwNURYbGNNQk5U?=
 =?utf-8?B?NnVsZUVhK0JjMTRZQndpZlZwdGNaT01zLzFCYXFzYVJJeW54NitEeHpvKzIw?=
 =?utf-8?B?Z2MwUzRwR3N0UUplYXdobjI3ZHd3SzVVTitkb0k2YXo1Skcrbm00MkVDdlZu?=
 =?utf-8?B?RDAxK2JCbWJhRWw1U1MxMm1kVG0zVG5zM0k3WXBBUUpzdWJwOXhhanZBd1dX?=
 =?utf-8?B?OXdYUDQ5UVkyMWxoeU13bUpEWXpNVmdZeXU3Z3lEN0dPMWhQNDR0T25wTVBV?=
 =?utf-8?B?QW1RNmoxdFFRSDVDcU1ONjQyLzloSWs0TmJOWnB2M1B6aHM3a2N6ZWNvV1Zu?=
 =?utf-8?B?bkMzb01aRUpRZTBMRW1qQ0N1bDFJV1MzaVZ0ejB3dzNpU3NLenI2UHJDVzdS?=
 =?utf-8?B?Wjhtb1c1clpqeUNXditHUVVUQmFwQ0Y2aFZkd0pGNUxmRytOTzdib041TVBY?=
 =?utf-8?B?UGVVT1ZyVkFFNmFkZUMyOHJOaWFoSXVQVTlMUy92c1BPU1BzeERxOXBoL1Fq?=
 =?utf-8?B?MERJbjd0QlhzMGIvakswN3loVkhVSXdrVFd3aVc5d0R3bEJFZ0VaR2FXa0gv?=
 =?utf-8?B?bnJuWFRhbWlNelJsNkhTNzIwNGJxUzFLRlh3eml6aTkrTFBMRzN6bzZHTERZ?=
 =?utf-8?B?N2xvNit0eG83dVRoMnBTYm9HK0NwaSt6VXRrWCtHY0QwUjhVR08xd1lOK21Z?=
 =?utf-8?B?QkxJOC80WDllYnBWUWVxVCsybnpYd0hqVDZDTHBFZXVmaHE0T3djaGFDWUJl?=
 =?utf-8?B?NXBheGRVaWhWYlNWWnMrWFUyeDhPZ2JXeTJFNEhOeFZjODRWSnU2QjBiYlRr?=
 =?utf-8?B?b3AyS2pFb1FCYlpYblRWdmV5K01KaGZWc2VNbjNZWm9hQW5tNUdHVHZyZzNY?=
 =?utf-8?B?YWxWQ1g4dmNuZ3JsK1M1WDlwdko0S2I3VGp1OVo0VGh4c3lsTVBteDBTS0J4?=
 =?utf-8?B?OWlmRmN5SFRpcHhYMzQ5OUprQnROclF0LzJYR0lybWtmc2NRZnJsTkFvc1dV?=
 =?utf-8?B?UDJOZWVjYU9JVHY0VEN1L0Fvbjg4aklsM0lWb0x6RW9qRGtMT2dOc3JMVEJl?=
 =?utf-8?B?S0VNUG1Bd0FkUWNZZ3M0TC9ITEpSWGx1Tkp0cXhlUExrYSs2YSsyWWF6RXpR?=
 =?utf-8?B?OHplMlk0bk1MVThTMEpvNmpwSjJwb3FoZTQ0Z0ZCanBYWEkwM0ZTbTZCN3ZF?=
 =?utf-8?B?MHNKaUE0U295RDVhVnNvZkhWclN1MXlrRS9UU0JYQ01lZ05LLzhjd3NFRC9D?=
 =?utf-8?B?bCtJQ1c4UWFwQjlqQy83cUFGMGxjalFPYUtxTmk3SStvelI0MnM5NDRyY0tv?=
 =?utf-8?B?Nk5KWjZudkt6UExIelhtWU9oWDBRMVNJdDA5ZFVVTzR5ci9ZenE4R3N4eTRt?=
 =?utf-8?B?YXFYYmE0MDVSUG1jaUt0UXlVTzZ2VnZsY2xFRFBoMlJwQ1NBSXBGRFdHcXho?=
 =?utf-8?B?OU9Jei9wd3U0RGV6NGo1bnpTVXc5RThoK1ZJZFo1cnVTQ3oydHdWbWd5WGFD?=
 =?utf-8?B?eDlUM2N1cVByN2VUMjFGZUEwNDAwcjIwWUhvY0traDdqR01QbDA2eFBBUlll?=
 =?utf-8?Q?usfcLsK/Uza0hGev8AhEE0KqEJsGi4TWrwoEqg5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTljRjRiWm9TZ2ExdEdvejNFYU1Vdmk4ZHk4c3hKMzJSNnpaQ0RnaTdlcy91?=
 =?utf-8?B?TmZNQXU0NFFocDQxTkJKbDRvTXZRUWoycFdXNGZPeHRQVnZBUWQ4K2NQdFhF?=
 =?utf-8?B?OGFEbU13S1JwU0F1Zk5Zc2U3VUZFUHFmUHlQRHlrM1ZheHhieG5vb1owOGdn?=
 =?utf-8?B?dzdUR29Fc2pBYmk3Qi80VXBlTnZQRkdFNHRGdWcyTlhhamJPU1pFRlYzelhr?=
 =?utf-8?B?RkpYcXpFdVgyZlF4VEtWbHBDSlRWNHB0dytiZDNtQnVMZDF4S3QwdW9lL2lC?=
 =?utf-8?B?TE5jTnAvVEtyb2pURmQ0Mm45b3MyckVaTVZBMUdXVTdqSUI2aGpRNjNSa3lL?=
 =?utf-8?B?SC8vZ3ovcnV3N01BMWxDMGZLS2FrWXBmWGE1cjJnRG5PVkxEdFBhWlJ0N3RT?=
 =?utf-8?B?cTJmVHNrS0FERU1INGw5Q25WYmc0TmE0SnZYeVBZVzd6WngxQUdweTNsaUZC?=
 =?utf-8?B?MkNkNGF0MVdBMGJydStJenVHem9wMENrYjA2bHlaaFB0V2N6VGM3OTg5TUF0?=
 =?utf-8?B?SWlybHlWNG5SQ1dGSUxScUd1ckszeThBN1lsNkdKMkorN2plWGVnaXR1SEln?=
 =?utf-8?B?a0ZnZ1hnWWVQaWg2VStnRlpoTGY5SmwzbkdBVVJRN1BwUEpwYWxnRXF2T2I3?=
 =?utf-8?B?N3dpQ1ltbEZLVHdKMVNkMng3eTFTdnpTZUtab29FQUFueEdYUTJUSW1ObzdW?=
 =?utf-8?B?K2h2dk9MejNZMWl0MXN2M2RnLy8zVmZKMVd2ZFpkOUdRZkVXMlZDUnhWR1Aw?=
 =?utf-8?B?dnNVRVQwSWJrSjVPZW5tdk9SY2h1bExqMHFxWHh1TlprTCt0bXpaTmVLVm81?=
 =?utf-8?B?bStyNktBaXNqM3U2R2gxYVVvV1N0bGhWYkxWREJFS0NtSU9SUk9MeXlteEww?=
 =?utf-8?B?cnY4b1NZZkRlYU5EeUZiYjQwUnZGQ3hHQ2cycEVXU0NxdklzSXdidHJsVklT?=
 =?utf-8?B?cTZSRnk1SlYzb095NVdpaDdlRUFGZmdEVjVwSWhTZ0hLcGRUZFA1bkhvT3Vn?=
 =?utf-8?B?QnF3SldWeEFReUdIQmtuWStOVWFGclk1UXBtN3V0aGpjL1hFN0NFY0U1UEJx?=
 =?utf-8?B?QnliZXhQSUZuMys4ZUtOSjgwVUlGZ3JLbnUyaVpQcStOYThxakpoQzlRTlRG?=
 =?utf-8?B?dDU4TlFOYXRiV0JyVENNT3ozaGIzTGtIMWdMYW1qbHptYlQ5Wm1wSjJ1djVo?=
 =?utf-8?B?cXNZWFZ6cGJFdnFKdDNILzJVRmt4bGJsV29TNk9yRVZySEltTVA3NEhpbXI0?=
 =?utf-8?B?Z1pIeXUxc2I5N1lob0lQeG5ncTV0RnV0amt1cXhIaVIxRWxEVGZEUVdPNGlL?=
 =?utf-8?B?d3RFT0gyY0dSWVFwOEJocXJyV0lJSGN6K2VhRFJyOFVJaW9FajZ1dEg5Q0V6?=
 =?utf-8?B?Qng4c1U5UHdWVXJKRjZpeVNJNkF0SjJvaVpBU2cyWGN6RGxIdkV4VHJpK2w1?=
 =?utf-8?B?M3ZxY0gzK3pMNi8yTlZ4ajRRL09TMlVvVTlEY1pUQmMvREdKQkhCbXFPNHVQ?=
 =?utf-8?B?SlBLZDRIWjBPTFRyY1BOZC9JR1ZDVTdWNlNQaFlDbmFuMU5qVGJ5Q3paa09r?=
 =?utf-8?B?L2Nua1lIMGlGWHlOWnVEYXJrM1lMYWxwRGFQY21aOWNIald6dDlZU1grVVBU?=
 =?utf-8?B?TnZuNXFvemNXR0M5VTJVcWdMTSt5eDJwYVhwbHZRUnBLZmwvTGlzcDNiYW8w?=
 =?utf-8?B?ZDgxNmlvNnJlaUF2NnFnZG1vekMwVnlORlgxaktYbDdCL0E2bGJ4TGo0Sjls?=
 =?utf-8?B?SnI4R0dCZUlDSWp4NU9DMHlCYi9JLzlwYkhyZTFqZ1dpbG0xWm5TVUlWRXJK?=
 =?utf-8?B?Wmx2amtuY3BMMUd5Zi9qT0kzYlZTZWszNHBJSmx2MDBmU3FhbTNuT1FITFp6?=
 =?utf-8?B?SVZONktYQVhsbXljVU52OTZqNFowQlJZL3ZmZzd6ZGd5bW5rRmd5ckdKa2tp?=
 =?utf-8?B?NlFZVk5CdnM2ZytuRWxtVkJzekRPOHY1MmFRZ3BaQXlRMWMrTVhKa2F4THVB?=
 =?utf-8?B?V2twTzVDYlEyMzlTdk1sYVQwZWxLR056NXJYMkhBdnpscE1QWjIyeFFvUkF2?=
 =?utf-8?B?TXFkM21jT0hidFBrd3QrNlF4ejlGRTF5a295TEkzMGpxN0RoK2QrWTNORVU0?=
 =?utf-8?B?OU9FSmtEUlpsbFAvbVNUVTlXQ1RPM3I5Q0hkUXFyZGp2LzhDUWwrL2dNbnJH?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c39b8d49-ba22-441a-130a-08dd08349042
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 00:53:20.9949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Flcd+WgK8++umlJv3l2cJcUvTlolylJ/ZOCW6sd/5TAu4RoI/SkYcffLkrkzLg1bcjfxBLqPAtDM/vWRlztpNiCUglUzyjCNvOhtt1Q/EI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7136
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

On 11/18/2024 08:34, Daniele Ceraolo Spurio wrote:
> <snip>
>
>>>
>>>> +}
>>>> +
>>>> +static bool xe_guc_g2g_wanted(struct xe_device *xe)
>>>> +{
>>>> +    /* Can't do GuC to GuC communication if there is only one GuC */
>>>> +    if (xe->info.gt_count <= 1)
>>>> +        return false;
>>>> +
>>>> +    /* No current user */
>>>> +    return false;
>>>> +}
>>>> +
>>>> +static int guc_g2g_alloc(struct xe_guc *guc)
>>>> +{
>>>> +    struct xe_gt *gt = guc_to_gt(guc);
>>>> +    struct xe_device *xe = gt_to_xe(gt);
>>>> +    struct xe_tile *tile = gt_to_tile(gt);
>>>> +    struct xe_bo *bo;
>>>> +    u32 g2g_size;
>>>> +
>>>> +    if (guc->g2g.bo)
>>>> +        return 0;
>>>> +
>>>> +    if (gt->info.id != 0) {
>>>> +        struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
>>>> +        struct xe_guc *root_guc = &root_gt->uc.guc;
>>>> +        struct xe_bo *bo;
>>>> +
>>>> +        bo = xe_bo_get(root_guc->g2g.bo);
>>>> +        if (IS_ERR(bo))
>>>> +            return PTR_ERR(bo);
>>>> +
>>>> +        guc->g2g.bo = bo;
>>>> +        guc->g2g.owned = false;
>>>
>>> It doesn't look like you're actually using the "owned" variable 
>>> (which makes sense, because the BO is refcounted so it doesn't 
>>> matter which GuC it was originally allocated for)
>> Yeah, owned is only there for the selftest that comes later. But not 
>> including it now means the g2g structure only has a single entry, so 
>> really should not be a structure. Which suddenly makes the deltas for 
>> adding in owned later significantly larger!
>
> Can you explain why the selftest would need to know that? Can't review 
> it now if we can't see how it is supposed to be used.
Same as for below - so it can free and re-allocate as necessary.

>
>>
>> Having said that, as Matthew pointed out, the code is currently 
>> leaking reference counts as they are not auto-cleaned. So it does 
>> actually need a fini function which will use the owned field to 
>> decide whether to call put or not.
>
> Why? If you do a get() from every GuC then you need to do a put() from 
> every GuC, no need to check.
The root GT doesn't do a get. It has a reference automatically from 
having created the object. Same as all the other GuC related objects 
that get created but never have a get/put called on them.

John.

>
> Daniele
>
>>
>> John.
>>
>>
>>>
>>> Daniele
>>>
>>>> +        return 0;
>>>> +    }
>>>> +
>>>> +    g2g_size = guc_g2g_size(guc);
>>>> +    bo = xe_managed_bo_create_pin_map(xe, tile, g2g_size,
>>>> +                      XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>>>> +                      XE_BO_FLAG_GGTT |
>>>> +                      XE_BO_FLAG_GGTT_ALL |
>>>> +                      XE_BO_FLAG_GGTT_INVALIDATE);
>>>> +    if (IS_ERR(bo))
>>>> +        return PTR_ERR(bo);
>>>> +
>>>> +    xe_map_memset(xe, &bo->vmap, 0, 0, g2g_size);
>>>> +    guc->g2g.bo = bo;
>>>> +    guc->g2g.owned = true;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int guc_g2g_start(struct xe_guc *guc)
>>>> +{
>>>> +    struct xe_gt *far_gt, *gt = guc_to_gt(guc);
>>>> +    struct xe_device *xe = gt_to_xe(gt);
>>>> +    unsigned int i, j;
>>>> +    int t, err;
>>>> +    bool have_dev;
>>>> +
>>>> +    if (!guc->g2g.bo) {
>>>> +        int ret;
>>>> +
>>>> +        ret = guc_g2g_alloc(guc);
>>>> +        if (ret)
>>>> +            return ret;
>>>> +    }
>>>> +
>>>> +    /* GuC interface will need extending if more GT device types 
>>>> are ever created. */
>>>> +    xe_gt_assert(gt, (gt->info.type == XE_GT_TYPE_MAIN) || 
>>>> (gt->info.type == XE_GT_TYPE_MEDIA));
>>>> +
>>>> +    /* Channel numbering depends on whether there are multiple GTs 
>>>> per tile */
>>>> +    have_dev = xe->info.gt_count > xe->info.tile_count;
>>>> +
>>>> +    for_each_gt(far_gt, xe, i) {
>>>> +        u32 far_tile, far_dev;
>>>> +
>>>> +        if (far_gt->info.id == gt->info.id)
>>>> +            continue;
>>>> +
>>>> +        far_tile = gt_to_tile(far_gt)->id;
>>>> +        far_dev = G2G_DEV(far_gt);
>>>> +
>>>> +        for (t = 0; t < XE_G2G_TYPE_LIMIT; t++) {
>>>> +            err = guc_g2g_register(guc, far_gt, t, have_dev);
>>>> +            if (err) {
>>>> +                while (--t >= 0)
>>>> +                    guc_g2g_deregister(guc, far_tile, far_dev, t);
>>>> +                goto err_deregister;
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +
>>>> +err_deregister:
>>>> +    for_each_gt(far_gt, xe, j) {
>>>> +        u32 tile, dev;
>>>> +
>>>> +        if (far_gt->info.id == gt->info.id)
>>>> +            continue;
>>>> +
>>>> +        if (j >= i)
>>>> +            break;
>>>> +
>>>> +        tile = gt_to_tile(far_gt)->id;
>>>> +        dev = G2G_DEV(far_gt);
>>>> +
>>>> +        for (t = 0; t < XE_G2G_TYPE_LIMIT; t++)
>>>> +            guc_g2g_deregister(guc, tile, dev, t);
>>>> +    }
>>>> +
>>>> +    return err;
>>>> +}
>>>> +
>>>>   static void guc_fini_hw(void *arg)
>>>>   {
>>>>       struct xe_guc *guc = arg;
>>>> @@ -423,7 +688,16 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>>>     int xe_guc_post_load_init(struct xe_guc *guc)
>>>>   {
>>>> +    int ret;
>>>> +
>>>>       xe_guc_ads_populate_post_load(&guc->ads);
>>>> +
>>>> +    if (xe_guc_g2g_wanted(guc_to_xe(guc))) {
>>>> +        ret = guc_g2g_start(guc);
>>>> +        if (ret)
>>>> +            return ret;
>>>> +    }
>>>> +
>>>>       guc->submission_state.enabled = true;
>>>>         return 0;
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h 
>>>> b/drivers/gpu/drm/xe/xe_guc_types.h
>>>> index fa75f57bf5da..83a41ebcdc91 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
>>>> @@ -64,6 +64,15 @@ struct xe_guc {
>>>>       struct xe_guc_pc pc;
>>>>       /** @dbm: GuC Doorbell Manager */
>>>>       struct xe_guc_db_mgr dbm;
>>>> +
>>>> +    /** @g2g: GuC to GuC communication state */
>>>> +    struct {
>>>> +        /** @g2g.bo: Storage for GuC to GuC communication channels */
>>>> +        struct xe_bo *bo;
>>>> +        /** @g2g.owned: Is the BO owned by this GT or just mapped 
>>>> in */
>>>> +        bool owned;
>>>> +    } g2g;
>>>> +
>>>>       /** @submission_state: GuC submission state */
>>>>       struct {
>>>>           /** @submission_state.idm: GuC context ID Manager */
>>>> @@ -79,6 +88,7 @@ struct xe_guc {
>>>>           /** @submission_state.fini_wq: submit fini wait queue */
>>>>           wait_queue_head_t fini_wq;
>>>>       } submission_state;
>>>> +
>>>>       /** @hwconfig: Hardware config state */
>>>>       struct {
>>>>           /** @hwconfig.bo: buffer object of the hardware config */
>>>
>>
>

