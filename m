Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59136C282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 05:32:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E32B10E0DB;
	Mon, 10 Mar 2025 05:32:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jlXsD6Ds";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D6010E0DB
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 05:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741584742; x=1773120742;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h7NfZnH62ZU7Vjs0BDygn9k1WD2eEnTqvrwCuN+5bIA=;
 b=jlXsD6DsIBgbUMGhxnlYueY1PGXw5F7yPtW6L1LU+BYH+l6A/RG4L4Av
 4WAh1a/QADPyY6Z6zJuDdY+3YxIf9p9HKoXuJ/QSudoYZ30qgzc4cHbEE
 zlkgA7zAI6o0Y0abyJ53ArNI9+N+LZX1a5koEAH9EXbZYHnc8EU+Y8OPT
 3nRoYJBKbzIewYV6vAKTgsDRBE1ruRX3SioZ/tnOkBZIYH7toAZsnazUD
 QuNjZNvA0B76ZydqpFJsDmaG3AHqsBJF0scKPm5n72JDTtGWRpJ2eMeRf
 njH4EKeCfWS7EUDTFGNDwvX7FZb9tuzvCNeRKEWk2/vdps6QOVPQFptEX Q==;
X-CSE-ConnectionGUID: sYF5fiKkTHe2uADST5PQJg==
X-CSE-MsgGUID: eia/Sf0nSBubBbqTQDrLnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="45358343"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="45358343"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2025 22:32:13 -0700
X-CSE-ConnectionGUID: Xb36OWa3QXq+G2OWO/TG+Q==
X-CSE-MsgGUID: Z+D6PvkXT7+RmCOYbKvcxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120793385"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Mar 2025 22:32:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 9 Mar 2025 22:32:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 9 Mar 2025 22:32:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 9 Mar 2025 22:32:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWyRDvoQWUVco84FCuBVVKMLSMiiuRYqBkwt1PVrPhsmwoqCC6NcyI6S/r96sC5YJfsu3YM2q0QdzXbVsDOR8Yd7G/BVBb7X/xNvKOjz6JgogHUnRJOFvKZB/e3Nt0XXyzf3T7sEqocX6+goToyKSoUsq9s53VCF2EYKKVXgQoobJy/oxJLFemkkMiZP1J4cQ/PhsDlrN7q3ytsOa9yDOv647pnTLzD51x6ZmBMCO7jTsnYAyXig0Vl3RtfV2IqSPU0fygNhLXwHKDqhAxUFy3rGMLIqxAOSxRclU2lFkwBbemdS4tuyipht3Xi9U7t4Y8ihcK5LEm5IS/PjNtcpCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPlivhB+6YftUSxCtyL2/Jr6Rg+kL3ytN1cNKxu6eBQ=;
 b=dC9khkZZGENhvpl9MOH6b74xnq/Zu2zPbI1xsDLYsusjmmFMxm21w4G80Fgrtgu3NFx5y8g/BvpqPNV4pzOFq65PwAz7ubSK8kca74kTniYGnk9/qOe3BKMeQmdeFnH9UXsH7tuF4C2IuFnQmLnCzLSZfotyVxDuRzzbF/mifamnGuVWV129yErmly+eQvnBqOamMLIW0MxgBY29aihZsVrfAvl7UeVeqpQnm2fWapTlq7OuRpRf3nvjdywC5aerOl9cdrHUHo/C3orP8XvnlB9ewafpBdepV6dYot419E/RTKFi/IJfm3Xo4G1wL6cIoPzeXy9ETwBe1nt2vkXY9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB6549.namprd11.prod.outlook.com (2603:10b6:8:8e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.26; Mon, 10 Mar 2025 05:31:56 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 05:31:56 +0000
Message-ID: <bb979148-ec3d-43c8-b73f-e22476f9a809@intel.com>
Date: Mon, 10 Mar 2025 11:01:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] RFC drm/xe: Add configfs to enable survivability mode
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>
References: <20250307142446.1790715-1-riana.tauro@intel.com>
 <20250307142446.1790715-2-riana.tauro@intel.com>
 <txoeuk2zlt4gotrzltt3cjtzf2u4ebsjtjicvtsa4a4iz5o5eo@oqgl43byhdoe>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <txoeuk2zlt4gotrzltt3cjtzf2u4ebsjtjicvtsa4a4iz5o5eo@oqgl43byhdoe>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB6549:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f4024c4-a287-44d3-d8ac-08dd5f94df2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTVYTHFSeSs3ZHdockJXR0dLd2tTVmNsNkJqNC82MUJzSmtRZXdSM1BnU1dO?=
 =?utf-8?B?UXJRaCtCbFpLOFUvNkdzbXgrc1dtTWpKOWw4bWoyNGZjTDVsbGxiQ3VnZDFU?=
 =?utf-8?B?elFiNWM2WU1TaWRZRGxJUkhHNGRvN1E5Ri9SZFAvV3d0ZEdmdk5ISExNYVBI?=
 =?utf-8?B?c0FGSFk0d29MYktBbE1WOWxadXc4bG1KODVQUzdIWS9ydDZtSG5VOXBVMjVy?=
 =?utf-8?B?ZmFqUGJIODhEOHZzMUtHZVZ3SDlFdXczWURjcVljNDlOZHpBMFhybGwyY1Fx?=
 =?utf-8?B?bjBzbkJOUGpHMERicFg5ejR1ZDVkNS9BZnc2VFl4Sk95NDhOd2VpbXV5T3BL?=
 =?utf-8?B?b2FsOFpqK0JDTnIwci9uSWxZalVwcTYyeXo3cHNuVjNGek1jZ1hJT0JLUzdP?=
 =?utf-8?B?ajFnaUhSSmZKaXhNcjhPaHhHNm41ME8vZXhaUkhlNmRxekJUZUxET0xRMzhh?=
 =?utf-8?B?dnlzT25rditNZmJQeEN5Ly9Na2lUMUViUDRXK2NDa1gybzA5ZmJmdXBsTmhD?=
 =?utf-8?B?RE92eVFndkkwSXd3ZDFCWWZ6RmhCU09Ja2VoR1ZvaWdPUVBqZExFcEFweVFj?=
 =?utf-8?B?aG40UDRmNTVaOVdBdER5MVdKNy9FbXBnYkwxUVd1QUVpV214S3hzRUFSMUlo?=
 =?utf-8?B?RTgwTHh3eUdDNVZUOU8ycldTeTYySkN6WTl3aktHQU43ekJJTHNBZlc3a0Jz?=
 =?utf-8?B?WHVmUmU2Y2VnVzJ6SlBnNmY1ZWdKaXdWZFRMNTZwclNXKzRrbE5XaU5vM1Ur?=
 =?utf-8?B?OFd0d05iU2tIQVg0Zys0eTJDUVlZS05VZnhWTkFOZWNpbDFJa1ZZY1ZRSjBy?=
 =?utf-8?B?aklvdnVzanhNbVFTa2s1WFZZYjlmL3FSc04xcUppcEhROFZvMFh0OW9IYjBQ?=
 =?utf-8?B?R2g3VXhhSUhuUFlZd2RaUDcxRjFEaU52enhUQk16MWY1aFZoT0tDY2hpcnRn?=
 =?utf-8?B?KzA5bHdYVFVOUmptQmh6WWllZy9EUnJINUk1aEk1YURiNHFwOGg4YWdNZS9q?=
 =?utf-8?B?NmIxaUJmV3l1NC9QakZXYlNxQit3SEoxU1hEM2E5NVh5K2ViSk0wd2VNb1lT?=
 =?utf-8?B?dUdPYnNUcFJOVnR4Z20ycG11cFhJWTRHK2lXWTVEWGZnalZndUlobi9kMkRh?=
 =?utf-8?B?N2VIR05wVXdqNkVyaXpWZytRSVlDYkNYMXllR2xHaDM3S25xZkkzb3I5K2Z6?=
 =?utf-8?B?VFkwbkxONUtKY2NBOS9pM1NqT21UWjE2S1ZvMEJKdWtnRzM5UHcrUENudlYv?=
 =?utf-8?B?ekpWUmQyb1FYbXJRaTVZSGFwVlMxOUJoSUU2LzFNME8zWmZPK3FVRURxcnVx?=
 =?utf-8?B?bmdFUnkzNGEzWGl2SU50OThFejV3MUw0Nklhd0xYWHZhK1o1K3JYamxpYXFm?=
 =?utf-8?B?cXFTdGNrSmVXelM5MmkrLytibnNMblBaR2QrbHY2YTcxYVMrVk1EN25RNkhh?=
 =?utf-8?B?K01wbS95UGxjeTlrSkNMNHNIQjZlc01pRko4SlNSS0UzcFluV0picFE3S0xQ?=
 =?utf-8?B?c2pFZUJyUGRkQ3M5eWgwMEQ2d1I5ZWtrWVVlNlVOUVFyOWZickNjTWsvYkpO?=
 =?utf-8?B?RWtUN1czakErOUxkMUk4M1dZWEdXd2FwZWJwL2ZpSnNDeUIxRjMvYm01WTlw?=
 =?utf-8?B?VnFtQmdxTkp4c3dGSHEySzZQdEZpcEhBMFpTcWd3eGhVRGZLeDFNR2p3Vy9z?=
 =?utf-8?B?akpiU2ZLRVlUSEk4TXcxVWZPUXRxbjdNR05pWHNXMFVPK2tmZThsTlRUekJ4?=
 =?utf-8?B?QmFBZ1BiNENydGx4N0RQTTBPYU9pTzdHRWhZTmNpZ2hmcGlkcklYQ09iYisz?=
 =?utf-8?B?RzRLa2JhdzkrNGVObi9MZ0FyNmFoU3lXOXcxZmE5Rm9odDA2dUlnL3h3S0Zo?=
 =?utf-8?Q?zCpJm9ABnA4n4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGNZd0lwYWZ2dWFoTCtWYW5FLzA5aDhKcC9TRlQ5VWFXYkFxR1FWK0FJNnk1?=
 =?utf-8?B?L0Q4Wm5tY0FFM2p0L1ZuTVQ5RGN1eXNOL0FtSlVRbzJXcm8veDk1TVpJTEtk?=
 =?utf-8?B?d2grNHFrc3JYNStjb1VMRVRCblpOcHY3MldYWUQweHMzeTFqdm5qMTZPZlQr?=
 =?utf-8?B?ZTN0Y243MVk1bi9LcHdoQVcxZFRsT0RUQTdzejR6MXI3RnkzTnl1bXlrT2RR?=
 =?utf-8?B?SldISGt5akxEQXBlaWx5UHpSZzhPREx6Q2prZ2o1RXVDeVlhZjBMTVJCajVr?=
 =?utf-8?B?Mjc2aFNrZ1pKRDVEeDR2VXZxYWZ1SzMwTnBRSUxOelBrUEk3OE50QnQ1OG1V?=
 =?utf-8?B?TElva3ZVRnVWOHVYazJGd0tVV3hpK08wRlZFQkNOREg4SDlwQnIwZCswcHpm?=
 =?utf-8?B?T3RnZUFEY2tmTkhOOVp6TnRVUDRiUUxkbDF0ZGNRVUZEWjJONG5iN09NWG8x?=
 =?utf-8?B?SXJXcXBUUXhTcjY2T1hzTUp6VkxSaFNvKzByY0h3YlFIMTFldnlFaWJrdVhM?=
 =?utf-8?B?dDZnTHRkbndMb09Bam54TmNNNy9xc1RpanJnZWsyeU5hdmdBSGt4QmpTNm1k?=
 =?utf-8?B?SkJrUlpKbjJYOFkvQkNabUJXUlcrTDVkVDhaTWtYcGdDdGRSV01HN2NJT0tB?=
 =?utf-8?B?TzNXbm5JSXQ4Tm8zczUwK1N1MjFPWUxLQjYyUC9WUGx1Vi93TURJUm9MNkgw?=
 =?utf-8?B?SkJFanVoT1d6czBad0pnRWZtSWE2ekJNazRIT0ZVeU44ekZJdFlPdUU0VkJI?=
 =?utf-8?B?bGFLeUxvc1VLV2dtMU5yc2JsY1BhQUlZY0VGNnhNa0ZrdGVJVGIxdWFGZHdN?=
 =?utf-8?B?YllRYzhOaWVTcDcwVkpDVW9jY1RwMXdVWjJxdXJoOHk3NkE4cUxxNEFxQTVB?=
 =?utf-8?B?Uzg1ZDBxOCtoYlArN21KMDFXdE5nWDkwSE5zYlZUaU9wemV3R1JRWXhiVVNk?=
 =?utf-8?B?YnlTc3hZZ1ZkVmIwTHpZTFozdlBZdXJLcXQxRlhwSG5nZ3BrK1RZY2dCSDBk?=
 =?utf-8?B?dXA3WURsTjM5TEJJWXdKRlJSSUkyRUJnc0pTT1ZWT1A5di85UktVUjF6Sm1u?=
 =?utf-8?B?SmduRkp0WWhtenpBbTExTTJUWjBZbjJRcEUwUkdYdHliOXdReGZpUEg2ZlE5?=
 =?utf-8?B?Zm5QOW9TcVBpNmdqbUdiMTVlb0FxZndOOCszZmhEcUdMSWN0NnFxT3R0Y3or?=
 =?utf-8?B?MmZXVTNpY0kzbDkxRjRmTmgxTEVqQUx0dnNYVk51WmdoSVZVNmtZblpEOFNx?=
 =?utf-8?B?TlplQ3FQMzhVVjdPTU1FVjB1dlBtRGhWQ05KNm1KdzBoS0VqMjZmMGlqRmdE?=
 =?utf-8?B?ZDVTaVQ0YjFDeE9NQ3I0TEpkbEx3NlFJdElHZEFKTlczZmExenYxN29QM0dS?=
 =?utf-8?B?UWRMa1VNMEtiV1J1c21EQnFLQ0cvZ2gvTkEzVVQvNnozeHhsVFZnQ1hzWWtP?=
 =?utf-8?B?czh0TWtNQ2JGbW5ya0Z3bjBFTXZDRlJON1BscUR2VE5kbjhvNE5WcmFaMzhj?=
 =?utf-8?B?VjJxQ3VUODhyUHJOQm5SVlhBTUt6bGVzdFExNlNHVmNxZkpYTTFvMG8rclVG?=
 =?utf-8?B?bmlMNFNSeXlrYXhUYWFqSGY3SVV5TVV5dnZOTmpDRDFJbkptMDBGdEo4WTM1?=
 =?utf-8?B?OVVTb2JMUzR6MURxM1VTVDFwZjdJUXQ4a3UwbnJXYWl4RGw3UC9SQmNMMEtj?=
 =?utf-8?B?RGs2RGNxYWs4blR3Si9HV0NXSTVjZ2ZVRk45b3hoN0Jwd0l1WFAxTmtlZnJV?=
 =?utf-8?B?TlZEWmhzSmJMSkYxZHVhZFYvcFFUR1NzeXFJQmZGWU1ZR1R0NXUzNXJKZGJM?=
 =?utf-8?B?dGs5MVRyMStibVhER0hLSlFtWUM5UStNTjNDOXUxcWRFaTFDRTE1TFhVaFBr?=
 =?utf-8?B?TWc4UEhiWlhXMnBmRDBXSmpHaWRXTWtyemhFeFh0WlJyUUpjbWo4UHVNRFVL?=
 =?utf-8?B?RWpuN05rcDRvelArdVAwQytBRit1MFUzQzcyU0ducW9PY01XSm5PaGFYZG9X?=
 =?utf-8?B?b2hRUlNpZ2dzc3NVU1kycEV2R21DUlE4QTdEMmlmQ25EYjAxYS8rY21zMFFW?=
 =?utf-8?B?V0Jhb1F0TVIrd2RzYkRIUDRLbE1pNWllTC9pTkVQYVM0VkQ2MW5PYkU4TXlm?=
 =?utf-8?Q?w2/yu2uiJitbPqhxBsGGMSdjq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4024c4-a287-44d3-d8ac-08dd5f94df2a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 05:31:56.1943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YWxNCM0/UwuUpAGr8RSmgMkLLreE+HvDL4nyWe53h0VRegf1Xbxy0F+bwyTbm4w7s5RpWQhfnIzZS4LdM+nxFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6549
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

Hi Lucas

On 3/7/2025 8:46 PM, Lucas De Marchi wrote:
> On Fri, Mar 07, 2025 at 07:54:44PM +0530, Riana Tauro wrote:
>> Registers a configfs subsystem called 'xe' to userspace. The user can
>> use this to modify exposed attributes.
>>
>> Add survivability mode attribute (config/xe/survivability_mode) to the
>> subsystem to allow the user to specify the card that should enter
>> survivability mode.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> drivers/gpu/drm/xe/Makefile      |  1 +
>> drivers/gpu/drm/xe/xe_configfs.c | 95 ++++++++++++++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_configfs.h | 12 ++++
>> drivers/gpu/drm/xe/xe_module.c   |  5 ++
>> drivers/gpu/drm/xe/xe_module.h   |  1 +
>> 5 files changed, 114 insertions(+)
>> create mode 100644 drivers/gpu/drm/xe/xe_configfs.c
>> create mode 100644 drivers/gpu/drm/xe/xe_configfs.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 9699b08585f7..3f8c87292cee 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -28,6 +28,7 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/ 
>> %_wa_oob.h: $(obj)/xe_gen_wa_oob \
>> xe-y += xe_bb.o \
>>     xe_bo.o \
>>     xe_bo_evict.o \
>> +    xe_configfs.o \
>>     xe_devcoredump.o \
>>     xe_device.o \
>>     xe_device_sysfs.o \
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/ 
>> xe_configfs.c
>> new file mode 100644
>> index 000000000000..8c5f248e466d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -0,0 +1,95 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include <linux/configfs.h>
>> +#include <linux/init.h>
>> +#include <linux/module.h>
>> +
>> +#include "xe_configfs.h"
>> +#include "xe_module.h"
>> +
>> +/**
>> + * DOC: Xe Configfs
>> + *
>> + * XE KMD registers a configfs subsystem called 'xe'to userspace that 
>> allows users to modify
>> + * the exposed attributes.
>> + *
>> + * Attributes:
>> + *
>> + * config/xe/survivability_mode : Write only attribute that allows 
>> user to specify the PCI address
>> + *                  of the card that has to enter survivability mode
> 
> I think the desired interface is actually that the user mkdir the bdf in
> <configfs>/xe/. This populates the available config entries that the user
> writes to.

Initial thought was mkdir bdf, but since it was a single attribute and 
after a offline discussion with Rodrigo, did a simpler version to get 
comments on the RFC patch and if configfs is okay to use
for survivability mode

For survivability mode, below procedure needs to be followed

echo "0000:03:00.0" > /sys/bus/pci/drivers/xe/unbind
add bdf for survivability mode
echo "0000:03:00.0" > /sys/bus/pci/drivers/xe/bind

After the device is removed directory has to be created, the bdf has
to be checked if it belongs to xe driver and then attrs populated.
Even i think mkdir is better in case other attrs have to be added in 
future, but for unbind case the check of the driver might be tricky .

The attr is WO and any value can be written, only if the correct bdf is 
added in the attr then it'll be used on probe to enter survivability 
mode.The current patch only checks the format and does not check if bdf 
belongs to xe.
> 
>> + */
>> +
>> +void xe_configfs_clear_survivability_mode(void)
>> +{
>> +    kfree(xe_modparam.survivability_mode);
>> +    xe_modparam.survivability_mode = NULL;
>> +}
>> +
>> +static ssize_t survivability_mode_store(struct config_item *item, 
>> const char *page, size_t len)
> 
> once you handle the mkdir mentioned above, this should probably be
> a boolean attr like this:
> 
>      drivers/nvme/target/configfs.c:CONFIGFS_ATTR(nvmet_, param_pi_enable);
> 
>> +{
>> +    char *survivability_mode;
>> +    int ret;
>> +    unsigned int domain, bus, slot, function;
>> +
>> +    ret = sscanf(page, "%04x:%02x:%02x.%x", &domain, &bus, &slot, 
>> &function);
>> +    if (ret != 4)
>> +        return -EINVAL;
>> +
>> +    survivability_mode = kstrdup(page, GFP_KERNEL);
>> +    if (!survivability_mode)
>> +        return -ENOMEM;
>> +
>> +    xe_configfs_clear_survivability_mode();
>> +    xe_modparam.survivability_mode = survivability_mode;
>> +
>> +    return len;
>> +}
>> +
>> +CONFIGFS_ATTR_WO(, survivability_mode);
>> +
>> +static struct configfs_attribute *xe_configfs_attrs[] = {
>> +    &attr_survivability_mode,
>> +    NULL,
>> +};
>> +
>> +static const struct config_item_type xe_config_type = {
>> +    .ct_attrs    = xe_configfs_attrs,
>> +    .ct_owner    = THIS_MODULE,
>> +};
>> +
>> +static struct configfs_subsystem xe_config_subsys = {
>> +    .su_group = {
>> +        .cg_item = {
>> +            .ci_namebuf = "xe",
>> +            .ci_type = &xe_config_type,
>> +        },
>> +    },
>> +};
>>
> 
> so... it seems you are missing a configfs_group_operations.make_group.
> 
>> +int __init xe_configfs_init(void)
>> +{
>> +    int ret;
>> +
>> +    config_group_init(&xe_config_subsys.su_group);
>> +    mutex_init(&xe_config_subsys.su_mutex);
> 
> this mutex_init seems odd, but inline with other drivers
yeah it is not used anywhere but the sample and other drivers also 
initialize it
> 
>> +    ret = configfs_register_subsystem(&xe_config_subsys);
>> +    if (ret) {
>> +        pr_err("Error %d while registering subsystem %s\n",
>> +               ret, xe_config_subsys.su_group.cg_item.ci_namebuf);
>> +        mutex_destroy(&xe_config_subsys.su_mutex);
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +void __exit xe_configfs_exit(void)
>> +{
>> +    xe_configfs_clear_survivability_mode();
>> +    configfs_unregister_subsystem(&xe_config_subsys);
>> +    mutex_destroy(&xe_config_subsys.su_mutex);
>> +}
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/ 
>> xe_configfs.h
>> new file mode 100644
>> index 000000000000..491629a2ca53
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_configfs.h
>> @@ -0,0 +1,12 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +#ifndef _XE_CONFIGFS_H_
>> +#define _XE_CONFIGFS_H_
>> +
>> +int xe_configfs_init(void);
>> +void xe_configfs_exit(void);
>> +void xe_configfs_clear_survivability_mode(void);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/ 
>> xe_module.c
>> index 475acdba2b55..15b3cf22193c 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -11,6 +11,7 @@
>> #include <drm/drm_module.h>
>>
>> #include "xe_drv.h"
>> +#include "xe_configfs.h"
>> #include "xe_hw_fence.h"
>> #include "xe_pci.h"
>> #include "xe_pm.h"
>> @@ -91,6 +92,10 @@ static const struct init_funcs init_funcs[] = {
>>     {
>>         .init = xe_check_nomodeset,
>>     },
>> +    {
>> +        .init = xe_configfs_init,
>> +        .exit = xe_configfs_exit,
>> +    },
>>     {
>>         .init = xe_hw_fence_module_init,
>>         .exit = xe_hw_fence_module_exit,
>> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/ 
>> xe_module.h
>> index 84339e509c80..c238dbee6bc7 100644
>> --- a/drivers/gpu/drm/xe/xe_module.h
>> +++ b/drivers/gpu/drm/xe/xe_module.h
>> @@ -24,6 +24,7 @@ struct xe_modparam {
>> #endif
>>     int wedged_mode;
>>     u32 svm_notifier_size;
>> +    char *survivability_mode;
> 
> drop this.. We want a  config struct in the xe_device. It's actually
> allocated by the mkdir in the configs and when we are probing, we should
> find the config instace based on pdev and set the pointer xe->configfs
> or something like that.

Will add a new struct

Thanks
Riana
> 
> thanks
> Lucas De Marchi
> 
>> };
>>
>> extern struct xe_modparam xe_modparam;
>> -- 
>> 2.47.1
>>

