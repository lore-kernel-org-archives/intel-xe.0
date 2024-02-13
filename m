Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC6AC4829A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 20:05:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BA310E1B3;
	Tue, 13 Feb 2024 20:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GnzJhc0a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4AAA10E267
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 20:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707854737; x=1739390737;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=O668dTEMHbVd144wmY5yFlNXe+J+GKGXV2F08qC2UtQ=;
 b=GnzJhc0aNYpAJrLa7KaNWuN2OAK1Mq8DWBCRUu7X73txLDo+6aInQwSs
 C5K4r+L26LPQ0sf3NJsfgFao2WyVZrroyk2OCkEW+h5k1jCX0UmXyGDMa
 EslRRuxVPa3qfBI7eNgQBrMHK/UiD1vXgmG0cPfP1S4jGcRUyPsM3Xzuk
 yo3Q7zsP2Mr9ABp8GhhWwO02HROkgqXfo1SZbwvOwUon5uBjO+iK9MRHg
 JgeZi6kaz58y23zu0tr8aLp9vRRsOE3SFC5YLX+w/mAPyahCMeATO2aLB
 fiA7/fspgoGX0dlKuFiePc/3BJRp2PKTKDj5XZQmRqlDLGs+drMhGKNYU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="437026828"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; d="scan'208";a="437026828"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 12:05:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="3333334"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2024 12:05:34 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 12:05:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 12:05:33 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 13 Feb 2024 12:05:33 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 13 Feb 2024 12:05:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVsJv1OeGMGHl4UtQPFZ1XsnlHmaxehaLlPMdP9a7s0t8kUnwZcS+PeJ5H+rZtKhS2cNTN/c1zcjeMKsE8A9wnTzMtvuQ6n0LACogmOcvmi580ygaVZKAH1jFC/lyK9fnTiok0hKtuumon1JaMJRtxiroULF4b9vBqgmHohAM5TpWbsAbbhnP9aVeibkF3ng/Mr/94pBy3pEPofBhY5m4Uv+oKLaS6JsIK13aJOTDh6kCZZRt4Fvo5yMDe4jLDrlwvEgubjx/m65va+MIYQuyVevG9c0I7ch9k++xYeUx0sjY2D3oZA1eoLZyJhOvXsdz/pVZS8dXbDBaRzAczP/eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBgkSDWnyqFISCRHvjnw4PiMmV1c14yrs1VuunH4txE=;
 b=XaIPArq+Ni8yySws+cdWczzMOV8csqEbGJWA/QE/citIOP1WUx4xZ/ZZPR/zYjf5PU4kBD16xxX0hw5O5w4j9wsHXeJgeibFIN5FvQ55dgGoZyJTv9Jct3wAy7yWJIgWtxKWKgugs67xjjYgaR0yHNdsTsaXv8dDL6rj8m9m4JUMbwM4/YYnXTgxbfKEWgUFdRjotCN432a5WLZjFgq0tB7Ru8CekQB6yU0Lqo0Cb9WXEf9MKKQ2OgplhfWuZ/2msAopuaIiXTnJ4Hjeim8vWndfNR2a9QNNUIhpUGNPOAGRYjfLTTBDx0mPs6wVzcNUi9AzFZwGrplPYWspknB9KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CO1PR11MB5170.namprd11.prod.outlook.com (2603:10b6:303:91::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 20:05:26 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::152d:16f5:ab9a:7c6e]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::152d:16f5:ab9a:7c6e%7]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 20:05:26 +0000
Date: Tue, 13 Feb 2024 12:05:15 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 13/16] drm/xe/oa/uapi: Query OA unit properties
Message-ID: <ZcvLe2dF/QFs0QuS@unerlige-ril>
References: <20240213064423.131601-1-ashutosh.dixit@intel.com>
 <20240213064423.131601-14-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240213064423.131601-14-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY5PR17CA0046.namprd17.prod.outlook.com
 (2603:10b6:a03:167::23) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CO1PR11MB5170:EE_
X-MS-Office365-Filtering-Correlation-Id: 12f299b8-1c68-4a3a-1909-08dc2ccf1e86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CWtIH1IWw3Cp+VY11lWOzu4BHJ6O9Z+4sYuolK0w7M6naPuHEj+lK5spDDedbI3fQvvR4cLyTBwsIFWLhSOauKK5OEhJB8RBK2BCPClQcUpKY9sm9hWuFsnOao59ywrAdKNv9it3g+9H4qlvLWmkMKsAjsN8Y4MUBmFpnrhAy0TlWBs/0xrFO+MyTYbOD9MrBCyuezjCRMbEZQTA9IIXuVu0odPzCif2mx5tFDEs6RnFhiQt3xwKtkwj1mTtOA5tZqGRakiR1abSYeGExSm7YAGwdQDyyqPBfplm59Lwy8Ojlgf8uM+rfcReYwpR+VVcygCCg5xrNHZFW1MJwZcHPV9DoHR7k1FaFvlksATJYdyXA9EBhMnRj0iu0aQKD1n22ir0mM1KUw1lTtSWFkR9Jo5cPDY5zNAhLcYdDCPn1LuqBFWpyfsye3WIwcVUIpzjx6u+PwWwJFTAmAP3ivfulVOnLWzQ8b9W+ZtEX+uXDmBLDYGYh3BnA70yeSFCn7pgKn+Ry4BJHxdk2/j3hsizBMdZ5sxh7UWAiRE/akP+qS7QxqtawhN/m587jG2vywQ4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(39860400002)(136003)(376002)(346002)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(33716001)(2906002)(478600001)(26005)(66946007)(5660300002)(6862004)(6512007)(6486002)(4326008)(6636002)(83380400001)(8936002)(66556008)(9686003)(8676002)(6506007)(41300700001)(66476007)(6666004)(86362001)(316002)(38100700002)(82960400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXBIUmVrK3p0RGFyN05VQU51aGV4VDM4L1loL0pOd0xsdmI2RHlHNGc1NklP?=
 =?utf-8?B?Nmdob1Y3dWtnZTMwZXlXMWFrRkpmanJwcWt1QUZld1BDcmU1bGVBWk9sYmV2?=
 =?utf-8?B?R2FUNXpVRVdERUNzUnUwdTVKZFBtdnNKMUdpTXFSR2pYcWhyQTl4Sk9uV2N5?=
 =?utf-8?B?S2M0czVWUEZQUUVhbnl0Z0ZXQzB0Wm1xbWRBYUdpZEE2OVlNdmM0QzhETVh3?=
 =?utf-8?B?TlpvME5VZnpoWjlPVHRuaExUTitSd0psYTFGQmpMcE1laFRYeXNqOUUwcy9H?=
 =?utf-8?B?SGNxK01nRXZxWXhuM1VheGQ0b2tUejBnWXhWS1NTaTR2M3lBaG1kRTlma0p6?=
 =?utf-8?B?eERKSW5aRVBwMm50bW9aQml1dWVORytVNm9nLzY4Nk84OW9GeG1pMVpCR2lV?=
 =?utf-8?B?VFNvWkt2aVZZODBGTytMc1QyNU1UY0UvdThQSDFWd1VCVGdRbGlOL3RVUEZh?=
 =?utf-8?B?N1hOWExZenVpTUlXODlKRTdnUnd1ZFJQZWFKajl2K1djcFNZL2pKdFJqbm4x?=
 =?utf-8?B?RXRic2FoQmRvUUdoWUlEd2MwbUc4czFSVG11Mm53TG5jOCs3RUloS1ZCQ1ZB?=
 =?utf-8?B?MjVyeUJuckRuU1ZKSUp5RHJZdHJlUGRhM2taQkVKTHNxdFhmR1Q5ZGFsaHpa?=
 =?utf-8?B?OGpVVFEvTmhUNTlWMEFab0g5eEVGOVRYOFRQR0M3R0NaUURmYWFpQlVoQlp3?=
 =?utf-8?B?QzdOMTVBUkRSM3htT3NjenFnL2lsMEk3anVtUmRpbTZOb29Xb1BzMEhEdXJW?=
 =?utf-8?B?K3VZd2tYYzBXMWRycTY5cXF4a1JHMG4vbGczUXUvRWxKT1R1QUVkYnJHa3JD?=
 =?utf-8?B?MWhHMTRxN1FDejdaSFN3WTVxL2NKbC9JcXlxZ08vc3NpTkRCQU0wQ3RBMUll?=
 =?utf-8?B?ZDFjVlpJdGRSNmpZWDdDOE1TdDI2VHBBNFFUTnJ2ODgzL2lYY0NsT0NXc1VL?=
 =?utf-8?B?ZGNLZjFQeng2U2hzS3BQaDFhTEJXaU5XbW5Ib09ocGpWMEdxMVpOSnQrd1dM?=
 =?utf-8?B?cEdzUW9NaVBCby9yUWhHMGZxVzkveEphSFNadit0VTdJRk02bmpaKzkwdEJn?=
 =?utf-8?B?VmhoVG9ta0p6TjFYV1QrUVRCWjBxblhkaVBoSWZIMk5HYndqdVZiWjZONmpo?=
 =?utf-8?B?OWdrWkFTaGo4NVpDZytsQlJQc0ZZRHVVMVJjRllwc2Y1WWNOeG1RcWhoMG83?=
 =?utf-8?B?NFVEb1dlY29qV29CaUo1RTY5ZkcwczR2WHpDS3gvS01CU1h3Wll0TXRQNzg5?=
 =?utf-8?B?SUVCSGdiOUJFUzQwZzNqV0RzWituZ2M5MDIwMHhsU1cvL25RYVNMY1FJODRB?=
 =?utf-8?B?VUw2VWt6aERSbklxY0xvbFlSaTRhZWZ0WWVmczlPa3p2bjZwM0ZUcFhrQjFs?=
 =?utf-8?B?N3I5UHVFNW8xbUc0QU85Z2NUNnpBR3ZydGFiL3pTcStqRHkyek12T1pJN0Fz?=
 =?utf-8?B?VmZWM09PZkJaTXNkL2VZczJwVHJtV005bThTVTBaUThNZDQ2RXZSeWJlVEYv?=
 =?utf-8?B?V1o4d2ZaRjI3T1RLQ3VKdkZuZEFKbFRWZGJhcHNIdE1ML01hR0xoYTZNblZ3?=
 =?utf-8?B?QkFXSzIzNnhhN3NySVo3UENHR2RUMllCVEFBTnhKeEpsNWtQUVdEcm9SUS9v?=
 =?utf-8?B?VWw1RmFkdnpBWVJIcjJDVG9kem45d1FicXcwWnY3eWloSy82Y2dyOGNYQmtv?=
 =?utf-8?B?MlNIQkJ5dDNaNXcrbHpIZDhnUmk0dEF3VjFzSEpkUFEyZHhIMEtBaUFCMkc2?=
 =?utf-8?B?V0drU2lHVEtyd0J6QkFUV2FYRSt4NzVXa2hhS21OMFFxUldXYmw1cUZBTk1J?=
 =?utf-8?B?SmZpdG4xWjNwbEJxanN5dTlmVDhxM3hBd1J0dEZJbzBPWjRxc3FZZ2hlSlgx?=
 =?utf-8?B?TVNqeDJUK1oyMXBhUXlVTmk0dDltS1Yva1FNbDlWdms3dTlBNWxDRlhPQVJ5?=
 =?utf-8?B?YkxJTXlGQ2U1WUNWRWNjVy9MV3RoOGhKa1FKQWo2QWNpVU82bVh5cGRSUjhz?=
 =?utf-8?B?M2JnSG5pMGZudFpEdjRsdU5tKzkzQzdxZnJlcFFISHZFdU1CVUNZZDhEbEJY?=
 =?utf-8?B?cTRHdU1ySGVMMWJZV3Q1OFZVcC9tYXVZbU1nTlluT2F3a2lja21IZmpJSkJK?=
 =?utf-8?B?N1AwOHV4cnZOSGltWXl6aUpYa0VSbVVCRSsrRmNCL3c2Y1BJM1VrcWVyaE1E?=
 =?utf-8?Q?KYUv/OZ0u251bZyHgCwJKVI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f299b8-1c68-4a3a-1909-08dc2ccf1e86
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 20:05:26.3051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZAiIc1llugKbmvT5IgmmgCm0psxvsJOpDsuaexVu8W8RNDyoLqPSCRbu8dV3ld3WwrKl1ubv/KKZfmcmq/k2wi+YBgLUpWw6mcVyhisgWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5170
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

On Mon, Feb 12, 2024 at 10:44:20PM -0800, Ashutosh Dixit wrote:
>Implement query for properties of OA units present on a device.
>
>v2: Clean up reserved/pad fields (Umesh)
>    Follow the same scheme as other query structs
>v3: Skip reporting reserved engines attached to OA units
>v4: Expose oa_buf_size via DRM_XE_PERF_IOCTL_INFO (Umesh)
>v5: Don't expose capabilities as OR of properties (Umesh)
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

lgtm,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/xe_oa.c    | 13 ++++++
> drivers/gpu/drm/xe/xe_query.c | 77 +++++++++++++++++++++++++++++++++++
> include/uapi/drm/xe_drm.h     | 73 +++++++++++++++++++++++++++++++++
> 3 files changed, 163 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index dc138e5a10087..1178620cd4e76 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -1018,6 +1018,17 @@ static long xe_oa_status_locked(struct xe_oa_stream *stream, unsigned long arg)
> 	return 0;
> }
>
>+static long xe_oa_info_locked(struct xe_oa_stream *stream, unsigned long arg)
>+{
>+	struct drm_xe_oa_stream_info info = { .oa_buf_size = XE_OA_BUFFER_SIZE, };
>+	void __user *uaddr = (void __user *)arg;
>+
>+	if (copy_to_user(uaddr, &info, sizeof(info)))
>+		return -EFAULT;
>+
>+	return 0;
>+}
>+
> static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
> 			       unsigned int cmd,
> 			       unsigned long arg)
>@@ -1033,6 +1044,8 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
> 		return xe_oa_config_locked(stream, arg);
> 	case DRM_XE_PERF_IOCTL_STATUS:
> 		return xe_oa_status_locked(stream, arg);
>+	case DRM_XE_PERF_IOCTL_INFO:
>+		return xe_oa_info_locked(stream, arg);
> 	}
>
> 	return -EINVAL;
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index 4f1ab91dbec58..5dfc6072a0b5b 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -516,6 +516,82 @@ static int query_gt_topology(struct xe_device *xe,
> 	return 0;
> }
>
>+static size_t calc_oa_unit_query_size(struct xe_device *xe)
>+{
>+	size_t size = sizeof(struct drm_xe_query_oa_units);
>+	struct xe_gt *gt;
>+	int i, id;
>+
>+	for_each_gt(gt, xe, id) {
>+		for (i = 0; i < gt->oa.num_oa_units; i++) {
>+			size += sizeof(struct drm_xe_oa_unit);
>+			size += gt->oa.oa_unit[i].num_engines *
>+				sizeof(struct drm_xe_engine_class_instance);
>+		}
>+	}
>+
>+	return size;
>+}
>+
>+static int query_oa_units(struct xe_device *xe,
>+			  struct drm_xe_device_query *query)
>+{
>+	void __user *query_ptr = u64_to_user_ptr(query->data);
>+	size_t size = calc_oa_unit_query_size(xe);
>+	struct drm_xe_query_oa_units *qoa;
>+	enum xe_hw_engine_id hwe_id;
>+	struct drm_xe_oa_unit *du;
>+	struct xe_hw_engine *hwe;
>+	struct xe_oa_unit *u;
>+	int gt_id, i, j, ret;
>+	struct xe_gt *gt;
>+	u8 *pdu;
>+
>+	if (query->size == 0) {
>+		query->size = size;
>+		return 0;
>+	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
>+		return -EINVAL;
>+	}
>+
>+	qoa = kzalloc(size, GFP_KERNEL);
>+	if (!qoa)
>+		return -ENOMEM;
>+
>+	pdu = (u8 *)&qoa->oa_units[0];
>+	for_each_gt(gt, xe, gt_id) {
>+		for (i = 0; i < gt->oa.num_oa_units; i++) {
>+			u = &gt->oa.oa_unit[i];
>+			du = (struct drm_xe_oa_unit *)pdu;
>+
>+			du->oa_unit_id = u->oa_unit_id;
>+			du->oa_unit_type = u->type;
>+			du->oa_timestamp_freq = xe_oa_timestamp_frequency(gt);
>+			du->capabilities = DRM_XE_OA_CAPS_BASE;
>+
>+			j = 0;
>+			for_each_hw_engine(hwe, gt, hwe_id) {
>+				if (!xe_hw_engine_is_reserved(hwe) &&
>+				    xe_oa_unit_id(hwe) == u->oa_unit_id) {
>+					du->eci[j].engine_class =
>+						xe_to_user_engine_class[hwe->class];
>+					du->eci[j].engine_instance = hwe->logical_instance;
>+					du->eci[j].gt_id = gt->info.id;
>+					j++;
>+				}
>+			}
>+			du->num_engines = j;
>+			pdu += sizeof(*du) + j * sizeof(du->eci[0]);
>+			qoa->num_oa_units++;
>+		}
>+	}
>+
>+	ret = copy_to_user(query_ptr, qoa, size);
>+	kfree(qoa);
>+
>+	return ret ? -EFAULT : 0;
>+}
>+
> static int (* const xe_query_funcs[])(struct xe_device *xe,
> 				      struct drm_xe_device_query *query) = {
> 	query_engines,
>@@ -525,6 +601,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
> 	query_hwconfig,
> 	query_gt_topology,
> 	query_engine_cycles,
>+	query_oa_units,
> };
>
> int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 2032b20153314..2c28198190c02 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -646,6 +646,7 @@ struct drm_xe_device_query {
> #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
> #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
> #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
>+#define DRM_XE_DEVICE_QUERY_OA_UNITS		7
> 	/** @query: The type of data to query */
> 	__u32 query;
>
>@@ -1415,6 +1416,66 @@ enum drm_xe_oa_unit_type {
> 	DRM_XE_OA_UNIT_TYPE_OAM,
> };
>
>+/**
>+ * struct drm_xe_oa_unit - describe OA unit
>+ */
>+struct drm_xe_oa_unit {
>+	/** @oa_unit_id: OA unit ID */
>+	__u32 oa_unit_id;
>+
>+	/** @oa_unit_type: OA unit type of @drm_xe_oa_unit_type */
>+	__u32 oa_unit_type;
>+
>+	/** @capabilities: OA capabilities bit-mask */
>+	__u64 capabilities;
>+#define DRM_XE_OA_CAPS_BASE		(1 << 0)
>+
>+	/** @oa_timestamp_freq: OA timestamp freq */
>+	__u64 oa_timestamp_freq;
>+
>+	/** @reserved: MBZ */
>+	__u64 reserved[4];
>+
>+	/** @num_engines: number of engines in @eci array */
>+	__u64 num_engines;
>+
>+	/** @eci: engines attached to this OA unit */
>+	struct drm_xe_engine_class_instance eci[];
>+};
>+
>+/**
>+ * struct drm_xe_query_oa_units - describe OA units
>+ *
>+ * If a query is made with a struct drm_xe_device_query where .query
>+ * is equal to DRM_XE_DEVICE_QUERY_OA_UNITS, then the reply uses struct
>+ * drm_xe_query_oa_units in .data.
>+ *
>+ * OA unit properties for all OA units can be accessed using a code block
>+ * such as the one below:
>+ *
>+ * .. code-block:: C
>+ *
>+ *	struct drm_xe_query_oa_units *qoa;
>+ *	struct drm_xe_oa_unit *oau;
>+ *	u8 *poau;
>+ *
>+ *	// malloc qoa and issue DRM_XE_DEVICE_QUERY_OA_UNITS. Then:
>+ *	poau = (u8 *)&qoa->oa_units[0];
>+ *	for (int i = 0; i < qoa->num_oa_units; i++) {
>+ *		oau = (struct drm_xe_oa_unit *)poau;
>+ *		// Access 'struct drm_xe_oa_unit' fields here
>+ *		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
>+ *	}
>+ */
>+struct drm_xe_query_oa_units {
>+	/** @num_oa_units: number of OA units returned in oau[] */
>+	__u32 num_oa_units;
>+	/** @pad: MBZ */
>+	__u32 pad;
>+	/** @oa_units: OA units returned for this device */
>+	struct drm_xe_oa_unit oa_units[];
>+};
>+
> /** enum drm_xe_oa_format_type - OA format types */
> enum drm_xe_oa_format_type {
> 	DRM_XE_OA_FMT_TYPE_OAG,
>@@ -1537,6 +1598,18 @@ struct drm_xe_oa_stream_status {
> 	__u64 reserved[3];
> };
>
>+/**
>+ * struct drm_xe_oa_stream_info - OA stream info returned from
>+ * @DRM_XE_PERF_IOCTL_INFO perf fd ioctl
>+ */
>+struct drm_xe_oa_stream_info {
>+	/** @oa_buf_size: OA buffer size */
>+	__u64 oa_buf_size;
>+
>+	/** @reserved: reserved for future use */
>+	__u64 reserved[3];
>+};
>+
> #if defined(__cplusplus)
> }
> #endif
>-- 
>2.41.0
>
