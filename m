Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13122E6F084
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 19:59:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FC610E0C1;
	Fri,  1 Nov 2024 19:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gpq50aMY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E736A10E0C1
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730491185; x=1762027185;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=I5tJb+s1wGseRuyM7kzYv3KG2u3JzO9jx1rrAkmvpJ8=;
 b=Gpq50aMYhEbXqnSIDtJx8oEX1yUfBZaMPQdmcAkc4cDkeDimSeJKkU4t
 58iOeDfdFyRaFTV6kjrl6nL/4RA57l8favVKfspX+9xUBv4MF7zjFcRtN
 KY/6IKCL9VG81EtHN6I1cjQUH5gOIL2TQDeWhbsAD2srZAUWBPksp5yK0
 NlspZFoGb1fsdCQqFFDSsgYIdYWikxmEdFRnZEzjJJrpRd+LTpKUbBTpz
 3l1+UYit+xlNy7sHEKB12d1U2zA5k7vY89ZKMGVZpJJHCINSPUclFsLg+
 KxgDzFZOvXu0W5y0Txb/vr2c0dxu7lLOJQbclu33+uYLad5gmZx9E7fPe w==;
X-CSE-ConnectionGUID: 3ZejRanxT/KyCFJe1id2hg==
X-CSE-MsgGUID: aplTJpqUSQaR9h2VDoOc4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30222740"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30222740"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 12:59:45 -0700
X-CSE-ConnectionGUID: djIcw2mpRsSB9qDbgs0kbQ==
X-CSE-MsgGUID: bqgpHu+hQs6IVfzZlmHXOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="83162778"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2024 12:59:44 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Nov 2024 12:59:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 1 Nov 2024 12:59:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 1 Nov 2024 12:59:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bk1pPjpRZussZR+Qxdo0r6e+6S5qLSj78Q7o33gX2UOOCtbfhl2lRnexCMrpKBGmZn1IFdVDb9vVuf4rP6pfd1HU4/1lQu/Fc3yzjLtQYQPTWny8C52IgSjnJSap4PLxTpL/OKve5s7j05tGdy3sowTjtUbYo0Fj8uX7Gx6YxOfO3yBn8JsN8SJxEsT1OqLps+K+O29svwuhTHp/ccbzsGXntl0gADV0uaQT5xw+AVGT9o7D2V82DbkYIdXiMA26eVD40FpzRlAkZm1wEV135GVuGFVXpKISZL2Yg6B7y7GVl0qv9ghkwu8F9imw9Zlm7MyoHh+dwTNcZLKaXRU59g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvOEYOoRx6Rda5VGkwUezCcyTrNWzJpqO3k0KYtKcGA=;
 b=cUsFGvD/FSASpYeFGYEKrW3/m8ayBIjl044+9WGWQgtkw2ZYfkdQNX2p1wSol0MYNFB0cwgYOiHdMqsf03MBTa6x5G4BzrbPTWFbsIVRlzDe+86ZkoPZlBhro/khgQaEVW4eio8UggAB/qv1vqzpWZ3RLU6yYiif7pfaZuyluYS7Sy5hM7nKGWZWCJhY6h0cupKDoHE1QwklstgkAFL64c8fuVpHbGBcyUsCaKGf03nZSlpLMY5gYEx3wiUbItkaEuziRG32IMWrt8YXzt4zXsViM1sCoRjtrdM6TEx8CjMJ5Ayf9w84Z9p8uiF+IhlGpM+3tEiZD0/hAVomKVqsaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CY8PR11MB7009.namprd11.prod.outlook.com (2603:10b6:930:57::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23; Fri, 1 Nov
 2024 19:59:35 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Fri, 1 Nov 2024
 19:59:34 +0000
Date: Fri, 1 Nov 2024 15:59:30 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: John Harrison <john.c.harrison@intel.com>, Raag Jadav
 <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Improve devcoredump documentation
Message-ID: <ZyUzIsyGzjHVmyXs@intel.com>
References: <20241031182916.1441987-1-lucas.demarchi@intel.com>
 <20241031182916.1441987-2-lucas.demarchi@intel.com>
 <ZyRrisQfc_59rrK-@black.fi.intel.com>
 <4kw2zzb76m42zbisvsy2fu52q2litchy6dfl4hyrmvze5u5dvk@hjs2pdynjemd>
 <ZyTutrXXD73sofRo@black.fi.intel.com>
 <49fb16e0-8cf9-4d2c-b783-1ad851bf9dd0@intel.com>
 <dpxgkdqk4xlqfezu2xdig63di2nbsim3einoyf4uqytygfxttx@n32pwkzfpg2y>
 <2lm6buuc56u6awcerm4qjjphrhkdha5a4askhjnqsusj727xhu@d3l7xdlecqbt>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2lm6buuc56u6awcerm4qjjphrhkdha5a4askhjnqsusj727xhu@d3l7xdlecqbt>
X-ClientProxiedBy: MW4PR04CA0210.namprd04.prod.outlook.com
 (2603:10b6:303:86::35) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CY8PR11MB7009:EE_
X-MS-Office365-Filtering-Correlation-Id: d9fbfd56-f575-4110-835a-08dcfaafb536
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0JLOi50JK/Rwxfoy6+Tq7+oYLx1C8Sy7zHang5WDwxOXlPkut2WYPkfXRRv6?=
 =?us-ascii?Q?kb4fts487KKkchyJVj59hMajneF+UwZv4ysSvVMCmGE6rIRLuJpZI5A4N0gp?=
 =?us-ascii?Q?MkZ/M93NDjEzfjIq9k7DL6VoOTObpHL86mojrRTHSEuaC7t8YFDkNs7SiYXU?=
 =?us-ascii?Q?26XrCG4wZGsn79XEzQBDcitvB+t2MhEZ3rktCFQnALMHuJluFecPzz9hCMtD?=
 =?us-ascii?Q?FrDw9AGou1zn3c8XeNOcmkIOffkNAOrXycMWfd2WjIjpCCNFYxrKXTtH6xpd?=
 =?us-ascii?Q?zi7vsCUQW428dqPIBm3qQWr3/GHfdNzrXlBBFIZvBXJeBr9E/kAmsXp7plkK?=
 =?us-ascii?Q?fRQ7oGAFGdurIxlVGA901H+BYe5sq8Ld7sNzVmagBQVZ4xd/4SLHLxy0kHQk?=
 =?us-ascii?Q?wFk7y4CZtP5P+xGtYWS2Y46Issqgd/3yMrprHu3Q0nX52umYvuVN5xZCTJyN?=
 =?us-ascii?Q?AV1n7QChKlQliF+RbgCid3t9bEnIQTjtHdGwI7AaqWFLQROSZPxdgfq9Hxv5?=
 =?us-ascii?Q?B1KHK6+mrdQ/lZu3lDW97fSsqsghi1z7QG+5H6j469gPfFbw5xDDtscmzVZI?=
 =?us-ascii?Q?ewNdFU4bRYPqLE3cGers1S75Z8WMnEd6ZdbHsa17LJNfdp6sQqlSEemNnedG?=
 =?us-ascii?Q?YN8c+cuHNv8AJ9s7cUkCO8Gqho1EmAooi390DIgJi1h+lzNV+wNWzABC5szC?=
 =?us-ascii?Q?ttCvd679Fa5XYahhGlwLZoDhrzLacmjX2YX8zDmhVSWn/BQE6oMvMoXFPS+n?=
 =?us-ascii?Q?zfJpFf1ZGVmqR3Dr/wn7HC1P5GPfijt3jEmmOaCmsY/vuX34clUjXfZOa0kD?=
 =?us-ascii?Q?gNs+H/1hR32RWmAXnw5E6Y9e4OoTfREfPYA46QCyeCCTZ0DuOyrkNqC5hu8f?=
 =?us-ascii?Q?6fca9t1kggur5dPFpzAWOrV4aHT/TPhVEx76GHUf56tr0V7+ga0NZOvgp48+?=
 =?us-ascii?Q?tTuFJR/dRgBVtTrPv8QVmQfuSLhJqMwfE81Qz7+u8Hf+0YYR9OBP/V9cDZmg?=
 =?us-ascii?Q?jJKch34Mjv1UBX0EqHN7YsbTR2h3HtlMUpxyGKm5sHiPezKmMksxspSHWbsT?=
 =?us-ascii?Q?tIvBu21P9Y0M1nuSak4rNcRZNM6WHISVX/tWfKKAx0Op1ap38ZW2mMuLTwZ0?=
 =?us-ascii?Q?B7CrV2fIyjzFkQ8m/dO4Ql3WaXFeHPBdkpPfo5SlC4/ERygo4CxWoMpjnVO/?=
 =?us-ascii?Q?HMYwOiS2yczyKXvPlQTS048VW3XS20bz1Fyy032hGkgrcGKPvhZnuL5bIi2i?=
 =?us-ascii?Q?Z31x0Z6GGaLFY/SDeuQ+aimLRBwxbQOnXwYRKLY+DwNPeusJC8UUc0t3SE3H?=
 =?us-ascii?Q?39DzmQ95jsZp/jllCkU4KEoo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gGrdOSSSK2NLHJsfpeyinYS2+An4u0BDQxVwU01EYKh3P7c7rUTcp68kqFyk?=
 =?us-ascii?Q?KCaZ8fP+TEdxQN+6dxhsYShb82OtmjRGdRchbHSeNQExKroXM3N9wDzVY8O4?=
 =?us-ascii?Q?D5lCZDdjZB4Letj4G0ZamBy0wHj+rxDi2yodNugFOiBDSjVnoY+BSgD3A+3K?=
 =?us-ascii?Q?a2qsQvl/xSMcliZInzLbaR7akxgE4/SXJjaOvX4Y9nN+0UNMVi7CS8VRiuch?=
 =?us-ascii?Q?FeFXkftccmqRUpZ0tdzxG49tPRZTBNNbXmLIMGN9Rej7pM6yExzDDkmGY+Xh?=
 =?us-ascii?Q?iPmGxeWYzyDpG2sUyKOXJB9q2pt2oZBIXXEm//DQnX28JD8XWue36P8Alm7m?=
 =?us-ascii?Q?THg+8oYxogmwtBfLQzHZX7YTXpTaDIBgj8HDaXfShQwshiX7NbIJhy4RTQfj?=
 =?us-ascii?Q?bHnfiSdzE6uZyybaKSSdgkwDnvZCmaS4+tZW4l0+DsVVL+iBZE51PqqAI9zi?=
 =?us-ascii?Q?V8nINNlEi97iIIMaV4E33ksdTddVUUQjefgSUaGPH0sDWqxMIqMDQdrbdwDv?=
 =?us-ascii?Q?KGzyPph5LjNHg4nFJgblwG90MevfVA89pDWjVbeCp8hbWa6Ot/pUKrns2+mv?=
 =?us-ascii?Q?9st6IiumX9eH8L5978ByWIsWRTuqjkIbqHtRqNb4D3IWozHq7cVy/L7wOdcl?=
 =?us-ascii?Q?FkkL8pXuyGCinWMBglyKzwIc9J5Qx8tFW+DGxfax2Twz+WSQqJQLbimTy1Zm?=
 =?us-ascii?Q?eB8abPCx812Mz1y5+AP1rMBN9+n3/Z9KG5N+Ag5xht3f6S6ekHnfiBbJkyIv?=
 =?us-ascii?Q?Lb7s3V3Ax7PGuenQBKwRP6Z2KL3EuTltu2VybzlEpSvgeitzDlcXI/pv5rZT?=
 =?us-ascii?Q?XxL9tIc0C+y5qmBuK464RD4MnOI7QY3PPcWkEp/kf/neXdcPpoCHWBRVXUFl?=
 =?us-ascii?Q?yWLVjRLgT9zuomGk6Pm8I1L8e/SZskhxhuMnWNHMB1uB6w2TRb7l/7cE6qCQ?=
 =?us-ascii?Q?Dl6MWzkERSBhXRiQstPF+joWzGerA4RGYi1NmokEkgimea1KrVlhyMT9j/yT?=
 =?us-ascii?Q?6sgjaK6nFilx/6f8MxnxfL2KTFI/H0sMsFHceKFFiBfDmAbj+KJve1jnP5Sl?=
 =?us-ascii?Q?YgJ362qa7gUafU0xXmwSmVcNoHt/IeZOp9DQcWQAU5ofbOXi+L7SEhbrXtzf?=
 =?us-ascii?Q?kfoQLjmOmc2aZwiWmC4Oepn/ibjJW2w2ihtq3OY/swDgAjTdMdB9QemLe1+x?=
 =?us-ascii?Q?BRVc+aoSCvzKhmt3/0vbdBQoaMIN8tHKDatVOVjbVmSnhYvpvK+GKwZ2Z6KN?=
 =?us-ascii?Q?R3yeSXs7zUY0dV4lLFXBwVtOqWtRUpoq8BSn/gptyAbjtnrqoMqTxLs0fyHn?=
 =?us-ascii?Q?I8dBXwrYO6yV3TNXRiv2yPe2vIxKtgZfhqs+hJ4TpMAQTOHQZvMQ8nXQE/Iw?=
 =?us-ascii?Q?Hnk2QmQvPsWTEG9l0JX7uxaEfCS3wQu4K68azwrDHEEbNhdaySaa30RL+Dl1?=
 =?us-ascii?Q?ShsfsTkhJeSCJhSIXIb/8CORxpnnzmx03S3s/eZipu7i1rFw5wpAumdG5oWM?=
 =?us-ascii?Q?52tCXfUVXHlRxJvdJI834y2z+5bTW3O0rqxGHHCOYwoNnGAaPO2AjhE8aqW0?=
 =?us-ascii?Q?xGl1VPzBgnzmQ5G1cj73Ez9QS5o/VfIY8LmM3/HUK+eeDlLN6A8jIC9RTPVm?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9fbfd56-f575-4110-835a-08dcfaafb536
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 19:59:34.9316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rzyPItzN+NbUGZN+css+hlSPHMdQRFpUkL18RXj3PB81G3dzmPtQBg973+5tYn96ub9BZgtWZVIVZ3bKQqlEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7009
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

On Fri, Nov 01, 2024 at 02:29:58PM -0500, Lucas De Marchi wrote:
> On Fri, Nov 01, 2024 at 02:19:22PM -0500, Lucas De Marchi wrote:
> > On Fri, Nov 01, 2024 at 11:39:59AM -0700, John Harrison wrote:
> > > On 11/1/2024 08:07, Raag Jadav wrote:
> > > > On Fri, Nov 01, 2024 at 07:44:37AM -0500, Lucas De Marchi wrote:
> > > > > On Fri, Nov 01, 2024 at 07:47:54AM +0200, Raag Jadav wrote:
> > > > > > On Thu, Oct 31, 2024 at 11:29:15AM -0700, Lucas De Marchi wrote:
> > > > > > 
> > > > > > ...
> > > > > > 
> > > > > > > - * Snapshot at hang:
> > > > > > > - * The 'data' file is printed with a drm_printer pointer at devcoredump read
> > > > > > > - * time. For this reason, we need to take snapshots from when the hang has
> > > > > > > - * happened, and not only when the user is reading the file. Otherwise the
> > > > > > > - * information is outdated since the resets might have happened in between.
> > > > > > > + * The following characteristics are observed by xe when creating a device
> > > > > > > + * coredump:
> > > > > > >  *
> > > > > > > - * 'First' failure snapshot:
> > > > > > > - * In general, the first hang is the most critical one since the following hangs
> > > > > > > - * can be a consequence of the initial hang. For this reason we only take the
> > > > > > > - * snapshot of the 'first' failure and ignore subsequent calls of this function,
> > > > > > > - * at least while the coredump device is alive. Dev_coredump has a delayed work
> > > > > > > - * queue that will eventually delete the device and free all the dump
> > > > > > > - * information.
> > > > > > > + * **Snapshot at hang**:
> > > > > > > + *   The 'data' file contains a snapshot of the HW state at the time the hang
> > > > > > > + *   happened. Due to the driver recovering from resets/crashes, it may not
> > > > > > > + *   correspond to the state of when the file is read by userspace.
> > > > > > Does that mean the devcoredump will be present even after a successful recovery?
> > > > > yes.... if it's not succesful then it's moved to the wedged state. Easy
> > > > > way to test is running this:
> > > > > 
> > > > > 	xe_exec_threads --r threads-hang-basic
> > > > > 
> > > > > You should see something like this in your dmesg:
> > > > > 
> > > > > 	[IGT] xe_exec_threads: starting subtest threads-hang-basic
> > > > > 	xe 0000:00:02.0: [drm] GT0: Engine reset: engine_class=rcs, logical_mask: 0x1, guc_id=34
> > > > > 	xe 0000:00:02.0: [drm] GT0: Engine reset: engine_class=bcs, logical_mask: 0x1, guc_id=32
> > > > > 	xe 0000:00:02.0: [drm] GT1: Engine reset: engine_class=vcs, logical_mask: 0x1, guc_id=18
> > > > > 	xe 0000:00:02.0: [drm] GT0: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=34, flags=0x0 in xe_exec_threads [2636]
> > > > > 	xe 0000:00:02.0: [drm] GT1: Engine reset: engine_class=vecs, logical_mask: 0x1, guc_id=17
> > > > > 	xe 0000:00:02.0: [drm] GT1: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=18, flags=0x0 in xe_exec_threads [2636]
> > > > > 	xe 0000:00:02.0: [drm] Xe device coredump has been created
> > > > > -->	xe 0000:00:02.0: [drm] Check your /sys/class/drm/card0/device/devcoredump/data
> > > > > 	xe 0000:00:02.0: [drm] GT1: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=17, flags=0x0 in xe_exec_threads [2636]
> > > > > 	xe 0000:00:02.0: [drm] GT0: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=32, flags=0x0 in xe_exec_threads [2636]
> > > > > 	xe 0000:00:02.0: [drm] GT0: Engine reset: engine_class=ccs, logical_mask: 0x1, guc_id=27
> > > > > 	xe 0000:00:02.0: [drm] GT0: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=27, flags=0x0 in xe_exec_threads [2636]
> > > > > 	[IGT] xe_exec_threads: finished subtest threads-hang-basic, SUCCESS
> > > > > 
> > > > > 
> > > > > If you run it again, it won't overwrite the previous dump, until user
> > > > > cleans the previous dump or the timeout on the kernel side fires to
> > > > > release it.
> > > > Yes, which I think we're covering at later point in "First failure only".
> > > > So maybe establishing the mechanism itself before explaining reset/recovery
> > > > would be a bit neater...
> > > > 
> > > > > From a distro-integration pov, I think it should have a udev rule that
> > > > > fires when a devcoredump is created so the dump is copied to persistent
> > > > > storage. Just like it happens with cpu coredump (see systemd-coredump)
> > > > > 
> > > > > > Perhaps moving the 'release' part to above paragraph will add required context.
> > > > > not sure I follow. Are you suggesting to swap the order of "First
> > > > > failure only" and "Snapshot at hang" ?
> > > > ... in whichever way you think is best.
> > > Note that 'snapshot at hang' and 'first failure only' are totally
> > > separate concepts. And neither explains the release mechanism.
> > > Reversing the order of the descriptions would be incorrect, IMHO.
> > > 
> > > The point of 'snapshot at hang' is to say that the universe
> > > continues existing after the snapshot is taken. It is not just that
> > > the driver recovers but that it keeps processing new work. In an
> > > active system, it is extremely unlikely the system state (hardware
> > > or software) would match what is in the snapshot by the time the
> > > user is able to read the snapshot out. That has nothing to do with
> > > when or if the snapshot is released, nor with how many snapshots are
> > > taken.
> > > 
> > > The point of 'first failure only' is that only one snapshot is taken
> > > at a time. If there are multiple back to back hangs then only the
> > > first will generate a snapshot. Further snapshots will only be
> > > created for new hangs after the existing snapshot has been
> > > 'released'. And I'm not seeing mention of how to release the
> > > snapshot? It would be good to add a quick comment about that.
> > 
> > does this look better for y'all?

works for me...

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> trying to paste again, with whitespaces and typo fixed:
> 
> /**
>  * DOC: Xe device coredump
>  *
>  * Xe uses dev_coredump infrastructure for exposing the crash errors in a
>  * standardized way. Once a crash occurs, devcoredump exposes a temporary
>  * node under ``/sys/class/devcoredump/devcd<m>/``. The same node is also
>  * accessible in ``/sys/class/drm/card<n>/device/devcoredump/``. The
>  * ``failing_device`` symlink points to the device that crashed and created the
>  * coredump.
>  *
>  * The following characteristics are observed by xe when creating a device
>  * coredump:
>  *
>  * **Snapshot at hang**:
>  *   The 'data' file contains a snapshot of the HW state at the time the hang
>  *   happened. Due to the driver recovering from resets/crashes, it may not
>  *   correspond to the state of when the file is read by userspace.
>  *
>  * **Coredump release**:
>  *   After a coredump is generated, it stays in kernel memory until released by
>  *   userpace by writing anything to it, or after an internal timer expires. The
>  *   exact timeout may vary and should not be relied upon. Example to release
>  *   a coredump:
>  *
>  *   .. code-block:: shell
>  *
>  *      $ > /sys/class/drm/card0/device/devcoredump/data
>  *
>  * **First failure only**:
>  *   In general, the first hang is the most critical one since the following
>  *   hangs can be a consequence of the initial hang. For this reason a snapshot
>  *   is taken only for the first failure. Until the devcoredump is released by
>  *   userspace or kernel, all subsequent hangs do not override the snapshot nor
>  *   create new ones. Devcoredump has a delayed work queue that will eventually
>  *   delete the file node and free all the dump information.
>  */
> 
> Lucas De Marchi
