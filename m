Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA24C61DBE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 20:20:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E98610E339;
	Wed, 26 Aug 2026 20:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n4iae5/f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A7910E339
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 20:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787775626; x=1819311626;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4YlX6aha6Z5jyA9N0SoPeFxnoOf0ZUU6pvvzyciWExI=;
 b=n4iae5/fuaOWqRtDFxOEk4kb5eGb+jZUxYtD6hmnIIJHlQKuTCkOu2/P
 WO9vEEvjWkqb/XVgnZADOuR5iKvXwvA8ANCb57xtJM3KBNAqGPmi/xh+A
 lJ/sxUMISzeNBSUyFCj2hDycZ1NsbDuc6GbreOhHzTjj1SFDPwBF872+E
 hTJuSJZT7V9dOIH/BPqon3Nr6J1WY+d2aIhMu72LOHy7HCWyyMXHr2GqL
 XetaCPhD4vD5+KVV88G0yfarLN/WTamZonGFBrL26cmtAAZ/5HUq05GtY
 7n+N4m8cfwiq8l8cF4Z5YJZx9iOUNqBxAKiqCatuJ8cgHJATIwB9G2Ygt A==;
X-CSE-ConnectionGUID: WdAmR2W2THSB4ZBKFpaXgQ==
X-CSE-MsgGUID: UHYU5ArJRMiONF7RifnagA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88285134"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="88285134"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 13:20:26 -0700
X-CSE-ConnectionGUID: 4HH76PKnQbeSyo4khFQBLA==
X-CSE-MsgGUID: fUK6MWU8ReejMliSbr/UTw==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 13:20:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 13:20:26 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 13:20:26 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 13:20:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzhD+moU7RNgPkdO7QTwolio5XCC9LH+M9iDutlcbmBENFX6r10JOvojtggwh/ZrQcxGEZ/hskTVArQva7r8nI7e6IC1Ga16lPtDCWAhXKt92Pl52Ctc/CCpAHFCJz4ychQmXtg/9KvqZfRcbUSYg/WB4qSxWJbadYHwbobK1jG1//3FCVRMgP5L3G83jhv0tP10wu4QTJA3yRA58JyTC4NvYJ3O6udKSQjC9NrSnTCwwLpxoVanQnu37Yig8CvHztmdGnApZuE5hFzEiwoR1LLje2+kPlJ5eXOkZpQzggaidGoeQkAgZunVtMi4DFCjtk3YPVE3t//iXImExeT0ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cAXeosqkLxNX6f381Mo8KZv0BpD4Ng0/eHoFxPOmfs=;
 b=HVhxagCnsCGy+T6xNRWON3WFNYiSrft5eMYOqGVHPak47f1Uw+rv7/b6GwFZiol9PPmN0GuoawBMFj9e4sz2aIzqYqC/ZGIk2Rzht/WpNUG54LRReeQkVbKqBxf35e5IuIQCxEusZ8n3I6ZkaJqJgmErWZirYX8qi5YbF92CNPJLvfH5kJBG8KuXaSDSdrg2f57ucra/eMhVTplEBY81p7YPMGdXuGNrvbFnHThXttBAOaSMweuNlCO9+5lm6MFUOstk+uVaUlhIJoqlaI3BVCEvyhCgBkePab9laFIAbV+egR78T1+F+u+La3mF9JU1hpUNGNwXq/LnQfTRnxtqgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by DM3PPF1939049CF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f0b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 26 Aug
 2026 20:20:21 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 20:20:21 +0000
Date: Wed, 26 Aug 2026 16:20:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <sk.anirban@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/hwmon: Detect unavailable temperature sensors
Message-ID: <ao9KfzpqNkQHWq1P@intel.com>
References: <20260824184137.2164727-1-karthik.poosa@intel.com>
 <20260824184137.2164727-2-karthik.poosa@intel.com>
 <ao73w-lIBkSnYtot@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ao73w-lIBkSnYtot@black.igk.intel.com>
X-ClientProxiedBy: SJ0PR03CA0378.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::23) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|DM3PPF1939049CF:EE_
X-MS-Office365-Filtering-Correlation-Id: b8bc6110-425f-40d9-81c9-08df03af7409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|6133799003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: mMuYHO0i9zD1IzOuJvfflvnEAwaEEJ19bIVIIDquNO8CRWJ4bzbP4bEcTgojyvnBNBfD9qNNYE1RxXMrKGFKWtzMbE7GSVvh2h38Kb2BlFwN5Os/K7ZRgKA3lN7FGayYzG0FJ9C6jb6TVIuazr1rBhjz1GZeoGBOg7Rf2Cph6pRIRdl29YjebcS3oxcHSiPo1o5PECQbpDnwLfNlyvzrOWcY91ey5J/3UVlPD08UbTqoL64p2undtASXriOtwAvBe50+JcH3LueDBQ44c7HP3dpdkRfZu9qdus0p8VG0ZHQmIDlp8FYmr3ryUCtYbRKQJTZ/ISraqUvrhYomcr58/v8THnL4PLG9tVSTJsKGppY2m+vaqcbtXkrO82rEN4brtHUflJ6GqxYO+EMvJNtenDyY2qcN6+Wi40EnHnGPIqfnNBK2pSZVjvw4vZsOjTKFeyPjecIHh3w5DrH8LqwsmUMtgE5h4VArfHf9gzq6IHN8newx4D79dj5+GBjdkbL9nEvINpSrNTduxjsNxZJlBdO+PpACjTOWHXynCDQriywNw0mw0rMko4+mC0YrVUmPQHriAOTpGp/Z4K04PowULtj8Q0aFWQUaMrvRMNeiXEndCx0H58NuDo8vKhIymf7qK07orquKG6TBH0KS84KQsOjlOfzvNZhhqCiXOXyKE48=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7752.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dJpZSK/4EI0eolv4Q+hOQSSJBrZhtIU2Bv9q+lUTxenbUGwNUiFjKfvaYWyC?=
 =?us-ascii?Q?gIdqyN1P0muWDzmT4BiWQ+Bsrd2cqm9oEnk7kW6xKJ69R9ZHolq2cVbYc+Of?=
 =?us-ascii?Q?wVEcDGyYTSta7vivLgcmhZJgWUzztsSMZUakczzdm7nD4cI4ieqLIseRcxwR?=
 =?us-ascii?Q?mkTtGAQbtmd4vENEnqYoZS98oNYNCpx0VP7xXPfh8Bs+Pn3TC9VeItPU/VU7?=
 =?us-ascii?Q?RNNKroKibbhfZ5uzInNfPeNgm2Ex+oVUt0qgaD05y2/TgDe/5dXuu4VMVP3I?=
 =?us-ascii?Q?oKJDylEojg6K5Rte5L1PB/+cJ4xlmUZVU69SXyNxLWlpPCH4r0qPHLfeUlog?=
 =?us-ascii?Q?ktBoonF3Rf/jVa/ewmvlYRkUWLyt6CzPv28yKOw5kHPt6Mu8hayqz5needt1?=
 =?us-ascii?Q?tWWWEj0oJzIl7ID0HSti5IvTcQZOiu3V5OKA51Of/ygsoVLHYXtTZLQYV7oI?=
 =?us-ascii?Q?xtlg10Y2pu3ASHH1iTP07/UM0R5xAPAxUTKlS0WukCSf5wYpZLu+0nuC1u69?=
 =?us-ascii?Q?uHeQU61AigsEaYsS6TTNrnA/OK45cR2mWP90IRG1ec7sJaCIJsv0miFu2wEC?=
 =?us-ascii?Q?BXP2FypYui2PrX5IJfxA4EhLwybgceYwlkzuNYQFWo1Ex6XehU74c3fbvavd?=
 =?us-ascii?Q?r6sfzZNdiOI2/LlE4jOqGMSl++InFmBqqUB/c86JUIFXHwxEnJaslKxuhGrc?=
 =?us-ascii?Q?DWpLO0R4/O0BEMfqw2Nq6E/ZQaONbnRbUfjnXMBPCDSyydSVlghoTq5uO2gu?=
 =?us-ascii?Q?+SoHF5Qi+o7gWYmTST11HB70Fa8yPk4LC2ZMa6H5DuDXpfZhrzJntwwdArwU?=
 =?us-ascii?Q?wOfq3YPNOc4RSUfGz8SsKZAc6xF3nJLyvOmwYAQWUpMe4OpTtjDSrxK9VXXp?=
 =?us-ascii?Q?UzcxNWuEGxM7xhx13EG4d79UyCUYt0kCSF+1HaO/Mbt+lNthUJcFqf0q8rpZ?=
 =?us-ascii?Q?GwmTe1hJqguRmN0JY9pYcoKcaDh46XryzGWmS8dPZOOmaUIWGrLvIpSsA9Ej?=
 =?us-ascii?Q?0wTW6aIKvnuQjkwRuk4pjJamYg6z2xbQxYdN+Lvmke3ZA6oEy+knopa17XOA?=
 =?us-ascii?Q?at77DNsn5e0HRlqMx++4cypEvfxtkMZugFv7B2HSYNhZD84MG6CeNX1+dmIO?=
 =?us-ascii?Q?GPurGuxsxHSr6/yxap8UoNuOmyh3bIUGuaW52v1zQjHtb3OQbnp6504ziLzm?=
 =?us-ascii?Q?NmW8FbFRr4Eg1Zfx/cGHjPcJwfdaTLTCeKda6YPn9lCp2oe9l5Avrta5pzVX?=
 =?us-ascii?Q?3x1PX1Jz9SnPo9O/hwugaFcClo9aWILdGtvFrU7ojQUiVJnqkHwLinRmfFwg?=
 =?us-ascii?Q?66x0yEjC4OoRA2cXBHIW+0o3ZgD2forEo1MmdfLNC+gR0fSqzgVruq6u4aLY?=
 =?us-ascii?Q?67+TocJPTM6bBgFmeDHpr2zwSrd6Mz3i9ttL34dIfrb45j1LnZOM0HDNapnv?=
 =?us-ascii?Q?U6OgK2+D67vj9CvWWFzZoEDQXbSwGybYucvddNmIsRia+33O3kkGVFEg4OIY?=
 =?us-ascii?Q?3e45NPpHmQL9BoGbG/gpZvIzQUG7oLhAWsrGVXRFrpjfCGJEg3lI04SjJFFD?=
 =?us-ascii?Q?lH7t737Bxd3N/3dt1c1CNeBy2/tN6go53yzVVn0Gb7ZMehtvYKc4DGFJq4OI?=
 =?us-ascii?Q?EkzfnjfivGNmXc3ScnYBE4cd/FE927z3ATLH2xfG50BgL5hMth3++kqMal6q?=
 =?us-ascii?Q?DEsARSgfpELI43Ifncs7gwH2BvjHCCr/SF5YvR13cO6KU2bSXALm9yRLeqHP?=
 =?us-ascii?Q?WqlYVF0VHw=3D=3D?=
X-Exchange-RoutingPolicyChecked: MiYd5JyS5avJwsS2EgbzlvRmHqe3MRYNMg0XhU5yyiOhtLvbffJg05QgAXtrS8qUjHHcTZmxspRxDkQH3rn9fB+AKcBK/row4EnjT5HhRBRYnS/QtHZZ4zrPIGdXpv9/XHfxuGxtJ3Q8rW1hEE8dju9H11vvcscZMEKuH7X7yS+JbQywbJEez3PqlrKh7MrTjpDe2ODDi6DWDejCtY5FqOJ5XLhWzviTm86tJTjcdc2YxXE0hIFpH5oIKyqHfDa7iRjA+c+CGJ9wtNMxFtc4vtpwCPTgScOjGy7WFaYvqS+H+mfSwHq3toJ1tKSZeWwymkGp+oOPs1bHtMy1MOAt/Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: b8bc6110-425f-40d9-81c9-08df03af7409
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 20:20:21.4010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AN+3sQAcySmo9WkeHGWTZ0Dn+GknZFZJU5G0EqTe9spJfhwjjMkpN6Z3kZBNI6bg5W0/Wqxg4QY1qwdxnIpEgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1939049CF
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

On Wed, Aug 26, 2026 at 04:27:15PM +0200, Raag Jadav wrote:
> On Tue, Aug 25, 2026 at 12:11:31AM +0530, Karthik Poosa wrote:
> > Add is_temp_valid() to validate sensor presence.
> 
> Please utilize the full 75 character space where possible.
> 
> > A temperature reading of 0xFF on CRI platforms indicates that the
> > corresponding sensor is not present and should be treated as unavailable.
> > 
> > Use this check from xe_hwmon_temp_is_visible() callback so that attributes
> > for unavailable sensors are not exposed during hwmon device registration.
> > 
> > Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_hwmon.c | 79 +++++++++++++++++++++++++++++------
> >  1 file changed, 66 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> > index 5284cab6703d..2c4eba4b8f8f 100644
> > --- a/drivers/gpu/drm/xe/xe_hwmon.c
> > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> > @@ -813,12 +813,21 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
> >  	return ret;
> >  }
> >  
> > +static inline bool is_temp_valid(const struct xe_hwmon *hwmon, u8 value)
> > +{
> > +	/* Value of 0xFF indicates unavailable sensor for platforms from CRI. */
> > +	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND)
> 
> Let's not solve a problem that doesn't exist. This kind of checks create
> problem in internal repos where the expected platform isn't quite often
> the last one. If this is needed for multiple platforms, just add a feature
> flag.

Well, I know that sometimes I might be over optimistic about it, but
in general while working with platform enabling I always preferred to
assume that the next platform would be similar and work on the differences
and on the errors than have to hunt all the corner cases that were forgotten
because it was a static if == platform.

We even had a MISSED_CASE macro in i915 for the places that we had a risk
of being different but that would cause trouble later.

That said, I don't have a strong side in here, but it should be easier to
have something like.

> 
> > +		return value != U8_MAX;
> > +	else
> 
> Redundant else.

but on this I agree 100% :)

> 
> > +		return value != 0;
> > +}
> > +
> >  static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
> >  {
> >  	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> >  	u32 *dword = (u32 *)hwmon->temp.value;
> > +	int ret, i, count = 0;
> >  	s32 average = 0;
> > -	int ret, i;
> >  
> >  	for (i = 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
> >  		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
> > @@ -828,11 +837,25 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
> >  		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i, dword[i]);
> >  	}
> >  
> > -	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++)
> > -		average += hwmon->temp.value[i];
> > +	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++) {
> > +		if (is_temp_valid(hwmon, hwmon->temp.value[i])) {
> > +			average += hwmon->temp.value[i];
> > +			count++;
> > +		} else {
> > +			drm_dbg(&hwmon->xe->drm, "mc temp sensor %d not available, val 0x%x\n",
> > +				i, hwmon->temp.value[i]);
> > +		}
> 
> Rather,
> 
> 	if (!is_temp_valid())
> 		continue;
> 		
> 	average += ...
> 	
> Tidy? ;)
> 
> > +	}
> > +
> > +	if (!count) {
> > +		drm_warn(&hwmon->xe->drm, "no memory temp sensors available!\n");
> 
> This is a bit misleading as it is exposed as a single channel to the user.
> I'd rephrase this to something like "Memory temperature not available".
> 
> > +		return -ENXIO;
> > +	}
> > +
> > +	average /= count;
> 
> Blank line please!
> 
> > +	if (val)
> > +		*val = average * MILLIDEGREE_PER_DEGREE;
> >  
> > -	average /= (hwmon->temp.count - TEMP_INDEX_MCTRL - 1);
> > -	*val = average * MILLIDEGREE_PER_DEGREE;
> >  	return 0;
> >  }
> >  
> > @@ -852,7 +875,13 @@ static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
> >  		data = REG_FIELD_GET(PCIE_SENSOR_MASK, data);
> >  
> >  	data = REG_FIELD_GET(TEMP_MASK, data);
> > -	*val = (s8)data * MILLIDEGREE_PER_DEGREE;
> > +	if (!is_temp_valid(hwmon, data)) {
> > +		drm_warn(&hwmon->xe->drm, "pcie temp sensor not available, val 0x%x\n", data);
> 
> Same as above, "PCIe temperature not available".
> I'm also unsure why do we need to log the value?
> 
> > +		return -ENXIO;
> > +	}
> > +
> > +	if (val)
> > +		*val = (s8)data * MILLIDEGREE_PER_DEGREE;
> >  
> >  	return 0;
> >  }
> > @@ -956,11 +985,21 @@ static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
> >  	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> >  	int vram_id = channel - CHANNEL_VRAM_N;
> >  	struct xe_reg vram_reg;
> > +	u32 reg_val;
> > +	u8 temp;
> >  
> >  	vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
> > -	if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
> > +	if (!xe_reg_is_valid(vram_reg))
> >  		return false;
> >  
> > +	reg_val = xe_mmio_read32(mmio, vram_reg);
> > +	temp = REG_FIELD_GET(TEMP_MASK, reg_val);
> > +	if (!is_temp_valid(hwmon, temp)) {
> 
> Hm, see below[1].
> 
> > +		drm_dbg(&hwmon->xe->drm, "vram channel %d unavailable, val 0x%x\n", vram_id,
> > +			reg_val);
> > +		return false;
> > +	}
> > +
> >  	/* Create label only for available vram channel */
> >  	sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
> >  	return true;
> > @@ -977,8 +1016,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> >  		case CHANNEL_VRAM:
> >  			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
> >  		case CHANNEL_MCTRL:
> > +			return !get_mc_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
> >  		case CHANNEL_PCIE:
> > -			return hwmon->temp.count ? 0444 : 0;
> > +			return !get_pcie_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
> >  		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> >  			return (is_vram_ch_available(hwmon, channel) &&
> >  				hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN]) ? 0444 : 0;
> > @@ -992,8 +1032,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> >  		case CHANNEL_VRAM:
> >  			return hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT] ? 0444 : 0;
> >  		case CHANNEL_MCTRL:
> > +			return !get_mc_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
> >  		case CHANNEL_PCIE:
> > -			return hwmon->temp.count ? 0444 : 0;
> > +			return !get_pcie_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
> >  		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> >  			return (is_vram_ch_available(hwmon, channel) &&
> >  				hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT]) ? 0444 : 0;
> > @@ -1011,12 +1052,24 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> >  	case hwmon_temp_label:
> >  		switch (channel) {
> >  		case CHANNEL_PKG:
> > -		case CHANNEL_VRAM:
> > -			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
> > -								channel)) ? 0444 : 0;
> > +		case CHANNEL_VRAM: {
> > +			struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> > +			struct xe_reg reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
> > +			u32 reg_val;
> > +			u8 temp;
> > +
> > +			if (!xe_reg_is_valid(reg))
> > +				return 0;
> > +
> > +			reg_val = xe_mmio_read32(mmio, reg);
> > +			temp = REG_FIELD_GET(TEMP_MASK, reg_val);
> > +
> > +			return is_temp_valid(hwmon, temp) ? 0444 : 0;
> 
> [1] This looks like something similar to what's happening in
> is_vram_ch_available() and can be consolidated into something like
> is_vram_temp_valid().
> 
> Raag
> 
> > +		}
> >  		case CHANNEL_MCTRL:
> > +			return !get_mc_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
> >  		case CHANNEL_PCIE:
> > -			return hwmon->temp.count ? 0444 : 0;
> > +			return !get_pcie_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
> >  		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> >  			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
> >  		default:
> > -- 
> > 2.25.1
> > 
