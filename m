Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C97C27C54
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 17:33:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793C310EA47;
	Thu,  6 Jun 2024 17:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ikx4NmO1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6E510EA50
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 17:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717695234; x=1749231234;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dQ3aylckhCV3TDq3PYaEPZIcS10nmCA7Z98Sn/zz2zY=;
 b=Ikx4NmO1hR/0CHVNi4F1OJnnIMofvNMENl72hoxrLIqRPnHi+82oAtj6
 a/g4FX7eVtvBu+zwlNbXAOK73k87gxWAg95youFMwHnPyTNXZ0WNo08JW
 jXuxiRH9X8wsFrFAUNlPEKIzSor+VaV/fs6Epesc9jlPkezYCezqFk2Kb
 I56EEfoPiU4wsKIo9mwzLTLv4kP7u9K1TpDsRJDoeqPo22dmGkFb3OlMk
 qo4FEiSeYCKLboQahpF4i2eLsftDmDRzF3ewY42+WVe6XLgj6mMInAGws
 LHudNO+FwQfywMKl5mpYPEhJE1yxaC8l8CjAazo8Re4Xuu8M2Ag9hbrvr Q==;
X-CSE-ConnectionGUID: 0jjB8B4mQK+AhNWW2/v5qg==
X-CSE-MsgGUID: QVgb7lUMRsm/G7Q5sFd15Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="25790576"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="25790576"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 10:33:54 -0700
X-CSE-ConnectionGUID: UGu2MTNuS4+gyaUIipPsXw==
X-CSE-MsgGUID: i3IcgKT0T0CrJFyjM2HulQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="61251634"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 10:33:53 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 10:33:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 10:33:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 10:33:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ht/cI+o906a0jI+ne6mdrdGOr4J6wVgeT/22KL9RdIJY/QEmoNp7yrMEGwhpYMowWc1F2wo91tnw5CWjOlv6erd8nrHEQoX7eoGYPiIbh155XGm5rmBE/J4FkUWfPKTPMpqKjAns7vQ1C42cjVpNgqk3g/1ddkBYhRKOihLFAj0R5OLZ/LIvo9AEB8Kz1xCvShX8IzpEQJKntpY57ybl5tcfiHsyIM0ydHBE2XJMUY3db0G/JzjUq3lWCZdM6sBhV6Pr8jA6k6bAIHqMfa1GyHgweyC2E8/cT36MnVvTf/dBB79Cl9dfeVLFKbegj7oChWOl3G1Gj3v28M7hIjUOlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnNFsJcQ3OingfPeOSD4j9s+cMvMihsmhgrMLCJTXxE=;
 b=KFHevc1N3b3h6siPkk9ZIgvCjaKvxOOga3Mnano+zk/uqdxE12NQ8aC+1scW5nhhpAhPMCzY2TDusHu56292ewC1+og3/urnn9SIgGeoRLt2RSPL1devGlV9KHV9Sqw1+srvdAi/A4vA4LQ3bsQ4uK4MH2NbgMBDoWXbqNvMeTBsU+Y9YMEjE0LIbRjCQmzJVelJKy4vXxnqJSEjqP9dZh45q6zOQtQgFTSHPHM3sj2+mptfIanReL4yxQjeJHQgVfREsOJKAbgnn3qMG1Ci7Pwaus2zopIX35ky8cNekU70RJ/dUTdLTtAf4+xpUQTbHqhvkevBLOyD0WB5ocOySQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Thu, 6 Jun
 2024 17:33:48 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 17:33:48 +0000
Date: Thu, 6 Jun 2024 13:33:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Harrison, John C" <john.c.harrison@intel.com>,
 "Summers, Stuart" <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
Message-ID: <ZmHy-QUmSWHapjKJ@intel.com>
References: <20240605150828.2736396-1-jonathan.cavitt@intel.com>
 <ZmDiLcMGBdCcz2Rx@intel.com>
 <CH0PR11MB54444909E70839CD751A14E6E5FA2@CH0PR11MB5444.namprd11.prod.outlook.com>
 <ZmHjAAFZ0i9Xg2-S@intel.com>
 <CH0PR11MB54446ACC83247A5E623A89EDE5FA2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB54446ACC83247A5E623A89EDE5FA2@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY3PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:217::29) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MN0PR11MB6207:EE_
X-MS-Office365-Filtering-Correlation-Id: cdfd497a-4a15-4f6e-0df8-08dc864ed2f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KfzrDnauLsDT7R7WILFzZu8/YEEhLsqigp0F/PtfIbralJHyqnG6HyhoK/XX?=
 =?us-ascii?Q?GDC80qKDDOzPcjmp+gm8Gv1oPMJpMCuKa2PilIaHP46sauBbgrRHKLMGPi7z?=
 =?us-ascii?Q?99C6Yf2JS4snmidk7HdrC0PV0rYY8os0KimN3PPb5qgfE8y88/N58IgHYcMa?=
 =?us-ascii?Q?0ZKbvNJA46vv9UlkeRbt67L4TbskY3x7zPBNSI7ac9DdfWrcqIvKqxciy8SG?=
 =?us-ascii?Q?zy93RcdLDcIj0sGQ7tJ0ov/GJi5Up5uUUUqk7bRtof0Cde3aLqikZnJm66Yi?=
 =?us-ascii?Q?+jlJ14GqEBx66K/l+pm7lHWTsweCa4oNb7xICVjwCE8QU83DGUO999Ii//PG?=
 =?us-ascii?Q?O2AxpQ9sOMpyIqlqMvMHorKbRszV7dJNGnPACGSKI4+2EhXVlQd2ySgR+P/E?=
 =?us-ascii?Q?UgjgKfm93DDKB8OWhhXjA6HU9IVWTPERK8sloG4BIOX9w6298jDIzm36E3Fv?=
 =?us-ascii?Q?RnmOaa14vx7ckt0cNwMnBlU/5EwRC9MOFGgLNJFOkP9cuTVtoAie3/aI3qfV?=
 =?us-ascii?Q?HRJen+Qkf/yy/zAJnf7F2uiB0a3odGak3YfDVwQy68e2+Pzgs2G3lHvEowtD?=
 =?us-ascii?Q?VfpVh4duWy7o1EMqhjurw6qZR+U6L2FabfTyQ8PJhQ7vglsA/PKtpwvDkwu7?=
 =?us-ascii?Q?e3yz9O0aOLTrCxrMqF01klyBFdf3EricMBr1x+rErasLJn7dYWYcaVpV/6bN?=
 =?us-ascii?Q?XxskzSnayVdea9S10eVlKLXXywTgsb+EQv5yuGkSqsb2y8R37fo1C++6IE2P?=
 =?us-ascii?Q?FHH/3+F4AvHReN6dtnVHWTqWvhpRJ7QeagblhcLoYWB8ysfXkJjGHzYldMsq?=
 =?us-ascii?Q?m+ItrgtQuAQpDPqk2wEIT1BXoEtHXRWxibMktJ3l414eLWtnQfHhPuAHV9Cv?=
 =?us-ascii?Q?hApnajjo947GaixA/kt5hquKushqLQdejSJO8OzIZ7Iebi8Qc1fJD/Yb/4/E?=
 =?us-ascii?Q?Urf+ZenW2BRuS7S5llS1xWuqNvtC3uvZo9emsSNjzD3k0K5up8GFO8MbUZYf?=
 =?us-ascii?Q?v7Unpr9aXHE66ZPQB3+Vu/efWEGgOD09nw1l7dIZznqHLGXEXs6w+Jg1eapv?=
 =?us-ascii?Q?Mx8nTqzObbMgC+8vosiw8tUM6coUhsOnCkeGnmKcYrQ/Mch95nQmv1POwIH4?=
 =?us-ascii?Q?16GC4mfgm2WUC4PMSiXyb/TCyvqqdxI8pTeOpcCvazUnCbQVwN124UAiwXTl?=
 =?us-ascii?Q?6LnegV2O3QxqgJo9XdN6Id1IS4V2NNMveAe9qZVyO/jyPlIx1UPHqPaxCFu7?=
 =?us-ascii?Q?TLEq1zVL2G+tauOKqoZJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EHc5ZxxegMpAdGRrWFr5jRjUe/sSo/KuUVXOPZJokIy5TLy5mYIkd7vpNjCF?=
 =?us-ascii?Q?fQWnRz6a3zBLWpaOR6hm8KlNehW+wIccMinEiZvr0zMenHeBxPtE1ubx5npM?=
 =?us-ascii?Q?VfoempoIzxxTOLleIyvPWEknJYO3n13mRHm5guLYyDt86tTCOPQV7boforA1?=
 =?us-ascii?Q?n/WAiALDlBSODnIsdGkCQc7BF7z644roEGdBuaS59ApRRK+He5ICXihhaKNv?=
 =?us-ascii?Q?ZMuFkDDqgvMB0lbuYVEZMfRU1+Kmta8oVievxuaWeVrMqZLPfBY+U2EgEA1m?=
 =?us-ascii?Q?wXjoSUvMm7TudGUwRga9YY2qfpxRhkg3O3mHo+k9ixEiZv5To5E2Lx2xpfCR?=
 =?us-ascii?Q?6KUrCbj3ypN4yKB7A4Aupjnn9CuxsXKp8RR/jeiLeA11D3ycAYc6lAiACquk?=
 =?us-ascii?Q?xZdWz3ffVL0cJz1lzgR51gtv0iOKRV2b4falhqSFY/GjsWDimLvO8jpA0C3R?=
 =?us-ascii?Q?1OieW3qfvmbgqd4mX+0xbHhz/RDhxsa02S1JZaPJak9LfzDkDkniDXwMlN+p?=
 =?us-ascii?Q?mfY1b2NFGbO4WsDLy8RHhnbITOFDLzZZq7UF6Vh6k60Q+TYgKVUj3FgPROYd?=
 =?us-ascii?Q?cnIUn66la9yzHQnuPcZH6ZTARPmfrXF/bUVOM44J/rdNlJgHAErKwLf/o/8X?=
 =?us-ascii?Q?YUDeRYqasMuRlIW9s63PO7tQO/jKuECu/aGL84fgPwindCWVmlWeS3H5o5QY?=
 =?us-ascii?Q?rSjIWH9e/kTIkyg/k+cY8WPOya8Nv5fJuRA4SV7s5bd9wvWdFxzNIqj2Aj3o?=
 =?us-ascii?Q?c6Qa19vCQAg2gn7975ERfO/cW7cwaSotOKfJfdDA+zEoWAKX6bV6GtVUJ9fX?=
 =?us-ascii?Q?PCNLOzrz5NnJ0KRhHzB8wy3J7LsKO87KkhneorXxmyT6Jpe3wIJIgPm75IMJ?=
 =?us-ascii?Q?HnVfmetmAcfktVtH3QUFRhVCcEqau68b84inuBvK0XeA79Z0QdcSt8RQCXD8?=
 =?us-ascii?Q?569NEiSQdA2GTB/4XTqmAVYSmQkfvaO+4HaLl0PX6EQE3O4HZSxkcUwUmE7D?=
 =?us-ascii?Q?Ay/xOZK/ZoShum5wV5XQo0JgZqWUCtQ5GOdZ9uy7XZrBCtlLL3l+6haZ85FL?=
 =?us-ascii?Q?W3aU7V0UaEBeWmdNWZRNj/HHj2MQv3IbTWpIGiU4pLXexhdqL5/G0EiVxnQd?=
 =?us-ascii?Q?En4sP90cQj5dUzJ3IbncyO5U9LSs/pquaYLBXlf+x2Kt7aSrre7kn3a3leQw?=
 =?us-ascii?Q?RyDzS8UcRaYJkS/DlJomQyXQyDi9i01cv27CnZJpt9NRLxTJcf1SAUlaaajm?=
 =?us-ascii?Q?WfonFFtI49xviD5RlsZRO6AB1oVb+gjEEiO5yES3M8EkViUJGz0E1P+g3Bhg?=
 =?us-ascii?Q?p0TzKanPazJm+s+qYq7f9WvhCitSa+6l0UfRYTmRp0TemeKGEiYRLBdAVjGw?=
 =?us-ascii?Q?otaKHYxWUCG8oEyQC3yjaG8gJWgOsk5oEYMF6zeuSwNa1RwBINq45emwz1Q2?=
 =?us-ascii?Q?AzLcUhTbtUmIIfzhl7BgmWxJligxeqbqEg62USO0FlSsn/FkyNZX5q7N1d2k?=
 =?us-ascii?Q?iIsod2WdFLR5DhJpO8veemxDF8cfkAP1EhLEKotp19J6UTzWtsOkVEm4TgV6?=
 =?us-ascii?Q?s6/uxNUWQW/ukM4pXojFuvhnB9NcjCOkfMepZKPx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdfd497a-4a15-4f6e-0df8-08dc864ed2f4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 17:33:48.6307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b7n/OIU3+XYRVElXPZfVX0IY9iKrRJbPdkjzO6GAT9Vr8/oTYYhqAQFrGBo3JURofanIDaJv8c4Isw8kiyvJpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6207
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

On Thu, Jun 06, 2024 at 04:38:49PM +0000, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com> 
> Sent: Thursday, June 6, 2024 9:26 AM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.com>; Brost, Matthew <matthew.brost@intel.com>; Harrison, John C <john.c.harrison@intel.com>; Summers, Stuart <stuart.summers@intel.com>
> Subject: Re: [PATCH] drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
> > 
> > On Thu, Jun 06, 2024 at 02:11:02PM +0000, Cavitt, Jonathan wrote:
> > > -----Original Message-----
> > > From: Vivi, Rodrigo <rodrigo.vivi@intel.com> 
> > > Sent: Wednesday, June 5, 2024 3:10 PM
> > > To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.com>; Brost, Matthew <matthew.brost@intel.com>; Harrison, John C <john.c.harrison@intel.com>; Summers, Stuart <stuart.summers@intel.com>
> > > Subject: Re: [PATCH] drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
> > > > 
> > > > On Wed, Jun 05, 2024 at 08:08:28AM -0700, Jonathan Cavitt wrote:
> > > > > We currently have debugfs support that allows the userspace to initiate
> > > > > an asynchronous gt reset on command.  However, userspace may also wish
> > > > > to wait for the completion of the gt reset before performing any
> > > > > additional work.  To that end, add a version of the force_reset gt
> > > > > debugfs function that operates synchronously.
> > > > > 
> > > > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1068
> > > > 
> > > > do we already have the igt changes that really closes this?
> > > 
> > > The IGT change that closes this issue has not yet landed.  It relies on
> > > using the new debugfs, so if it landed first, we'd be attempting to call
> > > a nonexistent debugfs function.
> > 
> > Please provide the IGT and the kernel patch at the same time.
> > you can copy patchwork or lore links in the one or the other cover letter
> > to explain and justify each other.
> 
> Here's the related IGT change:
> https://patchwork.freedesktop.org/series/134509/

doh! I had missed that, I'm sorry.
I just pushed both sides, kernel and igt, since they were all reviewed.

> -Jonathan Cavitt
> 
> > 
> > In the current way we cannot simply merge this because the 'Closes:' tag
> > is a lie.
> > 
> > Also, there's always the risk if doing the IGT in a later stage you realize
> > that you need slightly different and cause unnecessary rounds.
> > 
> > > -Jonathan Cavitt
> > > 
> > > > 
> > > > > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > > > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > > CC: John Harrison <john.c.harrison@intel.com>
> > > > > CC: Stuart Summers <stuart.summers@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_gt_debugfs.c | 12 ++++++++++++
> > > > >  1 file changed, 12 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > > > index 66f897a9b6ca9..5e7fd937917a1 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > > > @@ -116,6 +116,17 @@ static int force_reset(struct xe_gt *gt, struct drm_printer *p)
> > > > >  	return 0;
> > > > >  }
> > > > >  
> > > > > +static int force_reset_sync(struct xe_gt *gt, struct drm_printer *p)
> > > > > +{
> > > > > +	xe_pm_runtime_get(gt_to_xe(gt));
> > > > > +	xe_gt_reset_async(gt);
> > > > > +	xe_pm_runtime_put(gt_to_xe(gt));
> > > > > +
> > > > > +	flush_work(&gt->reset.worker);
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > >  static int sa_info(struct xe_gt *gt, struct drm_printer *p)
> > > > >  {
> > > > >  	struct xe_tile *tile = gt_to_tile(gt);
> > > > > @@ -261,6 +272,7 @@ static int vecs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
> > > > >  static const struct drm_info_list debugfs_list[] = {
> > > > >  	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
> > > > >  	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
> > > > > +	{"force_reset_sync", .show = xe_gt_debugfs_simple_show, .data = force_reset_sync},
> > > > >  	{"sa_info", .show = xe_gt_debugfs_simple_show, .data = sa_info},
> > > > >  	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
> > > > >  	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
> > > > > -- 
> > > > > 2.25.1
> > > > > 
> > > > 
> > 
