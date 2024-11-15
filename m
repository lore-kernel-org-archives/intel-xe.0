Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16F9D68BCD
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 19:34:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE56B10E3FE;
	Fri, 15 Nov 2024 19:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VXg+XaNA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6925B10E3FE
 for <Intel-Xe@lists.freedesktop.org>; Fri, 15 Nov 2024 19:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731699296; x=1763235296;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KkdyM8uGR58NpIaiqmfXuPmbVL/XgfHYQMcWzPNmjbE=;
 b=VXg+XaNAs+iTr0J7ZPtwjrubVfWfiMGNtY9xyJO6DdAE1O398p5YkviG
 gfmfznJOZdmfH1MbfvoaYT61aCiRUeBsb8kccPJ4XT7aAJJqq28tterWM
 dr18V3gtR4Q/zYawNlT4/HvuhHyXV97zZWUzuaRTvbZosiucIUMktLa7/
 g41US52vYR/H/DWVLgrhmrYxnxVtnsWiOedyOTsMM+WDJ1JTAvdUoO0B2
 oWfJz6Dl2mPv7y8TBePk0NevyMnqTaZ8PfQgqfwNsU9RkqpIobn+S5Ls4
 xGeDP/2TqbO+08DRmiWq4OcxW154mokoQxOf1Ay+8r2J1f+4WPaYjqrQ2 Q==;
X-CSE-ConnectionGUID: 38+HogxiRPOs2ZUxSZuK4w==
X-CSE-MsgGUID: 1HhyEXwvT26bqKM0sknBlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="35647970"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="35647970"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 11:34:46 -0800
X-CSE-ConnectionGUID: SlqvycFFQPOL9lx+3PMcRw==
X-CSE-MsgGUID: ljHuL/f2Rk6bDnNnZvEEdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="119491050"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 11:34:46 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 11:34:45 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 11:34:45 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 11:34:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mF8rZZiONIMhE44W4SsuYT06nc1TNQEPi05z84g54+jSoLRERnFtqTFtYiml+wWNSssBSR5oGpUNqhYoQlK0XmCfC/guo1HH1VDHmGLrmVi/E+U2tyHKjk/fhSjbLBICBf8lhf7ZeF6bTbPkqS2u01qycpRR3tUGA9dNOcGA6OMPAovwiyA9AiDbDAZgkCxfUUDNO5XAMQfwrc8L9o1E0vWychqPIGiS+kjfbd+sknkNSKpo5DY4wRN0MIKf9/l7+pgMqd44b4fsUFJJNq5clVngOa2LQBS3b/KZ7O+3FPFFWhnXpqi+ULJJW70MYml5rx2vXSfqiyQKABxBmFbRSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JU/rZA14PcO3YWQEOUf0MUpv5bxhOE/EZe7/JGYEfE0=;
 b=oyS2i+dHTV+OhJnsXZtSO+HZbYZOsF8CtoxECBi/twhToG8EOpPe5lzIxqGSWSnmjCb8SYCjUg+e7eDXVAbI80AldPBWscRxVYl8Z3U1oh9EN2p8qe00hoGRWTpd02qHNMh2buCyFluL7WZ6sZUibYWL2Rmhaxlgwom/JLXrsj3yYHRZMESayHP4l75OKPcjlc3QWSrkORBUgGjRj5KV6BnKnsYHKUJIyRihh42NJrYAFV0iicdb9IspYm6D0+K4/yFNbQAUtGroAFN5AJYwYTR9wu8WdfW/BdTUyjcUzy8P569ffSXpjgvsDbwADPY8hqVrauIGqbdz7SVU/keWrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SA1PR11MB8838.namprd11.prod.outlook.com (2603:10b6:806:46b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 19:34:42 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 19:34:42 +0000
Message-ID: <b2707450-2273-4933-bd2a-bc175c3905ac@intel.com>
Date: Fri, 15 Nov 2024 11:34:40 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Add support for G2G communications
To: Matthew Brost <matthew.brost@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20241108202216.2020164-1-John.C.Harrison@Intel.com>
 <20241108202216.2020164-3-John.C.Harrison@Intel.com>
 <ZzeczRm2B3ekqb4Y@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZzeczRm2B3ekqb4Y@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0294.namprd03.prod.outlook.com
 (2603:10b6:303:b5::29) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SA1PR11MB8838:EE_
X-MS-Office365-Filtering-Correlation-Id: 45fab98c-8b1a-4346-a2d6-08dd05ac8d57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkN1WkgrVmc3V1BhUFJ6SkpQMlZJL3l0ZWNtSVA4OTF2Mm41UUtVL3dZUU1X?=
 =?utf-8?B?T21yRlVTTTlQWVg5V09VVmppUC92akw3eitMNUcvWVZTRG9DNDhUUUQ0UnNK?=
 =?utf-8?B?SFJLK2F3TisvaUVZNm1zOFE0UHpRZUxrT0ljcWFYL0dKeXdBQmE2cDFYaWt0?=
 =?utf-8?B?b2dGMERwMmxzM29QbTViZk9BRlp4bkZIZCthbjQ2YUtHUDVXMGJKNWNxNlR2?=
 =?utf-8?B?WFRrWnZ4UFdWU1pwWkovcGM2WHlKUzM5QVhMQkgrV3RIZFBWT1d0aENQT2FF?=
 =?utf-8?B?VEoxeVpCSzBIMVdZaWFDMUhFbVpLTG1VV2JEUVZPVm9abUllM1FVMGtkd3Nj?=
 =?utf-8?B?djEwUklIK05IWlRpZlVLZ2tYR2F5M2FUQVhUU2ZpOXdiMHZjVzhDUExIdU9V?=
 =?utf-8?B?dGM3aXhkQmtFOXNtakwzb2ZJRFRrTWJ0a29xN1pSU2hCUXpWMW16SUZlcGNq?=
 =?utf-8?B?QkdtTDJld3RzbFprM0x0NVNDeWExUDJGZXpZWm5vV3V1cWJMV2FjVExpZTFr?=
 =?utf-8?B?MTc0eXZuU0t3UGRDaXZGSTJyQTBpQThhTmNSTFZITjMxeFZuanZmbENZTGtF?=
 =?utf-8?B?aHZMTlhRT2lyVjZUZUswWGV4SitIU1duVXYveUpPT25YMTdpSHBZczRTT3Zw?=
 =?utf-8?B?cGdYQnVtY09aWU93T1oxV0ZwN3V6YnRuaVppWHhvRFdoMkZjUG16NjlmSlBJ?=
 =?utf-8?B?WUdQZjlUT2pFNHpBbjRCUlB1WUZRY29Ia3JVdmQzaWhuUWE1N2c3d0x4WTRD?=
 =?utf-8?B?MmRwVGs1Yms5UDZ5bzZzNVZxNWdwS0cyMHplY1pJT2dWOXR4Ni9xb3NaTGRK?=
 =?utf-8?B?VEpUTU02UzFQT0tqeUExM1FGbm94RkFyUUVKUUdQNHRBN3lqdlkrRTg3c21h?=
 =?utf-8?B?czhXN2R4TUxxcWhuQ08zTlBzWjVSazhJV29vMHdUblI2dnhxMEhWcjQrS1ZP?=
 =?utf-8?B?VDNzMVI2bXJpcTRCOWNXRmhjWlorZHd3eDBLZ0NoRUpXSmkzU0lPQ1RIZUQ4?=
 =?utf-8?B?Rk9ndVV1Z2w3WS95WkFVSmVMVjlXUXRwSGRYVFZTSDdJODFEOTVYbytHYWNW?=
 =?utf-8?B?ZlVleDVSZ2xnbFdFS1A4dVVLMEl2TmxaV3FJdmVjU2tMV2t2dGpLc1Z3ZStN?=
 =?utf-8?B?OFN1TlVqdUhHejhsblJZdnhvbk9LL1ZSMks0TStOLzZtSW9CcUhxSmFhbXVI?=
 =?utf-8?B?dmJYUXR3UE1Ka2pXODhFMG5qV3FiZ1FMT1FkYzBZaFY1T0NLalY2MDdEV29h?=
 =?utf-8?B?ZEhMTnJxUEsrRk42M3FXdXpmZDNicWFKN2FGVVNhWDFGVmY5MEkrZThiNURG?=
 =?utf-8?B?bE4xcGlvTEJCV1doSmkra0RLVUowNTlPbitpU2hwblhKYWtucWhnZmt0TS9t?=
 =?utf-8?B?QXJpWER4TFNBdXlrZjAzNHpuZVg2SWRKenZhZjRFdkhXKzNKMEZMVjBzeXZG?=
 =?utf-8?B?ZGxZSmJGSHNzN1BxYlBYdEl0TWFjTzFKZDNQckdlWS9BRjVxQzNaYXVrY0tM?=
 =?utf-8?B?N3RPMFAxWWxUcUk1VXBlZTB5c1NjWUVFZVVHak1DRnpCdm9QVy9PMXNlK3RO?=
 =?utf-8?B?TWpFdnprQnhORDBiOWk2cFhOMHQzTEZMdlg0VnZiMXNDRFBTMW9ybms2Rk1h?=
 =?utf-8?B?Vlh6THByaHFEallWQnZpV3lwYlcyREVoV0ZUb1RUVHJRVC9TVDQ4UGNrMXBH?=
 =?utf-8?B?U0FHdjZjcktjVWVsOGI3QlNqYmJVejl1aXVBVFNZcTM2MVM2bGRmY1Nrbnl2?=
 =?utf-8?Q?Yb5zswJh05M8MWSVnmc/Gnm4eQWwNPRikMP7IIn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUVPOXNkUUpmd0QyY0Q2cTkwYTdjN1dYR042TGVndUdSM0JSam4ycmNkWmJI?=
 =?utf-8?B?L0FCUW16MlE0RnAvR3p3RmpaY3BmQ29id0ZmVGtSeXVrd25XOHBwSzF0TkM1?=
 =?utf-8?B?eVo4VVlIYysrS012OUJNV1BydWRiQlpTek51eUxueDE4WDZZWjVjdGMrYnRH?=
 =?utf-8?B?bnR0alBCTnFIT0dNMDQ4VUhiSkE5TTNtSTNBNVhkcmdJT2dLUkE3SG9mTzFt?=
 =?utf-8?B?RE5kRFhaNTc4OW56SnJBNEQ2NU4xRWFSSS9iZnRHYnUzY1lyK080R1FZbDdV?=
 =?utf-8?B?N3ZzTnM3UmVxeUJMc203RTZoQkpRelkzc0JQQ1ptVzJGK1dzUkZ1T0dCaUVH?=
 =?utf-8?B?d3JOYmcvOXBuQm5WenA0enYwcldjbCtuSi95YnFRUzdHb21aMzlzUlh3QThB?=
 =?utf-8?B?dnpoVkE4cDVRcEFYVm40TkdMSnN4RmVtM1M5UENMT1I3aHNTRE1wdDk5SEsr?=
 =?utf-8?B?YlNjZSt1N2FXNFZVYk45L0J0c3BaNzVrRjBINTlyRnVzR0ZsYWY0VEhDR2N2?=
 =?utf-8?B?djd0VVlkVW1uWHhkaGJUbUZRaTVKTC9Ed0ZvUnVzL21IY1ltUmtmb1hyU25y?=
 =?utf-8?B?SXV6Y2xyZjNsbFozZG10UEN6cXA5a0ZTekJaQU52UHZ3MDI2bUlsS1F1Zll1?=
 =?utf-8?B?N0hMMzl6cGplSEY0VXhPM2h4emIxb2hCUFkrdWFNRmlUN2lqNWhDQ2RpTURy?=
 =?utf-8?B?bmhGNFhnZWMzdkpXUzlidnVZTXZmVVZDWFMvbDhXOEhOcWM4L1VsZi9XcTM4?=
 =?utf-8?B?cU43ZzUwOXAyUmJPVS9jMFBKU3IweG1WN29UaXJnYmVwM2pWSHNkZFpGbTkz?=
 =?utf-8?B?aDQ2TWJGR0c5L2pMd1VwamtZRTFubzlVdmM2NUlTbnI2Y0EzZDNiWnZSOUln?=
 =?utf-8?B?d3h3MExxanZ3aXNDZTlpRU1GUlhpMDVXOEFhMEQ2ZnNnZzlsZHdxYlhnOHNB?=
 =?utf-8?B?TnFWUWw0bUR5M3hlMHI2TmxHWVRYOWEvelFhKzRJd1pRRjZWbU5DM1grdFYw?=
 =?utf-8?B?bmJGaENpaDRqeGdoZGJjN09mWE1vMlRhamZMYVVsWUJkbStidkxSVlhINXFl?=
 =?utf-8?B?OFBMZGRmejIzdjRiUHRpeWZTaVVaTGVqYXN0emhuOGUrdEtMNVdsYnlyTTJi?=
 =?utf-8?B?K2l2Q2NmV0Q0TlBvM2VLUUc5cFlRY1NuMjhTbDRaK2FIbGNwclI4RW5PdFFI?=
 =?utf-8?B?cHd3RlQxSVU1T3BIQnlZQnRESnUwaFkrTEV0TWJoc0cxWGdYRGVjUHhhNGNh?=
 =?utf-8?B?TmRPWFp1OWRveFlWbXBBdi96TU9BcmtZMlN5NFBZK294V2hZWXF3a1BEUVQ2?=
 =?utf-8?B?Y0RqenFyL0JRczIvOHp3aU1BaE5jeGptN21oejRUUklFbDFPeDNrb0xBcFJN?=
 =?utf-8?B?emRyV2QvSXp6Y3V2bDlNQm42OEZ0S2VkTjFaK010QkczbHdkdGxDYks4UzIw?=
 =?utf-8?B?ajdDbE1IdG45WmRNd1k4cHU5aHI1OU1rVVEwQTlRRWtpVG5tNDQvc2FiZTY1?=
 =?utf-8?B?YXVRYmdoeXc5dC83cDY1b3JkUzZVak1UMXlLR1JGOWpPc0V2cEpEZVVCelQ2?=
 =?utf-8?B?QWVreXNiWjM5U3dkZlNvcEhLMzVBdjVLOUxRbHB1TGlGekJvTFdTWUVLK0xs?=
 =?utf-8?B?MHBPaGpITXJkNDVUTVlJdW5HWVlEYmNqQjZOOHZQemNsOVhSc2RnZmwxMnFC?=
 =?utf-8?B?eWZ5NU1SdzRDMVVkWFNkd0ZEaERkMTArQllvSjRNU3Q1R3M0bzZnSmhMVDg0?=
 =?utf-8?B?T2xjWjRjWFV6RnR4SzN2YXE3REhzRFVPbG1HakJqbDd5dDJkVlJOVDRxVi8r?=
 =?utf-8?B?TEtqbW9Fb0JRMXR3K1U2VHBmSzEyWm01Yjdia1ZGbTFYZER4cDg3RWhiUmwx?=
 =?utf-8?B?VTRBTjg3R1poa1dFQXNnUWJjRUtYZ0RHdlB1SzNMVE53bUowZEd3bWFTaVlp?=
 =?utf-8?B?STluOUptNlIvczAxT3Jra21wbkhsWjdMREFHdTlkT25remRIWUFaelk2S0I0?=
 =?utf-8?B?N2lnQzEzcUZubGo2ODF6RElQa0szU01aOVJ3ZDVEc2g2TUYwNEJwWEV3bFR5?=
 =?utf-8?B?cVFhMm5kQ0RyeW9oRXRGVFBEQThVSFBkZS9oZ3UwNjA1M0dmeGVHS0VWRGpp?=
 =?utf-8?B?dDdrSTk1VnFieGNtZGhaVDVoOVFnSEZ4NzRlcmRWbVlMMEVVQ3d0djJld01M?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45fab98c-8b1a-4346-a2d6-08dd05ac8d57
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 19:34:42.2680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4XKKdwOBizL6TCX+yQxTV2Q2CceHIh4+ACvNYZ6bOw6NNMKgVIwVBvthXE2dyKApsWA2e77JF1Js2arxvg+0bJ/aqmdqDiOP3n1q1Vb3DBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8838
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

On 11/15/2024 11:11, Matthew Brost wrote:
> On Fri, Nov 08, 2024 at 12:22:16PM -0800, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Some features require inter-GuC communication channels on multi-tile
>> devices. So allocate and enable such.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_actions_abi.h |  20 ++
>>   drivers/gpu/drm/xe/xe_guc.c              | 276 ++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_guc_types.h        |  10 +
>>   3 files changed, 305 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> index b54fe40fc5a9..fee385532fb0 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> @@ -134,6 +134,8 @@ enum xe_guc_action {
>>   	XE_GUC_ACTION_DEREGISTER_CONTEXT = 0x4503,
>>   	XE_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER = 0x4505,
>>   	XE_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER = 0x4506,
>> +	XE_GUC_ACTION_REGISTER_G2G = 0x4507,
>> +	XE_GUC_ACTION_DEREGISTER_G2G = 0x4508,
>>   	XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
>>   	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>>   	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>> @@ -218,4 +220,22 @@ enum xe_guc_tlb_inval_mode {
>>   	XE_GUC_TLB_INVAL_MODE_LITE = 0x1,
>>   };
>>   
>> +/*
>> + * GuC to GuC communication (de-)registration fields:
>> + */
>> +enum xe_guc_g2g_type {
>> +	XE_G2G_TYPE_IN = 0x0,
>> +	XE_G2G_TYPE_OUT,
>> +	XE_G2G_TYPE_LIMIT,
>> +};
>> +
>> +#define XE_G2G_REGISTER_DEVICE	REG_GENMASK(16, 16)
>> +#define XE_G2G_REGISTER_TILE	REG_GENMASK(15, 12)
>> +#define XE_G2G_REGISTER_TYPE	REG_GENMASK(11, 8)
>> +#define XE_G2G_REGISTER_SIZE	REG_GENMASK(7, 0)
>> +
>> +#define XE_G2G_DEREGISTER_DEVICE	REG_GENMASK(16, 16)
>> +#define XE_G2G_DEREGISTER_TILE	REG_GENMASK(15, 12)
>> +#define XE_G2G_DEREGISTER_TYPE	REG_GENMASK(11, 8)
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 1cbad8a91798..899094423291 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -44,7 +44,15 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>>   			    struct xe_bo *bo)
>>   {
>>   	struct xe_device *xe = guc_to_xe(guc);
>> -	u32 addr = xe_bo_ggtt_addr(bo);
>> +	u32 addr;
>> +
>> +	/*
>> +	 * For most BOs, the address on the allocating tile is fine. However for
>> +	 * some, e.g. G2G CTB, the address on a specific tile is required as it
>> +	 * might be different for each tile. So, just always ask for the address
>> +	 * on the target GuC.
>> +	 */
>> +	addr = __xe_bo_ggtt_addr(bo, gt_to_tile(guc_to_gt(guc))->id);
>>   
>>   	/* GuC addresses above GUC_GGTT_TOP don't map through the GTT */
>>   	xe_assert(xe, addr >= xe_wopcm_size(guc_to_xe(guc)));
>> @@ -244,6 +252,263 @@ static void guc_write_params(struct xe_guc *guc)
>>   		xe_mmio_write32(&gt->mmio, SOFT_SCRATCH(1 + i), guc->params[i]);
>>   }
>>   
>> +static int guc_action_register_g2g_buffer(struct xe_guc *guc, u32 type, u32 dst_tile, u32 dst_dev,
>> +					  u32 desc_addr, u32 buff_addr, u32 size)
>> +{
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	u32 action[] = {
>> +		XE_GUC_ACTION_REGISTER_G2G,
>> +		FIELD_PREP(XE_G2G_REGISTER_SIZE, size / SZ_4K - 1) |
>> +		FIELD_PREP(XE_G2G_REGISTER_TYPE, type) |
>> +		FIELD_PREP(XE_G2G_REGISTER_TILE, dst_tile) |
>> +		FIELD_PREP(XE_G2G_REGISTER_DEVICE, dst_dev),
>> +		desc_addr,
>> +		buff_addr,
>> +	};
>> +
>> +	xe_assert(xe, (type == XE_G2G_TYPE_IN) || (type == XE_G2G_TYPE_OUT));
>> +	xe_assert(xe, !(size % SZ_4K));
>> +
>> +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>> +}
>> +
>> +static int guc_action_deregister_g2g_buffer(struct xe_guc *guc, u32 type, u32 dst_tile, u32 dst_dev)
>> +{
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	u32 action[] = {
>> +		XE_GUC_ACTION_DEREGISTER_G2G,
>> +		FIELD_PREP(XE_G2G_DEREGISTER_TYPE, type) |
>> +		FIELD_PREP(XE_G2G_DEREGISTER_TILE, dst_tile) |
>> +		FIELD_PREP(XE_G2G_DEREGISTER_DEVICE, dst_dev),
>> +	};
>> +
>> +	xe_assert(xe, (type == XE_G2G_TYPE_IN) || (type == XE_G2G_TYPE_OUT));
>> +
>> +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>> +}
>> +
>> +#define G2G_DEV(gt)	(((gt)->info.type == XE_GT_TYPE_MAIN) ? 0 : 1)
>> +
>> +#define G2G_BUFFER_SIZE (SZ_4K)
>> +#define G2G_DESC_SIZE (64)
>> +#define G2G_DESC_AREA_SIZE (SZ_4K)
>> +
>> +/*
>> + * Generate a unique id for each bi-directional CTB for each pair of
>> + * near and far tiles/devices. The id can then be used as an index into
>> + * a single allocation that is sub-divided into multiple CTBs.
>> + *
>> + * For example, with two devices per tile and two tiles, the table should
>> + * look like:
>> + *           Far <tile>.<dev>
>> + *         0.0   0.1   1.0   1.1
>> + * N 0.0  --/-- 00/01 02/03 04/05
>> + * e 0.1  01/00 --/-- 06/07 08/09
>> + * a 1.0  03/02 07/06 --/-- 10/11
>> + * r 1.1  05/04 09/08 11/10 --/--
>> + *
>> + * Where each entry is Rx/Tx channel id.
>> + *
>> + * So GuC #3 (tile 1, dev 1) talking to GuC #2 (tile 1, dev 0) would
>> + * be reading from channel #11 and writing to channel #10. Whereas,
>> + * GuC #2 talking to GuC #3 would be read on #10 and write to #11.
>> + */
>> +static unsigned int g2g_slot(u32 near_tile, u32 near_dev, u32 far_tile, u32 far_dev,
>> +			     u32 type, u32 max_inst, bool have_dev)
>> +{
> This function makes my head hurt but I don't have any other suggestions.
>
>> +	u32 near = near_tile, far = far_tile;
>> +	u32 idx = 0;
>> +	int i;
>> +
>> +	if (have_dev) {
>> +		near = (near << 1) | near_dev;
>> +		far = (far << 1) | far_dev;
>> +	}
>> +
>> +	if (far > near) {
>> +		for (i = near; i > 0; i--)
>> +			idx += max_inst - i;
>> +		idx += (far - 1 - near);
>> +		idx *= 2;
>> +		idx += type;
>> +		return idx;
>> +	}
>> +
>> +	if (far < near) {
>> +		for (i = far; i > 0; i--)
>> +			idx += max_inst - i;
>> +		idx += (near - 1 - far);
>> +		idx *= 2;
>> +		idx += (1 - type);
>> +		return idx;
>> +	}
>> +
>> +	return -1;
>> +}
>> +
>> +static int guc_g2g_register(struct xe_guc *near_guc, struct xe_gt *far_gt, u32 type, bool have_dev)
>> +{
>> +	struct xe_gt *near_gt = guc_to_gt(near_guc);
>> +	struct xe_device *xe = gt_to_xe(near_gt);
>> +	struct xe_bo *g2g_bo;
>> +	u32 near_tile = gt_to_tile(near_gt)->id;
>> +	u32 near_dev = G2G_DEV(near_gt);
>> +	u32 far_tile = gt_to_tile(far_gt)->id;
>> +	u32 far_dev = G2G_DEV(far_gt);
>> +	u32 max = xe->info.gt_count;
>> +	u32 base, desc, buf;
>> +	int slot;
>> +
>> +	xe_assert(xe, xe == gt_to_xe(far_gt));
>> +
>> +	g2g_bo = near_guc->g2g.bo;
>> +	xe_assert(xe, g2g_bo);
>> +
>> +	slot = g2g_slot(near_tile, near_dev, far_tile, far_dev, type, max, have_dev);
>> +	xe_assert(xe, slot >= 0);
>> +
>> +	base = guc_bo_ggtt_addr(near_guc, g2g_bo);
>> +	desc = base + slot * G2G_DESC_SIZE;
>> +	buf = base + slot * G2G_BUFFER_SIZE + G2G_DESC_AREA_SIZE;
>> +
>> +	xe_assert(xe, (desc - base + G2G_DESC_SIZE) <= G2G_DESC_AREA_SIZE);
>> +	xe_assert(xe, (buf - base + G2G_BUFFER_SIZE) <= g2g_bo->size);
>> +
>> +	return guc_action_register_g2g_buffer(near_guc, type, far_tile, far_dev,
>> +					      desc, buf, G2G_BUFFER_SIZE);
>> +}
>> +
>> +static void guc_g2g_deregister(struct xe_guc *guc, u32 far_tile, u32 far_dev, u32 type)
>> +{
>> +	guc_action_deregister_g2g_buffer(guc, type, far_tile, far_dev);
>> +}
>> +
>> +static u32 guc_g2g_size(struct xe_guc *guc)
>> +{
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	unsigned int count = xe->info.gt_count;
>> +	u32 num_channels = (count * (count - 1)) / 2;
>> +
>> +	return num_channels * XE_G2G_TYPE_LIMIT * G2G_BUFFER_SIZE + G2G_DESC_AREA_SIZE;
>> +}
>> +
>> +static bool xe_guc_g2g_wanted(struct xe_device *xe)
>> +{
>> +	/* Can't do GuC to GuC communication if there is only one GuC */
>> +	if (xe->info.gt_count <= 1)
>> +		return false;
>> +
>> +	/* No current user */
>> +	return false;
>> +}
>> +
>> +static int guc_g2g_alloc(struct xe_guc *guc)
>> +{
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +	struct xe_bo *bo;
>> +	u32 g2g_size;
>> +
>> +	if (guc->g2g.bo)
>> +		return 0;
>> +
>> +	if (gt->info.id != 0) {
>> +		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
>> +		struct xe_guc *root_guc = &root_gt->uc.guc;
>> +		struct xe_bo *bo;
>> +
>> +		bo = xe_bo_get(root_guc->g2g.bo);
>> +		if (IS_ERR(bo))
>> +			return PTR_ERR(bo);
> A few things.
>
> - xe_bo_get returns BO or NULL.
Meaning just use if(bo) rather than the IS_ERR wrapper?

> - Checking the return seems overkill
Seems wrong to not return an error if there is no allocation. E.g. just 
change it to 'return -ENODEV' or some such if the bo is null?

> - I don't see an associated xe_bo_put
> - Do we even need a reference? i.e. The clean up is handled by DRM managed on driver unload.
Technically, the get is not required at present if the secondary GTs can 
all assume that the root GT is guaranteed to be holding its reference at 
all times. It seems cleaner (and more future proof) to not make such 
assumptions, though. Just have each GT look after its own usages and 
requirements.

And yes, there is currently no put because everything just magically 
vanishes on driver unload (same as per a whole bunch of other driver 
internal BOs). The selftest does require dynamically releasing and 
re-allocating the shared BO in various different configurations, though 
(including different per GT splits that mean the root GT isn't 
necessarily owning the allocation, it might not even have an 
allocation). That code isn't included in this patch set at present for a 
bunch of 'not ready' reasons.

>
>> +
>> +		guc->g2g.bo = bo;
>> +		guc->g2g.owned = false;
>> +		return 0;
>> +	}
>> +
>> +	g2g_size = guc_g2g_size(guc);
>> +	bo = xe_managed_bo_create_pin_map(xe, tile, g2g_size,
>> +					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>> +					  XE_BO_FLAG_GGTT |
>> +					  XE_BO_FLAG_GGTT_ALL |
>> +					  XE_BO_FLAG_GGTT_INVALIDATE);
>> +	if (IS_ERR(bo))
>> +		return PTR_ERR(bo);
>> +
>> +	xe_map_memset(xe, &bo->vmap, 0, 0, g2g_size);
>> +	guc->g2g.bo = bo;
>> +	guc->g2g.owned = true;
>> +
>> +	return 0;
>> +}
>> +
>> +static int guc_g2g_start(struct xe_guc *guc)
>> +{
>> +	struct xe_gt *far_gt, *gt = guc_to_gt(guc);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	unsigned int i, j;
>> +	int t, err;
>> +	bool have_dev;
>> +
>> +	if (!guc->g2g.bo) {
>> +		int ret;
>> +
>> +		ret = guc_g2g_alloc(guc);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	/* GuC interface will need extending if more GT device types are ever created. */
>> +	xe_gt_assert(gt, (gt->info.type == XE_GT_TYPE_MAIN) || (gt->info.type == XE_GT_TYPE_MEDIA));
>> +
>> +	/* Channel numbering depends on whether there are multiple GTs per tile */
>> +	have_dev = xe->info.gt_count > xe->info.tile_count;
>> +
>> +	for_each_gt(far_gt, xe, i) {
>> +		u32 far_tile, far_dev;
>> +
>> +		if (far_gt->info.id == gt->info.id)
>> +			continue;
>> +
>> +		far_tile = gt_to_tile(far_gt)->id;
>> +		far_dev = G2G_DEV(far_gt);
>> +
>> +		for (t = 0; t < XE_G2G_TYPE_LIMIT; t++) {
>> +			err = guc_g2g_register(guc, far_gt, t, have_dev);
>> +			if (err) {
>> +				while (--t >= 0)
>> +					guc_g2g_deregister(guc, far_tile, far_dev, t);
>> +				goto err_deregister;
>> +			}
>> +		}
>> +	}
>> +
>> +	return 0;
>> +
>> +err_deregister:
>> +	for_each_gt(far_gt, xe, j) {
>> +		u32 tile, dev;
>> +
>> +		if (far_gt->info.id == gt->info.id)
>> +			continue;
>> +
>> +		if (j >= i)
>> +			break;
>> +
>> +		tile = gt_to_tile(far_gt)->id;
>> +		dev = G2G_DEV(far_gt);
>> +
>> +		for (t = 0; t < XE_G2G_TYPE_LIMIT; t++)
>> +			guc_g2g_deregister(guc, tile, dev, t);
>> +	}
>> +
>> +	return err;
>> +}
>> +
>>   static void guc_fini_hw(void *arg)
>>   {
>>   	struct xe_guc *guc = arg;
>> @@ -423,7 +688,16 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>   
>>   int xe_guc_post_load_init(struct xe_guc *guc)
>>   {
>> +	int ret;
>> +
>>   	xe_guc_ads_populate_post_load(&guc->ads);
>> +
>> +	if (xe_guc_g2g_wanted(guc_to_xe(guc))) {
>> +		ret = guc_g2g_start(guc);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>   	guc->submission_state.enabled = true;
>>   
>>   	return 0;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
>> index fa75f57bf5da..83a41ebcdc91 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
>> @@ -64,6 +64,15 @@ struct xe_guc {
>>   	struct xe_guc_pc pc;
>>   	/** @dbm: GuC Doorbell Manager */
>>   	struct xe_guc_db_mgr dbm;
>> +
>> +	/** @g2g: GuC to GuC communication state */
>> +	struct {
>> +		/** @g2g.bo: Storage for GuC to GuC communication channels */
>> +		struct xe_bo *bo;
>> +		/** @g2g.owned: Is the BO owned by this GT or just mapped in */
>> +		bool owned;
>> +	} g2g;
>> +
>>   	/** @submission_state: GuC submission state */
>>   	struct {
>>   		/** @submission_state.idm: GuC context ID Manager */
>> @@ -79,6 +88,7 @@ struct xe_guc {
>>   		/** @submission_state.fini_wq: submit fini wait queue */
>>   		wait_queue_head_t fini_wq;
>>   	} submission_state;
>> +
> Unrelated.
Sort of. If the coding style is to have blank lines between sub-structs 
then adding the g2g struct ahead of submission_state gives it a blank 
line above but not below, which is therefore wrong because it is both 
mis-matched start vs end and not following the style guide. On the other 
hand, if blank lines should not be included at all then the lines 
before/after the g2g struct should be dropped.

John.

>
> Matt
>
>>   	/** @hwconfig: Hardware config state */
>>   	struct {
>>   		/** @hwconfig.bo: buffer object of the hardware config */
>> -- 
>> 2.47.0
>>

