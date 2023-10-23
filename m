Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9E5C25B6C
	for <intel-xe@archiver.kernel.org>; Mon, 23 Oct 2023 23:48:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45F510E2AA;
	Mon, 23 Oct 2023 23:48:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D92C10E2AB
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Oct 2023 23:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698104932; x=1729640932;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kD7E4ckdnN40G+VlRNzsrzVay/XA+bLWGW7758DcXek=;
 b=UiGZZtvJrz+oN4YcPf2R3glEXqjMdpn/4VJ7uAjQQXpfdNJiu71rtTpX
 EHAD4P+kqMDVMcGIaUFapqhRJiCprdm4tv85O9zr7hfNhWvch3gYkJjek
 fGXhYIxjuyBDzdxiuj0FbbIhm6luWwLcp2Hd8MQBznNLIaVPN52GjyHVc
 FQEivUzPbmGkyZCur6rzb6NeTdqFZD6QiXxpIsPuRIKkOWp/4OIr2K9Gc
 8naKqBoHctPeNXgdGQhzWLD6Kz3Y9DkAWLiNIA8QzHggFdiwxFw30KUK/
 aemBiTmNuxlD4BzlNSi640/jGzY+7XpRAZLy06kbVixPAcxwZGD9n9WEv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="377327406"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; d="scan'208";a="377327406"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 16:48:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="1005483833"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; d="scan'208";a="1005483833"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2023 16:48:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 23 Oct 2023 16:48:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 23 Oct 2023 16:48:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 23 Oct 2023 16:48:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 23 Oct 2023 16:48:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUEYqpWJWTVR7esx+m/KlSSpIXsFLEa1tETi1/X6NX8o+2zLbyxtgxYb7ky8zVGNsnGMbWfIyK4R/GrEW0kq0xzIhsNHxtpMG73lmcCZRXhnMLJL5PJ9dLUK8l3xrzt3NO0kTRYe82MldlyS+mUCcYpY4jo8C9l3BkjWnOdtGQk+8V2Do1bFrf/H7u1z2QOroHM+AaWSqLl5SZMS2HCarg+LCeJfmUbu+8LSqywALbofBUTurm8rwM8XqWlVXxxOkGFk/lrd1rzTJDsHHlaIuZBbnHW88DrseBi3N4UWeWoRENp96+OIHmVfs58cM1xtSrTltWvLFr5ejV/oElYTRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BejM2lXkQ4Ye/pW91BIeF2UksNmO79k8uO5KFWKo+hY=;
 b=doeeToox0SM8D+B7nUfDQFapraMS/aaaXTm2jodDygNWrXAaOzAaLcMDDm9hEFwP6u4L0PC+TcQO5fOaPKVT0ad7jX3856wWpaKJc35Vp1oDvMdnIeaHSP8naHkKQ4hIcT6BmnVnEv6rhNXqTIbQs2QFQOdvzRyfMgp8oB/tLQaA9I4Z7UbjmyfsoR+taFf1W7RepB8GVoLImWzFRE1b7BqY9T17GR7kA5RklG4vAbiIwXhJ539s4WsZOcB6zJ37xlyZIT0V7tU5S8gYxspNwIvd1pikH7vxD441o/qx4dAhn3LUy4HWhwrJ7QV/7cU7NlipRxkvyZr23SZ8SZawwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA2PR11MB5212.namprd11.prod.outlook.com (2603:10b6:806:114::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Mon, 23 Oct
 2023 23:48:23 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62%4]) with mapi id 15.20.6907.028; Mon, 23 Oct 2023
 23:48:23 +0000
Date: Mon, 23 Oct 2023 16:48:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20231023234820.GH1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231020182437.681645-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231020182437.681645-2-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR11CA0108.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::49) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA2PR11MB5212:EE_
X-MS-Office365-Filtering-Correlation-Id: a36a9667-6bee-4138-7347-08dbd4228b32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5w8ToReQ35PkjezaQDthD7w9gapxO/ZKGRGCK2vljrCquWeTd5PBaym30jeMvqUsNSi0dBVkJ++osfZzZuc55BTyUfhkyRC0OyZu9e2ksyEUfO7r6N9LW26kN7KEMMMOCyBEKK0s9kPXyKOri4uSAmVA9DOY66d0D0VNH0xeb2I6RBQOjTUAJ0ffsDghM/dfB+v9pjXrjOfNhaTWb6VjlmjeVd24rU/KEHvFzwW7UDBjf+4racK0eNvtqjJ1JFWXKK7P13YAyvBcetFTUjEUNGF+0eDeSdZXEqNPKqABHmoSTANNusE2psTC2uSZKHU/vno4UQveru8FJVU4yq8PKEGDZ/kmqi7kzYHoL0g1foEEXRSCvnaOBfucerZodsGPib57uHrL/Ih5PQgESlpP9SAlYfZT5gDNhEI0GdCtE4PEcliAwJBkcDpJ1xJTIl8SGvVBl5XyAmlD0FU0RDC6oaj4UsqEvExZeQhObNo7QeaAjTkDfiWhOgVu7iIoGqhbLneWsw3rfQqUAq47ApMAAvNIOt2X/CvYGtMhVy2vPi/0n9BHQGRrL5GBmPfeqNCV4whbuppINL3Ds6UJkSWhWW5bHRiScmM7KlwCeNMSSgs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(346002)(136003)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(1076003)(83380400001)(26005)(66574015)(82960400001)(6512007)(6506007)(38100700002)(86362001)(2906002)(41300700001)(6486002)(478600001)(66946007)(8676002)(6862004)(4326008)(8936002)(6636002)(66556008)(5660300002)(316002)(66476007)(33656002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?J9UcI37aiqwpBhdb2esEMqGe87RGlKudg2nfdFuz3ce/NujpPId1TFA9eF?=
 =?iso-8859-1?Q?sviaR2iR47dyjPfD+mT81MblqIRO0hYVHSO8Krj1Hgbeq1vqRuxkd83BYG?=
 =?iso-8859-1?Q?Rae697Lan2sgPdA2a1C+LzRr/v25PqDrXs5AhTxFzp2uX2ucmoGTaWK6Nf?=
 =?iso-8859-1?Q?9t5fS4weCMvoLUUcJoLDq8+IMZnFVp2+cldHkI8YV97qZnAFOnNq+b3CoR?=
 =?iso-8859-1?Q?xItPsdww/OBzWBolWdMBKKYSoW5SXaATAkELeVdB1t2tIv7jzLgu3bUqn6?=
 =?iso-8859-1?Q?wRXnUG6FB4LLxBTmRDDVdtBd/90q+gWXfVIbPB7g5Fk24EByVxefKad/uR?=
 =?iso-8859-1?Q?hX32Kn+wttoIbyL4e/dEifiQD2n5NqaMEV+dbsKXWcgK/1fq6vMuFnYvNX?=
 =?iso-8859-1?Q?UItIKdCiMU79Uj9R+w2O3MRpR7xBk96VrYg6grhiDSMncwGq0u/Ct6eoNJ?=
 =?iso-8859-1?Q?rmEsaX9BCldlxCdqjFJG9gvUMdQwB1Vm2IhkSc5kvv6diAOsNO8Wkwd0wg?=
 =?iso-8859-1?Q?lxEcKgoifcGQ+R3JzVtFC7SiteefTHxZ9VaMK8e1BNo2GCpIqhD7EjfF1G?=
 =?iso-8859-1?Q?84b15kaYJ5dCVpQMX/FqaX2FCOkaMRQR7/VdJ7xDV3tntH0GwCefiSIrBX?=
 =?iso-8859-1?Q?KBB19jOTP6e5NiqtqjKRBCNWqqL22YiyiWNOO8hxpiTZ06soDc3G4uDtxy?=
 =?iso-8859-1?Q?dOszFuM4BBHyUS4AaANLcCpkLEPRYorxB9UITDpaMzLjJYZoebiLGmh3GN?=
 =?iso-8859-1?Q?lqDYdZvGoksnBcSBrW28CbuxU2oBh1vQKDRIvllQuE4XEi1Q3i+tEZL3EB?=
 =?iso-8859-1?Q?ECSLrgJDEAVk2iGJbpEPKOVECXHlfZb1lm8p/sFrhfZgBYiQvUA82ziMuK?=
 =?iso-8859-1?Q?LW3HTbrhNbebNTAZ1OZRU4k5O5670rYKz7wou7cINudTyiJzFUjdq/h6hH?=
 =?iso-8859-1?Q?nyBlQrWYcVu3X/xyB8Cf+r7oXkt0Ox/kEulNS2ndIaQ1r9m3XJ/7w0tLwr?=
 =?iso-8859-1?Q?eNUHED6q+PqAmTW05uNm2tr6KT65DuOjfJzqr3AZyirmAF5ymP3Z8tLAG2?=
 =?iso-8859-1?Q?Rt5ngJo0IhmxfgfW6Qvi0xKFMJF1iOOnXTYhx4HTGCLVUYZl5eZgtcsxsd?=
 =?iso-8859-1?Q?wg/JQiW0+oT8uuCU7wdmvoaQ6WAfeaShUfMNHAKpOrY3v5FyfSbcCOHDGd?=
 =?iso-8859-1?Q?NKkdjgAl/Em2j8Z/rpPmib8i9mBvi+3rY7NtghqSDdNlLqebik1vZjyVes?=
 =?iso-8859-1?Q?7gmkn4EtjigKnl2r11U10t2ehkOtEOA96SAJsmvwCSFPc6GN4/zkRBo7tO?=
 =?iso-8859-1?Q?Sh0YuDwoEsZ1rVq4XjI4FiG10o++4IHWVVkLwqk058ezuoIjsXMKPrmq+6?=
 =?iso-8859-1?Q?bAZzD0vytGVso0a7drsaxdN/SHS79IX9cZFEnRfm5NhzGXm6j7MFOz75R4?=
 =?iso-8859-1?Q?ktEXAiFvOU0wqKfqWyIRTQnpoh0YB+ym2d9oIrEXF8CQcLn7/aMVon9YvA?=
 =?iso-8859-1?Q?MShnjOa+0VXyhOaqeTsINZ989WXU1o3jWmtp1NAYRIONzEsfbHZ8ojVoMd?=
 =?iso-8859-1?Q?rPrxYi1o3lPqDpdtSSWF0qXBe2vVuQnNsAg4t9HFMHS5DXvT69aBOP3v3k?=
 =?iso-8859-1?Q?1w3+7ZSEU5UEIUtOucXLQX1z4RU838TGuyVKNOUIhikYNnZII0Xgjm+g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a36a9667-6bee-4138-7347-08dbd4228b32
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 23:48:23.4551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xmZ47xvD4SB+ddzm15twMYPH2xXbGFeE0eo8wD/7xn34RvH8WRU/JLvCIb49iMURtmcz9rmCQvqdaHOneqhzhPVJUbItVbRR52dBBxfy/6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5212
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/migrate: fix MI_ARB_ON_OFF usage
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

On Fri, Oct 20, 2023 at 07:24:38PM +0100, Matthew Auld wrote:
> Spec says: "This is a privileged command; it will not be effective (will
> be converted to a no-op) if executed from within a non-privileged batch
> buffer." However here it looks like we are just emitting it inside some
> bb which was jumped to via the ppGTT, which should be considered
> a non-privileged address space.
> 
> It looks like we just need some way of preventing things like the
> emit_pte() and later copy/clear being preempted in-between so rather
> just emit directly in the ring for migration jobs.
> 
> Bspec: 45716
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c  | 16 ----------------
>  drivers/gpu/drm/xe/xe_ring_ops.c |  2 ++
>  2 files changed, 2 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index b4baecde60e6..009d728af762 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -406,12 +406,6 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  	return m;
>  }
>  
> -static void emit_arb_clear(struct xe_bb *bb)
> -{
> -	/* 1 dword */
> -	bb->cs[bb->len++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> -}
> -
>  static u64 xe_migrate_res_sizes(struct xe_res_cursor *cur)
>  {
>  	/*
> @@ -745,10 +739,6 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  			goto err_sync;
>  		}
>  
> -		/* Preemption is enabled again by the ring ops. */
> -		if (!src_is_vram || !dst_is_vram)
> -			emit_arb_clear(bb);
> -
>  		if (!src_is_vram)
>  			emit_pte(m, bb, src_L0_pt, src_is_vram, &src_it, src_L0,
>  				 src_bo);
> @@ -994,7 +984,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  
>  		/* Preemption is enabled again by the ring ops. */
>  		if (!clear_vram) {
> -			emit_arb_clear(bb);
>  			emit_pte(m, bb, clear_L0_pt, clear_vram, &src_it, clear_L0,
>  				 bo);
>  		} else {
> @@ -1285,9 +1274,6 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  				VM_SA_UPDATE_UNIT_SIZE;
>  		}
>  
> -		/* Preemption is enabled again by the ring ops. */
> -		emit_arb_clear(bb);
> -
>  		/* Map our PT's to gtt */
>  		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(num_updates);
>  		bb->cs[bb->len++] = ppgtt_ofs * XE_PAGE_SIZE + page_ofs;
> @@ -1316,8 +1302,6 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>  		update_idx = bb->len;
>  
> -		/* Preemption is enabled again by the ring ops. */
> -		emit_arb_clear(bb);
>  		for (i = 0; i < num_updates; i++)
>  			write_pgtable(tile, bb, 0, &updates[i], pt_update);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 58676f4b989f..59e0aa2d6a4c 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -355,6 +355,8 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
>  	i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
>  				seqno, dw, i);
>  
> +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE; /* Enabled again below */
> +
>  	i = emit_bb_start(job->batch_addr[0], BIT(8), dw, i);
>  
>  	/* XXX: Do we need this? Leaving for now. */
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
