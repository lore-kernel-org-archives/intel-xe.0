Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B454CC61DA4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 23:26:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC0F10E788;
	Fri,  3 Mar 2023 23:26:39 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A498410E788
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 23:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677885997; x=1709421997;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=byTYL6Ael4C4erpIouWjtXPbMamoRWc4LOvYJwLgm+k=;
 b=LiHzfSdrSlXFdH8dSXQqUED0Of91wuxj81NOljCnTe0428Ocn609lcKC
 nJQjwSjFf1I/1OtSs+TLcfo2AnZhQHUbm5SCTf/MIMxBriKgQh5sbBC38
 e8YBOeR5kbqpo+NiScBUJIy3zpQAUvkOBj8lEv+/qCWc9Ycyslht4DCNJ
 E3eEdTv1AmYXEGe2rkmhRixfX0+e46HFcvdaVwTXXIIjPp0/YpLEOvJC4
 OP/9Oz5r5AqZTewbaQqHx8Yda4NLSy/9jZl+LG/lKruIcUnTWoAYsQdxD
 Nq47vbdL4IeBMaXg6isEm+zFNEleB6e3VdmP5OUTdfGNLL5awFR2bEK2g g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="332662622"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="332662622"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 15:26:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="799380932"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="799380932"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 03 Mar 2023 15:26:35 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 15:26:35 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 15:26:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 3 Mar 2023 15:26:34 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 3 Mar 2023 15:26:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kF+Lar1beSklaQM2e9KxQJPHN0ZCAohFaMjEbvmL9HkiVEiu5Bk8a6T/RnHWEXp6d9QljS1GGb9OQ8673w2ehMxQ77VwmEWjI4unAzMPMapEn4R6f9+ddAf1NfCGvOD18fW9aDsMn3cAYn3o6W0eer9QMp3HFbmDvamZsb4HaqT9c5u6IvALoyxDjIjWNoqzKqBdRdyb/4UfgiP4MtyrSm+/uXElf1EPh7qOUHbujssm9GKE4oTKRMVdnSqIWPZaPyTmEpFjIzgb1VI34pS9NNjeKpAmgD6T3Q1MEDf03LK8clg4WN9cprTtOZWXs80O7lcAWZtdnLFefWTX6qVEug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dvb6VwueX5+YHBSwE3/U8efFljiKFxjuwtTuGBhpAgo=;
 b=gZf4QLhg4/sQqPDgdTpq/q0Q5O4Bcw+N8MMVjoEKOYaoKhLpaxFzUHPPQ9Jb1Oj0wxjSuqEJXut6JJpGINTyWeZjIqr74a9GGzIZmu2844Jgd+HQVhTf8ngKybwWR/25ijhCUIEu+WXJ1ivZBWdNuSawnOmrkHfKN+HNuDY72DLGs5zVnHC9ZR8XfZxzhtAcRWG7iaI3VITjO70lHNRp6yptnle7OPqcEFM2ITaEo0V9z4ITwIXKEApSKe8XAWep+VGA4EWepC+uH+r+crKhmIDcSLBFtY7c3Z5Hw99+6ArWjyGrYcCZujNJIijVjesNxSWqGubOB2mscDIyeTYf6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MW3PR11MB4619.namprd11.prod.outlook.com (2603:10b6:303:5b::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.19; Fri, 3 Mar 2023 23:26:31 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%6]) with mapi id 15.20.6156.022; Fri, 3 Mar 2023
 23:26:31 +0000
Date: Fri, 3 Mar 2023 15:26:28 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <20230303232628.GB1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230223185740.3356127-1-matthew.d.roper@intel.com>
 <20230223185740.3356127-7-matthew.d.roper@intel.com>
 <81f6b123-6f21-e3f0-7efb-b57339a1cb7f@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81f6b123-6f21-e3f0-7efb-b57339a1cb7f@linux.intel.com>
X-ClientProxiedBy: BY5PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::35) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MW3PR11MB4619:EE_
X-MS-Office365-Filtering-Correlation-Id: 34696383-0a67-4ea4-8915-08db1c3eb88f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QEH2uG7Rf4F+JBkwx1v1JImUY3w5zCGgcop6ZD60fTVkuRuV06fkByySR5ZlzP84s3iKX9Ztl9O/BYup4GUaw0rwNhggnPSl+j8+XkNbb9CEENqviY7eEQDZB+C9znZ4VHpcnIVoJ28TvNKrhrZdMZLK0xQZiJSPSgveXAbCoIz2BcT92EH/WnMmzVb75maWsNnipaeANyaWBWGsYLbU/LWH1jmvsBQ3EOIffWkWHBrSm3B9TO5uJNITtX9giDSCBJKKCz4hUCj/+hT3eFoTt3M7RIIM8lUoGuwxTdXP9M2hW4ek3CCjibSRIDDOTHH3sUqLZ6z8XLbqMW+l7JNN2RLRTu5ddDIAUItZ69Rnnq8qIIv2IhXtJplEZAyMk6jNkgYPSJEt8Pk3zpxJEO0k2ZkOZwTgjxYmeYtUkRJhGkgreWrYlnWQGroWKjmZvk7Mod8K17cPUDKpS7JadrLANJLdSW4jsKRm62v71AkUPfiAWqpoG9sv8EWkzX0L/svpWEATCumMfbywjGtcMQkJI12Ze7e0Wj5L3YEc05yDUcCAuT6rjmKZDepNfDHD71XObRPLkLZokAtz5ueEJa/snn15IPCcC1SWRNDy4LDdnXcJkxFJzRzkCuQhC3Blmh2SpnOpr2w4CD6ukbQFvBPInQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199018)(8936002)(6666004)(5660300002)(4326008)(6916009)(8676002)(66476007)(66556008)(86362001)(66946007)(83380400001)(66574015)(478600001)(45080400002)(316002)(33656002)(41300700001)(6486002)(186003)(26005)(2906002)(82960400001)(38100700002)(6512007)(6506007)(1076003)(53546011)(30864003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PeAkYjA4RZfTSc3UMRScChQt6vBvp/CV5v5wcbwROBiKTu1sEKkBi1RKGU?=
 =?iso-8859-1?Q?3fMqKMuYJ/EWRnSsqYWkzXNt1A32YQ8PD+f13D/HsBOArN9vfceOxuMwLp?=
 =?iso-8859-1?Q?BaijqsA0VaSjQoEeL+MYSTJn7NbhHIpQq1eIh8uvK/kzucNhDVchCWyGTq?=
 =?iso-8859-1?Q?dVMiyVMhu3Tvce7yv+HfPj/Icvnhds6TSw5ILUEDQ1XX6tabDgjPD4yJr5?=
 =?iso-8859-1?Q?e1cqZ1iNRbESrpLzuHqzdeijICnsFrxGQlN37XxhuxJ2pwvTeeCjAMoNLR?=
 =?iso-8859-1?Q?C4caRU3JjG2jpdNVwI45XWP90fWddZyzDlH7Uc2SSZ09NMXB92xwpBbnfe?=
 =?iso-8859-1?Q?sqC1p53KjO5W0Pct23mrNUViGsOEOXkryIhYAA4IrNoNNi2oJrWyMjlgh8?=
 =?iso-8859-1?Q?n0c7jcrvkDX7kfLtsBnUuI3CBns8o5d9IdqUrJ4r01/ALUqleCFW0V/yvm?=
 =?iso-8859-1?Q?6gaKS+gZnVQjGLv1cERQmIL2FaZInfYeI0AUgIeiRbCsK+dGJgFClrdBLf?=
 =?iso-8859-1?Q?R+Isd9Sbj/5g8jFYzXYVXyXXSZirY2rJYvEY0EOgeG2MpVRSKdwti4nkiM?=
 =?iso-8859-1?Q?nleWk71N2keZqiP3P/tEO4zKYXwU+nnt/3ucEB3W31W+5Ftbn8iLg8wqlB?=
 =?iso-8859-1?Q?h3XuZig4sSkgYHs0dC2KO/XXlzG8WJ0057/A8+gomRr0bV1qV7P7+CpK4d?=
 =?iso-8859-1?Q?w0oyFIdzx9j/IOBECS8TWi0wGG4XLvhyARO1ToIdfiIlN4RbEPHpwrs/HE?=
 =?iso-8859-1?Q?Ljv4AFFXJHGhKilZL76zEWpJc+3CRo2uQ7wvPIg8DrgffTk1SldRUbzPqg?=
 =?iso-8859-1?Q?eLgNhTCgqYYdQXvGf0iIRYXeP3iK49bFCF+PASAgVW5KtD3FXQP77E4bhw?=
 =?iso-8859-1?Q?rBmTC823Q9qb1wc254EVshZqqxqQJWVCjtDFP2X9HNtG8bOljBfwPYRcDb?=
 =?iso-8859-1?Q?j1QcnqTgrm+/okwpjzrlU7Sirn74iIv6wj3HD7a+JZnQ7ZBlzND8uNWfQl?=
 =?iso-8859-1?Q?MIVq/0b+X3uyhfJFWswLaTJQOzJ/dgClOCmcwXXXEdpAJnbwfuAgELlOmU?=
 =?iso-8859-1?Q?wrvEiSR5qxn1H2uiqmHeuk5rs9iCAuyjR1GaooH57F/6CbJQCDCE3LVbTg?=
 =?iso-8859-1?Q?hbPNGCq9bFGC0ZNv7Ybfi+44331rXqJDNaxxP8c5NXQF8Wn5jW2vdKm5d0?=
 =?iso-8859-1?Q?wGh2uqO7W/FkPzmghH8LyablC6qkU6qrAs1f9EQGzOGlasEV5UTKy85FCW?=
 =?iso-8859-1?Q?aBEfhcIe8MBC2S/lkqLXX9qd4Gk57RKWGEdSAGXLVbcwLUJ/NsDW4n8mAT?=
 =?iso-8859-1?Q?WGkTpSxrIaswUlzs+neH2UIkRT28xUnN95qAG6YSnWfRcapOYVZ9OUZ2p1?=
 =?iso-8859-1?Q?ogSsUrwfsxAiamQBRHkCfUJ7aHfb5ckifDIcQziDS6oIXgsq5kP2hjtj5x?=
 =?iso-8859-1?Q?CwPZ43xbZtRYFPeA/2pwtJOGV3KmlMsD+oZ86lfO8mCjXy3WBfd8Z5CotL?=
 =?iso-8859-1?Q?4BmnQ3A4+0WbE4Ngex+Pa406ZwL8PaP3Sts4fi+gUWRXoXuL9oxwrgofxk?=
 =?iso-8859-1?Q?qpPUTW6/kYYz+FQ134efiEU0b0yyKPvJ/GFQ/80ic0OwuwDRRHoptokSjX?=
 =?iso-8859-1?Q?Gc0Aiua4Mr5vB35yLtsCZtqL9e5+S4AXhDX+KLPc2P7V17DQLZOkJdAA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34696383-0a67-4ea4-8915-08db1c3eb88f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 23:26:31.4740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SkaUsY/GzwmoRWUQ5M4IRups3OHcVLr2Rb0AKFqk8C1JxIkdAlVwMP5lcAlVdUAHrvU5TYPed2oEIxwOZpg04CuzIGxL6PzavLOG6sh8LA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4619
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 6/7] drm/xe/mocs: LNCF MOCS settings only
 need to be restored on pre-Xe_HP
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hmm.  It seems that most of that patch is fine, but the regression is
caused by my attempt to tighten up the GuC's regset space allocated for
these registers.  The condition in guc_mmio_regset_write() only adds the
LNCFMOCS registers to the GuC regset for RCS0 (they don't need to be
saved/restored for the other engines), so I thought increasing the
regset size by a total of just LNCFCMOCS_REG_COUNT (rather than
LNCFCMOCS_REG_COUNT*XE_NUM_HW_ENGINES) would be sufficient, but it seems
there's something I'm overlooking in the GuC regset code and we do still
need to allocate the extra space for every possible engine, even the
ones that don't need to save/restore it.

So I believe the following patch solves the problem; I just haven't
figured out the details on exactly why yet.


diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 7a892ff7aba3..0d926edd7656 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -224,10 +224,7 @@ static size_t calculate_regset_size(struct xe_gt *gt)
                xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
                        count++;
 
-       count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
-
-       if (needs_wa_1607983814(gt_to_xe(gt)))
-               count += LNCFCMOCS_REG_COUNT;
+       count += (ADS_REGSET_EXTRA_MAX + LNCFCMOCS_REG_COUNT) * XE_NUM_HW_ENGINES;
 
        return count * sizeof(struct guc_mmio_reg);
 }


On Fri, Mar 03, 2023 at 10:09:45AM +0100, Thomas Hellström wrote:
> Hi!
> 
> After this commit I see the following on DG1, and attempting to run anything
> after that won't work.
> 
> Thomas
> 
> 
>    10.306993] ------------[ cut here ]------------
> [   10.307040] WARNING: CPU: 2 PID: 447 at
> drivers/gpu/drm/xe/xe_hw_fence.c:91 xe_hw_fence_irq_finish+0x36/0x120 [xe]
> [   10.307327] Modules linked in: xe(+) drm_ttm_helper ttm i2c_algo_bit
> drm_suballoc_helper kunit drm_buddy gpu_sched drm_display_helper
> drm_kms_helper drm crct10dif_pclmul crc32_pclmul crc32c_intel nvme e1000e
> nvme_core drm_panel_orientation_quirks ghash_clmulni_intel video wmi
> pinctrl_tigerlake usb_storage ip6_tables ip_tables fuse
> [   10.307656] CPU: 2 PID: 447 Comm: systemd-udevd Tainted: G U            
> 6.1.0+ #120
> [   10.307719] Hardware name: ASUS System Product Name/PRIME B560M-A AC,
> BIOS 0403 01/26/2021
> [   10.307779] RIP: 0010:xe_hw_fence_irq_finish+0x36/0x120 [xe]
> [   10.307980] Code: 54 4c 8d 67 60 55 53 48 83 ec 10 48 8b 47 60 49 39 c4
> 75 13 48 83 c4 10 5b 5d 41 5c 41 5d 41 5e 41 5f c3 cc cc cc cc 48 89 fd <0f>
> 0b e8 33 84 13 e2 48 89 ef 88 44 24 07 e8 c7 44 5e e2 48 8b 55
> [   10.308103] RSP: 0018:ffffb917c12d7b90 EFLAGS: 00010216
> [   10.308149] RAX: ffff8b189b6d85d8 RBX: 00000000ffffffc2 RCX:
> ffffb917c12d7aec
> [   10.308201] RDX: 0000000000000000 RSI: ffffffffa356dc2b RDI:
> ffff8b189ee84c60
> [   10.308253] RBP: ffff8b189ee84c60 R08: 0000000000000001 R09:
> ffff8b189ee82278
> [   10.308304] R10: 0000000000000000 R11: 00000000d3ea3544 R12:
> ffff8b189ee84cc0
> [   10.308356] R13: ffff8b189ee84cd8 R14: ffff8b189ee83e00 R15:
> ffffffffc08dda87
> [   10.308407] FS:  00007f8a847cb0c0(0000) GS:ffff8b1af3280000(0000)
> knlGS:0000000000000000
> [   10.308466] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   10.308511] CR2: 00007f69c6ba5298 CR3: 0000000114d8e003 CR4:
> 0000000000770ee0
> [   10.308564] PKRU: 55555554
> [   10.308614] Call Trace:
> [   10.308640]  <TASK>
> [   10.308679]  xe_gt_init+0x336/0x380 [xe]
> [   10.308886]  xe_device_probe+0x234/0x2a0 [xe]
> [   10.309084]  xe_pci_probe+0x418/0x540 [xe]
> [   10.309294]  local_pci_probe+0x3e/0x80
> [   10.309342]  pci_device_probe+0xb3/0x210
> [   10.309392]  really_probe+0xdb/0x380
> [   10.309427]  ? pm_runtime_barrier+0x50/0x90
> [   10.309473]  __driver_probe_device+0x78/0x170
> [   10.309519]  driver_probe_device+0x1f/0x90
> [   10.309564]  __driver_attach+0xd5/0x1d0
> [   10.309632]  ? __device_attach_driver+0x110/0x110
> [   10.309675]  bus_for_each_dev+0x62/0x90
> [   10.309719]  bus_add_driver+0x1b1/0x200
> [   10.309767]  driver_register+0x89/0xe0
> [   10.309804]  ? xe_hw_fence_module_init+0x35/0x35 [xe]
> [   10.310034]  do_one_initcall+0x5a/0x300
> [   10.310080]  ? rcu_read_lock_sched_held+0x3f/0x80
> [   10.310122]  ? trace_kmalloc+0x33/0xe0
> [   10.310160]  ? kmalloc_trace+0x46/0x60
> [   10.310203]  do_init_module+0x4a/0x200
> [   10.310247]  __do_sys_finit_module+0x93/0xf0
> [   10.310331]  do_syscall_64+0x37/0x90
> [   10.310369]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> [   10.310417] RIP: 0033:0x7f8a8522892d
> [   10.310452] Code: 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48
> 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48>
> 3d 01 f0 ff ff 73 01 c3 48 8b 0d d3 e4 0c 00 f7 d8 64 89 01 48
> [   10.310576] RSP: 002b:00007ffdafa93138 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000139
> [   10.310671] RAX: ffffffffffffffda RBX: 0000562a45dc7f50 RCX:
> 00007f8a8522892d
> [   10.310725] RDX: 0000000000000000 RSI: 0000562a45dc6100 RDI:
> 0000000000000016
> [   10.310777] RBP: 0000562a45dc6100 R08: 0000000000000000 R09:
> 00007ffdafa93260
> [   10.310827] R10: 0000000000000016 R11: 0000000000000246 R12:
> 0000000000020000
> [   10.310878] R13: 0000562a45dbf440 R14: 0000000000000000 R15:
> 0000562a45dbfbb0
> [   10.310967]  </TASK>
> [   10.310989] irq event stamp: 141793
> [   10.311018] hardirqs last  enabled at (141801): [<ffffffffa217660e>]
> __up_console_sem+0x5e/0x70
> [   10.311086] hardirqs last disabled at (141808): [<ffffffffa21765f3>]
> __up_console_sem+0x43/0x70
> [   10.311149] softirqs last  enabled at (141740): [<ffffffffa20f026d>]
> __irq_exit_rcu+0xed/0x160
> [   10.311215] softirqs last disabled at (141735): [<ffffffffa20f026d>]
> __irq_exit_rcu+0xed/0x160
> [   10.311279] ---[ end trace 0000000000000000 ]---
> [   10.312424] xe: probe of 0000:08:00.0 failed with error -62
> [   10.321694] xe 0000:08:00.0: [drm] *ERROR* GuC PC Shutdown failed
> [   10.321789] ------------[ cut here ]------------
> [   10.321825] WARNING: CPU: 2 PID: 447 at
> drivers/gpu/drm/xe/xe_guc_pc.c:879 pc_fini+0xd0/0xf0 [xe]
> 
> On 2/23/23 19:57, Matt Roper wrote:
> > Reprogramming the LNCF MOCS registers on render domain reset is not
> > intended to be regular driver programming, but rather the implementation
> > of a specific workaround (Wa_1607983814).  This workaround no longer
> > applies on Xe_HP any beyond, so we can expect that these registers, like
> > the rest of the LNCF/LBCF registers, will maintain their values through
> > all engine resets.  We should only add these registers to the GuC's
> > save/restore list on platforms that need the workaround.
> > 
> > Furthermore, xe_mocs_init_engine() appears to be another attempt to
> > satisfy this same workaround.  This is unnecessary on the Xe driver
> > since even on platforms where the workaround is necessary, all
> > single-engine resets are initiated by the GuC and thus the GuC will take
> > care of saving/restoring these registers.  The only host-initiated
> > resets we have in Xe are full GT resets which will already
> > (re)initialize these registers as part of the regular xe_mocs_init()
> > flow.
> > 
> > v2:
> >   - Add needs_wa_1607983814() so that calculate_regset_size() doesn't
> >     overallocate regset space when the workaround isn't needed.  (Lucas)
> >   - On platforms affected by Wa_1607983814, only add the LNCF MOCS
> >     registers to the render engine's GuC save/restore list; resets of
> >     other engines don't need to save/restore these.
> > 
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_execlist.c   |  2 +-
> >   drivers/gpu/drm/xe/xe_guc_ads.c    | 20 ++++++++++++++++----
> >   drivers/gpu/drm/xe/xe_guc_submit.c |  1 -
> >   drivers/gpu/drm/xe/xe_mocs.c       | 13 -------------
> >   drivers/gpu/drm/xe/xe_mocs.h       |  1 -
> >   5 files changed, 17 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> > index d555d77cbf49..fd0ebfe7cae3 100644
> > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > @@ -462,7 +462,7 @@ static void execlist_engine_suspend_wait(struct xe_engine *e)
> >   static void execlist_engine_resume(struct xe_engine *e)
> >   {
> > -	xe_mocs_init_engine(e);
> > +	/* NIY */
> >   }
> >   static const struct xe_engine_ops execlist_engine_ops = {
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > index 0c08cecaca40..0a458c083db7 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -206,6 +206,11 @@ static void guc_ads_fini(struct drm_device *drm, void *arg)
> >   	xe_bo_unpin_map_no_vm(ads->bo);
> >   }
> > +static bool needs_wa_1607983814(struct xe_device *xe)
> > +{
> > +	return GRAPHICS_VERx100(xe) < 1250;
> > +}
> > +
> >   static size_t calculate_regset_size(struct xe_gt *gt)
> >   {
> >   	struct xe_reg_sr_entry *sr_entry;
> > @@ -218,7 +223,10 @@ static size_t calculate_regset_size(struct xe_gt *gt)
> >   		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
> >   			count++;
> > -	count += (ADS_REGSET_EXTRA_MAX + LNCFCMOCS_REG_COUNT) * XE_NUM_HW_ENGINES;
> > +	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
> > +
> > +	if (needs_wa_1607983814(gt_to_xe(gt)))
> > +		count += LNCFCMOCS_REG_COUNT;
> >   	return count * sizeof(struct guc_mmio_reg);
> >   }
> > @@ -430,6 +438,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
> >   					  struct iosys_map *regset_map,
> >   					  struct xe_hw_engine *hwe)
> >   {
> > +	struct xe_device *xe = ads_to_xe(ads);
> >   	struct xe_hw_engine *hwe_rcs_reset_domain =
> >   		xe_gt_any_hw_engine_by_reset_domain(hwe->gt, XE_ENGINE_CLASS_RENDER);
> >   	struct xe_reg_sr_entry *entry;
> > @@ -464,9 +473,12 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
> >   					  e->reg, e->flags, count++);
> >   	}
> > -	for (i = 0; i < LNCFCMOCS_REG_COUNT; i++) {
> > -		guc_mmio_regset_write_one(ads, regset_map,
> > -					  GEN9_LNCFCMOCS(i).reg, 0, count++);
> > +	/* Wa_1607983814 */
> > +	if (needs_wa_1607983814(xe) && hwe->class == XE_ENGINE_CLASS_RENDER) {
> > +		for (i = 0; i < LNCFCMOCS_REG_COUNT; i++) {
> > +			guc_mmio_regset_write_one(ads, regset_map,
> > +						  GEN9_LNCFCMOCS(i).reg, 0, count++);
> > +		}
> >   	}
> >   	XE_BUG_ON(ads->regset_size < (count * sizeof(struct guc_mmio_reg)));
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index a54f7f82d04d..3766b77a0d90 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1267,7 +1267,6 @@ static void guc_engine_resume(struct xe_engine *e)
> >   	XE_BUG_ON(e->guc->suspend_pending);
> > -	xe_mocs_init_engine(e);
> >   	guc_engine_add_msg(e, msg, RESUME);
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> > index 1ede2d46e778..c019352ba7a8 100644
> > --- a/drivers/gpu/drm/xe/xe_mocs.c
> > +++ b/drivers/gpu/drm/xe/xe_mocs.c
> > @@ -517,19 +517,6 @@ static void init_l3cc_table(struct xe_gt *gt,
> >   	}
> >   }
> > -void xe_mocs_init_engine(const struct xe_engine *engine)
> > -{
> > -	struct xe_mocs_info table;
> > -	unsigned int flags;
> > -
> > -	flags = get_mocs_settings(engine->gt->xe, &table);
> > -	if (!flags)
> > -		return;
> > -
> > -	if (flags & HAS_RENDER_L3CC && engine->class == XE_ENGINE_CLASS_RENDER)
> > -		init_l3cc_table(engine->gt, &table);
> > -}
> > -
> >   void xe_mocs_init(struct xe_gt *gt)
> >   {
> >   	struct xe_mocs_info table;
> > diff --git a/drivers/gpu/drm/xe/xe_mocs.h b/drivers/gpu/drm/xe/xe_mocs.h
> > index aba1abe216ab..63500a1d6660 100644
> > --- a/drivers/gpu/drm/xe/xe_mocs.h
> > +++ b/drivers/gpu/drm/xe/xe_mocs.h
> > @@ -11,7 +11,6 @@
> >   struct xe_engine;
> >   struct xe_gt;
> > -void xe_mocs_init_engine(const struct xe_engine *engine);
> >   void xe_mocs_init(struct xe_gt *gt);
> >   /**

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
