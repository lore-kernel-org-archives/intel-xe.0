Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB32C30653
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jul 2024 15:18:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F71910E90E;
	Wed,  3 Jul 2024 15:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Phoq33+r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CD710E924
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jul 2024 15:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720019932; x=1751555932;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zQToHaPlQnax/RXH5TA/uZ718Y5zrOTAQt3ZvrTwxfY=;
 b=Phoq33+rP7YelNRKw4DJR1eDMRt8HjJVG/rH5238xkkrSDetfLQkuoBY
 qtmNEas/z8HiEKwfBZ5SwCmMyg9a5OL+qqU10x7XKkZjZJNTBMoMj7o+y
 RI/KD8XQjahZZq/HNgXnWuXqv32ITetE6UEUIoIQ4dKT0R6wz3g5B2P2T
 OBVp4Iigg4gwf6tue+nTrufeH2qf3DdaQHYDwQ+8OrOkyIVGvjsu0y9xw
 GfrD2Mrk2fF+JWwp8az3HtVfIzFfFUNFphy2NBnEwxsGpjDH2HA1tDu5n
 675n5Dh4w7zCfGtr0M9AJklLhFIgL9l99VHQ2L9PYWFpf9yqgQW10Obpp A==;
X-CSE-ConnectionGUID: X/U7Uw0TS0qC79mOC29ymQ==
X-CSE-MsgGUID: Cvu4KtS+SFSeDvj+MTTJqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="27931681"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="27931681"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 08:18:51 -0700
X-CSE-ConnectionGUID: Og8QHF1ZQrm5hfzHh4Djxw==
X-CSE-MsgGUID: viXHGYSHTGW1MPsfv3i0Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="50597316"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jul 2024 08:18:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 08:18:50 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 08:18:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 3 Jul 2024 08:18:50 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 3 Jul 2024 08:18:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3y1h9cJ4NRVikF3IsiThMZUR04U+bH0N1hfd6BLJoKxSceUMsFEQkTR8Ark05404sUmxatinERGIDCKxOxvTYiTSD48DTbbhLNcksCfLNNTKVUHAhgEfRuQ2GM2GZ4cvr65wrvpJJA+I4SfNnDjZCAbKoR5Zv74mfxES9e7Lg+9+FddTqqVlb1DfQtfGWdWb4GA3AX/8ejSoVlYx7RCSzN36nl9TcQFhqzx5XfjZrZrzI9PG69jg4BJH1Eif/x0bevnLMPACQ/KyOSmAoOQ9Y9/CAQlKX22wDzS9zLWx3Q4C6DjqpwWLrpZ6R7gVlhWy9LBw/asYWLdn6hEtwcfzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtZCffW5TNrqmCXJ1Q3L/am4LPzQ2SmL74h6zChYp5I=;
 b=oZu1O8zcFxHs6t0EDq6jpDyukt9IZtM92qdI1qObylqu3pw17vjD5fqh446AtgPZjFaXjsHo6Xw04UuobSiQpTxjCi45KHaI3VRs4sEJkndTKmaEKdX2m0gva2DvAQed1+2nB+fFvLmtWzT2o3B44BpOtmA3EzzvMOHJvY5PrEwFUmiJ8uj5MbozoL4+G/FBBpSFX/t1M/6s8746qn3DntOGazlks4ocnRsR9cg4S8xTOZKCt+In3rJIrDjokbm3N7Xjr2XBlTGrXgv20zBoUrAXUozUgLqLN8lxBKxBCkRnk32k+uf2bRNyINaIDEobi3uQMg0TlX1tHAZ9ck/bCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DM4PR11MB5279.namprd11.prod.outlook.com (2603:10b6:5:38a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Wed, 3 Jul
 2024 15:18:45 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7741.017; Wed, 3 Jul 2024
 15:18:45 +0000
Date: Wed, 3 Jul 2024 11:18:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Jose Souza <jose.souza@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Rename xe perf layer as xe observation layer
Message-ID: <ZoVrzax6rUmzC2qH@intel.com>
References: <20240702214034.2507446-1-ashutosh.dixit@intel.com>
 <87sewra2jd.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87sewra2jd.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0064.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::9) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DM4PR11MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: 3706d06c-a178-46b0-e5cd-08dc9b736de8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V58AZT5B8IJAjZvTEeYfUIoZgH5C4pT7sH02XJFGKza/6d3EkGUzPG0J88k1?=
 =?us-ascii?Q?GDADoTO4Ryj4mAlqtAzYRk/4FzyG8g6NsEVmwH/u3o1Ur0cGg351vVHqxobb?=
 =?us-ascii?Q?qmLiLToGx+FUMwjjIi/U7txhtwLDd1RaQuY6Gqs8h6VthWJCrZUgjXl1VCNn?=
 =?us-ascii?Q?Y2IAioyXllvZJ6mrjq8NCZYOoD9AK9eAjA3WMeYsCupSu9bTxuZQ1IPUz47E?=
 =?us-ascii?Q?g0csMGuaAEZ/12771hYxD1uocEAug7CEKgkwey+3EJrPL2p74rWYBE5KR6dj?=
 =?us-ascii?Q?CpBnKL6RcZt/jEJiZ18xSbMAun4Yv5rh41hzvv7tn8XcBQQMiQ5y084L1lYv?=
 =?us-ascii?Q?lWRIzIrFosXQNFB+AY8TGIjr1CKPQZjqRvhrKeSedBMy+yUldccxTlLq575y?=
 =?us-ascii?Q?SW44xK8aSkPOpJUujxyirDjxiqzC9OWaQOyZfyV00OYhQKqhH4e86Wo2yTL7?=
 =?us-ascii?Q?7ezMSntg13WkKbvOK3B8guxmRmzNtSBw2hYxMmZHUXBk0/abTf8s5w1pbNud?=
 =?us-ascii?Q?gLhLMm7PLDBY7eYQxJ8PNi3fANS4b+TdBfyCbe5fCiFkOK22kPYtxyAvWorP?=
 =?us-ascii?Q?9y3lsNAXy9Ozr1AWMlGPCLkC/clnCnIoF00v7/SwQ9W/UJTuyGBU0rLfwvOD?=
 =?us-ascii?Q?uTWvvTlPCDVppA8uJsx8sjuKrptMF6mEu3sLUiEdl5y3JLNiN4RRi6Kvo0lL?=
 =?us-ascii?Q?OR944ELo0Nun2ZgP53ozWk7l4jnkLhuC9WE17cAyjXn0djzlrqILdngx4ubI?=
 =?us-ascii?Q?QeJ7maUjc7vr42kmPYIj+tdEygYyiWMXY5Q8cU0RTIj2Q3MUHtc4hZLPHijE?=
 =?us-ascii?Q?gG0Zu/q//4ybsRE/Xln69r0d4ypN3H2GkBdVGPkEq5C638ByS+DmDLap+XL9?=
 =?us-ascii?Q?t/AZqFYiXh1aSkJ6vI29XPt7nbz7+T95La9jIy99WOd0cnSw/2VRJtLh2v61?=
 =?us-ascii?Q?7vlFoyxsxor8rDyxyOymGp2A+LJhdUKPgPbltmf/NQRDVAoOvdQBcMAdNf8f?=
 =?us-ascii?Q?NQV8uco8I8TQGqJU1h+kQ726ruiX4J2wI0lGOVGDSgo6WsjC2MG3ybDwWWuf?=
 =?us-ascii?Q?9ObD/U3FbUR3D/V87AybEqJr2CifnARJZcuBgYaFLtnHiCp6yaQyiTFdOSX0?=
 =?us-ascii?Q?ASkTfyR8duyOZP9Ehv1YXgb1cVZNRyk4Wq6K4gMKHzszsX+4yTw/PeEk2IkW?=
 =?us-ascii?Q?uGNKhFL6YHbBMLVX3HkQkHaAJHcLcDzy3vDfHOdi0O5oGgUz9scr+xcf4F37?=
 =?us-ascii?Q?vapeMu6EJPJzf1smdEuRmUuGLYL7wsGfsIFv2zfwWJboVVjzJOa3q/NtIOf2?=
 =?us-ascii?Q?15WgXMPVDZ7z6UiVjsn0Pv797FaBbz1qAK7QDhWslyOZdw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yQwqARw0pMfyrI0ipWE6k/XLtAjpC1/QfaJW/Mjgt9Dr7sCOVyYqDS2eab2r?=
 =?us-ascii?Q?Muj6D4YxDRQtaAtwqFRoorCkWT2Xr4sreEWlgySjmd/nfxIUmqom0LM7c6SU?=
 =?us-ascii?Q?iS1aa+gbPmFwiBciNGFl5K5EY1ybh2B5lC+pjAwyx3sth+dXkhUYR19PpwEQ?=
 =?us-ascii?Q?eF5VgowUkcGKJuyXCyqyfQ3CeyxQlIndEQLS2rreDagpY7Is6k3ECRX5Ewhu?=
 =?us-ascii?Q?L4lcq9bRvqo4Dis3Tqrc4CL1C54pOBlYU4Td6CtMjqUQzfaxl0PEwRXm5ieP?=
 =?us-ascii?Q?tshpOK9+XYn9YcM7vjMnSUQJqDLeXt8Q13ECSOsqxiZ3sooGpXaRZYaruOuO?=
 =?us-ascii?Q?4SAkMeZlGj9KOefS52FpltnEMH9Bj5NELTWrc3e96atjVmVP7hY4L76cSlI5?=
 =?us-ascii?Q?5kvfJ+DCD8Wb93u9NVXncfeqnmFRRaNCWXvdh1yxJgntpY4bXqgOSv1CyNGr?=
 =?us-ascii?Q?1piEa+oI25y1tTnG21FpXK5RFMrxiww/rwIN/f9jStDRy76HPHiS3WReRsA4?=
 =?us-ascii?Q?fz4686UvFMxJ4+WH/sqMnRciDOrbPJNIDVNUT8nWDAmZpqZDEM+uskarQz+Q?=
 =?us-ascii?Q?w7zz3eJi4CZ1rFAAOyEK/KnfDNiBkQhJ6Z3G0wHxeO7eLH+uZ0PC0wFBq1M7?=
 =?us-ascii?Q?V4GSJT6FykCF4OQKdY5hSowza1QHFQpa6TWyFbQ8X/IBSpIjz6vqTwmr+VpL?=
 =?us-ascii?Q?pjDrwn6PudmaQGSWynv4xeFbGM0JoZMo0X0aVvxcC+Mz/aAa1adGUa0DXoaX?=
 =?us-ascii?Q?szUsJRiT+Y6sCpP6zRMlOWH0d9mciXJZ2zoXNcQ+AkmhmZWRLTMD5zUUUS+Z?=
 =?us-ascii?Q?0Qkh5t6gTBHYuDiyBKIsObiKZoeYN3NwW4CfiUdyGwA0wYzGKQkj5cmhWAp8?=
 =?us-ascii?Q?zzIjrJuRjgf11cs6ESFLjHSMXSuJi075a5Ps4TaIsrzgPY4PWvjamykaxra8?=
 =?us-ascii?Q?PrlOzN1mAsBBui1F5kgyLJz3MBsCMgHpzbBUoxvA9E4+e4XabkCbmk1UXl1Q?=
 =?us-ascii?Q?d+RQpnvOd2JIE4OoVT0GU25MHF/YZOdPXBwVijZezRFWU48yDz/mOuUay2JJ?=
 =?us-ascii?Q?9bG5VTxKWYBWzEiMWM6K07+NzUZ21T7kx9luGe8cVLx64noOLnTu/QHBiRet?=
 =?us-ascii?Q?3St2/VOmEJAH9D4x2imZ1gzwmEFQFJz2Gvx/nSCaPnkdbSd+MuKoA3qomZ85?=
 =?us-ascii?Q?5dVerILUoKo+FGLlfrBKt5zsUOTOPrUvtds4d5+MzAkU/Fs95vKxWoutaSLJ?=
 =?us-ascii?Q?YInoKtXLNgzOo6uBtT4QhRubQaFOTyTr2kASbn3CqJLWDEsMrL7UgnV8joTn?=
 =?us-ascii?Q?0+XSSyA3f9DnSy7/DRy0s2eHNH/4IvSMbW63j24SNeBPR4qgtzaa1W14l09Y?=
 =?us-ascii?Q?00gzELjZnFkrztcWCBwDI3jB0u3MVJBx201mCzfae4rQXBP+ybGrKicxwzj5?=
 =?us-ascii?Q?0SIHlwvGz5m69ofZC6TaccJCe5T2dKLouv3nX0sp4RO0T07HqZ3WqYhVlwD1?=
 =?us-ascii?Q?ytOjDnOf/ZBMQ5+w7HHEUDoyS8OyIgCZFenCWPIJryqeZxRidnWOe477qWz/?=
 =?us-ascii?Q?a/zM7NUDGo8GVhH4b9zbOpl73XNYYCL1i/3SP9zW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3706d06c-a178-46b0-e5cd-08dc9b736de8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 15:18:45.1391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q2heKnIf6kWB3ZKddELAKv+ikkAqtp0lE2/VaWDywiilHT1mVuXgAAh6EkLXDTL3ADOaZ5GVqOvPNdY3RucDAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5279
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

On Tue, Jul 02, 2024 at 02:48:22PM -0700, Dixit, Ashutosh wrote:
> On Tue, 02 Jul 2024 14:40:34 -0700, Ashutosh Dixit wrote:
> >
> > In Xe, the perf layer allows capture of HW counter streams. These HW
> > counters are generally performance related but don't have to be necessarily
> > so. Also, the name "perf" is a carryover from i915 and is not preferred.
> >
> > Here we propose the name "observation" for this common layer which allows
> > capture of different types of these counter streams.
> >
> > v2: Rename observability layer to observation layer and in code
> >     s/obsrv/observation/ (Lucas/Rodrigo)
> 
> Note for reviewers:
> 
> There are no semantic changes in this patch. Only different
> ioctl/structs/enums are renamed using basically s/perf/observation/I and
> comments in code are similarly changed.
> 
> /proc/sys/dev/xe/perf_stream_paranoid file is now changed to
> /proc/sys/dev/xe/xe_observation_paranoid.

Jose, do you have the Mesa patch ready on this? Ack on this change?

> 
> Thanks.
> --
> Ashutosh
