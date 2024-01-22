Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFFCC47DD3
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 20:18:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA4410E655;
	Mon, 22 Jan 2024 20:18:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAB310E655
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 20:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705954697; x=1737490697;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PvENpY/upY16/8Mxah+IYK96LqDGCDg3TTxWomR55jo=;
 b=hbecvjhG8BKZc76LetvzS2GAw3lMGujcjByM/5xSBqZxdw1RabzqpgpB
 AsfxZIflw3Yqniw+25buDqFGXQw2WD2xj1tgfkBRK1ptmfkoYMFlPe+Zs
 8tG0hp5VSASTZD5ae2hqm5M0I2OQzdM5dG1jR774Z6OE2tzUkA5ijhR3b
 r5gRKeBoMBTkdOhIFmeT7UWBnKiYxiGq8XQnfnLf/nIPDINwBUElrHcTT
 WYN31q5+GOLy6R8J0tzlADO2rgklN/VgrFmcrNJbiz17UDHtcS3bzSvxD
 2h7WMUuNtQHQbfDs4OUPZ5aYAhPnBsYqSJMfsXFoh0a4LZJsv5xazbLIE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="1204093"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="1204093"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 12:18:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="1324327"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 12:18:15 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 12:18:14 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 12:18:14 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 12:18:14 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 12:18:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDiFisj0ORQ8KpT/tk7TcQTK7gTq+v+qoLCIfhK9S7952f+yKxuhT3UtIu1Y+TCIbkvbwi1fDTumI4KxHemUBYEjw0ixmN4DVoZK6KLy0h11ZGdtjxzBZdxcR/jvbQE4AcFpXKUN/YaCMUtumloIqSf2N7ekAEpABp8ml07PRFOYllkLt0jiQNiqTvTlopQGm4Dv5WfvHP4B4qdDVJPX3FWojy2811M6KbsBITUp8aUyXM/TgP6QKKIAs0KvYLtx/HX1CC+XVqEdm+TPQpiG79TJf66FWeDsVHPrdiCJNj/JT9+TUOj6iDnzQFcwIITgZYJm8VsRpyNkreEIP6kDPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uo5ue/kgrJbVLl6bEuh5fObsJUKlVrenYEJ3j7kWqZQ=;
 b=PzWZZTJQPfVU1X/mgfI3BEjS2fxX9uA5KjpSA+7Bm0hXJC+mfi0dpbDQ2APbNuFLnxrmJja6U3sNwxEpDGEvFgWjIkt8SCRoiSw+mWhezkIgavLHnf22Fza/R0q4aLd58NAcbkP3EnsLU4wRJ0azcTMLoycjVaRY/1JQniCwOtGNX6mNLDKc1kxi9TD6AXuBZ6jd7nkSv0wysvCx17YPxv8a130iZjY7F/q2mEkRoy8yC4128DP5QaALM1D1IzEuKNFxCOVp7tJXmcEFflou9shmSbzQrRgIhVZGipoPREHjYixhQo4gJCz0MhEEPpMCwRbwjABYHmycPFXYF2BVMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4961.namprd11.prod.outlook.com (2603:10b6:303:93::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Mon, 22 Jan
 2024 20:18:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 20:18:11 +0000
Date: Mon, 22 Jan 2024 15:18:08 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH 7/9] drm/xe: Print more device information in devcoredump
Message-ID: <Za7NgM_B_nBIbTXL@intel.com>
References: <20240122170445.108856-1-jose.souza@intel.com>
 <20240122170445.108856-7-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240122170445.108856-7-jose.souza@intel.com>
X-ClientProxiedBy: SJ0PR03CA0339.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4961:EE_
X-MS-Office365-Filtering-Correlation-Id: fac9c854-e688-4688-81ff-08dc1b8741bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 52RsHAZquw85evo3v8hQfGafrpI8mcirh+rilNJNm03uEmNG2yRDVtTZjks/M8jbvfU3Ijl81NQu/k1D+uI9++QCHrTVYAVEuTprYVtruOUB+DCffOjmo6a3HsnMjwSEzGfGFMIn2LzvWLtmzahIa3CoDojvjmreE9aoMAUTC6VL5zHr1W0dPhvYrtVToHXAEWdNzRwTNrszPk2aMooDlKMxUV5f8ZUq05gFLZ3MhtnhvAF5YAh2qc0ZYjVcZRLJfgyuYxDrvG4aHRPCwa7MVBBOPSIp88wGLNtGmlAjt/EAJ1CiyVM4jwF3qjdZ0KHXATfrSjcu89o0cLGqD0++iX1NlN4uv4VPG5Ped0LLQnE3+ODxHRu7Iia1CipZHbjvNxq/WE4zHjcrddbyt5ALd/jzeloZFGjdVSTq9GXK2F8QD7fsd5GMp+svYLvf/GPQSWq/KRaIKvtqv8pZAZW6ODpxoI6B7w62lyZci51sb8gpqzwUqUwX1rmtTH/bhZBdu+lEoYP7JQR9AhTQz5iNNIyw2/i8LR4pR5m48CXH+O6mHGTPlnywMdNK10OMyI6k
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(136003)(39860400002)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(2616005)(38100700002)(26005)(8936002)(4326008)(6862004)(8676002)(6486002)(5660300002)(478600001)(44832011)(2906002)(41300700001)(6636002)(6512007)(6506007)(6666004)(316002)(66946007)(66476007)(37006003)(66556008)(36756003)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4pNxUmmcQVMIzhrl4mfj55HMk8j6rAgZZ/KpU0siy2Csl1ufB1syQ9vFhp?=
 =?iso-8859-1?Q?z9cdDXNwXWiz2ZRNR6yAnTGSozuhJZYJDC7YPLUcnyaGToEx5+YAA+cM0i?=
 =?iso-8859-1?Q?/YsDCwKPpAKtYFllZdMT7MRdSMFymQ3lN8BgpxjyKOx/Vu/n21rOBz5Q4N?=
 =?iso-8859-1?Q?genxTYFhKtTHxwBWMP8I4M88zFliHvkiy7RpKdQFb0RcrRib53vEuuQrmN?=
 =?iso-8859-1?Q?WP165/qZhLXAH8uZxlXLL7x0KVKGw9k1HtdTQthRsVOBDi78c+uK1223eU?=
 =?iso-8859-1?Q?kUrfehOq8Cm6q8C4zO2zw9DW8zlLewPY/zmzb402aXl3sbOCBm+P2slxM4?=
 =?iso-8859-1?Q?Tb0E2Aml1T6PRCMkMwzbwk+agMEo8a51u7DEdE/iE6luOPAehqOtHREHSB?=
 =?iso-8859-1?Q?TEViZmcc0DDhVNLtK34n0S2NIfcs5Z4LWlsdXo6xQ4sQ5MtzqV55uCe8XX?=
 =?iso-8859-1?Q?Ch8/s5sLzh0pgGGl+NIxOJtWqGmVQwkNGf33Bykaq9OFP1NVzN2uj8uAaQ?=
 =?iso-8859-1?Q?/NB5phRduRypoWIEkSMib9J8lGVRihqKw+aeWjoqQ1UQKZ38BrfD+b4+W8?=
 =?iso-8859-1?Q?TZl1DHPQGVxApROyN9gFV4OIa2wrUeIDD7BGOz7175UVvAIT4lDcXJeXw4?=
 =?iso-8859-1?Q?7pHrCLcqsJhfu8gAhRimZxwGS7VX++0ZfvFSCiI0pLBEAj6HUmJv+0VCd+?=
 =?iso-8859-1?Q?njwXLHGwf9h79C0KXSx2YZS48GLf/OCUnZ9GKbJMgJJCB5rhZp3VonFCJj?=
 =?iso-8859-1?Q?RW1q0TQU//qglHfJl6/8rvrsUH0QoikCtTKdCgrskvuCX6eVa0Za4lo43b?=
 =?iso-8859-1?Q?vEjFoaCj5hGB6vHubQKvmZz0Oc91tz39OabKTUV6H30r5evrjMpkqK/s9O?=
 =?iso-8859-1?Q?jptbjuQ+ukWZtT+YJpJg5azYCscLdRK6cWWU827/t+J5rmXxHHMaxSt6BX?=
 =?iso-8859-1?Q?ot2q6gzQZMPCK4eIhDWplryWc3RWSD2o7kjXH9yAI598JKCjSjLZ9/9UIU?=
 =?iso-8859-1?Q?G9GRkgsjZ7QXfcj0yU0lvrSPpW9CQ6OAlPkz7MD7vZYeI3xdk9gfavEdxe?=
 =?iso-8859-1?Q?8kAEwsigEIVCKlK0j7mH3wpzARJkhyhroekjGEW2hl6+AFSPljOpIMtCoE?=
 =?iso-8859-1?Q?LsQGbb+TLxP8IFmhegEFHg8YRd5ptIBRh7NlPnCAkYfg9S3sS2VRhHtVfa?=
 =?iso-8859-1?Q?X/n+3HWwOVq/F2Hb6G2CWrpYDlDinRoSV8saT+I5DoamLi0m/x/xjNvkO4?=
 =?iso-8859-1?Q?9Qs4rdpPn84jq0SXVkHBfh4Cq1GFyY//8wJdAfJ5fWeOhnvZXVq2bXlCPK?=
 =?iso-8859-1?Q?5TDr5pw6dycfNaoTf0A5vo0HcYFMRcuVR+iANvzhKqYJd4zJL2mWcmzlbB?=
 =?iso-8859-1?Q?5kONagkL8j+GbmXdKqrXTEeZyCQ65/hbGfHMph5J3BF9WO8owewIdijCQg?=
 =?iso-8859-1?Q?lpcmDzKPm+eL/CzG0aeaRP6YojYtCe3AiaT9BH0nEq97xpSB5396LEVENi?=
 =?iso-8859-1?Q?SCR9sEMVGPKoao98wjsm9WCmqSymuXNTNqJ1APXPnKqIgjYS4NokbTtmHK?=
 =?iso-8859-1?Q?FT3V1gelh8fRAldhYtrlyQrPSOU9fdl4aKJ+Onnpj6I4iKzebAEw8kJ9Og?=
 =?iso-8859-1?Q?TiiioMeW2Un9EF9tZ2Rs10elMASPoO6oo9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fac9c854-e688-4688-81ff-08dc1b8741bd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 20:18:11.9105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UsnU3b7CFZPJCEH1P8BQmjE4yp+d9mhu+ZxiUa9RmuyFA2tZmRfRT0VWrrYZtXbuDmpDHo5SK5xf16vh7CKvNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4961
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
Cc: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 09:04:43AM -0800, José Roberto de Souza wrote:
> To properly decode batch buffer Mesa tools needs to know what
> platform is this one, for now we can do that with PCI id but
> already making it future proof by also printing GTs GMD version.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c |  2 ++
>  drivers/gpu/drm/xe/xe_device.c      | 20 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device.h      |  2 ++
>  3 files changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index a0e3732440ab5..43b66ca710f85 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -63,6 +63,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  				   size_t count, void *data, size_t datalen)
>  {
>  	struct xe_devcoredump *coredump = data;
> +	struct xe_device *xe = devcoredump_to_xe_device(coredump);
>  	struct xe_devcoredump_snapshot *ss;
>  	struct drm_printer p;
>  	struct drm_print_iterator iter;
> @@ -89,6 +90,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
>  	ts = ktime_to_timespec64(ss->boot_time);
>  	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> +	xe_device_snapshot_print(xe, &p);
>  
>  	drm_printf(&p, "\n**** GuC CT ****\n");
>  	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b4cdcf1b2081a..e0136e7d5ae52 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -742,3 +742,23 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
>  {
>  	return address & GENMASK_ULL(highest_address_bit_get(xe), 0);
>  }
> +
> +void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p)
> +{
> +	struct xe_gt *gt;
> +	u8 id;
> +
> +	drm_printf(p, "PCI ID: 0x%04x\n", xe->info.devid);
> +	drm_printf(p, "PCI revision: 0x%02x\n", xe->info.revid);
> +
> +	for_each_gt(gt, xe, id) {
> +		drm_printf(p, "GT id: %u\n", id);
> +		drm_printf(p, "\tType: %s\n",
> +			   gt->info.type == XE_GT_TYPE_MAIN ? "main" : "media");
> +		drm_printf(p, "\tIP ver: %u.%u.%u\n",
> +			   REG_FIELD_GET(GMD_ID_ARCH_MASK, gt->info.gmdid),
> +			   REG_FIELD_GET(GMD_ID_RELEASE_MASK, gt->info.gmdid),
> +			   REG_FIELD_GET(GMD_ID_REVID, gt->info.gmdid));
> +		drm_printf(p, "\tCS timestamp frequency: %u\n", gt->info.reference_clock);

I don't like much the word 'frequency' along with this because of the
traditional confusion with the main running GT frequency.
Imho any combination with the words: timestamp reference crystal clock would
be better.

But I will leave the decision to you...

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
regardless

> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 781a1aa164ecf..7df7cce218770 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -183,4 +183,6 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>  u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
>  u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
>  
> +void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
> +
>  #endif
> -- 
> 2.43.0
> 
