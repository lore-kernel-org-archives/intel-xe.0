Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BEAC61D90
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 16:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C811610E52B;
	Tue, 21 Nov 2023 16:54:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C213810E52B
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 16:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700585674; x=1732121674;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4WOc1brDzlyCKJQk3NpzUjseMrewwlB9lRlN3A0IgjQ=;
 b=SNGD9qwaKIa03xHj5m5AFwcRAaAZ7AKuWvPGSHGDxVtXaPDi12evO4f7
 v9FmQUS7hXrWoPiM/3+ifkcT3YCKgfIAnUOIR+pnxA9J2GRO9jS6zr/fn
 X56Y9vFxFFohrenCJdAziaQUS+vBn6FvTSZdVkf3l2HmwgreIcOcGP+3m
 /Y91hfXUQQ5ooDGHBM7tgNTJ7SzLNka15B43CkN2ifV4QrHmp96vIChkd
 3dnapJOkH6W9QSEN4hYNGhogqShTwVe4/MCfxiD5Ufo3x6cljJmh+DN4n
 fzWLA1FWtLCPeRwC0rOiceGZagMehWv1zcBbIyELr7ewHnkUKPqAhKF04 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="456216790"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; d="scan'208";a="456216790"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 08:54:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; d="scan'208";a="14960191"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2023 08:54:33 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 08:54:33 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 21 Nov 2023 08:54:32 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 21 Nov 2023 08:54:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UabqKXEDVhUl+ufHJxThzjpp4jUd0itEI1DnvLjZ927uY3EGsURh0W2U5pxzcD9dE9XJ9RofoLFdIhdaDPArRuZ3ILcEqLrNpcFaWen3ACA04+ImuNMByFJVXHA9uprfV9tDgCSJIn/Bqzk9lwg/AGhUN/0qypIFJm/tQ4SNrgfaDybwew8FMz+M5GlAxUZw7rnroWKNOy1lsysxgh2oao4QQqrQsKIOIUh1QgQKjXQveCBpRUn/bMnevqmAdynteQ98x95jFP+gkvtPbV8QRUhOENysRLjEUXNXD6hnPpOj2vLBIx3k1qvU22qxb/uECXurnpgRQT4zE2yNoqTVnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5/9VkM3ndyFHHvvUy+PmAXxPydqkuywq/0+zQojIEE=;
 b=EhfG/F4EbtC3wQJrJGABYcYOZUDuZBcB8Qi8ZqZVzYfBw6dYVh97K9HwbSkLU3+ENNtLcnok14Faalthe6DwnYbyc/69Eq7YETuGNdQgsKrhc6oTC/cZofc+uLVu121rKG62wI00bILTWJHloLZ1sD7wqVwl+6/zJD6FA+Yw6boX6ZU4dkgzai8mxouwbBIIKOH98j+J43bQcR1fbc5spxJM12DFSNuqjaCFI23NUvGQkrs2LZLTNQ03Nv0ZJBQWsI+7ooGNxmLTCh3PigshQkg7WqpAg94SMKPg3/SVp1AOtTtBiWWg+9MCFDsBcx3EBcHdACgFyhoxLnw6JkcWnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7918.namprd11.prod.outlook.com (2603:10b6:208:3ff::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 16:54:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 16:54:24 +0000
Date: Tue, 21 Nov 2023 10:54:22 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <pk55zkzgcj3m66mezenr2xtdzscsze7vx66k6vay3etcwnkiyx@xvcttgshi5m6>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-11-michal.winiarski@intel.com>
 <20231115215100.GN1327160@mdroper-desk1.amr.corp.intel.com>
 <lxzbl52b5kvqcnmpkcqhxylc6ei3idllvnz5l6u5cc53bf2j2r@znoa5fexo2w3>
 <emznck3ozdrhrgv6u3ignuvisypgfr7mjspw75pofvqvp77kcm@xwrqgr6kyuai>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <emznck3ozdrhrgv6u3ignuvisypgfr7mjspw75pofvqvp77kcm@xwrqgr6kyuai>
X-ClientProxiedBy: BY3PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:254::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7918:EE_
X-MS-Office365-Filtering-Correlation-Id: e765e246-f0a4-4136-32d4-08dbeab2840d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8PW5jZ/VtAeYN+4Gjryvf+NimnkDXMN8N7CtixSuRbmxtYvbVY0qo2/MMtPtjp1EKmfi/Fm2D2Re4Fl2NpGiZ9JJMQtJXPQp6XOp7Txx4RnUSWMUqW8UmJg+jEvhga/G6pBlzs6DOiSd4Jp2dAyEkZID478U5/hPqJ2ucIyGzlRubX35Rh5/FUfBjHxJ/3tEDFCSV7sX9K4QCEWjSEweSNDgx9z1b4qJm0luyZMkoHOcODifSr6X5n4gjNCAkDrhgSwFIR7aTsfHiZvYMVyz0yaL6heZIrX/TWhkCZ4aRhsQliEiGVy8b/7LtTJoBE1Ifu86OBPNIjylVRbBTx7K25ihcgXQSTuT+heCLXOjDbd+9fDC4VMSc1wVUXxE4rAh/49IDtuKijXbw5peUZ1IQEJLDLldMF8jTJuTIorczRqo1pBf/DRafBbqnwULHcKnAF/vD/B8vS/w/QZ/zziHyKxN//DpEar2S0Oi8U6uiZhkOCiKvvP/LhPW8Xl7gcv5u/sAbZ3BOwyyaEFIZlKL21eshc/Jplas1ZRZ7wqPi4Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(396003)(366004)(376002)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(83380400001)(9686003)(6512007)(33716001)(26005)(8936002)(8676002)(4326008)(6862004)(38100700002)(2906002)(5660300002)(478600001)(41300700001)(6486002)(6506007)(66946007)(66556008)(6636002)(316002)(66476007)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0F0WjdhemNDQmQ3aGdRamFjSFBCejhGQzd1R1ZFWWtzUVBpSmJNaGVzRTZw?=
 =?utf-8?B?NjBILy9FNjdNRjJzR3puTWRCbkxPTzNQNVU1OTJKRnA0aXdNSndTUE8rajFl?=
 =?utf-8?B?SitDQ1pJZnlQc3ZXMGFhOWJNSTU3U2tHSmhzenZoWExRT29yMW4vYzlQcGgy?=
 =?utf-8?B?Qm1mR0piL1piS2dlL3Y5Yk8zcUs0MWxjbTRBSDBLWGEwMEQwSU1pajVzT0hH?=
 =?utf-8?B?SE5yK2VSUXBiMnF5L0UxaTNjOWtoelpyRHB3MnRQY1R4d3E1cEZwekF1cFFR?=
 =?utf-8?B?NWpKVDlVZlJnVTVlYXQ5SFdqRkk4UVNMTmxQS2dXbnpsSndEQTlzdDJiVUli?=
 =?utf-8?B?Mkl2V05QcDdvN1NXczFaRlgvUG02UnZmaXpESkZ1TG1hSWwwK0VlVGFSTVBi?=
 =?utf-8?B?djNnaWNkNkdVRlpiUmdhd3phcmxNNlhIenA2YjU3Z0ZxUTBRb1MzMVRJK0VX?=
 =?utf-8?B?cFh0NzZhLzRjTDNsSUhvSitwNDdFYjZ4ODNBL1N2WWJvS1JhWlpDdWtGUGor?=
 =?utf-8?B?MDNYSENhN2U4amw2TEdSdGxDM2RTbjBpL1p3ZFZZckJZQmhuVktyRndDNnU0?=
 =?utf-8?B?K0xSZU4xVVI5bXJQL0JjM3FIU3JWZXFWZDRCQVdiZDN2Z1QwZFFNMGZHcEpB?=
 =?utf-8?B?WlI2U2JnVU1ZSkN6Sm8xSk1xcE9HVUx5NFJsMkI0NUZxTCsvQ0swMFA5cnEv?=
 =?utf-8?B?ZWdCRDc2Y1BBTUdkWDFaZmtsaUc5U3NITVVtM2R4dGZXTjlQZG9ocFRKSVhM?=
 =?utf-8?B?bEs5STRpUnFId2k3dFI3QjFqQmkrWUxtYmRxQnhxUVFvUG51UnB3ZWhmaFcy?=
 =?utf-8?B?eFB5T2VjTXRGcnR5OTRhc29Za1pzSVVDekZFS1VQSUlwMnB2ZWxMandiaUMz?=
 =?utf-8?B?bU1WKzk1di9JcTlsRm1WSFJRQzdYWEpxSFB1QVExTEVlMzNUaHBuN2NJV0U2?=
 =?utf-8?B?U09OK0g4MmdEUEF3WFlIb3F3S0J4WlZSVTNMZUhRdzZEQ1preTNWaEtMZldQ?=
 =?utf-8?B?SlI4VmR6OXdDTUx3U1BKcElIOHVoUVhZclRmVmk5NnhjUTh3OVN5TEhhYmdq?=
 =?utf-8?B?Y0FOS2JvbkFrZ3BJWEQ4Qnlwc3pORkdMbDY2Y0Ziem1XWmxTeGovNzJKSU5r?=
 =?utf-8?B?SXBvUFhHWkZQWE9aK0U1YkV6Y1czMmRldXRkN3ByOXJoMzFMcUpzNmFRVDFu?=
 =?utf-8?B?RC9tY1k2M0F0T3VVR1JsdjlZUEgwaXFIaFh3TTVNOWQ2VmU0c0RGSmp2aDV5?=
 =?utf-8?B?emZPdGRHdUlQbnB6M3pMT3doWUZrWUVBRGRqb3ZkbjEwdTBGMTlwYVkzUzRE?=
 =?utf-8?B?R1l0cFRrVEljaWxZekorS2JvK3Y2aTNRUU5pRFJ5UjdQbUk2bUxNMWpiRnZr?=
 =?utf-8?B?dWw0cFRRbnJEa1RhUUlWRFo0aVROL25RZlpOblZSVFlEV0hEbGREbWl6KzlC?=
 =?utf-8?B?UExrZjFLbDhaQ3V1ekhiK04xNVVUSU1nRy9KNTZianVpOXVhd2lmWmpRVlRo?=
 =?utf-8?B?ajZBVWFCaTl3VkN1YXhLTm9wbDVJZU5pb09jQUVuK3I5SDE2MkpOY1VvVCtP?=
 =?utf-8?B?UnhaZWFuUGdoT1phaTdaWkVNb1l1QlVNam1pUG1ZM28raHhkazhvZDdYaXlK?=
 =?utf-8?B?eEtWSjFQWERyaGtrUFBPQlNXMnZ1OUZMdHhXS01zV0lnazY2N0ZHRytqNzNx?=
 =?utf-8?B?TUwvVE4rWW5FcnV0eG55dTc2amhnUTQ4YUNHazNweEtlclFUaUZyM3J5WDVy?=
 =?utf-8?B?NVN3Qmx4YjUrTDgzb2hVcDdFd09lci9JOVdicUhJOEJjOGpMVGJ0eTBpN2lz?=
 =?utf-8?B?dExvbUNFNzlYelIwYjhtN2RZNWRyRTRBRzhhbjRCRDhjYTM2bDdyWmF6NnVF?=
 =?utf-8?B?U1lnazRwemh3aG9KVG4weExhZWNxc3ltbjVuMnhROVlTVmZSNlZCVWpwb2ZV?=
 =?utf-8?B?SWFXVmwvZE1yVGhCVEZXdlVvTWpxVjR3WXh5U1cyeDBqaklRa0xLV05SYlE4?=
 =?utf-8?B?am9WZUxRQklxMmk3dkQ1RVErb3NNc08xUVU2ZDJYbG1FNnlnWE5LRGg0VDZh?=
 =?utf-8?B?QmZxZktyWmpIY1JDbDZaK1l2OGpZZWdKUTlWVmdZVDBIeWxIOGlKVldKaVhG?=
 =?utf-8?B?YzlqdEw1c09HSzFYa2t1emdtQVNXUGdjQ1hlTUVjQjRDWlRVK3BZUllDWHU1?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e765e246-f0a4-4136-32d4-08dbeab2840d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 16:54:24.5245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tlb0rIfA7n2QeeUT71KNKshyXzJd3qdIpOhr6ezSVwdwFqbeV7Xh317QrbpNRmLmM14f/LSZAeznHmq/sCiS3VUofLo1AOZPwmLr18qSkzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7918
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

On Tue, Nov 21, 2023 at 02:27:47PM +0100, Michał Winiarski wrote:
>On Mon, Nov 20, 2023 at 01:57:42PM -0600, Lucas De Marchi wrote:
>> On Wed, Nov 15, 2023 at 01:51:00PM -0800, Matt Roper wrote:
>> > On Tue, Nov 14, 2023 at 02:02:21PM +0100, Michał Winiarski wrote:
>> > > Now that MMIO init got moved to device early, we can use regular
>> > > xe_mmio_read helpers to get to GMD_ID register.
>> > >
>> > > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
>> > >  drivers/gpu/drm/xe/xe_pci.c          | 35 ++++++++--------------------
>> > >  2 files changed, 11 insertions(+), 25 deletions(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > > index cc27fe8fc3633..6b195115564ce 100644
>> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > > @@ -38,6 +38,7 @@
>> > >  #define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
>> > >  #define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
>> > >  #define   GMD_ID_REVID				REG_GENMASK(5, 0)
>> > > +#define MEDIA_GMD_ID				XE_REG(GMD_ID.addr + MEDIA_GT_GSI_OFFSET)
>> > >
>> > >  #define FORCEWAKE_ACK_GSC			XE_REG(0xdf8)
>> > >  #define FORCEWAKE_ACK_GT_MTL			XE_REG(0xdfc)
>> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> > > index a1026b7ee4727..a6c08577b01d2 100644
>> > > --- a/drivers/gpu/drm/xe/xe_pci.c
>> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
>> > > @@ -21,6 +21,7 @@
>> > >  #include "xe_drv.h"
>> > >  #include "xe_gt.h"
>> > >  #include "xe_macros.h"
>> > > +#include "xe_mmio.h"
>> > >  #include "xe_module.h"
>> > >  #include "xe_pci_types.h"
>> > >  #include "xe_pm.h"
>> > > @@ -441,29 +442,6 @@ find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
>> > >  	return NULL;
>> > >  }
>> > >
>> > > -static void peek_gmdid(struct xe_device *xe, u32 gmdid_offset, u32 *ver, u32 *revid)
>> > > -{
>> > > -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> > > -	void __iomem *map = pci_iomap_range(pdev, 0, gmdid_offset, sizeof(u32));
>> > > -	u32 val;
>> > > -
>> > > -	if (!map) {
>> > > -		drm_err(&xe->drm, "Failed to read GMD_ID (%#x) from PCI BAR.\n",
>> > > -			gmdid_offset);
>> > > -		*ver = 0;
>> > > -		*revid = 0;
>> > > -
>> > > -		return;
>> > > -	}
>> > > -
>> > > -	val = ioread32(map);
>> > > -	pci_iounmap(pdev, map);
>> > > -
>> > > -	*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 +
>> > > -		REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
>> > > -	*revid = REG_FIELD_GET(GMD_ID_REVID, val);
>> > > -}
>> > > -
>> > >  /*
>> > >   * Pre-GMD_ID platform: device descriptor already points to the appropriate
>> > >   * graphics descriptor. Simply forward the description and calculate the version
>> > > @@ -495,9 +473,14 @@ static void handle_gmdid(struct xe_device *xe,
>> > >  			 u32 *graphics_revid,
>> > >  			 u32 *media_revid)
>> > >  {
>> > > +	struct xe_gt *gt = xe_root_mmio_gt(xe);
>> > > +	u32 val;
>> > >  	u32 ver;
>> > >
>> > > -	peek_gmdid(xe, GMD_ID.addr, &ver, graphics_revid);
>> > > +	val = xe_mmio_read32(gt, GMD_ID);
>> > > +	ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
>> > > +	*graphics_revid = REG_FIELD_GET(GMD_ID_REVID, val);
>> > > +
>> > >  	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
>> > >  		if (ver == graphics_ip_map[i].ver) {
>> > >  			xe->info.graphics_verx100 = ver;
>> > > @@ -512,7 +495,9 @@ static void handle_gmdid(struct xe_device *xe,
>> > >  			ver / 100, ver % 100);
>> > >  	}
>> > >
>> > > -	peek_gmdid(xe, GMD_ID.addr + 0x380000, &ver, media_revid);
>> > > +	val = xe_mmio_read32(gt, MEDIA_GMD_ID);
>> >
>> > It's unfortunate that we have to read the GMD_ID register through the
>> > wrong GT pointer, but I don't see a good way to avoid it.  Maybe rather
>> > than defining MEDIA_GMD_ID with the built-in offset (which people may
>> > try to copy/paste for other register definitions without realizing this
>> > is a one-time special case), we should just do something like
>> >
>> >        struct xe_reg media_gmdid_reg = GMD_ID;
>> >
>> >        /*
>> >         * Since we haven't initialized the media GT yet, we need to
>> >         * read media's GMD_ID register through the primary GT's
>> >         * mmio; that means we also need to explicitly add in the
>> >         * media GSI offset.
>> >         */
>> >         media_gmdid_reg.addr += MEDIA_GT_GSI_OFFSET;
>> >         val = xe_mmio_read32(gt, media_gmdid_reg);
>>
>>
>> since we already have a new use case for having a peek_gmdid
>> (https://patchwork.freedesktop.org/series/126609/), maybe rename the
>> function and leave this logic adding MEDIA_GT_GSI_OFFSET inside that
>> single function?
>>
>> with this patch getting a r-b, we already have all the pre-requisites
>> reviewed so I'd be happy to rebase my series on top.
>
>I'll bring back the "peek" as:
>static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u32 *revid)
>
>and use GMD_ID reg directly (with += MEDIA_GT_GSI_OFFSET for media).

with that, few free to add
	
	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
