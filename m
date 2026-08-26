Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002D1C61DBE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 19:50:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 913E310EDF0;
	Wed, 26 Aug 2026 19:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ejl+qhbb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC47510EDF3
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 19:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787773848; x=1819309848;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iuRmg54UwgYD1XeOSrDdy59vZW8ArekszKWCxJQHePY=;
 b=Ejl+qhbbolUGB/oVCqhE5LqfNtbgXVRlTfvmQoVeWc23f990D86pQdvu
 Z/12hoAwSdXQtPrXN95Yej4g+9FRDY9z3G+I8niDMLI7Kx31rtgGQ6Qft
 uUunUQ/kKXHLNmPiRcXb5NNotxCyUtb3zlzvMJQ5V0cB0jdt1Hxib6EwL
 UKIg8yJogsfyK+chF2w95y2c3Gj5mvUTCPORStMf+//gj/Hr9PH4NZoQR
 QiAMDVS8UNxQTHjT4l688kgVcVVGEvSa6/SI/Ie5ZCCYXeI7l7XfC9DMi
 TCvhkfzAgoumW97fVqVkvaeEwPPnLuYk+O/10ybbP1rQkLhQ89oTfDKHA g==;
X-CSE-ConnectionGUID: vvj8GyznSk+1kfteXDTJLw==
X-CSE-MsgGUID: aVgQpIg+Q8qV8/Puh2sffg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88184283"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="88184283"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 12:50:47 -0700
X-CSE-ConnectionGUID: KUVIuOq+QWCCX5NJf2SKOA==
X-CSE-MsgGUID: +XecI5yVQfaANfAvo7n0DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="267086117"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 12:50:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 12:50:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 12:50:47 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 12:50:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J1NN527PFSBOojgdukVq7woiCGeVjlVZN54lNsFCrhprWZ0ivmY8trVoRWAsnidM/YASxJjAWmmH9PLOJkymBgq4dLi4ojSFSxWJaP/4MS6ynhORSnWrNy1BaptzQSIWufCZd+cih+ugaZgb7MFHxkm9uiZsKAw4uc9ZJw95y6rD0aOoWgyqbUJWO622HaEtq7PsI2JX25N/8ZewpPj8p5sIsrqZPDvqmBHqNtIX21Z4r2vHxR/08GzTWavc0/rpIjqVRXZr7IATJPvqDhmOPRajT0Roib+WPXwVrrg0g/M8Fn0htoE4QGXt8YDDblfXJtlMv+sf5/GBHaYD2jcXDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fprPcCVtrBUrJnEYJ9yXpIxoShAAlhZm8o/PMKlsU3U=;
 b=DMNs5zFpIv5A//X3topoImwiM/6FqaP9D4RfqF6cjRTQzCU1oChXi/R3TgZyd+PuDT5F/y9BPn1M31xsWxmxoig3M2AOB3HDStAktFzt2B53vrKwtIPCorTCld70mDgz1FmVk/5GLGH5WzW882B2G/xFcJ9xeF4k3EPGaQuY23TahqFfmtFuwSJPqxf9e+RI1hiD7BI1N2GH12Tgz3ckhGma98D72WfpjIzBbRdUm2Q5vtjs2syodTPxhL/FsvOcuLBLmERh7xJ33Gf3qM2QBOhqs57OztyduW4PpIxzVMmyDxFNmEPLPEUitaIZ4NrFxSdxgIoXQxtsVWFCKIqXRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4639.namprd11.prod.outlook.com (2603:10b6:806:70::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 26 Aug
 2026 19:50:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Wed, 26 Aug 2026
 19:50:45 +0000
Date: Wed, 26 Aug 2026 12:50:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <tilak.tirumalesh.tangudu@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/tlb_inval: add xe_tlb_inval_ggtt_full() GGTT
 invalidation helper
Message-ID: <ao9Dkj8tZJv9wK5x@gsse-cloud1.jf.intel.com>
References: <20260826112533.3289978-1-tilak.tirumalesh.tangudu@intel.com>
 <20260826112533.3289978-3-tilak.tirumalesh.tangudu@intel.com>
 <ao8-8NPZpFCiBSQB@nvishwa1-desk>
 <ao9C8umPyn2ANiIg@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ao9C8umPyn2ANiIg@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0286.namprd03.prod.outlook.com
 (2603:10b6:303:b5::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4639:EE_
X-MS-Office365-Filtering-Correlation-Id: cac218f5-82b5-416b-12f5-08df03ab514d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|6133799003|18002099003|22082099003|5023799004|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: BNL6nLYyuRqB8L1SlfdOmD/q2IYtorqijg5o9F6nklmPH8tRJUXtWhZVnD5kv5h++BUVW+CSWOptBiMgPYlYPxCpH7HoC5Ys/v5jWQ9b9qIqspmaYq0whV5NJytcdJq+IoS+BBdTEzSMvlX4cVMwmeVyBnophq06U3aGbZv/BpBRgDYHCyEneBPLsXj6W85v+A1CM9b46VmpvkDskJp8eWdJpAPr1dQ9OfwWTOrg87OJWhCtO5tRVrrFeuEdFTy37rHq8a+juHgFrbk+tw7mr15Hpa7iKFjfGkf3eoB9So0j0ggydSEw/siVUjvWIleY4MW53BugRG1ecL3AvVN3wXjiiX+TcfCxj4aj/NnenM0IEiLcsGoEySQNMJYt3WKskXL75Bv41RRidVC2UP9wzAu15Dw9or7jTLbL0TNThAC8i9tpCt8E+7r2V08yOuQ5LEgSS/dY4MHm7WY0jsNphknL7Y2j5F8mBlrew3l6ui7yBE2P5KKs87tgNvymZdpTMS1UZgZfTonAQaRe2gl4cRZF2LvpG+1117FwXQXG42XvNDtveGQp9yyZ+qqG9G/YfDc5ir53SOuF/kHliZR/NDW6cKPRGSI+anOwkU41/klOlHXQq6ZvIJWUT4AsYWXBcoN/iZiGbyHbT9Bg1B7lGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(6133799003)(18002099003)(22082099003)(5023799004)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vIjTu01bx3wh/+WF/bXj2Av+GUKkv5eE1x6rqDlbcA4WVIs7TRWEkkPkBN1/?=
 =?us-ascii?Q?a8WlbM4jN0AQzU4szFRZgtqOo5AWa8Ho4886/7ozVxkHZIAhTOQh7ENIZERn?=
 =?us-ascii?Q?Fmu8o2W+RQ4rKNRTzh+wJ6XyxgEhfHScgcRKFtqVxzI/1J9obLfxzl7L21e7?=
 =?us-ascii?Q?RO2/wgwTi+qnThNuoKWZ93j+2NCTEADMo7DfNhpxkdWynN+rHWLIa/mdteB8?=
 =?us-ascii?Q?ePMkJdRz0l61Kfr1vY4QMG9CxzNTul9up8fandEr43mw/0DrSIzgpnVow13E?=
 =?us-ascii?Q?2JOIINI5IRat1DZ7XVZyrFo+UKz8j46twS5gy002zSqfg+2kVEaeFQEUv8x8?=
 =?us-ascii?Q?KgcetqZ/JqU6H5HSbwRuQQDnoVYMr/3oJPApqbFdkznUtsLYwfzWwPTzfDfE?=
 =?us-ascii?Q?n+3NmwQjIYGbEdDuuuWwqfXvBsove+QKQAZE6nlyd7mCeiSQ9V5wz+dSeBV7?=
 =?us-ascii?Q?cLJb1eR40SW34OGOClekEFHULG5ijfBCbK4COQOh5MbvlVboZZZh0O7Jh+9v?=
 =?us-ascii?Q?fs7FC+KX9YCA3EsHgyuCP1lOSl0HJcnGBCyWjaWOeY3xp7Ebsa0ODUcfCvBo?=
 =?us-ascii?Q?Pbhhk0i3K8JIKg2JYOKbu7NexrpwnLdGmeS92sjdG1cFOl2BjFx8PQtoyAsq?=
 =?us-ascii?Q?l4tfinBy2qn5E0x6z7pmjxBfiiAj//+UVvVSbq9VITkgEhyYy6btUq95BO2O?=
 =?us-ascii?Q?ZxzZD6djKV1GYKunb5vS5Do9r9EjYeAAPw49QTacMXP+BIX6gGezc6xR0FlW?=
 =?us-ascii?Q?F/fFmLh9L0pV00et01PUuEQ7ewlIESqEEDOPfkLWjO4VjHJlV1Tf7mZLuHMn?=
 =?us-ascii?Q?HuSEtJ5XHyrUFjBQEOR+AA5+mxQFccDHcL4sFh9xwC8r5NTc/x1B/JFOUYpi?=
 =?us-ascii?Q?DgZ8tk0biwq1L/DMdZcVy0jfmOcQN9Q0ccSjIPgz5vh0wQVqloaiwtXwgFg9?=
 =?us-ascii?Q?V2T9yW7eJLaEzaEgEO3vdvjfz3lW7ft1ld24ZUX+CjqUuw5tVT1Hkc7qWUmC?=
 =?us-ascii?Q?4v2t8D31yTWySQpIG7FjSW4GWNinU7GfObb0WUq3ZiglzmhsTdzU/8L0KGWM?=
 =?us-ascii?Q?5G1ayn7ZPuaq7SvEpUC5OgmoBl0C56pNALDfIAUTSgpSqP9ZYqkZuJpLX3pf?=
 =?us-ascii?Q?S2Odoc10dFFECSCi1UWsv3RVU1CIjjrMjKt/ShAvijZgtt38gl+ycdqBNvTg?=
 =?us-ascii?Q?d7MDMyGxB8oWdc0BnrQnfs9t/5xn6c3gi5PGn/zozaK+Nvm9eTtlTD+6ULRa?=
 =?us-ascii?Q?bkLtarorNMb/1Oq0X9Mw5qlXCG5Y0haUxyZHPB9bxqoJR21yjvZPbIuIk6tL?=
 =?us-ascii?Q?84ZAKYRkrm0Clmy9n8XkiZBBsCzdA+63Mfaqp9yxV/WUsmLwS+hRd5K6jTxA?=
 =?us-ascii?Q?9rOwpXa6A+uprIaGiFzGzjWrcTXC/BTSB3I/mOakgOxoVY8KW6IR3KI4X5ZJ?=
 =?us-ascii?Q?EwyhEJGM0rI2jtyWP2btNZS/ulpDxtawZSuuRcAe15S8oO2vf7JiYhUSu70C?=
 =?us-ascii?Q?pPYm2P3ghVLO+hDQgVSa2C9QVgPNb62FyU9ge876ziCryi4LYXd+6o7jW9rs?=
 =?us-ascii?Q?mbdl0JxwpEbQgArUjiPzn04DXuiyyhiyqI2yQV5UsNAe2vDX+25a5Yi0Tj5Y?=
 =?us-ascii?Q?ZZ1bJTkA2XF5n1oZbfZcwZjRshovzjI6UAR6kZ+YFC0mS60/WKGZ+GUzW7EW?=
 =?us-ascii?Q?VRBUasZOj+Nmc7fNbCvIsZcffG2ikXsuQwvJ/YxWeKZM8gtLwS2Zc4C2AqTv?=
 =?us-ascii?Q?VWF3NAee+JdMnIatjeSyYVvBXKHZ658=3D?=
X-Exchange-RoutingPolicyChecked: dF2sBuKcnlyMVtJD4Oc675JPqXXnpl8jLU6sqAh2cc+kikyAih8TUmdoq7PWFbA/8tKgkyvwNAinzDVVKKCY2JUGiUAVBGswQqxjqL7Fng79DFIct1fKsAvhgQcUM3R+3kWu53c7IBIvKnCyEU5ogBhtihrPpZ98WMZiD0G89zLetAJO7xuoGOeB/lpgiKRyFQqO9VV+HDnhOkOKmbsKmqIIX1/GvPMXhMguBFwLb/0HhBxGOf0AmvylwqnFgSxRBu3v1nO9ZPxVBENM4BJ+6kPAzv/rMIvlGfmnzAlbjKJJovMixEt+5A4C5DNgKByon26J61e/O3ZkhQFBo0ICQA==
X-MS-Exchange-CrossTenant-Network-Message-Id: cac218f5-82b5-416b-12f5-08df03ab514d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 19:50:44.9316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uctp5HCSs9s512SIc0Pg83mcHclCyn7hPTuPGvV3SAHlu7OhcTPP035wpgpu+MQ3ol4jCj6jXOEgzUnbSgjeSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4639
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

On Wed, Aug 26, 2026 at 12:48:02PM -0700, Matthew Brost wrote:
> On Wed, Aug 26, 2026 at 12:30:56PM -0700, Niranjana Vishwanathapura wrote:
> > On Wed, Aug 26, 2026 at 04:55:32PM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
> > > From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> > > 
> > > Add xe_tlb_inval_ggtt_full() and its GuC backend
> > > send_tlb_inval_ggtt_full() for full engine TLB invalidation
> > > within the requesting VF across all engines.
> > > 
> > > v2:
> > > - Refactor with new helper xe_tlb_inval_issue_op_wait() and address
> > >  nits (Niranjana)
> > > v3:
> > > - Avoid TOCTOU issue around CT state (Matt Brost)
> > > v4:
> > > - Propagate real send errors instead of masking as -ECANCELED (Sashiko)
> > > 
> > > Assisted-by: Claude:claude-opus-4-8
> > > Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> > > ---
> > > drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 25 +++++++++++++++
> > > drivers/gpu/drm/xe/xe_tlb_inval.c       | 42 +++++++++++++++++++++----
> > > drivers/gpu/drm/xe/xe_tlb_inval.h       |  1 +
> > > drivers/gpu/drm/xe/xe_tlb_inval_types.h | 10 ++++++
> > > 4 files changed, 72 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > index 046d0655122f..665483bf2e67 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > @@ -98,6 +98,29 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
> > > 	return -ECANCELED;
> > > }
> > > 
> > > +/*
> > > + * Emit INVAL_FULL (intra vf) to invalidate engine TLBs across all engines
> > > + * within the VF.
> > > + */
> > > +static int send_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval, u32 seqno)
> > > +{
> > > +	struct xe_guc *guc = tlb_inval->private;
> > > +	u32 action[] = {
> > > +		XE_GUC_ACTION_TLB_INVALIDATION,
> > > +		seqno,
> > > +		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
> > > +	};
> > > +	int ret;
> > > +
> > > +	ret = send_tlb_inval(guc, action, ARRAY_SIZE(action));
> > > +
> > > +	/* CT unavailable means nothing runs on the engines; treat as cancelled. */
> > > +	if (ret == -ENODEV || ret == -ECANCELED)
> > > +		return -ECANCELED;
> > 
> > Looks like we don't need the check 'ret == -ECANCELED' here (redundent).
> > Basically, we only need,
> > if (ret == -ENODEV)
> >      ret = -ECANCELED;
> 
> I think actually -ENODEV is needed because it is odd corner that only
> GGTT invalidations can legitimently hit with a blind CT send which was
> my suggestion.
> 
> -ENODEV is the return if the CT is disabled (cold boot start)
> -ECANCELED is return if the CT is stopped (runtime toggle)
> 
> GGTT invalidations can be issued during cold boots as these are kernel
> objects, PPGTT cannot because these are user objects.
> 
> Thus, I think this actually correct in the current code.
> 

Opps one more thing - iirc wedge devices return a different error code,
but that might be getting revert. We should check on that as I think
wedged needs to be handle here.

Matt

> Matt
> 
> > 
> > Also, It seems bit odd that other functions like send_tlb_inval_all(),
> > send_tlb_inval_lmmtt() etc, has similar structure and similar documentation in
> > xe_tlb_inval_types.h (regarding -ECANCELED), but doesn't do this conversion.
> > So, they are not treating XE_GUC_CT_STATE_DISABLED (where guc_ct_send returns
> > ENODEV) as a 'cancelled' state. May be here also we should do that for now,
> > if we need fix, then it will be a fix for all of these callback functions later.
> > 
> > Niranjana
> > 
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
> > > 			     u64 gpu_addr)
> > > {
> > > @@ -346,6 +369,7 @@ static long tlb_inval_timeout_delay(struct xe_tlb_inval *tlb_inval)
> > > static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
> > > 	.all = send_tlb_inval_all,
> > > 	.ggtt = send_tlb_inval_ggtt,
> > > +	.ggtt_full = send_tlb_inval_ggtt_full,
> > > 	.ppgtt = send_tlb_inval_asid_ppgtt,
> > > 	.initialized = tlb_inval_initialized,
> > > 	.flush = tlb_inval_flush,
> > > @@ -354,6 +378,7 @@ static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
> > > 
> > > static const struct xe_tlb_inval_ops guc_tlb_inval_ctx_ops = {
> > > 	.ggtt = send_tlb_inval_ggtt,
> > > +	.ggtt_full = send_tlb_inval_ggtt_full,
> > > 	.all = send_tlb_inval_all,
> > > 	.ppgtt = send_tlb_inval_ctx_ppgtt,
> > > 	.initialized = tlb_inval_initialized,
> > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > > index bbd21d393062..7c3bf32d9258 100644
> > > --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > > @@ -301,26 +301,56 @@ int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
> > > }
> > > 
> > > /**
> > > - * xe_tlb_inval_ggtt() - Issue a TLB invalidation for the GGTT
> > > + * xe_tlb_inval_issue_op_wait() - Issue a TLB invalidation and wait
> > >  * @tlb_inval: TLB invalidation client
> > > - *
> > > - * Issue a TLB invalidation for the GGTT. Completion of TLB is asynchronous and
> > > - * caller can use the invalidation fence to wait for completion.
> > > + * @op: backend invalidation hook to issue
> > >  *
> > >  * Return: 0 on success, negative error code on error
> > >  */
> > > -int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
> > > +static int xe_tlb_inval_issue_op_wait(struct xe_tlb_inval *tlb_inval,
> > > +				      int (*op)(struct xe_tlb_inval *tlb_inval, u32 seqno))
> > > {
> > > 	struct xe_tlb_inval_fence fence, *fence_ptr = &fence;
> > > 	int ret;
> > > 
> > > 	xe_tlb_inval_fence_init(tlb_inval, fence_ptr, true);
> > > -	ret = xe_tlb_inval_issue(tlb_inval, fence_ptr, tlb_inval->ops->ggtt);
> > > +	ret = xe_tlb_inval_issue(tlb_inval, fence_ptr, op);
> > > 	xe_tlb_inval_fence_wait(fence_ptr);
> > > 
> > > 	return ret;
> > > }
> > > 
> > > +/**
> > > + * xe_tlb_inval_ggtt() - Issue a TLB invalidation for the GGTT
> > > + * @tlb_inval: TLB invalidation client
> > > + *
> > > + * Issue a TLB invalidation for the GGTT. Completion of TLB is asynchronous and
> > > + * caller can use the invalidation fence to wait for completion.
> > > + *
> > > + * Return: 0 on success, negative error code on error
> > > + */
> > > +int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
> > > +{
> > > +	return xe_tlb_inval_issue_op_wait(tlb_inval, tlb_inval->ops->ggtt);
> > > +}
> > > +
> > > +/**
> > > + * xe_tlb_inval_ggtt_full() - Full engine TLB invalidation within a VF
> > > + * @tlb_inval: TLB invalidation client
> > > + *
> > > + * Issue INVAL_FULL (intra vf) to flush engine TLBs across all engines
> > > + * within the requesting VF.
> > > + *
> > > + * Return: 0 on success, negative error code on error
> > > + */
> > > +int xe_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval)
> > > +{
> > > +	if (!tlb_inval->ops->ggtt_full)
> > > +		return -EOPNOTSUPP;
> > > +
> > > +	return xe_tlb_inval_issue_op_wait(tlb_inval, tlb_inval->ops->ggtt_full);
> > > +}
> > > +
> > > /**
> > >  * xe_tlb_inval_range() - Issue a TLB invalidation for an address range
> > >  * @tlb_inval: TLB invalidation client
> > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
> > > index a76b7823a5f2..665072b4b81d 100644
> > > --- a/drivers/gpu/drm/xe/xe_tlb_inval.h
> > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
> > > @@ -20,6 +20,7 @@ void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval);
> > > int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
> > > 		     struct xe_tlb_inval_fence *fence);
> > > int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
> > > +int xe_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval);
> > > void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval, struct xe_vm *vm);
> > > int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
> > > 		       struct xe_tlb_inval_fence *fence,
> > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > > index 3d1797d186fd..d77be1aedc91 100644
> > > --- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > > @@ -36,6 +36,16 @@ struct xe_tlb_inval_ops {
> > > 	 */
> > > 	int (*ggtt)(struct xe_tlb_inval *tlb_inval, u32 seqno);
> > > 
> > > +	/**
> > > +	 * @ggtt_full: Full engine TLB invalidation within a VF
> > > +	 * @tlb_inval: TLB invalidation client
> > > +	 * @seqno: Seqno of TLB invalidation
> > > +	 *
> > > +	 * Return 0 on success, -ECANCELED if backend is mid-reset, error on
> > > +	 * failure
> > > +	 */
> > > +	int (*ggtt_full)(struct xe_tlb_inval *tlb_inval, u32 seqno);
> > > +
> > > 	/**
> > > 	 * @ppgtt: Invalidate per-process translation TLBs
> > > 	 * @tlb_inval: TLB invalidation client
> > > -- 
> > > 2.46.0
> > > 
