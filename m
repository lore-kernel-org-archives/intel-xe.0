Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754CDCD98C7
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 16:27:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242FE10E7C1;
	Thu, 11 Jun 2026 16:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLtOXz9h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B97810E7C1
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 16:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781195260; x=1812731260;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FuS7QKmQyZERuX429lzGlEiAJL+l5Tj3jn/TDKmPFCA=;
 b=bLtOXz9hBLbGhyqTOJoKB1QPodMmhSZMpYPGJlGXqm7UtqG34KHVuQyX
 hZdu0i/A1gsRUACn4Vxn448FS70bW3aZNk5XAHdr+kZv2zRT/VgTuR0um
 6BOF4z4C5xfTnoq3pFs1BSS5SlvRvjaMf7uyHjP9qDz35XKA+oXMaBhMj
 iNbFQfPBBLQN0nj3ETT3G19RQve918FLK1PpW0dzNxCCf6rzkEwybbwPT
 Xv+xUxQZihNRl0fnF06Neuoy159nlImKJajCK20DAiViF4dTsNieZDYX3
 ctlQaH4kPv/RzRcHYZ3XqkOYkIgpDLQP89bnKmNjcKrHTyhXKRD8OpDcF w==;
X-CSE-ConnectionGUID: npV2sPenRfCVJ9y9HkYqJA==
X-CSE-MsgGUID: hvICZZCWSTOKqUL5HBlWeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81755548"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="81755548"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 09:27:40 -0700
X-CSE-ConnectionGUID: AM+veH/VSsiWdxwOpMA4Uw==
X-CSE-MsgGUID: Kc5H7AJTTUuBUahqhKzqNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="270198019"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 09:27:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 09:27:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 09:27:39 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 09:27:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJnfnApshep4TBYngQL+76hET9Qw4I+4TpdSz/JoNl+iZahbsnpCVb0077iqfK3npGETSzOVslmleextNrSlFuXwqkatXbUbV7zXYMmTJZ80vUnmzQdER46mjzsrz3bd4SUS+VD/mU8fqdnl4MKHmIW3LlOuyNlZiyAVKo570cP4YeQ4cewvOGRcvXcPz0IAG9Hjd0QyD+I4VQI+ia4RKa4u/2tiIvgtOrjv89h/MNm8KtnS76NXwcDuoYJj7kJLbqjg3TJbVuau3L2Rtu/80ZvYYeO2CQD55xCsbqLbZyEj164fXj5GxaalvPc/wZ2BaWVcUOnOg73fPDFK1P/koQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FX15yrItCbZnG8bzhKXgWn2/iSn3Exdr0OO4eI7kpzc=;
 b=wOZnXu+VtkFH+6YpgZLxa/BuUBS0zTaOFiU8/rBL3LVrtQmcTLy6ronb3deIa+hZKI2XbEKm4Q4e31uPCLCo0sY8mTfLpuNy/6KK3rufKslahtTlI8W6l8Om+/XUmIUSEP8ZXnPCNI+wb0WaBvnborGCkTfQg34xLaV5STMarElO0vhMKou/IaQ4BZa8tR5NTiBBx+4iMxrSUxU3Xg8q6+oEAofXh1DPwzRiArTSFEU7lTVKsL+DuiDG3+GBydpsbaM9gtPi3Zci1pZvTdnuQNGhPODS3zP35MaLGJ6/RAR3eUM72lTkPpTUF06l3aRvpvOdg5Z0QUgYAHd7KCDENg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by DS0PR11MB7444.namprd11.prod.outlook.com (2603:10b6:8:146::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Thu, 11 Jun
 2026 16:27:36 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 16:27:36 +0000
Date: Thu, 11 Jun 2026 12:27:32 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "Souza, Jose" <jose.souza@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Brost, Matthew" <matthew.brost@intel.com>, 
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH V11 11/12] drm/xe/uapi: Expose ban reason in
 EXEC_QUEUE_GET_PROPERTY_BAN
Message-ID: <airh9Efs3DRyVRG6@intel.com>
References: <20260605123839.236021-14-tejas.upadhyay@intel.com>
 <20260605123839.236021-25-tejas.upadhyay@intel.com>
 <543ed281612b0f8b1cd289448ae917896f18200c.camel@intel.com>
 <aidgZ1zsihvCPGqq@intel.com>
 <DS0PR11MB8718ECA4E0D9067E4C41EE51811A2@DS0PR11MB8718.namprd11.prod.outlook.com>
 <aimDM0CpapzxZP9n@intel.com>
 <DS0PR11MB871835057D993500ABBB8412811B2@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS0PR11MB871835057D993500ABBB8412811B2@DS0PR11MB8718.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0339.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::14) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|DS0PR11MB7444:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc19d2c-7167-4b62-4a58-08dec7d658b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|6133799003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: tkQT45wrHAECX7LNVGMSpV/vlSJ1mPY4yy/uxhdZ49FEDruIp8xjyagt4O4aqfhxW6VPtwU5VIMo17pnhXUQ4L3EjaC9m7a6Qjy9IXdxBjf3LqI+FX5Ksg79FMLR4EKJEwNprHUbncZcgPCY93pQLJPRqyxwbtmKKJJltwVB3BO9nxRs7Lhi4HuOdV0Th7n5gF2zsoMxbaN6gbh3B6aVS7psdntDakVXpcDCc5qj7k2GWdJ9YGw9hyA2e5Hw9qUwoNNgJ0kreuZ5ridZfM66fjEFrL7595qVXFqJZsObmU0b6KVZddNdM4H0gY+ttcgZxrCV54dKELIdEEnGnjYsqk6p+o9zO8KApSKKU/dWTQuwKjW6GD5ZrRabsg4EGWMk+w6YRsIexjr9Ar2I/wyl7Zdrw7si9IzOvQmNTS1xlQaAsCyh+BAfWOPJ0VkbCB7aUt+o8zuljDB1CwZjCxszX+V3QGzD2tAjDeSkjjqWqNXsQZAhtsJnKWX9O3B3Wr/wvAEX5aTzPDcvuzW1G5Qn9+L8I+BLUlRSapUjuPtZs10gGQZ2XLKPJwzHixfn1Ae4dER1z2cNozZ2GvBomKP12/3HATI+qPscYyhNIu4UBjBAUAS1CadYt+dMrLeFFhmy+gg1iz095H6Y7SBQ7Xpedg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0zPVUyCUv82YuMx28BYDblL1LmTAydNutkquVNhWEgHWiD1T7fK/+1UL0v?=
 =?iso-8859-1?Q?2xjvklyeBgu17GuubbZ866HHQK5jd38XLvh14vPSbM0mRQMk4eTJjbvMkd?=
 =?iso-8859-1?Q?TUKmacWs31FkEnqy9hz+LsQl4kUJ/6CYT0ANC8GJwylC6Y1vWvk1rEdBkX?=
 =?iso-8859-1?Q?T2r7QwkRREC7Ec2P3DcG0qUkfPrBlWiUZCs8FZ4VEGePMbNsTxR5fwh3qY?=
 =?iso-8859-1?Q?9VxaL3WJIO51YDgGyVNSiRLLnW/26PUESe3xO2EqZHpjMgkGspzozxqLf3?=
 =?iso-8859-1?Q?WZ6DDZO36VdZd0L0IBZJcnodI5rvN8A8TGAz5q3QRp2cTANckxasxmrn/x?=
 =?iso-8859-1?Q?OK8+PCDjOLycHn5vvZtrVIgt2IRMgZzZq/dzHOqeoTNlwRbB+6izo23N0v?=
 =?iso-8859-1?Q?8X3Ndz0zodB5JMKPSmoXSz0ZjKTiUOJdBSa9yYtdPcV6olrrnFfbVYLv9V?=
 =?iso-8859-1?Q?AGe31hThz8NjQTMD3/idU6LqUSrnnAPgMpTsfyumypjlYs+yXSQ4Iffbhj?=
 =?iso-8859-1?Q?f/vn9QG9q7nTPyGKxRPH5VMSQy+VKB1Zs/ILE9NoA4wWq5Ei4XZSbLm9ur?=
 =?iso-8859-1?Q?JnVB/TqkFR0CIvZFE+1aZNodyxrdVtMIDq8fM/RDm42zoKY69LwOqncCS1?=
 =?iso-8859-1?Q?qtAthlvNxG8XlJO1kkcJmyVqUeC4fJY0LGoRda/bxsKY/zoSDkvjikRY0F?=
 =?iso-8859-1?Q?Mc9J74+9GgthNAmvqcTqP8L95I/JiM4NZCjmla07HSpUpvgpprJ1X3efHj?=
 =?iso-8859-1?Q?PSRDfLWLBzjBesaHhNmzU4xFB31vZrXG24HS4I1n2McPZQhnKrZDPYC1hg?=
 =?iso-8859-1?Q?yL7vILRmxcqKl8eOcycMyv3wxHSI9SlOJ3CGKWy8ijbjEFa/yiPNDKY5zn?=
 =?iso-8859-1?Q?2L/19Xxd5fS9w6MIyRlasC1zViuvmQDbJAbRXv2sYzCbwzUpx1wVhiXkt9?=
 =?iso-8859-1?Q?jz45RmI+MxszWEcxA4UMwxWMncTvac9Qdg8OQdR5ryN4fMQnoQPvV4NbUU?=
 =?iso-8859-1?Q?5EKspKHLUuC/rjl4sjdkMey7aMZnu0yXDnChom5jgOCis2T3Je5YCLEsl4?=
 =?iso-8859-1?Q?SSTQPoAm09ArOa100HQtW83fzbv7d1WaEMrZt69RC6EwFmZuVJHQi0Cpie?=
 =?iso-8859-1?Q?HxplXwlex4fJtvTChvAqjxF0twpR1S6JTQaeUFJVcfuxM/TYwsWGzl812N?=
 =?iso-8859-1?Q?2/OacolZdo1DyJbIoQTriVVwx8HXY2LAA62zifY02ahh7iIgheukMQg/Yy?=
 =?iso-8859-1?Q?f5PFSnq9RL++UKSndUX8E1AJBZ6+n8WhNsa4TfRDS3dUH3p8+7zCCNT5ht?=
 =?iso-8859-1?Q?FMWX7ZpqMCvUgoWPqmQJMDU1iDj1hW8yhE6MlEH5sW1zrXmU4jZ3k0+Ny8?=
 =?iso-8859-1?Q?Rm7yaFuHAAeBwfVz/K3hET8zyTZEqCQZmJlK31hlQxdGRvOz9zF/unFnkn?=
 =?iso-8859-1?Q?nJuFlcQN4lQcaE6SE/eOE1mqrD9EXFuhPYi5hDxZPUNyNcYY6L+/CzkztT?=
 =?iso-8859-1?Q?nn91hnNodrB4kMeEp7dIj/BvHUwG0pwkfuouvX8FVyuvPbkl9OQyVflc3H?=
 =?iso-8859-1?Q?EWRxZc5pwmfHRufDAfs8DGieZW6ZhmEp0LIPqoU/Gu9uibX/XmzuSKse1u?=
 =?iso-8859-1?Q?x8SNidkOrZ/EzXYq39IWi4okCTb567lMlyRmxbp9lI+gAAlAP4doEnrqhf?=
 =?iso-8859-1?Q?jwxLimlGJ9Hv14DjcT10KV+Oq6FnUM63T+EvNaIc1HWzoBAC9bc7FNfL/p?=
 =?iso-8859-1?Q?e+BpY7QncrLlTFkFG9O+biIH0X65FpzlL+1Yz1K6WFbMGCLfQWw+JrgylC?=
 =?iso-8859-1?Q?gVGPwfZ/eA=3D=3D?=
X-Exchange-RoutingPolicyChecked: JXqtZvpbz/nD9yUdeddrT6uJovKf6MqTqdPvBYFtknv9kYT9x0Emqa/Cpp0Sc4b+2528QcP48DD+/rUGUFPcK7QX4XmwZ2tR6EipY8isA2h4pfYLriJ/bJHzg1UiIFYfZMl9CISRnI528RNKVc/ZmYy/ndru8drfrhdVSBbRgNNgHUNV7eBOotZ5RHKJT2Xgxkp0C9qYc752uzASfY72v34qPVZIwdUYJap5UTspsBsnbThcNTY7j6GawlZIAPeRRA1T55xXXRhPfYibo0wZ7pZc9w6fj8wSoA+WKKRgjewgUDRswVmWwMCjsAOHEfxBX/QfIuIlChNWRx76HvYD4Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc19d2c-7167-4b62-4a58-08dec7d658b9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 16:27:36.2113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3671CZAg+6xYPsfeqE576qupmei8U9APcK2MbPahd24sut3pVeRsD5cinfh3Zk6jRV0UU+sbHiyANSibANEFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7444
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

On Thu, Jun 11, 2026 at 06:55:56AM -0400, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Sent: 10 June 2026 21:01
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Cc: Souza, Jose <jose.souza@intel.com>; intel-xe@lists.freedesktop.org; Brost,
> > Matthew <matthew.brost@intel.com>; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>; Auld, Matthew
> > <matthew.auld@intel.com>; thomas.hellstrom@linux.intel.com; Mrozek,
> > Michal <michal.mrozek@intel.com>
> > Subject: Re: [PATCH V11 11/12] drm/xe/uapi: Expose ban reason in
> > EXEC_QUEUE_GET_PROPERTY_BAN
> > 
> > On Wed, Jun 10, 2026 at 10:17:26AM -0400, Upadhyay, Tejas wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > > Sent: 09 June 2026 06:08
> > > > To: Souza, Jose <jose.souza@intel.com>
> > > > Cc: intel-xe@lists.freedesktop.org; Upadhyay, Tejas
> > > > <tejas.upadhyay@intel.com>; Brost, Matthew
> > > > <matthew.brost@intel.com>; Ghimiray, Himal Prasad
> > > > <himal.prasad.ghimiray@intel.com>; Auld, Matthew
> > > > <matthew.auld@intel.com>; thomas.hellstrom@linux.intel.com; Mrozek,
> > > > Michal <michal.mrozek@intel.com>
> > > > Subject: Re: [PATCH V11 11/12] drm/xe/uapi: Expose ban reason in
> > > > EXEC_QUEUE_GET_PROPERTY_BAN
> > > >
> > > > On Mon, Jun 08, 2026 at 10:03:50AM -0400, Souza, Jose wrote:
> > > > > On Fri, 2026-06-05 at 18:08 +0530, Tejas Upadhyay wrote:
> > > > > > Extend DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN to return a
> > bitmask
> > > > > > indicating the reason for the ban, rather than a simple boolean.
> > > > > > This allows userspace to distinguish between different ban causes:
> > > > > >
> > > > > > - DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG (bit 0): exec
> > queue
> > > > was
> > > > > > banned
> > > > > >   due to a GPU hang or job timeout detected by the TDR.
> > > > > > - DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE (bit 1): exec
> > > > queue was
> > > > > >   banned because a VRAM page backing its resources was taken offline.
> > > > > >
> > > > > > The ban_reason field is added to struct xe_exec_queue and set at
> > > > > > the point where the ban is triggered:
> > > > > > - In guc_exec_queue_timedout_job() for GPU hang.
> > > > > > - In xe_ttm_vram_purge_page() for memory page offline, before
> > > > > > calling
> > > > > >   xe_exec_queue_kill() or xe_vm_kill().
> > > > > >
> > > > > > The reset_status op is updated to return u64 with the reason bitmask.
> > > > > > When a queue is banned but no explicit reason was recorded
> > > > > > (e.g., from a generic CAT error), it defaults to GPU_HANG for
> > > > > > backward compatibility.
> > > > > > A value of 0 means the exec queue is not banned.
> > > > > >
> > > > >
> > > > > Acked-by: José Roberto de Souza <jose.souza@intel.com>
> > > >
> > > > Do we already have a userpace change with this?
> > >
> > > By userspace you mean IGT or other UMD? I have thought to add simple test
> > to offline and check for BAN reason in xe_exec_basic or somewhere. I have igt
> > tests  https://patchwork.freedesktop.org/patch/714751/for testing
> > mempage offline via debugfs but that does not test complete flow of
> > mempage offline feature so not extending it with this.
> > 
> > I'm missing the end to end flow in here...
> > 
> > could you please clarify what this API is used for? Who is using it and how and
> > when?
> 
> Ok. This API is used for userspace 

So, please have the userspace code using this API ready and publicly available
in a pull-request (userspace repo).

Meanwhile, please do not merge this change.

> to know the reason why their created exec queue is banned. Earlier exec queue either can be hang/banned(non zero) or working(zero) fine. Now with this change exec queue can be banned due to memory offlining as well, so userspace can now get extra BAN reason when they query and parse like below to know BAN reason:
> 
> if (args.value & DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE)
>     /* page went offline */
> if (args.value & DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG)
>     /* GPU hang - typical recovery path */
> 
> So you are right userspace can check this args.value with adiitional reason case at the same places wherever they are querying right now. @Mrozek, Michal @Souza, Jose FYI
> 
> Tejas 
> 
> > 
> > Thanks,
> > Rodrigo.
> > 
> > >
> > > Tejas
> > > >
> > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > >
> > > > Thomas, thought on this vs the watch_queue you have or they are
> > > > orthogonal?
> > > >
> > > > >
> > > > > > Assisted-by: Copilot:claude-opus-4.6
> > > > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > > > cc: Mrozek, Michal <michal.mrozek@intel.com>
> > > > > > cc: José Roberto de Souza <jose.souza@intel.com>
> > > > > > cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 +++++--
> > > > > >  drivers/gpu/drm/xe/xe_execlist.c         |  4 ++--
> > > > > >  drivers/gpu/drm/xe/xe_guc_submit.c       | 24
> > > > > > +++++++++++++++++++---
> > > > > > --
> > > > > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c     |  7 +++++++
> > > > > >  include/uapi/drm/xe_drm.h                | 12 +++++++++++-
> > > > > >  5 files changed, 44 insertions(+), 10 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > > index 2f5ccf294675..77a621da4487 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > > @@ -143,6 +143,9 @@ struct xe_exec_queue {
> > > > > >  	 */
> > > > > >  	unsigned long flags;
> > > > > >
> > > > > > +	/** @ban_reason: Bitmask of ban reasons
> > > > > > (DRM_XE_EXEC_QUEUE_BAN_REASON_*) */
> > > > > > +	u32 ban_reason;
> > > > > > +
> > > > > >  	union {
> > > > > >  		/** @multi_gt_list: list head for VM bind engines if multi-GT */
> > > > > >  		struct list_head multi_gt_list; @@ -316,8 +319,8 @@ struct
> > > > > > xe_exec_queue_ops {
> > > > > >  	 * signalled when this function is called.
> > > > > >  	 */
> > > > > >  	void (*resume)(struct xe_exec_queue *q);
> > > > > > -	/** @reset_status: check exec queue reset status */
> > > > > > -	bool (*reset_status)(struct xe_exec_queue *q);
> > > > > > +	/** @reset_status: check exec queue ban status, returns ban
> > > > > > reason bitmask */
> > > > > > +	u64 (*reset_status)(struct xe_exec_queue *q);
> > > > > >  	/** @active: check exec queue is active */
> > > > > >  	bool (*active)(struct xe_exec_queue *q);
> > > > > >  };
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_execlist.c
> > > > > > b/drivers/gpu/drm/xe/xe_execlist.c
> > > > > > index 9fb99c038ea8..35e6e05ba418 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > > > > > @@ -452,10 +452,10 @@ static void
> > > > > > execlist_exec_queue_resume(struct xe_exec_queue *q)
> > > > > >  	/* NIY */
> > > > > >  }
> > > > > >
> > > > > > -static bool execlist_exec_queue_reset_status(struct
> > > > > > xe_exec_queue
> > > > > > *q)
> > > > > > +static u64 execlist_exec_queue_reset_status(struct
> > > > > > +xe_exec_queue
> > > > > > +*q)
> > > > > >  {
> > > > > >  	/* NIY */
> > > > > > -	return false;
> > > > > > +	return 0;
> > > > > >  }
> > > > > >
> > > > > >  static bool execlist_exec_queue_active(struct xe_exec_queue *q)
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > > index 4b247a3019d2..ff28eab7cee2 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > > @@ -6,6 +6,7 @@
> > > > > >  #include "xe_guc_submit.h"
> > > > > >
> > > > > >  #include <linux/bitfield.h>
> > > > > > +#include <uapi/drm/xe_drm.h>
> > > > > >  #include <linux/bitmap.h>
> > > > > >  #include <linux/circ_buf.h>
> > > > > >  #include <linux/dma-fence-array.h> @@ -1530,6 +1531,7 @@
> > > > > > guc_exec_queue_timedout_job(struct
> > > > > > drm_sched_job *drm_job)
> > > > > >  	if (!exec_queue_killed(q))
> > > > > >  		wedged =
> > > > > > guc_submit_hint_wedged(exec_queue_to_guc(q));
> > > > > >
> > > > > > +	q->ban_reason |=
> > > > DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG;
> > > > > >  	set_exec_queue_banned(q);
> > > > > >
> > > > > >  	/* Kick job / queue off hardware */ @@ -2211,13 +2213,25 @@
> > > > static
> > > > > > void guc_exec_queue_resume(struct xe_exec_queue *q)
> > > > > >  	xe_sched_msg_unlock(sched);
> > > > > >  }
> > > > > >
> > > > > > -static bool guc_exec_queue_reset_status(struct xe_exec_queue
> > > > > > *q)
> > > > > > +static u64 guc_exec_queue_reset_status(struct xe_exec_queue *q)
> > > > > >  {
> > > > > > -	if (xe_exec_queue_is_multi_queue_secondary(q) &&
> > > > > > -
> > > > > >
> > guc_exec_queue_reset_status(xe_exec_queue_multi_queue_primary(q)))
> > > > > > -		return true;
> > > > > > +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> > > > > > +		u64 status = guc_exec_queue_reset_status(
> > > > > > +
> > 	xe_exec_queue_multi_queue_primary(q)
> > > > > > );
> > > > > > +		if (status)
> > > > > > +			return status;
> > > > > > +	}
> > > > > > +
> > > > > > +	if (exec_queue_reset(q) ||
> > > > > > exec_queue_killed_or_banned_or_wedged(q)) {
> > > > > > +		u64 reason = q->ban_reason;
> > > > > >
> > > > > > -	return exec_queue_reset(q) ||
> > > > > > exec_queue_killed_or_banned_or_wedged(q);
> > > > > > +		/* If no specific reason was recorded, default to
> > > > > > GPU hang */
> > > > > > +		if (!reason)
> > > > > > +			reason =
> > > > > > DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG;
> > > > > > +		return reason;
> > > > > > +	}
> > > > > > +
> > > > > > +	return 0;
> > > > > >  }
> > > > > >
> > > > > >  static bool guc_exec_queue_active(struct xe_exec_queue *q) diff
> > > > > > --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > > index 35b5eaf590fa..3765e8fcdcec 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > > @@ -7,6 +7,7 @@
> > > > > >  #include <drm/drm_managed.h>
> > > > > >  #include <drm/drm_drv.h>
> > > > > >  #include <drm/drm_buddy.h>
> > > > > > +#include <uapi/drm/xe_drm.h>
> > > > > >
> > > > > >  #include <drm/ttm/ttm_placement.h>
> > > > > >  #include <drm/ttm/ttm_range_manager.h> @@ -537,10 +538,15 @@
> > > > static
> > > > > > int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
> > > > > >  	xe_bo_unlock(bo);
> > > > > >  	/*  Ban VM if BO is PPGTT */
> > > > > >  	if (vm && (flags & XE_BO_FLAG_PAGETABLE)) {
> > > > > > +		struct xe_exec_queue *eq;
> > > > > > +
> > > > > >  		down_write(&vm->lock);
> > > > > > +		list_for_each_entry(eq, &vm->preempt.exec_queues,
> > > > > > lr.link)
> > > > > > +			eq->ban_reason |=
> > > > > > DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE;
> > > > > >  		xe_vm_kill(vm, true);
> > > > > >  		up_write(&vm->lock);
> > > > > >  	}
> > > > > > +
> > > > > >  	if (vm)
> > > > > >  		xe_vm_put(vm);
> > > > > >
> > > > > > @@ -548,6 +554,7 @@ static int xe_ttm_vram_purge_page(struct
> > > > > > xe_device *xe, struct xe_bo *bo)
> > > > > >  	/*  Ban exec queue if BO is lrc */
> > > > > >  	if (bo->q && xe_exec_queue_get_unless_zero(bo->q)) {
> > > > > >  		/* ban queue */
> > > > > > +		bo->q->ban_reason |=
> > > > > > DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE;
> > > > > >  		xe_exec_queue_kill(bo->q);
> > > > > >  		xe_exec_queue_put(bo->q);
> > > > > >  	}
> > > > > > diff --git a/include/uapi/drm/xe_drm.h
> > > > > > b/include/uapi/drm/xe_drm.h index 48e9f1fdb78d..904d58b039fe
> > > > > > 100644
> > > > > > --- a/include/uapi/drm/xe_drm.h
> > > > > > +++ b/include/uapi/drm/xe_drm.h
> > > > > > @@ -1503,7 +1503,17 @@ struct drm_xe_exec_queue_get_property {
> > > > > >  	/** @property: property to get */
> > > > > >  	__u32 property;
> > > > > >
> > > > > > -	/** @value: property value */
> > > > > > +	/**
> > > > > > +	 * @value: property value
> > > > > > +	 *
> > > > > > +	 * For %DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN, this is a
> > > > > > bitmask of:
> > > > > > +	 *  - %DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG -
> > banned
> > > > due to
> > > > > > GPU hang/timeout
> > > > > > +	 *  - %DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE -
> > banned
> > > > > > due to memory page offline
> > > > > > +	 *
> > > > > > +	 * Value of 0 means the exec queue is not banned.
> > > > > > +	 */
> > > > > > +#define DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG
> > > > 	(1 << 0)
> > > > > > +#define DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE	(1 <<
> > > > 1)
> > > > > >  	__u64 value;
> > > > > >
> > > > > >  	/** @reserved: Reserved */
