Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33FEC61D96
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 13:27:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28EC10E0B0;
	Tue, 21 Nov 2023 13:27:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE94B10E0B0
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 13:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700573273; x=1732109273;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LdqwyKrh2HzZ4EGbFemmUKNrXecThB9Ma6h+GCj9Sgg=;
 b=ZlQ7aAMVrY+M3pUcXR574xo0liQOm34AEqZMVZoM/dD1aTqa0JCgVA6Q
 TspY5GZMjEmrflK+v/hwOBJHMTWfJoeF1XAZW9eioVpDN456I5TbT4D7D
 YjUrDSUqXD4BQtRdZvwnXgoB6PNF39WihggWDxnaI27QapOZz+URBu1AA
 VwcP4yWIXyOO9w+ozm0Pxm0ll3WTViiihx2ukXXGIJz49CMQdNDe8x2Ju
 f4WxRePjYjkps/xELQhlPrVjFLDwT8QyT5HYSxndzGWZe/3LP+3jtrJWq
 z+s/BRTiOElgR4sZ+9fTillfyHE9+PIUsJOR9Pn6wojx9rP8cJ2wktGkq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="5033466"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="5033466"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 05:27:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="795792474"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="795792474"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2023 05:27:52 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 05:27:52 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 05:27:51 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 21 Nov 2023 05:27:51 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 21 Nov 2023 05:27:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j78zdCB1lXx/cuv5Twre9YGASuv0u4Y170yViqF5IunvKG7VRqWrDmeCjxIo8ZRzxU6kSC4EqH3+kzUM7/RyMDt0gdfT/r4SLaNWvke1ThSHJF8dIsU8Pal0TMfHISbKYiWVqrFvNQ9i4dXhL/bxuLJVs7Xe89eFwMxdHFr3+Jne0C3GVZ2nCLxnK0ZNkYZ3Hja+xhGmP2XjoOL9Fjv3u/IXL1jAW7XcLMyz5FjRMtRZoyG5idBdtI5Kn4FR9gbHlF1/oTJfhxgg3wn+rnPgXhwhwtq8n2TJl5yEr098if5rk8nFHSofe4jYRjJzSm76K6bf4Hpo4sFS/u4yi69Jow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uW2NW00c4hewsvegreFK0eAMpzITV2XRsoNh/UKKTKM=;
 b=Aq+B24qtY6VobS9RNmKjCBEO3KdQada5w5M7JeISvFY/UbUZRYdOTiuvmYoLNdqsROMusmSjkf/8h32exrr84n/6zoGvXcXI9n1uPgMcYP6kx8Ny7C6J88VzXJY8i8xQO+keRf4dj8MxCXFZFg+BoUkCVRkwEioUEUc6tXr3SxwkOugiD9JrR2jjHbJRcGEEuaMlcqAzhjedT5msYVQUcknA80TJVU/skg9LrKKyQXCV462g797Wv/dn7EpZG740nlkQR5OiHJYBmRhLrTJBJ+ICR5/brkclbI2zWfZHvDj7H6eLkzfa3B+ZOoVdqv0LQmSkX9i8jFUg4jAm9hcf4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS0PR11MB7877.namprd11.prod.outlook.com (2603:10b6:8:f4::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.27; Tue, 21 Nov 2023 13:27:49 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 13:27:49 +0000
Date: Tue, 21 Nov 2023 14:27:47 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <emznck3ozdrhrgv6u3ignuvisypgfr7mjspw75pofvqvp77kcm@xwrqgr6kyuai>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-11-michal.winiarski@intel.com>
 <20231115215100.GN1327160@mdroper-desk1.amr.corp.intel.com>
 <lxzbl52b5kvqcnmpkcqhxylc6ei3idllvnz5l6u5cc53bf2j2r@znoa5fexo2w3>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <lxzbl52b5kvqcnmpkcqhxylc6ei3idllvnz5l6u5cc53bf2j2r@znoa5fexo2w3>
X-ClientProxiedBy: WA2P291CA0025.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::6) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS0PR11MB7877:EE_
X-MS-Office365-Filtering-Correlation-Id: a9d3615a-eb7b-479d-6278-08dbea95a825
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fEyUWVnJVAxxhQeVjWlg1iSfNFVnrWPAmduiVYzyI7ndpFYhGxFEaGMEWabDzSJi1ywYtmMuGQvUBoLkd06tcK8FkllEb2YV+dMEU0TKLHngU6Vpkofh8y7+0uWO5L7q3NDc1H68otOBeRzZUAmdmREekEs+QoYYb53E1oc3ek9T4JfHxodOWAy2TW7jh5Cen+MoFuCfxjjOKkww9n6etkEBxgXxDrHQlK3Z7jpOCfwv04PO9cFeR3JhIKId3oZssV3gw1CAZA+wJkIwc4gZqWW/571taXDGibo40vVE3mC4kad5COnwafH0A7IfciboPdT5YDbv7NrePMHKTjMNd2YnB6YtSbTa/vN/QMg73zza9CfF7hVLqwEGsvIqWutKQCMjvv616TIqudi9TfHN8QtQOiPPXZZpxQAaUrg7Z2nFAtc09rmN8m1nsTOzupSiu9eyIGWshdwGFh/4H/hz9OwKz9/XotcophIgzgyBXw5pvWvVdXzxC2bb/pg+u4zpUW9VO/F4dL6jQGTnHp8/enHObYd7fqiTliwZ2NhX0Ug=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(366004)(346002)(136003)(39860400002)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(316002)(66946007)(66556008)(6636002)(66476007)(26005)(4326008)(8936002)(6862004)(8676002)(38100700002)(41300700001)(82960400001)(33716001)(86362001)(2906002)(5660300002)(83380400001)(6506007)(6486002)(478600001)(9686003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDlWM2ZHTXE0K2tTWUpSKzBOMU1GckpUdEt6RW1KaWdjS3NQY2w0M0FSTENY?=
 =?utf-8?B?bUduV0p3ekFNZ25RQUI2RitKODFhWnFXL1A0WnpwWjE2OWFTb0JSM04zYVdu?=
 =?utf-8?B?NTE3aDU0ZERxcFphT0NHbVhuOVBCUWR2MTRKL1RoL0Q5blZITGZpZFFlU1Q0?=
 =?utf-8?B?NVd3TEdXMXV3K0crM05oTjBuZEM1cTR2YnJ1ZS9LbVZOdGpGQUx6OS91VHBW?=
 =?utf-8?B?Nkk0N0VLTDZ5ZVpyVUdWMXVkNUVLS3pxQ2VybTJqL3hpeHRlZ2RLTTBGVmtq?=
 =?utf-8?B?YzhpTFI4VWdCdkdEL21rL1VMbEU5OHVHWE91KzlNNEw3VVZCV3pKbTM5c0tp?=
 =?utf-8?B?UDFKb2FiRVBma2pCRTA3dlJzbnovTlRLYkJWQ3VTZGN2N1g5czhXdm00SUFl?=
 =?utf-8?B?Y0hHMnZQV0FDeG80L2hTSExtcUFDekdoQnRZZlRBaEluaUNkaldSSXFKWEpn?=
 =?utf-8?B?M0RrK3ZsY1BaNERTUmUraGpzaDgvTEVQdEtUb2I0Q2Q3cVVrdkJyK0FyUHEx?=
 =?utf-8?B?em1UdDdTQlRjVnM0dFA3SDFQOGpaT1lyYkUwa2U3ZGFBWTdHa3dKV1pmeXMx?=
 =?utf-8?B?b3lIQmlDRDJyNDBWT2ZWSGdlb3FaUzJTWXpReERiZ1ZQTm5hRDEyaDdKeU1t?=
 =?utf-8?B?UXNaWXJyMGxEL0JVRlhQekxWaGRzYjVCVSs3NnZCRUpEcUlyK0N6U2U3NnM2?=
 =?utf-8?B?WTRGYnRiSCtHQnJHK1JXN2RoTVcrS2dOODZ1YVQybU9UaXU0V2N5U0JRYmNS?=
 =?utf-8?B?SzVTK3NKdGxUclQ4Vk1hLzJKRVpIQVZmWDhDOUFGek16RGJPUEN3OUVVbHJ6?=
 =?utf-8?B?bkIxczluaDRBaDZuU2x0U2VJZ29ULzF1M2xaMTBnZUowbkZDRFVOM3RxTERi?=
 =?utf-8?B?TWpkSmR2bUVWZWN4R1o1clM2WVliWHNydDRtdTVVSnJrR0VhWHRFRHYwVVZk?=
 =?utf-8?B?R1J1d2FBUSs1QS9UTWprWmlQMG9kSlZsZmY0QW1OdG02NlVYeDhnQzg5Qi8v?=
 =?utf-8?B?dEhaTFFhRHVDNU5nVlhtWFRrSi8rMVFZYWR2bFgrdmY0TjNjR3RvcUNEYTFK?=
 =?utf-8?B?UUxtVE8wMXAxZml3bnhPMzhHeHZ5VlZBQldjajR5THFOZXZyN3N3TUlmS3dQ?=
 =?utf-8?B?bTJleWlLUXlMVk5BOUgxMzAvQW1hejcyZ3dkSUZMbHNrb3dtdUR4a3dxamIz?=
 =?utf-8?B?QU5OUmZvc0E5RUtDUDZYWnBmb2NpdWRNRGVlTXUyc0oyMjVPbHpETkZUWUlH?=
 =?utf-8?B?TmI5U3BlQkFudWlORXFxdlhoNGswVGtYZ0dyODVZM3g2VFR6d1lpd1l3UEtp?=
 =?utf-8?B?UnA1blVKKzVOdTFUMzVhamZMQnROSVNWQzU2ZmtxTWdhcGd2dmJ0WTdtOUh1?=
 =?utf-8?B?NU9IbzJjTWlkMGtab1dBaDlIVGxFQjQ2T01xV011bTJhWGdmVzlpcHhCaGdp?=
 =?utf-8?B?UitGSExNcSt1TUdMa1MvZzhFNTE4aWM2eDNoMFNVOXVtcXFta2hYc2hCZks3?=
 =?utf-8?B?RGt1WnlkVjNWMVd3dmd5ZnNjRFIxKzUxNWw4cjF3VE9OTG8rL2x6Q2pWV2Uy?=
 =?utf-8?B?TG4xSzJBVUZWaklDb0lXdGtOOWNkQlNPbzROK1NmSGYvTkhaWGFTbjgrUFNt?=
 =?utf-8?B?YzB4UXpBRWg4WkZrZzQ4TTJNeWdqcVJZbFZQMkx0RXN0cUsrRXJIKzRsTzk1?=
 =?utf-8?B?dldDdzlRbWNSdXVVZzlQVDJxZi9ob1RPNkNkYkZHT0FRSGJkVklwbEpKekdp?=
 =?utf-8?B?cnVSa0N4d2xhYkwwZXE1VkZhVno4ODVVNlNVcjdyWVNtUi9KcTZyU3dPQnVh?=
 =?utf-8?B?dTBQaEI5TE5EaFROVTNYbE93NkJnU2ZKYVdZS2toK0VsWUpKK0RxS0kzZXE4?=
 =?utf-8?B?VWtaRyt3Qi9RSWJLSmRaU0oyOFRnTGdnWFJhK2Npdkx6c1lla200TldtUE0w?=
 =?utf-8?B?V0R2UW1kd0lvVmZQZXgzRjhrdENnYmNjNEkyb2lxTmJkbkU5T3JVd0ZDOU1C?=
 =?utf-8?B?L1Q3c05aTktlMmhKeThCR2t5YzlWdy9SQStKWW9ZT21RYkFhSytpUnp1VXFO?=
 =?utf-8?B?c3NPUm1WTVVjNUo0SHoyTDNtNytHanRtVkI3Ukp1bitEZURZcG0zY1VkMU9D?=
 =?utf-8?B?REh5d2Y3eUlEY2luSjVRTC9KNnpQc2daSXJMcU9PTUEyQ2ZiTndLbkY4cVRZ?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d3615a-eb7b-479d-6278-08dbea95a825
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 13:27:49.7038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xTZvrKjqDtH0NuI6KFcAZr+0X5Os5J9PfeV0IXD4x0Jnsa0vF6AROjJOJxzS695BCJC6oPCH9ZQMH3vEhjbCGCpTkcnyktSupQx/MIgxV0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7877
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 10/20] drm/xe: Don't "peek" into GMD_ID
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

On Mon, Nov 20, 2023 at 01:57:42PM -0600, Lucas De Marchi wrote:
> On Wed, Nov 15, 2023 at 01:51:00PM -0800, Matt Roper wrote:
> > On Tue, Nov 14, 2023 at 02:02:21PM +0100, Michał Winiarski wrote:
> > > Now that MMIO init got moved to device early, we can use regular
> > > xe_mmio_read helpers to get to GMD_ID register.
> > > 
> > > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
> > >  drivers/gpu/drm/xe/xe_pci.c          | 35 ++++++++--------------------
> > >  2 files changed, 11 insertions(+), 25 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > index cc27fe8fc3633..6b195115564ce 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > @@ -38,6 +38,7 @@
> > >  #define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
> > >  #define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
> > >  #define   GMD_ID_REVID				REG_GENMASK(5, 0)
> > > +#define MEDIA_GMD_ID				XE_REG(GMD_ID.addr + MEDIA_GT_GSI_OFFSET)
> > > 
> > >  #define FORCEWAKE_ACK_GSC			XE_REG(0xdf8)
> > >  #define FORCEWAKE_ACK_GT_MTL			XE_REG(0xdfc)
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index a1026b7ee4727..a6c08577b01d2 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -21,6 +21,7 @@
> > >  #include "xe_drv.h"
> > >  #include "xe_gt.h"
> > >  #include "xe_macros.h"
> > > +#include "xe_mmio.h"
> > >  #include "xe_module.h"
> > >  #include "xe_pci_types.h"
> > >  #include "xe_pm.h"
> > > @@ -441,29 +442,6 @@ find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
> > >  	return NULL;
> > >  }
> > > 
> > > -static void peek_gmdid(struct xe_device *xe, u32 gmdid_offset, u32 *ver, u32 *revid)
> > > -{
> > > -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > > -	void __iomem *map = pci_iomap_range(pdev, 0, gmdid_offset, sizeof(u32));
> > > -	u32 val;
> > > -
> > > -	if (!map) {
> > > -		drm_err(&xe->drm, "Failed to read GMD_ID (%#x) from PCI BAR.\n",
> > > -			gmdid_offset);
> > > -		*ver = 0;
> > > -		*revid = 0;
> > > -
> > > -		return;
> > > -	}
> > > -
> > > -	val = ioread32(map);
> > > -	pci_iounmap(pdev, map);
> > > -
> > > -	*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 +
> > > -		REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
> > > -	*revid = REG_FIELD_GET(GMD_ID_REVID, val);
> > > -}
> > > -
> > >  /*
> > >   * Pre-GMD_ID platform: device descriptor already points to the appropriate
> > >   * graphics descriptor. Simply forward the description and calculate the version
> > > @@ -495,9 +473,14 @@ static void handle_gmdid(struct xe_device *xe,
> > >  			 u32 *graphics_revid,
> > >  			 u32 *media_revid)
> > >  {
> > > +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> > > +	u32 val;
> > >  	u32 ver;
> > > 
> > > -	peek_gmdid(xe, GMD_ID.addr, &ver, graphics_revid);
> > > +	val = xe_mmio_read32(gt, GMD_ID);
> > > +	ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
> > > +	*graphics_revid = REG_FIELD_GET(GMD_ID_REVID, val);
> > > +
> > >  	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
> > >  		if (ver == graphics_ip_map[i].ver) {
> > >  			xe->info.graphics_verx100 = ver;
> > > @@ -512,7 +495,9 @@ static void handle_gmdid(struct xe_device *xe,
> > >  			ver / 100, ver % 100);
> > >  	}
> > > 
> > > -	peek_gmdid(xe, GMD_ID.addr + 0x380000, &ver, media_revid);
> > > +	val = xe_mmio_read32(gt, MEDIA_GMD_ID);
> > 
> > It's unfortunate that we have to read the GMD_ID register through the
> > wrong GT pointer, but I don't see a good way to avoid it.  Maybe rather
> > than defining MEDIA_GMD_ID with the built-in offset (which people may
> > try to copy/paste for other register definitions without realizing this
> > is a one-time special case), we should just do something like
> > 
> >        struct xe_reg media_gmdid_reg = GMD_ID;
> > 
> >        /*
> >         * Since we haven't initialized the media GT yet, we need to
> >         * read media's GMD_ID register through the primary GT's
> >         * mmio; that means we also need to explicitly add in the
> >         * media GSI offset.
> >         */
> >         media_gmdid_reg.addr += MEDIA_GT_GSI_OFFSET;
> >         val = xe_mmio_read32(gt, media_gmdid_reg);
> 
> 
> since we already have a new use case for having a peek_gmdid
> (https://patchwork.freedesktop.org/series/126609/), maybe rename the
> function and leave this logic adding MEDIA_GT_GSI_OFFSET inside that
> single function?
> 
> with this patch getting a r-b, we already have all the pre-requisites
> reviewed so I'd be happy to rebase my series on top.

I'll bring back the "peek" as:
static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u32 *revid)

and use GMD_ID reg directly (with += MEDIA_GT_GSI_OFFSET for media).

Thanks,
-Michał

> 
> Lucas De Marchi
> 
> > 
> > 
> > Matt
> > 
> > > +	ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
> > > +	*media_revid = REG_FIELD_GET(GMD_ID_REVID, val);
> > > 
> > >  	/* Media may legitimately be fused off / not present */
> > >  	if (ver == 0)
> > > --
> > > 2.42.1
> > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation
