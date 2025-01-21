Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC7EC02182
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 23:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61B110E27E;
	Tue, 21 Jan 2025 23:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DGRw4mMh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E8F10E27E
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jan 2025 23:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737501551; x=1769037551;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bMarsOUn5jrfk4RIibFZvTn/kQORXZQQsNCmkmyxvbY=;
 b=DGRw4mMhY8y4P6Xrpo24g+lSGnTjgeboT4V+BFwSN7Uh0U5cZ5cNTKNg
 jg86a4Vtp9YmYBdw6fNOmhh0vFp0+gaybYRQz3wNrnFetFtEpn18yl9b4
 KeRFGoIyQ9/XjtegvaNGxODlMYTLmUSV5SyXaWjfHacjZ1B0EJY8JGXu/
 0N/lfLk7SCsa3BTa1QdCQBNeKn44Q/CxApQ4GLYyREG2S8PY+hbvcn7If
 ejgfcfvOuof0K2ldaoNM09dN2CSwovMqxoqAyhS2nvUg6EyTht/HNb7Yr
 ydu79GAwF5SCSf5u7S/QbNWnRcsYR+EIGoAmdLQc5Yi7G290iR959PLi8 w==;
X-CSE-ConnectionGUID: 1SvGffaGRyeAtSQsyTCSQg==
X-CSE-MsgGUID: OQTUyrJqTciRg9X0Mt67tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37966319"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; d="scan'208";a="37966319"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 15:19:11 -0800
X-CSE-ConnectionGUID: o+u0OnVrQFyX8PTLHAgXjA==
X-CSE-MsgGUID: FF+VrhIdTraspIrj+dw/GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; d="scan'208";a="111946698"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jan 2025 15:19:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 15:19:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 15:19:10 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 15:19:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YjxDLXs3u9PYgwjYCetbMyPoKPkhh55HJ+FNKRrsA/sGH2cRByQGYi0FE2eH2Tx9R9rlzTacq9UpAQ3qFG+nOu6h3YtpAOET1FLXFPEHpycGh794LMs8uzNF5kjgxfUwCdD56oPnMHBhxVlBVmX8A1UPLveEsiRfnPHje77D3M2bM5Yi4FdYiswT2EduGDpI+b+HIi3CJL+eUVj+SPrvQA8YnytHAtu7qKoUylwOR4pZUMien46MeRAXwWdMup301oZb2VGUEt8v1FneAQbSpQi9oOUQyCUgrvdxLhVJSyO0lDaTtLsl0wJVhZ0h3N2YgXTwLzF9xuMIogRBsNz2+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbQdWG/Q9BZBegx2g6TXjFc7tIZPiLCMmmKc23hY9is=;
 b=EDOSO1FOhg+vpq3XydxTN6txAJhU1ZB8fwNcYTrOLgPdSy5CeL7+EEMHK09T9NgPGoPGEijfS5NxVIJAa7UTiKyheAR2nKkH9tuw7XlFZ7KSb5w0OMazEmZKmdNCHXqUehEpNPwOSXZ22ln+sFQP6uVEovfuplPe5kXdQ2c+fRnqqQ9c6KkAHzX6xbfkbKOXMgsfqrvGzN6jhpQBUbuZts0kv6RdfMO/YXQR3/jgIdoVX5C+UqJlYSDnXTswYfjleab9b8GgwewvCRiD+i5D7IWZ1A4yUgIbcFTm6aMU7TsnhF/lfT7toBZwm4RwUD9NJysfSAudqy4QbwbYOpA1mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by SA2PR11MB4923.namprd11.prod.outlook.com (2603:10b6:806:fa::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 23:19:08 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%6]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 23:19:08 +0000
Date: Tue, 21 Jan 2025 18:19:03 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/oa: Fix locking for stream->pollin
Message-ID: <Z5ArZ_qOzM7OosC6@intel.com>
References: <20250121180354.3221570-1-ashutosh.dixit@intel.com>
 <20250121180354.3221570-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250121180354.3221570-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0313.namprd03.prod.outlook.com
 (2603:10b6:303:dd::18) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|SA2PR11MB4923:EE_
X-MS-Office365-Filtering-Correlation-Id: 4829bbad-b7cc-4ba4-e493-08dd3a720063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wfPDrlT0bTvMmnyID97pSCmjjBPtQ4odWI8MkhOTt7kPp4btDicGuxfguyUF?=
 =?us-ascii?Q?t0FfNySlEJ+Seqvj1DkK6wRch2J7O7rerauOWRp446p73W6trK36w3odAEu2?=
 =?us-ascii?Q?H5FJhD6XNN66qsOnWUvizpGh+YnZry7n3/2/UclFpMN17c1wXj9fQYMDJgF1?=
 =?us-ascii?Q?ERRl7FN9OENSDVpM7eVblBKmJOzTJxz7Qya2/DaYoEq4HAXwfV4TpucL2puO?=
 =?us-ascii?Q?v7ikOeDuSKQ8CA522nYu7iWDBwYty2U6qh7a1XafbuKF7MSa7+cd6593e2gk?=
 =?us-ascii?Q?m6K0rvoVMebU5G9W1W0WIGBTJtdkbnWu6udpnhklnxYYL4680wG4qb4ugazk?=
 =?us-ascii?Q?lIGR6D2thjfCcS+YxYuft9E6CGV+SoZVDoIBwf7m6zYZKYqUfto1OzKdtuI3?=
 =?us-ascii?Q?SKbkadO0YzHIZx3yEhexZhuOOh4cSh2JvYZ2l072OLSIABEl9bQUlGOomFw7?=
 =?us-ascii?Q?hxruvSfWr8OgXE6GOTF4l9sVg8ESJvdROnb5FjgmJsrObffMUVm+fZaiRL3T?=
 =?us-ascii?Q?pMWoXh0gS5ne1oalIUE2yEJg/Evqb+kTEn2XHrqFL/shWZtsrQchmEAR6Vzb?=
 =?us-ascii?Q?MrmatSUVqSP3W9TGHCCpaLLh/b5VodmUN6FI+C5r9NxbNJDt7evUwSppUsvf?=
 =?us-ascii?Q?cJAoxOzGo+daS6mgDY5CqXfbimIdo6DcUiJdv7lHk8DFVXAtjqcHB7miBBu3?=
 =?us-ascii?Q?pM6RfAuPNBgOd7DmBZC1bLbJ7WC8dIqkzqc8STOi4Ow7PzwkyoeRqe/3Yvmf?=
 =?us-ascii?Q?xAXAnpL+Wzi5QHUC5sOmQxqPzjf1gSHBvObDcvitzvCXqin9Osf+KL9Hi75O?=
 =?us-ascii?Q?zsGBZN26IM0wfo9agWVc2hrxnTzmEkKMxj0LQ2KLcrTW2c1Y7phm7UVuYUE/?=
 =?us-ascii?Q?2H6gb9w6tw9yg1qYTuQiAW9ovGEyvdKBAmv4o33xElxeOrX5R+B+YFOZpZFX?=
 =?us-ascii?Q?nNduHmUs5safnqTUoXdy4I60jHqzwiqbPMcY7aa8p3hM/jYII4GZ4L/1HFdB?=
 =?us-ascii?Q?9ZgH0ubxvr8xx4Df/rrajWDUL6NWqI5hePklASGr3qO36puuWNF4ezukmJDw?=
 =?us-ascii?Q?5z4rxdQ0CvCKUOouPcXvlnKAicZDVV6BWr+laFdWDpC8/zAZTUphFuhUpxFY?=
 =?us-ascii?Q?WifGjvmsh5VosUa27YBpt7m2SasIs6esQYb6dUfNMY5fRZRnDjtkbwGKOYvf?=
 =?us-ascii?Q?U7rtzi72myXkQfkj2VaWWwyr7mLzmzcd28Gbfd2XtV/Oy4//L3z/6x9myviv?=
 =?us-ascii?Q?wYbETF/94rNdKZ5DnEJ5+CQpnBsFQ2B7XNYTaj/mqiMTb4hx9UDIlW++KAaB?=
 =?us-ascii?Q?Z0NF4vt/GCBazprjtfRbEgAn+K8GBZM1ntB9h+Fiq6vACg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EGMvULY0IZdY7XFiddPtvvB0nX3R8YO1T5Xt1UwDw5a8ARATLEu6q621MAJJ?=
 =?us-ascii?Q?TEC2o/7GlRe3DlUWlWXiv8gdLFg+GJ2LQmK1sK0aYSOpTKViljcZDpK2qa1A?=
 =?us-ascii?Q?6V8dzHKncNOk6pnyTCRwvj+mRM7S5jQ8GZaWubDfpjDDSLQgksRv/weRBqWT?=
 =?us-ascii?Q?I8VRspGC2JietqWZjz8/sHVuUunOiHEJQNTE3d8EjiybsaJ0PWE3y8dL1Uqw?=
 =?us-ascii?Q?PqzAM2F1aH/zzCu3BfEVMEqiWtBSsz8JVMwe6iODTey+LiYmeYWCSEBZ7PCg?=
 =?us-ascii?Q?UczUUDXg7atO4owigIzAJ2xXVVEtvR3q2z7gutHbZgAtiZBvySuF8hzcQUa5?=
 =?us-ascii?Q?sHiDC4yZo1XV8OBYbyDZjJ34JYhpy1vZWEpg5Ihz36jejkXYhamLThriAgpW?=
 =?us-ascii?Q?/pJVQ4XngIIicRYVJydWV3l2fqKhLjWI5QqdRq5hfFkh0PGbvQEDA8l0IMXq?=
 =?us-ascii?Q?nmvYQccTMXBlIK1XzYLHW4h31KBHRGQ+0wvpEWGzwQujFLPbK+/YEdtP3ygr?=
 =?us-ascii?Q?5YuCqplJ45rBJz6GzLyIAXJGUjYdMsCVaWN+kc/kxog5s5tUS3T+b2jtd8Gj?=
 =?us-ascii?Q?CFTdttHEcDOADUey95JdF2814S/kt5oE5eT8fg6yzHc22Mr2J0BjPaIlTRpi?=
 =?us-ascii?Q?5ENOnj9bK7nJ3ficP9vV7qhVz4vjNt3nFz7Nf7/f24epuyZ4jes1HJ28aynd?=
 =?us-ascii?Q?uzjCbQCp9uxi5+A5Bqe7j5QaIkF2iUzc1RTGKDXBJSacPsMMTOBL40GYu8ge?=
 =?us-ascii?Q?hbqBSwJ9K/ymwvzLokkpiMwJmf4HiBg37JyA8snbtKPVNkJ2IOS/I0jHP12S?=
 =?us-ascii?Q?DzWQB/EEV6BdnL61+i+0AOfnUmv7syoDEQvc16LAa+15BuYzbqlRuV1FGibB?=
 =?us-ascii?Q?PM49A7Pmad46z0nv9Mj01xjWMbs0ZygTsBY82BWZxKiz7uhg53roNfwQT6Bx?=
 =?us-ascii?Q?+YjqXqS6OpU57fMkwbLGVyKV6h1qHKBIdGtN7nTrYI8cGhqm5RqPXUBNeqjt?=
 =?us-ascii?Q?T0JDowAMXgbbn4SIbuUnvAq8+FIGGpP39autHyyyYd57k+SGNODx7ZOkDOoJ?=
 =?us-ascii?Q?rB7C4OHVscAaD5SOljGaJe0Mk0MG20Aj3VRM0qUBZyb1SPyLI4lJc8YX2rWo?=
 =?us-ascii?Q?5riDxFc0OSQADLd7iI2orTZE9nMgvEMHwNPSt6zkbSnjRCT9e/54eFVYR5PA?=
 =?us-ascii?Q?93pvE3cy2HrdNXNnZFzypC+2CsnBQ99c/jmIQm0KI0Q41riPIcV5vlscWXhe?=
 =?us-ascii?Q?utvSZmjLTyfvVRYufsKdfGHvmbbGJGwV72ytcIINe2MtA4bb/dgFSewT3+lO?=
 =?us-ascii?Q?reoN1NNDNEAl1/w7mXJEYg7U4wFYC5NH+voItH+gPmLnLgnuH1JxX55OgCAR?=
 =?us-ascii?Q?zn0kdb5p8/Ahqdp4AOIr/422VA5jeVMnRBBYDkNLhq9WbZSa/STNarAlN+mv?=
 =?us-ascii?Q?SEgG22oQbBEdUQRr2Uot6OlNQQsIpsbkEZrQilBUxUbm2h0rir7bjFQx8WZy?=
 =?us-ascii?Q?zhLbKqP2lY5UMWkfSAm7Ug9gFK2JUoHfS6F2lv24gwB35zv7dNfk/r+bkPmQ?=
 =?us-ascii?Q?uQ/FFBYlf+W+J98qw1dlsPCGJ1ce6Z8rE2j8Li87RQE3+Zn9bgkzQJ5MJrEY?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4829bbad-b7cc-4ba4-e493-08dd3a720063
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 23:19:08.2108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXZiPYpwTGs+fCiQX2sT5iCPMRqjftifpLLbbRBeZz2uG9FsK6zcCIr9StalJ1Byhlj0y6CaCksJxeqDB+J0BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4923
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

On Tue, Jan 21, 2025 at 10:03:54AM -0800, Ashutosh Dixit wrote:
> Previously locking was not implemented for stream->pollin. Now
> stream->pollin should be accessed under stream->oa_buffer.ptr_lock.

This commit message fails to explain why. Why it was not needed
before and why it is needed now?

Also, please make sure that the lock really makes sense and
we are not just increasing the scope of a locking that was
designed for something else... and that the locking guidelines
are followed... [1]

[1] - https://blog.ffwll.ch/2022/07/locking-engineering.html



> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index fa873f3d0a9d1..9de62ce4b9e42 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -530,6 +530,7 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
>  			  size_t count, loff_t *ppos)
>  {
>  	struct xe_oa_stream *stream = file->private_data;
> +	unsigned long flags;
>  	size_t offset = 0;
>  	int ret;
>  
> @@ -562,8 +563,10 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
>  	 * Also in case of -EIO, we have already waited for data before returning
>  	 * -EIO, so need to wait again
>  	 */
> +	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
>  	if (ret != -ENOSPC && ret != -EIO)
>  		stream->pollin = false;
> +	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>  
>  	/* Possible values for ret are 0, -EFAULT, -ENOSPC, -EIO, -EINVAL, ... */
>  	return offset ?: (ret ?: -EAGAIN);
> @@ -573,6 +576,7 @@ static __poll_t xe_oa_poll_locked(struct xe_oa_stream *stream,
>  				  struct file *file, poll_table *wait)
>  {
>  	__poll_t events = 0;
> +	unsigned long flags;
>  
>  	poll_wait(file, &stream->poll_wq, wait);
>  
> @@ -582,8 +586,10 @@ static __poll_t xe_oa_poll_locked(struct xe_oa_stream *stream,
>  	 * in use. We rely on hrtimer xe_oa_poll_check_timer_cb to notify us when there
>  	 * are samples to read
>  	 */
> +	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
>  	if (stream->pollin)
>  		events |= EPOLLIN;
> +	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>  
>  	return events;
>  }
> -- 
> 2.47.1
> 
