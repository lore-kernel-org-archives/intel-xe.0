Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70774C5320E
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 09:48:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADC810E274;
	Tue, 27 Aug 2024 09:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d74Qsd0i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E1C10E274
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 09:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724752118; x=1756288118;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DoTU8YQoyWeM2joW9p5ixCGlNLKGwt7IkvrN+99yYmc=;
 b=d74Qsd0ihb5lOfuJoZBgD8Mv1Uly1smmnAttT9q3o9NsyxqJskCwFf6g
 yHXnF9fKeipQrm5KQUD1NNHc1C6r1uPgQY0XH0TDALbl+zEVTEtqbhYDT
 u/eRW5M+HaLvL5wM4UaR67n/tdLh9A9UEar/jOQOPBIlmlXdn5GMKAjHr
 /CJp6ZTpYXo2ozcLNovEPLKj+jc3zPkdy3z/pOUkzxEGkFLP4P89RR0bW
 A+0jzgVniLgXJojoLF/7QySaSv6lFLPUS1cIWwbOE+vdi+bGsfRPjshyj
 WuY1N5Hz63fh3w4XgiRvdegoNlXK2JAk/EG8GMe7B/ZiPF6brXfmQg/sL g==;
X-CSE-ConnectionGUID: fiqzV8uwT+K+5DCLACdWOg==
X-CSE-MsgGUID: ygsbfKmOQRSCPbV21PcxQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="45734925"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="45734925"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 02:48:37 -0700
X-CSE-ConnectionGUID: cM1keGFaThePxBHy57E0XQ==
X-CSE-MsgGUID: tyJM1+lzTF+CBJNKlycCMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="85993957"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 02:48:37 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 02:48:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 02:48:37 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 02:48:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLP4hZZCZR2qv0HVTQks2QqUjTMwloovhfHyIg5oQUjs7SyK0g9zhwMM/G/Yb/SZsa8L3LswInIqPu3lELapcuHUEdEYfgjxIb2nEnWWFJCB1e+kSspVJJX52sSkPzzzlK2lZ1qE7wQZ1K3A4zPw6Ok6hDIMiKSVIi10/QBMmIFN5vIel/48znluVXz2xFKp21IbgkthQ79H+Ul/mglE0SFogRqQib4GtA/lu44nHOfiOXTf4sm1Es3Vi5OzFPLr03HT//Z/hyJOLPwofseby84icy/WtMVyMoAgVDtxXbHKCYbTZ7bdPXZJWbPxBNR1P44GzvfLI42gfvoyldVRow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2iN6iUZKz+0k14DG9YD+soIe09Y/LxgOkIjxn30Zwcs=;
 b=rJslP1ujEVtT6wBPQgnE8l8ddwcznxjGG4lPB3bv+Z9RtT9/Tq5QgtgqD3hW2hSNZW2U31uD5GNKS+q2KWDySCNVOtCFBRnUws3a+VUKh4wTf6hjMG/eFlRvkYmXgZ8x4HApSWADbQBQME7OH68sXXryKSiw24stezHH1PvrCMhYKOIlkeZ8+/J3j57qrIeYpcpO2AI4xjd3L8T83MeX0PTDZTXXpq9S3EyhGE19agsIzZLMGC3VELF16k0PRRSOBRc+xZj3WPFN+zRW/gRmZ+oL8ROLwzSIQmSabu0DMQppU2XkIlOOEQ4bWtmroeTB84/2hrt4hf/XcamLfpgUnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SJ0PR11MB6792.namprd11.prod.outlook.com (2603:10b6:a03:485::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.22; Tue, 27 Aug
 2024 09:48:35 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%3]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 09:48:34 +0000
Message-ID: <0d95ca62-5d39-4be5-8714-beb465988cea@intel.com>
Date: Tue, 27 Aug 2024 11:48:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Fix memory leak on xe_alloc_pf_queue failure
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Stuart Summers <stuart.summers@intel.com>
References: <20240826162035.20462-1-nirmoy.das@intel.com>
 <e722739d-10f4-403d-be67-42a54509e3df@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <e722739d-10f4-403d-be67-42a54509e3df@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0013.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:2::7)
 To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SJ0PR11MB6792:EE_
X-MS-Office365-Filtering-Correlation-Id: 10dde075-d7ae-4f68-5e02-08dcc67d6ae6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnh3RDlVZ1p6VTR6MG9TblJRSkR1QnVwWE05aHVhTmYvbXZ4VU4rcXZ2MW5u?=
 =?utf-8?B?aEdBWjQvNmI1WEJtdXFaQnVpN0I0R201M3luNDZRTTNpQ09tQnMrTC9EeGcy?=
 =?utf-8?B?LzlpcmNscEVyZk1vNkxUQW5idFpwdFAybUJBUXpvNTd6aTZkM0RSeGZQZlht?=
 =?utf-8?B?NGg1YjhVNWE5MEZzM1kxM3l3Q3NheFNQVmlNd2JJZlhjZGI1VTNJN2pVRmdt?=
 =?utf-8?B?WHcraXF1eml1K1VSK1AyeFlGbVZJUWp3d3VJSFRBb3NVZ0ZjbUQrYlp5T0RT?=
 =?utf-8?B?V1ZjbU84MXFPUGQzSFM3YnJUbFNwbmMxeEhvQS9jSm1STWdWSzdaNDJWejJt?=
 =?utf-8?B?eno4NU1kdjljOE5tZzMrbmZiUkNnZ29LUzZVVDlNV2JLd1hhU1NjOWc4K2lQ?=
 =?utf-8?B?aU9ZanZuRDArNm93RTJOK2ZWMWl2VktUWEl3NnI4QUh1U280NCtSMENQRzZp?=
 =?utf-8?B?QW9EeWhZSDNwc1JpcU90MEtBSlBPNXk3OGh5c0NHOXdrVUw2bmtlREwzL2tp?=
 =?utf-8?B?VG9HV0g1Y0xmdFFDbXNLZVNVZ3hPbEUrNlVCNzdqVTlPdWpRM3dNbnlIWFJ5?=
 =?utf-8?B?cFN1Y2dyUTFjYk12T0x0SVJyQlpJM3kyOFBodTFGN28zYnBzNkxEaXVBa3NN?=
 =?utf-8?B?SDF2NTREUzVYZDlwM2IwQWdGVWxRYVNHTjVha3lFVHBUMFpDSGZnQ3RBcVhH?=
 =?utf-8?B?cXpyWE9heENZL0Q4VitLaFA2ZndSOU1kSXp5bnlRREIvUzVZY1BSc0l3U3Nm?=
 =?utf-8?B?WlQxajAxQlV3dGRCSHFhS0xraVFqbFU0SUpVdGt6eUt3eWJwdnhJMExFNXJy?=
 =?utf-8?B?VGFhSllENlR2b1JzOW9wcldzajludklvQzRyUmpjQ3hKdUpTaFQrdktmSVF5?=
 =?utf-8?B?Y2U4WWZUVndheEZHSStzT3QyVDJ6MnlsNjNIK2RQb0srelpyUFNaZEFSUERv?=
 =?utf-8?B?L2RuODJYaXlBM252cm93ZUZLdUErMktvcWk5NEdOSzVHUkhKcjhzbXh2MDQr?=
 =?utf-8?B?M05ZbGE3ZU9CZEdQaXhpZU9YTDhRckMrbUVIQ1Vvd2lFYmlOUmZlTTVRaHdJ?=
 =?utf-8?B?RDd2V1lHaDBsUjNEVHBuSHd2MnFGQ0pKbEZxTUowZnlrWW1QVDVMVGJEaGoz?=
 =?utf-8?B?T2FRY1BzZ0Nya0JRYmowOFR1RmlZRG9NSzN3Lyt5NFk5eVlQaWRLSFpFTEQ3?=
 =?utf-8?B?Z1ppa2JwczBKZ0RseVRhMDI5OENBMXdUUzUxQnN1dHZxU0xpZ2I1RlZ5emVy?=
 =?utf-8?B?SEZkcy9XaTM0MlF5OWxXK1N0MThseTM3b1lBcDZTVzBMVEc0SmJkd0R6TTBx?=
 =?utf-8?B?TmNwUFhkZU5TS29KYVhxSHhMMytqZWtMaWdXdUZXUjNpaHg1TjV4aVg4UEcy?=
 =?utf-8?B?Q0MrY0c1WGswUUZMM2wzeE92ck5iL0FETGo4SDg0NUQzc0pZcGpPS2ZpeGRB?=
 =?utf-8?B?VVYybnJvMnpEM0toOTZtbFVBdGdudHpLNmxqcGNieGswY0duUDB5dEl4K05U?=
 =?utf-8?B?dmIwcmQ0Zk55aG5vTEZHYW5udjR0M1FzNTFYRFlEK3U5YjNqcTM4d1htaEtx?=
 =?utf-8?B?ZDFRbGJha2xMOUg1UEdFT0R4dTJpeVNKRzlleDJEVDJYb0JIdVZqdDlXOFlB?=
 =?utf-8?B?SWJBK1hRSXI3akFaWXc3ajRycGY5WkNXbVo1UnBmWFowZmRZTHVlanhwa1pl?=
 =?utf-8?B?YzBXN0RUVFMwMDB4N3dWdzdWMkxYcXhhSGlNM1U1VkZkdi9kUEZnOU5xZ045?=
 =?utf-8?B?MVJHYXVENTlxUVFnV3hMNHVnRmw2QTRQZE9NM2dhamlMYTcydTllK05mQjFx?=
 =?utf-8?B?Y1JjY3kycnBLYXhNb0Rpdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXJOSmppUG50YmJacVNVZ0JCdVRjQnhTdUgrWTVlVGZFaEF5U3F1RmNiNmt6?=
 =?utf-8?B?NTRNZVJEL3oreGNIaVNqWmdqUCtCRFozTGxuSFNyTG0xdjNPNGwxWVJBMHpy?=
 =?utf-8?B?dWxYRmFGejY3bE5udjQwcGQwV0lSVFZ1TnNIVXdEZUxLcUxpcWkrQUlMVng0?=
 =?utf-8?B?c2VJaHNZaDRkKzYxbnJ3dzJBM3gvUlhmY1VwakUxdzh3aDFhTXNVb2o5Sm51?=
 =?utf-8?B?UU9TeHdRemhoelZQRUVXeWFkRXBuWTlra2lzZkhTNTI4UmcxVTlFY0NxRm1y?=
 =?utf-8?B?ZWZENVRvZnowWlE3N1pmRVc3NVhCc2plbVRqNGpOMkkyajJDcnJhbE1rdk1O?=
 =?utf-8?B?SEJNSHZtU2d0ZE5YY2x3WVJVUHVhNTRYbUtCcnRPcFNkbk9FR2NsSGloVWdD?=
 =?utf-8?B?N3VWZ0NDcTF1VzZZaUFKU3dxSGZxT1dBR3hqbDBMamJHNGFBL1dMS2tHZXgv?=
 =?utf-8?B?eFlDUFQ3WTdkVVFWS3dJNXovZ1NTRDJWRWs5MVJLT2V1OG9sY1kyOXlsZ3VE?=
 =?utf-8?B?Njl3YTEyT2liTm04MjZ0VHduWXBHbTRzb2U2UmduV3dtN0thQUJsOXZvWlFX?=
 =?utf-8?B?L0dCV1VJMUtpajZTdDVOYTBiMENvaWhMQnNVMTU3d1RwWmZnK2l5elpxUlNv?=
 =?utf-8?B?czIxcEFCQ0ljMHZuZ3FPRTdXNW1lQjVJQzhLMzVaTm1LeDdCajFGN01MdVpk?=
 =?utf-8?B?bUFHdVZBUk0xYndhakl4NmJHZzVJd0hOSWZETllQZi9QeTBPWjhpbHlwUXpD?=
 =?utf-8?B?aGN5TnNEYThwTVJ3eTZYNlM1aFJTa1R1NktQTnZPWlU1TUpjSFJuZG9vTk9p?=
 =?utf-8?B?MG56TWh1WVp3Qlc3TDlyMjFNay9NSkt1SVBadE1LUWtiSllEQm90MWRhTTUy?=
 =?utf-8?B?YUVyc01meDVKcXBkenNUUXdsdFhTS09weTllM3ZFeloyeTl2WEg3S0VuQlJq?=
 =?utf-8?B?Wm96YldvZCtwZUtqRnZqUmRyMkl1OGZWNTdNc0FWbnY1U3h1c3k5KzNmbEpB?=
 =?utf-8?B?L0gzSXZYeTRqeWlDQksyWTZQWHRTSUEzdDJmelVCN0UvZG5CREtNVWNONXND?=
 =?utf-8?B?Z3dMV2JEd1NGNDFMOGhlUzV4a2JzVlZXQk1UUnBKd0VTdkFXeU5QREpTTERw?=
 =?utf-8?B?U2FFeEo0VDFNeEtGcXo0T0NJeStmM1F5b0x2dzNsSFVLay85Mnp2Ui9NRU5N?=
 =?utf-8?B?Y2c2NjYyYUJMM01Qa2xqVldRcFVkN0RkbkhleXMvUmtSUlBYY21FYklmZXNX?=
 =?utf-8?B?WVQvVWdKcEE1cEIzMnptSXpuY21WZEtLTHhEcUpnSVA0RHhsMWVEcTB0azRJ?=
 =?utf-8?B?TkF5VU5LN2VEV2ZnOVZEVThNS3hvak93YWNVQS9mU2I1aTFUSEdQcGpnT281?=
 =?utf-8?B?WXdsYVhOOCtxaWR1VUg2cWVLUWh4TWw2T21NWnFhdEFBTVk2Vi9wNFJKNklJ?=
 =?utf-8?B?VmtzR1Vjc1UzWnJKZFJYRTI1WFlncWNYMXFDblhyREFmdVNJOXpnQTI4ODFN?=
 =?utf-8?B?SEJVejZaOVF5L0VpVWx6WVMyY29FUUJZdkc5dUpwRTFNM1VpU0YzTW1LaEZ6?=
 =?utf-8?B?NU9vR29KdEk3cVNrVVNGSUpBdGVDZnppNExWNGpiZHlZN0tkOVd1OGx6ako5?=
 =?utf-8?B?dmlGclpYaFJXNHNtYUY4dzlWVndIM2dJZWRtL0gzWDl3K053QUJXWFZmQnBD?=
 =?utf-8?B?RXh0VlM4RytwcDN5VTluSEoyRXllUGI5dEkzOWVwMlliY0VtTndxTVZaN1lD?=
 =?utf-8?B?Nzd6cnVsRjUxQjE0aHJjN2tQOEtWdDhRbEFTK04wajFnenE0S1lKRk03dUpv?=
 =?utf-8?B?M2tLTTYza2dTcFAveVhxQmlzcmM1S2RJUnNSblZDS2hCWkZUVTZVQVpyZ1Nz?=
 =?utf-8?B?NThjMVpxaGsrTlZjSUo3T3I1QjExYTFxcURQTHFvd01kTExvTEN5eFR3b05y?=
 =?utf-8?B?c1JNU2dFMzV3V1oycVhteS9DMUhQVWR0QUhZZWc4bXNPcGRpaHpjV0YzdTA0?=
 =?utf-8?B?bzNqdnNlTnFsa2FlcmxtbjlSVlpjbDl3aVJkZkl0bkY2YTlWdENncWRYMzFU?=
 =?utf-8?B?TUdLMUcySWtuUDIxS2xOVmlBTVhONms3ak1Ha3VVZXZ2YkZ5ZFJ5Ym1UNE1s?=
 =?utf-8?Q?3q3OFgWN0XHPRGee3ipnun0Ua?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10dde075-d7ae-4f68-5e02-08dcc67d6ae6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 09:48:34.9184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6hbOzo/yBYHIPpsrvFRoFNwn+zgkneWL8OVnLFRdjdmYOQjIcPxMD2GpFqaW0vxBuOiTlcyVWLOFpp9FWgilcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6792
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


On 8/27/2024 10:48 AM, Matthew Auld wrote:
> On 26/08/2024 17:20, Nirmoy Das wrote:
>> Simplify memory unwinding on error also fixing current memory
>> leak that can happen on error.
>>
>> v2: use devm_kcalloc(Matt A)
>>
>> Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page fault 
>> queue size")
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Stuart Summers <stuart.summers@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_pagefault.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c 
>> b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> index 0be4687bfc20..91810d0a9afc 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> @@ -388,7 +388,6 @@ static void pagefault_fini(void *arg)
>>   {
>>       struct xe_gt *gt = arg;
>>       struct xe_device *xe = gt_to_xe(gt);
>> -    int i;
>>         if (!xe->info.has_usm)
>>           return;
>> @@ -396,12 +395,11 @@ static void pagefault_fini(void *arg)
>>       destroy_workqueue(gt->usm.acc_wq);
>>       destroy_workqueue(gt->usm.pf_wq);
>
> No need for the new line here?


Me with my telescoping vision. I will remove that before merge, if that 
is fine.

>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>


Thanks,

Nirmoy

>
>> -    for (i = 0; i < NUM_PF_QUEUE; ++i)
>> -        kfree(gt->usm.pf_queue[i].data);
>>   }
>>     static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue 
>> *pf_queue)
>>   {
>> +    struct xe_device *xe = gt_to_xe(gt);
>>       xe_dss_mask_t all_dss;
>>       int num_dss, num_eus;
>>   @@ -417,7 +415,8 @@ static int xe_alloc_pf_queue(struct xe_gt *gt, 
>> struct pf_queue *pf_queue)
>>           (num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW;
>>         pf_queue->gt = gt;
>> -    pf_queue->data = kcalloc(pf_queue->num_dw, sizeof(u32), 
>> GFP_KERNEL);
>> +    pf_queue->data = devm_kcalloc(xe->drm.dev, pf_queue->num_dw,
>> +                      sizeof(u32), GFP_KERNEL);
>>       if (!pf_queue->data)
>>           return -ENOMEM;
