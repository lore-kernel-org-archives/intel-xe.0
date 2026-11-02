Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23534606A909
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 16:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PUOB3m1+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5CE10F078;
	Mon,  2 Nov 2026 16:08:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D892410E64C
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 16:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793635725; x=1825171725;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=KWnoWIkDfLZ6tYFu/UqB8BuCexoI9HnCOEqaeVBONeE=;
 b=PUOB3m1+x/aG+T7lFUZ677o5g+Dun6R+C9B3Y16Pi3/Cg179Rlb4aVdZ
 OAYilqWf7rKrLV+n6ubUu00nUXRiYLYxZaT9518bk1tyb7ztXegXpjvro
 dJ/G3a8mr3B55j7bLIJAH5Uaf1b/rkcwqDiIonPFde5wHUpL3JFiBzpS0
 d+H9WbX8MJcw3lZVa1BMdrJi5lRtzGFsZ5ujZIeQS1KecMf2KOGyxG/ru
 l8pviiRvMfV2qe0vdOFG2ryVSM5Cw4V4m+LYM4if/a9fKkESrc8g4QUKy
 dWMdjpIw7wATetfRO81QcbH6dsN/J95vN0naOGt3w5Z4wohKrk0eoEBG6 w==;
X-CSE-ConnectionGUID: JCh8p7gKS2O3UtXsQmD5kA==
X-CSE-MsgGUID: kzHyhEbwTkmWlNvbfl7ddw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2244338"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; d="scan'208,217";a="2244338"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 08:08:42 -0800
X-CSE-ConnectionGUID: Zdg3yraGTBGIOL03UJ4LeA==
X-CSE-MsgGUID: CTo5A+RWS1275jOnpF7vjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; d="scan'208,217";a="6173090"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 08:08:40 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 08:08:39 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 08:08:39 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 08:08:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LrC+PdG7Sn2WZciZf3qMzYjFNbMeMU2hOuyGY/MVmj6ZA+UuiXfSS+bSpCdn7/opJGKYv0IA/Xk6GmpKpl+uk/ihNMqCMqOE3Jfl2tJbVHr19lLo9FcGdDUbAxi7nLxaitejEKieYCPS7c6wed5YbrkUtOjwr/wsIzsCmLC/xQSFRZ2r81mWgnGes8iXXv104OfO7YKPpvPtMx2fgPslOX/X3V22o/PexkZpfaG8HhgsQ6URvI0FH2QuIGjjlqrthKJJbvlT7CsHFCCI2S607Zz49usukVg6hVRK2m3KtA2IaiLZ4pl2NGYmXPO0pRQMnlwgD0+UDqPFy3tgCqruCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vo0IrXY70Pl7eE1mAkYL6rMctmr3y0S5j5Iq6cyOkdc=;
 b=AaGJn5LkbuxQcbhdiGqXzPyoZuiywCxqi4EZBkUnRcs3SQ4mpzXUIyHMewGhXtzk/1gsDRDPrCoU9cdd6rCLBxxo4AfSS5wP+hrOa5maLWRG4dg/XhIcGIM8R3+XzMaro8Xx7VAf4sKB1kWymrtJ/Y406D3pFOLap9cYw/AfX7sLAoQX9SeYmp7LpE1FPWjPdUfh+hDPdW4yQLmUoQfa7TgMmX48o3dyzNeHKD2zpoEO60k15ElSSniNO6J3D2gAk2tiiwOO4qXVYqg5IFbObLHqJW27afWsWm7pd7aR+xR9hiEaPFjQhciYdr0yNIrEAb3LtoP2eKPpt96BO36xSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by CH3PR11MB021866.namprd11.prod.outlook.com (2603:10b6:610:365::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 16:08:34 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf%4]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 16:08:34 +0000
Content-Type: multipart/alternative;
 boundary="------------anq0TahjrqZnSEGxVPpiCMgt"
Message-ID: <29b91fe7-3495-4177-a08f-d1c3af6f7ce8@intel.com>
Date: Mon, 2 Nov 2026 08:08:32 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/eu_stall: Don't mark stream enabled if enable fails
To: <fei.yang@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.d.roper@intel.com>
References: <20261031060234.2404661-1-fei.yang@intel.com>
Content-Language: en-US
From: Harish Chegondi <harish.chegondi@intel.com>
In-Reply-To: <20261031060234.2404661-1-fei.yang@intel.com>
X-ClientProxiedBy: SJ0PR13CA0230.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::25) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|CH3PR11MB021866:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a2ddef3-7d83-47f0-ea2a-08df38fb8be7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|261102123227099003|261021121427099003|11063799006|261021123027099003|56012099006|261009223027099003|261028144727099003|261026140227099003|261022105027099003|10067099003|18002099003|22082099003|8096899003;
X-Microsoft-Antispam-Message-Info: F3/Gf8dZze4tXEszphp4HU7GWq9/DKpxSBS0WI1Sjzi74fboecMLyvE1NTXstlgw3zsXaf5fcdY2Uj64VyVOCRrU/BiArfqJTgCUpP15kf9DIvM89U3kyl2B3VCYCzgsvhjZNUgZ5iKj/aR1IVdLj1PSqk7yPF8XhcS1SEiUvDJulcAMWhCfvyF5S9Pr8zm19B6+9btuuUdwHvQXMNz66e18DU8Ah2YJcVphSDkkor/DZYe55tN+lny7XPXZU6/LfmIaQxY+DhZ4JZwWuCQbf6MyAKPNX+X4OgH4mShh8fZeBw5whlRL/sB8qP64OKdaxFWTSjoGNn+XHm9DjAq0FDjbAd939/DicV8mVQyj7ZHkHgGwb58gsaWMzH2kjQVYjIYoPbDsvY3/X10X+byg1DZC9ZxZs58y8e8ne9qfkpzCU+dez9Q03FO1A5eyJEobsDRNrY75iwRMv/GMNWANDLXw9sOZalr45bQY0enCuv5Ey1hVD8sT8cpC0NE1+uGM+RL7PuelCybgMfubtykUyX5GJbVvqYcoHPDVOkN6rBYz0pJzs0m0HL61cKtEhpbmtVEorwmWlpMpHKeKLnAH/7Zy2gXttbu5kxpt20UXfcCJcXAlnYwE9SfPXsMS+5e6UkAMs8/aleZAc8ryi7oCbH6Uv+mJVkh5VKujV56OMl8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261102123227099003)(261021121427099003)(11063799006)(261021123027099003)(56012099006)(261009223027099003)(261028144727099003)(261026140227099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDVHYWsrd0JubU5qT0NjeUEzb2hXUVkyUTJkeUxqSVZPQ2hyM3E2TmZLVWR3?=
 =?utf-8?B?Ylo3d0NoNnNBWVl2ajF3K04vVlVNTHovL0tHZzROdE50Y0lhQ1ZMbFlTQkFF?=
 =?utf-8?B?NUp6b0JGSWlDTHR2QXJHcUZKTXY0bmNCZEFQU1NkZTlxbmRSbTk3d3g3d2lL?=
 =?utf-8?B?cjBVR2VTOTFUaldpejk5SWxEV0xqVWZyWUZvSG1lRVFGWHhaQmNLcE9TZTA5?=
 =?utf-8?B?VzBwRmNtNmkrenFmbXlwSC9JQ3VCRXRaVUZ3eVZDUVk4WDFTRTJaUTlHV01R?=
 =?utf-8?B?Ui8rbFNTY1cvZHpnRWRLQWNoMnVaa3JZR0lnampXOGhaSmxhRlM0NklJR0V1?=
 =?utf-8?B?VHg4cGNTdmNMeVJYK0g2NlJQaHJKZ203dTBPWmZzWnNiQmtrQkRSZ1hXd1VF?=
 =?utf-8?B?bElEVTcyZXg1bnNwRXRJT05mWUdFYzgrK2lpVkp1Wm1aMlRBNHJpLzd1VGk3?=
 =?utf-8?B?Y3gwU0l6cDFOc1lXd1dJVXRtVXhiL0xkOEZjSSthUFR4NzIvT01NQ2M2WCtt?=
 =?utf-8?B?YmhUQVdGaStKODUvYmJ0R0laeTVxekZZU2wzeEZzSVhUWUpoeUpEMkpmbzZk?=
 =?utf-8?B?QVZKb0VqQTdsZnJlSDFaWkIycXhFWjdOU0psYmJkdDl3dDVuUUhCOFVZbi9Y?=
 =?utf-8?B?N0NpZUhxM0J2N0kzRzMyaDl1b3ZQZDRaamI1bXZYME1qVDc1Qy8vVHlBR0V2?=
 =?utf-8?B?V0ora0pIcUF1SXlvK0Q3MENjZS8wdmRvR3N5U1dySVY1R0dET2xjOGx5bWRy?=
 =?utf-8?B?SDJWNHBPZWgvQm9VQ1ovOFhxRHBoSW5IaFBGS2d0Y21TQmJYWm50MVNCbWhU?=
 =?utf-8?B?U1NlTDN4Q25IMFhRYm5tYjlVRkVDeHhYRUZ3NTNieXU0MEo5Z3NUV3RPYmYy?=
 =?utf-8?B?Rmx0OFhob09ZelA4b0E3eDgyMTdxRFNORnhJS0tveU42aG5jYldnM0EzS29D?=
 =?utf-8?B?b1RweTRpblJaYkkvSTVXbm5pWjk4MGcxZUt6Q0dGb0JuL2lUUEZ4a3J2aC9G?=
 =?utf-8?B?azAyTUtuUWRLZWlyRnBTQWN4SnBuNUIzeVRqdDd6Yks3c043ZWVyT2JzZm03?=
 =?utf-8?B?OTZTczQ5aHRWVDZEOXVkT2wrYyt0M3Uydm1aY2FkWVZHallCbHg2eS9yczhs?=
 =?utf-8?B?bWhtbDF4aVdicnJLaWdPNzRmVEJaZi9qdlZMdzNFYXVKYVRsbmswTDZKdGZ4?=
 =?utf-8?B?WDI3c2lRMzhLV25zdWR5Mmx4dllDMVB2OTdVRFdOYTVEeGw3VGY0UmVPcGUw?=
 =?utf-8?B?SXZFVm8zR2hmWUw3ZHY5MHg3LytUY0cyZ3pweXZsWVJFbDQvdEZRZDRIN1U4?=
 =?utf-8?B?cTFJcThzSW5WanVmTHpHZ2lDQ0lkUmNvNDRUREVzUTM2aVQ0Mjd0TTQrNHdC?=
 =?utf-8?B?TEtJZkFZcFYzS1V6Z2ZEV2J4YklyaWFEUFRMSVEyNVlXS3hEaTQ5Y2t1MVdy?=
 =?utf-8?B?WmtLZmhoZWdDWU8zSzA3NVpURWI1a0pTQWR4NFY1K253ZXhWdEh3ckdRdXUx?=
 =?utf-8?B?OHM4UnpNd0hiZ0gzU0xyTVlwUkFyQzFpLzBISmtTMWhYMlQ2TnZmcXpZSXNY?=
 =?utf-8?B?NFJrRW5QK3FrNVhCSENqbHVSL1lwQmk5WWxnLzN2V0FRYW1OOTNoaHB1amor?=
 =?utf-8?B?Q3Z1WGNCQUFyekNUWFZyMXNQdHZiTTVEZFIrV0dkRkswU2p6THNEbzJxTmow?=
 =?utf-8?B?bkl0QnNQWXN5ckdraFd1QTJ5blRyNnRSUzhiRk5MamZpaGRvSEFVRk8zL1Bw?=
 =?utf-8?B?S0hmWWxlbUl0b0NWUi9XK01kUmdzTmZOMmxDVHc4L3pzZXIyNmwyTXB3K2My?=
 =?utf-8?B?Z0x2VG1sNkIwZDg4R3NMM01ZWGhIaUJPNVRZZy9sWEI0Z0NrWThvNStnOTdx?=
 =?utf-8?B?NE9samR6WC9MREoxZkJrMVM3Zy9FUVJLUmtCbUdEaHFwWkN0dVgxR1pWT3hL?=
 =?utf-8?B?RndnanhTZDRLUEtXUmNsN2pWekFKUTNaQWxJbThjclpERnJxU3FMZFVHdTRD?=
 =?utf-8?B?c25JRHl6cFduOFJwNll0cWc3OTNZcmdOMVQrNFlSeDRweElobXVwNHIwcHJI?=
 =?utf-8?B?b3ZDMHNjaTNNVEFIZTNWWGZPWWNON3NhajMwTVhiVG5zSmpHc0ttK0t5dVkx?=
 =?utf-8?B?WElqa1pZZFAyeEs3NXU5ZnBFLy9IQnBJRWI4dk81MW9lWlhQR21pWXlxYk1j?=
 =?utf-8?B?QkxxOFhZMUlKdFcxNzJrdm1vbzc2M01pYm9jalIxKzZZQTBPVlBMeTlnTmti?=
 =?utf-8?B?c2Zob1lnVUx4eVlvOVk3aFBqWXRzUjZBTWxpOGp4b0xhRkpuZjY4Z0MvbXhm?=
 =?utf-8?B?c1NZK1Y2WEJQaG5ic05KM05rU1hDVXNxRGtOTzRHdDZ4Q09oUFlnZ1k0S3Vn?=
 =?utf-8?Q?5cbMqPCPQF2Vb9qg=3D?=
X-Exchange-RoutingPolicyChecked: TEHd2A1Jvz7bPJAgj3lQCNgMgOylrI460NTh/AILH8wNGgQnn5x5bm6jTGpGa25AUA2KPpAeN8fY4lVYrSBRd9xsuOrS1eLQoFRslau4sP8+fYGCg6OPlYtc625C24w6UEOD/UJ3wZuD7Nqsf5VMbcNwMK/FQTa40aKhNttJVFDHkuzndE9YcP6eNzy5thToPbMN4j886SASY7SWrqPpEUHiVyVGf02m6H6p3RAW+YP7ejGsjnEEWdu1yupsl7tiA7ZaRNrE3ihX6yeedSyfQ0vh09CVeu5wcOAYFj+DAj3MKzGQ3YrVyhP8LikGcE6pFytykey/ZsAa0tudjLfgYQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a2ddef3-7d83-47f0-ea2a-08df38fb8be7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 16:08:34.8240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cn3IIas1ZTzHxXnYCq2X/8S1NxzdsOiq2W2FzKNuVjpHq5alBV7W8YAm1vikjo93BTD7Z99cjGZvfleTTohO14Qj413+B31LpGXQYlsyzHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB021866
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------anq0TahjrqZnSEGxVPpiCMgt
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/26 23:02, fei.yang@intel.com wrote:
> From: Fei Yang<fei.yang@intel.com>
>
> xe_eu_stall_enable_locked() set stream->enabled before calling
> xe_eu_stall_stream_enable(). If the firmware ACK timed out, the enable
> path had already dropped its forcewake and runtime PM references, yet
> the stream stayed marked as enabled. On close, the disable path then
> released the same references a second time, tripping the forcewake
> refcount assert.
>
> Only mark the stream enabled, and queue the poll work, once enabling
> has succeeded.
>
> Signed-off-by: Fei Yang<fei.yang@intel.com>
> Assisted-by: LLM

Reviewed-by: Harish Chegondi <harish.chegondi@intel.com>

Thanks for the patch

Harish.

> ---
>   drivers/gpu/drm/xe/xe_eu_stall.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> index 8a7c1b5d5ab9b..c918fe3851c47 100644
> --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> @@ -849,9 +849,11 @@ static int xe_eu_stall_enable_locked(struct xe_eu_stall_data_stream *stream)
>   	if (stream->enabled)
>   		return ret;
>   
> -	stream->enabled = true;
> -
>   	ret = xe_eu_stall_stream_enable(stream);
> +	if (ret)
> +		return ret;
> +
> +	stream->enabled = true;
>   
>   	queue_delayed_work(gt->eu_stall->buf_ptr_poll_wq,
>   			   &stream->buf_poll_work,
--------------anq0TahjrqZnSEGxVPpiCMgt
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 10/30/26 23:02, <a class="moz-txt-link-abbreviated" href="mailto:fei.yang@intel.com">fei.yang@intel.com</a>
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261031060234.2404661-1-fei.yang@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Fei Yang <a class="moz-txt-link-rfc2396E" href="mailto:fei.yang@intel.com">&lt;fei.yang@intel.com&gt;</a>

xe_eu_stall_enable_locked() set stream-&gt;enabled before calling
xe_eu_stall_stream_enable(). If the firmware ACK timed out, the enable
path had already dropped its forcewake and runtime PM references, yet
the stream stayed marked as enabled. On close, the disable path then
released the same references a second time, tripping the forcewake
refcount assert.

Only mark the stream enabled, and queue the poll work, once enabling
has succeeded.

Signed-off-by: Fei Yang <a class="moz-txt-link-rfc2396E" href="mailto:fei.yang@intel.com">&lt;fei.yang@intel.com&gt;</a>
Assisted-by: LLM</pre>
    </blockquote>
    <pre wrap="" class="moz-quote-pre" style="white-space: pre-wrap;"><span style="white-space: pre-wrap">Reviewed-by: Harish Chegondi <a class="moz-txt-link-rfc2396E" href="mailto:harish.chegondi@intel.com">&lt;harish.chegondi@intel.com&gt;</a></span></pre>
    <p>Thanks for the patch</p>
    <p>Harish.</p>
    <blockquote type="cite" cite="mid:20261031060234.2404661-1-fei.yang@intel.com">
      <pre wrap="" class="moz-quote-pre">---
 drivers/gpu/drm/xe/xe_eu_stall.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index 8a7c1b5d5ab9b..c918fe3851c47 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -849,9 +849,11 @@ static int xe_eu_stall_enable_locked(struct xe_eu_stall_data_stream *stream)
 	if (stream-&gt;enabled)
 		return ret;
 
-	stream-&gt;enabled = true;
-
 	ret = xe_eu_stall_stream_enable(stream);
+	if (ret)
+		return ret;
+
+	stream-&gt;enabled = true;
 
 	queue_delayed_work(gt-&gt;eu_stall-&gt;buf_ptr_poll_wq,
 			   &amp;stream-&gt;buf_poll_work,
</pre>
    </blockquote>
  </body>
</html>

--------------anq0TahjrqZnSEGxVPpiCMgt--
