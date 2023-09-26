Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB2FE7F143
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 22:45:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D2610E44B;
	Tue, 26 Sep 2023 22:45:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8EB10E386;
 Tue, 26 Sep 2023 22:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695768343; x=1727304343;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=L6pRP6bXT+LGH9OlSnS+Hg0SWzYfHa55SE2QjDHG9FQ=;
 b=eK5m+Qx6QVS2Aq+bMRQB9qZ5F0JgWlBVwaojSLwcqPCwLhIYb3JmaAAs
 mkiLWAQ3MdpxvatJhditWoGqeR8peC4nz+8uWJfLYaN60sCnT/JxJ0kjb
 KBW0uH3Ivq3CcShjtquT+oHN9iiRBakRYRMlhnavBM+46TgCiZiD1Okg8
 HNq8lx/aKjP7ZScnoe8aRo++T/+neFo31crNxMD8qNKs+CF9XPC8yuejq
 z3u3PG0rCQjlDSsQpRbg2pOdI/sL5lGVzYJ0J822WDp1hwpYnGJdpXSnf
 LnRSdGZcuIkzHj6aw1bqcmLSByDFszZKidNHeCvm+7d71tXB2KepR35ML g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="378964141"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="378964141"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 15:45:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="839187621"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="839187621"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 15:45:42 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 15:45:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 15:45:41 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 15:45:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UistHQYuzVpUWEiz1+e2I9NIbqNdfMf+l/tszQT41eOebkDZICjzgpdXMcC78xIdJGashbqDzzPx3yrCtAm+6PGOoPNHgflx/FbSS1309QX9XFEe4AABMsx/urGFrkioUT7SYykXGg8vBANCu1MtymJ8uuf8tzkGJIxhVwur3Ksyl8lRl8/1otKw8jJ1jeUxvulwyxdDxvpUTB4l2OXfxOan6HX2TbikxuqSSRWPeBpE15aCFEf2P+JJp2v1p4Nwv8jSiHK8KMiD7aMGNODq0QpeHe/S1QKYSjy374vLTHJypa2NLcN5S3SHVoIDjBHC0hT/g6Atfm3wRKn9/M9CYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRG4Q6KmQkuIT1QMYWLz+h/Kwf+n7IPl46M6vXjp9Yc=;
 b=UmqWyDT3/XRZ16ovx/04PEXKPeVRCJJDMJwb8q6LD4lKhTU6yx8FfdjIc3Ygr4hVUpJXq+mvgaGasLyh9W5IFh3YZltEHk/XeEZ2KFIIFuNayjIy7TizWKVdgr0B9J52QnSfrayccECVDtwIQGilyaCnpWWjfHgEWujNVmIU4K6wFTeeM/MBm1Yt5sYHUA9EU1NkZCO/x8guyyQjsQqAgcNHT+ZTWcAvb0HwAfwK5ayT4gn4CLRTm4y/KtG2G6oxU/JjSUfX574wO/TnFCuGNq052q13eHW50/y+Ms0coKSjMCrS/hTBvkhAL72WfZROP5AM/ybOb7SFZvsSTuAH4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB5939.namprd11.prod.outlook.com (2603:10b6:a03:42e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 26 Sep
 2023 22:45:40 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Tue, 26 Sep 2023
 22:45:39 +0000
Date: Tue, 26 Sep 2023 15:45:36 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230926224536.GP2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-10-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230915132346.1845909-10-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0380.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::25) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB5939:EE_
X-MS-Office365-Filtering-Correlation-Id: b965d2de-7d23-431c-b67a-08dbbee24e96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KCAXAqeq7+HloVSQxFh3rmrMhwizBcp+zn0541NxvkBxAZ+i9x1YvCp02lEv7Wl0kfecIqQTDGSq6NSuk+9dHduxhcaWWhEroLbR5M5YCtg6+R6+iEbVPn5AtCkb6pi9ghNMbzTLiholhpR2XBJk2YriKyfDiD4CAE+TRyRLai1tTPRj9Fw0gqfYx9ZMRCnFjUdnsBoXGxPJbvXCu1Pxp08UzdsP0Sv7CbPZFg5xFEKSMdECT1GzEW1Cx3BeeYTefuUJBKQFLK8KUSgfoeAMoxojkPUbxunNYnfB4/+8xs/6Ry4CmJozZZDVVWq4jQqxxx9ZnoFidxZ4GGYd7aU7TZaB1yUsS0cvq1Oc+ZAoz+0Q7IQaZmUH9cqA2G2mtkI093VdL83wNtoiEO6Tvch+kx9o6K3hAr5qQQOayYdgA03onhbauT2ZpWR1tDI4Y+RsIb4D+A/79/hKnEvkO4hYZ8JabQ76IHxq36aY7Hr7fzRdBja4VliJ/qJ9qh9SbFe7MEONa2HzQw6+LUXwkFixwEssK2TybnBgTN15nlBPxUnJ8xHw6X3aAgR/rUsS1j7E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(366004)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(6666004)(6506007)(6486002)(478600001)(5660300002)(83380400001)(316002)(66899024)(6636002)(33656002)(1076003)(82960400001)(6512007)(66946007)(86362001)(26005)(8936002)(66476007)(2906002)(4326008)(8676002)(66556008)(41300700001)(450100002)(38100700002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gPFifHlEBzg84iVVeP4SUp2/KmxEpucm9qgLyQXSXN3fHDUZzVsSQgdepyjQ?=
 =?us-ascii?Q?wcrBwppff0rT5293YctdhYMjKigiXVNFRxJEF/XIXoKJYZ8irAl5pkgwEPOs?=
 =?us-ascii?Q?Tpcm1h3QgkK7WzpsttixEsxJhKwtG85werM4VG1skSSfgCUzj1Wk7ERpw6ec?=
 =?us-ascii?Q?IEG1hI2bPPwBp2GIGxGYRhUPkWE1j8Bv0zkKyH7kTx593z0NKc63eHt/1IKe?=
 =?us-ascii?Q?fGOaPWp4lrY0x3g+wY5BmxSCY+jny8cxcyf5lpc1Ewu7JiIrPrcMrEzh/6Gv?=
 =?us-ascii?Q?udNbHCKFp9vJnasBM55XMt3HJlFBDu9dhP9sK1G/ewxRlvBc1SWO7XBnlCqb?=
 =?us-ascii?Q?WHVDmtXCWZftm+UQG8q3pVhwJEMs8Mugk6C+RTmZLeH5vee155XUSnn4Aep5?=
 =?us-ascii?Q?TUCKhEnz7VXZvhU9liy34jJ/tZSuvGJeLBTfEIhliTp9/cqGvh2OlOkbjms6?=
 =?us-ascii?Q?lfVWCDn73ZrWhqvyXpGnS+LOfppzlpUqSOxnvR0ZizbxX6adlPyxd+Z1D/1M?=
 =?us-ascii?Q?SFLYg/5rFNKst1gYAG8g+506otppCJncRE+IaSkAAl7Rji9Q8RfjMLnFJEK1?=
 =?us-ascii?Q?qI5MX10SnjzbgB9fskHhOgUX3ni6lw/KZTEUzIu+cQEgUTopXWQsn+ZzDJ2/?=
 =?us-ascii?Q?G7qXs5q0UfR5ejeISVxKII1FpBGWE3iE3wd/vXgwpnqHG+fdEn0DkILLDw07?=
 =?us-ascii?Q?hwLVHhCIuuDfc4/7j/cLLYYwO3Ghzc8ZEnEDUAERcIb4YzeILtXARayIkpLx?=
 =?us-ascii?Q?X+wcdbUUlwaCwno995P4HCzhCWDoUcxA5fW/G9UYzATfrCO5HNq8gQnHHRkT?=
 =?us-ascii?Q?s7iv+BMnEEjwl1cFpwfoLX7J1tMcPOEnL7qbvPswfmke650D3A/PQna9XMYf?=
 =?us-ascii?Q?moc4mIk2BzItWLT25OQd9tJlD8kfzXQsSqi1lJtbsZernbEjDAwMYQ61bHHY?=
 =?us-ascii?Q?ETvH4mJSiu3xg3bgXPNYph+f3zBS3MIvKOq1SRBAQ6IqwIQ1bgDl2ySTVvoB?=
 =?us-ascii?Q?4XpbI2CuuGBjKIfaM+d/Pg42XKifbEyPvZReBELv3mgeMqGRiPcq2AZ4sB68?=
 =?us-ascii?Q?RRegC/+tWls43L8jlOz2MMM9Hy7motKBlzR766+RhkblctTMsheSezqxyjz9?=
 =?us-ascii?Q?MKLzON8Cy0bIVp3AYFf72bYrhNp67I7vpuXdvSmLhcJFs7k6LHXgWeQQZs+u?=
 =?us-ascii?Q?etj3ExAXszajnFRa9p4mR3s3uA6ID2w+asoiBMwOEakHmVlXGyRCu+x9JZdt?=
 =?us-ascii?Q?NdGWWa+RtiqO76cGZooeMUn8AQCfyTwlhEMW/svqm2zx6/TOeXMkFFi7s3eY?=
 =?us-ascii?Q?IAA3+/t0n0LKnL6ZkdGfKPmRWkFYI+pVa1/0qTLcRMtMZj5K0+lKCA4QGZOm?=
 =?us-ascii?Q?jVhfIuJtp9zYbd8Gp/lP5lz7KIZJkdpsdyERxDWv2K6vaAu5VKLbyT+GB09t?=
 =?us-ascii?Q?pjAlpEbf2+yq1k8ONurAzsuDBMq5rj3rTgNvn7VWh1nSufKXkTBEuMLXTVMj?=
 =?us-ascii?Q?bktc0FMuNP5OlMsVEbEhaoI3f2quaNr5j6vFdc8Ovgal6cuzv9D2NsLUnjb2?=
 =?us-ascii?Q?Xkze5jepuHQyxUJio/N04s71EF09NLXfcnoN79I38yOwUB0j9PlUPlhP7otm?=
 =?us-ascii?Q?0A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b965d2de-7d23-431c-b67a-08dbbee24e96
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 22:45:39.4584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zsy4K2QxovWTjSxdq0PCqVDymy1g79fv0eJrDJ5Bf7B99QvpZpVxp/dBus8kciejUb0KA0XvEAToT1jsyE5zxc/GktQCXuOyJOAJOH5i3Fw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5939
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t 09/14] lib/igt_draw: Add Xe2 mocs to
 XY_FAST_COLOR_BLT
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 15, 2023 at 06:23:41AM -0700, Lucas De Marchi wrote:
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/igt_draw.c  | 6 +++++-
>  lib/intel_reg.h | 1 +
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index d7c3ac64c..9a7664a37 100644
> --- a/lib/igt_draw.c
> +++ b/lib/igt_draw.c
> @@ -716,7 +716,11 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
>  		}
>  
>  		pitch = tiling ? buf->stride / 4 : buf->stride;
> -		mocs = intel_get_uc_mocs_index(fd) << XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
> +
> +		if (ver >= 20)
> +			mocs = intel_get_uc_mocs_index(fd) << XE2_XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
> +		else
> +			mocs = intel_get_uc_mocs_index(fd) << XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
>  
>  		intel_bb_out(ibb, XY_FAST_COLOR_BLT | blt_cmd_depth);
>  		intel_bb_out(ibb, blt_cmd_tiling | mocs | (pitch-1));
> diff --git a/lib/intel_reg.h b/lib/intel_reg.h
> index f97154d2b..ea463376b 100644
> --- a/lib/intel_reg.h
> +++ b/lib/intel_reg.h
> @@ -2564,6 +2564,7 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
>  
>  #define XY_FAST_COLOR_BLT				((0x2<<29)|(0x44<<22)|0xe)
>  #define   XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT		22
> +#define   XE2_XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT	24
>  
>  #define XY_FAST_COPY_BLT				((2<<29)|(0x42<<22)|0x8)
>  /* dword 0 */
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
