Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63441C282DE
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 08:22:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E379110EB01;
	Fri,  7 Mar 2025 08:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gjuETn9U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF77E10EB02
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 08:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741335766; x=1772871766;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZJb3ysGzrX/T5qCh9l/INOFPh4bN2yuowvT+TUAyc3g=;
 b=gjuETn9U4wSzNkcaNqlXJQHlueiJW5FYpmJozZytZniRpCsDeWKWG7u7
 Ujxa/emonjl3Iedcfh4uglLRUUf2fAAskkr3Mqhx7VRTF7D+l0LrJvZs+
 oggOHB4V+OvcGrXRaXtRbQdmIc68FWeGpUt7r0kou+35xranp/cp9lZzi
 tW2bwQXtmLlP5F0nt+0JsK6JVvwdhTlAg0AMibKDo8FJIm/gBJidroSJz
 9Xbb5rYovx1KkUulOBOKD1TxQKgHvetCgDB23eNMN1eTqorWu+hDEez+S
 4vT8jLXYckuQ2W3xkAsC4q5L/sVnPMCysPsgkpRrZlRuegDT5MlIdqq0+ w==;
X-CSE-ConnectionGUID: mI/xYSfUR+af3bn2bMOX/g==
X-CSE-MsgGUID: zSlWCKItQ4WXjrtqRzsqIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53018113"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; d="scan'208";a="53018113"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 00:22:46 -0800
X-CSE-ConnectionGUID: Q1L1MxjDSPeEtsl8pmtvFA==
X-CSE-MsgGUID: 2WaURG97SjOC0leSCPilpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119783173"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 00:22:46 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 7 Mar 2025 00:22:45 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 00:22:45 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 00:22:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TF38xbr60IHLrSRRd63gbsAXgHNd7NjQxYSo2OdspUUqmw88wI1hoLFBMU4sCwwFW+IE3j4/eZ+EWnXC5b9/X/IoaEOewcqlS47BQwPVIEC2wwKalZSntp4eksoMHrbmR1x8Ilr8RRqwYOUdX3MBKypW3nEaRnd8mG1I+ImeZWa8vgkHGZuvJEisZNjay/t+ec9wtlRJ4G+4AVbiPqyYMwyyO6P9JPDVOpfdw6+3cYW+fyxdnO104lFd82IZppLOrsKkNo9rn3EdBkPAETQJnRDOvd1bQmW1tvxPCFcekaTjXE3udoyvY6I87FwW9yXBVsY0jSiTv36sL2d8I+z6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+BC5mHDDhTA+fWSVTf9UCscox1t31A40Fsaoh89eiQY=;
 b=Ufi0fLTPuVkVrDoNnc9oA4ZpgwsBBrX/qfV99IzRZiWfAKPsFfElK8KizJ6gEXGD8v36bSTcagsBI7r9SRQPlJy0St2/LBF1JWC9HDcbwP6/f/f7eoz9ixAmTODDeo5JJ/T6cbtXa8wf2MGapZFVuhn5Rl7TPDz8DtFohcCJJGWERhg7Wi0Hv7fuGngAce6P+P+XK6CTZLkI1SLrHCKHbYsAwmALORReYOhZr/nATE+8C1kecCUEPDVrLkdrFQmEApH2PxZZEwn8A3cPZz4Dj9X74v0YXWStMiwRdOs5ZnKjnchkTHPRFiItyD2F3gyn28ix0Abk5VVQ9dWBwveUzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SJ2PR11MB7648.namprd11.prod.outlook.com (2603:10b6:a03:4d3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Fri, 7 Mar
 2025 08:22:43 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 08:22:43 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Release gud ids before cancelling work
Thread-Topic: [PATCH] drm/xe: Release gud ids before cancelling work
Thread-Index: AQHbjphvr1CXU+LOHUiIH0ry4VJdhrNnL9OAgAAABHCAACSCgIAAAnag
Date: Fri, 7 Mar 2025 08:22:42 +0000
Message-ID: <SJ1PR11MB6204BF519B74182525EA87A981D52@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250306131211.975503-1-tejas.upadhyay@intel.com>
 <Z8qL9RW3DCzkS0q9@lstrano-desk.jf.intel.com>
 <SJ1PR11MB620426A08AFDAA4DC2DCAA0C81D52@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <7ca2dtmih4yi7sofvnsyhf5faio346cpmvycfcbydkg6oc3ds4@e34lsdylsjdi>
In-Reply-To: <7ca2dtmih4yi7sofvnsyhf5faio346cpmvycfcbydkg6oc3ds4@e34lsdylsjdi>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SJ2PR11MB7648:EE_
x-ms-office365-filtering-correlation-id: 2657a6e0-62d9-4eea-5115-08dd5d513b9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?PcBonyvYipsnDdRNbNUxEgyCggSyTlPgG4wOnLFMAl9oQNvOPY6mtR8/a9Q3?=
 =?us-ascii?Q?x7yaR2/FsG2K2occ0CfX2/4s2IjgkEo68Xo2sOYTqWPj5uffbGebxEB0HSv8?=
 =?us-ascii?Q?4XMKC0PGAYcVemptsm5Tb3KwCEZa6N0a/tB28p6/H7qzVDQ50/epuFCa2s+y?=
 =?us-ascii?Q?frs4t4TG1A7QcPP76O5Hp6jdDQq5EGmqmqD+2kWEBWk5nl5iGJudECcepWiQ?=
 =?us-ascii?Q?i7vFb0grBC8ISP3hc0W0Ryv5vq+alIk766o2KA9KIPW1afNZZa4iaRhK+57/?=
 =?us-ascii?Q?o5bl2AVn6Qmj4Kk4wpJWdjibH3oAnr9IQZVAY4CB69RjzApX5D9z8hTR3fgY?=
 =?us-ascii?Q?+G4BtenUioDc7ub96pPztFeNpgw8NPCFl+Zw8FsT+zTS6VW+IOVJV2yifcOg?=
 =?us-ascii?Q?qZInHFZJ+HcrWQ5N1m5HSBS4eh8o1VeTtzPrJZPqK9SkzhofrPa44xyLNSTV?=
 =?us-ascii?Q?qVwO/FB7JU3IqkbO76J6r2jwMWpL80dNEqRC68czHsEouXK7oPAUUpB+NShN?=
 =?us-ascii?Q?yYvmI/hJemwFwDAeotsIOTvOdW1VF2sS0qIgJmy+WpTX0kck7BibeOUcuPjn?=
 =?us-ascii?Q?msoRRNk9ZabIMUgQqHO52oE26cE2Y/h3dIizwKRKgJyJI7S+KV80edpWE9S4?=
 =?us-ascii?Q?GoDw0+M97o7jXb3Y57kN7IytPLmIZjSmS5Rqu/78hCyAg0CWnqt41WFrJ4IU?=
 =?us-ascii?Q?jJULVVaQ5sxiT6U/9YHqdvTbsZQMOkDQLaO1sCFRnOeWuvL45v/m4FmRYnKY?=
 =?us-ascii?Q?JT7fomlES9wWzHWo5ZaMruinhApns9X/IFvnadChRWTONiisXADK+n+4g3Ov?=
 =?us-ascii?Q?7+RULeth4Rz90MD8ndGBpQ1A/HHWsZgfTWvsaZ93WYzMwuvdZWWFiZVpDGEu?=
 =?us-ascii?Q?/quqPUkJAvTMOFaAFvws8aPEpvfH8+BesWOaMPaMdrHteJnyN7QMzFjDWJNJ?=
 =?us-ascii?Q?jp0V2lsaxouvmmPF+NDBu7U6llIRDDKIvLCaDCzhDQiPGompjGPQ39c4Hm4X?=
 =?us-ascii?Q?YlF1ND8koc0i338uzdfeytujPaVQ5Mazw97Iva0GnXxdo214BPKHHeRt/E6G?=
 =?us-ascii?Q?g0ST9T0EXBKt8Y32Y41ajEyG5EMiJq+h5zK5IPhahm6ec6FFxldAYkQsEh2q?=
 =?us-ascii?Q?h+uA8j0y7MfzoyIQzRpsvGgjsjOerW9tIKR9CDLaN4f4Y44l0bS/RHf3oxAc?=
 =?us-ascii?Q?6LDRTDeEUI+IwLvontP3l+K+bpOkkO8mMB3KTvvHmZmiNwctQR/3+JpPVLJF?=
 =?us-ascii?Q?S/uC1bYsnVO76asYmiQVZrrQhhO+Sv8waZLV+/0xc48HJ5k9rlhGH+buLLE2?=
 =?us-ascii?Q?I83AoSVUVS39P/12nMx57NhHTvfoJdOUH4t37wY4dsSf5nFSYv1pDe9E7Lbj?=
 =?us-ascii?Q?PDJHzFLfoaBNJ+pNjqj9NvO7FzA5X/FA1XMlbMw0Sj6F6pRowpxmdipkDNjq?=
 =?us-ascii?Q?nrzYJi9zG882ku7/iXciqWj5iJJ6zSAP?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iWHN9JnmiQUVpPNUH24stdsxkJdNEZVkMN2Ngqws81Jo+oH1PfyrMYMIsf2F?=
 =?us-ascii?Q?iWUTDQBlpXPAfU3sMZsmezBectJY9cy5SacTvqZ3I/idbT416FTbsR9fhSni?=
 =?us-ascii?Q?JsOS8j8zLEeRAv/zdEkrDjB5+p6s/m9KJze65PDVao3Spefp10mnGGjs5Dq2?=
 =?us-ascii?Q?VIU91wnLh42BQtrnVyJF5Ug0SaVb04HVYcTHU5ZpoXFxouUVUdFxMk9Td+Qr?=
 =?us-ascii?Q?bThEXJNMdNIkIjZMb0fDVfsYE1/bWW5aGVhbhpj6lD5J5ZWdSgjhh5XS3yIY?=
 =?us-ascii?Q?mZ8HhGC/QkmCO7RPaFGh171xSsVsmbttRgTCPkG69dP97QqS9wHdvlSmka1r?=
 =?us-ascii?Q?doru0Th7CtOLkNigFNb+0y5jhc3OJNvDPVcwOEqm7FYqPsKNl7S/psxDKxEb?=
 =?us-ascii?Q?r/JZl1cW4TARoEON0fpD8PhHvPv4C9kASIBo/ki0nqh1FUHDOdTE2wUZN64V?=
 =?us-ascii?Q?rPuMAq6TaVMt96Cgt/SmweEDwD7VXSCHfTYT34XVEBS3IckQ1ZsurcjeTPU4?=
 =?us-ascii?Q?V7/6A1zDXQnFFC51Ctd273VO/in+SEMGYRyQhQ5SH/aRxjgT0a5uZh2NPo28?=
 =?us-ascii?Q?06MmqaOrCgRAgRP0dLOfxon0JCqrSzVz84C0GJZRMyKifkaDfZwRhjqnxJ6F?=
 =?us-ascii?Q?ZMLkstUi0Dg5hZaTDYUw6rFeLHBSvajco1x5e1C7e05JF6uloB2B9GU9RM8M?=
 =?us-ascii?Q?607VLCqrEWQYN7UfdYTL5G//rgsgt9Trw9NnhVZnIEyBXQAlzcPFOeNsMh10?=
 =?us-ascii?Q?PcoY0d8ogAUeOz1/NaAazzfnpk0d8QoHMwcigXpudc1cDNpwtKF8vLQqH0ck?=
 =?us-ascii?Q?tl5PGblug9VU0BPM2jmdwpu9cFAwdHaJV+xm7DVgKbrkXIgVWcxBfaCJG0A5?=
 =?us-ascii?Q?naL89rmtWrJ5R3M79vGb685YXOi3HCMPOfAacyHI3ctKDXxmH7xehAA97Hxy?=
 =?us-ascii?Q?5QlfHxFf13btAKVWGOzzzef1g9dhh/JrPj0uuoNbPj5YQxzERwbNThV0l+zQ?=
 =?us-ascii?Q?oVdfLYdEv6jMjKbrCjSe2rY/+qpa7ubqOUp3ftBv9Y7m/P+SIfspaeR4aLZM?=
 =?us-ascii?Q?Wv6IzNN7wryxsgxrjuKZDXIk2V00K9WUkYhPRTUzpAxujYd9xy9pN6tOW6M7?=
 =?us-ascii?Q?TDiunvrbiuq8Q5bjongtRdF2tjc6dIePv1EMqTHE9h295gL4zsCvya3+h/ez?=
 =?us-ascii?Q?VFC9ah2hBUUUGQ5G78sXBqUZxHWSnwlyVOUf0emuf9mi5ctV+p3OlYFYnp9e?=
 =?us-ascii?Q?acEEQvOmCewxHQsYEO/o1qsWzZeJYqkYb6ttPhR1h27nBckFZ05J+KE/uLMX?=
 =?us-ascii?Q?a6NFWWVIJJsDeJVCMaJ7zW6VpMorYTLjKGu8yZRHRko2EG6CT1GVs6poXoVo?=
 =?us-ascii?Q?S/kgElCOKJ0Mbixqxho42zRnxDSezH8SucBJMPPsV/yd+le2F+XIrZlMMNRL?=
 =?us-ascii?Q?dzZ/eMA3uaIEZHhahImlyfUOApfgCSnAktDSvBjlvw9tOsq24QnCz4fgrq/4?=
 =?us-ascii?Q?pEMBxwGvEcnJlSwIwbLRBndQ0F+5f+62RL9hYwa99b9zVLir5D/75smBalEZ?=
 =?us-ascii?Q?PSdNgY2C70TzZPZRbzH9T6xLqsbrpivVXHZlpDKg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2657a6e0-62d9-4eea-5115-08dd5d513b9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 08:22:42.9977 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: snwRFXwUADzUgh96Dfxa1QBbg+76j0CQKYTz5NtMZKenCuTzU/cx22l9AEibU0VBdnE/0woS211eao/xuOIvXQpFO7eSqTDHdqnN3Ibd+Wg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7648
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



> -----Original Message-----
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Friday, March 7, 2025 1:43 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: Brost, Matthew <matthew.brost@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: Re: [PATCH] drm/xe: Release gud ids before cancelling work
>=20
> On Fri, Mar 07, 2025 at 06:03:53AM +0000, Upadhyay, Tejas wrote:
> >
> >
> >> -----Original Message-----
> >> From: Brost, Matthew <matthew.brost@intel.com>
> >> Sent: Friday, March 7, 2025 11:32 AM
> >> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> >> Cc: intel-xe@lists.freedesktop.org
> >> Subject: Re: [PATCH] drm/xe: Release gud ids before cancelling work
> >>
> >> On Thu, Mar 06, 2025 at 06:42:11PM +0530, Tejas Upadhyay wrote:
> >> > A GT resets can be occurring in parallel while cancelling work in
> >> > async call  which can requeue these workers.
> >> > to avoid that, lets first release guc ids and then cancel work so
> >> > they don't requeued.
> >> >
> >>
> >> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> >>
> >> > Fixes: 8ae8a2e8dd21 ("drm/xe: Long running job update")
> >> > Fixes: 18fbd567e75f ("drm/xe: cancel pending job timer before
> >> > freeing
> >> > scheduler")
> >> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >>
> >> Were you able to verify this fixes [1]?
> >
> >It is not reproduced with or without fix, Ran 1000s iterations of whole
> testsuit on BMG as well as on LNL manually through scripting. May be CI c=
an
> test it better.
>=20
> I fixed the typo in the subject (s/gud/guc/) and applied to drm-xe-next.

Thanks for correcting s/gud/guc/ and applying.

Tejas
>=20
> Thanks
> Lucas De Marchi
