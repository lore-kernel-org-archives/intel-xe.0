Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAE8C3DA41
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 16:36:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101E910E296;
	Wed, 10 Jul 2024 16:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NIidvRap";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA7310E296
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 16:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720629391; x=1752165391;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fVtBegOvh9K12jlL/aTZ//D+Jgxj7FmARBKPDjY9ZGY=;
 b=NIidvRapcCqWMi3oCfz4AtLqY5vC9chj+044L1ifwbUA4c6yg6yJLhEl
 m7KozqYysvl9h/BitEoEeVzlORiATyMcvOMxAEAoLuNf7XEjueYkyaYhp
 /VbTuBsgbOcqXk45pIcxysaNCaeb/P5orp0cK3yREvapeLh6VfQUpRMHQ
 5Og4qXfjl1NVSkkKjWnCcvvLfAp9m64O43ZADRTKV5GqWlLfhpfp4NEDv
 NqQp6CLo85kly0EzDZ4wTZZZ/7LrBgkoC6fTNffMUWOS1SL0yFd+Nsqc/
 blkQ4gOjKxEWL2zwPswHFoM/9J9ruV+nyw3VcrM9Tqm8WI9t8KZ19OKhs w==;
X-CSE-ConnectionGUID: dpQ152qJT1mMOJWKo+0NjQ==
X-CSE-MsgGUID: M7qm67H4RLCPHkS4XMnpXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18107612"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="18107612"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 09:36:31 -0700
X-CSE-ConnectionGUID: JZruZHy8TcOT/yW0sRepRg==
X-CSE-MsgGUID: /m9OCgXiS8i3uZ1EC/84Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="53094051"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 09:36:30 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 09:36:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 09:36:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 09:36:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+kePPuZTYtWIEQ/PjxpkK/F2L0BBJCHtDhxg36w4Q6rD6vK+vfCITCYt58OCMdywr/hkQWYeqpGhCS+MLja00Zj5vRIMDm+G7mxj01N5SUtFp/goUPZh9l6Yr4rAGkJj225UhIMyUMpddvP1OaXNHtswVvqudJH+VgXHvNHUIKb46ILHhOUUZwdGHx8u/0F6wYqMthzqlobf2/YvuzOPxdtJUX+xqdH5VjlbSsC2OTJsgpU4ceOK6Lctq7AuFKMRtREKne1YrOx82MzF8/Sae1D7hXxo3fdl7Svm85GBACdtzpM0nPYsDGEenifIom0n/Mo1C8TJwtrLYuJgJ79ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m18PN4P1lZffb6YOaFNEysTBh8/Q9xOFpclqlfRGWDg=;
 b=DXWIET0wHgxE3EfnFb8Qg4QcxZAiKT2ChbT+8j0IIIjU4SX9GUsTewF7GTXsohSjNKz1n2OoukUg61/jjapXC7yfzcjtS10YDNi+dqb7Cm7HLIt7lLv8lJK7nw5GmG5ipcvoOJHpjrqn8itQXa9HgFFlYbkOSfFOkAYZH528ui8JvkSMIBtUbtX4M6eoxSPf3ikAGn3S9LEhu1ZqAjCBMdf2KEJbQfuORrjrV0wzEkLVoCLp/M4I2CXzCFoC58vnQGIp1wITAaeOt33j5dqYceJRUjQZXOH2htbF5yorOttyjSdFFk1MHDjT+Ubvo8c2JBijfwmhhjC0kINBf5c/8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SA0PR11MB4688.namprd11.prod.outlook.com (2603:10b6:806:72::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Wed, 10 Jul
 2024 16:36:27 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0%4]) with mapi id 15.20.7741.017; Wed, 10 Jul 2024
 16:36:27 +0000
Date: Wed, 10 Jul 2024 09:36:25 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Dani Liberman <dliberman@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, <illevi@habana.ai>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 2/8] drm/xe/irq: add msix allocator
Message-ID: <Zo64iXWY/NoMukwA@nvishwa1-DESK>
References: <20240627124043.2923586-1-dliberman@habana.ai>
 <20240627124043.2923586-3-dliberman@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240627124043.2923586-3-dliberman@habana.ai>
X-ClientProxiedBy: BY5PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::13) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SA0PR11MB4688:EE_
X-MS-Office365-Filtering-Correlation-Id: 34af9dce-f685-4892-f4bd-08dca0fe7221
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?azBXpZVcazdTbNfpULMhOkl6giHUdoKr9HOeh/ID95PYMG6FoEzh6NSG5KHQ?=
 =?us-ascii?Q?wVAedNvxDd41ufza8ss3QvGXx26eUr/9Xm90WRtmq91MI5Ei546hCRWN2Ywj?=
 =?us-ascii?Q?+UcCYmUNDCb/KZKnlPaYnCY337uDnuiLYI7vugAu6WOikgvdIwq7QlpGQCLo?=
 =?us-ascii?Q?qf/vZEKcJltuIGLPcQGkXOoeDHoYVaLpyuNtS1LMifg+YXctSDaZcCcc78av?=
 =?us-ascii?Q?GkRvJv2BMrtN7nJ6FJJdNBtJ/UBkcgnzf/FalteERYbf1Agyb9M9pY8q1X0J?=
 =?us-ascii?Q?GiHH0RkfoHay6qGnhnoj2DipwJLBzXiEgxN4KfI/P8Dg7PskgmbBbEhXSmaI?=
 =?us-ascii?Q?25nWk5wep0tcMu65t68S2j0O4aBjSt9qPnLwqI6Jd63dPDRiz6wK6Ss+HVUr?=
 =?us-ascii?Q?mGvGEJPv64XVEx3qZQ6lt332U/diyo1/Q+6H+eOk1Pf6rk8qyg4ZcT+zi/n0?=
 =?us-ascii?Q?7iYXRCNdMroHQh2+yu79bZTVyN4N+gavB5vpYWrYRx6MF37+j+ZhoFWbC8cu?=
 =?us-ascii?Q?xuBKpuOJ55QzSTRS0xYBpJI2B231cjlve/6M0NV1kDTi1uyjrtFWSWeTGXLy?=
 =?us-ascii?Q?BADGv2Wa23z7fi1Q/RBgp7hxVe6JI3UNBBZ4pacWMo5CMaSizEO343G2wDOs?=
 =?us-ascii?Q?JE3RUL3XCc/7GLQxnsbiLYl+tMPKoxmEhC27sWEpnxGTjfZawRGcFdqLgCzH?=
 =?us-ascii?Q?tl5w3OowIfAdlW5m6xwXBkTamuUe4sJJ5I8Upx0qb8vkySA/dDOUmJfYWTvU?=
 =?us-ascii?Q?nTfV7H4y3jSZxqiRCJFZcHldhnWV2ZiGhY202k14D4ThAflGrukLPp3bk73W?=
 =?us-ascii?Q?RErbjPIPPMAqeycc6jjBPsvD/2917cWHu64zc3ZHJzAwEAhfl2HC3zGSnTaO?=
 =?us-ascii?Q?ZPT4ZH4xfftuPaMUI2Dr6DdUX8bbZq9kXI16CaSCXZLCe5eP74nt9aggtF9P?=
 =?us-ascii?Q?9HVziZ+40pSi0/rYpWV2Lq3yuxDnt8w33HRCDicsKeyDOxe7y4sMpydntYjn?=
 =?us-ascii?Q?mhpB6haVbQTxtG5yPaLnb+0PYfW04acCD/ZVVeMnvjek2bCoVbCEhXRXvazh?=
 =?us-ascii?Q?PoxUceUyj6Yt31Oat+E/GfTCFEKuSAo1jB1rT7b6JRcl+9nTcrjEQrf6dv+6?=
 =?us-ascii?Q?Z8eZEjOthdDaWf0hT15tLw+rqIEa3BVvSFc9gu4t+HFyIUdybZnDjDVOOxvw?=
 =?us-ascii?Q?h/5j45RxtiIQp1mhohq1u/TFylD07NCgP8ZXpgED4RYi3E51gTO4kB6x+8hl?=
 =?us-ascii?Q?uhhpm93zMTZQ4ijRaGa521rsXZr6jQs5+ZU3V1GzkCAY4rD0XxwKupAybcHz?=
 =?us-ascii?Q?Ba0TwJxcj+rDR8+RFSVeDBF3KhZiwwR4b8Qs0ijP1FwXRw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bOpTWujEKiH281ltBuoyKM1vRZGrfjAEeD5hDD2NngbmF/jkW7Z1CAgYDPu9?=
 =?us-ascii?Q?NxFaFZGGeIw+T8VH+wRSVB8pmfCGcZX7RfxzTKblK3V1Kvwas6Fixd8QVhbJ?=
 =?us-ascii?Q?HdNMm+FutsWWeH0pADX0KW9UqWZmNRMOa3hNUT2qtDlN5WOBGLe4s07grvjd?=
 =?us-ascii?Q?HPCaa1JtP8Vjv1GAG/phgsj+z0grYANW3oTy2NTJoc+XENFwBkTWLYtWRNg5?=
 =?us-ascii?Q?biqr1T6Sd8bvmwgDkyiSt/ymxRi0AHg0QLthPV+o5JdAa2veDL5B9pCglokY?=
 =?us-ascii?Q?W4/exQlj48jV1l1yPYVZ+MWx3eUdtWDtDELuXQZnaWQiUVt9F+QfuHLyU1tU?=
 =?us-ascii?Q?JBAe24NGl7PAVWxm88rs6Ra+LzT0zvzpTvOmjzk70yoti33cyil/xdUOeXbV?=
 =?us-ascii?Q?DXFD+kS/4bFkVcIP8Z5fWSJ1oYfNqWB+EhTRctKXzG1S9356bQWkvBOY19J+?=
 =?us-ascii?Q?Mvpt00RBoZP5dFnb95IV32UBR/iU+baSsK1674zt9PCmnRgeqkivX3fuKE0Y?=
 =?us-ascii?Q?iqtQttp9IXvy3ff3w8hFSYY8EkP97Fv680kwYC9L5kZfkWS1dhRQUMRVGShp?=
 =?us-ascii?Q?QwR9BfXREie2C9VJGaZc9XgnsbLP0sJu5fZh32RqX2pS6k8hTTlvivOMnbxs?=
 =?us-ascii?Q?nsz48lH1YQMfOk2jKUTfqom6UeJq27RSleriwqgdIt3AoWfblROxo6wRl+kG?=
 =?us-ascii?Q?UDhsTIdcsHE6MckPakfk+DavJwLiper9UrnnVG0fBiqDo+kPZl7fNHefyotm?=
 =?us-ascii?Q?kP/4gUfkKZepiG1Gt8JCDYMfPTqnRMJnFgYEVQXas/L5CiI5sxYeL2uwv1Ce?=
 =?us-ascii?Q?tG1ctY7efROSMqu7zcCV7XbOX7GGpU9i1Xq0COX0GUXlcX1Cau1DjNBUFTRq?=
 =?us-ascii?Q?iv4G85nM99NRezrmzFsrqq+C+uRmCo+in3CPZ0vcuyB6lk79p0V/NFNoCyTL?=
 =?us-ascii?Q?MowxoOTS8EKw8wGLHKlrGPKN/C7xOpPGTyFbTCxl5fcHOiwyF910w7eGEFpR?=
 =?us-ascii?Q?XjPR9fqqsFf88RueWIN9px0m1m75mgRPGZMMpjwpAkp4F3or2tAQuAsaR0D6?=
 =?us-ascii?Q?BCDVB3AJq1T0l2Mn1Lyz6Aq9xQm/dI+MBwJo2twSAGRAt7Wb883pLPTbfphL?=
 =?us-ascii?Q?NSM83Nne50wHVEfKqOg51rvqvnHctfWJV7gqBDV/3/yAsVd9SPyvLX9ZYK3l?=
 =?us-ascii?Q?TxcOyWcJ3MTvlnrpBQyBa8AqGwQaVviXSCrFnfM8jqgWpvT37u8rJrP1izkB?=
 =?us-ascii?Q?wv5Eq1vfIp1Z9IQw7YJRzOJG5boXP7fVD6O6ITjRaP2jSKZ5tisyWlxjAsWx?=
 =?us-ascii?Q?uw7aaVP4Grp/3yM8N6cy/FDafIX+WpuBq5Nf8jEaGRBxO+cz7esx1Xu4zo+x?=
 =?us-ascii?Q?7DMeWLXBoOnay7d2ut1BahDCio3LjLfsdrsJjyojoiCFww6DoSTOjtKoX3VA?=
 =?us-ascii?Q?qqPWK9VvNNGS3Z9JwuoJEoOEWgnMs8pe7Gb6cLNujlhyjzo/OdE9Lg7V/9na?=
 =?us-ascii?Q?0FvPk57JmHN44JyAJu3WmGVeBa/5i/IZ6iNBF6YM9Jf6EN41AwWJpsKG2cip?=
 =?us-ascii?Q?RXYxyJQvipmSHjVd6Oz4W0lleQFTtUa+DSETejvXvK4OwUBqO06z6MywNv1a?=
 =?us-ascii?Q?2JR88pJYnUli8Pao/S3jkyc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34af9dce-f685-4892-f4bd-08dca0fe7221
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 16:36:27.8690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xkx7MtgyTmB55/gaYqtY4gdqmj3BKTI6U1Epc35DgKgqcrIxv915TJ3WBltP8CCubpvmvdvOuRjX8KdLvsST9j5Hp0qHQAW5kmH1WQ3Z2yjsbq+jhzbWUba1Swi0Xa/O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4688
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

On Thu, Jun 27, 2024 at 03:40:37PM +0300, Dani Liberman wrote:
>MSIX interrupts are considered as a system resource. There are
>several interrupts that will be assigned statically, and the rest
>will be allocated and released dynamically.
>
>Add MSIX allocator to manage all interrupts allocations.
>
>Signed-off-by: Dani Liberman <dliberman@habana.ai>
>---
> drivers/gpu/drm/xe/xe_device_types.h |  4 ++
> drivers/gpu/drm/xe/xe_irq.c          | 78 ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_irq.h          |  5 ++
> 3 files changed, 87 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 09ce7ba1b4ed..0d772f8d4b40 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -308,6 +308,10 @@ struct xe_device {
> 		bool enabled;
> 		/** @irq.msix_enabled: msix interrupts enabled on this device */
> 		bool msix_enabled;
>+		/** @irq.num_of_interrupts: number of msix interrupts */
>+		u32 num_of_interrupts;
>+		/** @irq.msix_indexes: used to allocate msix indexes */
>+		struct xarray msix_indexes;
> 	} irq;
>
> 	/** @ttm: ttm device */
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index c0fc75592022..b552af53db2f 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -30,6 +30,10 @@
> #define IIR(offset)				XE_REG(offset + 0x8)
> #define IER(offset)				XE_REG(offset + 0xc)
>
>+enum static_msix_allocations {
>+	NUM_OF_STATIC_MSIX,
>+};
>+
> static void assert_iir_is_zero(struct xe_gt *mmio, struct xe_reg reg)
> {
> 	u32 val = xe_mmio_read32(mmio, reg);
>@@ -816,3 +820,77 @@ void xe_irq_resume(struct xe_device *xe)
> 	for_each_gt(gt, xe, id)
> 		xe_irq_enable_hwe(gt);
> }
>+
>+static int xe_irq_alloc_msix(struct xe_device *xe, void *irq_buf, bool dynamic_msix, u32 *msix)
>+{
>+	struct xa_limit limit;
>+	int ret = 0;
>+	u32 id;
>+
>+	limit = (dynamic_msix) ? XA_LIMIT(NUM_OF_STATIC_MSIX, xe->irq.num_of_interrupts) :
>+				 XA_LIMIT(*msix, *msix);
>+
>+	ret = xa_alloc(&xe->irq.msix_indexes, &id, irq_buf, limit, GFP_KERNEL);
>+	if (ret)
>+		return ret;
>+
>+	if (dynamic_msix)
>+		*msix = id;
>+
>+	return 0;
>+}
>+
>+static void xe_irq_release_msix(struct xe_device *xe, u32 msix)
>+{
>+	xa_erase(&xe->irq.msix_indexes, msix);
>+}
>+
>+int xe_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf, const char *name,
>+		   bool dynamic_msix, u32 *msix)
>+{
>+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>+	int ret, irq;
>+
>+	ret = xe_irq_alloc_msix(xe, irq_buf, dynamic_msix, msix);
>+	if (ret < 0)
>+		return ret;
>+
>+	irq = pci_irq_vector(pdev, *msix);
>+	if (irq < 0) {
>+		ret = irq;
>+		goto release_msix;
>+	}
>+
>+	ret = request_irq(irq, handler, IRQF_SHARED, name, irq_buf);
>+	if (ret < 0)
>+		goto release_msix;
>+
>+	return 0;
>+
>+release_msix:
>+	drm_err(&xe->drm, "Failed to request irq for MSIX %u\n", *msix);
>+	xe_irq_release_msix(xe, *msix);
>+	return ret;
>+}
>+
>+void xe_free_irq(struct xe_device *xe, u32 msix)
>+{
>+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>+	void *irq_buf;
>+	int irq;
>+
>+	irq_buf = xa_load(&xe->irq.msix_indexes, msix);
>+	if (!irq_buf) {
>+		drm_err(&xe->drm, "MSIX %u can't be released since it wasn't allocated\n", msix);
>+		return;
>+	}
>+
>+	irq = pci_irq_vector(pdev, msix);
>+	if (irq < 0) {
>+		drm_err(&xe->drm, "MSIX %u can't be released, there is no matching IRQ\n", msix);
>+		return;
>+	}
>+
>+	free_irq(irq, irq_buf);
>+	xe_irq_release_msix(xe, msix);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
>index 067514e13675..6529dff90f76 100644
>--- a/drivers/gpu/drm/xe/xe_irq.h
>+++ b/drivers/gpu/drm/xe/xe_irq.h
>@@ -6,6 +6,8 @@
> #ifndef _XE_IRQ_H_
> #define _XE_IRQ_H_
>
>+#include <linux/interrupt.h>
>+
> struct xe_device;
> struct xe_tile;
> struct xe_gt;
>@@ -14,5 +16,8 @@ int xe_irq_install(struct xe_device *xe);
> void xe_irq_suspend(struct xe_device *xe);
> void xe_irq_resume(struct xe_device *xe);
> void xe_irq_enable_hwe(struct xe_gt *gt);
>+int xe_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf, const char *name,
>+		   bool dynamic_msix, u32 *msix);
>+void xe_free_irq(struct xe_device *xe, u32 msix);

Hmm...probably rename to keep xe_irq prefix here (xe_irq_request/free())?

Niranjana

>
> #endif
>-- 
>2.34.1
>
