Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD0FCEFC39
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 18:06:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F3D10E1BA;
	Tue,  8 Oct 2024 18:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jfUzBgix";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C9B10E1BA
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 18:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728410777; x=1759946777;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CzFkl25xDnFCQnd+IlWzg0hWD5wZQmO7jrSfKaR0UTk=;
 b=jfUzBgixU2UJz0a2pQic4nJTngTtqE0hSuCOjEqH3LKro52xRZrzF/U7
 A4Nq6cOgviiwrdppgi/4AbuIchY7BAdDHztNZ7Gyn/3gVRu6HcDiVZpbz
 ObY50kY5sqmOh15vaIzsFWYGOG481l2Yph1YAytI4m25EHtGTLOEivIxs
 +N1KwqN9F353A0Y7/BOEo/iLxbmWQI8eNn4stcvHC3Z3cbQtcEP37f0P1
 SnEAuODM58whmAjGDjlSPgpmNJoLIEPIdzOpR2fF/aJKrr23s04KbOMWO
 PRHgSUghQyyPkrTa3lBwyAxC8jeF0cohqzgnxX1mWlNxdNeKTCJ2h59rS w==;
X-CSE-ConnectionGUID: 2QDJ5VHcSeKCMpiQrkEJwQ==
X-CSE-MsgGUID: 4keCYj99SfSpC8/AlT2Ekw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27523975"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="27523975"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 11:06:16 -0700
X-CSE-ConnectionGUID: +Ygs0DvSSJ6vsler+/X9Gg==
X-CSE-MsgGUID: +4qvOTo9QReYDukzmJ5fqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="80522039"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 11:06:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 11:06:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 11:06:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 11:06:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJm2LvBlsBnSlKIbVcFChsft1mfupOwlxs1iIW/0z/CRu4IGR835V5BEqarPOov8e7ji5uwJYQZiAbmOT2uiEzVgVolQHjCccO/hzDnZShekphTL6OimNf9kOdIWHesjSqz+WXxWitSXpotg6vxZ0IMu2yVpTGWod8l7V/D+3lNO+grf1Z39sUJ9zSNFzAdDt+f6vr0qMIphNTTpPAM54owYYBwEN8waWsyIlxrN5JHmh4Vb3jbpR8dE7McS1hzPCTF9CZVEuzN7TyDFXgHY8L7Q93eoakZ+y///zP+5fQjxmpP8Ss1dSAEUzNDanlBpQ32/ZI6Y9uDWVQioCurJfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59N5kw4tCYqQL+s5ldZm4aqEwFmSJm6lSWd2HEaWEKQ=;
 b=mB1gM+f17AvJVBf3GbtJ93M2EMcyhkzLRXIe79RqQYDYzEgmgmHwAX7IRRDiQ/X7xZ+UOC7pmTtT52T/N51RHN7xtFASWQANOcY9hTv7SlffgWT85GJ0IMQT2YnHUGny0rkZYZQKxYrL4hddIDFh0KRIq4iAl5J05y42wTD/CLSk+3IxdekCzuUnMZXMr+X2J7As/iC8nPx+4esL2ejGk4ZyW5gEKsuL/n6epU+Gvd8He85shyat2WyaQgY3d9NZfCCinO3EMoUSi08gfo7xgxlESW4ChQUnv6Ee7rwBgoGlypyCFo7MP4TcUo6psqxobOFmTetAJnFhnknE/eDXzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB6811.namprd11.prod.outlook.com (2603:10b6:303:208::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 18:06:12 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 18:06:12 +0000
Date: Tue, 8 Oct 2024 11:06:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
CC: Matt Atwood <matthew.s.atwood@intel.com>,
 <intel-xe@lists.freedesktop.org>, Haridhar Kalvala
 <haridhar.kalvala@intel.com>
Subject: Re: [PATCH 2/6] drm/xe/xe3: Define Xe3 feature flags
Message-ID: <20241008180609.GT5725@mdroper-desk1.amr.corp.intel.com>
References: <20241008013509.61233-1-matthew.s.atwood@intel.com>
 <20241008013509.61233-3-matthew.s.atwood@intel.com>
 <7a77f979-5743-4626-8307-d5bbe5d3450b@intel.com>
 <20241008161512.GG4891@mdroper-desk1.amr.corp.intel.com>
 <d03ace74-4158-4881-b5f0-8efdf4d7029d@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d03ace74-4158-4881-b5f0-8efdf4d7029d@intel.com>
X-ClientProxiedBy: BYAPR04CA0033.namprd04.prod.outlook.com
 (2603:10b6:a03:40::46) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB6811:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c0706d3-36c4-4206-818f-08dce7c3e491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rUzQ3yHLtzPeGG2KXgag3XKafIPLciCud7JW0mxO58Gl9hHV/Rwp5uWcXHaL?=
 =?us-ascii?Q?/rwhmxbqS/WySmPcgAGzCjFn4JFw5ikpZ0DSAt0U/Qr5vxYwftArPEBiaDBd?=
 =?us-ascii?Q?Hqm/GsLsDgIhspN1P4SzmjJNR4aNIMJS/UyAKFxTYYsLYuTp1M3FKyMZylfG?=
 =?us-ascii?Q?8C2hJndQqUMr58gD0T2GA/fRrY4D729XUyQrQL6ajtVHtyP+FO5pZJCmJAZ3?=
 =?us-ascii?Q?QZLGD90Z8P55BmTNAG21yum5mE0LdiXnyEguewTMFAVkRY6ZfRh92g+LgLKz?=
 =?us-ascii?Q?LjkYZ2oPrSPE7cPLgcZs1fbDPdMOYVW2+ohF2CWqR1Bx8CUMP+gRhdK2ljRN?=
 =?us-ascii?Q?lZUOzoR29DD1ZB+8Sk3b6VWLaDYkCcHkV9qOop76aFsFu08Lzg8vNfegKpcz?=
 =?us-ascii?Q?S3vTsyZ4VWHQITP60dKoyapHU2imNPMiDCZ4bc4qQxD6f7DA5FMa0OyCrj9+?=
 =?us-ascii?Q?FyKm7F0v1zJTwMTheONanZUGnpspXUj1sUnB58DqqCupg2piFrLgbEb4X9Pp?=
 =?us-ascii?Q?73G8VyI1ggdhVmNp9te6FU00K/sAMyDQ+6FX6Y2FJehfET2An6CFz43Bo7C9?=
 =?us-ascii?Q?7pjLmw2vE5WkqFSJVkSfRnYRA1eVe+jWkdwHrooHnRHj/wJ9MJ7ItH7iQ4pQ?=
 =?us-ascii?Q?913DPabBA1apc0vZ9id9qRcxSduUrTL7xMWPPHe0zwgYyTEirtFjgXrH6r0z?=
 =?us-ascii?Q?aDAF4V/yomYvmhFfYsjVUicQC6T2ZkVjA6okZ0gpgrut3srTmX8BCJQPyV4P?=
 =?us-ascii?Q?N+4WgAt6eaz58fxK6cwpMX6HiI4AMAsDjFcKt4rftgOKMrFwOW0JTUJJldad?=
 =?us-ascii?Q?t4bolbwmZ15Yllzedf5D4u40OwAqM+FEm3sxMiYA2xY0C96uYTAcR7WRJGS7?=
 =?us-ascii?Q?cIYF3fkXykN5ZQj9eru0sLxB7y7HDsYFFsTZoikU8MHCTdY/Gg4F5xn1qVpA?=
 =?us-ascii?Q?0y7tNyABODoi9fx0R2tcAohrn4ugyBG4tjYO4P1cm0HfRlfhC525IpjOVNkz?=
 =?us-ascii?Q?/MYkyf21H2nXuuJjlMGMLRYOvdsTjK0v/XdmlhWkpUfxFHhB1jpMTsj9LAK5?=
 =?us-ascii?Q?HbCpQrDlG3zDITag7sAx+zt9NQ+UANnaZUfGcafoKhubxorxuIb3VJSNHpCw?=
 =?us-ascii?Q?YyAeJOqm8T7dalfRzWNCa7ynuPlBve2i24ggfqPwo6Q4jnRZOCT24nkBmqE3?=
 =?us-ascii?Q?J3KEkQqhosZlz0N5X48daSRIoW+vqj0LmvTSrWwD+pK8+5+yAmM2NnTW2aDv?=
 =?us-ascii?Q?aqzJDILqNU2uVrebf8Jb8o6ArlmwvSd6ubBgY8TfhQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6HsdlIdrO5Qaue0GwAE2SbqNWcgkbQdhr6Ths7WBUqgAjaDiCtR8712P3wJG?=
 =?us-ascii?Q?nk3knBDyBf5Eyx/q0uP7OrCQwF7W6wb4M5n62Iv3pG2n0FEczQad0juzyVPL?=
 =?us-ascii?Q?FPyruI4QYJorfPAbUSG44YNxTUqQ4GlvzP0lUv2XAnYg0KloDG61/590ezlk?=
 =?us-ascii?Q?x7GISa9IUjmRlNC6Qt7WcLYlCBxwzHoAN+5X+1x172fWGPxbLOzrlxL6v0qB?=
 =?us-ascii?Q?Off161gy7ZoZcYpJwXVW/Afv4G+DLFHDMHMign6pPjcWY/t3N6tT/oCRZ8sw?=
 =?us-ascii?Q?IH+ERhuNtQp4G2aG4rv3BHSiIsamOzdIl5fcnVGIqlm48po/Ap7orEcsx231?=
 =?us-ascii?Q?xp9W5kwAn2pBuctXSTwQ80kWyVmQh+E804OFBvFbdvduj106F0G+dG0rBaSo?=
 =?us-ascii?Q?JCuFZ7cgdhvrqR9fS1UtmK45EDrfSMDswgLjXbAtAEQ7R0e69PLLaUVQZAYE?=
 =?us-ascii?Q?EJxjSyNWBTFo6tBuVReGBPyX1Uvt4qB7AxFmuJr2yb8K15UNxq0y02V1MEbO?=
 =?us-ascii?Q?7mpIDtz9nQN4mTo93bAbqRO/CFAjcJugrdR4/6dmx/LJb2HMV/pTstKyi1eK?=
 =?us-ascii?Q?gymsmEljlgg5hdaE4oc06oABWNc1UF8k5cULIvuysdk+K0qBogf5PNahJwxG?=
 =?us-ascii?Q?nHm2tUiJlVMj58RkYtpXXQjv5TWmhdKgQVvaSSvT4R6eK/lr0l0Ww0bbJ9/n?=
 =?us-ascii?Q?TI2C4LpEIRcAowAeeodKGNA+VGenb9jSDkyz+gMLDgd+msPW8nRkw0cA8tFQ?=
 =?us-ascii?Q?yPZaaPL/byzCZcBGv6SRK8CCEqFdBwSS18FbkNabcehnpl537pk+SxD9lNgH?=
 =?us-ascii?Q?XpefWo7tY1Iujuj3Razbe18GPYyA7G+r0eDkHw7kdWZWObjfBqCM6giY/nrc?=
 =?us-ascii?Q?yNddZtUAjK9lIy6d/bqD6pQa978sPQiskpI7p2dVgoFGJlYPU+oU5ADJY4jU?=
 =?us-ascii?Q?39LLBUnKutlaG/OF6RefOXR6CIqK6Lbiz5EmybD1lDTKLqn3PhFqvAqN0l83?=
 =?us-ascii?Q?lL0v1UNoGmODUKhgWFX9BFXM8wRsgbHAVG398mgMjsuN21RFszoqQoM2L1XT?=
 =?us-ascii?Q?scFh15BwSW17GeMTETonkS1FYT8sX3UQVcowViRqMKU9N8kZK5EAYhMbwTZP?=
 =?us-ascii?Q?IuOmLPCDTh7sw6SFP9HgFioSps88XIuroJi+gd9kE8JsN2GDYH1YRbiQXvl1?=
 =?us-ascii?Q?WMSsUE3TUqp2jMsrJd+kJcFMPBZK7AQwQ9kIaah5zMzq2b2YlITJMe1r3uDa?=
 =?us-ascii?Q?4EERlBNsEDLk7Ma+IYzngKOHSIkkrSpLhmCQEkNp5LzKUtTmCZd4TlcqCGLW?=
 =?us-ascii?Q?U9VejOKEOA9NwHdfIq6Dhi/RyzMoProavgFnOKcsD/UVGRZQoaUM0d9QPkKB?=
 =?us-ascii?Q?UqUDCCyG4odS1FRarBq785h+DRNCj3iyZKklMn0EfqeWlpandEhdp+PUi+63?=
 =?us-ascii?Q?Qa/p3lLuC5BQjGFLJA/GAKCV+A3lIR1QrDm5z9KLxSAdYr7Wt8jYotXJJgU8?=
 =?us-ascii?Q?I3pVfTA0q7ZUd3SkG/bn0qm/KcTF2Soy5GB/Grat2odX9Mmsd3dyyUbfX15V?=
 =?us-ascii?Q?a0uByzhgRwVUnhK/6rCPaHzdenxouA5/V29IPpo7RH6sit7rw0hC4TYLKjHr?=
 =?us-ascii?Q?Mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c0706d3-36c4-4206-818f-08dce7c3e491
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 18:06:12.0731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8dMkFHRa+L40w5K6Hs5leRc6uq/iE4Huo0JbFozzPVoXzu30W610Jvc6YM49ckVsOd3JPnnTsdggX7gu+gb9HOAcNFLGpgxsB03++93ODc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6811
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

On Tue, Oct 08, 2024 at 11:19:55PM +0530, Chauhan, Shekhar wrote:
> 
> On 10/8/2024 21:45, Matt Roper wrote:
> > On Tue, Oct 08, 2024 at 07:53:00AM +0530, Chauhan, Shekhar wrote:
> > > On 10/8/2024 7:05, Matt Atwood wrote:
> > > > From: Haridhar Kalvala <haridhar.kalvala@intel.com>
> > > > 
> > > > Define a common set of Xe3 feature flags and definitions that will be
> > > > used for all platforms in this family.
> > > > 
> > > > The feature flags are inherited unchanged from the Xe2 (XE2_FEATURES)
> > > > platform.
> > > > 
> > > > Following B-spec details inherited from Xe2 feature flag definition
> > > > commit.
> > > > 
> > > > v2: reuse graphics_xe2 defintion
> > > The patch itself LGTM, but since we're re-using Xe3_LPM with media_xe2, I
> > > believe we can have a v3: Reuse media_xe2 definition. Also, there's a typo
> > That wasn't a v3 change; this patch has been using media_xe2 since its
> > original version.
> I meant with the v3 being sent and then there were back and forth changes,
> might as well document them.

Yeah, but the media definition isn't something that ever changed here,
only the graphics definition.  The changelog generally just indicates
what's different since the previous revision of the patch that was sent
out.

> > > in the above graphics_xe2 'definition'.
> > > Both of these are minor things which can be addressed while applying, so,
> > > with that,
> > > 
> > > Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> > I think you copy-pasted my r-b here by accident?
> Ah, nope. Your review did most of the work, mine was an overview.
> Henceforth, I didn't mean to "take" it away. I've done something similar on
> the other patches as well in this series, where most of the review was done
> by you, but then I had a final look over it.
> Let me know if this isn't allowed, i.e., having 2 reviewers for a patch.

Generally every r-b line is an indication that the person has fully
reviewed the patch and approves it for merging.  If someone raised
concerns on an earlier version, but then doesn't have time to re-visit
the updated patch, it's not really appropriate to put their r-b there
since they haven't confirmed that the fixes are correct (credit for
their review feedback is usually given in the change log as "v2: fix foo
(Matt)." It's fine for someone other than the first reviewer to to do
the final review of the patch as you did here, but then only the final
reviewer's r-b should be included unless the first reviewer also has
time to come back and check it themselves too.


Matt

> > 
> > 
> > Matt
> > 
> > > Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> > > 
> > > > Bspec: 58695
> > > >    - dma_mask_size remains 46   (not documented in bspec)
> > > >    - supports_usm=1             (Bspec 59651)
> > > >    - has_flatccs=1              (Bspec 58797)
> > > >    - has_4tile=1                (Bspec 58788)
> > > >    - has_asid=1                 (Bspec 59654, 59265, 60288)
> > > >    - has_range_tlb_invalidate=1 (Bspec 71126)
> > > >    - five-level page table      (Bspec 59505)
> > > >    - 1 VD + 1 VE + 1 SFC        (Bspec 67103, 70819)
> > > >    - platform engine mask       (Bspec 60149)
> > > > 
> > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
> > > > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_pci.c | 5 ++++-
> > > >    1 file changed, 4 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > > index 7ffee06fab13..2139edba9062 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > @@ -208,7 +208,7 @@ static const struct xe_media_desc media_xelpmp = {
> > > >    };
> > > >    static const struct xe_media_desc media_xe2 = {
> > > > -	.name = "Xe2_LPM / Xe2_HPM",
> > > > +	.name = "Xe2_LPM / Xe2_HPM / Xe3_LPM",
> > > >    	.hw_engine_mask =
> > > >    		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
> > > >    		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
> > > > @@ -360,6 +360,8 @@ static const struct gmdid_map graphics_ip_map[] = {
> > > >    	{ 1274, &graphics_xelpg },	/* Xe_LPG+ */
> > > >    	{ 2001, &graphics_xe2 },
> > > >    	{ 2004, &graphics_xe2 },
> > > > +	{ 3000, &graphics_xe2 },
> > > > +	{ 3001, &graphics_xe2 },
> > > >    };
> > > >    /* Map of GMD_ID values to media IP */
> > > > @@ -367,6 +369,7 @@ static const struct gmdid_map media_ip_map[] = {
> > > >    	{ 1300, &media_xelpmp },
> > > >    	{ 1301, &media_xe2 },
> > > >    	{ 2000, &media_xe2 },
> > > > +	{ 3000, &media_xe2 },
> > > >    };
> > > >    #define INTEL_VGA_DEVICE(id, info) {			\
> > > -- 
> > > -shekhar
> > > 
> -- 
> -shekhar
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
