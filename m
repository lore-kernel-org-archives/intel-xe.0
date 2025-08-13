Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20031C87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 11:08:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C300210E03F;
	Wed, 13 Aug 2025 11:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gqMjcfx2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB0110E03F
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 11:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755083311; x=1786619311;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pCBLWK9jUYD/Rs1MP+OITY/LtsjkKKz9464T6pza0/g=;
 b=gqMjcfx2sXxAoytXlyKHx4yTGXC3JrdzpeC7iloyXPWEj/nmeJr3VLYA
 oQwvzuaoSzSCHkFmsUCdChsHGY9bBdKkDJuh2MyAk5ecxDYneWmkjL49M
 ww6xPpJBbiVyMUHtWt1NBOMstiP77py1OkwzHenw0OQFy43C0sEyxpz/c
 6GGWKBEKI2nE39R+9fQqRxDSrMq8r4pSpAa33kT2nBnbsXJiqbYKNbQ9q
 CTdSXmDEjRZTHXaI+HEf6EPaoFY87ThUH7U3y3MZIKvpI9ZN4gCc+QmBk
 dYXwJzb0O+m981UtqlcWqWxPrJ66Q+EFvn5oU95Fn/+tLVmck95mlw4cZ g==;
X-CSE-ConnectionGUID: ptmFdnLZQm2Mm+pWP5ePCg==
X-CSE-MsgGUID: 6zcj+1mZSlCMGKhqYifIlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57089484"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57089484"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 04:08:31 -0700
X-CSE-ConnectionGUID: heh+hS8QTD2wH6CuG/XIpw==
X-CSE-MsgGUID: z7WqHqHEQzqsLFnkziArsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="190150970"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 04:08:31 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 04:08:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 04:08:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.51)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 04:08:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vTEH53KPEhEsWPlza4hs3SGg9ed4cxljF0TQByiAXHjPjf/tQRg2SlbOk/zT448cf6TUtbjU+0/RNuirobKJda5UTx0OKcgKIAwZTp5QwOz2EfnFaTplh5M7TK/zI6GbuSLfMdKRMRZMZRXqwLCykK+5CkQhwyl7oxBpvOTMw5jyEFR41lb8UrWFhmP7QS4SJJZKWzm5GqU+yJaM1HaVZXdPUMF5pmALCjA0kky7uw30rhL0+ewjXwNbOPooVSZ6E/u0Hm78jx5SvHCQOeykyelaNySNLYHalpe4J/wCdl64bSFCl/03BsvxEBrUl475JXZwHd1ilNpjExWz8TBRGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyQZ06CN2WrsKU2+S6Hzl3mXv07eejpRSibZHAjcsFI=;
 b=fwEHlnqID8vCafcFRba3x/mlD/Bj5U7YxsclDYxYdWgpjcMxcrhx3nwG4Bk6xM9G+3ODySzW5AUBsAOv8nJsZvvNU4WhOwtLYVEBodslR7pQ6vImGRN8S+hW9XREmowEcRAB6DVWSz2mCqw7+bep5JNJofwqTKgLjvcnUKV6+ezOI58YqS9e2TKNyhpbssdG+3+3RDnQa5BgBK9ZEsQ2d1NWWiuOvggkwAZY3DW+uQorN2HYRv4K1r6gb3H5fPQw3ycgtI+S+aQbzia6KexoJtX/2HOiKF9y7ma4GwB/3YDC3RAQFyyKtzw3SigTOXuoErWGc6Uo0A+uw5cvPWn7kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ5PPFEC87B8781.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::85c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Wed, 13 Aug
 2025 11:08:28 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.9031.012; Wed, 13 Aug 2025
 11:08:27 +0000
Message-ID: <7d0cf4ed-aff8-4840-9af3-810039384a73@intel.com>
Date: Wed, 13 Aug 2025 16:38:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] drm/xe/configfs: Improve documentation steps
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <prashanth.kumar@intel.com>, <dnyaneshwar.bhadane@intel.com>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
 <20250808-psmi-v3-11-a111e9f1e4b7@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250808-psmi-v3-11-a111e9f1e4b7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ5PPFEC87B8781:EE_
X-MS-Office365-Filtering-Correlation-Id: 83985326-654a-4fe6-be37-08ddda59baa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjByZXJrT2lmVWNGcUgwZGYybFZybW83cklIZXRTTmRBMTI4WXBZMmZPd3Vq?=
 =?utf-8?B?Tm1pVzByRlZMMnZZcHMydnQ4eTRDb0czcjcyU0QyZFdKRmplemFveVhyTnFV?=
 =?utf-8?B?eEFTR2VIR0JsQnYvSGdCVWtyT0VCVVJXdWNnTUgzSFNIL2hoQ2ZvTk9GOFkw?=
 =?utf-8?B?anIyNmY2Y01wa2YvL1ZycXZYTnVGWmJQeTUxbUhPWW9iMi9RWnA5NTVOK0dx?=
 =?utf-8?B?QkRMQTd5SWNlQjU1dG5rNnQ1dU80OWJWT0VVd1h6Z2hqdnF2bndvZXZUQmY1?=
 =?utf-8?B?T3ROMlgwMEM2K3dsRkUycjdKMEYrajFhTjROVmExS0lnczlYeWZhVzVpT0RN?=
 =?utf-8?B?ZlhyTlRvTDBlcE00ZGtJZjBqbzRlQVZLaW9acWtPWlVLZCt3UENic3Z4ZE9x?=
 =?utf-8?B?WGorZThMYk5PSnZjelAyWWF4TlNWNnBpQ0NrUFBRMXFFNURRUGV5OVJRSC82?=
 =?utf-8?B?TVpaOVVMZDFhckVBR0NLOUEzMERraWg2ZEt3ODN3aGhyVmZRRFJkT2xNcy9p?=
 =?utf-8?B?cDVaai9aeVEvbEM1bmU3TkcrTUtqcGszcFRaMS8vaktQN04vS0lDYnlTVjhS?=
 =?utf-8?B?aG1xYzRadHFNeTU1RDBNQndFNjhrWm15LzhTUVQ5a3Q4d3B4MnY1emV6bTEr?=
 =?utf-8?B?TTB0em9FdUx2UXNkNm94b2gyUFdkMmplZmVtaGk1cG1RY3JvMERneTlYZlJX?=
 =?utf-8?B?UzFBTXlScjZJUWpKQi9URnk3WldGT3FQaFFTclNyamlYUDlwWEw2YWZicXRT?=
 =?utf-8?B?ay9pUFFpdnlaaVJtQURteFIxZUZ3RWVQeGxCaTdhcWJwRE1Sb3FTZEdiUE1q?=
 =?utf-8?B?U29oTXRSMXZ5Wi8zc1RQQVhIZEFVc1ZUWjBaUytyNjB1T3dtakoyQ3FHODF3?=
 =?utf-8?B?ZnNFY1kwWU51dGgvUDRRUUpNczYrRGN1c0lrNU1RdHA2Z2hmYzNweVprMXY3?=
 =?utf-8?B?YlRLNWdsaVBRSENpN212QnlOa2hkcW9SN05PUU5PQXRXU3dMUTdNRXJ4NHQy?=
 =?utf-8?B?NVRiczdCODNIUWZQNFVJWDduM2hIemViZllvTjFnZ2tLWCtub0orL05paVlY?=
 =?utf-8?B?VXRDNXY2RXBxUktuSFpJeHBuU2tlZzZscjNEbktWTXIzSzNvc05xallFeGJi?=
 =?utf-8?B?N3VvM1QzUXFGUjM4RUJUdUlraVJYclpPRUtMNlRWcG9vLy9yTkFpazAyMDN4?=
 =?utf-8?B?WFlSRDVPTExPVGlGTGhzbDNrd25FVm5qQis5S00rNWRFNEdUalI4azdDN1Bj?=
 =?utf-8?B?ckNhTVJtSE5MN00ybGFXNTRpeEFjNGJzTlY2czc1dzhjQWlwcHY4UVhKTVpO?=
 =?utf-8?B?NEJxY2d0Q3kxNDk0N1IyWmc1WXpQWlhTaDhlOXZZNStSeVQ0SjNwS1orNkFi?=
 =?utf-8?B?V0dtZm1CRGZKdVhqZ0RKOTVXY1MrMkJUR1Rld2ZmOXFwU2FzS0RkQmY5TFNV?=
 =?utf-8?B?TkRiQXFnZ1owQkZjdDZyY1hRSE9HOXIvNVlLWGNIa0diTU5GUFlBd0UwMWRC?=
 =?utf-8?B?WmZwSjFpOUpMUFM1QnUwQXYrLy96a2FLSGVUVUs2TEdoK2p4YjRzcURRNEFB?=
 =?utf-8?B?Nk1QVGQ3eVlxcDMyTmtWSUZjZ3lxR21DRFhLVGtsc3dQUHUzdXJUVHowWmho?=
 =?utf-8?B?NEhGSGtqN0E5elY3TWJCR3VPcHgwQVJlM3RRZGMrUElseFFLRkt6VzlGZi9J?=
 =?utf-8?B?Qm9WanNqQlRwQlRqVHJscWZLNFRoVUF0ZGcwVkM0VzllNlQ1TWtnUWxVWFpz?=
 =?utf-8?B?aER1MmFhemtBWGUyQjY5eFhGZVJWa25FYWJvUTduYmwwZGUvdUNaMUZ1c0V0?=
 =?utf-8?B?MVF6Qk1ETnVzTk11Z1J5UkRueVh1THVYcFRyVitxM014eDdnOFdlNmhQa1RI?=
 =?utf-8?B?QVNuQ1MzRFI3K0ZxZ3BOOERGNDAvNDBUd2NwTXR5WDRWTHhuTGY1bXhXSm5a?=
 =?utf-8?Q?o4LtLz0K6Mg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFZuRE04MWgzSWJLNzFxUEF2emhYV2RXYTlhMjd6RW5pTHdwK2Qwa2syckZu?=
 =?utf-8?B?VHV1c3N3bXlOTWdRK3JlQyt2WnFNUVNMckJENjZJbEZCV3hPVytDQldTN0hh?=
 =?utf-8?B?UUQ1T2N2VkZ5eXFFc3A2NDJ1bDFZYWlOSUJlR1BNWEZ2OUNoUVNxdHpZL1Fv?=
 =?utf-8?B?TGRGZmdQUjRTUEFEYVMveUMvb3pXU2ZESjdWZWFPbEdTc3lERllJc2JneW1y?=
 =?utf-8?B?WmVHb2JKYVF1b0Rqd3ZHcGYvOFJUOGJRc0dJRFNmeWhMRXlsZXYzbWlUbUtX?=
 =?utf-8?B?T3hZMVhhT1lRSjdkelpyRkI4L0l2TGlWUFpQd3B3LzdPV0RKeUlnZ1V1SGps?=
 =?utf-8?B?cmt6clVjbWJxRVJFbWVPWEdRMzVCZHlKampxV0FCeTh3STBRWE9NT0Z5eDZo?=
 =?utf-8?B?ektBUERSZFlxMnQwamdtTnk5Q1djdVpBZjZSdkJPTi81dmN1My8rV1ZvUDIz?=
 =?utf-8?B?Z3JHZVVkdXV6YXhwcFFsdU9vZzg4UmNNSmNGSG5yekxVWDJqVVEvb1MzKzlj?=
 =?utf-8?B?aGNlMWszY2RCV1RDdzloMlIzZjRVYXAvanNPcDFMYXpvMHpFbjhOT1l5QnFS?=
 =?utf-8?B?ZWFKUkZSQTE4L0ZxUWxRQzVvQThGaXFxaHk4bzNuaXNuSW9WV3NsYkZTSkJW?=
 =?utf-8?B?QkxqMkxBUmkyNjBGUWdpclFrKy8wSFE5VVpCTlI3MytPUTJXZDE4KzlKbnlM?=
 =?utf-8?B?V1RmYjc4Uit1TTVGaURub1lwNks5WVUyOXk3T29XYjhuYTNGMVhacURVdUdy?=
 =?utf-8?B?clp0L29FR0h5MllXN1BQRHBIV3lkUjNGTFMvMFg4ZFVRWTFZTGQwbGMvWnNU?=
 =?utf-8?B?Zzk2YUtiMHhDdUpDQnFSSHFBdzM4aytnS3ZPd3hpL09paHNJbHZhVEZMK3M0?=
 =?utf-8?B?Qk1JakxQWENsUzBnUGJNUmR0M29rUDB6WG5sNng0K0NER2VQMFd4NzlJWnlO?=
 =?utf-8?B?Vm5oMk5lOEVudmN3RUFGMWJwQ1pPOGRoV3R0K1Ficys4TEhiYitzVFlRRFJ6?=
 =?utf-8?B?MEpXMDBZWFd2VEVKdTd5aWt4b1kzNXN6STJVc0lOOU5pTkxuZEc1OWVvYjk1?=
 =?utf-8?B?VUdkeDFJVmJjTUtKa0F6eHVlbFZvYzlzUGpQaGx0cDBUejFUWXFkem1pajRh?=
 =?utf-8?B?UlkvUVg0TXVyRU9SRmhCQno3RWZ0ckpvZFhTd3JuMCtVYjVQUVZwSERmRFRN?=
 =?utf-8?B?MHBaYnE1aDVMQm9SQTF1aHVYZWEvVFQ0Y2ZPWFJVV1RXbGZ3SlVYYVFFN0Ir?=
 =?utf-8?B?NEJFanJmY0NvZ0wrWFUzNnBmaDdxdHlJU2RUZm13QkoyNkJ2THJpa001eVRQ?=
 =?utf-8?B?bWw5OW9DSGtER2hQQ0JRcElCWHpFWGJuT3krbUh4MGdXeExlWFREblFNVXBI?=
 =?utf-8?B?b1Vjb0oyd2tvZzAxUm15NlhlVVdteGFxaVdoeG0zVUtLdURkMnA2TG91THdT?=
 =?utf-8?B?Qkh0NWNVVTg4RG5pU2s0aWtKbnozWEVkN0F2TjlnZWtPUGR3VEsyQ09EWTBL?=
 =?utf-8?B?c3ZuUnRpYkdqdFBBV2JxSjVsdU1yTG5TMXJ3VkRNdGlvczhTZ0RFblZMc2dr?=
 =?utf-8?B?SmtZVXNFUjI0YjdmY3orNmpGSWNwbloyaWZhSGJpTWg3MXlweFVWejJXcjRO?=
 =?utf-8?B?SkVOVW9STW9TZXRqYld6V3RqdXB2Ny81OFFCRjZDRktvaXBvSE1wUlRNY1Fn?=
 =?utf-8?B?OHd6ZGJBODF1V2FmU2FsNFJIcHpqQWkwaTlEdDkvSTd1d3hXajF0WFNEbU1l?=
 =?utf-8?B?dFJFdnFnNk1qZUJhMi9ydDFyNnFER3dNZE9hZEpTSXpSSEVIVnlMbjlMQ21H?=
 =?utf-8?B?VjFmZ0Jwemo1NzQ3UGw1bmdlbVJDWHFSSVV4cDEraTdXaFA5Z0NUK083UlNv?=
 =?utf-8?B?TStrTlBHdXVpNERvenZvWmRQak5QamVmbDNMdlozVE9Gc3NYaEt4eEVnOGo2?=
 =?utf-8?B?SVl4NWFySGJETVRQM3ZxTDdnKzBpK2k5T1JOWWpqWDVieTJtU2pvYXQra2s0?=
 =?utf-8?B?aHc1eWJIOVBTc2FjaTFnVkk4Ti9JTWNOQ2tvUE5jREpNZzBiM01RYS9GcWow?=
 =?utf-8?B?VHV5WTkydUtTUDJUcms0QXdqMUtoZnEvdy84Y0Q1WXhmeFlCeGNsN2Zqc2N2?=
 =?utf-8?Q?iHY37jiGB+UaaPZXmcnSn0hJp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83985326-654a-4fe6-be37-08ddda59baa8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 11:08:27.8965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tuTR92w0YXbBSEu6k+8nWHmIrmlHkYAQWMs6eb7blKiEp6Gsz1Zt5yFauqE9xm/05s6gX9GpCQMdWHTJPAl1mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFEC87B8781
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



On 8/8/2025 10:59 PM, Lucas De Marchi wrote:
> The steps are roughly:
> 
> 1. Load the module without binding to the device
> 2. Configure the desired device
> 3. Bind the device
> 
> Move the binding part to the "Create devices" since it's not exclusive
> to the survivability_mode attribute and better document the steps.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_configfs.c | 20 ++++++++++++++++----
>   1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 7c92d293ba733..58196b7571239 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -29,11 +29,18 @@
>    * See Documentation/filesystems/configfs.rst for more information about how configfs works.
>    *
>    * Create devices
> - * ===============
> + * ==============
> + *
> + * To create a device, the ``xe`` module should already be loaded, but some
> + * attributes can only be set before binding the device. It can be accomplished
> + * by blocking the driver autoprobe:
>    *
> - * In order to create a device, the user has to create a directory inside ``'xe'``::
> + *	# echo 0 > /sys/bus/pci/drivers_autoprobe
> + *	# modprobe xe
>    *
> - *	mkdir /sys/kernel/config/xe/0000:03:00.0/
> + * In order to create a device, the user has to create a directory inside ``xe``::
> + *
> + *	# mkdir /sys/kernel/config/xe/0000:03:00.0/
>    *
>    * Every device created is populated by the driver with entries that can be
>    * used to configure it::
> @@ -49,6 +56,12 @@
>    *	    ├── engines_allowed
>    *	    └── enable_psmi
>    *
> + * After configuring the attributes as per next section, the device can be
> + * probed with::
> + *
> + *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind
> + *	# # or
> + *	# echo 0000:03:00.0 > /sys/bus/pci/drivers_probe
>    *
>    * Configure Attributes
>    * ====================
> @@ -60,7 +73,6 @@
>    * effect when probing the device. Example to enable it::
>    *
>    *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
> - *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind  (Enters survivability mode if supported)
>    *
>    * This attribute can only be set before binding to the device.
>    *
> 

