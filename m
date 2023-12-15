Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D25C4167B
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 20:38:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5BB10EA9C;
	Fri, 15 Dec 2023 20:38:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF15610EA9C
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 20:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702672713; x=1734208713;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Q5QKco5BtRjiQpDbPvHHBs3gEanlIXItkRQC/bAB2hM=;
 b=C81Xh2AGrtqdBHvVpc15xTgAvA3qssM5+jKjJSdSTMh6Q7n9T+5bRjrT
 3vzFIst7fyk3sByWG4UvD9WOxFqD82+onL/YOx02q5nfUtY+4pWtdZq+1
 5liSNDGgcvfTTNwKMgDo3ktgslEBoTGA46Lhw5+LhLpEWiNomEdb76xSV
 Sx5B5vBm0VskAgaBTVvXXYSCqmaaETn3ZOpleawvJfAbnvn3GlzDplvqY
 ZprTuDXE5k0vW2WYc7jS2lMNup5RTCn+DhTrSjLru/hhHFGy96R8WuCU2
 5Uet/kcanMSaLhI2mEdKkOnnJ4tq7X1GbqPYHmsSinm1s+ovZWxitsOJW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="459648500"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="459648500"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 12:38:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="840782119"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="840782119"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 12:38:33 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 12:38:32 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 12:38:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 12:38:32 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 12:38:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mzFE5ZlBQW+lyj++/+eEFI/pLtcHwBUtZ6FN2hdzoZ9KmPZEnWjXa0tGSKeVmFR25XMxjI6UYn2Z2DVmkiiGfVcQ6CQlbEac+V9DbbuTGcQ+xf+5rw3ZQAeC4GmNaE6cvBFx9UvYhrSsBtWyMOnzX0A+XzTJJhmVZUikQ51ZI1wOhjbHD4Q3pl8N5DtuUAyMiN0Dg4Xd6+S185Nbd0UEMHoXLAsNN50Va7T2XX8FqpRdf7QX/FOmW6mZ9/ICkeUVG4tGCJowpHdlVLIh8cXh+EQZjnWZ3sgNgzjfpe9BC+M/Kf0ZDGuXDaxyeCwbGp+flM40enH+5CyQJyLg9GqYsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJlC3VMjiFCF2qWcT5vuJCyWCvTZVzOOSjxmeB1Chw8=;
 b=FWdqDH9dZxnsm3SUGyqG93TtvLRKwUndT//9F0tJbYqVG7esfb8AWH90HydM65qzTPynUIt/oIho4ugS1AZftHOOp3MHQFzX0bhHsKxNZQEp/45mtB3G8yz5Z410csSH5rnErhH9f2zuc0mhqX7BqLZEVyPoB5lEYgY/ijpHpKyhMGAQx44+nIFdrZBMzlsGjjO9izuFNcIrkYi0iT0pD7652OW+RTl2oQZTEnmnIk2jfpY0RiME4U/hiPB9hIMT0z+DmNVjwVpzPfy/AS/PRYjve2ZLdL4o3uT+f1PVATaDelCKhtvubFgspeqd5pu1xIwqjrZh4y2ub0iZozGJzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM3PR11MB8671.namprd11.prod.outlook.com (2603:10b6:0:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 20:38:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.032; Fri, 15 Dec 2023
 20:38:30 +0000
Date: Fri, 15 Dec 2023 15:38:26 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe/display: Fix dummy __i915_inject_probe_error()
Message-ID: <ZXy5QkX8EE-wLO-p@intel.com>
References: <20231215203331.3297341-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231215203331.3297341-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0089.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM3PR11MB8671:EE_
X-MS-Office365-Filtering-Correlation-Id: d2c262bb-fab5-4316-dcee-08dbfdadcc33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HYbaarTHlz3a3vd8kjNuCL/PRYt03pH1weCrr6IBpeJ4lR/l5gNckxNsL4B9iGN7MDPWWUZkN5LFvFRQYKyDgwvIQzLGzDOxkq24wy+jtOk2+IZ0VmXydSm90eyJsM7HFjBB4b+6uJxNWbRUh1dBYyoHUjHA3UWKlAhlLbMqrv7kguCS4ytZNTitvEcTnsHMfKsQzLuscvzmsClwDaavBwm4mV5Gj1AGQyRGcZJKW2+MfVmNZsNwRqDqec59+iqLt8LWB5pg89XmAadQx/+GsNoEbgmgLt1+AIVssa6ci46gHI0zms//m7IbGfbb07wKWeJjttspiQEU/Q5awsrJ7CQeiq1zQErJr/cae7kPmGFngzjO9qP4WizUXF4N6c6XC4u2qHn19PgH0g1DBsV/VyrMAE6qgAXMB8dLqdlT+KID+LSh4a1Cf0HKFpbWZTpeUEZfoKCX8aRz+MVMGoFvbfcn/BrhsHEzu2FZnjsWqjxHHcmF/UccwigWpDo5heUop61rNTKRAZ/yGS4h1YPCGI9N9DRj5gBY1h8l05XjTDXTxFgGBOaSoZlEaZ5BXMqa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(396003)(376002)(366004)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(37006003)(6506007)(66946007)(6512007)(66556008)(66476007)(44832011)(5660300002)(2906002)(38100700002)(82960400001)(6666004)(26005)(6636002)(8936002)(8676002)(4326008)(6862004)(107886003)(316002)(41300700001)(2616005)(36756003)(86362001)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWt2VnVnT09iVUlVV0VrRDZQWGtzNEJ6ZDI3ZFJlSS9KYkhrQ1Frd01GazJV?=
 =?utf-8?B?b25FZ0hkS05rMjd4NHFqa0FyaFVmQmx2dDlkdjJ4R2VUUHlUem5hR0xFNlBD?=
 =?utf-8?B?Rk9JWS9tNzdBbGFxRFF4Y1IwWjNSelBiMVpFOE1TTmdtTjJYUmxoZVlkaXht?=
 =?utf-8?B?UHRzcVJ4UGpjWHZpOWlqWlBZcFM4Nmo0d2I2a1VsVGNUNkhPN1R5QkVsMVVj?=
 =?utf-8?B?NmtsR0xiTkdwWE1zWi85Sit3MkZwb1E3dnJ0ajdBcnd5SlZKSTQ0ekRvTEhE?=
 =?utf-8?B?amZDa09uVEJsMnFMOTh0THAyMjBROFdxOHVvdkRtOWlDVkVCVUFMNmJMNSt0?=
 =?utf-8?B?MTlDRkQ4bGMyeXArRnRVU1lEcnNxQks3Y0Nya0h0WHpBSW11TDVxRlUzTVRL?=
 =?utf-8?B?ZnAva2NNY20zdGphZXJGaFpodVRvbXRzM2UyZDdLdmFhU05PemMyNENsTUdl?=
 =?utf-8?B?RmpYcmE4ZWFYTmZ1M1dTYXMwdHZLSWkxY0llOVRMYkoyTlZibmVsOU9DSVVp?=
 =?utf-8?B?WUVJTHIwRkFuQ2xGa1YxUjdSUGN1YjY0a0hxODB6N3Q3QlQrOWI2THJQOE9L?=
 =?utf-8?B?SHZWQjhxMzB5TUIvaDRmS0VKRVV0aVdCejkzaE5nTDRsMzNveVJ3aDdXSExu?=
 =?utf-8?B?TXZqb2xMczRvM1RFUHRzc1dQRnNJcExaTFpDNERTYi9kOEFxSU5FeVFLTTNO?=
 =?utf-8?B?MVFNSk9qMDdqOHNiN3MvNFBURXltbDJmWU1XVFVybzVzQWRsWnZJaGgzTVBv?=
 =?utf-8?B?YXYyOTkrK0pnZVhmd1Q3eEVLaklXVHhFa1lTdkxaNCtoSWFTRmROTnFBK002?=
 =?utf-8?B?UzNSa1dXQ3hPWm0zaE9TV00wSzQ3UEVhWlptQzNYYUZLM1pRRXpXNzJZSWlW?=
 =?utf-8?B?YXNFL0p1MmtMK1F0cDJvakRpaUJseTArdzNsemZOcjllM0tza0hpM3JncU4z?=
 =?utf-8?B?YkI5UDN0c3o5MWVaaHFhUlRPZS9TZGd5bHRKcFZTZEgvNHJheGVDYWVVMVIz?=
 =?utf-8?B?ekVYc2hGaFRncVpsM2d3eWJPRmRHcEdOK05PRmFCN3k4bmJOalJ2Zkl4VTlZ?=
 =?utf-8?B?MnZuL2lKRThhOFJsaUlSUUd2TUFTc3B4ZWxWekdrc25oemx4bnBzTENKWXJ5?=
 =?utf-8?B?YWFOell3NTA4aHhzOTA4Q2JRdUFTbkVYTGorQUNkaC9xNmEyakVvcE9rL3ll?=
 =?utf-8?B?ZkxGWDhSWkZsc2F0Q3NTY0pVUC9Ybk4xSTJaUkFaLzR3bURSVERVd2Jkbk1P?=
 =?utf-8?B?UGNtWDMvV1lUZ2ZoclIzVFFCSC8vc0k5R0hnanhmcHR3SkpWZXRQTjVVU2Yy?=
 =?utf-8?B?UXNZWG1Pb0VyWGlvZ3dzWVRtMmJpRldRVEJmZnk4SUlYdktwaGtiMmF0SmZ2?=
 =?utf-8?B?TGgzOW9PL0dheUZYRnBqb2ovTDFHdWYvWWpzdDY3eFJHVi9IbnQrMm9rdDd2?=
 =?utf-8?B?M2o5Mk13YU9ZbWc1NS8wM2x1dEJLZlcwQVRxWGJSWlExMzRJeTlVNnE5NGxk?=
 =?utf-8?B?cHZSL3lITjJoTitMWWRiblFIQnFmTkg4Z0MvaEcybkQydWU3aTQzdzBjTVk5?=
 =?utf-8?B?QTB0UlBtZE9oMENTaEF6ZVp0SU5FOEJiUUd3WU01MXQvZlhaWmtma3QzYnc5?=
 =?utf-8?B?N2JyMWJrRVJUT1l5VFVoRWtJeXdWWUpiMmJ1c25pMSswdEtsN0dFSmc3T2N4?=
 =?utf-8?B?dTlReXg3ZVd3YW8vUUFXM1NEcDg5c2NHYVBibHhyNnJTeHhueDVsS1ArT045?=
 =?utf-8?B?K1JMdk51Y0psRm5uai9PTDNKN25XdUxMU1hxejNyMEZseDJiR2R2cGVxRXUv?=
 =?utf-8?B?d1RMMXZ5a3AzcDZBSWlzQ0dDeWlHWSs4QmtQdlVRUXZuRDZEU05Dc25TMUdC?=
 =?utf-8?B?R25CbTVCS0JlVGlUTFJVaXc2bGJIdnBHRXRlSytMclJsclNWVU5lSmZ3Yy9R?=
 =?utf-8?B?Rm5hS2MvQzN2dlkvSnBqM1FwTzZyb1F3S01zMGVuUHpCcHd0NVptMklWNjFu?=
 =?utf-8?B?M2VRaFRRaDgwelVaNmc2WXdGYklQVnlhUmR2UWFZYjVEdklMbEVER2d2ZFN2?=
 =?utf-8?B?T2VmSm43eHRXWWFLeGJxdWZLQXA0YVFaNHBvaitxcU9yQmZTYUM1bGY3eDhI?=
 =?utf-8?Q?AeeOsQfJ4kbYfcTZdriTcOPKH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c262bb-fab5-4316-dcee-08dbfdadcc33
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 20:38:30.2482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U4lKPHEGKKhnbOkfrk5mx6WE5K7HwtVuOTGD8wfJq9fkrXxQ5AqtR/ASLBIU15OiGzRoLoqDr2qhkjaOSG++rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8671
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
Cc: francois.dugast@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 12:33:31PM -0800, Lucas De Marchi wrote:
> When CONFIG_DRM_I915_DEBUG is not set, a dummy
> __i915_inject_probe_error() is provided on the xe side. Use the same
> logic as in drivers/gpu/drm/i915/i915_utils.c to ifdef it out. This
> fixes the build with W=1 and without that config:
> 
> 	  CC [M]  drivers/gpu/drm/xe/display/ext/i915_utils.o
> 	../drivers/gpu/drm/xe/display/ext/i915_utils.c:19:5: error: no previous prototype for ‘__i915_inject_probe_error’ [-Werror=missing-prototypes]
> 	   19 | int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
> 	      |     ^~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/display/ext/i915_utils.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/display/ext/i915_utils.c b/drivers/gpu/drm/xe/display/ext/i915_utils.c
> index 981edc2788bc..43b10a2cc508 100644
> --- a/drivers/gpu/drm/xe/display/ext/i915_utils.c
> +++ b/drivers/gpu/drm/xe/display/ext/i915_utils.c
> @@ -14,9 +14,13 @@ bool i915_vtd_active(struct drm_i915_private *i915)
>  	return i915_run_as_guest();
>  }
>  
> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
> +
>  /* i915 specific, just put here for shutting it up */
>  int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
>  			      const char *func, int line)
>  {
>  	return 0;
>  }
> +
> +#endif
> -- 
> 2.40.1
> 
