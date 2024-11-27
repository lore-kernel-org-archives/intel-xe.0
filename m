Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA4DD609A0
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 06:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB5910E0E5;
	Wed, 27 Nov 2024 06:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JbfSMxGv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8798F10E0E5
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Nov 2024 06:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732688549; x=1764224549;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=epxJq3J/omhc+6WxBq+ra1BY86lNUBXv2yJyzuqyDYA=;
 b=JbfSMxGv8YPePZLAntq1klZ29w1aY+IWBJgxbACkO61hioZwje7NXLKt
 BP9xYuH0JDuxfNprG/44PcKglkVdqv3UYDFyUS2wn4WJ6e/3RAeuMfct8
 74EPtHNBKR4XbWW7mgosEDMhGKwkji6nUWwxMKMONuPp0mA1At5KuBhb0
 Pl6+MQVxJ3MddoAdnb+yQBOgte8HOrEQgrywtZrZEh7H7T92y9f/nFFFg
 Teg22LvX6hsPT6WojEcYwDiqlikBVhDajoHaoYn/WZkqnkGkvNlV60qBw
 yEJtE8ndvprJz0ikXdp2qUsVaHgKNCObj2ZoCwMWt4dMTBWBAnbODWu8N A==;
X-CSE-ConnectionGUID: /gKvWBaHQ46S5c527wue8g==
X-CSE-MsgGUID: IFIH4X72T5ql3+JaRQ8+RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32731751"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="32731751"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 22:22:25 -0800
X-CSE-ConnectionGUID: T5WBSqjUTFWGxzW697eeTA==
X-CSE-MsgGUID: R0fwWhFQTmWIP4/w/f/aKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="96595280"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2024 22:22:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 26 Nov 2024 22:22:24 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 26 Nov 2024 22:22:24 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 22:22:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zWg13VuOKsHSaEJgmJ61Sr7V3PVIIRstR+4Vo1YTfTpEyhjRePPGdVJsfXges9vrt40IBvBNqPyu7b/cO4UmiQTXW+JvfMPsx7nywf7osNUQIyv2YZlj1E7pADNaeCNK7xwzo/BLUgRON260wjy6TO0KTKfl91xjQcCrkgYbpgGQAucRSWWF++JG9qQAb1cgVETP1iJugKLKZwEibz0/21AcplXOgMqkQLdc6NkjZxqEt9hAnSq76Oe62nZugjpgLshVINys3ZRKSkagxF5KuKvuK3T4GZkGBxh4bTJ5UO2u+XTi43JNuPf5ph+ez5uQFWqtS8myh+dlaF921zRZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUWH9AdyXVMwkpRpvXKznbCX3RG64WGYI7eT+9kzhAQ=;
 b=gJ/G3fddfUpbJTQ7ddEMrMJjngP5fVynYvfQ/5sUNswcnfHhlS35VUkgESP34TyAh5hLqWPvicbGyROmvG4662x5SxOVu7+75YUzIT73eR2AqIAbKhRRz5yCjJ33xuGAuu54rNaNz8efqBrIf4TGX0G1sOeoPYCU77lrSGMzlHfambw/YlVGbQTcilxabsTSl2THaYi3rvjKetluUlwBBo98TB9IoBwDmN4NW7GBc3fSMGaMfCtZ57xmzNFAf8BzOuqtLIojlFG3ILAUZfmXeK+lhEqxASwn70OCyh1JJj5qFHlazR81ALDjZLKHbXpVwhUtsgWsSB+ZM0fHvQSDpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB7251.namprd11.prod.outlook.com (2603:10b6:610:147::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 06:22:21 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8182.019; Wed, 27 Nov 2024
 06:22:21 +0000
Message-ID: <c857ba22-3e1b-4064-b7b5-c1c5fd10e557@intel.com>
Date: Wed, 27 Nov 2024 11:52:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe3lpg: Add Wa_16024792527
To: Gustavo Sousa <gustavo.sousa@intel.com>, <apoorva.singh@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20241107082158.1436637-1-apoorva.singh@intel.com>
 <173109327019.7597.979644287484911342@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <173109327019.7597.979644287484911342@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::10) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB7251:EE_
X-MS-Office365-Filtering-Correlation-Id: ad90e39c-a90c-4b56-f382-08dd0eabd9e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MG1aQy9yUzQ3em0vbnhTbkI5bys3NFp5NFJzekNpMXdGSWlJTEtqVng0M29M?=
 =?utf-8?B?TFpRVGhxbVhWNFNOby9sc2p2TE9XNFBZcXVmUEVXVnh0VzlIWlF1OVdVbmph?=
 =?utf-8?B?anhCdFBWd2l6bFhReFJnRnJsSStmck5hb012VEJBUVNtVEdPcWthaTRFalpF?=
 =?utf-8?B?VXF4SjlVOXFZY3VHTitEVTFVUDN4Y1UwUm5ua280bldMVldEbVYwc3RLUDdE?=
 =?utf-8?B?ZkxEekhaUlRPb1EzNE1sNVFTSGJZaE1zWHFMWGEyL29lTkplNk1YcDJNWGxX?=
 =?utf-8?B?S0ZnTDg2bGdlVER1WFJKNzR1ZE5CRDBJVFlPS0NrWVZwUDNScEZEWkcvajU5?=
 =?utf-8?B?ZFdydU5iRDZ0Y3VFOXJETXlzalFvODErdmx2OU1ZTHJVT0YxaFI1c1Bua2dD?=
 =?utf-8?B?TEwyUWtqUEJTRUFKNUZiV0x5b05xVnhaYURqSFVRSUFCRkRGSnlhTW1uRk9m?=
 =?utf-8?B?SUxrVWJFQXNMWitsNi9Vdnc2ekZtazFZZmt1dFpDVmdhd2l5SkNTRjI3eVdV?=
 =?utf-8?B?TlcyVEk2NVoyOHRHOFd1SmZoZHhKckR5dDMwYW12OTd5Zk5FcGFiRFhQV0xK?=
 =?utf-8?B?N3kxS0ZPZUp3RDRsQ1pvWHJybnFvbmNGek1GZ2Y1V1FpOFhRM2kwTC94VzVC?=
 =?utf-8?B?WHcyL3F4MC96bWtmalhzYUNFdGVBekJ6blY3NGNEeWVjTW11Nk1lMFdxczFH?=
 =?utf-8?B?MUFGMmxxY0NTUmVzV2VwS3c3Zk5EUDNLVFl0Mnk3QXI2UXBobkJ5cmhNZmJp?=
 =?utf-8?B?U05GbDVoZkd0S3djS3RtcVpwNDdQbmFFd3BTSWtXMEV3dDRkTHpPaE1objVt?=
 =?utf-8?B?OXp5c1ZXV2xUcEhQRFA2dERTUCtCbnNFUDh4My9zRjZIQXVKaERSczduSndv?=
 =?utf-8?B?TXplZ0pwdGJVaHNnNzZicElsbU9CVG5UM0Y0NlllNUg1UHh4a1FxNVVOK0NP?=
 =?utf-8?B?b3J6RGZSRU1PMUFseTBaN2V3YzErRjFaZHdzb3MxeVNiODZDVkthN2VwejFv?=
 =?utf-8?B?N0dFbkZsSEJWWlkzMVczalczcWNLQVBkaERmSzBtQTljZGVxanhYWmc0aUlW?=
 =?utf-8?B?VDRVUm1qQVVsN0dBTmZ2bnIxdC9GYXRTZWNLOU9oRlkyb0oxUThCRHdwU21p?=
 =?utf-8?B?bm5yQmV4ZEhvL0YzWW85UEVvUkNaZkUxWVdQWWxGS2ZyR3dNZnF1NHBwWDQv?=
 =?utf-8?B?dTZWS0tLNXJhNm0rMmR2NnJFYXdLbGxOMThtZEQvWDBGekhZVWVXWlJLOXJT?=
 =?utf-8?B?a202S0RiYWYxdWJDVmovZ1cybEN4a1lNajRsNTNDUGNRdi9neE1OTEYxYWh3?=
 =?utf-8?B?TmZyZnNwUllKdEsyUk1pdnM1Y3h6V1dMbXhZWXZvQTNBWFZXUjNJU3cyNUNJ?=
 =?utf-8?B?b1ZicGRHZjhwNHZFVVd0SnZwY1NlNjRnN2NJbEoyWjY1dDdUQXpubk5rREZp?=
 =?utf-8?B?eEd3aUkzeG1sdTZvRzVkMWduSjBlSWNnUVRUd3lFVTkwL2lCbmR6UHlDTERJ?=
 =?utf-8?B?VHBHSmJpZnNhc2FYT0NmMSt5SEpTSEVRRnlQRVlKdjdYWCtMWEkvVGNjNTB0?=
 =?utf-8?B?VlNFaStyTkpyNE1Ea1hTcXpRbzFuQ2Noc1N1YXc5N29PZmFTRFZxeGdweEFq?=
 =?utf-8?B?MVNXSGpiaEhJTW9lOStsbHRWZnlqTkR3L3NUdXJqMEV0b3RJWmZhRm5kcXc0?=
 =?utf-8?B?V1lzSzduV1RQS2dDZkVGbGhpUEZISG9sTkNMV1dxdjgxTFgvcjVQaU52ekVx?=
 =?utf-8?B?SHNOWnNZUEwvV2FYdExSQVZQMmZoaGlVQmdKOGlNKy9JV2tYL0k3U2RVOVFK?=
 =?utf-8?B?cTJaMm02dVhFSUUyVjlXdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THR3N2x6V1R5c1RET0pCUm1XaU9LUnRpeDY5dm5IOFNJNStuaThHUjFXRGJv?=
 =?utf-8?B?eU1XRVlFcFBhZEtCOTRuWWFpQ2RjbXBFbnJQdmYzaTNYL1VrdkJkRHMyc2Zl?=
 =?utf-8?B?T3BTZW5vb3FMSnZER0NxZ1YwUitBczgxNkxDOGdtcmpsZXJjTVVaM3JrK0R2?=
 =?utf-8?B?QVV6eElLam12a2JPbGoxQVNlL0xsclA1MXNYb0JLWXJtbnFlekpsQ3I5Nlky?=
 =?utf-8?B?ZDdseDlmTW50M3BFNXJmSlJOcU16WTJOaUtramxrWDJ3SWNaSFpEVUtISU5Y?=
 =?utf-8?B?MS90VUUxT1NBTlIyRGpraWc2a1o1TktlcTcwLzRDcWEwNndYUWFvclJFS1Vo?=
 =?utf-8?B?WE1OTlBUOTR6cHZmUkZHb1EzbHJ2OHN5bHNrTEU0d3dTTCs0NW92NjhqZTZR?=
 =?utf-8?B?MW9wU1NVSHVRbE4vTHBCV2IwWXRJbXgxL011d2JmU09PeTlyZ3dmZmJzWHg1?=
 =?utf-8?B?TjJ2Q0ZMSE9mY0pGb0Jzd2ZXdURLbHkrSWs3ZDVRUGMzRDJGa0ZQZW4rRWVp?=
 =?utf-8?B?dm9VRHJ5ZDJscnY1a3RUcjdKbjQ1cTRqNDdHcXFtM2lVbnFyZ0dBc3B6VThO?=
 =?utf-8?B?cU13UU1jQkhNbmYycm1yNWdOMysyOG8wQU16N1Z6MWNoYi9Pb1M0Mm1uY1l0?=
 =?utf-8?B?V04zNFRkcEFXSHpjTUc2YkRWRHFPaFFZZzJKTWdVUk8rRi9aUVFzMENFMFlz?=
 =?utf-8?B?Nlp3OUlNZ3U1REwwdzJZM2VVUERSZVRQQU96czN0bHlHSmxnUS9LL1V5c2tY?=
 =?utf-8?B?WktjN3VoZk1OYVRIeE9MaEk3ZVlvZGg1Wmdrb0ROdzFDbERwKzZoRXZHTDVh?=
 =?utf-8?B?U2Z2eTY2SlNaeVprWjUyN2JrYmhHaVUyYVVPN09heUx4bDV0VjdCS1JSREZk?=
 =?utf-8?B?WjFWVVVPQmcwM0Zuc25nNFZ4QnRVQzgwVFljdzYwYWliVEFDM0Q4emdzcU9W?=
 =?utf-8?B?N2Q4bmU1Sk9YQ25ESEtpM2NXN0hRTkpPRDloSmFnT1kvMCtWanpEZlM0SmtX?=
 =?utf-8?B?VzF2QlJUcGp3S3BtMU5xb3JZLzZuRjdFMlVHU1NwaENFZXlOZzZidFNQZDl0?=
 =?utf-8?B?U3M5bzdMZGgxWVBkNHhwTkJFWXlIbS93WW5seEZ6YmtMU2EyNWNydWdGNm93?=
 =?utf-8?B?RkRDQkdRZVRNaXBXM1BmeHRia3FkejNaQVk0TGVvcUFaTWV0ZTlDbW5XaDNM?=
 =?utf-8?B?TkhRb0drQW8rME8yWWFKSDd3K1BPMTM5WlVxNXUySUxWRTNaRlB3c3JFN0RP?=
 =?utf-8?B?c2IvSlMzWDExc0d2Z2NvYlFhekVPMzdjeDVXQ1BkK1VMdk1jZUVOTTdjTU5x?=
 =?utf-8?B?YW9NZzAvSWZqVVhHVk14ZlFhWVVidFdmRU5pdHhMZ1NTN1ErSUxaZEJ3L2dt?=
 =?utf-8?B?aVJCR2orMlRIUHhiakcvQUsrYVI3SVRmd0RuaU1hSlFKaEwyTkpJRjNLUkp4?=
 =?utf-8?B?ZGxkWndFQ2pqZWcwVGtYZmtVam53VTJ2RTdRZloxMW9ERkxPWDYza3NxUTd6?=
 =?utf-8?B?ZDFicHRkeGQ5Z1h0bU9sQnRsbGN4Q2hDK1llcmVJOGJlZ25MRXJ3b0thd3B5?=
 =?utf-8?B?N2trWnNWaGtYN2xBRVVGZzM1RnNuUThnMkFWQWNzNHhxVWJIVXU0UVZJNlU3?=
 =?utf-8?B?TWFwT1U3Q096alhQR0RmTktsL0Rra2tlRU9DVkF0NmhXQ1B0NmkwUC9XNEtQ?=
 =?utf-8?B?K1F4c3BXaXhzQWNPL2tIc09rVlJVcFBkRWpORThNbDJ5WlAvSUV2N0plRWlQ?=
 =?utf-8?B?Q0NMVmEwVUtQWHlMaGw2WS9mOGI0YkJEWUQ0RlE1NW15K3Y1cnBvTlM0dFZT?=
 =?utf-8?B?c3NQK0UvZlRPZG55VGV2V3E0MXFMYzkyZjRHODBFWE9oWmIvTWdsL1pCbEs5?=
 =?utf-8?B?ZEFGM3hWZE53OWk5SHUwaks5VXZ4cllWZ3drbUgzTVBSTmM2bkpZOHlpMEJ6?=
 =?utf-8?B?eEZOYlJBWkJlM0gyMGVDZ1FpUGptc1BIa1Y1MHJXNndTeU1UUGYxcEJRc2RQ?=
 =?utf-8?B?a1puMTk2bmtielYxRmVIREw1aXBCMnBiR0p3dkRRRjJNSUxQOW9TTVVzbm9R?=
 =?utf-8?B?cjlpU090bjFyWWhrTzBRT2hYdGdva2VsT2tNellUMmdYTlVHK0tGSjBoamZJ?=
 =?utf-8?B?WWRvMlMzek1KN3RDTC9oVzYya3BXRFpRb05iVGx5UkJxUEFUa1JhNnlmeVBH?=
 =?utf-8?Q?u+Z9BrKVNQMVxC+ZBgF6qbM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad90e39c-a90c-4b56-f382-08dd0eabd9e6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 06:22:21.7679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QaUx8plpIopFow5rt8kWw4U/RYl/UmSyglqX35TJRT5EKWsbDyd2zMUvoqiety0LWn8F1X1QQNePMwIn8NNyUN57VgRaIEmWqv81QJWP8aE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7251
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



On 09-11-2024 00:44, Gustavo Sousa wrote:
> Quoting apoorva.singh@intel.com (2024-11-07 05:21:58-03:00)
>> From: Apoorva Singh <apoorva.singh@intel.com>
>>
>> Force Sampler Tile64 Overfetch via MMIO
>>
>> Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
> 
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

Pushed to drm-xe-next, thanks for the patch and reviews.

BR
Himal

> 
>> ---
>> drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 ++
>> drivers/gpu/drm/xe/xe_wa.c           | 6 ++++++
>> 2 files changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 0c9e4b2fafab..162f18e975da 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -445,6 +445,8 @@
>>
>> #define SAMPLER_MODE                                XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
>> #define   ENABLE_SMALLPL                        REG_BIT(15)
>> +#define   SMP_WAIT_FETCH_MERGING_COUNTER        REG_GENMASK(11, 10)
>> +#define   SMP_FORCE_128B_OVERFETCH                REG_FIELD_PREP(SMP_WAIT_FETCH_MERGING_COUNTER, 1)
>> #define   SC_DISABLE_POWER_OPTIMIZATION_EBB        REG_BIT(9)
>> #define   SAMPLER_ENABLE_HEADLESS_MSG                REG_BIT(5)
>> #define   INDIRECT_STATE_BASE_ADDR_OVERRIDE        REG_BIT(0)
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 02cf647f86d8..570fe0376402 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -607,6 +607,12 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>>                         FUNC(xe_rtp_match_first_render_or_compute)),
>>            XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
>>          },
>> +        { XE_RTP_NAME("16024792527"),
>> +          XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
>> +                       FUNC(xe_rtp_match_first_render_or_compute)),
>> +          XE_RTP_ACTIONS(FIELD_SET(SAMPLER_MODE, SMP_WAIT_FETCH_MERGING_COUNTER,
>> +                                   SMP_FORCE_128B_OVERFETCH))
>> +        },
>>
>>          {}
>> };
>> -- 
>> 2.34.1
>>

