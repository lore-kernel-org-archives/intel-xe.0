Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE23C48260
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 21:28:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A5F10E393;
	Tue, 13 Feb 2024 21:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PvHAJ6UJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D0810E393
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 21:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707859690; x=1739395690;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vFOhYHCzXIsKBTQZ8tmmG52cvjBDO9aCE9U+qlr6Y2k=;
 b=PvHAJ6UJ/Gn/LtATldzcrdEc9+E2DiJ4pQJ9X4i8tjdC5ibsO1tjtJBZ
 mkF/Nxbz7Gj7OAmW63XcjyGV1G/+4Fcd6N9iJzqIZ2Tz0bC16qevg8/TX
 t9pa0MbvHR+4/6FKGIIYAYuMD8myYw8l3n/1R8iKqDdLiLRK9E90lYD4g
 Zmxxs13ULJOel6B8ra7y+Ok8HLYoyxYFPDthpZpixZLnSxtZcT1LxYOuC
 9+UYxNiLPxNkgDYgKuXUUa/l21O0TxOACpGsHwctGOewYy66dmR3ePDoO
 tvZXwULcLVLIRbvELrMStgZbX5cfWgY3mEff59d0eo5zWEzAjL30JNCZV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2036555"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="2036555"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 13:28:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="935458499"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; d="scan'208";a="935458499"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2024 13:28:09 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 13:28:08 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 13:28:08 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 13 Feb 2024 13:28:08 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 13 Feb 2024 13:28:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egHrc4ne7zKcYal7YFY/faAMgZhXkLZEHZ8yGs9cr1XPdzSZdN354bgx1y8ttBs2naOwSRhjifHNRWY/5tRljUVFjJPkYJ+llPBK2pqG60fbC810uGosFaERllH0wZsVTiJaDYCF6/ysEmyyl5wQnrJZEjqxm8bisizjI0Se9VFwnFZbP7kfhxsiez0GYbXpKDmOplcKTl3qgavs/mL+5NNDMJmN4GZTee6GqLAKCphwO9NPkI8o53EK78z9vEV2HR+WnGzAEeffBbJFtxJa6x9CzFKQ2bjDud7QPRvkBfkoyKdTioPrJ3AXPfKNOz8MWnxqg6gavNcXqMXrH3sheg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2OpkFfcxz6hejy73xiRxAIa9T1xi9Ao2Qic4/qYIYY=;
 b=d+5ewTjhRzNlnyC+H4kEEee9EpLiRhh/x8jUXyPspWuNkIKYDccsHWtDQEviYhJMoT3naMJn2/8RdRS7OlhAFemNztSZ8+t7ssCsNvzFpwY9B1swKx0+ZW335LJYP9bjnokRGXMafLO6kRYaE/KTzy625keM3Dfi6iB3+43tKi0oPFKGCjvoobP9/r1o+9swruAuZF0bKLb/1IvnmxUWZPa24w2JztVkjtHBuWnix/bBleB6mR/H87CpbL32gBbb07rS7tclLFR8eAOXJyZXtDHIKGn+vXtWugCa3MTLMCqMvv459tWnGAQtpJ+CKeYUjKPF5AtdWPHDLj+x1m7XQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN0PR11MB6111.namprd11.prod.outlook.com (2603:10b6:208:3cd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.27; Tue, 13 Feb
 2024 21:28:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 21:28:06 +0000
Date: Tue, 13 Feb 2024 16:28:02 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison
 <John.C.Harrison@intel.com>, Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Add uAPI to query GuC firmware submission
 version
Message-ID: <Zcve4tGBWFhC-R2K@intel.com>
References: <20240208183539.185095-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240208183539.185095-1-jose.souza@intel.com>
X-ClientProxiedBy: SJ0PR05CA0193.namprd05.prod.outlook.com
 (2603:10b6:a03:330::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN0PR11MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: 408caca8-38a3-40dc-cc71-08dc2cdaaac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /3EulInp8zyQb6ubOM04M2hrm+s15t04upazY68tzLLhO1Acp2JmiVEC7cN0BpvThIqa3rKwBHwFfckjsgUTpOAdNnHrWHlngf1o9d0xHD4dFDbFLBAVSXZJS6RGS0s4nAxhnXP1rPVj981SokxfQk3uQMKRwaHzde9Un7XUpbDnmzPk4Tp37yiFr3P8m5JOb2/zz/ZC9bikxEb8DolH5wPReEQBLjxdN3FX1Yi7BVLrnh/nX5GIbVGJpzDktAz+IStnG2RS2I6aKlG6F5EDx+VXtYorD+lhJ6eABwLAfDAqfkOIZImGuUDOTncBle9/9yYnma/GSzWEqy2Xa47lpxwHGl6Ajj5Z9NXjYesRsBEFHVfABfXrodkACimeoksyw9kY4Na7DrtLVAO/6TJb0wvRRecVdI3JpF7putr72mktzmcG1Rc5X6a9MXNITO91uBWW7umws2ccdLXeZT0+iErWA7ymxq2fHvaalK9BDjbtxEUHO61zpkFqB78jOZpC0VN+A1gpUQh253Ax1Rsmx55tWrbdjAmxZUEuoAR1NkJCn1zpekrVTuYTK52eHOhHING6yH6W8JFsP2qfTmG2vA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(366004)(136003)(346002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(82960400001)(86362001)(38100700002)(5660300002)(44832011)(6486002)(6506007)(26005)(478600001)(966005)(6512007)(2616005)(41300700001)(107886003)(83380400001)(4326008)(36756003)(2906002)(6862004)(8936002)(316002)(66476007)(54906003)(66946007)(37006003)(6636002)(6666004)(66556008)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?G3XfPP7hUqa07ipA+A2S4ur9nb41RtgkjbcFgN5h34vLY4RyBZLoXSgVxg?=
 =?iso-8859-1?Q?C4EFHPx5VPs2kT/LnzoN+MApH0JSNXm84RGOtnybHLq0pw1w+mc8fvymvt?=
 =?iso-8859-1?Q?tVtth3gykgGNS008DtjIgZrmddPOpwiEhEVVJA1oc+LpeDxJ1JZgOO/P/d?=
 =?iso-8859-1?Q?+n7TYbow5WvYsRpbp1/LACYY4Q40ISzazvZAIMB6MJCFoh2t4q6rul8MxN?=
 =?iso-8859-1?Q?hwEtfQJCUf0ZnXH8BLAuP1t5zkrn030YWUMmEIcd1sD9zqm3cOhUDOrxnL?=
 =?iso-8859-1?Q?16cD6UCNIhltte84P7ufkQSaVS/ktIo1q7cMwlx76+nypD117YETRS1DQ4?=
 =?iso-8859-1?Q?jn0E/en93bbelAw4sduiojStKKE9GXQPPbo7SnR0z8rxPuHkSmFMevxFlu?=
 =?iso-8859-1?Q?fs6Sjj1vcEic6OLHojsZtX7ymdnkXncwF+NuGmKhZJYg5pFiLBtdZn2yH1?=
 =?iso-8859-1?Q?er1TCEhQHnZdlqMjfvp3pej/v7LuWd0g6iPkz5dEXxsSCWcNwn858FYuS8?=
 =?iso-8859-1?Q?C1OvyPZKC3MYdtxsdGxQAFIy8/od/i+9UZuO6ataLBSi7Vc9B+hx252adj?=
 =?iso-8859-1?Q?H9OLs1Fmdcp67jujzZmd4BbOH5bHkrkD+x9b654JyynJwVV3mhex52/P9d?=
 =?iso-8859-1?Q?0SZ1yP9GGwl6Ff8B1cQjr83oKmFRzYrj7wyeah6SYm9i7hbEHhclOrxdZU?=
 =?iso-8859-1?Q?Gv55hNN4rzWPMZPe9Z1N0O5qCYyLT0jvaB+P8oucVQeDBIJeegSqE6Bhy4?=
 =?iso-8859-1?Q?DFQcsyb88UAl8wGv9hekJm8S+fh3upQ6fNuBU4Kjsi2yMgKL5GRWKRLfG1?=
 =?iso-8859-1?Q?iDUutmtwZSCtDqu82e0jiImwuEXxVLZxW4Z33alXDh29VF4zk3k8tGaI6p?=
 =?iso-8859-1?Q?wiZks8EUxwUbFXyEZ1JJQbGxniDg+SMNPVAJ+f6SlVYTan5/iC202bNOZL?=
 =?iso-8859-1?Q?CVCtQQnOagYrMtLkRiTKLEL/Lu+YNLjTO3DT5Az8NqOrndyac/JvYtLVdo?=
 =?iso-8859-1?Q?0s/jNGJYG5zir/JXe/7OsjnGxpbMsQHb417Wr4kE0Mc/jJQ0elfimBQdJZ?=
 =?iso-8859-1?Q?8jaTC6wlJMpxll7pIPiH4SXCdRHieynEaszotjzQ6V29TFR8dZH3GaQSIu?=
 =?iso-8859-1?Q?+gg10LMByh7e6OrX+4NkSTBrL3pEc/7EvuloE5er4usflJd0JTDfzD/27x?=
 =?iso-8859-1?Q?sbS9PosYL+wnx56pR3Fk4EOOVXffWhUrm1+jIK3+nzCWjh2gkl2+3lCGfi?=
 =?iso-8859-1?Q?jh5mYpbWPZiV+olIhchTBczru4CQbDDOH5lm8+k0/JC7VqRGXVgQMT+wfU?=
 =?iso-8859-1?Q?Z1BLY74w2UgLyRw/RYXkie9s4sgyqDc8oGpNs/HcxGKU7HMc2ybkuCG65L?=
 =?iso-8859-1?Q?GAeCyTLfbSbLaLXs6whayxqXIIvyn8BGJ0/i8QcFf6zg5Y1dPkcTTe9NdK?=
 =?iso-8859-1?Q?8cp1rR0w9Iu8IX6VRokm0SA43qkhGtkmeXoT20MRzjLDWd0/V5H4ld9ENZ?=
 =?iso-8859-1?Q?Fha8Okw17Nq7W9YterUpeXp3ZnmFFYAUoj5Eh0x9NpgjSofc6e4RFKrNqE?=
 =?iso-8859-1?Q?i+K8aH6P06g5CdTtAXeyCimWTEMdG7y0I0iRBWHcSfnxwbknxRYfDFSODG?=
 =?iso-8859-1?Q?bXPK5NM+f/YwuQdVqyJCE3iuOmh/WlsD1EdvQrL9lpj9xgIgHOxGjyZQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 408caca8-38a3-40dc-cc71-08dc2cdaaac9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 21:28:06.2439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S0x2XANlsBGhEN9WiE0UjmsZ3Qaj+rNUEm5tpIWP1EqG4zyGRPpplGWz9CUxPSeKKljUb/wdrpaVZOZHAQDuvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6111
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

On Thu, Feb 08, 2024 at 10:35:38AM -0800, José Roberto de Souza wrote:
> Due to a bug in GuC firmware, Mesa can't enable by default the usage of
> compute engines in DG2 and newer.
> 
> A new GuC firmware fixed the issue but until now there was no way
> for Mesa to know if KMD was running with the fixed GuC version or not,
> so this uAPI is required.
> 
> It may be expanded in future to query other firmware versions too.
> 
> This is querying XE_UC_FW_VER_COMPATIBILITY/submission version because
> that is also supported by VFs, while XE_UC_FW_VER_RELEASE don't.
> 
> i915 uAPI: https://patchwork.freedesktop.org/series/129627/
> Mesa usage: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25233
> 
> v2:
> - fixed drm_xe_query_uc_fw_version documentation
> - moved branch_ver as the first version number
> 
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_query.c | 44 +++++++++++++++++++++++++++++++++++
>  include/uapi/drm/xe_drm.h     | 31 ++++++++++++++++++++++++
>  2 files changed, 75 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 4f1ab91dbec58..92bb06c0586eb 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -516,6 +516,49 @@ static int query_gt_topology(struct xe_device *xe,
>  	return 0;
>  }
>  
> +static int
> +query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
> +{
> +	struct drm_xe_query_uc_fw_version __user *query_ptr = u64_to_user_ptr(query->data);
> +	size_t size = sizeof(struct drm_xe_query_uc_fw_version);
> +	struct drm_xe_query_uc_fw_version resp;
> +	struct xe_uc_fw_version *version = NULL;
> +
> +	if (query->size == 0) {
> +		query->size = size;
> +		return 0;
> +	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> +		return -EINVAL;
> +	}
> +
> +	if (copy_from_user(&resp, query_ptr, size))
> +		return -EFAULT;
> +
> +	if (XE_IOCTL_DBG(xe, resp.pad || resp.pad2 || resp.reserved))
> +		return -EINVAL;
> +
> +	switch (resp.uc_type) {
> +	case XE_QUERY_UC_TYPE_GUC_SUBMISSION: {
> +		struct xe_guc *guc = &xe->tiles[0].primary_gt->uc.guc;
> +
> +		version = &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
> +		break;
> +	}
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	resp.branch_ver = 0;
> +	resp.major_ver = version->major;
> +	resp.minor_ver = version->minor;
> +	resp.patch_ver = version->patch;
> +
> +	if (copy_to_user(query_ptr, &resp, size))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
>  static int (* const xe_query_funcs[])(struct xe_device *xe,
>  				      struct drm_xe_device_query *query) = {
>  	query_engines,
> @@ -525,6 +568,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
>  	query_hwconfig,
>  	query_gt_topology,
>  	query_engine_cycles,
> +	query_uc_fw_version,
>  };
>  
>  int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 50bbea0992d9c..0819959a52227 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -574,6 +574,36 @@ struct drm_xe_query_engine_cycles {
>  	__u64 cpu_delta;
>  };
>  
> +/**
> + * struct drm_xe_query_uc_fw_version - query a micro-controller firmware version
> + *
> + * Given a uc_type this will return the branch, major, minor and patch version
> + * of the micro-controller firmware.
> + */
> +struct drm_xe_query_uc_fw_version {
> +	/** @uc_type: The micro-controller type to query firmware version */
> +#define XE_QUERY_UC_TYPE_GUC_SUBMISSION 0
> +	__u16 uc_type;
> +
> +	/** @pad: MBZ */
> +	__u16 pad;
> +
> +	/** @branch_ver: branch uc fw version */
> +	__u32 branch_ver;
> +	/** @major_ver: major uc fw version */
> +	__u32 major_ver;
> +	/** @minor_ver: minor uc fw version */
> +	__u32 minor_ver;
> +	/** @patch_ver: patch uc fw version */
> +	__u32 patch_ver;
> +
> +	/** @pad2: MBZ */
> +	__u32 pad2;
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved;
> +};
> +
>  /**
>   * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
>   * structure to query device information
> @@ -643,6 +673,7 @@ struct drm_xe_device_query {
>  #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
>  #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
>  #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
> +#define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
>  	/** @query: The type of data to query */
>  	__u32 query;
>  
> -- 
> 2.43.0
> 
