Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09134C83F1A
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 09:05:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E4489B33;
	Mon, 14 Jul 2025 09:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lUiRkeEq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3D010E432
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 09:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752483900; x=1784019900;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0VU7GY5raX273sfKVv8TZFpwqbY0f91YgVCBEBauyno=;
 b=lUiRkeEq2M1dyaZDNLWp4y+o3pqT2vxa10z2XkQ0yVAR4TIb2xdvf2vm
 sSZcSn8FOYPfdNykBFsw4QZ528FpkEAQBUfdehDZCzr3+c6lcgGXGo9Ki
 kTt69An3EI++jz+wVWw3rhALgQu1a6GVVtdwdEznZFV4vZYEbHmacv2JZ
 UsroF5GiV0LKXGNpfRaELctdBB7Ab0k3a/Ny51CrltVMX2Tj+3+SuLsaq
 EUZ1cbJy/b932/fIY1WRfPJ/1RIJwZbE/Cv5F6sN5YEhQQoOSDkZHu4dl
 QOvvDIU1b0ZL6/gf24dyUN21Zz5TS4ofHy1vQMYzusOlfikl7E5ad9jNG w==;
X-CSE-ConnectionGUID: H1dP7kOYSiWVd4Zd8k5G8Q==
X-CSE-MsgGUID: K3lytYAyQxqJAEFcJ6aEtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54796790"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="54796790"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 02:04:44 -0700
X-CSE-ConnectionGUID: p+ZDURE0SNufYRvhA62b3A==
X-CSE-MsgGUID: xmuVYCxgQMaLDndn7PmNOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="160903696"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 02:04:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 02:04:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 02:04:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.71) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 02:04:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kUfN6bBsZ74FkVmKWHIS29d3CnGdBTem4nIIZBGwLIjHpZjbVqoV0rg0lz5SJEt8Q4AXDhFHhP2SbSg4QR6iqUf5Yc8DuWb26/Mnm1ScqE4KcbJ9y2W+Tn6LJgLcT4uc56mjBczLabFq13Icrdpt+YSVp/riq+bkpVRDJB6hsDtt/h8U50K9CHjJ/6BZh+Z8F+eDVf/6FzNOJMxxkEoBl+6VS4nIlg+PENtO7SznT/GLLU9o1yqfHqKqPiPuYb0z3NwjiXHfsGSubl4Z8EjcZ6KR5SnYP95gfMSC8gNmGPvEYX2EYCVDaN/3lsgytXxs1HMhoO4hgjtPn83M4RD5gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QtBXQZfs06GJdaR3EnwGrX9GWsbGk8+jvc5Gge18d2E=;
 b=mv+S4wiom8h0bfFcpdP692G7VUf+B5QT+MLwegbgFhrwU5tADhvafoxrAUG+PtuAl5tEycFk1fYf29M5vETXnSz79FAIsiokp0d5xOlD0UyBf07DbNAZGVzYzuEYbBc92Rii8x7hgLf+z3sIv9dLthQ4GQouBg1dGwH56hVC6BOLzTf3O14Uf+YOFKzv8OFXayY5TKkWByCzzaE3cPtrSLxzRWYJjM7/zjEUZjTCLnSF0+VExn7w1zg7T4hEqQork7W/qXJS9Xk1djabbxQhujxriXIawQ4kHir2OSOZHtYHHR37wpwOS2QUfFPBdJRzuodRcBBtfdr3yX5OxGGvmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM3PR11MB8682.namprd11.prod.outlook.com (2603:10b6:8:1ae::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.35; Mon, 14 Jul 2025 09:04:39 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8901.033; Mon, 14 Jul 2025
 09:04:39 +0000
Message-ID: <9d4f6ffc-75d1-4723-90a2-96ab19445ddd@intel.com>
Date: Mon, 14 Jul 2025 14:34:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] drm/xe/doc: Document device wedged and runtime
 survivability
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <frank.scarbrough@intel.com>, <sk.anirban@intel.com>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-7-riana.tauro@intel.com>
 <aHCjdQ_jcC8MvhvM@black.fi.intel.com>
 <0db2f198-433a-477d-bea8-81a1abba2b27@intel.com>
 <aHH2XGuOvz8bSlax@black.fi.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aHH2XGuOvz8bSlax@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0067.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM3PR11MB8682:EE_
X-MS-Office365-Filtering-Correlation-Id: a08709c7-4636-485d-957e-08ddc2b5766d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmhuYnkrZDFHMFBWVUgyNlphWlEwODZYdUkxQ2FuVmZNZ3NiTy9XODV4VHVl?=
 =?utf-8?B?ZVl4YTkxK3ZSM0c2V1ovTDU0MzVKeTBYL2dWSk94aVBVNDFVQjJoblFKV3pU?=
 =?utf-8?B?TTJwbU43cDJHODRYbFcxdzdZQk1lK2xSNTNMUmJ4bkpIVDF3RWJwSjNtNUtj?=
 =?utf-8?B?Uzg1YWtsdC9OQ2NyKytpQmFmQ2Y1VnBuYUJlNUg3Zjg5c2xqSWhZaFpyTzh6?=
 =?utf-8?B?MG54aGwySVl2ZzR1NFhpaXZUUzhhQ2pMTEZzVEJyTEZHcnZKZVQ1bitvbi80?=
 =?utf-8?B?d0hsaFB6bTA0SkZKOUdISHNoMUZLeHAvMlpEejRlN0hQSjQvZGFzaEgvUjJZ?=
 =?utf-8?B?MmdXS1lndzl2NGlPZEwrSUl4MzNMejh1U3lpOC8zUjdGcXBxcTF1dHo5L1RU?=
 =?utf-8?B?SWk5ZFhqeGpPVEJ5OWQ5alh3K29Sb3pJQzJjaSt5WnBpSi9ZNnZpRGJaZGFl?=
 =?utf-8?B?RGVGQjdOMDNqZzhsRmFLbDhjV1BkREt6Nk4wMW9MWno4OTVkdmRhNG9nNUJh?=
 =?utf-8?B?S2QwZUFuZEFhOFppRVJZUm5SeGxxbWRDN09NYTZQckIwcnRhUWlNZk8wazBk?=
 =?utf-8?B?M2JVc3lsNnF4RnpMQm1kRkkxd0hSelM0Tmd0WjFWUGl6elljRFpFZ1RFU25P?=
 =?utf-8?B?YlRKQVZyVE9WZWluVkdSakN2TUtqdy92VDNxQ1lqUmdBTHpXVStXSmxVWXFO?=
 =?utf-8?B?RTlBRHN6bXh4dHdLa1AvTXFvL0NEbVZNYUNhU2ViOFZYR2kxWnJ6eDJRTElH?=
 =?utf-8?B?REpLV3VUdUhGR0NacHZndlpqSU9EQmdHYTJTSkI1RlFiOWdRTnFDYXRsRmk2?=
 =?utf-8?B?ZWNaTFFlTVloa3dnY1lPL2xla0VpMGFXU0ZBeUVoTU9iV3gxQ2VhQzJ4c0FC?=
 =?utf-8?B?U3pDalFscXh4azBvYmlmdWJ6THBWQVJ3R1N6bldacExWRis1bEhpL3JXYm9v?=
 =?utf-8?B?OUtJbEtWaXFvN3BnN05OK0Vxd1lwa1hNKzVLbXNpVTZiSVZmU093TUdiUGYz?=
 =?utf-8?B?cXN2aVU1NUNrd1lleHZNOVF4QzBCMDM1WTJPZVVVVnhiT21PZTZKNFE4L2tJ?=
 =?utf-8?B?RGdjb28wY3JYQkpWa09CNTNVbXNtZnRjeW9kZ1E3ZVh5dkZBYXNIQU5SaHpG?=
 =?utf-8?B?MS9HMGZBTUtWb0tBTlFBQUM2U1p3OStDREJReXdlMWZEQ3V2MW9WYURqMXlR?=
 =?utf-8?B?eWdwVWlLREhodzZuZXd5QjhSMk1xdFFMaDFzVCtzWGt5YjB0Qk9LVENmdmZw?=
 =?utf-8?B?RHgxQ1o2MnhySnJMYkVoa0RYNjBFSkhhU0o4SHVFU21PaUlXcHJpTW43V2pU?=
 =?utf-8?B?cGlVQmVocU44QVp1ZE02UWZWazRveGMyZW8rVjJkWXZjRUovSXJLVldJSFBE?=
 =?utf-8?B?cHF4R1ptTnd6ZWNuRyt5SUYxRzlGb3RudjRPaE1nTTJhZzBFT0lMeVpraTNP?=
 =?utf-8?B?WFJYN2tIMmVJUit0V3RBYkZkL3BMWTYzNEl1RmZvYXRzZjFlajZvNUM2aGlq?=
 =?utf-8?B?NW8xbGUyTlpaaDhxdys5YkU3RTd2eXptVXJjMlpqdVF3RUNwZEVQM0tvTjEr?=
 =?utf-8?B?SHcwSUZKWmZXU2VUY1l5azZ4enk4U2taWDM2QWEzNy85OG9WOE5RSk9hbStN?=
 =?utf-8?B?SWRpTVNCUW4vY2xiRC9seTFHc1NyNFlFL2RhSCsxRSt5VWVJcEhGdTFnZGlT?=
 =?utf-8?B?WmdKeVFtNUdVVk1nSHV6YUlwamRpQ3kyS0dEUzdqLzZIWisvcE9wSS9oZ0g1?=
 =?utf-8?B?QzBRTzIwSWxOQ1V1d1N5V2lMZWxCc2Y0d3E3YXQzZkNVU09IY1ZMRzdjbHlN?=
 =?utf-8?B?ckYzSHJlRE5wS3FSN3p2MFhmSFEvQVY5c3hLdTZKbXdDc0xzOFRlL2hhMjhK?=
 =?utf-8?B?VW91TGpocHorR09zMGYxeit2WlA2ZjA1aE5ITHUxV243dGUxL21QbHdtZGRq?=
 =?utf-8?Q?CJvmxufC8Uo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFNZcGFvTTYvM2ZoeXdXdTBGa1RHNFk5aTVuWmUrVGtFNTdtZEdkQ1FVU2V5?=
 =?utf-8?B?eUNwWWhzTTJtMUh3U2NpK1lhYlZOL0tYTGcwQlZMaUlaenR3TU9MdzVNZUly?=
 =?utf-8?B?NFNINVFHcnp2WCtjaWZlVXkrQlVOSUJOYzJ4UGF6T1A1KzBteXhpdURKUWRQ?=
 =?utf-8?B?bUwyY3ZKTUZwOHd1N0o2VkxCZkMvUlBsc1VvQWRGY0Ztd3RDeVZzOVptbVNz?=
 =?utf-8?B?Z1BWd0VhM2UyMUhiKzdJa2lPVHdudzY3eWxKYjhZek56MlZpd1FNUHhuaFIx?=
 =?utf-8?B?ZVFTclhRNmJYdllzb3I3Znp3OXdOL1pwUDBmVWZvNlBJUDY1QmxERlpyNEtL?=
 =?utf-8?B?RHBXamcwZGlmbEc4aDViVEFHZmN0a3haOHhzY1pURUhieWNuTzJGOWlBL0Ru?=
 =?utf-8?B?eC9oaDNWMW82YlgwRXRmNkViVnl5Z21nY3NxYW0veXFmemxyVkt5bWhuTW8y?=
 =?utf-8?B?YkJsaEIvU3ZTaDFVR2RtdmNjMUJwRnNIY3JsL2w4SC9aWHgzUHNwTTNuUWNm?=
 =?utf-8?B?dGRJNDd5elJSdTlxOHhidk5PUkk4NjZ6UW5QTk96Z2MyMld3MnQvSm1XeWNp?=
 =?utf-8?B?dktIZ2JXQW51WkVTTkpwMitaZVd6Z2dVU3J6Y2phSHZyeHhDZDk1ak0yRDFk?=
 =?utf-8?B?clhZczF0elFYQW5lZ1hORmxwMXNKZ3lOMGlpQkxCVlZMd3lTV3RpREsxSWVo?=
 =?utf-8?B?OGQvc3lUNUhrVFExOGpwVmNMSklTcTRtR3MvMzJPeW5LUkFnekdBbUkrZnVE?=
 =?utf-8?B?ZjMvUmNPWWpJS2plSVNhNFJIMXE1eU9hZ0FaWnVwL2lMZkQxaFQyMFFNRFNi?=
 =?utf-8?B?NERZc2t6NWM5UE5kb3lMaFB2UFdBMmE0dFhQNjJqTEtQc0FMYnRaOHc5bCsv?=
 =?utf-8?B?Z0huS1I2MWN6QUFLL2hUQmdOcW9ueXZJNndyMjYyS3pCUG9wRnI1SC8vZGJ1?=
 =?utf-8?B?c0lxV3lSWDZra250NWtaTWtXK0VVZWwraFh5c1orRCs4TE16NlJ1eTVMQk52?=
 =?utf-8?B?OFVTZnVaODNGWFJ4YnlJYkR4bEVOSExWc0ZOMUtBL3JFaGVRcWVVU0srWUxu?=
 =?utf-8?B?ejNmTHlUT2txbFNtZGtzYzliOVRaRnpMamltLzZwdEdqNnB5OTFxOHFDckNH?=
 =?utf-8?B?eGJVTHhIV3RwbWVDc2U5ZDJ1TTlmTlJoMEhwanJqRUpwM3lEQ2NvMGVQeWgz?=
 =?utf-8?B?OG9pdDYvczJYL3Q5bVV4UnZDRjZmb083dEFyWkVSQi8xZG96dzZQRzhDdkhj?=
 =?utf-8?B?SDBnTDF5WFpqenUvZ2RldUF3VFNvNWwvQ1pUNFFLM2tINUVSa2Q2WFBsUVow?=
 =?utf-8?B?UWlTc1dGbXJJSlgreG1TN2tnMmRpQWlvRHZHZVNXTW1qYWxWQkp5ZHJ5Z051?=
 =?utf-8?B?YXM5OGdBNW1qbVhRaGsxbElZb1pLR0F4OE5uZnBkZ2xRTTVpMkVGWU5mTU1B?=
 =?utf-8?B?czJGUkN6MGlNUWRqRXRPcWRpemMya1k0cnViaXJBZEpCSlBSaHdKMlVuTFlm?=
 =?utf-8?B?bTJpUjRDK1ZLT1BuRmZlMUFnSW5JQjRBdHZPMENTd1FOdjZUTFpBTmNKbTZT?=
 =?utf-8?B?a0toM3ExWi80c1duSmIzVXhpeHU5SHNocXczd3NrdmVBQ0FYN0txWkhTaE1S?=
 =?utf-8?B?bVY0ZG81ZEJ5dDBnUnZ0VVNrNE8vU3NPZEpSZHBtUkJDeHJkMk5WRnlJVlNJ?=
 =?utf-8?B?U3N0M3ZZcGFuT0hzOVpWZ0U3YjdjdnJaM2czdzJYZndNVWR0WmtOVFhzUlcr?=
 =?utf-8?B?ekF5b2NNWFVXVzNDRXo3WWJnaGpZck9GRE9SZzBoOVg1S01Ocjc4bHg3N0Z5?=
 =?utf-8?B?V0twQ2tCNmNkNjlaSGtkWVp6eEZXTXU0ZzBCS3ZWQlJiTTROSjdpUmtFR2J4?=
 =?utf-8?B?WXdZU2JIK09zSzhZSGl1c1lyelZCcXg0OEkrVzU0Mnl5ZFJvUDRHTjJveXBh?=
 =?utf-8?B?Vmx5RTNGZ09maFluK0xqRzdWaEdBZ0FKVDFyWEVzdEFiWUVCUElJd1VwSEFs?=
 =?utf-8?B?dENWampaU1UwWEdqSG1Wd3Y3bDRaTkRxSm9haUVYQk1vc2xZckNYOCtzN2Ns?=
 =?utf-8?B?aHlRQzhnNUczbHplK3JHdytQU05oZlhiMW1ieEVwQVAzcktlMmU3M3pnanZQ?=
 =?utf-8?Q?hau/Z6pN9IRS6HHXnsK74bTbE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a08709c7-4636-485d-957e-08ddc2b5766d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 09:04:39.3421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJssMd9BX0jRWGBib6PJ9tpWakt+2sgF7lYRlhqRb6LsDiqdNKHNfJ8qCiBE6kGkx4uj0dffoF9wO2sSP6gylA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8682
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



On 7/12/2025 11:15 AM, Raag Jadav wrote:
> On Fri, Jul 11, 2025 at 11:39:22AM +0530, Riana Tauro wrote:
>> On 7/11/2025 11:09 AM, Raag Jadav wrote:
>>> On Wed, Jul 09, 2025 at 04:50:18PM +0530, Riana Tauro wrote:
>>>> Add documentation for vendor specific device wedged recovery method
>>>> and runtime survivability.
>>>
>>> ...
>>>
>>>> + * Runtime Survivability
>>>> + * =====================
>>>> + *
>>>> + * Certain runtime firmware errors can cause the device to enter a wedged state
>>>> + * (:ref:`xe-device-wedging`) requiring a firmware flash to restore normal operation.
>>>> + * Runtime Survivability Mode indicates that a firmware flash is necessary to recover the device and
>>>> + * is indicated by the presence of survivability mode sysfs::
>>>> + *
>>>> + *	/sys/bus/pci/devices/<device>/survivability_mode
>>>> + *
>>>> + * Survivability mode sysfs provides information about the type of survivability mode.
>>>> + *
>>>> + * When such errors occur, userspace is notified with the drm device wedged uevent and runtime
>>>> + * survivability mode. User can then initiate a firmware flash to restore device to normal
>>>> + * operation.
>>>
>>> Do we have definition on actual procedure? Can we add a reference to it?
>>> Otherwise it's telling me to do something I have no idea about.
>>
>> That is a userspace tool. I don't see any kernel code refering to userspace
>> documentation.
> 
> How are we expecting users to be know about it?

There is no documentation in kernel for fwupd or xpu-manager userspace 
tools.  The documentation should be provided by userspace tools about 
the required procedure.

I'll mention 'firmware update tools like fwupd' so that user can then 
refer to the respective documentation

Thanks
Riana

> 
> Raag

