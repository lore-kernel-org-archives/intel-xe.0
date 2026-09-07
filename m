Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF69C79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 08:38:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C5310E436;
	Mon,  7 Sep 2026 08:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="edWG5FS1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D0A10E436
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 08:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788770287; x=1820306287;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sYekLiIhyUOh2H1kOPtQlNwQC9scY34YHhY2hCtgYG8=;
 b=edWG5FS1K6fPnP7aOuM5SCdoxskPXUP6yiCxkaBpiOxzBhdIqddrM3YY
 X6Yuu/oCzhQ1OryDYqlQEh7tImdoF9WhTNJvHMIo8dm4ZNXByyr/atBwS
 LEdCW0JDs1FsUqi7BaJibPxDzninWikoaWSHV09h8p2bxQGVChx5ikVvQ
 xhKUvPUirAx/P4Wli+/eBPiCPN1xtff9gq1xYDj7/VONe30++RtWIstL7
 tmlzow9e55c2MeqQ9IB4/Qrqc7Z2W10Qq3CY4Pq4tA57UTc9Ci08qy2Wc
 Q37h9LqKxn3SjSLpXdiGILd75v24gCNxmOXFamw/sT/q1yFJ+AYgu1IXU Q==;
X-CSE-ConnectionGUID: eHSsyf0SRsa4cWFwpZ61Ng==
X-CSE-MsgGUID: uocWo0wYQnKzxINGl3OlmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="92986418"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="92986418"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:38:06 -0700
X-CSE-ConnectionGUID: CRfR1UFRSziup09dE6UlMg==
X-CSE-MsgGUID: z884k69pQfSvkDLtZxk2tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="274805590"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:38:06 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 01:38:05 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 01:38:05 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 01:38:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0acAOjRqS3M32Hq3s6vvS9EO3DmuGOzAfIT5eqrzvW4uvEfOhmN/j3XmU2Oap+zMVZXNVt6Mu/ToOi7HCtc65x3IkDQSniZnGVhmGRJ6U5qhQ3bf79P1bq59bBogGqQn/83AIGLfHxeMLze7Otvhkmg2jSe01pgm5ihrM2OjPauckDpG1PPUkV11Tto1743vAPeX8lg6XWKQCDenb46unrV2faPOPCqalQ84+UerbvR5AxtyajQ/S3GhXBVpukS7z81QDtOBwFUqljrXoG67UI85eToWyblknS+YxZ8dFwp3zBqgT+/XGHO7lhAXGGS2VhblPcZHdAan9rcaztA6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPMy8fV4SIn6rMWApNyqE8xnE4DKfXS6EsJIhicXwQI=;
 b=gsX+XBESW933Taex4SvuK07YIeHMgZrrPMQ6pgi9OVRDDlSQuAGv0QWn5gIEYS1NVIOguGYS1B43MXAq5ZLXYB3iVXNOc9PSREB2xsk0FMmTkekM3qDsHB0lrE5TxTHuIFDbgA8W05g0toh/qE09eTlB32D0iL+0K0czjX//qxODeWwFJu+mhrAqMUj+8xU/CB1xGAeCadhH2HGXSn2AhumeaGUkcmOoTZPH58/E0Kz6+NlorYOQmMgCBcR1VXTEtPjaDZW+NLsvYyNxuqYWEUeXkk9gXOlNTlocZIL8es95poeJB/NnZukX+YTAco2OTVQk/LI+d0mE/46t3xqUTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by DM6PR11MB4563.namprd11.prod.outlook.com (2603:10b6:5:28e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 08:38:03 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0360.008; Mon, 7 Sep 2026
 08:38:03 +0000
Message-ID: <1b7b428a-039f-4b55-98d0-f3b5bf2c2dfe@intel.com>
Date: Mon, 7 Sep 2026 14:07:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/hwmon: Increase timeout for mailbox power
 limits
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, 
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <sk.anirban@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260729171546.3368457-1-karthik.poosa@intel.com>
 <20260729171546.3368457-3-karthik.poosa@intel.com>
 <ad776a91-9b0a-4a72-8b05-8890a7b5a4cd@intel.com>
 <2c61329e-a7d0-4524-b585-5d10fd970ffe@intel.com>
 <dc04b171-55dd-4a9d-9ba6-fb3960582e33@intel.com>
 <apUwOZpuO1kOhyVs@black.igk.intel.com> <apWIek2rVOLgbTre@intel.com>
 <eb8ea8ab-d465-4105-bb1a-db05ddf930ee@intel.com> <apWwVQkMUtIwRiIs@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <apWwVQkMUtIwRiIs@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0157.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::15) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|DM6PR11MB4563:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cedd4e3-4085-4740-99e5-08df0cbb547c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|3023799007|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: mL33dxbFvwQxgIsd/OKqemnyc9y22hPOqcoYNN7gUKGM8Bp8DhjyZjNsrqanrJrqd3iR+7XpXoV/6xGlPUz09PH5/5UfvMWDT5g46fSFw/FvI+TuWHmudrEkETwEm5IVSPECV7OecqlyYIAwHazCvMrLRtEM1epEVf2DjesY+hdtTl0UXKzvLZuz6MIFXHL3ZLvBfpZA3KHCR83A72Uj+IeBwWhLv6JJwGlPEQsBNp9U+vgR43KOal4o+1EbGLPLmkRFxTxdCbrzBNe4Det9tNIuycSaOO3XQ5aN2ZRkjrn9c+gXVRf0tCvrTZnwCv06JuOkdKsfW/MGugTI3nKDKZOzw0t77hwu5A1vZ/pXNjYx6DpL+wVDlBiDp+W+7VTOqLovud0IuS3XRCTEj2TIH1wzcu8VeeQJXQsMo9zqwPfJQCK+GS8W21lMtwMUv1DihE6bs1pY7Ss6EJMPzajN1IJMQP90iJmXSlGexp9VGg3fiKf8/V09qo2AYv0JtlST6OQfZUZ2aYyEWZospzYj6vZEIlj4Q4AQxxxiSVM+fLAXSh3yMP3Fl3UGCQEGQYQsGx4t8vkKHlRbdyd37AsGrqPEJflK8tWbKY0Gcj4519U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WS9tUjJUeE1iVXA0cXh1bk14eTBIbERMZk1PVnJZa0dZMW9IY2Z6TE0weDQ0?=
 =?utf-8?B?M3dEOGRZcnUvZjkwRnREcUowZit4RENNTXlKeEprNjJhOHY0bUdmQVVpZFp2?=
 =?utf-8?B?bnN1OGN1WFc4bFFGdUtWK0JxakVncHJEYnVkTGtHa1hLcWhnRm9kOWlOWEpH?=
 =?utf-8?B?NkNJME9LWkhoejl2WTdqNXNSYldJOG1NVFFUK21Nb0xwVml0TWd4TzFKZmh0?=
 =?utf-8?B?K1FHdGpTNFZnOHpmc2JBeUhOWHR3YTZrL0xhR1RMQTQrNUpndjVUUjFXWUNz?=
 =?utf-8?B?dkxjd1YxWVFOTURNcDBBUERiWWtlRG4wTnY2MmQwb01ZMURneWhoWHlyMm5x?=
 =?utf-8?B?WVdZSmhLcTdxWjhMZFlPOVN0dXVjeUxNeDN4Zjd1Q2FWM2dBbkNpbVdNQWh0?=
 =?utf-8?B?VFRKSytxRkhoTGhaWE1rZk5GYjAzQy91N0p0dWF6WURKVjJRVWhia3ZIM0pj?=
 =?utf-8?B?TU1oV0xrMm1NdTUzWnZQTW5zMjZaT1dmYWYwQndwMVF2YVNzNC92SEpod1dw?=
 =?utf-8?B?aUVtSFBXL3o2S2Y5RGtMT092UlI0a0ZqV3loSmd6Y2pJY250ZjA1UjU0R2Fi?=
 =?utf-8?B?VjhFVlRrV0RqM3NZbGhiV2hYNGZFWlNGaEZadG5hZkZUZnVBRUxtM3cyM2Na?=
 =?utf-8?B?UmxGUXVZclpDREp4WGtCSDcvWlVJM25OcGVodmRVaFhUZkZpQUZveE1mUndB?=
 =?utf-8?B?L2R0c3VzZzhuVUJIRWlzUjR4UEJDb0tLTnlvK0d6dXlVZHI1U21sMEtoMkor?=
 =?utf-8?B?UjUySnBRZXQyV0ZKMHdZZEhoRDdPZ2dlc1NEU3lEQjlmbGQ0cW1xTnEweDRz?=
 =?utf-8?B?enhxalVNSWZBcGc5NU9UL24xVTJmbGJ5ZTUwWXBvQi9vOVVjNGN4dnZhUnk0?=
 =?utf-8?B?Y0FxVlhNZm5pWWw4UzlVRDQwUW80WS9jUVR3Mzg1NVRUQThHNjJDaENjcThB?=
 =?utf-8?B?Z1VCVndoenUzV2FaNFlocjR0WmdOenh5bVd4WVJaZzBJcjRlUU5uRTczKzdB?=
 =?utf-8?B?NGl4K2R6VFE0TU5mVzhZSVlXamdKK1R4K3pIODk5OUEzSGZQRGhaZjMwSU1I?=
 =?utf-8?B?bFFjRUtKTmR2cTA0N1BFVjFDSVNxK1FNU1hNSlVxZlRmak5zMGg3U2F5RkdQ?=
 =?utf-8?B?NFRWalRTOVJOZytqTHhTNHMwUWJ3Z1pKOHNZZmpnZkluSnQrV2Y5RUZMdWVF?=
 =?utf-8?B?VDYvTmkzOVVCMWlrNDdYZTAyOGdmL0RPc3VDS2ZReTNvdm9IOE5NTmlEUlpD?=
 =?utf-8?B?OGtlek8wZFJncWp4aEJzMUgybnVXcTNwY25kZ3YxSGw4TU9JeHdWV1VMbUhZ?=
 =?utf-8?B?VlQySDJWcmVOWXFFWG5VN3NFWXphWCtvWWUzdTIya2RWRDIzYmFqTUVrMEZ0?=
 =?utf-8?B?cVhPeE1rcS81Wnh0bm5JQVBWaU1FcVJLaVFIblFSMU0vdDdlZzM5amZEQ3ZQ?=
 =?utf-8?B?UXFnT2lmbG4wWHpUNDlURHBYQTBpcnQ0cGk5K0JUSWRFQ2g1SVRpaFhVdHdP?=
 =?utf-8?B?ZnVXajBiWlYzcENjOUhPM0hlSjYzQ2pDYVhMTUlUZnY2Y1RsWkwxSzU2ajNF?=
 =?utf-8?B?d05Rd3FwMFBLd2JyNHBVcnlhVGFyeDBsbXN2amRIVHVyNUFVOVhwK1YyajhH?=
 =?utf-8?B?Smk3YXd4TEEyVURLWElsdHVZampkcjhLRG1lUnVUNXFJK2d6WW9TOEwrSDl2?=
 =?utf-8?B?UEdpRjFrRTVkM2ZZdkZRc1hDaEs1dG92SlpxMFBOeEhoS2dFTnRzTkRLd1Fa?=
 =?utf-8?B?OFhuTkVyVmFJWHNhRmpOZ2czSnRKS0JKaGlCbHJ3V3M3R1lENUJKWm9WQ1lR?=
 =?utf-8?B?R1UybFBLVlZyYjJSYUg3UC9yN1E3bTJ6YmdqOWR6TDJqZHE3SlZvUGVNOW11?=
 =?utf-8?B?YVVsWkhaaHBxTlRmY3VILzIvTUJDVWk5bERtVFNva2FzZEVLSi9oZXIwU2JF?=
 =?utf-8?B?NkhzNFNjNXNCUVViNmQwWE5sTmM2RmJaaU9JeGlTaHd3ZFk1VlkzdE1Xa0I5?=
 =?utf-8?B?bXFNU3d3VERCL2lDWDRLUGFTNlI5bHo5SHlYK1pCS3Bka1BJUGRmMWszN1Zl?=
 =?utf-8?B?UFNEenpGNnc1QUhxcFFmS0NUT3FXZTRZeXd3NUtQalpFbXpSU0Z0NFQ4bmRj?=
 =?utf-8?B?Mi82TlhyKzlISjhNY1ltWFk5WEo2ZGhmUEF4eVlIZzZ6Znhoam9tTFRyOURJ?=
 =?utf-8?B?MUtSTVdFVGtKRlk4U2twOFF1b1hzQWt4OU1YRktVRU14UHFGcTM4MHhFR0ZZ?=
 =?utf-8?B?M1dyY3lOZG5aRWVTZ1hQOTlINy9TNHd0b3JRbCtZblYxY3NMVitFZWxwVjJu?=
 =?utf-8?B?aWNrOGJyZXRFZ2pkK3poeDJhM2ZicDJ3RitIY3JHbFdjMzJpbXBZdz09?=
X-Exchange-RoutingPolicyChecked: tf1XsPe9liZwunWTFrbniAvWAlMWHxRzeV94xPam2kaF+Uqf5I8fQ7+eKO4lqdr0e+BLdaDH6YqgJodcTBPvAF84jUonvSc3ytQrhXDI/Fz1THRcrESL8SJM+BuFH3xUSOVd8I702osn6EUTA/7adRduyyqFO7z6NP/uAZUoiHtOKsQiUZ4bNlHEVCGdYsfyuWKS9UUFcNmd+eNx40vyIVf8lJHJmgvWt27lMHMmwdZ8cREyJXjErTnAt0NQGIugb7UtT6hr1EV3iMTUNCJfy2uou0KD/XOgCsKsRYvc+/ATeCG8eaOpJs0vMZ3pbXx34EmVk6fvafRKmfFY5AN87Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cedd4e3-4085-4740-99e5-08df0cbb547c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:38:02.9569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jGChwb6HC5sgqJbwmVOW18Rf96mZxOkLeMIQI1K8bezzb/kU9htv161xDc8ag4OeF4MrgP0S2AuRcK59mh9GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4563
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


On 31-08-2026 22:18, Rodrigo Vivi wrote:
> On Mon, Aug 31, 2026 at 09:57:26PM +0530, Poosa, Karthik wrote:
>> On 31-08-2026 19:28, Rodrigo Vivi wrote:
>>> On Mon, Aug 31, 2026 at 09:41:45AM +0200, Raag Jadav wrote:
>>>> On Mon, Aug 31, 2026 at 12:39:50PM +0530, Tauro, Riana wrote:
>>>>> On 31-08-2026 12:24, Poosa, Karthik wrote:
>>>>>> On 31-08-2026 10:59, Tauro, Riana wrote:
>>>>>>> On 29-07-2026 22:45, Karthik Poosa wrote:
>>>>>>>> Mailbox power limit operations can occasionally take longer than the
>>>>>>>> current 1 ms timeout, causing sporadic failures.
>>>> Why?
>>>>
>>>>>>>> Increase the timeout to 10 ms and rename PL_WRITE_MBX_TIMEOUT_MS to
>>>>>>>> PL_MBX_TIMEOUT_MS to better reflect its usage.
>>>>>>> Why is the timeout applicable only for power and not the other
>>>>>>> attribute reads?
>>>>>> Because the timeout is seen only with mailbox power limit commands only,
>>>>>> default 1ms timeout wasn't enough here.
>>>>> Any reason why this is not seen for the other reads?
>>>> +1, these things should be coming from a hard spec with valid technical
>>>> justification and not some random email asking us to do so.
>>> Well, you have such high expectations :)
>>> Sometimes we have to live with the empirical... while we hunt other teams asking
>>> them to do their job correctly, of course...
>>>
>>> Interestingly enough, I just found in some of the many spread pcode docs:
>>>
>>> driver_to_pcode_mailbox_spec.html#mailbox-response-time
>>>
>>> """
>>> Mailbox response time
>>> Mailbox response timeout shoudl be set to 10ms as worst case.
>>> """
>>>
>>> Perhaps we should simply change the default to 10ms.
>> Investigation is ongoing to understand why some pcode mailbox commands
>> occasionally take longer to complete.
>>
>> Until then, using the documented worst-case timeout as default timeout seems
>> the better approach.
> I agree.
>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> in advance...
Raised this patch series with the changes, 
https://patchwork.freedesktop.org/series/173492/
>>>> Raag
