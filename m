Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82834CD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 15:15:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B0E112DB0;
	Thu,  4 Apr 2024 15:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z9ayfg5F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECB2112DB0
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 15:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712243725; x=1743779725;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=74McCnPAE7SP+q5lKG8GnussBByfjW3Mn9yE0sfoVv8=;
 b=Z9ayfg5FU5ow2js107JLnNHYNFztqybyl7aG0iH5X2SKWODx1SYiD6Kf
 GLcMH40rRtOZYOhlKKDhZXH1ToXm5ApoAUKZ6EFbDj8dSNg4wJVoha793
 Lav0ouGafzG32vswJKUKgTwOyH8/MU+NJ/xRMZBIuZClF337g4WBxYxm/
 ngaHLuvXQvJL/GLGQyimXKwQif5kSwEbKnDnwRuXqRCDz/3P7zmQFDMev
 pvM3Vm94wqGgva6dpy1HofAvfPlotR3QlW7Ybr1k3CwZzRRSxcpLCD8/N
 dtBSogAwOS1mbpVDmmT8E8LDa7uOznyyzkPI2WZx+FUvp0NG8cpaVZJOE w==;
X-CSE-ConnectionGUID: fY8TUwcaQ6unid9dd0eHJg==
X-CSE-MsgGUID: gGD1DVpgT7iHfC1AqbD7dQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7769010"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7769010"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 08:15:25 -0700
X-CSE-ConnectionGUID: 8rdooe5gSpOVAqtKq1Nvcw==
X-CSE-MsgGUID: p3b9/TA6Q+ulCyzmXC2K8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="18832980"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 08:15:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 08:15:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 08:15:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 08:15:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lju4ghoJEL2eKJMGYeThLC+1hub2gKEjBvPK486AI5ODUUmnxDbA6KrSCq7I4TdDUN5VUiClHGsQiEmEecq4JjlCJDnyiVJ1J0FH2MMpOAvVL0CteXchNCOSoKOJ0B4dAJW2cULK2igDfcoK7pJ8Zmkm3SwIC2u3ySeJr71XoEt5URzMQzphf8ZN59aEcKc2rqUen8Ix8eJkA8GjERqte3stal/2wIooscF93O5QMF+FrP+4YvkkurtYfOk6xTkziJYIqMPGtiEQrqzcWcViF4O5ov8MUXgs5NGsaMhamf0C4c7VS7zOTsBsLXvBg+QojOx5nSN4kAPHncC/ZIJY8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOj8oGnhJp5RlBWuU1JfdLrwteCyb5lWlGJSsp//Hyo=;
 b=R3P378scDmkYs+ckYW+ywgRzTGvxXKnN/64in55w46CHdZJRk27mkw1Lzc0TSkRTCi1zgQX+iROS0kQncGJg13ca/mGa0Vh7Y31ciclqs25S3TdWV74KQXntbH3tulHNDFBteijGP1NQ6nL0UDcEjCdban9AYBRQPLquIkkJgSbwaLzp9qsCrTLSwpsxdXqhL9Da8pvhbDwaJzLvpkP9+wj1X5dw2BIFH4k756l6CmJw8omIUjChdUBQo3NrW/zzJAkGmHp2DAjJDctNCeOadH2aittrUuNxrVqW/LMii3kkoVimyHU7pXeCCYGEv/xZU54Uza3OvZlGrLMTgb2OiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV3PR11MB8532.namprd11.prod.outlook.com (2603:10b6:408:1ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Thu, 4 Apr
 2024 15:15:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 15:15:22 +0000
Date: Thu, 4 Apr 2024 10:15:20 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/guc: Reuse code while debugging GuC params
Message-ID: <7yzdr3usawnm7z7cr5xswulalxezkqmfpuvdttxmdfjeqn36uo@l355y2fbrfku>
References: <20240404144107.539-1-michal.wajdeczko@intel.com>
 <20240404144107.539-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240404144107.539-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0066.namprd03.prod.outlook.com
 (2603:10b6:a03:331::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV3PR11MB8532:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Xko4oG9CefxKmKDOH+JU/DKt4wyro7R5VTB6kHWSeVePZNwmVvC/L5+Nly12zCEUherrDsIdqggWOXM7FUUiwdimofQ4Ie+RH/whDtf/D2P9t+mBcZkkzJJs5pdwVvSd+mDXIYfUI34bxp0tfQ8I0gOyXSc+h+V3Di5J7ysprEWEdRyKaWHEVBKzj3UVMf0ZJ3RmEZDxPKQDgOE6TAYuPAFnkKpjFfexb7J2ll9yLhfwEw0j2boS17VsuMYPc0ONKIPedNaowxyMZkqhOGqlllFMSOQQLkXKEDU8qm2ZNv8mclsTwYIWh2XvysDayL2De9W94z8DRyw5yn0Lp0Q6haZcyodEm7zxCsO30KLOruhPGqYkHd1orhWxbiUrnOb3p4TDiWRBv8473L9vCnYnNDfL+pikwkeppE9RD71ut41sxB2fSPCku/KH3XInV3oHrO+lSfsuSWJ0R1G37IVjy7bsy2Wyi9kbYvWhoMpGdxpVnB4Wk6LN83sFZRXDfiEUhxKwvNYK43YYUoIpRMVTWj2Fa+ExGVLN8hyw+U2ZA2qDgrilKFmCtn70PAvAeMsWkK6Y7ThE+QjSZG0iBT6Z9DGGWY26yGdgYyIPSWzcbHVHJPHLnGySRZhTCUCUzoC9GuUezvsqh7tKcGGGbeMtMR7+v+V+FvzJxj9gV2pkUk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J7Yr/UWI3ctNEFdWlqG4FqeaVFU1SUaDD2OOmdIThwYDg9DPJoOruEtBs91r?=
 =?us-ascii?Q?GIZKNsv5h/LtmIESPThL+2dLC+ljZ2S+HibJbaEyMTsUTAi/9++qx8KajUDa?=
 =?us-ascii?Q?nraGuLPcepSrGIVfg/vBAi4yzPxVQXD+H/CkWAHJUBzOZbrmgXtDWDakMnV4?=
 =?us-ascii?Q?8rgZy0yJD18ZBGZwtOZC21CL6pp2AA7S+DlMjwksaxqx2zSYC+DXb9DXsaKc?=
 =?us-ascii?Q?rqbaUN1AT07c6QdNcwJUNi4saOkPH/Kegp5FHfPi81wbEQdqaH/GiXW1ifpl?=
 =?us-ascii?Q?ixGlHBGlni12Zf/h+VXem8T8j6tpqBtMu08YM+AYMKLm9aqB49wsY+ssCnNV?=
 =?us-ascii?Q?TohXgsddEBSbS9f3SgDOrGWExFBhps30e7g129hd/gv2TB4bdtLTlajDTJsa?=
 =?us-ascii?Q?u+SJXKaNvdj/SQ662I0lKEI3oxsNEX/2CL9g6yaNtLqwznESCFh6OnV+Zb+C?=
 =?us-ascii?Q?5yF14FWZGkCxwuRwiUkofyhryRtsNIKSwD/0757eZWJvugyrIpawpkZ29QSY?=
 =?us-ascii?Q?OYsQM/VRnsq2RTfRzGuXljaeTM0VqJePiFcgOsEb1KQY2Gs/FMwe14fNqkCW?=
 =?us-ascii?Q?vepTsszjrVGpoe2aZf9R0T2+glWbECdjdzc870aPfytkunzuZTSP8vXmvz1o?=
 =?us-ascii?Q?m7Ro87MJSzAh+Ab9YhAMC2jLsE+e4tkxdRYYEY3ZHsirS6i7BWptoZm9d0HL?=
 =?us-ascii?Q?Xm48RYh3W3ckhQs4u6tOl52go26keuvVIKLAGdzc/EO6c6P8pXJ/teE1Zok7?=
 =?us-ascii?Q?ap2bZ+AgGuLi4FBHWRdNI9qaUhJkINpgtvZnojHdYBk6eABOSFYb/maNLqo4?=
 =?us-ascii?Q?fusiaSIe65LOXNQu5WH7ixX1dkTSMlECLeNLfJF7u+SEntLdpBOgAX67G4id?=
 =?us-ascii?Q?qCB+b4jCLKZ1ZtJMvwaFI6C9i1WfEirOyLZCkhe9nAuz8n5EydKa8FdAt4Ad?=
 =?us-ascii?Q?qx8/5TRRBJSOuuNFVyRxbtAXksLDMYT1OhtcGfkPYvXsUlNa/jmcSueQAqlr?=
 =?us-ascii?Q?x+eOrTanoqg6or61V2dwmmAlebBB8EFMFAkRMznnMCkUceCq7fjxBV14BIEy?=
 =?us-ascii?Q?DUUOnk9WMc2jQ9FRDc/Y7vSu4xTfl02QHrMBKPMbrQcFj2EnIHubjeQ3Dp5A?=
 =?us-ascii?Q?h2rk02d0IZnDiOOXlsY40CWaAmCPNn3RaSuLM/KLd/3DFTOM+fKk31ep4rVX?=
 =?us-ascii?Q?Hd5usQR/98inAON8IF8yQZxpWE6zUUrOS2Pwb414tAeSzrelw0+LJVbWbgsv?=
 =?us-ascii?Q?zewLaFeMBswSVpU+Tz2T+X676jAEyO0bf1vDivPpWqCsnW/6uQAftl+8zQpq?=
 =?us-ascii?Q?ppbHD2L8paiku7T+kzpNPhyJjjeTf4vjdYlDmLBr0jG7etZZZ10O30X1NFKq?=
 =?us-ascii?Q?2g0t51aFhvJEfILfgkjxJCQ0EbBkQM40qB9OM05p8GYLErewU8yvOKwiLsKl?=
 =?us-ascii?Q?V1vt8ygOg6OsCefsBkHzNs2RWCkoe+sTr+Im/1Pbw7JUP0a2znogGZYhCGpY?=
 =?us-ascii?Q?vU5x0j6i/wKDsPjc5K+hE4nqG5heH0v8g0ojzqEpTuBWYdP38RwIJN0wRQDa?=
 =?us-ascii?Q?t6hN9q9TMUyjeTUKgTxJ8u+8+H+BsjqyLKQkc7x+ok6Lifn0VqhYz4g999jz?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3a7773-cc16-4e3d-6a17-08dc54ba0bd8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 15:15:22.1763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbzfpZ0+Mv0umAaBIHImKXLy7mIXvYyaONqZXY8h2kPgG6+Wsr6V9b2QuU8hcCGoiFGCeY79FUXKdcpQHdhpxQ10qfUuowyj2vN+N9+PrM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8532
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

On Thu, Apr 04, 2024 at 04:41:07PM +0200, Michal Wajdeczko wrote:
>There is no need to duplicate code to print GuC parameters.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc.c | 29 +++++++++++++++--------------
> 1 file changed, 15 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index afb083c7cbfa..17041c9257bf 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -180,14 +180,22 @@ static u32 guc_ctl_devid(struct xe_guc *guc)
> 	return (((u32)xe->info.devid) << 16) | xe->info.revid;
> }
>
>+static void guc_dbg_params(struct xe_guc *guc)

dbg here is a little confusing IMO as it's not clear this is printing to
the kernel log. Maybe just rename this to guc_print_params() or
guc_dump_params(). Feel free to carry my r-b:


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
