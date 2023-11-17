Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44532C54FB9
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 18:22:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F2110E0DA;
	Fri, 17 Nov 2023 18:22:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B65210E0DA
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 18:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700245357; x=1731781357;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lF5CnTKd5Jliyb441RWGJkhrsz+spphyPHdUZvhCDkk=;
 b=kBY3EuaLUYTylhpFQ8Vof1aO83k/tACjeNNZJARrWVS1dQC4cBaBZoWm
 odK+/MRZUyTnXrb3YA5QTnPKozLmcxAMtYhy7WqKKjc9Zqjd4zRx4A8zG
 ypg+6HYPZn4qLCkV/vJgzocgBBGuExRWr5jyYfo0QQjL9OgoLDLIe96ui
 MQa/LaXo1L6jYOU95/C9cN7eRL+QQUPKG3rGmdf45ZR3zmLFaiZTOl+1o
 BBsY0LGVGd1amLxiO0Zn5UDncwXtBKkRKeAIO5u5btKSrap0T+++5Ommt
 dTPfNb4kOOsggDlcZ/FOrTwWzzftkML5XMkkXkYrMmOMwHs7PlZdUVbrv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="4491787"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="4491787"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 10:22:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="856410297"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="856410297"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 10:22:36 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 10:22:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 10:22:36 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 10:22:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhgIS6B0LEafH6CuL/UvHs2fYa0hY+ZD8Xpa2TBKT5GfFhyJ/HNSmLrdTsOrnu2Bu5GqXOBQC2l6BjLDSKYgAN+AQWBRn25W5OOpFBRST0yodOsvUA5u3SI7DcMBnDmmkN4hFhj6ac5/CcAV+dPndeaXTQQvUhiKwDMBdItxsWE3KXf0Ia8XfIl1plCqT/CD8gW/7oRQoqUHif1j1AlEZbFn0TurkJNWKhO9Mg1XlwHL/Ac6jDExMHkAE7h6k4IzC6ZJXILUM9zHTDgzxeqaaTYHWPfV+fj/I+GPFzeBLUkijBgmax/emXQhtotkD30ryfvWJNq7XUJcBm2qiOpToQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbKFs0d5uhbLXupMi2bUDozKrEwOV01KO/b2i9R3sPY=;
 b=UH53ABNMNhSmxyralEUZP3P3MTHslEEpgjFJCrjGbd6KT/lrtfAOVINg4xPR79wZV9siGLkNPzJrf02mhezIqJqNkTiVdde0x+pCsxi0r1y2hPp5jnYuQHkA7YRugBp1+8+l2P7wWwWyWZkZd6WJFGV16Mj1nYGBQwj5EBKqH28oa7p1g/cVaCnAxxXcq8bTC9g8+vtaNbQKUY6K/lH+R0webf41izHbwMjQMZqzUc36IUO7u0mk0/jxj9SipXUpss2gey6PYK3uGreZjE6y+8PY61m0kfiMKcCESoj1L7S8clFLPJcAQiQLTH+ZkoFpW4/xhbUzi/QDMLwGuwX+aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB4861.namprd11.prod.outlook.com (2603:10b6:a03:2ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Fri, 17 Nov
 2023 18:22:34 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 18:22:34 +0000
Date: Fri, 17 Nov 2023 10:22:31 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231117182231.GY1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231117174049.527192-1-lucas.demarchi@intel.com>
 <20231117174049.527192-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231117174049.527192-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0267.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB4861:EE_
X-MS-Office365-Filtering-Correlation-Id: a821e8db-b2eb-4647-e189-08dbe79a2b38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j+afFs7oR32nfuwjHURCNRR1BwPCNtpVuD9JV3HrpOXiFdgFg3fZRJpqZPN4R334HhunWgZ/yXkDtmfTDz6vKR6zwdu5NpMY4sjEjQ5bVBfYKvN9o5Yt1U6Uzte/chWk9NNjO9su+xbNXFvRnubSXCdBcrhP88HDPYZlb5ogcC0SdL2HamELj4xVVv+tztw83yrndeolI7QObtfYv6FpeTKnnc9C2zLhGsHKwOmIdRRJGQWEUWDLRA7ffT3nZ4mvPNGydsP4sY3PADpN4Fq7O8PMaIReGYg7FA7cW75L5LKteZ+Uvae52M5OraI/bXCq7ets3oFi8sUYRa2z0MAH0ZNTLu7hlyKNm7Jgo135vSFrp1hRUH/u622tOwPpk3ieHN42CdYWYAw9g561sSJShWOkkE/uze6EcBM0CypR6/Rf7+gW6604TlEWK261RDkblCAyQeZIz5MywYTFeU0QfBdYi52V/2Bj0LQxkYygvg33NmwEy3sko/tR7F9oAdaRlHJDVtmQhyafcDWFgfBqPQucVPOU5w1eVpR8hMpukFcVLvIUU8PTkkPqnVlcBhPi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(39860400002)(376002)(366004)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(86362001)(316002)(66556008)(66946007)(33656002)(66476007)(6636002)(8676002)(83380400001)(6862004)(4326008)(1076003)(8936002)(6666004)(26005)(2906002)(41300700001)(6512007)(6506007)(5660300002)(82960400001)(478600001)(6486002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ywIHrkBxDe8L5XF6uLgBw5eZLplZNYhUdiYg33VkcBQ9EpyhQoEO9l/xBB7T?=
 =?us-ascii?Q?6SukeetE05+FTEhKfDFc0Kf/klfcKdkI8ciHboF9E2tyTUoCdx6/hnnjGeF7?=
 =?us-ascii?Q?EJnf45y3tXtKRzYZRirTyCF0ybSn789LlpFjURe+v4mOlFGb8ZhbIcsRGN9a?=
 =?us-ascii?Q?rDYu2olYepbJxss4G/TvXTR6oTEiwdy2ngGQs29HUawMx4BAgiikJXzDnddM?=
 =?us-ascii?Q?3gQchlT346vfQFy8oHgyYqg9bWMCLKnxruPOru1a1bmIAKZrQ4twbv87R/68?=
 =?us-ascii?Q?d+VCKKBXX1RKuQt2fmMA98akwKYfns0EH6e4SdP6AsUfaNNCSnI/5fk7uAdA?=
 =?us-ascii?Q?EGA+m9sivDWqUQTIkEfy9REF2M6VxWHxQW1XyZUz+peWAPKwz4jIO5S4yzi5?=
 =?us-ascii?Q?UYN9sBTyUEKqssMHZDxlDmTpWeSfY5kSuvzwRVd1uUWHJwIWQSSgL6GR7Y8n?=
 =?us-ascii?Q?xlwzsB0OcF54ihDWOPzAhfuXDklxZN9xd/of6p5sYMTmeDAmMf6dQgnVZNc7?=
 =?us-ascii?Q?OdLJBivaVMf6zY7ltAmhyPROps3dw+/qwmrv/bookmuqgWpBcknHlY6S8OPJ?=
 =?us-ascii?Q?JeLJhv7ppQClKcIicmxMvNEUQWemgJ7hWZm3d5cV8N6mZxBGd2QeiNOLslrn?=
 =?us-ascii?Q?7B2JkQ011/a4vsBZzF0b4AKRsy0FIqUF+p2Qbi/+XdRpCEjSNrY0pk478VHd?=
 =?us-ascii?Q?4I6EoMXrSM1jPJgiiupgPslSnhT69dQUWlfGSAolrIO9TgIGB3sYwWEYCKnU?=
 =?us-ascii?Q?J7710NshT+fOrS3QLiF/V5XzHPzc1V54UgzdJv/2eaMFBcKyNw4lcb0yepAc?=
 =?us-ascii?Q?7sxIGvur5vt9sKrn/lJrsmVRM2kVtEHY8CNErpK6wrsjPKm9/nYxuySd/Orf?=
 =?us-ascii?Q?XHNJwAVJOr6Nusse5bFBuuGpOmpOPAqBW3Y8lMvT/oEQm4RLgm+gILCNrEPt?=
 =?us-ascii?Q?BU3gF8zw0r3qOkHaTbQ2atZqaPAvdrU6a4gUzZPUIAq12JcG6XUhaawpVtNh?=
 =?us-ascii?Q?P79Ay7rkNYTdRgZPl6mXX+Td/at86sXDcc8bhJQjISqjJ5LJ1+DvSC9nL13c?=
 =?us-ascii?Q?CpL8CQlegFBkjKUuBqe62jIVnZvze+2XMuaITAIdy4t7TpUeiaZLVgnyBQti?=
 =?us-ascii?Q?jA86fziXIAEtax8O02d7MztRHvWkcMiAqPjbZJM+1ayHw4YwYWjY+UDBm9sp?=
 =?us-ascii?Q?x9ROEwxr70iQW5MdK9ptxmAmcPkUpUHpGU4tPlU3AZ5sxD3hOcD7SyeINZgW?=
 =?us-ascii?Q?qE7z9uPcatn2S7LZs4bvJl+LJ6KQuoV4uykkNy1FMZoOtJY1nj+PME0E0i6F?=
 =?us-ascii?Q?WLoCpl6BqvbdFJkdphiWfgrpfOkn1dyj7FSmVBnPVwLl6CbUNmWliKOMKVXq?=
 =?us-ascii?Q?HCmTjxUooWCvkFasCtLDALj3Tz4Dp1fNwQ7TQik0OwmFAgvM5PUx6Jfq/JTs?=
 =?us-ascii?Q?AnNTldW8f09mqVA7aobZpn93YwBRKgiIVNGr4GEuhW7p488pKSYOrG+0hRQ9?=
 =?us-ascii?Q?GuebJF1/8OJIQy5Ve7zJs1+/Hob0vpTcchdKv+0aYs5MpJO7d9qh+TCjZXOe?=
 =?us-ascii?Q?6nkLUNdRWIj7EdYs6yvl+CXv8VmiE+U6UWqM/2CEXixP0dJDFc76gT5cAcIt?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a821e8db-b2eb-4647-e189-08dbe79a2b38
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 18:22:34.0517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6KnD9QEtzhvARK2u62yXQopbB1oHIfKZoeulvEMoj2j5JHbFma/Ib0cWSDGVQShQuUNUG2ivQFy03fNLXudiyC4K/ErD+I/wtFxn0AGpXBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4861
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe/mocs: Bring comment about mocs
 back to reality
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

On Fri, Nov 17, 2023 at 09:40:48AM -0800, Lucas De Marchi wrote:
> The mocs documentation was copied from i915 and doesn't match the
> reality in xe. Reword it so it matches what the code is doing.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mocs.c | 30 ++++++++++--------------------
>  1 file changed, 10 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index a072fbccc693..daf5f2a8c40a 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -123,30 +123,20 @@ struct xe_mocs_info {
>   *
>   * These tables are intended to be kept reasonably consistent across
>   * HW platforms, and for ICL+, be identical across OSes. To achieve
> - * that, for Icelake and above, list of entries is published as part
> - * of bspec.
> + * that, list of entries is published as part of bspec.

s/list/the list/

>   *
> - * Entries not part of the following tables are undefined as far as
> - * userspace is concerned and shouldn't be relied upon.  For Gen < 12
> - * they will be initialized to PTE. Gen >= 12 don't have a setting for
> - * PTE and those platforms except TGL/RKL will be initialized L3 WB to
> - * catch accidental use of reserved and unused mocs indexes.
> - *
> - * The last few entries are reserved by the hardware. For ICL+ they
> - * should be initialized according to bspec and never used, for older
> - * platforms they should never be written to.
> + * Entries not part of the following tables are undefined as far as userspace is
> + * concerned and shouldn't be relied upon. The last few entries are reserved by
> + * the hardware. They should be initialized according to bspec and never used.
>   *
>   * NOTE1: These tables are part of bspec and defined as part of hardware

s/of hardware/of the hardware/


Aside from the two wording nitpicks,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> - *       interface for ICL+. For older platforms, they are part of kernel
> - *       ABI. It is expected that, for specific hardware platform, existing
> - *       entries will remain constant and the table will only be updated by
> - *       adding new entries, filling unused positions.
> + * interface. It is expected that, for specific hardware platform, existing
> + * entries will remain constant and the table will only be updated by adding new
> + * entries, filling unused positions.
>   *
> - * NOTE2: For GEN >= 12 except TGL and RKL, reserved and unspecified MOCS
> - *       indices have been set to L3 WB. These reserved entries should never
> - *       be used, they may be changed to low performant variants with better
> - *       coherency in the future if more entries are needed.
> - *       For TGL/RKL, all the unspecified MOCS indexes are mapped to L3 UC.
> + * NOTE2: Reserved and unspecified MOCS indices have been set to L3 WB. These
> + * reserved entries should never be used. They may be changed to low performant
> + * variants with better coherency in the future if more entries are needed.
>   */
>  
>  static const struct xe_mocs_entry gen12_mocs_desc[] = {
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
