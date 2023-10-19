Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0189CC001DF
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 23:09:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E39C10E0DD;
	Thu, 19 Oct 2023 23:09:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6742D10E0DD
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 23:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697756969; x=1729292969;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=W66kPRmwRXPP/EdLuHKMI7BBC+X+M6GcBC+tzHHSU1w=;
 b=eYocZpoLE4MJJWv9DB9JLgn5dMZJcH0RCsOT0U91jeJvX5dLskHeY7DS
 5ifrGz/dyISsvaU84UZ5eTlT32xvD7OCJU3CDkzFIAZpbqEaOS6+jV6E+
 lexJXU03Sz659ST1Kfi/gbMedDqf/ZnDBpFZJGyU9XneoiOePWwwx/b8M
 +n8KDo+PDapIeYDMCeVH1zssRiAFceHZQZw5aUMWeMxHSYZDnQTNUtX6O
 FOGJ6Q3lsHYdOZyNrknV4UH8MUIcWCZxi2Pig7w/nPJBVZBVs2TWBH5UE
 QGPO06RgDsBBzZeUEQEeYixADDHJ+aMj52UnMA+qXy8bLzPszQuo78nV0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="417522328"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="417522328"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 16:09:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="750701979"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="750701979"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Oct 2023 16:09:28 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 16:09:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 16:09:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 16:09:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAsKx24H6s1Ompa/eZm5VIl2qN0YMt1bc7sX7gz+vOUYyb4HIaMIXA2n5lVIxtTG8GaHHxPa4AtnYjpJvHqsnUZe9aATPYHv9tLnvT+f5l3HVv6qOdSoQjjVUxFPpM61fr704ErDQuP9ORyHrlYbRQfmbbd+tdRHapW27qtQrINkYVXoOJztU3GnTXBwxgpaV4yExZEWzwezlvANT3Hp3aMhYkrgJpkwLXwffP/p7I3exzgboCZYeDhngtSzoMBbkVlSENJB4l0qoLfTX8SsQUk0x8LfPpO68LZQTtmrjhuE9GSV0rWq6Kdtbu8oTYTYdX5UPlqdhhBbNX1THt3xcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OR0k5591vu5rMNgMkjsm2CDvpu9gfU2gdDi6ntT/6So=;
 b=FYGXu9iUn4uw3zZJUlh4Rnu9LN0n4jV4LVKvQ7+ZIZTYIrfC7XhQ4evbPn0/bcmnimXfeRVf2v4wKbuL+nqT7+D0Bx1RyplrvILbg33EYobqZfsTmWGPmE+al2XiCBveBgN/Zp8LjXuIdc322+evP/iHNxOz/DTpb/wi1SrYnPgCZwA5vzsECCNxhU5OcaBb8C8ZUtvB48J2twzMZOSHqvjF7Dl5jpIS+h6bt+E+qnRSGXPe14SVcv+GZpmjrjQEg2y0uB/euUdnByanNVrjOSE1TeGAnpWH5IE+i19ABHJytguYE75I59D4CdY0Tauikx+0q6/cuLrBtKG8VA9/DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6140.namprd11.prod.outlook.com (2603:10b6:930:28::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Thu, 19 Oct
 2023 23:09:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::c228:5055:b7da:d0bf]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::c228:5055:b7da:d0bf%6]) with mapi id 15.20.6907.021; Thu, 19 Oct 2023
 23:09:25 +0000
Date: Thu, 19 Oct 2023 18:09:38 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <7qjwrwovend6qth3enrdpuext3223c3wt7sey64dufkuu7a2rw@5wault6k2i2d>
References: <20231018225707.1685294-1-daniele.ceraolospurio@intel.com>
 <20231018225707.1685294-6-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231018225707.1685294-6-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR03CA0371.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6140:EE_
X-MS-Office365-Filtering-Correlation-Id: 707429ed-ba91-45c0-7633-08dbd0f86fed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7jpaOIoeioWBN6cx6yY3675t3pyqsWU+7ZTqmIvyiayQEq4iSwdnNP7glNFRc+0rtHfX8ZsPpS++sE5PdZwPMGq0xl6jMnBEf0yB4PthHszO6jdtwOoXLcPiNSKBNw2kbG5tIGEE96hWZC29xgKs0RR66fNc3RDYZXoP4n/s8AoVQfzdTMITrTFCYlPiqdL0I7O8m4PKjAXCZKR1FqLJcudOFveDZjbtWIr1TvIPoBaZmnc5O/1gLbMm2hsoM0VJRlg34REW9RjZkUjfgsSh5mQY0qEqZ1lWmX9lzfurmF4eO11h4dlqN7tuom+MaHrNUoM7zk2Y7qUFb2iQyrqILmVAj1YiRmymFxvctbKbe9eZIN4pS0FoU9rSO0dfLtOUJTAGXDWZ8bn5lgwXNV+zualmD1Uau/dQCrU0jsLhZPCcGHi50CCmhmgZSUP8sX37CDelQ1QIpI+KSLu+tDxwEvZY0H+EqrtondynOXmPfUh7SVP3UkVPING0WXNcEq5RRNwwaii+ZSo1TyI0pnIneuu1ZPkORMYJ9RuDoNyJn6w/AJpbDd67SJ07dc/OQ/qx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(346002)(366004)(39860400002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(26005)(6666004)(83380400001)(6506007)(8936002)(316002)(6486002)(2906002)(5660300002)(41300700001)(4326008)(8676002)(33716001)(478600001)(6862004)(86362001)(6636002)(66556008)(66476007)(66946007)(82960400001)(38100700002)(9686003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?orDf/T+y1YKbr8XrE0hMV77+ekF7DexYgyxzYO8dCNGIj/BEZXTVghzRx7Xw?=
 =?us-ascii?Q?E5qALD7d/6PJ+GOEyXgvvA4yVQonlfAhS6FjC3EFK6nvpb1HzpWpAumUUty2?=
 =?us-ascii?Q?aPCTnjJlNKh+q2xQWTxi0FEf+FJEVvqshv0prLQSwuEENt4UxW9MScr4Oc/e?=
 =?us-ascii?Q?ZZYR+TtJzhJfkuMIZJZ+bS0oco0mpU+b1khTfdTo+HIhRtoh8Jdf/LQ7QFVH?=
 =?us-ascii?Q?Cj3hX9kBUhph0dD52C/EjPSPgTT94I0k3z2+JrxMLRY+5pBF5seiDmXMi7kf?=
 =?us-ascii?Q?DOSVfdjjA8E0+k6Cn4QY9abqKnL4qr6oDUcjA/9tWogbdDizffsLjxVEnXmC?=
 =?us-ascii?Q?WUGq+FOtvjb2ruUvC6wYS9Os/QGjLNkl6e230mGteyz9VSqBHhMtXsgU82Oz?=
 =?us-ascii?Q?vLWJX0oSevF1uiTQRYN5/876h9Wsym115ofnE6oD9sr5WGMlqHQ7M44qfe1M?=
 =?us-ascii?Q?VMa16s+e2uhgf/nXJdRAH4jTQQ7luE0TlINd1Iemy1Ws0GhmWjFcbcD8z3SN?=
 =?us-ascii?Q?/OM/bNgQxqsRYUT8cS0t14VnG7z9RGvwNqKiubJ0Kig+WmH9FWiwK/Qcm0wk?=
 =?us-ascii?Q?dQfHKy4r4n41RvkUSbZlK/vZOek+wQhBaQqetebuf0Z04oHoVE9XaFpCkDN5?=
 =?us-ascii?Q?Gehi0jJu0fzcdWyIdK+9riOkl13e6pODV5sRgRpGVJ+Ou4SoHDYVkEGuwLUI?=
 =?us-ascii?Q?GTq5RaaNSVdjbxjz+XJPeIuqVMsHfdcds96/J+6rEmy5d4xeK8arbA21bmo2?=
 =?us-ascii?Q?G4pQUT4mBNa9lBtsuFrSXuvOxtV9zhqgqC/VWFxpBYtueGz83akuJRJdrjJ6?=
 =?us-ascii?Q?CE05eJ3k3n0oX4ltwd3XmJlXIXCaHEnSL8xTB18JSgtcqqEyUwJdyA6mQarG?=
 =?us-ascii?Q?3iP08ah1gCZ6MUe7PbRzl8gtaB4WZAQZGoaGYQFsYw9FX/mqXFN5EcERrf5a?=
 =?us-ascii?Q?XtUPKFY2mrnNKRPq/ndMHRKkpHFn4w+r69chSbpatfc7x6XTUNgtQgKnuuaB?=
 =?us-ascii?Q?L4nZ+9Z9FpJFZx3iunNbnQZN+RdZs92yg6cYUsuOI8K/LZpWhsGU30O3cBoP?=
 =?us-ascii?Q?7yEmw9l8HaBO9LhbvbpcdPtAmYpQStHAGKramGbH1zFNU4rWm35LtS2qNh1e?=
 =?us-ascii?Q?nLnew/SO35nu6l/0e3/SJEzMUXg+KmDc2/NOYn2agHA2GnvUg3Uzm+kwB7Jk?=
 =?us-ascii?Q?Wvvi0AYB3sONWYSpBkELLTG9FLTHE4q501GDeAANL5VmJhD4qnAN+qdrDgPV?=
 =?us-ascii?Q?cvHRnBu33Cn3DT1GSUOvP1zW+0LOS1/ptXB3FRvjzBZ+JvOeFv3wyEcoLyJr?=
 =?us-ascii?Q?cpEABfVdP4ukt8HibAOXFdlav8E4A4LNpvRMFQDUb7brfvyjOMkBFVThwRdy?=
 =?us-ascii?Q?FpB3+4rvITBvQk2dahbhEDzX8pmjl6/dHb27MbjFcv2Vf3efdgzxErf6u6/Y?=
 =?us-ascii?Q?Fln1iL24VXUdHqlYGJVY0hz+6j+tw690s7lyUtWwZBN/tVOTLuRZkn3CL3nZ?=
 =?us-ascii?Q?MUM6i+fXFLRlMybvZmASJY16QPJFBWmZhkEMNam1oE4U9l+mcdKnotCy5axN?=
 =?us-ascii?Q?/yFWr9AG5i+ODprQmFf81yhqxV6cYNziVawXEi6oRE9BJXEl/ODPy9Ur+pPr?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 707429ed-ba91-45c0-7633-08dbd0f86fed
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 23:09:25.2815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X0sZvBmMH9M7Ki5IRgZUG1NCgczN4bn+su+PlYssrbInzHfgX+Jdb7V0DAg/rtQfnTJJ2mN8aa4Nv4TRsgNqUqkto/qz5WtX3r55GWv416g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6140
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 5/5] drm/xe/huc: Define HuC for MTL
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

On Wed, Oct 18, 2023 at 03:57:07PM -0700, Daniele Ceraolo Spurio wrote:
>MTL uses a GSC-enabled binary. We expect all GSC-enabled binaries to be
>defined with a "_gsc", so we can check for that in the name to
>determine if the binary has the GSC headers or not.

this commit message is outdated now. Other than that,

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>
>v2: don't use the filename to identify the header type (Lucas)
>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>Cc: John Harrison <John.C.Harrison@Intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 13 +++++++------
> 1 file changed, 7 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index 2680b5082ea0..0fa1b3415eff 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -113,12 +113,13 @@ struct fw_blobs_by_type {
> 	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 5))		\
> 	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5))
>
>-#define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)				\
>-	fw_def(DG1,		no_ver(i915,	huc,	dg1))			\
>-	fw_def(ALDERLAKE_P,	no_ver(i915,	huc,	tgl))			\
>-	fw_def(ALDERLAKE_S,	no_ver(i915,	huc,	tgl))			\
>-	fw_def(ROCKETLAKE,	no_ver(i915,	huc,	tgl))			\
>-	fw_def(TIGERLAKE,	no_ver(i915,	huc,	tgl))
>+#define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
>+	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
>+	fw_def(DG1,		no_ver(i915,	huc,		dg1))		\
>+	fw_def(ALDERLAKE_P,	no_ver(i915,	huc,		tgl))		\
>+	fw_def(ALDERLAKE_S,	no_ver(i915,	huc,		tgl))		\
>+	fw_def(ROCKETLAKE,	no_ver(i915,	huc,		tgl))		\
>+	fw_def(TIGERLAKE,	no_ver(i915,	huc,		tgl))
>
> #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
> 	__stringify(dir__) "/" __stringify(shortname__) "_" __stringify(uc__) version__ ".bin"
>-- 
>2.41.0
>
