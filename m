Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A054CE7D0A2
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 20:49:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EAA10E18B;
	Thu, 21 Sep 2023 20:49:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE9F10E18B
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 20:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695329352; x=1726865352;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=X/dJTjzDr39ljsmPWH1fW0M9zQVAMSUabp1YPzVw21A=;
 b=VSdD7H8+zc2MmT6GwqKU1fH6DapGpuQQPFxoNavRJUgtJyw9Z/BF5rl8
 bDKCL6hedF8Ts2/OL0v9hqK+5VdFPpphkLRM1A4q4pckEbYA7/dyFLJDg
 QU0rV+ueGdBBq0OllbZAOMQuGK2lYBw10b6jtUrd1rqkNHzwwYtd62hea
 5pF/DPKsvzRtsUrGSSIdcqtve3WX1ksIHBCLmAw71Xittvwe8EVn+y2r/
 CYX2obn0MOgyWlsRh4myx0WdIivGLVjWmR77OfaZ3YaFWBFJG7yC5TwDo
 oGnECtQ7U5mufqGg9epmhSU4qcyopMLxMHVtQ0AqXvlT3MQB4W3aO10/Y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="379536290"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="379536290"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 13:49:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="817533713"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="817533713"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2023 13:49:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 13:49:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 13:49:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 13:49:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 13:49:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dP47rUMozO31ExJnZXuMP63a9vSbrgTqUOlhLZhc1Uwq+oILghw/T47g5QGsHxjd607wXKhN9bn3QETMONufxDYLBToXRdKRbpQuNQgXL1nxEBH1UblYjEOVYVM2UN0JnCt4BWQFnFnXVRRnf/xT0zfwEV+5yR3hKrm8XXsrrZBXnQZGqjqsSF9d1ld5j2HBe8CqCQOcfXnBpX4THq2144y2VnFDtzKk18ncIX4Cq7qv5BA5Af9oaueA3FOa3DgPSvYBQXKZ+krgb2fzP+ee9uZARTvYs0l/RV6pJML5cVHF7+6A/Wqkz1lLTbp/inF6xaE5QJnvQoGRq/LspsPGLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/MZaT2lBO01OSKcSDwwjOCiaU+OwqSeoe0czKa7GUI=;
 b=nf+cNeBNKlIE831rO5mT56C/il+wKTxsK7WhGKAEwIK6gpfQoiV1jRN/dbmuibM9nAWOfi7cLX7NakjwbQC30KMg93sJwHeSi0GrcBq79Sia3KpTz3fEOkc5NZrn0h0vIjCMLAHkgX84msFiK/Apk6mJCA/t/D2vpSjf/afBdnEXrCEuyY5qPBktivlMz4C0guGjAaXDswU8L2+UnMdhXvHARtX/DcDXtR6aZ/uytHoLIfttZX/Mki7dXbqGd4XkHvxWTiHLQddbA8Iz+FM1UztA51oHBemB8t5SyV76AVUccdDhO9XmUA2VqdlgfmxOZzRs8JwnQ5ZgiMb6UgMkDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5523.namprd11.prod.outlook.com (2603:10b6:610:d6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Thu, 21 Sep
 2023 20:49:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Thu, 21 Sep 2023
 20:49:06 +0000
Date: Thu, 21 Sep 2023 16:49:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>, <ashutosh.dixit@intel.com>
Message-ID: <ZQysPzeenUYVVIDr@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
 <20230920192940.135004-20-rodrigo.vivi@intel.com>
 <6e8dc2efb800a305bb651f576d0ef22c5aea1cf0.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6e8dc2efb800a305bb651f576d0ef22c5aea1cf0.camel@intel.com>
X-ClientProxiedBy: SJ0PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5523:EE_
X-MS-Office365-Filtering-Correlation-Id: c85e7fcf-5f9a-4609-b947-08dbbae4328a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nPl+CXZ931XDQCqlJNOktNkLfS365wI4XMK1utoqT3U9GTHmSERS6t4Yz2WV6P07dZIOm0z6Z00wUdx1/Bhhrxq1kipLehPXT3CXsRmJkkSgNku4Hu1DlJtp27hWGms8spWgqWZ74mIdSbVFFWlTWQj6Kc6UIZHBW0rC0XWf98S0acODccn0VLl8QNWqSq/vYdN103Li3TtDjUBqV/QpfbMmRyuwMduNJw4T3EYuUzi2ZeVri/a7nR9GFs78M8IUowOVXXwW0XBuT1u6E3xKF8diqYbPfikOwTADclUnhicLaSFOcFLXSuN1MWRktXXSNYnMbLMwl+6CD8G7zMMHNOqyq98X4jRZpTMJhl95Dwd5c7/stq8waGjGDcHBU6qEMGg2C4jY9Kbnf8SJVR+Dg1QBNWV0+cxxLf233behZxukclLixeCZL6vGBw4el13Uj99DO62XlLvUZvJ/nSj8v++78jk2Bnq1mkKn2rgmVOnaJ/pya7ZvBJt9BhWq00j4+c6XIbguNket8Vxgsp+KkXRyDoQSklAIe5JGVMLSpGY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(396003)(376002)(346002)(136003)(186009)(451199024)(1800799009)(478600001)(6486002)(6506007)(6666004)(966005)(83380400001)(6512007)(26005)(5660300002)(107886003)(2906002)(66556008)(44832011)(6636002)(54906003)(66476007)(316002)(2616005)(41300700001)(4326008)(66946007)(8676002)(8936002)(86362001)(36756003)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/Uc9zIUQsTi8vDbaJ8luS6yMsEhKx49WLB3O2by+bxsrMJy0/qW7oAebOed6?=
 =?us-ascii?Q?qiyyEUVFKdVSbnqsxLZ4JrjtgCw05+4pA8ZEb5F9K2UKPQRvVzB6iErYypwg?=
 =?us-ascii?Q?Ywm2bp7NObNbZCldX3MuOl5aqM8yUc9ZwG5u1r2ack2iiYypUVe6Wzfxerf4?=
 =?us-ascii?Q?xegWsj37y35FpOQ1asiLfzKfi8u2JI5Xu6Ld9jQl3q4yJzTx7dWedXjCDvsj?=
 =?us-ascii?Q?lg5vX2OnNp76wFTgb3RoX+ronCO8RBgzbkbpzaoc1uWr48r/FiSFwPKwQTL6?=
 =?us-ascii?Q?j0CLfYkJpM3lmlsEUFt911wmE+Wc7goMDa0/CWQxSGbNKsDzu0vCy+SwCJSE?=
 =?us-ascii?Q?vi5WmGotrMfEKtMY2AI73bRmQJRrjUnQhN+9izwRJ8pQL5+Etc07mkOLX3qV?=
 =?us-ascii?Q?JixTkzXAUQGybtQzpX64J7GiOo+Vf5oklW8yPmKpz1uCz3ybEb+jBhwsrab2?=
 =?us-ascii?Q?nATtS5A/0hHSsZPZZetTFVvk9+rMmu/B/JSHi27ziDPZDTt3A8ozhfix6I8F?=
 =?us-ascii?Q?NDBp/B5ta1bU6pgt6T85Ftc/4T3AjQq1Xn9TWrLTEq/H2a8pNk5HL/wFbthH?=
 =?us-ascii?Q?cXTL75CJHsPw+0U/N4RAG6WEqBB+mnqZVsVFEYQQ6Yrt4uwQdK8Mlaek8qmH?=
 =?us-ascii?Q?iAVBowVWOlIAwtEu7r4gs812kAfOmmyH1I0IU2pwHB/gSCSc5nXxanbYpA8I?=
 =?us-ascii?Q?8Uyo9W0Qj4S/YyRr8wy7gkh5LAJCZdLi6/4b/4SLTTIx2FUetoreggVxUijb?=
 =?us-ascii?Q?dDwmuovB5w4ZZNE5Ru924q4ONkLLd/Y5ynSG53OmAcA3VqjxB0wpUqX59rhv?=
 =?us-ascii?Q?0bMO0XE5fnltOYcwKgd09yfvox7ZDGFaRywLX5dKA34BpDu/5gt6pEqCQ3ja?=
 =?us-ascii?Q?BNeLcI5a0E5+CUlifP2zLM5MV1rA8bnS5yGgdgoxEFnkRYpxTekeUVFfWT9Z?=
 =?us-ascii?Q?NhaEPsBJ5lgaiPLiNzjjnFEnHosgy3F2dM2Ub0Qr/xld597qgTzETwUusIoH?=
 =?us-ascii?Q?Zl8/6bXQEpgsTQtQYezxrAda4e4glW4VrOU4wA+of3zYyUvwpYVuphJOC547?=
 =?us-ascii?Q?pYv9R6WF7wklYUdt2D/xI3vvRCbm6mUI4D2xubCmS6LSNb2VUFd1hHGbPAI1?=
 =?us-ascii?Q?aNBLzUW8mbSODv4BRzmFhqPYLZX6twmsl+XkW4AR4HgiYWHg4aU0wk1EUUqE?=
 =?us-ascii?Q?FJmKuQlQAEFnmjgv2E8p+6VE76QaYPvbzS7XHocxVNlrCpK9/BPhe1U0b3gK?=
 =?us-ascii?Q?ZMSOGkrChoEGLfR7+E6MqC9FAVdAHdmd36DqlESawickRJhXXCPn0GcfTyMs?=
 =?us-ascii?Q?KRDN18+Vonk5SjFaI+/EhtTteD3v23/r/xbCPFcRDEfUfet06j46JMfmcBKk?=
 =?us-ascii?Q?Z9R8zZ1nGMqZweBleouJl44aHOSYS/Dp2cttOjWOk7x6Tk+XHUbtDoHMEKTJ?=
 =?us-ascii?Q?YULRFao2B4IjFTs13BX+3fehnBnPsUQi9D/WMqSjMxBBrGnxHfHLu0pS7Zrw?=
 =?us-ascii?Q?Hs86GX0aPhQ65HRrKH/AzoIhuK1mXpnQCOzRbBS04gKsoEkh2fCxKfWSCN6d?=
 =?us-ascii?Q?fx+NHRbYJE4iB7rEei3j5cg0vnqFoNG0lzgTsrYeY3n39X6Ow6KQrNi6tYce?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c85e7fcf-5f9a-4609-b947-08dbbae4328a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 20:49:06.8755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+J8i2emAqv4iGM5/8dtFzC/r+Tvj+c1WUy6EJ/68nxXblNG/fOHK8bOZyaBTb0FgQKncsCWk6jMVtAntIHlUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5523
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 19/20] drm/xe/uapi: Crystal Reference
 Clock updates
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 21, 2023 at 03:50:07PM +0000, Souza, Jose wrote:
> On Wed, 2023-09-20 at 15:29 -0400, Rodrigo Vivi wrote:
> > First of all, let's remove the duplication.
> > But also, let's rename it to remove the word 'frequency'
> > out of it. In general, the first thing people think of frequency
> > is the frequency in which the GTs are operating to execute the
> > GPU instructions.
> > 
> > While this frequency here is a crystal reference clock frequency
> > which is the base of everything else, and in this case of this
> > uAPI it is used to calculate a better and precise timestamp.
> > 
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_query.c |  5 ++---
> >  include/uapi/drm/xe_drm.h     | 10 ++++------
> >  2 files changed, 6 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index a27b10583f5a..8184df4abde1 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -149,7 +149,7 @@ query_cs_cycles(struct xe_device *xe,
> >  	if (!hwe)
> >  		return -EINVAL;
> >  
> > -	resp.cs_frequency = gt->info.clock_freq;
> > +	resp.cs_reference_clock = gt->info.clock_freq;
> >  
> >  	xe_device_mem_access_get(xe);
> >  	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > @@ -167,7 +167,7 @@ query_cs_cycles(struct xe_device *xe,
> >  	resp.width = 36;
> >  
> >  	/* Only write to the output fields of user query */
> > -	if (put_user(resp.cs_frequency, &query_ptr->cs_frequency))
> > +	if (put_user(resp.cs_reference_clock, &query_ptr->cs_reference_clock))
> >  		return -EFAULT;
> >  
> >  	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp))
> > @@ -380,7 +380,6 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
> >  		else
> >  			gt_list->gt_list[id].type = XE_QUERY_GT_TYPE_MAIN;
> >  		gt_list->gt_list[id].gt_id = gt->info.id;
> > -		gt_list->gt_list[id].clock_freq = gt->info.clock_freq;
> >  		if (!IS_DGFX(xe))
> >  			gt_list->gt_list[id].native_mem_regions = 0x1;
> >  		else
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 45ec20c2765d..5156bac84f20 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -248,8 +248,8 @@ struct drm_xe_query_mem_region {
> >   * relevant GPU timestamp. clockid is used to return the specific CPU
> >   * timestamp.
> >   *
> > - * The query returns the command streamer cycles and the frequency that can
> > - * be used to calculate the command streamer timestamp. In addition the
> > + * The query returns the command streamer cycles and the reference clock that
> > + * can be used to calculate the command streamer timestamp. In addition the
> >   * query returns a set of cpu timestamps that indicate when the command
> >   * streamer cycle count was captured.
> >   */
> > @@ -266,8 +266,8 @@ struct drm_xe_query_cs_cycles {
> >  	 */
> >  	__u64 cs_cycles;
> >  
> > -	/** Frequency of the cs cycles in Hz. */
> > -	__u64 cs_frequency;
> > +	/** Reference Clock of the cs cycles in Hz. */
> > +	__u64 cs_reference_clock;
> >  
> >  	/**
> >  	 * CPU timestamp in ns. The timestamp is captured before reading the
> > @@ -381,8 +381,6 @@ struct drm_xe_query_gt {
> >  	__u16 type;
> >  	/** @gt_id: Unique ID of this GT within the PCI Device */
> >  	__u16 gt_id;
> > -	/** @clock_freq: A clock frequency for timestamp */
> > -	__u32 clock_freq;
> 
> This needs to be brought back, if you want to remove the duplication remove it from drm_xe_query_cs_cycles then.
> DRM_XE_QUERY_CS_CYCLES will fail when running in SRIOV VF as it can't do mmio reads.

So, does the CS_CYLES make sense then? or all that information could/should
be inside the gt info here?

Let's take OA into consideration as well here.
https://lore.kernel.org/all/20230919161049.2307855-17-ashutosh.dixit@intel.com

Cc: Ashutosh.
Anything from OA that we could do to unify these data?

> 
> >  	/**
> >  	 * @native_mem_regions: Bit mask of instances from
> >  	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
> 
