Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8ADCA0FFF
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 19:13:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7AE10E1A4;
	Tue,  5 Sep 2023 19:13:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F6510E1A4
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 19:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693941222; x=1725477222;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9qomuzVA/O8PWtZ8yF53URm50adD9CjWY0Dwl9odMJs=;
 b=MfzhClYt8zGJ1ey2Trf8NhapIWx9xiAXzyWGZ5CGxg+iRwXC3L+mhnuc
 7TsIrlNIf+HZe3vJM8YpX1SDkXGrGfniz4ec4XRcY122Fin1A2lRsv47n
 WhPt9Pekjz097TclwBwXmtQxwVa9xWxhwnJEvCfgN4JaaWcciWrWuYpF7
 iKoctn5GkypzbScZep0PZ4hJt2blRQL7RKJwewasxV2Of/p7F/TCWKX8e
 4zisH9FjdtLbqCz7AtqL38PtV9Daq0qrOUQNoAYqoAymQfYbfbAYLflAb
 35ZyDvjY1zy7++Hm3Zry5JdH9Dm5fBCxXFoeiwMp60ynU7AikcI7K9JAY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="463256977"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="463256977"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 12:13:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="811359555"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="811359555"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2023 12:13:40 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 12:13:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 5 Sep 2023 12:13:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 5 Sep 2023 12:13:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqXgrCzIBa1fnIup+WASsEVFVRPsB9o+tcOw88piPv0q4X5rWtveOcPwkJPCtCYjJcDOGjHU7kyB9PodG88jQ7gU3zYvKwSdJAHJcsHFblwwih6iF3av8M2F5ig1qTJTuDrhmhr22uCjVxYmsHUa3NDB614qhGqoMgIBek8ZBNQXvQ+4ZXYytDR9+5O0TAJs4sv5xzXpe+71qBw6qk8FSH0Xjv7qHbKsfNXgqwDPIWkqy/Nbf31SlkTfm6RsYhKoM+PQap/QTujKDSjfzYfc8YDn0x5k/qA4AkFTYWuVCA5u5LiQpPUN/6naOnzbMel6pQiPtz+KYKFK9beS06aIQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+yACYR5OuG5gL6IRjKXL6+ETADQGGq7+cYXmBLoH/0=;
 b=dSWdjPhbu91uF0Vrmlb8HoRr1cPc8+Rr8+Ra95zrmSkpwbQtAvTiEitGKJmqHwi0PISCkRenrDJDEYkBRgJULSQNvUpJ/Ka2juAgz9lz7v7k2HUX4J9Fp5HMd6jusGzwq6eX5XQzkcgpQj5FLjTxPA7uIUkMWMn9vM42ZXbOHi1xfPFbWVgrytYBTJLVkQ8Z8pUkwrsCNcCCDon18zzfoO2Xm+jwN2ZNyKnoRJ04NAWP+Rt0KlH2dNIFzHudkI+znq3+gXeKgov38P4L75A7fvb8e7RugtTp8PT26HXQhl3tbkm6BhQmPAnr+e2pNqGyc6Yruv0jEm658oDH2u2n2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA0PR11MB7402.namprd11.prod.outlook.com (2603:10b6:208:432::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 19:13:37 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 19:13:37 +0000
Date: Tue, 5 Sep 2023 12:13:34 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230905191334.GX6080@mdroper-desk1.amr.corp.intel.com>
References: <20230905143144.1706967-1-lucas.demarchi@intel.com>
 <20230905143144.1706967-4-lucas.demarchi@intel.com>
 <20230905180151.GD2706891@mdroper-desk1.amr.corp.intel.com>
 <dlz7e5if3d75z4foqtxs2gx7t62zeduk3j4cikghiefzl2b3bb@jmvqsloyy5st>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dlz7e5if3d75z4foqtxs2gx7t62zeduk3j4cikghiefzl2b3bb@jmvqsloyy5st>
X-ClientProxiedBy: BY5PR17CA0070.namprd17.prod.outlook.com
 (2603:10b6:a03:167::47) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA0PR11MB7402:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e31b5e-7a4c-4f8b-49c9-08dbae44350c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n41SQbphMmL+KYIxINq11Zs+bRW+WxLBGFAKRjWOqrpHJHJrGb/PJA1OwWd3QeiZNJaRtvC3XeA/OSW7l4EimMbAE8tOK/GdMJHToKGysrx0bK6b8vgs53UheYRUmA7mkmLICKlk7KBWKy3XMwWcEgNQ5STa+5POobxh0JdiJaKz3edhxQajODfmlNWtI+wkRao98gwmAYpd7x30wt5VfOy26gELCu8PywdQJn+B7bvGNyT3r9hVZiPZCRXTmW/evjcr5KMNl9Nd9PPqvP2HY7vewENmtCcANuIrD0iqzBbWx+INNnS4arcfLfZz+rB0Q/z2KdMUxxo0jppKFSN+rRExXXbyBF4KHk8zBxzfzUD0ZmXO1xDLJJwNMYkaktI+VlM7RexPTJcSGnmMtF/VpB8bdoSbe82GmoRQlgskc57CkAb2/Yl21jIsJeEja6lR421KoU5YXUrZoRIAmc02AI8enbEMIPh/6aqAh7kec8zO/dScQSdp+1ZXSX3/Do+sN8vWbc0DlylljP4pvdoI+/Cql+oc4HPfXD3t3aojlKMX6hwNHBnHSxEhKZtjCur0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(376002)(396003)(39860400002)(186009)(1800799009)(451199024)(41300700001)(38100700002)(316002)(6636002)(66556008)(66946007)(66476007)(82960400001)(26005)(1076003)(478600001)(6512007)(6506007)(6486002)(6666004)(8936002)(4326008)(33656002)(5660300002)(6862004)(8676002)(86362001)(2906002)(83380400001)(66899024);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x4lBWf6HZCdsQb9xV15GMaqlswLRoy6+fXcQ6I58Ziq9eb2lR1eCJX5o27AH?=
 =?us-ascii?Q?C3P2Z55V7agJT9uA6lpPml9fJ2SDjxKr8ewl+PP++x+YFLfTRSpGuC3DCFfV?=
 =?us-ascii?Q?vObE+Q5aSOD6aQrFqIKmGvXwzRdZJid73LZvtqKaV91BAF1J8qMWXc5vJd7K?=
 =?us-ascii?Q?7ylf+22G2LHJrtHrOUt9CC/RikV0Ep4yXlgmmz/N28gsL/sWyRMZPj6Xaj7i?=
 =?us-ascii?Q?jA5Un7+fi3AzI7Ur2NX0PsPhUhZx81AIcrFAcr6NuZrylnVjQi5wYI4irofr?=
 =?us-ascii?Q?9JsVWetQFxWTWhOzNs36Pe3GE6na5Y9ZnQL7X2r0fMe9tvVY5cVS5fFJTIY6?=
 =?us-ascii?Q?ZPM3pA1VsQHzz1SvGBBWrYOwmHGJkOegRiQ5HPJ+SzlZj8VmKDC/3x7UORLZ?=
 =?us-ascii?Q?CoZCapf2ZlSw7dee68FinjFdZXWAHa9mm9skYRreey5YRiU1bjU+EeWlert8?=
 =?us-ascii?Q?PEE0P1f1+YUGTcKwBjhRui1+m1d15pBBoplXPAQXfTOasz9ZdQuKpGtAXNz2?=
 =?us-ascii?Q?nWG6VwvAko8eWo9qqRfAcKMNjTM8lLakdDR7ycQ2UgI5U8Zkrgs4NI+C2TJB?=
 =?us-ascii?Q?MW0i+Rq/qDDPQqvh7/IIk6Av1puPPivB2H+kUMPDLstq7wPpeeb5D9ZhMDGw?=
 =?us-ascii?Q?n2B8TifX3iOIcl+rrrQ+Iwgn8F+nzDs/v8JJzOT6PEawNJ9gZIXG6TxNIiAx?=
 =?us-ascii?Q?2jviuZli/9neGCxaTNPPJCx6pKubg3//XzOGYN8nfuOn0kfF3HG1cneBRm2l?=
 =?us-ascii?Q?XaNbSNgZqUKzRD2W+xRPJyKSD/MTJThAlOfpgjuoVhpUpCKerAK/T+46Jlm9?=
 =?us-ascii?Q?Lmmz3/dQdYozuW6Drs5jETe4ZRs1IlorHqGLLsCUMQ6A82stzWSpbuonsP3Z?=
 =?us-ascii?Q?htNQv+UrZiMs1BYb28NVSJ/eF5tCQpqYvbF4CIkc/laMuT5GOXonnzt4AsdB?=
 =?us-ascii?Q?QPq2XH05V2x0TT60TdAMwo/bfFFCP7r0zS2apwwnqz3FksJ49v51WA0cxPQX?=
 =?us-ascii?Q?yEniYyxHXRfYRDSd9L/buf9OZQvw4C1wwuTgV+WO6oRN7IYTcFG/Lvn7kQ94?=
 =?us-ascii?Q?sxN2FBKfZYn9OhYtgjG8S5WniQ1qXZQ9anTa6JSWDz/g/iCvVqIrbRtEQ5cz?=
 =?us-ascii?Q?6x7/kkT97rSzdMBmFRwggzHxmwtYlEBjKWf6IMrxxSdodW4h5hlLCAuAuClH?=
 =?us-ascii?Q?uPvqzPiDJvKpXY6LkIjCfWO/XqjdiRiApK9W5CzfDiut3qY33CvU+uOCJjMk?=
 =?us-ascii?Q?ZR9bLXO36VWsVcmvp77lXSmkYu7ymoXwNyV0b4IJyppa7/T/cYeeq8zB/dXZ?=
 =?us-ascii?Q?P6oSBIfZYUZPiI6avNZxCMUxRUmEdTwtoFRu/7U1u8Haro8c5CKASPiM5M/m?=
 =?us-ascii?Q?VbFA6aujkT4qrNO8d3crwaLTh11Ym8Y8qAmOXhOH/OFEzwqIKSCsgI0GDLYx?=
 =?us-ascii?Q?LYVP56cuE4AuHMQQRy9oMQftPNBP+pY+x8QoKgS+hAqAJkDvfvMcO3rpdXfZ?=
 =?us-ascii?Q?5upP3Ufv/lzjmfvM0tLzLyv+bfkb91Vj/7WfkR6EgeBonL72CdQj6CpcMJO1?=
 =?us-ascii?Q?6APJLhM4xEgQK95WuD0WfWSfNxe0CtC0xOqTCiIx1sDVgCsle2gujOyW5AFo?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e31b5e-7a4c-4f8b-49c9-08dbae44350c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 19:13:37.5668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0E7s2aDyL1P91P5qCRf1HhUvjiEU1QRhjFMa5JynvsTupgmZEGD+mqcGWbWOnEo6uS2h1fpRcxIhKvrtk5YABlJOph5awg0X2RCq/6jTTsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7402
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Fix LRC workarounds
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

On Tue, Sep 05, 2023 at 11:09:42AM -0700, Lucas De Marchi wrote:
> On Tue, Sep 05, 2023 at 11:01:51AM -0700, Matt Roper wrote:
> > On Tue, Sep 05, 2023 at 07:31:44AM -0700, Lucas De Marchi wrote:
> > > Fix 2 issues when writing LRC workarounds by copying the same handling
> > > done when processing other RTP entries:
> > > 
> > > For masked registers, it was not correctly setting the upper 16bits.
> > > Differently than i915, the entry itself doesn't set the upper bits
> > > for masked registers: this is done when applying them. Testing on ADL-P:
> > > 
> > > Before:
> > > 	[drm:xe_gt_record_default_lrcs [xe]] LRC WA rcs0 save-restore MMIOs
> > > 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x2580] = 0x00000002
> > > 	...
> > > 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x7018] = 0x00002000
> > > 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x7300] = 0x00000040
> > > 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x7304] = 0x00000200
> > > 
> > > After:
> > > 	[drm:xe_gt_record_default_lrcs [xe]] LRC WA rcs0 save-restore MMIOs
> > > 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x2580] = 0x00060002
> > > 	...
> > > 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x7018] = 0x20002000
> > > 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x7300] = 0x00400040
> > > 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x7304] = 0x02000200
> > > 
> > > All of these registers are masked registers, so writing to them without
> > > the relevant bits in the upper 16b doesn't have any effect.
> > > 
> > > Also, this adds support to regular registers; previously it was assumed
> > > that LRC entries would only contain masked registers. However this is
> > > not true. 0x6604 is not a masked register, but used in workarounds for
> > > e.g.  ADL-P. See commit 28cf243a341a ("drm/i915/gt: Fix context
> > > workarounds with non-masked regs"). In the same test with ADL-P as
> > > above:
> > > 
> > > Before:
> > > 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x6604] = 0xe0000000
> > > After:
> > > 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x6604] = 0xe0efef6f
> > > 
> > > As can be seen, now it will read what was in the register rather than
> > > completely overwrite the other bits.
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt.c | 42 +++++++++++++++++++++++++++++++-------
> > >  1 file changed, 35 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > index bd307770a620..6dd3cb5d8246 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > @@ -114,12 +114,21 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
> > >  	return 0;
> > >  }
> > > 
> > > +/*
> > > + * Convert back from encoded value to type-safe, only to be used when reg.mcr
> > > + * is true
> > > + */
> > > +static struct xe_reg_mcr to_xe_reg_mcr(const struct xe_reg reg)
> > > +{
> > > +	return (const struct xe_reg_mcr){.__reg.raw = reg.raw };
> > > +}
> > > +
> > >  static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
> > >  {
> > >  	struct xe_device *xe = gt_to_xe(gt);
> > >  	struct xe_reg_sr *sr = &q->hwe->reg_lrc;
> > >  	struct xe_reg_sr_entry *entry;
> > > -	unsigned long reg;
> > > +	unsigned long idx;
> > >  	struct xe_sched_job *job;
> > >  	struct xe_bb *bb;
> > >  	struct dma_fence *fence;
> > > @@ -130,18 +139,37 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
> > >  	if (IS_ERR(bb))
> > >  		return PTR_ERR(bb);
> > > 
> > > -	xa_for_each(&sr->xa, reg, entry)
> > > +	xa_for_each(&sr->xa, idx, entry)
> > >  		++count;
> > > 
> > >  	if (count) {
> > >  		drm_dbg(&xe->drm, "LRC WA %s save-restore MMIOs\n", sr->name);
> > > 
> > >  		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM(count);
> > > -		xa_for_each(&sr->xa, reg, entry) {
> > > -			bb->cs[bb->len++] = reg;
> > > -			bb->cs[bb->len++] = entry->set_bits;
> > > -			drm_dbg(&xe->drm, "REG[0x%lx] = 0x%08x", reg,
> > > -				entry->set_bits);
> > > +
> > > +		xa_for_each(&sr->xa, idx, entry) {
> > > +			struct xe_reg reg = entry->reg;
> > > +			struct xe_reg_mcr reg_mcr = to_xe_reg_mcr(reg);
> > > +			u32 val;
> > > +
> > > +			bb->cs[bb->len++] = reg.addr;
> > > +
> > > +			/*
> > > +			 * Skip reading the register if it's not really needed
> > > +			 */
> > > +			if (reg.masked)
> > > +				val = entry->clr_bits << 16;
> > > +			else if (entry->clr_bits + 1)
> > > +				val = (reg.mcr ?
> > > +				       xe_gt_mcr_unicast_read_any(gt, reg_mcr) :
> > > +				       xe_mmio_read32(gt, reg)) & (~entry->clr_bits);
> > 
> > I'm a little bit worried about whether this will continue to work in the
> > long term.  There are definitely some registers out there that we can't
> > read properly from the CPU.  Maybe none of our current LRC workarounds
> > target such registers, but they do exist (I have a vague memory of
> > hitting this on some old pre-production PVC LRC workarounds I think).
> 
> but were them also non-masked?

Yeah, it was a non-masked register.  I think something like BLIT_CCTL
maybe?  Anyway, that was an early pre-production only issue, so not
relevant anymore.  I'm just mentioning it in case we even run across
something similar again in the future.


Matt

> 
> > We can probably go with this CPU read for now, but maybe we should leave
> > a comment here that we might need to switch to a GPU-based approach at
> > some point in the future if we run into CPU inaccessible registers.
> > 
> > If we wind up needing to change the approach down the road, I think
> > there are probably a handful of possible approaches:
> > 
> > * Save the default_lrc without applying the LRC workarounds initially.
> >   Read the in-memory contents of the LRC to find the original register
> >   value.  Then submit the LRC batch and re-save the LRC with the
> >   workarounds applied.
> > * Submit a preliminary batchbuffer with MI_SRM instructions to save the
> >   hw-default register values to a hwsp location that we can then pick
> >   up and use when crafting the MI_LRI batch.  Or update in memory and
> >   use MI_LRM instead.
> > * Use MI_MATH to perform the desired bitwise operations on register
> >   bits directly.
> 
> yeah, we've had the same concern when doing similar fix in i915. From
> all of the options, I think the one doing MI_MATH for the very few
> registers in the category [ non-masked, can't-be-read-from-cpu ] would
> be appropriate.  I  can take a look on doing that later, but I think
> it's more urgent to fix the outstanding issue we have right now of
> basically not really applying most of the LRC WAs.
> 
> > 
> > Anyway, we can deal with that later if/when it becomes necessary.  For
> > now,
> > 
> > Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
> thanks
> 
> Lucas De Marchi
> 
> 
> > 
> > 
> > Matt
> > 
> > > +			else
> > > +				val = 0;
> > > +
> > > +			val |= entry->set_bits;
> > > +			bb->cs[bb->len++] = val;
> > > +
> > > +			drm_dbg(&xe->drm, "REG[0x%x] = 0x%08x", reg.addr, val);
> > >  		}
> > >  	}
> > > 
> > > --
> > > 2.40.1
> > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
