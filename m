Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0078EEE0202
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 18:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A6A10E4DE;
	Wed, 13 Sep 2023 18:43:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CF610E4DE
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 18:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694630600; x=1726166600;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=doW5+5WvSb5/FTazdxbVDJIRLm/t0IwT9xTKiBMN9Ks=;
 b=A2O0KaoThqcxppS6nIHhM500by+75Ns8K79rXHgK8PBUlH3kschoxagm
 f8bHLD5z/oquXlH1QJUGfUTymZSO63g7rCqOEfPRKR2dMNIrnTiAXaSox
 FNa+uf2UTr9kSyvxeeVMLkapvkwutGyxX1DXp9EhWjY72BCrO/PW+1Gmf
 p7M42N4WxmtRdm2Tsfn8Zw1eMM63PeYs9xoKgsbKX0Fqegg521Vd8DCJd
 EHwSk8TX+E8fO/SbnSETp4kDXlYw6svKxWgWN+GvRWkFvTtT31SkW1256
 2dvpSyqng4lyW9vWveWVrU5w0ePnfmeIgHBosfqrNAaX8Z9CJBHMdXvxk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377663438"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; d="scan'208";a="377663438"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 11:43:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="991041046"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; d="scan'208";a="991041046"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2023 11:43:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 11:43:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 11:43:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 11:43:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 11:43:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lpltgh4Ftb4tzlvGOSymvYMsrfcFVzcb77ZxzvMyLLQTiffNwlW5iGIBJgl7J0ajTot1vB2GvwsFMTHhy5fboYpUyVWJE9scDnwkYkIfAwO1zxHApxg3Z+oh4As09LVmg+hnk0WChpgOZlceh7trEtlsyox0AxgGFUaqbzsjjlLzofWZqaXrLWex4E0FBARezFD3W5jJUiZqWOX2h+UhXCkNqZO0+P1YWEVdKgzxEfEigufswuO+7CgJ4dQDwgcxw8E77nj25qqWeJrMbbLAvu0ewKe8CrYBE666zen2q8tjK46ApqTn+sd74uP2sT6OLe150K3lChUZWe4zEGKahQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHKQ+/vg9Ta+5lKsgnEZ4PTiJOS+2rW3LILUWWigYP8=;
 b=V+HDjVqHq8xV+3vndj0L8+3nmz7Wk10BRb05SvkqjwB0DeQyPFOyBGz+1TW8I74vBdMmgnCsb+Hpbu7WGtsSAyVbLZN2piYFgnVLNgfeOCF6maZWgdi4Mobh0UMHajpmBZyWNxXBqGXPN++9FjqI/5YlmXP+pmzBYAa7j1FJm7WBTZ89zvnnQZe8WUQ7aFSVqEdAkjvNjLxdMaLK5+Q6vYYchufiMvAx6jWmr74rO1XrPQiTT0cADLfglqqEVRkqZTmX8Z/RsN9RxLwTiYBLRxkuUuoo9zJZ0/xX80q8hBSH7/BFy+qa5xT/eSQyKQieaU+5cUVOYxLAkviAwjgE4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7570.namprd11.prod.outlook.com (2603:10b6:510:27a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Wed, 13 Sep
 2023 18:43:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6745.035; Wed, 13 Sep 2023
 18:43:15 +0000
Date: Wed, 13 Sep 2023 18:42:12 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZQIChFiX3QlWC9Rt@DUT025-TGLU.fm.intel.com>
References: <20230908203302.449041-1-rodrigo.vivi@intel.com>
 <20230908203302.449041-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230908203302.449041-2-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR07CA0034.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::47) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: f3082535-ecae-4fa6-1e50-08dbb48949c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tVw5HXaagGvUpmBe/dQxqo7DFqGEaUwsEDV3cqULpiT/V/RQQM/KiFJUbAFV3vNTwqVrZd8Nwc9L1x9Pq1Bvd7NTp77xSbrOpYhA37CARB4pmt26wtCI2NNYE0x1Ne0ZoIlpDmq4ed7/KOhyztVMQ2TDTlspC7K+E5KO7DZNyrVYGNS1O1uSiuAxYM+w755fjWF6Q1oejM9vtQvFS0sefd6lZ36NXJb/TDA7rUN/757p38htjAxv6XoW8pxFCqls5bq3IgK0XfZUfyQd6s7UZaUmAX/wHvlOSsyhjCNL0h9k6519FXh+YKqFejFVDXLW79NicpjPBzQsvTcrqoCgFlrBiC+FnsGI7C44abeZGALaagfRXxm/PyGElvSUyoO0u5JAkrc1RuHDAdfLiaXIrvgM4kEHwWkYIdThHv4RhkEk42psdFZX+cCQdrFK97Alk9xz1yh8Bc6FkKu+j14sOb0Qb7FYw+JD3amAoin978JtsVVFGVCXa1RXkiYsosMfAACGy8yuKgs5x9pOS6jBvdu2JaZRe1RtVHEcYLFe4aRw18XU71ac+pSOeGfnfkMF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(346002)(396003)(366004)(451199024)(186009)(1800799009)(2906002)(66574015)(38100700002)(82960400001)(86362001)(26005)(41300700001)(6862004)(8676002)(4326008)(8936002)(66476007)(44832011)(66946007)(66556008)(5660300002)(6506007)(6636002)(6512007)(316002)(6666004)(6486002)(83380400001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?K71K6k07nywch8O4V30sHCrob11lPbupEniOd88yemFwIspDngV8kShvCZ?=
 =?iso-8859-1?Q?iKuhAn6GzB0xwvhF78AzEz1G5HLhz6PD0AoiP/lX82v01BDgjf49tO+SO2?=
 =?iso-8859-1?Q?7zydzASQJvbWA/G/XftUApL6yawQz8pqvYZc/D680RIuLln21ywHvEZ/Y5?=
 =?iso-8859-1?Q?nu4B6xkQCOUg+mRPNfLZO92eg8yKfVr8YP13JRoJlQgidBK1uYS0wMEHQ/?=
 =?iso-8859-1?Q?atJY7keLbAfyRx5of6ta6HsYVA+OvBwYtEjZZCfpMNNddh9qh2Yav64+IV?=
 =?iso-8859-1?Q?ruSidWBtrrrpu+ZhrUI7iqvZcKZt+jc2KEKcFue1/dK1vtSkr+b2BR9qwf?=
 =?iso-8859-1?Q?Sq6gh4vHbiAQGQjtxE2xqQ8amDgKyQ2A1m5BU9KV8FUB8fsiNJhllhoNUE?=
 =?iso-8859-1?Q?akoEDpl5Jeh43jZDNWSM/pNqvX18zo6iMGDkY/hXIaGhS1lAzrrcxWos6E?=
 =?iso-8859-1?Q?lulSd8rzExOmqC9Xc/QViRjorQ/yr1w6xFY9nR76n13sX/teScV3ZljVbT?=
 =?iso-8859-1?Q?Hbko1nhTh/Mj1MnZKFeAEXFUwJ6Ttp6kphqbGGywlrY00Jt5jaetjv9hct?=
 =?iso-8859-1?Q?NtXWWzrClUTkhe6ruLUMhyJDUhAaywrhHXLfTTvNindoRcWKszDkYBbuJg?=
 =?iso-8859-1?Q?A6QKlgFU5R9NNLEMGtk3Hp4pTFukH41Tq1S+VbXYDqDLOsKu8dDZGNPIsv?=
 =?iso-8859-1?Q?bw4rzSsvNVILhinnvLZvnw16iVQMhuTPKiVrt+U6XywBL677ktxqGDSl9L?=
 =?iso-8859-1?Q?rpXL2G3GuGIGbnXvyZe/XM6wewadSgTrL8cMvT6gCt3fSZBiG+hppo4zu/?=
 =?iso-8859-1?Q?MZCJx73VOc1jXALZ0ZcMygoHvUSaLKIOWQ5vKhWCBhnygnCNWmoRlHCV4Z?=
 =?iso-8859-1?Q?rEfrvcVP5vd7WWb3xAYHTpWR0KbctHh49eQEaiQCRFBI7EGD5qGY1DFCsU?=
 =?iso-8859-1?Q?lwPVnaTizvS8MsJs1xoeqOXhYbtLrQ5+hZADhO2OYvvGetTObx64Me9F8h?=
 =?iso-8859-1?Q?U1Tgw4YLKu7LjgN2AEc78kvkkZOECxdn27s7P47IlC0M/g5qPQ982IMpyd?=
 =?iso-8859-1?Q?1t/jesGQ+LJyj4oDqB+HuM6txouDK7ug1118RNI4JdzEgfZwjBiGjWOge3?=
 =?iso-8859-1?Q?HCF2gh36CNe9ZHkHwW8UFi+73Qo661+a2rfgEF7rOc4ZuMgxncBB4sXbgT?=
 =?iso-8859-1?Q?h1WCUbjLLHQCqqfExPLmnLRBk00sIg46W4d8uBOcLONRVZLaX/MxwqPfe5?=
 =?iso-8859-1?Q?MfS29oBC9Giq+jfoco7vX33kJNpgTJlgpADtoa3adrcmbmwrc09kw0v3Bv?=
 =?iso-8859-1?Q?bTFPNlXvO9O9HJe71JoHBmSdn5CCstoXnGeWPyqfw0sN1k5zruthrdQ99p?=
 =?iso-8859-1?Q?VhpA05mgyjN89SzbDfHxsTqnK3QxH+j51yk//CbtZofIw3ixE2UJhK6tcp?=
 =?iso-8859-1?Q?LFqBRzsi4HefxasEylRtESuJbHhf6FH3Klfn/KSt75EPBBG+AuA9IiXgc4?=
 =?iso-8859-1?Q?4h8aZqiAWwhB5KT4VGeOBglvYBWuayA6Co3G9qry0J9Jf+cV5w7fAZ11a3?=
 =?iso-8859-1?Q?z+VAd1aATRnW2FiA0EhqFMJ8IxdS4C8nBoG8oEzMXtnW06hNc6VNDpGXOt?=
 =?iso-8859-1?Q?a4SzR/7uYYCjm9kHOJ6RinsLReS7IXSrT1Y1Ssg+/IATtlHeucOOZSBQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3082535-ecae-4fa6-1e50-08dbb48949c7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 18:43:15.4557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7B7/+kwYyOo1nDmiivDiS3whKm/2qF/UVEcR0sVp9B3HxENJghI/9+AWKItRvJQQlQmNzflUwJoU4bxRi0A1JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7570
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 1/5] drm/xe: Kill
 XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 08, 2023 at 04:32:58PM -0400, Rodrigo Vivi wrote:
> This extension is currently not used and it is not aligned with
> the error handling on async VM_BIND. Let's remove it and along with
> that, since it was the only extension for the vm_create, remove VM
> extension entirely.
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 129 +------------------------------------
>  include/uapi/drm/xe_drm.h  |  41 +-----------
>  2 files changed, 4 insertions(+), 166 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 1d9aa5c40659..9cc69696a8ee 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1368,37 +1368,6 @@ static void flush_async_ops(struct xe_vm *vm)
>  	flush_work(&vm->async_ops.work);
>  }
>  
> -static void vm_error_capture(struct xe_vm *vm, int err,
> -			     u32 op, u64 addr, u64 size)
> -{
> -	struct drm_xe_vm_bind_op_error_capture capture;
> -	u64 __user *address =
> -		u64_to_user_ptr(vm->async_ops.error_capture.addr);
> -	bool in_kthread = !current->mm;
> -
> -	capture.error = err;
> -	capture.op = op;
> -	capture.addr = addr;
> -	capture.size = size;
> -
> -	if (in_kthread) {
> -		if (!mmget_not_zero(vm->async_ops.error_capture.mm))
> -			goto mm_closed;
> -		kthread_use_mm(vm->async_ops.error_capture.mm);
> -	}
> -
> -	if (copy_to_user(address, &capture, sizeof(capture)))
> -		XE_WARN_ON("Copy to user failed");
> -
> -	if (in_kthread) {
> -		kthread_unuse_mm(vm->async_ops.error_capture.mm);
> -		mmput(vm->async_ops.error_capture.mm);
> -	}
> -
> -mm_closed:
> -	wake_up_all(&vm->async_ops.error_capture.wq);
> -}
> -
>  static void xe_vm_close(struct xe_vm *vm)
>  {
>  	down_write(&vm->lock);
> @@ -1884,91 +1853,6 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
>  	return 0;
>  }
>  
> -static int vm_set_error_capture_address(struct xe_device *xe, struct xe_vm *vm,
> -					u64 value)
> -{
> -	if (XE_IOCTL_DBG(xe, !value))
> -		return -EINVAL;
> -
> -	if (XE_IOCTL_DBG(xe, !(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS)))
> -		return -EOPNOTSUPP;
> -
> -	if (XE_IOCTL_DBG(xe, vm->async_ops.error_capture.addr))
> -		return -EOPNOTSUPP;
> -
> -	vm->async_ops.error_capture.mm = current->mm;
> -	vm->async_ops.error_capture.addr = value;
> -	init_waitqueue_head(&vm->async_ops.error_capture.wq);
> -
> -	return 0;
> -}
> -
> -typedef int (*xe_vm_set_property_fn)(struct xe_device *xe, struct xe_vm *vm,
> -				     u64 value);
> -
> -static const xe_vm_set_property_fn vm_set_property_funcs[] = {
> -	[XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS] =
> -		vm_set_error_capture_address,
> -};
> -
> -static int vm_user_ext_set_property(struct xe_device *xe, struct xe_vm *vm,
> -				    u64 extension)
> -{
> -	u64 __user *address = u64_to_user_ptr(extension);
> -	struct drm_xe_ext_vm_set_property ext;
> -	int err;
> -
> -	err = __copy_from_user(&ext, address, sizeof(ext));
> -	if (XE_IOCTL_DBG(xe, err))
> -		return -EFAULT;
> -
> -	if (XE_IOCTL_DBG(xe, ext.property >=
> -			 ARRAY_SIZE(vm_set_property_funcs)) ||
> -	    XE_IOCTL_DBG(xe, ext.pad) ||
> -	    XE_IOCTL_DBG(xe, ext.reserved[0] || ext.reserved[1]))
> -		return -EINVAL;
> -
> -	return vm_set_property_funcs[ext.property](xe, vm, ext.value);
> -}
> -
> -typedef int (*xe_vm_user_extension_fn)(struct xe_device *xe, struct xe_vm *vm,
> -				       u64 extension);
> -
> -static const xe_vm_set_property_fn vm_user_extension_funcs[] = {
> -	[XE_VM_EXTENSION_SET_PROPERTY] = vm_user_ext_set_property,
> -};
> -
> -#define MAX_USER_EXTENSIONS	16
> -static int vm_user_extensions(struct xe_device *xe, struct xe_vm *vm,
> -			      u64 extensions, int ext_number)
> -{
> -	u64 __user *address = u64_to_user_ptr(extensions);
> -	struct xe_user_extension ext;
> -	int err;
> -
> -	if (XE_IOCTL_DBG(xe, ext_number >= MAX_USER_EXTENSIONS))
> -		return -E2BIG;
> -
> -	err = __copy_from_user(&ext, address, sizeof(ext));
> -	if (XE_IOCTL_DBG(xe, err))
> -		return -EFAULT;
> -
> -	if (XE_IOCTL_DBG(xe, ext.pad) ||
> -	    XE_IOCTL_DBG(xe, ext.name >=
> -			 ARRAY_SIZE(vm_user_extension_funcs)))
> -		return -EINVAL;
> -
> -	err = vm_user_extension_funcs[ext.name](xe, vm, extensions);
> -	if (XE_IOCTL_DBG(xe, err))
> -		return err;
> -
> -	if (ext.next_extension)
> -		return vm_user_extensions(xe, vm, ext.next_extension,
> -					  ++ext_number);
> -
> -	return 0;
> -}
> -
>  #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_SCRATCH_PAGE | \
>  				    DRM_XE_VM_CREATE_COMPUTE_MODE | \
>  				    DRM_XE_VM_CREATE_ASYNC_BIND_OPS | \
> @@ -1985,6 +1869,9 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  	int err;
>  	u32 flags = 0;
>  
> +	if (XE_IOCTL_DBG(xe, args->extensions))
> +		return -EINVAL;
> +
>  	if (XE_WA(xe_root_mmio_gt(xe), 14016763929))
>  		args->flags |= DRM_XE_VM_CREATE_SCRATCH_PAGE;
>  
> @@ -2027,14 +1914,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  	if (IS_ERR(vm))
>  		return PTR_ERR(vm);
>  
> -	if (args->extensions) {
> -		err = vm_user_extensions(xe, vm, args->extensions, 0);
> -		if (XE_IOCTL_DBG(xe, err)) {
> -			xe_vm_close_and_put(vm);
> -			return err;
> -		}
> -	}
> -
>  	mutex_lock(&xef->vm.lock);
>  	err = xa_alloc(&xef->vm.xa, &id, vm, xa_limit_32b, GFP_KERNEL);
>  	mutex_unlock(&xef->vm.lock);
> @@ -2947,8 +2826,6 @@ static void xe_vma_op_work_func(struct work_struct *w)
>  				vm_set_async_error(vm, err);
>  				up_write(&vm->lock);
>  
> -				if (vm->async_ops.error_capture.addr)
> -					vm_error_capture(vm, err, 0, 0, 0);
>  				break;
>  			}
>  			up_write(&vm->lock);
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 00d5cb4ef85e..51c4ef5dee6d 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -480,42 +480,6 @@ struct drm_xe_gem_mmap_offset {
>  	__u64 reserved[2];
>  };
>  
> -/**
> - * struct drm_xe_vm_bind_op_error_capture - format of VM bind op error capture
> - */
> -struct drm_xe_vm_bind_op_error_capture {
> -	/** @error: errno that occurred */
> -	__s32 error;
> -
> -	/** @op: operation that encounter an error */
> -	__u32 op;
> -
> -	/** @addr: address of bind op */
> -	__u64 addr;
> -
> -	/** @size: size of bind */
> -	__u64 size;
> -};
> -
> -/** struct drm_xe_ext_vm_set_property - VM set property extension */
> -struct drm_xe_ext_vm_set_property {
> -	/** @base: base user extension */
> -	struct xe_user_extension base;
> -
> -#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
> -	/** @property: property to set */
> -	__u32 property;
> -
> -	/** @pad: MBZ */
> -	__u32 pad;
> -
> -	/** @value: property value */
> -	__u64 value;
> -
> -	/** @reserved: Reserved */
> -	__u64 reserved[2];
> -};
> -
>  struct drm_xe_vm_create {
>  #define XE_VM_EXTENSION_SET_PROPERTY	0
>  	/** @extensions: Pointer to the first extension struct, if any */
> @@ -600,10 +564,7 @@ struct drm_xe_vm_bind_op {
>  	 * practice the bind op is good and will complete.
>  	 *
>  	 * If this flag is set and doesn't return an error, the bind op can
> -	 * still fail and recovery is needed. If configured, the bind op that
> -	 * caused the error will be captured in drm_xe_vm_bind_op_error_capture.
> -	 * Once the user sees the error (via a ufence +
> -	 * XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS), it should free memory
> +	 * still fail and recovery is needed. It should free memory
>  	 * via non-async unbinds, and then restart all queued async binds op via
>  	 * XE_VM_BIND_OP_RESTART. Or alternatively the user should destroy the
>  	 * VM.
> -- 
> 2.41.0
> 
