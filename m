Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF176C021A4
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 00:34:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA38810E097;
	Tue, 25 Feb 2025 00:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FQT/nj1s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEE110E097
 for <Intel-Xe@lists.freedesktop.org>; Tue, 25 Feb 2025 00:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740443661; x=1771979661;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=VBm8+P6DEgl/eJzhfkz02I0OQ5iyneNCojLrkDlR/9Y=;
 b=FQT/nj1smo6ZRgYEPWDkgvEI2vpwCoOjNAn9me/09Oo5skPvzQ5p3gk1
 NqatiKjEugTdvqAx9D2A+aXIjI8RwqbQT0QZWOSQV5ErxnJF2hYkqoXta
 2dSZ0ayODc8ZXeEQr6CfPJ5HgHRpLg9Gi1PK8OYe74TevW6XH7IbUoVaa
 mQ+4I25c80L+7eKwKGG/6HTzrGAuiGnK1er0JqOZt3JP2J1BaTRlPt6D5
 BSB3B9JSYbQZ3E9886zMJUbAFgQgk5B+wyubIkxV+dl5NGjG1J051ussI
 gJC2IBZ4wr8tpEba3u8jLK50uoeMOQJBpRMAM+Cp+36ykJf5Y18URHVwJ Q==;
X-CSE-ConnectionGUID: jcPpyn64Rg6fNbhws4Cj8w==
X-CSE-MsgGUID: fGPlMmS/SmO2D8TlgP16Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58646237"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="58646237"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 16:34:01 -0800
X-CSE-ConnectionGUID: yMsacR4PTiq9WNpxOsldYA==
X-CSE-MsgGUID: dgxh2JRTQCeOi3m8N3YG6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="116420277"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 16:34:00 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Feb 2025 16:33:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 16:33:59 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 16:33:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJ7QQAcJSbURyIX629VqHhErhnlHSUOo5t6ybCxy1DAaqZ/nuXuDBRyDCVEUEVIa99whHyeEtMzPry0HLl/WhAOkR8hIL3qBn8QkbFvH20DpoF52PjfATWUhfQtbQQ4ogiZeIuWwtwZMyW4pR+fO9WMo/Rc9Ebx3yzSQoLpi3IoWqpIJafRjmatZvMVZhBihzpYl+L9hTMELj/wq4AbSobmsotLUE416Ph2DZiPLwveggerCSPqWV9MjNwskrsU+GYEfixq9aUvCgpdxlka8KHDtaFx28jg2A9rbBJt49CmKuG+0iWR87HWvzhhMXyg7Shzg2iLsZo7qr2YANA+0Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCuC6nqUS10fxLvsiS6x0533oyE5ICmuCXEQim/37Uk=;
 b=hFTu1pkRk+qlklF6GfrgzmOrsWw3HNR6hg1MrhD0lg09li+CB4pkH5Cy3wdbTsRl2J5mSIEFDs/ugmOHgJGpD0Ul4/kiHXPO7pb9OUsymu5T3DIPgoEtVVV9I5FmYOa37QWkHKAv+XA3OyewfcOX0T2nI33iKbMvcMGlJIEbWvxlLiQoSuVLlB/R2/SlYRKcm00Ls/q0hhQxMSxunZhSWcFQrRsTdf1WTX0D6jAMbJ5DQl7d/z+4GdHrCKBR+e2BXb2M0M0fgABVd4txOpTClSPCIm0OXJ3A0xLC7iL1AgClTSqa9XY9eboS7gjgfp6Mbe4MklgBqxVl5P6ELY/2SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SA1PR11MB6917.namprd11.prod.outlook.com (2603:10b6:806:2bd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 00:33:50 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 00:33:50 +0000
Message-ID: <211a23ab-e70a-4c81-9edc-590f61b714b5@intel.com>
Date: Mon, 24 Feb 2025 16:33:46 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/uc: Add support for different firmware files on
 each GT
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>
References: <20250224222124.59345-1-John.C.Harrison@Intel.com>
 <CH0PR11MB544452CED8E0D584B02A38E0E5C32@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <CH0PR11MB544452CED8E0D584B02A38E0E5C32@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0138.namprd04.prod.outlook.com
 (2603:10b6:303:84::23) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SA1PR11MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: 902aa9d7-5fb8-417e-f052-08dd5534132b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXlJQTl5eXY0Wm9ZcmwyMFluZHJyVkZSalZUUGdUa25wbTlJRGdhdFp0UG9N?=
 =?utf-8?B?dGhZckFudUM5NXVSSUNxbmRJMUNoK0dDL3cvY2g5UzUyNkJ1b2cycWh2c2FG?=
 =?utf-8?B?TmE3UTFUYWJhUHpoVmoya3hmYjV6a3V3YXd2NHFwa2Y1a29jQ0tMQlA2aHhH?=
 =?utf-8?B?cXBLcThLU0hLcG9EbGpYTElIKy9yaVpwVmdvWit1SENPUDlwQlRDcGM0L3ZS?=
 =?utf-8?B?bG1qRVoreFZpS05mQno1SFI2dkRyakJGNXVxZi9GNVZKN0wvTzhoZlJSZXNj?=
 =?utf-8?B?Tk4vVXBHcndSR1kyWkoyaE5oTVlxeUZZcFEyOHAwWmZDa0kya1pMbHNTRkFU?=
 =?utf-8?B?UUlmd2tJVnBmNDNtSW9kQTRaeE50RFdlZjFYZFEwU0NmRG9TODlncmRHQUJ5?=
 =?utf-8?B?WGpFQzNpekFmTWpWRm9WQTd4dDcyL1VKSG1uOHdwdDdGZSs4MGdxNnlsWWJR?=
 =?utf-8?B?alVaK3RsN2NhN3lka3hMTVlUTE5zWXJMTDNROTZuYTBUMzZWNlZ1NDZUTWFB?=
 =?utf-8?B?c1dpbmtOdC8raWNacElqNHk4YTcvUXlrTTRmZDI1UHgrQ0JmaGg5NTRCZ0VT?=
 =?utf-8?B?T082dE5mMHN0SzJiVXhjVnZCQWhQcVRHVTUxa1B4QVgyYU1CcEM0czU0NHdN?=
 =?utf-8?B?UWxJNHJvWkFCVkNKWFhPVlN6NzRQb0YxMnBJOTRPZ29sbHIvWW1WQndXK1Bv?=
 =?utf-8?B?TENBNlUrMVdSWlVUZFlkZ2krMUNnZEZyK1N3YjJ5WURONlR4VkVQdGRSQ0pm?=
 =?utf-8?B?OEkzQmFpaFpYYVpwbkFNWGxBMzZuSlVOU1dvb01IbzlBVGwwVUpFamwwNWpG?=
 =?utf-8?B?YkFuUHAxdjA2SHN1UGxKczNDTDdzZzkvM0dRWlpMQ2VaOWJoT2JYa3J0Z013?=
 =?utf-8?B?RGljU05NUmR1bk5sUzdEL2pvNXlxTTVoekhRdU45Ymd1bHdYcEprNTFQKzZZ?=
 =?utf-8?B?SnF4TW4wMmFod1pjV1orcjhTM1ZUUmt3c2RHcFdINDdLRWRkSDJVcUhaWXla?=
 =?utf-8?B?TmZtaXd1Wk9kMTdZTVpHdVVyNVplNmxrc2VobFRuUUYrT2RhMFFiNzBudnAw?=
 =?utf-8?B?NFVJei9mZjgvcGF2ekpoZGdIYjVzZlVFaDYzU0pXNURESHFQYVpjbUg4dHdB?=
 =?utf-8?B?WG8zNUZoWm1WN0VwUGwwMkJMUjdrMWdBSXZRbHFGNjVIdEwwY0R1TTJDckZX?=
 =?utf-8?B?Vkk1TWdBb3liNEw0dE1OWjNsZUtwRktLRmJUWlNZSllTdnJJMGZPKzJ0WWJ0?=
 =?utf-8?B?RTJ2NlIyTVJ1bWxQOEkxMDFoZkZMOVZpdlBBM2dKdHJSM1NwRDBSMGJhTTg3?=
 =?utf-8?B?RklpNkRwemh5QnV0SDdBcUZiZnd4SFpjQ25zczNOZFBJRTJhb0djVFMxK0J2?=
 =?utf-8?B?dDZPdlM4L3hiWmhCWFNMc1U4SndvaERTMlc0SnlaZnhjWEFPVVExMmQ4emhZ?=
 =?utf-8?B?TlZXSFpZZ0dNY08yNUhYV2RpY2d3elRIZDdwUkRSM3RQZWdjUVc0QWdtVGRH?=
 =?utf-8?B?Z2hsVUpWTWNDZEJ0M044Z1hLSHY3WHdxeEF6V1gyV0JQZGREZThScFFvN2E2?=
 =?utf-8?B?MEhVSFJlM0ZzU2QrWHArWGRQTXdDSWY0bU5nMS8rNURQTHAzZjFDMWJlNmV6?=
 =?utf-8?B?MnY4OFZhdkFocWxWRGNsV25qaXZYZ1RidEpOVWlzR2VTSm1KWlhXV2ZBMmhn?=
 =?utf-8?B?bTh2OU1LT1cvS0NQMHp5MzRlVFhSb1dvbnNGSE9KOWZXaWFCNVlkRHdMK1hZ?=
 =?utf-8?B?Q1VvaFkyTjBIa2Z6aVBRTU83ZVJqUHFrbjJzYjZjOVNkRG1DNnk5QlBvZTNH?=
 =?utf-8?B?QTE2MS9wTmFkc3NRT3dQS0M2Um55RXV6eng3TEZOQlNsdGRyVW5Yd3dFd2p1?=
 =?utf-8?Q?nxBO36mvdOcDM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eElFK0pWbmMwTUVLVkp6QTNTZ1htaHlyMXh2TlpVM2tLWnZiQ01SVEN0OGFS?=
 =?utf-8?B?ZnB3TGcrY0prNU1lSFo2cUQwSk1IeWhWZmoyOHRsUmlPOGFiRmdVcnBrUWhV?=
 =?utf-8?B?OVhZcDd3NVIxTkREQk5PM2FxR0x2R2hqZGZOaytWckxYeHlYYXgrbTFOZzJX?=
 =?utf-8?B?VWNpNnJZc2dVU2MvbjVhaFM1MTRFWnFwVGRUU0luK1I2NXB5R3RheEdEWEhQ?=
 =?utf-8?B?ZmlPRk5yVTAzRVhJMEFicjdJL2wvYWkvS1JxbUI4bUV1L2FWNmM3dmlTazQ1?=
 =?utf-8?B?b3FqTnc0R25RV2hTcFFmYlJKak01eGZoaEVJa013d3VMbGVzRHJWb3dWSzBL?=
 =?utf-8?B?ZWc2TklrVFVyMTladzdGUzZjUmVzVEVWeC9vMzExaHREeC9keFVnRGdKMGJh?=
 =?utf-8?B?T0tvSFBNMWxDWklyNVg1bUJKcU96Z0R3NUpWbjZPTytiTmlxTjBCcmVTclk4?=
 =?utf-8?B?bkZUWGc0SXVMSWhqNVNOVzYvYk1RLzk1TlF1dWp3UGZZZW8vNlpmZWU2VnUr?=
 =?utf-8?B?QTA2bUFqMkFzUFlSRG11U0ZaeW9YZ01mYWNiaHE4VEh6bWMzYVBuWWZGa1Ez?=
 =?utf-8?B?eDhqQ1NrTjdlZ3NiVHFablh0N01hbXFYLzRjaUpmeTZTem96WjhPQzZuZ0d5?=
 =?utf-8?B?VmREV29ENW5oKzUybS91WWc1T0pEOSsxbjNGazNOQkhRMy9FS1NmZW5GM2ZN?=
 =?utf-8?B?K05DWHhUV1hwMkRGSGovaHVuak40R29pTTZEdHhobFVqMEtjQjZQZHZLVVVN?=
 =?utf-8?B?bU9CbTZiVzNSRDF4UVZJcGJmdURhVCswSjNydVZLeDVEWld0VXZRUHVzVks5?=
 =?utf-8?B?SzlLQXA2WThadEFZVTEwdWNFYTQyZm04QXBtVXBCSWFXSld6OGlvQ0tXOWFJ?=
 =?utf-8?B?VFNEclo0bVRPN3BCd0FMS29EUFhuZVhRZE43WU50bmhibGhkNDVHbUc1ZFU3?=
 =?utf-8?B?TGtQdlJ4VzY2VjUzb3dZT1hxZy9uaFA1R0lOZDd0c1c3UGNzWVVhN3BFUW1V?=
 =?utf-8?B?dzdqdDlRVm9Ca1h2L1BXNjJnc3B1aHRTbm53VEJaeTNEU0JoR2xmcXM0M3p1?=
 =?utf-8?B?S1YrN0c4cDJ4NXhZeWlYSHVNR0pQcmZFNjRtN0U5d2o4Nmp2a1J1NGZZWDho?=
 =?utf-8?B?bUk5djJjanBDb1ZGUG43SzFFWFlLR21vWmJ4NGZGbllDU09TVFNkOUhlZ1FE?=
 =?utf-8?B?T09mR3pIWVE4UkVleThUbFVPZ05GTnMvOTFYTUVSbmNHTzZ5NDRiOXh4K2JI?=
 =?utf-8?B?dldFWExrTHpJMXc4Zm9ndEpPYzVoeWtBZTBSVnRhQ0diRDZRbm9CNVo5Q1Y5?=
 =?utf-8?B?dG5MakM4bm5NYndkaUVQTk10MUQveHAxb25JVW0xUlZ6SWNCRUhBRlNKTXR2?=
 =?utf-8?B?dW9qcHVTUmZOV1liY2RORFBucXZ5YjhVa1NtRTAxenBQRHpxdk1wbUttMUw3?=
 =?utf-8?B?aGM5Ri9XOGQxVFF1Q0wwYXI2NU5GY0Q4L2hXU1JRY01DL0VXSEZCZk1BY3ow?=
 =?utf-8?B?NjhDcXpMbVBXSjFpSkw2N1Jaa29NbHhCQks1TGpDdWFYbjRHV2lTa2VkYXo2?=
 =?utf-8?B?Q01LWTd0Qk1HNVVLbStBc0Q5cDlSNE1PM3l1TXNtR3dvcktIWUdoYWhkS1Fv?=
 =?utf-8?B?WWZPZHZ3cE9LMkpFNUlDbTVNUSsvaFFDdlVDYjdMak82RE9WSGl2L2lBZFNh?=
 =?utf-8?B?SzFoQytsalhGenlPNmVUUnRlNzdPektKTEFWejdJY3gxZnZIdkJZUDN0eGo1?=
 =?utf-8?B?OHR3WmJZT0pQU09Tb2ErYWlLeGdjbEU2VHYvcjdoa1F6Qmo3L251UFdXaDVT?=
 =?utf-8?B?N21FcndId1ZQSnhGSW5EUlJHZld4ZEFpdWpzQjJTeXAraWVhRWJaNVZKMm1j?=
 =?utf-8?B?R1lmTmF6dnhJUEVRVUJ3TEVSUi95RE1CeEhSNmxSRUorTVFzS3VWbXlHcCtV?=
 =?utf-8?B?Z0daWDIrdlZ4QTRFYzFDODJWMjVvMDkwdmN6MDRMekF4d3hnRU1pTjdFSmFB?=
 =?utf-8?B?cldsQ2RjMFdzMTFZcnhjV2lFUTBXckp6UkxkM2lYZk5Dd29kZVVKYTRYbjNB?=
 =?utf-8?B?RE0reUx6T2laSDM0dHZNbmM4TFNCbWN4bzJIeUt1d2QyRlJkOEp4RnNqUG5W?=
 =?utf-8?B?ZEtzV3MwU0g4K21uQXVTNVRXcWw2NjR2UzNXNU16REljY3hIOXVsYk1qVm05?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 902aa9d7-5fb8-417e-f052-08dd5534132b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 00:33:50.6491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hPWbJ3FeLOadMcjf1fWQVIVymHh12O9ToTseNPpQXczS7mZbWBsLYCR0ST6CAKi37rqAZPzXDaYKpDm/CkoF5UServuZ47aurEEFLztcbhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6917
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

On 2/24/2025 16:00, Cavitt, Jonathan wrote:
> Some minor nits below, but otherwise:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of John.C.Harrison@Intel.com
> Sent: Monday, February 24, 2025 2:21 PM
> To: Intel-Xe@Lists.FreeDesktop.Org
> Cc: Harrison, John C <john.c.harrison@intel.com>
> Subject: [PATCH] drm/xe/uc: Add support for different firmware files on each GT
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The different GTs on a device can be very different. So add support
>> for being able to load a different GuC firmware image that is tailored
>> to the specific GT type.
> NIT:
> Commit message is good, and we can leave it as-is.  Though perhaps consider this
> rewording:
>
> """
> The various GTs on a device may contain differences that need to be accounted
> for by firmware.  So, add support for being able to load a unique GuC firmware
> image per GT type, tailored to its usage.
> """
Not seeing how that is any different.

>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_uc_fw.c | 73 +++++++++++++++++++++--------------
>>   1 file changed, 43 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index 18e06ee9e23f..eb77528628f2 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -98,6 +98,7 @@ struct uc_fw_entry {
>>   		u16 minor;
>>   		u16 patch;
>>   		bool full_ver_required;
>> +		const char *gt_type;
> NIT:
> It seems like this value is currently only ever being set to an empty string.  I
> take it this may not be the case in the future?
Yes, usage will follow.

>
>>   	};
>>   };
>>   
>> @@ -107,21 +108,21 @@ struct fw_blobs_by_type {
>>   };
>>   
>>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
>> -	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 38, 1))	\
>> -	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
>> -	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
>> -	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
>> -	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 29, 2))	\
>> -	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2))	\
>> -	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 29, 2))	\
>> -	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
>> -	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 29, 2))	\
>> -	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
>> -	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
>> -	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2))
>> +	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 38, 1, ""))	\
>> +	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2, ""))	\
>> +	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2, ""))	\
>> +	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2, ""))	\
>> +	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 29, 2, ""))	\
>> +	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2, ""))	\
>> +	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 29, 2, ""))	\
>> +	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 29, 2, ""))	\
>> +	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 29, 2, ""))	\
>> +	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 29, 2, ""))	\
>> +	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2, ""))	\
>> +	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2, ""))
>>   
>>   #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
>> -	fw_def(PANTHERLAKE,	mmp_ver(xe,	huc,		ptl, 10, 2, 1))	\
>> +	fw_def(PANTHERLAKE,	mmp_ver(xe,	huc,		ptl, 10, 2, 1, ""))	\
>>   	fw_def(BATTLEMAGE,	no_ver(xe,	huc,		bmg))		\
>>   	fw_def(LUNARLAKE,	no_ver(xe,	huc,		lnl))		\
>>   	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
>> @@ -136,30 +137,30 @@ struct fw_blobs_by_type {
>>   	fw_def(LUNARLAKE,	major_ver(xe,	gsc,	lnl,	104, 1, 0)) \
>>   	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	102, 1, 0))
>>   
>> -#define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
>> -	__stringify(dir__) "/" __stringify(shortname__) "_" __stringify(uc__) version__ ".bin"
>> +#define MAKE_FW_PATH(dir__, uc__, shortname__, type__, version__)			\
>> +	__stringify(dir__) "/" __stringify(shortname__) type__ "_" __stringify(uc__) version__ ".bin"
>>   
>> -#define fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c)			\
>> -	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(a ## . ## b ## . ## c))
>> -#define fw_filename_major_ver(dir_, uc_, shortname_, a, b, c)			\
>> -	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(a))
>> +#define fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c, t)			\
>> +	MAKE_FW_PATH(dir_, uc_, shortname_, t, "_" __stringify(a ## . ## b ## . ## c))
>> +#define fw_filename_major_ver(dir_, uc_, shortname_, a, b, c, t)		\
>> +	MAKE_FW_PATH(dir_, uc_, shortname_, t, "_" __stringify(a))
>>   #define fw_filename_no_ver(dir_, uc_, shortname_)				\
>> -	MAKE_FW_PATH(dir_, uc_, shortname_, "")
>> +	MAKE_FW_PATH(dir_, uc_, shortname_, "", "")
>>   #define fw_filename_gsc(dir_, uc_, shortname_, a, b, c)				\
>> -	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(b))
>> -
>> -#define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c)			\
>> -	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c),			\
>> -	  a, b, c, true }
>> -#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b, c)			\
>> -	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b, c),		\
>> -	  a, b, c }
>> +	MAKE_FW_PATH(dir_, uc_, shortname_, "", "_" __stringify(b))
>> +
>> +#define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c, t)			\
>> +	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c, t),		\
>> +	  a, b, c, true, t }
>> +#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b, c, t)		\
>> +	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b, c, t),		\
>> +	  a, b, c, false, t }
>>   #define uc_fw_entry_no_ver(dir_, uc_, shortname_)				\
>>   	{ fw_filename_no_ver(dir_, uc_, shortname_),				\
>> -	  0, 0 }
>> +	  0, 0, 0, false, "" }
>>   #define uc_fw_entry_gsc(dir_, uc_, shortname_, a, b, c)				\
>>   	{ fw_filename_gsc(dir_, uc_, shortname_, a, b, c),			\
>> -	  a, b, c }
>> +	  a, b, c, false, "" }
>>   
>>   /* All blobs need to be declared via MODULE_FIRMWARE() */
>>   #define XE_UC_MODULE_FIRMWARE(platform__, fw_filename)				\
>> @@ -227,6 +228,7 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
>>   	};
>>   	static const struct uc_fw_entry *entries;
>>   	enum xe_platform p = xe->info.platform;
>> +	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>>   	u32 count;
>>   	int i;
>>   
>> @@ -234,8 +236,19 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
>>   	entries = blobs_all[uc_fw->type].entries;
>>   	count = blobs_all[uc_fw->type].count;
>>   
>> +	xe_gt_assert(gt, (gt->info.type == XE_GT_TYPE_MAIN) || (gt->info.type == XE_GT_TYPE_MEDIA));
>> +
>>   	for (i = 0; i < count && p <= entries[i].platform; i++) {
>>   		if (p == entries[i].platform) {
>> +			if (entries[i].gt_type[0]) {
>> +				if (gt->info.type == XE_GT_TYPE_MAIN &&
>> +				    (entries[i].gt_type[0] != 'g'))
>> +					continue;
>> +				if (gt->info.type == XE_GT_TYPE_MEDIA &&
>> +				    (entries[i].gt_type[0] != 'm'))
>> +					continue;
>> +			}
> NIT:
> There may be value in breaking this block of if-statements into a helper function:
> """
> static bool check_skip_auto_fw(struct xe_gt *gt, const char *gt_type)
> {
> 	char tag;
>
> 	// ASIDE: Probably unnecessary check below.
> 	if (!gt_type)
> 		return false;
>
> 	tag = gt_type[0];
>
> 	if (!tag)
> 		return false;
> 	else if (gt->info.type == XE_GT_TYPE_MAIN && tag != 'g')
> 		return true;
> 	else if (gt->info.type == XE_GT_TYPE_MEDIA && tag != 'm')
> 		return true;
> 	else
> 		return false;
> }
> ...
> 	for (i = 0; i < count && p <= entries[i].platform; i++) {
> 		if (p == entries[i].platform &&
> 		    !check_skip_auto_fw(gt, entries[i].gt_type)) {
> ...
> """
> Just something to consider.
> -Jonathan Cavitt
Not seeing how that is improving things. If the types of firmware 
balloon out to many variants then sure, a helper would be sensible. But 
with just two, the helper is more lines of code than just testing inline.

John.

> 		
>> +
>>   			uc_fw->path = entries[i].path;
>>   			uc_fw->versions.wanted.major = entries[i].major;
>>   			uc_fw->versions.wanted.minor = entries[i].minor;
>> -- 
>> 2.47.0
>>
>>

