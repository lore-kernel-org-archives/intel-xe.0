Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FB3C77B75
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 04:40:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A13810E00C;
	Wed, 17 May 2023 04:40:08 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE9010E00C
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 04:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684298406; x=1715834406;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6unzO2Ha5GpIkGQf1KPOlFm4a6WtQrzeDNENe9G9Bgs=;
 b=lmW+TVgFhcBDo1dM0006iot/W+4Ouivasb4Zr5RrF7RMBza4jjmi6EsM
 RiCmd+IM1CvO9mv81uPcFo8bEVPF0g7iXa3a25AVnBEwTwMSsd88rECCY
 I6i3SNiIJlZJeqffen6G64pHfWl2rQk0EsW+EsefTuBFtoOemarR7zeKT
 zvILMPmreVkRKP8FzEPhcM6h+2jDlZ5X8GZ+rlmOXzsoh/wbB4CV7EFCC
 tPsN4VqX9sPc0GdXfVd9uSIRD4BSs6r2o1Ztq/TsRURq1hkWlKl/6NHOa
 rSYpIK5gSeq0secYeYy+fJm0IT6bLOLTHsWRGa06NjzksBV8rAmK0Asek w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="415070237"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="415070237"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 21:40:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="695723406"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="695723406"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 16 May 2023 21:40:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 21:40:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 21:40:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 21:40:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 21:40:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gk3ThazVNBl+R/BJqtupS6mo+rV68LZ3MEbtw0ZQHru2yM1POZbpL7PinI3vpvr81ndtOeChTh++DFK87T+iOvpHDmx0Ot7AEDmpBh01t0LD0x5uDTpMQY2jEdVNpiotY4PSUgC7zoykqIG66svlYnIuaXKnHvFJsw/BMBrj7kdeOwCMObxTsBK/UE9b4ELdKy4UJL1BLfFEHy24qPTeYJAPnV193ddF7TX8jX+vvwadKjJTW21Isw35OwtzRpG5SElShruUCkpeARjgQEHFpkUQ27lsxE50slk8KKjWzU0xOfTU6ZvVWI6Qe5vir+KYkLkouwUhkWVXZ4aQY2WDKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SI1XAmYs0VPm1YO6yivRkXO88y80C0SA8poyWWCdwcU=;
 b=ItSCsuBVY0i9oyRY4wAvgcNMytMym0nUoJCZ23AeK4LvArLMd2JSSRzwoW/J2ChZkk0S/PDLnsSwMizAeyvG1z/ysxAO3sdfgNc/8zm9WAQ4S1iNrtwJSAwWZDT6ZIVvZOrW5DKhgC7cjw1BUasbSTlk/+/buLv3Ta3Fwf4DVIuQ2AYeFYzK02o8ZSTSxL0aeeSbYamR+GZaEeGn3712yi5SeRsxBiGvxNFVr0fIdgx19wGw8uc0/t26aqlfqOzYz/H+dpv6QEAyFT/FmYOEDUb9DVTmoLgxN0VMtDr0AVchhFpjXfDzfrKDbufizGfo303ALySctMMxWK9SS7rELA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7447.namprd11.prod.outlook.com (2603:10b6:510:28b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Wed, 17 May
 2023 04:40:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 04:40:02 +0000
Date: Tue, 16 May 2023 21:39:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <ltcjuvjkpcvovl7xjo77sumx357puszov6i4yikvbhck43ovlo@tcl4btnkfnyj>
X-Patchwork-Hint: comment
References: <20230516221950.3512818-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230516221950.3512818-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0185.namprd05.prod.outlook.com
 (2603:10b6:a03:330::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: 532bfdb3-4682-43ae-1953-08db5690c76c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7qP/5MnQU8Y52Og16zt7w57Vxymj3N3dDGt8cfv+5G1MlSnKNTL98Hchfn2EWn+6yj1DKpoje1MHpwrcLWU3Wmb5ABON6Ctuj/m+zrKmhKPyK6/4Biik9p5XbxEvoyKJNMDH2NB5lmnX1KoeA9wfRzMOL87vLeDx8twWfinH0GbwW5c7SvR1vYhUM6/eEMbSPIJqyz3GWNi4vXKLpgIA8Jiqg6Wytn1WuC81lz7JyM1Ua5yymL0x7Rmzj/U1fz4R2wFTkht1SVisK6RUSMg5PwnfX42r/DM2f/Oc6x1s40s3+6UbM+mjes+Q6DtJ+Ut9vqYptDsf2y6sF4QEAaospXf3ypG5j8G/SJQSYjSIo+uX/T58/sEUulHNg7Ox8oKvt8YXj8jqQbXoVi8V75B1maRrR6VfFJ8uGXylFNtYyqTioIal5p4YC+tOjiUduk+VqXQVvETPM9fwBV2y1FbrLY0oM8livIEOtlebMZHbCs6NfSifNUUo5SLpM/ueRIJ/nMBuIp6+eUdYzw/bQwqMODNX7OP++XUbsgRCLxfIDJX3PU5vmEDcyMqLCognGEX9oLNeWrc4pxcnEEu2/HQeK/iCWEZ2s/EcK3JDi4jqWtY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(39860400002)(376002)(136003)(346002)(366004)(451199021)(8676002)(6666004)(478600001)(41300700001)(66946007)(66476007)(4326008)(82960400001)(6916009)(66556008)(316002)(8936002)(38100700002)(186003)(6506007)(107886003)(9686003)(6512007)(2906002)(26005)(83380400001)(33716001)(86362001)(5660300002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JixkMfbA8mDXjpclz1+RMxKWDr3uIXVLKQ0SPaCScJWdpIZaG4z8NjjyZilq?=
 =?us-ascii?Q?+tpZ6j/MUp51udzVHISZkjWbgFYre2UIEgrPbzRGvSKdJ6nGTd/XcNbCEoyw?=
 =?us-ascii?Q?IiRk3fcza46dWIJI3vxYxDUBmCiRWiAIGPOyZPxjzLKqOx2YIM++deICva2s?=
 =?us-ascii?Q?Hr+PM/hH3CpIqmYsV5bq5PTQeBeYSNkKXeFt/LQnJBdOObtNBh7HqT20MbQz?=
 =?us-ascii?Q?gwyLlc1Yo0Qk2nga4MuNbK4sqeDWFpQ5jTJnG3xuc+ki9JnoqckiwrIeFPyF?=
 =?us-ascii?Q?35MYgsHrrUqsVuA2PZYUSpiWDxahhdLrH2K4FtTyBWHIvOR8hdiC21ZD+t04?=
 =?us-ascii?Q?PF0F5i8720WbmFQ7eUEWUAZRYJiK+smX02pM6BMsN+JbWQt8/3lXgy8QEpVE?=
 =?us-ascii?Q?cRlamb25d3gl8T+FvW/w8BH0C506N4e9uJz1EbwOzFaRC62z4jV5G4Oi24Sa?=
 =?us-ascii?Q?YpoVeW7oSVYF+WGn1+xeOSiaFqDkB7GKhE5OPYXfP1J8u7f92qJM9IVLtRV8?=
 =?us-ascii?Q?arNjGBFie6aSunu1xHXvacCqqlkzmXTenbZBk6V4/p0q/00s4WKK/DpjyCI7?=
 =?us-ascii?Q?ya7cZLNiilGW/9Kka6VW0XM6HIbtHLhDRM0/GTZtKseT/XQhxOxKR6OjtgT1?=
 =?us-ascii?Q?+Zs/Jjp9eZAHX0glJNwQPnrrDhFfBUsV4I11xhmxWMYDv5QPUQuNwgeJl20i?=
 =?us-ascii?Q?bcHgI/ud1tugnwMO2nXx9QDG8h7NcRRpq9qmDFkLeJkpcaM7j4cfLP+NhnA0?=
 =?us-ascii?Q?/7R2NCR3BEKFZZoeIBCmtUfxm2QCSaNsg8qlEGrxig+SbXZj+T8HcFrg6Akv?=
 =?us-ascii?Q?K2e+Vy83n9kxXl6Ea/LReGbygNqr0FoUAoEvYMPMNz5y8bLpvC5sLRphUwcT?=
 =?us-ascii?Q?ZD9aDipyqYVxmV/MfU+bxp/jl8QPp6BW6bA9SisVTP88DcDN5a4ZcSMjf6wD?=
 =?us-ascii?Q?3SThvHCoxo47mg0v8eLtk6217GGXsNOgxy2W8RPJ3May9rkwJlIFlEdOXrfE?=
 =?us-ascii?Q?r79YSWbeLKdiApX1XnHFvxnWPBc6rkv8eOqzvW97npY0Bl4/8mKDPl0WWkpj?=
 =?us-ascii?Q?JLW4M447ct3cvte8+4pSxSgATYlbubuftg7a23eetfEckZ2rb4Cszoxwy0Bd?=
 =?us-ascii?Q?pqWKjPLmy2GWYmBXMHZtECQ5RtqrJa4gn09KduFPkvqW+/QnSdiWHMmQUy7F?=
 =?us-ascii?Q?tAp+RUYOUioSWXPwoTs2XkEx5UIp8VU5tY7Fh4j2v4PyE4rzx4ZGQa+x4Gjd?=
 =?us-ascii?Q?/pRom2EtXkliMHyOA78k23KHLJALJ2zaDr8O2bPMFnItDv8SRw3eQr/rIyUC?=
 =?us-ascii?Q?51jxuyeljdojMrLecn1C62iANreFICbMO9gUyAAzFpY0QYZ/1IU+0TOw2O9n?=
 =?us-ascii?Q?AMynJKlnTBtLhTxssXsE5EWFS4lMREddPY/YBv53iPWg5IG/z9h6yLEJnlMp?=
 =?us-ascii?Q?wiT502LjYbT83tkszSWzke9+251KO5aHtSv60oHTYd840atO6xNB6kFQ9nbg?=
 =?us-ascii?Q?7Y+JA8bnD61rfwD23nYDYI3FpwjdpygHUp4H3b9JbWzKGvnGbtfHshzdO17i?=
 =?us-ascii?Q?AvbSdeVJMOxkiMSg9aknpLRXRJObOXeCt5B3l+KsQlrpzhIJPre8mKmFfI5K?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 532bfdb3-4682-43ae-1953-08db5690c76c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 04:40:02.6512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJTlhJJyYHPCSXSG2tlPQG1/aAhp0GcieUKrN13iNhwh2UxPc6MdQNdWkwX9B6sEDi18Mdp45j3K3tCS6TB9Q0m4AYAnaefhq9In3LpnKLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7447
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 0/9] Dump + OOB workarounds
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 16, 2023 at 03:19:41PM -0700, Lucas De Marchi wrote:
>Third version adding OOB workarounds, third different approach.
>Gone is the special ELF section and now it's implemented by
>creating a new RTP struct that holds tables containing only rules,
>without the actions interacting with reg-save-restore.
>
>Now a common approach between all types of workarounds is used for
>marking the "active" workarounds. These are the ones in play for the
>running system.  They can be queried over debugfs and for the OOB,
>are checked throughout the code. Last patch converts xe_guc.c to the
>new infra.
>
>In order to be able to implement the simpler XE_WA() requested in
>previous versions, and at the same time avoiding error-prone updates
>in different places of the code, a simple program was written to
>generate xe_wa_oob.c and xe_wa_oob.h. The syntax is kept very simple
>on purpose, with the following goals:
>
>	1) Be similar to the rest of the workarounds. The codegen
>	   just paste together the info in the .rules file
>	   and updated header/source with the appropriate values
>	2) Doesn't increase the build dependencies of the kernel,
>	   so it's implemented in C and built as a hostprog.
>
>Tested on a single DG2 system.

For the Hooks build failure, it seems we are missing a include in the
build system that doesn't get automatically added when passing
M=3Ddrivers/gpu/drm/xe/

word diff with and without:

gcc -Wp,-MMD,drivers/gpu/drm/xe/.xe_wa.o.d -nostdinc -I../arch/x86/include =
-I./arch/x86/include/generated -I../include -I./include -I../arch/x86/inclu=
de/uapi -I./arch/x86/include/generated/uapi -I../include/uapi -I./include/g=
enerated/uapi -include ../include/linux/compiler-version.h -include ../incl=
ude/linux/kconfig.h -include ../include/linux/compiler_types.h -D__KERNEL__=
 -fmacro-prefix-map=3D../=3D -Wall -Wundef -Werror=3Dstrict-prototypes -Wno=
-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=
=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-ty=
pe -Wno-format-security -funsigned-char -std=3Dgnu11 -mno-sse -mno-mmx -mno=
-sse2 -mno-3dnow -mno-avx -fcf-protection=3Dbranch -fno-jump-tables -m64 -f=
align-jumps=3D1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferred=
-stack-boundary=3D3 -mskip-rax-setup -mtune=3Dgeneric -mno-red-zone -mcmode=
l=3Dkernel -Wno-sign-compare -fno-asynchronous-unwind-tables -mindirect-bra=
nch=3Dthunk-extern -mindirect-branch-register -mindirect-branch-cs-prefix -=
mfunction-return=3Dthunk-extern -fno-jump-tables -fpatchable-function-entry=
=3D16,16 -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-tru=
ncation -Wno-format-overflow -Wno-address-of-packed-member -O2 -fno-allow-s=
tore-data-races -Wframe-larger-than=3D2048 -fstack-protector-strong -Wno-ma=
in -Wno-unused-but-set-variable -Wno-unused-const-variable -Wno-dangling-po=
inter -ftrivial-auto-var-init=3Dzero -fno-stack-clash-protection -pg -mreco=
rd-mcount -mfentry -DCC_USING_FENTRY -falign-functions=3D16 -Wdeclaration-a=
fter-statement -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-stringop-t=
runcation -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -Wn=
o-array-bounds -Wno-alloc-size-larger-than -Wimplicit-fallthrough=3D5 -fno-=
strict-overflow -fno-stack-check -fconserve-stack -Werror=3Ddate-time -Werr=
or=3Dincompatible-pointer-types -Werror=3Ddesignated-init -Wno-packed-not-a=
ligned -g -fno-var-tracking -femit-struct-debug-baseonly -Wall -Wextra -Wno=
-unused-parameter -Wno-type-limits -Wno-missing-field-initializers -Wno-unu=
sed-but-set-variable -Wno-sign-compare -Wno-frame-address -Werror -I../driv=
ers/gpu/drm/xe -I../drivers/gpu/drm/xe/display/ext -I../drivers/gpu/drm/xe/=
compat-i915-headers -I../drivers/gpu/drm/xe/display/ -I../drivers/gpu/drm/i=
915/display/ -Ddrm_i915_gem_object=3Dxe_bo -Ddrm_i915_private=3Dxe_device  =
 -fsanitize=3Dkernel-address -fasan-shadow-offset=3D0xdffffc0000000000   --=
param asan-globals=3D1   --param asan-instrumentation-with-call-threshold=
=3D0   --param asan-instrument-allocas=3D1   --param asan-stack=3D1   {+-I =
../drivers/gpu/drm/xe -I ./drivers/gpu/drm/xe+}  -DMODULE  -DKBUILD_BASENAM=
E=3D'"xe_wa"' -DKBUILD_MODNAME=3D'"xe"' -D__KBUILD_MODNAME=3Dkmod_xe -c -o =
drivers/gpu/drm/xe/xe_wa.o ../drivers/gpu/drm/xe/xe_wa.c

And with this additional diff it solves it for me:

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 07af0d022263..5e89f26fc46b 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -24,7 +24,7 @@ subdir-ccflags-y +=3D $(call cc-disable-warning, initiali=
zer-overrides)
  subdir-ccflags-y +=3D $(call cc-disable-warning, frame-address)
  subdir-ccflags-$(CONFIG_DRM_XE_WERROR) +=3D -Werror
 =20
-subdir-ccflags-y +=3D -I$(srctree)/$(src)
+subdir-ccflags-y +=3D -I$(srctree)/$(src) -I$(src)
 =20
  # generated sources
  hostprogs :=3D xe_gen_wa_oob
