Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4668C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 14:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B1F10F40A;
	Tue, 30 Apr 2024 14:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gi3j5lBX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B55610F40A
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 14:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714488159; x=1746024159;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=APhdG/GURZKK58IAbqh904sOiAWto4I+M7HFUcgdL/E=;
 b=Gi3j5lBXzlzj5ESzjLC/0EXIxs00gkEyXc8FKAWiDcSCTtQTl6cXUt9G
 +8m4PPlqoum5I90LV6DN1MEWSlZD0ZBrAw60Mgz3Th3rsMNQxKI5eLqcY
 w5m9vuee8EekY4etqkUZBocDLkpnj2N24fW7/2UMEIPF3hNkoGArII23F
 /MYCJRjNN/lgpZ27U3iCgsukULWT9d3OfzM4Rw9C4Rjana0HngDVIdQU+
 50807nQQeiEvpMhC58Io7/WLUikMbzjUVsf3oqPQRhsGRqYcvQPlnkxU8
 alezyQfZOMi/vRSpJZydN06idmH27pjbmbA0114Qnax4cMM3UUbwIaqZU Q==;
X-CSE-ConnectionGUID: o/dTVN12T8uniIoQAte9XA==
X-CSE-MsgGUID: EDYr/NZ7S9mXo8yeL5MU0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="35583446"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="35583446"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 07:42:38 -0700
X-CSE-ConnectionGUID: dabN6dbWTTmhy7Ix+VSzsA==
X-CSE-MsgGUID: guDlkciIRp66W5XFBhHIYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="31195611"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Apr 2024 07:42:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 07:42:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 07:42:37 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 07:42:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eub/biv6HrN+ss58HKTRXYDonoGgDytyCYaZt3w2ef3iUez5y4GeqJWa/rn5q7cfwuSw+FdZe1664xWG4u4nRZtMigJfm8fvTTSLS7JBKRpYiNsrxP+LsuZ4Qw5TI1NDUgZSPwZqJRQyJDSD3vFQfP6yFB05AVItVycqD1COZI3zCdanqYQ/Z46FO5ynPV/PID7O/mc1oOlqcGyHwlE2sCs4j6LNCfr5mJFiWr08Vlzb4nibqDUeeaOCqVx5pPSoowaPb1lDdCs+zuXD/9bNqwdOnlYF9rKU/I3LgMj8xGmdCCex0o5O/FuPvkGq30+Wc8Kjp4mkFrnEB3gQNjRVQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBdPJ0GbH3Q7tlTXysaj2seHAZE98UVuXtTQ+lRoFn0=;
 b=IOxVQbCIldizYguawPPyMiJT4I0EP9rsD6GDs81zEySTfUaslwh3lFd2NFI68E5Q2LkN7SVo61qLUJjlFRycBlryQlGuODiI/pFSzvkU1m+H2f0T8vkczVWapgHncU5GvX1/ios7OqkJ84gUgTzuo1arMeMikwjlJQcKw2P3SD5S4TOYr/kzwTSlz6z/+BDZFWk8KnkGzeH01l7RCPFw6rXYVPbTffUF0xitFHNlfrnz1B6QYIcASBtKvdpkUetAcrIjv3heS6fcmwo880Cnh/PvX93wecBz8RLnDcFqHlUQ1eaaYozIlFfv7RA8PIL3+91HGFJ6jXg5n9pdi8HY+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7136.namprd11.prod.outlook.com (2603:10b6:930:60::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 14:42:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 14:42:34 +0000
Date: Tue, 30 Apr 2024 09:42:31 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2] drm/xe/xe2: Add workaround 14021402888
Message-ID: <4hwfcik2ipstr3ubip4f7irmotsqnnsqcjscnwsnt5zj3kfrps@nprslxk6piam>
References: <20240418111534.481568-1-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240418111534.481568-1-krishnaiah.bommu@intel.com>
X-ClientProxiedBy: MW4PR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:303:16d::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: 00359569-4799-415a-4008-08dc6923c5ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FEoZ0d/YPPkR9EmuWy3NKaDJ/Hy47xMNFR1NsewXXkxNgsGW/4ziHp7DTs3T?=
 =?us-ascii?Q?X3g4SILpPPTt8ZegRQp5uFgCt1LfOKl6kYKN9N0zvg4j+IsAFTttAYPGeFu+?=
 =?us-ascii?Q?6Y8wZOGxt+4vVKOT04oJXJdkrHbq50Lm03LRXwhGiG272gJV4hw/mMFcIuYe?=
 =?us-ascii?Q?06ay9UjBE9AqMd9m2bzV3U3WbVJ0U0KQ7qiMl12U0dlRDKlRyDUMXw9+AXqm?=
 =?us-ascii?Q?Xd9i75ysVLzmf5nYcwRzZP8fZq7xRpP3NAu8ltQvGDTbGc+xUbXoM21o/3Tw?=
 =?us-ascii?Q?Hc67Oh4kjoZ2Kqe5VoV8en6xrkq2MEDKIfp4BhjhKxSuoQJZc66ZuRsChRoa?=
 =?us-ascii?Q?g5+SCDTwCgx68Tn65vS6hlUbFgiM8edwocbaz/ZnnWFMUjbcMV/GlRUC7fTQ?=
 =?us-ascii?Q?zQzBDgCMGHI2DtF+EL3cc94B///UW/HYTasu97tDHZRSt/vo26+p50ML1QXI?=
 =?us-ascii?Q?d4ScOyaWBxpJTYshNCHtxl0hHOl7ACYRyKWpxh2Prft2j/a5ju0X+ET1dt+y?=
 =?us-ascii?Q?z88dVKCHDU/FnlCs+ZVwwnNWCPHj5rWwK7JOi99ZTkDiZr2KI5HVgt459FFk?=
 =?us-ascii?Q?SzQ7Q4namFPxr9IqdPjgmtwqRotZrsTFQpSWYRvhBz2W/vmEQW76ILkbh/RE?=
 =?us-ascii?Q?RKffZoswhfvo7rtAV3gjyHFD1421TkWgh11HIAa15hfgOpg7RYJhk+dcFpwM?=
 =?us-ascii?Q?JFM5OrGWptqRpHrZou1E+jnc9Scuqs5jtODxwCWcjGtd4poJHRSdVLlUy6u8?=
 =?us-ascii?Q?ZXHTYBMovcUEqWF3OsUFauPFXScn7iyYgiyqxOqWJVOzzC1XxXlc+dnT1p+K?=
 =?us-ascii?Q?TIDjt4chsUpdDESU0BurUzC/YBl77godRJzEhRB5vmEz9hElE2Oiva5IGLDv?=
 =?us-ascii?Q?FWFFLPD5p7F1xtV311WxFPJL4R2z1CVoXeThYTc3v4pSwkBoCyhCO/loJvOO?=
 =?us-ascii?Q?IN5BLsnEr9MS9SK1LAgLZbeI4xEq8X67RcmPIVXLd2fVcjJldMcP+almmY9M?=
 =?us-ascii?Q?3onclvdrCoL6rJuTFp0q1cY3uuO6BvJLarOQOFUnVSMzQCumNBY5ot98zNL+?=
 =?us-ascii?Q?NF04vcoe9UcsP3S2nJKbzGZUULN4YsHNrtXNhKICcRooe/40sEWgsMafmUM/?=
 =?us-ascii?Q?ozFpFz5ceY9/d8Ga+Qtvn9yDp67mOCtfzW992tfEOqI5zcS20z/ndwDn3F/0?=
 =?us-ascii?Q?2zDzsaPFH4rRwQAZv4m+vhzqqAiTnk/rAJ4Lq8gHL2GLC1IewDx2vL8rt8SN?=
 =?us-ascii?Q?j5tvmTgzoQEEIOkioXNQFiKl7oSpWXadqZcNUKVS/A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yc55Cx7DZr3v7vAZUBInUaDoo/Xt5usWjHTCPHPtLBmKmY5Zv3aKubhK0Lin?=
 =?us-ascii?Q?3tfUq8YUeYXMDzr9NAKkrmY+EmfCAKsysRKdcgPhxqEZMOmvb5kvez7AUg6j?=
 =?us-ascii?Q?Em5sIjhP9tO2KzYLojKzEq7yh/Kfk0BBcX+k6+vujuCuIHf+axA30SxD5Kkh?=
 =?us-ascii?Q?MXG3A6Nzz/Nf3eUEh9EEcTFKoAqd3jreqcgoiNSbCeV+GW/nmYAeGMyLIfU3?=
 =?us-ascii?Q?JQGFWZgkQl/qq/jhf/EEi0l3VWGgdNtPP0is5QeCJK0rQdJ1qQ1T/NEHwZwc?=
 =?us-ascii?Q?PSPlJDmZiFQ3Urz0BiLGdYY4a+hD5EhuEFCIU/LDePwHtUn0JlIXD7boUFkz?=
 =?us-ascii?Q?TmDNOOnDUQryzNampL95EsTMKA8VrmzKMbOhmke6v+GYcsG9qDJSNbKLUrTO?=
 =?us-ascii?Q?NRPk04YdXjKR+vGi5bobiP6Duvht6DCiuuxRn3ZXsXs7W31njP0qivTyLW3d?=
 =?us-ascii?Q?wnmioPfdWs2OY5HfQD+Rrc0F8Pb+Ubde3UaPVd+FsQ2w6OdaBf/Opp9jx5Kt?=
 =?us-ascii?Q?YNjCeFvssi429BDX2NDCUshJdEPeDyKAb30pJ9Po/RRIabz4YJQSxlbyVSLb?=
 =?us-ascii?Q?GgjL/q4UHVWP7V6Y857kz9m9o/YwhV4NO4QR4HbIOIOrl49rZNCepGrWS1RE?=
 =?us-ascii?Q?Dr8w1lL9u+Llo958dCVu0Q4wjoDZeyOprxGJfLCQ5sSuxIDM426Q25TxLwuZ?=
 =?us-ascii?Q?xtaJ9wf6u9fPHffmx2kGXOX/uHHYZne+1IzcE3ARilvODnV6nFc4m8ELOruW?=
 =?us-ascii?Q?Eek8nHrzTzaxxSvGy5rDHwEY1nbPMWcPPyPAYsC/4+hFzrKBJQwuJ/2Mo8bf?=
 =?us-ascii?Q?Bifj0/TMEgVrEGeXsvlViVSav5c/mJtcKYJFd/Fo9yO7exM26Dg7QvQ4Uu2k?=
 =?us-ascii?Q?nI/IYVuSNprfOC81bP3C7/S2DOnUIj+NzMmY3qQp1yA3TJb2jDi0YLPG4noD?=
 =?us-ascii?Q?tz4UF3k5L3gsK5rqugUMnazzBfScGwEsC2KnWk3IOejgvWpwRECHIAncDxD3?=
 =?us-ascii?Q?W/54FEA66SiHp65+m+CLBihWRkWCP5lW3J9V8DmG3ZWnOkP66K3wA+9LwcJN?=
 =?us-ascii?Q?N7vKbO4zkLwD0I9fm3re7h11aAyQnAy562fqEa1+tYaWhvIrhoQ5tmSUjvKy?=
 =?us-ascii?Q?/1rvc/FN2gasT99hd2/+yVi4fKjWHEzz4Yep5aye8XO/jpAsg14qYU87Q96t?=
 =?us-ascii?Q?dgGIevE0wOt+3BTgUsbfLVscLCudbV73fHTv0ke57zTd3Q8NlbBx+QS09QAJ?=
 =?us-ascii?Q?IjwhKAdy57pYKgSsZn8+3ST+Jz7cqtJKyxpXRvoaXU94LNSid9C8pVAr2/5O?=
 =?us-ascii?Q?0twyzhFrcDmVSj7tnNnmalZwYJtF4FYMllTlkSQzLgSjIrMVaDd0ixDTYqQm?=
 =?us-ascii?Q?DpUhmO1gPMjhpVDrcXRRnDBIeP2nod2rIa+Jv8SuUIF28mFADapf6Ird3U4v?=
 =?us-ascii?Q?Pb2n00wPYIOD44IPci/9qL7uABfziVPSgH1N6T2Unwo+XRKbQXMFA1WudQ6f?=
 =?us-ascii?Q?7z+TZlEidUEZLN9lCkui5qRkb2aDIjRJ0MJgr/Wtoz6jshIrUdh0En8ViUz1?=
 =?us-ascii?Q?kRM/tpXrDDz2C2MkNw/azhCUZV+VRcZbPsSLfkNYWKwBsFpxyONtUEf7PSiM?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00359569-4799-415a-4008-08dc6923c5ee
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 14:42:34.7577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MorLKrLbmab0IcFCcPG/iHT2Ft5iXQSXnfq+nw5qj9773fQVF4z3CMzl+pQ0dFSBxl8CUjM5JPKKVSDb0WwSHovfOvid1zWvVvkz7Eb2btI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7136
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

On Thu, Apr 18, 2024 at 04:45:34PM GMT, Bommu Krishnaiah wrote:
>This workaround applies to Graphics 20.01 as RCS engine workaround
>
>Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
> drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
> 2 files changed, 5 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index 94445810ccc9..23c302af4cd5 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -350,6 +350,7 @@
>
> #define HALF_SLICE_CHICKEN7				XE_REG_MCR(0xe194, XE_REG_OPTION_MASKED)
> #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
>+#define   CLEAR_OPTIMIZATION_DISABLE			REG_BIT(6)
>
> #define CACHE_MODE_SS				XE_REG_MCR(0xe420, XE_REG_OPTION_MASKED)
> #define   DISABLE_ECC				REG_BIT(5)
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index 632bd9066f8d..31e140968f4a 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -534,6 +534,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> 		       FUNC(xe_rtp_match_first_render_or_compute)),
> 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, WR_REQ_CHAINING_DIS))
> 	},
>+	{ XE_RTP_NAME("14021402888"),
>+	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),

we don't have BMG in CI so we have to be cautious on applying WAs. We
had cases that we merged it just to realize the WA was not really
working. Did you check the WA is applying correctly?

Lucas De Marchi

>+	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
>+	},
>
> 	/* Xe2_HPM */
>
>-- 
>2.25.1
>
