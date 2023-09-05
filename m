Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F580C83F3E
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 18:10:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00D810E2FE;
	Tue,  5 Sep 2023 18:10:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7502410E28A
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 18:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693937398; x=1725473398;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oNzbA42WqAEKCSA7qMzPs1Dn1+btT9vlcBnIkIELdkU=;
 b=T0spNywANVsN0Kbmq3zfHSKzeEL51BFpUF3m+OtvtNr+zSdCukU6O9li
 2tivECTtk4cyBVy3bOgDl9eByygDffcke9w8dr9qtRqYikti+/LGGMK/q
 viFVoMELAxoaYZ5KQijLA8zi7mcKI/6TsLGx4xHMLXR7RWvSLmuaFOA6m
 1TYtsIJ9dhp024XXhZDtjiE63zuERnzWQfQYSsLp+0N3Uz28gjRcYtHNa
 LBpmhl1ruHv4IA5Xc4LTeCWzWIl932Kf9oZ1Y1mwxooqyXKVb+Cke/F2S
 86GDQpuoJxJjWf9CXSDb2jQ3MkA1GZRwtJd8RkVGdd3RMTWB2vboYXssi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="374259959"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="374259959"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 11:09:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="770410105"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="770410105"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2023 11:09:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 11:09:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 5 Sep 2023 11:09:56 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 5 Sep 2023 11:09:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCKWsWAr3r3mYax46gTMaraFGfUf8Lfo2cWA1gzpSZk7aUXW3+wMKPviyYQGEEAFp2fNF2Qpmeddi17+6NAXgMSz08NVfGZi9l124d5TBijwP7iV+G4OZBosidsAnVhYcjdyRqDLH/4QpCWcOnVldoSJJZ+XnAT6Vjnn5ilxUcxSOvYeIonjRFCa9XVVq/KBwyAYOP5LJuqkb7G7SK+u/fKal/wOy/zRdc0T82Mh+D3LIS8ePZtI9N2pK33umDxcEY2qb4fqcf8mEvpV7NzGlTqm4UhOrTyEDKHlYsLXHHyVUtn/g1g5mlx0N4w36Iml6NdaE8wB698ZT1LETSzOWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utVNgG+QCwp88jy1vqGmci50Xf3grlpUpr/e+qixOFs=;
 b=GAjF4Gba1LdGjWDnlURIgwaxuUVNuyimaTrHbxvSp5vsBod38RbpXX/u5u2Ecc0x3DpFeOWtv6rX6XIPYnskgCmHqFXdpe+KL1SIFdoXUz3lPF54x2Qo3x2055OPsSuHS2W1Ic7r37MCOiXPsWoj59WHEwVcT1fYO2HDNxGCaKxzCm8fH/Er1ZvcIYmCowJlp4eERh6m3zXfgzjCAoQCo1MI6IupsP2KjzMbw09nVIoJk8XNbhAtFP4wJDk/edsOLVLTrcw+4ckTQDUud+uewsUNhAtdAhMq9c6VhsQcjaAQrCIJkkszo24mquk4ieOTs6lsxzvqrhpbKGfW8bMK9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB6398.namprd11.prod.outlook.com (2603:10b6:8:c9::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.33; Tue, 5 Sep 2023 18:09:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 18:09:54 +0000
Date: Tue, 5 Sep 2023 11:09:42 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <dlz7e5if3d75z4foqtxs2gx7t62zeduk3j4cikghiefzl2b3bb@jmvqsloyy5st>
References: <20230905143144.1706967-1-lucas.demarchi@intel.com>
 <20230905143144.1706967-4-lucas.demarchi@intel.com>
 <20230905180151.GD2706891@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230905180151.GD2706891@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR01CA0069.prod.exchangelabs.com (2603:10b6:a03:94::46)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB6398:EE_
X-MS-Office365-Filtering-Correlation-Id: a8de8a49-0b2c-45db-61e3-08dbae3b4e32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ey8PnXKFSZL9nNEx4sVwCur8rnOtsUzkVliUxRhaprgq3OXwV87FRC48+7VWa+Kcv1rfXEeB9xp54t0oMBAysbyRXDRV5ecz/6ASWoaNjqy4x9kreszbhlTGfpw/3P65Pw4cfmpN+jYixAzq995DwlY6POvc8eolN/a+9kRT9h48a/MotsfM+e34knllbiBAQnihoBkw/oJQLFpesOtUG/WAO2dAjsXTO7qhHeX/Y3IVh/xCQ6zgF/DQKJr1X5PkD7KIUou0TMLr0+YCunYm5rmii8gi7iVhlscGw1R8qIwyDHP9uJtE1P8R86PJs68AENQPwGjdN0uvKEHcsSKFWnb3W22H5LifXdynrVHBv5I5BK2WG/qoUvxu84eTZjegPjL96oq+wyH+bQSCpPef8xwvl1oiduJrwZRCt5LdxSjXSzOCu1WrPo/+oOuKHS1Qpn9YMBJRARBJxUEZLhLsIGL9scBK/YguYm42DRNNBlp/QqCDr+ixirIPHgRaTrv8Gw7NOyHsx2SMIAs5gvUxs9bDqUyF8Jx2bOA7FCK1dtatnlbZ/R4umAxrWafKFIqA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(376002)(366004)(346002)(39860400002)(396003)(1800799009)(186009)(451199024)(66899024)(2906002)(82960400001)(38100700002)(86362001)(33716001)(4326008)(6862004)(8676002)(8936002)(6666004)(26005)(5660300002)(41300700001)(316002)(9686003)(66476007)(66946007)(66556008)(6636002)(6512007)(6486002)(6506007)(83380400001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2B4vJiSICDwXqB/vwO6CE6VG8PZeSKPWHSrhbM46jO+i3Z8d+YGD/ia055uA?=
 =?us-ascii?Q?tF82mYisb51SoxWnuWJANRiqSrJZypW1TlYbcKKliE4fsowsEWWN4AsaGaQX?=
 =?us-ascii?Q?3TG/txV5s6hupqwnvKmYn3P5NFUWqRnMqObZAFvya3ovJl7uH+JUCRkA8N3+?=
 =?us-ascii?Q?J42ZpI2Df8spmfmIqj6nv6CaD5B+tZ7Npayhl5EmzDfoIaqVZf34ERSYomkN?=
 =?us-ascii?Q?/jsQX5sKjSAeZ7xOPLk0m5Here6abdVAS9glQi9Ls9an/+iDsg1SACVRAhs6?=
 =?us-ascii?Q?BOdVoTv09HMShaifNoCqM8UUe66FAVLiMyEhtPJ5Bls17nGmzYFH1C8/op5P?=
 =?us-ascii?Q?TTVZEhfOqpeFb665ELm316xQglWFGRNLgRJ9b/IjM73wNSaczN49lAir7kUW?=
 =?us-ascii?Q?EXC7h4DaFvY6K4T6xYtS4RpW3XdXvX6xx4zhFO8eu5nBpToILQXTGPq+65l/?=
 =?us-ascii?Q?xZp95Miekyjgcp9Mq5Rq/rYCHdNOXeDMcI+RRaeaKtIg4TAxDYHWOjCKtbTC?=
 =?us-ascii?Q?1dq6AnVaRS2/98TDf6tYWGzdLA/ViXGPHz3M4LeH0LArZY8pFuTPnMMHxiHN?=
 =?us-ascii?Q?xKYV1dE61CoFXPw6qQZFo3DTAQ/kx8uN3jNeh8Z7w6t1FzEztaPK+aMN49vt?=
 =?us-ascii?Q?dstmb6lEnoDwrtCCGEyM/o17IRadbTX9KL5s+AtRCGZxBN9Jek63cOPgus7w?=
 =?us-ascii?Q?xtYOkjHKgph8UWZEB+CSDc6eP5eYwx47PLIyyu0CBTdmkiMMuX6Uz7+qbrDm?=
 =?us-ascii?Q?GAOAHPkcZhfCf97zSPaFNN9pBTOucSO++hHqWE61Kvyg+Xihlhqw6O4f5Hfu?=
 =?us-ascii?Q?p/pBkk/aBNtbK+Fb9vbtkPZlzUphd6DgYZSD4E/35TMlG0RdEsAxTSfPylHJ?=
 =?us-ascii?Q?GhMk+ghcqZh1pbZShOd5zN5R2PeZVUpGs3KqJHDKd11M/dnbQPR4c9m69d52?=
 =?us-ascii?Q?aUt86lbnnXB6CVD+XX6QR+G3hGTBtNicjy/OELkr5HqWP91xETZWBDcm0OYg?=
 =?us-ascii?Q?d07qD+HbIbD1ZTi3kUzulBXOAHHRAI/HiPyr/LAAwhrhEHsVW33EFV3aAXXS?=
 =?us-ascii?Q?XiCfUSQ1WpxpBi8qLwj9c2mGSqbLgDuFAVOEIb5cVv8cnuzmF+9nitlvNT41?=
 =?us-ascii?Q?Gg9E6WXDzAJJVYhZaqZDnBmj8YgH39VqYQ7w96MyJHx/O8QJHYVY9c3Jsm36?=
 =?us-ascii?Q?SS157S1B29kT5ruNhMJHa3h0k6oN2sfo3GuTtVNjQXOiJc8HEjifbMjrAW6P?=
 =?us-ascii?Q?6eWVHHtjIk1rR7azd/doh6pBqHB9wzd0T8haJTckXBhg2bGJB68ldVX2z1X2?=
 =?us-ascii?Q?wjy/GjtIT+e7ZEd8LibguXEL9uaU98Cq8xgcM63YT7DK+Bn7oMIiFfkkw9Tk?=
 =?us-ascii?Q?WeNr7qOLS7FipPbpeWV8Yrh4p+d7kFeE2ahKQrovtzI07Kg7aGc0NiHnrSQU?=
 =?us-ascii?Q?5s978gZN2FymA/uQZU51iVl+ReLtgV71MX6H8MtzSi6ePkfZ4AUC01hmWc1i?=
 =?us-ascii?Q?7Cry8+oPhBb9ryg4xVMO6hvEy6Jlolvjx5PH5WCIEtuT8k0bg3su2rEyGkuO?=
 =?us-ascii?Q?4Cg2hcYUq9qUJMbQ8bFrgisrWTNZv1/uehaM3Xm9a9ce3X/7TnphLZgopecq?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8de8a49-0b2c-45db-61e3-08dbae3b4e32
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 18:09:54.3100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qNxWdVwckPGNZ1iLkS/BF1VTvI7ZjbwPBYD+Mq3Xix8pY6XgkHT7ngZAiWhcd73d+f/oTAcUHTRBYsJqSk7KKRO5RcGWRCbxjuj6uqo7Jlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6398
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

On Tue, Sep 05, 2023 at 11:01:51AM -0700, Matt Roper wrote:
>On Tue, Sep 05, 2023 at 07:31:44AM -0700, Lucas De Marchi wrote:
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
>> ---
>>  drivers/gpu/drm/xe/xe_gt.c | 42 +++++++++++++++++++++++++++++++-------
>>  1 file changed, 35 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index bd307770a620..6dd3cb5d8246 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -114,12 +114,21 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
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
>>  	struct xe_device *xe = gt_to_xe(gt);
>>  	struct xe_reg_sr *sr = &q->hwe->reg_lrc;
>>  	struct xe_reg_sr_entry *entry;
>> -	unsigned long reg;
>> +	unsigned long idx;
>>  	struct xe_sched_job *job;
>>  	struct xe_bb *bb;
>>  	struct dma_fence *fence;
>> @@ -130,18 +139,37 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>>  	if (IS_ERR(bb))
>>  		return PTR_ERR(bb);
>>
>> -	xa_for_each(&sr->xa, reg, entry)
>> +	xa_for_each(&sr->xa, idx, entry)
>>  		++count;
>>
>>  	if (count) {
>>  		drm_dbg(&xe->drm, "LRC WA %s save-restore MMIOs\n", sr->name);
>>
>>  		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM(count);
>> -		xa_for_each(&sr->xa, reg, entry) {
>> -			bb->cs[bb->len++] = reg;
>> -			bb->cs[bb->len++] = entry->set_bits;
>> -			drm_dbg(&xe->drm, "REG[0x%lx] = 0x%08x", reg,
>> -				entry->set_bits);
>> +
>> +		xa_for_each(&sr->xa, idx, entry) {
>> +			struct xe_reg reg = entry->reg;
>> +			struct xe_reg_mcr reg_mcr = to_xe_reg_mcr(reg);
>> +			u32 val;
>> +
>> +			bb->cs[bb->len++] = reg.addr;
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
>
>I'm a little bit worried about whether this will continue to work in the
>long term.  There are definitely some registers out there that we can't
>read properly from the CPU.  Maybe none of our current LRC workarounds
>target such registers, but they do exist (I have a vague memory of
>hitting this on some old pre-production PVC LRC workarounds I think).

but were them also non-masked?

>We can probably go with this CPU read for now, but maybe we should leave
>a comment here that we might need to switch to a GPU-based approach at
>some point in the future if we run into CPU inaccessible registers.
>
>If we wind up needing to change the approach down the road, I think
>there are probably a handful of possible approaches:
>
> * Save the default_lrc without applying the LRC workarounds initially.
>   Read the in-memory contents of the LRC to find the original register
>   value.  Then submit the LRC batch and re-save the LRC with the
>   workarounds applied.
> * Submit a preliminary batchbuffer with MI_SRM instructions to save the
>   hw-default register values to a hwsp location that we can then pick
>   up and use when crafting the MI_LRI batch.  Or update in memory and
>   use MI_LRM instead.
> * Use MI_MATH to perform the desired bitwise operations on register
>   bits directly.

yeah, we've had the same concern when doing similar fix in i915. From
all of the options, I think the one doing MI_MATH for the very few
registers in the category [ non-masked, can't-be-read-from-cpu ] would
be appropriate.  I  can take a look on doing that later, but I think
it's more urgent to fix the outstanding issue we have right now of
basically not really applying most of the LRC WAs.

>
>Anyway, we can deal with that later if/when it becomes necessary.  For
>now,
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

thanks

Lucas De Marchi


>
>
>Matt
>
>> +			else
>> +				val = 0;
>> +
>> +			val |= entry->set_bits;
>> +			bb->cs[bb->len++] = val;
>> +
>> +			drm_dbg(&xe->drm, "REG[0x%x] = 0x%08x", reg.addr, val);
>>  		}
>>  	}
>>
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
