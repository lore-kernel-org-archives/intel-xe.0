Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B38BCAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 21:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1682D10E7F6;
	Wed, 24 Sep 2025 21:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HzHNcni7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF19610E7F6
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 21:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758749708; x=1790285708;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7K1LVAbXw0axhWz0tQWhugySHf268YtkSfey7dWgUqg=;
 b=HzHNcni7SOJDsS4Zyo1djq8LcHlKRtIsWBJuz7Gs6iwt4LveSxlrgKKI
 Ioi1Q/DgqUjNGHRrJ2xdV9fqwG1+ugknM8iUPP2c0iAzVM6oiHRP9OXlw
 5gRI0KXMY+nCvivnRsv5MlQvshkgbt7/NO2P4YJqqkdytwB3ucqrCEqtJ
 8LB1HcEcn2y4BlTZ4pRy2lkQoDzLVdRxe2FdIpPFpdpSYJCK/kqVZGbeo
 N3WWsQ+fhB9NR6WV2k6GNLTXxh2q6ApDV7Oa9M1xOkzhoWrazuXny2QzF
 8NzsCpUOABvUabGnhltzw1TCiksTnZnqfTFQi1xTA+K/0p5HFNrvFvyR3 Q==;
X-CSE-ConnectionGUID: y6sKW5l7SjyoC6kI0LorVQ==
X-CSE-MsgGUID: 3Brh0WskT8CDoejDIZKGQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="63685308"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="63685308"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 14:35:07 -0700
X-CSE-ConnectionGUID: hQzgA3MjTLWHGxOt09Jpjw==
X-CSE-MsgGUID: b6IVsQiMTaOeIUsB0wm/RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="176275365"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 14:35:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 14:35:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 14:35:06 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 14:35:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ot95ZFTMHyPhh/spmLev2hzvA1kacPDZOlefC79Vjqdjhxsur7k/Jk3VUPsa1R+D6/Pbdx7MavqNfbdyChFbEAYUeQS0ulwIybk8ZN6K/964++ySSMca8jRcvCxje6A+BwIhbP+zXS8yNFcN2SeTi74aic+NKlC7WppAzB5Oxm+DYUXsQHsAdJ9LHNUUtTVobvTlq5rvYv/4mtw5wVFfOPnR0JmqwmyJ1u+rZOHy8ch8RJ7Tb3022hE+WL9cleArfRAso5ldUpAG/xvgUmDtCGUXn1thROyBddgBS673riPRcxMc/IzRuGOUODUz30lZarch046synf3EYr5eNYofQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qWYTZLpP2loBOadl3g5aHcOwo8tk/GMl94+ko7yl1w=;
 b=vvRctf+5sM13VG/OgZCgAYFwportRvWQoyxp3ds536iCMASzFFFak3Slu2AJSAjyQxIcQ3FAzUfqll7dfTeFen6imflmHKTUUbqjyW4qbMrDQHOUuhhc03Y+r1JZhyqd238pcgN5XRY1//tre3AK0BZmHe9T3AIhhjLCwOPW+J43Od8IYa9Qx3cxS61QPMxJ4dZuovOqss4NFBICtd73OFYLn0esJppMbabTyXgq2gzxFzrmqFTqnttTkqZXS4OwUFoRN9ip5xuyu+aeIhfxqXyus8/mZ5r+/+B4F6rDe3FJxnQ8FVXpiqRKvR9kfTjnwZiCDrwY+4jtW4ULJloJfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ5PPF2F7FC4EE6.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::81d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Wed, 24 Sep
 2025 21:35:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 21:35:02 +0000
Date: Wed, 24 Sep 2025 16:34:58 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kees Bakker <kees@ijzerbout.nl>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers
 <stuart.summers@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Riana
 Tauro" <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Umesh
 Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v5 4/7] drm/xe/configfs: Add post context restore bb
Message-ID: <5khwrmes5ypkpaeppw2smvoxdn2iwehx43i7ddzynssc2mywww@lygpxijf6ocl>
References: <20250916-wa-bb-cmds-v5-0-306bddbc15da@intel.com>
 <20250916-wa-bb-cmds-v5-4-306bddbc15da@intel.com>
 <32120086-a674-422a-a434-b8bafbc3b6d9@ijzerbout.nl>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <32120086-a674-422a-a434-b8bafbc3b6d9@ijzerbout.nl>
X-ClientProxiedBy: BYAPR06CA0047.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ5PPF2F7FC4EE6:EE_
X-MS-Office365-Filtering-Correlation-Id: aab7ff96-011f-46ed-967e-08ddfbb23863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Tbex+uJm2Dtow5lqSB5BFGZTi+LHSRtG5uKhjxMX4hJb5mO/vVD2O6+WR4OA?=
 =?us-ascii?Q?9VpFSLrWB6uKJPokL0hyMm15ImVyZrhCtl6PkDOk+XhhboFikzNffIyd1M7S?=
 =?us-ascii?Q?f1QLQBzFZkVgor7fOaTOt9G+nUgKJ0uu6awRJ+MpPuvWEjrMjWI89VzGWoEm?=
 =?us-ascii?Q?ChSQyEzIhmUOGy2/rhK1LkiuMmxPcqWve5QkoP5uuaCG4dr56mS2DtBk7pf1?=
 =?us-ascii?Q?Ume3MEyJVqAP4L7dRx3tDOXHoMxg9kMCUdv00BBodrd6DLHGtGCWIoXeiOmW?=
 =?us-ascii?Q?l2qhzzsdXAAbNpvGYOhNylXzqMDnqxvQjHuemhID44fOxhEULPVgjCEHkjCj?=
 =?us-ascii?Q?oe0jDwtnH6r6a9M+VnV7ySpkktAqM0jDQ7T0SnLu45h9Pqf6ki9f7aB7fOFh?=
 =?us-ascii?Q?/VEwvixW2qW/9aSwsD4Er1N8wUVHI/dvMjxxtwC9/om2Qf3UF7T/lSW3lznD?=
 =?us-ascii?Q?uoK6jOHzEMDcPTdBZex1JGjvxXLBz5FvdzbgPhCgVFZS5qUhX/jSN5/UPK0/?=
 =?us-ascii?Q?pwz91G/CIP40bSr67OKZJL6oxF6SY30tLtDF7St+4hbs7oz2zBevo8L9pUGe?=
 =?us-ascii?Q?DoMMEjlfagib8AiRsVW+e5CbaJvqvaVTrZQ6pL9zkni2fmdEh32svqNXA8cL?=
 =?us-ascii?Q?m8gtd4g3XazItHPDvfo+s8dTGzMV8XsPsiwUxVrFdSP1nYFE5KpNBlMDO3O3?=
 =?us-ascii?Q?DVd2rnwpdl8vor5WlRj9zF98MXpGdKGHTcpZNcYOZ+EAwZaRUlzCt1b0XsKY?=
 =?us-ascii?Q?OwzOgBpKmIogx32Zo7FTE6sAvmPfu8xvJWRzvuN1gzXahuOn+AgKGNRenZST?=
 =?us-ascii?Q?s3uD2Ef8dTzDkcm/BBoFHYSVegyauTpMI1Vp1tfIQ+Rz10jAc4aVpmyYrFxw?=
 =?us-ascii?Q?SL2UX/mdV1YSzTF3uzGSq37308sps5cIyWddKAU9uRXS4Ymk9oxIVsz5NKdx?=
 =?us-ascii?Q?yNIIICswgfPJIiQizPWAMt2VNqLv6rvBUVQPuZG6OnRs2TiYTWlx50mb8NFr?=
 =?us-ascii?Q?vqrjZQAY60nblTX3f98NlreL9GYLkxUgdPklzSWMifUCsEiKtuSeBZO1/lof?=
 =?us-ascii?Q?7ptvNtX4HGEO4jjYlOvsSFMnpqshaGwqoFgYmEorpid1WkAhRgWDNQrISVko?=
 =?us-ascii?Q?EByl0NoHwdwOcOMmqoBUNcjjq35aonA5nOrJAojOljU6uoEf+9TDOyyMo7Ki?=
 =?us-ascii?Q?A/7Q0qzBPXXkxR5QdvhyTBOIbzXQ4oLdDK0tuKWBv98YFT8AZdnDt/ZsOYWf?=
 =?us-ascii?Q?X0az40Y/08q6wGGcX9qxjiNqO56vJ+Z6fI9zx9A3MEjO6Bv3mNSp0LubsVIp?=
 =?us-ascii?Q?RL+txLSuicSK08V0MnufLwZVgV7ItjYsszJgxyNpq0W+NSgJCY9COSqlijm9?=
 =?us-ascii?Q?zIcUGeZFjhbbXMNAYt1OQWVoZx9s?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L+BsDmwpcfQJhZmv4EOjGDdZwE8V+gcFuz431rs+lnG3paxJUF0jwwG1N078?=
 =?us-ascii?Q?MC6t8zODsyVpEUDUAKXsyqED8xPa1Xd4BJxcMVXtNmkQhLqZ7ErfnYJearco?=
 =?us-ascii?Q?VH6MmdNGIbGGi5rjv4fnCimO42mDjsMRp55B3XFxmBEb6//28Wzr6d8xAR4C?=
 =?us-ascii?Q?vkA4ZijY8YIdOyJ4KRsWKTS6dhDpLOjbN/HYpbc11E64qWStYS2R8Y3CsR7o?=
 =?us-ascii?Q?mQUJm1GrQtqxn5z/L6NQmLeXiULgej8jPQir7VAH/bkm/5EPKV5Qy8LZlLiL?=
 =?us-ascii?Q?n2DF1tId26ncyk8LMtGRej+BIIMzXlice15SxZhK4wKMTYrNsJ2MP/HchDVW?=
 =?us-ascii?Q?115H3IglwsRSRFNsQeLhwMAtHOLb6CY6P7aadbSEFFaoXulU4DGaL5ju60AQ?=
 =?us-ascii?Q?Sw+CwGsCLwsD8uxk//e+HFxqJkkvHXOBx6nGsRpwuiUvx2NG18AFBYbTYbcv?=
 =?us-ascii?Q?a6CMUGW9xGQtWLBCTyMITXx5B7m1aNmXRTC3RIk/mWcl6Al0FsWsBl1AuoKj?=
 =?us-ascii?Q?wp1+m4h733l19TCSl1/d6N1S490Y6qai2hFHPhGwaGtJz8sr3NUboYvycldM?=
 =?us-ascii?Q?h8va1KXilerCJF2FXnSN2pjAnSn9m8jOgfV4XCXyggn2tCJWqAMrFxsBenlm?=
 =?us-ascii?Q?9iySIMkWgspfbupzLwtEt9MojWk6Z/7Bm4SiK2aj/gpoeqEYqZVIDmqlsEPU?=
 =?us-ascii?Q?woKk8jCyBITMWQC41JAcHfHFuQN+uNjZUadiAGAEOp+/FXymTDVSEbtL6JqE?=
 =?us-ascii?Q?MKP2yXqZDaWpB41tynS3H8eYVhWf6hN71QIKyXz4zdlqyX3ek5qvnulchSYh?=
 =?us-ascii?Q?aVnDB9b1tJ/foso+MroFtNixuDqUNCTVkNJLum/et4EjwhVJwCFMYO0nZVJV?=
 =?us-ascii?Q?+TYa+WFhWJOQ9+QrIbRtICgo1BPIDt/Kjvb1hp5Js47DCfXJqpa3rOgyhg4F?=
 =?us-ascii?Q?QrjFzlsl+M6ID7NX4ZZ/KlbrqhBQhxB5dvniLPQz+bu10oMyYmNBGUn0cokc?=
 =?us-ascii?Q?TghWZrL7ZFroBGgFoufXwduVEfxhWhFt0DAs1EnG/WWTqGB3KkB07Z7h7jFZ?=
 =?us-ascii?Q?v2sHqfRK3FfuDr/50gZF4dHrSzvE5zFYVdPBO/pqhF7TzpLBJ0fcbHXYfmqq?=
 =?us-ascii?Q?pKm5HccwviE97E10vH5Fq/GW25Br0irRND3EQtCZxlMgmfs/3+jTWUR6dKCc?=
 =?us-ascii?Q?cu+vLRkhtLKponc/oUZyNWegAYqJ/GLQ4kRZLOV+VIBztR6GY3N6iWpyPMHv?=
 =?us-ascii?Q?9eCZRDMkNf+xBSt0OXoMi8Gei5rD4M9jtPNN9+TAPcGr8822pL+VwBD96nMs?=
 =?us-ascii?Q?PioSFpebVhmw4/hhMtcfuOzQM18EkqX5O8Pa/6yELN+ghQc/F87SADWGi7Dl?=
 =?us-ascii?Q?kBRUIvFpxFa1j3RgmS5o0GSzx45/VzB+oCHUlpmzLl8QhRgPNYRqvpDoAfo/?=
 =?us-ascii?Q?Z5fXNFHGM53Y/JCiClalkmU7h/Qk3mCpH8g3XiZbyHvEJuWjCwsPal9FyD6o?=
 =?us-ascii?Q?EBkbgMsHudupYpRCsWMd8fCJ0RRSTcCr+wpWTRFjfEESdqRfqZzOehwH2rbd?=
 =?us-ascii?Q?/C2b8QdWiA7wqCek1EWtW1zKCCe/kqyy22qBaNL+GiRfl/hMgIwN2FIz0g3K?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aab7ff96-011f-46ed-967e-08ddfbb23863
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 21:35:02.7835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1C3Wvy/AK9Yq+C7LHxdgIuqnkRykG/vI+u8aUxKIyDsmeNnkUp5udiGoWhjkS5h+2oI96IkeMFopnDqh/tzwXxlczcKCSkdbHRlksv+47Y8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2F7FC4EE6
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

On Wed, Sep 24, 2025 at 10:31:39PM +0200, Kees Bakker wrote:
>Op 16-09-2025 om 23:15 schreef Lucas De Marchi:
>>Allow the user to specify commands to execute during a context restore.
>>Currently it's possible to parse 2 types of actions:
>>
>>	- cmd: the instructions are added as is to the bb
>>	- reg: just use the address and value, without worrying about
>>	  encoding the right LRI instruction. This is possibly the most
>>	  useful use case, so added a dedicated action for that.
>>
>>This also prepares for future BBs: mid context restore and rc6 context
>>restore that can re-use the same parsing functions.
>>
>>Reviewed-by: Raag Jadav <raag.jadav@intel.com>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>v2:
>>- use bin attribute to be allow multiline
>>v3:
>>- revert attribute back to a simple attribute rather than binary:
>>   otherwise configfs only calls the callback on the file release and
>>   ignores the result. With that the user can't rely on the return
>>   code to know if the setting was accepted.
>>
>>   To still allow multiline, a method that uses just one syscall should
>>   be used. In bash, echo will end up using more syscalls. This can be
>>   workarounded by using heredoc, or simply writing it in C
>>   (rewrote that listening to
>>    https://www.youtube.com/watch?v=1S1fISh-pag, you're welcome to review
>>    listening to that beauty too)
>>v4: taint with TAINT_TEST (Matt Roper)
>>v5: move taint to previous patch (Raag)
>>---
>>  drivers/gpu/drm/xe/xe_configfs.c | 280 ++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 278 insertions(+), 2 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>>...
>>+static ssize_t parse_wa_bb_lines(const char *lines,
>>+				 struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX])
>>+{
>>+	ssize_t dwords = 0, ret;
>>+	const char *p;
>>+
>>+	for (p = lines; *p; p++) {
>>+		const struct engine_info *info = NULL;
>>+		u32 val, val2;
>>+
>>+		/* Also allow empty lines */
>>+		p += strspn(p, " \t\n");
>>+		if (!*p)
>>+			break;
>>+
>>+		ret = parse_engine(p, " \t\n", NULL, &info);
>Notice that parse_engine is calling lookup_engine_info with mask being NULL
>That function is writing to *mask without checking for NULL.

commit dd797967160b ("drm/xe/configfs: Fix engine class parsing")
should have that fixed

Lucas De Marchi

>-- 
>Kees
