Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB29C47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 13:15:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF1210E00A;
	Tue, 16 Jan 2024 13:15:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4DE10E00A
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 13:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705410912; x=1736946912;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=YwJi2m+88oewqVVGb9XQzQQ0yrAjC4TwnUKoz1bZUVU=;
 b=HepkbzDyhpT+9CrjFOYo22pVJkfZEcLWnij6HTttOqOpO5CN3BLYbjKB
 x/KCgS9IRV1PUP9stijBg5td7zvftvUEPfgF21ln2Cv1USkTzlsOpovmJ
 6NajDmOhQfGPZNFTWtQl0tqT4rEuyuctPJ76dVvYbZXrwl4W+mE+3qKzG
 YkgXNekjGn1SChgYsUH8ChUbrhZD0uVa/ARMMFejNlD/XJ2T4FxXEHLek
 Lukus7L/hkC7IwBFcKiYtbjOhWajdZSErHzPHSA4rY5yIANQR3G6ouVwa
 IhVtwcCSj2GUVvzExf0eFm144MnKTEy5WlW2TnCu961MY93SfSYdyRaiJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="431024613"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="431024613"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 05:15:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="818175973"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="818175973"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 05:15:11 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 05:15:11 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 05:15:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 05:15:10 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 05:15:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7WU0uwOItZ9YZ1kgQBnXoK2sm60gTWgLTGzeF4JIpe+bz7Yt5Y4lXG/c6lb2+AWuvnPQrw/J4YNnSfxiNrGPefDZKNF+VWJJpcBORSas9z45Ke/p5szqwOJX6ELEhYvFtFdhUIsSqfZihWeZCsXh6Tbgw+4VFIzJSGn4oJ20EAULBCOQOGDATMBs0k9JbIZ4jHXvP5TeYIfoqKGa2e3ff+Sciu9PLuGYUyot7CZAXllKmzLBOwnBNv1aLb7WFH7CnyOPX10KeQ3RjCtd+7QwOqCUi9aQNJCo5Z23mMXCSkhuFzN69LTm+0sDdHqwbuyJxdP2dG6iXZaU4OGFKUsDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2C8p8BwNo506URguymWAea4ltPw0cnKBgGixugcBwQ=;
 b=X4LpE7A3B46RzKGPBKyOvSnxnFyCXzx7LsBrCH7rMnRqJDZ8uhLnuaQ+4e9BsWFOARG8dznloaLiN/9JFIOCXJomT+FPLgZ67grtv8NAhgsPymBjrOwZQGHHKHHgBKQ4B9DGU1nqeSMYOaExiKS9StDwPtOVpSTwIXQoSXeaVRmg3YO1UYqlXgtFKiRYEgka7TFxXkNIQKa57GXxLHZEyCA49rLcr1cAHlCZLBwkC48l2Ow82JoSdNlP1aqp9LZCYwlwDX+Wj2Ztb0kdJbcUG6g4rDkafXihXsmxXp6Jros8kcTbvexED6bhbGPH44vkG0NisGpnFT9lSS45EBSh1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH8PR11MB7046.namprd11.prod.outlook.com (2603:10b6:510:216::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.29; Tue, 16 Jan
 2024 13:15:08 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::559e:7844:adc9:7793]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::559e:7844:adc9:7793%6]) with mapi id 15.20.7181.020; Tue, 16 Jan 2024
 13:15:08 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240116120207.1133-1-michal.wajdeczko@intel.com>
References: <20240116120207.1133-1-michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe: Mark internal gmdid mappings as const
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Tue, 16 Jan 2024 10:15:05 -0300
Message-ID: <170541090505.29849.969547807242910658@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BY5PR16CA0016.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::29) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH8PR11MB7046:EE_
X-MS-Office365-Filtering-Correlation-Id: e5c59745-84b3-4d16-abef-08dc169529c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1n/bls/byYjhNFIJpRT7JLqjor0k2sPEWdzx/HhS5skDdqJqKBh0EUX7MPKUxMTKeRqQ6JUC3VDqMK2dk4kLDLAuwOcxPC5+19Q5s5jX6Mmg+QTmPABWFGWStDTvzODnGI7/CgAhJRIcma7qMousV5tgk0dKY/XJfuEp2OXZFmF3/2bEHr+e5hRL7Bs8PmQz7AaXF1bYDL95tuQQ+TBLn4wDbxcwHGKpox5x0DYNE8Hfg734wwprrmLvVxO6ADLUZKKjM2ShIuUc5ch60y/Gwm440ZZIoTIjFenaXOXo8sYrCf4oyK9uvxzCD4YApmIepjfiJrqeOQXbLRHwEoy83zPBQ9l6HvIhYMJHqxoWF+/vO9kN2eryo4HC7nf9C5m2ENICJcQopkN2qcEx2wRaP7URhjNv2jVzDYvpM+onzg4pqcQWxOY+fG0eI1ZeLpyZcWZG1yxgrWvCYC8h9VWafHyCTvJGqZC5PQR0YpwzhpHYM86ZiFrqW82hkYQ0dVEFzjGy3qRBRPsUaAtteu1aobWNRd6Vv/iOng+Ei+pJ/rFlXmGWqkTySZM4oXSBpb4S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(346002)(136003)(376002)(396003)(366004)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(38100700002)(2906002)(5660300002)(8936002)(316002)(8676002)(86362001)(44832011)(4326008)(41300700001)(83380400001)(26005)(107886003)(478600001)(66476007)(6486002)(66946007)(66556008)(9686003)(6512007)(6666004)(6506007)(82960400001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDl0L2lRZWVuamN6UXRwNEVyeldsVklOZ25lN1lWdWRUek1tZG0rR3I1cmJV?=
 =?utf-8?B?NG0xNnl4Tk5vU2p0TEVndjVwQlNmczlnQ3prWmFzbTRFQkR2RnA5WFQrVTEw?=
 =?utf-8?B?MFV6d0VtM0hpT0xDRVFaNHZCcy9DUVUrZUNFb2gxUTQrUVNJYWI3Q2x3NTd6?=
 =?utf-8?B?MjRhQTFpeEExdCtQeTk4K1JreEsybE9ldzZCdEdVK0laRnhmSXMyOVI3bXQz?=
 =?utf-8?B?SzJuYkIzWk5nS3MrV3RPLzZGZncraTJCN3BrMnZRVmxqUmJsdDBteFpyem54?=
 =?utf-8?B?UTd4WDBzR08zOEUwZTc1ZHB1QVh6V3pCNFFyblpISjdRQVNncVAxR0VtV1F5?=
 =?utf-8?B?dW5CVGwwWWRWWSs0L3VaNERnQUpGU2tCR3RmK0RqYTNEMk5aa3FERisvdURE?=
 =?utf-8?B?VEZPWkV0U0Z0L1ZDUGZWR1dqN1UwK0RVZ3R1TWpPQmhvRythVVA2MG90VThI?=
 =?utf-8?B?VFUxRS9rV0xYWnd2Wmh2L2VaUGVFRjJTc1F1c0tnb1VBWDZRbUxVNXYwbFpG?=
 =?utf-8?B?MVVqaituZ3lRU0tGNUUrZXh5T0QwdXVCcERWRHVkMFBrUjJEUE5XVnpaSnVP?=
 =?utf-8?B?S1V0Z1J5L241WTlPUU4xeTJJQnJiTlFvQXRkNzNkTFJrcnIwbXpwVitUYWtw?=
 =?utf-8?B?bXhPSnVlcmJEdUIzSHFGOUN6RTFMK2tiOEpBV25SWUF3bXVpOGd1SllYKzhU?=
 =?utf-8?B?SUt6eHFjSitpdDhHU2FEWkprUEZaREJ5NXh4ZDBkS2JWaUpNd1lrUktJQ09J?=
 =?utf-8?B?THlIdTdsSndOWnNMcEVsRUtuUlVNN0pyUmh6bTJ5TmsyQUlldUZNNzR6cy96?=
 =?utf-8?B?aFVlUFRsbUVjQUJISkZKY3NlaXRpZ1VhUVpnYTBSak5qMjF3Ni9KUG9FUHlu?=
 =?utf-8?B?OHFxaXhjSXROMEpjempOQkVBc05QWUMzY2V3UUZERXV4ZlpqNWpHM21DdFdB?=
 =?utf-8?B?UkJ2dExyeXZSZHVEamxMNEFyMTY1Q0x3bnN6Z1dZNXBJbm12V0VKVk92Qmpt?=
 =?utf-8?B?eUM2a0FSY3Q2WGFCU2VXamZuOEEyVy9DcTcrb2pJNzBwd0NKYWwwbitXd2dL?=
 =?utf-8?B?UDVBMnRTWGFPVDNqczRaSXhmNDV5MnA4QVIzSTQ3QmhXTXNTRDJkL2NCYnp0?=
 =?utf-8?B?bGxzd3B3TkpGSFJZN3ZBcmxsVXU5TzI4SlI3ZCs1anBjUUVlNkpiMGZWS1pp?=
 =?utf-8?B?MXIxeWduOFBnR1d2WDZjanpxYThxZ0ZhWEZDdjAzM3ZpQStxRHByYXViajA5?=
 =?utf-8?B?U1NTaEVMQ3Rva1pvay9oMXBPYm1zVUtMWU9Ucyt1MHhmUWtUWmd2bU5QbUYz?=
 =?utf-8?B?ZnAwRHMvUyt4ZSttOWR3RW1vNGlPZ2ZtRE4rTllPRDNNMWtFbmxESDBFallE?=
 =?utf-8?B?OEt5Tk9BRVZINzgwWCtOb2V5R2YwN21vS2pnbnFpdkw4VExSQ2ZiNitURU1G?=
 =?utf-8?B?dXdhMkQrSXA1MlR2YXM3UFZJTnhWSWkzU2dXcy9MOVpvakVUS05UNEUyRWEr?=
 =?utf-8?B?Q1ExWkMvUHBEcis5dk9iUDVvNzN2aTdHUGVZVm5WWVBCeHIrZ2JyY2FsVG9n?=
 =?utf-8?B?Z0VSdzIwUTVYVzhZZWhJN0RyaGJHYUJPYS9JcG5nMUJML1A5NVhQeGJUYTFD?=
 =?utf-8?B?czdWRDYzWUtTNzlpQ3JOM0xuOGhMZUZHME9sYXpmWkV1a1BEejIrMlZvUlVn?=
 =?utf-8?B?NDdxNGcxOC9pd0w1WFcxaEhDU29DMnQ1dzVlc3dZbUxkMXR2eStZUDlMR3lk?=
 =?utf-8?B?N3k1QnNDTWR5Qi9ZQTJwaFpJSHA1RUl5cFkwYzREM1V1TEFsVEZ5NlNxVFIv?=
 =?utf-8?B?OU9OTy9qNVNwSW01WXVKMWQvSzV1VnQvN1h6QkFYRW8wT1U5V0w0bGM0QTNS?=
 =?utf-8?B?L0l2QSs3WXNHTVhuT0VjT244eUdrbWorcWVjUzIzTHl6bm5YOHRqNWFpUk40?=
 =?utf-8?B?UkhnSWsvZHNOWEpBWDlmazgzTzZocTJSRnlLYmRqSWIzTlZxVk1USldIUDY1?=
 =?utf-8?B?bUc0c0xicXFJUWVQdkNtemtIM2tkVGM4TUoyRVRra3g0R1FKUENxTUdCUUkv?=
 =?utf-8?B?TnlreVZwWUE4eTJQdy9ITWJyQWQyY2ZicFJKbkx0c2NqdktaWEltcXVJczFL?=
 =?utf-8?B?OEF1cUUzQzBxVmVFaGRnMDJsN0krRDRwL3dFYndJQlFJTEVUaE9qRFZkcUFa?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c59745-84b3-4d16-abef-08dc169529c3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 13:15:08.7492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VvwRxA+/p6eAaswlbSkdvkneoXN3DWNsUsRIJ0/+6QISN7tzJ2c9+TD3+TkYyhheFmKqJgSNq3zETCGVoHk5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7046
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Michal Wajdeczko (2024-01-16 09:02:07-03:00)
>The mapping between HW IP version and its description is const, so
>mark it as such.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_pci.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 4de79a7c5dc2..df6b3b31f419 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -340,14 +340,14 @@ static const struct xe_device_desc lnl_desc =3D {
> __diag_pop();
>=20
> /* Map of GMD_ID values to graphics IP */
>-static struct gmdid_map graphics_ip_map[] =3D {
>+static const struct gmdid_map graphics_ip_map[] =3D {
>         { 1270, &graphics_xelpg },
>         { 1271, &graphics_xelpg },
>         { 2004, &graphics_xe2 },
> };
>=20
> /* Map of GMD_ID values to media IP */
>-static struct gmdid_map media_ip_map[] =3D {
>+static const struct gmdid_map media_ip_map[] =3D {
>         { 1300, &media_xelpmp },
>         { 2000, &media_xe2 },
> };
>--=20
>2.25.1
>
