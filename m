Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAA3CF58F1
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 20:53:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D876110E68E;
	Wed, 19 Nov 2025 20:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j4AExRPd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837BB10E68E
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Nov 2025 20:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763585611; x=1795121611;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kFZKrFa0U2rCDnlyEptJLST2CTpoAj1PR+QnbgxmBAk=;
 b=j4AExRPd2fpP8K5llKBiKOmF39m++nXBH1vXLFbGan1w4BonfhxBctQA
 7zKALWL6vGLNwgq9phNqDLpWVWvrotDR1PW4UjqwuC1E89Z0TGcFyu3T4
 1Ua5D3hysASRm44TdvSatecCTfs/zk7WpZlM+8wybQF1qW+6vbbzKLpCL
 ptmRrZAPwrBnr4oYPWcVr2Wfo89i/KHvSlovkibUH+FP11ymwyMVo12JY
 8c0/48ZojOrKOXuIql1ZocfKOGzOcxGPyv+aCxBLaU5bImOvrWS/CwkzR
 cU+brsp3Z6pJiKmiRExZSb950hGx83XnOne+AS0SA9OtZTS5TCnO22p09 Q==;
X-CSE-ConnectionGUID: y3mJ865rS8W7brAq/UZd+g==
X-CSE-MsgGUID: g3zZyOlOQEiW+abNnQT5yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="69511234"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="69511234"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 12:53:30 -0800
X-CSE-ConnectionGUID: d3sz3bBqQzmBVSoY5mKO2w==
X-CSE-MsgGUID: BNmghBD3SgOu36cPYDlQIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="195657554"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 12:53:30 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 12:53:29 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 12:53:29 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 12:53:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ss4H5YRZRxNQGF2Ksah3GyfjtdqOiEQiXDN6LH576j0Xi40BL68BEmD6Mosn8fB+k7e/Q2tY2mRSpStvf24w03S8BzH7yZ8DI0xiNteijtcnS58o0z0dOkfLELcey4iZ1cGGyjqkc6U7+XhsyiCa+94AOkxiAP0iHOeOjonTGTq9sB46eSBvi12dYpAVW50X0n/acf90vtNosc2bUD6d9Dixo4cB1mt5fpV9SD0yOoUbVLzGaP4DFBeBs1iIjJQErt3vbrHsRlOAnVRy5tnuEFuL1OnKk+OYdXYUE3BSgkHwc7w+1g8SeQ4oYNNnUWuajbCTtBR+dmRCteOAWqQduA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kV09PE7FPhF367zu8nhivlNxUkof/lVKDOvph2E6XU=;
 b=ZZkM2S7YXZKUW8p9Bsa2Fu1rMivKKCiKfmbDcQsYlzw/q/8ViqSCYLwZw2rAEbeKADMKvW56sdn7zkFBFDk+mXj4bU5oSeKdUGRJA4GIJYLx0ZG9P68dWoyCei4XtIGXXlzevde+sHxcnqAcOknqCRST6g/Yl5n3C6mWdbhEK5VlcE/WJwC6mfGIliECPZOSPsOiAPIS0/zaByW4nHFd7GON/pJeiopIt1lCk2hTT7ys8+4B8xbzcTJTt7qdRF99QjMLzUJN7RvtiIZXdzMKvKPkoVpEej3KvuAryizdXkQc0CvTMvXO6b3nQ0dZdPYWSxAh7z/+FchSOh3i7GT34A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB5874.namprd11.prod.outlook.com (2603:10b6:806:229::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 20:53:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 20:53:27 +0000
Date: Wed, 19 Nov 2025 12:53:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/xe/migrate: fix job lock assert
Message-ID: <aR4uRc48x6SdSLSh@lstrano-desk.jf.intel.com>
References: <20251119203031.267625-4-matthew.auld@intel.com>
 <20251119203031.267625-6-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251119203031.267625-6-matthew.auld@intel.com>
X-ClientProxiedBy: BY1P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB5874:EE_
X-MS-Office365-Filtering-Correlation-Id: df215d04-f39c-46ba-17b9-08de27adaffa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?nEzForbEmfGkRh9jVHvUpwF9eOUnA2JZHC2Dav+6iMx2cnqm/nGnP9H68V?=
 =?iso-8859-1?Q?+zrDkBuuPkU4ORSGr2ZaFqXXiYl5jbi5Djn/74coRlg5WfOo4BQ120gLVi?=
 =?iso-8859-1?Q?2V97cShR5/4nU9c2LXom5l4m2UoKpsNy8FHyEQNxnHUfbdRvlc4X1L4Twm?=
 =?iso-8859-1?Q?q50YYxGSuItBr4yx3FgZqQXdmdPHtSpd3crIzCIZRWJY7wKf7eX67c5qOT?=
 =?iso-8859-1?Q?SwtHUAhudmSPzdO8NgJbxmztxewWVCmnAxZ9IO2g9xruxkuMCAog1whfoN?=
 =?iso-8859-1?Q?G61SugFRUoAWhG7oS2TgrfyijRiOZOJ38S0ypuh3PDF5T9unwxf91IDiFI?=
 =?iso-8859-1?Q?naMNIcR9QIg+oOjXhkzOnzUv6qvRinEhjpgu7U/IWZ+KEp1z+/cyMYKETU?=
 =?iso-8859-1?Q?vxO5szHRWGzle59dMhmmBIFPdjrDus9Bv3CGZJ6X8b8dlWo/38KCTKhprP?=
 =?iso-8859-1?Q?O55lQuZxvGP0aOB3BEtchP33QXfLWioEiRD6aKANt2Y9I5zpqfv1+hPemD?=
 =?iso-8859-1?Q?huPJDBQG7MC26b43sQfotL609yhlgd7YkbWzORQtyK1P943OfjNo6UlCtx?=
 =?iso-8859-1?Q?dURxflqwpq+NnGgztSAdbklUEOTz6G0NQTSdJ/hUnRV2xKaOy+IyPSJzhn?=
 =?iso-8859-1?Q?soL1ZernZXG7D2OnhVnAiso6qa9VofQ4M5PSZBB8Wfi9yEfOKaLY/47wu3?=
 =?iso-8859-1?Q?IPSszAeiNI2fN1rrpfq3TN3uTJVTupMihaDLduQRPEXbPglXN93hLpOPQA?=
 =?iso-8859-1?Q?FRnDpgVpruLai23aMSatzv08tixPOz2L0bcRLoPoreTYxHQLT5nZzTblvE?=
 =?iso-8859-1?Q?qIespLnwZhPP71Rigs9PJaXxApfWLfHwDYJKLAnSaRzBbpF9+M9MeMm6PC?=
 =?iso-8859-1?Q?5khODW/Gvq/XJUA6/ynGB68BfWySetrActUFwnWOrRr4D2fNtj4vquoR8M?=
 =?iso-8859-1?Q?N0juFUuZlnGXq08LxX9yvEj8N5M+ZWKnKN/6b0rQkJ9Vg++9br+cMFE+sr?=
 =?iso-8859-1?Q?qfZ6j85DQlLZ2JqxyVnOkdXiMjlZuci+AuHUxztZs8gJfuGaPV/2w/Jvd7?=
 =?iso-8859-1?Q?132OZklMeqVBlj/eQ03b+tiXV3EcSXEm2sOCpPzT8EeKCo16507D/tIZi+?=
 =?iso-8859-1?Q?FZBwcZEGoBmeigitlqJ7RADRdUCSpxaCWsCmTk3stqP/qGLL5aUf3YVCKh?=
 =?iso-8859-1?Q?QS3C88iVDLIhhyw7Lb1ZqbB/uxMlXWBrZgErrS+W4LyzzX/0872I+CBRJ7?=
 =?iso-8859-1?Q?kDM292lEdy+SFmIidDsDXO2JAxEH2hO0xScTfXq0fjcTHTupoP0qxfx7AD?=
 =?iso-8859-1?Q?hHR1DxwIwm8eE7QMXVvUVxKx1DEMPuZW2g0ehMmHaQybIuuco7/URAqqmL?=
 =?iso-8859-1?Q?AV7YnulDIiDC2OMqKZFzGWLMGaAi+Epy9SUIfSwMVGCZvgwxUxrnaDgQj+?=
 =?iso-8859-1?Q?MfQKvYeo0B5JimmnBqLGOWHkP2PVZlbeZIp463rNaQxFkJ5lKfFXDdHpqu?=
 =?iso-8859-1?Q?KiN0N5vfSbT5zOfuY9Pm9+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kx4hGyJlmypZgeZHn5FsbO9HYxiQdVvJXAj5Ft65C9HrEzZCUZDzPzxglg?=
 =?iso-8859-1?Q?CJ/C3afecUhTGY9Znj60T1CAhhAm7yJu7e933/30/ch0dFkX29jQMvamBy?=
 =?iso-8859-1?Q?/+aCbLa5SUtdXJrcXwMcKIlnLV1irS/EiyD0ykq8T0UkAqH+DlrEboN8Lf?=
 =?iso-8859-1?Q?tDFXjex1VbG1b0EHC7tY8rX9GyJJd0zEmD1QUDmDu+Z9jQ9aIrimvIsEp1?=
 =?iso-8859-1?Q?V0sTbQEimgJpMaebTvdKbGB6nfHDQBUNDobrH6t3UwtU7xLyp2Whro7EUy?=
 =?iso-8859-1?Q?VwwZEuZX/dg3rRyRpI1Xl1r9OvQPJVFEwXwjVevqPEeHXCKGGtphYZi711?=
 =?iso-8859-1?Q?Gt87NqDYEK/nRBP3uxdhc8dGXt7ggrntR+kF5RpW/Bp3VGxbxSSdKwc8Sb?=
 =?iso-8859-1?Q?KrqvsRWKTe7Ysatrnkv/PLmtEpXa1QBA1VoHiYguwiWA7nsfq2rglp7DlE?=
 =?iso-8859-1?Q?S577Ic3g/7zkgeOkg8pZ0GCqoJhZB43Ck+ABKKM8wumWV4xo5k9yBMUTTh?=
 =?iso-8859-1?Q?/Q3vmhlgUV3SgfGRrcHpwlfa3iHXA1SNJnuLer5WyqhGkUq5+K2jYvKmeT?=
 =?iso-8859-1?Q?oQlNAdgqjvRkq1uCcg7k7ysvqDxhqc1yb4YxtuMfB4Kxq5e20P1TsJyS59?=
 =?iso-8859-1?Q?OQEW+bcu4GVJaid+cOE9MuG4P8VmluuOPHsy+Ls8YrbKhYVZlQYvmTbpk3?=
 =?iso-8859-1?Q?GwOV1m/m7HbAzvA+++HCbhOsXvueTTGHB2uv7BRK1hgL3xhlpi0IABQVV0?=
 =?iso-8859-1?Q?aLsLpBzFUsGbiVqpVHSPNdSDngDNADmlVwZO1o6N9QsB5NJRGoFSsDGKYr?=
 =?iso-8859-1?Q?klnMwO5J2u7zySHEDFDr96vzZgfycWFTFAA2sMfBNZfAyqFUUnskjFn3qQ?=
 =?iso-8859-1?Q?hZjyc3EjDMLSnkP8fNxgcVJsvht61glgIYMvGfsxDg8h2w4aOfFyLBJEWG?=
 =?iso-8859-1?Q?E9NGickiFatkKi4bkj3XWAIppm8HO2BQhxMx4mFTog7jJSOlIp+uXd0E0l?=
 =?iso-8859-1?Q?FGO659Z2HAfgD8P9fAmN4XN/6VQRZUMNQdy5D6McdgIwo7CMbdPxWvJueQ?=
 =?iso-8859-1?Q?PVcVcxCRwdvSG/qy9CN5GuxeSsP4tsJdE37IgjFcJ230PUm7C+NWzsZzoF?=
 =?iso-8859-1?Q?0n8uy3Tf5OLjQBrj2DmcOvcFVfoBjKKpRIx6LijoyQL7L+MBZaTxUa8mau?=
 =?iso-8859-1?Q?TNjPiZNWSxNnkIYk23tO00IbmzLpPmt4bmaTxm20jzHqvTC2DFwP3+Fj9f?=
 =?iso-8859-1?Q?F5zkoKdpz+SOeF1U+6wXbdhm64lfMnx4kBzlJKEdBvE/gGMVBsBS1OgsUs?=
 =?iso-8859-1?Q?KKlFKVFX1ikjwk1dh9cne2wNzSlZ2G51mXD6xgNpIXUDT8pSv14OnIVKrG?=
 =?iso-8859-1?Q?SWbL1BHOSQS40cm615VpYj0qqGWzVdcxJmn3Egp6mgWfmVD65IUz8usK51?=
 =?iso-8859-1?Q?jeby8H2C1Ea+hZqsSDWWjb3MHayyrGVuXYWPkJ8bcuzfLz7rnCYxtNv8oo?=
 =?iso-8859-1?Q?43JWgvPpbFU9FNPpIClHe0Ysg5YqJD64zRnLbJ4mJALFIRIpttHVEfXVvI?=
 =?iso-8859-1?Q?VLqUa8YI5qEGeKCKAqc1oENbZ/qRpsoT+lcTvWP/jIj2fDBs0m01HGJunO?=
 =?iso-8859-1?Q?FD89goVbI9VxG8368QQ77JpHIHInR7zgV3skNKjVx10RR245iTsPUVgA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df215d04-f39c-46ba-17b9-08de27adaffa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 20:53:26.9527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ZKSVlEcH56qk6tPjUOOmrxI5Mj13DT6yf/5tx65G3nSsY8t+IdYGRbrs+3WMBHPz7uTlls/ibt8/DflEv4CIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5874
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

On Wed, Nov 19, 2025 at 08:30:34PM +0000, Matthew Auld wrote:
> We are meant to be checking the user vm for the bind queue, but actually
> we are checking the migrate vm. For various reasons this is not
> currently firing but this will likely change in the future.
> 
> Now that we have the user_vm attached to the bind queue, we can fix this
> by directly checking that here.
> 
> Fixes: dba89840a920 ("drm/xe: Add GT TLB invalidation jobs")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index f3b66b55acfb..2ed8ee32b5cf 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -2481,7 +2481,7 @@ void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue *q)
>  	if (is_migrate)
>  		mutex_lock(&m->job_mutex);
>  	else
> -		xe_vm_assert_held(q->vm);	/* User queues VM's should be locked */
> +		xe_vm_assert_held(q->user_vm);	/* User queues VM's should be locked */
>  }
>  
>  /**
> @@ -2499,7 +2499,7 @@ void xe_migrate_job_unlock(struct xe_migrate *m, struct xe_exec_queue *q)
>  	if (is_migrate)
>  		mutex_unlock(&m->job_mutex);
>  	else
> -		xe_vm_assert_held(q->vm);	/* User queues VM's should be locked */
> +		xe_vm_assert_held(q->user_vm);	/* User queues VM's should be locked */
>  }
>  
>  #if IS_ENABLED(CONFIG_PROVE_LOCKING)
> -- 
> 2.51.1
> 
