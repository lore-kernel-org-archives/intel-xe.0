Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87364EB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 22:30:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1395410E117;
	Thu,  6 Jul 2023 22:30:34 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E611A10E117
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 22:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688682631; x=1720218631;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nMoMYHe2NQDv6v3Sj3oll+9ruuaw5W3ufBnuM479FyU=;
 b=DN6gHtKfU5ZkOX82r7eqsXiklz2u2mpJ3wHXEtzx1ePGEmJf5wOd4YiI
 22hHqWS7V1wKjkcFfiuyu7UPH146Qe+VgoPdo7cXYNYhULCGAAWfjnP5v
 01N8Q9eGhJDiDQr/6dPoRCVQ+PqyN8lrLLQu1OTVUOJL+cmiThAkyEKvq
 G3v9iFK9V/YhZBsIrNjgy9CX1vJNZo1A2D/2cvkStfIst0ocNAokNBNyy
 GttWJdDH0Oi/Wky6UyZA2jnDMsliDYFhIcPiFwzqdbVNuZJW38PgVJ7yP
 FpKsiApThZVhmqLIA7bl2UYfk7+RvHfDF604MSjCTMlujLvhKBf4PfOwx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="353580149"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="353580149"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 15:30:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="713743723"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="713743723"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 06 Jul 2023 15:30:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 6 Jul 2023 15:30:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 6 Jul 2023 15:30:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 6 Jul 2023 15:30:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5BiN+W1RAtrQOC8C+BDDLeJunv5RGhfR/uQZRryEHFr8EmaT6XthQmMi2IagfsqBkEeJ2e+PXYSpAaa0D5/CIZ3slxIvbmSn+8OSnFhw6M/HKviy1t6A6Soue//E0seE8/t71BMsCWXldy94R8C/usba5PISwjqIiSiBGYoekpo9qnUHUdkO92v0d6wCLiNvUf4O+4ZJz0xPKLJu/eeNQiJWZ1mZnw8zERx3ly5UPVfLujL5cVHNMas7RcogwTjmKePZeY3DijxiAh5/j3b7y97Bg5bkTvgAOdzAv/ffB0XdFN8UqoNgFI0QHUCg34hxDBXzyf9NXj3F+rlWgdTSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AK5P4Dmmt3lQsS3iK8v24vbJAEHbkZQy1/j0QIn5iI0=;
 b=YN7yliswlqk9MjdomrsqkKMEmzicdIwBOa5G50vTy2wssXXdrguWuLbInCiiIPu9N7qRiK17tWS6GDH8Ks4yq2Yv2HsfZ/S3YKGjv/Vj6kTKGD5Lq3e+Jhcm400ZF8VQKH2inYBzxF4aX3gYYrH1rk/mK/9inc5jPFdJgKwYUula9pq2/xf5FZasiNuzV0WTyxvUFOP7sIqrRYEAbp57ds8JZw0mwFYuURHFhHcrwbRY0cvH0TtvJDPulttLKAhKlgukpmMpNCvAyW/vAiPqbs1p0YtR21xshGCMKM4BkAhnQ9zi666OJFPoE37b3ZRFtqte/dUsdl8NgMKzY7kkxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB5117.namprd11.prod.outlook.com (2603:10b6:a03:2d0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 22:30:28 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::e666:2e79:d3e6:67c8]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::e666:2e79:d3e6:67c8%7]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 22:30:27 +0000
Date: Thu, 6 Jul 2023 15:30:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <20230706223024.GF5433@mdroper-desk1.amr.corp.intel.com>
References: <20230630100059.122881-1-thomas.hellstrom@linux.intel.com>
 <20230706042044.GR6953@mdroper-desk1.amr.corp.intel.com>
 <de824fda-e72c-3fbf-6be1-e42ce05b916b@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de824fda-e72c-3fbf-6be1-e42ce05b916b@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0039.prod.exchangelabs.com (2603:10b6:a03:94::16)
 To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB5117:EE_
X-MS-Office365-Filtering-Correlation-Id: e321281f-7fd4-4ede-2903-08db7e7098f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qAfRNvec2PJlu27dPQaSpsJfZhiSBmmlVS+d8y/NXuVVG/B6lb0Y+p86DeyWnqkACgpka9KOEVv0ike6oY7C7msVpIoPJxo3DGsLYesCOyuYc6p0zem1C1guZ6ME4Q69nWCDHrHkLaZRJLJPG68agBifl3N6xVxjDT8rZU3BknqI+nRjBimcyXbH4Ti6sSan7Y+IHzC2uzourNQYbe6Mt+QdwCCElIDJcXYISEws+1wr5lpmlZcCfZRMpG54vHMtF1tmHvbTRlHcVMfuVmnCfwfRzffUdbOlSGkcADyilwN58mtZsw4XAkWCkLAXGKBL8VuS39lqrqvS8Yd9GnUY7OtedFxPL+5gqV030U8+EySrCL5OIvbyKPAbFhBJfrHMHrDbOJrt2+4HKaW83UnqZj+XBLBd6jOQYi+5jdkk67ZuFJZwGs5YN6jmRJRFwRYeQzSCwUs4RT64h5FSNnbt8ZfY7vbQtwWIvFXImuajQb9+xnIg1bl9uKwppA8yAm5W53vXfgtGzMHek6gXPdxfdWxDoItwSBeN5u/XWO+x7KyN6bqA4LFfgiDEFFr9dQhp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(376002)(396003)(346002)(136003)(451199021)(6512007)(82960400001)(4326008)(6486002)(41300700001)(6666004)(316002)(66476007)(478600001)(8676002)(8936002)(66946007)(38100700002)(6916009)(66556008)(83380400001)(66574015)(186003)(1076003)(6506007)(26005)(33656002)(86362001)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vcNLPX5DoCLZg5YGnxcM5uYDB2eqlAmyo2qfNTZrEKwLLG2M4BsqyvHgqh?=
 =?iso-8859-1?Q?YX6KIN4Z0FPsG/H9FGEcz2ulLi86NaiEpeGDUvIERB7KiY2O1UEoGQ/T1k?=
 =?iso-8859-1?Q?SHYfcys69I/i91De6Idt898KeOqrpNED9SfDSp+y2ukdMuGALAqO7QwEGx?=
 =?iso-8859-1?Q?XOP1SnNI16p9Q4+NoCDPPLYINJ+aHeQd8KuzYWShAJF8sLEDv1YF4w21Bz?=
 =?iso-8859-1?Q?rfM3FY745wREzmXeUQWkHDHLIaN/VPqMoWPZzR7IYI7QcZCPfvQuxlto1n?=
 =?iso-8859-1?Q?jLQqba8uDeFok204JyiJCORf1+eO0LmftRQffz1d0QKl8y2kM+CP2D9VD0?=
 =?iso-8859-1?Q?YlGpOWTQI6ixWQHpSx2SJtrSyPkfECI7sKSyO2taUP35U6+Mzv6LbHUHKT?=
 =?iso-8859-1?Q?zg5BRmfW1zb7TF1b195325HS+l92VfhyKJj0cHyNGd0qp8BSDf3kwSY66M?=
 =?iso-8859-1?Q?BR/AoaKJERUgd/8dI8ePR+mScrM32AKLg0nrea4wVhdnOBxsN01fy+J9jV?=
 =?iso-8859-1?Q?QgktJyCbQRg2xxC+YVX7jAdWbCZYkVnSAWVKdweuNuOny1gWsp02MubwrY?=
 =?iso-8859-1?Q?92V1PSFECIodXN+7xlXjHR+L8SDpUhoWjsJKM/WE3vpn57OUKQp2M44QI8?=
 =?iso-8859-1?Q?AbNGmKm2hQ1JBwW1y54MtUas/Igrdvx/oBj+dujssxLmLjggWQESXAZF7y?=
 =?iso-8859-1?Q?PjvgnyMycqY+r11s1nLMlo4kjEF5yVqRS/hL/FpD3eL5PWRyEO0VCQV3Ls?=
 =?iso-8859-1?Q?cochkqFTE+TYOK64eEPIO0XTLTnLL1fZ5I+s+MnDvFnUPlsJsRtLnfO/3p?=
 =?iso-8859-1?Q?A4c0+zclIsQHhEqVk56xvOvK+jIoohYy05/Ro2bKpJKYk3wwzTrQxI9IfC?=
 =?iso-8859-1?Q?PqIeYHBXAElUVuKF9zQCz97cXT4v2TTf89VmR4qtEiUB3YJOwlvlzOZHSd?=
 =?iso-8859-1?Q?OS6nk+MFhfhGiDnurPujXlVRV3kbMNOyfKKbTk5XLvAMVc+vElOg83LpPx?=
 =?iso-8859-1?Q?Nfmwc/v7n69BlkiDdmKE06jZHGL3vVGGQBeBZp1JrFEzV4pdHGgaOialqu?=
 =?iso-8859-1?Q?aVzfpOaXnpJBAxXGQu8usDkM9gPWUhilcH99eLVYIFrDvJTbujHkeV/j7x?=
 =?iso-8859-1?Q?8YQ6e0XGiwRlf74+eXJC0CTVolwYj2U4bqtvf7uj2ZFgFTVmLlHiokBu/X?=
 =?iso-8859-1?Q?Aeqh1DRaRwgGb30sV3V1ig37IWAGpSCRMCo6q9PYSOI6Wu1XBqKoAjghdi?=
 =?iso-8859-1?Q?GZJuXS+40QEGr4oBtQlrDu4sk+uuCgqcmvuvc0UVYUu31oncto3034iEA6?=
 =?iso-8859-1?Q?7GWL7I/4gcxLrOuHE3OHjxelNhNEYWVW3cPG7rEHgc9jdO5x2Lh345b+Ep?=
 =?iso-8859-1?Q?eCr8wNJgtD5T/YCMzgkOY+kv5UxTFuZ59Yi/wHaNGVaQKUk3LMDZGfQ1wv?=
 =?iso-8859-1?Q?bET3ZUqp4X4B42fxjd5NdHvyfwsXaZhslNX2VpOBu09OyY16sBRC3thkSK?=
 =?iso-8859-1?Q?5JSM4FDGUIDkSmZO1Vpe+rDfOSd/1VZ0Mb5b2QCOXQr2DMIDnbBWCnnOy+?=
 =?iso-8859-1?Q?JH0cvA8zsrpMBRFPhogrKd9bN9FbRJWSedso4LqR8vOQkGFGNhkfQY/S9K?=
 =?iso-8859-1?Q?BgepFBxb3jJSv6GLUq7pqZBXjOj0NG7tE3mfnH6gJaOFRT+FI+R1e+mw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e321281f-7fd4-4ede-2903-08db7e7098f6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 22:30:27.2466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L1Q0RIKIwvFGUycyq/Yc1PgWd8tPrWLGCGjUqu0fbKw8UmwCt0uL72dgqU9afP0NsMNO36dK6mPAxwj4rNKIZGPwsJ3+s4qzy2DYfRlorgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5117
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH DONTMERGE] drm/xe: uapi review submission
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

On Thu, Jul 06, 2023 at 08:14:52AM +0200, Thomas Hellström wrote:
> Hi, Matt,
> 
> Thanks for taking a look into this. Some comments below. I think we need to
> set up tasks for the various review concerns and assign people to have them
> resolved:
...
> > > +struct drm_xe_vm_bind {
> > Should there be a field in here to allow userspace to specify which PAT
> > index corresponds to the behavior (caching, coherency, CLOS, etc.) they
> > want on this binding?  The PAT should be a characteristic of the bind
> > rather than of the underlying object, right?
> Yes, given certain immutable restrictions given at buffer-object create
> time; For example the CPU caching mode will restrict the coherency mode used
> in PAT, and CPU caching mode needs to be specified at bo create time. The
> current suggestion is therefore that coherency mode also needs to be
> specified at bo create time, a slightly stricter limitation on the available
> PAT indices at VM_BIND time. Whether we want to include PAT in the main
> struct or as an extension hasn't been decided yet.

I'm not sure I fully understand this one; I thought CPU caching to be
mostly orthogonal to GPU coherency mode.  Do you mean we'd step in and
prevent combinations like CPU:WB + GPU:non-coherent since then the GPU
might not see updates done by the CPU that are still stuck in the CPU
cache and/or the CPU might read stale data from its cache after the GPU
has updated the buffer?  It seems like there are so many ways userspace
could already shoot itself in the foot if it picked nonsense settings
that I'm surprised we'd try to stop it here.  Even for the example given
there might be some cases where it still winds up being fine (e.g., the
CPU side always does clflushes at the necessary times and the GPU never
does any writes that would need to invalidate the CPU cache).

Am I overlooking something, or are the combinations that will get
restricted based on something else entirely?


Matt

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
