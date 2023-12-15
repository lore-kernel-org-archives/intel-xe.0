Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CC5C4167B
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 21:48:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC7F10E036;
	Fri, 15 Dec 2023 21:48:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10E510E036
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 21:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702676890; x=1734212890;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZmZdm6qgXu73k/wrJm0A6jnWjL8xfEwVCFOK3od0Fv4=;
 b=eCx5UEYUx37OYiRSWL3c7cVbHl/mk1bHs4mvuaKjnF2ltFauPdpXPKg+
 FgsjHm2IGZdVYP8oe1yo/U7sScSFY4K+AhXtIslOKBWOojGJRXUqzoehu
 yM0CV/1D8+WDhOp4HEuHITj2sltYHModgm9zMefmtLXRZW2ix/CL1lh6e
 B0/Sxecr4v5gbVtZ0cVcIhr23X4xU/T88AFk+ml2JHtFVwY1W5GmUsaY9
 /30TBj25c5xqmQbu8XYc06uZIaQF12HQL9xGeHMYUQeIJFssNZlEKF97p
 S4jiCYq3UdXvCnJjMqYETSTQjwrbgjPb5a4FkKrO8pFm5gpvMn9mEES45 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="481518623"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="481518623"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 13:48:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="22989277"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 13:48:10 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 13:48:09 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 13:48:09 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 13:48:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hc55V3yJp0dagRNHYM5cZ8mTwutDyYk7NE0f9ExLX1Ofrno4DxsfEAscFVlxluxfL3XPHw8ERWwwhuXS1k38SojFUL6hIuYRnuyRZo75gzpdqPoOSU9Iizj/Cgh9+lKxNjkc2+EzL8SZBL3G3vZ+vFW6qLwdMlABh7RZqDw25dkCzfNz298o7e9rzErhd0wKRzl2zdmSeE3lsK6MJB0DMtEdLjijQDWt26bNbFnBq96urp1KePW/RupqWDQrloEGXG7jwnxXj5VLlqwfe1L6lGjvvPMuiKdw4bfiaPvdslW5+fADMzIZ6xOwCrInoB7qA/tCVqfoAxlz8gDm/jm59w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSF6ViBMpp+OKgNLBgxGhz6UrO3BQep0+1l5cXmtOxo=;
 b=f4Xu/upT7zde2IG8PtzqP3RLf9jbgK7gZoIbI/7Na37NQwUoQwmhenJCDSFsuBZgKiPL4buW1BiZVucL5We7AtTQ8MsTa2IATZTc+cI0MT5r9ZUgRkox9ESNmNBpBHpu/tMc/LY6Bq9NJOzWmaY+jFZ4n3v3iWFlkdYlAnh5oWfWChP/y46f7ZpUdKrq59vm/bkUJEia3OoXO3Y9C2q19ANDKR5/W9sZPq3bvUM4iIM3pRPpWy/+n+DBjCPzeGyDPvcwl3XHp63ME2mRB51GnDvU0sDzF56XCQB8gZiRNw/2mGhYagrYwsI+649GC8HlCddPzL0BSGtHpu7ODNhQhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW5PR11MB5762.namprd11.prod.outlook.com (2603:10b6:303:196::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31; Fri, 15 Dec
 2023 21:48:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 21:48:07 +0000
Date: Fri, 15 Dec 2023 15:48:05 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 01/10] drm/xe: Add GT oriented drm_printers
Message-ID: <ju5f2cfudq2ovx7xygdvq4cabx7dgworrccnzdtytbv5eae5wp@woyuilbhochb>
References: <20231215162502.1879-1-michal.wajdeczko@intel.com>
 <20231215162502.1879-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231215162502.1879-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::39) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW5PR11MB5762:EE_
X-MS-Office365-Filtering-Correlation-Id: bacea9af-83e3-44c8-c094-08dbfdb785d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qh8vEw2uVWKhkGfzAjo/aqbyEIIO4NJ39NQB3Cp+YKSOC20I+QhDEUTyHY3x8nyiNZTx1LgJwCeYFTieEq062Cr8LsulAyA9GTFfR5VpoFTrUPb+3wy0koxnnAP9B3iovY6b6XK7j+tCeaA8ia7jJNYxAhvjheBaaTMgFDIdn9p1T9HWbLqv3ac7VyuEGFWtm+GhELnp1ow+KkdNaYmkQbZ17ggqIFaoP/oJ61TnYJwfPdeu7pe2ZSoC/iv7bL3+WQs+Mgl0odfjzyy4VHthSka7qtAmxrxnZ6MoIBi7oNCicfRFLc9JYXl7vOqRXE4E6BSr4Edm/5bLl9uIkWFc0KtMQ36Emx2Ly8sG1k0taflP2R16XHvJ//BxAyZ0DUBz9XmXtIfXFQMve5gAN/KPJiBnmFzv12Sm8jgrt8O0fbFS19+kyjQ5Fgn0Xgfu6B7mt6Vdy4OBwNPAKmGtjHBi4CZ1fdGMHzkPN9Xtc0Sqr9lPtCAnXmJFhJfbjdz9EVZok2QhqSCPfro6bcPlryF66Gb6YTdtxgtdciezuu0u5V+HbAmN92iZcAgIhyvMTobYrjo3WsMfEx8fnhgHI8BVJM9gSztwB76OtZjI9QvU/Kk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(376002)(39860400002)(366004)(346002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(66476007)(66556008)(66946007)(4326008)(8936002)(6862004)(8676002)(316002)(54906003)(6636002)(478600001)(6486002)(41300700001)(5660300002)(33716001)(2906002)(86362001)(107886003)(38100700002)(26005)(82960400001)(6512007)(9686003)(6506007)(27256008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AfETzKDFYj8dS0A1cMlUUpINkJ9NsR0A2ESJIYQDM4PrnIzodQQCauySHzvQ?=
 =?us-ascii?Q?9LVuhzPFImzrIjUMhEbWaWgK35nU2i793mCw7WubENQ9J8qo1Q4zz+kjXcgI?=
 =?us-ascii?Q?VoWTQcyTymMpA6gC55pPlRJfUzEza97PE44rdoNoH1/cjFPb9uNKLWTIDOBE?=
 =?us-ascii?Q?mzkRERKsxR+fAQWs7zXIluZFj1mqCdSIBefcVYXzMMU6XxZTvq9BqxL6wisA?=
 =?us-ascii?Q?vcKqRryNg/Lt+YNDWTLK8pq+FJIO0U1wu7EywC/G2sDZNO+utkRjEM0sf+Ga?=
 =?us-ascii?Q?RATIYrBqcVpK9iquiKTQX2pPrlDc1z+ErR69C3oZCJZBAU6DJ9gmFPQEmIsH?=
 =?us-ascii?Q?APPClYswoiPKEwhnfAiKYmYRDkor6dmRBgmMLNjGydMWQftaSKR5NkYOeVZi?=
 =?us-ascii?Q?/LcOktK0WkMaGoXRoS6hv0MNVl18wGoKHCvjlf5sjwGtAS8NOIriFgX7fWTb?=
 =?us-ascii?Q?gBhKYgr8ILReAe15ZSXIvCIrYpCMzbeo4shENPjn4mzsyV2Ddl555kHTuksx?=
 =?us-ascii?Q?61EHR5u2FywmgGpi5GC1QV0xPCHhN/5uH8Y3xqxDrA28CZWmTdzi3HTeds6x?=
 =?us-ascii?Q?591rKXFsVY5rTNDDUBK4sN35FtYZLM+EykwVAW68WJOIPE+TG0pEtxRwPcpc?=
 =?us-ascii?Q?10C+dBjynBmBuuMPaLDLYCvpz8vJh8CkZPwEmfgKbZ0UaUMlM97vs4ENsnYn?=
 =?us-ascii?Q?Jz9sEdlV4gANcFiZXAGK75MR541sUbylrjPOwAbibbKuLzoZ2riQYXaoJck9?=
 =?us-ascii?Q?Kw0AqX5QQPRPBRdEF7crCa1jmP34qwvsHFzjIB3Zf+enyKkOQw5GWxH4gp8e?=
 =?us-ascii?Q?KH2jWqss558qoxErq6Vx9ifX0xSQLJINCr/PaTnwVnPUJIGbEHRtRNgGjOZH?=
 =?us-ascii?Q?co5TNS+KXzZ9e4ApkoGNgxkB0YTjiH3yGz7LlfgMRw70lwtc2tJEvPZnfA64?=
 =?us-ascii?Q?wSzU+7zsk6uAM5owEfU6ORHQw6B7qJD9cFarqFZBLE6fJM3WZ9XXTjK7VnFF?=
 =?us-ascii?Q?RhJv3YZlBlqgH0wXeGcS1BTQXvMqT3Q6qnZ+yavK4ZePUzrETkjEobvLzrUt?=
 =?us-ascii?Q?/gr0fFT3GdTRSg6LeVIojTxU0qk6uoQDGmDzgBUXWiAhOzop5LC66eK6M6z4?=
 =?us-ascii?Q?GetXE4qPR1H2A7LzM40VAdxDJ0iymrk5Vkp69LPzSyMtFXAAQ9/KvBeCbZly?=
 =?us-ascii?Q?XfiFzMlASEqYmLeMl69VXHAllbLiwj//oI/UF5sZw1ChteRLJjeZ/ge6Sd3M?=
 =?us-ascii?Q?kPWJyPgPppsBU6p4iB9VTZRu1iRaZIhTuMj96aMBHwFMAZG0HgXT8mnWA7fO?=
 =?us-ascii?Q?2wBff46R319g8iVprvmTuojH5j457nKlqvhlHds9jvlo3NA6UZ0OyNzaJzEg?=
 =?us-ascii?Q?UxZD6mjMslmCOcXy/ofQ0fUl1v/9B487+ODLlHkG9N/uYn3vgnqekvBuMzAc?=
 =?us-ascii?Q?b+GbUnI9lMsOvM/CiHDYtOFrungP9Lue8/TrXU5mgpsKIEmt5s/4HC+5Afdl?=
 =?us-ascii?Q?4xRD1q9Wqk8wJc9moSuh2+6xRBDFYAZEyIICrgC6K9FQ8vmNSJz0keMc/qgA?=
 =?us-ascii?Q?LjyineB/D83JBFkfK8eCIPOb83c08ZEsrNarVA4VKy6WztzD7XbU+P5IU4d7?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bacea9af-83e3-44c8-c094-08dbfdb785d1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 21:48:07.0697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWSyiPopmwfUX01WvJKyFmvZOziiHydQeq/Rn9LJS53Hv8ukoairpZbPmtQIkO03dznNAT3+8l6KU25QuzM+ARhRN8utX/Eb3o+bjWFwemk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5762
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 05:24:53PM +0100, Michal Wajdeczko wrote:
>Instead of using generic drm_err_printer() that just adds static
>prefix, or drm_info_printer() that outputs only device name, add
>new helpers that create dedicated drm_printers that use our GT
>oriented xe_gt_err() and xe_gt_info() functions.
>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_printk.h | 44 +++++++++++++++++++++++++++++++
> 1 file changed, 44 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
>index 5991bcadd47e..195f45b10c41 100644
>--- a/drivers/gpu/drm/xe/xe_gt_printk.h
>+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
>@@ -43,4 +43,48 @@
> #define xe_gt_WARN_ON_ONCE(_gt, _condition) \
> 	xe_gt_WARN_ONCE((_gt), _condition, "%s(%s)", "gt_WARN_ON_ONCE", __stringify(_condition))
>
>+static inline void __drm_printfn_xe_gt_err(struct drm_printer *p, struct va_format *vaf)

we try to follow the header name, __drm_printfn here doesn't look good.

	$ git grep _printfn -- drivers/gpu/drm/
	drivers/gpu/drm/drm_print.c:void __drm_printfn_coredump(struct drm_printer *p, struct va_format *vaf)
	drivers/gpu/drm/drm_print.c:EXPORT_SYMBOL(__drm_printfn_coredump);
	drivers/gpu/drm/drm_print.c:void __drm_printfn_seq_file(struct drm_printer *p, struct va_format *vaf)
	drivers/gpu/drm/drm_print.c:EXPORT_SYMBOL(__drm_printfn_seq_file);
	drivers/gpu/drm/drm_print.c:void __drm_printfn_info(struct drm_printer *p, struct va_format *vaf)
	drivers/gpu/drm/drm_print.c:EXPORT_SYMBOL(__drm_printfn_info);
	drivers/gpu/drm/drm_print.c:void __drm_printfn_debug(struct drm_printer *p, struct va_format *vaf)
	drivers/gpu/drm/drm_print.c:EXPORT_SYMBOL(__drm_printfn_debug);
	drivers/gpu/drm/drm_print.c:void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf)
	drivers/gpu/drm/drm_print.c:EXPORT_SYMBOL(__drm_printfn_err);
	drivers/gpu/drm/i915/i915_gpu_error.c:static void __i915_printfn_error(struct drm_printer *p, struct va_format *vaf)
	drivers/gpu/drm/i915/i915_gpu_error.c:          .printfn = __i915_printfn_error,

and the only user outside the drm helpers is i915, that does __i915_printfn_error()

let's name this __xe_gt_printfn_err()?


>+{
>+	struct xe_gt *gt = p->arg;
>+
>+	xe_gt_err(gt, "%pV", vaf);
>+}
>+
>+static inline void __drm_printfn_xe_gt_info(struct drm_printer *p, struct va_format *vaf)

ditto.

other than that, lgtm.

	
	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+{
>+	struct xe_gt *gt = p->arg;
>+
>+	xe_gt_info(gt, "%pV", vaf);
>+}
>+
>+/**
>+ * xe_gt_err_printer - Construct a &drm_printer that outputs to xe_gt_err()
>+ * @gt: the &xe_gt pointer to use in xe_gt_err()
>+ *
>+ * Return: The &drm_printer object.
>+ */
>+static inline struct drm_printer xe_gt_err_printer(struct xe_gt *gt)
>+{
>+	struct drm_printer p = {
>+		.printfn = __drm_printfn_xe_gt_err,
>+		.arg = gt,
>+	};
>+	return p;
>+}
>+
>+/**
>+ * xe_gt_info_printer - Construct a &drm_printer that outputs to xe_gt_info()
>+ * @gt: the &xe_gt pointer to use in xe_gt_info()
>+ *
>+ * Return: The &drm_printer object.
>+ */
>+static inline struct drm_printer xe_gt_info_printer(struct xe_gt *gt)
>+{
>+	struct drm_printer p = {
>+		.printfn = __drm_printfn_xe_gt_info,
>+		.arg = gt,
>+	};
>+	return p;
>+}
>+
> #endif
>-- 
>2.25.1
>
