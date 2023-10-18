Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41190CDB47E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 11:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B2610E3E3;
	Wed, 18 Oct 2023 11:58:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9BD10E3D3
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 11:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697630321; x=1729166321;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=B6F7Se1pH1k1SVLGDcpIKWuPOQZam4/HXVYw80V4rzE=;
 b=DIHQEXoGggWIK4E2VcgA1mtVMWD7rH1/j/uNo61Hs/0lryy573V63Z+W
 RWRFn3HpOyFJQ5NibPSzfDrXPGE0dK5xPCTHP4UFQfecnW874roZ4qrgj
 30+35sNxmmgQFT2tzbiA+INUhPPjDXcHpz+n/BDL60mrcWEwIzxJTBAWw
 vIwn8jUW3rIp7VXzNpFK9JAOeseAPpEb7s1LhuVFf2GWJULkLGJMTd4RK
 3Q8jFaQb42fveZygp8oBsqlcDTaM5P6QOGyxkMUMFTS0EMRw0+pLh2E71
 aEQIxWgk1Sg4EyEnut8s67mTocSMDylRV39nF+dUZhJBikLrJ18VOn6ul Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="366254919"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="366254919"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 04:58:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="750068280"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="750068280"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2023 04:58:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 04:58:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 04:58:39 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 04:58:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXzuP9zYI4bu8ulLr1U5I7dQjMGJsXZDXPYikdjNHNXRMPVhFJ0iMDuk6C4dYo2Gjuuq90sZJaI3N8cQTgM0OOpmjnG+ktchaHBL5vrTHk0wi0zcWaYTVTzT+X3qIJxgO3EvOubTIGbQy9TNlWUZGHQ6Shbwc9Uv7cVnVR1skJF/h7i9Dni3x5ivncCnsgvcZ24GxIcOg7fOAs57n8JpD+Fu+BXq07FDf7tdwCtB8jOENy1HvmfVvOmA0rgEdVA1BO/baCg21msWoQTuIAP6qRAcfJwcbF0yQdSQF2Fx2vNrfwmAyzspqDP3bVtGh06XE8dNg3wP8vduEJDr0Agmow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1oXii6s0ldFTUFrfQhDiB6+m/WPM4oolWMgLVurB5M=;
 b=hXY7u6ZP+tOhA84h1XopfrVlqZ+7muMiq3wrda+riZEAifwEI3z9UV2tur2yQzI9/hNy46J1CZgVLHnaZNQeETyVmsrdxRUNE53XMm+KQb0LhPgTUmC2hkwOu6YsoTG0rPrGV3X+jnO/86MUHixaVNjUIkHDXrAIuFFFUm5yTB8qaNQoiNxqySLJeS0ZskgIJYpRXRreDH61RrM90wZgYFIcN+6OWUQENCmH7HQROynDITmi7oU893N7kDeFHOsVeDhh4la1ckrVy65lUj46lr8uNkDjOs+Q5G9srTQGIMTSG41rl1mtl9YyYueaV3LqCBHZdLQHKLta1MVd8myBhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CYYPR11MB8388.namprd11.prod.outlook.com (2603:10b6:930:c2::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.21; Wed, 18 Oct 2023 11:58:37 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::cc5d:d2c9:b39a:3de7]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::cc5d:d2c9:b39a:3de7%3]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 11:58:37 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 18 Oct 2023 13:58:23 +0200
Message-ID: <20231018115826.3908905-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::15) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CYYPR11MB8388:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a66a8c8-240f-43ba-8c97-08dbcfd18ffb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c00wZcrc5yuLUM/GSGX8HYFTED5hZpI1elu4KCLLKBKIrhI2aS2Ze2vHtVWDKYouK7AJ+8rs8YWeaBP3B0qylTDA6fbj/Yt6zTj9dqqKdd9AX+EOim96MEdP01mS+ZCs/MAmm6qsdVfGQP91OWx1BD0TrzhjlKI8ZvZIvr9x0w98j6nN8bKOOQdjUdD4Dwr4BsTK9y8baXIfdwLwzoPcxycGA6VXBNA6RvieDgfK6lAuu86zfc+KcCwjaDT/Qz2fsVLsENgKc16P8su6hT8sqXHLhvGrw4t3aiRrOqCdrm5kMVM/r+AHFPjNIM3L6Litimu3pDwPn1S6FwWtrvfgX6WOwR2MyDS03CIc6jmh2y8IU9DBbL8t7BRahprEH9SbWeCWQrwUMrYY0UGWqU8KYaHFYZc48R90Z1cFF6o/4+2NemLCLHDBMZQNLB5f3VqFf0LO8XMMV/SAD1DFICIjwRCNf740rJdNRUQOWubGUt4dlFySwUfMg5O0nOS+VnQm4FIZPQU6rUxnfmHGMlpu3iW5bFJeId2xiicWAPXcTzhSDM8ATd6wBdOELLlgQp8Z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(396003)(346002)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6506007)(26005)(1076003)(2616005)(8936002)(6666004)(83380400001)(107886003)(478600001)(41300700001)(8676002)(5660300002)(4326008)(4744005)(2906002)(6486002)(316002)(66946007)(66476007)(66556008)(38100700002)(6916009)(82960400001)(86362001)(36756003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGllbWtLdHc3T3hENFNZTnppV1NhNm9vNkdPSTl1R2orUkIxb2Vtcng3dlBk?=
 =?utf-8?B?SDl1UFp5ZjFCc0hFbktPRUJ3RTBEU1poRjU1bEdJM2hPaEtPdWZvTFh5TWg0?=
 =?utf-8?B?YmVDc1ora1hlZGd3bnJ5cnpiTURWWHBMbXZGTFVsVFNPK2dCeDZXOVl0NTJm?=
 =?utf-8?B?RWJmaWRRK09IMmxudmRRd0J6blhXZTd6cWxnTjlDYTBBZENzL1U5N3hnQXN3?=
 =?utf-8?B?clNscW1iVTkwN0o1U1RQR0JkdHlqVndFczgvOTJTSzh3b2E1MzM5K2NweWZn?=
 =?utf-8?B?WCt1clV0c0MyOHYwYW4yVmxvMzhaY1Fnd25ZZWFyR0VLNlVoRzNvbzJ3THNi?=
 =?utf-8?B?N096YW45WlhoOHg5QndPRjRGTVg3U1Z2UEdDNkpSY0hpbTdDQUlpYlBtVDEz?=
 =?utf-8?B?SmtZQ2licGFkRmVIK2orRmFKNU9OdXBLQ1U1cW1uZFgvREtPUkttWDJ3bUpO?=
 =?utf-8?B?OTFrU3lXd3IvN21rQVBWK0J0b0kzL0RFQ25oUWhOcU83T2hCWW5HS3FhTDF0?=
 =?utf-8?B?VitrQmFRZ0hoMzZ6Y2hMeWtRKzRrY2hOTHRwUWg3QmpPZzR6UWhRUm5iNThS?=
 =?utf-8?B?NjNHUmRHRUVBZFRuMDAvM0Y1enR3WXl6cThvbWI3aUVLS1FkV2t0SmNjOHZs?=
 =?utf-8?B?d2x3VC9oNFlPeEZHWG9iWjlRNlNiTHVpbnZXbDJJdnRMQk51UklvcUswZEF0?=
 =?utf-8?B?SUxiWm84dDdnNlJMZVFYKzZGbXZvc09ZUTJaWHd4eCtLOEtibUlRQWw2V3pK?=
 =?utf-8?B?dUVJV0VLVHhSTFlmSE1mTmhuWU9YNm10MzFoRzcrcWdJTDE1TWR5Z2tjTTBB?=
 =?utf-8?B?Nml3dUJiSktrM3hpMWp3MDA5c2dPS0Rva3hrZW04U2VzbzNucFk0OTc4c09N?=
 =?utf-8?B?djR4MCtSWXFVZ2xLWUcxTlU1cnJDSDEvTStCZGVyS0lRWGlSTlNSK1BvNWIw?=
 =?utf-8?B?Q3M2VW5JRzRoM3lTZTB4aE1UTE1OZzUrYVJqbjdOcnUxZyt3amJUNXdJTkZU?=
 =?utf-8?B?bjg2Z0ZpQ29mZDJoWVdoTk5lNHgyNnBkWVEyaHg0WkZ1SEpuNTY0MitWd0Vw?=
 =?utf-8?B?QklyL0dRbUI4VjlJL2tTWWhETjlxeXR0SmdUQjA3T0E3c2dMWkFnUUNBUXpD?=
 =?utf-8?B?TG1lZ3VSOTV2ZXZoaW0yRWpEOGEwVVhOenZsaHBvWDVxZ0xtRHNsSEY3RkVv?=
 =?utf-8?B?eHIzdHJ6Q3NYZTBFc2taNkxWbGVmNi93YTJPdGVxUTJXNEphdER0L0cwY05V?=
 =?utf-8?B?R1UyT2hHZUk1YVE5SkluVWp1WTEwQnpVSnRQNUVLb2ZtWUE3UzJIWlJWWmZm?=
 =?utf-8?B?Zm02YzNOT0hDSVkxVGc2eDl6MmsxWDRsS0FsYmFVQzRhMWdFeklGTTdsRlNS?=
 =?utf-8?B?TU1JenVkd3VhSyt3OFgyZG41SS9rVkRJWDJHQVRaeTFjM1JUVy9Gb2orSXZH?=
 =?utf-8?B?ejdVdVpCQzZ4THNzRmJacyt5elRpMStwY01XeDJDcjhRbElnU0dsdlRMNGRm?=
 =?utf-8?B?Q21kREdJcnBaOU9KNGdvbjJBRGwxdXVkVjNxcnFrOE5uRHp6bVBzRkJFK3ox?=
 =?utf-8?B?Zzl1TjBCMGw0aldIUm0rc0hkWWNvYWZsTHVidHZPL0YwRWJZVmZzcXVWcUs0?=
 =?utf-8?B?bzdrNzQ5K3UxM1NKOG1SMS9RaDFSOG5LNHpRdG8yaHRiWUNRalFhN3FuL284?=
 =?utf-8?B?RXZnbyt6OGxLUGJkc0VDNW8rUTZoK1RvT3orL2pKSWRBQ3E1T3lxRVE3YUJX?=
 =?utf-8?B?WHc2bHRFc3Q2K1F4MklwNG50YjU5VWtBUkxDOG1YSGQwWHBFRFNMN3B5M2dH?=
 =?utf-8?B?TGF5dWM2Z0NyUFNxQ1BBUUZoRzhac3psL1VqU1NIR0RnVlhEZ3pDaWkvbW8z?=
 =?utf-8?B?QnhlaHdFS2hBTllibGNYOTRtMmdERHFFOUpGMHVjOXZkditTL0FzRXl0elJu?=
 =?utf-8?B?Qll4UWxSRS9oVzZGV2JNS010QzRsWFByd3l2WnphR1lpYmpYWWg1Smhlc0Uz?=
 =?utf-8?B?eVNnMVBoWlY5ZHppMnloVm55YVEycjJDclVaazduU2NSdEdLdDV5WWlNb0dT?=
 =?utf-8?B?bFUybFR6dTNadmtOcTNUZU95WnVvUlVjMHF1a1B4cUlkWE9UTGpmMkp3cUg1?=
 =?utf-8?B?N2RyeGd1ckNvdEFKQ2VrR3k1aU5ra0Q0OWZ4WURWcDdCN3Z6a2xEY1dwSWlS?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a66a8c8-240f-43ba-8c97-08dbcfd18ffb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 11:58:37.4920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gklsIvViO6lJZyPxr2t8CeIBJx/G1/RC1vO+VrPwoM6TesR7E+l3+yRHRHC89Bi3ZELlY4f336qP0ilaROXPyHZcjv05+G2lJqmzw5F+lU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8388
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 0/3] drm/xe: Fix building with clang
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Clang uses a different set of warnings than GCC, some of which are
causing Xe build failures.
Let's fix it.

Michał Winiarski (3):
  drm/xe: Fix header guard warning
  drm/i915: Fix uninitialized variable warning
  drm/xe: Fix format string security warning

 drivers/gpu/drm/i915/display/intel_dsb.c      | 12 ++++++------
 drivers/gpu/drm/xe/xe_gt_idle_sysfs.c         |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.42.0

