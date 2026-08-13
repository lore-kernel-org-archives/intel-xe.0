Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1CBC5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 18:40:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E06610E13A;
	Thu, 13 Aug 2026 18:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RuzM2f1A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A165E10E13A
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 18:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786646433; x=1818182433;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=g+dCkCLHUZE7SzPEYRmf7W3S1rAW9GXKko/BLwoRaQU=;
 b=RuzM2f1ASXu8deSySpJsceVI/CeljNNHOzj4KPMWqwCzudBW3LguRV2+
 vwBQUNGnTfiouiXve5nWaqB35SJ3HI7G9kmpbSkBlmkgtqVuJuGY97yps
 Oex0pu1Jxvd9Qqk0jfyDbsuy09jPCPlNJu31ZYNKZ87cklOvBAi1aC4iH
 SrpcHDiJ7sqmNe8xrTo8hSSVUHwwQRtK7HbX5QzhOkl0uMVp5Ohvn3WyT
 vpBQEYkMnq/1YS1FQd99t8ncWdNfo2IXNf9Zchjlrwwe9qv5ncWFMxsZC
 Upm05Efw3CigPucJqYAK8Z1Zp7xlJDZyAvpuUGaN7bDD7MEVcqc4G0OLJ g==;
X-CSE-ConnectionGUID: r71+cgNNRPiocZaLezsSwg==
X-CSE-MsgGUID: ZG97hNI1SxSlDVN0V8T+FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87356921"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="87356921"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 11:40:33 -0700
X-CSE-ConnectionGUID: kPLoHJMxTISR89FaRJiaVA==
X-CSE-MsgGUID: gxZmnOGwRp61Ex6yj5rKUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="288799314"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 11:40:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 11:40:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 11:40:32 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.28) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 11:40:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RI/GLyD3WCwrM/HRFZGuG8jFjeY0sZc7C7XKseM3DbjST4wgykH8lYKUAszQLiEOfN3KJkjinxPllsQCDEQqyTv5vDX381pPk6gQd82Jll9004L+yj1imh8fMekPH7PsM5DjCZ+DCAjgqA0uZXLldgf+So7W/H3Nm/mqZCfR5VLT29Mpeh3q9MS/86k6TWR00XMfx04DiFJFZhioQYDB5j8fygqoAP180EjNWTj94dkIF8b63n2audLlOlJ/7FPlZu3l6PTUTqzSqke1DmSYsNeAbhJndtonygqp3LEHA8uLkza6OFhvowRBDO47fQuZvS3V50DiC86D9hITu/jv7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6uu6PEai0S54pEfhDlqYtjHA//5LoLo1YmIhmEJRC4=;
 b=WqD9HtYI95FMMuF0+UbankUK/WWEoM/EAxeVtA5xLvIxyEa0mO8Ut3tENuGbtt0H2wMWV5fzoxq+waefJaodcQJ2oQtgkxmOYWdDKigXcJUP9icYrQAybxz9OCCa6rsSba2yvmUAwfvYjGY7y4UOJ4NnJD4uMtwo16GBXJiKfqw7PdozlRa4GmCqd0B3pjGS5BWtxibPqjgJQpQjFcKkHcp64VR7MQc5xjxkDR4i9vwCJOsuwgfUMcu+CfaW5wT/ZQc7SAPkmQb4bApFiVstWuEQHTT+QqtgfHOZJv2Vb6yjLi71f/4bUfoHfPr0M4bPh3fR28CYmtv4uAgtlAks+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by DM6PR11MB4641.namprd11.prod.outlook.com (2603:10b6:5:2a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 18:40:24 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 18:40:24 +0000
Date: Thu, 13 Aug 2026 14:40:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v4 27/32] drm/xe/pcode: Report 'initialization timedout'
 error using SIGID
Message-ID: <an4PlfnelDpkl1ig@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-28-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260812191450.11690-28-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ2P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::13) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|DM6PR11MB4641:EE_
X-MS-Office365-Filtering-Correlation-Id: ffdbd8ed-bf2d-4de7-b6e7-08def96a5668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|6133799003|22082099003|18002099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: STMZVoXon5aJvfgkSAKZJPmW9o9X3+8TEU8ZxroPfiwYEXTFDXGvVNW9DWsSnqOx3bT7YRAJ8AMZBtNucfstAGAtxde/V2NXuaEmwhIjD8mf7IthvDJuWJANUG0rDxgX3vuUxFalolN+igEm4vFkFBozrkstUj+MVqzVDboJb5SYJiUf5Jb0O5qB5KQ9WlgsV3Lls9wegBwWDm8VPMZEyViphCcPJJVJTLD6DIGHd+DlvtYUVK+O32qrl5q0v7ZM4lHssGWKOqRBT0x0BAiRkRyAy9N8zEyVYHqvlTdeM3ApvbXimmvYdtWM3jtC2zMVav5TfQe9Zrg0Wv9X+HgBdCDJ/BSgrQfB4zdnNuTJRRcfgyWKjgL2fpnHqYRjmWoozUDqTUBCnSBOjD951+VMWuQ+5wRJ5LlGxdeQ2OLGOSE1K8e57Nbwkn124k/ASoe1bxcl+r9l4sgxBwlYHLAA9pCI9fk6FKJTH3suSp8e53c7LFOnZSt62SEpKasTk/rhzDB/vdmrK1RJ1Si1uMsC+IsTgMft/6KcchwUC6aiCohl5Bzd/0msq4r8BIqIWrcbMBORUOL78qTJZ7U+cWzzpcajkE09OoT5p9uggPQ5hpFVjQJzkG2bX9MzRsbL/pdLn+zZI5Aabmir6s4VpvZ4O+xOg14RiDbbHN+KbzCXOh4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qAgd2PBCgt8Ayxom0M9CYRfHem+Tex3s2AwBLdCN6a3ez5Q0KKSXq+UOfh9C?=
 =?us-ascii?Q?6kXvO8wfEmU3nqJJEgPFyE5ejqxeiJ3+ccwbgs/sQtPnVSF+SJaYuls8IH30?=
 =?us-ascii?Q?VRrc0HUoz5z7NgJ8ZJxcjnk14O3yjuUk8IaJBHn5+HCx7bf5W4nzcsuDPsju?=
 =?us-ascii?Q?AvSk+4beA0NXZp7SB+qxECnxFFtgyFEq6MDipt5PqL2+szHiOAN8NIPz9Oth?=
 =?us-ascii?Q?5vQKwL8CbV/xk/tZ02nvPNVVmaBKT9zmp8hdtzZcijKGNK7noTptkcxXXEuM?=
 =?us-ascii?Q?CfWfJ5YLZ/FopzMKPWP0qgRbhiZXtULgIbpLmskbBeaVrXqrbEfqfOMs8pwx?=
 =?us-ascii?Q?MRd0VI3t3vxmisPN6hyv4+MvLCyU0pJrJRqsj9SkNxL6W3/xfruQIXY/xB6w?=
 =?us-ascii?Q?C90Vm61nfGlxPRI4VGerHzxG2Z+L5tzbsPJ9Aj6f1NaAWDQ+1yIHK3VQtqc7?=
 =?us-ascii?Q?8/fX83BmBOvrsLREfvpI3yE72UQAcKoW1rZmUC7Q0OwGGChwpyKCtm2NDy4v?=
 =?us-ascii?Q?MejjZ7FvIvURGTqRNPiNItMz22OXWuKkUJK0cynU/skr3gpbMdPpVFiRGoDN?=
 =?us-ascii?Q?l/l7OLQK7Nm2dZjzw0XhTrQubqcJH9QiBxOSEZFyj1twrymbe94A6sdzVE8m?=
 =?us-ascii?Q?LQUze7CgPZCfBAjpYLOJ8HNALcl/5MiNe4Xnmu1jh6+72l8eMb/zsP66qcKG?=
 =?us-ascii?Q?fHaahLlGuUHEnMOSNnkEIxyu7ckxvSNbH0FlgsrBu/sW2xgMuJo4DcsMT7N6?=
 =?us-ascii?Q?YoJz8oe3nEPDKXH6O0MHTxEO5llGJVRrW6zFWLXmasRqQsF+lW8P5hHg82O9?=
 =?us-ascii?Q?jvsqHawPQrZG3nZ0x2G6r4luZIfEJ9Bz8C2uCrnWLbpJ0SrgUFAKoLfNYi26?=
 =?us-ascii?Q?guYWF8yKgm7MZOI7Clid6axuhX3W5YWdt260BuaXmrreXsB/qGu8yXknuOHc?=
 =?us-ascii?Q?SQ7+L+TA/TwVvQFG/TKyKrlgQTu7qhlMwdZN8zSgUhCmOgdxdpqg1vmhu1nv?=
 =?us-ascii?Q?UMMrXl91tt785jxtGs/ImPBFgZbQr18iSiXOPXDVR25oNnIVbOgeHm8QX/vX?=
 =?us-ascii?Q?p+/DHcFtZ3cQAag1jHlLerHdK3/H6+3DN/bzOEN8qh3eemVVMHPnEjF3ORWM?=
 =?us-ascii?Q?uNVmqHeqqD8FOQVD7D4NNEfBZtjdpIAmIoY0kouKEQBWLiAnI6Vojcs4niNI?=
 =?us-ascii?Q?0an4aAkXvyZTEcPlIiSm8jjBa4NQAJUh4qLXS6VduWRHXz74lde3cwjgnsrj?=
 =?us-ascii?Q?ue4Vb0LFhfvLoW90vWqkk6XBeNQObVpD/sJiAN8hXSjNdAGbnHRYhHAGP3yV?=
 =?us-ascii?Q?6civXDNQP6A7AbrR4gyqahZ8ZlN+vh91wMBmipmSvmo4RU8Cqc/nm0uo21GT?=
 =?us-ascii?Q?9MqqrVtQPi59rnirnEwN0BxrJXJ1tnJZ9yn1O7GKqcGVEpHe5hLrHo7oXtlM?=
 =?us-ascii?Q?JBm4Avr4x+LlY2vIV/hfbQYtBR0nIElRtwrL+dulA+NQV9UH60QxMIWFCe+O?=
 =?us-ascii?Q?M+pWgZhNSG5+AzjBcAsbYyy+MIBJvL8VsorfK9vS+wFwkKjPlPCcCByI2tFh?=
 =?us-ascii?Q?tOvl7qpgq0VmEnZ27UwliOqCho0yhCoGXhD0GyuWlmpBR/nv2z67D/RiQkbx?=
 =?us-ascii?Q?uetU2G9/Imilx0BCKQyHP1PYVVNEzLT8oIQDw8wTPV2dNcqRVg7HSTRHNmGo?=
 =?us-ascii?Q?MnVUPbeVGO9Z1YN7pVbuFjV7xlTiOf3J+d1ECLoyajdwAM3vG1dFB42LvJ1a?=
 =?us-ascii?Q?nIi6KuGy2A=3D=3D?=
X-Exchange-RoutingPolicyChecked: UGrXPXgfdYlq6O7dXjN483LhkZVy+RNeH02PLKnUiv03migkgUY8vSHMF4hNzKFZMh0MOcTS8hK0Wo6oYJixbBSVAfGkSGdo5ogdNcHqZ22mdJeM42azfGaYGv20xSqEsXM64jMUTbrkC/XmcwWRTzrSJdAwmbhYiQVKbdAGqeooozFDxmm/VyjqYpTV7AIDt1AGiVetHylnLB77sOVdPNybLo27swu/v/gjiQwQhTaUvWzJNEeY5BqbZHXzYMNqubin4Nzsb0Az46zDwkm442GluZTZxS3B5l05VM0e0ymjnlIJ5EmaFJlj1htvNKvziH6UCqqPcqgZ9jaHMTBSTA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ffdbd8ed-bf2d-4de7-b6e7-08def96a5668
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 18:40:24.6756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/wTuFh/zhvt6lbh99D17CDs2IflYjkvdB2546oZ5GcgB60IRLAR3A3ybw7fTfAl3NuBmPkdJxf6LZRLSrz+4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4641
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

On Wed, Aug 12, 2026 at 09:14:43PM +0200, Michal Wajdeczko wrote:
> Report 'initialization timedout' error using xe_log_err() helper.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pcode.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 14b13a11d1d6..e1b8062541a9 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -297,7 +297,7 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
>  {
>  	u32 status, request = DGFX_GET_INIT_STATUS;
>  	struct xe_tile *tile = xe_device_get_root_tile(xe);
> -	int timeout_us = 180000000; /* 3 min */
> +	long timeout_us = 3 * 60 * USEC_PER_SEC; /* 3 min */
>  	int ret;
>  
>  	if (xe->info.skip_pcode)
> @@ -318,8 +318,8 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
>  		mutex_unlock(&tile->pcode.lock);
>  
>  	if (ret)
> -		drm_err(&xe->drm,
> -			"PCODE initialization timedout after: 3 min\n");
> +		xe_log_err(tile, PCODE, ret, "initialization timedout after %ld seconds\n",
> +			   timeout_us / USEC_PER_SEC);
>  
>  	return ret;
>  }
> -- 
> 2.47.1
> 
