Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D94CCD5BB8
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 20:03:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C1B10E949;
	Thu,  5 Sep 2024 20:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K7Sh2hMB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DBC10E949
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 20:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725566634; x=1757102634;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nvEhGkhhy8EY1TLB9Pe1nbyKExS2BPkd8jn1Jt7beTU=;
 b=K7Sh2hMBIUC+tYJSxkBMFar75XBmxJ1iagJAdDqchBdQpI2N9mw4CuYy
 oZxRoxqSVL3dZu+Tb+zVGQld8vFAweBL2Y2foMex7IZRjxeNPfh9CIL5C
 7jt23rrBeasdxQtmPwJjyW9EsEYCyBpydN20t0B4klSnctqrIrWEl6CUx
 kLP07iOxXgYrojK6m6fQDjMaZJMuUAzDzTl1mqvtf09/D6CGxEb3nSrkv
 KYNHIDxrgxyoCnRf6mfmGDTcOMCU5sOQaqYCus7vRqPSFx/QHfJJ5xXRP
 jtKsfxwBjONxAqSRYfSAwpgIz9L8xHxOwyrjcwMDBAsG90OUTGDYjqMr1 g==;
X-CSE-ConnectionGUID: CvmvHpQ9Tqq9LmADEe7i4A==
X-CSE-MsgGUID: veH3G8hLQtaVn6g1lfl9tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="49722684"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="49722684"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 13:03:54 -0700
X-CSE-ConnectionGUID: ZR77FDboQn2B5L3xPnK7MQ==
X-CSE-MsgGUID: DrRc6IA/R5y6vrPcLeKcZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="69874448"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 13:03:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 13:03:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 13:03:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 13:03:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 13:03:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OfrIXMGnF32mjqDFs3D/DfWqji0YnppF09xu14ETxXh7uC/u+V1WTpmn5+ci/2+nuXGqcEX48lfrXeszU9jVa0eeTG4bTpi1ywCGWpXLWavd3Oa20GXtqGsQ46OJRamJxY8Y8jqumEn68RPsHLL7F3dsQ/UK0a1ftU4rYMSyaP9At4EuNmYbXtth2ven4B6JgP9sGedOt0MrEWkMQ9aZG3gZ4zJkV5xZaNVfqQMRcEunRjVClOPeRBhmDdy77uUNsjpZXQYv/bbGKQChwUH2v+MgbXI0l4r9PQo50QAUA07FPtl5DKFg5u1INmxmS7it2KX07G1v/TLEh0BZh4jhKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtOhgyH4FzuQvP3R1IaochH76i5GGHTqzlr3rp+My1s=;
 b=GjQ0triEW8hpSPxuOBjEQQX/Fl9BDfwL3u168Y1R875RJ4HHbg2DR80vUSXNrdnExiAvpWEcRGAWAZ4EdtvAR47Sq083nKe3+aUOOOf+LAD/zI+4IxoGDBh7EStgS2XJBZmG9icK/FFFfyYvr0ohRVr/J8c2QMz5qOwS8FneOTS4MAVnrtQe9fl6GC+A6zTI1DVL4YPswfnxT9xjILSjb3EOkymd9kjG5r+fvG2J8r/0tW5LQln4sFctMgCTZGE9EkMSJqPr6UpZCstJ1L/agfjkXO9jLgHPCocxP97gM3D8xT9RufPgeWIJ0hMSg3Z1lkKzbXAZqxxYmS5mRyH2nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4554.namprd11.prod.outlook.com (2603:10b6:303:5d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 5 Sep
 2024 20:03:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 20:03:50 +0000
Date: Thu, 5 Sep 2024 15:03:47 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 01/43] drm/xe: Move forcewake to 'gt.pm' substructure
Message-ID: <gb3tlrystjtzkexxr24dbl6exvek4nnptcdrhtnc3rxfr2wg77@og6kpxhvjsit>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
 <20240904002100.2023834-46-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240904002100.2023834-46-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0244.namprd04.prod.outlook.com
 (2603:10b6:303:88::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4554:EE_
X-MS-Office365-Filtering-Correlation-Id: 56e7fe8f-2fe7-4927-feca-08dccde5dba9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b0QnjJhSz6I4pFnS1TZp6JV3mZaHUFxTlpVLnlVtUVjWaOnWY7jRW6AbvR+R?=
 =?us-ascii?Q?D1X0FfdPpTRS0Nc/Gz8Wo+TrgQGd1E2msu5F6dI7k0KrVbxKnQKpdWpnkw1c?=
 =?us-ascii?Q?sadHmj5Khr8qL9VKp76Cl9+JZCRSL9ZQaWkLEsl4CwzCcAUSFvCANMW6hvrI?=
 =?us-ascii?Q?NqnBIo5Bf2JjX0Z9hPUTciyRmf0RZDZTtIOseNGe7gn9RZJ0rIB9GA7IAH8N?=
 =?us-ascii?Q?3ABtfxRAJBT2tzBOVt+e9fNw//p5wtgrMvprJPtQzKAErtHpD47i8VyG0EhM?=
 =?us-ascii?Q?FTAsgnTuWFKo9e1KqNUXdQTqzGsAEAkgBtFfpbSKymByxw7k6SN5nlgt7Kkl?=
 =?us-ascii?Q?sV0llT+PmT+qARrDzwFw7gjpLjMOMP9SiPCaB3jgDhO0awyHupKwG4tc0Ell?=
 =?us-ascii?Q?95pXWZzxUCLSNOGEIzP9z0oDvwLy+FCzFD0CiIujwLXljMPDcWM0Lim8EZsm?=
 =?us-ascii?Q?z5eM8AN3ys7VusXr5eI1fvBXr8nYaZZVCgBRHGZOdh2g1gi2JOkCBMp7UAKd?=
 =?us-ascii?Q?kP3zK8XrcF3qj9w5tyYfGbu8NCkTRCWZaelFNgDGHtgKR4BhaJt60o100YJU?=
 =?us-ascii?Q?7b/Z7jihTRmvLfwbwzQR9KctpTnrirwXOUxoRbGqOCRxTcn19h+dycD4cLmr?=
 =?us-ascii?Q?WEdKn3/Q5750km82bkujPrfMyOA9G7sHY7bZfPgG8tr1+qeP+AE9vAvlg9Qw?=
 =?us-ascii?Q?i9av4Lc+XprYUl/Q5ieT73nc0jlJELky9UJSipCH0tOHcZpE/q81GCPTT7S1?=
 =?us-ascii?Q?/uNbt+NRRzVlES5lv6oxiPvJvT+dqo9biSu8i10nptFn5Jky+6EzQFMPx59B?=
 =?us-ascii?Q?KwT7g+WRgX9f+z7brANNW7rQ63Y3W2oMfNsvnaSlpUlS78mvrX6I1RjhMtbE?=
 =?us-ascii?Q?U8PDJQklV8TBVrVcj2fw/iCKFcGITzK1GrmndJGeZSFVGEI8PM2UFd1ulsuS?=
 =?us-ascii?Q?i1+747eHrwpQAD1hjEB8HrW2n+m7Z2QID0D4c0bNJTfrT4ODHZUL9MZHPBpA?=
 =?us-ascii?Q?dTZMW7fSIq3z/Llr2a2E5E8LH57+CuO/k9uAwkQrZdYY9SNiWgDRPi0TUSX6?=
 =?us-ascii?Q?XIVGqZeCZ5+Zhc7v7PzQ8Or1ufvqIHZvkqZa0zMcMxdLYIP64BRomGiEsKMc?=
 =?us-ascii?Q?qNNZwqI8c3pWW0PZlw/+imM8gec8RxNHQTP+kfNWLCJQqFqlRIX04VRbrwlc?=
 =?us-ascii?Q?HzXNDJ52CiMFe3P4XJk+YaV8iocTOQ2jJbzhmeCpRXTpK20WKd/JFNQprBg/?=
 =?us-ascii?Q?SW1tax3EGZriXyl7DciELFMXILYTm+14NjJtgpulG6Hzfs0weEsn3IQTS9bH?=
 =?us-ascii?Q?+HTv+LB+rtlUIp0enVpEfsYgEO7hb4XaUYqRQApfl4Pkog=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A7E/g4D4w/+RhWI9TXtF0NfKxYHOXjJYEv53uoLlsPejk53PY5pN7SNOc8bO?=
 =?us-ascii?Q?TwLYnz3EEcsyLoc2wNNvo9Yui7MR0EZ5fuAYFOjL4DNFRGhiVuIKH6n/+aVS?=
 =?us-ascii?Q?2Q7VAV5eay9Jlz09V/Ji8xM153Ogs3Ld0UaOQZq5HJyKIefcp79JP4mi+ZjN?=
 =?us-ascii?Q?vj/fJafErdwzH41wl7B/saisd0p9EPhnCniVI4j+YWoVhmZt5EPnzTz7cg6n?=
 =?us-ascii?Q?YYSA0ICO61+SbKvDKv2ZF7yOxHe5Yv4/J7FkG2UhCSl9Wq3k3DguOHdI7n99?=
 =?us-ascii?Q?1RPjOhVzIxt3Ob/avaW+UWwFdQw5OcOSGPviSS2vUq7wjyE5f2ZzZfDJd0nQ?=
 =?us-ascii?Q?W1XOx2YoBZ2y4lNF9woqguQuKNLeQY29oCJIIoA2uKX1H5zOHw1emcIiGtnf?=
 =?us-ascii?Q?afiYBEZYmPJqZXLAM67YlkEp5DYvr6nW3UKi6d+t4LYbloXn3w9Ogf49vVIC?=
 =?us-ascii?Q?ftUkfYp8zA5y/7BE4jyWg0ANq/dvW5yTd8nA6/4SFXXlTWO48+rHJSsb6AqF?=
 =?us-ascii?Q?S/qGzCmrK8PgvJ28Dse+akIZSiLnUJ/wfyisQwIpdEo9yuVTv2PzSVhOjZAX?=
 =?us-ascii?Q?WrK9dQuegzMCWFs+U/HOKKB69aWIAP8obl+dRFFJGEl4vkaSea/NV69Bfzwp?=
 =?us-ascii?Q?10g4OZfCza7gEF/fQs1zGOvNetx/P1/qeZSLSfe6yQH3R0eHH1SifzvG58lM?=
 =?us-ascii?Q?UyT4YSBTZdIs2D46whZNqdXMm3SpyDJc8ld/wVJuK7buwFdfNBD554F0FVeM?=
 =?us-ascii?Q?RSZ5Z3EY+swDCTFkO/RnS51ixtgWwABtUehhweszY9ul4r1h25AdXRC2Wukj?=
 =?us-ascii?Q?T9GFGsP636mgE0YpffzE5LwzYY1vNWuZoOkSYlrD3fMxv1P1AaiE/Pt2h5n4?=
 =?us-ascii?Q?+PBy0RLOVcZuplxz7WR3qVgJ7QygzoWdSB1M1zqMSJ6z0FajaV/hMlIDIOiX?=
 =?us-ascii?Q?pY3JIfiCyWXOANenOjMAYb7Y47cgraSfBmnfpIRDR+LJTtsJ7R+gOp+clDFC?=
 =?us-ascii?Q?28Z2UTeZkBo99TD1JvVPMgGHSsXYVHYiCuYLxEjabAa2nNWWYRoqUMR+vD2v?=
 =?us-ascii?Q?/kD/6j3/HKA5Cy1cDgMWfkvT+4VCM02x8gVXEpjBxexq+ki9jOfdBQ43QPq0?=
 =?us-ascii?Q?c+OEeI6IevItu3Zah1zUClW++7Rp/3c81xh3RRI9veGAsI141s07J9m4bSj+?=
 =?us-ascii?Q?E1lNsJmHZzpp08+AK7BxO8uEHsS9YJ78m1rCl3tEfiHLPIW+JqSC/ynxZngw?=
 =?us-ascii?Q?p1laoSjjtpNliGtY2Yhdgm4bNQkglG0X+2DfNJb6vEijOmlC2oMwAGAIX1uu?=
 =?us-ascii?Q?ATLynlbSu/WTQ3HolHbFpVJuruGkbQ5jJvcuU0m3Kvr7WtGK0beXtFI7e1Gj?=
 =?us-ascii?Q?WZuCACReN1wPY3RZB+tyv0PYoJ7QYgkAo6v2x3B8U6OthoHHEc8VMevXhB1y?=
 =?us-ascii?Q?ofE7DY8iAed5WoXlpel06J1lcRQUpIasWGoZkB/fyOV4S4pqQ/+nYA+909e8?=
 =?us-ascii?Q?pEuiYizUt8oehDEdqcWUqfGGWjgd0WhbBUzpylY9Vv4hXrex5Fz+Z+JQ7zRL?=
 =?us-ascii?Q?dAVVjtTv9DB0SP1+ie6msp/b4ugV49HmgjnXxT47Ihd98PIx0pqMxwT8zIIy?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e7fe8f-2fe7-4927-feca-08dccde5dba9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 20:03:50.0429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7mQA3qt/syNGSFPsulIFvjlAB3aAKJQslfRHYZ4oWtZwjPhnnMdBGE2KQGfBBHjBRuSlM7ROgCM96VMGR2X33/F4n2qqTSWtsIdGWamNQps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4554
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

On Tue, Sep 03, 2024 at 05:21:02PM GMT, Matt Roper wrote:
>Forcewake is a general GT power management concept that isn't specific
>to MMIO register access.  Move the forcewake information for a GT out of
>the 'mmio' substruct and into a 'pm' substruct.  Also use the gt_to_fw()
>helper in a few more places where it was being open-coded.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.h   |  2 +-
> drivers/gpu/drm/xe/xe_gt_types.h | 15 ++++++++++++---
> drivers/gpu/drm/xe/xe_reg_sr.c   |  9 +++++----
> 3 files changed, 18 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index 894f04770454..ec726dcd5f99 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -138,7 +138,7 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
>
> static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
> {
>-	return &gt->mmio.fw;
>+	return &gt->pm.fw;
> }
>
> void xe_device_assert_mem_access(struct xe_device *xe);
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index 3d1c51de0268..e9026023e240 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -145,11 +145,9 @@ struct xe_gt {
> 	/**
> 	 * @mmio: mmio info for GT.  All GTs within a tile share the same
> 	 * register space, but have their own copy of GSI registers at a
>-	 * specific offset, as well as their own forcewake handling.
>+	 * specific offset.
> 	 */
> 	struct {
>-		/** @mmio.fw: force wake for GT */
>-		struct xe_force_wake fw;
> 		/**
> 		 * @mmio.adj_limit: adjust MMIO address if address is below this
> 		 * value
>@@ -159,6 +157,17 @@ struct xe_gt {
> 		u32 adj_offset;
> 	} mmio;
>
>+	/**
>+	 * @pm: power management info for GT.  The driver uses the GT's
>+	 * "force wake" interface to wake up the GT hardware from C6 sleep

"wake up specific parts of the GT hardware" ...? Because otherwise there
would be only one forcewake domain

>+	 * states and ensure the hardware remains awake while it is being
>+	 * actively used.
>+	 */
>+	struct {
>+		/** @mmio.fw: force wake for GT */

@pm.fw


otherwise,

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+		struct xe_force_wake fw;
>+	} pm;
>+
> 	/** @sriov: virtualization data related to GT */
> 	union {
> 		/** @sriov.pf: PF data. Valid only if driver is running as PF */
>diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
>index 440ac572f6e5..fb209f1e0f1e 100644
>--- a/drivers/gpu/drm/xe/xe_reg_sr.c
>+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>@@ -15,6 +15,7 @@
>
> #include "regs/xe_engine_regs.h"
> #include "regs/xe_gt_regs.h"
>+#include "xe_device.h"
> #include "xe_device_types.h"
> #include "xe_force_wake.h"
> #include "xe_gt.h"
>@@ -194,14 +195,14 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>
> 	xe_gt_dbg(gt, "Applying %s save-restore MMIOs\n", sr->name);
>
>-	err = xe_force_wake_get(&gt->mmio.fw, XE_FORCEWAKE_ALL);
>+	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> 	if (err)
> 		goto err_force_wake;
>
> 	xa_for_each(&sr->xa, reg, entry)
> 		apply_one_mmio(gt, entry);
>
>-	err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
>+	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> 	XE_WARN_ON(err);
>
> 	return;
>@@ -227,7 +228,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>
> 	drm_dbg(&xe->drm, "Whitelisting %s registers\n", sr->name);
>
>-	err = xe_force_wake_get(&gt->mmio.fw, XE_FORCEWAKE_ALL);
>+	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> 	if (err)
> 		goto err_force_wake;
>
>@@ -253,7 +254,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
> 		xe_mmio_write32(gt, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
> 	}
>
>-	err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
>+	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> 	XE_WARN_ON(err);
>
> 	return;
>-- 
>2.45.2
>
