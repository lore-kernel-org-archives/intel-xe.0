Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285B1CA0EDC
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 20:38:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5D910E222;
	Thu, 14 Aug 2025 20:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ulaq/oMF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F76E10E219
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 20:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755203888; x=1786739888;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jlzkoslavZljlQDBBnHWempfWJ02qnpWHtAcDKdRTbE=;
 b=Ulaq/oMFPlKDXPiyhHmHBIfZyT8mr4mqWV6y3JEPkaRdG2tJcDQkErED
 D4dDd7q5FUdbVEoQ4ttiN0rO4jgep8HwRRWht8J89gphjtfyOmgWt4XYc
 QFfY17MfacVxEZS2AkI/3rjHMFaRT6RyAsPw0xdOBqi9qaz8Y7n3FLpdD
 XiNUp1wHwHk1THn+li/R9iXcBKozHwi8WTC/fClw6ewSzgGZg6lRTmSiI
 yy6aSFpWfnMIcXQKNM2Ricv06ZZfP/7clDZu79p9ExbQoXkO16k/1yHf9
 xKlw/boUcdgEmU2ea6qJYrpQAF2MGrW0MHdRKkVxI+YW9npq5DdqZUVtH w==;
X-CSE-ConnectionGUID: 42PrJsPNTFetdbgOEysFxQ==
X-CSE-MsgGUID: +Crg3LBsRtCOmtjG+igNsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68137426"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="68137426"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 13:38:03 -0700
X-CSE-ConnectionGUID: /4LNAeF4RKa/TCrfg4jH2Q==
X-CSE-MsgGUID: MwKdK2gFRm6Nv9kDbrXsBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="172180634"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 13:38:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 13:38:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 13:38:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.76)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 13:38:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzTU7kxaiDp8+QAEZj508vinPDvjb0lftzpHNoxgBBBsEhJvCtPGRJBzIIUUZfdJmXdSd9/ADLVAcy3XWebZGkgm4PNkJikQfR1J9gtUd5z2YQ2PgqckEBnv+eAoscxVt7sjCdOLtdXJoGRrIq+p37GMVc2E4Ugx0OXxVNrtw1sY4EwQFwofGVExXWe1/crO/i8R6s5fio1zwgMpberbBqYUb38xN4l7MvQeX3Z/HRDloFQ4F4Xb5+at2REwV5wx964kmx9JjdlT63nGyz/nn/CvMhEQtPqXaL+QkAXyKQ5z18jUHuljE4TdHHK8whYTMeRj3JWCdymDSeQ2/3FZxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAUI8WgSY4NosdlLhDMLyWfkY/4YqAKAosD8+lPfEgQ=;
 b=Wi7y1SVe5B8hIMg6LHdHf1I3IP7R99QXcr8/MUM7oxOgAs/9YJmBJ5syrkwNjEJTWZSinyGRbyGurDDtv0vKwJYuEHxU6/laypHGPIsjPN56x4BzHyL7ticxfZ0E84GkgE7fZhvYvv8VjH1/rKNopiMsS5y1q0F25Zw/wsKMMjjZ/5rSmiU9PwWeUoHs6rdoG1AmVBY8+/CotOp2GPdsWOlkpReIbJxBIfYJvCqC6y8IEjPohiFer2oq35Qc8nDD/OgOeN4eq74kKlxbioX2ll8pbNMO+yTxJ+Qr4XFkTjwr7bs2oWF5jbrVA3Si3bNhAcAv7fWnemrFvwVVcC/g+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH7PR11MB6547.namprd11.prod.outlook.com (2603:10b6:510:211::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 20:37:59 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 20:37:59 +0000
Date: Thu, 14 Aug 2025 13:37:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH 11/15] drm/xe: Convert xe_dma_buf.c for exhaustive eviction
Message-ID: <aJ5JI3mOyxeNYS2c@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-12-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813105121.5945-12-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0183.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::8) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH7PR11MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: e46ca040-d79e-4756-e220-08dddb7274d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?76LzjL1FfROnhF23LoX+Uei2A7sIa3Bw95zkv1r22m4OAFLQUypLPzUTQp?=
 =?iso-8859-1?Q?LLGzNV9FYVbrTZ1ezjYhySdE5++HGSqgYuYgjEudmggaY62YhjabtC4kBi?=
 =?iso-8859-1?Q?DpXffnEY6AKZnIRg+nNTYSWXQdUfaTkBAKJN+no9Q2wrWVaHWiTlppzYgg?=
 =?iso-8859-1?Q?cwaMkM6V+4IEDka3Jqfv5hfMd+arXfnVmCdlZNVf5VLl44ao7HQuZUttim?=
 =?iso-8859-1?Q?Qo51BKx/1OoTDtkIYP2MmW9WTsPhO9+dnIQq9xkI5bA+pIKIWYW69CZnE5?=
 =?iso-8859-1?Q?BFEOQLm5eG7J/vq3mAZh79bSwwW4KCiwKArSXRyLq0h7PwBSEqtG/GbjFB?=
 =?iso-8859-1?Q?76HNoqvRH5uvLN/fef6DWXtg6+2MZY+NxGgauljeC2IZcucEZ4b74PI1Ar?=
 =?iso-8859-1?Q?Imr+ECXOZbPxaqUSBNywqOrxitJzfS4rjinEmcE4lK/aHBBTAqWgDdyJQD?=
 =?iso-8859-1?Q?+jeXngG+FaK1RzcPPbQlAoe75GyZmcY8W4qHr3T13YZQV5W09/W0SQHmKs?=
 =?iso-8859-1?Q?tKUoNawRPsbwX9dJWaW3xbjHj6aTEO86hiAdu8gLPsgqBPwOEdO4MWw07p?=
 =?iso-8859-1?Q?L6f91liBMEfnhlEWG/gwQAZ7L0wn5pJ20HCh3HOuTj+NHFK7SPRl40JWUS?=
 =?iso-8859-1?Q?rxi2GTNDbMUMXgXbZ2QUiOXeRKUsAO8de4FqfZ44qx/Clgk41o2wTuPGHA?=
 =?iso-8859-1?Q?HXxYiVOvdHlwCmjDe+ZMH8Tv2sU462aRSMQfIjlgG6C+uu6fSGMmsN3/i6?=
 =?iso-8859-1?Q?baUpzYgULpgQlDdW1pKVCmL6nDnToIEf8dDDPNS8rphkK4O5urH6JZ3waQ?=
 =?iso-8859-1?Q?kHtOoc7dTalG3XidIVya82MFnDXZwO/bGK6rGxCfAVWGD3sS+EEtRKHJdd?=
 =?iso-8859-1?Q?QNQDiEhcvPsTNDDH8ayXGJI3NRTR6c+YNvV2K74Ez+AKgMksyfDyYBwfYO?=
 =?iso-8859-1?Q?BRT7UuopkIRnRV1SK0xjC7xafL0JmrrdE9gufouUZPIiogP9UdS+aMhl4P?=
 =?iso-8859-1?Q?8HESzaMcugm9DGXudipFgb83r4OUfuGYCcOQ37QbVVSUISyR1LDa1L1n+g?=
 =?iso-8859-1?Q?S9BlMZBnFC4gFUTjiYwPU7prcZDASgPLE8T0YyJiR8HcP651AEcC8uogZs?=
 =?iso-8859-1?Q?YzCnJYu2NnicDanM/wkk+io+zoB6T+eGt8wF10C0lWbVu95LHZcQVX6Ojb?=
 =?iso-8859-1?Q?FrpLAYPEu29pHLVCEecPgXCWg7exnTZ/Ca+bMayFQKC1IAeMHAlOBQp/2Y?=
 =?iso-8859-1?Q?xtBxJrB9WFdYt8wr6f31X49WE4uzZRB7o2sEjwFcigyIE46XiNUYBB89gV?=
 =?iso-8859-1?Q?O4+relP/mMNA1C7hclsHTbZaNbqqVi5H9lg3MP2lk+LMEnd2CAJl97ucsG?=
 =?iso-8859-1?Q?8NkGP3MKX90t+AkhzpukOfVWdk5HjC7bT3nQ8YDqhTz4ZZu2gR/HYPGAX+?=
 =?iso-8859-1?Q?xeyPt3o4tgQitrgeTMwW8mqdU7hqjZHI2OsLQDK1PK6QdLcVYBMFifuLCq?=
 =?iso-8859-1?Q?U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VsAd8XVNRKBCX370Q4wTFUj0YCoxNJi1EKKWVr7hBwc/Xo32Nrv+WAWe8N?=
 =?iso-8859-1?Q?0VHRvS6yuOwHjSziWx58o/wdclQKcoxdt6TkVsRXXw53GSw2ojDpEl/DEd?=
 =?iso-8859-1?Q?rc7zpBJpmF501de9kgoZHlkjdl/a1S7dTkFuyiEQ6U/hnQdiWCJB+iA2AF?=
 =?iso-8859-1?Q?+QPNb5XHfxEO5UYktuVyRdnU89+BbVMVSCHtB5QTGA6jRc2Cc880amQZBy?=
 =?iso-8859-1?Q?Z+RQMcrFvFIOGXETY7RUDFToZiIbgZhS186VOplPOpTPPYBgpS8BNbDS+q?=
 =?iso-8859-1?Q?+66x2tGEA60YoJV2q9V8GSA6Q9IC7zIWxIi0svPsM0yO2Rvh6qcQu1o6WI?=
 =?iso-8859-1?Q?vFUPBwftIBKXspU89QJ4kaDKvCh9Ge1dJ9LgET7ateDN3yXJLXPfV8XmE/?=
 =?iso-8859-1?Q?NRpGvuhwRu3FWDVYMsm2xqg0saRX3s1sYNJIz3+jl8n3poeu2MFRnJcbM0?=
 =?iso-8859-1?Q?wc6wDt8A4apYODPHN+wb1mPXAjw4fJrrrunRid07YYcrOvrAed0owrDR3l?=
 =?iso-8859-1?Q?qejWorhKkLD+7a1YLnrNv00x3EijZzim4QRmW4M8XcBmOE3OLxO9j8mQtn?=
 =?iso-8859-1?Q?jlhWCPAzdLFE6kj5b4scw7APMjZin/+WwCyKc1zA2gK7PMJ7IW91IAycIn?=
 =?iso-8859-1?Q?VWS17AQwCgsGi2g2soEZN1+zw66qdaRhGc5cOcz2R8HmjTMOF2zYZXRY9o?=
 =?iso-8859-1?Q?z1wzKk6PNtuSZLQqbYRXsEkRXWsK9PvXagLZ1uHGOtjTqH2gM2l445/fDg?=
 =?iso-8859-1?Q?rbxfcFibZDxkvMx9IwnUbXASO1lCLTWmtYgtOPz2YvT1vBn9JFFXhtvYMk?=
 =?iso-8859-1?Q?Q96iH1yNV9hG5zQJJBcyNEc+yJEvwmAl2uTkS0diTzM8tA1Cz7JtSPBEXL?=
 =?iso-8859-1?Q?4A7T4w9gpsFF4qjLK72PoZBiGrEwG11MINLlqM60E8hRa0H97y28nQNJX1?=
 =?iso-8859-1?Q?kI1qcehsN+WaVpTwJYXVD8frgEvdYXIdvNaetIZ/dHrOQ8wCUG8v/2oR8y?=
 =?iso-8859-1?Q?HcYqJbca5bVPxntQL6y9m+MEGkAhtusxBInSeNESdKO2VTxCZ2Vzqm9cpl?=
 =?iso-8859-1?Q?Tz5FrkbRWnpa28Nexsmw2FzDR/5EHXrueElcfh1SLr91178WfOm/AzRs4G?=
 =?iso-8859-1?Q?o6ixeRqMHHyhcwt2DTJZVQHu5vBQht+qoX8xfqetcqdrSX1P+gddfhlIJ6?=
 =?iso-8859-1?Q?MVO1rYtGYXLBuJzvb6e9SRWw+ayJ4kZAGVLddj+KTBnemzQUngx/8y94sL?=
 =?iso-8859-1?Q?7uyYPD4CFp0QNLTvSa39MzMRpS2ehC097IU7zI1BXhl11ZgCgapjH0k4kS?=
 =?iso-8859-1?Q?LHkxOBH8kumWP0F8S/ETytILWltEu9W1kPtbTf18j1FoejpC1EIlcR83PM?=
 =?iso-8859-1?Q?ech5xndgCdozW2h6UTO2XZqhe4uD+AyXx+5m+HyADN2YHQ0aEJKorZ79ST?=
 =?iso-8859-1?Q?FKSMRj3bSE1vTKQp9KmIe5oWN2ytWgVxWhYujEfYATzADWlCtwc4DHbmDr?=
 =?iso-8859-1?Q?vFxkSxIvEc8HfigdjWwyuKqueVFkd5w74PbUqvcCqxBk53J2sc7aWbS3LC?=
 =?iso-8859-1?Q?CK5Gt5Up0O0JiB+ATzlN4/i8CBB7z+WFY5H7dHio88h3NMAJK9OgFpSUnM?=
 =?iso-8859-1?Q?YF6aWCR6ZSTKs3I0NRnc4yLZnM2WrbagAdRgOrHBh/WPNUz4yyuBfgng?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e46ca040-d79e-4756-e220-08dddb7274d4
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 20:37:59.2801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AtJWEwqOqVd27gkooB9U/gRk8RNcyn9c7Q6f8iciOWzwWxxK142NNK6pHoK1s4IauGgEss9OwxTBio7em0kGBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6547
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

On Wed, Aug 13, 2025 at 12:51:17PM +0200, Thomas Hellström wrote:
> Convert dma-buf migration to XE_PL_TT and dma-buf import to
> support exhaustive eviction, using xe_validation_guard().
> It seems unlikely that the import would result in an -ENOMEM,
> but convert import anyway for completeness.
> 
> The dma-buf map_attachment() functionality unfortunately doesn't
> support passing a drm_exec, which means that foreign devices
> validating a dma-buf that we exported will not, unless they are
> xeKMD devices, participate in the exhaustive eviction scheme.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_dma_buf.c | 59 +++++++++++++++++++++++----------
>  1 file changed, 42 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 78a827d4e726..56df1d84df21 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -163,16 +163,27 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>  	struct xe_bo *bo = gem_to_xe_bo(obj);
>  	bool reads =  (direction == DMA_BIDIRECTIONAL ||
>  		       direction == DMA_FROM_DEVICE);
> -	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
> +	int ret = 0;
>  
>  	if (!reads)
>  		return 0;
>  
>  	/* Can we do interruptible lock here? */
> -	xe_bo_lock(bo, false);
> -	(void)xe_bo_migrate(bo, XE_PL_TT, exec);
> -	xe_bo_unlock(bo);
> -
> +	xe_validation_guard(&ctx, &xe_bo_device(bo)->val, &exec, 0, ret, false) {
> +		ret = drm_exec_lock_obj(&exec, &bo->ttm.base);
> +		drm_exec_retry_on_contention(&exec);
> +		if (ret)
> +			goto out;

Does this work? The label is out of scope, which I believe is a no-no
with guards if I correctly understand the rules detailed in the
cleanup.h kernel documentation.

> +
> +		ret = xe_bo_migrate(bo, XE_PL_TT, &exec);
> +		drm_exec_retry_on_contention(&exec);
> +		xe_validation_retry_on_oom(&ctx, &ret);
> +	}
> +out:
> +	/* If we failed, cpu-access takes place in current placement. */
> +	(void)ret;
>  	return 0;
>  }
>  
> @@ -211,24 +222,38 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
>  {
>  	struct dma_resv *resv = dma_buf->resv;
>  	struct xe_device *xe = to_xe_device(dev);
> -	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
> +	struct xe_validation_ctx ctx;
> +	struct drm_gem_object *dummy_obj;
> +	struct drm_exec exec;
>  	struct xe_bo *bo;
> -	int ret;
> -
> -	dma_resv_lock(resv, NULL);
> -	bo = ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
> -				    0, /* Will require 1way or 2way for vm_bind */
> -				    ttm_bo_type_sg, XE_BO_FLAG_SYSTEM, exec);
> -	if (IS_ERR(bo)) {
> -		ret = PTR_ERR(bo);
> -		goto error;
> +	int ret = 0;
> +
> +	dummy_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
> +	if (!dummy_obj)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dummy_obj->resv = resv;
> +	xe_validation_guard(&ctx, &xe->val, &exec, 0, ret, false) {
> +		ret = drm_exec_lock_obj(&exec, dummy_obj);
> +		drm_exec_retry_on_contention(&exec);
> +		if (ret)
> +			goto error;
> +
> +		bo = ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
> +					    0, /* Will require 1way or 2way for vm_bind */
> +					    ttm_bo_type_sg, XE_BO_FLAG_SYSTEM, &exec);
> +		drm_exec_retry_on_contention(&exec);
> +		if (IS_ERR(bo)) {
> +			ret = PTR_ERR(bo);
> +			xe_validation_retry_on_oom(&ctx, &ret);
> +			goto error;

Same question / issue here with goto error label.

Matt

> +		}
>  	}
> -	dma_resv_unlock(resv);
> +	drm_gem_object_put(dummy_obj);
>  
>  	return &bo->ttm.base;
>  
>  error:
> -	dma_resv_unlock(resv);
>  	return ERR_PTR(ret);
>  }
>  
> -- 
> 2.50.1
> 
