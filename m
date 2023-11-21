Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A779CC61D94
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 13:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E77410E4AC;
	Tue, 21 Nov 2023 13:46:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE9710E4AC
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 13:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700574416; x=1732110416;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xFp5TD8UF2/QQBp5cUZ3cr03GnQCJdX2MOgD1yzXKro=;
 b=XpUFQYPEIZNPn7MdGfLiRaF8XpAYMLpWijaFuSGaX3pl/AzdxXkr//h9
 mGvx/N9pcEZcSuJOAu55mIyoScZwXacCtfqgsWstikNz+vLa2+BYAnKfS
 bGrJ3WHl0Vc8AlFvuR/2cU8KlM74fo1NlGHhh99PyU9iEzB0QWChPa2Es
 HTez+LgTBi9B6H3PFSkifzKNPBAzlA3BuSKVHi+5B2zekSkXurW5bTFV1
 wF+iwZldRHaiEz9uLDKN+LVPCnh+0H4Ht6MzgJBs3MW7R9mEInC2mSsa3
 rQaZS+JfZgK421zflWjrf3lwLvJiP/f3UaFQv6ljiZlga/iv4RbVCsvRH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="388988373"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="388988373"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 05:42:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="884216811"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="884216811"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2023 05:42:26 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 05:42:25 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 21 Nov 2023 05:42:25 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 21 Nov 2023 05:42:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWiuXd6uWxmi+m3iyqaRQYgVR/HGa+AYahjTSorDSiJ4mDtTuPLI+OLMXINpELGlIeMy0amgGokz8ENJn5kAghgbnBentTKQsgJJdnOStFYeOMqMJtt9aYIPTqcxV+VFB4aH7WEcWP+EZk+4T6ybZTRGwyZ2aVcKqJnGrrn64+c5M2WljAigLZRS1RQDFfArCIh988MevFjpQQmhWsRomzgEwytG07SK1pZITvU16bscYbgLhZH8LunEkdBruX+NUPlFbRbIcivJcajVmvjPYFUZklKzzQn+7ZgoXc2pdkKsxzb4whQbAr242f7L3L+ddMivwP+Y0L6ie+61ocDFPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ye3lowPBxEKr6PFGCS5CysN4gtb4klae//BRW+Gc5O4=;
 b=Lpu+ussDhfX0ZRDxU7E7RVbYaSqVatp5jKNKw+hQOzUUmOvBWC/HYCtD9l73csrUeYv8UTvWMRJbo1IRaZsGtknHIwQkIX3cZxBpMYAkN/beezANXNuVwOvHVWJutMIuzGuuN+st1z8h7Qjq7cyG1Ptbncrn6Z68weQHk7SyL03tIMvAjwpBXLIzhpWEzjI41z/9JbnfYwrJT5gOkTFhjr3YFnpq5xJ6tNl5vx2jEeLUvkscI2atzP5SDrblfejRsDEu7Raf6FEd4btdqBmaUBiUbMiLDzla5Qa88AJY+fOLCVZseff/P+DAfNLAB6oUMD8WlvA82xXi7O9GcW7t2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA2PR11MB5195.namprd11.prod.outlook.com (2603:10b6:806:11a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Tue, 21 Nov
 2023 13:42:23 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 13:42:22 +0000
Date: Tue, 21 Nov 2023 14:42:20 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <tgdyqlupjtophwtiqmol6ioba67md7z4amracowlspp6lsbgpt@zln7qb2zue5e>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-19-michal.winiarski@intel.com>
 <6tspngnkj5qz7isixbeeb3a4chshdxb3may2lhvpkq4qqwusu4@yfxff2bq4yia>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6tspngnkj5qz7isixbeeb3a4chshdxb3may2lhvpkq4qqwusu4@yfxff2bq4yia>
X-ClientProxiedBy: WA2P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA2PR11MB5195:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e263e93-5747-4601-ab02-08dbea97b0a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nda3zf2/IxUX7RO7hOEcHtusDv40uiwxAbnmfW2+7e8xfPkAwi92zlNrVm7rl25/0ZauTX8LOTT0faTQKBChrylMye6EuZd18vee+waPnKNd37t3Tniw8fJOFcE1VGEsu44jAt7nX+KzHfpoo7O1rWHZph1msmBRkjSDQEOvjSrM2kSQQmEHhmoTUOLgemfyZ4NRUZKrk3Z/W4PhpJWXM8TcrXqkD7tuTzIzXh5r0VwBkRGNdqvV4cPKGkObzuTOOZWGxzDdSYNj4umfcCOAtTZxFZgzBLJ+Dwi+AI0edOD69CFSnLyoENdbP/zLzMQeoHar+G5HtD/LWycVoDZsBEJf8zvpd56rKLM8Y6wtOyIoheWQcjKDqwN3yheRPGSWS2ontr7YeoMRPYTvGsVMVTzvlqGXwikLEo0xIopz5iYV8p49etiKQbFAORuGg/S9M/qUZhkDnVWLrcimGsskuF+aZHsasEmlyzNyvEiT8kEMjybA5EttIJlGiLTRbB1DYWAvjEJ9/i1AnY8qf0WjIDgyVtGNITrjd+QcXW1aJTVEvcIsN7/L84I6SmEPDTn2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(366004)(136003)(376002)(346002)(39860400002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(6506007)(107886003)(26005)(9686003)(6512007)(6636002)(316002)(6486002)(478600001)(83380400001)(82960400001)(66946007)(66556008)(66476007)(8936002)(6862004)(4326008)(8676002)(86362001)(38100700002)(5660300002)(2906002)(41300700001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkQraGNhNWo0T1h0dyswZjVVVWlabkgwcWJrZGZBMkd6cGd0cTRtREx0TGlG?=
 =?utf-8?B?Qmp2S2plcDFoRjFqaWFaLzdxbzlYb0VYV2hXL1UxOFpBYjRjSG9qM1R6MUdp?=
 =?utf-8?B?d2hkbzVMWkxPUEo1NjlqMnd6Z3JvWTlyeTN1MkVaOGRnZUZMeEhiT2MyNjU3?=
 =?utf-8?B?K3Z6NWFqVXNnVzg0dVR6UGh2R1lDWHBOZmdGRURIMTFZMkw2akhPWHc2eUxT?=
 =?utf-8?B?bVZxT0FkRDdIVEhrS1ZnSWd4eFc5SWpLVVdzZjVqYWxXOXpraXpRSmdMd0lR?=
 =?utf-8?B?dC95V2l6a1kvQkNYbGtKbjdTN1BlR3cvQTIrZTF2aG1LV2NaNnRJUlhUTXh6?=
 =?utf-8?B?MUJuRXN2SnNIUC9aUFFjU01zdUNiY2VTVlRXNkt2di84dXlBd0E0MVoyMWpk?=
 =?utf-8?B?dU95bkwzMmZDcWU4V3pHcDc2Tlh4dHNUMERqTm5QaVovZkNSTGVDK0dBWVZ5?=
 =?utf-8?B?cEsyOVIrYmE0V0ozVU1VZGREQnhTYzNxa3V4ZFpDdXZXU0VDZHliSVNnZSsr?=
 =?utf-8?B?YUw5bWtUdHRjcUw5TUpFeXBnTmo4RXBJZEhCc25DSitNQXRPMktoLzFDcTdZ?=
 =?utf-8?B?ZkNPTW1PSGJnTm5HOE16cy9BcHhHT1NXanB0NXF4VmpMNTJUYlJYWm9hTlJq?=
 =?utf-8?B?N0x0bThlVHpRS2dGbTdHclJ4OTU4MWNhSVdwelgyZHlBYjJKaDE1eUduRXpk?=
 =?utf-8?B?aGR1SXA3aFNGSmdieVNYVXZpeXRCNE9KWnArYzlGd3ZkUlJFcUsrbVkzdDBP?=
 =?utf-8?B?ZkFIVmIxdmt6dFAycm5wYW0zWHpoNU9kK3ErZ01ocnZKckp3dGkzcGcrc3Vl?=
 =?utf-8?B?S0J0bmgzVDI2UGhqVlhvWUt0bDNMUzBKV0JHU0R0enhEMDVZUVdndUszUnJm?=
 =?utf-8?B?MlpJZkhVUG50TGViRlBVMHpkRlh1U1Z0SGdjc3VFaXVFaEFmU2JKMGJvSWVY?=
 =?utf-8?B?UjQ1Y1BwdENiYkRUZFBRQVdmN2dUN2tnSXJBbnZpTVZnV1pydXcrZXN6MTdl?=
 =?utf-8?B?TmUyR2xtTHNHSjVqNkxHV0lXWjR3QTM3SVFRU1lTaWxvRERaK1UyaTJYSUtY?=
 =?utf-8?B?ZERub2hlOUdGNnRoQllnc3pWUXRVbEIrbUQzczJKQk54djdEUHFKL3FGUFd3?=
 =?utf-8?B?SzkyU0hqZ0dIRGRtSXZxeWtFVFNkbFZpT3dUUDRNNkx2bU5YUmErOUVVY2xP?=
 =?utf-8?B?UVFXTTFOS0ZZREQxZ2FBNno5cWNSaGQ0Wm9KczJGSFlidmhROXFTWm5CeFNk?=
 =?utf-8?B?WUdqb3FURitOcEpySnFQT0ZobWpqTHVDa0ZKa3R5dGRYd0JPekZBN1haN3Zo?=
 =?utf-8?B?TlpxQWpaMlhoMDBHT3RYNWE3R1ZpdTdRK2FWbC9lNkZEN3FoWkhNTzRLYXNa?=
 =?utf-8?B?NVlJN2s3TWU4TUttRTJCdUEzVTVhREhiZ1grQmNkMi9qUFBpNW9ERGJIMjdW?=
 =?utf-8?B?QzlkMkVVdXEvdXovekJlak5peGZkQXhFU3dvN0xnQ21SM3JHQkxVa0o1QXZS?=
 =?utf-8?B?WFAxQ3c1U3FRVS9pRWpEV2VqdWlwUDZMQU5IS2dHemcwMVdDTC9uOGJhMkw3?=
 =?utf-8?B?ZUptQmlWVUViYlBHZUdKUzBZcEI3dHMydFJTTmQ5NTl4ajlvV0VFZW5vVjgr?=
 =?utf-8?B?VXJTYjNSYjdYbEhWUFFFeDM1dk83NmhuUmxLUTB2N2FtdWIrb3RIOHRPSFhL?=
 =?utf-8?B?bDJCL0FySE94aVl2MlRuVkpxZ29ZRnRzcHc3UHRPbWdHd0gxcEtKSXUvMHpL?=
 =?utf-8?B?Q0w2Tk1qaDF6TGZoRk5Yem9Qbk5rbWp6NXVHcHVnUlpRTTFMZ0FaM0l2UFZC?=
 =?utf-8?B?SXU1NUE3MG9NTHVvdUxnUU1uMk1nTUo3bDFnTFU0d0xxYlhENzkwUC9LUGxX?=
 =?utf-8?B?bTNrS1R2emhrUmNJbG5KYXNjMWRJaUlld3JLZzN5bUJYTGgzYmt1OFd3ekdC?=
 =?utf-8?B?ZVgzUUZnRnNoVVhXQy95eFdlMFZOVGJhN3orM3dyMTZTU3FlN1NhTWNoT2Qv?=
 =?utf-8?B?UDltUFVFWEEyc3owK2ZJbU5nYUI5S2x6U3lCZFFFNWVheEFLekNxN1pnclpw?=
 =?utf-8?B?WVNHV0plcDROZmZQTnhSWTlXNG90alAzSGlXRnIvRHYxcWhBMHU4a3Z0Vlp5?=
 =?utf-8?B?NEVoRVlyR0FhY3BMWllUc3lXYktOenZTVml2bUZ6K2JsTCtyTVFoaGdrNnVr?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e263e93-5747-4601-ab02-08dbea97b0a0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 13:42:22.8519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u7Rh1jzP+dq1o7GSFsIjgEF1wACe0pYnqRQFdONS6KyrkH7/sINOzfvQhdzcdN9itmLv1aO5tpvVpclSs+DTIBS5M1TjUaEqNjgWa5Bpc6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5195
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 18/20] drm/xe/guc: Allocate GuC data
 structures in system memory for initial load
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Nov 20, 2023 at 02:20:22PM -0600, Lucas De Marchi wrote:
> On Tue, Nov 14, 2023 at 02:02:29PM +0100, Michał Winiarski wrote:
> > GuC load will need to happen at an earlier point in probe, where local
> > memory is not yet available. Use system memory for GuC data structures
> > used for initial "hwconfig" load, and realloc at a later,
> > "post-hwconfig" load, when local memory is available.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_guc.c     | 45 +++++++++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_guc_ads.c |  2 +-
> > drivers/gpu/drm/xe/xe_guc_ct.c  |  2 +-
> > drivers/gpu/drm/xe/xe_guc_log.c |  2 +-
> > 4 files changed, 48 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index d1181ddf4bdae..3f430d5bc1051 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -251,6 +251,45 @@ static void guc_fini(struct drm_device *drm, void *arg)
> > 	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
> > }
> > 
> > +static int __guc_bo_reinit(struct xe_guc *guc, struct xe_bo **src)
> > +{
> > +	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
> > +	struct xe_device *xe = guc_to_xe(guc);
> > +	struct xe_bo *bo;
> > +
> > +	bo = xe_bo_create_from_data(xe, tile, &(*src)->vmap.vaddr, (*src)->size, ttm_bo_type_kernel,
> 
> in general we should not access a iosys_map like that. Maybe add an
> assert above this line:
> 
> 	xe_assert(xe, !(*src)->vmap.is_iomem);

Makes sense - I'll add the assert.

> 
> > +				    XE_BO_CREATE_VRAM_IF_DGFX(tile));
> 

> humn... maybe we are missing a XE_BO_CREATE_VRAM(tile)?

It's only called for "IS_DGFX", so I think we're fine for now.

Thanks,
-Michał

> 
> Lucas De Marchi
> 
> > +	if (IS_ERR(bo))
> > +		return PTR_ERR(bo);
> > +
> > +	xchg(src, bo);
> > +	xe_bo_unpin_map_no_vm(bo);
> > +
> > +	return 0;
> > +}
> > +
> > +static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
> > +{
> > +	int ret;
> > +
> > +	if (!IS_DGFX(guc_to_xe(guc)))
> > +		return 0;
> > +
> > +	ret = __guc_bo_reinit(guc, &guc->log.bo);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = __guc_bo_reinit(guc, &guc->ads.bo);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = __guc_bo_reinit(guc, &guc->ct.bo);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > int xe_guc_init(struct xe_guc *guc)
> > {
> > 	struct xe_device *xe = guc_to_xe(guc);
> > @@ -309,6 +348,12 @@ int xe_guc_init(struct xe_guc *guc)
> >  */
> > int xe_guc_init_post_hwconfig(struct xe_guc *guc)
> > {
> > +	int ret;
> > +
> > +	ret = xe_guc_realloc_post_hwconfig(guc);
> > +	if (ret)
> > +		return ret;
> > +
> > 	guc_init_params_post_hwconfig(guc);
> > 
> > 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > index 88789826e7817..88514d09303d0 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -282,7 +282,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
> > 	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_ads_size(ads) +
> > 				  MAX_GOLDEN_LRC_SIZE,
> > 				  ttm_bo_type_kernel,
> > -				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > +				  XE_BO_CREATE_SYSTEM_BIT |
> > 				  XE_BO_CREATE_GGTT_BIT);
> > 	if (IS_ERR(bo))
> > 		return PTR_ERR(bo);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index a84e111bb36ad..8f190cc0e5527 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -148,7 +148,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> > 
> > 	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_ct_size(),
> > 				  ttm_bo_type_kernel,
> > -				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > +				  XE_BO_CREATE_SYSTEM_BIT |
> > 				  XE_BO_CREATE_GGTT_BIT);
> > 	if (IS_ERR(bo))
> > 		return PTR_ERR(bo);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> > index 45c60a9c631c3..6334311a56e63 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_log.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> > @@ -93,7 +93,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
> > 
> > 	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_log_size(),
> > 				  ttm_bo_type_kernel,
> > -				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > +				  XE_BO_CREATE_SYSTEM_BIT |
> > 				  XE_BO_CREATE_GGTT_BIT);
> > 	if (IS_ERR(bo))
> > 		return PTR_ERR(bo);
> > -- 
> > 2.42.1
> > 
