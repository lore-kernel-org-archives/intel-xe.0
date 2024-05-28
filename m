Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997F2C25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 07:43:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C0C10E03B;
	Tue, 28 May 2024 07:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UjSwaqE1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0B010E03B
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 07:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716882182; x=1748418182;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4H8wR/yd3fiFdCkrTUQ5GJ71e90a+tu8FmdYybYUd3I=;
 b=UjSwaqE1D6o6XhdpC9YacdSPOZnjYxCzB/fAELV7NEUKoJy1rXAi2kZ0
 WGCKsU4QSkcPo3Jr/8bhiTJ0sXNZNBJG9ZaY7cbn384qDlVvikcKJr67L
 IHn1rBRYH6vzPj3LAfJhRx+lh5QOJ/o2zWrFr+05FeDKWY1jxPgCleSWt
 OdGU3lUNBsnVBB7zYXRK0CtdjNu3C29dVslmc6aUVVikgRKDyMt56yr4M
 zuLgLv/ifO2Gu8kXyvra5cLtUsUNe9o1hNfxQsYCKxwcDe/VesTSjPue6
 q2Mk+LGbT+KLE9i2bI12SMO1lU75Kiue8/AOSbJhGCL3LkYql/ZobfUya w==;
X-CSE-ConnectionGUID: E7eh3+v9TYyHcPyaAu2vrQ==
X-CSE-MsgGUID: 4UFXIiCPR1mSDAJmyQsglg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="35724669"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="35724669"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 00:43:02 -0700
X-CSE-ConnectionGUID: 0WHUhNBIQTWVz69jtPd70w==
X-CSE-MsgGUID: dd4/Ipf8QX2tSwXSXwJlrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="35586669"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 00:43:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 00:43:01 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 00:43:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 00:43:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 00:43:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tubv/MhIoS7L4z5FyjbXtfuPSfgudPMcBHDln7ZZAY1a+gJ8x1HFnDP3EtgpUdtPmK2FGeF0ybVF/UJvVqpYaEX7xl4Rrth0YvIp329w/rEBPmmzdNCSuztt7t2y3Yoj8HmZylzQ80QUNF0aQAg6Ac/09tzYHGNJdkdX8mYqW92k6f3xUnH1DvLDGLdNx+gcJXy00NyK0zJp0lFlv+GYIy0h39xRZuL+QOHynP8R7RtSlkiSCsAbVQ2va1aisvTRKl6sDrkUK/DOIrwvcS3iZJIdVW92NSWUQdLaICeENSvZ3Z/dl4JFix6y4+fNzai6YObeLfRxXv2vLl4LNfDWtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEY/nsVyIp/5zxNlud2moUi+gqn3bR6JgZf2XPF4t5c=;
 b=GKxSeG2/oQvG+pAdoxQ91PDdZUFWiFUhu7/S0LB1iS54pbQD6lQhBxMOYSzME6E00jSVzsh0y7gWpodi0uFFAAbBrcRw/Phx4ZGcIjj5Ssqf99YOO+3E+twEfsDK5YpQLaeJ+Jsmfzt9JGiSasV81gqkPB6pCucqZ+PtmOXvsx16y7NIBudL5Q2Ne1+riDq7RMCHUZ0UsuS7NZg7ZboBkyZCIV34d+n/H8BaZ/dSVFaI1kw9tmlIQR8rq3CZevaocQ2dpE6FKTZEPGWH7BsPUtElLfcyePuoXbGkusnXAt8U/cmcFpl8YrBWlZA4AjRwZCYuvPMbEa/aq0z1Wp7SnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by DS0PR11MB6519.namprd11.prod.outlook.com (2603:10b6:8:d1::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.17; Tue, 28 May 2024 07:42:57 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::3bc7:767d:bb72:a6d0]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::3bc7:767d:bb72:a6d0%4]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 07:42:57 +0000
Message-ID: <cc7eec53-abc4-4e2c-baf1-e20e84a39c28@intel.com>
Date: Tue, 28 May 2024 10:43:42 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] drm/xe/oa: OA stream initialization (OAG)
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240527014333.603914-1-ashutosh.dixit@intel.com>
 <20240527014333.603914-8-ashutosh.dixit@intel.com>
 <0cd6f261-2345-4cc5-b95c-b2c28dc79fa5@intel.com>
 <8734q2pkus.wl-ashutosh.dixit@intel.com>
 <e33226a0-f0ef-4dee-9ac1-3778c3a61829@intel.com>
 <855xuyjw8k.wl-ashutosh.dixit@intel.com>
 <4e2d7cb9-22e3-48cb-9aec-aaa07ad2f8df@intel.com>
 <854jaijtj6.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <854jaijtj6.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::6) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|DS0PR11MB6519:EE_
X-MS-Office365-Filtering-Correlation-Id: 1673ca6b-fd90-445d-8d1d-08dc7ee9ca77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmVDS3JjeGVTRzU1ZUlEL0hJdjJCTVJYWkJkUnRxLy85QzN5dzBWQnVjYVVO?=
 =?utf-8?B?WU5WTWtiaGhLbGtsN3o1dzgxek4zSzhCTWo5emRzNUdNaVJweWY0bkRFam5U?=
 =?utf-8?B?cnBWeWoreGluZ013dnV2NGREQTdWSDkzTzRiOUtxWW9OQUNuR2FETnlGeDJz?=
 =?utf-8?B?YjFMK0k5T0ExTDh4NHN6QXdvaHZKMktmRUhPLytpWkwrVlJOTVJjWlhtclJ1?=
 =?utf-8?B?RlFWMkNJdnhrdzI3SWxvVlZGVkxESW5jT3BNdlNBTTgxZkJRVWFBbytlQkt5?=
 =?utf-8?B?VTFWNzJudFBMUkFxdzUyZG9kYzlmVlo2bVZ6cnBLOUd0OFBtU1FWTzNuR0Ur?=
 =?utf-8?B?aVdIQ0g0SURBelZuQ29VOWxRSThuclFrL21jbDkrTTBxVkk5T1A0d05tcVNU?=
 =?utf-8?B?Z3pSeWNrWlByb2U0bExGb1lVeU9vODcySUVPVU9xUHBINjdsVkdSTG45YTZJ?=
 =?utf-8?B?ajR0YkY3Rml6ZmxaZVNiOWx1aVlPN09qUmQvZkNtRklHcjRlUVUzaXE4blZS?=
 =?utf-8?B?TUkxWUJJQ01vMFV4L1pKS3BUZndKVzkrQmpSYnQ3M2lQeDZ6K3B0OUljc3Fk?=
 =?utf-8?B?NjAzRm9DeXJvZ090c29WdmpPdVhXMDEvUVBuQ1U3dzJKR1BnWEdtc0VKK0FY?=
 =?utf-8?B?NzQ2bVVSS0dqSzRrQ1FnNUhKMVVFbDgzcXVBV1IwcGxwRGk1clN6SUZRMndY?=
 =?utf-8?B?Y3NQME9JSGx1SlFxRVYvYjBrTDZsYlg5OUwwelpMdEp0d01RaTRGMms5aDA3?=
 =?utf-8?B?Wk9LcHZJcW11bE1KTFlYUHo2QmZVa2FHMGtidTJIRG50RkVrcVg2QTQzdmps?=
 =?utf-8?B?TmttVFRwNEROOHJ5ZXZlWHhmaGJmVHBRaVJhVjlrQmxxSXdURm1ZRHYwV1RD?=
 =?utf-8?B?eElJc2NYbjdaVXA1ZFh4bWdpNW9zc2d2cmh3MGhqZUVZeHVuVktDalpDMWR5?=
 =?utf-8?B?TWw0TkFIOUxrYkN4ZmJUSXk4VDhYOWpyczU1UllZZ2V5UnZlRnF0WXF1RnNZ?=
 =?utf-8?B?TnpOeUVxNENTNXVkWnpmMHhVQzBVTmVwQnJlTU03UVJCeEs2VERyS05rNVBG?=
 =?utf-8?B?a0ovdVIvSUt2andyOFdrSWZBOUkreENTRk1MSlQ2OXVGd3BqMG93aUhUWm4x?=
 =?utf-8?B?NjFyYlBGY3FlN003K29BNEZmSXo2T1R4NGd6a3ljQzd1RUZ3eFV4VExtbUJW?=
 =?utf-8?B?YUl3S0pCMHgxTXluV3ZPRGd1ajkraUU0MWpkLzB5YS9pdTRsV1loR25kSXp1?=
 =?utf-8?B?d2tDeVJDYWtQVEFWc1BFNGhuNEMwSGdkbnZqYzBrZkRFR0ZnTXNpS0pZcWFG?=
 =?utf-8?B?WlFMZVlrNnBIKzBpYWQ4UDVRd2g4TkFiczRZbDdTaENYUEVoaDFWNGtLTm9r?=
 =?utf-8?B?enlIVWtPMjd4UFhSc3Nza3VpYlVTcHZUdjhwTUdBSGFiK0FWLy8zbnRkK3VO?=
 =?utf-8?B?cE1FOEljMHc0Q0t3eEV0QlpxaDFoekpzQW52QlRtaHUxeWdWWUU4VnZKZnF2?=
 =?utf-8?B?clhDclR5MjluTVAzVFZoc3dHdWZLV2pxQmVNRGc0TjVsQmdjRzRaQjYrdWUy?=
 =?utf-8?B?a1hNQlB4L3lLWTRjVG9MQXgyNnI0aWNVSzl3alVubGJabitPanQxb2dmMzF3?=
 =?utf-8?B?ODdPSi80bDZjZnZpcWpRVEZ2bC9GZnUvcGx3MXd6b2dGRFlwZ3ZHQ3ZRdUFT?=
 =?utf-8?B?Q3NSenZtTzV5YVQyMWxjbzAxYTJkekRFYVFtZkU3ODZvZ2JLUGR0M01RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qm82a2QyVHpTcCtpdkJ2YTVZTmtWQUJ2dTNGamFZQkdScmxUWGRjaXFWSXZL?=
 =?utf-8?B?NzFiV1FDOE1wcm9xelpPZzFOZXhlTU9aSTZDYkxkSW9sZ05Ha0x4d3oxQlBF?=
 =?utf-8?B?VkllMVE1cXBWT1JHcnRITWVZVDZIcU5HYU9aUHMwWVFINWFiM1FyeUx3ZFNP?=
 =?utf-8?B?MkxEUDZtS3ozVWFNdlkxNmx0WEpQMUF5d1FBRzNJcGwyUFB1SEZnVW9mejJX?=
 =?utf-8?B?MzhwWCtyUG9leDhhblNaZDRBMGJIVUkxRUwwZG9PczU0ekFjL3M5enF3UFZ1?=
 =?utf-8?B?Vk1sdkhGaTFxaHR2SmJyMFBGL0dPYzUzK1FkMGR0ODFGSEtRbnhFeEdqYVZn?=
 =?utf-8?B?bVRjV29TUkNiV3BnbkREVkxjYkJZZy9KaDBHZzBlZHZUbmI4NXZFeTN2YzZB?=
 =?utf-8?B?VmVSODlIaXY0cHJWd21DbXNKUi9yZTBvUEhPUzU3eDBqM0ZXSlJVL0dtTjdN?=
 =?utf-8?B?anUrWW9JNGswR05QMjhoSTQ2eDRNN3JxeFd6c1BaVzJ1Rkk2Tm02WnZKMHJz?=
 =?utf-8?B?SGVqVVlYS0pHUU4yL05ndWwrdFE4cFFyV2U0dEQreUJtMTNuTURWd2szOEhY?=
 =?utf-8?B?VCtlRlVyRmRGdnQvVVZsT3BRL1Nwem0zaTNuWnF5SVhVVWxvajdONmdtNlQz?=
 =?utf-8?B?WTQzVmhnMFRrQ0J3YUw0Nm9BaFhDRmlrK1RzQkNCTnZ1bktxMkpGamFPdUJq?=
 =?utf-8?B?MmxIRDh0TnMrTkpSNlZnQlkzVThWdjRiLzlockU1Um9kZ0hmeVJDckRWSWxy?=
 =?utf-8?B?TWF3L0hqblJkaGoraHZBaEtWSWJsNzZCZW9WNGNpNGlocDdRSVdMcmJWdjFH?=
 =?utf-8?B?bk9DdnlNK2JFdnNyTnc5cVNzU053TXd5djFqK1ZlRFkwbmZyQnhsM1hnN3ZC?=
 =?utf-8?B?cW5iR0J4dTE4VnNhWGV2bjhvRGRud0thMGRLYTZNZDdocGRRb3RHTTM3aG1u?=
 =?utf-8?B?eDkxSkdDQUpYaU9JSTMrc2kyT2Q3a1N4L2ZYWWhyWEhjeUNBUkFReUMzWnNy?=
 =?utf-8?B?Vnl0MFppYUs2RkU3NWJranlCU3hVYUhMWW9WVUNYNjJpTG1WZnFncGV0U3FL?=
 =?utf-8?B?c1gvOUMydXRLTzhxb05tQXpCQWJRcHFZKy9NTlhRNjBITnE2aFROV2dCQk9X?=
 =?utf-8?B?OXV5RFU0Z3ZUT1NZeWFySGZKQmhXQjN4L3lpYnBGakRXMEFoUUllbFZLNmd4?=
 =?utf-8?B?dlUwYWY0UXY5S0U2dkZxU3BPQWRZUDYrVnM4NWN4TXh6NERydEpDeElwaUVP?=
 =?utf-8?B?cGd0WGlCNlB4dzN4MkV2M2tnYUVnZ2lEVlYvQzROUm50dkZaNDJ2Q3BJOVla?=
 =?utf-8?B?MUdmemFaZEVYMkN5RytEWDFNSW9JTkVGbkJvRy9remR3WU5nTEFISlluQUp4?=
 =?utf-8?B?Y2YvSEpTRXVYZjRIR3ZOa1dOUFVvZHVmMmQrQXRhdDd5LzROTCtXNmFFQ1BK?=
 =?utf-8?B?c081eE1nMERHeDFRSHhNdFZvdXBkc3VITW9OKzA3cFJJbFU4c001QkVhVzNm?=
 =?utf-8?B?YlFwZEhobDhCclF5TEFEc0JQa3NMN05OZE1KL1k2aDcyLzRxUVRBemVBcTE2?=
 =?utf-8?B?L3hOU3BtbkU3R0daYUxNZlk1d3Npc0I2cjFPRVdqMkRaRXZWT0xBbExTODZB?=
 =?utf-8?B?U3ErTjZUQlN0emJYdC9oMEU5WGN4SHQ1Rkw0dVdHMEd6MVRXc0R6WnlUN2g4?=
 =?utf-8?B?bXpuK1ArRzAzMW10Wlh1eksrc0lXUkdDUnUzeEJsWjhSb1g0akQ2STEvYSta?=
 =?utf-8?B?SHp4L2I3SWw2SWI4aXNyakVTRldVN3Fid2NubVJqS1hmQ0JLYmZwRnYySk9C?=
 =?utf-8?B?RVBDaFlBRlJjaHcwR2hXTDBMa3hFSVRIUk1FQjczYjhRVEw0NHNyWk1IdklG?=
 =?utf-8?B?SGV2TnF6SHJGSXEvdDVZSG5RdjM0ZHZRVGVuWlV0YVRKU0JlYnkxbFRyTVJo?=
 =?utf-8?B?Z3BLMTkxK3M4Tm5nTzVhUkVkMXJpQjNhVkdLNUxtaFo5eHdlSkVPM2dhMWl2?=
 =?utf-8?B?VUM5ZlV0UGZ6OHNUNlA1ZmNaRXA0TkNJdUJwNzJBTG5ZODdzUDBsOWt1d1Nh?=
 =?utf-8?B?bXhzTHBCL3Q2eTI2dTRhVEd5THNEUU56S3Rrdzd4SFFhV0doZ204NXZxdW5r?=
 =?utf-8?B?MFBXOTJBOVhlb01qSmhWdEw3TWZqbDNSb3VwUkRwVnpTK1Y4dmpMZkdKSWQx?=
 =?utf-8?Q?SnF0s+/Wc9ZBjOiG6PUrxRM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1673ca6b-fd90-445d-8d1d-08dc7ee9ca77
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 07:42:57.0778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uiimZLWXYEe9+z6wa/7YeNPPEU4z+CahowlX3qFVS7ApJ55rqN1tVSINSM6jJxmUo86nEWFtplFYzl2mBkVj7WHPs+3GLacFBAt7e9veZ6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6519
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

On 28/05/2024 10:16, Dixit, Ashutosh wrote:
> On Mon, 27 May 2024 23:39:50 -0700, Lionel Landwerlin wrote:
>> On 28/05/2024 09:17, Dixit, Ashutosh wrote:
>>> On Mon, 27 May 2024 22:47:13 -0700, Lionel Landwerlin wrote:
>>> Hi Lionel,
>>>
>>>> On 28/05/2024 08:27, Dixit, Ashutosh wrote:
>>>>> On Mon, 27 May 2024 00:04:21 -0700, Lionel Landwerlin wrote:
>>>>>
>>>>>>> +static int xe_oa_stream_init(struct xe_oa_stream *stream,
>>>>>>> +			     struct xe_oa_open_param *param)
>>>>>>> +{
>>>>> /snip/
>>>>>
>>>>>>> +	stream->k_exec_q = xe_exec_queue_create(stream->oa->xe, NULL,
>>>>>>> +						BIT(stream->hwe->logical_instance), 1,
>>>>>>> +						stream->hwe, EXEC_QUEUE_FLAG_KERNEL, 0);
>>>>>> Hi Ashutosh,
>>>>>>
>>>>>> On i915 the changes of configuration were pipelined in the application's
>>>>>> execution just like any other submission.
>>>>>>
>>>>>> Creating another queue completely unsynchronized from the application's
>>>>>> submissions makes this non usable in my opinion.
>>>>> As we discussed previously, the plan here is to provide a drm_xe_sync array,
>>>>> through stream properties, which can use to synchronize OA programming with
>>>>> workload submisson.
>>>>>
>>>>> Would that not work? If not, we can do what was done in i915. But note that
>>>>> i915 still has unresolved hangs, which I believe are due to the spinner
>>>>> running on the application engine (iirc repeatedly opening/closing an OA
>>>>> stream will hang in i915, though it could be due to other i915
>>>>> complexity). That is why thought using drm_xe_sync array is both safer and
>>>>> more standard way of doing what we want to achieve.
>>>>>
>>>>> Basically the output sync object will be signalled after registers are
>>>>> programmed and also any additional OA programming delay (which is
>>>>> implemented in i915 using the spinner).
>>>>>
>>>>> This would be done both for OA stream open and changing OA stream
>>>>> configuration.
>>> That is true. But now that I have other stuff like gpuvis wrapped up, I
>>> plan to start looking these couple of missing uapi pieces (hold preemption
>>> and synchronization, likely in that order).
>>>
>>> Because synchronization is not implemented I add the delay below:
>>>
>>>           static int xe_oa_emit_oa_config(struct xe_oa_stream *stream)
>>>           {
>>>           #define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
>>>                   struct xe_oa_config_bo *oa_bo;
>>>                   int err, us = NOA_PROGRAM_ADDITIONAL_DELAY_US;
>>>
>>>                   oa_bo = xe_oa_alloc_config_buffer(stream);
>>>                   if (IS_ERR(oa_bo)) {
>>>                           err = PTR_ERR(oa_bo);
>>>                           goto exit;
>>>                   }
>>>
>>>                   err = xe_oa_submit_bb(stream, oa_bo->bb);
>>>
>>>                   /* Additional empirical delay needed for NOA programming after registers are written */
>>>                   usleep_range(us, 2 * us);
>>>           exit:
>>>                   return err;
>>>           }
>>>
>>> I need understand this is temporaty band-aid, since it stalls the
>>> submission pipeline and needs to be replaced by proper synchronization.
>>>
>>>> Just letting you know, because we cannot use the current ioctl because it
>>>> doesn't behave as we expect
>>> You wouldn't be able to merge the Mesa PR as per the current uapi now and
>>> then add additional Mesa patches, when we implement these couple of missing
>>> uapi features in KMD?
>>
>> We could merge only the stuff that parse the reports, that's enough to have
>> perfetto work.
> Hi Lionel, so this means the OAG buffer stuff, correct?


Correct


>
>> But all of the VK_KHR_performance_query won't work as far as I can tell.
> And this is the OAR stuff, synchronization and hold preemption?
>
> Yes even if we can merge the OAG stuff first, that will get most of KMD OA
> code merged and then we can merge the remaining stuff later. Since it's a
> pain to maintain the code out of tree, that's why even if I can merge the
> OAG stuff (together with Mesa) which is the majority of the OA KMD code
> anyway, that would be a big relief.


This is actually a mix of OAG/OAR. We do read a couple of OAG registers 
that don't come as part of MI_REPORT_PERF_COUNT.


We will need a way to tell when you've added the feature we need for 
VK_KHR_performance_query.

I don't think we want to test this at runtime given some of the ioctl 
take time.


-Lionel


>
> Thanks.
> --
> Ashutosh


