Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A198CCD1BE
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 13:08:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F7110E0EA;
	Thu, 23 Oct 2025 13:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FF3npuLk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87ACC10E0EA
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 13:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761224897; x=1792760897;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=c/tI3r4wRyh90wE9L9GPP7ft4jDAz5lwawNzK9vvsj0=;
 b=FF3npuLk3QNAnpzYRxSDHZayNKwwaig0e7CQMQmPvZY1t9TK7at973V2
 N2CQAdBzubFO+FYbn4GwXBA2VZSZyNy6qBazdsI3eREyQqRZU/SERZfu8
 6b1Pwm5Hm03qhp3HztqaTgL0nfZf9ZRlRbPFAdrM2l7fuzKn6c7bsjg60
 25mv+45L85Fuoef4nfYl2JwkNLs41FD81VYWyd0rIrS1C6rDRCFKE+FiY
 8PJt5z4OeDVYym2ZdghUeJ4xN4lux8wXf2CLh6cFobkK8ukQX5x7nqpiV
 8FDAkh8IWxRcPo6N7OX2XBzoOV66l4QEdJL21JVSA8UcifPyt3nBvMkc1 w==;
X-CSE-ConnectionGUID: IKCqJcKfTrmqipdWbzyrKQ==
X-CSE-MsgGUID: fpis+K3fSve3vro30vwyoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88858692"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="88858692"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 06:08:16 -0700
X-CSE-ConnectionGUID: 8Qj44BF4TuOPWynNOLsI8A==
X-CSE-MsgGUID: hoBk9ngFQf6Opg73uDQc5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="183374844"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 06:08:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 06:08:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 06:08:15 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 06:08:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nK/OMTGRU+nzOuYCqPVpL3IykxGcDK5JkMAwtkqx1pKhLcuIuAN991wsdkWxWBjLANkc2KTXJ9c0XAG9ACTCZmp5dkXhL8+Mgh9u/2V3Jd9TuOGXhxYsdwq4iZxzc6vOkggapu1lZyLEiDNVRNXF56T/jpCRpDRN4pIS6+cMsXlE8QVhxmTD0TVj/bokq1bDywIXsU61vE9pfUfQw8/eTsHWJYmnp+9+Rhd7a91m0Bh2fz9PH2CNZtA2INdGqPg0oIl0oCA48ytOivmFGhf/5ZjTF07mEO28RW6xw3b+a3rqctPCoMWiUBavoP8Eil8ndJTphI6B5cC66PTGwDFWYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkTr4ltDuIW5DI/wvC8phoijprt/t+l5eNCSLowJdRM=;
 b=ebxJQ03Oq/R9IhDWY9TCL6tXBzluxqDiDGVStIdmC9KNv/q7cV4SGumAkC0hchW5T5QVewBh3XE7FSP1AcftOUWdlM3Bw1z46VNNZCTFKxJYJqbYEryGqAn84ec9aVnYXW/M2XToXlcL1UgfHAxown5UgjXVZVKaRLqPRjdcYahz3AhwV8sn1SQguAKphbpXOo85AlwG2bbhoxOraZIIvV8iSK5JcFef43Ekgegdetit9lChBTSEBu3bzXy1EN0Y/xE5NhNAqo8A6/SMXKsvoHavJAQWjCKpLl2Wmi93bcOgPhi9I9MTII2xvpSdguYNk/sVs+zqskh1GiOVHgN+7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB8545.namprd11.prod.outlook.com (2603:10b6:610:1bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 13:08:13 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 13:08:12 +0000
Date: Thu, 23 Oct 2025 09:08:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sk Anirban <sk.anirban@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v3] drm/xe/guc: Eliminate RPe caching for SLPC parameter
 handling
Message-ID: <aPootwV2Dugb70gq@intel.com>
References: <20251016092536.1918086-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251016092536.1918086-2-sk.anirban@intel.com>
X-ClientProxiedBy: SJ0PR13CA0152.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::7) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB8545:EE_
X-MS-Office365-Filtering-Correlation-Id: dc307f56-e864-4dce-ae70-08de123538a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2Jzmye7d7blt72JQKseS/D2UoCTQJukrMyx6vhikXrGtg6Njei9lpGZGi4QU?=
 =?us-ascii?Q?lcgcUNsjG6VgLPiSnhO5OcEC9i3ILBtIW5Hm85m+7F5tAAKEGyBo7M7RkInp?=
 =?us-ascii?Q?XnVrdDrtuvSugLXxDvLLajehaRCYYIAKFKecze4HzhwXtd/OHDH97dJ93TTj?=
 =?us-ascii?Q?2+StO0ZtjKpzVhW45/tn93o/IYl5kzY1VNFeGAQa16ChlZvuXX9ChH4wofAB?=
 =?us-ascii?Q?bAvI8FhRKRxQqLq0YXljGt0753FtBeIB/5KykGuZquToYoL5MVjHzR9O/ekJ?=
 =?us-ascii?Q?/Ab1QDsXInoPLYMmX7kbaE75CEaa6U+6s7RhK2WgtuyeO7KWgPlRx7gHH/Vi?=
 =?us-ascii?Q?Id4RL6Exav9y6bMUGrHlbVPBTpKrLzWpRjh+rCv6kQyKlmyKP4xqWPrmUmo9?=
 =?us-ascii?Q?JwXw+BEIaGEEAqohlaqFOBuxuHU95SKfZIga5VIiMhUErmeuqo4kGBBw11QU?=
 =?us-ascii?Q?9seskFJ7mXZ1JkcIMRnYlP73KCF0UERIzjCMAJlUVBDK6DljU+rxR0AwQ4Jl?=
 =?us-ascii?Q?caPSj6lhfLWDIm9cvWGzsMLjlhqdGGpLW+Jj2D2py+HtqzTrj+9muu5qHaDi?=
 =?us-ascii?Q?VJN/tqNGziSF7zTqdmbZTvutAGrrtMJlTBtSLNFy8V0wgKa8bwOw2ALIQy+p?=
 =?us-ascii?Q?ptHtZNdG/FsldBY3mCdNDmqLKF7HQFkA3WpuLGpln+s8+920xn3MWzuSJL16?=
 =?us-ascii?Q?BlEt9a8LHCz19MYuVeMc/kvrZJtAEub5kaMHxpuI3DWqWXXwHLXKh1E2UcDi?=
 =?us-ascii?Q?s6ptj10ZOzeZ+aYjC14fkc7Cax85nBHwsURcavINoaM/KiNPa61SyftY1RTm?=
 =?us-ascii?Q?JvzZBMMGAgs8IpldflVBVg8QLxzcES5ZmwAuCAuaXISbk5c+ybtGrZ7Ig6ou?=
 =?us-ascii?Q?pSDbdOmlRM8aFGqfqBl9H0bCZ+4owG6JcyXvBuLUWeML4u4H8EHIxTgBEed5?=
 =?us-ascii?Q?i58o3DDswUAC1Nf7IkpbzuZiiB02WLwGgS5qjf0PWphhN3Z2a7tag8apRs53?=
 =?us-ascii?Q?oKCdwqVQSSicFHpz38CpGcBJMlPw4/giRidfIQYbQrLxkykFnB7WejN1afg3?=
 =?us-ascii?Q?MgawNA8xc3M2rgyOyhEtT8Id4gVlc/HPQQtVRXNBSDjjYkjrN9265zkQit+5?=
 =?us-ascii?Q?2z71N6llpJjpDJMmEJxqwEkucNLHiU56kVL06HJDOkVz0LX8z17dCqu9hC5e?=
 =?us-ascii?Q?oi+LihnMoKb60ppkKr8I68I1BYyNanh71fc4qnHkxBfe24Cnap5re3nPyV+G?=
 =?us-ascii?Q?JvdWjckcSyTmhbpR2tF0rkQU/aB6+1grxbSJrLlS77m3rTXECM5J1F+6gdNG?=
 =?us-ascii?Q?hyr+3qRC4B6NRI8jYgO1tU8ia7Is2wmwu5MGc/Im2EOebQBPOXZa/g+9uL4E?=
 =?us-ascii?Q?Da4p6pR3BtoRgmGRZ6TsTlnwkWzMS6i3UZu87/0GTaAMsA3+7qG4vynZmqHj?=
 =?us-ascii?Q?VX4x0GeIWA0ExL9APcZwO87w7UzOwm43i/MUXzwfGykox4hiJqdIcQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jz9ozI3kEg+zqjggoFzS1VYWhFwV8t9JyKtZy8149Jwohc+RmAaEMgm0uQeV?=
 =?us-ascii?Q?61XtYcSinkN1Ydya7Q481/E5is3DxAqrH3radc5+Jx6ocnQKMDzXSn4/J0F/?=
 =?us-ascii?Q?76dHSNWeQRd+vUi1Icst2wN6FX419k7wzbQZYaiLGLK6icegcxdOCX5wU7S0?=
 =?us-ascii?Q?GUyoy0wbTJi9WhMqD95PAO4nRil09Nu3966ONqsbeOjBUie7Q55L8etwyfRS?=
 =?us-ascii?Q?rtRHLNxnCHcea/lbYki4fG99KSlhZxHSk3qEOdYWaTnfFpNLVeU71Z5hh2Wj?=
 =?us-ascii?Q?iYgjKGYC0hc9+VHl/44BwVaNIXJ0hdiY6u5v1vqJq5wUYnXYkWb/vj7YeuY9?=
 =?us-ascii?Q?7orb1Fjs2POU46g6Lih8duPmG+9gTj4/oQ1Pfvfclhi22K0RpbsnFjDynma/?=
 =?us-ascii?Q?FM4UN1Asuv7ofizWgh7D6EoAweqbg3sAYLK1bhBSYInHzIP2R9+Vb+VY8xKM?=
 =?us-ascii?Q?ixbmq4o0eDVepj6HTfvBykjFnyEsXefYrr2ES/Dx3EpYCibuWWg3+csuAtCV?=
 =?us-ascii?Q?CWNb2WC4+IRWnhWaOmq8GqqqvAhi2rw9HkFHINtdMlXbnhg0AnrbBmbnaZJR?=
 =?us-ascii?Q?Ww34mWCInyOeE5ngbnDdmwEYL+8F55oeozq0P9D2Sio4v6ENc3ylpy+GvABn?=
 =?us-ascii?Q?d/F9v3V10qnmARMCq2S7327084xuqQPGbIjLhx2rN5CSW/JQDII4IK6rAnVB?=
 =?us-ascii?Q?0Y7PXYUbFSdxQm03W6njJq1BtxcuAIvbak6UwP6HfZ9NN62sZQMSzb0B+8Xe?=
 =?us-ascii?Q?IuQkoPg+IemFa0w8y0eHNKGzd1KV5Ur1zkL3HB2PtQuRhxNNuyYBsBsQGcjj?=
 =?us-ascii?Q?yzBvCcnY3mVbzqKgPXO75BtzUO32JNmp2dWu1aPx7iKynO9MoXN1lmGmJbsh?=
 =?us-ascii?Q?TyL1cJBz6VyExpT77TPkwmJiwaQQPWfFfQHtqJx7C/kqipu9F/m8FnTrBvhb?=
 =?us-ascii?Q?L/wow7WihpC0NAsZYR46Ua6P5X9rgjdc3GrmvcKVsqLKX8knAF24Op+uQb6x?=
 =?us-ascii?Q?BDHaRHm+U4R1EtxEr6+YE97Qj2fZdPmMAW+7y8IzmWI41EafyxW3iAYpT8re?=
 =?us-ascii?Q?EOgQ9MgInI+CvY8OIQwQLI4yVuxYmv7rcEkGO+H7r4xZ+T/WbtAnzf4PDL6I?=
 =?us-ascii?Q?E0cae6gXmlgCLIGfSbuis33GuJxaR+W0SBD4kpZjeJX7c8Qd1okYc+lV8Qbx?=
 =?us-ascii?Q?NRBhzFNbybwcQpudd0b/lFmbjWhmdLfZykTXA8VJdTqZtukeiCTojL2LjDC7?=
 =?us-ascii?Q?0t73KLluqZ99oltmpPF5Ukn4UYpYMGXVe5DkOyU4m18/8FsiSRmE8ZkF80RO?=
 =?us-ascii?Q?d7/XcERYVlNVWYeqQF/zLw7oaorDYuTM9hJ3TyVQ4es+vTgvwzyHrzW2E1SH?=
 =?us-ascii?Q?WtyTrEFkz+keSOZosidBuYi/sgqHDJ+1OlOOCOCB0HH1O2wCxcnAxDueLr1u?=
 =?us-ascii?Q?OWppAsgqh3GRVgHh/DbyejubjHorvDYnEOT3skr/+q8I2CpX4UhUAYvmqdwt?=
 =?us-ascii?Q?x9O3iigaeKlle6kA4Z8F1Zo8zrICzqm4Ub+xYmKMHGCAFI29qOQ66xLnkMUE?=
 =?us-ascii?Q?oQ/JF/3CWSVjzbFn4CuGxpwft7RuFPptv7FFUvfY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc307f56-e864-4dce-ae70-08de123538a4
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 13:08:12.8900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3BW5/e6fmEUAGqwRcmKC0wFWHeDZV4JYB3jeomdUyLBS/IkKUMbkfxrqvziVWNmxO0uVpl8r9E2qcEQpx3wkkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8545
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

On Thu, Oct 16, 2025 at 02:55:37PM +0530, Sk Anirban wrote:
> RPe is runtime-determined by PCODE and caching it caused stale values,
> leading to incorrect GuC SLPC parameter settings.
> Drop the cached rpe_freq field and query fresh values from hardware
> on each use to ensure GuC SLPC parameters reflect current RPe.
> 
> v2: Remove cached RPe frequency field (Rodrigo)
> v3: Remove extra variable (Vinay)
>     Modify function name (Vinay)
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c       | 33 ++++++++++++++--------------
>  drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 --
>  2 files changed, 17 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 3c0feb50a1e2..20b2f36c94e0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -330,7 +330,7 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>  	 * Our goal is to have the admin choices respected.
>  	 */
>  	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
> -			    freq < pc->rpe_freq);
> +			    freq < xe_guc_pc_get_rpe_freq(pc));
>  
>  	return pc_action_set_param(pc,
>  				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
> @@ -375,7 +375,7 @@ static void mtl_update_rpa_value(struct xe_guc_pc *pc)
>  	pc->rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
>  }
>  
> -static void mtl_update_rpe_value(struct xe_guc_pc *pc)
> +static u32 mtl_get_rpe_freq(struct xe_guc_pc *pc)
>  {
>  	struct xe_gt *gt = pc_to_gt(pc);
>  	u32 reg;
> @@ -385,7 +385,7 @@ static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>  	else
>  		reg = xe_mmio_read32(&gt->mmio, MTL_GT_RPE_FREQUENCY);
>  
> -	pc->rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
> +	return decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>  }
>  
>  static void tgl_update_rpa_value(struct xe_guc_pc *pc)
> @@ -408,7 +408,7 @@ static void tgl_update_rpa_value(struct xe_guc_pc *pc)
>  	}
>  }
>  
> -static void tgl_update_rpe_value(struct xe_guc_pc *pc)
> +static u32 tgl_get_rpe_freq(struct xe_guc_pc *pc)
>  {
>  	struct xe_gt *gt = pc_to_gt(pc);
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -421,10 +421,10 @@ static void tgl_update_rpe_value(struct xe_guc_pc *pc)
>  	 */
>  	if (xe->info.platform == XE_PVC) {
>  		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
> -		pc->rpe_freq = REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> +		return REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;

please move the above block to a new function pvc_get_rpe_freq,
then use it's GRAPHICS_VER inside xe_guc_pc_get_rpe_freq

or perhaps, kill these 2 functions and place all the code inside
xe_guc_pc_get_rpe_freq()

>  	} else {
>  		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
> -		pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> +		return REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>  	}
>  }
>  
> @@ -433,20 +433,17 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
>  	struct xe_gt *gt = pc_to_gt(pc);
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> -	if (GRAPHICS_VERx100(xe) >= 1270) {
> +	if (GRAPHICS_VERx100(xe) >= 1270)
>  		mtl_update_rpa_value(pc);
> -		mtl_update_rpe_value(pc);
> -	} else {
> +	else
>  		tgl_update_rpa_value(pc);
> -		tgl_update_rpe_value(pc);
> -	}

please do the same for RPa in a separate patch and then
entirely kill this pc_update_rp_values values function.
The logic is the same.

>  
>  	/*
>  	 * RPe is decided at runtime by PCODE. In the rare case where that's
>  	 * smaller than the fused min, we will trust the PCODE and use that
>  	 * as our minimum one.
>  	 */
> -	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
> +	pc->rpn_freq = min(pc->rpn_freq, xe_guc_pc_get_rpe_freq(pc));
>  }
>  
>  /**
> @@ -560,9 +557,13 @@ u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
>   */
>  u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
>  {
> -	pc_update_rp_values(pc);
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	struct xe_device *xe = gt_to_xe(gt);
>  
> -	return pc->rpe_freq;
> +	if (GRAPHICS_VERx100(xe) >= 1270)
> +		return mtl_get_rpe_freq(pc);
> +	else
> +		return tgl_get_rpe_freq(pc);
>  }
>  
>  /**
> @@ -1021,7 +1022,7 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>  	/*
>  	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
>  	 */
> -	ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
> +	ret = pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc)));
>  	if (!ret)
>  		ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
>  
> @@ -1339,7 +1340,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
>  
>  	/* Bind requested freq to mert_freq_cap before unload */
> -	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
> +	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), xe_guc_pc_get_rpe_freq(pc)));
>  
>  	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> index 5e4ea53fbee6..f27c05d81706 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> @@ -21,8 +21,6 @@ struct xe_guc_pc {
>  	u32 rp0_freq;
>  	/** @rpa_freq: HW RPa frequency - The Achievable one */
>  	u32 rpa_freq;
> -	/** @rpe_freq: HW RPe frequency - The Efficient one */
> -	u32 rpe_freq;
>  	/** @rpn_freq: HW RPN frequency - The Minimum one */
>  	u32 rpn_freq;
>  	/** @user_requested_min: Stash the minimum requested freq by user */
> -- 
> 2.43.0
> 
