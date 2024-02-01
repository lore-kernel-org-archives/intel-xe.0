Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FDCC4828D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 21:58:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3089310E6FD;
	Thu,  1 Feb 2024 21:58:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b6L8ufqs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B63A10E6FD
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 21:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706824689; x=1738360689;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pp5MExcI81Lo3fAmVYgL++NqfEFahqAf088NCXJzd2I=;
 b=b6L8ufqs1Yjp2DhYCyknQY3CputrVpB2mUZXIHbBkDNM02D7zk/sOdBE
 yTkm8ZNcxW712X6iY572EsWkxJhf9fEoS8Ps0VUFGkn39U2bj1vWuGD5M
 E0zuPE4tP8rYs1OiAurxU0mVbZSRn0pPTnQCkeaH9IyW6GoReJSxT9RR7
 t8FS271BeFy0u8gmXpkZTyoPUlFmnN/lefrua775I5YEYP0eJXjYQREft
 uKzPDU2YZxjZWC7OByNXA6MhH3GMyNYtoXt7VEfqukjkv4hgmGWD4zk7g
 2TrQkBQQbisLXFlBeEg/8Puvxn4sT8BOmGUSp8zdutaha+t9nC1wn0vsj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="10765265"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="10765265"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 13:58:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="859247164"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="859247164"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 13:58:08 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 13:58:08 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 13:58:08 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 13:58:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGj2h2+AMMAR4R7JGPsO7Bufj4jUjtUNQhLHQR/tDA46Rl67h3C+wznMNZHBqjDDHkP7dOVsbweGlJ1MVDjk+6Sq684RnssmX7YHHlyeT5+pZUHz5zPYgom/nXlSagY6VmZ2SYqbqF3Ksu/mPFxizd/H7Bcgl4c0yaDOjWapH2otGTBtAJ04W3+Y0LimXV/3CZfikcdgw4PVabasToV4Y1vKwklOyfrSU5UxbQfp30dwhpMnYXL8MPTsaakKq6m/qZ3yNIMGGPyb6DgmJRaAAFLUiwGOaBMQlaMAI/Zvy1+GEFrEmilqy2QFceFG9VzN/jhW7KQsbE2NsNHfqn86XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ChtIlj99+sh0+F3YtBmAHTNq6ZqdAZOlyswnlKfCOo=;
 b=RUTok88tIlkvF59MqwzYTdBH+MV9B9Q/MFjw6kRHP0uY1iRXeH8GHMvDTl4g3OGC+MATBekbznIh7pQ0GAgxdvNYyo6b/KgujsyiqveMpXLxoMs+TJ5aXDFrVoTu02EZxPW1obHwqbD6V/cKe5ABDtk6HG5KrTjP6ptZkzGtJtjAoMZS/KUA8KMM8Wm4aqM5O8mswKCXDC5Je8WLgaeqHEgLq+65vlkd5zOqNHze3Wc3nWrTLSgDQTABhpyDWlsWPYXZ9yiT+tGozLgv3EcanqD4VspwI95DF62zNz+V+K4NG8DVg4OwsCeoRMb3hJkCrV98LPdiaoJIFiOcSurHBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7108.namprd11.prod.outlook.com (2603:10b6:930:50::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Thu, 1 Feb
 2024 21:58:05 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.029; Thu, 1 Feb 2024
 21:58:05 +0000
Date: Thu, 1 Feb 2024 16:58:01 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 <intel-xe@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Brian Welty <brian.welty@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 2/4] drm/xe/huc: Realloc HuC FW in vram for post-hwconfig
Message-ID: <ZbwT6ZMnT2nZ8JXo@intel.com>
References: <20240129130308.3544466-1-michal.winiarski@intel.com>
 <20240129130308.3544466-3-michal.winiarski@intel.com>
 <ZbvXuNZjK/qD08RI@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZbvXuNZjK/qD08RI@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BYAPR02CA0008.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7108:EE_
X-MS-Office365-Filtering-Correlation-Id: ffcd19d6-e174-4a3f-b6de-08dc2370de85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WERtauv2EQvAf/V7PYmDdnt037vqD3xgGblhnWCDhX5NwxPRIhS31HdcDIXAHX8av7USVMU0Sx2fY9p7nOukKSruzyQnYEjTl35bqObEurn4zMzoYeDvH5AJ0JrYHE0bhlJTcWoRt96kd0ZHFeI6tqWkgX3776gJWChC32q7Etx8nt4LhDgzbtSKI+lJZ7zSyl0x+qUdgrOR1TBuJeojp+ILlf+TeTdDiYzUneZFm8RKUOytF9x4+MLQlR07IVaAJT04cIi+QoGP6l35Oag2Opi9gTYJmH6FTzJTDoVzdEcpLb6+MMOnxfFt7n8wBG9Me951s9/7j42c3no14q36WjG0ASj5M+nQLJ5a3s1yGNiUvU5lgyYmCgETw8OzaOlf1mhJ8GqNuIk7g/HCKMfsTRcWn4XptHcucoka5q15gwEPXemECfd66MU9PeTsReb8I9U2F19voXdgFT2A0L3AF+BYF+am14PenwpJzjOJi289vzXo3bA6PFNu3eAFTJzLHhDzgWZiFqwzzI/Va+kTTcgOnnSrDl4vLDcrLZxzbzg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(346002)(396003)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(41300700001)(66946007)(6666004)(66556008)(6506007)(2906002)(44832011)(4326008)(6862004)(6486002)(8676002)(966005)(37006003)(316002)(54906003)(26005)(2616005)(6636002)(5660300002)(6512007)(8936002)(66476007)(38100700002)(83380400001)(82960400001)(478600001)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODcxQWZUcVA4WDl1eU9PTFNUUGg5aEx4bnROSWc3aGtaczRjVURkQ1htNVNO?=
 =?utf-8?B?SnBHY3pPYXkyb2FoY0dzUUtrTm9CdGRKUHVtQzhGYUpmRXY5Y3ZpZVdoR3NX?=
 =?utf-8?B?L1NhcStiWGMxc1dzVktSTCt0VTRMRnNVYldCK2lBSnR1T3B3VHNQSTZ0ZmFp?=
 =?utf-8?B?UWhuUzFpUkdRd2l3ZzNvbnlxWVMyYnRUOXFDbHFITDhqMUNKSExNYVc1a1VB?=
 =?utf-8?B?Q3FyaUZzcDJsY0dsKzBrdkZMeUFmc2Z3V3AvZ1NyVnE3eDZUZlk1WFNmUTNw?=
 =?utf-8?B?aHB0c1BnWEErT0VvR2VxT0FkK01QQ0t0RzdsZjg5ZTdjZ2xneHpDMVY1SFhX?=
 =?utf-8?B?ekRscXNSTm16ZGZOZmtBa0xRaHhnTk5zTlRmNXZCTjRZY0g0QytsVm5tYlZW?=
 =?utf-8?B?UDZNaGk0cnVCdnM4dlFFOFZPeWlDZkZhOFRHcEVMSHhPUkhLSm02NUQ3dUNK?=
 =?utf-8?B?eEVUd1FwRDY0eDE1VDRySWw0ZlZCT0RRemlWTmhZUjAxNjhCRWNSYmI3NlZs?=
 =?utf-8?B?SDBITWpEK0ZlNG1keWZVemNqTy9QWnVQSGw3RHZmMEt5Sml1TTdtN2U4cVRs?=
 =?utf-8?B?cGFKRDBVckRoVVRYZEU2ZkxsNVFCd01zcHQ3MmdwQjh6ajBCbmtNUUplaDlE?=
 =?utf-8?B?aWdGVERPNnkzZzhlc2pyZDlyT0svTXE4UGkwUHBIRis1L2pHZXV0bUczMnJ5?=
 =?utf-8?B?azI5YzhrT3JQb0xMUUxGVzY4ZnVEOWhBVHJxTHRLR3VwZUs4YkI3Z0YxeGZr?=
 =?utf-8?B?V05kUWtQL2RTUFlXc3B0bElYdENzMm03a3c0dFlZS1hROXY1cGVsQlQ4UUFo?=
 =?utf-8?B?TDdTTGp6a0xnWklOdnIxNy9PMzNqN2hKazVHcnF1WTQ4anNFdU9halhmYXpm?=
 =?utf-8?B?QlV6djZWcXBka2R5ak8zQUYyV0ZLNmdQd0RNTE5ySzY1QVkyVmpvVWpBazdJ?=
 =?utf-8?B?L1gyU1ZWQlN0Sm40d1Z4NlZoL3ZqNi85Z3ZpU0MxcUZSS3ZZaEp6WHNaVDlk?=
 =?utf-8?B?UmJicVY2M1FiYzZndnV1UkpydFRtNExMbWZvSS9tRFZPWU1pblNJaGhhZ1lq?=
 =?utf-8?B?ZW05RmN1c2lBQ1BoOEFGZzZHS0F5UjRJTmRJK2h5ZWtNa3pPdTFOekt3dkhn?=
 =?utf-8?B?aVkzaThnSmNybHQ2UjBmSnpDV1JnWVZjOEI2ZWVKWE5EY1RpSkNXTHpCZEMz?=
 =?utf-8?B?aFg5SFA5VklhT1NsNlg1d0UyWUhjOGhWV3MxUkJKdDZrN1NNd1B4R0VTYW0v?=
 =?utf-8?B?NDB3TFRHTWdqUGc3a2YvWElnckptcVB4UnBvaVFIYmpabFVPR1VTN2xXUHBP?=
 =?utf-8?B?bVhuTCtaWGxVNlozN2lEbGVWMUVtQ2l3bGdFcGlOQmVTOThtRG5xRGt6YUdB?=
 =?utf-8?B?Y0xoVXFUUjdHb0IyYjkwSzdRanBWelZNYVlSZ3NZVFRmMXNnNGhZM0RNMnBa?=
 =?utf-8?B?WTkzRk1ITDhaeUZwRDRHS0l2WlVzYVVHMTFlSUc2YmV4WHlvdG9vMFdvZW85?=
 =?utf-8?B?WTZDTGoxU1VRcHNzRTRVbUtQUVlZaGtsUDlYdlJHRFRGNndaKzhlRVdqbDVu?=
 =?utf-8?B?VkFHZllDWm4zdGcyTThTOFpsUWQ4QWNOeGNmaFE0bTJjQ2ZhY1RPcXBtOFd0?=
 =?utf-8?B?Z295VGFQRGtraXkzTFFWTVZveFZQK1grTnBKUE5RZ1BtZ003MmswU2JhaDBE?=
 =?utf-8?B?V2N1RTgxRzRpVXQrWXFFNEl2K3ZvVFk0aXFHTGJyTkh5enJXTHRZdzFrcGY3?=
 =?utf-8?B?WWJjR29JUHBDcG9KSERjSHEzVjZxU04zSWQ1OGplUGdVcmgyRk5ZMk9vOGtr?=
 =?utf-8?B?QUR5VTdxazRMRFkyK2pjUWljRGw2R2dyVVR3RUJjdy9IMit3K2c1ZWJ3THNU?=
 =?utf-8?B?NFJFYVVjRFpySEN6eEU5bm5BQWdBQWl6NkZmZXovNjl5NDVVZUxYUklSQXJC?=
 =?utf-8?B?WFBMVCtkbWtlTHpOaHE2SWFLWHI3N0ErbjAwYnR6OGV4NW5ibWZhVHZHMTFT?=
 =?utf-8?B?VWVjVWg2RmhuY0NNN0o1cVg3NXZJeEI0TFFtR3pPb0lhMTQyS283c3JkZzlX?=
 =?utf-8?B?emVOS3FrWUtmMzU4MS9YaXRnUWw0Y0lqRGhWOHc2T1RQNkdwZ2kzTE55SVV2?=
 =?utf-8?Q?khNgp6uLVfNpSZHx7sv7cEuyD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffcd19d6-e174-4a3f-b6de-08dc2370de85
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 21:58:05.8246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q6tiHhMiJnTusmyAE7AIxRvJjixeEFIP5xo3adBx6MdTKiw7lHclkIcJAyutHX+s+5T58lI0qbzpa2a2V6l8EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7108
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

On Thu, Feb 01, 2024 at 05:41:12PM +0000, Matthew Brost wrote:
> On Mon, Jan 29, 2024 at 02:03:06PM +0100, Michał Winiarski wrote:
> > Similar to GuC, we're using system memory for the initial stage, and
> > move the image to vram when it's available for subsequent loads (e.g.
> > after reset).
> > 
> 
> This patch LGTM but same question as in [1] - should we release the
> system memory for the HuC once the VRAM is allocated?

As Michal pointed out, the brand new drm_release_action does that,
so it looks right to me:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/patch/576287/?series=129268&rev=1 
> 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_huc.c | 19 +++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_huc.h |  1 +
> >  drivers/gpu/drm/xe/xe_uc.c  |  4 ++++
> >  3 files changed, 24 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> > index eca109791c6ae..b545f850087cd 100644
> > --- a/drivers/gpu/drm/xe/xe_huc.c
> > +++ b/drivers/gpu/drm/xe/xe_huc.c
> > @@ -112,6 +112,25 @@ int xe_huc_init(struct xe_huc *huc)
> >  	return ret;
> >  }
> >  
> > +int xe_huc_init_post_hwconfig(struct xe_huc *huc)
> > +{
> > +	struct xe_tile *tile = gt_to_tile(huc_to_gt(huc));
> > +	struct xe_device *xe = huc_to_xe(huc);
> > +	int ret;
> > +
> > +	if (!IS_DGFX(huc_to_xe(huc)))
> > +		return 0;
> > +
> > +	if (!xe_uc_fw_is_loadable(&huc->fw))
> > +		return 0;
> > +
> > +	ret = xe_managed_bo_reinit_in_vram(xe, tile, &huc->fw.bo);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> >  int xe_huc_upload(struct xe_huc *huc)
> >  {
> >  	if (!xe_uc_fw_is_loadable(&huc->fw))
> > diff --git a/drivers/gpu/drm/xe/xe_huc.h b/drivers/gpu/drm/xe/xe_huc.h
> > index 532017230287f..3ab56cc14b00a 100644
> > --- a/drivers/gpu/drm/xe/xe_huc.h
> > +++ b/drivers/gpu/drm/xe/xe_huc.h
> > @@ -17,6 +17,7 @@ enum xe_huc_auth_types {
> >  };
> >  
> >  int xe_huc_init(struct xe_huc *huc);
> > +int xe_huc_init_post_hwconfig(struct xe_huc *huc);
> >  int xe_huc_upload(struct xe_huc *huc);
> >  int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type);
> >  bool xe_huc_is_authenticated(struct xe_huc *huc, enum xe_huc_auth_types type);
> > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > index 8f37a809525fb..d62137306d280 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.c
> > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > @@ -94,6 +94,10 @@ int xe_uc_init_post_hwconfig(struct xe_uc *uc)
> >  	if (err)
> >  		return err;
> >  
> > +	err = xe_huc_init_post_hwconfig(&uc->huc);
> > +	if (err)
> > +		return err;
> > +
> >  	return xe_gsc_init_post_hwconfig(&uc->gsc);
> >  }
> >  
> > -- 
> > 2.43.0
> > 
