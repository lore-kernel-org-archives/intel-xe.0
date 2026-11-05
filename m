Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2007606A326
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 14:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=COh3GaqT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 922E210E1EE;
	Thu,  5 Nov 2026 14:11:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FC910E1EE
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 14:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793887876; x=1825423876;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5RJRr/ZaVfrKbNXmGmxAJuyQeiOgVge96al2x9OoM08=;
 b=COh3GaqTBkUv/ybKfGbT6lwl0RZrb032m4fWKc8yFAE6ulFdsoDGy/aV
 acNv3Jmn1R1cbkV7tQU4zPx85uF+cFcmoX0isoplgxaDbc49/c1XkcCSf
 A6hDE3ayc8h6hIXw8Lgd5OJjx+5GciDU1WuIjy/DcYwrGFUNChWOyS0/f
 K1I0FC7vis9wS1lzf+Kv/9wV9rw0+fDTfsofITrqlCq4PjcFqYgy5F33T
 xGjtror9m72WACEvyyFLohNHIAUV0NY7fuG3Ns3y9o/JBSJKMO8eswEhT
 k+r4NGwT7+7sBDDt3X5CWW9WxcVhEafmKZpRA4wYzZ1bR8oR1DFBhOrTV g==;
X-CSE-ConnectionGUID: yYX9AoY0QcqzG8cim7bXzw==
X-CSE-MsgGUID: 20iLr/vHR4mXTy9RvvaY+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2577811"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2577811"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 06:11:16 -0800
X-CSE-ConnectionGUID: La8ndRTuT3uFH7mAzVumbg==
X-CSE-MsgGUID: t8UtEInaR86CJiKzDNoPDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8778319"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 06:11:15 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 06:11:14 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 06:11:14 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 06:11:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wv/EIz3ae+RqCXwSQ1py+r1UoNSkTCNm97PN1gDMLp4aNpPjfzzSONlLQF1VF4jRfSpqPw5MtO3N9tJJKUj4LkUczBib1pPQUA8sq4H+m3ctu/8xssIeboQ56R0ewDhkvS6M614bM2q3xz+ytBPapIbCdHv61o15jJdnIylwtZ7iipP5fnWFlpP7ySFe6N8pYgSnlbrul3qktPar1+0sNWc9BYJXHUIJbSrulTy7kY+Nytws2XD6DsKYxFBZ8ovL3aSmTRtXFBdUSTMRGWubJseSiaF3M78N0GLUtz1d3NtSGVpAzqARcvL8zpooKvk1d69WiZNwyjrgxxhJYDc3GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P16NT2XIQf1CTXNxkRvHoNBbWrWyQuI0d2SflTGlLQU=;
 b=H/txTed8Ttx/3TkSWsl2DGoH128vri02aa48VzNQ3ilIwHYYaOEwhYaHZt1Jbg4yZwhYkPJWSfcmBR80CDVb3S5/558AtafrY/t4vOZi7z4XADydZDvsPh61sx1a6QPQHFnsrQPiMUjbAv6bONkFvgc6FVon/YKJanOj2bIdudJDKMD3A7pZyT6uaiNn0ZgNc9A2mrY/p1mm8WJytPCddG/gSGGEHe9zb7JuoulcHfHdZcWbY4/7QJmLspPT98o6GFIvFt7GdGWnP5BAruSPaian5abeCgEiCHyR0BnBHwJNyif9jQ5vI+cTqna9L3qWRbGWMQEG6v+MWFsFBo8FOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by LV0PR11MB135625.namprd11.prod.outlook.com (2603:10b6:408:3e0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 14:11:13 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 14:11:12 +0000
Date: Thu, 5 Nov 2026 09:11:08 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: "Tauro, Riana" <riana.tauro@intel.com>, Varun Gupta
 <varun.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v3] drm/xe/guc: Demote uncorrectable local error log on CRI
Message-ID: <auyOfNAZ9Hb19Ana@intel.com>
References: <20261013033430.1885990-2-varun.gupta@intel.com>
 <cec2dc54-14e0-48b7-b0e9-54c410226f82@intel.com>
 <20261016223700.GD1329272@mdroper-desk1>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261016223700.GD1329272@mdroper-desk1>
X-ClientProxiedBy: SJ0PR05CA0103.namprd05.prod.outlook.com
 (2603:10b6:a03:334::18) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|LV0PR11MB135625:EE_
X-MS-Office365-Filtering-Correlation-Id: 25bda12f-aaef-4a39-fc6e-08df3b46a5a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|6133799003|10067099003|56012099006|11063799006|4143699003|261026121527099003|261028144727099003|261022075727099003|261026140227099003|261021121427099003|261102123227099003|261021123027099003|261022113327099003|261022105027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: IB6+HNx1WTxtSKS7Gn+ljy31JHBHFEl/5aYnfk80RLX4Vz8sSBbvtvPMZ0Yrft5TtEFY2oGoj3JJWmafz/TYSraYUofhkTFxXbYl/UBTxeR5RP2rwl9g4PyjYxNenS5nZtJKRDTTFq55o/2wFgGT4YhFr7WrmoqgwHRe5dXWrK8tSkND6gpuL3Qw71FssVnBeRdtptvq5A5pPndUxbXLLFsW5SfH+46yWrwzqjvPonWGZtpgVhpTZAmKSkvjhU4Qfmyge2ScfjSC/sjgon+U/vsQcUdxssBDxoT9kQ2FCkcS9wofQc9Vc3qYCiIV/R+HwCmSKg7j/k1MvmtpCIcYFqJdzEu5bPN+Qoeb1UEBAjC4I5lpKcV5tnvyc0lLJ35DrThOgVgcsHQ8FQ7iNOTS1gvK4/EP4wF2oSyt1J7+OIQOGK9pqkXcCZQCUxw/iuVB59bvzlXefr+jvpqCVhQEDdBRQJYD5veSm3xxamxDsrfjmdJhkDqyuWMC6mrNa9pn+0EME62P39u31PIBSvk2ao7eBdvGgbgRCdM4FAo5k1wEhqLem6/MzKfojCZPVtsWQiaZmN4FnyeUUkc85vqj6Y4Qwr+YY0Bj7tniMLBGIeHo5DxaIh0WVGTK79sPESxiRlVu4GPsSi2/5boHKysJmEie0KdCymINqwZhHy4YLyQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(261026121527099003)(261028144727099003)(261022075727099003)(261026140227099003)(261021121427099003)(261102123227099003)(261021123027099003)(261022113327099003)(261022105027099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BRlQ+sWpZryM8HLVWdMfc4Xo0PLwm5IKgTUcVUuNqXBC6SND2sAuq+kqEPAh?=
 =?us-ascii?Q?fp2hobdh2TgSrtl9zm9c8JUGHKpDvJBvE4Adxqun12jNQk7vC0xewSDfweG6?=
 =?us-ascii?Q?CazG1F5nbP6Ez4VDDJfdM0x2hGOKS1nDPCwF7daSKUYJo/QAoVMuI08KX6IV?=
 =?us-ascii?Q?vYvApqLVrWL+XSDRb/kaYMzOqCxAVHXgBp3kAVFxGDiRG3Kc4RVU0rpcZRDH?=
 =?us-ascii?Q?gsHHCnQ+T5PWNC7/DARMl1VXPfUAvN2ct3l6sMXzCZYzRxoAXdKnrEbPV/ek?=
 =?us-ascii?Q?apXI1plMnpXIMOZE8RyAmohjU7jieCidEajnZlQpJKYxg6hZTl7LI1JJr97j?=
 =?us-ascii?Q?iRvD1pCo4y9bNc2P9wzP5/2ELY5AzZAiVJAn1BO2kbtf81pr7i2yLRWvKuKn?=
 =?us-ascii?Q?RkK0MhpWjFztk8n+PgaSoza1evXD+fu1xYiaTeYo2jb4nn0SwCzR21ykJ7GB?=
 =?us-ascii?Q?sifwUz8gSFDw+wLLY4svVDW+5bk3Fg6tG/DCYF1vSSCK+JkVoCtpUlVQ/KSR?=
 =?us-ascii?Q?gnpRPQQRw+gRg5FdlNlMauw4w8e4L0sWRS7xeXVxKjDdqI1QskJ6Zj7miKET?=
 =?us-ascii?Q?ty8y1Ak/PtviiQsyE7PnbUT9sv50UdCu+7OHqFeAPrAvjUGKmyR6EqATr1JA?=
 =?us-ascii?Q?3dr11AJue0ujMzOUtiFAMdvmvIEeNdaeGccgnTensudNFqsWUpajdifSt5f6?=
 =?us-ascii?Q?yltmXu3FETTZwEjAMKuM1veby5CZ0B8JZWWBUxVjbOU6drVy3dZ6qSi2E06/?=
 =?us-ascii?Q?9q/AQZhCF3NxM+9v2o3kCnwBUN1ueknca4RwiV3NsHzJe/5JHWBTpCTYi1Nx?=
 =?us-ascii?Q?P7wjMlGKU+Sva/OPnnNUvRVn94XXz07VFksUBd+T9/ocOfx0O7dBP7X4Tk64?=
 =?us-ascii?Q?33Fmvmicc+PEb++RmAFXnEnWuhclQbtEZZZdhgTxjWtgmZjz2OtWz99VgfdF?=
 =?us-ascii?Q?V1ICZOs7nqe6ICv1MMSPpUMOUuG1/ltPK4WBSPSaxOHls9lYaxefp/8QXaEO?=
 =?us-ascii?Q?m2SHodO7XsuWcdqvzdD6aqPm17+3nR5e9qH1ZuGx4FwiQTWPHuC8NAkJGq42?=
 =?us-ascii?Q?e1Kncyob/o74+J0htdcBegmRK5bGin6ml3FZY0dz3IfsYOhDt1rKIS2KXv8C?=
 =?us-ascii?Q?1xLT9kbkU9tZ3SmoM48pUrvrLha2D9M7sP8o7/GhVQWChnSXMjRcCsIIvL2z?=
 =?us-ascii?Q?Q3KmYaOTpFS3UAJxfHGAV5Wu97WV4C+jiRmkhZV7VRY+vDGwG3madDuwSPHh?=
 =?us-ascii?Q?mTPAEQ3PMxFJ4Swwj9yGQpIObV6XYb+fkwwZPhKVol59I1QKMw80ry2mrK6j?=
 =?us-ascii?Q?dAR+3T5o+9Q3yAnK+9UAJEbGYRikEp+qRxf1s0jUK1cLofAfnYPnzEHwVxVc?=
 =?us-ascii?Q?/fuH3ucNC1+b4XgTOesKjKODRivZe4uSwcrFNKMUFBOhK+1BF930nIbVw1Om?=
 =?us-ascii?Q?5xyr95OxnzI5E5ndPVLPQRpFX3tDcMNS26gGkRUnZvuo/8zBRAaJhNtjjNO+?=
 =?us-ascii?Q?9uZ8Dj4i8XB0ikG2KGMwGm85y08o9U1HZXTBbKu9wDYzAOEPUrXovaOFb85P?=
 =?us-ascii?Q?RdH9zB87frXbGl+zetSFzMNWkuhwPwzxLCff0fufgcNR6cfv+rQUWCh8xeCg?=
 =?us-ascii?Q?wCjI6iOHSNAbP6xun8UrtQzkSvbMcgMqdAS1zBPhvvqFg4GCABrhVSD2Zj2i?=
 =?us-ascii?Q?te1gb4uUSF37fvOCpygb3MsWUfQ4Oy+vtC6u9pdi0O4+L1Yzgee1jTZiymd8?=
 =?us-ascii?Q?umXk3+8skw=3D=3D?=
X-Exchange-RoutingPolicyChecked: cmUShP6YrIvtPhJlM3FlUmHxKIWCIXgSI5Ry8v0Y6hqlh5JBBik7IuubvxL/yN4Fd+J1/Q8PFB+6ILPXtpxtEMmPm3Lypk6vNH8VnFFtOKMKpY7PrTQjGP25JQazJdNc4wKhzwiMslMxQ67IOWg8533lU7TeJYBjUDAGrAJrtps91tJaJy04lAaSL5KfuARbTkUATYDA4kWPKjlXbLFUPETJ9bku9+RhYA0c4TpDC7uUct2LjvzuzyyTJk7AC33fNQHzHboiDc18DradLNxuLy7O52UaK5MS2504lE03pmMY6VcEL7B0riKEhuh1UkYP9W9WGx4ZUOO2XLDQSUfh3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 25bda12f-aaef-4a39-fc6e-08df3b46a5a4
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 14:11:12.4960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18B4VQHPYUcVSxJxSjdKglt6j6UGUTqnsWOqmW0zk56/1MSvcp72BjmIraREQjpaD6w46+I33RISsQh3HDH99w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB135625
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 16, 2026 at 03:37:00PM -0700, Matt Roper wrote:
> On Tue, Oct 13, 2026 at 10:22:57AM +0530, Tauro, Riana wrote:
> > 
> > On 13-10-2026 09:04, Varun Gupta wrote:
> > > The UNCORRECTABLE_LOCAL_ERROR notification sent by the GuC indicates a
> > > local, queue-level context termination rather than a global device or
> > > driver failure. On CRI, due to a hardware limitation, the platform cannot
> > > distinguish GT translation faults from true RAS conditions, meaning
> > > standard workloads routinely trigger this error.
> > > 
> > > Printing this at ERROR level is too noisy and causes false-positive
> > > dmesg-warn failures in CI. Demote the log level to INFO for CRI.
> > > 
> > > v3:
> > >    - Limit the demotion to CRI and add comment explaining the HW limitation
> > >      (Rodrigo)
> > > v2:
> > >    - Also ratelimit the GUC_ID_UNKNOWN to match the CAT error handler.
> > >      (Himal)
> > > 
> > > Fixes: 4e57574fa3a3 ("drm/xe/guc: Handle GuC local uncorrectable error notifications")
> > > Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_guc_submit.c | 18 ++++++++++++++----
> > >   1 file changed, 14 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index 7ce73489c35f..dc5b6b98ffc2 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -3585,7 +3585,7 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > >   	guc_id = msg[0];
> > >   	if (guc_id == GUC_ID_UNKNOWN) {
> > > -		xe_gt_err(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
> > > +		xe_gt_err_ratelimited(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
> > >   		return 0;
> > >   	}
> > > @@ -3593,9 +3593,19 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > >   	if (unlikely(!q))
> > >   		return -EPROTO;
> > > -	xe_gt_err(gt,
> > > -		  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> > > -		  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
> > > +	/*
> > > +	 * On CRI, the hardware cannot distinguish GT translation faults
> > > +	 * from true RAS conditions. Demote to info to avoid false-positive
> > > +	 * hardware error logs.
> > > +	 */
> > > +	if (gt_to_xe(gt)->info.platform == XE_CRESCENTISLAND)
> > > +		xe_gt_info(gt,
> > > +			   "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> > > +			   guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
> > 
> > Shouldn't you be using ci ignore dmesg in test rather than demote an error
> > log?
> 
> I don't think CI is really the main concern here.  Giving unprivileged
> userspace clients a way to trigger new dmesg messages above DEBUG level
> on demand is generally considered a security concern and must be
> avoided.  So even the 'info' demotion here probably isn't far enough; I
> think this needs to go all the way down xe_gt_dbg() to make sure this is
> safe.  Otherwise we're hiding the CI failures but not fixing the real
> problem.

right, let's not hide this in IGT. My only ask was to have this CRI specific
with a comment explaining why.
But I don't have strong feelings about the _info vs _dbg... But likely
_dbg is better based on what Matt told.

Varun, are you sending another revision changing to _dbg? if no, why?

Thanks,
Rodrigo.

> 
> The fact that there isn't currently a way for our driver to distinguish
> user-triggered software errors from real hardware errors is a serious
> problem.
> 
> 
> Matt
> 
> > 
> > Thanks
> > Riana
> > 
> > > +	else
> > > +		xe_gt_err(gt,
> > > +			  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> > > +			  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
> > >   	trace_xe_guc_uncorrectable_error(q);
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
