Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D241D64084
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 20:10:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA9C610EA34;
	Fri,  8 Nov 2024 20:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nP3eDTmW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C556F10EA34
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 20:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731096627; x=1762632627;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=40MyugEUVf8Z40+awpsVGv0RvRc1fqJb6mHWiQSFQ4c=;
 b=nP3eDTmWnPXHbfioATcv+JsnPnAQ2/Xsr1gtqiDesImrOwKdQMgtJ+ts
 zfHs0loNU2qsn0cBOsrNoDAe7iZhfNeNw3BKigmkK+cD2hzzvw6YbL4CL
 nfJR8D4vTikk7CxTzCQJGzKD6qGjZg0sW7cGxY6rqTP10x6PdaNtdznYX
 3Dn9SBLYkFxoNpoilUXlniXlECnnlDA8SShPDOlEYWL6cIP0c6SqGyUFq
 gNTcouKDPhtkxrMVO5k4z51WNZq2RQoXSxsBl3T2EKC65Z7AjNIGMSK8a
 2vrm9sagl/Zp/Mhu/CGXelafjQ+mZ53+boW8TR5KXFh8aday4xcwsoKkF g==;
X-CSE-ConnectionGUID: f6jckG6lT+2oDDJi1bQoyg==
X-CSE-MsgGUID: I4TqVAZjRFmQf5WOEibOHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41557431"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41557431"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 12:10:27 -0800
X-CSE-ConnectionGUID: cmRB0B42TjK8Zisu2SuYUA==
X-CSE-MsgGUID: e+kh6ZGRTNy0/+tJPSOFZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="86507408"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 12:10:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 12:10:26 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 12:10:26 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 12:10:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WuIq2hXEqF8tkCmQvBLXwWPFVD5fN49H8DBR4K2raupJCExbFR9WJqFUrMlRTvfpdB4IvZ7UwpQ4jeP2l9hAawX8vyc7BVZVEOXZ71TYFTLypOxb/girG3Es8xEctSGVt6z+7sFVYuCcMJZvfLkO9H69ZNzh8MwtcJm0cAuQQHE5tPMJSFCS834oPUfVpfI+0T6cg4tc0WykkBtHEzESj8Fi7nBfZByLIqlT96wRmmXXA2MfaySUOTDZA6NCxMdwpJ6RsquWYtmlD9lpXqaU3P0ym9eSH66I3qUpVr36eI6ycEYWP0Ig22pWE5tp+5UkzpZNliEp0k24ikLG+7127A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRQ//HEj5QbMSZthSfNj1loNT14W9Lp+fzMrnz/GxXg=;
 b=sHZzPLyP0aNTsrfB0Bd65SlSWfdnd9J9lCqo+cnUGSqUbCWnmhDNo0uMaoKvVAjwMMcfY57Q9lOCPjUw3MC35Y2lm56RcY3gj1anUBY2mB3Winm5ckWNZ40GYF7F0bfUCD1VGOoWjlrBPhbPofLjcH6b4iHZCQD+siyDcGRImJME6dz3XCdx8861Uek61Kz7Fw4Gj8NjIz6tjwywjXJDt0vaOl0naxn17yEA69Z6NykduhJpLVD3kaXBzjpadFaWsbHxNC26nS8nPB7int+nDnfO75MtPsTt7E9GrWCW+Ma+K5m7K+r948ZrIvBsUlepa+VXUSKBavsqW9jqwE4lyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA2PR11MB4906.namprd11.prod.outlook.com (2603:10b6:806:fa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 20:10:18 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Fri, 8 Nov 2024
 20:10:18 +0000
Date: Fri, 8 Nov 2024 15:10:13 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC v1 1/1] drm/xe: Allow fault injection in vm create and vm
 bind IOCTLs
Message-ID: <Zy5wJSsG8ppPCg2A@intel.com>
References: <20241108161307.1203967-1-francois.dugast@intel.com>
 <20241108161307.1203967-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241108161307.1203967-2-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR03CA0135.namprd03.prod.outlook.com
 (2603:10b6:303:8c::20) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA2PR11MB4906:EE_
X-MS-Office365-Filtering-Correlation-Id: bc9e8e10-ed4f-4056-671d-08dd00315dbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AOEfXSPh2PKNX8dKpu9pBSYk3Q6D1rMjiR7hBelLa9M9FGFfBPBQZ4RSENgB?=
 =?us-ascii?Q?AHbYys+B3YfsfSb5EX9WkWKF5s620MvIZq7IG1ysYB12JocNMqqxciruhzmJ?=
 =?us-ascii?Q?ZHU6eLcelAC2pj77w/0HX7xNrnr0j4MmuKXShi1agJ7sy999imQB9k6rkeGD?=
 =?us-ascii?Q?W370yPu5kSo9x7j7N6BtW3rGSUZ/ciZEnMITVIQ2kuNZQA/9z+IL6pEMWhxn?=
 =?us-ascii?Q?Epb8ChuT5algpmgBI9sekCe92NiehS/nEyQsfCc0RdjPQkVXO37OFkplYZN3?=
 =?us-ascii?Q?SfTsoVZrcsbvdhcNhYB3RM6UL8o+/luIdlMzlzAg+/pvMNFC5qEcnMOxJYwe?=
 =?us-ascii?Q?eZ7vPTAEHA8/d5TexAHYdf3R5qSgRYr3A+tfjfhlPNjMNNzxM9fqDYLzUG4J?=
 =?us-ascii?Q?KsOlGDZESnmzyAU75ZPbOsPrW/p+gDsd8KTSUOButgKA2xuVs7ajMTC1+UFs?=
 =?us-ascii?Q?FxqQYLguf6INOJQIM7kDT6GGTtbrHdbXT6yE6+HA/EVIUoHCRheDyaf7QaYy?=
 =?us-ascii?Q?eQQ619MiRA7xiNlsxKXGkKZsGaeS4EQzHdhzaJpNuANrgrcNPnNhqOLRarf6?=
 =?us-ascii?Q?HSMSqZwMR3xNuOnvp92cShE27GEyPRp7kJjn7UZD11BmLNSF/dZAp/KkTjl0?=
 =?us-ascii?Q?/s9k0XaGQK54Erjn8g32ceiyuTyvXukm5LJ2wUGSqPgYhL3GX5m7n7D0xFzb?=
 =?us-ascii?Q?2sesDnZYAeRMAGia1wPof/G6uf+BKPpzgFo9nfrN3ogMyCBnEHQzgj6xWOUY?=
 =?us-ascii?Q?5emNrEC08zkt2h7bcMkJk6oOhtR4jhv4zAGn/BaXXDxvrTIntbvwJQ0cBifn?=
 =?us-ascii?Q?Me9ptn5y1oWr7dQlsZOjOdh9i/seoRsKtc48dHyzUUbEGplADhLAoczeo9Zr?=
 =?us-ascii?Q?YUwUkGms2TECmEh3K4nrH0r4/1zLqyI2/F0uJNJI708QIquR5KV1sAiv7OSp?=
 =?us-ascii?Q?twJDX23Qvndi/h73Oz5cBygZK5DMaBWp15egh2IIWdF925OSa0G7FePk88Z0?=
 =?us-ascii?Q?4eFyXFFGTCT+F+uBn/KcZta2Dgba8R5GrWBlRndYjF7SIRzjF1UsJK2Yjz09?=
 =?us-ascii?Q?bVh1kB+ZJQauq9hJfzKjK7Rf2Qsg+i4Y0sXcHHoUQRWwXxcEsDbmQfHNBfPa?=
 =?us-ascii?Q?UysYkShx4kcyWd/7NJdSiHgSkhG6YxbZvSQKiFMgly9UNzyBAPSUwnejxrAB?=
 =?us-ascii?Q?vvb2VNt7a8IFB+Qq4tk9dFOBruDXqSRiAcwSk2KeNFRyP6oNuuu68+eqZpXF?=
 =?us-ascii?Q?6YRaW+UGFOQFXuQuymZP+jYG0CixD8ZqA61UQbWXDhf5uJjf7T+md1Q57iTA?=
 =?us-ascii?Q?YQRdcH2Q4IAb3dNuE2uzi/Sp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+X4G4+vo/t4ElA68DmDgiVvr+L8N66BTsyfRKyVMjKUxSWtRrwPk3+vd5ffF?=
 =?us-ascii?Q?dbDu/EJigbh8OX0erIHc//KpbsOAzEV6FlrftLXMlUmMvlik0eM37Uj8yxC6?=
 =?us-ascii?Q?hf4J4aYbwjcFn461tOG0ul7Y5zyCQv7GE4D5p600NpJASHzlimYgFtH7Z1T2?=
 =?us-ascii?Q?qWsy4JT3Fd76LVYxmHco6InqlKVutjsiHXpOdkzVeZTkvxGkFZj068toaxVD?=
 =?us-ascii?Q?2lbZ4yZHKvAZET951Nu4LGYF/C+ExZ9X/Lxzyh34qzZTzSrjekFo1WC6KaQz?=
 =?us-ascii?Q?A8Luyx/6bGqyku7mcbmMfEb+bjz0aC5lzNjeHTCvQmi3mGtsXVcpQTUIxQSg?=
 =?us-ascii?Q?LUfwb5IcOCt2ai2JPBE3U6GunrjJre3hxUJ1KY/jgKhri7lcHmT3xhg95tdf?=
 =?us-ascii?Q?VLEF0m9nLWDRUGJVueVhOS22Sqv/1ijSVDvz1Ii8zEo1e1vOnBwNeyw49x7l?=
 =?us-ascii?Q?C7GGcCU0X8KLTS35HMBBGt2IP7mkBuM5hybmFIkvT4Gf3pLI6COpQoC4OnFn?=
 =?us-ascii?Q?d4QwaxrHM1qCLwZa8LDUO9sMmnRgsCraJHieoeKb5y1po189ZRkcTfJiivlS?=
 =?us-ascii?Q?aB4gP0/0+OPwK8qjbn+MIhGOOvipnc7qVfuq4dc3IhPK7Jj4rOTJXGe1UBhm?=
 =?us-ascii?Q?6R8kVYoc012TkIlqi2t/QJlyUqve4k+yapxi1oCuyQFoJnWhJNI4aI6m8+6p?=
 =?us-ascii?Q?F5wQba1YoWlzRZtSF/K9/6gOcIuOC4QNK49YmFgrk3a1N37aAF7BRd0CGV8J?=
 =?us-ascii?Q?NvvoqQSKP0+nxV/vXQLvT+sULCvzNH0AzFD70NOeY/ORWIivY9vftm1O8E2q?=
 =?us-ascii?Q?/omdXkD/SKE9fWYHoYNFsHVrO5e6QMwHZB1A1g1AGWsQT/Nu5BddnZue9ouI?=
 =?us-ascii?Q?sf9mARGrLQFgWA44e2ZwHLSfOO/0y/TaOItty+AcVzv/2e9+kQlw37Bh8Iam?=
 =?us-ascii?Q?Pnh0WKBL9YijjZ6CmCKMs6doxV14zAdLT1DdSqM3/m0cF70hxOoQ59bRcifX?=
 =?us-ascii?Q?h046jS/SobDcE1bYIO5/o8yburt7pqn5bR+XrSxg2/+MU9CkW2L+T9SvIXZ7?=
 =?us-ascii?Q?9prfoH0RdtSHGjlYZpU5ermwDC//OZx39ZMHPCxmz4LrhGr76u3uixwoEYzZ?=
 =?us-ascii?Q?QZ2unKAjvSL5Kg/f4i9bENteh4Qp2OCCxST44M3B9XuXDJzFBG8Nqk/VP24H?=
 =?us-ascii?Q?95lGWYnFVJqi7XEcVDIPU2TBtICcjtwYzH08lYBwvX1mAZinz+6Xn0O3F+9g?=
 =?us-ascii?Q?Ir4xSIMR4JbckEg16P3SCVbaQxNjUFLXnd9cc/xKi8Sa5gIZsjwdDsUbE9DM?=
 =?us-ascii?Q?OPqLt+AXjP0/uP0JmJ21We3oIzd2XR5e6R9bEt/wDqnUKk2hxdTrpEj7Yk+J?=
 =?us-ascii?Q?NQ1k1tew8ptEvKOp18Q7nbesDuh1v3uxqd/3vlO97tTHF9LmqlxCQBRnkw3A?=
 =?us-ascii?Q?d7Llk2kJMKcbAVcitOkXDVcdv1uZJLMdGV+kyC3RT1ewt7T7mx6B5Te9loIK?=
 =?us-ascii?Q?NQ5mdad+bU5+Oxb+S6efzCzCZiyxvVeDGxY9SFw2k2WVG2AFx2sxd5Kq+jrs?=
 =?us-ascii?Q?efAm+np+dQNYLx21U2SRUKVrLD6+52Y48gfujKL5YVszp+a6HPAmAENBluzq?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc9e8e10-ed4f-4056-671d-08dd00315dbc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 20:10:18.5495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: twoHqd5ZZbpvWzIdpkgyg/bURaSq5Q7fk7NJQzpeEZv8BQN8sfACtcH797L5G8AYh9jE+Xkr6AaJnPmGcoBX1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4906
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

On Fri, Nov 08, 2024 at 05:11:56PM +0100, Francois Dugast wrote:
> Use fault injection infrastructure to allow specific functions to
> be configured over debugfs for failing during the execution of
> xe_vm_create_ioctl() and xe_vm_bind_ioctl(). This allows more
> thorough testing from user space by going through code paths for
> error handling and unwinding which cannot be reached by simply
> injecting errors in IOCTL arguments. This can help increase code
> robustness.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 1 +
>  drivers/gpu/drm/xe/xe_pt.c         | 1 +
>  drivers/gpu/drm/xe/xe_vm.c         | 4 ++++
>  3 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index fd0f3b3c9101..b999db5f5c19 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -240,6 +240,7 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
>  
>  	return q;
>  }
> +ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
>  
>  void xe_exec_queue_destroy(struct kref *ref)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index f27f579f4d85..e111698abbd9 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -136,6 +136,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
>  	xe_pt_free(pt);
>  	return ERR_PTR(err);
>  }
> +ALLOW_ERROR_INJECTION(xe_pt_create, ERRNO);
>  
>  /**
>   * xe_pt_populate_empty() - Populate a page-table bo with scratch- or zero
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 624133fae5f5..2e67648ed512 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -740,6 +740,7 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
>  
>  	return 0;
>  }
> +ALLOW_ERROR_INJECTION(xe_vma_ops_alloc, ERRNO);
>  
>  static void xe_vma_ops_fini(struct xe_vma_ops *vops)
>  {
> @@ -1352,6 +1353,7 @@ static int xe_vm_create_scratch(struct xe_device *xe, struct xe_tile *tile,
>  
>  	return 0;
>  }
> +ALLOW_ERROR_INJECTION(xe_vm_create_scratch, ERRNO);
>  
>  static void xe_vm_free_scratch(struct xe_vm *vm)
>  {
> @@ -1978,6 +1980,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  
>  	return ops;
>  }
> +ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
>  
>  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>  			      u16 pat_index, unsigned int flags)
> @@ -2697,6 +2700,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>  	drm_exec_fini(&exec);
>  	return err;
>  }
> +ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
>  
>  #define SUPPORTED_FLAGS_STUB  \
>  	(DRM_XE_VM_BIND_FLAG_READONLY | \
> -- 
> 2.43.0
> 
