Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103CAC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 23:05:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A3210E827;
	Thu,  8 Aug 2024 23:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HhIIxUP5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECF110E827
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 23:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723158341; x=1754694341;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zID+OgkfzXv96gIjpn4IS3pysMe97lTD25NcXD7gjNo=;
 b=HhIIxUP5LTWWbUVogyWU+PI+oZGvOeFmo0tBzBI2iVUEygX30s49EL5X
 iYGP34JQFZvQAKv4SYLzKyMboSht5Pq3WPs0ZvKM7MDmnflxR2lldDTH+
 TD1LO0rsCtUNp2JfxqWzkiKwlz7u7L1Gi7xJkB74uYFTauPipFkJLrIVs
 W8lqwWYxaulSGPghLaaEbGUkvyGenqdksRl0qodfIR6/Q4hxLLgom/0sR
 0ZMj5YxhpOTEBsV/JvFTaI+zfXFOy7NgI09FCmfXt6EP6vzUR9jCT9NwW
 PXCTvW6n6zr9B0XhB4Rk2sa0tpcW+SCAOs7wgdeBcNFvQIxcd9r1MhBsL Q==;
X-CSE-ConnectionGUID: ATKv1KwcQPmO70RkVeSMMQ==
X-CSE-MsgGUID: PkDl0tuwQVyAW/ic9jgf3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21124576"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="21124576"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 16:05:36 -0700
X-CSE-ConnectionGUID: zVVbI45JTP+sDPA8vArc8Q==
X-CSE-MsgGUID: sVHsq5RXTUiNP0UZu1/Hxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="57036708"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 16:05:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 16:05:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 16:05:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 16:05:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 16:05:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7LjHJJenSJoQUP2TEYGbEFYsSeGm16bf43G7dYP/Td7LcnA1Ce7ZwBYOKHaLrWHa5EQPe47Tu+4CVZb82jBRg+RwlQMN+RSgeAWGCrZULuXVBTLNikZF65t4Vc/QDQrfHOTHo67f39MC+LsRKi/eC3Qi9BGpEMgXfhW47uxkrMA8UyTzDnxt5RoPYy59E3LeapcVkhABNaoBNAZGW3DcHPFwIFHrXUB4Gk5UaK6j8ZNte20BZjr5aOcZYImYNKBOfuidpN3ElwMUOIL3Gfa2/GtzHJjktTXv72tw2s8ymkRxZ6v9n6tTjA/8Exr5Uid2OwcH/fF4YM78QMAbqd2mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQq3KcNRq4Gj2WEoZMP3ePZU4P3FULY/c5oG3cGkeEk=;
 b=ShgZAjg7CApKTbQWZpf6uECf89c4uFWc2swkG6dy3maddk4EtRcLnqUlN558vSijFoG6TCnPM9+lr6I4OahhXLFe/2AJGB7eCXyWTNfn+LQuLbEJN6va04Q8S7j1ne+klu9tyogCOmku6BWq5xUTgwnkXgAdG0x8GgvdZDF7Ozjc40hOloLcViLlK9HOZJGsiTziigAfHS441msrYevo/PKfJIHhJm9o353RZxuDL1mJzDf9sunYB6muJD3zzGoqfJqjYq+bBVWSk3dTaop1sVzAIpOBgzRojnD6ub8DLCQwlv7DFCSGuHoIAZ9QZDAdKAQK27tA1tGxpXFOE7vy7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7825.namprd11.prod.outlook.com (2603:10b6:930:71::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.30; Thu, 8 Aug
 2024 23:05:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 23:05:32 +0000
Date: Thu, 8 Aug 2024 23:04:10 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Jose Souza <jose.souza@intel.com>, "Lionel
 Landwerlin" <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH 1/8] drm/xe/oa: Separate batch submission from waiting
 for completion
Message-ID: <ZrVO6lNyJpfhwHqq@DUT025-TGLU.fm.intel.com>
References: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
 <20240808174139.4027534-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240808174139.4027534-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY3PR10CA0006.namprd10.prod.outlook.com
 (2603:10b6:a03:255::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7825:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c53af05-eda5-4b09-0106-08dcb7fe9a8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TlJVEmYw2cr2ZnaNYZC6n+7SUrzCT00sPAJFfWsPMKATRuQkeU6LN2n/Pqvn?=
 =?us-ascii?Q?Y2IXqocT+PqgwRWRUbl6r28V8q+ciglaTXaHToyi0YWZvAFaUI4xJlSqi3iN?=
 =?us-ascii?Q?LHrAm5hZJzPR6wlL5dYdfxO2/yaYB2EEV+KSsroPvrDbu7seP6+yReuzMHp0?=
 =?us-ascii?Q?ZHLlA3hllTL9IKGbb1BifWUSCqvHhRj2EmyrhWS9WrYsOm5NaGYOEwSn9mcL?=
 =?us-ascii?Q?iOV+ZlgFahFkl+hFnPoBwEAl0EG7dI/ITG325oIof6bw7x3ZZOCZ5Q2yD37n?=
 =?us-ascii?Q?xCIO23Hf9bFa3VUpbXBx43DzFKR9ta0jo0WLOZu38Q8qy8yPCHkFBJAQkOlz?=
 =?us-ascii?Q?ll8+Mz9qpCR/2H5mdKeDFJI8zpohsD561QU37+g9D030UR5Hx8yf7woyAglb?=
 =?us-ascii?Q?lk9jDIX565ayzP4ulMScSvRX4ThA2gvdKq8zQKPYe52qKtO0s1WI3hTWvYKO?=
 =?us-ascii?Q?t+Kh298BRMVTsK9kJ4/NexGKQelQa7eRr6y3nVdGHR+k1sW003R7XSxHC30U?=
 =?us-ascii?Q?TA+4B42VTt3e4eKI2VwFnNanSZYTdlgbP7Vil6V4iRjzrIkSGX/78bwJTlM3?=
 =?us-ascii?Q?a22x9jBltg9HthVDExuej1q2XELl8SlXKnUAIpAUZiFydoJ24lik2AOVKao5?=
 =?us-ascii?Q?zVYeO/gAatwBEfPVRV1DU04MdMGbAutYjeIu3gasxV02Nbh7AAJ9LPvQpl0E?=
 =?us-ascii?Q?qg+fgMlNTwXDFVtjUOqGNOWxeWveyEhoG7Ie40+XPGCA2QE/1Ln51j9dtLcM?=
 =?us-ascii?Q?HoB/nZ52DD10Te7kAhRqYKhtiA/cwO4LHeoWHERmWumq+JgK9CbkKyOPLso4?=
 =?us-ascii?Q?eYrjVJGBBzaX4pxenceK60nC4wGq/0P6JdaJM+mafvnXenfrG/L6gSMIIgXA?=
 =?us-ascii?Q?qWWiL0sJ3QNWSnq4eIefFeEhng764spXm8/xmVUh2p1wZofAZ8N9tK0FQL5I?=
 =?us-ascii?Q?VhjWfMYjIoNdC8rS2LqWqrjY5G6+HVCcFClizB4yzqnQUx2ANmKPs1id6FSo?=
 =?us-ascii?Q?qubHP1YPfQqFOog6XbAy01PU4/EkYM1zwBmvETyGhTATkVOrZUMvPFTkfXwx?=
 =?us-ascii?Q?LiEjemp9vRGm/Mjd3sfhW9zra1rLOqVnxiNUr0Bu18gPZaDtoPwPVHPNwdd5?=
 =?us-ascii?Q?+DqpCGGgHa7UUuPjUVXniP9zz9cEEPhvW4rVHo34RhHMTg5+52rly/QRQVN1?=
 =?us-ascii?Q?UTBVKYknrIIVZYaAPOXyGnT/yzSMc3+jKBCCfXr2a6si/nQHu+Uft8jRkl6u?=
 =?us-ascii?Q?wJIHxOJ0iwBNGJQt/6mQb83Tmhd9jJrWjcQTrwz8Tp4+Oxb6e/O0kRe0XV3O?=
 =?us-ascii?Q?g/WjrbQ9/nvQwCzMEhj7OFkVe3L8DdPhF7fY9suza2IjTA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W5OYRW6OZejINrOLUdDeAj9Ez+hN8t/lBs9H3QsktwxAPVHvreSDlU771601?=
 =?us-ascii?Q?goqPNcyJFPeRi1Sufn7JjziEsf6MHhCmwFMw0qrKY8a2VpjJiMA21gVx1Ygm?=
 =?us-ascii?Q?OpeVwk7aVggIerm+ilqS6hjgnRIu25GIo39Q6XriqyDMjUKqsZUG7cXT9mYE?=
 =?us-ascii?Q?0iqKnFV1HC3koBskjfG9LZ8aN4rnVkw35V7kuCIzcND3c7l2fJs1X8lKHeFD?=
 =?us-ascii?Q?5ZTtz2pcGXbm7diXYzqYVBe68ukm66tveY0L+hImBy7UYMjWeqDpw/9zKOTp?=
 =?us-ascii?Q?ZQ+PD6VQI1gLK7JNlJ5o+enkwu+r9RFoIqG/4MQxpdFByNFI1FihBGK9M0PR?=
 =?us-ascii?Q?/ycUarLndh2yq7wlPk9o43bZE3aQyLf6NIQM6xZrSWsFhUNQRHZYTJ7q5O0J?=
 =?us-ascii?Q?XuKSOZk3tK7sNVu2QwP+mx+c3/pEPqwNm8MlowIdv9Zs77ZlWePP7J6o8vXe?=
 =?us-ascii?Q?c2vOTZVc1CTk+Fz5s54zfHsb9iUco0c2aiBxL0oulKy3Izsx39MtX9IQcMha?=
 =?us-ascii?Q?FiIg2s6hDc9VYPqcF2j7/ZLaMQgewvs8AV+r4erJOP/X4gIwzITML2gImGwE?=
 =?us-ascii?Q?IX2cPjKlNpn9G2tBxoURQnUUAwyu16jbsU2HjsSO9GaVDSC6VGJDHFuUDGbo?=
 =?us-ascii?Q?e0+1MSszfloN6uF4/4uVEauRl7OBjf3jz/EJ2hNdYbzDvG8mXVTVhAOuUfxX?=
 =?us-ascii?Q?tDnD8fxOaTKZQh1sVpZUAgHqaPEShrm/2pqrXztqHETbcj1TLNouQexU/Bmn?=
 =?us-ascii?Q?8OuJ7NSst75u6XQ+iDB4UsYe/g4RB+UKieA3yVWxWCJsDS/Kpui8sue6yRwh?=
 =?us-ascii?Q?efa8K+atJj8Ija8cBEs4pNAX6z5/HwEq4ddouVFHM+uN4D168icGHFDIO/gl?=
 =?us-ascii?Q?5ZKjJU351kUAiQYEmoND2f2haDeRo8OrySwaaWsN8On3KzLRj1XRFkdufMID?=
 =?us-ascii?Q?8gH/xWAtYVWD3yC5DW+h+L/m3UrEnKf7uId2278ahj+WeWFdcEkOLaPxp2kW?=
 =?us-ascii?Q?M3YQ/QLf4fPHKf/BczPAo7PFaSj0GArWWoIO9ehlIS2NaVuQ7jYJp9UwnKcD?=
 =?us-ascii?Q?RVdx6acF6ojnusR5D/YFl3Tm5rJ1Wi0DK8il0ARZUj7rv4VXZELICPwxpoLI?=
 =?us-ascii?Q?557yCdBQysmZOI/i73zrRiV4CkEnX4/Nmq9c/JVlMnjksotAm7fn3D/dbnpc?=
 =?us-ascii?Q?Ipc8QgfukcvYVNQUJmT5RrfWAbPjgP9hvbSq1o4nFctxbBEwi9VmQh1mlFXS?=
 =?us-ascii?Q?JLi62TU61R61+v1EMNyB3SoFcnHhGHt5O2lNe5PGvZ2/VtJ759sgCIlGf/1y?=
 =?us-ascii?Q?phXpsovT4L5+RXdJYZ56vpVn/p4d+cyvNZgxafSU9yp12uncspU1ATEQ0dl2?=
 =?us-ascii?Q?GVU/ZTAf6omBK9p57SJaXuGRiyLHCGkvnuA/U7/38OOp67hbU7cPAmKZMJq0?=
 =?us-ascii?Q?RQ3tTOqWkwcIMEybSbpWujDY52jPiP+MHhmfWEi/adqUmIIMYJcnS3Pbbosf?=
 =?us-ascii?Q?wgNSsIT/+pIPUrpxpCQnyr07a7gGDg4z73RI8xfF6As790PmcM93PjuluWAN?=
 =?us-ascii?Q?IquEJAhIFUnlh74X8Gzqf9IL7Y7yxHeNYkPQ/Fa/tUUbQuVJfu4X6U8VRNhg?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c53af05-eda5-4b09-0106-08dcb7fe9a8d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 23:05:32.3450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UbpPGIXQ7HmAAkh1c2k8m5ZfL3Bx946qgUwqqliaCL0voAObgusTIq9qrDlrKdWRHq5/S/D8clBnLku4nL0lfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7825
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

On Thu, Aug 08, 2024 at 10:41:32AM -0700, Ashutosh Dixit wrote:
> When we introduce xe_syncs, we don't wait for internal OA programming
> batches to complete. That is, xe_syncs are signaled asynchronously. In
> anticipation for this, separate out batch submission from waiting for
> completion of those batches.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c | 45 ++++++++++++++++++++++++--------------
>  1 file changed, 28 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 3ef92eb8fbb1e..d842c801fb9f1 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -563,11 +563,10 @@ static __poll_t xe_oa_poll(struct file *file, poll_table *wait)
>  	return ret;
>  }
>  
> -static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb)
> +static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb,
> +			   struct dma_fence **fence)

static struct dma_fence *xe_oa_submit_bb(...)

Then use ERR_PTR, PTR_ERR semantics.

Matt

>  {
>  	struct xe_sched_job *job;
> -	struct dma_fence *fence;
> -	long timeout;
>  	int err = 0;
>  
>  	/* Kernel configuration is issued on stream->k_exec_q, not stream->exec_q */
> @@ -578,15 +577,8 @@ static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb)
>  	}
>  
>  	xe_sched_job_arm(job);
> -	fence = dma_fence_get(&job->drm.s_fence->finished);
> +	*fence = dma_fence_get(&job->drm.s_fence->finished);
>  	xe_sched_job_push(job);
> -
> -	timeout = dma_fence_wait_timeout(fence, false, HZ);
> -	dma_fence_put(fence);
> -	if (timeout < 0)
> -		err = timeout;
> -	else if (!timeout)
> -		err = -ETIME;
>  exit:
>  	return err;
>  }
> @@ -652,6 +644,7 @@ static void xe_oa_store_flex(struct xe_oa_stream *stream, struct xe_lrc *lrc,
>  static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lrc,
>  				  const struct flex *flex, u32 count)
>  {
> +	struct dma_fence *fence;
>  	struct xe_bb *bb;
>  	int err;
>  
> @@ -663,14 +656,16 @@ static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lr
>  
>  	xe_oa_store_flex(stream, lrc, bb, flex, count);
>  
> -	err = xe_oa_submit_bb(stream, bb);
> -	xe_bb_free(bb, NULL);
> +	err = xe_oa_submit_bb(stream, bb, &fence);
> +	xe_bb_free(bb, fence);
> +	dma_fence_put(fence);
>  exit:
>  	return err;
>  }
>  
>  static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *reg_lri)
>  {
> +	struct dma_fence *fence;
>  	struct xe_bb *bb;
>  	int err;
>  
> @@ -682,8 +677,9 @@ static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *re
>  
>  	write_cs_mi_lri(bb, reg_lri, 1);
>  
> -	err = xe_oa_submit_bb(stream, bb);
> -	xe_bb_free(bb, NULL);
> +	err = xe_oa_submit_bb(stream, bb, &fence);
> +	xe_bb_free(bb, fence);
> +	dma_fence_put(fence);
>  exit:
>  	return err;
>  }
> @@ -913,15 +909,30 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
>  {
>  #define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
>  	struct xe_oa_config_bo *oa_bo;
> -	int err, us = NOA_PROGRAM_ADDITIONAL_DELAY_US;
> +	int err = 0, us = NOA_PROGRAM_ADDITIONAL_DELAY_US;
> +	struct dma_fence *fence;
> +	long timeout;
>  
> +	/* Emit OA configuration batch */
>  	oa_bo = xe_oa_alloc_config_buffer(stream, config);
>  	if (IS_ERR(oa_bo)) {
>  		err = PTR_ERR(oa_bo);
>  		goto exit;
>  	}
>  
> -	err = xe_oa_submit_bb(stream, oa_bo->bb);
> +	err = xe_oa_submit_bb(stream, oa_bo->bb, &fence);
> +	if (err)
> +		goto exit;
> +
> +	/* Wait till all previous batches have executed */
> +	timeout = dma_fence_wait_timeout(fence, false, 5 * HZ);
> +	dma_fence_put(fence);
> +	if (timeout < 0)
> +		err = timeout;
> +	else if (!timeout)
> +		err = -ETIME;
> +	if (err)
> +		drm_dbg(&stream->oa->xe->drm, "dma_fence_wait_timeout err %d\n", err);
>  
>  	/* Additional empirical delay needed for NOA programming after registers are written */
>  	usleep_range(us, 2 * us);
> -- 
> 2.41.0
> 
