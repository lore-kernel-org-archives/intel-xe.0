Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851AACAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 21:57:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8A610E858;
	Thu,  2 Oct 2025 21:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XtiA/IHC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54DC10E858
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 21:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759442245; x=1790978245;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=P9aqV8PVwGBK61CQKNn2dJtxo5VhPcQOBJTSs4X0oJE=;
 b=XtiA/IHC/OLLC81cSkQsZ4rjNf0udLrTylwVpFY6zLLFKelWLsv20sB8
 FtnTKdf7acALjI1TgyMkP2BmNsMFFT80y2fJMLmAEYVSDSYOEBL5FyJ8I
 dPKgGQLSpeZEJ46WJqB2DrMKE0lXM0Ev/GiKA+CHVY4X+ecEK70Kki9PD
 mFlXinMfHXxgD1RiYRzkLTi9Lu2m67iyi8XUUGVsakWNMJaYlXW/pxfqi
 UNxnTQxprTnR9UZzTIIh6WNOvkAAv5bo8e0yzeCZl6hkEXRbXLc4oz0Mx
 Q5pKyRBORunvRhGY2ov3r7I5BTVUcCV3ejObeG6U1qBZFoW/9+DIEqog/ Q==;
X-CSE-ConnectionGUID: nUDgOkYMRQynpfU6NLNYNw==
X-CSE-MsgGUID: ds2mCxXqS1Sx5qxS2tfjmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61621809"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="61621809"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 14:57:16 -0700
X-CSE-ConnectionGUID: V59meEJqQhmXfIw70kPq0Q==
X-CSE-MsgGUID: /APQ10UXRJegui1Z2IveGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="179928368"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 14:57:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 14:57:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 14:57:13 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 14:57:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNBCKFIRB8I2ho43zVOOrE5tYcdc8uI57JQwAhzTvO8EV4K2IFJvMgi5jY3ErgybttWZEc2JHFb5egj0yr5eRHkFjRT5PJ/O3/m8HuAXB+cj0lpzeQp2n9Kp5saonD/3QF8/65u3A1Gdqd8uKBcdNFOkPVFhUpTAz3lPkbJt3hrNrenl6114tTE7X1GmccU1ScRO3rYFz/iAfFEKYtMmsUKnmoyAjNVEHkXuJAnNZmgIFySEsJgyg+2t6E4eQMcf4gfk0P4EZr2757rBuQoKB5lVhvUOB3cXd1TN8fp62Ksm1I7kCJFv4Ad7TSqpA6O1U2LI9q6xq+UqFMqIdgXAZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qewigw9LD92D9AXtU5JxtlJf8rV83J9Tg36XKncxU/o=;
 b=x8XrtTfcCJBQcSlqrjk+ec+5Y2sypEE9ODL0hkfpcnX7BkW6GEfH8JpDqgi8oUFh02hF9v5ZR1bTJmC9dn7UJiMw2/2FEaRw7ggVreEiTiK7Bv69/FX5hDD5b1dC9odnM4pdCJT+jT9nnsCE6uHisqy+ovr7T5op2ZanwRfn9PN6VuGfMCrOblN8UgRNA/Mhp466gcLZMfqJ6ZtZ0twxawuZB9dH5LJjyWQ4uBHKSLK4OiS8vNYBTDZN4ky+6H/dsvLrIU6HWX2hsd8MODX7vMODSgy9TEzTDM3czFN/fgL5pqBEbe8DNpEH4vzMIytg5IEm24K3qq2i/RmJd4Domw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6706.namprd11.prod.outlook.com (2603:10b6:510:1c5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 2 Oct
 2025 21:57:11 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9160.015; Thu, 2 Oct 2025
 21:57:11 +0000
Date: Thu, 2 Oct 2025 23:57:08 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/6] drm/xe/pf: Synchronize VF FLR between all GTs
Message-ID: <sk66pb7sb22ptycfq4xi2dyj6qltel7yop5vln4tsrqatsbpgh@kinwoqgqvgnu>
References: <20250930233525.201263-1-michal.wajdeczko@intel.com>
 <20250930233525.201263-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250930233525.201263-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: WA2P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::21) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aa8b68f-fac7-4642-06bb-08de01fea3a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFJyZTVxWGk2dW9CZmtiMVRmZVBvaGdLTjVDMXJ6RnVlSWM5SXdYL1QzblRJ?=
 =?utf-8?B?Qm5YUm9pVkYyQXJDSEdWV1B1Rzc3NTk1aU9yRmVvc3QwaHovNWYrN29TQldk?=
 =?utf-8?B?UXpQTi9KYy9XandwR2RCQlhZV1ZnQUtKdERsZE1QTjhrVDhvbW13K1ZLdlhw?=
 =?utf-8?B?UVphSERhSXdSN1l0d2tqRjJwZGQ5RkdhK0NydWxiOGdzQWcyV0VaNTE4YWFZ?=
 =?utf-8?B?SEwzb0FoY3pMYXByeFRkaFFDeTlEZUJNZ0tJMjcwRTNSYWhRYm1mTWNSWENZ?=
 =?utf-8?B?a0JtV1IxRnMvWCtBbGVVV3ZLcmlNZHRBNlFPcmg1a2tyQVUxMUd2Tjkrc0VV?=
 =?utf-8?B?cC9jWXFxdlo4S2F6a0hzR2VjOWQvNDBvYU5XTVZadGgrazE1TGdQRXBtL1dG?=
 =?utf-8?B?blZuYUhneGY2dU1rdVJabTBET3RvQ2V4Zkt1TzRXWEJJcmlkRjBOdnVLZ2tP?=
 =?utf-8?B?bmhqTkZsejNjaTVSRC9ncDJWOFE3VEx0QktNSUtpNE0rcnpRZGg1cU1rSjhB?=
 =?utf-8?B?UzVDY2FQM1NaWnlNV3BvM1pXa013RDJualROT0FYU0RJSmFiWWNlYlFhMnVH?=
 =?utf-8?B?YkwzK1pxVEhjY1VSZXRuRVVTWTk1cStsamVQZ05uNDdyNkxjVldhNFlHcW1P?=
 =?utf-8?B?VTFnc3owa0lqTUdmcFlxUHE4TFk5YW9TMnA1UCtTV2xqQ1dhLzF5MnVwYUVP?=
 =?utf-8?B?MmNVN3pjd3pSSysxMEFQUHZ6SWREQnU3Wk80dHNMOW1Sd1FFUDVXNzFIL3Fk?=
 =?utf-8?B?V3JTRlFtYVgvbllqK2VsMHVvWFlQYUJad09Zd2xTM3E0N1AxTktJMlhMRmRP?=
 =?utf-8?B?eTlGMzVQNnFjdHRzUDdtWExxUW5yRXFkZFZvMFFZaTdWQ2ZhRWc4KzJvY1hx?=
 =?utf-8?B?SkI1RkM5VXN1VmxkQ0dMMkJkbyt1dzA0VXlLWEE0UTJpMVdYUmJvVXdqRnJx?=
 =?utf-8?B?a2ZLeUNYVGdJamZjN0RLd29DVERsV3l0ek1MRitBdGxxNjBPVjcyVmNnNUtM?=
 =?utf-8?B?TFdLb3JZQXhZWmZUYzdSdHBsTVgvSmJFWC9hRlUvMmk5VVlsSTQ3OVRjZ3dH?=
 =?utf-8?B?OTc0RHVaODdlWUUwL0JhaFFldDlSSGM4dWFtV3hRbWxhaFpJekJiMUZjbUYr?=
 =?utf-8?B?Y2FWdzloRXcvejZmT3ZTMlk3Z3AzZGcvTEs3Slc5RHRqNWlaSEJwV290WTdx?=
 =?utf-8?B?ckd0VVdtMm5JVUZmdmwwSTA5QjgxZG9oaFNkc1NNRzRDaEJoSFJjZmgxT2pl?=
 =?utf-8?B?MlhOQk5QMklhdmFpaTQyb0pWOEc5V1pVZWZab3ROSngvd3hvNkducFBWYm5B?=
 =?utf-8?B?d0NEV3phWlV0K0EzSjgwUitTcUd1NFBjNEFCeDVYaXMvVFA0ZnNjRjAxVXA2?=
 =?utf-8?B?eWtWQWVJaVN2RlEwY2Z0SFJPTGxGV1BZOENEdklIblZ5eC9YRnp2eXlCTTJF?=
 =?utf-8?B?TjUzWkdYUmN2MDNidHJVWk5ZSVErNUJmTmViakIyL3VqYWNvOE53WVJXY1R5?=
 =?utf-8?B?MFFZVkk4eitVTU93aHVXUjhIZFRwWXovZW5IZEhwSU1BdHVDQ2V6TzNMeldE?=
 =?utf-8?B?STlYQ2VvbkdkMUxuWkFrdFBzcy8rN0xnSjRzRVpWRU9RV2ZsSFgrSnNLdFFr?=
 =?utf-8?B?aEtGZEVrSThodzV5cGEwWElzY3lxTmFVN1Z1RzdsQ2JMN3F3cURBdXBuaC9x?=
 =?utf-8?B?MlFaZ3pxc0t3NnVFdURTMGRQN01Wb1AyOFRiRmVjRXNJTTloUlpqQzFYRXJD?=
 =?utf-8?B?aVZvRlRNcEpuRUpVQkxIQm9pNDF6c01IOWpCZGFpdk5rZ0x1d202SGEzWmFQ?=
 =?utf-8?B?TjFrZVZ2R1ZKK09yelU5K1E3OE5pR1NaaWFWdVFWN3hwUVk5VitaTHcvN2Np?=
 =?utf-8?B?Sm01anllQzloaVo3OFgxOXFXTFVPTHVHRHUvY3NGRFIxYy9rUFR3T2hUekFJ?=
 =?utf-8?B?U3BtYTNtM1NmbUJnNHRNY24rUzlReXNxbE1rd3pZdWR1MHhEdEVBM3NLOGRu?=
 =?utf-8?B?dTdPWDUyanlyRTl3WTFicnhOdlI4U1N4SXZIYkNpWkprZ3dYc3ZBZHdnTlQv?=
 =?utf-8?Q?0zQ0Z+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anl6ZTU0VVhSejZGMVpRSjRnTUlCWkRDWGxDMzJqbEFXeGdxekJ1RGs4Y21Q?=
 =?utf-8?B?eTI2Z2gvb1hFZ3pkNWJUL25YMURySVBTQzNuSHdlMzhzQWpOVFZ2d3dVTW5n?=
 =?utf-8?B?c01weElTdnRvSHhlbDlSSFdMYllUSzA2T1ZaRHU2Zy9wNHB5RXczVHBuZmFG?=
 =?utf-8?B?UGtWSCtBMDBHckpEUUdJUllWSERuMW9tOVhwTXNlRFJVRUJ0TFBoOEsrU3lL?=
 =?utf-8?B?RHh5by81eFFNQzZyWGRWdWxnRUQ2Z0RJcmZmVVdGeWlBb01oZ3ZVUWp3TTRN?=
 =?utf-8?B?NGRCY1JtdW4zQUNiTmJqNFJITXlFWjNLdzJYV2VLOVE2OEF1cVVwYlVkUnF1?=
 =?utf-8?B?WWtjT3RjcnpVZHhsVnZLYVFyc1hNUWpUUllENHVacFV4bXRlVThjOEw3NUQr?=
 =?utf-8?B?ZU1IdjVNc08xbDJvTENWNW1FeGdTSUswd25LMGJLa2IrR0FqZHBJZkdjdk9v?=
 =?utf-8?B?bFV1VUFrVDhEMHRoZE9yaG5lNWdQS24wcG82VXRzVTBDY0ZXRVIyZW1rL0Z5?=
 =?utf-8?B?cXBtdFp4eE1pQnFQbnIxTU9MS3dWU3M1dFcxbzB1NzhuMmpQcjFEUTE5QzBY?=
 =?utf-8?B?MGNvOEc0ZWs1ems2NGpvc3VDWUFFMlVzRzBobTg0azFiZFQwRTVlS2JwaVJM?=
 =?utf-8?B?MjE4SG5wcjNRWk5KSG9aMTFSUUl3V25kblhVditmRjQwSGl1OVl3Y0pRamZa?=
 =?utf-8?B?V2UwK1hqdEswRGZCNjFNK2lBN1o3bkRZSDQ2a2ZVc2ZRWTllSm1McTZGWkZy?=
 =?utf-8?B?YndkUmZUQnVYVVpQbERhdUFhSkg4cFFBbCtheUlzNnV0dzlybDRKaDRvQVVR?=
 =?utf-8?B?WllKQWdQMWZwZ2VtR0RXL2VpVExqWU9jdWNycDBETkl0WEFwK1RiK3YzU2kx?=
 =?utf-8?B?UG9iVVBCeUVCRi9zRWdjUmVtZ01ZTW0rVjVuZE40dGZ3VnFZM0lNcnk3VFpS?=
 =?utf-8?B?OUIzaVBsbWY0VGM0d1pCUy9UOWZidkF1Mnc1djVBSEZGNHh2MkxRQ1ZZSFNt?=
 =?utf-8?B?ODB1ODh6akNjaEZxYTVRMHZKRXZpTWdCUXNRK2VHZkc4QnBIMjVMUitkbU9u?=
 =?utf-8?B?VjlraEd3SDlmc1haNEwxQkRMVG1UV2gzYlpVeWFLZUNwRWxQbGNmbFJidzJD?=
 =?utf-8?B?NjdyZXVITGtnQzlvbW9xN2tORFAweVAwc2ZqVXFtT2c4cHg2eWxKYlZldUl6?=
 =?utf-8?B?TFBtd21ZTmJYK1l1eU9xZ3hWVjhrMUYvc3VyRHpIaEh3azJ2b1pIY3E2Kytx?=
 =?utf-8?B?MEVnb0NBSDZtRllTRXFRcWRWdUovUk5qVTB4ZkVoekdONHR3dkdPOWswaURQ?=
 =?utf-8?B?Q29TUXZQeXpNVjV2cWlKcVNsc25zSzZEUGNoRFBqS2dFOFFUT0FHQXh1VXpa?=
 =?utf-8?B?QzlVdDZLamsyZ3JuZDV2SE85OWt1eUR1bTdzZFBObzVIMUFWM3VFaldtRElp?=
 =?utf-8?B?d3hHZGpPeENFNXdpcWp3V1hlcGhqcVBLQ1ZBN1VranZhUGJNZ1c3OWI4TEl4?=
 =?utf-8?B?WWMzYXVwSVllQ3M1RmJmWDVCRmV5cHhMQVZOcmxRa3hGRkM2V2lRaHdWMkF2?=
 =?utf-8?B?QmpLakw3ZFlwUGJNMTZTK0tDaU9OTysza1RiZTRzbUxPM1R5T1lMZmhIT0RM?=
 =?utf-8?B?K052OHlyZTJGV3BJM3JwMzQyUncwNVgxUlhMUm1TaG8xVEVnM250dGx2VkRo?=
 =?utf-8?B?QTNwanFWSC9HdDA3SGtNYWh3WDV1clJVNlRMV3lQTElCSWRrUlNlWjR3TWhE?=
 =?utf-8?B?a2VSeDJPQjVOTUVrM3NhT3dQNDdjaXQvREdYRVBYTEw3Sm9vUXZpRVE0emdR?=
 =?utf-8?B?aWFzcG1rdEd1WDBxd1lad3FESVI5eFB3eVo1OThmenM3bi9JOWtnRTFqMkpQ?=
 =?utf-8?B?Q2hqN0d6dmwrRGM1cDVmREd0Z0h6eFZkY08yZnNNVUJmUU1DdE92UkN0RlQ0?=
 =?utf-8?B?b3cyemp0dThjRlhmRFJoa3QzdEVVcjJxdGlHQWgzQWJubXpId3l2R1VWNnpw?=
 =?utf-8?B?aUlXamY3M1ZQcTlNUklQalA3VHVWeTVSbmNJUE0vM3BSeGxSN3ZCckdydTNq?=
 =?utf-8?B?ZzVSNDFiazJhVUs1Vm9rVmMzUHMvMEpzSXNlbXhqcUg3M3V4d0hDeENNUzFE?=
 =?utf-8?B?RkFCb3VoVWtESDRFOFBHRUJENjJ5a05RS1BIVnhkMmJxUmp0TW12SmtveHh6?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa8b68f-fac7-4642-06bb-08de01fea3a5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 21:57:11.3681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AxWGd5o3YXrSCq2TBOFVrs4uHhijIkFgBDPkRoQhDky7pk6eoqKl8WYl+YVGPY9dnSPpyyjmemvFGRMXPUZAAvN5KJORmGvdCQjX6PfW/cs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6706
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

On Wed, Oct 01, 2025 at 01:35:24AM +0200, Michal Wajdeczko wrote:
> The PF part of the VF FLR processing shall be done after all GuCs
> confirm that they finished their part VF FLR processing, otherwise
> PF may start clearing VF's GGTT that other GuC may still accessing.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 56 ++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |  1 +
>  .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  2 +
>  drivers/gpu/drm/xe/xe_sriov_pf_control.c      | 29 ++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_control.h      |  1 +
>  5 files changed, 88 insertions(+), 1 deletion(-)
