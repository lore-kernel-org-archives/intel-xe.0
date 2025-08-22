Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD54FCA0EED
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 15:49:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16E510E161;
	Fri, 22 Aug 2025 15:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H0MnDQEK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC4A10E161
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 15:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755877743; x=1787413743;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4btaxPusCT9h+1xuIfpWbRiJ0/m//Lws2UXyB05S+/4=;
 b=H0MnDQEK725NUaLpKnOIisp/tpgu/tVCf9iaJ+u2L9sCKIS9xooYrNk9
 BrpRny6axd9gENNmrkQSpaZaH3zm1z56VVWwlgnMARx50TidOVOsjslOq
 PXdnZrq36pZx923Qo1bQ4W+6sqC0/hOvJp4QXz0ZCklfXWR8L9r7wo9dt
 y4zBml0suUVwu54LgO478Uh2CDn0J+hKJdVF+gRwI2FtdOi9gRNf9+SKx
 2Gt8posus3S3+ALnVAD9fcqQ30Jl2mXyvv6ZnlzGHCOLGwDYtj6MMab/s
 CvwzGt6P3vvP+3ZPjjvmWIJSHQW6S34CGDYbq8FFR6MxUCqHTHC6VmEBd g==;
X-CSE-ConnectionGUID: PpxOwfi1Q56PecJyiD1KMg==
X-CSE-MsgGUID: 7vqaQwjaTTearw9w/G3UvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58111454"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="58111454"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 08:49:03 -0700
X-CSE-ConnectionGUID: grqYZa7aSySGS0FuO2E5Aw==
X-CSE-MsgGUID: cdHcBjnlR/+jiElHTNENgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="168335594"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 08:49:02 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 08:49:01 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 08:49:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.75) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 08:49:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BDmXEEGNJAnbPrr9SCs5pECHdUJZ+FyWKNdrK8igVinQYtnRj9QNv2/tEUp5WYot7MNV9pNnYnLfUREN1vbVNMn5M/5o1lbdVyZt2fTyPHcXbiZsN3FM5bZ/LE1HF5DebbFudX6EMpTpQPSA/kHAiTDxO2gAZYFbUebYSid/T6ffNh+PTB4uYnIscCgwyy9RIhRbnHnm9sGogwnWUDf6T3TZ8gtIgpQ6yqJBU4k+xV3oJY27TMxqDZ627cYVzl9q/iKKyF3vpjtHl4mziZuPJQRFh9Rllss4jey3XEhDvipIGKxDAgG/mrjLed9ctK+VlD8hzd1i8tzBRGCtMbluzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=spWwYkMxRHIN16Mt7G+Sq3CexAvzxajWa/A/a2pj5uU=;
 b=YuOYPH4mJFS2CuOoAlaYBUrkke2olIx6HgGQzUCDW6Nl2Oqv/y0oCe0vxi3J5TMeN5sRF5zKypnrPDZueUc5ES0lucSzOyHaTovQX7JjQLDXjs/PUWVLvRg3cDPXWeX7vPJYEul8DJNJjcNN8oEUKo6uPlv9j2CQgCgKpHCGc8Nr5ezNaqqnnLqZymWYJQdZ3oRiDB7m22oqmFOqmXSZCuVfYZjzsZw7DLce18QzGt//pepVQj56LSlBmqB66oAAhcpe2WPsUAoFZhs+qs5MN15q94SrdUUr70m87pG3e+98eecBkL/XT3Tqwd6CUEyVnJXApWVeJoEmf11cfHEY4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by BL3PR11MB6364.namprd11.prod.outlook.com (2603:10b6:208:3b7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 15:48:58 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Fri, 22 Aug 2025
 15:48:58 +0000
Date: Fri, 22 Aug 2025 11:48:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>,
 <carlos.santa@intel.com>, <matthew.brost@intel.com>
Subject: Re: [PATCH v2 1/8] [ANDROID]: Add a new xe_user structure
Message-ID: <aKiRZkk2CV3bJjOO@intel.com>
References: <20250822085932.2221054-1-aakash.deep.sarkar@intel.com>
 <20250822085932.2221054-2-aakash.deep.sarkar@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250822085932.2221054-2-aakash.deep.sarkar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::25) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|BL3PR11MB6364:EE_
X-MS-Office365-Filtering-Correlation-Id: c84f0c6a-6f46-4b16-d0a1-08dde193685d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?fbTH3HcsrY9s3Bz31ITqMeSDXbjWNtrf+pC+sv2yDZBjJ3SGWquWvwIwaG?=
 =?iso-8859-1?Q?gT7T5TRrhL4OZovAhCG9z6v9SyEGpTmqd4YQ1DLXgkuUFugpflg+WLjpx5?=
 =?iso-8859-1?Q?r2mB8luIHotaXlRc45QnqJdj3MgXn9ZXq84hBodBIz+r4TnVcsykac3x88?=
 =?iso-8859-1?Q?vxSEwzi3CGBuBXIW65u7M/BmFzksl6aJw5bhf+ILG3zrit4zkofLRYh2+S?=
 =?iso-8859-1?Q?+baMO/p3V25X+ovAintplXiQfMw+Rrsx/hHD+4CfKxZyMsWvrsddSOMH4i?=
 =?iso-8859-1?Q?rRRFt+Vaa5MKF+tK9T9HOFrykRcntb7dUmV0wX/IZhci7BFp/w6QY8HJ2h?=
 =?iso-8859-1?Q?meEmeCZeRRITMJy4azwBPSjeSz7RS1lcLscwl5ogUs9Mrh7S9+dTaUUhPs?=
 =?iso-8859-1?Q?xrHaQv6rveklfmFoY5eYEoew2eAR0uLTyS+SiB4/XBWcbO8tm3wkgQ+tqz?=
 =?iso-8859-1?Q?7gPCUeKl3IyDEovdQ9olDS34AkxnfG2+JNKeZTmu6c6C46Lpd/9JuUJcSw?=
 =?iso-8859-1?Q?0lEi9JNGkX9dSGJ1PRYmQuv2GBLOgMRZ0P+V2LchbWjlAzjFJwhMzFHj9T?=
 =?iso-8859-1?Q?ERmnVmVyySm7nIw76p2T6rg4Q7VI+WVOx8oScgrJdGoVrNxwFheWiLMwKn?=
 =?iso-8859-1?Q?Y0p9efhv8STZkSnSVhfNyCqhQeDv63EpXENdDKfcr5DS8+hniP4m7Qvw4E?=
 =?iso-8859-1?Q?Hyp4IzfSrDbeUfo7l9A+rLVgGYbsAxn0TLnm6TITkKmIqtzlC408if2CEp?=
 =?iso-8859-1?Q?ebU0CmprTTPkM/yR19zq5wNK5WB6GrFMFCGn2g46gLNoJX0Ha9BPE4LLGN?=
 =?iso-8859-1?Q?4xhMyd2jufrhN2cT7xs74jb8jNJlIG2DQyjX6CnBKAykSxr14g4P0kjwwE?=
 =?iso-8859-1?Q?YkbyQYqLcjGsYEI5g7zMi8bxmIhwaUZaSZpQdUHN4Olu6YQGCnVUHSwCBu?=
 =?iso-8859-1?Q?+j/1njQE51klP5pzQesROycdLtbRojDMPBN1yUch4Hsg3YKaIhLJELVf0l?=
 =?iso-8859-1?Q?EhohinC+F9e3sUXauI4KPX48joekc0Z8Qn0/UEzsRdsDFxWNoxo2a4zbnR?=
 =?iso-8859-1?Q?q0P5dvWv5DchlzP8hLGZrxCOlDUKq8C88oDUz2/PgoVyVFcBsVrJ/4CX5t?=
 =?iso-8859-1?Q?LPMcwsHqQdwhlOZa9VYv88YbwHOlw/PvZXoKlI9BrPC3MHD09IZy8bGN3u?=
 =?iso-8859-1?Q?nUmJV4OzQLemmp6+ayNmn/3fjaWwrdRBYxD1jFK127LvesVMlK6ow8xSYB?=
 =?iso-8859-1?Q?Lw83/Ux3iACXl/D6MV6zreS0IU73i1Tn5aIcKMH3GEZ4SKXj58+maAA3ta?=
 =?iso-8859-1?Q?AyOZtlx1O7NbI/hGZqOxniSpYDWzCa7XaiFmmx80nZ0uTCP1Men2DQjcr1?=
 =?iso-8859-1?Q?nWonhLhyjBlQvyDDMIOhUWpZssjWXhleMuF+WkTOH72bGxAgZZy75hoFzw?=
 =?iso-8859-1?Q?whNSlwwGZ98Vab/RYd4w8KcTP08m7r19o0EPay27d0iL4Y4cF1d73jR244?=
 =?iso-8859-1?Q?4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+32FOz+6p/DhXGlHTM8eMeoJ+W1FBXri5UxyLqteoEVHsaP5YxTbqHo2D7?=
 =?iso-8859-1?Q?t1D+/1P1H06N7er29U1kWi6mHuPV8lJAd/dBHCw3LwdPna5IWii+N1B/lc?=
 =?iso-8859-1?Q?C6IBEdTNqvREqBkGZG+JPeTp61lRvaoI9pXa/JAtPtvQuBC4l6lXrp6z2x?=
 =?iso-8859-1?Q?XiRhX+Tab4fgwk0DDhcK/DPI/TUS2dwXKM02cErQBwMp2nRLVvsNYK3Yzi?=
 =?iso-8859-1?Q?KKfSA3g6RPt2USm3fW4oZxSetUumQm78zOtWmnZfFmfA+lzEe0Xm24LZo4?=
 =?iso-8859-1?Q?ZkkvONfDW9NL0eR7bH8ySkdly+IXLRMr3QHTX768+sqzA85f6ltk/25g5X?=
 =?iso-8859-1?Q?0Y01jHH9NnRChKe+9VGbQ4Yu9bdqV2PxYfGORUiQP58WvWx57SDZS7Q3gz?=
 =?iso-8859-1?Q?rL2fIIRLCmNGDykCyno6sbFf2LtJwbWRIVquJN9Y1TADrfpmuZ9XZTXrA3?=
 =?iso-8859-1?Q?55O+lEaDadQxLi446bpGYCijYhjmEBM9eKIBkDv/L5iootxl7XBNqn4TW5?=
 =?iso-8859-1?Q?T0Ko4sb48OI7ZTKgvGUSxyvJrcIS9con6NDGZ6HmpyV90pRqh5t/T6PIeY?=
 =?iso-8859-1?Q?dr3LscGKfucuJREodgN2YJHWc2V+mm33Tr8DPsqOe2zV1elkcIhOgFsBGr?=
 =?iso-8859-1?Q?Pp02cYFNmHSmgkljwic2rzrNUGQFXxKLq+WK4jgFW8hFNF9wAmekTvQfYt?=
 =?iso-8859-1?Q?sUIlC288Wx0DqL5DJ+bSMzFkYFX0MOZdRNL4kKd8SrDi0AChZbaWST5plD?=
 =?iso-8859-1?Q?F6r/ReOtTn/Jjbs5x9VpeLTUA0cRjqlZGdVdwtY6En43knfEn+XG1HRHyU?=
 =?iso-8859-1?Q?lRPP+gHBcIj4Mjw7N3rmUy9nyhy/1nZ79D/2v8q2RiFrdB6EYiplTGxsXC?=
 =?iso-8859-1?Q?URrskm5Oa0zTGM3KIrWSieLiee62f4B7egLyipl27KMcqlS886jo0TqyqW?=
 =?iso-8859-1?Q?aLrzC9sFRgPoqlpK7bhTzP6Q1LxbYayuShceEdXmTHoDOoGZJX3/VPZIWD?=
 =?iso-8859-1?Q?cKJD05/y2yvpvYdxiIo5uBjWUq7lCMskrrO7Ak04GdY0Es+OKigoCoozSV?=
 =?iso-8859-1?Q?AgGk6IjXcw8eMxbDYEVHdcfDNHwuwIQQfQaDa+keOYRDhP6g1/E8TLqPGQ?=
 =?iso-8859-1?Q?Ysc5naIfZplGZZ0cRxRbASxGl6CCq7z9cUsn42zc1tdLT6q2NzWbqhapQT?=
 =?iso-8859-1?Q?Do0g0cBpzPgc6oEc+iix4974yjGZhFmgDAq3wOKivpLU8D6flMD6896Zjv?=
 =?iso-8859-1?Q?Qc/3/sUxqSQ/yPtBTWMXSdyvjSMoW6T2EJT8640A4WdqdV0Cmqwt4/S/0f?=
 =?iso-8859-1?Q?yL9cisWeqZBQFqwfCc1J7wzo5hlJ21s3bPX5xAtl1qZaeZRANBsrB5PKde?=
 =?iso-8859-1?Q?KYaWq4eWobC1Tub2Qv4NL+1f7pHmSMNpFwp/b22sZQnFy41V+M2O1H42l6?=
 =?iso-8859-1?Q?apDTTydSc2CXdlNJW8zkP7UHZBmc+fb4Gjo5HbAdMi04b1u+XzgMPHtMw2?=
 =?iso-8859-1?Q?wXDX3La0FdAlIvLT3hGJbTD2Q6QeB6AhQDjWyXHoUoChqfBfVhrh6e+UDc?=
 =?iso-8859-1?Q?d9Js9ToO24V8mhqPRoDlsAgX6rV3XGfb5NnGO2D2Dfeze4o8ivdlAzT4Kr?=
 =?iso-8859-1?Q?leO/gWDNQjwJYsCGrgj4QGizEqq56f/62E?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c84f0c6a-6f46-4b16-d0a1-08dde193685d
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 15:48:58.6412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 23I096taT2XN9HL0ICIBvzP6Q5BAzNs1YJoplKBJtDc7QmhC8k6yaySeAkE2Cldc2xxUplW8TiA6MiQRpY46Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6364
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

On Fri, Aug 22, 2025 at 08:59:23AM +0000, Aakash Deep Sarkar wrote:
> For Android GPU work period event we need to track the runtime
> on the GPU for each user id. This means we can have multiple
> xe files opened by different processes/threads belonging to
> the same user id. All these xe files need to be grouped together
> so that one can easily identify these while calculating the
> run time for the given user id.
> 
> Currently, the xe driver doesn't record the user id of the
> calling process. Also, all the xe files created using open
> call are clubbed together inside the xe device structure
> with no way to distinguish between them based on the user id
> of the calling process.

I thought I had already given this feedback, but I'm not sure if
I forgot or if I was just ignored. I'm sorry either way.

Android is not a justification. Please keep 'Android' mentions
and ralated 'Android' justifications in the cover letter ONLY!

The patch needs to make sense by itself. The patch needs to make
sense in the currently linux upstream.

This also means no --subject-prefix=ANDROID.

Please!

> 
> To remedy these limitations we are adding another layer of
> indirection between xe device and xe file. xe device will
> now have a list of xe users each with a given user id; and each
> xe user will have a list of xe files each of which is created
> by a process that is associated with this user id.
> 
> The lifetime of the xe user structure should be between when
> a process with a new user id has opened the xe device; and when
> the last xe file belonging to this user id is closed.
> 
> Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile  |  2 +
>  drivers/gpu/drm/xe/xe_user.c | 59 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_user.h | 81 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 142 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_user.c
>  create mode 100644 drivers/gpu/drm/xe/xe_user.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8e0c3412a757..89212fc7ef44 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -325,6 +325,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
>  
>  	xe-$(CONFIG_PCI_IOV) += xe_gt_sriov_pf_debugfs.o
>  
> +	xe-y += xe_user.o
> +
>  	xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  		i915-display/intel_display_debugfs.o \
>  		i915-display/intel_display_debugfs_params.o \
> diff --git a/drivers/gpu/drm/xe/xe_user.c b/drivers/gpu/drm/xe/xe_user.c
> new file mode 100644
> index 000000000000..8c285a68115a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_user.c
> @@ -0,0 +1,59 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <linux/slab.h>
> +
> +#include "xe_user.h"
> +
> +/**
> + * worker thread to emit gpu work period event for this xe user
> + * @work: work instance for this xe user
> + *
> + * Return: void
> + */
> +static inline void work_period_worker(struct work_struct *work)
> +{
> +	//TODO: Implement this worker
> +}
> +
> +/**
> + * xe_user_alloc() - Allocate xe user
> + * @void: No arg
> + *
> + * Allocate xe user struct to track activity on the gpu
> + * by the application. Call this API whenever a new app
> + * has opened xe device.
> + *
> + * Return: pointer to user struct or NULL if can't allocate
> + */
> +struct xe_user *xe_user_alloc(void)
> +{
> +	struct xe_user *user;
> +
> +	user = kzalloc(sizeof(*user), GFP_KERNEL);
> +	if (!user)
> +		return NULL;
> +
> +	kref_init(&user->refcount);
> +	mutex_init(&user->filelist_lock);
> +	INIT_LIST_HEAD(&user->filelist);
> +	//TODO: Add a hook into xe device
> +	INIT_WORK(&user->work, work_period_worker);
> +	return user;
> +}
> +
> +/**
> + * __xe_user_free() - Free user struct
> + * @kref: The reference
> + *
> + * Return: void
> + */
> +void __xe_user_free(struct kref *kref)
> +{
> +	struct xe_user *user =
> +		container_of(kref, struct xe_user, refcount);
> +
> +	kfree(user);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_user.h b/drivers/gpu/drm/xe/xe_user.h
> new file mode 100644
> index 000000000000..e52f66d3f3b0
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_user.h
> @@ -0,0 +1,81 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_USER_H_
> +#define _XE_USER_H_
> +
> +#include <linux/kref.h>
> +#include <linux/list.h>
> +#include <linux/workqueue.h>
> +
> +/**
> + * This is a per process/user id structure for a xe device
> + * client. It is allocated when a new process/app opens the
> + * xe device and destroyed when the last xe file belonging
> + * to this user id is destroyed.
> + */
> +struct xe_user {
> +	/**
> +	 * @refcount: reference count
> +	 */
> +	struct kref refcount;
> +
> +	/**
> +	 * @xe: pointer to the xe_device
> +	 */
> +	struct xe_device *xe;
> +
> +	/**
> +	 * @filelist_lock: lock protecting the filelist
> +	 */
> +	struct mutex filelist_lock;
> +
> +	/**
> +	 * @filelist: list of xe files belonging to this xe user
> +	 */
> +	struct list_head filelist;
> +
> +	/**
> +	 * @work: work to emit the gpu work period event for this
> +	 * xe user
> +	 */
> +	struct work_struct work;
> +
> +	/**
> +	 * @uid: user id for this xe_user
> +	 */
> +	u32 uid;
> +
> +	/**
> +	 * @active_duration_ns: sum total of xe_file.active_duration_ns
> +	 * for all xe files belonging to this xe user
> +	 */
> +	u64 active_duration_ns;
> +
> +	/**
> +	 * @last_timestamp_ns: timestamp in ns when we last emitted event
> +	 * for this xe user
> +	 */
> +	u64 last_timestamp_ns;
> +};
> +
> +struct xe_user *xe_user_alloc(void);
> +
> +static inline struct xe_user *
> +xe_user_get(struct xe_user *user)
> +{
> +	kref_get(&user->refcount);
> +	return user;
> +}
> +
> +void __xe_user_free(struct kref *kref);
> +
> +static inline void xe_user_put(struct xe_user *user)
> +{
> +	kref_put(&user->refcount, __xe_user_free);
> +}
> +
> +#endif // _XE_USER_H_
> +
> -- 
> 2.49.0
> 
