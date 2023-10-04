Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D0BE7C4E2
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 16:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D9510E38D;
	Wed,  4 Oct 2023 16:19:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B3610E38D
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 16:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696436389; x=1727972389;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YyTM2++6VIM+ZTTChZIhPjxAyxk3DYbKVfvZrgXHwdY=;
 b=R1YFBxIBsFlQbiCovw7+qN8j9SpO88cRJB0W5NVFXIPoDSqx8H4cmx5V
 JVpYcYWKyHiCzKhEmcNYd7g68VmYGfKj/bczWsi4/koFKK7r7miZr2dU5
 7fLQMYZbQPyYA6TGSAFeY+8llOVy7/OoVIQvVuPYp9qJfKSPJxD4iKvqe
 HANAOtI2zSCPqFb2InFOgGDxUB/NtqVLxeu3RpZWedT5TA+L6QwheN1hw
 CmI18cl118bFxLLGXHpIwrMtG5ByW4cSf4+6G5Qr5UDCx3sAl56quYWvB
 wJvegy4nTxnvD2rqcMWVn+QqUDRAAtnzOYewaN7nKtdlJwLnPSx7+Lo2U Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="380496269"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="380496269"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 09:19:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="925205792"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="925205792"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 09:19:48 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 09:19:48 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 09:19:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 09:19:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 09:19:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqmJEGL4uNDTSIuG8GdwO1C/zjhhFOaxeLNmyhkcfJCWq3Az7EoUjivQ06EWkm8kMFs6R0WqnKYHPCphNn6jbFwWllX9kyGY24P4ERWPV8rSokP7/IqcFrPToCCBCaCP2OyesYVTbAqG4Wohpy2GJFadU2UwV3AG7wy3nhGOPlVqAL5p9I95Kd2lj4N7uuOWt/xQalWgxnzbQc/fiTOs67NpLJu8iJwrmbYTOM9nsGkqh51rhGf70apRJmGW1+7gfBH1tKeduP1biUDc//eJs8U9qU50GkZ26vMEC5DhMW0qJv3EZoXNR/jaszq63bT00W6GuCK7u1Sf1/3TRGFXXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kV3m26c4+pr+i+Q2hnhlelid+/luHU+vVRyaLI2W3HM=;
 b=WArxSuHXawR5jHk0bSnvKtmf17lWGyowqKsQx6MUyw1EUe1xQmB8o/gb7/EoMipqW5MHzO869f5J9PX7epZ0oS+To/0Im3gZgoSjmerXGKtefbCXX6nOl0J4vv4O263cXWrhzWbArRnEpPuzU+H+KaruosSZkuhYtR6/2h/ILI2IuAD5olAPDAeOYWMiRJ5MOLMBGcaW2b4/4aDzTYEFsWyBAvIlq6Dy1jPznyvvTK8fW+bwu+izKUEkJT2fHJEwWE3X4nL9txT/2rGv/sWZtJ4REaB6C+hd8WCypEJPLPEQZVH6CLf1VHPIFsCmCDTI+zOKevuW6CAnHpdfbsHAsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6259.namprd11.prod.outlook.com (2603:10b6:930:24::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.34; Wed, 4 Oct
 2023 16:19:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 16:19:45 +0000
Date: Wed, 4 Oct 2023 11:19:05 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <cw5rvehjdbs4ppttxjqpvggc2c2to42wg53i3ymstelavni4hk@jdhra625vd3b>
References: <cover.1696343521.git.jani.nikula@intel.com>
 <cd5a872a961405fd27aa07d1f4a1169080b4cc3e.1696343521.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <cd5a872a961405fd27aa07d1f4a1169080b4cc3e.1696343521.git.jani.nikula@intel.com>
X-ClientProxiedBy: SJ0PR03CA0245.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 30312686-adfb-4345-0d4b-08dbc4f5b8e5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dttreLAjDDaG/36RVj0jZ2+VwTdPzGSm3hIAxhssk7m5AySNYGiDIxhtR5VUZGUHL5RaHdzaffcXVyVzjR6+0uyGv8gGmTbg+3eqzx/KIJmO6zdofaecNYmDhXaK0ECsYNlIGFse4qCbeTKXqw4E4LyYSkJoqkiEPncQBHRJzZcbxcX5/i3dhSOH87v6fucfYwdnWFyNsLdYW9G1qQolw+ZmhoxQR6YZ9bHRRcXQ3s5YG9rr+2m0JxD6k2JSzNO78qXlyRPsLuHv5PQoAXsFIDHIsW1y4MKYw5Zi8qypU2XEmfoAqCteKTVz5QawC9Ng7f+kKEr7yq1YmDcLEZqU7YC3k4abB6i/7HGbklIeAS9SXBsPbQ4jJfLlmukHJSW8xA6ijxfgS0Oy04bxZgyacwTZZ3X27JMnXsBaL1BrnPINUHFUDU4zDQ5PfBOSFGEsUQR51QzElydLXgILzk2UFCBJXQyQUxf+6UEb5YmZpz6iXUkudmja3nQ2N95sQ8qOoKeVE+TnOBnt7/mLra7nTdqfdeWyY/pY2VWHb1pK9FO2gyZ8w7Bj2bvUYjUPPkWP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(39860400002)(396003)(136003)(376002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(66476007)(66556008)(66946007)(6636002)(316002)(41300700001)(107886003)(6512007)(9686003)(26005)(6666004)(6506007)(478600001)(6486002)(38100700002)(82960400001)(86362001)(83380400001)(33716001)(2906002)(6862004)(4326008)(8936002)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EUSBLWV33Zt6X2GsOjPBbQ70TtxZWTu+S+FceOb/We7+jA3H8hKsLC7YHMW9?=
 =?us-ascii?Q?I9MZxdPWOSwcoJg/sC3nIHiXPy300QdN4iN5aXBK8lJztRm9/RW2hnp8Xbnq?=
 =?us-ascii?Q?7rZGojUm/Di333fGn1qdatvpxE5ZluZ7ztdwf9lmhmqfmnnn1rGc7k/++3Ku?=
 =?us-ascii?Q?nEbe7zp3X8lZ6yn/DaivaSgwWZ4wDV9plVNj9L5FX8VUOqqahKlgjZ0S3bwV?=
 =?us-ascii?Q?x8ImyXVy1Gt3XQ9KR+jTF2nWO3P/2gTAHV1muF1OoFc7epo1VIvdja65rxbC?=
 =?us-ascii?Q?7Yp0oQ4K6gjwsWebKFsUIV4h6kLZk5dEuExK2+/5fOUCkY1fsz6uJR6QpZOX?=
 =?us-ascii?Q?la6sOKitgsMG0VmTMVlVWShYoz/7LeQ3RT350WVSLOZWSc0Jc6PotVF7bPru?=
 =?us-ascii?Q?j1hW1lrrEiDCmZHITDQ8xttgseHuNXNUAnvqEQWcTb4+rzgpmJ0DiFtF3d2c?=
 =?us-ascii?Q?jy2r4ibmee2nZldunTJU4/hjNw3lWVohXlV/D7UnIeLqb3Xj7eVVnIFSQlL6?=
 =?us-ascii?Q?BRN+pIYsAJAIdQUZSUQcAf+WqMCx59BAOrHezAWzCeyt/NPNCrAKIKvuIKy8?=
 =?us-ascii?Q?Luo3krzryScYq6R+c881TLOrcExFNm+ZcxcsMlFBrGRWZvVVrm/HsHwP+Qs4?=
 =?us-ascii?Q?GV/biex090BNn4b+OglIc8gLQANvf6O/LZSCTX990fDO8/eQCeGQw+RxF9sP?=
 =?us-ascii?Q?+QMInL7WBkhLdP9VR8YxQUj6b26rZ3JwsAPytJ1vFJ/68it9oeRdFaG4GIDd?=
 =?us-ascii?Q?hFfUhkuFhisNF79M7hhrg+NAqQWpR7TTdG/lk3uI9ePYufsnaEPGvxBEphSC?=
 =?us-ascii?Q?bKyVegw5yhrOZptQNg3eMnelwkGRIHdHmb7kr48jfOAHFNHas5tNWqELhpjQ?=
 =?us-ascii?Q?yF6hWgMs3+hZZaARMUqR4CPLYn3Rt30zqQNtXcMMM+fZ+dgQ/+EljCl+nP0z?=
 =?us-ascii?Q?EqY2Zl45naPcYdDJ5PFgkCJG3vb3//HnSkvUd+dNuimr6WQRPf4DxeztMUyR?=
 =?us-ascii?Q?+UWSlyD2b/dAoH+P/qzUw290UVh0EBTlj0oWmOJKYdcuhsqoWso+y0XdYNF7?=
 =?us-ascii?Q?UmYYg6Pl2bXByRsqKjBxTKOuU5BckC4vbc3yp9elVfSniHeTcU3uN4GbYLU+?=
 =?us-ascii?Q?gc7NzWHawkL6yftTRQ9hNlYw7mJFxOhVo8ntBboop+ymcZpgNSubv1J29za3?=
 =?us-ascii?Q?DjV3H0rz4CPD5jBY2Fbatf3PUKdCxvLcEuDw+CShrwbvC08+0N6KR3CZ/knu?=
 =?us-ascii?Q?dhZ9zxDe2FkzQNs7rYiHAe9NrZmEop95YWZfAiI1ZQ0yY3t962ATIjkSu+FY?=
 =?us-ascii?Q?VcOWWwAhezOkq6VmjMmANMWhoKwMiwWEVML6q8WJ7RRWj/susFVmi2n6eU/3?=
 =?us-ascii?Q?Balywuq/uEVUlOoVK4mQf5cxK8JwCuSL6m9qa5TVQRa1xRSw9H8m8SJky8Jw?=
 =?us-ascii?Q?Ip/5776ZCJ7mAxdULyQCroSn5i3U8Srjkrp7PWru7CrOOhSTZR9oKqZ6nZU/?=
 =?us-ascii?Q?18aYQLRjQBCS02q9Sa7R7CalT7pCUZnarR62BUgCdnFFHZKeHNY+YMkQ6vOR?=
 =?us-ascii?Q?INPbb76DPBDDv/oqApRs0DUoiTC8GHk3B06rIHLHyFM0+etkDpkRihmcY0n8?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30312686-adfb-4345-0d4b-08dbc4f5b8e5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 16:19:45.2933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/FORsrBTsiGPK9Eoq2Ch8WrSbHreZ4e5TgB/da1PtXMs20+cu/3xHOAzz9bmPolhakQnpUbNDe4/vh8nMFZsiihA4bXtm3xGvc4MIlNT7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6259
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 06/10] fixup! drm/xe/display: Implement
 display support
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 03, 2023 at 05:34:53PM +0300, Jani Nikula wrote:
>The diag push/pop stuff is unnecessary leftovers.
>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>---
> drivers/gpu/drm/xe/xe_display.c | 5 -----
> 1 file changed, 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>index 82d2c42629ce..391f08c1caca 100644
>--- a/drivers/gpu/drm/xe/xe_display.c
>+++ b/drivers/gpu/drm/xe/xe_display.c
>@@ -417,10 +417,6 @@ void xe_display_pm_resume(struct xe_device *xe)
> 	intel_power_domains_enable(xe);
> }
>
>-/* Display info initialization */
>-__diag_push();
>-__diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>-

is it?

drivers/gpu/drm/xe/Makefile:CFLAGS_i915-display/intel_fbdev.o = $(call cc-disable-warning, override-init)
drivers/gpu/drm/xe/Makefile:CFLAGS_i915-display/intel_display_device.o = $(call cc-disable-warning, override-init)
drivers/gpu/drm/xe/xe_display.c:__diag_ignore_all("-Woverride-init", "Allow field overrides in table");

there's no disable-warning for xe_display.c

Btw, doing it by file is much worse as it ignores the warnings in places
we shouldn't. Old compilers that don't support it also don't warn about
override-init, so we could have a better helper for that.

Lucas De Marchi

> void xe_display_probe(struct xe_device *xe)
> {
> 	if (!xe->info.enable_display)
>@@ -435,4 +431,3 @@ void xe_display_probe(struct xe_device *xe)
> 	xe->info.enable_display = false;
> 	unset_display_features(xe);
> }
>-__diag_pop();
>-- 
>2.39.2
>
