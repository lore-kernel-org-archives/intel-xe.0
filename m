Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C27BEE4996
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 16:56:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33F610E064;
	Tue, 22 Aug 2023 16:56:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D1B10E064
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 16:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692723361; x=1724259361;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qHs/Ns6AB3n6zJyxiFAIWbIF9pxPKp13h4ZGdZg4pN0=;
 b=RtoX317LBFzrSUQDpRpJpZho4ZbB9iG7eLawJRa0zxLxISl0OvEDAmwG
 /oPuKCRmpAsKqIjMPa0R4QNxCKLG3QRG1MtGXeq+SX2FcPN8Ue2l/L5Dq
 AX3m4LWz4ON+L/B0ZxrcIBomtAsjbGmvVwlqhPtP/Ch1yp8DzAuWxoNIo
 PnsVLQXQAROv821d47om00z/aMwYcMbXY3WaP1il8sK9kfeis0JOy+vkr
 lojp/DzoaZasiR1zcZXQx7SiT2TGm594fip+c2UazRYe+gbwhEwrpK34n
 4DDrmdCac6R4MmQEW0L0N3Vby2iKFmBIM2/yCmT9Eb42i93Kiryb+MAw2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="358926112"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="358926112"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 09:55:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="880019989"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2023 09:55:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 09:55:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 09:55:53 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 09:55:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwiMjvRXr2N9TV/NNa7st96jNlf69Kkf/l/4ezW3NzU4oB1Nsov1MX8M1J63DJdPc5JyxYj3x8BWTYUV9ppCRUZOVLspCmLOiakUCeOny7BefVwiTXCjXxO9xVGvDyJLrv0947EtIG+iU54qSlOVZ/6MzrUAoHD2mJT2VszGLZx+cswzwRnzQEaK9MHJVa8bKfE52RPzh103L48JB0yEa2CkVgtHl5fGJNsSMNfJc2vJOnReCH7ui3rSidKje0YZhDzRb5CisillUtJEHa9L4OzRg1gWSnGqPhETk8gFvdFAnsZ4icOD77ERypZKhC1lMg6zNkPGPadxrXqHLLVSPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5pWo1ivd+HQtiYlm9Igrd0f4aBS48QhQyZ9PUE+wyA=;
 b=N7fM1C/I3jv2KZf0Py8OrJ7P5PQG2tXOxqSN84sFz0WoIzy8W1ZqaPuSHAIZz1g5rmRbwsxJ9dLcMI3fJAk5OjjV9RFJTr0gV3SEmaW4U65UsPVDiDoNzdQX4HsfFnXVwVoeXcw3VxEEn0Noyq8ioH2L2tr6lV1H7VALyvl9cf0UIclUpZsUdXi0r471gRIbNjajD+MxmKJf3RNIs1KHhNPdPIFv57FNC9gMGTdY2t4mdSlWeLqxd6yqobANDFLckBmFpWwIYPjGor7RrilR8/TG+KmoIP81PcONXCC5pECBW+/3Zfm+8ebJ4YdA65KCHyZmhrOIOKNHlXLMg7tZbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4239.namprd11.prod.outlook.com (2603:10b6:208:192::20)
 by CYYPR11MB8431.namprd11.prod.outlook.com (2603:10b6:930:c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 16:55:51 +0000
Received: from MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::18a6:cbff:9bcd:4acc]) by MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::18a6:cbff:9bcd:4acc%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 16:55:51 +0000
Date: Tue, 22 Aug 2023 09:55:38 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <lucas.demarchi@intel.com>, <matthew.d.roper@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZOTois9cch4GZpfX@msatwood-mobl>
References: <20230818220824.700519-1-lucas.demarchi@intel.com>
 <20230818220824.700519-4-lucas.demarchi@intel.com>
 <ZON1ew4Z2aRBG0oG@bvivekan-mobl>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <ZON1ew4Z2aRBG0oG@bvivekan-mobl>
X-ClientProxiedBy: MW4PR04CA0370.namprd04.prod.outlook.com
 (2603:10b6:303:81::15) To MN2PR11MB4239.namprd11.prod.outlook.com
 (2603:10b6:208:192::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4239:EE_|CYYPR11MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: 246fc420-45b2-4f4e-4eaa-08dba330a420
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lskIz6nmZYFuBCj0Ho3VllJJr6CJ1AIvpMA65KmuLpTNewL6AY2taOXzSnpMu2EV8yVYGhuBwys2lOSJSpWF1hCb5AVSpeBixueWu0HBHltigznXG9DOUPUNb6MHl49wDN4wG3BTFy+3WZk/rDItH1HFVBnX+wWfIvoL5IuV4xL1xjytsKi4Qu15PMQbsBHGP3cTODutylUalZBdATxhWhkVY4dQK+hHhdueYbJOoi6sy9RPACABN/zjP6w3kloay7Xr6MB/2jXIwF0ivq/65dlc1uyeREbatw4EOPV45J/luXum7N3YQupiWFWUMuCDGnnfSVSFmLu/kbNOW/6L1ioGVR0SwtHS1RAhnHFwLd21cGoC9bjwad+k74y91FLPAZkidYMsmI9PwklpiFJNeOGGs19ukmPSqAgxlcub0g8QqcA0YMsdYox6s92e0uoMGnTpkYz6A+7k6FU9yGWSIQeQXnEvj0ZA/l+Bo77DvxZ15q7gBUOQmZjmAaxnYxbtdB0JXOOfUqPjg6/GrzqtjzXHGvOPW6WGvaMvRO/EvDHW+ZxgiiEWfbiefDkV1GYP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4239.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(396003)(136003)(346002)(366004)(376002)(186009)(1800799009)(451199024)(54906003)(66476007)(66556008)(9686003)(6512007)(316002)(66946007)(82960400001)(8676002)(8936002)(107886003)(4326008)(33716001)(41300700001)(478600001)(6666004)(38100700002)(6486002)(53546011)(6506007)(83380400001)(2906002)(86362001)(5660300002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUllV3lUSXM3TnM5OFBNQ1o5L2Z3cTNwT0ZISjhscnp2OURJUXV0L0ZPTHBR?=
 =?utf-8?B?dllueVhHeDZzd3h3eTFlVHJPK3RRZ01ZYWx5VmhjdW1kYk0zQmVmUmJaR2Nw?=
 =?utf-8?B?dUFjN0FteGZGaU9sK2pxT3RUR1ZCckdoTXJvSGtkbkRjaEtzOXJkeHQ5dzc3?=
 =?utf-8?B?S1NVT2YxWC9oeUdiRXBhSXZBYUVmZjd5d01jYi9VNGtTVldvQ3piNVM4VzRP?=
 =?utf-8?B?bzlxdE5EN2Z2bnNCSFJTTnBUdW1GOXNqTGlMZmpTenRFYWNUaHh5NG1kVjhV?=
 =?utf-8?B?QXNJOHRqSndxdFhXd2o5U1Q5a0hsdUg2cjlCK3JIcUFLcERmeXZuNmhtaFI3?=
 =?utf-8?B?V0twRTA5YVExT0xnNWFxQktkTXVpL25sK1BDdjlqU0pPRFFTYWNqbk5oeFJo?=
 =?utf-8?B?WDNmeEFQQytZSFhMRExaM0ZsOHMzTmtsV3lZVGtxK0FOWVpTMm5BNXBOSnJP?=
 =?utf-8?B?ZUlKNjZaQjBWWkUyV1NSTFl6a1JDSUVZanh5em12ajJweUx1OElHRk5jcTkz?=
 =?utf-8?B?YTdhcGozT0I3T3N1RFE5dWl5VG52dXFyTlBkUDZVTWV1UkV4UmRucWZTNXY1?=
 =?utf-8?B?Ym5TZGd4bXdwOE9qNVhjajlzNDJxWEtlbVhJM1kzejU3VTczVEZ4ZFhvaHdW?=
 =?utf-8?B?S1dMeFUwdGYwNlNsSS8vMDgyUHJiWW0yR2o4T1c4YmY0WWhGNUlJQ1BsTkVp?=
 =?utf-8?B?WTlaMVMvUEhrd21UcWs4UER6cGthcDBrNWg2YnlnSHRjOEp5ZHZrZFgya1ND?=
 =?utf-8?B?cXJUT3hJbW4xQlhjeG9ZalNkeDExbm1hanJ5UzNqcksrdG1xdjVUY0JpcFdi?=
 =?utf-8?B?cXZxV2dodFhtVDBMb2o5MXlLSzEwN3Z4WkpNNDhPWERLcWRFUnk2aUJWaVY3?=
 =?utf-8?B?SzdiQXZ6ZTdMU0lFbFVjNWpQZmN1T3dsclkrYUpYMWQ1SWUyUG5SbEZXcEpQ?=
 =?utf-8?B?VzZDTnd3eWtBM1VNUzJvWVE2dnZmeTN3RjB5elBSYXQxMVNid0NrTmsxVjFL?=
 =?utf-8?B?WG9yZi9tUVJDTWk3aHRxT3ZVM2hreUMzTTcwMnJzdi8rQXNldkZSdHkwU3Uz?=
 =?utf-8?B?STE3dHhoTnRtNVVnc2lDaTNOZW1FYlVWVSs0c29Qa2JaUVd1cFViOWR2Smkx?=
 =?utf-8?B?ckVOQW1Nb1MxRGJpazNWUGpXMTJxVFhVZ1d0VnB3YU1wc0FGQ0RyVStrRXJM?=
 =?utf-8?B?cndZWFFwaDVzQUhZbTFtc1EvUnVTN2E1OTd5UTByMGIySjg1MzJLMkNUMk5p?=
 =?utf-8?B?cWpJY2UwZGorMUZFRnZNNWd6R3ZqSVQrNysyejgxZzBWOW96cEo2N2ozcmVt?=
 =?utf-8?B?YjlnelF1cHl5WlNLNEJNMWNQWkV1bU4vQUY4cnJ0MnVXL3BmV05GS0ZsaFA4?=
 =?utf-8?B?ZTA5Ymt2bFpWeFR3aTFvUGFmVFUwQ053a0xOMHRnOFM0Uy9ZTndaU0Nhdldn?=
 =?utf-8?B?SVQ1aExiSS9VYk1JSlRtQk1UT25wN3YxSE9lei9EYWhxUGhHa0NpTW5MeUtY?=
 =?utf-8?B?SkxiaEpQdHgwYTI4YU40MkJHMEY0cGIxVGU0cmtJcFBQY1Y4cGlTV2VTZ2lX?=
 =?utf-8?B?OXl0bFVrYTBDVmRQOE9WR2MwRXhNK1k1UmFJZTV6aFJtS2l2a01Oajg4TXZS?=
 =?utf-8?B?L3RaOEpjT1ZBZk9BQkdtQUw0YW5GSmlOUy9MN25jU1V1cDBFblhzKzA4Kzh4?=
 =?utf-8?B?cWRlM2tYay9jRG1XRDdtcVo4eUZjMHdBV3VweEljN0ZUWEt2ZHhBeHA0LzNn?=
 =?utf-8?B?cDRIT1BYRmRqTlpXMTF3a1dDWFJIVXgxTmQ1clQzbnFVcGxISUN3ME9EaWxI?=
 =?utf-8?B?WmZGVEpxUm9JYnRuYXpqS1Y0SmlRN21EZHFHK1pjZ0UxckJHMjhjdUl0S0VF?=
 =?utf-8?B?YytnRkZNSjBnS24zUFhzamhxRlUwZEdSOFFRcXZtT1FzMVIzNFhNd3pDZXZy?=
 =?utf-8?B?eGNISkRHVUU4WXdVemlKYlJjQzkrNmpFOS9DaXJoZjhTYVNCYWVrL0ZLUW1E?=
 =?utf-8?B?VitiZCtVdStjNThDMVFCVUtCbmtESmcwd25EOVJ5bllISnpyVFFDY1NDSXph?=
 =?utf-8?B?UGpTc2UyUFBvc3RIYXJSUnpwWTkxT0M5Zkt4RVBXWUJmaGhCNC9tejdJOGo4?=
 =?utf-8?B?Q0Z5UzVLNW9lM2RZSDVmSno5dWVLRXQ0bVc3MEtpZGlhNEh0cDlpRmI3VXIz?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 246fc420-45b2-4f4e-4eaa-08dba330a420
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 16:55:51.4038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yTnmpNyP3tpwH7xuoZS2hbWthKuDLZY82ux61CS3urZClIIhrx7akT5FvqlUDEUFPJq/jVjqMcY/Bcd/cvWdDYu5hPtFdgW+ZFhUDpVD1Gc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8431
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 03/15] drm/xe/xe2: Add MCR register
 steering for primary GT
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Aug 21, 2023 at 08:02:27PM +0530, Balasubramani Vivekanandan wrote:
> On 18.08.2023 15:08, Lucas De Marchi wrote:
> > From: Matt Roper <matthew.d.roper@intel.com>
> > 
> > Xe2 uses the same steering control register and steering semaphore
> > register as MTL.  As with recent platforms, group/instance 0,0 is
> > sufficient to target a non-terminated instance for most classes of MCR
> > registers; the only types of ranges that need to consider platform
> > fusing to find a non-terminated instance are SLICE/DSS ranges and a new
> > SQIDI_PSMI type of range.
> > 
> > Note that the range of valid bits in XE2_NODE_ENABLE_MASK may be reduced
> > for some Xe2 SKUs.  However the lowest bits are always valid and only
> > the lowest instance is obtained via __ffs(), so there's no need to
> > complicate the masking with extra platform/subplatform checks.
> > 
> > Also note that Wa_14017387313 suggests skipping MCR lock acquisition
> > around GAM and GAMWKR registers to prevent MCR register accesses in an
> > interrupt handler from deadlocking when the steering semaphore is
> > already held outside the interrupt context.  At this time Xe never
> > issues MCR accesses from within an interrupt handler so the workaround
> > is not currently needed.
> > 
> > v2:
> >   - [0x008700-0x0087FF] range to extend up to 0x887F (Matt Attwood)
> >   - [0x00EF00-0x00F4FF] -> [0x00F000, 0xFFFF] to follow latest
> >     bspec version (Bala)
> > 
> > Bspec: 71185
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
> >  drivers/gpu/drm/xe/xe_gt_mcr.c       | 50 +++++++++++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_gt_types.h     |  1 +
> >  3 files changed, 51 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> 
> Regards,
> Bala
> 
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 55367dcca603..366818127317 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -143,6 +143,7 @@
> >  #define   EN_32B_ACCESS				REG_BIT(30)
> >  
> >  #define	MIRROR_FUSE3				XE_REG(0x9118)
> > +#define   XE2_NODE_ENABLE_MASK			REG_GENMASK(31, 16)
> >  #define   L3BANK_PAIR_COUNT			4
> >  #define   L3BANK_MASK				REG_GENMASK(3, 0)
> >  /* on Xe_HP the same fuses indicates mslices instead of L3 banks */
> > diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > index 9eb7a6a1348d..26f69e52b120 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > @@ -181,6 +181,39 @@ static const struct xe_mmio_range dg2_implicit_steering_table[] = {
> >  	{},
> >  };
> >  
> > +static const struct xe_mmio_range xe2lpg_dss_steering_table[] = {
> > +	{ 0x005200, 0x0052FF },         /* SLICE */
> > +	{ 0x005500, 0x007FFF },         /* SLICE */
> > +	{ 0x008140, 0x00815F },         /* SLICE (0x8140-0x814F), DSS (0x8150-0x815F) */
> > +	{ 0x0094D0, 0x00955F },         /* SLICE (0x94D0-0x951F), DSS (0x9520-0x955F) */
> > +	{ 0x009680, 0x0096FF },         /* DSS */
> > +	{ 0x00D800, 0x00D87F },         /* SLICE */
> > +	{ 0x00DC00, 0x00DCFF },         /* SLICE */
> > +	{ 0x00DE80, 0x00E8FF },         /* DSS (0xE000-0xE0FF reserved) */
> > +	{ 0x00E980, 0x00E9FF },         /* SLICE */
> > +	{ 0x013000, 0x0133FF },         /* DSS (0x13000-0x131FF), SLICE (0x13200-0x133FF) */
> > +	{},
> > +};
> > +
> > +static const struct xe_mmio_range xe2lpg_sqidi_psmi_steering_table[] = {
> > +	{ 0x000B00, 0x000BFF },
> > +	{ 0x001000, 0x001FFF },
> > +	{},
> > +};
> > +
> > +static const struct xe_mmio_range xe2lpg_instance0_steering_table[] = {
> > +	{ 0x004000, 0x004AFF },         /* GAM, rsvd, GAMWKR */
> > +	{ 0x008700, 0x00887F },         /* SQIDI, MEMPIPE */
> > +	{ 0x00B000, 0x00B3FF },         /* NODE, L3BANK */
> > +	{ 0x00C800, 0x00CFFF },         /* GAM */
> > +	{ 0x00D880, 0x00D8FF },         /* NODE */
> > +	{ 0x00DD00, 0x00DDFF },         /* MEMPIPE */
> > +	{ 0x00E900, 0x00E97F },         /* MEMPIPE */
> > +	{ 0x00F000, 0x00FFFF },         /* GAM, GAMWKR */
> > +	{ 0x013400, 0x0135FF },         /* MEMPIPE */
> > +	{},
> > +};
> > +
> >  static void init_steering_l3bank(struct xe_gt *gt)
> >  {
> >  	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
> > @@ -265,6 +298,16 @@ static void init_steering_oaddrm(struct xe_gt *gt)
> >  	gt->steering[DSS].instance_target = 0;		/* unused */
> >  }
> >  
> > +static void init_steering_sqidi_psmi(struct xe_gt *gt)
> > +{
> > +	u32 mask = REG_FIELD_GET(XE2_NODE_ENABLE_MASK,
> > +				 xe_mmio_read32(gt, MIRROR_FUSE3));
> > +	u32 select = __ffs(mask);
> > +
> > +	gt->steering[SQIDI_PSMI].group_target = select >> 1;
> > +	gt->steering[SQIDI_PSMI].instance_target = select & 0x1;
> > +}
> > +
> >  static void init_steering_inst0(struct xe_gt *gt)
> >  {
> >  	gt->steering[DSS].group_target = 0;		/* unused */
> > @@ -280,6 +323,7 @@ static const struct {
> >  	[LNCF] =	{ "LNCF",	NULL }, /* initialized by mslice init */
> >  	[DSS] =		{ "DSS",	init_steering_dss },
> >  	[OADDRM] =	{ "OADDRM",	init_steering_oaddrm },
> > +	[SQIDI_PSMI] =  { "SQIDI_PSMI", init_steering_sqidi_psmi },
> >  	[INSTANCE0] =	{ "INSTANCE 0",	init_steering_inst0 },
> >  	[IMPLICIT_STEERING] = { "IMPLICIT", NULL },
> >  };
> > @@ -298,7 +342,11 @@ void xe_gt_mcr_init(struct xe_gt *gt)
> >  
> >  		gt->steering[OADDRM].ranges = xelpmp_oaddrm_steering_table;
> >  	} else {
> > -		if (GRAPHICS_VERx100(xe) >= 1270) {
> > +		if (GRAPHICS_VER(xe) >= 20) {
> > +			gt->steering[DSS].ranges = xe2lpg_dss_steering_table;
> > +			gt->steering[SQIDI_PSMI].ranges = xe2lpg_sqidi_psmi_steering_table;
> > +			gt->steering[INSTANCE0].ranges = xe2lpg_instance0_steering_table;
> > +		} else if (GRAPHICS_VERx100(xe) >= 1270) {
> >  			gt->steering[INSTANCE0].ranges = xelpg_instance0_steering_table;
> >  			gt->steering[L3BANK].ranges = xelpg_l3bank_steering_table;
> >  			gt->steering[DSS].ranges = xelpg_dss_steering_table;
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > index 48fd698ff62a..d4310be3e1e7 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -55,6 +55,7 @@ enum xe_steering_type {
> >  	LNCF,
> >  	DSS,
> >  	OADDRM,
> > +	SQIDI_PSMI,
> >  
> >  	/*
> >  	 * On some platforms there are multiple types of MCR registers that
> > -- 
> > 2.40.1
> > 
