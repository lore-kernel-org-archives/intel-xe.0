Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E669C83F2F
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 17:08:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB1E10E0EF;
	Thu, 31 Aug 2023 17:08:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9D910E0EF
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 17:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693501681; x=1725037681;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7gwqYlG3ufm0SR4SCgdT2KfU7KeKfPOuzJL5qiMZV3g=;
 b=XJj7YiK3ddpAFNInLbgXMoFFOnlOF+mCHcNm13XOlVG4ToWk5o6TB0G2
 FcxG+NV36rzizSBv/7Vuf3AN8JPmea2BdjnThcK+zdzqeRo5CgbfWcabg
 7mxQIdZVPI0vw95DqCawnrWRq6JYAwXntW8dFyNVo3n18KLd/tEprMoIK
 2QrUtWmgK3BViIxYHRYlKy/GCxI3Krz200/uam4KJk3rj/TPTP/nk01ds
 GJ3fmKa/N0B7pDCXYrJpDtiEZKRlfw2R8eIWZM4roHHqtBUL62ro0GFwP
 4lAgSgGJXyNv6eaQf96CleN1KNTTu53DMo3D20zkjp4D3p+eCrEyFNZyY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="355505512"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="355505512"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 10:07:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="863179994"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="863179994"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 10:07:30 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 10:07:29 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 10:07:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 10:07:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 10:07:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qg2rOksJ/EZ9C96KzIsY5gFMUmLdVwVIl8/iZN7hinMVlK4q0ptS+TGqu0ZxpldJ1LaqVP2TmJ1jHaBqHsJ3sfeNpzxIljqv4y4iGG3ElSv7vYt7yZNvdyjeqyi1SUjHRKq/dsqvrY6A7ubw2aFANRNmNWITqICiWtPTm9KCx+h8eh6fVrZO+A9/IO6+4W92DVOCqntUdRvdwh2w3l+t9haueTe2Yg8etCxe/5MX4J9p4KjafymcQWX3ihNWfkroVmnfhJIZcp7rOEBNV7XuV3fib8jt7nLE3ydqUccVqAidGHyahZwYET+eEgqzL4NAvTxKy3eGLFZIX4wLOOv8aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/eywtZy9zY8ylxVTcdJaSvMmAohoO/43jJWKkOukQY=;
 b=YRtp6SeLwSx3xqlkWd7DRp83pjlz+YIav0TJcvrPoXO3cGPZkgXKk2AnLzhXB+jV0ZtshA2gNFRR1tq37uZWnlCCpTvz7Vzjs6jWEw+ualyBoqAy4zf3OT8KbH0dbd6DfhlG03ZVVYaGM6DzCljvcurxpTm+6IDwAjhNshvu78sXAfc/116WUS04WrdmQwUA85aJyX81ii7yQmMAUHO5sXuvFuGSQYwGnfkezi3hxMRAnAKcsbXBQ3tEN34NcZhmJ6tHP/kzzn1df/t1RHVhCKUWnuxz9h0DvK3ESohAos9dLTxwaZAbv4L9XCeSRz8WaY4y9c6KVQGqC5+xCiDOXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4971.namprd11.prod.outlook.com (2603:10b6:806:118::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Thu, 31 Aug
 2023 17:07:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6745.022; Thu, 31 Aug 2023
 17:07:26 +0000
Date: Thu, 31 Aug 2023 17:06:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZPDIjgjRQg8OBxZT@DUT025-TGLU.fm.intel.com>
References: <20230831092937.2197-1-thomas.hellstrom@linux.intel.com>
 <20230831092937.2197-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230831092937.2197-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY3PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4971:EE_
X-MS-Office365-Filtering-Correlation-Id: 41974901-89aa-4429-ee39-08dbaa44c033
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bPIczsvxXlJxmbxw23CXHoqdOZkGjgBQtVmUkAN+ELn0gI6YDR1jALr9NKtf3gBag0rnrWX4/aNziHh0dJr5hJxzi/gdjdbY4/QNC8rCafmEZAVdgNnjreHe8a84qXUSJNN+iP1fVmQTAq9Xwh//11uIueyrvQVe2grPnIWhOEgvhWHlIxR9+7/1Lk03D+gAXNR9hUkbTL3+Pdt5fFhgWEvSozrA67XufKR0VQDt8Wgc0H9djmLsNPKOlnocCjv3PoASp9o/7qJNtZk9CzN8cg9kBSuAFZ2EL8l/Bprpvl3IzeiQyJ6L8ZRvLWJD9fv9W8gzYSx20poJypt2whgoGYigDt1xGNm0n+Sz7r7fwKRiLpPVmhH3q/XBIOlnj3nob+I8XlJNQppdl9fSCjing82Wmbj3jh/updb59g0awgp7MoLEycbdOl3taDtWbPzipKnayAvkeozRTNSwIXbLkcnT8ltqrCuP3Cd+x9wKT8O12B1JFO2ZpwtZTx/XkDEpf8isIf2DPd1+MvmON4wWuoDPOt2FE/JuoyCmAi9S7Fe3q2wxXTTNwpoVMoLJRtwnsDIuiiBx0vYo8QN9FdwFS23RZKqjR7F0hN0Sb04V7IM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(346002)(39860400002)(396003)(451199024)(186009)(1800799009)(66556008)(6666004)(6506007)(6486002)(6512007)(966005)(66574015)(478600001)(8936002)(26005)(8676002)(66946007)(30864003)(6916009)(2906002)(316002)(83380400001)(5660300002)(41300700001)(66476007)(44832011)(4326008)(38100700002)(82960400001)(86362001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?b4dgnx645avE4qd376AKeGiEJBsWx/xJRrDcE+cfxKhT4Ny7kQqE76ADxS?=
 =?iso-8859-1?Q?KHyuhCG+23HFutugHX6fzPAvtDj0D+WqbrD1o0y5vsdLsCmjLCHln6kyXc?=
 =?iso-8859-1?Q?QRxy7hS39eCG/TbachetM2Zo6F9jRfkxLHr+f9CyoTE2NWgrcyPia/gtzu?=
 =?iso-8859-1?Q?wjrFGEOnd7NKE1stLwTfZiylwjE3CJ9F5fn1k95OOIb/6tjOJxNXmt7UmI?=
 =?iso-8859-1?Q?Catjo2Y1L2759aOua/cJqkNMErAUKLwO3k3XlsX+l7a7r2D6FOoKUsFXY9?=
 =?iso-8859-1?Q?HeMv/A7/dfFKBHxp1gsg6C6SkPQs4EemXCSK0iDEdHPTnQVL1PKi/TlPEN?=
 =?iso-8859-1?Q?mf5woaeQTsKNducpwOVEgocjC234OaaceZxSmkj5etHPy+x7SZs23uuAja?=
 =?iso-8859-1?Q?4JKwuSSB4OmEPGuvdJ5egeKKbm3b8NyaKGt8BmTew4JSMHZ3kU1S9gLEWb?=
 =?iso-8859-1?Q?pYQkodyqT+uK/D4wYdEK0TRrDnaBmB6+Xq9zXrz5xijuufg/KLqbdhJA/4?=
 =?iso-8859-1?Q?emA+i4mO+YejprynSBt+Xg3tycR7imR2RVzXiU8U8+Ej9vbgejQQWmj8xo?=
 =?iso-8859-1?Q?2D/40uTrHgf0we/dO46Nrudd/nViiKpd+Ryinho7UCoDo0Np2onTbwkNmx?=
 =?iso-8859-1?Q?/pF3rkwxhZoZSuc5PMZtBdaNV+vru90SUuf3irjeawo2mDFHNOnqjsINg7?=
 =?iso-8859-1?Q?PtbVueSA6AZl0ssYIiz2KwtwftwdmjIgiSg4OZLkIjM28Q5iIm0abD09x7?=
 =?iso-8859-1?Q?3SRirSNHBtZxkywnR3Dq5c9vK4wKWl1rRYiBP6yb1TlOUtBy51Pifyz6D3?=
 =?iso-8859-1?Q?s5v6X/Z5BR9DOzMuuapC4BjMtz1b6n7d2v1Z9TG0oGtVi4wrVP8nngrnxZ?=
 =?iso-8859-1?Q?jVJXG0mOrD4d3DK/fFDZ+y3+dhq5q5lBXM9NdvDOTrtRLqbzmMypegvHfH?=
 =?iso-8859-1?Q?k22KnNr3Wy3iKDWlhGEG4HY2NloVbL2yL9pXy3rY0mm+ArXH+agX90xcmX?=
 =?iso-8859-1?Q?gvIDaWXnSx10ddFEroGgTJOleXr33WjVZHImmAc/og7ppOUVuUFjHJqiT/?=
 =?iso-8859-1?Q?BycIb3U6xZH/TRZU1ADRe3g5j9b5cEVVvVOG50+RYDHd64MKOG8sEfMln8?=
 =?iso-8859-1?Q?xJbY60OyxDPuuOMUl7emyLbULoNJynjhSbh5LcoXQvfGtTMX4Mx8cRrGQk?=
 =?iso-8859-1?Q?8ZD5PhfvHvTV5cgdd890XPT814+b9yDF5qrUmy/ohVPLEE8MQOElcap1l3?=
 =?iso-8859-1?Q?5ip3/wlivMGhODCg7pogNH8Ueh7zbckJHyxXn0y1lOnRcp8L0lzFDg57sy?=
 =?iso-8859-1?Q?zMCACnZyHmH75Etzg/OU01aFpoujcfNMCdJx2Km2xeFyeh5OOg2K0rDSoo?=
 =?iso-8859-1?Q?Ihq1LiylVS6OuvMuXBaNBNbxd3zXsOhRbZELuQeJJdRwEgIFh3iAypy1uv?=
 =?iso-8859-1?Q?YKMOSytpOCTc61PbVpIwZ96c+8OnLk120HX/W+xGgGSuyfQ1jOIxTMtveg?=
 =?iso-8859-1?Q?vWwjvYURqpOIa0pBVW3V0DqWnzS5ejtZbTrtjypiw/zfCK+kj3mwz0K3dZ?=
 =?iso-8859-1?Q?idDHBbYaVKtsajR3juBhQyld865fhIAdOCm2FbKVIhoqwR5dubzXlQz//M?=
 =?iso-8859-1?Q?mjkOVvXznsVMFr12A500QwZjfKtl5frNn1pyra5horPCrAazxGoIZZtw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41974901-89aa-4429-ee39-08dbaa44c033
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 17:07:26.4045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6+nX+/khR634n0hgI5rk+nnX+s8Ob1zBI1STjtNtFO9jQuCQL7wsFKHxPrUg6VVcQGqw+AwL0Db3zH8U9bUPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4971
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/6] drm/xe/vm: Simplify and document
 xe_vm_lock()
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

On Thu, Aug 31, 2023 at 11:29:33AM +0200, Thomas Hellström wrote:
> The xe_vm_lock() function was unnecessarily using ttm_eu_reserve_buffers().
> Simplify and document the interface.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_bo.c      |  9 +++--
>  drivers/gpu/drm/xe/tests/xe_migrate.c |  5 ++-
>  drivers/gpu/drm/xe/xe_bo.c            |  5 ++-
>  drivers/gpu/drm/xe/xe_exec_queue.c    |  5 ++-
>  drivers/gpu/drm/xe/xe_lrc.c           |  6 ++--
>  drivers/gpu/drm/xe/xe_migrate.c       | 10 +++---
>  drivers/gpu/drm/xe/xe_vm.c            | 50 +++++++++++++--------------
>  drivers/gpu/drm/xe/xe_vm.h            |  5 ++-
>  8 files changed, 42 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 31fd4f9b2d5b..c6025404042d 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -180,17 +180,16 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>  	unsigned int bo_flags = XE_BO_CREATE_USER_BIT |
>  		XE_BO_CREATE_VRAM_IF_DGFX(gt_to_tile(gt));
>  	struct xe_vm *vm = xe_migrate_get_vm(xe_device_get_root_tile(xe)->migrate);
> -	struct ww_acquire_ctx ww;
>  	int err, i;
>  
>  	kunit_info(test, "Testing device %s gt id %u vram id %u\n",
>  		   dev_name(xe->drm.dev), gt->info.id, gt_to_tile(gt)->id);
>  
>  	for (i = 0; i < 2; ++i) {
> -		xe_vm_lock(vm, &ww, 0, false);
> +		xe_vm_lock(vm, false);
>  		bo = xe_bo_create(xe, NULL, vm, 0x10000, ttm_bo_type_device,
>  				  bo_flags);
> -		xe_vm_unlock(vm, &ww);
> +		xe_vm_unlock(vm);
>  		if (IS_ERR(bo)) {
>  			KUNIT_FAIL(test, "bo create err=%pe\n", bo);
>  			break;
> @@ -259,9 +258,9 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>  
>  		if (i) {
>  			down_read(&vm->lock);
> -			xe_vm_lock(vm, &ww, 0, false);
> +			xe_vm_lock(vm, false);
>  			err = xe_bo_validate(bo, bo->vm, false);
> -			xe_vm_unlock(vm, &ww);
> +			xe_vm_unlock(vm);
>  			up_read(&vm->lock);
>  			if (err) {
>  				KUNIT_FAIL(test, "bo valid err=%pe\n",
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 5c8d5e78d9bc..8bb081086ca2 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -396,14 +396,13 @@ static int migrate_test_run_device(struct xe_device *xe)
>  
>  	for_each_tile(tile, xe, id) {
>  		struct xe_migrate *m = tile->migrate;
> -		struct ww_acquire_ctx ww;
>  
>  		kunit_info(test, "Testing tile id %d.\n", id);
> -		xe_vm_lock(m->q->vm, &ww, 0, true);
> +		xe_vm_lock(m->q->vm, true);
>  		xe_device_mem_access_get(xe);
>  		xe_migrate_sanity_test(m, test);
>  		xe_device_mem_access_put(xe);
> -		xe_vm_unlock(m->q->vm, &ww);
> +		xe_vm_unlock(m->q->vm);
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 9d70d12e79b1..f329fe798394 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1749,7 +1749,6 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  	struct xe_device *xe = to_xe_device(dev);
>  	struct xe_file *xef = to_xe_file(file);
>  	struct drm_xe_gem_create *args = data;
> -	struct ww_acquire_ctx ww;
>  	struct xe_vm *vm = NULL;
>  	struct xe_bo *bo;
>  	unsigned int bo_flags = XE_BO_CREATE_USER_BIT;
> @@ -1802,7 +1801,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  		vm = xe_vm_lookup(xef, args->vm_id);
>  		if (XE_IOCTL_DBG(xe, !vm))
>  			return -ENOENT;
> -		err = xe_vm_lock(vm, &ww, 0, true);
> +		err = xe_vm_lock(vm, true);
>  		if (err) {
>  			xe_vm_put(vm);
>  			return err;
> @@ -1830,7 +1829,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  	xe_bo_put(bo);
>  out_vm:
>  	if (vm) {
> -		xe_vm_unlock(vm, &ww);
> +		xe_vm_unlock(vm);
>  		xe_vm_put(vm);
>  	}
>  	return err;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index e44d71c679cc..6725157d8c1d 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -111,18 +111,17 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
>  					   u32 logical_mask, u16 width,
>  					   struct xe_hw_engine *hwe, u32 flags)
>  {
> -	struct ww_acquire_ctx ww;
>  	struct xe_exec_queue *q;
>  	int err;
>  
>  	if (vm) {
> -		err = xe_vm_lock(vm, &ww, 0, true);
> +		err = xe_vm_lock(vm, true);
>  		if (err)
>  			return ERR_PTR(err);
>  	}
>  	q = __xe_exec_queue_create(xe, vm, logical_mask, width, hwe, flags);
>  	if (vm)
> -		xe_vm_unlock(vm, &ww);
> +		xe_vm_unlock(vm);
>  
>  	return q;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 2b4219c38359..434fbb364b4b 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -789,16 +789,14 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  
>  void xe_lrc_finish(struct xe_lrc *lrc)
>  {
> -	struct ww_acquire_ctx ww;
> -
>  	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
>  	if (lrc->bo->vm)
> -		xe_vm_lock(lrc->bo->vm, &ww, 0, false);
> +		xe_vm_lock(lrc->bo->vm, false);
>  	else
>  		xe_bo_lock_no_vm(lrc->bo, NULL);
>  	xe_bo_unpin(lrc->bo);
>  	if (lrc->bo->vm)
> -		xe_vm_unlock(lrc->bo->vm, &ww);
> +		xe_vm_unlock(lrc->bo->vm);
>  	else
>  		xe_bo_unlock_no_vm(lrc->bo);
>  	xe_bo_put(lrc->bo);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index a782ea282cb6..ee8bc5f3ba3d 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -88,13 +88,12 @@ struct xe_exec_queue *xe_tile_migrate_engine(struct xe_tile *tile)
>  static void xe_migrate_fini(struct drm_device *dev, void *arg)
>  {
>  	struct xe_migrate *m = arg;
> -	struct ww_acquire_ctx ww;
>  
> -	xe_vm_lock(m->q->vm, &ww, 0, false);
> +	xe_vm_lock(m->q->vm, false);
>  	xe_bo_unpin(m->pt_bo);
>  	if (m->cleared_bo)
>  		xe_bo_unpin(m->cleared_bo);
> -	xe_vm_unlock(m->q->vm, &ww);
> +	xe_vm_unlock(m->q->vm);
>  
>  	dma_fence_put(m->fence);
>  	if (m->cleared_bo)
> @@ -338,7 +337,6 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  	struct xe_gt *primary_gt = tile->primary_gt;
>  	struct xe_migrate *m;
>  	struct xe_vm *vm;
> -	struct ww_acquire_ctx ww;
>  	int err;
>  
>  	m = drmm_kzalloc(&xe->drm, sizeof(*m), GFP_KERNEL);
> @@ -353,9 +351,9 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  	if (IS_ERR(vm))
>  		return ERR_CAST(vm);
>  
> -	xe_vm_lock(vm, &ww, 0, false);
> +	xe_vm_lock(vm, false);
>  	err = xe_migrate_prepare_vm(tile, m, vm);
> -	xe_vm_unlock(vm, &ww);
> +	xe_vm_unlock(vm);
>  	if (err) {
>  		xe_vm_close_and_put(vm);
>  		return ERR_PTR(err);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 5679c47f47ca..ac222cbe78f0 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -518,18 +518,17 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
>  
>  static void xe_vm_kill(struct xe_vm *vm)
>  {
> -	struct ww_acquire_ctx ww;
>  	struct xe_exec_queue *q;
>  
>  	lockdep_assert_held(&vm->lock);
>  
> -	xe_vm_lock(vm, &ww, 0, false);
> +	xe_vm_lock(vm, false);
>  	vm->flags |= XE_VM_FLAG_BANNED;
>  	trace_xe_vm_kill(vm);
>  
>  	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link)
>  		q->ops->kill(q);
> -	xe_vm_unlock(vm, &ww);
> +	xe_vm_unlock(vm);
>  
>  	/* TODO: Inform user the VM is banned */
>  }
> @@ -1407,7 +1406,6 @@ static void xe_vm_close(struct xe_vm *vm)
>  void xe_vm_close_and_put(struct xe_vm *vm)
>  {
>  	LIST_HEAD(contested);
> -	struct ww_acquire_ctx ww;
>  	struct xe_device *xe = vm->xe;
>  	struct xe_tile *tile;
>  	struct xe_vma *vma, *next_vma;
> @@ -1430,7 +1428,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	}
>  
>  	down_write(&vm->lock);
> -	xe_vm_lock(vm, &ww, 0, false);
> +	xe_vm_lock(vm, false);
>  	drm_gpuva_for_each_va_safe(gpuva, next, &vm->mgr) {
>  		vma = gpuva_to_vma(gpuva);
>  
> @@ -1471,7 +1469,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  					      NULL);
>  		}
>  	}
> -	xe_vm_unlock(vm, &ww);
> +	xe_vm_unlock(vm);
>  
>  	/*
>  	 * VM is now dead, cannot re-add nodes to vm->vmas if it's NULL
> @@ -1509,7 +1507,6 @@ static void vm_destroy_work_func(struct work_struct *w)
>  {
>  	struct xe_vm *vm =
>  		container_of(w, struct xe_vm, destroy_work);
> -	struct ww_acquire_ctx ww;
>  	struct xe_device *xe = vm->xe;
>  	struct xe_tile *tile;
>  	u8 id;
> @@ -1534,14 +1531,14 @@ static void vm_destroy_work_func(struct work_struct *w)
>  	 * is needed for xe_vm_lock to work. If we remove that dependency this
>  	 * can be moved to xe_vm_close_and_put.
>  	 */
> -	xe_vm_lock(vm, &ww, 0, false);
> +	xe_vm_lock(vm, false);
>  	for_each_tile(tile, xe, id) {
>  		if (vm->pt_root[id]) {
>  			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
>  			vm->pt_root[id] = NULL;
>  		}
>  	}
> -	xe_vm_unlock(vm, &ww);
> +	xe_vm_unlock(vm);
>  
>  	trace_xe_vm_free(vm);
>  	dma_fence_put(vm->rebind_fence);
> @@ -3417,30 +3414,31 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	return err == -ENODATA ? 0 : err;
>  }
>  
> -/*
> - * XXX: Using the TTM wrappers for now, likely can call into dma-resv code
> - * directly to optimize. Also this likely should be an inline function.
> +/**
> + * xe_vm_lock() - Lock the vm's dma_resv object
> + * @vm: The struct xe_vm whose lock is to be locked
> + * @intr: Whether to perform any wait interruptible
> + *
> + * Return: 0 on success, -EINTR if @intr is true and the wait for a
> + * contended lock was interrupted.

Same as previous patch [1] add a comment on checking the return value.
[1] https://patchwork.freedesktop.org/patch/555184/?series=123100&rev=2

>   */
> -int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> -	       int num_resv, bool intr)
> +int xe_vm_lock(struct xe_vm *vm, bool intr)

Even though it isn't used, to be uniform I'm wondering if we should
include an argument to reserve fence slots like xe_bo_lock()? Just a
thought, up to you.

Other than the NITs LGTM.

Matt

>  {
> -	struct ttm_validate_buffer tv_vm;
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> -
> -	XE_WARN_ON(!ww);
> -
> -	tv_vm.num_shared = num_resv;
> -	tv_vm.bo = xe_vm_ttm_bo(vm);
> -	list_add_tail(&tv_vm.head, &objs);
> +	if (intr)
> +		return dma_resv_lock_interruptible(&vm->resv, NULL);
>  
> -	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
> +	return dma_resv_lock(&vm->resv, NULL);
>  }
>  
> -void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
> +/**
> + * xe_vm_unlock() - Unlock the vm's dma_resv object
> + * @vm: The struct xe_vm whose lock is to be released.
> + *
> + * Unlock a buffer object lock that was locked by xe_vm_lock().
> + */
> +void xe_vm_unlock(struct xe_vm *vm)
>  {
>  	dma_resv_unlock(&vm->resv);
> -	ww_acquire_fini(ww);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 6de6e3edb24a..d7d8fd7bd8da 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -39,10 +39,9 @@ static inline void xe_vm_put(struct xe_vm *vm)
>  	kref_put(&vm->refcount, xe_vm_free);
>  }
>  
> -int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> -	       int num_resv, bool intr);
> +int xe_vm_lock(struct xe_vm *vm, bool intr);
>  
> -void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww);
> +void xe_vm_unlock(struct xe_vm *vm);
>  
>  static inline bool xe_vm_is_closed(struct xe_vm *vm)
>  {
> -- 
> 2.41.0
> 
