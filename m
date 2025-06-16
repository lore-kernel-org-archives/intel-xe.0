Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FF8C71135
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 09:47:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C2410E31D;
	Mon, 16 Jun 2025 09:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eIWFhdTY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC9710E31D
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 09:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750067254; x=1781603254;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=f040BnaqW85Y0KHM0oAnR2H0bmvwvLKNJePriF1pZvY=;
 b=eIWFhdTYQNF7HtNwVeZIv8s2+E1xmoBN7P9Y9SeAjtIMp+pkG+CzoFYf
 XMYoTkswFAChnSY8miihF+Dfyj6AbHZlQcMR/ixqjiMBdYJGTjvigmony
 NR/ObWd4P+TMOCJJMkwuJRIs6s1+EgWeN7dmf8A90fpDvG8LA+e6pbfm7
 WDPaCMmxeXxNOJbY2MlM4WYx0QsQ4gbJ9ffJgryJh9YejFthLaNXU1DuD
 IeIoNoTnuLhwED3dPwLCrIo8SG1DMrdI+ukQjH6BFGbkvku/Luga+k7e9
 WuKyM2IJ7sGy9UChY+MXJWFWO8KEaQYCbZ3VteddA4qNRjBG0F+Lid+lI w==;
X-CSE-ConnectionGUID: t5RMnXecTOSMwhh7rWXppg==
X-CSE-MsgGUID: yKzaGsA9RHKxTJspAnPSig==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="56006172"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="56006172"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 02:47:32 -0700
X-CSE-ConnectionGUID: UotM5FNlStiMMc3VP7tUHg==
X-CSE-MsgGUID: wHHuojkySUaYDS6154UNPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="185689254"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 02:47:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 02:47:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 02:47:31 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 02:47:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HL/wuT9E6XlARgni1AIE9+WXr2RFYip/PF/Mqbrj2xtNrjFsuctpSO0naQ8uN38/ORJtaBQ67i6pIf2rENFKobbLTH3lmLU+IEzmHnqWcOIIO73kdNIa/3yNpPDDd/Nd7Gp3DGdXiknF+nxmD8N0MYpr27j+0D1rqD9ZgSyTBZxTNmdUkw1KsSXf1V2CfEdjbVNQWK8gsqCcr7XDfPf7VS5UR765Ijx0ILTP5zju7L3yCNrbmi8F5lz4TH+8w/OzEUTDB9InNDkdAxnEXCnqRKKE5eKzNBsrqPrev2ywQzQV/5Sq1K2VXeATkE+bjVoLxUWdWL2kxjJk1LphBF1ecA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKunCVc1jfwN+MgtVTIQBnrffVA1w49V8K5YLMn/dp0=;
 b=rbJxH2KNtm66j9F/06qznu+xpFyE1b1rjOspSKl5XtYXTZfGB+B8iw7y0MPWuYHrzOR+hVAqighFs7uZRnDX1X21yRQUkavEQbnmmlsThr5L7V90fA68ioArTZ2yTQZaCuaGQtYy9cGg1Vtp+Acg6gSS1lTSni6KaaQxi+0irNaMpX1XCPSeFTtmwCJlOYS248CtOgRtgR4VN7tkpqe1FtwVJume0xWr9NgKChj/p6AlSf41PC0k9nR87GZQsdTOx9L5Dx53Gbg0dd8v9IGFrdRFrPd29HOo9zUYgb1AEKcH/Gij2TR7pB0W1Ag4nudnpaYUQi0aEDhuDxwiSZIiUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6970.namprd11.prod.outlook.com (2603:10b6:806:2aa::20)
 by DS0PR11MB7190.namprd11.prod.outlook.com (2603:10b6:8:132::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 09:47:16 +0000
Received: from SN7PR11MB6970.namprd11.prod.outlook.com
 ([fe80::b1b4:c000:90be:abea]) by SN7PR11MB6970.namprd11.prod.outlook.com
 ([fe80::b1b4:c000:90be:abea%4]) with mapi id 15.20.8835.018; Mon, 16 Jun 2025
 09:47:15 +0000
Date: Mon, 16 Jun 2025 15:17:08 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v6 3/9] drm/xe/xe3: Add support for media IP version 30.02
Message-ID: <aE_oHEybMDhsFWBj@bvivekan-mob1>
References: <20250613193146.3549862-1-dnyaneshwar.bhadane@intel.com>
 <20250613193146.3549862-4-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250613193146.3549862-4-dnyaneshwar.bhadane@intel.com>
X-ClientProxiedBy: MA0PR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::15) To SN7PR11MB6970.namprd11.prod.outlook.com
 (2603:10b6:806:2aa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6970:EE_|DS0PR11MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: 0417c13c-59a3-4a16-85f9-08ddacbac6ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0JZR3BvWGlDZVRKWmxZd2dyc2x3VzRvZjBLc3VNWkpWck9MZkE0eE1HaGR6?=
 =?utf-8?B?RjlMRlpOZWZnWGZMN2NLZjB5YnBJYzlZTUZJaVNxd3RSNzFVdzJKVWdsVGlh?=
 =?utf-8?B?clUwWER4cWVhWmhMNnc3N3J6VlBscmt1Y0diSFRPNEZWT0Nxa2xGcHI2am8x?=
 =?utf-8?B?aURPeUpVN29FaWRSYjhJQU5qQVZjdWtYU2Y4NXV0dnJTVXdPSjBFRE5HaE1v?=
 =?utf-8?B?N3Y0K3JVd2liOTVVU0RHNHlzc0lwTXE0cUVDWHkyMzN4NjBPdFp2SXJBNEc5?=
 =?utf-8?B?aVpLTW95VjI2WmxkTldPMzFENmx4bkxqek04QUlLdFZMQ3lFc0U2NEJWa3o5?=
 =?utf-8?B?bU4xUkg3VG5ZMXVNT01hWml4QXhMUHJKWDQvWllxZ0Q5Q3JGR0R4Yys4UjVF?=
 =?utf-8?B?TlJ4KzEzUGdkZUlDd2NXQ2FDMGEzQWl5bkhlY3M1MnhEd205NnpOVTl4WHRo?=
 =?utf-8?B?U1BEdWlqM3BLOWM1d1JVTVQrTkVQRUo3ZmJqZlUraDlyMnV3VndkVjc2K0lx?=
 =?utf-8?B?S01MQlJlTnowcFVyMUhrWHVPcTdVMzZtUUEyL2x3YkN3NVllRG11ZkVueHM1?=
 =?utf-8?B?c1A1dnhKMkR1NkFPL3lIbEZUVlhJaGFlT1VNMk5LU1d2d1FHb1llRzN5THFt?=
 =?utf-8?B?KzRaaW1iNlMrdGNnQ2RtMENSSWZ0RjEzMVlxUERRMitRcUxwR2JSWTNjcWVo?=
 =?utf-8?B?bHdvVERZaTI0dGd5eEVYMXVZSUlCS3lvWUhZV0h5U0FQQzZZZDl0STZOZWNT?=
 =?utf-8?B?K01ZM3AwTGlSRmxlR0tlb0p4N0kvaTBINGk0aHNjY0U0aXgrSWRvR2ltNFVk?=
 =?utf-8?B?QWQvckFmZm1aaHlmVTRyTHlJSnRJODdBeTlyN1MyS3Flc1VEaXJ4cFJIWjFr?=
 =?utf-8?B?KzVwV3Z0Z2JZTEpBekY3bWsyMFpTTm5UbEtqaG1vT0NVaWZnSnE4cGRPdE9y?=
 =?utf-8?B?UVBRVWFwRmhWbWlrSzBBcEduVEVXbUR4aENkbVNhRnJheUlYWENUd28zbThF?=
 =?utf-8?B?cW9QTDBNeEQxclV1bWVqcEQ5ZE5FNHBUMmNPNnRrYWh3eEh1NmRJWW9sanVx?=
 =?utf-8?B?Wm1iKy9DQzUyNEF2UHZjTmU1THBHK0dwS0NCUFJ0RUo1ejNyN004Ujk0eTNs?=
 =?utf-8?B?bTBuTi9FaVpWc09NazUrS3lRMmtkOW5JQXVFbFJpSzg0S1k1VGtQZVFhbWxn?=
 =?utf-8?B?aWFwTjhoYmowVFlxWlBoaUZsVTZaVjBUNjR5RTRjbUJ6emVPcDR5WFgxTnFp?=
 =?utf-8?B?cmpGOEpCajU2TG82WE50Y1c3Q1dyNFR2SWFZQndxVlJMQVdweERHUnZDVE4w?=
 =?utf-8?B?SS92M3hWMFJySy9vRjFEQnUwcjZXNmprOU5jQVMzZEtWZ05xZWFIUEF1NGpZ?=
 =?utf-8?B?S0hScm96WVdKdEdkdmxWeThjelYyY0o1WGdtRDdqeEhGeWEzS3MwUVcwQy83?=
 =?utf-8?B?VENjenpPTXU5cEY2NE9uc1UzNjdEZ3htU3dCZ2VYc1laVWpCRVFzU1I2TlRY?=
 =?utf-8?B?b0xiZHlrT0ozSlpBeEJEa25lY090eHVGeTJOSVNIL3RocmhYTy9ydHdSZUJM?=
 =?utf-8?B?QnRzMG0wMk1aTTZ6NmRIbktaUVduOVNNOG5hU3F5R3FxTk8vZk1ZQTdyR3NQ?=
 =?utf-8?B?TFdCZXA3WG9IQ3BEcFFzRnVsRjdCdVpzU1NQRG5QVVliOGFzdGV6cHNPRG5M?=
 =?utf-8?B?bXB4RHhrYTVHV1YwVVJmWkwvcktHY2pycllKUXJOL0lkdTE4NlV2cFdVOGpH?=
 =?utf-8?B?T3k5cWpUZVFXd2ZaV3ZKeHplbU9nRW1PNjJGeEtaOHZyN2c0WWcwcFU0Zk0r?=
 =?utf-8?B?dXpVVjhNazdpUUpYTTUyKzdTTWtpSkZXS2dEaXdVa09XYVdONENUSldROTZj?=
 =?utf-8?B?UEJsYzdSTHRGUGpBelN2Y09pdU5nazN0TmVOM1VlRGhkZHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6970.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVFRcVBXTGJlSmRjRmkxM254dVR5WmdDdnVXZjkyTUdWMjZuL1FkZjFmbE5J?=
 =?utf-8?B?Vk95eVNkSkJ5eTFBNWRaWEhkU0dDRGJmZ2JJMzAxV3R1NEgwRkdwNDRSY1R3?=
 =?utf-8?B?dDNRZ0FpS295dEt1OUxGV2FFWjk1b2NUbWNtS2pJTGVUTEdnQm1HVkk4TXdm?=
 =?utf-8?B?OCtiODljWW52bzJYRzd1RlcwSWF3ak5rdk1uazBtNC9aL24xc0ZPY0VTQjhR?=
 =?utf-8?B?OENweVFrYzBSMXdESmpuT1VNUnAyTUdhdmFoWFlCWDI5OEJReHBvSGFFVTR3?=
 =?utf-8?B?S3lJeEJYdXk3Z0J6NGxONEJ4SGViWXZxQWQwRmtUMlZlNWcxeUY2enVXdEJP?=
 =?utf-8?B?c0JwR1I2U1NGaVcxTFU5MUxaSlF1TjVGa0hDVVpXRjVrb0NITGphd2dUcGhR?=
 =?utf-8?B?RVc4VGlSbzVZOXJwMGY3YW9tYU1naUFvenAyd2hxdGxPd1FHNEVxMnhrODhF?=
 =?utf-8?B?azJsSTBmMDdUUEN6dmtoQXlrNGdxVTFQYll1REVkWEl6K2VFL2xEWFBRRFhi?=
 =?utf-8?B?NGljYnYvOEw2SGdWanB5dlVDRWVyR092cDdDcllHUkZkVjJ2d2ZuZlNRWkNv?=
 =?utf-8?B?ZjhNR2x6Qy9YUlQ5V245eDh3Q0ZXdW1tVVhPZ0VHOEFZZVl5ZzlXQ2F3VXR0?=
 =?utf-8?B?czY2OXZHY00zMm8zanhNQ3Z1UGxGZ2RnOWMwQXdFclZyR05EKzhobEluK2hu?=
 =?utf-8?B?bE1mcnpsdnRodnpiUUEzK2U4UGIzelI5V2RBTmFFOVR2ejFjanBBcm11WC9p?=
 =?utf-8?B?WEZ3eEtnQ1h6MDFuUWhZR3JCV29yNDVETG1CL3VjWGRUWGxiaEE1bExCWWhC?=
 =?utf-8?B?UW10QXEvYzFQOXNRZnJzaU9zNDVKWXduY1pGZDB6VGdCdGRrZU15T3hHVWVW?=
 =?utf-8?B?RHRjTHNYRm5jOUJyVTJKU09jbnh0Y3psMzdnYlROdWgxZUdtTFJ5VlkyRzlM?=
 =?utf-8?B?Zmt0U2ZJaGF2N2UrSkZnZUxmTFNoUGNBdDV3b2RFMFVqbWNXallXOXNMU3Fu?=
 =?utf-8?B?OVJ5OTVXeWxXK2xWRXdyNXRiYkd0L1pkS1hqbTcrdHA2LzhjK0ZBNDhsenpL?=
 =?utf-8?B?cllsbXpwQzRvUDdDNkMwd0dhZXFsUGY3b3M1R3hVOXlORnJrQWhYV3YxZ1Ni?=
 =?utf-8?B?OWJIOU1WNTYySnBUcmxCb1NsekpqZjRiaERxQ3A2RDlDZDBWNUZ2SzZ5dXcx?=
 =?utf-8?B?Qit2V1VnazNFVlN3Vjd5cG1Wc2tvOUt3Mk5nMGV3Q1RNTXQ0MUkyQlpnZ3pI?=
 =?utf-8?B?cDlPRzlYdmZGS3dSUDRQRUFhNlZGeEZoMnE1QitRUTBYaE5rRE1BL1AxRTFp?=
 =?utf-8?B?Qm9kTDR1TVNNek1jOHFPYUk4clB0bG40VXdENW1XeTlidlM1NkNYUHp3RnJy?=
 =?utf-8?B?R0I5a2RjS0Fwd2hNYi96US9DVnd0YjltelEzdzhoUXNBTTNBNmYxSk5tcmJE?=
 =?utf-8?B?N1U4T2g4dEgvWkZzdkt4KzRObkJIQ0h6VGVic0NkeExjMXM3OU1yanlZMXVI?=
 =?utf-8?B?eWN4UWFFYmtYUjJtMWJFeGxZYU5Wdkx6Yk5sbDl3QTVtMkFlTkt5R3hDU0xu?=
 =?utf-8?B?M1pvOEVPMGJ2d0ZnaTRNY2xaZWtIZWFyZ1JTeDlDQmU5OHV2ZUR4eEFJN3Jl?=
 =?utf-8?B?eGRuTnh5UmlycEQrdHpuL05UZGRqWms4MWZOdlRua2tHYWhnQk8xbE1ob09H?=
 =?utf-8?B?QUJJZGNqb2RnUktINno0dy90TllyaTV3dGVhN0hDYzZDSEVnQ1o3UGxrRVgx?=
 =?utf-8?B?RGJpMXdhVXNOd2J4dUU2eTh5YkNtZFlPK1ZJbU5PRkRxcnpleVBMcnNjRnRM?=
 =?utf-8?B?ajJLRGx4MkJxb1dmWDhzMW1xLzRTRzFBZ0tEdjlWL09zWVNJYThZUndGQTdT?=
 =?utf-8?B?ejBTUEo3WlRDeDA5dWFaWU9Ta2pYSVZib3lpdU9ENzc5dGxpRmRqejdqaHE5?=
 =?utf-8?B?S2laNzBFOVJEWThQbkQ1NUdGK01DODNZL3V1VEZ6THpwcUY0L0FBeUtIZ0lk?=
 =?utf-8?B?OUFyR3JMOUNwei9KRmlHQ25icnl3QzBKTElhN1FnYURFbnBLWWZuRTRJVGM2?=
 =?utf-8?B?S1VNZjNpcmoxYTJKT3l6eVhuL3doeUc1amNOY1ptb1RNbnE0cytFbDdUblZh?=
 =?utf-8?B?R3p0aVJ5SXBpWnFxd1plb3dyaEcxSTBWSnE3WlFYUHZSN0FwT2VSUm1BeE5q?=
 =?utf-8?Q?G908NMa0ApZ3VUhe0kcMf6s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0417c13c-59a3-4a16-85f9-08ddacbac6ab
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6970.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 09:47:15.8674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rppQsL/L8cvgKbf09oTiUueQAkYhcCubm7r/ll/rwSa7PMhO6vYBKevsWP9kUXf3qBpM1hA3wEa7Tha3axitb/tcaAosDMgRXuU4DZrJlIuSdgq56A6mMd1UT8E128z2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7190
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

On 14.06.2025 01:01, Dnyaneshwar Bhadane wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Media version 30.02 should be treated the same as other Xe3 IP, but
> will have a slightly different set of workarounds.
> 
> -v2: Extend the range in existing WA entry (Bala)
> -v3: Revert v2, Do not extend the range for the time being(Matt)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c        |  1 +
>  drivers/gpu/drm/xe/xe_wa.c         | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  2 ++
>  3 files changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 8bb698786334..5ff2169019ed 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -197,6 +197,7 @@ static const struct xe_ip media_ips[] = {
>  	{ 1301, "Xe2_HPM", &media_xelpmp },
>  	{ 2000, "Xe2_LPM", &media_xelpmp },
>  	{ 3000, "Xe3_LPM", &media_xelpmp },
> +	{ 3002, "Xe3_LPM", &media_xelpmp },
>  };
>  
>  static const struct xe_device_desc tgl_desc = {
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 6baf369fb330..f51218a7a580 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -285,6 +285,18 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
>  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>  	},
> +	{ XE_RTP_NAME("16021865536"),
> +	  XE_RTP_RULES(MEDIA_VERSION(3002),
> +		       ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
> +	{ XE_RTP_NAME("16021867713"),
> +	  XE_RTP_RULES(MEDIA_VERSION(3002),
> +		       ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
>  	{ XE_RTP_NAME("14021486841"),
>  	  XE_RTP_RULES(MEDIA_VERSION(3000), MEDIA_STEP(A0, B0),
>  		       ENGINE_CLASS(VIDEO_DECODE)),
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 9a691045831e..d67202c07bc9 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -59,9 +59,11 @@ no_media_l3	MEDIA_VERSION(3000)
>  		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
>  16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
>  		MEDIA_VERSION_RANGE(1301, 3000)
> +		MEDIA_VERSION(3002)
>  		GRAPHICS_VERSION(3003)
>  16026508708	GRAPHICS_VERSION_RANGE(1200, 3001)
>  		MEDIA_VERSION_RANGE(1300, 3000)
> +		MEDIA_VERSION(3002)
>  		GRAPHICS_VERSION(3003)
>  
>  # SoC workaround - currently applies to all platforms with the following
> -- 
> 2.34.1
> 
