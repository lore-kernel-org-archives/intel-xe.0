Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3715D5B87E
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 01:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E2510E627;
	Tue, 16 Dec 2025 01:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ejhsCZc6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9CF10E627
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 01:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765847953; x=1797383953;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cxo/ZqMZfVyB/kiFPlGjlQFGU1NxM6ZKPruBNgbt7cY=;
 b=ejhsCZc6eqbTDz/DDNBikbJgM97qCCcTor+jrVejRBk1lQ5jf7pkEAa2
 0RI6DuH43LDvhrjGU5rdxEM9ufmdy9iO1kY/P75VxtE5j4cdfKoobxsKQ
 5Bo2CB4ruZoTY9Qiu/mnw9JKpVxsyA3uqxn6IaRAVsf6H3zumFVsq0C2e
 ++ft+mUrIiz1u5vrjmNnLAqTE2dh++UWZfd45vGJpcHW//KB+tmn4epiH
 dTDRf5cNpjIT84K6emE6Z6qyM6uk7DfOxxtH/oRytBhqkcoAHK3jqV4lE
 DR/Qbua0pwqfRVmg+BTwYOTzeh+lN82lKB+A60WDWvOrDWxF4+5qqTKkz Q==;
X-CSE-ConnectionGUID: JvUzl+7sRtquTSL3i3XO9w==
X-CSE-MsgGUID: UD1hEY9vTDuzKKaTAl6C9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="71615385"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="71615385"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 17:19:12 -0800
X-CSE-ConnectionGUID: 32ltNe0jRr2LqApasc1sUA==
X-CSE-MsgGUID: kdHfWmq/S/2scCTVNIrkUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="202373609"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 17:19:12 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 17:19:12 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 17:19:12 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 17:19:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rYWDN4lwee7E8vC4nqdEfU1x67qr1kAnwZWpNx47IwfbcO7zn1m4IMv8C2L9JA2QhcXOaahl8yNNl8/tj8Po2iC5IH3Nc1c+cTwMbDga+HaCEqouHrkSV/yWJxTA4MFtcnOZJ/Di23WBhXW770l6oX97LlnuD+Kdso/NHD62ue/G39Z6XZbE5YDv2cUtSJeMXOBv2IVqeuZg0aAdHh1145Hp8d/t8SncL2gSd1DrrZY6/jYg19oIptBaQLjFXf4P96xAr/rF155+jANm0RjTT2NAu/JteAhmUUgKmkIPHttcnWHZqccunxOVqtFIZn3emk+U2yttk3ArUIdDDnOXWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIO13YEaRaoyg8tKnw7gGN/bVm8gDPChk4NWSWQarqM=;
 b=xIOuBSLINLQY2daAr7P74xRiaONY04GB3Uzfy2rSFqY7v5iFWQYGBtUpivYvlwPYA6dsG9MD0on/acl+Ue/sND7QMSkQbQWcNNKVJremKswQ3bSKqb0VAFZlN54iP+zssLr0krmdzqjUmG8YgEt78KEa0bE9/Hb7ZKk3qIsh2LmY5qO61YJtrpIfgapBL5Doh4F3cdR6x+Hr6Ui/erDqfUOyZg/EfYfUMchx40n2KdxIYyRJzrlLZVY0Bcc6rA8CX+qJSc3k2X0zMkXVkGsLlcLRUBF/JWfj6FjVqzYhuoDc6SxVhKfRQk4qWMuxV0kgbRwtWUG/aFjKHB3FVlgsbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7301.namprd11.prod.outlook.com (2603:10b6:8:10a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 01:19:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 01:19:10 +0000
Date: Mon, 15 Dec 2025 17:19:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v2 0/4] PF: Add handling for new adverse event thresholds
Message-ID: <aUCzixblT//8+U3j@lstrano-desk.jf.intel.com>
References: <20251215143739.196336-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251215143739.196336-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0088.namprd03.prod.outlook.com
 (2603:10b6:303:b6::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7301:EE_
X-MS-Office365-Filtering-Correlation-Id: 49fe0e84-3da1-43ff-c10b-08de3c411dac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?knytPD5Awgu6B7gE1V1q2bODCH5/dLKJTP5N+8E0Z4KBLluNAsXs1aefRwSB?=
 =?us-ascii?Q?rgjmFg0pFzpCLzL2XoBTYGPabajeYRmQSvp521gHY3/QGIIr3sr5sB9rPK0x?=
 =?us-ascii?Q?R+7bNpkdUXzNHJ2m6ri5m9Vh1RXg8ZWVnAEzItZwQETbQNqx355RUVA58pxT?=
 =?us-ascii?Q?k9ZrK/vjCZaPFwQwWqd1qwCEQ0eRbQ/18M1UcXjDO54VV8ITJBl6+nywsoz2?=
 =?us-ascii?Q?s1hbekZzFhYV+6IdbPcCDcbrC3zh8b6uZfF8HBFlrWP9erBY+9/5BXLaNL41?=
 =?us-ascii?Q?K3MVb468IQuMVUAYqoQ7MgD1XaIyhel3/jBpwHLJKz9CkXsoLcHu3awtWhVI?=
 =?us-ascii?Q?/4YwebEXCSm2x3h8HX0yVFHNcRLkyGQQMVrv3CRhdL6v6DHQas5NdI5rh+LX?=
 =?us-ascii?Q?VdXIoFLG4sGQkhX5DlDk/6Ht0KBqkIjaYvfV4aEGeTYtggLZVKi7MDs4JOE5?=
 =?us-ascii?Q?E72FnS2wlvYrDsZ31VG77iWL1O+8WPzo/40TNR7SXlFjM8SbsnFlZSk0ElvE?=
 =?us-ascii?Q?wbMoLevab8jKyMWdc3v48CMJeLfLru0eutydXB1b0RpjMS0P32h3QgQT25Dg?=
 =?us-ascii?Q?ZUl/CQMHJr9tYqEMileihdw5L4/pAZKfJ8I5gd9HRASL179UD5mH5DU7o9zi?=
 =?us-ascii?Q?ddrWpyh5QmepgRgq28FLBPQzCUBsV1C90SvhSY9uHuAJi64b/V5tbXXXdIZO?=
 =?us-ascii?Q?tQrr+ttmwFqxONwT6uFwQNzv5rrhwyCFU3gXnA7JA4R/cbTqxwU696qGJueX?=
 =?us-ascii?Q?i6hMBNXk5o1iRc8Z5C6vRC5WM77unzjI/GAW3c4navn/HX6hvH38tWdmxy+x?=
 =?us-ascii?Q?covNBLGwppVpQ2gpAx7SuWJASr5hixeoXExWd3i193Tb74Z/zqfRheA7Efxv?=
 =?us-ascii?Q?uv6mCdu3gd/73uz29cznrpBmGeloM0dnES4Gxxxe+z8nE7qfTsQ92ogVpxWt?=
 =?us-ascii?Q?pNSBJmG6lH4mcXKfuxGB+9vXzPPRdN8fQHwkD++e3wHE/AImrp+7tg5pXke9?=
 =?us-ascii?Q?ZcmoZHd/D3r5r1YTua1/mzouaUNKYyDNNDKH8DQQoDCVzascEE2qmdbwh/m+?=
 =?us-ascii?Q?a7XoCsA/M8YVUo8Xfxa065ugKMwGiRCDkK3+cj8idMdbzWWoGhnQoBU+p4Vs?=
 =?us-ascii?Q?Pg9wXWz2FfAReA1cv3yWdVsF5MPczETsbAwlqrrIyW0zrSBllceYYflm9b09?=
 =?us-ascii?Q?qLyS6ddIGhsNg3binVZbjxBkCn2ec2HbhkFVBe8nmdbIwBslcy/lPbKZUEWy?=
 =?us-ascii?Q?8wykWJ1W+hrvLpJ3Mflf31+2MSCQOvn5CHB3/6T6EqAQhh1Q1W8Fnn54lOKu?=
 =?us-ascii?Q?GXl1tmPuHj/mtTqgwMIxqqnH8j/h5kjrtOyBcJjmEtdzLNHzF4ozPldlUu3a?=
 =?us-ascii?Q?1Gs2DLU1huXPquZ5ym/zR/U8ZlC9N1Wk93CKf7XJj7vw0Kjn8A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zVIcR2lKv2wIwsTLnyM9i6F4/jJLIHkXnkqPpYEflMWVa4OBR7K/+hHlF1Oh?=
 =?us-ascii?Q?Vr7+so+ZpNbLIVvo9V/E2i+9bPOd6LgkikGQf+w968TDn4sXjLY/1JptzTTZ?=
 =?us-ascii?Q?XSqdbE+GJEX1nUQ9LrGKp5hm95WxYNAbUy6y/WiSUhl6UEn0ePpZj3i/rYeD?=
 =?us-ascii?Q?0Em/sKrkcTCIgj3ll6Ht+nQqyvA4wu48fR0seRm4zGx51AOQv8DO2tcb5vxT?=
 =?us-ascii?Q?u8beuIBFM2hDuxKjtFwmc8lreFd9XvkosUBa7JNDxeS3VWvoHSCOEZmZht2s?=
 =?us-ascii?Q?8KzCMyPAjQhsB3KNPuFTZ/KSGrYRTV6/l/FAywUK2Vg3+fDcnY8EJWlHxg10?=
 =?us-ascii?Q?XMrYl2p6DOtFTDPMADVJGBXYjlTCgnltkUM5Ebp6ttEzAmpXIFHBxYovUP0q?=
 =?us-ascii?Q?jkhxlcet46FlvID3EgQ2/ztv9qUqE/FoKctNbrOMmP3gDas3/OugiQgKu60i?=
 =?us-ascii?Q?/uxtPao2+iFQxYFo5354WU0JDR+IToClFcdptEBJojasmI5Ad+t6A964+obG?=
 =?us-ascii?Q?oDNr6H8xMBENyLt7mOdK+copF7riy+dP52BsHe5n/QkhSIktncXgzEg2XL+I?=
 =?us-ascii?Q?rke1TzAL1DReqInqV1+GNMgkiTEj2UIMIVPPmcwk9IIEyUeYtlobh9A0Au7r?=
 =?us-ascii?Q?yi1Obksm10PcGv7CK1Z1QroyELFuL7hCcu7P2NAss6linh0GpZ6xz1tGIw34?=
 =?us-ascii?Q?Lcbbd28XYEDauVVhIB3JPwL8GIsZN2EUJJx9Pjc1/w3B/p8a4Wl5iLK+AGMt?=
 =?us-ascii?Q?Gajn0jVCFUvOI77lIV7AhWII77URszBkQAqWShvBOQKhGi5Le2qgz3hGVhtX?=
 =?us-ascii?Q?SYwOmFUJm3CmzU5LNkC6f+/Gs1u1/6wwxLD/D9Pi3exJe0uVGe2Soe0X2wL+?=
 =?us-ascii?Q?jqa+dPQN2piSiOQf0AvPjfN48Zq6+Ly62Lz9DXP1pfvWlCLWGQLqmzddUmhC?=
 =?us-ascii?Q?paHGCBS8eygtKDXTf8V3hHUhQHThEPB313CkncURXr4gBNzokR0TqBcfePaN?=
 =?us-ascii?Q?CQWIdHfLnY6z6Bw0Icp8Kiux+J7EH8FUifipSJ6v/hX7Lw9AYWNc7GFdSfzv?=
 =?us-ascii?Q?ysL4Fk0Aq6aciz6c01G2ApG/tJloFHBBE40NRIdD3CF1FyNn4GxoYc9FxUE/?=
 =?us-ascii?Q?Aubyyfuqauy+vKwg2GwyIzud08LpjKXJtxLaNGo+M5i5OD5yMCUjpz2y6FKS?=
 =?us-ascii?Q?U64jHtnGPg/xHqRv55kIX7jRifFUQNR6dRhdxo/RlvBLLu0RIYVFsYHR4XJZ?=
 =?us-ascii?Q?/uYmTcf0RAUFSjuIF0UFbB5FmyiQwPIVRkqrbsCl865IlY0hqjMNB5tOts0C?=
 =?us-ascii?Q?CcK93esIMp1IINEmqtDL6JsOHwcEONcNnQiW5O01UK0WtsY5sEUl6jGnc4DR?=
 =?us-ascii?Q?44nbjguHX+JPfuespYHXvPdsYNHkPURQ4JW04YMgyk2Pe3w4YvLVgXUdeNFg?=
 =?us-ascii?Q?HJNNQbGL3BxyF7VDg1rhrWWpmrutlpGJeUleiTgkyV1LceA5afoRtcPEYRsM?=
 =?us-ascii?Q?vSV+k0ss1Cu6MEGL/UQz7/7tEo8dVad4df2PkG9upIlB4bHFPHtwOmZn8f0R?=
 =?us-ascii?Q?1pedo/QXyxfKmgKjSIar/+YjPBruh6QTQhrj8CITSwu3mjWwlCviVzAzTWlz?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49fe0e84-3da1-43ff-c10b-08de3c411dac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 01:19:10.3048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RlnnVD1CIT/2NNiYaOWDFUTLgB3c+ouUhAPnlOPxIM4fR8itrGs8PY9mXJVdLmKOJ09IpupQ7WAmDm+uGAaIKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7301
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

On Mon, Dec 15, 2025 at 03:37:35PM +0100, Michal Wajdeczko wrote:
> We want to extend our macro-based KLV list definitions with new
> information about the version from which given KLV is supported.
> 
> Instead of using magic version like 0.0.0 for legacy KLVs, add
> utility IF_ARGS macro that can be used in code generators to emit
> different code based on the presence of any additional arguments.
> 
> This series cherry-picks one patch from the EGS series [1] and
> can be merged separately.
> 
> v1: https://patchwork.freedesktop.org/series/158874/#rev1
> v2: new patch with GUC_FIRMWARE_VER_AT_LEAST macro
> 
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> [1] https://patchwork.freedesktop.org/series/158142/#rev3
> 
> Daniele Ceraolo Spurio (1):
>   drm/xe/pf: Add handling for MLRC adverse event threshold
> 

For the series:
Acked-by: Matthew Brost <matthew.brost@intel.com>

> Michal Wajdeczko (3):
>   drm/xe: Introduce IF_ARGS macro utility
>   drm/xe/guc: Introduce GUC_FIRMWARE_VER_AT_LEAST helper
>   drm/xe/pf: Prepare for new threshold KLVs
> 
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  9 ++++
>  drivers/gpu/drm/xe/tests/xe_args_test.c       | 53 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_args.h                  | 18 +++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 19 ++++---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  9 ++--
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  2 +-
>  drivers/gpu/drm/xe/xe_guc.h                   | 21 ++++++++
>  drivers/gpu/drm/xe/xe_guc_ads.c               |  4 +-
>  .../drm/xe/xe_guc_klv_thresholds_set_types.h  |  6 +++
>  9 files changed, 128 insertions(+), 13 deletions(-)
> 
> -- 
> 2.47.1
> 
