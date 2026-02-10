Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3782EA3F18
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 22:06:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61D010E071;
	Tue, 10 Feb 2026 22:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mRCF+r3w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1318910E071
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 22:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770761215; x=1802297215;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YyWf6LIqdI0kmvv4tWpMbByMBwAZJInphXBgoeSeebM=;
 b=mRCF+r3wXSKuGxUQiFtNmOHnGLTEkRBSIuPYpmqGVwpGmd5nr397Jyoe
 u0vD25Qz7qLKsf6bOoRuBuEtebYj6C1fHYaNzppkP48YfMA8juq2t6HhT
 Xz2tpKlutd9kyNS/eG/JTQDs4sLXkLoWsAy79ducxr4IwGmqjofdLt7o2
 dlikVI6vG+847VvKuIjwpLpLWyLh3dp69s826s8+as7aDS09J73ogq9PI
 DjiGCLx07rhgEkNg+7T/NZHDKYHZZlkqB8oAwHkd/LL0Hp/mfBS45AtaS
 yQLmffxV3aG2CQaxNaCRHfn2f85makHtX4cSc+Af62ea9bLkKppMfr1WX w==;
X-CSE-ConnectionGUID: iAZ0sX6tQ+iaR9N8VskIog==
X-CSE-MsgGUID: /z0YXOFIREK7T52iB59cKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75750478"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="75750478"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 14:06:54 -0800
X-CSE-ConnectionGUID: VV15R8h4QK+Bo9EZ3HkhlQ==
X-CSE-MsgGUID: q18k9SO3S2+TySKhxfGrRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216214772"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 14:06:39 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 14:06:38 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 14:06:38 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 14:06:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwVQ5XFvOv5L3zv/quk/ta3O/NKL9tTlRdT4gDqw64PnBZ6nksUHmTuYfVNysSeHcWkZr9y+zAxqlCJDAFxoqfqvTaxiA3ZFtCxm2bAIRRGkKZbji60Vyfo7CpvdmUxC9fLK9zkxq4xjisvLs7Nebgnv+1zOOLo1pGtnGRzvYmtmmoxpCZQ2tWY+hA5DbAPeQvvyTvEzwpwzqsbEkNe6ovGP+OZgJMRt9i3bLashqCss7cxEZkm0CiKazdBtz8GYiwSWT1tt+JWrNobhY4q0Jv/mTDVqPZy5q6v9x6PWCP6YTT5EOdlm7HCJYlajIHos1zX+YF/LPJn0pyCDkzC4iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpspFaOtImtqq1Ce81LJ1GbS/5ZNawiPCK1R+djjEbQ=;
 b=i5cFEUhKT7dJ6inV/ZJXsPiGKPL+VKPCWxmrHTyBaOCumY8mzQ202XqmjlSh7AgcJ5VjE4zNOLRjng0gv6yg3XI9XlYuhCxlWxgsLennTRzt35nxjvS6Lv/gGA4GamJYlDNAK/0BEyqlcBWE6c9jDXNLSU6XyKAtq9eSufSVkbyjn//z9wwU7yePCdCKVd746i5SV4Jw1D/MdGqCdvQPLsBxF/sLCi7DWUEWKiWHCgk1pExkdT+TVCz8mT9dW0UmOaKe0rQHArRohlLHMaCPO5T4Gk5cXmkaUitZYk4P3Fac0iyJhwMktBR4LXOrWEhtEPAmEelCs4DQZVSNfnVY7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6168.namprd11.prod.outlook.com (2603:10b6:8:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 22:06:36 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 22:06:36 +0000
Date: Tue, 10 Feb 2026 14:06:33 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/6] drm/xe/rtp: Drop rule matching cases from
 rtp_to_sr_cases and rtp_cases
Message-ID: <20260210220633.GF4694@mdroper-desk1.amr.corp.intel.com>
References: <20260114-rtp-rule-parser-v1-0-fa9029586bff@intel.com>
 <20260114-rtp-rule-parser-v1-2-fa9029586bff@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260114-rtp-rule-parser-v1-2-fa9029586bff@intel.com>
X-ClientProxiedBy: SJ0PR03CA0196.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: 82c874b9-7133-4bd9-8533-08de68f0a850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MMh7m4MjnQ6C3PqR5sUXtzPZoHsf8JlLePVKRjSqX6Z/px/RLSP0JdCJBhec?=
 =?us-ascii?Q?VkQi+o2licW6qP9xvij6cCfvw2cIrzakfKYfvDOATNiZkplIKCVXRuw2xS/S?=
 =?us-ascii?Q?4FT9pY0yUtnS5xJHsgFvYIinI2dfhblw9CcJ+Nh/+GzA3LjGIXsll/ujesBl?=
 =?us-ascii?Q?GsDfpeYhadGxeyDUiLlr3yGTk2t4Cvi/FlLFsobBp67Vlu9y3pN5cSoFqhpy?=
 =?us-ascii?Q?ZUYkSlfQ/9mPlFmLG43KH0wE/RuQee3W7OHgaEoxkQENCSM3e5G5bR7UlSpB?=
 =?us-ascii?Q?wmmu1SI9+d8UpjrsmssodrhlFkxC6q2pcYtW+PTBjlonHjhwsKcba0/Mr+qP?=
 =?us-ascii?Q?MEtKKRevXkizW8uHJpfAgNuAtihwBsF/ZgnTGh1i+0dMURzA+Qcxbfm+4XCt?=
 =?us-ascii?Q?yUZR9q9A+sTuDdbqNQKWhKI5C8gHRjIs/y0A/Cs7kUsEO3r7bCcnu553/uHE?=
 =?us-ascii?Q?jS4OqLM0p/rnckdRPSSj9k9/c9j5aRLCUnSdkxuQhKRMQ8RE6LcK9XG2WGAs?=
 =?us-ascii?Q?H/3kn3lV3fpC3JE6yxcHJy+sk5fpQ+SiVWzG4PGDXg6lfly6+2PL58HTJiJt?=
 =?us-ascii?Q?Qlygd6HII8IlTHmx/m994m7DBcQpzoIpgycmuh4jWhr3SeWbge9agXvL0MBo?=
 =?us-ascii?Q?dWEKz5nXQxLe5ThF9amKWjeiP02PEaiHC8pvq6JYw4h6VuNrr2JlJEouSKY7?=
 =?us-ascii?Q?ADeWIW+m/MIVYEXoGnJYUERjgYqV4LyIp52KgDLP6DfYgAOySZSA2Hqlp3Ue?=
 =?us-ascii?Q?IVmAD2Uc28SFLARjjGQHUS/dz0S4iXzRiOr2QXPto02STbOxINE6sKivmqnT?=
 =?us-ascii?Q?oVdacviPPjTZ4+etEdkcCAQ591TpXeWq0JniKqwuWBTYSZNjKJBPWLL37rrF?=
 =?us-ascii?Q?vJe49N0nT+j6MgIsp5J2WRFsPJD96nll86h1NAUeKhy4JAA8Dh3/3xP/64IB?=
 =?us-ascii?Q?2i9j9a7Btdui6kucbQs2gLXbLAMnmkmhi7NPky+4BFmAjSaJoViV+0GyPlVw?=
 =?us-ascii?Q?f2h0/byISxetvapr56Nid9uvThCeF87sPzHAlBCEanUEuqoN5pa1US4oaf9S?=
 =?us-ascii?Q?p6t3XUdTEWHokD441hzzQG1TJI/FHcLr7vqDaweIBbOjVCz7qF6wwNp+szpA?=
 =?us-ascii?Q?2MIG/zl08FzN/a1lgBcx/ydKRNcg440qUpEkKBDi1pHZFpGla9bDYcFGEH7H?=
 =?us-ascii?Q?EHQyrN7pe7kf9R89KNOCk+98LPHSLqEy/PMPnXdMUwfy6/pqfCOPyV2dMqjs?=
 =?us-ascii?Q?1qA+w7YxjYgWNgBXYPpxxGMFTK3ehVO8YIeP08c7h+CZwA7XgcHdJ2RaG3zm?=
 =?us-ascii?Q?KbG8GC8IW8hpjwxdOne+cEUKh0Ats7GtI0/HFQhpmue4ws1RJYezsnEwBrak?=
 =?us-ascii?Q?vlcFPJeOzltgjFpmgQEGZ8VgpU/w5SOjJYzo6fMgtCVxAEOn9Rl2lv+UpRRJ?=
 =?us-ascii?Q?MWOZhy/hjcRRbD/LZEbHEYWvJarAqrU6HWSIh8/iln8A/dsII7WNo9VGnX5u?=
 =?us-ascii?Q?u8utAfVvXQHhDc1/cYH3/lmW8hKhh9ZI0q8yqGo3faublzCpgTRZiHsdtyA8?=
 =?us-ascii?Q?3T2ab6yMqBt5MfOc0yA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sQiiYqNYG0AWhSMIIrIk58wcbVZ+cCMjsQURPVWNk2Ik2RbGdliQu7x1pm7Q?=
 =?us-ascii?Q?OW7+kWG1w7+2JeZAydDk4yJs0nM1zjZktwLhdBlzAmOM9gXiAvdzwqEmvPqO?=
 =?us-ascii?Q?wzdo/lIxLwW55XrpJmb9P5QyEOEUtDOWz7is2GHZTqvnTjscJwf+iii/2hw6?=
 =?us-ascii?Q?D2f7ESdnw97vPwdjbhyIwUuFW4uzVIi5UUmgbLa2z8dSK5RNcxgFH9JM1/es?=
 =?us-ascii?Q?xYdB7fDKcRg1ChoTdRk7D2V92pp2jXDgviAQQ2yoqThNWtRShxASk1dTnXL7?=
 =?us-ascii?Q?tu1lrX7g5Ii1JYEQBoEbdZgpbKTO/RsRD2ZOxcZeEgsVEWWLjSWJ2o/O/Esj?=
 =?us-ascii?Q?199WDW3rD79COq1oQe+sro5WywuEGmIdBMSDSmMtAFrxDPi00acJdjViIe/r?=
 =?us-ascii?Q?GbkqFCMLG9p2OR6VD5ajav0F633QjSEdzbMEywez0DVC4CpWpoTrF4nF5YyI?=
 =?us-ascii?Q?mD2CSl56XUhRzhn4a5jAQo0qtq2GESUh0wA/hjXW9jfKYvj63n00jzg0WxYY?=
 =?us-ascii?Q?Bg/gJLxdo8II+BR2uDmyD4zgr1fMrv7ANfQwBykQXPGrvKvNoTe0a4FVs1wR?=
 =?us-ascii?Q?q8Zv7gXtqdJQSn7oFi0y/JYAnHq9y+x6gzpnderG5c5u3b9qg24AOPAV49+V?=
 =?us-ascii?Q?J4U05958nwPi4XbI8JILT+ajVvV9MBSm9onWlOADj5lJh4kr8JqegC+MiHcc?=
 =?us-ascii?Q?J9ZV4itCVvhep5yeIwaFVPK/bNWSPgmgJV4AbjVeGCDI3QjMcSYU0+q7V07U?=
 =?us-ascii?Q?6DDNYWiYxWWNROVpgGZpYvbSqE0faxEJaMtbWwmn2RUggWbJoNr1zVG4nIEn?=
 =?us-ascii?Q?2bZD2/owERInERaKQzkSiOf5xnHsbit+jklm5ImX9vwLMwgxKL6AQPeaOp84?=
 =?us-ascii?Q?Or0xxq99ooNuDj66qM3cD9tU6BHoJLqamwTIxp2HTetvHKp4jhU9GDwXNJu/?=
 =?us-ascii?Q?pf4T3Ei7n5IFpcWhksKolbrwGQ5MdBd/ABJvdZ7MIzuHuckri4GBwg7DfTXh?=
 =?us-ascii?Q?CbMlR97X9IcDO5wB5MMt1wSTC671KukNUu7drJnagK4fPu8bOqZzVRirweT9?=
 =?us-ascii?Q?MOvMRFlnna2PeKz9v2p44n9qnLCAp1tMf/PRZic5bagZRxDArQlWiRC5HXRX?=
 =?us-ascii?Q?r1nxC8VVF3+9AqDT8FDrDi3o1+LXGIVPm2DCR/U0wi+ZcYNOVNs90HMy2UmZ?=
 =?us-ascii?Q?i5SuYxkGVUEXktv61LavgxJ3mNYt/81TEBwsVMMG+GiyULSmnN6HK+XHonYL?=
 =?us-ascii?Q?3/SWlx9481Fgnh4rvlFtxxY3icH97Cd8b5jC60bUwIdOtYMIAoehRRYX9Oxb?=
 =?us-ascii?Q?mpZxO9asbVJ6UkxqmqqUNrVfzeJuiyqEi3TVtMHTSVyPx520xFY5UTBF0g4O?=
 =?us-ascii?Q?X+Fi+8NQ95pyQ7TKjmNzbQJVdRmZW2x74bzjnxAg66UuHCVHsyQpNj2mm3we?=
 =?us-ascii?Q?QgAesRKwgWtVhbcHxjNx+NIrsUfJO9RLvar8LC12J28rh+napNw8Sf8w03Gg?=
 =?us-ascii?Q?joR4gdMRXIGwTIfHav4AIHerjGdYteYXy680gHyDJsjok3HlmoWxNvWsJTYC?=
 =?us-ascii?Q?kJUgfBS5i+cJLSPKXTf1+0SqrCyJXfaExtuGBayFbops5Zc6oEVoesh6I28h?=
 =?us-ascii?Q?zzRjVHbEo85UzFhcF7xaPRLdjO8klzsNgqx5/Os369iT5X4X3yyLkvMkdqIS?=
 =?us-ascii?Q?cNt9ZTNEB3c2zt9PJInOf9Gi/rDF39JxzTiznxmyf0IZQqlPputWhn+EhFVj?=
 =?us-ascii?Q?udIc8JZmIh8LuBawQF3t8wqXjRElyzo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c874b9-7133-4bd9-8533-08de68f0a850
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 22:06:36.0189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEVho6ptGT8xA79pVrah0UHdZH6CHZfGQcJq0Tq8S2UpRIhYVgHKpvsi/JEDM1vqVGGq8EhCpISgRDDYTqsyZHUaIPMyDDHYnkEUOMh3Kig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6168
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

On Wed, Jan 14, 2026 at 07:49:52PM -0300, Gustavo Sousa wrote:
> The kunit test cases for the RTP framework are currently separated into
> three groups:
> 
> (1) rtp_rules_cases:
>     Those to verify rule matching logic.
> 
> (2) rtp_to_sr_cases:
>     Those to verify generation of save/restore tables from RTP tables.
> 
> (3) rtp_cases
>     Those to verify processing of RTP tables without save/restore action
>     associated, which are used for OOB workarounds.
> 
> Today we have some cases in (2) and (3) that are actually meant to
> verify rule matching logic.  Now that we have (1), let's cleanup (2)
> and (3) so that they become focused on their main objectives.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c | 122 ++-------------------------------
>  1 file changed, 6 insertions(+), 116 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> index c3fea547da32..b2286dd9d92a 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> @@ -234,80 +234,6 @@ static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
>  			{}
>  		},
>  	},
> -	{
> -		.name = "match-or",
> -		.expected_reg = REGULAR_REG1,
> -		.expected_set_bits = REG_BIT(0) | REG_BIT(1) | REG_BIT(2),
> -		.expected_clr_bits = REG_BIT(0) | REG_BIT(1) | REG_BIT(2),
> -		.expected_active = BIT(0) | BIT(1) | BIT(2),
> -		.expected_count_sr_entries = 1,
> -		.entries = (const struct xe_rtp_entry_sr[]) {
> -			{ XE_RTP_NAME("first"),
> -			  XE_RTP_RULES(FUNC(match_yes), OR, FUNC(match_no)),
> -			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
> -			},
> -			{ XE_RTP_NAME("middle"),
> -			  XE_RTP_RULES(FUNC(match_no), FUNC(match_no), OR,
> -				       FUNC(match_yes), OR,
> -				       FUNC(match_no)),
> -			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1)))
> -			},
> -			{ XE_RTP_NAME("last"),
> -			  XE_RTP_RULES(FUNC(match_no), OR, FUNC(match_yes)),
> -			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(2)))
> -			},
> -			{ XE_RTP_NAME("no-match"),
> -			  XE_RTP_RULES(FUNC(match_no), OR, FUNC(match_no)),
> -			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(3)))
> -			},
> -			{}
> -		},
> -	},
> -	{
> -		.name = "match-or-xfail",
> -		.expected_reg = REGULAR_REG1,
> -		.expected_count_sr_entries = 0,
> -		.entries = (const struct xe_rtp_entry_sr[]) {
> -			{ XE_RTP_NAME("leading-or"),
> -			  XE_RTP_RULES(OR, FUNC(match_yes)),
> -			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
> -			},
> -			{ XE_RTP_NAME("trailing-or"),
> -			  /*
> -			   * First condition is match_no, otherwise the failure
> -			   * wouldn't really trigger as RTP stops processing as
> -			   * soon as it has a matching set of rules
> -			   */
> -			  XE_RTP_RULES(FUNC(match_no), OR),
> -			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1)))
> -			},
> -			{ XE_RTP_NAME("no-or-or-yes"),
> -			  XE_RTP_RULES(FUNC(match_no), OR, OR, FUNC(match_yes)),
> -			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(2)))
> -			},
> -			{}
> -		},
> -	},
> -	{
> -		.name = "no-match-no-add-multiple-rules",
> -		.expected_reg = REGULAR_REG1,
> -		.expected_set_bits = REG_BIT(0),
> -		.expected_clr_bits = REG_BIT(0),
> -		.expected_active = BIT(0),
> -		.expected_count_sr_entries = 1,
> -		/* Don't coalesce second entry due to one of the rules */
> -		.entries = (const struct xe_rtp_entry_sr[]) {
> -			{ XE_RTP_NAME("basic-1"),
> -			  XE_RTP_RULES(FUNC(match_yes)),
> -			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
> -			},
> -			{ XE_RTP_NAME("basic-2"),
> -			  XE_RTP_RULES(FUNC(match_yes), FUNC(match_no)),
> -			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1)))
> -			},
> -			{}
> -		},
> -	},
>  	{
>  		.name = "two-regs-two-entries",
>  		.expected_reg = REGULAR_REG1,
> @@ -535,33 +461,15 @@ static const struct rtp_test_case rtp_cases[] = {
>  		},
>  	},
>  	{
> -		.name = "inactive-1st_or_active-inactive",
> +		.name = "inactive-active-inactive",
>  		.expected_active = BIT(1),
>  		.entries = (const struct xe_rtp_entry[]) {
>  			{ XE_RTP_NAME("r1"),
>  			  XE_RTP_RULES(FUNC(match_no)),
>  			},
> -			{ XE_RTP_NAME("r2_or_conditions"),
> -			  XE_RTP_RULES(FUNC(match_yes), OR,
> -				       FUNC(match_no), OR,
> -				       FUNC(match_no)) },
> -			{ XE_RTP_NAME("r3"),
> -			  XE_RTP_RULES(FUNC(match_no)),
> -			},
> -			{}
> -		},
> -	},
> -	{
> -		.name = "inactive-2nd_or_active-inactive",
> -		.expected_active = BIT(1),
> -		.entries = (const struct xe_rtp_entry[]) {
> -			{ XE_RTP_NAME("r1"),
> -			  XE_RTP_RULES(FUNC(match_no)),
> +			{ XE_RTP_NAME("r2"),
> +			  XE_RTP_RULES(FUNC(match_yes)),
>  			},
> -			{ XE_RTP_NAME("r2_or_conditions"),
> -			  XE_RTP_RULES(FUNC(match_no), OR,
> -				       FUNC(match_yes), OR,
> -				       FUNC(match_no)) },
>  			{ XE_RTP_NAME("r3"),
>  			  XE_RTP_RULES(FUNC(match_no)),
>  			},
> @@ -569,33 +477,15 @@ static const struct rtp_test_case rtp_cases[] = {
>  		},
>  	},
>  	{
> -		.name = "inactive-last_or_active-inactive",
> -		.expected_active = BIT(1),
> +		.name = "inactive-inactive-inactive",
> +		.expected_active = 0,
>  		.entries = (const struct xe_rtp_entry[]) {
>  			{ XE_RTP_NAME("r1"),
>  			  XE_RTP_RULES(FUNC(match_no)),
>  			},
> -			{ XE_RTP_NAME("r2_or_conditions"),
> -			  XE_RTP_RULES(FUNC(match_no), OR,
> -				       FUNC(match_no), OR,
> -				       FUNC(match_yes)) },
> -			{ XE_RTP_NAME("r3"),
> -			  XE_RTP_RULES(FUNC(match_no)),
> -			},
> -			{}
> -		},
> -	},
> -	{
> -		.name = "inactive-no_or_active-inactive",
> -		.expected_active = 0,
> -		.entries = (const struct xe_rtp_entry[]) {
> -			{ XE_RTP_NAME("r1"),
> +			{ XE_RTP_NAME("r2"),
>  			  XE_RTP_RULES(FUNC(match_no)),
>  			},
> -			{ XE_RTP_NAME("r2_or_conditions"),
> -			  XE_RTP_RULES(FUNC(match_no), OR,
> -				       FUNC(match_no), OR,
> -				       FUNC(match_no)) },
>  			{ XE_RTP_NAME("r3"),
>  			  XE_RTP_RULES(FUNC(match_no)),
>  			},
> 
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
