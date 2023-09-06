Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D5FEE14AA
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 22:37:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128CB10E1E1;
	Wed,  6 Sep 2023 22:37:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF99B10E1E1
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 22:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694039838; x=1725575838;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RwoKlgRbiQjn4WzFdEGgEHAIThvPXtokvK7nVLliXAQ=;
 b=L9NFzgK6fM+ZdqNxN+fUccb2R4wHLq+P3fw8d3nYTw3JdjZGErPyh1/q
 QbLKgUkd35c304KcuGQmpRhuokBwOm+Wc0V8imuWg1yLAw3U/pWwPF1AO
 +ggwJnmKOgCTYuiwfFKtbCRqaTKvc1HGFhJi/x7TKc9qElpnrzkLeIewk
 83aa9NABv6LKqrE3cUKsBq7/O3upU6cSpOxCsctO9QH66HZ2Fq5aOxD34
 z9HWUidYuetqaEuiNOBcpSXYi+72sMHMUr9I+JqCgZ5Eu8BWqzbI3i7zu
 ckgMNPLTgU+hkUFVAkTpaNnZ76ZOa6SpDF/RxSsogXPBpaEqCz0biBN9i Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="380994908"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="380994908"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 15:37:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="691492115"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="691492115"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 15:37:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 15:37:17 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 6 Sep 2023 15:37:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 6 Sep 2023 15:37:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 15:37:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9Cch+TLxvpdkezHBSKlYVKGwN9enjuKXsFV+Ukd4apKDJULs853NaBcQ2p8ydwYuXpEKO4Vpya0/ehKi0y/UrS0DEalQGVzquoN6gsxV19XPxxwDalqbdXBpVzfdbcdrmWb74fzJ2qb8Ibk8V/CiPyuwtSXyTVhOrxlHXtl9IzY3YIQd2RBKP/Gp4v0H8xILkiQ2B7UhUwOyDxkpYNMnUn2avMuVtycz+W96XwXO+s+3GpA4qgp2H0TEzb7YArLfT+0ASKybAtIUr2LL6RazHvVjwyNTYXQEyKjOhESxhJU50RPXcVNcX0Q5ixrMuD9gJ2ge9z/GTp2P9t3r9JkkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JK3Z1sJLz7W6ckGyLX452CE3PF4VI4qLok5NG95v0cI=;
 b=I938p4x8tXty4abXKVX3p9OzZLAJNlZTbzL1PqgO3d2lbKE+on5LJceGyXIPyd67G0mMG6H6JuRPrdZ0TZkQKh5Tk7G1+8+i/W1VhGAZE/ZQe4Pvv+suBcPTXBzWyZWgFQ2ZZ/VdAfszwzUn962ceoViWKWmfB00wMnGM1/Fg/FXXLnetGRhdr/K6V9bp+y0VfHU20ULtyqIh1vNQbSuofKNB0WZIIWi11nfZ77t3zzRPy1J8/ekg7FT4PSdTWnWVKuJeN699IXwgYyp0U7K3JH45XWxrouR6SEy4RVEp8aVtyq8wFuUBbrA1BqvTDfU7+XtUwn1iwdVvdfub2nq6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV8PR11MB8510.namprd11.prod.outlook.com (2603:10b6:408:1e8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 22:37:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 22:37:12 +0000
Date: Wed, 6 Sep 2023 15:37:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <gkavxk7hvvi76da42ixme2cotl25phpdb7xizum4wknrm5uixe@42dnbwji3dbf>
References: <20230906012053.1733755-1-lucas.demarchi@intel.com>
 <20230906012053.1733755-5-lucas.demarchi@intel.com>
 <52792f8588ccb9e6dd05e79174c74ca1cb88e91f.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <52792f8588ccb9e6dd05e79174c74ca1cb88e91f.camel@intel.com>
X-ClientProxiedBy: BY5PR17CA0072.namprd17.prod.outlook.com
 (2603:10b6:a03:167::49) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV8PR11MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: 107034ec-1be8-4d92-01fe-08dbaf29d04f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K2YwJxY5k6V722pweROMj/RP9G5Y5qDv3yjf5QE5wntPahCo2dB+5CcEQlPfvNal5m/GobirLKiizCq4rifjo5H05MAbJtFbZ2SxOf46Inl2Q8Yh+IN4O+0E6Q3QbUWl1tvS7HMh1NTaLCBRixxKEhhYBuD8JkYOOoT8aSvr/txHJ3SKysaZMcR+oI4tWIjChUH00YVcKP6AQFqkcTuAs3197hkFlZcZZG29H/w3BxKapKSaRIrkT19qGmtI7SM85XDvaMak+JqSa8DlBudolikTcst4+/H2GYsUG5lmVeAPNpXNc3dr0hlzziR393rrpbxbFIpeyZUrispTXYKa0z+hmoLrV0ATD9+wEzOClujyT/f9n7VDPqLZhw2I6MVbsV3OCbbMuG9liOZUX5M2WbFhHqgk71hx240Q2J1Lla4OSPY9w1TuLpXAkV8RH510RndnoPhV1gtM30V6fQOfUqTrwC4+VaNXNnb7isZ89wzv2ephjZX+Bv4rZvsXeBjy/I7AhJ4ttcE3DkMJtutGzfpOjNFvbuOi9/+CUrZ2seE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(136003)(39860400002)(366004)(346002)(376002)(1800799009)(186009)(451199024)(86362001)(966005)(478600001)(54906003)(66946007)(66476007)(6636002)(66556008)(316002)(2906002)(41300700001)(5660300002)(8676002)(6862004)(8936002)(4326008)(6486002)(6506007)(6512007)(26005)(83380400001)(107886003)(82960400001)(6666004)(38100700002)(33716001)(9686003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MuOVP/shQ5YQPrIxwLY2FWxh+rRv44B0iPKiH7ifsvmPaKmcyMCnLYhO7uDG?=
 =?us-ascii?Q?XsTDlvmltzQhTJIIe/H5tIGqdzO7tF+2PTNlzQXpQHJny7HXPo6mP93z3lw1?=
 =?us-ascii?Q?F/BtKXzF8ruyC9GOyLAy5OmGpFyZdzu7dmNd94x/Eox5n6DBV9AjCbYUtvr+?=
 =?us-ascii?Q?ANIeQidxXuVxKb1jrH2Qu7ah3Brch6yQNzq9/02EAk0DIcAc4OtbK2ZHFST8?=
 =?us-ascii?Q?tRWTDhhKRrwj0CTwJ1IryxIsv/Zo6f/UF7WhDgXrenCtYlGV5B1s4pRv8cZR?=
 =?us-ascii?Q?PLTwZWpbd9Y7YIhf8qeIKtfXfngD87lpC5B7f8Jjuw34dno7yfM1NDsI6Mgm?=
 =?us-ascii?Q?ITMeCrCTifhYe1NdQyyhqkjwqoa6biCl9ECH1gGKritXC7lG+nRwS5X1Kgkk?=
 =?us-ascii?Q?oaZHdDpuivBl1L+5bITOTAsUvAYDXnF9DIltHwBGsocnsomAhENvxLSyHmTS?=
 =?us-ascii?Q?egmpqepJt1IvdHEDfO0RDdWdlj+sw7dt5AKfLwtFJ+2fbFOf8lMx6EByzTJO?=
 =?us-ascii?Q?Td8cEs1sJfORWQkigbOGogY3usdlcSkuoGp6EMQO0guVe69LYqU55dd4w8LF?=
 =?us-ascii?Q?DitWkqTeD8um5z3kElu6M44tejFjEYBLYZg6nkQ0KldamLdRLGZDY0R5K0mS?=
 =?us-ascii?Q?HNJKQvMma4bXvQo9YTgpUnxtHXCmF6xspvPHhtmxmOjBJSZs5AUTxySCbncP?=
 =?us-ascii?Q?DvhQ17wSZJyt3x0IHxpHOC4yuLEJbVS/z85EA7zsgYr97kP49MJTSbk19Tsb?=
 =?us-ascii?Q?3HyN6nhTJdo3I7jm60oL+p2OVZ/SIraJERRT78wetFvA+jI1ftnyGin/Dxeu?=
 =?us-ascii?Q?ZmriNtuuvhmge+lms618/9PDlH2x1wotHNADEa2dE5OMDQd+iP1xdjbnNIdU?=
 =?us-ascii?Q?IAPK1o3M3TptDUzkwdBbvfZfKC5a/YbD7HZcA9hmFSdDNlBmNQgJgcs0jo/H?=
 =?us-ascii?Q?yqEp+vKFFqyHMnpoopNpC/nbtN/R8kaDthse9CTQladyiEII33skbjCQSLG/?=
 =?us-ascii?Q?twrWxsJNCazn32T9FXNYF1V5j7pJgEVLcDiHmazsN4NaFNKDUN1j1mlmnWny?=
 =?us-ascii?Q?BEMHHg3fqJPffxnUtqERbINzYPDV7xzJsg2Z69pEFVIrAb0CghgtkBYNcFlf?=
 =?us-ascii?Q?Bsh+6eOCDsC/WWwW1hCtvrNuyRUOvuZwQeNF8sQSspI+IPtBz00l9ihCjj6p?=
 =?us-ascii?Q?CLzNkvSAH1h+M0PIfs4rEQo9F4c53t2MXoSuea7Zig2imTMwqQXVx6gUaU1U?=
 =?us-ascii?Q?I+jb6AKNlcXNITRx6U2hA/YzwhzJX3VY3hY6voKcOIPt6thLTqqZKTEHRJgH?=
 =?us-ascii?Q?v366A7jKQ30khTnO4puzrcG7V6xR8ZOBKXGsUtNVn/5gCvCpW2eO6lNspaJD?=
 =?us-ascii?Q?XIBlcTwm7D358WU7TszoJfjaU5PtAE8K3w69sdiPobsb+7K77LvG0z1mKaCi?=
 =?us-ascii?Q?tlWTewYzVBTQJn+KFtl8HhIzhoPwgV4WXkQbM8xItKm772zEgHu/NOSPgyQp?=
 =?us-ascii?Q?l865h7HRBW3w/G+QuenylP0a9wb4dApoY8lSfqkWSp75Vsvge2y9x4jOqaU3?=
 =?us-ascii?Q?UqQ8uGAdQQ9jGavaaM++E/AL62as2uoMooWpFuklwR0aP/MMhZb9FKVyvTf8?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 107034ec-1be8-4d92-01fe-08dbaf29d04f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 22:37:12.8842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ZLpGa5VdSNJOWgAtiGiQqKoHgf6hsq0Uptf3OBnCS56SFRBthom0sNOyj2Xm7lsOUQBRpR349skK+Njz0bhuB/fXCLcbpL4A5wGlALVDuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8510
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 4/4] drm/xe: Fix LRC workarounds
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Sep 06, 2023 at 04:46:02PM +0000, Jose Souza wrote:
>On Tue, 2023-09-05 at 18:20 -0700, Lucas De Marchi wrote:
>> Fix 2 issues when writing LRC workarounds by copying the same handling
>> done when processing other RTP entries:
>>
>> For masked registers, it was not correctly setting the upper 16bits.
>> Differently than i915, the entry itself doesn't set the upper bits
>> for masked registers: this is done when applying them. Testing on ADL-P:
>>
>> Before:
>> 	[drm:xe_gt_record_default_lrcs [xe]] LRC WA rcs0 save-restore MMIOs
>> 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x2580] = 0x00000002
>> 	...
>> 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x7018] = 0x00002000
>> 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x7300] = 0x00000040
>> 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x7304] = 0x00000200
>>
>> After:
>> 	[drm:xe_gt_record_default_lrcs [xe]] LRC WA rcs0 save-restore MMIOs
>> 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x2580] = 0x00060002
>> 	...
>> 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x7018] = 0x20002000
>> 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x7300] = 0x00400040
>> 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x7304] = 0x02000200
>
>Would it be too hard to test if LRC workarounds were applied correctly?


not very difficult, but needs some hours of work to get it right.

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/668

Lucas De Marchi


>
>>
>> All of these registers are masked registers, so writing to them without
>> the relevant bits in the upper 16b doesn't have any effect.
>>
>> Also, this adds support to regular registers; previously it was assumed
>> that LRC entries would only contain masked registers. However this is
>> not true. 0x6604 is not a masked register, but used in workarounds for
>> e.g.  ADL-P. See commit 28cf243a341a ("drm/i915/gt: Fix context
>> workarounds with non-masked regs"). In the same test with ADL-P as
>> above:
>>
>> Before:
>> 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x6604] = 0xe0000000
>> After:
>> 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x6604] = 0xe0efef6f
>>
>> As can be seen, now it will read what was in the register rather than
>> completely overwrite the other bits.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt.c | 41 +++++++++++++++++++++++++++++++-------
>>  1 file changed, 34 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 9e226b8a005a..678a276a25dc 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -114,11 +114,20 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
>>  	return 0;
>>  }
>>
>> +/*
>> + * Convert back from encoded value to type-safe, only to be used when reg.mcr
>> + * is true
>> + */
>> +static struct xe_reg_mcr to_xe_reg_mcr(const struct xe_reg reg)
>> +{
>> +	return (const struct xe_reg_mcr){.__reg.raw = reg.raw };
>> +}
>> +
>>  static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>>  {
>>  	struct xe_reg_sr *sr = &q->hwe->reg_lrc;
>>  	struct xe_reg_sr_entry *entry;
>> -	unsigned long reg;
>> +	unsigned long idx;
>>  	struct xe_sched_job *job;
>>  	struct xe_bb *bb;
>>  	struct dma_fence *fence;
>> @@ -129,18 +138,36 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>>  	if (IS_ERR(bb))
>>  		return PTR_ERR(bb);
>>
>> -	xa_for_each(&sr->xa, reg, entry)
>> +	xa_for_each(&sr->xa, idx, entry)
>>  		++count;
>>
>>  	if (count) {
>>  		xe_gt_dbg(gt, "LRC WA %s save-restore batch\n", sr->name);
>>
>>  		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM(count);
>> -		xa_for_each(&sr->xa, reg, entry) {
>> -			bb->cs[bb->len++] = reg;
>> -			bb->cs[bb->len++] = entry->set_bits;
>> -			xe_gt_dbg(gt, "REG[0x%lx] = 0x%08x", reg,
>> -				  entry->set_bits);
>> +
>> +		xa_for_each(&sr->xa, idx, entry) {
>> +			struct xe_reg reg = entry->reg;
>> +			struct xe_reg_mcr reg_mcr = to_xe_reg_mcr(reg);
>> +			u32 val;
>> +
>> +			/*
>> +			 * Skip reading the register if it's not really needed
>> +			 */
>> +			if (reg.masked)
>> +				val = entry->clr_bits << 16;
>> +			else if (entry->clr_bits + 1)
>> +				val = (reg.mcr ?
>> +				       xe_gt_mcr_unicast_read_any(gt, reg_mcr) :
>> +				       xe_mmio_read32(gt, reg)) & (~entry->clr_bits);
>> +			else
>> +				val = 0;
>> +
>> +			val |= entry->set_bits;
>> +
>> +			bb->cs[bb->len++] = reg.addr;
>> +			bb->cs[bb->len++] = val;
>> +			xe_gt_dbg(gt, "REG[0x%x] = 0x%08x", reg.addr, val);
>>  		}
>>  	}
>>
>
