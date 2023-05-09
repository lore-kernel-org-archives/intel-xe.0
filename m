Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD47C77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 07:01:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7FFB10E32E;
	Tue,  9 May 2023 07:01:42 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9033610E32E
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 07:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683615700; x=1715151700;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9K2UC4RqUsBfvAZQZOba5sDKy5KNspC3z4Own5/9D64=;
 b=lFcLu9qXWk/av/gr6Cr3Kn9iHLTUeeDMiKne4um6qqtIGdKrwTUDTPjc
 JTLJLxEpISzBGa7vOd3T4cGr1xTnKE/aNG9oDTJJbt6PuWxXMIIBMmxav
 /rTDdh7N9YfT1Xo/asqaoHR4XXilutKD2BS5+WLV+Q8etx0SQDJ9siYs0
 Nz90gTB3t2rL0w1L3wLYmm0qDaaCk4u++QGovobsUuXGkdUyDdAWLUaxW
 AfKijjzPQDkiRQMwXUmVyeYdMLjJ4isbESJWxXX6nu4zGQKfNI6UkjOZD
 z3khHjVGnTFTtCLcJ5p0moEvhDUDmayQUeYgfO+fzsumde1XlW4p8PIKx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="351993492"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="351993492"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 00:01:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="810546095"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="810546095"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 09 May 2023 00:01:39 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 00:01:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 00:01:38 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 00:01:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chb4h9QgTLkURTpLKO/9MxIi2ulSKN8grx33tYgluy5S46zc0InDl4HKz2EyR/c+pUItm6UP1mregkiY3abV7GjHbaG4E0g1Jn4uCzQI+kXrSl6jEWvMfqqMW2K0jRahiAHQS9p8HhPsDHQ/ReD+B0+kXog14yX+TG3T9TYHig8M8tvgMAWkR9Rl2jqWyx7CHsdDgpDzIcd7ex0KsaRpk0yR5YLTv0SpKIYWytVpWWeQBV88sYc5PbZnKlfVEAwxdnNvrzsrS2B8Bbe2/Fbgor4jJJNg57MRRjh+AXzNhOwAPrg3DzndDVYRoFdxikr+hL8oPZyJNftIwFjB5l0QUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NBtlR3ITiTcKZPUAr0aTVTH4w2c9nECzey3I001UnE=;
 b=NmT65RGX0qTY5cMMl9mGrghgEDtkIdbh6xqiwF9rRdn76UiGKIzNFKm4uJkvo7xkBRn7rcthd2/8JEg91sVjMud/RoqbAtCeTUT4cPF3k7pnY1+fQeBEKxThDQjc1NGATKYmQQ+E2V6J/gIjJkMpRvMEYkEQEsRxMdE3AOZZXqypKiTdnzUhdhAZp/MGd//RyVOd0pKOH61GW1qEamzXlIWmg+V6vgkWBbhi0Uv4GrBql001rbhDpdVkgOHxUL907Qbux4h3h+oYfVK0vUvE+uxsOpSdWYqfecMDPAJ+vPlX0hKyTaH2rA8CtQzcXMVjK4/2Xix4RsezkmyguYwS+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SA2PR11MB4924.namprd11.prod.outlook.com (2603:10b6:806:113::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 07:01:37 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d%5]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 07:01:37 +0000
Date: Tue, 9 May 2023 00:01:34 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZFnvzrM2+wkcDuOl@nvishwa1-DESK>
References: <20230509052419.28430-1-niranjana.vishwanathapura@intel.com>
 <20230509052419.28430-2-niranjana.vishwanathapura@intel.com>
 <0a9ebdbf622ae83936ddb7960d86d9998249bba0.camel@intel.com>
 <ZFnpLMBkjSlu4HM/@nvishwa1-DESK>
 <e5cfbffd-679d-0229-0b77-0d7b08d83f5a@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5cfbffd-679d-0229-0b77-0d7b08d83f5a@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0135.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::20) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SA2PR11MB4924:EE_
X-MS-Office365-Filtering-Correlation-Id: 875273a7-ea11-42f3-0e24-08db505b3b4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NN+n75tsHBJ6a6GXbiFgSWjPWZzsaIhQcTPRSkTkYXI1evFNSWAACL+jXvhf8BPuo+UAQT2Pzcx6kULrw0PEw9mgb9e3w31JT9Xh0NOdEeBW0RlDC5adUlsxYDxJPc3xnLkkO2vaSLq2f9WC5+qfChiWXVCwJOhbKs0RVkbUOml82Da6PFYWVc/X8YXW6pX/LDC0xQjwiRscDAg0Ytw/4PxWDnm0jLIXhEz4SdLpf8IJ5aoX6ejPWFbvRKuIO8XQEr94RY8kmmnXEXW3d/XMSk9eP6zzcPQJbpKzuQ8NEKITPQ/2wL6eHzKRj4bzNmZqzEvg4prVklZx5B70odEqwQt9zyfclBiOp5PcbPZNBWzmMiDQz+Hfxl+D/1uQuV2D7K9RS+17lXaIsSC8Mdmsi2TKsHtVVKaqH73Zvx4B+BuprAXLGXzqnmR2Pk9677x/wuFQeEHvcAXvoqYOXbUgnMlsPYdbk33aagdxwj1YjMATK+zx+vGa+aGLIuYFC24ecf1S/0U6Ng753LM/lJZYf8O/mdaNLZihI8rNvEPDFSuttcAmzBqhqqa+zcySyphISov7ElL7hgtjf3MBq9q+K/OSy6cLo1anxQgflhaA0bM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(39860400002)(376002)(136003)(346002)(396003)(451199021)(54906003)(86362001)(478600001)(66556008)(66476007)(41300700001)(6916009)(316002)(66946007)(83380400001)(6666004)(33716001)(6486002)(4326008)(8936002)(8676002)(5660300002)(38100700002)(44832011)(82960400001)(6506007)(9686003)(6512007)(26005)(186003)(2906002)(66574015)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NnGrFQWCAIYFb2C1j3hGgZ3ZtXzZ7dMZ7OUxpR67Av/P94lXQWzDF4MJwb?=
 =?iso-8859-1?Q?EQi5J0QbE8dn8XXm0uIvhrWYbJBUaPK9rP/FYZVYDCXMGbgjnfTOtJ94nk?=
 =?iso-8859-1?Q?h5gmRQxZlT/J4D3MiknAYUCTbSFSCHaESBIFmTMEWPXrHLtHoyTelyBV10?=
 =?iso-8859-1?Q?i61rZDkS2OMpwD2SYpbnMMCO17LfVr1iqyyp1IMtJYriBmXIs+i1NtBtUj?=
 =?iso-8859-1?Q?kGYvPnaWyEd/KGIQjVP6HTKGbFVbSoXrT3ZZAA6o90uUcDGbe5Py6xT1Iu?=
 =?iso-8859-1?Q?8vr7nLIfJMICFx3fAt3PyVvHt15vlz2/T5puyjJb5z2vme0iES2A27XPUo?=
 =?iso-8859-1?Q?wf3HNys9Rt/XyYPXRU/MDEluG6vm5RMhccIqAo7PFNOmSHiDuxtPffGF4U?=
 =?iso-8859-1?Q?Qg3e4MrRWursp7Ry0Yw2P3awrf9Um1P45OWj7zwwRyzmrArtZztebCK6dv?=
 =?iso-8859-1?Q?a+5o+tyNOsB/g81Y2+UcF1B558S0KBG2+kDE7C0Qy3N5Rp52E/y+I3AO2f?=
 =?iso-8859-1?Q?jhJwMc6np/NLrdKv1GxT6BAbWhW3sMdFgLqN+KPpNrl7oAuQpcFg7YEEdV?=
 =?iso-8859-1?Q?O4g9wMUPKNmvV7ydbdw1f+xv8JHuNyAnGufp5BlUCY/tR1/wxNgWvLMfOS?=
 =?iso-8859-1?Q?V1VHFu0Mu4F64ghPwD4a/GDBWtuR7ahDKDG4BBvluttA8Q41dsJRdP8BrG?=
 =?iso-8859-1?Q?wQjStzdXosApB+RXIcUqNHzlCwx5VpyK5wFH/ebHkscqLadfuimhTDuG3j?=
 =?iso-8859-1?Q?H+ayQo1ZpzpX47nZpyTzs5byZAg4keb3qIfxYo/eoetajFuX/HvInfKFDK?=
 =?iso-8859-1?Q?HnOLJVdimqGelFRw272nt3vkaRauXC/HMhu6raBtWtx5/EEn64abV+ZbRM?=
 =?iso-8859-1?Q?g5fK7xqzqPxL7Puk5teALzGcoCD+56JLRmyGLZbbMwZyWPLMRbYQPk1M1D?=
 =?iso-8859-1?Q?xGD1Jr6UOGFSxVAJ6QuX41CUQZx14802/s6X36VMtnCxGdTgXBJsDzKz0e?=
 =?iso-8859-1?Q?q70OZz1YWzZB8B3/VA5L2NPtflVyTUm7HoNU/Zl3NqaYYCnTKyNqh3TAsu?=
 =?iso-8859-1?Q?/EElEcCLeYeiszW+hQPNSd8SrhNtAXL/6+uVhz94zUtNjqpQsGPKD3CO4B?=
 =?iso-8859-1?Q?d7G9PrXD1qWPpPGMpPl6qGYfehBg7zU1qFfE9nX5a4VNITwILIJ0bNUiFH?=
 =?iso-8859-1?Q?wJPhjXTIdF96z9pYLvKLv//Z2WaqO8esZLlXIAb56QfC8mnPiEVbDAZiyE?=
 =?iso-8859-1?Q?iEWZVXoYxTHmmDe5YiVLi2cqyD0bpFW/Z1zINwgZyvkEMCl+Y0/C85OAB9?=
 =?iso-8859-1?Q?lSwVibnRxmYxXNlwVeyxIKHArFpbwTKa9L9hiY2eUpPCAwaHszLNedLS/R?=
 =?iso-8859-1?Q?Rguz0cy8RbfjHFiwacYCiqP3LUykPOekHamT4/5lwbFZQdZ84E8CC2ibML?=
 =?iso-8859-1?Q?lyFhe/ReiO14Iw/I57ih3l5Y0Kld4Cts/QQeLvC23g6dnmHe9VoOST4dmb?=
 =?iso-8859-1?Q?x1Y/gKLcpPawYy+M7tyH68JfOC3ulMNJuHzY1l6JIKnAHdnjeK3qCce+MS?=
 =?iso-8859-1?Q?xzm2gMUV3QTEkAh2HbzGXmwrYZiguNx2sqEaZ5Z3GbjlhlpvcH+XoIGERB?=
 =?iso-8859-1?Q?xfO7+ROXGuzvm3dVLVEtah5vd1yeiujpIRZ8+pMtFytuGLv360CUSZ5zZU?=
 =?iso-8859-1?Q?DgYWSbZ5rM78ehzBoqI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 875273a7-ea11-42f3-0e24-08db505b3b4b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 07:01:37.1395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8tFtmAH/senKoPLjIjDWNBfs8pb414cIDp4NFBY/W1LmjYglPETKAOkHs3wyzWtUgvVdyWu6Ny5uquWXeXAtiDT55uU7aTkOc/mCRb1XLlUf+vXZ4kB/TsXgeY5sMgH1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4924
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Handle -EDEADLK case in preempt
 worker
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
Cc: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 09, 2023 at 08:57:40AM +0200, Thomas Hellström wrote:
>
>On 5/9/23 08:33, Niranjana Vishwanathapura wrote:
>>On Mon, May 08, 2023 at 10:46:48PM -0700, Hellstrom, Thomas wrote:
>>>On Mon, 2023-05-08 at 22:24 -0700, Niranjana Vishwanathapura wrote:
>>>>With multiple active VMs, under memory pressure, it is possible that
>>>>ttm_bo_validate() run into -EDEADLK in ttm_mem_evict_wait_busy() and
>>>>return -ENOMEM.
>>>>
>>>>Until ttm properly handles locking in such scenarios, best thing the
>>>>driver can do is unwind the lock and retry.
>>>>
>>>>Update preempt worker to retry validating BOs with a timeout upon
>>>>-ENOMEM and while at it, apply the timeout for retries upon -EAGAIN
>>>>as well.
>>>>
>>>>Signed-off-by: Niranjana Vishwanathapura
>>>><niranjana.vishwanathapura@intel.com>
>>>>---
>>>> drivers/gpu/drm/xe/xe_vm.c | 25 ++++++++++++++++++++++---
>>>> 1 file changed, 22 insertions(+), 3 deletions(-)
>>>>
>>>>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>>index 91576cec000d..d92c9f659ab3 100644
>>>>--- a/drivers/gpu/drm/xe/xe_vm.c
>>>>+++ b/drivers/gpu/drm/xe/xe_vm.c
>>>>@@ -10,6 +10,7 @@
>>>> #include <drm/ttm/ttm_execbuf_util.h>
>>>> #include <drm/ttm/ttm_tt.h>
>>>> #include <drm/xe_drm.h>
>>>>+#include <linux/delay.h>
>>>> #include <linux/kthread.h>
>>>> #include <linux/mm.h>
>>>> #include <linux/swap.h>
>>>>@@ -508,6 +509,8 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
>>>>                kvfree(tv);
>>>> }
>>>>
>>>>+#define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
>>>>+
>>>> static void preempt_rebind_work_func(struct work_struct *w)
>>>> {
>>>>        struct xe_vm *vm = container_of(w, struct xe_vm,
>>>>preempt.rebind_work);
>>>>@@ -519,6 +522,7 @@ static void preempt_rebind_work_func(struct
>>>>work_struct *w)
>>>>        struct dma_fence *rebind_fence;
>>>>        unsigned int fence_count = 0;
>>>>        LIST_HEAD(preempt_fences);
>>>>+       ktime_t end = 0;
>>>>        int err;
>>>>        long wait;
>>>>        int __maybe_unused tries = 0;
>>>>@@ -633,9 +637,24 @@ static void preempt_rebind_work_func(struct
>>>>work_struct *w)
>>>> out_unlock:
>>>>        xe_vm_unlock_dma_resv(vm, tv_onstack, tv, &ww, &objs);
>>>> out_unlock_outer:
>>>>-       if (err == -EAGAIN) {
>>>>-               trace_xe_vm_rebind_worker_retry(vm);
>>>>-               goto retry;
>>>>+       /*
>>>>+        * With multiple active VMs, under memory pressure, it is
>>>>possible that
>>>>+        * ttm_bo_validate() run into -EDEADLK and in such case
>>>>returns -ENOMEM.
>>>>+        * Until ttm properly handles locking in such scenarios, best
>>>>thing the
>>>>+        * driver can do is retry with a timeout. Apply timeout for
>>>>retries upon
>>>>+        * -EAGAIN as well instead of indefinitely retrying. Killing
>>>>the VM or
>>>>+        * putting it in error state after timeout or other error
>>>>scenarios is
>>>>+        * still TBD.
>>>>+        */
>>>>+       if ((err == -EAGAIN) || (err == -ENOMEM)) {
>>>
>>>We should not timeout for userptr -EAGAIN, see previous mail.
>>>Otherwise LGTM.
>>
>>Ok, will leave -EAGAIN as is.
>>
>>Niranjana
>
>
>Thanks. If we later find out somehow it might be needed, it's a much 
>bigger change involving multiple retry points so we should tackle that 
>separately anyway.
>

Ok, makes sense. Thanks for the review.
posted revised series with your r-b.
Will push once CI passes.

Niranjana

>Thomas
>
>
>>
>>>
>>>>+               ktime_t cur = ktime_get();
>>>>+
>>>>+               end = end ? : ktime_add_ms(cur,
>>>>XE_VM_REBIND_RETRY_TIMEOUT_MS);
>>>>+               if (ktime_before(cur, end)) {
>>>>+                       msleep(20);
>>>>+                       trace_xe_vm_rebind_worker_retry(vm);
>>>>+                       goto retry;
>>>>+               }
>>>>        }
>>>>        up_write(&vm->lock);
>>>>
>>>
