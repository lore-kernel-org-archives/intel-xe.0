Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF721C61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 17:12:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54DD210E41E;
	Thu, 27 Aug 2026 17:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LCAsDvPM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7ED910E41E
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 17:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787850732; x=1819386732;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=in3nHoqBz3P/G20SWYcX8sFNxcxuSkVt4GLvCCYwFQc=;
 b=LCAsDvPMz1f4pxqnP0UFCxOTComnMQjLJuZ/oboAbRyRoaxhckYUkRuE
 YvfOPF32dMn98zrUnUjpxeJVtPNgtgW40b6WnUnApGX40WtCWs/cl2nMB
 l9tt7PKuiDAmIZj34J5ssJdQ7SYAJ3fduv8FMjp7/BNQmK3VvQ1Ys7N/G
 Kh+252pmF0dwgakwRwtuGy1883434FlJ6Bw0buujJlbSbMMdAQzM1WJ7/
 gje+QcwsGrDBcDb5sk4LDHydyrtfieQ18EGat4qtQaPlPjdC2rdZbJcnK
 p6eJCXYviamlXidHDP7P01vkG0J7lpk3tke9DHBSjzIHwDT6ZXkIkTSJc Q==;
X-CSE-ConnectionGUID: Ya85S89ERHaHVfHGePE+bA==
X-CSE-MsgGUID: +mG3y++iT5uPaorj9FCp+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="99024291"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="99024291"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 10:12:12 -0700
X-CSE-ConnectionGUID: TC9//c/WSKKvgCYv6swYPg==
X-CSE-MsgGUID: d/W04VgURqS36Q+AlvOGgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="267326363"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 10:12:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 10:12:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 10:12:10 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 10:12:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BH4WkCNGNQyjGcPs1/aJ6+X+Ec1SPDd+xUq6DYjr7jT2IT8GkTFsacaqzgx9EywJsxaVKB/KxuY7o+QW5yFihTWTGQPWx/n2ZtpBHuw7vbKykJYSpjMcyvgp6VYJ12GL8KcJxdCD3mnoIWPbPOGKlNWzUbN3Y43taGqhhCEpyC7kjOVkrs/wmf6skptwbNUdRy9vnFUy7ua2ZRwUugkiZwlOcVfh0PWVjbBNv+0UzvnV37PrDzGXMcTyevqDtXKJK55We0PABXLTsLiUb89GD4PzWxSxh8HqqCeoj82LMHQHBlzeryEf3OzNL+a4MGcHg3iIn9ywk+LRbHC249/WDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkoXrCRgt1OqIXVv318/+b989ohuBqCKM4KUpXTqx5c=;
 b=sCNriOpXh1gxZgCY2F1dk4jDvK6k0UgWZ+UBAWgyJaJ9CAxE/jMRNTpI+54djhF1TEMKBEkJ05kBX4jnYaErNJN+TXcwERUKo1bMv42febNHEjxDV/m3kKvRTjF4ZT7kx/uiNaZ6ilIqQ9Bm/5lanZN0D2krSivrOuX+EORAAzi8/xbygDJJ17eLsi/QTfdyqt64Bf/fszNoRtFpHm/zYpLa7s1eYRAQ0fOIni/JbF9gpukd8EwTS3x51YY22/rKy3DRVBWYPAgvw1QHMVSe4Ttb/bBxXESYPJDILRdDGo7FlAKpb7oeeFs99FpRQgYi4cahFPky0DAkkz5kgOTNHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Thu, 27 Aug
 2026 17:12:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 17:12:07 +0000
Date: Thu, 27 Aug 2026 10:12:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <tilak.tirumalesh.tangudu@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/tlb_inval: add xe_tlb_inval_ggtt_full() GGTT
 invalidation helper
Message-ID: <apBv5Vt5hLemE01L@gsse-cloud1.jf.intel.com>
References: <20260827082011.3370672-1-tilak.tirumalesh.tangudu@intel.com>
 <20260827082011.3370672-3-tilak.tirumalesh.tangudu@intel.com>
 <apBs0FYndOJF1wVt@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <apBs0FYndOJF1wVt@nvishwa1-desk>
X-ClientProxiedBy: BY1P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5995:EE_
X-MS-Office365-Filtering-Correlation-Id: a57c0855-f749-41b2-9885-08df045e52e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|56012099006|10067099003|6133799003|18002099003|11063799006|5023799004|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info: QvYY+B8uI8TA/UfarnfTRLhVcHXNIz+r7k81cS7D20Zd91AixKRvl3pseKHq1kFOhG5aHZsUGbPjH+0RD8KiFq8ZYnSloJNv/UbZfGaIBbD66QSjMpSFRpApaJn9Xq7vf2HJ6ZJlqQbHedYo0H7h6iY5/+vESCPXklVmuLbjKitfd10QjouC1BsuiSQDIWJuRWN9oJ38So5T4DOM05oHLt0sSnhIocSEXhMh/attp1v4mwAXQ2M9OWLclLyjHd6TScAEZRPHYxuv/wCcmdBk6XJj0WXb7bDXiOcOwaR9iEc9yI/WFt8wyP+yH7nTMmD9N+CAzZrO8NUhz5lRISdBtItOVfvOKtYU7xY1pfBEKolRdkElKykkyLseV/mwA71uvDuMXK7+RQ1CvcEJ/4tKwM/GFLkwnugG3NpY3ns9V/f8HnirejEWO9Vya/SX9OdxWz6eOGjQnqunDp2XWgs7gaI9K5nhwGi+PtY+HuHfbVw1XvQSdOWKgkdw2qbMFrCBzTL9Q+oEOhk5S2vsYGQlokE/pDxhRQgVEYl2tM6z6GToRC8EDwG6VyFqijIb64nmLLJjDToEsDh0n2KE+CI5Rw354I07Lt6FKk6OsqroSACRzZJw0fIOUxwiFDCVI7Eao9urOmmjUf9fKkRhSVAzF6C7ckMuNtoIyrVqO/ffuBI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(10067099003)(6133799003)(18002099003)(11063799006)(5023799004)(4143699003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qqMtk/iT/hFdMAWGJNTAKDxVl06kpA5I8dFUSgCFVb2Q8evhZIYArNk71/wQ?=
 =?us-ascii?Q?Ir7NgYJSv6UUvgoF+WKCtUzkORXz2iRg1/YprSNTqAD5wpbR7N60HqYfuq60?=
 =?us-ascii?Q?6fG2boy6nkpijeKeIaPEhMxx8O3I0cR/FLhb/+aN5kySr7Nh0DcY+SfAaiXU?=
 =?us-ascii?Q?8NlvnSpRaBvMr/zfmcpSghzkI6M52gfZf9ZVvbn+Z6cV9zKCAW4tMhSH72OS?=
 =?us-ascii?Q?dajCx+Xqbo9Zsk0nM5qo6txrLDZVz1fL/lu1uDpJw0IESaAmp3jg31R1tl7E?=
 =?us-ascii?Q?P7bLGKv9lixWfl2pafXpFuTCvc5cx84b9zVVglHdYPsnXx0IVngfL/C2aOSq?=
 =?us-ascii?Q?OoQ/vf/thz4k9IGiHH3SxY5utRxXKUybSZaVlDIlz6CrK9VzD+u7sjhNUgfi?=
 =?us-ascii?Q?iyDVfB8OJ9e3wnu8wI8uAXzW0EdDfzKK/60N2RWB2expx43htj645MvpjUD2?=
 =?us-ascii?Q?GOpXJNGnwTvQ+5OSWC6vJ4yCDV5WyiTcflT05NWoGXDk9JeTEMn2v1jQvxDH?=
 =?us-ascii?Q?qet2AJ0n3HOtf2EavPerIRxDHEpSKs5eCB0EHa+5bQ++8YFHqVftij8oKgVR?=
 =?us-ascii?Q?Yc2X/jEFxNSKTzwuuhDb2JNxTmGSf6OU6TlejhjvgIiEygEhbDdSVPrlBKMc?=
 =?us-ascii?Q?gnQEi4P3sXco1wstnJ8Gu4cr2QOqvpQz0LlatbunxuL3MLZz0Y81ZH64+sV9?=
 =?us-ascii?Q?T2UA+vAZtxlSQPWRBo7yjhEScVV9UwUpF4qccf1u0woOVVh42yWTCgt6BQ8O?=
 =?us-ascii?Q?uzSMrO/IuPtVmxnovmWnp2v6oKa6qShAkwT3DLt5DL/DWM+T1suBitnuYMD4?=
 =?us-ascii?Q?YlvbGBZBXtmni50jL8bIFS7tx1PbMn4QjO6D5M99jwtPeaBapObFULxlTbn1?=
 =?us-ascii?Q?l7GFfkq7EfBu0XfFSPH5TdHGqPTQyDmmoDq72Y4VyYgl4phb7Y8Zkj8Jrkoa?=
 =?us-ascii?Q?gBWHbZflXS5x7rjgA5R82jVZhJ1Nf0Ek6oJeKgX5phnE8Oe1ojsBYI67AaW4?=
 =?us-ascii?Q?eKX9yoQHnuJsUf6plpj3E5lfrp2lo/sIsli3qzvYBot6cMefhM4wa4kXGTOT?=
 =?us-ascii?Q?mNbzy8YCJ7Y3zAihnXqhW226C6urRPdPI3jIMI83gtbEMdBF4edaMDhW8A9m?=
 =?us-ascii?Q?z9e2o6vpbsrBH1NTEypJSDrANImGl0ki/j7jrIbhSt1UJJkEiMajoL5V0+wD?=
 =?us-ascii?Q?L+Mhsmomc1mnoJGqk6Y+eKysd/GlxIRP7Ik8ducLgbnt5ZpkmeJ1xy1WTmMg?=
 =?us-ascii?Q?k4We3TFUKpvxl4Q3DguNjgAC3+rOqlZ/2/ra0kraToVFOMhTIzteTMxBXjmB?=
 =?us-ascii?Q?FlTfJOLFK3a6cQkZJmyMgbeMm4zeUbC7V2VtLq7zPiKuBJ5aJmYZXCntrxiS?=
 =?us-ascii?Q?C5Fm4kdDAW+je0B4lQPi385KpfXRZLoR+tvpPsWekSOzcMRt2LowGjI0Vfyo?=
 =?us-ascii?Q?SGJhA2RAXbDofTCspI9Veo2Qcve6Tu3P0kEM5q0AK3vnc2DhwtRaaaJByVC/?=
 =?us-ascii?Q?q/1To27PaR1jqWeYYBKbkd0MYqoQ6HY5MSUOpKafnACyE+acHVClithd3iiY?=
 =?us-ascii?Q?Flx9IVxdcPuJjacHFneqpQshPtzf1BCkhXKhxBsfdAEATVv2EmRvPU+5Y3uK?=
 =?us-ascii?Q?7aAK0Mf7E3YxLzsu9OKFJUPNyjqM83hQ7fBXdv2MwkQOLWNsyxOGfFqaqrkE?=
 =?us-ascii?Q?1ter9BzqZd4O/3+br9n36PcDpRV9UnMPH5i4xjlCFAHC9e1zHUCaIIshMsQd?=
 =?us-ascii?Q?I/I8MBzMUvvsiws+6dV9cIHTqL4eH6g=3D?=
X-Exchange-RoutingPolicyChecked: M5AAzUQ1Egq+2g2hgTz68xsgAbgeDL8/JwdWjfT7zm64LU9GnVdTz8pBua1T9GYmcUtNW9kBSCbNDeXhwvNog/10lIyf2hbobau01Hlm+4ufCFAmuC/xEWkvCA8d3RycqZWjc0i6Q6LXYOU/I1ao5pJNJkTTJX/XMdXXFdfCRXL/1q+B//uhZA5G7Pb5qBOhORV9LKyBYNM0KnZro0sc4cyvcQGREmLJ2CxO/u/RwxTn1LVoJfn8TEV3gzwlnsd4wFBF9O0rn9/N1dZE8l0/J3hvbTqhDO+oPKK9Vl47TlXyFymwp6GjK593dSaOQ2CptEUg6mGPj26NJnfUeN9JKA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a57c0855-f749-41b2-9885-08df045e52e8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 17:12:07.5806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ue3nIBLxgKPaRYkGTMFl2ymlQSIYy1N/RAaxwvDIaQfRdaTW291I3wq3bBlP2qnlKYtqBcq/+RZqf8PKiYxBlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5995
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

On Thu, Aug 27, 2026 at 09:58:56AM -0700, Niranjana Vishwanathapura wrote:
> On Thu, Aug 27, 2026 at 01:50:10PM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
> > From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> > 
> > Add xe_tlb_inval_ggtt_full() and its GuC backend
> > send_tlb_inval_ggtt_full() for full engine TLB invalidation
> > within the requesting VF across all engines.
> > 
> > v2:
> > - Refactor with new helper xe_tlb_inval_issue_op_wait() and address
> >  nits (Niranjana)
> > v3:
> > - Avoid TOCTOU issue around CT state (Matt Brost)
> > v4:
> > - Propagate real send errors instead of masking as -ECANCELED (Sashiko)
> > v5:
> > - Handle -ENOTRECOVERABLE (wedged), drop redundant -ECANCELED
> >  (Matt Brost, Niranjana)
> > 
> > Assisted-by: Claude:claude-opus-4-8
> > Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 29 +++++++++++++++++
> > drivers/gpu/drm/xe/xe_tlb_inval.c       | 42 +++++++++++++++++++++----
> > drivers/gpu/drm/xe/xe_tlb_inval.h       |  1 +
> > drivers/gpu/drm/xe/xe_tlb_inval_types.h | 10 ++++++
> > 4 files changed, 76 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > index 046d0655122f..111fef781b2a 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > @@ -98,6 +98,33 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
> > 	return -ECANCELED;
> > }
> > 
> > +/*
> > + * Emit INVAL_FULL (intra vf) to invalidate engine TLBs across all engines
> > + * within the VF.
> > + */
> > +static int send_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval, u32 seqno)
> > +{
> > +	struct xe_guc *guc = tlb_inval->private;
> > +	u32 action[] = {
> > +		XE_GUC_ACTION_TLB_INVALIDATION,
> > +		seqno,
> > +		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
> > +	};
> > +	int ret;
> > +
> > +	ret = send_tlb_inval(guc, action, ARRAY_SIZE(action));
> > +
> > +	/*
> > +	 * send_tlb_inval() may return -ENODEV (CT disabled at cold boot) or
> > +	 * -ENOTRECOVERABLE (device wedged); nothing runs on the engines in
> > +	 * either case, so treat as cancelled.
> > +	 */
> > +	if (ret == -ENODEV || ret == -ENOTRECOVERABLE)
> > +		return -ECANCELED;
> 
> I am not sure about ENOTRECOVERABLE check here. Other invalidation
> functions don't have it, and I am not sure if wedged is considered

I think that an oversight that when the ENOTRECOVERABLE wedge changed
merged, this code didn't get updated.

> mid-reset as the document for tlb functions says for ECANCELED.
> I saw Matt mentioned that ENOTRECOVERABLE check might get a revert?

I think it will revert sooner or later, but it is in current code, so
at moment I believe is correct.

Let's just keep on Raag's patch that will revert this and if it merges,
we adjust this code.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> I will leave it for Matt to review this part.
> 
> Other than that, patch looks good.
> Acked-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> 
> 
> > +
> > +	return ret;
> > +}
> > +
> > static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
> > 			     u64 gpu_addr)
> > {
> > @@ -346,6 +373,7 @@ static long tlb_inval_timeout_delay(struct xe_tlb_inval *tlb_inval)
> > static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
> > 	.all = send_tlb_inval_all,
> > 	.ggtt = send_tlb_inval_ggtt,
> > +	.ggtt_full = send_tlb_inval_ggtt_full,
> > 	.ppgtt = send_tlb_inval_asid_ppgtt,
> > 	.initialized = tlb_inval_initialized,
> > 	.flush = tlb_inval_flush,
> > @@ -354,6 +382,7 @@ static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
> > 
> > static const struct xe_tlb_inval_ops guc_tlb_inval_ctx_ops = {
> > 	.ggtt = send_tlb_inval_ggtt,
> > +	.ggtt_full = send_tlb_inval_ggtt_full,
> > 	.all = send_tlb_inval_all,
> > 	.ppgtt = send_tlb_inval_ctx_ppgtt,
> > 	.initialized = tlb_inval_initialized,
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > index bbd21d393062..7c3bf32d9258 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > @@ -301,26 +301,56 @@ int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
> > }
> > 
> > /**
> > - * xe_tlb_inval_ggtt() - Issue a TLB invalidation for the GGTT
> > + * xe_tlb_inval_issue_op_wait() - Issue a TLB invalidation and wait
> >  * @tlb_inval: TLB invalidation client
> > - *
> > - * Issue a TLB invalidation for the GGTT. Completion of TLB is asynchronous and
> > - * caller can use the invalidation fence to wait for completion.
> > + * @op: backend invalidation hook to issue
> >  *
> >  * Return: 0 on success, negative error code on error
> >  */
> > -int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
> > +static int xe_tlb_inval_issue_op_wait(struct xe_tlb_inval *tlb_inval,
> > +				      int (*op)(struct xe_tlb_inval *tlb_inval, u32 seqno))
> > {
> > 	struct xe_tlb_inval_fence fence, *fence_ptr = &fence;
> > 	int ret;
> > 
> > 	xe_tlb_inval_fence_init(tlb_inval, fence_ptr, true);
> > -	ret = xe_tlb_inval_issue(tlb_inval, fence_ptr, tlb_inval->ops->ggtt);
> > +	ret = xe_tlb_inval_issue(tlb_inval, fence_ptr, op);
> > 	xe_tlb_inval_fence_wait(fence_ptr);
> > 
> > 	return ret;
> > }
> > 
> > +/**
> > + * xe_tlb_inval_ggtt() - Issue a TLB invalidation for the GGTT
> > + * @tlb_inval: TLB invalidation client
> > + *
> > + * Issue a TLB invalidation for the GGTT. Completion of TLB is asynchronous and
> > + * caller can use the invalidation fence to wait for completion.
> > + *
> > + * Return: 0 on success, negative error code on error
> > + */
> > +int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
> > +{
> > +	return xe_tlb_inval_issue_op_wait(tlb_inval, tlb_inval->ops->ggtt);
> > +}
> > +
> > +/**
> > + * xe_tlb_inval_ggtt_full() - Full engine TLB invalidation within a VF
> > + * @tlb_inval: TLB invalidation client
> > + *
> > + * Issue INVAL_FULL (intra vf) to flush engine TLBs across all engines
> > + * within the requesting VF.
> > + *
> > + * Return: 0 on success, negative error code on error
> > + */
> > +int xe_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval)
> > +{
> > +	if (!tlb_inval->ops->ggtt_full)
> > +		return -EOPNOTSUPP;
> > +
> > +	return xe_tlb_inval_issue_op_wait(tlb_inval, tlb_inval->ops->ggtt_full);
> > +}
> > +
> > /**
> >  * xe_tlb_inval_range() - Issue a TLB invalidation for an address range
> >  * @tlb_inval: TLB invalidation client
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
> > index a76b7823a5f2..665072b4b81d 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval.h
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
> > @@ -20,6 +20,7 @@ void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval);
> > int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
> > 		     struct xe_tlb_inval_fence *fence);
> > int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
> > +int xe_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval);
> > void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval, struct xe_vm *vm);
> > int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
> > 		       struct xe_tlb_inval_fence *fence,
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > index 3d1797d186fd..d77be1aedc91 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > @@ -36,6 +36,16 @@ struct xe_tlb_inval_ops {
> > 	 */
> > 	int (*ggtt)(struct xe_tlb_inval *tlb_inval, u32 seqno);
> > 
> > +	/**
> > +	 * @ggtt_full: Full engine TLB invalidation within a VF
> > +	 * @tlb_inval: TLB invalidation client
> > +	 * @seqno: Seqno of TLB invalidation
> > +	 *
> > +	 * Return 0 on success, -ECANCELED if backend is mid-reset, error on
> > +	 * failure
> > +	 */
> > +	int (*ggtt_full)(struct xe_tlb_inval *tlb_inval, u32 seqno);
> > +
> > 	/**
> > 	 * @ppgtt: Invalidate per-process translation TLBs
> > 	 * @tlb_inval: TLB invalidation client
> > -- 
> > 2.46.0
> > 
