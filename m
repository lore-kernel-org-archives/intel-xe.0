Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA534EDE9AD
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:44:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887F410E167;
	Tue, 10 Sep 2024 18:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RDnYGdG3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C7710E167
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725993894; x=1757529894;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9BgYfWKpp20C/S3T65AhXkjAQK7q/9oIk2prjvfoA+A=;
 b=RDnYGdG39WBVYju1TTlHrmD6h1nWzbOoHAfsm5iYgDOLY3hd/hKnWqNM
 FUYA55Vxv7w12S5WwdWjsTpjN2gtX0A9kStQ9qbyHssYbp4Jv1gQSd9na
 7n1lZ4+RHoDISEJd6UeqaJjLffrmVjAKenHFi0qNj4adJiyG1qUzOiJv7
 ThpAY5CtuJXS+kBOwI7J8cteTTDm6+vSfxwsz7p1H5/PbKEPhnAzRL12q
 GbxXH6lV2bAgyORQ5oZ0zQgHseuglOwA5SfHqtjgrd3Y+yqbqnBm5z3aB
 iH4wVC0GFjwThdObiGgT/2/NkNZ8IAMT5sSiHu+w5/v9uyPhVPDlYhyBu g==;
X-CSE-ConnectionGUID: tvFNtmV9RGekPVV+Q65QWg==
X-CSE-MsgGUID: Kwf8X1cMQpOpiwMoymF91g==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35905063"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="35905063"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:44:53 -0700
X-CSE-ConnectionGUID: ud9XokdqTu6Qomc5d/Ls7w==
X-CSE-MsgGUID: 7AYzxUY3SqKhwXzflF/MJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="67360495"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:44:53 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:44:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:44:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:44:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfJ8zJtI70gMwnmxR+q3L+QkklS15QYBQd1t6dQngZZfgbk2tXKnE0ajWm81Iy9GbHqA7ZFCgmRdegVLynQlvbn571ywd2Jq5p3yf4wyFj4cNJYN+MBWxyVPy/xpc6SFbrUDcIoqXSqZFpxDM0sPSJjjk/G8uzq7v6h2a4XbmNPANhBDkFB0Ebry5ksYaW9fX8gIEe0GWDEqiEeDy9zHIdQtuFH30ICsAtk+vt+Uhqtv0gUpE11F88wtnxL3wNoEIK+adFrOp/tZMHmELy0kCZQtvoI+ILVZu5EGYZHpXrP9UXsV5rHo7g/gEK3M4T+kwFtrwbYe+RlrekLaNVGiKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/NpX3amnkzhAEgSyElUyfGjvCzq15lnsEHTP0Ioh2I=;
 b=RzSWPt2JmqIpC4fQwnY2Z4bRweervnAk/eaEHIjV+JvsVpPHw9hLctwMW9kAgqptjk2/EWARR1TboHS9ZG4dla82RdhiqUpeSmHEnf8afYN3wrY6BQo6YSblC6nN/w2jRaweTQgQLoFdfF3+v7xI470Fj69NF8x3FwEapKm6NoZmrJZ/0pMbxNo6FCMGV3gk3HKm0eHO/HRknIQQkxROo0Uj6SeWP0r32MHvNjI9N8pFYxehUa8Q4pQcuDVveymUG31u+EVq6SjonHY7VTyCPK60qbdXyLIVKdyc/t4TIBywxHr4NhO3fikR6ztNvo66ARu9OBuEE6xow8xn+pbzIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 10 Sep
 2024 18:44:50 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:44:50 +0000
Date: Tue, 10 Sep 2024 14:44:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 34/43] drm/xe/gt_clock: Convert register access to use
 xe_mmio
Message-ID: <ZuCTnmGBUWo15MPC@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-79-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-79-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0338.namprd04.prod.outlook.com
 (2603:10b6:303:8a::13) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MW4PR11MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b079a0-6513-44f1-393e-08dcd1c8a684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T2yb6T7dsx/gg5aji646X/pyJQOLtoY2S8TYzU+jRCcjiP09XV8NC8RM6Qo2?=
 =?us-ascii?Q?GKosOqldTVWO9IhxGRqRI0trWOCT3RH3CAM3NYUKfrCoiMbdhV/awd39KiwU?=
 =?us-ascii?Q?IMYSsFr/X6zSdqIGRPxxgVpR1hRpNW1PxuPxN2I/p/BriZC4fS1bcUhoJelJ?=
 =?us-ascii?Q?Q17jiXid3mkKuuMR5jhaFRWkqjMQH+Hwu6E21FFFYzXwHw1o3FFnWNQp4RkI?=
 =?us-ascii?Q?1iiXxoGcHlEGAvmt4HHfjycug74aruSrqJaCvdED4bbGgZ6ILw47H4gvwieq?=
 =?us-ascii?Q?cHxhWDbr2W5+2/mI5tbci1hwaJxXHr3hzbvK+6l1Vy84Vj2lD7PKd0lO5R76?=
 =?us-ascii?Q?wT41PcOTNesYN26UrB2UUfxJ7JHjm79eiqDN8MNEfnj2L9n30K2L9ObHaZs9?=
 =?us-ascii?Q?Pj9elh22OcOz9JUWvRol+pnEMNiTSbnfQ1GY8cJLeQZPZKgvuOHoe64Y6IHF?=
 =?us-ascii?Q?Bg8JyJqcTyuZts6aXc9gRjyf8PFnFDUaMF+rp14mP8Tv1I+L8zt2dYoIogV6?=
 =?us-ascii?Q?66abwdpSfUmAoD7UQzpunKBqMjhIusJCJP8MK0xdyqmybUs7Hw06tETieik2?=
 =?us-ascii?Q?833IxZ1o/peboP6w6GrKHwQFtG4wIV0exWJBS2PicY8lfHBT0FBMyVVnlWXX?=
 =?us-ascii?Q?+UnsKuzKrCN5kuy1j2X41ikkRiQ/PndiS6JBT01skvBD83LS9r9kbL6uni8Z?=
 =?us-ascii?Q?LzFAidgWPrB4abpkq028dfJB7jXXRK/oS+vWUiUBE1g2FB8lYrmKdiQHDoxc?=
 =?us-ascii?Q?5KfAa0lmDXEYtWFkbFatk7R4FHIP+OGYd/Z7bSfbAwi6k1NKScJI+3BoVjbT?=
 =?us-ascii?Q?0lPwe598Th/lV8lFXp7xWAleLGrHqi3mfWH2eSepPlw2gZtk7+xpEl+24Puj?=
 =?us-ascii?Q?izyBfsrVjG1BWPwJVJnW0m6xCY/x46Y0aZltSjqHpyoIQTMOnHH2o6+Ujya1?=
 =?us-ascii?Q?pk5aSPtvy3VoEouIUWXWFCwFlFwaclIQFaIBi0r+Vc4imt2xvqFu+iAMPjot?=
 =?us-ascii?Q?Hy7oD5Gt9+VzdmwTzSbSWiniKx0SwJ0ZLeSv34KZb3XBol7zTqLWZH7TlbEE?=
 =?us-ascii?Q?cSACBj69ODC61CFUiBdWJq9AUpFdgZlhG5VSF6sO4uBnM29d68VCaNZMax55?=
 =?us-ascii?Q?z24beOh6zl88uJ3CYpkRvFxmLEMjqqVqrcL1e4RIus7LmA1gY6Bn675p/epQ?=
 =?us-ascii?Q?y/HzmBCkpUHg0rDrMu1/DRWtbtwG8oDviTwbsE+rFvd1ZaATjB9XoQIBOFL6?=
 =?us-ascii?Q?MPSnEumyuZsnYxaUVJLLRr+qxeOEnrAuK+dG8pSAO89f0xEOYn8TNRfhrv87?=
 =?us-ascii?Q?zbU85gDjIVmg/EJCjojQ9xnvm+GOBvLDVKLOIlaVR8VIew=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zBHvcks5TImZGMusyu6+6mkyz6ohfGZ0fNB7TIeR9VeTG3u9tCy2+Pl/QMeP?=
 =?us-ascii?Q?ZVbBJgrVJ6A3H7Q5wT88KjYtN1v83uy+masIbIWMzFE5q2sKkf3RNmfah4va?=
 =?us-ascii?Q?RWCWJxDxIElNSECKKVrkPmuZ8iIFvPjx3uWUJufmuCkG6hogm5NEev3N+7Cc?=
 =?us-ascii?Q?dxEMiVn7eyQUqSMrMqn3bkVmkpK5ui0EE8kNos4VcG7/i345KSXXeO0ljFk5?=
 =?us-ascii?Q?0P1Opc8fzllAknmqVyKGOkmR/hXb6CipOPXAbsa39AwjEoVVIngYwJs/4cgw?=
 =?us-ascii?Q?vjZS1Wzs91hxAgwty6a7zzPTtWKNiIqY7CSdhVZpz97yliFisc+yMF10hUm6?=
 =?us-ascii?Q?ObN7+nvmaYs6GAysGh8cxl8kFytI2ZfgAJClT1wjrgs6P8QUEknyIMJlXNBn?=
 =?us-ascii?Q?2S9eroaZuyW1s6yyR+pASX4E15rqgCf+X72aw1BmcQI9k3RJO/MPO5KO5+4V?=
 =?us-ascii?Q?P0grjgk57kP+Xezk/SLqg8YJ63Mq9qbfN8VrPTCOKeoSgLByncLEXH9TFOTx?=
 =?us-ascii?Q?Is/mpitTzFeqKiqs3HT6MqZ5l/tNq6fRhAr54t2YtdmQqvjiiX0W2jK2uQZr?=
 =?us-ascii?Q?owTPgPSnCYe1seBGRIs8Kdlmv32ERrgiLRROOWlDF1snueoQMcbwOZarU5OI?=
 =?us-ascii?Q?hS24KZ4LOdxIgk3eMgxCvsrVFspUR6cjlC2uP/3NF/85Ww0FxS7xOL0SbgAG?=
 =?us-ascii?Q?bhwTlfU7inP/xXXwbTWYSjRrRoNizocEYIL4yWVAK53yqm4mGSULkl15r4BL?=
 =?us-ascii?Q?Dkp6jMeJU7Y7JuKlJSJ5lcI6SqwqbbAa+7iLnL6l6C9frGN04b9vCkM2c8ID?=
 =?us-ascii?Q?7drdUqvIJCfW/qOsofgHxtBwD1XFUCeTZSGPTK15LJxQlgJ5ojIO35f9blhp?=
 =?us-ascii?Q?c0pbSTsLldPQrdXAxqAOP3JkoQK/jUFoeh3fftJwQzZNHY/ncq2Ej0eXSTe9?=
 =?us-ascii?Q?ncxqi67/oxQfac3t1ncfR09K4v5bILXo0FUho2wcDwMcOfARPCSZqXhUqDWn?=
 =?us-ascii?Q?MIRRBiQ/3yu3GnwDD1w+PvvZdzuRB0BZtEA1i86Rorlpwz1vKLdMBKKsWy28?=
 =?us-ascii?Q?d444bVkqu96efnYbtTT2Welgadht8blDroz5R5cjOb1izfaYcnI8H+aGVfXU?=
 =?us-ascii?Q?SRsj70rY3ZUTojh4Zb1yCZikjA+4sNjIiZa5RBk3dEKl07hcGl4/NS+u95D9?=
 =?us-ascii?Q?BjFb5YdbCyU+jKBeVNjpRnS4NCxNlif9g2BkXFfeCV8HRGvrsOsTXIASvtxc?=
 =?us-ascii?Q?MEAE3iUqKelIm6wTwNpwoAhM4G7trkcLxw0AhZ/BWN4lq98XHw2B+3SQQagD?=
 =?us-ascii?Q?KvjAM5Dnp9QfYylPpy3Z8L/rgxgG8uysVgbl2GWzZRU7wh/iT8OLOWJK+4Qe?=
 =?us-ascii?Q?/kd2w8lQ3m6aSvqBU1kK9JpI+CekauR2OIrGRJMB07iPEYUYnWmHBd5TvSZz?=
 =?us-ascii?Q?1RTDU6Vv2+r6rW3mqfRtKvs+EiDgBHENxlkp2GlwyInp0CNsHGnFKATka42y?=
 =?us-ascii?Q?nAbernfzvpIfy0A05p5V/m9Ko/f2PzgA8DCYTRONOAfjo91IUfS2SrTeP/iD?=
 =?us-ascii?Q?15r3YkqqefY38PzGlpjotqtJMFvPcgAWWHTJwD8ZYpy9/NTkMBWyBftSg2Ft?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b079a0-6513-44f1-393e-08dcd1c8a684
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:44:49.9338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ns9ioHEHnXB5R1QrhGnfWfM4Rbv/5GZscLBpzXZYHZZ08o+Nac1VU/7cCDb8RldnZsYVnwonWSFFCJPVBTtXTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
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

On Fri, Sep 06, 2024 at 05:08:23PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_clock.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> index 86c2d62b4bdc..cc2ae159298e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -17,7 +17,7 @@
>  
>  static u32 read_reference_ts_freq(struct xe_gt *gt)
>  {
> -	u32 ts_override = xe_mmio_read32(gt, TIMESTAMP_OVERRIDE);
> +	u32 ts_override = xe_mmio_read32(&gt->mmio, TIMESTAMP_OVERRIDE);
>  	u32 base_freq, frac_freq;
>  
>  	base_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK,
> @@ -57,7 +57,7 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
>  
>  int xe_gt_clock_init(struct xe_gt *gt)
>  {
> -	u32 ctc_reg = xe_mmio_read32(gt, CTC_MODE);
> +	u32 ctc_reg = xe_mmio_read32(&gt->mmio, CTC_MODE);
>  	u32 freq = 0;
>  
>  	/* Assuming gen11+ so assert this assumption is correct */
> @@ -66,7 +66,7 @@ int xe_gt_clock_init(struct xe_gt *gt)
>  	if (ctc_reg & CTC_SOURCE_DIVIDE_LOGIC) {
>  		freq = read_reference_ts_freq(gt);
>  	} else {
> -		u32 c0 = xe_mmio_read32(gt, RPM_CONFIG0);
> +		u32 c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>  
>  		freq = get_crystal_clock_freq(c0);
>  
> -- 
> 2.45.2
> 
