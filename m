Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B559C7EE29
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 22:41:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F8910E784;
	Thu, 25 May 2023 22:41:54 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122E510E784
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 22:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685054512; x=1716590512;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fHsbefUm1f70DPe6V6M1Ttoj1JwMm7BBR6xXgnUUc/s=;
 b=kn9eFbsgB/hDbQutO0Jthzx2+wrBpbHQCmEvL15LnVwcjFapdEPrq+CB
 dBMNzO1M3bXjI62NNP6A9Ckr0CTXnKCV2xlg1n76BZtlM2A14By4oOnzk
 WIL1vW2nee/QScWDjbAUbul7fEVPbiiATz1gOIsJ+MSplAcVKWzlcKSxO
 TFcVvNLzxP8xdxN0iq8Pj1/Xw+OnGADQY5k99U874CxYJb6q08i+yjC+o
 tatz48Ldtw4KlIuSVzNjPRlj5Ek6o6cCWrqWl0ivmUKr0EdrWJoWxMrZ2
 x8gt0ZfPaOw3hPmPxpWscePqsvwxEpXTcdlHEFgJCgzoezyRXDpw+xjJ6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="343541921"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="343541921"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 15:41:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="737986164"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="737986164"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 25 May 2023 15:41:51 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 15:41:51 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 15:41:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 15:41:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 15:41:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g43C2G05P60nPd+xY9IM5Am/dezJPt8bk9CZCK04Sp02lasBHMKJOBacl2+F6SIWRXqBqPfwH9GO3KtHD7APSrZpljkIqodtYiQ7TNCGBr7AIayfVq5/Y0adGKliLiJG/8Nux0bHEquqRFcdbx+RogtaS7scm3m3bwWWRiiP4UI5qRLKmX0LU65o3hEW4d99M0EeJUZHyVR1ubrHAyc5jfWGDD1Lj/aLFFqnW5wd8FeKk+NiA9e0cAvBJyIbUuDw6YJw3Y1wT3Vl9EuWjyErINoiJkpOqm0+deE/cL7HDd23PZyjFafeXJBdiKyCa5cETfMR7IhmkWEfvkyP1V9u1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqaYOL5SDpnuuurkncT1X0dtBOjv6CCF6Nd2qIkOM+I=;
 b=GZXjG1oXfcSzwONUa3rRFyA4eVFg09/lH9FOibS0HHUXdjW/NZcqC1YB0SsQ2ZhEUEwH7zQmcn8gi833W5AOmNn4+hXh7FRxL9obYIkVZ/6TkM5VDe60b+kJ7QehB3i0RIv2OFzlO8AGltqep1CBoCbLkZ2xDuj4spq4SFiOjwGBl/8pr7lP4uErGekBxBUraMwkCtpOgbSCq/Sl8niyaD2HFlUWSzgqML5wKA3Kgbydqhob1G/AML2bl3XfS5pTY2/3959QehuNpah8XqdEbidy/OZvniP1zcUAqIynYFxb4PzIWYc6DTUP/IDIY2vdDkwrrNYwLzMOm/QhYTS3Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MN2PR11MB4599.namprd11.prod.outlook.com (2603:10b6:208:26d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 22:41:47 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 22:41:47 +0000
Date: Thu, 25 May 2023 15:41:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230525224144.GY10045@mdroper-desk1.amr.corp.intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
 <20230525213407.3907094-12-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230525213407.3907094-12-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR17CA0067.namprd17.prod.outlook.com
 (2603:10b6:a03:167::44) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MN2PR11MB4599:EE_
X-MS-Office365-Filtering-Correlation-Id: f5b85e3e-4d66-4fad-c363-08db5d7138f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HKIYCI3WMB3pX+6/C6S2JxWYQEwpY46XcArD1m5t3AD9oHQ3pPznSNDZP4BJhZuX6d/DNUO0y/JFcnHD0Qn7goeep0FExzb1OkiH+o/K0n+7z9lH6fH4+2XvhDtKgZECnFINAKO67/q5SSh2S+8w7gZf5WY69OxhlWzUgMwCAmpv/Jf1AFnwYo8uGo/13jb4QQvIwt1oeix5xdybI9ZgG/Ld8DTF+pV5jC6UjaU4v7WikqB1y6G12egb6I68yEmFaCeZdhD61PkALTRPS4cjj09NE7CQMOx0E3YZdAV5pWowDMb5mz1ju4T81VHiHxCrBeSbcOChP4gxdZiRq2+8oBJrHE5bCt4/gSut1sHR62QUXwGEkkcVNrUGhZjY4+NpllZi7vqygevJSQ/5LbZa3zAb2eucuQn6mGkBs8oIgSeM5rI25Mty7veL5NiuPfoyDG8HLQcTc6tXAEy7h87dd0SNtJn46WatboAN0d5jLrJIHIjyhWHpxj2RzhCdPzTzFjUhfMypyHPUygOGxLelvFwLbb6XH1KE770M1iLy0oP2p332I/rrbkMXzWLGTLxa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(136003)(346002)(366004)(376002)(451199021)(6486002)(6666004)(478600001)(83380400001)(33656002)(186003)(26005)(6512007)(1076003)(38100700002)(82960400001)(86362001)(6506007)(41300700001)(6636002)(316002)(66946007)(66476007)(4326008)(66556008)(2906002)(5660300002)(6862004)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qXxYQUr2jqy2wWL5P5ZHi6W7J2MF6e1Milh+m0y99Sw1QV6Lyc3EVuiLFxqp?=
 =?us-ascii?Q?iNpksrDC0DUWsvphPXuJe8lkdRCD2C+75DHyM3YcRjsEZ6oO3IF0SZBbrcWZ?=
 =?us-ascii?Q?wJr2L65f+aQ73rM96XNjZGrftNVhYbVWhm8iI3MjLlx7HYS4/UWEo9xV+ArN?=
 =?us-ascii?Q?fkdlblNElaUyusHnHKjFG/yfuvujD1qwypcwYFQu+oOdG2zf5c23x17h1cEq?=
 =?us-ascii?Q?avUVTKXGdXBHmHVuO4mSBycL7l9+77YnV2bXfMsYHSeoGIP4oYnbp43caS5X?=
 =?us-ascii?Q?GJ3vqefHk0M8PDVvZ/Pqx9r3QV/sJl+YnYT3/vSLyzZDGzOCXIdZCNFmeQtm?=
 =?us-ascii?Q?8WI7N9oMdaO2IqCsAKQSRct2l8/MVHiZLODgU75+7UOH4rr928R57O4ceniS?=
 =?us-ascii?Q?G4Re7X9Ry/HxQBk+jnI0SqwAV7fWOOGHdJB+uYRaDnAnsm3N3ljpGEZFlfwi?=
 =?us-ascii?Q?1ggI1V8bYt0ZzBfwZPNGFoG+aJ9T1ZHfT3lzmx8QySE8N31C3ZiXeTaHu5yu?=
 =?us-ascii?Q?+lC7+oWkG60LpTuaO70p8en+4fiRAMMhZtjzHMAJpfozpjRn0yhHlaMS7cGA?=
 =?us-ascii?Q?YsdGnNvN18Zyc2u+sGZn5qHfYybmkJ8Xx5KBPZcrnG+P876dHlQzH6fEc8gd?=
 =?us-ascii?Q?lOIEXmn2MkDSjvnCxonjJcKo8W59xVv0BZEsZuxT7Vkc2MLdx8n7UmmJV+V/?=
 =?us-ascii?Q?gqjL7sys21aptEjYZyfV9xHbb626zcqxkjRY/sZv48OyqhDx2feRbeJtM4s+?=
 =?us-ascii?Q?nTNAU2Up8xk2mip9d2iJuyMV1jzjweaL6wbnnR/j8+LIJ2tR+SVn0iOeAaaI?=
 =?us-ascii?Q?rM2Y6bU3TjHZkeH7UU6TRd16snbNfZGIEAZ3ETg0g/X8LT1LnBCsSY11rTFF?=
 =?us-ascii?Q?INV25J5lL7ECB1PHwippdBoTm4adiLlBVFcbrbhedVmjPOtzF7iaVnE5KOWD?=
 =?us-ascii?Q?IFEYaYV6u5xgPapR3Wn+UfeMDWRHWj0hl2IDHc0qMCS/cb2+neREioHjw8+h?=
 =?us-ascii?Q?U+KojzxdQokiOvWUQZzZHq1dS+Ma669eHcKDpF85uh373JC2jychgIFyngk/?=
 =?us-ascii?Q?3mTbTyxPpGo3s1KErJA80c/lMb6YG12ULZqK4DJQQXXdQ1G13Dm7gVe5jLtX?=
 =?us-ascii?Q?MZzbG4d77CQRS0CVdGH1d28krSA93UOC62L7wI8qnEg/xruoTRpQgtPC+gjj?=
 =?us-ascii?Q?DSqnqYxsiIU/ibyCDqJcZTtzftN9KZPb8ZnEnZfr+peOB1nFeDT2K47JxJZ4?=
 =?us-ascii?Q?e4uLWzEBF5CUsQNNO4DBt4fMIT3XjzZq+eCdNS3cSM6+R6N+G8WXVd8GAKcm?=
 =?us-ascii?Q?M8RjeTNjdTrmbO9l93kY43BkvZIi/w6Hv6dfnSNtutxzLrycMf6WxSsSm519?=
 =?us-ascii?Q?J2J5k7Pg9D3K5nxbf10ZKT808zDejNiq6Y2PgnPDl59iY1hZFM02kCQDRzXQ?=
 =?us-ascii?Q?JpK8tlz9WQlLjwOs0/KMJiUd5HCXh6B032tIRb0c/w4h43VX8MOqRIB5pprb?=
 =?us-ascii?Q?NPmgowlhAeb+mOxseovflh8EWIs7lhJDKMBWeIiUo22C62wIFXj0WINsGDAO?=
 =?us-ascii?Q?pRoJ6vXzOgZjbB65mtWBimjzfcIJfgDJKd7PELl9ldjdY1Jaqwm5J1hclcfk?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b85e3e-4d66-4fad-c363-08db5d7138f7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 22:41:47.6818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Olk60Q5prOOx2IdIFRIZUuXGtx890krcaKNukXaq4den+NPNiIvpJqO9keMU2G0POGEedY+I6XKH2kX34leYxUvimpRVG+Z/AGoKWED8Nq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4599
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 11/21] drm/xe: Include build directory
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

On Thu, May 25, 2023 at 02:33:57PM -0700, Lucas De Marchi wrote:
> When doing out-of-tree builds with O= or KBUILD_OUTPUT=, it's important
> to also add the directory where the target is saved. Otherwise any file
> generated by the build system may not be available for other targets
> depending on it.
> 
> The $(obj) is added automatically when building the entire kernel,
> but it's not added when M=drivers/gpu/drm/xe is added.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index cd1614b68734..e058b1dda6e6 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -24,7 +24,7 @@ subdir-ccflags-y += $(call cc-disable-warning, initializer-overrides)
>  subdir-ccflags-y += $(call cc-disable-warning, frame-address)
>  subdir-ccflags-$(CONFIG_DRM_XE_WERROR) += -Werror
>  
> -subdir-ccflags-y += -I$(srctree)/$(src)
> +subdir-ccflags-y += -I$(obj) -I$(srctree)/$(src)
>  
>  # Please keep these build lists sorted!
>  
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
