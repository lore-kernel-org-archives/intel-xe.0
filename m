Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07432C2BB3F
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 03:38:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B491710E056;
	Thu, 16 Nov 2023 03:38:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4EE10E246
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 03:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700105925; x=1731641925;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=lEPPbdyJSXEt2+Ll9eXdMELveWfohds/QGGnNxK4LLc=;
 b=I2f1JnS7+DvQ+CQCJGO3G8iQHr+bKeSqGGjZTMBeMX90Y3+WoomybcT8
 69grcW91OPSVFZGt2os6JDmBDs4H3ENr0FTuhY6e3BHLcg2nKaPGmcrh5
 srndOAIxqttCe3O97DznFN3SmDHrLi787joE+iCt5bK4F6at9/jSfQ1yR
 b8oWRJBERq0Hq6SyhFyV2fgPbjpwQqjasI3RgK4m2mjuD0F6HQ2wnHuH1
 RcEDfUhdSHgR5g8uMRyufywri80ElQQ9eGZofZ4+Ji3OM9+lIVEcYptp6
 fpb3XBBwQxU3Mow1BbMyuNUCSQavLaUInG+iaWjpnxr7F55ZpjRinJg1t g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="388173041"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="388173041"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 19:38:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="758693871"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="758693871"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 19:38:45 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 19:38:43 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 19:38:43 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 19:38:43 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 19:38:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EOjKB33gQkDlkyy+CZTdojgHKPe7rrU+hGQKTKCjU2Nt+K/k3xG/F/NXiuK5RAqvi67QkO+MYIvOJ7TJ/PlxrTRejQu06WFdWPPxKlMks67eLq+D5KOH2nPlhYb7Y5wjYG/wd48XlUH6F+DFPWo7+Lt7IgW+FRGXQwCX5igJHNeA4RwF7HFNqcAVbiypyOlpIJ6Rg7qeDL6aVMi2CiEpId/laRYEGDaqkdXMd8UagOefG78JNvBEqlTpUJNuYyTjJg5NC2a6mWU6kWJIAwqgRZi6XH8mkKg9cNX763/ZB6Mwsn7Y0393iPgalrxeDiX9ka5p7Wst05QfO9TdA3Fwrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1mgsqtDpFfvgFfMK2P8R54ltFxi3LK9fS4eTHA/3MNQ=;
 b=He468I0Q67BqY3ao+ZP9dSbRbBfYBgfqTVFvFYazs1qv8SA+JGd3vIjCIzqtSt4fD4UCSSWQURFBVekIIlAaRZqpEpcnBLV2O8We5qSOKFLlH1+45hFKFsAbu8F0ZJ8RpoqFBL3fkBV7YhtjhWPUcGYmCdrtwYH1KsgAq7pd2dWWRtr0qV9rqvQ0c+AWh1h2b2p3IIC1DXlPyHBId5z2nBB2nnb+hpgpxlSCcKRiQ4M/ekcS94B7i3Wc8nm5ZcK0VXkUXZ8hr3iMW2R7Oj3PC+bkzOw2r5ItwE5VR3hk3ORc0TP9B6eYJJaQ0w8HiZDeKhZPk6EhDlbgwZStfxa0qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CH3PR11MB7299.namprd11.prod.outlook.com (2603:10b6:610:14b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Thu, 16 Nov
 2023 03:38:39 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::787c:c5fe:c197:443c]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::787c:c5fe:c197:443c%7]) with mapi id 15.20.6954.028; Thu, 16 Nov 2023
 03:38:39 +0000
Date: Wed, 15 Nov 2023 19:38:37 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <ZVWOvYHDj5Uy9wQK@nvishwa1-DESK>
References: <20231116033436.1713-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231116033436.1713-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BY5PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:a03:180::37) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CH3PR11MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: dbf25b01-24fb-4290-36c5-08dbe65585ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xQcQNhAoNCW5n8WW6sd8KAzUAaOyCMzws6tb3pfY8hxXOqZJzXtizgTJdEdjfloQCgmQIWM5dhPFwTqh4u/JSdqGMp0wSZu06x3SqICnEJxFketxK2QmmfTDhyqJBgz/+OLRIPTGgPR+l4eDF43lZtdJYp4GV/YJ5Y8Ri5wn7qQbIhptQiLpmlEzz7tOHmCkrE94TGcf7aBCBM6apofNKmPEkuBco140l0rHgt7fEdeE86R+5Kspfekr/TeUGNbwrG0MwbqfnKWch+wf5sEqB2jbuAk7r/INUkMa5ZAF6v4+9HnA0na6lhlLItQSvhrLzlJw2/UHXqDizGzKE0ZwLDprQUdf9iUE4wEZTIyM87hveeYqmh37T4BrnWnfMnpzOjdC0VGKc5FV1ujXFzGPxNZHg4NfJ4e/MtFQcKyR3A8K/Ey6qXBsfFLj6DcXWgIHt/swH0sAzpBu++3Du76MteH7CowfZe4uV2YZgU1yBDKm56yqLRY7tI6W+q6FkRafPSg1p50v+4xV9rfStjX6Qqb2OyyyYDc8M6E+EU9vFW5pWdYj4QpN9IPJqCOU5ysffwiYoPbamoJ7hsM2YouKZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(376002)(136003)(396003)(39860400002)(366004)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(316002)(6916009)(66556008)(8676002)(66476007)(66946007)(8936002)(966005)(6486002)(478600001)(41300700001)(86362001)(5660300002)(44832011)(2906002)(38100700002)(26005)(9686003)(6512007)(83380400001)(82960400001)(6506007)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YdoSxHCQlDym6kr4YimlV6FiA80oiiGnOJgeXaR3x98TgUFifDnLoTzj9GxG?=
 =?us-ascii?Q?R2ww6PTEVVP9TbAtLk7Hk/uxzo75X1FN/Ug5+oQMAi7K3gOjuq4U2joNB+Zt?=
 =?us-ascii?Q?ydVf8VZrJsPIDcts/BL+5Zj2QdkyMaFmiegUUg9rRSq0E39ODeYJWOFsehzt?=
 =?us-ascii?Q?dmug5j438zcsDniWgQXJng8IjGLkxLMs4zSUlUmLM+b2UQITIB9Xd0Bve6z7?=
 =?us-ascii?Q?RK9c0T24VJmbOiCFsG3dVGkE5W/RbH5TJZyYDlTCwBe9GFEMeGduZoLZGv66?=
 =?us-ascii?Q?gXQ6v6fCC1myFxHG6iKq9zOp0enSe6udu9IoPfVQdOdtIPGsaDrvJgwvis2a?=
 =?us-ascii?Q?72LbP9WUosIS8eYJOSLR9uyzBhxmr7HwMtXFcKLUSzCa8yl7s07mYOJ5BhUe?=
 =?us-ascii?Q?/yzFzTOcr9QUZ3fImfdM5lDF0uu/60hXaC/T8aVrctrjKXz13Xg1bhc1BCFs?=
 =?us-ascii?Q?UE7aMI+GFiYSCeoAe7YX2atCh54TknF8cSq1aMhIJ2bXDwNS2VLidPGVVHnR?=
 =?us-ascii?Q?VB0mLdpPRbCmxbpC+o1csRInMPsA1LIK9Op2cXdQtsUvuYl6IODd+kjTkvMe?=
 =?us-ascii?Q?r2RMYS4VrRDIBNzIQP6AC2iqownH9x9OiGiV7lHq/2OTDQjHThq2Z398I2Zp?=
 =?us-ascii?Q?E/1Rs+In498376J+QnQPaINm/TiTgaJNpCLd5m7w3L4IAkcJD9JC9nTCZoih?=
 =?us-ascii?Q?El7Q/r8MnbxDTZPjbfmavp5HpkT+SuQw1DsoSbUQzZtlw+1EusaszWihb7J2?=
 =?us-ascii?Q?VFhz9O27YnEHM6B6e5HXmLRLghU3xZVWYXhbfGT+X98RHVcD2iD9tqEYdPa6?=
 =?us-ascii?Q?UTW753Odce2iAxpuMcugppo56yjjyM0E9ifl7uk1ikMqFS6mZRHeJuc/kJcn?=
 =?us-ascii?Q?WX3KjWoCKUgXZfk12eo1hZRqqhsR17SS6eh8HIQXLPTpAybtrJsYXDYI9Emz?=
 =?us-ascii?Q?XUwksuHlGvdIBZ+oSk5DibaN+xUxmEW7aalwIXkSncDDDm9cWgazCiA3e8La?=
 =?us-ascii?Q?gzAzqVjItvk9VQwAUr+JBrzAkTDYLWuDOfSXeZYQJTJQL4MHH8uD0gPbvwqz?=
 =?us-ascii?Q?ZdAYW6wDImIoo2k0QGUh2TD8zZHN3Jz5sDP2EjJddfkY1Z0Kd9eVR3p9Xh++?=
 =?us-ascii?Q?maVSGcAhhojHlm7VD/27SShiDTDeVl+eN+4H8mS+PkRGe+CDTwg5NhAKiL1C?=
 =?us-ascii?Q?wwqn6z8Opm/XKs/nPWp9ESavjVHZnzrkQC/+jQBylksG9WEjPs5x0qlEZbxE?=
 =?us-ascii?Q?aX/WNBQEWpMmdwI37mlt0r9jFQDjd3JXzf311mf0sxDAKAEZOdabVWyMvctG?=
 =?us-ascii?Q?6TVpHe4f3QDcsUY4tBLSu9q8G6e7SkYcNKoZcsE+9SNR8q7AvczTtedEfZZx?=
 =?us-ascii?Q?oAHruQHQkY+u94D/DnGq/IEcIVFbKtNK+N/v8CZiDojQvOc5PSyCALqyK/E0?=
 =?us-ascii?Q?zDOTOsjakjvsL9OFjdoF6z7gW6jdb9bJmFp4v8N2pP9G8+QcadUSrzBpyZMC?=
 =?us-ascii?Q?oc/OrXuw/j00ywpbhdItb+EXen0nlLD+y9aFWub1yPcl6w01J7c9Fski5BfR?=
 =?us-ascii?Q?QRu8nKfGEg1XUVx3chLx6MbCayrOKIOdfa4MNUAdYS8rQLjWk1lAOqpnfTIo?=
 =?us-ascii?Q?06V6Mjpj1XFnFyyrZqq2KnA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf25b01-24fb-4290-36c5-08dbe65585ad
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 03:38:39.3789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: INY7r0rJTvp+OObJad03wNIti9o7WTUx91h7HXcL0sjh9NFBxXWrPHQzfklJ9zNMpEsygLBDTaxj1o27gX95Bcl29LKEk+haSe3EPbGR1WspCOT7OV20MYkcLAEDGLIg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7299
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/3] drm/xe/pvc: Enable fixed CCS mode
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

On Wed, Nov 15, 2023 at 07:34:33PM -0800, Niranjana Vishwanathapura wrote:
>Allow static assignment of compute slices to a user selected
>number of compute engines. Add a per-gt 'ccs_mode' sysfs
>interface for user selection. By default assign all compute
>resources to the first available compute engine. User must
>ensure that there are no open drm clients while updating
>CCS mode through this interface.
>
>Support this mode for PVC which can be extended to other
>platforms in future.
>
>IGT: https://patchwork.freedesktop.org/series/125873/
>
>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>

The previous RFC patch series is,
https://patchwork.freedesktop.org/series/126365/

Niranjana

>Niranjana Vishwanathapura (3):
>  drm/xe/pvc: Enable Fixed CCS mode setting
>  drm/xe/pvc: Allow userspace to configure CCS mode
>  drm/xe/pvc: Avoid any races around ccs_mode update
>
> drivers/gpu/drm/xe/Makefile          |  1 +
> drivers/gpu/drm/xe/regs/xe_gt_regs.h | 14 ++++++
> drivers/gpu/drm/xe/xe_device.c       |  9 ++++
> drivers/gpu/drm/xe/xe_device_types.h |  9 ++++
> drivers/gpu/drm/xe/xe_gt.c           | 10 ++++
> drivers/gpu/drm/xe/xe_gt.h           |  2 +
> drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 73 ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_gt_ccs_mode.h  | 22 +++++++++
> drivers/gpu/drm/xe/xe_gt_sysfs.c     | 63 ++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_gt_types.h     | 14 ++++++
> drivers/gpu/drm/xe/xe_guc_ads.c      |  3 ++
> drivers/gpu/drm/xe/xe_hw_engine.c    | 20 ++++++++
> 12 files changed, 240 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>
>-- 
>2.21.0.rc0.32.g243a4c7e27
>
