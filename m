Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B99C0218D
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 22:36:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F72E10E9EB;
	Thu, 30 Jan 2025 22:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZuTLlo+O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F8C10E9EB
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 22:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738276578; x=1769812578;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=J0f/DovxH4bmxQ2FgFjAaDdsqPxsdxtuQx0KdsCaeak=;
 b=ZuTLlo+O5C7hGoFCu6QetgrdQU5hNp+GjnI6vahXF1C+6HkrL3tESWHS
 vjLoutH9U4MNnvK+i9v/NBG9lvO7hKF0O7zJ5bWUfPJOxt3ZopnCABXg/
 JpBs/DIbTnvbrhz72wMUGnBOT3noZZTXuOf85NpHjtfWNLxMFN2yTAzuM
 7xLlyXQEOD1G6iHLZtObj/dP0JB96WhJbulGaUjyeNkp5OWl1PnUKsh0P
 ZZmbAPzRi0/4mHZHk78fDxCa8h7LaMjiJ10EfuZYsUplaMgYGBxEkieVL
 38SEZDoo4WE8cfAsNFtTMfByJHodQrc1haW3WvEbai95ncKyCeBAHT/93 w==;
X-CSE-ConnectionGUID: urbaqQT6Tc61WynZ6bIRDg==
X-CSE-MsgGUID: lA4X0czsRkG2TBiAEYFKrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="42767563"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="42767563"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 14:36:17 -0800
X-CSE-ConnectionGUID: ws7FSZHDTu+av7pZUa1pYw==
X-CSE-MsgGUID: FR0FlwGJR/a4kDxYwAV8sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="109416826"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 14:36:17 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 14:36:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 14:36:16 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 14:36:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knV2YUWM29ZkDd4UM9PNSPkxZufO0jCf85fsZoh9NCJBOQRMEUDRA5JzfmZVMqn4dy1GzVDUwr3nhNu8hzzo4ItrULSVSoep/4llf9nfS+bfWL3q58Tf/BtkMq9hnCJ6d7fcBjkh+T66OIW5pmaDWpAx3dYQOceTdyAkA1i0xB8w3L/T3tU14Gkir9HnGXYVxAU/qe1bw3LM0pJk58YnLvA3E8/JPhsdem4cz0wCwL9WsR1zHXIsluvyK2FJuoaEg98RDMAVCMc2L3xncZ3qKEJBy8D8KzifZyF7GkX405HUYgyqBFiJCCFtAiaOfpPy7qAwzX3RJwuF69aG7fScIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NlLXKFR0vv3FZWuw4EMZ7jgvKLNKDuD9AZEc4g7Do30=;
 b=MfAnU7m09c3XPZfpVXR+/wCqgpo7rLr8WZiSmnQpODJ0L1a/8Rm1PwwFl/FvfEOzZP0/r3jQjExv80sIxUs0iXVu/8i6d6vhwk0mS6xjZINZyv/jIgKvekLfCq4vsps4cm/lySgy2NGE779bP+cazr+LROQA7gWXZdLb8kShLlqDd4iuHWrcEzAho8FMJKey+ihevoxSDmO9L7WlfjlaQOGdd+MX9GTMaJ6BhMMJ1m16HpJ00ElZ7e16E7st2FnfJL9KzaJTfASq9O+Wewp+oCWsk1ybpMYl++vb81wNhKy/uky1ClprDIMy4iKhYBO14hqxPFxIhKCjTA3qPNNv/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by SA2PR11MB5147.namprd11.prod.outlook.com (2603:10b6:806:118::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 22:36:10 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8377.021; Thu, 30 Jan 2025
 22:36:09 +0000
Date: Thu, 30 Jan 2025 17:36:03 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v4 1/8] drm/xe: Add per-engine-class activity support
Message-ID: <Z5v-00L-GsSTye0h@intel.com>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
 <20250129101653.1976699-2-riana.tauro@intel.com>
 <Z5rHtFUIbLNRfBfk@orsosgc001> <Z5rlgedsHPm6lhSw@intel.com>
 <d2bb059f-61a3-4e5c-bd84-b8a746a10f87@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2bb059f-61a3-4e5c-bd84-b8a746a10f87@intel.com>
X-ClientProxiedBy: MW4PR03CA0121.namprd03.prod.outlook.com
 (2603:10b6:303:8c::6) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|SA2PR11MB5147:EE_
X-MS-Office365-Filtering-Correlation-Id: 8754ded7-cc88-4221-dbc2-08dd417e7e33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?oQ0axbH9DaBiLPDa6itQldiH73489YwF9vjhoFJXF6JpaEqZlVwqD4K6jU?=
 =?iso-8859-1?Q?2pSU0Yn48mbGppHzzvNF0u1DtdCyeiW0ugppBzzE9VkbrA6pQIVe+Bhi/j?=
 =?iso-8859-1?Q?/KJH7v28ZQf0r6XpRYffAAbbT/MAcBAwGRpIgrd6dHwLFwAC8Jiix3KwNx?=
 =?iso-8859-1?Q?ucwozXbhGcxhw030iYBzm7afUwQB26xmWLQM2KL7ksvnSF3zjEdRfNRwgT?=
 =?iso-8859-1?Q?/v+C84y+MT9YauzIXzKn0nFgfmiAkpRaUzDL6/Wpdg6tnm9vzbn3b1xgpy?=
 =?iso-8859-1?Q?GVp7Fa9l7RRwujx9apGcIbT0n7Z1sY4L/uFMf4dsYu7th2E/XZswyk7t0/?=
 =?iso-8859-1?Q?NPE2z3YltbRxIK/OHt+6vIPF2H5D/JnM4YNMX7opqasITHi6+Pl46MDZ/V?=
 =?iso-8859-1?Q?VP6U7eLSAjM+Y5Nmog9j7ZN7qUOelpJ/G0MqYaIAB+oGgDFmVK4bW78MhN?=
 =?iso-8859-1?Q?CSvOqELatkmKf+MaV7bvDvNK3RbDOK6ba9UClusy1wTdnbcuT6o/DnVNbU?=
 =?iso-8859-1?Q?6IW1bsrmaWtnIG2aZ0rtsaJWPF6CObtpJN7iqg/yTC9AJwHgscBtTT6UuB?=
 =?iso-8859-1?Q?UYTBPVcsD0MTm/VVcVQIj1PgsQLO4/G1MjtB2z+Uz/kIFZ18wvEzC/+qNy?=
 =?iso-8859-1?Q?wFlpA74r8jMiLkc1j0Hr9z8czXaUF+enR9DUQSY31i5rZaXJXJfKC2bjFx?=
 =?iso-8859-1?Q?YcFvNpamemh1J8y2LT0QryGWuoX8YjMJJx+a+6BQLnubxrP4zq5SEbV/qJ?=
 =?iso-8859-1?Q?yyFxJ1luDuH3XFYT4Tjl17UPIU6QJtb+oP/m9SSBEL1kHyf6VC6+BfRNg/?=
 =?iso-8859-1?Q?sdTgqQVlQVB+rJRYjnM4H4s5LPBYx1wH+2Dmnz2wxOJO0lb9KF1apoxS/o?=
 =?iso-8859-1?Q?9OaYGxfxPnT7ZPeXpUXUrsUrTN+6/KMpotY2E0Gkj+Im4m8Kt5ykZWz1MZ?=
 =?iso-8859-1?Q?TN/kdM1GE45Rem8k6V2zDVNWy8te1mkUKGMBGC9Q4qXmqBcTkfRIrmFozF?=
 =?iso-8859-1?Q?dPL3+sK+gG7J6fTiVFej2dFZXKXJ9VAz4uoSNTjcFHYEnrgrQncjOPl3NA?=
 =?iso-8859-1?Q?heU9aNwCpwzK6vP+npH1RuWaPSZTnWuuEM2ukbGBf3ixs2eF1jlYKzHMxt?=
 =?iso-8859-1?Q?Q1Cfyn4Ft6tlOQNbSN9ae8/iTLOojRTqKewoQvAGzjEV6E1BUN2+iij3iA?=
 =?iso-8859-1?Q?xzA70C2kDmtBECGwM5QwR7h/8JPW5wxAOMW006/myfqIgqtntQ2TV2RNL8?=
 =?iso-8859-1?Q?vQRl/ZnjQKkl5ikamq33O3D1eCqrbVWQEzwAMLp2XNc+lCr6+l1zX4aGie?=
 =?iso-8859-1?Q?IA/zBJHzFUG1BlukztWHJb76IIyVS3qReLHLxK5jfSL3cazpkksyA2rpii?=
 =?iso-8859-1?Q?d2HUmSQWCA9FJO0uP1lPfOWtaCvSNweQMYp7dWO7/P3paSkkxjcthetWId?=
 =?iso-8859-1?Q?+6/xZ+DsmcGszbQ5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?r/NbV3drSBq/fIXAQZnzqZ3Ql7rJuXuKMxgoUhYwfVZq7RORLV0z+cMfy2?=
 =?iso-8859-1?Q?gqEpqzPy6x8hOXgBlOtAqLeRbYfb04UnLMLO/DlhSEj3VJwi03yOIW/ru6?=
 =?iso-8859-1?Q?dY3gK30k0vZYYE8Aock7UJaT8Fy4F1okqPp1mbuCYMTO1lBMJ9kavs70v6?=
 =?iso-8859-1?Q?zgIqAoTO00hUNJh+afyGwOtiFiUc0P980IwxdIaGoQh4frXgj6vmW+zwDk?=
 =?iso-8859-1?Q?BVHSOZWKLsgEQGapE6iwWt9I3PKZEbZpnVq8c48AQK3lrZNBO2QojArltU?=
 =?iso-8859-1?Q?HV1OVxH45K3/3jXCxjbkYl55hpQi04f/gBE99+hSEUX5bzvX3CHyNEFTyV?=
 =?iso-8859-1?Q?RDyeliVAJyGHWgIRZXbLAf3IY8uL3/i9fGupeq5Au4RYE5dfEgfaqXC2wo?=
 =?iso-8859-1?Q?e4VaU2LC4Jzq4+ygPCfE4x4MHGzT8aP0knDOdrAOVgSvco9QSIMAP9/n++?=
 =?iso-8859-1?Q?1TN9KMrNnmYjnQ2cSjWvjwXDBav2enpE3sZEFKk7PPjSjrgLjNcXGEOe3Y?=
 =?iso-8859-1?Q?oBV6TfSVEu/TBBlVjbCrbjQ9Yqf/uhVWMqQtDZSwXvM76VUKOKcnClhfyi?=
 =?iso-8859-1?Q?AC+Z29zrVKe9yHe9L6vtP9KgLEFHyMwc8gR+1Jk7FQFBQn0YmJoEc9oF51?=
 =?iso-8859-1?Q?13LhPjHJGfCnpNXbunym49M8lKbqy5+/fxDNT3zUFwORtILXFZ0Q5cc6oY?=
 =?iso-8859-1?Q?IU+5QflhdWFbNl+PLxXfhWXX3+s89HXy/mvvvCXZ5YT8LPfqbZgNAS4UCJ?=
 =?iso-8859-1?Q?xD0YoeuPyLjS3X1/OZP/GJnApNyiRFidQKx87CKlbeSiYuH8h7CJZCoFIn?=
 =?iso-8859-1?Q?sr0UcoixUKYEoqmGZ+E3na/WZq5ZAJ0Vu9Up40wxFdqqHR+OHlGi0eLVCF?=
 =?iso-8859-1?Q?UHhXTw4/z0si64QUnBW8xujxqqNsTcipj9wa9Aw4qL8m/einqaxtkaseMi?=
 =?iso-8859-1?Q?EUTPSn4XZAGmwF897kjz+9BOI4kk5v0MUDi6eDUqWHN+qUp+x7geivirKv?=
 =?iso-8859-1?Q?riTMxrJgWV+DMERzrGpGE6zRc45YuiKUHY4EPqwUEpIivxz+v/xKbs7QJ/?=
 =?iso-8859-1?Q?pD4gLrQYSeMHdec3yZ92C0d4txeIz13aZF6cBptcB60rNft53MOhQ9g8f9?=
 =?iso-8859-1?Q?x2fa3Wt0RiiW3lD5kKfbE8jv0V5J0ZsRE5UI9NfGzrlx9JeaxlCNa8sudg?=
 =?iso-8859-1?Q?OxmL7N/h6O62L4+W/5Mh11UtQyemytXTLpwPIHof6XoYiug90SSQ85ZJ2V?=
 =?iso-8859-1?Q?m73h2y9I4eBPs7+UlxgrCKO1LR6m8uC+z4+MrfTl8T6eNI1IKZWGW7/jo1?=
 =?iso-8859-1?Q?NlniE+ZRhlxEGIoyeP89QhBxmktVn5Vi7OBU+h28e4GWinA+PERg4QK5H9?=
 =?iso-8859-1?Q?e7ZCQvjJRwCr3NPw65UdZQc4qnFIbl1ru1vlxGj4kl/bBLljwD+drSkiPM?=
 =?iso-8859-1?Q?9PvdsjWTUIAaeqMEMFtAUAiL+KGbNwTgWSRHVm3lb+3Kvt10wv6RcdblON?=
 =?iso-8859-1?Q?f8JfSkKzjfxvIxVfD0t5OlhEg3M2zmv/i8GkcvRo6DGJm5B9/QtCVtSYFm?=
 =?iso-8859-1?Q?kQCdkgcg+i7VUfNZ5L9uGiS+tZSMj2azQCdqsEGOUiNHJv1zSIaOWPas7i?=
 =?iso-8859-1?Q?q1gAgijYqXxfKxcjuTFgJEJjMZ/I8gSTNpb0YwyGrErVq2xX5g/D/E2w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8754ded7-cc88-4221-dbc2-08dd417e7e33
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 22:36:09.8717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHYKOPlowQPNweXEUjNC98ZsLfLSOEj43dUo8Qop4sWuQkHMib1za9NtESCivtFIahcd/saSOECl+in0DgKRfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5147
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

On Thu, Jan 30, 2025 at 10:19:24AM +0530, Riana Tauro wrote:
> Hi Umesh/Rodrigo
> 
> On 1/30/2025 8:05 AM, Rodrigo Vivi wrote:
> > On Wed, Jan 29, 2025 at 04:28:36PM -0800, Umesh Nerlige Ramappa wrote:
> > > On Wed, Jan 29, 2025 at 03:46:44PM +0530, Riana Tauro wrote:
> > > > GuC provides support to read engine counters to calculate the
> > > > engine activity. KMD exposes two counters via the PMU interface to
> > > > calculate engine activity
> > > > 
> > > > Engine Active Ticks(engine-active-ticks) - number of active ticks for engine
> > > > Engine Total Ticks (engine-total-ticks) - total ticks of engine
> > > > 
> > > > Engine activity percentage can be calculated as below
> > > > Engine activity % = (engine active ticks/engine total ticks) * 100.
> > > > 
> > > > v2: fix cosmetic review comments
> > > >     add forcewake for gpm_ts (Umesh)
> > > > 
> > > > v3: fix CI hooks error
> > > >     change function parameters and unpin bo on error
> > > >     of allocate_activity_buffers
> > > >     fix kernel-doc (Umesh)
> > > >     use engine activity (Umesh, Lucas)
> > > >     rename xe_engine_activity to xe_guc_engine_*
> > > >     fix commit message to use per-engine class(Lucas)
> > > > 
> > > > v4: remove forcewake as engine is already running
> > > >     when reading gpm timestamp
> > > 
> > > + Rodrigo
> > > 
> > > Sorry, I think I mentioned offline that the runtime pm get is sufficient for
> > > reading this register, but it's not. It does need a forcewake of the GT
> > > domain.  At the same time, we cannot use the xe_force_wake_get because of
> > > the lockdep issue you mentioned and also I assume that xe_force_wake_get may
> > > sleep and the event may be read from irq context.
> The lockdep issue is due to perf holding a raw_spinlock and forcewake having
> a spinlock. In 6.13 due to config PROVE_RAW_LOCK_NESTING being enabled was
> seeing this issue. Latest patch has disabled this due to issues with i915.
> 
> [  465.359017] =============================
> [  465.363050] [ BUG: Invalid wait context ]
> [  465.367063] 6.13.0-rc5-xe #11 Tainted: G     U
> [  465.372544] -----------------------------
> [  465.376555] swapper/0/0 is trying to lock:
> [  465.380652] ffff88810d5b8098 (&fw->lock){....}-{3:3}, at:
> xe_force_wake_get+0x1f9/0x8c0 [xe]
> [  465.389168] other info that might help us debug this:
> [  465.394221] context-{5:5}
> [  465.396847] 1 lock held by swapper/0/0:
> [  465.400682]  #0: ffff88885f031fb8 (&cpuctx_lock){....}-{2:2}, at:
> __perf_event_read+0x60/0x230
> [  465.409295] stack backtrace:


hmmm I had forgotten about this...

Lucas, since you were the last one that looked into it,
would be feasible to switch at least the xe_force_wake towards
raw_spinlock?


> 
> 
> Since in this case we are checking mmio only when engine is running
> and gt will be active. i thought we could remove it.
> 
> >>> +	if (ea->running) {
> >>> +		gpm_ts = xe_mmio_read64_2x32(&gt->mmio, MISC_STATUS_0) >>
> >>> +			 engine_activity->gpm_timestamp_shift;
> >>> +		ea->active = lower_32_bits(gpm_ts) -
> cached_activity->last_update_tick;
> >>> +	}
> 
> But yeah, gt might enter c6 just after reading ea->running. To avoid this,as
> lucas suggested have to use hr timer.
> 
> I thought if needed, will add it as part of a separate series.
> I can add the forcewake back as the config is removed and add hr timer in
> another series.
> 
> Thanks
> Riana
> > 
> > I don't understand this statement entirely. force wake get cannot sleep.
> > It is based on spin locks. It should not be issuing any lockdep here.
> > It is quite simple flow with minimal or none interdependency. Remember
> > that in i915 for instance it exists and lives in the middle of every
> > mmio read and write call...
> > 
> > > 
> > > I would check if we can add a helper xe_force_wake_get_if_active() and just
> > > use that to bump up the wakeref.
> > 
> > I would prefer to not complicate things...
> > 
> > > 
> > > @Rodrigo, @Vinay Any thoughts on this ^ ?
> > 
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > 
> > > 
> > > Thanks,
> > > Umesh
> > > 
> > > > 
> > > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > > Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/Makefile                   |   1 +
> > > > drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
> > > > drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
> > > > drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 317 ++++++++++++++++++
> > > > drivers/gpu/drm/xe/xe_guc_engine_activity.h   |  18 +
> > > > .../gpu/drm/xe/xe_guc_engine_activity_types.h |  89 +++++
> > > > drivers/gpu/drm/xe/xe_guc_fwif.h              |  19 ++
> > > > drivers/gpu/drm/xe/xe_guc_types.h             |   4 +
> > > > 8 files changed, 451 insertions(+)
> > > > create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.c
> > > > create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.h
> > > > create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > > index 328aff36831b..7e93461c60bd 100644
> > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > @@ -33,6 +33,7 @@ xe-y += xe_bb.o \
> > > > 	xe_device_sysfs.o \
> > > > 	xe_dma_buf.o \
> > > > 	xe_drm_client.o \
> > > > +	xe_guc_engine_activity.o \
> > > > 	xe_exec.o \
> > > > 	xe_execlist.o \
> > > > 	xe_exec_queue.o \
> > > > diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > > index fee385532fb0..ec516e838ee8 100644
> > > > --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > > +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > > @@ -140,6 +140,7 @@ enum xe_guc_action {
> > > > 	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
> > > > 	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
> > > > 	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
> > > > +	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
> > > > 	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
> > > > 	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
> > > > 	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
> > > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > > index 096859072396..124cc398798e 100644
> > > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > > @@ -358,6 +358,8 @@
> > > > #define   RENDER_AWAKE_STATUS			REG_BIT(1)
> > > > #define   MEDIA_SLICE0_AWAKE_STATUS		REG_BIT(0)
> > > > 
> > > > +#define MISC_STATUS_0				XE_REG(0xa500)
> > > > +
> > > > #define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
> > > > #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
> > > > #define FORCEWAKE_GSC				XE_REG(0xa618)
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> > > > new file mode 100644
> > > > index 000000000000..088209b9c228
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> > > > @@ -0,0 +1,317 @@
> > > > +// SPDX-License-Identifier: MIT
> > > > +/*
> > > > + * Copyright © 2025 Intel Corporation
> > > > + */
> > > > +#include "xe_guc_engine_activity.h"
> > > > +
> > > > +#include "abi/guc_actions_abi.h"
> > > > +#include "regs/xe_gt_regs.h"
> > > > +
> > > > +#include "xe_bo.h"
> > > > +#include "xe_force_wake.h"
> > > > +#include "xe_gt_printk.h"
> > > > +#include "xe_guc.h"
> > > > +#include "xe_guc_ct.h"
> > > > +#include "xe_hw_engine.h"
> > > > +#include "xe_map.h"
> > > > +#include "xe_mmio.h"
> > > > +
> > > > +#define TOTAL_QUANTA 0x8000
> > > > +
> > > > +static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_engine *hwe)
> > > > +{
> > > > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
> > > > +	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
> > > > +	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
> > > > +	size_t offset = 0;
> > > > +
> > > > +	offset = offsetof(struct guc_engine_activity_data,
> > > > +			  engine_activity[guc_class][hwe->logical_instance]);
> > > > +
> > > > +	return IOSYS_MAP_INIT_OFFSET(&buffer->activity_bo->vmap, offset);
> > > > +}
> > > > +
> > > > +static struct iosys_map engine_metadata_map(struct xe_guc *guc)
> > > > +{
> > > > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
> > > > +	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
> > > > +
> > > > +	return buffer->metadata_bo->vmap;
> > > > +}
> > > > +
> > > > +static int allocate_engine_activity_group(struct xe_guc *guc)
> > > > +{
> > > > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
> > > > +	u32 num_activity_group = 1;
> > > > +
> > > > +	engine_activity->eag = kmalloc_array(num_activity_group,
> > > > +					     sizeof(struct engine_activity_group),
> > > > +					     GFP_KERNEL);
> > > > +
> > > > +	if (!engine_activity->eag)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	memset(engine_activity->eag, 0, num_activity_group * sizeof(struct engine_activity_group));
> > > > +	engine_activity->num_activity_group = num_activity_group;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int allocate_engine_activity_buffers(struct xe_guc *guc,
> > > > +					    struct engine_activity_buffer *buffer)
> > > > +{
> > > > +	u32 metadata_size = sizeof(struct guc_engine_activity_metadata);
> > > > +	u32 size = sizeof(struct guc_engine_activity_data);
> > > > +	struct xe_gt *gt = guc_to_gt(guc);
> > > > +	struct xe_tile *tile = gt_to_tile(gt);
> > > > +	struct xe_bo *bo, *metadata_bo;
> > > > +
> > > > +	metadata_bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, PAGE_ALIGN(metadata_size),
> > > > +						   XE_BO_FLAG_SYSTEM |
> > > > +						   XE_BO_FLAG_GGTT |
> > > > +						   XE_BO_FLAG_GGTT_INVALIDATE);
> > > > +	if (IS_ERR(metadata_bo))
> > > > +		return PTR_ERR(metadata_bo);
> > > > +
> > > > +	bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, PAGE_ALIGN(size),
> > > > +					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > > > +					  XE_BO_FLAG_GGTT |
> > > > +					  XE_BO_FLAG_GGTT_INVALIDATE);
> > > > +
> > > > +	if (IS_ERR(bo)) {
> > > > +		xe_bo_unpin_map_no_vm(metadata_bo);
> > > > +		return PTR_ERR(bo);
> > > > +	}
> > > > +
> > > > +	buffer->metadata_bo = metadata_bo;
> > > > +	buffer->activity_bo = bo;
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
> > > > +{
> > > > +	struct xe_guc *guc = &hwe->gt->uc.guc;
> > > > +	struct engine_activity_group *eag = &guc->engine_activity.eag[0];
> > > > +	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
> > > > +
> > > > +	return &eag->engine[guc_class][hwe->logical_instance];
> > > > +}
> > > > +
> > > > +static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 freq)
> > > > +{
> > > > +	return mul_u64_u32_div(ns, freq, NSEC_PER_SEC);
> > > > +}
> > > > +
> > > > +#define read_engine_activity_record(xe_, map_, field_) \
> > > > +	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity, field_)
> > > > +
> > > > +#define read_metadata_record(xe_, map_, field_) \
> > > > +	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity_metadata, field_)
> > > > +
> > > > +static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
> > > > +{
> > > > +	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
> > > > +	struct guc_engine_activity *cached_activity = &ea->activity;
> > > > +	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
> > > > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
> > > > +	struct iosys_map activity_map, metadata_map;
> > > > +	struct xe_device *xe =  guc_to_xe(guc);
> > > > +	struct xe_gt *gt = guc_to_gt(guc);
> > > > +	u32 last_update_tick, global_change_num;
> > > > +	u64 active_ticks, gpm_ts;
> > > > +	u16 change_num;
> > > > +
> > > > +	activity_map = engine_activity_map(guc, hwe);
> > > > +	metadata_map = engine_metadata_map(guc);
> > > > +	global_change_num = read_metadata_record(xe, &metadata_map, global_change_num);
> > > > +
> > > > +	/* GuC has not initialized activity data yet, return 0 */
> > > > +	if (!global_change_num)
> > > > +		goto update;
> > > > +
> > > > +	if (global_change_num == cached_metadata->global_change_num)
> > > > +		goto update;
> > > > +	else
> > > > +		cached_metadata->global_change_num = global_change_num;
> > > > +
> > > > +	change_num = read_engine_activity_record(xe, &activity_map, change_num);
> > > > +
> > > > +	if (!change_num || change_num == cached_activity->change_num)
> > > > +		goto update;
> > > > +
> > > > +	/* read engine activity values */
> > > > +	last_update_tick = read_engine_activity_record(xe, &activity_map, last_update_tick);
> > > > +	active_ticks = read_engine_activity_record(xe, &activity_map, active_ticks);
> > > > +
> > > > +	/* activity calculations */
> > > > +	ea->running = !!last_update_tick;
> > > > +	ea->total += active_ticks - cached_activity->active_ticks;
> > > > +	ea->active = 0;
> > > > +
> > > > +	/* cache the counter */
> > > > +	cached_activity->change_num = change_num;
> > > > +	cached_activity->last_update_tick = last_update_tick;
> > > > +	cached_activity->active_ticks = active_ticks;
> > > > +
> > > > +update:
> > > > +	if (ea->running) {
> > > > +		gpm_ts = xe_mmio_read64_2x32(&gt->mmio, MISC_STATUS_0) >>
> > > > +			 engine_activity->gpm_timestamp_shift;
> > > > +		ea->active = lower_32_bits(gpm_ts) - cached_activity->last_update_tick;
> > > > +	}
> > > > +
> > > > +	return ea->total + ea->active;
> > > > +}
> > > > +
> > > > +static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
> > > > +{
> > > > +	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
> > > > +	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
> > > > +	struct guc_engine_activity *cached_activity = &ea->activity;
> > > > +	struct iosys_map activity_map, metadata_map;
> > > > +	struct xe_device *xe = guc_to_xe(guc);
> > > > +	ktime_t now, cpu_delta;
> > > > +	u64 numerator;
> > > > +	u16 quanta_ratio;
> > > > +
> > > > +	activity_map = engine_activity_map(guc, hwe);
> > > > +	metadata_map = engine_metadata_map(guc);
> > > > +
> > > > +	if (!cached_metadata->guc_tsc_frequency_hz)
> > > > +		cached_metadata->guc_tsc_frequency_hz = read_metadata_record(xe, &metadata_map,
> > > > +									     guc_tsc_frequency_hz);
> > > > +
> > > > +	quanta_ratio = read_engine_activity_record(xe, &activity_map, quanta_ratio);
> > > > +	cached_activity->quanta_ratio = quanta_ratio;
> > > > +
> > > > +	/* Total ticks calculations */
> > > > +	now = ktime_get();
> > > > +	cpu_delta = now - ea->last_cpu_ts;
> > > > +	ea->last_cpu_ts = now;
> > > > +	numerator = (ea->quanta_remainder_ns + cpu_delta) * cached_activity->quanta_ratio;
> > > > +	ea->quanta_ns += numerator / TOTAL_QUANTA;
> > > > +	ea->quanta_remainder_ns = numerator % TOTAL_QUANTA;
> > > > +	ea->quanta = cpu_ns_to_guc_tsc_tick(ea->quanta_ns, cached_metadata->guc_tsc_frequency_hz);
> > > > +
> > > > +	return ea->quanta;
> > > > +}
> > > > +
> > > > +static int enable_engine_activity_stats(struct xe_guc *guc)
> > > > +{
> > > > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
> > > > +	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
> > > > +	u32 metadata_ggtt_addr = xe_bo_ggtt_addr(buffer->metadata_bo);
> > > > +	u32 ggtt_addr = xe_bo_ggtt_addr(buffer->activity_bo);
> > > > +	int len = 0;
> > > > +	u32 action[5];
> > > > +
> > > > +	action[len++] = XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER;
> > > > +	action[len++] = metadata_ggtt_addr;
> > > > +	action[len++] = 0;
> > > > +	action[len++] = ggtt_addr;
> > > > +	action[len++] = 0;
> > > > +
> > > > +	/* Blocking here to ensure the buffers are ready before reading them */
> > > > +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
> > > > +}
> > > > +
> > > > +static void engine_activity_set_cpu_ts(struct xe_guc *guc)
> > > > +{
> > > > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
> > > > +	struct engine_activity_group *eag = &engine_activity->eag[0];
> > > > +	int i, j;
> > > > +
> > > > +	for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
> > > > +		for (j = 0; j < GUC_MAX_INSTANCES_PER_CLASS; j++)
> > > > +			eag->engine[i][j].last_cpu_ts = ktime_get();
> > > > +}
> > > > +
> > > > +static u32 gpm_timestamp_shift(struct xe_gt *gt)
> > > > +{
> > > > +	u32 reg;
> > > > +
> > > > +	reg = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
> > > > +
> > > > +	return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_guc_engine_activity_active_ticks - Get engine active ticks
> > > > + * @hwe: The hw_engine object
> > > > + *
> > > > + * Return: accumulated ticks @hwe was active since engine activity stats were enabled.
> > > > + */
> > > > +u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe)
> > > > +{
> > > > +	struct xe_guc *guc =  &hwe->gt->uc.guc;
> > > > +
> > > > +	return get_engine_active_ticks(guc, hwe);
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_guc_engine_activity_total_ticks - Get engine total ticks
> > > > + * @hwe: The hw_engine object
> > > > + *
> > > > + * Return: accumulated quanta of ticks allocated for the engine
> > > > + */
> > > > +u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe)
> > > > +{
> > > > +	struct xe_guc *guc =  &hwe->gt->uc.guc;
> > > > +
> > > > +	return get_engine_total_ticks(guc, hwe);
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_guc_engine_activity_enable_stats - Enable engine activity stats
> > > > + * @guc: The GuC object
> > > > + *
> > > > + * Enable engine activity stats and set initial timestamps
> > > > + */
> > > > +void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	ret = enable_engine_activity_stats(guc);
> > > > +	if (ret)
> > > > +		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
> > > > +	else
> > > > +		engine_activity_set_cpu_ts(guc);
> > > > +}
> > > > +
> > > > +static void engine_activity_fini(void *arg)
> > > > +{
> > > > +	struct xe_guc_engine_activity *engine_activity = arg;
> > > > +
> > > > +	kfree(engine_activity->eag);
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_guc_engine_activity_init - Initialize the engine activity data
> > > > + * @guc: The GuC object
> > > > + *
> > > > + * Return: 0 on success, negative error code otherwise.
> > > > + */
> > > > +int xe_guc_engine_activity_init(struct xe_guc *guc)
> > > > +{
> > > > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
> > > > +	struct xe_gt *gt = guc_to_gt(guc);
> > > > +	int ret;
> > > > +
> > > > +	ret = allocate_engine_activity_group(guc);
> > > > +	if (ret) {
> > > > +		xe_gt_err(gt, "failed to allocate activity group %d\n", ret);
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	ret = allocate_engine_activity_buffers(guc, &engine_activity->device_buffer);
> > > > +	if (ret) {
> > > > +		xe_gt_err(gt, "failed to allocate activity buffers%d\n", ret);
> > > > +		kfree(engine_activity->eag);
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	engine_activity->gpm_timestamp_shift = gpm_timestamp_shift(gt);
> > > > +
> > > > +	return devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, engine_activity_fini,
> > > > +					engine_activity);
> > > > +}
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
> > > > new file mode 100644
> > > > index 000000000000..c00f3da5513d
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
> > > > @@ -0,0 +1,18 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +/*
> > > > + * Copyright © 2025 Intel Corporation
> > > > + */
> > > > +
> > > > +#ifndef _XE_GUC_ENGINE_ACTIVITY_H_
> > > > +#define _XE_GUC_ENGINE_ACTIVITY_H_
> > > > +
> > > > +#include <linux/types.h>
> > > > +
> > > > +struct xe_hw_engine;
> > > > +struct xe_guc;
> > > > +
> > > > +int xe_guc_engine_activity_init(struct xe_guc *guc);
> > > > +void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
> > > > +u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe);
> > > > +u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe);
> > > > +#endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
> > > > new file mode 100644
> > > > index 000000000000..a2ab327d3eec
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
> > > > @@ -0,0 +1,89 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +/*
> > > > + * Copyright © 2025 Intel Corporation
> > > > + */
> > > > +
> > > > +#ifndef _XE_GUC_ENGINE_ACTIVITY_TYPES_H_
> > > > +#define _XE_GUC_ENGINE_ACTIVITY_TYPES_H_
> > > > +
> > > > +#include <linux/types.h>
> > > > +
> > > > +#include "xe_guc_fwif.h"
> > > > +/**
> > > > + * struct engine_activity - Engine specific activity data
> > > > + *
> > > > + * Contains engine specific activity data and snapshot of the
> > > > + * structures from GuC
> > > > + */
> > > > +struct engine_activity {
> > > > +	/** @active: current activity */
> > > > +	u64 active;
> > > > +
> > > > +	/** @last_cpu_ts: cpu timestamp in nsec of previous sample */
> > > > +	u64 last_cpu_ts;
> > > > +
> > > > +	/** @quanta: total quanta used on HW */
> > > > +	u64 quanta;
> > > > +
> > > > +	/** @quanta_ns: total quanta_ns used on HW */
> > > > +	u64 quanta_ns;
> > > > +
> > > > +	/**
> > > > +	 * @quanta_remainder_ns: remainder when the CPU time is scaled as
> > > > +	 * per the quanta_ratio. This remainder is used in subsequent
> > > > +	 * quanta calculations.
> > > > +	 */
> > > > +	u64 quanta_remainder_ns;
> > > > +
> > > > +	/** @total: total engine activity */
> > > > +	u64 total;
> > > > +
> > > > +	/** @running: true if engine is running some work */
> > > > +	bool running;
> > > > +
> > > > +	/** @metadata: snapshot of engine activity metadata */
> > > > +	struct guc_engine_activity_metadata metadata;
> > > > +
> > > > +	/** @activity: snapshot of engine activity counter */
> > > > +	struct guc_engine_activity activity;
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct engine_activity_group - Activity data for all engines
> > > > + */
> > > > +struct engine_activity_group {
> > > > +	/** @engine: engine specific activity data */
> > > > +	struct engine_activity engine[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct engine_activity_buffer - engine activity buffers
> > > > + *
> > > > + * This contains the buffers allocated for metadata and activity data
> > > > + */
> > > > +struct engine_activity_buffer {
> > > > +	/** @activity_bo: object allocated to hold activity data */
> > > > +	struct xe_bo *activity_bo;
> > > > +
> > > > +	/** @metadata_bo: object allocated to hold activity metadata */
> > > > +	struct xe_bo *metadata_bo;
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct xe_guc_engine_activity - Data used by engine activity implementation
> > > > + */
> > > > +struct xe_guc_engine_activity {
> > > > +	/** @gpm_timestamp_shift: Right shift value for the gpm timestamp */
> > > > +	u32 gpm_timestamp_shift;
> > > > +
> > > > +	/** @num_activity_group: number of activity groups */
> > > > +	u32 num_activity_group;
> > > > +
> > > > +	/** @eag: holds the device level engine activity data */
> > > > +	struct engine_activity_group *eag;
> > > > +
> > > > +	/** @device_buffer: buffer object for global engine activity */
> > > > +	struct engine_activity_buffer device_buffer;
> > > > +};
> > > > +#endif
> > > > +
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > > index 057153f89b30..6f57578b07cb 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > > @@ -208,6 +208,25 @@ struct guc_engine_usage {
> > > > 	struct guc_engine_usage_record engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
> > > > } __packed;
> > > > 
> > > > +/* Engine Activity stats */
> > > > +struct guc_engine_activity {
> > > > +	u16 change_num;
> > > > +	u16 quanta_ratio;
> > > > +	u32 last_update_tick;
> > > > +	u64 active_ticks;
> > > > +} __packed;
> > > > +
> > > > +struct guc_engine_activity_data {
> > > > +	struct guc_engine_activity engine_activity[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
> > > > +} __packed;
> > > > +
> > > > +struct guc_engine_activity_metadata {
> > > > +	u32 guc_tsc_frequency_hz;
> > > > +	u32 lag_latency_usec;
> > > > +	u32 global_change_num;
> > > > +	u32 reserved;
> > > > +} __packed;
> > > > +
> > > > /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
> > > > enum xe_guc_recv_message {
> > > > 	XE_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> > > > index 573aa6308380..63bac64429a5 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> > > > @@ -13,6 +13,7 @@
> > > > #include "xe_guc_ads_types.h"
> > > > #include "xe_guc_buf_types.h"
> > > > #include "xe_guc_ct_types.h"
> > > > +#include "xe_guc_engine_activity_types.h"
> > > > #include "xe_guc_fwif.h"
> > > > #include "xe_guc_log_types.h"
> > > > #include "xe_guc_pc_types.h"
> > > > @@ -103,6 +104,9 @@ struct xe_guc {
> > > > 	/** @relay: GuC Relay Communication used in SR-IOV */
> > > > 	struct xe_guc_relay relay;
> > > > 
> > > > +	/** @engine_activity: Device specific engine activity */
> > > > +	struct xe_guc_engine_activity engine_activity;
> > > > +
> > > > 	/**
> > > > 	 * @notify_reg: Register which is written to notify GuC of H2G messages
> > > > 	 */
> > > > -- 
> > > > 2.47.1
> > > > 
> 
