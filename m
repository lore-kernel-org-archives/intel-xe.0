Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC558C48297
	for <intel-xe@archiver.kernel.org>; Mon, 12 Feb 2024 19:59:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A8710E24E;
	Mon, 12 Feb 2024 19:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLFItjdS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3788510E24E
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Feb 2024 19:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707767985; x=1739303985;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=boHV2nvybWZt1S+H6YvCzKccfB34b7VWilvGiNOQiZk=;
 b=NLFItjdS6JiUFySG0XolRKwfgsUDIRJPBiwwFQdD+H0DZF+ljdxydoR6
 Wnf4C6s80xrGhKiaI5pyb20ztyoxMKIc9Dz/t9Rsb70i9jEn7l9WQDP4j
 S9n2VVyc6FK/s8XxcUPORcBL+WMAeuupF3uDzSrRKC0MeogGDNy2vY1dz
 E7PANDDo7kd02Hsewhhp9RPXgol4JEGrjpI3J7RZcFW1j15wTxFqPEzuJ
 RBgSUeDanOF5uiPiX0ofrUZj08G1PseKjXBbQwGWt3JX/+SD2yME30EoC
 5BZrsuRJTh8fYgBNLtdK4+3HvsnaFCS2qd5cd28S9zz7BgrxBuKtqW07h w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="5595110"
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="5595110"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 11:59:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="7329626"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2024 11:59:44 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 12 Feb 2024 11:59:44 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 12 Feb 2024 11:59:44 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 12 Feb 2024 11:59:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdxhZh9clDx8AfIWBqY+URuzjvI9BPFLLdEeRPT/HhGg3bECNaghqucRFli5y4qwmh4DwYVOL+B02+t9uIxm6oxscyK13RfLX9hzkoVGjf4ptZhNuNbm48laSIKV9ReBneaeJt/5FJMrru5pSZwNy5xrStEzIsmXvLyMO0K2sZr4ENogovZRXl//BxCtKvt1jPGPAHJ1Xk1mAJ9YcIlXezlwXaK2/wk36w6SUkNYMRDoS5a1R3YbSs2ethNMEWMkC5OLUQH3BzDCYBLnlUwGydQo0gur1miIVzeaoeS6plMaOOOJdZMCUVJX2qQe5zpPp9oqNQwJp+HG8yoGv2B+Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wx1kYrKEbo3+PKaCGRI6Hc8dta9RLy49K9l8t0GN4xE=;
 b=PBJg6nx/ubk6E4VXEBu42v8U1SZ1eBlfuqNqLFn/kc570oewfj1eyA42NcnjH1bQE3j2Hgn60DOLxYV5BrYYU6BLd6ZI9Wh9iAEThl0EZSQhNS1qfqXuISpage8bZm5/gGROTlVzdM477+H1xjBgIwp+wvAxVcggZ3c2iyrW5bH+rsSnUpwQhfuG2xA31K0Ew7O8Da9TXPO3L2aYd2fOhUEtaERnREsQ0O9OtUHSyEKeoIMKvqFDpWHOaBUYI/+a/ilnhT/Yx/OOM66pjid/qQW5YWOzZ48ssDyUIBQfoYW8mkbayr9yBE6qrLfOow5VSjMNB/1nZyqQIwibSNRUPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA0PR11MB8417.namprd11.prod.outlook.com (2603:10b6:208:48d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Mon, 12 Feb
 2024 19:59:41 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::152d:16f5:ab9a:7c6e]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::152d:16f5:ab9a:7c6e%7]) with mapi id 15.20.7270.036; Mon, 12 Feb 2024
 19:59:41 +0000
Date: Mon, 12 Feb 2024 11:59:30 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 13/16] drm/xe/oa/uapi: Query OA unit properties
Message-ID: <Zcp4opkqpF0fDFbA@unerlige-ril>
References: <20240208054916.3788133-1-ashutosh.dixit@intel.com>
 <20240208054916.3788133-14-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240208054916.3788133-14-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0043.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::18) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA0PR11MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: c5c48219-857c-4b66-31c5-08dc2c0526b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UOZcQU8ns1r+lxv18KTMisxR2d+fzL3JKBXSFAouSp/SZliBp9t8RwjXcJxpjuyEEKCKbaiiI+yrn5hHhKuiGqtcMnjcfiO29XVKcLFop4fYf9UIjkBht7jtvyuAUJbSTW+qK8f/XCLAn3W+lfHR08IVPzm8TNbka4OiVBidoxx5danikV7E/SAOTvg6ouc5H39WTAWQr0WKZKNT9Ugbk/jP1rA7UvFULIrLVhDUtFH27qlj8t+3fcT91iJHCUnUuuagM/3E9b7TpNJYdr3IC94VNvhtJ9gm4/fK0xsM1j2Hpu8a3P+fsjkwKl344t78fR71V5jsJJufOZZA2zHF0NN03zAKmkJ1RJTTsmFdMdb8lCgGeA9v/IRqPjP/jB9zo03sdk+RL5Q80oDBd9XdWctEEfYq0+zPGJvFd1vDkzp7ogciAjqYafG284f1ZH8TCAQQBFp8NUfz4wCKrJWjZvnXJBTPDNk1djtP7VkVkaL3DfxPVTF1eCNIfhbz8qL5k8uJeP+dL/drz4VTd9eE90WUuboTLDaimYOEnH893ASFKeUpkxOFVoguSt7GbQBK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(366004)(346002)(376002)(39860400002)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(33716001)(6636002)(316002)(6666004)(86362001)(6862004)(8676002)(8936002)(4326008)(6506007)(6512007)(478600001)(6486002)(9686003)(2906002)(5660300002)(38100700002)(82960400001)(66556008)(66476007)(66946007)(41300700001)(26005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjBHTmZwNEJXTGFBc3ExMUlUQlh5U2VBRE9rQU1BZHdVS1JJTlJwZlhpWDhr?=
 =?utf-8?B?bWtVaitJQlQyaHArQ2VvejA5Qjduc3dJOVdPNFQ1WG1rUzcvNW9uTFdSQmRz?=
 =?utf-8?B?U0xTUkJWOURtVnA0T1NpZjJQS2Vib3ZKMW1ST0JDbEVwbmxrRG5lU3JvVGFR?=
 =?utf-8?B?dWI0MnVudThWZ0hnRzVFdVgvK1ZQQVIyUURFbjVaNURhSFpvODZremRkYVND?=
 =?utf-8?B?aitkNW5KTEozRjZVU05lSnpBZVpkaDNnUVQ0d2J6SWlkeVZIRDJVMzc2ZUUx?=
 =?utf-8?B?aDNXeEg2UGRPcGorbjA2cDYzMi80SjJydEdGeEZyNXpoL1Rqb1drek5KRGhT?=
 =?utf-8?B?TWJlOFg2UmRXNEV4aFdoNzQxc203TDB5OEJJUE1GcC80K1JmVmEzU3lUN0tW?=
 =?utf-8?B?MEhLUC92NGlra3NUb0wyVkR2Wm9uNE5WWm9QdkxOTXM4OTZrWTVUaklzaVdp?=
 =?utf-8?B?aTRlbWp3VE5meG9BeU5wTjkvenBxZGJBOEFzSDl6STk3cjIrUFN3bTB1d1Zt?=
 =?utf-8?B?Z21TcE5KbEFsdkxuVHJESjkxTmlldG9TamxWTEloSy9jWGNzYlpxN1BuYWJv?=
 =?utf-8?B?S0tFRXEzTmhiaDlxRWMxVVVuOUFjK2tjVmxnSVVLTEE2VHNPbWRxSy9QTGs4?=
 =?utf-8?B?V2VnMXU2b1BYSGRKTWpRT3ZFSmlPMmlDNHpzVTFaQng5YmZ5emxjQm43OTd5?=
 =?utf-8?B?UnJSeC9rajlVRTEweW9kTjhVWHFqaDhSTktpZEFPWU1DQithQW5jZmJiNTZN?=
 =?utf-8?B?cUdFTFZnUUdTS2RaWmhoaDVBanVWTkxTRHJkclhOT2RmdjBDZjZiTjQxcGJI?=
 =?utf-8?B?ckdZOVQ1NzU1QmtKWWtFanJxOXpJekRweVlkek9ydThqZFY0anlYRmVhQmhU?=
 =?utf-8?B?Y05PSW8vWFVMc05Bc0VpMzA3QWdRVVNqQ2pPODYwSGdSSUxJcDY1NGNwdkNs?=
 =?utf-8?B?TnczYTZReUMwbjdtRlc2UFBrdWxqY25UeC9IY0ZWS3hRUkdCWUtwQUFoVWU2?=
 =?utf-8?B?TUIzeFRKUmxXZFZhTlRqQkVUMVBKODV4Q0ZKK2lOaEJrU21ldWE2bm1CdmZ1?=
 =?utf-8?B?bTdPNDYwSC9oZjV5UGxGY2FIQkJSb3h3dTFUZ01SU0NVNDNkbzc0cGRUZzFm?=
 =?utf-8?B?dlo4Vjh0RUpiWGxxWk5BT0h0REVWRm9WWGZtelFldlZzS0N0RXpmQ2tmSTFX?=
 =?utf-8?B?NEdlbnJkUXhrOFdiRlA0ZCtzSWZSUktrM1ltT1MrVVlxYjY4REdodmtrYU9R?=
 =?utf-8?B?UzJJcklTc0ZOUUlhMys0NHkvdWdtK3FNZW5ZNC9QOThKakwxL3JpK1Q0VGE4?=
 =?utf-8?B?U2tZeVBaazZkWFhEQSs1dHp5d0w1bWluSGdCQk1pdmJIc2VZNUxMeFRLYjNF?=
 =?utf-8?B?Tno2UENqVDIrNFJiQ2pjcDZrYlNhaTFOOUtZdUFxZkNhcHNheGFFZys5T09R?=
 =?utf-8?B?NVhrSE1IbG10ZjhMSHhpVWlUdVlKZlZKSHp2bEQxVmNBSG5JT1d3S1hMMVNV?=
 =?utf-8?B?K3BManFNTC9tZmlaUkdnQ1NmRVQydVM0Y1lmNldORytWUEVnOGx1LzBEbHFt?=
 =?utf-8?B?Qmo3eisrY25hMWJaaEN0eXE5TmRFN050eloxbWxEKzRqNmVOQXgzRHpDTGk1?=
 =?utf-8?B?Q2dRLzYyR29VMENEQ2xHY3J3V2F3eWlzam1OamRCd2ErYmRCZURmWkgxcTdp?=
 =?utf-8?B?YWVTdVJZbDhTN2tSU1M1R1ZFRkZHd3U5VDFIWXllMVlFVmpIdXRvOFNjMFpI?=
 =?utf-8?B?Vys0ckNpVzRaS1JTVmw5U1dhR0daZ0pzbDBRMjZvQzJienlrZVloNUQrdnJy?=
 =?utf-8?B?RTlQSHBTYVNCM0FqVEQzTnd0UGtORm83WDQyOUp2eE44WWxLVk04TmdSWU9v?=
 =?utf-8?B?QXJCQUFiam5pdGhSdWdzdC8rRVlodDJxZDByNVFmam9qekIyR1YwcVhNQjZ6?=
 =?utf-8?B?TnhVZU1jc0xtSlRYOTFNUEo0c2xWSFA4YXU0cFU1cGcxYzlaWXJEZENtZzZB?=
 =?utf-8?B?OFplMDBNdndLQWdmaTdZZ3NKeEVRWjIwa2FHSDFpSXd4QWF4aFVZT0JoMTNs?=
 =?utf-8?B?TDRCVzVDOTNZYzZYZmRIKzZ3cnVpUnI0TlBoVzhxcGQxQ0xPdncvdUNMRVhD?=
 =?utf-8?B?NGZISGhnNzhWUUNwQVU3RmFMODQxSnZMSXdJYzVSem05TUFVaUlqY1N3bzFX?=
 =?utf-8?Q?xfFQXqavkJLvgR5E55bxB60=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c48219-857c-4b66-31c5-08dc2c0526b0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 19:59:41.7044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fpsx5Gyh4ytg1+dhWKjXJiVmVfYzTfCSBykA0yjTXeH4SnRi6x3CDdU0uhqhybpcrFUgdXwX7Hyp0ku4MP2a6W52SUwtjxlVI7Apcsl+ZXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8417
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

On Wed, Feb 07, 2024 at 09:49:13PM -0800, Ashutosh Dixit wrote:
>Implement query for properties of OA units present on a device.
>
>v2: Clean up reserved/pad fields (Umesh)
>    Follow the same scheme as other query structs
>v3: Skip reporting reserved engines attached to OA units
>v4: Expose oa_buf_size via DRM_XE_PERF_IOCTL_INFO (Umesh)
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c    | 13 ++++++
> drivers/gpu/drm/xe/xe_query.c | 79 +++++++++++++++++++++++++++++++++++
> include/uapi/drm/xe_drm.h     | 75 +++++++++++++++++++++++++++++++++
> 3 files changed, 167 insertions(+)
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
>index 4f1ab91dbec58..828be65a076d6 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -516,6 +516,84 @@ static int query_gt_topology(struct xe_device *xe,
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
>+
>+			for (j = 1; j < DRM_XE_OA_PROPERTY_MAX; j++)
>+				du->capabilities |= BIT(j);
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
>@@ -525,6 +603,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
> 	query_hwconfig,
> 	query_gt_topology,
> 	query_engine_cycles,
>+	query_oa_units,
> };
>
> int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index df0dfd60b52fa..bd535343a406c 100644
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
>@@ -1411,6 +1412,68 @@ enum drm_xe_oa_unit_type {
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
>+	/**
>+	 * @capabilities: OA capabilities bit-mask: this is a bit-mask of
>+	 * property id's in enum @drm_xe_oa_property_id
>+	 */
>+	__u64 capabilities;

IMO, this should be a specific set of flags that are defined as and when 
we add new features so that it helps UMDs detect them. Some features or 
behaviors may be independent of the properties, so a 1:1 mapping to 
properties may not be the best solution. In the past we have had i915 
perf revision bumps even when we haven't added a new property (For ex: 
when we supported media engines in i915 - class:instance properties were 
already present and we just added support for OAM in that case. For such 
cases capabilities would define a new bit, but not properties).

The first set of properties defined with this series should not need a 
capabilities entry. If the uApi changes in future or adds new features, 
we need to use these bits.

Thanks,
Umesh

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
>@@ -1527,6 +1590,18 @@ struct drm_xe_oa_stream_status {
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
>+	/** @reserved */
>+	__u64 reserved[3];
>+};
>+
> #if defined(__cplusplus)
> }
> #endif
>-- 
>2.41.0
>
