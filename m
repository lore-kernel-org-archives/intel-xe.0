Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38063C64EC4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 18:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBCD10E734;
	Fri,  3 Mar 2023 18:34:53 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293D910E146
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 18:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677868491; x=1709404491;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bmbjLRi7Mp+raHrJlInhiqCfRFO0WTkf4+vfBA9leXU=;
 b=DW6Bi5jSg0TcdRmbevRdweiP+Wjtb4Vku9VSVD+YVgQ6rL1n7pcOUB2w
 d/PhidnDd9NIOKKu2eJkgG57oLhCaUrwzHfSIXmhYh+9EEr88jV0y5lsk
 g/vjNhYV5wLDoOn5bVCKFhKf7bQurwu+4YeilneA3dyjgWFuTjan+QZMI
 6bokHtOWLcwJSkfO/BsAanJf+SOBT1ApWjxXR11i6tPAaKeQZGwDFHccx
 ohQL7DtzjI1mTXLfoeWiofonrnbQ4m0QTPYAa5OdHvwpg6B7n4DyRAGQX
 AFzwLhhBMflyLuCJLSkanGDJN6JUDmcwDKxkdcIb2JsEH79Az9FcVyoOn g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="362717077"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; d="scan'208";a="362717077"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 10:34:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="707936746"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; d="scan'208";a="707936746"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 03 Mar 2023 10:34:47 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 10:34:46 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 3 Mar 2023 10:34:46 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 3 Mar 2023 10:34:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGYLiT9CunSCVqITEjOgyRf8QGJAO3uR7gq14UvQm1kBIOe0lA/H/Z2Iwl9H4hcPOG7YhR3u9JHwnYpdrtGLJC3A/VFAwwciwVFrjZpb8IH6yIW2tvWn5FToYHpxflhGBVZdtKg/t4smCZT/vxLCmQ1mc1pnfDi49RS3jgNhv8lidT17f27YUXzhFiQ52CK/ltDGqfblWVDlytkNnHXF2Js6LzgfywpP+9/c4pTixvyS0Zi2CKigmxfhvrcP4TbhMXdX8EwTFfLRMMmx46QthBVfGrAz1ZYghAeleBRUnRoWp3vBIVRTct94Lwj/5RcYYSzJtzNg00PZh+mCuNhf+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCYt2BuDXiU6pHjBAbDhS/UhEc0Gdp0GU35G4WeW1SM=;
 b=Zr891cTEfYD5ifKSLm8Fml+Doz/LQ68rQj0Y8AVo6+eZPryeRIYfAOnflwzjkPWBrfvPWJJQmLlAxjZklNumec/kTBMwWB2cXhBB0EA7TucjtTPD5fVtj2h/SftBu/FlkcQLikrMubIuDS8T1EROk9SMxQYI6PyvW8k2XAoQf5R0+ZdLDXbK5u0W+8vrFqLcqms9PKJPndzejlmXh5IWq4Dj+yjndBd6tfCd3SNEq0cgQ17pC0O3GxQ0rnPK5nm9BLAROSTJDeifwq68hC9niuWJg70zMSjvSk9Kh4OLv3iCXmi1nahHvL55vEH7iPIP3lDUXqVYcpM4+lCe/dSLkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BN9PR11MB5557.namprd11.prod.outlook.com (2603:10b6:408:102::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 18:34:44 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%6]) with mapi id 15.20.6156.022; Fri, 3 Mar 2023
 18:34:44 +0000
Date: Fri, 3 Mar 2023 10:34:41 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230303183441.GE1175070@mdroper-desk1.amr.corp.intel.com>
References: <20230303170555.91242-1-jose.souza@intel.com>
 <20230303174326.7a37h2hjh6nlgeaz@ldmartin-desk2.lan>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303174326.7a37h2hjh6nlgeaz@ldmartin-desk2.lan>
X-ClientProxiedBy: SJ0PR13CA0071.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::16) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BN9PR11MB5557:EE_
X-MS-Office365-Filtering-Correlation-Id: 47a54e49-8a39-412f-7939-08db1c15f595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1K0MU2i7qXV0m08+D+qpWFxKl4ieXp0xtBfebUFlOQMy46eW7q5Mq/qOLs5wxaq37dZGJwLMCKDd2a2OAw/2purOvKH9KXl/mWSGpqCmpjd1m7I30eIMnQhOj4b7qGEhIunNxBgnJdh4KdzVqGkz96CRmCeAAu4kDly2zA94ZT9vJTZ9fjdndfhBcEzGLH+O6pe2rbK8p7Q3JBYYU4aSGtVIoAGkum/tfwBahxzBU8emhPDETyP3mityVyt96/c4SeciDLuT+KQ27J8OJerPSe3HTztgme5pynTGQasey8YRbcAFLvpyNLnJt+DkplhHTdrUzbsKv6AXCeGIDU9B4R0mWNtp2ZH8lsvn0SLAjq0wBoApSW6L0v1sgCH2ZFN1TL6eQlInZDUOiNJvV1FA4OlHxrG2jZxKtvKvrGWUFxKaShlDH9TOAsFc9TrUoyT0dVWQXLEXmst9KAghPzca1/h3VPY3lHJTzUs9BnbgToevkVWZu/nWLzDdtsXLs3enT8+J4/Gl6DbG/dpvz50pkrBbV5xBAZgDtjPrUzOwwzC5rrLC9xVoVWdmVzd5Zo1j40y8yO8rav+HCuc+i5SnvAnGLALJ2GA8+ZT0Phnu49Hbbj+3Ac/0J2uPdzgIOZQ8REsvHVZ98fmd4BpKCgvrHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199018)(38100700002)(86362001)(186003)(66946007)(66556008)(26005)(5660300002)(66476007)(6636002)(83380400001)(41300700001)(33656002)(316002)(6486002)(8676002)(4326008)(6862004)(8936002)(478600001)(6506007)(2906002)(6512007)(1076003)(82960400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1HmYz1WyH7Fo0Y7XiX3neumcO//Ft7CgKHQzuyReBkatxenzCiBnk5Njeq?=
 =?iso-8859-1?Q?tCgjlTnObkUNl6QLroA9wEhk8m2MODRCN1QrMV7moyguO3dS56YKBFj3Nm?=
 =?iso-8859-1?Q?X0KnMy89duUzrrQdQAc/O0KXBxy6A1aO+7n3CKTL9wpo8TmwQUzfsppi2O?=
 =?iso-8859-1?Q?mJ7kX7Bpx+Ns8glAj43PrCZsWGKSXDDz2XKGu0WtMjyaZSONf4TwwJ/nUx?=
 =?iso-8859-1?Q?S16lchEs09rtWSH6gSkAH/68Bm9RbG/CLRO1jk8hAgrPXP7ZOLOr2jNPhU?=
 =?iso-8859-1?Q?P6uYq1WpWC8v9AQp3n0rlBmuDsCYf8MWsnPC/t83ttL5pqRB/Jvj01m65m?=
 =?iso-8859-1?Q?PlabHJVsjjODVc0W1u4qWdL/Gc97yXaqqSBEYzS3qaZblKaz9AnK7BY6b5?=
 =?iso-8859-1?Q?3u4iepR5bpKd2egHRputi3ZHJrAphTMSk5vu7tljFuyYVvE8YuFnqvdIZx?=
 =?iso-8859-1?Q?P1KXRuimc07aRklV9aRyc/RNoI1MUUbndGTGnLwm/vLBb8R2/h8zRuJ6hx?=
 =?iso-8859-1?Q?GSFHvre2Xqn/2gdUTqoRwwePRp0tD1oVikQZBZ+5XwlOG91BymG3EnThk0?=
 =?iso-8859-1?Q?95UJB4co5kY7JndcMywCK5BwlHg8KWHPTcKW2XYScvoFD9NT5sliIEKGhc?=
 =?iso-8859-1?Q?oAkUIzlSjWRDJILN7RFjlcFbfwN6nFE1d4/+VwUf0YP253yELTlcwBU3RK?=
 =?iso-8859-1?Q?LkFkin7jl0kqINMb6KwqVZvSDwiqz0nzJ2HOOnYrxYIbhXsN3k5c4Jz5Us?=
 =?iso-8859-1?Q?MBMNf1NENZgvvBza9p64h7pZvs6MpMzKwhGtCHo+vdkaiqYhNMtKCE1eze?=
 =?iso-8859-1?Q?9rrdVW0c6FOfg6+9OgkQgJSKKqnAB0docG66n7ermlmhPe60mr4+mIrzKz?=
 =?iso-8859-1?Q?UU1DakxdBUUuHT9/QgRCDu9shNDOJnO2SYIBNH6xLBYEdQTTGuW2Zw28Zt?=
 =?iso-8859-1?Q?AZWOEFqGSwMORQ0A6ThJxso1XcrlRAN8iUocytk25LjwqNnZnxibKDO/Zw?=
 =?iso-8859-1?Q?8SsFZopHbwrDEi/+JZLpN9sqifw1pqmXwd4zhYNj6MeYm+b151zQ6f1xfK?=
 =?iso-8859-1?Q?kl/jYOvWfOSq8Ulq15RCSR6eKyT9LjpfAkDoZOtvMF7t0qkcDHrtFtNioG?=
 =?iso-8859-1?Q?Gf4UM1+F786cjnz0weuYVe1lsA13XkAFN9sEeeDo6CjpF3aaMF1FyVKAv+?=
 =?iso-8859-1?Q?BB3TFJDEhFimAqEsVkMcOBJDSzceBDne2rn8J4ZqKmZedDEkXb0tNKTQLO?=
 =?iso-8859-1?Q?eMkr4O2zZZMnspyl8le9URahSKDo+1KJz9IsoUVVY8UTqyVO3eKq4rZxxR?=
 =?iso-8859-1?Q?oZuI7fP/4SHzycXHn3exlMaEetS2XjipqErm6OvrC0ZLnMVY1C318taK7T?=
 =?iso-8859-1?Q?sHNqbk1ImnIqGm5PxjuDXr992TuRsWuyf+GyCtbfcODM34JlAUSTaBgUAt?=
 =?iso-8859-1?Q?hbKiQMoLFJtDcTqmyvSQTObi2PtK0qoljhyrc8V6N2HYVRdNyPz/Gozl7+?=
 =?iso-8859-1?Q?5hTswBH9zO4EAu7LkJqO3ecufEkv+pr1HeY6LuS0DbxitlanlLMsl4nIc7?=
 =?iso-8859-1?Q?7ROHqLmfhu21sEK9IBm/79W48yUYvybR3TR9dc/i/jSQCro31aQil5S7hV?=
 =?iso-8859-1?Q?VBG6h9avKWUXBwTb6b9d5lhJb3CgdPEDV4MuUiRytyxpe2whw6MidmTA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a54e49-8a39-412f-7939-08db1c15f595
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 18:34:44.5818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/VvtedrJwJFLp/qbYXt5G6D64cC+0McWfmOtKSHpQWmwkqTcinKUuHziuT80yN6+gVbZenlw8/WBhcYm6dQRYBlW8sZS9lf+dhR7gwMITU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5557
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix size of xe_eu_mask_t
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Mar 03, 2023 at 09:43:26AM -0800, Lucas De Marchi wrote:
> On Fri, Mar 03, 2023 at 09:05:55AM -0800, Jose Souza wrote:
> > XE_MAX_DSS_FUSE_REGS was being used to calculate the size of
> > xe_eu_mask_t while it should use XE_MAX_EU_FUSE_REGS.
> > There are no know issues about this but fixing it anyways.
> > 
> > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_gt_types.h | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > index b01edd3fdc4d5..74b4e6776bf16 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -31,7 +31,7 @@ enum xe_gt_type {
> > #define XE_MAX_EU_FUSE_REGS	1
> > 
> > typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
> > -typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
> > +typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
> 
> since XE_MAX_DSS_FUSE_REGS is 2 and XE_MAX_EU_FUSE_REGS is 1, I don't
> think it was triggering any bug... we were just using more space than we
> needed.
> 
> The fix looks good as the xe_eu_mask_t is supposed to be the eu mask
> *per DSS*. This comes from commit d44a3291d2a8 ("drm/xe/gt: Read topology from fuse registers")
> before the initial squash.
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> Lucas De Marchi
> 
> 
> > 
> > struct xe_mmio_range {
> > 	u32 start;
> > -- 
> > 2.39.2
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
