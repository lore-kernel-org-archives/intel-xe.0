Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C830EFCE3B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 19:08:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD9810EA9A;
	Wed,  4 Mar 2026 19:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HsGV1VjZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA43810EA99
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 19:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772651282; x=1804187282;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ri7oKx0pmum9RabdTplDLg6/198ODHCeU+M27uhMYYs=;
 b=HsGV1VjZkRqoyQq5TfgpK2y+RToh3ijt/71KIiIadyepl/DfxtChj9qZ
 xkhoLkYaE8zLsDP/xEWuG1OrvcYWUDQ3KoG+uUk3HipxqtcfLmJJNoIL1
 UkB+EvMQv+woT17jZ9U2IvVagaEd4NlRAyGcq4OdS6LTdO1OJfUibHTd7
 mZ3zDgg4usVW5wJCwm3uSFg52sPNOwb8QtnEQnpQspFhzqm1g+PvWmNnE
 eUovlhAVvPWCzVz6K2w9+hygvzQBcO0xmJKG7wcR3z0Rrf9axEd7lEOPg
 O+dWMYGsuJKUfjTEJtDu81bJLanbzUTGtuQsCE/sk40EXONRrRRIoHoV8 Q==;
X-CSE-ConnectionGUID: EV54CerqTyKqYLIzCR46jQ==
X-CSE-MsgGUID: /nUKBeKjQUai0eeXe7QWOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84436628"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="84436628"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 11:08:01 -0800
X-CSE-ConnectionGUID: 9cNAK4psRdm+zjBQO3NP/Q==
X-CSE-MsgGUID: ZSFomZtrSh+ck2HO2nqKkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="218414667"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 11:08:01 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 11:08:00 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 11:08:00 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 11:08:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a81IaZf0uxXwBc92QBiftL8a+M3B5cEOMtN2O2XF42ghihGWO1VAkMNmnrPKm1Z3r9M3Ve/Ti2TlUz/kh1h3Jm2/BAF3Pix7/brbBkAAmyG1gavxWl1KSsArIqS15XCVA7fVSGlvJLlhDu6EGB9fyCcNPepgxLx9/wqBr6KVzwrZWA74zJATF6WUibcBhUCRTRLDub8Liz/wUgmDLFbvUM9pZ6D/EGFl6lF9GWFj0LqlhWsm8tKTHyQ3WzXfGotdvdu03zLItQmPGUs1OkamEtyM2qWmMLq+F5B3dIZ6Kt2F3nwY4blR3/zVUdNNdiYHfpKb5Aa+SkGAu9PnUYGGDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ww9+zjxyw0xs8OHbo+ULuvpYtE4zksu/vP/pbqjCq7o=;
 b=gGsQagcM/g5h37DBl6vVjqf8Zqm8QTiSfe+Wz9h8R3LfMXGx+fr2NTBjKLhJs14+dCeEhwq5a/IWvIA+p4mys3Ic7GtyLdint6xOkE+Bc1xYbqHsPNhI35sIs3tPpCWnH4zDsRYORtfVtkQ/h+EbtL4XZvg4oQtAE9w39hz+xvYrlzHo9aqmq/wg/TG29no5XljsUwz/EfdT4jA3EiWavnd5oloSB9Jnz++QRQAg/M5TdTPwdec5xTqW3psV+ozgkRoGTRDu2d1GDx7mqLWlS7418K+9QB2cJWwrMFt64YlvsYVvxNxTAG+qkwkNnc0R/G+dRi9ZylJ2w71b0pQI7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7937.namprd11.prod.outlook.com (2603:10b6:610:12c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 19:07:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 19:07:58 +0000
Date: Wed, 4 Mar 2026 11:07:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: Fix overflow in guc_ct_snapshot_capture
Message-ID: <aaiDC4zwtsOGq6Po@lstrano-desk.jf.intel.com>
References: <20260304112501.230992-1-mika.kuoppala@linux.intel.com>
 <aahgKt4kHpXWwenB@lstrano-desk.jf.intel.com>
 <87a4wn4ex3.fsf@mkuoppal-desk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a4wn4ex3.fsf@mkuoppal-desk>
X-ClientProxiedBy: SJ0PR03CA0292.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7937:EE_
X-MS-Office365-Filtering-Correlation-Id: a64b65ba-cd53-40e9-c19e-08de7a2158ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: JCcioyJ/Sd3Da1RdknC4uH/uPOSx/goMl0Xn+ar9w8j5e/uhvJixDrNVU9yn541nMrqIWDmt71CFmUwG5mUaqwHUTvV935CkZnL79+3vGDKojngUYaI/dpXToxhgejUktcbMICVuo+Eih3zHVnJAlHpVSKgbXibIjJPxZlAaiA8Sb9v51IdHR368MDgPvE9PCqS7pcJZofg7JVflWLr4jOlCpy+gVcQezViFqF8TyvIk2jitmlN+dBouUgYc+9pm8XZSZyWhWuldqYEQdrlMyrlFrfO1PSrdcPI4+ev25zvDlRZvCYDohP4RiF9ffDJ9lWKOaPZGT1KDJST4gRymadcICKRFSOPGHy1/RR1id/lvUtPK+IPq3R1tGjKe1vPu8rcH36Q1c2RdY00kUMkXMHiYS3udCb/eMI6vDnst5FDquOMUxbGODFmsEg9HPv4rdP0ij8MNPwS8q9PexVAkW5wDnYm09FDovngkz1CTvaEBdjBzPiRxSsjDVFeoQ5pUicmvf1AiZKr1AUYM1IPAeWUX7wS7jGmqYCxjOWnOYPiUoBIawS9KTMu2hCXCoxa3k/2psFRwupo63yWkQf97UoJuwIKSO7CHT8I8zETFVD7oysRUmUL4Yzw/ZILTnycuK3N++exh4B7V/ABiuMo350Mp0lvaqywohRSvbQzVLubLlX5DkYuc6BWnHp+1JALKSEUeSZkMuHRYheFmEXlLeSbbzLm7wZfdPSSvLp/Ol7s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7dY5lC4quvO40aK7Zu+FJtXa8ThclgMVZOx5zznm7RxK/1YV29bJMz1zW1?=
 =?iso-8859-1?Q?Dww45w+jdmh2uSgFWJbdXM6bIo9Q937KG5oERdD9b5BNydjCGdmgXXqmy/?=
 =?iso-8859-1?Q?88oDSXZShsGGPTKEgEszjl0CPoRl7PL+lNOctcsm7AhDAjWZm1Wiwx0jkp?=
 =?iso-8859-1?Q?yRbFrWwg0gXgxktQVhUjOz5ipn1UbW77XeOamCPCdFIwUFlwPttwOEj7ln?=
 =?iso-8859-1?Q?VIFfzzKnEhEmTSdpN2egZRmBaLHjzDLEKPLbTRweKy+omMSc7dpqfcZBnF?=
 =?iso-8859-1?Q?cP+KhP51vC6POfdmnXmEfKoZOJNQFaUebRREKg2CNN+TN0g1f4P7sLWvxy?=
 =?iso-8859-1?Q?4vY45V0uMeaFJhbgZgeS46Vrlmj684wJlYqU7ZGL69JqHf/kvFk+SOBYJV?=
 =?iso-8859-1?Q?y2fYk9n3JMtlSaVnkDAeCJXMVyWrTHFNrCUmTW+y74KnU0H4JrUg6qLwBF?=
 =?iso-8859-1?Q?44K60kdPlUmZeLaAR3dLbO8UikqYW4J26y3K7OMappSl8pTKBKSeb+wtf7?=
 =?iso-8859-1?Q?7puBR50GiGnOlYZnoFlP9tzRyaeAeRTzISUKNPirIpw7Dsz8+yy9iq+bNB?=
 =?iso-8859-1?Q?pkHYGPfFrvYozWyjnOt5yOaGqZVcfDOYFZBTwIh5ca7BjnHFXw4T0juFSS?=
 =?iso-8859-1?Q?yn2ON/Qk+1td479M//Dz0msL1zmczdd03vHoqBqUecUip60I/aQ0saQwQ9?=
 =?iso-8859-1?Q?sM9DhwyRumBTCbMo7KmFipl8pRkHZgIaOs7dgrWuwQINSBs90BYjah9NIZ?=
 =?iso-8859-1?Q?z4adD7+r7w/P0ioovNFiF1e3zUp9num1zQPeOcOG6nhjLoLjgpuTFLcuRz?=
 =?iso-8859-1?Q?Oekwla2lHt273QjRV93kykRI2zhFjg8Uy9Nmi+syidjqNfXeegTfSxN6JX?=
 =?iso-8859-1?Q?Rm0iPv7Wi/FmWTOPQNaFYHUSUAw4KMNehZGkBUC2vb8OCqhTR7azjwogRP?=
 =?iso-8859-1?Q?PMlbS6zBKHrI4EqyK+8HcTVNBulp9EXB3rXMc6YF6iAdf7y8VqYgOqZW/W?=
 =?iso-8859-1?Q?Op/qgCsYsJ6i0+EgYbKOUytDJyZzx0Aksj8sFC2aQqzqa8lipZsTRKGyIw?=
 =?iso-8859-1?Q?dked3/2YiU+jOmRKhEaYQf25pm/ae0K6XXixx45XtQopiA4SAajm9aX7OZ?=
 =?iso-8859-1?Q?9phejDWIHUbV5McEQ9kcNkksYvh6LEcnJBsfVYwisULhTO3aXqwpPyx4UI?=
 =?iso-8859-1?Q?uxghSfgR9ArTggNGpxWuh/9+4xkrV2SNCjAklxuf30BeJmV/XsOUDCyKSk?=
 =?iso-8859-1?Q?07ZvC+FTM1v/5wyq9Q7oteoHck75W+Jm9MluGk/9D4lVr5zcc/2cqCa5Tb?=
 =?iso-8859-1?Q?qY302tsPAoMZuEevsB69WDMRM5IG8D8c3pNrgof5ACzpb7cTbWc8lrUIgg?=
 =?iso-8859-1?Q?rUvKWWcYAAXLhUS6aualmPXaQivpfW9Dk+yrciklmu0rlaUnBTvJ3h0YnD?=
 =?iso-8859-1?Q?6rBTRSa9uE7aMlUhTe1WEQYAJyNzLO0VtChKz/CKd9rDHz9DQwiX9YOsne?=
 =?iso-8859-1?Q?Qc2jdu05hSk24E0rd9chNEvzB9MygM9IxfIA4Of4uSvCkwfZ149Xhtb9ai?=
 =?iso-8859-1?Q?k1lJiKEYO/9UAIVWcWJ/LGY+sXotmUmM2a6VenxH3Ivorfzn2R1wNHNCbZ?=
 =?iso-8859-1?Q?5vGjCxIbdBb7fwGPqYD66PFiz+dlhz+MxVdgh0aVQ0j3qNFCgDGCPHM1bt?=
 =?iso-8859-1?Q?dW77nOghelgJ0Smrk3hbRCY+oJDiEAKZhPpNKG0kr3WNXNGkYguCHFe+77?=
 =?iso-8859-1?Q?CT0LwBrG7RajsWQztg2tLHKezBCitmKhPhLosDGKU+fy7HjttdMaYojB+5?=
 =?iso-8859-1?Q?VUdPj7oN9asI2JVKBizbgGwxWyEbQrQ=3D?=
X-Exchange-RoutingPolicyChecked: p+s4ZcAnXWUvlDTP+hQ+93SzAy8D2MBUELJ0KHrCZK7CS53VNc6tuYDTNYRFGLiA23W8KJCBWvkQVQzSmpZBLg3cgsuk+zezyIKedGD8imXNKodil/cddogRwHldhSvMk2jw7bfsC5SNVSrv3PuVAO9q2X2fOBmjWwKdKGagNoVu7Q8R0H2lK+Dx1VqJnaG4xPx4PQWDmHxyYwUEEyMNgOcuISwyq6+DOWO9irNgb3bcLABl0Avdr3rjhb/ceM2Qw20QzuUY/7tQgHyOHlG0fB7dgd9EPA7HKM6MhOEK4inGX71K73vmOegF71i1d9wzaYk2cHdIe5OnHuwAQ22RTQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a64b65ba-cd53-40e9-c19e-08de7a2158ef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 19:07:57.9392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WEC0jRmTTnltCGlqUjyeaW5322wzEuD3Sm5H5JJkFIopIhDRJqKtGHcxb3ljm0wsdy4eDSvWh8kQoW9tkikMBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7937
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

On Wed, Mar 04, 2026 at 08:39:52PM +0200, Mika Kuoppala wrote:
> Matthew Brost <matthew.brost@intel.com> writes:
> 
> > On Wed, Mar 04, 2026 at 01:25:01PM +0200, Mika Kuoppala wrote:
> >> snapshot->ctb is u32*, so pointer arithmetic on it scales
> >> the byte offset from xe_bo_size() by 4, overshooting the
> >> intended start of the g2h portion and writing past the
> >> allocated buffer.
> >> 
> >> Fix this by using *u8 to get the arithmetic right and also
> >> prevent future mishaps.
> >> 
> >> Fixes: af3de6cf06f9 ("drm/xe: Split H2G and G2H into separate buffer objects")
> >> Cc: Matthew Brost <matthew.brost@intel.com>
> >> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> >> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> >> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> Cc: intel-xe@lists.freedesktop.org
> >> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_guc_ct_types.h | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >> 
> >> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> >> index 46ad1402347d..1b4b9b713d42 100644
> >> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> >> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> >> @@ -74,7 +74,7 @@ struct xe_guc_ct_snapshot {
> >>  	/** @ctb_size: size of the snapshot of the CTB */
> >>  	size_t ctb_size;
> >>  	/** @ctb: snapshot of the entire CTB */
> >> -	u32 *ctb;
> >> +	u8 *ctb;
> >
> > Ah, I see the issue. Maybe 'void *ctb'?
> >
> 
> What is the benefit? We clearly do arithmetic on it.
> You want u8 * cast on where memcpy is done?
> 

memcpy + xe_map / iosys_map layers operate on void * pointers.

Functionally I agree no difference as the point math for u8 * or void *
is the same but for consistency void * I believe makes more sense.

Matt

> > Matt
> >
> >>  };
> >>  
> >>  /**
> >> -- 
> >> 2.43.0
> >> 
