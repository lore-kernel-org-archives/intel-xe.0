Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82699C76196
	for <intel-xe@archiver.kernel.org>; Sat,  1 Apr 2023 08:55:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE4710E080;
	Sat,  1 Apr 2023 08:55:35 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD7D10E0DF
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Apr 2023 08:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680339324; x=1711875324;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=e9gAo5u5rldbv/8F2U5QwA769/8J6ttPrqiTmet0xD0=;
 b=eIDPzScl5vYztVi97o3eVl9/J1JchblbiWVM4Ixf8zWwLMS+jI+H0BPf
 FVNUxJ+ZqDLask2UUi5Zqd3Ta6y6ptJw5nzBJsOkjty2i1Q3TZ4nmNMSY
 Vx2iw7/6RYFOz5LbiQKvxYyPgaSSQUMajqDPk9lQORT9/U/B4zBLi+p37
 PVvM7d+kY7gE5LYM/SEF/pH2RWwSI3BbjN1Oh35mz+WWPnql08ixxP1sj
 tY3w9JOwvyJFTo6UKkOAE+fnUP7vrvMRp9IQ2lSw1BC7dxNL6JYhmVe4G
 dY+jNvZqiswOZDs4847si9TOAbKqmR+nMoyZB/dVAAasBHCRnn9xSscwH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="369428000"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="369428000"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 01:55:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="717991884"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="717991884"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 01 Apr 2023 01:55:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sat, 1 Apr 2023 01:55:15 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sat, 1 Apr 2023 01:55:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sat, 1 Apr 2023 01:55:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sat, 1 Apr 2023 01:55:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EblHMg+eP/wgZ462QCtCdXJtzyWjgtDQd5XUBp5zXebu2lW4ODU2nqNvc748Z9dbhBZgMnn2Cx0v9YpLjsDH1bnJliKgt80RW5PKRwdr8xd3kp2eVwrWvlneKYqtcKgob97HDeasmKODBZIJM4AfOKgGOIylzK5WIbJ5g2j4iqwI12dDsA08BMxnapFCvi42wAmuSNYQTSZOUVXM5OHy/5/F9b0ixN/bOVZIRalQoV7a+FbuQ5b5CvA4o2wRZpFFtaTSX+OR7a+Rz7Sy5gu+Eed/ZPxIh5FJqOsthUbJDavcCYzqP3X8E5GGmhAQ4JMLhMmiQXORtEBOgtj66HaIoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z40/xPaVuJYo776WvisF/yeSuY1/Y4MOmFD8LlKPBhc=;
 b=VojllXkv4u7KmUaQ4EcIlTgb+Yi4/kzaeG1FJv31oyqjv4jMclzdEhwecY0jBmtzmn1S1ftKqqlo0YxtkxAATt1qnR1ect8LWWZVyEFeVNRkjuv9MbLZLxHslH72kccSy0Y1jxG46nCGdeTHi0eggdjw+qbO51htv1GqMeuttraHMddGyxoGDDRdlj5QP3dbPiIcF4HHpIn8DaOJKK2XFQdceC616CUH5ijHRISxfsevNGuFRdMyNj8WJPgfMiQS5bGXUV0ikwW7qBcQAPLZkki5vfMiZAfA0TXeeNJtv/C+jIH3Y4X11VsdxZhhQOeSvC6di5rbOTC/rK63kFrnbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5663.namprd11.prod.outlook.com (2603:10b6:a03:3bc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.26; Sat, 1 Apr
 2023 08:55:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.022; Sat, 1 Apr 2023
 08:55:07 +0000
Date: Sat, 1 Apr 2023 01:54:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal@hardline.pl>
Message-ID: <20230401085459.ub2rgeiqbi225n42@ldmartin-desk2.lan>
References: <20230321220527.595462-1-lucas.demarchi@intel.com>
 <20230321220527.595462-2-lucas.demarchi@intel.com>
 <adnojpupaqnivif7aqblxkuiwyiexskk4h3b36bsktbpifoip3@b7xazecr7exv>
 <20230331143337.vtlyhttwwqfv2tad@ldmartin-desk2>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230331143337.vtlyhttwwqfv2tad@ldmartin-desk2>
X-ClientProxiedBy: BY5PR16CA0005.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5663:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e13c5f4-85de-466f-885c-08db328eca46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MXUJgc9+KVZqg9rtMuAs/9AEbfnCuPrkfnB7BE8l/ekZOCLmJ3EzZChD8vTD41jVJb7G31+xg6o7vvO3p0ZKm0HF8mk84HYBsGdeJTBZVr2U5fiqUFOsjR29dAqtkawMQzjaDxvXupa983x6gFMXhJga4Rebe/3mmhJYbPSgIvO0EMF9qDWbpuE/j2QPlxX8QP0j0r+dCO20mh9ylcvO8el5p2Le3YJPPqe0lZVs42pNJ3zyRIOWobjHIJ/GjGCir9E0YWCho6iNoCG7nzv4awAsJzfRo4/LG6Nauqf7ULsSu7xM8HYaVpdWuAs5MtKcEjffQ6jClIYd5lnPeKjoZQ2oE4hMw+Y37pKDfZorucVbXW0VBu93CXACR0p1ZbOsYXnvrXbTAwKqkOXcOHfCVM4iT3Wcqh4x89N1f/lQd9Iks9X7MCG3PqLhQn5Woohaj801GJUxONWUaj1gWkNoxKMiW/oblDgfMg4+IoN2k9npEUPeoqxiFxqOJsgE75Rdy1EbFpu8zeLALadez3VPAinkZ7qrtLdQmda1rQYYtTTOCclB0n99XgCNHRb4555r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199021)(8936002)(38100700002)(478600001)(107886003)(6666004)(82960400001)(41300700001)(5660300002)(2906002)(6916009)(8676002)(66476007)(66556008)(4326008)(66946007)(186003)(6512007)(1076003)(9686003)(26005)(6506007)(86362001)(316002)(36756003)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3ZSckpGUld2UkswdkhpSFJjN0R3WWw3UHlwZFJQVTVETjZwOUFxOGhWbHpT?=
 =?utf-8?B?emtTcnRpVHFraUtZcFRhcW10UXVKVHJNdmNFYW1saXAxY1g4c3NWK2xTeWhK?=
 =?utf-8?B?NkoyZWVoSkRLMlZuWEhia1J0UE9mdCt6MEhRQ3V4SzYvUUdXUDRTV3U4V0lz?=
 =?utf-8?B?NmtJRXhpK1NDcmc5djJYazgrampMQlhNYjBURngzU3FZUnVGem1NdnQ3bkNy?=
 =?utf-8?B?Z2RLZnQ2RFNDUHhjeG1lVlIwRGdpaG9XM2dDVnhnd0dUQVRhY1ppb2lsem84?=
 =?utf-8?B?a0c0UUJrSGVWWVlmRnYvUlNtaW04U0tsN2MvcGVNOU5RV2grNm81Z2ZtUHBH?=
 =?utf-8?B?aS91Vjc4KzBobXJvK2FVdkRpZ3ozUWdwdlF1VUVCU2xpTUFGTm5wVDhXR2Zt?=
 =?utf-8?B?cVZQRVBmeGtsc0dNWHVYRGprMmo3Y0txQmI0aUFmeEg1L1JKL0tUWXlpMmMr?=
 =?utf-8?B?ZlpOelhvdkZMQU14aHB0ZVdXejUyV05jSUZyNGtkV3NTL2pkYWFYL0VJU1Ri?=
 =?utf-8?B?LzZqdlUrUFNEQm9GNHRzamtlczhrNjdid0pMUGxsalR3V0dZSXNUUUpWdzBm?=
 =?utf-8?B?Vk9uVE1ZMHVxeFRwQkxhbVJBVHpDTXR3TUdIcDY1dVhVRTB3aGxUUlNlUWlZ?=
 =?utf-8?B?VkF1NU9XMkdveGMrQitZWVdIT293aHl6Y3NkTzFsWlo2VEFXSDNYa1JHbzZy?=
 =?utf-8?B?NE1RWHZoa1dyamwrZSt2dnAwdHVUL2loNmZObUtSODcxWHdPOFQ1TDlyaVR4?=
 =?utf-8?B?UE4ybWV6UDRFU3J1bllGc3VTTkdFVmxabXBWMjBtQ3EwQXpRWFB2MGt0SXU5?=
 =?utf-8?B?MlN4cTZ6SDlxODJNZWk1SVZZS0RKNDYyRitKblcwdGtJN1h0UWFDcDZMc2lW?=
 =?utf-8?B?c3NVTysyYjRjNWdydSswNENtNndiMmpZdnZXZDVmWEsxUGVibDl3NnkvMzQ3?=
 =?utf-8?B?UmZ1VmpEMmcyQzlGdnJiemNzejNjWlFscmpQNmJ2UHpoNG56cFdndnpyakJr?=
 =?utf-8?B?djIreFN1MVZWOHNHbVh1dm83VWlrWXNRblhENGhjeHB3cTBEVTZGZ25QZFU5?=
 =?utf-8?B?enVCZk9QK2djMVdmQXkvY0t0Yy96SUh1eFc3dFczUFlqcFJyWjFmdGx2V3Y5?=
 =?utf-8?B?WEU1UW43VC9sMFRhQVRDRjJnYWw0Zi9tY3NuVnJVVjV1MmNYcGtHcXpkc3F5?=
 =?utf-8?B?Z2IrTmNPWHY3SDFTRkhHU1RRTUQybGE0VlJGN1Z6bytQWnJrcVdMdUlKN1cw?=
 =?utf-8?B?eG5xenVPWUwrdHRvMlRhN1lXQUdYNHNCTURUNlk1QTBzYVhiSFB6TCtqM3J4?=
 =?utf-8?B?eTNlbVd3UEk4SWNDZHB3dm9IYWxkVVIwRnhXNVFOeVVVM1MvTHNtNEo5bHhr?=
 =?utf-8?B?Y3NHTFhodkJxVi84UzA3c0t3L0tjQmhyeEJTbCtuVEE4VFkvNTFURjVrb2c5?=
 =?utf-8?B?TmNGc3lnYzUwUEZrdXNJN1dTZDIvWTdaRGZWME1IcDBRSStYZ0dBbjRQUUpW?=
 =?utf-8?B?ZXZXTzRURXlwN0hVYmJPUG1jK1FLNHE0ekgzeUwwbEJaU1d5c1JrWXdEQzV5?=
 =?utf-8?B?VDRoUDhLdDBMV3hxSE9iZnhKN0w5RlZMYTZXcUU0VFljZDI5NTJEWXc5V3kr?=
 =?utf-8?B?Z2FvNERGR2w2Q0lRdWhkbStEZXRtR0VMMkx0a1BxSmNsZGRxVisxOHZYdlBS?=
 =?utf-8?B?NUo0dGFYcU93VUVSOFYwN3I2c2dUeTB4M3prUk5JU3N6ekdmWlJuNU5WVXRh?=
 =?utf-8?B?eHdJdTIvTUhEMWQrRG1PTnlmMEdkWlpldnZkek82Tk1oNUJXTlU3bXB6d0I0?=
 =?utf-8?B?bW04bnUvMi9kTzdXOGQxb1BLckFSVDNzd1IySUVRUGU3S3dGMjhpSk52b0JG?=
 =?utf-8?B?N0ViNEI4TThZbkUzVEFWWkw4QUI5N2trbHIyZDNLd0dSTjljQWJBUDdmcjVF?=
 =?utf-8?B?aUpMaThVNkhEcjF6WTJYU3JBZy9VTjlDS0pvK2tubk16L1VodVAzSkxQbWhK?=
 =?utf-8?B?M0F0NVRSdk03QTV0RWJ2ditPRTBVSFZ5T3JFV2NUK1laK0Yvc2IvcE02bk1I?=
 =?utf-8?B?b0xQejBEcU9EWFNkdXZEQ3BCeTVrSytERTNVUHR6WGZUeVdtdTV0VUVKZ2FV?=
 =?utf-8?B?NmRQekI0N09KRDIzSkZibHZQTUVYUGs3V1pUKzhIbEhCektvUHNQWEQ4R0du?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e13c5f4-85de-466f-885c-08db328eca46
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2023 08:55:06.5842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRedUowx/6N7F5au1TgBmkndmA2yWFsfMS5M1jwFUaJ90gNWavJIe1ePEMR/5hPm60PgisC9K1sQ88Mo8wmLmhpxgS1eakfW1k1wTI1deqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5663
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/7] drm/xe: Add basic unit tests for rtp
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
Cc: intel-xe@lists.freedesktop.org, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 08:34:21AM -0600, Lucas De Marchi wrote:
>On Mon, Mar 27, 2023 at 07:56:01PM +0200, Michał Winiarski wrote:
>>On Tue, Mar 21, 2023 at 03:05:21PM -0700, Lucas De Marchi wrote:
>>>+EXPORT_SYMBOL(xe_rtp_process_incompat_types);
>>>diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>>new file mode 100644
>>>index 000000000000..4a12aad3f759
>>>--- /dev/null
>>>+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>
>>There's no need to have this as a separate file.
>>We can move the contents of tests/xe_rtp.c into tests/xe_rtp_test.c and
>>include tests/xe_rtp_test.c directly in xe_rtp.c
>
>this is not how the tests are currently structured.
>
>xe_rtp.c includes tests/xe_rtp.c. The latter can be seen as "an
>extension of the that file, exporting whatever entrypoint is needed
>for the real test". They are then part of the xe.ko module.
>
>tests/xe_rtp_test.c is the one in the separate test module, and contains
>the integration with kunit.

but it's possible to keep everythin in the separate module and not need
the include of tests/xe_rtp.c. I did that on v2.

Lucas De Marchi

>
>For some of the tests, when they don't export the required interface,
>this unfortunately means writing most of the test inside tests/xe_rtp.c,
>which ends up bloating xe.ko.  This is not true for all, however. See
>the xe_wa tests where we don't even have tests/xe_wa.c.
>
>Lucas De Marchi
