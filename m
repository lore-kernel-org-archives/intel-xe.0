Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A13DE92FCF
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 23:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AE810E4B0;
	Thu,  5 Oct 2023 23:35:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E644010E4B0
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 23:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696548897; x=1728084897;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hiVvV0bbRkcfFWF2pVh+QukGthOGh8GoHeMSL1ax9Fs=;
 b=Rbxfe890OXWUc7BWdBFSNNhUnvxFy5/NiV7PYnRKUWxW6Y0iOq4++Hou
 ZPRLzQycvUvYpy56jy6JwvS6zzqCXFWB9GubNkci/ZUiNeIYtZNkSFLeF
 93JdkAF08lKRt0nkM8bnsTbhy6+skDgs2fmsx51rkSTnjsKub9uVbPJPd
 wsx2Vnj0FPbwj8cUc0Bsr2Svy2sRW5JAclP+QNW57Gma4WGV4mVH6s/Q9
 a6kx4UIHlLgD15Nng1r46pN+xw6F2Xbcxss+aqz1LVIiXHVnPgevYcEhJ
 gwrKedM7oWV5NAPqz260nOCPmy1DG4FEO7lqfG3fwZprdL9byEMoX7T2A Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="386473491"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="386473491"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 16:34:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="817813653"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="817813653"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 16:34:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 16:34:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 16:34:54 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 16:34:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjt90ggYzcQAhW2oyY6zPjX7Tqwowdd0hd0db+kTrhLKA7VxQS3M2qgt0ydbXVaUtb4SQL+uVijnTuyU05zzHdVtwaqrMxP8+cazQrnKUVL4RqPFzXzbbe3IAaSLwFAGTsyD11yUMovIoecer/K5SKqJrT1Kpv5Y7lxgU3CLsWmEMIBS7qjk02ZGRyHE4wuT63q1UFOh5RSGD602qqG470yGdHNpQYhwPbMuEDW/oXptkmOXH5Q5cOjuTb9xt0ANrnenTXC+IkZCTqwJJu9vlPWWaxTMUeORqYtmaQgNNEXB9/ruyUZZqnFprF2UypRXqHEXm65WiBchq/bc9iIzjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivSiLzy7LNgqbpgIBHEQB/lJCOd49vZlw0Mitif9PVo=;
 b=Ja0Nuc+DA+c2RsDmk3YQ5EEh/wP/C+N9igGcoGT0U/iBs/JTjqIXMUx2N/3ucGMCPqa/qiynP4sfGWsm7Ec/9e/eR79eqszGbOigCYat0wM7AAVcvJfQ5P5hZr90eHpKJAZHvu6BRzSbBZavua4XJCppSlmnX9YNhxX4zkUzouORTWqcYKjmT6WAWrv3ok/jKtoggwo0cKPTCja+VAyRbSCKt3iJg9MkVxlzIhFiYDLJXhgsMIHlQwUpcNWb4cHI/JUNQ7NDCW7QSGps6HOVWA/DX1RCBmShqz093D5JvTXoOQzCo6yogIscn5GLrsC4+9nYAR+jbNqZVdk7mUf1PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5302.namprd11.prod.outlook.com (2603:10b6:208:312::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Thu, 5 Oct
 2023 23:34:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 23:34:47 +0000
Date: Thu, 5 Oct 2023 18:34:44 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <s2ggfpnsl5fsdexpmqmo2r35q6avb37uddampg4cmlsmddhs2q@uu4kyf5vkf3f>
References: <20231004210624.123779-1-jose.souza@intel.com>
 <yiyeir6exg26ttr5jcuzth6qpz7e2k3wxxo5hwsqqff44qmm53@l7t3ikixq4yu>
 <20231005145900.GA208112@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231005145900.GA208112@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5302:EE_
X-MS-Office365-Filtering-Correlation-Id: f2c65102-05e6-4fbf-5137-08dbc5fba926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1KZvoI8arx/ClDA0iKNGHOQ1dkGq4rLoQET68Qk1Rgq2Iu50wU0ZLb1ZLpi5vZ0REG3CXBWMzHVzEbTqe8jTtltQJUSUNUc5XJ9718JrLQOpK775JspiI1r/G0QeTGLKh6oVdlcMJknVZMxYAdGIV5se9dz5N/mvCVH9ARtP2F0ya1t6mm3HNP7Sct+E0xrvSiNBUZviU9zr/70MTGQvuoGigxIJ1cuf/oVHx56+AkyscdWTQJtYliwRVnYzMmSYnTXJjg+ISrioEgZGjHDegxeG3jvNoFc0k6TOzvGrqeGg7KvSu/k0cspeAPOG7pqBG8l1z6LGXofeheX05WV2ntvPN37ikik6gbHN2D6kQG9egY+Tg9GzoGntPIuG70EETlwxQAdNNhIm2Dq1Jio5x8TL4NoBSIuYh0S4hDzQQtNORFZSq0QtCbOQAwXBRcbRNkpJKWMz4hLDH7tbLXWzfiQHsT0HKZvNJtCEgw1bfvTtJJf5Iblb0lO28yZQ+6N6CM04gvDCGSMgXdsa4p6i4XyWySrXJFccv/THsTrHn8iixXHzaOcHAj3iaGxQVF2k
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(376002)(136003)(396003)(39860400002)(346002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(5660300002)(8676002)(2906002)(4326008)(8936002)(6862004)(41300700001)(316002)(66946007)(6636002)(54906003)(66476007)(66556008)(33716001)(6506007)(6666004)(26005)(6512007)(107886003)(86362001)(9686003)(478600001)(82960400001)(83380400001)(38100700002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XLLn5vxM20zCQLNCUpmaWRI6cvha/DgpBkuaov3u3TcYf4NCt8t/9fvdr2?=
 =?iso-8859-1?Q?6sSUU8hHgSHeZO2kxvOtYYGOiFcKXMFqIVGgxU2z08x7dHWE9N4Bxtv/jY?=
 =?iso-8859-1?Q?We31G38geel78gEh4E2G+15TjiAS3b9HN9pSzLqaVeKMiyKRiWepry3KZ6?=
 =?iso-8859-1?Q?rxKT7AMaY3DHB2VKlDuwq88PWYLT4MH3G1PGEfHbx78lTDr22N7EzejQkA?=
 =?iso-8859-1?Q?OwBVbBSi+b20r5kxP/DGKufTorzxD9e0Cx83uaAc5n3gCRueoPNWRSmn0b?=
 =?iso-8859-1?Q?JiEDnDMUt0nCORlYtBsCit7rDRqBsoEi2q8AgXMBNEV3hs/jjOBLSSFkzq?=
 =?iso-8859-1?Q?kiMuED0d7xlmGvnx1v5SQkH/sh0lRyOxSHOBQ7Nx4TEDfCgxVtlvm+zAnH?=
 =?iso-8859-1?Q?g5xkggpgJIRjs06NTqeCGpxqK3pMLA0t9r4QfOitnPZjYdveknNrgtnAxL?=
 =?iso-8859-1?Q?1dpEG/i/Wl8g/g8+X1AARHB3bO6Y5+fkORoRQjS/WhyFz1gqy042jWZ1gm?=
 =?iso-8859-1?Q?2SHNHImCrq8Yl1gEfQIOTPqIDJykeY9D/VhZDyaEXIrVXTke/Xq+QqdhvW?=
 =?iso-8859-1?Q?R20ecf4SPahMFhNIyNrzzyS9P7mJ8hBeUilbDJrn9JEU2GTqlOgxI0GiKj?=
 =?iso-8859-1?Q?o2AccDARb374m/gqi7H24E/JgFhjPVLOjicPOgHiwIqzk9clwyvHnjlq2n?=
 =?iso-8859-1?Q?gpLJe6L8muCpoJ4ZTrhDs1UVlxS+oYVxepBb2ZgQ+cdNfxND8DcwfwGXZN?=
 =?iso-8859-1?Q?IX+j375MuTb3fhgQ6+M+tiyy6Dgz63ELp6lj9XBklEHtaZQzPRpJ/lm2Wq?=
 =?iso-8859-1?Q?WBSwDMVJU7ZmtU8pI+/kb8oqXuttBmX3VMtnP39yT+pEB1e1hHmx50qbyF?=
 =?iso-8859-1?Q?hhiSTGlQ5KrQ1XsFAJ6QjJJBa3FBhGqEAnTv8tD3vn+joqQXbm+82spzss?=
 =?iso-8859-1?Q?1frlXV/46cA/QCicvoIyFS5VEs5VmzSjcyhI24LYwIuTZ2yPSGddzOCUpv?=
 =?iso-8859-1?Q?choZe7a7EHyRoPQTSmuCCDeU9W/2DJxfw4ncT6EmClfu+WHW7cai0CeQLH?=
 =?iso-8859-1?Q?XGcY3X3j/5l8uuhgolXOdVcFRpoJjAOrNQtu+XDSFAGjjJ/ulOHb/RKJeO?=
 =?iso-8859-1?Q?pyFyDa3uf3uX1ThTY8AjWEC9Wbv2Ho2383qSxwo16eJIO3bcqXLsovk5Ob?=
 =?iso-8859-1?Q?AMbdODOjaznyQJF9WD+9X5NWKlmOPLE/5UeIue6Unat1qnj2lpysRhfX9m?=
 =?iso-8859-1?Q?9zeVjYx2wf43lZgMKN1Hay+Iu1F/ZUtxV+g0+CwfZ5ZaF99vLsbfsgx140?=
 =?iso-8859-1?Q?0WscmWAnyrP7/etVOAlj+dbR1UUzHayQhzi6X4LAcVu1sJyQ/+TXjEtv0b?=
 =?iso-8859-1?Q?jbu1L1j3faHcl9OeblPaUXs2qCKSokXGDNJjcjxAyfEDOrZOZFktRyc8j4?=
 =?iso-8859-1?Q?pIzi9swfitYF0VnaL3SDPhMvv4YJKwT8lrL+JfHxBm64+yrTLgQqotUwRB?=
 =?iso-8859-1?Q?A+jhqhv2e4Y69OeL2t7gkMAXdWSuYhLklHAjKaEottjyBDUijY9hz9cWBZ?=
 =?iso-8859-1?Q?2roEHmhsQOgac8gqVfZ0OeLCbMpwSn56a9vdU/GnAoPl8CXC7uqe6zGpr9?=
 =?iso-8859-1?Q?Fg4ltQf6LcRjIjE+Uf8/spSay2ihDH9Q0f1ToWODnmMc6mHyayoqvMFA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c65102-05e6-4fbf-5137-08dbc5fba926
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 23:34:47.0493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lIwd4GdzXWh90W0p4Wc0792UIJ/EmDvDZaXe5Jue0gwbY2qPzXWsYXhLo4/mYOXINgRLGWO/ZFhet4Z5+R0UY/PEJ1HKDw6m5RVMQZ/m5sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5302
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Allow atomic operations in pages for
 Xe2
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

On Thu, Oct 05, 2023 at 07:59:00AM -0700, Matt Roper wrote:
>On Wed, Oct 04, 2023 at 11:29:49PM -0500, Lucas De Marchi wrote:
>> On Wed, Oct 04, 2023 at 02:06:24PM -0700, Jose Souza wrote:
>> > Without this if a atomic operations is executed it causes engine
>> > memory catastrophic error.
>> >
>> > This bit was already being added in the pte_encode_vma() path but not
>> > in the pde_encode_bo() path.
>> >
>> > This fixes at least the 3 failures in piglit sanity and 2 failures in
>> > crucible.
>> >
>> > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_vm.c | 3 +++
>> > 1 file changed, 3 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> > index ea17d026546cd..6be5d92706932 100644
>> > --- a/drivers/gpu/drm/xe/xe_vm.c
>> > +++ b/drivers/gpu/drm/xe/xe_vm.c
>> > @@ -1261,6 +1261,9 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>> > 	pte |= pte_encode_cache(xe, cache);
>> > 	pte |= pte_encode_ps(pt_level);
>> >
>> > +	if (GRAPHICS_VERx100(xe) >= 20)
>> > +		pte |= XE_USM_PPGTT_PTE_AE;
>>
>> I think there's a clash with doing this here and doing it where it was
>> done in commit 6193a2ba4704 ("drm/xe: set PTE_AE for all platforms supporting it")
>>
>> There it's adding the flag  in the gpuva.flags which is later added to
>> the pte. However, in xe_pt_stage_bind() that checks for XE_VMA_ATOMIC_PTE_BIT
>> is only inside doing that for devmem. I was thinking that I might had screwed it
>> with my recent refactors, but looking at the log it was always like
>> that and the fix in the commit above didn't fix it for *all* the
>> platforms.
>>
>> Does it fix it if you simply change that function to consider system
>> memory? Otherwise we should probably change it only in the pte encode
>> instead of doing it in both places.
>
>If we set this bit on system memory aren't we going to stop getting page
>faults?  My understanding was that we need to migrate from smem->vram
>before performing GPU atomic operations, which is why we leave that bit
>clear on sram pages today.

I don't see a limitation on it being devmem only. See bspec 68148,
"Atomic Destination Memory" - Destination memory can be Shared Local
Memory (SLM), local device memory, a remote device memory or System
memory.

Looking at previous implementations I'm not sure the handling for "this
only works in devmem" was correct and I'd think it's because the feature
started with PVC.

Lucas De Marchi
