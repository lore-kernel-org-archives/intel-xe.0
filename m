Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACA7C27C53
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 02:26:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC8A10E2FB;
	Mon, 10 Jun 2024 02:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I9WqKiK6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DAAF10E2FB
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 02:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717986392; x=1749522392;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=VN36isFlIhmIOVl2wksS1CsOTfjIuz8dPRgxbAzDoG4=;
 b=I9WqKiK6+RUPEkNtBrMbCVFIaV93WJkjl1e2g+4eS3UJ3pH0mpZd9rcS
 Yl90FnH1zUGV4kCp/Ygv3p+CpvfRU/xgYsLbVdUQJrWz2Y/4HPSKlwBSI
 tePAbJQ6ntCjMpDffAbLSXVVk7owFJxS61+eIPJLRBeBSrf396+QW4/EI
 0krrsIuXVhdA42QWtNtixyZdAfCvCvUyTelJc05EqlelemZbgxjb1xAE/
 iP40KnilhEWzyDzhOmgLcejw6U+y1Ajvr0YEvkaNB7oBOHwPLESIPNJrR
 qYeAGb90as3Gr2Z1guwGno58X/b568wfeKz1Lx6LYUgLaxm5lvwxRxIMF A==;
X-CSE-ConnectionGUID: e6uQzmGNSzmwR+CfwP3sow==
X-CSE-MsgGUID: UmzbnwkrT1C9SWjwphWUZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14368632"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="14368632"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2024 19:26:26 -0700
X-CSE-ConnectionGUID: i+x/uZ+nTnyU2KbPbxlRmA==
X-CSE-MsgGUID: dTNBr1AUSy61itODXsodjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="38916657"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jun 2024 19:26:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 9 Jun 2024 19:26:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 9 Jun 2024 19:26:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 9 Jun 2024 19:26:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 9 Jun 2024 19:26:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mox22swziPfMZBksaY6XXZeHxJ7SaGkL5dt5ppXzEFC/6z+5XBdvTBEkvoBhrQjjqYabOBx+HONa3tIXJmBjKcouNARINjx41pnSaGaYDWKpjLNM9sJkBZMrlhp1RWljaqds3jmnrIvp7oDlam+Y3cgUQn0mZ1nVq2cKD68kZ2iEhOqLS18jOsa7iisNmeLA/BZISvNOCErIag5Q4EslyUr7cEfrTzftpc7vYCzig0yzCXsgZTBWDXUnZ0NrfJ4fyldn5RqGLWHrZc7Ms+xTPsox8MlvCwM+p5EaUEnWRLDz+bcLP3UyX8jabF/CQEqCwapbGC0Jpwt1LwJ6RmtaLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vm/i5FyuzqSGi3gEN4Isj2rttd+DBVjqNQhxHS5/2xE=;
 b=RpljvsyM0jbhj1B5Z2ow5meMwTE8zPONkSWAtz50tV1MzLl76lzzlAVS7kvoRQ0QHm4rN/2H9O8qyaWzXQzJf3LdmoQqp8plGcIjiwGrfFv9B1+1zlXM9zTv0Nno9ZHCY9gGtN5SWp6P/HwUF+AgcC9SVESeZaZqvst/5uZPsEttykWgeF+lhOzyCpfjxr9NaK1LX5VjFWkNP0VejNCK0uA+tPf0pgdIZINZ57P+4FCUTnZEKgJTaI7ceaj66IfNUeYUFhYLnEA5yd2zYxk7zXh9eZyJJSbyYSD1GI2wOBQ8jFaZfXFDCdDm/WfijLQ0215UVm/14Nd5X0HcUpMChQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by MN6PR11MB8195.namprd11.prod.outlook.com (2603:10b6:208:47f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 02:26:23 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 02:26:22 +0000
Message-ID: <6f5329be-5c24-4a09-996e-25581499d72c@intel.com>
Date: Sun, 9 Jun 2024 19:26:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/guc: Move H2G SETUP_PC_GUCRC definition to
 SLPC ABI
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240609181931.1724-1-michal.wajdeczko@intel.com>
 <20240609181931.1724-2-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20240609181931.1724-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:a03:333::20) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|MN6PR11MB8195:EE_
X-MS-Office365-Filtering-Correlation-Id: 43090627-1ed3-4e51-470d-08dc88f4b839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bCtuazZURTkyOWY4U3ZMQzEydWdjQkVVYXlFQ2ttSm9rZXIwVFR3WWxFY05O?=
 =?utf-8?B?SW91SlJSOVhXWDFuMXBPVVpJbkF5SGNrU1M3V2FzcW84UXpxQ1ZxOFBTbWlC?=
 =?utf-8?B?VGxsSTdSbkg2UEJFMDA5N3BMQ0pZbGM5UzdpOUk4SVYzRENUYXhoUTZKQWVI?=
 =?utf-8?B?U2NQVjlQbG9vczBTTHU1OUhncTZ2R1hiUVNLTjZacTBpalF4M3Z0SURWenBv?=
 =?utf-8?B?ZTE0MWhJdXR4L09XNlJubDNmamQzNk1vTE1qdkJQNnRSNS9BYms1OER3V3M5?=
 =?utf-8?B?bE9vSFRWYTRzYSs0UEMwMFRMTzkwckdNS2xNYVcrRTdGdlhDWGl3Y1A0Vmda?=
 =?utf-8?B?UVN4U2RIMTZZeGEzN2pYQk9oTWp6aUdKckNCYld1enJ5bnh0SVlHWlBkOXkv?=
 =?utf-8?B?TEJONnU5WUdLT0VxN0NXTFR0QUFPSEZWWVN5UEhyMWhsWkc5TTBTbWQxeWV1?=
 =?utf-8?B?ZDBSMWRoM0NNMnRRTkFJalFBeHpOSC9LUnN6amF6dzFhb3VJK2I0a1c1cWxG?=
 =?utf-8?B?eVpRU3BZV1M1ejJLemUzN3IvUm1QS2JPdGM2NndyZ3k4cEx6S0tVc3RCbkxB?=
 =?utf-8?B?R2xDNVgvdFltNXdMdXB3UFhZdUJnZkZkeUFxVExnVDlRdUxTQUVGTGFIcFVP?=
 =?utf-8?B?dTVTb1ZMRnNwZVRuOVFSNnlqVVduVlpJWVo5aVF1YUxMdU1Gckprck9GVkFG?=
 =?utf-8?B?SlhKblJ4M2VYTkhTcHhYUDZSRzRxM3hQYjlkeUJWcXdTZmRCc29sNlQzc3g1?=
 =?utf-8?B?RFQ3U0oyMmNoMit1a3hpY2ZNZkJONkZaSlNadjRZekJPZ2R2Q0grTHU5aG5m?=
 =?utf-8?B?ZDhMSks5aWVKRmh5MXZUd3RQV2sxT2J6RUczR2haT3pLcUVlMzFESG9QdHow?=
 =?utf-8?B?UXEreTNVRldFNGlJUXhOU2MwNThXZEx5NzYyNmNHZ20rUHZnelhMWTh1c0hr?=
 =?utf-8?B?WVMzQS9OcnFkYzh1TXVUcS9TN0pVVXRIand3QkpkaFhZb3F4aElaVTBNWUNB?=
 =?utf-8?B?SG5NeUovTlZ4Ym1rdWhWTy9nSmJpRG9KNFgrUzUyYmpyeFpEUlMvOFlEZUYr?=
 =?utf-8?B?TXlZS000R1RhcU1hNklLUXR4R1JVVzVZV3hyZkx0bTJHa0hQQXdEd0pndlFI?=
 =?utf-8?B?T3RveVRXaldqOXNIOUNJQkN3VGxUMDZ3b2QxL0FnVWZqRG5WT0Q3UHMyMFo4?=
 =?utf-8?B?SU81bWpqM0IzdTFhcy94a2pObDRYMmN3c0UydW10UXo4VWtIcURLbCs0YWJy?=
 =?utf-8?B?cC9QcW9TTnFKYlNidGN6eEwxRHBXV0xUVDhRSEdSc1ZuYWJWblBHekU2N0Ru?=
 =?utf-8?B?c3EvVjFETVNQdGZSWVNkWFZvK3dTb0E2YlcvUzdQWWV3eE1ReDl0ZkRIYytu?=
 =?utf-8?B?QTFYcm9PbUhMUWw2Qi91aklxdE5JckVoYkM5Mzh3enBXT0tIT2J1TXhVSUt5?=
 =?utf-8?B?UGJJcEMwNW9jMUdVbWd2WHRxbnZ0ZGNwbWFpRytNK3ZMWXF6eEV2VEQ2NEVU?=
 =?utf-8?B?bklneUNySFZlcVdVQXZPcTI1ZFdoU09RTlJiK1FIZnUvTTB6a25aK3h5QzNR?=
 =?utf-8?B?a0lLaW9RMFpOZzhIS290RFIvOGpzZ1lHSFRFcU1qeENoTlExU1RBdDR1QXNM?=
 =?utf-8?B?cWNNWjc4NXhoYWtCN2xnVmVIYjVBS2FKZndFZDJ6WU5YUG9qYlN5UWpmWEdj?=
 =?utf-8?B?SWdrN1lnN2JWdjRxWVNGMjg0ZGMrM05mKy9LRkxFMlhsWVcvbkRGQkxabWRr?=
 =?utf-8?Q?rgI0cYfQOC8DZeRVsnx0gETXKxTvKkXGe1GuNJ/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Kzl4aDR2VDhsdGlVWnVtaHBOZkIvZ3NJN0JkdEdpMVMwdVhRUmdtMHJrODNV?=
 =?utf-8?B?eDlFVlU0N1JaWkl2cndxck1EVTlaTHNPS3YyUjVWb3BMZnJMSWYrbmJOdHF5?=
 =?utf-8?B?bjd6UzBnRjN3SEQvK1puSlorUkQrb3NNRkQ4RzR3emNydjExNlRXL3E1cmZZ?=
 =?utf-8?B?a3dZMDZ4S2ZwMi9aalhLV0RFWms4ajZtSFlCWFNUREl2ZVMrNXlwVnFrZmds?=
 =?utf-8?B?SElVUVBEWHJMMjk1dzdqZjF6Ykx0RjV2cHNNcG1NYVI5NkU5dEpiTlVvK1Bt?=
 =?utf-8?B?VmNXdFlTY01FamloT09FbEtOeTVtdXFPRFJ5Zy9sanc0NSsvZ2dsQ1J1a0tD?=
 =?utf-8?B?QWtkTHdPNnU0RmZadDJkVTR5M2NOVkoxeWt6Z1c2RGRHb2NrZXZmUDRpcTJO?=
 =?utf-8?B?QUxpeG9BWnFHYlo0Y0VpVHA5SGJXZ1RzSm9OcjRDTFoxQ1Z1OS9wY1JYVXpS?=
 =?utf-8?B?ZFhXVDRJK0l4ajlzZlJlM0I5encwTHlRWVNockVjazJwenl4OUdxY1FzMTdx?=
 =?utf-8?B?azFTZVdHbWtwYnJBaEZDZGtnb2ZGV1UzejJzd0lNT1BoSjRhOGJiWVJqTlVw?=
 =?utf-8?B?S2k0SzA0Smp1RkFaSmlUSm5pQmxXVXYxYUVTTFFXMXRqYXVhVVdJZWI2SG91?=
 =?utf-8?B?azdmUzhBT1U2S3RTNVloaU1zTGkzSVRsamxWUk1UK2dqUTFuTS9IVlRTeW4r?=
 =?utf-8?B?SnoxMTNEY1AxUWdCUENQSVhwVE5KUVhaTUVYaTcxL0hHc0JSUzJHTlkrZXd5?=
 =?utf-8?B?WE9uOHFITm56VmdEaXBycTkvdmo2KzVIUVE3VGd3dnB0dkdMWUg1eGQyVjlL?=
 =?utf-8?B?ajV6Y3hOZmNuand4cmNuQ1RtRU14Z25DaHVyY0xBQm1ONVF3cTlwV3NaVnZK?=
 =?utf-8?B?ZEFXT0Y3R0hwcU9GeVVWbWFrTUFXYldHY2gyelM5VUg1U20zaDlOeUtuWUtv?=
 =?utf-8?B?SU1LMlJQalNyZCtxVVJxRFdyMlZmK2o1R1BEV2Z4TGltbXYxenhnWVJWOVdD?=
 =?utf-8?B?b3B0S3NMUVk0VFc3NjMvb3hBa0FhWGtkYUVidEdyZGlTK2tlcnlrTnlTSklh?=
 =?utf-8?B?WE1CUTRWYzN6d2xmTEVVdlBVRmlNR3BNeGtjMlpQbEc0S2d0VGNmdERhT2tR?=
 =?utf-8?B?K25iN1g1UUIvQkZMc2M2VCtnQXlPWkFNVklyWGFWbXRSNG5ieXpGZVpnU1FN?=
 =?utf-8?B?dkhwMTg4MGhmN0p2d2l4WmJMUDdPU0xZMVlTVVA5WHVVWFFVRjlxM1hoZGNG?=
 =?utf-8?B?cmp6UTlSMUpYeVBsM3dUbXlBM05zZ2M0bE1Sd0x3QUY4Vi83aCtPa0N0WWJZ?=
 =?utf-8?B?WDdBbXIvc2ZyZWo3cVpERENKQVd0MFR1c0tsNmpRMmIzTHlsZFprRnV6MXp2?=
 =?utf-8?B?aU8zSlBmc0RwOFJMM2duUUhCTksxcHI3dVNzYXZYQXVnNTQvcThBWVExRFNm?=
 =?utf-8?B?TDNtYWdrSXFYK0ZDaHVNeURMUXE5NXR5b3JWbmt5SFM3VnhjTVdSVGRkak5O?=
 =?utf-8?B?YlpHWnoxREFXNWpNMjdoZ3B6SVlqbTVHS1M0emlrNjcvNFErVUZSUDN5cXd3?=
 =?utf-8?B?dzA1dVExQkdTdGJkRUJIRGZOdnJYZ0ZZOTBCTnpGZ1FmVmc4TVpRei83dHlu?=
 =?utf-8?B?VXVHRjZEang3a1ZUY1NwSGlwL2V3cTQwd1ZEREVCVXoxNVdyelppTWZDTE4r?=
 =?utf-8?B?WFJrN0dIMGlJUTR3VUZmN3d5YytnT2p2U3JHT0kzUlNPVlFPVlp1VW02Y0Z2?=
 =?utf-8?B?a1MzVWUvTnMweEdSeXhzbEpLSVgrdzI4UWtmZjVRMllYVTlnaFovS3NPNDlP?=
 =?utf-8?B?VkQvZFNvemF2Qi9kOVB3dmg0bUoxOGdwWEJ5a1pwcDBXOWpNc096bFI4aFFE?=
 =?utf-8?B?bmxHOXBZNjN4K3Y5elliN0MrRnI2MHVGTGdFS1ZBQ21KT2pFcFpzdHlsbXhV?=
 =?utf-8?B?NjQvVzZuV1JuZVR2dzhJbGUveDNKWnJXeFprUEExdGNJQXFJbWl2bnAyV2Ro?=
 =?utf-8?B?V3hBZXFJc3Y5U0cwREhINFI5RjRhZHR2YWxtOUJBeUFVb2hKUHJuMTU3QnhX?=
 =?utf-8?B?VGp2NUlpNUdHcHptRGZBbXMzVGt0b3drSHZ5Y01zMWNUNzNKR3U0N1dKUzBQ?=
 =?utf-8?B?cmpaT3RyWnkwZmd4QnFjOXBaR3dTQWd0aXBvMzQ1b01LYzlZZUhHTVc3T3Na?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43090627-1ed3-4e51-470d-08dc88f4b839
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 02:26:22.5101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wt48r54iwMjiSCLaxbDJv0cV178oWxEWSUAhNN3pu1iTQ9RyHhfIpJ9/qmSJGXrNEVDSqcWGwPdID4QZn3fmJC5MlkHuFpwSvPDbjaX83R4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8195
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


On 6/9/2024 11:19 AM, Michal Wajdeczko wrote:
> We already have a dedicated file for GuC SLPC ABI definitions.
> Move definition of the SETUP_PC_GUCRC action and related enum
> to that file, rename them to match format of other new ABI
> definitions and add simple kernel-doc.

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_actions_abi.h      |  6 -----
>   drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h | 22 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_pc.c                |  7 +++---
>   3 files changed, 25 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index 79ba98a169f9..43ad4652c2b2 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -128,7 +128,6 @@ enum xe_guc_action {
>   	XE_GUC_ACTION_CONTEXT_RESET_NOTIFICATION = 0x1008,
>   	XE_GUC_ACTION_ENGINE_FAILURE_NOTIFICATION = 0x1009,
>   	XE_GUC_ACTION_HOST2GUC_UPDATE_CONTEXT_POLICIES = 0x100B,
> -	XE_GUC_ACTION_SETUP_PC_GUCRC = 0x3004,
>   	XE_GUC_ACTION_AUTHENTICATE_HUC = 0x4000,
>   	XE_GUC_ACTION_GET_HWCONFIG = 0x4100,
>   	XE_GUC_ACTION_REGISTER_CONTEXT = 0x4502,
> @@ -153,11 +152,6 @@ enum xe_guc_action {
>   	XE_GUC_ACTION_LIMIT
>   };
>   
> -enum xe_guc_rc_options {
> -	XE_GUCRC_HOST_CONTROL,
> -	XE_GUCRC_FIRMWARE_CONTROL,
> -};
> -
>   enum xe_guc_preempt_options {
>   	XE_GUC_PREEMPT_OPTION_DROP_WORK_Q = 0x4,
>   	XE_GUC_PREEMPT_OPTION_DROP_SUBMIT_Q = 0x8,
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> index c165e26c0976..85abe4f09ae2 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> @@ -246,4 +246,26 @@ struct slpc_shared_data {
>   #define HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC	(0xffu << 0)
>   #define HOST2GUC_PC_SLPC_REQUEST_MSG_N_EVENT_DATA_N	GUC_HXG_REQUEST_MSG_n_DATAn
>   
> +/**
> + * DOC: SETUP_PC_GUCRC
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_FAST_REQUEST_                            |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | DATA0 = MBZ                                                  |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC` = 0x3004      |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 1 |  31:0 | **MODE** = GUCRC_HOST_CONTROL(0), GUCRC_FIRMWARE_CONTROL(1)  |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +
> +#define GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC		0x3004u
> +#define   GUCRC_HOST_CONTROL				0u
> +#define   GUCRC_FIRMWARE_CONTROL			1u
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 508f0d39b4ad..b57207bb1f11 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -9,7 +9,6 @@
>   
>   #include <drm/drm_managed.h>
>   
> -#include "abi/guc_actions_abi.h"
>   #include "abi/guc_actions_slpc_abi.h"
>   #include "regs/xe_gt_regs.h"
>   #include "regs/xe_regs.h"
> @@ -195,7 +194,7 @@ static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
>   {
>   	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
>   	u32 action[] = {
> -		XE_GUC_ACTION_SETUP_PC_GUCRC,
> +		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
>   		mode,
>   	};
>   	int ret;
> @@ -758,7 +757,7 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>   	if (xe->info.skip_guc_pc)
>   		return 0;
>   
> -	ret = pc_action_setup_gucrc(pc, XE_GUCRC_HOST_CONTROL);
> +	ret = pc_action_setup_gucrc(pc, GUCRC_HOST_CONTROL);
>   	if (ret)
>   		return ret;
>   
> @@ -861,7 +860,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   		goto out;
>   	}
>   
> -	ret = pc_action_setup_gucrc(pc, XE_GUCRC_FIRMWARE_CONTROL);
> +	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
>   
>   out:
>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
