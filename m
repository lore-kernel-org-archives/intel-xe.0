Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB566C072A2
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 19:22:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B588410E768;
	Fri, 17 Nov 2023 19:22:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61DFD10E768
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 19:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700248974; x=1731784974;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=E4DAeCK5zdCpKnr8GbEZhlX3+hP2oLhxCuf3nVsx8Rc=;
 b=B3uMYrGGGYUgNDpMpWjwWV7e7knVGQUEBO2r9Igx3bYkf3IMVqgJU4+j
 dOAaBBuoYDtxz5AQi7D4ztLdzX0PLvoTRA6cKZSmnjIenuUEn+3zQPccG
 lNS++J/S426DJa2HaLAGGXyLfVSymunVPwqQbEkXEQdzYgAjTr2EvfBd6
 XBrT2jt0WEmbEYnwXijW1y6ddROd18vNZuPh+sD8ReiZEkdjLvEFGsOej
 +CPmmLjuZIHbXeeemnX0FE/Jo/PqDLoX7WEZJaJjjMbOA3mfvWTNMqxQA
 /mNR/O0Pv6VuyvMEViiuYD4EFDR8cwGCwWUTXWOyZKQkJ2VuuJV5DWO+J g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="4502672"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="4502672"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 11:22:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="14003698"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 11:22:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 11:22:52 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 11:22:52 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 11:22:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNtyaR1safGV9FYvlnu8jTp9cReJeakkd7FEkDWV6ppPayYJoHXb09N+scebcVKqGjroEybYrj3EjXeyl2gwoa0KJc6HxGx1o1I8UbZI73cvduJoZ+qUxdZXF2PpuFFMAQYZ/i9zYoK06o2Og66w40lRLUt58EcjHuUwyoYSCfAt+H+6JHR5zn4YOOkd9AnAvjzM0/jSr2Eb0ysPADe/Kx//8hsZAUKSoQNhZU+eEwEUEDu1BOBBvLDK44Xyh0Q96parO2wUlDztLyCl+QZOmmE2FI2nGLFb6/d3YTJG2FFw8YaFykRY1zopOszgQqIsmYoqZbYdJ1jSypOJeBpIyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mkFlllTMWyhRr7R76GU90Xp5FXRUR27vOIahA38aeM=;
 b=Vvyv+tASde7AyKTKx8d+iox6uYtPyjHxIZy9/T5CfRntqk8Xbk9eazpqqMDdW8IqHqzZRDDYcPQHC5iTxFhfi9xySmKqKjd9VNwcs2M9WaoEfoKVqJ5p60A/e/4dXUM8gVB7W8ti8FnxT7oe7SzkvNmRMDfLs0FT3ekZLRWE9kCU1CQUqWnYkEF1ZbMyWynSDXM4CfwBmA8jnOEO0gvskgNkzSOnnreywlRgIeFiHazicDa4gXLgXAG75sYFLl7k94rTfY26ZWpONCZ6LJcX+hrtRlSaAHGRPsLLH+Dppx17EoZoLm97Um31JHft796vv74v/q1nw+i4MQB/tri02w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Fri, 17 Nov
 2023 19:22:49 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::78eb:ce50:6f36:7b2c]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::78eb:ce50:6f36:7b2c%7]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 19:22:49 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231115183029.2649992-2-matthew.d.roper@intel.com>
References: <20231115183029.2649992-2-matthew.d.roper@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Fri, 17 Nov 2023 16:22:46 -0300
Message-ID: <170024896628.47595.2391024212382448577@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR05CA0159.namprd05.prod.outlook.com
 (2603:10b6:a03:339::14) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|SJ0PR11MB4989:EE_
X-MS-Office365-Filtering-Correlation-Id: 939dd56a-4555-4d40-884a-08dbe7a2965f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iJvD8TtwuAw/m87aWW096RtB92CMoUUPpoCd8FNDNUgRBT3cXu5cS4sLFmqOb1saSBgKwWU7OKbXNLfIZ9DKSUo2eXm9ZNplPSfDXv73SKB/qot3rti6Q/7FeBNvTGuEJbu7GMFayG32wNDgXfvvbYCQteDHcTakGgtMAiQ4tBiypQ98gc7cDTrv6IBMJwDnl6bQspnNyV9aunrsj+vMkMViAEx0FXuFb3SefiBsUwZlDuQm4l7++fav/HhbkmPwCSvhaLNlkkKeyDOihmF6v+3RiEwhXcPknngX6hmoJLp9SPZAHTHSpOEEskBFJv2/OID5EM8EuhLMkAfuHiXZDpGAh5kBmXJyrCpZkZprHN/za+T9m1Gt5colSYa9P4kxvJqWc7h7x6S3ghk6vSMoV0M7R0JqzxBUaiDyhPAX/XhYK5oOt8q7ZRM4UC6FeKlNRlbTkywNpVPmtT9BpmY/E9FnFjwZFBsx5FyZpsf3T76JYsUIxu+ivluEHrhsOyRgcTDFVrqf56PdS/VZ/QslHxPsBlMYlapR139w7kq2v8VYhSv9VeQ44c1ODpCUi09D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(366004)(346002)(39860400002)(136003)(396003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(41300700001)(33716001)(38100700002)(6506007)(5660300002)(316002)(107886003)(4326008)(8676002)(66476007)(66556008)(6512007)(26005)(66946007)(44832011)(8936002)(82960400001)(478600001)(4001150100001)(86362001)(83380400001)(6666004)(9686003)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eklaeEsvM3JUUHNPNnFpQk5MSTRmTW5sUHB2c3JXbDdoL2JSakJuSUMzQ2dI?=
 =?utf-8?B?L3F5Rm8xSi91dG51SWhObkUzMmFPWGloUHVQS3JMWjdJZVZJY3cydExscUNQ?=
 =?utf-8?B?aEtqNmZUdXpzcEJrd21UaWdmQWFUK2lzSVAvQ1dZTlBHZFdSeWVaMTdSd2VU?=
 =?utf-8?B?aHByckNnY3pGZHBXSnRPZG1wZGQxWDRNL1NFb1dyb3o0UnAvUFRjbHlXODlV?=
 =?utf-8?B?OTBJYXM1MG5NaC8ybGl3RWUzTTVJdlpSbjM5M3B1bDRLVFFuRGkvZlB1RCtm?=
 =?utf-8?B?T08yQUpjWWFwRGROci9Id2c0eWROc285NUhGQVZNUWJCdE1iekJsd3dSWVdj?=
 =?utf-8?B?UHg5WmNHTmFPQUxkZHMyai9yd0N4dWhnNXd5YTJUUXhPVFQvcDdTSzZpMlRr?=
 =?utf-8?B?aHJ1eWNIMCszcGE3cmp4Vm1zeTQwYWhJemxlUmM1UyszaHhpbUJXZ3FvTlMz?=
 =?utf-8?B?aXhDTUI0V0V4cTk0ZUgyVnBGZTJVaHFwbnFMQTZzN1MrbS9BTVJKUDM3c1dY?=
 =?utf-8?B?UjgwQWN4K0RXeHJWS0xDb0U2NGZYOGgyN0hldFJnd3I1T3ZjanNJcFJFN0xh?=
 =?utf-8?B?U3dvVm4zeUlDWTkzNDE5Rm1MU1ZiTk41QkphSUtpV1NoZ3RnWWU5SlhoTGZQ?=
 =?utf-8?B?UEM3YVRqalR5SE5oWUVYNWxoMzFUWjA5Tk5MSTVwdWNKMXRwZzBGV0cwaWwy?=
 =?utf-8?B?TjZaMzFhMndUZGIwOExJTHM3amZSSzZncEE1UXg1TTNVU28zUUEvaTByaXdx?=
 =?utf-8?B?dGhDUzdYVGtWRFRzMkNKS0VMenlzRTF4Y2pkWVd4VFNGUElFUWlFdExWOUJ5?=
 =?utf-8?B?UW4rV3paNDdob3BRSFhCVENaQ09uOW10SmV0OUdDUFYrZ2YzZjM0MFlySTlR?=
 =?utf-8?B?L2JRRDdWNTZjcWxhakNncmJpbDRSSEJudi9QMG91WUNJQzZxNVl2VytWQVQ5?=
 =?utf-8?B?ZW1KMXRNRm4xVW5tT0N4N1Z2czlWdDFINXVOL3gxUDVtUjRiOCtRYVYremZD?=
 =?utf-8?B?Z05WVDI5eXozZGwydXorcGhhK1hNTkwxU0YzVnZjSTFEV2ZqMC96QmF0WlpO?=
 =?utf-8?B?OUtOVms5TW9jbzRYM2F4QUU4Q09KbUk3Ynk5djNyeTVKOGlzNS9ubk4vdXdE?=
 =?utf-8?B?cHN2ajdEblQvc1JROE53SXQ4b3JwM3RSenJUYW9YdDc1Y0RQQ3dYT2RGdkgv?=
 =?utf-8?B?cS90Z3VXVGpJYkFjelBxWVdNZ1ZXZ3BsQTh3T0Z6ZDFLWnFtcWhXUjdXN1gv?=
 =?utf-8?B?Zk9HUy9JcGZTNUl0ZHIwekE0dmkyUTBIWEdPaWZOV0pVTWs1RXBrdC9TVmZm?=
 =?utf-8?B?eVVuZUIzWHhRb2ZaL0JWbXRVbFNUQU9tNjlBbFBWaHNINjhhT1BvWUNuYjRy?=
 =?utf-8?B?bXdiZEo2VXA1eE9naHcrL3NuNmYwQkxLc0dsQUhGZFd0ZW9ocGlKLy92a3cv?=
 =?utf-8?B?RlJEd2xydko3SUZRU281c2JiSmF2OTNWR1gyUTJmbXdqcEZtbjFZUi80cnUv?=
 =?utf-8?B?ME5ZYzdMUFlKVjROWWdFYVQ4dy9FZHhNaHdhRFVVQmF6cDRiZDUxUHNGVFlu?=
 =?utf-8?B?WGJBbUpWYlVwalpzeWRhN3hMVjV2SkVYVW1lN3J6M1ZQYm4xaGRNU2dmQzUr?=
 =?utf-8?B?SGdzOCtZS3M0WlhaUTE3cUwxQk9GVzBqaWZIclB2dktNUVE1WjlBdGFIejF6?=
 =?utf-8?B?RFlsbWU0RlZ1WHFPM0FuUFBsUXN0TDFJTHF2ZWtrYTFBaXZhODJaUkNQU3Rx?=
 =?utf-8?B?bHRFQzkzeitieGhLVjhKNGFhSVdmMzJGayt2b1ljY3Q4Sm5LNnpBbm51YW4z?=
 =?utf-8?B?cGtlWkhCTmJFbmVoa0YzSHo2cTlJdzJaVUVuOFBveHBaM1RwNWtMNmVGLzQy?=
 =?utf-8?B?TFp3ZkFBaHFlK1Z0aUdHNU1jVDJrSU9rUm1QY203bmNXSlFFb1lJS2FGOStL?=
 =?utf-8?B?Z0Q3SDBLYVlSMG96VkxKZThUbVpLKzlMRWxTVzRPb3IxOHNzc3o2MUJ1SlUw?=
 =?utf-8?B?VU5HRS9IamZURmFnSHR5VkZrRDVuTmg3cEtHcmFDbXJZY3VTQ2pub29UQyto?=
 =?utf-8?B?SHVkaEpObzNKL0hTZGR6NmdpQlBmQldJRk1LTm9EcUh4NWIyeklXV0FtdVho?=
 =?utf-8?B?M3FiWkxweiswem1FMStpUG5xZjVOdEFRdDhjQUdCaGgxU1BIYUdEdWprRFll?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 939dd56a-4555-4d40-884a-08dbe7a2965f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 19:22:49.7662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MjguKh+V4/5vEsgirhHluIJ80UnxnQUD43g4PGlhePXexgkk13nok05Aue4ywgCKZ4YVSg7EfLYYiEyAH67T0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4989
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/dg2: Wa_18028616096 now applies to
 all DG2
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Matt Roper (2023-11-15 15:30:30-03:00)
>The workaround database was just updated to extend this workaround to
>DG2-G11 (whereas previously it applied only to G10 and G12).
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_wa.c | 7 +------
> 1 file changed, 1 insertion(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index d03e6674519f..6572715dfc09 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -403,12 +403,7 @@ static const struct xe_rtp_entry_sr engine_was[] =3D =
{
>                              PERF_FIX_BALANCING_CFE_DISABLE))
>         },
>         { XE_RTP_NAME("18028616096"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10),
>-                       FUNC(xe_rtp_match_first_render_or_compute)),
>-          XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, UGM_FRAGMENT_THRESHOL=
D_TO_3))
>-        },
>-        { XE_RTP_NAME("18028616096"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G12),
>+          XE_RTP_RULES(PLATFORM(DG2),
>                        FUNC(xe_rtp_match_first_render_or_compute)),
>           XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, UGM_FRAGMENT_THRESHOL=
D_TO_3))
>         },
>--=20
>2.41.0
>
