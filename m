Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67541C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 13:38:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABBBE10E1FB;
	Wed, 29 May 2024 13:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JRkN2blT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1984010E1FB
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 13:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716989880; x=1748525880;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gJLSWBeHTNYXybreWmrZKtTmY3vi7piVHjGENFpdvi0=;
 b=JRkN2blTlLIIdC/DTnNfzamu76zzGMq66VzMxh3Fkm9qurjM7J8IaC+f
 Cd5bRt4Wd71RVl9LqkL7XIulH1XQjKfV3kE2oIyClyHvvQVSOyb7EupKW
 UDOy2V+OeK2VCBhkrrSLMLaX2fJboHrpBeOSS1Bvnus+xBiWqs/aq8b8n
 VQi6tbXGHRJxxpOp80usGe5yn8SnUVlDgA2mv1gfeBkUeYCN/O0qN/uYQ
 COmbuBMPWAVhqcvwdtsOb+tHnQYjXnEeC2je40ybCKYusd5BhdtDuPFzk
 JuxyizRgYgk42TCWZkUMHbbQU6+iWdK1K4u0SzrnCsBltug8I8d05l3xc A==;
X-CSE-ConnectionGUID: 6x0VfLf+TdGq5YQjOTAdww==
X-CSE-MsgGUID: ChYrGxD7S4KXdNjCw+tgXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13519475"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="13519475"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 06:37:59 -0700
X-CSE-ConnectionGUID: Il3sK1BRSoKOSjs+pxlhMA==
X-CSE-MsgGUID: BnsDQ47PQgqSQQPLJU/kUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="35532143"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 06:37:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 06:37:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 06:37:58 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 06:37:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5pAcIb4Oguhr8Ih2pIsMz/TMopv/E3tSkbzUJMyv44mfBb/mkgK/5mHKOwmLFnPGf7Z7aGJzuKKvmxsg9QH2/0hYbS6M3Q7O/QP0wz7ZUqQIFCPel7jYyaDMPjEKnaQMvEH4tFpBJzaeHNNa3a0MFwHX3t4Lkag+cYNW8IRgLPeoOJKV+y/j5+YNbzUUzbR+QLL9tVVqI90zaxhDO4MISc0hzJAMB6vDViC953T25Uc081xHmSzfLNCuHAqnRiCsMmy+69g5AvxD+ZewxL4msbAul8IE4fFquyaxAHkChgn9AMMp80ctlkO3r9ozxgDGTg4yPoB9i4k7jonotK66A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOuUQyoIz2DCsbo10uo+ZBi4IkXSAj5kdF26XJK/JrQ=;
 b=Tj9lrvlYtSku8DEveeRZFfMj7JTI9Pw4RMf2prouXOl7/i3jvuuwAGYk+z0gcDAZ2r6AOyoWV1GXZF8bdCwaWzVmA+SvZvRvIB38yP6pH/LZ8WPV4p/xof1zJSb9xsU6/FBSx9Y+oi88uPHVfBc1V4f050+Z5Wf8fpP2sqj//ITfNBfiY11FE1rlBViRtpbfE2QQVZ0jXnfOOTLw5MmoHbJ8iRLUgZlc0zpPeopwzFMSLamc5fZECeETACe6KkfIPC1bobhybK4+E8ELnfr+3Jao67LPeqZNQgunpEtV+HL7QPbtcx5Eqee+fBOnKk4Jyuy927oi/yF24OzhZAoBvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6607.namprd11.prod.outlook.com (2603:10b6:510:1b2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Wed, 29 May
 2024 13:37:56 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%4]) with mapi id 15.20.7633.018; Wed, 29 May 2024
 13:37:56 +0000
Date: Wed, 29 May 2024 09:37:51 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe/client: Check return value of xe_force_wake_get
Message-ID: <Zlcvr0QeeLJzyjsB@intel.com>
References: <20240528101132.14788-1-nirmoy.das@intel.com>
 <ZlYSzzsY5xepVreW@intel.com>
 <b19e9d9a-50ba-497b-b133-78cae5caf261@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b19e9d9a-50ba-497b-b133-78cae5caf261@intel.com>
X-ClientProxiedBy: SJ0PR03CA0385.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6607:EE_
X-MS-Office365-Filtering-Correlation-Id: a9509267-6c98-4cfb-8f05-08dc7fe48bf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lL4vY1/gwrqw0FbBT/L9OrCK31QeX9UQx9/7nel89OTH8sZUPagKOya6a5Kx?=
 =?us-ascii?Q?brhvYnTnoHtjLbR9g8EMefVMJmPknMsXEhEsadsPKexkeu5+zDsxBqKDLlT9?=
 =?us-ascii?Q?5kTrVMuWiwPRolymFPNyKQKO1DXZEpXE5j1q7yhnaYSIP1tOb8yWJytcDV60?=
 =?us-ascii?Q?JZaRIChzSgrHnDiZUeNW/VIIWa3yQQctZnf0nf30Ue671RejYdpThvViRgYL?=
 =?us-ascii?Q?V3m9LrVd3Lm7IV9kizqjrJg8auqYu6cuvfqNXJmjeHpz/ctbAQqqrZw9oVtB?=
 =?us-ascii?Q?0jf98TCOvjhEmfM7YLz7i2+T1W2LOVOIGfkEgEpegQkRXV0yxJ+iWo0afMxc?=
 =?us-ascii?Q?WncBkIPeU47mHz0giahEBZztgrkXsIMGHh9MHXp10oXgaQsrpI892b7A/vqi?=
 =?us-ascii?Q?KXbArhxEgUtMHL81hD8ZaCreFcHtbfaPw8C3CH08Z8l35BZEZMVVvizLJC9z?=
 =?us-ascii?Q?8y5csW41jSJB87k4oiGXBD/+x6dmAjPEakx82u18C06oDJS2QPsdtc6QGkaj?=
 =?us-ascii?Q?3CEKViNoi/py1hlwcqpKO/CK9YD0aoIX0xZc7rE6eOrmbqFVGQxGnBJR6IUx?=
 =?us-ascii?Q?JXVVIznLpdC8I3N6NLd6DrKLGX6jjuG07UJ1KDyZN3iirhgUCft8xFN8Ig8a?=
 =?us-ascii?Q?ll+lSetCEw7oM5+1gb0pwX/L7cGUBgrCWpriKQquINO4jeYlzUMLmkbLzMq4?=
 =?us-ascii?Q?CVHcmY5nq58yqzdQEIMn4GcBGG1/XVkSs9p3pUjg5nMz4kJvNTDohILAqQ5J?=
 =?us-ascii?Q?Ydy3zZwdcWmvwHdIHN5TkJRERl/KaoVYvFCeLA9lAUzSOZeZeLrn3st0M7jT?=
 =?us-ascii?Q?bnAZf3vGWM0ZEDoRV0rx44NBmVPnuBV2EhwVL9MwAaJDpqhI3yB2DOk6Dc78?=
 =?us-ascii?Q?LpxnNKfIuc+RLnC8EyfvFPE/dT+koL+A7EjHazQ9enJXayrbVdDbmSaH8/s+?=
 =?us-ascii?Q?5tRlkFN92+QbYQQH+1CqbvRjKVDXwY4N61fsSDpbR/cPFuPJxtgtGmBFC+y9?=
 =?us-ascii?Q?TzW8jak5JgovxObM2HRFE4YTuzP8LG3BiJIiQGPwCZgCYATRw/wa2CsNQUCt?=
 =?us-ascii?Q?CwNXlg4p+FYsOzRn2u0J0uXH1gNe3ldgYdVGdXiqZz/rD4FepSLxyzJHaEFU?=
 =?us-ascii?Q?4Pc6dKSloHBjg4T0Z5FWNC3ttsknSycLUQ4Ulp4sIw1lSGV02O2Vofa3l1GL?=
 =?us-ascii?Q?b8tnYRC2PpXeXlOY+KTqiFZM58I+Eljm+hvKjrx8OGshHE4hNQmFDY7vhfPg?=
 =?us-ascii?Q?G6vEeHPtNfY6qWLn/73GQclz3Zpyc1SymOrnd38F4Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hmbcxn+Zj2o1gWnerSZt3mV3ak5Mdud4gtBg5DGpQ9v3FRtzcFtW/O2hk4GT?=
 =?us-ascii?Q?bXBbSo5Q+trtAslUavr/plZE3nvZ9mu+1EkpOxTHtAs4pSL3tXu8HH6D85jx?=
 =?us-ascii?Q?J0zSTzR5T8Hppo2Wvx2ytDny7OBs5D35SvB8kLR3HvOh3S337LKdwfG3lcGh?=
 =?us-ascii?Q?AtQVruPAFvvF18CFLh13NwxRq7x6qXDT08vvoXuMAHidY8xNzM1mPClSMI15?=
 =?us-ascii?Q?pNwAntKS2LZodzmUWhFkHFjgX5GRYh1fHCUXuXqwgG+L2aKYsHpzjDaam8/9?=
 =?us-ascii?Q?hhO/OUwEKPB+IIrKjaaEpaCrSPbjavB4xm0YeXr9m5KWWrWCVW8CVfW/9/pb?=
 =?us-ascii?Q?ruEPgATSFrIa9qwL7qVzDJm76njq5DZuUgicu5XGqcNFfuxu5L9+z2z0ZHUd?=
 =?us-ascii?Q?yYWfylNr6miDg+FZ7Q2/7kL6PcaEEXwnbLnJq5IopPYyxS1wHDV+Ld2J+jvk?=
 =?us-ascii?Q?9QeLFmbg3yTySS8mZWJCsbNZSIVZ57QC/KGeyfftqEpOxWuIjCgQLQO9aqLn?=
 =?us-ascii?Q?DAz3Mr6EUixDL4Ck0gCkruoaWTFMMXBU+O7oZ8JDFxqDMvQENgQUVUBjy0cM?=
 =?us-ascii?Q?kaIw+/nPHlPdfoJSpFtjBZmOHD41Bxwy7f7BJHxZ1ZJpK8DhYKY25Zx9mQal?=
 =?us-ascii?Q?ySifnDPttebbYiOeeFpu8EDSoG55vryDCHRfJhGKQqeAlscyg0S73YXj78Ju?=
 =?us-ascii?Q?PzpQSZGBqZ87UEpkgAvQDYN++Z49N/JxsyfLIkxb98c1v8DXfiSfWiBzXzrM?=
 =?us-ascii?Q?1ATX5CLgwiAWOjvT5O27wtlpyRHLWJuSmwISt2UXgj5O3DlAdMO51azfJQGc?=
 =?us-ascii?Q?uGuHlkQHqAWLWCMfH9q7dl1e4yrkM8xLDe4duW0u1HF29GScmV/ajrlJcjVv?=
 =?us-ascii?Q?bKPYxGU0mKjcdTR8OY9Fk8n2Sz6+H/uGHDYPT5Wqc26Q6txTiWVD5+9q1V++?=
 =?us-ascii?Q?Sba9yRT/ndefTi86bhw2+RP1KZ2QkPkd6EYiGCGj8hTECQQGLs99mWtttIbR?=
 =?us-ascii?Q?2QPKiW9SO8jGtjHbLhxQ5NGRKu3V7/mk6tECp3QHNpQdtLcSH9s1m9BFmMrx?=
 =?us-ascii?Q?1+M1YmBnJdfN7eUv0szoIMuNGNtON6mz9EyeEyiQd1e9SCMycT5Ki/m+RGqt?=
 =?us-ascii?Q?FQpLNXuwxyJJxHJ1Uj4M63ur7EME8Gkj8WV5RwGnnS/NQky+ZNDl487cf63e?=
 =?us-ascii?Q?sLNE1CtsSjPiGCcr5M+mrkXqszwssRN8IXtrn/aPlBgjtsPZAzIJ8ENDhkCe?=
 =?us-ascii?Q?msup8aTbsusSxNbrUJrFm0rfJHXf2cc1vxdqcCLvvVZu1fB6MJbbjcYubxcs?=
 =?us-ascii?Q?6KeoU5o2GogqKQPz+rgiQvfnd7lkekIQ2yASJdqUfrwJch20spBzL7LWBgxy?=
 =?us-ascii?Q?kyv6tU9mqQ7rckDVeXyweTWULB5D0MKi5wkTKGcHyk0XV+nnO5X43GZp2brs?=
 =?us-ascii?Q?B5fnWv7a0QsfWeS6OlDbIt3gpeW5ZYiZ4a6jlTp4kXtEB74wNEPvuU+JgMkz?=
 =?us-ascii?Q?xnsxWVddWQ0qVsaSSUfmKi8ZxS4WeF+pAn72CoyOuExjVhUg63hl1M+PsRzt?=
 =?us-ascii?Q?Z9OOWy4uVeQD/MQWexvAj0/5oNb6ozyo05hT6qCG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9509267-6c98-4cfb-8f05-08dc7fe48bf7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 13:37:56.0065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ya9RZSSIRKL4muXg/gD2cxUZfLPIcsHIdUOouyV3ZsMTDaS6Trs0hzotPJsCJBZrHtbvHkfpYySk40mvhuZh1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6607
X-OriginatorOrg: intel.com
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 29, 2024 at 10:50:34AM +0200, Nirmoy Das wrote:
> Hi Rodrigo,
> 
> On 5/28/2024 7:22 PM, Rodrigo Vivi wrote:
> > On Tue, May 28, 2024 at 12:11:32PM +0200, Nirmoy Das wrote:
> > > xe_force_wake_get() can return error so check it's return value
> > > before reading gpu_timestamp value.
> > > 
> > > Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_drm_client.c | 6 ++++--
> > >   1 file changed, 4 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> > > index 4a19b771e3a0..0c13395ffd34 100644
> > > --- a/drivers/gpu/drm/xe/xe_drm_client.c
> > > +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> > > @@ -245,7 +245,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
> > >   	struct xe_gt *gt;
> > >   	struct xe_hw_engine *hwe;
> > >   	struct xe_exec_queue *q;
> > > -	u64 gpu_timestamp;
> > > +	u64 gpu_timestamp = 0;
> > >   	xe_pm_runtime_get(xe);
> > > @@ -264,7 +264,9 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
> > >   		if (!hwe)
> > >   			continue;
> > > -		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > > +		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
> > > +			break;
> > worth adding a debug/err msg?
> 
> xe_force_wake_get() will throw a drm_notice on error. May be we should add a
> __builtin_return_address() in xe_force_wake_get() to know the caller as
> 
> the current pattern seems to be to just return early on error ?

indeed. please ignore me and sorry for the noise.

> 
> > 
> > but up to you:
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Thanks,
> 
> Nirmoy
> 
> > 
> > > +
> > >   		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
> > >   		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> > >   		break;
> > > -- 
> > > 2.42.0
> > > 
