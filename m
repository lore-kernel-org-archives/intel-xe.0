Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5716DCEE33B
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 17:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE6410E1BF;
	Tue, 18 Nov 2025 17:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="clZf1ymo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE9D10E501
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 17:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763486277; x=1795022277;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JoOLwxf+fpb7xFQy894jRGFkmyVVdFGkBmjoLoFNqOs=;
 b=clZf1ymo5zOM1fCq36x0uKEiZQTEztvzB20Qm1gRRCfUKwZQlBGXHq3T
 /YARScjOxky3OQlYhJr5zFrtVmRjqLbcgTZ77VzzXYLrQjZULWEbe0Fwc
 rS6hA3MOyDTZaDNFRV0gQ6qtqx1jQbXe4zwzzMV5xG+Sn685cIeh6A4cV
 19Ih5fJIyVsXTdxxll2/hwIfL0igHQEZSrjNTt10pYVfRD4UMRIsd3zvg
 Q/rhBsH/LLEPywrw53gjRbcJtMv0VMmaOFmEC2EW+E/O7nxZXGSMwypCn
 /VqqSn1Cri+h0Oyjq3hGbDx4qcPv6xC57Xc2dYyD43+dyscZdA81ZPs06 A==;
X-CSE-ConnectionGUID: l7gpldINTmOk0Z0+3FbaJg==
X-CSE-MsgGUID: 3hG5bVRHRriUSecIMQb9Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="90990667"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="90990667"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 09:17:57 -0800
X-CSE-ConnectionGUID: YvJ9NowdRVexCo5XNvsjOw==
X-CSE-MsgGUID: PblzC9M1R0CDdXlpHInMVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="195729076"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 09:17:56 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 09:17:56 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 09:17:56 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 09:17:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sxc+b7oY9w4M0PZCnh+WRgz1B2uiAusuvS0ojBcJMQTjT17VyfW+KRzsNMklc/rjPjCv9DXOMrHjg61UXFm++nsyNbnzgNzRdlto3k7y/3HKyl5iROMWKFRGw/FSyNPR+myL8bViTjP2sGvp/iu9YAgjH3l2WVbMuSUeU6+0CizQD7ontmOpYQXkumeVYZwPwGWT2C3H0HoeKxFF7+igZT7+aXySbSALvaTeyvPLvc7fN0BsCvS0k9qzFYHI0rPWl2F/7w3YOR7ytX3gKQah00PoDBVmPN38WSDJEbluOLbI5PJCj6tpoAvWKoKz1N5xkNlDLrU542G1K9BPrNLXSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUucU+iBK2DElj95tBJzribsBgpCNfyuZeE+PhfcQF0=;
 b=Ewj/BhSHSpk8j6xg/u8mgmyirVnJf8HvS/a6LdlO/T23gjbcjkddgPIPYx8Bw/O6W4LUS507k9ezgdP/Xsa0ywtc9xHo6GugC5abxLkGg3tQVddMC5B2fkSqlXRmoixPbTiMmTB2drr5kHIxGwnuHbM2tpTygTf2ajJiP/YPoHq3H3/+T520R879ce9vly1yRGL/2mEa9EtNetr4PqS2Db9hB1cZ3VXyTUP8TYjqViAY3+TfFCw5dAAL321ADDtNcUkLS1P12nGSSjDrktfFUXLfonML8K6Aoaau+eyOYEBjxAcxX3zGOQRwH93lfoTi9qji2Ybp2DyXXYa/H7K8VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 17:17:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 17:17:53 +0000
Date: Tue, 18 Nov 2025 09:17:51 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Michal Winiarski <michal.winiarski@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: Re: [PATCH v3 1/2] drm/xe/vf: Split GGTT info query and fixup into
 separate helpers
Message-ID: <aRyqP/Kcd6ZCFc7w@lstrano-desk.jf.intel.com>
References: <20251118124741.3504754-1-satyanarayana.k.v.p@intel.com>
 <20251118124741.3504754-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251118124741.3504754-2-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR03CA0195.namprd03.prod.outlook.com
 (2603:10b6:303:b8::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7183:EE_
X-MS-Office365-Filtering-Correlation-Id: a51fe198-aad1-4f91-7a8d-08de26c668be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iIW3xI+Os6KGQ0emvus/VgphO6uC/bs9iMkRe+eut+4dpjSgx08tfGxVCr7Q?=
 =?us-ascii?Q?oDJ8qRNg6dhuzCLV90jz+ymqQEl0zYcK+97bvMKLb3uX3uzQR8WBey48tOOC?=
 =?us-ascii?Q?Hg2pc26m26Nw25BrqDEu+CitWlBYChHWnGS8C+l0QXaYEYHbjR9m+Dqy6R0X?=
 =?us-ascii?Q?NNAURW80ZtfEwJRO4wqPbR88wcjiI8Ekld+g9VDZ8hrz6+rGyEcLGfe/9bNx?=
 =?us-ascii?Q?VADTOWpzLEt0ZsHoPae8IQW92L/fxurQmiVCp+T0XA2qkFxaK6uX7oRWPtyf?=
 =?us-ascii?Q?32qLGgVwRmhTNJrWbcp9//M1vN00tu2or3krwCZwAOcSpe6vThBLSYD30EBb?=
 =?us-ascii?Q?qIGL/X/WOTUGyMOevswpb4lZlfnGXLEK1FdBRmmYCOYNkZsLKNVvjGeRYYlz?=
 =?us-ascii?Q?z5zfpRlExVsehynF5pT/UvWdD4XVinyAKLjKkeDLrrUgyfMYWEiYXf4j7Zpg?=
 =?us-ascii?Q?SH+lZDU0cdKtoz1PjBx9fMN+qAhbltsccBO5U17k3AX89j+Au/WdvFUgs2eI?=
 =?us-ascii?Q?JtJ1EGDtfd4pjF0J7g6HbqyPsCaN6joRs+Hc58bnCYx8aeOuqThfXyLyO7+O?=
 =?us-ascii?Q?TmUhDo0VLeFhYLCqNaRCOJYey0kGIDj6ZKx8MElWs5rLf4C1JlujGWDUfpTb?=
 =?us-ascii?Q?vfmpfVf3QqQPIgm109iT5i7/GJZdvC0HZmq1ugnXcM0Rom7G2Lsgwi+LBB7C?=
 =?us-ascii?Q?HbddoVDv7xhc1alkW5XcVXL7SgeFVUS+EzyAeOY5MVaCt0sVsstaTKBE+9Ts?=
 =?us-ascii?Q?hPpsHvfjJwgJaRS6xxLhZI0GGP1Vo3hnADo1+mLgeO4Ogb3E46fjmBYDK2U8?=
 =?us-ascii?Q?1Pv6fYEmg6wqp+p7hH0jzrdW4qpMiurDF4lYD/z2ZfntEFNPthEixsbfNeiX?=
 =?us-ascii?Q?/l/vDwfojYJogauPgmYyLDggSdwGCa4gnoV+Yu4VTGPjSv9H+jhorb1bj8eb?=
 =?us-ascii?Q?X9b1XW6CrfGqXhMdPxurIG33Cq+D1fyXXdYExufOryINxf6Zk+wY7MJZtTQc?=
 =?us-ascii?Q?QLEmea/PGz0w2RkYDZuuO9w+uIWQjpZWaTRxZckKIrhjpDYA7JcfoG0D4xLq?=
 =?us-ascii?Q?y5UapyOOOotgh7OrYzHNSa5nFgaO2M48T/ra0aDj3Ag/KaJKtXkAq4egeVwZ?=
 =?us-ascii?Q?fwJLi0fpK/66Gs0SKVjSVOPaFhyo+h55l0425RXBOYI+1NuCldze6baKfsN0?=
 =?us-ascii?Q?DQj3hXl5a36NBscQej6g/CfV0dfyU6UwZxotRt35+lgMIZAbrGXc3xD3mz2S?=
 =?us-ascii?Q?ZpGIC7KCviZjjgnmcjFGQGy0y1Qjuc2cF8xvLl2YiLzoTjdxMohGdD09BVEw?=
 =?us-ascii?Q?A9kUacZvCUDsFZakgeT4EOakWS0fe6pypSVKxGFeFImwl0HQnKMW+CB2BIOR?=
 =?us-ascii?Q?9qiI+2wHyAW9jc8uSvBGxuAjFqiHyRu/t3XAuhfB/nyQQitaiBSNrVzqScG7?=
 =?us-ascii?Q?1IzqfcKM2gz7Tm5QMyAVynHWqJQvkjWd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?waOc0fjXnxnQ7i/0iaSjWwA1oACtcM4BgvN82dFfpDDx5NQ2sPh4INJlskZt?=
 =?us-ascii?Q?Fd7HYLFZxNcibjemjFNvT/oQDbt4mNEwn2lD+a0Gi9ifKa16oPJSu6aFhIcN?=
 =?us-ascii?Q?+KysOP6UgwtY4pyCgdGxuN4TIUWuB21JmQmfs49g0HToRT2iGkZG+1J/dilA?=
 =?us-ascii?Q?7PKEjTsaOmtvmYzXA8/ehwa4kVA6E9CKjiR0RDU7CyzxkMFBDtE0PSf60kVP?=
 =?us-ascii?Q?MK91Zqkb1yZGLhFyMo+K+VX61wGZmB5k1pLY85pWoZ24kBHjliPzS8TrHlSl?=
 =?us-ascii?Q?SnpDh6IKslbIogOQyconhg5PYMhSr94HYRPHRJo3x8wd/U7aLw7360DU/TqP?=
 =?us-ascii?Q?PHq91kG2H5dzoFBoHKbfkwHqiwTSsk1G7T803pmIJX12mg275hYxVJUBwqp0?=
 =?us-ascii?Q?OjSlGayvI74CVQazzstul1RV8i/XuhYyytS+e4755dLvgGJXxAQgLSO2HSdb?=
 =?us-ascii?Q?yt1wzna/w8sCtfJvhibqFGakjBAmGio7jGsXGmiFCJDnkEHekzp9pfHFx3Lp?=
 =?us-ascii?Q?rc9BJKJKVyfy5RfFfa5Idx5A4R+ysnOicSd+iyit/hSYt9u03oGU1afdraBx?=
 =?us-ascii?Q?OlELWg4bFa6PaZF5aNrrk0d+6qFj892aSUmeAooykR+5b7BzRYLmxYX1Wy+G?=
 =?us-ascii?Q?lIbB3E4mcZQwSpDvrEfPieNvFVbjIZkOAn0/1GFus+eYSpLgncObR3xMJZJQ?=
 =?us-ascii?Q?4PgLJ7n2Jqc2PKnZGpGNfxY9CN1VYZYuDUjWJXHEIiSlKeiUcliFibl1hGsC?=
 =?us-ascii?Q?MV3LK+vdWLfgJAyYxUHMJkdEbMan3yjFQLDFhJXIKQC5cF4duJraWz6Ibz/4?=
 =?us-ascii?Q?cR3QuSlBAraA3JIYwPR9G5p6T3hQeIantidxVPcyahsBThWa7Z0El7b4+TZn?=
 =?us-ascii?Q?d1ZonvOCpHhg7bMxWhug4ARJcSyuAaCyx9XDJrJ8ptZSixTlzqsHyggijJwJ?=
 =?us-ascii?Q?RYs3gOrrobuHkDLjBtWp9cg+ImzINLnsG4P0M144tMOKZaTXyUdWApEk/ESc?=
 =?us-ascii?Q?4cZs8/k18uiTdOez1luqWfxQBEpzuu7bFmkt5G+ZbLpJe8nWpP4KD3lluHI/?=
 =?us-ascii?Q?ixCLwscwpHSOqyurBv2yOgT8Ru+5RMRdp0bTeV0B1B4RjlqGuBoQWYn4icBN?=
 =?us-ascii?Q?4nbyDrbWhFZnRVLhqbIAeJ5zJG0LbJqgwqqoPuqu4eXXof1dXfHSC/0FY1y8?=
 =?us-ascii?Q?Ak/GcC+DZed7hZG4I3LBpBJFoHIogTnpt6wTa8Hpc5DslWmcRxdJ4H6UJZJ2?=
 =?us-ascii?Q?8aQACpsnbCdaUcQngmFYdRIIn9kSIDz8GcOXVjAbFwcoSQpEI05L5ciQNWPX?=
 =?us-ascii?Q?uviIKhHwjkatRjKZQsipFvKCriXfJ2P7HJff8vqg9kRAom4T0X6CtZm64MD0?=
 =?us-ascii?Q?I8muNf3LLRxLQm7XsqZ9/LCLspx1yOnl5+e6bHpGoCunzlDZWDp827WiZ65I?=
 =?us-ascii?Q?s+I/CfAVwatUAD2+V283GNfbpqfpQmKh7H/JtWsGTR8s4an/xU/pBezbJ1RB?=
 =?us-ascii?Q?/k5uYcDLt5LDE0Nh1aoLxPHuX6+z28K8/IHxp1R8xcO6ZitclhgaIYp+Tt/5?=
 =?us-ascii?Q?6kfeT34ulwXLu/aUGBy2XLD2bu2KPsQb+C2v8hR1AqJeQ0gSfSI3sX6xOawC?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a51fe198-aad1-4f91-7a8d-08de26c668be
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 17:17:53.7910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mdkfi9yIgNaL8XUY9g3XD+RcOQ6QLOxNTBlkKt5mZ6CW7aQr4BIBRetqHTT+T/pO8KWVdDNR1zcQSxHJeTra6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7183
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

On Tue, Nov 18, 2025 at 12:47:40PM +0000, Satyanarayana K V P wrote:
> The current vf_get_ggtt_info() function handles both querying GGTT
> information and applying fixups. Refactor this into two distinct
> functions: one for querying and another for performing fixups.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> 
> ---
> V2 -> V3:
> - New commit
> 
> V1 -> V2:
> - None.
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 45 ++++++++++++++++++++---------
>  1 file changed, 31 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 4c73a077d314..be7986537aad 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -438,41 +438,50 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>  	return value;
>  }
>  
> -static int vf_get_ggtt_info(struct xe_gt *gt)
> +static int vf_query_ggtt_info(struct xe_gt *gt, u64 *start, u64 *size, s64 *shift)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
> -	struct xe_ggtt *ggtt = tile->mem.ggtt;
>  	struct xe_guc *guc = &gt->uc.guc;
> -	u64 start, size, ggtt_size;
> -	s64 shift;
> +	u64 ggtt_size;
>  	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> -	guard(mutex)(&ggtt->lock);
> -
> -	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
> +	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, start);
>  	if (unlikely(err))
>  		return err;
>  
> -	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_SIZE_KEY, &size);
> +	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_SIZE_KEY, size);
>  	if (unlikely(err))
>  		return err;
>  
> -	if (!size)
> +	if (!*size)
>  		return -ENODATA;
>  
>  	ggtt_size = xe_tile_sriov_vf_ggtt(tile);
> -	if (ggtt_size && ggtt_size != size) {
> +	if (ggtt_size && ggtt_size != *size) {
>  		xe_gt_sriov_err(gt, "Unexpected GGTT reassignment: %lluK != %lluK\n",
> -				size / SZ_1K, ggtt_size / SZ_1K);
> +				*size / SZ_1K, ggtt_size / SZ_1K);
>  		return -EREMCHG;
>  	}
>  
>  	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
> -				start, start + size - 1, size / SZ_1K);
> +				*start, *start + *size - 1, *size / SZ_1K);
> +
> +	*shift = *start - (s64)xe_tile_sriov_vf_ggtt_base(tile);

I don't think this split works. The shift calculation is the critical
path between 2 GTs running in parallel doing a VF restore. So I believe
vf_query_ggtt_info should just return start, size and shift calculation
should be done in vf_fixup_ggtt_nodes under the ggtt->lock. Without that
it would be possible to shift the GGTT twice on a VF restore which would
break everything.

Matt

> +
> +	return 0;
> +}
> +
> +static int vf_fixup_ggtt_nodes(struct xe_gt *gt, u64 start, u64 size, s64 shift)
> +{
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	guard(mutex)(&ggtt->lock);
>  
> -	shift = start - (s64)xe_tile_sriov_vf_ggtt_base(tile);
>  	xe_tile_sriov_vf_ggtt_base_store(tile, start);
>  	xe_tile_sriov_vf_ggtt_store(tile, size);
>  
> @@ -577,9 +586,17 @@ static void vf_cache_gmdid(struct xe_gt *gt)
>  int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> +	u64 start, size;
> +	s64 shift;
>  	int err;
>  
> -	err = vf_get_ggtt_info(gt);
> +	err = vf_query_ggtt_info(gt, &start, &size, &shift);
> +	if (unlikely(err)) {
> +		xe_gt_sriov_err(gt, "Error in querying ggtt info (%d)\n", err);
> +		return err;
> +	}
> +
> +	err = vf_fixup_ggtt_nodes(gt, start, size, shift);
>  	if (unlikely(err))
>  		return err;
>  
> -- 
> 2.51.0
> 
