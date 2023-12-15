Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184F7C4167B
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 20:05:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D248210EA7F;
	Fri, 15 Dec 2023 20:05:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C0310EA7B
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 20:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702670726; x=1734206726;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=H5kD6Nj8njDM/HnwDHD9UbY/Gw1qtVJgO5Xp/S941pE=;
 b=PU8qFUQAV3OwAPJRGtSndQdRuChp520yRq3LX1VZMwUf+emL1m8ZXSon
 Q6uD8LMYRzuk8py6U7S6d9Gin1syGxMWc5Eig66V9AiwYvtbfhQABsliE
 mC5N4N5otYiwRDVWv/zPdCnRM0l93w41+saFgdpUe6CERt6G0JRroUV1w
 VaTZDYmVmFEZGGaEbhqzfI0wWZJMbjmcgOQF6CYQAgPj4wssqfTuCZc4W
 ri2xxEbNdtrK94L4dvoYo1zi7QIAYuNiGB75loWk5QgcqnVTLFpyYTacF
 fIiRCvRA9RbkFJfIXGVt9yOofruWpZGl4euLJ8hN8RfxE1bpWYtgD1Gg7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="14003955"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="14003955"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 12:05:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="774867516"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="774867516"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 12:05:25 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 12:05:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 12:05:24 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 12:05:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=exJxBlY9aJ0RzGoKEzIvVCSGA9MleKoDMbaTzBzVmA3KJ2HUb6Nn2FpBumgmmkb+b4wrMBY7DBZu2F0z2XAHwT/cfhmaJIBkcObmWdm45Jxz8eFEaepNZwadHT66loO4yyZFmcXIHe7KQdI0zxcGnmqDF4U9f2Pk7bhMD3YFqeOC16m+TeJjwD5Rz8PTuRJ4dbvAP44Y4bHTek83IQyPc4LJ8Gkrmc3FdpS13iSoGuKIIQTkYvbKPb3SVCcDpX0QRdrxFoA9LOTJAeRlTeRZDAF7pTzu7iliRsoBrrE8hF+d8iR3NftjtLvnI5w9Xhxqta/15pc2OcK0S4TTgVRJ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPkJT1zk6F65fbm/QUf28nGlZkuSY7ZHWfik1mp8nS0=;
 b=GpRhrGgUW7QThoblhFMGVc6fOMwrdcUFX3nHChQEyvhoVZjlay4IljGnd6VeURkBMR28XKQ+4vHEc04pshGylZ0oYfRfnsxfJPwy7+lqDNhuzl9LpebJr/r5JUfr5qKXCS3MSjWmW9IyA1FRMedI7ctDVbuu0EoA61zMGlfuqJX4GRMeZcWuA1b+f2/MZkJTD65zSUCNTG1VUxoHEhTF+c32ZnHv1s4TcoslwXcxUQrm0JFQ5AAWVC6LE4jDgO4zwvsl2p+d/u5Imo8hTtnqSzLhzpH/MbUL8PWvVFKdSW33fS5Tup/z+rLnRevW7gwwOjWEBNmhVscZgpj3/slaew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB3567.namprd11.prod.outlook.com (2603:10b6:208:ed::31)
 by CH0PR11MB5441.namprd11.prod.outlook.com (2603:10b6:610:d0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.32; Fri, 15 Dec
 2023 20:05:22 +0000
Received: from MN2PR11MB3567.namprd11.prod.outlook.com
 ([fe80::1f6e:f008:1c10:e69]) by MN2PR11MB3567.namprd11.prod.outlook.com
 ([fe80::1f6e:f008:1c10:e69%4]) with mapi id 15.20.7068.038; Fri, 15 Dec 2023
 20:05:21 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231214215159.2352350-2-matthew.d.roper@intel.com>
References: <20231214215159.2352350-2-matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/dg2: Drop pre-production workarounds
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Fri, 15 Dec 2023 17:05:15 -0300
Message-ID: <170267071546.33001.9538633326330114457@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR03CA0221.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::16) To MN2PR11MB3567.namprd11.prod.outlook.com
 (2603:10b6:208:ed::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3567:EE_|CH0PR11MB5441:EE_
X-MS-Office365-Filtering-Correlation-Id: b432a9ec-8966-449b-de06-08dbfda92aea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WuJNiE/xlOtYzBI/HVFygVdMvL9+vXBX/x6R8+q1pJA5ERRNEvEui6yh7x+UY4KAAwrKpgskOxt9Bt3U2OTLpYOJzVk1E54puyrtcp5XkIlUKDr+iyzXIErl7u08txxVrXWtAlRCB7vo25aWM7OLMywVi3Y6jFzF4umd8KPSc6+s0c2UAG8CPzodX8p7+9BpzF+PW5lT5JPkB5HGOlPd3UGGt+v2hDUku+7yRy8wZY+RFn12Yh2PYBDX6kRNkr+ltOqI5B3g6GPcjHx8RKXQPw9O2iGPItzL74rLYPwWfmioBrHNVZrvLI2ump20PScGlvqIrWz2CFcFmoVUT21FRYxx/m4FbK/M2GUoJXk498N8IzzUAFWYxm8PsxfC4qKV0MVNp5KMEUqp1A7rC7dx9nYuXWePemSa1LfCFgB2JXCPY7tuGcFneeo67OMGAi6bG0bgZiPYy2NiWmYN/A/xDpbj6/NCatrLNJpCuVzxvhqR/j9ApYOBCvQXIq264Fw2w9BJXqssuBHT5ehP8IXOi0lkXYPEjuee6dlLHHu56vXYIoDikox3DHfRdmiATZol
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB3567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(376002)(396003)(136003)(366004)(346002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(26005)(107886003)(30864003)(6666004)(2906002)(478600001)(6506007)(4001150100001)(66946007)(8676002)(8936002)(6486002)(4326008)(66556008)(316002)(9686003)(66476007)(6512007)(66574015)(38100700002)(5660300002)(44832011)(83380400001)(41300700001)(86362001)(33716001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkZmTGVEdnp2ZEJydnFrV0cxY2JjREQ1enpqeWVSckNSOWVUcHFjTVR1OFJy?=
 =?utf-8?B?djQwUHdVNnZGemdVQW55QkZRQ1UxYVl2SjlKemNRbTFNcDNhckROcktaNlBu?=
 =?utf-8?B?U1hZKzBsbGpMK01BQjBGdGt6MlBnWkl0R2p3ZEdJZGlvWGdQTWlNN1FJdW13?=
 =?utf-8?B?QlNqUXhvNjJMQVFYWnk2Z056WWdjUm5KUFdSNU1Xcy9wdEZlcE8vQjNHSTFy?=
 =?utf-8?B?anU4WG40TFhNU1pEc1NRSCtvMUlWdFIrY0I2YUpLTzYzS05zOFlTUVRnVWFK?=
 =?utf-8?B?VVJrSGhTdllIVmkwRXY1L0pSSWtIam5tY0NSTnBXUmx2dm1JNWVxMnFTSHJv?=
 =?utf-8?B?Wk1rT1BneGNFZzBEb0tabVpvbnBvd1FzZ0t5VWtJc2hxRWY1OGQvamZRak11?=
 =?utf-8?B?SHFBazlDekZxZGl1UnptU1dpc0M0Wm9vcHAwKzRRL01TOEJ1V2pIb0VSSWtX?=
 =?utf-8?B?OGtOenVHdHo4TmZIdHlmNUFWLzhDMUtnRVZtOWhqdkd4ZWMzMVpDUFMyY0pr?=
 =?utf-8?B?WUxDOGFGNGxiWEVMRXZKRG1Fdi9XQ0FISWlmOTgxV2tHMXduckNOWTExbFps?=
 =?utf-8?B?MlhnZklPNWk5VnE0b1N6YkhjcmdEZ25xbkdUL1FBTTJ1QWpXL2J3YkoydW1n?=
 =?utf-8?B?VCs4U1hGVFl1c1g3N1RpaFBtQXVGcDZrMXBtVWtNSEt3Y1RQbGorUG5qUzFR?=
 =?utf-8?B?ZHZIeGhjNkk3SkpHWDhtZ3Z4QzVDR1JkbXR5OHgwY1JFUnZFM1RGNC9tMmJB?=
 =?utf-8?B?bXl1enlma1NBeXFENHpCSWpVWnR6UHBuYndvODFUV3F5eDI3aWRLWUxCZ294?=
 =?utf-8?B?Nmp0UW9VM005MFBlN3F1eVY2OUZxa3pUMmZpWmdhUTBKQzVXQWJMdjNtWmNG?=
 =?utf-8?B?cTdJRDN6WWZTWUhENml6YmttOGd0NnI4RWFrOTBxZDluNkxwbmE4c2hHUkhX?=
 =?utf-8?B?VGhQRzRXU3BTeUZ6bzJob2xWekFLdk1YVkRqUEY5bXJsZUFQQ29MVEQ4eENI?=
 =?utf-8?B?bnRmaSttVnIzNjUrN3lsUTZWalFiVzdqYWlWRzNMWUZIeVM5Nm41a1F1RWZs?=
 =?utf-8?B?emtsc1lBMThFSWNSM1p1YVJpenFYK2k4alRDR3JCaE5lWWgwL3N1d3ZZQnpV?=
 =?utf-8?B?MVUvcTVPRUFsQ3ZiRkVMVkNHbHhqTkpUNUd6Y1NYWTVMS1dqVUJvS0d3NjMv?=
 =?utf-8?B?Y2N1VjFJT1E1S3V4MjVxRERqUGo5Y1Q5WUZnUm0zZGxDdmNzRGVaODVYU1BU?=
 =?utf-8?B?eVRsenNnUENnb1VkNTJWK1Vmaktacis5ck4rVjM3WE9tcm05QTU2alhKU3Ew?=
 =?utf-8?B?bFk1NnkzK1VFcWZja2wzRm5SYXBMU1Q1bmFnZGhiSjM5M0NHdVRXNzNtL1hl?=
 =?utf-8?B?bkdidk4xQmpXU0lVa1B6KzhXaTNaVE45dGxRWmw3a0hmdGw4Rk1DQ1p3cWx3?=
 =?utf-8?B?MVZrT25IaUNuQ0tLMWNRSU1JOWZFSXdwQm9URDRBamUzZkRRcXpVbzlsZEhK?=
 =?utf-8?B?d0M1VTZSUGRrR010Szl6YUFZTjU5eGFTL2dxWEVkVStiZENrL3dDTDdpcHpl?=
 =?utf-8?B?TWUrcDBpbm5ZUjRKaFNYdkFpcEsyeTdHWitGZlFxK1ZtYUc3VGZERWRhZXY1?=
 =?utf-8?B?RGd5ampraTdRNU8zQ21OZ1pTVkVGMGk0ZDlNT0luemdaU2JnOFREZ1duQ3Ry?=
 =?utf-8?B?QWk0OVo1REFTWk5CNkJiYWgzYUx3Wms4TWtRTlVTQ1VwSWdEamMwemUyMzlo?=
 =?utf-8?B?SjVmRVBRbyszdVBOV1cyRXg3UUl4VndSWUk0NU9mN2pRSUpXUXRTbWw1d2V2?=
 =?utf-8?B?dk5Uanh2aklRc3JLQXk5UFlQRUtmdHd3ZzkyVlJGbThPL2VFUzJrdGhKTFR2?=
 =?utf-8?B?NTVLbmg4THBldlV3eXVPZVJZbWtBTFpYd1ZDdFdZaVU1RE8vWTF2SGh3dDA3?=
 =?utf-8?B?ZVhScVhlV3JKTkF6R3dCSXpJOW4wTkFSNW5nekFPd3doeFAvNGRxZXVpUE13?=
 =?utf-8?B?Ymt4RWFCaEJnT054aUdNZERwMTQ5bFJEd3NaSVhwOEFwbnRGLyt6VHhSUHAw?=
 =?utf-8?B?V2dtVW1zeTdUU2N2b0J3b3BKTnBoMzJyNWo4THp2Qnc1SVNXYVRkYndUTE1u?=
 =?utf-8?B?Vi9oK3hIZnNMT0grcXNNcmRVYnM0RlVqeEZwMy82bERuTnU4REtpNmdxZ1Nt?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b432a9ec-8966-449b-de06-08dbfda92aea
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 20:05:21.8819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nM999FoLmNsSGyO2mUX00jqRrosniXKL8tL/CeLHoreptfMixM+W1rb1vieNxlLPnxN/IxluwtPAbTnxBxwx7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5441
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Matt Roper (2023-12-14 18:52:00-03:00)
>Pre-production hardware is anything before C0 (for DG2-G10), before B1
>(for DG2-G11), or before A1 (for DG2-G12).  Workarounds specific to such
>hardware was already removed from i915 in commit eaeb4b361452
>("drm/i915/dg2: Drop pre-production GT workarounds") and there's even
>less value keeping these around in the Xe driver.

I did a bit of scripting and also found those (potentially) remaining
ones:

DG2-G10:
    14011441408
        This one is applied in xe_mocs.c.

    14010648519
    14010198302
     1608949956
        These ones seem not to be valid lineage numbers though and, in
        the code, we seem to be applying them to any DG2 variant and any
        stepping. Thus I'm not really sure here, but thought of sharing
        for completeness.

        Looking at the details of the records, I see that they apply to
        DG2-G10 in the range [a0..b0).

DG2-G11:
    16011620976
        The implementation matches 22015475538, which is a permanent
        workaround for DG2-G11, so I believe we can just remove the
        mention of 16011620976 from the code.

--
Gustavo Sousa

>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc.c        |   8 +-
> drivers/gpu/drm/xe/xe_wa.c         | 163 -----------------------------
> drivers/gpu/drm/xe/xe_wa_oob.rules |   7 +-
> 3 files changed, 2 insertions(+), 176 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 482cb0df9f15..76b31d542e1a 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -133,13 +133,10 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>         if (XE_WA(gt, 22012773006))
>                 flags |=3D GUC_WA_POLLCS;
>=20
>-        if (XE_WA(gt, 16011759253))
>-                flags |=3D GUC_WA_GAM_CREDITS;
>-
>         if (XE_WA(gt, 14014475959))
>                 flags |=3D GUC_WA_HOLD_CCS_SWITCHOUT;
>=20
>-        if (XE_WA(gt, 22011391025) || XE_WA(gt, 14012197797))
>+        if (XE_WA(gt, 22011391025))
>                 flags |=3D GUC_WA_DUAL_QUEUE;
>=20
>         /*
>@@ -150,9 +147,6 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>         if (GRAPHICS_VERx100(xe) < 1270)
>                 flags |=3D GUC_WA_PRE_PARSER;
>=20
>-        if (XE_WA(gt, 16011777198))
>-                flags |=3D GUC_WA_RCS_RESET_BEFORE_RC6;
>-
>         if (XE_WA(gt, 22012727170) || XE_WA(gt, 22012727685))
>                 flags |=3D GUC_WA_CONTEXT_ISOLATION;
>=20
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index 23f1285135b8..4b3fa1a5a3e6 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -125,13 +125,6 @@ static const struct xe_rtp_entry_sr gt_was[] =3D {
>=20
>         /* DG2 */
>=20
>-        { XE_RTP_NAME("16010515920"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10),
>-                       GRAPHICS_STEP(A0, B0),
>-                       ENGINE_CLASS(VIDEO_DECODE)),
>-          XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F18(0), ALNUNIT_CLKGATE_DIS)),
>-          XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>-        },
>         { XE_RTP_NAME("22010523718"),
>           XE_RTP_RULES(SUBPLATFORM(DG2, G10)),
>           XE_RTP_ACTIONS(SET(UNSLICE_UNIT_LEVEL_CLKGATE, CG3DDISCFEG_CLKG=
ATE_DIS))
>@@ -140,61 +133,6 @@ static const struct xe_rtp_entry_sr gt_was[] =3D {
>           XE_RTP_RULES(SUBPLATFORM(DG2, G10)),
>           XE_RTP_ACTIONS(SET(SUBSLICE_UNIT_LEVEL_CLKGATE, DSS_ROUTER_CLKG=
ATE_DIS))
>         },
>-        { XE_RTP_NAME("14012362059"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>-          XE_RTP_ACTIONS(SET(XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB))
>-        },
>-        { XE_RTP_NAME("14012362059"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0)),
>-          XE_RTP_ACTIONS(SET(XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB))
>-        },
>-        { XE_RTP_NAME("14010948348"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>-          XE_RTP_ACTIONS(SET(UNSLCGCTL9430, MSQDUNIT_CLKGATE_DIS))
>-        },
>-        { XE_RTP_NAME("14011037102"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>-          XE_RTP_ACTIONS(SET(UNSLCGCTL9444, LTCDD_CLKGATE_DIS))
>-        },
>-        { XE_RTP_NAME("14011371254"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>-          XE_RTP_ACTIONS(SET(XEHP_SLICE_UNIT_LEVEL_CLKGATE, NODEDSS_CLKGA=
TE_DIS))
>-        },
>-        { XE_RTP_NAME("14011431319"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>-          XE_RTP_ACTIONS(SET(UNSLCGCTL9440,
>-                             GAMTLBOACS_CLKGATE_DIS |
>-                             GAMTLBVDBOX7_CLKGATE_DIS | GAMTLBVDBOX6_CLKG=
ATE_DIS |
>-                             GAMTLBVDBOX5_CLKGATE_DIS | GAMTLBVDBOX4_CLKG=
ATE_DIS |
>-                             GAMTLBVDBOX3_CLKGATE_DIS | GAMTLBVDBOX2_CLKG=
ATE_DIS |
>-                             GAMTLBVDBOX1_CLKGATE_DIS | GAMTLBVDBOX0_CLKG=
ATE_DIS |
>-                             GAMTLBKCR_CLKGATE_DIS | GAMTLBGUC_CLKGATE_DI=
S |
>-                             GAMTLBBLT_CLKGATE_DIS),
>-                         SET(UNSLCGCTL9444,
>-                             GAMTLBGFXA0_CLKGATE_DIS | GAMTLBGFXA1_CLKGAT=
E_DIS |
>-                             GAMTLBCOMPA0_CLKGATE_DIS | GAMTLBCOMPA1_CLKG=
ATE_DIS |
>-                             GAMTLBCOMPB0_CLKGATE_DIS | GAMTLBCOMPB1_CLKG=
ATE_DIS |
>-                             GAMTLBCOMPC0_CLKGATE_DIS | GAMTLBCOMPC1_CLKG=
ATE_DIS |
>-                             GAMTLBCOMPD0_CLKGATE_DIS | GAMTLBCOMPD1_CLKG=
ATE_DIS |
>-                             GAMTLBMERT_CLKGATE_DIS |
>-                             GAMTLBVEBOX3_CLKGATE_DIS | GAMTLBVEBOX2_CLKG=
ATE_DIS |
>-                             GAMTLBVEBOX1_CLKGATE_DIS | GAMTLBVEBOX0_CLKG=
ATE_DIS))
>-        },
>-        { XE_RTP_NAME("14010569222"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>-          XE_RTP_ACTIONS(SET(UNSLICE_UNIT_LEVEL_CLKGATE, GAMEDIA_CLKGATE_=
DIS))
>-        },
>-        { XE_RTP_NAME("14011028019"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>-          XE_RTP_ACTIONS(SET(SSMCGCTL9530, RTFUNIT_CLKGATE_DIS))
>-        },
>-        { XE_RTP_NAME("14010680813"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>-          XE_RTP_ACTIONS(SET(XEHP_GAMSTLB_CTRL,
>-                             CONTROL_BLOCK_CLKGATE_DIS |
>-                             EGRESS_BLOCK_CLKGATE_DIS |
>-                             TAG_BLOCK_CLKGATE_DIS))
>-        },
>         { XE_RTP_NAME("14014830051"),
>           XE_RTP_RULES(PLATFORM(DG2)),
>           XE_RTP_ACTIONS(CLR(SARB_CHICKEN1, COMP_CKN_IN))
>@@ -375,13 +313,6 @@ static const struct xe_rtp_entry_sr engine_was[] =3D =
{
>           XE_RTP_ACTIONS(SET(VFG_PREEMPTION_CHICKEN,
>                              POLYGON_TRIFAN_LINELOOP_DISABLE))
>         },
>-        { XE_RTP_NAME("22012826095, 22013059131"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(B0, C0),
>-                       FUNC(xe_rtp_match_first_render_or_compute)),
>-          XE_RTP_ACTIONS(FIELD_SET(LSC_CHICKEN_BIT_0_UDW,
>-                                   MAXREQS_PER_BANK,
>-                                   REG_FIELD_PREP(MAXREQS_PER_BANK, 2)))
>-        },
>         { XE_RTP_NAME("22012826095, 22013059131"),
>           XE_RTP_RULES(SUBPLATFORM(DG2, G11),
>                        FUNC(xe_rtp_match_first_render_or_compute)),
>@@ -389,28 +320,11 @@ static const struct xe_rtp_entry_sr engine_was[] =3D=
 {
>                                    MAXREQS_PER_BANK,
>                                    REG_FIELD_PREP(MAXREQS_PER_BANK, 2)))
>         },
>-        { XE_RTP_NAME("22013059131"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(B0, C0),
>-                       FUNC(xe_rtp_match_first_render_or_compute)),
>-          XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, FORCE_1_SUB_MESSAGE_PER_F=
RAGMENT))
>-        },
>         { XE_RTP_NAME("22013059131"),
>           XE_RTP_RULES(SUBPLATFORM(DG2, G11),
>                        FUNC(xe_rtp_match_first_render_or_compute)),
>           XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, FORCE_1_SUB_MESSAGE_PER_F=
RAGMENT))
>         },
>-        { XE_RTP_NAME("14010918519"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0),
>-                       FUNC(xe_rtp_match_first_render_or_compute)),
>-          XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW,
>-                             FORCE_SLM_FENCE_SCOPE_TO_TILE |
>-                             FORCE_UGM_FENCE_SCOPE_TO_TILE,
>-                             /*
>-                              * Ignore read back as it always returns 0 i=
n these
>-                              * steps
>-                              */
>-                             .read_mask =3D 0))
>-        },
>         { XE_RTP_NAME("14015227452"),
>           XE_RTP_RULES(PLATFORM(DG2),
>                        FUNC(xe_rtp_match_first_render_or_compute)),
>@@ -432,16 +346,6 @@ static const struct xe_rtp_entry_sr engine_was[] =3D =
{
>                        FUNC(xe_rtp_match_first_render_or_compute)),
>           XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, DIS_CHAIN_2XSIMD8))
>         },
>-        { XE_RTP_NAME("22012654132"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0),
>-                       FUNC(xe_rtp_match_first_render_or_compute)),
>-          XE_RTP_ACTIONS(SET(CACHE_MODE_SS, ENABLE_PREFETCH_INTO_IC,
>-                             /*
>-                              * Register can't be read back for verificat=
ion on
>-                              * DG2 due to Wa_14012342262
>-                              */
>-                             .read_mask =3D 0))
>-        },
>         { XE_RTP_NAME("22012654132"),
>           XE_RTP_RULES(SUBPLATFORM(DG2, G11),
>                        FUNC(xe_rtp_match_first_render_or_compute)),
>@@ -460,30 +364,6 @@ static const struct xe_rtp_entry_sr engine_was[] =3D =
{
>           XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
>           XE_RTP_ACTIONS(SET(ROW_CHICKEN2, DISABLE_READ_SUPPRESSION))
>         },
>-        { XE_RTP_NAME("14013392000"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0),
>-                       ENGINE_CLASS(RENDER)),
>-          XE_RTP_ACTIONS(SET(ROW_CHICKEN2, ENABLE_LARGE_GRF_MODE))
>-        },
>-        { XE_RTP_NAME("14012419201"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0),
>-                       ENGINE_CLASS(RENDER)),
>-          XE_RTP_ACTIONS(SET(ROW_CHICKEN4,
>-                             DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX))
>-        },
>-        { XE_RTP_NAME("14012419201"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0),
>-                       ENGINE_CLASS(RENDER)),
>-          XE_RTP_ACTIONS(SET(ROW_CHICKEN4,
>-                             DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX))
>-        },
>-        { XE_RTP_NAME("1308578152"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(B0, C0),
>-                       ENGINE_CLASS(RENDER),
>-                       FUNC(xe_rtp_match_first_gslice_fused_off)),
>-          XE_RTP_ACTIONS(CLR(CS_DEBUG_MODE1,
>-                             REPLAY_MODE_GRANULARITY))
>-        },
>         { XE_RTP_NAME("22010960976, 14013347512"),
>           XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
>           XE_RTP_ACTIONS(CLR(XEHP_HDC_CHICKEN0,
>@@ -494,34 +374,6 @@ static const struct xe_rtp_entry_sr engine_was[] =3D =
{
>           XE_RTP_ACTIONS(SET(ROW_CHICKEN,
>                              MDQ_ARBITRATION_MODE | UGM_BACKUP_MODE))
>         },
>-        { XE_RTP_NAME("22010430635"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0),
>-                       ENGINE_CLASS(RENDER)),
>-          XE_RTP_ACTIONS(SET(ROW_CHICKEN4,
>-                             DISABLE_GRF_CLEAR))
>-        },
>-        { XE_RTP_NAME("14013202645"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(B0, C0),
>-                       ENGINE_CLASS(RENDER)),
>-          XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
>-        },
>-        { XE_RTP_NAME("14013202645"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0),
>-                       ENGINE_CLASS(RENDER)),
>-          XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
>-        },
>-        { XE_RTP_NAME("22012532006"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0),
>-                       ENGINE_CLASS(RENDER)),
>-          XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7,
>-                             DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA))
>-        },
>-        { XE_RTP_NAME("22012532006"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0),
>-                       ENGINE_CLASS(RENDER)),
>-          XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7,
>-                             DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA))
>-        },
>         { XE_RTP_NAME("14015150844"),
>           XE_RTP_RULES(PLATFORM(DG2), FUNC(xe_rtp_match_first_render_or_c=
ompute)),
>           XE_RTP_ACTIONS(SET(XEHP_HDC_CHICKEN0, DIS_ATOMIC_CHAINING_TYPED=
_WRITES,
>@@ -650,21 +502,6 @@ static const struct xe_rtp_entry_sr lrc_was[] =3D {
>=20
>         /* DG2 */
>=20
>-        { XE_RTP_NAME("16011186671"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0)),
>-          XE_RTP_ACTIONS(CLR(VFLSKPD, DIS_MULT_MISS_RD_SQUASH),
>-                         SET(VFLSKPD, DIS_OVER_FETCH_CACHE))
>-        },
>-        { XE_RTP_NAME("14010469329"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>-          XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN3,
>-                             XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE))
>-        },
>-        { XE_RTP_NAME("14010698770, 22010613112, 22010465075"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>-          XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN3,
>-                             DISABLE_CPS_AWARE_COLOR_PIPE))
>-        },
>         { XE_RTP_NAME("16013271637"),
>           XE_RTP_RULES(PLATFORM(DG2)),
>           XE_RTP_ACTIONS(SET(XEHP_SLICE_COMMON_ECO_CHICKEN1,
>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa=
_oob.rules
>index 727bdc429212..e73b84e01ea1 100644
>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>@@ -1,13 +1,8 @@
> 22012773006        GRAPHICS_VERSION_RANGE(1200, 1250)
>-16011759253        SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)
> 14014475959        GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, =
B0)
>                 PLATFORM(DG2)
> 22011391025        PLATFORM(DG2)
>-14012197797        PLATFORM(DG2), GRAPHICS_STEP(A0, B0)
>-16011777198        SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0)
>-                SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0)
>-22012727170        SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0)
>-                SUBPLATFORM(DG2, G11)
>+22012727170        SUBPLATFORM(DG2, G11)
> 22012727685        SUBPLATFORM(DG2, G11)
> 16015675438        PLATFORM(PVC)
>                 SUBPLATFORM(DG2, G10)
>--=20
>2.43.0
>
