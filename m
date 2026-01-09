Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78A4D26D6A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 16:00:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A3C10E8F1;
	Fri,  9 Jan 2026 16:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NwQ6AMCD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B954B10E8F1
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 16:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767974404; x=1799510404;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xDKOtnZvVbz4e5rOKveFpPonym7oRmCME9o27VUL/+8=;
 b=NwQ6AMCDTwtbH8jiO5uUjLk8iB8iknDMlqWFW1vZwhvacnLoqARPerPM
 44Oq6SHmQs0bzmGbyFhpkFjdl+JgUlHmw5BxfwsL15FA6IrViC4L3gF8z
 BFZsME/M45LcQl9G/72iLTapOPbPyTKomiRV9sOie03IvsDoT7EKSUrNk
 PIofLTdTTdCUBIr2zYU6u5+cwWA0Z2F0qC/6iafn1v9UNyxDwWhRORNiW
 LjlkTxiYqMTU9Rz/MbamjqHG7G/2Oyfh98Si2IA/3mEv1DQ63SMiK86EM
 sOovWSrAmqzBTYyqlMncNDvtmjRQae+cCCgxVR+vSgWNiBGbvi38kTydt g==;
X-CSE-ConnectionGUID: hBETlxNGSg+7DRs3yW0J4A==
X-CSE-MsgGUID: iGnSWfn6TcWUcow405TG4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69289195"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="69289195"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 08:00:03 -0800
X-CSE-ConnectionGUID: C30sLFD8QnKm4lofARaGYQ==
X-CSE-MsgGUID: ECyXtC4kT+KIie0xMbn7AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="208026869"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 08:00:04 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 08:00:03 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 08:00:03 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.54) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 08:00:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sInMvIqnW3LU/0EOZyOU9DwG52JToyIN+15kGcWPh8hXd8iypKlPPOR6uH+A3hvZofyofYoYJ25N3WbAcRVmpm/OwW5P6PyDAL/AVh/xH282gnKXTW02Btgz4kiDo/vQ4mmWKBdb7m9NBb5YINTjJM86NLzTvl8APpNSJSpnJ54z9MUed2ftrtIxJ+n6zwi6/HN3bOuI3HrE/9idu4xFreazBvb6rX40sQ9MARVx5C3Dp/2Lwok9rjUo6P0EjcqYfzMFflqEi2rpSOzcJzV4sl3jn2PHhwyHmckxEiVHDotudpCQX4M4Qt1PsWjzjGH2YkPPJGZftF4k7Qhgyy6Ewg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+opW7OwcdLRWKcBZi3Ti4/iZ+qTx5kDK1H8L9hqRu2Y=;
 b=aqsXc/SwxxNMpNz0QE0G+Bd6qX3D8gLgS3MSqFzUxxPZ5mNbtnUX1zepf3AAawAEMdvNxGHW6kusWCfhzs0NLMIZGeeXRtvL64uLiAjjJUS0HJ45vMXbV+utGpj1Dv67KJnLSxcTOGNex7EqWR6GZrQBAB6wnY0q5xHShvp7XEw0pszgV7Uu4aXOAWoblklvfq0/GA6zkLm3iRabUSJ3WqDiCb+JsyNGi8vDH27XoJbvJ0NvPO20/DgG8Yy8FKXEYzN/E5iZk1YBR2tISLPQaC0o8rdlg7A6/62Uvd8WUXC88sE8V+JdX3V06bWFYid6jPr3QUVy23OO7HHDuNhiWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DM6PR11MB4674.namprd11.prod.outlook.com (2603:10b6:5:2a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 16:00:01 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 16:00:00 +0000
Message-ID: <35fe757f-4a47-4917-8ace-8fc497bd693b@intel.com>
Date: Fri, 9 Jan 2026 16:59:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/xe/mert: Normalize xe_mert.h include guards
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260109151219.26206-1-michal.wajdeczko@intel.com>
 <20260109151219.26206-2-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260109151219.26206-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P194CA0031.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::20) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DM6PR11MB4674:EE_
X-MS-Office365-Filtering-Correlation-Id: de729a29-4efb-4fb0-1cc4-08de4f9824d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WE5ITzFFOGcyTGtHbGx0K3Z5bXkxTU5zRk53VTR5aXYxaHl6a0R5NitvSFpE?=
 =?utf-8?B?cEl2Ung3ZXBhNVpJeGdSYm5ZbGthcHUweHNwSmVaNTloMytSZ2hSVzQ2NkJS?=
 =?utf-8?B?amEzQW13SGYyN0pJQmlPeGM1V1NxWkNRdDk4THQzNzcxeTRVZnV1S2xFQ3kz?=
 =?utf-8?B?M1NOM2llbk5QTklRVG1tc2Y2UWtaVld2VS92N212K2xwcnJpbm85RWtLNXNh?=
 =?utf-8?B?aTFESnB4Z0FjWlhkT0U3VUJKTWFBbmNQbFNqb2MyTmxWeEFsVmZnUXhyWnA3?=
 =?utf-8?B?YktsbGlhQjNJckxQQzVVeGp4by9iSktlS0c4dERjOVRWUGVQa1Y4ZUJkM0Vm?=
 =?utf-8?B?cUlnQmZjNXNJRXRWdHlvY2g0cDFndmpGMzNnK3NVRzc5Y1JqWmI0MU9OZ2F1?=
 =?utf-8?B?RmdoSU1yT2t1ZWswYmh5ZDU2U0R6dWdDSnhRaWYxZ093eWJGbG4rSHF1Y0o1?=
 =?utf-8?B?TmdYY3V6Q2xXRExINmlubUd4MUZOSHBZUTVpdWVCcUJ5cnNVVVVNd1Vmdmhz?=
 =?utf-8?B?ZXFvbmNkdDRvdmhzdTRBam1VVW9LS2l2amxaa1g1RjhDdGtiNDJTTk5MUDI3?=
 =?utf-8?B?dXg5SzhCVHRXTHdZdm1Pb2hoL1NZK3ZNb01xSXhHT21UWStlZldIWk9XdmxE?=
 =?utf-8?B?TTYrVENwdWNTUmdVcUdRQzBlbTZqSTgvOThHdEtldWJuZXN5US9TMTlSOU5w?=
 =?utf-8?B?V05GL2RBL0FMRGJGTWIydkRVM0FxSndNazNqcENmMVFad1MvazZKMEhlVTg3?=
 =?utf-8?B?azFvaUpUYWl2cnVzVXd3QlB1em1GR2M4NzkxVkdOd05uUWJucklBc2dHTW5Z?=
 =?utf-8?B?aTJ2ZE14UUxwbHJsV1FYcjhydlJEUCtMNzFMSGNweFJvL3NHWDlHbDd5d0Vn?=
 =?utf-8?B?ekFWMWVHaG1kZWtCc0hnUlEyUnFJM3ptVUtFMjdRT3RPd2g2b0JGRFlEQkwv?=
 =?utf-8?B?Tk1vWDZJM0wzQjY1OWRUYkEwSTNNK2FHRkJPamVJSWEyMVZhUkhvQWxja0Fa?=
 =?utf-8?B?UnowT2VFWFp6akFKNXVUTXlxcXhzYmtyZWFzd3pGV0tVWFVBb0FTWHlYWUVs?=
 =?utf-8?B?MnRIdGxRREJqeWd3d0pFRE1KL3l0bTZtUk40Vkh1b0V2WGtGU3QxdUZTTllq?=
 =?utf-8?B?TTdqTWpEMHRGeGVBSGlXNHV2Mkgxa21aL0NVZnJxWjkxeVh1NmlXREZSTmNV?=
 =?utf-8?B?Q1NoMDNWL1cwVWFGMDcyZjUwd2pzU0creE53U3JOaXpmeEpjbWhEL041K3dK?=
 =?utf-8?B?aFIvdTFuMkFGWnJPZWZUcE00ZjVNUFBvVkpyZ290aVVGelJuTmQ5NWo0Tkxx?=
 =?utf-8?B?OGNrM2svVUErclBFRzFHTXphSTBrTy9wQm5CemJwVzVXbk83WmhVbkZVWmND?=
 =?utf-8?B?OXJ3Y0daTE9TZ0ttcERYSU1YYlptSUsrdzB0MmpaUnVEaG4xK3QwN3gxVExN?=
 =?utf-8?B?L01JM01lbkdhaktDN1pHUGMvWXlLdVNlWitNcTVKZVgremIxemdZRjQ0dGxh?=
 =?utf-8?B?MmxGZE8ySWZjY0t0Sm9oM1NlM1lINm5GTnNYN2Erd29PUkhLc29wZUUxSFNS?=
 =?utf-8?B?Q0dQZGFWbEhMMXhNYm45TWFqcGtXM2Q0UmJWbVpmQkVpdmVLQ3IyVjc3Z2ll?=
 =?utf-8?B?VERuSHZSTTNjenVMNHBuNHVRRUdxdFJURkRpdVFxMnZteWRabDNmYnlrMTkr?=
 =?utf-8?B?cnFvWDM2QllTS05CS1JzK1JrUHc5TFB6QXNMaUhuRzFzdG9ab2EzSHNKdXZz?=
 =?utf-8?B?eThUSm53cEJUb21xamxQV2xXc3ZYbnFCMHhzaDBvaFo5ampaUEcyY29xQ0h6?=
 =?utf-8?B?MGkzdTloK0VYRHg1SjJYNzdvemhmNW56REwrR0Rrb2M4blBWeFgyRDhoMU5h?=
 =?utf-8?B?V25EeE1HNC9RZHhtVFlwSTlNR1U2S0h1Mndza0hPK3lKUGxicHVpaXpqRmx0?=
 =?utf-8?Q?4PEXBXTqcpV5dXlejNN+jECPJPjOIShY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHhKWW1EelY4cmYyNmtlQU4xcVc3c2FTTkM1Vi9MTm8wdHhuUXJvWFh5NVNU?=
 =?utf-8?B?K3RTaEF0VkFobGZnNTVLQW9rR0I4Y2xEeStzQXhGKzVaTFl4TFVRbTU2KzZX?=
 =?utf-8?B?UmljTUhFanlvUTFPSFZ1SWoyRWJjUkgvVTFJVW40TWxvTHJtSW0rdC9Id0F5?=
 =?utf-8?B?aGVxUHBPL3piNC9WWlBiVGxYa2tIVHJUYXUvUThZdEYrS2dQR2ROZHovVklx?=
 =?utf-8?B?cDRYcmVhdlEzdDlEaGp3VzhwaUxUZUpiR3dwSUNURVMzcmEzejhjQWdreE4r?=
 =?utf-8?B?ajFyNTVkc3QxTVR6eVJTTlRLdUh1YnBtUXA1M2tORFl5UFZUaDJkMmZEQWFI?=
 =?utf-8?B?OVZCb2FLTG44bWh6Mmg0ckFmdjZNTFdCTmpCUStnYkxiQllFSzBJQ3RLMW10?=
 =?utf-8?B?cnlwQ1picmV0VEViNk8yUWVDOHJzNFRJT0tHYUpsc1N3Y09vWDhmeGNBMGlL?=
 =?utf-8?B?V2VVeGo2Zkd3Tk9QelpzU3c5WEVGMFd1NFkyRDhjN3E4dHNQdGFoQUFHZUJD?=
 =?utf-8?B?c21MQ29pRzYyR1ZITnVoQVpXOXBoZWZHWGIxTWZBeGhtUWxRTVk5czB2b2ly?=
 =?utf-8?B?SVB5S2lFeUtaeCtUQW1RRlZBakdNTUlXanpLNks2UjB3d2tUdUdRczQ1eHZx?=
 =?utf-8?B?VDZva3hGdXhJSHZpZm05aHVsT3pOWW5ySTZGZk1pd0V3VmRWUUV2dkpFdTBX?=
 =?utf-8?B?S1hJbEJGVlA0bGROYlI5NUYyTS9KaVgwYmRhcndkWHZiWlRyUGE1L3pUUVQw?=
 =?utf-8?B?Sk5kaHlJOFAzOGZlL3gwSWZiSWcvSTVDWitxMWdIcWpQZWF4dDVNTFpRSXdZ?=
 =?utf-8?B?VkVrZWRhWkxyaXFNcUJ6KytseUJwS1JoR2hpZXJrQXV6ZGVYN3BUUzhXY0M1?=
 =?utf-8?B?Nk9BR1phWmVDQWMwbFRMY2s0T2RqYlJTMWF1SjRyTmF3RitBNmhpeUpaTno1?=
 =?utf-8?B?S1M4alFhdlNqS05VaTlzMkIrYVl1d1pUb2s0ZVU0YWhrMzhwOFVCbUxwVnUr?=
 =?utf-8?B?dSs4aEhkalZ1Qy90bktVelFtRUF0ajNabjBMaWZrQXA3ay9EY2JYSWN1bHY4?=
 =?utf-8?B?SURZckRvNjFhU2lTQnlXRURoR2thSmdBMEFoTHlrbERlSjdyUjVEOUl5YmYy?=
 =?utf-8?B?Uy9IaFhmbHE4bjhBajY2SDhqcFZHc2tON3pRSkt4R1M5cElTN0tMQnh5aWJU?=
 =?utf-8?B?QlAyamlINkJPK1FpdkVIOVEwWUlaVmJGaE1idEtPMC8xejc4K3V0ZDZwRmN2?=
 =?utf-8?B?c0FHZGZwMmsvdmhmanZTNHh6dk9aV0FvcDRzOU5zMGgxQnJhVU5raDVyR1lv?=
 =?utf-8?B?NWZJSytySXFlcmZwbmxQc0lDRmdjSEJxSjYycG9UOU9BRjlXblpleHBnK0JW?=
 =?utf-8?B?c2pUWUVqUnFLZSt5UEVYM1JYeVRiaFBKelcxWEJiZmp3cXpkMTZSUDhLaTJ5?=
 =?utf-8?B?WVNxaG12bVQ1eEZFaFkvbFJaRjdhK2FWKzZ1emN6bnc4WU11N1YreUQyeGUw?=
 =?utf-8?B?RlR4MG5ST3ZSQUNvSkNUVmdiZ3Vka3BlVEd0dEdsOFdnMnFHRXI1M2MzTERo?=
 =?utf-8?B?M1MrYlRzaFprMEdIQ1FKYVJVQ0FMdGZVS1ZoVmY2YWJyNzcvZis5Yjh0a011?=
 =?utf-8?B?bmh1ZTFwL3YrUFFpcEsyMzBpZDVMeFpPWndYMjlkUHpUUVIraDNJbnpQcHMx?=
 =?utf-8?B?dGs3bFpaVHdrdjh5NXppWTNkc05Mbi9rT0ljVVlIWDkwN0ZldSs0bXJxVnln?=
 =?utf-8?B?Nm5qYnVLU01mdXRtQnRjelZ1eDl5SStEZHlnR1hhTk01ZTdlRGMrdHc0c2k5?=
 =?utf-8?B?VFV4Y0M4Y2FtT0FmNk0yclhaalRGUjlWTmhuWFVNMnU3WGJvekJQQTBHcnpr?=
 =?utf-8?B?dFN3MEx2M1g3d3JHeThCZlMxRUxkUjlpZEdHYlJEdmlFdUVqWUFIU0tPS1pk?=
 =?utf-8?B?RUV4WXVGNGVYOUs5eVFmbXpoMlArOUZaQi9zQ1RpbWl1ejFNRmN5NTY5aHU2?=
 =?utf-8?B?T3cxZ3N2M3YrMS9wMDQ5UzExcitXeE9RaVQ1NFBDV0V5cTgvQktBNCtNeE5S?=
 =?utf-8?B?M3ZIcSsxZzhUTHdrWGVwZitRTWZXTGlYOUhqQk83ZG1sZjZiSFp3d24yVkdr?=
 =?utf-8?B?emZBQWhEV0l5cHQxVTh1ZmZQY3FHQWNiM0ZraXFzQ0drdHdmallrYjlzdmpT?=
 =?utf-8?B?UWxkd3pLOW84ZGVzNmhhcDdEcmd5QUUwV05LbncxWFlPNHJuZVdwSUN5cmJ6?=
 =?utf-8?B?U1FKb25DVTJWd3QvRDlpRHkra24rVWRRaXhHMC9LcE1OUWNKVElYVmc5NEI5?=
 =?utf-8?B?MUtseExMOWh1QU1UZllUWldoc244ZXhuYmNFaWoxL1k0QVpjYmtVZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de729a29-4efb-4fb0-1cc4-08de4f9824d9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 16:00:00.7297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+7s1+DElQcjreEGuYNfem4Vl/weva0BaMulOtyj1khY5XZfNuucrCJjsU/TaZ7c4d4rHIfJ23ZZ2gwA5p92Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4674
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


On 1/9/2026 16:12, Michal Wajdeczko wrote:
> Most of our header files are using include guard names with single
> underscore and we don't use trailing comments on final #endif.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_mert.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_mert.h b/drivers/gpu/drm/xe/xe_mert.h
> index 2e14c5dec008..0de8243e46bd 100644
> --- a/drivers/gpu/drm/xe/xe_mert.h
> +++ b/drivers/gpu/drm/xe/xe_mert.h
> @@ -3,8 +3,8 @@
>    * Copyright(c) 2025, Intel Corporation. All rights reserved.
>    */
>   
> -#ifndef __XE_MERT_H__
> -#define __XE_MERT_H__
> +#ifndef _XE_MERT_H_
> +#define _XE_MERT_H_
>   
>   #include <linux/completion.h>
>   #include <linux/spinlock.h>
> @@ -29,4 +29,4 @@ void xe_mert_irq_handler(struct xe_device *xe, u32 master_ctl);
>   static inline void xe_mert_irq_handler(struct xe_device *xe, u32 master_ctl) { }
>   #endif
>   
> -#endif /* __XE_MERT_H__ */
> +#endif
