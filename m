Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAA9C982DA
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 14:35:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B1410EFC2;
	Fri, 18 Sep 2026 14:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S9IQJfH7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7063B10EFC2
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 14:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789742157; x=1821278157;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zV9YArIFobMmE+4+dCPsotC4NRHxPzWeig5qRBFtZRA=;
 b=S9IQJfH7It2C+TPoz1k8txroqXNtqCSWDNPXk8iZBvhEPzIqmQ5Ae/Jm
 DXuEHzuO1XaMwgMuvLtJxrZUgRxryvyZnKl5/Vz9OdSPnDeIMUiyxaKo6
 SD17EpOlke2gUXtsaAy/Hu/XWigVk3fCi3HouCceW+jrK8BD7gGszDIuq
 9QK0UP46lHufiyLto/e0/Rn0PEmt/4+KoyiqGeaG+ifEgmy5e0bcIVyb/
 WF5lR0dy4aVVmbzAfc338LdRGpzvEe2HAQBo9NXLHpopniRd2aaDdF7gH
 YxF6wkrBGKsA301f/52iaQ0b68aM0ee2YBxv7Nd2ib/Ucjbm5xUJv/Pd2 w==;
X-CSE-ConnectionGUID: 8E4TT1xNTGejqaFZ9XLd5A==
X-CSE-MsgGUID: z+8oALz8R1eVlAxKzpnosQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="94085546"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="94085546"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 07:35:57 -0700
X-CSE-ConnectionGUID: 44CpAJWuSdyly1FrZ1pfDw==
X-CSE-MsgGUID: AGRgwzojSKqGFxZRjXHgtw==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 07:35:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 07:35:56 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 07:35:56 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 07:35:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EhZtorlccnEPLHb6Q+tbaZWiIHKVfmidlmqneklxaqy1LwuC3UaWsmDuftoMatfC0JcrZgXxaG5hHw8pwIICKyoxu/03Lz5MOSnUPR+8N1lwsRiEzZHIYgj7Mht2MwMxMTdvi93rqJT4K0FzovUd35Ol23LKaKSBbiehhvYs3Lio1MF6VWeY3U3D8qEF02gp8o9XIi0sf4/L9RAoL4nZ3gdIEhFcszpuQYhDqIP2qj1GUrDIljLspVZKDdmgRCDpT/iYgCnTpUBIA2aaY+l/WDtXCt32l20oTT4+8HUl/XuWzxhLkcBW7FlMS6T7iv9KttdN20SmdSekUOwMalPR6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtWDjWEOcwlajISGnz4FNBTQ560513T8xsZNshbB6l0=;
 b=KoamibURM9fs7ApAbMHU6xDzPzGdxYoXba6nfHvMGNGEDn/rEXXKjH1rUinfW2ZM2SnowTv9AJiZSWLTnzCjJXVMWaA0bx5z3XYBd/K58/CskEHaXc/OqIK4aBige8PuUI9aiN06/2zS9hr0fHiFpIp2nSEgCOXijOXGsaOm0XwwLS9ymvfG0g9zNcbU9RgLHdKCgY5gAMZymyyxgJ7KP1M8fECnjwKB9aOGu4052r+qYxx1mr1+6xoga60tO895xwnKO+/r2IikK1YtN8/Y03oLu/Kg4eRx8nnszjFXB2YqjnyjOD3RTfvTJcrL16Bu6lglUDpKqUi7yLwGOPoCCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SJ5PPF8B3F23403.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::842) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 14:35:51 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 14:35:50 +0000
Date: Fri, 18 Sep 2026 10:35:36 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Varun Gupta <varun.gupta@intel.com>, <intel-xe@lists.freedesktop.org>,
 <zhanjun.dong@intel.com>, <daniele.ceraolospurio@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2] drm/xe/guc: Demote uncorrectable local error log to
 info
Message-ID: <aq1MOCcJoTYCMToP@intel.com>
References: <20260917135310.3590412-2-varun.gupta@intel.com>
 <f49686d7-826d-4715-b04f-8818d6efc8d9@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f49686d7-826d-4715-b04f-8818d6efc8d9@intel.com>
X-ClientProxiedBy: SI2P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::22) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SJ5PPF8B3F23403:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d02093e-b3ae-4dca-381d-08df159222d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|6133799003|11063799006|4143699003|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: evspwH9khIFFeiH8WAqcIzmeoXr5cXIL267FJF0kqHkZrUlndzzul4NX+oddppWPUsqFjvDsxyNPi5COKUVV91YJXjgt9B+CGZwQqdq10rfmxJiVWesev9BhFNdYsjT87z7iYDe/Y6LlsEInc7gYfPElC5qDiIHVEIqMdoWd66lByBDy55gK9nqB0TIgMTicTw6+zv2WSEBzeL53RbQIHeLGwxptrxSzeHTUoQBcqFs79+jo6gfLcznd/OjkCw/Oob/W8iJ0CsHopyHDEjKjqFAvQl9CWd0pkhHEinNefxVPaShL7xgmwPs24qOh9XF/gS6K/XSWn1v7PEAPKxFSxUxjvDwW97By3CCMT0hl8Q/0S32wd2GEbHgLa4kL99PttBx5Wu8YZFmLMrluiAsZhPuQvWg3ROBtE72pM9wzrNjZJotCyxGwrAqn5+D36Hh39QL/2XAhxqApsGk3QgLoLah7ILfYS9spizC0HYovM58qiyqyBgDOfvRDXterh72sgho3P5LhcnvsZLsvIsQHGJqZQUvzE6Q6Om4pbwFJNg4OzJatlKUn0GAQP9BckHyimyhUtoF9jYVCUD2o2/wx4biNzIMyKCislkazo1dobutIDFeTMMzPt1tfmUkr4aj64DTHIcnrjZTOlDI2QwkX+9KoYS3IW1LAB7hUUsOOeE0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(6133799003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3L97MjyifodeBKf9GvAR2/E8iNQj8uO1B8tLnaSpO6teDsIHi2JZ/7UrZZxo?=
 =?us-ascii?Q?gF2fvAl12UgzngSNkMLipZqdSSRfxDn53+geHwx75cGNcvZFJn9OjCwiZQIc?=
 =?us-ascii?Q?o9EbFrjZLys3Okb//y1/mGHDkCJ45NQFA3+bbCRZpVhAUrT37PzpxI0B3VpP?=
 =?us-ascii?Q?fSB9AQb4bVRHgI2BHjfuv0+g4OOoAEgW06BXuia3+VXi1VW8KRLI+Ltro9Ke?=
 =?us-ascii?Q?FfQTpGVgjPCE1Tzzn0EVMd45HfZ8S+ERrx9uXJ/8hPOF8E4MjiRm98aK+g8k?=
 =?us-ascii?Q?EHaoTkKeGT5diZ/rQvArmR7HSOVxm02rrDbGdrU3EaLqibCpCYVp3ezrLu65?=
 =?us-ascii?Q?X+v13v5Q6feZTemP+dle6Y32cu04/pYbB5R84pzk7vrD4/fXiUxIVFax2fEO?=
 =?us-ascii?Q?vnKvnLuMciVYU2HMfN6DpEUcKZXirduTtsqFUP1LYc5X9SozVXOlbE7izZh3?=
 =?us-ascii?Q?gR0y6CfBKHIlnatvFwa5Rug3t6hHweAzyh/vFlsA59htCtNy0kxkshfE17gw?=
 =?us-ascii?Q?0nPWoXK3UNHmWiK6HawI7PMBtXgCceS9+qsOrlu9SI23o8M86waCvZ6O0ISl?=
 =?us-ascii?Q?maUs1haMGi/oBQk9hCpRcLAAtXhGj3LfMOwDU24jZyQwTgyI2Ha6iVh3J6bo?=
 =?us-ascii?Q?4JednpC/CUx/LE79eiQMrQND4m1JbII03M/8xu9goUzKVyuPCAC/Fe6lAJGQ?=
 =?us-ascii?Q?A3Buf5mMomu5vs0UZ8ozUmm0eZm967JdOWWBT1JPzwgVIvjKrBbvoYr02F5R?=
 =?us-ascii?Q?gIsU6x285EEE+1V5aism0/mX1Ae7Z4BIyF+rbvQvSMEbWaf0CKg5oJGgXMHp?=
 =?us-ascii?Q?W1jzx3jasajLErYoYqSuP7Qp6Kat/WbNAxk+sHv/919THqBjTKauZhMsT5Vs?=
 =?us-ascii?Q?ydm2XCvDPIaM4Jp+sTutQtkJzEnHPJgjseyv81i9U5tSPVAaeHFokaypuK3J?=
 =?us-ascii?Q?1E3dA6OGEjwaQ0MHszh9MSP6lD9WEdJoaCqVMfUnvBo9YSz7R/s2lBM2yXH8?=
 =?us-ascii?Q?38nkNAiISx32nJ1uBw5dJz0kzSXEO/bnuEInEn4WzPLIacwHpvpHqd7p9m7R?=
 =?us-ascii?Q?gF/KIJqLKZvXsMAN2SfFnPkeUm0b0c28iI4pV4Ou4TuuS3Q8cHeqZ38+ibml?=
 =?us-ascii?Q?PZPG2YWM6iPCgjQiUEHk6uy2wB3BLNGE080ml78CcGqY61Qpuc/vfLz+gaUo?=
 =?us-ascii?Q?fJkoUfGHkwN2FDK8sdPwiPWFMqxo9iysTLs6L2Od2exKpXutVnt5MNPaAMcu?=
 =?us-ascii?Q?ISnBWVLMO6eW5D/rTAkc0/zRyVfOVhKWGGyp4llU8h6GxdQTxpoCJ+JThSKz?=
 =?us-ascii?Q?YeVm4jzZbOuVFwuJUnM/6it6TeAEYfnT8cUER3k/ZSOPFzjpkYWI+auRsMSd?=
 =?us-ascii?Q?RL4RhUQ3Rp96FtVzk0q7qO1Xgmlg0O6SmJcODBjz51ieYV+n6bP5zW/sRWD5?=
 =?us-ascii?Q?Y4wex4kgQulWDp4Bfmvw6PFa/CDIrI5K75K0RPwoEIZCGAKkNSTpx2/PEH4e?=
 =?us-ascii?Q?gSUubqFKD+jW7/g2juaxhOz5ct7uwZHN0HlgNyZu861H6qt+m8ldcoyT3zX9?=
 =?us-ascii?Q?Ydd+predqH6mStLKEoW/ZO5baANPZ162mCgUu5OexbUi1q5XvV/QOGA6og2D?=
 =?us-ascii?Q?mZqTWcfGZ96+jcBCTwMCKAMcf7BDwibYePw7x9XHxMzn4wBKBdAdJ4++LCCP?=
 =?us-ascii?Q?PwpWEvsQkmfnTXUc5L3bBOd7ZmS5gPw2QtmaN7FqzzVRQEQE3K/a99576EoG?=
 =?us-ascii?Q?iM5iSDGoIqBRzk4TRNq7EwtUQdb9eSA=3D?=
X-Exchange-RoutingPolicyChecked: 1nfkErg3AFlS4QRaJ4Bt2AkdtyoAJAl+kDYHRjgZamqPL8/CZveH4bY7Au1fJfGd7D2yQgutdCh2uvT/VpBU50yOIcI7hvSRowyPKFLBkB6iY90gLCBs9gqEdqzyhV6UDhO6chqnhYyrp0ZhZXKnvjXavfso/mjTUfZDHR58DxFIvmgNChhGcXw4Jv1hH5Xj2nNqya0Zm9vZKiBFYzBE5eY0jpgKaO3/8um+UjRl2d37rsfePuZj3WT2Gwaum1fl0VcDq5qoe1DIdQVEpQ5pqB4AmmEDxLwM9GTPL6Ci3esg1hSsxuXTmKuDZMxI5goCrTYUQCajeyYBDHQCbBE2uA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d02093e-b3ae-4dca-381d-08df159222d0
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 14:35:50.8139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WUssPsWAFkaruvMAdfbAP6zUSLUruVaTxKlVFWv3pjY20bi2YaCEKe6SlC5F5laBj3PPSqrbRvnmTzMh/3HQVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8B3F23403
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

On Fri, Sep 18, 2026 at 09:50:48AM +0200, Michal Wajdeczko wrote:
> 
> 
> On 9/17/2026 3:53 PM, Varun Gupta wrote:
> > The UNCORRECTABLE_LOCAL_ERROR notification sent by the GuC indicates a
> > local, queue-level context termination rather than a global device or
> > driver failure. This can be triggered as part of expected recovery flows,
> > including intentional fault-injection tests.
> > 
> > Printing this at ERROR level is too noisy and causes false-positive
> > dmesg-warn failures in CI. Switch the log level to INFO, matching the
> > adjacent CAT error handler.
> > 
> > v2:
> >   - Also ratelimit the GUC_ID_UNKNOWN to match the CAT error handler.
> >     (Himal)
> > 
> > Fixes: 4e57574fa3a3 ("drm/xe/guc: Handle GuC local uncorrectable error notifications")
> > Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index f3ba8abfc228..6144a1767f10 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -3487,7 +3487,7 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >  	guc_id = msg[0];
> >  
> >  	if (guc_id == GUC_ID_UNKNOWN) {
> 
> btw, shouldn't we check for guc_id >= GUC_ID_UNKNOWN?
> 
> > -		xe_gt_err(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
> > +		xe_gt_err_ratelimited(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
> >  		return 0;
> 
> if GuC shouldn't ever pass invalid guc-id here, as spec says this action is for:
> 
> 	"Notify the context which caused an uncorrectable local error to KMD"
> 
> then IMO instead of ratelimiting this error, we should rather escalate this
> to -EPROTO to force the error dump and reset from the CTB layer, no? 

Himal, next time please do not rush with committing patches like this.

There were 2 unadressed comments in it.

> 
> >  	}
> >  
> > @@ -3495,9 +3495,9 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >  	if (unlikely(!q))
> >  		return -EPROTO;
> >  
> > -	xe_gt_err(gt,
> > -		  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> > -		  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
> > +	xe_gt_info(gt,

Again, this is a no no!

This is not a CAT ERROR that is expected in any page fault caused by the user.
If we hit this case it is a guc identified uncorrectable error!

Only come back with this idea if we can really justify why you can demote **all**
guc uncoorrectable errors to this.

The errors you mentioned in the commit message are not a good reason and should
be handled by the testing tools.

The patch was removed from the drm-xe-next. Please get back to the drawing board.

Thanks,
Rodrigo.

> > +		   "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> > +		   guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
> >  
> >  	trace_xe_guc_uncorrectable_error(q);
> >  
> 
