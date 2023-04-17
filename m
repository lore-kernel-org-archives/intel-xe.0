Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9998DC77B76
	for <intel-xe@archiver.kernel.org>; Mon, 17 Apr 2023 17:34:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3924210E56C;
	Mon, 17 Apr 2023 17:34:11 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DEC10E56C
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Apr 2023 17:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681752848; x=1713288848;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lYEJncN/KoblBix/wh3nGK9PPca9tBarxwngQnR4i9U=;
 b=B1BVoHIC2YrRnJrUbDDDS/R0SX2CP8s/iuca/0TYfCMUSo/7a1meedu+
 R/kQ7ww+9wRkQ6P/Dy8sWdG1Zy3xSqFGGK8wBH29J/mj2ubWeZoRqj5Mj
 vUn7htGJG1A6I1zUzv0qd7om+aYz/nMCzwVmx5mNmAKNphWMnvhJH0Cfr
 h8ZjjJ/f5EOB3E5/mWKqQjmQmOtLSDAmEgbVc7F5KUnKQlM1hYo9IKpVB
 d7U2dHTe8/AZ5ZFHjWG4Mw5zH8QXIlD+9TnD1JTyoOkJqRYrUsj9BEzac
 ed6rJfHAyAKk5F0YL3ptm8kFgjLwSlm1HjurG2lAl0yP9oy4IzEstO4kY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="410169960"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="410169960"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 10:33:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="834522407"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="834522407"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 17 Apr 2023 10:33:54 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 10:33:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 10:33:53 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 17 Apr 2023 10:33:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/vL9EJvcNFA6YVBVlm2BzisSHuOuf9HiF+vLN5iazZdUFigKAiC1aDP/KxHOLdHs6p6XwKrfjK8VFdrkGSsPIUPUiY2JXOhslg0Ni6FCluHDGA+JGmU6lLJDfYcfW/E0VcBhB9WkAMnPVGXBt9XjnWMnt5m6+qUk7roLYT8YRXXyEaeZY3BsqYLJ9VqnUt0WG9iIEswLdt9i6iHwt6R+wIvSYI/sffWBiGgtVv8pN+rzgdJ9d2L+HqMbph0I7nuIcJPmMCGOCPEUYw05Bu3j8A1kpiV7fWwo7X6BEXAC6RriT81yqvzNzGGbw+PIEwlYrpNttxcPfX58PDA1AoA2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JbuDo3E2/7RI3ZeauTnUK4wEyMKRT5VAczcbFAPdVg=;
 b=EcGQ0tjI6miRH4NLQVItqBURH36Hls2iNczruwWQ/STseOeomFXrX+3/JWRBtOMtcRcdPPXqRTD7PCMSDS3a4+V53e9n/AeVUNrfuwhTU700XRn5R9kQj7VZfhVWxCZM2NmzcQ5BMTa+bshIigFEJ7GtPCC0I770mXvBuz/+X7hLOZCOiymhIlTGDckUgIFHtyd+CjSCBU3uYjQmys3ItzkTHUWZHlBGoddVfVA/sPmAY2weM8GJPntM4sEvTjc1uANAoHiaiKTifEyY7mh7qLR0mH40VmKsoFZ19JnPE839VygEla1hKHRC+qOJJUxabom3xFsf6H+M6z94QLkDxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB7775.namprd11.prod.outlook.com (2603:10b6:208:3f3::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.45; Mon, 17 Apr 2023 17:33:51 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Mon, 17 Apr 2023
 17:33:51 +0000
Date: Mon, 17 Apr 2023 10:33:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230417173347.GB2825255@mdroper-desk1.amr.corp.intel.com>
References: <20230412225248.3229571-1-matthew.d.roper@intel.com>
 <20230412225248.3229571-2-matthew.d.roper@intel.com>
 <bhl6gkkbxnospxl6lehp6rlqawiexvmqjwpmwnnj6jtpkncvpx@liortet3chsi>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bhl6gkkbxnospxl6lehp6rlqawiexvmqjwpmwnnj6jtpkncvpx@liortet3chsi>
X-ClientProxiedBy: SJ0PR03CA0273.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::8) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB7775:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e477251-c1bb-45c4-b10d-08db3f69e862
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wPrceh+JsgGJpfqBjHwXsvLpFstL+o9wjPXZWAocP/Qx8fkfEgCk2Ke24qoSasuApcz329JzuX8Ho0xlDjcWUoQ0MvtMzd1fZVZ+WiMTPjaTALYBKE4lcCRac2BBLjMWWaomibCOCjrqrti7E9oCvqOzyduJEVuVC6Kx78qUJKx1TpSJGz9uVQfW3GCOxZ4kGNFxrNVrsdQ1lkOSlZYn57YfWo0X9OO04Ea+yodHpFY4nGXTMXAKiFIq9SR6gGOC+CcQRFcAHl8CVkeWyfJrFt0oog4ZVimO13SAAJjXpgfZBkJshQrEtjw7jMrYfbuYycjCUI+6XV13M4yWfOMrOtWL9ACz7wS1i+i4xnDQcGltM/E5sfAgaiJBmhtUFOBVBKGSBe9E5VFgTMcCaio2+rvDlxt8FR0CShIDkJIDvOBWqvTMCMPKa9r9mJWZ3BrnknzKljZC3XB3ptJOmOblzsYK2RKQeDIzpSKCxiFg5V7akfJCdiRAb0EugeNSkrGLwD70KA6MosukIhqP0m9N0uxGf8s+VRRTXlQSx1TJCP9M5GNuI1KDP/h08yD/I0wp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199021)(33656002)(6636002)(4326008)(316002)(66556008)(66946007)(66476007)(6486002)(478600001)(6666004)(5660300002)(8936002)(8676002)(6862004)(41300700001)(2906002)(86362001)(82960400001)(38100700002)(6512007)(6506007)(1076003)(26005)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yMGLY92C2TbfSpFj7iGGc0w6Waa3ynNlsBqSUpZX8qXNdV6t16TNjGgW9yAw?=
 =?us-ascii?Q?bMJUrQWDvbxLhxKQChcl6ZlBG5wuO8a8pCrvx6LMiYhHMRkSaBd3XuzdLzvY?=
 =?us-ascii?Q?RV16vsjyAx0TxN0dr3k/gUs/coCZ7ngsVkl71QqLLUyozbr+8L73ktFICxTw?=
 =?us-ascii?Q?MLFcuJKnD4pXuHEa1RrGQTu2LY20courP5ceePCuKwqgiZ/GyYQmmKQ+ZWvi?=
 =?us-ascii?Q?nCHlCDBRmHvwRNBen0KzR8wf4hAmk7ngZzc4Nk6mseZagU7tKihLmrILI3Li?=
 =?us-ascii?Q?e0/5sa+5OjYf6yKT/lXQZuePvOvyUx2/6rziw3j9703mcHAF31R9UPBePePZ?=
 =?us-ascii?Q?P7rkw3O0BprcPiIFx6abUjSXpSKf2ag/BX3hbhsRnuABB4a26KnNHb/v67DB?=
 =?us-ascii?Q?fvEbfnK58eA6dB87sAxp0R12qj5J0q+UqfoL0gohODFBZ8K5akECpHUH4N7u?=
 =?us-ascii?Q?yJThVQWdpZT7cuoB6Juc5Z9dXpYFs+Wi55PPWnKBbFQaXV4nsohnnLGjLNDS?=
 =?us-ascii?Q?RkTJA3buXN8L8wvRp2/fxQ91wQbNIxWdsDB4rXXZOBRQH3nQnwLJHnRDysRX?=
 =?us-ascii?Q?W7Hg+9S+jWxi3BhNl+uHckod9qU2qVhAh6z/TqDf/sy8x8Ge4bDgvAAFyRbk?=
 =?us-ascii?Q?BXKgBaBqvIVq/hv7GK/xO3xJujKaoZyMgHN0fPawhTqFFuSVnEqjHVVpwHZd?=
 =?us-ascii?Q?y8jGzvs13M/py9/1Bvg/PoHREvZ7MJBuVNuNsfKFn6mmkO+JCaGurZf8mNu/?=
 =?us-ascii?Q?404s2Aa6M3tzJXJC4pKoYXtn9NRu+nlVIOG/wDZhRLXYURP9aLiVtYjaxN89?=
 =?us-ascii?Q?Moun9F7xYq5BkSnTnRhTxuFpcbVC29eBKxa+qNgPTP1/7elp1qS3fCPHkUHo?=
 =?us-ascii?Q?OroUxsZnuCVadFSTE4qahcYOFAl+QLwqMjNAOFS2NlIWheUh5T+mBFU55cE9?=
 =?us-ascii?Q?4JOQ8DPpdDXA7sAwl5cYNEkDf5bU7tdTmH9tmIRhNBgW4kHfo8x7YMliGovE?=
 =?us-ascii?Q?nqSZmmMOkJkbZsHi0H/JZ2W6jZTwRdF4MpBL+CVweLLgmaD1jHWXoTIxJgc0?=
 =?us-ascii?Q?Uw8UrcozxmQ0CUJ56+2VLzqD4HdB5dZLRzUG6En7QzsJ2rSIRTMGy+DjhUH5?=
 =?us-ascii?Q?7B85qTme2IC7BuTrdrNajV6PL2mnseP70XnomncXKPubXazjY9lzX5q7rs+U?=
 =?us-ascii?Q?H9VSaXm+G7t8B2yTn8iR6gZGekvAAMrysql9OBE0dyAsVVwxrubXNK9kTkHF?=
 =?us-ascii?Q?ik+N4ROctJxMn2CJ2Tt/EJubSY0EsGaRFqqKuQbEa7ss7+wOmiSlUvALJsCN?=
 =?us-ascii?Q?piGo9wwYUO+j5S2EHP4PtNPT8DVr8oK86sOP7mhy1IYq3fYYI3J4FPQoKKVq?=
 =?us-ascii?Q?wgzX8OkKbYW4Vc7zonoyb3zyeLyFl3vZVUwHS+v/H8fPjjqsA/7k4fGsYDiH?=
 =?us-ascii?Q?W61kfpQTHn7uo0oDbmG3z3lFtIlz/KKol++7J4c/6hbnIQPN8eu/Sy/ECUd1?=
 =?us-ascii?Q?oVSzbjkvykWY1m1y3oUtu3+srbF4GGXnZFxRF5629ht+1TJkpOj0t1M4WlCI?=
 =?us-ascii?Q?vULZlUECibkeEnYhTGYVNrItUiPhNLwuZFbaVJf0HhkCTaJo/JtG5CbEst2U?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e477251-c1bb-45c4-b10d-08db3f69e862
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 17:33:51.0267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBfZV7Bgz8xNarHQBfDw2XdXoL6tGMSMlh+KQCakKoh4scFVN1RbENDKIpUN97u4HLqIIv8NfHx2SsOLU3ZL5TnbdMt5fu+53mhyHaxooX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7775
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/8] drm/xe/irq: Cleanup media GT
 interrupt flow
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

On Fri, Apr 14, 2023 at 12:04:15PM -0700, Lucas De Marchi wrote:
> On Wed, Apr 12, 2023 at 03:52:41PM -0700, Matt Roper wrote:
> > Although platforms like MTL have media exposed as a separate GT, it's
> > important to recognize that this second GT is *not* a tile as we see in
> > platforms like PVC.  The interrupt registers (including the ones related
> > to GT interrupts) reside in the SGunit so there's only a single instance
> > on the entire platform; they are not replicated per-GT.  Thus all media
> > interrupts are delivered together with the interrupts for the primary
> > GT.
> > 
> > v2:
> > - Also update reset & postinstall routines to skip media GT.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_irq.c | 79 ++++++++++++++++++++++++++++++-------
> > 1 file changed, 65 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> > index 13f9f220bca0..7e78eecba62a 100644
> > --- a/drivers/gpu/drm/xe/xe_irq.c
> > +++ b/drivers/gpu/drm/xe/xe_irq.c
> > @@ -232,7 +232,40 @@ gt_other_irq_handler(struct xe_gt *gt, const u8 instance, const u16 iir)
> > 	}
> > }
> > 
> > -static void gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
> > +static struct xe_gt *find_media_gt(struct xe_device *xe)
> > +{
> > +	struct xe_gt *gt;
> > +	int id;
> > +
> > +	for_each_gt(gt, xe, id)
> > +		if (xe_gt_is_media_type(gt))
> > +			return gt;
> > +
> > +	drm_WARN_ONCE(&xe->drm, 1, "Cannot find media GT for interrupt handling\n");
> > +	return xe_device_get_gt(xe, 0);
> > +}
> > +
> > +static struct xe_gt *pick_engine_gt(struct xe_gt *full_gt,
> > +				    enum xe_engine_class class,
> > +				    unsigned int instance)
> > +{
> > +	struct xe_device *xe = gt_to_xe(full_gt);
> > +
> > +	if (MEDIA_VER(xe) < 13)
> > +		return full_gt;
> > +
> > +	if (class == XE_ENGINE_CLASS_VIDEO_DECODE ||
> > +	    class == XE_ENGINE_CLASS_VIDEO_ENHANCE)
> > +		return find_media_gt(xe);
> > +
> > +	if (class == XE_ENGINE_CLASS_OTHER &&
> > +	    instance == OTHER_MEDIA_GUC_INSTANCE)
> > +		return find_media_gt(xe);
> > +
> > +	return full_gt;
> > +}
> > +
> > +static void gt_irq_handler(struct xe_device *xe, struct xe_gt *full_gt,
> > 			   u32 master_ctl, long unsigned int *intr_dw,
> > 			   u32 *identity)
> > {
> > @@ -241,27 +274,33 @@ static void gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
> > 	enum xe_engine_class class;
> > 	struct xe_hw_engine *hwe;
> > 
> > +	/*
> > +	 * Media GT interrupts are delivered on the primary GT.  This function
> > +	 * should never be called on the media GT itself.
> > +	 */
> > +	drm_WARN_ON_ONCE(&xe->drm, xe_gt_is_media_type(full_gt));
> > +
> > 	spin_lock(&xe->irq.lock);
> > 
> > 	for (bank = 0; bank < 2; bank++) {
> > 		if (!(master_ctl & GT_DW_IRQ(bank)))
> > 			continue;
> > 
> > -		if (!xe_gt_is_media_type(gt)) {
> > -			intr_dw[bank] =
> > -				xe_mmio_read32(gt, GT_INTR_DW(bank).reg);
> > -			for_each_set_bit(bit, intr_dw + bank, 32)
> > -				identity[bit] = gt_engine_identity(xe, gt,
> > -								   bank, bit);
> > -			xe_mmio_write32(gt, GT_INTR_DW(bank).reg,
> > -					intr_dw[bank]);
> > -		}
> > +		intr_dw[bank] = xe_mmio_read32(full_gt, GT_INTR_DW(bank).reg);
> > +		for_each_set_bit(bit, intr_dw + bank, 32)
> > +			identity[bit] = gt_engine_identity(xe, full_gt,
> > +							   bank, bit);
> > +		xe_mmio_write32(full_gt, GT_INTR_DW(bank).reg, intr_dw[bank]);
> > 
> > 		for_each_set_bit(bit, intr_dw + bank, 32) {
> > +			struct xe_gt *gt;
> > +
> > 			class = INTR_ENGINE_CLASS(identity[bit]);
> > 			instance = INTR_ENGINE_INSTANCE(identity[bit]);
> > 			intr_vec = INTR_ENGINE_INTR(identity[bit]);
> > 
> > +			gt = pick_engine_gt(full_gt, class, instance);
> > +
> > 			if (class == XE_ENGINE_CLASS_OTHER) {
> > 				gt_other_irq_handler(gt, instance, intr_vec);
> > 				continue;
> > @@ -369,11 +408,17 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> > 	}
> > 
> > 	for_each_gt(gt, xe, id) {
> > +		/*
> > +		 * The media GT isn't a tile, so its interrupts are delivered
> > +		 * as part of the primary GT's flow.
> > +		 */
> > +		if (xe_gt_is_media_type(gt))
> > +			continue;
> 
> so it seems your classification for GT vs Tile is: does it have
> interrupts routed through it? Or... this gt doensn't have local vram =>
> it doesn't process the interrupts.

A tile is pretty close to being an entire GPU by itself.  It has a
dedicated MMIO space which replicates _all_ registers (including non-GT
registers like sgunit, soc, etc.), it has a dedicated system agent, it
has a dedicated interrupt flow, it has a dedicated GGTT, and it has its
own dedicated LMEM (if discrete).  Although the standalone media is on a
separate chip, it's only the small subset of a GPU that the hardware
team refers to as a "GT" and it doesn't have all the other non-GT stuff
required to basically function as a complete GPU on its own.

> 
> > +
> > 		if ((master_tile_ctl & DG1_MSTR_TILE(gt->info.vram_id)) == 0)
> > 			continue;
> 
> this check actually differentiates it by "does this GT have local vram",
> and making the vram_id match the bits in DG1_MSTR_TILE.

For the sole multi-tile platform we have today (PVC) it is true that the
ID in the master tile register matches the LMEM ID.  We don't have any
platforms yet that combine both multi-tile and standalone media, so it's
hard to say how the hardware will work if/when such a platform shows up
down the road.

> 
> I'm actually thinking if the mistake was not making the SAMedia a gt
> instead of just attaching its engines to the GT matching its local
> vram_id.  It would then also mean we wouldn't have to do the whole dance
> in xe_pci.c with main gt, remote gt, media gt.

I don't think that would work very well.  The GuC is still inside the GT
and thus is replicated on a standalone media platform; the GuC is
completely unaware of the engines from the other GT.  There are also
things like forcewake that need to be tracked separately; grabbing the
"GT" forcewake domain on the primary GT does not wake up the "GT" domain
on the media GT or vice versa.  It would also likely lead to us
forgetting to do some of the per-GT initialization flows (e.g., things
like applying GT workarounds and such that aren't tied to an engine).

I think what we should really do is break out another level of
structures: xe_tile and xe_gt.  An xe_tile can contain multiple xe_gt
structures (e.g., render and media).  It would also be the structure
that holds shared things like the GGTT, anything sgunit-specific, etc.
That would also be cleaner than the current nonsense of making 'xe_gt'
the target of MMIO operations, even for stuff that lives outside the GT.

        xe_tile {
                xe_gt[] {
                        guc
                        engine list
                        forcewake
                        MCR / steering
                        GT workarounds
                        ...
                }

                system agent (MMIO target)
                ggtt
                lmem
                interrupt stuff
                ...
        }


Matt

> 
> It may be too late for changing that though and we would also need to
> change other places like the mmio handling and GuC. But I'm thinking it
> would make to a cleaner code as it seems we are adusting several parts
> of the code that we wouldn't really need if we didn't consider it as a
> separate gt and just used "a tile is a gt" like it used to be.
> 
> IMO a slightly less confusing change in this irq handling would be:
> 
> 	unsigned long done_tile = 0;
> 
> 	for_each_gt(gt, xe, id) {
> 		if (__test_and_set_bit(gt->info.vram_id, &done_tile))
> 			continue;
> 
> because then it's clear: if a gt points to the same tile, as per
> xe_pci.c, we don't want to process interrupts again since it was already
> done by the previous loop.
> 
> > 
> > -		if (!xe_gt_is_media_type(gt))
> > -			master_ctl = xe_mmio_read32(gt, GFX_MSTR_IRQ.reg);
> > +		master_ctl = xe_mmio_read32(gt, GFX_MSTR_IRQ.reg);
> > 
> > 		/*
> > 		 * We might be in irq handler just when PCIe DPC is initiated
> > @@ -386,8 +431,8 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> > 			return IRQ_HANDLED;
> > 		}
> > 
> > -		if (!xe_gt_is_media_type(gt))
> > -			xe_mmio_write32(gt, GFX_MSTR_IRQ.reg, master_ctl);
> > +		xe_mmio_write32(gt, GFX_MSTR_IRQ.reg, master_ctl);
> > +
> > 		gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
> > 
> > 		/*
> > @@ -473,6 +518,9 @@ static void xe_irq_reset(struct xe_device *xe)
> > 	u8 id;
> > 
> > 	for_each_gt(gt, xe, id) {
> > +		if (xe_gt_is_media_type(gt))
> > +			continue;
> 
> ditto
> 
> 
> And it also seems to have a wrong layering here as in dg1_irq_reset()
> we do:
> 
> 	if (gt->info.id == 0)
> 		dg1_intr_disable(gt_to_xe(gt));
> 
> that is unrelated to this commit though.
> 
> Lucas De Marchi
> 
> > +
> > 		if (GRAPHICS_VERx100(xe) >= 1210)
> > 			dg1_irq_reset(gt);
> > 		else
> > @@ -486,6 +534,9 @@ void xe_gt_irq_postinstall(struct xe_gt *gt)
> > {
> > 	struct xe_device *xe = gt_to_xe(gt);
> > 
> > +	if (xe_gt_is_media_type(gt))
> > +		return;
> > +
> > 	if (GRAPHICS_VERx100(xe) >= 1210)
> > 		dg1_irq_postinstall(xe, gt);
> > 	else
> > -- 
> > 2.39.2
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
