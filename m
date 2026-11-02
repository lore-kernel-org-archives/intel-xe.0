Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1136060A0FC4
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 16:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KHCfgpWW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C713C10E676;
	Mon,  2 Nov 2026 16:34:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9285910E670
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 16:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793637235; x=1825173235;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hNb1kmUcQMwxSszQo4P56NEeAZYi0dJtkZPcS1N+x5E=;
 b=KHCfgpWWFi7WgTP6ZmxgS3+1anAGGWFh18DBZ4mmyWfCYiHS40Po6hHT
 TsM7SmweBhQVn1Wyukog3UGiS5MHDMRR09LMOLdFRnZrkZuD5CFr1/kDv
 tKmZQw8a7cpf5nGeXod7Uhq/FuWksB99Sp9HjBxX9gzKoxGrZI6omH6+n
 Rwwepr1AstkmnvZISGqfX2FPe6FnpgtL36RyYidtz/ylEm4/d+WAV19Wp
 AEyzCVIyOY3aS8RUOIfGApyxiA7fHr1949ScLvQlHnAvZo7mb8mag+s2S
 eBy9z4OqiV62bZSjVucX4DrqyfOZUfjL0wJ0NdeY43s6BBoNVMPbdakUR g==;
X-CSE-ConnectionGUID: txxuxlobRLmLNj7jkN3AdQ==
X-CSE-MsgGUID: bFscptNhSCWLeGdQzWm2Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2220233"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2220233"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 08:33:55 -0800
X-CSE-ConnectionGUID: TyG6QBB3Ri64Us95FU7bYw==
X-CSE-MsgGUID: MX8/NzUeRz2R8nWL+V29rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6326598"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 08:33:56 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 08:33:54 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 08:33:54 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.40)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 08:33:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+6ZEo95ww8ouUSnbizZCREy19QkNK/vOx6ixVJpzGUJpew74DqOOy/qefCyg2tQmYlGm28Ky8v2/K/XBffgRvLw9X7txAYN+vS2bfHNN7y4XuuADT591xrZv3XpakK8DLBMrda74TagJUNcpgwqlH0xyeJH2/rGuw2FNUDMZwOg1NO0PUit3tlBUTp6c8tK9eziBNDGl1LRHGx+yXYwDuMa7RvExhmrjPqmvUlU2QUjkkw5To9slxq7cV9a67pRxfKU7cCNp8ZQZsfYfMxZ8XIEI9wg9pHb4XfV3PnmXkHEdHaS2npllvNJ0undHKeATFEz8jpZS+PES2KNcCTIFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irAqZNNiFSLbtG1algz+tKlbB+YyfauTrI+/eRk5X7k=;
 b=egozmnu9nlL+WMgrmpvBkiyLeEVLpUVQvo0c47mhxGOnISbf81WzbRnvHSLtwcDUd397qDAAv/hpNeR1r7yEbVeB5TsgitQYQyUpIZJ+owKQT3Rv8trjcthMrp5kGRHXuamV4FcyTKLHI+g+0tqUOMh4O4Wd9hgc5pzzflloCOsabBvQ5goliApR6NYvq5MZrx2Y3xl80qFLg4GWNDXF5TSB8YcnbeU31sWMJUiqwH8ACTfqQXL503rVlINs5WXd+FTpK0k8csCNGJMUgMwIliLyxtTMgYMpMSmujDBRb+hefei1wqSn0IHvp91UcEhewJGi3UOsWA1f340A6s3ufw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by IA4PR11MB8891.namprd11.prod.outlook.com (2603:10b6:208:56d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 16:33:51 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4%4]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 16:33:49 +0000
Date: Mon, 2 Nov 2026 08:33:47 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <fei.yang@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?= =?utf-8?Q?re_fo?=
 =?utf-8?Q?r?= drm/xe/eu_stall: Don't mark stream enabled if enable fails
Message-ID: <20261102163347.GE6078@mdroper-desk1>
References: <20261031060234.2404661-1-fei.yang@intel.com>
 <179348343129.98089.13086714972944479995@221881a7231d>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <179348343129.98089.13086714972944479995@221881a7231d>
X-ClientProxiedBy: BY3PR10CA0029.namprd10.prod.outlook.com
 (2603:10b6:a03:255::34) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|IA4PR11MB8891:EE_
X-MS-Office365-Filtering-Correlation-Id: 323a444d-e8e4-457b-190c-08df38ff12a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|22082099003|18002099003|261102123227099003|56012099006|261009223027099003|5023799004|4143699003|11063799006|261021123027099003|261026135527099003|261021135927099003|261026140227099003|261022113327099003|261022115727099003|261022075727099003|261026121527099003|261022105027099003|261026130827099003|261028144727099003|261009221727099003|261009220027099003|261009223327099003|261009221227099003|261021121427099003|261021133027099003|261021130227099003;
X-Microsoft-Antispam-Message-Info: xQF85X2bg+xS4jwzkBOmF3STfqQKfZeEYCTSWf4QvkfU2QSWpG1s/QVuF6Pxze9I7XNli/rJ4JhAUR0zSP0YgncYSE9+n0eWlDl+x133wpqDR+UWcWMt7Ai+cBm5pQkghIJF9TFegp7PD52BrcpR6Y7IfFm9nrrrWVSkiCj5j6csoFik0YCBsm6AQENCQGcNMMXrxYLiA5GSRbK3lxuy6OwSfKKrcIiDhKYfM2cWpWtgMmm81kssYyc+Zx2E1HjXXhT5LuJ3a9YTe361zTiiE3TDSVyiSxShgKlD/t/dZl4i4HKcV25bABQODZYcrqyQfdELEzzv/FdrbAHVhJFEkhflIEfqG1jSClHW26mXrpRA4AMf+upDQNVttyyWbTdRLk+mtSQ0gkkyygE4dgwUgl5cUPWupcHpytcxFA4l9wTUNpu/cB8cDrsiEwiQZwDpBbIB5VPPN9Hhu28ayTfXeqQZDUoQlMWpWQx3Pi8i909sq/6dMcY4krOIQKoAHl+MRJrx83Ledzbdmh7d8fpIX/XJd0UM5oOx6j5vXpuiwieHjkS5Z02E1FMZu5bDgkKQKsXMRVW4g6/Hc4JoQgGpEs/eisxPymjnCH5aV40osgY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(22082099003)(18002099003)(261102123227099003)(56012099006)(261009223027099003)(5023799004)(4143699003)(11063799006)(261021123027099003)(261026135527099003)(261021135927099003)(261026140227099003)(261022113327099003)(261022115727099003)(261022075727099003)(261026121527099003)(261022105027099003)(261026130827099003)(261028144727099003)(261009221727099003)(261009220027099003)(261009223327099003)(261009221227099003)(261021121427099003)(261021133027099003)(261021130227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7s3XAwS6pEogBrgYlotDzYuY/xVRXMYDUi7kkaUS7Ev/1o74LkfQXNpsoC5n?=
 =?us-ascii?Q?CzCGQKH3behmQ07fqRHo4xA1C3zRfseSWs4esoK6hgcciq2yzWPw1trB+14i?=
 =?us-ascii?Q?nm6pRDijtKkiyuHKRBjPmUqxnVU+L3+WHOQiHT7YTuwYNunNPXi0b6gW4Dk0?=
 =?us-ascii?Q?HIjTEthhnqLxEbed7BcSJcY4wMtl4y9x2VGYjwEfJWAiKkYo9mK7onPUrOu9?=
 =?us-ascii?Q?aX3fBRtsaZE/Anhfj62rK+2qJoMVZb1+vGTHje+4VhbNDNG2NWTv6+6mQgZt?=
 =?us-ascii?Q?xfsK1ZPrgR7Wj3zfkbEIw151FGa9VsHnGW/EduBKnhDbGyS5ZqmQUtORHwP5?=
 =?us-ascii?Q?+HDLzl4c4FuENb1LAcW2Al/RSYdLdPjo+eFGtff/GrJINta6m+ajG/aTXcyN?=
 =?us-ascii?Q?XsKxKQXKmcJ2uXlsDRIoPNw/k98XlgkX6+jAeMxPi4nLGwlYUhJAIrYSoKFt?=
 =?us-ascii?Q?ubnZfIdY9um9V7DqDPyIZ+pxrambBv08uMjbn1CULwMdPhG9k7rkUID+cEOQ?=
 =?us-ascii?Q?wcGHACN1zHZQvSJFW3gp57mepwJ5/VZO/CvCdN5Gs3RX+rCfKhmdTZVdXjAy?=
 =?us-ascii?Q?CWGFdw6PIJQ3qzZ0LLYWXFxMNFmUMayFY97/j1z+uGJTytMEoCkwbTJMZexJ?=
 =?us-ascii?Q?baeBj0f8zTcJ8SjjLtsTbkkZPtk7wZ+SE/rkAHP8JdRZwXNcOk5c488BFDEB?=
 =?us-ascii?Q?9bwCRZ83OuAUk5kLM1ho3+bsfGM4PUIoglf32ThYd6kPLTmt8Iibyivsj0DA?=
 =?us-ascii?Q?DoZYfCa2punCW/mGvGS9ynvinZerieGdpctNsSVZ2uugdadHPYVH8ARrV1LY?=
 =?us-ascii?Q?Z2DTAaL49o8V/masQvRn7C2S3yIyKM48Bp0k0QowIWCrJFUMTiiAw845M+je?=
 =?us-ascii?Q?IMXK8hvIYn8I3FuiGC8TBvIuV1rjKqvgfZaIrwwQikP1nAxHzrdO4YKp2YAA?=
 =?us-ascii?Q?VOjvjFxWdPoDU5fEF7YatpuL5NuRU+kdkOaS3f2P/6KfJYVRTF5GhYvJ+0rG?=
 =?us-ascii?Q?Nka9mqtvmFtIlSmQ8oMdqQpoKQChxOFat0jf6FqgiVMS/648XN7VNOqamZC5?=
 =?us-ascii?Q?WDv5MLeWzRkjUlPEtp9F1N+A9WXiYNMEuPWXGEo0tZ07IN2QwGSn/vRsAjQ7?=
 =?us-ascii?Q?FlXbeb/xVruqUbLgi0z14B0n3Qdcf9YDq+gtH0GqUZSdyK4f92qKJC1WSoTF?=
 =?us-ascii?Q?jg8mFp85GyyoRyskSEk79Cn5hbTcDr0HNjI7NtFqdrYdzIBkq/EQPf42QYAB?=
 =?us-ascii?Q?On2F2g7G8CLqxB3WYJMwZetQTE8lXWz2DnAqrfdgsOQ6SrHipVDV/VcuWFTM?=
 =?us-ascii?Q?t8wW33giqhRGVrwbUAnACXNT/co7kwzsQSPDxs0lUiLmK/MKr9J6fAbaqamD?=
 =?us-ascii?Q?DHbPDRkMvIaStECmp0d2cMTkC6mpFQz0I5BKi1BPIc9tcgRTzunbz9JOW3WX?=
 =?us-ascii?Q?gg7fhxs90SKo0j82C8A3d7FAHwcoAIne+GIvGKWoZD4YuimnWBKoUPA+0AHq?=
 =?us-ascii?Q?ScTyAz/OaTxR2utQhrPs6aDzgiIfnD9mtUJd7lhNxtNrHZDzLhJqjfxTcRri?=
 =?us-ascii?Q?eys+IVBtw6RXXtvBypJ7e/3lBn1lo1Wto7nBX/N2LAlu5YWc6GyBAkobpIjF?=
 =?us-ascii?Q?B6c2hCuqtOIs4oZgzVW/+88VcAplMsk87iy8I9V17qiSNWvA2ofKxCg6Pxhr?=
 =?us-ascii?Q?oeNsr0PoqTkkkSMyTQKNwchrEtW2ZHlA7tCM6MIwJhDX1vJEyNPnZHj+tqgq?=
 =?us-ascii?Q?cFwuly72g22D7qxziyf6EJHF6i3t9gs=3D?=
X-Exchange-RoutingPolicyChecked: AH9u0TwIepvv0UPW2aiTtwwO5OpHBgOAAnlKJo0dqoUUnMOowD2TgYV0/iwIhmEI9Fut/LBVoeOJ2C2PMRzHmNsSKIqZ1Erl2p5VKIc6SV4rFNeyp4ZC52zIAwcRdGjwDsG45nAypAoRyO+VVWs4nPxd4CwN5vKHfn9GzsRCh2mOPWXwzkKTIckME+a3g6YQM0TF5/jSm1jCMad154/wPztquNf4uIVpJ8hhn+cTH/AuIlx+hucBLkVlDZ93yFfvBDcUvYV77ilPL09bvjaIrgfWqygLMWEsXZcV9fgTP0nSGv7YFplVq8aYvQOsf2131zF27/+8evGX3rY9MQvbDA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 323a444d-e8e4-457b-190c-08df38ff12a3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 16:33:49.3216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SHeEMeVQOAV6Zx1VnI4k3RwjFCUVkTwGP3iznzCN7BLAhnLQdVivCs8WL+WKI8ewOmYEy7obbBWZLsgrE0ADdSRstLs7liAsT+zxgiogzyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8891
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 31, 2026 at 09:50:31PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/eu_stall: Don't mark stream enabled if enable fails
> URL   : https://patchwork.freedesktop.org/series/177311/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96_FULL -> xe-pw-177311v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-177311v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-177311v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-177311v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pm_rpm@universal-planes-dpms:
>     - shard-bmg:          [PASS][1] -> [SKIP][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms.html
> 
>   * igt@kms_vblank@ts-continuation-modeset:
>     - shard-ptl:          [PASS][3] -> [FAIL][4] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-ptl-1/igt@kms_vblank@ts-continuation-modeset.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-ptl-8/igt@kms_vblank@ts-continuation-modeset.html

Neither of these display tests enables or uses EU stall sampling, so the
results here are unrelated to this patch.

Applied to drm-xe-next.  Thanks for the patch and review!


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-177311v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_3d@basic:
>     - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#6011])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@kms_3d@basic.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1466])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1407]) +2 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2327])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +7 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +2 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#367]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#367])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2652]) +7 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-9/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#2887]) +2 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#3432]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +5 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#9204] / [Intel XE#9205]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#9205]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html
> 
>   * igt@kms_chamelium_audio@dp-audio-edid:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2252]) +5 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-3/igt@kms_chamelium_audio@dp-audio-edid.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#306] / [Intel XE#7358]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#7358])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html
> 
>   * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
>     - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#373]) +2 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#9671])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html
> 
>   * igt@kms_chamelium_sharpness_filter@filter-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#6507] / [Intel XE#7358])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@kms_chamelium_sharpness_filter@filter-basic.html
> 
>   * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#6969]) +7 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-3/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4.html
> 
>   * igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][26] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +2 other tests fail
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-4/igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2390] / [Intel XE#6974])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-3/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#6974])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
> 
>   * igt@kms_content_protection@suspend-resume@pipe-a-dp-1:
>     - shard-bmg:          NOTRUN -> [FAIL][29] ([Intel XE#3304]) +1 other test fail
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-7/igt@kms_content_protection@suspend-resume@pipe-a-dp-1.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#7642]) +2 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x32:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2320]) +2 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-128x42:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1424]) +4 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-128x42.html
> 
>   * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#309] / [Intel XE#7343])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#323] / [Intel XE#6035])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst-direct-train:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#9534])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
> 
>   * igt@kms_dp_link_training@uhbr-mst:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#9533])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-3/igt@kms_dp_link_training@uhbr-mst.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#8265]) +1 other test skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@kms_dsc@dsc-with-bpc-formats-bigjoiner.html
> 
>   * igt@kms_dsc@dsc-with-formats-bigjoiner:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#8265]) +2 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@kms_dsc@dsc-with-formats-bigjoiner.html
> 
>   * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1421]) +2 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [PASS][40] -> [FAIL][41] ([Intel XE#301]) +2 other tests fail
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7178] / [Intel XE#7351])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#7179])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html
> 
>   * igt@kms_force_connector_basic@force-edid:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#352])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@kms_force_connector_basic@force-edid.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#656] / [Intel XE#7905]) +29 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2311]) +22 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#7905]) +25 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#4141]) +4 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#6312] / [Intel XE#651]) +5 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy:
>     - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#6312]) +8 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#7399])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2352] / [Intel XE#7399])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#7865]) +17 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-ptl:          NOTRUN -> [SKIP][58] ([Intel XE#5812])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-ptl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#7061]) +2 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#7061])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-suspend:
>     - shard-bmg:          [PASS][61] -> [INCOMPLETE][62] ([Intel XE#9259])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-10/igt@kms_frontbuffer_tracking@hdr-suspend.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-6/igt@kms_frontbuffer_tracking@hdr-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2313]) +24 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-ptl:          NOTRUN -> [SKIP][64] ([Intel XE#7865])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-ptl-3/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
>     - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#9312])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1503])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
>     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#7283])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
>     - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#7283]) +2 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#8303]) +1 other test skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-3/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html
> 
>   * igt@kms_plane_lowres@tiling-yf:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2393])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html
> 
>   * igt@kms_plane_multiple@2x-tiling-none:
>     - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#4596] / [Intel XE#5854]) +1 other test skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-none.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#5021] / [Intel XE#7377])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
>     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888:
>     - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#8396]) +1 other test skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888.html
> 
>   * igt@kms_pm_dc@dc5-dpms-negative:
>     - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1131])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@kms_pm_dc@dc5-dpms-negative.html
> 
>   * igt@kms_pm_dc@dc5-dpms-suspend-resume:
>     - shard-lnl:          [PASS][77] -> [FAIL][78] ([Intel XE#8399])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-lnl-5/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-5/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
> 
>   * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
>     - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#2893] / [Intel XE#7304]) +3 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#1489]) +2 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345]) +1 other test skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1406] / [Intel XE#7345]) +1 other test skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@kms_psr@pr-cursor-plane-onoff:
>     - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@kms_psr@pr-cursor-plane-onoff.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#3904] / [Intel XE#7342])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_vrr@cmrr-desktop-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#9271])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-3/igt@kms_vrr@cmrr-desktop-mode.html
> 
>   * igt@sriov_basic@pf-unbind-with-vf-probed:
>     - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#8866])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@sriov_basic@pf-unbind-with-vf-probed.html
> 
>   * igt@xe_evict@evict-threads-small-multi-vm:
>     - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#6540] / [Intel XE#688]) +6 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@xe_evict@evict-threads-small-multi-vm.html
> 
>   * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
>     - shard-bmg:          [PASS][89] -> [SKIP][90] ([Intel XE#8589]) +108 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-4/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
> 
>   * igt@xe_exec_balancer@once-parallel-userptr-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#7482]) +10 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@xe_exec_balancer@once-parallel-userptr-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-basic.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1392]) +2 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:
>     - shard-ptl:          NOTRUN -> [SKIP][94] ([Intel XE#5575] / [Intel XE#7484])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-ptl-3/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch:
>     - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#8374]) +8 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#8374]) +4 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html
> 
>   * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:
>     - shard-ptl:          NOTRUN -> [SKIP][97] ([Intel XE#8364])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-ptl-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html
> 
>   * igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem:
>     - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#8364]) +17 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem.html
> 
>   * igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#8364]) +11 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html
> 
>   * igt@xe_exec_reset@multi-queue-cancel:
>     - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#8369])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@xe_exec_reset@multi-queue-cancel.html
> 
>   * igt@xe_exec_reset@multi-queue-cancel-on-secondary:
>     - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#8369]) +1 other test skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-3/igt@xe_exec_reset@multi-queue-cancel-on-secondary.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma:
>     - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#6196])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-busy-nomemset:
>     - shard-ptl:          NOTRUN -> [INCOMPLETE][103] ([Intel XE#8222])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-ptl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-busy-nomemset.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-fd-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#8378]) +3 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-fd-basic.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#8378]) +6 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind.html
> 
>   * igt@xe_mempage_offline@inject-duplicate-page:
>     - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#9203])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@xe_mempage_offline@inject-duplicate-page.html
> 
>   * igt@xe_mmap@pci-membarrier-parallel:
>     - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#5100] / [Intel XE#7322] / [Intel XE#7408])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@xe_mmap@pci-membarrier-parallel.html
> 
>   * igt@xe_multigpu_svm@mgpu-xgpu-access-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#6964]) +2 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html
> 
>   * igt@xe_page_reclaim@prl-max-entries:
>     - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#7793]) +1 other test skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@xe_page_reclaim@prl-max-entries.html
>     - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#7793]) +1 other test skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-7/igt@xe_page_reclaim@prl-max-entries.html
> 
>   * igt@xe_pm@d3hot-i2c:
>     - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@xe_pm@d3hot-i2c.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-ptl:          [PASS][112] -> [DMESG-WARN][113] ([Intel XE#7727])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-ptl-5/igt@xe_pm@s4-basic.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-ptl-6/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-ptl:          [PASS][114] -> [ABORT][115] ([Intel XE#9362]) +1 other test abort
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-ptl-2/igt@xe_pm@s4-vm-bind-userptr.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-ptl-1/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze@gt0:
>     - shard-bmg:          [PASS][116] -> [FAIL][117] ([Intel XE#9254])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt0.html
> 
>   * igt@xe_pxp@pxp-optout:
>     - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#4733] / [Intel XE#7417])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@xe_pxp@pxp-optout.html
> 
>   * igt@xe_query@multigpu-query-config:
>     - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#944]) +2 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@xe_query@multigpu-query-config.html
> 
>   * igt@xe_query@multigpu-query-topology:
>     - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#944])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@xe_query@multigpu-query-topology.html
> 
>   * igt@xe_sriov_admin@sched-priority-vf-write-denied:
>     - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#7174])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@xe_sriov_admin@sched-priority-vf-write-denied.html
> 
>   * igt@xe_sriov_flr@flr-vf1-clear:
>     - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#3342])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-3/igt@xe_sriov_flr@flr-vf1-clear.html
> 
>   * igt@xe_vm@bind-array-enobufs:
>     - shard-bmg:          NOTRUN -> [FAIL][123] ([Intel XE#9424])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@xe_vm@bind-array-enobufs.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition:
>     - shard-bmg:          [FAIL][124] ([Intel XE#8098] / [Intel XE#9561]) -> [PASS][125]
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-7/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-5/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
>     - shard-bmg:          [SKIP][126] ([Intel XE#367]) -> [PASS][127]
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [INCOMPLETE][128] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][129] +1 other test pass
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_sequence@get-busy:
>     - shard-bmg:          [INCOMPLETE][130] -> [PASS][131] +1 other test pass
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-3/igt@kms_sequence@get-busy.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-3/igt@kms_sequence@get-busy.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-lnl:          [ABORT][132] ([Intel XE#9362]) -> [PASS][133] +2 other tests pass
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-lnl-3/igt@xe_pm@s4-vm-bind-userptr.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze@gt1:
>     - shard-bmg:          [FAIL][134] ([Intel XE#9254]) -> [PASS][135]
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt1.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt1.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
>     - shard-bmg:          [SKIP][136] ([Intel XE#2887]) -> [SKIP][137] ([Intel XE#8589]) +2 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601:
>     - shard-bmg:          [SKIP][138] ([Intel XE#7358]) -> [SKIP][139] ([Intel XE#8589]) +1 other test skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-bmg:          [SKIP][140] ([Intel XE#2252]) -> [SKIP][141] ([Intel XE#8589])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-bmg:          [FAIL][142] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][143] ([Intel XE#8589])
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-4/igt@kms_content_protection@srm.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-5/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x32:
>     - shard-bmg:          [SKIP][144] ([Intel XE#2320]) -> [SKIP][145] ([Intel XE#8589])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-4/igt@kms_cursor_crc@cursor-random-32x32.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-bmg:          [SKIP][146] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][147] ([Intel XE#8589]) +2 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
>     - shard-bmg:          [SKIP][148] ([Intel XE#2311]) -> [SKIP][149] ([Intel XE#8589]) +8 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:
>     - shard-bmg:          [SKIP][150] ([Intel XE#7061]) -> [SKIP][151] ([Intel XE#8589])
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-4/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
>     - shard-bmg:          [SKIP][152] ([Intel XE#4141]) -> [SKIP][153] ([Intel XE#8589])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
>     - shard-bmg:          [SKIP][154] ([Intel XE#2313]) -> [SKIP][155] ([Intel XE#8589]) +10 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render:
>     - shard-bmg:          [SKIP][156] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][157] ([Intel XE#8589])
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][158] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][159] ([Intel XE#3544])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
>     - shard-bmg:          [SKIP][160] ([Intel XE#7283]) -> [SKIP][161] ([Intel XE#8589]) +1 other test skip
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-4/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
>     - shard-bmg:          [SKIP][162] ([Intel XE#1489]) -> [SKIP][163] ([Intel XE#8589])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr@fbc-psr2-suspend:
>     - shard-bmg:          [SKIP][164] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][165] ([Intel XE#8589]) +1 other test skip
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-4/igt@kms_psr@fbc-psr2-suspend.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-5/igt@kms_psr@fbc-psr2-suspend.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [FAIL][166] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][167] ([Intel XE#2426] / [Intel XE#5848])
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][168] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][169] ([Intel XE#2426] / [Intel XE#5848])
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_exec_basic@multigpu-once-null-rebind:
>     - shard-bmg:          [SKIP][170] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][171] ([Intel XE#8589]) +1 other test skip
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-4/igt@xe_exec_basic@multigpu-once-null-rebind.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-multi-queue-imm:
>     - shard-bmg:          [SKIP][172] ([Intel XE#8374]) -> [SKIP][173] ([Intel XE#8589]) +2 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-4/igt@xe_exec_fault_mode@many-multi-queue-imm.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-imm.html
> 
>   * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-close-fd-smem:
>     - shard-bmg:          [SKIP][174] ([Intel XE#8364]) -> [SKIP][175] ([Intel XE#8589]) +5 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-close-fd-smem.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-close-fd-smem.html
> 
>   * igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:
>     - shard-bmg:          [SKIP][176] ([Intel XE#8369]) -> [SKIP][177] ([Intel XE#8589])
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-4/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-5/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html
> 
>   * igt@xe_exec_system_allocator@many-stride-new-prefetch:
>     - shard-bmg:          [INCOMPLETE][178] ([Intel XE#7098] / [Intel XE#8159]) -> [SKIP][179] ([Intel XE#8589])
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-4/igt@xe_exec_system_allocator@many-stride-new-prefetch.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-5/igt@xe_exec_system_allocator@many-stride-new-prefetch.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-userptr:
>     - shard-bmg:          [SKIP][180] ([Intel XE#8378]) -> [SKIP][181] ([Intel XE#8589])
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-userptr.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-userptr.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-bmg:          [SKIP][182] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7517]) -> [SKIP][183] ([Intel XE#8589])
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_pxp@display-pxp-fb:
>     - shard-bmg:          [SKIP][184] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][185] ([Intel XE#8589])
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-4/igt@xe_pxp@display-pxp-fb.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html
> 
>   * igt@xe_query@multigpu-query-invalid-cs-cycles:
>     - shard-bmg:          [SKIP][186] ([Intel XE#944]) -> [SKIP][187] ([Intel XE#8589])
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96/shard-bmg-4/igt@xe_query@multigpu-query-invalid-cs-cycles.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
>   [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
>   [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
>   [Intel XE#6011]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6011
>   [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
>   [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
>   [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
>   [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
>   [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
>   [Intel XE#7322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322
>   [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
>   [Intel XE#7329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329
>   [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
>   [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
>   [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
>   [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
>   [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
>   [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
>   [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
>   [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
>   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
>   [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
>   [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
>   [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
>   [Intel XE#7517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517
>   [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
>   [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
>   [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
>   [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
>   [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
>   [Intel XE#8098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8098
>   [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
>   [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
>   [Intel XE#8222]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8222
>   [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
>   [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
>   [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
>   [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
>   [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
>   [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
>   [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
>   [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
>   [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
>   [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
>   [Intel XE#8866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8866
>   [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
>   [Intel XE#9203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203
>   [Intel XE#9204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9204
>   [Intel XE#9205]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9205
>   [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
>   [Intel XE#9259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9259
>   [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
>   [Intel XE#9312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312
>   [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
>   [Intel XE#9424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9424
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#9533]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9533
>   [Intel XE#9534]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9534
>   [Intel XE#9561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9561
>   [Intel XE#9671]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9671
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96 -> xe-pw-177311v1
> 
>   IGT_9173: 9173
>   xe-6037-a3d3816838d5a0e122641b68b9c502cc5d016e96: a3d3816838d5a0e122641b68b9c502cc5d016e96
>   xe-pw-177311v1: 177311v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177311v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
