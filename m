Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62659C43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 23:18:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1038A10EC4E;
	Tue, 30 Jun 2026 23:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bez2DMTb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAAA010EC4E
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 23:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782861498; x=1814397498;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MXZHoT/BcUXEasnmBtlLnmC1RtTzyXZD3kd3wDzpfFQ=;
 b=Bez2DMTbvx8CR19sWf5rBo66vUXvlaw4D58iQ6PheAhKhF1ECmxFN/n0
 TpLp0LExllFTGG+jGaBCidF7HVb7y6MFCIOPew0z7MxPWsOGi4WKugbIc
 cv0fXk7IwOlSyeCmBQYrajldzy3R6m18Y4H6jlqKfV/WDCz3ePKkrF+h7
 A9AWv0uwtT3plG6s34RYBYjvYHMT3c4e3/u6g5G3sJY1y9cGf/qz/w16N
 VteMCFXdgtDmn7IW63OUx8/3xIPdRXuyKsf+sBaljaO2fDcHGKaZvrVpE
 J/oditQh+St+GH75pTriPV12Z0y0PUI28tMWz6STAf+WrZF7n4JK/nqjM Q==;
X-CSE-ConnectionGUID: 33bYNeXTRRCDCA0NHoBc/A==
X-CSE-MsgGUID: lDQGd5pjSjev5o89ZnHtaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="87268303"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="87268303"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 16:18:18 -0700
X-CSE-ConnectionGUID: 3Gth/0QLQFGo6i7OFh35aw==
X-CSE-MsgGUID: dnrejhQbRguSjtMM3Uic2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="249035633"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 16:18:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 16:18:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 30 Jun 2026 16:18:18 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.36) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 16:18:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNrmIlCQRSzLaPfYxGU45UQ+brMtnvHSs3MNOaLG6D5SF9iVHy+sklqHQ9xqYTZDzm2lgVh3Mc2/M4j6JkyZmdlVqaDTAx2Tifuz2LVhr5SCh0jP9JkfyPxVKm9XLq8hfcuuO33tVuOuaxHpP+XHoaEJhYG4c0g+0p3Q472Cls9g8jDIKdmGD5WaXZ56PJYyrp0NusxVCB+DsRPTSOvGDxUjnj9RDMByzdTBWGYs+1oz50XbZG0tB0DTx+4CCC4Wj6oVR0E+P2DUQKKAfvhARt/mC5Sshz/YVjCVyICmFApudREnCuml5CDFxxX9gxOedsY93oThETG6u12O2wGKNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ssdh7+3tlWM9Uxdlnz6zMQmNMsjxvD4hZdrnGcDE4Vk=;
 b=YInJqOaa+zAaj7TIiGT52mXXZJvdSn63T59zXs2eDl4gIfPAOM1FQ8J5AgMTEtafKsd03dpYFJyAkfn4HIwv8FwXjA6E0V8qoH+tYvUy8T94pgqgMJiSTQJeAW2FHSMVQp+87/Cw+Ejxe2oqsHt36/0cMYBtVdKBvdhbv54ubTMijXWbWpatg79SIkI5IpsFi3vme1aQsVu5CKC0KK6z676zIkcMRstvagEnleUtq9OoSS9vFBlhjowu5C2e5eArS9UyRcE//ELE8SnH+gRJ6Ywx16gtj5uWU2Ivxju4/Psml6WNvYyVbbFy3MFu0CswZdBE8DVM33rWOMPCF3Z/3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN0PR11MB6133.namprd11.prod.outlook.com (2603:10b6:208:3cb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 23:18:15 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 23:18:14 +0000
Date: Tue, 30 Jun 2026 16:18:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v2 1/4] drm/xe/oa: Rename last argument of
 WHITELIST_OA_MMIO_TRG
Message-ID: <20260630231812.GU6214@mdroper-desk1.amr.corp.intel.com>
References: <20260617015422.226177-1-ashutosh.dixit@intel.com>
 <20260617015422.226177-2-ashutosh.dixit@intel.com>
 <20260626163937.GR6214@mdroper-desk1.amr.corp.intel.com>
 <87h5mljou6.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87h5mljou6.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY3PR10CA0007.namprd10.prod.outlook.com
 (2603:10b6:a03:255::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN0PR11MB6133:EE_
X-MS-Office365-Filtering-Correlation-Id: b82f31d5-ba09-4491-c45b-08ded6fddc72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|18002099003|22082099003|6133799003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: h34XK7gNFD1qh2M9jFq2hj1WF436cIHvDji8089kjweHEHsdmiTE9JQME4q8D44XBOfg0V0/OtRKz8AgHa39a1p6CmcIb6vArXItDxVfuKY647IlIw4ol/YxgvU5q50n924s33SdvLkYXZ4PPhBzMM4wzrcBMMxkOhzrBOTeZdCkco/wNKRUEbicaQJ5JtwA4AMKbPLUBLmFbE6FI3Lqz1NPmdHpqkyiucGcDVI5M0deT9ebkLCCyVgwpCcIekENWRHR8m7Ervmcawh/+AVaDXH1gsI9cU+VtcKpLKNMyyhp3H4bQ4MuXwX3+4Gsk/BG6awBQSCXPMFDYucAxLyyRK7oGdowGM1vjEp+pzrmmcYBhYcTUBJ+INXR/X2wEos6CthumyGkRL+e40/F9DcuGQwPL5eiMXLL/3WZ21GFJy/uE3PH6HlyuSO9yB5fvw7k5JeLpo8smQ/hxpfirDVNN2cvmBx2oSl/UibgIiDW/3NpRnA3XTwootncCmYF/yO3CNNrXUQBkRY+Oh0Oo4CcTSKEarRvduAJzc5tNcZXo/ebFpGak6s2RVic/utmHgTeeFBr5WWv+bT47SvHEO8EVfmHE8g1XCjc3bm7d3D2vKo1nTVQsRqvV9wARKoMUx1i
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rTaQp6dYaJMNaK8ryTmsF6nOVBAHEFUuFYusIL01o3c6jJmK7r+CsWudPuFu?=
 =?us-ascii?Q?bmmQT0r1v75H70fnDyjLZHsnOIVdygTeLSzLDVb1PgASKlNP7Wr+xO2Sw+pX?=
 =?us-ascii?Q?hsn+XKLG9McbxfqITD1iZpKudS24AIy412wLYbOt5j/ZWBt0YmglkTWKxTMl?=
 =?us-ascii?Q?UUQ5odst5ZNr0vhl++n76XIk5lYGjGmR2fLZQtJm0CBSuoqyqcTNYsZxDTXc?=
 =?us-ascii?Q?Fikm0c3NlpZmN3nvCLN45ovwBOyGDLMIgUZDjIpZX6mDQNpMsdASHLnFwDUC?=
 =?us-ascii?Q?7ZrSGKU+O2z7KIOZlA1tG2172/liGSqbjSFV85CQ2CaYNmL/LzEaZAifKcu/?=
 =?us-ascii?Q?F9l/u+BfNZ5FR1XHmQvwF0m8K6Yoy5fHnnd9R977UmGLm9eJhQJVWDimxnDm?=
 =?us-ascii?Q?1zn9vfxOfzBAn1H25VAdtn0+SJrQQbSLH+yC0xxv14EVjfuhF84jZTjpnlya?=
 =?us-ascii?Q?gXJdKgHQQBlkWPMUfRS5KKrlu1tFlObBH7VGik9/qnzvgwytA3GQF1+2k33/?=
 =?us-ascii?Q?ySX46R4NI7YjeyvhvHQoLpKEDbIoNdPbl2Fgu3Dk7y8vYPREMdxcqj/xW18s?=
 =?us-ascii?Q?Ca/FutrS7PGxsPnL1QqXP0jg/Bzdq6WdD/cIhWETL0qUfFhFUw6zeUSwOGAm?=
 =?us-ascii?Q?xDh5elrrbpYRyxfkOiScX2aYNFUkow2R/u6c0llp38OoMyKineHzzfccSGri?=
 =?us-ascii?Q?+qdfBe11jPsN7g9zVqRCIJfZF2ICwLmIzsSPCDxYkmdrcFnBjgQC/7xjcUfy?=
 =?us-ascii?Q?MOlW6Ui3yZtcRJRM0dyruQSF1m8BaGDQxOqEKpR4SVTxIBhRZDrUoEQ1bGHA?=
 =?us-ascii?Q?vRYyXJRRP5BC+5QyDy7jCizit69Tr5n+gycglM908pn0SCxSj/l793jFPhM4?=
 =?us-ascii?Q?u+Nh1xDPA3B9YkmTYHaMhCDotIXEPsvNg7iiVymz46Alk84wku8gpc9VSlaZ?=
 =?us-ascii?Q?ybR/EPwJZ5m0Re8ulBZFpZ8ST902LewR3S6tLHb0kkC0VOtPdnhCbk0otW6H?=
 =?us-ascii?Q?Q6T6IP2LGbpfCY27pqN8j4Ei8zdiyJyfI6nHXAw9B4DmGJwgVBKkrUEYbxDV?=
 =?us-ascii?Q?9cUxUeXRuoboYPU1aFlJz6iJNSRFwAYtlNA7ttPCM5szrR8Yuc6bMUKGKrz6?=
 =?us-ascii?Q?/UtjDQ1o/cgj79RBIo75GYxEdEusPksUrbPk7L9UZASHrly0HIFLKtnzQ+AH?=
 =?us-ascii?Q?CDwFUfcaL7pNn/BkH7BGdhGOV8oNxPQwQLPgTZ399x5MJ3XVps5N6NEKQl42?=
 =?us-ascii?Q?BNcxZsbNGqeer8wPVqHfiNls5HOJ+B2kjO99/qq2gfzKQI4G3fXHYJOmRF24?=
 =?us-ascii?Q?mPebFlOXudER9JSMkpvyjI0Xh7xGyWf+AfINjyXvjliYB+zrWUVhFglwy8EI?=
 =?us-ascii?Q?SisUt+rdmN5qzx8bb/0uA4sv7MgQXgFJshslMDYNfJQyb6UtDJU8D2N9E6qp?=
 =?us-ascii?Q?q9eNw3IWdGUHlHbdMRxJAzbdqi/x+BEWiqDc4TD/uefCttQpcjb6CktP61M2?=
 =?us-ascii?Q?/ZqCh6SeKD5V8xLE9ysdYfCDs+zRojMVza3ld0xzIc0tPMDwPZTgLNUzfHKU?=
 =?us-ascii?Q?x4cVckr5CoMwvc53kRG9rjptjkXAb0hzdjyuOgxgDfukGXIVjcfNfIhble3E?=
 =?us-ascii?Q?TzAgML/ca34KdaSvXOldSvDEHzRYL+FuV+COelI+e9j9dQSE9lLBuWUGfm86?=
 =?us-ascii?Q?J9d0ABqsRBeyQQsnFk/QVJKOV3lHKo0jS6R7k4WR/3Fg2vw5aSq6kKdd10NZ?=
 =?us-ascii?Q?6oWP8Y8KZyESafW04rEYLofCuPRb6io=3D?=
X-Exchange-RoutingPolicyChecked: oZUAEIJnwevHT+Omm3Ho6EqJn6cMOYa3FZLpxJRlFFwSRC1HJkFRXdZIXpwWLwExRBBhAFmqyvkaGxtPcUn/uRYlxUKkUtfjgkI3MNCfjCoBBal0LbmRYAI/s8h4GrOHbpMAPBp/MEB9NLKgxV9ZY1G4oTcWDUlFyIyu2Gohv2l3EiPPXExONf3OEjMwnPk+NMbpzFq1/voL7vykcEh2PilMh+ia7iWR4payerDjWT3oCOkhXuXMcTSnoW9k2YZv75/3knWmUL77Sd5PBy5WgKRW+Uf6UISm4ck4WNeyfuyTS7RgazDrmOpwHNOUEji49LJFdvpLJ5IYW5G0u4xfBg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b82f31d5-ba09-4491-c45b-08ded6fddc72
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 23:18:14.8547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3L/NuYByG4+pLSp3OrntK2W9Xt0qMTXTy/Uum67vYxgTfWJamr/XGz59cqMefQgMG85zBIflicesXgaZ1sxQPeTlBXSQEcba+szQPkbnak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6133
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

On Mon, Jun 29, 2026 at 09:25:37AM -0700, Dixit, Ashutosh wrote:
> On Fri, 26 Jun 2026 09:39:37 -0700, Matt Roper wrote:
> >
> 
> Hi Matt,
> 
> > On Tue, Jun 16, 2026 at 06:54:19PM -0700, Ashutosh Dixit wrote:
> > > OA head pointer registers are not used by UMD's and do not need to be
> > > whitelisted, the last argument of WHITELIST_OA_MMIO_TRG is actually used
> > > for whitelisting tail pointer and OA buffer registers. Rename the argument
> > > to tail_buf to reflect this. OA head pointer is sometimes provided to the
> > > WHITELIST_OA_MMIO_TRG to have the correct register offset alignment (16)
> > > for RING_FORCE_TO_NONPRIV_RANGE_4.
> >
> > We should only be using that in cases where we definitely have four
> > consecutive registers that _all_ need the be accessed by userspace and
> > that are documented as okay to whitelist in the specs.  If userspace only
> > has a need for two consecutive registers, there's no reason to be using
> > RANGE_4.  Granting userspace access to two extra unnecessary registers is
> > a DRM uapi violation (and also a potential security risk depending on
> > what the extra two registers wind up being).
> 
> We recently merged
> 
> https://patchwork.freedesktop.org/series/166809/
> 
> So OA registers are basically only whitelisted now with "explicit
> permission from root" (they are not whitelisted by default and also we are
> preparing series to fix this up in previous stable kernel versions
> too). Our position is that if root has given explicit permission, "all bets
> are off" (I will write a patch documenting the sort of things which can
> happen).
> 
> So imo we should treat OA register whitelisting differently from other
> non-OA register whitelisting. Further, we asked our security guys
> specifically about the use of RANGE_4 for OA and they have okay'd it.
> 
> > I think the proper fix here is to get rid of RANGE_4.
> 
> There are few things in flight here (explained below), but the reason for
> retaining RANGE_4 was discussed here:
> 
> https://lore.kernel.org/intel-xe/87ecin7259.wl-ashutosh.dixit@intel.com/
> 
> So if we drop RANGE_4, we will currently use up 12 nonpriv slots for each
> media engine (leaving no free slots for other workarounds etc.). Of course,
> we can fix and merge the patch to increase the available nonpriv slots from
> 12 to 20. In patches 3 and 4 of this series, we are also trying to stop
> whitelisting OASTATUS, so it that goes through (there's some discussion on
> Patch 3 currently), that will also free up 1 nonpriv slot (3 in total for
> each media engine). So if we do any of this, maybe we will still be able to
> drop RANGE_4.
> 
> But the question would still be should we still save 3 nonpriv slots or not
> (for media engines and 1 nonpriv slot for rcs/ccs). But anyway I think
> we'll have to do one of the things mentioned above before we can drop
> RANGE_4.

Well, I think whitelisting registers is still technically new userspace
uapi since it's opening up a new interface for userspace software to
interact with and control the system that it didn't have before.  The
DRM subsystem rule about new uapi doesn't just apply to unprivileged
APIs, but also applies to things that are more locked down and gated
like root-only or master-only interfaces.

By using RANGE_4 we're effectively adding four new pieces of uapi (four
independent registers that all present different data to userspace).  I
don't think the fact that the registers are next to each other and it's
slightly simpler for us to expose 4 instead of just 2 is enough to
justify adding uapi that doesn't have (and is never expected to have)
any userspace consumer.  Doing this also increases our exposure to
unintentional ABI breaks --- we don't see a legitimate need for
userspace to access extra registrers like OA_STATUS, but some random
userspace tool may dream up some (misguided, likely buggy) way it thinks
it can make use of the information there.  Then we may make some other
benign internal change to OA code that gets reflected by the status in
OA_STATUS and suddenly that userspace tool has broken due to a kernel
commit.  It might have been a completely bogus usage of the register in
the first place, but if we've made it possible for userspace to become
dependent on the values provided we wind up being responsible if we do
something that causes it to break.

Maybe I'm being overly paranoid here, but I just don't think we can
allow this unless we get an explicit ack from the DRM subsystem
maintainers that they don't consider setting up userspace<->register
access to be uapi that needs to follow the usual rules.

Yeah, we're burning extra FORCE_TO_NONPRIV slots here if we handle both
registers independently (and OA eats up a lot in general), but if we're
not 100% out I think that's really what we should do.  We should also
make absolutely certain that we're only whitelisting on the specific
engine(s) where they'll actually be used (and we should verify exactly
which userspace consumers are actually using which engines so that we're
not making assumptions).


Matt

> 
> Thanks.
> --
> Ashutosh
> 
> > > Fixes: ed455775c5a6 ("drm/xe/rtp: Refactor OAG MMIO trigger register whitelisting")
> > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_reg_whitelist.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> > > index 2e84b1c49f374..a17ebacc1455b 100644
> > > --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> > > +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> > > @@ -104,10 +104,10 @@ static const struct xe_rtp_table_sr register_whitelist = XE_RTP_TABLE_SR(
> > >				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
> > >	},
> > >
> > > -#define WHITELIST_OA_MMIO_TRG(trg, status, head) \
> > > +#define WHITELIST_OA_MMIO_TRG(trg, status, tail_buf) \
> > >	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW), \
> > >	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD), \
> > > -	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
> > > +	WHITELIST(tail_buf, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
> > >
> > >  #define WHITELIST_OAG_MMIO_TRG \
> > >	WHITELIST_OA_MMIO_TRG(OAG_MMIOTRIGGER, OAG_OASTATUS, OAG_OAHEADPTR)
> > > --
> > > 2.54.0
> > >

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
