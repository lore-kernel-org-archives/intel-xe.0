Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6D4C47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 16:41:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB3610E0AE;
	Tue, 23 Jan 2024 16:41:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2278310E0AE
 for <Intel-Xe@lists.freedesktop.org>; Tue, 23 Jan 2024 16:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706028089; x=1737564089;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TSbidQ+25GLAPPLs0xL1GR3TkJaC+6OCW6BTUn74ktQ=;
 b=OYcq8h9zp+DePMpwbu0exQcqR1GCSzdrepE9ABPCqqTe11W4bAgsgbdf
 lNIl4VIQyYy7UrnV4YBTYSqRBkNvOC82olIk8DIodbJaEtwNGZ6F4EgeB
 CdddkkkgrhW7cIeMWvDtxb4ha6I+KR/F/sPzRGKPz1omxCjRRU7hnTS1u
 5I5PX+p/3UergY3bKknwZzqR6SxMqMXwVteJFsBqMR+i0CxUcOq4wyRxW
 sa1LaV8r+vB1fcrQa3QCavzmqI0D4ZXVU99ab7TrRAOUXcJWy4ghVowiA
 KkBPXt+49BPEUTiwQwgKKh6N0JFfYxA8Cm7rH9bwDnVUwEaNQWgH2OUrR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8331452"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="8331452"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 08:41:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="27809256"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 08:41:29 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 08:41:27 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 08:41:27 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 08:41:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGSyyPWcwwrIwUREAzTf6ZJrkc7gMc3grsOUybPdnQQ0sD0AtMRDc2S70TEafN9o2ORFS81WYNC8EeEHSjCfBj+rfllY/q20pSZhqfdpTvhvMc0is0gnpEtsa/a/z4kBKMFnRaBA8Oy6P93QCmzGO8qtOdMcBgsuAwrXr/w07oWlodUGHOToO1WmPaPqATbKGsKgz5XI7CB9NXSETyd+M5ufJUTK7XX5hhX4G9HaDHss+vLsWbDyp0G3o/T5hAW1DS3a61NkWXqi/xvwrUem2w8Oncz37nIluTUKMpzsuhOCm+OhXeXj+O++UW21MQAvKBINqLOEwmea6ranNn0p7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CEiICU6TXFHhu8HFKZZTpt2DoEVeKdvDz6cNZuj3zw=;
 b=DIGZ9LxhWwqAoJsyES1Us3sgLgfRRKbq7v9+GDzARxOaUgamEDOkuF0jM1jvP57ouSXCSrmJj+ogeLauPb5ReiSe2I3Pu445YtirpRqTvtw5S9Jm5mdqWXaP/5Dbh2KrUkc0ihT0kvK8B2N1E9meoR+khaG9Jg4mcGVlKs8TIVvLYhHEsv8Ut0B8me0xmdV2mqt8eFBrxaHOBi7is+jwl7iV92AgANWUcvy8BBNSBWiRAi7OjGSs97wViRUnWRQlKiiw4tcWkiAgcsvaEs9o6OrEfJ8j+oLe3EVOJTeybz09xq5CWEHtIYSJm20JpQGr8aAqkTiEx/iMoSUsAHp7MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7043.namprd11.prod.outlook.com (2603:10b6:806:29a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Tue, 23 Jan
 2024 16:41:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 16:41:24 +0000
Date: Tue, 23 Jan 2024 10:41:21 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>
Subject: Re: Re: [PATCH 2/2] drm/xe/guc: Update to GuC firmware 70.19.1
Message-ID: <wqlmadoyl4ifwavwaihupuc66nygylkxijofftrphjc4bv5djz@63tydn37unxg>
References: <20240122213708.1841488-1-John.C.Harrison@Intel.com>
 <20240122213708.1841488-3-John.C.Harrison@Intel.com>
 <069f1653-d286-4bce-84f7-e2198ba0c5e8@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <069f1653-d286-4bce-84f7-e2198ba0c5e8@intel.com>
X-ClientProxiedBy: BYAPR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:40::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7043:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d56ce32-811a-4990-7d51-08dc1c3222cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D+I6zEAjo/wNHAI9rmCwBQYtmF8F4dvc3/bR/k3d/mzs+7k7LBKiCgv8dh324JDU2JGHpWefLLg0J7WKJKuhjHAQgo/c5QquGbmbxaKINcXSHDTgJQ8bQ/MmLe+4ii0QghloJbK/m0IhBmFGgD37j9Meni7I7401QHK/Y2u9h/Tbv9hZ0ahb7HYpkKWAAZVLwcQR0yTrFDsuBgrNPxrTOSmUq5VDas7S3UDOOaqFz4h8WdVxqSibSPntXyo+xu/TqRQPSBaIbjso8U+ipHWQJDtah6KYZsUC0RHX1QKOzOMNeRKIID73Q6dd5a4hkJmdkQlQltMupCRODblLeLIqqLP4B6iQ1XTOc8xJ5MitA8smZr053zMab1SwyAxjKtEZAyrwstoMJtLp4v48wJd6V4WFRX1bX5CbuEomaKDQIIM28pHLIcPUzfthWtZMjPKRfDFjJWZwWWb+61wnM7u2liRGqW4eiVr9rO4gb0j0Fy0jZgEgVPnNHZvnCgxg9ySsL5rv9Ztv1aabX/bJAyOrCRU4/dTGXK/WUc3L8H/xtDhXcFKz6Gr0hPvDd54pQOdC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(136003)(366004)(376002)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(33716001)(6512007)(26005)(83380400001)(9686003)(66476007)(66946007)(6636002)(4326008)(8936002)(6862004)(8676002)(478600001)(6486002)(66556008)(6666004)(6506007)(38100700002)(82960400001)(316002)(86362001)(41300700001)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VbWjv+DQVCua9RItcOu2iswKvPE7OWD74Qj0Bt0YLbuQiJJZKgX6PEJU0eRf?=
 =?us-ascii?Q?8DmH0Q9rMXx/Q6M50+iY0RdwTLku4+o+8sRLK8QW4LsTEQpQfwJGwSol7sKy?=
 =?us-ascii?Q?fI1CuF/wSHPo+c99Nk+tQlC1GcUIwVmRxmCCkWqChkZH+NTP6Sg34ZCdXjOy?=
 =?us-ascii?Q?lMHxjwFNn+0wj3pTvr4JV73uRMeo6E7z+SXxOotCKChMYJor14xVNbO0zvqz?=
 =?us-ascii?Q?tS1g6Qk6SveywfGp00oJPJOZCXktMdlDlVFj8rrrgR0qVFVmyLpz0hnxc79B?=
 =?us-ascii?Q?EJI9rQcAHFZuo2HtUvFaA7yt3ubnh1LTiIphbJXCj4zlmet/uU5RzWi/409O?=
 =?us-ascii?Q?W8BFwJSe9WkOK5eY4VCok8dpUbkw1zBUqyMIi6ntGna8cGPL5UvXejsUFXGv?=
 =?us-ascii?Q?8LirxQ9kc6o1AaJyCr+HlkqskyvbwJNd5LGbtDI0Mvcv251raSgm3VVZo9aa?=
 =?us-ascii?Q?Od9FfVUOw1LLMyhH7Fgzg8yRS1Lq+Q0DvsYkFil8Ah4rLENXhEy53gN5GSui?=
 =?us-ascii?Q?fJinR6MV0H+JX4Ir6Tyl7DsGl9Kx+K8RREGMstfM4S5qJO5yQ7b4EfP5heor?=
 =?us-ascii?Q?OFwMe+mlvpvLoKD2eOfwcjQMAl7Tnq1MBnrB2F4I74a1oSmFX1aVWbeN21ia?=
 =?us-ascii?Q?Iesl0PSrwsMh09O41om4nfgi7zd6sXKzuG5sGM9KlgpvlFd7XmrKKGePYoiG?=
 =?us-ascii?Q?j8huprDlyRiR5es/1EdZBhfXYatFyOmkjOokDUt3tCNXhJrUlY1zK6a1G3Ow?=
 =?us-ascii?Q?4sgeV0WeVSqkDB9HCd635wT4SgdjI090GfBplzfEUJoe1Yb8YLBkDe05+AE8?=
 =?us-ascii?Q?f64y3gfOnv/3Ve3Serm1fbrI1GW+gRS6lIFByKBjThwCf0VCmoSPSHBP5lrW?=
 =?us-ascii?Q?jnOkQyEeCOfrpH5mnntwyenMoSDxkObO1qMSBwhV/puPOUxFxeARZXvewAy0?=
 =?us-ascii?Q?1iaFOquSGnaP9dtGVGqhFOXxIDQOpOlH9Q9Wgvkpl5oNg+VTfyF6DKw+Ysj0?=
 =?us-ascii?Q?FqWstOhPHsyDEU6qpDLmApTeLebYY4fPUWKN6JU+FIoWqgg6a1ZnjcYCZhBu?=
 =?us-ascii?Q?DL2lq4Dq5B4Uq8LsYsDY7lnt6xO9W0UX5kfbEopy/IJce2C3oQ6oOugDache?=
 =?us-ascii?Q?phM59MRoull3DMaZPyPFhO+hc5tdSWjsGLxlQnbVC/vHjEtDSb+nNQPfbOS8?=
 =?us-ascii?Q?KMWY8gVsh57KHORXBuq0/RodVefS50/XS1uDYBMQ2svRIzAQIRJwo9vvhoqC?=
 =?us-ascii?Q?DmJmAwsosBs1Mjt09zPr2yrkZvYoblajGwxEp4laCqvY2+Fv3LE8lkDwOZkL?=
 =?us-ascii?Q?ufzLAS/RkA0MVYKqfkhRXXs8sg63jWXBZJWFMAqYmjtlxxrFn/LyVRdT5yAC?=
 =?us-ascii?Q?pDVgr3S+o4bH87MIWXLFO5acdqVbfvuM7JZN7Zy/eKgX8PtdbbVcuzVQoz3B?=
 =?us-ascii?Q?yTm+fAG3vQ5CEvqb74YZUdeI1QwPpA/ZRQK35S+ZdIdKWW5Gy/3iTNLWmQ9c?=
 =?us-ascii?Q?80iXIW2RAd1LYFAgmFSpM/hPGHAXBLeKqtCkNUnOQk23aN0MfsY6h/l/1pZE?=
 =?us-ascii?Q?rm2donb6YFO6Ti2vinT05O+SycsivA5PqmQd9I2b51fajFlIaieZF5v3QNTu?=
 =?us-ascii?Q?qA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d56ce32-811a-4990-7d51-08dc1c3222cf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 16:41:23.9436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iYxNnFh9NqVcHDkZoF3hKChRPJDm3ntUKKA2SX5Bnb3q+RgCE+LAsoW9hUlXicOyVVVHvhb3VV1E5uBF36IFfCXilNJP8N4Ci/z8CoWz5Eg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7043
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
Cc: Intel-Xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 02:14:56PM -0800, Welty, Brian wrote:
>
>
>On 1/22/2024 1:37 PM, John.C.Harrison@Intel.com wrote:
>>From: John Harrison <John.C.Harrison@Intel.com>
>>
>>UAPI compatibility version: 1.8.1

what exactly is this? We don't seem to track it anywhere in the driver.

>
>I've wondered for awhile why was lagging behind here....
>
>Reviewed-by: Brian Welty <brian.welty@intel.com>
>
>>
>>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_uc_fw.c | 16 ++++++++--------
>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>>index d3f0fe2101a7..8da6cbb8c9e2 100644
>>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>@@ -103,14 +103,14 @@ struct fw_blobs_by_type {
>>  };
>>  #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
>>-	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 7, 0))	\
>>-	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5, 0))	\
>>-	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5, 0))	\
>>-	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 5, 0))	\
>>-	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 5, 0))	\
>>-	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 5, 0))	\
>>-	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 5, 0))	\
>>-	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5, 0))
>>+	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 1))	\
>>+	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 1))	\
>>+	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 1))	\
>>+	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 19, 1))	\
>>+	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 19, 1))	\
>>+	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 19, 1))	\
>>+	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 1))	\
>>+	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 1))

are all of these in linux-firmware repo?

Lucas De Marchi

>>  #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
>>  	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
