Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F97BE7717D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 18:56:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21E310EBEB;
	Wed, 11 Dec 2024 18:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tsp3Tbvj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF36310EBEB
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 18:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733943391; x=1765479391;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8IhpbtIsWQwRoySaj7ihlp+XBllAb4COH9LQPfqvy1c=;
 b=Tsp3Tbvjh/GRfthOcpg29+a5KhP2CbTcV7PeFu5vuTi//uNP4aWLqrfp
 S9kjmfokDKkB3bdUjL1+WXWbDOr5ZkIKuNFnm82q9wCIwHIt9Ncnuy/Ye
 /uh5FUeg1TarLX3lJ0FcqrgUkEGUrY2pjW9jUhlmge7XSHrzcQFyNgh91
 dv2QhFrPsC6J+z29ZV8Y3UlanRDnZRy9+fLPTUvBBhddHLJu4ubTmB5Ee
 7PGfyZVCtnKtiaZkuP8iiW9yD5EEHnC6Xb49AZgl9Tm2Frj/pvLn0N8PN
 S043gn5l3LN1yGGZc0gocz0uF8KLkVcTrzxY/EEGprJbIJWroj+bF3v5H w==;
X-CSE-ConnectionGUID: gh1T+rNURGOzmtuedwhCcg==
X-CSE-MsgGUID: WrZh55cgSCiFq9Bzt/YGtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34476001"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="34476001"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 10:56:31 -0800
X-CSE-ConnectionGUID: 8e2icm10SS2cbzhrfTAI/Q==
X-CSE-MsgGUID: e/YBWjaMQvuGhf+1Sr8FLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="95776311"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 10:56:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 10:56:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 10:56:30 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 10:56:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6yytga9+ZrxaR4y5azyxGvhTvs9R8Q5YhAMoKkiOrOqah7alLBVu26pbSOEhVLeQ80uI0oLLeT2DlaJ6FFe+hqqpkQOwTWfaxEKy2QsIbctTpIdGrDFuP+cw8KY8RLu1zs5Xf7wSXR4+ZVTeHySTFB+QKgM3aU3pKMWrcdPcZfBUfSIwiiKTbII54aogmfYJOPhkF9mTehLOvaqKqCSpq4JKinaNq+NPXgXGbLlgQN85AdYDJ502pXWRdojlG8KBpei6UoyAfp/eezH2ztGbJ6yYmHjIPR0gs04djsyiWIlFsDvTD5YgvxadajVs8Qf6VEa9umI8olQE8cNJnd0WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LuUUlPHvc6Wb1XUDGY37hyGfygiLcPdxPrm2uUG81E=;
 b=KRdd9dA6dXwGY5zMIsdhIAQceGj40k3vYy+vpKk97+EqJF7/NUrd8450rfdR/RfVwAic5JpxNE/yO9gwBHVpnOefMjEFYkNS0NGAptw4g4jhF8csB0t8t84Scu7adTSx6eapaee6t9nk4XkXU1rKH3dWlLfMlzyLTRwOc3Y83QCsl83VPvpEnmEl5Wc4fRholm4EPI7EMbWJzj73850SylbuzvgusKhw/ok4MYsKLlcL4RdUIAMvsygcj17Trp3V2NFZXljycS9M5h+l6HkjA3Y5Y1Rz+oRkphpwgdELExpo3WZo2+E/euj5DuDl287rlK/PFNzMBeBqEGqx5A7G1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by PH8PR11MB6729.namprd11.prod.outlook.com (2603:10b6:510:1c5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 18:55:45 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 18:55:44 +0000
Date: Wed, 11 Dec 2024 13:55:40 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/ptl: Add missing device ID
Message-ID: <Z1ngLDwUKbl_6rwO@intel.com>
References: <20241211141306.2156467-1-tejas.upadhyay@intel.com>
 <Z1nXNwEpER3vwazN@intel.com>
 <SJ1PR11MB620402597212EED8751116A3813E2@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB620402597212EED8751116A3813E2@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4P222CA0029.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::34) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|PH8PR11MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: 549f7d20-9158-4429-0c2d-08dd1a156ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GFi9GWLXneiiRVkOzRjio2v+NSW0F2D2mlD16KH5piwFOns6zp0dwTU1q7lJ?=
 =?us-ascii?Q?9TX9lLdcAO3PmPUbOcDompu8lzm6cKEyMvJ/laV36EwfMh8s1KxPbf7yqrrf?=
 =?us-ascii?Q?WUUuNf8ZX3SXBHhelvy+yQBOlQkaRfGJnOWDosOHxXVtDvdYRJu1Ody6T1Nq?=
 =?us-ascii?Q?g7nRP3c2QVvJ4B2xT3M6kSwtgJVMH8OHuuC3qe3GFy4C3aY7lU6N5FEt+9O7?=
 =?us-ascii?Q?9VbStf1+jiqWLMMPTfXzPdV2TkXOODtSMtZO/qCXp/u2SP+RCccXULStKqWg?=
 =?us-ascii?Q?Ib49KzpqlG51pUFLRlv81G7PDvffdski0TJtr7BTiRWTW0/DzoBBRCVlq5IU?=
 =?us-ascii?Q?Yd8VbnqSI7bAkxnJ1C1TA7g3fUboDJrF5tzipfHFNmvFkGTFaCYNUpX3gwn9?=
 =?us-ascii?Q?PVkT2vzSoeYVW9BeegKkU354ELDR3JPaLbI2FqGDA1HgQnKMvadEVixns8Nc?=
 =?us-ascii?Q?k6WYwhDJmWp93EKUGRMKG3QRBPrMGNeAtuEHiGnfwaBUALBAL1OEZqlPkimy?=
 =?us-ascii?Q?O/GgzKZQQjFD7MUzlm+MP3EVGXXIvMB9ZckrEynPqM909VJYsqbhKbGytMcy?=
 =?us-ascii?Q?H8/52VkjrR4jQxWtewyTsALQydJVdIWQUHcO5iml9ccqu5+ZO4dEGH2hFLUd?=
 =?us-ascii?Q?SiTDJ5pu+R77YWlGrWNma6hmsQuO1ee4oXwDAoRg/7W7N/7gFF94WSjn+QNo?=
 =?us-ascii?Q?cxa9C1srcCcYnvR9/XDgjhXxq1utsp8vm4JVnjmkeRtbgKJGiXG5469ySQM5?=
 =?us-ascii?Q?znI85d/ypBnbNVGxlVAOshRDYYcCDMixWwmAcA0P5/37LZz4zLObozs1iuog?=
 =?us-ascii?Q?sM/TAoxD6lA8K1LIHNATrWh6q+OjDnYqYxqVLYjdWQuBw4ztzUsvesBzENeT?=
 =?us-ascii?Q?Nup/1nO8yE4fjQHsAmJcFEVSh81ncRW2kD6x4OUzOd3deCIRJi2R1FN8yvEh?=
 =?us-ascii?Q?rcNaEk4u4P8lxlFTukouXCjZVcTnEwudZI+zcq6MxMuHVY75zZnwmcqRMi7c?=
 =?us-ascii?Q?sZkwc+Am/vHMr/ykiVXdDzfJUEYbY67X9NPQyOci9CvhAwsfv6nEDMbHIgDH?=
 =?us-ascii?Q?qXhVeS/CUv8fd51dYwUfvIoFUDBwOsxDhGRyduoMIyAyc5AeqZTDSCLKWD+n?=
 =?us-ascii?Q?nvfssf3bFBZC3Qy1cPnmOJrpi9tAqa9iRQtlKajX7vknUNFjFYPk26woprqB?=
 =?us-ascii?Q?tg6DYlEJnytebCvqsEC/nxA/Nkm0qbwTDFXUVQ2M8oFoITzHvSqzOJMpPJJ5?=
 =?us-ascii?Q?y4kVVYULQ1BErgmY3sPFf5VAzE5qW5uyYnhhBgiIpvO5AFt8dQPSe6z1yj4e?=
 =?us-ascii?Q?oaIMCN+jzc4d0cloHQaHGUAeAEsXzwyO/3LI2mGm9UAtAQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YVP5dAQ7jtOsExpxxN7gBbEwg3hIA8R5RgGjPjKMye13nrouxX7dkDq9M+H8?=
 =?us-ascii?Q?5V8l7qRnrgbH8/A/YKazaZI2HrYBa4cLQWVMNRvX7jRTVkH3YnGSGI9OLdo3?=
 =?us-ascii?Q?HvQPn1+Y/evhZNG0H/f2Td7r7gW7WVIX0pzgcIuWbKmy/Xiy7DjNWYf4udQW?=
 =?us-ascii?Q?E3AZPNHnS+z2WuAalpSL3w8mz+jYlx7RciV4a5PkgLNsi5X3n893U2/a4vkY?=
 =?us-ascii?Q?HtLbUOZDeFH652VtoEZUr9GbO/iPxvhTx++YeYebn+ZjnyMt8y+R/QV9yAb2?=
 =?us-ascii?Q?R3m3P7RS8NUyVCHtFZKd4PdD0POQkdtTWIOtyeebxw0MHJ/HrWZsq1IK9FTw?=
 =?us-ascii?Q?kk09fVqQgoEapRZeEHeg0U+hMwR2YYUq4ZBeSkl8doxm4DmuR8Rlm3hTXso6?=
 =?us-ascii?Q?X/COHI94zM8NX5fswAgWdnDwg0djOXlUjALGQzDZvcMQmKMJnHFWk6paI1ux?=
 =?us-ascii?Q?V0pIkBR1t+c6nBERQuKlPr90n2OtJlTHgZ+7s1B5dIcvQxDuiSggEDSZDEaN?=
 =?us-ascii?Q?X6rlo6vo/6Y6pAE7LIgtLEcoxo1SfIJNqPTn2OtmMKvEE76fZjJOr7i1Xwur?=
 =?us-ascii?Q?Ru6SiPX+PyjNhIvZxpQgSSc+ZlGjSMwkirhtUfnZQRPTIj9RsOAbt9oyI6dK?=
 =?us-ascii?Q?rCGAKy4uLbv4O+yal+lrQsywSkX2tubkxm6OEmWm+Kml0166i366PiLKN4as?=
 =?us-ascii?Q?66nWUl7U7/Id1pCdIOr/U+Tewu+dfRRPxVVsD0nBeYI7cP20sTJQSK+sjMfA?=
 =?us-ascii?Q?DKf+MWAsJwEE3uFTJ4UajCtQk9ysMlsK8mSdKyOjY/EmbDV16prc1g1tErmT?=
 =?us-ascii?Q?ZGvggt1qChxkdFbOlSwtCh1zTseOclqlnzX/+tETXlAohYcuIlzM0MykUC5f?=
 =?us-ascii?Q?m+aV5oOFaZhaX+rtOM1Ntcguzk3sv5HMf2b8tgdoa3jo6cTnO1Dl0EyuJCjN?=
 =?us-ascii?Q?w4xTwd4x1DGPk2+T2/7jpnmQRYkZbmRrpAATxvEpHYEHHDKbTwA7OeCJxoel?=
 =?us-ascii?Q?tyDSomUz5KULaFj5oGSJrAo6+8X5gc2cjIm0URt9JP/mWRRNHn10DpQglsRS?=
 =?us-ascii?Q?QJKniR2a7kf/HVs+60cTkuYOFzbAXGNf0x0wHSS1clxj2+a112xwNE7OsdeL?=
 =?us-ascii?Q?n+Yp9k4nc9AHbNXwypWS2Kq0h2fi8fjBD1dSnrsS5sV5YErHI6kv/NdlKaHi?=
 =?us-ascii?Q?f503d25UJQJ+tHHgMWiEzgguNVQpyGC6ssNXzoBijyKGkwz8bS3CyAiImAd2?=
 =?us-ascii?Q?4kLEZItsF7ly341anaxh4nRieS1G/58qXAIvjKdta6dyd3tosXKqCRMs6G0W?=
 =?us-ascii?Q?I0NzhtWnmf2NLeMxxrFngv7ydPs8HNBbCfup3aJEbGwGN/D7TUhsJVQ0n6+B?=
 =?us-ascii?Q?L6xO0GoxYdttKppwhjvDiG13TQnWZhGs9ppTmXRwBrYVtLxuoMhwz6Lp/wNq?=
 =?us-ascii?Q?FwHulPehAnxAaxQIVkVoC7w37t14DpoPAI5L1R73IjE5LvQipnqIewttziaA?=
 =?us-ascii?Q?AY1Tj8ELeMwQIs89Et60LqFAj/dYndd6zU6wY4FaHH211lMpS/Mprcgbir6F?=
 =?us-ascii?Q?7Xv7QS7VcVnQPPuJH1fNzkh5Yv/I5AuJt7ihSpwtm3ML5KqczWN84E3xO4T2?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 549f7d20-9158-4429-0c2d-08dd1a156ac7
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 18:55:44.8307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRH88LKUMF2a3m1UyB2qVx9Vclf5DgvKjvMfMIlBsbI7GNlUw3cywaYN3dRtKLfxXHl9dQciQItPVRwL54GTfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6729
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

On Wed, Dec 11, 2024 at 01:52:37PM -0500, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Sent: Wednesday, December 11, 2024 11:47 PM
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Cc: intel-xe@lists.freedesktop.org
> > Subject: Re: [PATCH] drm/xe/ptl: Add missing device ID
> > 
> > On Wed, Dec 11, 2024 at 07:43:06PM +0530, Tejas Upadhyay wrote:
> > > Probably during movement from xe_pciids.h to pciids.h PTL device id is
> > missed.
> > 
> > Please check if this is indeed true and if true add this with certainty and with
> > a Fixes tag. Otherwise keep the message simply as 'Add a missing PCI ID' or
> > 'Add a new PTL PCI ID'. Always imperative mode.
> 
> Yes for sure its missed. We used to have this PCIID in xe_pciids.h.
>  
> However, I just found out, drm-tip has this PCIID so probably some next backmerges will take care of this. Please, lets drop this patch.

Indeed:

ae78ec0a52c4 ("drm/xe/ptl: Add another PTL PCI ID")
drm-xe-next
CommitDate: Fri Nov 22 13:58:13 2024 -0800


> 
> Tejas 
> 
> > 
> > >
> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > ---
> > >  include/drm/intel/pciids.h | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> > > index 32480b5563db..7883384acd5e 100644
> > > --- a/include/drm/intel/pciids.h
> > > +++ b/include/drm/intel/pciids.h
> > > @@ -829,6 +829,7 @@
> > >  	MACRO__(0xB092, ## __VA_ARGS__), \
> > >  	MACRO__(0xB0A0, ## __VA_ARGS__), \
> > >  	MACRO__(0xB0A1, ## __VA_ARGS__), \
> > > -	MACRO__(0xB0A2, ## __VA_ARGS__)
> > > +	MACRO__(0xB0A2, ## __VA_ARGS__), \
> > > +	MACRO__(0xB0B0, ## __VA_ARGS__)
> > >
> > >  #endif /* __PCIIDS_H__ */
> > > --
> > > 2.34.1
> > >
