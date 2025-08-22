Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1ADCA0EED
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 20:10:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E26B10EB9C;
	Fri, 22 Aug 2025 20:10:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MDs49rRy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9205B10EB9C
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 20:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755893398; x=1787429398;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gFjmac568OlZzB1Q9aIthhkOAi388DMrN+kkL6v6VkU=;
 b=MDs49rRyCh7J5jPxcP+SNahhtPrDXUiHxluq83GC5lBtxz2t8JhU1tdG
 ucqcRLw9A1dYFPUdwL6ipuHAzxb1xJFfT/F5m9CyoH0md0HPrpSgUF7C5
 qeEwWSiglF0TfThAkaOW7fkQnug/sbEaxiDtBbN87cXEaeQrgMpmKoB02
 6uLrUsZSKy2iJP7Dn+Hbdb0rFeVvh5RAlgfQn3w6CNy+aLTa8Z8cA5/m2
 SUMIMcVaOhanNsRYy8O2lcE4dWR0JfWZ9aUMREl+AtMFZ91LZbk5U9lOC
 XaV5FIn5z02NDFudx9MB/arXpJutiXNFwAzdCJrttSbhbMmIoTGbuR+3H w==;
X-CSE-ConnectionGUID: fbIHjw56R6S4y78QRCvZ4w==
X-CSE-MsgGUID: 6qRXUKgkRsaNgGeKEfBeOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57224833"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="57224833"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 13:09:58 -0700
X-CSE-ConnectionGUID: LXCawJOiThSYBCMc+e/+aw==
X-CSE-MsgGUID: WcDQhS5bQleXFtcdMNOZxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="169146152"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 13:09:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 13:09:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 13:09:57 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 13:09:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bs+2Dc2YLj3IPGH+zkonl1fVu38p3OV8l2W+Crmteb0wjyugtwjBV4c/BfMHQJmqzDbzwRZV2YV6Ikp7+VOJUqLEONunJF6ukIdaFJ9/NJiZgR8s/6+7XY3WY0myZR8C/AjvY63886Vg4VND6IepboPeR5gL0WFmO6p5iysAQdA54wMSuBtbfqzVM+u3PaQbDGLiuUJwMTOsmH79UQoLU285opgfslpc2psVHrAGnYqJYgI/4IvvLv7zIVgbuBWFgEcoG7p+he0Fb9eEQX7amZ8fc/yHu9pVD6PJQKi5ATy7MyZYVeAXfgSOEhLdv6AQ4p48+G+hF/VjKQ0piCrnpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/T62CXNhjwlPHle692MDNxKxCW4Cd5vuzpSelzD5g8=;
 b=c/zz6RoNucEzOmB/cW1r/O996oTzP29O3PHiN8MGd8sBhgf1C7CqcLqdX/kc8+kQY+iS+UgeIq3V6oQvyeUImIA/eviqBNEWxAK8Ct/Iyx+d+iEbL/HuK1ywSLll8OiECQiMYPCiCJkNGGoI+Sg6zRFtlGC24jJNWxuHshBiKMVh+yovIYoV+hqIsLavO3pfvyLCjMsV7/IIb2/j4wSI9iSGkupuJKWkxGVYW1umagcY7MtQkh3+dg1Xpp59tUTWp88o1MpL1tKnc7lUhie7gp4tK9b/E4+gYDrg7uu7MsQ17zgTPeJVG7BlVvdwoSwAhOYRBMzqbRRi2UCoMCrxOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH0PR11MB5061.namprd11.prod.outlook.com (2603:10b6:510:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.18; Fri, 22 Aug
 2025 20:09:54 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Fri, 22 Aug 2025
 20:09:54 +0000
Date: Fri, 22 Aug 2025 16:09:51 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>,
 <intel-xe@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>,
 <carlos.santa@intel.com>
Subject: Re: [PATCH v2 1/8] [ANDROID]: Add a new xe_user structure
Message-ID: <aKjOjxlOzE1ZQiV6@intel.com>
References: <20250822085932.2221054-1-aakash.deep.sarkar@intel.com>
 <20250822085932.2221054-2-aakash.deep.sarkar@intel.com>
 <aKiRZkk2CV3bJjOO@intel.com>
 <aKiiZfwi9ykHvk5/@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKiiZfwi9ykHvk5/@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR05CA0082.namprd05.prod.outlook.com
 (2603:10b6:a03:332::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH0PR11MB5061:EE_
X-MS-Office365-Filtering-Correlation-Id: 90b3b5c7-1b7d-4e6a-c07c-08dde1b7dc25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?2MaSL0opYgTiU/afU6dmfZOfAwe5ymKA/1NUPdSxLPkwVAxjhG3V5V2IXO?=
 =?iso-8859-1?Q?zidzFjHW30yDwYSfYBa9IZ0gxFjJyEAZd+UJy/U/XimlhpCdMzq94A/HBl?=
 =?iso-8859-1?Q?Qync4xDCr6YmlkuITKuLKtqBMBTXGWxVyaXJGX+357eaNbEceU9ssAsql/?=
 =?iso-8859-1?Q?ihzXVoUTuGGFdLHCGN+a7Va7/BpHni3PQYfqAHO/ePuZiUNue3WP8t5Ar7?=
 =?iso-8859-1?Q?nM6sIiYEcijeRUDXFfmbOmkk+8259GWs5G0YTQBj445sq4WIEnb635rybC?=
 =?iso-8859-1?Q?mAwcHR7wmFm5sWhTqtRhbVluFMH/VhKatp2hK9TmtXtAEqqBrW0kppdeMd?=
 =?iso-8859-1?Q?wMP1XyFDwPzFV2nu0aTHDJCw7zzSZQvscj2FbnFNV8/Y7PKu/sBMGXCKZn?=
 =?iso-8859-1?Q?9OPsGMquRXUWqnFkeQkyISOGwTLcLzQcMo6zM68XnXzfRZWEPHiUdWluaj?=
 =?iso-8859-1?Q?6619L0uBAaYfB4aQTm9fXrXgo11rn4YjUNNviv/PeP0k/ZZukbmMD61iUN?=
 =?iso-8859-1?Q?qd9u2NmJJqe5ziuHEAnvON6qN1uSV/oSyj4zz2HMdHujbIpkdMhmTmOB4m?=
 =?iso-8859-1?Q?NO41FA/pKDfMWpWkrIPFCQjad6FMBfBQHCEI3Zdz0GllCauuJZFmw48ZlU?=
 =?iso-8859-1?Q?P0rPvQDkpM/E79/Ppeh/kFq/pCzd228ct2DPHHNFP0y4cdfDnGgwpT7MdI?=
 =?iso-8859-1?Q?Us4Ad2EmN5jQvofKXf6rBBsA6SX+GGwdIlDNVEz2/sfV4YCnF9BmAVfjYh?=
 =?iso-8859-1?Q?g+ZF+NDIZPnCYi9hGt/O5ChXkSFgm+WDdrzwTaK1tFeNYdtmCxaMb1SOOg?=
 =?iso-8859-1?Q?vwgc0gI3Uvxpw4hASmkQQ+fDLi3LZHOm+Fhq7beSFb2lkGbW9OwPPNE5Jp?=
 =?iso-8859-1?Q?7dSgrHvQq3FdCN/uz5AxYW+AM9W9bEjFY9U6noEDc/BV6a7n8/YHYpCXiU?=
 =?iso-8859-1?Q?GXh8cFW0yFS0x5T2ici8vLe3EtHnicP8fExE4Lbcar5kqPaEGIVAPcCB07?=
 =?iso-8859-1?Q?ZxkoI65Z+Na79RYEzrgu5GhmH0Njc66tPdtZwb+aJmQeknPvsv1ssM+emK?=
 =?iso-8859-1?Q?iiLZhV/tPLvK1JzoFKNwSB+uitAbSwttpA73n4k4nlEwWpqiwlC10fkmme?=
 =?iso-8859-1?Q?qRKTUAzqkF1vZW4I7EXtWdpOQybcONApXEDi28mzVAPwrNCZUlX/jX8Noh?=
 =?iso-8859-1?Q?QQvzGCuspCHoQP/qN9EMZd03ELzSSucVjAavuaxrSeZDv7LfqK5AHp/LC+?=
 =?iso-8859-1?Q?8nGxSvzQaMHdu1ngEwEeUxxVoVWXbi0er33om7i5TBD0bkyF8D7ahOpqKY?=
 =?iso-8859-1?Q?jLwx1LGrPPYLSlWGCjqmBYy8avAyAfV2Sl86htuWuShDB4wfcNdWfsc0JZ?=
 =?iso-8859-1?Q?jR0VN8UjabIyF0cAGLYoT7kM3ranMHArHacX/hltLl+ZG050t33C8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tNa9PHyvqrJ6/4Zlc3HJAAzSRs8GVW9SrbKee+j5HigekecVLTfwiUDgax?=
 =?iso-8859-1?Q?UjaOvbMwD5I/ZfUMKde0xSs3FQ4PlnRAU/enJ7dNLWv5+jpGfJH0daNHrl?=
 =?iso-8859-1?Q?9tP1CjUHd/gBJexl5cnB/cyjV01oQGyJpduZsHS8eNC55dQjjQEaBAYT0v?=
 =?iso-8859-1?Q?DTKTjLN7mBnxFpfOTnYqyu+lTjitlQgikL0W+KX94XVh4KkMxCBtWHGaed?=
 =?iso-8859-1?Q?ooHvshefP+l/w28id53+wCFOGkWvS58yW7Lei3cL0l/Z6w/L7yIQRIHPAl?=
 =?iso-8859-1?Q?cf8cMT062ZY0CaJWfvuYkeSLOi9GynyzZUvTSG4h2NGPR3qOf1nBtPYWfI?=
 =?iso-8859-1?Q?ZwI6n5v866B4WxpGpZgradS6zJIxbADifD8uF6UkhnwA11NrNUJXj5m64k?=
 =?iso-8859-1?Q?o2uyxpQEbdY75AkkdamQpUkdVLuqH+5GvSrIKNh9lI28FlRXV6xJg8LiA9?=
 =?iso-8859-1?Q?bqYKF8G6Yg1hJCefOvBDLIrSgeGUW24B2qMlU7pJq89iBYNWMo8HwewS75?=
 =?iso-8859-1?Q?2MTzgijhUbjSswl4u+RVcmzEOpW4c7CZlcQtXY/znQE1ExwhdBCTV/GnhT?=
 =?iso-8859-1?Q?ixZ011BpwMwNwVN0irL2zkn551DbPvdzQRtaepgJGGoD2zIP7pu6VZXiV1?=
 =?iso-8859-1?Q?wOojybX8jp29hCS64qAN2BS9MFPVn0uYFwl0pOGMi+sSbLTeZwSlTDwd7Q?=
 =?iso-8859-1?Q?1/0r7FrT6LqICD5IshHVUGCTevYA8xZf6uH6dfAb1dJvKobBzHB7ej/oFW?=
 =?iso-8859-1?Q?ZngoFq6/SNay1s0eYx41Z5TFdiYMeER/8PzaV6ZK2+aZJ5trzJs8RuCbym?=
 =?iso-8859-1?Q?F1nZ8c7EK48FfGwVuTHloGWV4Bdk/+To2MWzGb3wzCpLFw2IPkZeaQt02G?=
 =?iso-8859-1?Q?j+tCy+RknwfoHN04YX/2UNx8yfUjQEqoMSBL1b2wY4umroNiF5vBBbtVyV?=
 =?iso-8859-1?Q?bvYMV+EeAuda6vpu3pour+dHH8X+U4M9/e8g+MTDDjRkNCEU1UL4/4Pm2E?=
 =?iso-8859-1?Q?WEhXXDJUjtDWBXtj48rH68Zwxj6cjKRSyZzTW8UKe314uTVOWoPeUiol/j?=
 =?iso-8859-1?Q?Ri3K7EBVH56E30JpA3RA4sgLtAmpM5aSqXAyGCD3NoOjh6Wc2fI79FEVJR?=
 =?iso-8859-1?Q?/S0tAo79/TGqtAUfCmSnR3FUAk+neOEpPnnX/M5AZZWUHMEJW86z1Yg3wZ?=
 =?iso-8859-1?Q?+AbYQ0xsO1XqZH7+mMIfK5p7URCklqQwy02c1BbUXQLcWSygW53m251V21?=
 =?iso-8859-1?Q?t+xP8Z59e5k+8iLrqQ76LRFLRinXR48hEnC0SFmHUJKxAxaCdfTwiFeFvL?=
 =?iso-8859-1?Q?i4ubRbLn0CWOMT6lqdA/P6x+IH1KY8GqY0pYSvrFJEnw+UegxWi4IvBm01?=
 =?iso-8859-1?Q?jf8aojqd+VL6cz6KBCTrDcsZwJ3xLtcTYEH23vux7VbdsFq3v1C3qx/vrG?=
 =?iso-8859-1?Q?mlamq+yNaBX+cskDYzjsrch8m2KxdCCENn4tr9/GxEGfEYOb1dmdzPRiAN?=
 =?iso-8859-1?Q?BDSZ0NNvdWXv1BiQggm+QtJZ4cI1Oe+cMXp+8aZrl/sapji6G3qA98vMmm?=
 =?iso-8859-1?Q?StVoinLFzv8Dd+0pAeHpkejf32bmrPSm0nrbqQfdfog9CxVcklNVJVK5f2?=
 =?iso-8859-1?Q?tm2WK5UhLJGFIztrzp4c1jKocEWPWHRNGfeWIZnl0NJSkP+TBmVs08zg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b3b5c7-1b7d-4e6a-c07c-08dde1b7dc25
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 20:09:54.7756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ON+pvcHEQAN0B3ubsnT05ZUDcRrBhDYYlqXKUnMXFshc6bOKfAX6EPjKNL0kPsVaMQFITACgmkXQk4nRmig/+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5061
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

On Fri, Aug 22, 2025 at 10:01:25AM -0700, Matthew Brost wrote:
> On Fri, Aug 22, 2025 at 11:48:54AM -0400, Rodrigo Vivi wrote:
> > On Fri, Aug 22, 2025 at 08:59:23AM +0000, Aakash Deep Sarkar wrote:
> > > For Android GPU work period event we need to track the runtime
> > > on the GPU for each user id. This means we can have multiple
> > > xe files opened by different processes/threads belonging to
> > > the same user id. All these xe files need to be grouped together
> > > so that one can easily identify these while calculating the
> > > run time for the given user id.
> > > 
> > > Currently, the xe driver doesn't record the user id of the
> > > calling process. Also, all the xe files created using open
> > > call are clubbed together inside the xe device structure
> > > with no way to distinguish between them based on the user id
> > > of the calling process.
> > 
> > I thought I had already given this feedback, but I'm not sure if
> > I forgot or if I was just ignored. I'm sorry either way.
> > 
> > Android is not a justification. Please keep 'Android' mentions
> > and ralated 'Android' justifications in the cover letter ONLY!
> > 
> > The patch needs to make sense by itself. The patch needs to make
> > sense in the currently linux upstream.
> > 
> 
> So what are the rules here? There is another series [1] floating around
> with a justification that Android needs this. Does that mean we can't
> accept any Andriod only code upstream?

I'm sorry for not being clear. Of course we can accept Android code
upstream. I wish we had more (all?) Android code upstream ;)

But we cannot add in xe, for instance, something with the namespace
/sys/kernel/tracing/events/power/gpu_work_period where
gpu_work_period is a definition in the Android tree only.

We could add xe_work_period.

But my comment was more with the justification of the patches itself.

The series tells a history. It explains the goals and motivations in its
cover letter. There it is okay to tell that we are adding this
gpu_work_period to attend to the Android requirements.

Then, it patch itself is a small piece of the puzzle telling what it
is doing and why, but in technical terms, without having to tell
that we are doing for Android.

And also every patch in the mailing list needs to come with [PATCH]

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#include-patch-in-the-subject

in our case it is okay to accept [RFC] or [CI], but we should limit our
creativity there ;)

But the most important rule that we have to respect imho is this:
https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements

so, if we are targeting this upstream we need to justify based on the
admin using perf or trace directly. Commit messages should explain based
on admin usages of these APIs directly. Documentation added along with
the code should also demonstrate the usage with perf and or trace.

They should never rely on closed source Android applications that
might be using 'gpu_work_period'. That is unacceptable by these rules.

Thanks,
Rodrigo.

> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/series/152701/
> 
> > This also means no --subject-prefix=ANDROID.
> > 
> > Please!
> > 
> > > 
> > > To remedy these limitations we are adding another layer of
> > > indirection between xe device and xe file. xe device will
> > > now have a list of xe users each with a given user id; and each
> > > xe user will have a list of xe files each of which is created
> > > by a process that is associated with this user id.
> > > 
> > > The lifetime of the xe user structure should be between when
> > > a process with a new user id has opened the xe device; and when
> > > the last xe file belonging to this user id is closed.
> > > 
> > > Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/Makefile  |  2 +
> > >  drivers/gpu/drm/xe/xe_user.c | 59 ++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_user.h | 81 ++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 142 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/xe/xe_user.c
> > >  create mode 100644 drivers/gpu/drm/xe/xe_user.h
> > > 
> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > index 8e0c3412a757..89212fc7ef44 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -325,6 +325,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
> > >  
> > >  	xe-$(CONFIG_PCI_IOV) += xe_gt_sriov_pf_debugfs.o
> > >  
> > > +	xe-y += xe_user.o
> > > +
> > >  	xe-$(CONFIG_DRM_XE_DISPLAY) += \
> > >  		i915-display/intel_display_debugfs.o \
> > >  		i915-display/intel_display_debugfs_params.o \
> > > diff --git a/drivers/gpu/drm/xe/xe_user.c b/drivers/gpu/drm/xe/xe_user.c
> > > new file mode 100644
> > > index 000000000000..8c285a68115a
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_user.c
> > > @@ -0,0 +1,59 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2023 Intel Corporation
> > > + */
> > > +
> > > +#include <linux/slab.h>
> > > +
> > > +#include "xe_user.h"
> > > +
> > > +/**
> > > + * worker thread to emit gpu work period event for this xe user
> > > + * @work: work instance for this xe user
> > > + *
> > > + * Return: void
> > > + */
> > > +static inline void work_period_worker(struct work_struct *work)
> > > +{
> > > +	//TODO: Implement this worker
> > > +}
> > > +
> > > +/**
> > > + * xe_user_alloc() - Allocate xe user
> > > + * @void: No arg
> > > + *
> > > + * Allocate xe user struct to track activity on the gpu
> > > + * by the application. Call this API whenever a new app
> > > + * has opened xe device.
> > > + *
> > > + * Return: pointer to user struct or NULL if can't allocate
> > > + */
> > > +struct xe_user *xe_user_alloc(void)
> > > +{
> > > +	struct xe_user *user;
> > > +
> > > +	user = kzalloc(sizeof(*user), GFP_KERNEL);
> > > +	if (!user)
> > > +		return NULL;
> > > +
> > > +	kref_init(&user->refcount);
> > > +	mutex_init(&user->filelist_lock);
> > > +	INIT_LIST_HEAD(&user->filelist);
> > > +	//TODO: Add a hook into xe device
> > > +	INIT_WORK(&user->work, work_period_worker);
> > > +	return user;
> > > +}
> > > +
> > > +/**
> > > + * __xe_user_free() - Free user struct
> > > + * @kref: The reference
> > > + *
> > > + * Return: void
> > > + */
> > > +void __xe_user_free(struct kref *kref)
> > > +{
> > > +	struct xe_user *user =
> > > +		container_of(kref, struct xe_user, refcount);
> > > +
> > > +	kfree(user);
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_user.h b/drivers/gpu/drm/xe/xe_user.h
> > > new file mode 100644
> > > index 000000000000..e52f66d3f3b0
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_user.h
> > > @@ -0,0 +1,81 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2023 Intel Corporation
> > > + */
> > > +
> > > +#ifndef _XE_USER_H_
> > > +#define _XE_USER_H_
> > > +
> > > +#include <linux/kref.h>
> > > +#include <linux/list.h>
> > > +#include <linux/workqueue.h>
> > > +
> > > +/**
> > > + * This is a per process/user id structure for a xe device
> > > + * client. It is allocated when a new process/app opens the
> > > + * xe device and destroyed when the last xe file belonging
> > > + * to this user id is destroyed.
> > > + */
> > > +struct xe_user {
> > > +	/**
> > > +	 * @refcount: reference count
> > > +	 */
> > > +	struct kref refcount;
> > > +
> > > +	/**
> > > +	 * @xe: pointer to the xe_device
> > > +	 */
> > > +	struct xe_device *xe;
> > > +
> > > +	/**
> > > +	 * @filelist_lock: lock protecting the filelist
> > > +	 */
> > > +	struct mutex filelist_lock;
> > > +
> > > +	/**
> > > +	 * @filelist: list of xe files belonging to this xe user
> > > +	 */
> > > +	struct list_head filelist;
> > > +
> > > +	/**
> > > +	 * @work: work to emit the gpu work period event for this
> > > +	 * xe user
> > > +	 */
> > > +	struct work_struct work;
> > > +
> > > +	/**
> > > +	 * @uid: user id for this xe_user
> > > +	 */
> > > +	u32 uid;
> > > +
> > > +	/**
> > > +	 * @active_duration_ns: sum total of xe_file.active_duration_ns
> > > +	 * for all xe files belonging to this xe user
> > > +	 */
> > > +	u64 active_duration_ns;
> > > +
> > > +	/**
> > > +	 * @last_timestamp_ns: timestamp in ns when we last emitted event
> > > +	 * for this xe user
> > > +	 */
> > > +	u64 last_timestamp_ns;
> > > +};
> > > +
> > > +struct xe_user *xe_user_alloc(void);
> > > +
> > > +static inline struct xe_user *
> > > +xe_user_get(struct xe_user *user)
> > > +{
> > > +	kref_get(&user->refcount);
> > > +	return user;
> > > +}
> > > +
> > > +void __xe_user_free(struct kref *kref);
> > > +
> > > +static inline void xe_user_put(struct xe_user *user)
> > > +{
> > > +	kref_put(&user->refcount, __xe_user_free);
> > > +}
> > > +
> > > +#endif // _XE_USER_H_
> > > +
> > > -- 
> > > 2.49.0
> > > 
