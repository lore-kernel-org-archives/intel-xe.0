Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815A6C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 20:33:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A7E10E674;
	Wed, 29 Nov 2023 20:33:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4E210E674
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 20:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701289986; x=1732825986;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MrTxdT631c3FuRN8S35Yxp4N4NUy4SfxnjCMj6QECVk=;
 b=I4+ZX/L+TbWmWlX44hf49ebUXhHPLWoJcjbfgpx95fXlJFR3LZz2H/kh
 ESG1QezMnNAOuKj4qdlgPspkK5PqRNZ2ayD4fLdYF8Jp6qUGmwdOiGWvB
 nNzdtKzOBnhZhGI6KspUjUvmQVGuYSnmqScOP8xag8mXmpRo7cKchamiC
 wSi2sv6JvhAKSOBsVv2KSohbuYJp/n5iwpjyPpCf6b8FboTtewrWujgJw
 tkn442SiO7eoJZEFFEe+ieUtl88JU+9t0hZk+8OfNMLjSE09LJCSbbsVi
 ZQzXZmeNPVLgGOSQ/vJWmkuS+hKgG5tny5Xpa4OX2DDTmsx7Bduu+Ou47 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="6493019"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="6493019"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 12:33:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="886990981"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="886990981"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 12:33:05 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 12:33:04 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 12:33:04 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 12:33:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lf2ajCuFeMVNz+TBVhBy+PZ65sIZPjICZ61KM0UeEjPuTRxbNt/X+AI2obCjTZs5WAtdDs0hyL31gsrwY0dzFo/aE+D40nzLBXo5gUm4B5ZCBOUTIaWE7QTFU1bD/ig0DwTs29De5k3tCa0p7Axnx2baHR99OpJfvxDuM8nWISSxNbN4t/YH8WIB/NBR0U2GcK00WBwqgj2VULK2vpittuPboJysFo2dKjRAkT+tm0Mq+SHSmRokUZn4lINGpB1xd9lCxDtaUYajP+VrNIn2eyvXRw0BUjgYakcnWJYBR+7SZu85O73ZkpBKFK5oMnpMzUNnHGmHl7k00k29vBhaFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xryMW056ew/E8cuLx4Q2shFL3sFMR6OJfcIe4CxrW08=;
 b=OFC3eFAEQsxCdL1q9gu8wb4V649s7r2Qbi2Xv8lzR4iG4bENp6HqhfYSPRrd1msPtNnJqwqNmdgVBf7EvCUQN3dZ4DZoRWMBxUx1FhQ7VakE300rvXs8UcWmSzJ8sV8zHvkRjdb4mEU02fO3dfX9qCFBejBp3irknwf6OaReXFfazRehtsuBoeKtVOC8+abSeZsPQ2oOk5CmoC7q60xXzzLk4urAJaNAMyJbB8HTMngRMn/xMi9PK1xiq5Tc51ibhNZ8XRO2Z8LBN9jpmaAMZtCzfyElB+kkL9HcWSxHOp2y+fyZ8Wq5sYXcpThZlrjqqr/ONR5SzoYoEKFJcyX3iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW4PR11MB7161.namprd11.prod.outlook.com (2603:10b6:303:212::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.23; Wed, 29 Nov 2023 20:33:01 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 20:33:01 +0000
Date: Wed, 29 Nov 2023 21:32:58 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <iqofdf7eiriphxctasinqz5kcbysunhfo2ccilleqslntokuzh@o5u6mkaap7pv>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
 <20231129011624.836843-15-michal.winiarski@intel.com>
 <e74cb84b-4ecf-45fd-b730-e0009ec76351@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e74cb84b-4ecf-45fd-b730-e0009ec76351@intel.com>
X-ClientProxiedBy: WA1P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::27) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW4PR11MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: 278e359f-2d07-400d-ae33-08dbf11a610d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xiEkXB/liyBEmSTlgZJqXapUQSvE0gz9KsPm1qsclRbJjaMtYVpOAGsCat3/2m0Zuvbnp/QqoTjFQ1I1IWFT9es4kbny8b3XU94jBY7cczGoR5PFnoBfiY18L1Xq3EPNB2KiguQbnd0qeB5abMMzWXXzKk+Hjn95iENInkPeo5P3uuJr7xGST0uW3FRfxMVG7nK2SKUyZY3lbFNieXHhWycXLyNYvs1/XzrRq6q0n34Rs6R2PAXK9zrUsRZ4oPQvCQ+OnlNLBbYnlyfZdgWGNSkMMD+ecaqHjVOsivZeOzG3DzD/82m2s3cEWVLlaPGfDSW21azW85n1qlMk26IcZ8mQRYje3+h/QRyo+VV/dLkttR3av2Ux9Qy7tNMf7G74r3bnX+wf5JW5OqIUn6fF892qHFNtWWeZ/LDGvBS7BDP2BX6P4Dojc+Gx853sK8LnhJmfRtkOzDO8SRLeHdtFMx61PS2n15rvhZT5lFbhobJcqIjRZiNHHYs65Z+Fb+9OUOCwndtcbBgDtgEX3zL7ERMrECsiLzaYvdY64NfJEUNG3YzvvVS6FVuw5Ld8620LD0DS1zazEBRSoyj+G6uDTb7+CEeLVtl8kXfxrS0wbadPL6qaek/ygg8bpKlyBSADckPTBZvrrb8/WlZjKG4TIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(346002)(366004)(39860400002)(376002)(396003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(33716001)(82960400001)(86362001)(202311291699003)(30864003)(478600001)(2906002)(6666004)(6486002)(5660300002)(41300700001)(6512007)(53546011)(6506007)(26005)(107886003)(38100700002)(316002)(6636002)(8936002)(8676002)(9686003)(6862004)(4326008)(66476007)(66556008)(66946007)(54906003)(83380400001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3VMZmFjZlNnWEMzV0tFZVA3VVJ4NTFpaTBzcVMwQzJrWXlBbEFydUxhdUpk?=
 =?utf-8?B?UE1Va0t2ZGRINzlLZzlvY0FOaUNIT1dMYTJBTnkxR2xXL2xjWURDcEJhTkpU?=
 =?utf-8?B?STZTcGcrRFNZZkU2M0ZHeVVLMGJodkNkVnNPQTJYcW1Xb1Zlc2V4c0NCSmE5?=
 =?utf-8?B?SXZCaTJjSVJ2YVlXNjJqeHJhMXRod29raEx3U2J4anM5Q2pJVXg3S2ZrejZh?=
 =?utf-8?B?dW5wWWswT1JUSW1VTWFEMnp3d25wMDh2eHdHNlgzOWpvdVlYN2llbkRwNWlY?=
 =?utf-8?B?SWd2OXBHYkhlakVCVUhwY0s1YlJxb2doa3psbzU2QThhOCsrcVRJd281OUkw?=
 =?utf-8?B?UlJiSnZOdElCeG5ZNTlaSlFmbjFhMDg3OGdMOG0yRXYzbWpyb1pRVUdSTThW?=
 =?utf-8?B?VFhETnJLRVp2OVVJeCtkMXZzZTJDUFhidmpDUFBtVUFKR2Q1RHhJZTkxWHYv?=
 =?utf-8?B?L1JjMWFUVXJhOGlrWmIrazg4NWFrQzhjTisrSnFzTjNxNWdwUjIvcC9Uc3hj?=
 =?utf-8?B?MmZCR3I1TzRYWmRSWllMczBaUEhRTzFkOG92OWNEayt0YUpzMVBGSWRUcktJ?=
 =?utf-8?B?QW9ZL1VieDdWbXI0bXNhWlBuT3lkK2cwYjdpUEdIeUVCanZvZXYxbVdCeVVr?=
 =?utf-8?B?eXBmQlVvenhQZEM3aHdSK25OL3NkRS9iRE15UWU0RnRQcE5rdWdjQTRKNVNt?=
 =?utf-8?B?SEQxVURUSHF4MnVGanFrdjdvVkpNWnRzdW1DWmtHN0FmYVJrOFNlbjFVNGJa?=
 =?utf-8?B?NFJWanU4aTVKSjdINko0Myt5UjJEUkRSRjEyTDU2RmhydUVhOXI3dEdiVlVl?=
 =?utf-8?B?bU4zTm5IOC9tbGs3UnA4OG9yKzMxTi9TMGZGd09IWFllQUZFTEcwWk9wbzBQ?=
 =?utf-8?B?UzhUSDVJK1NISzBpdTRXYnJHRTZhc05tbTVaY1I1N3dnVzFSZG5CTldiZVBW?=
 =?utf-8?B?NVFEM0ZUOStYRXpRREd3RjR3bE0wbHRKRlNxMVNmRS9zS2ZNS1NGbTFvTDc3?=
 =?utf-8?B?STFZa1g0dlI0VVkrWWJnazc0bHAzTFNOTGJOV3k1Ykl0K29ZR01uNXpERHdv?=
 =?utf-8?B?bm1YeEZnWDBkdFJxR3NLejE1bWVVZ1o0dmhHMG4yWEhRbENSL1hFRnpVdjlx?=
 =?utf-8?B?clRpY3JhRkNOZGVybDZnc09tdSsyQWY0clZyc2EzaXJkK2JLdTZhV0hhTVdk?=
 =?utf-8?B?VE1VMzFOcnVmMGl2SnVNN3NRRDF1ZzlCN010OHJnM29wSkFaVHp5RGZHdEd3?=
 =?utf-8?B?OStrTGsyOTVndGtVc3AyQjB6RmxVb05YRUJqZHAvR2FudS9tN2x0NWZhVGVw?=
 =?utf-8?B?Qm9saEp2bXhFcm9EQkJpSjhNeC8xMVBneVN3aHF6cWVVL2UrZzd5S3N1d1Jj?=
 =?utf-8?B?aHFCTXM1b1BWY2hRdGlSaFdvZ0liSlpVM29BZTd4d2FqSzJlQzA2V2V3TzQv?=
 =?utf-8?B?Z2p0M0wweGdlWTg1L1JSU1o3WFk5L0RRK3ZpSzZXcHd6bHBsdFNRaW00eDJx?=
 =?utf-8?B?SUhKUW56ZGxNQU5zMjg0MUIvaU93V0l1cmlieWEwRzdNYlUwWjJQQnA0MXlE?=
 =?utf-8?B?bWhWamoxZjdQVm1NdVdEcUtGSHBwVHBvMGtGbCtqTDVhSDZpa0kyS3phMU9s?=
 =?utf-8?B?bjgvNnlUb2UyT0wxYmJ6TUlLNW5pNnE2TzU2NmczTXhuYkQvY1JwTlpIM1pk?=
 =?utf-8?B?VlNxbGRXRnEzK3hEMTZmbUNWazhaWnRBM0tETTVWTFR0Nml1NnZPRURoZHpO?=
 =?utf-8?B?M0pFVUE1b1JDUi9vR09jMCthVklXVEhXSWhIRTFJd0paVDZnY09GTHl2b05u?=
 =?utf-8?B?U3lSdW4wOWtCdEpUMmVRSTlaQ1dNdTdONXBvRWY0WUYyZlQ0elU4cWRaU0xa?=
 =?utf-8?B?Q0ZSOEJXVTNzcGpaeVlaT0ZxVU9QNUgydjY4VVppM3lWeXBhNHgzNTlDZDJk?=
 =?utf-8?B?WFlialFlZEVGaGtjTXRwZ1pibm9UaTNTREV5VExGc0RiOUVkSGJ4QVZqbEFs?=
 =?utf-8?B?M2hXM2EyVjEyRkFmY25lR0NKTGk0Y1BiQVpFd3EyT1oyQlFNWTNjYndEZzd2?=
 =?utf-8?B?WVhsNWJLYnN4L3lIaWdSdlZjVDFYWnZGRCt3Qm95d0ZsQmpqbUtqNlhJNTU4?=
 =?utf-8?B?V0tGRVR3V2RWc3FET2g5K29naTV2VG1XbFB1YjhxMUVhSWFtdTBxV3RzL3RS?=
 =?utf-8?B?cFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 278e359f-2d07-400d-ae33-08dbf11a610d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 20:33:01.0641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VaEiV3MMBesOaI5WMa6pMKN8T3flByHSrvKjxKq1OQ+z1xlE9RMa+YwE/TR2gJA9198bfO2ATzenEv8Imbxxempt3xqB1sYeBlvwfVO92wU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7161
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 14/22] drm/xe: Add a helper for DRM
 device-lifetime BO create
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 10:38:44AM +0100, Michal Wajdeczko wrote:
> 
> 
> On 29.11.2023 02:16, Michał Winiarski wrote:
> > A helper for managed BO allocations makes it possible to remove specific
> > "fini" actions and will simplify the following patches adding ability to
> > execute a release action for specific BO directly.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c           | 33 ++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_bo.h           |  4 ++++
> >  drivers/gpu/drm/xe/xe_ggtt.c         |  6 +----
> >  drivers/gpu/drm/xe/xe_guc_ads.c      | 20 +++--------------
> >  drivers/gpu/drm/xe/xe_guc_ct.c       |  8 +++----
> >  drivers/gpu/drm/xe/xe_guc_hwconfig.c | 18 +++------------
> >  drivers/gpu/drm/xe/xe_guc_log.c      | 19 +++-------------
> >  drivers/gpu/drm/xe/xe_guc_pc.c       |  9 +++-----
> >  drivers/gpu/drm/xe/xe_hw_engine.c    |  8 +++----
> >  drivers/gpu/drm/xe/xe_uc_fw.c        |  9 ++++----
> >  10 files changed, 60 insertions(+), 74 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index c5aa01c0861c7..7f5b616a7bbeb 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -9,6 +9,7 @@
> >  
> >  #include <drm/drm_drv.h>
> >  #include <drm/drm_gem_ttm_helper.h>
> > +#include <drm/drm_managed.h>
> >  #include <drm/ttm/ttm_device.h>
> >  #include <drm/ttm/ttm_placement.h>
> >  #include <drm/ttm/ttm_tt.h>
> > @@ -1493,6 +1494,38 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
> >  	return bo;
> >  }
> >  
> > +static void __xe_bo_release(struct drm_device *drm, void *arg)
> 
> nit: __release_xe_bo() ? this is a drm action, not a xe_bo function

Xe doesn't follow this convention for release actions passed to
drmm_add_action (it's usually xe_*).

> 
> > +{
> > +	xe_bo_unpin_map_no_vm(arg);
> > +}
> > +
> > +struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
> > +					   size_t size, u32 flags)
> > +{
> > +	struct xe_bo *bo;
> > +	int ret;
> > +
> > +	bo = xe_bo_create_pin_map(xe, tile, NULL, size, ttm_bo_type_kernel, flags);
> > +	if (IS_ERR(bo))
> > +		return bo;
> > +
> > +	ret = drmm_add_action_or_reset(&xe->drm, __xe_bo_release, bo);
> > +	if (ret)
> > +		return ERR_PTR(ret);
> > +
> > +	return bo;
> > +}
> > +
> > +struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
> > +					     const void *data, size_t size, u32 flags)
> > +{
> > +	struct xe_bo *bo = xe_managed_bo_create_pin_map(xe, tile, size, flags);
> > +
> > +	xe_map_memcpy_to(xe, &bo->vmap, 0, data, size);
> 
> will crash if "bo" is a ERR_PTR

Yup, I'll add a check.

> 
> > +
> > +	return bo;
> > +}
> > +
> >  /*
> >   * XXX: This is in the VM bind data path, likely should calculate this once and
> >   * store, with a recalculation if the BO is moved.
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index 9f373f6d25f22..2cf32713bde9e 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -109,6 +109,10 @@ struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile
> >  struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
> >  				     const void *data, size_t size,
> >  				     enum ttm_bo_type type, u32 flags);
> > +struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
> > +					   size_t size, u32 flags);
> > +struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
> > +					     const void *data, size_t size, u32 flags);
> 
> nit: isn't "xe_device *xe" redundant if we also pass a "xe_tile *tile" ?

It is, but it is also redundant for all of the non-managed variants of
this function, so I would prefer to keep it consistent in this series.

Thanks,
-Michał

> 
> >  
> >  int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
> >  			      u32 bo_flags);
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > index fab3cc04882da..8dc783e9120d2 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -108,7 +108,6 @@ static void ggtt_fini(struct drm_device *drm, void *arg)
> >  {
> >  	struct xe_ggtt *ggtt = arg;
> >  
> > -	xe_bo_unpin_map_no_vm(ggtt->scratch);
> >  	ggtt->scratch = NULL;
> >  }
> >  
> > @@ -225,10 +224,7 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
> >  	else
> >  		flags |= XE_BO_CREATE_VRAM_IF_DGFX(ggtt->tile);
> >  
> > -	ggtt->scratch = xe_bo_create_pin_map(xe, ggtt->tile, NULL, XE_PAGE_SIZE,
> > -					     ttm_bo_type_kernel,
> > -					     flags);
> > -
> > +	ggtt->scratch = xe_managed_bo_create_pin_map(xe, ggtt->tile, XE_PAGE_SIZE, flags);
> >  	if (IS_ERR(ggtt->scratch)) {
> >  		err = PTR_ERR(ggtt->scratch);
> >  		goto err;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > index 88789826e7817..2f5ff090aa6bd 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -202,13 +202,6 @@ static size_t guc_ads_size(struct xe_guc_ads *ads)
> >  		guc_ads_private_data_size(ads);
> >  }
> >  
> > -static void guc_ads_fini(struct drm_device *drm, void *arg)
> > -{
> > -	struct xe_guc_ads *ads = arg;
> > -
> > -	xe_bo_unpin_map_no_vm(ads->bo);
> > -}
> > -
> >  static bool needs_wa_1607983814(struct xe_device *xe)
> >  {
> >  	return GRAPHICS_VERx100(xe) < 1250;
> > @@ -274,25 +267,18 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
> >  	struct xe_gt *gt = ads_to_gt(ads);
> >  	struct xe_tile *tile = gt_to_tile(gt);
> >  	struct xe_bo *bo;
> > -	int err;
> >  
> >  	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
> >  	ads->regset_size = calculate_regset_size(gt);
> >  
> > -	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_ads_size(ads) +
> > -				  MAX_GOLDEN_LRC_SIZE,
> > -				  ttm_bo_type_kernel,
> > -				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > -				  XE_BO_CREATE_GGTT_BIT);
> > +	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
> > +					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > +					  XE_BO_CREATE_GGTT_BIT);
> >  	if (IS_ERR(bo))
> >  		return PTR_ERR(bo);
> >  
> >  	ads->bo = bo;
> >  
> > -	err = drmm_add_action_or_reset(&xe->drm, guc_ads_fini, ads);
> > -	if (err)
> > -		return err;
> > -
> >  	return 0;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index c44e750746958..93c886ef6fdb4 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -112,7 +112,6 @@ static void guc_ct_fini(struct drm_device *drm, void *arg)
> >  	struct xe_guc_ct *ct = arg;
> >  
> >  	xa_destroy(&ct->fence_lookup);
> > -	xe_bo_unpin_map_no_vm(ct->bo);
> >  }
> >  
> >  static void g2h_worker_func(struct work_struct *w);
> > @@ -146,10 +145,9 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> >  
> >  	primelockdep(ct);
> >  
> > -	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_ct_size(),
> > -				  ttm_bo_type_kernel,
> > -				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > -				  XE_BO_CREATE_GGTT_BIT);
> > +	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
> > +					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > +					  XE_BO_CREATE_GGTT_BIT);
> >  	if (IS_ERR(bo))
> >  		return PTR_ERR(bo);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > index 57d325ec8ce32..8e3db5d7192c3 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > @@ -47,13 +47,6 @@ static int guc_hwconfig_copy(struct xe_guc *guc)
> >  	return 0;
> >  }
> >  
> > -static void guc_hwconfig_fini(struct drm_device *drm, void *arg)
> > -{
> > -	struct xe_guc *guc = arg;
> > -
> > -	xe_bo_unpin_map_no_vm(guc->hwconfig.bo);
> > -}
> > -
> >  int xe_guc_hwconfig_init(struct xe_guc *guc)
> >  {
> >  	struct xe_device *xe = guc_to_xe(guc);
> > @@ -83,19 +76,14 @@ int xe_guc_hwconfig_init(struct xe_guc *guc)
> >  	if (!size)
> >  		return -EINVAL;
> >  
> > -	bo = xe_bo_create_pin_map(xe, tile, NULL, PAGE_ALIGN(size),
> > -				  ttm_bo_type_kernel,
> > -				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > -				  XE_BO_CREATE_GGTT_BIT);
> > +	bo = xe_managed_bo_create_pin_map(xe, tile, PAGE_ALIGN(size),
> > +					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > +					  XE_BO_CREATE_GGTT_BIT);
> >  	if (IS_ERR(bo))
> >  		return PTR_ERR(bo);
> >  	guc->hwconfig.bo = bo;
> >  	guc->hwconfig.size = size;
> >  
> > -	err = drmm_add_action_or_reset(&xe->drm, guc_hwconfig_fini, guc);
> > -	if (err)
> > -		return err;
> > -
> >  	return guc_hwconfig_copy(guc);
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> > index 27c3827bfd054..bcd2f4d34081d 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_log.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> > @@ -77,24 +77,15 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
> >  	}
> >  }
> >  
> > -static void guc_log_fini(struct drm_device *drm, void *arg)
> > -{
> > -	struct xe_guc_log *log = arg;
> > -
> > -	xe_bo_unpin_map_no_vm(log->bo);
> > -}
> > -
> >  int xe_guc_log_init(struct xe_guc_log *log)
> >  {
> >  	struct xe_device *xe = log_to_xe(log);
> >  	struct xe_tile *tile = gt_to_tile(log_to_gt(log));
> >  	struct xe_bo *bo;
> > -	int err;
> >  
> > -	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_log_size(),
> > -				  ttm_bo_type_kernel,
> > -				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > -				  XE_BO_CREATE_GGTT_BIT);
> > +	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
> > +					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > +					  XE_BO_CREATE_GGTT_BIT);
> >  	if (IS_ERR(bo))
> >  		return PTR_ERR(bo);
> >  
> > @@ -102,9 +93,5 @@ int xe_guc_log_init(struct xe_guc_log *log)
> >  	log->bo = bo;
> >  	log->level = xe_modparam.guc_log_level;
> >  
> > -	err = drmm_add_action_or_reset(&xe->drm, guc_log_fini, log);
> > -	if (err)
> > -		return err;
> > -
> >  	return 0;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > index e9dd6c3d750bd..f5009a7968afa 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > @@ -936,7 +936,6 @@ void xe_guc_pc_fini(struct xe_guc_pc *pc)
> >  	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
> >  	XE_WARN_ON(xe_guc_pc_stop(pc));
> >  	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
> > -	xe_bo_unpin_map_no_vm(pc->bo);
> >  	mutex_destroy(&pc->freq_lock);
> >  }
> >  
> > @@ -955,11 +954,9 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
> >  
> >  	mutex_init(&pc->freq_lock);
> >  
> > -	bo = xe_bo_create_pin_map(xe, tile, NULL, size,
> > -				  ttm_bo_type_kernel,
> > -				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > -				  XE_BO_CREATE_GGTT_BIT);
> > -
> > +	bo = xe_managed_bo_create_pin_map(xe, tile, size,
> > +					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > +					  XE_BO_CREATE_GGTT_BIT);
> >  	if (IS_ERR(bo))
> >  		return PTR_ERR(bo);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index e831e63c5e485..34990f396a1a8 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -238,8 +238,6 @@ static void hw_engine_fini(struct drm_device *drm, void *arg)
> >  		xe_execlist_port_destroy(hwe->exl_port);
> >  	xe_lrc_finish(&hwe->kernel_lrc);
> >  
> > -	xe_bo_unpin_map_no_vm(hwe->hwsp);
> > -
> >  	hwe->gt = NULL;
> >  }
> >  
> > @@ -427,9 +425,9 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
> >  	xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
> >  	xe_reg_sr_apply_whitelist(hwe);
> >  
> > -	hwe->hwsp = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K, ttm_bo_type_kernel,
> > -					 XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > -					 XE_BO_CREATE_GGTT_BIT);
> > +	hwe->hwsp = xe_managed_bo_create_pin_map(xe, tile, SZ_4K,
> > +						 XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > +						 XE_BO_CREATE_GGTT_BIT);
> >  	if (IS_ERR(hwe->hwsp)) {
> >  		err = PTR_ERR(hwe->hwsp);
> >  		goto err_name;
> > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> > index 25778887d846f..5b86c51941335 100644
> > --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> > +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> > @@ -266,7 +266,6 @@ static void uc_fw_fini(struct drm_device *drm, void *arg)
> >  	if (!xe_uc_fw_is_available(uc_fw))
> >  		return;
> >  
> > -	xe_bo_unpin_map_no_vm(uc_fw->bo);
> >  	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_SELECTED);
> >  }
> >  
> > @@ -575,10 +574,9 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> >  	if (err)
> >  		goto fail;
> >  
> > -	obj = xe_bo_create_from_data(xe, tile, fw->data, fw->size,
> > -				     ttm_bo_type_kernel,
> > -				     XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > -				     XE_BO_CREATE_GGTT_BIT);
> > +	obj = xe_managed_bo_create_from_data(xe, tile, fw->data, fw->size,
> > +					     XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > +					     XE_BO_CREATE_GGTT_BIT);
> >  	if (IS_ERR(obj)) {
> >  		drm_notice(&xe->drm, "%s firmware %s: failed to create / populate bo",
> >  			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
> > @@ -609,6 +607,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> >  		 xe_uc_fw_type_repr(uc_fw->type), XE_UC_FIRMWARE_URL);
> >  
> >  	release_firmware(fw);		/* OK even if fw is NULL */
> > +
> >  	return err;
> >  }
> >  
