Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36CEC7619A
	for <intel-xe@archiver.kernel.org>; Sun,  2 Apr 2023 21:54:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DBEE10E10F;
	Sun,  2 Apr 2023 21:54:40 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC53B10E10F
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Apr 2023 21:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680472477; x=1712008477;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3B8SMGylA5KHTyCmQ+wxzWSr1tVxvTkoSZsMF+dyFl8=;
 b=W6IhuhMGRabyEwvC0a5HmtW4T/JTfi6C8n5HpqC5/vyzWqLogMDjME1L
 6L/vfWNhfMWOquISM8/DGm4MmnZRZOtPcHWiB0cICpTQp7SB97CIL0109
 KkeN8UuQOh50hY6sRnzU3hux0aooat6kN6Unthm6p+A5VqmeSFRnylc/O
 3olyrbnefTgr4iCicBVeM00GW+tnapWDV9lGsQcoV4G3Pfn2Olpd5yqby
 fFrNWLXyIkx3fv+BNTl3AiS1m/4GwDKfMV2JLEbvNNCmipWsT1Kz8X5za
 0FclqyW2mqe4GU0EBRl6IYrBXyk/HjOaGFMbF8PxG4V7Nkdgef2bUUqqe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="369575144"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; d="scan'208";a="369575144"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2023 14:54:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="635896310"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; d="scan'208";a="635896310"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 02 Apr 2023 14:54:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 2 Apr 2023 14:54:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 2 Apr 2023 14:54:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sun, 2 Apr 2023 14:54:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sun, 2 Apr 2023 14:54:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQSWfoxgwp/WwOYutvJirw2Cp8NHwYt8TxDlTU7cbBQvBSsYYNreQBkXRsRLJlOGayzVoejVzLs4a34Zkanafm09YA9uWs2BqluCzjJge4mp8fz81ZQeUAZACWHx/dDtZ5m1xJ5bzTy3ko6YMiyvcS5soxafqtIi619TK/nKR5tns6SlyW7GIlKacKkb+rYa0p8QZdi9UN2OPTTexiNyBzc6AQyLdQfE8tNvaSiKPJf7kc9ot3CHjhm3Fk1If3l0s+5v2BLwimsPg0XyLO1UWGvh/R7cXZm/pnEXGbyThpp/bAb6kBl9QW4NDY90SFcsbX8SYWsvCrxPdGv0X031gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3B8SMGylA5KHTyCmQ+wxzWSr1tVxvTkoSZsMF+dyFl8=;
 b=aJmEToBwN/1rWb2mXHh1y7yGiJJeKyxB4DFFhcu+VQwPJIA7qMVUNlGbJaE8I+pwBNLo72FgRWxsyAFo6L1GwUt69yxwdIsfT7cDpDTYIdc2+c+YTk3dZ+Gm0keYhMqy2N3W8GpG92J/nlbHV94oGG/wYsvMMlSe5CXMtQoyEk/HYKE9h5HMVJuxVbjRSywyPtStB2hvrNZOMEe4tBI48hluYiA9kzsgFkS91kyYA4rwNM8Ho+the4PF7V4xoGumUo2TYvustIPF6/7M6XU4UXncq8T9RZzAAE1kn9KD8U5ilRND1B03H3KKsvyuX8km5EQddzdqEMvD6/zNJEYz6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5065.namprd11.prod.outlook.com (2603:10b6:806:115::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.28; Sun, 2 Apr
 2023 21:54:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6254.029; Sun, 2 Apr 2023
 21:54:33 +0000
Date: Sun, 2 Apr 2023 14:54:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <20230402215431.lhqn4qtqawbrefmb@ldmartin-desk2.lan>
References: <20230321220527.595462-1-lucas.demarchi@intel.com>
 <20230321220527.595462-2-lucas.demarchi@intel.com>
 <adnojpupaqnivif7aqblxkuiwyiexskk4h3b36bsktbpifoip3@b7xazecr7exv>
 <20230331143337.vtlyhttwwqfv2tad@ldmartin-desk2>
 <20230401085459.ub2rgeiqbi225n42@ldmartin-desk2.lan>
 <epatz7qx73i3kzxa4fzn7xcizmdiesgqei62ixvjvhi64i5z36@qz6l54vqdsp7>
 <20230402013449.orx5njgiy4uyjcbj@ldmartin-desk2.lan>
 <cb9c13f0-fbbf-415b-35a8-0c00bfe1864a@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb9c13f0-fbbf-415b-35a8-0c00bfe1864a@intel.com>
X-ClientProxiedBy: SJ0PR03CA0151.namprd03.prod.outlook.com
 (2603:10b6:a03:338::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5065:EE_
X-MS-Office365-Filtering-Correlation-Id: 696b71a1-1989-4d2e-f6c4-08db33c4d7da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i+2WO3u6yt5QZc0nZPE7NMHH4u/YAcwXU+++rOTKuAWDhMWGTBhb5MDdEpDyObY5YNk8aPfKj8oDU9Ia0j+F44cbQEQSyirHtP0uGIuV5mSq6t1GNuA6EyOyZ1G0go4Ib9ynk/ti53yKk1fzlCAGrZW62DfEoHfsmzbGEbXglNYAMIYhZra8yY8rE+iCtlcrRscP95ErcXVxU/Vza1xMCueL6nKj7CHnD8l5KEhTts/TTiuiwL9sj+QRzdaFurz2Jy3t9WpGEKIlVScK+F/Ea65hbgyRzB03s2fuilERF58lG6kdntwjW5s8mNWtFNHNbKISv+/E5P3hjTZ9DCvZSR3cqaLvEUm5HARaIKRkGujQmWbdagIzJ5mI8OAywFWPEqhJ05NT5Gj7/Yud/tppP1gk6jp2w/0Lwn+xM6klKS7fAEpq0hQzWbkqWCzqkhFPAT3BdCUYSHlw6eLiTOxifC69R3n3QwwHEFYekWnIwi/8T63Qe4FQn0uqMSqZLsX/ETTCnPOKLxwTY5vrlHXpdOhyvRf5yN87QFdvB2PkaM8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(396003)(39860400002)(346002)(136003)(451199021)(36756003)(4326008)(8676002)(6486002)(6636002)(316002)(66946007)(66556008)(66476007)(6506007)(8936002)(478600001)(6862004)(41300700001)(5660300002)(2906002)(82960400001)(86362001)(38100700002)(186003)(26005)(1076003)(107886003)(6512007)(9686003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmdFSXhFOVRoQktQOXJxZldlM0krdnc1RnhCMUhzaEVGTjFHM0FkSk0zZkp1?=
 =?utf-8?B?K2NtVU10czlQdy8zNk95TmRxMnArV2hIdk14bXZUVVdKZWY3TytqYTNqRFlu?=
 =?utf-8?B?RmJsVHJ1NENIL2dIR3NqYWRmOTRyM253b2hpMWd0Z2ZCYzlKOEtsdi9KZFc5?=
 =?utf-8?B?d29Ic0VKTnpPZVhPVE81cHhPUzczeHRYSitPRlIzanZYNWE1eldRemZWQ2FE?=
 =?utf-8?B?R0pzN09JM0JKZlNOb291U3VtQnh0T0p3bVpnWEFqdHNNd2dWcGQ4S3daSG5P?=
 =?utf-8?B?R0tod0srMWFpc1N4VmNZUTQxQTFtZ3pveHFMdlhPcG9xR1VlNWMweDh2c0Fp?=
 =?utf-8?B?enQwS21hZ3dwTXZyeWVtV3Nuem9FMEdXTEdERkxXSDRGTUFhc3RXdUg0TWV4?=
 =?utf-8?B?d09zZ2JXdC9GODFKTUJMRzhEN2JpVkVNSGl2czRGWGVuZkp2bWdVa3EzbEdh?=
 =?utf-8?B?cFFNSGoyZXJiNThSQkJQeE9tdlUzMkVnRlNyb0p5TUU3a1Q1S1IwSGt1ZlZl?=
 =?utf-8?B?OCtZMHQ0QU4vbm1UaXd3eHRmeE9wZWFEUXdUcEV2R0Q2K0ZZTGNWSk9DZGJk?=
 =?utf-8?B?WGJyTi9MTm5zY21JeHh0eDE5RlpOazBSeGFNM01uZ0JLKzRhT2UwNG5IQURC?=
 =?utf-8?B?UjBDTGd2N3RlMk11Z3hJOFhKVHFhb1BHRHQ2WXBVSHdtcVN2RUpnWHo1cS9x?=
 =?utf-8?B?VGtkM2dXNW1YMnY4QW1WVS9lbzEvMUQxUjk4dHh4T3ZKNzE3OTBCQnZyTlAr?=
 =?utf-8?B?YWtCQXVVUHlDNnUyRktYZkh5TWRabVQ5TTljOUdwVFlDVEJuQlFCWlIySWFY?=
 =?utf-8?B?b05JczRHVHlyUHFxc3pJUXgrSW05akFoYjc2Nmt1bWxlUDBSUDRiOW9IdWxQ?=
 =?utf-8?B?bUhGbm55LzVzaEhSaGRrVzhrSmFmTVRwUDF2eVk1b1dZRTJDSTUzbVREWFRU?=
 =?utf-8?B?TWhtQzFpY3ZRMitJc0dkWE94djVkNG11TEUydk1qNHlac2NoRWpTZjdhMnlX?=
 =?utf-8?B?bEo1akx5eXVhcjFuYUZEb0VCNDNBWlk2M0FUY1ZZYjhLTkdMT2ovZHZZUnFs?=
 =?utf-8?B?aHFBeUxSVFZOMGJ6SDFDaEFFdWwxVXhRQjhLWWs1bWg4UWtSang1U2IvTXFH?=
 =?utf-8?B?dWlIZlNkWUZpRmdpanN3ZmhRNHdHQkEwRWI1bjJNaVNWZUxJMUY4a21YaEdC?=
 =?utf-8?B?QmtxZjlaOHhXZm9Kdmc2WUhRKzJpL25Ca29LL1Q3dXVqVE1DSEhONWFkdDFC?=
 =?utf-8?B?Ky94bmdxenc5OTVHUi9oNDA1TTI1SkRJUTQxczJlY0Y3QzhhNDlaNHJjbzhh?=
 =?utf-8?B?VnQ0VThBdnVOVlcrOGJuNCtVSXBxQW5PcjdGbVpFTzlrV1U2SUlJSWNCN29o?=
 =?utf-8?B?ZEp1MVRPd2Z0RlRwb1Zla0oyK01mVWRNcXY0ZU5Dd3YvOVUrRk9MQTUzSGlI?=
 =?utf-8?B?Z1FVczhoNFdDb1huK2JLa0lBcTJMbDBqQTU4TXU0QVdnbVhteGhuOThtMjVT?=
 =?utf-8?B?aGQ4TEcwQ1gxK1d0TkJ5U3RxdXdOUVRLajFKcHMxZzZ6eWw3VGYzd1BZeTJF?=
 =?utf-8?B?UFlmSVRSQlg3Ump1S1ZJUVlmMm93c3NyOWJUUDZIblJYTHBVSHA1MlFoREk2?=
 =?utf-8?B?aFhtSUh1UjVUMXJPZWZhSUgvbVI5SVNqRncydlFRZUhpSHNtc2dvSWYxYWNU?=
 =?utf-8?B?OXVWOUREUzlDdHlTZkV1RGVWVXJ0QTRpeEgwcUhQY1JKNzB4eUpnZTFvQXlr?=
 =?utf-8?B?a2hvZzAzYWJxeG9WVURjYjlBcy9POUdXbGlhMXVFcWdZTkZHVUM4SXJvVnhJ?=
 =?utf-8?B?NWxRMEFJbGJHc3FBZVZnN1g0S1ZqUXlJNzNvdllpWVlaZ2daejlaWGJtL0d0?=
 =?utf-8?B?OCtHTVRhVTAyby92NEhNbmp2ZksrRUcyT3J1YVFMSmJKQWVDcUlxZHd6Ym9L?=
 =?utf-8?B?N2dyZG42YitmdjZDWDM0enJMNUFKRFQydFY5dmNVTjRFdnZjVTJHWVVKQU8r?=
 =?utf-8?B?QmFvajI2YlhncUJ1VW1CWTlQZ2swcjl5c3k4ZXh3RGpJVHlsdURkN3lIdGN5?=
 =?utf-8?B?MWlLNjJCb0owajNFV01ZenlsRVJKTXdLVHdLTEpnNm53U0p4MFRieWR4K0xH?=
 =?utf-8?B?TFRZcExEVlZYTUFYdEpFUGt0OUphbzNQc1dsczRHTU9uVEVhVE93SjNrc3h2?=
 =?utf-8?B?dlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 696b71a1-1989-4d2e-f6c4-08db33c4d7da
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2023 21:54:33.4228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eFDD7tjZ/UXCN5AuIboE0JfGHHrh2dAuixyBXV2SuzbPknQ2N9izpn0tGcNW7sRPzoCT7PFLIrkBLCp95sE0xoQkZjDtto5jXVPGWK3mn4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5065
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal@hardline.pl>,
 intel-xe@lists.freedesktop.org, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sun, Apr 02, 2023 at 01:17:50PM +0200, Michal Wajdeczko wrote:
>
>
>On 02.04.2023 03:34, Lucas De Marchi wrote:
>> On Sat, Apr 01, 2023 at 08:26:24PM +0200, Michał Winiarski wrote:
>>> On Sat, Apr 01, 2023 at 01:54:59AM -0700, Lucas De Marchi wrote:
>>>> On Fri, Mar 31, 2023 at 08:34:21AM -0600, Lucas De Marchi wrote:
>>>> > On Mon, Mar 27, 2023 at 07:56:01PM +0200, Michał Winiarski wrote:
>>>> > > On Tue, Mar 21, 2023 at 03:05:21PM -0700, Lucas De Marchi wrote:
>>>> > > > +EXPORT_SYMBOL(xe_rtp_process_incompat_types);
>>>> > > > diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>>> b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>>> > > > new file mode 100644
>>>> > > > index 000000000000..4a12aad3f759
>>>> > > > --- /dev/null
>>>> > > > +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>>> > >
>>>> > > There's no need to have this as a separate file.
>>>> > > We can move the contents of tests/xe_rtp.c into
>>>> tests/xe_rtp_test.c and
>>>> > > include tests/xe_rtp_test.c directly in xe_rtp.c
>>>> >
>>>> > this is not how the tests are currently structured.
>>>> >
>>>> > xe_rtp.c includes tests/xe_rtp.c. The latter can be seen as "an
>>>> > extension of the that file, exporting whatever entrypoint is needed
>>>> > for the real test". They are then part of the xe.ko module.
>>>> >
>>>> > tests/xe_rtp_test.c is the one in the separate test module, and
>>>> contains
>>>> > the integration with kunit.
>>>>
>>>> but it's possible to keep everythin in the separate module and not need
>>>> the include of tests/xe_rtp.c. I did that on v2.
>>>>
>>>> Lucas De Marchi
>>>
>>> From my perspective - the way that the test is implemented carries an
>>> additional information.
>>> 1) Test is a separate module:
>>> Means that we're testing the API exported by the module (that's used by
>>> other modules).
>>> 2) Test is a file that's a part of a module:
>>> Means that we're testing non-static API used internally by the module.
>>> 3) Test is a file that's included at the end of a file:
>>> Means that we're testing static functions.
>>>
>>> Forcing everything to be a module doesn't really serve any purpose.
>>> It just makes things harder to follow, as it removes this useful
>>> additional bit of information.
>>
>> I strongly disagree here.  Basing the test location on how much a
>> function is exposed is a recipe for having to move the tests from one
>> place to another. There are always refactors that make function change
>> from non-static -> static, static -> non-static, and to a smaller degree
>> exporting it.
>>
>> In the end the code will just be inconsistent with the rules you
>> outlined.
>>
>> Separating everything to a separate module means the test code doesn't
>> bloat the xe.ko module. I do think we should group all the tests into a
>> single xe_test.ko, but that is a different topic.
>>
>> See v2 of this patch series where I move *all* of the rtp tests to the
>> separate module and simply use EXPORT_SYMBOL_IF_KUNIT() to export the 2
>
>but having to export static functions simply don't scale, it's fine if
>all you test needs is 2 functions, but to have full coverage we might
>end with exporting all static functions (and to some extend bloating
>xe.ko anyway, both in code and binary)

... the fallacy of full code coverage.

>
>there is already BKM for testing static functions [1]
>so why are we trying to force different (and IMO worst) model ?

it's fine as long as the test is small and you really want/need to test
that single function rather than a higher order interface to it.

>
>[1]
>https://docs.kernel.org/dev-tools/kunit/usage.html#testing-static-functions

"If we do not want to expose functions or variables for testing ...".
There are several sections before that one.

It will depend on the test. Some may be inevitable and simpler to
include in the file. With the dowside of bloating the module.

>
>> functions I need (In this v1 I was using
>> EXPORT_SYMBOL_NS_GPL(..., XE_KUNIT) to make sure the tests were in a
>> separate namespace, but then I noticed kunit itself has a recommended
>> way by using its macro).
>>
>> This makes the rule very simple to be followed:
>>
>> 1) Place everything you can in the separate test module
>
>but why? as Michal pointed out, this works best for testing already
>exported API functions, to test internal static functions, this would be
>unnecessary complicated solution

then provide a better test on the interface rather than on the static
function. If really needed/wanted, then including it on the bottom of
the file can be done.

>
>> 2) Place it in end of the file with the #include otherwise
>
>this should be our primary BKM for mock/fake/sw/self/kunit/unit(*) test.
>
>(*) pick one
>
>note that in addition to easy maintenance (it doesn't require writing,
>building, distributing and loading separate modules), this single test
>file already has access to all required compilation unit static
>functions that we want to test.
>
>also from IGT point of view, this would mean that in case of
>adding/removing some subtests all we need is just update test filter
>rather then updating list of modules to load/unload.

you are making this up as "it's harder to maintain" to justify your bias.
There is 1 single call you make, using the already provided kunit.py.
Developers can run it on their machines and so can CI.

>and I wouldn't count this final #include as .ko bloating factor as it
>would be primary used in UML build, where we don't care, and for the
>target builds this could be easily compiled out.

then you can't get the prebuilt kernel to be executed "in production"
and sanity check it still passes the sw tests.

Lucas De Marchi

>
>thanks,
>Michal
>
>>
>> Lucas De Marchi
