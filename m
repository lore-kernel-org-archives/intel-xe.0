Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EDB606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 22:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Hnu3G2bh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D36B10E6F8;
	Fri, 23 Oct 2026 22:52:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA9810E6F8
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 22:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792795947; x=1824331947;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+S3BIL/7BmKrdPgRRN2IA5xnS2o2GAJpMBzyCO8r3J0=;
 b=Hnu3G2bhGUL8ilbK2IJYB9HcR7xzCgdK7DadUSu4vrmfVhE8sM9ox8e0
 6cWYd1Xvxdts8hE/d3QOvUmYj74ZpGWoH3/aQt6OzwrrQUxxQZCz2r+rc
 28lLPiHwEIdiVtSNZN4yuTjoUoPCxv5l+P1EqvXD0AbYxdvBn98rvE8l1
 c5Yoos17ntZFMOxJLXOqlC1/6ikC8jw3AAdxotbgJ179TnMIb0j+dHmCq
 B34GsC76POVCQymexihq/+JE8VTh5xE59aLNzVeXDY0Gq0VGHo3O5vPxE
 0bs2tBgk+h4y++xDkG9da3VcRfa4oD0AKoATLiWOSbwgXMmVyXEBj9YBU A==;
X-CSE-ConnectionGUID: xC7mfaeJTv6ufC2cuHZbpA==
X-CSE-MsgGUID: sVMgB2LwQ5quS3uyczrv5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1571237"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1571237"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 15:52:27 -0700
X-CSE-ConnectionGUID: xtwfJzx/SI2vo9aL4IHB6g==
X-CSE-MsgGUID: ERJEUvKIRKyEmE+UCm7MWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="5515722"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 15:52:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 15:52:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 15:52:25 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 15:52:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDlxI5e/SfcaqHe8ZCrjcUFK4qHXNHE28nOYt/virDYpPW73+1U37XUavA/NDnA7i2b0Y3EsfCOT7zbe/rL4qpBMD4LiooAydjbVww+iqBMnceZmyVdocC1HaPKTWKP2wXYklspdUcofYy4psJcVRXELYVbyUVopbr842bQmenZVifdkWycyTC7Z/N6VDyWdnXVej5yXzPKGg1wr/znH1fXDhV/gLsZhUrvrIrHlJ55VFz5Hm45imfmcJT+9q1uFcDwz9w4pmD1uhoIyGa/Jtjjr+7g/y7r4UdAEjPsPcL4TWzz3gDsCITLJuFKifzYJZCq6HMYRo5hvfbcTnAJxUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azy3jX8DzIHFVUZb+qJTh4H8ELggmwJ6eVRrJSHrxmM=;
 b=gPo+Ny/P/aqjgGSxzPHfpbupRrnnXxbGOjQeHCRrWRysx28+nBnT75oo6lCsU7947U44NjNq32d2mJkIpXGxXkyK3XfdoDSNbM4yr9HnDcUI2gSJD+rqkfV3k2jgXUevikPB1q7O6FwidiAj0wgRKBVgHeo9mZ7HGunbHmPa4Mw7yS4ow1YGr1NPdkdX3zF8J2Lw6zPD2qcdTYbvigDZ4Qjupgkwguy480IFY1UIzBpsMsm/tJUXzIaq5JcVuUyCdZU8oe2es2rb4b8vV3UcWojgx5ItzmGKdE1H4mQ/xUS9C6fFg1t+NmGyCWo6Si5ob1qWZbjPUt1FxDp1Ur3Smg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LVXPR11MB9779.namprd11.prod.outlook.com (2603:10b6:408:386::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 22:52:22 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 22:52:22 +0000
Date: Fri, 23 Oct 2026 15:52:00 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/tuning: Stop applying media CCCHKNREG1 tuning
 from Xe3p onward
Message-ID: <20261023225200.GA6078@mdroper-desk1>
References: <20261022065113.928244-2-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261022065113.928244-2-nitin.r.gote@intel.com>
X-ClientProxiedBy: SJ0PR03CA0381.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LVXPR11MB9779:EE_
X-MS-Office365-Filtering-Correlation-Id: 375d389b-c9b0-4513-82e0-08df315840b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|56012099006|22082099003|18002099003|10067099003|261022113327099003|261021123027099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: Qo2NIQjYFZ+52bJRJ2MbirFiBQDNCGSsL2sgAlPU2g1LBJbzMhoC3EwJkvaCJkpXf0UUigQ9ZkpU4ObjGtMsqtHQpyVfROKPXn+jgg66Zjl372r9ptKfgdaOUMzDCWBITvgbYUPQB0Q9J8x5tJsmRi23dbzk3Z7Ill5+M6+bpUo4wkYJ1ji/BExFXoiSXcNtRWe3Zs2fyyYl6yrjxVelmEKTwfegTU25lL9nUEApSr6VjQk5UAmwzhhtG2uQg3Z6f1xnbp3G+tXkTRFCnn9ED4Hnvye4nibMllJz0UMiI957ZF9vHZ/qz4u38a6ZaTDrTKW0IDHAm0/cSFTAJpsFWCWk8hsLvgADVgSWQMpNDzR3u4puikMdlaHN8tJRbpSap9t3eZgYaGITi7AxAuAIdEqqnTgH7UtG4YQBMokm7Y3NkOfGdXa31WIVsBLLIgyXRE5DfU/BkFxyh3+y7qIwHpOx+FL/S9Y51Fkm3mVbCW2++57HwIioi7FUgvvS008ZEz+rEUtQaMfMIDpjwlumCXvdyidu0a6zMCMjl73s9pjbOOs0xKKnZ1PBsLRFFQJ0lK1X2DqIu6V8YWZs/iBHR+6JCHQUQxwXs0bfJ9UbFKcOgwxutxOHOWcYXUDvhlmZgSdPf0Y2UhZW0QygEalMbftiQ6w11fSHn555JEycH7g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003)(261022113327099003)(261021123027099003)(261021121427099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rtFfo8YZxhySZyRF8eS7DTZ9os1i0nMv91ulqd1LQJ0zSs/9C+gPDv6jMCKh?=
 =?us-ascii?Q?yU20HT8I9q/CxIKiXmzyOJOwOIGLUTqxIAORZiPIiCNmhKLBYiX0SwrQF+dm?=
 =?us-ascii?Q?eB2c54nBY8AVq8zBcVOrzYc4WqYBuTOwIrv6fcLzGO1u9fZ9iz1m1YsTTYFi?=
 =?us-ascii?Q?F2LFFVgU5BSUeMSEpi53K4vGqW3ufLXcOVyjMDthHT/ElWCdNmaqsHFxtKn1?=
 =?us-ascii?Q?u/sPRUHsenjNpJv1E0uzlqT2iXvQf1wYRb4m59LNkwI0+RGwaC85nQhEtCNG?=
 =?us-ascii?Q?qeSPQ5cne+OdHnsC0gTezj2tZ5C/7pssIEQXV5eTdaCG/HT4ifDHhZUxl3Bg?=
 =?us-ascii?Q?zxbbLh9nKcAXSWaXgNtuGEZSb79u1REiA1tjTqrDxIK9s2Uvo7N550cwtJ9g?=
 =?us-ascii?Q?RwwMweE7XNDdu2P5x1t6Q3c0OI+tf0G4mSSZmm43vCLM2CBY7r8wZusbIk3A?=
 =?us-ascii?Q?5Zd1XauFkNjsg6ivdgMdFIpxA9WTvE7JEz6l9WLb2Yeip7kDS+boR9aKxpDb?=
 =?us-ascii?Q?XTut3jNtrr6XdIJkntPlPbO5g4QjWevMrRskGUz9PHFjocHAXYwLd63rq0yn?=
 =?us-ascii?Q?VRXChzFyNCwWaxjGdQRmBP9JddKYxoC1RbpbSY22dG+JLCjAbxttQ304vCVR?=
 =?us-ascii?Q?dpC12H5VxiLa/tKG7FwOayfJ+vDDOr0zZpmmOjI6a78+gWibJXWyEXiA2mQP?=
 =?us-ascii?Q?SolOnmbCvEeNamvj9x4Qep9klf1LUgsoEtHOq5E/wgD026zsJnLTZjBTXmTM?=
 =?us-ascii?Q?mqwG4ysdz1cdiXdDrMVFIPITE/DoT6WQJhIB/FiHA4DkVUIctckD4fitXbzU?=
 =?us-ascii?Q?1WbKXLTw61q628mMJopIdBOiNkPlQ25cf7LwZScZ0y39zaGvH2AuKMy50yc3?=
 =?us-ascii?Q?fopo/P04QzcM/hcHHIadLiUqOXCLzcK5nGsRYNWyjP03uNPmNLW+ZYy5Ag+f?=
 =?us-ascii?Q?ghpTGSmZLJ9qIx7GWMQo6ZU1IofXTMSqhx1/4gfnoadKXOVhSU/b43zsWGRs?=
 =?us-ascii?Q?Z6Cdhux6WIVs6EXRy4YgLCdJ+S7BA+M38gWMrpPdqbF6quwdg/IJP4KbA6x9?=
 =?us-ascii?Q?xFfbIm9wO1D21cStjMrV3ZZET1X567+kp/P0PAgoNdNOQ8cypobtr0EhtgPJ?=
 =?us-ascii?Q?C3qJ9IL7lub+ASI7z4Sr5u82dXfWQKccpZkCV6wDWLIAiTDG5E8O49AEKkJF?=
 =?us-ascii?Q?yk1whKEZM64m8xg4zVnXZgQ1fCFKCVtM4jUakYBtN7V1U4vl8mljiKh9Hjpx?=
 =?us-ascii?Q?sJJb8Qb0g/M5TGYt5dfLKPp7jwBiD4hHZmEsL2BXg4suXcd3Q/yO/NMjGd+x?=
 =?us-ascii?Q?DBNEvbKH8UdX5LghNGQQ47LRyUJ5GcGXMqTaWvZU63E0IZ0NAcf0D9klPvBP?=
 =?us-ascii?Q?2Us4pANwDtpzYMKbLuOdQFfj6iis2LrR/fFvwCjxRRRQvnOsJDEv1f8otaPu?=
 =?us-ascii?Q?a/Vofp4U4zAZSK+Zbx8ZFPqD4vxgGWT6/81pkhdT7JMNgoHlGc+MxfpHEwb4?=
 =?us-ascii?Q?X71By4LL6Uum3W0OEgY49OsCwZCcJeAPVyaCYj4kbh5ikkDRAnNu1nmeIbtp?=
 =?us-ascii?Q?WzuPFCH6rLhIuiHYSbGAE/QpcwLvYqptPG4QBXO0wF3Uaz0OP3Iv3nvcsolU?=
 =?us-ascii?Q?WBdd1M+KKTjEdPyX2lo0yqC0CQTzZavB//kcbHakLRY/gb1c6pzhKXgYQZK7?=
 =?us-ascii?Q?TH6ekjp7cpafaRfmDbhRs5psgPcVK8Po6/iQSQO5T/Npi8+duyEenGsOvU+H?=
 =?us-ascii?Q?tXL/jrGYLQBbBCzZluOMYtaeOhC0Occ=3D?=
X-Exchange-RoutingPolicyChecked: pRQv7toSO8bG7eSf4WHmmV7fBtKNzTilYx4rJSt5TYizYejkM7hnZs9e8X5hvcMi/M2lK82bxzKVlns7glWFR/9G3Q+Sf1PvqiaUpwPBMTI3rtgmwUauUdp82P7kSgj98Nif/6zJfFrOKPQoSPAUUii5Sqlat7BmiRFXIWnrpwHlxWqArwKwOaHeoy/5Kz7uNf8wvzZmuK90z6cITokFJGFDsf4prZyiW9jmwSiPA0/48olS8f4xHBjUDRX3I+c4DkzAkEOGnXVUzxtYjooeNqXuJjmgP3FL4VOjLkj5VVPfQIqxP4ksoJXkSQ7KR2eRcu3j2mcev1hpF6IjQq2/9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 375d389b-c9b0-4513-82e0-08df315840b5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 22:52:02.4268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDQaFeCPdP2wC682lzD6QpvWBcKmrS8Qk+NN2LIuFUeLypH7Rygc+nMM2NmtqNLKkktbT0WN352Bqe58/CaGL553GOIoCm+PcFxQ/TgqJ5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR11MB9779
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 12:21:14PM +0530, Nitin Gote wrote:
> Commit 288b775a1cd4 ("drm/xe/tuning: Stop applying CCCHKNREG1 tuning
> from Xe3p onward") bounded the graphics-side Compression Overfetch
> tuning to graphics version 34.99. The media counterpart
> (XE2LPM_CCCHKNREG1) was left unbounded and kept being applied on
> Xe3p-generation media blocks. This was caught by
> igt@xe_debugfs@check-gt-reg-sr on a CRI media GT:
> 
>   Mismatch on 0x82a8, expected 0x800000 got 0x0
> 
> The tuning guide (Bspec: 72161) still lists this programming for
> HUB_DIE (media) projects on this generation, but bit 23 (L3CMPCTRL)
> no longer exists on CCCHKNREG1 on Xe3p, and bit 25 (COMPOVFDIS) is
> also absent. Bit 18 (ENCOMPPERFFIX) already defaults to 0, so
> clearing it is a no-op. The tuning guide entry is stale for Xe3p.
> 
> Bound the media tuning the same way as its graphics counterpart so
> it stops being applied from Xe3p onward.
> 
> Bspec: 72161
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

and applied to drm-xe-next.  Thanks for the patch!


Matt

> ---
>  drivers/gpu/drm/xe/xe_tuning.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 457c6dd1e0da..bf8305840b63 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -49,7 +49,7 @@ VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_tunings = XE_RTP_TABLE_SR(
>  			 SET(CCCHKNREG1, L3CMPCTRL))
>  	},
>  	{ XE_RTP_NAME("Tuning: Compression Overfetch - media"),
> -	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, 3499)),
>  	  XE_RTP_ACTIONS(CLR(XE2LPM_CCCHKNREG1, ENCOMPPERFFIX),
>  			 SET(XE2LPM_CCCHKNREG1, L3CMPCTRL))
>  	},
> -- 
> 2.50.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
