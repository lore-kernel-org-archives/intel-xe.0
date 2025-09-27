Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D108ACAC5B0
	for <intel-xe@archiver.kernel.org>; Sat, 27 Sep 2025 22:38:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FD310E1D1;
	Sat, 27 Sep 2025 22:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nLm2/M+0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F295610E1D1
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Sep 2025 22:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759012726; x=1790548726;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MyTnqCCEyL4wNxVQOdDwzyit5IOOZu5l9q1/IGmNvvk=;
 b=nLm2/M+0Pwk6/+sAbxXW3LBrPWU769jpxHzUm8D4XRKtfILgoWRO3H3k
 /qrCweQzFRvltDbyo2zNwDEprbqToUokPnl1umlGKybYu0+F5XptD6k9x
 D3IrtYUykZ0vYJOUFG74+YcJFGJYMsWazOE17ZILqAbC1Uelr34FZOkWk
 LGn9Z2rMsgqj6wLr32hbMvkR4jJfmxz2T3GusZXL/s3cuRr37cpouNnOX
 3SlTI9i7SoMiswoGyj1JpFX0As4cErYetI2SMYhVa06pgQIa7l+Nehs7V
 zqleqjNk3Ci1dQNVaVWO97aFPGdQ4gHTYzEj/7V8J7y1SmiqDR3/EBC9o g==;
X-CSE-ConnectionGUID: XE/fqU5DQ9uD3YBCcwosFA==
X-CSE-MsgGUID: QX0FEvkwSPaDYibK3BtmdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="61221922"
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; d="scan'208";a="61221922"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 15:38:46 -0700
X-CSE-ConnectionGUID: uy72N8DNRI+ebwSdUcFuYw==
X-CSE-MsgGUID: K5A3OgGgRIOnJR6iBEZlfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; d="scan'208";a="183074386"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 15:38:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 27 Sep 2025 15:38:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 27 Sep 2025 15:38:40 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 27 Sep 2025 15:38:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qLt7HQZd3B508ozBL2MjXKUz/V4Ekqs0hmkdd02R4oVjlagmjxSjtTeFsnJ9L1ae0D7R7kJztuUtLOD5b9TTagru8nXOQmymwqDZWvHJRhVFs2WzaLvt98dMmI+F+0aW3eZhJQsSurjbJjNG2FuPA/ol6YXreKDo3duF/G/afVuRUkeTOb9PYzRnKMEnNsXy/bQIf8bwmYw+MUsDqPptq7KR2psJu3JM9iRYXPYBpDCHmZvIbgY+GSgoySVW/TZLxhuTz6YowcdZ+HgOsWkVihR+PgA3eWit/LF1Iysv69LDKzc6+2FZyXSMK6638y5nRxGKqXmbqiwg/AJHVpPMNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HV3gLLoQpnSqGptqYoiLLJD92LfbwAruGktZ6QsBD+Y=;
 b=Nk/tvx5Tth/lH4mY5M9C5djLtpn2+bvNTrw92I3GnvsYHSlGEucb5198BScorTNmcAbK+cZ0v/dqp6Uy4B96weQh8iHsS2WccEcIifo2n1yWPa3EMol0ikNSdlSClTiIg1qo4ucZfCMO5nSu0Bgf3+8s905HKV90AVJeOwLwU+cpzDXq7izIl8wEcFvIH1sJ3zUPnFkbrjIQRJcXK589T3/eOCa6VzgG9LiYjwacz2VUGZ6jeCS6c3nmPCDrJJOfoYj2jKvo0a6l2TO+jzP+cunOXTdCj1MWwOthd2iZivQ/+6PaT+FoULoWpbp7ZVsr/Ofk6Ijsex5kfaGuUG4O1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB9510.namprd11.prod.outlook.com (2603:10b6:806:47e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Sat, 27 Sep
 2025 22:38:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Sat, 27 Sep 2025
 22:38:36 +0000
Date: Sat, 27 Sep 2025 15:38:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 25/34] drm/xe/vf: Abort VF post migration recovery on
 failure
Message-ID: <aNhnauoMOWvoAGvF@lstrano-desk.jf.intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-26-matthew.brost@intel.com>
 <104b4c4b-9bb6-457e-86a3-82abace6e759@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <104b4c4b-9bb6-457e-86a3-82abace6e759@intel.com>
X-ClientProxiedBy: MW4PR04CA0229.namprd04.prod.outlook.com
 (2603:10b6:303:87::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: 20241065-5a1e-476e-ee9d-08ddfe1698e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fZQCS2kx/XcMgYqPmrrc7gnfD7XHhCHQJPr8CJCW6UzWZET0QgUbXkFZoHBi?=
 =?us-ascii?Q?2cyfJGcL2KhGJAZ4Q45t6wgcDzgCy/r/GyLTOTwwSKkjLf8VqoUIwvEbuJr3?=
 =?us-ascii?Q?CbK/H/OH2nVFzLhZq+HJZlRshlKBHdWVsrS8lfoODh7CAvuW/e8hO/f7DtwK?=
 =?us-ascii?Q?8bZ9/1lPu19ANgKk6miW4+gNl4D5E9YV1A7USZhqsnUjBI5pishJhkj5CPLk?=
 =?us-ascii?Q?SpGOfZspw2xJTQyd6BXXqmbg5CBDlPPTv+pSAvFInMI3PJ5bNe2nKx/flGfu?=
 =?us-ascii?Q?cODxdkCGFfGjxQUDIp2Tbs3T4BqEO/u2mUZtxL5mTfnEOsm6J6NjYo2f9gVX?=
 =?us-ascii?Q?gw0pC79bBlLwuHheOHDmSnv1TvMwx7ISsUEDnqlGq5Jxb2+tDdryNuF4yk1a?=
 =?us-ascii?Q?WohH1UjhkbzpbcM6lbohKoXfbKnK2WKEPEwYiUYzSl63YdSnt6obhxlIBA69?=
 =?us-ascii?Q?1Cua5SPF7zBxLeqzDd5j5vlhSrOS25SrYTdom36gcsMqzm7KRArCs5IbHYep?=
 =?us-ascii?Q?An4PuRAkEy5tPBSWL/ZkojrH6dXsJmYsPHd9toymF23Ecq2Jxj0uLJcmzyWz?=
 =?us-ascii?Q?J+U+RSjx5M/nM1kALAWlM/oZhQSnECAaiHMy/x7tBwdBhI0D5bfSZAuKzjni?=
 =?us-ascii?Q?OacSMYadbJhFPbC+EfqxVchnWoW6N907a8KsPwQaxa1jZSQ/NEd7cEb4XTzE?=
 =?us-ascii?Q?k/aAefSDqV+/n/TbXe3/G2V/CUgblhzTRrViSKAHuibgxUazcvm5N2ob2IDw?=
 =?us-ascii?Q?kLE19wBECJhxQMGKvTE5/+nwjhENFUHx+Qh1SacYmBTM8DrkYnktUwOWjcLk?=
 =?us-ascii?Q?9TDUnqLI3H5a1+etnb40MsrgPe2dUTxH4ypRTURSBwmZCF7lIAryRo0TaxVg?=
 =?us-ascii?Q?8wEQR714PdlIHtWXTmWA304H30daBEnkW37DItmq0KaHRwZqcsVNyS19/H1u?=
 =?us-ascii?Q?scem9bPvb7Pts7pC+nz3gBGfWmateUKMjtT74iTwvdxr4Yvt9aiMT12akl7a?=
 =?us-ascii?Q?bXEx4l4xKi5dzD9qaK3yRMLREUoQUy/YShGTkx9YAtM5jxxLiDshDgCcmUIG?=
 =?us-ascii?Q?Jtky6LKnNATWU/MauUA6gPfGyZsFX/FXZVsvHqow6TrysJod9SWyi4n+xf/Q?=
 =?us-ascii?Q?coyXKvXXWXrGj78PC+DWNlZNVxXYbKgLNzgJA/6ThdGLiVaI65QNrhRWb5Bj?=
 =?us-ascii?Q?wnyjgu7/fDFiBXRMaRcDKXZ+BIi1hH+i49XnEZlioCnvPyWMMweAFoo1noCd?=
 =?us-ascii?Q?J5dA6ztHOmdF9qnboiSweD/1vsb4g+OJ62fQosHGVxWLhdGvDBCMqoq6JVhe?=
 =?us-ascii?Q?2Z6AolErjk+xGYmI3ZPAcOrrSizPYcpASUFjWUvk+UrThLtahjpkwBTnj1FS?=
 =?us-ascii?Q?K1PHWKThKH1EUc3MCBDdXjPtztYidty/hTzHh/CAW3sLEm7F6dLUTBlHfvMv?=
 =?us-ascii?Q?Kdcg8DpVSFmthJGVfWHA4FDD7Z62ofeh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iIR9s4fE/pQWDtFuM6PjFJ/Q+NWl24GnrSTQVft3NqImFPzJsgJ8DI43TksM?=
 =?us-ascii?Q?wNZwjuGSYPHoLN6UL3FCnYqofjVTIyG/F48d5wfkSlg/CAIVnpLaXGIyqwGh?=
 =?us-ascii?Q?zuJX4ok5hMGDbsBef1cA4mTTA7O0sur4vcB7IoZ9DqKxsutdali9a+O5DxDS?=
 =?us-ascii?Q?L73CwQaAf7zYrtsnhiFNaxGwaP/mlhrWLV1tAWCkLGaD2wJx69E5ykdNDjUt?=
 =?us-ascii?Q?ykALejrKYHfN+ecJuiG9JIE82RegCfvy5CKwvjxfLFzHayYKcSHVDEexkv9K?=
 =?us-ascii?Q?Vg1AkVIHwWIUVtJ/Zt5WWVfh/BvXehF3fF1tGU6vMiyY+M/2YuGvMmIQs5jE?=
 =?us-ascii?Q?mjilqlmgyk72Z/5PTFBB47795/MVQjRJraTQIIzCxlN7QdG3Lx/To/3vRc8h?=
 =?us-ascii?Q?oCtJZDmdyDQtUdDmLhaRKNeR8YATfX4/+6O0jMo3I5E7NhIh13un8rhCGbbe?=
 =?us-ascii?Q?yfPtvMiPcjwosLn1qpl3Ub9YnB7AwISKsvVYbvP4J5KulS1yPbxwI746c1Tc?=
 =?us-ascii?Q?azrluwDCWxb8+z+rMbNVBBeRbjxOOxjpjCEtvl+j9ftJIIqUXUW5QRUFc4yo?=
 =?us-ascii?Q?wQhf7SMLiy8yy3PcEEpNfzVV/wtdZJcg7MwkWg9iKzEFDGbbwRXOmxwDeFy5?=
 =?us-ascii?Q?xuatjxOkx92f68BizS6SEnKCvxxkfYsd92+uRQVrfq6cYyN2BuHKhIlAlY+/?=
 =?us-ascii?Q?ihYbs9Q8cwuUQOczZScz5Yg2ewuwLMZYJTq7q8Xz/oMkWYNSpT6VKfpqhp1r?=
 =?us-ascii?Q?BxxTzAQDMG2S9MSwf75xnTzSLTBYTY6JWuKWFN+IY6o3WagaDyE3EP8E1KXr?=
 =?us-ascii?Q?B0wKOo495oJk2TxWo06zG2CZkHr1bGT5g7BHdYUM3Mr1EbRB8a8QE1NgIjDw?=
 =?us-ascii?Q?ktHecWmw5DzePTwNMXv/M8uqboeu7b7v5irKt3H9GS8tC61pWjgizfS5Dot/?=
 =?us-ascii?Q?xCRWqT7FZEGiWz8lS8a39tJS8pAZgUmtFC+8456/3ZiFRm7xp4XqvtscugFD?=
 =?us-ascii?Q?tWzBv2SGxkdOSryN8jiENCwnu1eXCgr8ciJCwt8uCQ2r4rE1o4WGSezDI96F?=
 =?us-ascii?Q?YqHfzkrHtxoxzdBTetCwMW/leVje5RUQRdgAAc9zK2SSZVJsYO1vbpVXBXOM?=
 =?us-ascii?Q?qEipt1M8Si9N5PlXX72AWh38qcpAtZu6Csod1CC9Z4YsAfGrfowLSgtrR0RW?=
 =?us-ascii?Q?Af/lB1g2c9oV6oauKanu9YyH6H26PaH7av+p5iVlKoNSc5YP8+sQt/8W8GkO?=
 =?us-ascii?Q?I4zypUgDnzVQtIL3iq878LFtrU3G2YSwrx0QKEmaADmfOLszDzbpUUa7/5Yz?=
 =?us-ascii?Q?I42Fk8xWz1vWlBk0X61QjBz5F4JYXe7OGURLI/eH7S07IYoLS090esKx3X1l?=
 =?us-ascii?Q?Il5gk8eZ001+7duvpLjQ1AxPhUSItYNrGWyxfKNPwhKcELrWrU1L28utqwGl?=
 =?us-ascii?Q?rk9+DDj67WZi3fSYzWF5aWNCiFi0iX2vovwRfawJx5tr4L2ZOi0qTDgj6QQD?=
 =?us-ascii?Q?QztkmklQ3HbSytcwvUrEdPh3dGLZ3b8seNGpVUfLvm8Wgc/bJzYMCVQZtp8l?=
 =?us-ascii?Q?0FELs4KzqnxCu8pbPBY9q3PDA37dsgdKvX9ehYK5MwApFnPgLwwz4kLjZwMZ?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20241065-5a1e-476e-ee9d-08ddfe1698e3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2025 22:38:36.5836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eDN5vuHIGTSyVzWnx2yyaHcGJnRBcoZNvxrCr4SfiLBHQRqoN0xucgeAaz058uk6cGFDnx3+LQVbPzjWmUmalQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9510
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

On Sat, Sep 27, 2025 at 01:54:35PM +0200, Lis, Tomasz wrote:
> 
> On 9/24/2025 3:15 AM, Matthew Brost wrote:
> > If VF post-migration recovery fails, the device is wedged. However,
> > submission queues still need to be enabled for proper cleanup. In such
> > cases, call into the GuC submission backend to restart all queues that
> > were previously paused.
> > 
> > Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 10 ++++++++++
> >   drivers/gpu/drm/xe/xe_guc_submit.c  | 20 ++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_guc_submit.h  |  1 +
> >   3 files changed, 31 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 34e57f44fbf4..a987560de2c7 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -1224,6 +1224,15 @@ static void vf_post_migration_kickstart(struct xe_gt *gt)
> >   	xe_guc_submit_unpause(&gt->uc.guc);
> >   }
> > +static void vf_post_migration_abort(struct xe_gt *gt)
> > +{
> > +	spin_lock_irq(&gt->sriov.vf.migration.lock);
> > +	WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
> > +	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> > +
> > +	xe_guc_submit_pause_abort(&gt->uc.guc);
> > +}
> > +
> >   static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
> >   {
> >   	bool skip_resfix = false;
> > @@ -1280,6 +1289,7 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
> >   	xe_gt_sriov_notice(gt, "migration recovery ended\n");
> >   	return;
> >   fail:
> > +	vf_post_migration_abort(gt);
> >   	xe_pm_runtime_put(xe);
> >   	xe_gt_sriov_err(gt, "migration recovery failed (%pe)\n", ERR_PTR(err));
> >   	xe_device_declare_wedged(xe);
> 
> We could alter the order here to make sure all queues have cleanup
> triggered. Now only the ones which were previously killed/banned/wedged have
> that.
> 
> Not sure if it would bring any benefits though.
> 

In general doing things like this (doing things behind users back) has
proven to be a bad idea. Also in wedge mode == 2, we intentionally stop
all queues from being torn down until driver load - this enables SV to
come in and run tools to debug hardware issue or we can examine general
hardware state without it changing. 

> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 52b86cab4ec5..8bee65dd9ca6 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -2345,6 +2345,26 @@ void xe_guc_submit_unpause(struct xe_guc *guc)
> >   	wake_up_all(&guc->ct.wq);
> >   }
> > +/**
> > + * xe_guc_submit_abort - Avort all paused submission task on given GuC.
> 
> typo - Avort
> 

Yea, will fix.

Matt

> -Tomasz
> 
> > + * @guc: the &xe_guc struct instance whose scheduler is to be aborted
> > + */
> > +void xe_guc_submit_pause_abort(struct xe_guc *guc)
> > +{
> > +	struct xe_exec_queue *q;
> > +	unsigned long index;
> > +
> > +	mutex_lock(&guc->submission_state.lock);
> > +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> > +		struct xe_gpu_scheduler *sched = &q->guc->sched;
> > +
> > +		xe_sched_submission_start(sched);
> > +		if (exec_queue_killed_or_banned_or_wedged(q))
> > +			xe_guc_exec_queue_trigger_cleanup(q);
> > +	}
> > +	mutex_unlock(&guc->submission_state.lock);
> > +}
> > +
> >   static struct xe_exec_queue *
> >   g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
> >   {
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> > index f535fe3895e5..fe82c317048e 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> > @@ -22,6 +22,7 @@ void xe_guc_submit_stop(struct xe_guc *guc);
> >   int xe_guc_submit_start(struct xe_guc *guc);
> >   void xe_guc_submit_pause(struct xe_guc *guc);
> >   void xe_guc_submit_unpause(struct xe_guc *guc);
> > +void xe_guc_submit_pause_abort(struct xe_guc *guc);
> >   void xe_guc_submit_wedge(struct xe_guc *guc);
> >   int xe_guc_read_stopped(struct xe_guc *guc);
