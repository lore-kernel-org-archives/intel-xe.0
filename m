Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FD8C61DB9
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 18:08:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C5A10E0DB;
	Tue, 25 Aug 2026 18:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UqWZw4yR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635B810E0DB
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 18:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787681315; x=1819217315;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PxsOqDQZgjFScg83090mT4YdMZ2rUssliq7Ebot986A=;
 b=UqWZw4yR3ESj02PBodB8EHuuUIFZhWLrv5wZ03UQegJ4EjFuR+UMueAU
 U9aMBf0q5RTjzI9figpjAkwNwqu26IHcKt9yhT+k1rv4HAVtsVkZ3Rftg
 VA6+nEyEECXwKBXs935dOGjs8QwCaMRHndb2c6GJUui8Mr6YhDIx7sa97
 3+tWamJR40aNIPO7dRCtiBXinFBp6MbhuUaDXK6UlsdwO/uw0nmYd3lGS
 /lWYQoWHi7y8FtRuxnh8Reph8c93Ipa59DnXRr6rCNp2mShfuFThUYB+M
 0Pvj3EJNpXRCD9rblJiN/9KX0UDBlb/nV99gm+1l1JcdoSbpzkYxWhetV g==;
X-CSE-ConnectionGUID: 6ERuEIbQSXuYlcEOvJDpBg==
X-CSE-MsgGUID: SO/PZ8gGTxe11r1It6R4Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="98831399"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="98831399"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 11:08:34 -0700
X-CSE-ConnectionGUID: DaL9ckuaS8W8wUS4r3rhvA==
X-CSE-MsgGUID: lQ7o8WxHQ5i9vmSdPwASSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="267385358"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 11:08:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 11:08:33 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 11:08:33 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.8) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 11:08:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p765ziCjOHJ6J89v4rP1seN42DdIfPyE2wMz11lANX8Di0pgIGSRnHPyZnecrGk+fGlxUn8idjjMpfFWp82KDjVSGZtBcCQydsMFucRzd5T+gzpx7Zx1oeOtix+Tt0vnLMxJIwrFQmzQnQj58Gl4hncS6N/bLlqqNyIqyQdon8c6e1lzI32FYy3NzuM335tCSIciJK9tcVjA+yKZgzxUUY+pS6aTDZDwuLyS0OXttxNl7isbraF3pQn0wvhjqpKfqY6gic6G8P2gfq2iD3RcPzLdEiJdzKONj8PggMa/VVgkrhoyIRVPeolCSEtLraAEOF3dpslEpnPvxr53YOkRQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wj3Tfjx1N/hxI/IiN1uJ8sHxIS2CEYJjQHCotl3lox8=;
 b=GaM1WfIepCSKeJWLLdcyHVmlMMzv1jt9lPfAkQzPPPLvBY+2dXB3c279b9cr2eq7QHAJZ+Y5R+9W3xw0owgo/o4J55zTTn6iC02JZn35hEbUjmeCKJU/zJIjIFN/UZIbvjEGuOBUAERSTGG0hNV1BZYfL2a05XMOLLSoDVlwsoztdEQFvJ/i3hU32kYCxQHFehKT5CRmd5IkeSbGIkPEUgfeQdQGXl8dQVOqvCEIYSraBAmk15Uo1eUGk/hl28A5vj/JRjd0NoSb//biNUoGL5HeiixyH4EtjTmn87R83TpIaB7TzQ45BaatjKjeGlDnXKl2oyOLNoEzN1syWfMurw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7483.namprd11.prod.outlook.com (2603:10b6:8:147::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 18:08:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.006; Tue, 25 Aug 2026
 18:08:28 +0000
Date: Tue, 25 Aug 2026 11:08:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>
CC: <niranjana.vishwanathapura@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/tlb_inval: add xe_tlb_inval_ggtt_full() GGTT
 invalidation helper
Message-ID: <ao3aGjg5TYDHwSu/@gsse-cloud1.jf.intel.com>
References: <20260824163458.3129935-1-tilak.tirumalesh.tangudu@intel.com>
 <20260824163458.3129935-3-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260824163458.3129935-3-tilak.tirumalesh.tangudu@intel.com>
X-ClientProxiedBy: MW4PR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:303:8c::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: 09ed703e-77ca-4f83-ed0b-08df02d3dd63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|10067099003|56012099006|4143699003|11063799006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: qYrwIILQ60e1i7UbS+NoZ6P74X0ssgf4YtSPn3jLZo1iF8QKlh0dKnESPHpsM1RBXxLZO7rdC2kVXztk+y3NO9+F59cRfpToRoJJwoCf6Biye5pU8NVASQVUnl/fZbha+sQIH2x3z8JWcM1+/XsQhOVI3oxqEAPIamK8E7nwsx4968yRMcqHH3xrgHMraWkGiN+Jw1ACp3Q5lb5MlzkmmfM34kPS5p2A7HGtwXFL+Fc7Nvdy93rAbF5v45VPB7lqvs1cE43Vq24uO32GsGsVRW4HZg/+lXjWTcQRhanO84pYPvAar/rY2HnlJSQKf1PNWg2Pc5bQkR1wavg+bgL9v9XNA/EHy4Ck7+0sUG2LNdFJ2A8VceYwhssZc5Z0vWJWBGxmjQ7pJDIUot8NyF5WWbSGFkvq8WxXH5rTndMJnnjwKOA6gGakSXE7FtnsSq4qUOcGvpFwUlvYUiBqke0GhhO5/URTWC1t+0s6JlzZzQlPva0odegC7Adt2YyfWgDQ35mMiFdoeBatdaLDjknh5VxnFa/hlXyqfUeDNJexuvHF/jLthBhGRSCGpnGmW2kXU0EXxZ4pMapGDoJMmOtz03lKlaXz+qow6HzBz1IUr+wwxcCI/Dx/Rj1OeeW53vcp/prlQvk6mQKzLxFTbsgxOEp21L9o2wWUpV+NPsa9gmY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(5023799004)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jg2ILtHHmlDPjr5heChMuJlo3GNACE5JsuyacCQpBoBeELU2Ksbab1eV+vYx?=
 =?us-ascii?Q?YjiWw61Z7DbjjQoTYgazTHORNqXsn+zfdiABM4VKwLpSAagGZI9WdqCS6osm?=
 =?us-ascii?Q?ivc5Txj4lZh438nD6IXXzR+fxYDHMCnVwC4yeveYwUVGEBKi3djKGBP4uz38?=
 =?us-ascii?Q?N/vUMVJzUlPr9/PHZ7t9MwLFYk8njXfzZIxKpoZdH0DSMwyge+o4YLu/p+CU?=
 =?us-ascii?Q?MVec85jitC8WqIpleZdPc7+ZLIbTMGCeAnlsjxadPPNkvLbveZJwOUc6Xkyx?=
 =?us-ascii?Q?awdo7N1/8GxkdLLBlvX3IDYB6tvXzFXVOPVa9jglC1sDcKCKbZ04FiX+KlDc?=
 =?us-ascii?Q?kBEwccypVIl7/pWlSEQYoN/0++OQf/VBsn41eX5hGtBvhQZMqmJwSy7EbuCi?=
 =?us-ascii?Q?awN9Re4F3vKt1poisAz8t3r/RyjacDCa7xm5oTTJnQT3SV3qdZ4F31F76nnV?=
 =?us-ascii?Q?CaNBS7ZR2qFP/N24tuZATB5iCKJtKYsaF2W1l+UV6DQIaBcWvGB1FCmkq0YB?=
 =?us-ascii?Q?dRH8jUKVRSivN6IgdaW1DnxbWHIczNH9B7P5Tzosku7Pu/t3T/qMurd80cEn?=
 =?us-ascii?Q?YGDg4J2PgGh1CcgZ4iG/Eb3R4rW/RTb5IxmBeLALy4f4FZM/lKJqdPnKGRjA?=
 =?us-ascii?Q?9sbxqEFcyUxKR4fVuApPoIKAtr9jauvyIZDmhjWqpjqksZXeC+2d00u0yaYf?=
 =?us-ascii?Q?STyHdNBo1zhj3UqSGBDFtI1J7j361/EcJ12y9wpJrtGih2Vl08IEZZE26HDB?=
 =?us-ascii?Q?RDOhkY33p56IcWtPzHFmWbp0R3iePMse5ikH44ZRClVxXmVudIUdNg7zoqCc?=
 =?us-ascii?Q?ZxO4JE1+a5i0R+WRsmLyV/sl3zcdqqZfDT2LfEVS9E0YJkr1snfhF841kvcP?=
 =?us-ascii?Q?DQFE4VvRLpu1CPgt+HAaw477YnMZvktFjk3Z7U+2ZMFbXxJmhGW+h6cdc2Dv?=
 =?us-ascii?Q?cnrSkPQgMdSRqYnRek77Wuu2pxZhhSR4AJKB7vEqMiMDyMvPaWV9WOcq/Z/Q?=
 =?us-ascii?Q?6DAMoF9h/gWmw56Wt8tHTaoG1nPjXRikOl6btrvoaERCSSG6+/q8eOcY7EH3?=
 =?us-ascii?Q?204KFAqbYVHNW9ZB2Fi6pcGJ3DOYobdJOlnKrrnx3TSWi7Xi2aDQ/H00kNm3?=
 =?us-ascii?Q?/El2gUtDqsWB7fEtgXmzJMiQTSr4GXZ559V9oiBTTwnJ6JoZmk8DG6G9G9ur?=
 =?us-ascii?Q?Q9nWMsFj/jQg/ZsPzidus5sBq+XW4RKz9tieCJqfUB/aonveJY+Y5TfF1BKN?=
 =?us-ascii?Q?Xew/6ceJO1D7nwSTnytedzj3irugOujWk7BqO8KVT9g4isJ7WdB10cVjI2kw?=
 =?us-ascii?Q?MR3CsxZbYKeTGC6Z7KeQdSMLxmECLJL2qkvVz+ml6dzVR1Wp+sjzS4oouXem?=
 =?us-ascii?Q?Ltx3UoUB6Xb26yy5ShBzqsmkFWeYH2gyaDEckKrKI+XyJ0cgEzzTziVcILfd?=
 =?us-ascii?Q?PVCI2ye0A+H9rWvzbpdeu/Iz307n77RPTa6R3L8nWKSibHdxUma+DVCxAdr0?=
 =?us-ascii?Q?CGVVcGrBrBqWVrYr4n/JqLAktwYk6EC//E/TpoHQsMPl008epMgrmdnIrdRi?=
 =?us-ascii?Q?QmvKLZLJUrJmdu6r3MHm4j5H4/8lYRAEi5WFfPD7EDDGY6VcgEMrwUErUcui?=
 =?us-ascii?Q?UADgWWKTpEpw9ovra2J6m9/h/K9qj5OfwQBR4Kyv0Ff/ODALgXCYz/5k0Ofm?=
 =?us-ascii?Q?qv/P4375Mzoy9O/BP8IkDUPyMcpg6XcKoHJ4wX1K+KvijtHRopeoa0ZEjZmJ?=
 =?us-ascii?Q?duUulVCT5yvXcacmuJ0iogqZ8py+mCM=3D?=
X-Exchange-RoutingPolicyChecked: vkkdyReoX0SdnU/xpEhZKKZLZJxtGD0mYglcGAWGnZZCvFpM9XQDKgaQctrDBQJXuGW4jVS8pPnUs10c/MdRY/np37sa62MYC6XHrP2BCd6wPNXwVGFWt7WzIVp2mIncA1DUjf2DC8ckJsVj201DHvQh3D9483gMmey4CCgo5SxFtgwTyQywfOhkjO8Gt/xbvEXgpfF2ZrDysjQBp+gzVSKTYlOW1zEgDNu9rh53l5LfSIaRHwiHuy5N/AJW7AR2ivBhT8qdMm0UoNgV9FM5RLAsEqhzJTuK0vA2T5vOBYyQKzOGDoclRrPhzn7LW2M2b/8jN4G9/nHQ7nCwmgrVGQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ed703e-77ca-4f83-ed0b-08df02d3dd63
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 18:08:28.7163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xav2Uz30uBQIiCZz8UEof+iIsaZzGEneLmBvDMzXh83tpZvZo+RSqI9qWZ3UdvLu1ncACj+ghtTCnQ3RyWTF1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7483
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

On Mon, Aug 24, 2026 at 10:04:57PM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> 
> Add xe_tlb_inval_ggtt_full() and its GuC backend
> send_tlb_inval_ggtt_full() for full engine TLB invalidation
> within the requesting VF across all engines.
> 
> v2: Refactor with new helper xe_tlb_inval_issue_op_wait()
>     and other knits. -Niranjana
> 
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 21 +++++++++++++
>  drivers/gpu/drm/xe/xe_tlb_inval.c       | 42 +++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_tlb_inval.h       |  1 +
>  drivers/gpu/drm/xe/xe_tlb_inval_types.h | 10 ++++++
>  4 files changed, 68 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> index 046d0655122f..08dc2ee4cbff 100644
> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> @@ -98,6 +98,25 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
>  	return -ECANCELED;
>  }
>  
> +/*
> + * Emit INVAL_FULL (intra vf) to invalidate engine TLBs across all engines
> + * within the VF.
> + */
> +static int send_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval, u32 seqno)
> +{
> +	struct xe_guc *guc = tlb_inval->private;
> +	u32 action[] = {
> +		XE_GUC_ACTION_TLB_INVALIDATION,
> +		seqno,
> +		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
> +	};
> +
> +	if (!xe_guc_ct_enabled(&guc->ct) || !guc->submission_state.enabled)

This is a TOCTOU issue. For example, the CT state can change immediately
after the check,

send_tlb_inval_ggtt() has the same problem and likely isn't 100% correct
either.

I'd prefer that we don't make this situation any worse.

Would something like this work?

ret = send_tlb_inval(guc, action, ARRAY_SIZE(action));
if (ret)
	return -ECANCELED;

This would allow the CT layer, under the appropriate lock, to determine
whether it is still alive. If the GuC CT is no longer live, we know that
nothing can be running on the engines, so returning -ECANCELED would
signal the fence appropriately.

Everything else LGTM.

Matt

> +		return -ECANCELED;
> +
> +	return send_tlb_inval(guc, action, ARRAY_SIZE(action));
> +}
> +
>  static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
>  			     u64 gpu_addr)
>  {
> @@ -346,6 +365,7 @@ static long tlb_inval_timeout_delay(struct xe_tlb_inval *tlb_inval)
>  static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
>  	.all = send_tlb_inval_all,
>  	.ggtt = send_tlb_inval_ggtt,
> +	.ggtt_full = send_tlb_inval_ggtt_full,
>  	.ppgtt = send_tlb_inval_asid_ppgtt,
>  	.initialized = tlb_inval_initialized,
>  	.flush = tlb_inval_flush,
> @@ -354,6 +374,7 @@ static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
>  
>  static const struct xe_tlb_inval_ops guc_tlb_inval_ctx_ops = {
>  	.ggtt = send_tlb_inval_ggtt,
> +	.ggtt_full = send_tlb_inval_ggtt_full,
>  	.all = send_tlb_inval_all,
>  	.ppgtt = send_tlb_inval_ctx_ppgtt,
>  	.initialized = tlb_inval_initialized,
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
> index bbd21d393062..7c3bf32d9258 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> @@ -301,26 +301,56 @@ int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
>  }
>  
>  /**
> - * xe_tlb_inval_ggtt() - Issue a TLB invalidation for the GGTT
> + * xe_tlb_inval_issue_op_wait() - Issue a TLB invalidation and wait
>   * @tlb_inval: TLB invalidation client
> - *
> - * Issue a TLB invalidation for the GGTT. Completion of TLB is asynchronous and
> - * caller can use the invalidation fence to wait for completion.
> + * @op: backend invalidation hook to issue
>   *
>   * Return: 0 on success, negative error code on error
>   */
> -int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
> +static int xe_tlb_inval_issue_op_wait(struct xe_tlb_inval *tlb_inval,
> +				      int (*op)(struct xe_tlb_inval *tlb_inval, u32 seqno))
>  {
>  	struct xe_tlb_inval_fence fence, *fence_ptr = &fence;
>  	int ret;
>  
>  	xe_tlb_inval_fence_init(tlb_inval, fence_ptr, true);
> -	ret = xe_tlb_inval_issue(tlb_inval, fence_ptr, tlb_inval->ops->ggtt);
> +	ret = xe_tlb_inval_issue(tlb_inval, fence_ptr, op);
>  	xe_tlb_inval_fence_wait(fence_ptr);
>  
>  	return ret;
>  }
>  
> +/**
> + * xe_tlb_inval_ggtt() - Issue a TLB invalidation for the GGTT
> + * @tlb_inval: TLB invalidation client
> + *
> + * Issue a TLB invalidation for the GGTT. Completion of TLB is asynchronous and
> + * caller can use the invalidation fence to wait for completion.
> + *
> + * Return: 0 on success, negative error code on error
> + */
> +int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
> +{
> +	return xe_tlb_inval_issue_op_wait(tlb_inval, tlb_inval->ops->ggtt);
> +}
> +
> +/**
> + * xe_tlb_inval_ggtt_full() - Full engine TLB invalidation within a VF
> + * @tlb_inval: TLB invalidation client
> + *
> + * Issue INVAL_FULL (intra vf) to flush engine TLBs across all engines
> + * within the requesting VF.
> + *
> + * Return: 0 on success, negative error code on error
> + */
> +int xe_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval)
> +{
> +	if (!tlb_inval->ops->ggtt_full)
> +		return -EOPNOTSUPP;
> +
> +	return xe_tlb_inval_issue_op_wait(tlb_inval, tlb_inval->ops->ggtt_full);
> +}
> +
>  /**
>   * xe_tlb_inval_range() - Issue a TLB invalidation for an address range
>   * @tlb_inval: TLB invalidation client
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
> index a76b7823a5f2..665072b4b81d 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
> @@ -20,6 +20,7 @@ void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval);
>  int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
>  		     struct xe_tlb_inval_fence *fence);
>  int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
> +int xe_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval);
>  void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval, struct xe_vm *vm);
>  int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
>  		       struct xe_tlb_inval_fence *fence,
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> index 3d1797d186fd..d77be1aedc91 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> @@ -36,6 +36,16 @@ struct xe_tlb_inval_ops {
>  	 */
>  	int (*ggtt)(struct xe_tlb_inval *tlb_inval, u32 seqno);
>  
> +	/**
> +	 * @ggtt_full: Full engine TLB invalidation within a VF
> +	 * @tlb_inval: TLB invalidation client
> +	 * @seqno: Seqno of TLB invalidation
> +	 *
> +	 * Return 0 on success, -ECANCELED if backend is mid-reset, error on
> +	 * failure
> +	 */
> +	int (*ggtt_full)(struct xe_tlb_inval *tlb_inval, u32 seqno);
> +
>  	/**
>  	 * @ppgtt: Invalidate per-process translation TLBs
>  	 * @tlb_inval: TLB invalidation client
> -- 
> 2.46.0
> 
